@implementation SUCoreUpdate

+ (id)_generateStateTable
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  void *v298;
  void *v299;
  void *v300;
  void *v301;
  void *v302;
  void *v303;
  void *v304;
  void *v305;
  void *v306;
  void *v307;
  void *v308;
  void *v309;
  void *v310;
  void *v311;
  void *v312;
  void *v313;
  void *v314;
  void *v315;
  void *v316;
  void *v317;
  void *v318;
  void *v319;
  void *v320;
  void *v321;
  void *v322;
  void *v323;
  void *v324;
  void *v325;
  void *v326;
  void *v327;
  void *v328;
  void *v329;
  void *v330;
  void *v331;
  void *v332;
  void *v333;
  void *v334;
  void *v335;
  void *v336;
  void *v337;
  void *v338;
  void *v339;
  void *v340;
  void *v341;
  void *v342;
  void *v343;
  void *v344;
  void *v345;
  void *v346;
  void *v347;
  void *v348;
  void *v349;
  void *v350;
  void *v351;
  void *v352;
  void *v353;
  void *v354;
  void *v355;
  void *v356;
  void *v357;
  void *v358;
  void *v359;
  void *v360;
  void *v361;
  void *v362;
  void *v363;
  void *v364;
  void *v365;
  void *v366;
  void *v367;
  void *v368;
  void *v369;
  void *v370;
  void *v371;
  void *v372;
  void *v373;
  void *v374;
  void *v375;
  void *v376;
  void *v377;
  void *v378;
  void *v379;
  void *v380;
  void *v381;
  void *v382;
  void *v383;
  void *v384;
  void *v385;
  void *v386;
  void *v387;
  void *v388;
  void *v389;
  void *v390;
  void *v391;
  void *v392;
  void *v393;
  void *v394;
  void *v395;
  void *v396;
  void *v397;
  void *v398;
  void *v399;
  void *v400;
  void *v401;
  void *v402;
  void *v403;
  void *v404;
  void *v405;
  void *v406;
  void *v407;
  void *v408;
  void *v409;
  void *v410;
  void *v411;
  void *v412;
  void *v413;
  void *v414;
  void *v415;
  void *v416;
  void *v417;
  void *v418;
  void *v419;
  void *v420;
  void *v421;
  void *v422;
  void *v423;
  void *v424;
  void *v425;
  void *v426;
  void *v427;
  void *v428;
  void *v429;
  void *v430;
  void *v431;
  void *v432;
  void *v433;
  void *v434;
  void *v435;
  void *v436;
  void *v437;
  void *v438;
  void *v439;
  void *v440;
  void *v441;
  void *v442;
  void *v443;
  void *v444;
  void *v445;
  void *v446;
  void *v447;
  void *v448;
  void *v449;
  void *v450;
  void *v451;
  void *v452;
  void *v453;
  void *v454;
  void *v455;
  void *v456;
  void *v457;
  void *v458;
  void *v459;
  void *v460;
  void *v461;
  void *v462;
  void *v463;
  void *v464;
  void *v465;
  void *v466;
  void *v467;
  void *v468;
  void *v469;
  void *v470;
  void *v471;
  void *v472;
  void *v473;
  void *v474;
  void *v475;
  void *v476;
  void *v477;
  void *v478;
  void *v479;
  void *v480;
  void *v481;
  void *v482;
  void *v483;
  void *v484;
  void *v485;
  void *v486;
  void *v487;
  void *v488;
  void *v489;
  void *v490;
  void *v491;
  void *v492;
  void *v493;
  void *v494;
  void *v495;
  void *v496;
  void *v497;
  void *v498;
  void *v499;
  void *v500;
  void *v501;
  void *v502;
  void *v503;
  void *v504;
  void *v505;
  void *v506;
  void *v507;
  void *v508;
  void *v509;
  void *v510;
  void *v511;
  void *v512;
  void *v513;
  void *v514;
  void *v515;
  void *v516;
  void *v517;
  void *v518;
  void *v519;
  void *v520;
  void *v521;
  void *v522;
  void *v523;
  void *v524;
  void *v525;
  void *v526;
  void *v527;
  void *v528;
  void *v529;
  void *v530;
  void *v531;
  void *v532;
  void *v533;
  void *v534;
  uint64_t v535;
  void *v536;
  void *v537;
  void *v538;
  void *v539;
  void *v540;
  void *v541;
  void *v542;
  void *v543;
  void *v544;
  void *v545;
  void *v546;
  void *v547;
  void *v548;
  void *v549;
  void *v550;
  void *v551;
  void *v552;
  void *v553;
  void *v554;
  void *v555;
  void *v556;
  void *v557;
  void *v558;
  void *v559;
  void *v560;
  void *v561;
  void *v562;
  void *v563;
  void *v564;
  void *v565;
  void *v566;
  void *v567;
  void *v568;
  void *v569;
  void *v570;
  void *v571;
  void *v572;
  void *v573;
  void *v574;
  void *v575;
  void *v576;
  void *v577;
  void *v578;
  void *v579;
  void *v580;
  _QWORD v581[2];
  _QWORD v582[2];
  _QWORD v583[2];
  _QWORD v584[2];
  _QWORD v585[2];
  _QWORD v586[2];
  _QWORD v587[2];
  _QWORD v588[2];
  uint64_t v589;
  const __CFString *v590;
  uint64_t v591;
  const __CFString *v592;
  uint64_t v593;
  const __CFString *v594;
  uint64_t v595;
  const __CFString *v596;
  uint64_t v597;
  const __CFString *v598;
  uint64_t v599;
  const __CFString *v600;
  uint64_t v601;
  const __CFString *v602;
  _QWORD v603[11];
  _QWORD v604[11];
  _QWORD v605[2];
  _QWORD v606[2];
  _QWORD v607[2];
  _QWORD v608[2];
  _QWORD v609[2];
  _QWORD v610[2];
  uint64_t v611;
  const __CFString *v612;
  _QWORD v613[2];
  _QWORD v614[2];
  uint64_t v615;
  const __CFString *v616;
  uint64_t v617;
  const __CFString *v618;
  uint64_t v619;
  const __CFString *v620;
  uint64_t v621;
  const __CFString *v622;
  uint64_t v623;
  const __CFString *v624;
  uint64_t v625;
  const __CFString *v626;
  uint64_t v627;
  const __CFString *v628;
  _QWORD v629[12];
  _QWORD v630[12];
  _QWORD v631[2];
  _QWORD v632[2];
  _QWORD v633[2];
  _QWORD v634[2];
  _QWORD v635[2];
  _QWORD v636[2];
  _QWORD v637[2];
  _QWORD v638[2];
  uint64_t v639;
  const __CFString *v640;
  _QWORD v641[2];
  _QWORD v642[2];
  uint64_t v643;
  const __CFString *v644;
  uint64_t v645;
  const __CFString *v646;
  uint64_t v647;
  const __CFString *v648;
  uint64_t v649;
  const __CFString *v650;
  uint64_t v651;
  const __CFString *v652;
  uint64_t v653;
  const __CFString *v654;
  uint64_t v655;
  const __CFString *v656;
  _QWORD v657[13];
  _QWORD v658[13];
  _QWORD v659[2];
  _QWORD v660[2];
  _QWORD v661[2];
  _QWORD v662[2];
  _QWORD v663[2];
  _QWORD v664[2];
  _QWORD v665[2];
  _QWORD v666[2];
  _QWORD v667[2];
  _QWORD v668[2];
  uint64_t v669;
  const __CFString *v670;
  uint64_t v671;
  const __CFString *v672;
  _QWORD v673[2];
  _QWORD v674[2];
  uint64_t v675;
  const __CFString *v676;
  uint64_t v677;
  const __CFString *v678;
  uint64_t v679;
  const __CFString *v680;
  uint64_t v681;
  const __CFString *v682;
  uint64_t v683;
  const __CFString *v684;
  uint64_t v685;
  const __CFString *v686;
  uint64_t v687;
  const __CFString *v688;
  _QWORD v689[15];
  _QWORD v690[15];
  _QWORD v691[2];
  _QWORD v692[2];
  _QWORD v693[2];
  _QWORD v694[2];
  _QWORD v695[2];
  _QWORD v696[2];
  _QWORD v697[2];
  _QWORD v698[2];
  _QWORD v699[2];
  _QWORD v700[2];
  _QWORD v701[2];
  _QWORD v702[2];
  _QWORD v703[2];
  _QWORD v704[2];
  uint64_t v705;
  const __CFString *v706;
  uint64_t v707;
  const __CFString *v708;
  uint64_t v709;
  const __CFString *v710;
  uint64_t v711;
  const __CFString *v712;
  uint64_t v713;
  const __CFString *v714;
  uint64_t v715;
  const __CFString *v716;
  uint64_t v717;
  const __CFString *v718;
  _QWORD v719[14];
  _QWORD v720[14];
  _QWORD v721[2];
  _QWORD v722[2];
  _QWORD v723[2];
  _QWORD v724[2];
  uint64_t v725;
  const __CFString *v726;
  uint64_t v727;
  const __CFString *v728;
  uint64_t v729;
  const __CFString *v730;
  uint64_t v731;
  const __CFString *v732;
  uint64_t v733;
  const __CFString *v734;
  uint64_t v735;
  const __CFString *v736;
  uint64_t v737;
  const __CFString *v738;
  uint64_t v739;
  const __CFString *v740;
  uint64_t v741;
  const __CFString *v742;
  _QWORD v743[11];
  _QWORD v744[11];
  _QWORD v745[2];
  _QWORD v746[2];
  _QWORD v747[2];
  _QWORD v748[2];
  _QWORD v749[2];
  _QWORD v750[2];
  _QWORD v751[2];
  _QWORD v752[2];
  _QWORD v753[2];
  _QWORD v754[2];
  _QWORD v755[2];
  _QWORD v756[2];
  uint64_t v757;
  const __CFString *v758;
  uint64_t v759;
  const __CFString *v760;
  uint64_t v761;
  const __CFString *v762;
  uint64_t v763;
  const __CFString *v764;
  uint64_t v765;
  const __CFString *v766;
  uint64_t v767;
  const __CFString *v768;
  uint64_t v769;
  const __CFString *v770;
  uint64_t v771;
  const __CFString *v772;
  _QWORD v773[14];
  _QWORD v774[14];
  _QWORD v775[2];
  _QWORD v776[2];
  _QWORD v777[2];
  _QWORD v778[2];
  _QWORD v779[2];
  _QWORD v780[2];
  _QWORD v781[2];
  _QWORD v782[2];
  _QWORD v783[2];
  _QWORD v784[2];
  _QWORD v785[2];
  _QWORD v786[2];
  _QWORD v787[2];
  _QWORD v788[2];
  uint64_t v789;
  const __CFString *v790;
  uint64_t v791;
  const __CFString *v792;
  uint64_t v793;
  const __CFString *v794;
  uint64_t v795;
  const __CFString *v796;
  uint64_t v797;
  uint64_t v798;
  uint64_t v799;
  uint64_t v800;
  uint64_t v801;
  uint64_t v802;
  uint64_t v803;
  uint64_t v804;
  uint64_t v805;
  const __CFString *v806;
  uint64_t v807;
  const __CFString *v808;
  uint64_t v809;
  const __CFString *v810;
  uint64_t v811;
  const __CFString *v812;
  uint64_t v813;
  const __CFString *v814;
  uint64_t v815;
  const __CFString *v816;
  uint64_t v817;
  const __CFString *v818;
  uint64_t v819;
  uint64_t v820;
  _QWORD v821[2];
  _QWORD v822[2];
  _QWORD v823[2];
  _QWORD v824[2];
  _QWORD v825[2];
  _QWORD v826[2];
  _QWORD v827[2];
  _QWORD v828[2];
  uint64_t v829;
  uint64_t v830;
  uint64_t v831;
  const __CFString *v832;
  uint64_t v833;
  const __CFString *v834;
  uint64_t v835;
  const __CFString *v836;
  uint64_t v837;
  const __CFString *v838;
  uint64_t v839;
  const __CFString *v840;
  uint64_t v841;
  const __CFString *v842;
  uint64_t v843;
  const __CFString *v844;
  uint64_t v845;
  const __CFString *v846;
  _QWORD v847[36];
  _QWORD v848[36];
  _QWORD v849[2];
  _QWORD v850[2];
  _QWORD v851[2];
  _QWORD v852[2];
  _QWORD v853[2];
  _QWORD v854[2];
  _QWORD v855[2];
  _QWORD v856[2];
  uint64_t v857;
  uint64_t v858;
  uint64_t v859;
  uint64_t v860;
  uint64_t v861;
  uint64_t v862;
  uint64_t v863;
  uint64_t v864;
  uint64_t v865;
  const __CFString *v866;
  uint64_t v867;
  const __CFString *v868;
  uint64_t v869;
  const __CFString *v870;
  uint64_t v871;
  const __CFString *v872;
  uint64_t v873;
  const __CFString *v874;
  uint64_t v875;
  const __CFString *v876;
  uint64_t v877;
  const __CFString *v878;
  uint64_t v879;
  uint64_t v880;
  _QWORD v881[2];
  _QWORD v882[2];
  _QWORD v883[2];
  _QWORD v884[2];
  _QWORD v885[2];
  _QWORD v886[2];
  _QWORD v887[2];
  _QWORD v888[2];
  uint64_t v889;
  uint64_t v890;
  uint64_t v891;
  const __CFString *v892;
  uint64_t v893;
  const __CFString *v894;
  uint64_t v895;
  const __CFString *v896;
  uint64_t v897;
  const __CFString *v898;
  uint64_t v899;
  const __CFString *v900;
  uint64_t v901;
  const __CFString *v902;
  uint64_t v903;
  const __CFString *v904;
  uint64_t v905;
  const __CFString *v906;
  _QWORD v907[29];
  _QWORD v908[29];
  _QWORD v909[2];
  _QWORD v910[2];
  _QWORD v911[2];
  _QWORD v912[2];
  _QWORD v913[2];
  _QWORD v914[2];
  _QWORD v915[2];
  _QWORD v916[2];
  _QWORD v917[2];
  _QWORD v918[2];
  _QWORD v919[2];
  _QWORD v920[2];
  _QWORD v921[2];
  _QWORD v922[2];
  uint64_t v923;
  const __CFString *v924;
  _QWORD v925[2];
  _QWORD v926[2];
  _QWORD v927[2];
  _QWORD v928[2];
  _QWORD v929[2];
  _QWORD v930[2];
  uint64_t v931;
  const __CFString *v932;
  uint64_t v933;
  const __CFString *v934;
  uint64_t v935;
  const __CFString *v936;
  uint64_t v937;
  uint64_t v938;
  uint64_t v939;
  uint64_t v940;
  uint64_t v941;
  uint64_t v942;
  uint64_t v943;
  uint64_t v944;
  uint64_t v945;
  uint64_t v946;
  _QWORD v947[19];
  _QWORD v948[19];
  _QWORD v949[2];
  _QWORD v950[2];
  _QWORD v951[2];
  _QWORD v952[2];
  uint64_t v953;
  const __CFString *v954;
  uint64_t v955;
  const __CFString *v956;
  uint64_t v957;
  const __CFString *v958;
  uint64_t v959;
  const __CFString *v960;
  uint64_t v961;
  uint64_t v962;
  uint64_t v963;
  const __CFString *v964;
  uint64_t v965;
  const __CFString *v966;
  uint64_t v967;
  const __CFString *v968;
  uint64_t v969;
  const __CFString *v970;
  _QWORD v971[11];
  _QWORD v972[11];
  uint64_t v973;
  const __CFString *v974;
  uint64_t v975;
  const __CFString *v976;
  uint64_t v977;
  const __CFString *v978;
  uint64_t v979;
  const __CFString *v980;
  uint64_t v981;
  const __CFString *v982;
  uint64_t v983;
  const __CFString *v984;
  uint64_t v985;
  const __CFString *v986;
  uint64_t v987;
  const __CFString *v988;
  _QWORD v989[8];
  _QWORD v990[8];
  _QWORD v991[2];
  _QWORD v992[2];
  _QWORD v993[2];
  _QWORD v994[2];
  uint64_t v995;
  const __CFString *v996;
  uint64_t v997;
  const __CFString *v998;
  uint64_t v999;
  const __CFString *v1000;
  uint64_t v1001;
  const __CFString *v1002;
  uint64_t v1003;
  const __CFString *v1004;
  uint64_t v1005;
  const __CFString *v1006;
  uint64_t v1007;
  const __CFString *v1008;
  uint64_t v1009;
  const __CFString *v1010;
  uint64_t v1011;
  const __CFString *v1012;
  _QWORD v1013[11];
  _QWORD v1014[11];
  _QWORD v1015[2];
  _QWORD v1016[2];
  _QWORD v1017[2];
  _QWORD v1018[2];
  _QWORD v1019[2];
  _QWORD v1020[2];
  _QWORD v1021[2];
  _QWORD v1022[2];
  _QWORD v1023[2];
  _QWORD v1024[2];
  _QWORD v1025[2];
  _QWORD v1026[2];
  _QWORD v1027[2];
  _QWORD v1028[2];
  uint64_t v1029;
  const __CFString *v1030;
  _QWORD v1031[2];
  _QWORD v1032[2];
  _QWORD v1033[2];
  _QWORD v1034[2];
  _QWORD v1035[2];
  _QWORD v1036[2];
  _QWORD v1037[2];
  _QWORD v1038[2];
  uint64_t v1039;
  const __CFString *v1040;
  uint64_t v1041;
  const __CFString *v1042;
  uint64_t v1043;
  const __CFString *v1044;
  uint64_t v1045;
  const __CFString *v1046;
  uint64_t v1047;
  const __CFString *v1048;
  uint64_t v1049;
  const __CFString *v1050;
  uint64_t v1051;
  const __CFString *v1052;
  uint64_t v1053;
  const __CFString *v1054;
  uint64_t v1055;
  const __CFString *v1056;
  _QWORD v1057[21];
  _QWORD v1058[21];
  _QWORD v1059[2];
  _QWORD v1060[2];
  _QWORD v1061[2];
  _QWORD v1062[2];
  _QWORD v1063[2];
  _QWORD v1064[2];
  _QWORD v1065[2];
  _QWORD v1066[2];
  _QWORD v1067[2];
  _QWORD v1068[2];
  _QWORD v1069[2];
  _QWORD v1070[2];
  _QWORD v1071[2];
  _QWORD v1072[2];
  uint64_t v1073;
  const __CFString *v1074;
  _QWORD v1075[2];
  _QWORD v1076[2];
  _QWORD v1077[2];
  _QWORD v1078[2];
  uint64_t v1079;
  const __CFString *v1080;
  uint64_t v1081;
  const __CFString *v1082;
  uint64_t v1083;
  const __CFString *v1084;
  _QWORD v1085[2];
  _QWORD v1086[2];
  uint64_t v1087;
  const __CFString *v1088;
  uint64_t v1089;
  const __CFString *v1090;
  uint64_t v1091;
  const __CFString *v1092;
  uint64_t v1093;
  const __CFString *v1094;
  _QWORD v1095[18];
  _QWORD v1096[18];
  _QWORD v1097[2];
  _QWORD v1098[2];
  _QWORD v1099[2];
  _QWORD v1100[2];
  _QWORD v1101[2];
  _QWORD v1102[2];
  _QWORD v1103[2];
  _QWORD v1104[2];
  _QWORD v1105[2];
  _QWORD v1106[2];
  _QWORD v1107[2];
  _QWORD v1108[2];
  _QWORD v1109[2];
  _QWORD v1110[2];
  _QWORD v1111[2];
  _QWORD v1112[2];
  _QWORD v1113[2];
  _QWORD v1114[2];
  _QWORD v1115[2];
  _QWORD v1116[2];
  uint64_t v1117;
  const __CFString *v1118;
  _QWORD v1119[2];
  _QWORD v1120[2];
  _QWORD v1121[2];
  _QWORD v1122[2];
  _QWORD v1123[2];
  _QWORD v1124[2];
  uint64_t v1125;
  const __CFString *v1126;
  uint64_t v1127;
  const __CFString *v1128;
  uint64_t v1129;
  const __CFString *v1130;
  uint64_t v1131;
  const __CFString *v1132;
  uint64_t v1133;
  const __CFString *v1134;
  uint64_t v1135;
  const __CFString *v1136;
  _QWORD v1137[20];
  _QWORD v1138[20];
  _QWORD v1139[2];
  _QWORD v1140[2];
  _QWORD v1141[2];
  _QWORD v1142[2];
  _QWORD v1143[2];
  _QWORD v1144[2];
  _QWORD v1145[2];
  _QWORD v1146[2];
  _QWORD v1147[2];
  _QWORD v1148[2];
  _QWORD v1149[2];
  _QWORD v1150[2];
  _QWORD v1151[2];
  _QWORD v1152[2];
  uint64_t v1153;
  const __CFString *v1154;
  _QWORD v1155[2];
  _QWORD v1156[2];
  _QWORD v1157[2];
  _QWORD v1158[2];
  _QWORD v1159[2];
  _QWORD v1160[2];
  _QWORD v1161[2];
  _QWORD v1162[2];
  _QWORD v1163[2];
  _QWORD v1164[2];
  _QWORD v1165[2];
  _QWORD v1166[2];
  uint64_t v1167;
  const __CFString *v1168;
  uint64_t v1169;
  const __CFString *v1170;
  uint64_t v1171;
  const __CFString *v1172;
  uint64_t v1173;
  const __CFString *v1174;
  uint64_t v1175;
  const __CFString *v1176;
  uint64_t v1177;
  const __CFString *v1178;
  uint64_t v1179;
  const __CFString *v1180;
  uint64_t v1181;
  const __CFString *v1182;
  uint64_t v1183;
  const __CFString *v1184;
  _QWORD v1185[23];
  _QWORD v1186[23];
  _QWORD v1187[2];
  _QWORD v1188[2];
  _QWORD v1189[2];
  _QWORD v1190[2];
  _QWORD v1191[2];
  _QWORD v1192[2];
  _QWORD v1193[2];
  _QWORD v1194[2];
  _QWORD v1195[2];
  _QWORD v1196[2];
  _QWORD v1197[2];
  _QWORD v1198[2];
  _QWORD v1199[2];
  _QWORD v1200[2];
  _QWORD v1201[2];
  _QWORD v1202[2];
  _QWORD v1203[2];
  _QWORD v1204[2];
  _QWORD v1205[2];
  _QWORD v1206[2];
  _QWORD v1207[2];
  _QWORD v1208[2];
  _QWORD v1209[2];
  _QWORD v1210[2];
  _QWORD v1211[2];
  _QWORD v1212[2];
  _QWORD v1213[2];
  _QWORD v1214[2];
  _QWORD v1215[2];
  _QWORD v1216[2];
  uint64_t v1217;
  const __CFString *v1218;
  uint64_t v1219;
  const __CFString *v1220;
  _QWORD v1221[2];
  _QWORD v1222[2];
  uint64_t v1223;
  const __CFString *v1224;
  uint64_t v1225;
  const __CFString *v1226;
  uint64_t v1227;
  const __CFString *v1228;
  uint64_t v1229;
  const __CFString *v1230;
  uint64_t v1231;
  const __CFString *v1232;
  uint64_t v1233;
  const __CFString *v1234;
  uint64_t v1235;
  const __CFString *v1236;
  _QWORD v1237[25];
  _QWORD v1238[25];
  _QWORD v1239[2];
  _QWORD v1240[2];
  _QWORD v1241[2];
  _QWORD v1242[2];
  _QWORD v1243[2];
  _QWORD v1244[2];
  _QWORD v1245[2];
  _QWORD v1246[2];
  _QWORD v1247[2];
  _QWORD v1248[2];
  _QWORD v1249[2];
  _QWORD v1250[2];
  _QWORD v1251[2];
  _QWORD v1252[2];
  _QWORD v1253[2];
  _QWORD v1254[2];
  _QWORD v1255[2];
  _QWORD v1256[2];
  _QWORD v1257[2];
  _QWORD v1258[2];
  _QWORD v1259[2];
  _QWORD v1260[2];
  _QWORD v1261[2];
  _QWORD v1262[2];
  _QWORD v1263[2];
  _QWORD v1264[2];
  _QWORD v1265[2];
  _QWORD v1266[2];
  _QWORD v1267[2];
  _QWORD v1268[2];
  _QWORD v1269[2];
  _QWORD v1270[2];
  uint64_t v1271;
  const __CFString *v1272;
  uint64_t v1273;
  const __CFString *v1274;
  uint64_t v1275;
  const __CFString *v1276;
  uint64_t v1277;
  const __CFString *v1278;
  uint64_t v1279;
  const __CFString *v1280;
  uint64_t v1281;
  const __CFString *v1282;
  uint64_t v1283;
  const __CFString *v1284;
  _QWORD v1285[23];
  _QWORD v1286[23];
  _QWORD v1287[2];
  _QWORD v1288[2];
  _QWORD v1289[2];
  _QWORD v1290[2];
  _QWORD v1291[2];
  _QWORD v1292[2];
  _QWORD v1293[2];
  _QWORD v1294[2];
  _QWORD v1295[2];
  _QWORD v1296[2];
  _QWORD v1297[2];
  _QWORD v1298[2];
  _QWORD v1299[2];
  _QWORD v1300[2];
  _QWORD v1301[2];
  _QWORD v1302[2];
  _QWORD v1303[2];
  _QWORD v1304[2];
  _QWORD v1305[2];
  _QWORD v1306[2];
  _QWORD v1307[2];
  _QWORD v1308[2];
  _QWORD v1309[2];
  _QWORD v1310[2];
  _QWORD v1311[2];
  _QWORD v1312[2];
  _QWORD v1313[2];
  _QWORD v1314[2];
  _QWORD v1315[2];
  _QWORD v1316[2];
  _QWORD v1317[2];
  _QWORD v1318[2];
  _QWORD v1319[2];
  _QWORD v1320[2];
  uint64_t v1321;
  const __CFString *v1322;
  uint64_t v1323;
  const __CFString *v1324;
  uint64_t v1325;
  const __CFString *v1326;
  uint64_t v1327;
  uint64_t v1328;
  _QWORD v1329[2];
  _QWORD v1330[2];
  _QWORD v1331[2];
  _QWORD v1332[2];
  uint64_t v1333;
  const __CFString *v1334;
  uint64_t v1335;
  const __CFString *v1336;
  uint64_t v1337;
  const __CFString *v1338;
  uint64_t v1339;
  const __CFString *v1340;
  uint64_t v1341;
  const __CFString *v1342;
  uint64_t v1343;
  const __CFString *v1344;
  uint64_t v1345;
  const __CFString *v1346;
  _QWORD v1347[30];
  _QWORD v1348[30];
  _QWORD v1349[2];
  _QWORD v1350[2];
  _QWORD v1351[2];
  _QWORD v1352[2];
  _QWORD v1353[2];
  _QWORD v1354[2];
  _QWORD v1355[2];
  _QWORD v1356[2];
  _QWORD v1357[2];
  _QWORD v1358[2];
  _QWORD v1359[2];
  _QWORD v1360[2];
  _QWORD v1361[2];
  _QWORD v1362[2];
  _QWORD v1363[2];
  _QWORD v1364[2];
  _QWORD v1365[2];
  _QWORD v1366[2];
  _QWORD v1367[2];
  _QWORD v1368[2];
  _QWORD v1369[2];
  _QWORD v1370[2];
  _QWORD v1371[2];
  _QWORD v1372[2];
  _QWORD v1373[2];
  _QWORD v1374[2];
  _QWORD v1375[2];
  _QWORD v1376[2];
  _QWORD v1377[2];
  _QWORD v1378[2];
  _QWORD v1379[2];
  _QWORD v1380[2];
  _QWORD v1381[2];
  _QWORD v1382[2];
  uint64_t v1383;
  const __CFString *v1384;
  uint64_t v1385;
  const __CFString *v1386;
  uint64_t v1387;
  const __CFString *v1388;
  _QWORD v1389[2];
  _QWORD v1390[2];
  uint64_t v1391;
  const __CFString *v1392;
  _QWORD v1393[2];
  _QWORD v1394[2];
  uint64_t v1395;
  const __CFString *v1396;
  uint64_t v1397;
  const __CFString *v1398;
  uint64_t v1399;
  const __CFString *v1400;
  uint64_t v1401;
  const __CFString *v1402;
  uint64_t v1403;
  const __CFString *v1404;
  uint64_t v1405;
  const __CFString *v1406;
  uint64_t v1407;
  const __CFString *v1408;
  _QWORD v1409[30];
  _QWORD v1410[30];
  _QWORD v1411[2];
  _QWORD v1412[2];
  _QWORD v1413[2];
  _QWORD v1414[2];
  _QWORD v1415[2];
  _QWORD v1416[2];
  _QWORD v1417[2];
  _QWORD v1418[2];
  _QWORD v1419[2];
  _QWORD v1420[2];
  _QWORD v1421[2];
  _QWORD v1422[2];
  _QWORD v1423[2];
  _QWORD v1424[2];
  uint64_t v1425;
  const __CFString *v1426;
  _QWORD v1427[2];
  _QWORD v1428[2];
  _QWORD v1429[2];
  _QWORD v1430[2];
  _QWORD v1431[2];
  _QWORD v1432[2];
  _QWORD v1433[2];
  _QWORD v1434[2];
  _QWORD v1435[2];
  _QWORD v1436[2];
  _QWORD v1437[2];
  _QWORD v1438[2];
  _QWORD v1439[2];
  _QWORD v1440[2];
  _QWORD v1441[2];
  _QWORD v1442[2];
  _QWORD v1443[2];
  _QWORD v1444[2];
  _QWORD v1445[2];
  _QWORD v1446[2];
  _QWORD v1447[2];
  _QWORD v1448[2];
  uint64_t v1449;
  const __CFString *v1450;
  uint64_t v1451;
  const __CFString *v1452;
  uint64_t v1453;
  const __CFString *v1454;
  uint64_t v1455;
  const __CFString *v1456;
  uint64_t v1457;
  const __CFString *v1458;
  uint64_t v1459;
  const __CFString *v1460;
  uint64_t v1461;
  const __CFString *v1462;
  uint64_t v1463;
  const __CFString *v1464;
  uint64_t v1465;
  const __CFString *v1466;
  _QWORD v1467[28];
  _QWORD v1468[28];
  _QWORD v1469[2];
  _QWORD v1470[2];
  _QWORD v1471[2];
  _QWORD v1472[2];
  _QWORD v1473[2];
  _QWORD v1474[2];
  _QWORD v1475[2];
  _QWORD v1476[2];
  _QWORD v1477[2];
  _QWORD v1478[2];
  _QWORD v1479[2];
  _QWORD v1480[2];
  _QWORD v1481[2];
  _QWORD v1482[2];
  _QWORD v1483[2];
  _QWORD v1484[2];
  _QWORD v1485[2];
  _QWORD v1486[2];
  _QWORD v1487[2];
  _QWORD v1488[2];
  _QWORD v1489[2];
  _QWORD v1490[2];
  uint64_t v1491;
  const __CFString *v1492;
  _QWORD v1493[2];
  _QWORD v1494[2];
  uint64_t v1495;
  const __CFString *v1496;
  uint64_t v1497;
  const __CFString *v1498;
  uint64_t v1499;
  const __CFString *v1500;
  uint64_t v1501;
  const __CFString *v1502;
  uint64_t v1503;
  const __CFString *v1504;
  _QWORD v1505[18];
  _QWORD v1506[18];
  _QWORD v1507[2];
  _QWORD v1508[2];
  _QWORD v1509[2];
  _QWORD v1510[2];
  _QWORD v1511[2];
  _QWORD v1512[2];
  _QWORD v1513[2];
  _QWORD v1514[2];
  _QWORD v1515[2];
  _QWORD v1516[2];
  _QWORD v1517[2];
  _QWORD v1518[2];
  _QWORD v1519[2];
  _QWORD v1520[2];
  _QWORD v1521[2];
  _QWORD v1522[2];
  _QWORD v1523[2];
  _QWORD v1524[2];
  uint64_t v1525;
  const __CFString *v1526;
  _QWORD v1527[2];
  _QWORD v1528[2];
  _QWORD v1529[2];
  _QWORD v1530[2];
  _QWORD v1531[2];
  _QWORD v1532[2];
  _QWORD v1533[2];
  _QWORD v1534[2];
  _QWORD v1535[2];
  _QWORD v1536[2];
  _QWORD v1537[2];
  _QWORD v1538[2];
  _QWORD v1539[2];
  _QWORD v1540[2];
  _QWORD v1541[2];
  _QWORD v1542[2];
  _QWORD v1543[2];
  _QWORD v1544[2];
  _QWORD v1545[2];
  _QWORD v1546[2];
  uint64_t v1547;
  const __CFString *v1548;
  uint64_t v1549;
  const __CFString *v1550;
  uint64_t v1551;
  const __CFString *v1552;
  uint64_t v1553;
  const __CFString *v1554;
  uint64_t v1555;
  const __CFString *v1556;
  uint64_t v1557;
  const __CFString *v1558;
  uint64_t v1559;
  const __CFString *v1560;
  uint64_t v1561;
  const __CFString *v1562;
  uint64_t v1563;
  const __CFString *v1564;
  uint64_t v1565;
  const __CFString *v1566;
  uint64_t v1567;
  const __CFString *v1568;
  _QWORD v1569[31];
  _QWORD v1570[31];
  _QWORD v1571[2];
  _QWORD v1572[2];
  _QWORD v1573[2];
  _QWORD v1574[2];
  _QWORD v1575[2];
  _QWORD v1576[2];
  _QWORD v1577[2];
  _QWORD v1578[2];
  _QWORD v1579[2];
  _QWORD v1580[2];
  _QWORD v1581[2];
  _QWORD v1582[2];
  _QWORD v1583[2];
  _QWORD v1584[2];
  _QWORD v1585[2];
  _QWORD v1586[2];
  _QWORD v1587[2];
  _QWORD v1588[2];
  _QWORD v1589[2];
  _QWORD v1590[2];
  _QWORD v1591[2];
  _QWORD v1592[2];
  _QWORD v1593[2];
  _QWORD v1594[2];
  _QWORD v1595[2];
  _QWORD v1596[2];
  uint64_t v1597;
  const __CFString *v1598;
  _QWORD v1599[2];
  _QWORD v1600[2];
  uint64_t v1601;
  const __CFString *v1602;
  uint64_t v1603;
  const __CFString *v1604;
  uint64_t v1605;
  const __CFString *v1606;
  uint64_t v1607;
  const __CFString *v1608;
  uint64_t v1609;
  const __CFString *v1610;
  _QWORD v1611[20];
  _QWORD v1612[20];
  _QWORD v1613[2];
  _QWORD v1614[2];
  _QWORD v1615[2];
  _QWORD v1616[2];
  _QWORD v1617[2];
  _QWORD v1618[2];
  _QWORD v1619[2];
  _QWORD v1620[2];
  _QWORD v1621[2];
  _QWORD v1622[2];
  _QWORD v1623[2];
  _QWORD v1624[2];
  _QWORD v1625[2];
  _QWORD v1626[2];
  _QWORD v1627[2];
  _QWORD v1628[2];
  _QWORD v1629[2];
  _QWORD v1630[2];
  _QWORD v1631[2];
  _QWORD v1632[2];
  _QWORD v1633[2];
  _QWORD v1634[2];
  _QWORD v1635[2];
  _QWORD v1636[2];
  _QWORD v1637[2];
  _QWORD v1638[2];
  _QWORD v1639[2];
  _QWORD v1640[2];
  uint64_t v1641;
  const __CFString *v1642;
  uint64_t v1643;
  const __CFString *v1644;
  uint64_t v1645;
  const __CFString *v1646;
  uint64_t v1647;
  const __CFString *v1648;
  uint64_t v1649;
  const __CFString *v1650;
  uint64_t v1651;
  const __CFString *v1652;
  uint64_t v1653;
  const __CFString *v1654;
  uint64_t v1655;
  const __CFString *v1656;
  uint64_t v1657;
  const __CFString *v1658;
  uint64_t v1659;
  const __CFString *v1660;
  uint64_t v1661;
  const __CFString *v1662;
  uint64_t v1663;
  const __CFString *v1664;
  _QWORD v1665[26];
  _QWORD v1666[26];
  _QWORD v1667[2];
  _QWORD v1668[2];
  _QWORD v1669[2];
  _QWORD v1670[2];
  _QWORD v1671[2];
  _QWORD v1672[2];
  _QWORD v1673[2];
  _QWORD v1674[2];
  _QWORD v1675[2];
  _QWORD v1676[2];
  _QWORD v1677[2];
  _QWORD v1678[2];
  _QWORD v1679[2];
  _QWORD v1680[2];
  _QWORD v1681[2];
  _QWORD v1682[2];
  _QWORD v1683[2];
  _QWORD v1684[2];
  _QWORD v1685[2];
  _QWORD v1686[2];
  _QWORD v1687[2];
  _QWORD v1688[2];
  _QWORD v1689[2];
  _QWORD v1690[2];
  _QWORD v1691[2];
  _QWORD v1692[2];
  _QWORD v1693[2];
  _QWORD v1694[2];
  _QWORD v1695[2];
  _QWORD v1696[2];
  _QWORD v1697[2];
  _QWORD v1698[2];
  _QWORD v1699[2];
  _QWORD v1700[2];
  _QWORD v1701[2];
  _QWORD v1702[2];
  _QWORD v1703[2];
  _QWORD v1704[2];
  _QWORD v1705[2];
  _QWORD v1706[2];
  _QWORD v1707[2];
  _QWORD v1708[2];
  uint64_t v1709;
  const __CFString *v1710;
  uint64_t v1711;
  const __CFString *v1712;
  uint64_t v1713;
  const __CFString *v1714;
  uint64_t v1715;
  const __CFString *v1716;
  uint64_t v1717;
  const __CFString *v1718;
  uint64_t v1719;
  const __CFString *v1720;
  uint64_t v1721;
  const __CFString *v1722;
  uint64_t v1723;
  const __CFString *v1724;
  _QWORD v1725[29];
  _QWORD v1726[29];
  _QWORD v1727[27];
  _QWORD v1728[29];

  v1728[27] = *MEMORY[0x1E0C80C00];
  v1727[0] = CFSTR("ReadyToBegin");
  v1725[0] = CFSTR("TargetBrainLoaded");
  v1723 = *MEMORY[0x1E0DA8990];
  v2 = v1723;
  v1724 = CFSTR("DecideLoadBrain");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1724, &v1723, 1);
  v513 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[0] = v513;
  v1725[1] = CFSTR("TargetDownloadPreflighted");
  v1721 = v2;
  v1722 = CFSTR("DecideLoadBrain");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1722, &v1721, 1);
  v512 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[1] = v512;
  v1725[2] = CFSTR("TargetDownloaded");
  v1719 = v2;
  v1720 = CFSTR("DecideLoadBrain");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1720, &v1719, 1);
  v511 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[2] = v511;
  v1725[3] = CFSTR("TargetPrepared");
  v1717 = v2;
  v1718 = CFSTR("DecideLoadBrain");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1718, &v1717, 1);
  v510 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[3] = v510;
  v1725[4] = CFSTR("TargetApplied");
  v1715 = v2;
  v1716 = CFSTR("DecideLoadBrain");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1716, &v1715, 1);
  v509 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[4] = v509;
  v1725[5] = CFSTR("TargetRollback");
  v1713 = v2;
  v1714 = CFSTR("DecideBeginRollback");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1714, &v1713, 1);
  v508 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[5] = v508;
  v1725[6] = CFSTR("ResumeCurrentUpdate");
  v1711 = v2;
  v1712 = CFSTR("ReportAnomalyAPIEnd");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1712, &v1711, 1);
  v507 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[6] = v507;
  v1725[7] = CFSTR("CancelCurrentUpdate");
  v1709 = v2;
  v1710 = CFSTR("ReportCanceled");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1710, &v1709, 1);
  v506 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[7] = v506;
  v1725[8] = CFSTR("PerformLoadBrain");
  v1707[0] = *MEMORY[0x1E0DA8B88];
  v3 = v1707[0];
  v1707[1] = v2;
  v1708[0] = CFSTR("LoadingBrain");
  v1708[1] = CFSTR("LoadBrain");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1708, v1707, 2);
  v505 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[8] = v505;
  v1725[9] = CFSTR("BrainLoadSuccessAtTarget");
  v1705[0] = v3;
  v1705[1] = v2;
  v1706[0] = CFSTR("BrainLoaded");
  v1706[1] = CFSTR("ReportBrainLoadSuccess");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1706, v1705, 2);
  v504 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[9] = v504;
  v1725[10] = CFSTR("PerformPreflightDownloadSU");
  v1703[0] = v3;
  v1703[1] = v2;
  v1704[0] = CFSTR("PreflightingDownloadSU");
  v1704[1] = CFSTR("PreflightDownloadSU");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1704, v1703, 2);
  v503 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[10] = v503;
  v1725[11] = CFSTR("PreflightSuccessAtTarget");
  v1701[0] = v3;
  v1701[1] = v2;
  v1702[0] = CFSTR("SUDownloadPreflighted");
  v1702[1] = CFSTR("ReportDownloadPreflighted");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1702, v1701, 2);
  v502 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[11] = v502;
  v1725[12] = CFSTR("PerformDownloadSpaceCheck");
  v1699[0] = v3;
  v1699[1] = v2;
  v1700[0] = CFSTR("CheckingSpaceForInstall");
  v1700[1] = CFSTR("CheckSpace");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1700, v1699, 2);
  v501 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[12] = v501;
  v1725[13] = CFSTR("PerformDownloadSU");
  v1697[0] = v3;
  v1697[1] = v2;
  v1698[0] = CFSTR("DownloadingSU");
  v1698[1] = CFSTR("DownloadSU");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1698, v1697, 2);
  v500 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[13] = v500;
  v1725[14] = CFSTR("DownloadSuccessAtTarget");
  v1695[0] = v3;
  v1695[1] = v2;
  v1696[0] = CFSTR("SUDownloaded");
  v1696[1] = CFSTR("ReportSUDownloaded");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1696, v1695, 2);
  v499 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[14] = v499;
  v1725[15] = CFSTR("PerformPrepare");
  v1693[0] = v3;
  v1693[1] = v2;
  v1694[0] = CFSTR("Preparing");
  v1694[1] = CFSTR("PrepareUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1694, v1693, 2);
  v498 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[15] = v498;
  v1725[16] = CFSTR("PerformSuspend");
  v1691[0] = v3;
  v1691[1] = v2;
  v1692[0] = CFSTR("Suspending");
  v1692[1] = CFSTR("SuspendUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1692, v1691, 2);
  v497 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[16] = v497;
  v1725[17] = CFSTR("SuspendSuccessAtTarget");
  v1689[0] = v3;
  v1689[1] = v2;
  v1690[0] = CFSTR("Prepared");
  v1690[1] = CFSTR("ReportPrepared");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1690, v1689, 2);
  v496 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[17] = v496;
  v1725[18] = CFSTR("PerformResume");
  v1687[0] = v3;
  v1687[1] = v2;
  v1688[0] = CFSTR("Resuming");
  v1688[1] = CFSTR("ResumeUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1688, v1687, 2);
  v495 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[18] = v495;
  v1725[19] = CFSTR("ResumeSuccessAtTarget");
  v1685[0] = v3;
  v1685[1] = v2;
  v1686[0] = CFSTR("Prepared");
  v1686[1] = CFSTR("ReportPrepared");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1686, v1685, 2);
  v494 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[19] = v494;
  v1725[20] = CFSTR("PerformApply");
  v1683[0] = v3;
  v1683[1] = v2;
  v1684[0] = CFSTR("Applying");
  v1684[1] = CFSTR("ApplyUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1684, v1683, 2);
  v493 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[20] = v493;
  v1725[21] = CFSTR("ApplySuccess");
  v1681[0] = v3;
  v1681[1] = v2;
  v1682[0] = CFSTR("AwaitingReboot");
  v1682[1] = CFSTR("ReportApplied");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1682, v1681, 2);
  v492 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[21] = v492;
  v1725[22] = CFSTR("RB_BeginRollback");
  v1679[0] = v3;
  v1679[1] = v2;
  v1680[0] = CFSTR("RB_ReadyToBegin");
  v1680[1] = CFSTR("LoadBrainRollback");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1680, v1679, 2);
  v491 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[22] = v491;
  v1725[23] = CFSTR("RB_PerformLoadBrain");
  v1677[0] = v3;
  v1677[1] = v2;
  v1678[0] = CFSTR("RB_LoadingBrain");
  v1678[1] = CFSTR("LoadBrain");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1678, v1677, 2);
  v490 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[23] = v490;
  v1725[24] = CFSTR("RB_PerformRollbackPrepare");
  v1675[0] = v3;
  v1675[1] = v2;
  v1676[0] = CFSTR("RB_RollingBackPrepare");
  v1676[1] = CFSTR("RollbackUpdatePrepare");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1676, v1675, 2);
  v489 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[24] = v489;
  v1725[25] = CFSTR("RB_PerformRollbackSuspend");
  v1673[0] = v3;
  v1673[1] = v2;
  v1674[0] = CFSTR("RB_RollingBackSuspend");
  v1674[1] = CFSTR("RollbackUpdateSuspend");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1674, v1673, 2);
  v488 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[25] = v488;
  v1725[26] = CFSTR("RB_PerformRollbackResume");
  v1671[0] = v3;
  v1671[1] = v2;
  v1672[0] = CFSTR("RB_RollingBackResume");
  v1672[1] = CFSTR("RollbackUpdateResume");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1672, v1671, 2);
  v487 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[26] = v487;
  v1725[27] = CFSTR("RB_PerformRollbackApply");
  v1669[0] = v3;
  v1669[1] = v2;
  v1670[0] = CFSTR("RB_RollingBackApply");
  v1670[1] = CFSTR("RollbackUpdateApply");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1670, v1669, 2);
  v486 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[27] = v486;
  v1725[28] = CFSTR("RB_RollbackAppleSuccess");
  v1667[0] = v3;
  v1667[1] = v2;
  v1668[0] = CFSTR("AwaitingReboot");
  v1668[1] = CFSTR("ReportRollbackSucceeded");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1668, v1667, 2);
  v485 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[28] = v485;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1726, v1725, 29);
  v484 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[0] = v484;
  v1727[1] = CFSTR("LoadingBrain");
  v1665[0] = CFSTR("TargetBrainLoaded");
  v1663 = v2;
  v1664 = CFSTR("UpdateTarget");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1664, &v1663, 1);
  v483 = (void *)objc_claimAutoreleasedReturnValue();
  v1666[0] = v483;
  v1665[1] = CFSTR("TargetDownloadPreflighted");
  v1661 = v2;
  v1662 = CFSTR("UpdateTarget");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1662, &v1661, 1);
  v482 = (void *)objc_claimAutoreleasedReturnValue();
  v1666[1] = v482;
  v1665[2] = CFSTR("TargetDownloaded");
  v1659 = v2;
  v1660 = CFSTR("UpdateTarget");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1660, &v1659, 1);
  v481 = (void *)objc_claimAutoreleasedReturnValue();
  v1666[2] = v481;
  v1665[3] = CFSTR("TargetPrepared");
  v1657 = v2;
  v1658 = CFSTR("UpdateTarget");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1658, &v1657, 1);
  v480 = (void *)objc_claimAutoreleasedReturnValue();
  v1666[3] = v480;
  v1665[4] = CFSTR("TargetApplied");
  v1655 = v2;
  v1656 = CFSTR("UpdateTarget");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1656, &v1655, 1);
  v479 = (void *)objc_claimAutoreleasedReturnValue();
  v1666[4] = v479;
  v1665[5] = CFSTR("TargetRollback");
  v1653 = v3;
  v1654 = CFSTR("RB_LoadingBrain");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1654, &v1653, 1);
  v478 = (void *)objc_claimAutoreleasedReturnValue();
  v1666[5] = v478;
  v1665[6] = CFSTR("ResumeCurrentUpdate");
  v1651 = v2;
  v1652 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1652, &v1651, 1);
  v477 = (void *)objc_claimAutoreleasedReturnValue();
  v1666[6] = v477;
  v1665[7] = CFSTR("CancelCurrentUpdate");
  v1649 = v3;
  v1650 = CFSTR("Canceling");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1650, &v1649, 1);
  v476 = (void *)objc_claimAutoreleasedReturnValue();
  v1666[7] = v476;
  v1665[8] = CFSTR("BrainLoadProgress");
  v1647 = v2;
  v1648 = CFSTR("ReportBrainLoadProgress");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1648, &v1647, 1);
  v475 = (void *)objc_claimAutoreleasedReturnValue();
  v1666[8] = v475;
  v1665[9] = CFSTR("BrainLoadSuccess");
  v1645 = v2;
  v1646 = CFSTR("AdvanceBrainLoadSuccess");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1646, &v1645, 1);
  v474 = (void *)objc_claimAutoreleasedReturnValue();
  v1666[9] = v474;
  v1665[10] = CFSTR("BrainLoadFailed");
  v1643 = v2;
  v1644 = CFSTR("ChooseErrorSpaceCheck");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1644, &v1643, 1);
  v473 = (void *)objc_claimAutoreleasedReturnValue();
  v1666[10] = v473;
  v1665[11] = CFSTR("BrainLoadSuccessAtTarget");
  v1641 = v3;
  v1642 = CFSTR("BrainLoaded");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1642, &v1641, 1);
  v472 = (void *)objc_claimAutoreleasedReturnValue();
  v1666[11] = v472;
  v1665[12] = CFSTR("PerformPreflightDownloadSU");
  v1639[0] = v3;
  v1639[1] = v2;
  v1640[0] = CFSTR("PreflightingDownloadSU");
  v1640[1] = CFSTR("PreflightDownloadSU");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1640, v1639, 2);
  v471 = (void *)objc_claimAutoreleasedReturnValue();
  v1666[12] = v471;
  v1665[13] = CFSTR("PreflightSuccessAtTarget");
  v1637[0] = v3;
  v1637[1] = v2;
  v1638[0] = CFSTR("SUDownloadPreflighted");
  v1638[1] = CFSTR("ReportDownloadPreflighted");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1638, v1637, 2);
  v470 = (void *)objc_claimAutoreleasedReturnValue();
  v1666[13] = v470;
  v1665[14] = CFSTR("PerformDownloadSpaceCheck");
  v1635[0] = v3;
  v1635[1] = v2;
  v1636[0] = CFSTR("CheckingSpaceForInstall");
  v1636[1] = CFSTR("CheckSpace");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1636, v1635, 2);
  v469 = (void *)objc_claimAutoreleasedReturnValue();
  v1666[14] = v469;
  v1665[15] = CFSTR("PerformDownloadSU");
  v1633[0] = v3;
  v1633[1] = v2;
  v1634[0] = CFSTR("DownloadingSU");
  v1634[1] = CFSTR("DownloadSU");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1634, v1633, 2);
  v468 = (void *)objc_claimAutoreleasedReturnValue();
  v1666[15] = v468;
  v1665[16] = CFSTR("DownloadSuccessAtTarget");
  v1631[0] = v3;
  v1631[1] = v2;
  v1632[0] = CFSTR("SUDownloaded");
  v1632[1] = CFSTR("ReportSUDownloaded");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1632, v1631, 2);
  v467 = (void *)objc_claimAutoreleasedReturnValue();
  v1666[16] = v467;
  v1665[17] = CFSTR("PerformPrepare");
  v1629[0] = v3;
  v1629[1] = v2;
  v1630[0] = CFSTR("Preparing");
  v1630[1] = CFSTR("PrepareUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1630, v1629, 2);
  v466 = (void *)objc_claimAutoreleasedReturnValue();
  v1666[17] = v466;
  v1665[18] = CFSTR("PerformSuspend");
  v1627[0] = v3;
  v1627[1] = v2;
  v1628[0] = CFSTR("Suspending");
  v1628[1] = CFSTR("SuspendUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1628, v1627, 2);
  v465 = (void *)objc_claimAutoreleasedReturnValue();
  v1666[18] = v465;
  v1665[19] = CFSTR("SuspendSuccessAtTarget");
  v1625[0] = v3;
  v1625[1] = v2;
  v1626[0] = CFSTR("Prepared");
  v1626[1] = CFSTR("ReportPrepared");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1626, v1625, 2);
  v464 = (void *)objc_claimAutoreleasedReturnValue();
  v1666[19] = v464;
  v1665[20] = CFSTR("PerformResume");
  v1623[0] = v3;
  v1623[1] = v2;
  v1624[0] = CFSTR("Resuming");
  v1624[1] = CFSTR("ResumeUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1624, v1623, 2);
  v463 = (void *)objc_claimAutoreleasedReturnValue();
  v1666[20] = v463;
  v1665[21] = CFSTR("ResumeSuccessAtTarget");
  v1621[0] = v3;
  v1621[1] = v2;
  v1622[0] = CFSTR("Prepared");
  v1622[1] = CFSTR("ReportPrepared");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1622, v1621, 2);
  v462 = (void *)objc_claimAutoreleasedReturnValue();
  v1666[21] = v462;
  v1665[22] = CFSTR("PerformApply");
  v1619[0] = v3;
  v1619[1] = v2;
  v1620[0] = CFSTR("Applying");
  v1620[1] = CFSTR("ApplyUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1620, v1619, 2);
  v461 = (void *)objc_claimAutoreleasedReturnValue();
  v1666[22] = v461;
  v1665[23] = CFSTR("ApplySuccess");
  v1617[0] = v3;
  v1617[1] = v2;
  v1618[0] = CFSTR("AwaitingReboot");
  v1618[1] = CFSTR("ReportApplied");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1618, v1617, 2);
  v460 = (void *)objc_claimAutoreleasedReturnValue();
  v1666[23] = v460;
  v1665[24] = CFSTR("PerformErrorSpaceCheck");
  v1615[0] = v3;
  v1615[1] = v2;
  v1616[0] = CFSTR("CheckingSpaceAfterError");
  v1616[1] = CFSTR("CheckSpace");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1616, v1615, 2);
  v459 = (void *)objc_claimAutoreleasedReturnValue();
  v1666[24] = v459;
  v1665[25] = CFSTR("SkipErrorSpaceCheck");
  v1613[0] = v3;
  v1613[1] = v2;
  v1614[0] = CFSTR("ReadyToBegin");
  v1614[1] = CFSTR("ReportAttemptFailure");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1614, v1613, 2);
  v458 = (void *)objc_claimAutoreleasedReturnValue();
  v1666[25] = v458;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1666, v1665, 26);
  v457 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[1] = v457;
  v1727[2] = CFSTR("BrainLoaded");
  v1611[0] = CFSTR("TargetBrainLoaded");
  v1609 = v2;
  v1610 = CFSTR("UpdateTarget");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1610, &v1609, 1);
  v456 = (void *)objc_claimAutoreleasedReturnValue();
  v1612[0] = v456;
  v1611[1] = CFSTR("TargetDownloadPreflighted");
  v1607 = v2;
  v1608 = CFSTR("DecidePreflightDownloadSU");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1608, &v1607, 1);
  v455 = (void *)objc_claimAutoreleasedReturnValue();
  v1612[1] = v455;
  v1611[2] = CFSTR("TargetDownloaded");
  v1605 = v2;
  v1606 = CFSTR("DecidePreflightDownloadSU");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1606, &v1605, 1);
  v454 = (void *)objc_claimAutoreleasedReturnValue();
  v1612[2] = v454;
  v1611[3] = CFSTR("TargetPrepared");
  v1603 = v2;
  v1604 = CFSTR("DecidePreflightDownloadSU");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1604, &v1603, 1);
  v453 = (void *)objc_claimAutoreleasedReturnValue();
  v1612[3] = v453;
  v1611[4] = CFSTR("TargetApplied");
  v1601 = v2;
  v1602 = CFSTR("DecidePreflightDownloadSU");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1602, &v1601, 1);
  v452 = (void *)objc_claimAutoreleasedReturnValue();
  v1612[4] = v452;
  v1611[5] = CFSTR("TargetRollback");
  v1599[0] = v3;
  v1599[1] = v2;
  v1600[0] = CFSTR("RB_BrainLoaded");
  v1600[1] = CFSTR("DecideBeginRollback");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1600, v1599, 2);
  v451 = (void *)objc_claimAutoreleasedReturnValue();
  v1612[5] = v451;
  v1611[6] = CFSTR("ResumeCurrentUpdate");
  v1597 = v2;
  v1598 = CFSTR("ReportAnomalyAPIEnd");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1598, &v1597, 1);
  v450 = (void *)objc_claimAutoreleasedReturnValue();
  v1612[6] = v450;
  v1611[7] = CFSTR("CancelCurrentUpdate");
  v1595[0] = v3;
  v1595[1] = v2;
  v1596[0] = CFSTR("ReadyToBegin");
  v1596[1] = CFSTR("ReportCanceled");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1596, v1595, 2);
  v449 = (void *)objc_claimAutoreleasedReturnValue();
  v1612[7] = v449;
  v1611[8] = CFSTR("PerformPreflightDownloadSU");
  v1593[0] = v3;
  v1593[1] = v2;
  v1594[0] = CFSTR("PreflightingDownloadSU");
  v1594[1] = CFSTR("PreflightDownloadSU");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1594, v1593, 2);
  v448 = (void *)objc_claimAutoreleasedReturnValue();
  v1612[8] = v448;
  v1611[9] = CFSTR("PreflightSuccessAtTarget");
  v1591[0] = v3;
  v1591[1] = v2;
  v1592[0] = CFSTR("SUDownloadPreflighted");
  v1592[1] = CFSTR("ReportDownloadPreflighted");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1592, v1591, 2);
  v447 = (void *)objc_claimAutoreleasedReturnValue();
  v1612[9] = v447;
  v1611[10] = CFSTR("PerformDownloadSpaceCheck");
  v1589[0] = v3;
  v1589[1] = v2;
  v1590[0] = CFSTR("CheckingSpaceForInstall");
  v1590[1] = CFSTR("CheckSpace");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1590, v1589, 2);
  v446 = (void *)objc_claimAutoreleasedReturnValue();
  v1612[10] = v446;
  v1611[11] = CFSTR("PerformDownloadSU");
  v1587[0] = v3;
  v1587[1] = v2;
  v1588[0] = CFSTR("DownloadingSU");
  v1588[1] = CFSTR("DownloadSU");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1588, v1587, 2);
  v445 = (void *)objc_claimAutoreleasedReturnValue();
  v1612[11] = v445;
  v1611[12] = CFSTR("DownloadSuccessAtTarget");
  v1585[0] = v3;
  v1585[1] = v2;
  v1586[0] = CFSTR("SUDownloaded");
  v1586[1] = CFSTR("ReportSUDownloaded");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1586, v1585, 2);
  v444 = (void *)objc_claimAutoreleasedReturnValue();
  v1612[12] = v444;
  v1611[13] = CFSTR("PerformPrepare");
  v1583[0] = v3;
  v1583[1] = v2;
  v1584[0] = CFSTR("Preparing");
  v1584[1] = CFSTR("PrepareUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1584, v1583, 2);
  v443 = (void *)objc_claimAutoreleasedReturnValue();
  v1612[13] = v443;
  v1611[14] = CFSTR("PerformSuspend");
  v1581[0] = v3;
  v1581[1] = v2;
  v1582[0] = CFSTR("Suspending");
  v1582[1] = CFSTR("SuspendUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1582, v1581, 2);
  v442 = (void *)objc_claimAutoreleasedReturnValue();
  v1612[14] = v442;
  v1611[15] = CFSTR("SuspendSuccessAtTarget");
  v1579[0] = v3;
  v1579[1] = v2;
  v1580[0] = CFSTR("Prepared");
  v1580[1] = CFSTR("ReportPrepared");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1580, v1579, 2);
  v441 = (void *)objc_claimAutoreleasedReturnValue();
  v1612[15] = v441;
  v1611[16] = CFSTR("PerformResume");
  v1577[0] = v3;
  v1577[1] = v2;
  v1578[0] = CFSTR("Resuming");
  v1578[1] = CFSTR("ResumeUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1578, v1577, 2);
  v440 = (void *)objc_claimAutoreleasedReturnValue();
  v1612[16] = v440;
  v1611[17] = CFSTR("ResumeSuccessAtTarget");
  v1575[0] = v3;
  v1575[1] = v2;
  v1576[0] = CFSTR("Prepared");
  v1576[1] = CFSTR("ReportPrepared");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1576, v1575, 2);
  v439 = (void *)objc_claimAutoreleasedReturnValue();
  v1612[17] = v439;
  v1611[18] = CFSTR("PerformApply");
  v1573[0] = v3;
  v1573[1] = v2;
  v1574[0] = CFSTR("Applying");
  v1574[1] = CFSTR("ApplyUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1574, v1573, 2);
  v438 = (void *)objc_claimAutoreleasedReturnValue();
  v1612[18] = v438;
  v1611[19] = CFSTR("ApplySuccess");
  v1571[0] = v3;
  v1571[1] = v2;
  v1572[0] = CFSTR("AwaitingReboot");
  v1572[1] = CFSTR("ReportApplied");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1572, v1571, 2);
  v437 = (void *)objc_claimAutoreleasedReturnValue();
  v1612[19] = v437;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1612, v1611, 20);
  v436 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[2] = v436;
  v1727[3] = CFSTR("PreflightingDownloadSU");
  v1569[0] = CFSTR("TargetBrainLoaded");
  v1567 = v2;
  v1568 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1568, &v1567, 1);
  v435 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[0] = v435;
  v1569[1] = CFSTR("TargetDownloadPreflighted");
  v1565 = v2;
  v1566 = CFSTR("UpdateTarget");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1566, &v1565, 1);
  v434 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[1] = v434;
  v1569[2] = CFSTR("TargetDownloaded");
  v1563 = v2;
  v1564 = CFSTR("UpdateTarget");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1564, &v1563, 1);
  v433 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[2] = v433;
  v1569[3] = CFSTR("TargetPrepared");
  v1561 = v2;
  v1562 = CFSTR("UpdateTarget");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1562, &v1561, 1);
  v432 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[3] = v432;
  v1569[4] = CFSTR("TargetApplied");
  v1559 = v2;
  v1560 = CFSTR("UpdateTarget");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1560, &v1559, 1);
  v431 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[4] = v431;
  v1569[5] = CFSTR("TargetRollback");
  v1557 = v2;
  v1558 = CFSTR("DecideCancelBeforeRollback");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1558, &v1557, 1);
  v430 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[5] = v430;
  v1569[6] = CFSTR("ResumeCurrentUpdate");
  v1555 = v2;
  v1556 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1556, &v1555, 1);
  v429 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[6] = v429;
  v1569[7] = CFSTR("CancelCurrentUpdate");
  v1553 = v3;
  v1554 = CFSTR("Canceling");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1554, &v1553, 1);
  v428 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[7] = v428;
  v1569[8] = CFSTR("PreflightSuccess");
  v1551 = v2;
  v1552 = CFSTR("AdvanceDownloadPreflighted");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1552, &v1551, 1);
  v427 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[8] = v427;
  v1569[9] = CFSTR("PreflightFailed");
  v1549 = v2;
  v1550 = CFSTR("ChooseErrorSpaceCheck");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1550, &v1549, 1);
  v426 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[9] = v426;
  v1569[10] = CFSTR("PreflightSuccessAtTarget");
  v1547 = v3;
  v1548 = CFSTR("SUDownloadPreflighted");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1548, &v1547, 1);
  v425 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[10] = v425;
  v1569[11] = CFSTR("PerformDownloadSpaceCheck");
  v1545[0] = v3;
  v1545[1] = v2;
  v1546[0] = CFSTR("CheckingSpaceForInstall");
  v1546[1] = CFSTR("CheckSpace");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1546, v1545, 2);
  v424 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[11] = v424;
  v1569[12] = CFSTR("PerformDownloadSU");
  v1543[0] = v3;
  v1543[1] = v2;
  v1544[0] = CFSTR("DownloadingSU");
  v1544[1] = CFSTR("DownloadSU");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1544, v1543, 2);
  v423 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[12] = v423;
  v1569[13] = CFSTR("DownloadSuccessAtTarget");
  v1541[0] = v3;
  v1541[1] = v2;
  v1542[0] = CFSTR("SUDownloaded");
  v1542[1] = CFSTR("ReportSUDownloaded");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1542, v1541, 2);
  v422 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[13] = v422;
  v1569[14] = CFSTR("PerformPrepare");
  v1539[0] = v3;
  v1539[1] = v2;
  v1540[0] = CFSTR("Preparing");
  v1540[1] = CFSTR("PrepareUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1540, v1539, 2);
  v421 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[14] = v421;
  v1569[15] = CFSTR("PerformSuspend");
  v1537[0] = v3;
  v1537[1] = v2;
  v1538[0] = CFSTR("Suspending");
  v1538[1] = CFSTR("SuspendUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1538, v1537, 2);
  v420 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[15] = v420;
  v1569[16] = CFSTR("SuspendSuccessAtTarget");
  v1535[0] = v3;
  v1535[1] = v2;
  v1536[0] = CFSTR("Prepared");
  v1536[1] = CFSTR("ReportPrepared");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1536, v1535, 2);
  v419 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[16] = v419;
  v1569[17] = CFSTR("PerformResume");
  v1533[0] = v3;
  v1533[1] = v2;
  v1534[0] = CFSTR("Resuming");
  v1534[1] = CFSTR("ResumeUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1534, v1533, 2);
  v418 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[17] = v418;
  v1569[18] = CFSTR("ResumeSuccessAtTarget");
  v1531[0] = v3;
  v1531[1] = v2;
  v1532[0] = CFSTR("Prepared");
  v1532[1] = CFSTR("ReportPrepared");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1532, v1531, 2);
  v417 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[18] = v417;
  v1569[19] = CFSTR("PerformApply");
  v1529[0] = v3;
  v1529[1] = v2;
  v1530[0] = CFSTR("Applying");
  v1530[1] = CFSTR("ApplyUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1530, v1529, 2);
  v416 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[19] = v416;
  v1569[20] = CFSTR("ApplySuccess");
  v1527[0] = v3;
  v1527[1] = v2;
  v1528[0] = CFSTR("AwaitingReboot");
  v1528[1] = CFSTR("ReportApplied");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1528, v1527, 2);
  v415 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[20] = v415;
  v1569[21] = CFSTR("RB_CancelNonRollbackUpdate");
  v1525 = v3;
  v1526 = CFSTR("RB_Canceling");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1526, &v1525, 1);
  v414 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[21] = v414;
  v1569[22] = CFSTR("RB_BeginRollback");
  v1523[0] = v3;
  v1523[1] = v2;
  v1524[0] = CFSTR("RB_ReadyToBegin");
  v1524[1] = CFSTR("LoadBrainRollback");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1524, v1523, 2);
  v413 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[22] = v413;
  v1569[23] = CFSTR("RB_PerformLoadBrain");
  v1521[0] = v3;
  v1521[1] = v2;
  v1522[0] = CFSTR("RB_LoadingBrain");
  v1522[1] = CFSTR("LoadBrain");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1522, v1521, 2);
  v412 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[23] = v412;
  v1569[24] = CFSTR("RB_PerformRollbackPrepare");
  v1519[0] = v3;
  v1519[1] = v2;
  v1520[0] = CFSTR("RB_RollingBackPrepare");
  v1520[1] = CFSTR("RollbackUpdatePrepare");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1520, v1519, 2);
  v411 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[24] = v411;
  v1569[25] = CFSTR("RB_PerformRollbackSuspend");
  v1517[0] = v3;
  v1517[1] = v2;
  v1518[0] = CFSTR("RB_RollingBackSuspend");
  v1518[1] = CFSTR("RollbackUpdateSuspend");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1518, v1517, 2);
  v410 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[25] = v410;
  v1569[26] = CFSTR("RB_PerformRollbackResume");
  v1515[0] = v3;
  v1515[1] = v2;
  v1516[0] = CFSTR("RB_RollingBackResume");
  v1516[1] = CFSTR("RollbackUpdateResume");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1516, v1515, 2);
  v409 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[26] = v409;
  v1569[27] = CFSTR("RB_PerformRollbackApply");
  v1513[0] = v3;
  v1513[1] = v2;
  v1514[0] = CFSTR("RB_RollingBackApply");
  v1514[1] = CFSTR("RollbackUpdateApply");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1514, v1513, 2);
  v408 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[27] = v408;
  v1569[28] = CFSTR("RB_RollbackAppleSuccess");
  v1511[0] = v3;
  v1511[1] = v2;
  v1512[0] = CFSTR("AwaitingReboot");
  v1512[1] = CFSTR("ReportRollbackSucceeded");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1512, v1511, 2);
  v407 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[28] = v407;
  v1569[29] = CFSTR("PerformErrorSpaceCheck");
  v1509[0] = v3;
  v1509[1] = v2;
  v1510[0] = CFSTR("CheckingSpaceAfterError");
  v1510[1] = CFSTR("CheckSpace");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1510, v1509, 2);
  v406 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[29] = v406;
  v1569[30] = CFSTR("SkipErrorSpaceCheck");
  v1507[0] = v3;
  v1507[1] = v2;
  v1508[0] = CFSTR("ReadyToBegin");
  v1508[1] = CFSTR("ReportAttemptFailure");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1508, v1507, 2);
  v405 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[30] = v405;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1570, v1569, 31);
  v404 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[3] = v404;
  v1727[4] = CFSTR("SUDownloadPreflighted");
  v1505[0] = CFSTR("TargetBrainLoaded");
  v1503 = v2;
  v1504 = CFSTR("ReportAnomalyAPIEnd");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1504, &v1503, 1);
  v403 = (void *)objc_claimAutoreleasedReturnValue();
  v1506[0] = v403;
  v1505[1] = CFSTR("TargetDownloadPreflighted");
  v1501 = v2;
  v1502 = CFSTR("UpdateTarget");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1502, &v1501, 1);
  v402 = (void *)objc_claimAutoreleasedReturnValue();
  v1506[1] = v402;
  v1505[2] = CFSTR("TargetDownloaded");
  v1499 = v2;
  v1500 = CFSTR("DecideDownloadSpaceCheck");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1500, &v1499, 1);
  v401 = (void *)objc_claimAutoreleasedReturnValue();
  v1506[2] = v401;
  v1505[3] = CFSTR("TargetPrepared");
  v1497 = v2;
  v1498 = CFSTR("DecideDownloadSpaceCheck");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1498, &v1497, 1);
  v400 = (void *)objc_claimAutoreleasedReturnValue();
  v1506[3] = v400;
  v1505[4] = CFSTR("TargetApplied");
  v1495 = v2;
  v1496 = CFSTR("DecideDownloadSpaceCheck");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1496, &v1495, 1);
  v399 = (void *)objc_claimAutoreleasedReturnValue();
  v1506[4] = v399;
  v1505[5] = CFSTR("TargetRollback");
  v1493[0] = v3;
  v1493[1] = v2;
  v1494[0] = CFSTR("RB_ReadyToBegin");
  v1494[1] = CFSTR("LoadBrainRollback");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1494, v1493, 2);
  v398 = (void *)objc_claimAutoreleasedReturnValue();
  v1506[5] = v398;
  v1505[6] = CFSTR("ResumeCurrentUpdate");
  v1491 = v2;
  v1492 = CFSTR("ReportAnomalyAPIEnd");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1492, &v1491, 1);
  v397 = (void *)objc_claimAutoreleasedReturnValue();
  v1506[6] = v397;
  v1505[7] = CFSTR("CancelCurrentUpdate");
  v1489[0] = v3;
  v1489[1] = v2;
  v1490[0] = CFSTR("ReadyToBegin");
  v1490[1] = CFSTR("ReportCanceled");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1490, v1489, 2);
  v396 = (void *)objc_claimAutoreleasedReturnValue();
  v1506[7] = v396;
  v1505[8] = CFSTR("PerformDownloadSpaceCheck");
  v1487[0] = v3;
  v1487[1] = v2;
  v1488[0] = CFSTR("CheckingSpaceForInstall");
  v1488[1] = CFSTR("CheckSpace");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1488, v1487, 2);
  v395 = (void *)objc_claimAutoreleasedReturnValue();
  v1506[8] = v395;
  v1505[9] = CFSTR("PerformDownloadSU");
  v1485[0] = v3;
  v1485[1] = v2;
  v1486[0] = CFSTR("DownloadingSU");
  v1486[1] = CFSTR("DownloadSU");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1486, v1485, 2);
  v394 = (void *)objc_claimAutoreleasedReturnValue();
  v1506[9] = v394;
  v1505[10] = CFSTR("DownloadSuccessAtTarget");
  v1483[0] = v3;
  v1483[1] = v2;
  v1484[0] = CFSTR("SUDownloaded");
  v1484[1] = CFSTR("ReportSUDownloaded");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1484, v1483, 2);
  v393 = (void *)objc_claimAutoreleasedReturnValue();
  v1506[10] = v393;
  v1505[11] = CFSTR("PerformPrepare");
  v1481[0] = v3;
  v1481[1] = v2;
  v1482[0] = CFSTR("Preparing");
  v1482[1] = CFSTR("PrepareUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1482, v1481, 2);
  v392 = (void *)objc_claimAutoreleasedReturnValue();
  v1506[11] = v392;
  v1505[12] = CFSTR("PerformSuspend");
  v1479[0] = v3;
  v1479[1] = v2;
  v1480[0] = CFSTR("Suspending");
  v1480[1] = CFSTR("SuspendUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1480, v1479, 2);
  v391 = (void *)objc_claimAutoreleasedReturnValue();
  v1506[12] = v391;
  v1505[13] = CFSTR("SuspendSuccessAtTarget");
  v1477[0] = v3;
  v1477[1] = v2;
  v1478[0] = CFSTR("Prepared");
  v1478[1] = CFSTR("ReportPrepared");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1478, v1477, 2);
  v390 = (void *)objc_claimAutoreleasedReturnValue();
  v1506[13] = v390;
  v1505[14] = CFSTR("PerformResume");
  v1475[0] = v3;
  v1475[1] = v2;
  v1476[0] = CFSTR("Resuming");
  v1476[1] = CFSTR("ResumeUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1476, v1475, 2);
  v389 = (void *)objc_claimAutoreleasedReturnValue();
  v1506[14] = v389;
  v1505[15] = CFSTR("ResumeSuccessAtTarget");
  v1473[0] = v3;
  v1473[1] = v2;
  v1474[0] = CFSTR("Prepared");
  v1474[1] = CFSTR("ReportPrepared");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1474, v1473, 2);
  v388 = (void *)objc_claimAutoreleasedReturnValue();
  v1506[15] = v388;
  v1505[16] = CFSTR("PerformApply");
  v1471[0] = v3;
  v1471[1] = v2;
  v1472[0] = CFSTR("Applying");
  v1472[1] = CFSTR("ApplyUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1472, v1471, 2);
  v387 = (void *)objc_claimAutoreleasedReturnValue();
  v1506[16] = v387;
  v1505[17] = CFSTR("ApplySuccess");
  v1469[0] = v3;
  v1469[1] = v2;
  v1470[0] = CFSTR("AwaitingReboot");
  v1470[1] = CFSTR("ReportApplied");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1470, v1469, 2);
  v386 = (void *)objc_claimAutoreleasedReturnValue();
  v1506[17] = v386;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1506, v1505, 18);
  v385 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[4] = v385;
  v1727[5] = CFSTR("CheckingSpaceForInstall");
  v1467[0] = CFSTR("TargetBrainLoaded");
  v1465 = v2;
  v1466 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1466, &v1465, 1);
  v384 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[0] = v384;
  v1467[1] = CFSTR("TargetDownloadPreflighted");
  v1463 = v2;
  v1464 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1464, &v1463, 1);
  v383 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[1] = v383;
  v1467[2] = CFSTR("TargetDownloaded");
  v1461 = v2;
  v1462 = CFSTR("UpdateTarget");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1462, &v1461, 1);
  v382 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[2] = v382;
  v1467[3] = CFSTR("TargetPrepared");
  v1459 = v2;
  v1460 = CFSTR("UpdateTarget");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1460, &v1459, 1);
  v381 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[3] = v381;
  v1467[4] = CFSTR("TargetApplied");
  v1457 = v2;
  v1458 = CFSTR("UpdateTarget");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1458, &v1457, 1);
  v380 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[4] = v380;
  v1467[5] = CFSTR("TargetRollback");
  v1455 = v2;
  v1456 = CFSTR("DecideCancelBeforeRollback");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1456, &v1455, 1);
  v379 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[5] = v379;
  v1467[6] = CFSTR("ResumeCurrentUpdate");
  v1453 = v2;
  v1454 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1454, &v1453, 1);
  v378 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[6] = v378;
  v1467[7] = CFSTR("CancelCurrentUpdate");
  v1451 = v3;
  v1452 = CFSTR("Canceling");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1452, &v1451, 1);
  v377 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[7] = v377;
  v1467[8] = CFSTR("SpaceCheckHaveSpace");
  v1449 = v2;
  v1450 = CFSTR("DecideDownloadSU");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1450, &v1449, 1);
  v376 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[8] = v376;
  v1467[9] = CFSTR("SpaceCheckNoSpace");
  v1447[0] = v3;
  v1447[1] = v2;
  v1448[0] = CFSTR("ReadyToBegin");
  v1448[1] = CFSTR("ReportAttemptFailure");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1448, v1447, 2);
  v375 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[9] = v375;
  v1467[10] = CFSTR("SpaceCheckFailed");
  v1445[0] = v3;
  v1445[1] = v2;
  v1446[0] = CFSTR("ReadyToBegin");
  v1446[1] = CFSTR("ReportAttemptFailure");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1446, v1445, 2);
  v374 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[10] = v374;
  v1467[11] = CFSTR("PerformDownloadSU");
  v1443[0] = v3;
  v1443[1] = v2;
  v1444[0] = CFSTR("DownloadingSU");
  v1444[1] = CFSTR("DownloadSU");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1444, v1443, 2);
  v373 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[11] = v373;
  v1467[12] = CFSTR("DownloadSuccessAtTarget");
  v1441[0] = v3;
  v1441[1] = v2;
  v1442[0] = CFSTR("SUDownloaded");
  v1442[1] = CFSTR("ReportSUDownloaded");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1442, v1441, 2);
  v372 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[12] = v372;
  v1467[13] = CFSTR("PerformPrepare");
  v1439[0] = v3;
  v1439[1] = v2;
  v1440[0] = CFSTR("Preparing");
  v1440[1] = CFSTR("PrepareUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1440, v1439, 2);
  v371 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[13] = v371;
  v1467[14] = CFSTR("PerformSuspend");
  v1437[0] = v3;
  v1437[1] = v2;
  v1438[0] = CFSTR("Suspending");
  v1438[1] = CFSTR("SuspendUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1438, v1437, 2);
  v370 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[14] = v370;
  v1467[15] = CFSTR("SuspendSuccessAtTarget");
  v1435[0] = v3;
  v1435[1] = v2;
  v1436[0] = CFSTR("Prepared");
  v1436[1] = CFSTR("ReportPrepared");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1436, v1435, 2);
  v369 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[15] = v369;
  v1467[16] = CFSTR("PerformResume");
  v1433[0] = v3;
  v1433[1] = v2;
  v1434[0] = CFSTR("Resuming");
  v1434[1] = CFSTR("ResumeUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1434, v1433, 2);
  v368 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[16] = v368;
  v1467[17] = CFSTR("ResumeSuccessAtTarget");
  v1431[0] = v3;
  v1431[1] = v2;
  v1432[0] = CFSTR("Prepared");
  v1432[1] = CFSTR("ReportPrepared");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1432, v1431, 2);
  v367 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[17] = v367;
  v1467[18] = CFSTR("PerformApply");
  v1429[0] = v3;
  v1429[1] = v2;
  v1430[0] = CFSTR("Applying");
  v1430[1] = CFSTR("ApplyUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1430, v1429, 2);
  v366 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[18] = v366;
  v1467[19] = CFSTR("ApplySuccess");
  v1427[0] = v3;
  v1427[1] = v2;
  v1428[0] = CFSTR("AwaitingReboot");
  v1428[1] = CFSTR("ReportApplied");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1428, v1427, 2);
  v365 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[19] = v365;
  v1467[20] = CFSTR("RB_CancelNonRollbackUpdate");
  v1425 = v3;
  v1426 = CFSTR("RB_Canceling");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1426, &v1425, 1);
  v364 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[20] = v364;
  v1467[21] = CFSTR("RB_BeginRollback");
  v1423[0] = v3;
  v1423[1] = v2;
  v1424[0] = CFSTR("RB_ReadyToBegin");
  v1424[1] = CFSTR("LoadBrainRollback");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1424, v1423, 2);
  v363 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[21] = v363;
  v1467[22] = CFSTR("RB_PerformLoadBrain");
  v1421[0] = v3;
  v1421[1] = v2;
  v1422[0] = CFSTR("RB_LoadingBrain");
  v1422[1] = CFSTR("LoadBrain");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1422, v1421, 2);
  v362 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[22] = v362;
  v1467[23] = CFSTR("RB_PerformRollbackPrepare");
  v1419[0] = v3;
  v1419[1] = v2;
  v1420[0] = CFSTR("RB_RollingBackPrepare");
  v1420[1] = CFSTR("RollbackUpdatePrepare");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1420, v1419, 2);
  v361 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[23] = v361;
  v1467[24] = CFSTR("RB_PerformRollbackSuspend");
  v1417[0] = v3;
  v1417[1] = v2;
  v1418[0] = CFSTR("RB_RollingBackSuspend");
  v1418[1] = CFSTR("RollbackUpdateSuspend");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1418, v1417, 2);
  v360 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[24] = v360;
  v1467[25] = CFSTR("RB_PerformRollbackResume");
  v1415[0] = v3;
  v1415[1] = v2;
  v1416[0] = CFSTR("RB_RollingBackResume");
  v1416[1] = CFSTR("RollbackUpdateResume");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1416, v1415, 2);
  v359 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[25] = v359;
  v1467[26] = CFSTR("RB_PerformRollbackApply");
  v1413[0] = v3;
  v1413[1] = v2;
  v1414[0] = CFSTR("RB_RollingBackApply");
  v1414[1] = CFSTR("RollbackUpdateApply");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1414, v1413, 2);
  v358 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[26] = v358;
  v1467[27] = CFSTR("RB_RollbackAppleSuccess");
  v1411[0] = v3;
  v1411[1] = v2;
  v1412[0] = CFSTR("AwaitingReboot");
  v1412[1] = CFSTR("ReportRollbackSucceeded");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1412, v1411, 2);
  v357 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[27] = v357;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1468, v1467, 28);
  v356 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[5] = v356;
  v1727[6] = CFSTR("DownloadingSU");
  v1409[0] = CFSTR("TargetBrainLoaded");
  v1407 = v2;
  v1408 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1408, &v1407, 1);
  v355 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[0] = v355;
  v1409[1] = CFSTR("TargetDownloadPreflighted");
  v1405 = v2;
  v1406 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1406, &v1405, 1);
  v354 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[1] = v354;
  v1409[2] = CFSTR("TargetDownloaded");
  v1403 = v2;
  v1404 = CFSTR("UpdateTargetReconfig");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1404, &v1403, 1);
  v353 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[2] = v353;
  v1409[3] = CFSTR("TargetPrepared");
  v1401 = v2;
  v1402 = CFSTR("UpdateTargetReconfig");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1402, &v1401, 1);
  v352 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[3] = v352;
  v1409[4] = CFSTR("TargetApplied");
  v1399 = v2;
  v1400 = CFSTR("UpdateTargetReconfig");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1400, &v1399, 1);
  v351 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[4] = v351;
  v1409[5] = CFSTR("TargetRollback");
  v1397 = v2;
  v1398 = CFSTR("DecideCancelBeforeRollback");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1398, &v1397, 1);
  v350 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[5] = v350;
  v1409[6] = CFSTR("ResumeCurrentUpdate");
  v1395 = v2;
  v1396 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1396, &v1395, 1);
  v349 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[6] = v349;
  v1409[7] = CFSTR("CancelCurrentUpdate");
  v1393[0] = v3;
  v1393[1] = v2;
  v1394[0] = CFSTR("Canceling");
  v1394[1] = CFSTR("RemoveSU");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1394, v1393, 2);
  v348 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[7] = v348;
  v1409[8] = CFSTR("DownloadProgress");
  v1391 = v2;
  v1392 = CFSTR("ReportDownloadProgress");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1392, &v1391, 1);
  v347 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[8] = v347;
  v1409[9] = CFSTR("DownloadStalled");
  v1389[0] = v3;
  v1389[1] = v2;
  v1390[0] = CFSTR("DownloadSUStalled");
  v1390[1] = CFSTR("ReportDownloadStalled");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1390, v1389, 2);
  v346 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[9] = v346;
  v1409[10] = CFSTR("DownloadSuccess");
  v1387 = v2;
  v1388 = CFSTR("AdvanceSUDownloaded");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1388, &v1387, 1);
  v345 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[10] = v345;
  v1409[11] = CFSTR("DownloadFailed");
  v1385 = v2;
  v1386 = CFSTR("ChooseErrorSpaceCheck");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1386, &v1385, 1);
  v344 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[11] = v344;
  v1409[12] = CFSTR("DownloadSuccessAtTarget");
  v1383 = v3;
  v1384 = CFSTR("SUDownloaded");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1384, &v1383, 1);
  v343 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[12] = v343;
  v1409[13] = CFSTR("PerformPrepare");
  v1381[0] = v3;
  v1381[1] = v2;
  v1382[0] = CFSTR("Preparing");
  v1382[1] = CFSTR("PrepareUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1382, v1381, 2);
  v342 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[13] = v342;
  v1409[14] = CFSTR("PerformSuspend");
  v1379[0] = v3;
  v1379[1] = v2;
  v1380[0] = CFSTR("Suspending");
  v1380[1] = CFSTR("SuspendUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1380, v1379, 2);
  v341 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[14] = v341;
  v1409[15] = CFSTR("SuspendSuccessAtTarget");
  v1377[0] = v3;
  v1377[1] = v2;
  v1378[0] = CFSTR("Prepared");
  v1378[1] = CFSTR("ReportPrepared");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1378, v1377, 2);
  v340 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[15] = v340;
  v1409[16] = CFSTR("PerformResume");
  v1375[0] = v3;
  v1375[1] = v2;
  v1376[0] = CFSTR("Resuming");
  v1376[1] = CFSTR("ResumeUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1376, v1375, 2);
  v339 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[16] = v339;
  v1409[17] = CFSTR("ResumeSuccessAtTarget");
  v1373[0] = v3;
  v1373[1] = v2;
  v1374[0] = CFSTR("Prepared");
  v1374[1] = CFSTR("ReportPrepared");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1374, v1373, 2);
  v338 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[17] = v338;
  v1409[18] = CFSTR("PerformApply");
  v1371[0] = v3;
  v1371[1] = v2;
  v1372[0] = CFSTR("Applying");
  v1372[1] = CFSTR("ApplyUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1372, v1371, 2);
  v337 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[18] = v337;
  v1409[19] = CFSTR("ApplySuccess");
  v1369[0] = v3;
  v1369[1] = v2;
  v1370[0] = CFSTR("AwaitingReboot");
  v1370[1] = CFSTR("ReportApplied");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1370, v1369, 2);
  v336 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[19] = v336;
  v1409[20] = CFSTR("RB_CancelNonRollbackUpdate");
  v1367[0] = v3;
  v1367[1] = v2;
  v1368[0] = CFSTR("RB_Canceling");
  v1368[1] = CFSTR("RemoveSU");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1368, v1367, 2);
  v335 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[20] = v335;
  v1409[21] = CFSTR("RB_BeginRollback");
  v1365[0] = v3;
  v1365[1] = v2;
  v1366[0] = CFSTR("RB_ReadyToBegin");
  v1366[1] = CFSTR("LoadBrainRollback");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1366, v1365, 2);
  v334 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[21] = v334;
  v1409[22] = CFSTR("RB_PerformLoadBrain");
  v1363[0] = v3;
  v1363[1] = v2;
  v1364[0] = CFSTR("RB_LoadingBrain");
  v1364[1] = CFSTR("LoadBrain");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1364, v1363, 2);
  v333 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[22] = v333;
  v1409[23] = CFSTR("RB_PerformRollbackPrepare");
  v1361[0] = v3;
  v1361[1] = v2;
  v1362[0] = CFSTR("RB_RollingBackPrepare");
  v1362[1] = CFSTR("RollbackUpdatePrepare");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1362, v1361, 2);
  v332 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[23] = v332;
  v1409[24] = CFSTR("RB_PerformRollbackSuspend");
  v1359[0] = v3;
  v1359[1] = v2;
  v1360[0] = CFSTR("RB_RollingBackSuspend");
  v1360[1] = CFSTR("RollbackUpdateSuspend");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1360, v1359, 2);
  v331 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[24] = v331;
  v1409[25] = CFSTR("RB_PerformRollbackResume");
  v1357[0] = v3;
  v1357[1] = v2;
  v1358[0] = CFSTR("RB_RollingBackResume");
  v1358[1] = CFSTR("RollbackUpdateResume");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1358, v1357, 2);
  v330 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[25] = v330;
  v1409[26] = CFSTR("RB_PerformRollbackApply");
  v1355[0] = v3;
  v1355[1] = v2;
  v1356[0] = CFSTR("RB_RollingBackApply");
  v1356[1] = CFSTR("RollbackUpdateApply");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1356, v1355, 2);
  v329 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[26] = v329;
  v1409[27] = CFSTR("RB_RollbackAppleSuccess");
  v1353[0] = v3;
  v1353[1] = v2;
  v1354[0] = CFSTR("AwaitingReboot");
  v1354[1] = CFSTR("ReportRollbackSucceeded");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1354, v1353, 2);
  v328 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[27] = v328;
  v1409[28] = CFSTR("PerformErrorSpaceCheck");
  v1351[0] = v3;
  v1351[1] = v2;
  v1352[0] = CFSTR("CheckingSpaceAfterError");
  v1352[1] = CFSTR("CheckSpace");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1352, v1351, 2);
  v327 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[28] = v327;
  v1409[29] = CFSTR("SkipErrorSpaceCheck");
  v1349[0] = v3;
  v1349[1] = v2;
  v1350[0] = CFSTR("ReadyToBegin");
  v1350[1] = CFSTR("ReportAttemptFailure");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1350, v1349, 2);
  v326 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[29] = v326;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1410, v1409, 30);
  v325 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[6] = v325;
  v1727[7] = CFSTR("DownloadSUStalled");
  v1347[0] = CFSTR("TargetBrainLoaded");
  v1345 = v2;
  v1346 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1346, &v1345, 1);
  v324 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[0] = v324;
  v1347[1] = CFSTR("TargetDownloadPreflighted");
  v1343 = v2;
  v1344 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1344, &v1343, 1);
  v323 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[1] = v323;
  v1347[2] = CFSTR("TargetDownloaded");
  v1341 = v2;
  v1342 = CFSTR("UpdateTargetReconfig");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1342, &v1341, 1);
  v322 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[2] = v322;
  v1347[3] = CFSTR("TargetPrepared");
  v1339 = v2;
  v1340 = CFSTR("UpdateTargetReconfig");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1340, &v1339, 1);
  v321 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[3] = v321;
  v1347[4] = CFSTR("TargetApplied");
  v1337 = v2;
  v1338 = CFSTR("UpdateTargetReconfig");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1338, &v1337, 1);
  v320 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[4] = v320;
  v1347[5] = CFSTR("TargetRollback");
  v1335 = v2;
  v1336 = CFSTR("DecideCancelBeforeRollback");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1336, &v1335, 1);
  v319 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[5] = v319;
  v1347[6] = CFSTR("ResumeCurrentUpdate");
  v1333 = v2;
  v1334 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1334, &v1333, 1);
  v318 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[6] = v318;
  v1347[7] = CFSTR("CancelCurrentUpdate");
  v1331[0] = v3;
  v1331[1] = v2;
  v1332[0] = CFSTR("Canceling");
  v1332[1] = CFSTR("RemoveSU");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1332, v1331, 2);
  v317 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[7] = v317;
  v1347[8] = CFSTR("DownloadProgress");
  v1329[0] = v3;
  v1329[1] = v2;
  v1330[0] = CFSTR("DownloadingSU");
  v1330[1] = CFSTR("ReportDownloadProgress");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1330, v1329, 2);
  v316 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[8] = v316;
  v1347[9] = CFSTR("DownloadStalled");
  v1327 = v2;
  v1328 = *MEMORY[0x1E0DA8B68];
  v535 = v1328;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1328, &v1327, 1);
  v315 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[9] = v315;
  v1347[10] = CFSTR("DownloadSuccess");
  v1325 = v2;
  v1326 = CFSTR("AdvanceSUDownloaded");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1326, &v1325, 1);
  v313 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[10] = v313;
  v1347[11] = CFSTR("DownloadFailed");
  v1323 = v2;
  v1324 = CFSTR("ChooseErrorSpaceCheck");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1324, &v1323, 1);
  v312 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[11] = v312;
  v1347[12] = CFSTR("DownloadSuccessAtTarget");
  v1321 = v3;
  v1322 = CFSTR("SUDownloaded");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1322, &v1321, 1);
  v537 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[12] = v537;
  v1347[13] = CFSTR("PerformPrepare");
  v1319[0] = v3;
  v1319[1] = v2;
  v1320[0] = CFSTR("Preparing");
  v1320[1] = CFSTR("PrepareUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1320, v1319, 2);
  v311 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[13] = v311;
  v1347[14] = CFSTR("PerformSuspend");
  v1317[0] = v3;
  v1317[1] = v2;
  v1318[0] = CFSTR("Suspending");
  v1318[1] = CFSTR("SuspendUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1318, v1317, 2);
  v310 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[14] = v310;
  v1347[15] = CFSTR("SuspendSuccessAtTarget");
  v1315[0] = v3;
  v1315[1] = v2;
  v1316[0] = CFSTR("Prepared");
  v1316[1] = CFSTR("ReportPrepared");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1316, v1315, 2);
  v309 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[15] = v309;
  v1347[16] = CFSTR("PerformResume");
  v1313[0] = v3;
  v1313[1] = v2;
  v1314[0] = CFSTR("Resuming");
  v1314[1] = CFSTR("ResumeUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1314, v1313, 2);
  v308 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[16] = v308;
  v1347[17] = CFSTR("ResumeSuccessAtTarget");
  v1311[0] = v3;
  v1311[1] = v2;
  v1312[0] = CFSTR("Prepared");
  v1312[1] = CFSTR("ReportPrepared");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1312, v1311, 2);
  v307 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[17] = v307;
  v1347[18] = CFSTR("PerformApply");
  v1309[0] = v3;
  v1309[1] = v2;
  v1310[0] = CFSTR("Applying");
  v1310[1] = CFSTR("ApplyUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1310, v1309, 2);
  v306 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[18] = v306;
  v1347[19] = CFSTR("ApplySuccess");
  v1307[0] = v3;
  v1307[1] = v2;
  v1308[0] = CFSTR("AwaitingReboot");
  v1308[1] = CFSTR("ReportApplied");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1308, v1307, 2);
  v305 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[19] = v305;
  v1347[20] = CFSTR("RB_CancelNonRollbackUpdate");
  v1305[0] = v3;
  v1305[1] = v2;
  v1306[0] = CFSTR("RB_Canceling");
  v1306[1] = CFSTR("RemoveSU");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1306, v1305, 2);
  v304 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[20] = v304;
  v1347[21] = CFSTR("RB_BeginRollback");
  v1303[0] = v3;
  v1303[1] = v2;
  v1304[0] = CFSTR("RB_ReadyToBegin");
  v1304[1] = CFSTR("LoadBrainRollback");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1304, v1303, 2);
  v303 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[21] = v303;
  v1347[22] = CFSTR("RB_PerformLoadBrain");
  v1301[0] = v3;
  v1301[1] = v2;
  v1302[0] = CFSTR("RB_LoadingBrain");
  v1302[1] = CFSTR("LoadBrain");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1302, v1301, 2);
  v302 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[22] = v302;
  v1347[23] = CFSTR("RB_PerformRollbackPrepare");
  v1299[0] = v3;
  v1299[1] = v2;
  v1300[0] = CFSTR("RB_RollingBackPrepare");
  v1300[1] = CFSTR("RollbackUpdatePrepare");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1300, v1299, 2);
  v301 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[23] = v301;
  v1347[24] = CFSTR("RB_PerformRollbackSuspend");
  v1297[0] = v3;
  v1297[1] = v2;
  v1298[0] = CFSTR("RB_RollingBackSuspend");
  v1298[1] = CFSTR("RollbackUpdateSuspend");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1298, v1297, 2);
  v300 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[24] = v300;
  v1347[25] = CFSTR("RB_PerformRollbackResume");
  v1295[0] = v3;
  v1295[1] = v2;
  v1296[0] = CFSTR("RB_RollingBackResume");
  v1296[1] = CFSTR("RollbackUpdateResume");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1296, v1295, 2);
  v299 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[25] = v299;
  v1347[26] = CFSTR("RB_PerformRollbackApply");
  v1293[0] = v3;
  v1293[1] = v2;
  v1294[0] = CFSTR("RB_RollingBackApply");
  v1294[1] = CFSTR("RollbackUpdateApply");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1294, v1293, 2);
  v298 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[26] = v298;
  v1347[27] = CFSTR("RB_RollbackAppleSuccess");
  v1291[0] = v3;
  v1291[1] = v2;
  v1292[0] = CFSTR("AwaitingReboot");
  v1292[1] = CFSTR("ReportRollbackSucceeded");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1292, v1291, 2);
  v297 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[27] = v297;
  v1347[28] = CFSTR("PerformErrorSpaceCheck");
  v1289[0] = v3;
  v1289[1] = v2;
  v1290[0] = CFSTR("CheckingSpaceAfterError");
  v1290[1] = CFSTR("CheckSpace");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1290, v1289, 2);
  v296 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[28] = v296;
  v1347[29] = CFSTR("SkipErrorSpaceCheck");
  v1287[0] = v3;
  v1287[1] = v2;
  v1288[0] = CFSTR("ReadyToBegin");
  v1288[1] = CFSTR("ReportAttemptFailure");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1288, v1287, 2);
  v294 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[29] = v294;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1348, v1347, 30);
  v293 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[7] = v293;
  v1727[8] = CFSTR("SUDownloaded");
  v1285[0] = CFSTR("TargetBrainLoaded");
  v1283 = v2;
  v1284 = CFSTR("ReportAnomalyAPIEnd");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1284, &v1283, 1);
  v292 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[0] = v292;
  v1285[1] = CFSTR("TargetDownloadPreflighted");
  v1281 = v2;
  v1282 = CFSTR("ReportAnomalyAPIEnd");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1282, &v1281, 1);
  v291 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[1] = v291;
  v1285[2] = CFSTR("TargetDownloaded");
  v1279 = v2;
  v1280 = CFSTR("UpdateTarget");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1280, &v1279, 1);
  v290 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[2] = v290;
  v1285[3] = CFSTR("TargetPrepared");
  v1277 = v2;
  v1278 = CFSTR("DecidePrepareUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1278, &v1277, 1);
  v289 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[3] = v289;
  v1285[4] = CFSTR("TargetApplied");
  v1275 = v2;
  v1276 = CFSTR("DecidePrepareUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1276, &v1275, 1);
  v288 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[4] = v288;
  v1285[5] = CFSTR("TargetRollback");
  v1273 = v2;
  v1274 = CFSTR("DecideCancelBeforeRollback");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1274, &v1273, 1);
  v287 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[5] = v287;
  v1285[6] = CFSTR("ResumeCurrentUpdate");
  v1271 = v2;
  v1272 = CFSTR("ReportAnomalyAPIEnd");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1272, &v1271, 1);
  v286 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[6] = v286;
  v1285[7] = CFSTR("CancelCurrentUpdate");
  v1269[0] = v3;
  v1269[1] = v2;
  v1270[0] = CFSTR("Canceling");
  v1270[1] = CFSTR("RemoveSU");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1270, v1269, 2);
  v285 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[7] = v285;
  v1285[8] = CFSTR("PerformPrepare");
  v1267[0] = v3;
  v1267[1] = v2;
  v1268[0] = CFSTR("Preparing");
  v1268[1] = CFSTR("PrepareUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1268, v1267, 2);
  v284 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[8] = v284;
  v1285[9] = CFSTR("PerformSuspend");
  v1265[0] = v3;
  v1265[1] = v2;
  v1266[0] = CFSTR("Suspending");
  v1266[1] = CFSTR("SuspendUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1266, v1265, 2);
  v283 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[9] = v283;
  v1285[10] = CFSTR("SuspendSuccessAtTarget");
  v1263[0] = v3;
  v1263[1] = v2;
  v1264[0] = CFSTR("Prepared");
  v1264[1] = CFSTR("ReportPrepared");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1264, v1263, 2);
  v282 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[10] = v282;
  v1285[11] = CFSTR("PerformResume");
  v1261[0] = v3;
  v1261[1] = v2;
  v1262[0] = CFSTR("Resuming");
  v1262[1] = CFSTR("ResumeUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1262, v1261, 2);
  v281 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[11] = v281;
  v1285[12] = CFSTR("ResumeSuccessAtTarget");
  v1259[0] = v3;
  v1259[1] = v2;
  v1260[0] = CFSTR("Prepared");
  v1260[1] = CFSTR("ReportPrepared");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1260, v1259, 2);
  v280 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[12] = v280;
  v1285[13] = CFSTR("PerformApply");
  v1257[0] = v3;
  v1257[1] = v2;
  v1258[0] = CFSTR("Applying");
  v1258[1] = CFSTR("ApplyUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1258, v1257, 2);
  v279 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[13] = v279;
  v1285[14] = CFSTR("ApplySuccess");
  v1255[0] = v3;
  v1255[1] = v2;
  v1256[0] = CFSTR("AwaitingReboot");
  v1256[1] = CFSTR("ReportApplied");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1256, v1255, 2);
  v278 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[14] = v278;
  v1285[15] = CFSTR("RB_CancelNonRollbackUpdate");
  v1253[0] = v3;
  v1253[1] = v2;
  v1254[0] = CFSTR("RB_Canceling");
  v1254[1] = CFSTR("RemoveSU");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1254, v1253, 2);
  v277 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[15] = v277;
  v1285[16] = CFSTR("RB_BeginRollback");
  v1251[0] = v3;
  v1251[1] = v2;
  v1252[0] = CFSTR("RB_ReadyToBegin");
  v1252[1] = CFSTR("LoadBrainRollback");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1252, v1251, 2);
  v276 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[16] = v276;
  v1285[17] = CFSTR("RB_PerformLoadBrain");
  v1249[0] = v3;
  v1249[1] = v2;
  v1250[0] = CFSTR("RB_LoadingBrain");
  v1250[1] = CFSTR("LoadBrain");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1250, v1249, 2);
  v275 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[17] = v275;
  v1285[18] = CFSTR("RB_PerformRollbackPrepare");
  v1247[0] = v3;
  v1247[1] = v2;
  v1248[0] = CFSTR("RB_RollingBackPrepare");
  v1248[1] = CFSTR("RollbackUpdatePrepare");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1248, v1247, 2);
  v274 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[18] = v274;
  v1285[19] = CFSTR("RB_PerformRollbackSuspend");
  v1245[0] = v3;
  v1245[1] = v2;
  v1246[0] = CFSTR("RB_RollingBackSuspend");
  v1246[1] = CFSTR("RollbackUpdateSuspend");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1246, v1245, 2);
  v273 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[19] = v273;
  v1285[20] = CFSTR("RB_PerformRollbackResume");
  v1243[0] = v3;
  v1243[1] = v2;
  v1244[0] = CFSTR("RB_RollingBackResume");
  v1244[1] = CFSTR("RollbackUpdateResume");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1244, v1243, 2);
  v272 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[20] = v272;
  v1285[21] = CFSTR("RB_PerformRollbackApply");
  v1241[0] = v3;
  v1241[1] = v2;
  v1242[0] = CFSTR("RB_RollingBackApply");
  v1242[1] = CFSTR("RollbackUpdateApply");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1242, v1241, 2);
  v271 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[21] = v271;
  v1285[22] = CFSTR("RB_RollbackAppleSuccess");
  v1239[0] = v3;
  v1239[1] = v2;
  v1240[0] = CFSTR("AwaitingReboot");
  v1240[1] = CFSTR("ReportRollbackSucceeded");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1240, v1239, 2);
  v270 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[22] = v270;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1286, v1285, 23);
  v269 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[8] = v269;
  v1727[9] = CFSTR("Preparing");
  v1237[0] = CFSTR("TargetBrainLoaded");
  v1235 = v2;
  v1236 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1236, &v1235, 1);
  v268 = (void *)objc_claimAutoreleasedReturnValue();
  v1238[0] = v268;
  v1237[1] = CFSTR("TargetDownloadPreflighted");
  v1233 = v2;
  v1234 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1234, &v1233, 1);
  v267 = (void *)objc_claimAutoreleasedReturnValue();
  v1238[1] = v267;
  v1237[2] = CFSTR("TargetDownloaded");
  v1231 = v2;
  v1232 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1232, &v1231, 1);
  v266 = (void *)objc_claimAutoreleasedReturnValue();
  v1238[2] = v266;
  v1237[3] = CFSTR("TargetPrepared");
  v1229 = v2;
  v1230 = CFSTR("UpdateTarget");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1230, &v1229, 1);
  v265 = (void *)objc_claimAutoreleasedReturnValue();
  v1238[3] = v265;
  v1237[4] = CFSTR("TargetApplied");
  v1227 = v2;
  v1228 = CFSTR("UpdateTarget");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1228, &v1227, 1);
  v264 = (void *)objc_claimAutoreleasedReturnValue();
  v1238[4] = v264;
  v1237[5] = CFSTR("TargetRollback");
  v1225 = v2;
  v1226 = CFSTR("DecideCancelBeforeRollback");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1226, &v1225, 1);
  v263 = (void *)objc_claimAutoreleasedReturnValue();
  v1238[5] = v263;
  v1237[6] = CFSTR("ResumeCurrentUpdate");
  v1223 = v2;
  v1224 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1224, &v1223, 1);
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  v1238[6] = v262;
  v1237[7] = CFSTR("CancelCurrentUpdate");
  v1221[0] = v3;
  v1221[1] = v2;
  v1222[0] = CFSTR("Canceling");
  v1222[1] = CFSTR("CancelPrepare");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1222, v1221, 2);
  v261 = (void *)objc_claimAutoreleasedReturnValue();
  v1238[7] = v261;
  v1237[8] = CFSTR("PrepareProgress");
  v1219 = v2;
  v1220 = CFSTR("ReportPrepareProgress");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1220, &v1219, 1);
  v260 = (void *)objc_claimAutoreleasedReturnValue();
  v1238[8] = v260;
  v1237[9] = CFSTR("PrepareSuccess");
  v1217 = v2;
  v1218 = CFSTR("DecideSuspendUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1218, &v1217, 1);
  v259 = (void *)objc_claimAutoreleasedReturnValue();
  v1238[9] = v259;
  v1237[10] = CFSTR("PrepareFailed");
  v1215[0] = v3;
  v1215[1] = v2;
  v1216[0] = CFSTR("RemovingSU");
  v1216[1] = CFSTR("RemoveSU");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1216, v1215, 2);
  v258 = (void *)objc_claimAutoreleasedReturnValue();
  v1238[10] = v258;
  v1237[11] = CFSTR("PerformSuspend");
  v1213[0] = v3;
  v1213[1] = v2;
  v1214[0] = CFSTR("Suspending");
  v1214[1] = CFSTR("SuspendUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1214, v1213, 2);
  v257 = (void *)objc_claimAutoreleasedReturnValue();
  v1238[11] = v257;
  v1237[12] = CFSTR("SuspendSuccessAtTarget");
  v1211[0] = v3;
  v1211[1] = v2;
  v1212[0] = CFSTR("Prepared");
  v1212[1] = CFSTR("ReportPrepared");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1212, v1211, 2);
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  v1238[12] = v256;
  v1237[13] = CFSTR("PerformResume");
  v1209[0] = v3;
  v1209[1] = v2;
  v1210[0] = CFSTR("Resuming");
  v1210[1] = CFSTR("ResumeUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1210, v1209, 2);
  v255 = (void *)objc_claimAutoreleasedReturnValue();
  v1238[13] = v255;
  v1237[14] = CFSTR("ResumeSuccessAtTarget");
  v1207[0] = v3;
  v1207[1] = v2;
  v1208[0] = CFSTR("Prepared");
  v1208[1] = CFSTR("ReportPrepared");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1208, v1207, 2);
  v254 = (void *)objc_claimAutoreleasedReturnValue();
  v1238[14] = v254;
  v1237[15] = CFSTR("PerformApply");
  v1205[0] = v3;
  v1205[1] = v2;
  v1206[0] = CFSTR("Applying");
  v1206[1] = CFSTR("ApplyUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1206, v1205, 2);
  v253 = (void *)objc_claimAutoreleasedReturnValue();
  v1238[15] = v253;
  v1237[16] = CFSTR("ApplySuccess");
  v1203[0] = v3;
  v1203[1] = v2;
  v1204[0] = CFSTR("AwaitingReboot");
  v1204[1] = CFSTR("ReportApplied");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1204, v1203, 2);
  v252 = (void *)objc_claimAutoreleasedReturnValue();
  v1238[16] = v252;
  v1237[17] = CFSTR("RB_CancelNonRollbackUpdate");
  v1201[0] = v3;
  v1201[1] = v2;
  v1202[0] = CFSTR("RB_Canceling");
  v1202[1] = CFSTR("CancelPrepare");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1202, v1201, 2);
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  v1238[17] = v251;
  v1237[18] = CFSTR("RB_BeginRollback");
  v1199[0] = v3;
  v1199[1] = v2;
  v1200[0] = CFSTR("RB_ReadyToBegin");
  v1200[1] = CFSTR("LoadBrainRollback");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1200, v1199, 2);
  v250 = (void *)objc_claimAutoreleasedReturnValue();
  v1238[18] = v250;
  v1237[19] = CFSTR("RB_PerformLoadBrain");
  v1197[0] = v3;
  v1197[1] = v2;
  v1198[0] = CFSTR("RB_LoadingBrain");
  v1198[1] = CFSTR("LoadBrain");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1198, v1197, 2);
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  v1238[19] = v249;
  v1237[20] = CFSTR("RB_PerformRollbackPrepare");
  v1195[0] = v3;
  v1195[1] = v2;
  v1196[0] = CFSTR("RB_RollingBackPrepare");
  v1196[1] = CFSTR("RollbackUpdatePrepare");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1196, v1195, 2);
  v248 = (void *)objc_claimAutoreleasedReturnValue();
  v1238[20] = v248;
  v1237[21] = CFSTR("RB_PerformRollbackSuspend");
  v1193[0] = v3;
  v1193[1] = v2;
  v1194[0] = CFSTR("RB_RollingBackSuspend");
  v1194[1] = CFSTR("RollbackUpdateSuspend");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1194, v1193, 2);
  v247 = (void *)objc_claimAutoreleasedReturnValue();
  v1238[21] = v247;
  v1237[22] = CFSTR("RB_PerformRollbackResume");
  v1191[0] = v3;
  v1191[1] = v2;
  v1192[0] = CFSTR("RB_RollingBackResume");
  v1192[1] = CFSTR("RollbackUpdateResume");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1192, v1191, 2);
  v246 = (void *)objc_claimAutoreleasedReturnValue();
  v1238[22] = v246;
  v1237[23] = CFSTR("RB_PerformRollbackApply");
  v1189[0] = v3;
  v1189[1] = v2;
  v1190[0] = CFSTR("RB_RollingBackApply");
  v1190[1] = CFSTR("RollbackUpdateApply");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1190, v1189, 2);
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  v1238[23] = v245;
  v1237[24] = CFSTR("RB_RollbackAppleSuccess");
  v1187[0] = v3;
  v1187[1] = v2;
  v1188[0] = CFSTR("AwaitingReboot");
  v1188[1] = CFSTR("ReportRollbackSucceeded");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1188, v1187, 2);
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  v1238[24] = v244;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1238, v1237, 25);
  v243 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[9] = v243;
  v1727[10] = CFSTR("Suspending");
  v1185[0] = CFSTR("TargetBrainLoaded");
  v1183 = v2;
  v1184 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1184, &v1183, 1);
  v242 = (void *)objc_claimAutoreleasedReturnValue();
  v1186[0] = v242;
  v1185[1] = CFSTR("TargetDownloadPreflighted");
  v1181 = v2;
  v1182 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1182, &v1181, 1);
  v241 = (void *)objc_claimAutoreleasedReturnValue();
  v1186[1] = v241;
  v1185[2] = CFSTR("TargetDownloaded");
  v1179 = v2;
  v1180 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1180, &v1179, 1);
  v240 = (void *)objc_claimAutoreleasedReturnValue();
  v1186[2] = v240;
  v1185[3] = CFSTR("TargetPrepared");
  v1177 = v2;
  v1178 = CFSTR("UpdateTarget");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1178, &v1177, 1);
  v239 = (void *)objc_claimAutoreleasedReturnValue();
  v1186[3] = v239;
  v1185[4] = CFSTR("TargetApplied");
  v1175 = v2;
  v1176 = CFSTR("UpdateTarget");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1176, &v1175, 1);
  v238 = (void *)objc_claimAutoreleasedReturnValue();
  v1186[4] = v238;
  v1185[5] = CFSTR("TargetRollback");
  v1173 = v2;
  v1174 = CFSTR("DecideCancelBeforeRollback");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1174, &v1173, 1);
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  v1186[5] = v237;
  v1185[6] = CFSTR("ResumeCurrentUpdate");
  v1171 = v2;
  v1172 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1172, &v1171, 1);
  v236 = (void *)objc_claimAutoreleasedReturnValue();
  v1186[6] = v236;
  v1185[7] = CFSTR("CancelCurrentUpdate");
  v1169 = v3;
  v1170 = CFSTR("Canceling");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1170, &v1169, 1);
  v235 = (void *)objc_claimAutoreleasedReturnValue();
  v1186[7] = v235;
  v1185[8] = CFSTR("SuspendSuccess");
  v1167 = v2;
  v1168 = CFSTR("AdvanceSuspended");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1168, &v1167, 1);
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  v1186[8] = v234;
  v1185[9] = CFSTR("SuspendFailed");
  v1165[0] = v3;
  v1165[1] = v2;
  v1166[0] = CFSTR("RemovingSU");
  v1166[1] = CFSTR("RemoveSU");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1166, v1165, 2);
  v233 = (void *)objc_claimAutoreleasedReturnValue();
  v1186[9] = v233;
  v1185[10] = CFSTR("SuspendSuccessAtTarget");
  v1163[0] = v3;
  v1163[1] = v2;
  v1164[0] = CFSTR("Prepared");
  v1164[1] = CFSTR("ReportPrepared");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1164, v1163, 2);
  v542 = (void *)objc_claimAutoreleasedReturnValue();
  v1186[10] = v542;
  v1185[11] = CFSTR("PerformResume");
  v1161[0] = v3;
  v1161[1] = v2;
  v1162[0] = CFSTR("Resuming");
  v1162[1] = CFSTR("ResumeUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1162, v1161, 2);
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  v1186[11] = v232;
  v1185[12] = CFSTR("ResumeSuccessAtTarget");
  v1159[0] = v3;
  v1159[1] = v2;
  v1160[0] = CFSTR("Prepared");
  v1160[1] = CFSTR("ReportPrepared");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1160, v1159, 2);
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  v1186[12] = v231;
  v1185[13] = CFSTR("PerformApply");
  v1157[0] = v3;
  v1157[1] = v2;
  v1158[0] = CFSTR("Applying");
  v1158[1] = CFSTR("ApplyUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1158, v1157, 2);
  v230 = (void *)objc_claimAutoreleasedReturnValue();
  v1186[13] = v230;
  v1185[14] = CFSTR("ApplySuccess");
  v1155[0] = v3;
  v1155[1] = v2;
  v1156[0] = CFSTR("AwaitingReboot");
  v1156[1] = CFSTR("ReportApplied");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1156, v1155, 2);
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  v1186[14] = v229;
  v1185[15] = CFSTR("RB_CancelNonRollbackUpdate");
  v1153 = v3;
  v1154 = CFSTR("RB_Canceling");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1154, &v1153, 1);
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  v1186[15] = v228;
  v1185[16] = CFSTR("RB_BeginRollback");
  v1151[0] = v3;
  v1151[1] = v2;
  v1152[0] = CFSTR("RB_ReadyToBegin");
  v1152[1] = CFSTR("LoadBrainRollback");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1152, v1151, 2);
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  v1186[16] = v227;
  v1185[17] = CFSTR("RB_PerformLoadBrain");
  v1149[0] = v3;
  v1149[1] = v2;
  v1150[0] = CFSTR("RB_LoadingBrain");
  v1150[1] = CFSTR("LoadBrain");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1150, v1149, 2);
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  v1186[17] = v226;
  v1185[18] = CFSTR("RB_PerformRollbackPrepare");
  v1147[0] = v3;
  v1147[1] = v2;
  v1148[0] = CFSTR("RB_RollingBackPrepare");
  v1148[1] = CFSTR("RollbackUpdatePrepare");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1148, v1147, 2);
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  v1186[18] = v225;
  v1185[19] = CFSTR("RB_PerformRollbackSuspend");
  v1145[0] = v3;
  v1145[1] = v2;
  v1146[0] = CFSTR("RB_RollingBackSuspend");
  v1146[1] = CFSTR("RollbackUpdateSuspend");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1146, v1145, 2);
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  v1186[19] = v224;
  v1185[20] = CFSTR("RB_PerformRollbackResume");
  v1143[0] = v3;
  v1143[1] = v2;
  v1144[0] = CFSTR("RB_RollingBackResume");
  v1144[1] = CFSTR("RollbackUpdateResume");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1144, v1143, 2);
  v223 = (void *)objc_claimAutoreleasedReturnValue();
  v1186[20] = v223;
  v1185[21] = CFSTR("RB_PerformRollbackApply");
  v1141[0] = v3;
  v1141[1] = v2;
  v1142[0] = CFSTR("RB_RollingBackApply");
  v1142[1] = CFSTR("RollbackUpdateApply");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1142, v1141, 2);
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  v1186[21] = v222;
  v1185[22] = CFSTR("RB_RollbackAppleSuccess");
  v1139[0] = v3;
  v1139[1] = v2;
  v1140[0] = CFSTR("AwaitingReboot");
  v1140[1] = CFSTR("ReportRollbackSucceeded");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1140, v1139, 2);
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  v1186[22] = v221;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1186, v1185, 23);
  v220 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[10] = v220;
  v1727[11] = CFSTR("Prepared");
  v1137[0] = CFSTR("TargetBrainLoaded");
  v1135 = v2;
  v1136 = CFSTR("ReportAnomalyAPIEnd");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1136, &v1135, 1);
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  v1138[0] = v219;
  v1137[1] = CFSTR("TargetDownloadPreflighted");
  v1133 = v2;
  v1134 = CFSTR("ReportAnomalyAPIEnd");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1134, &v1133, 1);
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  v1138[1] = v218;
  v1137[2] = CFSTR("TargetDownloaded");
  v1131 = v2;
  v1132 = CFSTR("ReportAnomalyAPIEnd");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1132, &v1131, 1);
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  v1138[2] = v217;
  v1137[3] = CFSTR("TargetPrepared");
  v1129 = v2;
  v1130 = CFSTR("UpdateTarget");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1130, &v1129, 1);
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  v1138[3] = v216;
  v1137[4] = CFSTR("TargetApplied");
  v1127 = v2;
  v1128 = CFSTR("DecideResumeUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1128, &v1127, 1);
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  v1138[4] = v215;
  v1137[5] = CFSTR("TargetRollback");
  v1125 = v2;
  v1126 = CFSTR("DecideCancelBeforeRollback");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1126, &v1125, 1);
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  v1138[5] = v214;
  v1137[6] = CFSTR("ResumeCurrentUpdate");
  v1123[0] = v3;
  v1123[1] = v2;
  v1124[0] = CFSTR("ResumingCurrent");
  v1124[1] = CFSTR("ResumeCurrentUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1124, v1123, 2);
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  v1138[6] = v213;
  v1137[7] = CFSTR("CancelCurrentUpdate");
  v1121[0] = v3;
  v1121[1] = v2;
  v1122[0] = CFSTR("Canceling");
  v1122[1] = CFSTR("RemovePrepared");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1122, v1121, 2);
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  v1138[7] = v212;
  v1137[8] = CFSTR("PerformResume");
  v1119[0] = v3;
  v1119[1] = v2;
  v1120[0] = CFSTR("Resuming");
  v1120[1] = CFSTR("ResumeUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1120, v1119, 2);
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  v1138[8] = v211;
  v1137[9] = CFSTR("ResumeSuccessAtTarget");
  v1117 = v2;
  v1118 = CFSTR("ReportPrepared");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1118, &v1117, 1);
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  v1138[9] = v210;
  v1137[10] = CFSTR("PerformApply");
  v1115[0] = v3;
  v1115[1] = v2;
  v1116[0] = CFSTR("Applying");
  v1116[1] = CFSTR("ApplyUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1116, v1115, 2);
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  v1138[10] = v209;
  v1137[11] = CFSTR("ApplySuccess");
  v1113[0] = v3;
  v1113[1] = v2;
  v1114[0] = CFSTR("AwaitingReboot");
  v1114[1] = CFSTR("ReportApplied");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1114, v1113, 2);
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  v1138[11] = v208;
  v1137[12] = CFSTR("RB_CancelNonRollbackUpdate");
  v1111[0] = v3;
  v1111[1] = v2;
  v1112[0] = CFSTR("RB_Canceling");
  v1112[1] = CFSTR("RemovePrepared");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1112, v1111, 2);
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  v1138[12] = v207;
  v1137[13] = CFSTR("RB_BeginRollback");
  v1109[0] = v3;
  v1109[1] = v2;
  v1110[0] = CFSTR("RB_ReadyToBegin");
  v1110[1] = CFSTR("LoadBrainRollback");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1110, v1109, 2);
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  v1138[13] = v206;
  v1137[14] = CFSTR("RB_PerformLoadBrain");
  v1107[0] = v3;
  v1107[1] = v2;
  v1108[0] = CFSTR("RB_LoadingBrain");
  v1108[1] = CFSTR("LoadBrain");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1108, v1107, 2);
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  v1138[14] = v205;
  v1137[15] = CFSTR("RB_PerformRollbackPrepare");
  v1105[0] = v3;
  v1105[1] = v2;
  v1106[0] = CFSTR("RB_RollingBackPrepare");
  v1106[1] = CFSTR("RollbackUpdatePrepare");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1106, v1105, 2);
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  v1138[15] = v204;
  v1137[16] = CFSTR("RB_PerformRollbackSuspend");
  v1103[0] = v3;
  v1103[1] = v2;
  v1104[0] = CFSTR("RB_RollingBackSuspend");
  v1104[1] = CFSTR("RollbackUpdateSuspend");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1104, v1103, 2);
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  v1138[16] = v203;
  v1137[17] = CFSTR("RB_PerformRollbackResume");
  v1101[0] = v3;
  v1101[1] = v2;
  v1102[0] = CFSTR("RB_RollingBackResume");
  v1102[1] = CFSTR("RollbackUpdateResume");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1102, v1101, 2);
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  v1138[17] = v202;
  v1137[18] = CFSTR("RB_PerformRollbackApply");
  v1099[0] = v3;
  v1099[1] = v2;
  v1100[0] = CFSTR("RB_RollingBackApply");
  v1100[1] = CFSTR("RollbackUpdateApply");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1100, v1099, 2);
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  v1138[18] = v201;
  v1137[19] = CFSTR("RB_RollbackAppleSuccess");
  v1097[0] = v3;
  v1097[1] = v2;
  v1098[0] = CFSTR("AwaitingReboot");
  v1098[1] = CFSTR("ReportRollbackSucceeded");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1098, v1097, 2);
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  v1138[19] = v200;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1138, v1137, 20);
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[11] = v199;
  v1727[12] = CFSTR("ResumingCurrent");
  v1095[0] = CFSTR("TargetBrainLoaded");
  v1093 = v2;
  v1094 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1094, &v1093, 1);
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  v1096[0] = v198;
  v1095[1] = CFSTR("TargetDownloadPreflighted");
  v1091 = v2;
  v1092 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1092, &v1091, 1);
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  v1096[1] = v197;
  v1095[2] = CFSTR("TargetDownloaded");
  v1089 = v2;
  v1090 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1090, &v1089, 1);
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  v1096[2] = v196;
  v1095[3] = CFSTR("TargetPrepared");
  v1087 = v2;
  v1088 = CFSTR("UpdateTarget");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1088, &v1087, 1);
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  v1096[3] = v195;
  v1095[4] = CFSTR("TargetApplied");
  v1085[0] = v3;
  v1085[1] = v2;
  v1086[0] = CFSTR("Resuming");
  v1086[1] = CFSTR("UpdateTarget");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1086, v1085, 2);
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  v1096[4] = v194;
  v1095[5] = CFSTR("TargetRollback");
  v1083 = v2;
  v1084 = CFSTR("DecideCancelBeforeRollback");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1084, &v1083, 1);
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  v1096[5] = v193;
  v1095[6] = CFSTR("ResumeCurrentUpdate");
  v1081 = v2;
  v1082 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1082, &v1081, 1);
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  v1096[6] = v192;
  v1095[7] = CFSTR("CancelCurrentUpdate");
  v1079 = v3;
  v1080 = CFSTR("Canceling");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1080, &v1079, 1);
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  v1096[7] = v191;
  v1095[8] = CFSTR("ResumeSuccess");
  v1077[0] = v3;
  v1077[1] = v2;
  v1078[0] = CFSTR("Prepared");
  v1078[1] = CFSTR("ReportResumeCurrentSuccess");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1078, v1077, 2);
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  v1096[8] = v190;
  v1095[9] = CFSTR("ResumeFailed");
  v1075[0] = v3;
  v1075[1] = v2;
  v1076[0] = CFSTR("Prepared");
  v1076[1] = CFSTR("ReportResumeCurrentFailed");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1076, v1075, 2);
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  v1096[9] = v189;
  v1095[10] = CFSTR("RB_CancelNonRollbackUpdate");
  v1073 = v3;
  v1074 = CFSTR("RB_Canceling");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1074, &v1073, 1);
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  v1096[10] = v188;
  v1095[11] = CFSTR("RB_BeginRollback");
  v1071[0] = v3;
  v1071[1] = v2;
  v1072[0] = CFSTR("RB_ReadyToBegin");
  v1072[1] = CFSTR("LoadBrainRollback");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1072, v1071, 2);
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  v1096[11] = v187;
  v1095[12] = CFSTR("RB_PerformLoadBrain");
  v1069[0] = v3;
  v1069[1] = v2;
  v1070[0] = CFSTR("RB_LoadingBrain");
  v1070[1] = CFSTR("LoadBrain");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1070, v1069, 2);
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  v1096[12] = v186;
  v1095[13] = CFSTR("RB_PerformRollbackPrepare");
  v1067[0] = v3;
  v1067[1] = v2;
  v1068[0] = CFSTR("RB_RollingBackPrepare");
  v1068[1] = CFSTR("RollbackUpdatePrepare");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1068, v1067, 2);
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  v1096[13] = v185;
  v1095[14] = CFSTR("RB_PerformRollbackSuspend");
  v1065[0] = v3;
  v1065[1] = v2;
  v1066[0] = CFSTR("RB_RollingBackSuspend");
  v1066[1] = CFSTR("RollbackUpdateSuspend");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1066, v1065, 2);
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  v1096[14] = v184;
  v1095[15] = CFSTR("RB_PerformRollbackResume");
  v1063[0] = v3;
  v1063[1] = v2;
  v1064[0] = CFSTR("RB_RollingBackResume");
  v1064[1] = CFSTR("RollbackUpdateResume");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1064, v1063, 2);
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  v1096[15] = v183;
  v1095[16] = CFSTR("RB_PerformRollbackApply");
  v1061[0] = v3;
  v1061[1] = v2;
  v1062[0] = CFSTR("RB_RollingBackApply");
  v1062[1] = CFSTR("RollbackUpdateApply");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1062, v1061, 2);
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  v1096[16] = v182;
  v1095[17] = CFSTR("RB_RollbackAppleSuccess");
  v1059[0] = v3;
  v1059[1] = v2;
  v1060[0] = CFSTR("AwaitingReboot");
  v1060[1] = CFSTR("ReportRollbackSucceeded");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1060, v1059, 2);
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  v1096[17] = v181;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1096, v1095, 18);
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[12] = v180;
  v1727[13] = CFSTR("Resuming");
  v1057[0] = CFSTR("TargetBrainLoaded");
  v1055 = v2;
  v1056 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1056, &v1055, 1);
  v559 = (void *)objc_claimAutoreleasedReturnValue();
  v1058[0] = v559;
  v1057[1] = CFSTR("TargetDownloadPreflighted");
  v1053 = v2;
  v1054 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1054, &v1053, 1);
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  v1058[1] = v179;
  v1057[2] = CFSTR("TargetDownloaded");
  v1051 = v2;
  v1052 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1052, &v1051, 1);
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  v1058[2] = v178;
  v1057[3] = CFSTR("TargetPrepared");
  v1049 = v2;
  v1050 = CFSTR("UpdateTarget");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1050, &v1049, 1);
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  v1058[3] = v177;
  v1057[4] = CFSTR("TargetApplied");
  v1047 = v2;
  v1048 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1048, &v1047, 1);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  v1058[4] = v176;
  v1057[5] = CFSTR("TargetRollback");
  v1045 = v2;
  v1046 = CFSTR("DecideCancelBeforeRollback");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1046, &v1045, 1);
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  v1058[5] = v175;
  v1057[6] = CFSTR("ResumeCurrentUpdate");
  v1043 = v2;
  v1044 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1044, &v1043, 1);
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  v1058[6] = v174;
  v1057[7] = CFSTR("CancelCurrentUpdate");
  v1041 = v3;
  v1042 = CFSTR("Canceling");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1042, &v1041, 1);
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  v1058[7] = v173;
  v1057[8] = CFSTR("ResumeSuccess");
  v1039 = v2;
  v1040 = CFSTR("DecideApplyUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1040, &v1039, 1);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  v1058[8] = v172;
  v1057[9] = CFSTR("ResumeFailed");
  v1037[0] = v3;
  v1037[1] = v2;
  v1038[0] = CFSTR("Prepared");
  v1038[1] = CFSTR("ReportApplyFailed");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1038, v1037, 2);
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  v1058[9] = v171;
  v1057[10] = CFSTR("ResumeSuccessAtTarget");
  v1035[0] = v3;
  v1035[1] = v2;
  v1036[0] = CFSTR("Prepared");
  v1036[1] = CFSTR("ReportPrepared");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1036, v1035, 2);
  v558 = (void *)objc_claimAutoreleasedReturnValue();
  v1058[10] = v558;
  v1057[11] = CFSTR("PerformApply");
  v1033[0] = v3;
  v1033[1] = v2;
  v1034[0] = CFSTR("Applying");
  v1034[1] = CFSTR("ApplyUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1034, v1033, 2);
  v557 = (void *)objc_claimAutoreleasedReturnValue();
  v1058[11] = v557;
  v1057[12] = CFSTR("ApplySuccess");
  v1031[0] = v3;
  v1031[1] = v2;
  v1032[0] = CFSTR("AwaitingReboot");
  v1032[1] = CFSTR("ReportApplied");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1032, v1031, 2);
  v555 = (void *)objc_claimAutoreleasedReturnValue();
  v1058[12] = v555;
  v1057[13] = CFSTR("RB_CancelNonRollbackUpdate");
  v1029 = v3;
  v1030 = CFSTR("RB_Canceling");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1030, &v1029, 1);
  v553 = (void *)objc_claimAutoreleasedReturnValue();
  v1058[13] = v553;
  v1057[14] = CFSTR("RB_BeginRollback");
  v1027[0] = v3;
  v1027[1] = v2;
  v1028[0] = CFSTR("RB_ReadyToBegin");
  v1028[1] = CFSTR("LoadBrainRollback");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1028, v1027, 2);
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  v1058[14] = v170;
  v1057[15] = CFSTR("RB_PerformLoadBrain");
  v1025[0] = v3;
  v1025[1] = v2;
  v1026[0] = CFSTR("RB_LoadingBrain");
  v1026[1] = CFSTR("LoadBrain");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1026, v1025, 2);
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  v1058[15] = v169;
  v1057[16] = CFSTR("RB_PerformRollbackPrepare");
  v1023[0] = v3;
  v1023[1] = v2;
  v1024[0] = CFSTR("RB_RollingBackPrepare");
  v1024[1] = CFSTR("RollbackUpdatePrepare");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1024, v1023, 2);
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v1058[16] = v168;
  v1057[17] = CFSTR("RB_PerformRollbackSuspend");
  v1021[0] = v3;
  v1021[1] = v2;
  v1022[0] = CFSTR("RB_RollingBackSuspend");
  v1022[1] = CFSTR("RollbackUpdateSuspend");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1022, v1021, 2);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  v1058[17] = v167;
  v1057[18] = CFSTR("RB_PerformRollbackResume");
  v1019[0] = v3;
  v1019[1] = v2;
  v1020[0] = CFSTR("RB_RollingBackResume");
  v1020[1] = CFSTR("RollbackUpdateResume");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1020, v1019, 2);
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  v1058[18] = v165;
  v1057[19] = CFSTR("RB_PerformRollbackApply");
  v1017[0] = v3;
  v1017[1] = v2;
  v1018[0] = CFSTR("RB_RollingBackApply");
  v1018[1] = CFSTR("RollbackUpdateApply");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1018, v1017, 2);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  v1058[19] = v164;
  v1057[20] = CFSTR("RB_RollbackAppleSuccess");
  v1015[0] = v3;
  v1015[1] = v2;
  v1016[0] = CFSTR("AwaitingReboot");
  v1016[1] = CFSTR("ReportRollbackSucceeded");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1016, v1015, 2);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  v1058[20] = v163;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1058, v1057, 21);
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[13] = v162;
  v1727[14] = CFSTR("Applying");
  v1013[0] = CFSTR("TargetBrainLoaded");
  v1011 = v2;
  v1012 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1012, &v1011, 1);
  v562 = (void *)objc_claimAutoreleasedReturnValue();
  v1014[0] = v562;
  v1013[1] = CFSTR("TargetDownloadPreflighted");
  v1009 = v2;
  v1010 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1010, &v1009, 1);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  v1014[1] = v161;
  v1013[2] = CFSTR("TargetDownloaded");
  v1007 = v2;
  v1008 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1008, &v1007, 1);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  v1014[2] = v160;
  v1013[3] = CFSTR("TargetPrepared");
  v1005 = v2;
  v1006 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1006, &v1005, 1);
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  v1014[3] = v159;
  v1013[4] = CFSTR("TargetApplied");
  v1003 = v2;
  v1004 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1004, &v1003, 1);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  v1014[4] = v158;
  v1013[5] = CFSTR("TargetRollback");
  v1001 = v2;
  v1002 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1002, &v1001, 1);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v1014[5] = v157;
  v1013[6] = CFSTR("ResumeCurrentUpdate");
  v999 = v2;
  v1000 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1000, &v999, 1);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v1014[6] = v156;
  v1013[7] = CFSTR("CancelCurrentUpdate");
  v997 = v2;
  v998 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v998, &v997, 1);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v1014[7] = v155;
  v1013[8] = CFSTR("ApplyProgress");
  v995 = v2;
  v996 = CFSTR("ReportApplyProgress");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v996, &v995, 1);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  v1014[8] = v154;
  v1013[9] = CFSTR("ApplySuccess");
  v993[0] = v3;
  v993[1] = v2;
  v994[0] = CFSTR("AwaitingReboot");
  v994[1] = CFSTR("ReportApplied");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v994, v993, 2);
  v560 = (void *)objc_claimAutoreleasedReturnValue();
  v1014[9] = v560;
  v1013[10] = CFSTR("ApplyFailed");
  v991[0] = v3;
  v991[1] = v2;
  v992[0] = CFSTR("Prepared");
  v992[1] = CFSTR("ReportApplyFailed");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v992, v991, 2);
  v550 = (void *)objc_claimAutoreleasedReturnValue();
  v1014[10] = v550;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1014, v1013, 11);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[14] = v153;
  v1727[15] = CFSTR("AwaitingReboot");
  v989[0] = CFSTR("TargetBrainLoaded");
  v987 = v2;
  v988 = CFSTR("ReportAnomalyAPIEnd");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v988, &v987, 1);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  v990[0] = v152;
  v989[1] = CFSTR("TargetDownloadPreflighted");
  v985 = v2;
  v986 = CFSTR("ReportAnomalyAPIEnd");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v986, &v985, 1);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v990[1] = v151;
  v989[2] = CFSTR("TargetDownloaded");
  v983 = v2;
  v984 = CFSTR("ReportAnomalyAPIEnd");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v984, &v983, 1);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  v990[2] = v150;
  v989[3] = CFSTR("TargetPrepared");
  v981 = v2;
  v982 = CFSTR("ReportAnomalyAPIEnd");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v982, &v981, 1);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v990[3] = v149;
  v989[4] = CFSTR("TargetApplied");
  v979 = v2;
  v980 = CFSTR("ReportAnomalyAPIEnd");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v980, &v979, 1);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  v990[4] = v148;
  v989[5] = CFSTR("TargetRollback");
  v977 = v2;
  v978 = CFSTR("ReportAnomalyAPIEnd");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v978, &v977, 1);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v990[5] = v147;
  v989[6] = CFSTR("ResumeCurrentUpdate");
  v975 = v2;
  v976 = CFSTR("ReportAnomalyAPIEnd");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v976, &v975, 1);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v990[6] = v146;
  v989[7] = CFSTR("CancelCurrentUpdate");
  v973 = v2;
  v974 = CFSTR("ReportAnomalyAPIEnd");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v974, &v973, 1);
  v531 = (void *)objc_claimAutoreleasedReturnValue();
  v990[7] = v531;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v990, v989, 8);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[15] = v145;
  v1727[16] = CFSTR("RemovingSU");
  v971[0] = CFSTR("TargetBrainLoaded");
  v969 = v2;
  v970 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v970, &v969, 1);
  v538 = (void *)objc_claimAutoreleasedReturnValue();
  v972[0] = v538;
  v971[1] = CFSTR("TargetDownloadPreflighted");
  v967 = v2;
  v968 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v968, &v967, 1);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v972[1] = v144;
  v971[2] = CFSTR("TargetDownloaded");
  v965 = v2;
  v966 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v966, &v965, 1);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v972[2] = v143;
  v971[3] = CFSTR("TargetPrepared");
  v963 = v2;
  v964 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v964, &v963, 1);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v972[3] = v142;
  v971[4] = CFSTR("TargetApplied");
  v961 = v2;
  v962 = v535;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v962, &v961, 1);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v972[4] = v141;
  v971[5] = CFSTR("TargetRollback");
  v959 = v3;
  v960 = CFSTR("RB_Canceling");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v960, &v959, 1);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v972[5] = v140;
  v971[6] = CFSTR("ResumeCurrentUpdate");
  v957 = v2;
  v958 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v958, &v957, 1);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v972[6] = v139;
  v971[7] = CFSTR("CancelCurrentUpdate");
  v955 = v3;
  v956 = CFSTR("Canceling");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v956, &v955, 1);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v972[7] = v138;
  v971[8] = CFSTR("SURemoved");
  v953 = v2;
  v954 = CFSTR("ChooseErrorSpaceCheck");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v954, &v953, 1);
  v527 = (void *)objc_claimAutoreleasedReturnValue();
  v972[8] = v527;
  v971[9] = CFSTR("PerformErrorSpaceCheck");
  v951[0] = v3;
  v951[1] = v2;
  v952[0] = CFSTR("CheckingSpaceAfterError");
  v952[1] = CFSTR("CheckSpace");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v952, v951, 2);
  v534 = (void *)objc_claimAutoreleasedReturnValue();
  v972[9] = v534;
  v971[10] = CFSTR("SkipErrorSpaceCheck");
  v949[0] = v3;
  v949[1] = v2;
  v950[0] = CFSTR("ReadyToBegin");
  v950[1] = CFSTR("ReportAttemptFailure");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v950, v949, 2);
  v528 = (void *)objc_claimAutoreleasedReturnValue();
  v972[10] = v528;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v972, v971, 11);
  v526 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[16] = v526;
  v1727[17] = CFSTR("CheckingSpaceAfterError");
  v947[0] = CFSTR("TargetBrainLoaded");
  v945 = v2;
  v946 = v535;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v946, &v945, 1);
  v529 = (void *)objc_claimAutoreleasedReturnValue();
  v948[0] = v529;
  v947[1] = CFSTR("TargetDownloadPreflighted");
  v943 = v2;
  v944 = v535;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v944, &v943, 1);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v948[1] = v137;
  v947[2] = CFSTR("TargetDownloaded");
  v941 = v2;
  v942 = v535;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v942, &v941, 1);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v948[2] = v136;
  v947[3] = CFSTR("TargetPrepared");
  v939 = v2;
  v940 = v535;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v940, &v939, 1);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v948[3] = v135;
  v947[4] = CFSTR("TargetApplied");
  v937 = v2;
  v938 = v535;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v938, &v937, 1);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v948[4] = v134;
  v947[5] = CFSTR("TargetRollback");
  v935 = v2;
  v936 = CFSTR("DecideCancelBeforeRollback");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v936, &v935, 1);
  v547 = (void *)objc_claimAutoreleasedReturnValue();
  v948[5] = v547;
  v947[6] = CFSTR("ResumeCurrentUpdate");
  v933 = v2;
  v934 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v934, &v933, 1);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v948[6] = v133;
  v947[7] = CFSTR("CancelCurrentUpdate");
  v931 = v3;
  v932 = CFSTR("Canceling");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v932, &v931, 1);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v948[7] = v132;
  v947[8] = CFSTR("SpaceCheckHaveSpace");
  v929[0] = v3;
  v929[1] = v2;
  v930[0] = CFSTR("ReadyToBegin");
  v930[1] = CFSTR("ReportAttemptFailure");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v930, v929, 2);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v948[8] = v131;
  v947[9] = CFSTR("SpaceCheckNoSpace");
  v927[0] = v3;
  v927[1] = v2;
  v928[0] = CFSTR("ReadyToBegin");
  v928[1] = CFSTR("ReportAttemptFailure");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v928, v927, 2);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v948[9] = v130;
  v947[10] = CFSTR("SpaceCheckFailed");
  v925[0] = v3;
  v925[1] = v2;
  v926[0] = CFSTR("ReadyToBegin");
  v926[1] = CFSTR("ReportAttemptFailure");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v926, v925, 2);
  v533 = (void *)objc_claimAutoreleasedReturnValue();
  v948[10] = v533;
  v947[11] = CFSTR("RB_CancelNonRollbackUpdate");
  v923 = v3;
  v924 = CFSTR("RB_Canceling");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v924, &v923, 1);
  v549 = (void *)objc_claimAutoreleasedReturnValue();
  v948[11] = v549;
  v947[12] = CFSTR("RB_BeginRollback");
  v921[0] = v3;
  v921[1] = v2;
  v922[0] = CFSTR("RB_ReadyToBegin");
  v922[1] = CFSTR("LoadBrainRollback");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v922, v921, 2);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v948[12] = v129;
  v947[13] = CFSTR("RB_PerformLoadBrain");
  v919[0] = v3;
  v919[1] = v2;
  v920[0] = CFSTR("RB_LoadingBrain");
  v920[1] = CFSTR("LoadBrain");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v920, v919, 2);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v948[13] = v128;
  v947[14] = CFSTR("RB_PerformRollbackPrepare");
  v917[0] = v3;
  v917[1] = v2;
  v918[0] = CFSTR("RB_RollingBackPrepare");
  v918[1] = CFSTR("RollbackUpdatePrepare");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v918, v917, 2);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v948[14] = v127;
  v947[15] = CFSTR("RB_PerformRollbackSuspend");
  v915[0] = v3;
  v915[1] = v2;
  v916[0] = CFSTR("RB_RollingBackSuspend");
  v916[1] = CFSTR("RollbackUpdateSuspend");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v916, v915, 2);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v948[15] = v126;
  v947[16] = CFSTR("RB_PerformRollbackResume");
  v913[0] = v3;
  v913[1] = v2;
  v914[0] = CFSTR("RB_RollingBackResume");
  v914[1] = CFSTR("RollbackUpdateResume");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v914, v913, 2);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v948[16] = v125;
  v947[17] = CFSTR("RB_PerformRollbackApply");
  v911[0] = v3;
  v911[1] = v2;
  v912[0] = CFSTR("RB_RollingBackApply");
  v912[1] = CFSTR("RollbackUpdateApply");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v912, v911, 2);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v948[17] = v124;
  v947[18] = CFSTR("RB_RollbackAppleSuccess");
  v909[0] = v3;
  v909[1] = v2;
  v910[0] = CFSTR("AwaitingReboot");
  v910[1] = CFSTR("ReportRollbackSucceeded");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v910, v909, 2);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v948[18] = v123;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v948, v947, 19);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[17] = v122;
  v1727[18] = CFSTR("Canceling");
  v907[0] = CFSTR("TargetBrainLoaded");
  v905 = v2;
  v906 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v906, &v905, 1);
  v554 = (void *)objc_claimAutoreleasedReturnValue();
  v908[0] = v554;
  v907[1] = CFSTR("TargetDownloadPreflighted");
  v903 = v2;
  v904 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v904, &v903, 1);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v908[1] = v121;
  v907[2] = CFSTR("TargetDownloaded");
  v901 = v2;
  v902 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v902, &v901, 1);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v908[2] = v120;
  v907[3] = CFSTR("TargetPrepared");
  v899 = v2;
  v900 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v900, &v899, 1);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v908[3] = v119;
  v907[4] = CFSTR("TargetApplied");
  v897 = v2;
  v898 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v898, &v897, 1);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v908[4] = v118;
  v907[5] = CFSTR("TargetRollback");
  v895 = v3;
  v896 = CFSTR("RB_Canceling");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v896, &v895, 1);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v908[5] = v117;
  v907[6] = CFSTR("ResumeCurrentUpdate");
  v893 = v2;
  v894 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v894, &v893, 1);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v908[6] = v116;
  v907[7] = CFSTR("CancelCurrentUpdate");
  v891 = v2;
  v892 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v892, &v891, 1);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v908[7] = v115;
  v907[8] = CFSTR("BrainLoadProgress");
  v889 = v2;
  v890 = v535;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v890, &v889, 1);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v908[8] = v114;
  v907[9] = CFSTR("BrainLoadSuccess");
  v887[0] = v3;
  v887[1] = v2;
  v888[0] = CFSTR("ReadyToBegin");
  v888[1] = CFSTR("ReportCanceled");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v888, v887, 2);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v908[9] = v113;
  v907[10] = CFSTR("BrainLoadFailed");
  v885[0] = v3;
  v885[1] = v2;
  v886[0] = CFSTR("ReadyToBegin");
  v886[1] = CFSTR("ReportCanceled");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v886, v885, 2);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v908[10] = v112;
  v907[11] = CFSTR("PreflightSuccess");
  v883[0] = v3;
  v883[1] = v2;
  v884[0] = CFSTR("ReadyToBegin");
  v884[1] = CFSTR("ReportCanceled");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v884, v883, 2);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v908[11] = v111;
  v907[12] = CFSTR("PreflightFailed");
  v881[0] = v3;
  v881[1] = v2;
  v882[0] = CFSTR("ReadyToBegin");
  v882[1] = CFSTR("ReportCanceled");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v882, v881, 2);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v908[12] = v110;
  v907[13] = CFSTR("PrepareProgress");
  v879 = v2;
  v880 = v535;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v880, &v879, 1);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v908[13] = v109;
  v907[14] = CFSTR("PrepareSuccess");
  v877 = v2;
  v878 = CFSTR("RemovePrepared");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v878, &v877, 1);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v908[14] = v108;
  v907[15] = CFSTR("PrepareFailed");
  v875 = v2;
  v876 = CFSTR("RemoveSU");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v876, &v875, 1);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v908[15] = v107;
  v907[16] = CFSTR("SuspendSuccess");
  v873 = v2;
  v874 = CFSTR("RemovePrepared");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v874, &v873, 1);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v908[16] = v106;
  v907[17] = CFSTR("SuspendFailed");
  v871 = v2;
  v872 = CFSTR("RemovePrepared");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v872, &v871, 1);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v908[17] = v105;
  v907[18] = CFSTR("ResumeSuccess");
  v869 = v2;
  v870 = CFSTR("RemovePrepared");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v870, &v869, 1);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v908[18] = v104;
  v907[19] = CFSTR("ResumeFailed");
  v867 = v2;
  v868 = CFSTR("RemovePrepared");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v868, &v867, 1);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v908[19] = v103;
  v907[20] = CFSTR("PrepareRemoved");
  v865 = v2;
  v866 = CFSTR("RemoveSU");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v866, &v865, 1);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v908[20] = v102;
  v907[21] = CFSTR("DownloadProgress");
  v863 = v2;
  v864 = v535;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v864, &v863, 1);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v908[21] = v101;
  v907[22] = CFSTR("DownloadStalled");
  v861 = v2;
  v862 = v535;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v862, &v861, 1);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v908[22] = v100;
  v907[23] = CFSTR("DownloadSuccess");
  v859 = v2;
  v860 = v535;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v860, &v859, 1);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v908[23] = v99;
  v907[24] = CFSTR("DownloadFailed");
  v857 = v2;
  v858 = v535;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v858, &v857, 1);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v908[24] = v98;
  v907[25] = CFSTR("SURemoved");
  v855[0] = v3;
  v855[1] = v2;
  v856[0] = CFSTR("ReadyToBegin");
  v856[1] = CFSTR("ReportCanceled");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v856, v855, 2);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v908[25] = v97;
  v907[26] = CFSTR("SpaceCheckHaveSpace");
  v853[0] = v3;
  v853[1] = v2;
  v854[0] = CFSTR("ReadyToBegin");
  v854[1] = CFSTR("ReportCanceled");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v854, v853, 2);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v908[26] = v96;
  v907[27] = CFSTR("SpaceCheckNoSpace");
  v851[0] = v3;
  v851[1] = v2;
  v852[0] = CFSTR("ReadyToBegin");
  v852[1] = CFSTR("ReportCanceled");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v852, v851, 2);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v908[27] = v95;
  v907[28] = CFSTR("SpaceCheckFailed");
  v849[0] = v3;
  v849[1] = v2;
  v850[0] = CFSTR("ReadyToBegin");
  v850[1] = CFSTR("ReportCanceled");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v850, v849, 2);
  v521 = (void *)objc_claimAutoreleasedReturnValue();
  v908[28] = v521;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v908, v907, 29);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[18] = v94;
  v1727[19] = CFSTR("RB_Canceling");
  v847[0] = CFSTR("TargetBrainLoaded");
  v845 = v2;
  v846 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v846, &v845, 1);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v848[0] = v93;
  v847[1] = CFSTR("TargetDownloadPreflighted");
  v843 = v2;
  v844 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v844, &v843, 1);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v848[1] = v92;
  v847[2] = CFSTR("TargetDownloaded");
  v841 = v2;
  v842 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v842, &v841, 1);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v848[2] = v91;
  v847[3] = CFSTR("TargetPrepared");
  v839 = v2;
  v840 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v840, &v839, 1);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v848[3] = v90;
  v847[4] = CFSTR("TargetApplied");
  v837 = v2;
  v838 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v838, &v837, 1);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v848[4] = v89;
  v847[5] = CFSTR("TargetRollback");
  v835 = v2;
  v836 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v836, &v835, 1);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v848[5] = v88;
  v847[6] = CFSTR("ResumeCurrentUpdate");
  v833 = v2;
  v834 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v834, &v833, 1);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v848[6] = v87;
  v847[7] = CFSTR("CancelCurrentUpdate");
  v831 = v2;
  v832 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v832, &v831, 1);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v848[7] = v86;
  v847[8] = CFSTR("BrainLoadProgress");
  v829 = v2;
  v830 = v535;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v830, &v829, 1);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v848[8] = v85;
  v847[9] = CFSTR("BrainLoadSuccess");
  v827[0] = v3;
  v827[1] = v2;
  v828[0] = CFSTR("RB_ReadyToBegin");
  v828[1] = CFSTR("LoadBrainRollback");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v828, v827, 2);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v848[9] = v84;
  v847[10] = CFSTR("BrainLoadFailed");
  v825[0] = v3;
  v825[1] = v2;
  v826[0] = CFSTR("RB_ReadyToBegin");
  v826[1] = CFSTR("LoadBrainRollback");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v826, v825, 2);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v848[10] = v83;
  v847[11] = CFSTR("PreflightSuccess");
  v823[0] = v3;
  v823[1] = v2;
  v824[0] = CFSTR("RB_ReadyToBegin");
  v824[1] = CFSTR("LoadBrainRollback");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v824, v823, 2);
  v514 = (void *)objc_claimAutoreleasedReturnValue();
  v848[11] = v514;
  v847[12] = CFSTR("PreflightFailed");
  v821[0] = v3;
  v821[1] = v2;
  v822[0] = CFSTR("RB_ReadyToBegin");
  v822[1] = CFSTR("LoadBrainRollback");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v822, v821, 2);
  v515 = (void *)objc_claimAutoreleasedReturnValue();
  v848[12] = v515;
  v847[13] = CFSTR("PrepareProgress");
  v819 = v2;
  v820 = v535;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v820, &v819, 1);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v848[13] = v82;
  v847[14] = CFSTR("PrepareSuccess");
  v817 = v2;
  v818 = CFSTR("RemovePrepared");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v818, &v817, 1);
  v540 = (void *)objc_claimAutoreleasedReturnValue();
  v848[14] = v540;
  v847[15] = CFSTR("PrepareFailed");
  v815 = v2;
  v816 = CFSTR("RemoveSU");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v816, &v815, 1);
  v539 = (void *)objc_claimAutoreleasedReturnValue();
  v848[15] = v539;
  v847[16] = CFSTR("SuspendSuccess");
  v813 = v2;
  v814 = CFSTR("RemovePrepared");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v814, &v813, 1);
  v545 = (void *)objc_claimAutoreleasedReturnValue();
  v848[16] = v545;
  v847[17] = CFSTR("SuspendFailed");
  v811 = v2;
  v812 = CFSTR("RemovePrepared");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v812, &v811, 1);
  v544 = (void *)objc_claimAutoreleasedReturnValue();
  v848[17] = v544;
  v847[18] = CFSTR("ResumeSuccess");
  v809 = v2;
  v810 = CFSTR("RemovePrepared");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v810, &v809, 1);
  v556 = (void *)objc_claimAutoreleasedReturnValue();
  v848[18] = v556;
  v847[19] = CFSTR("ResumeFailed");
  v807 = v2;
  v808 = CFSTR("RemovePrepared");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v808, &v807, 1);
  v548 = (void *)objc_claimAutoreleasedReturnValue();
  v848[19] = v548;
  v847[20] = CFSTR("PrepareRemoved");
  v805 = v2;
  v806 = CFSTR("RemoveSU");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v806, &v805, 1);
  v543 = (void *)objc_claimAutoreleasedReturnValue();
  v848[20] = v543;
  v847[21] = CFSTR("DownloadProgress");
  v803 = v2;
  v804 = v535;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v804, &v803, 1);
  v532 = (void *)objc_claimAutoreleasedReturnValue();
  v848[21] = v532;
  v847[22] = CFSTR("DownloadStalled");
  v801 = v2;
  v802 = v535;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v802, &v801, 1);
  v530 = (void *)objc_claimAutoreleasedReturnValue();
  v848[22] = v530;
  v847[23] = CFSTR("DownloadSuccess");
  v799 = v2;
  v800 = v535;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v800, &v799, 1);
  v519 = (void *)objc_claimAutoreleasedReturnValue();
  v848[23] = v519;
  v847[24] = CFSTR("DownloadFailed");
  v797 = v2;
  v798 = v535;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v798, &v797, 1);
  v536 = (void *)objc_claimAutoreleasedReturnValue();
  v848[24] = v536;
  v847[25] = CFSTR("SpaceCheckHaveSpace");
  v795 = v2;
  v796 = CFSTR("DecideBeginRollback");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v796, &v795, 1);
  v518 = (void *)objc_claimAutoreleasedReturnValue();
  v848[25] = v518;
  v847[26] = CFSTR("SpaceCheckNoSpace");
  v793 = v2;
  v794 = CFSTR("DecideBeginRollback");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v794, &v793, 1);
  v520 = (void *)objc_claimAutoreleasedReturnValue();
  v848[26] = v520;
  v847[27] = CFSTR("SpaceCheckFailed");
  v791 = v2;
  v792 = CFSTR("DecideBeginRollback");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v792, &v791, 1);
  v525 = (void *)objc_claimAutoreleasedReturnValue();
  v848[27] = v525;
  v847[28] = CFSTR("SURemoved");
  v789 = v2;
  v790 = CFSTR("DecideBeginRollback");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v790, &v789, 1);
  v564 = (void *)objc_claimAutoreleasedReturnValue();
  v848[28] = v564;
  v847[29] = CFSTR("RB_BeginRollback");
  v787[0] = v3;
  v787[1] = v2;
  v788[0] = CFSTR("RB_ReadyToBegin");
  v788[1] = CFSTR("LoadBrainRollback");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v788, v787, 2);
  v551 = (void *)objc_claimAutoreleasedReturnValue();
  v848[29] = v551;
  v847[30] = CFSTR("RB_PerformLoadBrain");
  v785[0] = v3;
  v785[1] = v2;
  v786[0] = CFSTR("RB_LoadingBrain");
  v786[1] = CFSTR("LoadBrain");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v786, v785, 2);
  v517 = (void *)objc_claimAutoreleasedReturnValue();
  v848[30] = v517;
  v847[31] = CFSTR("RB_PerformRollbackPrepare");
  v783[0] = v3;
  v783[1] = v2;
  v784[0] = CFSTR("RB_RollingBackPrepare");
  v784[1] = CFSTR("RollbackUpdatePrepare");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v784, v783, 2);
  v516 = (void *)objc_claimAutoreleasedReturnValue();
  v848[31] = v516;
  v847[32] = CFSTR("RB_PerformRollbackSuspend");
  v781[0] = v3;
  v781[1] = v2;
  v782[0] = CFSTR("RB_RollingBackSuspend");
  v782[1] = CFSTR("RollbackUpdateSuspend");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v782, v781, 2);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v848[32] = v81;
  v847[33] = CFSTR("RB_PerformRollbackResume");
  v779[0] = v3;
  v779[1] = v2;
  v780[0] = CFSTR("RB_RollingBackResume");
  v780[1] = CFSTR("RollbackUpdateResume");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v780, v779, 2);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v848[33] = v80;
  v847[34] = CFSTR("RB_PerformRollbackApply");
  v777[0] = v3;
  v777[1] = v2;
  v778[0] = CFSTR("RB_RollingBackApply");
  v778[1] = CFSTR("RollbackUpdateApply");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v778, v777, 2);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v848[34] = v79;
  v847[35] = CFSTR("RB_RollbackAppleSuccess");
  v775[0] = v3;
  v775[1] = v2;
  v776[0] = CFSTR("AwaitingReboot");
  v776[1] = CFSTR("ReportRollbackSucceeded");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v776, v775, 2);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v848[35] = v78;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v848, v847, 36);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[19] = v77;
  v1727[20] = CFSTR("RB_ReadyToBegin");
  v773[0] = CFSTR("TargetBrainLoaded");
  v771 = v2;
  v772 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v772, &v771, 1);
  v561 = (void *)objc_claimAutoreleasedReturnValue();
  v774[0] = v561;
  v773[1] = CFSTR("TargetDownloadPreflighted");
  v769 = v2;
  v770 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v770, &v769, 1);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v774[1] = v76;
  v773[2] = CFSTR("TargetDownloaded");
  v767 = v2;
  v768 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v768, &v767, 1);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v774[2] = v75;
  v773[3] = CFSTR("TargetPrepared");
  v765 = v2;
  v766 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v766, &v765, 1);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v774[3] = v74;
  v773[4] = CFSTR("TargetApplied");
  v763 = v2;
  v764 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v764, &v763, 1);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v774[4] = v73;
  v773[5] = CFSTR("TargetRollback");
  v761 = v2;
  v762 = CFSTR("LoadBrainRollback");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v762, &v761, 1);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v774[5] = v72;
  v773[6] = CFSTR("ResumeCurrentUpdate");
  v759 = v2;
  v760 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v760, &v759, 1);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v774[6] = v71;
  v773[7] = CFSTR("CancelCurrentUpdate");
  v757 = v2;
  v758 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v758, &v757, 1);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v774[7] = v70;
  v773[8] = CFSTR("RB_PerformLoadBrain");
  v755[0] = v3;
  v755[1] = v2;
  v756[0] = CFSTR("RB_LoadingBrain");
  v756[1] = CFSTR("LoadBrain");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v756, v755, 2);
  v563 = (void *)objc_claimAutoreleasedReturnValue();
  v774[8] = v563;
  v773[9] = CFSTR("RB_PerformRollbackPrepare");
  v753[0] = v3;
  v753[1] = v2;
  v754[0] = CFSTR("RB_RollingBackPrepare");
  v754[1] = CFSTR("RollbackUpdatePrepare");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v754, v753, 2);
  v552 = (void *)objc_claimAutoreleasedReturnValue();
  v774[9] = v552;
  v773[10] = CFSTR("RB_PerformRollbackSuspend");
  v751[0] = v3;
  v751[1] = v2;
  v752[0] = CFSTR("RB_RollingBackSuspend");
  v752[1] = CFSTR("RollbackUpdateSuspend");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v752, v751, 2);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v774[10] = v69;
  v773[11] = CFSTR("RB_PerformRollbackResume");
  v749[0] = v3;
  v749[1] = v2;
  v750[0] = CFSTR("RB_RollingBackResume");
  v750[1] = CFSTR("RollbackUpdateResume");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v750, v749, 2);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v774[11] = v68;
  v773[12] = CFSTR("RB_PerformRollbackApply");
  v747[0] = v3;
  v747[1] = v2;
  v748[0] = CFSTR("RB_RollingBackApply");
  v748[1] = CFSTR("RollbackUpdateApply");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v748, v747, 2);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v774[12] = v67;
  v773[13] = CFSTR("RB_RollbackAppleSuccess");
  v745[0] = v3;
  v745[1] = v2;
  v746[0] = CFSTR("AwaitingReboot");
  v746[1] = CFSTR("ReportRollbackSucceeded");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v746, v745, 2);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v774[13] = v66;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v774, v773, 14);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[20] = v65;
  v1727[21] = CFSTR("RB_LoadingBrain");
  v743[0] = CFSTR("TargetBrainLoaded");
  v741 = v2;
  v742 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v742, &v741, 1);
  v546 = (void *)objc_claimAutoreleasedReturnValue();
  v744[0] = v546;
  v743[1] = CFSTR("TargetDownloadPreflighted");
  v739 = v2;
  v740 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v740, &v739, 1);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v744[1] = v64;
  v743[2] = CFSTR("TargetDownloaded");
  v737 = v2;
  v738 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v738, &v737, 1);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v744[2] = v63;
  v743[3] = CFSTR("TargetPrepared");
  v735 = v2;
  v736 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v736, &v735, 1);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v744[3] = v62;
  v743[4] = CFSTR("TargetApplied");
  v733 = v2;
  v734 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v734, &v733, 1);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v744[4] = v61;
  v743[5] = CFSTR("TargetRollback");
  v731 = v2;
  v732 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v732, &v731, 1);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v744[5] = v60;
  v743[6] = CFSTR("ResumeCurrentUpdate");
  v729 = v2;
  v730 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v730, &v729, 1);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v744[6] = v59;
  v743[7] = CFSTR("CancelCurrentUpdate");
  v727 = v3;
  v728 = CFSTR("RB_Canceling");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v728, &v727, 1);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v744[7] = v58;
  v743[8] = CFSTR("BrainLoadProgress");
  v725 = v2;
  v726 = CFSTR("ReportBrainLoadProgress");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v726, &v725, 1);
  v524 = (void *)objc_claimAutoreleasedReturnValue();
  v744[8] = v524;
  v743[9] = CFSTR("BrainLoadSuccess");
  v723[0] = v3;
  v723[1] = v2;
  v724[0] = CFSTR("RB_BrainLoaded");
  v724[1] = CFSTR("DecideRollbackUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v724, v723, 2);
  v523 = (void *)objc_claimAutoreleasedReturnValue();
  v744[9] = v523;
  v743[10] = CFSTR("BrainLoadFailed");
  v721[0] = v3;
  v721[1] = v2;
  v722[0] = CFSTR("ReadyToBegin");
  v722[1] = CFSTR("ReportRollbackFailed");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v722, v721, 2);
  v522 = (void *)objc_claimAutoreleasedReturnValue();
  v744[10] = v522;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v744, v743, 11);
  v314 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[21] = v314;
  v1727[22] = CFSTR("RB_BrainLoaded");
  v719[0] = CFSTR("TargetBrainLoaded");
  v717 = v2;
  v718 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v718, &v717, 1);
  v295 = (void *)objc_claimAutoreleasedReturnValue();
  v720[0] = v295;
  v719[1] = CFSTR("TargetDownloadPreflighted");
  v715 = v2;
  v716 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v716, &v715, 1);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v720[1] = v57;
  v719[2] = CFSTR("TargetDownloaded");
  v713 = v2;
  v714 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v714, &v713, 1);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v720[2] = v56;
  v719[3] = CFSTR("TargetPrepared");
  v711 = v2;
  v712 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v712, &v711, 1);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v720[3] = v55;
  v719[4] = CFSTR("TargetApplied");
  v709 = v2;
  v710 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v710, &v709, 1);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v720[4] = v54;
  v719[5] = CFSTR("TargetRollback");
  v707 = v2;
  v708 = CFSTR("UpdateTarget");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v708, &v707, 1);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v720[5] = v53;
  v719[6] = CFSTR("ResumeCurrentUpdate");
  v705 = v2;
  v706 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v706, &v705, 1);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v720[6] = v52;
  v719[7] = CFSTR("CancelCurrentUpdate");
  v703[0] = v3;
  v703[1] = v2;
  v704[0] = CFSTR("RB_Canceling");
  v704[1] = CFSTR("RemoveSU");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v704, v703, 2);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v720[7] = v51;
  v719[8] = CFSTR("RB_PerformRollbackPrepare");
  v701[0] = v3;
  v701[1] = v2;
  v702[0] = CFSTR("RB_RollingBackPrepare");
  v702[1] = CFSTR("RollbackUpdatePrepare");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v702, v701, 2);
  v566 = (void *)objc_claimAutoreleasedReturnValue();
  v720[8] = v566;
  v719[9] = CFSTR("RB_PerformRollbackSuspend");
  v699[0] = v3;
  v699[1] = v2;
  v700[0] = CFSTR("RB_RollingBackSuspend");
  v700[1] = CFSTR("RollbackUpdateSuspend");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v700, v699, 2);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v720[9] = v50;
  v719[10] = CFSTR("RB_PerformRollbackResume");
  v697[0] = v3;
  v697[1] = v2;
  v698[0] = CFSTR("RB_RollingBackResume");
  v698[1] = CFSTR("RollbackUpdateResume");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v698, v697, 2);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v720[10] = v49;
  v719[11] = CFSTR("RB_PerformRollbackApply");
  v695[0] = v3;
  v695[1] = v2;
  v696[0] = CFSTR("RB_RollingBackApply");
  v696[1] = CFSTR("RollbackUpdateApply");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v696, v695, 2);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v720[11] = v48;
  v719[12] = CFSTR("RB_RollbackAppleSuccess");
  v693[0] = v3;
  v693[1] = v2;
  v694[0] = CFSTR("AwaitingReboot");
  v694[1] = CFSTR("ReportRollbackSucceeded");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v694, v693, 2);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v720[12] = v47;
  v719[13] = CFSTR("RB_RollbackFailed");
  v691[0] = v3;
  v691[1] = v2;
  v692[0] = CFSTR("ReadyToBegin");
  v692[1] = CFSTR("ReportRollbackFailed");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v692, v691, 2);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v720[13] = v46;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v720, v719, 14);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[22] = v45;
  v1727[23] = CFSTR("RB_RollingBackPrepare");
  v689[0] = CFSTR("TargetBrainLoaded");
  v687 = v2;
  v688 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v688, &v687, 1);
  v567 = (void *)objc_claimAutoreleasedReturnValue();
  v690[0] = v567;
  v689[1] = CFSTR("TargetDownloadPreflighted");
  v685 = v2;
  v686 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v686, &v685, 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v690[1] = v44;
  v689[2] = CFSTR("TargetDownloaded");
  v683 = v2;
  v684 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v684, &v683, 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v690[2] = v43;
  v689[3] = CFSTR("TargetPrepared");
  v681 = v2;
  v682 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v682, &v681, 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v690[3] = v42;
  v689[4] = CFSTR("TargetApplied");
  v679 = v2;
  v680 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v680, &v679, 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v690[4] = v41;
  v689[5] = CFSTR("TargetRollback");
  v677 = v2;
  v678 = CFSTR("UpdateTarget");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v678, &v677, 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v690[5] = v40;
  v689[6] = CFSTR("ResumeCurrentUpdate");
  v675 = v2;
  v676 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v676, &v675, 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v690[6] = v39;
  v689[7] = CFSTR("CancelCurrentUpdate");
  v673[0] = v3;
  v673[1] = v2;
  v674[0] = CFSTR("RB_Canceling");
  v674[1] = CFSTR("RemoveSU");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v674, v673, 2);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v690[7] = v38;
  v689[8] = CFSTR("PrepareProgress");
  v671 = v2;
  v672 = CFSTR("ReportPrepareProgress");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v672, &v671, 1);
  v541 = (void *)objc_claimAutoreleasedReturnValue();
  v690[8] = v541;
  v689[9] = CFSTR("RB_RollbackPrepareSuccess");
  v669 = v2;
  v670 = CFSTR("RollbackUpdateDecideSuspend");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v670, &v669, 1);
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v690[9] = v166;
  v689[10] = CFSTR("RB_PerformRollbackSuspend");
  v667[0] = v3;
  v667[1] = v2;
  v668[0] = CFSTR("RB_RollingBackSuspend");
  v668[1] = CFSTR("RollbackUpdateSuspend");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v668, v667, 2);
  v570 = (void *)objc_claimAutoreleasedReturnValue();
  v690[10] = v570;
  v689[11] = CFSTR("RB_PerformRollbackResume");
  v665[0] = v3;
  v665[1] = v2;
  v666[0] = CFSTR("RB_RollingBackResume");
  v666[1] = CFSTR("RollbackUpdateResume");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v666, v665, 2);
  v569 = (void *)objc_claimAutoreleasedReturnValue();
  v690[11] = v569;
  v689[12] = CFSTR("RB_PerformRollbackApply");
  v663[0] = v3;
  v663[1] = v2;
  v664[0] = CFSTR("RB_RollingBackApply");
  v664[1] = CFSTR("RollbackUpdateApply");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v664, v663, 2);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v690[12] = v37;
  v689[13] = CFSTR("RB_RollbackAppleSuccess");
  v661[0] = v3;
  v661[1] = v2;
  v662[0] = CFSTR("AwaitingReboot");
  v662[1] = CFSTR("ReportRollbackSucceeded");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v662, v661, 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v690[13] = v36;
  v689[14] = CFSTR("RB_RollbackFailed");
  v659[0] = v3;
  v659[1] = v2;
  v660[0] = CFSTR("ReadyToBegin");
  v660[1] = CFSTR("ReportRollbackFailed");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v660, v659, 2);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v690[14] = v35;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v690, v689, 15);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[23] = v34;
  v1727[24] = CFSTR("RB_RollingBackSuspend");
  v657[0] = CFSTR("TargetBrainLoaded");
  v655 = v2;
  v656 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v656, &v655, 1);
  v565 = (void *)objc_claimAutoreleasedReturnValue();
  v658[0] = v565;
  v657[1] = CFSTR("TargetDownloadPreflighted");
  v653 = v2;
  v654 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v654, &v653, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v658[1] = v33;
  v657[2] = CFSTR("TargetDownloaded");
  v651 = v2;
  v652 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v652, &v651, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v658[2] = v32;
  v657[3] = CFSTR("TargetPrepared");
  v649 = v2;
  v650 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v650, &v649, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v658[3] = v31;
  v657[4] = CFSTR("TargetApplied");
  v647 = v2;
  v648 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v648, &v647, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v658[4] = v30;
  v657[5] = CFSTR("TargetRollback");
  v645 = v2;
  v646 = CFSTR("UpdateTarget");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v646, &v645, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v658[5] = v29;
  v657[6] = CFSTR("ResumeCurrentUpdate");
  v643 = v2;
  v644 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v644, &v643, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v658[6] = v28;
  v657[7] = CFSTR("CancelCurrentUpdate");
  v641[0] = v3;
  v641[1] = v2;
  v642[0] = CFSTR("RB_Canceling");
  v642[1] = CFSTR("RemoveSU");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v642, v641, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v658[7] = v27;
  v657[8] = CFSTR("RB_RollbackSuspendSuccess");
  v639 = v2;
  v640 = CFSTR("RollbackUpdateDecideResume");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v640, &v639, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v658[8] = v26;
  v657[9] = CFSTR("RB_PerformRollbackResume");
  v637[0] = v3;
  v637[1] = v2;
  v638[0] = CFSTR("RB_RollingBackResume");
  v638[1] = CFSTR("RollbackUpdateResume");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v638, v637, 2);
  v573 = (void *)objc_claimAutoreleasedReturnValue();
  v658[9] = v573;
  v657[10] = CFSTR("RB_PerformRollbackApply");
  v635[0] = v3;
  v635[1] = v2;
  v636[0] = CFSTR("RB_RollingBackApply");
  v636[1] = CFSTR("RollbackUpdateApply");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v636, v635, 2);
  v572 = (void *)objc_claimAutoreleasedReturnValue();
  v658[10] = v572;
  v657[11] = CFSTR("RB_RollbackAppleSuccess");
  v633[0] = v3;
  v633[1] = v2;
  v634[0] = CFSTR("AwaitingReboot");
  v634[1] = CFSTR("ReportRollbackSucceeded");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v634, v633, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v658[11] = v25;
  v657[12] = CFSTR("RB_RollbackFailed");
  v631[0] = v3;
  v631[1] = v2;
  v632[0] = CFSTR("ReadyToBegin");
  v632[1] = CFSTR("ReportRollbackFailed");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v632, v631, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v658[12] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v658, v657, 13);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[24] = v23;
  v1727[25] = CFSTR("RB_RollingBackResume");
  v629[0] = CFSTR("TargetBrainLoaded");
  v627 = v2;
  v628 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v628, &v627, 1);
  v568 = (void *)objc_claimAutoreleasedReturnValue();
  v630[0] = v568;
  v629[1] = CFSTR("TargetDownloadPreflighted");
  v625 = v2;
  v626 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v626, &v625, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v630[1] = v22;
  v629[2] = CFSTR("TargetDownloaded");
  v623 = v2;
  v624 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v624, &v623, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v630[2] = v21;
  v629[3] = CFSTR("TargetPrepared");
  v621 = v2;
  v622 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v622, &v621, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v630[3] = v20;
  v629[4] = CFSTR("TargetApplied");
  v619 = v2;
  v620 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v620, &v619, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v630[4] = v19;
  v629[5] = CFSTR("TargetRollback");
  v617 = v2;
  v618 = CFSTR("UpdateTarget");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v618, &v617, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v630[5] = v18;
  v629[6] = CFSTR("ResumeCurrentUpdate");
  v615 = v2;
  v616 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v616, &v615, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v630[6] = v17;
  v629[7] = CFSTR("CancelCurrentUpdate");
  v613[0] = v3;
  v613[1] = v2;
  v614[0] = CFSTR("RB_Canceling");
  v614[1] = CFSTR("RemoveSU");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v614, v613, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v630[7] = v16;
  v629[8] = CFSTR("RB_RollbackResumeSuccess");
  v611 = v2;
  v612 = CFSTR("RollbackUpdateDecideApply");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v612, &v611, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v630[8] = v15;
  v629[9] = CFSTR("RB_PerformRollbackApply");
  v609[0] = v3;
  v609[1] = v2;
  v610[0] = CFSTR("RB_RollingBackApply");
  v610[1] = CFSTR("RollbackUpdateApply");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v610, v609, 2);
  v575 = (void *)objc_claimAutoreleasedReturnValue();
  v630[9] = v575;
  v629[10] = CFSTR("RB_RollbackAppleSuccess");
  v607[0] = v3;
  v607[1] = v2;
  v608[0] = CFSTR("AwaitingReboot");
  v608[1] = CFSTR("ReportRollbackSucceeded");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v608, v607, 2);
  v574 = (void *)objc_claimAutoreleasedReturnValue();
  v630[10] = v574;
  v629[11] = CFSTR("RB_RollbackFailed");
  v605[0] = v3;
  v605[1] = v2;
  v606[0] = CFSTR("ReadyToBegin");
  v606[1] = CFSTR("ReportRollbackFailed");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v606, v605, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v630[11] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v630, v629, 12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[25] = v13;
  v1727[26] = CFSTR("RB_RollingBackApply");
  v603[0] = CFSTR("TargetBrainLoaded");
  v601 = v2;
  v602 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v602, &v601, 1);
  v579 = (void *)objc_claimAutoreleasedReturnValue();
  v604[0] = v579;
  v603[1] = CFSTR("TargetDownloadPreflighted");
  v599 = v2;
  v600 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v600, &v599, 1);
  v578 = (void *)objc_claimAutoreleasedReturnValue();
  v604[1] = v578;
  v603[2] = CFSTR("TargetDownloaded");
  v597 = v2;
  v598 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v598, &v597, 1);
  v577 = (void *)objc_claimAutoreleasedReturnValue();
  v604[2] = v577;
  v603[3] = CFSTR("TargetPrepared");
  v595 = v2;
  v596 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v596, &v595, 1);
  v576 = (void *)objc_claimAutoreleasedReturnValue();
  v604[3] = v576;
  v603[4] = CFSTR("TargetApplied");
  v593 = v2;
  v594 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v594, &v593, 1);
  v571 = (void *)objc_claimAutoreleasedReturnValue();
  v604[4] = v571;
  v603[5] = CFSTR("TargetRollback");
  v591 = v2;
  v592 = CFSTR("UpdateTarget");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v592, &v591, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v604[5] = v4;
  v603[6] = CFSTR("ResumeCurrentUpdate");
  v589 = v2;
  v590 = CFSTR("ReportAnomalyAPI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v590, &v589, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v604[6] = v5;
  v603[7] = CFSTR("CancelCurrentUpdate");
  v587[0] = v3;
  v587[1] = v2;
  v588[0] = CFSTR("RB_Canceling");
  v588[1] = CFSTR("RemoveSU");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v588, v587, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v604[7] = v6;
  v603[8] = CFSTR("RB_RollbackAppleSuccess");
  v585[0] = v3;
  v585[1] = v2;
  v586[0] = CFSTR("AwaitingReboot");
  v586[1] = CFSTR("ReportRollbackSucceeded");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v586, v585, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v604[8] = v7;
  v603[9] = CFSTR("RB_RollbackApplyFailed");
  v583[0] = v3;
  v583[1] = v2;
  v584[0] = CFSTR("ReadyToBegin");
  v584[1] = CFSTR("ReportRollbackFailed");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v584, v583, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v604[9] = v8;
  v603[10] = CFSTR("RB_RollbackFailed");
  v581[0] = v3;
  v581[1] = v2;
  v582[0] = CFSTR("ReadyToBegin");
  v582[1] = CFSTR("ReportRollbackFailed");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v582, v581, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v604[10] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v604, v603, 11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[26] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1728, v1727, 27);
  v580 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:copyItems:", v580, 1);
  return v11;
}

