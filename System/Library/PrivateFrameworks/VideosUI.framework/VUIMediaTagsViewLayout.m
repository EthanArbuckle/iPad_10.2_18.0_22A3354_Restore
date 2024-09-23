@implementation VUIMediaTagsViewLayout

- (VUITextLayout)textLayout
{
  return self->_textLayout;
}

- (void)setMargin:(UIEdgeInsets)a3
{
  self->_margin = a3;
}

- (void)setTimeTextBadgeLayout:(id)a3
{
  objc_storeStrong((id *)&self->_timeTextBadgeLayout, a3);
}

- (void)setMaxWidth:(double)a3
{
  self->_maxWidth = a3;
}

- (void)setLiveTextBadgeLayout:(id)a3
{
  objc_storeStrong((id *)&self->_liveTextBadgeLayout, a3);
}

- (void)setHighContrastBadgeTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_highContrastBadgeTintColor, a3);
}

- (void)setCenterAlign:(BOOL)a3
{
  self->_centerAlign = a3;
}

- (VUIMediaTagsViewLayout)initWithType:(unint64_t)a3
{
  char *v4;
  char *v5;
  _QWORD *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void **v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  double v72;
  void *v73;
  void *v74;
  void *v75;
  char v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  void *v100;
  objc_super v101;
  _QWORD v102[2];
  __CFString *v103;
  _QWORD v104[3];
  _QWORD v105[3];
  __CFString *v106;
  _QWORD v107[2];
  _QWORD v108[6];
  _QWORD v109[3];
  __CFString *v110;
  __CFString *v111;
  __CFString *v112;
  _QWORD v113[3];
  __CFString *v114;
  __CFString *v115;
  __CFString *v116;
  _QWORD v117[3];
  _QWORD v118[2];
  __CFString *v119;
  _QWORD v120[2];
  _QWORD v121[3];
  __CFString *v122;
  _QWORD v123[8];
  _QWORD v124[5];
  _QWORD v125[4];
  __CFString *v126;
  _QWORD v127[10];
  _QWORD v128[9];
  _QWORD v129[2];
  _QWORD v130[6];
  __CFString *v131;
  _QWORD v132[2];
  __CFString *v133;
  _QWORD v134[7];
  _QWORD v135[9];
  _QWORD v136[2];
  _QWORD v137[3];
  _QWORD v138[2];
  _QWORD v139[3];
  _QWORD v140[3];
  __CFString *v141;
  _QWORD v142[11];
  _QWORD v143[2];
  _QWORD v144[2];
  _QWORD v145[6];
  void *v146;
  _QWORD v147[6];
  void *v148;
  _QWORD v149[4];
  _QWORD v150[2];
  _QWORD v151[7];
  _QWORD v152[3];
  _QWORD v153[3];
  __CFString *v154;
  __CFString *v155;
  _QWORD v156[16];
  _QWORD v157[5];
  _QWORD v158[4];
  _QWORD v159[3];
  _QWORD v160[2];
  _QWORD v161[2];
  _QWORD v162[2];
  _QWORD v163[5];
  _QWORD v164[7];
  _QWORD v165[3];
  _QWORD v166[3];
  _QWORD v167[2];
  _QWORD v168[4];

  v168[2] = *MEMORY[0x1E0C80C00];
  v101.receiver = self;
  v101.super_class = (Class)VUIMediaTagsViewLayout;
  v4 = -[VUIMediaTagsViewLayout init](&v101, sel_init);
  v5 = v4;
  if (v4)
  {
    *((_QWORD *)v4 + 26) = 0;
    v6 = v4 + 208;
    *((_QWORD *)v4 + 2) = a3;
    *((_QWORD *)v4 + 27) = 0;
    *((_QWORD *)v4 + 28) = 0;
    *((_QWORD *)v4 + 29) = 0x4004000000000000;
    v4[12] = 0;
    *((_QWORD *)v4 + 13) = 0;
    v4[10] = 1;
    v7 = (void *)objc_opt_new();
    v8 = 0x1E0DC3000uLL;
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_opacityColorWithType:", 1);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)*((_QWORD *)v5 + 15);
    *((_QWORD *)v5 + 15) = v9;

    switch(a3)
    {
      case 0uLL:
        objc_msgSend(v7, "setColorWithOpacityType:", 0);
        objc_msgSend(v7, "setTextStyle:", 16);
        objc_msgSend(v7, "setFontWeight:", 10);
        objc_msgSend(v7, "setNumberOfLines:", 1);
        objc_msgSend(v7, "setAlignment:", 1);
        v16 = 0.0;
        v17 = 10.0;
        objc_msgSend(v7, "setMargin:", 0.0, 0.0, 0.0, 10.0);
        objc_msgSend(MEMORY[0x1E0DC3658], "vui_opacityColorWithType:", 0);
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = (void *)*((_QWORD *)v5 + 15);
        *((_QWORD *)v5 + 15) = v18;

        v20 = 2.0;
        v21 = 22.0;
        v22 = 2.0;
        goto LABEL_8;
      case 1uLL:
        v5[11] = 1;
        v23 = (void *)MEMORY[0x1E0DC3658];
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.7);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 1.0;
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.7);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "vui_dynamicColorWithLightColor:darkColor:", v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setColor:", v26);

        objc_msgSend(v7, "setTextStyle:", 15);
        v17 = 8.0;
        objc_msgSend(v7, "setMargin:", 4.0, 0.0, 4.0, 8.0);
        *v6 = 0;
        *((_QWORD *)v5 + 27) = 0;
        *((_OWORD *)v5 + 14) = xmmword_1DA1C1B70;
        objc_msgSend(v7, "setNumberOfLines:", 1);
        objc_msgSend(v7, "setAlignment:", 1);
        v20 = 6.0;
        v21 = 13.0;
        v16 = 6.0;
LABEL_8:
        *((double *)v5 + 14) = v21;
        *((double *)v5 + 46) = v20;
        *((double *)v5 + 47) = v17;
        *((double *)v5 + 48) = v16;
        *((double *)v5 + 49) = v17;
        *((_QWORD *)v5 + 31) = 0;
        *((_QWORD *)v5 + 32) = 0;
        *((_QWORD *)v5 + 30) = 0;
        *((double *)v5 + 33) = v22;
        *((_QWORD *)v5 + 35) = 0;
        *((_QWORD *)v5 + 36) = 0;
        *((_QWORD *)v5 + 34) = 0;
        *((double *)v5 + 37) = v22;
        v168[0] = VUIMediaTagKeyCommonSenseImage;
        v168[1] = VUIMediaTagKeyCommonSenseRating;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v168, 2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v167[0] = VUIMediaTagKeyTomatoFreshnessImage;
        v167[1] = VUIMediaTagKeyTomatoPercentage;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v167, 2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v166[0] = VUIMediaTagKeyRatingImage;
        v166[1] = VUIMediaTagKeyContentRatingAuxiliaryName;
        v166[2] = VUIMediaTagKeyVideoResolutionImage;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v166, 3);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v165[0] = VUIMediaTagKey3DImage;
        v165[1] = VUIMediaTagKeyImmersiveImage;
        v165[2] = VUIMediaTagKeyImmersiveText;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v165, 3);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v164[0] = VUIMediaTagKeyVideoDynamicRangeImage;
        v164[1] = VUIMediaTagKeyDolbyAtmosImage;
        v164[2] = VUIMediaTagKeyClosedCaptionImage;
        v164[3] = VUIMediaTagKeySDHLocalesImage;
        v164[4] = VUIMediaTagKeyADLocalesImage;
        v164[5] = VUIMediaTagKeyHighMotionImage;
        v164[6] = VUIMediaTagKeyHighMotionText;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v164, 7);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v163[0] = v12;
        v163[1] = v11;
        v163[2] = v27;
        v163[3] = v28;
        v163[4] = v29;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v163, 5);
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = (void *)*((_QWORD *)v5 + 11);
        *((_QWORD *)v5 + 11) = v30;

        v8 = 0x1E0DC3000uLL;
        goto LABEL_31;
      case 2uLL:
        objc_msgSend(v7, "setTextStyle:", 15);
        objc_msgSend(v7, "setFontWeight:", 10);
        objc_msgSend(MEMORY[0x1E0DC3658], "vui_secondaryTextColor");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setColor:", v32);

        *v6 = 0;
        *((_QWORD *)v5 + 27) = 0;
        *((_OWORD *)v5 + 14) = xmmword_1DA1C1B60;
        objc_msgSend(v7, "setMargin:", 4.0, 0.0, 4.0, 3.0);
        objc_msgSend(v7, "setNumberOfLines:", 1);
        objc_msgSend(v7, "setAlignment:", 1);
        *((_QWORD *)v5 + 14) = 0x402A000000000000;
        v156[0] = VUIMediaTagKeyEpisodeNumberTitle;
        v156[1] = VUIMediaTagKeySeparator;
        v156[2] = VUIMediaTagKeyGenre;
        v156[3] = VUIMediaTagKeySeparator;
        v156[4] = VUIMediaTagKeyReleasedDate;
        v156[5] = VUIMediaTagKeySeparator;
        v156[6] = VUIMediaTagKeyComingSoonText;
        v156[7] = VUIMediaTagKeySeparator;
        v156[8] = VUIMediaTagKeyContentUnavailabilityText;
        v156[9] = VUIMediaTagKeySeparator;
        v156[10] = VUIMediaTagKeyRentalExpiration;
        v156[11] = VUIMediaTagKeySeparator;
        v156[12] = VUIMediaTagKeyDuration;
        v156[13] = VUIMediaTagKeySeparator;
        v156[14] = VUIMediaTagKeyAvailabilityText;
        v156[15] = VUIMediaTagKeyAvailabilityImage;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v156, 16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v155 = VUIMediaTagKeyGroupActivityImage;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v155, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v154 = VUIMediaTagKeyBrandLinkButton;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v154, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v153[0] = v11;
        v153[1] = v12;
        v153[2] = v13;
        v8 = 0x1E0DC3000uLL;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v153, 3);
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = (void *)*((_QWORD *)v5 + 11);
        *((_QWORD *)v5 + 11) = v33;

        v5[12] = 1;
        goto LABEL_22;
      case 4uLL:
        objc_msgSend(v7, "setTextStyle:", 17);
        objc_msgSend(v7, "setMargin:", 42.0, 0.0, 23.0, 10.0);
        *((_QWORD *)v5 + 14) = 0x4036000000000000;
        *((_OWORD *)v5 + 23) = xmmword_1DA1C1B50;
        *((_OWORD *)v5 + 24) = xmmword_1DA1C1B50;
        objc_msgSend(v5, "setMargin:", 0.0, 0.0, 50.0, 0.0);
        objc_msgSend(v7, "setColorWithOpacityType:", 1);
        objc_msgSend(v7, "setNumberOfLines:", 1);
        objc_msgSend(v7, "setAlignment:", 1);
        objc_storeStrong((id *)v5 + 3, v7);
        objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setBackgroundColor:", v41);

        v5[11] = 1;
