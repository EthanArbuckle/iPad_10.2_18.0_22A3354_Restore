@implementation _SFPBCardSection

- (_SFPBCardSection)initWithFacade:(id)a3
{
  id v4;
  _SFPBCardSection *v5;
  void *v6;
  _SFPBCard *v7;
  void *v8;
  _SFPBCard *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  _SFPBAbstractCommand *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _SFPBUserReportRequest *v31;
  void *v32;
  _SFPBUserReportRequest *v33;
  void *v34;
  _SFPBCommand *v35;
  void *v36;
  _SFPBCommand *v37;
  void *v38;
  _SFPBCommand *v39;
  void *v40;
  _SFPBCommand *v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t k;
  _SFPBButtonItem *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  _SFPBColor *v55;
  void *v56;
  _SFPBColor *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t m;
  _SFPBButtonItem *v64;
  void *v65;
  id v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t n;
  _SFPBButtonItem *v72;
  void *v73;
  id v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t ii;
  _SFPBPunchout *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t jj;
  _SFPBCommand *v92;
  void *v93;
  _SFPBAppEntityAnnotation *v94;
  void *v95;
  _SFPBAppEntityAnnotation *v96;
  void *v97;
  void *v98;
  _SFPBCardSectionValue *v99;
  _SFPBAppLinkCardSection *v100;
  void *v101;
  _SFPBDescriptionCardSection *v102;
  void *v103;
  _SFPBKeyValueDataCardSection *v104;
  void *v105;
  _SFPBMapCardSection *v106;
  void *v107;
  _SFPBMediaInfoCardSection *v108;
  void *v109;
  _SFPBMediaPlayerCardSection *v110;
  void *v111;
  _SFPBNowPlayingCardSection *v112;
  void *v113;
  _SFPBRichTitleCardSection *v114;
  void *v115;
  _SFPBRowCardSection *v116;
  void *v117;
  _SFPBScoreboardCardSection *v118;
  void *v119;
  _SFPBSocialMediaPostCardSection *v120;
  void *v121;
  _SFPBStockChartCardSection *v122;
  void *v123;
  _SFPBTableHeaderRowCardSection *v124;
  void *v125;
  _SFPBTableRowCardSection *v126;
  void *v127;
  _SFPBTextColumnsCardSection *v128;
  void *v129;
  _SFPBTitleCardSection *v130;
  void *v131;
  _SFPBTrackListCardSection *v132;
  void *v133;
  _SFPBAudioPlaybackCardSection *v134;
  void *v135;
  _SFPBFlightCardSection *v136;
  void *v137;
  _SFPBActivityIndicatorCardSection *v138;
  void *v139;
  _SFPBWebCardSection *v140;
  void *v141;
  _SFPBMessageCardSection *v142;
  void *v143;
  _SFPBDetailedRowCardSection *v144;
  void *v145;
  _SFPBImagesCardSection *v146;
  void *v147;
  _SFPBSuggestionCardSection *v148;
  void *v149;
  _SFPBSelectableGridCardSection *v150;
  void *v151;
  _SFPBSectionHeaderCardSection *v152;
  void *v153;
  _SFPBMetaInfoCardSection *v154;
  void *v155;
  _SFPBWatchListCardSection *v156;
  void *v157;
  _SFPBMapsDetailedRowCardSection *v158;
  void *v159;
  _SFPBButtonCardSection *v160;
  void *v161;
  _SFPBHorizontalButtonCardSection *v162;
  void *v163;
  _SFPBVerticalLayoutCardSection *v164;
  void *v165;
  _SFPBProductCardSection *v166;
  void *v167;
  _SFPBHorizontalScrollCardSection *v168;
  void *v169;
  _SFPBMediaRemoteControlCardSection *v170;
  void *v171;
  _SFPBMapPlaceCardSection *v172;
  void *v173;
  _SFPBCompactRowCardSection *v174;
  void *v175;
  _SFPBWorldMapCardSection *v176;
  void *v177;
  _SFPBAttributionFooterCardSection *v178;
  void *v179;
  _SFPBGridCardSection *v180;
  void *v181;
  _SFPBPersonHeaderCardSection *v182;
  void *v183;
  _SFPBColorBarCardSection *v184;
  void *v185;
  _SFPBSplitCardSection *v186;
  void *v187;
  _SFPBLinkPresentationCardSection *v188;
  void *v189;
  _SFPBFindMyCardSection *v190;
  void *v191;
  _SFPBHeroCardSection *v192;
  void *v193;
  _SFPBNewsCardSection *v194;
  void *v195;
  _SFPBMiniCardSection *v196;
  void *v197;
  _SFPBInfoCardSection *v198;
  void *v199;
  _SFPBCollectionCardSection *v200;
  void *v201;
  _SFPBCombinedCardSection *v202;
  void *v203;
  _SFPBResponseWrapperCardSection *v204;
  void *v205;
  _SFPBListenToCardSection *v206;
  void *v207;
  _SFPBWatchNowCardSection *v208;
  void *v209;
  _SFPBStrokeAnimationCardSection *v210;
  void *v211;
  _SFPBButtonListCardSection *v212;
  void *v213;
  _SFPBCommandRowCardSection *v214;
  void *v215;
  _SFPBLeadingTrailingCardSection *v216;
  void *v217;
  _SFPBHeroTitleCardSection *v218;
  void *v219;
  _SFPBArchiveViewCardSection *v220;
  void *v221;
  _SFPBAppIconCardSection *v222;
  void *v223;
  _SFPBLargeTitleDetailedRowCardSection *v224;
  void *v225;
  _SFPBSafariTableOfContentsCardSection *v226;
  void *v227;
  _SFPBRFSummaryItemShortNumberCardSection *v228;
  void *v229;
  _SFPBRFSummaryItemTextCardSection *v230;
  void *v231;
  _SFPBRFSummaryItemStandardCardSection *v232;
  void *v233;
  _SFPBRFFactItemShortNumberCardSection *v234;
  void *v235;
  _SFPBRFFactItemStandardCardSection *v236;
  void *v237;
  _SFPBRFLongItemStandardCardSection *v238;
  void *v239;
  _SFPBRFPrimaryHeaderRichCardSection *v240;
  void *v241;
  _SFPBRFPrimaryHeaderStandardCardSection *v242;
  void *v243;
  _SFPBRFReferenceFootnoteCardSection *v244;
  void *v245;
  _SFPBRFReferenceRichCardSection *v246;
  void *v247;
  _SFPBRFSimpleItemRichCardSection *v248;
  void *v249;
  _SFPBRFSimpleItemStandardCardSection *v250;
  void *v251;
  _SFPBRFSummaryItemAlignedTextCardSection *v252;
  void *v253;
  _SFPBRFExpandableStandardCardSection *v254;
  void *v255;
  _SFPBRFFactItemButtonCardSection *v256;
  void *v257;
  _SFPBRFFactItemHeroNumberCardSection *v258;
  void *v259;
  _SFPBRFPrimaryHeaderMarqueeCardSection *v260;
  void *v261;
  _SFPBRFSummaryItemDetailedTextCardSection *v262;
  void *v263;
  _SFPBRFSimpleItemPlayerCardSection *v264;
  void *v265;
  _SFPBRFSummaryItemPairCardSection *v266;
  void *v267;
  _SFPBRFSummaryItemPairNumberCardSection *v268;
  void *v269;
  _SFPBRFFactItemShortHeroNumberCardSection *v270;
  void *v271;
  _SFPBRFFactItemDetailedNumberCardSection *v272;
  void *v273;
  _SFPBRFFactItemHeroButtonCardSection *v274;
  void *v275;
  _SFPBRFFactItemImageRightCardSection *v276;
  void *v277;
  _SFPBRFSummaryItemSwitchV2CardSection *v278;
  void *v279;
  _SFPBRFTableHeaderCardSection *v280;
  void *v281;
  _SFPBRFTableRowCardSection *v282;
  void *v283;
  _SFPBRFSimpleItemVisualElementCardSection *v284;
  void *v285;
  _SFPBRFSummaryItemPlayerCardSection *v286;
  void *v287;
  _SFPBRFSummaryItemImageRightCardSection *v288;
  void *v289;
  _SFPBRFSummaryItemButtonCardSection *v290;
  void *v291;
  _SFPBRFSimpleItemReverseRichCardSection *v292;
  void *v293;
  _SFPBRFSimpleItemRichSearchResultCardSection *v294;
  void *v295;
  _SFPBRFPrimaryHeaderStackedImageCardSection *v296;
  void *v297;
  _SFPBRFReferenceItemLogoCardSection *v298;
  void *v299;
  _SFPBRFReferenceItemButtonCardSection *v300;
  void *v301;
  _SFPBRFButtonCardSection *v302;
  void *v303;
  _SFPBRFBinaryButtonCardSection *v304;
  void *v305;
  _SFPBRFReferenceCenteredCardSection *v306;
  void *v307;
  _SFPBRFSecondaryHeaderStandardCardSection *v308;
  void *v309;
  _SFPBRFSecondaryHeaderEmphasizedCardSection *v310;
  void *v311;
  _SFPBRFMapCardSection *v312;
  void *v313;
  _SFPBRFReferenceStandardCardSection *v314;
  void *v315;
  _SFPBRFMultiButtonCardSection *v316;
  void *v317;
  _SFPBRFDisambiguationTitleCardSection *v318;
  void *v319;
  _SFPBCardSection *v320;
  id v322;
  void *v323;
  void *v324;
  void *v325;
  void *v326;
  _SFPBCardSection *v327;
  id v328;
  __int128 v329;
  __int128 v330;
  __int128 v331;
  __int128 v332;
  __int128 v333;
  __int128 v334;
  __int128 v335;
  __int128 v336;
  __int128 v337;
  __int128 v338;
  __int128 v339;
  __int128 v340;
  __int128 v341;
  __int128 v342;
  __int128 v343;
  __int128 v344;
  __int128 v345;
  __int128 v346;
  __int128 v347;
  __int128 v348;
  __int128 v349;
  __int128 v350;
  __int128 v351;
  __int128 v352;
  __int128 v353;
  __int128 v354;
  __int128 v355;
  __int128 v356;
  objc_super v357;
  _BYTE v358[128];
  _BYTE v359[128];
  _BYTE v360[128];
  _BYTE v361[128];
  _BYTE v362[128];
  _BYTE v363[128];
  _BYTE v364[128];
  uint64_t v365;

  v365 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v357.receiver = self;
  v357.super_class = (Class)_SFPBCardSection;
  v5 = -[_SFPBCardSection init](&v357, sel_init);

  if (v5)
  {
    objc_msgSend(v4, "nextCard");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_SFPBCard alloc];
      objc_msgSend(v4, "nextCard");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_SFPBCard initWithFacade:](v7, "initWithFacade:", v8);
      -[_SFPBCardSection setNextCard:](v5, "setNextCard:", v9);

    }
    objc_msgSend(v4, "commands");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v327 = v5;
    if (v10)
    {
      v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

    }
    else
    {
      v11 = 0;
    }

    v355 = 0u;
    v356 = 0u;
    v353 = 0u;
    v354 = 0u;
    v326 = v4;
    objc_msgSend(v4, "commands");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v353, v364, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v354;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v354 != v15)
            objc_enumerationMutation(v12);
          v17 = -[_SFPBAbstractCommand initWithFacade:]([_SFPBAbstractCommand alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v353 + 1) + 8 * i));
          if (v17)
            objc_msgSend(v11, "addObject:", v17);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v353, v364, 16);
      }
      while (v14);
    }

    -[_SFPBCardSection setCommands:](v327, "setCommands:", v11);
    objc_msgSend(v4, "parameterKeyPaths");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

    }
    else
    {
      v19 = 0;
    }

    v351 = 0u;
    v352 = 0u;
    v349 = 0u;
    v350 = 0u;
    objc_msgSend(v4, "parameterKeyPaths");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v349, v363, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v350;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v350 != v23)
            objc_enumerationMutation(v20);
          v25 = *(id *)(*((_QWORD *)&v349 + 1) + 8 * j);
          if (v25)
            objc_msgSend(v19, "addObject:", v25);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v349, v363, 16);
      }
      while (v22);
    }

    v324 = v19;
    -[_SFPBCardSection setParameterKeyPaths:](v327, "setParameterKeyPaths:", v19);
    objc_msgSend(v326, "cardSectionId");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v326, "cardSectionId");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBCardSection setCardSectionId:](v327, "setCardSectionId:", v27);

    }
    objc_msgSend(v326, "resultIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v326, "resultIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBCardSection setResultIdentifier:](v327, "setResultIdentifier:", v29);

    }
    objc_msgSend(v326, "userReportRequest");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      v31 = [_SFPBUserReportRequest alloc];
      objc_msgSend(v326, "userReportRequest");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[_SFPBUserReportRequest initWithFacade:](v31, "initWithFacade:", v32);
      -[_SFPBCardSection setUserReportRequest:](v327, "setUserReportRequest:", v33);

    }
    objc_msgSend(v326, "command");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      v35 = [_SFPBCommand alloc];
      objc_msgSend(v326, "command");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = -[_SFPBCommand initWithFacade:](v35, "initWithFacade:", v36);
      -[_SFPBCardSection setCommand:](v327, "setCommand:", v37);

    }
    objc_msgSend(v326, "previewCommand");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      v39 = [_SFPBCommand alloc];
      objc_msgSend(v326, "previewCommand");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = -[_SFPBCommand initWithFacade:](v39, "initWithFacade:", v40);
      -[_SFPBCardSection setPreviewCommand:](v327, "setPreviewCommand:", v41);

    }
    objc_msgSend(v326, "previewButtonItems");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (v42)
    {
      v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

    }
    else
    {
      v43 = 0;
    }

    v347 = 0u;
    v348 = 0u;
    v345 = 0u;
    v346 = 0u;
    objc_msgSend(v326, "previewButtonItems");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v345, v362, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v346;
      do
      {
        for (k = 0; k != v46; ++k)
        {
          if (*(_QWORD *)v346 != v47)
            objc_enumerationMutation(v44);
          v49 = -[_SFPBButtonItem initWithFacade:]([_SFPBButtonItem alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v345 + 1) + 8 * k));
          if (v49)
            objc_msgSend(v43, "addObject:", v49);

        }
        v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v345, v362, 16);
      }
      while (v46);
    }

    -[_SFPBCardSection setPreviewButtonItems:](v327, "setPreviewButtonItems:", v43);
    objc_msgSend(v326, "cardSectionDetail");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v50)
    {
      objc_msgSend(v326, "cardSectionDetail");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBCardSection setCardSectionDetail:](v327, "setCardSectionDetail:", v51);

    }
    objc_msgSend(v326, "previewButtonItemsTitle");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      objc_msgSend(v326, "previewButtonItemsTitle");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBCardSection setPreviewButtonItemsTitle:](v327, "setPreviewButtonItemsTitle:", v53);

    }
    objc_msgSend(v326, "backgroundColor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (v54)
    {
      v55 = [_SFPBColor alloc];
      objc_msgSend(v326, "backgroundColor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = -[_SFPBColor initWithFacade:](v55, "initWithFacade:", v56);
      -[_SFPBCardSection setBackgroundColor:](v327, "setBackgroundColor:", v57);

    }
    -[_SFPBCardSection setShouldHideInAmbientMode:](v327, "setShouldHideInAmbientMode:", objc_msgSend(v326, "shouldHideInAmbientMode"));
    objc_msgSend(v326, "leadingSwipeButtonItems");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v325 = v11;
    if (v58)
    {
      v328 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

    }
    else
    {
      v328 = 0;
    }

    v343 = 0u;
    v344 = 0u;
    v341 = 0u;
    v342 = 0u;
    objc_msgSend(v326, "leadingSwipeButtonItems");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v341, v361, 16);
    if (v60)
    {
      v61 = v60;
      v62 = *(_QWORD *)v342;
      do
      {
        for (m = 0; m != v61; ++m)
        {
          if (*(_QWORD *)v342 != v62)
            objc_enumerationMutation(v59);
          v64 = -[_SFPBButtonItem initWithFacade:]([_SFPBButtonItem alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v341 + 1) + 8 * m));
          if (v64)
            objc_msgSend(v328, "addObject:", v64);

        }
        v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v341, v361, 16);
      }
      while (v61);
    }

    -[_SFPBCardSection setLeadingSwipeButtonItems:](v327, "setLeadingSwipeButtonItems:", v328);
    objc_msgSend(v326, "trailingSwipeButtonItems");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v322 = v43;
    if (v65)
    {
      v66 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

    }
    else
    {
      v66 = 0;
    }

    v339 = 0u;
    v340 = 0u;
    v337 = 0u;
    v338 = 0u;
    objc_msgSend(v326, "trailingSwipeButtonItems");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v337, v360, 16);
    if (v68)
    {
      v69 = v68;
      v70 = *(_QWORD *)v338;
      do
      {
        for (n = 0; n != v69; ++n)
        {
          if (*(_QWORD *)v338 != v70)
            objc_enumerationMutation(v67);
          v72 = -[_SFPBButtonItem initWithFacade:]([_SFPBButtonItem alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v337 + 1) + 8 * n), v322);
          if (v72)
            objc_msgSend(v66, "addObject:", v72);

        }
        v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v337, v360, 16);
      }
      while (v69);
    }

    -[_SFPBCardSection setTrailingSwipeButtonItems:](v327, "setTrailingSwipeButtonItems:", v66);
    objc_msgSend(v326, "punchoutOptions");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    if (v73)
    {
      v74 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

    }
    else
    {
      v74 = 0;
    }

    v335 = 0u;
    v336 = 0u;
    v333 = 0u;
    v334 = 0u;
    objc_msgSend(v326, "punchoutOptions");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v333, v359, 16);
    if (v76)
    {
      v77 = v76;
      v78 = *(_QWORD *)v334;
      do
      {
        for (ii = 0; ii != v77; ++ii)
        {
          if (*(_QWORD *)v334 != v78)
            objc_enumerationMutation(v75);
          v80 = -[_SFPBPunchout initWithFacade:]([_SFPBPunchout alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v333 + 1) + 8 * ii));
          if (v80)
            objc_msgSend(v74, "addObject:", v80);

        }
        v77 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v333, v359, 16);
      }
      while (v77);
    }

    -[_SFPBCardSection setPunchoutOptions:](v327, "setPunchoutOptions:", v74);
    v4 = v326;
    objc_msgSend(v326, "punchoutPickerTitle");
    v81 = (void *)objc_claimAutoreleasedReturnValue();

    if (v81)
    {
      objc_msgSend(v326, "punchoutPickerTitle");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBCardSection setPunchoutPickerTitle:](v327, "setPunchoutPickerTitle:", v82);

    }
    objc_msgSend(v326, "punchoutPickerDismissText", v322);
    v83 = (void *)objc_claimAutoreleasedReturnValue();

    if (v83)
    {
      objc_msgSend(v326, "punchoutPickerDismissText");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBCardSection setPunchoutPickerDismissText:](v327, "setPunchoutPickerDismissText:", v84);

    }
    -[_SFPBCardSection setCanBeHidden:](v327, "setCanBeHidden:", objc_msgSend(v326, "canBeHidden"));
    -[_SFPBCardSection setHasTopPadding:](v327, "setHasTopPadding:", objc_msgSend(v326, "hasTopPadding"));
    -[_SFPBCardSection setHasBottomPadding:](v327, "setHasBottomPadding:", objc_msgSend(v326, "hasBottomPadding"));
    -[_SFPBCardSection setSeparatorStyle:](v327, "setSeparatorStyle:", objc_msgSend(v326, "separatorStyle"));
    objc_msgSend(v326, "referencedCommands");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    if (v85)
    {
      v86 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

    }
    else
    {
      v86 = 0;
    }

    v331 = 0u;
    v332 = 0u;
    v329 = 0u;
    v330 = 0u;
    objc_msgSend(v326, "referencedCommands");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v329, v358, 16);
    if (v88)
    {
      v89 = v88;
      v90 = *(_QWORD *)v330;
      do
      {
        for (jj = 0; jj != v89; ++jj)
        {
          if (*(_QWORD *)v330 != v90)
            objc_enumerationMutation(v87);
          v92 = -[_SFPBCommand initWithFacade:]([_SFPBCommand alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v329 + 1) + 8 * jj));
          if (v92)
            objc_msgSend(v86, "addObject:", v92);

        }
        v89 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v329, v358, 16);
      }
      while (v89);
    }

    v5 = v327;
    -[_SFPBCardSection setReferencedCommands:](v327, "setReferencedCommands:", v86);
    -[_SFPBCardSection setForceEnable3DTouch:](v327, "setForceEnable3DTouch:", objc_msgSend(v326, "forceEnable3DTouch"));
    -[_SFPBCardSection setShouldShowInSmartDialog:](v327, "setShouldShowInSmartDialog:", objc_msgSend(v326, "shouldShowInSmartDialog"));
    objc_msgSend(v326, "appEntityAnnotation");
    v93 = (void *)objc_claimAutoreleasedReturnValue();

    if (v93)
    {
      v94 = [_SFPBAppEntityAnnotation alloc];
      objc_msgSend(v326, "appEntityAnnotation");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = -[_SFPBAppEntityAnnotation initWithFacade:](v94, "initWithFacade:", v95);
      -[_SFPBCardSection setAppEntityAnnotation:](v327, "setAppEntityAnnotation:", v96);

    }
    objc_msgSend(v326, "emphasisSubjectId");
    v97 = (void *)objc_claimAutoreleasedReturnValue();

    if (v97)
    {
      objc_msgSend(v326, "emphasisSubjectId");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBCardSection setEmphasisSubjectId:](v327, "setEmphasisSubjectId:", v98);

    }
    v99 = objc_alloc_init(_SFPBCardSectionValue);
    -[_SFPBCardSection setValue:](v327, "setValue:", v99);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 1);
      v100 = -[_SFPBAppLinkCardSection initWithFacade:]([_SFPBAppLinkCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "setAppLinkCardSection:", v100);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 2);
      v102 = -[_SFPBDescriptionCardSection initWithFacade:]([_SFPBDescriptionCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "setDescriptionCardSection:", v102);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 3);
      v104 = -[_SFPBKeyValueDataCardSection initWithFacade:]([_SFPBKeyValueDataCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "setKeyValueDataCardSection:", v104);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 4);
      v106 = -[_SFPBMapCardSection initWithFacade:]([_SFPBMapCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "setMapCardSection:", v106);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 5);
      v108 = -[_SFPBMediaInfoCardSection initWithFacade:]([_SFPBMediaInfoCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "setMediaInfoCardSection:", v108);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 6);
      v110 = -[_SFPBMediaPlayerCardSection initWithFacade:]([_SFPBMediaPlayerCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "setMediaPlayerCardSection:", v110);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 7);
      v112 = -[_SFPBNowPlayingCardSection initWithFacade:]([_SFPBNowPlayingCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "setNowPlayingCardSection:", v112);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 8);
      v114 = -[_SFPBRichTitleCardSection initWithFacade:]([_SFPBRichTitleCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "setRichTitleCardSection:", v114);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 9);
      v116 = -[_SFPBRowCardSection initWithFacade:]([_SFPBRowCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "setRowCardSection:", v116);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 10);
      v118 = -[_SFPBScoreboardCardSection initWithFacade:]([_SFPBScoreboardCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v119, "setScoreboardCardSection:", v118);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 11);
      v120 = -[_SFPBSocialMediaPostCardSection initWithFacade:]([_SFPBSocialMediaPostCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "setSocialMediaPostCardSection:", v120);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 12);
      v122 = -[_SFPBStockChartCardSection initWithFacade:]([_SFPBStockChartCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v123, "setStockChartCardSection:", v122);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 13);
      v124 = -[_SFPBTableHeaderRowCardSection initWithFacade:]([_SFPBTableHeaderRowCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v125, "setTableHeaderRowCardSection:", v124);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        -[_SFPBCardSection setType:](v327, "setType:", 14);
        v126 = -[_SFPBTableRowCardSection initWithFacade:]([_SFPBTableRowCardSection alloc], "initWithFacade:", v326);
        -[_SFPBCardSection value](v327, "value");
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v127, "setTableRowCardSection:", v126);

      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 15);
      v128 = -[_SFPBTextColumnsCardSection initWithFacade:]([_SFPBTextColumnsCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v129, "setTextColumnsCardSection:", v128);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  -[_SFPBCardSection setType:](v327, "setType:", 16);
                  v130 = -[_SFPBTitleCardSection initWithFacade:]([_SFPBTitleCardSection alloc], "initWithFacade:", v326);
                  -[_SFPBCardSection value](v327, "value");
                  v131 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v131, "setTitleCardSection:", v130);

                }
              }
            }
          }
        }
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 17);
      v132 = -[_SFPBTrackListCardSection initWithFacade:]([_SFPBTrackListCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v133, "setTrackListCardSection:", v132);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 18);
      v134 = -[_SFPBAudioPlaybackCardSection initWithFacade:]([_SFPBAudioPlaybackCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v135, "setAudioPlaybackCardSection:", v134);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 19);
      v136 = -[_SFPBFlightCardSection initWithFacade:]([_SFPBFlightCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v137, "setFlightCardSection:", v136);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 20);
      v138 = -[_SFPBActivityIndicatorCardSection initWithFacade:]([_SFPBActivityIndicatorCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v139, "setActivityIndicatorCardSection:", v138);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 21);
      v140 = -[_SFPBWebCardSection initWithFacade:]([_SFPBWebCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v141, "setWebCardSection:", v140);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 22);
      v142 = -[_SFPBMessageCardSection initWithFacade:]([_SFPBMessageCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v143, "setMessageCardSection:", v142);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 23);
      v144 = -[_SFPBDetailedRowCardSection initWithFacade:]([_SFPBDetailedRowCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v145, "setDetailedRowCardSection:", v144);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 24);
      v146 = -[_SFPBImagesCardSection initWithFacade:]([_SFPBImagesCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v147, "setImagesCardSection:", v146);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 25);
      v148 = -[_SFPBSuggestionCardSection initWithFacade:]([_SFPBSuggestionCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v149, "setSuggestionCardSection:", v148);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 26);
      v150 = -[_SFPBSelectableGridCardSection initWithFacade:]([_SFPBSelectableGridCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v151, "setSelectableGridCardSection:", v150);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 27);
      v152 = -[_SFPBSectionHeaderCardSection initWithFacade:]([_SFPBSectionHeaderCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v153, "setSectionHeaderCardSection:", v152);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 28);
      v154 = -[_SFPBMetaInfoCardSection initWithFacade:]([_SFPBMetaInfoCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v155, "setMetaInfoCardSection:", v154);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 29);
      v156 = -[_SFPBWatchListCardSection initWithFacade:]([_SFPBWatchListCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v157, "setWatchListCardSection:", v156);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 30);
      v158 = -[_SFPBMapsDetailedRowCardSection initWithFacade:]([_SFPBMapsDetailedRowCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v159, "setMapsDetailedRowCardSection:", v158);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 31);
      v160 = -[_SFPBButtonCardSection initWithFacade:]([_SFPBButtonCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v161, "setButtonCardSection:", v160);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 32);
      v162 = -[_SFPBHorizontalButtonCardSection initWithFacade:]([_SFPBHorizontalButtonCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v163, "setHorizontalButtonCardSection:", v162);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 33);
      v164 = -[_SFPBVerticalLayoutCardSection initWithFacade:]([_SFPBVerticalLayoutCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v165, "setVerticalLayoutCardSection:", v164);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 34);
      v166 = -[_SFPBProductCardSection initWithFacade:]([_SFPBProductCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v167, "setProductCardSection:", v166);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 35);
      v168 = -[_SFPBHorizontalScrollCardSection initWithFacade:]([_SFPBHorizontalScrollCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v169, "setHorizontalScrollCardSection:", v168);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 36);
      v170 = -[_SFPBMediaRemoteControlCardSection initWithFacade:]([_SFPBMediaRemoteControlCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v171, "setMediaRemoteControlCardSection:", v170);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 37);
      v172 = -[_SFPBMapPlaceCardSection initWithFacade:]([_SFPBMapPlaceCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v173, "setMapPlaceCardSection:", v172);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 38);
      v174 = -[_SFPBCompactRowCardSection initWithFacade:]([_SFPBCompactRowCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v175, "setCompactRowCardSection:", v174);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 39);
      v176 = -[_SFPBWorldMapCardSection initWithFacade:]([_SFPBWorldMapCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v177 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v177, "setWorldMapCardSection:", v176);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 40);
      v178 = -[_SFPBAttributionFooterCardSection initWithFacade:]([_SFPBAttributionFooterCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v179 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v179, "setAttributionFooterCardSection:", v178);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 41);
      v180 = -[_SFPBGridCardSection initWithFacade:]([_SFPBGridCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v181 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v181, "setGridCardSection:", v180);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 42);
      v182 = -[_SFPBPersonHeaderCardSection initWithFacade:]([_SFPBPersonHeaderCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v183 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v183, "setPersonHeaderCardSection:", v182);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 43);
      v184 = -[_SFPBColorBarCardSection initWithFacade:]([_SFPBColorBarCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v185 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v185, "setColorBarCardSection:", v184);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 44);
      v186 = -[_SFPBSplitCardSection initWithFacade:]([_SFPBSplitCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v187 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v187, "setSplitCardSection:", v186);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 45);
      v188 = -[_SFPBLinkPresentationCardSection initWithFacade:]([_SFPBLinkPresentationCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v189 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v189, "setLinkPresentationCardSection:", v188);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 46);
      v190 = -[_SFPBFindMyCardSection initWithFacade:]([_SFPBFindMyCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v191 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v191, "setFindMyCardSection:", v190);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 47);
      v192 = -[_SFPBHeroCardSection initWithFacade:]([_SFPBHeroCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v193 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v193, "setHeroCardSection:", v192);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 48);
      v194 = -[_SFPBNewsCardSection initWithFacade:]([_SFPBNewsCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v195 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v195, "setNewsCardSection:", v194);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 49);
      v196 = -[_SFPBMiniCardSection initWithFacade:]([_SFPBMiniCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v197 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v197, "setMiniCardSection:", v196);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 50);
      v198 = -[_SFPBInfoCardSection initWithFacade:]([_SFPBInfoCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v199 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v199, "setInfoCardSection:", v198);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 51);
      v200 = -[_SFPBCollectionCardSection initWithFacade:]([_SFPBCollectionCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v201 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v201, "setCollectionCardSection:", v200);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 52);
      v202 = -[_SFPBCombinedCardSection initWithFacade:]([_SFPBCombinedCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v203 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v203, "setCombinedCardSection:", v202);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 53);
      v204 = -[_SFPBResponseWrapperCardSection initWithFacade:]([_SFPBResponseWrapperCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v205 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v205, "setResponseWrapperCardSection:", v204);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 54);
      v206 = -[_SFPBListenToCardSection initWithFacade:]([_SFPBListenToCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v207 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v207, "setListenToCardSection:", v206);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 55);
      v208 = -[_SFPBWatchNowCardSection initWithFacade:]([_SFPBWatchNowCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v209 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v209, "setWatchNowCardSection:", v208);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 56);
      v210 = -[_SFPBStrokeAnimationCardSection initWithFacade:]([_SFPBStrokeAnimationCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v211 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v211, "setStrokeAnimationCardSection:", v210);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 57);
      v212 = -[_SFPBButtonListCardSection initWithFacade:]([_SFPBButtonListCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v213 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v213, "setButtonListCardSection:", v212);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 58);
      v214 = -[_SFPBCommandRowCardSection initWithFacade:]([_SFPBCommandRowCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v215 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v215, "setCommandRowCardSection:", v214);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 59);
      v216 = -[_SFPBLeadingTrailingCardSection initWithFacade:]([_SFPBLeadingTrailingCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v217 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v217, "setLeadingTrailingCardSection:", v216);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 60);
      v218 = -[_SFPBHeroTitleCardSection initWithFacade:]([_SFPBHeroTitleCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v219 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v219, "setHeroTitleCardSection:", v218);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 61);
      v220 = -[_SFPBArchiveViewCardSection initWithFacade:]([_SFPBArchiveViewCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v221 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v221, "setArchiveViewCardSection:", v220);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 63);
      v222 = -[_SFPBAppIconCardSection initWithFacade:]([_SFPBAppIconCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v223 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v223, "setAppIconCardSection:", v222);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 64);
      v224 = -[_SFPBLargeTitleDetailedRowCardSection initWithFacade:]([_SFPBLargeTitleDetailedRowCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v225 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v225, "setLargeTitleDetailedRowCardSection:", v224);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 90);
      v226 = -[_SFPBSafariTableOfContentsCardSection initWithFacade:]([_SFPBSafariTableOfContentsCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v227 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v227, "setSafariTableOfContentsCardSection:", v226);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 200);
      v228 = -[_SFPBRFSummaryItemShortNumberCardSection initWithFacade:]([_SFPBRFSummaryItemShortNumberCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v229 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v229, "setRfSummaryItemShortNumberCardSection:", v228);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 201);
      v230 = -[_SFPBRFSummaryItemTextCardSection initWithFacade:]([_SFPBRFSummaryItemTextCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v231 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v231, "setRfSummaryItemTextCardSection:", v230);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 202);
      v232 = -[_SFPBRFSummaryItemStandardCardSection initWithFacade:]([_SFPBRFSummaryItemStandardCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v233 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v233, "setRfSummaryItemStandardCardSection:", v232);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 203);
      v234 = -[_SFPBRFFactItemShortNumberCardSection initWithFacade:]([_SFPBRFFactItemShortNumberCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v235 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v235, "setRfFactItemShortNumberCardSection:", v234);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 204);
      v236 = -[_SFPBRFFactItemStandardCardSection initWithFacade:]([_SFPBRFFactItemStandardCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v237 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v237, "setRfFactItemStandardCardSection:", v236);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 205);
      v238 = -[_SFPBRFLongItemStandardCardSection initWithFacade:]([_SFPBRFLongItemStandardCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v239 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v239, "setRfLongItemStandardCardSection:", v238);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 206);
      v240 = -[_SFPBRFPrimaryHeaderRichCardSection initWithFacade:]([_SFPBRFPrimaryHeaderRichCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v241 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v241, "setRfPrimaryHeaderRichCardSection:", v240);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 207);
      v242 = -[_SFPBRFPrimaryHeaderStandardCardSection initWithFacade:]([_SFPBRFPrimaryHeaderStandardCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v243 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v243, "setRfPrimaryHeaderStandardCardSection:", v242);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 208);
      v244 = -[_SFPBRFReferenceFootnoteCardSection initWithFacade:]([_SFPBRFReferenceFootnoteCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v245 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v245, "setRfReferenceFootnoteCardSection:", v244);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 209);
      v246 = -[_SFPBRFReferenceRichCardSection initWithFacade:]([_SFPBRFReferenceRichCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v247 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v247, "setRfReferenceRichCardSection:", v246);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 210);
      v248 = -[_SFPBRFSimpleItemRichCardSection initWithFacade:]([_SFPBRFSimpleItemRichCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v249 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v249, "setRfSimpleItemRichCardSection:", v248);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 211);
      v250 = -[_SFPBRFSimpleItemStandardCardSection initWithFacade:]([_SFPBRFSimpleItemStandardCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v251 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v251, "setRfSimpleItemStandardCardSection:", v250);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 212);
      v252 = -[_SFPBRFSummaryItemAlignedTextCardSection initWithFacade:]([_SFPBRFSummaryItemAlignedTextCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v253 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v253, "setRfSummaryItemAlignedTextCardSection:", v252);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 213);
      v254 = -[_SFPBRFExpandableStandardCardSection initWithFacade:]([_SFPBRFExpandableStandardCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v255 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "setRfExpandableStandardCardSection:", v254);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 214);
      v256 = -[_SFPBRFFactItemButtonCardSection initWithFacade:]([_SFPBRFFactItemButtonCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v257 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v257, "setRfFactItemButtonCardSection:", v256);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 215);
      v258 = -[_SFPBRFFactItemHeroNumberCardSection initWithFacade:]([_SFPBRFFactItemHeroNumberCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v259 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v259, "setRfFactItemHeroNumberCardSection:", v258);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 216);
      v260 = -[_SFPBRFPrimaryHeaderMarqueeCardSection initWithFacade:]([_SFPBRFPrimaryHeaderMarqueeCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v261 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v261, "setRfPrimaryHeaderMarqueeCardSection:", v260);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 217);
      v262 = -[_SFPBRFSummaryItemDetailedTextCardSection initWithFacade:]([_SFPBRFSummaryItemDetailedTextCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v263 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v263, "setRfSummaryItemDetailedTextCardSection:", v262);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 218);
      v264 = -[_SFPBRFSimpleItemPlayerCardSection initWithFacade:]([_SFPBRFSimpleItemPlayerCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v265 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v265, "setRfSimpleItemPlayerCardSection:", v264);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 219);
      v266 = -[_SFPBRFSummaryItemPairCardSection initWithFacade:]([_SFPBRFSummaryItemPairCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v267 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v267, "setRfSummaryItemPairCardSection:", v266);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 220);
      v268 = -[_SFPBRFSummaryItemPairNumberCardSection initWithFacade:]([_SFPBRFSummaryItemPairNumberCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v269 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v269, "setRfSummaryItemPairNumberCardSection:", v268);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 221);
      v270 = -[_SFPBRFFactItemShortHeroNumberCardSection initWithFacade:]([_SFPBRFFactItemShortHeroNumberCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v271 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v271, "setRfFactItemShortHeroNumberCardSection:", v270);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 222);
      v272 = -[_SFPBRFFactItemDetailedNumberCardSection initWithFacade:]([_SFPBRFFactItemDetailedNumberCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v273 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v273, "setRfFactItemDetailedNumberCardSection:", v272);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 223);
      v274 = -[_SFPBRFFactItemHeroButtonCardSection initWithFacade:]([_SFPBRFFactItemHeroButtonCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v275 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v275, "setRfFactItemHeroButtonCardSection:", v274);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 224);
      v276 = -[_SFPBRFFactItemImageRightCardSection initWithFacade:]([_SFPBRFFactItemImageRightCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v277 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v277, "setRfFactItemImageRightCardSection:", v276);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 225);
      v278 = -[_SFPBRFSummaryItemSwitchV2CardSection initWithFacade:]([_SFPBRFSummaryItemSwitchV2CardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v279 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v279, "setRfSummaryItemSwitchV2CardSection:", v278);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 226);
      v280 = -[_SFPBRFTableHeaderCardSection initWithFacade:]([_SFPBRFTableHeaderCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v281 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v281, "setRfTableHeaderCardSection:", v280);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 227);
      v282 = -[_SFPBRFTableRowCardSection initWithFacade:]([_SFPBRFTableRowCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v283 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v283, "setRfTableRowCardSection:", v282);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 228);
      v284 = -[_SFPBRFSimpleItemVisualElementCardSection initWithFacade:]([_SFPBRFSimpleItemVisualElementCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v285 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v285, "setRfSimpleItemVisualElementCardSection:", v284);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 229);
      v286 = -[_SFPBRFSummaryItemPlayerCardSection initWithFacade:]([_SFPBRFSummaryItemPlayerCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v287 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v287, "setRfSummaryItemPlayerCardSection:", v286);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 230);
      v288 = -[_SFPBRFSummaryItemImageRightCardSection initWithFacade:]([_SFPBRFSummaryItemImageRightCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v289 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v289, "setRfSummaryItemImageRightCardSection:", v288);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 231);
      v290 = -[_SFPBRFSummaryItemButtonCardSection initWithFacade:]([_SFPBRFSummaryItemButtonCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v291 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v291, "setRfSummaryItemButtonCardSection:", v290);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 232);
      v292 = -[_SFPBRFSimpleItemReverseRichCardSection initWithFacade:]([_SFPBRFSimpleItemReverseRichCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v293 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v293, "setRfSimpleItemReverseRichCardSection:", v292);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 233);
      v294 = -[_SFPBRFSimpleItemRichSearchResultCardSection initWithFacade:]([_SFPBRFSimpleItemRichSearchResultCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v295 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v295, "setRfSimpleItemRichSearchResultCardSection:", v294);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 234);
      v296 = -[_SFPBRFPrimaryHeaderStackedImageCardSection initWithFacade:]([_SFPBRFPrimaryHeaderStackedImageCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v297 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v297, "setRfPrimaryHeaderStackedImageCardSection:", v296);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 235);
      v298 = -[_SFPBRFReferenceItemLogoCardSection initWithFacade:]([_SFPBRFReferenceItemLogoCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v299 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v299, "setRfReferenceItemLogoCardSection:", v298);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 236);
      v300 = -[_SFPBRFReferenceItemButtonCardSection initWithFacade:]([_SFPBRFReferenceItemButtonCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v301 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v301, "setRfReferenceItemButtonCardSection:", v300);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 237);
      v302 = -[_SFPBRFButtonCardSection initWithFacade:]([_SFPBRFButtonCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v303 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v303, "setRfButtonCardSection:", v302);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 238);
      v304 = -[_SFPBRFBinaryButtonCardSection initWithFacade:]([_SFPBRFBinaryButtonCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v305 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v305, "setRfBinaryButtonCardSection:", v304);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 239);
      v306 = -[_SFPBRFReferenceCenteredCardSection initWithFacade:]([_SFPBRFReferenceCenteredCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v307 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v307, "setRfReferenceCenteredCardSection:", v306);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 240);
      v308 = -[_SFPBRFSecondaryHeaderStandardCardSection initWithFacade:]([_SFPBRFSecondaryHeaderStandardCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v309 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v309, "setRfSecondaryHeaderStandardCardSection:", v308);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 241);
      v310 = -[_SFPBRFSecondaryHeaderEmphasizedCardSection initWithFacade:]([_SFPBRFSecondaryHeaderEmphasizedCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v311 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v311, "setRfSecondaryHeaderEmphasizedCardSection:", v310);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 242);
      v312 = -[_SFPBRFMapCardSection initWithFacade:]([_SFPBRFMapCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v313 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v313, "setRfMapCardSection:", v312);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 243);
      v314 = -[_SFPBRFReferenceStandardCardSection initWithFacade:]([_SFPBRFReferenceStandardCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v315 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v315, "setRfReferenceStandardCardSection:", v314);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 744);
      v316 = -[_SFPBRFMultiButtonCardSection initWithFacade:]([_SFPBRFMultiButtonCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v317 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v317, "setRfMultiButtonCardSection:", v316);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFPBCardSection setType:](v327, "setType:", 745);
      v318 = -[_SFPBRFDisambiguationTitleCardSection initWithFacade:]([_SFPBRFDisambiguationTitleCardSection alloc], "initWithFacade:", v326);
      -[_SFPBCardSection value](v327, "value");
      v319 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v319, "setRfDisambiguationTitleCardSection:", v318);

    }
    v320 = v327;

  }
  return v5;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (void)setNextCard:(id)a3
{
  objc_storeStrong((id *)&self->_nextCard, a3);
}