- (int64_t)performAction:(id)a3 onEvent:(id)a4 inState:(id)a5 withInfo:(id)a6 nextState:(id)a7 error:(id *)a8
{
  id v11;
  id v12;
  int64_t v13;
  int64_t v14;

  v11 = a3;
  v12 = a6;
  if ((objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0DA8B68]) & 1) != 0)
  {
    v13 = 0;
  }
  else
  {
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("DecideLoadBrain")))
    {
      v14 = -[SUCoreUpdate actionDecideLoadBrain:error:](self, "actionDecideLoadBrain:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("LoadBrain")))
    {
      v14 = -[SUCoreUpdate actionLoadBrain:error:](self, "actionLoadBrain:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ReportBrainLoadProgress")))
    {
      v14 = -[SUCoreUpdate actionReportBrainLoadProgress:error:](self, "actionReportBrainLoadProgress:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("AdvanceBrainLoadSuccess")))
    {
      v14 = -[SUCoreUpdate actionAdvanceBrainLoadSuccess:error:](self, "actionAdvanceBrainLoadSuccess:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ReportBrainLoadSuccess")))
    {
      v14 = -[SUCoreUpdate actionReportBrainLoadSuccess:error:](self, "actionReportBrainLoadSuccess:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("DecidePreflightDownloadSU")))
    {
      v14 = -[SUCoreUpdate actionDecidePreflightDownloadSU:error:](self, "actionDecidePreflightDownloadSU:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("PreflightDownloadSU")))
    {
      v14 = -[SUCoreUpdate actionPreflightDownloadSU:error:](self, "actionPreflightDownloadSU:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("AdvanceDownloadPreflighted")))
    {
      v14 = -[SUCoreUpdate actionAdvanceDownloadPreflighted:error:](self, "actionAdvanceDownloadPreflighted:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ReportDownloadPreflighted")))
    {
      v14 = -[SUCoreUpdate actionReportDownloadPreflighted:error:](self, "actionReportDownloadPreflighted:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("DecideDownloadSpaceCheck")))
    {
      v14 = -[SUCoreUpdate actionDecideDownloadSpaceCheck:error:](self, "actionDecideDownloadSpaceCheck:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ChooseErrorSpaceCheck")))
    {
      v14 = -[SUCoreUpdate actionChooseErrorSpaceCheck:error:](self, "actionChooseErrorSpaceCheck:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("CheckSpace")))
    {
      v14 = -[SUCoreUpdate actionCheckSpace:error:](self, "actionCheckSpace:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("DecideDownloadSU")))
    {
      v14 = -[SUCoreUpdate actionDecideDownloadSU:error:](self, "actionDecideDownloadSU:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("DownloadSU")))
    {
      v14 = -[SUCoreUpdate actionDownloadSU:error:](self, "actionDownloadSU:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ReportDownloadProgress")))
    {
      v14 = -[SUCoreUpdate actionReportDownloadProgress:error:](self, "actionReportDownloadProgress:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ReportDownloadStalled")))
    {
      v14 = -[SUCoreUpdate actionReportDownloadStalled:error:](self, "actionReportDownloadStalled:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("AdvanceSUDownloaded")))
    {
      v14 = -[SUCoreUpdate actionAdvanceSUDownloaded:error:](self, "actionAdvanceSUDownloaded:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ReportSUDownloaded")))
    {
      v14 = -[SUCoreUpdate actionReportSUDownloaded:error:](self, "actionReportSUDownloaded:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("DecidePrepareUpdate")))
    {
      v14 = -[SUCoreUpdate actionDecidePrepareUpdate:error:](self, "actionDecidePrepareUpdate:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("PrepareUpdate")))
    {
      v14 = -[SUCoreUpdate actionPrepareUpdate:error:](self, "actionPrepareUpdate:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ReportPrepareProgress")))
    {
      v14 = -[SUCoreUpdate actionReportPrepareProgress:error:](self, "actionReportPrepareProgress:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("DecideSuspendUpdate")))
    {
      v14 = -[SUCoreUpdate actionDecideSuspendUpdate:error:](self, "actionDecideSuspendUpdate:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("SuspendUpdate")))
    {
      v14 = -[SUCoreUpdate actionSuspendUpdate:error:](self, "actionSuspendUpdate:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("AdvanceSuspended")))
    {
      v14 = -[SUCoreUpdate actionAdvanceSuspended:error:](self, "actionAdvanceSuspended:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ReportPrepared")))
    {
      v14 = -[SUCoreUpdate actionReportPrepared:error:](self, "actionReportPrepared:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ResumeCurrentUpdate")))
    {
      v14 = -[SUCoreUpdate actionResumeCurrentUpdate:error:](self, "actionResumeCurrentUpdate:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ReportResumeCurrentSuccess")))
    {
      v14 = -[SUCoreUpdate actionReportResumeCurrentSuccess:error:](self, "actionReportResumeCurrentSuccess:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ReportResumeCurrentFailed")))
    {
      v14 = -[SUCoreUpdate actionReportResumeCurrentFailed:error:](self, "actionReportResumeCurrentFailed:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("DecideResumeUpdate")))
    {
      v14 = -[SUCoreUpdate actionDecideResumeUpdate:error:](self, "actionDecideResumeUpdate:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ResumeUpdate")))
    {
      v14 = -[SUCoreUpdate actionResumeUpdate:error:](self, "actionResumeUpdate:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("DecideApplyUpdate")))
    {
      v14 = -[SUCoreUpdate actionDecideApplyUpdate:error:](self, "actionDecideApplyUpdate:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ReportApplyProgress")))
    {
      v14 = -[SUCoreUpdate actionReportApplyProgress:error:](self, "actionReportApplyProgress:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ApplyUpdate")))
    {
      v14 = -[SUCoreUpdate actionApplyUpdate:error:](self, "actionApplyUpdate:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ReportApplyFailed")))
    {
      v14 = -[SUCoreUpdate actionReportApplyFailed:error:](self, "actionReportApplyFailed:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ReportApplied")))
    {
      v14 = -[SUCoreUpdate actionReportApplied:error:](self, "actionReportApplied:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("DecideCancelBeforeRollback")))
    {
      v14 = -[SUCoreUpdate actionDecideCancelBeforeRollback:error:](self, "actionDecideCancelBeforeRollback:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("DecideBeginRollback")))
    {
      v14 = -[SUCoreUpdate actionDecideBeginRollback:error:](self, "actionDecideBeginRollback:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("LoadBrainRollback")))
    {
      v14 = -[SUCoreUpdate actionLoadBrainRollback:error:](self, "actionLoadBrainRollback:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("DecideRollbackUpdate")))
    {
      v14 = -[SUCoreUpdate actionDecideRollbackUpdate:error:](self, "actionDecideRollbackUpdate:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("RollbackUpdatePrepare")))
    {
      v14 = -[SUCoreUpdate actionRollbackUpdatePrepare:error:](self, "actionRollbackUpdatePrepare:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("RollbackUpdateDecideSuspend")))
    {
      v14 = -[SUCoreUpdate actionRollbackUpdateDecideSuspend:error:](self, "actionRollbackUpdateDecideSuspend:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("RollbackUpdateSuspend")))
    {
      v14 = -[SUCoreUpdate actionRollbackUpdateSuspend:error:](self, "actionRollbackUpdateSuspend:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("RollbackUpdateDecideResume")))
    {
      v14 = -[SUCoreUpdate actionRollbackUpdateDecideResume:error:](self, "actionRollbackUpdateDecideResume:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("RollbackUpdateResume")))
    {
      v14 = -[SUCoreUpdate actionRollbackUpdateResume:error:](self, "actionRollbackUpdateResume:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("RollbackUpdateDecideApply")))
    {
      v14 = -[SUCoreUpdate actionRollbackUpdateDecideApply:error:](self, "actionRollbackUpdateDecideApply:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("RollbackUpdateApply")))
    {
      v14 = -[SUCoreUpdate actionRollbackUpdateApply:error:](self, "actionRollbackUpdateApply:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ReportRollbackFailed")))
    {
      v14 = -[SUCoreUpdate actionReportRollbackFailed:error:](self, "actionReportRollbackFailed:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ReportRollbackSucceeded")))
    {
      v14 = -[SUCoreUpdate actionReportRollbackSuccess:error:](self, "actionReportRollbackSuccess:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ReportAttemptFailure")))
    {
      v14 = -[SUCoreUpdate actionReportAttemptFailure:error:](self, "actionReportAttemptFailure:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("RemovePrepared")))
    {
      v14 = -[SUCoreUpdate actionRemovePrepared:error:](self, "actionRemovePrepared:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("RemoveSU")))
    {
      v14 = -[SUCoreUpdate actionRemoveSU:error:](self, "actionRemoveSU:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("CancelPrepare")))
    {
      v14 = -[SUCoreUpdate actionCancelPrepare:error:](self, "actionCancelPrepare:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ReportCanceled")))
    {
      v14 = -[SUCoreUpdate actionReportCanceled:error:](self, "actionReportCanceled:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("UpdateTarget")))
    {
      v14 = -[SUCoreUpdate actionUpdateTarget:error:](self, "actionUpdateTarget:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("UpdateTargetReconfig")))
    {
      v14 = -[SUCoreUpdate actionUpdateTargetReconfig:error:](self, "actionUpdateTargetReconfig:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ReportAnomalyAPI")))
    {
      v14 = -[SUCoreUpdate actionReportAnomalyAPI:error:](self, "actionReportAnomalyAPI:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ReportAnomalyAPIEnd")))
    {
      v14 = -[SUCoreUpdate actionReportAnomalyAPIEnd:error:](self, "actionReportAnomalyAPIEnd:error:", v12, a8);
    }
    else
    {
      v14 = -[SUCoreUpdate actionUnknownAction:error:](self, "actionUnknownAction:error:", v11, a8);
    }
    v13 = v14;
  }

  return v13;
}

- (int64_t)actionUpdateTarget:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = objc_msgSend(v5, "targetPhase");
  objc_msgSend(v5, "policy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);
  return 0;
}

- (int64_t)actionUpdateTargetReconfig:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = objc_msgSend(v5, "targetPhase");
  objc_msgSend(v5, "policy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);

  objc_msgSend(v5, "policy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SUCoreUpdate downloadControl](self, "downloadControl");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "policy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "alterPolicy:", v12);

  }
  return 0;
}

- (int64_t)actionDecideLoadBrain:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = objc_msgSend(v5, "targetPhase");
  objc_msgSend(v5, "policy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);
  -[SUCoreUpdate _eventAfterReachingPhase:](self, "_eventAfterReachingPhase:", 2);
  return 0;
}

- (int64_t)actionLoadBrain:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = objc_msgSend(v5, "targetPhase");
  objc_msgSend(v5, "policy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);
  -[SUCoreUpdate setFailedAttemptError:](self, "setFailedAttemptError:", 0);
  -[SUCoreUpdate msuControl](self, "msuControl");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdate policy](self, "policy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "loadBrain:", v11);

  return 0;
}

- (int64_t)actionDecidePreflightDownloadSU:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = objc_msgSend(v5, "targetPhase");
  objc_msgSend(v5, "policy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);
  -[SUCoreUpdate _eventAfterReachingPhase:](self, "_eventAfterReachingPhase:", 3);
  return 0;
}

- (int64_t)actionPreflightDownloadSU:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = objc_msgSend(v5, "targetPhase");
  objc_msgSend(v5, "policy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);
  -[SUCoreUpdate msuControl](self, "msuControl");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdate policy](self, "policy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "preflightDownloadSU:", v11);

  return 0;
}

- (int64_t)actionDecideDownloadSU:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = objc_msgSend(v5, "targetPhase");
  objc_msgSend(v5, "policy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);
  -[SUCoreUpdate _eventAfterReachingPhase:](self, "_eventAfterReachingPhase:", 5);
  return 0;
}

- (int64_t)actionDownloadSU:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;

  v5 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = objc_msgSend(v5, "targetPhase");
  objc_msgSend(v5, "policy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);
  -[SUCoreUpdate updateDescriptor](self, "updateDescriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "descriptorType") == 1)
    goto LABEL_4;
  -[SUCoreUpdate updateDescriptor](self, "updateDescriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "descriptorType") == 3)
  {

LABEL_4:
    goto LABEL_5;
  }
  -[SUCoreUpdate updateDescriptor](self, "updateDescriptor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "descriptorType");

  if (v17 != 5)
  {
    v18 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[SUCoreUpdate updateDescriptor](self, "updateDescriptor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUCoreDescriptor nameForDescriptorType:](SUCoreDescriptor, "nameForDescriptorType:", objc_msgSend(v19, "descriptorType"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v18, "initWithFormat:", CFSTR("Descriptor is not of required type (SUCoreDescriptorTypeAsset, SUCoreDescriptorTypeSFRAsset, or SUCoreDescriptorTypeSplatAsset) for downloading, found %@"), v20);

    -[SUCoreUpdate _trackUpdateAnomaly:result:description:](self, "_trackUpdateAnomaly:result:description:", CFSTR("DOWNLOAD_SU"), 8116, v13);
    goto LABEL_7;
  }
LABEL_5:
  -[SUCoreUpdate downloadControl](self, "downloadControl");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    -[SUCoreUpdate _trackUpdateAnomaly:result:description:](self, "_trackUpdateAnomaly:result:description:", CFSTR("DOWNLOAD_SU"), 8116, CFSTR("SUCoreUpdateDownloader instance not available when about to call download"));
    return 0;
  }
  -[SUCoreUpdate downloadControl](self, "downloadControl");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdate policy](self, "policy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "downloadUpdateWithPolicy:", v14);

LABEL_7:
  return 0;
}

- (int64_t)actionDecidePrepareUpdate:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = objc_msgSend(v5, "targetPhase");
  objc_msgSend(v5, "policy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);
  -[SUCoreUpdate _eventAfterReachingPhase:](self, "_eventAfterReachingPhase:", 6);
  return 0;
}

- (int64_t)actionPrepareUpdate:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = objc_msgSend(v5, "targetPhase");
  objc_msgSend(v5, "policy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);
  -[SUCoreUpdate msuControl](self, "msuControl");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdate policy](self, "policy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "prepareUpdate:", v11);

  return 0;
}

- (int64_t)actionDecideSuspendUpdate:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = objc_msgSend(v5, "targetPhase");
  objc_msgSend(v5, "policy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);
  -[SUCoreUpdate _eventAfterReachingPhase:](self, "_eventAfterReachingPhase:", 7);
  return 0;
}

- (int64_t)actionSuspendUpdate:(id)a3 error:(id *)a4
{
  void *v5;
  NSObject *v6;
  void *v7;

  -[SUCoreUpdate updateFSM](self, "updateFSM", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUCoreUpdate msuControl](self, "msuControl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "suspendUpdate");

  return 0;
}

- (int64_t)actionDecideResumeUpdate:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = objc_msgSend(v5, "targetPhase");
  objc_msgSend(v5, "policy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);
  -[SUCoreUpdate _eventAfterReachingPhase:](self, "_eventAfterReachingPhase:", 8);
  return 0;
}

- (int64_t)actionResumeUpdate:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = objc_msgSend(v5, "targetPhase");
  objc_msgSend(v5, "policy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);
  -[SUCoreUpdate msuControl](self, "msuControl");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdate policy](self, "policy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resumeUpdate:", v11);

  return 0;
}

- (int64_t)actionResumeCurrentUpdate:(id)a3 error:(id *)a4
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;

  -[SUCoreUpdate updateFSM](self, "updateFSM", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUCoreUpdate msuControl](self, "msuControl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdate policy](self, "policy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resumeUpdate:", v8);

  return 0;
}

- (int64_t)actionDecideApplyUpdate:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = objc_msgSend(v5, "targetPhase");
  objc_msgSend(v5, "policy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);
  -[SUCoreUpdate _eventAfterReachingPhase:](self, "_eventAfterReachingPhase:", 9);
  return 0;
}

- (int64_t)actionApplyUpdate:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = objc_msgSend(v5, "targetPhase");
  objc_msgSend(v5, "policy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);
  -[SUCoreUpdate msuControl](self, "msuControl");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdate policy](self, "policy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "applyUpdate:", v11);

  return 0;
}

- (int64_t)actionDecideCancelBeforeRollback:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = objc_msgSend(v5, "targetPhase");
  objc_msgSend(v5, "policy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);
  -[SUCoreUpdate _eventAfterReachingRollbackPhase:](self, "_eventAfterReachingRollbackPhase:", 1);
  return 0;
}

- (int64_t)actionDecideBeginRollback:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = objc_msgSend(v5, "targetPhase");
  objc_msgSend(v5, "policy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);
  -[SUCoreUpdate _eventAfterReachingRollbackPhase:](self, "_eventAfterReachingRollbackPhase:", 2);
  return 0;
}

- (int64_t)actionLoadBrainRollback:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = objc_msgSend(v5, "targetPhase");
  objc_msgSend(v5, "policy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);
  -[SUCoreUpdate _eventAfterReachingRollbackPhase:](self, "_eventAfterReachingRollbackPhase:", 3);
  return 0;
}

- (int64_t)actionDecideRollbackUpdate:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = objc_msgSend(v5, "targetPhase");
  objc_msgSend(v5, "policy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);
  -[SUCoreUpdate _eventAfterReachingRollbackPhase:](self, "_eventAfterReachingRollbackPhase:", 4);
  return 0;
}

- (int64_t)actionRollbackUpdatePrepare:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = objc_msgSend(v5, "targetPhase");
  objc_msgSend(v5, "policy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);
  -[SUCoreUpdate msuControl](self, "msuControl");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdate policy](self, "policy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rollbackUpdatePrepare:", v11);

  return 0;
}

- (int64_t)actionRollbackUpdateDecideSuspend:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = objc_msgSend(v5, "targetPhase");
  objc_msgSend(v5, "policy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);
  -[SUCoreUpdate _eventAfterReachingRollbackPhase:](self, "_eventAfterReachingRollbackPhase:", 5);
  return 0;
}

- (int64_t)actionRollbackUpdateSuspend:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = objc_msgSend(v5, "targetPhase");
  objc_msgSend(v5, "policy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);
  -[SUCoreUpdate msuControl](self, "msuControl");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdate policy](self, "policy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rollbackUpdateSuspend:", v11);

  return 0;
}

- (int64_t)actionRollbackUpdateDecideResume:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = objc_msgSend(v5, "targetPhase");
  objc_msgSend(v5, "policy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);
  -[SUCoreUpdate _eventAfterReachingRollbackPhase:](self, "_eventAfterReachingRollbackPhase:", 6);
  return 0;
}

- (int64_t)actionRollbackUpdateResume:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = objc_msgSend(v5, "targetPhase");
  objc_msgSend(v5, "policy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);
  -[SUCoreUpdate msuControl](self, "msuControl");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdate policy](self, "policy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rollbackUpdateResume:", v11);

  return 0;
}

- (int64_t)actionRollbackUpdateDecideApply:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = objc_msgSend(v5, "targetPhase");
  objc_msgSend(v5, "policy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);
  -[SUCoreUpdate _eventAfterReachingRollbackPhase:](self, "_eventAfterReachingRollbackPhase:", 7);
  return 0;
}

- (int64_t)actionRollbackUpdateApply:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = objc_msgSend(v5, "targetPhase");
  objc_msgSend(v5, "policy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);
  -[SUCoreUpdate msuControl](self, "msuControl");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdate policy](self, "policy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rollbackUpdateApply:", v11);

  return 0;
}

- (int64_t)actionDecideDownloadSpaceCheck:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = objc_msgSend(v5, "targetPhase");
  objc_msgSend(v5, "policy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);
  -[SUCoreUpdate _eventAfterReachingPhase:](self, "_eventAfterReachingPhase:", 4);
  return 0;
}

- (int64_t)actionChooseErrorSpaceCheck:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString **v11;

  v5 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[SUCoreUpdate policy](self, "policy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v8, "checkAvailableSpace");

  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = kSU_E_PerformErrorSpaceCheck;
  if (!(_DWORD)v7)
    v11 = kSU_E_SkipErrorSpaceCheck;
  objc_msgSend(v9, "followupEvent:withInfo:", *v11, v5);

  return 0;
}

- (int64_t)actionCheckSpace:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v22[5];
  id v23;

  v5 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[SUCoreUpdate updateDescriptor](self, "updateDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "msuPrepareSize");

  if (v9)
  {
    -[SUCoreUpdate updateDescriptor](self, "updateDescriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "totalRequiredFreeSpace");
    -[SUCoreUpdate updateDescriptor](self, "updateDescriptor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v11 - objc_msgSend(v12, "msuPrepareSize");

  }
  else
  {
    v13 = 0;
  }
  -[SUCoreUpdate updateDescriptor](self, "updateDescriptor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "totalRequiredFreeSpace");
  -[SUCoreUpdate policy](self, "policy");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "cacheDeleteUrgency");
  -[SUCoreUpdate policy](self, "policy");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "updateVolumePath");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __39__SUCoreUpdate_actionCheckSpace_error___block_invoke;
  v22[3] = &unk_1EA879690;
  v22[4] = self;
  v23 = v5;
  v20 = v5;
  +[SUCoreSpace checkAvailableSpace:allowPurgeWithUrgency:purgingFromBase:minimalRequiredFreeSpace:completion:](SUCoreSpace, "checkAvailableSpace:allowPurgeWithUrgency:purgingFromBase:minimalRequiredFreeSpace:completion:", v15, v17, v19, v13, v22);

  return 0;
}

void __39__SUCoreUpdate_actionCheckSpace_error___block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  void *v8;
  SUCoreUpdateParam *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  SUCoreUpdateParam *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a5;
  if (v20)
  {
    v7 = *(id *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 40), "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = -[SUCoreUpdateParam initWithError:]([SUCoreUpdateParam alloc], "initWithError:", v20);

      v7 = v9;
    }
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v7, "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_trackUpdateError:forReason:error:", CFSTR("checkAvailableSpace"), CFSTR("unable to check available space"), v11);

    objc_msgSend(*(id *)(a1 + 32), "updateFSM");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "postEvent:withInfo:", CFSTR("SpaceCheckFailed"), v7);

  }
  else if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "updateFSM");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postEvent:withInfo:", CFSTR("SpaceCheckHaveSpace"), *(_QWORD *)(a1 + 40));
  }
  else
  {
    v7 = *(id *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 40), "error");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "buildError:underlying:description:", 8600, 0, CFSTR("insufficient space to perform update"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = -[SUCoreUpdateParam initWithError:]([SUCoreUpdateParam alloc], "initWithError:", v15);
      v7 = v16;
    }
    v17 = *(void **)(a1 + 32);
    objc_msgSend(v7, "error");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_trackUpdateError:forReason:error:", CFSTR("checkAvailableSpace"), CFSTR("insufficient space to perform update"), v18);

    objc_msgSend(*(id *)(a1 + 32), "updateFSM");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "postEvent:withInfo:", CFSTR("SpaceCheckNoSpace"), *(_QWORD *)(a1 + 40));

  }
}

- (int64_t)actionRemoveSU:(id)a3 error:(id *)a4
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  SUCoreUpdateParam *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  uint8_t buf[4];
  SUCoreUpdate *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[SUCoreUpdate updateFSM](self, "updateFSM", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUCoreUpdate updateDescriptor](self, "updateDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "descriptorType") == 1)
    goto LABEL_4;
  -[SUCoreUpdate updateDescriptor](self, "updateDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "descriptorType") == 3)
  {

LABEL_4:
    goto LABEL_5;
  }
  -[SUCoreUpdate updateDescriptor](self, "updateDescriptor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "descriptorType");

  if (v17 != 5)
  {
    -[SUCoreUpdate updateDescriptor](self, "updateDescriptor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "descriptorType") == 2)
    {

    }
    else
    {
      -[SUCoreUpdate updateDescriptor](self, "updateDescriptor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "descriptorType");

      if (v20 != 4)
      {
        v26 = objc_alloc(MEMORY[0x1E0CB3940]);
        -[SUCoreUpdate updateDescriptor](self, "updateDescriptor");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        +[SUCoreDescriptor nameForDescriptorType:](SUCoreDescriptor, "nameForDescriptorType:", objc_msgSend(v27, "descriptorType"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)objc_msgSend(v26, "initWithFormat:", CFSTR("Unable to determine a known descriptor type for removal, found %@"), v28);

        -[SUCoreUpdate _trackUpdateAnomaly:result:description:](self, "_trackUpdateAnomaly:result:description:", CFSTR("REMOVE_SU"), 8116, v29);
        return 0;
      }
    }
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "oslog");
    v22 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      -[SUCoreUpdate updateDescriptor](self, "updateDescriptor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[SUCoreDescriptor nameForDescriptorType:](SUCoreDescriptor, "nameForDescriptorType:", objc_msgSend(v23, "descriptorType"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = self;
      v32 = 2114;
      v33 = v24;
      _os_log_impl(&dword_1DDFDD000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: Not removing descriptor of type %{public}@; posting removed event",
        buf,
        0x16u);

    }
    -[SUCoreUpdate updateFSM](self, "updateFSM");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_alloc_init(SUCoreUpdateParam);
    objc_msgSend(v14, "followupEvent:withInfo:", CFSTR("SURemoved"), v25);

    goto LABEL_9;
  }
LABEL_5:
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "oslog");
  v10 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[SUCoreUpdate updateDescriptor](self, "updateDescriptor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUCoreDescriptor nameForDescriptorType:](SUCoreDescriptor, "nameForDescriptorType:", objc_msgSend(v11, "descriptorType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v31 = self;
    v32 = 2114;
    v33 = v12;
    _os_log_impl(&dword_1DDFDD000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Removing descriptor of type %{public}@", buf, 0x16u);

  }
  -[SUCoreUpdate downloadControl](self, "downloadControl");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    -[SUCoreUpdate _trackUpdateAnomaly:result:description:](self, "_trackUpdateAnomaly:result:description:", CFSTR("REMOVE_SU"), 8116, CFSTR("SUCoreUpdateDownloader instance not available when about to call to remove asset"));
    return 0;
  }
  -[SUCoreUpdate downloadControl](self, "downloadControl");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeUpdate");
LABEL_9:

  return 0;
}

- (int64_t)actionCancelPrepare:(id)a3 error:(id *)a4
{
  void *v5;
  NSObject *v6;
  void *v7;

  -[SUCoreUpdate updateFSM](self, "updateFSM", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUCoreUpdate msuControl](self, "msuControl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancelPrepare");

  return 0;
}

- (int64_t)actionRemovePrepared:(id)a3 error:(id *)a4
{
  void *v5;
  NSObject *v6;
  void *v7;

  -[SUCoreUpdate updateFSM](self, "updateFSM", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUCoreUpdate msuControl](self, "msuControl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removePrepared");

  return 0;
}

- (int64_t)actionReportBrainLoadProgress:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;

  v5 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend(v5, "downloadProgress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v8, "isStalled");

  objc_msgSend(v5, "downloadProgress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_DWORD)v7)
    -[SUCoreUpdate _updateBrainLoadStalled:](self, "_updateBrainLoadStalled:", v9);
  else
    -[SUCoreUpdate _updateBrainLoadProgress:](self, "_updateBrainLoadProgress:", v9);

  return 0;
}

- (int64_t)actionAdvanceBrainLoadSuccess:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;

  v5 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend(v5, "downloadProgress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _updateBrainLoaded:](self, "_updateBrainLoaded:", v8);
  -[SUCoreUpdate _eventAfterReachingPhase:](self, "_eventAfterReachingPhase:", 3);
  return 0;
}

- (int64_t)actionReportBrainLoadSuccess:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;

  v5 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend(v5, "downloadProgress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _updateBrainLoaded:](self, "_updateBrainLoaded:", v8);
  return 0;
}

- (int64_t)actionAdvanceDownloadPreflighted:(id)a3 error:(id *)a4
{
  void *v5;
  NSObject *v6;

  -[SUCoreUpdate updateFSM](self, "updateFSM", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUCoreUpdate _updateAssetDownloadPreflighted](self, "_updateAssetDownloadPreflighted");
  -[SUCoreUpdate _eventAfterReachingPhase:](self, "_eventAfterReachingPhase:", 4);
  return 0;
}

- (int64_t)actionReportDownloadPreflighted:(id)a3 error:(id *)a4
{
  void *v5;
  NSObject *v6;

  -[SUCoreUpdate updateFSM](self, "updateFSM", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUCoreUpdate _updateAssetDownloadPreflighted](self, "_updateAssetDownloadPreflighted");
  return 0;
}

- (int64_t)actionReportDownloadProgress:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;

  v5 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend(v5, "downloadProgress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _updateAssetDownloadProgress:](self, "_updateAssetDownloadProgress:", v8);
  return 0;
}

- (int64_t)actionReportDownloadStalled:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;

  v5 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend(v5, "downloadProgress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _updateAssetDownloadStalled:](self, "_updateAssetDownloadStalled:", v8);
  return 0;
}

- (int64_t)actionAdvanceSUDownloaded:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;

  v5 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend(v5, "downloadProgress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _updateAssetDownloaded:](self, "_updateAssetDownloaded:", v8);
  -[SUCoreUpdate _eventAfterReachingPhase:](self, "_eventAfterReachingPhase:", 6);
  return 0;
}

- (int64_t)actionReportSUDownloaded:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;

  v5 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend(v5, "downloadProgress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _updateAssetDownloaded:](self, "_updateAssetDownloaded:", v8);
  return 0;
}

- (int64_t)actionReportPrepareProgress:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;

  v5 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend(v5, "prepareProgress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _updatePrepareProgress:](self, "_updatePrepareProgress:", v8);
  return 0;
}

- (int64_t)actionAdvanceSuspended:(id)a3 error:(id *)a4
{
  void *v5;
  NSObject *v6;

  -[SUCoreUpdate updateFSM](self, "updateFSM", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUCoreUpdate _eventAfterReachingPhase:](self, "_eventAfterReachingPhase:", 8);
  return 0;
}

- (int64_t)actionReportPrepared:(id)a3 error:(id *)a4
{
  void *v5;
  NSObject *v6;
  id v7;
  double v8;
  void *v9;

  -[SUCoreUpdate updateFSM](self, "updateFSM", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = objc_alloc(MEMORY[0x1E0DA8978]);
  LODWORD(v8) = 1.0;
  v9 = (void *)objc_msgSend(v7, "initWithPhase:isStalled:portionComplete:remaining:", *MEMORY[0x1E0DA8BB8], 0, v8, 0.0);
  -[SUCoreUpdate _updatePrepared:](self, "_updatePrepared:", v9);

  return 0;
}

- (int64_t)actionReportResumeCurrentSuccess:(id)a3 error:(id *)a4
{
  void *v5;
  NSObject *v6;

  -[SUCoreUpdate updateFSM](self, "updateFSM", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUCoreUpdate _updateCurrentResumed](self, "_updateCurrentResumed");
  return 0;
}

- (int64_t)actionReportResumeCurrentFailed:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;

  v5 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend(v5, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _updateCurrentResumeFailed:](self, "_updateCurrentResumeFailed:", v8);
  return 0;
}

- (int64_t)actionReportApplyProgress:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;

  v5 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend(v5, "applyProgress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _updateApplyProgress:](self, "_updateApplyProgress:", v8);
  return 0;
}

- (int64_t)actionReportApplied:(id)a3 error:(id *)a4
{
  void *v5;
  NSObject *v6;

  -[SUCoreUpdate updateFSM](self, "updateFSM", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUCoreUpdate _updateApplied](self, "_updateApplied");
  return 0;
}

- (int64_t)actionReportRollbackSuccess:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;

  v5 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend(v5, "rollback");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _updateRolledBack:](self, "_updateRolledBack:", v8);
  return 0;
}

- (int64_t)actionReportApplyFailed:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;

  v5 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend(v5, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _applyAttemptFailed:](self, "_applyAttemptFailed:", v8);
  return 0;
}

- (int64_t)actionReportAttemptFailure:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;

  v5 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend(v5, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _updateAttemptFailed:](self, "_updateAttemptFailed:", v8);
  -[SUCoreUpdate _cleanupAfterAttempt](self, "_cleanupAfterAttempt");
  return 0;
}

- (int64_t)actionReportCanceled:(id)a3 error:(id *)a4
{
  void *v5;
  NSObject *v6;

  -[SUCoreUpdate updateFSM](self, "updateFSM", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUCoreUpdate _updateCanceled](self, "_updateCanceled");
  -[SUCoreUpdate _cleanupAfterAttempt](self, "_cleanupAfterAttempt");
  return 0;
}

- (int64_t)actionReportRollbackFailed:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;

  v5 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend(v5, "rollback");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _rollbackAttemptFailed:withError:](self, "_rollbackAttemptFailed:withError:", v8, v9);
  return 0;
}

- (int64_t)actionReportAnomalyAPI:(id)a3 error:(id *)a4
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;

  -[SUCoreUpdate updateFSM](self, "updateFSM", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "buildError:underlying:description:", 8115, 0, CFSTR("API call not valid for current state"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _updateAnomaly:](self, "_updateAnomaly:", v8);
  return 0;
}

- (int64_t)actionReportAnomalyAPIEnd:(id)a3 error:(id *)a4
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;

  -[SUCoreUpdate updateFSM](self, "updateFSM", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "buildError:underlying:description:", 8115, 0, CFSTR("API call not valid for current resting state"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _updateAnomaly:](self, "_updateAnomaly:", v8);
  -[SUCoreUpdate updateTransaction](self, "updateTransaction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdate setUpdateTransaction:](self, "setUpdateTransaction:", 0);
  objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v9, CFSTR("update.Transaction"));

  return 0;
}

- (int64_t)actionUnknownAction:(id)a3 error:(id *)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (objc_class *)MEMORY[0x1E0CB3940];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithFormat:", CFSTR("unknown action(%@)"), v6);

  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "diag");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dumpTracked:dumpingTo:usingFilename:clearingStatistics:clearingHistory:", v7, 5, 0, 0, 0);

  objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "buildError:underlying:description:", 8116, 0, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _updateAnomaly:](self, "_updateAnomaly:", v11);
  return 0;
}

- (SUCoreUpdate)initWithDelegate:(id)a3 updateDescriptor:(id)a4 updateUUID:(id)a5
{
  return -[SUCoreUpdate initWithDelegate:updateDescriptor:updateUUID:withCallbackQueue:](self, "initWithDelegate:updateDescriptor:updateUUID:withCallbackQueue:", a3, a4, a5, 0);
}

- (SUCoreUpdate)initWithDelegate:(id)a3 updateDescriptor:(id)a4 updateUUID:(id)a5 withCallbackQueue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SUCoreUpdate *v14;
  SUCoreUpdate *v15;
  SUCoreDescriptor **p_updateDescriptor;
  void *v17;
  uint64_t v18;
  OS_dispatch_queue *clientDelegateCallbackQueue;
  SUCorePolicy *policy;
  NSError *failedAttemptError;
  SUCoreRollback *v22;
  SUCoreRollback *rollbackControl;
  uint64_t v24;
  SUCoreRollbackDescriptor *rollbackDescriptor;
  void *v26;
  uint64_t v27;
  __CFString *v28;
  SUCoreRollbackDescriptor *v29;
  NSString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSString *v36;
  void *v37;
  NSObject *v38;
  SUCoreUpdateDownloader *v39;
  SUCoreMSU *v40;
  SUCoreMSU *v41;
  id v42;
  NSString *updateUUID;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _BOOL4 v48;
  const __CFString *v49;
  uint64_t v50;
  NSString *updateName;
  void *v52;
  void *v53;
  SUCoreUpdateDownloader *v54;
  SUCoreUpdateDownloader *downloadControl;
  SUCoreMSU *v56;
  SUCoreMSU *msuControl;
  uint64_t v58;
  NSDictionary *stateTable;
  uint64_t v60;
  SUCoreFSM *updateFSM;
  SUCoreFSM *v62;
  SUCoreUpdate *v63;
  void *v64;
  NSObject *v65;
  void *v67;
  uint64_t v68;
  void *v69;
  NSObject *v70;
  id v71;
  id v72;
  __CFString *v73;
  id v74;
  uint8_t buf[16];
  objc_super v76;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v76.receiver = self;
  v76.super_class = (Class)SUCoreUpdate;
  v14 = -[SUCoreUpdate init](&v76, sel_init);
  v15 = v14;
  if (!v14)
    goto LABEL_21;
  p_updateDescriptor = &v14->_updateDescriptor;
  objc_storeStrong((id *)&v14->_updateDescriptor, a4);
  objc_storeWeak(&v15->_updateDelegate, v10);
  objc_storeStrong((id *)&v15->_updateUUID, a5);
  objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "selectDelegateCallbackQueue:", v13);
  v18 = objc_claimAutoreleasedReturnValue();
  clientDelegateCallbackQueue = v15->_clientDelegateCallbackQueue;
  v15->_clientDelegateCallbackQueue = (OS_dispatch_queue *)v18;

  policy = v15->_policy;
  v15->_targetPhase = 1;
  v15->_policy = 0;

  failedAttemptError = v15->_failedAttemptError;
  v15->_failedAttemptError = 0;

  v22 = objc_alloc_init(SUCoreRollback);
  rollbackControl = v15->_rollbackControl;
  v15->_rollbackControl = v22;

  -[SUCoreRollback eligibleRollback](v15->_rollbackControl, "eligibleRollback");
  v24 = objc_claimAutoreleasedReturnValue();
  rollbackDescriptor = v15->_rollbackDescriptor;
  v15->_rollbackDescriptor = (SUCoreRollbackDescriptor *)v24;

  objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "releaseType");
  v27 = objc_claimAutoreleasedReturnValue();

  if (v27)
    v28 = (__CFString *)v27;
  else
    v28 = CFSTR("user");
  v29 = v15->_rollbackDescriptor;
  if (!v29 || !-[SUCoreRollbackDescriptor rollbackEligible](v29, "rollbackEligible"))
  {
    if (!*p_updateDescriptor)
    {
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "oslog");
      v65 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DDFDD000, v65, OS_LOG_TYPE_DEFAULT, "[Update]Initializing SUCoreUpdate without an SUCoreDescriptor nor SUCoreRollbackDescriptor instance. Returning nil SUCoreUpdate", buf, 2u);
      }

      goto LABEL_25;
    }
LABEL_12:
    v72 = v13;
    v74 = v10;
    v42 = objc_alloc(MEMORY[0x1E0CB3940]);
    updateUUID = v15->_updateUUID;
    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "buildVersion");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDescriptor productBuildVersion](v15->_updateDescriptor, "productBuildVersion");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDescriptor releaseType](v15->_updateDescriptor, "releaseType");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = -[SUCoreDescriptor fullReplacement](v15->_updateDescriptor, "fullReplacement");
    v49 = CFSTR("incr");
    if (v48)
      v49 = CFSTR("full");
    v73 = v28;
    v50 = objc_msgSend(v42, "initWithFormat:", CFSTR("UUID(%@) %@(%@)->%@(%@) %@"), updateUUID, v45, v28, v46, v47, v49);
    updateName = v15->_updateName;
    v15->_updateName = (NSString *)v50;

    -[SUCoreUpdate updateDescriptor](v15, "updateDescriptor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v52, "descriptorType") != 1)
    {
      -[SUCoreUpdate updateDescriptor](v15, "updateDescriptor");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v53, "descriptorType") != 3)
      {
        -[SUCoreUpdate updateDescriptor](v15, "updateDescriptor");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = objc_msgSend(v67, "descriptorType");

        if (v68 != 5)
        {
          objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "oslog");
          v70 = objc_claimAutoreleasedReturnValue();

          v13 = v72;
          if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DDFDD000, v70, OS_LOG_TYPE_DEFAULT, "[Update] Descriptor type does not indicate SUCoreDescriptorTypeAsset or SUCoreDescriptorTypeSFRAsset or SUCoreDescriptorTypeSplatAsset, no SUCoreUpdateDownloader instance will be initialized", buf, 2u);
          }

          downloadControl = v15->_downloadControl;
          v15->_downloadControl = 0;
          goto LABEL_19;
        }
LABEL_18:
        v54 = -[SUCoreUpdateDownloader initWithDelegate:forUpdate:updateUUID:]([SUCoreUpdateDownloader alloc], "initWithDelegate:forUpdate:updateUUID:", v15, v11, v12);
        downloadControl = v15->_downloadControl;
        v15->_downloadControl = v54;
        v13 = v72;
LABEL_19:

        v56 = -[SUCoreMSU initWithDelegate:]([SUCoreMSU alloc], "initWithDelegate:", v15);
        msuControl = v15->_msuControl;
        v15->_msuControl = v56;

        -[SUCoreMSU assignDescriptor:updateUUID:](v15->_msuControl, "assignDescriptor:updateUUID:", v11, v12);
        goto LABEL_20;
      }

    }
    goto LABEL_18;
  }
  if (*p_updateDescriptor)
    goto LABEL_12;
  v74 = v10;
  v71 = objc_alloc(MEMORY[0x1E0CB3940]);
  v30 = v15->_updateUUID;
  -[SUCoreRollbackDescriptor productBuildVersion](v15->_rollbackDescriptor, "productBuildVersion");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreRollbackDescriptor releaseType](v15->_rollbackDescriptor, "releaseType");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "buildVersion");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v28;
  v35 = objc_msgSend(v71, "initWithFormat:", CFSTR("UUID(%@) %@(%@)->%@(%@)"), v30, v31, v32, v34, v28);
  v36 = v15->_updateName;
  v15->_updateName = (NSString *)v35;

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "oslog");
  v38 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DDFDD000, v38, OS_LOG_TYPE_DEFAULT, "[Update] Initializing with rollback descriptor. No SUCoreUpdateDownloader instance will be initialized", buf, 2u);
  }

  v39 = v15->_downloadControl;
  v15->_downloadControl = 0;

  v40 = -[SUCoreMSU initWithDelegate:]([SUCoreMSU alloc], "initWithDelegate:", v15);
  v41 = v15->_msuControl;
  v15->_msuControl = v40;

  -[SUCoreMSU assignRollbackDescriptor:updateUUID:](v15->_msuControl, "assignRollbackDescriptor:updateUUID:", v15->_rollbackDescriptor, v12);
LABEL_20:
  objc_msgSend((id)objc_opt_class(), "_generateStateTable");
  v58 = objc_claimAutoreleasedReturnValue();
  stateTable = v15->_stateTable;
  v15->_stateTable = (NSDictionary *)v58;

  v60 = objc_msgSend(objc_alloc(MEMORY[0x1E0DA8958]), "initMachine:ofInstance:withTable:startingIn:usingDelegate:registeringAllInfoClass:", CFSTR("update"), v15->_updateName, v15->_stateTable, CFSTR("ReadyToBegin"), v15, objc_opt_class());
  updateFSM = v15->_updateFSM;
  v15->_updateFSM = (SUCoreFSM *)v60;

  v62 = v15->_updateFSM;
  v10 = v74;
  if (!v62)
  {
LABEL_25:
    v63 = 0;
    goto LABEL_26;
  }
LABEL_21:
  v63 = v15;
LABEL_26:

  return v63;
}

- (void)targetBrainLoaded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("update.Transaction"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__SUCoreUpdate_targetBrainLoaded___block_invoke;
  block[3] = &unk_1EA878940;
  block[4] = self;
  v11 = v5;
  v12 = v4;
  v8 = v4;
  v9 = v5;
  dispatch_async(v7, block);

}

void __34__SUCoreUpdate_targetBrainLoaded___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "updateTransaction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("update.Transaction"));
  else
    objc_msgSend(*(id *)(a1 + 32), "setUpdateTransaction:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "updateFSM");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[SUCoreUpdateParam initTargetPhase:withPolicy:]([SUCoreUpdateParam alloc], "initTargetPhase:withPolicy:", 3, *(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "postEvent:withInfo:", CFSTR("TargetBrainLoaded"), v3);

}

- (void)targetDownloadPreflighted:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("update.Transaction"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__SUCoreUpdate_targetDownloadPreflighted___block_invoke;
  block[3] = &unk_1EA878940;
  block[4] = self;
  v11 = v5;
  v12 = v4;
  v8 = v4;
  v9 = v5;
  dispatch_async(v7, block);

}

void __42__SUCoreUpdate_targetDownloadPreflighted___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "updateTransaction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("update.Transaction"));
  else
    objc_msgSend(*(id *)(a1 + 32), "setUpdateTransaction:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "updateFSM");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[SUCoreUpdateParam initTargetPhase:withPolicy:]([SUCoreUpdateParam alloc], "initTargetPhase:withPolicy:", 4, *(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "postEvent:withInfo:", CFSTR("TargetDownloadPreflighted"), v3);

}

- (void)targetDownloaded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("update.Transaction"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__SUCoreUpdate_targetDownloaded___block_invoke;
  block[3] = &unk_1EA878940;
  block[4] = self;
  v11 = v5;
  v12 = v4;
  v8 = v4;
  v9 = v5;
  dispatch_async(v7, block);

}

void __33__SUCoreUpdate_targetDownloaded___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "updateTransaction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("update.Transaction"));
  else
    objc_msgSend(*(id *)(a1 + 32), "setUpdateTransaction:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "updateFSM");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[SUCoreUpdateParam initTargetPhase:withPolicy:]([SUCoreUpdateParam alloc], "initTargetPhase:withPolicy:", 6, *(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "postEvent:withInfo:", CFSTR("TargetDownloaded"), v3);

}

- (void)targetPrepared:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("update.Transaction"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__SUCoreUpdate_targetPrepared___block_invoke;
  block[3] = &unk_1EA878940;
  block[4] = self;
  v11 = v5;
  v12 = v4;
  v8 = v4;
  v9 = v5;
  dispatch_async(v7, block);

}

void __31__SUCoreUpdate_targetPrepared___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "updateTransaction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("update.Transaction"));
  else
    objc_msgSend(*(id *)(a1 + 32), "setUpdateTransaction:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "updateFSM");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[SUCoreUpdateParam initTargetPhase:withPolicy:]([SUCoreUpdateParam alloc], "initTargetPhase:withPolicy:", 9, *(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "postEvent:withInfo:", CFSTR("TargetPrepared"), v3);

}

- (void)targetApplied:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("update.Transaction"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__SUCoreUpdate_targetApplied___block_invoke;
  block[3] = &unk_1EA878940;
  block[4] = self;
  v11 = v5;
  v12 = v4;
  v8 = v4;
  v9 = v5;
  dispatch_async(v7, block);

}

void __30__SUCoreUpdate_targetApplied___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "updateTransaction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("update.Transaction"));
  else
    objc_msgSend(*(id *)(a1 + 32), "setUpdateTransaction:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "updateFSM");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[SUCoreUpdateParam initTargetPhase:withPolicy:]([SUCoreUpdateParam alloc], "initTargetPhase:withPolicy:", 10, *(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "postEvent:withInfo:", CFSTR("TargetApplied"), v3);

}

- (void)targetRollback:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("update.Transaction"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__SUCoreUpdate_targetRollback___block_invoke;
  block[3] = &unk_1EA878940;
  block[4] = self;
  v11 = v5;
  v12 = v4;
  v8 = v4;
  v9 = v5;
  dispatch_async(v7, block);

}

void __31__SUCoreUpdate_targetRollback___block_invoke(uint64_t a1)
{
  void *v2;
  SUCoreUpdateParam *v3;
  void *v4;
  SUCoreUpdateParam *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "updateTransaction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("update.Transaction"));
  else
    objc_msgSend(*(id *)(a1 + 32), "setUpdateTransaction:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "updateFSM");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [SUCoreUpdateParam alloc];
  objc_msgSend(*(id *)(a1 + 32), "rollbackControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SUCoreUpdateParam initWithRollback:withPolicy:](v3, "initWithRollback:withPolicy:", v4, *(_QWORD *)(a1 + 48));
  objc_msgSend(v6, "postEvent:withInfo:", CFSTR("TargetRollback"), v5);

}

- (void)resumeCurrentUpdate
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("update.Transaction"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extendedStateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__SUCoreUpdate_resumeCurrentUpdate__block_invoke;
  v7[3] = &unk_1EA878A88;
  v7[4] = self;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __35__SUCoreUpdate_resumeCurrentUpdate__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "updateTransaction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("update.Transaction"));
  else
    objc_msgSend(*(id *)(a1 + 32), "setUpdateTransaction:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "updateFSM");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[SUCoreUpdateParam initTargetPhase:withPolicy:]([SUCoreUpdateParam alloc], "initTargetPhase:withPolicy:", 1, 0);
  objc_msgSend(v4, "postEvent:withInfo:", CFSTR("ResumeCurrentUpdate"), v3);

}

- (void)cancelCurrentUpdate
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("update.Transaction"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extendedStateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__SUCoreUpdate_cancelCurrentUpdate__block_invoke;
  v7[3] = &unk_1EA878A88;
  v7[4] = self;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __35__SUCoreUpdate_cancelCurrentUpdate__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "updateTransaction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("update.Transaction"));
  else
    objc_msgSend(*(id *)(a1 + 32), "setUpdateTransaction:", *(_QWORD *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "buildError:underlying:description:", 8124, 0, CFSTR("update attempt was canceled"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_trackUpdateError:forReason:error:", CFSTR("cancelCurrentUpdate"), 0, v6);
  objc_msgSend(*(id *)(a1 + 32), "updateFSM");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SUCoreUpdateParam initTargetPhase:withPolicy:]([SUCoreUpdateParam alloc], "initTargetPhase:withPolicy:", 1, 0);
  objc_msgSend(v4, "postEvent:withInfo:", CFSTR("CancelCurrentUpdate"), v5);

}

- (id)copyCurrentState
{
  void *v2;
  void *v3;

  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copyCurrentState");

  return v3;
}

- (id)rollbackAvailable
{
  void *v2;
  void *v3;

  -[SUCoreUpdate rollbackControl](self, "rollbackControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "eligibleRollback");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)previousRollback
{
  void *v2;
  void *v3;

  -[SUCoreUpdate rollbackControl](self, "rollbackControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "previousRollback");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_updateBrainLoadProgress:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  SUCoreUpdate *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreUpdate updateDelegate](self, "updateDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SUCoreUpdate clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __41__SUCoreUpdate__updateBrainLoadProgress___block_invoke;
    v10[3] = &unk_1EA878A88;
    v10[4] = self;
    v11 = v4;
    dispatch_async(v7, v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v13 = self;
      v14 = 2114;
      v15 = v4;
      _os_log_impl(&dword_1DDFDD000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(updateBrainLoadProgress:) so not reporting progress=%{public}@", buf, 0x16u);
    }

  }
}

void __41__SUCoreUpdate__updateBrainLoadProgress___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "updateDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateBrainLoadProgress:", *(_QWORD *)(a1 + 40));

}

- (void)_updateBrainLoadStalled:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  SUCoreUpdate *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreUpdate updateDelegate](self, "updateDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SUCoreUpdate clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __40__SUCoreUpdate__updateBrainLoadStalled___block_invoke;
    v10[3] = &unk_1EA878A88;
    v10[4] = self;
    v11 = v4;
    dispatch_async(v7, v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v13 = self;
      v14 = 2114;
      v15 = v4;
      _os_log_impl(&dword_1DDFDD000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(updateBrainLoadStalled:) so not reporting progress=%{public}@", buf, 0x16u);
    }

  }
}

void __40__SUCoreUpdate__updateBrainLoadStalled___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "updateDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateBrainLoadStalled:", *(_QWORD *)(a1 + 40));

}

- (void)_updateBrainLoaded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[5];
  id v12;
  id v13;
  uint8_t buf[4];
  SUCoreUpdate *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[SUCoreUpdate targetPhase](self, "targetPhase") > 3)
  {
    v5 = 0;
  }
  else
  {
    -[SUCoreUpdate updateTransaction](self, "updateTransaction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreUpdate setUpdateTransaction:](self, "setUpdateTransaction:", 0);
  }
  -[SUCoreUpdate updateDelegate](self, "updateDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[SUCoreUpdate clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35__SUCoreUpdate__updateBrainLoaded___block_invoke;
    block[3] = &unk_1EA878940;
    block[4] = self;
    v12 = v4;
    v13 = v5;
    dispatch_async(v8, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "oslog");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v15 = self;
      v16 = 2114;
      v17 = v4;
      _os_log_impl(&dword_1DDFDD000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(updateBrainLoaded:) so not reporting progress=%{public}@", buf, 0x16u);
    }

    if (v5)
      objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v5, CFSTR("update.Transaction"));
  }

}

void __35__SUCoreUpdate__updateBrainLoaded___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "updateDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateBrainLoaded:", *(_QWORD *)(a1 + 40));

  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v3, CFSTR("update.Transaction"));
}

- (void)_updateAssetDownloadPreflighted
{
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  SUCoreUpdate *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (-[SUCoreUpdate targetPhase](self, "targetPhase") > 4)
  {
    v3 = 0;
  }
  else
  {
    -[SUCoreUpdate updateTransaction](self, "updateTransaction");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreUpdate setUpdateTransaction:](self, "setUpdateTransaction:", 0);
  }
  -[SUCoreUpdate updateDelegate](self, "updateDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SUCoreUpdate clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __47__SUCoreUpdate__updateAssetDownloadPreflighted__block_invoke;
    v9[3] = &unk_1EA878A88;
    v9[4] = self;
    v10 = v3;
    dispatch_async(v6, v9);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "oslog");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v12 = self;
      _os_log_impl(&dword_1DDFDD000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(updateAssetDownloadPreflighted) so not reporting", buf, 0xCu);
    }

    if (v3)
      objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v3, CFSTR("update.Transaction"));
  }

}

void __47__SUCoreUpdate__updateAssetDownloadPreflighted__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "updateDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateAssetDownloadPreflighted");

  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v3, CFSTR("update.Transaction"));
}

- (void)_updateAssetDownloadProgress:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  SUCoreUpdate *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreUpdate updateDelegate](self, "updateDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SUCoreUpdate clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __45__SUCoreUpdate__updateAssetDownloadProgress___block_invoke;
    v10[3] = &unk_1EA878A88;
    v10[4] = self;
    v11 = v4;
    dispatch_async(v7, v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v13 = self;
      v14 = 2114;
      v15 = v4;
      _os_log_impl(&dword_1DDFDD000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(updateAssetDownloadProgress:) so not reporting progress=%{public}@", buf, 0x16u);
    }

  }
}

