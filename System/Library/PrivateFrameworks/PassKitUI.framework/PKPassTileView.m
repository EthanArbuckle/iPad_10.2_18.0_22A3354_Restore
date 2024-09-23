@implementation PKPassTileView

- (PKPassTileView)initWithCoder:(id)a3
{

  return 0;
}

- (PKPassTileView)init
{
  PKPassTileView *v2;
  PKPassTileView *v3;
  NSMutableArray *v4;
  NSMutableArray *snapshots;
  UIImageView *v6;
  UIImageView *icon;
  UILabel *Label;
  UILabel *title;
  UILabel *v10;
  UILabel *body;
  UILabel *v12;
  UILabel *footer;
  PKPassthroughView *v14;
  PKPassthroughView *contentView;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PKPassTileView;
  v2 = -[PKPassTileView initWithFrame:](&v17, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v3 = v2;
  if (v2)
  {
    -[UIView pkui_setMaskType:](v2, "pkui_setMaskType:", 3);
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    snapshots = v3->_snapshots;
    v3->_snapshots = v4;

    v6 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    icon = v3->_icon;
    v3->_icon = v6;

    Label = (UILabel *)CreateLabel();
    title = v3->_title;
    v3->_title = Label;

    v10 = (UILabel *)CreateLabel();
    body = v3->_body;
    v3->_body = v10;

    v12 = (UILabel *)CreateLabel();
    footer = v3->_footer;
    v3->_footer = v12;

    -[UIImageView setAlpha:](v3->_icon, "setAlpha:", 0.0);
    -[UILabel setAlpha:](v3->_title, "setAlpha:", 0.0);
    -[UILabel setAlpha:](v3->_body, "setAlpha:", 0.0);
    -[UIImageView setAlpha:](v3->_bodyImage, "setAlpha:", 0.0);
    -[UILabel setAlpha:](v3->_footer, "setAlpha:", 0.0);
    v14 = objc_alloc_init(PKPassthroughView);
    contentView = v3->_contentView;
    v3->_contentView = v14;

    -[PKPassthroughView setHitTestEnabled:](v3->_contentView, "setHitTestEnabled:", 0);
    -[PKPassthroughView addSubview:](v3->_contentView, "addSubview:", v3->_icon);
    -[PKPassthroughView addSubview:](v3->_contentView, "addSubview:", v3->_title);
    -[PKPassthroughView addSubview:](v3->_contentView, "addSubview:", v3->_body);
    -[PKPassthroughView addSubview:](v3->_contentView, "addSubview:", v3->_footer);
    -[PKPassTileView addSubview:](v3, "addSubview:", v3->_contentView);
    v3->_enabled = -[PKPassTileView isEnabled](v3, "isEnabled");
    v3->_selected = -[PKPassTileView isSelected](v3, "isSelected");
    v3->_highlighted = -[PKPassTileView isHighlighted](v3, "isHighlighted");
    -[PKPassTileView _updateSubviewsAnimated:]((uint64_t)v3, 0);
  }
  return v3;
}

- (void)_updateSubviewsAnimated:(uint64_t)a1
{
  void *v4;
  BOOL v5;
  uint64_t v6;
  void *v7;
  _BOOL4 isDynamic;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void **v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  int v37;
  double v38;
  double v39;
  double v40;
  double v41;
  __int128 v42;
  __int128 v43;
  double v44;
  void *v45;
  void *v46;
  BOOL v47;
  PKPassTileView_State *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id *v62;
  id *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  double v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  const __CFString *v72;
  void *v73;
  uint64_t v74;
  id v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  double v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  id v93;
  void *v94;
  unint64_t v95;
  void *v96;
  id v97;
  void *v98;
  double v99;
  double v100;
  void *v101;
  double v102;
  id v103;
  void *v104;
  void *v105;
  uint64_t v106;
  void *v107;
  void *v108;
  uint64_t (**v109)(void);
  void *v110;
  void *v111;
  id v112;
  void *v113;
  void *v114;
  void *v115;
  __CFString *v116;
  uint64_t v117;
  id v118;
  void *AttributedString;
  id v120;
  void *v121;
  id v122;
  uint64_t v123;
  id v124;
  void *v125;
  id v126;
  int64x2_t v127;
  int64x2_t v128;
  int16x8_t v129;
  id v130;
  void *v131;
  uint64_t v132;
  void *v133;
  void *v134;
  void *v135;
  uint64_t v136;
  id v137;
  void *v138;
  void *v139;
  void *v140;
  uint64_t v141;
  id v142;
  void *v143;
  NSObject *v144;
  void *v145;
  uint64_t v146;
  uint64_t v147;
  double v148;
  double v149;
  NSObject *v150;
  id v151;
  dispatch_source_t v152;
  void *v153;
  NSObject *v154;
  dispatch_time_t v155;
  NSObject *v156;
  void *v157;
  void **v158;
  void **v159;
  uint64_t v160;
  unint64_t v161;
  _QWORD *v162;
  _QWORD *v163;
  _QWORD *v164;
  _QWORD *v165;
  _QWORD *v166;
  _QWORD *v167;
  _QWORD *v168;
  _QWORD *v169;
  _QWORD *v170;
  _QWORD *v171;
  id v172;
  char v173;
  double v174;
  void *v175;
  id v176;
  char v177;
  void *v178;
  id v179;
  char v180;
  void *v181;
  id v182;
  char v183;
  __int128 v184;
  void *v185;
  id v186;
  char v187;
  void *v188;
  void *v189;
  id v190;
  char v191;
  __int128 v192;
  void *v193;
  char v194;
  __int128 v195;
  void *v196;
  char v197;
  __int128 v198;
  void *v199;
  char v200;
  __int128 v201;
  void *v202;
  id v203;
  char v204;
  void *v205;
  void *v206;
  char v207;
  void *v208;
  void *v209;
  _QWORD *v210;
  _QWORD *v211;
  void *v212;
  void *v213;
  void *v214;
  uint64_t v215;
  void *v216;
  id v217;
  void *v218;
  id v219;
  void *v220;
  uint64_t v221;
  uint64_t v222;
  void *v223;
  void *v224;
  int v225;
  void *v226;
  void *v227;
  uint64_t v228;
  void *v229;
  PKContinuousButton *v230;
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
  uint64_t v242;
  void *v243;
  id v244;
  void *v245;
  id v246;
  void *v247;
  uint64_t v248;
  void *v249;
  id v250;
  void *v251;
  id v252;
  void *v253;
  uint64_t v254;
  void *v255;
  uint64_t v256;
  void *v257;
  void *v258;
  void *v259;
  void (**v260)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v261;
  _BOOL8 v262;
  uint64_t v263;
  _BOOL8 v264;
  uint64_t v265;
  _BOOL8 v266;
  uint64_t v267;
  _BOOL8 v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  void *v272;
  void *v273;
  void *v274;
  int v275;
  void *v276;
  __CFString *v277;
  id v278;
  id v279;
  id v280;
  uint64_t v281;
  void *v282;
  void *v283;
  id v284;
  id v285;
  id v286;
  id v287;
  id v288;
  void *v289;
  _QWORD *v290;
  void *v291;
  void *v292;
  void *v293;
  _QWORD *v294;
  id v295;
  _QWORD *v296;
  void *v297;
  _QWORD *v298;
  id v299;
  _QWORD *v300;
  int v301;
  id obj;
  _QWORD *obja;
  _QWORD aBlock[5];
  char v305;
  uint64_t v306;
  int64x2_t v307;
  int64x2_t v308;
  objc_super v309;
  __int128 v310;
  __int128 v311;
  __int128 v312;
  __int128 v313;
  uint64_t v314;
  _QWORD handler[4];
  id v316;
  objc_super v317;
  __int128 v318;
  __int128 v319;
  __int128 v320;

  if (!a1)
    return;
  if (*(_BYTE *)(a1 + 1065))
  {
    *(_BYTE *)(a1 + 1066) = 1;
    return;
  }
  if (a2)
    objc_msgSend((id)a1, "layoutIfNeededAnimated:", 1);
  objc_msgSend(*(id *)(a1 + 1088), "metadata");
  v292 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(a1 + 979) = objc_msgSend(v292, "isSelectable");
  objc_msgSend(*(id *)(a1 + 920), "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v291 = v4;
  if (*(_QWORD *)(a1 + 1104))
  {
    v5 = 1;
  }
  else if (v4)
  {
    v5 = objc_msgSend(v4, "count") != 0;
  }
  else
  {
    v5 = 0;
  }
  *(_BYTE *)(a1 + 980) = v5;
  if (!*(_QWORD *)(a1 + 1056))
  {
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A88], (void *)*MEMORY[0x1E0DC48D0], 32770, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 1056);
    *(_QWORD *)(a1 + 1056) = v6;

  }
  isDynamic = -[PKPassTileView _isDynamicHeight](a1);
  v9 = *(_QWORD *)(a1 + 1096);
  v10 = *(void **)(a1 + 792);
  if (isDynamic)
  {
    objc_msgSend(v10, "setNumberOfLines:", 2);
    v11 = (void *)*MEMORY[0x1E0DC4B10];
    v12 = (void *)*MEMORY[0x1E0DC48D0];
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B10], (void *)*MEMORY[0x1E0DC48D0], 32770, 0, *MEMORY[0x1E0DC1448]);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(void **)(a1 + 1008);
    *(_QWORD *)(a1 + 1008) = v13;

    if (v9 == 1)
      v15 = (void *)*MEMORY[0x1E0DC4AA0];
    else
      v15 = v11;
    if (v9 == 1)
      v16 = 16.0;
    else
      v16 = 34.0;
    PKFontForDefaultDesign(v15, v12, 0x8000, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(void **)(a1 + 1016);
    *(_QWORD *)(a1 + 1016) = v17;

    objc_msgSend(*(id *)(a1 + 1008), "fontWithSize:", PKScaledValueForValueWithMaximumContentSizeCategory((void *)*MEMORY[0x1E0DC48B8], v16));
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = *(void **)(a1 + 1024);
    *(_QWORD *)(a1 + 1024) = v19;
  }
  else
  {
    objc_msgSend(v10, "setNumberOfLines:", 1);
    v21 = (void *)*MEMORY[0x1E0DC13A8];
    v22 = (void *)*MEMORY[0x1E0DC48D0];
    if (*(_BYTE *)(a1 + 979))
    {
      PKFontForDesign(v21, (void *)*MEMORY[0x1E0DC4B60], (void *)*MEMORY[0x1E0DC48D0], 4098, 0);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = *(void **)(a1 + 1008);
      *(_QWORD *)(a1 + 1008) = v23;

      v25 = (void **)MEMORY[0x1E0DC4B10];
    }
    else
    {
      PKFontForDesign(v21, (void *)*MEMORY[0x1E0DC4B50], (void *)*MEMORY[0x1E0DC48D0], 32770, 0, *MEMORY[0x1E0DC1448]);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = *(void **)(a1 + 1008);
      *(_QWORD *)(a1 + 1008) = v26;

      v25 = (void **)MEMORY[0x1E0DC4A88];
    }
    PKFontForDefaultDesign(*v25, v22, 0x8000, 0);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = *(void **)(a1 + 1016);
    *(_QWORD *)(a1 + 1016) = v28;

    v30 = *(id *)(a1 + 1008);
    v20 = *(void **)(a1 + 1024);
    *(_QWORD *)(a1 + 1024) = v30;
  }

  if (*(_BYTE *)(a1 + 979))
    v31 = 1;
  else
    v31 = isDynamic;
  if (v31)
    v32 = 35;
  else
    v32 = 36;
  if (v31)
    v33 = 36;
  else
    v33 = 35;
  objc_storeStrong((id *)(a1 + 1032), *(id *)(a1 + OBJC_IVAR___PKPassTileView__snapshots[v32]));
  objc_storeStrong((id *)(a1 + 1040), *(id *)(a1 + OBJC_IVAR___PKPassTileView__snapshots[v33]));
  objc_storeStrong((id *)(a1 + 1048), *(id *)(a1 + 1016));
  *(_OWORD *)(a1 + 984) = *MEMORY[0x1E0C9D820];
  objc_msgSend(*(id *)(a1 + 1016), "_bodyLeading");
  v301 = a2;
  if (v9 == 1)
  {
    v34 = 9.0;
    v35 = 10.0;
  }
  else
  {
    PKFloatRoundToPixel();
    v35 = v36 + 10.0;
    if (*(_BYTE *)(a1 + 979))
      PKFloatRoundToPixel();
    v34 = v36 + 10.0;
  }
  v37 = *(unsigned __int8 *)(a1 + 979);
  v38 = 0.0;
  v39 = 18.0;
  if (isDynamic)
    v38 = 2.0;
  else
    v39 = 0.0;
  if (v9 == 1)
    v40 = 4.0;
  else
    v40 = v39;
  if (*(_BYTE *)(a1 + 979))
    v41 = 16.0;
  else
    v41 = 13.0;
  v42 = *(_OWORD *)(a1 + 872);
  v317 = *(objc_super *)(a1 + 856);
  v318 = v42;
  v43 = *(_OWORD *)(a1 + 904);
  v319 = *(_OWORD *)(a1 + 888);
  v320 = v43;
  if (v37)
    v44 = -2.0;
  else
    v44 = v38;
  objc_msgSend(*(id *)(a1 + 840), "image");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 848), "image");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = *(_QWORD *)(a1 + 952) != 0;
  *(double *)(a1 + 856) = v35;
  *(double *)(a1 + 864) = v41;
  *(double *)(a1 + 872) = v34;
  *(double *)(a1 + 880) = v41;
  *(double *)(a1 + 888) = v40;
  *(double *)(a1 + 896) = v41;
  *(double *)(a1 + 904) = v44;
  *(_BYTE *)(a1 + 912) = v37;
  *(_BYTE *)(a1 + 913) = 0;
  *(_BYTE *)(a1 + 914) = v45 != 0;
  *(_BYTE *)(a1 + 915) = v46 != 0;
  *(_BYTE *)(a1 + 916) = v47;

  v295 = *(id *)(a1 + 928);
  v48 = [PKPassTileView_State alloc];
  v49 = *(void **)(a1 + 1088);
  v50 = *(void **)(a1 + 920);
  objc_msgSend(*(id *)(a1 + 936), "passState");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = *(void **)(a1 + 1032);
  v53 = *(void **)(a1 + 1040);
  v54 = *(void **)(a1 + 1048);
  v55 = *(void **)(a1 + 1024);
  v275 = *(unsigned __int8 *)(a1 + 1081);
  v281 = *(_QWORD *)(a1 + 1104);
  v56 = v49;
  v57 = v50;
  v299 = v51;
  v58 = v52;
  v59 = v53;
  v60 = v54;
  v61 = v55;
  if (v48)
  {
    v309.receiver = v48;
    v309.super_class = (Class)PKPassTileView_State;
    v62 = (id *)objc_msgSendSuper2(&v309, sel_init);
    v63 = v62;
    if (v62)
    {
      v297 = v61;
      v289 = v60;
      v293 = v59;
      objc_storeStrong(v62 + 1, v49);
      v278 = v56;
      objc_msgSend(v56, "metadata");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "preferredStyle");

      v65 = objc_msgSend(v57, "type");
      v66 = 0;
      v67 = NAN;
      v279 = v57;
      v280 = v58;
      v68 = 0;
      v69 = 0;
      v70 = 0;
      v282 = 0;
      obj = 0;
      v71 = 0;
      v72 = 0;
      switch(v65)
      {
        case 0:
          objc_msgSend(v57, "stateTypeDefault");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "icon");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "title");
          v74 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "body");
          v284 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "accessory");
          v282 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "secondaryAccessory");
          obj = (id)objc_claimAutoreleasedReturnValue();
          v67 = NAN;
          goto LABEL_83;
        case 1:
          v75 = v58;
          objc_msgSend(v57, "stateTypeDefaultV2");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "icon");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "accessory");
          v77 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "secondaryAccessory");
          obj = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "title");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "displayableStringWithPassState:inContext:", v299, 0);
          v285 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v76, "body");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "displayableStringWithPassState:inContext:", v299, 1);
          v69 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v76, "bodyImage");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "footer");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "displayableStringWithPassState:inContext:", v299, 2);
          v81 = objc_claimAutoreleasedReturnValue();

          v82 = objc_msgSend(v76, "preferredStyle");
          v71 = 0;
          v282 = (void *)v77;
          if (v81)
          {
            v72 = (const __CFString *)v81;
            v67 = NAN;
            v58 = v75;
          }
          else
          {
            v58 = v75;
LABEL_72:
            if ((v82 & 0xFFFFFFFFFFFFFFFELL) == 2)
              v72 = &stru_1E3E7D690;
            else
              v72 = 0;
            v67 = NAN;
          }
          v68 = v285;
          goto LABEL_84;
        case 2:
          objc_msgSend(v57, "stateTypeCheckIn");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "secondaryAccessory");
          obj = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "availableFrom");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "date");
          v85 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v85, "timeIntervalSinceDate:", v83);
          if (!v85 || v86 <= 0.0)
          {
            PKLocalizedPaymentString(CFSTR("PASS_TILE_CHECKIN_NOW_TITLE"));
            v74 = objc_claimAutoreleasedReturnValue();
            PKLocalizedPaymentString(CFSTR("PASS_TILE_CHECKIN_NOW_BODY"));
            v284 = (id)objc_claimAutoreleasedReturnValue();
            v110 = (void *)MEMORY[0x1E0D66F58];
            PKLocalizedPaymentString(CFSTR("PASS_TILE_CHECKIN_NOW_BUTTON_TITLE"));
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v110, "createWithTitle:spinnerEnabled:", v111, 0);
            v282 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = NAN;
            goto LABEL_82;
          }
          v276 = v83;
          v273 = v73;
          objc_msgSend(v73, "availableFrom");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "timeZone");
          v88 = (void *)objc_claimAutoreleasedReturnValue();

          v286 = (id)objc_msgSend(v88, "secondsFromGMT");
          objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          v271 = objc_msgSend(v89, "secondsFromGMT");

          objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "setTimeZone:", v88);
          objc_msgSend(v90, "components:fromDate:", 30, v85);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "dateFromComponents:", v91);
          v92 = objc_claimAutoreleasedReturnValue();

          v93 = objc_alloc_init(MEMORY[0x1E0C99D78]);
          objc_msgSend(v93, "setDay:", -1);
          objc_msgSend(v90, "dateByAddingComponents:toDate:options:", v93, v92, 0);
          v283 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "weekdaySymbols");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          v95 = objc_msgSend(v94, "count");

          v96 = 0;
          if (v95 >= 2)
          {
            objc_msgSend(v93, "setDay:", -(uint64_t)v95);
            objc_msgSend(v90, "dateByAddingComponents:toDate:options:", v93, v92, 0);
            v96 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v274 = (void *)v92;
          v269 = PKLocalizedHourOfDate();
          v97 = objc_alloc_init(MEMORY[0x1E0CB3578]);
          objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "setLocale:", v98);

          objc_msgSend(v97, "setLocalizedDateFormatFromTemplate:", CFSTR("j:mm a"));
          objc_msgSend(v97, "setTimeZone:", v88);
          objc_msgSend(v97, "stringFromDate:", v85);
          v270 = objc_claimAutoreleasedReturnValue();

          v272 = v88;
          if (v286 != (id)v271)
            goto LABEL_65;
          v83 = v276;
          objc_msgSend(v276, "timeIntervalSinceDate:", v92);
          if (v99 >= 0.0)
          {
            PKLocalizedPaymentString(CFSTR("PASS_TILE_CHECKIN_TODAY_TITLE"));
            v74 = objc_claimAutoreleasedReturnValue();
            v107 = (void *)v270;
            PKLocalizedPaymentString(CFSTR("PASS_TILE_CHECKIN_TODAY_BODY"), CFSTR("%lu%@"), v269, v270);
            v284 = (id)objc_claimAutoreleasedReturnValue();
            v67 = MEMORY[0x1A1AE33F0](v85);
LABEL_80:
            v115 = v274;
            goto LABEL_81;
          }
          objc_msgSend(v276, "timeIntervalSinceDate:", v283);
          if (v100 < 0.0)
          {
LABEL_65:
            v101 = v283;
            if (v96 && (objc_msgSend(v276, "timeIntervalSinceDate:", v96), v101 = v96, v102 >= 0.0))
            {
              v112 = objc_alloc_init(MEMORY[0x1E0CB3578]);
              objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
              v113 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v112, "setLocale:", v113);

              objc_msgSend(v112, "setLocalizedDateFormatFromTemplate:", CFSTR("cccc"));
              objc_msgSend(v112, "setTimeZone:", v88);
              objc_msgSend(v112, "stringFromDate:", v85);
              v114 = (void *)objc_claimAutoreleasedReturnValue();
              PKLocalizedPaymentString(CFSTR("PASS_TILE_CHECKIN_WEEK_TITLE"));
              v74 = objc_claimAutoreleasedReturnValue();
              v107 = (void *)v270;
              PKLocalizedPaymentString(CFSTR("PASS_TILE_CHECKIN_WEEK_BODY"), CFSTR("%lu%@%@"), v269, v114, v270);
              v284 = (id)objc_claimAutoreleasedReturnValue();
              v67 = MEMORY[0x1A1AE33F0](v283);

            }
            else
            {
              v103 = objc_alloc_init(MEMORY[0x1E0CB3578]);
              objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
              v104 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v103, "setLocale:", v104);

              objc_msgSend(v103, "setLocalizedDateFormatFromTemplate:", CFSTR("MMM d"));
              objc_msgSend(v103, "setTimeZone:", v88);
              objc_msgSend(v103, "stringFromDate:", v85);
              v105 = (void *)objc_claimAutoreleasedReturnValue();
              PKLocalizedPaymentString(CFSTR("PASS_TILE_CHECKIN_DISTANT_TITLE"));
              v106 = objc_claimAutoreleasedReturnValue();
              v107 = (void *)v270;
              PKLocalizedPaymentString(CFSTR("PASS_TILE_CHECKIN_DISTANT_BODY"), CFSTR("%lu%@%@"), v269, v105, v270);
              v284 = (id)objc_claimAutoreleasedReturnValue();
              v67 = MEMORY[0x1A1AE33F0](v101);

              v74 = v106;
            }
            v83 = v276;
            goto LABEL_80;
          }
          PKLocalizedPaymentString(CFSTR("PASS_TILE_CHECKIN_TOMORROW_TITLE"));
          v74 = objc_claimAutoreleasedReturnValue();
          v107 = (void *)v270;
          PKLocalizedPaymentString(CFSTR("PASS_TILE_CHECKIN_TOMORROW_BODY"), CFSTR("%lu%@"), v269, v270);
          v284 = (id)objc_claimAutoreleasedReturnValue();
          v115 = (void *)v92;
          v67 = MEMORY[0x1A1AE33F0](v92);
          v83 = v276;
