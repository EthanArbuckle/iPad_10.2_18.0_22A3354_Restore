@implementation PLPlatform

+ (BOOL)internalBuild
{
  if (internalBuild_onceToken != -1)
    dispatch_once(&internalBuild_onceToken, &__block_literal_global_398);
  return internalBuild_result != 0;
}

+ (BOOL)hasAOD
{
  if (hasAOD_onceToken != -1)
    dispatch_once(&hasAOD_onceToken, &__block_literal_global_377);
  return hasAOD_result;
}

+ (BOOL)isiPod
{
  if (isiPod_onceToken != -1)
    dispatch_once(&isiPod_onceToken, &__block_literal_global_391);
  return isiPod_isiPod;
}

+ (int)kPLAudioClassOfDevice
{
  void *v2;
  void *v3;
  int v4;

  objc_msgSend(a1, "kPLPlatformAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

+ (BOOL)isWiFiClass:(int)a3
{
  return objc_msgSend(a1, "kPLWiFiClassOfDevice") == a3;
}

+ (int)kPLWiFiClassOfDevice
{
  void *v2;
  void *v3;
  int v4;

  objc_msgSend(a1, "kPLPlatformAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

+ (BOOL)hasCapability:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  int v7;
  _QWORD block[4];
  int v9;
  uint64_t v10;
  uint64_t v11;

  if (a3 == 9)
    return 0;
  v10 = v3;
  v11 = v4;
  v7 = +[PLPlatform kPLDeviceClass](PLPlatform, "kPLDeviceClass");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__PLPlatform_hasCapability___block_invoke;
  block[3] = &__block_descriptor_36_e5_v8__0l;
  v9 = v7;
  if (hasCapability__onceToken != -1)
    dispatch_once(&hasCapability__onceToken, block);
  return hasCapability__capabilitiesBeenSet == 1 && hasCapability__blockWrapper[a3] != 0;
}

+ (int)kPLBasebandClassOfDevice
{
  void *v2;
  void *v3;
  int v4;

  objc_msgSend(a1, "kPLPlatformAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

+ (int)kPLDeviceClass
{
  void *v2;
  void *v3;
  int v4;

  objc_msgSend(a1, "kPLPlatformAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

+ (id)kPLPlatformAttributes
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__PLPlatform_kPLPlatformAttributes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (kPLPlatformAttributes_onceToken != -1)
    dispatch_once(&kPLPlatformAttributes_onceToken, block);
  return (id)kPLPlatformAttributes_deviceInfo;
}

+ (BOOL)isHomePod
{
  return 0;
}

+ (BOOL)isiPhone
{
  if (isiPhone_onceToken != -1)
    dispatch_once(&isiPhone_onceToken, &__block_literal_global_394);
  return isiPhone_isiPhone;
}

+ (BOOL)isBasebandDSDS
{
  if (isBasebandDSDS_onceToken != -1)
    dispatch_once(&isBasebandDSDS_onceToken, &__block_literal_global_409);
  return isBasebandDSDS_result;
}

+ (BOOL)hasBaseband
{
  return +[PLPlatform kPLBasebandClassOfDevice](PLPlatform, "kPLBasebandClassOfDevice") != -1;
}

+ (id)kPLDeviceMap
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
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
  void *v535;
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
  void *v581;
  void *v582;
  void *v583;
  void *v584;
  void *v585;
  void *v586;
  void *v587;
  void *v588;
  void *v589;
  void *v590;
  void *v591;
  void *v592;
  void *v593;
  void *v594;
  void *v595;
  void *v596;
  void *v597;
  void *v598;
  void *v599;
  void *v600;
  void *v601;
  void *v602;
  void *v603;
  void *v604;
  void *v605;
  void *v606;
  void *v607;
  void *v608;
  void *v609;
  void *v610;
  void *v611;
  void *v612;
  void *v613;
  void *v614;
  void *v615;
  void *v616;
  void *v617;
  void *v618;
  void *v619;
  void *v620;
  void *v621;
  void *v622;
  void *v623;
  void *v624;
  void *v625;
  void *v626;
  void *v627;
  void *v628;
  void *v629;
  void *v630;
  void *v631;
  void *v632;
  void *v633;
  void *v634;
  void *v635;
  void *v636;
  void *v637;
  void *v638;
  void *v639;
  id v640;
  void *v641;
  void *v642;
  _QWORD v643[2];
  __int128 v644;
  int v645;
  _QWORD v646[2];
  __int128 v647;
  int v648;
  _QWORD v649[2];
  __int128 v650;
  int v651;
  _QWORD v652[2];
  __int128 v653;
  int v654;
  _QWORD v655[2];
  __int128 v656;
  int v657;
  _QWORD v658[2];
  __int128 v659;
  int v660;
  _QWORD v661[2];
  __int128 v662;
  int v663;
  _QWORD v664[2];
  __int128 v665;
  int v666;
  _QWORD v667[2];
  __int128 v668;
  int v669;
  _QWORD v670[2];
  __int128 v671;
  int v672;
  _QWORD v673[2];
  __int128 v674;
  int v675;
  _QWORD v676[2];
  __int128 v677;
  int v678;
  _QWORD v679[2];
  __int128 v680;
  int v681;
  _QWORD v682[2];
  __int128 v683;
  int v684;
  _QWORD v685[2];
  __int128 v686;
  int v687;
  _QWORD v688[2];
  __int128 v689;
  int v690;
  _QWORD v691[2];
  __int128 v692;
  int v693;
  _QWORD v694[2];
  __int128 v695;
  int v696;
  _QWORD v697[2];
  __int128 v698;
  int v699;
  _QWORD v700[2];
  __int128 v701;
  int v702;
  _QWORD v703[2];
  __int128 v704;
  int v705;
  _QWORD v706[2];
  __int128 v707;
  int v708;
  _QWORD v709[2];
  __int128 v710;
  int v711;
  _QWORD v712[2];
  __int128 v713;
  int v714;
  _QWORD v715[2];
  __int128 v716;
  int v717;
  _QWORD v718[2];
  __int128 v719;
  int v720;
  _QWORD v721[2];
  __int128 v722;
  int v723;
  _QWORD v724[2];
  __int128 v725;
  int v726;
  _QWORD v727[2];
  __int128 v728;
  int v729;
  _QWORD v730[2];
  __int128 v731;
  int v732;
  _QWORD v733[2];
  __int128 v734;
  int v735;
  _QWORD v736[2];
  __int128 v737;
  int v738;
  _QWORD v739[2];
  __int128 v740;
  int v741;
  _QWORD v742[2];
  __int128 v743;
  int v744;
  _QWORD v745[2];
  __int128 v746;
  int v747;
  _QWORD v748[2];
  __int128 v749;
  int v750;
  _QWORD v751[2];
  __int128 v752;
  int v753;
  _QWORD v754[2];
  __int128 v755;
  int v756;
  _QWORD v757[2];
  __int128 v758;
  int v759;
  _QWORD v760[2];
  __int128 v761;
  int v762;
  _QWORD v763[2];
  __int128 v764;
  int v765;
  _QWORD v766[2];
  __int128 v767;
  int v768;
  _QWORD v769[2];
  __int128 v770;
  int v771;
  _QWORD v772[2];
  __int128 v773;
  int v774;
  _QWORD v775[2];
  __int128 v776;
  int v777;
  _QWORD v778[2];
  __int128 v779;
  int v780;
  _QWORD v781[2];
  __int128 v782;
  int v783;
  _QWORD v784[2];
  __int128 v785;
  int v786;
  _QWORD v787[2];
  __int128 v788;
  int v789;
  _QWORD v790[2];
  __int128 v791;
  int v792;
  _QWORD v793[2];
  __int128 v794;
  int v795;
  _QWORD v796[2];
  __int128 v797;
  int v798;
  _QWORD v799[2];
  __int128 v800;
  int v801;
  _QWORD v802[2];
  __int128 v803;
  int v804;
  _QWORD v805[2];
  __int128 v806;
  int v807;
  _QWORD v808[2];
  __int128 v809;
  int v810;
  _QWORD v811[2];
  __int128 v812;
  int v813;
  _QWORD v814[2];
  __int128 v815;
  int v816;
  _QWORD v817[2];
  __int128 v818;
  int v819;
  _QWORD v820[2];
  __int128 v821;
  int v822;
  _QWORD v823[2];
  __int128 v824;
  int v825;
  _QWORD v826[2];
  __int128 v827;
  int v828;
  _QWORD v829[2];
  __int128 v830;
  int v831;
  _QWORD v832[2];
  __int128 v833;
  int v834;
  _QWORD v835[2];
  __int128 v836;
  int v837;
  _QWORD v838[2];
  __int128 v839;
  int v840;
  _QWORD v841[2];
  __int128 v842;
  int v843;
  _QWORD v844[2];
  __int128 v845;
  int v846;
  _QWORD v847[2];
  __int128 v848;
  int v849;
  _QWORD v850[2];
  __int128 v851;
  int v852;
  _QWORD v853[2];
  __int128 v854;
  int v855;
  _QWORD v856[2];
  __int128 v857;
  int v858;
  _QWORD v859[2];
  __int128 v860;
  int v861;
  _QWORD v862[2];
  __int128 v863;
  int v864;
  _QWORD v865[2];
  __int128 v866;
  int v867;
  _QWORD v868[2];
  __int128 v869;
  int v870;
  _QWORD v871[2];
  __int128 v872;
  int v873;
  _QWORD v874[2];
  __int128 v875;
  int v876;
  _QWORD v877[2];
  __int128 v878;
  int v879;
  _QWORD v880[2];
  __int128 v881;
  int v882;
  _QWORD v883[2];
  __int128 v884;
  int v885;
  _QWORD v886[2];
  __int128 v887;
  int v888;
  _QWORD v889[2];
  __int128 v890;
  int v891;
  _QWORD v892[2];
  __int128 v893;
  int v894;
  _QWORD v895[2];
  __int128 v896;
  int v897;
  _QWORD v898[2];
  __int128 v899;
  int v900;
  _QWORD v901[2];
  __int128 v902;
  int v903;
  _QWORD v904[2];
  __int128 v905;
  int v906;
  _QWORD v907[2];
  __int128 v908;
  int v909;
  _QWORD v910[2];
  __int128 v911;
  int v912;
  _QWORD v913[2];
  __int128 v914;
  int v915;
  _QWORD v916[2];
  __int128 v917;
  int v918;
  _QWORD v919[2];
  __int128 v920;
  int v921;
  _QWORD v922[2];
  __int128 v923;
  int v924;
  _QWORD v925[2];
  __int128 v926;
  int v927;
  _QWORD v928[2];
  __int128 v929;
  int v930;
  _QWORD v931[2];
  __int128 v932;
  int v933;
  _QWORD v934[2];
  __int128 v935;
  int v936;
  _QWORD v937[2];
  __int128 v938;
  int v939;
  _QWORD v940[2];
  __int128 v941;
  int v942;
  _QWORD v943[2];
  __int128 v944;
  int v945;
  _QWORD v946[2];
  __int128 v947;
  int v948;
  _QWORD v949[2];
  __int128 v950;
  int v951;
  _QWORD v952[2];
  __int128 v953;
  int v954;
  _QWORD v955[2];
  __int128 v956;
  int v957;
  _QWORD v958[2];
  __int128 v959;
  int v960;
  _QWORD v961[2];
  __int128 v962;
  int v963;
  _QWORD v964[2];
  __int128 v965;
  int v966;
  _QWORD v967[2];
  __int128 v968;
  int v969;
  _QWORD v970[2];
  __int128 v971;
  int v972;
  _QWORD v973[2];
  __int128 v974;
  int v975;
  _QWORD v976[2];
  __int128 v977;
  int v978;
  _QWORD v979[2];
  __int128 v980;
  int v981;
  _QWORD v982[2];
  __int128 v983;
  int v984;
  _QWORD v985[2];
  __int128 v986;
  int v987;
  _QWORD v988[2];
  __int128 v989;
  int v990;
  _QWORD v991[2];
  __int128 v992;
  int v993;
  _QWORD v994[2];
  __int128 v995;
  int v996;
  _QWORD v997[2];
  __int128 v998;
  int v999;
  _QWORD v1000[2];
  __int128 v1001;
  int v1002;
  _QWORD v1003[2];
  __int128 v1004;
  int v1005;
  _QWORD v1006[2];
  __int128 v1007;
  int v1008;
  _QWORD v1009[2];
  __int128 v1010;
  int v1011;
  _QWORD v1012[2];
  __int128 v1013;
  int v1014;
  _QWORD v1015[2];
  __int128 v1016;
  int v1017;
  _QWORD v1018[2];
  __int128 v1019;
  int v1020;
  _QWORD v1021[2];
  _QWORD v1022[130];

  v1022[128] = *MEMORY[0x1E0C80C00];
  v1020 = 1602014129;
  v1019 = xmmword_1B6B882C3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v622 = (void *)objc_claimAutoreleasedReturnValue();
  v1021[0] = v622;
  v1021[1] = CFSTR("J71");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1021, 2);
  v621 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100004, 1001003, 1002002, 0xFFFFFFFFLL, 1004003, 1005010, 1006006, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0);
  v620 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v621, "arrayByAddingObjectsFromArray:", v620);
  v619 = (void *)objc_claimAutoreleasedReturnValue();
  v618 = (void *)objc_msgSend(v619, "copy");
  v1022[0] = v618;
  v1017 = -810116762;
  v1016 = xmmword_1B6B882D7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v617 = (void *)objc_claimAutoreleasedReturnValue();
  v1018[0] = v617;
  v1018[1] = CFSTR("J72");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1018, 2);
  v616 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100005, 1001003, 1002002, 1003002, 1004003, 1005010, 1006006, 0xFFFFFFFFLL, 1008001, 0);
  v615 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v616, "arrayByAddingObjectsFromArray:", v615);
  v614 = (void *)objc_claimAutoreleasedReturnValue();
  v613 = (void *)objc_msgSend(v614, "copy");
  v1022[1] = v613;
  v1014 = -1195351767;
  v1013 = xmmword_1B6B882EB;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v612 = (void *)objc_claimAutoreleasedReturnValue();
  v1015[0] = v612;
  v1015[1] = CFSTR("J73");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1015, 2);
  v611 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100006, 1001003, 1002002, 1003002, 1004003, 1005010, 1006006, 0xFFFFFFFFLL, 1008001, 0);
  v610 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v611, "arrayByAddingObjectsFromArray:", v610);
  v609 = (void *)objc_claimAutoreleasedReturnValue();
  v608 = (void *)objc_msgSend(v609, "copy");
  v1022[2] = v608;
  v1011 = -1639077591;
  v1010 = xmmword_1B6B882FF;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v607 = (void *)objc_claimAutoreleasedReturnValue();
  v1012[0] = v607;
  v1012[1] = CFSTR("J81");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1012, 2);
  v606 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100007, 1001005, 1002003, 0xFFFFFFFFLL, 1004005, 1005002, 1006006, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0);
  v605 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v606, "arrayByAddingObjectsFromArray:", v605);
  v604 = (void *)objc_claimAutoreleasedReturnValue();
  v603 = (void *)objc_msgSend(v604, "copy");
  v1022[3] = v603;
  v1008 = 338555555;
  v1007 = xmmword_1B6B88313;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v602 = (void *)objc_claimAutoreleasedReturnValue();
  v1009[0] = v602;
  v1009[1] = CFSTR("J82");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1009, 2);
  v601 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100008, 1001005, 1002003, 1003003, 1004005, 1005002, 1006006, 0xFFFFFFFFLL, 1008001, 0);
  v600 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v601, "arrayByAddingObjectsFromArray:", v600);
  v599 = (void *)objc_claimAutoreleasedReturnValue();
  v598 = (void *)objc_msgSend(v599, "copy");
  v1022[4] = v598;
  v1005 = 1789837692;
  v1004 = xmmword_1B6B88327;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v597 = (void *)objc_claimAutoreleasedReturnValue();
  v1006[0] = v597;
  v1006[1] = CFSTR("J85");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1006, 2);
  v596 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100010, 1001003, 1002004, 0xFFFFFFFFLL, 1004003, 1005003, 1006006, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0);
  v595 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v596, "arrayByAddingObjectsFromArray:", v595);
  v594 = (void *)objc_claimAutoreleasedReturnValue();
  v593 = (void *)objc_msgSend(v594, "copy");
  v1022[5] = v593;
  v1002 = -1239654590;
  v1001 = xmmword_1B6B8833B;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v592 = (void *)objc_claimAutoreleasedReturnValue();
  v1003[0] = v592;
  v1003[1] = CFSTR("J86");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1003, 2);
  v591 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100011, 1001003, 1002004, 1003002, 1004003, 1005003, 1006006, 0xFFFFFFFFLL, 1008001, 0);
  v590 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v591, "arrayByAddingObjectsFromArray:", v590);
  v589 = (void *)objc_claimAutoreleasedReturnValue();
  v588 = (void *)objc_msgSend(v589, "copy");
  v1022[6] = v588;
  v999 = -1579092758;
  v998 = xmmword_1B6B8834F;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v587 = (void *)objc_claimAutoreleasedReturnValue();
  v1000[0] = v587;
  v1000[1] = CFSTR("J87");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1000, 2);
  v586 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100012, 1001003, 1002004, 1003002, 1004003, 1005003, 1006006, 0xFFFFFFFFLL, 1008001, 0);
  v585 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v586, "arrayByAddingObjectsFromArray:", v585);
  v584 = (void *)objc_claimAutoreleasedReturnValue();
  v583 = (void *)objc_msgSend(v584, "copy");
  v1022[7] = v583;
  v996 = 48355600;
  v995 = xmmword_1B6B88363;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v582 = (void *)objc_claimAutoreleasedReturnValue();
  v997[0] = v582;
  v997[1] = CFSTR("J85M");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v997, 2);
  v581 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100013, 1001003, 1002004, 0xFFFFFFFFLL, 1004003, 1005003, 1006006, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0);
  v580 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v581, "arrayByAddingObjectsFromArray:", v580);
  v579 = (void *)objc_claimAutoreleasedReturnValue();
  v578 = (void *)objc_msgSend(v579, "copy");
  v1022[8] = v578;
  v993 = -679691073;
  v992 = xmmword_1B6B88377;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v577 = (void *)objc_claimAutoreleasedReturnValue();
  v994[0] = v577;
  v994[1] = CFSTR("J86M");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v994, 2);
  v576 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100014, 1001003, 1002004, 1003002, 1004003, 1005003, 1006006, 0xFFFFFFFFLL, 1008001, 0);
  v575 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v576, "arrayByAddingObjectsFromArray:", v575);
  v574 = (void *)objc_claimAutoreleasedReturnValue();
  v573 = (void *)objc_msgSend(v574, "copy");
  v1022[9] = v573;
  v990 = 1430379884;
  v989 = xmmword_1B6B8838B;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v572 = (void *)objc_claimAutoreleasedReturnValue();
  v991[0] = v572;
  v991[1] = CFSTR("J87M");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v991, 2);
  v571 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100015, 1001003, 1002004, 1003002, 1004003, 1005003, 1006006, 0xFFFFFFFFLL, 1008001, 0);
  v570 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v571, "arrayByAddingObjectsFromArray:", v570);
  v569 = (void *)objc_claimAutoreleasedReturnValue();
  v568 = (void *)objc_msgSend(v569, "copy");
  v1022[10] = v568;
  v987 = 1032708406;
  v986 = xmmword_1B6B8839F;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v567 = (void *)objc_claimAutoreleasedReturnValue();
  v988[0] = v567;
  v988[1] = CFSTR("J96");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v988, 2);
  v566 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100016, 1001004, 1002004, 0xFFFFFFFFLL, 1004005, 1005003, 1006006, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0);
  v565 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v566, "arrayByAddingObjectsFromArray:", v565);
  v564 = (void *)objc_claimAutoreleasedReturnValue();
  v563 = (void *)objc_msgSend(v564, "copy");
  v1022[11] = v563;
  v984 = 729903963;
  v983 = xmmword_1B6B883B3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v562 = (void *)objc_claimAutoreleasedReturnValue();
  v985[0] = v562;
  v985[1] = CFSTR("J97");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v985, 2);
  v561 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100017, 1001004, 1002004, 1003003, 1004005, 1005003, 1006006, 0xFFFFFFFFLL, 1008001, 0);
  v560 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v561, "arrayByAddingObjectsFromArray:", v560);
  v559 = (void *)objc_claimAutoreleasedReturnValue();
  v558 = (void *)objc_msgSend(v559, "copy");
  v1022[12] = v558;
  v981 = 1275676051;
  v980 = xmmword_1B6B883C7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v557 = (void *)objc_claimAutoreleasedReturnValue();
  v982[0] = v557;
  v982[1] = CFSTR("J98A");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v982, 2);
  v556 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100018, 1001007, 1002005, 0xFFFFFFFFLL, 1004005, 1005005, 1006006, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0);
  v555 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v556, "arrayByAddingObjectsFromArray:", v555);
  v554 = (void *)objc_claimAutoreleasedReturnValue();
  v553 = (void *)objc_msgSend(v554, "copy");
  v1022[13] = v553;
  v978 = 1908474541;
  v977 = xmmword_1B6B883DB;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v552 = (void *)objc_claimAutoreleasedReturnValue();
  v979[0] = v552;
  v979[1] = CFSTR("J99A");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v979, 2);
  v551 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100019, 1001007, 1002005, 1003003, 1004005, 1005005, 1006006, 0xFFFFFFFFLL, 1008001, 0);
  v550 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v551, "arrayByAddingObjectsFromArray:", v550);
  v549 = (void *)objc_claimAutoreleasedReturnValue();
  v548 = (void *)objc_msgSend(v549, "copy");
  v1022[14] = v548;
  v975 = -1527788847;
  v974 = xmmword_1B6B883EF;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v547 = (void *)objc_claimAutoreleasedReturnValue();
  v976[0] = v547;
  v976[1] = CFSTR("J127");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v976, 2);
  v546 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100020, 1001007, 1002006, 0xFFFFFFFFLL, 1004007, 1005004, 1006006, 1007004, 0xFFFFFFFFLL, 0);
  v545 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v546, "arrayByAddingObjectsFromArray:", v545);
  v544 = (void *)objc_claimAutoreleasedReturnValue();
  v543 = (void *)objc_msgSend(v544, "copy");
  v1022[15] = v543;
  v972 = 1532898719;
  v971 = xmmword_1B6B88403;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v542 = (void *)objc_claimAutoreleasedReturnValue();
  v973[0] = v542;
  v973[1] = CFSTR("J128");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v973, 2);
  v541 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100021, 1001007, 1002006, 1003004, 1004007, 1005004, 1006006, 1007004, 1008001, 0);
  v540 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v541, "arrayByAddingObjectsFromArray:", v540);
  v539 = (void *)objc_claimAutoreleasedReturnValue();
  v538 = (void *)objc_msgSend(v539, "copy");
  v1022[16] = v538;
  v969 = -199226823;
  v968 = xmmword_1B6B88417;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v537 = (void *)objc_claimAutoreleasedReturnValue();
  v970[0] = v537;
  v970[1] = CFSTR("J71N");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v970, 2);
  v536 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100022, 1001006, 1002002, 0xFFFFFFFFLL, 1004007, 1005006, 1006006, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0);
  v535 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v536, "arrayByAddingObjectsFromArray:", v535);
  v534 = (void *)objc_claimAutoreleasedReturnValue();
  v533 = (void *)objc_msgSend(v534, "copy");
  v1022[17] = v533;
  v966 = -1283070668;
  v965 = xmmword_1B6B8842B;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v532 = (void *)objc_claimAutoreleasedReturnValue();
  v967[0] = v532;
  v967[1] = CFSTR("J72N");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v967, 2);
  v531 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100023, 1001006, 1002002, 1003003, 1004007, 1005006, 1006006, 0xFFFFFFFFLL, 1008001, 0);
  v530 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v531, "arrayByAddingObjectsFromArray:", v530);
  v529 = (void *)objc_claimAutoreleasedReturnValue();
  v528 = (void *)objc_msgSend(v529, "copy");
  v1022[18] = v528;
  v963 = 1412427398;
  v962 = xmmword_1B6B8843F;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v527 = (void *)objc_claimAutoreleasedReturnValue();
  v964[0] = v527;
  v964[1] = CFSTR("J71N");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v964, 2);
  v526 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100024, 1001006, 1002002, 0xFFFFFFFFLL, 1004007, 1005006, 1006006, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0);
  v525 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v526, "arrayByAddingObjectsFromArray:", v525);
  v524 = (void *)objc_claimAutoreleasedReturnValue();
  v523 = (void *)objc_msgSend(v524, "copy");
  v1022[19] = v523;
  v960 = 160260070;
  v959 = xmmword_1B6B88453;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v522 = (void *)objc_claimAutoreleasedReturnValue();
  v961[0] = v522;
  v961[1] = CFSTR("J72N");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v961, 2);
  v521 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100025, 1001006, 1002002, 1003003, 1004007, 1005006, 1006006, 0xFFFFFFFFLL, 1008001, 0);
  v520 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v521, "arrayByAddingObjectsFromArray:", v520);
  v519 = (void *)objc_claimAutoreleasedReturnValue();
  v518 = (void *)objc_msgSend(v519, "copy");
  v1022[20] = v518;
  v957 = -1022451852;
  v956 = xmmword_1B6B88467;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v517 = (void *)objc_claimAutoreleasedReturnValue();
  v958[0] = v517;
  v958[1] = CFSTR("J98N");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v958, 2);
  v516 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100026, 1001009, 1002017, 0xFFFFFFFFLL, 1004007, 1005007, 1006006, 1007004, 0xFFFFFFFFLL, 0);
  v515 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v516, "arrayByAddingObjectsFromArray:", v515);
  v514 = (void *)objc_claimAutoreleasedReturnValue();
  v513 = (void *)objc_msgSend(v514, "copy");
  v1022[21] = v513;
  v954 = 1729782187;
  v953 = xmmword_1B6B8847B;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v512 = (void *)objc_claimAutoreleasedReturnValue();
  v955[0] = v512;
  v955[1] = CFSTR("J99N");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v955, 2);
  v511 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100027, 1001009, 1002017, 1003005, 1004007, 1005007, 1006006, 1007004, 1008001, 0);
  v510 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v511, "arrayByAddingObjectsFromArray:", v510);
  v509 = (void *)objc_claimAutoreleasedReturnValue();
  v508 = (void *)objc_msgSend(v509, "copy");
  v1022[22] = v508;
  v951 = 996646949;
  v950 = xmmword_1B6B8848F;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v507 = (void *)objc_claimAutoreleasedReturnValue();
  v952[0] = v507;
  v952[1] = CFSTR("J127N");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v952, 2);
  v506 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100028, 1001009, 1002018, 0xFFFFFFFFLL, 1004007, 1005008, 1006006, 1007004, 0xFFFFFFFFLL, 0);
  v505 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v506, "arrayByAddingObjectsFromArray:", v505);
  v504 = (void *)objc_claimAutoreleasedReturnValue();
  v503 = (void *)objc_msgSend(v504, "copy");
  v1022[23] = v503;
  v948 = -563086000;
  v947 = xmmword_1B6B884A3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v502 = (void *)objc_claimAutoreleasedReturnValue();
  v949[0] = v502;
  v949[1] = CFSTR("J128N");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v949, 2);
  v501 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100029, 1001009, 1002018, 1003005, 1004007, 1005008, 1006006, 1007004, 1008001, 0);
  v500 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v501, "arrayByAddingObjectsFromArray:", v500);
  v499 = (void *)objc_claimAutoreleasedReturnValue();
  v498 = (void *)objc_msgSend(v499, "copy");
  v1022[24] = v498;
  v945 = 317289457;
  v944 = xmmword_1B6B884B7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v497 = (void *)objc_claimAutoreleasedReturnValue();
  v946[0] = v497;
  v946[1] = CFSTR("J71NM");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v946, 2);
  v496 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100030, 1001008, 1002002, 0xFFFFFFFFLL, 1004007, 1005006, 1006006, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0);
  v495 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v496, "arrayByAddingObjectsFromArray:", v495);
  v494 = (void *)objc_claimAutoreleasedReturnValue();
  v493 = (void *)objc_msgSend(v494, "copy");
  v1022[25] = v493;
  v942 = 401945557;
  v941 = xmmword_1B6B884CB;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v492 = (void *)objc_claimAutoreleasedReturnValue();
  v943[0] = v492;
  v943[1] = CFSTR("J72NM");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v943, 2);
  v491 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100031, 1001008, 1002002, 1003004, 1004007, 1005006, 1006006, 0xFFFFFFFFLL, 1008001, 0);
  v490 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v491, "arrayByAddingObjectsFromArray:", v490);
  v489 = (void *)objc_claimAutoreleasedReturnValue();
  v488 = (void *)objc_msgSend(v489, "copy");
  v1022[26] = v488;
  v939 = 2030516999;
  v938 = xmmword_1B6B884DF;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v487 = (void *)objc_claimAutoreleasedReturnValue();
  v940[0] = v487;
  v940[1] = CFSTR("J120N");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v940, 2);
  v486 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100032, 1001012, 1002027, 0xFFFFFFFFLL, 1004013, 1005006, 1006007, 0xFFFFFFFFLL, 1008002, 0);
  v485 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v486, "arrayByAddingObjectsFromArray:", v485);
  v484 = (void *)objc_claimAutoreleasedReturnValue();
  v483 = (void *)objc_msgSend(v484, "copy");
  v1022[27] = v483;
  v936 = -1276010597;
  v935 = xmmword_1B6B884F3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v482 = (void *)objc_claimAutoreleasedReturnValue();
  v937[0] = v482;
  v937[1] = CFSTR("J120N");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v937, 2);
  v481 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100033, 1001012, 1002027, 0xFFFFFFFFLL, 1004013, 1005006, 1006007, 0xFFFFFFFFLL, 1008002, 0);
  v480 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v481, "arrayByAddingObjectsFromArray:", v480);
  v479 = (void *)objc_claimAutoreleasedReturnValue();
  v478 = (void *)objc_msgSend(v479, "copy");
  v1022[28] = v478;
  v933 = -762483149;
  v932 = xmmword_1B6B88507;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v477 = (void *)objc_claimAutoreleasedReturnValue();
  v934[0] = v477;
  v934[1] = CFSTR("J121N");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v934, 2);
  v476 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100034, 1001012, 1002027, 1003010, 1004013, 1005006, 1006007, 0xFFFFFFFFLL, 1008002, 0);
  v475 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v476, "arrayByAddingObjectsFromArray:", v475);
  v474 = (void *)objc_claimAutoreleasedReturnValue();
  v473 = (void *)objc_msgSend(v474, "copy");
  v1022[29] = v473;
  v930 = -1926937532;
  v929 = xmmword_1B6B8851B;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v472 = (void *)objc_claimAutoreleasedReturnValue();
  v931[0] = v472;
  v931[1] = CFSTR("J121N");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v931, 2);
  v471 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100035, 1001012, 1002027, 1003010, 1004013, 1005006, 1006007, 0xFFFFFFFFLL, 1008002, 0);
  v470 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v471, "arrayByAddingObjectsFromArray:", v470);
  v469 = (void *)objc_claimAutoreleasedReturnValue();
  v468 = (void *)objc_msgSend(v469, "copy");
  v1022[30] = v468;
  v927 = -1902732724;
  v926 = xmmword_1B6B8852F;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v467 = (void *)objc_claimAutoreleasedReturnValue();
  v928[0] = v467;
  v928[1] = CFSTR("J120NM");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v928, 2);
  v466 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100036, 1001012, 1002028, 0xFFFFFFFFLL, 1004013, 1005024, 1006007, 0xFFFFFFFFLL, 1008002, 0);
  v465 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v466, "arrayByAddingObjectsFromArray:", v465);
  v464 = (void *)objc_claimAutoreleasedReturnValue();
  v463 = (void *)objc_msgSend(v464, "copy");
  v1022[31] = v463;
  v924 = -342357580;
  v923 = xmmword_1B6B88543;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v462 = (void *)objc_claimAutoreleasedReturnValue();
  v925[0] = v462;
  v925[1] = CFSTR("J120NM");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v925, 2);
  v461 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100037, 1001012, 1002028, 0xFFFFFFFFLL, 1004013, 1005024, 1006007, 0xFFFFFFFFLL, 1008002, 0);
  v460 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v461, "arrayByAddingObjectsFromArray:", v460);
  v459 = (void *)objc_claimAutoreleasedReturnValue();
  v458 = (void *)objc_msgSend(v459, "copy");
  v1022[32] = v458;
  v921 = 300442574;
  v920 = xmmword_1B6B88557;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v457 = (void *)objc_claimAutoreleasedReturnValue();
  v922[0] = v457;
  v922[1] = CFSTR("J121NM");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v922, 2);
  v456 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100038, 1001012, 1002028, 1003010, 1004013, 1005024, 1006007, 0xFFFFFFFFLL, 1008002, 0);
  v455 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v456, "arrayByAddingObjectsFromArray:", v455);
  v454 = (void *)objc_claimAutoreleasedReturnValue();
  v453 = (void *)objc_msgSend(v454, "copy");
  v1022[33] = v453;
  v918 = -1294188889;
  v917 = xmmword_1B6B8856B;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v452 = (void *)objc_claimAutoreleasedReturnValue();
  v919[0] = v452;
  v919[1] = CFSTR("J121NM");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v919, 2);
  v451 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100039, 1001012, 1002028, 1003010, 1004013, 1005024, 1006007, 0xFFFFFFFFLL, 1008002, 0);
  v450 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v451, "arrayByAddingObjectsFromArray:", v450);
  v449 = (void *)objc_claimAutoreleasedReturnValue();
  v448 = (void *)objc_msgSend(v449, "copy");
  v1022[34] = v448;
  v915 = 1278131292;
  v914 = xmmword_1B6B8857F;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v447 = (void *)objc_claimAutoreleasedReturnValue();
  v916[0] = v447;
  v916[1] = CFSTR("J96NM");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v916, 2);
  v446 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100040, 1001011, 1002004, 0xFFFFFFFFLL, 1004013, 1005003, 1006006, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0);
  v445 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v446, "arrayByAddingObjectsFromArray:", v445);
  v444 = (void *)objc_claimAutoreleasedReturnValue();
  v443 = (void *)objc_msgSend(v444, "copy");
  v1022[35] = v443;
  v912 = -1841712216;
  v911 = xmmword_1B6B88593;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v442 = (void *)objc_claimAutoreleasedReturnValue();
  v913[0] = v442;
  v913[1] = CFSTR("J97NM");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v913, 2);
  v441 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100041, 1001011, 1002004, 1003010, 1004013, 1005003, 1006006, 0xFFFFFFFFLL, 1008002, 0);
  v440 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v441, "arrayByAddingObjectsFromArray:", v440);
  v439 = (void *)objc_claimAutoreleasedReturnValue();
  v438 = (void *)objc_msgSend(v439, "copy");
  v1022[36] = v438;
  v909 = 659506830;
  v908 = xmmword_1B6B885A7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v437 = (void *)objc_claimAutoreleasedReturnValue();
  v910[0] = v437;
  v910[1] = CFSTR("J207N");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v910, 2);
  v436 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100042, 1001011, 1002018, 0xFFFFFFFFLL, 1004013, 1005024, 1006006, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0);
  v435 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v436, "arrayByAddingObjectsFromArray:", v435);
  v434 = (void *)objc_claimAutoreleasedReturnValue();
  v433 = (void *)objc_msgSend(v434, "copy");
  v1022[37] = v433;
  v906 = 213746202;
  v905 = xmmword_1B6B885BB;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v432 = (void *)objc_claimAutoreleasedReturnValue();
  v907[0] = v432;
  v907[1] = CFSTR("J208N");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v907, 2);
  v431 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100043, 1001011, 1002018, 1003010, 1004013, 1005024, 1006006, 0xFFFFFFFFLL, 1008002, 0);
  v430 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v431, "arrayByAddingObjectsFromArray:", v430);
  v429 = (void *)objc_claimAutoreleasedReturnValue();
  v428 = (void *)objc_msgSend(v429, "copy");
  v1022[38] = v428;
  v903 = -1157300313;
  v902 = xmmword_1B6B885CF;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v427 = (void *)objc_claimAutoreleasedReturnValue();
  v904[0] = v427;
  v904[1] = CFSTR("J71C");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v904, 2);
  v426 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100044, 1001008, 1002018, 0xFFFFFFFFLL, 1004007, 1005006, 1006006, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0);
  v425 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v426, "arrayByAddingObjectsFromArray:", v425);
  v424 = (void *)objc_claimAutoreleasedReturnValue();
  v423 = (void *)objc_msgSend(v424, "copy");
  v1022[39] = v423;
  v900 = -2132668294;
  v899 = xmmword_1B6B885E3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v422 = (void *)objc_claimAutoreleasedReturnValue();
  v901[0] = v422;
  v901[1] = CFSTR("J72C");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v901, 2);
  v421 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100045, 1001008, 1002018, 1003010, 1004007, 1005006, 1006006, 0xFFFFFFFFLL, 1008002, 0);
  v420 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v421, "arrayByAddingObjectsFromArray:", v420);
  v419 = (void *)objc_claimAutoreleasedReturnValue();
  v418 = (void *)objc_msgSend(v419, "copy");
  v1022[40] = v418;
  v897 = 1126727276;
  v896 = xmmword_1B6B885F7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v417 = (void *)objc_claimAutoreleasedReturnValue();
  v898[0] = v417;
  v898[1] = CFSTR("J317N");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v898, 2);
  v416 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100046, 1001012, 1002027, 0xFFFFFFFFLL, 1004014, 1005006, 1006009, 0xFFFFFFFFLL, 1008002, 0);
  v415 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v416, "arrayByAddingObjectsFromArray:", v415);
  v414 = (void *)objc_claimAutoreleasedReturnValue();
  v413 = (void *)objc_msgSend(v414, "copy");
  v1022[41] = v413;
  v894 = 300130091;
  v893 = xmmword_1B6B8860B;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v412 = (void *)objc_claimAutoreleasedReturnValue();
  v895[0] = v412;
  v895[1] = CFSTR("J318N");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v895, 2);
  v411 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100047, 1001012, 1002027, 1003011, 1004014, 1005006, 1006009, 0xFFFFFFFFLL, 1008002, 0);
  v410 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v411, "arrayByAddingObjectsFromArray:", v410);
  v409 = (void *)objc_claimAutoreleasedReturnValue();
  v408 = (void *)objc_msgSend(v409, "copy");
  v1022[42] = v408;
  v891 = 343814884;
  v890 = xmmword_1B6B8861F;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v407 = (void *)objc_claimAutoreleasedReturnValue();
  v892[0] = v407;
  v892[1] = CFSTR("J320N");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v892, 2);
  v406 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100048, 1001012, 1002028, 0xFFFFFFFFLL, 1004014, 1005006, 1006009, 0xFFFFFFFFLL, 1008002, 0);
  v405 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v406, "arrayByAddingObjectsFromArray:", v405);
  v404 = (void *)objc_claimAutoreleasedReturnValue();
  v403 = (void *)objc_msgSend(v404, "copy");
  v1022[43] = v403;
  v888 = -1675932945;
  v887 = xmmword_1B6B88633;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v402 = (void *)objc_claimAutoreleasedReturnValue();
  v889[0] = v402;
  v889[1] = CFSTR("J321N");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v889, 2);
  v401 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100049, 1001012, 1002028, 1003011, 1004014, 1005006, 1006009, 0xFFFFFFFFLL, 1008002, 0);
  v400 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v401, "arrayByAddingObjectsFromArray:", v400);
  v399 = (void *)objc_claimAutoreleasedReturnValue();
  v398 = (void *)objc_msgSend(v399, "copy");
  v1022[44] = v398;
  v885 = 372777383;
  v884 = xmmword_1B6B88647;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v397 = (void *)objc_claimAutoreleasedReturnValue();
  v886[0] = v397;
  v886[1] = CFSTR("J71D");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v886, 2);
  v396 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100050, 1001011, 1002018, 0xFFFFFFFFLL, 1004007, 1005006, 1006006, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0);
  v395 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v396, "arrayByAddingObjectsFromArray:", v395);
  v394 = (void *)objc_claimAutoreleasedReturnValue();
  v393 = (void *)objc_msgSend(v394, "copy");
  v1022[45] = v393;
  v882 = -858079590;
  v881 = xmmword_1B6B8865B;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v392 = (void *)objc_claimAutoreleasedReturnValue();
  v883[0] = v392;
  v883[1] = CFSTR("J72D");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v883, 2);
  v391 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100051, 1001011, 1002018, 1003010, 1004007, 1005006, 1006006, 0xFFFFFFFFLL, 1008002, 0);
  v390 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v391, "arrayByAddingObjectsFromArray:", v390);
  v389 = (void *)objc_claimAutoreleasedReturnValue();
  v388 = (void *)objc_msgSend(v389, "copy");
  v1022[46] = v388;
  v879 = 345196535;
  v878 = xmmword_1B6B8866F;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v387 = (void *)objc_claimAutoreleasedReturnValue();
  v880[0] = v387;
  v880[1] = CFSTR("J127NM");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v880, 2);
  v386 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100052, 1001014, 1002031, 0xFFFFFFFFLL, 1004015, 1005006, 1006006, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0);
  v385 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v386, "arrayByAddingObjectsFromArray:", v385);
  v384 = (void *)objc_claimAutoreleasedReturnValue();
  v383 = (void *)objc_msgSend(v384, "copy");
  v1022[47] = v383;
  v876 = 440949464;
  v875 = xmmword_1B6B88683;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v382 = (void *)objc_claimAutoreleasedReturnValue();
  v877[0] = v382;
  v877[1] = CFSTR("J128NM");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v877, 2);
  v381 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100053, 1001014, 1002031, 1003011, 1004015, 1005006, 1006006, 0xFFFFFFFFLL, 1008002, 0);
  v380 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v381, "arrayByAddingObjectsFromArray:", v380);
  v379 = (void *)objc_claimAutoreleasedReturnValue();
  v378 = (void *)objc_msgSend(v379, "copy");
  v1022[48] = v378;
  v873 = -695298128;
  v872 = xmmword_1B6B88697;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v377 = (void *)objc_claimAutoreleasedReturnValue();
  v874[0] = v377;
  v874[1] = CFSTR("J317NM");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v874, 2);
  v376 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100054, 1001015, 1002032, 0xFFFFFFFFLL, 1004015, 1005008, 1006012, 1007004, 0xFFFFFFFFLL, 0);
  v375 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v376, "arrayByAddingObjectsFromArray:", v375);
  v374 = (void *)objc_claimAutoreleasedReturnValue();
  v373 = (void *)objc_msgSend(v374, "copy");
  v1022[49] = v373;
  v870 = 804488105;
  v869 = xmmword_1B6B886AB;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v372 = (void *)objc_claimAutoreleasedReturnValue();
  v871[0] = v372;
  v871[1] = CFSTR("J317NM");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v871, 2);
  v371 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100055, 1001015, 1002032, 0xFFFFFFFFLL, 1004015, 1005008, 1006012, 1007004, 0xFFFFFFFFLL, 0);
  v370 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v371, "arrayByAddingObjectsFromArray:", v370);
  v369 = (void *)objc_claimAutoreleasedReturnValue();
  v368 = (void *)objc_msgSend(v369, "copy");
  v1022[50] = v368;
  v867 = 1614584579;
  v866 = xmmword_1B6B886BF;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v367 = (void *)objc_claimAutoreleasedReturnValue();
  v868[0] = v367;
  v868[1] = CFSTR("J318NM");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v868, 2);
  v366 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100056, 1001015, 1002032, 1003012, 1004015, 1005008, 1006012, 1007004, 1008004, 0);
  v365 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v366, "arrayByAddingObjectsFromArray:", v365);
  v364 = (void *)objc_claimAutoreleasedReturnValue();
  v363 = (void *)objc_msgSend(v364, "copy");
  v1022[51] = v363;
  v864 = 324288768;
  v863 = xmmword_1B6B886D3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v362 = (void *)objc_claimAutoreleasedReturnValue();
  v865[0] = v362;
  v865[1] = CFSTR("J318NM");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v865, 2);
  v361 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100057, 1001015, 1002032, 1003012, 1004015, 1005008, 1006012, 1007004, 1008004, 0);
  v360 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v361, "arrayByAddingObjectsFromArray:", v360);
  v359 = (void *)objc_claimAutoreleasedReturnValue();
  v358 = (void *)objc_msgSend(v359, "copy");
  v1022[52] = v358;
  v861 = 460218192;
  v860 = xmmword_1B6B886E7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v357 = (void *)objc_claimAutoreleasedReturnValue();
  v862[0] = v357;
  v862[1] = CFSTR("J320NM");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v862, 2);
  v356 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100058, 1001015, 1002030, 0xFFFFFFFFLL, 1004015, 1005008, 1006012, 1007004, 0xFFFFFFFFLL, 0);
  v355 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v356, "arrayByAddingObjectsFromArray:", v355);
  v354 = (void *)objc_claimAutoreleasedReturnValue();
  v353 = (void *)objc_msgSend(v354, "copy");
  v1022[53] = v353;
  v858 = 2144905009;
  v857 = xmmword_1B6B886FB;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v352 = (void *)objc_claimAutoreleasedReturnValue();
  v859[0] = v352;
  v859[1] = CFSTR("J320NM");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v859, 2);
  v351 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100059, 1001015, 1002030, 0xFFFFFFFFLL, 1004015, 1005008, 1006012, 1007004, 0xFFFFFFFFLL, 0);
  v350 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v351, "arrayByAddingObjectsFromArray:", v350);
  v349 = (void *)objc_claimAutoreleasedReturnValue();
  v348 = (void *)objc_msgSend(v349, "copy");
  v1022[54] = v348;
  v855 = 127894440;
  v854 = xmmword_1B6B8870F;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v347 = (void *)objc_claimAutoreleasedReturnValue();
  v856[0] = v347;
  v856[1] = CFSTR("J321NM");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v856, 2);
  v346 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100060, 1001015, 1002030, 1003012, 1004015, 1005008, 1006012, 1007004, 1008004, 0);
  v345 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v346, "arrayByAddingObjectsFromArray:", v345);
  v344 = (void *)objc_claimAutoreleasedReturnValue();
  v343 = (void *)objc_msgSend(v344, "copy");
  v1022[55] = v343;
  v852 = 1070997468;
  v851 = xmmword_1B6B88723;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v342 = (void *)objc_claimAutoreleasedReturnValue();
  v853[0] = v342;
  v853[1] = CFSTR("J321NM");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v853, 2);
  v341 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100061, 1001015, 1002030, 1003012, 1004015, 1005008, 1006012, 1007004, 1008004, 0);
  v340 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v341, "arrayByAddingObjectsFromArray:", v340);
  v339 = (void *)objc_claimAutoreleasedReturnValue();
  v338 = (void *)objc_msgSend(v339, "copy");
  v1022[56] = v338;
  v849 = -212523443;
  v848 = xmmword_1B6B88737;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v337 = (void *)objc_claimAutoreleasedReturnValue();
  v850[0] = v337;
  v850[1] = CFSTR("J71DN");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v850, 2);
  v336 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100062, 1001013, 1002018, 0xFFFFFFFFLL, 1004007, 1005006, 1006016, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0);
  v335 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v336, "arrayByAddingObjectsFromArray:", v335);
  v334 = (void *)objc_claimAutoreleasedReturnValue();
  v333 = (void *)objc_msgSend(v334, "copy");
  v1022[57] = v333;
  v846 = 646100384;
  v845 = xmmword_1B6B8874B;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v332 = (void *)objc_claimAutoreleasedReturnValue();
  v847[0] = v332;
  v847[1] = CFSTR("J72DN");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v847, 2);
  v331 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100063, 1001013, 1002018, 1003010, 1004007, 1005006, 1006016, 0xFFFFFFFFLL, 1008002, 0);
  v330 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v331, "arrayByAddingObjectsFromArray:", v330);
  v329 = (void *)objc_claimAutoreleasedReturnValue();
  v328 = (void *)objc_msgSend(v329, "copy");
  v1022[58] = v328;
  v843 = 688565114;
  v842 = xmmword_1B6B8875F;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v327 = (void *)objc_claimAutoreleasedReturnValue();
  v844[0] = v327;
  v844[1] = CFSTR("J96NMN");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v844, 2);
  v326 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100064, 1001016, 1002033, 0xFFFFFFFFLL, 1004015, 1005003, 1006013, 1007004, 0xFFFFFFFFLL, 0);
  v325 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v326, "arrayByAddingObjectsFromArray:", v325);
  v324 = (void *)objc_claimAutoreleasedReturnValue();
  v323 = (void *)objc_msgSend(v324, "copy");
  v1022[59] = v323;
  v840 = -493418906;
  v839 = xmmword_1B6B88773;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v322 = (void *)objc_claimAutoreleasedReturnValue();
  v841[0] = v322;
  v841[1] = CFSTR("J97NMN");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v841, 2);
  v321 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100065, 1001016, 1002033, 1003013, 1004015, 1005003, 1006013, 1007004, 1008004, 0);
  v623 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v321, "arrayByAddingObjectsFromArray:", v623);
  v320 = (void *)objc_claimAutoreleasedReturnValue();
  v319 = (void *)objc_msgSend(v320, "copy");
  v1022[60] = v319;
  v837 = -545612308;
  v836 = xmmword_1B6B88787;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v318 = (void *)objc_claimAutoreleasedReturnValue();
  v838[0] = v318;
  v838[1] = CFSTR("J307N");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v838, 2);
  v317 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100066, 1001015, 1002036, 0xFFFFFFFFLL, 1004015, 1005028, 1006017, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0);
  v316 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v317, "arrayByAddingObjectsFromArray:", v316);
  v315 = (void *)objc_claimAutoreleasedReturnValue();
  v314 = (void *)objc_msgSend(v315, "copy");
  v1022[61] = v314;
  v834 = 1178062702;
  v833 = xmmword_1B6B8879B;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v313 = (void *)objc_claimAutoreleasedReturnValue();
  v835[0] = v313;
  v835[1] = CFSTR("J307NM");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v835, 2);
  v312 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100067, 1001015, 1002036, 1003013, 1004015, 1005028, 1006017, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0);
  v311 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v312, "arrayByAddingObjectsFromArray:", v311);
  v310 = (void *)objc_claimAutoreleasedReturnValue();
  v309 = (void *)objc_msgSend(v310, "copy");
  v1022[62] = v309;
  v831 = -340360463;
  v830 = xmmword_1B6B887AF;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v308 = (void *)objc_claimAutoreleasedReturnValue();
  v832[0] = v308;
  v832[1] = CFSTR("J271");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v832, 2);
  v307 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100068, 1001014, 1002040, 0xFFFFFFFFLL, 1004015, 1005030, 1006021, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0);
  v306 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v307, "arrayByAddingObjectsFromArray:", v306);
  v305 = (void *)objc_claimAutoreleasedReturnValue();
  v304 = (void *)objc_msgSend(v305, "copy");
  v1022[63] = v304;
  v828 = 1605231531;
  v827 = xmmword_1B6B887C3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v303 = (void *)objc_claimAutoreleasedReturnValue();
  v829[0] = v303;
  v829[1] = CFSTR("J272");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v829, 2);
  v302 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100069, 1001014, 1002040, 1003013, 1004015, 1005030, 1006021, 0xFFFFFFFFLL, 1008004, 0);
  v301 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v302, "arrayByAddingObjectsFromArray:", v301);
  v300 = (void *)objc_claimAutoreleasedReturnValue();
  v299 = (void *)objc_msgSend(v300, "copy");
  v1022[64] = v299;
  v825 = 1878025452;
  v824 = xmmword_1B6B887D7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v298 = (void *)objc_claimAutoreleasedReturnValue();
  v826[0] = v298;
  v826[1] = CFSTR("J617");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v826, 2);
  v297 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100070, 1001017, 1002041, 0xFFFFFFFFLL, 1004016, 1005032, 1006022, 1007004, 0xFFFFFFFFLL, 0);
  v296 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v297, "arrayByAddingObjectsFromArray:", v296);
  v295 = (void *)objc_claimAutoreleasedReturnValue();
  v294 = (void *)objc_msgSend(v295, "copy");
  v1022[65] = v294;
  v822 = 1725957070;
  v821 = xmmword_1B6B887EB;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v293 = (void *)objc_claimAutoreleasedReturnValue();
  v823[0] = v293;
  v823[1] = CFSTR("J618");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v823, 2);
  v292 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100071, 1001017, 1002041, 1003015, 1004016, 1005032, 1006022, 1007004, 1008004, 0);
  v291 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v292, "arrayByAddingObjectsFromArray:", v291);
  v290 = (void *)objc_claimAutoreleasedReturnValue();
  v289 = (void *)objc_msgSend(v290, "copy");
  v1022[66] = v289;
  v819 = 538967431;
  v818 = xmmword_1B6B887FF;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v288 = (void *)objc_claimAutoreleasedReturnValue();
  v820[0] = v288;
  v820[1] = CFSTR("J620");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v820, 2);
  v287 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100072, 1001017, 1002030, 0xFFFFFFFFLL, 1004016, 1005032, 1006022, 1007004, 0xFFFFFFFFLL, 0);
  v286 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v287, "arrayByAddingObjectsFromArray:", v286);
  v285 = (void *)objc_claimAutoreleasedReturnValue();
  v284 = (void *)objc_msgSend(v285, "copy");
  v1022[67] = v284;
  v816 = 2060712151;
  v815 = xmmword_1B6B88813;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v283 = (void *)objc_claimAutoreleasedReturnValue();
  v817[0] = v283;
  v817[1] = CFSTR("J621");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v817, 2);
  v282 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100073, 1001017, 1002030, 1003015, 1004016, 1005032, 1006022, 1007004, 1008004, 0);
  v281 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v282, "arrayByAddingObjectsFromArray:", v281);
  v280 = (void *)objc_claimAutoreleasedReturnValue();
  v279 = (void *)objc_msgSend(v280, "copy");
  v1022[68] = v279;
  v813 = 958549802;
  v812 = xmmword_1B6B88827;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v278 = (void *)objc_claimAutoreleasedReturnValue();
  v814[0] = v278;
  v814[1] = CFSTR("J507");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v814, 2);
  v277 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100074, 1001017, 1002056, 0xFFFFFFFFLL, 1004016, 1005042, 1006028, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0);
  v276 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v277, "arrayByAddingObjectsFromArray:", v276);
  v275 = (void *)objc_claimAutoreleasedReturnValue();
  v274 = (void *)objc_msgSend(v275, "copy");
  v1022[69] = v274;
  v810 = -12497897;
  v809 = xmmword_1B6B8883B;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v273 = (void *)objc_claimAutoreleasedReturnValue();
  v811[0] = v273;
  v811[1] = CFSTR("J508");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v811, 2);
  v272 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100075, 1001017, 1002056, 1003016, 1004016, 1005042, 1006028, 0xFFFFFFFFLL, 1008004, 0);
  v271 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v272, "arrayByAddingObjectsFromArray:", v271);
  v270 = (void *)objc_claimAutoreleasedReturnValue();
  v269 = (void *)objc_msgSend(v270, "copy");
  v1022[70] = v269;
  v807 = 1377540371;
  v806 = xmmword_1B6B8884F;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v268 = (void *)objc_claimAutoreleasedReturnValue();
  v808[0] = v268;
  v808[1] = CFSTR("J537");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v808, 2);
  v267 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100076, 1001017, 1002055, 0xFFFFFFFFLL, 1004016, 1005043, 1006029, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0);
  v266 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v267, "arrayByAddingObjectsFromArray:", v266);
  v265 = (void *)objc_claimAutoreleasedReturnValue();
  v264 = (void *)objc_msgSend(v265, "copy");
  v1022[71] = v264;
  v804 = -518121279;
  v803 = xmmword_1B6B88863;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v263 = (void *)objc_claimAutoreleasedReturnValue();
  v805[0] = v263;
  v805[1] = CFSTR("J538");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v805, 2);
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100077, 1001017, 1002055, 1003016, 1004016, 1005043, 1006029, 0xFFFFFFFFLL, 1008004, 0);
  v261 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v262, "arrayByAddingObjectsFromArray:", v261);
  v260 = (void *)objc_claimAutoreleasedReturnValue();
  v259 = (void *)objc_msgSend(v260, "copy");
  v1022[72] = v259;
  v801 = 802516499;
  v800 = xmmword_1B6B88877;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v258 = (void *)objc_claimAutoreleasedReturnValue();
  v802[0] = v258;
  v802[1] = CFSTR("J717");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v802, 2);
  v257 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100078, 1001020, 1002057, 0xFFFFFFFFLL, 1004016, 1005044, 1006025, 1007004, 0xFFFFFFFFLL, 0);
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v257, "arrayByAddingObjectsFromArray:", v256);
  v255 = (void *)objc_claimAutoreleasedReturnValue();
  v254 = (void *)objc_msgSend(v255, "copy");
  v1022[73] = v254;
  v798 = -1919324456;
  v797 = xmmword_1B6B8888B;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v253 = (void *)objc_claimAutoreleasedReturnValue();
  v799[0] = v253;
  v799[1] = CFSTR("J718");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v799, 2);
  v252 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100079, 1001020, 1002057, 1003016, 1004016, 1005044, 1006025, 1007004, 1008004, 0);
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v252, "arrayByAddingObjectsFromArray:", v251);
  v250 = (void *)objc_claimAutoreleasedReturnValue();
  v249 = (void *)objc_msgSend(v250, "copy");
  v1022[74] = v249;
  v795 = 1127969586;
  v794 = xmmword_1B6B8889F;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v248 = (void *)objc_claimAutoreleasedReturnValue();
  v796[0] = v248;
  v796[1] = CFSTR("J720");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v796, 2);
  v247 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100080, 1001020, 1002057, 0xFFFFFFFFLL, 1004016, 1005044, 1006025, 1007004, 0xFFFFFFFFLL, 0);
  v246 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v247, "arrayByAddingObjectsFromArray:", v246);
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  v244 = (void *)objc_msgSend(v245, "copy");
  v1022[75] = v244;
  v792 = 1292009573;
  v791 = xmmword_1B6B888B3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v243 = (void *)objc_claimAutoreleasedReturnValue();
  v793[0] = v243;
  v793[1] = CFSTR("J721");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v793, 2);
  v242 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100081, 1001020, 1002057, 1003016, 1004016, 1005044, 1006025, 1007004, 1008004, 0);
  v241 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v242, "arrayByAddingObjectsFromArray:", v241);
  v240 = (void *)objc_claimAutoreleasedReturnValue();
  v239 = (void *)objc_msgSend(v240, "copy");
  v1022[76] = v239;
  v789 = 1960366092;
  v788 = xmmword_1B6B888C7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v238 = (void *)objc_claimAutoreleasedReturnValue();
  v790[0] = v238;
  v790[1] = CFSTR("N102");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v790, 2);
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 101001, 1001004, 1002007, 0xFFFFFFFFLL, 1004006, 1005009, 1006001, 1007001, 0xFFFFFFFFLL, 0);
  v236 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v237, "arrayByAddingObjectsFromArray:", v236);
  v235 = (void *)objc_claimAutoreleasedReturnValue();
  v234 = (void *)objc_msgSend(v235, "copy");
  v1022[77] = v234;
  v786 = -2114570942;
  v785 = xmmword_1B6B888DB;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v233 = (void *)objc_claimAutoreleasedReturnValue();
  v787[0] = v233;
  v787[1] = CFSTR("N102N");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v787, 2);
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 101002, 1001008, 1002029, 0xFFFFFFFFLL, 1004008, 1005025, 1006001, 1007001, 0xFFFFFFFFLL, 0);
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v232, "arrayByAddingObjectsFromArray:", v231);
  v230 = (void *)objc_claimAutoreleasedReturnValue();
  v229 = (void *)objc_msgSend(v230, "copy");
  v1022[78] = v229;
  v783 = 28030256;
  v782 = xmmword_1B6B888EF;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  v784[0] = v228;
  v784[1] = CFSTR("N51");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v784, 2);
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102005, 1001003, 1002008, 1003002, 1004002, 1005012, 1006001, 1007002, 1008001, 0);
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v227, "arrayByAddingObjectsFromArray:", v226);
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  v224 = (void *)objc_msgSend(v225, "copy");
  v1022[79] = v224;
  v780 = 1214363620;
  v779 = xmmword_1B6B88903;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v223 = (void *)objc_claimAutoreleasedReturnValue();
  v781[0] = v223;
  v781[1] = CFSTR("N53");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v781, 2);
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102006, 1001003, 1002008, 1003002, 1004002, 1005012, 1006001, 1007002, 1008001, 0);
  v630 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v221, "arrayByAddingObjectsFromArray:", v630);
  v220 = (void *)objc_claimAutoreleasedReturnValue();
  v219 = (void *)objc_msgSend(v220, "copy");
  v1022[80] = v219;
  v777 = -798153473;
  v776 = xmmword_1B6B88917;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  v778[0] = v218;
  v778[1] = CFSTR("N56");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v778, 2);
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102007, 1001004, 1002009, 1003003, 1004006, 1005014, 1006001, 1007003, 1008001, 0);
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v216, "arrayByAddingObjectsFromArray:", v215);
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  v213 = (void *)objc_msgSend(v214, "copy");
  v1022[81] = v213;
  v774 = -776721724;
  v773 = xmmword_1B6B8892B;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  v775[0] = v212;
  v775[1] = CFSTR("N61");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v775, 2);
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102008, 1001004, 1002010, 1003003, 1004006, 1005013, 1006001, 1007004, 1008001, 0);
  v628 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v211, "arrayByAddingObjectsFromArray:", v628);
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  v209 = (void *)objc_msgSend(v210, "copy");
  v1022[82] = v209;
  v771 = -1403227947;
  v770 = xmmword_1B6B8893F;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  v772[0] = v208;
  v772[1] = CFSTR("N66");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v772, 2);
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102009, 1001006, 1002011, 1003004, 1004005, 1005015, 1006001, 1007004, 1008001, 0);
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v206, "arrayByAddingObjectsFromArray:", v205);
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  v203 = (void *)objc_msgSend(v204, "copy");
  v1022[83] = v203;
  v768 = 729118884;
  v767 = xmmword_1B6B88953;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  v769[0] = v202;
  v769[1] = CFSTR("N66M");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v769, 2);
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102010, 1001006, 1002011, 1003004, 1004005, 1005015, 1006001, 1007004, 1008001, 0);
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "arrayByAddingObjectsFromArray:", v200);
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  v198 = (void *)objc_msgSend(v199, "copy");
  v1022[84] = v198;
  v765 = -489993439;
  v764 = xmmword_1B6B88967;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  v766[0] = v197;
  v766[1] = CFSTR("N71");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v766, 2);
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102011, 1001006, 1002012, 1003004, 1004005, 1005015, 1006001, 1007004, 1008001, 0);
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v196, "arrayByAddingObjectsFromArray:", v195);
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  v193 = (void *)objc_msgSend(v194, "copy");
  v1022[85] = v193;
  v762 = 886875686;
  v761 = xmmword_1B6B8897B;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  v763[0] = v192;
  v763[1] = CFSTR("N71M");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v763, 2);
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102012, 1001006, 1002012, 1003004, 1004005, 1005015, 1006001, 1007004, 1008001, 0);
  v631 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v191, "arrayByAddingObjectsFromArray:", v631);
  v627 = (void *)objc_claimAutoreleasedReturnValue();
  v190 = (void *)objc_msgSend(v627, "copy");
  v1022[86] = v190;
  v759 = 1046806126;
  v758 = xmmword_1B6B8898F;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  v760[0] = v189;
  v760[1] = CFSTR("N69");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v760, 2);
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102013, 1001006, 1002008, 1003003, 1004008, 1005016, 1006001, 1007002, 1008001, 0);
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v188, "arrayByAddingObjectsFromArray:", v187);
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  v185 = (void *)objc_msgSend(v186, "copy");
  v1022[87] = v185;
  v756 = -188760945;
  v755 = xmmword_1B6B889A3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  v757[0] = v184;
  v757[1] = CFSTR("N69U");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v757, 2);
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102014, 1001006, 1002008, 1003003, 1004008, 1005016, 1006001, 1007002, 1008001, 0);
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v183, "arrayByAddingObjectsFromArray:", v222);
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  v181 = (void *)objc_msgSend(v182, "copy");
  v1022[88] = v181;
  v753 = -350584140;
  v752 = xmmword_1B6B889B7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  v754[0] = v180;
  v754[1] = CFSTR("D10");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v754, 2);
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102015, 1001008, 1002013, 1003005, 1004007, 1005017, 1006002, 1007005, 1008001, 0);
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "arrayByAddingObjectsFromArray:", v177);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  v175 = (void *)objc_msgSend(v176, "copy");
  v1022[89] = v175;
  v750 = -1418383976;
  v749 = xmmword_1B6B889CB;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  v751[0] = v174;
  v751[1] = CFSTR("D101");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v751, 2);
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102016, 1001008, 1002013, 1003006, 1004007, 1005017, 1006002, 1007005, 1008002, 0);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v173, "arrayByAddingObjectsFromArray:", v172);
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  v170 = (void *)objc_msgSend(v171, "copy");
  v1022[90] = v170;
  v747 = 368778837;
  v746 = xmmword_1B6B889DF;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  v748[0] = v169;
  v748[1] = CFSTR("D11");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v748, 2);
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102017, 1001008, 1002014, 1003005, 1004007, 1005018, 1006003, 1007005, 1008001, 0);
  v629 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v168, "arrayByAddingObjectsFromArray:", v629);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  v166 = (void *)objc_msgSend(v167, "copy");
  v1022[91] = v166;
  v744 = -1213485500;
  v743 = xmmword_1B6B889F3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  v745[0] = v165;
  v745[1] = CFSTR("D111");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v745, 2);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102018, 1001008, 1002014, 1003006, 1004007, 1005018, 1006003, 1007005, 1008002, 0);
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v164, "arrayByAddingObjectsFromArray:", v162);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  v160 = (void *)objc_msgSend(v161, "copy");
  v1022[92] = v160;
  v741 = 414393924;
  v740 = xmmword_1B6B88A07;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  v742[0] = v159;
  v742[1] = CFSTR("D10N");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v742, 2);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102021, 1001010, 1002019, 1003007, 1004010, 1005021, 1006002, 1007006, 1008001, 0);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "arrayByAddingObjectsFromArray:", v156);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  v153 = (void *)objc_msgSend(v154, "copy");
  v1022[93] = v153;
  v738 = 897736383;
  v737 = xmmword_1B6B88A1B;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  v739[0] = v152;
  v739[1] = CFSTR("D101N");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v739, 2);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102022, 1001010, 1002019, 1003008, 1004010, 1005021, 1006002, 1007006, 1008002, 0);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v151, "arrayByAddingObjectsFromArray:", v150);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v148 = (void *)objc_msgSend(v149, "copy");
  v1022[94] = v148;
  v735 = -996295886;
  v734 = xmmword_1B6B88A2F;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v736[0] = v147;
  v736[1] = CFSTR("D11N");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v736, 2);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102023, 1001010, 1002020, 1003007, 1004010, 1005021, 1006004, 1007006, 1008001, 0);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "arrayByAddingObjectsFromArray:", v145);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = (void *)objc_msgSend(v144, "copy");
  v1022[95] = v143;
  v732 = -453987047;
  v731 = xmmword_1B6B88A43;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v733[0] = v142;
  v733[1] = CFSTR("D111N");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v733, 2);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102024, 1001010, 1002020, 1003008, 1004010, 1005021, 1006004, 1007006, 1008002, 0);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "arrayByAddingObjectsFromArray:", v140);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v138 = (void *)objc_msgSend(v139, "copy");
  v1022[96] = v138;
  v729 = -337121064;
  v728 = xmmword_1B6B88A57;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v730[0] = v137;
  v730[1] = CFSTR("D11NM");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v730, 2);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102025, 1001010, 1002021, 1003007, 1004010, 1005022, 1006004, 1007006, 1008001, 0);
  v637 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "arrayByAddingObjectsFromArray:", v637);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = (void *)objc_msgSend(v135, "copy");
  v1022[97] = v134;
  v726 = 450980336;
  v725 = xmmword_1B6B88A6B;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v727[0] = v133;
  v727[1] = CFSTR("D111NM");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v727, 2);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102026, 1001010, 1002021, 1003008, 1004010, 1005022, 1006004, 1007006, 1008002, 0);
  v634 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "arrayByAddingObjectsFromArray:", v634);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v130 = (void *)objc_msgSend(v131, "copy");
  v1022[98] = v130;
  v723 = -232427879;
  v722 = xmmword_1B6B88A7F;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v724[0] = v129;
  v724[1] = CFSTR("D211NM");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v724, 2);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102027, 1001011, 1002024, 1003010, 1004013, 1005023, 1006005, 1007006, 1008002, 0);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "arrayByAddingObjectsFromArray:", v127);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = (void *)objc_msgSend(v126, "copy");
  v1022[99] = v125;
  v720 = 1477534141;
  v719 = xmmword_1B6B88A93;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v721[0] = v124;
  v721[1] = CFSTR("D231NM");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v721, 2);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102028, 1001011, 1002025, 1003010, 1004013, 1005023, 1006005, 1007006, 1008002, 0);
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "arrayByAddingObjectsFromArray:", v217);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = (void *)objc_msgSend(v122, "copy");
  v1022[100] = v121;
  v717 = -1843102369;
  v716 = xmmword_1B6B88AA7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v718[0] = v120;
  v718[1] = CFSTR("D201NM");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v718, 2);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102029, 1001011, 1002026, 1003010, 1004010, 1005023, 1006005, 1007006, 1008002, 0);
  v626 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "arrayByAddingObjectsFromArray:", v626);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = (void *)objc_msgSend(v118, "copy");
  v1022[101] = v117;
  v714 = -61007701;
  v713 = xmmword_1B6B88ABB;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v715[0] = v116;
  v715[1] = CFSTR("D321NM");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v715, 2);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102030, 1001013, 1002030, 1003011, 1004014, 1005026, 1006008, 1007006, 1008002, 0);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "arrayByAddingObjectsFromArray:", v114);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = (void *)objc_msgSend(v113, "copy");
  v1022[102] = v112;
  v711 = -235416490;
  v710 = xmmword_1B6B88ACF;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v712[0] = v111;
  v712[1] = CFSTR("D331NM");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v712, 2);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102031, 1001013, 1002030, 1003011, 1004014, 1005026, 1006008, 1007006, 1008002, 0);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "arrayByAddingObjectsFromArray:", v109);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = (void *)objc_msgSend(v108, "copy");
  v1022[103] = v107;
  v708 = -820493242;
  v707 = xmmword_1B6B88AE3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v709[0] = v106;
  v709[1] = CFSTR("D332NM");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v709, 2);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102032, 1001013, 1002030, 1003011, 1004014, 1005026, 1006008, 1007006, 1008002, 0);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "arrayByAddingObjectsFromArray:", v104);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = (void *)objc_msgSend(v103, "copy");
  v1022[104] = v102;
  v705 = -121925081;
  v704 = xmmword_1B6B88AF7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v706[0] = v101;
  v706[1] = CFSTR("D10NM");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v706, 2);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102033, 1001013, 1002019, 1003011, 1004014, 1005021, 1006002, 1007006, 1008002, 0);
  v639 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "arrayByAddingObjectsFromArray:", v639);
  v636 = (void *)objc_claimAutoreleasedReturnValue();
  v635 = (void *)objc_msgSend(v636, "copy");
  v1022[105] = v635;
  v702 = 1071957977;
  v701 = xmmword_1B6B88B0B;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  v703[0] = v207;
  v703[1] = CFSTR("D421NM");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v703, 2);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102034, 1001014, 1002030, 1003012, 1004015, 1005026, 1006010, 1007006, 1008004, 0);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v155, "arrayByAddingObjectsFromArray:", v99);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = (void *)objc_msgSend(v98, "copy");
  v1022[106] = v97;
  v699 = 438437663;
  v698 = xmmword_1B6B88B1F;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v700[0] = v96;
  v700[1] = CFSTR("D431NM");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v700, 2);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102035, 1001014, 1002030, 1003012, 1004015, 1005026, 1006010, 1007006, 1008004, 0);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "arrayByAddingObjectsFromArray:", v94);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = (void *)objc_msgSend(v93, "copy");
  v1022[107] = v92;
  v696 = -382792827;
  v695 = xmmword_1B6B88B33;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v697[0] = v91;
  v697[1] = CFSTR("D432NM");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v697, 2);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102036, 1001014, 1002030, 1003012, 1004015, 1005026, 1006011, 1007006, 1008004, 0);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "arrayByAddingObjectsFromArray:", v89);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = (void *)objc_msgSend(v88, "copy");
  v1022[108] = v87;
  v693 = 1575123478;
  v692 = xmmword_1B6B88B47;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v694[0] = v86;
  v694[1] = CFSTR("D441NM");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v694, 2);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102037, 1001014, 1002030, 1003012, 1004015, 1005026, 1006011, 1007006, 1008004, 0);
  v625 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "arrayByAddingObjectsFromArray:", v625);
  v624 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = (void *)objc_msgSend(v624, "copy");
  v1022[109] = v84;
  v690 = 123138233;
  v689 = xmmword_1B6B88B5B;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v691[0] = v83;
  v691[1] = CFSTR("D521NM");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v691, 2);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102038, 1001016, 1002030, 1003013, 1004015, 1005026, 1006014, 1007006, 1008004, 0);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "arrayByAddingObjectsFromArray:", v80);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = (void *)objc_msgSend(v79, "copy");
  v1022[110] = v78;
  v687 = 681511593;
  v686 = xmmword_1B6B88B6F;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v688[0] = v77;
  v688[1] = CFSTR("D531NM");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v688, 2);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102039, 1001016, 1002030, 1003013, 1004015, 1005026, 1006014, 1007006, 1008004, 0);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "arrayByAddingObjectsFromArray:", v75);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = (void *)objc_msgSend(v74, "copy");
  v1022[111] = v73;
  v684 = 713503427;
  v683 = xmmword_1B6B88B83;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v685[0] = v72;
  v685[1] = CFSTR("D532NM");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v685, 2);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102040, 1001016, 1002030, 1003013, 1004015, 1005026, 1006015, 1007006, 1008004, 0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "arrayByAddingObjectsFromArray:", v70);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = (void *)objc_msgSend(v69, "copy");
  v1022[112] = v68;
  v681 = -1632750650;
  v680 = xmmword_1B6B88B97;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v682[0] = v67;
  v682[1] = CFSTR("D541NM");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v682, 2);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102041, 1001016, 1002030, 1003013, 1004015, 1005026, 1006015, 1007006, 1008004, 0);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "arrayByAddingObjectsFromArray:", v163);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = (void *)objc_msgSend(v65, "copy");
  v1022[113] = v64;
  v678 = -1431778695;
  v677 = xmmword_1B6B88BAB;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v679[0] = v63;
  v679[1] = CFSTR("D10NMN");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v679, 2);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102042, 1001016, 1002019, 1003014, 1004015, 1005029, 1006018, 1007006, 1008004, 0);
  v638 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "arrayByAddingObjectsFromArray:", v638);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (void *)objc_msgSend(v61, "copy");
  v1022[114] = v60;
  v675 = 533419158;
  v674 = xmmword_1B6B88BBF;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v676[0] = v59;
  v676[1] = CFSTR("D27");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v676, 2);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102043, 1001016, 1002030, 1003015, 1004015, 1005026, 1006019, 1007005, 1008004, 0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "arrayByAddingObjectsFromArray:", v57);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = (void *)objc_msgSend(v56, "copy");
  v1022[115] = v55;
  v672 = 1106979518;
  v671 = xmmword_1B6B88BD3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v673[0] = v54;
  v673[1] = CFSTR("D28");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v673, 2);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102044, 1001016, 1002030, 1003015, 1004015, 1005033, 1006019, 1007005, 1008004, 0);
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "arrayByAddingObjectsFromArray:", v179);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (void *)objc_msgSend(v82, "copy");
  v1022[116] = v52;
  v669 = -1820426635;
  v668 = xmmword_1B6B88BE7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v670[0] = v51;
  v670[1] = CFSTR("D73");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v670, 2);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102045, 1001018, 1002030, 1003015, 1004015, 1005026, 1006020, 1007006, 1008005, 0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "arrayByAddingObjectsFromArray:", v49);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)objc_msgSend(v48, "copy");
  v1022[117] = v47;
  v666 = -937652876;
  v665 = xmmword_1B6B88BFB;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v667[0] = v46;
  v667[1] = CFSTR("D74");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v667, 2);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102046, 1001018, 1002030, 1003015, 1004015, 1005026, 1006020, 1007006, 1008005, 0);
  v641 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "arrayByAddingObjectsFromArray:", v641);
  v633 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)objc_msgSend(v633, "copy");
  v1022[118] = v44;
  v663 = -609570151;
  v662 = xmmword_1B6B88C0F;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v664[0] = v43;
  v664[1] = CFSTR("D37");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v664, 2);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102047, 1001018, 1002030, 1003016, 1004015, 1005034, 1006023, 1007006, 1008004, 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "arrayByAddingObjectsFromArray:", v41);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend(v40, "copy");
  v1022[119] = v39;
  v660 = -874769875;
  v659 = xmmword_1B6B88C23;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v661[0] = v38;
  v661[1] = CFSTR("D38");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v661, 2);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102048, 1001018, 1002030, 1003016, 1004015, 1005035, 1006023, 1007006, 1008004, 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "arrayByAddingObjectsFromArray:", v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v35, "copy");
  v1022[120] = v34;
  v657 = 1874287171;
  v656 = xmmword_1B6B88C37;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v658[0] = v33;
  v658[1] = CFSTR("D83");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v658, 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102049, 1001019, 1002030, 1003016, 1004016, 1005036, 1006024, 1007006, 1008005, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "arrayByAddingObjectsFromArray:", v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v30, "copy");
  v1022[121] = v29;
  v654 = -781324731;
  v653 = xmmword_1B6B88C4B;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v655[0] = v28;
  v655[1] = CFSTR("D84");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v655, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102050, 1001019, 1002030, 1003016, 1004016, 1005037, 1006024, 1007006, 1008005, 0);
  v632 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "arrayByAddingObjectsFromArray:", v632);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v158, "copy");
  v1022[122] = v26;
  v651 = 1223847566;
  v650 = xmmword_1B6B88C5F;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v652[0] = v25;
  v652[1] = CFSTR("D47");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v652, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102052, 1001022, 1002030, 1003017, 1004017, 1005038, 1006026, 1007006, 1008004, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "arrayByAddingObjectsFromArray:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v22, "copy");
  v1022[123] = v21;
  v648 = 185580364;
  v647 = xmmword_1B6B88C73;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v649[0] = v20;
  v649[1] = CFSTR("D48");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v649, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102053, 1001022, 1002030, 1003017, 1004017, 1005038, 1006026, 1007006, 1008004, 0);
  v642 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "arrayByAddingObjectsFromArray:", v642);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v18, "copy");
  v1022[124] = v17;
  v645 = 1214880059;
  v644 = xmmword_1B6B88C87;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v646[0] = v16;
  v646[1] = CFSTR("D93");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v646, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102054, 1001021, 1002030, 1003017, 1004017, 1005038, 1006027, 1007006, 1008005, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "arrayByAddingObjectsFromArray:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v13, "copy");
  v1022[125] = v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsDeviceOfType());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v643[0] = v3;
  v643[1] = CFSTR("D94");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v643, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102055, 1001021, 1002030, 1003017, 1004017, 1005038, 1006027, 1007006, 1008005, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  v1022[126] = v7;
  objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_1E6AF5E70, "arrayByAddingObjectsFromArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  v1022[127] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1022, 128);
  v640 = (id)objc_claimAutoreleasedReturnValue();

  return v640;
}

