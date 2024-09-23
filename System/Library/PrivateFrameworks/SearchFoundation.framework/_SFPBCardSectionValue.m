@implementation _SFPBCardSectionValue

- (_SFPBCardSectionValue)initWithFacade:(id)a3
{
  id v4;
  _SFPBCardSectionValue *v5;
  void *v6;
  _SFPBAppLinkCardSection *v7;
  void *v8;
  _SFPBAppLinkCardSection *v9;
  void *v10;
  _SFPBDescriptionCardSection *v11;
  void *v12;
  _SFPBDescriptionCardSection *v13;
  void *v14;
  _SFPBKeyValueDataCardSection *v15;
  void *v16;
  _SFPBKeyValueDataCardSection *v17;
  void *v18;
  _SFPBMapCardSection *v19;
  void *v20;
  _SFPBMapCardSection *v21;
  void *v22;
  _SFPBMediaInfoCardSection *v23;
  void *v24;
  _SFPBMediaInfoCardSection *v25;
  void *v26;
  _SFPBMediaPlayerCardSection *v27;
  void *v28;
  _SFPBMediaPlayerCardSection *v29;
  void *v30;
  _SFPBNowPlayingCardSection *v31;
  void *v32;
  _SFPBNowPlayingCardSection *v33;
  void *v34;
  _SFPBRichTitleCardSection *v35;
  void *v36;
  _SFPBRichTitleCardSection *v37;
  void *v38;
  _SFPBRowCardSection *v39;
  void *v40;
  _SFPBRowCardSection *v41;
  void *v42;
  _SFPBScoreboardCardSection *v43;
  void *v44;
  _SFPBScoreboardCardSection *v45;
  void *v46;
  _SFPBSocialMediaPostCardSection *v47;
  void *v48;
  _SFPBSocialMediaPostCardSection *v49;
  void *v50;
  _SFPBStockChartCardSection *v51;
  void *v52;
  _SFPBStockChartCardSection *v53;
  void *v54;
  _SFPBTableHeaderRowCardSection *v55;
  void *v56;
  _SFPBTableHeaderRowCardSection *v57;
  void *v58;
  _SFPBTableRowCardSection *v59;
  void *v60;
  _SFPBTableRowCardSection *v61;
  void *v62;
  _SFPBTextColumnsCardSection *v63;
  void *v64;
  _SFPBTextColumnsCardSection *v65;
  void *v66;
  _SFPBTitleCardSection *v67;
  void *v68;
  _SFPBTitleCardSection *v69;
  void *v70;
  _SFPBTrackListCardSection *v71;
  void *v72;
  _SFPBTrackListCardSection *v73;
  void *v74;
  _SFPBAudioPlaybackCardSection *v75;
  void *v76;
  _SFPBAudioPlaybackCardSection *v77;
  void *v78;
  _SFPBFlightCardSection *v79;
  void *v80;
  _SFPBFlightCardSection *v81;
  void *v82;
  _SFPBActivityIndicatorCardSection *v83;
  void *v84;
  _SFPBActivityIndicatorCardSection *v85;
  void *v86;
  _SFPBWebCardSection *v87;
  void *v88;
  _SFPBWebCardSection *v89;
  void *v90;
  _SFPBMessageCardSection *v91;
  void *v92;
  _SFPBMessageCardSection *v93;
  void *v94;
  _SFPBDetailedRowCardSection *v95;
  void *v96;
  _SFPBDetailedRowCardSection *v97;
  void *v98;
  _SFPBImagesCardSection *v99;
  void *v100;
  _SFPBImagesCardSection *v101;
  void *v102;
  _SFPBSuggestionCardSection *v103;
  void *v104;
  _SFPBSuggestionCardSection *v105;
  void *v106;
  _SFPBSelectableGridCardSection *v107;
  void *v108;
  _SFPBSelectableGridCardSection *v109;
  void *v110;
  _SFPBSectionHeaderCardSection *v111;
  void *v112;
  _SFPBSectionHeaderCardSection *v113;
  void *v114;
  _SFPBMetaInfoCardSection *v115;
  void *v116;
  _SFPBMetaInfoCardSection *v117;
  void *v118;
  _SFPBWatchListCardSection *v119;
  void *v120;
  _SFPBWatchListCardSection *v121;
  void *v122;
  _SFPBMapsDetailedRowCardSection *v123;
  void *v124;
  _SFPBMapsDetailedRowCardSection *v125;
  void *v126;
  _SFPBButtonCardSection *v127;
  void *v128;
  _SFPBButtonCardSection *v129;
  void *v130;
  _SFPBHorizontalButtonCardSection *v131;
  void *v132;
  _SFPBHorizontalButtonCardSection *v133;
  void *v134;
  _SFPBVerticalLayoutCardSection *v135;
  void *v136;
  _SFPBVerticalLayoutCardSection *v137;
  void *v138;
  _SFPBProductCardSection *v139;
  void *v140;
  _SFPBProductCardSection *v141;
  void *v142;
  _SFPBHorizontalScrollCardSection *v143;
  void *v144;
  _SFPBHorizontalScrollCardSection *v145;
  void *v146;
  _SFPBMediaRemoteControlCardSection *v147;
  void *v148;
  _SFPBMediaRemoteControlCardSection *v149;
  void *v150;
  _SFPBMapPlaceCardSection *v151;
  void *v152;
  _SFPBMapPlaceCardSection *v153;
  void *v154;
  _SFPBCompactRowCardSection *v155;
  void *v156;
  _SFPBCompactRowCardSection *v157;
  void *v158;
  _SFPBWorldMapCardSection *v159;
  void *v160;
  _SFPBWorldMapCardSection *v161;
  void *v162;
  _SFPBAttributionFooterCardSection *v163;
  void *v164;
  _SFPBAttributionFooterCardSection *v165;
  void *v166;
  _SFPBGridCardSection *v167;
  void *v168;
  _SFPBGridCardSection *v169;
  void *v170;
  _SFPBPersonHeaderCardSection *v171;
  void *v172;
  _SFPBPersonHeaderCardSection *v173;
  void *v174;
  _SFPBColorBarCardSection *v175;
  void *v176;
  _SFPBColorBarCardSection *v177;
  void *v178;
  _SFPBSplitCardSection *v179;
  void *v180;
  _SFPBSplitCardSection *v181;
  void *v182;
  _SFPBLinkPresentationCardSection *v183;
  void *v184;
  _SFPBLinkPresentationCardSection *v185;
  void *v186;
  _SFPBFindMyCardSection *v187;
  void *v188;
  _SFPBFindMyCardSection *v189;
  void *v190;
  _SFPBHeroCardSection *v191;
  void *v192;
  _SFPBHeroCardSection *v193;
  void *v194;
  _SFPBNewsCardSection *v195;
  void *v196;
  _SFPBNewsCardSection *v197;
  void *v198;
  _SFPBMiniCardSection *v199;
  void *v200;
  _SFPBMiniCardSection *v201;
  void *v202;
  _SFPBInfoCardSection *v203;
  void *v204;
  _SFPBInfoCardSection *v205;
  void *v206;
  _SFPBCollectionCardSection *v207;
  void *v208;
  _SFPBCollectionCardSection *v209;
  void *v210;
  _SFPBCombinedCardSection *v211;
  void *v212;
  _SFPBCombinedCardSection *v213;
  void *v214;
  _SFPBResponseWrapperCardSection *v215;
  void *v216;
  _SFPBResponseWrapperCardSection *v217;
  void *v218;
  _SFPBListenToCardSection *v219;
  void *v220;
  _SFPBListenToCardSection *v221;
  void *v222;
  _SFPBWatchNowCardSection *v223;
  void *v224;
  _SFPBWatchNowCardSection *v225;
  void *v226;
  _SFPBStrokeAnimationCardSection *v227;
  void *v228;
  _SFPBStrokeAnimationCardSection *v229;
  void *v230;
  _SFPBButtonListCardSection *v231;
  void *v232;
  _SFPBButtonListCardSection *v233;
  void *v234;
  _SFPBCommandRowCardSection *v235;
  void *v236;
  _SFPBCommandRowCardSection *v237;
  void *v238;
  _SFPBLeadingTrailingCardSection *v239;
  void *v240;
  _SFPBLeadingTrailingCardSection *v241;
  void *v242;
  _SFPBHeroTitleCardSection *v243;
  void *v244;
  _SFPBHeroTitleCardSection *v245;
  void *v246;
  _SFPBArchiveViewCardSection *v247;
  void *v248;
  _SFPBArchiveViewCardSection *v249;
  void *v250;
  _SFPBAppIconCardSection *v251;
  void *v252;
  _SFPBAppIconCardSection *v253;
  void *v254;
  _SFPBLargeTitleDetailedRowCardSection *v255;
  void *v256;
  _SFPBLargeTitleDetailedRowCardSection *v257;
  void *v258;
  _SFPBSafariTableOfContentsCardSection *v259;
  void *v260;
  _SFPBSafariTableOfContentsCardSection *v261;
  void *v262;
  _SFPBRFSummaryItemShortNumberCardSection *v263;
  void *v264;
  _SFPBRFSummaryItemShortNumberCardSection *v265;
  void *v266;
  _SFPBRFSummaryItemTextCardSection *v267;
  void *v268;
  _SFPBRFSummaryItemTextCardSection *v269;
  void *v270;
  _SFPBRFSummaryItemStandardCardSection *v271;
  void *v272;
  _SFPBRFSummaryItemStandardCardSection *v273;
  void *v274;
  _SFPBRFFactItemShortNumberCardSection *v275;
  void *v276;
  _SFPBRFFactItemShortNumberCardSection *v277;
  void *v278;
  _SFPBRFFactItemStandardCardSection *v279;
  void *v280;
  _SFPBRFFactItemStandardCardSection *v281;
  void *v282;
  _SFPBRFLongItemStandardCardSection *v283;
  void *v284;
  _SFPBRFLongItemStandardCardSection *v285;
  void *v286;
  _SFPBRFPrimaryHeaderRichCardSection *v287;
  void *v288;
  _SFPBRFPrimaryHeaderRichCardSection *v289;
  void *v290;
  _SFPBRFPrimaryHeaderStandardCardSection *v291;
  void *v292;
  _SFPBRFPrimaryHeaderStandardCardSection *v293;
  void *v294;
  _SFPBRFReferenceFootnoteCardSection *v295;
  void *v296;
  _SFPBRFReferenceFootnoteCardSection *v297;
  void *v298;
  _SFPBRFReferenceRichCardSection *v299;
  void *v300;
  _SFPBRFReferenceRichCardSection *v301;
  void *v302;
  _SFPBRFSimpleItemRichCardSection *v303;
  void *v304;
  _SFPBRFSimpleItemRichCardSection *v305;
  void *v306;
  _SFPBRFSimpleItemStandardCardSection *v307;
  void *v308;
  _SFPBRFSimpleItemStandardCardSection *v309;
  void *v310;
  _SFPBRFSummaryItemAlignedTextCardSection *v311;
  void *v312;
  _SFPBRFSummaryItemAlignedTextCardSection *v313;
  void *v314;
  _SFPBRFExpandableStandardCardSection *v315;
  void *v316;
  _SFPBRFExpandableStandardCardSection *v317;
  void *v318;
  _SFPBRFFactItemButtonCardSection *v319;
  void *v320;
  _SFPBRFFactItemButtonCardSection *v321;
  void *v322;
  _SFPBRFFactItemHeroNumberCardSection *v323;
  void *v324;
  _SFPBRFFactItemHeroNumberCardSection *v325;
  void *v326;
  _SFPBRFPrimaryHeaderMarqueeCardSection *v327;
  void *v328;
  _SFPBRFPrimaryHeaderMarqueeCardSection *v329;
  void *v330;
  _SFPBRFSummaryItemDetailedTextCardSection *v331;
  void *v332;
  _SFPBRFSummaryItemDetailedTextCardSection *v333;
  void *v334;
  _SFPBRFSimpleItemPlayerCardSection *v335;
  void *v336;
  _SFPBRFSimpleItemPlayerCardSection *v337;
  void *v338;
  _SFPBRFSummaryItemPairCardSection *v339;
  void *v340;
  _SFPBRFSummaryItemPairCardSection *v341;
  void *v342;
  _SFPBRFSummaryItemPairNumberCardSection *v343;
  void *v344;
  _SFPBRFSummaryItemPairNumberCardSection *v345;
  void *v346;
  _SFPBRFFactItemShortHeroNumberCardSection *v347;
  void *v348;
  _SFPBRFFactItemShortHeroNumberCardSection *v349;
  void *v350;
  _SFPBRFFactItemDetailedNumberCardSection *v351;
  void *v352;
  _SFPBRFFactItemDetailedNumberCardSection *v353;
  void *v354;
  _SFPBRFFactItemHeroButtonCardSection *v355;
  void *v356;
  _SFPBRFFactItemHeroButtonCardSection *v357;
  void *v358;
  _SFPBRFFactItemImageRightCardSection *v359;
  void *v360;
  _SFPBRFFactItemImageRightCardSection *v361;
  void *v362;
  _SFPBRFSummaryItemSwitchV2CardSection *v363;
  void *v364;
  _SFPBRFSummaryItemSwitchV2CardSection *v365;
  void *v366;
  _SFPBRFTableHeaderCardSection *v367;
  void *v368;
  _SFPBRFTableHeaderCardSection *v369;
  void *v370;
  _SFPBRFTableRowCardSection *v371;
  void *v372;
  _SFPBRFTableRowCardSection *v373;
  void *v374;
  _SFPBRFSimpleItemVisualElementCardSection *v375;
  void *v376;
  _SFPBRFSimpleItemVisualElementCardSection *v377;
  void *v378;
  _SFPBRFSummaryItemPlayerCardSection *v379;
  void *v380;
  _SFPBRFSummaryItemPlayerCardSection *v381;
  void *v382;
  _SFPBRFSummaryItemImageRightCardSection *v383;
  void *v384;
  _SFPBRFSummaryItemImageRightCardSection *v385;
  void *v386;
  _SFPBRFSummaryItemButtonCardSection *v387;
  void *v388;
  _SFPBRFSummaryItemButtonCardSection *v389;
  void *v390;
  _SFPBRFSimpleItemReverseRichCardSection *v391;
  void *v392;
  _SFPBRFSimpleItemReverseRichCardSection *v393;
  void *v394;
  _SFPBRFSimpleItemRichSearchResultCardSection *v395;
  void *v396;
  _SFPBRFSimpleItemRichSearchResultCardSection *v397;
  void *v398;
  _SFPBRFPrimaryHeaderStackedImageCardSection *v399;
  void *v400;
  _SFPBRFPrimaryHeaderStackedImageCardSection *v401;
  void *v402;
  _SFPBRFReferenceItemLogoCardSection *v403;
  void *v404;
  _SFPBRFReferenceItemLogoCardSection *v405;
  void *v406;
  _SFPBRFReferenceItemButtonCardSection *v407;
  void *v408;
  _SFPBRFReferenceItemButtonCardSection *v409;
  void *v410;
  _SFPBRFButtonCardSection *v411;
  void *v412;
  _SFPBRFButtonCardSection *v413;
  void *v414;
  _SFPBRFBinaryButtonCardSection *v415;
  void *v416;
  _SFPBRFBinaryButtonCardSection *v417;
  void *v418;
  _SFPBRFReferenceCenteredCardSection *v419;
  void *v420;
  _SFPBRFReferenceCenteredCardSection *v421;
  void *v422;
  _SFPBRFSecondaryHeaderStandardCardSection *v423;
  void *v424;
  _SFPBRFSecondaryHeaderStandardCardSection *v425;
  void *v426;
  _SFPBRFSecondaryHeaderEmphasizedCardSection *v427;
  void *v428;
  _SFPBRFSecondaryHeaderEmphasizedCardSection *v429;
  void *v430;
  _SFPBRFMapCardSection *v431;
  void *v432;
  _SFPBRFMapCardSection *v433;
  void *v434;
  _SFPBRFReferenceStandardCardSection *v435;
  void *v436;
  _SFPBRFReferenceStandardCardSection *v437;
  void *v438;
  _SFPBRFMultiButtonCardSection *v439;
  void *v440;
  _SFPBRFMultiButtonCardSection *v441;
  void *v442;
  _SFPBRFDisambiguationTitleCardSection *v443;
  void *v444;
  _SFPBRFDisambiguationTitleCardSection *v445;
  _SFPBCardSectionValue *v446;

  v4 = a3;
  v5 = -[_SFPBCardSectionValue init](self, "init");

  if (v5)
  {
    objc_msgSend(v4, "appLinkCardSection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_SFPBAppLinkCardSection alloc];
      objc_msgSend(v4, "appLinkCardSection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_SFPBAppLinkCardSection initWithFacade:](v7, "initWithFacade:", v8);
      -[_SFPBCardSectionValue setAppLinkCardSection:](v5, "setAppLinkCardSection:", v9);

    }
    objc_msgSend(v4, "descriptionCardSection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [_SFPBDescriptionCardSection alloc];
      objc_msgSend(v4, "descriptionCardSection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[_SFPBDescriptionCardSection initWithFacade:](v11, "initWithFacade:", v12);
      -[_SFPBCardSectionValue setDescriptionCardSection:](v5, "setDescriptionCardSection:", v13);

    }
    objc_msgSend(v4, "keyValueDataCardSection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = [_SFPBKeyValueDataCardSection alloc];
      objc_msgSend(v4, "keyValueDataCardSection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[_SFPBKeyValueDataCardSection initWithFacade:](v15, "initWithFacade:", v16);
      -[_SFPBCardSectionValue setKeyValueDataCardSection:](v5, "setKeyValueDataCardSection:", v17);

    }
    objc_msgSend(v4, "mapCardSection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = [_SFPBMapCardSection alloc];
      objc_msgSend(v4, "mapCardSection");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[_SFPBMapCardSection initWithFacade:](v19, "initWithFacade:", v20);
      -[_SFPBCardSectionValue setMapCardSection:](v5, "setMapCardSection:", v21);

    }
    objc_msgSend(v4, "mediaInfoCardSection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v23 = [_SFPBMediaInfoCardSection alloc];
      objc_msgSend(v4, "mediaInfoCardSection");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[_SFPBMediaInfoCardSection initWithFacade:](v23, "initWithFacade:", v24);
      -[_SFPBCardSectionValue setMediaInfoCardSection:](v5, "setMediaInfoCardSection:", v25);

    }
    objc_msgSend(v4, "mediaPlayerCardSection");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v27 = [_SFPBMediaPlayerCardSection alloc];
      objc_msgSend(v4, "mediaPlayerCardSection");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[_SFPBMediaPlayerCardSection initWithFacade:](v27, "initWithFacade:", v28);
      -[_SFPBCardSectionValue setMediaPlayerCardSection:](v5, "setMediaPlayerCardSection:", v29);

    }
    objc_msgSend(v4, "nowPlayingCardSection");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      v31 = [_SFPBNowPlayingCardSection alloc];
      objc_msgSend(v4, "nowPlayingCardSection");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[_SFPBNowPlayingCardSection initWithFacade:](v31, "initWithFacade:", v32);
      -[_SFPBCardSectionValue setNowPlayingCardSection:](v5, "setNowPlayingCardSection:", v33);

    }
    objc_msgSend(v4, "richTitleCardSection");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      v35 = [_SFPBRichTitleCardSection alloc];
      objc_msgSend(v4, "richTitleCardSection");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = -[_SFPBRichTitleCardSection initWithFacade:](v35, "initWithFacade:", v36);
      -[_SFPBCardSectionValue setRichTitleCardSection:](v5, "setRichTitleCardSection:", v37);

    }
    objc_msgSend(v4, "rowCardSection");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      v39 = [_SFPBRowCardSection alloc];
      objc_msgSend(v4, "rowCardSection");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = -[_SFPBRowCardSection initWithFacade:](v39, "initWithFacade:", v40);
      -[_SFPBCardSectionValue setRowCardSection:](v5, "setRowCardSection:", v41);

    }
    objc_msgSend(v4, "scoreboardCardSection");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      v43 = [_SFPBScoreboardCardSection alloc];
      objc_msgSend(v4, "scoreboardCardSection");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = -[_SFPBScoreboardCardSection initWithFacade:](v43, "initWithFacade:", v44);
      -[_SFPBCardSectionValue setScoreboardCardSection:](v5, "setScoreboardCardSection:", v45);

    }
    objc_msgSend(v4, "socialMediaPostCardSection");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      v47 = [_SFPBSocialMediaPostCardSection alloc];
      objc_msgSend(v4, "socialMediaPostCardSection");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = -[_SFPBSocialMediaPostCardSection initWithFacade:](v47, "initWithFacade:", v48);
      -[_SFPBCardSectionValue setSocialMediaPostCardSection:](v5, "setSocialMediaPostCardSection:", v49);

    }
    objc_msgSend(v4, "stockChartCardSection");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v50)
    {
      v51 = [_SFPBStockChartCardSection alloc];
      objc_msgSend(v4, "stockChartCardSection");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = -[_SFPBStockChartCardSection initWithFacade:](v51, "initWithFacade:", v52);
      -[_SFPBCardSectionValue setStockChartCardSection:](v5, "setStockChartCardSection:", v53);

    }
    objc_msgSend(v4, "tableHeaderRowCardSection");
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (v54)
    {
      v55 = [_SFPBTableHeaderRowCardSection alloc];
      objc_msgSend(v4, "tableHeaderRowCardSection");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = -[_SFPBTableHeaderRowCardSection initWithFacade:](v55, "initWithFacade:", v56);
      -[_SFPBCardSectionValue setTableHeaderRowCardSection:](v5, "setTableHeaderRowCardSection:", v57);

    }
    objc_msgSend(v4, "tableRowCardSection");
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    if (v58)
    {
      v59 = [_SFPBTableRowCardSection alloc];
      objc_msgSend(v4, "tableRowCardSection");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = -[_SFPBTableRowCardSection initWithFacade:](v59, "initWithFacade:", v60);
      -[_SFPBCardSectionValue setTableRowCardSection:](v5, "setTableRowCardSection:", v61);

    }
    objc_msgSend(v4, "textColumnsCardSection");
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    if (v62)
    {
      v63 = [_SFPBTextColumnsCardSection alloc];
      objc_msgSend(v4, "textColumnsCardSection");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = -[_SFPBTextColumnsCardSection initWithFacade:](v63, "initWithFacade:", v64);
      -[_SFPBCardSectionValue setTextColumnsCardSection:](v5, "setTextColumnsCardSection:", v65);

    }
    objc_msgSend(v4, "titleCardSection");
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    if (v66)
    {
      v67 = [_SFPBTitleCardSection alloc];
      objc_msgSend(v4, "titleCardSection");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = -[_SFPBTitleCardSection initWithFacade:](v67, "initWithFacade:", v68);
      -[_SFPBCardSectionValue setTitleCardSection:](v5, "setTitleCardSection:", v69);

    }
    objc_msgSend(v4, "trackListCardSection");
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    if (v70)
    {
      v71 = [_SFPBTrackListCardSection alloc];
      objc_msgSend(v4, "trackListCardSection");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = -[_SFPBTrackListCardSection initWithFacade:](v71, "initWithFacade:", v72);
      -[_SFPBCardSectionValue setTrackListCardSection:](v5, "setTrackListCardSection:", v73);

    }
    objc_msgSend(v4, "audioPlaybackCardSection");
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    if (v74)
    {
      v75 = [_SFPBAudioPlaybackCardSection alloc];
      objc_msgSend(v4, "audioPlaybackCardSection");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = -[_SFPBAudioPlaybackCardSection initWithFacade:](v75, "initWithFacade:", v76);
      -[_SFPBCardSectionValue setAudioPlaybackCardSection:](v5, "setAudioPlaybackCardSection:", v77);

    }
    objc_msgSend(v4, "flightCardSection");
    v78 = (void *)objc_claimAutoreleasedReturnValue();

    if (v78)
    {
      v79 = [_SFPBFlightCardSection alloc];
      objc_msgSend(v4, "flightCardSection");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = -[_SFPBFlightCardSection initWithFacade:](v79, "initWithFacade:", v80);
      -[_SFPBCardSectionValue setFlightCardSection:](v5, "setFlightCardSection:", v81);

    }
    objc_msgSend(v4, "activityIndicatorCardSection");
    v82 = (void *)objc_claimAutoreleasedReturnValue();

    if (v82)
    {
      v83 = [_SFPBActivityIndicatorCardSection alloc];
      objc_msgSend(v4, "activityIndicatorCardSection");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = -[_SFPBActivityIndicatorCardSection initWithFacade:](v83, "initWithFacade:", v84);
      -[_SFPBCardSectionValue setActivityIndicatorCardSection:](v5, "setActivityIndicatorCardSection:", v85);

    }
    objc_msgSend(v4, "webCardSection");
    v86 = (void *)objc_claimAutoreleasedReturnValue();

    if (v86)
    {
      v87 = [_SFPBWebCardSection alloc];
      objc_msgSend(v4, "webCardSection");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = -[_SFPBWebCardSection initWithFacade:](v87, "initWithFacade:", v88);
      -[_SFPBCardSectionValue setWebCardSection:](v5, "setWebCardSection:", v89);

    }
    objc_msgSend(v4, "messageCardSection");
    v90 = (void *)objc_claimAutoreleasedReturnValue();

    if (v90)
    {
      v91 = [_SFPBMessageCardSection alloc];
      objc_msgSend(v4, "messageCardSection");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = -[_SFPBMessageCardSection initWithFacade:](v91, "initWithFacade:", v92);
      -[_SFPBCardSectionValue setMessageCardSection:](v5, "setMessageCardSection:", v93);

    }
    objc_msgSend(v4, "detailedRowCardSection");
    v94 = (void *)objc_claimAutoreleasedReturnValue();

    if (v94)
    {
      v95 = [_SFPBDetailedRowCardSection alloc];
      objc_msgSend(v4, "detailedRowCardSection");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = -[_SFPBDetailedRowCardSection initWithFacade:](v95, "initWithFacade:", v96);
      -[_SFPBCardSectionValue setDetailedRowCardSection:](v5, "setDetailedRowCardSection:", v97);

    }
    objc_msgSend(v4, "imagesCardSection");
    v98 = (void *)objc_claimAutoreleasedReturnValue();

    if (v98)
    {
      v99 = [_SFPBImagesCardSection alloc];
      objc_msgSend(v4, "imagesCardSection");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = -[_SFPBImagesCardSection initWithFacade:](v99, "initWithFacade:", v100);
      -[_SFPBCardSectionValue setImagesCardSection:](v5, "setImagesCardSection:", v101);

    }
    objc_msgSend(v4, "suggestionCardSection");
    v102 = (void *)objc_claimAutoreleasedReturnValue();

    if (v102)
    {
      v103 = [_SFPBSuggestionCardSection alloc];
      objc_msgSend(v4, "suggestionCardSection");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = -[_SFPBSuggestionCardSection initWithFacade:](v103, "initWithFacade:", v104);
      -[_SFPBCardSectionValue setSuggestionCardSection:](v5, "setSuggestionCardSection:", v105);

    }
    objc_msgSend(v4, "selectableGridCardSection");
    v106 = (void *)objc_claimAutoreleasedReturnValue();

    if (v106)
    {
      v107 = [_SFPBSelectableGridCardSection alloc];
      objc_msgSend(v4, "selectableGridCardSection");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v109 = -[_SFPBSelectableGridCardSection initWithFacade:](v107, "initWithFacade:", v108);
      -[_SFPBCardSectionValue setSelectableGridCardSection:](v5, "setSelectableGridCardSection:", v109);

    }
    objc_msgSend(v4, "sectionHeaderCardSection");
    v110 = (void *)objc_claimAutoreleasedReturnValue();

    if (v110)
    {
      v111 = [_SFPBSectionHeaderCardSection alloc];
      objc_msgSend(v4, "sectionHeaderCardSection");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      v113 = -[_SFPBSectionHeaderCardSection initWithFacade:](v111, "initWithFacade:", v112);
      -[_SFPBCardSectionValue setSectionHeaderCardSection:](v5, "setSectionHeaderCardSection:", v113);

    }
    objc_msgSend(v4, "metaInfoCardSection");
    v114 = (void *)objc_claimAutoreleasedReturnValue();

    if (v114)
    {
      v115 = [_SFPBMetaInfoCardSection alloc];
      objc_msgSend(v4, "metaInfoCardSection");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v117 = -[_SFPBMetaInfoCardSection initWithFacade:](v115, "initWithFacade:", v116);
      -[_SFPBCardSectionValue setMetaInfoCardSection:](v5, "setMetaInfoCardSection:", v117);

    }
    objc_msgSend(v4, "watchListCardSection");
    v118 = (void *)objc_claimAutoreleasedReturnValue();

    if (v118)
    {
      v119 = [_SFPBWatchListCardSection alloc];
      objc_msgSend(v4, "watchListCardSection");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      v121 = -[_SFPBWatchListCardSection initWithFacade:](v119, "initWithFacade:", v120);
      -[_SFPBCardSectionValue setWatchListCardSection:](v5, "setWatchListCardSection:", v121);

    }
    objc_msgSend(v4, "mapsDetailedRowCardSection");
    v122 = (void *)objc_claimAutoreleasedReturnValue();

    if (v122)
    {
      v123 = [_SFPBMapsDetailedRowCardSection alloc];
      objc_msgSend(v4, "mapsDetailedRowCardSection");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      v125 = -[_SFPBMapsDetailedRowCardSection initWithFacade:](v123, "initWithFacade:", v124);
      -[_SFPBCardSectionValue setMapsDetailedRowCardSection:](v5, "setMapsDetailedRowCardSection:", v125);

    }
    objc_msgSend(v4, "buttonCardSection");
    v126 = (void *)objc_claimAutoreleasedReturnValue();

    if (v126)
    {
      v127 = [_SFPBButtonCardSection alloc];
      objc_msgSend(v4, "buttonCardSection");
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      v129 = -[_SFPBButtonCardSection initWithFacade:](v127, "initWithFacade:", v128);
      -[_SFPBCardSectionValue setButtonCardSection:](v5, "setButtonCardSection:", v129);

    }
    objc_msgSend(v4, "horizontalButtonCardSection");
    v130 = (void *)objc_claimAutoreleasedReturnValue();

    if (v130)
    {
      v131 = [_SFPBHorizontalButtonCardSection alloc];
      objc_msgSend(v4, "horizontalButtonCardSection");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      v133 = -[_SFPBHorizontalButtonCardSection initWithFacade:](v131, "initWithFacade:", v132);
      -[_SFPBCardSectionValue setHorizontalButtonCardSection:](v5, "setHorizontalButtonCardSection:", v133);

    }
    objc_msgSend(v4, "verticalLayoutCardSection");
    v134 = (void *)objc_claimAutoreleasedReturnValue();

    if (v134)
    {
      v135 = [_SFPBVerticalLayoutCardSection alloc];
      objc_msgSend(v4, "verticalLayoutCardSection");
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      v137 = -[_SFPBVerticalLayoutCardSection initWithFacade:](v135, "initWithFacade:", v136);
      -[_SFPBCardSectionValue setVerticalLayoutCardSection:](v5, "setVerticalLayoutCardSection:", v137);

    }
    objc_msgSend(v4, "productCardSection");
    v138 = (void *)objc_claimAutoreleasedReturnValue();

    if (v138)
    {
      v139 = [_SFPBProductCardSection alloc];
      objc_msgSend(v4, "productCardSection");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      v141 = -[_SFPBProductCardSection initWithFacade:](v139, "initWithFacade:", v140);
      -[_SFPBCardSectionValue setProductCardSection:](v5, "setProductCardSection:", v141);

    }
    objc_msgSend(v4, "horizontalScrollCardSection");
    v142 = (void *)objc_claimAutoreleasedReturnValue();

    if (v142)
    {
      v143 = [_SFPBHorizontalScrollCardSection alloc];
      objc_msgSend(v4, "horizontalScrollCardSection");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      v145 = -[_SFPBHorizontalScrollCardSection initWithFacade:](v143, "initWithFacade:", v144);
      -[_SFPBCardSectionValue setHorizontalScrollCardSection:](v5, "setHorizontalScrollCardSection:", v145);

    }
    objc_msgSend(v4, "mediaRemoteControlCardSection");
    v146 = (void *)objc_claimAutoreleasedReturnValue();

    if (v146)
    {
      v147 = [_SFPBMediaRemoteControlCardSection alloc];
      objc_msgSend(v4, "mediaRemoteControlCardSection");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      v149 = -[_SFPBMediaRemoteControlCardSection initWithFacade:](v147, "initWithFacade:", v148);
      -[_SFPBCardSectionValue setMediaRemoteControlCardSection:](v5, "setMediaRemoteControlCardSection:", v149);

    }
    objc_msgSend(v4, "mapPlaceCardSection");
    v150 = (void *)objc_claimAutoreleasedReturnValue();

    if (v150)
    {
      v151 = [_SFPBMapPlaceCardSection alloc];
      objc_msgSend(v4, "mapPlaceCardSection");
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      v153 = -[_SFPBMapPlaceCardSection initWithFacade:](v151, "initWithFacade:", v152);
      -[_SFPBCardSectionValue setMapPlaceCardSection:](v5, "setMapPlaceCardSection:", v153);

    }
    objc_msgSend(v4, "compactRowCardSection");
    v154 = (void *)objc_claimAutoreleasedReturnValue();

    if (v154)
    {
      v155 = [_SFPBCompactRowCardSection alloc];
      objc_msgSend(v4, "compactRowCardSection");
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      v157 = -[_SFPBCompactRowCardSection initWithFacade:](v155, "initWithFacade:", v156);
      -[_SFPBCardSectionValue setCompactRowCardSection:](v5, "setCompactRowCardSection:", v157);

    }
    objc_msgSend(v4, "worldMapCardSection");
    v158 = (void *)objc_claimAutoreleasedReturnValue();

    if (v158)
    {
      v159 = [_SFPBWorldMapCardSection alloc];
      objc_msgSend(v4, "worldMapCardSection");
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      v161 = -[_SFPBWorldMapCardSection initWithFacade:](v159, "initWithFacade:", v160);
      -[_SFPBCardSectionValue setWorldMapCardSection:](v5, "setWorldMapCardSection:", v161);

    }
    objc_msgSend(v4, "attributionFooterCardSection");
    v162 = (void *)objc_claimAutoreleasedReturnValue();

    if (v162)
    {
      v163 = [_SFPBAttributionFooterCardSection alloc];
      objc_msgSend(v4, "attributionFooterCardSection");
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      v165 = -[_SFPBAttributionFooterCardSection initWithFacade:](v163, "initWithFacade:", v164);
      -[_SFPBCardSectionValue setAttributionFooterCardSection:](v5, "setAttributionFooterCardSection:", v165);

    }
    objc_msgSend(v4, "gridCardSection");
    v166 = (void *)objc_claimAutoreleasedReturnValue();

    if (v166)
    {
      v167 = [_SFPBGridCardSection alloc];
      objc_msgSend(v4, "gridCardSection");
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      v169 = -[_SFPBGridCardSection initWithFacade:](v167, "initWithFacade:", v168);
      -[_SFPBCardSectionValue setGridCardSection:](v5, "setGridCardSection:", v169);

    }
    objc_msgSend(v4, "personHeaderCardSection");
    v170 = (void *)objc_claimAutoreleasedReturnValue();

    if (v170)
    {
      v171 = [_SFPBPersonHeaderCardSection alloc];
      objc_msgSend(v4, "personHeaderCardSection");
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      v173 = -[_SFPBPersonHeaderCardSection initWithFacade:](v171, "initWithFacade:", v172);
      -[_SFPBCardSectionValue setPersonHeaderCardSection:](v5, "setPersonHeaderCardSection:", v173);

    }
    objc_msgSend(v4, "colorBarCardSection");
    v174 = (void *)objc_claimAutoreleasedReturnValue();

    if (v174)
    {
      v175 = [_SFPBColorBarCardSection alloc];
      objc_msgSend(v4, "colorBarCardSection");
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      v177 = -[_SFPBColorBarCardSection initWithFacade:](v175, "initWithFacade:", v176);
      -[_SFPBCardSectionValue setColorBarCardSection:](v5, "setColorBarCardSection:", v177);

    }
    objc_msgSend(v4, "splitCardSection");
    v178 = (void *)objc_claimAutoreleasedReturnValue();

    if (v178)
    {
      v179 = [_SFPBSplitCardSection alloc];
      objc_msgSend(v4, "splitCardSection");
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      v181 = -[_SFPBSplitCardSection initWithFacade:](v179, "initWithFacade:", v180);
      -[_SFPBCardSectionValue setSplitCardSection:](v5, "setSplitCardSection:", v181);

    }
    objc_msgSend(v4, "linkPresentationCardSection");
    v182 = (void *)objc_claimAutoreleasedReturnValue();

    if (v182)
    {
      v183 = [_SFPBLinkPresentationCardSection alloc];
      objc_msgSend(v4, "linkPresentationCardSection");
      v184 = (void *)objc_claimAutoreleasedReturnValue();
      v185 = -[_SFPBLinkPresentationCardSection initWithFacade:](v183, "initWithFacade:", v184);
      -[_SFPBCardSectionValue setLinkPresentationCardSection:](v5, "setLinkPresentationCardSection:", v185);

    }
    objc_msgSend(v4, "findMyCardSection");
    v186 = (void *)objc_claimAutoreleasedReturnValue();

    if (v186)
    {
      v187 = [_SFPBFindMyCardSection alloc];
      objc_msgSend(v4, "findMyCardSection");
      v188 = (void *)objc_claimAutoreleasedReturnValue();
      v189 = -[_SFPBFindMyCardSection initWithFacade:](v187, "initWithFacade:", v188);
      -[_SFPBCardSectionValue setFindMyCardSection:](v5, "setFindMyCardSection:", v189);

    }
    objc_msgSend(v4, "heroCardSection");
    v190 = (void *)objc_claimAutoreleasedReturnValue();

    if (v190)
    {
      v191 = [_SFPBHeroCardSection alloc];
      objc_msgSend(v4, "heroCardSection");
      v192 = (void *)objc_claimAutoreleasedReturnValue();
      v193 = -[_SFPBHeroCardSection initWithFacade:](v191, "initWithFacade:", v192);
      -[_SFPBCardSectionValue setHeroCardSection:](v5, "setHeroCardSection:", v193);

    }
    objc_msgSend(v4, "newsCardSection");
    v194 = (void *)objc_claimAutoreleasedReturnValue();

    if (v194)
    {
      v195 = [_SFPBNewsCardSection alloc];
      objc_msgSend(v4, "newsCardSection");
      v196 = (void *)objc_claimAutoreleasedReturnValue();
      v197 = -[_SFPBNewsCardSection initWithFacade:](v195, "initWithFacade:", v196);
      -[_SFPBCardSectionValue setNewsCardSection:](v5, "setNewsCardSection:", v197);

    }
    objc_msgSend(v4, "miniCardSection");
    v198 = (void *)objc_claimAutoreleasedReturnValue();

    if (v198)
    {
      v199 = [_SFPBMiniCardSection alloc];
      objc_msgSend(v4, "miniCardSection");
      v200 = (void *)objc_claimAutoreleasedReturnValue();
      v201 = -[_SFPBMiniCardSection initWithFacade:](v199, "initWithFacade:", v200);
      -[_SFPBCardSectionValue setMiniCardSection:](v5, "setMiniCardSection:", v201);

    }
    objc_msgSend(v4, "infoCardSection");
    v202 = (void *)objc_claimAutoreleasedReturnValue();

    if (v202)
    {
      v203 = [_SFPBInfoCardSection alloc];
      objc_msgSend(v4, "infoCardSection");
      v204 = (void *)objc_claimAutoreleasedReturnValue();
      v205 = -[_SFPBInfoCardSection initWithFacade:](v203, "initWithFacade:", v204);
      -[_SFPBCardSectionValue setInfoCardSection:](v5, "setInfoCardSection:", v205);

    }
    objc_msgSend(v4, "collectionCardSection");
    v206 = (void *)objc_claimAutoreleasedReturnValue();

    if (v206)
    {
      v207 = [_SFPBCollectionCardSection alloc];
      objc_msgSend(v4, "collectionCardSection");
      v208 = (void *)objc_claimAutoreleasedReturnValue();
      v209 = -[_SFPBCollectionCardSection initWithFacade:](v207, "initWithFacade:", v208);
      -[_SFPBCardSectionValue setCollectionCardSection:](v5, "setCollectionCardSection:", v209);

    }
    objc_msgSend(v4, "combinedCardSection");
    v210 = (void *)objc_claimAutoreleasedReturnValue();

    if (v210)
    {
      v211 = [_SFPBCombinedCardSection alloc];
      objc_msgSend(v4, "combinedCardSection");
      v212 = (void *)objc_claimAutoreleasedReturnValue();
      v213 = -[_SFPBCombinedCardSection initWithFacade:](v211, "initWithFacade:", v212);
      -[_SFPBCardSectionValue setCombinedCardSection:](v5, "setCombinedCardSection:", v213);

    }
    objc_msgSend(v4, "responseWrapperCardSection");
    v214 = (void *)objc_claimAutoreleasedReturnValue();

    if (v214)
    {
      v215 = [_SFPBResponseWrapperCardSection alloc];
      objc_msgSend(v4, "responseWrapperCardSection");
      v216 = (void *)objc_claimAutoreleasedReturnValue();
      v217 = -[_SFPBResponseWrapperCardSection initWithFacade:](v215, "initWithFacade:", v216);
      -[_SFPBCardSectionValue setResponseWrapperCardSection:](v5, "setResponseWrapperCardSection:", v217);

    }
    objc_msgSend(v4, "listenToCardSection");
    v218 = (void *)objc_claimAutoreleasedReturnValue();

    if (v218)
    {
      v219 = [_SFPBListenToCardSection alloc];
      objc_msgSend(v4, "listenToCardSection");
      v220 = (void *)objc_claimAutoreleasedReturnValue();
      v221 = -[_SFPBListenToCardSection initWithFacade:](v219, "initWithFacade:", v220);
      -[_SFPBCardSectionValue setListenToCardSection:](v5, "setListenToCardSection:", v221);

    }
    objc_msgSend(v4, "watchNowCardSection");
    v222 = (void *)objc_claimAutoreleasedReturnValue();

    if (v222)
    {
      v223 = [_SFPBWatchNowCardSection alloc];
      objc_msgSend(v4, "watchNowCardSection");
      v224 = (void *)objc_claimAutoreleasedReturnValue();
      v225 = -[_SFPBWatchNowCardSection initWithFacade:](v223, "initWithFacade:", v224);
      -[_SFPBCardSectionValue setWatchNowCardSection:](v5, "setWatchNowCardSection:", v225);

    }
    objc_msgSend(v4, "strokeAnimationCardSection");
    v226 = (void *)objc_claimAutoreleasedReturnValue();

    if (v226)
    {
      v227 = [_SFPBStrokeAnimationCardSection alloc];
      objc_msgSend(v4, "strokeAnimationCardSection");
      v228 = (void *)objc_claimAutoreleasedReturnValue();
      v229 = -[_SFPBStrokeAnimationCardSection initWithFacade:](v227, "initWithFacade:", v228);
      -[_SFPBCardSectionValue setStrokeAnimationCardSection:](v5, "setStrokeAnimationCardSection:", v229);

    }
    objc_msgSend(v4, "buttonListCardSection");
    v230 = (void *)objc_claimAutoreleasedReturnValue();

    if (v230)
    {
      v231 = [_SFPBButtonListCardSection alloc];
      objc_msgSend(v4, "buttonListCardSection");
      v232 = (void *)objc_claimAutoreleasedReturnValue();
      v233 = -[_SFPBButtonListCardSection initWithFacade:](v231, "initWithFacade:", v232);
      -[_SFPBCardSectionValue setButtonListCardSection:](v5, "setButtonListCardSection:", v233);

    }
    objc_msgSend(v4, "commandRowCardSection");
    v234 = (void *)objc_claimAutoreleasedReturnValue();

    if (v234)
    {
      v235 = [_SFPBCommandRowCardSection alloc];
      objc_msgSend(v4, "commandRowCardSection");
      v236 = (void *)objc_claimAutoreleasedReturnValue();
      v237 = -[_SFPBCommandRowCardSection initWithFacade:](v235, "initWithFacade:", v236);
      -[_SFPBCardSectionValue setCommandRowCardSection:](v5, "setCommandRowCardSection:", v237);

    }
    objc_msgSend(v4, "leadingTrailingCardSection");
    v238 = (void *)objc_claimAutoreleasedReturnValue();

    if (v238)
    {
      v239 = [_SFPBLeadingTrailingCardSection alloc];
      objc_msgSend(v4, "leadingTrailingCardSection");
      v240 = (void *)objc_claimAutoreleasedReturnValue();
      v241 = -[_SFPBLeadingTrailingCardSection initWithFacade:](v239, "initWithFacade:", v240);
      -[_SFPBCardSectionValue setLeadingTrailingCardSection:](v5, "setLeadingTrailingCardSection:", v241);

    }
    objc_msgSend(v4, "heroTitleCardSection");
    v242 = (void *)objc_claimAutoreleasedReturnValue();

    if (v242)
    {
      v243 = [_SFPBHeroTitleCardSection alloc];
      objc_msgSend(v4, "heroTitleCardSection");
      v244 = (void *)objc_claimAutoreleasedReturnValue();
      v245 = -[_SFPBHeroTitleCardSection initWithFacade:](v243, "initWithFacade:", v244);
      -[_SFPBCardSectionValue setHeroTitleCardSection:](v5, "setHeroTitleCardSection:", v245);

    }
    objc_msgSend(v4, "archiveViewCardSection");
    v246 = (void *)objc_claimAutoreleasedReturnValue();

    if (v246)
    {
      v247 = [_SFPBArchiveViewCardSection alloc];
      objc_msgSend(v4, "archiveViewCardSection");
      v248 = (void *)objc_claimAutoreleasedReturnValue();
      v249 = -[_SFPBArchiveViewCardSection initWithFacade:](v247, "initWithFacade:", v248);
      -[_SFPBCardSectionValue setArchiveViewCardSection:](v5, "setArchiveViewCardSection:", v249);

    }
    objc_msgSend(v4, "appIconCardSection");
    v250 = (void *)objc_claimAutoreleasedReturnValue();

    if (v250)
    {
      v251 = [_SFPBAppIconCardSection alloc];
      objc_msgSend(v4, "appIconCardSection");
      v252 = (void *)objc_claimAutoreleasedReturnValue();
      v253 = -[_SFPBAppIconCardSection initWithFacade:](v251, "initWithFacade:", v252);
      -[_SFPBCardSectionValue setAppIconCardSection:](v5, "setAppIconCardSection:", v253);

    }
    objc_msgSend(v4, "largeTitleDetailedRowCardSection");
    v254 = (void *)objc_claimAutoreleasedReturnValue();

    if (v254)
    {
      v255 = [_SFPBLargeTitleDetailedRowCardSection alloc];
      objc_msgSend(v4, "largeTitleDetailedRowCardSection");
      v256 = (void *)objc_claimAutoreleasedReturnValue();
      v257 = -[_SFPBLargeTitleDetailedRowCardSection initWithFacade:](v255, "initWithFacade:", v256);
      -[_SFPBCardSectionValue setLargeTitleDetailedRowCardSection:](v5, "setLargeTitleDetailedRowCardSection:", v257);

    }
    objc_msgSend(v4, "safariTableOfContentsCardSection");
    v258 = (void *)objc_claimAutoreleasedReturnValue();

    if (v258)
    {
      v259 = [_SFPBSafariTableOfContentsCardSection alloc];
      objc_msgSend(v4, "safariTableOfContentsCardSection");
      v260 = (void *)objc_claimAutoreleasedReturnValue();
      v261 = -[_SFPBSafariTableOfContentsCardSection initWithFacade:](v259, "initWithFacade:", v260);
      -[_SFPBCardSectionValue setSafariTableOfContentsCardSection:](v5, "setSafariTableOfContentsCardSection:", v261);

    }
    objc_msgSend(v4, "rfSummaryItemShortNumberCardSection");
    v262 = (void *)objc_claimAutoreleasedReturnValue();

    if (v262)
    {
      v263 = [_SFPBRFSummaryItemShortNumberCardSection alloc];
      objc_msgSend(v4, "rfSummaryItemShortNumberCardSection");
      v264 = (void *)objc_claimAutoreleasedReturnValue();
      v265 = -[_SFPBRFSummaryItemShortNumberCardSection initWithFacade:](v263, "initWithFacade:", v264);
      -[_SFPBCardSectionValue setRfSummaryItemShortNumberCardSection:](v5, "setRfSummaryItemShortNumberCardSection:", v265);

    }
    objc_msgSend(v4, "rfSummaryItemTextCardSection");
    v266 = (void *)objc_claimAutoreleasedReturnValue();

    if (v266)
    {
      v267 = [_SFPBRFSummaryItemTextCardSection alloc];
      objc_msgSend(v4, "rfSummaryItemTextCardSection");
      v268 = (void *)objc_claimAutoreleasedReturnValue();
      v269 = -[_SFPBRFSummaryItemTextCardSection initWithFacade:](v267, "initWithFacade:", v268);
      -[_SFPBCardSectionValue setRfSummaryItemTextCardSection:](v5, "setRfSummaryItemTextCardSection:", v269);

    }
    objc_msgSend(v4, "rfSummaryItemStandardCardSection");
    v270 = (void *)objc_claimAutoreleasedReturnValue();

    if (v270)
    {
      v271 = [_SFPBRFSummaryItemStandardCardSection alloc];
      objc_msgSend(v4, "rfSummaryItemStandardCardSection");
      v272 = (void *)objc_claimAutoreleasedReturnValue();
      v273 = -[_SFPBRFSummaryItemStandardCardSection initWithFacade:](v271, "initWithFacade:", v272);
      -[_SFPBCardSectionValue setRfSummaryItemStandardCardSection:](v5, "setRfSummaryItemStandardCardSection:", v273);

    }
    objc_msgSend(v4, "rfFactItemShortNumberCardSection");
    v274 = (void *)objc_claimAutoreleasedReturnValue();

    if (v274)
    {
      v275 = [_SFPBRFFactItemShortNumberCardSection alloc];
      objc_msgSend(v4, "rfFactItemShortNumberCardSection");
      v276 = (void *)objc_claimAutoreleasedReturnValue();
      v277 = -[_SFPBRFFactItemShortNumberCardSection initWithFacade:](v275, "initWithFacade:", v276);
      -[_SFPBCardSectionValue setRfFactItemShortNumberCardSection:](v5, "setRfFactItemShortNumberCardSection:", v277);

    }
    objc_msgSend(v4, "rfFactItemStandardCardSection");
    v278 = (void *)objc_claimAutoreleasedReturnValue();

    if (v278)
    {
      v279 = [_SFPBRFFactItemStandardCardSection alloc];
      objc_msgSend(v4, "rfFactItemStandardCardSection");
      v280 = (void *)objc_claimAutoreleasedReturnValue();
      v281 = -[_SFPBRFFactItemStandardCardSection initWithFacade:](v279, "initWithFacade:", v280);
      -[_SFPBCardSectionValue setRfFactItemStandardCardSection:](v5, "setRfFactItemStandardCardSection:", v281);

    }
    objc_msgSend(v4, "rfLongItemStandardCardSection");
    v282 = (void *)objc_claimAutoreleasedReturnValue();

    if (v282)
    {
      v283 = [_SFPBRFLongItemStandardCardSection alloc];
      objc_msgSend(v4, "rfLongItemStandardCardSection");
      v284 = (void *)objc_claimAutoreleasedReturnValue();
      v285 = -[_SFPBRFLongItemStandardCardSection initWithFacade:](v283, "initWithFacade:", v284);
      -[_SFPBCardSectionValue setRfLongItemStandardCardSection:](v5, "setRfLongItemStandardCardSection:", v285);

    }
    objc_msgSend(v4, "rfPrimaryHeaderRichCardSection");
    v286 = (void *)objc_claimAutoreleasedReturnValue();

    if (v286)
    {
      v287 = [_SFPBRFPrimaryHeaderRichCardSection alloc];
      objc_msgSend(v4, "rfPrimaryHeaderRichCardSection");
      v288 = (void *)objc_claimAutoreleasedReturnValue();
      v289 = -[_SFPBRFPrimaryHeaderRichCardSection initWithFacade:](v287, "initWithFacade:", v288);
      -[_SFPBCardSectionValue setRfPrimaryHeaderRichCardSection:](v5, "setRfPrimaryHeaderRichCardSection:", v289);

    }
    objc_msgSend(v4, "rfPrimaryHeaderStandardCardSection");
    v290 = (void *)objc_claimAutoreleasedReturnValue();

    if (v290)
    {
      v291 = [_SFPBRFPrimaryHeaderStandardCardSection alloc];
      objc_msgSend(v4, "rfPrimaryHeaderStandardCardSection");
      v292 = (void *)objc_claimAutoreleasedReturnValue();
      v293 = -[_SFPBRFPrimaryHeaderStandardCardSection initWithFacade:](v291, "initWithFacade:", v292);
      -[_SFPBCardSectionValue setRfPrimaryHeaderStandardCardSection:](v5, "setRfPrimaryHeaderStandardCardSection:", v293);

    }
    objc_msgSend(v4, "rfReferenceFootnoteCardSection");
    v294 = (void *)objc_claimAutoreleasedReturnValue();

    if (v294)
    {
      v295 = [_SFPBRFReferenceFootnoteCardSection alloc];
      objc_msgSend(v4, "rfReferenceFootnoteCardSection");
      v296 = (void *)objc_claimAutoreleasedReturnValue();
      v297 = -[_SFPBRFReferenceFootnoteCardSection initWithFacade:](v295, "initWithFacade:", v296);
      -[_SFPBCardSectionValue setRfReferenceFootnoteCardSection:](v5, "setRfReferenceFootnoteCardSection:", v297);

    }
    objc_msgSend(v4, "rfReferenceRichCardSection");
    v298 = (void *)objc_claimAutoreleasedReturnValue();

    if (v298)
    {
      v299 = [_SFPBRFReferenceRichCardSection alloc];
      objc_msgSend(v4, "rfReferenceRichCardSection");
      v300 = (void *)objc_claimAutoreleasedReturnValue();
      v301 = -[_SFPBRFReferenceRichCardSection initWithFacade:](v299, "initWithFacade:", v300);
      -[_SFPBCardSectionValue setRfReferenceRichCardSection:](v5, "setRfReferenceRichCardSection:", v301);

    }
    objc_msgSend(v4, "rfSimpleItemRichCardSection");
    v302 = (void *)objc_claimAutoreleasedReturnValue();

    if (v302)
    {
      v303 = [_SFPBRFSimpleItemRichCardSection alloc];
      objc_msgSend(v4, "rfSimpleItemRichCardSection");
      v304 = (void *)objc_claimAutoreleasedReturnValue();
      v305 = -[_SFPBRFSimpleItemRichCardSection initWithFacade:](v303, "initWithFacade:", v304);
      -[_SFPBCardSectionValue setRfSimpleItemRichCardSection:](v5, "setRfSimpleItemRichCardSection:", v305);

    }
    objc_msgSend(v4, "rfSimpleItemStandardCardSection");
    v306 = (void *)objc_claimAutoreleasedReturnValue();

    if (v306)
    {
      v307 = [_SFPBRFSimpleItemStandardCardSection alloc];
      objc_msgSend(v4, "rfSimpleItemStandardCardSection");
      v308 = (void *)objc_claimAutoreleasedReturnValue();
      v309 = -[_SFPBRFSimpleItemStandardCardSection initWithFacade:](v307, "initWithFacade:", v308);
      -[_SFPBCardSectionValue setRfSimpleItemStandardCardSection:](v5, "setRfSimpleItemStandardCardSection:", v309);

    }
    objc_msgSend(v4, "rfSummaryItemAlignedTextCardSection");
    v310 = (void *)objc_claimAutoreleasedReturnValue();

    if (v310)
    {
      v311 = [_SFPBRFSummaryItemAlignedTextCardSection alloc];
      objc_msgSend(v4, "rfSummaryItemAlignedTextCardSection");
      v312 = (void *)objc_claimAutoreleasedReturnValue();
      v313 = -[_SFPBRFSummaryItemAlignedTextCardSection initWithFacade:](v311, "initWithFacade:", v312);
      -[_SFPBCardSectionValue setRfSummaryItemAlignedTextCardSection:](v5, "setRfSummaryItemAlignedTextCardSection:", v313);

    }
    objc_msgSend(v4, "rfExpandableStandardCardSection");
    v314 = (void *)objc_claimAutoreleasedReturnValue();

    if (v314)
    {
      v315 = [_SFPBRFExpandableStandardCardSection alloc];
      objc_msgSend(v4, "rfExpandableStandardCardSection");
      v316 = (void *)objc_claimAutoreleasedReturnValue();
      v317 = -[_SFPBRFExpandableStandardCardSection initWithFacade:](v315, "initWithFacade:", v316);
      -[_SFPBCardSectionValue setRfExpandableStandardCardSection:](v5, "setRfExpandableStandardCardSection:", v317);

    }
    objc_msgSend(v4, "rfFactItemButtonCardSection");
    v318 = (void *)objc_claimAutoreleasedReturnValue();

    if (v318)
    {
      v319 = [_SFPBRFFactItemButtonCardSection alloc];
      objc_msgSend(v4, "rfFactItemButtonCardSection");
      v320 = (void *)objc_claimAutoreleasedReturnValue();
      v321 = -[_SFPBRFFactItemButtonCardSection initWithFacade:](v319, "initWithFacade:", v320);
      -[_SFPBCardSectionValue setRfFactItemButtonCardSection:](v5, "setRfFactItemButtonCardSection:", v321);

    }
    objc_msgSend(v4, "rfFactItemHeroNumberCardSection");
    v322 = (void *)objc_claimAutoreleasedReturnValue();

    if (v322)
    {
      v323 = [_SFPBRFFactItemHeroNumberCardSection alloc];
      objc_msgSend(v4, "rfFactItemHeroNumberCardSection");
      v324 = (void *)objc_claimAutoreleasedReturnValue();
      v325 = -[_SFPBRFFactItemHeroNumberCardSection initWithFacade:](v323, "initWithFacade:", v324);
      -[_SFPBCardSectionValue setRfFactItemHeroNumberCardSection:](v5, "setRfFactItemHeroNumberCardSection:", v325);

    }
    objc_msgSend(v4, "rfPrimaryHeaderMarqueeCardSection");
    v326 = (void *)objc_claimAutoreleasedReturnValue();

    if (v326)
    {
      v327 = [_SFPBRFPrimaryHeaderMarqueeCardSection alloc];
      objc_msgSend(v4, "rfPrimaryHeaderMarqueeCardSection");
      v328 = (void *)objc_claimAutoreleasedReturnValue();
      v329 = -[_SFPBRFPrimaryHeaderMarqueeCardSection initWithFacade:](v327, "initWithFacade:", v328);
      -[_SFPBCardSectionValue setRfPrimaryHeaderMarqueeCardSection:](v5, "setRfPrimaryHeaderMarqueeCardSection:", v329);

    }
    objc_msgSend(v4, "rfSummaryItemDetailedTextCardSection");
    v330 = (void *)objc_claimAutoreleasedReturnValue();

    if (v330)
    {
      v331 = [_SFPBRFSummaryItemDetailedTextCardSection alloc];
      objc_msgSend(v4, "rfSummaryItemDetailedTextCardSection");
      v332 = (void *)objc_claimAutoreleasedReturnValue();
      v333 = -[_SFPBRFSummaryItemDetailedTextCardSection initWithFacade:](v331, "initWithFacade:", v332);
      -[_SFPBCardSectionValue setRfSummaryItemDetailedTextCardSection:](v5, "setRfSummaryItemDetailedTextCardSection:", v333);

    }
    objc_msgSend(v4, "rfSimpleItemPlayerCardSection");
    v334 = (void *)objc_claimAutoreleasedReturnValue();

    if (v334)
    {
      v335 = [_SFPBRFSimpleItemPlayerCardSection alloc];
      objc_msgSend(v4, "rfSimpleItemPlayerCardSection");
      v336 = (void *)objc_claimAutoreleasedReturnValue();
      v337 = -[_SFPBRFSimpleItemPlayerCardSection initWithFacade:](v335, "initWithFacade:", v336);
      -[_SFPBCardSectionValue setRfSimpleItemPlayerCardSection:](v5, "setRfSimpleItemPlayerCardSection:", v337);

    }
    objc_msgSend(v4, "rfSummaryItemPairCardSection");
    v338 = (void *)objc_claimAutoreleasedReturnValue();

    if (v338)
    {
      v339 = [_SFPBRFSummaryItemPairCardSection alloc];
      objc_msgSend(v4, "rfSummaryItemPairCardSection");
      v340 = (void *)objc_claimAutoreleasedReturnValue();
      v341 = -[_SFPBRFSummaryItemPairCardSection initWithFacade:](v339, "initWithFacade:", v340);
      -[_SFPBCardSectionValue setRfSummaryItemPairCardSection:](v5, "setRfSummaryItemPairCardSection:", v341);

    }
    objc_msgSend(v4, "rfSummaryItemPairNumberCardSection");
    v342 = (void *)objc_claimAutoreleasedReturnValue();

    if (v342)
    {
      v343 = [_SFPBRFSummaryItemPairNumberCardSection alloc];
      objc_msgSend(v4, "rfSummaryItemPairNumberCardSection");
      v344 = (void *)objc_claimAutoreleasedReturnValue();
      v345 = -[_SFPBRFSummaryItemPairNumberCardSection initWithFacade:](v343, "initWithFacade:", v344);
      -[_SFPBCardSectionValue setRfSummaryItemPairNumberCardSection:](v5, "setRfSummaryItemPairNumberCardSection:", v345);

    }
    objc_msgSend(v4, "rfFactItemShortHeroNumberCardSection");
    v346 = (void *)objc_claimAutoreleasedReturnValue();

    if (v346)
    {
      v347 = [_SFPBRFFactItemShortHeroNumberCardSection alloc];
      objc_msgSend(v4, "rfFactItemShortHeroNumberCardSection");
      v348 = (void *)objc_claimAutoreleasedReturnValue();
      v349 = -[_SFPBRFFactItemShortHeroNumberCardSection initWithFacade:](v347, "initWithFacade:", v348);
      -[_SFPBCardSectionValue setRfFactItemShortHeroNumberCardSection:](v5, "setRfFactItemShortHeroNumberCardSection:", v349);

    }
    objc_msgSend(v4, "rfFactItemDetailedNumberCardSection");
    v350 = (void *)objc_claimAutoreleasedReturnValue();

    if (v350)
    {
      v351 = [_SFPBRFFactItemDetailedNumberCardSection alloc];
      objc_msgSend(v4, "rfFactItemDetailedNumberCardSection");
      v352 = (void *)objc_claimAutoreleasedReturnValue();
      v353 = -[_SFPBRFFactItemDetailedNumberCardSection initWithFacade:](v351, "initWithFacade:", v352);
      -[_SFPBCardSectionValue setRfFactItemDetailedNumberCardSection:](v5, "setRfFactItemDetailedNumberCardSection:", v353);

    }
    objc_msgSend(v4, "rfFactItemHeroButtonCardSection");
    v354 = (void *)objc_claimAutoreleasedReturnValue();

    if (v354)
    {
      v355 = [_SFPBRFFactItemHeroButtonCardSection alloc];
      objc_msgSend(v4, "rfFactItemHeroButtonCardSection");
      v356 = (void *)objc_claimAutoreleasedReturnValue();
      v357 = -[_SFPBRFFactItemHeroButtonCardSection initWithFacade:](v355, "initWithFacade:", v356);
      -[_SFPBCardSectionValue setRfFactItemHeroButtonCardSection:](v5, "setRfFactItemHeroButtonCardSection:", v357);

    }
    objc_msgSend(v4, "rfFactItemImageRightCardSection");
    v358 = (void *)objc_claimAutoreleasedReturnValue();

    if (v358)
    {
      v359 = [_SFPBRFFactItemImageRightCardSection alloc];
      objc_msgSend(v4, "rfFactItemImageRightCardSection");
      v360 = (void *)objc_claimAutoreleasedReturnValue();
      v361 = -[_SFPBRFFactItemImageRightCardSection initWithFacade:](v359, "initWithFacade:", v360);
      -[_SFPBCardSectionValue setRfFactItemImageRightCardSection:](v5, "setRfFactItemImageRightCardSection:", v361);

    }
    objc_msgSend(v4, "rfSummaryItemSwitchV2CardSection");
    v362 = (void *)objc_claimAutoreleasedReturnValue();

    if (v362)
    {
      v363 = [_SFPBRFSummaryItemSwitchV2CardSection alloc];
      objc_msgSend(v4, "rfSummaryItemSwitchV2CardSection");
      v364 = (void *)objc_claimAutoreleasedReturnValue();
      v365 = -[_SFPBRFSummaryItemSwitchV2CardSection initWithFacade:](v363, "initWithFacade:", v364);
      -[_SFPBCardSectionValue setRfSummaryItemSwitchV2CardSection:](v5, "setRfSummaryItemSwitchV2CardSection:", v365);

    }
    objc_msgSend(v4, "rfTableHeaderCardSection");
    v366 = (void *)objc_claimAutoreleasedReturnValue();

    if (v366)
    {
      v367 = [_SFPBRFTableHeaderCardSection alloc];
      objc_msgSend(v4, "rfTableHeaderCardSection");
      v368 = (void *)objc_claimAutoreleasedReturnValue();
      v369 = -[_SFPBRFTableHeaderCardSection initWithFacade:](v367, "initWithFacade:", v368);
      -[_SFPBCardSectionValue setRfTableHeaderCardSection:](v5, "setRfTableHeaderCardSection:", v369);

    }
    objc_msgSend(v4, "rfTableRowCardSection");
    v370 = (void *)objc_claimAutoreleasedReturnValue();

    if (v370)
    {
      v371 = [_SFPBRFTableRowCardSection alloc];
      objc_msgSend(v4, "rfTableRowCardSection");
      v372 = (void *)objc_claimAutoreleasedReturnValue();
      v373 = -[_SFPBRFTableRowCardSection initWithFacade:](v371, "initWithFacade:", v372);
      -[_SFPBCardSectionValue setRfTableRowCardSection:](v5, "setRfTableRowCardSection:", v373);

    }
    objc_msgSend(v4, "rfSimpleItemVisualElementCardSection");
    v374 = (void *)objc_claimAutoreleasedReturnValue();

    if (v374)
    {
      v375 = [_SFPBRFSimpleItemVisualElementCardSection alloc];
      objc_msgSend(v4, "rfSimpleItemVisualElementCardSection");
      v376 = (void *)objc_claimAutoreleasedReturnValue();
      v377 = -[_SFPBRFSimpleItemVisualElementCardSection initWithFacade:](v375, "initWithFacade:", v376);
      -[_SFPBCardSectionValue setRfSimpleItemVisualElementCardSection:](v5, "setRfSimpleItemVisualElementCardSection:", v377);

    }
    objc_msgSend(v4, "rfSummaryItemPlayerCardSection");
    v378 = (void *)objc_claimAutoreleasedReturnValue();

    if (v378)
    {
      v379 = [_SFPBRFSummaryItemPlayerCardSection alloc];
      objc_msgSend(v4, "rfSummaryItemPlayerCardSection");
      v380 = (void *)objc_claimAutoreleasedReturnValue();
      v381 = -[_SFPBRFSummaryItemPlayerCardSection initWithFacade:](v379, "initWithFacade:", v380);
      -[_SFPBCardSectionValue setRfSummaryItemPlayerCardSection:](v5, "setRfSummaryItemPlayerCardSection:", v381);

    }
    objc_msgSend(v4, "rfSummaryItemImageRightCardSection");
    v382 = (void *)objc_claimAutoreleasedReturnValue();

    if (v382)
    {
      v383 = [_SFPBRFSummaryItemImageRightCardSection alloc];
      objc_msgSend(v4, "rfSummaryItemImageRightCardSection");
      v384 = (void *)objc_claimAutoreleasedReturnValue();
      v385 = -[_SFPBRFSummaryItemImageRightCardSection initWithFacade:](v383, "initWithFacade:", v384);
      -[_SFPBCardSectionValue setRfSummaryItemImageRightCardSection:](v5, "setRfSummaryItemImageRightCardSection:", v385);

    }
    objc_msgSend(v4, "rfSummaryItemButtonCardSection");
    v386 = (void *)objc_claimAutoreleasedReturnValue();

    if (v386)
    {
      v387 = [_SFPBRFSummaryItemButtonCardSection alloc];
      objc_msgSend(v4, "rfSummaryItemButtonCardSection");
      v388 = (void *)objc_claimAutoreleasedReturnValue();
      v389 = -[_SFPBRFSummaryItemButtonCardSection initWithFacade:](v387, "initWithFacade:", v388);
      -[_SFPBCardSectionValue setRfSummaryItemButtonCardSection:](v5, "setRfSummaryItemButtonCardSection:", v389);

    }
    objc_msgSend(v4, "rfSimpleItemReverseRichCardSection");
    v390 = (void *)objc_claimAutoreleasedReturnValue();

    if (v390)
    {
      v391 = [_SFPBRFSimpleItemReverseRichCardSection alloc];
      objc_msgSend(v4, "rfSimpleItemReverseRichCardSection");
      v392 = (void *)objc_claimAutoreleasedReturnValue();
      v393 = -[_SFPBRFSimpleItemReverseRichCardSection initWithFacade:](v391, "initWithFacade:", v392);
      -[_SFPBCardSectionValue setRfSimpleItemReverseRichCardSection:](v5, "setRfSimpleItemReverseRichCardSection:", v393);

    }
    objc_msgSend(v4, "rfSimpleItemRichSearchResultCardSection");
    v394 = (void *)objc_claimAutoreleasedReturnValue();

    if (v394)
    {
      v395 = [_SFPBRFSimpleItemRichSearchResultCardSection alloc];
      objc_msgSend(v4, "rfSimpleItemRichSearchResultCardSection");
      v396 = (void *)objc_claimAutoreleasedReturnValue();
      v397 = -[_SFPBRFSimpleItemRichSearchResultCardSection initWithFacade:](v395, "initWithFacade:", v396);
      -[_SFPBCardSectionValue setRfSimpleItemRichSearchResultCardSection:](v5, "setRfSimpleItemRichSearchResultCardSection:", v397);

    }
    objc_msgSend(v4, "rfPrimaryHeaderStackedImageCardSection");
    v398 = (void *)objc_claimAutoreleasedReturnValue();

    if (v398)
    {
      v399 = [_SFPBRFPrimaryHeaderStackedImageCardSection alloc];
      objc_msgSend(v4, "rfPrimaryHeaderStackedImageCardSection");
      v400 = (void *)objc_claimAutoreleasedReturnValue();
      v401 = -[_SFPBRFPrimaryHeaderStackedImageCardSection initWithFacade:](v399, "initWithFacade:", v400);
      -[_SFPBCardSectionValue setRfPrimaryHeaderStackedImageCardSection:](v5, "setRfPrimaryHeaderStackedImageCardSection:", v401);

    }
    objc_msgSend(v4, "rfReferenceItemLogoCardSection");
    v402 = (void *)objc_claimAutoreleasedReturnValue();

    if (v402)
    {
      v403 = [_SFPBRFReferenceItemLogoCardSection alloc];
      objc_msgSend(v4, "rfReferenceItemLogoCardSection");
      v404 = (void *)objc_claimAutoreleasedReturnValue();
      v405 = -[_SFPBRFReferenceItemLogoCardSection initWithFacade:](v403, "initWithFacade:", v404);
      -[_SFPBCardSectionValue setRfReferenceItemLogoCardSection:](v5, "setRfReferenceItemLogoCardSection:", v405);

    }
    objc_msgSend(v4, "rfReferenceItemButtonCardSection");
    v406 = (void *)objc_claimAutoreleasedReturnValue();

    if (v406)
    {
      v407 = [_SFPBRFReferenceItemButtonCardSection alloc];
      objc_msgSend(v4, "rfReferenceItemButtonCardSection");
      v408 = (void *)objc_claimAutoreleasedReturnValue();
      v409 = -[_SFPBRFReferenceItemButtonCardSection initWithFacade:](v407, "initWithFacade:", v408);
      -[_SFPBCardSectionValue setRfReferenceItemButtonCardSection:](v5, "setRfReferenceItemButtonCardSection:", v409);

    }
    objc_msgSend(v4, "rfButtonCardSection");
    v410 = (void *)objc_claimAutoreleasedReturnValue();

    if (v410)
    {
      v411 = [_SFPBRFButtonCardSection alloc];
      objc_msgSend(v4, "rfButtonCardSection");
      v412 = (void *)objc_claimAutoreleasedReturnValue();
      v413 = -[_SFPBRFButtonCardSection initWithFacade:](v411, "initWithFacade:", v412);
      -[_SFPBCardSectionValue setRfButtonCardSection:](v5, "setRfButtonCardSection:", v413);

    }
    objc_msgSend(v4, "rfBinaryButtonCardSection");
    v414 = (void *)objc_claimAutoreleasedReturnValue();

    if (v414)
    {
      v415 = [_SFPBRFBinaryButtonCardSection alloc];
      objc_msgSend(v4, "rfBinaryButtonCardSection");
      v416 = (void *)objc_claimAutoreleasedReturnValue();
      v417 = -[_SFPBRFBinaryButtonCardSection initWithFacade:](v415, "initWithFacade:", v416);
      -[_SFPBCardSectionValue setRfBinaryButtonCardSection:](v5, "setRfBinaryButtonCardSection:", v417);

    }
    objc_msgSend(v4, "rfReferenceCenteredCardSection");
    v418 = (void *)objc_claimAutoreleasedReturnValue();

    if (v418)
    {
      v419 = [_SFPBRFReferenceCenteredCardSection alloc];
      objc_msgSend(v4, "rfReferenceCenteredCardSection");
      v420 = (void *)objc_claimAutoreleasedReturnValue();
      v421 = -[_SFPBRFReferenceCenteredCardSection initWithFacade:](v419, "initWithFacade:", v420);
      -[_SFPBCardSectionValue setRfReferenceCenteredCardSection:](v5, "setRfReferenceCenteredCardSection:", v421);

    }
    objc_msgSend(v4, "rfSecondaryHeaderStandardCardSection");
    v422 = (void *)objc_claimAutoreleasedReturnValue();

    if (v422)
    {
      v423 = [_SFPBRFSecondaryHeaderStandardCardSection alloc];
      objc_msgSend(v4, "rfSecondaryHeaderStandardCardSection");
      v424 = (void *)objc_claimAutoreleasedReturnValue();
      v425 = -[_SFPBRFSecondaryHeaderStandardCardSection initWithFacade:](v423, "initWithFacade:", v424);
      -[_SFPBCardSectionValue setRfSecondaryHeaderStandardCardSection:](v5, "setRfSecondaryHeaderStandardCardSection:", v425);

    }
    objc_msgSend(v4, "rfSecondaryHeaderEmphasizedCardSection");
    v426 = (void *)objc_claimAutoreleasedReturnValue();

    if (v426)
    {
      v427 = [_SFPBRFSecondaryHeaderEmphasizedCardSection alloc];
      objc_msgSend(v4, "rfSecondaryHeaderEmphasizedCardSection");
      v428 = (void *)objc_claimAutoreleasedReturnValue();
      v429 = -[_SFPBRFSecondaryHeaderEmphasizedCardSection initWithFacade:](v427, "initWithFacade:", v428);
      -[_SFPBCardSectionValue setRfSecondaryHeaderEmphasizedCardSection:](v5, "setRfSecondaryHeaderEmphasizedCardSection:", v429);

    }
    objc_msgSend(v4, "rfMapCardSection");
    v430 = (void *)objc_claimAutoreleasedReturnValue();

    if (v430)
    {
      v431 = [_SFPBRFMapCardSection alloc];
      objc_msgSend(v4, "rfMapCardSection");
      v432 = (void *)objc_claimAutoreleasedReturnValue();
      v433 = -[_SFPBRFMapCardSection initWithFacade:](v431, "initWithFacade:", v432);
      -[_SFPBCardSectionValue setRfMapCardSection:](v5, "setRfMapCardSection:", v433);

    }
    objc_msgSend(v4, "rfReferenceStandardCardSection");
    v434 = (void *)objc_claimAutoreleasedReturnValue();

    if (v434)
    {
      v435 = [_SFPBRFReferenceStandardCardSection alloc];
      objc_msgSend(v4, "rfReferenceStandardCardSection");
      v436 = (void *)objc_claimAutoreleasedReturnValue();
      v437 = -[_SFPBRFReferenceStandardCardSection initWithFacade:](v435, "initWithFacade:", v436);
      -[_SFPBCardSectionValue setRfReferenceStandardCardSection:](v5, "setRfReferenceStandardCardSection:", v437);

    }
    objc_msgSend(v4, "rfMultiButtonCardSection");
    v438 = (void *)objc_claimAutoreleasedReturnValue();

    if (v438)
    {
      v439 = [_SFPBRFMultiButtonCardSection alloc];
      objc_msgSend(v4, "rfMultiButtonCardSection");
      v440 = (void *)objc_claimAutoreleasedReturnValue();
      v441 = -[_SFPBRFMultiButtonCardSection initWithFacade:](v439, "initWithFacade:", v440);
      -[_SFPBCardSectionValue setRfMultiButtonCardSection:](v5, "setRfMultiButtonCardSection:", v441);

    }
    objc_msgSend(v4, "rfDisambiguationTitleCardSection");
    v442 = (void *)objc_claimAutoreleasedReturnValue();

    if (v442)
    {
      v443 = [_SFPBRFDisambiguationTitleCardSection alloc];
      objc_msgSend(v4, "rfDisambiguationTitleCardSection");
      v444 = (void *)objc_claimAutoreleasedReturnValue();
      v445 = -[_SFPBRFDisambiguationTitleCardSection initWithFacade:](v443, "initWithFacade:", v444);
      -[_SFPBCardSectionValue setRfDisambiguationTitleCardSection:](v5, "setRfDisambiguationTitleCardSection:", v445);

    }
    v446 = v5;
  }

  return v5;
}