LABEL_81:

          v282 = 0;
          v58 = v280;
          v111 = v272;
          v73 = v273;
LABEL_82:

          v66 = 0;
LABEL_83:

          v70 = 0;
          v71 = 0;
          v72 = 0;
          v68 = (void *)v74;
          v69 = v284;
LABEL_84:
          v116 = (__CFString *)v72;
          objc_storeStrong(v63 + 4, v66);
          PKPassTileImageToUIImage(v66, v297);
          v117 = objc_claimAutoreleasedReturnValue();
          v118 = v63[5];
          v63[5] = (id)v117;

          v287 = v68;
          AttributedString = CreateAttributedString(v68, v58);
          v120 = v63[10];
          v63[10] = AttributedString;

          v121 = CreateAttributedString(v69, v293);
          v122 = v63[11];
          v63[11] = v121;

          objc_storeStrong(v63 + 12, v70);
          PKPassTileImageToUIImage(v70, v293);
          v123 = objc_claimAutoreleasedReturnValue();
          v124 = v63[13];
          v63[13] = (id)v123;

          v277 = v116;
          v125 = CreateAttributedString(v116, v289);
          v126 = v63[14];
          v63[14] = v125;

          objc_storeStrong(v63 + 15, v71);
          v127.i64[0] = (uint64_t)v63[5];
          v127.i64[1] = (uint64_t)v63[10];
          v128.i64[0] = (uint64_t)v63[11];
          v128.i64[1] = (uint64_t)v63[13];
          *((double *)v63 + 16) = v67;
          v129 = (int16x8_t)vuzp1q_s32((int32x4_t)vtstq_s64(v127, v127), (int32x4_t)vtstq_s64(v128, v128));
          *(int8x8_t *)v129.i8 = vand_s8((int8x8_t)vmovn_s32((int32x4_t)v129), (int8x8_t)0x1000100010001);
          *((_DWORD *)v63 + 4) = vmovn_s16(v129).u32[0];
          v130 = v63[15];
          *((_BYTE *)v63 + 20) = v63[14] != 0;
          *((_BYTE *)v63 + 25) = v130 != 0;
          if (v281 == 2)
          {
            v131 = (void *)objc_msgSend(MEMORY[0x1E0D66F60], "createDefaultDisclosureAccessoryImage");

          }
          else
          {
            v131 = v282;
          }
          v57 = v279;
          v58 = v280;
          v61 = v297;
          if (v131)
          {
            v132 = objc_msgSend(v131, "type");
            if (v132)
            {
              if (v132 == 2)
              {
                objc_storeStrong(v63 + 6, v131);
                PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4AB8], (void *)*MEMORY[0x1E0DC48D0], 2, 0);
                v138 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v131, "accessoryTypeImage");
                v139 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v139, "image");
                v140 = (void *)objc_claimAutoreleasedReturnValue();
                PKPassTileImageToUIImage(v140, v138);
                v141 = objc_claimAutoreleasedReturnValue();
                v142 = v63[7];
                v63[7] = (id)v141;

                v61 = v297;
                v58 = v280;
                *((_BYTE *)v63 + 23) = 1;

                v57 = v279;
              }
              else if (v132 == 1)
              {
                objc_storeStrong(v63 + 6, v131);
                *((_BYTE *)v63 + 21) = 1;
              }
            }
            else if (!v275)
            {
              objc_storeStrong(v63 + 6, v131);
              *((_BYTE *)v63 + 22) = 1;
            }
          }
          else if (obj && objc_msgSend(obj, "type") == 2)
          {
            objc_storeStrong(v63 + 8, obj);
            PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4AB8], (void *)*MEMORY[0x1E0DC48D0], 0, 0);
            v133 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(obj, "accessoryTypeImage");
            v134 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v134, "image");
            v135 = (void *)objc_claimAutoreleasedReturnValue();
            PKPassTileImageToUIImage(v135, v133);
            v136 = objc_claimAutoreleasedReturnValue();
            v137 = v63[9];
            v63[9] = (id)v136;

            v61 = v297;
            v57 = v279;
            *((_BYTE *)v63 + 24) = 1;

            v58 = v280;
          }
          if (v71)
            *((_BYTE *)v63 + 25) = 1;

          v56 = v278;
          v59 = v293;
          v60 = v289;
          break;
        case 3:
          goto LABEL_84;
        case 4:
          objc_msgSend(v57, "stateTypeHostedView");
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v108, "hostedViewProvider");
          v109 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
          v71 = (void *)v109[2]();

          v82 = objc_msgSend(v108, "preferredStyle");
          v66 = 0;
          v282 = 0;
          v285 = 0;
          v69 = 0;
          v70 = 0;
          obj = 0;
          goto LABEL_72;
        default:
          v68 = 0;
          v69 = 0;
          v70 = 0;
          v282 = 0;
          obj = 0;
          v71 = 0;
          v72 = 0;
          goto LABEL_84;
      }
    }
  }
  else
  {
    v63 = 0;
  }

  v143 = *(void **)(a1 + 928);
  *(_QWORD *)(a1 + 928) = v63;

  v144 = *(NSObject **)(a1 + 968);
  if (v144)
  {
    dispatch_source_cancel(v144);
    v145 = *(void **)(a1 + 968);
    *(_QWORD *)(a1 + 968) = 0;

  }
  v146 = *(_QWORD *)(a1 + 928);
  v147 = MEMORY[0x1E0C809B0];
  if (v146)
    v148 = *(double *)(v146 + 128);
  else
    v148 = 0.0;
  v149 = fmax(v148 - CFAbsoluteTimeGetCurrent(), 1.0);
  v150 = MEMORY[0x1E0C80D38];
  v151 = MEMORY[0x1E0C80D38];
  v152 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v150);
  v153 = *(void **)(a1 + 968);
  *(_QWORD *)(a1 + 968) = v152;

  v154 = *(NSObject **)(a1 + 968);
  v155 = dispatch_walltime(0, (uint64_t)(v149 * 1000000000.0));
  dispatch_source_set_timer(v154, v155, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  objc_initWeak(&v309.receiver, (id)a1);
  v156 = *(NSObject **)(a1 + 968);
  handler[0] = v147;
  handler[1] = 3221225472;
  handler[2] = __42__PKPassTileView__updateSubviewsAnimated___block_invoke;
  handler[3] = &unk_1E3E61310;
  objc_copyWeak(&v316, &v309.receiver);
  dispatch_source_set_event_handler(v156, handler);
  dispatch_resume(*(dispatch_object_t *)(a1 + 968));
  objc_destroyWeak(&v316);
  objc_destroyWeak(&v309.receiver);
  v157 = *(void **)(a1 + 928);
  v158 = (void **)v295;
  v159 = v157;
  v160 = objc_opt_self();
  if (v158 == v159)
  {
    v161 = 2;
  }
  else if ((v158 != 0) != (v159 != 0))
  {
    v161 = 0;
  }
  else
  {
    v161 = +[PKPassTileView_State visuallyCompareTile:toTile:](v160, v158[1], v159[1]);
  }

  v162 = *(_QWORD **)(a1 + 928);
  if (v162)
    v162 = (_QWORD *)v162[4];
  v294 = v162;
  v163 = *(_QWORD **)(a1 + 928);
  if (v163)
    v163 = (_QWORD *)v163[10];
  v300 = v163;
  v164 = *(_QWORD **)(a1 + 928);
  if (v164)
    v164 = (_QWORD *)v164[11];
  v298 = v164;
  v165 = *(_QWORD **)(a1 + 928);
  if (v165)
    v165 = (_QWORD *)v165[12];
  obja = v165;
  v166 = *(_QWORD **)(a1 + 928);
  if (v166)
    v166 = (_QWORD *)v166[14];
  v296 = v166;
  v167 = *(_QWORD **)(a1 + 928);
  if (v167)
    v167 = (_QWORD *)v167[6];
  v168 = v167;
  v169 = *(_QWORD **)(a1 + 928);
  if (v169)
    v169 = (_QWORD *)v169[8];
  v290 = v169;
  v170 = *(_QWORD **)(a1 + 928);
  if (v170)
    v170 = (_QWORD *)v170[15];
  v288 = v170;
  v171 = v170;
  v313 = *(_OWORD *)(a1 + 760);
  v314 = *(_QWORD *)(a1 + 776);
  if (v301)
  {
    if (!v158)
    {
      v174 = 0.0;
      if (!v161)
        goto LABEL_188;
      v189 = 0;
      goto LABEL_161;
    }
    if (*((_BYTE *)v158 + 16) && v161)
    {
      v172 = v158[4];
      v173 = PKEqualObjects();

      v174 = 0.0;
      if ((v173 & 1) != 0)
      {
LABEL_135:
        if (*((_BYTE *)v158 + 17) && v161)
        {
          v176 = v158[10];
          v177 = PKEqualObjects();

          if ((v177 & 1) != 0)
            goto LABEL_141;
        }
        else if (!*((_BYTE *)v158 + 17))
        {
LABEL_141:
          if (*((_BYTE *)v158 + 18) && v161 > 1)
          {
            v179 = v158[11];
            v180 = PKEqualObjects();

            if ((v180 & 1) != 0)
              goto LABEL_147;
          }
          else if (!*((_BYTE *)v158 + 18))
          {
LABEL_147:
            if (*((_BYTE *)v158 + 19) && v161)
            {
              v182 = v158[12];
              v183 = PKEqualObjects();

              if ((v183 & 1) != 0)
                goto LABEL_153;
            }
            else if (!*((_BYTE *)v158 + 19))
            {
LABEL_153:
              if (*((_BYTE *)v158 + 20) && v161)
              {
                v186 = v158[14];
                v187 = PKEqualObjects();

                if ((v187 & 1) != 0)
                {
LABEL_160:
                  v189 = v158[6];
LABEL_161:
                  v190 = v189;
                  v191 = PKEqualObjects();

                  if (!v158)
                    goto LABEL_188;
LABEL_164:
                  if (*((_BYTE *)v158 + 21) && (v191 & 1) == 0)
                  {
                    v309 = v317;
                    v310 = v318;
                    v192 = v320;
                    v311 = v319;
                    *(_BYTE *)(a1 + 773) = 1;
                    v193 = *(void **)(a1 + 824);
                    v312 = v192;
                    v174 = fmax(-[PKPassTileView _prepareViewForReuse:type:state:](a1, v193, (void *)2, (__int128 *)&v309), v174);
                  }
                  if (*((_BYTE *)v158 + 22))
                    v194 = v191;
                  else
                    v194 = 1;
                  if ((v194 & 1) == 0)
                  {
                    v309 = v317;
                    v310 = v318;
                    v195 = v320;
                    v311 = v319;
                    *(_BYTE *)(a1 + 774) = 1;
                    v196 = *(void **)(a1 + 832);
                    v312 = v195;
                    v174 = fmax(-[PKPassTileView _prepareViewForReuse:type:state:](a1, v196, (void *)3, (__int128 *)&v309), v174);
                  }
                  if (*((_BYTE *)v158 + 23))
                    v197 = v191;
                  else
                    v197 = 1;
                  if ((v197 & 1) == 0)
                  {
                    v309 = v317;
                    v310 = v318;
                    v198 = v320;
                    v311 = v319;
                    *(_BYTE *)(a1 + 775) = 1;
                    v199 = *(void **)(a1 + 840);
                    v312 = v198;
                    v174 = fmax(-[PKPassTileView _prepareViewForReuse:type:state:](a1, v199, (void *)4, (__int128 *)&v309), v174);
                  }
                  if (*((_BYTE *)v158 + 24))
                    v200 = v191;
                  else
                    v200 = 1;
                  if ((v200 & 1) == 0)
                  {
                    v309 = v317;
                    v310 = v318;
                    v201 = v320;
                    v311 = v319;
                    *(_BYTE *)(a1 + 776) = 1;
                    v202 = *(void **)(a1 + 848);
                    v312 = v201;
                    v174 = fmax(-[PKPassTileView _prepareViewForReuse:type:state:](a1, v202, (void *)4, (__int128 *)&v309), v174);
                  }
                  if (*((_BYTE *)v158 + 25) && v161)
                  {
                    v203 = v158[15];
                    v204 = PKEqualObjects();

                    if ((v204 & 1) != 0)
                      goto LABEL_188;
                  }
                  else if (!*((_BYTE *)v158 + 25))
                  {
LABEL_188:
                    *(double *)(a1 + 760) = fmax(*(double *)(a1 + 760), v174 * 0.65);
                    goto LABEL_189;
                  }
                  *(_BYTE *)(a1 + 777) = 1;
                  v205 = *(void **)(a1 + 952);
                  v309 = v317;
                  v310 = v318;
                  v311 = v319;
                  v312 = v320;
                  v174 = fmax(-[PKPassTileView _prepareViewForReuse:type:state:](a1, v205, (void *)5, (__int128 *)&v309), v174);
                  goto LABEL_188;
                }
              }
              else if (!*((_BYTE *)v158 + 20))
              {
                goto LABEL_159;
              }
              *(_BYTE *)(a1 + 772) = 1;
              v188 = *(void **)(a1 + 816);
              v309 = v317;
              v310 = v318;
              v311 = v319;
              v312 = v320;
              v174 = fmax(-[PKPassTileView _prepareViewForReuse:type:state:](a1, v188, (void *)1, (__int128 *)&v309), v174);
LABEL_159:
              if (!v161)
              {
                v191 = 0;
                goto LABEL_164;
              }
              goto LABEL_160;
            }
            v309 = v317;
            v310 = v318;
            v184 = v320;
            v311 = v319;
            *(_BYTE *)(a1 + 768) = 1;
            v185 = *(void **)(a1 + 808);
            v312 = v184;
            v174 = fmax(-[PKPassTileView _prepareViewForReuse:type:state:](a1, v185, (void *)5, (__int128 *)&v309), v174);
            goto LABEL_153;
          }
          *(_BYTE *)(a1 + 770) = 1;
          v181 = *(void **)(a1 + 800);
          v309 = v317;
          v310 = v318;
          v311 = v319;
          v312 = v320;
          v174 = fmax(-[PKPassTileView _prepareViewForReuse:type:state:](a1, v181, (void *)1, (__int128 *)&v309), v174);
          goto LABEL_147;
        }
        *(_BYTE *)(a1 + 769) = 1;
        v178 = *(void **)(a1 + 792);
        v309 = v317;
        v310 = v318;
        v311 = v319;
        v312 = v320;
        v174 = fmax(-[PKPassTileView _prepareViewForReuse:type:state:](a1, v178, (void *)1, (__int128 *)&v309), v174);
        goto LABEL_141;
      }
    }
    else if (!*((_BYTE *)v158 + 16))
    {
      v174 = 0.0;
      goto LABEL_135;
    }
    *(_BYTE *)(a1 + 768) = 1;
    v175 = *(void **)(a1 + 784);
    v309 = v317;
    v310 = v318;
    v311 = v319;
    v312 = v320;
    v174 = fmax(-[PKPassTileView _prepareViewForReuse:type:state:](a1, v175, 0, (__int128 *)&v309), 0.0);
    goto LABEL_135;
  }
LABEL_189:
  v206 = *(void **)(a1 + 920);
  if (v206)
    v207 = objc_msgSend(v206, "isEnabled");
  else
    v207 = 1;
  *(_BYTE *)(a1 + 976) = v207;
  v208 = *(void **)(a1 + 920);
  if (v208)
    LOBYTE(v208) = objc_msgSend(v208, "isSelected");
  *(_BYTE *)(a1 + 977) = (_BYTE)v208;
  objc_msgSend((id)a1, "setEnabled:", *(unsigned __int8 *)(a1 + 976));
  objc_msgSend((id)a1, "setSelected:", *(unsigned __int8 *)(a1 + 977));
  v209 = *(void **)(a1 + 784);
  v210 = *(_QWORD **)(a1 + 928);
  if (v210)
    v210 = (_QWORD *)v210[5];
  v211 = v210;
  objc_msgSend(v209, "setImage:", v211);

  v212 = *(void **)(a1 + 792);
  if (v212)
    objc_msgSend(v212, "setAttributedText:", v300);
  v213 = *(void **)(a1 + 800);
  if (v213)
    objc_msgSend(v213, "setAttributedText:", v298);
  v214 = *(void **)(a1 + 816);
  if (v214)
    objc_msgSend(v214, "setAttributedText:", v296);
  if (obja && (v215 = *(_QWORD *)(a1 + 928)) != 0 && *(_BYTE *)(v215 + 19))
  {
    v216 = *(void **)(a1 + 808);
    if (v216)
      goto LABEL_207;
    v217 = objc_alloc_init(MEMORY[0x1E0DC3890]);
    v218 = *(void **)(a1 + 808);
    *(_QWORD *)(a1 + 808) = v217;

    *(_BYTE *)(a1 + 771) = 1;
    objc_msgSend(*(id *)(a1 + 808), "setAlpha:", 0.0);
    objc_msgSend(*(id *)(a1 + 752), "addSubview:", *(_QWORD *)(a1 + 808));
    v216 = *(void **)(a1 + 808);
    v215 = *(_QWORD *)(a1 + 928);
    if (v215)
LABEL_207:
      v215 = *(_QWORD *)(v215 + 104);
    v219 = (id)v215;
    objc_msgSend(v216, "setImage:", v219);

  }
  else
  {
    v220 = *(void **)(a1 + 808);
    if (v220)
      objc_msgSend(v220, "setImage:", 0);
  }
  if (v168 && (v221 = *(_QWORD *)(a1 + 928)) != 0 && *(_BYTE *)(v221 + 21))
  {
    if (!*(_QWORD *)(a1 + 824))
    {
      v222 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
      v223 = *(void **)(a1 + 824);
      *(_QWORD *)(a1 + 824) = v222;

      *(_BYTE *)(a1 + 773) = 1;
      objc_msgSend(*(id *)(a1 + 824), "setAlpha:", 0.0);
      objc_msgSend(*(id *)(a1 + 752), "addSubview:", *(_QWORD *)(a1 + 824));
    }
    objc_msgSend(v168, "accessoryTypeSpinner");
    v224 = (void *)objc_claimAutoreleasedReturnValue();
    v225 = objc_msgSend(v224, "isSpinnerEnabled");

    if (v225 != objc_msgSend(*(id *)(a1 + 824), "isAnimating"))
    {
      v226 = *(void **)(a1 + 824);
      if (v225)
        objc_msgSend(v226, "startAnimating");
      else
        objc_msgSend(v226, "stopAnimating");
    }
  }
  else
  {
    v227 = *(void **)(a1 + 824);
    if (v227)
      objc_msgSend(v227, "stopAnimating");
    if (!v168)
    {
LABEL_229:
      v241 = *(void **)(a1 + 832);
      if (v241)
      {
        objc_msgSend(v241, "setTitle:forState:", 0, 0);
        objc_msgSend(*(id *)(a1 + 832), "setShowSpinner:", 0);
      }
      v240 = v290;
      if (!v168)
        goto LABEL_238;
      goto LABEL_232;
    }
  }
  v228 = *(_QWORD *)(a1 + 928);
  if (!v228 || !*(_BYTE *)(v228 + 22))
    goto LABEL_229;
  v229 = *(void **)(a1 + 832);
  if (!v229)
  {
    v306 = 0;
    v307 = vdupq_n_s64(2uLL);
    v308 = v307;
    v230 = -[PKContinuousButton initWithConfiguration:]([PKContinuousButton alloc], "initWithConfiguration:", &v306);
    v231 = *(void **)(a1 + 832);
    *(_QWORD *)(a1 + 832) = v230;

    objc_msgSend(*(id *)(a1 + 832), "setContentEdgeInsets:", 12.0, 16.0, 12.0, 16.0);
    v232 = *(void **)(a1 + 832);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v233 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v232, "setTintColor:", v233);

    v234 = *(void **)(a1 + 832);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
    v235 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v234, "updateTitleColorWithColor:", v235);

    *(_BYTE *)(a1 + 774) = 1;
    objc_msgSend(*(id *)(a1 + 832), "setAlpha:", 0.0);
    objc_msgSend(*(id *)(a1 + 752), "addSubview:", *(_QWORD *)(a1 + 832));
    v229 = *(void **)(a1 + 832);
  }
  objc_msgSend(v229, "titleLabel");
  v236 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v236, "setFont:", *(_QWORD *)(a1 + 1056));
  objc_msgSend(v168, "accessoryTypeButton");
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  v238 = *(void **)(a1 + 832);
  objc_msgSend(v237, "title");
  v239 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v238, "setTitle:forState:", v239, 0);

  objc_msgSend(*(id *)(a1 + 832), "setShowSpinner:", objc_msgSend(v237, "isSpinnerEnabled"));
  v240 = v290;