LABEL_15:
        v152[0] = VUIMediaTagKeyDuration;
        v152[1] = VUIMediaTagKeySeparator;
        v152[2] = VUIMediaTagKeyReleasedDate;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v152, 3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v151[0] = VUIMediaTagKeyRatingImage;
        v151[1] = VUIMediaTagKeyContentRatingAuxiliaryName;
        v151[2] = VUIMediaTagKeyVideoDynamicRangeImage;
        v151[3] = VUIMediaTagKeyVideoResolutionImage;
        v151[4] = VUIMediaTagKeyClosedCaptionImage;
        v151[5] = VUIMediaTagKeySDHLocalesImage;
        v151[6] = VUIMediaTagKeyADLocalesImage;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v151, 7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v150[0] = v11;
        v150[1] = v12;
        v42 = (void *)MEMORY[0x1E0C99D20];
        v43 = v150;
        goto LABEL_30;
      case 5uLL:
        *((_QWORD *)v5 + 22) = 0x4018000000000000;
        *(_OWORD *)(v5 + 184) = 0u;
        *(_OWORD *)(v5 + 200) = 0u;
        *(_OWORD *)(v5 + 216) = 0u;
        *((_QWORD *)v5 + 29) = 0;
        *((_WORD *)v5 + 5) = 257;
        objc_msgSend(v7, "setTextStyle:", 16);
        objc_msgSend(v7, "setMargin:", 2.0, 0.0, 2.0, 4.0);
        objc_msgSend(MEMORY[0x1E0DC3658], "vui_secondaryTextColor");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setColor:", v44);

        objc_msgSend(MEMORY[0x1E0DC3658], "vui_secondaryTextColor");
        v45 = objc_claimAutoreleasedReturnValue();
        v46 = (void *)*((_QWORD *)v5 + 15);
        *((_QWORD *)v5 + 15) = v45;

        objc_msgSend(v7, "setNumberOfLines:", 1);
        *((_QWORD *)v5 + 14) = 0x4026000000000000;
        *((_OWORD *)v5 + 23) = xmmword_1DA1C1B30;
        *((_OWORD *)v5 + 24) = xmmword_1DA1C1B40;
