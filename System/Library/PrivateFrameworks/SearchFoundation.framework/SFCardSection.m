@implementation SFCardSection

- (SFCardSection)initWithProtobuf:(id)a3
{
  id v3;
  SFNullCardSection *v4;
  void *v5;
  void *v6;
  SFAppLinkCardSection *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  SFDescriptionCardSection *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  SFKeyValueDataCardSection *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  SFMapCardSection *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  SFMediaInfoCardSection *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  SFMediaPlayerCardSection *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  SFNowPlayingCardSection *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  SFRichTitleCardSection *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  SFRowCardSection *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  SFScoreboardCardSection *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  SFSocialMediaPostCardSection *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  SFStockChartCardSection *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  SFTableHeaderRowCardSection *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  SFTableRowCardSection *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  SFTextColumnsCardSection *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  SFTitleCardSection *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  SFTrackListCardSection *v103;
  void *v104;
  void *v105;
  uint64_t v106;
  void *v107;
  void *v108;
  SFAudioPlaybackCardSection *v109;
  void *v110;
  void *v111;
  uint64_t v112;
  void *v113;
  void *v114;
  SFFlightCardSection *v115;
  void *v116;
  void *v117;
  uint64_t v118;
  void *v119;
  void *v120;
  SFActivityIndicatorCardSection *v121;
  void *v122;
  void *v123;
  uint64_t v124;
  void *v125;
  void *v126;
  SFWebCardSection *v127;
  void *v128;
  void *v129;
  uint64_t v130;
  void *v131;
  void *v132;
  SFMessageCardSection *v133;
  void *v134;
  void *v135;
  uint64_t v136;
  void *v137;
  void *v138;
  SFDetailedRowCardSection *v139;
  void *v140;
  void *v141;
  uint64_t v142;
  void *v143;
  void *v144;
  SFImagesCardSection *v145;
  void *v146;
  void *v147;
  uint64_t v148;
  void *v149;
  void *v150;
  SFSuggestionCardSection *v151;
  void *v152;
  void *v153;
  uint64_t v154;
  void *v155;
  void *v156;
  SFSelectableGridCardSection *v157;
  void *v158;
  void *v159;
  uint64_t v160;
  void *v161;
  void *v162;
  SFSectionHeaderCardSection *v163;
  void *v164;
  void *v165;
  uint64_t v166;
  void *v167;
  void *v168;
  SFMetaInfoCardSection *v169;
  void *v170;
  void *v171;
  uint64_t v172;
  void *v173;
  void *v174;
  SFWatchListCardSection *v175;
  void *v176;
  void *v177;
  uint64_t v178;
  void *v179;
  void *v180;
  SFMapsDetailedRowCardSection *v181;
  void *v182;
  void *v183;
  uint64_t v184;
  void *v185;
  void *v186;
  SFButtonCardSection *v187;
  void *v188;
  void *v189;
  uint64_t v190;
  void *v191;
  void *v192;
  SFHorizontalButtonCardSection *v193;
  void *v194;
  void *v195;
  uint64_t v196;
  void *v197;
  void *v198;
  SFVerticalLayoutCardSection *v199;
  void *v200;
  void *v201;
  uint64_t v202;
  void *v203;
  void *v204;
  SFProductCardSection *v205;
  void *v206;
  void *v207;
  uint64_t v208;
  void *v209;
  void *v210;
  SFHorizontalScrollCardSection *v211;
  void *v212;
  void *v213;
  uint64_t v214;
  void *v215;
  void *v216;
  SFMediaRemoteControlCardSection *v217;
  void *v218;
  void *v219;
  uint64_t v220;
  void *v221;
  void *v222;
  SFMapPlaceCardSection *v223;
  void *v224;
  void *v225;
  uint64_t v226;
  void *v227;
  void *v228;
  SFCompactRowCardSection *v229;
  void *v230;
  void *v231;
  uint64_t v232;
  void *v233;
  void *v234;
  SFWorldMapCardSection *v235;
  void *v236;
  void *v237;
  uint64_t v238;
  void *v239;
  void *v240;
  SFAttributionFooterCardSection *v241;
  void *v242;
  void *v243;
  uint64_t v244;
  void *v245;
  void *v246;
  SFGridCardSection *v247;
  void *v248;
  void *v249;
  uint64_t v250;
  void *v251;
  void *v252;
  SFPersonHeaderCardSection *v253;
  void *v254;
  void *v255;
  uint64_t v256;
  void *v257;
  void *v258;
  SFColorBarCardSection *v259;
  void *v260;
  void *v261;
  uint64_t v262;
  void *v263;
  void *v264;
  SFSplitCardSection *v265;
  void *v266;
  void *v267;
  uint64_t v268;
  void *v269;
  void *v270;
  SFLinkPresentationCardSection *v271;
  void *v272;
  void *v273;
  uint64_t v274;
  void *v275;
  void *v276;
  SFFindMyCardSection *v277;
  void *v278;
  void *v279;
  uint64_t v280;
  void *v281;
  void *v282;
  SFHeroCardSection *v283;
  void *v284;
  void *v285;
  uint64_t v286;
  void *v287;
  void *v288;
  SFNewsCardSection *v289;
  void *v290;
  void *v291;
  uint64_t v292;
  void *v293;
  void *v294;
  SFMiniCardSection *v295;
  void *v296;
  void *v297;
  uint64_t v298;
  void *v299;
  void *v300;
  SFInfoCardSection *v301;
  void *v302;
  void *v303;
  uint64_t v304;
  void *v305;
  void *v306;
  SFCollectionCardSection *v307;
  void *v308;
  void *v309;
  uint64_t v310;
  void *v311;
  void *v312;
  SFCombinedCardSection *v313;
  void *v314;
  void *v315;
  uint64_t v316;
  void *v317;
  void *v318;
  SFResponseWrapperCardSection *v319;
  void *v320;
  void *v321;
  uint64_t v322;
  void *v323;
  void *v324;
  SFListenToCardSection *v325;
  void *v326;
  void *v327;
  uint64_t v328;
  void *v329;
  void *v330;
  SFWatchNowCardSection *v331;
  void *v332;
  void *v333;
  uint64_t v334;
  void *v335;
  void *v336;
  SFStrokeAnimationCardSection *v337;
  void *v338;
  void *v339;
  uint64_t v340;
  void *v341;
  void *v342;
  SFButtonListCardSection *v343;
  void *v344;
  void *v345;
  uint64_t v346;
  void *v347;
  void *v348;
  SFCommandRowCardSection *v349;
  void *v350;
  void *v351;
  uint64_t v352;
  void *v353;
  void *v354;
  SFLeadingTrailingCardSection *v355;
  void *v356;
  void *v357;
  uint64_t v358;
  void *v359;
  void *v360;
  SFHeroTitleCardSection *v361;
  void *v362;
  void *v363;
  uint64_t v364;
  void *v365;
  void *v366;
  SFArchiveViewCardSection *v367;
  void *v368;
  void *v369;
  uint64_t v370;
  void *v371;
  void *v372;
  SFAppIconCardSection *v373;
  void *v374;
  void *v375;
  uint64_t v376;
  void *v377;
  void *v378;
  SFLargeTitleDetailedRowCardSection *v379;
  void *v380;
  void *v381;
  uint64_t v382;
  void *v383;
  void *v384;
  SFSafariTableOfContentsCardSection *v385;
  void *v386;
  void *v387;
  uint64_t v388;
  void *v389;
  void *v390;
  RFSummaryItemShortNumberCardSection *v391;
  void *v392;
  void *v393;
  uint64_t v394;
  void *v395;
  void *v396;
  RFSummaryItemTextCardSection *v397;
  void *v398;
  void *v399;
  uint64_t v400;
  void *v401;
  void *v402;
  RFSummaryItemStandardCardSection *v403;
  void *v404;
  void *v405;
  uint64_t v406;
  void *v407;
  void *v408;
  RFFactItemShortNumberCardSection *v409;
  void *v410;
  void *v411;
  uint64_t v412;
  void *v413;
  void *v414;
  RFFactItemStandardCardSection *v415;
  void *v416;
  void *v417;
  uint64_t v418;
  void *v419;
  void *v420;
  RFLongItemStandardCardSection *v421;
  void *v422;
  void *v423;
  uint64_t v424;
  void *v425;
  void *v426;
  RFPrimaryHeaderRichCardSection *v427;
  void *v428;
  void *v429;
  uint64_t v430;
  void *v431;
  void *v432;
  RFPrimaryHeaderStandardCardSection *v433;
  void *v434;
  void *v435;
  uint64_t v436;
  void *v437;
  void *v438;
  RFReferenceFootnoteCardSection *v439;
  void *v440;
  void *v441;
  uint64_t v442;
  void *v443;
  void *v444;
  RFReferenceRichCardSection *v445;
  void *v446;
  void *v447;
  uint64_t v448;
  void *v449;
  void *v450;
  RFSimpleItemRichCardSection *v451;
  void *v452;
  void *v453;
  uint64_t v454;
  void *v455;
  void *v456;
  RFSimpleItemStandardCardSection *v457;
  void *v458;
  void *v459;
  uint64_t v460;
  void *v461;
  void *v462;
  RFSummaryItemAlignedTextCardSection *v463;
  void *v464;
  void *v465;
  uint64_t v466;
  void *v467;
  void *v468;
  RFExpandableStandardCardSection *v469;
  void *v470;
  void *v471;
  uint64_t v472;
  void *v473;
  void *v474;
  RFFactItemButtonCardSection *v475;
  void *v476;
  void *v477;
  uint64_t v478;
  void *v479;
  void *v480;
  RFFactItemHeroNumberCardSection *v481;
  void *v482;
  void *v483;
  uint64_t v484;
  void *v485;
  void *v486;
  RFPrimaryHeaderMarqueeCardSection *v487;
  void *v488;
  void *v489;
  uint64_t v490;
  void *v491;
  void *v492;
  RFSummaryItemDetailedTextCardSection *v493;
  void *v494;
  void *v495;
  uint64_t v496;
  void *v497;
  void *v498;
  RFSimpleItemPlayerCardSection *v499;
  void *v500;
  void *v501;
  uint64_t v502;
  void *v503;
  void *v504;
  RFSummaryItemPairCardSection *v505;
  void *v506;
  void *v507;
  uint64_t v508;
  void *v509;
  void *v510;
  RFSummaryItemPairNumberCardSection *v511;
  void *v512;
  void *v513;
  uint64_t v514;
  void *v515;
  void *v516;
  RFFactItemShortHeroNumberCardSection *v517;
  void *v518;
  void *v519;
  uint64_t v520;
  void *v521;
  void *v522;
  RFFactItemDetailedNumberCardSection *v523;
  void *v524;
  void *v525;
  uint64_t v526;
  void *v527;
  void *v528;
  RFFactItemHeroButtonCardSection *v529;
  void *v530;
  void *v531;
  uint64_t v532;
  void *v533;
  void *v534;
  RFFactItemImageRightCardSection *v535;
  void *v536;
  void *v537;
  uint64_t v538;
  void *v539;
  void *v540;
  RFSummaryItemSwitchV2CardSection *v541;
  void *v542;
  void *v543;
  uint64_t v544;
  void *v545;
  void *v546;
  RFTableHeaderCardSection *v547;
  void *v548;
  void *v549;
  uint64_t v550;
  void *v551;
  void *v552;
  RFTableRowCardSection *v553;
  void *v554;
  void *v555;
  uint64_t v556;
  void *v557;
  void *v558;
  RFSimpleItemVisualElementCardSection *v559;
  void *v560;
  void *v561;
  uint64_t v562;
  void *v563;
  void *v564;
  RFSummaryItemPlayerCardSection *v565;
  void *v566;
  void *v567;
  uint64_t v568;
  void *v569;
  void *v570;
  RFSummaryItemImageRightCardSection *v571;
  void *v572;
  void *v573;
  uint64_t v574;
  void *v575;
  void *v576;
  RFSummaryItemButtonCardSection *v577;
  void *v578;
  void *v579;
  uint64_t v580;
  void *v581;
  void *v582;
  RFSimpleItemReverseRichCardSection *v583;
  void *v584;
  void *v585;
  uint64_t v586;
  void *v587;
  void *v588;
  RFSimpleItemRichSearchResultCardSection *v589;
  void *v590;
  void *v591;
  uint64_t v592;
  void *v593;
  void *v594;
  RFPrimaryHeaderStackedImageCardSection *v595;
  void *v596;
  void *v597;
  uint64_t v598;
  void *v599;
  void *v600;
  RFReferenceItemLogoCardSection *v601;
  void *v602;
  void *v603;
  uint64_t v604;
  void *v605;
  void *v606;
  RFReferenceItemButtonCardSection *v607;
  void *v608;
  void *v609;
  uint64_t v610;
  void *v611;
  void *v612;
  RFButtonCardSection *v613;
  void *v614;
  void *v615;
  uint64_t v616;
  void *v617;
  void *v618;
  RFBinaryButtonCardSection *v619;
  void *v620;
  void *v621;
  uint64_t v622;
  void *v623;
  void *v624;
  RFReferenceCenteredCardSection *v625;
  void *v626;
  void *v627;
  uint64_t v628;
  void *v629;
  void *v630;
  RFSecondaryHeaderStandardCardSection *v631;
  void *v632;
  void *v633;
  uint64_t v634;
  void *v635;
  void *v636;
  RFSecondaryHeaderEmphasizedCardSection *v637;
  void *v638;
  void *v639;
  uint64_t v640;
  void *v641;
  void *v642;
  RFMapCardSection *v643;
  void *v644;
  void *v645;
  uint64_t v646;
  void *v647;
  void *v648;
  RFReferenceStandardCardSection *v649;
  void *v650;
  void *v651;
  uint64_t v652;
  void *v653;
  void *v654;
  RFMultiButtonCardSection *v655;
  void *v656;
  void *v657;
  uint64_t v658;
  void *v659;
  void *v660;
  RFDisambiguationTitleCardSection *v661;
  void *v662;
  void *v663;
  uint64_t v664;
  void *v665;
  SFCard *v666;
  void *v667;
  SFCard *v668;
  void *v669;
  uint64_t v670;
  void *v671;
  id v672;
  void *v673;
  uint64_t v674;
  uint64_t v675;
  uint64_t v676;
  uint64_t i;
  SFAbstractCommand *v678;
  void *v679;
  uint64_t v680;
  void *v681;
  id v682;
  void *v683;
  uint64_t v684;
  uint64_t v685;
  uint64_t v686;
  uint64_t j;
  id v688;
  void *v689;
  void *v690;
  void *v691;
  void *v692;
  void *v693;
  SFUserReportRequest *v694;
  void *v695;
  SFUserReportRequest *v696;
  void *v697;
  SFCommand *v698;
  void *v699;
  SFCommand *v700;
  void *v701;
  SFCommand *v702;
  void *v703;
  SFCommand *v704;
  void *v705;
  uint64_t v706;
  void *v707;
  id v708;
  void *v709;
  uint64_t v710;
  uint64_t v711;
  uint64_t v712;
  uint64_t k;
  SFButtonItem *v714;
  void *v715;
  void *v716;
  void *v717;
  void *v718;
  void *v719;
  SFColor *v720;
  void *v721;
  SFColor *v722;
  void *v723;
  uint64_t v724;
  void *v725;
  id v726;
  void *v727;
  uint64_t v728;
  uint64_t v729;
  uint64_t v730;
  uint64_t m;
  SFButtonItem *v732;
  void *v733;
  uint64_t v734;
  void *v735;
  id v736;
  void *v737;
  uint64_t v738;
  uint64_t v739;
  uint64_t v740;
  uint64_t n;
  SFButtonItem *v742;
  void *v743;
  uint64_t v744;
  void *v745;
  id v746;
  void *v747;
  uint64_t v748;
  uint64_t v749;
  uint64_t v750;
  uint64_t ii;
  SFPunchout *v752;
  void *v753;
  void *v754;
  void *v755;
  void *v756;
  void *v757;
  uint64_t v758;
  void *v759;
  id v760;
  void *v761;
  uint64_t v762;
  uint64_t v763;
  uint64_t v764;
  uint64_t jj;
  SFCommand *v766;
  void *v767;
  SFAppEntityAnnotation *v768;
  void *v769;
  SFAppEntityAnnotation *v770;
  void *v771;
  void *v772;
  SFCardSection *v773;
  __int128 v776;
  __int128 v777;
  __int128 v778;
  __int128 v779;
  __int128 v780;
  __int128 v781;
  __int128 v782;
  __int128 v783;
  __int128 v784;
  __int128 v785;
  __int128 v786;
  __int128 v787;
  __int128 v788;
  __int128 v789;
  __int128 v790;
  __int128 v791;
  __int128 v792;
  __int128 v793;
  __int128 v794;
  __int128 v795;
  __int128 v796;
  __int128 v797;
  __int128 v798;
  __int128 v799;
  __int128 v800;
  __int128 v801;
  __int128 v802;
  __int128 v803;
  _BYTE v804[128];
  _BYTE v805[128];
  _BYTE v806[128];
  _BYTE v807[128];
  _BYTE v808[128];
  _BYTE v809[128];
  _BYTE v810[128];
  uint64_t v811;

  v811 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(SFNullCardSection);
  objc_msgSend(v3, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appLinkCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = [SFAppLinkCardSection alloc];
    objc_msgSend(v3, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appLinkCardSection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SFAppLinkCardSection initWithProtobuf:](v7, "initWithProtobuf:", v9);

    v4 = (SFNullCardSection *)v10;
  }
  objc_msgSend(v3, "value");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "descriptionCardSection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = [SFDescriptionCardSection alloc];
    objc_msgSend(v3, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "descriptionCardSection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[SFDescriptionCardSection initWithProtobuf:](v13, "initWithProtobuf:", v15);

    v4 = (SFNullCardSection *)v16;
  }
  objc_msgSend(v3, "value");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "keyValueDataCardSection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = [SFKeyValueDataCardSection alloc];
    objc_msgSend(v3, "value");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "keyValueDataCardSection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[SFKeyValueDataCardSection initWithProtobuf:](v19, "initWithProtobuf:", v21);

    v4 = (SFNullCardSection *)v22;
  }
  objc_msgSend(v3, "value");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "mapCardSection");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v25 = [SFMapCardSection alloc];
    objc_msgSend(v3, "value");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "mapCardSection");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[SFMapCardSection initWithProtobuf:](v25, "initWithProtobuf:", v27);

    v4 = (SFNullCardSection *)v28;
  }
  objc_msgSend(v3, "value");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "mediaInfoCardSection");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    v31 = [SFMediaInfoCardSection alloc];
    objc_msgSend(v3, "value");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "mediaInfoCardSection");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[SFMediaInfoCardSection initWithProtobuf:](v31, "initWithProtobuf:", v33);

    v4 = (SFNullCardSection *)v34;
  }
  objc_msgSend(v3, "value");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "mediaPlayerCardSection");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    v37 = [SFMediaPlayerCardSection alloc];
    objc_msgSend(v3, "value");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "mediaPlayerCardSection");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = -[SFMediaPlayerCardSection initWithProtobuf:](v37, "initWithProtobuf:", v39);

    v4 = (SFNullCardSection *)v40;
  }
  objc_msgSend(v3, "value");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "nowPlayingCardSection");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    v43 = [SFNowPlayingCardSection alloc];
    objc_msgSend(v3, "value");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "nowPlayingCardSection");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = -[SFNowPlayingCardSection initWithProtobuf:](v43, "initWithProtobuf:", v45);

    v4 = (SFNullCardSection *)v46;
  }
  objc_msgSend(v3, "value");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "richTitleCardSection");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
  {
    v49 = [SFRichTitleCardSection alloc];
    objc_msgSend(v3, "value");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "richTitleCardSection");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = -[SFRichTitleCardSection initWithProtobuf:](v49, "initWithProtobuf:", v51);

    v4 = (SFNullCardSection *)v52;
  }
  objc_msgSend(v3, "value");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "rowCardSection");
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  if (v54)
  {
    v55 = [SFRowCardSection alloc];
    objc_msgSend(v3, "value");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "rowCardSection");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = -[SFRowCardSection initWithProtobuf:](v55, "initWithProtobuf:", v57);

    v4 = (SFNullCardSection *)v58;
  }
  objc_msgSend(v3, "value");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "scoreboardCardSection");
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  if (v60)
  {
    v61 = [SFScoreboardCardSection alloc];
    objc_msgSend(v3, "value");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "scoreboardCardSection");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = -[SFScoreboardCardSection initWithProtobuf:](v61, "initWithProtobuf:", v63);

    v4 = (SFNullCardSection *)v64;
  }
  objc_msgSend(v3, "value");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "socialMediaPostCardSection");
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  if (v66)
  {
    v67 = [SFSocialMediaPostCardSection alloc];
    objc_msgSend(v3, "value");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "socialMediaPostCardSection");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = -[SFSocialMediaPostCardSection initWithProtobuf:](v67, "initWithProtobuf:", v69);

    v4 = (SFNullCardSection *)v70;
  }
  objc_msgSend(v3, "value");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "stockChartCardSection");
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  if (v72)
  {
    v73 = [SFStockChartCardSection alloc];
    objc_msgSend(v3, "value");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "stockChartCardSection");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = -[SFStockChartCardSection initWithProtobuf:](v73, "initWithProtobuf:", v75);

    v4 = (SFNullCardSection *)v76;
  }
  objc_msgSend(v3, "value");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "tableHeaderRowCardSection");
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  if (v78)
  {
    v79 = [SFTableHeaderRowCardSection alloc];
    objc_msgSend(v3, "value");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "tableHeaderRowCardSection");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = -[SFTableHeaderRowCardSection initWithProtobuf:](v79, "initWithProtobuf:", v81);

    v4 = (SFNullCardSection *)v82;
  }
  objc_msgSend(v3, "value");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "tableRowCardSection");
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  if (v84)
  {
    v85 = [SFTableRowCardSection alloc];
    objc_msgSend(v3, "value");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "tableRowCardSection");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = -[SFTableRowCardSection initWithProtobuf:](v85, "initWithProtobuf:", v87);

    v4 = (SFNullCardSection *)v88;
  }
  objc_msgSend(v3, "value");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "textColumnsCardSection");
  v90 = (void *)objc_claimAutoreleasedReturnValue();

  if (v90)
  {
    v91 = [SFTextColumnsCardSection alloc];
    objc_msgSend(v3, "value");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "textColumnsCardSection");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = -[SFTextColumnsCardSection initWithProtobuf:](v91, "initWithProtobuf:", v93);

    v4 = (SFNullCardSection *)v94;
  }
  objc_msgSend(v3, "value");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "titleCardSection");
  v96 = (void *)objc_claimAutoreleasedReturnValue();

  if (v96)
  {
    v97 = [SFTitleCardSection alloc];
    objc_msgSend(v3, "value");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "titleCardSection");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = -[SFTitleCardSection initWithProtobuf:](v97, "initWithProtobuf:", v99);

    v4 = (SFNullCardSection *)v100;
  }
  objc_msgSend(v3, "value");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "trackListCardSection");
  v102 = (void *)objc_claimAutoreleasedReturnValue();

  if (v102)
  {
    v103 = [SFTrackListCardSection alloc];
    objc_msgSend(v3, "value");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "trackListCardSection");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = -[SFTrackListCardSection initWithProtobuf:](v103, "initWithProtobuf:", v105);

    v4 = (SFNullCardSection *)v106;
  }
  objc_msgSend(v3, "value");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "audioPlaybackCardSection");
  v108 = (void *)objc_claimAutoreleasedReturnValue();

  if (v108)
  {
    v109 = [SFAudioPlaybackCardSection alloc];
    objc_msgSend(v3, "value");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "audioPlaybackCardSection");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = -[SFAudioPlaybackCardSection initWithProtobuf:](v109, "initWithProtobuf:", v111);

    v4 = (SFNullCardSection *)v112;
  }
  objc_msgSend(v3, "value");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "flightCardSection");
  v114 = (void *)objc_claimAutoreleasedReturnValue();

  if (v114)
  {
    v115 = [SFFlightCardSection alloc];
    objc_msgSend(v3, "value");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "flightCardSection");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = -[SFFlightCardSection initWithProtobuf:](v115, "initWithProtobuf:", v117);

    v4 = (SFNullCardSection *)v118;
  }
  objc_msgSend(v3, "value");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "activityIndicatorCardSection");
  v120 = (void *)objc_claimAutoreleasedReturnValue();

  if (v120)
  {
    v121 = [SFActivityIndicatorCardSection alloc];
    objc_msgSend(v3, "value");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "activityIndicatorCardSection");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = -[SFActivityIndicatorCardSection initWithProtobuf:](v121, "initWithProtobuf:", v123);

    v4 = (SFNullCardSection *)v124;
  }
  objc_msgSend(v3, "value");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "webCardSection");
  v126 = (void *)objc_claimAutoreleasedReturnValue();

  if (v126)
  {
    v127 = [SFWebCardSection alloc];
    objc_msgSend(v3, "value");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "webCardSection");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    v130 = -[SFWebCardSection initWithProtobuf:](v127, "initWithProtobuf:", v129);

    v4 = (SFNullCardSection *)v130;
  }
  objc_msgSend(v3, "value");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "messageCardSection");
  v132 = (void *)objc_claimAutoreleasedReturnValue();

  if (v132)
  {
    v133 = [SFMessageCardSection alloc];
    objc_msgSend(v3, "value");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "messageCardSection");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    v136 = -[SFMessageCardSection initWithProtobuf:](v133, "initWithProtobuf:", v135);

    v4 = (SFNullCardSection *)v136;
  }
  objc_msgSend(v3, "value");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "detailedRowCardSection");
  v138 = (void *)objc_claimAutoreleasedReturnValue();

  if (v138)
  {
    v139 = [SFDetailedRowCardSection alloc];
    objc_msgSend(v3, "value");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "detailedRowCardSection");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    v142 = -[SFDetailedRowCardSection initWithProtobuf:](v139, "initWithProtobuf:", v141);

    v4 = (SFNullCardSection *)v142;
  }
  objc_msgSend(v3, "value");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v143, "imagesCardSection");
  v144 = (void *)objc_claimAutoreleasedReturnValue();

  if (v144)
  {
    v145 = [SFImagesCardSection alloc];
    objc_msgSend(v3, "value");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v146, "imagesCardSection");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    v148 = -[SFImagesCardSection initWithProtobuf:](v145, "initWithProtobuf:", v147);

    v4 = (SFNullCardSection *)v148;
  }
  objc_msgSend(v3, "value");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "suggestionCardSection");
  v150 = (void *)objc_claimAutoreleasedReturnValue();

  if (v150)
  {
    v151 = [SFSuggestionCardSection alloc];
    objc_msgSend(v3, "value");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "suggestionCardSection");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    v154 = -[SFSuggestionCardSection initWithProtobuf:](v151, "initWithProtobuf:", v153);

    v4 = (SFNullCardSection *)v154;
  }
  objc_msgSend(v3, "value");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v155, "selectableGridCardSection");
  v156 = (void *)objc_claimAutoreleasedReturnValue();

  if (v156)
  {
    v157 = [SFSelectableGridCardSection alloc];
    objc_msgSend(v3, "value");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v158, "selectableGridCardSection");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    v160 = -[SFSelectableGridCardSection initWithProtobuf:](v157, "initWithProtobuf:", v159);

    v4 = (SFNullCardSection *)v160;
  }
  objc_msgSend(v3, "value");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v161, "sectionHeaderCardSection");
  v162 = (void *)objc_claimAutoreleasedReturnValue();

  if (v162)
  {
    v163 = [SFSectionHeaderCardSection alloc];
    objc_msgSend(v3, "value");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "sectionHeaderCardSection");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    v166 = -[SFSectionHeaderCardSection initWithProtobuf:](v163, "initWithProtobuf:", v165);

    v4 = (SFNullCardSection *)v166;
  }
  objc_msgSend(v3, "value");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v167, "metaInfoCardSection");
  v168 = (void *)objc_claimAutoreleasedReturnValue();

  if (v168)
  {
    v169 = [SFMetaInfoCardSection alloc];
    objc_msgSend(v3, "value");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v170, "metaInfoCardSection");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    v172 = -[SFMetaInfoCardSection initWithProtobuf:](v169, "initWithProtobuf:", v171);

    v4 = (SFNullCardSection *)v172;
  }
  objc_msgSend(v3, "value");
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v173, "watchListCardSection");
  v174 = (void *)objc_claimAutoreleasedReturnValue();

  if (v174)
  {
    v175 = [SFWatchListCardSection alloc];
    objc_msgSend(v3, "value");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v176, "watchListCardSection");
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    v178 = -[SFWatchListCardSection initWithProtobuf:](v175, "initWithProtobuf:", v177);

    v4 = (SFNullCardSection *)v178;
  }
  objc_msgSend(v3, "value");
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v179, "mapsDetailedRowCardSection");
  v180 = (void *)objc_claimAutoreleasedReturnValue();

  if (v180)
  {
    v181 = [SFMapsDetailedRowCardSection alloc];
    objc_msgSend(v3, "value");
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v182, "mapsDetailedRowCardSection");
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    v184 = -[SFMapsDetailedRowCardSection initWithProtobuf:](v181, "initWithProtobuf:", v183);

    v4 = (SFNullCardSection *)v184;
  }
  objc_msgSend(v3, "value");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v185, "buttonCardSection");
  v186 = (void *)objc_claimAutoreleasedReturnValue();

  if (v186)
  {
    v187 = [SFButtonCardSection alloc];
    objc_msgSend(v3, "value");
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v188, "buttonCardSection");
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    v190 = -[SFButtonCardSection initWithProtobuf:](v187, "initWithProtobuf:", v189);

    v4 = (SFNullCardSection *)v190;
  }
  objc_msgSend(v3, "value");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v191, "horizontalButtonCardSection");
  v192 = (void *)objc_claimAutoreleasedReturnValue();

  if (v192)
  {
    v193 = [SFHorizontalButtonCardSection alloc];
    objc_msgSend(v3, "value");
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v194, "horizontalButtonCardSection");
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    v196 = -[SFHorizontalButtonCardSection initWithProtobuf:](v193, "initWithProtobuf:", v195);

    v4 = (SFNullCardSection *)v196;
  }
  objc_msgSend(v3, "value");
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v197, "verticalLayoutCardSection");
  v198 = (void *)objc_claimAutoreleasedReturnValue();

  if (v198)
  {
    v199 = [SFVerticalLayoutCardSection alloc];
    objc_msgSend(v3, "value");
    v200 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v200, "verticalLayoutCardSection");
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    v202 = -[SFVerticalLayoutCardSection initWithProtobuf:](v199, "initWithProtobuf:", v201);

    v4 = (SFNullCardSection *)v202;
  }
  objc_msgSend(v3, "value");
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v203, "productCardSection");
  v204 = (void *)objc_claimAutoreleasedReturnValue();

  if (v204)
  {
    v205 = [SFProductCardSection alloc];
    objc_msgSend(v3, "value");
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v206, "productCardSection");
    v207 = (void *)objc_claimAutoreleasedReturnValue();
    v208 = -[SFProductCardSection initWithProtobuf:](v205, "initWithProtobuf:", v207);

    v4 = (SFNullCardSection *)v208;
  }
  objc_msgSend(v3, "value");
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v209, "horizontalScrollCardSection");
  v210 = (void *)objc_claimAutoreleasedReturnValue();

  if (v210)
  {
    v211 = [SFHorizontalScrollCardSection alloc];
    objc_msgSend(v3, "value");
    v212 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v212, "horizontalScrollCardSection");
    v213 = (void *)objc_claimAutoreleasedReturnValue();
    v214 = -[SFHorizontalScrollCardSection initWithProtobuf:](v211, "initWithProtobuf:", v213);

    v4 = (SFNullCardSection *)v214;
  }
  objc_msgSend(v3, "value");
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v215, "mediaRemoteControlCardSection");
  v216 = (void *)objc_claimAutoreleasedReturnValue();

  if (v216)
  {
    v217 = [SFMediaRemoteControlCardSection alloc];
    objc_msgSend(v3, "value");
    v218 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v218, "mediaRemoteControlCardSection");
    v219 = (void *)objc_claimAutoreleasedReturnValue();
    v220 = -[SFMediaRemoteControlCardSection initWithProtobuf:](v217, "initWithProtobuf:", v219);

    v4 = (SFNullCardSection *)v220;
  }
  objc_msgSend(v3, "value");
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v221, "mapPlaceCardSection");
  v222 = (void *)objc_claimAutoreleasedReturnValue();

  if (v222)
  {
    v223 = [SFMapPlaceCardSection alloc];
    objc_msgSend(v3, "value");
    v224 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v224, "mapPlaceCardSection");
    v225 = (void *)objc_claimAutoreleasedReturnValue();
    v226 = -[SFMapPlaceCardSection initWithProtobuf:](v223, "initWithProtobuf:", v225);

    v4 = (SFNullCardSection *)v226;
  }
  objc_msgSend(v3, "value");
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v227, "compactRowCardSection");
  v228 = (void *)objc_claimAutoreleasedReturnValue();

  if (v228)
  {
    v229 = [SFCompactRowCardSection alloc];
    objc_msgSend(v3, "value");
    v230 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v230, "compactRowCardSection");
    v231 = (void *)objc_claimAutoreleasedReturnValue();
    v232 = -[SFCompactRowCardSection initWithProtobuf:](v229, "initWithProtobuf:", v231);

    v4 = (SFNullCardSection *)v232;
  }
  objc_msgSend(v3, "value");
  v233 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v233, "worldMapCardSection");
  v234 = (void *)objc_claimAutoreleasedReturnValue();

  if (v234)
  {
    v235 = [SFWorldMapCardSection alloc];
    objc_msgSend(v3, "value");
    v236 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v236, "worldMapCardSection");
    v237 = (void *)objc_claimAutoreleasedReturnValue();
    v238 = -[SFWorldMapCardSection initWithProtobuf:](v235, "initWithProtobuf:", v237);

    v4 = (SFNullCardSection *)v238;
  }
  objc_msgSend(v3, "value");
  v239 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v239, "attributionFooterCardSection");
  v240 = (void *)objc_claimAutoreleasedReturnValue();

  if (v240)
  {
    v241 = [SFAttributionFooterCardSection alloc];
    objc_msgSend(v3, "value");
    v242 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v242, "attributionFooterCardSection");
    v243 = (void *)objc_claimAutoreleasedReturnValue();
    v244 = -[SFAttributionFooterCardSection initWithProtobuf:](v241, "initWithProtobuf:", v243);

    v4 = (SFNullCardSection *)v244;
  }
  objc_msgSend(v3, "value");
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v245, "gridCardSection");
  v246 = (void *)objc_claimAutoreleasedReturnValue();

  if (v246)
  {
    v247 = [SFGridCardSection alloc];
    objc_msgSend(v3, "value");
    v248 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v248, "gridCardSection");
    v249 = (void *)objc_claimAutoreleasedReturnValue();
    v250 = -[SFGridCardSection initWithProtobuf:](v247, "initWithProtobuf:", v249);

    v4 = (SFNullCardSection *)v250;
  }
  objc_msgSend(v3, "value");
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v251, "personHeaderCardSection");
  v252 = (void *)objc_claimAutoreleasedReturnValue();

  if (v252)
  {
    v253 = [SFPersonHeaderCardSection alloc];
    objc_msgSend(v3, "value");
    v254 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v254, "personHeaderCardSection");
    v255 = (void *)objc_claimAutoreleasedReturnValue();
    v256 = -[SFPersonHeaderCardSection initWithProtobuf:](v253, "initWithProtobuf:", v255);

    v4 = (SFNullCardSection *)v256;
  }
  objc_msgSend(v3, "value");
  v257 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v257, "colorBarCardSection");
  v258 = (void *)objc_claimAutoreleasedReturnValue();

  if (v258)
  {
    v259 = [SFColorBarCardSection alloc];
    objc_msgSend(v3, "value");
    v260 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v260, "colorBarCardSection");
    v261 = (void *)objc_claimAutoreleasedReturnValue();
    v262 = -[SFColorBarCardSection initWithProtobuf:](v259, "initWithProtobuf:", v261);

    v4 = (SFNullCardSection *)v262;
  }
  objc_msgSend(v3, "value");
  v263 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v263, "splitCardSection");
  v264 = (void *)objc_claimAutoreleasedReturnValue();

  if (v264)
  {
    v265 = [SFSplitCardSection alloc];
    objc_msgSend(v3, "value");
    v266 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v266, "splitCardSection");
    v267 = (void *)objc_claimAutoreleasedReturnValue();
    v268 = -[SFSplitCardSection initWithProtobuf:](v265, "initWithProtobuf:", v267);

    v4 = (SFNullCardSection *)v268;
  }
  objc_msgSend(v3, "value");
  v269 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v269, "linkPresentationCardSection");
  v270 = (void *)objc_claimAutoreleasedReturnValue();

  if (v270)
  {
    v271 = [SFLinkPresentationCardSection alloc];
    objc_msgSend(v3, "value");
    v272 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v272, "linkPresentationCardSection");
    v273 = (void *)objc_claimAutoreleasedReturnValue();
    v274 = -[SFLinkPresentationCardSection initWithProtobuf:](v271, "initWithProtobuf:", v273);

    v4 = (SFNullCardSection *)v274;
  }
  objc_msgSend(v3, "value");
  v275 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v275, "findMyCardSection");
  v276 = (void *)objc_claimAutoreleasedReturnValue();

  if (v276)
  {
    v277 = [SFFindMyCardSection alloc];
    objc_msgSend(v3, "value");
    v278 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v278, "findMyCardSection");
    v279 = (void *)objc_claimAutoreleasedReturnValue();
    v280 = -[SFFindMyCardSection initWithProtobuf:](v277, "initWithProtobuf:", v279);

    v4 = (SFNullCardSection *)v280;
  }
  objc_msgSend(v3, "value");
  v281 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v281, "heroCardSection");
  v282 = (void *)objc_claimAutoreleasedReturnValue();

  if (v282)
  {
    v283 = [SFHeroCardSection alloc];
    objc_msgSend(v3, "value");
    v284 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v284, "heroCardSection");
    v285 = (void *)objc_claimAutoreleasedReturnValue();
    v286 = -[SFHeroCardSection initWithProtobuf:](v283, "initWithProtobuf:", v285);

    v4 = (SFNullCardSection *)v286;
  }
  objc_msgSend(v3, "value");
  v287 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v287, "newsCardSection");
  v288 = (void *)objc_claimAutoreleasedReturnValue();

  if (v288)
  {
    v289 = [SFNewsCardSection alloc];
    objc_msgSend(v3, "value");
    v290 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v290, "newsCardSection");
    v291 = (void *)objc_claimAutoreleasedReturnValue();
    v292 = -[SFNewsCardSection initWithProtobuf:](v289, "initWithProtobuf:", v291);

    v4 = (SFNullCardSection *)v292;
  }
  objc_msgSend(v3, "value");
  v293 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v293, "miniCardSection");
  v294 = (void *)objc_claimAutoreleasedReturnValue();

  if (v294)
  {
    v295 = [SFMiniCardSection alloc];
    objc_msgSend(v3, "value");
    v296 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v296, "miniCardSection");
    v297 = (void *)objc_claimAutoreleasedReturnValue();
    v298 = -[SFMiniCardSection initWithProtobuf:](v295, "initWithProtobuf:", v297);

    v4 = (SFNullCardSection *)v298;
  }
  objc_msgSend(v3, "value");
  v299 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v299, "infoCardSection");
  v300 = (void *)objc_claimAutoreleasedReturnValue();

  if (v300)
  {
    v301 = [SFInfoCardSection alloc];
    objc_msgSend(v3, "value");
    v302 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v302, "infoCardSection");
    v303 = (void *)objc_claimAutoreleasedReturnValue();
    v304 = -[SFInfoCardSection initWithProtobuf:](v301, "initWithProtobuf:", v303);

    v4 = (SFNullCardSection *)v304;
  }
  objc_msgSend(v3, "value");
  v305 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v305, "collectionCardSection");
  v306 = (void *)objc_claimAutoreleasedReturnValue();

  if (v306)
  {
    v307 = [SFCollectionCardSection alloc];
    objc_msgSend(v3, "value");
    v308 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v308, "collectionCardSection");
    v309 = (void *)objc_claimAutoreleasedReturnValue();
    v310 = -[SFCollectionCardSection initWithProtobuf:](v307, "initWithProtobuf:", v309);

    v4 = (SFNullCardSection *)v310;
  }
  objc_msgSend(v3, "value");
  v311 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v311, "combinedCardSection");
  v312 = (void *)objc_claimAutoreleasedReturnValue();

  if (v312)
  {
    v313 = [SFCombinedCardSection alloc];
    objc_msgSend(v3, "value");
    v314 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v314, "combinedCardSection");
    v315 = (void *)objc_claimAutoreleasedReturnValue();
    v316 = -[SFCombinedCardSection initWithProtobuf:](v313, "initWithProtobuf:", v315);

    v4 = (SFNullCardSection *)v316;
  }
  objc_msgSend(v3, "value");
  v317 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v317, "responseWrapperCardSection");
  v318 = (void *)objc_claimAutoreleasedReturnValue();

  if (v318)
  {
    v319 = [SFResponseWrapperCardSection alloc];
    objc_msgSend(v3, "value");
    v320 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v320, "responseWrapperCardSection");
    v321 = (void *)objc_claimAutoreleasedReturnValue();
    v322 = -[SFResponseWrapperCardSection initWithProtobuf:](v319, "initWithProtobuf:", v321);

    v4 = (SFNullCardSection *)v322;
  }
  objc_msgSend(v3, "value");
  v323 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v323, "listenToCardSection");
  v324 = (void *)objc_claimAutoreleasedReturnValue();

  if (v324)
  {
    v325 = [SFListenToCardSection alloc];
    objc_msgSend(v3, "value");
    v326 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v326, "listenToCardSection");
    v327 = (void *)objc_claimAutoreleasedReturnValue();
    v328 = -[SFListenToCardSection initWithProtobuf:](v325, "initWithProtobuf:", v327);

    v4 = (SFNullCardSection *)v328;
  }
  objc_msgSend(v3, "value");
  v329 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v329, "watchNowCardSection");
  v330 = (void *)objc_claimAutoreleasedReturnValue();

  if (v330)
  {
    v331 = [SFWatchNowCardSection alloc];
    objc_msgSend(v3, "value");
    v332 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v332, "watchNowCardSection");
    v333 = (void *)objc_claimAutoreleasedReturnValue();
    v334 = -[SFWatchNowCardSection initWithProtobuf:](v331, "initWithProtobuf:", v333);

    v4 = (SFNullCardSection *)v334;
  }
  objc_msgSend(v3, "value");
  v335 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v335, "strokeAnimationCardSection");
  v336 = (void *)objc_claimAutoreleasedReturnValue();

  if (v336)
  {
    v337 = [SFStrokeAnimationCardSection alloc];
    objc_msgSend(v3, "value");
    v338 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v338, "strokeAnimationCardSection");
    v339 = (void *)objc_claimAutoreleasedReturnValue();
    v340 = -[SFStrokeAnimationCardSection initWithProtobuf:](v337, "initWithProtobuf:", v339);

    v4 = (SFNullCardSection *)v340;
  }
  objc_msgSend(v3, "value");
  v341 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v341, "buttonListCardSection");
  v342 = (void *)objc_claimAutoreleasedReturnValue();

  if (v342)
  {
    v343 = [SFButtonListCardSection alloc];
    objc_msgSend(v3, "value");
    v344 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v344, "buttonListCardSection");
    v345 = (void *)objc_claimAutoreleasedReturnValue();
    v346 = -[SFButtonListCardSection initWithProtobuf:](v343, "initWithProtobuf:", v345);

    v4 = (SFNullCardSection *)v346;
  }
  objc_msgSend(v3, "value");
  v347 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v347, "commandRowCardSection");
  v348 = (void *)objc_claimAutoreleasedReturnValue();

  if (v348)
  {
    v349 = [SFCommandRowCardSection alloc];
    objc_msgSend(v3, "value");
    v350 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v350, "commandRowCardSection");
    v351 = (void *)objc_claimAutoreleasedReturnValue();
    v352 = -[SFCommandRowCardSection initWithProtobuf:](v349, "initWithProtobuf:", v351);

    v4 = (SFNullCardSection *)v352;
  }
  objc_msgSend(v3, "value");
  v353 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v353, "leadingTrailingCardSection");
  v354 = (void *)objc_claimAutoreleasedReturnValue();

  if (v354)
  {
    v355 = [SFLeadingTrailingCardSection alloc];
    objc_msgSend(v3, "value");
    v356 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v356, "leadingTrailingCardSection");
    v357 = (void *)objc_claimAutoreleasedReturnValue();
    v358 = -[SFLeadingTrailingCardSection initWithProtobuf:](v355, "initWithProtobuf:", v357);

    v4 = (SFNullCardSection *)v358;
  }
  objc_msgSend(v3, "value");
  v359 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v359, "heroTitleCardSection");
  v360 = (void *)objc_claimAutoreleasedReturnValue();

  if (v360)
  {
    v361 = [SFHeroTitleCardSection alloc];
    objc_msgSend(v3, "value");
    v362 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v362, "heroTitleCardSection");
    v363 = (void *)objc_claimAutoreleasedReturnValue();
    v364 = -[SFHeroTitleCardSection initWithProtobuf:](v361, "initWithProtobuf:", v363);

    v4 = (SFNullCardSection *)v364;
  }
  objc_msgSend(v3, "value");
  v365 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v365, "archiveViewCardSection");
  v366 = (void *)objc_claimAutoreleasedReturnValue();

  if (v366)
  {
    v367 = [SFArchiveViewCardSection alloc];
    objc_msgSend(v3, "value");
    v368 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v368, "archiveViewCardSection");
    v369 = (void *)objc_claimAutoreleasedReturnValue();
    v370 = -[SFArchiveViewCardSection initWithProtobuf:](v367, "initWithProtobuf:", v369);

    v4 = (SFNullCardSection *)v370;
  }
  objc_msgSend(v3, "value");
  v371 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v371, "appIconCardSection");
  v372 = (void *)objc_claimAutoreleasedReturnValue();

  if (v372)
  {
    v373 = [SFAppIconCardSection alloc];
    objc_msgSend(v3, "value");
    v374 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v374, "appIconCardSection");
    v375 = (void *)objc_claimAutoreleasedReturnValue();
    v376 = -[SFAppIconCardSection initWithProtobuf:](v373, "initWithProtobuf:", v375);

    v4 = (SFNullCardSection *)v376;
  }
  objc_msgSend(v3, "value");
  v377 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v377, "largeTitleDetailedRowCardSection");
  v378 = (void *)objc_claimAutoreleasedReturnValue();

  if (v378)
  {
    v379 = [SFLargeTitleDetailedRowCardSection alloc];
    objc_msgSend(v3, "value");
    v380 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v380, "largeTitleDetailedRowCardSection");
    v381 = (void *)objc_claimAutoreleasedReturnValue();
    v382 = -[SFLargeTitleDetailedRowCardSection initWithProtobuf:](v379, "initWithProtobuf:", v381);

    v4 = (SFNullCardSection *)v382;
  }
  objc_msgSend(v3, "value");
  v383 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v383, "safariTableOfContentsCardSection");
  v384 = (void *)objc_claimAutoreleasedReturnValue();

  if (v384)
  {
    v385 = [SFSafariTableOfContentsCardSection alloc];
    objc_msgSend(v3, "value");
    v386 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v386, "safariTableOfContentsCardSection");
    v387 = (void *)objc_claimAutoreleasedReturnValue();
    v388 = -[SFSafariTableOfContentsCardSection initWithProtobuf:](v385, "initWithProtobuf:", v387);

    v4 = (SFNullCardSection *)v388;
  }
  objc_msgSend(v3, "value");
  v389 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v389, "rfSummaryItemShortNumberCardSection");
  v390 = (void *)objc_claimAutoreleasedReturnValue();

  if (v390)
  {
    v391 = [RFSummaryItemShortNumberCardSection alloc];
    objc_msgSend(v3, "value");
    v392 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v392, "rfSummaryItemShortNumberCardSection");
    v393 = (void *)objc_claimAutoreleasedReturnValue();
    v394 = -[RFSummaryItemShortNumberCardSection initWithProtobuf:](v391, "initWithProtobuf:", v393);

    v4 = (SFNullCardSection *)v394;
  }
  objc_msgSend(v3, "value");
  v395 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v395, "rfSummaryItemTextCardSection");
  v396 = (void *)objc_claimAutoreleasedReturnValue();

  if (v396)
  {
    v397 = [RFSummaryItemTextCardSection alloc];
    objc_msgSend(v3, "value");
    v398 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v398, "rfSummaryItemTextCardSection");
    v399 = (void *)objc_claimAutoreleasedReturnValue();
    v400 = -[RFSummaryItemTextCardSection initWithProtobuf:](v397, "initWithProtobuf:", v399);

    v4 = (SFNullCardSection *)v400;
  }
  objc_msgSend(v3, "value");
  v401 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v401, "rfSummaryItemStandardCardSection");
  v402 = (void *)objc_claimAutoreleasedReturnValue();

  if (v402)
  {
    v403 = [RFSummaryItemStandardCardSection alloc];
    objc_msgSend(v3, "value");
    v404 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v404, "rfSummaryItemStandardCardSection");
    v405 = (void *)objc_claimAutoreleasedReturnValue();
    v406 = -[RFSummaryItemStandardCardSection initWithProtobuf:](v403, "initWithProtobuf:", v405);

    v4 = (SFNullCardSection *)v406;
  }
  objc_msgSend(v3, "value");
  v407 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v407, "rfFactItemShortNumberCardSection");
  v408 = (void *)objc_claimAutoreleasedReturnValue();

  if (v408)
  {
    v409 = [RFFactItemShortNumberCardSection alloc];
    objc_msgSend(v3, "value");
    v410 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v410, "rfFactItemShortNumberCardSection");
    v411 = (void *)objc_claimAutoreleasedReturnValue();
    v412 = -[RFFactItemShortNumberCardSection initWithProtobuf:](v409, "initWithProtobuf:", v411);

    v4 = (SFNullCardSection *)v412;
  }
  objc_msgSend(v3, "value");
  v413 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v413, "rfFactItemStandardCardSection");
  v414 = (void *)objc_claimAutoreleasedReturnValue();

  if (v414)
  {
    v415 = [RFFactItemStandardCardSection alloc];
    objc_msgSend(v3, "value");
    v416 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v416, "rfFactItemStandardCardSection");
    v417 = (void *)objc_claimAutoreleasedReturnValue();
    v418 = -[RFFactItemStandardCardSection initWithProtobuf:](v415, "initWithProtobuf:", v417);

    v4 = (SFNullCardSection *)v418;
  }
  objc_msgSend(v3, "value");
  v419 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v419, "rfLongItemStandardCardSection");
  v420 = (void *)objc_claimAutoreleasedReturnValue();

  if (v420)
  {
    v421 = [RFLongItemStandardCardSection alloc];
    objc_msgSend(v3, "value");
    v422 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v422, "rfLongItemStandardCardSection");
    v423 = (void *)objc_claimAutoreleasedReturnValue();
    v424 = -[RFLongItemStandardCardSection initWithProtobuf:](v421, "initWithProtobuf:", v423);

    v4 = (SFNullCardSection *)v424;
  }
  objc_msgSend(v3, "value");
  v425 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v425, "rfPrimaryHeaderRichCardSection");
  v426 = (void *)objc_claimAutoreleasedReturnValue();

  if (v426)
  {
    v427 = [RFPrimaryHeaderRichCardSection alloc];
    objc_msgSend(v3, "value");
    v428 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v428, "rfPrimaryHeaderRichCardSection");
    v429 = (void *)objc_claimAutoreleasedReturnValue();
    v430 = -[RFPrimaryHeaderRichCardSection initWithProtobuf:](v427, "initWithProtobuf:", v429);

    v4 = (SFNullCardSection *)v430;
  }
  objc_msgSend(v3, "value");
  v431 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v431, "rfPrimaryHeaderStandardCardSection");
  v432 = (void *)objc_claimAutoreleasedReturnValue();

  if (v432)
  {
    v433 = [RFPrimaryHeaderStandardCardSection alloc];
    objc_msgSend(v3, "value");
    v434 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v434, "rfPrimaryHeaderStandardCardSection");
    v435 = (void *)objc_claimAutoreleasedReturnValue();
    v436 = -[RFPrimaryHeaderStandardCardSection initWithProtobuf:](v433, "initWithProtobuf:", v435);

    v4 = (SFNullCardSection *)v436;
  }
  objc_msgSend(v3, "value");
  v437 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v437, "rfReferenceFootnoteCardSection");
  v438 = (void *)objc_claimAutoreleasedReturnValue();

  if (v438)
  {
    v439 = [RFReferenceFootnoteCardSection alloc];
    objc_msgSend(v3, "value");
    v440 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v440, "rfReferenceFootnoteCardSection");
    v441 = (void *)objc_claimAutoreleasedReturnValue();
    v442 = -[RFReferenceFootnoteCardSection initWithProtobuf:](v439, "initWithProtobuf:", v441);

    v4 = (SFNullCardSection *)v442;
  }
  objc_msgSend(v3, "value");
  v443 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v443, "rfReferenceRichCardSection");
  v444 = (void *)objc_claimAutoreleasedReturnValue();

  if (v444)
  {
    v445 = [RFReferenceRichCardSection alloc];
    objc_msgSend(v3, "value");
    v446 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v446, "rfReferenceRichCardSection");
    v447 = (void *)objc_claimAutoreleasedReturnValue();
    v448 = -[RFReferenceRichCardSection initWithProtobuf:](v445, "initWithProtobuf:", v447);

    v4 = (SFNullCardSection *)v448;
  }
  objc_msgSend(v3, "value");
  v449 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v449, "rfSimpleItemRichCardSection");
  v450 = (void *)objc_claimAutoreleasedReturnValue();

  if (v450)
  {
    v451 = [RFSimpleItemRichCardSection alloc];
    objc_msgSend(v3, "value");
    v452 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v452, "rfSimpleItemRichCardSection");
    v453 = (void *)objc_claimAutoreleasedReturnValue();
    v454 = -[RFSimpleItemRichCardSection initWithProtobuf:](v451, "initWithProtobuf:", v453);

    v4 = (SFNullCardSection *)v454;
  }
  objc_msgSend(v3, "value");
  v455 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v455, "rfSimpleItemStandardCardSection");
  v456 = (void *)objc_claimAutoreleasedReturnValue();

  if (v456)
  {
    v457 = [RFSimpleItemStandardCardSection alloc];
    objc_msgSend(v3, "value");
    v458 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v458, "rfSimpleItemStandardCardSection");
    v459 = (void *)objc_claimAutoreleasedReturnValue();
    v460 = -[RFSimpleItemStandardCardSection initWithProtobuf:](v457, "initWithProtobuf:", v459);

    v4 = (SFNullCardSection *)v460;
  }
  objc_msgSend(v3, "value");
  v461 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v461, "rfSummaryItemAlignedTextCardSection");
  v462 = (void *)objc_claimAutoreleasedReturnValue();

  if (v462)
  {
    v463 = [RFSummaryItemAlignedTextCardSection alloc];
    objc_msgSend(v3, "value");
    v464 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v464, "rfSummaryItemAlignedTextCardSection");
    v465 = (void *)objc_claimAutoreleasedReturnValue();
    v466 = -[RFSummaryItemAlignedTextCardSection initWithProtobuf:](v463, "initWithProtobuf:", v465);

    v4 = (SFNullCardSection *)v466;
  }
  objc_msgSend(v3, "value");
  v467 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v467, "rfExpandableStandardCardSection");
  v468 = (void *)objc_claimAutoreleasedReturnValue();

  if (v468)
  {
    v469 = [RFExpandableStandardCardSection alloc];
    objc_msgSend(v3, "value");
    v470 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v470, "rfExpandableStandardCardSection");
    v471 = (void *)objc_claimAutoreleasedReturnValue();
    v472 = -[RFExpandableStandardCardSection initWithProtobuf:](v469, "initWithProtobuf:", v471);

    v4 = (SFNullCardSection *)v472;
  }
  objc_msgSend(v3, "value");
  v473 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v473, "rfFactItemButtonCardSection");
  v474 = (void *)objc_claimAutoreleasedReturnValue();

  if (v474)
  {
    v475 = [RFFactItemButtonCardSection alloc];
    objc_msgSend(v3, "value");
    v476 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v476, "rfFactItemButtonCardSection");
    v477 = (void *)objc_claimAutoreleasedReturnValue();
    v478 = -[RFFactItemButtonCardSection initWithProtobuf:](v475, "initWithProtobuf:", v477);

    v4 = (SFNullCardSection *)v478;
  }
  objc_msgSend(v3, "value");
  v479 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v479, "rfFactItemHeroNumberCardSection");
  v480 = (void *)objc_claimAutoreleasedReturnValue();

  if (v480)
  {
    v481 = [RFFactItemHeroNumberCardSection alloc];
    objc_msgSend(v3, "value");
    v482 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v482, "rfFactItemHeroNumberCardSection");
    v483 = (void *)objc_claimAutoreleasedReturnValue();
    v484 = -[RFFactItemHeroNumberCardSection initWithProtobuf:](v481, "initWithProtobuf:", v483);

    v4 = (SFNullCardSection *)v484;
  }
  objc_msgSend(v3, "value");
  v485 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v485, "rfPrimaryHeaderMarqueeCardSection");
  v486 = (void *)objc_claimAutoreleasedReturnValue();

  if (v486)
  {
    v487 = [RFPrimaryHeaderMarqueeCardSection alloc];
    objc_msgSend(v3, "value");
    v488 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v488, "rfPrimaryHeaderMarqueeCardSection");
    v489 = (void *)objc_claimAutoreleasedReturnValue();
    v490 = -[RFPrimaryHeaderMarqueeCardSection initWithProtobuf:](v487, "initWithProtobuf:", v489);

    v4 = (SFNullCardSection *)v490;
  }
  objc_msgSend(v3, "value");
  v491 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v491, "rfSummaryItemDetailedTextCardSection");
  v492 = (void *)objc_claimAutoreleasedReturnValue();

  if (v492)
  {
    v493 = [RFSummaryItemDetailedTextCardSection alloc];
    objc_msgSend(v3, "value");
    v494 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v494, "rfSummaryItemDetailedTextCardSection");
    v495 = (void *)objc_claimAutoreleasedReturnValue();
    v496 = -[RFSummaryItemDetailedTextCardSection initWithProtobuf:](v493, "initWithProtobuf:", v495);

    v4 = (SFNullCardSection *)v496;
  }
  objc_msgSend(v3, "value");
  v497 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v497, "rfSimpleItemPlayerCardSection");
  v498 = (void *)objc_claimAutoreleasedReturnValue();

  if (v498)
  {
    v499 = [RFSimpleItemPlayerCardSection alloc];
    objc_msgSend(v3, "value");
    v500 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v500, "rfSimpleItemPlayerCardSection");
    v501 = (void *)objc_claimAutoreleasedReturnValue();
    v502 = -[RFSimpleItemPlayerCardSection initWithProtobuf:](v499, "initWithProtobuf:", v501);

    v4 = (SFNullCardSection *)v502;
  }
  objc_msgSend(v3, "value");
  v503 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v503, "rfSummaryItemPairCardSection");
  v504 = (void *)objc_claimAutoreleasedReturnValue();

  if (v504)
  {
    v505 = [RFSummaryItemPairCardSection alloc];
    objc_msgSend(v3, "value");
    v506 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v506, "rfSummaryItemPairCardSection");
    v507 = (void *)objc_claimAutoreleasedReturnValue();
    v508 = -[RFSummaryItemPairCardSection initWithProtobuf:](v505, "initWithProtobuf:", v507);

    v4 = (SFNullCardSection *)v508;
  }
  objc_msgSend(v3, "value");
  v509 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v509, "rfSummaryItemPairNumberCardSection");
  v510 = (void *)objc_claimAutoreleasedReturnValue();

  if (v510)
  {
    v511 = [RFSummaryItemPairNumberCardSection alloc];
    objc_msgSend(v3, "value");
    v512 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v512, "rfSummaryItemPairNumberCardSection");
    v513 = (void *)objc_claimAutoreleasedReturnValue();
    v514 = -[RFSummaryItemPairNumberCardSection initWithProtobuf:](v511, "initWithProtobuf:", v513);

    v4 = (SFNullCardSection *)v514;
  }
  objc_msgSend(v3, "value");
  v515 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v515, "rfFactItemShortHeroNumberCardSection");
  v516 = (void *)objc_claimAutoreleasedReturnValue();

  if (v516)
  {
    v517 = [RFFactItemShortHeroNumberCardSection alloc];
    objc_msgSend(v3, "value");
    v518 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v518, "rfFactItemShortHeroNumberCardSection");
    v519 = (void *)objc_claimAutoreleasedReturnValue();
    v520 = -[RFFactItemShortHeroNumberCardSection initWithProtobuf:](v517, "initWithProtobuf:", v519);

    v4 = (SFNullCardSection *)v520;
  }
  objc_msgSend(v3, "value");
  v521 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v521, "rfFactItemDetailedNumberCardSection");
  v522 = (void *)objc_claimAutoreleasedReturnValue();

  if (v522)
  {
    v523 = [RFFactItemDetailedNumberCardSection alloc];
    objc_msgSend(v3, "value");
    v524 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v524, "rfFactItemDetailedNumberCardSection");
    v525 = (void *)objc_claimAutoreleasedReturnValue();
    v526 = -[RFFactItemDetailedNumberCardSection initWithProtobuf:](v523, "initWithProtobuf:", v525);

    v4 = (SFNullCardSection *)v526;
  }
  objc_msgSend(v3, "value");
  v527 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v527, "rfFactItemHeroButtonCardSection");
  v528 = (void *)objc_claimAutoreleasedReturnValue();

  if (v528)
  {
    v529 = [RFFactItemHeroButtonCardSection alloc];
    objc_msgSend(v3, "value");
    v530 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v530, "rfFactItemHeroButtonCardSection");
    v531 = (void *)objc_claimAutoreleasedReturnValue();
    v532 = -[RFFactItemHeroButtonCardSection initWithProtobuf:](v529, "initWithProtobuf:", v531);

    v4 = (SFNullCardSection *)v532;
  }
  objc_msgSend(v3, "value");
  v533 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v533, "rfFactItemImageRightCardSection");
  v534 = (void *)objc_claimAutoreleasedReturnValue();

  if (v534)
  {
    v535 = [RFFactItemImageRightCardSection alloc];
    objc_msgSend(v3, "value");
    v536 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v536, "rfFactItemImageRightCardSection");
    v537 = (void *)objc_claimAutoreleasedReturnValue();
    v538 = -[RFFactItemImageRightCardSection initWithProtobuf:](v535, "initWithProtobuf:", v537);

    v4 = (SFNullCardSection *)v538;
  }
  objc_msgSend(v3, "value");
  v539 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v539, "rfSummaryItemSwitchV2CardSection");
  v540 = (void *)objc_claimAutoreleasedReturnValue();

  if (v540)
  {
    v541 = [RFSummaryItemSwitchV2CardSection alloc];
    objc_msgSend(v3, "value");
    v542 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v542, "rfSummaryItemSwitchV2CardSection");
    v543 = (void *)objc_claimAutoreleasedReturnValue();
    v544 = -[RFSummaryItemSwitchV2CardSection initWithProtobuf:](v541, "initWithProtobuf:", v543);

    v4 = (SFNullCardSection *)v544;
  }
  objc_msgSend(v3, "value");
  v545 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v545, "rfTableHeaderCardSection");
  v546 = (void *)objc_claimAutoreleasedReturnValue();

  if (v546)
  {
    v547 = [RFTableHeaderCardSection alloc];
    objc_msgSend(v3, "value");
    v548 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v548, "rfTableHeaderCardSection");
    v549 = (void *)objc_claimAutoreleasedReturnValue();
    v550 = -[RFTableHeaderCardSection initWithProtobuf:](v547, "initWithProtobuf:", v549);

    v4 = (SFNullCardSection *)v550;
  }
  objc_msgSend(v3, "value");
  v551 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v551, "rfTableRowCardSection");
  v552 = (void *)objc_claimAutoreleasedReturnValue();

  if (v552)
  {
    v553 = [RFTableRowCardSection alloc];
    objc_msgSend(v3, "value");
    v554 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v554, "rfTableRowCardSection");
    v555 = (void *)objc_claimAutoreleasedReturnValue();
    v556 = -[RFTableRowCardSection initWithProtobuf:](v553, "initWithProtobuf:", v555);

    v4 = (SFNullCardSection *)v556;
  }
  objc_msgSend(v3, "value");
  v557 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v557, "rfSimpleItemVisualElementCardSection");
  v558 = (void *)objc_claimAutoreleasedReturnValue();

  if (v558)
  {
    v559 = [RFSimpleItemVisualElementCardSection alloc];
    objc_msgSend(v3, "value");
    v560 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v560, "rfSimpleItemVisualElementCardSection");
    v561 = (void *)objc_claimAutoreleasedReturnValue();
    v562 = -[RFSimpleItemVisualElementCardSection initWithProtobuf:](v559, "initWithProtobuf:", v561);

    v4 = (SFNullCardSection *)v562;
  }
  objc_msgSend(v3, "value");
  v563 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v563, "rfSummaryItemPlayerCardSection");
  v564 = (void *)objc_claimAutoreleasedReturnValue();

  if (v564)
  {
    v565 = [RFSummaryItemPlayerCardSection alloc];
    objc_msgSend(v3, "value");
    v566 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v566, "rfSummaryItemPlayerCardSection");
    v567 = (void *)objc_claimAutoreleasedReturnValue();
    v568 = -[RFSummaryItemPlayerCardSection initWithProtobuf:](v565, "initWithProtobuf:", v567);

    v4 = (SFNullCardSection *)v568;
  }
  objc_msgSend(v3, "value");
  v569 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v569, "rfSummaryItemImageRightCardSection");
  v570 = (void *)objc_claimAutoreleasedReturnValue();

  if (v570)
  {
    v571 = [RFSummaryItemImageRightCardSection alloc];
    objc_msgSend(v3, "value");
    v572 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v572, "rfSummaryItemImageRightCardSection");
    v573 = (void *)objc_claimAutoreleasedReturnValue();
    v574 = -[RFSummaryItemImageRightCardSection initWithProtobuf:](v571, "initWithProtobuf:", v573);

    v4 = (SFNullCardSection *)v574;
  }
  objc_msgSend(v3, "value");
  v575 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v575, "rfSummaryItemButtonCardSection");
  v576 = (void *)objc_claimAutoreleasedReturnValue();

  if (v576)
  {
    v577 = [RFSummaryItemButtonCardSection alloc];
    objc_msgSend(v3, "value");
    v578 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v578, "rfSummaryItemButtonCardSection");
    v579 = (void *)objc_claimAutoreleasedReturnValue();
    v580 = -[RFSummaryItemButtonCardSection initWithProtobuf:](v577, "initWithProtobuf:", v579);

    v4 = (SFNullCardSection *)v580;
  }
  objc_msgSend(v3, "value");
  v581 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v581, "rfSimpleItemReverseRichCardSection");
  v582 = (void *)objc_claimAutoreleasedReturnValue();

  if (v582)
  {
    v583 = [RFSimpleItemReverseRichCardSection alloc];
    objc_msgSend(v3, "value");
    v584 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v584, "rfSimpleItemReverseRichCardSection");
    v585 = (void *)objc_claimAutoreleasedReturnValue();
    v586 = -[RFSimpleItemReverseRichCardSection initWithProtobuf:](v583, "initWithProtobuf:", v585);

    v4 = (SFNullCardSection *)v586;
  }
  objc_msgSend(v3, "value");
  v587 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v587, "rfSimpleItemRichSearchResultCardSection");
  v588 = (void *)objc_claimAutoreleasedReturnValue();

  if (v588)
  {
    v589 = [RFSimpleItemRichSearchResultCardSection alloc];
    objc_msgSend(v3, "value");
    v590 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v590, "rfSimpleItemRichSearchResultCardSection");
    v591 = (void *)objc_claimAutoreleasedReturnValue();
    v592 = -[RFSimpleItemRichSearchResultCardSection initWithProtobuf:](v589, "initWithProtobuf:", v591);

    v4 = (SFNullCardSection *)v592;
  }
  objc_msgSend(v3, "value");
  v593 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v593, "rfPrimaryHeaderStackedImageCardSection");
  v594 = (void *)objc_claimAutoreleasedReturnValue();

  if (v594)
  {
    v595 = [RFPrimaryHeaderStackedImageCardSection alloc];
    objc_msgSend(v3, "value");
    v596 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v596, "rfPrimaryHeaderStackedImageCardSection");
    v597 = (void *)objc_claimAutoreleasedReturnValue();
    v598 = -[RFPrimaryHeaderStackedImageCardSection initWithProtobuf:](v595, "initWithProtobuf:", v597);

    v4 = (SFNullCardSection *)v598;
  }
  objc_msgSend(v3, "value");
  v599 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v599, "rfReferenceItemLogoCardSection");
  v600 = (void *)objc_claimAutoreleasedReturnValue();

  if (v600)
  {
    v601 = [RFReferenceItemLogoCardSection alloc];
    objc_msgSend(v3, "value");
    v602 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v602, "rfReferenceItemLogoCardSection");
    v603 = (void *)objc_claimAutoreleasedReturnValue();
    v604 = -[RFReferenceItemLogoCardSection initWithProtobuf:](v601, "initWithProtobuf:", v603);

    v4 = (SFNullCardSection *)v604;
  }
  objc_msgSend(v3, "value");
  v605 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v605, "rfReferenceItemButtonCardSection");
  v606 = (void *)objc_claimAutoreleasedReturnValue();

  if (v606)
  {
    v607 = [RFReferenceItemButtonCardSection alloc];
    objc_msgSend(v3, "value");
    v608 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v608, "rfReferenceItemButtonCardSection");
    v609 = (void *)objc_claimAutoreleasedReturnValue();
    v610 = -[RFReferenceItemButtonCardSection initWithProtobuf:](v607, "initWithProtobuf:", v609);

    v4 = (SFNullCardSection *)v610;
  }
  objc_msgSend(v3, "value");
  v611 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v611, "rfButtonCardSection");
  v612 = (void *)objc_claimAutoreleasedReturnValue();

  if (v612)
  {
    v613 = [RFButtonCardSection alloc];
    objc_msgSend(v3, "value");
    v614 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v614, "rfButtonCardSection");
    v615 = (void *)objc_claimAutoreleasedReturnValue();
    v616 = -[RFButtonCardSection initWithProtobuf:](v613, "initWithProtobuf:", v615);

    v4 = (SFNullCardSection *)v616;
  }
  objc_msgSend(v3, "value");
  v617 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v617, "rfBinaryButtonCardSection");
  v618 = (void *)objc_claimAutoreleasedReturnValue();

  if (v618)
  {
    v619 = [RFBinaryButtonCardSection alloc];
    objc_msgSend(v3, "value");
    v620 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v620, "rfBinaryButtonCardSection");
    v621 = (void *)objc_claimAutoreleasedReturnValue();
    v622 = -[RFBinaryButtonCardSection initWithProtobuf:](v619, "initWithProtobuf:", v621);

    v4 = (SFNullCardSection *)v622;
  }
  objc_msgSend(v3, "value");
  v623 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v623, "rfReferenceCenteredCardSection");
  v624 = (void *)objc_claimAutoreleasedReturnValue();

  if (v624)
  {
    v625 = [RFReferenceCenteredCardSection alloc];
    objc_msgSend(v3, "value");
    v626 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v626, "rfReferenceCenteredCardSection");
    v627 = (void *)objc_claimAutoreleasedReturnValue();
    v628 = -[RFReferenceCenteredCardSection initWithProtobuf:](v625, "initWithProtobuf:", v627);

    v4 = (SFNullCardSection *)v628;
  }
  objc_msgSend(v3, "value");
  v629 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v629, "rfSecondaryHeaderStandardCardSection");
  v630 = (void *)objc_claimAutoreleasedReturnValue();

  if (v630)
  {
    v631 = [RFSecondaryHeaderStandardCardSection alloc];
    objc_msgSend(v3, "value");
    v632 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v632, "rfSecondaryHeaderStandardCardSection");
    v633 = (void *)objc_claimAutoreleasedReturnValue();
    v634 = -[RFSecondaryHeaderStandardCardSection initWithProtobuf:](v631, "initWithProtobuf:", v633);

    v4 = (SFNullCardSection *)v634;
  }
  objc_msgSend(v3, "value");
  v635 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v635, "rfSecondaryHeaderEmphasizedCardSection");
  v636 = (void *)objc_claimAutoreleasedReturnValue();

  if (v636)
  {
    v637 = [RFSecondaryHeaderEmphasizedCardSection alloc];
    objc_msgSend(v3, "value");
    v638 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v638, "rfSecondaryHeaderEmphasizedCardSection");
    v639 = (void *)objc_claimAutoreleasedReturnValue();
    v640 = -[RFSecondaryHeaderEmphasizedCardSection initWithProtobuf:](v637, "initWithProtobuf:", v639);

    v4 = (SFNullCardSection *)v640;
  }
  objc_msgSend(v3, "value");
  v641 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v641, "rfMapCardSection");
  v642 = (void *)objc_claimAutoreleasedReturnValue();

  if (v642)
  {
    v643 = [RFMapCardSection alloc];
    objc_msgSend(v3, "value");
    v644 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v644, "rfMapCardSection");
    v645 = (void *)objc_claimAutoreleasedReturnValue();
    v646 = -[RFMapCardSection initWithProtobuf:](v643, "initWithProtobuf:", v645);

    v4 = (SFNullCardSection *)v646;
  }
  objc_msgSend(v3, "value");
  v647 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v647, "rfReferenceStandardCardSection");
  v648 = (void *)objc_claimAutoreleasedReturnValue();

  if (v648)
  {
    v649 = [RFReferenceStandardCardSection alloc];
    objc_msgSend(v3, "value");
    v650 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v650, "rfReferenceStandardCardSection");
    v651 = (void *)objc_claimAutoreleasedReturnValue();
    v652 = -[RFReferenceStandardCardSection initWithProtobuf:](v649, "initWithProtobuf:", v651);

    v4 = (SFNullCardSection *)v652;
  }
  objc_msgSend(v3, "value");
  v653 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v653, "rfMultiButtonCardSection");
  v654 = (void *)objc_claimAutoreleasedReturnValue();

  if (v654)
  {
    v655 = [RFMultiButtonCardSection alloc];
    objc_msgSend(v3, "value");
    v656 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v656, "rfMultiButtonCardSection");
    v657 = (void *)objc_claimAutoreleasedReturnValue();
    v658 = -[RFMultiButtonCardSection initWithProtobuf:](v655, "initWithProtobuf:", v657);

    v4 = (SFNullCardSection *)v658;
  }
  objc_msgSend(v3, "value");
  v659 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v659, "rfDisambiguationTitleCardSection");
  v660 = (void *)objc_claimAutoreleasedReturnValue();

  if (v660)
  {
    v661 = [RFDisambiguationTitleCardSection alloc];
    objc_msgSend(v3, "value");
    v662 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v662, "rfDisambiguationTitleCardSection");
    v663 = (void *)objc_claimAutoreleasedReturnValue();
    v664 = -[RFDisambiguationTitleCardSection initWithProtobuf:](v661, "initWithProtobuf:", v663);

    v4 = (SFNullCardSection *)v664;
  }
  objc_msgSend(v3, "nextCard");
  v665 = (void *)objc_claimAutoreleasedReturnValue();

  if (v665)
  {
    v666 = [SFCard alloc];
    objc_msgSend(v3, "nextCard");
    v667 = (void *)objc_claimAutoreleasedReturnValue();
    v668 = -[SFCard initWithProtobuf:](v666, "initWithProtobuf:", v667);
    -[SFCardSection setNextCard:](v4, "setNextCard:", v668);

  }
  objc_msgSend(v3, "commands");
  v669 = (void *)objc_claimAutoreleasedReturnValue();
  v670 = objc_msgSend(v669, "count");

  if (v670)
  {
    objc_msgSend(v3, "commands");
    v671 = (void *)objc_claimAutoreleasedReturnValue();
    if (v671)
    {
      v672 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

    }
    else
    {
      v672 = 0;
    }

    v802 = 0u;
    v803 = 0u;
    v800 = 0u;
    v801 = 0u;
    objc_msgSend(v3, "commands");
    v673 = (void *)objc_claimAutoreleasedReturnValue();
    v674 = objc_msgSend(v673, "countByEnumeratingWithState:objects:count:", &v800, v810, 16);
    if (v674)
    {
      v675 = v674;
      v676 = *(_QWORD *)v801;
      do
      {
        for (i = 0; i != v675; ++i)
        {
          if (*(_QWORD *)v801 != v676)
            objc_enumerationMutation(v673);
          v678 = -[SFAbstractCommand initWithProtobuf:]([SFAbstractCommand alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v800 + 1) + 8 * i));
          if (v678)
            objc_msgSend(v672, "addObject:", v678);

        }
        v675 = objc_msgSend(v673, "countByEnumeratingWithState:objects:count:", &v800, v810, 16);
      }
      while (v675);
    }

    -[SFCardSection setCommands:](v4, "setCommands:", v672);
  }
  objc_msgSend(v3, "parameterKeyPaths");
  v679 = (void *)objc_claimAutoreleasedReturnValue();
  v680 = objc_msgSend(v679, "count");

  if (v680)
  {
    objc_msgSend(v3, "parameterKeyPaths");
    v681 = (void *)objc_claimAutoreleasedReturnValue();
    if (v681)
    {
      v682 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

    }
    else
    {
      v682 = 0;
    }

    v798 = 0u;
    v799 = 0u;
    v796 = 0u;
    v797 = 0u;
    objc_msgSend(v3, "parameterKeyPaths");
    v683 = (void *)objc_claimAutoreleasedReturnValue();
    v684 = objc_msgSend(v683, "countByEnumeratingWithState:objects:count:", &v796, v809, 16);
    if (v684)
    {
      v685 = v684;
      v686 = *(_QWORD *)v797;
      do
      {
        for (j = 0; j != v685; ++j)
        {
          if (*(_QWORD *)v797 != v686)
            objc_enumerationMutation(v683);
          v688 = *(id *)(*((_QWORD *)&v796 + 1) + 8 * j);
          if (v688)
            objc_msgSend(v682, "addObject:", v688);

        }
        v685 = objc_msgSend(v683, "countByEnumeratingWithState:objects:count:", &v796, v809, 16);
      }
      while (v685);
    }

    -[SFCardSection setParameterKeyPaths:](v4, "setParameterKeyPaths:", v682);
  }
  objc_msgSend(v3, "cardSectionId");
  v689 = (void *)objc_claimAutoreleasedReturnValue();

  if (v689)
  {
    objc_msgSend(v3, "cardSectionId");
    v690 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionId:](v4, "setCardSectionId:", v690);

  }
  objc_msgSend(v3, "resultIdentifier");
  v691 = (void *)objc_claimAutoreleasedReturnValue();

  if (v691)
  {
    objc_msgSend(v3, "resultIdentifier");
    v692 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setResultIdentifier:](v4, "setResultIdentifier:", v692);

  }
  objc_msgSend(v3, "userReportRequest");
  v693 = (void *)objc_claimAutoreleasedReturnValue();

  if (v693)
  {
    v694 = [SFUserReportRequest alloc];
    objc_msgSend(v3, "userReportRequest");
    v695 = (void *)objc_claimAutoreleasedReturnValue();
    v696 = -[SFUserReportRequest initWithProtobuf:](v694, "initWithProtobuf:", v695);
    -[SFCardSection setUserReportRequest:](v4, "setUserReportRequest:", v696);

  }
  objc_msgSend(v3, "command");
  v697 = (void *)objc_claimAutoreleasedReturnValue();

  if (v697)
  {
    v698 = [SFCommand alloc];
    objc_msgSend(v3, "command");
    v699 = (void *)objc_claimAutoreleasedReturnValue();
    v700 = -[SFCommand initWithProtobuf:](v698, "initWithProtobuf:", v699);
    -[SFCardSection setCommand:](v4, "setCommand:", v700);

  }
  objc_msgSend(v3, "previewCommand");
  v701 = (void *)objc_claimAutoreleasedReturnValue();

  if (v701)
  {
    v702 = [SFCommand alloc];
    objc_msgSend(v3, "previewCommand");
    v703 = (void *)objc_claimAutoreleasedReturnValue();
    v704 = -[SFCommand initWithProtobuf:](v702, "initWithProtobuf:", v703);
    -[SFCardSection setPreviewCommand:](v4, "setPreviewCommand:", v704);

  }
  objc_msgSend(v3, "previewButtonItems");
  v705 = (void *)objc_claimAutoreleasedReturnValue();
  v706 = objc_msgSend(v705, "count");

  if (v706)
  {
    objc_msgSend(v3, "previewButtonItems");
    v707 = (void *)objc_claimAutoreleasedReturnValue();
    if (v707)
    {
      v708 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

    }
    else
    {
      v708 = 0;
    }

    v794 = 0u;
    v795 = 0u;
    v792 = 0u;
    v793 = 0u;
    objc_msgSend(v3, "previewButtonItems");
    v709 = (void *)objc_claimAutoreleasedReturnValue();
    v710 = objc_msgSend(v709, "countByEnumeratingWithState:objects:count:", &v792, v808, 16);
    if (v710)
    {
      v711 = v710;
      v712 = *(_QWORD *)v793;
      do
      {
        for (k = 0; k != v711; ++k)
        {
          if (*(_QWORD *)v793 != v712)
            objc_enumerationMutation(v709);
          v714 = -[SFButtonItem initWithProtobuf:]([SFButtonItem alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v792 + 1) + 8 * k));
          if (v714)
            objc_msgSend(v708, "addObject:", v714);

        }
        v711 = objc_msgSend(v709, "countByEnumeratingWithState:objects:count:", &v792, v808, 16);
      }
      while (v711);
    }

    -[SFCardSection setPreviewButtonItems:](v4, "setPreviewButtonItems:", v708);
  }
  objc_msgSend(v3, "cardSectionDetail");
  v715 = (void *)objc_claimAutoreleasedReturnValue();

  if (v715)
  {
    objc_msgSend(v3, "cardSectionDetail");
    v716 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionDetail:](v4, "setCardSectionDetail:", v716);

  }
  objc_msgSend(v3, "previewButtonItemsTitle");
  v717 = (void *)objc_claimAutoreleasedReturnValue();

  if (v717)
  {
    objc_msgSend(v3, "previewButtonItemsTitle");
    v718 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItemsTitle:](v4, "setPreviewButtonItemsTitle:", v718);

  }
  objc_msgSend(v3, "backgroundColor");
  v719 = (void *)objc_claimAutoreleasedReturnValue();

  if (v719)
  {
    v720 = [SFColor alloc];
    objc_msgSend(v3, "backgroundColor");
    v721 = (void *)objc_claimAutoreleasedReturnValue();
    v722 = -[SFColor initWithProtobuf:](v720, "initWithProtobuf:", v721);
    -[SFCardSection setBackgroundColor:](v4, "setBackgroundColor:", v722);

  }
  if (objc_msgSend(v3, "shouldHideInAmbientMode"))
    -[SFCardSection setShouldHideInAmbientMode:](v4, "setShouldHideInAmbientMode:", objc_msgSend(v3, "shouldHideInAmbientMode"));
  objc_msgSend(v3, "leadingSwipeButtonItems");
  v723 = (void *)objc_claimAutoreleasedReturnValue();
  v724 = objc_msgSend(v723, "count");

  if (v724)
  {
    objc_msgSend(v3, "leadingSwipeButtonItems");
    v725 = (void *)objc_claimAutoreleasedReturnValue();
    if (v725)
    {
      v726 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

    }
    else
    {
      v726 = 0;
    }

    v790 = 0u;
    v791 = 0u;
    v788 = 0u;
    v789 = 0u;
    objc_msgSend(v3, "leadingSwipeButtonItems");
    v727 = (void *)objc_claimAutoreleasedReturnValue();
    v728 = objc_msgSend(v727, "countByEnumeratingWithState:objects:count:", &v788, v807, 16);
    if (v728)
    {
      v729 = v728;
      v730 = *(_QWORD *)v789;
      do
      {
        for (m = 0; m != v729; ++m)
        {
          if (*(_QWORD *)v789 != v730)
            objc_enumerationMutation(v727);
          v732 = -[SFButtonItem initWithProtobuf:]([SFButtonItem alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v788 + 1) + 8 * m));
          if (v732)
            objc_msgSend(v726, "addObject:", v732);

        }
        v729 = objc_msgSend(v727, "countByEnumeratingWithState:objects:count:", &v788, v807, 16);
      }
      while (v729);
    }

    -[SFCardSection setLeadingSwipeButtonItems:](v4, "setLeadingSwipeButtonItems:", v726);
  }
  objc_msgSend(v3, "trailingSwipeButtonItems");
  v733 = (void *)objc_claimAutoreleasedReturnValue();
  v734 = objc_msgSend(v733, "count");

  if (v734)
  {
    objc_msgSend(v3, "trailingSwipeButtonItems");
    v735 = (void *)objc_claimAutoreleasedReturnValue();
    if (v735)
    {
      v736 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

    }
    else
    {
      v736 = 0;
    }

    v786 = 0u;
    v787 = 0u;
    v784 = 0u;
    v785 = 0u;
    objc_msgSend(v3, "trailingSwipeButtonItems");
    v737 = (void *)objc_claimAutoreleasedReturnValue();
    v738 = objc_msgSend(v737, "countByEnumeratingWithState:objects:count:", &v784, v806, 16);
    if (v738)
    {
      v739 = v738;
      v740 = *(_QWORD *)v785;
      do
      {
        for (n = 0; n != v739; ++n)
        {
          if (*(_QWORD *)v785 != v740)
            objc_enumerationMutation(v737);
          v742 = -[SFButtonItem initWithProtobuf:]([SFButtonItem alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v784 + 1) + 8 * n));
          if (v742)
            objc_msgSend(v736, "addObject:", v742);

        }
        v739 = objc_msgSend(v737, "countByEnumeratingWithState:objects:count:", &v784, v806, 16);
      }
      while (v739);
    }

    -[SFCardSection setTrailingSwipeButtonItems:](v4, "setTrailingSwipeButtonItems:", v736);
  }
  objc_msgSend(v3, "punchoutOptions");
  v743 = (void *)objc_claimAutoreleasedReturnValue();
  v744 = objc_msgSend(v743, "count");

  if (v744)
  {
    objc_msgSend(v3, "punchoutOptions");
    v745 = (void *)objc_claimAutoreleasedReturnValue();
    if (v745)
    {
      v746 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

    }
    else
    {
      v746 = 0;
    }

    v782 = 0u;
    v783 = 0u;
    v780 = 0u;
    v781 = 0u;
    objc_msgSend(v3, "punchoutOptions");
    v747 = (void *)objc_claimAutoreleasedReturnValue();
    v748 = objc_msgSend(v747, "countByEnumeratingWithState:objects:count:", &v780, v805, 16);
    if (v748)
    {
      v749 = v748;
      v750 = *(_QWORD *)v781;
      do
      {
        for (ii = 0; ii != v749; ++ii)
        {
          if (*(_QWORD *)v781 != v750)
            objc_enumerationMutation(v747);
          v752 = -[SFPunchout initWithProtobuf:]([SFPunchout alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v780 + 1) + 8 * ii));
          if (v752)
            objc_msgSend(v746, "addObject:", v752);

        }
        v749 = objc_msgSend(v747, "countByEnumeratingWithState:objects:count:", &v780, v805, 16);
      }
      while (v749);
    }

    -[SFCardSection setPunchoutOptions:](v4, "setPunchoutOptions:", v746);
  }
  objc_msgSend(v3, "punchoutPickerTitle");
  v753 = (void *)objc_claimAutoreleasedReturnValue();

  if (v753)
  {
    objc_msgSend(v3, "punchoutPickerTitle");
    v754 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerTitle:](v4, "setPunchoutPickerTitle:", v754);

  }
  objc_msgSend(v3, "punchoutPickerDismissText");
  v755 = (void *)objc_claimAutoreleasedReturnValue();

  if (v755)
  {
    objc_msgSend(v3, "punchoutPickerDismissText");
    v756 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerDismissText:](v4, "setPunchoutPickerDismissText:", v756);

  }
  if (objc_msgSend(v3, "canBeHidden"))
    -[SFCardSection setCanBeHidden:](v4, "setCanBeHidden:", objc_msgSend(v3, "canBeHidden"));
  if (objc_msgSend(v3, "hasTopPadding"))
    -[SFCardSection setHasTopPadding:](v4, "setHasTopPadding:", objc_msgSend(v3, "hasTopPadding"));
  if (objc_msgSend(v3, "hasBottomPadding"))
    -[SFCardSection setHasBottomPadding:](v4, "setHasBottomPadding:", objc_msgSend(v3, "hasBottomPadding"));
  if (objc_msgSend(v3, "separatorStyle"))
    -[SFCardSection setSeparatorStyle:](v4, "setSeparatorStyle:", objc_msgSend(v3, "separatorStyle"));
  objc_msgSend(v3, "referencedCommands");
  v757 = (void *)objc_claimAutoreleasedReturnValue();
  v758 = objc_msgSend(v757, "count");

  if (v758)
  {
    objc_msgSend(v3, "referencedCommands");
    v759 = (void *)objc_claimAutoreleasedReturnValue();
    if (v759)
    {
      v760 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

    }
    else
    {
      v760 = 0;
    }

    v778 = 0u;
    v779 = 0u;
    v776 = 0u;
    v777 = 0u;
    objc_msgSend(v3, "referencedCommands");
    v761 = (void *)objc_claimAutoreleasedReturnValue();
    v762 = objc_msgSend(v761, "countByEnumeratingWithState:objects:count:", &v776, v804, 16);
    if (v762)
    {
      v763 = v762;
      v764 = *(_QWORD *)v777;
      do
      {
        for (jj = 0; jj != v763; ++jj)
        {
          if (*(_QWORD *)v777 != v764)
            objc_enumerationMutation(v761);
          v766 = -[SFCommand initWithProtobuf:]([SFCommand alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v776 + 1) + 8 * jj));
          if (v766)
            objc_msgSend(v760, "addObject:", v766);

        }
        v763 = objc_msgSend(v761, "countByEnumeratingWithState:objects:count:", &v776, v804, 16);
      }
      while (v763);
    }

    -[SFCardSection setReferencedCommands:](v4, "setReferencedCommands:", v760);
  }
  if (objc_msgSend(v3, "forceEnable3DTouch"))
    -[SFCardSection setForceEnable3DTouch:](v4, "setForceEnable3DTouch:", objc_msgSend(v3, "forceEnable3DTouch"));
  if (objc_msgSend(v3, "shouldShowInSmartDialog"))
    -[SFCardSection setShouldShowInSmartDialog:](v4, "setShouldShowInSmartDialog:", objc_msgSend(v3, "shouldShowInSmartDialog"));
  objc_msgSend(v3, "appEntityAnnotation");
  v767 = (void *)objc_claimAutoreleasedReturnValue();

  if (v767)
  {
    v768 = [SFAppEntityAnnotation alloc];
    objc_msgSend(v3, "appEntityAnnotation");
    v769 = (void *)objc_claimAutoreleasedReturnValue();
    v770 = -[SFAppEntityAnnotation initWithProtobuf:](v768, "initWithProtobuf:", v769);
    -[SFCardSection setAppEntityAnnotation:](v4, "setAppEntityAnnotation:", v770);

  }
  objc_msgSend(v3, "emphasisSubjectId");
  v771 = (void *)objc_claimAutoreleasedReturnValue();

  if (v771)
  {
    objc_msgSend(v3, "emphasisSubjectId");
    v772 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setEmphasisSubjectId:](v4, "setEmphasisSubjectId:", v772);

  }
  v773 = v4;

  return v773;
}