- (void)setAppLinkCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_appLinkCardSection, a3);
}

- (void)setDescriptionCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionCardSection, a3);
}

- (void)setKeyValueDataCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_keyValueDataCardSection, a3);
}

- (void)setMapCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_mapCardSection, a3);
}

- (void)setMediaInfoCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_mediaInfoCardSection, a3);
}

- (void)setMediaPlayerCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_mediaPlayerCardSection, a3);
}

- (void)setNowPlayingCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_nowPlayingCardSection, a3);
}

- (void)setRichTitleCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_richTitleCardSection, a3);
}

- (void)setRowCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rowCardSection, a3);
}

- (void)setScoreboardCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_scoreboardCardSection, a3);
}

- (void)setSocialMediaPostCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_socialMediaPostCardSection, a3);
}

- (void)setStockChartCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_stockChartCardSection, a3);
}

- (void)setTableHeaderRowCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_tableHeaderRowCardSection, a3);
}

- (void)setTableRowCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_tableRowCardSection, a3);
}

- (void)setTextColumnsCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_textColumnsCardSection, a3);
}

- (void)setTitleCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_titleCardSection, a3);
}

- (void)setTrackListCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_trackListCardSection, a3);
}

- (void)setAudioPlaybackCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_audioPlaybackCardSection, a3);
}