LABEL_232:
  v242 = *(_QWORD *)(a1 + 928);
  if (v242 && *(_BYTE *)(v242 + 23))
  {
    v243 = *(void **)(a1 + 840);
    if (v243)
      goto LABEL_236;
    v244 = objc_alloc_init(MEMORY[0x1E0DC3890]);
    v245 = *(void **)(a1 + 840);
    *(_QWORD *)(a1 + 840) = v244;

    *(_BYTE *)(a1 + 775) = 1;
    objc_msgSend(*(id *)(a1 + 840), "setAlpha:", 0.0);
    objc_msgSend(*(id *)(a1 + 752), "addSubview:", *(_QWORD *)(a1 + 840));
    v243 = *(void **)(a1 + 840);
    v242 = *(_QWORD *)(a1 + 928);
    if (v242)
LABEL_236:
      v242 = *(_QWORD *)(v242 + 56);
    v246 = (id)v242;
    objc_msgSend(v243, "setImage:", v246);

    goto LABEL_240;
  }
LABEL_238:
  v247 = *(void **)(a1 + 840);
  if (v247)
    objc_msgSend(v247, "setImage:", 0);
LABEL_240:
  if (v240 && (v248 = *(_QWORD *)(a1 + 928)) != 0 && *(_BYTE *)(v248 + 24))
  {
    v249 = *(void **)(a1 + 848);
    if (v249)
      goto LABEL_245;
    v250 = objc_alloc_init(MEMORY[0x1E0DC3890]);
    v251 = *(void **)(a1 + 848);
    *(_QWORD *)(a1 + 848) = v250;

    *(_BYTE *)(a1 + 776) = 1;
    objc_msgSend(*(id *)(a1 + 848), "setAlpha:", 0.0);
    objc_msgSend(*(id *)(a1 + 752), "addSubview:", *(_QWORD *)(a1 + 848));
    v249 = *(void **)(a1 + 848);
    v248 = *(_QWORD *)(a1 + 928);
    if (v248)
LABEL_245:
      v248 = *(_QWORD *)(v248 + 72);
    v252 = (id)v248;
    objc_msgSend(v249, "setImage:", v252);

  }
  else
  {
    v253 = *(void **)(a1 + 848);
    if (v253)
      objc_msgSend(v253, "setImage:", 0);
  }
  if (!v171 || (v254 = *(_QWORD *)(a1 + 928)) == 0 || !*(_BYTE *)(v254 + 25))
  {
    objc_msgSend(*(id *)(a1 + 952), "removeFromSuperview");
    v258 = *(void **)(a1 + 952);
    *(_QWORD *)(a1 + 952) = 0;

    v257 = *(void **)(a1 + 752);
    v256 = 0;
    goto LABEL_255;
  }
  if ((objc_msgSend(*(id *)(a1 + 952), "isEqual:", v171) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 952), "removeFromSuperview");
    *(_BYTE *)(a1 + 777) = 1;
    objc_msgSend(*(id *)(a1 + 952), "setAlpha:", 0.0);
    objc_storeStrong((id *)(a1 + 952), v288);
    objc_msgSend(*(id *)(a1 + 752), "addSubview:", *(_QWORD *)(a1 + 952));
    v255 = *(void **)(a1 + 752);
    v256 = objc_msgSend(*(id *)(a1 + 952), "isUserInteractionEnabled");
    v257 = v255;
