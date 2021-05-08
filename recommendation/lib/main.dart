import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recommendation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class DataSearch extends SearchDelegate<String> {
  final all = [
    'neerja',
    'udta punjab',
    'kabhi khushi kabhie gham...',
    'kal ho naa ho',
    'parched',
    'anand',
    'pk',
    'lagaan: once upon a time in india',
    'my name is khan',
    'lust, caution',
    'msg the warrior: lion heart',
    'fan',
    'airlift',
    'close encounters of the third kind',
    '3 idiots',
    'm.s. dhoni: the untold story',
    'slumdog millionaire',
    'life of pi',
    'lion',
    'pink',
    'madaari',
    'swades',
    'dil chahta hai',
    'a wednesday',
    'talvar',
    'after the wedding',
    'rockstar',
    'barfi!',
    'zindagi na milegi dobara',
    'the namesake',
    'taare zameen par',
    'anbe sivam',
    'andaz apna apna',
    'rang de basanti',
    'drishyam',
    'masaan',
    'the lunchbox',
    'chungking express',
    'devdas',
    'kapoor & sons',
    'gangs of wasseypur',
    'rainbow',
    'tanu weds manu returns',
    'jodhaa akbar',
    'ugly',
    'veer-zaara',
    'hera pheri',
    'sholay',
    'dilwale dulhania le jayenge',
    'saala khadoos',
    'jab we met',
    'haider',
    'piku',
    'black',
    'kahaani',
    'water',
    'black friday',
    'nayakan',
    'kuch kuch hota hai',
    'bajrangi bhaijaan',
    'bhaag milkha bhaag',
    'munna bhai m.b.b.s.',
    'guru',
    'shahid',
    'detective byomkesh bakshy!',
    'queen',
    'laal rang',
    'baby',
    'dev.d',
    'jo jeeta wohi sikandar',
    'rock on!!',
    'chak de! india',
    'delhi belly',
    'omkara',
    'satya',
    'hey ram',
    'khosla ka ghosla!',
    'udaan',
    'gulaal',
    'maqbool',
    'salaam bombay!',
    'jaane tu... ya jaane na',
    'badlapur',
    'wake up sid',
    'kai po che!',
    'msg 2 the messenger',
    'gol maal',
    'sarkar',
    'eega',
    'guzaarish',
    'lage raho munna bhai',
    'paan singh tomar',
    'vicky donor',
    'highway',
    'vishwaroopam',
    'the legend of bhagat singh',
    'budhia singh: born to run',
    'omg: oh my god!',
    'ankhon dekhi',
    'aligarh',
    'company',
    'jaane bhi do yaaro',
    'english vinglish',
    'days of tafree',
    'amal',
    'pyaar ka punchnama 2',
    'chupke chupke',
    'khakee',
    'hum dil de chuke sanam',
    'rocket singh: salesman of the year',
    'oye lucky! lucky oye!',
    'hum aapke hain koun...!',
    'lakshya',
    'raanjhanaa',
    'dum laga ke haisha',
    'special 26',
    'madras cafe',
    'johnny gaddaar',
    'samsara',
    'tum bin...: love will find a way',
    'baazigar',
    'earth',
    'aankhen',
    'darr',
    'ship of theseus',
    'manjhi: the mountain man',
    'kaminey',
    'sarfarosh',
    'dil se..',
    'nil battey sannata',
    'yuva',
    'mumbai meri jaan',
    'maine pyar kiya',
    'anniyan',
    'paanch',
    'manorama six feet under',
    'titli',
    'kabhi haan kabhi naa',
    'mr. india',
    'rahasya',
    'kammatti paadam',
    'shatranj ke khilari',
    'hazaaron khwaishein aisi',
    'ab tak chhappan',
    'thuppakki',
    'agneepath',
    'pyaar ka punchnama',
    'the endless wait',
    'belaseshe',
    '89',
    'monpura',
    'chotushkone',
    'bojhena shey bojhena',
    'dark chocolate',
    'bhooter bhabishyat',
    'television',
    'dulaara',
    'dulhan chahi pakistan se',
    'patna se pakistan',
    'matrubhoomi: a nation without women',
    'nirahua hindustani',
    'baghban',
    'haasil',
    'bol',
    'in the name of god',
    'mor mann ke bharam',
    'mor chhainha bhuinya',
    'jaatishwar',
    'chhello divas',
    'thai jashe!',
    'court',
    'bey yaar',
    'kevi rite jaish',
    'stanley ka dabba',
    'gujjubhai the great',
    'tuu to gayo',
    'wrong side raju',
    'parzania',
    'bas ek chance',
    'romance complicated',
    'salangai oli',
    'koshish',
    'the victim',
    'enemy?',
    'nachom-ia kumpasar',
    'bukunja tekunja mitti: the cannibals',
    'maheshinte prathikaaram',
    'mumbai police',
    'spadikam',
    '7 letters',
    'kochavva paulo ayyappa coelho',
    'su su sudhi vathmeekam',
    'aaram thamburan',
    'ustad hotel',
    'devasuram',
    'magadheera',
    'chithram',
    'charlie',
    'bangalore days',
    'oppam',
    'manamantha',
    'guppy',
    'janatha garage',
    'premam',
    'pulimurugan',
    'aanandam',
    'mee shivajiraje bhosale boltoy',
    'thanks maa',
    'ekk albela',
    'coffee ani barach kahi',
    'shala',
    'ardh satya',
    'yz',
    'natarang',
    'chillar party',
    'fandry',
    'roja',
    'natsamrat',
    'killa',
    'sairat',
    'raiders of the lost ark',
    'mask of desire',
    'zhigrana',
    'mokshya',
    'november rain',
    'acharya',
    'lukamari',
    'kabaddi',
    'muna madan',
    'kabaddi kabaddi',
    'talakjung vs tulke',
    'pashupati prasad',
    'the black hen',
    'loot',
    'highway to dhampus',
    'yodha',
    'white sun',
    'partu',
    'border',
    'i am kalam',
    'vaaranam aayiram',
    'mankatha',
    'visaaranai',
    'aandavan kattalai',
    'velaiyilla pattathari',
    'kaakkaa muttai',
    'thani oruvan',
    'kuttrame thandanai',
    'ghajini',
    'joker',
    'in a small world',
    'i',
    '24',
    'baahubali: the beginning',
    '1 - nenokkadine',
    'nannaku prematho',
    'krishna gaadi veera prema gaadha',
    'athadu',
    'srimanthudu',
    'abhinetri',
    'kuruthipunal',
    'oopiri',
    'asura',
    'ism',
    'batman begins',
    'actor in law',
    'waar',
    'ho mann jahaan',
    'maalik',
    'bin roye',
    'janaan',
    'the kite runner',
    'eastern promises',
    'iron man',
    'hkhagoroloi bohu door',
    'bakor putek',
    'bandit queen',
    'road to sangam',
    'dasvidaniya',
    'iqbal',
    'maachis',
    'kajarya',
    'rangeela',
    'shool',
    'rehnaa hai terre dil mein',
    'don',
    'nayak: the real hero',
    'utopia',
    'kaun?',
    'sivaji',
    'angoor',
    'train station',
    'do chehre',
    'ishq ke parindey',
    'kabhie kabhie',
    'vaastav: the reality',
    'qayamat se qayamat tak',
    'amar prem',
    'virasat',
    'lakeer ka fakeer',
    'c.i.d.',
    'kya dilli kya lahore',
    'sehar',
    'hungama',
    'ijaazat',
    'amar akbar anthony',
    'chhoti si baat',
    'bombay',
    'abhimaan',
    'aamir',
    '...yahaan',
    'bawarchi',
    'kala pani',
    'mera naam joker',
    'hawaa hawaai',
    'the message',
    'punjab 1984',
    'autohead',
    'madhumati',
    'hindustani',
    'raincoat',
    'half ticket',
    'makdee',
    'socha na tha',
    'mirch masala',
    'sadma',
    'anari',
    'mehboob ki mehndi',
    'saaransh',
    'zubaan',
    'aandhi',
    'naya daur',
    'phas gaye re obama',
    'phir se...',
    'rakhta charitra',
    'chaar sahibzaade',
    'muthu',
    'woh kaun thi?',
    'naram garam',
    'bheja fry',
    'chandni bar',
    'do dooni chaar',
    'anjali',
    'baasha',
    'khaleja',
    'dr. babasaheb ambedkar',
    'khamosh',
    'khatta meetha',
    'chashme buddoor',
    'haqeeqat',
    'raakh',
    'chand ke paar chalo',
    'gour hari dastaan: the freedom file',
    'chalti ka naam gaadi',
    'parinda',
    'simhadri',
    'kota junction',
    'khubsoorat',
    'pinjar',
    'ek hasina thi',
    'tiger',
    'zakhm',
    '3 deewarein',
    'rough book',
    'chori chori',
    'damini',
    'kerala varma pazhassi raja',
    'lakshmi',
    'mera saaya',
    'shakti',
    'aaj',
    'chitchor',
    'dor',
    'satyakam',
    'sardar',
    'mandi',
    'holi',
    'mausam',
    'baton baton mein',
    'peepli (live)',
    'masoom',
    'ramchand pakistani',
    'kerry on kutton',
    'ghayal',
    'junoon',
    'naam',
    'sparsh',
    'chameli ki shaadi',
    'upkar',
    'doli',
    'padosan',
    'project marathwada',
    'the blue umbrella',
    'zanjeer',
    'griha pravesh',
    'dil toh deewana hai',
    'do bigha zamin',
    '36 chowringhee lane',
    'duniya',
    'bhumika',
    'droh kaal',
    'katha',
    'chatrapathi',
    'prem geet',
    'hum hain rahi pyar ke',
    'gandhinagar 2nd street',
    'kalyug',
    'khoya',
    'muqaddar ka sikandar',
    'mr. and mrs. iyer',
    'y.m.i. yeh mera india',
    'ankush',
    'kamla ki maut',
    'parichay',
    "night's end",
    'dharm',
    'mili',
    'kanoon',
    'prahaar: the final attack',
    'hai apna dil toh awara',
    'rajnigandha',
    'lekin...',
    'mrityudand: the death sentence',
    'noukadubi',
    'once upon a time in bihar',
    'gaman',
    'mere apne',
    'anupama',
    'peechha karro',
    'ek duuje ke liye',
    'samadhi',
    'dard ka rishta',
    'shortcut safari',
    'swayamvar',
    'dev bhoomi',
    'station',
    'khamoshi: the musical',
    'umbartha',
    'ninne pelladatha',
    'namkeen',
    'tu hai mera sunday',
    'ramana',
    'anuraag',
    'yaad rakhegi duniya',
    'baseraa',
    'phoring',
    'mohan joshi hazir ho!',
    'babu',
    'sons of ram',
    'dil ek mandir',
    'karz',
    'my brother... nikhil',
    'hotel salvation',
    'geet gaata chal',
    'pratibandh',
    'karamati coat',
    'aag',
    'palkon ki chhaon mein',
    'black home',
    'trishul',
    'baazi',
    'imtihan',
    'vaishali',
    'uphaar',
    'mamta',
    'ankahee',
    'kaala patthar',
    'abhiyum naanum',
    'moods of crime',
    'vishwaroop',
    'maryada',
    'vivekananda',
    'shaukeen kaminay',
    'sharafat',
    '1971',
    'woh 7 din',
    'andaz',
    'neecha nagar',
    'walkaway',
    'chehere: a modern day classic',
    'trishagni',
    'shaheed',
    'marhi da deeva',
    'maya bazaar',
    'pavitra paapi',
    'gharana',
    'aakhri khat',
    'chapekar brothers',
    'dulhan wahi jo piya man bhaaye',
    'mumbai love',
    'apradhi kaun?',
    'dastaan',
    'anarkali',
    'little terrors',
    'deedar',
    'aghaat',
    'second marriage dot com',
    'anubhav',
    'halo',
    'solva saal',
    'basant bahar',
    'vakil babu',
    'vishwavijay',
    'swami ayyappan',
    'naseem',
    'shatru',
    'mehrban',
    'seema',
    'patala bhairavi',
    'phagun',
    "mohan rakesh's adhe adhure",
    'baarish',
    'woh main nahin',
    'pagdi: the honour',
    'the spirit of mumbai',
    'baharon ke sapne',
    'bajrangbali',
    'the churning',
    'kanyadaan',
    'dubai return',
    'teesri kasam',
    'scorching winds',
    'khamoshi',
    'damul',
    'jagte raho',
    'aakrosh',
    'dil deke dekho',
    'shirin farhad',
    'geet',
    'ankur: the seedling',
    'mohalla assi',
    'do ankhen barah haath',
    'ek doctor ki maut',
    'sahib bibi aur ghulam',
    'waaris',
    'khargosh',
    'devdas',
    'teesri manzil',
    'arth',
    'gangaajal',
    'yeh saali zindagi',
    'ghar dwaar',
    'deewaar',
    'haraamkhor',
    'manokaamnaa',
    'dhanwan',
    '27 down',
    'aarti',
    'gangoobai',
    'sawan ko aane do',
    'pratisaad: the response',
    'oraalppokkam',
    'mahal',
    'tapasya',
    'triyacharitra',
    'massey sahib',
    'maya',
    'zara si zindagi',
    'manasarovar',
    'suraag',
    'rikki-tikki-tavi',
    'kismet',
    'chhaya',
    'pyaar ki jeet',
    'patita',
    'zindagi',
    'bloody isshq',
    'lagna pahave karun',
    'pooja ke phool',
    'sri shirdi saibaba mahathyam',
    'attahaasa',
    'padatik',
    'shiva',
    'mahananda',
    'shackle',
    'myoho',
    'hum tum dushman dushman',
    'haggada kone: end of the rope',
    'ek ghar',
    'adhikar',
    'servus ishq',
    'suddha',
    'debshishu',
    'sarivar sari',
    'bidyapati',
    'pyaasa sawan',
    'sat bhai chompa',
    'ei ghor ei songsar',
    'shilpi',
    'dipu number 2',
    'heerak rajar deshe',
    'nondito noroke',
    'the hunger',
    'goopy gyne bagha byne',
    '...ebong kanna',
    'chhutir ghonta',
    'jibon thekey neya',
    'aguner poroshmoni',
    'rupkothar golpo',
    'apur panchali',
    'load shedding',
    'sthaniya sambaad',
    'sonar kella',
    'common gender',
    'personal assistant',
    'dukhai',
    'marutirtha hinglaj',
    'damu',
    'srabon megher din',
    'dhire bohe meghna',
    'deya neya',
    'the clay bird',
    'the land of peace',
    'hangor nodi grenade',
    'charachar',
    'sajani go sajani',
    'nayak',
    'jomalaye jibanta manush',
    'guerrilla',
    'kangal malsat',
    'jana aranya',
    'icecream',
    '80 te asio na',
    'burning calcutta',
    'bipasha',
    'moner manush',
    'taka ana pai',
    'uttar falguni',
    'oshikkhito',
    'eagoler chokh',
    'moroner pore',
    'nirjan saikate',
    'kancher swarga',
    'sesh anka',
    'barnali',
    'mej didi',
    'teen bhubaner parey',
    'agni pareeksha',
    'protibad',
    'agnishwar',
    'saheb bibi golam',
    'jiban trishna',
    'phulkumar',
    'uttarayan',
    'palanka',
    'rashifal',
    'harmonium',
    'assassin',
    'aamaar bhuvan',
    'shutorang',
    'ghatak',
    'alor pipasa',
    'ichchhemotir gappo',
    'nodir naam modhumoti',
    'five no budget films',
    'emiler goenda bahini',
    'dwitiyo ripu',
    'sangee',
    'anondo osru',
    'kuheli',
    'runway',
    'distant thunder',
    'paatshala',
    'pratidwandi',
    'bapjaner bioscope',
    'days and nights in the forest',
    'natoker moto: like a play',
    'nawab sirajuddaula',
    'pratyaghat',
    '13 number feku ostagar lane',
    'chaalchitra',
    'shap mochan',
    'thana theke aschi',
    'charmurti',
    'padma nadir majhi',
    'the cloud-capped star',
    'teen kanya',
    'jalaler golpo',
    'the music room',
    'the stranger',
    'amar bondhu rashed',
    'baishe srabon',
    'ekhane pinjar',
    'shukno lanka',
    'deep jweley jai',
    'shimana periye',
    'ek nadir galpo',
    'chinnamul',
    'bagh bahadur',
    'sabyasachi',
    'runaway',
    'joyjatra',
    'kokhono megh',
    'parashuram',
    'kony',
    'neelachaley mahaprabhu',
    'kathantara',
    'kittonkhola',
    'ghuri',
    'sotter mrittu nei',
    'abhijaan',
    'galpa holeo satyi',
    'meghe dhaka tara',
    'company limited',
    'neel akasher neechey',
    'chirodini tumi je amar 2',
    'chaya manush',
    'kanchenjungha',
    'britto',
    'devi',
    'bikkhov',
    'alor michil',
    'lathi',
    'disha',
    'chandidas',
    'mastan',
    'the forlorn',
    'na hannyate',
    'jibondhuli',
    'shikar',
    'jhankar',
    'mukti',
    'bhranti bilas',
    'shubhodristi',
    'headmaster',
    'shuvoda',
    'sweetheart',
    'ekattorer jishu',
    'swayamsiddha',
    'krishnakanter will',
    'chowringhee',
    'sagina mahato',
    'sutopar thikana',
    'macho mustanaa',
    'swapno',
    'bedeni',
    'uttoran',
    'achin pakhi',
    'bou thakuranir hath',
    'dasein',
    'sasurbari zindabad',
    'and quiet rolls the dawn',
    'four chapters',
    'haajar bachhar dhorey',
    'chocolate',
    'ajantrik',
    'sharey chuattar',
    'kshudhita pashan',
    'antony firingee',
    'chhadmabeshi',
    'hotath bristi',
    'chotoder chobi',
    'sati',
    'hello memsaheb',
    'mad_e in bangladesh',
    'ek phali rodh',
    'the coward',
    'chuye dile mon',
    'subhashchandra',
    'coolie',
    'ek bar bolo uttam kumar',
    'ami aadu',
    'shurjokonna',
    'sareng bou',
    'kabuliwala',
    'interview',
    'khashi katha',
    'surja dighal bari',
    'alo',
    'paanch adhyay',
    'dui duari',
    'niloye jokhon',
    'aakrosh',
    'sakal sandhya',
    'tumi amar',
    'tomake chai',
    'harano din',
    'paras-pathar',
    'ghare-baire',
    'subarnarekha',
    'badsha: the king',
    'daruchini dip',
    'shakha proshakha',
    'jomer raja dilo bor',
    'punascha',
    'porobashinee',
    'sabuj dwiper raja',
    'shadows of time',
    'teenkahon',
    'nirbashito',
    'open tee bioscope',
    'the japanese wife',
    'cinemawala',
    'gaariwala',
    'chayamoy',
    'bilambita lay',
    'rati chakravyuh',
    'chandra grohon',
    'bandhan',
    'brihonnola',
    'bari theke paliye',
    'jamaibabu zindabad',
    'jodi ekdin',
    'kokhono megh kokhono brishti',
    'dekha',
    'goopy bagha phire elo',
    'alik sukh - a tale of fleeting happiness',
    'ramdhanu: the rainbow',
    'calcutta 71',
    'bhalobasar anek naam',
    'lalsalu',
    'unishe april',
    'chitra nodir pare',
    'antarjali jatra',
    'baari tar bangla',
    'the last poem',
    'chorabali',
    'a river called titas',
    'ghetu putro komola',
    'keyamot theke keyamot',
    'praktan',
    'krishnopokkho',
    'ajana batas',
    'abby sen',
    'hero',
    'kinu gowalar gali',
    'sapurey',
    'beyond the circle',
    'didi',
    'mahajan',
    'ekti nodir naam',
    'kabuliwala',
    'araler antorale: the inside story',
    'den mohor',
    'ontore ontore',
    'ek je aachhe kanya',
    'jagriti',
    'naya pata',
    'chhodab na sang tohaar',
    'saranga',
    'mohabbat zindagi hai',
    'tel malish boot polish',
    'mujhe jeene do',
    'ganga maiyya tohe piyari chadhaibo',
    'ballia ke dabangai',
    'bhagat dhanna jatt',
    'nanak naam jahaz hai',
    'sikander',
    'ramta jogi',
    'dharam yudh morcha',
    'carry on jatta',
    'jatt jeona mour',
    'ek noor',
    'vaapsi',
    'chann pardesee',
    'mitti',
    'nanak dukhiya sub sansar',
    'www: work weather wife',
    'angrej',
    'kankan de ohle',
    'gelo',
    'eh janam tumhare lekhe',
    'ardaas',
    'bambukat',
    'ek jind ek jaan',
    'sadda haq',
    'judge singh llb',
    'mr. & mrs. 420',
    'goreyan nu daffa karo',
    'badla jatti da',
    'jatt & juliet',
    'silent waters',
    'sawa lakh se ek ladaun',
    'proud to be a sikh',
    'fateh',
    'jatt & juliet 2',
    'mannat',
    'love punjab',
    'mitter pyare nu haal mureedan da kehna',
    'dil hi to hai',
    'zinda bhaag',
    'police in pollywood',
    'qurbani jatt di',
    'i am shahid afridi',
    'shaheed-e-mohabbat boota singh',
    'haani',
    'kashino dikro',
    'veer hamirji - somanath ni sakhate',
    'premji rise of a warrior',
    'ek var piyu ne malva aavje',
    'happy familyy pvt ltd',
    'manvi ni bhavai',
    'hutututu: aavi ramat ni rutu',
    'gangotri',
    'ek sapera ek lutera',
    'dil ne phir yaad kiya',
    'laagi nahi chhute ram',
    'manzil',
    'vallah kya baat hai',
    'bubble gum',
    'gaban',
    'khushiyaan',
    'majajan',
    'channa sachi muchi',
    'yaraan naal baharaan',
    'asa nu maan watna da: in search of our roots',
    'lsd: love, sex aur dhokha',
    '31st october',
    'nalaik',
    'lad gaya pecha',
    'zill-e-shah',
    'jag jeondeyan de mele',
    'bangles',
    'jai jagannath',
    'dil apna punjabi',
    'gadar: ek prem katha',
    'dharti',
    'anhey gorhey da daan',
    'yasmin',
    'desi romeos',
    'yoddha: the warrior',
    'ae fond kiss...',
    'tera mera ki rishta',
    'dilli ka thug',
    'ambarsariya',
    'noor',
    'tere bin laden',
    'mel karade rabba',
    'bha ji in problem',
    'jihne mera dil luteya',
    'jatt boys putt jattan de',
    'gadaar: the traitor',
    'nikka zaildar',
    'maujaan dubai diyan',
    'political asylum',
    'a tale of punjab',
    'chak jawana',
    'band baaja baaraat',
    'happy go lucky',
    'yaar anmulle',
    'shareek',
    'amu',
    'polam pol',
    'sampoorna mahabharat',
    'saptapadii',
    'romeo & radhika',
    'jogan',
    'firaaq',
    'bhuvan shome',
    'do ustad',
    'bas yaari rakho',
    'mr. india',
    'mujhse fraaandship karoge',
    'percy',
    'aa te kevi dunniya',
    'drachenfutter',
    'gandhi, my father',
    'laado',
    'paltadacho munis',
    'vadakkunokkiyantram',
    'moonnam pakkam',
    'guru',
    'thaniyavartanam',
    'ennu ninte moideen',
    'bharatham',
    'gitanjali',
    'namukku parkkan munthiri thoppukal',
    'perariyathavar',
    'godfather',
    'oru vadakkan veeragatha',
    'aranazhikaneram',
    'vigathakumaran',
    'pathemari',
    'chatta',
    'ka bodyscapes',
    'ramji rav speaking',
    'kilukkam',
    'karma cartel',
    'thoovanathumbikal',
    'manichithrathazhu',
    'in harihar nagar',
    'nadodikkattu',
    'sandesham',
    'vanyam',
    'ozhivudivasathe kali',
    'shankarabharanam',
    'sagara sangamam',
    'kireedam',
    'ben',
    'sita swayamvar',
    'ollavum theeravum',
    'lakshmana rekha',
    'odeyil ninnu',
    'thenmavin kombath',
    'left right left',
    'sadayam',
    'pattana pravesham',
    'pinneyum',
    'classmates',
    'thanmathra',
  ];
  final recent = [
    'anand',
    'pk',
    'lagaan: once upon a time in india',
    'my name is khan',
    'lust, caution'
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return MyHomePage();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestion =
        query.isEmpty ? all : recent.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: Icon(Icons.movie),
        title: RichText(
          text: TextSpan(
              text: suggestion[index].substring(0, query.length),
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: suggestion[index].substring(query.length),
                    style: TextStyle(color: Colors.grey))
              ]),
        ),
      ),
      itemCount: suggestion.length,
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  List _data = new List();

  void makeRequest() async {
    var a =
        await http.read('https://movie-remmendation-api.herokuapp.com/neerja');
    var tagsJson = jsonDecode(a)['movie'];
    List<String> tags = tagsJson != null ? List.from(tagsJson) : null;
    setState(() {
      _data = tags;
    });
  }

  @override
  void initState() {
    makeRequest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Recommendation"),
          backgroundColor: Colors.deepPurple[400],
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              },
            )
          ],
        ),
        drawer: Drawer(),
        backgroundColor: Colors.deepPurple[600],
        body: Stack(alignment: Alignment.center, children: <Widget>[
          Container(
            width: 400,
            height: 500,
            child: Image.asset(
              'assets/image.png',
              fit: BoxFit.contain,
            ),
          ),
          DraggableScrollableSheet(
            maxChildSize: 0.85,
            minChildSize: 0.4,
            builder: (BuildContext context, ScrollController scrolController) {
              return Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40)),
                    ),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            '${_data[index]}',
                            style: TextStyle(
                                color: Colors.grey[900],
                                fontWeight: FontWeight.bold),
                          ),
                          trailing: Icon(
                            Icons.check_circle,
                            color: Colors.greenAccent,
                          ),
                        );
                      },
                      controller: scrolController,
                      itemCount: 10,
                    ),
                  ),
                  Positioned(
                    child: FloatingActionButton(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.pinkAccent,
                      onPressed: () {},
                    ),
                    top: -30,
                    right: 30,
                  )
                ],
              );
            },
          )
        ]));
  }
}