- (void)setFlightCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_flightCardSection, a3);
}

- (void)setActivityIndicatorCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicatorCardSection, a3);
}

- (void)setWebCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_webCardSection, a3);
}

- (void)setMessageCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_messageCardSection, a3);
}

- (void)setDetailedRowCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_detailedRowCardSection, a3);
}

- (void)setImagesCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_imagesCardSection, a3);
}

- (void)setSuggestionCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionCardSection, a3);
}

- (void)setSelectableGridCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_selectableGridCardSection, a3);
}

- (void)setSectionHeaderCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_sectionHeaderCardSection, a3);
}

- (void)setMetaInfoCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_metaInfoCardSection, a3);
}

- (void)setWatchListCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_watchListCardSection, a3);
}

- (void)setMapsDetailedRowCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_mapsDetailedRowCardSection, a3);
}

- (void)setButtonCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_buttonCardSection, a3);
}

- (void)setHorizontalButtonCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_horizontalButtonCardSection, a3);
}

- (void)setVerticalLayoutCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_verticalLayoutCardSection, a3);
}

- (void)setProductCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_productCardSection, a3);
}

- (void)setHorizontalScrollCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_horizontalScrollCardSection, a3);
}

- (void)setMediaRemoteControlCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_mediaRemoteControlCardSection, a3);
}

- (void)setMapPlaceCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_mapPlaceCardSection, a3);
}

- (void)setCompactRowCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_compactRowCardSection, a3);
}

- (void)setWorldMapCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_worldMapCardSection, a3);
}

- (void)setAttributionFooterCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_attributionFooterCardSection, a3);
}

- (void)setGridCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_gridCardSection, a3);
}

- (void)setPersonHeaderCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_personHeaderCardSection, a3);
}

- (void)setColorBarCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_colorBarCardSection, a3);
}

- (void)setSplitCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_splitCardSection, a3);
}

- (void)setLinkPresentationCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_linkPresentationCardSection, a3);
}

- (void)setFindMyCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_findMyCardSection, a3);
}

- (void)setHeroCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_heroCardSection, a3);
}

- (void)setNewsCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_newsCardSection, a3);
}

- (void)setMiniCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_miniCardSection, a3);
}

- (void)setInfoCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_infoCardSection, a3);
}

- (void)setCollectionCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_collectionCardSection, a3);
}

- (void)setCombinedCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_combinedCardSection, a3);
}

- (void)setResponseWrapperCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_responseWrapperCardSection, a3);
}

- (void)setListenToCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_listenToCardSection, a3);
}

- (void)setWatchNowCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_watchNowCardSection, a3);
}

- (void)setStrokeAnimationCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_strokeAnimationCardSection, a3);
}

- (void)setButtonListCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_buttonListCardSection, a3);
}

- (void)setCommandRowCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_commandRowCardSection, a3);
}

- (void)setLeadingTrailingCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_leadingTrailingCardSection, a3);
}

- (void)setHeroTitleCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_heroTitleCardSection, a3);
}

- (void)setArchiveViewCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_archiveViewCardSection, a3);
}

- (void)setAppIconCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_appIconCardSection, a3);
}

- (void)setLargeTitleDetailedRowCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_largeTitleDetailedRowCardSection, a3);
}

- (void)setSafariTableOfContentsCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_safariTableOfContentsCardSection, a3);
}

- (void)setRfSummaryItemShortNumberCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfSummaryItemShortNumberCardSection, a3);
}

- (void)setRfSummaryItemTextCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfSummaryItemTextCardSection, a3);
}

- (void)setRfSummaryItemStandardCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfSummaryItemStandardCardSection, a3);
}

- (void)setRfFactItemShortNumberCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfFactItemShortNumberCardSection, a3);
}

- (void)setRfFactItemStandardCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfFactItemStandardCardSection, a3);
}

- (void)setRfLongItemStandardCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfLongItemStandardCardSection, a3);
}

- (void)setRfPrimaryHeaderRichCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfPrimaryHeaderRichCardSection, a3);
}

- (void)setRfPrimaryHeaderStandardCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfPrimaryHeaderStandardCardSection, a3);
}

- (void)setRfReferenceFootnoteCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfReferenceFootnoteCardSection, a3);
}

- (void)setRfReferenceRichCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfReferenceRichCardSection, a3);
}

- (void)setRfSimpleItemRichCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfSimpleItemRichCardSection, a3);
}

- (void)setRfSimpleItemStandardCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfSimpleItemStandardCardSection, a3);
}

- (void)setRfSummaryItemAlignedTextCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfSummaryItemAlignedTextCardSection, a3);
}

- (void)setRfExpandableStandardCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfExpandableStandardCardSection, a3);
}

- (void)setRfFactItemButtonCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfFactItemButtonCardSection, a3);
}

- (void)setRfFactItemHeroNumberCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfFactItemHeroNumberCardSection, a3);
}

- (void)setRfPrimaryHeaderMarqueeCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfPrimaryHeaderMarqueeCardSection, a3);
}

- (void)setRfSummaryItemDetailedTextCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfSummaryItemDetailedTextCardSection, a3);
}

- (void)setRfSimpleItemPlayerCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfSimpleItemPlayerCardSection, a3);
}

- (void)setRfSummaryItemPairCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfSummaryItemPairCardSection, a3);
}

- (void)setRfSummaryItemPairNumberCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfSummaryItemPairNumberCardSection, a3);
}

- (void)setRfFactItemShortHeroNumberCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfFactItemShortHeroNumberCardSection, a3);
}

- (void)setRfFactItemDetailedNumberCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfFactItemDetailedNumberCardSection, a3);
}

- (void)setRfFactItemHeroButtonCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfFactItemHeroButtonCardSection, a3);
}

- (void)setRfFactItemImageRightCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfFactItemImageRightCardSection, a3);
}

- (void)setRfSummaryItemSwitchV2CardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfSummaryItemSwitchV2CardSection, a3);
}

- (void)setRfTableHeaderCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfTableHeaderCardSection, a3);
}

- (void)setRfTableRowCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfTableRowCardSection, a3);
}

- (void)setRfSimpleItemVisualElementCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfSimpleItemVisualElementCardSection, a3);
}

- (void)setRfSummaryItemPlayerCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfSummaryItemPlayerCardSection, a3);
}

- (void)setRfSummaryItemImageRightCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfSummaryItemImageRightCardSection, a3);
}

- (void)setRfSummaryItemButtonCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfSummaryItemButtonCardSection, a3);
}

- (void)setRfSimpleItemReverseRichCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfSimpleItemReverseRichCardSection, a3);
}

- (void)setRfSimpleItemRichSearchResultCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfSimpleItemRichSearchResultCardSection, a3);
}

- (void)setRfPrimaryHeaderStackedImageCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfPrimaryHeaderStackedImageCardSection, a3);
}

- (void)setRfReferenceItemLogoCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfReferenceItemLogoCardSection, a3);
}

- (void)setRfReferenceItemButtonCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfReferenceItemButtonCardSection, a3);
}

- (void)setRfButtonCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfButtonCardSection, a3);
}

- (void)setRfBinaryButtonCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfBinaryButtonCardSection, a3);
}

- (void)setRfReferenceCenteredCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfReferenceCenteredCardSection, a3);
}

- (void)setRfSecondaryHeaderStandardCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfSecondaryHeaderStandardCardSection, a3);
}

- (void)setRfSecondaryHeaderEmphasizedCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfSecondaryHeaderEmphasizedCardSection, a3);
}

- (void)setRfMapCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfMapCardSection, a3);
}

- (void)setRfReferenceStandardCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfReferenceStandardCardSection, a3);
}

- (void)setRfMultiButtonCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfMultiButtonCardSection, a3);
}

- (void)setRfDisambiguationTitleCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfDisambiguationTitleCardSection, a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBCardSectionValueReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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
  id v114;

  v114 = a3;
  -[_SFPBCardSectionValue appLinkCardSection](self, "appLinkCardSection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue descriptionCardSection](self, "descriptionCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue keyValueDataCardSection](self, "keyValueDataCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue mapCardSection](self, "mapCardSection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue mediaInfoCardSection](self, "mediaInfoCardSection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue mediaPlayerCardSection](self, "mediaPlayerCardSection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue nowPlayingCardSection](self, "nowPlayingCardSection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue richTitleCardSection](self, "richTitleCardSection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue rowCardSection](self, "rowCardSection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue scoreboardCardSection](self, "scoreboardCardSection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue socialMediaPostCardSection](self, "socialMediaPostCardSection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue stockChartCardSection](self, "stockChartCardSection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue tableHeaderRowCardSection](self, "tableHeaderRowCardSection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue tableRowCardSection](self, "tableRowCardSection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue textColumnsCardSection](self, "textColumnsCardSection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue titleCardSection](self, "titleCardSection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue trackListCardSection](self, "trackListCardSection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue audioPlaybackCardSection](self, "audioPlaybackCardSection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue flightCardSection](self, "flightCardSection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue activityIndicatorCardSection](self, "activityIndicatorCardSection");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue webCardSection](self, "webCardSection");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue messageCardSection](self, "messageCardSection");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue detailedRowCardSection](self, "detailedRowCardSection");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue imagesCardSection](self, "imagesCardSection");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue suggestionCardSection](self, "suggestionCardSection");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue selectableGridCardSection](self, "selectableGridCardSection");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue sectionHeaderCardSection](self, "sectionHeaderCardSection");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue metaInfoCardSection](self, "metaInfoCardSection");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue watchListCardSection](self, "watchListCardSection");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue mapsDetailedRowCardSection](self, "mapsDetailedRowCardSection");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue buttonCardSection](self, "buttonCardSection");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue horizontalButtonCardSection](self, "horizontalButtonCardSection");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue verticalLayoutCardSection](self, "verticalLayoutCardSection");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue productCardSection](self, "productCardSection");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue horizontalScrollCardSection](self, "horizontalScrollCardSection");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue mediaRemoteControlCardSection](self, "mediaRemoteControlCardSection");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue mapPlaceCardSection](self, "mapPlaceCardSection");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (v40)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue compactRowCardSection](self, "compactRowCardSection");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue worldMapCardSection](self, "worldMapCardSection");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (v42)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue attributionFooterCardSection](self, "attributionFooterCardSection");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue gridCardSection](self, "gridCardSection");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (v44)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue personHeaderCardSection](self, "personHeaderCardSection");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (v45)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue colorBarCardSection](self, "colorBarCardSection");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (v46)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue splitCardSection](self, "splitCardSection");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (v47)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue linkPresentationCardSection](self, "linkPresentationCardSection");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (v48)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue findMyCardSection](self, "findMyCardSection");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (v49)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue heroCardSection](self, "heroCardSection");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (v50)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue newsCardSection](self, "newsCardSection");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (v51)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue miniCardSection](self, "miniCardSection");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (v52)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue infoCardSection](self, "infoCardSection");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (v53)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue collectionCardSection](self, "collectionCardSection");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (v54)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue combinedCardSection](self, "combinedCardSection");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (v55)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue responseWrapperCardSection](self, "responseWrapperCardSection");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if (v56)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue listenToCardSection](self, "listenToCardSection");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if (v57)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue watchNowCardSection](self, "watchNowCardSection");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if (v58)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue strokeAnimationCardSection](self, "strokeAnimationCardSection");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if (v59)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue buttonListCardSection](self, "buttonListCardSection");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (v60)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue commandRowCardSection](self, "commandRowCardSection");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (v61)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue leadingTrailingCardSection](self, "leadingTrailingCardSection");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  if (v62)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue heroTitleCardSection](self, "heroTitleCardSection");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if (v63)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue archiveViewCardSection](self, "archiveViewCardSection");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  if (v64)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue appIconCardSection](self, "appIconCardSection");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  if (v65)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue largeTitleDetailedRowCardSection](self, "largeTitleDetailedRowCardSection");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  if (v66)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue safariTableOfContentsCardSection](self, "safariTableOfContentsCardSection");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  if (v67)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue rfSummaryItemShortNumberCardSection](self, "rfSummaryItemShortNumberCardSection");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  if (v68)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue rfSummaryItemTextCardSection](self, "rfSummaryItemTextCardSection");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  if (v69)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue rfSummaryItemStandardCardSection](self, "rfSummaryItemStandardCardSection");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  if (v70)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue rfFactItemShortNumberCardSection](self, "rfFactItemShortNumberCardSection");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  if (v71)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue rfFactItemStandardCardSection](self, "rfFactItemStandardCardSection");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  if (v72)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue rfLongItemStandardCardSection](self, "rfLongItemStandardCardSection");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  if (v73)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue rfPrimaryHeaderRichCardSection](self, "rfPrimaryHeaderRichCardSection");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  if (v74)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue rfPrimaryHeaderStandardCardSection](self, "rfPrimaryHeaderStandardCardSection");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  if (v75)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue rfReferenceFootnoteCardSection](self, "rfReferenceFootnoteCardSection");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  if (v76)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue rfReferenceRichCardSection](self, "rfReferenceRichCardSection");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  if (v77)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue rfSimpleItemRichCardSection](self, "rfSimpleItemRichCardSection");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  if (v78)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue rfSimpleItemStandardCardSection](self, "rfSimpleItemStandardCardSection");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  if (v79)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue rfSummaryItemAlignedTextCardSection](self, "rfSummaryItemAlignedTextCardSection");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  if (v80)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue rfExpandableStandardCardSection](self, "rfExpandableStandardCardSection");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  if (v81)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue rfFactItemButtonCardSection](self, "rfFactItemButtonCardSection");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  if (v82)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue rfFactItemHeroNumberCardSection](self, "rfFactItemHeroNumberCardSection");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  if (v83)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue rfPrimaryHeaderMarqueeCardSection](self, "rfPrimaryHeaderMarqueeCardSection");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  if (v84)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue rfSummaryItemDetailedTextCardSection](self, "rfSummaryItemDetailedTextCardSection");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  if (v85)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue rfSimpleItemPlayerCardSection](self, "rfSimpleItemPlayerCardSection");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  if (v86)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue rfSummaryItemPairCardSection](self, "rfSummaryItemPairCardSection");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  if (v87)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue rfSummaryItemPairNumberCardSection](self, "rfSummaryItemPairNumberCardSection");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  if (v88)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue rfFactItemShortHeroNumberCardSection](self, "rfFactItemShortHeroNumberCardSection");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  if (v89)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue rfFactItemDetailedNumberCardSection](self, "rfFactItemDetailedNumberCardSection");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  if (v90)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue rfFactItemHeroButtonCardSection](self, "rfFactItemHeroButtonCardSection");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  if (v91)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue rfFactItemImageRightCardSection](self, "rfFactItemImageRightCardSection");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  if (v92)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue rfSummaryItemSwitchV2CardSection](self, "rfSummaryItemSwitchV2CardSection");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  if (v93)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue rfTableHeaderCardSection](self, "rfTableHeaderCardSection");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  if (v94)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue rfTableRowCardSection](self, "rfTableRowCardSection");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  if (v95)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue rfSimpleItemVisualElementCardSection](self, "rfSimpleItemVisualElementCardSection");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  if (v96)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue rfSummaryItemPlayerCardSection](self, "rfSummaryItemPlayerCardSection");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  if (v97)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue rfSummaryItemImageRightCardSection](self, "rfSummaryItemImageRightCardSection");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  if (v98)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue rfSummaryItemButtonCardSection](self, "rfSummaryItemButtonCardSection");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  if (v99)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue rfSimpleItemReverseRichCardSection](self, "rfSimpleItemReverseRichCardSection");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  if (v100)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue rfSimpleItemRichSearchResultCardSection](self, "rfSimpleItemRichSearchResultCardSection");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  if (v101)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue rfPrimaryHeaderStackedImageCardSection](self, "rfPrimaryHeaderStackedImageCardSection");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  if (v102)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue rfReferenceItemLogoCardSection](self, "rfReferenceItemLogoCardSection");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  if (v103)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue rfReferenceItemButtonCardSection](self, "rfReferenceItemButtonCardSection");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  if (v104)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue rfButtonCardSection](self, "rfButtonCardSection");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  if (v105)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue rfBinaryButtonCardSection](self, "rfBinaryButtonCardSection");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  if (v106)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue rfReferenceCenteredCardSection](self, "rfReferenceCenteredCardSection");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  if (v107)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue rfSecondaryHeaderStandardCardSection](self, "rfSecondaryHeaderStandardCardSection");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  if (v108)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue rfSecondaryHeaderEmphasizedCardSection](self, "rfSecondaryHeaderEmphasizedCardSection");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  if (v109)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue rfMapCardSection](self, "rfMapCardSection");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  if (v110)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue rfReferenceStandardCardSection](self, "rfReferenceStandardCardSection");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  if (v111)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue rfMultiButtonCardSection](self, "rfMultiButtonCardSection");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  if (v112)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSectionValue rfDisambiguationTitleCardSection](self, "rfDisambiguationTitleCardSection");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  if (v113)
    PBDataWriterWriteSubmessage();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  int v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  int v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  int v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  int v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  int v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  int v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  int v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  int v101;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  int v106;
  uint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  int v111;
  uint64_t v112;
  void *v113;
  void *v114;
  void *v115;
  int v116;
  uint64_t v117;
  void *v118;
  void *v119;
  void *v120;
  int v121;
  uint64_t v122;
  void *v123;
  void *v124;
  void *v125;
  int v126;
  uint64_t v127;
  void *v128;
  void *v129;
  void *v130;
  int v131;
  uint64_t v132;
  void *v133;
  void *v134;
  void *v135;
  int v136;
  uint64_t v137;
  void *v138;
  void *v139;
  void *v140;
  int v141;
  uint64_t v142;
  void *v143;
  void *v144;
  void *v145;
  int v146;
  uint64_t v147;
  void *v148;
  void *v149;
  void *v150;
  int v151;
  uint64_t v152;
  void *v153;
  void *v154;
  void *v155;
  int v156;
  uint64_t v157;
  void *v158;
  void *v159;
  void *v160;
  int v161;
  uint64_t v162;
  void *v163;
  void *v164;
  void *v165;
  int v166;
  uint64_t v167;
  void *v168;
  void *v169;
  void *v170;
  int v171;
  uint64_t v172;
  void *v173;
  void *v174;
  void *v175;
  int v176;
  uint64_t v177;
  void *v178;
  void *v179;
  void *v180;
  int v181;
  uint64_t v182;
  void *v183;
  void *v184;
  void *v185;
  int v186;
  uint64_t v187;
  void *v188;
  void *v189;
  void *v190;
  int v191;
  uint64_t v192;
  void *v193;
  void *v194;
  void *v195;
  int v196;
  uint64_t v197;
  void *v198;
  void *v199;
  void *v200;
  int v201;
  uint64_t v202;
  void *v203;
  void *v204;
  void *v205;
  int v206;
  uint64_t v207;
  void *v208;
  void *v209;
  void *v210;
  int v211;
  uint64_t v212;
  void *v213;
  void *v214;
  void *v215;
  int v216;
  uint64_t v217;
  void *v218;
  void *v219;
  void *v220;
  int v221;
  uint64_t v222;
  void *v223;
  void *v224;
  void *v225;
  int v226;
  uint64_t v227;
  void *v228;
  void *v229;
  void *v230;
  int v231;
  uint64_t v232;
  void *v233;
  void *v234;
  void *v235;
  int v236;
  uint64_t v237;
  void *v238;
  void *v239;
  void *v240;
  int v241;
  uint64_t v242;
  void *v243;
  void *v244;
  void *v245;
  int v246;
  uint64_t v247;
  void *v248;
  void *v249;
  void *v250;
  int v251;
  uint64_t v252;
  void *v253;
  void *v254;
  void *v255;
  int v256;
  uint64_t v257;
  void *v258;
  void *v259;
  void *v260;
  int v261;
  uint64_t v262;
  void *v263;
  void *v264;
  void *v265;
  int v266;
  uint64_t v267;
  void *v268;
  void *v269;
  void *v270;
  int v271;
  uint64_t v272;
  void *v273;
  void *v274;
  void *v275;
  int v276;
  uint64_t v277;
  void *v278;
  void *v279;
  void *v280;
  int v281;
  uint64_t v282;
  void *v283;
  void *v284;
  void *v285;
  int v286;
  uint64_t v287;
  void *v288;
  void *v289;
  void *v290;
  int v291;
  uint64_t v292;
  void *v293;
  void *v294;
  void *v295;
  int v296;
  uint64_t v297;
  void *v298;
  void *v299;
  void *v300;
  int v301;
  uint64_t v302;
  void *v303;
  void *v304;
  void *v305;
  int v306;
  uint64_t v307;
  void *v308;
  void *v309;
  void *v310;
  int v311;
  uint64_t v312;
  void *v313;
  void *v314;
  void *v315;
  int v316;
  uint64_t v317;
  void *v318;
  void *v319;
  void *v320;
  int v321;
  uint64_t v322;
  void *v323;
  void *v324;
  void *v325;
  int v326;
  uint64_t v327;
  void *v328;
  void *v329;
  void *v330;
  int v331;
  uint64_t v332;
  void *v333;
  void *v334;
  void *v335;
  int v336;
  uint64_t v337;
  void *v338;
  void *v339;
  void *v340;
  int v341;
  uint64_t v342;
  void *v343;
  void *v344;
  void *v345;
  int v346;
  uint64_t v347;
  void *v348;
  void *v349;
  void *v350;
  int v351;
  uint64_t v352;
  void *v353;
  void *v354;
  void *v355;
  int v356;
  uint64_t v357;
  void *v358;
  void *v359;
  void *v360;
  int v361;
  uint64_t v362;
  void *v363;
  void *v364;
  void *v365;
  int v366;
  uint64_t v367;
  void *v368;
  void *v369;
  void *v370;
  int v371;
  uint64_t v372;
  void *v373;
  void *v374;
  void *v375;
  int v376;
  uint64_t v377;
  void *v378;
  void *v379;
  void *v380;
  int v381;
  uint64_t v382;
  void *v383;
  void *v384;
  void *v385;
  int v386;
  uint64_t v387;
  void *v388;
  void *v389;
  void *v390;
  int v391;
  uint64_t v392;
  void *v393;
  void *v394;
  void *v395;
  int v396;
  uint64_t v397;
  void *v398;
  void *v399;
  void *v400;
  int v401;
  uint64_t v402;
  void *v403;
  void *v404;
  void *v405;
  int v406;
  uint64_t v407;
  void *v408;
  void *v409;
  void *v410;
  int v411;
  uint64_t v412;
  void *v413;
  void *v414;
  void *v415;
  int v416;
  uint64_t v417;
  void *v418;
  void *v419;
  void *v420;
  int v421;
  uint64_t v422;
  void *v423;
  void *v424;
  void *v425;
  int v426;
  uint64_t v427;
  void *v428;
  void *v429;
  void *v430;
  int v431;
  uint64_t v432;
  void *v433;
  void *v434;
  void *v435;
  int v436;
  uint64_t v437;
  void *v438;
  void *v439;
  void *v440;
  int v441;
  uint64_t v442;
  void *v443;
  void *v444;
  void *v445;
  int v446;
  uint64_t v447;
  void *v448;
  void *v449;
  void *v450;
  int v451;
  uint64_t v452;
  void *v453;
  void *v454;
  void *v455;
  int v456;
  uint64_t v457;
  void *v458;
  void *v459;
  void *v460;
  int v461;
  uint64_t v462;
  void *v463;
  void *v464;
  void *v465;
  int v466;
  uint64_t v467;
  void *v468;
  void *v469;
  void *v470;
  int v471;
  uint64_t v472;
  void *v473;
  void *v474;
  void *v475;
  int v476;
  uint64_t v477;
  void *v478;
  void *v479;
  void *v480;
  int v481;
  uint64_t v482;
  void *v483;
  void *v484;
  void *v485;
  int v486;
  uint64_t v487;
  void *v488;
  void *v489;
  void *v490;
  int v491;
  uint64_t v492;
  void *v493;
  void *v494;
  void *v495;
  int v496;
  uint64_t v497;
  void *v498;
  void *v499;
  void *v500;
  int v501;
  uint64_t v502;
  void *v503;
  void *v504;
  void *v505;
  int v506;
  uint64_t v507;
  void *v508;
  void *v509;
  void *v510;
  int v511;
  uint64_t v512;
  void *v513;
  void *v514;
  void *v515;
  int v516;
  uint64_t v517;
  void *v518;
  void *v519;
  void *v520;
  int v521;
  uint64_t v522;
  void *v523;
  void *v524;
  void *v525;
  int v526;
  uint64_t v527;
  void *v528;
  void *v529;
  void *v530;
  int v531;
  uint64_t v532;
  void *v533;
  void *v534;
  void *v535;
  int v536;
  uint64_t v537;
  void *v538;
  void *v539;
  void *v540;
  int v541;
  uint64_t v542;
  void *v543;
  void *v544;
  void *v545;
  int v546;
  uint64_t v547;
  void *v548;
  void *v549;
  void *v550;
  int v551;
  uint64_t v552;
  void *v553;
  void *v554;
  void *v555;
  char v556;
  BOOL v557;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_552;
  -[_SFPBCardSectionValue appLinkCardSection](self, "appLinkCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appLinkCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue appLinkCardSection](self, "appLinkCardSection");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBCardSectionValue appLinkCardSection](self, "appLinkCardSection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appLinkCardSection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue descriptionCardSection](self, "descriptionCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descriptionCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue descriptionCardSection](self, "descriptionCardSection");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBCardSectionValue descriptionCardSection](self, "descriptionCardSection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "descriptionCardSection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue keyValueDataCardSection](self, "keyValueDataCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyValueDataCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue keyValueDataCardSection](self, "keyValueDataCardSection");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBCardSectionValue keyValueDataCardSection](self, "keyValueDataCardSection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "keyValueDataCardSection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue mapCardSection](self, "mapCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mapCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue mapCardSection](self, "mapCardSection");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_SFPBCardSectionValue mapCardSection](self, "mapCardSection");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mapCardSection");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue mediaInfoCardSection](self, "mediaInfoCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaInfoCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue mediaInfoCardSection](self, "mediaInfoCardSection");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_SFPBCardSectionValue mediaInfoCardSection](self, "mediaInfoCardSection");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaInfoCardSection");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue mediaPlayerCardSection](self, "mediaPlayerCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaPlayerCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue mediaPlayerCardSection](self, "mediaPlayerCardSection");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[_SFPBCardSectionValue mediaPlayerCardSection](self, "mediaPlayerCardSection");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaPlayerCardSection");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue nowPlayingCardSection](self, "nowPlayingCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nowPlayingCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue nowPlayingCardSection](self, "nowPlayingCardSection");
  v37 = objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = (void *)v37;
    -[_SFPBCardSectionValue nowPlayingCardSection](self, "nowPlayingCardSection");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nowPlayingCardSection");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if (!v41)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue richTitleCardSection](self, "richTitleCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "richTitleCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue richTitleCardSection](self, "richTitleCardSection");
  v42 = objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v43 = (void *)v42;
    -[_SFPBCardSectionValue richTitleCardSection](self, "richTitleCardSection");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "richTitleCardSection");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v44, "isEqual:", v45);

    if (!v46)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue rowCardSection](self, "rowCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rowCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue rowCardSection](self, "rowCardSection");
  v47 = objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    v48 = (void *)v47;
    -[_SFPBCardSectionValue rowCardSection](self, "rowCardSection");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rowCardSection");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v49, "isEqual:", v50);

    if (!v51)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue scoreboardCardSection](self, "scoreboardCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scoreboardCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue scoreboardCardSection](self, "scoreboardCardSection");
  v52 = objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    v53 = (void *)v52;
    -[_SFPBCardSectionValue scoreboardCardSection](self, "scoreboardCardSection");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scoreboardCardSection");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v54, "isEqual:", v55);

    if (!v56)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue socialMediaPostCardSection](self, "socialMediaPostCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "socialMediaPostCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue socialMediaPostCardSection](self, "socialMediaPostCardSection");
  v57 = objc_claimAutoreleasedReturnValue();
  if (v57)
  {
    v58 = (void *)v57;
    -[_SFPBCardSectionValue socialMediaPostCardSection](self, "socialMediaPostCardSection");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "socialMediaPostCardSection");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v59, "isEqual:", v60);

    if (!v61)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue stockChartCardSection](self, "stockChartCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stockChartCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue stockChartCardSection](self, "stockChartCardSection");
  v62 = objc_claimAutoreleasedReturnValue();
  if (v62)
  {
    v63 = (void *)v62;
    -[_SFPBCardSectionValue stockChartCardSection](self, "stockChartCardSection");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stockChartCardSection");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v64, "isEqual:", v65);

    if (!v66)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue tableHeaderRowCardSection](self, "tableHeaderRowCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tableHeaderRowCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue tableHeaderRowCardSection](self, "tableHeaderRowCardSection");
  v67 = objc_claimAutoreleasedReturnValue();
  if (v67)
  {
    v68 = (void *)v67;
    -[_SFPBCardSectionValue tableHeaderRowCardSection](self, "tableHeaderRowCardSection");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tableHeaderRowCardSection");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend(v69, "isEqual:", v70);

    if (!v71)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue tableRowCardSection](self, "tableRowCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tableRowCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue tableRowCardSection](self, "tableRowCardSection");
  v72 = objc_claimAutoreleasedReturnValue();
  if (v72)
  {
    v73 = (void *)v72;
    -[_SFPBCardSectionValue tableRowCardSection](self, "tableRowCardSection");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tableRowCardSection");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend(v74, "isEqual:", v75);

    if (!v76)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue textColumnsCardSection](self, "textColumnsCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textColumnsCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue textColumnsCardSection](self, "textColumnsCardSection");
  v77 = objc_claimAutoreleasedReturnValue();
  if (v77)
  {
    v78 = (void *)v77;
    -[_SFPBCardSectionValue textColumnsCardSection](self, "textColumnsCardSection");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textColumnsCardSection");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = objc_msgSend(v79, "isEqual:", v80);

    if (!v81)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue titleCardSection](self, "titleCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue titleCardSection](self, "titleCardSection");
  v82 = objc_claimAutoreleasedReturnValue();
  if (v82)
  {
    v83 = (void *)v82;
    -[_SFPBCardSectionValue titleCardSection](self, "titleCardSection");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "titleCardSection");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = objc_msgSend(v84, "isEqual:", v85);

    if (!v86)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue trackListCardSection](self, "trackListCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trackListCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue trackListCardSection](self, "trackListCardSection");
  v87 = objc_claimAutoreleasedReturnValue();
  if (v87)
  {
    v88 = (void *)v87;
    -[_SFPBCardSectionValue trackListCardSection](self, "trackListCardSection");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trackListCardSection");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = objc_msgSend(v89, "isEqual:", v90);

    if (!v91)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue audioPlaybackCardSection](self, "audioPlaybackCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioPlaybackCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue audioPlaybackCardSection](self, "audioPlaybackCardSection");
  v92 = objc_claimAutoreleasedReturnValue();
  if (v92)
  {
    v93 = (void *)v92;
    -[_SFPBCardSectionValue audioPlaybackCardSection](self, "audioPlaybackCardSection");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioPlaybackCardSection");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = objc_msgSend(v94, "isEqual:", v95);

    if (!v96)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue flightCardSection](self, "flightCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flightCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue flightCardSection](self, "flightCardSection");
  v97 = objc_claimAutoreleasedReturnValue();
  if (v97)
  {
    v98 = (void *)v97;
    -[_SFPBCardSectionValue flightCardSection](self, "flightCardSection");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "flightCardSection");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = objc_msgSend(v99, "isEqual:", v100);

    if (!v101)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue activityIndicatorCardSection](self, "activityIndicatorCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activityIndicatorCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue activityIndicatorCardSection](self, "activityIndicatorCardSection");
  v102 = objc_claimAutoreleasedReturnValue();
  if (v102)
  {
    v103 = (void *)v102;
    -[_SFPBCardSectionValue activityIndicatorCardSection](self, "activityIndicatorCardSection");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activityIndicatorCardSection");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = objc_msgSend(v104, "isEqual:", v105);

    if (!v106)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue webCardSection](self, "webCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "webCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue webCardSection](self, "webCardSection");
  v107 = objc_claimAutoreleasedReturnValue();
  if (v107)
  {
    v108 = (void *)v107;
    -[_SFPBCardSectionValue webCardSection](self, "webCardSection");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "webCardSection");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v111 = objc_msgSend(v109, "isEqual:", v110);

    if (!v111)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue messageCardSection](self, "messageCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue messageCardSection](self, "messageCardSection");
  v112 = objc_claimAutoreleasedReturnValue();
  if (v112)
  {
    v113 = (void *)v112;
    -[_SFPBCardSectionValue messageCardSection](self, "messageCardSection");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messageCardSection");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = objc_msgSend(v114, "isEqual:", v115);

    if (!v116)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue detailedRowCardSection](self, "detailedRowCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "detailedRowCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue detailedRowCardSection](self, "detailedRowCardSection");
  v117 = objc_claimAutoreleasedReturnValue();
  if (v117)
  {
    v118 = (void *)v117;
    -[_SFPBCardSectionValue detailedRowCardSection](self, "detailedRowCardSection");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "detailedRowCardSection");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v121 = objc_msgSend(v119, "isEqual:", v120);

    if (!v121)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue imagesCardSection](self, "imagesCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imagesCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue imagesCardSection](self, "imagesCardSection");
  v122 = objc_claimAutoreleasedReturnValue();
  if (v122)
  {
    v123 = (void *)v122;
    -[_SFPBCardSectionValue imagesCardSection](self, "imagesCardSection");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imagesCardSection");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v126 = objc_msgSend(v124, "isEqual:", v125);

    if (!v126)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue suggestionCardSection](self, "suggestionCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestionCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue suggestionCardSection](self, "suggestionCardSection");
  v127 = objc_claimAutoreleasedReturnValue();
  if (v127)
  {
    v128 = (void *)v127;
    -[_SFPBCardSectionValue suggestionCardSection](self, "suggestionCardSection");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "suggestionCardSection");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    v131 = objc_msgSend(v129, "isEqual:", v130);

    if (!v131)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue selectableGridCardSection](self, "selectableGridCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectableGridCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue selectableGridCardSection](self, "selectableGridCardSection");
  v132 = objc_claimAutoreleasedReturnValue();
  if (v132)
  {
    v133 = (void *)v132;
    -[_SFPBCardSectionValue selectableGridCardSection](self, "selectableGridCardSection");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "selectableGridCardSection");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    v136 = objc_msgSend(v134, "isEqual:", v135);

    if (!v136)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue sectionHeaderCardSection](self, "sectionHeaderCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionHeaderCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue sectionHeaderCardSection](self, "sectionHeaderCardSection");
  v137 = objc_claimAutoreleasedReturnValue();
  if (v137)
  {
    v138 = (void *)v137;
    -[_SFPBCardSectionValue sectionHeaderCardSection](self, "sectionHeaderCardSection");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sectionHeaderCardSection");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    v141 = objc_msgSend(v139, "isEqual:", v140);

    if (!v141)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue metaInfoCardSection](self, "metaInfoCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metaInfoCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue metaInfoCardSection](self, "metaInfoCardSection");
  v142 = objc_claimAutoreleasedReturnValue();
  if (v142)
  {
    v143 = (void *)v142;
    -[_SFPBCardSectionValue metaInfoCardSection](self, "metaInfoCardSection");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "metaInfoCardSection");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    v146 = objc_msgSend(v144, "isEqual:", v145);

    if (!v146)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue watchListCardSection](self, "watchListCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "watchListCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue watchListCardSection](self, "watchListCardSection");
  v147 = objc_claimAutoreleasedReturnValue();
  if (v147)
  {
    v148 = (void *)v147;
    -[_SFPBCardSectionValue watchListCardSection](self, "watchListCardSection");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "watchListCardSection");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    v151 = objc_msgSend(v149, "isEqual:", v150);

    if (!v151)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue mapsDetailedRowCardSection](self, "mapsDetailedRowCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mapsDetailedRowCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue mapsDetailedRowCardSection](self, "mapsDetailedRowCardSection");
  v152 = objc_claimAutoreleasedReturnValue();
  if (v152)
  {
    v153 = (void *)v152;
    -[_SFPBCardSectionValue mapsDetailedRowCardSection](self, "mapsDetailedRowCardSection");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mapsDetailedRowCardSection");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    v156 = objc_msgSend(v154, "isEqual:", v155);

    if (!v156)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue buttonCardSection](self, "buttonCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "buttonCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue buttonCardSection](self, "buttonCardSection");
  v157 = objc_claimAutoreleasedReturnValue();
  if (v157)
  {
    v158 = (void *)v157;
    -[_SFPBCardSectionValue buttonCardSection](self, "buttonCardSection");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "buttonCardSection");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    v161 = objc_msgSend(v159, "isEqual:", v160);

    if (!v161)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue horizontalButtonCardSection](self, "horizontalButtonCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "horizontalButtonCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue horizontalButtonCardSection](self, "horizontalButtonCardSection");
  v162 = objc_claimAutoreleasedReturnValue();
  if (v162)
  {
    v163 = (void *)v162;
    -[_SFPBCardSectionValue horizontalButtonCardSection](self, "horizontalButtonCardSection");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "horizontalButtonCardSection");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    v166 = objc_msgSend(v164, "isEqual:", v165);

    if (!v166)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue verticalLayoutCardSection](self, "verticalLayoutCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "verticalLayoutCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue verticalLayoutCardSection](self, "verticalLayoutCardSection");
  v167 = objc_claimAutoreleasedReturnValue();
  if (v167)
  {
    v168 = (void *)v167;
    -[_SFPBCardSectionValue verticalLayoutCardSection](self, "verticalLayoutCardSection");
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "verticalLayoutCardSection");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    v171 = objc_msgSend(v169, "isEqual:", v170);

    if (!v171)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue productCardSection](self, "productCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "productCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue productCardSection](self, "productCardSection");
  v172 = objc_claimAutoreleasedReturnValue();
  if (v172)
  {
    v173 = (void *)v172;
    -[_SFPBCardSectionValue productCardSection](self, "productCardSection");
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "productCardSection");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    v176 = objc_msgSend(v174, "isEqual:", v175);

    if (!v176)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue horizontalScrollCardSection](self, "horizontalScrollCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "horizontalScrollCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue horizontalScrollCardSection](self, "horizontalScrollCardSection");
  v177 = objc_claimAutoreleasedReturnValue();
  if (v177)
  {
    v178 = (void *)v177;
    -[_SFPBCardSectionValue horizontalScrollCardSection](self, "horizontalScrollCardSection");
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "horizontalScrollCardSection");
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    v181 = objc_msgSend(v179, "isEqual:", v180);

    if (!v181)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue mediaRemoteControlCardSection](self, "mediaRemoteControlCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaRemoteControlCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue mediaRemoteControlCardSection](self, "mediaRemoteControlCardSection");
  v182 = objc_claimAutoreleasedReturnValue();
  if (v182)
  {
    v183 = (void *)v182;
    -[_SFPBCardSectionValue mediaRemoteControlCardSection](self, "mediaRemoteControlCardSection");
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaRemoteControlCardSection");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    v186 = objc_msgSend(v184, "isEqual:", v185);

    if (!v186)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue mapPlaceCardSection](self, "mapPlaceCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mapPlaceCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue mapPlaceCardSection](self, "mapPlaceCardSection");
  v187 = objc_claimAutoreleasedReturnValue();
  if (v187)
  {
    v188 = (void *)v187;
    -[_SFPBCardSectionValue mapPlaceCardSection](self, "mapPlaceCardSection");
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mapPlaceCardSection");
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    v191 = objc_msgSend(v189, "isEqual:", v190);

    if (!v191)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue compactRowCardSection](self, "compactRowCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "compactRowCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue compactRowCardSection](self, "compactRowCardSection");
  v192 = objc_claimAutoreleasedReturnValue();
  if (v192)
  {
    v193 = (void *)v192;
    -[_SFPBCardSectionValue compactRowCardSection](self, "compactRowCardSection");
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "compactRowCardSection");
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    v196 = objc_msgSend(v194, "isEqual:", v195);

    if (!v196)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue worldMapCardSection](self, "worldMapCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "worldMapCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue worldMapCardSection](self, "worldMapCardSection");
  v197 = objc_claimAutoreleasedReturnValue();
  if (v197)
  {
    v198 = (void *)v197;
    -[_SFPBCardSectionValue worldMapCardSection](self, "worldMapCardSection");
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "worldMapCardSection");
    v200 = (void *)objc_claimAutoreleasedReturnValue();
    v201 = objc_msgSend(v199, "isEqual:", v200);

    if (!v201)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue attributionFooterCardSection](self, "attributionFooterCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributionFooterCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue attributionFooterCardSection](self, "attributionFooterCardSection");
  v202 = objc_claimAutoreleasedReturnValue();
  if (v202)
  {
    v203 = (void *)v202;
    -[_SFPBCardSectionValue attributionFooterCardSection](self, "attributionFooterCardSection");
    v204 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attributionFooterCardSection");
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    v206 = objc_msgSend(v204, "isEqual:", v205);

    if (!v206)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue gridCardSection](self, "gridCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gridCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue gridCardSection](self, "gridCardSection");
  v207 = objc_claimAutoreleasedReturnValue();
  if (v207)
  {
    v208 = (void *)v207;
    -[_SFPBCardSectionValue gridCardSection](self, "gridCardSection");
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "gridCardSection");
    v210 = (void *)objc_claimAutoreleasedReturnValue();
    v211 = objc_msgSend(v209, "isEqual:", v210);

    if (!v211)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue personHeaderCardSection](self, "personHeaderCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "personHeaderCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue personHeaderCardSection](self, "personHeaderCardSection");
  v212 = objc_claimAutoreleasedReturnValue();
  if (v212)
  {
    v213 = (void *)v212;
    -[_SFPBCardSectionValue personHeaderCardSection](self, "personHeaderCardSection");
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "personHeaderCardSection");
    v215 = (void *)objc_claimAutoreleasedReturnValue();
    v216 = objc_msgSend(v214, "isEqual:", v215);

    if (!v216)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue colorBarCardSection](self, "colorBarCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorBarCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue colorBarCardSection](self, "colorBarCardSection");
  v217 = objc_claimAutoreleasedReturnValue();
  if (v217)
  {
    v218 = (void *)v217;
    -[_SFPBCardSectionValue colorBarCardSection](self, "colorBarCardSection");
    v219 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "colorBarCardSection");
    v220 = (void *)objc_claimAutoreleasedReturnValue();
    v221 = objc_msgSend(v219, "isEqual:", v220);

    if (!v221)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue splitCardSection](self, "splitCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "splitCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue splitCardSection](self, "splitCardSection");
  v222 = objc_claimAutoreleasedReturnValue();
  if (v222)
  {
    v223 = (void *)v222;
    -[_SFPBCardSectionValue splitCardSection](self, "splitCardSection");
    v224 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "splitCardSection");
    v225 = (void *)objc_claimAutoreleasedReturnValue();
    v226 = objc_msgSend(v224, "isEqual:", v225);

    if (!v226)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue linkPresentationCardSection](self, "linkPresentationCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "linkPresentationCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue linkPresentationCardSection](self, "linkPresentationCardSection");
  v227 = objc_claimAutoreleasedReturnValue();
  if (v227)
  {
    v228 = (void *)v227;
    -[_SFPBCardSectionValue linkPresentationCardSection](self, "linkPresentationCardSection");
    v229 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "linkPresentationCardSection");
    v230 = (void *)objc_claimAutoreleasedReturnValue();
    v231 = objc_msgSend(v229, "isEqual:", v230);

    if (!v231)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue findMyCardSection](self, "findMyCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "findMyCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue findMyCardSection](self, "findMyCardSection");
  v232 = objc_claimAutoreleasedReturnValue();
  if (v232)
  {
    v233 = (void *)v232;
    -[_SFPBCardSectionValue findMyCardSection](self, "findMyCardSection");
    v234 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "findMyCardSection");
    v235 = (void *)objc_claimAutoreleasedReturnValue();
    v236 = objc_msgSend(v234, "isEqual:", v235);

    if (!v236)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue heroCardSection](self, "heroCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "heroCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue heroCardSection](self, "heroCardSection");
  v237 = objc_claimAutoreleasedReturnValue();
  if (v237)
  {
    v238 = (void *)v237;
    -[_SFPBCardSectionValue heroCardSection](self, "heroCardSection");
    v239 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "heroCardSection");
    v240 = (void *)objc_claimAutoreleasedReturnValue();
    v241 = objc_msgSend(v239, "isEqual:", v240);

    if (!v241)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue newsCardSection](self, "newsCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "newsCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue newsCardSection](self, "newsCardSection");
  v242 = objc_claimAutoreleasedReturnValue();
  if (v242)
  {
    v243 = (void *)v242;
    -[_SFPBCardSectionValue newsCardSection](self, "newsCardSection");
    v244 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "newsCardSection");
    v245 = (void *)objc_claimAutoreleasedReturnValue();
    v246 = objc_msgSend(v244, "isEqual:", v245);

    if (!v246)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue miniCardSection](self, "miniCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "miniCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue miniCardSection](self, "miniCardSection");
  v247 = objc_claimAutoreleasedReturnValue();
  if (v247)
  {
    v248 = (void *)v247;
    -[_SFPBCardSectionValue miniCardSection](self, "miniCardSection");
    v249 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "miniCardSection");
    v250 = (void *)objc_claimAutoreleasedReturnValue();
    v251 = objc_msgSend(v249, "isEqual:", v250);

    if (!v251)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue infoCardSection](self, "infoCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "infoCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue infoCardSection](self, "infoCardSection");
  v252 = objc_claimAutoreleasedReturnValue();
  if (v252)
  {
    v253 = (void *)v252;
    -[_SFPBCardSectionValue infoCardSection](self, "infoCardSection");
    v254 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "infoCardSection");
    v255 = (void *)objc_claimAutoreleasedReturnValue();
    v256 = objc_msgSend(v254, "isEqual:", v255);

    if (!v256)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue collectionCardSection](self, "collectionCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue collectionCardSection](self, "collectionCardSection");
  v257 = objc_claimAutoreleasedReturnValue();
  if (v257)
  {
    v258 = (void *)v257;
    -[_SFPBCardSectionValue collectionCardSection](self, "collectionCardSection");
    v259 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "collectionCardSection");
    v260 = (void *)objc_claimAutoreleasedReturnValue();
    v261 = objc_msgSend(v259, "isEqual:", v260);

    if (!v261)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue combinedCardSection](self, "combinedCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "combinedCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue combinedCardSection](self, "combinedCardSection");
  v262 = objc_claimAutoreleasedReturnValue();
  if (v262)
  {
    v263 = (void *)v262;
    -[_SFPBCardSectionValue combinedCardSection](self, "combinedCardSection");
    v264 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "combinedCardSection");
    v265 = (void *)objc_claimAutoreleasedReturnValue();
    v266 = objc_msgSend(v264, "isEqual:", v265);

    if (!v266)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue responseWrapperCardSection](self, "responseWrapperCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responseWrapperCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue responseWrapperCardSection](self, "responseWrapperCardSection");
  v267 = objc_claimAutoreleasedReturnValue();
  if (v267)
  {
    v268 = (void *)v267;
    -[_SFPBCardSectionValue responseWrapperCardSection](self, "responseWrapperCardSection");
    v269 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "responseWrapperCardSection");
    v270 = (void *)objc_claimAutoreleasedReturnValue();
    v271 = objc_msgSend(v269, "isEqual:", v270);

    if (!v271)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue listenToCardSection](self, "listenToCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "listenToCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue listenToCardSection](self, "listenToCardSection");
  v272 = objc_claimAutoreleasedReturnValue();
  if (v272)
  {
    v273 = (void *)v272;
    -[_SFPBCardSectionValue listenToCardSection](self, "listenToCardSection");
    v274 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "listenToCardSection");
    v275 = (void *)objc_claimAutoreleasedReturnValue();
    v276 = objc_msgSend(v274, "isEqual:", v275);

    if (!v276)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue watchNowCardSection](self, "watchNowCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "watchNowCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue watchNowCardSection](self, "watchNowCardSection");
  v277 = objc_claimAutoreleasedReturnValue();
  if (v277)
  {
    v278 = (void *)v277;
    -[_SFPBCardSectionValue watchNowCardSection](self, "watchNowCardSection");
    v279 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "watchNowCardSection");
    v280 = (void *)objc_claimAutoreleasedReturnValue();
    v281 = objc_msgSend(v279, "isEqual:", v280);

    if (!v281)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue strokeAnimationCardSection](self, "strokeAnimationCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "strokeAnimationCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue strokeAnimationCardSection](self, "strokeAnimationCardSection");
  v282 = objc_claimAutoreleasedReturnValue();
  if (v282)
  {
    v283 = (void *)v282;
    -[_SFPBCardSectionValue strokeAnimationCardSection](self, "strokeAnimationCardSection");
    v284 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "strokeAnimationCardSection");
    v285 = (void *)objc_claimAutoreleasedReturnValue();
    v286 = objc_msgSend(v284, "isEqual:", v285);

    if (!v286)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue buttonListCardSection](self, "buttonListCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "buttonListCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue buttonListCardSection](self, "buttonListCardSection");
  v287 = objc_claimAutoreleasedReturnValue();
  if (v287)
  {
    v288 = (void *)v287;
    -[_SFPBCardSectionValue buttonListCardSection](self, "buttonListCardSection");
    v289 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "buttonListCardSection");
    v290 = (void *)objc_claimAutoreleasedReturnValue();
    v291 = objc_msgSend(v289, "isEqual:", v290);

    if (!v291)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue commandRowCardSection](self, "commandRowCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commandRowCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue commandRowCardSection](self, "commandRowCardSection");
  v292 = objc_claimAutoreleasedReturnValue();
  if (v292)
  {
    v293 = (void *)v292;
    -[_SFPBCardSectionValue commandRowCardSection](self, "commandRowCardSection");
    v294 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "commandRowCardSection");
    v295 = (void *)objc_claimAutoreleasedReturnValue();
    v296 = objc_msgSend(v294, "isEqual:", v295);

    if (!v296)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue leadingTrailingCardSection](self, "leadingTrailingCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingTrailingCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue leadingTrailingCardSection](self, "leadingTrailingCardSection");
  v297 = objc_claimAutoreleasedReturnValue();
  if (v297)
  {
    v298 = (void *)v297;
    -[_SFPBCardSectionValue leadingTrailingCardSection](self, "leadingTrailingCardSection");
    v299 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "leadingTrailingCardSection");
    v300 = (void *)objc_claimAutoreleasedReturnValue();
    v301 = objc_msgSend(v299, "isEqual:", v300);

    if (!v301)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue heroTitleCardSection](self, "heroTitleCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "heroTitleCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue heroTitleCardSection](self, "heroTitleCardSection");
  v302 = objc_claimAutoreleasedReturnValue();
  if (v302)
  {
    v303 = (void *)v302;
    -[_SFPBCardSectionValue heroTitleCardSection](self, "heroTitleCardSection");
    v304 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "heroTitleCardSection");
    v305 = (void *)objc_claimAutoreleasedReturnValue();
    v306 = objc_msgSend(v304, "isEqual:", v305);

    if (!v306)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue archiveViewCardSection](self, "archiveViewCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "archiveViewCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue archiveViewCardSection](self, "archiveViewCardSection");
  v307 = objc_claimAutoreleasedReturnValue();
  if (v307)
  {
    v308 = (void *)v307;
    -[_SFPBCardSectionValue archiveViewCardSection](self, "archiveViewCardSection");
    v309 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "archiveViewCardSection");
    v310 = (void *)objc_claimAutoreleasedReturnValue();
    v311 = objc_msgSend(v309, "isEqual:", v310);

    if (!v311)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue appIconCardSection](self, "appIconCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appIconCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue appIconCardSection](self, "appIconCardSection");
  v312 = objc_claimAutoreleasedReturnValue();
  if (v312)
  {
    v313 = (void *)v312;
    -[_SFPBCardSectionValue appIconCardSection](self, "appIconCardSection");
    v314 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appIconCardSection");
    v315 = (void *)objc_claimAutoreleasedReturnValue();
    v316 = objc_msgSend(v314, "isEqual:", v315);

    if (!v316)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue largeTitleDetailedRowCardSection](self, "largeTitleDetailedRowCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "largeTitleDetailedRowCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue largeTitleDetailedRowCardSection](self, "largeTitleDetailedRowCardSection");
  v317 = objc_claimAutoreleasedReturnValue();
  if (v317)
  {
    v318 = (void *)v317;
    -[_SFPBCardSectionValue largeTitleDetailedRowCardSection](self, "largeTitleDetailedRowCardSection");
    v319 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "largeTitleDetailedRowCardSection");
    v320 = (void *)objc_claimAutoreleasedReturnValue();
    v321 = objc_msgSend(v319, "isEqual:", v320);

    if (!v321)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue safariTableOfContentsCardSection](self, "safariTableOfContentsCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safariTableOfContentsCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue safariTableOfContentsCardSection](self, "safariTableOfContentsCardSection");
  v322 = objc_claimAutoreleasedReturnValue();
  if (v322)
  {
    v323 = (void *)v322;
    -[_SFPBCardSectionValue safariTableOfContentsCardSection](self, "safariTableOfContentsCardSection");
    v324 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safariTableOfContentsCardSection");
    v325 = (void *)objc_claimAutoreleasedReturnValue();
    v326 = objc_msgSend(v324, "isEqual:", v325);

    if (!v326)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue rfSummaryItemShortNumberCardSection](self, "rfSummaryItemShortNumberCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rfSummaryItemShortNumberCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue rfSummaryItemShortNumberCardSection](self, "rfSummaryItemShortNumberCardSection");
  v327 = objc_claimAutoreleasedReturnValue();
  if (v327)
  {
    v328 = (void *)v327;
    -[_SFPBCardSectionValue rfSummaryItemShortNumberCardSection](self, "rfSummaryItemShortNumberCardSection");
    v329 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rfSummaryItemShortNumberCardSection");
    v330 = (void *)objc_claimAutoreleasedReturnValue();
    v331 = objc_msgSend(v329, "isEqual:", v330);

    if (!v331)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue rfSummaryItemTextCardSection](self, "rfSummaryItemTextCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rfSummaryItemTextCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue rfSummaryItemTextCardSection](self, "rfSummaryItemTextCardSection");
  v332 = objc_claimAutoreleasedReturnValue();
  if (v332)
  {
    v333 = (void *)v332;
    -[_SFPBCardSectionValue rfSummaryItemTextCardSection](self, "rfSummaryItemTextCardSection");
    v334 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rfSummaryItemTextCardSection");
    v335 = (void *)objc_claimAutoreleasedReturnValue();
    v336 = objc_msgSend(v334, "isEqual:", v335);

    if (!v336)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue rfSummaryItemStandardCardSection](self, "rfSummaryItemStandardCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rfSummaryItemStandardCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue rfSummaryItemStandardCardSection](self, "rfSummaryItemStandardCardSection");
  v337 = objc_claimAutoreleasedReturnValue();
  if (v337)
  {
    v338 = (void *)v337;
    -[_SFPBCardSectionValue rfSummaryItemStandardCardSection](self, "rfSummaryItemStandardCardSection");
    v339 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rfSummaryItemStandardCardSection");
    v340 = (void *)objc_claimAutoreleasedReturnValue();
    v341 = objc_msgSend(v339, "isEqual:", v340);

    if (!v341)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue rfFactItemShortNumberCardSection](self, "rfFactItemShortNumberCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rfFactItemShortNumberCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue rfFactItemShortNumberCardSection](self, "rfFactItemShortNumberCardSection");
  v342 = objc_claimAutoreleasedReturnValue();
  if (v342)
  {
    v343 = (void *)v342;
    -[_SFPBCardSectionValue rfFactItemShortNumberCardSection](self, "rfFactItemShortNumberCardSection");
    v344 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rfFactItemShortNumberCardSection");
    v345 = (void *)objc_claimAutoreleasedReturnValue();
    v346 = objc_msgSend(v344, "isEqual:", v345);

    if (!v346)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue rfFactItemStandardCardSection](self, "rfFactItemStandardCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rfFactItemStandardCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue rfFactItemStandardCardSection](self, "rfFactItemStandardCardSection");
  v347 = objc_claimAutoreleasedReturnValue();
  if (v347)
  {
    v348 = (void *)v347;
    -[_SFPBCardSectionValue rfFactItemStandardCardSection](self, "rfFactItemStandardCardSection");
    v349 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rfFactItemStandardCardSection");
    v350 = (void *)objc_claimAutoreleasedReturnValue();
    v351 = objc_msgSend(v349, "isEqual:", v350);

    if (!v351)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue rfLongItemStandardCardSection](self, "rfLongItemStandardCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rfLongItemStandardCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue rfLongItemStandardCardSection](self, "rfLongItemStandardCardSection");
  v352 = objc_claimAutoreleasedReturnValue();
  if (v352)
  {
    v353 = (void *)v352;
    -[_SFPBCardSectionValue rfLongItemStandardCardSection](self, "rfLongItemStandardCardSection");
    v354 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rfLongItemStandardCardSection");
    v355 = (void *)objc_claimAutoreleasedReturnValue();
    v356 = objc_msgSend(v354, "isEqual:", v355);

    if (!v356)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue rfPrimaryHeaderRichCardSection](self, "rfPrimaryHeaderRichCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rfPrimaryHeaderRichCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue rfPrimaryHeaderRichCardSection](self, "rfPrimaryHeaderRichCardSection");
  v357 = objc_claimAutoreleasedReturnValue();
  if (v357)
  {
    v358 = (void *)v357;
    -[_SFPBCardSectionValue rfPrimaryHeaderRichCardSection](self, "rfPrimaryHeaderRichCardSection");
    v359 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rfPrimaryHeaderRichCardSection");
    v360 = (void *)objc_claimAutoreleasedReturnValue();
    v361 = objc_msgSend(v359, "isEqual:", v360);

    if (!v361)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue rfPrimaryHeaderStandardCardSection](self, "rfPrimaryHeaderStandardCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rfPrimaryHeaderStandardCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue rfPrimaryHeaderStandardCardSection](self, "rfPrimaryHeaderStandardCardSection");
  v362 = objc_claimAutoreleasedReturnValue();
  if (v362)
  {
    v363 = (void *)v362;
    -[_SFPBCardSectionValue rfPrimaryHeaderStandardCardSection](self, "rfPrimaryHeaderStandardCardSection");
    v364 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rfPrimaryHeaderStandardCardSection");
    v365 = (void *)objc_claimAutoreleasedReturnValue();
    v366 = objc_msgSend(v364, "isEqual:", v365);

    if (!v366)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue rfReferenceFootnoteCardSection](self, "rfReferenceFootnoteCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rfReferenceFootnoteCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue rfReferenceFootnoteCardSection](self, "rfReferenceFootnoteCardSection");
  v367 = objc_claimAutoreleasedReturnValue();
  if (v367)
  {
    v368 = (void *)v367;
    -[_SFPBCardSectionValue rfReferenceFootnoteCardSection](self, "rfReferenceFootnoteCardSection");
    v369 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rfReferenceFootnoteCardSection");
    v370 = (void *)objc_claimAutoreleasedReturnValue();
    v371 = objc_msgSend(v369, "isEqual:", v370);

    if (!v371)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue rfReferenceRichCardSection](self, "rfReferenceRichCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rfReferenceRichCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue rfReferenceRichCardSection](self, "rfReferenceRichCardSection");
  v372 = objc_claimAutoreleasedReturnValue();
  if (v372)
  {
    v373 = (void *)v372;
    -[_SFPBCardSectionValue rfReferenceRichCardSection](self, "rfReferenceRichCardSection");
    v374 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rfReferenceRichCardSection");
    v375 = (void *)objc_claimAutoreleasedReturnValue();
    v376 = objc_msgSend(v374, "isEqual:", v375);

    if (!v376)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue rfSimpleItemRichCardSection](self, "rfSimpleItemRichCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rfSimpleItemRichCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue rfSimpleItemRichCardSection](self, "rfSimpleItemRichCardSection");
  v377 = objc_claimAutoreleasedReturnValue();
  if (v377)
  {
    v378 = (void *)v377;
    -[_SFPBCardSectionValue rfSimpleItemRichCardSection](self, "rfSimpleItemRichCardSection");
    v379 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rfSimpleItemRichCardSection");
    v380 = (void *)objc_claimAutoreleasedReturnValue();
    v381 = objc_msgSend(v379, "isEqual:", v380);

    if (!v381)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue rfSimpleItemStandardCardSection](self, "rfSimpleItemStandardCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rfSimpleItemStandardCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue rfSimpleItemStandardCardSection](self, "rfSimpleItemStandardCardSection");
  v382 = objc_claimAutoreleasedReturnValue();
  if (v382)
  {
    v383 = (void *)v382;
    -[_SFPBCardSectionValue rfSimpleItemStandardCardSection](self, "rfSimpleItemStandardCardSection");
    v384 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rfSimpleItemStandardCardSection");
    v385 = (void *)objc_claimAutoreleasedReturnValue();
    v386 = objc_msgSend(v384, "isEqual:", v385);

    if (!v386)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue rfSummaryItemAlignedTextCardSection](self, "rfSummaryItemAlignedTextCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rfSummaryItemAlignedTextCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue rfSummaryItemAlignedTextCardSection](self, "rfSummaryItemAlignedTextCardSection");
  v387 = objc_claimAutoreleasedReturnValue();
  if (v387)
  {
    v388 = (void *)v387;
    -[_SFPBCardSectionValue rfSummaryItemAlignedTextCardSection](self, "rfSummaryItemAlignedTextCardSection");
    v389 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rfSummaryItemAlignedTextCardSection");
    v390 = (void *)objc_claimAutoreleasedReturnValue();
    v391 = objc_msgSend(v389, "isEqual:", v390);

    if (!v391)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue rfExpandableStandardCardSection](self, "rfExpandableStandardCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rfExpandableStandardCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue rfExpandableStandardCardSection](self, "rfExpandableStandardCardSection");
  v392 = objc_claimAutoreleasedReturnValue();
  if (v392)
  {
    v393 = (void *)v392;
    -[_SFPBCardSectionValue rfExpandableStandardCardSection](self, "rfExpandableStandardCardSection");
    v394 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rfExpandableStandardCardSection");
    v395 = (void *)objc_claimAutoreleasedReturnValue();
    v396 = objc_msgSend(v394, "isEqual:", v395);

    if (!v396)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue rfFactItemButtonCardSection](self, "rfFactItemButtonCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rfFactItemButtonCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue rfFactItemButtonCardSection](self, "rfFactItemButtonCardSection");
  v397 = objc_claimAutoreleasedReturnValue();
  if (v397)
  {
    v398 = (void *)v397;
    -[_SFPBCardSectionValue rfFactItemButtonCardSection](self, "rfFactItemButtonCardSection");
    v399 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rfFactItemButtonCardSection");
    v400 = (void *)objc_claimAutoreleasedReturnValue();
    v401 = objc_msgSend(v399, "isEqual:", v400);

    if (!v401)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue rfFactItemHeroNumberCardSection](self, "rfFactItemHeroNumberCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rfFactItemHeroNumberCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue rfFactItemHeroNumberCardSection](self, "rfFactItemHeroNumberCardSection");
  v402 = objc_claimAutoreleasedReturnValue();
  if (v402)
  {
    v403 = (void *)v402;
    -[_SFPBCardSectionValue rfFactItemHeroNumberCardSection](self, "rfFactItemHeroNumberCardSection");
    v404 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rfFactItemHeroNumberCardSection");
    v405 = (void *)objc_claimAutoreleasedReturnValue();
    v406 = objc_msgSend(v404, "isEqual:", v405);

    if (!v406)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue rfPrimaryHeaderMarqueeCardSection](self, "rfPrimaryHeaderMarqueeCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rfPrimaryHeaderMarqueeCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue rfPrimaryHeaderMarqueeCardSection](self, "rfPrimaryHeaderMarqueeCardSection");
  v407 = objc_claimAutoreleasedReturnValue();
  if (v407)
  {
    v408 = (void *)v407;
    -[_SFPBCardSectionValue rfPrimaryHeaderMarqueeCardSection](self, "rfPrimaryHeaderMarqueeCardSection");
    v409 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rfPrimaryHeaderMarqueeCardSection");
    v410 = (void *)objc_claimAutoreleasedReturnValue();
    v411 = objc_msgSend(v409, "isEqual:", v410);

    if (!v411)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue rfSummaryItemDetailedTextCardSection](self, "rfSummaryItemDetailedTextCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rfSummaryItemDetailedTextCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue rfSummaryItemDetailedTextCardSection](self, "rfSummaryItemDetailedTextCardSection");
  v412 = objc_claimAutoreleasedReturnValue();
  if (v412)
  {
    v413 = (void *)v412;
    -[_SFPBCardSectionValue rfSummaryItemDetailedTextCardSection](self, "rfSummaryItemDetailedTextCardSection");
    v414 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rfSummaryItemDetailedTextCardSection");
    v415 = (void *)objc_claimAutoreleasedReturnValue();
    v416 = objc_msgSend(v414, "isEqual:", v415);

    if (!v416)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue rfSimpleItemPlayerCardSection](self, "rfSimpleItemPlayerCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rfSimpleItemPlayerCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue rfSimpleItemPlayerCardSection](self, "rfSimpleItemPlayerCardSection");
  v417 = objc_claimAutoreleasedReturnValue();
  if (v417)
  {
    v418 = (void *)v417;
    -[_SFPBCardSectionValue rfSimpleItemPlayerCardSection](self, "rfSimpleItemPlayerCardSection");
    v419 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rfSimpleItemPlayerCardSection");
    v420 = (void *)objc_claimAutoreleasedReturnValue();
    v421 = objc_msgSend(v419, "isEqual:", v420);

    if (!v421)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue rfSummaryItemPairCardSection](self, "rfSummaryItemPairCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rfSummaryItemPairCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue rfSummaryItemPairCardSection](self, "rfSummaryItemPairCardSection");
  v422 = objc_claimAutoreleasedReturnValue();
  if (v422)
  {
    v423 = (void *)v422;
    -[_SFPBCardSectionValue rfSummaryItemPairCardSection](self, "rfSummaryItemPairCardSection");
    v424 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rfSummaryItemPairCardSection");
    v425 = (void *)objc_claimAutoreleasedReturnValue();
    v426 = objc_msgSend(v424, "isEqual:", v425);

    if (!v426)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue rfSummaryItemPairNumberCardSection](self, "rfSummaryItemPairNumberCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rfSummaryItemPairNumberCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue rfSummaryItemPairNumberCardSection](self, "rfSummaryItemPairNumberCardSection");
  v427 = objc_claimAutoreleasedReturnValue();
  if (v427)
  {
    v428 = (void *)v427;
    -[_SFPBCardSectionValue rfSummaryItemPairNumberCardSection](self, "rfSummaryItemPairNumberCardSection");
    v429 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rfSummaryItemPairNumberCardSection");
    v430 = (void *)objc_claimAutoreleasedReturnValue();
    v431 = objc_msgSend(v429, "isEqual:", v430);

    if (!v431)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue rfFactItemShortHeroNumberCardSection](self, "rfFactItemShortHeroNumberCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rfFactItemShortHeroNumberCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue rfFactItemShortHeroNumberCardSection](self, "rfFactItemShortHeroNumberCardSection");
  v432 = objc_claimAutoreleasedReturnValue();
  if (v432)
  {
    v433 = (void *)v432;
    -[_SFPBCardSectionValue rfFactItemShortHeroNumberCardSection](self, "rfFactItemShortHeroNumberCardSection");
    v434 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rfFactItemShortHeroNumberCardSection");
    v435 = (void *)objc_claimAutoreleasedReturnValue();
    v436 = objc_msgSend(v434, "isEqual:", v435);

    if (!v436)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue rfFactItemDetailedNumberCardSection](self, "rfFactItemDetailedNumberCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rfFactItemDetailedNumberCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue rfFactItemDetailedNumberCardSection](self, "rfFactItemDetailedNumberCardSection");
  v437 = objc_claimAutoreleasedReturnValue();
  if (v437)
  {
    v438 = (void *)v437;
    -[_SFPBCardSectionValue rfFactItemDetailedNumberCardSection](self, "rfFactItemDetailedNumberCardSection");
    v439 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rfFactItemDetailedNumberCardSection");
    v440 = (void *)objc_claimAutoreleasedReturnValue();
    v441 = objc_msgSend(v439, "isEqual:", v440);

    if (!v441)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue rfFactItemHeroButtonCardSection](self, "rfFactItemHeroButtonCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rfFactItemHeroButtonCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue rfFactItemHeroButtonCardSection](self, "rfFactItemHeroButtonCardSection");
  v442 = objc_claimAutoreleasedReturnValue();
  if (v442)
  {
    v443 = (void *)v442;
    -[_SFPBCardSectionValue rfFactItemHeroButtonCardSection](self, "rfFactItemHeroButtonCardSection");
    v444 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rfFactItemHeroButtonCardSection");
    v445 = (void *)objc_claimAutoreleasedReturnValue();
    v446 = objc_msgSend(v444, "isEqual:", v445);

    if (!v446)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue rfFactItemImageRightCardSection](self, "rfFactItemImageRightCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rfFactItemImageRightCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue rfFactItemImageRightCardSection](self, "rfFactItemImageRightCardSection");
  v447 = objc_claimAutoreleasedReturnValue();
  if (v447)
  {
    v448 = (void *)v447;
    -[_SFPBCardSectionValue rfFactItemImageRightCardSection](self, "rfFactItemImageRightCardSection");
    v449 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rfFactItemImageRightCardSection");
    v450 = (void *)objc_claimAutoreleasedReturnValue();
    v451 = objc_msgSend(v449, "isEqual:", v450);

    if (!v451)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue rfSummaryItemSwitchV2CardSection](self, "rfSummaryItemSwitchV2CardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rfSummaryItemSwitchV2CardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue rfSummaryItemSwitchV2CardSection](self, "rfSummaryItemSwitchV2CardSection");
  v452 = objc_claimAutoreleasedReturnValue();
  if (v452)
  {
    v453 = (void *)v452;
    -[_SFPBCardSectionValue rfSummaryItemSwitchV2CardSection](self, "rfSummaryItemSwitchV2CardSection");
    v454 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rfSummaryItemSwitchV2CardSection");
    v455 = (void *)objc_claimAutoreleasedReturnValue();
    v456 = objc_msgSend(v454, "isEqual:", v455);

    if (!v456)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue rfTableHeaderCardSection](self, "rfTableHeaderCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rfTableHeaderCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue rfTableHeaderCardSection](self, "rfTableHeaderCardSection");
  v457 = objc_claimAutoreleasedReturnValue();
  if (v457)
  {
    v458 = (void *)v457;
    -[_SFPBCardSectionValue rfTableHeaderCardSection](self, "rfTableHeaderCardSection");
    v459 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rfTableHeaderCardSection");
    v460 = (void *)objc_claimAutoreleasedReturnValue();
    v461 = objc_msgSend(v459, "isEqual:", v460);

    if (!v461)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue rfTableRowCardSection](self, "rfTableRowCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rfTableRowCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue rfTableRowCardSection](self, "rfTableRowCardSection");
  v462 = objc_claimAutoreleasedReturnValue();
  if (v462)
  {
    v463 = (void *)v462;
    -[_SFPBCardSectionValue rfTableRowCardSection](self, "rfTableRowCardSection");
    v464 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rfTableRowCardSection");
    v465 = (void *)objc_claimAutoreleasedReturnValue();
    v466 = objc_msgSend(v464, "isEqual:", v465);

    if (!v466)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue rfSimpleItemVisualElementCardSection](self, "rfSimpleItemVisualElementCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rfSimpleItemVisualElementCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue rfSimpleItemVisualElementCardSection](self, "rfSimpleItemVisualElementCardSection");
  v467 = objc_claimAutoreleasedReturnValue();
  if (v467)
  {
    v468 = (void *)v467;
    -[_SFPBCardSectionValue rfSimpleItemVisualElementCardSection](self, "rfSimpleItemVisualElementCardSection");
    v469 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rfSimpleItemVisualElementCardSection");
    v470 = (void *)objc_claimAutoreleasedReturnValue();
    v471 = objc_msgSend(v469, "isEqual:", v470);

    if (!v471)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue rfSummaryItemPlayerCardSection](self, "rfSummaryItemPlayerCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rfSummaryItemPlayerCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue rfSummaryItemPlayerCardSection](self, "rfSummaryItemPlayerCardSection");
  v472 = objc_claimAutoreleasedReturnValue();
  if (v472)
  {
    v473 = (void *)v472;
    -[_SFPBCardSectionValue rfSummaryItemPlayerCardSection](self, "rfSummaryItemPlayerCardSection");
    v474 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rfSummaryItemPlayerCardSection");
    v475 = (void *)objc_claimAutoreleasedReturnValue();
    v476 = objc_msgSend(v474, "isEqual:", v475);

    if (!v476)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue rfSummaryItemImageRightCardSection](self, "rfSummaryItemImageRightCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rfSummaryItemImageRightCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue rfSummaryItemImageRightCardSection](self, "rfSummaryItemImageRightCardSection");
  v477 = objc_claimAutoreleasedReturnValue();
  if (v477)
  {
    v478 = (void *)v477;
    -[_SFPBCardSectionValue rfSummaryItemImageRightCardSection](self, "rfSummaryItemImageRightCardSection");
    v479 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rfSummaryItemImageRightCardSection");
    v480 = (void *)objc_claimAutoreleasedReturnValue();
    v481 = objc_msgSend(v479, "isEqual:", v480);

    if (!v481)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue rfSummaryItemButtonCardSection](self, "rfSummaryItemButtonCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rfSummaryItemButtonCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue rfSummaryItemButtonCardSection](self, "rfSummaryItemButtonCardSection");
  v482 = objc_claimAutoreleasedReturnValue();
  if (v482)
  {
    v483 = (void *)v482;
    -[_SFPBCardSectionValue rfSummaryItemButtonCardSection](self, "rfSummaryItemButtonCardSection");
    v484 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rfSummaryItemButtonCardSection");
    v485 = (void *)objc_claimAutoreleasedReturnValue();
    v486 = objc_msgSend(v484, "isEqual:", v485);

    if (!v486)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue rfSimpleItemReverseRichCardSection](self, "rfSimpleItemReverseRichCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rfSimpleItemReverseRichCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue rfSimpleItemReverseRichCardSection](self, "rfSimpleItemReverseRichCardSection");
  v487 = objc_claimAutoreleasedReturnValue();
  if (v487)
  {
    v488 = (void *)v487;
    -[_SFPBCardSectionValue rfSimpleItemReverseRichCardSection](self, "rfSimpleItemReverseRichCardSection");
    v489 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rfSimpleItemReverseRichCardSection");
    v490 = (void *)objc_claimAutoreleasedReturnValue();
    v491 = objc_msgSend(v489, "isEqual:", v490);

    if (!v491)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue rfSimpleItemRichSearchResultCardSection](self, "rfSimpleItemRichSearchResultCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rfSimpleItemRichSearchResultCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue rfSimpleItemRichSearchResultCardSection](self, "rfSimpleItemRichSearchResultCardSection");
  v492 = objc_claimAutoreleasedReturnValue();
  if (v492)
  {
    v493 = (void *)v492;
    -[_SFPBCardSectionValue rfSimpleItemRichSearchResultCardSection](self, "rfSimpleItemRichSearchResultCardSection");
    v494 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rfSimpleItemRichSearchResultCardSection");
    v495 = (void *)objc_claimAutoreleasedReturnValue();
    v496 = objc_msgSend(v494, "isEqual:", v495);

    if (!v496)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue rfPrimaryHeaderStackedImageCardSection](self, "rfPrimaryHeaderStackedImageCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rfPrimaryHeaderStackedImageCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue rfPrimaryHeaderStackedImageCardSection](self, "rfPrimaryHeaderStackedImageCardSection");
  v497 = objc_claimAutoreleasedReturnValue();
  if (v497)
  {
    v498 = (void *)v497;
    -[_SFPBCardSectionValue rfPrimaryHeaderStackedImageCardSection](self, "rfPrimaryHeaderStackedImageCardSection");
    v499 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rfPrimaryHeaderStackedImageCardSection");
    v500 = (void *)objc_claimAutoreleasedReturnValue();
    v501 = objc_msgSend(v499, "isEqual:", v500);

    if (!v501)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue rfReferenceItemLogoCardSection](self, "rfReferenceItemLogoCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rfReferenceItemLogoCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue rfReferenceItemLogoCardSection](self, "rfReferenceItemLogoCardSection");
  v502 = objc_claimAutoreleasedReturnValue();
  if (v502)
  {
    v503 = (void *)v502;
    -[_SFPBCardSectionValue rfReferenceItemLogoCardSection](self, "rfReferenceItemLogoCardSection");
    v504 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rfReferenceItemLogoCardSection");
    v505 = (void *)objc_claimAutoreleasedReturnValue();
    v506 = objc_msgSend(v504, "isEqual:", v505);

    if (!v506)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue rfReferenceItemButtonCardSection](self, "rfReferenceItemButtonCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rfReferenceItemButtonCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue rfReferenceItemButtonCardSection](self, "rfReferenceItemButtonCardSection");
  v507 = objc_claimAutoreleasedReturnValue();
  if (v507)
  {
    v508 = (void *)v507;
    -[_SFPBCardSectionValue rfReferenceItemButtonCardSection](self, "rfReferenceItemButtonCardSection");
    v509 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rfReferenceItemButtonCardSection");
    v510 = (void *)objc_claimAutoreleasedReturnValue();
    v511 = objc_msgSend(v509, "isEqual:", v510);

    if (!v511)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue rfButtonCardSection](self, "rfButtonCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rfButtonCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue rfButtonCardSection](self, "rfButtonCardSection");
  v512 = objc_claimAutoreleasedReturnValue();
  if (v512)
  {
    v513 = (void *)v512;
    -[_SFPBCardSectionValue rfButtonCardSection](self, "rfButtonCardSection");
    v514 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rfButtonCardSection");
    v515 = (void *)objc_claimAutoreleasedReturnValue();
    v516 = objc_msgSend(v514, "isEqual:", v515);

    if (!v516)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue rfBinaryButtonCardSection](self, "rfBinaryButtonCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rfBinaryButtonCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue rfBinaryButtonCardSection](self, "rfBinaryButtonCardSection");
  v517 = objc_claimAutoreleasedReturnValue();
  if (v517)
  {
    v518 = (void *)v517;
    -[_SFPBCardSectionValue rfBinaryButtonCardSection](self, "rfBinaryButtonCardSection");
    v519 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rfBinaryButtonCardSection");
    v520 = (void *)objc_claimAutoreleasedReturnValue();
    v521 = objc_msgSend(v519, "isEqual:", v520);

    if (!v521)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue rfReferenceCenteredCardSection](self, "rfReferenceCenteredCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rfReferenceCenteredCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue rfReferenceCenteredCardSection](self, "rfReferenceCenteredCardSection");
  v522 = objc_claimAutoreleasedReturnValue();
  if (v522)
  {
    v523 = (void *)v522;
    -[_SFPBCardSectionValue rfReferenceCenteredCardSection](self, "rfReferenceCenteredCardSection");
    v524 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rfReferenceCenteredCardSection");
    v525 = (void *)objc_claimAutoreleasedReturnValue();
    v526 = objc_msgSend(v524, "isEqual:", v525);

    if (!v526)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue rfSecondaryHeaderStandardCardSection](self, "rfSecondaryHeaderStandardCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rfSecondaryHeaderStandardCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue rfSecondaryHeaderStandardCardSection](self, "rfSecondaryHeaderStandardCardSection");
  v527 = objc_claimAutoreleasedReturnValue();
  if (v527)
  {
    v528 = (void *)v527;
    -[_SFPBCardSectionValue rfSecondaryHeaderStandardCardSection](self, "rfSecondaryHeaderStandardCardSection");
    v529 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rfSecondaryHeaderStandardCardSection");
    v530 = (void *)objc_claimAutoreleasedReturnValue();
    v531 = objc_msgSend(v529, "isEqual:", v530);

    if (!v531)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue rfSecondaryHeaderEmphasizedCardSection](self, "rfSecondaryHeaderEmphasizedCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rfSecondaryHeaderEmphasizedCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue rfSecondaryHeaderEmphasizedCardSection](self, "rfSecondaryHeaderEmphasizedCardSection");
  v532 = objc_claimAutoreleasedReturnValue();
  if (v532)
  {
    v533 = (void *)v532;
    -[_SFPBCardSectionValue rfSecondaryHeaderEmphasizedCardSection](self, "rfSecondaryHeaderEmphasizedCardSection");
    v534 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rfSecondaryHeaderEmphasizedCardSection");
    v535 = (void *)objc_claimAutoreleasedReturnValue();
    v536 = objc_msgSend(v534, "isEqual:", v535);

    if (!v536)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue rfMapCardSection](self, "rfMapCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rfMapCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue rfMapCardSection](self, "rfMapCardSection");
  v537 = objc_claimAutoreleasedReturnValue();
  if (v537)
  {
    v538 = (void *)v537;
    -[_SFPBCardSectionValue rfMapCardSection](self, "rfMapCardSection");
    v539 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rfMapCardSection");
    v540 = (void *)objc_claimAutoreleasedReturnValue();
    v541 = objc_msgSend(v539, "isEqual:", v540);

    if (!v541)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue rfReferenceStandardCardSection](self, "rfReferenceStandardCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rfReferenceStandardCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue rfReferenceStandardCardSection](self, "rfReferenceStandardCardSection");
  v542 = objc_claimAutoreleasedReturnValue();
  if (v542)
  {
    v543 = (void *)v542;
    -[_SFPBCardSectionValue rfReferenceStandardCardSection](self, "rfReferenceStandardCardSection");
    v544 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rfReferenceStandardCardSection");
    v545 = (void *)objc_claimAutoreleasedReturnValue();
    v546 = objc_msgSend(v544, "isEqual:", v545);

    if (!v546)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue rfMultiButtonCardSection](self, "rfMultiButtonCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rfMultiButtonCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_551;
  -[_SFPBCardSectionValue rfMultiButtonCardSection](self, "rfMultiButtonCardSection");
  v547 = objc_claimAutoreleasedReturnValue();
  if (v547)
  {
    v548 = (void *)v547;
    -[_SFPBCardSectionValue rfMultiButtonCardSection](self, "rfMultiButtonCardSection");
    v549 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rfMultiButtonCardSection");
    v550 = (void *)objc_claimAutoreleasedReturnValue();
    v551 = objc_msgSend(v549, "isEqual:", v550);

    if (!v551)
      goto LABEL_552;
  }
  else
  {

  }
  -[_SFPBCardSectionValue rfDisambiguationTitleCardSection](self, "rfDisambiguationTitleCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rfDisambiguationTitleCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_551:

    goto LABEL_552;
  }
  -[_SFPBCardSectionValue rfDisambiguationTitleCardSection](self, "rfDisambiguationTitleCardSection");
  v552 = objc_claimAutoreleasedReturnValue();
  if (!v552)
  {

LABEL_555:
    v557 = 1;
    goto LABEL_553;
  }
  v553 = (void *)v552;
  -[_SFPBCardSectionValue rfDisambiguationTitleCardSection](self, "rfDisambiguationTitleCardSection");
  v554 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rfDisambiguationTitleCardSection");
  v555 = (void *)objc_claimAutoreleasedReturnValue();
  v556 = objc_msgSend(v554, "isEqual:", v555);

  if ((v556 & 1) != 0)
    goto LABEL_555;
LABEL_552:
  v557 = 0;
LABEL_553:

  return v557;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  unint64_t v82;
  unint64_t v83;
  unint64_t v84;
  unint64_t v85;
  unint64_t v86;
  unint64_t v87;
  unint64_t v88;
  unint64_t v89;
  unint64_t v90;
  unint64_t v91;
  unint64_t v92;
  unint64_t v93;
  unint64_t v94;
  unint64_t v95;
  unint64_t v96;
  unint64_t v97;
  unint64_t v98;
  unint64_t v99;
  unint64_t v100;
  unint64_t v101;
  unint64_t v102;
  unint64_t v103;
  unint64_t v104;
  unint64_t v105;
  unint64_t v106;
  unint64_t v107;
  unint64_t v108;
  unint64_t v109;
  unint64_t v110;
  unint64_t v111;

  v3 = -[_SFPBAppLinkCardSection hash](self->_appLinkCardSection, "hash");
  v4 = -[_SFPBDescriptionCardSection hash](self->_descriptionCardSection, "hash") ^ v3;
  v5 = -[_SFPBKeyValueDataCardSection hash](self->_keyValueDataCardSection, "hash");
  v6 = v4 ^ v5 ^ -[_SFPBMapCardSection hash](self->_mapCardSection, "hash");
  v7 = -[_SFPBMediaInfoCardSection hash](self->_mediaInfoCardSection, "hash");
  v8 = v7 ^ -[_SFPBMediaPlayerCardSection hash](self->_mediaPlayerCardSection, "hash");
  v9 = v6 ^ v8 ^ -[_SFPBNowPlayingCardSection hash](self->_nowPlayingCardSection, "hash");
  v10 = -[_SFPBRichTitleCardSection hash](self->_richTitleCardSection, "hash");
  v11 = v10 ^ -[_SFPBRowCardSection hash](self->_rowCardSection, "hash");
  v12 = v11 ^ -[_SFPBScoreboardCardSection hash](self->_scoreboardCardSection, "hash");
  v13 = v9 ^ v12 ^ -[_SFPBSocialMediaPostCardSection hash](self->_socialMediaPostCardSection, "hash");
  v14 = -[_SFPBStockChartCardSection hash](self->_stockChartCardSection, "hash");
  v15 = v14 ^ -[_SFPBTableHeaderRowCardSection hash](self->_tableHeaderRowCardSection, "hash");
  v16 = v15 ^ -[_SFPBTableRowCardSection hash](self->_tableRowCardSection, "hash");
  v17 = v16 ^ -[_SFPBTextColumnsCardSection hash](self->_textColumnsCardSection, "hash");
  v18 = v13 ^ v17 ^ -[_SFPBTitleCardSection hash](self->_titleCardSection, "hash");
  v19 = -[_SFPBTrackListCardSection hash](self->_trackListCardSection, "hash");
  v20 = v19 ^ -[_SFPBAudioPlaybackCardSection hash](self->_audioPlaybackCardSection, "hash");
  v21 = v20 ^ -[_SFPBFlightCardSection hash](self->_flightCardSection, "hash");
  v22 = v21 ^ -[_SFPBActivityIndicatorCardSection hash](self->_activityIndicatorCardSection, "hash");
  v23 = v22 ^ -[_SFPBWebCardSection hash](self->_webCardSection, "hash");
  v24 = v18 ^ v23 ^ -[_SFPBMessageCardSection hash](self->_messageCardSection, "hash");
  v25 = -[_SFPBDetailedRowCardSection hash](self->_detailedRowCardSection, "hash");
  v26 = v25 ^ -[_SFPBImagesCardSection hash](self->_imagesCardSection, "hash");
  v27 = v26 ^ -[_SFPBSuggestionCardSection hash](self->_suggestionCardSection, "hash");
  v28 = v27 ^ -[_SFPBSelectableGridCardSection hash](self->_selectableGridCardSection, "hash");
  v29 = v28 ^ -[_SFPBSectionHeaderCardSection hash](self->_sectionHeaderCardSection, "hash");
  v30 = v29 ^ -[_SFPBMetaInfoCardSection hash](self->_metaInfoCardSection, "hash");
  v31 = v24 ^ v30 ^ -[_SFPBWatchListCardSection hash](self->_watchListCardSection, "hash");
  v32 = -[_SFPBMapsDetailedRowCardSection hash](self->_mapsDetailedRowCardSection, "hash");
  v33 = v32 ^ -[_SFPBButtonCardSection hash](self->_buttonCardSection, "hash");
  v34 = v33 ^ -[_SFPBHorizontalButtonCardSection hash](self->_horizontalButtonCardSection, "hash");
  v35 = v34 ^ -[_SFPBVerticalLayoutCardSection hash](self->_verticalLayoutCardSection, "hash");
  v36 = v35 ^ -[_SFPBProductCardSection hash](self->_productCardSection, "hash");
  v37 = v36 ^ -[_SFPBHorizontalScrollCardSection hash](self->_horizontalScrollCardSection, "hash");
  v38 = v37 ^ -[_SFPBMediaRemoteControlCardSection hash](self->_mediaRemoteControlCardSection, "hash");
  v39 = v31 ^ v38 ^ -[_SFPBMapPlaceCardSection hash](self->_mapPlaceCardSection, "hash");
  v40 = -[_SFPBCompactRowCardSection hash](self->_compactRowCardSection, "hash");
  v41 = v40 ^ -[_SFPBWorldMapCardSection hash](self->_worldMapCardSection, "hash");
  v42 = v41 ^ -[_SFPBAttributionFooterCardSection hash](self->_attributionFooterCardSection, "hash");
  v43 = v42 ^ -[_SFPBGridCardSection hash](self->_gridCardSection, "hash");
  v44 = v43 ^ -[_SFPBPersonHeaderCardSection hash](self->_personHeaderCardSection, "hash");
  v45 = v44 ^ -[_SFPBColorBarCardSection hash](self->_colorBarCardSection, "hash");
  v46 = v45 ^ -[_SFPBSplitCardSection hash](self->_splitCardSection, "hash");
  v47 = v46 ^ -[_SFPBLinkPresentationCardSection hash](self->_linkPresentationCardSection, "hash");
  v48 = v39 ^ v47 ^ -[_SFPBFindMyCardSection hash](self->_findMyCardSection, "hash");
  v49 = -[_SFPBHeroCardSection hash](self->_heroCardSection, "hash");
  v50 = v49 ^ -[_SFPBNewsCardSection hash](self->_newsCardSection, "hash");
  v51 = v50 ^ -[_SFPBMiniCardSection hash](self->_miniCardSection, "hash");
  v52 = v51 ^ -[_SFPBInfoCardSection hash](self->_infoCardSection, "hash");
  v53 = v52 ^ -[_SFPBCollectionCardSection hash](self->_collectionCardSection, "hash");
  v54 = v53 ^ -[_SFPBCombinedCardSection hash](self->_combinedCardSection, "hash");
  v55 = v54 ^ -[_SFPBResponseWrapperCardSection hash](self->_responseWrapperCardSection, "hash");
  v56 = v55 ^ -[_SFPBListenToCardSection hash](self->_listenToCardSection, "hash");
  v57 = v56 ^ -[_SFPBWatchNowCardSection hash](self->_watchNowCardSection, "hash");
  v58 = v48 ^ v57 ^ -[_SFPBStrokeAnimationCardSection hash](self->_strokeAnimationCardSection, "hash");
  v59 = -[_SFPBButtonListCardSection hash](self->_buttonListCardSection, "hash");
  v60 = v59 ^ -[_SFPBCommandRowCardSection hash](self->_commandRowCardSection, "hash");
  v61 = v60 ^ -[_SFPBLeadingTrailingCardSection hash](self->_leadingTrailingCardSection, "hash");
  v62 = v61 ^ -[_SFPBHeroTitleCardSection hash](self->_heroTitleCardSection, "hash");
  v63 = v62 ^ -[_SFPBArchiveViewCardSection hash](self->_archiveViewCardSection, "hash");
  v64 = v63 ^ -[_SFPBAppIconCardSection hash](self->_appIconCardSection, "hash");
  v65 = v64 ^ -[_SFPBLargeTitleDetailedRowCardSection hash](self->_largeTitleDetailedRowCardSection, "hash");
  v66 = v65 ^ -[_SFPBSafariTableOfContentsCardSection hash](self->_safariTableOfContentsCardSection, "hash");
  v67 = v66 ^ -[_SFPBRFSummaryItemShortNumberCardSection hash](self->_rfSummaryItemShortNumberCardSection, "hash");
  v68 = v67 ^ -[_SFPBRFSummaryItemTextCardSection hash](self->_rfSummaryItemTextCardSection, "hash");
  v69 = v58 ^ v68 ^ -[_SFPBRFSummaryItemStandardCardSection hash](self->_rfSummaryItemStandardCardSection, "hash");
  v70 = -[_SFPBRFFactItemShortNumberCardSection hash](self->_rfFactItemShortNumberCardSection, "hash");
  v71 = v70 ^ -[_SFPBRFFactItemStandardCardSection hash](self->_rfFactItemStandardCardSection, "hash");
  v72 = v71 ^ -[_SFPBRFLongItemStandardCardSection hash](self->_rfLongItemStandardCardSection, "hash");
  v73 = v72 ^ -[_SFPBRFPrimaryHeaderRichCardSection hash](self->_rfPrimaryHeaderRichCardSection, "hash");
  v74 = v73 ^ -[_SFPBRFPrimaryHeaderStandardCardSection hash](self->_rfPrimaryHeaderStandardCardSection, "hash");
  v75 = v74 ^ -[_SFPBRFReferenceFootnoteCardSection hash](self->_rfReferenceFootnoteCardSection, "hash");
  v76 = v75 ^ -[_SFPBRFReferenceRichCardSection hash](self->_rfReferenceRichCardSection, "hash");
  v77 = v76 ^ -[_SFPBRFSimpleItemRichCardSection hash](self->_rfSimpleItemRichCardSection, "hash");
  v78 = v77 ^ -[_SFPBRFSimpleItemStandardCardSection hash](self->_rfSimpleItemStandardCardSection, "hash");
  v79 = v78 ^ -[_SFPBRFSummaryItemAlignedTextCardSection hash](self->_rfSummaryItemAlignedTextCardSection, "hash");
  v80 = v79 ^ -[_SFPBRFExpandableStandardCardSection hash](self->_rfExpandableStandardCardSection, "hash");
  v81 = v69 ^ v80 ^ -[_SFPBRFFactItemButtonCardSection hash](self->_rfFactItemButtonCardSection, "hash");
  v82 = -[_SFPBRFFactItemHeroNumberCardSection hash](self->_rfFactItemHeroNumberCardSection, "hash");
  v83 = v82 ^ -[_SFPBRFPrimaryHeaderMarqueeCardSection hash](self->_rfPrimaryHeaderMarqueeCardSection, "hash");
  v84 = v83 ^ -[_SFPBRFSummaryItemDetailedTextCardSection hash](self->_rfSummaryItemDetailedTextCardSection, "hash");
  v85 = v84 ^ -[_SFPBRFSimpleItemPlayerCardSection hash](self->_rfSimpleItemPlayerCardSection, "hash");
  v86 = v85 ^ -[_SFPBRFSummaryItemPairCardSection hash](self->_rfSummaryItemPairCardSection, "hash");
  v87 = v86 ^ -[_SFPBRFSummaryItemPairNumberCardSection hash](self->_rfSummaryItemPairNumberCardSection, "hash");
  v88 = v87 ^ -[_SFPBRFFactItemShortHeroNumberCardSection hash](self->_rfFactItemShortHeroNumberCardSection, "hash");
  v89 = v88 ^ -[_SFPBRFFactItemDetailedNumberCardSection hash](self->_rfFactItemDetailedNumberCardSection, "hash");
  v90 = v89 ^ -[_SFPBRFFactItemHeroButtonCardSection hash](self->_rfFactItemHeroButtonCardSection, "hash");
  v91 = v90 ^ -[_SFPBRFFactItemImageRightCardSection hash](self->_rfFactItemImageRightCardSection, "hash");
  v92 = v91 ^ -[_SFPBRFSummaryItemSwitchV2CardSection hash](self->_rfSummaryItemSwitchV2CardSection, "hash");
  v93 = v92 ^ -[_SFPBRFTableHeaderCardSection hash](self->_rfTableHeaderCardSection, "hash");
  v94 = v81 ^ v93 ^ -[_SFPBRFTableRowCardSection hash](self->_rfTableRowCardSection, "hash");
  v95 = -[_SFPBRFSimpleItemVisualElementCardSection hash](self->_rfSimpleItemVisualElementCardSection, "hash");
  v96 = v95 ^ -[_SFPBRFSummaryItemPlayerCardSection hash](self->_rfSummaryItemPlayerCardSection, "hash");
  v97 = v96 ^ -[_SFPBRFSummaryItemImageRightCardSection hash](self->_rfSummaryItemImageRightCardSection, "hash");
  v98 = v97 ^ -[_SFPBRFSummaryItemButtonCardSection hash](self->_rfSummaryItemButtonCardSection, "hash");
  v99 = v98 ^ -[_SFPBRFSimpleItemReverseRichCardSection hash](self->_rfSimpleItemReverseRichCardSection, "hash");
  v100 = v99 ^ -[_SFPBRFSimpleItemRichSearchResultCardSection hash](self->_rfSimpleItemRichSearchResultCardSection, "hash");
  v101 = v100 ^ -[_SFPBRFPrimaryHeaderStackedImageCardSection hash](self->_rfPrimaryHeaderStackedImageCardSection, "hash");
  v102 = v101 ^ -[_SFPBRFReferenceItemLogoCardSection hash](self->_rfReferenceItemLogoCardSection, "hash");
  v103 = v102 ^ -[_SFPBRFReferenceItemButtonCardSection hash](self->_rfReferenceItemButtonCardSection, "hash");
  v104 = v103 ^ -[_SFPBRFButtonCardSection hash](self->_rfButtonCardSection, "hash");
  v105 = v104 ^ -[_SFPBRFBinaryButtonCardSection hash](self->_rfBinaryButtonCardSection, "hash");
  v106 = v105 ^ -[_SFPBRFReferenceCenteredCardSection hash](self->_rfReferenceCenteredCardSection, "hash");
  v107 = v106 ^ -[_SFPBRFSecondaryHeaderStandardCardSection hash](self->_rfSecondaryHeaderStandardCardSection, "hash");
  v108 = v94 ^ v107 ^ -[_SFPBRFSecondaryHeaderEmphasizedCardSection hash](self->_rfSecondaryHeaderEmphasizedCardSection, "hash");
  v109 = -[_SFPBRFMapCardSection hash](self->_rfMapCardSection, "hash");
  v110 = v109 ^ -[_SFPBRFReferenceStandardCardSection hash](self->_rfReferenceStandardCardSection, "hash");
  v111 = v110 ^ -[_SFPBRFMultiButtonCardSection hash](self->_rfMultiButtonCardSection, "hash");
  return v108 ^ v111 ^ -[_SFPBRFDisambiguationTitleCardSection hash](self->_rfDisambiguationTitleCardSection, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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
  id v334;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_activityIndicatorCardSection)
  {
    -[_SFPBCardSectionValue activityIndicatorCardSection](self, "activityIndicatorCardSection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("activityIndicatorCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("activityIndicatorCardSection"));

    }
  }
  if (self->_appIconCardSection)
  {
    -[_SFPBCardSectionValue appIconCardSection](self, "appIconCardSection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("appIconCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("appIconCardSection"));

    }
  }
  if (self->_appLinkCardSection)
  {
    -[_SFPBCardSectionValue appLinkCardSection](self, "appLinkCardSection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("appLinkCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("appLinkCardSection"));

    }
  }
  if (self->_archiveViewCardSection)
  {
    -[_SFPBCardSectionValue archiveViewCardSection](self, "archiveViewCardSection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("archiveViewCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("archiveViewCardSection"));

    }
  }
  if (self->_attributionFooterCardSection)
  {
    -[_SFPBCardSectionValue attributionFooterCardSection](self, "attributionFooterCardSection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("attributionFooterCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("attributionFooterCardSection"));

    }
  }
  if (self->_audioPlaybackCardSection)
  {
    -[_SFPBCardSectionValue audioPlaybackCardSection](self, "audioPlaybackCardSection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("audioPlaybackCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("audioPlaybackCardSection"));

    }
  }
  if (self->_buttonCardSection)
  {
    -[_SFPBCardSectionValue buttonCardSection](self, "buttonCardSection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("buttonCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("buttonCardSection"));

    }
  }
  if (self->_buttonListCardSection)
  {
    -[_SFPBCardSectionValue buttonListCardSection](self, "buttonListCardSection");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("buttonListCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("buttonListCardSection"));

    }
  }
  if (self->_collectionCardSection)
  {
    -[_SFPBCardSectionValue collectionCardSection](self, "collectionCardSection");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("collectionCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("collectionCardSection"));

    }
  }
  if (self->_colorBarCardSection)
  {
    -[_SFPBCardSectionValue colorBarCardSection](self, "colorBarCardSection");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("colorBarCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("colorBarCardSection"));

    }
  }
  if (self->_combinedCardSection)
  {
    -[_SFPBCardSectionValue combinedCardSection](self, "combinedCardSection");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "dictionaryRepresentation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("combinedCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("combinedCardSection"));

    }
  }
  if (self->_commandRowCardSection)
  {
    -[_SFPBCardSectionValue commandRowCardSection](self, "commandRowCardSection");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "dictionaryRepresentation");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("commandRowCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("commandRowCardSection"));

    }
  }
  if (self->_compactRowCardSection)
  {
    -[_SFPBCardSectionValue compactRowCardSection](self, "compactRowCardSection");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "dictionaryRepresentation");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("compactRowCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("compactRowCardSection"));

    }
  }
  if (self->_descriptionCardSection)
  {
    -[_SFPBCardSectionValue descriptionCardSection](self, "descriptionCardSection");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "dictionaryRepresentation");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("descriptionCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("descriptionCardSection"));

    }
  }
  if (self->_detailedRowCardSection)
  {
    -[_SFPBCardSectionValue detailedRowCardSection](self, "detailedRowCardSection");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "dictionaryRepresentation");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("detailedRowCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("detailedRowCardSection"));

    }
  }
  if (self->_findMyCardSection)
  {
    -[_SFPBCardSectionValue findMyCardSection](self, "findMyCardSection");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "dictionaryRepresentation");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (v50)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("findMyCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v51, CFSTR("findMyCardSection"));

    }
  }
  if (self->_flightCardSection)
  {
    -[_SFPBCardSectionValue flightCardSection](self, "flightCardSection");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "dictionaryRepresentation");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (v53)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("flightCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v54, CFSTR("flightCardSection"));

    }
  }
  if (self->_gridCardSection)
  {
    -[_SFPBCardSectionValue gridCardSection](self, "gridCardSection");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "dictionaryRepresentation");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (v56)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v56, CFSTR("gridCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v57, CFSTR("gridCardSection"));

    }
  }
  if (self->_heroCardSection)
  {
    -[_SFPBCardSectionValue heroCardSection](self, "heroCardSection");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "dictionaryRepresentation");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (v59)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v59, CFSTR("heroCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v60, CFSTR("heroCardSection"));

    }
  }
  if (self->_heroTitleCardSection)
  {
    -[_SFPBCardSectionValue heroTitleCardSection](self, "heroTitleCardSection");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "dictionaryRepresentation");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if (v62)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v62, CFSTR("heroTitleCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v63, CFSTR("heroTitleCardSection"));

    }
  }
  if (self->_horizontalButtonCardSection)
  {
    -[_SFPBCardSectionValue horizontalButtonCardSection](self, "horizontalButtonCardSection");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "dictionaryRepresentation");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    if (v65)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v65, CFSTR("horizontalButtonCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v66, CFSTR("horizontalButtonCardSection"));

    }
  }
  if (self->_horizontalScrollCardSection)
  {
    -[_SFPBCardSectionValue horizontalScrollCardSection](self, "horizontalScrollCardSection");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "dictionaryRepresentation");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    if (v68)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v68, CFSTR("horizontalScrollCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v69, CFSTR("horizontalScrollCardSection"));

    }
  }
  if (self->_imagesCardSection)
  {
    -[_SFPBCardSectionValue imagesCardSection](self, "imagesCardSection");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "dictionaryRepresentation");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    if (v71)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v71, CFSTR("imagesCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v72, CFSTR("imagesCardSection"));

    }
  }
  if (self->_infoCardSection)
  {
    -[_SFPBCardSectionValue infoCardSection](self, "infoCardSection");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "dictionaryRepresentation");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    if (v74)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v74, CFSTR("infoCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v75, CFSTR("infoCardSection"));

    }
  }
  if (self->_keyValueDataCardSection)
  {
    -[_SFPBCardSectionValue keyValueDataCardSection](self, "keyValueDataCardSection");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "dictionaryRepresentation");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    if (v77)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v77, CFSTR("keyValueDataCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v78, CFSTR("keyValueDataCardSection"));

    }
  }
  if (self->_largeTitleDetailedRowCardSection)
  {
    -[_SFPBCardSectionValue largeTitleDetailedRowCardSection](self, "largeTitleDetailedRowCardSection");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "dictionaryRepresentation");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    if (v80)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v80, CFSTR("largeTitleDetailedRowCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v81, CFSTR("largeTitleDetailedRowCardSection"));

    }
  }
  if (self->_leadingTrailingCardSection)
  {
    -[_SFPBCardSectionValue leadingTrailingCardSection](self, "leadingTrailingCardSection");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "dictionaryRepresentation");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    if (v83)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v83, CFSTR("leadingTrailingCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v84, CFSTR("leadingTrailingCardSection"));

    }
  }
  if (self->_linkPresentationCardSection)
  {
    -[_SFPBCardSectionValue linkPresentationCardSection](self, "linkPresentationCardSection");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "dictionaryRepresentation");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    if (v86)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v86, CFSTR("linkPresentationCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v87, CFSTR("linkPresentationCardSection"));

    }
  }
  if (self->_listenToCardSection)
  {
    -[_SFPBCardSectionValue listenToCardSection](self, "listenToCardSection");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "dictionaryRepresentation");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    if (v89)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v89, CFSTR("listenToCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v90, CFSTR("listenToCardSection"));

    }
  }
  if (self->_mapCardSection)
  {
    -[_SFPBCardSectionValue mapCardSection](self, "mapCardSection");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "dictionaryRepresentation");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    if (v92)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v92, CFSTR("mapCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v93, CFSTR("mapCardSection"));

    }
  }
  if (self->_mapPlaceCardSection)
  {
    -[_SFPBCardSectionValue mapPlaceCardSection](self, "mapPlaceCardSection");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "dictionaryRepresentation");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    if (v95)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v95, CFSTR("mapPlaceCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v96, CFSTR("mapPlaceCardSection"));

    }
  }
  if (self->_mapsDetailedRowCardSection)
  {
    -[_SFPBCardSectionValue mapsDetailedRowCardSection](self, "mapsDetailedRowCardSection");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "dictionaryRepresentation");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    if (v98)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v98, CFSTR("mapsDetailedRowCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v99, CFSTR("mapsDetailedRowCardSection"));

    }
  }
  if (self->_mediaInfoCardSection)
  {
    -[_SFPBCardSectionValue mediaInfoCardSection](self, "mediaInfoCardSection");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "dictionaryRepresentation");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    if (v101)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v101, CFSTR("mediaInfoCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v102, CFSTR("mediaInfoCardSection"));

    }
  }
  if (self->_mediaPlayerCardSection)
  {
    -[_SFPBCardSectionValue mediaPlayerCardSection](self, "mediaPlayerCardSection");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "dictionaryRepresentation");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    if (v104)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v104, CFSTR("mediaPlayerCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v105, CFSTR("mediaPlayerCardSection"));

    }
  }
  if (self->_mediaRemoteControlCardSection)
  {
    -[_SFPBCardSectionValue mediaRemoteControlCardSection](self, "mediaRemoteControlCardSection");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "dictionaryRepresentation");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    if (v107)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v107, CFSTR("mediaRemoteControlCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v108, CFSTR("mediaRemoteControlCardSection"));

    }
  }
  if (self->_messageCardSection)
  {
    -[_SFPBCardSectionValue messageCardSection](self, "messageCardSection");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "dictionaryRepresentation");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    if (v110)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v110, CFSTR("messageCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v111, CFSTR("messageCardSection"));

    }
  }
  if (self->_metaInfoCardSection)
  {
    -[_SFPBCardSectionValue metaInfoCardSection](self, "metaInfoCardSection");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "dictionaryRepresentation");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    if (v113)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v113, CFSTR("metaInfoCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v114, CFSTR("metaInfoCardSection"));

    }
  }
  if (self->_miniCardSection)
  {
    -[_SFPBCardSectionValue miniCardSection](self, "miniCardSection");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "dictionaryRepresentation");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    if (v116)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v116, CFSTR("miniCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v117, CFSTR("miniCardSection"));

    }
  }
  if (self->_newsCardSection)
  {
    -[_SFPBCardSectionValue newsCardSection](self, "newsCardSection");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "dictionaryRepresentation");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    if (v119)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v119, CFSTR("newsCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v120, CFSTR("newsCardSection"));

    }
  }
  if (self->_nowPlayingCardSection)
  {
    -[_SFPBCardSectionValue nowPlayingCardSection](self, "nowPlayingCardSection");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "dictionaryRepresentation");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    if (v122)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v122, CFSTR("nowPlayingCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v123, CFSTR("nowPlayingCardSection"));

    }
  }
  if (self->_personHeaderCardSection)
  {
    -[_SFPBCardSectionValue personHeaderCardSection](self, "personHeaderCardSection");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "dictionaryRepresentation");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    if (v125)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v125, CFSTR("personHeaderCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v126, CFSTR("personHeaderCardSection"));

    }
  }
  if (self->_productCardSection)
  {
    -[_SFPBCardSectionValue productCardSection](self, "productCardSection");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "dictionaryRepresentation");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    if (v128)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v128, CFSTR("productCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v129, CFSTR("productCardSection"));

    }
  }
  if (self->_responseWrapperCardSection)
  {
    -[_SFPBCardSectionValue responseWrapperCardSection](self, "responseWrapperCardSection");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "dictionaryRepresentation");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    if (v131)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v131, CFSTR("responseWrapperCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v132, CFSTR("responseWrapperCardSection"));

    }
  }
  if (self->_rfBinaryButtonCardSection)
  {
    -[_SFPBCardSectionValue rfBinaryButtonCardSection](self, "rfBinaryButtonCardSection");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "dictionaryRepresentation");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    if (v134)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v134, CFSTR("rfBinaryButtonCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v135, CFSTR("rfBinaryButtonCardSection"));

    }
  }
  if (self->_rfButtonCardSection)
  {
    -[_SFPBCardSectionValue rfButtonCardSection](self, "rfButtonCardSection");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "dictionaryRepresentation");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    if (v137)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v137, CFSTR("rfButtonCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v138, CFSTR("rfButtonCardSection"));

    }
  }
  if (self->_rfDisambiguationTitleCardSection)
  {
    -[_SFPBCardSectionValue rfDisambiguationTitleCardSection](self, "rfDisambiguationTitleCardSection");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "dictionaryRepresentation");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    if (v140)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v140, CFSTR("rfDisambiguationTitleCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v141, CFSTR("rfDisambiguationTitleCardSection"));

    }
  }
  if (self->_rfExpandableStandardCardSection)
  {
    -[_SFPBCardSectionValue rfExpandableStandardCardSection](self, "rfExpandableStandardCardSection");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "dictionaryRepresentation");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    if (v143)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v143, CFSTR("rfExpandableStandardCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v144, CFSTR("rfExpandableStandardCardSection"));

    }
  }
  if (self->_rfFactItemButtonCardSection)
  {
    -[_SFPBCardSectionValue rfFactItemButtonCardSection](self, "rfFactItemButtonCardSection");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "dictionaryRepresentation");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    if (v146)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v146, CFSTR("rfFactItemButtonCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v147, CFSTR("rfFactItemButtonCardSection"));

    }
  }
  if (self->_rfFactItemDetailedNumberCardSection)
  {
    -[_SFPBCardSectionValue rfFactItemDetailedNumberCardSection](self, "rfFactItemDetailedNumberCardSection");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "dictionaryRepresentation");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    if (v149)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v149, CFSTR("rfFactItemDetailedNumberCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v150, CFSTR("rfFactItemDetailedNumberCardSection"));

    }
  }
  if (self->_rfFactItemHeroButtonCardSection)
  {
    -[_SFPBCardSectionValue rfFactItemHeroButtonCardSection](self, "rfFactItemHeroButtonCardSection");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v151, "dictionaryRepresentation");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    if (v152)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v152, CFSTR("rfFactItemHeroButtonCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v153, CFSTR("rfFactItemHeroButtonCardSection"));

    }
  }
  if (self->_rfFactItemHeroNumberCardSection)
  {
    -[_SFPBCardSectionValue rfFactItemHeroNumberCardSection](self, "rfFactItemHeroNumberCardSection");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v154, "dictionaryRepresentation");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    if (v155)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v155, CFSTR("rfFactItemHeroNumberCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v156, CFSTR("rfFactItemHeroNumberCardSection"));

    }
  }
  if (self->_rfFactItemImageRightCardSection)
  {
    -[_SFPBCardSectionValue rfFactItemImageRightCardSection](self, "rfFactItemImageRightCardSection");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v157, "dictionaryRepresentation");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    if (v158)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v158, CFSTR("rfFactItemImageRightCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v159, CFSTR("rfFactItemImageRightCardSection"));

    }
  }
  if (self->_rfFactItemShortHeroNumberCardSection)
  {
    -[_SFPBCardSectionValue rfFactItemShortHeroNumberCardSection](self, "rfFactItemShortHeroNumberCardSection");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v160, "dictionaryRepresentation");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    if (v161)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v161, CFSTR("rfFactItemShortHeroNumberCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v162, CFSTR("rfFactItemShortHeroNumberCardSection"));

    }
  }
  if (self->_rfFactItemShortNumberCardSection)
  {
    -[_SFPBCardSectionValue rfFactItemShortNumberCardSection](self, "rfFactItemShortNumberCardSection");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v163, "dictionaryRepresentation");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    if (v164)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v164, CFSTR("rfFactItemShortNumberCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v165, CFSTR("rfFactItemShortNumberCardSection"));

    }
  }
  if (self->_rfFactItemStandardCardSection)
  {
    -[_SFPBCardSectionValue rfFactItemStandardCardSection](self, "rfFactItemStandardCardSection");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v166, "dictionaryRepresentation");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    if (v167)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v167, CFSTR("rfFactItemStandardCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v168, CFSTR("rfFactItemStandardCardSection"));

    }
  }
  if (self->_rfLongItemStandardCardSection)
  {
    -[_SFPBCardSectionValue rfLongItemStandardCardSection](self, "rfLongItemStandardCardSection");
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v169, "dictionaryRepresentation");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    if (v170)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v170, CFSTR("rfLongItemStandardCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v171, CFSTR("rfLongItemStandardCardSection"));

    }
  }
  if (self->_rfMapCardSection)
  {
    -[_SFPBCardSectionValue rfMapCardSection](self, "rfMapCardSection");
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v172, "dictionaryRepresentation");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    if (v173)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v173, CFSTR("rfMapCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v174, CFSTR("rfMapCardSection"));

    }
  }
  if (self->_rfMultiButtonCardSection)
  {
    -[_SFPBCardSectionValue rfMultiButtonCardSection](self, "rfMultiButtonCardSection");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v175, "dictionaryRepresentation");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    if (v176)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v176, CFSTR("rfMultiButtonCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v177 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v177, CFSTR("rfMultiButtonCardSection"));

    }
  }
  if (self->_rfPrimaryHeaderMarqueeCardSection)
  {
    -[_SFPBCardSectionValue rfPrimaryHeaderMarqueeCardSection](self, "rfPrimaryHeaderMarqueeCardSection");
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "dictionaryRepresentation");
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    if (v179)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v179, CFSTR("rfPrimaryHeaderMarqueeCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v180, CFSTR("rfPrimaryHeaderMarqueeCardSection"));

    }
  }
  if (self->_rfPrimaryHeaderRichCardSection)
  {
    -[_SFPBCardSectionValue rfPrimaryHeaderRichCardSection](self, "rfPrimaryHeaderRichCardSection");
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v181, "dictionaryRepresentation");
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    if (v182)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v182, CFSTR("rfPrimaryHeaderRichCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v183 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v183, CFSTR("rfPrimaryHeaderRichCardSection"));

    }
  }
  if (self->_rfPrimaryHeaderStackedImageCardSection)
  {
    -[_SFPBCardSectionValue rfPrimaryHeaderStackedImageCardSection](self, "rfPrimaryHeaderStackedImageCardSection");
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v184, "dictionaryRepresentation");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    if (v185)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v185, CFSTR("rfPrimaryHeaderStackedImageCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v186 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v186, CFSTR("rfPrimaryHeaderStackedImageCardSection"));

    }
  }
  if (self->_rfPrimaryHeaderStandardCardSection)
  {
    -[_SFPBCardSectionValue rfPrimaryHeaderStandardCardSection](self, "rfPrimaryHeaderStandardCardSection");
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v187, "dictionaryRepresentation");
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    if (v188)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v188, CFSTR("rfPrimaryHeaderStandardCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v189 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v189, CFSTR("rfPrimaryHeaderStandardCardSection"));

    }
  }
  if (self->_rfReferenceCenteredCardSection)
  {
    -[_SFPBCardSectionValue rfReferenceCenteredCardSection](self, "rfReferenceCenteredCardSection");
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v190, "dictionaryRepresentation");
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    if (v191)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v191, CFSTR("rfReferenceCenteredCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v192 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v192, CFSTR("rfReferenceCenteredCardSection"));

    }
  }
  if (self->_rfReferenceFootnoteCardSection)
  {
    -[_SFPBCardSectionValue rfReferenceFootnoteCardSection](self, "rfReferenceFootnoteCardSection");
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v193, "dictionaryRepresentation");
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    if (v194)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v194, CFSTR("rfReferenceFootnoteCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v195 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v195, CFSTR("rfReferenceFootnoteCardSection"));

    }
  }
  if (self->_rfReferenceItemButtonCardSection)
  {
    -[_SFPBCardSectionValue rfReferenceItemButtonCardSection](self, "rfReferenceItemButtonCardSection");
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v196, "dictionaryRepresentation");
    v197 = (void *)objc_claimAutoreleasedReturnValue();
    if (v197)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v197, CFSTR("rfReferenceItemButtonCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v198 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v198, CFSTR("rfReferenceItemButtonCardSection"));

    }
  }
  if (self->_rfReferenceItemLogoCardSection)
  {
    -[_SFPBCardSectionValue rfReferenceItemLogoCardSection](self, "rfReferenceItemLogoCardSection");
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v199, "dictionaryRepresentation");
    v200 = (void *)objc_claimAutoreleasedReturnValue();
    if (v200)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v200, CFSTR("rfReferenceItemLogoCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v201 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v201, CFSTR("rfReferenceItemLogoCardSection"));

    }
  }
  if (self->_rfReferenceRichCardSection)
  {
    -[_SFPBCardSectionValue rfReferenceRichCardSection](self, "rfReferenceRichCardSection");
    v202 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v202, "dictionaryRepresentation");
    v203 = (void *)objc_claimAutoreleasedReturnValue();
    if (v203)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v203, CFSTR("rfReferenceRichCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v204 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v204, CFSTR("rfReferenceRichCardSection"));

    }
  }
  if (self->_rfReferenceStandardCardSection)
  {
    -[_SFPBCardSectionValue rfReferenceStandardCardSection](self, "rfReferenceStandardCardSection");
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v205, "dictionaryRepresentation");
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    if (v206)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v206, CFSTR("rfReferenceStandardCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v207 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v207, CFSTR("rfReferenceStandardCardSection"));

    }
  }
  if (self->_rfSecondaryHeaderEmphasizedCardSection)
  {
    -[_SFPBCardSectionValue rfSecondaryHeaderEmphasizedCardSection](self, "rfSecondaryHeaderEmphasizedCardSection");
    v208 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v208, "dictionaryRepresentation");
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    if (v209)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v209, CFSTR("rfSecondaryHeaderEmphasizedCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v210 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v210, CFSTR("rfSecondaryHeaderEmphasizedCardSection"));

    }
  }
  if (self->_rfSecondaryHeaderStandardCardSection)
  {
    -[_SFPBCardSectionValue rfSecondaryHeaderStandardCardSection](self, "rfSecondaryHeaderStandardCardSection");
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v211, "dictionaryRepresentation");
    v212 = (void *)objc_claimAutoreleasedReturnValue();
    if (v212)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v212, CFSTR("rfSecondaryHeaderStandardCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v213 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v213, CFSTR("rfSecondaryHeaderStandardCardSection"));

    }
  }
  if (self->_rfSimpleItemPlayerCardSection)
  {
    -[_SFPBCardSectionValue rfSimpleItemPlayerCardSection](self, "rfSimpleItemPlayerCardSection");
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v214, "dictionaryRepresentation");
    v215 = (void *)objc_claimAutoreleasedReturnValue();
    if (v215)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v215, CFSTR("rfSimpleItemPlayerCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v216 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v216, CFSTR("rfSimpleItemPlayerCardSection"));

    }
  }
  if (self->_rfSimpleItemReverseRichCardSection)
  {
    -[_SFPBCardSectionValue rfSimpleItemReverseRichCardSection](self, "rfSimpleItemReverseRichCardSection");
    v217 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v217, "dictionaryRepresentation");
    v218 = (void *)objc_claimAutoreleasedReturnValue();
    if (v218)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v218, CFSTR("rfSimpleItemReverseRichCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v219 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v219, CFSTR("rfSimpleItemReverseRichCardSection"));

    }
  }
  if (self->_rfSimpleItemRichCardSection)
  {
    -[_SFPBCardSectionValue rfSimpleItemRichCardSection](self, "rfSimpleItemRichCardSection");
    v220 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v220, "dictionaryRepresentation");
    v221 = (void *)objc_claimAutoreleasedReturnValue();
    if (v221)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v221, CFSTR("rfSimpleItemRichCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v222 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v222, CFSTR("rfSimpleItemRichCardSection"));

    }
  }
  if (self->_rfSimpleItemRichSearchResultCardSection)
  {
    -[_SFPBCardSectionValue rfSimpleItemRichSearchResultCardSection](self, "rfSimpleItemRichSearchResultCardSection");
    v223 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v223, "dictionaryRepresentation");
    v224 = (void *)objc_claimAutoreleasedReturnValue();
    if (v224)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v224, CFSTR("rfSimpleItemRichSearchResultCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v225 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v225, CFSTR("rfSimpleItemRichSearchResultCardSection"));

    }
  }
  if (self->_rfSimpleItemStandardCardSection)
  {
    -[_SFPBCardSectionValue rfSimpleItemStandardCardSection](self, "rfSimpleItemStandardCardSection");
    v226 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v226, "dictionaryRepresentation");
    v227 = (void *)objc_claimAutoreleasedReturnValue();
    if (v227)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v227, CFSTR("rfSimpleItemStandardCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v228 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v228, CFSTR("rfSimpleItemStandardCardSection"));

    }
  }
  if (self->_rfSimpleItemVisualElementCardSection)
  {
    -[_SFPBCardSectionValue rfSimpleItemVisualElementCardSection](self, "rfSimpleItemVisualElementCardSection");
    v229 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v229, "dictionaryRepresentation");
    v230 = (void *)objc_claimAutoreleasedReturnValue();
    if (v230)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v230, CFSTR("rfSimpleItemVisualElementCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v231 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v231, CFSTR("rfSimpleItemVisualElementCardSection"));

    }
  }
  if (self->_rfSummaryItemAlignedTextCardSection)
  {
    -[_SFPBCardSectionValue rfSummaryItemAlignedTextCardSection](self, "rfSummaryItemAlignedTextCardSection");
    v232 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v232, "dictionaryRepresentation");
    v233 = (void *)objc_claimAutoreleasedReturnValue();
    if (v233)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v233, CFSTR("rfSummaryItemAlignedTextCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v234 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v234, CFSTR("rfSummaryItemAlignedTextCardSection"));

    }
  }
  if (self->_rfSummaryItemButtonCardSection)
  {
    -[_SFPBCardSectionValue rfSummaryItemButtonCardSection](self, "rfSummaryItemButtonCardSection");
    v235 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v235, "dictionaryRepresentation");
    v236 = (void *)objc_claimAutoreleasedReturnValue();
    if (v236)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v236, CFSTR("rfSummaryItemButtonCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v237 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v237, CFSTR("rfSummaryItemButtonCardSection"));

    }
  }
  if (self->_rfSummaryItemDetailedTextCardSection)
  {
    -[_SFPBCardSectionValue rfSummaryItemDetailedTextCardSection](self, "rfSummaryItemDetailedTextCardSection");
    v238 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v238, "dictionaryRepresentation");
    v239 = (void *)objc_claimAutoreleasedReturnValue();
    if (v239)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v239, CFSTR("rfSummaryItemDetailedTextCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v240 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v240, CFSTR("rfSummaryItemDetailedTextCardSection"));

    }
  }
  if (self->_rfSummaryItemImageRightCardSection)
  {
    -[_SFPBCardSectionValue rfSummaryItemImageRightCardSection](self, "rfSummaryItemImageRightCardSection");
    v241 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v241, "dictionaryRepresentation");
    v242 = (void *)objc_claimAutoreleasedReturnValue();
    if (v242)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v242, CFSTR("rfSummaryItemImageRightCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v243 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v243, CFSTR("rfSummaryItemImageRightCardSection"));

    }
  }
  if (self->_rfSummaryItemPairCardSection)
  {
    -[_SFPBCardSectionValue rfSummaryItemPairCardSection](self, "rfSummaryItemPairCardSection");
    v244 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v244, "dictionaryRepresentation");
    v245 = (void *)objc_claimAutoreleasedReturnValue();
    if (v245)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v245, CFSTR("rfSummaryItemPairCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v246 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v246, CFSTR("rfSummaryItemPairCardSection"));

    }
  }
  if (self->_rfSummaryItemPairNumberCardSection)
  {
    -[_SFPBCardSectionValue rfSummaryItemPairNumberCardSection](self, "rfSummaryItemPairNumberCardSection");
    v247 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v247, "dictionaryRepresentation");
    v248 = (void *)objc_claimAutoreleasedReturnValue();
    if (v248)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v248, CFSTR("rfSummaryItemPairNumberCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v249 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v249, CFSTR("rfSummaryItemPairNumberCardSection"));

    }
  }
  if (self->_rfSummaryItemPlayerCardSection)
  {
    -[_SFPBCardSectionValue rfSummaryItemPlayerCardSection](self, "rfSummaryItemPlayerCardSection");
    v250 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v250, "dictionaryRepresentation");
    v251 = (void *)objc_claimAutoreleasedReturnValue();
    if (v251)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v251, CFSTR("rfSummaryItemPlayerCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v252 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v252, CFSTR("rfSummaryItemPlayerCardSection"));

    }
  }
  if (self->_rfSummaryItemShortNumberCardSection)
  {
    -[_SFPBCardSectionValue rfSummaryItemShortNumberCardSection](self, "rfSummaryItemShortNumberCardSection");
    v253 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v253, "dictionaryRepresentation");
    v254 = (void *)objc_claimAutoreleasedReturnValue();
    if (v254)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v254, CFSTR("rfSummaryItemShortNumberCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v255 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v255, CFSTR("rfSummaryItemShortNumberCardSection"));

    }
  }
  if (self->_rfSummaryItemStandardCardSection)
  {
    -[_SFPBCardSectionValue rfSummaryItemStandardCardSection](self, "rfSummaryItemStandardCardSection");
    v256 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v256, "dictionaryRepresentation");
    v257 = (void *)objc_claimAutoreleasedReturnValue();
    if (v257)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v257, CFSTR("rfSummaryItemStandardCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v258 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v258, CFSTR("rfSummaryItemStandardCardSection"));

    }
  }
  if (self->_rfSummaryItemSwitchV2CardSection)
  {
    -[_SFPBCardSectionValue rfSummaryItemSwitchV2CardSection](self, "rfSummaryItemSwitchV2CardSection");
    v259 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v259, "dictionaryRepresentation");
    v260 = (void *)objc_claimAutoreleasedReturnValue();
    if (v260)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v260, CFSTR("rfSummaryItemSwitchV2CardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v261 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v261, CFSTR("rfSummaryItemSwitchV2CardSection"));

    }
  }
  if (self->_rfSummaryItemTextCardSection)
  {
    -[_SFPBCardSectionValue rfSummaryItemTextCardSection](self, "rfSummaryItemTextCardSection");
    v262 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v262, "dictionaryRepresentation");
    v263 = (void *)objc_claimAutoreleasedReturnValue();
    if (v263)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v263, CFSTR("rfSummaryItemTextCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v264 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v264, CFSTR("rfSummaryItemTextCardSection"));

    }
  }
  if (self->_rfTableHeaderCardSection)
  {
    -[_SFPBCardSectionValue rfTableHeaderCardSection](self, "rfTableHeaderCardSection");
    v265 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v265, "dictionaryRepresentation");
    v266 = (void *)objc_claimAutoreleasedReturnValue();
    if (v266)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v266, CFSTR("rfTableHeaderCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v267 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v267, CFSTR("rfTableHeaderCardSection"));

    }
  }
  if (self->_rfTableRowCardSection)
  {
    -[_SFPBCardSectionValue rfTableRowCardSection](self, "rfTableRowCardSection");
    v268 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v268, "dictionaryRepresentation");
    v269 = (void *)objc_claimAutoreleasedReturnValue();
    if (v269)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v269, CFSTR("rfTableRowCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v270 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v270, CFSTR("rfTableRowCardSection"));

    }
  }
  if (self->_richTitleCardSection)
  {
    -[_SFPBCardSectionValue richTitleCardSection](self, "richTitleCardSection");
    v271 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v271, "dictionaryRepresentation");
    v272 = (void *)objc_claimAutoreleasedReturnValue();
    if (v272)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v272, CFSTR("richTitleCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v273 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v273, CFSTR("richTitleCardSection"));

    }
  }
  if (self->_rowCardSection)
  {
    -[_SFPBCardSectionValue rowCardSection](self, "rowCardSection");
    v274 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v274, "dictionaryRepresentation");
    v275 = (void *)objc_claimAutoreleasedReturnValue();
    if (v275)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v275, CFSTR("rowCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v276 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v276, CFSTR("rowCardSection"));

    }
  }
  if (self->_safariTableOfContentsCardSection)
  {
    -[_SFPBCardSectionValue safariTableOfContentsCardSection](self, "safariTableOfContentsCardSection");
    v277 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v277, "dictionaryRepresentation");
    v278 = (void *)objc_claimAutoreleasedReturnValue();
    if (v278)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v278, CFSTR("safariTableOfContentsCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v279 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v279, CFSTR("safariTableOfContentsCardSection"));

    }
  }
  if (self->_scoreboardCardSection)
  {
    -[_SFPBCardSectionValue scoreboardCardSection](self, "scoreboardCardSection");
    v280 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v280, "dictionaryRepresentation");
    v281 = (void *)objc_claimAutoreleasedReturnValue();
    if (v281)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v281, CFSTR("scoreboardCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v282 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v282, CFSTR("scoreboardCardSection"));

    }
  }
  if (self->_sectionHeaderCardSection)
  {
    -[_SFPBCardSectionValue sectionHeaderCardSection](self, "sectionHeaderCardSection");
    v283 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v283, "dictionaryRepresentation");
    v284 = (void *)objc_claimAutoreleasedReturnValue();
    if (v284)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v284, CFSTR("sectionHeaderCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v285 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v285, CFSTR("sectionHeaderCardSection"));

    }
  }
  if (self->_selectableGridCardSection)
  {
    -[_SFPBCardSectionValue selectableGridCardSection](self, "selectableGridCardSection");
    v286 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v286, "dictionaryRepresentation");
    v287 = (void *)objc_claimAutoreleasedReturnValue();
    if (v287)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v287, CFSTR("selectableGridCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v288 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v288, CFSTR("selectableGridCardSection"));

    }
  }
  if (self->_socialMediaPostCardSection)
  {
    -[_SFPBCardSectionValue socialMediaPostCardSection](self, "socialMediaPostCardSection");
    v289 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v289, "dictionaryRepresentation");
    v290 = (void *)objc_claimAutoreleasedReturnValue();
    if (v290)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v290, CFSTR("socialMediaPostCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v291 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v291, CFSTR("socialMediaPostCardSection"));

    }
  }
  if (self->_splitCardSection)
  {
    -[_SFPBCardSectionValue splitCardSection](self, "splitCardSection");
    v292 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v292, "dictionaryRepresentation");
    v293 = (void *)objc_claimAutoreleasedReturnValue();
    if (v293)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v293, CFSTR("splitCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v294 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v294, CFSTR("splitCardSection"));

    }
  }
  if (self->_stockChartCardSection)
  {
    -[_SFPBCardSectionValue stockChartCardSection](self, "stockChartCardSection");
    v295 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v295, "dictionaryRepresentation");
    v296 = (void *)objc_claimAutoreleasedReturnValue();
    if (v296)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v296, CFSTR("stockChartCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v297 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v297, CFSTR("stockChartCardSection"));

    }
  }
  if (self->_strokeAnimationCardSection)
  {
    -[_SFPBCardSectionValue strokeAnimationCardSection](self, "strokeAnimationCardSection");
    v298 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v298, "dictionaryRepresentation");
    v299 = (void *)objc_claimAutoreleasedReturnValue();
    if (v299)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v299, CFSTR("strokeAnimationCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v300 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v300, CFSTR("strokeAnimationCardSection"));

    }
  }
  if (self->_suggestionCardSection)
  {
    -[_SFPBCardSectionValue suggestionCardSection](self, "suggestionCardSection");
    v301 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v301, "dictionaryRepresentation");
    v302 = (void *)objc_claimAutoreleasedReturnValue();
    if (v302)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v302, CFSTR("suggestionCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v303 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v303, CFSTR("suggestionCardSection"));

    }
  }
  if (self->_tableHeaderRowCardSection)
  {
    -[_SFPBCardSectionValue tableHeaderRowCardSection](self, "tableHeaderRowCardSection");
    v304 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v304, "dictionaryRepresentation");
    v305 = (void *)objc_claimAutoreleasedReturnValue();
    if (v305)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v305, CFSTR("tableHeaderRowCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v306 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v306, CFSTR("tableHeaderRowCardSection"));

    }
  }
  if (self->_tableRowCardSection)
  {
    -[_SFPBCardSectionValue tableRowCardSection](self, "tableRowCardSection");
    v307 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v307, "dictionaryRepresentation");
    v308 = (void *)objc_claimAutoreleasedReturnValue();
    if (v308)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v308, CFSTR("tableRowCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v309 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v309, CFSTR("tableRowCardSection"));

    }
  }
  if (self->_textColumnsCardSection)
  {
    -[_SFPBCardSectionValue textColumnsCardSection](self, "textColumnsCardSection");
    v310 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v310, "dictionaryRepresentation");
    v311 = (void *)objc_claimAutoreleasedReturnValue();
    if (v311)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v311, CFSTR("textColumnsCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v312 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v312, CFSTR("textColumnsCardSection"));

    }
  }
  if (self->_titleCardSection)
  {
    -[_SFPBCardSectionValue titleCardSection](self, "titleCardSection");
    v313 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v313, "dictionaryRepresentation");
    v314 = (void *)objc_claimAutoreleasedReturnValue();
    if (v314)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v314, CFSTR("titleCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v315 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v315, CFSTR("titleCardSection"));

    }
  }
  if (self->_trackListCardSection)
  {
    -[_SFPBCardSectionValue trackListCardSection](self, "trackListCardSection");
    v316 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v316, "dictionaryRepresentation");
    v317 = (void *)objc_claimAutoreleasedReturnValue();
    if (v317)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v317, CFSTR("trackListCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v318 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v318, CFSTR("trackListCardSection"));

    }
  }
  if (self->_verticalLayoutCardSection)
  {
    -[_SFPBCardSectionValue verticalLayoutCardSection](self, "verticalLayoutCardSection");
    v319 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v319, "dictionaryRepresentation");
    v320 = (void *)objc_claimAutoreleasedReturnValue();
    if (v320)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v320, CFSTR("verticalLayoutCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v321 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v321, CFSTR("verticalLayoutCardSection"));

    }
  }
  if (self->_watchListCardSection)
  {
    -[_SFPBCardSectionValue watchListCardSection](self, "watchListCardSection");
    v322 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v322, "dictionaryRepresentation");
    v323 = (void *)objc_claimAutoreleasedReturnValue();
    if (v323)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v323, CFSTR("watchListCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v324 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v324, CFSTR("watchListCardSection"));

    }
  }
  if (self->_watchNowCardSection)
  {
    -[_SFPBCardSectionValue watchNowCardSection](self, "watchNowCardSection");
    v325 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v325, "dictionaryRepresentation");
    v326 = (void *)objc_claimAutoreleasedReturnValue();
    if (v326)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v326, CFSTR("watchNowCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v327 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v327, CFSTR("watchNowCardSection"));

    }
  }
  if (self->_webCardSection)
  {
    -[_SFPBCardSectionValue webCardSection](self, "webCardSection");
    v328 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v328, "dictionaryRepresentation");
    v329 = (void *)objc_claimAutoreleasedReturnValue();
    if (v329)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v329, CFSTR("webCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v330 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v330, CFSTR("webCardSection"));

    }
  }
  if (self->_worldMapCardSection)
  {
    -[_SFPBCardSectionValue worldMapCardSection](self, "worldMapCardSection");
    v331 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v331, "dictionaryRepresentation");
    v332 = (void *)objc_claimAutoreleasedReturnValue();
    if (v332)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v332, CFSTR("worldMapCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v333 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v333, CFSTR("worldMapCardSection"));

    }
  }
  v334 = v3;

  return v334;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBCardSectionValue dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBCardSectionValue)initWithJSON:(id)a3
{
  void *v4;
  _SFPBCardSectionValue *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[_SFPBCardSectionValue initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBCardSectionValue)initWithDictionary:(id)a3
{
  id v4;
  _SFPBCardSectionValue *v5;
  uint64_t v6;
  _SFPBAppLinkCardSection *v7;
  uint64_t v8;
  _SFPBDescriptionCardSection *v9;
  uint64_t v10;
  _SFPBKeyValueDataCardSection *v11;
  uint64_t v12;
  _SFPBMapCardSection *v13;
  uint64_t v14;
  _SFPBMediaInfoCardSection *v15;
  uint64_t v16;
  _SFPBMediaPlayerCardSection *v17;
  uint64_t v18;
  _SFPBNowPlayingCardSection *v19;
  uint64_t v20;
  _SFPBRichTitleCardSection *v21;
  uint64_t v22;
  _SFPBRowCardSection *v23;
  uint64_t v24;
  _SFPBScoreboardCardSection *v25;
  uint64_t v26;
  _SFPBSocialMediaPostCardSection *v27;
  uint64_t v28;
  _SFPBStockChartCardSection *v29;
  uint64_t v30;
  _SFPBTableHeaderRowCardSection *v31;
  uint64_t v32;
  _SFPBTableRowCardSection *v33;
  uint64_t v34;
  _SFPBTextColumnsCardSection *v35;
  uint64_t v36;
  _SFPBTitleCardSection *v37;
  uint64_t v38;
  _SFPBTrackListCardSection *v39;
  uint64_t v40;
  _SFPBAudioPlaybackCardSection *v41;
  uint64_t v42;
  _SFPBFlightCardSection *v43;
  uint64_t v44;
  _SFPBActivityIndicatorCardSection *v45;
  uint64_t v46;
  _SFPBWebCardSection *v47;
  uint64_t v48;
  _SFPBMessageCardSection *v49;
  uint64_t v50;
  _SFPBDetailedRowCardSection *v51;
  uint64_t v52;
  _SFPBImagesCardSection *v53;
  uint64_t v54;
  _SFPBSuggestionCardSection *v55;
  uint64_t v56;
  _SFPBSelectableGridCardSection *v57;
  uint64_t v58;
  _SFPBSectionHeaderCardSection *v59;
  uint64_t v60;
  _SFPBMetaInfoCardSection *v61;
  uint64_t v62;
  _SFPBWatchListCardSection *v63;
  uint64_t v64;
  _SFPBMapsDetailedRowCardSection *v65;
  uint64_t v66;
  _SFPBButtonCardSection *v67;
  uint64_t v68;
  _SFPBHorizontalButtonCardSection *v69;
  uint64_t v70;
  _SFPBVerticalLayoutCardSection *v71;
  uint64_t v72;
  _SFPBProductCardSection *v73;
  uint64_t v74;
  _SFPBHorizontalScrollCardSection *v75;
  uint64_t v76;
  _SFPBMediaRemoteControlCardSection *v77;
  uint64_t v78;
  _SFPBMapPlaceCardSection *v79;
  uint64_t v80;
  _SFPBCompactRowCardSection *v81;
  uint64_t v82;
  _SFPBWorldMapCardSection *v83;
  uint64_t v84;
  _SFPBAttributionFooterCardSection *v85;
  uint64_t v86;
  _SFPBGridCardSection *v87;
  uint64_t v88;
  _SFPBPersonHeaderCardSection *v89;
  uint64_t v90;
  _SFPBColorBarCardSection *v91;
  uint64_t v92;
  _SFPBSplitCardSection *v93;
  uint64_t v94;
  _SFPBLinkPresentationCardSection *v95;
  uint64_t v96;
  _SFPBFindMyCardSection *v97;
  uint64_t v98;
  _SFPBHeroCardSection *v99;
  uint64_t v100;
  _SFPBNewsCardSection *v101;
  uint64_t v102;
  _SFPBMiniCardSection *v103;
  uint64_t v104;
  _SFPBInfoCardSection *v105;
  uint64_t v106;
  _SFPBCollectionCardSection *v107;
  uint64_t v108;
  _SFPBCombinedCardSection *v109;
  uint64_t v110;
  _SFPBResponseWrapperCardSection *v111;
  uint64_t v112;
  _SFPBListenToCardSection *v113;
  uint64_t v114;
  _SFPBWatchNowCardSection *v115;
  uint64_t v116;
  _SFPBStrokeAnimationCardSection *v117;
  uint64_t v118;
  _SFPBButtonListCardSection *v119;
  uint64_t v120;
  _SFPBCommandRowCardSection *v121;
  uint64_t v122;
  _SFPBLeadingTrailingCardSection *v123;
  uint64_t v124;
  _SFPBHeroTitleCardSection *v125;
  uint64_t v126;
  _SFPBArchiveViewCardSection *v127;
  uint64_t v128;
  _SFPBAppIconCardSection *v129;
  uint64_t v130;
  _SFPBLargeTitleDetailedRowCardSection *v131;
  uint64_t v132;
  _SFPBSafariTableOfContentsCardSection *v133;
  uint64_t v134;
  _SFPBRFSummaryItemShortNumberCardSection *v135;
  uint64_t v136;
  _SFPBRFSummaryItemTextCardSection *v137;
  uint64_t v138;
  _SFPBRFSummaryItemStandardCardSection *v139;
  uint64_t v140;
  _SFPBRFFactItemShortNumberCardSection *v141;
  uint64_t v142;
  _SFPBRFFactItemStandardCardSection *v143;
  uint64_t v144;
  _SFPBRFLongItemStandardCardSection *v145;
  uint64_t v146;
  _SFPBRFPrimaryHeaderRichCardSection *v147;
  uint64_t v148;
  _SFPBRFPrimaryHeaderStandardCardSection *v149;
  uint64_t v150;
  _SFPBRFReferenceFootnoteCardSection *v151;
  uint64_t v152;
  _SFPBRFReferenceRichCardSection *v153;
  uint64_t v154;
  _SFPBRFSimpleItemRichCardSection *v155;
  uint64_t v156;
  _SFPBRFSimpleItemStandardCardSection *v157;
  uint64_t v158;
  _SFPBRFSummaryItemAlignedTextCardSection *v159;
  uint64_t v160;
  _SFPBRFExpandableStandardCardSection *v161;
  uint64_t v162;
  _SFPBRFFactItemButtonCardSection *v163;
  uint64_t v164;
  _SFPBRFFactItemHeroNumberCardSection *v165;
  uint64_t v166;
  _SFPBRFPrimaryHeaderMarqueeCardSection *v167;
  uint64_t v168;
  _SFPBRFSummaryItemDetailedTextCardSection *v169;
  uint64_t v170;
  _SFPBRFSimpleItemPlayerCardSection *v171;
  uint64_t v172;
  _SFPBRFSummaryItemPairCardSection *v173;
  uint64_t v174;
  _SFPBRFSummaryItemPairNumberCardSection *v175;
  uint64_t v176;
  _SFPBRFFactItemShortHeroNumberCardSection *v177;
  uint64_t v178;
  _SFPBRFFactItemDetailedNumberCardSection *v179;
  uint64_t v180;
  _SFPBRFFactItemHeroButtonCardSection *v181;
  uint64_t v182;
  _SFPBRFFactItemImageRightCardSection *v183;
  uint64_t v184;
  _SFPBRFSummaryItemSwitchV2CardSection *v185;
  uint64_t v186;
  _SFPBRFTableHeaderCardSection *v187;
  uint64_t v188;
  _SFPBRFTableRowCardSection *v189;
  uint64_t v190;
  _SFPBRFSimpleItemVisualElementCardSection *v191;
  uint64_t v192;
  _SFPBRFSummaryItemPlayerCardSection *v193;
  uint64_t v194;
  _SFPBRFSummaryItemImageRightCardSection *v195;
  uint64_t v196;
  _SFPBRFSummaryItemButtonCardSection *v197;
  uint64_t v198;
  _SFPBRFSimpleItemReverseRichCardSection *v199;
  uint64_t v200;
  _SFPBRFSimpleItemRichSearchResultCardSection *v201;
  uint64_t v202;
  _SFPBRFPrimaryHeaderStackedImageCardSection *v203;
  uint64_t v204;
  _SFPBRFReferenceItemLogoCardSection *v205;
  uint64_t v206;
  _SFPBRFReferenceItemButtonCardSection *v207;
  uint64_t v208;
  _SFPBRFButtonCardSection *v209;
  uint64_t v210;
  _SFPBRFBinaryButtonCardSection *v211;
  void *v212;
  _SFPBRFReferenceCenteredCardSection *v213;
  void *v214;
  _SFPBRFSecondaryHeaderStandardCardSection *v215;
  void *v216;
  _SFPBRFSecondaryHeaderEmphasizedCardSection *v217;
  void *v218;
  _SFPBRFMapCardSection *v219;
  void *v220;
  _SFPBRFReferenceStandardCardSection *v221;
  void *v222;
  _SFPBRFMultiButtonCardSection *v223;
  void *v224;
  _SFPBRFDisambiguationTitleCardSection *v225;
  _SFPBCardSectionValue *v226;
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
  objc_super v331;

  v4 = a3;
  v331.receiver = self;
  v331.super_class = (Class)_SFPBCardSectionValue;
  v5 = -[_SFPBCardSectionValue init](&v331, sel_init);

  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appLinkCardSection"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBAppLinkCardSection initWithDictionary:]([_SFPBAppLinkCardSection alloc], "initWithDictionary:", v6);
      -[_SFPBCardSectionValue setAppLinkCardSection:](v5, "setAppLinkCardSection:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("descriptionCardSection"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[_SFPBDescriptionCardSection initWithDictionary:]([_SFPBDescriptionCardSection alloc], "initWithDictionary:", v8);
      -[_SFPBCardSectionValue setDescriptionCardSection:](v5, "setDescriptionCardSection:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("keyValueDataCardSection"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[_SFPBKeyValueDataCardSection initWithDictionary:]([_SFPBKeyValueDataCardSection alloc], "initWithDictionary:", v10);
      -[_SFPBCardSectionValue setKeyValueDataCardSection:](v5, "setKeyValueDataCardSection:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mapCardSection"));
    v12 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[_SFPBMapCardSection initWithDictionary:]([_SFPBMapCardSection alloc], "initWithDictionary:", v12);
      -[_SFPBCardSectionValue setMapCardSection:](v5, "setMapCardSection:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mediaInfoCardSection"));
    v14 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[_SFPBMediaInfoCardSection initWithDictionary:]([_SFPBMediaInfoCardSection alloc], "initWithDictionary:", v14);
      -[_SFPBCardSectionValue setMediaInfoCardSection:](v5, "setMediaInfoCardSection:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mediaPlayerCardSection"));
    v16 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[_SFPBMediaPlayerCardSection initWithDictionary:]([_SFPBMediaPlayerCardSection alloc], "initWithDictionary:", v16);
      -[_SFPBCardSectionValue setMediaPlayerCardSection:](v5, "setMediaPlayerCardSection:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nowPlayingCardSection"));
    v18 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v330 = (void *)v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[_SFPBNowPlayingCardSection initWithDictionary:]([_SFPBNowPlayingCardSection alloc], "initWithDictionary:", v18);
      -[_SFPBCardSectionValue setNowPlayingCardSection:](v5, "setNowPlayingCardSection:", v19);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("richTitleCardSection"));
    v20 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v329 = (void *)v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[_SFPBRichTitleCardSection initWithDictionary:]([_SFPBRichTitleCardSection alloc], "initWithDictionary:", v20);
      -[_SFPBCardSectionValue setRichTitleCardSection:](v5, "setRichTitleCardSection:", v21);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rowCardSection"));
    v22 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v328 = (void *)v22;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = -[_SFPBRowCardSection initWithDictionary:]([_SFPBRowCardSection alloc], "initWithDictionary:", v22);
      -[_SFPBCardSectionValue setRowCardSection:](v5, "setRowCardSection:", v23);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("scoreboardCardSection"));
    v24 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v327 = (void *)v24;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = -[_SFPBScoreboardCardSection initWithDictionary:]([_SFPBScoreboardCardSection alloc], "initWithDictionary:", v24);
      -[_SFPBCardSectionValue setScoreboardCardSection:](v5, "setScoreboardCardSection:", v25);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("socialMediaPostCardSection"));
    v26 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v326 = (void *)v26;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = -[_SFPBSocialMediaPostCardSection initWithDictionary:]([_SFPBSocialMediaPostCardSection alloc], "initWithDictionary:", v26);
      -[_SFPBCardSectionValue setSocialMediaPostCardSection:](v5, "setSocialMediaPostCardSection:", v27);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("stockChartCardSection"));
    v28 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v325 = (void *)v28;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = -[_SFPBStockChartCardSection initWithDictionary:]([_SFPBStockChartCardSection alloc], "initWithDictionary:", v28);
      -[_SFPBCardSectionValue setStockChartCardSection:](v5, "setStockChartCardSection:", v29);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tableHeaderRowCardSection"));
    v30 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v324 = (void *)v30;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = -[_SFPBTableHeaderRowCardSection initWithDictionary:]([_SFPBTableHeaderRowCardSection alloc], "initWithDictionary:", v30);
      -[_SFPBCardSectionValue setTableHeaderRowCardSection:](v5, "setTableHeaderRowCardSection:", v31);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tableRowCardSection"));
    v32 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v323 = (void *)v32;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = -[_SFPBTableRowCardSection initWithDictionary:]([_SFPBTableRowCardSection alloc], "initWithDictionary:", v32);
      -[_SFPBCardSectionValue setTableRowCardSection:](v5, "setTableRowCardSection:", v33);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("textColumnsCardSection"));
    v34 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v322 = (void *)v34;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = -[_SFPBTextColumnsCardSection initWithDictionary:]([_SFPBTextColumnsCardSection alloc], "initWithDictionary:", v34);
      -[_SFPBCardSectionValue setTextColumnsCardSection:](v5, "setTextColumnsCardSection:", v35);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("titleCardSection"));
    v36 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v321 = (void *)v36;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v37 = -[_SFPBTitleCardSection initWithDictionary:]([_SFPBTitleCardSection alloc], "initWithDictionary:", v36);
      -[_SFPBCardSectionValue setTitleCardSection:](v5, "setTitleCardSection:", v37);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trackListCardSection"));
    v38 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v320 = (void *)v38;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v39 = -[_SFPBTrackListCardSection initWithDictionary:]([_SFPBTrackListCardSection alloc], "initWithDictionary:", v38);
      -[_SFPBCardSectionValue setTrackListCardSection:](v5, "setTrackListCardSection:", v39);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioPlaybackCardSection"));
    v40 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v319 = (void *)v40;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v41 = -[_SFPBAudioPlaybackCardSection initWithDictionary:]([_SFPBAudioPlaybackCardSection alloc], "initWithDictionary:", v40);
      -[_SFPBCardSectionValue setAudioPlaybackCardSection:](v5, "setAudioPlaybackCardSection:", v41);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("flightCardSection"));
    v42 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v318 = (void *)v42;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v43 = -[_SFPBFlightCardSection initWithDictionary:]([_SFPBFlightCardSection alloc], "initWithDictionary:", v42);
      -[_SFPBCardSectionValue setFlightCardSection:](v5, "setFlightCardSection:", v43);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("activityIndicatorCardSection"));
    v44 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v317 = (void *)v44;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v45 = -[_SFPBActivityIndicatorCardSection initWithDictionary:]([_SFPBActivityIndicatorCardSection alloc], "initWithDictionary:", v44);
      -[_SFPBCardSectionValue setActivityIndicatorCardSection:](v5, "setActivityIndicatorCardSection:", v45);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("webCardSection"));
    v46 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v316 = (void *)v46;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v47 = -[_SFPBWebCardSection initWithDictionary:]([_SFPBWebCardSection alloc], "initWithDictionary:", v46);
      -[_SFPBCardSectionValue setWebCardSection:](v5, "setWebCardSection:", v47);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("messageCardSection"));
    v48 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v315 = (void *)v48;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v49 = -[_SFPBMessageCardSection initWithDictionary:]([_SFPBMessageCardSection alloc], "initWithDictionary:", v48);
      -[_SFPBCardSectionValue setMessageCardSection:](v5, "setMessageCardSection:", v49);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("detailedRowCardSection"));
    v50 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v314 = (void *)v50;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v51 = -[_SFPBDetailedRowCardSection initWithDictionary:]([_SFPBDetailedRowCardSection alloc], "initWithDictionary:", v50);
      -[_SFPBCardSectionValue setDetailedRowCardSection:](v5, "setDetailedRowCardSection:", v51);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("imagesCardSection"));
    v52 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v313 = (void *)v52;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v53 = -[_SFPBImagesCardSection initWithDictionary:]([_SFPBImagesCardSection alloc], "initWithDictionary:", v52);
      -[_SFPBCardSectionValue setImagesCardSection:](v5, "setImagesCardSection:", v53);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("suggestionCardSection"));
    v54 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v312 = (void *)v54;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v55 = -[_SFPBSuggestionCardSection initWithDictionary:]([_SFPBSuggestionCardSection alloc], "initWithDictionary:", v54);
      -[_SFPBCardSectionValue setSuggestionCardSection:](v5, "setSuggestionCardSection:", v55);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("selectableGridCardSection"));
    v56 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v311 = (void *)v56;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v57 = -[_SFPBSelectableGridCardSection initWithDictionary:]([_SFPBSelectableGridCardSection alloc], "initWithDictionary:", v56);
      -[_SFPBCardSectionValue setSelectableGridCardSection:](v5, "setSelectableGridCardSection:", v57);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sectionHeaderCardSection"));
    v58 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v310 = (void *)v58;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v59 = -[_SFPBSectionHeaderCardSection initWithDictionary:]([_SFPBSectionHeaderCardSection alloc], "initWithDictionary:", v58);
      -[_SFPBCardSectionValue setSectionHeaderCardSection:](v5, "setSectionHeaderCardSection:", v59);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("metaInfoCardSection"));
    v60 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v309 = (void *)v60;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v61 = -[_SFPBMetaInfoCardSection initWithDictionary:]([_SFPBMetaInfoCardSection alloc], "initWithDictionary:", v60);
      -[_SFPBCardSectionValue setMetaInfoCardSection:](v5, "setMetaInfoCardSection:", v61);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("watchListCardSection"));
    v62 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v308 = (void *)v62;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v63 = -[_SFPBWatchListCardSection initWithDictionary:]([_SFPBWatchListCardSection alloc], "initWithDictionary:", v62);
      -[_SFPBCardSectionValue setWatchListCardSection:](v5, "setWatchListCardSection:", v63);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mapsDetailedRowCardSection"));
    v64 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v307 = (void *)v64;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v65 = -[_SFPBMapsDetailedRowCardSection initWithDictionary:]([_SFPBMapsDetailedRowCardSection alloc], "initWithDictionary:", v64);
      -[_SFPBCardSectionValue setMapsDetailedRowCardSection:](v5, "setMapsDetailedRowCardSection:", v65);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("buttonCardSection"));
    v66 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v306 = (void *)v66;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v67 = -[_SFPBButtonCardSection initWithDictionary:]([_SFPBButtonCardSection alloc], "initWithDictionary:", v66);
      -[_SFPBCardSectionValue setButtonCardSection:](v5, "setButtonCardSection:", v67);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("horizontalButtonCardSection"));
    v68 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v305 = (void *)v68;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v69 = -[_SFPBHorizontalButtonCardSection initWithDictionary:]([_SFPBHorizontalButtonCardSection alloc], "initWithDictionary:", v68);
      -[_SFPBCardSectionValue setHorizontalButtonCardSection:](v5, "setHorizontalButtonCardSection:", v69);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("verticalLayoutCardSection"));
    v70 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v304 = (void *)v70;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v71 = -[_SFPBVerticalLayoutCardSection initWithDictionary:]([_SFPBVerticalLayoutCardSection alloc], "initWithDictionary:", v70);
      -[_SFPBCardSectionValue setVerticalLayoutCardSection:](v5, "setVerticalLayoutCardSection:", v71);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("productCardSection"));
    v72 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v303 = (void *)v72;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v73 = -[_SFPBProductCardSection initWithDictionary:]([_SFPBProductCardSection alloc], "initWithDictionary:", v72);
      -[_SFPBCardSectionValue setProductCardSection:](v5, "setProductCardSection:", v73);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("horizontalScrollCardSection"));
    v74 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v302 = (void *)v74;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v75 = -[_SFPBHorizontalScrollCardSection initWithDictionary:]([_SFPBHorizontalScrollCardSection alloc], "initWithDictionary:", v74);
      -[_SFPBCardSectionValue setHorizontalScrollCardSection:](v5, "setHorizontalScrollCardSection:", v75);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mediaRemoteControlCardSection"));
    v76 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v301 = (void *)v76;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v77 = -[_SFPBMediaRemoteControlCardSection initWithDictionary:]([_SFPBMediaRemoteControlCardSection alloc], "initWithDictionary:", v76);
      -[_SFPBCardSectionValue setMediaRemoteControlCardSection:](v5, "setMediaRemoteControlCardSection:", v77);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mapPlaceCardSection"));
    v78 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v300 = (void *)v78;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v79 = -[_SFPBMapPlaceCardSection initWithDictionary:]([_SFPBMapPlaceCardSection alloc], "initWithDictionary:", v78);
      -[_SFPBCardSectionValue setMapPlaceCardSection:](v5, "setMapPlaceCardSection:", v79);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("compactRowCardSection"));
    v80 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v299 = (void *)v80;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v81 = -[_SFPBCompactRowCardSection initWithDictionary:]([_SFPBCompactRowCardSection alloc], "initWithDictionary:", v80);
      -[_SFPBCardSectionValue setCompactRowCardSection:](v5, "setCompactRowCardSection:", v81);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("worldMapCardSection"));
    v82 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v298 = (void *)v82;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v83 = -[_SFPBWorldMapCardSection initWithDictionary:]([_SFPBWorldMapCardSection alloc], "initWithDictionary:", v82);
      -[_SFPBCardSectionValue setWorldMapCardSection:](v5, "setWorldMapCardSection:", v83);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("attributionFooterCardSection"));
    v84 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v297 = (void *)v84;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v85 = -[_SFPBAttributionFooterCardSection initWithDictionary:]([_SFPBAttributionFooterCardSection alloc], "initWithDictionary:", v84);
      -[_SFPBCardSectionValue setAttributionFooterCardSection:](v5, "setAttributionFooterCardSection:", v85);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("gridCardSection"));
    v86 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v296 = (void *)v86;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v87 = -[_SFPBGridCardSection initWithDictionary:]([_SFPBGridCardSection alloc], "initWithDictionary:", v86);
      -[_SFPBCardSectionValue setGridCardSection:](v5, "setGridCardSection:", v87);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("personHeaderCardSection"));
    v88 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v295 = (void *)v88;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v89 = -[_SFPBPersonHeaderCardSection initWithDictionary:]([_SFPBPersonHeaderCardSection alloc], "initWithDictionary:", v88);
      -[_SFPBCardSectionValue setPersonHeaderCardSection:](v5, "setPersonHeaderCardSection:", v89);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("colorBarCardSection"));
    v90 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v294 = (void *)v90;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v91 = -[_SFPBColorBarCardSection initWithDictionary:]([_SFPBColorBarCardSection alloc], "initWithDictionary:", v90);
      -[_SFPBCardSectionValue setColorBarCardSection:](v5, "setColorBarCardSection:", v91);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("splitCardSection"));
    v92 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v293 = (void *)v92;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v93 = -[_SFPBSplitCardSection initWithDictionary:]([_SFPBSplitCardSection alloc], "initWithDictionary:", v92);
      -[_SFPBCardSectionValue setSplitCardSection:](v5, "setSplitCardSection:", v93);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("linkPresentationCardSection"));
    v94 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v292 = (void *)v94;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v95 = -[_SFPBLinkPresentationCardSection initWithDictionary:]([_SFPBLinkPresentationCardSection alloc], "initWithDictionary:", v94);
      -[_SFPBCardSectionValue setLinkPresentationCardSection:](v5, "setLinkPresentationCardSection:", v95);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("findMyCardSection"));
    v96 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v291 = (void *)v96;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v97 = -[_SFPBFindMyCardSection initWithDictionary:]([_SFPBFindMyCardSection alloc], "initWithDictionary:", v96);
      -[_SFPBCardSectionValue setFindMyCardSection:](v5, "setFindMyCardSection:", v97);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("heroCardSection"));
    v98 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v290 = (void *)v98;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v99 = -[_SFPBHeroCardSection initWithDictionary:]([_SFPBHeroCardSection alloc], "initWithDictionary:", v98);
      -[_SFPBCardSectionValue setHeroCardSection:](v5, "setHeroCardSection:", v99);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("newsCardSection"));
    v100 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v289 = (void *)v100;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v101 = -[_SFPBNewsCardSection initWithDictionary:]([_SFPBNewsCardSection alloc], "initWithDictionary:", v100);
      -[_SFPBCardSectionValue setNewsCardSection:](v5, "setNewsCardSection:", v101);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("miniCardSection"));
    v102 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v288 = (void *)v102;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v103 = -[_SFPBMiniCardSection initWithDictionary:]([_SFPBMiniCardSection alloc], "initWithDictionary:", v102);
      -[_SFPBCardSectionValue setMiniCardSection:](v5, "setMiniCardSection:", v103);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("infoCardSection"));
    v104 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v287 = (void *)v104;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v105 = -[_SFPBInfoCardSection initWithDictionary:]([_SFPBInfoCardSection alloc], "initWithDictionary:", v104);
      -[_SFPBCardSectionValue setInfoCardSection:](v5, "setInfoCardSection:", v105);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("collectionCardSection"));
    v106 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v286 = (void *)v106;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v107 = -[_SFPBCollectionCardSection initWithDictionary:]([_SFPBCollectionCardSection alloc], "initWithDictionary:", v106);
      -[_SFPBCardSectionValue setCollectionCardSection:](v5, "setCollectionCardSection:", v107);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("combinedCardSection"));
    v108 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v285 = (void *)v108;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v109 = -[_SFPBCombinedCardSection initWithDictionary:]([_SFPBCombinedCardSection alloc], "initWithDictionary:", v108);
      -[_SFPBCardSectionValue setCombinedCardSection:](v5, "setCombinedCardSection:", v109);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("responseWrapperCardSection"));
    v110 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v284 = (void *)v110;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v111 = -[_SFPBResponseWrapperCardSection initWithDictionary:]([_SFPBResponseWrapperCardSection alloc], "initWithDictionary:", v110);
      -[_SFPBCardSectionValue setResponseWrapperCardSection:](v5, "setResponseWrapperCardSection:", v111);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("listenToCardSection"));
    v112 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v283 = (void *)v112;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v113 = -[_SFPBListenToCardSection initWithDictionary:]([_SFPBListenToCardSection alloc], "initWithDictionary:", v112);
      -[_SFPBCardSectionValue setListenToCardSection:](v5, "setListenToCardSection:", v113);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("watchNowCardSection"));
    v114 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v282 = (void *)v114;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v115 = -[_SFPBWatchNowCardSection initWithDictionary:]([_SFPBWatchNowCardSection alloc], "initWithDictionary:", v114);
      -[_SFPBCardSectionValue setWatchNowCardSection:](v5, "setWatchNowCardSection:", v115);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("strokeAnimationCardSection"));
    v116 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v281 = (void *)v116;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v117 = -[_SFPBStrokeAnimationCardSection initWithDictionary:]([_SFPBStrokeAnimationCardSection alloc], "initWithDictionary:", v116);
      -[_SFPBCardSectionValue setStrokeAnimationCardSection:](v5, "setStrokeAnimationCardSection:", v117);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("buttonListCardSection"));
    v118 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v280 = (void *)v118;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v119 = -[_SFPBButtonListCardSection initWithDictionary:]([_SFPBButtonListCardSection alloc], "initWithDictionary:", v118);
      -[_SFPBCardSectionValue setButtonListCardSection:](v5, "setButtonListCardSection:", v119);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("commandRowCardSection"));
    v120 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v279 = (void *)v120;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v121 = -[_SFPBCommandRowCardSection initWithDictionary:]([_SFPBCommandRowCardSection alloc], "initWithDictionary:", v120);
      -[_SFPBCardSectionValue setCommandRowCardSection:](v5, "setCommandRowCardSection:", v121);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("leadingTrailingCardSection"));
    v122 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v278 = (void *)v122;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v123 = -[_SFPBLeadingTrailingCardSection initWithDictionary:]([_SFPBLeadingTrailingCardSection alloc], "initWithDictionary:", v122);
      -[_SFPBCardSectionValue setLeadingTrailingCardSection:](v5, "setLeadingTrailingCardSection:", v123);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("heroTitleCardSection"));
    v124 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v277 = (void *)v124;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v125 = -[_SFPBHeroTitleCardSection initWithDictionary:]([_SFPBHeroTitleCardSection alloc], "initWithDictionary:", v124);
      -[_SFPBCardSectionValue setHeroTitleCardSection:](v5, "setHeroTitleCardSection:", v125);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("archiveViewCardSection"));
    v126 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v276 = (void *)v126;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v127 = -[_SFPBArchiveViewCardSection initWithDictionary:]([_SFPBArchiveViewCardSection alloc], "initWithDictionary:", v126);
      -[_SFPBCardSectionValue setArchiveViewCardSection:](v5, "setArchiveViewCardSection:", v127);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appIconCardSection"));
    v128 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v275 = (void *)v128;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v129 = -[_SFPBAppIconCardSection initWithDictionary:]([_SFPBAppIconCardSection alloc], "initWithDictionary:", v128);
      -[_SFPBCardSectionValue setAppIconCardSection:](v5, "setAppIconCardSection:", v129);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("largeTitleDetailedRowCardSection"));
    v130 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v274 = (void *)v130;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v131 = -[_SFPBLargeTitleDetailedRowCardSection initWithDictionary:]([_SFPBLargeTitleDetailedRowCardSection alloc], "initWithDictionary:", v130);
      -[_SFPBCardSectionValue setLargeTitleDetailedRowCardSection:](v5, "setLargeTitleDetailedRowCardSection:", v131);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("safariTableOfContentsCardSection"));
    v132 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v273 = (void *)v132;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v133 = -[_SFPBSafariTableOfContentsCardSection initWithDictionary:]([_SFPBSafariTableOfContentsCardSection alloc], "initWithDictionary:", v132);
      -[_SFPBCardSectionValue setSafariTableOfContentsCardSection:](v5, "setSafariTableOfContentsCardSection:", v133);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rfSummaryItemShortNumberCardSection"));
    v134 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v272 = (void *)v134;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v135 = -[_SFPBRFSummaryItemShortNumberCardSection initWithDictionary:]([_SFPBRFSummaryItemShortNumberCardSection alloc], "initWithDictionary:", v134);
      -[_SFPBCardSectionValue setRfSummaryItemShortNumberCardSection:](v5, "setRfSummaryItemShortNumberCardSection:", v135);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rfSummaryItemTextCardSection"));
    v136 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v271 = (void *)v136;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v137 = -[_SFPBRFSummaryItemTextCardSection initWithDictionary:]([_SFPBRFSummaryItemTextCardSection alloc], "initWithDictionary:", v136);
      -[_SFPBCardSectionValue setRfSummaryItemTextCardSection:](v5, "setRfSummaryItemTextCardSection:", v137);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rfSummaryItemStandardCardSection"));
    v138 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v270 = (void *)v138;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v139 = -[_SFPBRFSummaryItemStandardCardSection initWithDictionary:]([_SFPBRFSummaryItemStandardCardSection alloc], "initWithDictionary:", v138);
      -[_SFPBCardSectionValue setRfSummaryItemStandardCardSection:](v5, "setRfSummaryItemStandardCardSection:", v139);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rfFactItemShortNumberCardSection"));
    v140 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v269 = (void *)v140;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v141 = -[_SFPBRFFactItemShortNumberCardSection initWithDictionary:]([_SFPBRFFactItemShortNumberCardSection alloc], "initWithDictionary:", v140);
      -[_SFPBCardSectionValue setRfFactItemShortNumberCardSection:](v5, "setRfFactItemShortNumberCardSection:", v141);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rfFactItemStandardCardSection"));
    v142 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v268 = (void *)v142;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v143 = -[_SFPBRFFactItemStandardCardSection initWithDictionary:]([_SFPBRFFactItemStandardCardSection alloc], "initWithDictionary:", v142);
      -[_SFPBCardSectionValue setRfFactItemStandardCardSection:](v5, "setRfFactItemStandardCardSection:", v143);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rfLongItemStandardCardSection"));
    v144 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v267 = (void *)v144;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v145 = -[_SFPBRFLongItemStandardCardSection initWithDictionary:]([_SFPBRFLongItemStandardCardSection alloc], "initWithDictionary:", v144);
      -[_SFPBCardSectionValue setRfLongItemStandardCardSection:](v5, "setRfLongItemStandardCardSection:", v145);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rfPrimaryHeaderRichCardSection"));
    v146 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v266 = (void *)v146;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v147 = -[_SFPBRFPrimaryHeaderRichCardSection initWithDictionary:]([_SFPBRFPrimaryHeaderRichCardSection alloc], "initWithDictionary:", v146);
      -[_SFPBCardSectionValue setRfPrimaryHeaderRichCardSection:](v5, "setRfPrimaryHeaderRichCardSection:", v147);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rfPrimaryHeaderStandardCardSection"));
    v148 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v265 = (void *)v148;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v149 = -[_SFPBRFPrimaryHeaderStandardCardSection initWithDictionary:]([_SFPBRFPrimaryHeaderStandardCardSection alloc], "initWithDictionary:", v148);
      -[_SFPBCardSectionValue setRfPrimaryHeaderStandardCardSection:](v5, "setRfPrimaryHeaderStandardCardSection:", v149);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rfReferenceFootnoteCardSection"));
    v150 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v264 = (void *)v150;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v151 = -[_SFPBRFReferenceFootnoteCardSection initWithDictionary:]([_SFPBRFReferenceFootnoteCardSection alloc], "initWithDictionary:", v150);
      -[_SFPBCardSectionValue setRfReferenceFootnoteCardSection:](v5, "setRfReferenceFootnoteCardSection:", v151);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rfReferenceRichCardSection"));
    v152 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v263 = (void *)v152;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v153 = -[_SFPBRFReferenceRichCardSection initWithDictionary:]([_SFPBRFReferenceRichCardSection alloc], "initWithDictionary:", v152);
      -[_SFPBCardSectionValue setRfReferenceRichCardSection:](v5, "setRfReferenceRichCardSection:", v153);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rfSimpleItemRichCardSection"));
    v154 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v262 = (void *)v154;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v155 = -[_SFPBRFSimpleItemRichCardSection initWithDictionary:]([_SFPBRFSimpleItemRichCardSection alloc], "initWithDictionary:", v154);
      -[_SFPBCardSectionValue setRfSimpleItemRichCardSection:](v5, "setRfSimpleItemRichCardSection:", v155);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rfSimpleItemStandardCardSection"));
    v156 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v261 = (void *)v156;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v157 = -[_SFPBRFSimpleItemStandardCardSection initWithDictionary:]([_SFPBRFSimpleItemStandardCardSection alloc], "initWithDictionary:", v156);
      -[_SFPBCardSectionValue setRfSimpleItemStandardCardSection:](v5, "setRfSimpleItemStandardCardSection:", v157);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rfSummaryItemAlignedTextCardSection"));
    v158 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v260 = (void *)v158;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v159 = -[_SFPBRFSummaryItemAlignedTextCardSection initWithDictionary:]([_SFPBRFSummaryItemAlignedTextCardSection alloc], "initWithDictionary:", v158);
      -[_SFPBCardSectionValue setRfSummaryItemAlignedTextCardSection:](v5, "setRfSummaryItemAlignedTextCardSection:", v159);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rfExpandableStandardCardSection"));
    v160 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v259 = (void *)v160;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v161 = -[_SFPBRFExpandableStandardCardSection initWithDictionary:]([_SFPBRFExpandableStandardCardSection alloc], "initWithDictionary:", v160);
      -[_SFPBCardSectionValue setRfExpandableStandardCardSection:](v5, "setRfExpandableStandardCardSection:", v161);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rfFactItemButtonCardSection"));
    v162 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v258 = (void *)v162;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v163 = -[_SFPBRFFactItemButtonCardSection initWithDictionary:]([_SFPBRFFactItemButtonCardSection alloc], "initWithDictionary:", v162);
      -[_SFPBCardSectionValue setRfFactItemButtonCardSection:](v5, "setRfFactItemButtonCardSection:", v163);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rfFactItemHeroNumberCardSection"));
    v164 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v257 = (void *)v164;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v165 = -[_SFPBRFFactItemHeroNumberCardSection initWithDictionary:]([_SFPBRFFactItemHeroNumberCardSection alloc], "initWithDictionary:", v164);
      -[_SFPBCardSectionValue setRfFactItemHeroNumberCardSection:](v5, "setRfFactItemHeroNumberCardSection:", v165);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rfPrimaryHeaderMarqueeCardSection"));
    v166 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v256 = (void *)v166;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v167 = -[_SFPBRFPrimaryHeaderMarqueeCardSection initWithDictionary:]([_SFPBRFPrimaryHeaderMarqueeCardSection alloc], "initWithDictionary:", v166);
      -[_SFPBCardSectionValue setRfPrimaryHeaderMarqueeCardSection:](v5, "setRfPrimaryHeaderMarqueeCardSection:", v167);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rfSummaryItemDetailedTextCardSection"));
    v168 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v255 = (void *)v168;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v169 = -[_SFPBRFSummaryItemDetailedTextCardSection initWithDictionary:]([_SFPBRFSummaryItemDetailedTextCardSection alloc], "initWithDictionary:", v168);
      -[_SFPBCardSectionValue setRfSummaryItemDetailedTextCardSection:](v5, "setRfSummaryItemDetailedTextCardSection:", v169);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rfSimpleItemPlayerCardSection"));
    v170 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v254 = (void *)v170;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v171 = -[_SFPBRFSimpleItemPlayerCardSection initWithDictionary:]([_SFPBRFSimpleItemPlayerCardSection alloc], "initWithDictionary:", v170);
      -[_SFPBCardSectionValue setRfSimpleItemPlayerCardSection:](v5, "setRfSimpleItemPlayerCardSection:", v171);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rfSummaryItemPairCardSection"));
    v172 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v253 = (void *)v172;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v173 = -[_SFPBRFSummaryItemPairCardSection initWithDictionary:]([_SFPBRFSummaryItemPairCardSection alloc], "initWithDictionary:", v172);
      -[_SFPBCardSectionValue setRfSummaryItemPairCardSection:](v5, "setRfSummaryItemPairCardSection:", v173);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rfSummaryItemPairNumberCardSection"));
    v174 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v252 = (void *)v174;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v175 = -[_SFPBRFSummaryItemPairNumberCardSection initWithDictionary:]([_SFPBRFSummaryItemPairNumberCardSection alloc], "initWithDictionary:", v174);
      -[_SFPBCardSectionValue setRfSummaryItemPairNumberCardSection:](v5, "setRfSummaryItemPairNumberCardSection:", v175);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rfFactItemShortHeroNumberCardSection"));
    v176 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v251 = (void *)v176;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v177 = -[_SFPBRFFactItemShortHeroNumberCardSection initWithDictionary:]([_SFPBRFFactItemShortHeroNumberCardSection alloc], "initWithDictionary:", v176);
      -[_SFPBCardSectionValue setRfFactItemShortHeroNumberCardSection:](v5, "setRfFactItemShortHeroNumberCardSection:", v177);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rfFactItemDetailedNumberCardSection"));
    v178 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v250 = (void *)v178;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v179 = -[_SFPBRFFactItemDetailedNumberCardSection initWithDictionary:]([_SFPBRFFactItemDetailedNumberCardSection alloc], "initWithDictionary:", v178);
      -[_SFPBCardSectionValue setRfFactItemDetailedNumberCardSection:](v5, "setRfFactItemDetailedNumberCardSection:", v179);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rfFactItemHeroButtonCardSection"));
    v180 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v249 = (void *)v180;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v181 = -[_SFPBRFFactItemHeroButtonCardSection initWithDictionary:]([_SFPBRFFactItemHeroButtonCardSection alloc], "initWithDictionary:", v180);
      -[_SFPBCardSectionValue setRfFactItemHeroButtonCardSection:](v5, "setRfFactItemHeroButtonCardSection:", v181);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rfFactItemImageRightCardSection"));
    v182 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v248 = (void *)v182;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v183 = -[_SFPBRFFactItemImageRightCardSection initWithDictionary:]([_SFPBRFFactItemImageRightCardSection alloc], "initWithDictionary:", v182);
      -[_SFPBCardSectionValue setRfFactItemImageRightCardSection:](v5, "setRfFactItemImageRightCardSection:", v183);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rfSummaryItemSwitchV2CardSection"));
    v184 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v247 = (void *)v184;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v185 = -[_SFPBRFSummaryItemSwitchV2CardSection initWithDictionary:]([_SFPBRFSummaryItemSwitchV2CardSection alloc], "initWithDictionary:", v184);
      -[_SFPBCardSectionValue setRfSummaryItemSwitchV2CardSection:](v5, "setRfSummaryItemSwitchV2CardSection:", v185);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rfTableHeaderCardSection"));
    v186 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v246 = (void *)v186;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v187 = -[_SFPBRFTableHeaderCardSection initWithDictionary:]([_SFPBRFTableHeaderCardSection alloc], "initWithDictionary:", v186);
      -[_SFPBCardSectionValue setRfTableHeaderCardSection:](v5, "setRfTableHeaderCardSection:", v187);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rfTableRowCardSection"));
    v188 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v245 = (void *)v188;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v189 = -[_SFPBRFTableRowCardSection initWithDictionary:]([_SFPBRFTableRowCardSection alloc], "initWithDictionary:", v188);
      -[_SFPBCardSectionValue setRfTableRowCardSection:](v5, "setRfTableRowCardSection:", v189);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rfSimpleItemVisualElementCardSection"));
    v190 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v244 = (void *)v190;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v191 = -[_SFPBRFSimpleItemVisualElementCardSection initWithDictionary:]([_SFPBRFSimpleItemVisualElementCardSection alloc], "initWithDictionary:", v190);
      -[_SFPBCardSectionValue setRfSimpleItemVisualElementCardSection:](v5, "setRfSimpleItemVisualElementCardSection:", v191);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rfSummaryItemPlayerCardSection"));
    v192 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v243 = (void *)v192;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v193 = -[_SFPBRFSummaryItemPlayerCardSection initWithDictionary:]([_SFPBRFSummaryItemPlayerCardSection alloc], "initWithDictionary:", v192);
      -[_SFPBCardSectionValue setRfSummaryItemPlayerCardSection:](v5, "setRfSummaryItemPlayerCardSection:", v193);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rfSummaryItemImageRightCardSection"));
    v194 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v242 = (void *)v194;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v195 = -[_SFPBRFSummaryItemImageRightCardSection initWithDictionary:]([_SFPBRFSummaryItemImageRightCardSection alloc], "initWithDictionary:", v194);
      -[_SFPBCardSectionValue setRfSummaryItemImageRightCardSection:](v5, "setRfSummaryItemImageRightCardSection:", v195);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rfSummaryItemButtonCardSection"));
    v196 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v241 = (void *)v196;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v197 = -[_SFPBRFSummaryItemButtonCardSection initWithDictionary:]([_SFPBRFSummaryItemButtonCardSection alloc], "initWithDictionary:", v196);
      -[_SFPBCardSectionValue setRfSummaryItemButtonCardSection:](v5, "setRfSummaryItemButtonCardSection:", v197);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rfSimpleItemReverseRichCardSection"));
    v198 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v240 = (void *)v198;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v199 = -[_SFPBRFSimpleItemReverseRichCardSection initWithDictionary:]([_SFPBRFSimpleItemReverseRichCardSection alloc], "initWithDictionary:", v198);
      -[_SFPBCardSectionValue setRfSimpleItemReverseRichCardSection:](v5, "setRfSimpleItemReverseRichCardSection:", v199);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rfSimpleItemRichSearchResultCardSection"));
    v200 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v239 = (void *)v200;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v201 = -[_SFPBRFSimpleItemRichSearchResultCardSection initWithDictionary:]([_SFPBRFSimpleItemRichSearchResultCardSection alloc], "initWithDictionary:", v200);
      -[_SFPBCardSectionValue setRfSimpleItemRichSearchResultCardSection:](v5, "setRfSimpleItemRichSearchResultCardSection:", v201);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rfPrimaryHeaderStackedImageCardSection"));
    v202 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v238 = (void *)v202;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v203 = -[_SFPBRFPrimaryHeaderStackedImageCardSection initWithDictionary:]([_SFPBRFPrimaryHeaderStackedImageCardSection alloc], "initWithDictionary:", v202);
      -[_SFPBCardSectionValue setRfPrimaryHeaderStackedImageCardSection:](v5, "setRfPrimaryHeaderStackedImageCardSection:", v203);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rfReferenceItemLogoCardSection"));
    v204 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v237 = (void *)v204;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v205 = -[_SFPBRFReferenceItemLogoCardSection initWithDictionary:]([_SFPBRFReferenceItemLogoCardSection alloc], "initWithDictionary:", v204);
      -[_SFPBCardSectionValue setRfReferenceItemLogoCardSection:](v5, "setRfReferenceItemLogoCardSection:", v205);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rfReferenceItemButtonCardSection"));
    v206 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v236 = (void *)v206;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v207 = -[_SFPBRFReferenceItemButtonCardSection initWithDictionary:]([_SFPBRFReferenceItemButtonCardSection alloc], "initWithDictionary:", v206);
      -[_SFPBCardSectionValue setRfReferenceItemButtonCardSection:](v5, "setRfReferenceItemButtonCardSection:", v207);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rfButtonCardSection"));
    v208 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v235 = (void *)v208;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v209 = -[_SFPBRFButtonCardSection initWithDictionary:]([_SFPBRFButtonCardSection alloc], "initWithDictionary:", v208);
      -[_SFPBCardSectionValue setRfButtonCardSection:](v5, "setRfButtonCardSection:", v209);

    }
    v229 = (void *)v16;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rfBinaryButtonCardSection"));
    v210 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v211 = -[_SFPBRFBinaryButtonCardSection initWithDictionary:]([_SFPBRFBinaryButtonCardSection alloc], "initWithDictionary:", v210);
      -[_SFPBCardSectionValue setRfBinaryButtonCardSection:](v5, "setRfBinaryButtonCardSection:", v211);

    }
    v234 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rfReferenceCenteredCardSection"), v210);
    v212 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v213 = -[_SFPBRFReferenceCenteredCardSection initWithDictionary:]([_SFPBRFReferenceCenteredCardSection alloc], "initWithDictionary:", v212);
      -[_SFPBCardSectionValue setRfReferenceCenteredCardSection:](v5, "setRfReferenceCenteredCardSection:", v213);

    }
    v233 = (void *)v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rfSecondaryHeaderStandardCardSection"));
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v215 = -[_SFPBRFSecondaryHeaderStandardCardSection initWithDictionary:]([_SFPBRFSecondaryHeaderStandardCardSection alloc], "initWithDictionary:", v214);
      -[_SFPBCardSectionValue setRfSecondaryHeaderStandardCardSection:](v5, "setRfSecondaryHeaderStandardCardSection:", v215);

    }
    v232 = (void *)v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rfSecondaryHeaderEmphasizedCardSection"));
    v216 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v217 = -[_SFPBRFSecondaryHeaderEmphasizedCardSection initWithDictionary:]([_SFPBRFSecondaryHeaderEmphasizedCardSection alloc], "initWithDictionary:", v216);
      -[_SFPBCardSectionValue setRfSecondaryHeaderEmphasizedCardSection:](v5, "setRfSecondaryHeaderEmphasizedCardSection:", v217);

    }
    v231 = (void *)v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rfMapCardSection"));
    v218 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v219 = -[_SFPBRFMapCardSection initWithDictionary:]([_SFPBRFMapCardSection alloc], "initWithDictionary:", v218);
      -[_SFPBCardSectionValue setRfMapCardSection:](v5, "setRfMapCardSection:", v219);

    }
    v230 = (void *)v14;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rfReferenceStandardCardSection"));
    v220 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v221 = -[_SFPBRFReferenceStandardCardSection initWithDictionary:]([_SFPBRFReferenceStandardCardSection alloc], "initWithDictionary:", v220);
      -[_SFPBCardSectionValue setRfReferenceStandardCardSection:](v5, "setRfReferenceStandardCardSection:", v221);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rfMultiButtonCardSection"));
    v222 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v223 = -[_SFPBRFMultiButtonCardSection initWithDictionary:]([_SFPBRFMultiButtonCardSection alloc], "initWithDictionary:", v222);
      -[_SFPBCardSectionValue setRfMultiButtonCardSection:](v5, "setRfMultiButtonCardSection:", v223);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rfDisambiguationTitleCardSection"));
    v224 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v225 = -[_SFPBRFDisambiguationTitleCardSection initWithDictionary:]([_SFPBRFDisambiguationTitleCardSection alloc], "initWithDictionary:", v224);
      -[_SFPBCardSectionValue setRfDisambiguationTitleCardSection:](v5, "setRfDisambiguationTitleCardSection:", v225);

    }
    v226 = v5;

  }
  return v5;
}