- (void)setCommands:(id)a3
{
  NSArray *v4;
  NSArray *commands;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  commands = self->_commands;
  self->_commands = v4;

}

- (void)clearCommands
{
  -[NSArray removeAllObjects](self->_commands, "removeAllObjects");
}

- (void)addCommands:(id)a3
{
  id v4;
  NSArray *commands;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  commands = self->_commands;
  v8 = v4;
  if (!commands)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_commands;
    self->_commands = v6;

    v4 = v8;
    commands = self->_commands;
  }
  -[NSArray addObject:](commands, "addObject:", v4);

}

- (unint64_t)commandsCount
{
  return -[NSArray count](self->_commands, "count");
}

- (id)commandsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_commands, "objectAtIndexedSubscript:", a3);
}

- (void)setParameterKeyPaths:(id)a3
{
  NSArray *v4;
  NSArray *parameterKeyPaths;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  parameterKeyPaths = self->_parameterKeyPaths;
  self->_parameterKeyPaths = v4;

}

- (void)clearParameterKeyPaths
{
  -[NSArray removeAllObjects](self->_parameterKeyPaths, "removeAllObjects");
}

- (void)addParameterKeyPaths:(id)a3
{
  id v4;
  NSArray *parameterKeyPaths;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  parameterKeyPaths = self->_parameterKeyPaths;
  v8 = v4;
  if (!parameterKeyPaths)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_parameterKeyPaths;
    self->_parameterKeyPaths = v6;

    v4 = v8;
    parameterKeyPaths = self->_parameterKeyPaths;
  }
  -[NSArray addObject:](parameterKeyPaths, "addObject:", v4);

}