- (void)setCanBeHidden:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_canBeHidden = a3;
}

- (BOOL)hasCanBeHidden
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasTopPadding:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_hasTopPadding = a3;
}

- (BOOL)hasHasTopPadding
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasBottomPadding:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_hasBottomPadding = a3;
}

- (BOOL)hasHasBottomPadding
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setSeparatorStyle:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_separatorStyle = a3;
}

- (BOOL)hasSeparatorStyle
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (SFCardSection)init
{
  SFCardSection *v2;
  void *v3;
  uint64_t v4;
  NSString *cardSectionId;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFCardSection;
  v2 = -[SFCardSection init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = objc_claimAutoreleasedReturnValue();
    cardSectionId = v2->_cardSectionId;
    v2->_cardSectionId = (NSString *)v4;

  }
  return v2;
}

- (BOOL)hideDivider
{
  return -[SFCardSection separatorStyle](self, "separatorStyle") == 1;
}

- (SFCardSection)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBCardSection *v6;
  SFCardSection *v7;
  uint64_t v8;
  NSString *commandDetail;
  uint64_t v10;
  NSString *type;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_SFPBCardSection initWithData:]([_SFPBCardSection alloc], "initWithData:", v5);
  v7 = -[SFCardSection initWithProtobuf:](self, "initWithProtobuf:", v6);

  if (v7)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_commandDetail"));
    v8 = objc_claimAutoreleasedReturnValue();
    commandDetail = v7->_commandDetail;
    v7->_commandDetail = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_type"));
    v10 = objc_claimAutoreleasedReturnValue();
    type = v7->_type;
    v7->_type = (NSString *)v10;

  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBCardSection *v6;

  v4 = a3;
  v6 = -[_SFPBCardSection initWithFacade:]([_SFPBCardSection alloc], "initWithFacade:", self);
  -[_SFPBCardSection data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

  objc_msgSend(v4, "encodeObject:forKey:", self->_commandDetail, CFSTR("_commandDetail"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_type, CFSTR("_type"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
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
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[SFColor copy](self->_backgroundColor, "copy");
  v6 = *(void **)(v4 + 88);
  *(_QWORD *)(v4 + 88) = v5;

  *(_BYTE *)(v4 + 13) = self->_canBeHidden;
  v7 = -[NSString copy](self->_cardSectionDetail, "copy");
  v8 = *(void **)(v4 + 144);
  *(_QWORD *)(v4 + 144) = v7;

  v9 = -[NSString copy](self->_cardSectionId, "copy");
  v10 = *(void **)(v4 + 80);
  *(_QWORD *)(v4 + 80) = v9;

  v11 = -[SFCommand copy](self->_command, "copy");
  v12 = *(void **)(v4 + 112);
  *(_QWORD *)(v4 + 112) = v11;

  v13 = -[NSString copy](self->_commandDetail, "copy");
  v14 = *(void **)(v4 + 136);
  *(_QWORD *)(v4 + 136) = v13;

  *(_BYTE *)(v4 + 12) = self->_hasBottomPadding;
  *(_BYTE *)(v4 + 14) = self->_hasTopPadding;
  *(_BYTE *)(v4 + 15) = self->_hideDivider;
  objc_storeStrong((id *)(v4 + 160), self->_leadingSwipeButtonItems);
  v15 = -[SFCard copy](self->_nextCard, "copy");
  v16 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = v15;

  v17 = -[NSArray copy](self->_previewButtonItems, "copy");
  v18 = *(void **)(v4 + 128);
  *(_QWORD *)(v4 + 128) = v17;

  v19 = -[NSString copy](self->_previewButtonItemsTitle, "copy");
  v20 = *(void **)(v4 + 152);
  *(_QWORD *)(v4 + 152) = v19;

  v21 = -[SFCommand copy](self->_previewCommand, "copy");
  v22 = *(void **)(v4 + 120);
  *(_QWORD *)(v4 + 120) = v21;

  v23 = -[NSArray copy](self->_punchoutOptions, "copy");
  v24 = *(void **)(v4 + 56);
  *(_QWORD *)(v4 + 56) = v23;

  v25 = -[NSString copy](self->_punchoutPickerDismissText, "copy");
  v26 = *(void **)(v4 + 64);
  *(_QWORD *)(v4 + 64) = v25;

  v27 = -[NSString copy](self->_punchoutPickerTitle, "copy");
  v28 = *(void **)(v4 + 48);
  *(_QWORD *)(v4 + 48) = v27;

  v29 = -[NSString copy](self->_resultIdentifier, "copy");
  v30 = *(void **)(v4 + 96);
  *(_QWORD *)(v4 + 96) = v29;

  *(_DWORD *)(v4 + 20) = self->_separatorStyle;
  *(_BYTE *)(v4 + 16) = self->_shouldHideInAmbientMode;
  objc_storeStrong((id *)(v4 + 168), self->_trailingSwipeButtonItems);
  v31 = -[NSArray copy](self->_referencedCommands, "copy");
  v32 = *(void **)(v4 + 176);
  *(_QWORD *)(v4 + 176) = v31;

  v33 = -[NSString copy](self->_type, "copy");
  v34 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v33;

  *(_BYTE *)(v4 + 17) = self->_forceEnable3DTouch;
  *(_BYTE *)(v4 + 18) = self->_shouldShowInSmartDialog;
  v35 = -[SFAppEntityAnnotation copy](self->_appEntityAnnotation, "copy");
  v36 = *(void **)(v4 + 184);
  *(_QWORD *)(v4 + 184) = v35;

  v37 = -[NSString copy](self->_emphasisSubjectId, "copy");
  v38 = *(void **)(v4 + 192);
  *(_QWORD *)(v4 + 192) = v37;

  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  SFCardSection *v4;
  SFCardSection *v5;
  NSArray *punchoutOptions;
  NSString *punchoutPickerTitle;
  NSString *punchoutPickerDismissText;
  NSString *type;
  SFCard *nextCard;
  NSArray *commands;
  NSArray *parameterKeyPaths;
  NSString *cardSectionId;
  NSString *resultIdentifier;
  SFColor *backgroundColor;
  SFCommand *command;
  SFCommand *previewCommand;
  NSArray *previewButtonItems;
  NSString *commandDetail;
  NSString *cardSectionDetail;
  NSString *previewButtonItemsTitle;
  SFAppEntityAnnotation *appEntityAnnotation;
  NSString *emphasisSubjectId;
  NSString *v24;
  char v25;

  v4 = (SFCardSection *)a3;
  if (self == v4)
  {
    v25 = 1;
  }
  else if (-[SFCardSection isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    punchoutOptions = self->_punchoutOptions;
    if ((punchoutOptions != 0) == (v5->_punchoutOptions == 0)
      || punchoutOptions && !-[NSArray isEqual:](punchoutOptions, "isEqual:"))
    {
      goto LABEL_68;
    }
    punchoutPickerTitle = self->_punchoutPickerTitle;
    if ((punchoutPickerTitle != 0) == (v5->_punchoutPickerTitle == 0)
      || punchoutPickerTitle && !-[NSString isEqual:](punchoutPickerTitle, "isEqual:"))
    {
      goto LABEL_68;
    }
    punchoutPickerDismissText = self->_punchoutPickerDismissText;
    if ((punchoutPickerDismissText != 0) == (v5->_punchoutPickerDismissText == 0)
      || punchoutPickerDismissText && !-[NSString isEqual:](punchoutPickerDismissText, "isEqual:"))
    {
      goto LABEL_68;
    }
    if (self->_canBeHidden != v5->_canBeHidden)
      goto LABEL_68;
    if (self->_hasTopPadding != v5->_hasTopPadding)
      goto LABEL_68;
    if (self->_hasBottomPadding != v5->_hasBottomPadding)
      goto LABEL_68;
    type = self->_type;
    if ((type != 0) == (v5->_type == 0) || type && !-[NSString isEqual:](type, "isEqual:"))
      goto LABEL_68;
    if (self->_separatorStyle != v5->_separatorStyle)
      goto LABEL_68;
    nextCard = self->_nextCard;
    if ((nextCard != 0) == (v5->_nextCard == 0) || nextCard && !-[SFCard isEqual:](nextCard, "isEqual:"))
      goto LABEL_68;
    commands = self->_commands;
    if ((commands != 0) == (v5->_commands == 0)
      || commands && !-[NSArray isEqual:](commands, "isEqual:"))
    {
      goto LABEL_68;
    }
    parameterKeyPaths = self->_parameterKeyPaths;
    if ((parameterKeyPaths != 0) == (v5->_parameterKeyPaths == 0)
      || parameterKeyPaths && !-[NSArray isEqual:](parameterKeyPaths, "isEqual:"))
    {
      goto LABEL_68;
    }
    cardSectionId = self->_cardSectionId;
    if ((cardSectionId != 0) == (v5->_cardSectionId == 0)
      || cardSectionId && !-[NSString isEqual:](cardSectionId, "isEqual:"))
    {
      goto LABEL_68;
    }
    resultIdentifier = self->_resultIdentifier;
    if ((resultIdentifier != 0) == (v5->_resultIdentifier == 0)
      || resultIdentifier && !-[NSString isEqual:](resultIdentifier, "isEqual:"))
    {
      goto LABEL_68;
    }
    backgroundColor = self->_backgroundColor;
    if ((backgroundColor != 0) == (v5->_backgroundColor == 0)
      || backgroundColor && !-[SFColor isEqual:](backgroundColor, "isEqual:"))
    {
      goto LABEL_68;
    }
    if ((command = self->_command, (command != 0) == (v5->_command == 0))
      || command && !-[SFCommand isEqual:](command, "isEqual:")
      || (previewCommand = self->_previewCommand, (previewCommand != 0) == (v5->_previewCommand == 0))
      || previewCommand && !-[SFCommand isEqual:](previewCommand, "isEqual:")
      || (previewButtonItems = self->_previewButtonItems, (previewButtonItems != 0) == (v5->_previewButtonItems == 0))
      || previewButtonItems && !-[NSArray isEqual:](previewButtonItems, "isEqual:")
      || (commandDetail = self->_commandDetail, (commandDetail != 0) == (v5->_commandDetail == 0))
      || commandDetail && !-[NSString isEqual:](commandDetail, "isEqual:")
      || (cardSectionDetail = self->_cardSectionDetail, (cardSectionDetail != 0) == (v5->_cardSectionDetail == 0))
      || cardSectionDetail && !-[NSString isEqual:](cardSectionDetail, "isEqual:")
      || (previewButtonItemsTitle = self->_previewButtonItemsTitle,
          (previewButtonItemsTitle != 0) == (v5->_previewButtonItemsTitle == 0))
      || previewButtonItemsTitle && !-[NSString isEqual:](previewButtonItemsTitle, "isEqual:")
      || self->_shouldHideInAmbientMode != v5->_shouldHideInAmbientMode
      || self->_leadingSwipeButtonItems != v5->_leadingSwipeButtonItems
      || self->_trailingSwipeButtonItems != v5->_trailingSwipeButtonItems
      || self->_forceEnable3DTouch != v5->_forceEnable3DTouch
      || self->_shouldShowInSmartDialog != v5->_shouldShowInSmartDialog
      || (appEntityAnnotation = self->_appEntityAnnotation,
          (appEntityAnnotation != 0) == (v5->_appEntityAnnotation == 0))
      || appEntityAnnotation && !-[SFAppEntityAnnotation isEqual:](appEntityAnnotation, "isEqual:"))
    {
LABEL_68:
      v25 = 0;
    }
    else
    {
      emphasisSubjectId = self->_emphasisSubjectId;
      v24 = v5->_emphasisSubjectId;
      v25 = (emphasisSubjectId != 0) == (v24 != 0);
      if (emphasisSubjectId && v24)
        v25 = -[NSString isEqual:](emphasisSubjectId, "isEqual:");
    }

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  unint64_t v6;
  NSUInteger v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  NSUInteger v17;
  NSUInteger v18;
  NSUInteger v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;

  v3 = -[NSArray hash](self->_punchoutOptions, "hash");
  v4 = -[NSString hash](self->_punchoutPickerTitle, "hash") ^ v3;
  v5 = v4 ^ -[NSString hash](self->_punchoutPickerDismissText, "hash") ^ self->_canBeHidden;
  v6 = self->_hasTopPadding ^ (unint64_t)self->_hasBottomPadding;
  v7 = v5 ^ v6 ^ -[NSString hash](self->_type, "hash") ^ self->_separatorStyle;
  v8 = -[SFCard hash](self->_nextCard, "hash");
  v9 = v8 ^ -[NSArray hash](self->_commands, "hash");
  v10 = v9 ^ -[NSArray hash](self->_parameterKeyPaths, "hash");
  v11 = v7 ^ v10 ^ -[NSString hash](self->_cardSectionId, "hash");
  v12 = -[NSString hash](self->_resultIdentifier, "hash");
  v13 = v12 ^ -[SFColor hash](self->_backgroundColor, "hash");
  v14 = v13 ^ -[SFCommand hash](self->_command, "hash");
  v15 = v14 ^ -[SFCommand hash](self->_previewCommand, "hash");
  v16 = v11 ^ v15 ^ -[NSArray hash](self->_previewButtonItems, "hash");
  v17 = -[NSString hash](self->_commandDetail, "hash");
  v18 = v17 ^ -[NSString hash](self->_cardSectionDetail, "hash");
  v19 = v18 ^ -[NSString hash](self->_previewButtonItemsTitle, "hash") ^ self->_shouldHideInAmbientMode;
  v20 = v19 ^ -[NSArray hash](self->_leadingSwipeButtonItems, "hash");
  v21 = v16 ^ v20 ^ -[NSArray hash](self->_trailingSwipeButtonItems, "hash");
  v22 = self->_forceEnable3DTouch ^ (unint64_t)self->_shouldShowInSmartDialog;
  v23 = v22 ^ -[SFAppEntityAnnotation hash](self->_appEntityAnnotation, "hash");
  return v21 ^ v23 ^ -[NSString hash](self->_emphasisSubjectId, "hash");
}

- (NSArray)embeddedCards
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCardSection nextCard](self, "nextCard");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SFCardSection nextCard](self, "nextCard");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[SFCardSection nextCard](self, "nextCard", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cardSections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "embeddedCards");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObjectsFromArray:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

  }
  -[SFCardSection addCardsFromCommandsTo:](self, "addCardsFromCommandsTo:", v3);
  -[SFCardSection addCardsFromButtonsTo:](self, "addCardsFromButtonsTo:", v3);
  -[SFCardSection addCardsFromEmbeddedSectionsTo:](self, "addCardsFromEmbeddedSectionsTo:", v3);
  return (NSArray *)v3;
}

- (void)addCardsFromCommandsTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[SFCardSection previewCommand](self, "previewCommand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "embeddedCards");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v6);

  -[SFCardSection command](self, "command");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "embeddedCards");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v7);

}