- (_SFPBAppLinkCardSection)appLinkCardSection
{
  return self->_appLinkCardSection;
}

- (_SFPBDescriptionCardSection)descriptionCardSection
{
  return self->_descriptionCardSection;
}

- (_SFPBKeyValueDataCardSection)keyValueDataCardSection
{
  return self->_keyValueDataCardSection;
}

- (_SFPBMapCardSection)mapCardSection
{
  return self->_mapCardSection;
}

- (_SFPBMediaInfoCardSection)mediaInfoCardSection
{
  return self->_mediaInfoCardSection;
}

- (_SFPBMediaPlayerCardSection)mediaPlayerCardSection
{
  return self->_mediaPlayerCardSection;
}

- (_SFPBNowPlayingCardSection)nowPlayingCardSection
{
  return self->_nowPlayingCardSection;
}

- (_SFPBRichTitleCardSection)richTitleCardSection
{
  return self->_richTitleCardSection;
}

- (_SFPBRowCardSection)rowCardSection
{
  return self->_rowCardSection;
}

- (_SFPBScoreboardCardSection)scoreboardCardSection
{
  return self->_scoreboardCardSection;
}

- (_SFPBSocialMediaPostCardSection)socialMediaPostCardSection
{
  return self->_socialMediaPostCardSection;
}

