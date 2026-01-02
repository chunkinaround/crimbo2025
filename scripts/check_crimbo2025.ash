//This is just for me to have a list of items

boolean[item] Crimbo2025 = $items[
    burnt incisor,
burnt phalange,
burnt radius,
burnt rib,
burnt skull,
Crymbocurrency,
extra-thick Crimbo sweater,
The Encyclopedia of Holiday Funerary Rites,
Steve Abrams' Holiday Sampler Beer,
crate of prize-winning rum,
bottle of prize-winning rum,


boiling bone marrow,
boiling cerebrospinal fluid,
boiling synovial fluid,
smoldering vertebra,


smoldering bone dust,
volatile bone bomb,
hot boning knife,
flaming fistbone,
burnt bone belt,
scorched skull trophy,
wing bone,
weak skeleton venom,
baked bone meal,
tiny plastic skeleton rib cage,
tiny plastic skeleton skull,
tiny plastic skeleton Crimbo hat,


undertakers' forceps,
bone-polishing rag,
scorched skeleton mask,
scorched skeleton shirt,
scorched skeleton pants,
messenger parrot egg,
buryable chest,
Shanty: Let's Beat Up This Drunken Sailor,
Shanty: Let's Beat Up This Drunken Sailor (used),
Shanty: I'm Smarter Than a Drunken Sailor,
Shanty: I'm Smarter Than a Drunken Sailor (used),
Shanty: Look At That Drunken Sailor Dance,
Shanty: Look At That Drunken Sailor Dance (used),
Shanty: Who's Going to Pay This Drunken Sailor?,
Shanty: Who's Going to Pay This Drunken Sailor? (used),
Shanty: Only Dogs Love a Drunken Sailor,
Shanty: Only Dogs Love Drunken Sailors (used),
Crymbocurrency tattoo,
fireproof bonesaw,
vermiculite shield,
cursed ship's lantern,
heat-resistant harpoon pistol,
traditional gingerloaf,
Scotch and eggnog,
counterskeleton elixir,
&quot;salvaged&quot; wine,
The Encyclopedia of Holiday Funerary Rites (used),
crate of prize-winning cheese,
wedge of prize-winning cheese,
gummi fingerbone

];

//Crymbocurrency

//Coinmaster shit
boolean[item] CoinmasterItems = $items[

messenger parrot egg,
buryable chest,
scorched skeleton mask,
scorched skeleton shirt,
scorched skeleton pants,
&quot;salvaged&quot; wine,
Crymbocurrency tattoo,


Shanty: Let's Beat Up This Drunken Sailor,
Shanty: I'm Smarter Than a Drunken Sailor,
Shanty: Look At That Drunken Sailor Dance,
Shanty: Who's Going to Pay This Drunken Sailor?,
Shanty: Only Dogs Love a Drunken Sailor,

counterskeleton elixir,
fireproof bonesaw,
vermiculite shield,
cursed ship's lantern,
heat-resistant harpoon pistol,
undertakers' forceps,
bone-polishing rag,
volatile bone bomb,

tiny plastic skeleton rib cage,
tiny plastic skeleton skull,
tiny plastic skeleton Crimbo hat

];


boolean[location] CrimboMonLoc = $locations[
Smoldering Bone Spikes,
Smoldering Fingerbones,
A Smoldering Pelvis,
A Smoldering Ribcage
];



boolean[item] TrophyItems = $items[

burnt incisor,
burnt phalange,
burnt radius,
burnt rib,
burnt skull

];