void __35__PLPlatform_kPLPlatformAttributes__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;

  v2 = (void *)MEMORY[0x1BCC9E9B4]();
  objc_msgSend(*(id *)(a1 + 32), "kPLDeviceMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 0;
    do
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "BOOLValue");

      kPLPlatformAttributes_rowIndex = v4;
      if ((v7 & 1) != 0)
        break;
      ++v4;
    }
    while (objc_msgSend(v3, "count") > v4);
  }
  objc_msgSend(v3, "objectAtIndexedSubscript:", kPLPlatformAttributes_rowIndex);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)kPLPlatformAttributes_deviceInfo;
  kPLPlatformAttributes_deviceInfo = v8;

  objc_autoreleasePoolPop(v2);
}

+ (BOOL)isDeviceClass:(int)a3
{
  return objc_msgSend(a1, "kPLDeviceClass") == a3;
}

+ (id)kPLDeviceClassName
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "kPLPlatformAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)isDeviceClassName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "kPLDeviceClassName");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  return v5 == v4;
}

+ (int)kPLSoCClassOfDevice
{
  void *v2;
  void *v3;
  int v4;

  objc_msgSend(a1, "kPLPlatformAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

+ (BOOL)isSoCClass:(int)a3
{
  return objc_msgSend(a1, "kPLSoCClassOfDevice") == a3;
}

+ (int)kPLDisplayClassOfDevice
{
  void *v2;
  void *v3;
  int v4;

  objc_msgSend(a1, "kPLPlatformAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

+ (BOOL)isDisplayClass:(int)a3
{
  return objc_msgSend(a1, "kPLDisplayClassOfDevice") == a3;
}

+ (BOOL)isBasebandClass:(int)a3
{
  return objc_msgSend(a1, "kPLBasebandClassOfDevice") == a3;
}

+ (BOOL)isAudioClass:(int)a3
{
  return objc_msgSend(a1, "kPLAudioClassOfDevice") == a3;
}

+ (int)kPLCameraClassOfDevice
{
  void *v2;
  void *v3;
  int v4;

  objc_msgSend(a1, "kPLPlatformAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

+ (BOOL)isCameraClass:(int)a3
{
  return objc_msgSend(a1, "kPLCameraClassOfDevice") == a3;
}

+ (int)kPLTorchClassOfDevice
{
  void *v2;
  void *v3;
  int v4;

  objc_msgSend(a1, "kPLPlatformAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

+ (BOOL)isTorchClass:(int)a3
{
  return objc_msgSend(a1, "kPLTorchClassOfDevice") == a3;
}

+ (int)kPLGPSClassOfDevice
{
  void *v2;
  void *v3;
  int v4;

  objc_msgSend(a1, "kPLPlatformAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

+ (BOOL)isGPSClass:(int)a3
{
  return objc_msgSend(a1, "kPLGPSClassOfDevice") == a3;
}

+ (BOOL)isVirtualDevice
{
  if (isVirtualDevice_onceToken != -1)
    dispatch_once(&isVirtualDevice_onceToken, &__block_literal_global_8);
  return isVirtualDevice_isVirtualDevice;
}

void __29__PLPlatform_isVirtualDevice__block_invoke()
{
  const __CFBoolean *v0;

  v0 = (const __CFBoolean *)MGCopyAnswer();
  isVirtualDevice_isVirtualDevice = CFBooleanGetValue(v0) != 0;
  CFRelease(v0);
}

+ (BOOL)kPLDeviceClassIsOneOf:(int)a3
{
  uint64_t v4;

  return objc_msgSend(a1, "kPLXIsOneOf:firstArg:restOfArgs:", 2, *(_QWORD *)&a3, &v4);
}

+ (BOOL)kPLSoCClassIsOneOf:(int)a3
{
  uint64_t v4;

  return objc_msgSend(a1, "kPLXIsOneOf:firstArg:restOfArgs:", 3, *(_QWORD *)&a3, &v4);
}

+ (BOOL)kPLDisplayClassIsOneOf:(int)a3
{
  uint64_t v4;

  return objc_msgSend(a1, "kPLXIsOneOf:firstArg:restOfArgs:", 4, *(_QWORD *)&a3, &v4);
}

+ (BOOL)kPLBasebandClassIsOneOf:(int)a3
{
  uint64_t v4;

  return objc_msgSend(a1, "kPLXIsOneOf:firstArg:restOfArgs:", 5, *(_QWORD *)&a3, &v4);
}

+ (BOOL)kPLWiFiClassIsOneOf:(int)a3
{
  uint64_t v4;

  return objc_msgSend(a1, "kPLXIsOneOf:firstArg:restOfArgs:", 6, *(_QWORD *)&a3, &v4);
}

+ (BOOL)kPLAudioClassIsOneOf:(int)a3
{
  uint64_t v4;

  return objc_msgSend(a1, "kPLXIsOneOf:firstArg:restOfArgs:", 7, *(_QWORD *)&a3, &v4);
}

+ (BOOL)kPLCameraClassIsOneOf:(int)a3
{
  uint64_t v4;

  return objc_msgSend(a1, "kPLXIsOneOf:firstArg:restOfArgs:", 8, *(_QWORD *)&a3, &v4);
}

+ (BOOL)kPLTorchClassIsOneOf:(int)a3
{
  uint64_t v4;

  return objc_msgSend(a1, "kPLXIsOneOf:firstArg:restOfArgs:", 9, *(_QWORD *)&a3, &v4);
}

+ (BOOL)kPLGPSClassIsOneOf:(int)a3
{
  uint64_t v4;

  return objc_msgSend(a1, "kPLXIsOneOf:firstArg:restOfArgs:", 10, *(_QWORD *)&a3, &v4);
}

void __28__PLPlatform_hasCapability___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;

  v8 = *(_DWORD *)(a1 + 32);
  switch(v8)
  {
    case 100018:
    case 100019:
    case 100020:
    case 100021:
    case 100026:
    case 100027:
    case 100028:
    case 100029:
    case 100040:
    case 100041:
    case 100042:
    case 100043:
    case 100044:
    case 100045:
    case 100050:
    case 100051:
    case 100052:
    case 100053:
    case 100062:
    case 100063:
    case 100064:
    case 100065:
    case 100066:
    case 100067:
    case 100068:
    case 100069:
    case 100074:
    case 100075:
    case 100076:
    case 100077:
    case 100084:
    case 100085:
      setCapabilities(a1, a2, 0, a4, a5, a6, a7, a8, 0);
      goto LABEL_6;
    case 100022:
    case 100023:
    case 100024:
    case 100025:
    case 100030:
    case 100031:
    case 100082:
    case 100083:
      return;
    case 100032:
    case 100033:
    case 100034:
    case 100035:
    case 100036:
    case 100037:
    case 100038:
    case 100039:
    case 100046:
    case 100047:
    case 100048:
    case 100049:
    case 100054:
    case 100055:
    case 100056:
    case 100057:
    case 100058:
    case 100059:
    case 100060:
    case 100061:
    case 100070:
    case 100071:
    case 100072:
    case 100073:
LABEL_3:
      setCapabilities(a1, a2, 0, a4, a5, a6, a7, a8, 1);
      goto LABEL_6;
    case 100078:
    case 100079:
    case 100080:
    case 100081:
LABEL_4:
      setCapabilities(a1, a2, 1, a4, a5, a6, a7, a8, 1);
LABEL_6:
      hasCapability__capabilitiesBeenSet = 1;
      break;
    default:
      switch(v8)
      {
        case 102025:
        case 102026:
        case 102027:
        case 102028:
        case 102030:
        case 102031:
        case 102034:
        case 102035:
        case 102036:
        case 102037:
        case 102038:
        case 102039:
        case 102040:
        case 102041:
        case 102043:
        case 102044:
        case 102045:
        case 102046:
        case 102047:
        case 102048:
        case 102049:
        case 102050:
        case 102052:
        case 102053:
        case 102054:
        case 102055:
          goto LABEL_4;
        case 102029:
        case 102032:
          goto LABEL_3;
        default:
          return;
      }
  }
}

+ (BOOL)is64Bit
{
  if (is64Bit_onceToken != -1)
    dispatch_once(&is64Bit_onceToken, &__block_literal_global_367);
  return is64Bit__is64Bit;
}

uint64_t __21__PLPlatform_is64Bit__block_invoke()
{
  host_t v0;
  uint64_t result;
  mach_msg_type_number_t host_info_outCnt;
  integer_t host_info_out[4];
  __int128 v4;
  __int128 v5;

  v0 = MEMORY[0x1BCC9E90C]();
  v4 = 0u;
  v5 = 0u;
  *(_OWORD *)host_info_out = 0u;
  host_info_outCnt = 12;
  result = host_info(v0, 1, host_info_out, &host_info_outCnt);
  if (!(_DWORD)result && HIBYTE(host_info_out[3]) == 1)
    is64Bit__is64Bit = 1;
  return result;
}

+ (BOOL)hasNFC
{
  if (hasNFC_onceToken != -1)
    dispatch_once(&hasNFC_onceToken, &__block_literal_global_368);
  return hasNFC_hasNfc;
}

void __20__PLPlatform_hasNFC__block_invoke()
{
  const __CFBoolean *v0;

  v0 = (const __CFBoolean *)MGCopyAnswer();
  hasNFC_hasNfc = CFBooleanGetValue(v0) != 0;
  CFRelease(v0);
}

+ (BOOL)hasLPEM
{
  if (hasLPEM_onceToken != -1)
    dispatch_once(&hasLPEM_onceToken, &__block_literal_global_371);
  return hasLPEM_supportsLPEM;
}

uint64_t __21__PLPlatform_hasLPEM__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  hasLPEM_supportsLPEM = result;
  return result;
}

+ (BOOL)hasOrb
{
  return +[PLPlatform kPLDeviceClassIsOneOf:](PLPlatform, "kPLDeviceClassIsOneOf:", 100019, 102011, 102009, 0);
}

+ (BOOL)hasAOT
{
  if (hasAOT_onceToken != -1)
    dispatch_once(&hasAOT_onceToken, &__block_literal_global_374);
  return hasAOT_result;
}

uint64_t __20__PLPlatform_hasAOT__block_invoke()
{
  uint64_t result;

  result = +[PLPlatform isWatch](PLPlatform, "isWatch");
  if ((_DWORD)result)
    result = MGGetBoolAnswer();
  hasAOT_result = result;
  return result;
}

uint64_t __20__PLPlatform_hasAOD__block_invoke()
{
  uint64_t result;

  result = +[PLPlatform isiPhone](PLPlatform, "isiPhone");
  if ((_DWORD)result)
    result = MGGetBoolAnswer();
  hasAOD_result = result;
  return result;
}

+ (BOOL)hasSleepMedia
{
  if (hasSleepMedia_onceToken != -1)
    dispatch_once(&hasSleepMedia_onceToken, &__block_literal_global_378);
  return 0;
}

+ (BOOL)hasDCP
{
  if (hasDCP_onceToken != -1)
    dispatch_once(&hasDCP_onceToken, &__block_literal_global_379);
  return hasDCP_isDCPSupported;
}

uint64_t __20__PLPlatform_hasDCP__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  hasDCP_isDCPSupported = result;
  return result;
}

+ (BOOL)hasOLED
{
  if (hasOLED_onceToken != -1)
    dispatch_once(&hasOLED_onceToken, &__block_literal_global_382);
  return hasOLED_isOLEDSupported;
}

uint64_t __21__PLPlatform_hasOLED__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  hasOLED_isOLEDSupported = result;
  return result;
}

+ (BOOL)hasGenerativeModelSystems
{
  if (hasGenerativeModelSystems_onceToken != -1)
    dispatch_once(&hasGenerativeModelSystems_onceToken, &__block_literal_global_385);
  return hasGenerativeModelSystems_supportsGMS;
}

uint64_t __39__PLPlatform_hasGenerativeModelSystems__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  hasGenerativeModelSystems_supportsGMS = result;
  return result;
}

+ (BOOL)hasANE
{
  if (hasANE_onceToken != -1)
    dispatch_once(&hasANE_onceToken, &__block_literal_global_388);
  return hasANE___hasAppleNeuralEngineSupport;
}

uint64_t __20__PLPlatform_hasANE__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  hasANE___hasAppleNeuralEngineSupport = result;
  return result;
}

BOOL __20__PLPlatform_isiPod__block_invoke()
{
  _BOOL8 result;

  result = +[PLModelingUtilities isiPod](PLModelingUtilities, "isiPod");
  isiPod_isiPod = result;
  return result;
}

+ (BOOL)isiPad
{
  if (isiPad_onceToken != -1)
    dispatch_once(&isiPad_onceToken, &__block_literal_global_393);
  return isiPad_isiPad;
}

BOOL __20__PLPlatform_isiPad__block_invoke()
{
  _BOOL8 result;

  result = +[PLModelingUtilities isiPad](PLModelingUtilities, "isiPad");
  isiPad_isiPad = result;
  return result;
}

BOOL __22__PLPlatform_isiPhone__block_invoke()
{
  _BOOL8 result;

  result = +[PLModelingUtilities isiPhone](PLModelingUtilities, "isiPhone");
  isiPhone_isiPhone = result;
  return result;
}

+ (BOOL)isiOS
{
  if (isiOS_onceToken != -1)
    dispatch_once(&isiOS_onceToken, &__block_literal_global_395);
  return isiOS_isiOS;
}

BOOL __19__PLPlatform_isiOS__block_invoke()
{
  _BOOL8 result;

  result = +[PLPlatform isiPhone](PLPlatform, "isiPhone")
        || +[PLPlatform isiPad](PLPlatform, "isiPad")
        || +[PLPlatform isiPod](PLPlatform, "isiPod");
  isiOS_isiOS = result;
  return result;
}

+ (BOOL)isWatch
{
  if (isWatch_onceToken != -1)
    dispatch_once(&isWatch_onceToken, &__block_literal_global_396);
  return isWatch_isWatch;
}

BOOL __21__PLPlatform_isWatch__block_invoke()
{
  _BOOL8 result;

  result = +[PLModelingUtilities isWatch](PLModelingUtilities, "isWatch");
  isWatch_isWatch = result;
  return result;
}

+ (BOOL)isMac
{
  return +[PLModelingUtilities isMac](PLModelingUtilities, "isMac");
}

+ (BOOL)isARMMac
{
  return +[PLModelingUtilities isARMMac](PLModelingUtilities, "isARMMac");
}

+ (BOOL)isTVOS
{
  return +[PLModelingUtilities isTVOS](PLModelingUtilities, "isTVOS");
}

+ (BOOL)isAppleTV
{
  if (isAppleTV_onceToken != -1)
    dispatch_once(&isAppleTV_onceToken, &__block_literal_global_397);
  return isAppleTV_isAppleTV;
}

BOOL __23__PLPlatform_isAppleTV__block_invoke()
{
  _BOOL8 result;

  result = +[PLModelingUtilities isAppleTV](PLModelingUtilities, "isAppleTV");
  isAppleTV_isAppleTV = result;
  return result;
}

+ (BOOL)isAppleVision
{
  return +[PLModelingUtilities isAppleVision](PLModelingUtilities, "isAppleVision");
}

+ (BOOL)isArchARM
{
  return 1;
}

BOOL __27__PLPlatform_internalBuild__block_invoke()
{
  _BOOL8 result;

  result = +[PLModelingUtilities internalBuild](PLModelingUtilities, "internalBuild");
  internalBuild_result = result;
  return result;
}

+ (BOOL)carrierBuild
{
  if (carrierBuild_onceToken != -1)
    dispatch_once(&carrierBuild_onceToken, &__block_literal_global_399);
  return carrierBuild_carrierBuild;
}

BOOL __26__PLPlatform_carrierBuild__block_invoke()
{
  _BOOL8 result;

  result = +[PLModelingUtilities carrierBuild](PLModelingUtilities, "carrierBuild");
  carrierBuild_carrierBuild = result;
  return result;
}

+ (BOOL)seedBuild
{
  return 0;
}

+ (BOOL)nonUIBuild
{
  if (nonUIBuild_onceToken != -1)
    dispatch_once(&nonUIBuild_onceToken, &__block_literal_global_400);
  return nonUIBuild_nonUIBuild;
}

void __24__PLPlatform_nonUIBuild__block_invoke()
{
  void *v0;
  const void *v1;

  v0 = (void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    nonUIBuild_nonUIBuild = objc_msgSend(v0, "isEqualToString:", CFSTR("NonUI"));
    CFRelease(v1);
  }
  else
  {
    nonUIBuild_nonUIBuild = 0;
  }
}

+ (BOOL)isBasebandMavLeg
{
  if (isBasebandMavLeg_onceToken != -1)
    dispatch_once(&isBasebandMavLeg_onceToken, &__block_literal_global_405);
  return isBasebandMavLeg_result;
}

BOOL __30__PLPlatform_isBasebandMavLeg__block_invoke()
{
  _BOOL8 result;

  result = +[PLPlatform kPLBasebandClassIsOneOf:](PLPlatform, "kPLBasebandClassIsOneOf:", 1003003, 1003004, 1003005, 1003007, 0);
  isBasebandMavLeg_result = result;
  return result;
}

+ (BOOL)isBasebandIce
{
  if (isBasebandIce_onceToken != -1)
    dispatch_once(&isBasebandIce_onceToken, &__block_literal_global_406);
  return isBasebandIce_result;
}

BOOL __27__PLPlatform_isBasebandIce__block_invoke()
{
  _BOOL8 result;

  result = +[PLPlatform kPLBasebandClassIsOneOf:](PLPlatform, "kPLBasebandClassIsOneOf:", 1003006, 1003008, 1003010, 1003011, 0);
  isBasebandIce_result = result;
  return result;
}

+ (BOOL)isBasebandIBIS
{
  if (isBasebandIBIS_onceToken != -1)
    dispatch_once(&isBasebandIBIS_onceToken, &__block_literal_global_407);
  return isBasebandIBIS_result;
}

BOOL __28__PLPlatform_isBasebandIBIS__block_invoke()
{
  _BOOL8 result;

  result = +[PLPlatform kPLBasebandClassIsOneOf:](PLPlatform, "kPLBasebandClassIsOneOf:", 1003009, 0);
  isBasebandIBIS_result = result;
  return result;
}

+ (BOOL)isBasebandMav
{
  if (isBasebandMav_onceToken != -1)
    dispatch_once(&isBasebandMav_onceToken, &__block_literal_global_408);
  return isBasebandMav_result;
}

BOOL __27__PLPlatform_isBasebandMav__block_invoke()
{
  _BOOL8 result;

  result = +[PLPlatform kPLBasebandClassIsOneOf:](PLPlatform, "kPLBasebandClassIsOneOf:", 1003012, 1003013, 1003014, 1003015, 1003016, 1003017, 0);
  isBasebandMav_result = result;
  return result;
}

+ (BOOL)isBasebandProto
{
  return 0;
}

BOOL __28__PLPlatform_isBasebandDSDS__block_invoke()
{
  _BOOL8 result;

  result = +[PLPlatform kPLBasebandClassIsOneOf:](PLPlatform, "kPLBasebandClassIsOneOf:", 1003010, 1003011, 1003012, 1003013, 1003014, 1003015, 1003016, 1003017, 0);
  isBasebandDSDS_result = result;
  return result;
}

+ (id)wrapDeviceArgumentsInArray:(int)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t *v7;
  uint64_t *v9;
  int v10;
  uint64_t v11;

  v3 = *(_QWORD *)&a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if ((_DWORD)v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

    v9 = &v11;
    if (v10)
    {
      do
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v6);

        v7 = v9++;
      }
      while (*(_DWORD *)v7);
    }
  }
  return v4;
}

+ (BOOL)kPLXIsOneOf:(int)a3 firstArg:(int)a4 restOfArgs:(char *)a5
{
  void *v7;
  void *v8;
  int v9;
  BOOL result;
  int *v11;

  objc_msgSend(a1, "kPLPlatformAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "intValue");

  result = 0;
  if (a4 && v9 != -1)
  {
    do
    {
      result = a4 == v9;
      if (a4 == v9)
        break;
      v11 = (int *)a5;
      a5 += 8;
      a4 = *v11;
    }
    while (*v11);
  }
  return result;
}

@end
