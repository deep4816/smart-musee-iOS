//
//  ViewController.swift
//  memuDemo
//
//  Created by Tanvi Panchal on 09/10/16.
//  Copyright © 2016 Parth Changela. All rights reserved.
//

import UIKit
import CoreLocation
import AVFoundation


let LAN_TEXT_EN = "Remote sensing refers to the activities of recording/observing/perceiving (sensing) objects or events at far away (remote) places. In remote sensing, the sensors are not in direct contact with the objects or events being observed.\n The information needs a physical carrier to travel from the objects or events to the sensors through an intervening medium. The electromagnetic radiation is normally used as an information carrier in remote sensing.\nThe output of a remote sensing system is usually an image representing the scene being observed. A further step of image analysis and interpretation is required in order to extract useful information from the image.\nThe human visual system is an example of a remote sensing system in this general sense."
let LAN_TEXT_HINDI = "रिमोट सेंसिंग का मतलब दूर (रिमोट) स्थानों पर रिकॉर्डिंग / अवलोकन / अनुभव (सेंसिंग) ऑब्जेक्ट्स या इवेंट्स की गतिविधियों को संदर्भित करता है। रिमोट सेंसिंग में, सेंसर वस्तुओं या घटनाओं के साथ सीधे संपर्क में नहीं हैं।\nएक माध्यम के माध्यम से वस्तुओं / घटनाओं से सेंसर तक यात्रा करने के लिए जानकारी के लिए एक भौतिक वाहक की आवश्यकता होती है।\n विद्युत चुम्बकीय विकिरण को सामान्यतः रिमोट सेंसिंग में सूचना वाहक के रूप में उपयोग किया जाता है रिमोट सेंसिंग सिस्टम का उत्पादन आम तौर पर एक छवि है।\n जिसे मनाया गया दृश्य का प्रतिनिधित्व करता है। छवि से उपयोगी जानकारी निकालने के लिए छवि विश्लेषण और व्याख्या का एक और कदम आवश्यक है।\n मानव दृश्य प्रणाली इस सामान्य अर्थ में एक दूरस्थ संवेदन प्रणाली का एक उदाहरण है।"
/*let LAN_TEXT_GUJ = " રિમોટ સેન્સિંગ દૂર અર્થ થાય છે (દૂરસ્થ) રેકોર્ડિંગ / અવલોકન / અનુભવ સ્થાનો વસ્તુઓ અથવા ઘટનાઓ પ્રવૃત્તિઓ દર્શાવો (સેન્સીંગ) ઉલ્લેખ કરે છે.\n રિમોટ સેંસિંગ માં, સેન્સર વસ્તુઓ છે અથવા ઘટનાઓ સાથે માહિતી એક માધ્યમ મારફતે વસ્તુઓ / ઘટનાઓ સેન્સર મુસાફરી કરવા માટે ભૌતિક વાહક જરૂરી સીધો સંપર્ક નથી. \nઇલેક્ટ્રોમેગ્નેટિક વિકિરણ રિમોટ સેન્સીંગ સિસ્ટમ તરીકે સામાન્ય બાય રિમોટ સેન્સીંગ માહિતી વાહક ઉત્પન્ન સામાન્ય દૃશ્ય એક છબી દ્વારા મનાવવામાં આવે પ્રતિનિધિત્વ કરવા માટે વપરાય છે. \nછબી વિશ્લેષણ અને અર્થઘટન અન્ય પગલું ઉપયોગી માહિતી કાઢવા માટે છબીને જરૂરી છે.\n માનવ દ્રશ્ય સિસ્ટમ સામાન્ય અર્થમાં રિમોટ સેન્સીંગ સિસ્ટમ એક ઉદાહરણ છે." */
let LAN_TEXT_GUJ = "remote sensing no earth durr na recording avlokan anubhav sthaano vastu o athva ghatna o darshaava thaay che.\n remote sensing ma, sensor vastu o che athva ghatna o saathe maahiti ek maadhyam maarfat e vastu o / ghatn o sensor musaafari karva maate bhaouteek vaahak seedho sampark nathi. \n electro magnetic v kiran remote sensing system tareek e saamaanya buy remote sensing maahiti vaahak utpann saamaanya drishya ek chhabi dwaara manaav vaama aave prati nidhi tva karva maate vapraay che. \n chhabi wish leshan ane earth ghatan anya paglu upyogi maahiti kaadhva maate chhabi ne jaruri che.\n maanav drishya system saamaanya earth ma remote sensing system ek udaaharan che."

let LAN_TEXT_FRENCH = "La télédétection se réfère aux activités d'objets d'enregistrement / d'observation / perception (détection) ou d'événements à des endroits éloignés (distants). \nDans la télédétection, les capteurs ne sont pas en contact direct avec les objets ou les événements observés. L'information a besoin d'un opérateur physique pour se déplacer des objets / événements vers les capteurs à travers un support intermédiaire.\n Le rayonnement électromagnétique est normalement utilisé comme support d'information en télédétection. La sortie d'un système de télédétection est habituellement une image représentant la scène observée.\n Une autre étape de l'analyse et de l'interprétation de l'image est nécessaire pour extraire des informations utiles de l'image.\n Le système visuel humain est un exemple de système de télédétection dans ce sens général."

let STICKER_PSLV_ENG = "✑The Polar Satellite Launch Vehicle, commonly known by its abbreviation PSLV, is an expendable launch system developed and operated by the Indian Space Research Organisation (ISRO). \n✑It was developed to allow India to launch its Indian Remote Sensing (IRS) satellites into Sun-synchronous orbits, a service that was, until the advent of the PSLV, commercially available only from Russia.\n✑Some notable payloads launched by PSLV include India's first lunar probe Chandrayaan-1, India's first interplanetary mission, Mangalyaan (Mars orbiter) and India's first space observatory, Astrosat.\n✑On 15 February 2017, India successfully launched a payload of 104 foreign satellites in polar orbit around the Earth using PSLV tripling the previous record held by Russia for most number of satellites sent to space in a single launch."