LABEL_255:
    objc_msgSend(v257, "setHitTestEnabled:", v256);
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__PKPassTileView__updateSubviewsAnimated___block_invoke_3;
  aBlock[3] = &unk_1E3E62E48;
  v305 = v301;
  aBlock[4] = a1;
  v259 = _Block_copy(aBlock);
  v260 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v259;
  v261 = *(_QWORD *)(a1 + 928);
  if (v261)
    v262 = *(unsigned __int8 *)(v261 + 17) != 0;
  else
    v262 = 0;
  (*((void (**)(void *, _QWORD, _BOOL8, _QWORD))v259 + 2))(v259, *(_QWORD *)(a1 + 792), v262, *(unsigned __int8 *)(a1 + 769));
  v263 = *(_QWORD *)(a1 + 928);
  if (v263)
    v264 = *(unsigned __int8 *)(v263 + 18) != 0;
  else
    v264 = 0;
  v260[2](v260, *(_QWORD *)(a1 + 800), v264, *(unsigned __int8 *)(a1 + 770));
  v265 = *(_QWORD *)(a1 + 928);
  if (v265)
    v266 = *(unsigned __int8 *)(v265 + 20) != 0;
  else
    v266 = 0;
  v260[2](v260, *(_QWORD *)(a1 + 816), v266, *(unsigned __int8 *)(a1 + 772));
  v267 = *(_QWORD *)(a1 + 928);
  if (v267)
    v268 = *(unsigned __int8 *)(v267 + 25) != 0;
  else
    v268 = 0;
  v260[2](v260, *(_QWORD *)(a1 + 952), v268, *(unsigned __int8 *)(a1 + 777));
  -[PKPassTileView _updateStyleAnimated:](a1, v301);
  -[PKPassTileView _updateBackgroundAnimated:]((_BYTE *)a1, v301);
  objc_msgSend((id)a1, "setNeedsLayout");
  objc_msgSend((id)a1, "layoutIfNeeded");
  *(_OWORD *)(a1 + 760) = v313;
  *(_QWORD *)(a1 + 776) = v314;

}

- (void)dealloc
{
  NSObject *effectiveContentTimeout;
  NSObject *actionStateTimeout;
  objc_super v5;

  -[PKPassView removePassViewObserver:](self->_passView, "removePassViewObserver:", self);
  effectiveContentTimeout = self->_effectiveContentTimeout;
  if (effectiveContentTimeout)
    dispatch_source_cancel(effectiveContentTimeout);
  actionStateTimeout = self->_actionStateTimeout;
  if (actionStateTimeout)
    dispatch_source_cancel(actionStateTimeout);
  v5.receiver = self;
  v5.super_class = (Class)PKPassTileView;
  -[PKPassTileView dealloc](&v5, sel_dealloc);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPassTileView;
  -[PKPassTileView layoutSubviews](&v7, sel_layoutSubviews);
  -[PKPassTileView bounds](self, "bounds");
  -[PKPassTileView _layoutWithBounds:applyLayout:]((uint64_t)self, 1, v3, v4, v5, v6);
}