- (unint64_t)parameterKeyPathsCount
{
  return -[NSArray count](self->_parameterKeyPaths, "count");
}

- (id)parameterKeyPathsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_parameterKeyPaths, "objectAtIndexedSubscript:", a3);
}

- (void)setCardSectionId:(id)a3
{
  NSString *v4;
  NSString *cardSectionId;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  cardSectionId = self->_cardSectionId;
  self->_cardSectionId = v4;

}

- (void)setResultIdentifier:(id)a3
{
  NSString *v4;
  NSString *resultIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  resultIdentifier = self->_resultIdentifier;
  self->_resultIdentifier = v4;

}

- (void)setUserReportRequest:(id)a3
{
  objc_storeStrong((id *)&self->_userReportRequest, a3);
}

- (void)setCommand:(id)a3
{
  objc_storeStrong((id *)&self->_command, a3);
}

- (void)setPreviewCommand:(id)a3
{
  objc_storeStrong((id *)&self->_previewCommand, a3);
}

- (void)setPreviewButtonItems:(id)a3
{
  NSArray *v4;
  NSArray *previewButtonItems;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  previewButtonItems = self->_previewButtonItems;
  self->_previewButtonItems = v4;

}

- (void)clearPreviewButtonItems
{
  -[NSArray removeAllObjects](self->_previewButtonItems, "removeAllObjects");
}

