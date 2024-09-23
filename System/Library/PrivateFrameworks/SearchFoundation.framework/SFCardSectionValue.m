@implementation SFCardSectionValue

- (SFCardSectionValue)initWithProtobuf:(id)a3
{
  id v4;
  SFCardSectionValue *v5;
  void *v6;
  SFAppLinkCardSection *v7;
  void *v8;
  SFAppLinkCardSection *v9;
  void *v10;
  SFDescriptionCardSection *v11;
  void *v12;
  SFDescriptionCardSection *v13;
  void *v14;
  SFKeyValueDataCardSection *v15;
  void *v16;
  SFKeyValueDataCardSection *v17;
  void *v18;
  SFMapCardSection *v19;
  void *v20;
  SFMapCardSection *v21;
  void *v22;
  SFMediaInfoCardSection *v23;
  void *v24;
  SFMediaInfoCardSection *v25;
  void *v26;
  SFMediaPlayerCardSection *v27;
  void *v28;
  SFMediaPlayerCardSection *v29;
  void *v30;
  SFNowPlayingCardSection *v31;
  void *v32;
  SFNowPlayingCardSection *v33;
  void *v34;
  SFRichTitleCardSection *v35;
  void *v36;
  SFRichTitleCardSection *v37;
  void *v38;
  SFRowCardSection *v39;
  void *v40;
  SFRowCardSection *v41;
  void *v42;
  SFScoreboardCardSection *v43;
  void *v44;
  SFScoreboardCardSection *v45;
  void *v46;
  SFSocialMediaPostCardSection *v47;
  void *v48;
  SFSocialMediaPostCardSection *v49;
  void *v50;
  SFStockChartCardSection *v51;
  void *v52;
  SFStockChartCardSection *v53;
  void *v54;
  SFTableHeaderRowCardSection *v55;
  void *v56;
  SFTableHeaderRowCardSection *v57;
  void *v58;
  SFTableRowCardSection *v59;
  void *v60;
  SFTableRowCardSection *v61;
  void *v62;
  SFTextColumnsCardSection *v63;
  void *v64;
  SFTextColumnsCardSection *v65;
  void *v66;
  SFTitleCardSection *v67;
  void *v68;
  SFTitleCardSection *v69;
  void *v70;
  SFTrackListCardSection *v71;
  void *v72;
  SFTrackListCardSection *v73;
  void *v74;
  SFAudioPlaybackCardSection *v75;
  void *v76;
  SFAudioPlaybackCardSection *v77;
  void *v78;
  SFFlightCardSection *v79;
  void *v80;
  SFFlightCardSection *v81;
  void *v82;
  SFActivityIndicatorCardSection *v83;
  void *v84;
  SFActivityIndicatorCardSection *v85;
  void *v86;
  SFWebCardSection *v87;
  void *v88;
  SFWebCardSection *v89;
  void *v90;
  SFMessageCardSection *v91;
  void *v92;
  SFMessageCardSection *v93;
  void *v94;
  SFDetailedRowCardSection *v95;
  void *v96;
  SFDetailedRowCardSection *v97;
  void *v98;
  SFImagesCardSection *v99;
  void *v100;
  SFImagesCardSection *v101;
  void *v102;
  SFSuggestionCardSection *v103;
  void *v104;
  SFSuggestionCardSection *v105;
  void *v106;
  SFSelectableGridCardSection *v107;
  void *v108;
  SFSelectableGridCardSection *v109;
  void *v110;
  SFSectionHeaderCardSection *v111;
  void *v112;
  SFSectionHeaderCardSection *v113;
  void *v114;
  SFMetaInfoCardSection *v115;
  void *v116;
  SFMetaInfoCardSection *v117;
  void *v118;
  SFWatchListCardSection *v119;
  void *v120;
  SFWatchListCardSection *v121;
  void *v122;
  SFMapsDetailedRowCardSection *v123;
  void *v124;
  SFMapsDetailedRowCardSection *v125;
  void *v126;
  SFButtonCardSection *v127;
  void *v128;
  SFButtonCardSection *v129;
  void *v130;
  SFHorizontalButtonCardSection *v131;
  void *v132;
  SFHorizontalButtonCardSection *v133;
  void *v134;
  SFVerticalLayoutCardSection *v135;
  void *v136;
  SFVerticalLayoutCardSection *v137;
  void *v138;
  SFProductCardSection *v139;
  void *v140;
  SFProductCardSection *v141;
  void *v142;
  SFHorizontalScrollCardSection *v143;
  void *v144;
  SFHorizontalScrollCardSection *v145;
  void *v146;
  SFMediaRemoteControlCardSection *v147;
  void *v148;
  SFMediaRemoteControlCardSection *v149;
  void *v150;
  SFMapPlaceCardSection *v151;
  void *v152;
  SFMapPlaceCardSection *v153;
  void *v154;
  SFCompactRowCardSection *v155;
  void *v156;
  SFCompactRowCardSection *v157;
  void *v158;
  SFWorldMapCardSection *v159;
  void *v160;
  SFWorldMapCardSection *v161;
  void *v162;
  SFAttributionFooterCardSection *v163;
  void *v164;
  SFAttributionFooterCardSection *v165;
  void *v166;
  SFGridCardSection *v167;
  void *v168;
  SFGridCardSection *v169;
  void *v170;
  SFPersonHeaderCardSection *v171;
  void *v172;
  SFPersonHeaderCardSection *v173;
  void *v174;
  SFColorBarCardSection *v175;
  void *v176;
  SFColorBarCardSection *v177;
  void *v178;
  SFSplitCardSection *v179;
  void *v180;
  SFSplitCardSection *v181;
  void *v182;
  SFLinkPresentationCardSection *v183;
  void *v184;
  SFLinkPresentationCardSection *v185;
  void *v186;
  SFFindMyCardSection *v187;
  void *v188;
  SFFindMyCardSection *v189;
  void *v190;
  SFHeroCardSection *v191;
  void *v192;
  SFHeroCardSection *v193;
  void *v194;
  SFNewsCardSection *v195;
  void *v196;
  SFNewsCardSection *v197;
  void *v198;
  SFMiniCardSection *v199;
  void *v200;
  SFMiniCardSection *v201;
  void *v202;
  SFInfoCardSection *v203;
  void *v204;
  SFInfoCardSection *v205;
  void *v206;
  SFCollectionCardSection *v207;
  void *v208;
  SFCollectionCardSection *v209;
  void *v210;
  SFCombinedCardSection *v211;
  void *v212;
  SFCombinedCardSection *v213;
  void *v214;
  SFResponseWrapperCardSection *v215;
  void *v216;
  SFResponseWrapperCardSection *v217;
  void *v218;
  SFListenToCardSection *v219;
  void *v220;
  SFListenToCardSection *v221;
  void *v222;
  SFWatchNowCardSection *v223;
  void *v224;
  SFWatchNowCardSection *v225;
  void *v226;
  SFStrokeAnimationCardSection *v227;
  void *v228;
  SFStrokeAnimationCardSection *v229;
  void *v230;
  SFButtonListCardSection *v231;
  void *v232;
  SFButtonListCardSection *v233;
  void *v234;
  SFCommandRowCardSection *v235;
  void *v236;
  SFCommandRowCardSection *v237;
  void *v238;
  SFLeadingTrailingCardSection *v239;
  void *v240;
  SFLeadingTrailingCardSection *v241;
  void *v242;
  SFHeroTitleCardSection *v243;
  void *v244;
  SFHeroTitleCardSection *v245;
  void *v246;
  SFArchiveViewCardSection *v247;
  void *v248;
  SFArchiveViewCardSection *v249;
  void *v250;
  SFAppIconCardSection *v251;
  void *v252;
  SFAppIconCardSection *v253;
  void *v254;
  SFLargeTitleDetailedRowCardSection *v255;
  void *v256;
  SFLargeTitleDetailedRowCardSection *v257;
  void *v258;
  SFSafariTableOfContentsCardSection *v259;
  void *v260;
  SFSafariTableOfContentsCardSection *v261;
  void *v262;
  RFSummaryItemShortNumberCardSection *v263;
  void *v264;
  RFSummaryItemShortNumberCardSection *v265;
  void *v266;
  RFSummaryItemTextCardSection *v267;
  void *v268;
  RFSummaryItemTextCardSection *v269;
  void *v270;
  RFSummaryItemStandardCardSection *v271;
  void *v272;
  RFSummaryItemStandardCardSection *v273;
  void *v274;
  RFFactItemShortNumberCardSection *v275;
  void *v276;
  RFFactItemShortNumberCardSection *v277;
  void *v278;
  RFFactItemStandardCardSection *v279;
  void *v280;
  RFFactItemStandardCardSection *v281;
  void *v282;
  RFLongItemStandardCardSection *v283;
  void *v284;
  RFLongItemStandardCardSection *v285;
  void *v286;
  RFPrimaryHeaderRichCardSection *v287;
  void *v288;
  RFPrimaryHeaderRichCardSection *v289;
  void *v290;
  RFPrimaryHeaderStandardCardSection *v291;
  void *v292;
  RFPrimaryHeaderStandardCardSection *v293;
  void *v294;
  RFReferenceFootnoteCardSection *v295;
  void *v296;
  RFReferenceFootnoteCardSection *v297;
  void *v298;
  RFReferenceRichCardSection *v299;
  void *v300;
  RFReferenceRichCardSection *v301;
  void *v302;
  RFSimpleItemRichCardSection *v303;
  void *v304;
  RFSimpleItemRichCardSection *v305;
  void *v306;
  RFSimpleItemStandardCardSection *v307;
  void *v308;
  RFSimpleItemStandardCardSection *v309;
  void *v310;
  RFSummaryItemAlignedTextCardSection *v311;
  void *v312;
  RFSummaryItemAlignedTextCardSection *v313;
  void *v314;
  RFExpandableStandardCardSection *v315;
  void *v316;
  RFExpandableStandardCardSection *v317;
  void *v318;
  RFFactItemButtonCardSection *v319;
  void *v320;
  RFFactItemButtonCardSection *v321;
  void *v322;
  RFFactItemHeroNumberCardSection *v323;
  void *v324;
  RFFactItemHeroNumberCardSection *v325;
  void *v326;
  RFPrimaryHeaderMarqueeCardSection *v327;
  void *v328;
  RFPrimaryHeaderMarqueeCardSection *v329;
  void *v330;
  RFSummaryItemDetailedTextCardSection *v331;
  void *v332;
  RFSummaryItemDetailedTextCardSection *v333;
  void *v334;
  RFSimpleItemPlayerCardSection *v335;
  void *v336;
  RFSimpleItemPlayerCardSection *v337;
  void *v338;
  RFSummaryItemPairCardSection *v339;
  void *v340;
  RFSummaryItemPairCardSection *v341;
  void *v342;
  RFSummaryItemPairNumberCardSection *v343;
  void *v344;
  RFSummaryItemPairNumberCardSection *v345;
  void *v346;
  RFFactItemShortHeroNumberCardSection *v347;
  void *v348;
  RFFactItemShortHeroNumberCardSection *v349;
  void *v350;
  RFFactItemDetailedNumberCardSection *v351;
  void *v352;
  RFFactItemDetailedNumberCardSection *v353;
  void *v354;
  RFFactItemHeroButtonCardSection *v355;
  void *v356;
  RFFactItemHeroButtonCardSection *v357;
  void *v358;
  RFFactItemImageRightCardSection *v359;
  void *v360;
  RFFactItemImageRightCardSection *v361;
  void *v362;
  RFSummaryItemSwitchV2CardSection *v363;
  void *v364;
  RFSummaryItemSwitchV2CardSection *v365;
  void *v366;
  RFTableHeaderCardSection *v367;
  void *v368;
  RFTableHeaderCardSection *v369;
  void *v370;
  RFTableRowCardSection *v371;
  void *v372;
  RFTableRowCardSection *v373;
  void *v374;
  RFSimpleItemVisualElementCardSection *v375;
  void *v376;
  RFSimpleItemVisualElementCardSection *v377;
  void *v378;
  RFSummaryItemPlayerCardSection *v379;
  void *v380;
  RFSummaryItemPlayerCardSection *v381;
  void *v382;
  RFSummaryItemImageRightCardSection *v383;
  void *v384;
  RFSummaryItemImageRightCardSection *v385;
  void *v386;
  RFSummaryItemButtonCardSection *v387;
  void *v388;
  RFSummaryItemButtonCardSection *v389;
  void *v390;
  RFSimpleItemReverseRichCardSection *v391;
  void *v392;
  RFSimpleItemReverseRichCardSection *v393;
  void *v394;
  RFSimpleItemRichSearchResultCardSection *v395;
  void *v396;
  RFSimpleItemRichSearchResultCardSection *v397;
  void *v398;
  RFPrimaryHeaderStackedImageCardSection *v399;
  void *v400;
  RFPrimaryHeaderStackedImageCardSection *v401;
  void *v402;
  RFReferenceItemLogoCardSection *v403;
  void *v404;
  RFReferenceItemLogoCardSection *v405;
  void *v406;
  RFReferenceItemButtonCardSection *v407;
  void *v408;
  RFReferenceItemButtonCardSection *v409;
  void *v410;
  RFButtonCardSection *v411;
  void *v412;
  RFButtonCardSection *v413;
  void *v414;
  RFBinaryButtonCardSection *v415;
  void *v416;
  RFBinaryButtonCardSection *v417;
  void *v418;
  RFReferenceCenteredCardSection *v419;
  void *v420;
  RFReferenceCenteredCardSection *v421;
  void *v422;
  RFSecondaryHeaderStandardCardSection *v423;
  void *v424;
  RFSecondaryHeaderStandardCardSection *v425;
  void *v426;
  RFSecondaryHeaderEmphasizedCardSection *v427;
  void *v428;
  RFSecondaryHeaderEmphasizedCardSection *v429;
  void *v430;
  RFMapCardSection *v431;
  void *v432;
  RFMapCardSection *v433;
  void *v434;
  RFReferenceStandardCardSection *v435;
  void *v436;
  RFReferenceStandardCardSection *v437;
  void *v438;
  RFMultiButtonCardSection *v439;
  void *v440;
  RFMultiButtonCardSection *v441;
  void *v442;
  RFDisambiguationTitleCardSection *v443;
  void *v444;
  RFDisambiguationTitleCardSection *v445;
  SFCardSectionValue *v446;
  objc_super v448;

  v4 = a3;
  v448.receiver = self;
  v448.super_class = (Class)SFCardSectionValue;
  v5 = -[SFCardSectionValue init](&v448, sel_init);

  if (v5)
  {
    objc_msgSend(v4, "appLinkCardSection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [SFAppLinkCardSection alloc];
      objc_msgSend(v4, "appLinkCardSection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SFAppLinkCardSection initWithProtobuf:](v7, "initWithProtobuf:", v8);
      -[SFCardSectionValue setAppLinkCardSection:](v5, "setAppLinkCardSection:", v9);

    }
    objc_msgSend(v4, "descriptionCardSection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [SFDescriptionCardSection alloc];
      objc_msgSend(v4, "descriptionCardSection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[SFDescriptionCardSection initWithProtobuf:](v11, "initWithProtobuf:", v12);
      -[SFCardSectionValue setDescriptionCardSection:](v5, "setDescriptionCardSection:", v13);

    }
    objc_msgSend(v4, "keyValueDataCardSection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = [SFKeyValueDataCardSection alloc];
      objc_msgSend(v4, "keyValueDataCardSection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[SFKeyValueDataCardSection initWithProtobuf:](v15, "initWithProtobuf:", v16);
      -[SFCardSectionValue setKeyValueDataCardSection:](v5, "setKeyValueDataCardSection:", v17);

    }
    objc_msgSend(v4, "mapCardSection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = [SFMapCardSection alloc];
      objc_msgSend(v4, "mapCardSection");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[SFMapCardSection initWithProtobuf:](v19, "initWithProtobuf:", v20);
      -[SFCardSectionValue setMapCardSection:](v5, "setMapCardSection:", v21);

    }
    objc_msgSend(v4, "mediaInfoCardSection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v23 = [SFMediaInfoCardSection alloc];
      objc_msgSend(v4, "mediaInfoCardSection");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[SFMediaInfoCardSection initWithProtobuf:](v23, "initWithProtobuf:", v24);
      -[SFCardSectionValue setMediaInfoCardSection:](v5, "setMediaInfoCardSection:", v25);

    }
    objc_msgSend(v4, "mediaPlayerCardSection");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v27 = [SFMediaPlayerCardSection alloc];
      objc_msgSend(v4, "mediaPlayerCardSection");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[SFMediaPlayerCardSection initWithProtobuf:](v27, "initWithProtobuf:", v28);
      -[SFCardSectionValue setMediaPlayerCardSection:](v5, "setMediaPlayerCardSection:", v29);

    }
    objc_msgSend(v4, "nowPlayingCardSection");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      v31 = [SFNowPlayingCardSection alloc];
      objc_msgSend(v4, "nowPlayingCardSection");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[SFNowPlayingCardSection initWithProtobuf:](v31, "initWithProtobuf:", v32);
      -[SFCardSectionValue setNowPlayingCardSection:](v5, "setNowPlayingCardSection:", v33);

    }
    objc_msgSend(v4, "richTitleCardSection");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      v35 = [SFRichTitleCardSection alloc];
      objc_msgSend(v4, "richTitleCardSection");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = -[SFRichTitleCardSection initWithProtobuf:](v35, "initWithProtobuf:", v36);
      -[SFCardSectionValue setRichTitleCardSection:](v5, "setRichTitleCardSection:", v37);

    }
    objc_msgSend(v4, "rowCardSection");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      v39 = [SFRowCardSection alloc];
      objc_msgSend(v4, "rowCardSection");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = -[SFRowCardSection initWithProtobuf:](v39, "initWithProtobuf:", v40);
      -[SFCardSectionValue setRowCardSection:](v5, "setRowCardSection:", v41);

    }
    objc_msgSend(v4, "scoreboardCardSection");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      v43 = [SFScoreboardCardSection alloc];
      objc_msgSend(v4, "scoreboardCardSection");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = -[SFScoreboardCardSection initWithProtobuf:](v43, "initWithProtobuf:", v44);
      -[SFCardSectionValue setScoreboardCardSection:](v5, "setScoreboardCardSection:", v45);

    }
    objc_msgSend(v4, "socialMediaPostCardSection");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      v47 = [SFSocialMediaPostCardSection alloc];
      objc_msgSend(v4, "socialMediaPostCardSection");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = -[SFSocialMediaPostCardSection initWithProtobuf:](v47, "initWithProtobuf:", v48);
      -[SFCardSectionValue setSocialMediaPostCardSection:](v5, "setSocialMediaPostCardSection:", v49);

    }
    objc_msgSend(v4, "stockChartCardSection");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v50)
    {
      v51 = [SFStockChartCardSection alloc];
      objc_msgSend(v4, "stockChartCardSection");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = -[SFStockChartCardSection initWithProtobuf:](v51, "initWithProtobuf:", v52);
      -[SFCardSectionValue setStockChartCardSection:](v5, "setStockChartCardSection:", v53);

    }
    objc_msgSend(v4, "tableHeaderRowCardSection");
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (v54)
    {
      v55 = [SFTableHeaderRowCardSection alloc];
      objc_msgSend(v4, "tableHeaderRowCardSection");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = -[SFTableHeaderRowCardSection initWithProtobuf:](v55, "initWithProtobuf:", v56);
      -[SFCardSectionValue setTableHeaderRowCardSection:](v5, "setTableHeaderRowCardSection:", v57);

    }
    objc_msgSend(v4, "tableRowCardSection");
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    if (v58)
    {
      v59 = [SFTableRowCardSection alloc];
      objc_msgSend(v4, "tableRowCardSection");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = -[SFTableRowCardSection initWithProtobuf:](v59, "initWithProtobuf:", v60);
      -[SFCardSectionValue setTableRowCardSection:](v5, "setTableRowCardSection:", v61);

    }
    objc_msgSend(v4, "textColumnsCardSection");
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    if (v62)
    {
      v63 = [SFTextColumnsCardSection alloc];
      objc_msgSend(v4, "textColumnsCardSection");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = -[SFTextColumnsCardSection initWithProtobuf:](v63, "initWithProtobuf:", v64);
      -[SFCardSectionValue setTextColumnsCardSection:](v5, "setTextColumnsCardSection:", v65);

    }
    objc_msgSend(v4, "titleCardSection");
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    if (v66)
    {
      v67 = [SFTitleCardSection alloc];
      objc_msgSend(v4, "titleCardSection");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = -[SFTitleCardSection initWithProtobuf:](v67, "initWithProtobuf:", v68);
      -[SFCardSectionValue setTitleCardSection:](v5, "setTitleCardSection:", v69);

    }
    objc_msgSend(v4, "trackListCardSection");
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    if (v70)
    {
      v71 = [SFTrackListCardSection alloc];
      objc_msgSend(v4, "trackListCardSection");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = -[SFTrackListCardSection initWithProtobuf:](v71, "initWithProtobuf:", v72);
      -[SFCardSectionValue setTrackListCardSection:](v5, "setTrackListCardSection:", v73);

    }
    objc_msgSend(v4, "audioPlaybackCardSection");
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    if (v74)
    {
      v75 = [SFAudioPlaybackCardSection alloc];
      objc_msgSend(v4, "audioPlaybackCardSection");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = -[SFAudioPlaybackCardSection initWithProtobuf:](v75, "initWithProtobuf:", v76);
      -[SFCardSectionValue setAudioPlaybackCardSection:](v5, "setAudioPlaybackCardSection:", v77);

    }
    objc_msgSend(v4, "flightCardSection");
    v78 = (void *)objc_claimAutoreleasedReturnValue();

    if (v78)
    {
      v79 = [SFFlightCardSection alloc];
      objc_msgSend(v4, "flightCardSection");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = -[SFFlightCardSection initWithProtobuf:](v79, "initWithProtobuf:", v80);
      -[SFCardSectionValue setFlightCardSection:](v5, "setFlightCardSection:", v81);

    }
    objc_msgSend(v4, "activityIndicatorCardSection");
    v82 = (void *)objc_claimAutoreleasedReturnValue();

    if (v82)
    {
      v83 = [SFActivityIndicatorCardSection alloc];
      objc_msgSend(v4, "activityIndicatorCardSection");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = -[SFActivityIndicatorCardSection initWithProtobuf:](v83, "initWithProtobuf:", v84);
      -[SFCardSectionValue setActivityIndicatorCardSection:](v5, "setActivityIndicatorCardSection:", v85);

    }
    objc_msgSend(v4, "webCardSection");
    v86 = (void *)objc_claimAutoreleasedReturnValue();

    if (v86)
    {
      v87 = [SFWebCardSection alloc];
      objc_msgSend(v4, "webCardSection");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = -[SFWebCardSection initWithProtobuf:](v87, "initWithProtobuf:", v88);
      -[SFCardSectionValue setWebCardSection:](v5, "setWebCardSection:", v89);

    }
    objc_msgSend(v4, "messageCardSection");
    v90 = (void *)objc_claimAutoreleasedReturnValue();

    if (v90)
    {
      v91 = [SFMessageCardSection alloc];
      objc_msgSend(v4, "messageCardSection");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = -[SFMessageCardSection initWithProtobuf:](v91, "initWithProtobuf:", v92);
      -[SFCardSectionValue setMessageCardSection:](v5, "setMessageCardSection:", v93);

    }
    objc_msgSend(v4, "detailedRowCardSection");
    v94 = (void *)objc_claimAutoreleasedReturnValue();

    if (v94)
    {
      v95 = [SFDetailedRowCardSection alloc];
      objc_msgSend(v4, "detailedRowCardSection");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = -[SFDetailedRowCardSection initWithProtobuf:](v95, "initWithProtobuf:", v96);
      -[SFCardSectionValue setDetailedRowCardSection:](v5, "setDetailedRowCardSection:", v97);

    }
    objc_msgSend(v4, "imagesCardSection");
    v98 = (void *)objc_claimAutoreleasedReturnValue();

    if (v98)
    {
      v99 = [SFImagesCardSection alloc];
      objc_msgSend(v4, "imagesCardSection");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = -[SFImagesCardSection initWithProtobuf:](v99, "initWithProtobuf:", v100);
      -[SFCardSectionValue setImagesCardSection:](v5, "setImagesCardSection:", v101);

    }
    objc_msgSend(v4, "suggestionCardSection");
    v102 = (void *)objc_claimAutoreleasedReturnValue();

    if (v102)
    {
      v103 = [SFSuggestionCardSection alloc];
      objc_msgSend(v4, "suggestionCardSection");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = -[SFSuggestionCardSection initWithProtobuf:](v103, "initWithProtobuf:", v104);
      -[SFCardSectionValue setSuggestionCardSection:](v5, "setSuggestionCardSection:", v105);

    }
    objc_msgSend(v4, "selectableGridCardSection");
    v106 = (void *)objc_claimAutoreleasedReturnValue();

    if (v106)
    {
      v107 = [SFSelectableGridCardSection alloc];
      objc_msgSend(v4, "selectableGridCardSection");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v109 = -[SFSelectableGridCardSection initWithProtobuf:](v107, "initWithProtobuf:", v108);
      -[SFCardSectionValue setSelectableGridCardSection:](v5, "setSelectableGridCardSection:", v109);

    }
    objc_msgSend(v4, "sectionHeaderCardSection");
    v110 = (void *)objc_claimAutoreleasedReturnValue();

    if (v110)
    {
      v111 = [SFSectionHeaderCardSection alloc];
      objc_msgSend(v4, "sectionHeaderCardSection");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      v113 = -[SFSectionHeaderCardSection initWithProtobuf:](v111, "initWithProtobuf:", v112);
      -[SFCardSectionValue setSectionHeaderCardSection:](v5, "setSectionHeaderCardSection:", v113);

    }
    objc_msgSend(v4, "metaInfoCardSection");
    v114 = (void *)objc_claimAutoreleasedReturnValue();

    if (v114)
    {
      v115 = [SFMetaInfoCardSection alloc];
      objc_msgSend(v4, "metaInfoCardSection");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v117 = -[SFMetaInfoCardSection initWithProtobuf:](v115, "initWithProtobuf:", v116);
      -[SFCardSectionValue setMetaInfoCardSection:](v5, "setMetaInfoCardSection:", v117);

    }
    objc_msgSend(v4, "watchListCardSection");
    v118 = (void *)objc_claimAutoreleasedReturnValue();

    if (v118)
    {
      v119 = [SFWatchListCardSection alloc];
      objc_msgSend(v4, "watchListCardSection");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      v121 = -[SFWatchListCardSection initWithProtobuf:](v119, "initWithProtobuf:", v120);
      -[SFCardSectionValue setWatchListCardSection:](v5, "setWatchListCardSection:", v121);

    }
    objc_msgSend(v4, "mapsDetailedRowCardSection");
    v122 = (void *)objc_claimAutoreleasedReturnValue();

    if (v122)
    {
      v123 = [SFMapsDetailedRowCardSection alloc];
      objc_msgSend(v4, "mapsDetailedRowCardSection");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      v125 = -[SFMapsDetailedRowCardSection initWithProtobuf:](v123, "initWithProtobuf:", v124);
      -[SFCardSectionValue setMapsDetailedRowCardSection:](v5, "setMapsDetailedRowCardSection:", v125);

    }
    objc_msgSend(v4, "buttonCardSection");
    v126 = (void *)objc_claimAutoreleasedReturnValue();

    if (v126)
    {
      v127 = [SFButtonCardSection alloc];
      objc_msgSend(v4, "buttonCardSection");
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      v129 = -[SFButtonCardSection initWithProtobuf:](v127, "initWithProtobuf:", v128);
      -[SFCardSectionValue setButtonCardSection:](v5, "setButtonCardSection:", v129);

    }
    objc_msgSend(v4, "horizontalButtonCardSection");
    v130 = (void *)objc_claimAutoreleasedReturnValue();

    if (v130)
    {
      v131 = [SFHorizontalButtonCardSection alloc];
      objc_msgSend(v4, "horizontalButtonCardSection");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      v133 = -[SFHorizontalButtonCardSection initWithProtobuf:](v131, "initWithProtobuf:", v132);
      -[SFCardSectionValue setHorizontalButtonCardSection:](v5, "setHorizontalButtonCardSection:", v133);

    }
    objc_msgSend(v4, "verticalLayoutCardSection");
    v134 = (void *)objc_claimAutoreleasedReturnValue();

    if (v134)
    {
      v135 = [SFVerticalLayoutCardSection alloc];
      objc_msgSend(v4, "verticalLayoutCardSection");
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      v137 = -[SFVerticalLayoutCardSection initWithProtobuf:](v135, "initWithProtobuf:", v136);
      -[SFCardSectionValue setVerticalLayoutCardSection:](v5, "setVerticalLayoutCardSection:", v137);

    }
    objc_msgSend(v4, "productCardSection");
    v138 = (void *)objc_claimAutoreleasedReturnValue();

    if (v138)
    {
      v139 = [SFProductCardSection alloc];
      objc_msgSend(v4, "productCardSection");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      v141 = -[SFProductCardSection initWithProtobuf:](v139, "initWithProtobuf:", v140);
      -[SFCardSectionValue setProductCardSection:](v5, "setProductCardSection:", v141);

    }
    objc_msgSend(v4, "horizontalScrollCardSection");
    v142 = (void *)objc_claimAutoreleasedReturnValue();

    if (v142)
    {
      v143 = [SFHorizontalScrollCardSection alloc];
      objc_msgSend(v4, "horizontalScrollCardSection");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      v145 = -[SFHorizontalScrollCardSection initWithProtobuf:](v143, "initWithProtobuf:", v144);
      -[SFCardSectionValue setHorizontalScrollCardSection:](v5, "setHorizontalScrollCardSection:", v145);

    }
    objc_msgSend(v4, "mediaRemoteControlCardSection");
    v146 = (void *)objc_claimAutoreleasedReturnValue();

    if (v146)
    {
      v147 = [SFMediaRemoteControlCardSection alloc];
      objc_msgSend(v4, "mediaRemoteControlCardSection");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      v149 = -[SFMediaRemoteControlCardSection initWithProtobuf:](v147, "initWithProtobuf:", v148);
      -[SFCardSectionValue setMediaRemoteControlCardSection:](v5, "setMediaRemoteControlCardSection:", v149);

    }
    objc_msgSend(v4, "mapPlaceCardSection");
    v150 = (void *)objc_claimAutoreleasedReturnValue();

    if (v150)
    {
      v151 = [SFMapPlaceCardSection alloc];
      objc_msgSend(v4, "mapPlaceCardSection");
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      v153 = -[SFMapPlaceCardSection initWithProtobuf:](v151, "initWithProtobuf:", v152);
      -[SFCardSectionValue setMapPlaceCardSection:](v5, "setMapPlaceCardSection:", v153);

    }
    objc_msgSend(v4, "compactRowCardSection");
    v154 = (void *)objc_claimAutoreleasedReturnValue();

    if (v154)
    {
      v155 = [SFCompactRowCardSection alloc];
      objc_msgSend(v4, "compactRowCardSection");
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      v157 = -[SFCompactRowCardSection initWithProtobuf:](v155, "initWithProtobuf:", v156);
      -[SFCardSectionValue setCompactRowCardSection:](v5, "setCompactRowCardSection:", v157);

    }
    objc_msgSend(v4, "worldMapCardSection");
    v158 = (void *)objc_claimAutoreleasedReturnValue();

    if (v158)
    {
      v159 = [SFWorldMapCardSection alloc];
      objc_msgSend(v4, "worldMapCardSection");
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      v161 = -[SFWorldMapCardSection initWithProtobuf:](v159, "initWithProtobuf:", v160);
      -[SFCardSectionValue setWorldMapCardSection:](v5, "setWorldMapCardSection:", v161);

    }
    objc_msgSend(v4, "attributionFooterCardSection");
    v162 = (void *)objc_claimAutoreleasedReturnValue();

    if (v162)
    {
      v163 = [SFAttributionFooterCardSection alloc];
      objc_msgSend(v4, "attributionFooterCardSection");
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      v165 = -[SFAttributionFooterCardSection initWithProtobuf:](v163, "initWithProtobuf:", v164);
      -[SFCardSectionValue setAttributionFooterCardSection:](v5, "setAttributionFooterCardSection:", v165);

    }
    objc_msgSend(v4, "gridCardSection");
    v166 = (void *)objc_claimAutoreleasedReturnValue();

    if (v166)
    {
      v167 = [SFGridCardSection alloc];
      objc_msgSend(v4, "gridCardSection");
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      v169 = -[SFGridCardSection initWithProtobuf:](v167, "initWithProtobuf:", v168);
      -[SFCardSectionValue setGridCardSection:](v5, "setGridCardSection:", v169);

    }
    objc_msgSend(v4, "personHeaderCardSection");
    v170 = (void *)objc_claimAutoreleasedReturnValue();

    if (v170)
    {
      v171 = [SFPersonHeaderCardSection alloc];
      objc_msgSend(v4, "personHeaderCardSection");
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      v173 = -[SFPersonHeaderCardSection initWithProtobuf:](v171, "initWithProtobuf:", v172);
      -[SFCardSectionValue setPersonHeaderCardSection:](v5, "setPersonHeaderCardSection:", v173);

    }
    objc_msgSend(v4, "colorBarCardSection");
    v174 = (void *)objc_claimAutoreleasedReturnValue();

    if (v174)
    {
      v175 = [SFColorBarCardSection alloc];
      objc_msgSend(v4, "colorBarCardSection");
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      v177 = -[SFColorBarCardSection initWithProtobuf:](v175, "initWithProtobuf:", v176);
      -[SFCardSectionValue setColorBarCardSection:](v5, "setColorBarCardSection:", v177);

    }
    objc_msgSend(v4, "splitCardSection");
    v178 = (void *)objc_claimAutoreleasedReturnValue();

    if (v178)
    {
      v179 = [SFSplitCardSection alloc];
      objc_msgSend(v4, "splitCardSection");
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      v181 = -[SFSplitCardSection initWithProtobuf:](v179, "initWithProtobuf:", v180);
      -[SFCardSectionValue setSplitCardSection:](v5, "setSplitCardSection:", v181);

    }
    objc_msgSend(v4, "linkPresentationCardSection");
    v182 = (void *)objc_claimAutoreleasedReturnValue();

    if (v182)
    {
      v183 = [SFLinkPresentationCardSection alloc];
      objc_msgSend(v4, "linkPresentationCardSection");
      v184 = (void *)objc_claimAutoreleasedReturnValue();
      v185 = -[SFLinkPresentationCardSection initWithProtobuf:](v183, "initWithProtobuf:", v184);
      -[SFCardSectionValue setLinkPresentationCardSection:](v5, "setLinkPresentationCardSection:", v185);

    }
    objc_msgSend(v4, "findMyCardSection");
    v186 = (void *)objc_claimAutoreleasedReturnValue();

    if (v186)
    {
      v187 = [SFFindMyCardSection alloc];
      objc_msgSend(v4, "findMyCardSection");
      v188 = (void *)objc_claimAutoreleasedReturnValue();
      v189 = -[SFFindMyCardSection initWithProtobuf:](v187, "initWithProtobuf:", v188);
      -[SFCardSectionValue setFindMyCardSection:](v5, "setFindMyCardSection:", v189);

    }
    objc_msgSend(v4, "heroCardSection");
    v190 = (void *)objc_claimAutoreleasedReturnValue();

    if (v190)
    {
      v191 = [SFHeroCardSection alloc];
      objc_msgSend(v4, "heroCardSection");
      v192 = (void *)objc_claimAutoreleasedReturnValue();
      v193 = -[SFHeroCardSection initWithProtobuf:](v191, "initWithProtobuf:", v192);
      -[SFCardSectionValue setHeroCardSection:](v5, "setHeroCardSection:", v193);

    }
    objc_msgSend(v4, "newsCardSection");
    v194 = (void *)objc_claimAutoreleasedReturnValue();

    if (v194)
    {
      v195 = [SFNewsCardSection alloc];
      objc_msgSend(v4, "newsCardSection");
      v196 = (void *)objc_claimAutoreleasedReturnValue();
      v197 = -[SFNewsCardSection initWithProtobuf:](v195, "initWithProtobuf:", v196);
      -[SFCardSectionValue setNewsCardSection:](v5, "setNewsCardSection:", v197);

    }
    objc_msgSend(v4, "miniCardSection");
    v198 = (void *)objc_claimAutoreleasedReturnValue();

    if (v198)
    {
      v199 = [SFMiniCardSection alloc];
      objc_msgSend(v4, "miniCardSection");
      v200 = (void *)objc_claimAutoreleasedReturnValue();
      v201 = -[SFMiniCardSection initWithProtobuf:](v199, "initWithProtobuf:", v200);
      -[SFCardSectionValue setMiniCardSection:](v5, "setMiniCardSection:", v201);

    }
    objc_msgSend(v4, "infoCardSection");
    v202 = (void *)objc_claimAutoreleasedReturnValue();

    if (v202)
    {
      v203 = [SFInfoCardSection alloc];
      objc_msgSend(v4, "infoCardSection");
      v204 = (void *)objc_claimAutoreleasedReturnValue();
      v205 = -[SFInfoCardSection initWithProtobuf:](v203, "initWithProtobuf:", v204);
      -[SFCardSectionValue setInfoCardSection:](v5, "setInfoCardSection:", v205);

    }
    objc_msgSend(v4, "collectionCardSection");
    v206 = (void *)objc_claimAutoreleasedReturnValue();

    if (v206)
    {
      v207 = [SFCollectionCardSection alloc];
      objc_msgSend(v4, "collectionCardSection");
      v208 = (void *)objc_claimAutoreleasedReturnValue();
      v209 = -[SFCollectionCardSection initWithProtobuf:](v207, "initWithProtobuf:", v208);
      -[SFCardSectionValue setCollectionCardSection:](v5, "setCollectionCardSection:", v209);

    }
    objc_msgSend(v4, "combinedCardSection");
    v210 = (void *)objc_claimAutoreleasedReturnValue();

    if (v210)
    {
      v211 = [SFCombinedCardSection alloc];
      objc_msgSend(v4, "combinedCardSection");
      v212 = (void *)objc_claimAutoreleasedReturnValue();
      v213 = -[SFCombinedCardSection initWithProtobuf:](v211, "initWithProtobuf:", v212);
      -[SFCardSectionValue setCombinedCardSection:](v5, "setCombinedCardSection:", v213);

    }
    objc_msgSend(v4, "responseWrapperCardSection");
    v214 = (void *)objc_claimAutoreleasedReturnValue();

    if (v214)
    {
      v215 = [SFResponseWrapperCardSection alloc];
      objc_msgSend(v4, "responseWrapperCardSection");
      v216 = (void *)objc_claimAutoreleasedReturnValue();
      v217 = -[SFResponseWrapperCardSection initWithProtobuf:](v215, "initWithProtobuf:", v216);
      -[SFCardSectionValue setResponseWrapperCardSection:](v5, "setResponseWrapperCardSection:", v217);

    }
    objc_msgSend(v4, "listenToCardSection");
    v218 = (void *)objc_claimAutoreleasedReturnValue();

    if (v218)
    {
      v219 = [SFListenToCardSection alloc];
      objc_msgSend(v4, "listenToCardSection");
      v220 = (void *)objc_claimAutoreleasedReturnValue();
      v221 = -[SFListenToCardSection initWithProtobuf:](v219, "initWithProtobuf:", v220);
      -[SFCardSectionValue setListenToCardSection:](v5, "setListenToCardSection:", v221);

    }
    objc_msgSend(v4, "watchNowCardSection");
    v222 = (void *)objc_claimAutoreleasedReturnValue();

    if (v222)
    {
      v223 = [SFWatchNowCardSection alloc];
      objc_msgSend(v4, "watchNowCardSection");
      v224 = (void *)objc_claimAutoreleasedReturnValue();
      v225 = -[SFWatchNowCardSection initWithProtobuf:](v223, "initWithProtobuf:", v224);
      -[SFCardSectionValue setWatchNowCardSection:](v5, "setWatchNowCardSection:", v225);

    }
    objc_msgSend(v4, "strokeAnimationCardSection");
    v226 = (void *)objc_claimAutoreleasedReturnValue();

    if (v226)
    {
      v227 = [SFStrokeAnimationCardSection alloc];
      objc_msgSend(v4, "strokeAnimationCardSection");
      v228 = (void *)objc_claimAutoreleasedReturnValue();
      v229 = -[SFStrokeAnimationCardSection initWithProtobuf:](v227, "initWithProtobuf:", v228);
      -[SFCardSectionValue setStrokeAnimationCardSection:](v5, "setStrokeAnimationCardSection:", v229);

    }
    objc_msgSend(v4, "buttonListCardSection");
    v230 = (void *)objc_claimAutoreleasedReturnValue();

    if (v230)
    {
      v231 = [SFButtonListCardSection alloc];
      objc_msgSend(v4, "buttonListCardSection");
      v232 = (void *)objc_claimAutoreleasedReturnValue();
      v233 = -[SFButtonListCardSection initWithProtobuf:](v231, "initWithProtobuf:", v232);
      -[SFCardSectionValue setButtonListCardSection:](v5, "setButtonListCardSection:", v233);

    }
    objc_msgSend(v4, "commandRowCardSection");
    v234 = (void *)objc_claimAutoreleasedReturnValue();

    if (v234)
    {
      v235 = [SFCommandRowCardSection alloc];
      objc_msgSend(v4, "commandRowCardSection");
      v236 = (void *)objc_claimAutoreleasedReturnValue();
      v237 = -[SFCommandRowCardSection initWithProtobuf:](v235, "initWithProtobuf:", v236);
      -[SFCardSectionValue setCommandRowCardSection:](v5, "setCommandRowCardSection:", v237);

    }
    objc_msgSend(v4, "leadingTrailingCardSection");
    v238 = (void *)objc_claimAutoreleasedReturnValue();

    if (v238)
    {
      v239 = [SFLeadingTrailingCardSection alloc];
      objc_msgSend(v4, "leadingTrailingCardSection");
      v240 = (void *)objc_claimAutoreleasedReturnValue();
      v241 = -[SFLeadingTrailingCardSection initWithProtobuf:](v239, "initWithProtobuf:", v240);
      -[SFCardSectionValue setLeadingTrailingCardSection:](v5, "setLeadingTrailingCardSection:", v241);

    }
    objc_msgSend(v4, "heroTitleCardSection");
    v242 = (void *)objc_claimAutoreleasedReturnValue();

    if (v242)
    {
      v243 = [SFHeroTitleCardSection alloc];
      objc_msgSend(v4, "heroTitleCardSection");
      v244 = (void *)objc_claimAutoreleasedReturnValue();
      v245 = -[SFHeroTitleCardSection initWithProtobuf:](v243, "initWithProtobuf:", v244);
      -[SFCardSectionValue setHeroTitleCardSection:](v5, "setHeroTitleCardSection:", v245);

    }
    objc_msgSend(v4, "archiveViewCardSection");
    v246 = (void *)objc_claimAutoreleasedReturnValue();

    if (v246)
    {
      v247 = [SFArchiveViewCardSection alloc];
      objc_msgSend(v4, "archiveViewCardSection");
      v248 = (void *)objc_claimAutoreleasedReturnValue();
      v249 = -[SFArchiveViewCardSection initWithProtobuf:](v247, "initWithProtobuf:", v248);
      -[SFCardSectionValue setArchiveViewCardSection:](v5, "setArchiveViewCardSection:", v249);

    }
    objc_msgSend(v4, "appIconCardSection");
    v250 = (void *)objc_claimAutoreleasedReturnValue();

    if (v250)
    {
      v251 = [SFAppIconCardSection alloc];
      objc_msgSend(v4, "appIconCardSection");
      v252 = (void *)objc_claimAutoreleasedReturnValue();
      v253 = -[SFAppIconCardSection initWithProtobuf:](v251, "initWithProtobuf:", v252);
      -[SFCardSectionValue setAppIconCardSection:](v5, "setAppIconCardSection:", v253);

    }
    objc_msgSend(v4, "largeTitleDetailedRowCardSection");
    v254 = (void *)objc_claimAutoreleasedReturnValue();

    if (v254)
    {
      v255 = [SFLargeTitleDetailedRowCardSection alloc];
      objc_msgSend(v4, "largeTitleDetailedRowCardSection");
      v256 = (void *)objc_claimAutoreleasedReturnValue();
      v257 = -[SFLargeTitleDetailedRowCardSection initWithProtobuf:](v255, "initWithProtobuf:", v256);
      -[SFCardSectionValue setLargeTitleDetailedRowCardSection:](v5, "setLargeTitleDetailedRowCardSection:", v257);

    }
    objc_msgSend(v4, "safariTableOfContentsCardSection");
    v258 = (void *)objc_claimAutoreleasedReturnValue();

    if (v258)
    {
      v259 = [SFSafariTableOfContentsCardSection alloc];
      objc_msgSend(v4, "safariTableOfContentsCardSection");
      v260 = (void *)objc_claimAutoreleasedReturnValue();
      v261 = -[SFSafariTableOfContentsCardSection initWithProtobuf:](v259, "initWithProtobuf:", v260);
      -[SFCardSectionValue setSafariTableOfContentsCardSection:](v5, "setSafariTableOfContentsCardSection:", v261);

    }
    objc_msgSend(v4, "rfSummaryItemShortNumberCardSection");
    v262 = (void *)objc_claimAutoreleasedReturnValue();

    if (v262)
    {
      v263 = [RFSummaryItemShortNumberCardSection alloc];
      objc_msgSend(v4, "rfSummaryItemShortNumberCardSection");
      v264 = (void *)objc_claimAutoreleasedReturnValue();
      v265 = -[RFSummaryItemShortNumberCardSection initWithProtobuf:](v263, "initWithProtobuf:", v264);
      -[SFCardSectionValue setRfSummaryItemShortNumberCardSection:](v5, "setRfSummaryItemShortNumberCardSection:", v265);

    }
    objc_msgSend(v4, "rfSummaryItemTextCardSection");
    v266 = (void *)objc_claimAutoreleasedReturnValue();

    if (v266)
    {
      v267 = [RFSummaryItemTextCardSection alloc];
      objc_msgSend(v4, "rfSummaryItemTextCardSection");
      v268 = (void *)objc_claimAutoreleasedReturnValue();
      v269 = -[RFSummaryItemTextCardSection initWithProtobuf:](v267, "initWithProtobuf:", v268);
      -[SFCardSectionValue setRfSummaryItemTextCardSection:](v5, "setRfSummaryItemTextCardSection:", v269);

    }
    objc_msgSend(v4, "rfSummaryItemStandardCardSection");
    v270 = (void *)objc_claimAutoreleasedReturnValue();

    if (v270)
    {
      v271 = [RFSummaryItemStandardCardSection alloc];
      objc_msgSend(v4, "rfSummaryItemStandardCardSection");
      v272 = (void *)objc_claimAutoreleasedReturnValue();
      v273 = -[RFSummaryItemStandardCardSection initWithProtobuf:](v271, "initWithProtobuf:", v272);
      -[SFCardSectionValue setRfSummaryItemStandardCardSection:](v5, "setRfSummaryItemStandardCardSection:", v273);

    }
    objc_msgSend(v4, "rfFactItemShortNumberCardSection");
    v274 = (void *)objc_claimAutoreleasedReturnValue();

    if (v274)
    {
      v275 = [RFFactItemShortNumberCardSection alloc];
      objc_msgSend(v4, "rfFactItemShortNumberCardSection");
      v276 = (void *)objc_claimAutoreleasedReturnValue();
      v277 = -[RFFactItemShortNumberCardSection initWithProtobuf:](v275, "initWithProtobuf:", v276);
      -[SFCardSectionValue setRfFactItemShortNumberCardSection:](v5, "setRfFactItemShortNumberCardSection:", v277);

    }
    objc_msgSend(v4, "rfFactItemStandardCardSection");
    v278 = (void *)objc_claimAutoreleasedReturnValue();

    if (v278)
    {
      v279 = [RFFactItemStandardCardSection alloc];
      objc_msgSend(v4, "rfFactItemStandardCardSection");
      v280 = (void *)objc_claimAutoreleasedReturnValue();
      v281 = -[RFFactItemStandardCardSection initWithProtobuf:](v279, "initWithProtobuf:", v280);
      -[SFCardSectionValue setRfFactItemStandardCardSection:](v5, "setRfFactItemStandardCardSection:", v281);

    }
    objc_msgSend(v4, "rfLongItemStandardCardSection");
    v282 = (void *)objc_claimAutoreleasedReturnValue();

    if (v282)
    {
      v283 = [RFLongItemStandardCardSection alloc];
      objc_msgSend(v4, "rfLongItemStandardCardSection");
      v284 = (void *)objc_claimAutoreleasedReturnValue();
      v285 = -[RFLongItemStandardCardSection initWithProtobuf:](v283, "initWithProtobuf:", v284);
      -[SFCardSectionValue setRfLongItemStandardCardSection:](v5, "setRfLongItemStandardCardSection:", v285);

    }
    objc_msgSend(v4, "rfPrimaryHeaderRichCardSection");
    v286 = (void *)objc_claimAutoreleasedReturnValue();

    if (v286)
    {
      v287 = [RFPrimaryHeaderRichCardSection alloc];
      objc_msgSend(v4, "rfPrimaryHeaderRichCardSection");
      v288 = (void *)objc_claimAutoreleasedReturnValue();
      v289 = -[RFPrimaryHeaderRichCardSection initWithProtobuf:](v287, "initWithProtobuf:", v288);
      -[SFCardSectionValue setRfPrimaryHeaderRichCardSection:](v5, "setRfPrimaryHeaderRichCardSection:", v289);

    }
    objc_msgSend(v4, "rfPrimaryHeaderStandardCardSection");
    v290 = (void *)objc_claimAutoreleasedReturnValue();

    if (v290)
    {
      v291 = [RFPrimaryHeaderStandardCardSection alloc];
      objc_msgSend(v4, "rfPrimaryHeaderStandardCardSection");
      v292 = (void *)objc_claimAutoreleasedReturnValue();
      v293 = -[RFPrimaryHeaderStandardCardSection initWithProtobuf:](v291, "initWithProtobuf:", v292);
      -[SFCardSectionValue setRfPrimaryHeaderStandardCardSection:](v5, "setRfPrimaryHeaderStandardCardSection:", v293);

    }
    objc_msgSend(v4, "rfReferenceFootnoteCardSection");
    v294 = (void *)objc_claimAutoreleasedReturnValue();

    if (v294)
    {
      v295 = [RFReferenceFootnoteCardSection alloc];
      objc_msgSend(v4, "rfReferenceFootnoteCardSection");
      v296 = (void *)objc_claimAutoreleasedReturnValue();
      v297 = -[RFReferenceFootnoteCardSection initWithProtobuf:](v295, "initWithProtobuf:", v296);
      -[SFCardSectionValue setRfReferenceFootnoteCardSection:](v5, "setRfReferenceFootnoteCardSection:", v297);

    }
    objc_msgSend(v4, "rfReferenceRichCardSection");
    v298 = (void *)objc_claimAutoreleasedReturnValue();

    if (v298)
    {
      v299 = [RFReferenceRichCardSection alloc];
      objc_msgSend(v4, "rfReferenceRichCardSection");
      v300 = (void *)objc_claimAutoreleasedReturnValue();
      v301 = -[RFReferenceRichCardSection initWithProtobuf:](v299, "initWithProtobuf:", v300);
      -[SFCardSectionValue setRfReferenceRichCardSection:](v5, "setRfReferenceRichCardSection:", v301);

    }
    objc_msgSend(v4, "rfSimpleItemRichCardSection");
    v302 = (void *)objc_claimAutoreleasedReturnValue();

    if (v302)
    {
      v303 = [RFSimpleItemRichCardSection alloc];
      objc_msgSend(v4, "rfSimpleItemRichCardSection");
      v304 = (void *)objc_claimAutoreleasedReturnValue();
      v305 = -[RFSimpleItemRichCardSection initWithProtobuf:](v303, "initWithProtobuf:", v304);
      -[SFCardSectionValue setRfSimpleItemRichCardSection:](v5, "setRfSimpleItemRichCardSection:", v305);

    }
    objc_msgSend(v4, "rfSimpleItemStandardCardSection");
    v306 = (void *)objc_claimAutoreleasedReturnValue();

    if (v306)
    {
      v307 = [RFSimpleItemStandardCardSection alloc];
      objc_msgSend(v4, "rfSimpleItemStandardCardSection");
      v308 = (void *)objc_claimAutoreleasedReturnValue();
      v309 = -[RFSimpleItemStandardCardSection initWithProtobuf:](v307, "initWithProtobuf:", v308);
      -[SFCardSectionValue setRfSimpleItemStandardCardSection:](v5, "setRfSimpleItemStandardCardSection:", v309);

    }
    objc_msgSend(v4, "rfSummaryItemAlignedTextCardSection");
    v310 = (void *)objc_claimAutoreleasedReturnValue();

    if (v310)
    {
      v311 = [RFSummaryItemAlignedTextCardSection alloc];
      objc_msgSend(v4, "rfSummaryItemAlignedTextCardSection");
      v312 = (void *)objc_claimAutoreleasedReturnValue();
      v313 = -[RFSummaryItemAlignedTextCardSection initWithProtobuf:](v311, "initWithProtobuf:", v312);
      -[SFCardSectionValue setRfSummaryItemAlignedTextCardSection:](v5, "setRfSummaryItemAlignedTextCardSection:", v313);

    }
    objc_msgSend(v4, "rfExpandableStandardCardSection");
    v314 = (void *)objc_claimAutoreleasedReturnValue();

    if (v314)
    {
      v315 = [RFExpandableStandardCardSection alloc];
      objc_msgSend(v4, "rfExpandableStandardCardSection");
      v316 = (void *)objc_claimAutoreleasedReturnValue();
      v317 = -[RFExpandableStandardCardSection initWithProtobuf:](v315, "initWithProtobuf:", v316);
      -[SFCardSectionValue setRfExpandableStandardCardSection:](v5, "setRfExpandableStandardCardSection:", v317);

    }
    objc_msgSend(v4, "rfFactItemButtonCardSection");
    v318 = (void *)objc_claimAutoreleasedReturnValue();

    if (v318)
    {
      v319 = [RFFactItemButtonCardSection alloc];
      objc_msgSend(v4, "rfFactItemButtonCardSection");
      v320 = (void *)objc_claimAutoreleasedReturnValue();
      v321 = -[RFFactItemButtonCardSection initWithProtobuf:](v319, "initWithProtobuf:", v320);
      -[SFCardSectionValue setRfFactItemButtonCardSection:](v5, "setRfFactItemButtonCardSection:", v321);

    }
    objc_msgSend(v4, "rfFactItemHeroNumberCardSection");
    v322 = (void *)objc_claimAutoreleasedReturnValue();

    if (v322)
    {
      v323 = [RFFactItemHeroNumberCardSection alloc];
      objc_msgSend(v4, "rfFactItemHeroNumberCardSection");
      v324 = (void *)objc_claimAutoreleasedReturnValue();
      v325 = -[RFFactItemHeroNumberCardSection initWithProtobuf:](v323, "initWithProtobuf:", v324);
      -[SFCardSectionValue setRfFactItemHeroNumberCardSection:](v5, "setRfFactItemHeroNumberCardSection:", v325);

    }
    objc_msgSend(v4, "rfPrimaryHeaderMarqueeCardSection");
    v326 = (void *)objc_claimAutoreleasedReturnValue();

    if (v326)
    {
      v327 = [RFPrimaryHeaderMarqueeCardSection alloc];
      objc_msgSend(v4, "rfPrimaryHeaderMarqueeCardSection");
      v328 = (void *)objc_claimAutoreleasedReturnValue();
      v329 = -[RFPrimaryHeaderMarqueeCardSection initWithProtobuf:](v327, "initWithProtobuf:", v328);
      -[SFCardSectionValue setRfPrimaryHeaderMarqueeCardSection:](v5, "setRfPrimaryHeaderMarqueeCardSection:", v329);

    }
    objc_msgSend(v4, "rfSummaryItemDetailedTextCardSection");
    v330 = (void *)objc_claimAutoreleasedReturnValue();

    if (v330)
    {
      v331 = [RFSummaryItemDetailedTextCardSection alloc];
      objc_msgSend(v4, "rfSummaryItemDetailedTextCardSection");
      v332 = (void *)objc_claimAutoreleasedReturnValue();
      v333 = -[RFSummaryItemDetailedTextCardSection initWithProtobuf:](v331, "initWithProtobuf:", v332);
      -[SFCardSectionValue setRfSummaryItemDetailedTextCardSection:](v5, "setRfSummaryItemDetailedTextCardSection:", v333);

    }
    objc_msgSend(v4, "rfSimpleItemPlayerCardSection");
    v334 = (void *)objc_claimAutoreleasedReturnValue();

    if (v334)
    {
      v335 = [RFSimpleItemPlayerCardSection alloc];
      objc_msgSend(v4, "rfSimpleItemPlayerCardSection");
      v336 = (void *)objc_claimAutoreleasedReturnValue();
      v337 = -[RFSimpleItemPlayerCardSection initWithProtobuf:](v335, "initWithProtobuf:", v336);
      -[SFCardSectionValue setRfSimpleItemPlayerCardSection:](v5, "setRfSimpleItemPlayerCardSection:", v337);

    }
    objc_msgSend(v4, "rfSummaryItemPairCardSection");
    v338 = (void *)objc_claimAutoreleasedReturnValue();

    if (v338)
    {
      v339 = [RFSummaryItemPairCardSection alloc];
      objc_msgSend(v4, "rfSummaryItemPairCardSection");
      v340 = (void *)objc_claimAutoreleasedReturnValue();
      v341 = -[RFSummaryItemPairCardSection initWithProtobuf:](v339, "initWithProtobuf:", v340);
      -[SFCardSectionValue setRfSummaryItemPairCardSection:](v5, "setRfSummaryItemPairCardSection:", v341);

    }
    objc_msgSend(v4, "rfSummaryItemPairNumberCardSection");
    v342 = (void *)objc_claimAutoreleasedReturnValue();

    if (v342)
    {
      v343 = [RFSummaryItemPairNumberCardSection alloc];
      objc_msgSend(v4, "rfSummaryItemPairNumberCardSection");
      v344 = (void *)objc_claimAutoreleasedReturnValue();
      v345 = -[RFSummaryItemPairNumberCardSection initWithProtobuf:](v343, "initWithProtobuf:", v344);
      -[SFCardSectionValue setRfSummaryItemPairNumberCardSection:](v5, "setRfSummaryItemPairNumberCardSection:", v345);

    }
    objc_msgSend(v4, "rfFactItemShortHeroNumberCardSection");
    v346 = (void *)objc_claimAutoreleasedReturnValue();

    if (v346)
    {
      v347 = [RFFactItemShortHeroNumberCardSection alloc];
      objc_msgSend(v4, "rfFactItemShortHeroNumberCardSection");
      v348 = (void *)objc_claimAutoreleasedReturnValue();
      v349 = -[RFFactItemShortHeroNumberCardSection initWithProtobuf:](v347, "initWithProtobuf:", v348);
      -[SFCardSectionValue setRfFactItemShortHeroNumberCardSection:](v5, "setRfFactItemShortHeroNumberCardSection:", v349);

    }
    objc_msgSend(v4, "rfFactItemDetailedNumberCardSection");
    v350 = (void *)objc_claimAutoreleasedReturnValue();

    if (v350)
    {
      v351 = [RFFactItemDetailedNumberCardSection alloc];
      objc_msgSend(v4, "rfFactItemDetailedNumberCardSection");
      v352 = (void *)objc_claimAutoreleasedReturnValue();
      v353 = -[RFFactItemDetailedNumberCardSection initWithProtobuf:](v351, "initWithProtobuf:", v352);
      -[SFCardSectionValue setRfFactItemDetailedNumberCardSection:](v5, "setRfFactItemDetailedNumberCardSection:", v353);

    }
    objc_msgSend(v4, "rfFactItemHeroButtonCardSection");
    v354 = (void *)objc_claimAutoreleasedReturnValue();

    if (v354)
    {
      v355 = [RFFactItemHeroButtonCardSection alloc];
      objc_msgSend(v4, "rfFactItemHeroButtonCardSection");
      v356 = (void *)objc_claimAutoreleasedReturnValue();
      v357 = -[RFFactItemHeroButtonCardSection initWithProtobuf:](v355, "initWithProtobuf:", v356);
      -[SFCardSectionValue setRfFactItemHeroButtonCardSection:](v5, "setRfFactItemHeroButtonCardSection:", v357);

    }
    objc_msgSend(v4, "rfFactItemImageRightCardSection");
    v358 = (void *)objc_claimAutoreleasedReturnValue();

    if (v358)
    {
      v359 = [RFFactItemImageRightCardSection alloc];
      objc_msgSend(v4, "rfFactItemImageRightCardSection");
      v360 = (void *)objc_claimAutoreleasedReturnValue();
      v361 = -[RFFactItemImageRightCardSection initWithProtobuf:](v359, "initWithProtobuf:", v360);
      -[SFCardSectionValue setRfFactItemImageRightCardSection:](v5, "setRfFactItemImageRightCardSection:", v361);

    }
    objc_msgSend(v4, "rfSummaryItemSwitchV2CardSection");
    v362 = (void *)objc_claimAutoreleasedReturnValue();

    if (v362)
    {
      v363 = [RFSummaryItemSwitchV2CardSection alloc];
      objc_msgSend(v4, "rfSummaryItemSwitchV2CardSection");
      v364 = (void *)objc_claimAutoreleasedReturnValue();
      v365 = -[RFSummaryItemSwitchV2CardSection initWithProtobuf:](v363, "initWithProtobuf:", v364);
      -[SFCardSectionValue setRfSummaryItemSwitchV2CardSection:](v5, "setRfSummaryItemSwitchV2CardSection:", v365);

    }
    objc_msgSend(v4, "rfTableHeaderCardSection");
    v366 = (void *)objc_claimAutoreleasedReturnValue();

    if (v366)
    {
      v367 = [RFTableHeaderCardSection alloc];
      objc_msgSend(v4, "rfTableHeaderCardSection");
      v368 = (void *)objc_claimAutoreleasedReturnValue();
      v369 = -[RFTableHeaderCardSection initWithProtobuf:](v367, "initWithProtobuf:", v368);
      -[SFCardSectionValue setRfTableHeaderCardSection:](v5, "setRfTableHeaderCardSection:", v369);

    }
    objc_msgSend(v4, "rfTableRowCardSection");
    v370 = (void *)objc_claimAutoreleasedReturnValue();

    if (v370)
    {
      v371 = [RFTableRowCardSection alloc];
      objc_msgSend(v4, "rfTableRowCardSection");
      v372 = (void *)objc_claimAutoreleasedReturnValue();
      v373 = -[RFTableRowCardSection initWithProtobuf:](v371, "initWithProtobuf:", v372);
      -[SFCardSectionValue setRfTableRowCardSection:](v5, "setRfTableRowCardSection:", v373);

    }
    objc_msgSend(v4, "rfSimpleItemVisualElementCardSection");
    v374 = (void *)objc_claimAutoreleasedReturnValue();

    if (v374)
    {
      v375 = [RFSimpleItemVisualElementCardSection alloc];
      objc_msgSend(v4, "rfSimpleItemVisualElementCardSection");
      v376 = (void *)objc_claimAutoreleasedReturnValue();
      v377 = -[RFSimpleItemVisualElementCardSection initWithProtobuf:](v375, "initWithProtobuf:", v376);
      -[SFCardSectionValue setRfSimpleItemVisualElementCardSection:](v5, "setRfSimpleItemVisualElementCardSection:", v377);

    }
    objc_msgSend(v4, "rfSummaryItemPlayerCardSection");
    v378 = (void *)objc_claimAutoreleasedReturnValue();

    if (v378)
    {
      v379 = [RFSummaryItemPlayerCardSection alloc];
      objc_msgSend(v4, "rfSummaryItemPlayerCardSection");
      v380 = (void *)objc_claimAutoreleasedReturnValue();
      v381 = -[RFSummaryItemPlayerCardSection initWithProtobuf:](v379, "initWithProtobuf:", v380);
      -[SFCardSectionValue setRfSummaryItemPlayerCardSection:](v5, "setRfSummaryItemPlayerCardSection:", v381);

    }
    objc_msgSend(v4, "rfSummaryItemImageRightCardSection");
    v382 = (void *)objc_claimAutoreleasedReturnValue();

    if (v382)
    {
      v383 = [RFSummaryItemImageRightCardSection alloc];
      objc_msgSend(v4, "rfSummaryItemImageRightCardSection");
      v384 = (void *)objc_claimAutoreleasedReturnValue();
      v385 = -[RFSummaryItemImageRightCardSection initWithProtobuf:](v383, "initWithProtobuf:", v384);
      -[SFCardSectionValue setRfSummaryItemImageRightCardSection:](v5, "setRfSummaryItemImageRightCardSection:", v385);

    }
    objc_msgSend(v4, "rfSummaryItemButtonCardSection");
    v386 = (void *)objc_claimAutoreleasedReturnValue();

    if (v386)
    {
      v387 = [RFSummaryItemButtonCardSection alloc];
      objc_msgSend(v4, "rfSummaryItemButtonCardSection");
      v388 = (void *)objc_claimAutoreleasedReturnValue();
      v389 = -[RFSummaryItemButtonCardSection initWithProtobuf:](v387, "initWithProtobuf:", v388);
      -[SFCardSectionValue setRfSummaryItemButtonCardSection:](v5, "setRfSummaryItemButtonCardSection:", v389);

    }
    objc_msgSend(v4, "rfSimpleItemReverseRichCardSection");
    v390 = (void *)objc_claimAutoreleasedReturnValue();

    if (v390)
    {
      v391 = [RFSimpleItemReverseRichCardSection alloc];
      objc_msgSend(v4, "rfSimpleItemReverseRichCardSection");
      v392 = (void *)objc_claimAutoreleasedReturnValue();
      v393 = -[RFSimpleItemReverseRichCardSection initWithProtobuf:](v391, "initWithProtobuf:", v392);
      -[SFCardSectionValue setRfSimpleItemReverseRichCardSection:](v5, "setRfSimpleItemReverseRichCardSection:", v393);

    }
    objc_msgSend(v4, "rfSimpleItemRichSearchResultCardSection");
    v394 = (void *)objc_claimAutoreleasedReturnValue();

    if (v394)
    {
      v395 = [RFSimpleItemRichSearchResultCardSection alloc];
      objc_msgSend(v4, "rfSimpleItemRichSearchResultCardSection");
      v396 = (void *)objc_claimAutoreleasedReturnValue();
      v397 = -[RFSimpleItemRichSearchResultCardSection initWithProtobuf:](v395, "initWithProtobuf:", v396);
      -[SFCardSectionValue setRfSimpleItemRichSearchResultCardSection:](v5, "setRfSimpleItemRichSearchResultCardSection:", v397);

    }
    objc_msgSend(v4, "rfPrimaryHeaderStackedImageCardSection");
    v398 = (void *)objc_claimAutoreleasedReturnValue();

    if (v398)
    {
      v399 = [RFPrimaryHeaderStackedImageCardSection alloc];
      objc_msgSend(v4, "rfPrimaryHeaderStackedImageCardSection");
      v400 = (void *)objc_claimAutoreleasedReturnValue();
      v401 = -[RFPrimaryHeaderStackedImageCardSection initWithProtobuf:](v399, "initWithProtobuf:", v400);
      -[SFCardSectionValue setRfPrimaryHeaderStackedImageCardSection:](v5, "setRfPrimaryHeaderStackedImageCardSection:", v401);

    }
    objc_msgSend(v4, "rfReferenceItemLogoCardSection");
    v402 = (void *)objc_claimAutoreleasedReturnValue();

    if (v402)
    {
      v403 = [RFReferenceItemLogoCardSection alloc];
      objc_msgSend(v4, "rfReferenceItemLogoCardSection");
      v404 = (void *)objc_claimAutoreleasedReturnValue();
      v405 = -[RFReferenceItemLogoCardSection initWithProtobuf:](v403, "initWithProtobuf:", v404);
      -[SFCardSectionValue setRfReferenceItemLogoCardSection:](v5, "setRfReferenceItemLogoCardSection:", v405);

    }
    objc_msgSend(v4, "rfReferenceItemButtonCardSection");
    v406 = (void *)objc_claimAutoreleasedReturnValue();

    if (v406)
    {
      v407 = [RFReferenceItemButtonCardSection alloc];
      objc_msgSend(v4, "rfReferenceItemButtonCardSection");
      v408 = (void *)objc_claimAutoreleasedReturnValue();
      v409 = -[RFReferenceItemButtonCardSection initWithProtobuf:](v407, "initWithProtobuf:", v408);
      -[SFCardSectionValue setRfReferenceItemButtonCardSection:](v5, "setRfReferenceItemButtonCardSection:", v409);

    }
    objc_msgSend(v4, "rfButtonCardSection");
    v410 = (void *)objc_claimAutoreleasedReturnValue();

    if (v410)
    {
      v411 = [RFButtonCardSection alloc];
      objc_msgSend(v4, "rfButtonCardSection");
      v412 = (void *)objc_claimAutoreleasedReturnValue();
      v413 = -[RFButtonCardSection initWithProtobuf:](v411, "initWithProtobuf:", v412);
      -[SFCardSectionValue setRfButtonCardSection:](v5, "setRfButtonCardSection:", v413);

    }
    objc_msgSend(v4, "rfBinaryButtonCardSection");
    v414 = (void *)objc_claimAutoreleasedReturnValue();

    if (v414)
    {
      v415 = [RFBinaryButtonCardSection alloc];
      objc_msgSend(v4, "rfBinaryButtonCardSection");
      v416 = (void *)objc_claimAutoreleasedReturnValue();
      v417 = -[RFBinaryButtonCardSection initWithProtobuf:](v415, "initWithProtobuf:", v416);
      -[SFCardSectionValue setRfBinaryButtonCardSection:](v5, "setRfBinaryButtonCardSection:", v417);

    }
    objc_msgSend(v4, "rfReferenceCenteredCardSection");
    v418 = (void *)objc_claimAutoreleasedReturnValue();

    if (v418)
    {
      v419 = [RFReferenceCenteredCardSection alloc];
      objc_msgSend(v4, "rfReferenceCenteredCardSection");
      v420 = (void *)objc_claimAutoreleasedReturnValue();
      v421 = -[RFReferenceCenteredCardSection initWithProtobuf:](v419, "initWithProtobuf:", v420);
      -[SFCardSectionValue setRfReferenceCenteredCardSection:](v5, "setRfReferenceCenteredCardSection:", v421);

    }
    objc_msgSend(v4, "rfSecondaryHeaderStandardCardSection");
    v422 = (void *)objc_claimAutoreleasedReturnValue();

    if (v422)
    {
      v423 = [RFSecondaryHeaderStandardCardSection alloc];
      objc_msgSend(v4, "rfSecondaryHeaderStandardCardSection");
      v424 = (void *)objc_claimAutoreleasedReturnValue();
      v425 = -[RFSecondaryHeaderStandardCardSection initWithProtobuf:](v423, "initWithProtobuf:", v424);
      -[SFCardSectionValue setRfSecondaryHeaderStandardCardSection:](v5, "setRfSecondaryHeaderStandardCardSection:", v425);

    }
    objc_msgSend(v4, "rfSecondaryHeaderEmphasizedCardSection");
    v426 = (void *)objc_claimAutoreleasedReturnValue();

    if (v426)
    {
      v427 = [RFSecondaryHeaderEmphasizedCardSection alloc];
      objc_msgSend(v4, "rfSecondaryHeaderEmphasizedCardSection");
      v428 = (void *)objc_claimAutoreleasedReturnValue();
      v429 = -[RFSecondaryHeaderEmphasizedCardSection initWithProtobuf:](v427, "initWithProtobuf:", v428);
      -[SFCardSectionValue setRfSecondaryHeaderEmphasizedCardSection:](v5, "setRfSecondaryHeaderEmphasizedCardSection:", v429);

    }
    objc_msgSend(v4, "rfMapCardSection");
    v430 = (void *)objc_claimAutoreleasedReturnValue();

    if (v430)
    {
      v431 = [RFMapCardSection alloc];
      objc_msgSend(v4, "rfMapCardSection");
      v432 = (void *)objc_claimAutoreleasedReturnValue();
      v433 = -[RFMapCardSection initWithProtobuf:](v431, "initWithProtobuf:", v432);
      -[SFCardSectionValue setRfMapCardSection:](v5, "setRfMapCardSection:", v433);

    }
    objc_msgSend(v4, "rfReferenceStandardCardSection");
    v434 = (void *)objc_claimAutoreleasedReturnValue();

    if (v434)
    {
      v435 = [RFReferenceStandardCardSection alloc];
      objc_msgSend(v4, "rfReferenceStandardCardSection");
      v436 = (void *)objc_claimAutoreleasedReturnValue();
      v437 = -[RFReferenceStandardCardSection initWithProtobuf:](v435, "initWithProtobuf:", v436);
      -[SFCardSectionValue setRfReferenceStandardCardSection:](v5, "setRfReferenceStandardCardSection:", v437);

    }
    objc_msgSend(v4, "rfMultiButtonCardSection");
    v438 = (void *)objc_claimAutoreleasedReturnValue();

    if (v438)
    {
      v439 = [RFMultiButtonCardSection alloc];
      objc_msgSend(v4, "rfMultiButtonCardSection");
      v440 = (void *)objc_claimAutoreleasedReturnValue();
      v441 = -[RFMultiButtonCardSection initWithProtobuf:](v439, "initWithProtobuf:", v440);
      -[SFCardSectionValue setRfMultiButtonCardSection:](v5, "setRfMultiButtonCardSection:", v441);

    }
    objc_msgSend(v4, "rfDisambiguationTitleCardSection");
    v442 = (void *)objc_claimAutoreleasedReturnValue();

    if (v442)
    {
      v443 = [RFDisambiguationTitleCardSection alloc];
      objc_msgSend(v4, "rfDisambiguationTitleCardSection");
      v444 = (void *)objc_claimAutoreleasedReturnValue();
      v445 = -[RFDisambiguationTitleCardSection initWithProtobuf:](v443, "initWithProtobuf:", v444);
      -[SFCardSectionValue setRfDisambiguationTitleCardSection:](v5, "setRfDisambiguationTitleCardSection:", v445);

    }
    v446 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFCardSectionValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBCardSectionValue *v6;
  SFCardSectionValue *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBCardSectionValue initWithData:]([_SFPBCardSectionValue alloc], "initWithData:", v5);
  v7 = -[SFCardSectionValue initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBCardSectionValue *v6;

  v4 = a3;
  v6 = -[_SFPBCardSectionValue initWithFacade:]([_SFPBCardSectionValue alloc], "initWithFacade:", self);
  -[_SFPBCardSectionValue data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBCardSectionValue *v2;
  void *v3;

  v2 = -[_SFPBCardSectionValue initWithFacade:]([_SFPBCardSectionValue alloc], "initWithFacade:", self);
  -[_SFPBCardSectionValue dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBCardSectionValue *v2;
  void *v3;

  v2 = -[_SFPBCardSectionValue initWithFacade:]([_SFPBCardSectionValue alloc], "initWithFacade:", self);
  -[_SFPBCardSectionValue jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
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

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SFCardSectionValue appLinkCardSection](self, "appLinkCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setAppLinkCardSection:", v6);

  -[SFCardSectionValue descriptionCardSection](self, "descriptionCardSection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setDescriptionCardSection:", v8);

  -[SFCardSectionValue keyValueDataCardSection](self, "keyValueDataCardSection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setKeyValueDataCardSection:", v10);

  -[SFCardSectionValue mapCardSection](self, "mapCardSection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setMapCardSection:", v12);

  -[SFCardSectionValue mediaInfoCardSection](self, "mediaInfoCardSection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setMediaInfoCardSection:", v14);

  -[SFCardSectionValue mediaPlayerCardSection](self, "mediaPlayerCardSection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setMediaPlayerCardSection:", v16);

  -[SFCardSectionValue nowPlayingCardSection](self, "nowPlayingCardSection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setNowPlayingCardSection:", v18);

  -[SFCardSectionValue richTitleCardSection](self, "richTitleCardSection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setRichTitleCardSection:", v20);

  -[SFCardSectionValue rowCardSection](self, "rowCardSection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  objc_msgSend(v4, "setRowCardSection:", v22);

  -[SFCardSectionValue scoreboardCardSection](self, "scoreboardCardSection");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "copy");
  objc_msgSend(v4, "setScoreboardCardSection:", v24);

  -[SFCardSectionValue socialMediaPostCardSection](self, "socialMediaPostCardSection");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "copy");
  objc_msgSend(v4, "setSocialMediaPostCardSection:", v26);

  -[SFCardSectionValue stockChartCardSection](self, "stockChartCardSection");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v27, "copy");
  objc_msgSend(v4, "setStockChartCardSection:", v28);

  -[SFCardSectionValue tableHeaderRowCardSection](self, "tableHeaderRowCardSection");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v29, "copy");
  objc_msgSend(v4, "setTableHeaderRowCardSection:", v30);

  -[SFCardSectionValue tableRowCardSection](self, "tableRowCardSection");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v31, "copy");
  objc_msgSend(v4, "setTableRowCardSection:", v32);

  -[SFCardSectionValue textColumnsCardSection](self, "textColumnsCardSection");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v33, "copy");
  objc_msgSend(v4, "setTextColumnsCardSection:", v34);

  -[SFCardSectionValue titleCardSection](self, "titleCardSection");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v35, "copy");
  objc_msgSend(v4, "setTitleCardSection:", v36);

  -[SFCardSectionValue trackListCardSection](self, "trackListCardSection");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v37, "copy");
  objc_msgSend(v4, "setTrackListCardSection:", v38);

  -[SFCardSectionValue audioPlaybackCardSection](self, "audioPlaybackCardSection");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v39, "copy");
  objc_msgSend(v4, "setAudioPlaybackCardSection:", v40);

  -[SFCardSectionValue flightCardSection](self, "flightCardSection");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v41, "copy");
  objc_msgSend(v4, "setFlightCardSection:", v42);

  -[SFCardSectionValue activityIndicatorCardSection](self, "activityIndicatorCardSection");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)objc_msgSend(v43, "copy");
  objc_msgSend(v4, "setActivityIndicatorCardSection:", v44);

  -[SFCardSectionValue webCardSection](self, "webCardSection");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)objc_msgSend(v45, "copy");
  objc_msgSend(v4, "setWebCardSection:", v46);

  -[SFCardSectionValue messageCardSection](self, "messageCardSection");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)objc_msgSend(v47, "copy");
  objc_msgSend(v4, "setMessageCardSection:", v48);

  -[SFCardSectionValue detailedRowCardSection](self, "detailedRowCardSection");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)objc_msgSend(v49, "copy");
  objc_msgSend(v4, "setDetailedRowCardSection:", v50);

  -[SFCardSectionValue imagesCardSection](self, "imagesCardSection");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (void *)objc_msgSend(v51, "copy");
  objc_msgSend(v4, "setImagesCardSection:", v52);

  -[SFCardSectionValue suggestionCardSection](self, "suggestionCardSection");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (void *)objc_msgSend(v53, "copy");
  objc_msgSend(v4, "setSuggestionCardSection:", v54);

  -[SFCardSectionValue selectableGridCardSection](self, "selectableGridCardSection");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = (void *)objc_msgSend(v55, "copy");
  objc_msgSend(v4, "setSelectableGridCardSection:", v56);

  -[SFCardSectionValue sectionHeaderCardSection](self, "sectionHeaderCardSection");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = (void *)objc_msgSend(v57, "copy");
  objc_msgSend(v4, "setSectionHeaderCardSection:", v58);

  -[SFCardSectionValue metaInfoCardSection](self, "metaInfoCardSection");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (void *)objc_msgSend(v59, "copy");
  objc_msgSend(v4, "setMetaInfoCardSection:", v60);

  -[SFCardSectionValue watchListCardSection](self, "watchListCardSection");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = (void *)objc_msgSend(v61, "copy");
  objc_msgSend(v4, "setWatchListCardSection:", v62);

  -[SFCardSectionValue mapsDetailedRowCardSection](self, "mapsDetailedRowCardSection");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = (void *)objc_msgSend(v63, "copy");
  objc_msgSend(v4, "setMapsDetailedRowCardSection:", v64);

  -[SFCardSectionValue buttonCardSection](self, "buttonCardSection");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = (void *)objc_msgSend(v65, "copy");
  objc_msgSend(v4, "setButtonCardSection:", v66);

  -[SFCardSectionValue horizontalButtonCardSection](self, "horizontalButtonCardSection");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = (void *)objc_msgSend(v67, "copy");
  objc_msgSend(v4, "setHorizontalButtonCardSection:", v68);

  -[SFCardSectionValue verticalLayoutCardSection](self, "verticalLayoutCardSection");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = (void *)objc_msgSend(v69, "copy");
  objc_msgSend(v4, "setVerticalLayoutCardSection:", v70);

  -[SFCardSectionValue productCardSection](self, "productCardSection");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = (void *)objc_msgSend(v71, "copy");
  objc_msgSend(v4, "setProductCardSection:", v72);

  -[SFCardSectionValue horizontalScrollCardSection](self, "horizontalScrollCardSection");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = (void *)objc_msgSend(v73, "copy");
  objc_msgSend(v4, "setHorizontalScrollCardSection:", v74);

  -[SFCardSectionValue mediaRemoteControlCardSection](self, "mediaRemoteControlCardSection");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = (void *)objc_msgSend(v75, "copy");
  objc_msgSend(v4, "setMediaRemoteControlCardSection:", v76);

  -[SFCardSectionValue mapPlaceCardSection](self, "mapPlaceCardSection");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = (void *)objc_msgSend(v77, "copy");
  objc_msgSend(v4, "setMapPlaceCardSection:", v78);

  -[SFCardSectionValue compactRowCardSection](self, "compactRowCardSection");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = (void *)objc_msgSend(v79, "copy");
  objc_msgSend(v4, "setCompactRowCardSection:", v80);

  -[SFCardSectionValue worldMapCardSection](self, "worldMapCardSection");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = (void *)objc_msgSend(v81, "copy");
  objc_msgSend(v4, "setWorldMapCardSection:", v82);

  -[SFCardSectionValue attributionFooterCardSection](self, "attributionFooterCardSection");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = (void *)objc_msgSend(v83, "copy");
  objc_msgSend(v4, "setAttributionFooterCardSection:", v84);

  -[SFCardSectionValue gridCardSection](self, "gridCardSection");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = (void *)objc_msgSend(v85, "copy");
  objc_msgSend(v4, "setGridCardSection:", v86);

  -[SFCardSectionValue personHeaderCardSection](self, "personHeaderCardSection");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = (void *)objc_msgSend(v87, "copy");
  objc_msgSend(v4, "setPersonHeaderCardSection:", v88);

  -[SFCardSectionValue colorBarCardSection](self, "colorBarCardSection");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = (void *)objc_msgSend(v89, "copy");
  objc_msgSend(v4, "setColorBarCardSection:", v90);

  -[SFCardSectionValue splitCardSection](self, "splitCardSection");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = (void *)objc_msgSend(v91, "copy");
  objc_msgSend(v4, "setSplitCardSection:", v92);

  -[SFCardSectionValue linkPresentationCardSection](self, "linkPresentationCardSection");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = (void *)objc_msgSend(v93, "copy");
  objc_msgSend(v4, "setLinkPresentationCardSection:", v94);

  -[SFCardSectionValue findMyCardSection](self, "findMyCardSection");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = (void *)objc_msgSend(v95, "copy");
  objc_msgSend(v4, "setFindMyCardSection:", v96);

  -[SFCardSectionValue heroCardSection](self, "heroCardSection");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = (void *)objc_msgSend(v97, "copy");
  objc_msgSend(v4, "setHeroCardSection:", v98);

  -[SFCardSectionValue newsCardSection](self, "newsCardSection");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = (void *)objc_msgSend(v99, "copy");
  objc_msgSend(v4, "setNewsCardSection:", v100);

  -[SFCardSectionValue miniCardSection](self, "miniCardSection");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = (void *)objc_msgSend(v101, "copy");
  objc_msgSend(v4, "setMiniCardSection:", v102);

  -[SFCardSectionValue infoCardSection](self, "infoCardSection");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = (void *)objc_msgSend(v103, "copy");
  objc_msgSend(v4, "setInfoCardSection:", v104);

  -[SFCardSectionValue collectionCardSection](self, "collectionCardSection");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = (void *)objc_msgSend(v105, "copy");
  objc_msgSend(v4, "setCollectionCardSection:", v106);

  -[SFCardSectionValue combinedCardSection](self, "combinedCardSection");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = (void *)objc_msgSend(v107, "copy");
  objc_msgSend(v4, "setCombinedCardSection:", v108);

  -[SFCardSectionValue responseWrapperCardSection](self, "responseWrapperCardSection");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = (void *)objc_msgSend(v109, "copy");
  objc_msgSend(v4, "setResponseWrapperCardSection:", v110);

  -[SFCardSectionValue listenToCardSection](self, "listenToCardSection");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = (void *)objc_msgSend(v111, "copy");
  objc_msgSend(v4, "setListenToCardSection:", v112);

  -[SFCardSectionValue watchNowCardSection](self, "watchNowCardSection");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = (void *)objc_msgSend(v113, "copy");
  objc_msgSend(v4, "setWatchNowCardSection:", v114);

  -[SFCardSectionValue strokeAnimationCardSection](self, "strokeAnimationCardSection");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = (void *)objc_msgSend(v115, "copy");
  objc_msgSend(v4, "setStrokeAnimationCardSection:", v116);

  -[SFCardSectionValue buttonListCardSection](self, "buttonListCardSection");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = (void *)objc_msgSend(v117, "copy");
  objc_msgSend(v4, "setButtonListCardSection:", v118);

  -[SFCardSectionValue commandRowCardSection](self, "commandRowCardSection");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = (void *)objc_msgSend(v119, "copy");
  objc_msgSend(v4, "setCommandRowCardSection:", v120);

  -[SFCardSectionValue leadingTrailingCardSection](self, "leadingTrailingCardSection");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = (void *)objc_msgSend(v121, "copy");
  objc_msgSend(v4, "setLeadingTrailingCardSection:", v122);

  -[SFCardSectionValue heroTitleCardSection](self, "heroTitleCardSection");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = (void *)objc_msgSend(v123, "copy");
  objc_msgSend(v4, "setHeroTitleCardSection:", v124);

  -[SFCardSectionValue archiveViewCardSection](self, "archiveViewCardSection");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = (void *)objc_msgSend(v125, "copy");
  objc_msgSend(v4, "setArchiveViewCardSection:", v126);

  -[SFCardSectionValue appIconCardSection](self, "appIconCardSection");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = (void *)objc_msgSend(v127, "copy");
  objc_msgSend(v4, "setAppIconCardSection:", v128);

  -[SFCardSectionValue largeTitleDetailedRowCardSection](self, "largeTitleDetailedRowCardSection");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v130 = (void *)objc_msgSend(v129, "copy");
  objc_msgSend(v4, "setLargeTitleDetailedRowCardSection:", v130);

  -[SFCardSectionValue safariTableOfContentsCardSection](self, "safariTableOfContentsCardSection");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v132 = (void *)objc_msgSend(v131, "copy");
  objc_msgSend(v4, "setSafariTableOfContentsCardSection:", v132);

  -[SFCardSectionValue rfSummaryItemShortNumberCardSection](self, "rfSummaryItemShortNumberCardSection");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = (void *)objc_msgSend(v133, "copy");
  objc_msgSend(v4, "setRfSummaryItemShortNumberCardSection:", v134);

  -[SFCardSectionValue rfSummaryItemTextCardSection](self, "rfSummaryItemTextCardSection");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v136 = (void *)objc_msgSend(v135, "copy");
  objc_msgSend(v4, "setRfSummaryItemTextCardSection:", v136);

  -[SFCardSectionValue rfSummaryItemStandardCardSection](self, "rfSummaryItemStandardCardSection");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v138 = (void *)objc_msgSend(v137, "copy");
  objc_msgSend(v4, "setRfSummaryItemStandardCardSection:", v138);

  -[SFCardSectionValue rfFactItemShortNumberCardSection](self, "rfFactItemShortNumberCardSection");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = (void *)objc_msgSend(v139, "copy");
  objc_msgSend(v4, "setRfFactItemShortNumberCardSection:", v140);

  -[SFCardSectionValue rfFactItemStandardCardSection](self, "rfFactItemStandardCardSection");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v142 = (void *)objc_msgSend(v141, "copy");
  objc_msgSend(v4, "setRfFactItemStandardCardSection:", v142);

  -[SFCardSectionValue rfLongItemStandardCardSection](self, "rfLongItemStandardCardSection");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v144 = (void *)objc_msgSend(v143, "copy");
  objc_msgSend(v4, "setRfLongItemStandardCardSection:", v144);

  -[SFCardSectionValue rfPrimaryHeaderRichCardSection](self, "rfPrimaryHeaderRichCardSection");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v146 = (void *)objc_msgSend(v145, "copy");
  objc_msgSend(v4, "setRfPrimaryHeaderRichCardSection:", v146);

  -[SFCardSectionValue rfPrimaryHeaderStandardCardSection](self, "rfPrimaryHeaderStandardCardSection");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v148 = (void *)objc_msgSend(v147, "copy");
  objc_msgSend(v4, "setRfPrimaryHeaderStandardCardSection:", v148);

  -[SFCardSectionValue rfReferenceFootnoteCardSection](self, "rfReferenceFootnoteCardSection");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v150 = (void *)objc_msgSend(v149, "copy");
  objc_msgSend(v4, "setRfReferenceFootnoteCardSection:", v150);

  -[SFCardSectionValue rfReferenceRichCardSection](self, "rfReferenceRichCardSection");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v152 = (void *)objc_msgSend(v151, "copy");
  objc_msgSend(v4, "setRfReferenceRichCardSection:", v152);

  -[SFCardSectionValue rfSimpleItemRichCardSection](self, "rfSimpleItemRichCardSection");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v154 = (void *)objc_msgSend(v153, "copy");
  objc_msgSend(v4, "setRfSimpleItemRichCardSection:", v154);

  -[SFCardSectionValue rfSimpleItemStandardCardSection](self, "rfSimpleItemStandardCardSection");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v156 = (void *)objc_msgSend(v155, "copy");
  objc_msgSend(v4, "setRfSimpleItemStandardCardSection:", v156);

  -[SFCardSectionValue rfSummaryItemAlignedTextCardSection](self, "rfSummaryItemAlignedTextCardSection");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v158 = (void *)objc_msgSend(v157, "copy");
  objc_msgSend(v4, "setRfSummaryItemAlignedTextCardSection:", v158);

  -[SFCardSectionValue rfExpandableStandardCardSection](self, "rfExpandableStandardCardSection");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  v160 = (void *)objc_msgSend(v159, "copy");
  objc_msgSend(v4, "setRfExpandableStandardCardSection:", v160);

  -[SFCardSectionValue rfFactItemButtonCardSection](self, "rfFactItemButtonCardSection");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  v162 = (void *)objc_msgSend(v161, "copy");
  objc_msgSend(v4, "setRfFactItemButtonCardSection:", v162);

  -[SFCardSectionValue rfFactItemHeroNumberCardSection](self, "rfFactItemHeroNumberCardSection");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  v164 = (void *)objc_msgSend(v163, "copy");
  objc_msgSend(v4, "setRfFactItemHeroNumberCardSection:", v164);

  -[SFCardSectionValue rfPrimaryHeaderMarqueeCardSection](self, "rfPrimaryHeaderMarqueeCardSection");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  v166 = (void *)objc_msgSend(v165, "copy");
  objc_msgSend(v4, "setRfPrimaryHeaderMarqueeCardSection:", v166);

  -[SFCardSectionValue rfSummaryItemDetailedTextCardSection](self, "rfSummaryItemDetailedTextCardSection");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  v168 = (void *)objc_msgSend(v167, "copy");
  objc_msgSend(v4, "setRfSummaryItemDetailedTextCardSection:", v168);

  -[SFCardSectionValue rfSimpleItemPlayerCardSection](self, "rfSimpleItemPlayerCardSection");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  v170 = (void *)objc_msgSend(v169, "copy");
  objc_msgSend(v4, "setRfSimpleItemPlayerCardSection:", v170);

  -[SFCardSectionValue rfSummaryItemPairCardSection](self, "rfSummaryItemPairCardSection");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  v172 = (void *)objc_msgSend(v171, "copy");
  objc_msgSend(v4, "setRfSummaryItemPairCardSection:", v172);

  -[SFCardSectionValue rfSummaryItemPairNumberCardSection](self, "rfSummaryItemPairNumberCardSection");
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  v174 = (void *)objc_msgSend(v173, "copy");
  objc_msgSend(v4, "setRfSummaryItemPairNumberCardSection:", v174);

  -[SFCardSectionValue rfFactItemShortHeroNumberCardSection](self, "rfFactItemShortHeroNumberCardSection");
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  v176 = (void *)objc_msgSend(v175, "copy");
  objc_msgSend(v4, "setRfFactItemShortHeroNumberCardSection:", v176);

  -[SFCardSectionValue rfFactItemDetailedNumberCardSection](self, "rfFactItemDetailedNumberCardSection");
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  v178 = (void *)objc_msgSend(v177, "copy");
  objc_msgSend(v4, "setRfFactItemDetailedNumberCardSection:", v178);

  -[SFCardSectionValue rfFactItemHeroButtonCardSection](self, "rfFactItemHeroButtonCardSection");
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  v180 = (void *)objc_msgSend(v179, "copy");
  objc_msgSend(v4, "setRfFactItemHeroButtonCardSection:", v180);

  -[SFCardSectionValue rfFactItemImageRightCardSection](self, "rfFactItemImageRightCardSection");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  v182 = (void *)objc_msgSend(v181, "copy");
  objc_msgSend(v4, "setRfFactItemImageRightCardSection:", v182);

  -[SFCardSectionValue rfSummaryItemSwitchV2CardSection](self, "rfSummaryItemSwitchV2CardSection");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  v184 = (void *)objc_msgSend(v183, "copy");
  objc_msgSend(v4, "setRfSummaryItemSwitchV2CardSection:", v184);

  -[SFCardSectionValue rfTableHeaderCardSection](self, "rfTableHeaderCardSection");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  v186 = (void *)objc_msgSend(v185, "copy");
  objc_msgSend(v4, "setRfTableHeaderCardSection:", v186);

  -[SFCardSectionValue rfTableRowCardSection](self, "rfTableRowCardSection");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  v188 = (void *)objc_msgSend(v187, "copy");
  objc_msgSend(v4, "setRfTableRowCardSection:", v188);

  -[SFCardSectionValue rfSimpleItemVisualElementCardSection](self, "rfSimpleItemVisualElementCardSection");
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  v190 = (void *)objc_msgSend(v189, "copy");
  objc_msgSend(v4, "setRfSimpleItemVisualElementCardSection:", v190);

  -[SFCardSectionValue rfSummaryItemPlayerCardSection](self, "rfSummaryItemPlayerCardSection");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  v192 = (void *)objc_msgSend(v191, "copy");
  objc_msgSend(v4, "setRfSummaryItemPlayerCardSection:", v192);

  -[SFCardSectionValue rfSummaryItemImageRightCardSection](self, "rfSummaryItemImageRightCardSection");
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  v194 = (void *)objc_msgSend(v193, "copy");
  objc_msgSend(v4, "setRfSummaryItemImageRightCardSection:", v194);

  -[SFCardSectionValue rfSummaryItemButtonCardSection](self, "rfSummaryItemButtonCardSection");
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  v196 = (void *)objc_msgSend(v195, "copy");
  objc_msgSend(v4, "setRfSummaryItemButtonCardSection:", v196);

  -[SFCardSectionValue rfSimpleItemReverseRichCardSection](self, "rfSimpleItemReverseRichCardSection");
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  v198 = (void *)objc_msgSend(v197, "copy");
  objc_msgSend(v4, "setRfSimpleItemReverseRichCardSection:", v198);

  -[SFCardSectionValue rfSimpleItemRichSearchResultCardSection](self, "rfSimpleItemRichSearchResultCardSection");
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  v200 = (void *)objc_msgSend(v199, "copy");
  objc_msgSend(v4, "setRfSimpleItemRichSearchResultCardSection:", v200);

  -[SFCardSectionValue rfPrimaryHeaderStackedImageCardSection](self, "rfPrimaryHeaderStackedImageCardSection");
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  v202 = (void *)objc_msgSend(v201, "copy");
  objc_msgSend(v4, "setRfPrimaryHeaderStackedImageCardSection:", v202);

  -[SFCardSectionValue rfReferenceItemLogoCardSection](self, "rfReferenceItemLogoCardSection");
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  v204 = (void *)objc_msgSend(v203, "copy");
  objc_msgSend(v4, "setRfReferenceItemLogoCardSection:", v204);

  -[SFCardSectionValue rfReferenceItemButtonCardSection](self, "rfReferenceItemButtonCardSection");
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  v206 = (void *)objc_msgSend(v205, "copy");
  objc_msgSend(v4, "setRfReferenceItemButtonCardSection:", v206);

  -[SFCardSectionValue rfButtonCardSection](self, "rfButtonCardSection");
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  v208 = (void *)objc_msgSend(v207, "copy");
  objc_msgSend(v4, "setRfButtonCardSection:", v208);

  -[SFCardSectionValue rfBinaryButtonCardSection](self, "rfBinaryButtonCardSection");
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  v210 = (void *)objc_msgSend(v209, "copy");
  objc_msgSend(v4, "setRfBinaryButtonCardSection:", v210);

  -[SFCardSectionValue rfReferenceCenteredCardSection](self, "rfReferenceCenteredCardSection");
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  v212 = (void *)objc_msgSend(v211, "copy");
  objc_msgSend(v4, "setRfReferenceCenteredCardSection:", v212);

  -[SFCardSectionValue rfSecondaryHeaderStandardCardSection](self, "rfSecondaryHeaderStandardCardSection");
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  v214 = (void *)objc_msgSend(v213, "copy");
  objc_msgSend(v4, "setRfSecondaryHeaderStandardCardSection:", v214);

  -[SFCardSectionValue rfSecondaryHeaderEmphasizedCardSection](self, "rfSecondaryHeaderEmphasizedCardSection");
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  v216 = (void *)objc_msgSend(v215, "copy");
  objc_msgSend(v4, "setRfSecondaryHeaderEmphasizedCardSection:", v216);

  -[SFCardSectionValue rfMapCardSection](self, "rfMapCardSection");
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  v218 = (void *)objc_msgSend(v217, "copy");
  objc_msgSend(v4, "setRfMapCardSection:", v218);

  -[SFCardSectionValue rfReferenceStandardCardSection](self, "rfReferenceStandardCardSection");
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  v220 = (void *)objc_msgSend(v219, "copy");
  objc_msgSend(v4, "setRfReferenceStandardCardSection:", v220);

  -[SFCardSectionValue rfMultiButtonCardSection](self, "rfMultiButtonCardSection");
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  v222 = (void *)objc_msgSend(v221, "copy");
  objc_msgSend(v4, "setRfMultiButtonCardSection:", v222);

  -[SFCardSectionValue rfDisambiguationTitleCardSection](self, "rfDisambiguationTitleCardSection");
  v223 = (void *)objc_claimAutoreleasedReturnValue();
  v224 = (void *)objc_msgSend(v223, "copy");
  objc_msgSend(v4, "setRfDisambiguationTitleCardSection:", v224);

  return v4;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  void *v107;
  uint64_t v108;
  void *v109;
  uint64_t v110;
  void *v111;
  uint64_t v112;
  void *v113;
  uint64_t v114;
  void *v115;
  uint64_t v116;
  void *v117;
  uint64_t v118;
  void *v119;
  unint64_t v120;
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

  -[SFCardSectionValue appLinkCardSection](self, "appLinkCardSection");
  v223 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v223, "hash");
  -[SFCardSectionValue descriptionCardSection](self, "descriptionCardSection");
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v222, "hash") ^ v3;
  -[SFCardSectionValue keyValueDataCardSection](self, "keyValueDataCardSection");
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v221, "hash");
  -[SFCardSectionValue mapCardSection](self, "mapCardSection");
  v220 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ v5 ^ objc_msgSend(v220, "hash");
  -[SFCardSectionValue mediaInfoCardSection](self, "mediaInfoCardSection");
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v219, "hash");
  -[SFCardSectionValue mediaPlayerCardSection](self, "mediaPlayerCardSection");
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 ^ objc_msgSend(v218, "hash");
  -[SFCardSectionValue nowPlayingCardSection](self, "nowPlayingCardSection");
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6 ^ v8 ^ objc_msgSend(v217, "hash");
  -[SFCardSectionValue richTitleCardSection](self, "richTitleCardSection");
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v216, "hash");
  -[SFCardSectionValue rowCardSection](self, "rowCardSection");
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 ^ objc_msgSend(v215, "hash");
  -[SFCardSectionValue scoreboardCardSection](self, "scoreboardCardSection");
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 ^ objc_msgSend(v214, "hash");
  -[SFCardSectionValue socialMediaPostCardSection](self, "socialMediaPostCardSection");
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v9 ^ v12 ^ objc_msgSend(v213, "hash");
  -[SFCardSectionValue stockChartCardSection](self, "stockChartCardSection");
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v212, "hash");
  -[SFCardSectionValue tableHeaderRowCardSection](self, "tableHeaderRowCardSection");
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 ^ objc_msgSend(v211, "hash");
  -[SFCardSectionValue tableRowCardSection](self, "tableRowCardSection");
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15 ^ objc_msgSend(v210, "hash");
  -[SFCardSectionValue textColumnsCardSection](self, "textColumnsCardSection");
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16 ^ objc_msgSend(v209, "hash");
  -[SFCardSectionValue titleCardSection](self, "titleCardSection");
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v13 ^ v17 ^ objc_msgSend(v208, "hash");
  -[SFCardSectionValue trackListCardSection](self, "trackListCardSection");
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v207, "hash");
  -[SFCardSectionValue audioPlaybackCardSection](self, "audioPlaybackCardSection");
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19 ^ objc_msgSend(v206, "hash");
  -[SFCardSectionValue flightCardSection](self, "flightCardSection");
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20 ^ objc_msgSend(v205, "hash");
  -[SFCardSectionValue activityIndicatorCardSection](self, "activityIndicatorCardSection");
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21 ^ objc_msgSend(v204, "hash");
  -[SFCardSectionValue webCardSection](self, "webCardSection");
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22 ^ objc_msgSend(v203, "hash");
  -[SFCardSectionValue messageCardSection](self, "messageCardSection");
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v18 ^ v23 ^ objc_msgSend(v202, "hash");
  -[SFCardSectionValue detailedRowCardSection](self, "detailedRowCardSection");
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v201, "hash");
  -[SFCardSectionValue imagesCardSection](self, "imagesCardSection");
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25 ^ objc_msgSend(v200, "hash");
  -[SFCardSectionValue suggestionCardSection](self, "suggestionCardSection");
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26 ^ objc_msgSend(v199, "hash");
  -[SFCardSectionValue selectableGridCardSection](self, "selectableGridCardSection");
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27 ^ objc_msgSend(v198, "hash");
  -[SFCardSectionValue sectionHeaderCardSection](self, "sectionHeaderCardSection");
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28 ^ objc_msgSend(v197, "hash");
  -[SFCardSectionValue metaInfoCardSection](self, "metaInfoCardSection");
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29 ^ objc_msgSend(v196, "hash");
  -[SFCardSectionValue watchListCardSection](self, "watchListCardSection");
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v24 ^ v30 ^ objc_msgSend(v195, "hash");
  -[SFCardSectionValue mapsDetailedRowCardSection](self, "mapsDetailedRowCardSection");
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v194, "hash");
  -[SFCardSectionValue buttonCardSection](self, "buttonCardSection");
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32 ^ objc_msgSend(v193, "hash");
  -[SFCardSectionValue horizontalButtonCardSection](self, "horizontalButtonCardSection");
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33 ^ objc_msgSend(v192, "hash");
  -[SFCardSectionValue verticalLayoutCardSection](self, "verticalLayoutCardSection");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34 ^ objc_msgSend(v191, "hash");
  -[SFCardSectionValue productCardSection](self, "productCardSection");
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35 ^ objc_msgSend(v190, "hash");
  -[SFCardSectionValue horizontalScrollCardSection](self, "horizontalScrollCardSection");
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v36 ^ objc_msgSend(v189, "hash");
  -[SFCardSectionValue mediaRemoteControlCardSection](self, "mediaRemoteControlCardSection");
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v37 ^ objc_msgSend(v188, "hash");
  -[SFCardSectionValue mapPlaceCardSection](self, "mapPlaceCardSection");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v31 ^ v38 ^ objc_msgSend(v187, "hash");
  -[SFCardSectionValue compactRowCardSection](self, "compactRowCardSection");
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v186, "hash");
  -[SFCardSectionValue worldMapCardSection](self, "worldMapCardSection");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v40 ^ objc_msgSend(v185, "hash");
  -[SFCardSectionValue attributionFooterCardSection](self, "attributionFooterCardSection");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v41 ^ objc_msgSend(v184, "hash");
  -[SFCardSectionValue gridCardSection](self, "gridCardSection");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v42 ^ objc_msgSend(v183, "hash");
  -[SFCardSectionValue personHeaderCardSection](self, "personHeaderCardSection");
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v43 ^ objc_msgSend(v182, "hash");
  -[SFCardSectionValue colorBarCardSection](self, "colorBarCardSection");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v44 ^ objc_msgSend(v181, "hash");
  -[SFCardSectionValue splitCardSection](self, "splitCardSection");
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v45 ^ objc_msgSend(v180, "hash");
  -[SFCardSectionValue linkPresentationCardSection](self, "linkPresentationCardSection");
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v46 ^ objc_msgSend(v179, "hash");
  -[SFCardSectionValue findMyCardSection](self, "findMyCardSection");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v39 ^ v47 ^ objc_msgSend(v178, "hash");
  -[SFCardSectionValue heroCardSection](self, "heroCardSection");
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v177, "hash");
  -[SFCardSectionValue newsCardSection](self, "newsCardSection");
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v49 ^ objc_msgSend(v176, "hash");
  -[SFCardSectionValue miniCardSection](self, "miniCardSection");
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v50 ^ objc_msgSend(v175, "hash");
  -[SFCardSectionValue infoCardSection](self, "infoCardSection");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v51 ^ objc_msgSend(v174, "hash");
  -[SFCardSectionValue collectionCardSection](self, "collectionCardSection");
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v52 ^ objc_msgSend(v173, "hash");
  -[SFCardSectionValue combinedCardSection](self, "combinedCardSection");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v53 ^ objc_msgSend(v172, "hash");
  -[SFCardSectionValue responseWrapperCardSection](self, "responseWrapperCardSection");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v54 ^ objc_msgSend(v171, "hash");
  -[SFCardSectionValue listenToCardSection](self, "listenToCardSection");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v55 ^ objc_msgSend(v170, "hash");
  -[SFCardSectionValue watchNowCardSection](self, "watchNowCardSection");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v56 ^ objc_msgSend(v169, "hash");
  -[SFCardSectionValue strokeAnimationCardSection](self, "strokeAnimationCardSection");
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v48 ^ v57 ^ objc_msgSend(v168, "hash");
  -[SFCardSectionValue buttonListCardSection](self, "buttonListCardSection");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v167, "hash");
  -[SFCardSectionValue commandRowCardSection](self, "commandRowCardSection");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v59 ^ objc_msgSend(v166, "hash");
  -[SFCardSectionValue leadingTrailingCardSection](self, "leadingTrailingCardSection");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v60 ^ objc_msgSend(v165, "hash");
  -[SFCardSectionValue heroTitleCardSection](self, "heroTitleCardSection");
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v61 ^ objc_msgSend(v164, "hash");
  -[SFCardSectionValue archiveViewCardSection](self, "archiveViewCardSection");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v62 ^ objc_msgSend(v163, "hash");
  -[SFCardSectionValue appIconCardSection](self, "appIconCardSection");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v63 ^ objc_msgSend(v162, "hash");
  -[SFCardSectionValue largeTitleDetailedRowCardSection](self, "largeTitleDetailedRowCardSection");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v64 ^ objc_msgSend(v161, "hash");
  -[SFCardSectionValue safariTableOfContentsCardSection](self, "safariTableOfContentsCardSection");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v65 ^ objc_msgSend(v160, "hash");
  -[SFCardSectionValue rfSummaryItemShortNumberCardSection](self, "rfSummaryItemShortNumberCardSection");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v66 ^ objc_msgSend(v159, "hash");
  -[SFCardSectionValue rfSummaryItemTextCardSection](self, "rfSummaryItemTextCardSection");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v67 ^ objc_msgSend(v158, "hash");
  -[SFCardSectionValue rfSummaryItemStandardCardSection](self, "rfSummaryItemStandardCardSection");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v58 ^ v68 ^ objc_msgSend(v157, "hash");
  -[SFCardSectionValue rfFactItemShortNumberCardSection](self, "rfFactItemShortNumberCardSection");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend(v156, "hash");
  -[SFCardSectionValue rfFactItemStandardCardSection](self, "rfFactItemStandardCardSection");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v70 ^ objc_msgSend(v155, "hash");
  -[SFCardSectionValue rfLongItemStandardCardSection](self, "rfLongItemStandardCardSection");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v71 ^ objc_msgSend(v154, "hash");
  -[SFCardSectionValue rfPrimaryHeaderRichCardSection](self, "rfPrimaryHeaderRichCardSection");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v72 ^ objc_msgSend(v153, "hash");
  -[SFCardSectionValue rfPrimaryHeaderStandardCardSection](self, "rfPrimaryHeaderStandardCardSection");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = v73 ^ objc_msgSend(v152, "hash");
  -[SFCardSectionValue rfReferenceFootnoteCardSection](self, "rfReferenceFootnoteCardSection");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = v74 ^ objc_msgSend(v151, "hash");
  -[SFCardSectionValue rfReferenceRichCardSection](self, "rfReferenceRichCardSection");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v75 ^ objc_msgSend(v150, "hash");
  -[SFCardSectionValue rfSimpleItemRichCardSection](self, "rfSimpleItemRichCardSection");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = v76 ^ objc_msgSend(v149, "hash");
  -[SFCardSectionValue rfSimpleItemStandardCardSection](self, "rfSimpleItemStandardCardSection");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v77 ^ objc_msgSend(v148, "hash");
  -[SFCardSectionValue rfSummaryItemAlignedTextCardSection](self, "rfSummaryItemAlignedTextCardSection");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = v78 ^ objc_msgSend(v147, "hash");
  -[SFCardSectionValue rfExpandableStandardCardSection](self, "rfExpandableStandardCardSection");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = v79 ^ objc_msgSend(v146, "hash");
  -[SFCardSectionValue rfFactItemButtonCardSection](self, "rfFactItemButtonCardSection");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = v69 ^ v80 ^ objc_msgSend(v145, "hash");
  -[SFCardSectionValue rfFactItemHeroNumberCardSection](self, "rfFactItemHeroNumberCardSection");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = objc_msgSend(v144, "hash");
  -[SFCardSectionValue rfPrimaryHeaderMarqueeCardSection](self, "rfPrimaryHeaderMarqueeCardSection");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = v82 ^ objc_msgSend(v143, "hash");
  -[SFCardSectionValue rfSummaryItemDetailedTextCardSection](self, "rfSummaryItemDetailedTextCardSection");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = v83 ^ objc_msgSend(v142, "hash");
  -[SFCardSectionValue rfSimpleItemPlayerCardSection](self, "rfSimpleItemPlayerCardSection");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = v84 ^ objc_msgSend(v141, "hash");
  -[SFCardSectionValue rfSummaryItemPairCardSection](self, "rfSummaryItemPairCardSection");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = v85 ^ objc_msgSend(v140, "hash");
  -[SFCardSectionValue rfSummaryItemPairNumberCardSection](self, "rfSummaryItemPairNumberCardSection");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = v86 ^ objc_msgSend(v139, "hash");
  -[SFCardSectionValue rfFactItemShortHeroNumberCardSection](self, "rfFactItemShortHeroNumberCardSection");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = v87 ^ objc_msgSend(v138, "hash");
  -[SFCardSectionValue rfFactItemDetailedNumberCardSection](self, "rfFactItemDetailedNumberCardSection");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = v88 ^ objc_msgSend(v137, "hash");
  -[SFCardSectionValue rfFactItemHeroButtonCardSection](self, "rfFactItemHeroButtonCardSection");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = v89 ^ objc_msgSend(v136, "hash");
  -[SFCardSectionValue rfFactItemImageRightCardSection](self, "rfFactItemImageRightCardSection");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = v90 ^ objc_msgSend(v135, "hash");
  -[SFCardSectionValue rfSummaryItemSwitchV2CardSection](self, "rfSummaryItemSwitchV2CardSection");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = v91 ^ objc_msgSend(v134, "hash");
  -[SFCardSectionValue rfTableHeaderCardSection](self, "rfTableHeaderCardSection");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = v92 ^ objc_msgSend(v133, "hash");
  -[SFCardSectionValue rfTableRowCardSection](self, "rfTableRowCardSection");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = v81 ^ v93 ^ objc_msgSend(v132, "hash");
  -[SFCardSectionValue rfSimpleItemVisualElementCardSection](self, "rfSimpleItemVisualElementCardSection");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = objc_msgSend(v131, "hash");
  -[SFCardSectionValue rfSummaryItemPlayerCardSection](self, "rfSummaryItemPlayerCardSection");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = v95 ^ objc_msgSend(v130, "hash");
  -[SFCardSectionValue rfSummaryItemImageRightCardSection](self, "rfSummaryItemImageRightCardSection");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = v96 ^ objc_msgSend(v129, "hash");
  -[SFCardSectionValue rfSummaryItemButtonCardSection](self, "rfSummaryItemButtonCardSection");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = v97 ^ objc_msgSend(v128, "hash");
  -[SFCardSectionValue rfSimpleItemReverseRichCardSection](self, "rfSimpleItemReverseRichCardSection");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = v98 ^ objc_msgSend(v127, "hash");
  -[SFCardSectionValue rfSimpleItemRichSearchResultCardSection](self, "rfSimpleItemRichSearchResultCardSection");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = v99 ^ objc_msgSend(v126, "hash");
  -[SFCardSectionValue rfPrimaryHeaderStackedImageCardSection](self, "rfPrimaryHeaderStackedImageCardSection");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = v100 ^ objc_msgSend(v125, "hash");
  -[SFCardSectionValue rfReferenceItemLogoCardSection](self, "rfReferenceItemLogoCardSection");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = v101 ^ objc_msgSend(v124, "hash");
  -[SFCardSectionValue rfReferenceItemButtonCardSection](self, "rfReferenceItemButtonCardSection");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = v102 ^ objc_msgSend(v123, "hash");
  -[SFCardSectionValue rfButtonCardSection](self, "rfButtonCardSection");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = v103 ^ objc_msgSend(v122, "hash");
  -[SFCardSectionValue rfBinaryButtonCardSection](self, "rfBinaryButtonCardSection");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = v104 ^ objc_msgSend(v105, "hash");
  -[SFCardSectionValue rfReferenceCenteredCardSection](self, "rfReferenceCenteredCardSection");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = v106 ^ objc_msgSend(v107, "hash");
  -[SFCardSectionValue rfSecondaryHeaderStandardCardSection](self, "rfSecondaryHeaderStandardCardSection");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = v108 ^ objc_msgSend(v109, "hash");
  -[SFCardSectionValue rfSecondaryHeaderEmphasizedCardSection](self, "rfSecondaryHeaderEmphasizedCardSection");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = v94 ^ v110 ^ objc_msgSend(v111, "hash");
  -[SFCardSectionValue rfMapCardSection](self, "rfMapCardSection");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = objc_msgSend(v113, "hash");
  -[SFCardSectionValue rfReferenceStandardCardSection](self, "rfReferenceStandardCardSection");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = v114 ^ objc_msgSend(v115, "hash");
  -[SFCardSectionValue rfMultiButtonCardSection](self, "rfMultiButtonCardSection");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = v116 ^ objc_msgSend(v117, "hash");
  -[SFCardSectionValue rfDisambiguationTitleCardSection](self, "rfDisambiguationTitleCardSection");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = v112 ^ v118 ^ objc_msgSend(v119, "hash");

  return v120;
}