let speak_eng = "The Polar Satellite Launch Vehicle, commonly known by its abbreviation PSLV, is an expendable launch system developed and operated by the Indian Space Research Organisation (ISRO).Geosynchronous Satellite Launch Vehicle abbreviated in English as GSLV, is an expendable launch system operated by the Indian Space Research Organisation (ISRO).GSLV has been used in ten launches to date, since its first launch in 2001 through to its most recent launch on September 8, 2016 of the INSAT-3DR.It was developed to allow India to launch its Indian Remote Sensing (IRS) satellites into Sun-synchronous orbits, a service that was, until the advent of the PSLV, commercially available only from Russia.The Geosynchronous Satellite Launch Vehicle (GSLV) project was initiated in 1990 with the objective of acquiring an Indian launch capability for geosynchronous satellites.Some notable payloads launched by PSLV include India's first lunar probe Chandrayaan-1, India's first interplanetary mission, Mangalyaan (Mars orbiter) and India's first space observatory, Astrosat.GSLV uses major components that are already proven in the Polar Satellite Launch Vehicle (PSLV) launchers in the form of the S125/S139 solid rocket booster and the liquid-fueled Vikas engine.On 15 February 2017, India successfully launched a payload of 104 foreign satellites in polar orbit around the Earth using PSLV tripling the previous record held by Russia for most number of satellites sent to space in a single launch.The GSLV became operational after a second development flight, which successfully placed GSAT-2 in 2003. In its first operational flight in September 2004, GSLV launched EDUSAT - India's first dedicated satellite for educational services. However, the second operational flight, GSLV F02, conducted on July 10, 2006 did not succeed in placing the satellite INSAT-4C into orbit."

let STICKER_PSLV_HINDI = "✑ध्रुवीय उपग्रह लॉन्च वाहन, जिसे आमतौर पर अपने संक्षिप्त नाम पीएसएलवी द्वारा जाना जाता है, भारतीय अंतरिक्ष अनुसंधान संगठन (इसरो) द्वारा विकसित और संचालित एक प्रचुर लांच प्रणाली है।\n✑यह भारत को अपने भारतीय रिमोट सेंसिंग (आईआरएस) उपग्रहों को सन-तुल्यकालिक कक्षाओं में लॉन्च करने की अनुमति देने के लिए विकसित किया गया था, जो कि पीएसएलवी के आगमन तक, केवल रूस से वाणिज्यिक रूप से उपलब्ध था। \n✑पीएसएलवी द्वारा लॉन्च किए गए कुछ उल्लेखनीय पेलोड्स में भारत का पहला चंद्र चंद्रयान -1, भारत का पहला इंटरप्लानेटरी मिशन, मंगलायान (मंगल ग्रह) और भारत की पहली अंतरिक्ष वेधशाला, एस्ट्रोसैट जांचें।\n✑ 15 फरवरी, 2017 को, भारत ने सफलतापूर्वक पीएसएलवी का इस्तेमाल करते हुए पृथ्वी के चारों ओर 104 विदेशी उपग्रहों का पेलोड शुरू किया था, जो रूस द्वारा आयोजित पहले के एक रिकॉर्ड में तीन गुनी उपग्रहों को एक सिंगल लॉन्च में स्थानांतरित कर दिया गया था।"

let speak_hindi = "रुवीय उपग्रह लॉन्च वाहन, जिसे आमतौर पर अपने संक्षिप्त नाम पीएसएलवी द्वारा जाना जाता है, भारतीय अंतरिक्ष अनुसंधान संगठन (इसरो) द्वारा विकसित और संचालित एक प्रचुर लांच प्रणाली है। जीएसएलवी के रूप में जीओसिंक्रोनस सैटेलाइट लॉन्च वाहन अंग्रेजी में संक्षिप्त है, भारतीय अंतरिक्ष अनुसंधान संगठन (इसरो) द्वारा संचालित एक प्रचुर लांच प्रणाली है। जीएसएलवी का प्रयोग दस लॉन्च से आज तक किया गया है, 2001 में इसका सबसे पहला लॉन्च आईएनएसएटी-डीडीआर के 8 सितंबर, 2016 को शुरू किया गया था। यह भारत को अपने भारतीय रिमोट सेंसिंग (आईआरएस) उपग्रहों को सन-तुल्यकालिक कक्षाओं में लॉन्च करने की अनुमति देने के लिए विकसित किया गया था, जो कि पीएसएलवी के आगमन तक, केवल रूस से वाणिज्यिक रूप से उपलब्ध था। GSLV परियोजना 1990 में शुरू की गई थी भौगोलिक उपग्रहों के लिए एक भारतीय प्रक्षेपण क्षमता हासिल करने की।पीएसएलवी द्वारा लॉन्च किए गए कुछ उल्लेखनीय पेलोड्स में भारत का पहला चंद्र चंद्रयान -1, भारत का पहला इंटरप्लानेटरी मिशन, मंगलायान (मंगल ग्रह) और भारत की पहली अंतरिक्ष वेधशाला, एस्ट्रोसैट जांचें।जीएसएलवी प्रमुख घटकों का उपयोग करता है जो कि पहले से ही S125 / S139 ठोस रॉकेट बूस्टर और तरल ईंधन युक्त विकास इंजन के रूप में पोलर सैटेलाइट लॉन्च व्हीकल (पीएसएलवी) लांचरों में साबित हुए हैं। जीएसएलवी दूसरी विकास उड़ान के बाद परिचालन शुरू कर चुका है, जो सफलतापूर्वक 2003 में जीएसएटी -2 को सौंपी थी। सितंबर 2004 में अपनी पहली परिचालन उड़ान में, जीएसएलवी ने एडीयूएसएटी - भारत की शैक्षणिक सेवाओं के लिए पहला समर्पित उपग्रह शुरू किया था। हालांकि, 10 जुलाई, 2006 को किए गए दूसरी परिचालन उड़ान, जीएसएलवी एफ 02, ने कक्षा में इनसैट -4 सी उपग्रह रखने में सफल नहीं हुआ।15 फरवरी, 2017 को, भारत ने सफलतापूर्वक पीएसएलवी का इस्तेमाल करते हुए पृथ्वी के चारों ओर 104 विदेशी उपग्रहों का पेलोड शुरू किया था, जो रूस द्वारा आयोजित पहले के एक रिकॉर्ड में तीन गुनी उपग्रहों को एक सिंगल लॉन्च में स्थानांतरित कर दिया गया था।"