- (void)addCardsFromButtonsTo:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SFCardSection previewButtonItems](self, "previewButtonItems", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "command");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "embeddedCards");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObjectsFromArray:", v12);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (void)addCardsFromEmbeddedSectionsTo:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SFCardSection sectionsWithCards](self, "sectionsWithCards", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "embeddedCards");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObjectsFromArray:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (NSArray)sectionsWithCards
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (SFCard)nextCard
{
  return self->_nextCard;
}

- (void)setNextCard:(id)a3
{
  objc_storeStrong((id *)&self->_nextCard, a3);
}

- (BOOL)hasBottomPadding
{
  return self->_hasBottomPadding;
}

- (NSArray)commands
{
  return self->_commands;
}

- (void)setCommands:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)punchoutPickerTitle
{
  return self->_punchoutPickerTitle;
}

- (void)setPunchoutPickerTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)punchoutOptions
{
  return self->_punchoutOptions;
}

- (void)setPunchoutOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)punchoutPickerDismissText
{
  return self->_punchoutPickerDismissText;
}

- (void)setPunchoutPickerDismissText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)canBeHidden
{
  return self->_canBeHidden;
}

- (BOOL)hasTopPadding
{
  return self->_hasTopPadding;
}

- (int)separatorStyle
{
  return self->_separatorStyle;
}