- (SFAppLinkCardSection)appLinkCardSection
{
  return self->_appLinkCardSection;
}

- (void)setAppLinkCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_appLinkCardSection, a3);
}

- (SFDescriptionCardSection)descriptionCardSection
{
  return self->_descriptionCardSection;
}

- (void)setDescriptionCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionCardSection, a3);
}

- (SFKeyValueDataCardSection)keyValueDataCardSection
{
  return self->_keyValueDataCardSection;
}

- (void)setKeyValueDataCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_keyValueDataCardSection, a3);
}

- (SFMapCardSection)mapCardSection
{
  return self->_mapCardSection;
}

- (void)setMapCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_mapCardSection, a3);
}

- (SFMediaInfoCardSection)mediaInfoCardSection
{
  return self->_mediaInfoCardSection;
}

- (void)setMediaInfoCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_mediaInfoCardSection, a3);
}

- (SFMediaPlayerCardSection)mediaPlayerCardSection
{
  return self->_mediaPlayerCardSection;
}

- (void)setMediaPlayerCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_mediaPlayerCardSection, a3);
}

- (SFNowPlayingCardSection)nowPlayingCardSection
{
  return self->_nowPlayingCardSection;
}

- (void)setNowPlayingCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_nowPlayingCardSection, a3);
}