let STICKER_PSLV_GUJ = "✑ધ્રુવીય સેટેલાઇટ લૉન્ચ વ્હિકલ, જે સામાન્ય રીતે તેના સંક્ષિપ્ત પીએસએલવી દ્વારા ઓળખાય છે, એ ભારતીય સ્પેસ રિસર્ચ ઓર્ગેનાઇઝેશન (ઇસરો) દ્વારા વિકસિત અને સંચાલિત એક પ્રચલિત લોન્ચ સિસ્ટમ છે.\n ✑તે ભારતને તેના ભારતીય રિમોટ સેન્સિંગ (આઇઆરએસ) ઉપગ્રહોને સન-સિન્ક્રોનસ ભ્રમણ કક્ષામાં લોન્ચ કરવાની પરવાનગી આપવા માટે વિકસાવવામાં આવી હતી, પીએસએલવીના આગમન સુધી, રશિયા તરફથી વ્યાપારી રીતે ઉપલબ્ધ હોવાની સેવા હતી.\n ✑પીએસએલવી દ્વારા શરૂ કરાયેલા કેટલાક નોંધપાત્ર પેલોડ્સમાં ભારતનો પ્રથમ ચંદ્ર ભારતના પ્રથમ આંતરગ્રહીય મિશન, મંગલ્યાન (મંગળ ઓર્બિટર) અને ભારતની પ્રથમ અવકાશ વેધશાળા, એસ્ટ્રોસેટ, ચંદ્રયાન -1 ની ચકાસણી કરે છે.\n ✑15 ફેબ્રુઆરી, 2017 ના રોજ, ભારત સફળતાપૂર્વક PSLV નો ઉપયોગ કરીને પૃથ્વીની આસપાસના ધ્રુવીય ભ્રમણકક્ષામાં 104 વિદેશી ઉપગ્રહોનું પેલોડ લોંચ કર્યું હતું, જેમાં રશિયા દ્વારા સૌથી વધુ સંખ્યામાં ઉપગ્રહો દ્વારા એક જ પ્રક્ષેપણમાં મોકલવામાં આવેલા અગાઉના રેકોર્ડને ત્રણ ગણો ગણી શકાય."

let speak_guj = "Dhruviya satellite launch vehicle, j saamaanya reetey tainaa samshikpt PSLV dwaara odkhaay che, e bhaartiya space research organisation (ISRO) dwaara veeksit ann ae sanchaalit ek prachalit launch system che. GSLV taree k angreji ma samshikpt gas synchronous oopgraha launch vaahan, bhaartiya avkaash sanshodhan sansthaa ISRO dwaara sanchaalit ek prachalit launch system che. GSLV no oopyog das launch thi atyaar sudhi ma karvaa ma aavyo che,bey hajaar ek ma te ni sau thi pehli launching, INSAT-3 DR ni aanth september bey hajaar sod na roj launch karaavaa ma aavi che. te bhaarat ne te naa bhaartiya remote sensing (IRS) oopgraho ne sun-synchronous bhraman kaksha ma launch karvaa ni parwaangi aapvaa maate viksaav vaa ma aavi hati, PSLV na aagman sudhi, russia taraf thi vyaapaari reete ooplabdh hovaani sevaa hati.GSLV project ni shuru aat ognis so nevu ma shuru karvaa ma aavi hati, jemaa bhaugolik oopgraho maate bhaartiya prakshe pan ni kshamtaa ni hastgast karvaano udeshya hato.PSLV dwaara shuru karaa yela ketlaak naundh paatr payloads ma bhaarat no pratham chandr bhaarat na pratham aantar grahiya mission, mangalyaan (mangad orbiter) ane bhaarat ni pratham avkaash vedhshaada,Astrosat, chandrayaan-ek ni chakaasni kar ae che.GSLV mukhya ghatak o no oopyog kar ae che j pehle thij dhruviya satellite launch vehicle (PSLV) prakshepan ma saabit thaay che.S125/S139 ghan rocket booster annn ae pravaahi indhaneet vikaas engine. pandar february, bey hajaar sattar na roj, bhaarat safadtaa purvak PSLV no oopyog kari ne pruthvi ni aaspaas na dhruviya bhraman kaksha ma ek so chaar videshi oopgraho nu payload launch karyu hatu, jemaa russia dwaara sauthi vadhu sankhyaa ma oopgraho dwaara ekaj prakshepan ma mokal vaama aavela agaon na record ne tran gano gani shakaay.GSLV beeja vikaas flight pachhi operational bani hati,j ne bey hajaar tran ma GSAT-2 nu safadtaa purvak sthaan aapyu hatu. september bey hajaar chaar ma teni pratham operational flight ma GSLV a EDUSAT shaikshanik sevaa o maate pratham samarpeet oopgrah jo k ,das october bey hajaar cho na roj GSLV F 02 nu sanchaalan karnaari biji flight, oopgrah inset chaar c ne bhraman kaksha ma mookva ma safad thai na hati. "