- (void)addPreviewButtonItems:(id)a3
{
  id v4;
  NSArray *previewButtonItems;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  previewButtonItems = self->_previewButtonItems;
  v8 = v4;
  if (!previewButtonItems)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_previewButtonItems;
    self->_previewButtonItems = v6;

    v4 = v8;
    previewButtonItems = self->_previewButtonItems;
  }
  -[NSArray addObject:](previewButtonItems, "addObject:", v4);

}

- (unint64_t)previewButtonItemsCount
{
  return -[NSArray count](self->_previewButtonItems, "count");
}

- (id)previewButtonItemsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_previewButtonItems, "objectAtIndexedSubscript:", a3);
}

- (void)setCardSectionDetail:(id)a3
{
  NSString *v4;
  NSString *cardSectionDetail;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  cardSectionDetail = self->_cardSectionDetail;
  self->_cardSectionDetail = v4;

}

- (void)setPreviewButtonItemsTitle:(id)a3
{
  NSString *v4;
  NSString *previewButtonItemsTitle;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  previewButtonItemsTitle = self->_previewButtonItemsTitle;
  self->_previewButtonItemsTitle = v4;

}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (void)setShouldHideInAmbientMode:(BOOL)a3
{
  self->_shouldHideInAmbientMode = a3;
}

- (void)setLeadingSwipeButtonItems:(id)a3
{
  NSArray *v4;
  NSArray *leadingSwipeButtonItems;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  leadingSwipeButtonItems = self->_leadingSwipeButtonItems;
  self->_leadingSwipeButtonItems = v4;

}

- (void)clearLeadingSwipeButtonItems
{
  -[NSArray removeAllObjects](self->_leadingSwipeButtonItems, "removeAllObjects");
}

- (void)addLeadingSwipeButtonItems:(id)a3
{
  id v4;
  NSArray *leadingSwipeButtonItems;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  leadingSwipeButtonItems = self->_leadingSwipeButtonItems;
  v8 = v4;
  if (!leadingSwipeButtonItems)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_leadingSwipeButtonItems;
    self->_leadingSwipeButtonItems = v6;

    v4 = v8;
    leadingSwipeButtonItems = self->_leadingSwipeButtonItems;
  }
  -[NSArray addObject:](leadingSwipeButtonItems, "addObject:", v4);

}

- (unint64_t)leadingSwipeButtonItemsCount
{
  return -[NSArray count](self->_leadingSwipeButtonItems, "count");
}

- (id)leadingSwipeButtonItemsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_leadingSwipeButtonItems, "objectAtIndexedSubscript:", a3);
}

- (void)setTrailingSwipeButtonItems:(id)a3
{
  NSArray *v4;
  NSArray *trailingSwipeButtonItems;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  trailingSwipeButtonItems = self->_trailingSwipeButtonItems;
  self->_trailingSwipeButtonItems = v4;

}

- (void)clearTrailingSwipeButtonItems
{
  -[NSArray removeAllObjects](self->_trailingSwipeButtonItems, "removeAllObjects");
}

- (void)addTrailingSwipeButtonItems:(id)a3
{
  id v4;
  NSArray *trailingSwipeButtonItems;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  trailingSwipeButtonItems = self->_trailingSwipeButtonItems;
  v8 = v4;
  if (!trailingSwipeButtonItems)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_trailingSwipeButtonItems;
    self->_trailingSwipeButtonItems = v6;

    v4 = v8;
    trailingSwipeButtonItems = self->_trailingSwipeButtonItems;
  }
  -[NSArray addObject:](trailingSwipeButtonItems, "addObject:", v4);

}

- (unint64_t)trailingSwipeButtonItemsCount
{
  return -[NSArray count](self->_trailingSwipeButtonItems, "count");
}

- (id)trailingSwipeButtonItemsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_trailingSwipeButtonItems, "objectAtIndexedSubscript:", a3);
}

- (void)setPunchoutOptions:(id)a3
{
  NSArray *v4;
  NSArray *punchoutOptions;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  punchoutOptions = self->_punchoutOptions;
  self->_punchoutOptions = v4;

}

- (void)clearPunchoutOptions
{
  -[NSArray removeAllObjects](self->_punchoutOptions, "removeAllObjects");
}

- (void)addPunchoutOptions:(id)a3
{
  id v4;
  NSArray *punchoutOptions;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  punchoutOptions = self->_punchoutOptions;
  v8 = v4;
  if (!punchoutOptions)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_punchoutOptions;
    self->_punchoutOptions = v6;

    v4 = v8;
    punchoutOptions = self->_punchoutOptions;
  }
  -[NSArray addObject:](punchoutOptions, "addObject:", v4);

}

- (unint64_t)punchoutOptionsCount
{
  return -[NSArray count](self->_punchoutOptions, "count");
}

- (id)punchoutOptionsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_punchoutOptions, "objectAtIndexedSubscript:", a3);
}

- (void)setPunchoutPickerTitle:(id)a3
{
  NSString *v4;
  NSString *punchoutPickerTitle;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  punchoutPickerTitle = self->_punchoutPickerTitle;
  self->_punchoutPickerTitle = v4;

}

- (void)setPunchoutPickerDismissText:(id)a3
{
  NSString *v4;
  NSString *punchoutPickerDismissText;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  punchoutPickerDismissText = self->_punchoutPickerDismissText;
  self->_punchoutPickerDismissText = v4;

}