- (double)_layoutWithBounds:(double)a3 applyLayout:(double)a4
{
  int v10;
  int v11;
  _BOOL4 isDynamic;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRectEdge v24;
  CGRect *v25;
  CGSize size;
  CGSize *v27;
  CGPoint v28;
  CGSize v29;
  double height;
  double width;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  unint64_t v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  unint64_t v52;
  unint64_t v53;
  void *v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  double v60;
  double v61;
  void *v62;
  void *v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  _BOOL8 v71;
  double v72;
  CGFloat v73;
  CGFloat v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  BOOL v83;
  _BOOL8 v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  BOOL v93;
  _BOOL8 v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  _BOOL8 v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  BOOL v113;
  _BOOL8 v114;
  _BOOL4 IsNull;
  CGRect *v116;
  double v117;
  double v118;
  uint64_t v119;
  uint64_t v120;
  double v121;
  __n128 v122;
  __n128 v123;
  double v124;
  double v125;
  void *v126;
  void *v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  void *v136;
  _BOOL8 v137;
  uint64_t v138;
  double v139;
  double v140;
  void *v141;
  void *v142;
  double v143;
  double v144;
  double v145;
  double v146;
  uint64_t v147;
  id v148;
  uint64_t v149;
  uint64_t v150;
  double *v151;
  uint64_t v152;
  CGFloat v153;
  uint64_t v154;
  int v155;
  double *v156;
  double *v157;
  double *v158;
  double *v159;
  double *v160;
  double *v161;
  double *v162;
  uint64_t v163;
  uint64_t v164;
  double v165;
  double v166;
  double v167;
  double v168;
  id v169;
  double v170;
  double v171;
  double v172;
  double v173;
  double v174;
  double v175;
  double v176;
  double v177;
  double v178;
  double v179;
  double v180;
  uint64_t v181;
  double r2;
  void *v184;
  double v185;
  double v186;
  unint64_t v187;
  double v188;
  double v189;
  unint64_t v190;
  unint64_t v191;
  double v192;
  double v193;
  double v194;
  double v195;
  double v196;
  double v197;
  double v198;
  double v199;
  double v200;
  double r1;
  double r1a;
  void (**r1b)(double, double);
  double r1_8;
  double r1_24;
  double r1_24a;
  double v209;
  uint64_t v210;
  double v211;
  double v212;
  double v213;
  double v214;
  CGFloat rect;
  CGFloat x;
  CGFloat y;
  uint64_t v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  _QWORD aBlock[12];
  BOOL v224;
  CGRect slice;
  uint64_t v226;
  CGRect *v227;
  uint64_t v228;
  void *v229;
  __int128 v230;
  __int128 v231;
  uint64_t v232;
  CGRect *v233;
  uint64_t v234;
  void *v235;
  double v236;
  double v237;
  double v238;
  double v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  uint64_t v243;
  _BYTE v244[128];
  uint64_t v245;
  CGRect v246;
  CGRect v247;
  CGRect v248;
  CGRect v249;
  CGRect v250;
  CGRect v251;
  CGRect v252;
  CGRect v253;
  CGRect v254;
  CGRect v255;
  CGRect v256;
  CGRect v257;
  CGRect v258;
  CGRect v259;
  CGRect v260;

  v245 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0.0;
  v10 = objc_msgSend((id)a1, "_shouldReverseLayoutDirection");
  v11 = objc_msgSend(*(id *)(a1 + 920), "isFullBleed");
  isDynamic = -[PKPassTileView _isDynamicHeight](a1);
  v13 = *(_QWORD *)(a1 + 1096);
  if (v10)
    v14 = 2;
  else
    v14 = 0x200000000;
  objc_msgSend(*(id *)(a1 + 784), "alpha");
  v16 = v15;
  v218 = a1;
  v17 = *(double *)(a1 + 856);
  v18 = *(double *)(a1 + 864);
  v19 = v18 + *(double *)(a1 + 880);
  r1_8 = a5;
  v20 = a6 - (v17 + *(double *)(a1 + 872));
  v21 = *MEMORY[0x1E0C9D538];
  v22 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v232 = 0;
  v233 = (CGRect *)&v232;
  v234 = 0x4010000000;
  v235 = &unk_19E0C78CE;
  v226 = 0;
  v227 = (CGRect *)&v226;
  v228 = 0x4010000000;
  v229 = &unk_19E0C78CE;
  v230 = 0u;
  v231 = 0u;
  v211 = v22;
  v212 = v21;
  v236 = v21;
  v237 = v22;
  v213 = v20;
  v214 = a5 - v19;
  v238 = a5 - v19;
  v239 = v20;
  if (v13 == 1)
    v23 = 24.0;
  else
    v23 = 28.0;
  if (v13 != 1 && isDynamic)
    v23 = PKScaledValueForValueWithMaximumContentSizeCategory((void *)*MEMORY[0x1E0DC48B8], 34.0);
  r1 = v16;
  r1_24 = v18;
  if (v16 <= 0.0)
  {
    v27 = (CGSize *)v227;
    v28 = (CGPoint)*MEMORY[0x1E0C9D648];
    v29 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    v227[1].origin = (CGPoint)*MEMORY[0x1E0C9D648];
    v27[3] = v29;
    slice.origin = v28;
    slice.size = v29;
    height = v213;
    width = v214;
    x = v212;
    y = v211;
  }
  else
  {
    if (isDynamic)
      v24 = CGRectMinYEdge;
    else
      v24 = v14;
    CGRectDivide(v233[1], v227 + 1, v233 + 1, v23, v24);
    v25 = v227;
    size = v227[1].size;
    slice.origin = v227[1].origin;
    slice.size = size;
    if (isDynamic)
    {
      if (v13 != 1)
      {
        CGRectDivide(v227[1], &slice, v227 + 1, v23, (CGRectEdge)v14);
        v25 = v227;
      }
      CGRectDivide(v233[1], v25 + 1, v233 + 1, *(CGFloat *)(a1 + 888), CGRectMinYEdge);
    }
    else
    {
      CGRectDivide(v233[1], v227 + 1, v233 + 1, *(CGFloat *)(a1 + 896), (CGRectEdge)v14);
    }
    width = v233[1].size.width;
    x = v233[1].origin.x;
    y = v233[1].origin.y;
    height = v233[1].size.height;
  }
  if (*(double *)(a1 + 984) == width && *(double *)(a1 + 992) == height)
  {
    objc_msgSend(*(id *)(a1 + 792), "frame");
    v199 = v35;
    v209 = v36;
    objc_msgSend(*(id *)(a1 + 800), "frame");
    v188 = v37;
    v191 = v38;
    objc_msgSend(*(id *)(a1 + 808), "frame");
    v187 = v39;
    v190 = v40;
    objc_msgSend(*(id *)(a1 + 816), "frame");
    v198 = v41;
    v43 = v42;
    objc_msgSend(*(id *)(a1 + 824), "frame");
    objc_msgSend(*(id *)(a1 + 832), "frame");
    objc_msgSend(*(id *)(a1 + 840), "frame");
    objc_msgSend(*(id *)(a1 + 848), "frame");
    objc_msgSend(*(id *)(a1 + 952), "frame");
    v189 = v44;
    v200 = v45;
  }
  else
  {
    *(double *)(a1 + 984) = width;
    *(double *)(a1 + 992) = height;
    objc_msgSend(*(id *)(a1 + 792), "text");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      if (isDynamic)
      {
        objc_msgSend(*(id *)(a1 + 792), "pkui_sizeThatFits:forceWordWrap:", 1, *(double *)(a1 + 984), *(double *)(a1 + 992));
        v209 = v34;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 1032), "_bodyLeading");
        v209 = v46;
      }
      v199 = width;
    }
    else
    {
      v199 = *MEMORY[0x1E0C9D820];
      v209 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    }

    objc_msgSend(*(id *)(a1 + 1040), "_bodyLeading");
    v191 = v47;
    objc_msgSend(*(id *)(a1 + 808), "image");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v48;
    if (v11)
      v50 = r1_8;
    else
      v50 = width;
    if (v11)
      v51 = a6;
    else
      v51 = height;
    if (v48)
    {
      v243 = 0;
      v241 = 0u;
      v242 = 0u;
      v240 = 0u;
      objc_msgSend(v48, "pkui_alignmentSizeThatFits:maximumScale:", v50, v51, 1.0);
      PKRectRoundToPixel();
      v187 = v52;
      v190 = v53;
    }
    else
    {
      v187 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 16);
      v190 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 24);
    }

    objc_msgSend(*(id *)(a1 + 816), "text");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (v54)
    {
      objc_msgSend(*(id *)(a1 + 1048), "_bodyLeading");
      v43 = v55;
      v198 = width;
    }
    else
    {
      v43 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      v198 = *MEMORY[0x1E0C9D820];
    }

    objc_msgSend(*(id *)(a1 + 824), "intrinsicContentSize");
    objc_msgSend(*(id *)(a1 + 832), "sizeThatFits:", width, height);
    objc_msgSend(*(id *)(a1 + 840), "image");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v56;
    if (v56)
    {
      v243 = 0;
      v241 = 0u;
      v242 = 0u;
      v240 = 0u;
      objc_msgSend(v56, "pkui_alignmentSizeThatFits:maximumScale:", width, height, 1.0);
      PKRectRoundToPixel();
    }

    objc_msgSend(*(id *)(a1 + 848), "image");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v58;
    if (v58)
    {
      v243 = 0;
      v241 = 0u;
      v242 = 0u;
      v240 = 0u;
      objc_msgSend(v58, "pkui_alignmentSizeThatFits:maximumScale:", width, height, 1.0);
      PKRectRoundToPixel();
    }

    objc_msgSend(*(id *)(a1 + 952), "sizeThatFits:", width, 1.79769313e308);
    v189 = v60;
    v200 = v61;
    v188 = width;
  }
  objc_msgSend(*(id *)(a1 + 808), "image");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 800), "text");
  objc_msgSend(*(id *)(a1 + 816), "text");

  PKFloatCeilToPixel();
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 752), "setFrame:", a3 + r1_24, a4 + v17, v214, v213);
    objc_msgSend(*(id *)(a1 + 784), "image");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v63;
    v65 = slice.origin.x;
    v186 = a6;
    if (v63)
    {
      v243 = 0;
      v241 = 0u;
      v242 = 0u;
      v240 = 0u;
      objc_msgSend(v63, "pkui_alignmentSizeThatFits:maximumScale:", slice.size.width, slice.size.height, 1.0);
      PKRectRoundToPixel();
      PKSizeAlignedInRect();
      v65 = v69;
    }
    else
    {
      v66 = slice.origin.y;
      v67 = slice.size.width;
      v68 = slice.size.height;
    }
    v185 = v43;
    v184 = v64;
    v71 = r1 > 0.0 && *(_BYTE *)(v218 + 1064) != 0;
    objc_msgSend(*(id *)(v218 + 784), "pkui_setFrame:animated:", v71, v65, v66, v67, v68);
    objc_msgSend(*(id *)(v218 + 824), "sizeToFit");
    PKFloatRoundToPixel();
    v72 = *MEMORY[0x1E0C9D628];
    v73 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v74 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    r1_24a = *(double *)(MEMORY[0x1E0C9D628] + 16);
    if (*(_QWORD *)(v218 + 848))
    {
      PKSizeAlignedInRect();
      v192 = v75;
      r2 = v76;
      v78 = v77;
      v80 = v79;
      objc_msgSend(*(id *)(v218 + 848), "alpha");
      v82 = v81;
      v83 = v81 <= 0.0 || *(_BYTE *)(v218 + 1064) == 0;
      v84 = !v83;
      objc_msgSend(*(id *)(v218 + 848), "pkui_setFrame:animated:", v84, v192, v78, v80, r2);
      if (v82 > 0.0)
      {
        v246.origin.x = v72;
        v246.origin.y = v73;
        v246.size.width = r1_24a;
        v246.size.height = v74;
        v257.origin.x = v192;
        v257.origin.y = v78;
        v257.size.width = v80;
        v257.size.height = r2;
        v247 = CGRectUnion(v246, v257);
        r1_24a = v247.size.width;
        v72 = v247.origin.x;
        v73 = v247.origin.y;
        v74 = v247.size.height;
      }
    }
    if (*(_QWORD *)(v218 + 840))
    {
      PKSizeAlignedInRect();
      v193 = v86;
      v194 = v85;
      v88 = v87;
      v90 = v89;
      objc_msgSend(*(id *)(v218 + 840), "alpha");
      v92 = v91;
      v93 = v91 <= 0.0 || *(_BYTE *)(v218 + 1064) == 0;
      v94 = !v93;
      objc_msgSend(*(id *)(v218 + 840), "pkui_setFrame:animated:", v94, v194, v88, v90, v193);
      if (v92 > 0.0)
      {
        v248.origin.x = v72;
        v248.origin.y = v73;
        v248.size.width = r1_24a;
        v248.size.height = v74;
        v258.size.height = v193;
        v258.origin.x = v194;
        v258.origin.y = v88;
        v258.size.width = v90;
        v249 = CGRectUnion(v248, v258);
        r1_24a = v249.size.width;
        v72 = v249.origin.x;
        v73 = v249.origin.y;
        v74 = v249.size.height;
      }
    }
    if (*(_QWORD *)(v218 + 824))
    {
      if (*(_BYTE *)(v218 + 912))
      {
        v250.origin.x = x;
        v250.origin.y = y;
        v250.size.width = width;
        v250.size.height = height;
        CGRectInset(v250, -4.0, -2.0);
      }
      PKSizeAlignedInRect();
      v195 = v96;
      v196 = v95;
      v98 = v97;
      v100 = v99;
      objc_msgSend(*(id *)(v218 + 824), "alpha");
      v102 = v101;
      v104 = v101 > 0.0 && *(_BYTE *)(v218 + 1064) != 0;
      objc_msgSend(*(id *)(v218 + 824), "pkui_setFrame:animated:", v104, v196, v98, v100, v195);
      if (v102 > 0.0)
      {
        v251.origin.x = v72;
        v251.origin.y = v73;
        v251.size.width = r1_24a;
        v251.size.height = v74;
        v259.size.height = v195;
        v259.origin.x = v196;
        v259.origin.y = v98;
        v259.size.width = v100;
        v252 = CGRectUnion(v251, v259);
        r1_24a = v252.size.width;
        v72 = v252.origin.x;
        v73 = v252.origin.y;
        v74 = v252.size.height;
      }
    }
    if (*(_QWORD *)(v218 + 832))
    {
      PKSizeAlignedInRect();
      r1a = v105;
      v197 = v106;
      v108 = v107;
      v110 = v109;
      objc_msgSend(*(id *)(v218 + 832), "alpha");
      v112 = v111;
      v113 = v111 <= 0.0 || *(_BYTE *)(v218 + 1064) == 0;
      v114 = !v113;
      objc_msgSend(*(id *)(v218 + 832), "pkui_setFrame:animated:", v114, r1a, v108, v110, v197);
      if (v112 > 0.0)
      {
        v253.origin.x = v72;
        v253.origin.y = v73;
        v253.size.width = r1_24a;
        v253.size.height = v74;
        v260.origin.x = r1a;
        v260.origin.y = v108;
        v260.size.width = v110;
        v260.size.height = v197;
        v254 = CGRectUnion(v253, v260);
        r1_24a = v254.size.width;
        v72 = v254.origin.x;
        v73 = v254.origin.y;
        v74 = v254.size.height;
      }
    }
    v255.origin.x = v72;
    v255.origin.y = v73;
    v255.size.width = r1_24a;
    v255.size.height = v74;
    IsNull = CGRectIsNull(v255);
    v116 = v233;
    v233[1].origin.x = x;
    v116[1].origin.y = y;
    v116[1].size.width = width;
    v116[1].size.height = height;
    v117 = v72 + -2.0;
    v118 = r1_24a + 2.0;
    if (IsNull)
      v118 = r1_24a;
    if (IsNull | v10)
      v117 = v72;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __48__PKPassTileView__layoutWithBounds_applyLayout___block_invoke;
    aBlock[3] = &unk_1E3E62E20;
    aBlock[5] = &v232;
    aBlock[6] = &v226;
    v224 = !IsNull;
    *(double *)&aBlock[7] = v117;
    *(CGFloat *)&aBlock[8] = v73;
    *(double *)&aBlock[9] = v118;
    *(CGFloat *)&aBlock[10] = v74;
    aBlock[11] = v14;
    aBlock[4] = v218;
    r1b = (void (**)(double, double))_Block_copy(aBlock);
    v119 = v218;
    if (v13 == 1)
      v120 = 0x100000001;
    else
      v120 = v14 & 2 | 0x100000000;
    v121 = v209;
    v210 = v120;
    r1b[2](v199, v121);
    if (*(_QWORD *)(v218 + 952))
    {
      if (!v11)
      {
        r1b[2](v189, v200);
        goto LABEL_120;
      }
      objc_msgSend(*(id *)(v218 + 808), "alpha");
      v125 = v124;
      v126 = *(void **)(v218 + 752);
      objc_msgSend(v126, "superview");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v126, "convertRect:fromView:", v127, a3, a4, r1_8, v186);
      v129 = v128;
      v131 = v130;
      v133 = v132;
      v135 = v134;

      v119 = v218;
      v136 = *(void **)(v218 + 952);
      if (*(_BYTE *)(v218 + 1064))
        v137 = v125 > 0.0;
      else
        v137 = 0;
LABEL_110:
      objc_msgSend(v136, "pkui_setFrame:animated:", v137, v129, v131, v133, v135);
LABEL_120:
      ((void (*)(void (**)(double, double), _QWORD, uint64_t, double, double))r1b[2])(r1b, *(_QWORD *)(v119 + 816), v210, v198, v185);
      v221 = 0u;
      v222 = 0u;
      v219 = 0u;
      v220 = 0u;
      v148 = *(id *)(v119 + 1000);
      v149 = objc_msgSend(v148, "countByEnumeratingWithState:objects:count:", &v219, v244, 16);
      if (v149)
      {
        v150 = *(_QWORD *)v220;
        v151 = (double *)MEMORY[0x1E0DC49E8];
        rect = width;
        do
        {
          v152 = 0;
          do
          {
            if (*(_QWORD *)v220 != v150)
              objc_enumerationMutation(v148);
            v153 = height;
            v154 = *(_QWORD *)(*((_QWORD *)&v219 + 1) + 8 * v152);
            if (v154)
            {
              v155 = *(unsigned __int8 *)(v154 + 112);
              v156 = v151 + 1;
              v157 = v151 + 2;
              v158 = v151 + 3;
              v159 = (double *)(v154 + 24);
              v160 = (double *)(v154 + 32);
              v161 = (double *)(v154 + 40);
              v162 = (double *)(v154 + 48);
              v164 = v154 + 8;
              v154 = *(_QWORD *)(v154 + 8);
              v163 = *(_QWORD *)(v164 + 8);
              if (v163)
              {
                v159 = v151;
              }
              else
              {
                v158 = v162;
                v157 = v161;
                v156 = v160;
              }
              v165 = *v159;
              v166 = *v156;
              v167 = *v157;
              v168 = *v158;
            }
            else
            {
              v163 = 0;
              v155 = 0;
              v168 = 0.0;
              v167 = 0.0;
              v166 = 0.0;
              v165 = 0.0;
            }
            v169 = (id)v154;
            objc_msgSend(v169, "frame");
            v172 = v165 + v171;
            v174 = v173 - (v168 + v166);
            v176 = v175 - (v167 + v165);
            switch(v163)
            {
              case 0:
              case 3:
              case 4:
              case 5:
                goto LABEL_135;
              case 1:
                PKSizeAlignedInRect();
                break;
              case 2:
                if (v155)
                {
                  v256.origin.x = x;
                  v256.origin.y = y;
                  v256.size.width = rect;
                  v256.size.height = v153;
                  CGRectInset(v256, -4.0, -2.0);
                }
LABEL_135:
                PKSizeAlignedInRect();
                v172 = v178;
                v174 = v179;
                v176 = v180;
                break;
              default:
                v177 = v166 + v170;
                break;
            }
            objc_msgSend(v169, "pkui_setFrame:animated:", *(unsigned __int8 *)(v218 + 1064), v177 - v166, v172 - v165, v174 - (-v168 - v166), v176 - (-v167 - v165));

            height = v153;
            ++v152;
          }
          while (v149 != v152);
          v181 = objc_msgSend(v148, "countByEnumeratingWithState:objects:count:", &v219, v244, 16);
          v149 = v181;
        }
        while (v181);
      }

      goto LABEL_141;
    }
    if (v62)
    {
      v138 = *(_QWORD *)(v218 + 808);
      if (v11)
      {
        objc_msgSend(*(id *)(v218 + 808), "alpha");
        v140 = v139;
        v141 = *(void **)(v218 + 752);
        objc_msgSend(v141, "superview");
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v141, "convertRect:fromView:", v142, a3, a4, r1_8, v186);
        v129 = v143;
        v131 = v144;
        v133 = v145;
        v135 = v146;

        v119 = v218;
        v136 = *(void **)(v218 + 808);
        if (*(_BYTE *)(v218 + 1064))
          v137 = v140 > 0.0;
        else
          v137 = 0;
        goto LABEL_110;
      }
      v147 = 0x100000001;
      v123.n128_u64[0] = v190;
      v122.n128_u64[0] = v187;
    }
    else
    {
      v138 = *(_QWORD *)(v218 + 800);
      v122.n128_f64[0] = v188;
      v147 = v210;
      v123.n128_u64[0] = v191;
    }
    ((void (*)(void (**)(double, double), uint64_t, uint64_t, __n128, __n128))r1b[2])(r1b, v138, v147, v122, v123);
    goto LABEL_120;
  }