- (SFRichTitleCardSection)richTitleCardSection
{
  return self->_richTitleCardSection;
}

- (void)setRichTitleCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_richTitleCardSection, a3);
}

- (SFRowCardSection)rowCardSection
{
  return self->_rowCardSection;
}

- (void)setRowCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rowCardSection, a3);
}

- (SFScoreboardCardSection)scoreboardCardSection
{
  return self->_scoreboardCardSection;
}

- (void)setScoreboardCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_scoreboardCardSection, a3);
}

- (SFSocialMediaPostCardSection)socialMediaPostCardSection
{
  return self->_socialMediaPostCardSection;
}

- (void)setSocialMediaPostCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_socialMediaPostCardSection, a3);
}

- (SFStockChartCardSection)stockChartCardSection
{
  return self->_stockChartCardSection;
}

- (void)setStockChartCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_stockChartCardSection, a3);
}

- (SFTableHeaderRowCardSection)tableHeaderRowCardSection
{
  return self->_tableHeaderRowCardSection;
}

- (void)setTableHeaderRowCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_tableHeaderRowCardSection, a3);
}

- (SFTableRowCardSection)tableRowCardSection
{
  return self->_tableRowCardSection;
}

- (void)setTableRowCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_tableRowCardSection, a3);
}

- (SFTextColumnsCardSection)textColumnsCardSection
{
  return self->_textColumnsCardSection;
}