- (void)setCanBeHidden:(BOOL)a3
{
  self->_canBeHidden = a3;
}

- (void)setHasTopPadding:(BOOL)a3
{
  self->_hasTopPadding = a3;
}

- (void)setHasBottomPadding:(BOOL)a3
{
  self->_hasBottomPadding = a3;
}

- (void)setSeparatorStyle:(int)a3
{
  self->_separatorStyle = a3;
}

- (void)setReferencedCommands:(id)a3
{
  NSArray *v4;
  NSArray *referencedCommands;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  referencedCommands = self->_referencedCommands;
  self->_referencedCommands = v4;

}

- (void)clearReferencedCommands
{
  -[NSArray removeAllObjects](self->_referencedCommands, "removeAllObjects");
}

- (void)addReferencedCommands:(id)a3
{
  id v4;
  NSArray *referencedCommands;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  referencedCommands = self->_referencedCommands;
  v8 = v4;
  if (!referencedCommands)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_referencedCommands;
    self->_referencedCommands = v6;

    v4 = v8;
    referencedCommands = self->_referencedCommands;
  }
  -[NSArray addObject:](referencedCommands, "addObject:", v4);

}

- (unint64_t)referencedCommandsCount
{
  return -[NSArray count](self->_referencedCommands, "count");
}

- (id)referencedCommandsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_referencedCommands, "objectAtIndexedSubscript:", a3);
}

- (void)setForceEnable3DTouch:(BOOL)a3
{
  self->_forceEnable3DTouch = a3;
}

- (void)setShouldShowInSmartDialog:(BOOL)a3
{
  self->_shouldShowInSmartDialog = a3;
}

- (void)setAppEntityAnnotation:(id)a3
{
  objc_storeStrong((id *)&self->_appEntityAnnotation, a3);
}

- (void)setEmphasisSubjectId:(id)a3
{
  NSString *v4;
  NSString *emphasisSubjectId;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  emphasisSubjectId = self->_emphasisSubjectId;
  self->_emphasisSubjectId = v4;

}