- (NSArray)parameterKeyPaths
{
  return self->_parameterKeyPaths;
}

- (void)setParameterKeyPaths:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)cardSectionId
{
  return self->_cardSectionId;
}

- (void)setCardSectionId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (SFColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (NSString)resultIdentifier
{
  return self->_resultIdentifier;
}

- (void)setResultIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (SFUserReportRequest)userReportRequest
{
  return self->_userReportRequest;
}

- (void)setUserReportRequest:(id)a3
{
  objc_storeStrong((id *)&self->_userReportRequest, a3);
}

- (SFCommand)command
{
  return self->_command;
}

- (void)setCommand:(id)a3
{
  objc_storeStrong((id *)&self->_command, a3);
}

- (SFCommand)previewCommand
{
  return self->_previewCommand;
}

- (void)setPreviewCommand:(id)a3
{
  objc_storeStrong((id *)&self->_previewCommand, a3);
}

- (NSArray)previewButtonItems
{
  return self->_previewButtonItems;
}

- (void)setPreviewButtonItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)commandDetail
{
  return self->_commandDetail;
}

- (void)setCommandDetail:(id)a3
{
  objc_storeStrong((id *)&self->_commandDetail, a3);
}

- (NSString)cardSectionDetail
{
  return self->_cardSectionDetail;
}