void __45__SUCoreUpdate__updateAssetDownloadProgress___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "updateDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateAssetDownloadProgress:", *(_QWORD *)(a1 + 40));

}

- (void)_updateAssetDownloadStalled:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  SUCoreUpdate *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreUpdate updateDelegate](self, "updateDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SUCoreUpdate clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __44__SUCoreUpdate__updateAssetDownloadStalled___block_invoke;
    v10[3] = &unk_1EA878A88;
    v10[4] = self;
    v11 = v4;
    dispatch_async(v7, v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v13 = self;
      v14 = 2114;
      v15 = v4;
      _os_log_impl(&dword_1DDFDD000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(updateAssetDownloadStalled:) so not reporting progress=%{public}@", buf, 0x16u);
    }

  }
}

void __44__SUCoreUpdate__updateAssetDownloadStalled___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "updateDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateAssetDownloadStalled:", *(_QWORD *)(a1 + 40));

}

- (void)_updateAssetDownloaded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[5];
  id v12;
  id v13;
  uint8_t buf[4];
  SUCoreUpdate *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[SUCoreUpdate targetPhase](self, "targetPhase") > 6)
  {
    v5 = 0;
  }
  else
  {
    -[SUCoreUpdate updateTransaction](self, "updateTransaction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreUpdate setUpdateTransaction:](self, "setUpdateTransaction:", 0);
  }
  -[SUCoreUpdate updateDelegate](self, "updateDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[SUCoreUpdate clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__SUCoreUpdate__updateAssetDownloaded___block_invoke;
    block[3] = &unk_1EA878940;
    block[4] = self;
    v12 = v4;
    v13 = v5;
    dispatch_async(v8, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "oslog");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v15 = self;
      v16 = 2114;
      v17 = v4;
      _os_log_impl(&dword_1DDFDD000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(updateAssetDownloaded:) so not reporting progress=%{public}@", buf, 0x16u);
    }

    if (v5)
      objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v5, CFSTR("update.Transaction"));
  }

}