- (_SFPBStockChartCardSection)stockChartCardSection
{
  return self->_stockChartCardSection;
}

- (_SFPBTableHeaderRowCardSection)tableHeaderRowCardSection
{
  return self->_tableHeaderRowCardSection;
}

- (_SFPBTableRowCardSection)tableRowCardSection
{
  return self->_tableRowCardSection;
}

- (_SFPBTextColumnsCardSection)textColumnsCardSection
{
  return self->_textColumnsCardSection;
}

- (_SFPBTitleCardSection)titleCardSection
{
  return self->_titleCardSection;
}

- (_SFPBTrackListCardSection)trackListCardSection
{
  return self->_trackListCardSection;
}

- (_SFPBAudioPlaybackCardSection)audioPlaybackCardSection
{
  return self->_audioPlaybackCardSection;
}

- (_SFPBFlightCardSection)flightCardSection
{
  return self->_flightCardSection;
}

- (_SFPBActivityIndicatorCardSection)activityIndicatorCardSection
{
  return self->_activityIndicatorCardSection;
}

- (_SFPBWebCardSection)webCardSection
{
  return self->_webCardSection;
}

- (_SFPBMessageCardSection)messageCardSection
{
  return self->_messageCardSection;
}

- (_SFPBDetailedRowCardSection)detailedRowCardSection
{
  return self->_detailedRowCardSection;
}