let STICKER_PSLV_FRENCH = "✑Le véhicule de lancement de satellite Polar, communément connu sous sa sigle PSLV, est un système de lancement durablement développé et exploité par l'Organisation de recherche spatiale indienne (ISRO).\n✑Il a été développé pour permettre à l'Inde de lancer ses satellites de télédétection indienne (IRS) dans les orbites synchrones du soleil, un service qui, jusqu'à l'avènement du PSLV, n'est disponible sur le marché qu'en Russie.\n✑Certaines charges utiles notées lancées par PSLV incluent la première lunaire de l'Inde Sonde Chandrayaan-1, la première mission interplanétaire de l'Inde, Mangalyaan (Mars orbiter) et le premier observatoire spatial de l'Inde, Astrosat.\n✑Le 15 février 2017, l'Inde a lancé avec succès une charge utile de 104 satellites étrangers en orbite polaire autour de la terre en utilisant le PSLV triplant le record précédent détenu par la Russie pour la plupart des satellites envoyés à l'espace dans un seul lancement."

let speak_french = "Le véhicule de lancement de satellite Polar, communément connu sous sa sigle PSLV, est un système de lancement durablement développé et exploité par l'Organisation de recherche spatiale indienne (ISRO).Le véhicule de démarrage par satellite géosynchrone abrégé en anglais sous le nom de GSLV, est un système de lancement déployable exploité par l'Organisation indienne de recherche spatiale (ISRO). GSLV a été utilisé dans dix lancements à ce jour, depuis son premier lancement en 2001 jusqu'à son lancement le plus récent le 8 septembre 2016 de l'INSAT-3DR. Le projet de véhicule de lancement de satellite géosynchrone (GSLV) a été lancé en 1990 dans le but d'acquérir une capacité de lancement indienne pour les satellites géosynchrones.Il a été développé pour permettre à l'Inde de lancer ses satellites de télédétection indienne (IRS) dans les orbites synchrones du soleil, un service qui, jusqu'à l'avènement du PSLV, n'est disponible sur le marché qu'en Russie.GSLV utilise des composants majeurs déjà prouvés dans les lanceurs de véhicules de lancement par satellite Polar (PSLV) sous la forme de Le robinet à fusée solide S125 / S139 et le moteur Vikas à essence liquide.Certaines charges utiles notées lancées par PSLV incluent la première lunaire de l'Inde Sonde Chandrayaan-1, la première mission interplanétaire de l'Inde, Mangalyaan (Mars orbiter) et le premier observatoire spatial de l'Inde, Astrosat.Le GSLV est devenu opérationnel après un deuxième vol de développement, qui a réussi le GSAT-2 en 2003. Lors de son premier vol opérationnel en septembre 2004, GSLV a lancé EDUSAT - Inde Premier satellite dédié aux services éducatifs. Toutefois, le deuxième vol opérationnel, GSLV F02, effectué le 10 juillet 2006, n'a pas réussi à placer le satellite INSAT-4C en orbite.Le 15 février 2017, l'Inde a lancé avec succès une charge utile de 104 satellites étrangers en orbite polaire autour de la terre en utilisant le PSLV triplant le record précédent détenu par la Russie pour la plupart des satellites envoyés à l'espace dans un seul lancement."

let STICKER_GSLV_ENG = "✑Geosynchronous Satellite Launch Vehicle abbreviated in English as GSLV, is an expendable launch system operated by the Indian Space Research Organisation (ISRO). GSLV has been used in ten launches to date, since its first launch in 2001 through to its most recent launch on September 8, 2016 of the INSAT-3DR.\n✑The Geosynchronous Satellite Launch Vehicle (GSLV) project was initiated in 1990 with the objective of acquiring an Indian launch capability for geosynchronous satellites.\n✑ GSLV uses major components that are already proven in the Polar Satellite Launch Vehicle (PSLV) launchers in the form of the S125/S139 solid rocket booster and the liquid-fueled Vikas engine.\n ✑The GSLV became operational after a second development flight, which successfully placed GSAT-2 in 2003. In its first operational flight in September 2004, GSLV launched EDUSAT - India's first dedicated satellite for educational services. However, the second operational flight, GSLV F02, conducted on July 10, 2006 did not succeed in placing the satellite INSAT-4C into orbit."

let STICKER_GSLV_HINDI = "✑जीएसएलवी के रूप में जीओसिंक्रोनस सैटेलाइट लॉन्च वाहन अंग्रेजी में संक्षिप्त है, भारतीय अंतरिक्ष अनुसंधान संगठन (इसरो) द्वारा संचालित एक प्रचुर लांच प्रणाली है। जीएसएलवी का प्रयोग दस लॉन्च से आज तक किया गया है, 2001 में इसका सबसे पहला लॉन्च आईएनएसएटी-डीडीआर के 8 सितंबर, 2016 को शुरू किया गया था। \n ✑GSLV परियोजना 1990 में शुरू की गई थी भौगोलिक उपग्रहों के लिए एक भारतीय प्रक्षेपण क्षमता हासिल करने की।\n ✑जीएसएलवी प्रमुख घटकों का उपयोग करता है जो कि पहले से ही S125 / S139 ठोस रॉकेट बूस्टर और तरल ईंधन युक्त विकास इंजन के रूप में पोलर सैटेलाइट लॉन्च व्हीकल (पीएसएलवी) लांचरों में साबित हुए हैं। जीएसएलवी दूसरी विकास उड़ान के बाद परिचालन शुरू कर चुका है, जो सफलतापूर्वक 2003 में जीएसएटी -2 को सौंपी थी। सितंबर 2004 में अपनी पहली परिचालन उड़ान में, जीएसएलवी ने एडीयूएसएटी - भारत की शैक्षणिक सेवाओं के लिए पहला समर्पित उपग्रह शुरू किया था। हालांकि, 10 जुलाई, 2006 को किए गए दूसरी परिचालन उड़ान, जीएसएलवी एफ 02, ने कक्षा में इनसैट -4 सी उपग्रह रखने में सफल नहीं हुआ।"