void __39__SUCoreUpdate__updateAssetDownloaded___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "updateDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateAssetDownloaded:", *(_QWORD *)(a1 + 40));

  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v3, CFSTR("update.Transaction"));
}

- (void)_updatePrepareProgress:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  SUCoreUpdate *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreUpdate updateDelegate](self, "updateDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SUCoreUpdate clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __39__SUCoreUpdate__updatePrepareProgress___block_invoke;
    v10[3] = &unk_1EA878A88;
    v10[4] = self;
    v11 = v4;
    dispatch_async(v7, v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v13 = self;
      v14 = 2114;
      v15 = v4;
      _os_log_impl(&dword_1DDFDD000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(updatePrepareProgress:) so not reporting progress=%{public}@", buf, 0x16u);
    }

  }
}

void __39__SUCoreUpdate__updatePrepareProgress___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "updateDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updatePrepareProgress:", *(_QWORD *)(a1 + 40));

}

- (void)_updatePrepared:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[5];
  id v12;
  id v13;
  uint8_t buf[4];
  SUCoreUpdate *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[SUCoreUpdate targetPhase](self, "targetPhase") > 7)
  {
    v5 = 0;
  }
  else
  {
    -[SUCoreUpdate updateTransaction](self, "updateTransaction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreUpdate setUpdateTransaction:](self, "setUpdateTransaction:", 0);
  }
  -[SUCoreUpdate updateDelegate](self, "updateDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[SUCoreUpdate clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __32__SUCoreUpdate__updatePrepared___block_invoke;
    block[3] = &unk_1EA878940;
    block[4] = self;
    v12 = v4;
    v13 = v5;
    dispatch_async(v8, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "oslog");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v15 = self;
      v16 = 2114;
      v17 = v4;
      _os_log_impl(&dword_1DDFDD000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(updatePrepared:) so not reporting progress=%{public}@", buf, 0x16u);
    }

    if (v5)
      objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v5, CFSTR("update.Transaction"));
  }

}