LABEL_17:
        v162[0] = VUIMediaTagKeyVideoResolutionImage;
        v162[1] = VUIMediaTagKey3DImage;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v162, 2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v161[0] = VUIMediaTagKeyImmersiveImage;
        v161[1] = VUIMediaTagKeyImmersiveText;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v161, 2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v160[0] = VUIMediaTagKeyVideoDynamicRangeImage;
        v160[1] = VUIMediaTagKeyDolbyAtmosImage;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v160, 2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v159[0] = VUIMediaTagKeyClosedCaptionImage;
        v159[1] = VUIMediaTagKeySDHLocalesImage;
        v159[2] = VUIMediaTagKeyADLocalesImage;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v159, 3);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v158[0] = VUIMediaTagKeySeparator;
        v158[1] = VUIMediaTagKeyVersionCount;
        v158[2] = VUIMediaTagKeySeparator;
        v158[3] = VUIMediaTagKeySubtitle;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v158, 4);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v157[0] = v11;
        v157[1] = v12;
        v157[2] = v13;
        v157[3] = v38;
        v157[4] = v47;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v157, 5);
        v48 = objc_claimAutoreleasedReturnValue();
        v49 = (void *)*((_QWORD *)v5 + 11);
        *((_QWORD *)v5 + 11) = v48;

        v8 = 0x1E0DC3000uLL;
        goto LABEL_18;
      case 6uLL:
        objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
        v50 = objc_claimAutoreleasedReturnValue();
        v51 = (void *)*((_QWORD *)v5 + 15);
        *((_QWORD *)v5 + 15) = v50;

        *((_QWORD *)v5 + 14) = 0x4024000000000000;
        *((_QWORD *)v5 + 46) = 0;
        *((_QWORD *)v5 + 47) = 0;
        *((_QWORD *)v5 + 48) = 0;
        *((_QWORD *)v5 + 49) = 0x4010000000000000;
LABEL_20:
        v108[0] = VUIMediaTagKeyVideoResolutionImage;
        v108[1] = VUIMediaTagKeyVideoDynamicRangeImage;
        v108[2] = VUIMediaTagKeyRatingImage;
        v108[3] = VUIMediaTagKeyDolbyAtmosImage;
        v108[4] = VUIMediaTagKeySDHLocalesImage;
        v108[5] = VUIMediaTagKeyADLocalesImage;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v108, 6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v107[0] = VUIMediaTagKeyImmersiveImage;
        v107[1] = VUIMediaTagKeyImmersiveText;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v107, 2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v106 = VUIMediaTagKey3DImage;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v106, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v105[0] = v11;
        v105[1] = v12;
        v105[2] = v13;
        v14 = (void *)MEMORY[0x1E0C99D20];
        v15 = v105;
        goto LABEL_21;
      case 7uLL:
        objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
        v54 = objc_claimAutoreleasedReturnValue();
        v55 = (void *)*((_QWORD *)v5 + 15);
        *((_QWORD *)v5 + 15) = v54;

        *((_QWORD *)v5 + 14) = 0x4028000000000000;
        *((_OWORD *)v5 + 23) = xmmword_1DA1C1B20;
        *((_OWORD *)v5 + 24) = xmmword_1DA1C1B20;