LABEL_141:
  _Block_object_dispose(&v226, 8);
  _Block_object_dispose(&v232, 8);
  return r1_8;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = -[PKPassTileView _layoutWithBounds:applyLayout:]((uint64_t)self, 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)_isDynamicHeight
{
  void *v1;
  void *v2;
  _BOOL8 v3;

  objc_msgSend(*(id *)(a1 + 920), "stateTypeDefaultV2");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = (objc_msgSend(v1, "preferredStyle") & 0xFFFFFFFFFFFFFFFELL) == 4;
  else
    v3 = 0;

  return v3;
}

void __48__PKPassTileView__layoutWithBounds_applyLayout___block_invoke(uint64_t a1, void *a2, double a3, CGFloat a4)
{
  id v7;
  uint64_t v8;
  double v9;
  double v10;
  CGRect *v11;
  int v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double x;
  double y;
  double width;
  double height;
  double v21;
  double v22;
  double v23;
  double v24;
  double *v25;
  _BOOL8 v26;
  uint64_t v27;
  CGRect *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  id v33;
  CGPoint v34;
  __int128 v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  v7 = a2;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v34 = *(CGPoint *)(v8 + 32);
  v35 = *(_OWORD *)(v8 + 48);
  v33 = v7;
  objc_msgSend(v7, "alpha");
  v10 = v9;
  v11 = *(CGRect **)(*(_QWORD *)(a1 + 40) + 8);
  v36.origin.x = v11[1].origin.x;
  v36.origin.y = v11[1].origin.y;
  ++v11;
  v36.size.width = v11->size.width;
  v36.size.height = v11->size.height;
  CGRectDivide(v36, (CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32), v11, a4, CGRectMinYEdge);
  if (!*(_BYTE *)(a1 + 96))
  {
LABEL_4:
    PKSizeAlignedInRect();
    v26 = v10 > 0.0 && *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1064) != 0;
    objc_msgSend(v33, "pkui_setFrame:animated:", v26, *(_QWORD *)&v31);
    v27 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v28 = (CGRect *)(v27 + 32);
    if (v10 <= 0.0)
    {
      v28->origin = v34;
      *(_OWORD *)(v27 + 48) = v35;
    }
    else
    {
      CGRectDivide(*(CGRect *)(v27 + 32), (CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32), v28, *(CGFloat *)(*(_QWORD *)(a1 + 32) + 904), CGRectMinYEdge);
    }

    return;
  }
  v31 = a3;
  v32 = v10;
  v12 = *(_DWORD *)(a1 + 92);
  v13 = *(double *)(a1 + 56);
  v14 = *(double *)(a1 + 64);
  v15 = *(double *)(a1 + 72);
  v16 = *(double *)(a1 + 80);
  v37 = CGRectStandardize(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32));
  x = v37.origin.x;
  y = v37.origin.y;
  width = v37.size.width;
  height = v37.size.height;
  v39.origin.x = v13;
  v39.origin.y = v14;
  v39.size.width = v15;
  v39.size.height = v16;
  v38 = CGRectIntersection(v37, v39);
  v21 = v38.origin.x;
  v22 = v38.origin.y;
  v23 = v38.size.width;
  v24 = v38.size.height;
  if (CGRectIsNull(v38))
  {
LABEL_3:
    v10 = v32;
    v25 = *(double **)(*(_QWORD *)(a1 + 48) + 8);
    v25[4] = x;
    v25[5] = y;
    v25[6] = width;
    v25[7] = height;
    goto LABEL_4;
  }
  switch(v12)
  {
    case 0:
      v29 = x + width;
      x = fmin(v21 + v23, x + width);
      width = v29 - x;
      goto LABEL_3;
    case 1:
      v30 = y + height;
      y = fmin(v22 + v24, y + height);
      height = v30 - y;
      goto LABEL_3;
    case 2:
      width = fmax(v21 - x, 0.0);
      goto LABEL_3;
    case 3:
      height = fmax(v22 - y, 0.0);
      goto LABEL_3;
    default:
      __break(1u);
      break;
  }
}

- (void)layoutIfNeededAnimated:(BOOL)a3
{
  self->_animated = a3;
  -[PKPassTileView layoutIfNeeded](self, "layoutIfNeeded");
  self->_animated = 0;
}

- (void)prepareForReuse
{
  NSObject *actionStateTimeout;
  OS_dispatch_source *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[5];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  actionStateTimeout = self->_actionStateTimeout;
  if (actionStateTimeout)
  {
    dispatch_source_cancel(actionStateTimeout);
    v4 = self->_actionStateTimeout;
    self->_actionStateTimeout = 0;

  }
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __33__PKPassTileView_prepareForReuse__block_invoke;
  v23[3] = &unk_1E3E612E8;
  v23[4] = self;
  -[PKPassTileView performBatchUpdates:animated:](self, "performBatchUpdates:animated:", v23, 0);
  -[PKPassTileView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllAnimations");

  -[UIImageView layer](self->_icon, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllAnimations");

  -[UILabel layer](self->_title, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllAnimations");

  -[UILabel layer](self->_body, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllAnimations");

  -[UIImageView layer](self->_bodyImage, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAllAnimations");

  -[UILabel layer](self->_footer, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeAllAnimations");

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = self->_snapshots;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v15);
        if (v16)
          v17 = *(void **)(v16 + 8);
        else
          v17 = 0;
        objc_msgSend(v17, "removeFromSuperview", (_QWORD)v19);
        ++v15;
      }
      while (v13 != v15);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      v13 = v18;
    }
    while (v18);
  }

  -[NSMutableArray removeAllObjects](self->_snapshots, "removeAllObjects");
}

uint64_t __33__PKPassTileView_prepareForReuse__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setContent:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setInActionState:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setCompact:", 0);
}

- (void)beginActionStateTimeout:(int64_t)a3
{
  NSObject *actionStateTimeout;
  OS_dispatch_source *v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *v8;
  NSObject *v9;
  int64_t v10;
  dispatch_time_t v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id location;

  -[PKPassTileView setInActionState:animated:](self, "setInActionState:animated:", 1, 1);
  actionStateTimeout = self->_actionStateTimeout;
  if (actionStateTimeout)
  {
    dispatch_source_cancel(actionStateTimeout);
    v6 = self->_actionStateTimeout;
    self->_actionStateTimeout = 0;

  }
  v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
  v8 = self->_actionStateTimeout;
  self->_actionStateTimeout = v7;

  v9 = self->_actionStateTimeout;
  if (a3 == 1)
    v10 = 10000000000;
  else
    v10 = 1250000000;
  v11 = dispatch_time(0, v10);
  dispatch_source_set_timer(v9, v11, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  objc_initWeak(&location, self);
  v12 = self->_actionStateTimeout;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __42__PKPassTileView_beginActionStateTimeout___block_invoke;
  v13[3] = &unk_1E3E61310;
  objc_copyWeak(&v14, &location);
  dispatch_source_set_event_handler(v12, v13);
  dispatch_resume((dispatch_object_t)self->_actionStateTimeout);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __42__PKPassTileView_beginActionStateTimeout___block_invoke(uint64_t a1)
{
  dispatch_source_t *WeakRetained;
  dispatch_source_t v2;
  dispatch_source_t *v3;

  WeakRetained = (dispatch_source_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    dispatch_source_cancel(WeakRetained[134]);
    v2 = v3[134];
    v3[134] = 0;

    -[dispatch_source_t setInActionState:animated:](v3, "setInActionState:animated:", -[NSObject isInProgress](v3[136], "isInProgress"), 1);
    WeakRetained = v3;
  }

}

- (void)performBatchUpdates:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  _BOOL4 deferredSubviewUpdate;
  char v9;
  void (**v10)(_QWORD, void *);

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v10 = (void (**)(_QWORD, void *))v6;
    if (self->_deferringUpdate)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("PKPassTileView recursive batch updates are not supported."));
    if (v4)
      -[PKPassTileView layoutIfNeeded](self, "layoutIfNeeded");
    self->_deferringUpdate = 1;
    v10[2](v10, v7);
    self->_deferringUpdate = 0;
    deferredSubviewUpdate = self->_deferredSubviewUpdate;
    self->_deferredSubviewUpdate = 0;
    v9 = -[PKPassTileView _updateContentStateAnimated:]((uint64_t)self, v4);
    v7 = v10;
    if ((v9 & 1) == 0)
    {
      if (deferredSubviewUpdate)
        -[PKPassTileView _updateSubviewsAnimated:]((uint64_t)self, v4);
      else
        -[PKPassTileView layoutIfNeededAnimated:](self, "layoutIfNeededAnimated:", v4);
      v7 = v10;
    }
  }

}

- (uint64_t)_updateContentStateAnimated:(uint64_t)a1
{
  uint64_t v3;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;

  if (a1 && !*(_BYTE *)(a1 + 1065))
  {
    v5 = *(unsigned __int8 *)(a1 + 1080);
    objc_msgSend(*(id *)(a1 + 1088), "state");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (*(_BYTE *)(a1 + 1080))
    {
      objc_msgSend(v6, "actionState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        v10 = v8;

        v7 = v10;
      }

    }
    objc_msgSend((id)a1, "setUserInteractionEnabled:", v5 == 0);
    v11 = *(void **)(a1 + 936);
    v12 = *(_QWORD *)(a1 + 944);
    v13 = *(id *)(a1 + 920);
    v14 = v7;
    v15 = v11;
    v16 = v15;
    if (v13 == v14)
    {
      objc_msgSend(v15, "passState");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "hash") == v12)
      {

LABEL_11:
        v3 = 0;
LABEL_18:

        return v3;
      }
      objc_msgSend(v14, "stateTypeDefaultV2");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "title");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "valueTypeForeignReference");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "foreignReferenceType");

      if (!v20)
      {
        v29 = v18;
        objc_msgSend(v30, "body");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "valueTypeForeignReference");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "foreignReferenceType");

        if (!v23)
        {
          objc_msgSend(v30, "footer");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "valueTypeForeignReference");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "foreignReferenceType");

          if (!v28)
            goto LABEL_11;
LABEL_17:
          objc_msgSend(*(id *)(a1 + 936), "passState");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)(a1 + 944) = objc_msgSend(v24, "hash");

          objc_storeStrong((id *)(a1 + 920), v7);
          -[PKPassTileView _updateSubviewsAnimated:](a1, a2);
          v3 = 1;
          goto LABEL_18;
        }

        v18 = v29;
      }

      v13 = v14;
    }

    goto LABEL_17;
  }
  return 0;
}

void __42__PKPassTileView__updateSubviewsAnimated___block_invoke(uint64_t a1)
{
  dispatch_source_t *WeakRetained;
  dispatch_source_t v2;
  dispatch_source_t *v3;

  WeakRetained = (dispatch_source_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    dispatch_source_cancel(WeakRetained[121]);
    v2 = v3[121];
    v3[121] = 0;

    -[PKPassTileView _updateSubviewsAnimated:](v3, 1);
    WeakRetained = v3;
  }

}