- (void)setCardSectionDetail:(id)a3
{
  objc_storeStrong((id *)&self->_cardSectionDetail, a3);
}

- (NSString)previewButtonItemsTitle
{
  return self->_previewButtonItemsTitle;
}

- (void)setPreviewButtonItemsTitle:(id)a3
{
  objc_storeStrong((id *)&self->_previewButtonItemsTitle, a3);
}

- (BOOL)shouldHideInAmbientMode
{
  return self->_shouldHideInAmbientMode;
}

- (void)setShouldHideInAmbientMode:(BOOL)a3
{
  self->_shouldHideInAmbientMode = a3;
}

- (NSArray)leadingSwipeButtonItems
{
  return self->_leadingSwipeButtonItems;
}

- (void)setLeadingSwipeButtonItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSArray)trailingSwipeButtonItems
{
  return self->_trailingSwipeButtonItems;
}

- (void)setTrailingSwipeButtonItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSArray)referencedCommands
{
  return self->_referencedCommands;
}

- (void)setReferencedCommands:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (BOOL)forceEnable3DTouch
{
  return self->_forceEnable3DTouch;
}

- (void)setForceEnable3DTouch:(BOOL)a3
{
  self->_forceEnable3DTouch = a3;
}

- (BOOL)shouldShowInSmartDialog
{
  return self->_shouldShowInSmartDialog;
}