- (void)setTextColumnsCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_textColumnsCardSection, a3);
}

- (SFTitleCardSection)titleCardSection
{
  return self->_titleCardSection;
}

- (void)setTitleCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_titleCardSection, a3);
}

- (SFTrackListCardSection)trackListCardSection
{
  return self->_trackListCardSection;
}

- (void)setTrackListCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_trackListCardSection, a3);
}

- (SFAudioPlaybackCardSection)audioPlaybackCardSection
{
  return self->_audioPlaybackCardSection;
}

- (void)setAudioPlaybackCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_audioPlaybackCardSection, a3);
}

- (SFFlightCardSection)flightCardSection
{
  return self->_flightCardSection;
}

- (void)setFlightCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_flightCardSection, a3);
}

- (SFActivityIndicatorCardSection)activityIndicatorCardSection
{
  return self->_activityIndicatorCardSection;
}

- (void)setActivityIndicatorCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicatorCardSection, a3);
}

- (SFWebCardSection)webCardSection
{
  return self->_webCardSection;
}

- (void)setWebCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_webCardSection, a3);
}

- (SFMessageCardSection)messageCardSection
{
  return self->_messageCardSection;
}

- (void)setMessageCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_messageCardSection, a3);
}

- (SFDetailedRowCardSection)detailedRowCardSection
{
  return self->_detailedRowCardSection;
}