void __32__SUCoreUpdate__updatePrepared___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "updateDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updatePrepared:", *(_QWORD *)(a1 + 40));

  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v3, CFSTR("update.Transaction"));
}

- (void)_updateCurrentResumed
{
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  SUCoreUpdate *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[SUCoreUpdate updateTransaction](self, "updateTransaction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdate setUpdateTransaction:](self, "setUpdateTransaction:", 0);
  -[SUCoreUpdate updateDelegate](self, "updateDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SUCoreUpdate clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __37__SUCoreUpdate__updateCurrentResumed__block_invoke;
    v9[3] = &unk_1EA878A88;
    v9[4] = self;
    v10 = v3;
    dispatch_async(v6, v9);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "oslog");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v12 = self;
      _os_log_impl(&dword_1DDFDD000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(updateCurrentResumed) so not reporting", buf, 0xCu);
    }

    if (v3)
      objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v3, CFSTR("update.Transaction"));
  }

}

void __37__SUCoreUpdate__updateCurrentResumed__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "updateDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateCurrentResumed");

  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v3, CFSTR("update.Transaction"));
}

- (void)_updateCurrentResumeFailed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  NSObject *v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  SUCoreUpdate *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreUpdate updateTransaction](self, "updateTransaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdate setUpdateTransaction:](self, "setUpdateTransaction:", 0);
  -[SUCoreUpdate updateDelegate](self, "updateDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[SUCoreUpdate failedAttemptError](self, "failedAttemptError");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (!v8)
      v8 = v4;
    -[SUCoreUpdate clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__SUCoreUpdate__updateCurrentResumeFailed___block_invoke;
    block[3] = &unk_1EA878940;
    block[4] = self;
    v14 = v8;
    v15 = v5;
    v10 = v8;
    dispatch_async(v9, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "oslog");
    v12 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v17 = self;
      v18 = 2114;
      v19 = v4;
      _os_log_impl(&dword_1DDFDD000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(updateCurrentResumeFailed:) so not reporting error=%{public}@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v5, CFSTR("update.Transaction"));
  }

}

uint64_t __43__SUCoreUpdate__updateCurrentResumeFailed___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "updateDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateCurrentResumeFailed:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 48), CFSTR("update.Transaction"));
}