let STICKER_GSLV_GUJ = "✑જીએસએલવી (GSLV) તરીકે અંગ્રેજીમાં સંક્ષિપ્ત ગેસ સિંક્રનસ ઉપગ્રહ લોન્ચ વાહન, ભારતીય અવકાશ સંશોધન સંસ્થા (ઇસરો) દ્વારા સંચાલિત એક પ્રચલિત લોન્ચ સિસ્ટમ છે. જીએસએલવીનો ઉપયોગ દસ લોંચથી અત્યાર સુધીમાં કરવામાં આવ્યો છે, 2001 માં તેની સૌથી પહેલી લોન્ચિંગ, આઈએનએસએટી-3 ડીઆરની 8 સપ્ટેમ્બર, 2016 ના રોજ લોન્ચ કરવામાં આવી છે. \n ✑GSLV પ્રોજેક્ટની શરૂઆત 1 99 0 માં શરૂ કરવામાં આવી હતી, જેમાં ભૌગોલિક ઉપગ્રહો માટે ભારતીય પ્રક્ષેપણની ક્ષમતાની હસ્તગત કરવાનો ઉદ્દેશ હતો. \nજીએસએલવી મુખ્ય ઘટકોનો ઉપયોગ કરે છે જે પહેલેથી જ ધ્રુવીય સેટેલાઇટ લોન્ચ વ્હિકલ (પીએસએલવી) પ્રક્ષેપણમાં સાબિત થાય છે. S125 / S139 ઘન રોકેટ બૂસ્ટર અને પ્રવાહી-ઇંધણિત વિકાસ એન્જિન.\n ✑જીએસએલવી બીજા વિકાસ ફ્લાઇટ પછી ઓપરેશનલ બની હતી, જેણે 2003 માં જીએસએટી -2 નું સફળતાપૂર્વક સ્થાન આપ્યું હતું. સપ્ટેમ્બર 2004 માં તેની પ્રથમ ઓપરેશનલ ફ્લાઇટમાં, જીએસએલવીએ ઇડીયુસેટ - ઇન્ડિયાઝ શૈક્ષણિક સેવાઓ માટે પ્રથમ સમર્પિત ઉપગ્રહ જો કે, 10 ઓક્ટોબર, 2006 ના રોજ જીએસએલવી એફ 02 નું સંચાલન કરનારી બીજી ફ્લાઇટ, ઉપગ્રહ ઇન્સેટ -4 સીને ભ્રમણકક્ષામાં મૂકવામાં સફળ થઈ ન હતી."

let STICKER_GSLV_FRENCH = "✑Le véhicule de démarrage par satellite géosynchrone abrégé en anglais sous le nom de GSLV, est un système de lancement déployable exploité par l'Organisation indienne de recherche spatiale (ISRO). GSLV a été utilisé dans dix lancements à ce jour, depuis son premier lancement en 2001 jusqu'à son lancement le plus récent le 8 septembre 2016 de l'INSAT-3DR. Le projet de véhicule de lancement de satellite géosynchrone (GSLV) a été lancé en 1990 dans le but d'acquérir une capacité de lancement indienne pour les satellites géosynchrones.\n ✑GSLV utilise des composants majeurs déjà prouvés dans les lanceurs de véhicules de lancement par satellite Polar (PSLV) sous la forme de Le robinet à fusée solide S125 / S139 et le moteur Vikas à essence liquide. \n✑ Le GSLV est devenu opérationnel après un deuxième vol de développement, qui a réussi le GSAT-2 en 2003. Lors de son premier vol opérationnel en septembre 2004, GSLV a lancé EDUSAT - Inde Premier satellite dédié aux services éducatifs. Toutefois, le deuxième vol opérationnel, GSLV F02, effectué le 10 juillet 2006, n'a pas réussi à placer le satellite INSAT-4C en orbite."

class ViewController: UIViewController, UIScrollViewDelegate ,CLLocationManagerDelegate,UITextViewDelegate, AVSpeechSynthesizerDelegate{
    @IBOutlet weak var mainScroll: UIScrollView!

    @IBOutlet weak var pageCtrl: UIPageControl!
    @IBOutlet weak var btnMenuButton: UIBarButtonItem!
      @IBOutlet var popUp: UIView!
    
    @IBOutlet var InfoPopUp: UIView!
    @IBOutlet var StickerPopUp: UIView!
 //   @IBOutlet weak var btnClose: UIButton!
    
    @IBOutlet weak var ImageGSLV: UIImageView!
   
    @IBOutlet weak var ImagePSLV: UIImageView!
   

    @IBOutlet weak var TextPSLV: UITextView!
    @IBOutlet weak var TextGSLV: UITextView!
    
    
    @IBOutlet weak var txtView: UITextView!
    @IBOutlet weak var imgView: UIImageView!
    //@IBOutlet weak var pageCtrl: UIPageControl!
    //var imageArr = [UIImage]()
    
    @IBOutlet weak var stickerTxtView: UITextView!
    
     var readSound = AVSpeechSynthesizer()
    
    let locationManager = CLLocationManager()
    
    let Bregion = CLBeaconRegion(proximityUUID: NSUUID(uuidString: "E2C56DB5-DFFB-48D2-B060-D0F5A71096E0") as! UUID, identifier: "Estimotes")
    
    let StickerRegion  = CLBeaconRegion(proximityUUID: NSUUID(uuidString: "D0D3FA86-CA76-45EC-9BD9-6AF406F452A8") as! UUID, identifier: "EstimotesSticker")
   // let adhocBregion = CLBeaconRegion(proximityUUID: NSUUID(uuidString: "D0D3FA86-CA76-45EC-9BD9-6AF42EA865AE") as! UUID, identifier: "EstimotesSticker")
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      //  InfoPopUp.isHidden = true

        
self.popUp.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
       self.StickerPopUp.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        self.mainScroll.frame = CGRect(x:0, y:0, width:self.view.frame.width, height:self.view.frame.height)
        let scrollViewWidth:CGFloat = self.mainScroll.frame.width
        let scrollViewHeight:CGFloat = self.mainScroll.frame.height
        let imgOne = UIImageView(frame: CGRect(x:0, y:0,width:scrollViewWidth, height:scrollViewHeight))
        imgOne.image = UIImage(named: "gslv_1")
        