- (void)setDetailedRowCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_detailedRowCardSection, a3);
}

- (SFImagesCardSection)imagesCardSection
{
  return self->_imagesCardSection;
}

- (void)setImagesCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_imagesCardSection, a3);
}

- (SFSuggestionCardSection)suggestionCardSection
{
  return self->_suggestionCardSection;
}

- (void)setSuggestionCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionCardSection, a3);
}

- (SFSelectableGridCardSection)selectableGridCardSection
{
  return self->_selectableGridCardSection;
}

- (void)setSelectableGridCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_selectableGridCardSection, a3);
}

- (SFSectionHeaderCardSection)sectionHeaderCardSection
{
  return self->_sectionHeaderCardSection;
}

- (void)setSectionHeaderCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_sectionHeaderCardSection, a3);
}

- (SFMetaInfoCardSection)metaInfoCardSection
{
  return self->_metaInfoCardSection;
}

- (void)setMetaInfoCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_metaInfoCardSection, a3);
}

- (SFWatchListCardSection)watchListCardSection
{
  return self->_watchListCardSection;
}

- (void)setWatchListCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_watchListCardSection, a3);
}

- (SFMapsDetailedRowCardSection)mapsDetailedRowCardSection
{
  return self->_mapsDetailedRowCardSection;
}