- (void)_updateApplyProgress:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  SUCoreUpdate *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreUpdate updateDelegate](self, "updateDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SUCoreUpdate clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __37__SUCoreUpdate__updateApplyProgress___block_invoke;
    v10[3] = &unk_1EA878A88;
    v10[4] = self;
    v11 = v4;
    dispatch_async(v7, v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v13 = self;
      v14 = 2114;
      v15 = v4;
      _os_log_impl(&dword_1DDFDD000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(updateApplyProgress:) so not reporting progress=%{public}@", buf, 0x16u);
    }

  }
}

void __37__SUCoreUpdate__updateApplyProgress___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "updateDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateApplyProgress:", *(_QWORD *)(a1 + 40));

}

- (void)_updateApplied
{
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  SUCoreUpdate *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (-[SUCoreUpdate targetPhase](self, "targetPhase") > 10)
  {
    v3 = 0;
  }
  else
  {
    -[SUCoreUpdate updateTransaction](self, "updateTransaction");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreUpdate setUpdateTransaction:](self, "setUpdateTransaction:", 0);
  }
  -[SUCoreUpdate updateDelegate](self, "updateDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SUCoreUpdate clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __30__SUCoreUpdate__updateApplied__block_invoke;
    v9[3] = &unk_1EA878A88;
    v9[4] = self;
    v10 = v3;
    dispatch_async(v6, v9);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "oslog");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v12 = self;
      _os_log_impl(&dword_1DDFDD000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(updateApplied:) so not reporting", buf, 0xCu);
    }

    if (v3)
      objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v3, CFSTR("update.Transaction"));
  }

}