- (BOOL)readFrom:(id)a3
{
  return _SFPBCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_SFPBCardSection type](self, "type"))
    PBDataWriterWriteInt32Field();
  -[_SFPBCardSection value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSection nextCard](self, "nextCard");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSection commands](self, "commands");
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v78, v88, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v79;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v79 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v78, v88, 16);
    }
    while (v9);
  }

  -[_SFPBCardSection parameterKeyPaths](self, "parameterKeyPaths");
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v74, v87, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v75;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v75 != v15)
          objc_enumerationMutation(v12);
        PBDataWriterWriteStringField();
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v74, v87, 16);
    }
    while (v14);
  }

  -[_SFPBCardSection cardSectionId](self, "cardSectionId");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    PBDataWriterWriteStringField();

  -[_SFPBCardSection resultIdentifier](self, "resultIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    PBDataWriterWriteStringField();

  -[_SFPBCardSection userReportRequest](self, "userReportRequest");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSection command](self, "command");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSection previewCommand](self, "previewCommand");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSection previewButtonItems](self, "previewButtonItems");
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v70, v86, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v71;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v71 != v25)
          objc_enumerationMutation(v22);
        PBDataWriterWriteSubmessage();
        ++v26;
      }
      while (v24 != v26);
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v70, v86, 16);
    }
    while (v24);
  }

  -[_SFPBCardSection cardSectionDetail](self, "cardSectionDetail");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
    PBDataWriterWriteStringField();

  -[_SFPBCardSection previewButtonItemsTitle](self, "previewButtonItemsTitle");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
    PBDataWriterWriteStringField();

  -[_SFPBCardSection backgroundColor](self, "backgroundColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
    PBDataWriterWriteSubmessage();

  if (-[_SFPBCardSection shouldHideInAmbientMode](self, "shouldHideInAmbientMode"))
    PBDataWriterWriteBOOLField();
  -[_SFPBCardSection leadingSwipeButtonItems](self, "leadingSwipeButtonItems");
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v30 = (id)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v66, v85, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v67;
    do
    {
      v34 = 0;
      do
      {
        if (*(_QWORD *)v67 != v33)
          objc_enumerationMutation(v30);
        PBDataWriterWriteSubmessage();
        ++v34;
      }
      while (v32 != v34);
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v66, v85, 16);
    }
    while (v32);
  }

  -[_SFPBCardSection trailingSwipeButtonItems](self, "trailingSwipeButtonItems");
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v35 = (id)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v62, v84, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v63;
    do
    {
      v39 = 0;
      do
      {
        if (*(_QWORD *)v63 != v38)
          objc_enumerationMutation(v35);
        PBDataWriterWriteSubmessage();
        ++v39;
      }
      while (v37 != v39);
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v62, v84, 16);
    }
    while (v37);
  }

  -[_SFPBCardSection punchoutOptions](self, "punchoutOptions");
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v40 = (id)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v58, v83, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v59;
    do
    {
      v44 = 0;
      do
      {
        if (*(_QWORD *)v59 != v43)
          objc_enumerationMutation(v40);
        PBDataWriterWriteSubmessage();
        ++v44;
      }
      while (v42 != v44);
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v58, v83, 16);
    }
    while (v42);
  }

  -[_SFPBCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (v45)
    PBDataWriterWriteStringField();

  -[_SFPBCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (v46)
    PBDataWriterWriteStringField();

  if (-[_SFPBCardSection canBeHidden](self, "canBeHidden"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBCardSection hasTopPadding](self, "hasTopPadding"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBCardSection hasBottomPadding](self, "hasBottomPadding"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBCardSection separatorStyle](self, "separatorStyle"))
    PBDataWriterWriteInt32Field();
  -[_SFPBCardSection referencedCommands](self, "referencedCommands");
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v47 = (id)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v54, v82, 16);
  if (v48)
  {
    v49 = v48;
    v50 = *(_QWORD *)v55;
    do
    {
      v51 = 0;
      do
      {
        if (*(_QWORD *)v55 != v50)
          objc_enumerationMutation(v47);
        PBDataWriterWriteSubmessage();
        ++v51;
      }
      while (v49 != v51);
      v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v54, v82, 16);
    }
    while (v49);
  }

  if (-[_SFPBCardSection forceEnable3DTouch](self, "forceEnable3DTouch", v54))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBCardSection shouldShowInSmartDialog](self, "shouldShowInSmartDialog"))
    PBDataWriterWriteBOOLField();
  -[_SFPBCardSection appEntityAnnotation](self, "appEntityAnnotation");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (v52)
    PBDataWriterWriteSubmessage();

  -[_SFPBCardSection emphasisSubjectId](self, "emphasisSubjectId");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (v53)
    PBDataWriterWriteStringField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int type;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  int v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  int v72;
  int shouldHideInAmbientMode;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  int v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  int v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  int v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  int v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  int v98;
  int canBeHidden;
  int hasTopPadding;
  int hasBottomPadding;
  int separatorStyle;
  uint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  int v107;
  int forceEnable3DTouch;
  int shouldShowInSmartDialog;
  uint64_t v110;
  void *v111;
  void *v112;
  void *v113;
  int v114;
  uint64_t v115;
  void *v116;
  void *v117;
  void *v118;
  char v119;
  BOOL v120;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_115;
  type = self->_type;
  if (type != objc_msgSend(v4, "type"))
    goto LABEL_115;
  -[_SFPBCardSection value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_114;
  -[_SFPBCardSection value](self, "value");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[_SFPBCardSection value](self, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_115;
  }
  else
  {

  }
  -[_SFPBCardSection nextCard](self, "nextCard");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nextCard");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_114;
  -[_SFPBCardSection nextCard](self, "nextCard");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[_SFPBCardSection nextCard](self, "nextCard");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nextCard");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_115;
  }
  else
  {

  }
  -[_SFPBCardSection commands](self, "commands");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commands");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_114;
  -[_SFPBCardSection commands](self, "commands");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[_SFPBCardSection commands](self, "commands");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "commands");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_115;
  }
  else
  {

  }
  -[_SFPBCardSection parameterKeyPaths](self, "parameterKeyPaths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parameterKeyPaths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_114;
  -[_SFPBCardSection parameterKeyPaths](self, "parameterKeyPaths");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[_SFPBCardSection parameterKeyPaths](self, "parameterKeyPaths");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parameterKeyPaths");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_115;
  }
  else
  {

  }
  -[_SFPBCardSection cardSectionId](self, "cardSectionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cardSectionId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_114;
  -[_SFPBCardSection cardSectionId](self, "cardSectionId");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[_SFPBCardSection cardSectionId](self, "cardSectionId");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cardSectionId");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_115;
  }
  else
  {

  }
  -[_SFPBCardSection resultIdentifier](self, "resultIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resultIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_114;
  -[_SFPBCardSection resultIdentifier](self, "resultIdentifier");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[_SFPBCardSection resultIdentifier](self, "resultIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resultIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_115;
  }
  else
  {

  }
  -[_SFPBCardSection userReportRequest](self, "userReportRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userReportRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_114;
  -[_SFPBCardSection userReportRequest](self, "userReportRequest");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    -[_SFPBCardSection userReportRequest](self, "userReportRequest");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userReportRequest");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqual:", v41);

    if (!v42)
      goto LABEL_115;
  }
  else
  {

  }
  -[_SFPBCardSection command](self, "command");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "command");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_114;
  -[_SFPBCardSection command](self, "command");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;
    -[_SFPBCardSection command](self, "command");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "command");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "isEqual:", v46);

    if (!v47)
      goto LABEL_115;
  }
  else
  {

  }
  -[_SFPBCardSection previewCommand](self, "previewCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previewCommand");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_114;
  -[_SFPBCardSection previewCommand](self, "previewCommand");
  v48 = objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v49 = (void *)v48;
    -[_SFPBCardSection previewCommand](self, "previewCommand");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "previewCommand");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v50, "isEqual:", v51);

    if (!v52)
      goto LABEL_115;
  }
  else
  {

  }
  -[_SFPBCardSection previewButtonItems](self, "previewButtonItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previewButtonItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_114;
  -[_SFPBCardSection previewButtonItems](self, "previewButtonItems");
  v53 = objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    v54 = (void *)v53;
    -[_SFPBCardSection previewButtonItems](self, "previewButtonItems");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "previewButtonItems");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v55, "isEqual:", v56);

    if (!v57)
      goto LABEL_115;
  }
  else
  {

  }
  -[_SFPBCardSection cardSectionDetail](self, "cardSectionDetail");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cardSectionDetail");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_114;
  -[_SFPBCardSection cardSectionDetail](self, "cardSectionDetail");
  v58 = objc_claimAutoreleasedReturnValue();
  if (v58)
  {
    v59 = (void *)v58;
    -[_SFPBCardSection cardSectionDetail](self, "cardSectionDetail");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cardSectionDetail");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v60, "isEqual:", v61);

    if (!v62)
      goto LABEL_115;
  }
  else
  {

  }
  -[_SFPBCardSection previewButtonItemsTitle](self, "previewButtonItemsTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previewButtonItemsTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_114;
  -[_SFPBCardSection previewButtonItemsTitle](self, "previewButtonItemsTitle");
  v63 = objc_claimAutoreleasedReturnValue();
  if (v63)
  {
    v64 = (void *)v63;
    -[_SFPBCardSection previewButtonItemsTitle](self, "previewButtonItemsTitle");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "previewButtonItemsTitle");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v65, "isEqual:", v66);

    if (!v67)
      goto LABEL_115;
  }
  else
  {

  }
  -[_SFPBCardSection backgroundColor](self, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_114;
  -[_SFPBCardSection backgroundColor](self, "backgroundColor");
  v68 = objc_claimAutoreleasedReturnValue();
  if (v68)
  {
    v69 = (void *)v68;
    -[_SFPBCardSection backgroundColor](self, "backgroundColor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "backgroundColor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v70, "isEqual:", v71);

    if (!v72)
      goto LABEL_115;
  }
  else
  {

  }
  shouldHideInAmbientMode = self->_shouldHideInAmbientMode;
  if (shouldHideInAmbientMode != objc_msgSend(v4, "shouldHideInAmbientMode"))
    goto LABEL_115;
  -[_SFPBCardSection leadingSwipeButtonItems](self, "leadingSwipeButtonItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingSwipeButtonItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_114;
  -[_SFPBCardSection leadingSwipeButtonItems](self, "leadingSwipeButtonItems");
  v74 = objc_claimAutoreleasedReturnValue();
  if (v74)
  {
    v75 = (void *)v74;
    -[_SFPBCardSection leadingSwipeButtonItems](self, "leadingSwipeButtonItems");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "leadingSwipeButtonItems");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend(v76, "isEqual:", v77);

    if (!v78)
      goto LABEL_115;
  }
  else
  {

  }
  -[_SFPBCardSection trailingSwipeButtonItems](self, "trailingSwipeButtonItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingSwipeButtonItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_114;
  -[_SFPBCardSection trailingSwipeButtonItems](self, "trailingSwipeButtonItems");
  v79 = objc_claimAutoreleasedReturnValue();
  if (v79)
  {
    v80 = (void *)v79;
    -[_SFPBCardSection trailingSwipeButtonItems](self, "trailingSwipeButtonItems");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trailingSwipeButtonItems");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = objc_msgSend(v81, "isEqual:", v82);

    if (!v83)
      goto LABEL_115;
  }
  else
  {

  }
  -[_SFPBCardSection punchoutOptions](self, "punchoutOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_114;
  -[_SFPBCardSection punchoutOptions](self, "punchoutOptions");
  v84 = objc_claimAutoreleasedReturnValue();
  if (v84)
  {
    v85 = (void *)v84;
    -[_SFPBCardSection punchoutOptions](self, "punchoutOptions");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchoutOptions");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend(v86, "isEqual:", v87);

    if (!v88)
      goto LABEL_115;
  }
  else
  {

  }
  -[_SFPBCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutPickerTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_114;
  -[_SFPBCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v89 = objc_claimAutoreleasedReturnValue();
  if (v89)
  {
    v90 = (void *)v89;
    -[_SFPBCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchoutPickerTitle");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = objc_msgSend(v91, "isEqual:", v92);

    if (!v93)
      goto LABEL_115;
  }
  else
  {

  }
  -[_SFPBCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutPickerDismissText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_114;
  -[_SFPBCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v94 = objc_claimAutoreleasedReturnValue();
  if (v94)
  {
    v95 = (void *)v94;
    -[_SFPBCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchoutPickerDismissText");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = objc_msgSend(v96, "isEqual:", v97);

    if (!v98)
      goto LABEL_115;
  }
  else
  {

  }
  canBeHidden = self->_canBeHidden;
  if (canBeHidden != objc_msgSend(v4, "canBeHidden"))
    goto LABEL_115;
  hasTopPadding = self->_hasTopPadding;
  if (hasTopPadding != objc_msgSend(v4, "hasTopPadding"))
    goto LABEL_115;
  hasBottomPadding = self->_hasBottomPadding;
  if (hasBottomPadding != objc_msgSend(v4, "hasBottomPadding"))
    goto LABEL_115;
  separatorStyle = self->_separatorStyle;
  if (separatorStyle != objc_msgSend(v4, "separatorStyle"))
    goto LABEL_115;
  -[_SFPBCardSection referencedCommands](self, "referencedCommands");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "referencedCommands");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_114;
  -[_SFPBCardSection referencedCommands](self, "referencedCommands");
  v103 = objc_claimAutoreleasedReturnValue();
  if (v103)
  {
    v104 = (void *)v103;
    -[_SFPBCardSection referencedCommands](self, "referencedCommands");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "referencedCommands");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = objc_msgSend(v105, "isEqual:", v106);

    if (!v107)
      goto LABEL_115;
  }
  else
  {

  }
  forceEnable3DTouch = self->_forceEnable3DTouch;
  if (forceEnable3DTouch != objc_msgSend(v4, "forceEnable3DTouch"))
    goto LABEL_115;
  shouldShowInSmartDialog = self->_shouldShowInSmartDialog;
  if (shouldShowInSmartDialog != objc_msgSend(v4, "shouldShowInSmartDialog"))
    goto LABEL_115;
  -[_SFPBCardSection appEntityAnnotation](self, "appEntityAnnotation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appEntityAnnotation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_114;
  -[_SFPBCardSection appEntityAnnotation](self, "appEntityAnnotation");
  v110 = objc_claimAutoreleasedReturnValue();
  if (v110)
  {
    v111 = (void *)v110;
    -[_SFPBCardSection appEntityAnnotation](self, "appEntityAnnotation");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appEntityAnnotation");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = objc_msgSend(v112, "isEqual:", v113);

    if (!v114)
      goto LABEL_115;
  }
  else
  {

  }
  -[_SFPBCardSection emphasisSubjectId](self, "emphasisSubjectId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "emphasisSubjectId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_114:

    goto LABEL_115;
  }
  -[_SFPBCardSection emphasisSubjectId](self, "emphasisSubjectId");
  v115 = objc_claimAutoreleasedReturnValue();
  if (!v115)
  {

LABEL_118:
    v120 = 1;
    goto LABEL_116;
  }
  v116 = (void *)v115;
  -[_SFPBCardSection emphasisSubjectId](self, "emphasisSubjectId");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "emphasisSubjectId");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = objc_msgSend(v117, "isEqual:", v118);

  if ((v119 & 1) != 0)
    goto LABEL_118;
LABEL_115:
  v120 = 0;
LABEL_116:

  return v120;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  NSUInteger v22;
  NSUInteger v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  NSUInteger v28;
  NSUInteger v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;

  v3 = 2654435761;
  v34 = 2654435761 * self->_type;
  v33 = -[_SFPBCardSectionValue hash](self->_value, "hash");
  v32 = -[_SFPBCard hash](self->_nextCard, "hash");
  v31 = -[NSArray hash](self->_commands, "hash");
  v30 = -[NSArray hash](self->_parameterKeyPaths, "hash");
  v29 = -[NSString hash](self->_cardSectionId, "hash");
  v28 = -[NSString hash](self->_resultIdentifier, "hash");
  v27 = -[_SFPBUserReportRequest hash](self->_userReportRequest, "hash");
  v26 = -[_SFPBCommand hash](self->_command, "hash");
  v25 = -[_SFPBCommand hash](self->_previewCommand, "hash");
  v24 = -[NSArray hash](self->_previewButtonItems, "hash");
  v23 = -[NSString hash](self->_cardSectionDetail, "hash");
  v22 = -[NSString hash](self->_previewButtonItemsTitle, "hash");
  v4 = -[_SFPBColor hash](self->_backgroundColor, "hash");
  if (self->_shouldHideInAmbientMode)
    v5 = 2654435761;
  else
    v5 = 0;
  v20 = v5;
  v21 = v4;
  v19 = -[NSArray hash](self->_leadingSwipeButtonItems, "hash");
  v6 = -[NSArray hash](self->_trailingSwipeButtonItems, "hash");
  v7 = -[NSArray hash](self->_punchoutOptions, "hash");
  v8 = -[NSString hash](self->_punchoutPickerTitle, "hash");
  v9 = -[NSString hash](self->_punchoutPickerDismissText, "hash");
  if (self->_canBeHidden)
    v10 = 2654435761;
  else
    v10 = 0;
  if (self->_hasTopPadding)
    v11 = 2654435761;
  else
    v11 = 0;
  if (self->_hasBottomPadding)
    v12 = 2654435761;
  else
    v12 = 0;
  v13 = 2654435761 * self->_separatorStyle;
  v14 = -[NSArray hash](self->_referencedCommands, "hash");
  if (self->_forceEnable3DTouch)
    v15 = 2654435761;
  else
    v15 = 0;
  if (!self->_shouldShowInSmartDialog)
    v3 = 0;
  v16 = v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v34 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
  v17 = v3 ^ -[_SFPBAppEntityAnnotation hash](self->_appEntityAnnotation, "hash");
  return v16 ^ v17 ^ -[NSString hash](self->_emphasisSubjectId, "hash");
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
  NSArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSArray *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSArray *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t k;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSArray *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t m;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  NSArray *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t n;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  NSArray *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t ii;
  void *v89;
  void *v90;
  uint64_t v91;
  __CFString *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  id v99;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];
  _BYTE v130[128];
  uint64_t v131;

  v131 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_appEntityAnnotation)
  {
    -[_SFPBCardSection appEntityAnnotation](self, "appEntityAnnotation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("appEntityAnnotation"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("appEntityAnnotation"));

    }
  }
  if (self->_backgroundColor)
  {
    -[_SFPBCardSection backgroundColor](self, "backgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("backgroundColor"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("backgroundColor"));

    }
  }
  if (self->_canBeHidden)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBCardSection canBeHidden](self, "canBeHidden"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("canBeHidden"));

  }
  if (self->_cardSectionDetail)
  {
    -[_SFPBCardSection cardSectionDetail](self, "cardSectionDetail");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("cardSectionDetail"));

  }
  if (self->_cardSectionId)
  {
    -[_SFPBCardSection cardSectionId](self, "cardSectionId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("cardSectionId"));

  }
  if (self->_command)
  {
    -[_SFPBCardSection command](self, "command");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("command"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("command"));

    }
  }
  if (-[NSArray count](self->_commands, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v121 = 0u;
    v122 = 0u;
    v123 = 0u;
    v124 = 0u;
    v19 = self->_commands;
    v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v121, v130, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v122;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v122 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v121 + 1) + 8 * i), "dictionaryRepresentation");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
          {
            objc_msgSend(v18, "addObject:", v24);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "addObject:", v25);

          }
        }
        v21 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v121, v130, 16);
      }
      while (v21);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("commands"));
  }
  if (self->_emphasisSubjectId)
  {
    -[_SFPBCardSection emphasisSubjectId](self, "emphasisSubjectId");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v26, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("emphasisSubjectId"));

  }
  if (self->_forceEnable3DTouch)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBCardSection forceEnable3DTouch](self, "forceEnable3DTouch"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("forceEnable3DTouch"));

  }
  if (self->_hasBottomPadding)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBCardSection hasBottomPadding](self, "hasBottomPadding"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("hasBottomPadding"));

  }
  if (self->_hasTopPadding)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBCardSection hasTopPadding](self, "hasTopPadding"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("hasTopPadding"));

  }
  if (-[NSArray count](self->_leadingSwipeButtonItems, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v117 = 0u;
    v118 = 0u;
    v119 = 0u;
    v120 = 0u;
    v32 = self->_leadingSwipeButtonItems;
    v33 = -[NSArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v117, v129, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v118;
      do
      {
        for (j = 0; j != v34; ++j)
        {
          if (*(_QWORD *)v118 != v35)
            objc_enumerationMutation(v32);
          objc_msgSend(*(id *)(*((_QWORD *)&v117 + 1) + 8 * j), "dictionaryRepresentation");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (v37)
          {
            objc_msgSend(v31, "addObject:", v37);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "addObject:", v38);

          }
        }
        v34 = -[NSArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v117, v129, 16);
      }
      while (v34);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("leadingSwipeButtonItems"));
  }
  if (self->_nextCard)
  {
    -[_SFPBCardSection nextCard](self, "nextCard");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "dictionaryRepresentation");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("nextCard"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("nextCard"));

    }
  }
  if (self->_parameterKeyPaths)
  {
    -[_SFPBCardSection parameterKeyPaths](self, "parameterKeyPaths");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)objc_msgSend(v42, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("parameterKeyPaths"));

  }
  if (-[NSArray count](self->_previewButtonItems, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = 0u;
    v114 = 0u;
    v115 = 0u;
    v116 = 0u;
    v45 = self->_previewButtonItems;
    v46 = -[NSArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v113, v128, 16);
    if (v46)
    {
      v47 = v46;
      v48 = *(_QWORD *)v114;
      do
      {
        for (k = 0; k != v47; ++k)
        {
          if (*(_QWORD *)v114 != v48)
            objc_enumerationMutation(v45);
          objc_msgSend(*(id *)(*((_QWORD *)&v113 + 1) + 8 * k), "dictionaryRepresentation");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          if (v50)
          {
            objc_msgSend(v44, "addObject:", v50);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "addObject:", v51);

          }
        }
        v47 = -[NSArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v113, v128, 16);
      }
      while (v47);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("previewButtonItems"));
  }
  if (self->_previewButtonItemsTitle)
  {
    -[_SFPBCardSection previewButtonItemsTitle](self, "previewButtonItemsTitle");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)objc_msgSend(v52, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("previewButtonItemsTitle"));

  }
  if (self->_previewCommand)
  {
    -[_SFPBCardSection previewCommand](self, "previewCommand");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "dictionaryRepresentation");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (v55)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v55, CFSTR("previewCommand"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v56, CFSTR("previewCommand"));

    }
  }
  if (-[NSArray count](self->_punchoutOptions, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = 0u;
    v110 = 0u;
    v111 = 0u;
    v112 = 0u;
    v58 = self->_punchoutOptions;
    v59 = -[NSArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v109, v127, 16);
    if (v59)
    {
      v60 = v59;
      v61 = *(_QWORD *)v110;
      do
      {
        for (m = 0; m != v60; ++m)
        {
          if (*(_QWORD *)v110 != v61)
            objc_enumerationMutation(v58);
          objc_msgSend(*(id *)(*((_QWORD *)&v109 + 1) + 8 * m), "dictionaryRepresentation");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          if (v63)
          {
            objc_msgSend(v57, "addObject:", v63);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "addObject:", v64);

          }
        }
        v60 = -[NSArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v109, v127, 16);
      }
      while (v60);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v57, CFSTR("punchoutOptions"));
  }
  if (self->_punchoutPickerDismissText)
  {
    -[_SFPBCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = (void *)objc_msgSend(v65, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v66, CFSTR("punchoutPickerDismissText"));

  }
  if (self->_punchoutPickerTitle)
  {
    -[_SFPBCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = (void *)objc_msgSend(v67, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v68, CFSTR("punchoutPickerTitle"));

  }
  if (-[NSArray count](self->_referencedCommands, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = 0u;
    v106 = 0u;
    v107 = 0u;
    v108 = 0u;
    v70 = self->_referencedCommands;
    v71 = -[NSArray countByEnumeratingWithState:objects:count:](v70, "countByEnumeratingWithState:objects:count:", &v105, v126, 16);
    if (v71)
    {
      v72 = v71;
      v73 = *(_QWORD *)v106;
      do
      {
        for (n = 0; n != v72; ++n)
        {
          if (*(_QWORD *)v106 != v73)
            objc_enumerationMutation(v70);
          objc_msgSend(*(id *)(*((_QWORD *)&v105 + 1) + 8 * n), "dictionaryRepresentation");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          if (v75)
          {
            objc_msgSend(v69, "addObject:", v75);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "addObject:", v76);

          }
        }
        v72 = -[NSArray countByEnumeratingWithState:objects:count:](v70, "countByEnumeratingWithState:objects:count:", &v105, v126, 16);
      }
      while (v72);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v69, CFSTR("referencedCommands"));
  }
  if (self->_resultIdentifier)
  {
    -[_SFPBCardSection resultIdentifier](self, "resultIdentifier");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = (void *)objc_msgSend(v77, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v78, CFSTR("resultIdentifier"));

  }
  if (self->_separatorStyle)
  {
    v79 = -[_SFPBCardSection separatorStyle](self, "separatorStyle");
    if (v79 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v79);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v80 = *(&off_1E40421B0 + v79);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v80, CFSTR("separatorStyle"));

  }
  if (self->_shouldHideInAmbientMode)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBCardSection shouldHideInAmbientMode](self, "shouldHideInAmbientMode"));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v81, CFSTR("shouldHideInAmbientMode"));

  }
  if (self->_shouldShowInSmartDialog)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBCardSection shouldShowInSmartDialog](self, "shouldShowInSmartDialog"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v82, CFSTR("shouldShowInSmartDialog"));

  }
  if (-[NSArray count](self->_trailingSwipeButtonItems, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = 0u;
    v102 = 0u;
    v103 = 0u;
    v104 = 0u;
    v84 = self->_trailingSwipeButtonItems;
    v85 = -[NSArray countByEnumeratingWithState:objects:count:](v84, "countByEnumeratingWithState:objects:count:", &v101, v125, 16);
    if (v85)
    {
      v86 = v85;
      v87 = *(_QWORD *)v102;
      do
      {
        for (ii = 0; ii != v86; ++ii)
        {
          if (*(_QWORD *)v102 != v87)
            objc_enumerationMutation(v84);
          objc_msgSend(*(id *)(*((_QWORD *)&v101 + 1) + 8 * ii), "dictionaryRepresentation");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          if (v89)
          {
            objc_msgSend(v83, "addObject:", v89);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v83, "addObject:", v90);

          }
        }
        v86 = -[NSArray countByEnumeratingWithState:objects:count:](v84, "countByEnumeratingWithState:objects:count:", &v101, v125, 16);
      }
      while (v86);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v83, CFSTR("trailingSwipeButtonItems"));
  }
  if (self->_type)
  {
    v91 = -[_SFPBCardSection type](self, "type");
    v92 = CFSTR("0");
    switch((int)v91)
    {
      case 0:
        break;
      case 1:
        v92 = CFSTR("1");
        break;
      case 2:
        v92 = CFSTR("2");
        break;
      case 3:
        v92 = CFSTR("3");
        break;
      case 4:
        v92 = CFSTR("4");
        break;
      case 5:
        v92 = CFSTR("5");
        break;
      case 6:
        v92 = CFSTR("6");
        break;
      case 7:
        v92 = CFSTR("7");
        break;
      case 8:
        v92 = CFSTR("8");
        break;
      case 9:
        v92 = CFSTR("9");
        break;
      case 10:
        v92 = CFSTR("10");
        break;
      case 11:
        v92 = CFSTR("11");
        break;
      case 12:
        v92 = CFSTR("12");
        break;
      case 13:
        v92 = CFSTR("13");
        break;
      case 14:
        v92 = CFSTR("14");
        break;
      case 15:
        v92 = CFSTR("15");
        break;
      case 16:
        v92 = CFSTR("16");
        break;
      case 17:
        v92 = CFSTR("17");
        break;
      case 18:
        v92 = CFSTR("18");
        break;
      case 19:
        v92 = CFSTR("19");
        break;
      case 20:
        v92 = CFSTR("20");
        break;
      case 21:
        v92 = CFSTR("21");
        break;
      case 22:
        v92 = CFSTR("22");
        break;
      case 23:
        v92 = CFSTR("23");
        break;
      case 24:
        v92 = CFSTR("24");
        break;
      case 25:
        v92 = CFSTR("25");
        break;
      case 26:
        v92 = CFSTR("26");
        break;
      case 27:
        v92 = CFSTR("27");
        break;
      case 28:
        v92 = CFSTR("28");
        break;
      case 29:
        v92 = CFSTR("29");
        break;
      case 30:
        v92 = CFSTR("30");
        break;
      case 31:
        v92 = CFSTR("31");
        break;
      case 32:
        v92 = CFSTR("32");
        break;
      case 33:
        v92 = CFSTR("33");
        break;
      case 34:
        v92 = CFSTR("34");
        break;
      case 35:
        v92 = CFSTR("35");
        break;
      case 36:
        v92 = CFSTR("36");
        break;
      case 37:
        v92 = CFSTR("37");
        break;
      case 38:
        v92 = CFSTR("38");
        break;
      case 39:
        v92 = CFSTR("39");
        break;
      case 40:
        v92 = CFSTR("40");
        break;
      case 41:
        v92 = CFSTR("41");
        break;
      case 42:
        v92 = CFSTR("42");
        break;
      case 43:
        v92 = CFSTR("43");
        break;
      case 44:
        v92 = CFSTR("44");
        break;
      case 45:
        v92 = CFSTR("45");
        break;
      case 46:
        v92 = CFSTR("46");
        break;
      case 47:
        v92 = CFSTR("47");
        break;
      case 48:
        v92 = CFSTR("48");
        break;
      case 49:
        v92 = CFSTR("49");
        break;
      case 50:
        v92 = CFSTR("50");
        break;
      case 51:
        v92 = CFSTR("51");
        break;
      case 52:
        v92 = CFSTR("52");
        break;
      case 53:
        v92 = CFSTR("53");
        break;
      case 54:
        v92 = CFSTR("54");
        break;
      case 55:
        v92 = CFSTR("55");
        break;
      case 56:
        v92 = CFSTR("56");
        break;
      case 57:
        v92 = CFSTR("57");
        break;
      case 58:
        v92 = CFSTR("58");
        break;
      case 59:
        v92 = CFSTR("59");
        break;
      case 60:
        v92 = CFSTR("60");
        break;
      case 61:
        v92 = CFSTR("61");
        break;
      case 63:
        v92 = CFSTR("63");
        break;
      case 64:
        v92 = CFSTR("64");
        break;
      case 200:
        v92 = CFSTR("200");
        break;
      case 201:
        v92 = CFSTR("201");
        break;
      case 202:
        v92 = CFSTR("202");
        break;
      case 203:
        v92 = CFSTR("203");
        break;
      case 204:
        v92 = CFSTR("204");
        break;
      case 205:
        v92 = CFSTR("205");
        break;
      case 206:
        v92 = CFSTR("206");
        break;
      case 207:
        v92 = CFSTR("207");
        break;
      case 208:
        v92 = CFSTR("208");
        break;
      case 209:
        v92 = CFSTR("209");
        break;
      case 210:
        v92 = CFSTR("210");
        break;
      case 211:
        v92 = CFSTR("211");
        break;
      case 212:
        v92 = CFSTR("212");
        break;
      case 213:
        v92 = CFSTR("213");
        break;
      case 214:
        v92 = CFSTR("214");
        break;
      case 215:
        v92 = CFSTR("215");
        break;
      case 216:
        v92 = CFSTR("216");
        break;
      case 217:
        v92 = CFSTR("217");
        break;
      case 218:
        v92 = CFSTR("218");
        break;
      case 219:
        v92 = CFSTR("219");
        break;
      case 220:
        v92 = CFSTR("220");
        break;
      case 221:
        v92 = CFSTR("221");
        break;
      case 222:
        v92 = CFSTR("222");
        break;
      case 223:
        v92 = CFSTR("223");
        break;
      case 224:
        v92 = CFSTR("224");
        break;
      case 225:
        v92 = CFSTR("225");
        break;
      case 226:
        v92 = CFSTR("226");
        break;
      case 227:
        v92 = CFSTR("227");
        break;
      case 228:
        v92 = CFSTR("228");
        break;
      case 229:
        v92 = CFSTR("229");
        break;
      case 230:
        v92 = CFSTR("230");
        break;
      case 231:
        v92 = CFSTR("231");
        break;
      case 232:
        v92 = CFSTR("232");
        break;
      case 233:
        v92 = CFSTR("233");
        break;
      case 234:
        v92 = CFSTR("234");
        break;
      case 235:
        v92 = CFSTR("235");
        break;
      case 236:
        v92 = CFSTR("236");
        break;
      case 237:
        v92 = CFSTR("237");
        break;
      case 238:
        v92 = CFSTR("238");
        break;
      case 239:
        v92 = CFSTR("239");
        break;
      case 240:
        v92 = CFSTR("240");
        break;
      case 241:
        v92 = CFSTR("241");
        break;
      case 242:
        v92 = CFSTR("242");
        break;
      case 243:
        v92 = CFSTR("243");
        break;
      case 244:
        v92 = CFSTR("244");
        break;
      case 245:
        v92 = CFSTR("245");
        break;
      default:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v91);
        v92 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v92, CFSTR("type"));

  }
  if (self->_userReportRequest)
  {
    -[_SFPBCardSection userReportRequest](self, "userReportRequest");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "dictionaryRepresentation");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    if (v94)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v94, CFSTR("userReportRequest"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v95, CFSTR("userReportRequest"));

    }
  }
  if (self->_value)
  {
    -[_SFPBCardSection value](self, "value");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "dictionaryRepresentation");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    if (v97)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v97, CFSTR("value"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v98, CFSTR("value"));

    }
  }
  v99 = v3;

  return v99;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBCardSection dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBCardSection)initWithJSON:(id)a3
{
  void *v4;
  _SFPBCardSection *v5;
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
    self = -[_SFPBCardSection initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBCardSection)initWithDictionary:(id)a3
{
  id v4;
  _SFPBCardSection *v5;
  void *v6;
  uint64_t v7;
  _SFPBCardSectionValue *v8;
  uint64_t v9;
  _SFPBCard *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  _SFPBAbstractCommand *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  _SFPBUserReportRequest *v32;
  uint64_t v33;
  _SFPBCommand *v34;
  uint64_t v35;
  _SFPBCommand *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t k;
  uint64_t v43;
  _SFPBButtonItem *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  _SFPBColor *v50;
  void *v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t m;
  uint64_t v58;
  _SFPBButtonItem *v59;
  void *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t n;
  uint64_t v66;
  _SFPBButtonItem *v67;
  void *v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t ii;
  uint64_t v74;
  _SFPBPunchout *v75;
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
  id v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t jj;
  uint64_t v91;
  _SFPBCommand *v92;
  void *v93;
  void *v94;
  void *v95;
  _SFPBAppEntityAnnotation *v96;
  void *v97;
  void *v98;
  _SFPBCardSection *v99;
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
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  objc_super v153;
  _BYTE v154[128];
  _BYTE v155[128];
  _BYTE v156[128];
  _BYTE v157[128];
  _BYTE v158[128];
  _BYTE v159[128];
  _BYTE v160[128];
  uint64_t v161;

  v161 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v153.receiver = self;
  v153.super_class = (Class)_SFPBCardSection;
  v5 = -[_SFPBCardSection init](&v153, sel_init);

  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBCardSection setType:](v5, "setType:", objc_msgSend(v6, "intValue"));
    v107 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("value"));
    v7 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = -[_SFPBCardSectionValue initWithDictionary:]([_SFPBCardSectionValue alloc], "initWithDictionary:", v7);
      -[_SFPBCardSection setValue:](v5, "setValue:", v8);

    }
    v106 = (void *)v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nextCard"));
    v9 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = -[_SFPBCard initWithDictionary:]([_SFPBCard alloc], "initWithDictionary:", v9);
      -[_SFPBCardSection setNextCard:](v5, "setNextCard:", v10);

    }
    v105 = (void *)v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("commands"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v124 = v11;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v151 = 0u;
      v152 = 0u;
      v149 = 0u;
      v150 = 0u;
      v12 = v11;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v149, v160, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v150;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v150 != v15)
              objc_enumerationMutation(v12);
            v17 = *(_QWORD *)(*((_QWORD *)&v149 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v18 = -[_SFPBAbstractCommand initWithDictionary:]([_SFPBAbstractCommand alloc], "initWithDictionary:", v17);
              -[_SFPBCardSection addCommands:](v5, "addCommands:", v18);

            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v149, v160, 16);
        }
        while (v14);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("parameterKeyPaths"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v123 = v19;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v147 = 0u;
      v148 = 0u;
      v145 = 0u;
      v146 = 0u;
      v20 = v19;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v145, v159, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v146;
        do
        {
          for (j = 0; j != v22; ++j)
          {
            if (*(_QWORD *)v146 != v23)
              objc_enumerationMutation(v20);
            v25 = *(void **)(*((_QWORD *)&v145 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v26 = (void *)objc_msgSend(v25, "copy");
              -[_SFPBCardSection addParameterKeyPaths:](v5, "addParameterKeyPaths:", v26);

            }
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v145, v159, 16);
        }
        while (v22);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cardSectionId"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v122 = v27;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = (void *)objc_msgSend(v27, "copy");
      -[_SFPBCardSection setCardSectionId:](v5, "setCardSectionId:", v28);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resultIdentifier"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v121 = v29;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v30 = (void *)objc_msgSend(v29, "copy");
      -[_SFPBCardSection setResultIdentifier:](v5, "setResultIdentifier:", v30);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userReportRequest"));
    v31 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v120 = (void *)v31;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v32 = -[_SFPBUserReportRequest initWithDictionary:]([_SFPBUserReportRequest alloc], "initWithDictionary:", v31);
      -[_SFPBCardSection setUserReportRequest:](v5, "setUserReportRequest:", v32);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("command"));
    v33 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v119 = (void *)v33;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v34 = -[_SFPBCommand initWithDictionary:]([_SFPBCommand alloc], "initWithDictionary:", v33);
      -[_SFPBCardSection setCommand:](v5, "setCommand:", v34);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("previewCommand"));
    v35 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v118 = (void *)v35;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v36 = -[_SFPBCommand initWithDictionary:]([_SFPBCommand alloc], "initWithDictionary:", v35);
      -[_SFPBCardSection setPreviewCommand:](v5, "setPreviewCommand:", v36);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("previewButtonItems"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v117 = v37;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v143 = 0u;
      v144 = 0u;
      v141 = 0u;
      v142 = 0u;
      v38 = v37;
      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v141, v158, 16);
      if (v39)
      {
        v40 = v39;
        v41 = *(_QWORD *)v142;
        do
        {
          for (k = 0; k != v40; ++k)
          {
            if (*(_QWORD *)v142 != v41)
              objc_enumerationMutation(v38);
            v43 = *(_QWORD *)(*((_QWORD *)&v141 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v44 = -[_SFPBButtonItem initWithDictionary:]([_SFPBButtonItem alloc], "initWithDictionary:", v43);
              -[_SFPBCardSection addPreviewButtonItems:](v5, "addPreviewButtonItems:", v44);

            }
          }
          v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v141, v158, 16);
        }
        while (v40);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cardSectionDetail"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v116 = v45;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v46 = (void *)objc_msgSend(v45, "copy");
      -[_SFPBCardSection setCardSectionDetail:](v5, "setCardSectionDetail:", v46);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("previewButtonItemsTitle"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v115 = v47;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v48 = (void *)objc_msgSend(v47, "copy");
      -[_SFPBCardSection setPreviewButtonItemsTitle:](v5, "setPreviewButtonItemsTitle:", v48);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("backgroundColor"));
    v49 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v114 = (void *)v49;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v50 = -[_SFPBColor initWithDictionary:]([_SFPBColor alloc], "initWithDictionary:", v49);
      -[_SFPBCardSection setBackgroundColor:](v5, "setBackgroundColor:", v50);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("shouldHideInAmbientMode"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v113 = v51;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBCardSection setShouldHideInAmbientMode:](v5, "setShouldHideInAmbientMode:", objc_msgSend(v51, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("leadingSwipeButtonItems"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v112 = v52;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v139 = 0u;
      v140 = 0u;
      v137 = 0u;
      v138 = 0u;
      v53 = v52;
      v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v137, v157, 16);
      if (v54)
      {
        v55 = v54;
        v56 = *(_QWORD *)v138;
        do
        {
          for (m = 0; m != v55; ++m)
          {
            if (*(_QWORD *)v138 != v56)
              objc_enumerationMutation(v53);
            v58 = *(_QWORD *)(*((_QWORD *)&v137 + 1) + 8 * m);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v59 = -[_SFPBButtonItem initWithDictionary:]([_SFPBButtonItem alloc], "initWithDictionary:", v58);
              -[_SFPBCardSection addLeadingSwipeButtonItems:](v5, "addLeadingSwipeButtonItems:", v59);

            }
          }
          v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v137, v157, 16);
        }
        while (v55);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trailingSwipeButtonItems"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v111 = v60;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v135 = 0u;
      v136 = 0u;
      v133 = 0u;
      v134 = 0u;
      v61 = v60;
      v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v133, v156, 16);
      if (v62)
      {
        v63 = v62;
        v64 = *(_QWORD *)v134;
        do
        {
          for (n = 0; n != v63; ++n)
          {
            if (*(_QWORD *)v134 != v64)
              objc_enumerationMutation(v61);
            v66 = *(_QWORD *)(*((_QWORD *)&v133 + 1) + 8 * n);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v67 = -[_SFPBButtonItem initWithDictionary:]([_SFPBButtonItem alloc], "initWithDictionary:", v66);
              -[_SFPBCardSection addTrailingSwipeButtonItems:](v5, "addTrailingSwipeButtonItems:", v67);

            }
          }
          v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v133, v156, 16);
        }
        while (v63);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("punchoutOptions"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v110 = v68;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v131 = 0u;
      v132 = 0u;
      v129 = 0u;
      v130 = 0u;
      v69 = v68;
      v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v129, v155, 16);
      if (v70)
      {
        v71 = v70;
        v72 = *(_QWORD *)v130;
        do
        {
          for (ii = 0; ii != v71; ++ii)
          {
            if (*(_QWORD *)v130 != v72)
              objc_enumerationMutation(v69);
            v74 = *(_QWORD *)(*((_QWORD *)&v129 + 1) + 8 * ii);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v75 = -[_SFPBPunchout initWithDictionary:]([_SFPBPunchout alloc], "initWithDictionary:", v74);
              -[_SFPBCardSection addPunchoutOptions:](v5, "addPunchoutOptions:", v75);

            }
          }
          v71 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v129, v155, 16);
        }
        while (v71);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("punchoutPickerTitle"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v77 = (void *)objc_msgSend(v76, "copy");
      -[_SFPBCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v77);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("punchoutPickerDismissText"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v79 = v78;
      v80 = (void *)objc_msgSend(v78, "copy");
      -[_SFPBCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v80);

      v78 = v79;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("canBeHidden"));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBCardSection setCanBeHidden:](v5, "setCanBeHidden:", objc_msgSend(v81, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasTopPadding"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v109 = v82;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBCardSection setHasTopPadding:](v5, "setHasTopPadding:", objc_msgSend(v82, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasBottomPadding"));
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v108 = v83;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", objc_msgSend(v83, "BOOLValue"));
    v104 = v76;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("separatorStyle"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", objc_msgSend(v84, "intValue"));
    v102 = v84;
    v103 = v81;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("referencedCommands"));
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v101 = v78;
      v127 = 0u;
      v128 = 0u;
      v125 = 0u;
      v126 = 0u;
      v86 = v85;
      v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v125, v154, 16);
      if (v87)
      {
        v88 = v87;
        v89 = *(_QWORD *)v126;
        do
        {
          for (jj = 0; jj != v88; ++jj)
          {
            if (*(_QWORD *)v126 != v89)
              objc_enumerationMutation(v86);
            v91 = *(_QWORD *)(*((_QWORD *)&v125 + 1) + 8 * jj);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v92 = -[_SFPBCommand initWithDictionary:]([_SFPBCommand alloc], "initWithDictionary:", v91);
              -[_SFPBCardSection addReferencedCommands:](v5, "addReferencedCommands:", v92);

            }
          }
          v88 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v125, v154, 16);
        }
        while (v88);
      }

      v78 = v101;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("forceEnable3DTouch"));
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBCardSection setForceEnable3DTouch:](v5, "setForceEnable3DTouch:", objc_msgSend(v93, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("shouldShowInSmartDialog"));
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBCardSection setShouldShowInSmartDialog:](v5, "setShouldShowInSmartDialog:", objc_msgSend(v94, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appEntityAnnotation"));
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v96 = -[_SFPBAppEntityAnnotation initWithDictionary:]([_SFPBAppEntityAnnotation alloc], "initWithDictionary:", v95);
      -[_SFPBCardSection setAppEntityAnnotation:](v5, "setAppEntityAnnotation:", v96);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("emphasisSubjectId"));
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v98 = (void *)objc_msgSend(v97, "copy");
      -[_SFPBCardSection setEmphasisSubjectId:](v5, "setEmphasisSubjectId:", v98);

    }
    v99 = v5;

  }
  return v5;
}

