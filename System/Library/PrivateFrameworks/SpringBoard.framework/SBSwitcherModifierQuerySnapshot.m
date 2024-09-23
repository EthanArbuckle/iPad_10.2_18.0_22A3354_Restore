@implementation SBSwitcherModifierQuerySnapshot

- (SBSwitcherModifierQuerySnapshot)initWithModifier:(id)a3
{
  id v5;
  SBSwitcherModifierQuerySnapshot *v6;
  SBSwitcherModifierQuerySnapshot *v7;
  void *v9;
  objc_super v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSwitcherModifierTimelineEntry.m"), 177, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("modifier"));

  }
  v10.receiver = self;
  v10.super_class = (Class)SBSwitcherModifierQuerySnapshot;
  v6 = -[SBSwitcherModifierQuerySnapshot init](&v10, sel_init);
  v7 = v6;
  if (v6)
    -[SBSwitcherModifierQuerySnapshot _buildFromModifier:](v6, "_buildFromModifier:", v5);

  return v7;
}

- (void)_buildFromModifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  id v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  id v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
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
  id v127;
  id v128;
  void *v129;
  void *v130;
  void *v131;
  id v132;
  void *v133;
  void *v134;
  id v135;
  void *v136;
  void *v137;
  id v138;
  void *v139;
  void *v140;
  id v141;
  void *v142;
  void *v143;
  id v144;
  void *v145;
  void *v146;
  id v147;
  void *v148;
  void *v149;
  id v150;
  void *v151;
  void *v152;
  id v153;
  void *v154;
  void *v155;
  id v156;
  void *v157;
  void *v158;
  id v159;
  void *v160;
  void *v161;
  id v162;
  void *v163;
  void *v164;
  id v165;
  void *v166;
  void *v167;
  id v168;
  void *v169;
  void *v170;
  id v171;
  void *v172;
  void *v173;
  id v174;
  void *v175;
  void *v176;
  id v177;
  void *v178;
  void *v179;
  id v180;
  void *v181;
  void *v182;
  id v183;
  void *v184;
  void *v185;
  id v186;
  void *v187;
  void *v188;
  id v189;
  void *v190;
  void *v191;
  id v192;
  void *v193;
  void *v194;
  id v195;
  void *v196;
  void *v197;
  id v198;
  void *v199;
  void *v200;
  id v201;
  void *v202;
  void *v203;
  id v204;
  void *v205;
  void *v206;
  id v207;
  void *v208;
  void *v209;
  id v210;
  void *v211;
  void *v212;
  id v213;
  void *v214;
  void *v215;
  id v216;
  void *v217;
  void *v218;
  id v219;
  void *v220;
  void *v221;
  id v222;
  void *v223;
  void *v224;
  id v225;
  void *v226;
  void *v227;
  id v228;
  void *v229;
  void *v230;
  id v231;
  void *v232;
  void *v233;
  id v234;
  void *v235;
  void *v236;
  id v237;
  void *v238;
  void *v239;
  id v240;
  void *v241;
  void *v242;
  id v243;
  void *v244;
  void *v245;
  id v246;
  void *v247;
  void *v248;
  id v249;
  void *v250;
  void *v251;
  id v252;
  void *v253;
  void *v254;
  id v255;
  void *v256;
  void *v257;
  id v258;
  void *v259;
  void *v260;
  id v261;
  void *v262;
  void *v263;
  id v264;
  void *v265;
  void *v266;
  id v267;
  void *v268;
  void *v269;
  id v270;
  void *v271;
  void *v272;
  id v273;
  void *v274;
  void *v275;
  id v276;
  void *v277;
  void *v278;
  id v279;
  void *v280;
  void *v281;
  id v282;
  void *v283;
  void *v284;
  id v285;
  void *v286;
  void *v287;
  id v288;
  void *v289;
  void *v290;
  id v291;
  void *v292;
  void *v293;
  id v294;
  void *v295;
  void *v296;
  id v297;
  void *v298;
  void *v299;
  id v300;
  void *v301;
  void *v302;
  id v303;
  void *v304;
  void *v305;
  id v306;
  void *v307;
  void *v308;
  id v309;
  void *v310;
  void *v311;
  id v312;
  void *v313;
  void *v314;
  id v315;
  void *v316;
  void *v317;
  id v318;
  void *v319;
  void *v320;
  id v321;
  void *v322;
  void *v323;
  id v324;
  void *v325;
  void *v326;
  id v327;
  void *v328;
  void *v329;
  id v330;
  void *v331;
  void *v332;
  id v333;
  void *v334;
  void *v335;
  id v336;
  void *v337;
  void *v338;
  id v339;
  void *v340;
  void *v341;
  id v342;
  void *v343;
  void *v344;
  id v345;
  void *v346;
  void *v347;
  id v348;
  void *v349;
  void *v350;
  id v351;
  void *v352;
  void *v353;
  id v354;
  void *v355;
  void *v356;
  id v357;
  void *v358;
  void *v359;
  id v360;
  void *v361;
  void *v362;
  id v363;
  void *v364;
  void *v365;
  id v366;
  void *v367;
  void *v368;
  id v369;
  id v370;
  id v371;
  uint64_t v372;
  Protocol *v373;
  char **v374;
  objc_method_description *v375;
  objc_method_description *v376;
  unint64_t v377;
  objc_method_description *v378;
  const char *name;
  uint64_t v380;
  uint64_t v381;
  void *v382;
  void *v384;
  Protocol **v385;
  id *v386;
  Protocol *v387;
  void *v388;
  void *v389;
  void *v390;
  id v391;
  id v392;
  void *v393;
  void *v394;
  id v395;
  void *v396;
  void *v397;
  id v398;
  void *v399;
  void *v400;
  id v401;
  void *v402;
  void *v403;
  id v404;
  void *v405;
  void *v406;
  id v407;
  void *v408;
  void *v409;
  id v410;
  void *v411;
  void *v412;
  id v413;
  void *v414;
  void *v415;
  id v416;
  void *v417;
  void *v418;
  id v419;
  void *v420;
  void *v421;
  id v422;
  void *v423;
  void *v424;
  id v425;
  void *v426;
  void *v427;
  id v428;
  void *v429;
  void *v430;
  id v431;
  void *v432;
  void *v433;
  id v434;
  void *v435;
  void *v436;
  id v437;
  void *v438;
  void *v439;
  id v440;
  void *v441;
  void *v442;
  id v443;
  void *v444;
  void *v445;
  id v446;
  void *v447;
  void *v448;
  id v449;
  void *v450;
  void *v451;
  id v452;
  void *v453;
  void *v454;
  id v455;
  void *v456;
  void *v457;
  id v458;
  void *v459;
  void *v460;
  id v461;
  void *v462;
  void *v463;
  id v464;
  void *v465;
  void *v466;
  id v467;
  void *v468;
  void *v469;
  id v470;
  void *v471;
  void *v472;
  id v473;
  void *v474;
  void *v475;
  id v476;
  void *v477;
  void *v478;
  id v479;
  void *v480;
  void *v481;
  id v482;
  void *v483;
  void *v484;
  id v485;
  void *v486;
  void *v487;
  id v488;
  void *v489;
  void *v490;
  id v491;
  void *v492;
  void *v493;
  void *v494;
  void *v495;
  void *v496;
  id v497;
  void *v498;
  uint64_t v499;
  void *v500;
  id v501;
  id v502;
  uint64_t v503;
  void *v504;
  uint64_t v505;
  Protocol *p;
  Protocol *pa;
  Protocol *pb;
  Protocol *pc;
  id obj;
  _QWORD v511[4];
  id v512;
  _QWORD v513[4];
  id v514;
  _QWORD v515[4];
  id v516;
  _QWORD v517[4];
  id v518;
  _QWORD v519[4];
  id v520;
  _QWORD v521[4];
  id v522;
  _QWORD v523[4];
  id v524;
  _QWORD v525[4];
  id v526;
  _QWORD v527[4];
  id v528;
  _QWORD v529[4];
  id v530;
  _QWORD v531[4];
  id v532;
  _QWORD v533[4];
  id v534;
  _QWORD v535[4];
  id v536;
  _QWORD v537[4];
  id v538;
  _QWORD v539[4];
  id v540;
  _QWORD v541[4];
  id v542;
  _QWORD v543[4];
  id v544;
  _QWORD v545[4];
  id v546;
  _QWORD v547[4];
  id v548;
  _QWORD v549[4];
  id v550;
  _QWORD v551[4];
  id v552;
  _QWORD v553[4];
  id v554;
  _QWORD v555[4];
  id v556;
  _QWORD v557[4];
  id v558;
  _QWORD v559[4];
  id v560;
  _QWORD v561[4];
  id v562;
  _QWORD v563[4];
  id v564;
  _QWORD v565[4];
  id v566;
  _QWORD v567[4];
  id v568;
  _QWORD v569[4];
  id v570;
  _QWORD v571[4];
  id v572;
  _QWORD v573[4];
  id v574;
  _QWORD v575[4];
  id v576;
  _QWORD v577[4];
  id v578;
  unsigned int v579;
  _QWORD v580[4];
  id v581;
  _QWORD v582[4];
  id v583;
  _QWORD v584[4];
  id v585;
  _QWORD v586[4];
  id v587;
  _QWORD v588[4];
  id v589;
  _QWORD v590[4];
  id v591;
  _QWORD v592[4];
  id v593;
  _QWORD v594[4];
  id v595;
  _QWORD v596[4];
  id v597;
  _QWORD v598[4];
  id v599;
  _QWORD v600[4];
  id v601;
  _QWORD v602[4];
  id v603;
  _QWORD v604[4];
  id v605;
  _QWORD v606[4];
  id v607;
  _QWORD v608[4];
  id v609;
  _QWORD v610[4];
  id v611;
  _QWORD v612[4];
  id v613;
  _QWORD v614[4];
  id v615;
  _QWORD v616[4];
  id v617;
  _QWORD v618[4];
  id v619;
  _QWORD v620[4];
  id v621;
  _QWORD v622[4];
  id v623;
  _QWORD v624[4];
  id v625;
  _QWORD v626[4];
  id v627;
  _QWORD v628[4];
  id v629;
  _QWORD v630[4];
  id v631;
  _QWORD v632[4];
  id v633;
  _QWORD v634[4];
  id v635;
  _QWORD v636[4];
  id v637;
  _QWORD v638[4];
  id v639;
  _QWORD v640[4];
  id v641;
  _QWORD v642[4];
  id v643;
  _QWORD v644[4];
  id v645;
  _QWORD v646[4];
  id v647;
  _QWORD v648[4];
  id v649;
  _QWORD v650[4];
  id v651;
  _QWORD v652[4];
  id v653;
  _QWORD v654[4];
  id v655;
  _QWORD v656[4];
  id v657;
  _QWORD v658[4];
  id v659;
  _QWORD v660[4];
  id v661;
  _QWORD v662[4];
  id v663;
  _QWORD v664[4];
  id v665;
  _QWORD v666[4];
  id v667;
  _QWORD v668[4];
  id v669;
  _QWORD v670[4];
  id v671;
  _QWORD v672[4];
  id v673;
  _QWORD v674[4];
  id v675;
  _QWORD v676[4];
  id v677;
  _QWORD v678[4];
  id v679;
  _QWORD v680[4];
  id v681;
  _QWORD v682[4];
  id v683;
  _QWORD v684[4];
  id v685;
  _QWORD v686[4];
  id v687;
  _QWORD v688[4];
  id v689;
  _QWORD v690[4];
  id v691;
  _QWORD v692[4];
  id v693;
  _QWORD v694[4];
  id v695;
  _QWORD v696[4];
  id v697;
  _QWORD v698[4];
  id v699;
  _QWORD v700[4];
  id v701;
  _QWORD v702[4];
  id v703;
  _QWORD v704[4];
  id v705;
  _QWORD v706[4];
  id v707;
  _QWORD v708[4];
  id v709;
  _QWORD v710[4];
  id v711;
  _QWORD v712[4];
  id v713;
  _QWORD v714[4];
  id v715;
  _QWORD v716[4];
  id v717;
  _QWORD v718[4];
  id v719;
  _QWORD v720[4];
  id v721;
  _QWORD v722[4];
  id v723;
  _QWORD v724[4];
  id v725;
  _QWORD v726[4];
  id v727;
  _QWORD v728[4];
  id v729;
  _QWORD v730[4];
  id v731;
  _QWORD v732[4];
  id v733;
  _QWORD v734[4];
  id v735;
  _QWORD v736[4];
  id v737;
  _QWORD v738[4];
  id v739;
  _QWORD v740[4];
  id v741;
  _QWORD v742[4];
  id v743;
  _QWORD v744[4];
  id v745;
  _QWORD v746[4];
  id v747;
  _QWORD v748[4];
  id v749;
  _QWORD v750[4];
  id v751;
  _QWORD v752[4];
  id v753;
  _QWORD v754[4];
  id v755;
  _QWORD v756[4];
  id v757;
  _QWORD v758[4];
  id v759;
  _QWORD v760[4];
  id v761;
  _QWORD v762[4];
  id v763;
  _QWORD v764[4];
  id v765;
  _QWORD v766[4];
  id v767;
  _QWORD v768[4];
  id v769;
  _QWORD v770[4];
  id v771;
  _QWORD v772[4];
  id v773;
  _QWORD v774[4];
  id v775;
  _QWORD v776[4];
  id v777;
  _QWORD v778[4];
  id v779;
  unsigned int outCount[2];
  uint64_t v781;
  void (*v782)(uint64_t, void *, uint64_t);
  void *v783;
  id v784;
  id v785;
  id v786;
  id v787;
  id v788;
  char *v789;
  void *v790;
  _QWORD v791[3];

  v3 = MEMORY[0x1E0C80A78](self);
  v503 = v4;
  v505 = v3;
  v791[1] = *MEMORY[0x1E0C80C00];
  v6 = v5;
  obj = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v6, "appLayouts");
  v504 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_adjustedAppLayoutsForAppLayouts_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v790 = v7;
  objc_msgSend(v6, "adjustedAppLayoutsForAppLayouts:", v504);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sb_switcherModifierDebugTimelineDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v791[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v791, &v790, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "addEntriesFromDictionary:", v10);

  v778[0] = MEMORY[0x1E0C809B0];
  v778[1] = 3221225472;
  v778[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke;
  v778[3] = &unk_1E8EA89D0;
  v11 = v6;
  v779 = v11;
  _SBCallDescriptionBlock(v778);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_visibleAppLayouts);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v12, v13);

  v776[0] = MEMORY[0x1E0C809B0];
  v776[1] = 3221225472;
  v776[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_2;
  v776[3] = &unk_1E8EA89D0;
  v14 = v11;
  v777 = v14;
  _SBCallDescriptionBlock(v776);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_foregroundAppLayouts);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v15, v16);

  v774[0] = MEMORY[0x1E0C809B0];
  v774[1] = 3221225472;
  v774[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_3;
  v774[3] = &unk_1E8EBE8C0;
  v17 = v14;
  v775 = v17;
  _SBCallDescriptionBlockForEachVisibleAppLayout(v17, v774);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_activityModeForAppLayout_);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v18, v19);

  v772[0] = MEMORY[0x1E0C809B0];
  v772[1] = 3221225472;
  v772[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_4;
  v772[3] = &unk_1E8EBE8E8;
  v20 = v17;
  v773 = v20;
  _SBCallDescriptionBlockForEachVisibleAppLayoutByIndex(v20, v772);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_frameForIndex_);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v21, v22);

  v770[0] = MEMORY[0x1E0C809B0];
  v770[1] = 3221225472;
  v770[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_5;
  v770[3] = &unk_1E8EBE8E8;
  v23 = v20;
  v771 = v23;
  _SBCallDescriptionBlockForEachVisibleAppLayoutByIndex(v23, v770);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_scaleForIndex_);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v24, v25);

  v768[0] = MEMORY[0x1E0C809B0];
  v768[1] = 3221225472;
  v768[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_6;
  v768[3] = &unk_1E8EBE8E8;
  v26 = v23;
  v769 = v26;
  _SBCallDescriptionBlockForEachVisibleAppLayoutByIndex(v26, v768);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_anchorPointForIndex_);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v27, v28);

  v766[0] = MEMORY[0x1E0C809B0];
  v766[1] = 3221225472;
  v766[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_7;
  v766[3] = &unk_1E8EBE8E8;
  v29 = v26;
  v767 = v29;
  _SBCallDescriptionBlockForEachVisibleAppLayoutByIndex(v29, v766);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_shouldPinLayoutRolesToSpace_);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v30, v31);

  v764[0] = MEMORY[0x1E0C809B0];
  v764[1] = 3221225472;
  v764[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_8;
  v764[3] = &unk_1E8EBE8E8;
  v32 = v29;
  v765 = v32;
  _SBCallDescriptionBlockForEachVisibleAppLayoutByIndex(v32, v764);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_shouldUseAnchorPointToPinLayoutRolesToSpace_);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v33, v34);

  v762[0] = MEMORY[0x1E0C809B0];
  v762[1] = 3221225472;
  v762[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_9;
  v762[3] = &unk_1E8EBE8E8;
  v35 = v32;
  v763 = v35;
  _SBCallDescriptionBlockForEachVisibleAppLayoutByIndex(v35, v762);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_clipsToUnobscuredMarginAtIndex_);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v36, v37);

  v760[0] = MEMORY[0x1E0C809B0];
  v760[1] = 3221225472;
  v760[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_10;
  v760[3] = &unk_1E8EBE8E8;
  v38 = v35;
  v761 = v38;
  _SBCallDescriptionBlockForEachVisibleAppLayoutByIndex(v38, v760);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_visibleMarginForItemContainerAtIndex_);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v39, v40);

  v758[0] = MEMORY[0x1E0C809B0];
  v758[1] = 3221225472;
  v758[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_11;
  v758[3] = &unk_1E8EBE8E8;
  v41 = v38;
  v759 = v41;
  _SBCallDescriptionBlockForEachVisibleAppLayoutByIndex(v41, v758);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_wallpaperOverlayAlphaForIndex_);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v42, v43);

  v756[0] = MEMORY[0x1E0C809B0];
  v756[1] = 3221225472;
  v756[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_12;
  v756[3] = &unk_1E8EBE8E8;
  v44 = v41;
  v757 = v44;
  _SBCallDescriptionBlockForEachVisibleAppLayoutByIndex(v44, v756);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_lighteningAlphaForIndex_);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v45, v46);

  v754[0] = MEMORY[0x1E0C809B0];
  v754[1] = 3221225472;
  v754[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_13;
  v754[3] = &unk_1E8EBE8E8;
  v47 = v44;
  v755 = v47;
  _SBCallDescriptionBlockForEachVisibleAppLayoutByIndex(v47, v754);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_headerStyleForIndex_);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v48, v49);

  v752[0] = MEMORY[0x1E0C809B0];
  v752[1] = 3221225472;
  v752[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_14;
  v752[3] = &unk_1E8EBE8E8;
  v50 = v47;
  v753 = v50;
  _SBCallDescriptionBlockForEachVisibleAppLayoutByIndex(v50, v752);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_titleOpacityForIndex_);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v51, v52);

  v750[0] = MEMORY[0x1E0C809B0];
  v750[1] = 3221225472;
  v750[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_15;
  v750[3] = &unk_1E8EBE8E8;
  v53 = v50;
  v751 = v53;
  _SBCallDescriptionBlockForEachVisibleAppLayoutByIndex(v53, v750);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isContentStatusBarVisibleForIndex_);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v54, v55);

  v748[0] = MEMORY[0x1E0C809B0];
  v748[1] = 3221225472;
  v748[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_16;
  v748[3] = &unk_1E8EBE8E8;
  v56 = v53;
  v749 = v56;
  _SBCallDescriptionBlockForEachVisibleAppLayoutByIndex(v56, v748);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_shouldUseBrightMaterialForIndex_);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v57, v58);

  v746[0] = MEMORY[0x1E0C809B0];
  v746[1] = 3221225472;
  v746[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_17;
  v746[3] = &unk_1E8EBE8E8;
  v59 = v56;
  v747 = v59;
  _SBCallDescriptionBlockForEachVisibleAppLayoutByIndex(v59, v746);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_cornerRadiiForIndex_);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v60, v61);

  v744[0] = MEMORY[0x1E0C809B0];
  v744[1] = 3221225472;
  v744[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_18;
  v744[3] = &unk_1E8EBE8E8;
  v62 = v59;
  v745 = v62;
  _SBCallDescriptionBlockForEachVisibleAppLayoutByIndex(v62, v744);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_maskedCornersForIndex_);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v63, v64);

  v742[0] = MEMORY[0x1E0C809B0];
  v742[1] = 3221225472;
  v742[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_19;
  v742[3] = &unk_1E8EBE8E8;
  v65 = v62;
  v743 = v65;
  _SBCallDescriptionBlockForEachVisibleAppLayoutByIndex(v65, v742);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isIndexRubberbandableForSwipeToKill_);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v66, v67);

  v740[0] = MEMORY[0x1E0C809B0];
  v740[1] = 3221225472;
  v740[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_20;
  v740[3] = &unk_1E8EBE8E8;
  v68 = v65;
  v741 = v68;
  _SBCallDescriptionBlockForEachVisibleAppLayoutByIndex(v68, v740);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_minimumTranslationToKillIndex_);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v69, v70);

  v738[0] = MEMORY[0x1E0C809B0];
  v738[1] = 3221225472;
  v738[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_21;
  v738[3] = &unk_1E8EBE8E8;
  v71 = v68;
  v739 = v71;
  _SBCallDescriptionBlockForEachVisibleAppLayoutByIndex(v71, v738);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_backgroundOpacityForIndex_);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v72, v73);

  v736[0] = MEMORY[0x1E0C809B0];
  v736[1] = 3221225472;
  v736[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_22;
  v736[3] = &unk_1E8EBE8E8;
  v74 = v71;
  v737 = v74;
  _SBCallDescriptionBlockForEachVisibleAppLayoutByIndex(v74, v736);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_clipsToBoundsAtIndex_);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v75, v76);

  v77 = v74;
  NSStringFromSelector(sel_clippingFrameForIndex_withBounds_);
  p = (Protocol *)objc_claimAutoreleasedReturnValue();
  v78 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v77, "visibleAppLayouts");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "appLayouts");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "methodSignatureForSelector:", sel_clippingFrameForIndex_withBounds_);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  if (v81)
  {
    *(_QWORD *)outCount = MEMORY[0x1E0C809B0];
    v781 = 3221225472;
    v782 = ___SBCallDescriptionBlockForEachVisibleAppLayoutByIndexWithBounds_block_invoke;
    v783 = &unk_1E8EBEC40;
    v784 = v79;
    v785 = v77;
    v786 = v81;
    v788 = &__block_literal_global_166;
    v789 = sel_clippingFrameForIndex_withBounds_;
    v82 = v78;
    v787 = v82;
    objc_msgSend(v80, "enumerateObjectsUsingBlock:", outCount);
    objc_msgSend(v82, "sb_switcherModifierDebugTimelineDescription");
    v83 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No context method for %@"), p);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
  }

  NSStringFromSelector(sel_clippingFrameForIndex_withBounds_);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v83, v84);

  v85 = v77;
  NSStringFromSelector(sel_clippingFrameForLayoutRole_inAppLayout_atIndex_withBounds_);
  pa = (Protocol *)objc_claimAutoreleasedReturnValue();
  v86 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v85, "visibleAppLayouts");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "appLayouts");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "methodSignatureForSelector:", sel_clippingFrameForLayoutRole_inAppLayout_atIndex_withBounds_);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  if (v89)
  {
    *(_QWORD *)outCount = MEMORY[0x1E0C809B0];
    v781 = 3221225472;
    v782 = ___SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayoutWithIndexAndBounds_block_invoke;
    v783 = &unk_1E8EBEC40;
    v784 = v87;
    v785 = v85;
    v786 = v89;
    v788 = &__block_literal_global_169_0;
    v789 = sel_clippingFrameForLayoutRole_inAppLayout_atIndex_withBounds_;
    v90 = v86;
    v787 = v90;
    objc_msgSend(v88, "enumerateObjectsUsingBlock:", outCount);
    objc_msgSend(v90, "sb_switcherModifierDebugTimelineDescription");
    v91 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No context method for %@"), pa);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
  }

  NSStringFromSelector(sel_clippingFrameForLayoutRole_inAppLayout_atIndex_withBounds_);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v91, v92);

  _SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayout(v85, sel_snapshotScaleForLayoutRole_inAppLayout_, &__block_literal_global_172_0);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_snapshotScaleForLayoutRole_inAppLayout_);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v93, v94);

  _SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayout(v85, sel_scaleForLayoutRole_inAppLayout_, &__block_literal_global_175_0);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_scaleForLayoutRole_inAppLayout_);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v95, v96);

  _SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayout(v85, sel_isLayoutRoleBlurred_inAppLayout_, &__block_literal_global_178);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isLayoutRoleBlurred_inAppLayout_);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v97, v98);

  _SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayout(v85, sel_blurDelayForLayoutRole_inAppLayout_, &__block_literal_global_181_0);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_blurDelayForLayoutRole_inAppLayout_);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v99, v100);

  _SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayout(v85, sel_blurTargetPreferenceForLayoutRole_inAppLayout_, &__block_literal_global_184_0);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_blurTargetPreferenceForLayoutRole_inAppLayout_);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v101, v102);

  _SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayout(v85, sel_dimmingAlphaForLayoutRole_inAppLayout_, &__block_literal_global_187_3);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_dimmingAlphaForLayoutRole_inAppLayout_);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v103, v104);

  _SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayout(v85, sel_shouldSuppressHighlightEffectForLayoutRole_inAppLayout_, &__block_literal_global_190);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_shouldSuppressHighlightEffectForLayoutRole_inAppLayout_);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v105, v106);

  _SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayout(v85, sel_isLayoutRoleMatchMovedToScene_inAppLayout_, &__block_literal_global_193_0);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isLayoutRoleMatchMovedToScene_inAppLayout_);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v107, v108);

  _SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayout(v85, sel_isLayoutRoleSelectable_inAppLayout_, &__block_literal_global_196);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isLayoutRoleSelectable_inAppLayout_);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v109, v110);

  _SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayout(v85, sel_isLayoutRoleDraggable_inAppLayout_, &__block_literal_global_199_1);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isLayoutRoleDraggable_inAppLayout_);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v111, v112);

  _SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayout(v85, sel_shouldUseNonuniformSnapshotScalingForLayoutRole_inAppLayout_, &__block_literal_global_202);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_shouldUseNonuniformSnapshotScalingForLayoutRole_inAppLayout_);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v113, v114);

  _SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayout(v85, sel_hiddenContentStatusBarPartsForLayoutRole_inAppLayout_, &__block_literal_global_205_0);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_hiddenContentStatusBarPartsForLayoutRole_inAppLayout_);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v115, v116);

  _SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayout(v85, sel_shadowStyleForLayoutRole_inAppLayout_, &__block_literal_global_208);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_shadowStyleForLayoutRole_inAppLayout_);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v117, v118);

  _SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayout(v85, sel_isItemResizingAllowedForLayoutRole_inAppLayout_, &__block_literal_global_211_0);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isItemResizingAllowedForLayoutRole_inAppLayout_);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v119, v120);

  _SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayout(v85, sel_shouldAllowContentViewTouchesForLayoutRole_inAppLayout_, &__block_literal_global_214_0);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_shouldAllowContentViewTouchesForLayoutRole_inAppLayout_);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v121, v122);

  _SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayoutAtIndex(v85, sel_opacityForLayoutRole_inAppLayout_atIndex_, &__block_literal_global_217_0);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_opacityForLayoutRole_inAppLayout_atIndex_);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v123, v124);

  _SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayoutAtIndex(v85, sel_isLayoutRoleKillable_inAppLayout_atIndex_, &__block_literal_global_220);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isLayoutRoleKillable_inAppLayout_atIndex_);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v125, v126);

  v127 = v85;
  NSStringFromSelector(sel_frameForLayoutRole_inAppLayout_withBounds_);
  pb = (Protocol *)objc_claimAutoreleasedReturnValue();
  v128 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v127, "visibleAppLayouts");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "appLayouts");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "methodSignatureForSelector:", sel_frameForLayoutRole_inAppLayout_withBounds_);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  if (v131)
  {
    *(_QWORD *)outCount = MEMORY[0x1E0C809B0];
    v781 = 3221225472;
    v782 = ___SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayoutWithBounds_block_invoke;
    v783 = &unk_1E8EBEC40;
    v784 = v129;
    v785 = v127;
    v786 = v131;
    v788 = &__block_literal_global_223_0;
    v789 = sel_frameForLayoutRole_inAppLayout_withBounds_;
    v132 = v128;
    v787 = v132;
    objc_msgSend(v130, "enumerateObjectsUsingBlock:", outCount);
    objc_msgSend(v132, "sb_switcherModifierDebugTimelineDescription");
    v133 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No context method for %@"), pb);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
  }

  NSStringFromSelector(sel_frameForLayoutRole_inAppLayout_withBounds_);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v133, v134);

  v734[0] = MEMORY[0x1E0C809B0];
  v734[1] = 3221225472;
  v734[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_43;
  v734[3] = &unk_1E8EBE8C0;
  v135 = v127;
  v735 = v135;
  _SBCallDescriptionBlockForEachVisibleAppLayout(v135, v734);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_animationAttributesForLayoutElement_);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v136, v137);

  v732[0] = MEMORY[0x1E0C809B0];
  v732[1] = 3221225472;
  v732[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_44;
  v732[3] = &unk_1E8EBE8C0;
  v138 = v135;
  v733 = v138;
  _SBCallDescriptionBlockForEachVisibleAppLayout(v138, v732);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_frameForIconOverlayInAppLayout_);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v139, v140);

  v730[0] = MEMORY[0x1E0C809B0];
  v730[1] = 3221225472;
  v730[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_45;
  v730[3] = &unk_1E8EBE8C0;
  v141 = v138;
  v731 = v141;
  _SBCallDescriptionBlockForEachVisibleAppLayout(v141, v730);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isFocusEnabledForAppLayout_);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v142, v143);

  v728[0] = MEMORY[0x1E0C809B0];
  v728[1] = 3221225472;
  v728[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_46;
  v728[3] = &unk_1E8EBE8C0;
  v144 = v141;
  v729 = v144;
  _SBCallDescriptionBlockForEachVisibleAppLayout(v144, v728);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_multipleWindowsIndicatorLayoutRoleMaskForAppLayout_);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v145, v146);

  v726[0] = MEMORY[0x1E0C809B0];
  v726[1] = 3221225472;
  v726[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_47;
  v726[3] = &unk_1E8EBE8C0;
  v147 = v144;
  v727 = v147;
  _SBCallDescriptionBlockForEachVisibleAppLayout(v147, v726);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_preferredSnapshotOrientationForAppLayout_);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v148, v149);

  v724[0] = MEMORY[0x1E0C809B0];
  v724[1] = 3221225472;
  v724[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_48;
  v724[3] = &unk_1E8EBE8C0;
  v150 = v147;
  v725 = v150;
  _SBCallDescriptionBlockForEachVisibleAppLayout(v150, v724);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_wantsSceneResizesHostedContextForAppLayout_);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v151, v152);

  v722[0] = MEMORY[0x1E0C809B0];
  v722[1] = 3221225472;
  v722[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_49;
  v722[3] = &unk_1E8EBE8C0;
  v153 = v150;
  v723 = v153;
  _SBCallDescriptionBlockForEachVisibleAppLayout(v153, v722);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_canSelectLeafWithModifierKeysInAppLayout_);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v154, v155);

  v720[0] = MEMORY[0x1E0C809B0];
  v720[1] = 3221225472;
  v720[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_50;
  v720[3] = &unk_1E8EBE8C0;
  v156 = v153;
  v721 = v156;
  _SBCallDescriptionBlockForEachVisibleAppLayout(v156, v720);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_shouldAllowGroupOpacityForAppLayout_);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v157, v158);

  v718[0] = MEMORY[0x1E0C809B0];
  v718[1] = 3221225472;
  v718[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_51;
  v718[3] = &unk_1E8EBE8C0;
  v159 = v156;
  v719 = v159;
  _SBCallDescriptionBlockForEachVisibleAppLayout(v159, v718);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_asyncRenderingAttributesForAppLayout_);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v160, v161);

  v716[0] = MEMORY[0x1E0C809B0];
  v716[1] = 3221225472;
  v716[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_52;
  v716[3] = &unk_1E8EA89D0;
  v162 = v159;
  v717 = v162;
  _SBCallDescriptionBlock(v716);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_contentViewScale);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v163, v164);

  v714[0] = MEMORY[0x1E0C809B0];
  v714[1] = 3221225472;
  v714[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_53;
  v714[3] = &unk_1E8EA89D0;
  v165 = v162;
  v715 = v165;
  _SBCallDescriptionBlock(v714);
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_homeScreenAlpha);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v166, v167);

  v712[0] = MEMORY[0x1E0C809B0];
  v712[1] = 3221225472;
  v712[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_54;
  v712[3] = &unk_1E8EA89D0;
  v168 = v165;
  v713 = v168;
  _SBCallDescriptionBlock(v712);
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_homeScreenBackdropBlurProgress);
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v169, v170);

  v710[0] = MEMORY[0x1E0C809B0];
  v710[1] = 3221225472;
  v710[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_55;
  v710[3] = &unk_1E8EA89D0;
  v171 = v168;
  v711 = v171;
  _SBCallDescriptionBlock(v710);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_homeScreenScale);
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v172, v173);

  v708[0] = MEMORY[0x1E0C809B0];
  v708[1] = 3221225472;
  v708[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_56;
  v708[3] = &unk_1E8EA89D0;
  v174 = v171;
  v709 = v174;
  _SBCallDescriptionBlock(v708);
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_wallpaperScale);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v175, v176);

  v706[0] = MEMORY[0x1E0C809B0];
  v706[1] = 3221225472;
  v706[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_57;
  v706[3] = &unk_1E8EA89D0;
  v177 = v174;
  v707 = v177;
  _SBCallDescriptionBlock(v706);
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_homeScreenDimmingAlpha);
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v178, v179);

  v704[0] = MEMORY[0x1E0C809B0];
  v704[1] = 3221225472;
  v704[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_58;
  v704[3] = &unk_1E8EA89D0;
  v180 = v177;
  v705 = v180;
  _SBCallDescriptionBlock(v704);
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_containerStatusBarAnimationDuration);
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v181, v182);

  v702[0] = MEMORY[0x1E0C809B0];
  v702[1] = 3221225472;
  v702[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_59;
  v702[3] = &unk_1E8EA89D0;
  v183 = v180;
  v703 = v183;
  _SBCallDescriptionBlock(v702);
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_hiddenContainerStatusBarParts);
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v184, v185);

  v700[0] = MEMORY[0x1E0C809B0];
  v700[1] = 3221225472;
  v700[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_60;
  v700[3] = &unk_1E8EA89D0;
  v186 = v183;
  v701 = v186;
  _SBCallDescriptionBlock(v700);
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_dockProgress);
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v187, v188);

  v698[0] = MEMORY[0x1E0C809B0];
  v698[1] = 3221225472;
  v698[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_61;
  v698[3] = &unk_1E8EA89D0;
  v189 = v186;
  v699 = v189;
  _SBCallDescriptionBlock(v698);
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_dockWindowLevelPriority);
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v190, v191);

  v696[0] = MEMORY[0x1E0C809B0];
  v696[1] = 3221225472;
  v696[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_62;
  v696[3] = &unk_1E8EA89D0;
  v192 = v189;
  v697 = v192;
  _SBCallDescriptionBlock(v696);
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_dockWindowLevel);
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v193, v194);

  v694[0] = MEMORY[0x1E0C809B0];
  v694[1] = 3221225472;
  v694[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_63;
  v694[3] = &unk_1E8EA89D0;
  v195 = v192;
  v695 = v195;
  _SBCallDescriptionBlock(v694);
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_shelfBackgroundBlurOpacity);
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v196, v197);

  v692[0] = MEMORY[0x1E0C809B0];
  v692[1] = 3221225472;
  v692[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_64;
  v692[3] = &unk_1E8EA89D0;
  v198 = v195;
  v693 = v198;
  _SBCallDescriptionBlock(v692);
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_shelfBackgroundBlurFrame);
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v199, v200);

  v690[0] = MEMORY[0x1E0C809B0];
  v690[1] = 3221225472;
  v690[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_65;
  v690[3] = &unk_1E8EA89D0;
  v201 = v198;
  v691 = v201;
  _SBCallDescriptionBlock(v690);
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_wantsSlideOverTongue);
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v202, v203);

  v688[0] = MEMORY[0x1E0C809B0];
  v688[1] = 3221225472;
  v688[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_66;
  v688[3] = &unk_1E8EA89D0;
  v204 = v201;
  v689 = v204;
  _SBCallDescriptionBlock(v688);
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_slideOverTongueState);
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v205, v206);

  v686[0] = MEMORY[0x1E0C809B0];
  v686[1] = 3221225472;
  v686[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_67;
  v686[3] = &unk_1E8EA89D0;
  v207 = v204;
  v687 = v207;
  _SBCallDescriptionBlock(v686);
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_slideOverTongueDirection);
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v208, v209);

  v684[0] = MEMORY[0x1E0C809B0];
  v684[1] = 3221225472;
  v684[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_68;
  v684[3] = &unk_1E8EA89D0;
  v210 = v207;
  v685 = v210;
  _SBCallDescriptionBlock(v684);
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_appLayoutToAttachSlideOverTongue);
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v211, v212);

  v682[0] = MEMORY[0x1E0C809B0];
  v682[1] = 3221225472;
  v682[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_69;
  v682[3] = &unk_1E8EA89D0;
  v213 = v210;
  v683 = v213;
  _SBCallDescriptionBlock(v682);
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isScrollEnabled);
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v214, v215);

  v680[0] = MEMORY[0x1E0C809B0];
  v680[1] = 3221225472;
  v680[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_70;
  v680[3] = &unk_1E8EA89D0;
  v216 = v213;
  v681 = v216;
  _SBCallDescriptionBlock(v680);
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_shouldScrollViewBlockTouches);
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v217, v218);

  v678[0] = MEMORY[0x1E0C809B0];
  v678[1] = 3221225472;
  v678[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_71;
  v678[3] = &unk_1E8EA89D0;
  v219 = v216;
  v679 = v219;
  _SBCallDescriptionBlock(v678);
  v220 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isContainerStatusBarVisible);
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v220, v221);

  v676[0] = MEMORY[0x1E0C809B0];
  v676[1] = 3221225472;
  v676[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_72;
  v676[3] = &unk_1E8EA89D0;
  v222 = v219;
  v677 = v222;
  _SBCallDescriptionBlock(v676);
  v223 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isWallpaperRequiredForSwitcher);
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v223, v224);

  v674[0] = MEMORY[0x1E0C809B0];
  v674[1] = 3221225472;
  v674[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_73;
  v674[3] = &unk_1E8EA89D0;
  v225 = v222;
  v675 = v225;
  _SBCallDescriptionBlock(v674);
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isHomeScreenContentRequired);
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v226, v227);

  v672[0] = MEMORY[0x1E0C809B0];
  v672[1] = 3221225472;
  v672[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_74;
  v672[3] = &unk_1E8EA89D0;
  v228 = v225;
  v673 = v228;
  _SBCallDescriptionBlock(v672);
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isSwitcherWindowVisible);
  v230 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v229, v230);

  v670[0] = MEMORY[0x1E0C809B0];
  v670[1] = 3221225472;
  v670[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_75;
  v670[3] = &unk_1E8EA89D0;
  v231 = v228;
  v671 = v231;
  _SBCallDescriptionBlock(v670);
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isSwitcherWindowUserInteractionEnabled);
  v233 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v232, v233);

  v668[0] = MEMORY[0x1E0C809B0];
  v668[1] = 3221225472;
  v668[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_76;
  v668[3] = &unk_1E8EA89D0;
  v234 = v231;
  v669 = v234;
  _SBCallDescriptionBlock(v668);
  v235 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_shouldAcceleratedHomeButtonPressBegin);
  v236 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v235, v236);

  v666[0] = MEMORY[0x1E0C809B0];
  v666[1] = 3221225472;
  v666[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_77;
  v666[3] = &unk_1E8EA89D0;
  v237 = v234;
  v667 = v237;
  _SBCallDescriptionBlock(v666);
  v238 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_shouldFireTransitionCompletionInDefaultRunLoopMode);
  v239 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v238, v239);

  v664[0] = MEMORY[0x1E0C809B0];
  v664[1] = 3221225472;
  v664[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_78;
  v664[3] = &unk_1E8EA89D0;
  v240 = v237;
  v665 = v240;
  _SBCallDescriptionBlock(v664);
  v241 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_wantsDockBehaviorAssertion);
  v242 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v241, v242);

  v662[0] = MEMORY[0x1E0C809B0];
  v662[1] = 3221225472;
  v662[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_79;
  v662[3] = &unk_1E8EA89D0;
  v243 = v240;
  v663 = v243;
  _SBCallDescriptionBlock(v662);
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_wantsDockWindowLevelAssertion);
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v244, v245);

  v660[0] = MEMORY[0x1E0C809B0];
  v660[1] = 3221225472;
  v660[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_80;
  v660[3] = &unk_1E8EA89D0;
  v246 = v243;
  v661 = v246;
  _SBCallDescriptionBlock(v660);
  v247 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_wantsAsynchronousSurfaceRetentionAssertion);
  v248 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v247, v248);

  v658[0] = MEMORY[0x1E0C809B0];
  v658[1] = 3221225472;
  v658[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_81;
  v658[3] = &unk_1E8EA89D0;
  v249 = v246;
  v659 = v249;
  _SBCallDescriptionBlock(v658);
  v250 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isItemContainerPointerInteractionEnabled);
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v250, v251);

  v656[0] = MEMORY[0x1E0C809B0];
  v656[1] = 3221225472;
  v656[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_82;
  v656[3] = &unk_1E8EA89D0;
  v252 = v249;
  v657 = v252;
  _SBCallDescriptionBlock(v656);
  v253 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_shouldRubberbandFullScreenHomeGrabberView);
  v254 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v253, v254);

  v654[0] = MEMORY[0x1E0C809B0];
  v654[1] = 3221225472;
  v654[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_83;
  v654[3] = &unk_1E8EA89D0;
  v255 = v252;
  v655 = v255;
  _SBCallDescriptionBlock(v654);
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_wallpaperStyle);
  v257 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v256, v257);

  v652[0] = MEMORY[0x1E0C809B0];
  v652[1] = 3221225472;
  v652[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_84;
  v652[3] = &unk_1E8EA89D0;
  v258 = v255;
  v653 = v258;
  _SBCallDescriptionBlock(v652);
  v259 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_homeScreenBackdropBlurType);
  v260 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v259, v260);

  v650[0] = MEMORY[0x1E0C809B0];
  v650[1] = 3221225472;
  v650[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_85;
  v650[3] = &unk_1E8EA89D0;
  v261 = v258;
  v651 = v261;
  _SBCallDescriptionBlock(v650);
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_dockUpdateMode);
  v263 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v262, v263);

  v648[0] = MEMORY[0x1E0C809B0];
  v648[1] = 3221225472;
  v648[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_86;
  v648[3] = &unk_1E8EA89D0;
  v264 = v261;
  v649 = v264;
  _SBCallDescriptionBlock(v648);
  v265 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_appLayoutToScrollToBeforeTransitioning);
  v266 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v265, v266);

  v646[0] = MEMORY[0x1E0C809B0];
  v646[1] = 3221225472;
  v646[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_87;
  v646[3] = &unk_1E8EA89D0;
  v267 = v264;
  v647 = v267;
  _SBCallDescriptionBlock(v646);
  v268 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_appLayoutToScrollToBeforeReopeningClosedWindows);
  v269 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v268, v269);

  v644[0] = MEMORY[0x1E0C809B0];
  v644[1] = 3221225472;
  v644[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_88;
  v644[3] = &unk_1E8EA89D0;
  v270 = v267;
  v645 = v270;
  _SBCallDescriptionBlock(v644);
  v271 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_topMostLayoutElements);
  v272 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v271, v272);

  v642[0] = MEMORY[0x1E0C809B0];
  v642[1] = 3221225472;
  v642[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_89;
  v642[3] = &unk_1E8EA89D0;
  v273 = v270;
  v643 = v273;
  _SBCallDescriptionBlock(v642);
  v274 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_appLayoutsToCacheSnapshots);
  v275 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v274, v275);

  v640[0] = MEMORY[0x1E0C809B0];
  v640[1] = 3221225472;
  v640[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_90;
  v640[3] = &unk_1E8EA89D0;
  v276 = v273;
  v641 = v276;
  _SBCallDescriptionBlock(v640);
  v277 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_appLayoutsToCacheFullsizeSnapshots);
  v278 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v277, v278);

  v638[0] = MEMORY[0x1E0C809B0];
  v638[1] = 3221225472;
  v638[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_91;
  v638[3] = &unk_1E8EA89D0;
  v279 = v276;
  v639 = v279;
  _SBCallDescriptionBlock(v638);
  v280 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_appLayoutsToResignActive);
  v281 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v280, v281);

  v636[0] = MEMORY[0x1E0C809B0];
  v636[1] = 3221225472;
  v636[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_92;
  v636[3] = &unk_1E8EA89D0;
  v282 = v279;
  v637 = v282;
  _SBCallDescriptionBlock(v636);
  v283 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_keyboardSuppressionMode);
  v284 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v283, v284);

  v634[0] = MEMORY[0x1E0C809B0];
  v634[1] = 3221225472;
  v634[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_93;
  v634[3] = &unk_1E8EA89D0;
  v285 = v282;
  v635 = v285;
  _SBCallDescriptionBlock(v634);
  v286 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_keyboardFocusedAppLayout);
  v287 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v286, v287);

  v632[0] = MEMORY[0x1E0C809B0];
  v632[1] = 3221225472;
  v632[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_94;
  v632[3] = &unk_1E8EA89D0;
  v288 = v285;
  v633 = v288;
  _SBCallDescriptionBlock(v632);
  v289 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_leafAppLayoutForKeyboardFocusedScene);
  v290 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v289, v290);

  v630[0] = MEMORY[0x1E0C809B0];
  v630[1] = 3221225472;
  v630[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_95;
  v630[3] = &unk_1E8EA89D0;
  v291 = v288;
  v631 = v291;
  _SBCallDescriptionBlock(v630);
  v292 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_shelfFocusedDisplayItems);
  v293 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v292, v293);

  v628[0] = MEMORY[0x1E0C809B0];
  v628[1] = 3221225472;
  v628[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_96;
  v628[3] = &unk_1E8EA89D0;
  v294 = v291;
  v629 = v294;
  _SBCallDescriptionBlock(v628);
  v295 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_activeLeafAppLayoutsReachableByKeyboardShortcut);
  v296 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v295, v296);

  v626[0] = MEMORY[0x1E0C809B0];
  v626[1] = 3221225472;
  v626[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_97;
  v626[3] = &unk_1E8EA89D0;
  v297 = v294;
  v627 = v297;
  _SBCallDescriptionBlock(v626);
  v298 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_inactiveAppLayoutsReachableByKeyboardShortcut);
  v299 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v298, v299);

  v624[0] = MEMORY[0x1E0C809B0];
  v624[1] = 3221225472;
  v624[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_98;
  v624[3] = &unk_1E8EBE8C0;
  v300 = v297;
  v625 = v300;
  _SBCallDescriptionBlockForEachVisibleAppLayout(v300, v624);
  v301 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isHomeAffordanceSupportedForAppLayout_);
  v302 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v301, v302);

  v622[0] = MEMORY[0x1E0C809B0];
  v622[1] = 3221225472;
  v622[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_99;
  v622[3] = &unk_1E8EA89D0;
  v303 = v300;
  v623 = v303;
  _SBCallDescriptionBlock(v622);
  v304 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_visibleHomeAffordanceLayoutElements);
  v305 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v304, v305);

  v620[0] = MEMORY[0x1E0C809B0];
  v620[1] = 3221225472;
  v620[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_100;
  v620[3] = &unk_1E8EBE8C0;
  v306 = v303;
  v621 = v306;
  _SBCallDescriptionBlockForEachVisibleAppLayout(v306, v620);
  v307 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_shouldAccessoryDrawShadowForAppLayout_);
  v308 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v307, v308);

  v618[0] = MEMORY[0x1E0C809B0];
  v618[1] = 3221225472;
  v618[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_101;
  v618[3] = &unk_1E8EBE8C0;
  v309 = v306;
  v619 = v309;
  _SBCallDescriptionBlockForEachVisibleAppLayout(v309, v618);
  v310 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isResizeGrabberVisibleForAppLayout_);
  v311 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v310, v311);

  v616[0] = MEMORY[0x1E0C809B0];
  v616[1] = 3221225472;
  v616[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_102;
  v616[3] = &unk_1E8EA89D0;
  v312 = v309;
  v617 = v312;
  _SBCallDescriptionBlock(v616);
  v313 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_visibleShelves);
  v314 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v313, v314);

  v614[0] = MEMORY[0x1E0C809B0];
  v614[1] = 3221225472;
  v614[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_103;
  v614[3] = &unk_1E8EBEBB0;
  v315 = v312;
  v615 = v315;
  _SBCallDescriptionBlockForEachShelf(v315, v614);
  v316 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_containerLeafAppLayoutForShelf_);
  v317 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v316, v317);

  v612[0] = MEMORY[0x1E0C809B0];
  v612[1] = 3221225472;
  v612[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_104;
  v612[3] = &unk_1E8EBEBB0;
  v318 = v315;
  v613 = v318;
  _SBCallDescriptionBlockForEachShelf(v318, v612);
  v319 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_frameForShelf_);
  v320 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v319, v320);

  v610[0] = MEMORY[0x1E0C809B0];
  v610[1] = 3221225472;
  v610[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_105;
  v610[3] = &unk_1E8EBEBB0;
  v321 = v318;
  v611 = v321;
  _SBCallDescriptionBlockForEachShelf(v321, v610);
  v322 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_presentationAttributesForShelf_);
  v323 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v322, v323);

  v608[0] = MEMORY[0x1E0C809B0];
  v608[1] = 3221225472;
  v608[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_106;
  v608[3] = &unk_1E8EBEBB0;
  v324 = v321;
  v609 = v324;
  _SBCallDescriptionBlockForEachShelf(v324, v608);
  v325 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_focusedAppLayoutForShelf_);
  v326 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v325, v326);

  v606[0] = MEMORY[0x1E0C809B0];
  v606[1] = 3221225472;
  v606[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_107;
  v606[3] = &unk_1E8EBEBB0;
  v327 = v324;
  v607 = v327;
  _SBCallDescriptionBlockForEachShelf(v327, v606);
  v328 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_ignoredDisplayItemsForShelf_);
  v329 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v328, v329);

  v604[0] = MEMORY[0x1E0C809B0];
  v604[1] = 3221225472;
  v604[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_108;
  v604[3] = &unk_1E8EBEBB0;
  v330 = v327;
  v605 = v330;
  _SBCallDescriptionBlockForEachShelf(v330, v604);
  v331 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_hiddenAppLayoutsInShelf_);
  v332 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v331, v332);

  v602[0] = MEMORY[0x1E0C809B0];
  v602[1] = 3221225472;
  v602[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_109;
  v602[3] = &unk_1E8EA89D0;
  v333 = v330;
  v603 = v333;
  _SBCallDescriptionBlock(v602);
  v334 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_animatablePropertyIdentifiers);
  v335 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v334, v335);

  v600[0] = MEMORY[0x1E0C809B0];
  v600[1] = 3221225472;
  v600[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_110;
  v600[3] = &unk_1E8EA89D0;
  v336 = v333;
  v601 = v336;
  _SBCallDescriptionBlock(v600);
  v337 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_appExposeAccessoryButtonsBundleIdentifier);
  v338 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v337, v338);

  v598[0] = MEMORY[0x1E0C809B0];
  v598[1] = 3221225472;
  v598[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_111;
  v598[3] = &unk_1E8EA89D0;
  v339 = v336;
  v599 = v339;
  _SBCallDescriptionBlock(v598);
  v340 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_plusButtonAlpha);
  v341 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v340, v341);

  v596[0] = MEMORY[0x1E0C809B0];
  v596[1] = 3221225472;
  v596[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_112;
  v596[3] = &unk_1E8EA89D0;
  v342 = v339;
  v597 = v342;
  _SBCallDescriptionBlock(v596);
  v343 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_reopenClosedWindowsButtonAlpha);
  v344 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v343, v344);

  v594[0] = MEMORY[0x1E0C809B0];
  v594[1] = 3221225472;
  v594[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_113;
  v594[3] = &unk_1E8EA89D0;
  v345 = v342;
  v595 = v345;
  _SBCallDescriptionBlock(v594);
  v346 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_reopenClosedWindowsButtonScale);
  v347 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v346, v347);

  v592[0] = MEMORY[0x1E0C809B0];
  v592[1] = 3221225472;
  v592[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_114;
  v592[3] = &unk_1E8EA89D0;
  v348 = v345;
  v593 = v348;
  _SBCallDescriptionBlock(v592);
  v349 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_appExposeAccessoryButtonsOverrideUserInterfaceStyle);
  v350 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v349, v350);

  v590[0] = MEMORY[0x1E0C809B0];
  v590[1] = 3221225472;
  v590[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_115;
  v590[3] = &unk_1E8EA89D0;
  v351 = v348;
  v591 = v351;
  _SBCallDescriptionBlock(v590);
  v352 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_plusButtonStyle);
  v353 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v352, v353);

  v588[0] = MEMORY[0x1E0C809B0];
  v588[1] = 3221225472;
  v588[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_116;
  v588[3] = &unk_1E8EBE8C0;
  v354 = v351;
  v589 = v354;
  _SBCallDescriptionBlockForEachVisibleAppLayout(v354, v588);
  v355 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_perspectiveAngleForAppLayout_);
  v356 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v355, v356);

  v586[0] = MEMORY[0x1E0C809B0];
  v586[1] = 3221225472;
  v586[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_117;
  v586[3] = &unk_1E8EA89D0;
  v357 = v354;
  v587 = v357;
  _SBCallDescriptionBlock(v586);
  v358 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_wantsContinuousExposeHoverGesture);
  v359 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v358, v359);

  v584[0] = MEMORY[0x1E0C809B0];
  v584[1] = 3221225472;
  v584[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_118;
  v584[3] = &unk_1E8EA89D0;
  v360 = v357;
  v585 = v360;
  _SBCallDescriptionBlock(v584);
  v361 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isContinuousExposeStripVisible);
  v362 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v361, v362);

  v582[0] = MEMORY[0x1E0C809B0];
  v582[1] = 3221225472;
  v582[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_119;
  v582[3] = &unk_1E8EA89D0;
  v363 = v360;
  v583 = v363;
  _SBCallDescriptionBlock(v582);
  v364 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_wantsContinuousExposeHoverGesture);
  v365 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v364, v365);

  v580[0] = MEMORY[0x1E0C809B0];
  v580[1] = 3221225472;
  v580[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_120;
  v580[3] = &unk_1E8EA89D0;
  v366 = v363;
  v581 = v366;
  _SBCallDescriptionBlock(v580);
  v367 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_continuousExposeStripTongueAttributes);
  v368 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v367, v368);

  objc_storeStrong((id *)(v505 + 24), obj);
  v369 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v370 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v371 = (id)objc_msgSend((id)objc_opt_class(), "baseClassForQueryProtocol");
  outCount[0] = 0;
  +[SBSwitcherModifier queryProtocol](SBSwitcherModifier, "queryProtocol");
  v372 = objc_claimAutoreleasedReturnValue();
  if (v372)
  {
    v373 = (Protocol *)v372;
    v374 = &selRef__noteCoverSheetDidDismiss;
    while (1)
    {
      pc = v373;
      if (protocol_isEqual(v373, (Protocol *)v374[445]))
        break;
      v375 = protocol_copyMethodDescriptionList(pc, 1, 1, outCount);
      v376 = v375;
      if (outCount[0])
      {
        v377 = 0;
        v378 = v375;
        do
        {
          name = v378->name;
          v380 = objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", v378->name);
          v381 = objc_msgSend(v371, "instanceMethodForSelector:", name);
          NSStringFromSelector(name);
          v382 = (void *)objc_claimAutoreleasedReturnValue();
          if (v380 == v381 || v380 == 0)
            v384 = v370;
          else
            v384 = v369;
          objc_msgSend(v384, "addObject:", v382);

          ++v377;
          ++v378;
        }
        while (v377 < outCount[0]);
      }
      free(v376);
      v579 = 0;
      v385 = protocol_copyProtocolList(pc, &v579);
      if (!v579)
      {

        goto LABEL_28;
      }
      v386 = (id *)v385;
      if (v579 != 1)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v388 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v388, "handleFailureInMethod:object:file:lineNumber:description:", v503, v505, CFSTR("SBSwitcherModifierTimelineEntry.m"), 851, CFSTR("Multiple sub protocols not currently supported"));

      }
      v387 = (Protocol *)*v386;

      free(v386);
      v373 = v387;
      v374 = &selRef__noteCoverSheetDidDismiss;
      if (!v387)
        goto LABEL_28;
    }
  }
  else
  {
LABEL_28:
    pc = 0;
  }
  objc_msgSend(v369, "sortUsingSelector:");
  objc_msgSend(v370, "sortUsingSelector:", sel_compare_);
  v389 = *(void **)(v505 + 8);
  *(_QWORD *)(v505 + 8) = v369;
  v502 = v369;

  v390 = *(void **)(v505 + 16);
  *(_QWORD *)(v505 + 16) = v370;
  v501 = v370;

  v391 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v577[0] = MEMORY[0x1E0C809B0];
  v577[1] = 3221225472;
  v577[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_121;
  v577[3] = &unk_1E8EA89D0;
  v392 = v366;
  v578 = v392;
  _SBCallDescriptionBlock(v577);
  v393 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_appLayouts);
  v394 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v391, "setObject:forKey:", v393, v394);

  v575[0] = MEMORY[0x1E0C809B0];
  v575[1] = 3221225472;
  v575[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_122;
  v575[3] = &unk_1E8EA89D0;
  v395 = v392;
  v576 = v395;
  _SBCallDescriptionBlock(v575);
  v396 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_appLayoutsGenerationCount);
  v397 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v391, "setObject:forKey:", v396, v397);

  v573[0] = MEMORY[0x1E0C809B0];
  v573[1] = 3221225472;
  v573[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_123;
  v573[3] = &unk_1E8EA89D0;
  v398 = v395;
  v574 = v398;
  _SBCallDescriptionBlock(v573);
  v399 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_continuousExposeIdentifiersInStrip);
  v400 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v391, "setObject:forKey:", v399, v400);

  v571[0] = MEMORY[0x1E0C809B0];
  v571[1] = 3221225472;
  v571[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_124;
  v571[3] = &unk_1E8EA89D0;
  v401 = v398;
  v572 = v401;
  _SBCallDescriptionBlock(v571);
  v402 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_continuousExposeIdentifiersInSwitcher);
  v403 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v391, "setObject:forKey:", v402, v403);

  v569[0] = MEMORY[0x1E0C809B0];
  v569[1] = 3221225472;
  v569[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_125;
  v569[3] = &unk_1E8EA89D0;
  v404 = v401;
  v570 = v404;
  _SBCallDescriptionBlock(v569);
  v405 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_containerViewBounds);
  v406 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v391, "setObject:forKey:", v405, v406);

  v567[0] = MEMORY[0x1E0C809B0];
  v567[1] = 3221225472;
  v567[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_126;
  v567[3] = &unk_1E8EA89D0;
  v407 = v404;
  v568 = v407;
  _SBCallDescriptionBlock(v567);
  v408 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_switcherViewBounds);
  v409 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v391, "setObject:forKey:", v408, v409);

  v565[0] = MEMORY[0x1E0C809B0];
  v565[1] = 3221225472;
  v565[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_127;
  v565[3] = &unk_1E8EA89D0;
  v410 = v407;
  v566 = v410;
  _SBCallDescriptionBlock(v565);
  v411 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isDevicePad);
  v412 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v391, "setObject:forKey:", v411, v412);

  v563[0] = MEMORY[0x1E0C809B0];
  v563[1] = 3221225472;
  v563[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_128;
  v563[3] = &unk_1E8EA89D0;
  v413 = v410;
  v564 = v413;
  _SBCallDescriptionBlock(v563);
  v414 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_hasHomeButton);
  v415 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v391, "setObject:forKey:", v414, v415);

  v561[0] = MEMORY[0x1E0C809B0];
  v561[1] = 3221225472;
  v561[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_129;
  v561[3] = &unk_1E8EA89D0;
  v416 = v413;
  v562 = v416;
  _SBCallDescriptionBlock(v561);
  v417 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isChamoisWindowingUIEnabled);
  v418 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v391, "setObject:forKey:", v417, v418);

  v559[0] = MEMORY[0x1E0C809B0];
  v559[1] = 3221225472;
  v559[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_130;
  v559[3] = &unk_1E8EA89D0;
  v419 = v416;
  v560 = v419;
  _SBCallDescriptionBlock(v559);
  v420 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isReduceMotionEnabled);
  v421 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v391, "setObject:forKey:", v420, v421);

  v557[0] = MEMORY[0x1E0C809B0];
  v557[1] = 3221225472;
  v557[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_131;
  v557[3] = &unk_1E8EA89D0;
  v422 = v419;
  v558 = v422;
  _SBCallDescriptionBlock(v557);
  v423 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isRTLEnabled);
  v424 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v391, "setObject:forKey:", v423, v424);

  v555[0] = MEMORY[0x1E0C809B0];
  v555[1] = 3221225472;
  v555[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_132;
  v555[3] = &unk_1E8EA89D0;
  v425 = v422;
  v556 = v425;
  _SBCallDescriptionBlock(v555);
  v426 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isFloatingDockSupported);
  v427 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v391, "setObject:forKey:", v426, v427);

  v553[0] = MEMORY[0x1E0C809B0];
  v553[1] = 3221225472;
  v553[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_133;
  v553[3] = &unk_1E8EA89D0;
  v428 = v425;
  v554 = v428;
  _SBCallDescriptionBlock(v553);
  v429 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isStudyLogEnabled);
  v430 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v391, "setObject:forKey:", v429, v430);

  v551[0] = MEMORY[0x1E0C809B0];
  v551[1] = 3221225472;
  v551[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_134;
  v551[3] = &unk_1E8EA89D0;
  v431 = v428;
  v552 = v431;
  _SBCallDescriptionBlock(v551);
  v432 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isMedusaCapable);
  v433 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v391, "setObject:forKey:", v432, v433);

  v549[0] = MEMORY[0x1E0C809B0];
  v549[1] = 3221225472;
  v549[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_135;
  v549[3] = &unk_1E8EA89D0;
  v434 = v431;
  v550 = v434;
  _SBCallDescriptionBlock(v549);
  v435 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isSplitViewSupported);
  v436 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v391, "setObject:forKey:", v435, v436);

  v547[0] = MEMORY[0x1E0C809B0];
  v547[1] = 3221225472;
  v547[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_136;
  v547[3] = &unk_1E8EA89D0;
  v437 = v434;
  v548 = v437;
  _SBCallDescriptionBlock(v547);
  v438 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isInMedusaCapableSpace);
  v439 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v391, "setObject:forKey:", v438, v439);

  v545[0] = MEMORY[0x1E0C809B0];
  v545[1] = 3221225472;
  v545[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_137;
  v545[3] = &unk_1E8EA89D0;
  v440 = v437;
  v546 = v440;
  _SBCallDescriptionBlock(v545);
  v441 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_prefersStripHidden);
  v442 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v391, "setObject:forKey:", v441, v442);

  v543[0] = MEMORY[0x1E0C809B0];
  v543[1] = 3221225472;
  v543[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_138;
  v543[3] = &unk_1E8EA89D0;
  v443 = v440;
  v544 = v443;
  _SBCallDescriptionBlock(v543);
  v444 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_prefersDockHidden);
  v445 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v391, "setObject:forKey:", v444, v445);

  v541[0] = MEMORY[0x1E0C809B0];
  v541[1] = 3221225472;
  v541[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_139;
  v541[3] = &unk_1E8EA89D0;
  v446 = v443;
  v542 = v446;
  _SBCallDescriptionBlock(v541);
  v447 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isSoftwareKeyboardVisible);
  v448 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v391, "setObject:forKey:", v447, v448);

  v539[0] = MEMORY[0x1E0C809B0];
  v539[1] = 3221225472;
  v539[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_140;
  v539[3] = &unk_1E8EA89D0;
  v449 = v446;
  v540 = v449;
  _SBCallDescriptionBlock(v539);
  v450 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isDisplayEmbedded);
  v451 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v391, "setObject:forKey:", v450, v451);

  v537[0] = MEMORY[0x1E0C809B0];
  v537[1] = 3221225472;
  v537[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_141;
  v537[3] = &unk_1E8EBE8C0;
  v452 = v449;
  v538 = v452;
  _SBCallDescriptionBlockForEachVisibleAppLayout(v452, v537);
  v453 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_appLayoutContainsOnlyResizableApps_);
  v454 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v391, "setObject:forKey:", v453, v454);

  v535[0] = MEMORY[0x1E0C809B0];
  v535[1] = 3221225472;
  v535[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_142;
  v535[3] = &unk_1E8EBE8C0;
  v455 = v452;
  v536 = v455;
  _SBCallDescriptionBlockForEachVisibleAppLayout(v455, v535);
  v456 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_appLayoutContainsAnUnoccludedMaximizedDisplayItem_);
  v457 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v391, "setObject:forKey:", v456, v457);

  v533[0] = MEMORY[0x1E0C809B0];
  v533[1] = 3221225472;
  v533[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_143;
  v533[3] = &unk_1E8EBE8C0;
  v458 = v455;
  v534 = v458;
  _SBCallDescriptionBlockForEachVisibleAppLayout(v458, v533);
  v459 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_homeScreenIconFrameForAppLayout_);
  v460 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v391, "setObject:forKey:", v459, v460);

  v531[0] = MEMORY[0x1E0C809B0];
  v531[1] = 3221225472;
  v531[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_144;
  v531[3] = &unk_1E8EBE8C0;
  v461 = v458;
  v532 = v461;
  _SBCallDescriptionBlockForEachVisibleAppLayout(v461, v531);
  v462 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_homeScreenIconScaleForAppLayout_);
  v463 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v391, "setObject:forKey:", v462, v463);

  v529[0] = MEMORY[0x1E0C809B0];
  v529[1] = 3221225472;
  v529[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_145;
  v529[3] = &unk_1E8EBE8C0;
  v464 = v461;
  v530 = v464;
  _SBCallDescriptionBlockForEachVisibleAppLayout(v464, v529);
  v465 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_homeScreenIconCornerRadiusForAppLayout_);
  v466 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v391, "setObject:forKey:", v465, v466);

  v527[0] = MEMORY[0x1E0C809B0];
  v527[1] = 3221225472;
  v527[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_146;
  v527[3] = &unk_1E8EBE8C0;
  v467 = v464;
  v528 = v467;
  _SBCallDescriptionBlockForEachVisibleAppLayout(v467, v527);
  v468 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_homeScreenIconLocationForAppLayout_);
  v469 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v391, "setObject:forKey:", v468, v469);

  v525[0] = MEMORY[0x1E0C809B0];
  v525[1] = 3221225472;
  v525[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_147;
  v525[3] = &unk_1E8EBE8C0;
  v470 = v467;
  v526 = v470;
  _SBCallDescriptionBlockForEachVisibleAppLayout(v470, v525);
  v471 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_homeScreenIconGridSizeClassForAppLayout_);
  v472 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v391, "setObject:forKey:", v471, v472);

  v523[0] = MEMORY[0x1E0C809B0];
  v523[1] = 3221225472;
  v523[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_148;
  v523[3] = &unk_1E8EBE8C0;
  v473 = v470;
  v524 = v473;
  _SBCallDescriptionBlockForEachVisibleAppLayout(v473, v523);
  v474 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_itemContainerForAppLayoutOverlapsFloatingDock_);
  v475 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v391, "setObject:forKey:", v474, v475);

  v521[0] = MEMORY[0x1E0C809B0];
  v521[1] = 3221225472;
  v521[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_149;
  v521[3] = &unk_1E8EA89D0;
  v476 = v473;
  v522 = v476;
  _SBCallDescriptionBlock(v521);
  v477 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_keyboardFocusedAppLayout);
  v478 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v391, "setObject:forKey:", v477, v478);

  v519[0] = MEMORY[0x1E0C809B0];
  v519[1] = 3221225472;
  v519[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_150;
  v519[3] = &unk_1E8EA89D0;
  v479 = v476;
  v520 = v479;
  _SBCallDescriptionBlock(v519);
  v480 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_leafAppLayoutForKeyboardFocusedScene);
  v481 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v391, "setObject:forKey:", v480, v481);

  v517[0] = MEMORY[0x1E0C809B0];
  v517[1] = 3221225472;
  v517[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_151;
  v517[3] = &unk_1E8EA89D0;
  v482 = v479;
  v518 = v482;
  _SBCallDescriptionBlock(v517);
  v483 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_shelfFocusedDisplayItems);
  v484 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v391, "setObject:forKey:", v483, v484);

  v515[0] = MEMORY[0x1E0C809B0];
  v515[1] = 3221225472;
  v515[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_152;
  v515[3] = &unk_1E8EA89D0;
  v485 = v482;
  v516 = v485;
  _SBCallDescriptionBlock(v515);
  v486 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_userInterfaceStyle);
  v487 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v391, "setObject:forKey:", v486, v487);

  v513[0] = MEMORY[0x1E0C809B0];
  v513[1] = 3221225472;
  v513[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_153;
  v513[3] = &unk_1E8EA89D0;
  v488 = v485;
  v514 = v488;
  _SBCallDescriptionBlock(v513);
  v489 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_draggingAppLayoutsForWindowDrag);
  v490 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v391, "setObject:forKey:", v489, v490);

  v511[0] = MEMORY[0x1E0C809B0];
  v511[1] = 3221225472;
  v511[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_154;
  v511[3] = &unk_1E8EA89D0;
  v512 = v488;
  v491 = v488;
  _SBCallDescriptionBlock(v511);
  v492 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_proposedAppLayoutsForWindowDrag);
  v493 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v391, "setObject:forKey:", v492, v493);

  _SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayout(v491, sel_isLayoutRoleContentReady_inAppLayout_, &__block_literal_global_489);
  v494 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isLayoutRoleContentReady_inAppLayout_);
  v495 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v391, "setObject:forKey:", v494, v495);

  v496 = *(void **)(v505 + 40);
  *(_QWORD *)(v505 + 40) = v391;
  v497 = v391;

  objc_msgSend(v497, "allKeys");
  v498 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v498, "sortedArrayUsingSelector:", sel_compare_);
  v499 = objc_claimAutoreleasedReturnValue();
  v500 = *(void **)(v505 + 32);
  *(_QWORD *)(v505 + 32) = v499;

}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke(uint64_t a1)
{
  void *v1;
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(*(id *)(a1 + 32), "visibleAppLayouts");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("nil");
  v4 = v2;

  return v4;
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_2(uint64_t a1)
{
  void *v1;
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(*(id *)(a1 + 32), "foregroundAppLayouts");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("nil");
  v4 = v2;

  return v4;
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_3(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "activityModeForAppLayout:", a2);
  return NSStringFromFBSSceneActivityMode();
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[4];

  v2 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(*(id *)(a1 + 32), "frameForIndex:", a2);
  v10[0] = v3;
  v10[1] = v4;
  v10[2] = v5;
  v10[3] = v6;
  objc_msgSend(v2, "valueWithBytes:objCType:", v10, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "scaleForIndex:", a2);
  objc_msgSend(v2, "numberWithDouble:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

NSString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_6(uint64_t a1, uint64_t a2)
{
  CGPoint v3;

  objc_msgSend(*(id *)(a1 + 32), "anchorPointForIndex:", a2);
  return NSStringFromCGPoint(v3);
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_7(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "shouldPinLayoutRolesToSpace:", a2);
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_8(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "shouldUseAnchorPointToPinLayoutRolesToSpace:", a2);
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_9(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "clipsToUnobscuredMarginAtIndex:", a2);
  return NSStringFromBOOL();
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_10(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "visibleMarginForItemContainerAtIndex:", a2);
  objc_msgSend(v2, "numberWithDouble:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_11(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "wallpaperOverlayAlphaForIndex:", a2);
  objc_msgSend(v2, "numberWithDouble:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_12(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "lighteningAlphaForIndex:", a2);
  objc_msgSend(v2, "numberWithDouble:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_13(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "headerStyleForIndex:", a2));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_14(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "titleOpacityForIndex:", a2);
  objc_msgSend(v2, "numberWithDouble:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_15(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "isContentStatusBarVisibleForIndex:", a2);
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_16(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "shouldUseBrightMaterialForIndex:", a2);
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_17(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "cornerRadiiForIndex:", a2);
  return SBStringFromRectCornerRadii();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_18(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "maskedCornersForIndex:", a2);
  return SBStringFromCornerMask();
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_19(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isIndexRubberbandableForSwipeToKill:", a2));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_20(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "minimumTranslationToKillIndex:", a2);
  objc_msgSend(v2, "numberWithDouble:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_21(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "backgroundOpacityForIndex:", a2);
  objc_msgSend(v2, "numberWithDouble:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_22(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "clipsToBoundsAtIndex:", a2);
  return NSStringFromBOOL();
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_23(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _OWORD v5[2];
  __int128 v6;
  __int128 v7;

  v6 = 0u;
  v7 = 0u;
  objc_msgSend(a2, "getReturnValue:", &v6);
  v5[0] = v6;
  v5[1] = v7;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v5, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_24(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _OWORD v5[2];
  __int128 v6;
  __int128 v7;

  v6 = 0u;
  v7 = 0u;
  objc_msgSend(a2, "getReturnValue:", &v6);
  v5[0] = v6;
  v5[1] = v7;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v5, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_25(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  double v5;

  v5 = 0.0;
  objc_msgSend(a2, "getReturnValue:", &v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_26(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  double v5;

  v5 = 0.0;
  objc_msgSend(a2, "getReturnValue:", &v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_27(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  unsigned __int8 v5;

  v5 = 0;
  objc_msgSend(a2, "getReturnValue:", &v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_28(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  double v5;

  v5 = 0.0;
  objc_msgSend(a2, "getReturnValue:", &v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_29(uint64_t a1, void *a2)
{
  uint64_t v3;

  v3 = 0;
  objc_msgSend(a2, "getReturnValue:", &v3);
  SBStringForBlurTargetPreference(v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_30(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  double v5;

  v5 = 0.0;
  objc_msgSend(a2, "getReturnValue:", &v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_31(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  unsigned __int8 v5;

  v5 = 0;
  objc_msgSend(a2, "getReturnValue:", &v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_32(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  unsigned __int8 v5;

  v5 = 0;
  objc_msgSend(a2, "getReturnValue:", &v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_33(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  unsigned __int8 v5;

  v5 = 0;
  objc_msgSend(a2, "getReturnValue:", &v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_34(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  unsigned __int8 v5;

  v5 = 0;
  objc_msgSend(a2, "getReturnValue:", &v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_35(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  unsigned __int8 v5;

  v5 = 0;
  objc_msgSend(a2, "getReturnValue:", &v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_36(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v5;

  v5 = 0;
  objc_msgSend(a2, "getReturnValue:", &v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_37(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v5;

  v5 = 0;
  objc_msgSend(a2, "getReturnValue:", &v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_38(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  unsigned __int8 v5;

  v5 = 0;
  objc_msgSend(a2, "getReturnValue:", &v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_39(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  unsigned __int8 v5;

  v5 = 0;
  objc_msgSend(a2, "getReturnValue:", &v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_40(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  double v5;

  v5 = 0.0;
  objc_msgSend(a2, "getReturnValue:", &v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_41(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  unsigned __int8 v5;

  v5 = 0;
  objc_msgSend(a2, "getReturnValue:", &v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_42(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _OWORD v5[2];
  __int128 v6;
  __int128 v7;

  v6 = 0u;
  v7 = 0u;
  objc_msgSend(a2, "getReturnValue:", &v6);
  v5[0] = v6;
  v5[1] = v7;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v5, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_43(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "animationAttributesForLayoutElement:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sb_switcherModifierDebugTimelineDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_44(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[4];

  v2 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(*(id *)(a1 + 32), "frameForIconOverlayInAppLayout:", a2);
  v10[0] = v3;
  v10[1] = v4;
  v10[2] = v5;
  v10[3] = v6;
  objc_msgSend(v2, "valueWithBytes:objCType:", v10, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_45(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isFocusEnabledForAppLayout:", a2));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_46(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "multipleWindowsIndicatorLayoutRoleMaskForAppLayout:", a2));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_47(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "preferredSnapshotOrientationForAppLayout:", a2));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_48(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "wantsSceneResizesHostedContextForAppLayout:", a2));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_49(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "canSelectLeafWithModifierKeysInAppLayout:", a2));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_50(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "shouldAllowGroupOpacityForAppLayout:", a2));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_51(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "asyncRenderingAttributesForAppLayout:", a2);
  return SBStringForSwitcherAsyncRenderingAttributes();
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_52(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "contentViewScale");
  objc_msgSend(v1, "numberWithDouble:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_53(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "homeScreenAlpha");
  objc_msgSend(v1, "numberWithDouble:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_54(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "homeScreenBackdropBlurProgress");
  objc_msgSend(v1, "numberWithDouble:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_55(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "homeScreenScale");
  objc_msgSend(v1, "numberWithDouble:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_56(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "wallpaperScale");
  objc_msgSend(v1, "numberWithDouble:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_57(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "homeScreenDimmingAlpha");
  objc_msgSend(v1, "numberWithDouble:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_58(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "containerStatusBarAnimationDuration");
  objc_msgSend(v1, "numberWithDouble:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_59(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "hiddenContainerStatusBarParts"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_60(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "dockProgress");
  objc_msgSend(v1, "numberWithDouble:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_61(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "dockWindowLevelPriority"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_62(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "dockWindowLevel");
  objc_msgSend(v1, "numberWithDouble:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_63(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "shelfBackgroundBlurOpacity");
  objc_msgSend(v1, "numberWithDouble:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_64(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[4];

  v1 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(*(id *)(a1 + 32), "shelfBackgroundBlurFrame");
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  objc_msgSend(v1, "valueWithBytes:objCType:", v9, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_65(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "wantsSlideOverTongue");
  return NSStringFromBOOL();
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_66(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "slideOverTongueState"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_67(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "slideOverTongueDirection"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_68(uint64_t a1)
{
  void *v1;
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(*(id *)(a1 + 32), "appLayoutToAttachSlideOverTongue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("nil");
  v4 = v2;

  return v4;
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_69(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "isScrollEnabled");
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_70(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "shouldScrollViewBlockTouches");
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_71(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "isContainerStatusBarVisible");
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_72(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "isWallpaperRequiredForSwitcher");
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_73(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "isHomeScreenContentRequired");
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_74(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "isSwitcherWindowVisible");
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_75(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "isSwitcherWindowUserInteractionEnabled");
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_76(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "shouldAcceleratedHomeButtonPressBegin");
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_77(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "shouldFireTransitionCompletionInDefaultRunLoopMode");
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_78(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "wantsDockBehaviorAssertion");
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_79(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "wantsDockWindowLevelAssertion");
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_80(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "wantsAsynchronousSurfaceRetentionAssertion");
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_81(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "isItemContainerPointerInteractionEnabled");
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_82(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "shouldRubberbandFullScreenHomeGrabberView");
  return NSStringFromBOOL();
}

const __CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_83(uint64_t a1)
{
  return SBStringForSwitcherWallpaperStyle(objc_msgSend(*(id *)(a1 + 32), "wallpaperStyle"));
}

const __CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_84(uint64_t a1)
{
  return SBStringForSwitcherHomeScreenBackdropBlurType(objc_msgSend(*(id *)(a1 + 32), "homeScreenBackdropBlurType"));
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_85(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "dockUpdateMode");
  return SBStringFromAnimationUpdateMode();
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_86(uint64_t a1)
{
  void *v1;
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(*(id *)(a1 + 32), "appLayoutToScrollToBeforeTransitioning");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("nil");
  v4 = v2;

  return v4;
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_87(uint64_t a1)
{
  void *v1;
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(*(id *)(a1 + 32), "appLayoutToScrollToBeforeReopeningClosedWindows");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("nil");
  v4 = v2;

  return v4;
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_88(uint64_t a1)
{
  void *v1;
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(*(id *)(a1 + 32), "topMostLayoutElements");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("nil");
  v4 = v2;

  return v4;
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_89(uint64_t a1)
{
  void *v1;
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(*(id *)(a1 + 32), "appLayoutsToCacheSnapshots");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("nil");
  v4 = v2;

  return v4;
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_90(uint64_t a1)
{
  void *v1;
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(*(id *)(a1 + 32), "appLayoutsToCacheFullsizeSnapshots");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("nil");
  v4 = v2;

  return v4;
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_91(uint64_t a1)
{
  void *v1;
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(*(id *)(a1 + 32), "appLayoutsToResignActive");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("nil");
  v4 = v2;

  return v4;
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_92(uint64_t a1)
{
  void *v1;
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(*(id *)(a1 + 32), "keyboardSuppressionMode");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("nil");
  v4 = v2;

  return v4;
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_93(uint64_t a1)
{
  void *v1;
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(*(id *)(a1 + 32), "keyboardFocusedAppLayout");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("nil");
  v4 = v2;

  return v4;
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_94(uint64_t a1)
{
  void *v1;
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(*(id *)(a1 + 32), "leafAppLayoutForKeyboardFocusedScene");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("nil");
  v4 = v2;

  return v4;
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_95(uint64_t a1)
{
  void *v1;
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(*(id *)(a1 + 32), "shelfFocusedDisplayItems");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("nil");
  v4 = v2;

  return v4;
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_96(uint64_t a1)
{
  void *v1;
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(*(id *)(a1 + 32), "activeLeafAppLayoutsReachableByKeyboardShortcut");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("nil");
  v4 = v2;

  return v4;
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_97(uint64_t a1)
{
  void *v1;
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(*(id *)(a1 + 32), "inactiveAppLayoutsReachableByKeyboardShortcut");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("nil");
  v4 = v2;

  return v4;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_98(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isHomeAffordanceSupportedForAppLayout:", a2));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_99(uint64_t a1)
{
  void *v1;
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(*(id *)(a1 + 32), "visibleHomeAffordanceLayoutElements");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("nil");
  v4 = v2;

  return v4;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_100(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "shouldAccessoryDrawShadowForAppLayout:", a2));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_101(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isResizeGrabberVisibleForAppLayout:", a2));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_102(uint64_t a1)
{
  void *v1;
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(*(id *)(a1 + 32), "visibleShelves");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("nil");
  v4 = v2;

  return v4;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_103(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "containerLeafAppLayoutForShelf:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sb_switcherModifierDebugTimelineDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_104(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[4];

  v2 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(*(id *)(a1 + 32), "frameForShelf:", a2);
  v10[0] = v3;
  v10[1] = v4;
  v10[2] = v5;
  v10[3] = v6;
  objc_msgSend(v2, "valueWithBytes:objCType:", v10, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_105(uint64_t a1, uint64_t a2)
{
  void *v2;
  _OWORD v4[3];
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "presentationAttributesForShelf:", a2);
  }
  else
  {
    v5 = 0;
    memset(v4, 0, sizeof(v4));
  }
  SBStringForSwitcherShelfPresentationAttributes((uint64_t)v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_106(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "focusedAppLayoutForShelf:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sb_switcherModifierDebugTimelineDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_107(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "ignoredDisplayItemsForShelf:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sb_switcherModifierDebugTimelineDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_108(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "hiddenAppLayoutsInShelf:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sb_switcherModifierDebugTimelineDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_109(uint64_t a1)
{
  void *v1;
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(*(id *)(a1 + 32), "animatablePropertyIdentifiers");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("nil");
  v4 = v2;

  return v4;
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_110(uint64_t a1)
{
  void *v1;
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(*(id *)(a1 + 32), "appExposeAccessoryButtonsBundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("nil");
  v4 = v2;

  return v4;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_111(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "plusButtonAlpha");
  objc_msgSend(v1, "numberWithDouble:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_112(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "reopenClosedWindowsButtonAlpha");
  objc_msgSend(v1, "numberWithDouble:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_113(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "reopenClosedWindowsButtonScale");
  objc_msgSend(v1, "numberWithDouble:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_114(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "appExposeAccessoryButtonsOverrideUserInterfaceStyle");
  return SBFStringForUIUserInterfaceStyle();
}

const __CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_115(uint64_t a1)
{
  return SBStringFromSwitcherPlusButtonStyle(objc_msgSend(*(id *)(a1 + 32), "plusButtonStyle"));
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_116(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "perspectiveAngleForAppLayout:", a2);
  objc_msgSend(v2, "numberWithDouble:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_117(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "wantsContinuousExposeHoverGesture"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_118(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isContinuousExposeStripVisible"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_119(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "wantsContinuousExposeHoverGesture"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_120(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = objc_msgSend(*(id *)(a1 + 32), "continuousExposeStripTongueAttributes");
  return SBSwitcherContinuousExposeStripTongueAttributesDescription(v1, v2);
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_121(uint64_t a1)
{
  void *v1;
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(*(id *)(a1 + 32), "appLayouts");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("nil");
  v4 = v2;

  return v4;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_122(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "appLayoutsGenerationCount"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_123(uint64_t a1)
{
  void *v1;
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(*(id *)(a1 + 32), "continuousExposeIdentifiersInStrip");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("nil");
  v4 = v2;

  return v4;
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_124(uint64_t a1)
{
  void *v1;
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(*(id *)(a1 + 32), "continuousExposeIdentifiersInSwitcher");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("nil");
  v4 = v2;

  return v4;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_125(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[4];

  v1 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(*(id *)(a1 + 32), "containerViewBounds");
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  objc_msgSend(v1, "valueWithBytes:objCType:", v9, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_126(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[4];

  v1 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(*(id *)(a1 + 32), "switcherViewBounds");
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  objc_msgSend(v1, "valueWithBytes:objCType:", v9, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_127(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "isDevicePad");
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_128(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "hasHomeButton");
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_129(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "isChamoisWindowingUIEnabled");
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_130(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "isReduceMotionEnabled");
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_131(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "isRTLEnabled");
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_132(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "isFloatingDockSupported");
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_133(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "isStudyLogEnabled");
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_134(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "isMedusaCapable");
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_135(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "isSplitViewSupported");
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_136(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "isInMedusaCapableSpace");
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_137(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "prefersStripHidden");
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_138(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "prefersDockHidden");
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_139(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "isSoftwareKeyboardVisible");
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_140(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "isDisplayEmbedded");
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_141(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "appLayoutContainsOnlyResizableApps:", a2);
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_142(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "appLayoutContainsAnUnoccludedMaximizedDisplayItem:", a2);
  return NSStringFromBOOL();
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_143(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[4];

  v2 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(*(id *)(a1 + 32), "homeScreenIconFrameForAppLayout:", a2);
  v10[0] = v3;
  v10[1] = v4;
  v10[2] = v5;
  v10[3] = v6;
  objc_msgSend(v2, "valueWithBytes:objCType:", v10, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_144(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "homeScreenIconScaleForAppLayout:", a2);
  objc_msgSend(v2, "numberWithDouble:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_145(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "homeScreenIconCornerRadiusForAppLayout:", a2);
  objc_msgSend(v2, "numberWithDouble:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_146(uint64_t a1, uint64_t a2)
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  objc_msgSend(*(id *)(a1 + 32), "homeScreenIconLocationForAppLayout:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sb_switcherModifierDebugTimelineDescription");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = CFSTR("nil");
  v5 = v3;

  return v5;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_147(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "homeScreenIconGridSizeClassForAppLayout:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SBHStringForIconGridSizeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_148(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "itemContainerForAppLayoutOverlapsFloatingDock:", a2));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_149(uint64_t a1)
{
  void *v1;
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(*(id *)(a1 + 32), "keyboardFocusedAppLayout");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("nil");
  v4 = v2;

  return v4;
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_150(uint64_t a1)
{
  void *v1;
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(*(id *)(a1 + 32), "leafAppLayoutForKeyboardFocusedScene");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("nil");
  v4 = v2;

  return v4;
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_151(uint64_t a1)
{
  void *v1;
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(*(id *)(a1 + 32), "shelfFocusedDisplayItems");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("nil");
  v4 = v2;

  return v4;
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_152(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "userInterfaceStyle");
  return SBFStringForUIUserInterfaceStyle();
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_153(uint64_t a1)
{
  void *v1;
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(*(id *)(a1 + 32), "draggingAppLayoutsForWindowDrag");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("nil");
  v4 = v2;

  return v4;
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_154(uint64_t a1)
{
  void *v1;
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(*(id *)(a1 + 32), "proposedAppLayoutsForWindowDrag");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("nil");
  v4 = v2;

  return v4;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_155(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  unsigned __int8 v5;

  v5 = 0;
  objc_msgSend(a2, "getReturnValue:", &v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSArray)implementingQueryMethods
{
  return self->_implementingQueryMethods;
}

- (NSArray)nonImplementingQueryMethods
{
  return self->_nonImplementingQueryMethods;
}

- (NSDictionary)queryMethodsToDescriptions
{
  return self->_queryMethodsToDescriptions;
}

- (NSArray)contextMethods
{
  return self->_contextMethods;
}

- (NSDictionary)contextMethodsToDescriptions
{
  return self->_contextMethodsToDescriptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextMethodsToDescriptions, 0);
  objc_storeStrong((id *)&self->_contextMethods, 0);
  objc_storeStrong((id *)&self->_queryMethodsToDescriptions, 0);
  objc_storeStrong((id *)&self->_nonImplementingQueryMethods, 0);
  objc_storeStrong((id *)&self->_implementingQueryMethods, 0);
}

@end