LABEL_24:
        v147[0] = VUIMediaTagKeyRatingImage;
        v147[1] = VUIMediaTagKeyContentRatingAuxiliaryName;
        v147[2] = VUIMediaTagKeyVideoResolutionImage;
        v147[3] = VUIMediaTagKeyVideoDynamicRangeImage;
        v147[4] = VUIMediaTagKeyDolbyAtmosImage;
        v147[5] = VUIMediaTagKeyItunesExtras;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v147, 6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v146 = v11;
        v56 = (void *)MEMORY[0x1E0C99D20];
        v57 = &v146;
        goto LABEL_27;
      case 8uLL:
        objc_msgSend(v7, "setTextStyle:", 20);
        objc_msgSend(v7, "setFontWeight:", 0);
        objc_msgSend(v7, "setNumberOfLines:", 1);
        objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setColor:", v58);

        objc_msgSend(v7, "setMargin:", 0.0, 5.0, 0.0, 5.0);
LABEL_26:
        v149[0] = VUIMediaTagKeyGenre;
        v149[1] = VUIMediaTagKeySeparator;
        v149[2] = VUIMediaTagKeyReleasedDate;
        v149[3] = VUIMediaTagKeyDuration;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v149, 4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v148 = v11;
        v56 = (void *)MEMORY[0x1E0C99D20];
        v57 = &v148;
LABEL_27:
        objc_msgSend(v56, "arrayWithObjects:count:", v57, 1);
        v59 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)*((_QWORD *)v5 + 11);
        *((_QWORD *)v5 + 11) = v59;
        goto LABEL_31;
      case 9uLL:
      case 0xAuLL:
      case 0x11uLL:
LABEL_3:
        v142[0] = VUIMediaTagKeyGenre;
        v142[1] = VUIMediaTagKeySeparator;
        v142[2] = VUIMediaTagKeyReleasedDate;
        v142[3] = VUIMediaTagKeySeparator;
        v142[4] = VUIMediaTagKeyDuration;
        v142[5] = VUIMediaTagKeySeparator;
        v142[6] = VUIMediaTagKeySubtitle;
        v142[7] = VUIMediaTagKeySeparator;
        v142[8] = VUIMediaTagKeyLeagueShortName;
        v142[9] = VUIMediaTagKeySeparator;
        v142[10] = VUIMediaTagKeyGameStartTime;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v142, 11);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v141 = VUIMediaTagKey3DImage;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v141, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (a3 == 17)
        {
          v140[0] = VUIMediaTagKeySeparator;
          v140[1] = VUIMediaTagKeyImmersiveImage;
          v140[2] = VUIMediaTagKeyImmersiveText;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v140, 3);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v139[0] = v11;
          v139[1] = v12;
          v139[2] = v13;
          v14 = (void *)MEMORY[0x1E0C99D20];
          v15 = v139;
        }
        else
        {
          v138[0] = VUIMediaTagKeyImmersiveImage;
          v138[1] = VUIMediaTagKeyImmersiveText;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v138, 2);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v137[0] = v11;
          v137[1] = v13;
          v137[2] = v12;
          v14 = (void *)MEMORY[0x1E0C99D20];
          v15 = v137;
        }
LABEL_21:
        objc_msgSend(v14, "arrayWithObjects:count:", v15, 3);
        v52 = objc_claimAutoreleasedReturnValue();
        v53 = (void *)*((_QWORD *)v5 + 11);
        *((_QWORD *)v5 + 11) = v52;

        goto LABEL_22;
      case 0xBuLL:
        *v6 = 0;
        *((_QWORD *)v5 + 27) = 0;
        *((_QWORD *)v5 + 28) = 0;
        *((_QWORD *)v5 + 29) = 0x4010000000000000;
        objc_msgSend(MEMORY[0x1E0DC3658], "vui_secondaryTextColor");
        v60 = objc_claimAutoreleasedReturnValue();
        v61 = (void *)*((_QWORD *)v5 + 15);
        *((_QWORD *)v5 + 15) = v60;

        objc_msgSend(MEMORY[0x1E0DC3658], "vui_secondaryTextColor");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setColor:", v62);

        objc_msgSend(v7, "setTextStyle:", 15);
        *((_WORD *)v5 + 4) = 257;
        objc_msgSend(v7, "setMargin:", 0.0, 4.0, 4.0, 4.0);
        objc_msgSend(v7, "setNumberOfLines:", 1);
        objc_msgSend(v7, "setAlignment:", 1);
        *((_QWORD *)v5 + 14) = 0x4028000000000000;
        v5[11] = 1;
LABEL_29:
        v145[0] = VUIMediaTagKeyGenre;
        v145[1] = VUIMediaTagKeySeparator;
        v145[2] = VUIMediaTagKeyReleasedDate;
        v145[3] = VUIMediaTagKeySeparator;
        v145[4] = VUIMediaTagKeyDuration;
        v145[5] = VUIMediaTagKeySeparator;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v145, 6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v144[0] = VUIMediaTagKeyRatingImage;
        v144[1] = VUIMediaTagKeyContentRatingAuxiliaryName;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v144, 2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v143[0] = v11;
        v143[1] = v12;
        v42 = (void *)MEMORY[0x1E0C99D20];
        v43 = v143;