- (void)setShouldShowInSmartDialog:(BOOL)a3
{
  self->_shouldShowInSmartDialog = a3;
}

- (SFAppEntityAnnotation)appEntityAnnotation
{
  return self->_appEntityAnnotation;
}

- (void)setAppEntityAnnotation:(id)a3
{
  objc_storeStrong((id *)&self->_appEntityAnnotation, a3);
}

- (NSString)emphasisSubjectId
{
  return self->_emphasisSubjectId;
}

- (void)setEmphasisSubjectId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emphasisSubjectId, 0);
  objc_storeStrong((id *)&self->_appEntityAnnotation, 0);
  objc_storeStrong((id *)&self->_referencedCommands, 0);
  objc_storeStrong((id *)&self->_trailingSwipeButtonItems, 0);
  objc_storeStrong((id *)&self->_leadingSwipeButtonItems, 0);
  objc_storeStrong((id *)&self->_previewButtonItemsTitle, 0);
  objc_storeStrong((id *)&self->_cardSectionDetail, 0);
  objc_storeStrong((id *)&self->_commandDetail, 0);
  objc_storeStrong((id *)&self->_previewButtonItems, 0);
  objc_storeStrong((id *)&self->_previewCommand, 0);
  objc_storeStrong((id *)&self->_command, 0);
  objc_storeStrong((id *)&self->_userReportRequest, 0);
  objc_storeStrong((id *)&self->_resultIdentifier, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_cardSectionId, 0);
  objc_storeStrong((id *)&self->_parameterKeyPaths, 0);
  objc_storeStrong((id *)&self->_punchoutPickerDismissText, 0);
  objc_storeStrong((id *)&self->_punchoutOptions, 0);
  objc_storeStrong((id *)&self->_punchoutPickerTitle, 0);
  objc_storeStrong((id *)&self->_commands, 0);
  objc_storeStrong((id *)&self->_nextCard, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCardSection punchoutOptions](self, "punchoutOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[SFCardSection punchoutOptions](self, "punchoutOptions", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("punchoutOptions"));
  }
  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SFCardSection dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

@end