- (void)setMapsDetailedRowCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_mapsDetailedRowCardSection, a3);
}

- (SFButtonCardSection)buttonCardSection
{
  return self->_buttonCardSection;
}

- (void)setButtonCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_buttonCardSection, a3);
}

- (SFHorizontalButtonCardSection)horizontalButtonCardSection
{
  return self->_horizontalButtonCardSection;
}

- (void)setHorizontalButtonCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_horizontalButtonCardSection, a3);
}

- (SFVerticalLayoutCardSection)verticalLayoutCardSection
{
  return self->_verticalLayoutCardSection;
}

- (void)setVerticalLayoutCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_verticalLayoutCardSection, a3);
}

- (SFProductCardSection)productCardSection
{
  return self->_productCardSection;
}

- (void)setProductCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_productCardSection, a3);
}

- (SFHorizontalScrollCardSection)horizontalScrollCardSection
{
  return self->_horizontalScrollCardSection;
}

- (void)setHorizontalScrollCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_horizontalScrollCardSection, a3);
}

- (SFMediaRemoteControlCardSection)mediaRemoteControlCardSection
{
  return self->_mediaRemoteControlCardSection;
}

- (void)setMediaRemoteControlCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_mediaRemoteControlCardSection, a3);
}

- (SFMapPlaceCardSection)mapPlaceCardSection
{
  return self->_mapPlaceCardSection;
}