- (int)type
{
  return self->_type;
}

- (_SFPBCardSectionValue)value
{
  return self->_value;
}

- (_SFPBCard)nextCard
{
  return self->_nextCard;
}

- (NSArray)commands
{
  return self->_commands;
}

- (NSArray)parameterKeyPaths
{
  return self->_parameterKeyPaths;
}

- (NSString)cardSectionId
{
  return self->_cardSectionId;
}

- (NSString)resultIdentifier
{
  return self->_resultIdentifier;
}

- (_SFPBUserReportRequest)userReportRequest
{
  return self->_userReportRequest;
}

- (_SFPBCommand)command
{
  return self->_command;
}

- (_SFPBCommand)previewCommand
{
  return self->_previewCommand;
}

- (NSArray)previewButtonItems
{
  return self->_previewButtonItems;
}

- (NSString)cardSectionDetail
{
  return self->_cardSectionDetail;
}

- (NSString)previewButtonItemsTitle
{
  return self->_previewButtonItemsTitle;
}

- (_SFPBColor)backgroundColor
{
  return self->_backgroundColor;
}

- (BOOL)shouldHideInAmbientMode
{
  return self->_shouldHideInAmbientMode;
}

- (NSArray)leadingSwipeButtonItems
{
  return self->_leadingSwipeButtonItems;
}

