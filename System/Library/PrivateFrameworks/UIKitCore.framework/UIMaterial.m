@implementation UIMaterial

void __30___UIMaterial_materialMapping__block_invoke()
{
  void *v0;
  uint64_t v1;
  id v2;
  id *v3;
  void *v4;
  _UIMaterial *v5;
  id *v6;
  id *v7;
  void *v8;
  _UIMaterial *v9;
  id *v10;
  id *v11;
  void *v12;
  _UIMaterial *v13;
  id *v14;
  id *v15;
  void *v16;
  _UIMaterial *v17;
  id *v18;
  id *v19;
  void *v20;
  _UIMaterial *v21;
  id *v22;
  id *v23;
  void *v24;
  _UIMaterial *v25;
  id *v26;
  id *v27;
  void *v28;
  _UIMaterial *v29;
  id *v30;
  id *v31;
  void *v32;
  _UIMaterial *v33;
  id *v34;
  id *v35;
  void *v36;
  _UIMaterial *v37;
  id *v38;
  id *v39;
  void *v40;
  _UIMaterial *v41;
  id *v42;
  id *v43;
  void *v44;
  _UIMaterial *v45;
  id *v46;
  id *v47;
  _UIMaterial *v48;
  _UIMaterial *v49;
  _UIMaterial *v50;
  _UIMaterial *v51;
  _UIMaterial *v52;
  _UIMaterial *v53;
  _UIMaterial *v54;
  _UIMaterial *v55;
  _UIMaterial *v56;
  _UIMaterial *v57;
  _UIMaterial *v58;
  _UIMaterial *v59;
  _UIMaterial *v60;
  _UIMaterial *v61;
  _UIMaterial *v62;
  _UIMaterial *v63;
  void *v64;
  _UIMaterial *v65;
  _UIMaterial *v66;
  void *v67;
  _UIMaterial *v68;
  id *v69;
  id *v70;
  void *v71;
  _UIMaterial *v72;
  id *v73;
  id *v74;
  void *v75;
  _UIMaterial *v76;
  id *v77;
  id *v78;
  void *v79;
  _UIMaterial *v80;
  id *v81;
  id *v82;
  void *v83;
  _UIMaterial *v84;
  id *v85;
  id *v86;
  void *v87;
  _UIMaterial *v88;
  id *v89;
  id *v90;
  void *v91;
  _UIMaterial *v92;
  id *v93;
  id *v94;
  void *v95;
  _UIMaterial *v96;
  id *v97;
  id *v98;
  void *v99;
  _UIMaterial *v100;
  id *v101;
  id *v102;
  void *v103;
  _UIMaterial *v104;
  id *v105;
  id *v106;
  void *v107;
  _UIMaterial *v108;
  id *v109;
  id *v110;
  void *v111;
  _UIMaterial *v112;
  id *v113;
  id *v114;
  _UIMaterial *v115;
  _UIMaterial *v116;
  _UIMaterial *v117;
  _UIMaterial *v118;
  _UIMaterial *v119;
  _UIMaterial *v120;
  _UIMaterial *v121;
  _UIMaterial *v122;
  _UIMaterial *v123;
  _UIMaterial *v124;
  _UIMaterial *v125;
  _UIMaterial *v126;
  _UIMaterial *v127;
  _UIMaterial *v128;
  _UIMaterial *v129;
  _UIMaterial *v130;
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
  _OWORD v143[5];
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom");

  if (v1 == 6)
  {
    objc_opt_self();
    v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  else
  {
    if (v1 == 4)
    {
      objc_opt_self();
      v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v3 = -[_UIMaterial initWithBlur:]((id *)[_UIMaterial alloc], 7);
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("systemBackgroundColor"));
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("secondarySystemBackgroundColor"));
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("tertiarySystemBackgroundColor"));
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("systemGroupedBackgroundColor"));
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("secondarySystemGroupedBackgroundColor"));
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("tertiarySystemGroupedBackgroundColor"));
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("tableBackgroundColor"));
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("tableCellGroupedBackgroundColor"));
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("tableCellPlainBackgroundColor"));
      v144 = xmmword_18667D6E0;
      v145 = xmmword_18667D6F0;
      v146 = xmmword_18667D700;
      v147 = xmmword_18667D710;
      v148 = xmmword_186678670;
      +[UIVibrancyEffect _vibrantEffectWithCAColorMatrix:alpha:](UIVibrancyEffect, "_vibrantEffectWithCAColorMatrix:alpha:", &v144, 1.0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = [_UIMaterial alloc];
      v140 = v4;
      if (v5)
      {
        v6 = -[_UIMaterial initWithVisualEffect:](v5, v4);
        v7 = v6;
        if (v6)
          *((_BYTE *)v6 + 8) = 1;
      }
      else
      {
        v7 = 0;
      }
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("systemBlueColor"));

      v144 = xmmword_18667D720;
      v145 = xmmword_18667D730;
      v146 = xmmword_18667D740;
      v147 = xmmword_18667D750;
      v148 = xmmword_186678670;
      +[UIVibrancyEffect _vibrantEffectWithCAColorMatrix:alpha:](UIVibrancyEffect, "_vibrantEffectWithCAColorMatrix:alpha:", &v144, 1.0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = [_UIMaterial alloc];
      v138 = v8;
      if (v9)
      {
        v10 = -[_UIMaterial initWithVisualEffect:](v9, v8);
        v11 = v10;
        if (v10)
          *((_BYTE *)v10 + 8) = 1;
      }
      else
      {
        v11 = 0;
      }
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, CFSTR("systemGreenColor"));

      v144 = xmmword_18667D760;
      v145 = xmmword_18667D770;
      v146 = xmmword_18667D780;
      v147 = xmmword_18667D790;
      v148 = xmmword_186678670;
      +[UIVibrancyEffect _vibrantEffectWithCAColorMatrix:alpha:](UIVibrancyEffect, "_vibrantEffectWithCAColorMatrix:alpha:", &v144, 1.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = [_UIMaterial alloc];
      v136 = v12;
      if (v13)
      {
        v14 = -[_UIMaterial initWithVisualEffect:](v13, v12);
        v15 = v14;
        if (v14)
          *((_BYTE *)v14 + 8) = 1;
      }
      else
      {
        v15 = 0;
      }
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v15, CFSTR("systemOrangeColor"));

      v144 = xmmword_18667D7A0;
      v145 = xmmword_18667D7B0;
      v146 = xmmword_18667D7C0;
      v147 = xmmword_18667D7D0;
      v148 = xmmword_186678670;
      +[UIVibrancyEffect _vibrantEffectWithCAColorMatrix:alpha:](UIVibrancyEffect, "_vibrantEffectWithCAColorMatrix:alpha:", &v144, 1.0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = [_UIMaterial alloc];
      v134 = v16;
      if (v17)
      {
        v18 = -[_UIMaterial initWithVisualEffect:](v17, v16);
        v19 = v18;
        if (v18)
          *((_BYTE *)v18 + 8) = 1;
      }
      else
      {
        v19 = 0;
      }
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v19, CFSTR("systemRedColor"));

      v144 = xmmword_18667D7E0;
      v145 = xmmword_18667D7F0;
      v146 = xmmword_18667D800;
      v147 = xmmword_18667D810;
      v148 = xmmword_186678670;
      +[UIVibrancyEffect _vibrantEffectWithCAColorMatrix:alpha:](UIVibrancyEffect, "_vibrantEffectWithCAColorMatrix:alpha:", &v144, 1.0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = [_UIMaterial alloc];
      v132 = v20;
      if (v21)
      {
        v22 = -[_UIMaterial initWithVisualEffect:](v21, v20);
        v23 = v22;
        if (v22)
          *((_BYTE *)v22 + 8) = 1;
      }
      else
      {
        v23 = 0;
      }
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v23, CFSTR("systemYellowColor"));

      v144 = xmmword_18667D820;
      v145 = xmmword_18667D830;
      v146 = xmmword_18667D840;
      v147 = xmmword_18667D850;
      v148 = xmmword_186678670;
      +[UIVibrancyEffect _vibrantEffectWithCAColorMatrix:alpha:](UIVibrancyEffect, "_vibrantEffectWithCAColorMatrix:alpha:", &v144, 1.0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = [_UIMaterial alloc];
      if (v25)
      {
        v26 = -[_UIMaterial initWithVisualEffect:](v25, v24);
        v27 = v26;
        if (v26)
          *((_BYTE *)v26 + 8) = 1;
      }
      else
      {
        v27 = 0;
      }
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v27, CFSTR("systemPinkColor"));

      v144 = xmmword_18667D860;
      v145 = xmmword_18667D870;
      v146 = xmmword_18667D880;
      v147 = xmmword_18667D890;
      v148 = xmmword_186678670;
      +[UIVibrancyEffect _vibrantEffectWithCAColorMatrix:alpha:](UIVibrancyEffect, "_vibrantEffectWithCAColorMatrix:alpha:", &v144, 1.0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = [_UIMaterial alloc];
      if (v29)
      {
        v30 = -[_UIMaterial initWithVisualEffect:](v29, v28);
        v31 = v30;
        if (v30)
          *((_BYTE *)v30 + 8) = 1;
      }
      else
      {
        v31 = 0;
      }
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v31, CFSTR("systemIndigoColor"));

      v144 = xmmword_18667D8A0;
      v145 = xmmword_18667D8B0;
      v146 = xmmword_18667D8C0;
      v147 = xmmword_18667D8D0;
      v148 = xmmword_186678670;
      +[UIVibrancyEffect _vibrantEffectWithCAColorMatrix:alpha:](UIVibrancyEffect, "_vibrantEffectWithCAColorMatrix:alpha:", &v144, 1.0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = [_UIMaterial alloc];
      if (v33)
      {
        v34 = -[_UIMaterial initWithVisualEffect:](v33, v32);
        v35 = v34;
        if (v34)
          *((_BYTE *)v34 + 8) = 1;
      }
      else
      {
        v35 = 0;
      }
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v35, CFSTR("systemPurpleColor"));

      v144 = xmmword_18667D8E0;
      v145 = xmmword_18667D8F0;
      v146 = xmmword_18667D900;
      v147 = xmmword_18667D910;
      v148 = xmmword_186678670;
      +[UIVibrancyEffect _vibrantEffectWithCAColorMatrix:alpha:](UIVibrancyEffect, "_vibrantEffectWithCAColorMatrix:alpha:", &v144, 1.0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = [_UIMaterial alloc];
      if (v37)
      {
        v38 = -[_UIMaterial initWithVisualEffect:](v37, v36);
        v39 = v38;
        if (v38)
          *((_BYTE *)v38 + 8) = 1;
      }
      else
      {
        v39 = 0;
      }
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v39, CFSTR("systemMintColor"));

      v144 = xmmword_18667D920;
      v145 = xmmword_18667D930;
      v146 = xmmword_18667D940;
      v147 = xmmword_18667D950;
      v148 = xmmword_186678670;
      +[UIVibrancyEffect _vibrantEffectWithCAColorMatrix:alpha:](UIVibrancyEffect, "_vibrantEffectWithCAColorMatrix:alpha:", &v144, 1.0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = [_UIMaterial alloc];
      if (v41)
      {
        v42 = -[_UIMaterial initWithVisualEffect:](v41, v40);
        v43 = v42;
        if (v42)
          *((_BYTE *)v42 + 8) = 1;
      }
      else
      {
        v43 = 0;
      }
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v43, CFSTR("systemCyanColor"));

      v144 = xmmword_18667D960;
      v145 = xmmword_18667D970;
      v146 = xmmword_18667D980;
      v147 = xmmword_18667D990;
      v148 = xmmword_186678670;
      +[UIVibrancyEffect _vibrantEffectWithCAColorMatrix:alpha:](UIVibrancyEffect, "_vibrantEffectWithCAColorMatrix:alpha:", &v144, 1.0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = [_UIMaterial alloc];
      if (v45)
      {
        v46 = -[_UIMaterial initWithVisualEffect:](v45, v44);
        v47 = v46;
        if (v46)
          *((_BYTE *)v46 + 8) = 1;
      }
      else
      {
        v47 = 0;
      }
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v47, CFSTR("systemTealColor"));

      v48 = [_UIMaterial alloc];
      if (v48)
        v49 = -[_UIMaterial initWithVibrancy:forBlurEffectStyle:](v48, "initWithVibrancy:forBlurEffectStyle:", 4, 9);
      else
        v49 = 0;
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v49, CFSTR("systemFillColor"));

      v50 = [_UIMaterial alloc];
      if (v50)
        v51 = -[_UIMaterial initWithVibrancy:forBlurEffectStyle:](v50, "initWithVibrancy:forBlurEffectStyle:", 5, 9);
      else
        v51 = 0;
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v51, CFSTR("secondarySystemFillColor"));

      v52 = [_UIMaterial alloc];
      if (v52)
        v53 = -[_UIMaterial initWithVibrancy:forBlurEffectStyle:](v52, "initWithVibrancy:forBlurEffectStyle:", 6, 9);
      else
        v53 = 0;
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v53, CFSTR("tertiarySystemFillColor"));

      v54 = [_UIMaterial alloc];
      if (v54)
        v55 = -[_UIMaterial initWithVibrancy:forBlurEffectStyle:](v54, "initWithVibrancy:forBlurEffectStyle:", 0, 9);
      else
        v55 = 0;
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v55, CFSTR("labelColor"));

      v56 = [_UIMaterial alloc];
      if (v56)
        v57 = -[_UIMaterial initWithVibrancy:forBlurEffectStyle:](v56, "initWithVibrancy:forBlurEffectStyle:", 1, 9);
      else
        v57 = 0;
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v57, CFSTR("secondaryLabelColor"));

      v58 = [_UIMaterial alloc];
      if (v58)
        v59 = -[_UIMaterial initWithVibrancy:forBlurEffectStyle:](v58, "initWithVibrancy:forBlurEffectStyle:", 2, 9);
      else
        v59 = 0;
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v59, CFSTR("tertiaryLabelColor"));

      v60 = [_UIMaterial alloc];
      if (v60)
        v61 = -[_UIMaterial initWithVibrancy:forBlurEffectStyle:](v60, "initWithVibrancy:forBlurEffectStyle:", 3, 9);
      else
        v61 = 0;
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v61, CFSTR("quaternaryLabelColor"));

      v62 = [_UIMaterial alloc];
      if (v62)
        v63 = -[_UIMaterial initWithVibrancy:forBlurEffectStyle:](v62, "initWithVibrancy:forBlurEffectStyle:", 7, 9);
      else
        v63 = 0;
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v63, CFSTR("separatorColor"));
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v63, CFSTR("opaqueSeparatorColor"));

      v64 = v140;
    }
    else
    {
      objc_opt_self();
      v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v3 = -[_UIMaterial initWithBlur:]((id *)[_UIMaterial alloc], 9);
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("systemBackgroundColor"));
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("secondarySystemBackgroundColor"));
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("tertiarySystemBackgroundColor"));
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("systemGroupedBackgroundColor"));
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("secondarySystemGroupedBackgroundColor"));
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("tertiarySystemGroupedBackgroundColor"));
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("tableBackgroundColor"));
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("tableCellGroupedBackgroundColor"));
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("tableCellPlainBackgroundColor"));
      v65 = [_UIMaterial alloc];
      if (v65)
        v66 = -[_UIMaterial initWithVibrancy:forBlurEffectStyle:](v65, "initWithVibrancy:forBlurEffectStyle:", 5, 9);
      else
        v66 = 0;
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v66, CFSTR("_switchOffColor"));

      v144 = xmmword_18667D8E0;
      v145 = xmmword_18667D9A0;
      v146 = xmmword_18667D9B0;
      v147 = xmmword_18667D9C0;
      v148 = xmmword_186678670;
      v143[0] = xmmword_18667D9D0;
      v143[1] = xmmword_18667D9E0;
      v143[2] = xmmword_18667D9F0;
      v143[3] = xmmword_18667DA00;
      v143[4] = xmmword_186678670;
      +[UIVibrancyEffect _vibrantEffectWithLightCAColorMatrix:darkCAColorMatrix:alpha:](UIVibrancyEffect, "_vibrantEffectWithLightCAColorMatrix:darkCAColorMatrix:alpha:", &v144, v143, 1.0);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = [_UIMaterial alloc];
      if (v68)
      {
        v69 = -[_UIMaterial initWithVisualEffect:](v68, v67);
        v70 = v69;
        if (v69)
          *((_BYTE *)v69 + 8) = 1;
      }
      else
      {
        v70 = 0;
      }
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v70, CFSTR("systemRedColor"));

      +[_UIMaterial vibrancyEffectWithA:B:C:D:E:F:](48.475, 6.905, -51.525, 91.932, 54.282, -4.146);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = [_UIMaterial alloc];
      if (v72)
      {
        v73 = -[_UIMaterial initWithVisualEffect:](v72, v71);
        v74 = v73;
        if (v73)
          *((_BYTE *)v73 + 8) = 1;
      }
      else
      {
        v74 = 0;
      }
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v74, CFSTR("systemOrangeColor"));

      +[_UIMaterial vibrancyEffectWithA:B:C:D:E:F:](48.262, 28.262, -51.738, 94.219, 78.139, -1.859);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = [_UIMaterial alloc];
      if (v76)
      {
        v77 = -[_UIMaterial initWithVisualEffect:](v76, v75);
        v78 = v77;
        if (v77)
          *((_BYTE *)v77 + 8) = 1;
      }
      else
      {
        v78 = 0;
      }
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v78, CFSTR("systemYellowColor"));

      +[_UIMaterial vibrancyEffectWithA:B:C:D:E:F:](-30.944, 26.706, -16.434, 11.265, 74.405, 26.955);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = [_UIMaterial alloc];
      if (v80)
      {
        v81 = -[_UIMaterial initWithVisualEffect:](v80, v79);
        v82 = v81;
        if (v81)
          *((_BYTE *)v81 + 8) = 1;
      }
      else
      {
        v82 = 0;
      }
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v82, CFSTR("systemGreenColor"));

      +[_UIMaterial vibrancyEffectWithA:B:C:D:E:F:](-50.597, 27.443, 23.913, 24.238, 75.618, 74.048);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = [_UIMaterial alloc];
      if (v84)
      {
        v85 = -[_UIMaterial initWithVisualEffect:](v84, v83);
        v86 = v85;
        if (v85)
          *((_BYTE *)v85 + 8) = 1;
      }
      else
      {
        v86 = 0;
      }
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v86, CFSTR("systemMintColor"));

      +[_UIMaterial vibrancyEffectWithA:B:C:D:E:F:](-30.679, 19.521, 28.541, 16.214, 69.544, 78.954);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = [_UIMaterial alloc];
      v141 = v71;
      v142 = v67;
      v137 = v79;
      v139 = v75;
      v133 = v87;
      v135 = v83;
      if (v88)
      {
        v89 = -[_UIMaterial initWithVisualEffect:](v88, v87);
        v90 = v89;
        if (v89)
          *((_BYTE *)v89 + 8) = 1;
      }
      else
      {
        v90 = 0;
      }
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v90, CFSTR("systemTealColor"));

      +[_UIMaterial vibrancyEffectWithA:B:C:D:E:F:](-29.99, 18.24, 40.6, 26.993, 70.123, 87.773);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = [_UIMaterial alloc];
      if (v92)
      {
        v93 = -[_UIMaterial initWithVisualEffect:](v92, v91);
        v94 = v93;
        if (v93)
          *((_BYTE *)v93 + 8) = 1;
      }
      else
      {
        v94 = 0;
      }
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v94, CFSTR("systemCyanColor"));

      +[_UIMaterial vibrancyEffectWithA:B:C:D:E:F:](-45.718, 2.122, 54.282, 1.386, 49.224, 97.464);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = [_UIMaterial alloc];
      if (v96)
      {
        v97 = -[_UIMaterial initWithVisualEffect:](v96, v95);
        v98 = v97;
        if (v97)
          *((_BYTE *)v97 + 8) = 1;
      }
      else
      {
        v98 = 0;
      }
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v98, CFSTR("systemBlueColor"));

      +[_UIMaterial vibrancyEffectWithA:B:C:D:E:F:](-11.75, -12.53, 37.66, 34.283, 33.503, 87.623);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = [_UIMaterial alloc];
      if (v100)
      {
        v101 = -[_UIMaterial initWithVisualEffect:](v100, v99);
        v102 = v101;
        if (v101)
          *((_BYTE *)v101 + 8) = 1;
      }
      else
      {
        v102 = 0;
      }
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v102, CFSTR("systemIndigoColor"));

      +[_UIMaterial vibrancyEffectWithA:B:C:D:E:F:](21.691, -14.779, 40.121, 73.393, 33.783, 93.393);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v104 = [_UIMaterial alloc];
      if (v104)
      {
        v105 = -[_UIMaterial initWithVisualEffect:](v104, v103);
        v106 = v105;
        if (v105)
          *((_BYTE *)v105 + 8) = 1;
      }
      else
      {
        v106 = 0;
      }
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v106, CFSTR("systemPurpleColor"));

      +[_UIMaterial vibrancyEffectWithA:B:C:D:E:F:](56.855, -25.495, -9.815, 105.312, 26.882, 42.562);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      v108 = [_UIMaterial alloc];
      if (v108)
      {
        v109 = -[_UIMaterial initWithVisualEffect:](v108, v107);
        v110 = v109;
        if (v109)
          *((_BYTE *)v109 + 8) = 1;
      }
      else
      {
        v110 = 0;
      }
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v110, CFSTR("systemPinkColor"));

      +[_UIMaterial vibrancyEffectWithA:B:C:D:E:F:](11.937, 0.167, -14.733, 61.393, 49.633, 34.723);
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      v112 = [_UIMaterial alloc];
      if (v112)
      {
        v113 = -[_UIMaterial initWithVisualEffect:](v112, v111);
        v114 = v113;
        if (v113)
          *((_BYTE *)v113 + 8) = 1;
      }
      else
      {
        v114 = 0;
      }
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v114, CFSTR("systemBrownColor"));

      v115 = [_UIMaterial alloc];
      if (v115)
        v116 = -[_UIMaterial initWithVibrancy:forBlurEffectStyle:](v115, "initWithVibrancy:forBlurEffectStyle:", 4, 9);
      else
        v116 = 0;
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v116, CFSTR("systemFillColor"));

      v117 = [_UIMaterial alloc];
      if (v117)
        v118 = -[_UIMaterial initWithVibrancy:forBlurEffectStyle:](v117, "initWithVibrancy:forBlurEffectStyle:", 5, 9);
      else
        v118 = 0;
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v118, CFSTR("secondarySystemFillColor"));

      v119 = [_UIMaterial alloc];
      if (v119)
        v120 = -[_UIMaterial initWithVibrancy:forBlurEffectStyle:](v119, "initWithVibrancy:forBlurEffectStyle:", 6, 9);
      else
        v120 = 0;
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v120, CFSTR("tertiarySystemFillColor"));

      v121 = [_UIMaterial alloc];
      if (v121)
        v122 = -[_UIMaterial initWithVibrancy:forBlurEffectStyle:](v121, "initWithVibrancy:forBlurEffectStyle:", 0, 9);
      else
        v122 = 0;
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v122, CFSTR("labelColor"));

      v123 = [_UIMaterial alloc];
      if (v123)
        v124 = -[_UIMaterial initWithVibrancy:forBlurEffectStyle:](v123, "initWithVibrancy:forBlurEffectStyle:", 1, 9);
      else
        v124 = 0;
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v124, CFSTR("secondaryLabelColor"));

      v125 = [_UIMaterial alloc];
      if (v125)
        v126 = -[_UIMaterial initWithVibrancy:forBlurEffectStyle:](v125, "initWithVibrancy:forBlurEffectStyle:", 2, 9);
      else
        v126 = 0;
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v126, CFSTR("tertiaryLabelColor"));

      v127 = [_UIMaterial alloc];
      if (v127)
        v128 = -[_UIMaterial initWithVibrancy:forBlurEffectStyle:](v127, "initWithVibrancy:forBlurEffectStyle:", 3, 9);
      else
        v128 = 0;
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v128, CFSTR("quaternaryLabelColor"));

      v129 = [_UIMaterial alloc];
      if (v129)
        v130 = -[_UIMaterial initWithVibrancy:forBlurEffectStyle:](v129, "initWithVibrancy:forBlurEffectStyle:", 7, 9);
      else
        v130 = 0;
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v130, CFSTR("separatorColor"));
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v130, CFSTR("opaqueSeparatorColor"));

      v64 = v142;
    }

  }
  v131 = (void *)qword_1ECD7BF38;
  qword_1ECD7BF38 = (uint64_t)v2;

}

@end