- (void)setMapPlaceCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_mapPlaceCardSection, a3);
}

- (SFCompactRowCardSection)compactRowCardSection
{
  return self->_compactRowCardSection;
}

- (void)setCompactRowCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_compactRowCardSection, a3);
}

- (SFWorldMapCardSection)worldMapCardSection
{
  return self->_worldMapCardSection;
}

- (void)setWorldMapCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_worldMapCardSection, a3);
}

- (SFAttributionFooterCardSection)attributionFooterCardSection
{
  return self->_attributionFooterCardSection;
}

- (void)setAttributionFooterCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_attributionFooterCardSection, a3);
}

- (SFGridCardSection)gridCardSection
{
  return self->_gridCardSection;
}

- (void)setGridCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_gridCardSection, a3);
}

- (SFPersonHeaderCardSection)personHeaderCardSection
{
  return self->_personHeaderCardSection;
}

- (void)setPersonHeaderCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_personHeaderCardSection, a3);
}

- (SFColorBarCardSection)colorBarCardSection
{
  return self->_colorBarCardSection;
}

- (void)setColorBarCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_colorBarCardSection, a3);
}

- (SFSplitCardSection)splitCardSection
{
  return self->_splitCardSection;
}

- (void)setSplitCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_splitCardSection, a3);
}