        let imgTwo = UIImageView(frame: CGRect(x:scrollViewWidth, y:0,width:scrollViewWidth, height:scrollViewHeight))
        imgTwo.image = UIImage(named: "pslv_1")
        
        let imgThree = UIImageView(frame: CGRect(x:scrollViewWidth*2, y:0,width:scrollViewWidth, height:scrollViewHeight))
        imgThree.image = UIImage(named: "space_shuttle_1")
        
        let imgFour = UIImageView(frame: CGRect(x:scrollViewWidth*3, y:0,width:scrollViewWidth, height:scrollViewHeight))
        imgFour.image = UIImage(named: "remote_sensing_1")
        
        let  imgFive = UIImageView(frame: CGRect(x:scrollViewWidth*4, y:0,width:scrollViewWidth, height:scrollViewHeight))
        imgFive.image = UIImage(named: "5_gslv")
        
        let imgSix = UIImageView(frame: CGRect(x:scrollViewWidth*5, y:0,width:scrollViewWidth, height:scrollViewHeight))
        imgSix.image = UIImage(named: "6_pslv")
        
        
        self.mainScroll.addSubview(imgOne)
        self.mainScroll.addSubview(imgTwo)
        self.mainScroll.addSubview(imgThree)
        self.mainScroll.addSubview(imgFour)
        self.mainScroll.addSubview(imgFive)
        self.mainScroll.addSubview(imgSix)
        
        //6
        imgOne.contentMode = .scaleToFill
        imgTwo.contentMode = .scaleToFill
        
        imgThree.contentMode = .scaleToFill
        imgFour.contentMode = .scaleToFill
        imgFive.contentMode = .scaleAspectFit
        imgSix.contentMode = .scaleAspectFit
        
        self.mainScroll.contentSize = CGSize(width:self.mainScroll.frame.width * 6, height: 0)
        self.mainScroll.delegate = self
        self.pageCtrl.currentPage = 0
        
        
        
        //Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(moveToNextPage), userInfo: nil, repeats: true)
        readSound = AVSpeechSynthesizer()
        readSound.delegate = self
        
        txtView.delegate = self
        let languageStored =  UserDefaults.standard.string(forKey: "language")
        
        
        if languageStored == "English"
        {
            txtView.text = LAN_TEXT_EN
            
            txtView.textColor = .white
            TextPSLV.text = STICKER_PSLV_ENG
            TextGSLV.text = STICKER_GSLV_ENG
            TextPSLV.textColor = .white
            TextGSLV.textColor = .white
        }
        if languageStored == "Hindi"
        {
            txtView.text = LAN_TEXT_HINDI
            txtView.textColor = .white
            TextPSLV.text = STICKER_PSLV_HINDI
            TextGSLV.text = STICKER_GSLV_HINDI
            TextPSLV.textColor = .white
            TextGSLV.textColor = .white
        }
        if languageStored == "Gujarati"
        {
           txtView.text =  "રિમોટ સેન્સિંગ દૂર અર્થ થાય છે (દૂરસ્થ) રેકોર્ડિંગ / અવલોકન / અનુભવ સ્થાનો વસ્તુઓ અથવા ઘટનાઓ પ્રવૃત્તિઓ દર્શાવો (સેન્સીંગ) ઉલ્લેખ કરે છે. રિમોટ સેંસિંગ માં, સેન્સર વસ્તુઓ અથવા સેન્સર વસ્તુઓ / ઘટનાઓ કિરણોત્સર્ગ સામાન્ય રિમોટ સેંસિંગ ઘટનાઓ સાથે સીધો સંપર્ક દ્વારા એક મારફતે મુસાફરી માહિતી ભૌતિક વાહક જરૂરી માહિતી સામાન્ય રીતે એક છબી રિમોટ સેન્સીંગ સિસ્ટમ વાહક તરીકે વપરાય છે. કયા દ્રશ્ય અવલોકન રજૂ કરે છે. છબી વિશ્લેષણ અને અર્થઘટન અન્ય પગલું ઉપયોગી માહિતી કાઢવા માટે છબીને જરૂરી છે. માનવ દ્રશ્ય સિસ્ટમ સામાન્ય અર્થમાં રિમોટ સેન્સીંગ સિસ્ટમ એક ઉદાહરણ છે."
          
    
            txtView.textColor = .white
            TextPSLV.text = STICKER_PSLV_GUJ
            TextGSLV.text = STICKER_GSLV_GUJ
            TextPSLV.textColor = .white
            TextGSLV.textColor = .white
        }
        if languageStored == "French"
        {
            txtView.text = LAN_TEXT_FRENCH
            txtView.textColor = .white
            TextPSLV.text = STICKER_PSLV_FRENCH
            TextGSLV.text = STICKER_GSLV_FRENCH
            TextPSLV.textColor = .white
            TextGSLV.textColor = .white
        }
        
        self.view.addSubview(popUp)
        self.view.addSubview(StickerPopUp)
    popUp.isHidden = true
        StickerPopUp.isHidden = true
        
        
        
                navigationItem.hidesBackButton = true
        
        locationManager.delegate = self
        if(CLLocationManager.authorizationStatus() != CLAuthorizationStatus.authorizedWhenInUse)
        {
            locationManager.requestWhenInUseAuthorization()
            
        }
        
            locationManager.startRangingBeacons(in: Bregion)
            locationManager.startRangingBeacons(in: StickerRegion)
        