LABEL_30:
        objc_msgSend(v42, "arrayWithObjects:count:", v43, 2);
        v63 = objc_claimAutoreleasedReturnValue();
        v64 = (void *)*((_QWORD *)v5 + 11);
        *((_QWORD *)v5 + 11) = v63;

        goto LABEL_31;
      default:
        if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 0xC)
        {
          objc_msgSend(MEMORY[0x1E0DC3658], "vui_secondaryTextColor");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setColor:", v35);

          objc_msgSend(v7, "setNumberOfLines:", 2);
          objc_msgSend(v7, "setAlignment:", 1);
          objc_msgSend(v7, "setMargin:", 0.0, 5.0, 0.0, 5.0);
          *v6 = 0;
          *((_QWORD *)v5 + 27) = 0;
          *((_QWORD *)v5 + 28) = 0;
          *((_QWORD *)v5 + 29) = 0x4014000000000000;
          *((_QWORD *)v5 + 50) = 0;
          *((_QWORD *)v5 + 51) = 0;
          *((_QWORD *)v5 + 52) = 0;
          *((_QWORD *)v5 + 53) = 0x401C000000000000;
          *((_QWORD *)v5 + 14) = 0x4028000000000000;
          objc_msgSend(v7, "setTextStyle:", 15);
          objc_msgSend(v7, "setFontWeight:", 10);
          objc_msgSend(MEMORY[0x1E0DC3658], "vui_secondaryTextColor");
          v36 = objc_claimAutoreleasedReturnValue();
          v37 = (void *)*((_QWORD *)v5 + 15);
          *((_QWORD *)v5 + 15) = v36;

          v5[11] = 1;
          *(_WORD *)(v5 + 9) = 257;
          if (a3 == 12)
          {
LABEL_39:
            v136[0] = VUIMediaTagKeyLiveTextBadge;
            v136[1] = VUIMediaTagKeyTimeTextBadge;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v136, 2);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v135[0] = VUIMediaTagKeyLeagueShortName;
            v135[1] = VUIMediaTagKeySeparator;
            v135[2] = VUIMediaTagKeyGenre;
            v135[3] = VUIMediaTagKeySeparator;
            v135[4] = VUIMediaTagKeyTeamAbbreviation;
            v135[5] = VUIMediaTagKeySeparator;
            v135[6] = VUIMediaTagKeyDuration;
            v135[7] = VUIMediaTagKeySeparator;
            v135[8] = VUIMediaTagKeySeasonCount;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v135, 9);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v134[0] = VUIMediaTagKeyTitle;
            v134[1] = VUIMediaTagKeySeparator;
            v134[2] = VUIMediaTagKeyShootoutsText;
            v134[3] = VUIMediaTagKeySeparator;
            v134[4] = VUIMediaTagKeyGameStartTime;
            v134[5] = VUIMediaTagKeySeparator;
            v134[6] = VUIMediaTagKeyChannel;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v134, 7);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v133 = VUIMediaTagKeyRatingImage;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v133, 1);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v132[0] = VUIMediaTagKeyImmersiveImage;
            v132[1] = VUIMediaTagKeyImmersiveText;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v132, 2);
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            v131 = VUIMediaTagKey3DImage;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v131, 1);
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            v130[0] = v11;
            v130[1] = v12;
            v130[2] = v38;
            v130[3] = v87;
            v130[4] = v88;
            v130[5] = v13;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v130, 6);
            v89 = objc_claimAutoreleasedReturnValue();
            v90 = (void *)*((_QWORD *)v5 + 11);
            *((_QWORD *)v5 + 11) = v89;

            v8 = 0x1E0DC3000;
          }
          else
          {
            if (a3 != 13)
              goto LABEL_32;
LABEL_13:
            v129[0] = VUIMediaTagKeyLiveTextBadge;
            v129[1] = VUIMediaTagKeyTimeTextBadge;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v129, 2);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v128[0] = VUIMediaTagKeyLeagueShortName;
            v128[1] = VUIMediaTagKeySeparator;
            v128[2] = VUIMediaTagKeyGenre;
            v128[3] = VUIMediaTagKeySeparator;
            v128[4] = VUIMediaTagKeyTeamAbbreviation;
            v128[5] = VUIMediaTagKeySeparator;
            v128[6] = VUIMediaTagKeyDuration;
            v128[7] = VUIMediaTagKeySeparator;
            v128[8] = VUIMediaTagKeySeasonCount;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v128, 9);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v127[0] = VUIMediaTagKeyTitle;
            v127[1] = VUIMediaTagKeySeparator;
            v127[2] = VUIMediaTagKeyShootoutsText;
            v127[3] = VUIMediaTagKeySeparator;
            v127[4] = VUIMediaTagKeyGameStartTime;
            v127[5] = VUIMediaTagKeySeparator;
            v127[6] = VUIMediaTagKeyChannel;
            v127[7] = VUIMediaTagKeySeparator;
            v127[8] = VUIMediaTagKeyImmersiveImage;
            v127[9] = VUIMediaTagKeyImmersiveText;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v127, 10);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v126 = VUIMediaTagKeyRatingImage;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v126, 1);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v125[0] = v11;
            v125[1] = v12;
            v125[2] = v38;
            v125[3] = v13;
            v8 = 0x1E0DC3000uLL;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v125, 4);
            v39 = objc_claimAutoreleasedReturnValue();
            v40 = (void *)*((_QWORD *)v5 + 11);
            *((_QWORD *)v5 + 11) = v39;

          }
LABEL_18:

LABEL_22:
LABEL_31:

        }
        else
        {
          switch(a3)
          {
            case 3uLL:
              objc_msgSend(v7, "setNumberOfLines:", 2);
              objc_msgSend(MEMORY[0x1E0DC3658], "vui_secondaryTextColor");
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "setColor:", v84);

              objc_msgSend(v7, "setAlignment:", 1);
              objc_msgSend(v7, "setMargin:", 0.0, 5.0, 0.0, 5.0);
              *v6 = 0;
              *((_QWORD *)v5 + 27) = 0;
              *((_QWORD *)v5 + 28) = 0;
              *((_QWORD *)v5 + 29) = 0x4014000000000000;
              *((_QWORD *)v5 + 14) = 0x4028000000000000;
              objc_msgSend(v7, "setTextStyle:", 15);
              objc_msgSend(v7, "setFontWeight:", 10);
              objc_msgSend(MEMORY[0x1E0DC3658], "vui_secondaryTextColor");
              v85 = objc_claimAutoreleasedReturnValue();
              v86 = (void *)*((_QWORD *)v5 + 15);
              *((_QWORD *)v5 + 15) = v85;

              v5[11] = 1;
              *(_WORD *)(v5 + 9) = 257;
              v124[0] = VUIMediaTagKeyGenre;
              v124[1] = VUIMediaTagKeySeparator;
              v124[2] = VUIMediaTagKeyDuration;
              v124[3] = VUIMediaTagKeySeparator;
              v124[4] = VUIMediaTagKeySeasonCount;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v124, 5);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v123[0] = VUIMediaTagKeyChannel;
              v123[1] = VUIMediaTagKeySeparator;
              v123[2] = VUIMediaTagKeyGameVenue;
              v123[3] = VUIMediaTagKeySeparator;
              v123[4] = VUIMediaTagKeyGameStartTime;
              v123[5] = VUIMediaTagKeySeparator;
              v123[6] = VUIMediaTagKeyImmersiveImage;
              v123[7] = VUIMediaTagKeyImmersiveText;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v123, 8);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v122 = VUIMediaTagKeyRatingImage;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v122, 1);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v121[0] = v11;
              v121[1] = v13;
              v121[2] = v12;
              v14 = (void *)MEMORY[0x1E0C99D20];
              v15 = v121;
              goto LABEL_21;
            case 4uLL:
              goto LABEL_15;
            case 5uLL:
              goto LABEL_17;
            case 6uLL:
              goto LABEL_20;
            case 7uLL:
              goto LABEL_24;
            case 8uLL:
              goto LABEL_26;
            case 9uLL:
            case 0xAuLL:
            case 0x11uLL:
              goto LABEL_3;
            case 0xBuLL:
              goto LABEL_29;
            case 0xCuLL:
              goto LABEL_39;
            case 0xDuLL:
              goto LABEL_13;
            case 0xEuLL:
              objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryTextColor");
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "setColor:", v91);

              objc_msgSend(v7, "setTextStyle:", 16);
              objc_msgSend(v7, "setFontWeight:", 5);
              objc_msgSend(v7, "setNumberOfLines:", 0);
              objc_msgSend(v7, "setAlignment:", 1);
              objc_msgSend(v7, "setMargin:", 0.0, 0.0, 10.0, 0.0);
              *v6 = 0;
              *((_QWORD *)v5 + 27) = 0;
              *((_QWORD *)v5 + 28) = 0;
              *((_QWORD *)v5 + 29) = 0x4014000000000000;
              *((_QWORD *)v5 + 14) = 0x4036000000000000;
              objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryTextColor");
              v92 = objc_claimAutoreleasedReturnValue();
              v93 = (void *)*((_QWORD *)v5 + 15);
              *((_QWORD *)v5 + 15) = v92;

              v5[11] = 1;
              *(_WORD *)(v5 + 9) = 257;
              v120[0] = VUIMediaTagKeySeasonEpisode;
              v120[1] = VUIMediaTagKeyGenre;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v120, 2);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v119 = VUIMediaTagKeySeparator;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v119, 1);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v118[0] = VUIMediaTagKeyRatingImage;
              v118[1] = VUIMediaTagKeyTitle;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v118, 2);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v117[0] = v11;
              v117[1] = v12;
              v117[2] = v13;
              v14 = (void *)MEMORY[0x1E0C99D20];
              v15 = v117;
              goto LABEL_21;
            case 0xFuLL:
              objc_msgSend(MEMORY[0x1E0DC3658], "vui_secondaryTextColor");
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "setColor:", v94);

              objc_msgSend(v7, "setTextStyle:", 16);
              objc_msgSend(v7, "setFontWeight:", 5);
              objc_msgSend(v7, "setNumberOfLines:", 0);
              objc_msgSend(v7, "setAlignment:", 1);
              objc_msgSend(v7, "setMargin:", 0.0, 0.0, 6.0, 0.0);
              *v6 = 0;
              *((_QWORD *)v5 + 27) = 0;
              *((_QWORD *)v5 + 28) = 0;
              *((_QWORD *)v5 + 29) = 0x4014000000000000;
              *((_QWORD *)v5 + 14) = 0x403A000000000000;
              objc_msgSend(MEMORY[0x1E0DC3658], "vui_secondaryTextColor");
              v95 = objc_claimAutoreleasedReturnValue();
              v96 = (void *)*((_QWORD *)v5 + 15);
              *((_QWORD *)v5 + 15) = v95;

              *(_WORD *)(v5 + 9) = 257;
              v5[11] = 1;
              *((_QWORD *)v5 + 46) = 0x3FF0000000000000;
              *((_QWORD *)v5 + 47) = 0;
              *((_QWORD *)v5 + 48) = 0;
              *((_QWORD *)v5 + 49) = 0;
              v116 = VUIMediaTagKeyGenre;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v116, 1);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v115 = VUIMediaTagKeyRatingImage;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v115, 1);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v114 = VUIMediaTagKeySeparator;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v114, 1);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v113[0] = v11;
              v113[1] = v13;
              v113[2] = v12;
              v14 = (void *)MEMORY[0x1E0C99D20];
              v15 = v113;
              goto LABEL_21;
            case 0x10uLL:
              objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryTextColor");
              v97 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "setColor:", v97);

              objc_msgSend(v7, "setTextStyle:", 13);
              objc_msgSend(v7, "setFontWeight:", 5);
              objc_msgSend(v7, "setNumberOfLines:", 0);
              objc_msgSend(v7, "setAlignment:", 1);
              objc_msgSend(v7, "setMargin:", 0.0, 0.0, 6.0, 0.0);
              *v6 = 0;
              *((_QWORD *)v5 + 27) = 0;
              *((_QWORD *)v5 + 28) = 0;
              *((_QWORD *)v5 + 29) = 0x4014000000000000;
              *(_WORD *)(v5 + 9) = 257;
              v112 = VUIMediaTagKeySeasonEpisode;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v112, 1);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v111 = VUIMediaTagKeySeparator;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v111, 1);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v110 = VUIMediaTagKeyTitle;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v110, 1);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v109[0] = v11;
              v109[1] = v12;
              v109[2] = v13;
              v14 = (void *)MEMORY[0x1E0C99D20];
              v15 = v109;
              goto LABEL_21;
            case 0x12uLL:
              objc_msgSend(MEMORY[0x1E0DC3658], "vui_secondaryTextColor");
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "setColor:", v98);

              objc_msgSend(v7, "setTextStyle:", 15);
              objc_msgSend(v7, "setFontWeight:", 10);
              objc_msgSend(v7, "setNumberOfLines:", 2);
              objc_msgSend(v7, "setAlignment:", 1);
              objc_msgSend(v7, "setMargin:", 0.0, 0.0, 0.0, 8.0);
              objc_msgSend(MEMORY[0x1E0DC3658], "vui_secondaryTextColor");
              v99 = objc_claimAutoreleasedReturnValue();
              v100 = (void *)*((_QWORD *)v5 + 15);
              *((_QWORD *)v5 + 15) = v99;

              *((_QWORD *)v5 + 14) = 0x402A000000000000;
              v5[9] = 1;
              v5[11] = 1;
              v104[0] = VUIMediaTagKeyGenre;
              v104[1] = VUIMediaTagKeySeparator;
              v104[2] = VUIMediaTagKeyDuration;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v104, 3);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v103 = VUIMediaTagKeyRatingImage;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v103, 1);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v102[0] = v11;
              v102[1] = v12;
              v42 = (void *)MEMORY[0x1E0C99D20];
              v43 = v102;
              goto LABEL_30;
            default:
              break;
          }
        }