- (NSArray)trailingSwipeButtonItems
{
  return self->_trailingSwipeButtonItems;
}

- (NSArray)punchoutOptions
{
  return self->_punchoutOptions;
}

- (NSString)punchoutPickerTitle
{
  return self->_punchoutPickerTitle;
}

- (NSString)punchoutPickerDismissText
{
  return self->_punchoutPickerDismissText;
}

- (BOOL)canBeHidden
{
  return self->_canBeHidden;
}

- (BOOL)hasTopPadding
{
  return self->_hasTopPadding;
}

- (BOOL)hasBottomPadding
{
  return self->_hasBottomPadding;
}

- (int)separatorStyle
{
  return self->_separatorStyle;
}

- (NSArray)referencedCommands
{
  return self->_referencedCommands;
}

- (BOOL)forceEnable3DTouch
{
  return self->_forceEnable3DTouch;
}

- (BOOL)shouldShowInSmartDialog
{
  return self->_shouldShowInSmartDialog;
}

- (_SFPBAppEntityAnnotation)appEntityAnnotation
{
  return self->_appEntityAnnotation;
}

- (NSString)emphasisSubjectId
{
  return self->_emphasisSubjectId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emphasisSubjectId, 0);
  objc_storeStrong((id *)&self->_appEntityAnnotation, 0);
  objc_storeStrong((id *)&self->_referencedCommands, 0);
  objc_storeStrong((id *)&self->_punchoutPickerDismissText, 0);
  objc_storeStrong((id *)&self->_punchoutPickerTitle, 0);
  objc_storeStrong((id *)&self->_punchoutOptions, 0);
  objc_storeStrong((id *)&self->_trailingSwipeButtonItems, 0);
  objc_storeStrong((id *)&self->_leadingSwipeButtonItems, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_previewButtonItemsTitle, 0);
  objc_storeStrong((id *)&self->_cardSectionDetail, 0);
  objc_storeStrong((id *)&self->_previewButtonItems, 0);
  objc_storeStrong((id *)&self->_previewCommand, 0);
  objc_storeStrong((id *)&self->_command, 0);
  objc_storeStrong((id *)&self->_userReportRequest, 0);
  objc_storeStrong((id *)&self->_resultIdentifier, 0);
  objc_storeStrong((id *)&self->_cardSectionId, 0);
  objc_storeStrong((id *)&self->_parameterKeyPaths, 0);
  objc_storeStrong((id *)&self->_commands, 0);
  objc_storeStrong((id *)&self->_nextCard, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end