            btnMenuButton.target = revealViewController()
            btnMenuButton.action = #selector(SWRevealViewController.revealToggle(_:))
        
        }
    
    override func viewDidAppear(_ animated: Bool) {
        timer = Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(moveToNextPage), userInfo: nil, repeats: true)
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        
        timer.invalidate()
        
        print("view did disappear")
        //Timer.invalidate(self)
        
        readSound.stopSpeaking(at : AVSpeechBoundary.immediate)
        
        if readSound.isSpeaking
        {
            readSound.stopSpeaking(at: AVSpeechBoundary.immediate)
        }
        
    }

   override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
     func moveToNextPage (){
        
        
        print("Calling timer")
        
        let pageWidth:CGFloat = self.mainScroll.frame.width
        let maxWidth:CGFloat = pageWidth * 6
        
        let contentOffset:CGFloat = self.mainScroll.contentOffset.x
        
        var slideToX = contentOffset + pageWidth
        
        if  contentOffset + pageWidth == maxWidth{
            slideToX = 0
        }
        
        print(slideToX)
        self.mainScroll.setContentOffset(CGPoint(x: slideToX, y: 0), animated: true)
     //   self.mainScroll.scrollRectToVisible(CGRect(x:slideToX, y:0, width:pageWidth, height:self.mainScroll.frame.height), animated: true)
    }

    
    //MARK: UIScrollView Delegate
    func scrollViewDidEndScrollingAnimation(_ mainScroll: UIScrollView){
        // Test the offset and calculate the current page after scrolling ends
        let pageWidth:CGFloat = mainScroll.frame.width
        let currentPage:CGFloat = floor((mainScroll.contentOffset.x-pageWidth/2)/pageWidth)+1
        // Change the indicator
        self.pageCtrl.currentPage = Int(currentPage);
    }

    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        
//        print("loading beacons \(beacons)")
        if beacons.count == 0
        {
//            print("No beacon")
//            readSound.stopSpeaking(at: AVSpeechBoundary.immediate)
//            
//            
//                        if readSound.isSpeaking
//                        {
//                            readSound.stopSpeaking(at: AVSpeechBoundary.immediate)
//                        }

            //popUp.isHidden = true
           // StickerPopUp.isHidden = true
        }else{
            let beaconfound = beacons.first
            print("loading beacons \(beaconfound?.proximityUUID)")
            
            if beaconfound?.proximityUUID.uuidString ==  "D0D3FA86-CA76-45EC-9BD9-6AF406F452A8"            {
                popUp.isHidden=true
                StickerPopUp.isHidden=false

                navigationController?.isNavigationBarHidden = true
                print("popUP sb")
            }
            if beaconfound?.proximityUUID.uuidString == "E2C56DB5-DFFB-48D2-B060-D0F5A71096E0"
            {
                popUp.isHidden=false
                StickerPopUp.isHidden=true
                            navigationController?.isNavigationBarHidden = true
                                print("popUP b")

            }
        }
    }
//        if region.identifier == "EstimotesSticker"
//        {
//            print("YES STICKER REGION....")
//        }
//        if region.identifier == "Estimotes"
//        {
//            print("YES NORMAL REGION....")
//        }
     //Old beacon code
//        
//        let knowBeacons = beacons.filter{ $0.proximity != CLProximity.unknown }
//        if(knowBeacons.count > 0)
//        {
//         //   let closestBeacon = knowBeacons[0] as CLBeacon
//         //   if closestBeacon.minor == 111
//          //  {
//            
//            
//            popUp.isHidden=false
//                
//            navigationController?.isNavigationBarHidden = true
//                print("popUP b")
//
        //End old beacon code
         //   }
            //stickerBeacon
            
//            else if closestBeacon.minor == 58349
//            {
//            StickerPopUp.isHidden=false
//            navigationController?.isNavigationBarHidden = true
//                print("popUP sb")
//
//            }
    