LABEL_32:
        objc_storeStrong((id *)v5 + 3, v7);
        v65 = objc_msgSend(v7, "copy");
        v66 = (void *)*((_QWORD *)v5 + 6);
        *((_QWORD *)v5 + 6) = v65;

        v67 = objc_opt_new();
        v68 = (void *)*((_QWORD *)v5 + 7);
        *((_QWORD *)v5 + 7) = v67;

        objc_msgSend(*((id *)v5 + 7), "setTextStyle:", 17);
        objc_msgSend(*((id *)v5 + 7), "setFontWeight:", 5);
        objc_msgSend(*((id *)v5 + 7), "setNumberOfLines:", 1);
        v69 = (void *)*((_QWORD *)v5 + 7);
        objc_msgSend(*(id *)(v8 + 1624), "vui_opacityColorWithType:", 1);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "setColor:", v70);

        objc_msgSend(*((id *)v5 + 7), "setPadding:", 0.5, 0.0, 0.0, 0.0);
        v71 = (void *)*((_QWORD *)v5 + 7);
        LODWORD(v72) = -0.5;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v72);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "setLetterSpacing:", v73);

        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1EA0B9208, &unk_1EA0B9220, &unk_1EA0B9238, 0);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        if (a3)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = objc_msgSend(v74, "containsObject:", v75);

          if ((v76 & 1) == 0)
            objc_msgSend(*((id *)v5 + 7), "setTextTransform:", 2);
        }
        *((_QWORD *)v5 + 38) = 0;
        *((_QWORD *)v5 + 39) = 0;
        *((_QWORD *)v5 + 40) = 0;
        *((_QWORD *)v5 + 41) = 0x4010000000000000;
        v77 = objc_opt_new();
        v78 = (void *)*((_QWORD *)v5 + 8);
        *((_QWORD *)v5 + 8) = v77;

        objc_msgSend(*((id *)v5 + 8), "setNumberOfLines:", 2);
        v79 = (void *)*((_QWORD *)v5 + 8);
        objc_msgSend(*((id *)v5 + 3), "color");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "setColor:", v80);

        v81 = (void *)*((_QWORD *)v5 + 8);
        objc_msgSend(*((id *)v5 + 3), "darkColor");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "setDarkColor:", v82);

        objc_msgSend(*((id *)v5 + 8), "setFontWeight:", 6);
        objc_msgSend(v5, "updateHighMotionFontSize");
        *((_QWORD *)v5 + 42) = 0;
        *((_QWORD *)v5 + 43) = 0;
        *((_QWORD *)v5 + 44) = 0;
        *((_QWORD *)v5 + 45) = 0x4010000000000000;

        break;
    }
  }
  return (VUIMediaTagsViewLayout *)v5;
}