int get_CrymbocurrencyCost(item cost){
switch (cost) {
    default:
    return 0;

case $item[messenger parrot egg]:return 200;
case $item[buryable chest]:return 300;
case $item[scorched skeleton mask]:return 1000;
case $item[scorched skeleton shirt]:return 1000;
case $item[scorched skeleton pants]:return 1000;
case $item[&quot;salvaged&quot; wine]:return 3000;
case $item[Crymbocurrency tattoo]:return 10000;


case $item[Shanty: Let's Beat Up This Drunken Sailor]:return 5000;
case $item[Shanty: I'm Smarter Than a Drunken Sailor]:return 5000;
case $item[Shanty: Look At That Drunken Sailor Dance]:return 5000;
case $item[Shanty: Who's Going to Pay This Drunken Sailor?]:return 5000;
case $item[Shanty: Only Dogs Love a Drunken Sailor]:return 5000;

case $item[counterskeleton elixir]:return 10;
case $item[fireproof bonesaw]:return 50;
case $item[vermiculite shield]:return 50;
case $item[cursed ship's lantern]:return 50;
case $item[heat-resistant harpoon pistol]:return 50;
case $item[undertakers' forceps]:return 1500;
case $item[bone-polishing rag]:return 4000;

case $item[tiny plastic skeleton rib cage]:return 1500;
case $item[tiny plastic skeleton skull]:return 1500;
case $item[tiny plastic skeleton Crimbo hat]:return 1500;

}
}

int get_TurnInValue(item crym){
switch (crym) {
    default:
    return 0;

case $item[burnt incisor]:return 1;
case $item[burnt phalange]:return 5;
case $item[burnt radius]:return 10;
case $item[burnt rib]:return 20;
case $item[burnt skull]:return 50;
}
}


boolean[item] TammyItems = $items[
extra-thick Crimbo sweater,
The Encyclopedia of Holiday Funerary Rites,
The Encyclopedia of Holiday Funerary Rites (used),
Steve Abrams' Holiday Sampler Beer
];

boolean[skill] Crimbo25Skills = $skills[
Holiday Burial Knowledge,
Let's Beat Up This Drunken Sailor,
I'm Smarter Than a Drunken Sailor,
Look At That Drunken Sailor Dance,
Who's Going to Pay This Drunken Sailor?,
Only Dogs Love a Drunken Sailor
];



boolean[item] LeaderboardItems = $items[

crate of prize-winning rum,
bottle of prize-winning rum,
crate of prize-winning cheese,
wedge of prize-winning cheese,
scorched skull trophy
];

void main() {
    print("Drops by monster");
    Foreach crimboLoc in CrimboMonLoc {


        #gets a list of all monster drops from the location set that start with the letter and are pizzable
        #also appends all drops to a buffer for use in the crafting section later
        monster [int] monster_list = get_monsters(crimboLoc);
        foreach mon in monster_list {
            float[item] drops = item_drops(monster_list[mon]);
            print(monster_list[mon] + " in " + crimboLoc);
            foreach i in drops {
                if (TrophyItems contains i ){
                    continue;
                }
                int totalAmt = (available_amount(i) + display_amount(i));
                string MonsterDropString = "You have "+ totalAmt + " "+i+". ("+display_amount(i)+" in DC)";

                if ( totalAmt > 0 ) {
                    print(MonsterDropString,"green");
                } else {
                    print(MonsterDropString,"red");
                }
            }
            print("");
        }
    }

    print("--------------------------------------------------------------","blue");

    print(" Items Purchasable from the HMS Bounty");

    Foreach CoinmasterItem in CoinmasterItems{

        int totalCoinMasterAmount = (available_amount(CoinmasterItem) + display_amount(CoinmasterItem));
        string CoinMessage = CoinmasterItem + " have: "+ totalCoinMasterAmount +" ("+display_amount(CoinmasterItem)+" in DC).";
        string CoinMessage2 = "";
        if (CoinmasterItem != $item[volatile bone bomb] ) {
            CoinMessage2 = "____Mall:"+to_string(mall_price(CoinmasterItem),"%,d")+" Cost:"+to_string(get_CrymbocurrencyCost(CoinmasterItem),"%,d")+ " Implied Rt: "+to_string((mall_price(CoinmasterItem)/get_CrymbocurrencyCost(CoinmasterItem)),"%,d")+ " meat/ccy";
        }
        if ( totalCoinMasterAmount > 0 ) {
            print(CoinMessage,"green");
            print(CoinMessage2,"green");
            #print(CoinmasterItem + " have: "+available_amount(CoinmasterItem)+" | Mall:"+mall_price(CoinmasterItem)+" CC:"+get_CrymbocurrencyCost(CoinmasterItem)+ " Implied Rt: "+(mall_price(CoinmasterItem)/get_CrymbocurrencyCost(CoinmasterItem)),"green");
            #print(mall_price(CoinmasterItem),"green");
            #print(get_CrymbocurrencyCost(CoinmasterItem));
            #print( (mall_price(CoinmasterItem)/get_CrymbocurrencyCost(CoinmasterItem)));
        } else {
            print(CoinMessage,"red");
            print(CoinMessage2,"red");
            #print(CoinmasterItem,"red");
            #print(mall_price(CoinmasterItem));
            #print(get_CrymbocurrencyCost(CoinmasterItem));
        }
    }



    print("--------------------------------------------------------------","blue");
    print(" Items you can turn in for CCY");
    int PotentialCrymbocurrency =0;

    Foreach TrophyItem in TrophyItems{
        int totalTrophyItemAmount = (available_amount(TrophyItem) + display_amount(TrophyItem));
        string TrophyMessage = TrophyItem + " have:"+totalTrophyItemAmount+" ("+display_amount(TrophyItem)+" in DC)";
        PotentialCrymbocurrency += (totalTrophyItemAmount*get_TurnInValue(TrophyItem));
        if ( totalTrophyItemAmount > 0 ){
            print(TrophyMessage,"green");
        } else {
            print(TrophyMessage,"red");

        }

    }
    print("Potential Crymbocurrency:" + PotentialCrymbocurrency);
    print("--------------------------------------------------------------","blue");

    print("Items recieved from Tammy");

    Foreach TammyItem in TammyItems {
        int totalTammyItemAmount = ( available_amount(TammyItem) + display_amount(TammyItem) );
        string TammyMessage = TammyItem + " have: "+totalTammyItemAmount+" ("+display_amount(TammyItem)+" in DC)";
        if ( totalTammyItemAmount > 0) {
            print(TammyMessage,"green");
        } else {
            print("You are missing "+TammyItem+" go talk to Tammy!","red");
        }

    }

    print("--------------------------------------------------------------","blue");

    print("Leaderboard Items");


    Foreach LeaderboardItem in LeaderboardItems {
        int totalLeaderboardItemAmount = ( available_amount(LeaderboardItem) + display_amount(LeaderboardItem) );
        string leaderboardString  = LeaderboardItem+" have:" + totalLeaderboardItemAmount+" ("+display_amount(LeaderboardItem)+" in DC)";
        if ( totalLeaderboardItemAmount > 0 ) {
            print(leaderboardString,"green");
        } else {
            print(leaderboardString,"red");
        }

    }


    print("--------------------------------------------------------------","blue");

    print("Skills");


    Foreach CrimboSkill in Crimbo25Skills{

        if (have_skill(CrimboSkill)) {
            print(CrimboSkill,"green");
        } else {
            foreach i in $items[]{
                if (i.skill == CrimboSkill) {
                    print(i+" grants "+CrimboSkill + " avail:"+available_amount(i),"red");
                }
            }
        }
    }


}