- (double)_prepareViewForReuse:(void *)a3 type:(__int128 *)a4 state:
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  PKPassTileView_SubviewSnapshot *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  id v45;
  id *v46;
  id *v47;
  __int128 v48;
  __int128 v49;
  id *v50;
  id v51;
  id *v52;
  id v53;
  double v54;
  void *v55;
  id v56;
  _QWORD v58[4];
  id v59;
  _QWORD v60[4];
  id v61;
  id v62;
  id *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  objc_super v68;

  v7 = a2;
  objc_msgSend(v7, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    objc_msgSend(v7, "snapshotViewAfterScreenUpdates:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v7, "frame");
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v18 = v17;
      objc_msgSend(v7, "layer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "presentationLayer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20)
      {
        objc_msgSend(v20, "anchorPoint");
        v23 = v22;
        v25 = v24;
        objc_msgSend(v21, "position");
        v27 = v26;
        v29 = v28;
        objc_msgSend(v21, "bounds");
        v16 = v30;
        v18 = v31;
        v12 = v27 - v23 * v30;
        v14 = v29 - v25 * v31;
      }
      objc_msgSend(v10, "setFrame:", v12, v14, v16, v18);
      objc_msgSend(v8, "addSubview:", v10);
      objc_msgSend(v10, "layer");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setAllowsGroupOpacity:", objc_msgSend(v19, "allowsGroupOpacity"));
      objc_msgSend(v19, "compositingFilter");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setCompositingFilter:", v33);

      v34 = [PKPassTileView_SubviewSnapshot alloc];
      objc_msgSend(v7, "alignmentRectInsets");
      v36 = v35;
      v38 = v37;
      v40 = v39;
      v42 = v41;
      v43 = a4[1];
      v64 = *a4;
      v65 = v43;
      v44 = a4[3];
      v66 = a4[2];
      v67 = v44;
      v45 = v10;
      if (v34)
      {
        v68.receiver = v34;
        v68.super_class = (Class)PKPassTileView_SubviewSnapshot;
        v46 = (id *)objc_msgSendSuper2(&v68, sel_init);
        v47 = v46;
        if (v46)
        {
          objc_storeStrong(v46 + 1, v10);
          v47[3] = v36;
          v47[4] = v38;
          v47[5] = v40;
          v47[6] = v42;
          v47[2] = a3;
          v48 = v65;
          *(_OWORD *)(v47 + 7) = v64;
          *(_OWORD *)(v47 + 9) = v48;
          v49 = v67;
          *(_OWORD *)(v47 + 11) = v66;
          *(_OWORD *)(v47 + 13) = v49;
        }
        v50 = v47;
      }
      else
      {
        v50 = 0;
      }

      v51 = *(id *)(a1 + 1000);
      objc_msgSend(v51, "addObject:", v50);
      v9 = MEMORY[0x1E0C809B0];
      v60[0] = MEMORY[0x1E0C809B0];
      v60[1] = 3221225472;
      v60[2] = __50__PKPassTileView__prepareViewForReuse_type_state___block_invoke;
      v60[3] = &unk_1E3E62E98;
      v61 = v45;
      v62 = v51;
      v63 = v50;
      v52 = v50;
      v53 = v51;
      *(_QWORD *)&v64 = 0;
      _PKViewSetAlphaAnimated(v61, v60, (double *)&v64, 0.0, 0.0);
      v54 = *(double *)&v64;

    }
    else
    {
      v54 = 0.0;
    }

  }
  else
  {
    v54 = 0.0;
  }
  v55 = (void *)MEMORY[0x1E0DC3F10];
  v58[0] = v9;
  v58[1] = 3221225472;
  v58[2] = __50__PKPassTileView__prepareViewForReuse_type_state___block_invoke_2;
  v58[3] = &unk_1E3E612E8;
  v56 = v7;
  v59 = v56;
  objc_msgSend(v55, "performWithoutAnimation:", v58);

  return v54;
}

void __42__PKPassTileView__updateSubviewsAnimated___block_invoke_3(uint64_t a1, void *a2, unsigned int a3, int a4)
{
  double v4;
  double v5;
  uint64_t v6;

  v4 = (double)a3;
  if (*(_BYTE *)(a1 + 40))
  {
    v5 = 0.0;
    if (a3)
    {
      if (a4)
        v5 = *(double *)(*(_QWORD *)(a1 + 32) + 760);
    }
    v6 = 0;
    _PKViewSetAlphaAnimated(a2, 0, (double *)&v6, v4, v5);
  }
  else
  {
    objc_msgSend(a2, "pkui_setAlpha:animated:", 0, v4);
  }
}

- (void)_updateStyleAnimated:(uint64_t)a1
{
  uint64_t v4;
  uint64_t v5;
  double v6;
  char v7;
  uint64_t v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  id v18;
  int v19;
  double v20;
  uint64_t v21;
  id v22;
  id v23;
  int v24;
  double v25;
  _QWORD *v26;
  void *v27;
  _QWORD *v28;
  void *v29;
  void *v30;
  id v31;
  int v32;
  double v33;
  _QWORD *v34;
  int v35;
  _QWORD *v36;
  void *v37;
  void *v38;
  id v39;
  int v40;
  double v41;
  uint64_t v42;
  void *v43;
  void (**v44)(_QWORD, _QWORD, _QWORD, _QWORD, double);
  uint64_t v45;
  _BOOL8 v46;
  uint64_t v47;
  _BOOL8 v48;
  uint64_t v49;
  _BOOL8 v50;
  uint64_t v51;
  _BOOL8 v52;
  uint64_t v53;
  _BOOL8 v54;
  uint64_t v55;
  _BOOL8 v56;
  uint64_t v57;
  _BOOL8 v58;
  id v59;
  id v60;
  void (**v61)(_QWORD);
  void *v62;
  void (**v63)(_QWORD);
  void *v64;
  void (**v65)(_QWORD);
  void (**v66)(_QWORD);
  void (**v67)(_QWORD);
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  id v76;
  id v77;
  void *v78;
  id v79;
  id v80;
  int v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void (**v88)(_QWORD);
  void *v89;
  void (**v90)(_QWORD);
  _QWORD v91[5];
  id v92;
  _QWORD v93[5];
  id v94;
  _QWORD v95[5];
  id v96;
  _QWORD v97[5];
  id v98;
  _QWORD v99[5];
  id v100;
  _QWORD v101[5];
  id v102;
  _QWORD v103[5];
  id v104;
  _QWORD v105[5];
  id v106;
  _QWORD aBlock[5];
  char v108;
  char v109[9];

  if (a1 && !*(_BYTE *)(a1 + 1065))
  {
    if (*(_BYTE *)(a1 + 976))
    {
      if (*(_BYTE *)(a1 + 977) || !*(_BYTE *)(a1 + 979))
      {
        v4 = 0;
        v5 = *(unsigned __int8 *)(a1 + 979);
        v6 = 1.0;
      }
      else
      {
        v5 = 0;
        v4 = 1;
        v6 = 0.6;
      }
    }
    else
    {
      v5 = 0;
      v4 = 2;
      v6 = 0.3;
    }
    if (objc_msgSend((id)a1, "overrideUserInterfaceStyle") != v5)
      objc_msgSend((id)a1, "setOverrideUserInterfaceStyle:", v5);
    v7 = *(_BYTE *)(a1 + 978);
    if (v7)
      v7 = *(_BYTE *)(a1 + 980) != 0;
    v8 = *(_QWORD *)(a1 + 1096);
    if (v8 == 1)
      v9 = v7;
    else
      v9 = 0;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 == 2)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
      v12 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC3658], "quaternaryLabelColor");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v4 != 1)
      {
        if (v8 == 1)
        {
          if ((v9 & 1) != 0)
            objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
          else
            objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
          v15 = objc_claimAutoreleasedReturnValue();

          v10 = (void *)v15;
        }
        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
        v14 = objc_claimAutoreleasedReturnValue();
LABEL_27:

        v16 = *(_QWORD **)(a1 + 928);
        if (v16)
          v16 = (_QWORD *)v16[4];
        v17 = v16;
        v18 = 0;
        v109[0] = 0;
        v19 = 1;
        if (v17 && v8 != 1)
        {
          PKPassTileViewTileImageTintColor(v17, v109);
          v18 = (id)objc_claimAutoreleasedReturnValue();
          v19 = v109[0];
        }
        v20 = v6;
        if (!v18 && v19)
        {
          v18 = v10;
          v20 = 1.0;
        }
        v89 = v18;
        v21 = *(_QWORD *)(a1 + 928);
        if (v21)
        {
          v22 = *(id *)(v21 + 96);
          v23 = v22;
          v109[0] = 0;
          if (v22)
          {
            PKPassTileViewTileImageTintColor(v22, v109);
            v22 = (id)objc_claimAutoreleasedReturnValue();
            v24 = v109[0];
LABEL_40:
            v25 = v6;
            if (!v22 && v24)
            {
              v22 = v10;
              v25 = 1.0;
            }
            v26 = *(_QWORD **)(a1 + 928);
            v87 = (void *)v14;
            v27 = v22;
            if (v26)
              v26 = (_QWORD *)v26[8];
            v28 = v26;
            objc_msgSend(v28, "accessoryTypeImage");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "image");
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            v109[0] = 0;
            if (v30)
            {
              PKPassTileViewTileImageTintColor(v30, v109);
              v31 = (id)objc_claimAutoreleasedReturnValue();
              v32 = v109[0];
            }
            else
            {
              v31 = 0;
              v32 = 1;
            }
            v33 = v6;
            if (!v31 && v32)
            {
              v31 = v10;
              v33 = 1.0;
            }
            v34 = *(_QWORD **)(a1 + 928);
            v85 = v31;
            v35 = a2;
            if (v34)
              v34 = (_QWORD *)v34[6];
            v36 = v34;
            objc_msgSend(v36, "accessoryTypeImage");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "image");
            v38 = (void *)objc_claimAutoreleasedReturnValue();

            v109[0] = 0;
            v83 = v38;
            if (v38)
            {
              PKPassTileViewTileImageTintColor(v38, v109);
              v39 = (id)objc_claimAutoreleasedReturnValue();
              v40 = v109[0];
            }
            else
            {
              v39 = 0;
              v40 = 1;
            }
            v84 = v17;
            v75 = v23;
            v41 = v6;
            if (!v39 && v40)
            {
              v39 = v10;
              v41 = 1.0;
            }
            v78 = v39;
            v42 = MEMORY[0x1E0C809B0];
            aBlock[0] = MEMORY[0x1E0C809B0];
            aBlock[1] = 3221225472;
            aBlock[2] = __39__PKPassTileView__updateStyleAnimated___block_invoke;
            aBlock[3] = &unk_1E3E62E70;
            v108 = v35;
            aBlock[4] = a1;
            v43 = _Block_copy(aBlock);
            v44 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, double))v43;
            v45 = *(_QWORD *)(a1 + 928);
            if (v45)
              v46 = *(unsigned __int8 *)(v45 + 16) != 0;
            else
              v46 = 0;
            (*((void (**)(void *, _QWORD, _BOOL8, _QWORD, double))v43 + 2))(v43, *(_QWORD *)(a1 + 784), v46, *(unsigned __int8 *)(a1 + 768), v20);
            v47 = *(_QWORD *)(a1 + 928);
            if (v47)
              v48 = *(unsigned __int8 *)(v47 + 19) != 0;
            else
              v48 = 0;
            v44[2](v44, *(_QWORD *)(a1 + 808), v48, *(unsigned __int8 *)(a1 + 771), v25);
            v49 = *(_QWORD *)(a1 + 928);
            if (v49)
              v50 = *(unsigned __int8 *)(v49 + 21) != 0;
            else
              v50 = 0;
            v44[2](v44, *(_QWORD *)(a1 + 824), v50, *(unsigned __int8 *)(a1 + 773), v6);
            v51 = *(_QWORD *)(a1 + 928);
            if (v51)
              v52 = *(unsigned __int8 *)(v51 + 22) != 0;
            else
              v52 = 0;
            v44[2](v44, *(_QWORD *)(a1 + 832), v52, *(unsigned __int8 *)(a1 + 774), v6);
            v53 = *(_QWORD *)(a1 + 928);
            if (v53)
              v54 = *(unsigned __int8 *)(v53 + 23) != 0;
            else
              v54 = 0;
            v44[2](v44, *(_QWORD *)(a1 + 840), v54, *(unsigned __int8 *)(a1 + 775), v41);
            v55 = *(_QWORD *)(a1 + 928);
            if (v55)
              v56 = *(unsigned __int8 *)(v55 + 24) != 0;
            else
              v56 = 0;
            v72 = v30;
            v44[2](v44, *(_QWORD *)(a1 + 848), v56, *(unsigned __int8 *)(a1 + 776), v33);
            v57 = *(_QWORD *)(a1 + 928);
            v81 = v35;
            if (v57)
              v58 = *(unsigned __int8 *)(v57 + 25) != 0;
            else
              v58 = 0;
            v44[2](v44, *(_QWORD *)(a1 + 952), v58, *(unsigned __int8 *)(a1 + 777), v6);
            v105[0] = v42;
            v105[1] = 3221225472;
            v105[2] = __39__PKPassTileView__updateStyleAnimated___block_invoke_2;
            v105[3] = &unk_1E3E61388;
            v105[4] = a1;
            v82 = v89;
            v106 = v82;
            v73 = _Block_copy(v105);
            v103[0] = v42;
            v103[1] = 3221225472;
            v103[2] = __39__PKPassTileView__updateStyleAnimated___block_invoke_3;
            v103[3] = &unk_1E3E61388;
            v103[4] = a1;
            v59 = v10;
            v104 = v59;
            v90 = (void (**)(_QWORD))_Block_copy(v103);
            v101[0] = v42;
            v101[1] = 3221225472;
            v101[2] = __39__PKPassTileView__updateStyleAnimated___block_invoke_4;
            v101[3] = &unk_1E3E61388;
            v101[4] = a1;
            v60 = v59;
            v102 = v60;
            v61 = (void (**)(_QWORD))_Block_copy(v101);
            v99[0] = v42;
            v99[1] = 3221225472;
            v99[2] = __39__PKPassTileView__updateStyleAnimated___block_invoke_5;
            v99[3] = &unk_1E3E61388;
            v99[4] = a1;
            v74 = v27;
            v100 = v74;
            v62 = _Block_copy(v99);
            v97[0] = v42;
            v97[1] = 3221225472;
            v97[2] = __39__PKPassTileView__updateStyleAnimated___block_invoke_6;
            v97[3] = &unk_1E3E61388;
            v97[4] = a1;
            v80 = v87;
            v98 = v80;
            v63 = (void (**)(_QWORD))_Block_copy(v97);
            v95[0] = v42;
            v95[1] = 3221225472;
            v95[2] = __39__PKPassTileView__updateStyleAnimated___block_invoke_7;
            v95[3] = &unk_1E3E61388;
            v95[4] = a1;
            v79 = v78;
            v96 = v79;
            v64 = _Block_copy(v95);
            v93[0] = v42;
            v93[1] = 3221225472;
            v93[2] = __39__PKPassTileView__updateStyleAnimated___block_invoke_8;
            v93[3] = &unk_1E3E61388;
            v93[4] = a1;
            v76 = v85;
            v94 = v76;
            v65 = (void (**)(_QWORD))_Block_copy(v93);
            v91[0] = v42;
            v91[1] = 3221225472;
            v91[2] = __39__PKPassTileView__updateStyleAnimated___block_invoke_9;
            v91[3] = &unk_1E3E61388;
            v91[4] = a1;
            v77 = v60;
            v92 = v77;
            v66 = (void (**)(_QWORD))_Block_copy(v91);
            v86 = v62;
            v88 = v61;
            v67 = v65;
            if (v81)
            {
              v68 = v64;
              v69 = v73;
              if (*(_BYTE *)(a1 + 768))
                (*((void (**)(void *))v73 + 2))(v73);
              else
                objc_msgSend(MEMORY[0x1E0DC3F10], "pkui_animateUsingOptions:animations:completion:", 6, v73, 0);
              if (*(_BYTE *)(a1 + 769))
                v90[2](v90);
              else
                objc_msgSend(MEMORY[0x1E0DC3F10], "pkui_animateUsingOptions:animations:completion:", 6, v90, 0);
              v71 = v72;
              if (*(_BYTE *)(a1 + 770))
                v88[2](v88);
              else
                objc_msgSend(MEMORY[0x1E0DC3F10], "pkui_animateUsingOptions:animations:completion:", 6, v88, 0);
              if (*(_BYTE *)(a1 + 771))
                (*((void (**)(void *))v62 + 2))(v62);
              else
                objc_msgSend(MEMORY[0x1E0DC3F10], "pkui_animateUsingOptions:animations:completion:", 6, v62, 0);
              if (*(_BYTE *)(a1 + 772))
                v63[2](v63);
              else
                objc_msgSend(MEMORY[0x1E0DC3F10], "pkui_animateUsingOptions:animations:completion:", 6, v63, 0);
              if (*(_BYTE *)(a1 + 775))
                (*((void (**)(void *))v64 + 2))(v64);
              else
                objc_msgSend(MEMORY[0x1E0DC3F10], "pkui_animateUsingOptions:animations:completion:", 6, v64, 0);
              if (*(_BYTE *)(a1 + 776))
                v67[2](v67);
              else
                objc_msgSend(MEMORY[0x1E0DC3F10], "pkui_animateUsingOptions:animations:completion:", 6, v67, 0);
              v70 = v75;
              if (!*(_BYTE *)(a1 + 777))
              {
                objc_msgSend(MEMORY[0x1E0DC3F10], "pkui_animateUsingOptions:animations:completion:", 6, v66, 0);
                goto LABEL_98;
              }
            }
            else
            {
              (*((void (**)(void *))v73 + 2))(v73);
              v90[2](v90);
              v61[2](v61);
              (*((void (**)(void *))v62 + 2))(v62);
              v63[2](v63);
              (*((void (**)(void *))v64 + 2))(v64);
              v65[2](v65);
              v70 = v75;
              v71 = v72;
              v69 = v73;
              v68 = v64;
            }
            v66[2](v66);