- (SFLinkPresentationCardSection)linkPresentationCardSection
{
  return self->_linkPresentationCardSection;
}

- (void)setLinkPresentationCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_linkPresentationCardSection, a3);
}

- (SFFindMyCardSection)findMyCardSection
{
  return self->_findMyCardSection;
}

- (void)setFindMyCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_findMyCardSection, a3);
}

- (SFHeroCardSection)heroCardSection
{
  return self->_heroCardSection;
}

- (void)setHeroCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_heroCardSection, a3);
}

- (SFNewsCardSection)newsCardSection
{
  return self->_newsCardSection;
}

- (void)setNewsCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_newsCardSection, a3);
}

- (SFMiniCardSection)miniCardSection
{
  return self->_miniCardSection;
}

- (void)setMiniCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_miniCardSection, a3);
}

- (SFInfoCardSection)infoCardSection
{
  return self->_infoCardSection;
}

- (void)setInfoCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_infoCardSection, a3);
}

- (SFCollectionCardSection)collectionCardSection
{
  return self->_collectionCardSection;
}

- (void)setCollectionCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_collectionCardSection, a3);
}

- (SFCombinedCardSection)combinedCardSection
{
  return self->_combinedCardSection;
}

- (void)setCombinedCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_combinedCardSection, a3);
}

- (SFResponseWrapperCardSection)responseWrapperCardSection
{
  return self->_responseWrapperCardSection;
}

- (void)setResponseWrapperCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_responseWrapperCardSection, a3);
}

- (SFListenToCardSection)listenToCardSection
{
  return self->_listenToCardSection;
}

- (void)setListenToCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_listenToCardSection, a3);
}

- (SFWatchNowCardSection)watchNowCardSection
{
  return self->_watchNowCardSection;
}

- (void)setWatchNowCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_watchNowCardSection, a3);
}

- (SFStrokeAnimationCardSection)strokeAnimationCardSection
{
  return self->_strokeAnimationCardSection;
}

- (void)setStrokeAnimationCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_strokeAnimationCardSection, a3);
}

- (SFButtonListCardSection)buttonListCardSection
{
  return self->_buttonListCardSection;
}

- (void)setButtonListCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_buttonListCardSection, a3);
}

- (SFCommandRowCardSection)commandRowCardSection
{
  return self->_commandRowCardSection;
}

- (void)setCommandRowCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_commandRowCardSection, a3);
}

- (SFLeadingTrailingCardSection)leadingTrailingCardSection
{
  return self->_leadingTrailingCardSection;
}

- (void)setLeadingTrailingCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_leadingTrailingCardSection, a3);
}

- (SFHeroTitleCardSection)heroTitleCardSection
{
  return self->_heroTitleCardSection;
}

- (void)setHeroTitleCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_heroTitleCardSection, a3);
}

- (SFArchiveViewCardSection)archiveViewCardSection
{
  return self->_archiveViewCardSection;
}

- (void)setArchiveViewCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_archiveViewCardSection, a3);
}

- (SFAppIconCardSection)appIconCardSection
{
  return self->_appIconCardSection;
}

- (void)setAppIconCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_appIconCardSection, a3);
}

- (SFLargeTitleDetailedRowCardSection)largeTitleDetailedRowCardSection
{
  return self->_largeTitleDetailedRowCardSection;
}

- (void)setLargeTitleDetailedRowCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_largeTitleDetailedRowCardSection, a3);
}

- (SFSafariTableOfContentsCardSection)safariTableOfContentsCardSection
{
  return self->_safariTableOfContentsCardSection;
}

- (void)setSafariTableOfContentsCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_safariTableOfContentsCardSection, a3);
}

- (RFSummaryItemShortNumberCardSection)rfSummaryItemShortNumberCardSection
{
  return self->_rfSummaryItemShortNumberCardSection;
}

- (void)setRfSummaryItemShortNumberCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfSummaryItemShortNumberCardSection, a3);
}

- (RFSummaryItemTextCardSection)rfSummaryItemTextCardSection
{
  return self->_rfSummaryItemTextCardSection;
}

- (void)setRfSummaryItemTextCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfSummaryItemTextCardSection, a3);
}

- (RFSummaryItemStandardCardSection)rfSummaryItemStandardCardSection
{
  return self->_rfSummaryItemStandardCardSection;
}

- (void)setRfSummaryItemStandardCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfSummaryItemStandardCardSection, a3);
}

- (RFFactItemShortNumberCardSection)rfFactItemShortNumberCardSection
{
  return self->_rfFactItemShortNumberCardSection;
}

- (void)setRfFactItemShortNumberCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfFactItemShortNumberCardSection, a3);
}

- (RFFactItemStandardCardSection)rfFactItemStandardCardSection
{
  return self->_rfFactItemStandardCardSection;
}

- (void)setRfFactItemStandardCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfFactItemStandardCardSection, a3);
}

- (RFLongItemStandardCardSection)rfLongItemStandardCardSection
{
  return self->_rfLongItemStandardCardSection;
}

- (void)setRfLongItemStandardCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfLongItemStandardCardSection, a3);
}

- (RFPrimaryHeaderRichCardSection)rfPrimaryHeaderRichCardSection
{
  return self->_rfPrimaryHeaderRichCardSection;
}

- (void)setRfPrimaryHeaderRichCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfPrimaryHeaderRichCardSection, a3);
}

- (RFPrimaryHeaderStandardCardSection)rfPrimaryHeaderStandardCardSection
{
  return self->_rfPrimaryHeaderStandardCardSection;
}

- (void)setRfPrimaryHeaderStandardCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfPrimaryHeaderStandardCardSection, a3);
}

- (RFReferenceFootnoteCardSection)rfReferenceFootnoteCardSection
{
  return self->_rfReferenceFootnoteCardSection;
}

- (void)setRfReferenceFootnoteCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfReferenceFootnoteCardSection, a3);
}

- (RFReferenceRichCardSection)rfReferenceRichCardSection
{
  return self->_rfReferenceRichCardSection;
}

- (void)setRfReferenceRichCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfReferenceRichCardSection, a3);
}

- (RFSimpleItemRichCardSection)rfSimpleItemRichCardSection
{
  return self->_rfSimpleItemRichCardSection;
}

- (void)setRfSimpleItemRichCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfSimpleItemRichCardSection, a3);
}

- (RFSimpleItemStandardCardSection)rfSimpleItemStandardCardSection
{
  return self->_rfSimpleItemStandardCardSection;
}

- (void)setRfSimpleItemStandardCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfSimpleItemStandardCardSection, a3);
}

- (RFSummaryItemAlignedTextCardSection)rfSummaryItemAlignedTextCardSection
{
  return self->_rfSummaryItemAlignedTextCardSection;
}

- (void)setRfSummaryItemAlignedTextCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfSummaryItemAlignedTextCardSection, a3);
}

- (RFExpandableStandardCardSection)rfExpandableStandardCardSection
{
  return self->_rfExpandableStandardCardSection;
}

- (void)setRfExpandableStandardCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfExpandableStandardCardSection, a3);
}

- (RFFactItemButtonCardSection)rfFactItemButtonCardSection
{
  return self->_rfFactItemButtonCardSection;
}

- (void)setRfFactItemButtonCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfFactItemButtonCardSection, a3);
}

- (RFFactItemHeroNumberCardSection)rfFactItemHeroNumberCardSection
{
  return self->_rfFactItemHeroNumberCardSection;
}

- (void)setRfFactItemHeroNumberCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfFactItemHeroNumberCardSection, a3);
}

- (RFPrimaryHeaderMarqueeCardSection)rfPrimaryHeaderMarqueeCardSection
{
  return self->_rfPrimaryHeaderMarqueeCardSection;
}

- (void)setRfPrimaryHeaderMarqueeCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfPrimaryHeaderMarqueeCardSection, a3);
}

- (RFSummaryItemDetailedTextCardSection)rfSummaryItemDetailedTextCardSection
{
  return self->_rfSummaryItemDetailedTextCardSection;
}

- (void)setRfSummaryItemDetailedTextCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfSummaryItemDetailedTextCardSection, a3);
}

- (RFSimpleItemPlayerCardSection)rfSimpleItemPlayerCardSection
{
  return self->_rfSimpleItemPlayerCardSection;
}

- (void)setRfSimpleItemPlayerCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfSimpleItemPlayerCardSection, a3);
}

- (RFSummaryItemPairCardSection)rfSummaryItemPairCardSection
{
  return self->_rfSummaryItemPairCardSection;
}

- (void)setRfSummaryItemPairCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfSummaryItemPairCardSection, a3);
}

- (RFSummaryItemPairNumberCardSection)rfSummaryItemPairNumberCardSection
{
  return self->_rfSummaryItemPairNumberCardSection;
}

- (void)setRfSummaryItemPairNumberCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfSummaryItemPairNumberCardSection, a3);
}

- (RFFactItemShortHeroNumberCardSection)rfFactItemShortHeroNumberCardSection
{
  return self->_rfFactItemShortHeroNumberCardSection;
}

- (void)setRfFactItemShortHeroNumberCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfFactItemShortHeroNumberCardSection, a3);
}

- (RFFactItemDetailedNumberCardSection)rfFactItemDetailedNumberCardSection
{
  return self->_rfFactItemDetailedNumberCardSection;
}

- (void)setRfFactItemDetailedNumberCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfFactItemDetailedNumberCardSection, a3);
}

- (RFFactItemHeroButtonCardSection)rfFactItemHeroButtonCardSection
{
  return self->_rfFactItemHeroButtonCardSection;
}

- (void)setRfFactItemHeroButtonCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfFactItemHeroButtonCardSection, a3);
}

- (RFFactItemImageRightCardSection)rfFactItemImageRightCardSection
{
  return self->_rfFactItemImageRightCardSection;
}

- (void)setRfFactItemImageRightCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfFactItemImageRightCardSection, a3);
}

- (RFSummaryItemSwitchV2CardSection)rfSummaryItemSwitchV2CardSection
{
  return self->_rfSummaryItemSwitchV2CardSection;
}

- (void)setRfSummaryItemSwitchV2CardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfSummaryItemSwitchV2CardSection, a3);
}

- (RFTableHeaderCardSection)rfTableHeaderCardSection
{
  return self->_rfTableHeaderCardSection;
}

- (void)setRfTableHeaderCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfTableHeaderCardSection, a3);
}

- (RFTableRowCardSection)rfTableRowCardSection
{
  return self->_rfTableRowCardSection;
}

- (void)setRfTableRowCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfTableRowCardSection, a3);
}

- (RFSimpleItemVisualElementCardSection)rfSimpleItemVisualElementCardSection
{
  return self->_rfSimpleItemVisualElementCardSection;
}

- (void)setRfSimpleItemVisualElementCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfSimpleItemVisualElementCardSection, a3);
}

- (RFSummaryItemPlayerCardSection)rfSummaryItemPlayerCardSection
{
  return self->_rfSummaryItemPlayerCardSection;
}

- (void)setRfSummaryItemPlayerCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfSummaryItemPlayerCardSection, a3);
}

- (RFSummaryItemImageRightCardSection)rfSummaryItemImageRightCardSection
{
  return self->_rfSummaryItemImageRightCardSection;
}

- (void)setRfSummaryItemImageRightCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfSummaryItemImageRightCardSection, a3);
}

- (RFSummaryItemButtonCardSection)rfSummaryItemButtonCardSection
{
  return self->_rfSummaryItemButtonCardSection;
}

- (void)setRfSummaryItemButtonCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfSummaryItemButtonCardSection, a3);
}

- (RFSimpleItemReverseRichCardSection)rfSimpleItemReverseRichCardSection
{
  return self->_rfSimpleItemReverseRichCardSection;
}

- (void)setRfSimpleItemReverseRichCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfSimpleItemReverseRichCardSection, a3);
}

- (RFSimpleItemRichSearchResultCardSection)rfSimpleItemRichSearchResultCardSection
{
  return self->_rfSimpleItemRichSearchResultCardSection;
}

- (void)setRfSimpleItemRichSearchResultCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfSimpleItemRichSearchResultCardSection, a3);
}

- (RFPrimaryHeaderStackedImageCardSection)rfPrimaryHeaderStackedImageCardSection
{
  return self->_rfPrimaryHeaderStackedImageCardSection;
}

- (void)setRfPrimaryHeaderStackedImageCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfPrimaryHeaderStackedImageCardSection, a3);
}

- (RFReferenceItemLogoCardSection)rfReferenceItemLogoCardSection
{
  return self->_rfReferenceItemLogoCardSection;
}

- (void)setRfReferenceItemLogoCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfReferenceItemLogoCardSection, a3);
}

- (RFReferenceItemButtonCardSection)rfReferenceItemButtonCardSection
{
  return self->_rfReferenceItemButtonCardSection;
}

- (void)setRfReferenceItemButtonCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfReferenceItemButtonCardSection, a3);
}

- (RFButtonCardSection)rfButtonCardSection
{
  return self->_rfButtonCardSection;
}

- (void)setRfButtonCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfButtonCardSection, a3);
}

- (RFBinaryButtonCardSection)rfBinaryButtonCardSection
{
  return self->_rfBinaryButtonCardSection;
}

- (void)setRfBinaryButtonCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfBinaryButtonCardSection, a3);
}

- (RFReferenceCenteredCardSection)rfReferenceCenteredCardSection
{
  return self->_rfReferenceCenteredCardSection;
}

- (void)setRfReferenceCenteredCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfReferenceCenteredCardSection, a3);
}

- (RFSecondaryHeaderStandardCardSection)rfSecondaryHeaderStandardCardSection
{
  return self->_rfSecondaryHeaderStandardCardSection;
}

- (void)setRfSecondaryHeaderStandardCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfSecondaryHeaderStandardCardSection, a3);
}

- (RFSecondaryHeaderEmphasizedCardSection)rfSecondaryHeaderEmphasizedCardSection
{
  return self->_rfSecondaryHeaderEmphasizedCardSection;
}

- (void)setRfSecondaryHeaderEmphasizedCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfSecondaryHeaderEmphasizedCardSection, a3);
}

- (RFMapCardSection)rfMapCardSection
{
  return self->_rfMapCardSection;
}

- (void)setRfMapCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfMapCardSection, a3);
}

- (RFReferenceStandardCardSection)rfReferenceStandardCardSection
{
  return self->_rfReferenceStandardCardSection;
}

- (void)setRfReferenceStandardCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfReferenceStandardCardSection, a3);
}

- (RFMultiButtonCardSection)rfMultiButtonCardSection
{
  return self->_rfMultiButtonCardSection;
}

- (void)setRfMultiButtonCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfMultiButtonCardSection, a3);
}

- (RFDisambiguationTitleCardSection)rfDisambiguationTitleCardSection
{
  return self->_rfDisambiguationTitleCardSection;
}

- (void)setRfDisambiguationTitleCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_rfDisambiguationTitleCardSection, a3);
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