- (_SFPBImagesCardSection)imagesCardSection
{
  return self->_imagesCardSection;
}

- (_SFPBSuggestionCardSection)suggestionCardSection
{
  return self->_suggestionCardSection;
}

- (_SFPBSelectableGridCardSection)selectableGridCardSection
{
  return self->_selectableGridCardSection;
}

- (_SFPBSectionHeaderCardSection)sectionHeaderCardSection
{
  return self->_sectionHeaderCardSection;
}

- (_SFPBMetaInfoCardSection)metaInfoCardSection
{
  return self->_metaInfoCardSection;
}

- (_SFPBWatchListCardSection)watchListCardSection
{
  return self->_watchListCardSection;
}

- (_SFPBMapsDetailedRowCardSection)mapsDetailedRowCardSection
{
  return self->_mapsDetailedRowCardSection;
}

- (_SFPBButtonCardSection)buttonCardSection
{
  return self->_buttonCardSection;
}

- (_SFPBHorizontalButtonCardSection)horizontalButtonCardSection
{
  return self->_horizontalButtonCardSection;
}

- (_SFPBVerticalLayoutCardSection)verticalLayoutCardSection
{
  return self->_verticalLayoutCardSection;
}

- (_SFPBProductCardSection)productCardSection
{
  return self->_productCardSection;
}