void __30__SUCoreUpdate__updateApplied__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "updateDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateApplied");

  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v3, CFSTR("update.Transaction"));
}

- (void)_applyAttemptFailed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  NSObject *v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  SUCoreUpdate *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreUpdate updateTransaction](self, "updateTransaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdate setUpdateTransaction:](self, "setUpdateTransaction:", 0);
  -[SUCoreUpdate updateDelegate](self, "updateDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[SUCoreUpdate failedAttemptError](self, "failedAttemptError");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (!v8)
      v8 = v4;
    -[SUCoreUpdate clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __36__SUCoreUpdate__applyAttemptFailed___block_invoke;
    block[3] = &unk_1EA878940;
    block[4] = self;
    v14 = v8;
    v15 = v5;
    v10 = v8;
    dispatch_async(v9, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "oslog");
    v12 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v17 = self;
      v18 = 2114;
      v19 = v4;
      _os_log_impl(&dword_1DDFDD000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(applyAttemptFailed:) so not reporting error=%{public}@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v5, CFSTR("update.Transaction"));
  }

}

uint64_t __36__SUCoreUpdate__applyAttemptFailed___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "updateDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applyAttemptFailed:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 48), CFSTR("update.Transaction"));
}

- (void)_updateAttemptFailed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  NSObject *v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  SUCoreUpdate *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreUpdate updateTransaction](self, "updateTransaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdate setUpdateTransaction:](self, "setUpdateTransaction:", 0);
  -[SUCoreUpdate updateDelegate](self, "updateDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[SUCoreUpdate failedAttemptError](self, "failedAttemptError");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (!v8)
      v8 = v4;
    -[SUCoreUpdate clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__SUCoreUpdate__updateAttemptFailed___block_invoke;
    block[3] = &unk_1EA878940;
    block[4] = self;
    v14 = v8;
    v15 = v5;
    v10 = v8;
    dispatch_async(v9, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "oslog");
    v12 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v17 = self;
      v18 = 2114;
      v19 = v4;
      _os_log_impl(&dword_1DDFDD000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(updateAttemptFailed:) so not reporting error=%{public}@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v5, CFSTR("update.Transaction"));
  }

}

uint64_t __37__SUCoreUpdate__updateAttemptFailed___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "updateDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateAttemptFailed:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 48), CFSTR("update.Transaction"));
}

- (void)_updateCanceled
{
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  SUCoreUpdate *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[SUCoreUpdate updateTransaction](self, "updateTransaction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdate setUpdateTransaction:](self, "setUpdateTransaction:", 0);
  -[SUCoreUpdate updateDelegate](self, "updateDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SUCoreUpdate clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __31__SUCoreUpdate__updateCanceled__block_invoke;
    v9[3] = &unk_1EA878A88;
    v9[4] = self;
    v10 = v3;
    dispatch_async(v6, v9);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "oslog");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v12 = self;
      _os_log_impl(&dword_1DDFDD000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(updateCanceled) so not reporting", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v3, CFSTR("update.Transaction"));
  }

}

uint64_t __31__SUCoreUpdate__updateCanceled__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "updateDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateCanceled");

  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("update.Transaction"));
}

- (void)_updateAnomaly:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  SUCoreUpdate *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreUpdate updateDelegate](self, "updateDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SUCoreUpdate clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __31__SUCoreUpdate__updateAnomaly___block_invoke;
    v10[3] = &unk_1EA878A88;
    v10[4] = self;
    v11 = v4;
    dispatch_async(v7, v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v13 = self;
      v14 = 2114;
      v15 = v4;
      _os_log_impl(&dword_1DDFDD000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(updateAnomaly:) so not reporting error=%{public}@", buf, 0x16u);
    }

  }
}

void __31__SUCoreUpdate__updateAnomaly___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "updateDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateAnomaly:", *(_QWORD *)(a1 + 40));

}

- (void)_updateRolledBack:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  SUCoreUpdate *v13;
  id v14;
  uint8_t buf[4];
  SUCoreUpdate *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[SUCoreUpdate targetPhase](self, "targetPhase") > 11)
  {
    v5 = 0;
  }
  else
  {
    -[SUCoreUpdate updateTransaction](self, "updateTransaction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreUpdate setUpdateTransaction:](self, "setUpdateTransaction:", 0);
  }
  -[SUCoreUpdate updateDelegate](self, "updateDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[SUCoreUpdate clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __34__SUCoreUpdate__updateRolledBack___block_invoke;
    block[3] = &unk_1EA878940;
    v12 = v4;
    v13 = self;
    v14 = v5;
    dispatch_async(v8, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "oslog");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v16 = self;
      _os_log_impl(&dword_1DDFDD000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(updateRolledBack:) so not reporting", buf, 0xCu);
    }

    if (v5)
      objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v5, CFSTR("update.Transaction"));
  }

}

void __34__SUCoreUpdate__updateRolledBack___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "rollbackCompleted");
  objc_msgSend(*(id *)(a1 + 40), "updateDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateRolledBack:", *(_QWORD *)(a1 + 32));

  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v3, CFSTR("update.Transaction"));
}

- (void)_rollbackAttemptFailed:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  SUCoreUpdate *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SUCoreUpdate updateTransaction](self, "updateTransaction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdate setUpdateTransaction:](self, "setUpdateTransaction:", 0);
  -[SUCoreUpdate updateDelegate](self, "updateDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[SUCoreUpdate failedAttemptError](self, "failedAttemptError");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (!v11)
      v11 = v7;
    -[SUCoreUpdate clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __49__SUCoreUpdate__rollbackAttemptFailed_withError___block_invoke;
    v16[3] = &unk_1EA8796B8;
    v16[4] = self;
    v17 = v6;
    v18 = v11;
    v19 = v8;
    v13 = v11;
    dispatch_async(v12, v16);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "oslog");
    v15 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v21 = self;
      v22 = 2114;
      v23 = v7;
      _os_log_impl(&dword_1DDFDD000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(rollbackAttemptFailed:) so not reporting error=%{public}@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v8, CFSTR("update.Transaction"));
  }

}

uint64_t __49__SUCoreUpdate__rollbackAttemptFailed_withError___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "updateDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rollbackAttemptFailed:withError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 56), CFSTR("update.Transaction"));
}

- (void)msuBrainLoadProgress:(id)a3
{
  id v4;
  SUCoreUpdateParam *v5;
  id v6;

  v4 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[SUCoreUpdateParam initWithDownloadProgress:]([SUCoreUpdateParam alloc], "initWithDownloadProgress:", v4);

  objc_msgSend(v6, "postEvent:withInfo:", CFSTR("BrainLoadProgress"), v5);
}

- (void)msuBrainLoadStalled:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "oslog");
  v6 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[SUCoreUpdate updateName](self, "updateName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2114;
    v11 = v4;
    _os_log_impl(&dword_1DDFDD000, v6, OS_LOG_TYPE_DEFAULT, "[UPDATE(%{public}@)] msuBrainLoadStalled - not being reported to policy layer progress=%{public}@", (uint8_t *)&v8, 0x16u);

  }
}

- (void)msuBrainLoaded:(id)a3
{
  id v4;
  SUCoreUpdateParam *v5;
  id v6;

  v4 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[SUCoreUpdateParam initWithDownloadProgress:]([SUCoreUpdateParam alloc], "initWithDownloadProgress:", v4);

  objc_msgSend(v6, "postEvent:withInfo:", CFSTR("BrainLoadSuccess"), v5);
}

- (void)msuBrainLoadFailed:(id)a3
{
  id v4;
  SUCoreUpdateParam *v5;
  id v6;

  v4 = a3;
  -[SUCoreUpdate _trackUpdateError:forReason:error:](self, "_trackUpdateError:forReason:error:", CFSTR("msuBrainLoadFailed"), 0, v4);
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[SUCoreUpdateParam initWithError:]([SUCoreUpdateParam alloc], "initWithError:", v4);

  objc_msgSend(v6, "postEvent:withInfo:", CFSTR("BrainLoadFailed"), v5);
}

- (void)msuSUDownloadPreflighted
{
  SUCoreUpdateParam *v2;
  id v3;

  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc_init(SUCoreUpdateParam);
  objc_msgSend(v3, "postEvent:withInfo:", CFSTR("PreflightSuccess"), v2);

}

- (void)msuSUDownloadPreflightFailed:(id)a3
{
  id v4;
  SUCoreUpdateParam *v5;
  id v6;

  v4 = a3;
  -[SUCoreUpdate _trackUpdateError:forReason:error:](self, "_trackUpdateError:forReason:error:", CFSTR("msuSUDownloadPreflightFailed"), 0, v4);
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[SUCoreUpdateParam initWithError:]([SUCoreUpdateParam alloc], "initWithError:", v4);

  objc_msgSend(v6, "postEvent:withInfo:", CFSTR("PreflightFailed"), v5);
}

- (void)msuPrepareProgress:(id)a3
{
  id v4;
  SUCoreUpdateParam *v5;
  id v6;

  v4 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[SUCoreUpdateParam initWithPrepareProgress:]([SUCoreUpdateParam alloc], "initWithPrepareProgress:", v4);

  objc_msgSend(v6, "postEvent:withInfo:", CFSTR("PrepareProgress"), v5);
}

- (void)msuPrepared:(id)a3
{
  id v4;
  SUCoreUpdateParam *v5;
  id v6;

  v4 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[SUCoreUpdateParam initWithPrepareProgress:]([SUCoreUpdateParam alloc], "initWithPrepareProgress:", v4);

  objc_msgSend(v6, "postEvent:withInfo:", CFSTR("PrepareSuccess"), v5);
}