- (BOOL)orphanAvoidance
{
  return self->_orphanAvoidance;
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (UIEdgeInsets)margin
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_margin.top;
  left = self->_margin.left;
  bottom = self->_margin.bottom;
  right = self->_margin.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)isWrappingAllowed
{
  return self->_wrappingAllowed;
}

- (NSArray)groupedKeys
{
  return self->_groupedKeys;
}

- (UIEdgeInsets)groupMargin
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_groupMargin.top;
  left = self->_groupMargin.left;
  bottom = self->_groupMargin.bottom;
  right = self->_groupMargin.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (NSString)compositingFilter
{
  return self->_compositingFilter;
}

- (BOOL)centerAlign
{
  return self->_centerAlign;
}

- (UIColor)badgeTintColor
{
  return self->_badgeTintColor;
}

- (double)badgeMaxHeight
{
  return self->_badgeMaxHeight;
}

- (UIEdgeInsets)badgeMargin
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_badgeMargin.top;
  left = self->_badgeMargin.left;
  bottom = self->_badgeMargin.bottom;
  right = self->_badgeMargin.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)alignBadgeVertically
{
  return self->_alignBadgeVertically;
}

- (VUIMediaTagsViewLayout)init
{
  return -[VUIMediaTagsViewLayout initWithType:](self, "initWithType:", 0);
}

- (void)updateHighMotionFontSize
{
  objc_msgSend(MEMORY[0x1E0DC69B0], "scaleContentSizeValue:forTraitCollection:", 0, 8.0);
  -[VUITextLayout setFontSize:](self->_highMotionTextLayout, "setFontSize:");
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (VUITextBadgeLayout)liveTextBadgeLayout
{
  return self->_liveTextBadgeLayout;
}

- (VUITextBadgeLayout)timeTextBadgeLayout
{
  return self->_timeTextBadgeLayout;
}

- (VUITextLayout)rentalExpirationTextLayout
{
  return self->_rentalExpirationTextLayout;
}

- (VUITextLayout)immersiveTextLayout
{
  return self->_immersiveTextLayout;
}

- (VUITextLayout)highMotionTextLayout
{
  return self->_highMotionTextLayout;
}

- (UIEdgeInsets)padding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_padding.top;
  left = self->_padding.left;
  bottom = self->_padding.bottom;
  right = self->_padding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (NSShadow)shadow
{
  return self->_shadow;
}

- (void)setShadow:(id)a3
{
  objc_storeStrong((id *)&self->_shadow, a3);
}

- (void)setGroupMargin:(UIEdgeInsets)a3
{
  self->_groupMargin = a3;
}

- (UIEdgeInsets)commonSenseMargin
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_commonSenseMargin.top;
  left = self->_commonSenseMargin.left;
  bottom = self->_commonSenseMargin.bottom;
  right = self->_commonSenseMargin.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)tomatoMeterMargin
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_tomatoMeterMargin.top;
  left = self->_tomatoMeterMargin.left;
  bottom = self->_tomatoMeterMargin.bottom;
  right = self->_tomatoMeterMargin.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)immersiveMargin
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_immersiveMargin.top;
  left = self->_immersiveMargin.left;
  bottom = self->_immersiveMargin.bottom;
  right = self->_immersiveMargin.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)highMotionMargin
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_highMotionMargin.top;
  left = self->_highMotionMargin.left;
  bottom = self->_highMotionMargin.bottom;
  right = self->_highMotionMargin.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setCompositingFilter:(id)a3
{
  objc_storeStrong((id *)&self->_compositingFilter, a3);
}

- (void)setAlignBadgeVertically:(BOOL)a3
{
  self->_alignBadgeVertically = a3;
}

- (void)setBadgeMaxHeight:(double)a3
{
  self->_badgeMaxHeight = a3;
}

- (void)setBadgeMargin:(UIEdgeInsets)a3
{
  self->_badgeMargin = a3;
}

- (void)setBadgeTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_badgeTintColor, a3);
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (void)setHighlightColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightColor, a3);
}

- (UIColor)highContrastBadgeTintColor
{
  return self->_highContrastBadgeTintColor;
}

- (UIEdgeInsets)textBadgeMargin
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_textBadgeMargin.top;
  left = self->_textBadgeMargin.left;
  bottom = self->_textBadgeMargin.bottom;
  right = self->_textBadgeMargin.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setTextBadgeMargin:(UIEdgeInsets)a3
{
  self->_textBadgeMargin = a3;
}

- (BOOL)isGroupActivityTagEnabled
{
  return self->_groupActivityTagEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highContrastBadgeTintColor, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_badgeTintColor, 0);
  objc_storeStrong((id *)&self->_compositingFilter, 0);
  objc_storeStrong((id *)&self->_groupedKeys, 0);
  objc_storeStrong((id *)&self->_shadow, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_highMotionTextLayout, 0);
  objc_storeStrong((id *)&self->_immersiveTextLayout, 0);
  objc_storeStrong((id *)&self->_rentalExpirationTextLayout, 0);
  objc_storeStrong((id *)&self->_timeTextBadgeLayout, 0);
  objc_storeStrong((id *)&self->_liveTextBadgeLayout, 0);
  objc_storeStrong((id *)&self->_textLayout, 0);
}

@end