- (_SFPBHorizontalScrollCardSection)horizontalScrollCardSection
{
  return self->_horizontalScrollCardSection;
}

- (_SFPBMediaRemoteControlCardSection)mediaRemoteControlCardSection
{
  return self->_mediaRemoteControlCardSection;
}

- (_SFPBMapPlaceCardSection)mapPlaceCardSection
{
  return self->_mapPlaceCardSection;
}

- (_SFPBCompactRowCardSection)compactRowCardSection
{
  return self->_compactRowCardSection;
}

- (_SFPBWorldMapCardSection)worldMapCardSection
{
  return self->_worldMapCardSection;
}

- (_SFPBAttributionFooterCardSection)attributionFooterCardSection
{
  return self->_attributionFooterCardSection;
}

- (_SFPBGridCardSection)gridCardSection
{
  return self->_gridCardSection;
}

- (_SFPBPersonHeaderCardSection)personHeaderCardSection
{
  return self->_personHeaderCardSection;
}

- (_SFPBColorBarCardSection)colorBarCardSection
{
  return self->_colorBarCardSection;
}

- (_SFPBSplitCardSection)splitCardSection
{
  return self->_splitCardSection;
}

- (_SFPBLinkPresentationCardSection)linkPresentationCardSection
{
  return self->_linkPresentationCardSection;
}

- (_SFPBFindMyCardSection)findMyCardSection
{
  return self->_findMyCardSection;
}

- (_SFPBHeroCardSection)heroCardSection
{
  return self->_heroCardSection;
}

- (_SFPBNewsCardSection)newsCardSection
{
  return self->_newsCardSection;
}

- (_SFPBMiniCardSection)miniCardSection
{
  return self->_miniCardSection;
}

- (_SFPBInfoCardSection)infoCardSection
{
  return self->_infoCardSection;
}

- (_SFPBCollectionCardSection)collectionCardSection
{
  return self->_collectionCardSection;
}

- (_SFPBCombinedCardSection)combinedCardSection
{
  return self->_combinedCardSection;
}

- (_SFPBResponseWrapperCardSection)responseWrapperCardSection
{
  return self->_responseWrapperCardSection;
}

- (_SFPBListenToCardSection)listenToCardSection
{
  return self->_listenToCardSection;
}

- (_SFPBWatchNowCardSection)watchNowCardSection
{
  return self->_watchNowCardSection;
}

- (_SFPBStrokeAnimationCardSection)strokeAnimationCardSection
{
  return self->_strokeAnimationCardSection;
}

- (_SFPBButtonListCardSection)buttonListCardSection
{
  return self->_buttonListCardSection;
}

- (_SFPBCommandRowCardSection)commandRowCardSection
{
  return self->_commandRowCardSection;
}

- (_SFPBLeadingTrailingCardSection)leadingTrailingCardSection
{
  return self->_leadingTrailingCardSection;
}

- (_SFPBHeroTitleCardSection)heroTitleCardSection
{
  return self->_heroTitleCardSection;
}

- (_SFPBArchiveViewCardSection)archiveViewCardSection
{
  return self->_archiveViewCardSection;
}

- (_SFPBAppIconCardSection)appIconCardSection
{
  return self->_appIconCardSection;
}

- (_SFPBLargeTitleDetailedRowCardSection)largeTitleDetailedRowCardSection
{
  return self->_largeTitleDetailedRowCardSection;
}

- (_SFPBSafariTableOfContentsCardSection)safariTableOfContentsCardSection
{
  return self->_safariTableOfContentsCardSection;
}

- (_SFPBRFSummaryItemShortNumberCardSection)rfSummaryItemShortNumberCardSection
{
  return self->_rfSummaryItemShortNumberCardSection;
}

- (_SFPBRFSummaryItemTextCardSection)rfSummaryItemTextCardSection
{
  return self->_rfSummaryItemTextCardSection;
}

- (_SFPBRFSummaryItemStandardCardSection)rfSummaryItemStandardCardSection
{
  return self->_rfSummaryItemStandardCardSection;
}

- (_SFPBRFFactItemShortNumberCardSection)rfFactItemShortNumberCardSection
{
  return self->_rfFactItemShortNumberCardSection;
}

- (_SFPBRFFactItemStandardCardSection)rfFactItemStandardCardSection
{
  return self->_rfFactItemStandardCardSection;
}

- (_SFPBRFLongItemStandardCardSection)rfLongItemStandardCardSection
{
  return self->_rfLongItemStandardCardSection;
}

- (_SFPBRFPrimaryHeaderRichCardSection)rfPrimaryHeaderRichCardSection
{
  return self->_rfPrimaryHeaderRichCardSection;
}

- (_SFPBRFPrimaryHeaderStandardCardSection)rfPrimaryHeaderStandardCardSection
{
  return self->_rfPrimaryHeaderStandardCardSection;
}

- (_SFPBRFReferenceFootnoteCardSection)rfReferenceFootnoteCardSection
{
  return self->_rfReferenceFootnoteCardSection;
}

- (_SFPBRFReferenceRichCardSection)rfReferenceRichCardSection
{
  return self->_rfReferenceRichCardSection;
}

- (_SFPBRFSimpleItemRichCardSection)rfSimpleItemRichCardSection
{
  return self->_rfSimpleItemRichCardSection;
}

- (_SFPBRFSimpleItemStandardCardSection)rfSimpleItemStandardCardSection
{
  return self->_rfSimpleItemStandardCardSection;
}

- (_SFPBRFSummaryItemAlignedTextCardSection)rfSummaryItemAlignedTextCardSection
{
  return self->_rfSummaryItemAlignedTextCardSection;
}

- (_SFPBRFExpandableStandardCardSection)rfExpandableStandardCardSection
{
  return self->_rfExpandableStandardCardSection;
}

- (_SFPBRFFactItemButtonCardSection)rfFactItemButtonCardSection
{
  return self->_rfFactItemButtonCardSection;
}

- (_SFPBRFFactItemHeroNumberCardSection)rfFactItemHeroNumberCardSection
{
  return self->_rfFactItemHeroNumberCardSection;
}

- (_SFPBRFPrimaryHeaderMarqueeCardSection)rfPrimaryHeaderMarqueeCardSection
{
  return self->_rfPrimaryHeaderMarqueeCardSection;
}

- (_SFPBRFSummaryItemDetailedTextCardSection)rfSummaryItemDetailedTextCardSection
{
  return self->_rfSummaryItemDetailedTextCardSection;
}

- (_SFPBRFSimpleItemPlayerCardSection)rfSimpleItemPlayerCardSection
{
  return self->_rfSimpleItemPlayerCardSection;
}

- (_SFPBRFSummaryItemPairCardSection)rfSummaryItemPairCardSection
{
  return self->_rfSummaryItemPairCardSection;
}

- (_SFPBRFSummaryItemPairNumberCardSection)rfSummaryItemPairNumberCardSection
{
  return self->_rfSummaryItemPairNumberCardSection;
}

- (_SFPBRFFactItemShortHeroNumberCardSection)rfFactItemShortHeroNumberCardSection
{
  return self->_rfFactItemShortHeroNumberCardSection;
}

- (_SFPBRFFactItemDetailedNumberCardSection)rfFactItemDetailedNumberCardSection
{
  return self->_rfFactItemDetailedNumberCardSection;
}

- (_SFPBRFFactItemHeroButtonCardSection)rfFactItemHeroButtonCardSection
{
  return self->_rfFactItemHeroButtonCardSection;
}

- (_SFPBRFFactItemImageRightCardSection)rfFactItemImageRightCardSection
{
  return self->_rfFactItemImageRightCardSection;
}

- (_SFPBRFSummaryItemSwitchV2CardSection)rfSummaryItemSwitchV2CardSection
{
  return self->_rfSummaryItemSwitchV2CardSection;
}

- (_SFPBRFTableHeaderCardSection)rfTableHeaderCardSection
{
  return self->_rfTableHeaderCardSection;
}

- (_SFPBRFTableRowCardSection)rfTableRowCardSection
{
  return self->_rfTableRowCardSection;
}

- (_SFPBRFSimpleItemVisualElementCardSection)rfSimpleItemVisualElementCardSection
{
  return self->_rfSimpleItemVisualElementCardSection;
}

- (_SFPBRFSummaryItemPlayerCardSection)rfSummaryItemPlayerCardSection
{
  return self->_rfSummaryItemPlayerCardSection;
}

- (_SFPBRFSummaryItemImageRightCardSection)rfSummaryItemImageRightCardSection
{
  return self->_rfSummaryItemImageRightCardSection;
}

- (_SFPBRFSummaryItemButtonCardSection)rfSummaryItemButtonCardSection
{
  return self->_rfSummaryItemButtonCardSection;
}

- (_SFPBRFSimpleItemReverseRichCardSection)rfSimpleItemReverseRichCardSection
{
  return self->_rfSimpleItemReverseRichCardSection;
}

- (_SFPBRFSimpleItemRichSearchResultCardSection)rfSimpleItemRichSearchResultCardSection
{
  return self->_rfSimpleItemRichSearchResultCardSection;
}

- (_SFPBRFPrimaryHeaderStackedImageCardSection)rfPrimaryHeaderStackedImageCardSection
{
  return self->_rfPrimaryHeaderStackedImageCardSection;
}

- (_SFPBRFReferenceItemLogoCardSection)rfReferenceItemLogoCardSection
{
  return self->_rfReferenceItemLogoCardSection;
}

- (_SFPBRFReferenceItemButtonCardSection)rfReferenceItemButtonCardSection
{
  return self->_rfReferenceItemButtonCardSection;
}

- (_SFPBRFButtonCardSection)rfButtonCardSection
{
  return self->_rfButtonCardSection;
}

- (_SFPBRFBinaryButtonCardSection)rfBinaryButtonCardSection
{
  return self->_rfBinaryButtonCardSection;
}

- (_SFPBRFReferenceCenteredCardSection)rfReferenceCenteredCardSection
{
  return self->_rfReferenceCenteredCardSection;
}

- (_SFPBRFSecondaryHeaderStandardCardSection)rfSecondaryHeaderStandardCardSection
{
  return self->_rfSecondaryHeaderStandardCardSection;
}

- (_SFPBRFSecondaryHeaderEmphasizedCardSection)rfSecondaryHeaderEmphasizedCardSection
{
  return self->_rfSecondaryHeaderEmphasizedCardSection;
}

- (_SFPBRFMapCardSection)rfMapCardSection
{
  return self->_rfMapCardSection;
}

- (_SFPBRFReferenceStandardCardSection)rfReferenceStandardCardSection
{
  return self->_rfReferenceStandardCardSection;
}

- (_SFPBRFMultiButtonCardSection)rfMultiButtonCardSection
{
  return self->_rfMultiButtonCardSection;
}

- (_SFPBRFDisambiguationTitleCardSection)rfDisambiguationTitleCardSection
{
  return self->_rfDisambiguationTitleCardSection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rfDisambiguationTitleCardSection, 0);
  objc_storeStrong((id *)&self->_rfMultiButtonCardSection, 0);
  objc_storeStrong((id *)&self->_rfReferenceStandardCardSection, 0);
  objc_storeStrong((id *)&self->_rfMapCardSection, 0);
  objc_storeStrong((id *)&self->_rfSecondaryHeaderEmphasizedCardSection, 0);
  objc_storeStrong((id *)&self->_rfSecondaryHeaderStandardCardSection, 0);
  objc_storeStrong((id *)&self->_rfReferenceCenteredCardSection, 0);
  objc_storeStrong((id *)&self->_rfBinaryButtonCardSection, 0);
  objc_storeStrong((id *)&self->_rfButtonCardSection, 0);
  objc_storeStrong((id *)&self->_rfReferenceItemButtonCardSection, 0);
  objc_storeStrong((id *)&self->_rfReferenceItemLogoCardSection, 0);
  objc_storeStrong((id *)&self->_rfPrimaryHeaderStackedImageCardSection, 0);
  objc_storeStrong((id *)&self->_rfSimpleItemRichSearchResultCardSection, 0);
  objc_storeStrong((id *)&self->_rfSimpleItemReverseRichCardSection, 0);
  objc_storeStrong((id *)&self->_rfSummaryItemButtonCardSection, 0);
  objc_storeStrong((id *)&self->_rfSummaryItemImageRightCardSection, 0);
  objc_storeStrong((id *)&self->_rfSummaryItemPlayerCardSection, 0);
  objc_storeStrong((id *)&self->_rfSimpleItemVisualElementCardSection, 0);
  objc_storeStrong((id *)&self->_rfTableRowCardSection, 0);
  objc_storeStrong((id *)&self->_rfTableHeaderCardSection, 0);
  objc_storeStrong((id *)&self->_rfSummaryItemSwitchV2CardSection, 0);
  objc_storeStrong((id *)&self->_rfFactItemImageRightCardSection, 0);
  objc_storeStrong((id *)&self->_rfFactItemHeroButtonCardSection, 0);
  objc_storeStrong((id *)&self->_rfFactItemDetailedNumberCardSection, 0);
  objc_storeStrong((id *)&self->_rfFactItemShortHeroNumberCardSection, 0);
  objc_storeStrong((id *)&self->_rfSummaryItemPairNumberCardSection, 0);
  objc_storeStrong((id *)&self->_rfSummaryItemPairCardSection, 0);
  objc_storeStrong((id *)&self->_rfSimpleItemPlayerCardSection, 0);
  objc_storeStrong((id *)&self->_rfSummaryItemDetailedTextCardSection, 0);
  objc_storeStrong((id *)&self->_rfPrimaryHeaderMarqueeCardSection, 0);
  objc_storeStrong((id *)&self->_rfFactItemHeroNumberCardSection, 0);
  objc_storeStrong((id *)&self->_rfFactItemButtonCardSection, 0);
  objc_storeStrong((id *)&self->_rfExpandableStandardCardSection, 0);
  objc_storeStrong((id *)&self->_rfSummaryItemAlignedTextCardSection, 0);
  objc_storeStrong((id *)&self->_rfSimpleItemStandardCardSection, 0);
  objc_storeStrong((id *)&self->_rfSimpleItemRichCardSection, 0);
  objc_storeStrong((id *)&self->_rfReferenceRichCardSection, 0);
  objc_storeStrong((id *)&self->_rfReferenceFootnoteCardSection, 0);
  objc_storeStrong((id *)&self->_rfPrimaryHeaderStandardCardSection, 0);
  objc_storeStrong((id *)&self->_rfPrimaryHeaderRichCardSection, 0);
  objc_storeStrong((id *)&self->_rfLongItemStandardCardSection, 0);
  objc_storeStrong((id *)&self->_rfFactItemStandardCardSection, 0);
  objc_storeStrong((id *)&self->_rfFactItemShortNumberCardSection, 0);
  objc_storeStrong((id *)&self->_rfSummaryItemStandardCardSection, 0);
  objc_storeStrong((id *)&self->_rfSummaryItemTextCardSection, 0);
  objc_storeStrong((id *)&self->_rfSummaryItemShortNumberCardSection, 0);
  objc_storeStrong((id *)&self->_safariTableOfContentsCardSection, 0);
  objc_storeStrong((id *)&self->_largeTitleDetailedRowCardSection, 0);
  objc_storeStrong((id *)&self->_appIconCardSection, 0);
  objc_storeStrong((id *)&self->_archiveViewCardSection, 0);
  objc_storeStrong((id *)&self->_heroTitleCardSection, 0);
  objc_storeStrong((id *)&self->_leadingTrailingCardSection, 0);
  objc_storeStrong((id *)&self->_commandRowCardSection, 0);
  objc_storeStrong((id *)&self->_buttonListCardSection, 0);
  objc_storeStrong((id *)&self->_strokeAnimationCardSection, 0);
  objc_storeStrong((id *)&self->_watchNowCardSection, 0);
  objc_storeStrong((id *)&self->_listenToCardSection, 0);
  objc_storeStrong((id *)&self->_responseWrapperCardSection, 0);
  objc_storeStrong((id *)&self->_combinedCardSection, 0);
  objc_storeStrong((id *)&self->_collectionCardSection, 0);
  objc_storeStrong((id *)&self->_infoCardSection, 0);
  objc_storeStrong((id *)&self->_miniCardSection, 0);
  objc_storeStrong((id *)&self->_newsCardSection, 0);
  objc_storeStrong((id *)&self->_heroCardSection, 0);
  objc_storeStrong((id *)&self->_findMyCardSection, 0);
  objc_storeStrong((id *)&self->_linkPresentationCardSection, 0);
  objc_storeStrong((id *)&self->_splitCardSection, 0);
  objc_storeStrong((id *)&self->_colorBarCardSection, 0);
  objc_storeStrong((id *)&self->_personHeaderCardSection, 0);
  objc_storeStrong((id *)&self->_gridCardSection, 0);
  objc_storeStrong((id *)&self->_attributionFooterCardSection, 0);
  objc_storeStrong((id *)&self->_worldMapCardSection, 0);
  objc_storeStrong((id *)&self->_compactRowCardSection, 0);
  objc_storeStrong((id *)&self->_mapPlaceCardSection, 0);
  objc_storeStrong((id *)&self->_mediaRemoteControlCardSection, 0);
  objc_storeStrong((id *)&self->_horizontalScrollCardSection, 0);
  objc_storeStrong((id *)&self->_productCardSection, 0);
  objc_storeStrong((id *)&self->_verticalLayoutCardSection, 0);
  objc_storeStrong((id *)&self->_horizontalButtonCardSection, 0);
  objc_storeStrong((id *)&self->_buttonCardSection, 0);
  objc_storeStrong((id *)&self->_mapsDetailedRowCardSection, 0);
  objc_storeStrong((id *)&self->_watchListCardSection, 0);
  objc_storeStrong((id *)&self->_metaInfoCardSection, 0);
  objc_storeStrong((id *)&self->_sectionHeaderCardSection, 0);
  objc_storeStrong((id *)&self->_selectableGridCardSection, 0);
  objc_storeStrong((id *)&self->_suggestionCardSection, 0);
  objc_storeStrong((id *)&self->_imagesCardSection, 0);
  objc_storeStrong((id *)&self->_detailedRowCardSection, 0);
  objc_storeStrong((id *)&self->_messageCardSection, 0);
  objc_storeStrong((id *)&self->_webCardSection, 0);
  objc_storeStrong((id *)&self->_activityIndicatorCardSection, 0);
  objc_storeStrong((id *)&self->_flightCardSection, 0);
  objc_storeStrong((id *)&self->_audioPlaybackCardSection, 0);
  objc_storeStrong((id *)&self->_trackListCardSection, 0);
  objc_storeStrong((id *)&self->_titleCardSection, 0);
  objc_storeStrong((id *)&self->_textColumnsCardSection, 0);
  objc_storeStrong((id *)&self->_tableRowCardSection, 0);
  objc_storeStrong((id *)&self->_tableHeaderRowCardSection, 0);
  objc_storeStrong((id *)&self->_stockChartCardSection, 0);
  objc_storeStrong((id *)&self->_socialMediaPostCardSection, 0);
  objc_storeStrong((id *)&self->_scoreboardCardSection, 0);
  objc_storeStrong((id *)&self->_rowCardSection, 0);
  objc_storeStrong((id *)&self->_richTitleCardSection, 0);
  objc_storeStrong((id *)&self->_nowPlayingCardSection, 0);
  objc_storeStrong((id *)&self->_mediaPlayerCardSection, 0);
  objc_storeStrong((id *)&self->_mediaInfoCardSection, 0);
  objc_storeStrong((id *)&self->_mapCardSection, 0);
  objc_storeStrong((id *)&self->_keyValueDataCardSection, 0);
  objc_storeStrong((id *)&self->_descriptionCardSection, 0);
  objc_storeStrong((id *)&self->_appLinkCardSection, 0);
}

@end