- (void)msuPrepareFailed:(id)a3
{
  id v4;
  SUCoreUpdateParam *v5;
  id v6;

  v4 = a3;
  -[SUCoreUpdate _trackUpdateError:forReason:error:](self, "_trackUpdateError:forReason:error:", CFSTR("msuPrepareFailed"), 0, v4);
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[SUCoreUpdateParam initWithError:]([SUCoreUpdateParam alloc], "initWithError:", v4);

  objc_msgSend(v6, "postEvent:withInfo:", CFSTR("PrepareFailed"), v5);
}

- (void)msuSuspended
{
  SUCoreUpdateParam *v2;
  id v3;

  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc_init(SUCoreUpdateParam);
  objc_msgSend(v3, "postEvent:withInfo:", CFSTR("SuspendSuccess"), v2);

}

- (void)msuSuspendFailed:(id)a3
{
  id v4;
  SUCoreUpdateParam *v5;
  id v6;

  v4 = a3;
  -[SUCoreUpdate _trackUpdateError:forReason:error:](self, "_trackUpdateError:forReason:error:", CFSTR("msuSuspendFailed"), 0, v4);
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[SUCoreUpdateParam initWithError:]([SUCoreUpdateParam alloc], "initWithError:", v4);

  objc_msgSend(v6, "postEvent:withInfo:", CFSTR("SuspendFailed"), v5);
}

- (void)msuResumed
{
  SUCoreUpdateParam *v2;
  id v3;

  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc_init(SUCoreUpdateParam);
  objc_msgSend(v3, "postEvent:withInfo:", CFSTR("ResumeSuccess"), v2);

}

- (void)msuResumeFailed:(id)a3
{
  id v4;
  SUCoreUpdateParam *v5;
  id v6;

  v4 = a3;
  -[SUCoreUpdate _trackUpdateError:forReason:error:](self, "_trackUpdateError:forReason:error:", CFSTR("msuResumeFailed"), 0, v4);
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[SUCoreUpdateParam initWithError:]([SUCoreUpdateParam alloc], "initWithError:", v4);

  objc_msgSend(v6, "postEvent:withInfo:", CFSTR("ResumeFailed"), v5);
}

- (void)msuApplyProgress:(id)a3
{
  id v4;
  SUCoreUpdateParam *v5;
  id v6;

  v4 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[SUCoreUpdateParam initWithApplyProgress:]([SUCoreUpdateParam alloc], "initWithApplyProgress:", v4);

  objc_msgSend(v6, "postEvent:withInfo:", CFSTR("ApplyProgress"), v5);
}

- (void)msuApplied
{
  SUCoreUpdateParam *v2;
  id v3;

  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc_init(SUCoreUpdateParam);
  objc_msgSend(v3, "postEvent:withInfo:", CFSTR("ApplySuccess"), v2);

}

- (void)msuApplyFailed:(id)a3
{
  id v4;
  SUCoreUpdateParam *v5;
  id v6;

  v4 = a3;
  -[SUCoreUpdate _trackUpdateError:forReason:error:](self, "_trackUpdateError:forReason:error:", CFSTR("msuApplyFailed"), 0, v4);
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[SUCoreUpdateParam initWithError:]([SUCoreUpdateParam alloc], "initWithError:", v4);

  objc_msgSend(v6, "postEvent:withInfo:", CFSTR("ApplyFailed"), v5);
}

- (void)msuRollbackPrepareSuccess
{
  SUCoreUpdateParam *v3;
  void *v4;
  SUCoreUpdateParam *v5;
  id v6;

  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [SUCoreUpdateParam alloc];
  -[SUCoreUpdate rollbackControl](self, "rollbackControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SUCoreUpdateParam initWithRollback:withError:](v3, "initWithRollback:withError:", v4, 0);
  objc_msgSend(v6, "postEvent:withInfo:", CFSTR("RB_RollbackPrepareSuccess"), v5);

}

- (void)msuRollbackSuspendSuccess
{
  SUCoreUpdateParam *v3;
  void *v4;
  SUCoreUpdateParam *v5;
  id v6;

  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [SUCoreUpdateParam alloc];
  -[SUCoreUpdate rollbackControl](self, "rollbackControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SUCoreUpdateParam initWithRollback:withError:](v3, "initWithRollback:withError:", v4, 0);
  objc_msgSend(v6, "postEvent:withInfo:", CFSTR("RB_RollbackSuspendSuccess"), v5);

}

- (void)msuRollbackResumeSuccess
{
  SUCoreUpdateParam *v3;
  void *v4;
  SUCoreUpdateParam *v5;
  id v6;

  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [SUCoreUpdateParam alloc];
  -[SUCoreUpdate rollbackControl](self, "rollbackControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SUCoreUpdateParam initWithRollback:withError:](v3, "initWithRollback:withError:", v4, 0);
  objc_msgSend(v6, "postEvent:withInfo:", CFSTR("RB_RollbackResumeSuccess"), v5);

}

- (void)msuRollbackApplySuccess
{
  SUCoreUpdateParam *v3;
  void *v4;
  SUCoreUpdateParam *v5;
  id v6;

  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [SUCoreUpdateParam alloc];
  -[SUCoreUpdate rollbackControl](self, "rollbackControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SUCoreUpdateParam initWithRollback:withError:](v3, "initWithRollback:withError:", v4, 0);
  objc_msgSend(v6, "postEvent:withInfo:", CFSTR("RB_RollbackAppleSuccess"), v5);

}

- (void)msuRollbackApplyFailed:(id)a3
{
  id v4;
  SUCoreUpdateParam *v5;
  id v6;

  v4 = a3;
  -[SUCoreUpdate _trackUpdateError:forReason:error:](self, "_trackUpdateError:forReason:error:", CFSTR("msuRollbackApplyFailed"), 0, v4);
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[SUCoreUpdateParam initWithError:]([SUCoreUpdateParam alloc], "initWithError:", v4);

  objc_msgSend(v6, "postEvent:withInfo:", CFSTR("RB_RollbackApplyFailed"), v5);
}

- (void)msuRollbackFailed:(id)a3
{
  id v4;
  SUCoreUpdateParam *v5;
  void *v6;
  SUCoreUpdateParam *v7;
  id v8;

  v4 = a3;
  -[SUCoreUpdate _trackUpdateError:forReason:error:](self, "_trackUpdateError:forReason:error:", CFSTR("msuRollbackFailed"), 0, v4);
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [SUCoreUpdateParam alloc];
  -[SUCoreUpdate rollbackControl](self, "rollbackControl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SUCoreUpdateParam initWithRollback:withError:](v5, "initWithRollback:withError:", v6, v4);

  objc_msgSend(v8, "postEvent:withInfo:", CFSTR("RB_RollbackFailed"), v7);
}

- (void)msuRemoved
{
  SUCoreUpdateParam *v2;
  id v3;

  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc_init(SUCoreUpdateParam);
  objc_msgSend(v3, "postEvent:withInfo:", CFSTR("SURemoved"), v2);

}

- (void)msuRemoveFailed:(id)a3
{
  id v4;
  SUCoreUpdateParam *v5;
  id v6;

  v4 = a3;
  -[SUCoreUpdate _trackUpdateError:forReason:error:](self, "_trackUpdateError:forReason:error:", CFSTR("msuRemoveFailed"), 0, v4);
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[SUCoreUpdateParam initWithError:]([SUCoreUpdateParam alloc], "initWithError:", v4);

  objc_msgSend(v6, "postEvent:withInfo:", CFSTR("SURemoved"), v5);
}

- (void)downloadProgress:(id)a3
{
  id v4;
  SUCoreUpdateParam *v5;
  id v6;

  v4 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[SUCoreUpdateParam initWithDownloadProgress:]([SUCoreUpdateParam alloc], "initWithDownloadProgress:", v4);

  objc_msgSend(v6, "postEvent:withInfo:", CFSTR("DownloadProgress"), v5);
}

- (void)downloadStalled:(id)a3
{
  id v4;
  SUCoreUpdateParam *v5;
  id v6;

  v4 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[SUCoreUpdateParam initWithDownloadProgress:]([SUCoreUpdateParam alloc], "initWithDownloadProgress:", v4);

  objc_msgSend(v6, "postEvent:withInfo:", CFSTR("DownloadStalled"), v5);
}

- (void)downloaded:(id)a3
{
  id v4;
  SUCoreUpdateParam *v5;
  id v6;

  v4 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[SUCoreUpdateParam initWithDownloadProgress:]([SUCoreUpdateParam alloc], "initWithDownloadProgress:", v4);

  objc_msgSend(v6, "postEvent:withInfo:", CFSTR("DownloadSuccess"), v5);
}

- (void)downloadFailed:(id)a3
{
  id v4;
  SUCoreUpdateParam *v5;
  id v6;

  v4 = a3;
  -[SUCoreUpdate _trackUpdateError:forReason:error:](self, "_trackUpdateError:forReason:error:", CFSTR("maDownloadFailed"), 0, v4);
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[SUCoreUpdateParam initWithError:]([SUCoreUpdateParam alloc], "initWithError:", v4);

  objc_msgSend(v6, "postEvent:withInfo:", CFSTR("DownloadFailed"), v5);
}

- (void)updateRemoved
{
  SUCoreUpdateParam *v2;
  id v3;

  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc_init(SUCoreUpdateParam);
  objc_msgSend(v3, "postEvent:withInfo:", CFSTR("SURemoved"), v2);

}

- (void)updateRemoveFailed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  SUCoreUpdateParam *v8;
  id v9;

  v4 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "diag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ remove failed (reported as removed)"), self);
  objc_msgSend(v6, "trackAnomaly:forReason:withResult:withError:", CFSTR("MA-DELEGATE"), v7, objc_msgSend(v4, "code"), v4);

  -[SUCoreUpdate _trackUpdateError:forReason:error:](self, "_trackUpdateError:forReason:error:", CFSTR("maAssetRemoveFailed"), 0, v4);
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = -[SUCoreUpdateParam initWithError:]([SUCoreUpdateParam alloc], "initWithError:", v4);

  objc_msgSend(v9, "postEvent:withInfo:", CFSTR("SURemoved"), v8);
}

- (void)anomaly:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "diag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ anomaly"), self);
  objc_msgSend(v5, "trackAnomaly:forReason:withResult:withError:", CFSTR("MA-DELEGATE"), v6, objc_msgSend(v4, "code"), v4);

}

- (void)_adjustTarget:(int64_t)a3 withPolicy:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint8_t buf[4];
  SUCoreUpdate *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "extendedStateQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (a3)
  {
    if (-[SUCoreUpdate targetPhase](self, "targetPhase") <= a3)
    {
      -[SUCoreUpdate setTargetPhase:](self, "setTargetPhase:", a3);
      if (!v6)
        goto LABEL_10;
      goto LABEL_7;
    }
    v9 = objc_alloc(MEMORY[0x1E0CB3940]);
    +[SUCoreUpdateParam targetPhaseName:](SUCoreUpdateParam, "targetPhaseName:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUCoreUpdateParam targetPhaseName:](SUCoreUpdateParam, "targetPhaseName:", -[SUCoreUpdate targetPhase](self, "targetPhase"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("target requested(%@) when targeting(%@) [no change to target]"), v10, v11);

    -[SUCoreUpdate _trackUpdateAnomaly:result:description:](self, "_trackUpdateAnomaly:result:description:", CFSTR("TARGET"), 8116, v12);
  }
  if (!v6)
    goto LABEL_10;
LABEL_7:
  -[SUCoreUpdate setPolicy:](self, "setPolicy:", v6);
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "oslog");
  v14 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    -[SUCoreUpdate policy](self, "policy");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = self;
    v18 = 2112;
    v19 = v15;
    _os_log_impl(&dword_1DDFDD000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ adjusted policy: %@", buf, 0x16u);

  }
LABEL_10:

}

- (void)_eventAfterReachingPhase:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  __CFString **v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  void *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  __CFString *v63;
  __CFString *v64;
  void *v65;
  SUCoreUpdateParam *v66;
  uint8_t buf[4];
  SUCoreUpdate *v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  void *v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  switch(a3)
  {
    case 2:
      -[SUCoreUpdate policy](self, "policy");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "loadBrainPolicy");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "skipPhase");

      if (!v9)
      {
        v14 = kSU_E_PerformLoadBrain;
        goto LABEL_55;
      }
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "oslog");
      v11 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        +[SUCoreUpdateParam targetPhaseName:](SUCoreUpdateParam, "targetPhaseName:", 2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[SUCoreUpdateParam targetPhaseName:](SUCoreUpdateParam, "targetPhaseName:", 3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v68 = self;
        v69 = 2114;
        v70 = v12;
        v71 = 2114;
        v72 = v13;
        _os_log_impl(&dword_1DDFDD000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ [REACHED_PHASE:%{public}@=>%{public}@] skipped load of update brain", buf, 0x20u);

      }
      goto LABEL_6;
    case 3:
LABEL_6:
      if (-[SUCoreUpdate targetPhase](self, "targetPhase") >= 4)
      {
        -[SUCoreUpdate policy](self, "policy");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "downloadPreflightPolicy");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "skipPhase");

        if (v17)
        {
          objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "oslog");
          v19 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            +[SUCoreUpdateParam targetPhaseName:](SUCoreUpdateParam, "targetPhaseName:", a3);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            +[SUCoreUpdateParam targetPhaseName:](SUCoreUpdateParam, "targetPhaseName:", 4);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v68 = self;
            v69 = 2114;
            v70 = v20;
            v71 = 2114;
            v72 = v21;
            _os_log_impl(&dword_1DDFDD000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ [REACHED_PHASE:%{public}@=>%{public}@] skipped preflight of SU asset download", buf, 0x20u);

          }
LABEL_12:
          if (-[SUCoreUpdate targetPhase](self, "targetPhase") >= 5)
          {
            -[SUCoreUpdate policy](self, "policy");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "checkAvailableSpace");

            if ((v23 & 1) != 0)
            {
              v14 = kSU_E_PerformDownloadSpaceCheck;
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "oslog");
              v25 = objc_claimAutoreleasedReturnValue();

              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                +[SUCoreUpdateParam targetPhaseName:](SUCoreUpdateParam, "targetPhaseName:", a3);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                +[SUCoreUpdateParam targetPhaseName:](SUCoreUpdateParam, "targetPhaseName:", 5);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v68 = self;
                v69 = 2114;
                v70 = v26;
                v71 = 2114;
                v72 = v27;
                _os_log_impl(&dword_1DDFDD000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ [REACHED_PHASE:%{public}@=>%{public}@] skipped check of available filesystem space", buf, 0x20u);

              }
LABEL_21:
              -[SUCoreUpdate policy](self, "policy");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "softwareUpdateDownloadPolicy");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = objc_msgSend(v29, "skipPhase");

              if (v30)
              {
                objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "oslog");
                v32 = objc_claimAutoreleasedReturnValue();

                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                {
                  +[SUCoreUpdateParam targetPhaseName:](SUCoreUpdateParam, "targetPhaseName:", a3);
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  +[SUCoreUpdateParam targetPhaseName:](SUCoreUpdateParam, "targetPhaseName:", 6);
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  v68 = self;
                  v69 = 2114;
                  v70 = v33;
                  v71 = 2114;
                  v72 = v34;
                  _os_log_impl(&dword_1DDFDD000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ [REACHED_PHASE:%{public}@=>%{public}@] skipped download of SU asset", buf, 0x20u);

                }
LABEL_25:
                if (-[SUCoreUpdate targetPhase](self, "targetPhase") >= 7)
                {
                  -[SUCoreUpdate policy](self, "policy");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v35, "preparePolicy");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  v37 = objc_msgSend(v36, "skipPhase");

                  if (v37)
                  {
                    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v38, "oslog");
                    v39 = objc_claimAutoreleasedReturnValue();

                    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
                    {
                      +[SUCoreUpdateParam targetPhaseName:](SUCoreUpdateParam, "targetPhaseName:", a3);
                      v40 = (void *)objc_claimAutoreleasedReturnValue();
                      +[SUCoreUpdateParam targetPhaseName:](SUCoreUpdateParam, "targetPhaseName:", 7);
                      v41 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543874;
                      v68 = self;
                      v69 = 2114;
                      v70 = v40;
                      v71 = 2114;
                      v72 = v41;
                      _os_log_impl(&dword_1DDFDD000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@ [REACHED_PHASE:%{public}@=>%{public}@] skipped prepare of update", buf, 0x20u);

                    }
LABEL_31:
                    -[SUCoreUpdate policy](self, "policy");
                    v42 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v42, "suspendPolicy");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    v44 = objc_msgSend(v43, "skipPhase");

                    if (v44)
                    {
                      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
                      v45 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v45, "oslog");
                      v46 = objc_claimAutoreleasedReturnValue();

                      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                      {
                        +[SUCoreUpdateParam targetPhaseName:](SUCoreUpdateParam, "targetPhaseName:", a3);
                        v47 = (void *)objc_claimAutoreleasedReturnValue();
                        +[SUCoreUpdateParam targetPhaseName:](SUCoreUpdateParam, "targetPhaseName:", 8);
                        v48 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138543874;
                        v68 = self;
                        v69 = 2114;
                        v70 = v47;
                        v71 = 2114;
                        v72 = v48;
                        _os_log_impl(&dword_1DDFDD000, v46, OS_LOG_TYPE_DEFAULT, "%{public}@ [REACHED_PHASE:%{public}@=>%{public}@] skipped suspend of prepared update", buf, 0x20u);

                      }
LABEL_35:
                      if (-[SUCoreUpdate targetPhase](self, "targetPhase") >= 9)
                      {
                        -[SUCoreUpdate policy](self, "policy");
                        v49 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v49, "resumePolicy");
                        v50 = (void *)objc_claimAutoreleasedReturnValue();
                        v51 = objc_msgSend(v50, "skipPhase");

                        if (v51)
                        {
                          objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
                          v52 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v52, "oslog");
                          v53 = objc_claimAutoreleasedReturnValue();

                          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
                          {
                            +[SUCoreUpdateParam targetPhaseName:](SUCoreUpdateParam, "targetPhaseName:", a3);
                            v54 = (void *)objc_claimAutoreleasedReturnValue();
                            +[SUCoreUpdateParam targetPhaseName:](SUCoreUpdateParam, "targetPhaseName:", 9);
                            v55 = (void *)objc_claimAutoreleasedReturnValue();
                            *(_DWORD *)buf = 138543874;
                            v68 = self;
                            v69 = 2114;
                            v70 = v54;
                            v71 = 2114;
                            v72 = v55;
                            _os_log_impl(&dword_1DDFDD000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@ [REACHED_PHASE:%{public}@=>%{public}@] skipped resume of suspended update", buf, 0x20u);

                          }
LABEL_41:
                          if (-[SUCoreUpdate targetPhase](self, "targetPhase") >= 10)
                          {
                            -[SUCoreUpdate policy](self, "policy");
                            v56 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v56, "applyPolicy");
                            v57 = (void *)objc_claimAutoreleasedReturnValue();
                            v58 = objc_msgSend(v57, "skipPhase");

                            if (v58)
                            {
                              objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
                              v59 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v59, "oslog");
                              v60 = objc_claimAutoreleasedReturnValue();

                              if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
                              {
                                +[SUCoreUpdateParam targetPhaseName:](SUCoreUpdateParam, "targetPhaseName:", a3);
                                v61 = (void *)objc_claimAutoreleasedReturnValue();
                                +[SUCoreUpdateParam targetPhaseName:](SUCoreUpdateParam, "targetPhaseName:", 10);
                                v62 = (void *)objc_claimAutoreleasedReturnValue();
                                *(_DWORD *)buf = 138543874;
                                v68 = self;
                                v69 = 2114;
                                v70 = v61;
                                v71 = 2114;
                                v72 = v62;
                                _os_log_impl(&dword_1DDFDD000, v60, OS_LOG_TYPE_DEFAULT, "%{public}@ [REACHED_PHASE:%{public}@=>%{public}@] skipped apply of update", buf, 0x20u);

                              }
LABEL_47:
                              if (-[SUCoreUpdate targetPhase](self, "targetPhase") >= 11)
                              {
                                v63 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("after reaching applied phase encountered invalid target phase(%ld)"), -[SUCoreUpdate targetPhase](self, "targetPhase"));
                                -[SUCoreUpdate _trackUpdateAnomaly:result:description:](self, "_trackUpdateAnomaly:result:description:", CFSTR("[REACHED_PHASE]"), 8116, v63);
                                goto LABEL_57;
                              }
                              v14 = kSU_E_ApplySuccess;
                            }
                            else
                            {
                              v14 = kSU_E_PerformApply;
                            }
                          }
                          else
                          {
                            v14 = kSU_E_ResumeSuccessAtTarget;
                          }
                        }
                        else
                        {
                          v14 = kSU_E_PerformResume;
                        }
                      }
                      else
                      {
                        v14 = kSU_E_SuspendSuccessAtTarget;
                      }
                    }
                    else
                    {
                      v14 = kSU_E_PerformSuspend;
                    }
                  }
                  else
                  {
                    v14 = kSU_E_PerformPrepare;
                  }
                }
                else
                {
                  v14 = kSU_E_DownloadSuccessAtTarget;
                }
              }
              else
              {
                v14 = kSU_E_PerformDownloadSU;
              }
            }
          }
          else
          {
            v14 = kSU_E_PreflightSuccessAtTarget;
          }
        }
        else
        {
          v14 = kSU_E_PerformPreflightDownloadSU;
        }
      }
      else
      {
        v14 = kSU_E_BrainLoadSuccessAtTarget;
      }
LABEL_55:
      v64 = *v14;
      if (!v64)
        return;
      v63 = v64;
      -[SUCoreUpdate updateFSM](self, "updateFSM");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = objc_alloc_init(SUCoreUpdateParam);
      objc_msgSend(v65, "followupEvent:withInfo:", v63, v66);

LABEL_57:
      return;
    case 4:
      goto LABEL_12;
    case 5:
      goto LABEL_21;
    case 6:
      goto LABEL_25;
    case 7:
      goto LABEL_31;
    case 8:
      goto LABEL_35;
    case 9:
      goto LABEL_41;
    case 10:
      goto LABEL_47;
    default:
      return;
  }
}

- (void)_eventAfterReachingRollbackPhase:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  __CFString **v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  void *v49;
  char v50;
  void *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  char v58;
  void *v59;
  void *v60;
  char v61;
  void *v62;
  void *v63;
  void *v64;
  const char *v65;
  void *v66;
  __CFString *v67;
  __CFString *v68;
  void *v69;
  SUCoreUpdateParam *v70;
  uint8_t buf[4];
  SUCoreUpdate *v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  void *v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = kSU_E_RB_BeginRollback;
  switch(a3)
  {
    case 1:
      -[SUCoreUpdate policy](self, "policy");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "rollbackPolicy");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "skipCancelPreviousUpdate");

      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "oslog");
        v12 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          +[SUCoreUpdateParam targetRollbackPhaseName:](SUCoreUpdateParam, "targetRollbackPhaseName:", 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          +[SUCoreUpdateParam targetRollbackPhaseName:](SUCoreUpdateParam, "targetRollbackPhaseName:", 2);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v72 = self;
          v73 = 2114;
          v74 = v13;
          v75 = 2114;
          v76 = v14;
          _os_log_impl(&dword_1DDFDD000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ [REACHED_PHASE:%{public}@=>%{public}@] skipped cancel previous update of SU asset download before rollback", buf, 0x20u);

        }
        v7 = kSU_E_RB_BeginRollback;
      }
      else
      {
        v7 = kSU_E_RB_CancelNonRollbackUpdate;
      }
      goto LABEL_47;
    case 2:
      goto LABEL_47;
    case 3:
      -[SUCoreUpdate policy](self, "policy");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "loadBrainPolicy");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "skipPhase");

      if (!v17)
      {
        v7 = kSU_E_RB_PerformLoadBrain;
        goto LABEL_47;
      }
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "oslog");
      v19 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        +[SUCoreUpdateParam targetRollbackPhaseName:](SUCoreUpdateParam, "targetRollbackPhaseName:", 3);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[SUCoreUpdateParam targetRollbackPhaseName:](SUCoreUpdateParam, "targetRollbackPhaseName:", 4);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v72 = self;
        v73 = 2114;
        v74 = v20;
        v75 = 2114;
        v76 = v21;
        _os_log_impl(&dword_1DDFDD000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ [REACHED_PHASE:%{public}@=>%{public}@] skipped load of update brain", buf, 0x20u);

      }
LABEL_10:
      -[SUCoreUpdate policy](self, "policy");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "rollbackPolicy");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "performPhase");

      if ((v24 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "oslog");
        v29 = objc_claimAutoreleasedReturnValue();

        if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          goto LABEL_44;
LABEL_40:
        +[SUCoreUpdateParam targetRollbackPhaseName:](SUCoreUpdateParam, "targetRollbackPhaseName:", a3);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        +[SUCoreUpdateParam targetRollbackPhaseName:](SUCoreUpdateParam, "targetRollbackPhaseName:", 8);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v72 = self;
        v73 = 2114;
        v74 = v63;
        v75 = 2114;
        v76 = v64;
        v65 = "%{public}@ [REACHED_PHASE:%{public}@=>%{public}@] skipped rollback phase";
LABEL_43:
        _os_log_impl(&dword_1DDFDD000, v29, OS_LOG_TYPE_DEFAULT, v65, buf, 0x20u);

        goto LABEL_44;
      }
      -[SUCoreUpdate policy](self, "policy");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "rollbackPolicy");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "performRollbackPreparePhase");

      if ((v27 & 1) != 0)
      {
        v7 = kSU_E_RB_PerformRollbackPrepare;
        goto LABEL_47;
      }
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "oslog");
      v31 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        +[SUCoreUpdateParam targetRollbackPhaseName:](SUCoreUpdateParam, "targetRollbackPhaseName:", a3);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        +[SUCoreUpdateParam targetRollbackPhaseName:](SUCoreUpdateParam, "targetRollbackPhaseName:", 5);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v72 = self;
        v73 = 2114;
        v74 = v32;
        v75 = 2114;
        v76 = v33;
        _os_log_impl(&dword_1DDFDD000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ [REACHED_PHASE:%{public}@=>%{public}@] skipped rollback prepare phase", buf, 0x20u);

      }
LABEL_20:
      -[SUCoreUpdate policy](self, "policy");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "rollbackPolicy");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "performPhase");

      if ((v36 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "oslog");
        v29 = objc_claimAutoreleasedReturnValue();

        if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          goto LABEL_44;
        goto LABEL_40;
      }
      -[SUCoreUpdate policy](self, "policy");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "rollbackPolicy");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "performRollbackSuspendPhase");

      if ((v39 & 1) != 0)
      {
        v7 = kSU_E_RB_PerformRollbackSuspend;
        goto LABEL_47;
      }
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "oslog");
      v42 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        +[SUCoreUpdateParam targetRollbackPhaseName:](SUCoreUpdateParam, "targetRollbackPhaseName:", a3);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        +[SUCoreUpdateParam targetRollbackPhaseName:](SUCoreUpdateParam, "targetRollbackPhaseName:", 6);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v72 = self;
        v73 = 2114;
        v74 = v43;
        v75 = 2114;
        v76 = v44;
        _os_log_impl(&dword_1DDFDD000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@ [REACHED_PHASE:%{public}@=>%{public}@] skipped rollback suspend phase", buf, 0x20u);

      }
LABEL_28:
      -[SUCoreUpdate policy](self, "policy");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "rollbackPolicy");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "performPhase");

      if ((v47 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "oslog");
        v29 = objc_claimAutoreleasedReturnValue();

        if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          goto LABEL_44;
        goto LABEL_40;
      }
      -[SUCoreUpdate policy](self, "policy");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "rollbackPolicy");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "performRollbackResumePhase");

      if ((v50 & 1) != 0)
      {
        v7 = kSU_E_RB_PerformRollbackResume;
        goto LABEL_47;
      }
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "oslog");
      v53 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        +[SUCoreUpdateParam targetRollbackPhaseName:](SUCoreUpdateParam, "targetRollbackPhaseName:", a3);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        +[SUCoreUpdateParam targetRollbackPhaseName:](SUCoreUpdateParam, "targetRollbackPhaseName:", 7);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v72 = self;
        v73 = 2114;
        v74 = v54;
        v75 = 2114;
        v76 = v55;
        _os_log_impl(&dword_1DDFDD000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@ [REACHED_PHASE:%{public}@=>%{public}@] skipped rollback resume phase", buf, 0x20u);

      }
LABEL_36:
      -[SUCoreUpdate policy](self, "policy");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "rollbackPolicy");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v57, "performPhase");

      if ((v58 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "oslog");
        v29 = objc_claimAutoreleasedReturnValue();

        if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          goto LABEL_44;
        goto LABEL_40;
      }
      -[SUCoreUpdate policy](self, "policy");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "rollbackPolicy");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(v60, "performRollbackApplyPhase");

      if ((v61 & 1) != 0)
      {
        v7 = kSU_E_RB_PerformRollbackApply;
        goto LABEL_47;
      }
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "oslog");
      v29 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        +[SUCoreUpdateParam targetRollbackPhaseName:](SUCoreUpdateParam, "targetRollbackPhaseName:", a3);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        +[SUCoreUpdateParam targetRollbackPhaseName:](SUCoreUpdateParam, "targetRollbackPhaseName:", 8);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v72 = self;
        v73 = 2114;
        v74 = v63;
        v75 = 2114;
        v76 = v64;
        v65 = "%{public}@ [REACHED_PHASE:%{public}@=>%{public}@] skipped rollback apply phase";
        goto LABEL_43;
      }
LABEL_44:

LABEL_45:
      if (-[SUCoreUpdate targetPhase](self, "targetPhase") >= 9)
      {
        v68 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("after reaching rollback complete phase encountered invalid target phase(%ld)"), -[SUCoreUpdate targetPhase](self, "targetPhase"));
        -[SUCoreUpdate _trackUpdateAnomaly:result:description:](self, "_trackUpdateAnomaly:result:description:", CFSTR("[REACHED_PHASE]"), 8116, v68);
        goto LABEL_50;
      }
      v7 = kSU_E_RB_RollbackApplySuccess;
LABEL_47:
      v67 = *v7;
      if (!v67)
        return;
      v68 = v67;
      -[SUCoreUpdate updateFSM](self, "updateFSM");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = objc_alloc_init(SUCoreUpdateParam);
      objc_msgSend(v69, "followupEvent:withInfo:", v68, v70);

LABEL_50:
      return;
    case 4:
      goto LABEL_10;
    case 5:
      goto LABEL_20;
    case 6:
      goto LABEL_28;
    case 7:
      goto LABEL_36;
    case 8:
      goto LABEL_45;
    default:
      return;
  }
}

- (void)_trackUpdateAnomaly:(id)a3 result:(int64_t)a4 description:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v8 = a5;
  v9 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "extendedStateQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "buildError:underlying:description:", a4, 0, v8);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate updateFSM](self, "updateFSM");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "diag");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("[UPDATE] %@"), v9);

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ %@"), self, v8);
  objc_msgSend(v14, "trackAnomaly:forReason:withResult:withError:", v15, v16, a4, v17);

  -[SUCoreUpdate _updateAnomaly:](self, "_updateAnomaly:", v17);
}

- (void)_trackUpdateError:(id)a3 forReason:(id)a4 error:(id)a5
{
  __CFString *v8;
  id v9;
  __CFString *v10;
  __CFString *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  __CFString *v20;
  id v21;
  const __CFString *v22;

  v8 = (__CFString *)a3;
  v9 = a5;
  if (v9)
  {
    v10 = CFSTR("general");
    if (v8)
      v10 = v8;
    v11 = v10;
    v12 = a4;
    -[SUCoreUpdate failedAttemptError](self, "failedAttemptError");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      -[SUCoreUpdate setFailedAttemptError:](self, "setFailedAttemptError:", v9);
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "oslog");
      v15 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[SUCoreUpdate _trackUpdateError:forReason:error:].cold.1(self, (uint64_t)v11, v15);

    }
    -[SUCoreUpdate updateFSM](self, "updateFSM");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "diag");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("[UPDATE] %@"), v11);
    objc_msgSend(v17, "trackError:forReason:withResult:withError:", v18, v12, objc_msgSend(v9, "code"), v9);

  }
  else
  {
    v19 = (objc_class *)MEMORY[0x1E0CB3940];
    v20 = (__CFString *)a4;
    v21 = [v19 alloc];
    v22 = CFSTR("no reason provided");
    if (v20)
      v22 = v20;
    v11 = (__CFString *)objc_msgSend(v21, "initWithFormat:", CFSTR("tracking update error when no error provided (%@)"), v22);

    -[SUCoreUpdate _trackUpdateAnomaly:result:description:](self, "_trackUpdateAnomaly:result:description:", v8, 8101, v11);
  }

}

- (void)_cleanupAfterAttempt
{
  -[SUCoreUpdate setTargetPhase:](self, "setTargetPhase:", 1);
  -[SUCoreUpdate setPolicy:](self, "setPolicy:", 0);
}

- (SUCoreDescriptor)updateDescriptor
{
  return self->_updateDescriptor;
}

- (SUCoreRollbackDescriptor)rollbackDescriptor
{
  return self->_rollbackDescriptor;
}

- (id)updateDelegate
{
  return objc_loadWeakRetained(&self->_updateDelegate);
}

- (OS_dispatch_queue)clientDelegateCallbackQueue
{
  return self->_clientDelegateCallbackQueue;
}

- (NSString)updateUUID
{
  return self->_updateUUID;
}

- (NSString)updateName
{
  return self->_updateName;
}

- (NSDictionary)stateTable
{
  return self->_stateTable;
}

- (SUCoreFSM)updateFSM
{
  return self->_updateFSM;
}

- (int64_t)targetPhase
{
  return self->_targetPhase;
}

- (void)setTargetPhase:(int64_t)a3
{
  self->_targetPhase = a3;
}

- (SUCorePolicy)policy
{
  return self->_policy;
}

- (void)setPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_policy, a3);
}

- (SUCoreUpdateDownloader)downloadControl
{
  return self->_downloadControl;
}

- (void)setDownloadControl:(id)a3
{
  objc_storeStrong((id *)&self->_downloadControl, a3);
}

- (SUCoreMSU)msuControl
{
  return self->_msuControl;
}

- (OS_os_transaction)updateTransaction
{
  return self->_updateTransaction;
}

- (void)setUpdateTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_updateTransaction, a3);
}

- (NSError)failedAttemptError
{
  return self->_failedAttemptError;
}

- (void)setFailedAttemptError:(id)a3
{
  objc_storeStrong((id *)&self->_failedAttemptError, a3);
}

- (SUCoreRollback)rollbackControl
{
  return self->_rollbackControl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rollbackControl, 0);
  objc_storeStrong((id *)&self->_failedAttemptError, 0);
  objc_storeStrong((id *)&self->_updateTransaction, 0);
  objc_storeStrong((id *)&self->_msuControl, 0);
  objc_storeStrong((id *)&self->_downloadControl, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_updateFSM, 0);
  objc_storeStrong((id *)&self->_stateTable, 0);
  objc_storeStrong((id *)&self->_updateName, 0);
  objc_storeStrong((id *)&self->_updateUUID, 0);
  objc_storeStrong((id *)&self->_clientDelegateCallbackQueue, 0);
  objc_destroyWeak(&self->_updateDelegate);
  objc_storeStrong((id *)&self->_rollbackDescriptor, 0);
  objc_storeStrong((id *)&self->_updateDescriptor, 0);
}

- (void)_trackUpdateError:(void *)a1 forReason:(uint64_t)a2 error:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "failedAttemptError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543874;
  v8 = a1;
  v9 = 2114;
  v10 = a2;
  v11 = 2114;
  v12 = v6;
  _os_log_error_impl(&dword_1DDFDD000, a3, OS_LOG_TYPE_ERROR, "%{public}@ first error for update attempt {%{public}@} error: %{public}@", (uint8_t *)&v7, 0x20u);

}

@end