LABEL_98:

            return;
          }
        }
        else
        {
          v23 = 0;
          v22 = 0;
        }
        v24 = 1;
        goto LABEL_40;
      }
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v12 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v14 = v13;
    v10 = (void *)v12;
    goto LABEL_27;
  }
}

- (void)_updateBackgroundAnimated:(_BYTE *)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[5];
  id v11;

  if (a1)
  {
    if (a1[978] && a1[980])
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "tableCellDefaultSelectionTintColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v5 = v4;
    if ((a2 & 1) != 0)
    {
      v6 = (void *)MEMORY[0x1E0DC3F10];
      if (a1[978])
      {
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __44__PKPassTileView__updateBackgroundAnimated___block_invoke;
        v10[3] = &unk_1E3E61388;
        v10[4] = a1;
        v11 = v4;
        objc_msgSend(v6, "_animateUsingDefaultTimingWithOptions:animations:completion:", 1030, v10, 0);
        v7 = v11;
      }
      else
      {
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __44__PKPassTileView__updateBackgroundAnimated___block_invoke_2;
        v8[3] = &unk_1E3E61388;
        v8[4] = a1;
        v9 = v4;
        objc_msgSend(v6, "_animateUsingDefaultTimingWithOptions:animations:completion:", 2, v8, 0);
        v7 = v9;
      }

    }
    else
    {
      objc_msgSend(a1, "setBackgroundColor:", v4);
    }

  }
}

void __39__PKPassTileView__updateStyleAnimated___block_invoke(uint64_t a1, void *a2, int a3, int a4, double a5)
{
  double v5;
  uint64_t v6;

  v5 = 0.0;
  if (!a3)
    a5 = 0.0;
  if (*(_BYTE *)(a1 + 40))
  {
    if (a3)
    {
      if (a4)
        v5 = *(double *)(*(_QWORD *)(a1 + 32) + 760);
    }
    v6 = 0;
    _PKViewSetAlphaAnimated(a2, 0, (double *)&v6, a5, v5);
  }
  else
  {
    objc_msgSend(a2, "pkui_setAlpha:animated:", 0, a5);
  }
}

uint64_t __39__PKPassTileView__updateStyleAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 784), "setTintColor:", *(_QWORD *)(a1 + 40));
}

uint64_t __39__PKPassTileView__updateStyleAnimated___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 792), "setTintColor:", *(_QWORD *)(a1 + 40));
}

uint64_t __39__PKPassTileView__updateStyleAnimated___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 800), "setTintColor:", *(_QWORD *)(a1 + 40));
}

uint64_t __39__PKPassTileView__updateStyleAnimated___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 808), "setTintColor:", *(_QWORD *)(a1 + 40));
}

uint64_t __39__PKPassTileView__updateStyleAnimated___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 816), "setTintColor:", *(_QWORD *)(a1 + 40));
}

uint64_t __39__PKPassTileView__updateStyleAnimated___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 840), "setTintColor:", *(_QWORD *)(a1 + 40));
}

uint64_t __39__PKPassTileView__updateStyleAnimated___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 848), "setTintColor:", *(_QWORD *)(a1 + 40));
}

uint64_t __39__PKPassTileView__updateStyleAnimated___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 952), "setTintColor:", *(_QWORD *)(a1 + 40));
}

uint64_t __44__PKPassTileView__updateBackgroundAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", *(_QWORD *)(a1 + 40));
}

uint64_t __44__PKPassTileView__updateBackgroundAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", *(_QWORD *)(a1 + 40));
}

uint64_t __50__PKPassTileView__prepareViewForReuse_type_state___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 40), "removeObjectIdenticalTo:", *(_QWORD *)(a1 + 48));
}

void __50__PKPassTileView__prepareViewForReuse_type_state___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllAnimations");
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  objc_msgSend(v2, "clearHasBeenCommitted");

}

- (void)setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PKPassTileView;
  -[PKPassTileView setEnabled:](&v5, sel_setEnabled_);
  if (self->_enabled != v3)
  {
    self->_enabled = v3;
    -[PKPassTileView _updateStyleAnimated:]((uint64_t)self, 0);
  }
}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PKPassTileView;
  -[PKPassTileView setSelected:](&v5, sel_setSelected_);
  if (self->_selected != v3)
  {
    self->_selected = v3;
    -[PKPassTileView _updateStyleAnimated:]((uint64_t)self, 0);
  }
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PKPassTileView;
  -[PKPassTileView setHighlighted:](&v5, sel_setHighlighted_);
  if (self->_highlighted != v3)
  {
    self->_highlighted = v3;
    -[PKPassTileView _updateBackgroundAnimated:](self, 1);
  }
}

- (void)setPassView:(id)a3 passUniqueID:(id)a4
{
  id v7;
  PKPassView **p_passView;
  PKPassView *passView;
  PKPassView *v10;

  v10 = (PKPassView *)a3;
  v7 = a4;
  if (-[NSString isEqualToString:](self->_passUniqueID, "isEqualToString:", v7))
  {
    p_passView = &self->_passView;
    passView = self->_passView;
    if (passView == v10)
      goto LABEL_7;
    goto LABEL_5;
  }
  objc_storeStrong((id *)&self->_passUniqueID, a4);
  p_passView = &self->_passView;
  passView = self->_passView;
  if (passView != v10)
  {
LABEL_5:
    -[PKPassView removePassViewObserver:](passView, "removePassViewObserver:", self);
    -[PKPassView addPassViewObserver:](v10, "addPassViewObserver:", self);
    objc_storeStrong((id *)p_passView, a3);
  }
  -[PKPassTileView _updateSubviewsAnimated:]((uint64_t)self, 1);
LABEL_7:

}

- (void)setContent:(id)a3
{
  -[PKPassTileView setContent:animated:](self, "setContent:animated:", a3, 0);
}

- (void)setContent:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void **p_content;
  PKPassView *passView;
  unint64_t lastPassStateHash;
  PKPassTile *v11;
  PKPassView *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *actionStateTimeout;
  OS_dispatch_source *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  BOOL v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;

  v4 = a4;
  v7 = a3;
  p_content = (void **)&self->_content;
  passView = self->_passView;
  lastPassStateHash = self->_lastPassStateHash;
  v11 = self->_content;
  v36 = v7;
  v12 = passView;
  if (!PKEqualObjects())
    goto LABEL_4;
  -[PKPassTile state](v11, "state");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "state");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13;
  v16 = v14;
  if (v15 != v16)
  {
LABEL_3:

LABEL_4:
    v17 = v36;
LABEL_5:
    if (v4 && !self->_deferringUpdate)
    {
      -[PKPassTileView layoutIfNeeded](self, "layoutIfNeeded", v17);
      v17 = v36;
    }
    v18 = +[PKPassTileView_State visuallyCompareTile:toTile:]((uint64_t)PKPassTileView_State, *p_content, v17);
    objc_storeStrong((id *)&self->_content, a3);
    objc_msgSend(*p_content, "axID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassTileView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v19);

    if (v18 != 2)
    {
      actionStateTimeout = self->_actionStateTimeout;
      if (actionStateTimeout)
      {
        dispatch_source_cancel(actionStateTimeout);
        v21 = self->_actionStateTimeout;
        self->_actionStateTimeout = 0;

      }
    }
    if (!self->_actionStateTimeout)
      self->_inActionState = objc_msgSend(*p_content, "isInProgress");
    -[PKPassTileView _updateContentStateAnimated:]((uint64_t)self, v4);
    goto LABEL_14;
  }
  -[PKPassView passState](v12, "passState");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "hash") == lastPassStateHash)
  {

LABEL_14:
    v17 = v36;
    goto LABEL_15;
  }
  v34 = v22;
  objc_msgSend(v15, "stateTypeDefaultV2");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "title");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "valueTypeForeignReference");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "foreignReferenceType");

  if (v25)
  {

    v16 = v15;
    goto LABEL_3;
  }
  v33 = v23;
  objc_msgSend(v35, "body");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "valueTypeForeignReference");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "foreignReferenceType");

  if (v28)
  {
    v29 = 1;
  }
  else
  {
    objc_msgSend(v35, "footer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "valueTypeForeignReference");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "foreignReferenceType");

    v29 = v32 != 0;
  }

  v17 = v36;
  if (v29)
    goto LABEL_5;
LABEL_15:

}

- (void)setInActionState:(BOOL)a3
{
  -[PKPassTileView setInActionState:animated:](self, "setInActionState:animated:", a3, 0);
}

- (void)setInActionState:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;

  if (self->_inActionState != a3)
  {
    v4 = a4;
    if (a4 && !self->_deferringUpdate)
      -[PKPassTileView layoutIfNeeded](self, "layoutIfNeeded");
    self->_inActionState = a3;
    -[PKPassTileView _updateContentStateAnimated:]((uint64_t)self, v4);
  }
}

- (void)setCompact:(BOOL)a3
{
  -[PKPassTileView setCompact:animated:](self, "setCompact:animated:", a3, 0);
}

- (void)setCompact:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;

  if (self->_compact != a3)
  {
    v4 = a4;
    if (a4 && !self->_deferringUpdate)
      -[PKPassTileView layoutIfNeeded](self, "layoutIfNeeded");
    self->_compact = a3;
    -[PKPassTileView _updateSubviewsAnimated:]((uint64_t)self, v4);
  }
}

- (void)setGroupStyle:(unint64_t)a3
{
  void (**v4)(void *, UILabel *);
  _QWORD aBlock[4];
  BOOL v6;

  if (self)
  {
    if (self->_groupStyle != a3)
    {
      self->_groupStyle = a3;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __41__PKPassTileView_setGroupStyle_animated___block_invoke;
      aBlock[3] = &__block_descriptor_33_e17_v16__0__UILabel_8l;
      v6 = a3 == 1;
      v4 = (void (**)(void *, UILabel *))_Block_copy(aBlock);
      v4[2](v4, self->_title);
      v4[2](v4, self->_body);
      v4[2](v4, self->_footer);
      -[PKPassTileView _updateSubviewsAnimated:]((uint64_t)self, 0);

    }
  }
}

uint64_t __41__PKPassTileView_setGroupStyle_animated___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;

  if (*(_BYTE *)(a1 + 32))
    v2 = 1;
  else
    v2 = 4;
  return objc_msgSend(a2, "setTextAlignment:", v2);
}

- (id)viewImageActionView
{
  return self->_bodyImage;
}

- (void)passView:(id)a3 didUpdatePassState:(id)a4
{
  -[PKPassTileView _updateSubviewsAnimated:]((uint64_t)self, 1);
}

- (PKPassTile)content
{
  return self->_content;
}

- (BOOL)isInActionState
{
  return self->_inActionState;
}

- (BOOL)isCompact
{
  return self->_compact;
}

- (unint64_t)groupStyle
{
  return self->_groupStyle;
}

- (unint64_t)overflowType
{
  return self->_overflowType;
}

- (void)setOverflowType:(unint64_t)a3
{
  self->_overflowType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_actionStateTimeout, 0);
  objc_storeStrong((id *)&self->_buttonFont, 0);
  objc_storeStrong((id *)&self->_footerFont, 0);
  objc_storeStrong((id *)&self->_bodyFont, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_iconFont, 0);
  objc_storeStrong((id *)&self->_regularFont, 0);
  objc_storeStrong((id *)&self->_significantFont, 0);
  objc_storeStrong((id *)&self->_snapshots, 0);
  objc_storeStrong((id *)&self->_effectiveContentTimeout, 0);
  objc_storeStrong((id *)&self->_passUniqueID, 0);
  objc_storeStrong((id *)&self->_hostedView, 0);
  objc_storeStrong((id *)&self->_passView, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_contentState, 0);
  objc_storeStrong((id *)&self->_secondaryImage, 0);
  objc_storeStrong((id *)&self->_accessoryImage, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_bodyImage, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