//        } else
//        {
//    
//    
//            readSound.stopSpeaking(at: AVSpeechBoundary.immediate)
//            
//
//            if readSound.isSpeaking
//            {
//                readSound.stopSpeaking(at: AVSpeechBoundary.immediate)
//            }
//                       popUp.isHidden=true
//            StickerPopUp.isHidden=true
//            
//            
//             navigationController?.isNavigationBarHidden = false
//          //  self.view.backgroundColor = UIColor.green
//          

    


    
    @IBAction func AudioBtn(_ sender: UIButton) {
        
        if popUp.isHidden == false
        {
        if readSound.isSpeaking
        {
            print("is speaking")
            return
        }
        if txtView.text == LAN_TEXT_EN
        {
            if readSound.isPaused
            {
                readSound.continueSpeaking()
            }
            if readSound.pauseSpeaking(at: AVSpeechBoundary.immediate)
            {
                readSound.continueSpeaking()

            }
            
            let utterance = AVSpeechUtterance(string: txtView.text)
            utterance.voice = AVSpeechSynthesisVoice(language: "en")
            utterance.preUtteranceDelay = 1.0
            
            readSound = AVSpeechSynthesizer()
            readSound.delegate = self
            readSound.speak(utterance)
            
        }
        if txtView.text == LAN_TEXT_HINDI
        {
            if readSound.isPaused
            {
                readSound.continueSpeaking()
            }
            if readSound.pauseSpeaking(at: AVSpeechBoundary.immediate)
            {
                readSound.continueSpeaking()
                
            }
            let utterance = AVSpeechUtterance(string: txtView.text)
            utterance.voice = AVSpeechSynthesisVoice(language: "hi")
            utterance.preUtteranceDelay = 1.0
            
            readSound = AVSpeechSynthesizer()
            readSound.delegate = self
            readSound.speak(utterance)
        }
        
        

            if txtView.text == "રિમોટ સેન્સિંગ દૂર અર્થ થાય છે (દૂરસ્થ) રેકોર્ડિંગ / અવલોકન / અનુભવ સ્થાનો વસ્તુઓ અથવા ઘટનાઓ પ્રવૃત્તિઓ દર્શાવો (સેન્સીંગ) ઉલ્લેખ કરે છે. રિમોટ સેંસિંગ માં, સેન્સર વસ્તુઓ અથવા સેન્સર વસ્તુઓ / ઘટનાઓ કિરણોત્સર્ગ સામાન્ય રિમોટ સેંસિંગ ઘટનાઓ સાથે સીધો સંપર્ક દ્વારા એક મારફતે મુસાફરી માહિતી ભૌતિક વાહક જરૂરી માહિતી સામાન્ય રીતે એક છબી રિમોટ સેન્સીંગ સિસ્ટમ વાહક તરીકે વપરાય છે. કયા દ્રશ્ય અવલોકન રજૂ કરે છે. છબી વિશ્લેષણ અને અર્થઘટન અન્ય પગલું ઉપયોગી માહિતી કાઢવા માટે છબીને જરૂરી છે. માનવ દ્રશ્ય સિસ્ટમ સામાન્ય અર્થમાં રિમોટ સેન્સીંગ સિસ્ટમ એક ઉદાહરણ છે."
            {
            if readSound.isPaused
            {
                readSound.continueSpeaking()
            }
            if readSound.pauseSpeaking(at: AVSpeechBoundary.immediate)
            {
                readSound.continueSpeaking()
                
            }
            let utterance = AVSpeechUtterance(string: LAN_TEXT_GUJ)
            utterance.voice = AVSpeechSynthesisVoice(language: "en")
            utterance.preUtteranceDelay = 1.0
            
            readSound = AVSpeechSynthesizer()
            readSound.delegate = self
            readSound.speak(utterance)
        }
        if  txtView.text == LAN_TEXT_FRENCH
        {
            if readSound.isPaused
            {
                readSound.continueSpeaking()
            }
            if readSound.pauseSpeaking(at: AVSpeechBoundary.immediate)
            {
                readSound.continueSpeaking()
                
            }
            
            let utterance = AVSpeechUtterance(string: txtView.text)
            utterance.voice = AVSpeechSynthesisVoice(language: "fr-ca")
            utterance.preUtteranceDelay = 1.0
            
            readSound = AVSpeechSynthesizer()
            readSound.delegate = self
            readSound.speak(utterance)
        }
        }
        
        if StickerPopUp.isHidden == false
        {
            if readSound.isSpeaking
            {
                print("is speaking")
                return
            }
      if TextPSLV.text == STICKER_PSLV_ENG
      {
        if readSound.isPaused
        {
            readSound.continueSpeaking()
        }
        if readSound.pauseSpeaking(at: AVSpeechBoundary.immediate)
        {
            readSound.continueSpeaking()
            
        }
        
        let utterance = AVSpeechUtterance(string: speak_eng)
     //   let utterance_gslv = AVSpeechUtterance(string: TextGSLV.text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en")
      //  utterance_gslv.voice = AVSpeechSynthesisVoice(language: "en")
        utterance.preUtteranceDelay = 1.0
      //  utterance_gslv.preUtteranceDelay = 1.0
        readSound = AVSpeechSynthesizer()
        readSound.delegate = self
    
        readSound.speak(utterance)
    
        
     //   readSound.speak(utterance_gslv)
        
        }
            if TextPSLV.text == STICKER_PSLV_HINDI
            {
                if readSound.isPaused
                {
                    readSound.continueSpeaking()
                }
                if readSound.pauseSpeaking(at: AVSpeechBoundary.immediate)
                {
                    readSound.continueSpeaking()
                    
                }
                let utterance = AVSpeechUtterance(string: speak_hindi)
                utterance.voice = AVSpeechSynthesisVoice(language: "hi")
                utterance.preUtteranceDelay = 1.0
                
                readSound = AVSpeechSynthesizer()
                readSound.delegate = self
                readSound.speak(utterance)
            }
            
            if TextPSLV.text == STICKER_PSLV_GUJ
            {
                if readSound.isPaused
                {
                    readSound.continueSpeaking()
                }
                if readSound.pauseSpeaking(at: AVSpeechBoundary.immediate)
                {
                    readSound.continueSpeaking()
                    
                }
                let utterance = AVSpeechUtterance(string: speak_guj)
                utterance.voice = AVSpeechSynthesisVoice(language: "en")
                utterance.preUtteranceDelay = 1.0
                
                readSound = AVSpeechSynthesizer()
                readSound.delegate = self
                readSound.speak(utterance)
            }
            if TextPSLV.text == STICKER_PSLV_FRENCH
            {
                if readSound.isPaused
                {
                    readSound.continueSpeaking()
                }
                if readSound.pauseSpeaking(at: AVSpeechBoundary.immediate)
                {
                    readSound.continueSpeaking()
                    
                }
                let utterance = AVSpeechUtterance(string: speak_french)
                utterance.voice = AVSpeechSynthesisVoice(language: "fr-ca")
                utterance.preUtteranceDelay = 1.0
                
                readSound = AVSpeechSynthesizer()
                readSound.delegate = self
                readSound.speak(utterance)
            }
            

        }
    }
    @IBAction func btnCloseTapped(_ sender: UIButton) {
        //   self.view.resignFirstResponder()
        
        readSound.stopSpeaking(at : AVSpeechBoundary.immediate)
        
        if readSound.isSpeaking
        {
            readSound.stopSpeaking(at: AVSpeechBoundary.immediate
            )
        }
        
        btnMenuButton.target = revealViewController()
        btnMenuButton.action = #selector(SWRevealViewController.revealToggle(_:))
        
        self.view.willRemoveSubview(popUp)
        
       self.view.willRemoveSubview(StickerPopUp)
        
            Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(waitForPopUp), userInfo: nil, repeats: false)
        
    }
    func waitForPopUp(){
     
        locationManager.stopRangingBeacons(in: Bregion)
        locationManager.stopRangingBeacons(in: StickerRegion)
        self.view.willRemoveSubview(popUp)

     }

    @IBAction func InfoButton(_ sender: Any) {
        
        self.view.addSubview(InfoPopUp)
        InfoPopUp.isHidden = false
        navigationController?.isNavigationBarHidden = true

    }
    @IBAction func OkButton(_ sender: Any) {
        
        // InfoPopUp.isHidden = true
self.view.willRemoveSubview(InfoPopUp)
        btnMenuButton.target = revealViewController()
        btnMenuButton.action = #selector(SWRevealViewController.revealToggle(_:))
        

    }
}
