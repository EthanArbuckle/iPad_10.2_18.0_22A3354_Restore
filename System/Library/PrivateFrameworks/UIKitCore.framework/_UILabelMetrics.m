@implementation _UILabelMetrics

+ (id)metricsWithConfiguration:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v6 = (void *)objc_msgSend(v5, "_initWithConfiguration:sourceRect:synthesizedContent:associatedScaledMetrics:", v4, 0, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  return v6;
}

+ (id)intrinsicMetricsWithConfiguration:(id)a3
{
  _BYTE *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;

  v4 = a3;
  v5 = v4;
  if (v4 && (v4[170] & 0x80) != 0 && objc_msgSend(v4, "numberOfLines") != 1)
  {
    objc_msgSend(v5, "preferredMaxLayoutWidth");
    v6 = v7;
  }
  else
  {
    v6 = 3.40282347e38;
  }
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithConfiguration:sourceRect:synthesizedContent:associatedScaledMetrics:", v5, 0, 0, 0.0, 0.0, v6, 3.40282347e38);

  return v8;
}

- (id)_initWithConfiguration:(id)a3 sourceRect:(CGRect)a4 synthesizedContent:(id)a5 associatedScaledMetrics:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v13;
  id v14;
  id v15;
  _UILabelMetrics *v16;
  uint64_t v17;
  _UILabelConfiguration *configuration;
  _BOOL4 IsEmpty;
  CGRect *v20;
  CGPoint origin;
  CGSize size;
  objc_super v24;
  CGRect v25;
  CGRect v26;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a3;
  v14 = a5;
  v15 = a6;
  v24.receiver = self;
  v24.super_class = (Class)_UILabelMetrics;
  v16 = -[_UILabelMetrics init](&v24, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v13, "copy");
    configuration = v16->_configuration;
    v16->_configuration = (_UILabelConfiguration *)v17;

    objc_storeStrong((id *)&v16->_synthesizedContent, a5);
    objc_storeStrong((id *)&v16->_associatedScaledMetrics, a6);
    v25.origin.x = x;
    v25.origin.y = y;
    v25.size.width = width;
    v25.size.height = height;
    IsEmpty = CGRectIsEmpty(v25);
    v20 = (CGRect *)MEMORY[0x1E0C9D628];
    if (IsEmpty)
    {
      objc_msgSend(v13, "bounds");
      x = v26.origin.x;
      y = v26.origin.y;
      width = v26.size.width;
      height = v26.size.height;
      if (CGRectEqualToRect(v26, *v20))
      {
        x = *MEMORY[0x1E0C9D648];
        y = *(double *)(MEMORY[0x1E0C9D648] + 8);
        width = *(double *)(MEMORY[0x1E0C9D648] + 16);
        height = *(double *)(MEMORY[0x1E0C9D648] + 24);
      }
    }
    v16->_sourceRect.origin.x = x;
    v16->_sourceRect.origin.y = y;
    v16->_sourceRect.size.width = width;
    v16->_sourceRect.size.height = height;
    origin = v20->origin;
    size = v20->size;
    v16->_bounds.origin = v20->origin;
    v16->_bounds.size = size;
    v16->_drawingRect.origin = origin;
    v16->_drawingRect.size = size;
    v16->_firstBaselineOffset = 0.0;
    v16->_lastBaselineOffset = 0.0;
    v16->_numberOfLines = -1;
    v16->_scaleFactor = 1.0;
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  _UILabelMetrics *v4;
  char v5;

  v4 = (_UILabelMetrics *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (-[_UILabelMetrics _calculateIfNeeded]((uint64_t)self),
          -[_UILabelMetrics _calculateIfNeeded]((uint64_t)v4),
          CGRectEqualToRect(self->_sourceRect, v4->_sourceRect))
      && CGRectEqualToRect(self->_bounds, v4->_bounds)
      && CGRectEqualToRect(self->_idealBounds, v4->_idealBounds)
      && CGRectEqualToRect(self->_drawingRect, v4->_drawingRect)
      && self->_numberOfLines == v4->_numberOfLines
      && self->_firstBaselineOffset == v4->_firstBaselineOffset
      && self->_lastBaselineOffset == v4->_lastBaselineOffset
      && self->_scaleFactor == v4->_scaleFactor
      && ((*(_BYTE *)&v4->_metricsFlags ^ *(_BYTE *)&self->_metricsFlags) & 0xC) == 0
      && UIEqual(self->_textToUse, v4->_textToUse))
    {
      v5 = UIEqual(self->_attributesToUse, v4->_attributesToUse);
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (void)_calculateIfNeeded
{
  double v2;
  double *v3;
  double v4;
  char v5;
  int v6;
  double v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  unsigned int v14;
  void (**v15)(void);
  double *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double *v21;
  uint64_t v22;
  uint64_t v23;
  double *v24;
  uint64_t v25;
  uint64_t v26;
  double *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  void *v36;
  _BOOL4 v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  _BOOL4 v41;
  double v42;
  double v43;
  double v44;
  int v45;
  double v46;
  double v47;
  uint64_t v48;
  id v49;
  _BOOL4 v50;
  void *v51;
  void *v52;
  int v53;
  double v54;
  double v55;
  int v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  double *v68;
  float v69;
  double *v70;
  void *v71;
  void *v72;
  void *v73;
  BOOL v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  uint64_t v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  void *v93;
  void *v94;
  id v95;
  id v96;
  uint64_t v97;
  void *v98;
  double v99;
  double v100;
  void *v101;
  id v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t i;
  double v106;
  double v107;
  double v108;
  double *v109;
  char v110;
  unint64_t v111;
  double MinY;
  CGFloat Height;
  double v114;
  double v115;
  double v116;
  uint64_t v117;
  double *v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  uint64_t v122;
  void *v123;
  double v124;
  double v125;
  CGFloat MaxX;
  int v127;
  double v128;
  double v129;
  uint64_t v130;
  double v131;
  uint64_t v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  uint64_t v143;
  double v144;
  uint64_t v145;
  void *v146;
  void *v147;
  CGFloat v148;
  double *v149;
  CGFloat v150;
  CGFloat v151;
  CGFloat v152;
  double v153;
  void (**v154)(void);
  id v155;
  void (**v156)(void);
  unsigned __int8 *v157;
  double v158;
  void *v159;
  int v160;
  id v161;
  _QWORD v162[5];
  void (**v163)(void);
  uint64_t *v164;
  uint64_t *v165;
  char v166;
  _QWORD aBlock[8];
  char v168;
  uint64_t v169;
  uint64_t *v170;
  uint64_t v171;
  _QWORD *v172;
  uint64_t v173;
  double *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  double *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  double *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  double *v186;
  uint64_t v187;
  void *v188;
  uint64_t v189;
  uint64_t v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  _OWORD v195[8];
  uint64_t v196;
  CGRect v197;
  CGRect v198;

  v196 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if ((*(_BYTE *)(a1 + 232) & 1) != 0)
    {
      objc_msgSend((id)a1, "_calculatedSynthesizedContentIfNeeded");
      return;
    }
    *(_BYTE *)(a1 + 232) |= 1u;
    -[UIBarButtonItemGroup _items](*(id **)(a1 + 8));
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v159, "length") && (*(_BYTE *)(a1 + 232) & 8) != 0)
      goto LABEL_166;
    v2 = 3.40282347e38;
    v158 = *(double *)(a1 + 40);
    if (v158 >= 3.40282347e38)
    {
      *(_BYTE *)(a1 + 232) |= 0x10u;
      v3 = (double *)(a1 + 48);
    }
    else
    {
      v3 = (double *)(a1 + 48);
      v4 = *(double *)(a1 + 48);
      v5 = *(_BYTE *)(a1 + 232);
      v2 = 3.40282347e38;
      if (v4 < 3.40282347e38)
      {
        v6 = 0;
        *(_BYTE *)(a1 + 232) = v5 & 0xEF;
        v2 = v4;
        goto LABEL_12;
      }
      *(_BYTE *)(a1 + 232) = v5 | 0x10;
    }
    v6 = 1;
LABEL_12:
    v7 = *(double *)(a1 + 32);
    v153 = *(double *)(a1 + 24);
    v185 = 0;
    v186 = (double *)&v185;
    v187 = 0x3010000000;
    v189 = 0;
    v190 = 0;
    v188 = &unk_18685B0AF;
    -[_UILabelConfiguration _internal](*(id **)(a1 + 8));
    v157 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "_stringDrawingContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD **)(a1 + 8);
    if (v9)
    {
      v10 = 1048577;
      v11 = v9[20];
      if (v11)
      {
        v12 = *(_DWORD *)(v11 + 24);
        v13 = 1048705;
        if ((v12 & 2) == 0)
          v13 = 1048577;
        v10 = v13 | ((_WORD)v12 << 7) & 0x200 | ((_WORD)v12 << 7) & 0x400;
      }
    }
    else
    {
      v10 = 0;
    }
    v181 = 0;
    v182 = (double *)&v181;
    v183 = 0x2020000000;
    v184 = 0;
    v177 = 0;
    v178 = (double *)&v177;
    v179 = 0x2020000000;
    v180 = 0;
    v173 = 0;
    v174 = (double *)&v173;
    v175 = 0x2020000000;
    v176 = 0;
    if (v157)
      v160 = v157[24] >> 7;
    else
      v160 = 0;
    v148 = *(double *)(a1 + 24);
    v151 = *(double *)(a1 + 40);
    v152 = *(double *)(a1 + 32);
    v150 = *(double *)(a1 + 48);
    v169 = 0;
    v170 = &v169;
    v171 = 0x2020000000;
    v172 = 0;
    if (v9)
      v9 = (_QWORD *)objc_msgSend(v9, "numberOfLines");
    v172 = v9;
    objc_msgSend((id)a1, "_calculatedSynthesizedContentIfNeeded");
    v149 = v3;
    v161 = *(id *)(a1 + 200);
    v155 = *(id *)(a1 + 208);
    v14 = *(unsigned __int8 *)(a1 + 232);
    objc_msgSend(v8, "setWantsNumberOfLineFragments:", 1);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __37___UILabelMetrics__calculateIfNeeded__block_invoke;
    aBlock[3] = &unk_1E16B53A0;
    v168 = v160;
    aBlock[4] = a1;
    aBlock[5] = &v181;
    aBlock[6] = &v177;
    aBlock[7] = &v173;
    v162[0] = MEMORY[0x1E0C809B0];
    v162[1] = 3221225472;
    v162[2] = __37___UILabelMetrics__calculateIfNeeded__block_invoke_2;
    v162[3] = &unk_1E16B53C8;
    v166 = v160;
    v154 = _Block_copy(aBlock);
    v162[4] = a1;
    v163 = v154;
    v164 = &v185;
    v165 = &v169;
    v156 = (void (**)(void))_Block_copy(v162);
    if (*(_QWORD *)(a1 + 64))
    {
      v15 = v156;
      if (((v6 ^ 1 | v160) & 1) != 0)
        goto LABEL_23;
    }
    if (v170[3] != 1)
    {
      objc_msgSend(v8, "setWantsBaselineOffset:", 1);
      if ((v14 & 4) != 0)
        objc_msgSend(v161, "boundingRectWithSize:options:context:", v10, v8, v158, v2);
      else
        objc_msgSend(v161, "boundingRectWithSize:options:attributes:context:", v10, v155, v8, v158, v2);
      v24 = v186;
      *((_QWORD *)v186 + 4) = v19;
      *((_QWORD *)v24 + 5) = v20;
      if (!v6 || (v15 = v154, !*(_QWORD *)(a1 + 64)))
      {
        objc_msgSend(v8, "baselineOffset");
        *((_QWORD *)v182 + 3) = v25;
        objc_msgSend(v8, "firstBaselineOffset");
        *((_QWORD *)v174 + 3) = v26;
        goto LABEL_41;
      }
LABEL_23:
      v15[2]();
LABEL_41:
      if ((v6 & ((v14 & 4) >> 2)) == 1 && dyld_program_sdk_at_least())
      {
        objc_msgSend(v159, "paragraphStyle");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "firstLineHeadIndent");
        if (v31 > 0.0)
        {
          if (objc_msgSend(v8, "numberOfLineFragments") == 1)
            goto LABEL_52;
          objc_msgSend(v161, "string");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "componentsSeparatedByCharactersInSet:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v147 = v32;

          v35 = objc_msgSend(v34, "count");
          if (objc_msgSend(v34, "count"))
          {
            objc_msgSend(v34, "lastObject");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v36, "length") == 0;

            v35 -= v37;
          }
          v38 = v170[3];
          v39 = objc_msgSend(v8, "numberOfLineFragments");
          v40 = 0x7FFFFFFFLL;
          if (v38)
            v40 = v38;
          if (v40 >= v35)
            v40 = v35;
          v41 = v40 == v39;

          if (v41)
          {
LABEL_52:
            v42 = v186[4];
            objc_msgSend(v30, "firstLineHeadIndent");
            v44 = v42 + v43;
            if (v44 >= *(double *)(a1 + 40))
              v44 = *(double *)(a1 + 40);
            v186[4] = v44;
          }
        }

      }
      v45 = (v14 >> 2) & 1;
      v47 = v186[4];
      v46 = v186[5];
      if (v6)
      {
        if (*(double *)(a1 + 40) >= 3.40282347e38)
        {
          objc_msgSend((id)a1, "_calculateScaledMetricsUsingSize:", v186[4], v186[5]);
          v48 = *(_QWORD *)(a1 + 64);
          if (v48)
          {
            objc_msgSend(*(id *)(a1 + 64), "_calculateIfNecessary");
            v49 = *(id *)(v48 + 80);

            v156[2]();
            v45 = 1;
            v161 = v49;
          }
        }
      }
      if ((*(_BYTE *)(a1 + 232) & 8) != 0)
      {
        v50 = 0;
        if (!v6)
          goto LABEL_68;
      }
      else
      {
        v50 = objc_msgSend(v159, "length") == 0;
        if (!v6)
          goto LABEL_68;
      }
      v51 = *(void **)(a1 + 8);
      if (v51)
      {
        if (objc_msgSend(v51, "numberOfLines") == 1)
        {
          v52 = *(void **)(a1 + 8);
          if (!v52 || (objc_msgSend(v52, "adjustsFontSizeToFitWidth") & 1) == 0)
          {
            v53 = objc_msgSend(*(id *)(a1 + 56), "hasExplicitBaselineOffset");
            goto LABEL_69;
          }
        }
      }
LABEL_68:
      v53 = 1;
LABEL_69:
      v54 = 0.0;
      v55 = 0.0;
      if (((v45 ^ 1 | v50) & 1) == 0 && v53)
      {
        v195[0] = xmmword_186679030;
        v56 = dyld_program_sdk_at_least();
        v57 = *(_QWORD *)off_1E1678C58;
        if (v56)
          objc_msgSend(v161, "attribute:atIndex:longestEffectiveRange:inRange:", v57, 0, v195, 0, objc_msgSend(v161, "length"));
        else
          objc_msgSend(v161, "attribute:atIndex:effectiveRange:", *(_QWORD *)off_1E1678C58, 0, v195);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = *((_QWORD *)&v195[0] + 1);
        if (v59 == objc_msgSend(v161, "length") || !v58)
        {
          if ((dyld_program_sdk_at_least() & 1) == 0 && v58)
          {
            objc_msgSend(v58, "floatValue");
            v55 = v69;
          }
        }
        else
        {
          v60 = (void *)objc_msgSend(v161, "mutableCopy");
          objc_msgSend(v60, "removeAttribute:range:", v57, 0, objc_msgSend(v161, "length"));
          objc_msgSend(v8, "setWantsBaselineOffset:", 1);
          v61 = objc_msgSend(v8, "cachesLayout");
          objc_msgSend(v8, "setCachesLayout:", 0);
          objc_msgSend(v60, "boundingRectWithSize:options:context:", v10, v8, v158, 3.40282347e38);
          v63 = v62;
          v65 = v64;
          objc_msgSend(v8, "baselineOffset");
          *((_QWORD *)v182 + 3) = v66;
          objc_msgSend(v8, "firstBaselineOffset");
          *((_QWORD *)v174 + 3) = v67;
          v68 = v186;
          *((_QWORD *)v186 + 4) = v63;
          *((_QWORD *)v68 + 5) = v65;
          objc_msgSend(v8, "setCachesLayout:", v61);

          v55 = 0.0;
        }

      }
      v70 = *(double **)(a1 + 8);
      if (v70)
        v54 = v70[19];
      if (v6)
      {
        objc_msgSend(v70, "shadow");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = v71;
        if (v47 > 0.0 && v46 > 0.0)
        {
          objc_msgSend(v71, "shadowColor");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = v73 == 0;

          if (!v74)
          {
            objc_msgSend(v72, "shadowOffset");
            if (v75 < 0.0)
              v75 = -v75;
            v47 = v47 + v75;
            v77 = -v76;
            if (v76 >= 0.0)
              v77 = v76;
            v46 = v46 + v77;
          }
        }
        UIRoundToScale(v7 + (v46 - v186[5]) * 0.5, v54);
        v79 = v78;
        v158 = v186[4];
        UICeilToScale(v47, v54);
        v151 = v80;
        UICeilToScale(v46, v54);
        v150 = v81;

      }
      else
      {
        UIRoundToScale(v7 + (v2 - v186[5]) * 0.5, v54);
        v79 = v82;
      }
      v83 = v79 - v55;
      v84 = v186[5];
      v85 = v83 + v182[3];
      UIRoundToScale(v85, v54);
      *(double *)(a1 + 80) = v86;
      UIRoundToScale(v86 - v85 + v83 + v174[3], v54);
      *(_QWORD *)(a1 + 72) = v87;
      if (*(_QWORD *)(a1 + 184) == -1)
        *(_QWORD *)(a1 + 184) = objc_msgSend(v8, "numberOfLineFragments");
      v88 = *(double *)(a1 + 80);
      v89 = v182[3];
      objc_msgSend((id)a1, "_lineSpacing");
      v91 = v90;
      v92 = v88 - v89;
      if (v90 != 0.0)
      {
        objc_msgSend(v155, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D90);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = v93;
        if (v45)
        {
          v95 = v161;
          v96 = v94;
          v97 = objc_msgSend(v95, "length");
          if (v96)
          {
            -[NSAttributedString _ui_fontsInRange:usingDefaultFont:](v95, 0, v97, v96);
            v98 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            +[UILabel defaultFont](UILabel, "defaultFont");
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSAttributedString _ui_fontsInRange:usingDefaultFont:](v95, 0, v97, v101);
            v98 = (void *)objc_claimAutoreleasedReturnValue();

          }
          v193 = 0u;
          v194 = 0u;
          v191 = 0u;
          v192 = 0u;
          v102 = v98;
          v103 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v191, v195, 16);
          if (v103)
          {
            v104 = *(_QWORD *)v192;
            v100 = 0.0;
            do
            {
              for (i = 0; i != v103; ++i)
              {
                if (*(_QWORD *)v192 != v104)
                  objc_enumerationMutation(v102);
                objc_msgSend(*(id *)(*((_QWORD *)&v191 + 1) + 8 * i), "lineHeight");
                if (v106 > v100)
                  v100 = v106;
              }
              v103 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v191, v195, 16);
            }
            while (v103);
          }
          else
          {
            v100 = 0.0;
          }

        }
        else
        {
          objc_msgSend(v93, "lineHeight");
          v100 = v99;
        }
        UICeilToScale(v100, v54);
        v108 = v107;

        v92 = v92 - (v108 - v91);
      }
      v109 = *(double **)(a1 + 64);
      if (v109)
        v110 = v6;
      else
        v110 = 1;
      if ((v110 & 1) == 0)
      {
        if (v170[3] != 1)
        {
LABEL_124:
          if (v160)
          {
            v197.origin.x = v148;
            v197.origin.y = v152;
            v197.size.width = v151;
            v197.size.height = v150;
            MinY = CGRectGetMinY(v197);
            v198.origin.x = v148;
            v198.origin.y = v152;
            v198.size.width = v151;
            v198.size.height = v150;
            Height = CGRectGetHeight(v198);
            UICeilToScale(MinY + (Height - v186[5]) * 0.5, v54);
            v92 = v114;
            UICeilToScale(v186[5], v54);
          }
          else
          {
            objc_msgSend(v109, "_calculateIfNecessary");
            v116 = v109[4];
            v117 = *(_QWORD *)(a1 + 64);
            if (v117)
            {
              objc_msgSend(*(id *)(a1 + 64), "_calculateIfNecessary");
              v115 = *(double *)(v117 + 32);
            }
            else
            {
              v115 = 0.0;
            }
            v92 = v92 + (v84 - v116) * 0.5;
          }
          v84 = v115;
          goto LABEL_131;
        }
        if (v157 && (v111 = ((unint64_t)*((unsigned int *)v157 + 6) >> 8) & 3) != 0)
        {
          if (v111 == 1)
            goto LABEL_124;
        }
        else
        {
          v92 = v92 + v182[3] - v178[3];
        }
      }
LABEL_131:
      *(double *)(a1 + 120) = v153;
      v118 = (double *)(a1 + 120);
      *(double *)(a1 + 88) = v153;
      *(double *)(a1 + 96) = v92;
      *(double *)(a1 + 104) = v158;
      *(double *)(a1 + 112) = v84;
      *(double *)(a1 + 128) = v92;
      *(double *)(a1 + 136) = v158;
      *(double *)(a1 + 144) = v84;
      UIRoundToScale(v153, v54);
      *(_QWORD *)(a1 + 120) = v119;
      UIRoundToScale(*(double *)(a1 + 128) + (*(double *)(a1 + 144) - *(double *)(a1 + 112)) * 0.5, v54);
      *(_QWORD *)(a1 + 128) = v120;
      if (!v6)
        goto LABEL_143;
      if (!objc_msgSend(v159, "length"))
      {
        v46 = 0.0;
        v47 = 0.0;
      }
      if (*(double *)(a1 + 40) >= 3.40282347e38)
        goto LABEL_143;
      +[UIView _enableRTL](UIView, "_enableRTL");
      if (objc_msgSend(v159, "isAttributed"))
      {
        objc_msgSend((id)a1, "_synthesizedAttributedText");
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        v122 = objc_msgSend(v121, "_ui_resolvedTextAlignment");
      }
      else
      {
        objc_msgSend((id)a1, "_synthesizedAttributes");
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v121, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678F98);
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        v122 = objc_msgSend(v123, "_ui_resolvedTextAlignment");

      }
      if (v122 == 1)
      {
        MaxX = CGRectGetMaxX(*(CGRect *)(a1 + 24));
        UIRoundToScale((MaxX - *(double *)(a1 + 136)) * 0.5, v54);
        v124 = *v118;
      }
      else
      {
        if (v122 != 2)
        {
LABEL_143:
          v127 = dyld_program_sdk_at_least();
          v128 = *(double *)(a1 + 136);
          v129 = *(double *)(a1 + 40);
          if (v128 >= v129)
            v128 = *(double *)(a1 + 40);
          if (v127)
          {
            UICeilToScale(v128, v54);
            *(_QWORD *)(a1 + 136) = v130;
            v131 = *(double *)(a1 + 144);
            if (v131 >= *(double *)(a1 + 48))
              v131 = *(double *)(a1 + 48);
            UICeilToScale(v131, v54);
            *(_QWORD *)(a1 + 144) = v132;
            v133 = *(double *)(a1 + 40);
            if (v47 < v133)
              v133 = v47;
            UICeilToScale(v133, v54);
            v135 = v134;
            v136 = *v149;
            if (v46 < *v149)
              v136 = v46;
            UICeilToScale(v136, v54);
          }
          else
          {
            v138 = ceil(v128);
            v139 = *(double *)(a1 + 144);
            v140 = *(double *)(a1 + 48);
            if (v139 >= v140)
              v139 = *(double *)(a1 + 48);
            *(double *)(a1 + 136) = v138;
            *(double *)(a1 + 144) = ceil(v139);
            if (v47 >= v129)
              v141 = v129;
            else
              v141 = v47;
            v135 = ceil(v141);
            if (v46 >= v140)
              v142 = v140;
            else
              v142 = v46;
            v137 = ceil(v142);
          }
          *(_OWORD *)(a1 + 152) = *(_OWORD *)v118;
          *(double *)(a1 + 168) = v135;
          *(double *)(a1 + 176) = v137;
          v143 = *(_QWORD *)(a1 + 64);
          if (v143)
          {
            objc_msgSend(*(id *)(a1 + 64), "_calculateIfNecessary");
            v144 = *(double *)(v143 + 40);
          }
          else
          {
            v144 = 1.0;
          }
          *(double *)(a1 + 192) = v144;
          objc_msgSend(v8, "layout");
          v145 = objc_claimAutoreleasedReturnValue();
          v146 = *(void **)(a1 + 216);
          *(_QWORD *)(a1 + 216) = v145;

          _Block_object_dispose(&v169, 8);
          _Block_object_dispose(&v173, 8);
          _Block_object_dispose(&v177, 8);
          _Block_object_dispose(&v181, 8);

          _Block_object_dispose(&v185, 8);
LABEL_166:

          return;
        }
        v124 = CGRectGetMaxX(*(CGRect *)(a1 + 24)) - *(double *)(a1 + 136);
        v125 = *(double *)(a1 + 120);
      }
      *v118 = v124 + v125;
      goto LABEL_143;
    }
    objc_msgSend(v8, "setWantsBaselineOffset:", 1);
    if ((v14 & 4) != 0)
    {
      objc_msgSend(v161, "boundingRectWithSize:options:context:", v10, v8, v158, 3.40282347e38);
      v16 = v186;
      *((_QWORD *)v186 + 4) = v17;
      *((_QWORD *)v16 + 5) = v18;
      if (!v6)
        goto LABEL_39;
    }
    else
    {
      if (!v6)
      {
        objc_msgSend(&stru_1E16EDF20, "boundingRectWithSize:options:attributes:context:", v10, v155, v8, 3.40282347e38, 3.40282347e38);
        v27 = v186;
        v186[4] = v158;
        *((_QWORD *)v27 + 5) = v28;
        goto LABEL_39;
      }
      objc_msgSend(v161, "boundingRectWithSize:options:attributes:context:", v10, v155, v8, v158, 3.40282347e38);
      v21 = v186;
      *((_QWORD *)v186 + 4) = v22;
      *((_QWORD *)v21 + 5) = v23;
    }
    if (*(_QWORD *)(a1 + 64))
    {
      v154[2]();
LABEL_40:
      *(_QWORD *)(a1 + 184) = 1;
      goto LABEL_41;
    }
LABEL_39:
    objc_msgSend(v8, "baselineOffset");
    *((_QWORD *)v182 + 3) = v29;
    *((_QWORD *)v174 + 3) = v29;
    goto LABEL_40;
  }
}

- (unint64_t)hash
{
  int64_t v2;
  uint64_t v3;

  v2 = self->_numberOfLines ^ ((uint64_t)(self->_scaleFactor * 100.0) << 8) ^ ((uint64_t)(self->_firstBaselineOffset
                                                                                      * 100.0) << 16);
  v3 = (uint64_t)(self->_lastBaselineOffset * 100.0);
  return v2 ^ -[_UILabelConfiguration hash](self->_configuration, "hash") ^ (v3 << 24);
}

- (id)copyWithZone:(_NSZone *)a3
{
  char *v4;
  CGPoint origin;
  CGPoint v6;
  CGPoint v7;

  v4 = -[_UILabelMetrics _initWithConfiguration:sourceRect:synthesizedContent:associatedScaledMetrics:]([_UILabelMetrics alloc], "_initWithConfiguration:sourceRect:synthesizedContent:associatedScaledMetrics:", self->_configuration, self->_synthesizedContent, self->_associatedScaledMetrics, self->_sourceRect.origin.x, self->_sourceRect.origin.y, self->_sourceRect.size.width, self->_sourceRect.size.height);
  origin = self->_bounds.origin;
  *(CGSize *)(v4 + 136) = self->_bounds.size;
  *(CGPoint *)(v4 + 120) = origin;
  v6 = self->_idealBounds.origin;
  *(CGSize *)(v4 + 168) = self->_idealBounds.size;
  *(CGPoint *)(v4 + 152) = v6;
  *((_QWORD *)v4 + 23) = self->_numberOfLines;
  *((_QWORD *)v4 + 9) = *(_QWORD *)&self->_firstBaselineOffset;
  *((_QWORD *)v4 + 10) = *(_QWORD *)&self->_lastBaselineOffset;
  v7 = self->_drawingRect.origin;
  *(CGSize *)(v4 + 104) = self->_drawingRect.size;
  *(CGPoint *)(v4 + 88) = v7;
  *((_QWORD *)v4 + 24) = *(_QWORD *)&self->_scaleFactor;
  objc_storeStrong((id *)v4 + 26, self->_attributesToUse);
  objc_storeStrong((id *)v4 + 25, self->_textToUse);
  v4[232] = (char)self->_metricsFlags;
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UILabelMetrics)initWithCoder:(id)a3
{
  id v4;
  _UILabelMetrics *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  float v18;
  float v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  float v24;
  uint64_t v25;
  _UILabelConfiguration *configuration;
  uint64_t v27;
  NSDictionary *attributesToUse;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id textToUse;
  char v34;
  char v35;
  objc_super v37;
  _QWORD v38[6];

  v38[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)_UILabelMetrics;
  v5 = -[_UILabelMetrics init](&v37, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeRectForKey:", CFSTR("UILabelMetrics_sourceRect"));
    v5->_sourceRect.origin.x = v6;
    v5->_sourceRect.origin.y = v7;
    v5->_sourceRect.size.width = v8;
    v5->_sourceRect.size.height = v9;
    objc_msgSend(v4, "decodeRectForKey:", CFSTR("UILabelMetrics_bounds"));
    v5->_bounds.origin.x = v10;
    v5->_bounds.origin.y = v11;
    v5->_bounds.size.width = v12;
    v5->_bounds.size.height = v13;
    objc_msgSend(v4, "decodeRectForKey:", CFSTR("UILabelMetrics_idealBounds"));
    v5->_idealBounds.origin.x = v14;
    v5->_idealBounds.origin.y = v15;
    v5->_idealBounds.size.width = v16;
    v5->_idealBounds.size.height = v17;
    v5->_numberOfLines = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UILabelMetrics_numberOfLines"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("UILabelMetrics_firstBaselineOffset"));
    v5->_firstBaselineOffset = v18;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("UILabelMetrics_lastBaselineOffset"));
    v5->_lastBaselineOffset = v19;
    objc_msgSend(v4, "decodeRectForKey:", CFSTR("UILabelMetrics_drawingRect"));
    v5->_drawingRect.origin.x = v20;
    v5->_drawingRect.origin.y = v21;
    v5->_drawingRect.size.width = v22;
    v5->_drawingRect.size.height = v23;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("UILabelMetrics_scaleFactor"));
    v5->_scaleFactor = v24;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UILabelMetrics_configuration"));
    v25 = objc_claimAutoreleasedReturnValue();
    configuration = v5->_configuration;
    v5->_configuration = (_UILabelConfiguration *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UILabelMetrics_attributesToUse"));
    v27 = objc_claimAutoreleasedReturnValue();
    attributesToUse = v5->_attributesToUse;
    v5->_attributesToUse = (NSDictionary *)v27;

    v29 = (void *)MEMORY[0x1E0C99E60];
    v38[0] = objc_opt_class();
    v38[1] = objc_opt_class();
    v38[2] = objc_opt_class();
    v38[3] = objc_opt_class();
    v38[4] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 5);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setWithArray:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v31, CFSTR("UILabelMetrics_textToUse"));
    v32 = objc_claimAutoreleasedReturnValue();
    textToUse = v5->_textToUse;
    v5->_textToUse = (id)v32;

    *(_BYTE *)&v5->_metricsFlags = *(_BYTE *)&v5->_metricsFlags & 0xFE | objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UILabelMetrics_calculated"));
    if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UILabelMetrics_textToUseIsAttributed")))
      v34 = 4;
    else
      v34 = 0;
    *(_BYTE *)&v5->_metricsFlags = *(_BYTE *)&v5->_metricsFlags & 0xFB | v34;
    if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UILabelMetrics_forDrawing")))
      v35 = 8;
    else
      v35 = 0;
    *(_BYTE *)&v5->_metricsFlags = *(_BYTE *)&v5->_metricsFlags & 0xF7 | v35;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double x;
  double y;
  double width;
  double height;
  double firstBaselineOffset;
  double lastBaselineOffset;
  double scaleFactor;
  id v11;

  x = self->_sourceRect.origin.x;
  y = self->_sourceRect.origin.y;
  width = self->_sourceRect.size.width;
  height = self->_sourceRect.size.height;
  v11 = a3;
  objc_msgSend(v11, "encodeRect:forKey:", CFSTR("UILabelMetrics_sourceRect"), x, y, width, height);
  objc_msgSend(v11, "encodeRect:forKey:", CFSTR("UILabelMetrics_bounds"), self->_bounds.origin.x, self->_bounds.origin.y, self->_bounds.size.width, self->_bounds.size.height);
  objc_msgSend(v11, "encodeRect:forKey:", CFSTR("UILabelMetrics_idealBounds"), self->_idealBounds.origin.x, self->_idealBounds.origin.y, self->_idealBounds.size.width, self->_idealBounds.size.height);
  objc_msgSend(v11, "encodeInteger:forKey:", self->_numberOfLines, CFSTR("UILabelMetrics_numberOfLines"));
  firstBaselineOffset = self->_firstBaselineOffset;
  *(float *)&firstBaselineOffset = firstBaselineOffset;
  objc_msgSend(v11, "encodeFloat:forKey:", CFSTR("UILabelMetrics_firstBaselineOffset"), firstBaselineOffset);
  lastBaselineOffset = self->_lastBaselineOffset;
  *(float *)&lastBaselineOffset = lastBaselineOffset;
  objc_msgSend(v11, "encodeFloat:forKey:", CFSTR("UILabelMetrics_lastBaselineOffset"), lastBaselineOffset);
  objc_msgSend(v11, "encodeRect:forKey:", CFSTR("UILabelMetrics_drawingRect"), self->_drawingRect.origin.x, self->_drawingRect.origin.y, self->_drawingRect.size.width, self->_drawingRect.size.height);
  scaleFactor = self->_scaleFactor;
  *(float *)&scaleFactor = scaleFactor;
  objc_msgSend(v11, "encodeFloat:forKey:", CFSTR("UILabelMetrics_scaleFactor"), scaleFactor);
  objc_msgSend(v11, "encodeObject:forKey:", self->_configuration, CFSTR("UILabelMetrics_configuration"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_attributesToUse, CFSTR("UILabelMetrics_attributesToUse"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_textToUse, CFSTR("UILabelMetrics_textToUse"));
  objc_msgSend(v11, "encodeBool:forKey:", *(_BYTE *)&self->_metricsFlags & 1, CFSTR("UILabelMetrics_calculated"));
  objc_msgSend(v11, "encodeBool:forKey:", (*(_BYTE *)&self->_metricsFlags >> 2) & 1, CFSTR("UILabelMetrics_textToUseIsAttributed"));
  objc_msgSend(v11, "encodeBool:forKey:", (*(_BYTE *)&self->_metricsFlags >> 3) & 1, CFSTR("UILabelMetrics_forDrawing"));

}

- (int64_t)numberOfLines
{
  int64_t result;

  -[_UILabelMetrics _calculateIfNeeded]((uint64_t)self);
  result = self->_numberOfLines;
  if (result == -1)
    return -[NSStringDrawingContext numberOfLineFragments](self->_stringDrawingContext, "numberOfLineFragments");
  return result;
}

- (double)scaleFactor
{
  -[_UILabelMetrics _calculateIfNeeded]((uint64_t)self);
  return self->_scaleFactor;
}

- (double)firstLineBaselineOffsetFromTop
{
  -[_UILabelMetrics _calculateIfNeeded]((uint64_t)self);
  return self->_firstBaselineOffset;
}

- (double)lastLineBaselineOffsetFromBottom
{
  double v3;

  -[_UILabelMetrics _calculateIfNeeded]((uint64_t)self);
  -[_UILabelMetrics _intrinsicBaselineSize](self, "_intrinsicBaselineSize");
  return v3 - self->_lastBaselineOffset;
}

- (double)_lastLineBaselineOffsetFromTop
{
  -[_UILabelMetrics _calculateIfNeeded]((uint64_t)self);
  return self->_lastBaselineOffset;
}

- (CGRect)_sourceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sourceRect.origin.x;
  y = self->_sourceRect.origin.y;
  width = self->_sourceRect.size.width;
  height = self->_sourceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)drawingBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  -[_UILabelMetrics _calculateIfNeeded]((uint64_t)self);
  x = self->_drawingRect.origin.x;
  y = self->_drawingRect.origin.y;
  width = self->_drawingRect.size.width;
  height = self->_drawingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  -[_UILabelMetrics _calculateIfNeeded]((uint64_t)self);
  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)intrinsicBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  -[_UILabelMetrics _calculateIfNeeded]((uint64_t)self);
  x = self->_idealBounds.origin.x;
  y = self->_idealBounds.origin.y;
  width = self->_idealBounds.size.width;
  height = self->_idealBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGSize)_intrinsicBaselineSize
{
  CGSize *p_size;
  CGFloat *p_height;
  double v4;
  double width;
  CGSize result;

  if ((*(_BYTE *)&self->_metricsFlags & 0x10) != 0)
  {
    p_height = &self->_idealBounds.size.height;
    p_size = &self->_idealBounds.size;
    if (self->_idealBounds.size.height == 0.0)
    {
      p_size = &self->_bounds.size;
      p_height = &self->_bounds.size.height;
    }
  }
  else
  {
    p_size = &self->_sourceRect.size;
    p_height = &self->_sourceRect.size.height;
  }
  v4 = *p_height;
  width = p_size->width;
  result.height = v4;
  result.width = width;
  return result;
}

- ($00731F7035C2E13BA23DAA730FFC2B6B)_intrinsicSizeBaselineInfo
{
  $00731F7035C2E13BA23DAA730FFC2B6B *result;
  CGPoint origin;
  uint64_t v7;
  char *v8;
  CGSize v9;

  -[_UILabelMetrics _calculateIfNeeded]((uint64_t)self);
  origin = self->_sourceRect.origin;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->_firstBaselineOffset;
  retstr->var2.origin = origin;
  retstr->var2.size = self->_sourceRect.size;
  v7 = 152;
  if (self->_idealBounds.size.height == 0.0)
    v7 = 120;
  v8 = (char *)self + v7;
  v9 = (CGSize)*((_OWORD *)v8 + 1);
  retstr->var4.origin = *(CGPoint *)v8;
  retstr->var3 = self->_numberOfLines;
  retstr->var4.size = v9;
  return result;
}

- (NSStringDrawingContext)_stringDrawingContext
{
  NSStringDrawingContext *stringDrawingContext;
  NSStringDrawingContext *v4;
  int64_t v5;
  _DWORD *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSStringDrawingContext *v12;

  stringDrawingContext = self->_stringDrawingContext;
  if (!stringDrawingContext)
  {
    v4 = (NSStringDrawingContext *)objc_opt_new();
    v5 = -[_UILabelConfiguration numberOfLines](self->_configuration, "numberOfLines");
    -[NSStringDrawingContext setWrapsForTruncationMode:](v4, "setWrapsForTruncationMode:", v5 != 1);
    -[NSStringDrawingContext setMaximumNumberOfLines:](v4, "setMaximumNumberOfLines:", v5);
    -[NSStringDrawingContext setCachesLayout:](v4, "setCachesLayout:", 1);
    -[NSStringDrawingContext setLayout:](v4, "setLayout:", self->_layout);
    -[_UILabelConfiguration _internal]((id *)&self->_configuration->super.isa);
    v6 = (_DWORD *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = v6[6];

      if ((v7 & 0x10) != 0)
        -[NSStringDrawingContext setUsesSimpleTextEffects:](v4, "setUsesSimpleTextEffects:", 1);
    }
    -[_UILabelConfiguration _internal]((id *)&self->_configuration->super.isa);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UILabelConfigurationInternal _cuiCatalog](v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      -[NSStringDrawingContext setCuiCatalog:](v4, "setCuiCatalog:", v9);
    -[_UILabelConfiguration _internal]((id *)&self->_configuration->super.isa);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UILabelConfigurationInternal _cuiStyleEffectConfiguration](v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[NSStringDrawingContext setCuiStyleEffects:](v4, "setCuiStyleEffects:", v11);
      if (objc_msgSend(v11, "useSimplifiedEffect"))
        -[NSStringDrawingContext setUsesSimpleTextEffects:](v4, "setUsesSimpleTextEffects:", 1);
    }
    v12 = self->_stringDrawingContext;
    self->_stringDrawingContext = v4;

    stringDrawingContext = self->_stringDrawingContext;
  }
  return stringDrawingContext;
}

- (BOOL)_hyphenationPossiblyDisabledIfURLsDetected
{
  void *v3;
  void *v4;
  float v5;
  unsigned __int8 *v6;
  _BOOL4 v7;

  -[UIBarButtonItemGroup _items]((id *)&self->_configuration->super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "paragraphStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "hyphenationFactor");
  if (v5 <= 0.0)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    -[_UILabelConfiguration _internal]((id *)&self->_configuration->super.isa);
    v6 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = (v6[24] >> 6) & 1;
    else
      LOBYTE(v7) = 0;

  }
  return v7;
}

- (void)_ensureSynthesizedContent
{
  _UILabelMutableSynthesizedContent *v3;
  void *v4;
  _UILabelSynthesizedContent *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _UILabelConfiguration *configuration;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _UILabelConfiguration *v15;
  uint64_t v16;
  _UILabelSynthesizedContent *synthesizedContent;

  if (!self->_synthesizedContent)
  {
    v3 = [_UILabelMutableSynthesizedContent alloc];
    -[UIBarButtonItemGroup _items]((id *)&self->_configuration->super.isa);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[_UILabelMutableSynthesizedContent initWithContent:](v3, "initWithContent:", v4);

    -[_UILabelConfiguration _internal]((id *)&self->_configuration->super.isa);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (*(unsigned __int8 *)(v6 + 24) >> 6) & 1;
    else
      v8 = 0;
    -[_UILabelSynthesizedContent setDisableLinkHypenation:](v5, "setDisableLinkHypenation:", v8);

    configuration = self->_configuration;
    if (configuration)
      v10 = -[_UILabelConfiguration semanticContentAttribute](configuration, "semanticContentAttribute");
    else
      v10 = 0;
    -[_UILabelSynthesizedContent setSemanticContentAttribute:](v5, "setSemanticContentAttribute:", v10);
    -[_UILabelConfiguration _internal]((id *)&self->_configuration->super.isa);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
      v13 = (*(unsigned __int8 *)(v11 + 24) >> 5) & 1;
    else
      v13 = 0;
    -[_UILabelSynthesizedContent setOverallWritingDirectionFollowsLayoutDirection:](v5, "setOverallWritingDirectionFollowsLayoutDirection:", v13);

    -[_UILabelConfiguration _resolvedTextColor](&self->_configuration->super.isa);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UILabelSynthesizedContent setOverrideTextColor:](v5, "setOverrideTextColor:", v14);

    v15 = self->_configuration;
    if (v15)
      v16 = -[_UILabelConfiguration isEnabled](v15, "isEnabled") ^ 1;
    else
      v16 = 1;
    -[_UILabelSynthesizedContent setEliminateShadows:](v5, "setEliminateShadows:", v16);
    synthesizedContent = self->_synthesizedContent;
    self->_synthesizedContent = v5;

  }
}

- (id)_synthesizedAttributedText
{
  -[_UILabelMetrics _ensureSynthesizedContent](self, "_ensureSynthesizedContent");
  return -[_UILabelSynthesizedContent synthesizedAttributedString](self->_synthesizedContent, "synthesizedAttributedString");
}

- (id)_synthesizedAttributes
{
  -[_UILabelMetrics _ensureSynthesizedContent](self, "_ensureSynthesizedContent");
  return -[_UILabelSynthesizedContent synthesizedAttributes](self->_synthesizedContent, "synthesizedAttributes");
}

- (double)_lineSpacing
{
  double *v2;
  double v3;

  -[_UILabelConfiguration _internal]((id *)&self->_configuration->super.isa);
  v2 = (double *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = v2[1];
  else
    v3 = 0.0;

  return v3;
}

- (_UILabelSynthesizedContent)_synthesizedContent
{
  -[_UILabelMetrics _ensureSynthesizedContent](self, "_ensureSynthesizedContent");
  return self->_synthesizedContent;
}

- (void)_calculateScaledMetricsUsingSize:(CGSize)a3
{
  double height;
  double width;
  _UILabelScaledMetrics *scaledMetrics;
  _UILabelConfiguration *configuration;
  _UILabelScaledMetrics *v8;
  void *v9;
  double *v10;
  _UILabelScaledMetrics *v11;
  _UILabelScaledMetrics *v12;
  double actualScaleFactor;
  _UILabelScaledMetrics *v15;
  void *v16;
  id textToUse;

  height = a3.height;
  width = a3.width;
  scaledMetrics = self->_scaledMetrics;
  configuration = self->_configuration;
  if (configuration && -[_UILabelConfiguration adjustsFontSizeToFitWidth](configuration, "adjustsFontSizeToFitWidth")
    || self->_associatedScaledMetrics)
  {
    v8 = (_UILabelScaledMetrics *)-[_UILabelConfiguration copy](self->_configuration, "copy");
    -[_UILabelMetrics _synthesizedAttributedText](self, "_synthesizedAttributedText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UILabelScaledMetrics setAttributedText:](v8, "setAttributedText:", v9);

    v10 = -[_UILabelScaledMetrics initWithConfiguration:size:associatedScaledMetrics:]((double *)[_UILabelScaledMetrics alloc], v8, self->_associatedScaledMetrics, width, height);
    v11 = self->_scaledMetrics;
    self->_scaledMetrics = (_UILabelScaledMetrics *)v10;

    v12 = self->_scaledMetrics;
    if (!v12)
    {
      v15 = 0;
      goto LABEL_10;
    }
    -[_UILabelScaledMetrics _calculateIfNecessary](self->_scaledMetrics, "_calculateIfNecessary");
    actualScaleFactor = v12->_actualScaleFactor;
    if (actualScaleFactor <= 0.0 || actualScaleFactor >= 1.0)
    {
      v15 = self->_scaledMetrics;
LABEL_10:
      self->_scaledMetrics = 0;

      goto LABEL_14;
    }
    if ((*(_BYTE *)&self->_metricsFlags & 0x10) == 0)
    {
      -[_UILabelScaledMetrics scaledAttributedText]((id *)&self->_scaledMetrics->super.isa);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      textToUse = self->_textToUse;
      self->_textToUse = v16;

      *(_BYTE *)&self->_metricsFlags |= 4u;
    }
  }
  else
  {
    v8 = self->_scaledMetrics;
    self->_scaledMetrics = 0;
  }
LABEL_14:

  if ((scaledMetrics == 0) == (self->_scaledMetrics != 0))
    -[NSStringDrawingContext setLayout:](self->_stringDrawingContext, "setLayout:", 0);
}

- (void)_calculatedSynthesizedContentIfNeeded
{
  NSDictionary *v3;
  char v4;
  __CFString *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id textToUse;
  __CFString *v12;
  NSDictionary *attributesToUse;
  NSDictionary *v14;
  id layout;
  id v16;

  if ((*(_BYTE *)&self->_metricsFlags & 2) == 0)
  {
    *(_BYTE *)&self->_metricsFlags |= 2u;
    -[UIBarButtonItemGroup _items]((id *)&self->_configuration->super.isa);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    -[_UILabelMetrics _synthesizedAttributes](self, "_synthesizedAttributes");
    v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    if ((*(_BYTE *)&self->_metricsFlags & 8) != 0 || objc_msgSend(v16, "length"))
      goto LABEL_4;
    v6 = objc_alloc(MEMORY[0x1E0CB3498]);
    v7 = (void *)MEMORY[0x1E0C99D80];
    -[_UILabelConfiguration font](self->_configuration, "font");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
    {
      +[UILabel defaultFont](UILabel, "defaultFont");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "dictionaryWithObject:forKey:", v9, *(_QWORD *)off_1E1678D90);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (__CFString *)objc_msgSend(v6, "initWithString:attributes:", 0x1E1787D00, v10);

    if (!v8)
    if (!v5)
    {
LABEL_4:
      if ((objc_msgSend(v16, "isNil") & 1) != 0)
      {
        v4 = 0;
        v5 = &stru_1E16EDF20;
LABEL_16:
        textToUse = self->_textToUse;
        self->_textToUse = v5;
        v12 = v5;

        *(_BYTE *)&self->_metricsFlags = *(_BYTE *)&self->_metricsFlags & 0xFB | v4;
        attributesToUse = self->_attributesToUse;
        self->_attributesToUse = v3;
        v14 = v3;

        layout = self->_layout;
        self->_layout = 0;

        -[_UILabelMetrics _calculateScaledMetricsUsingSize:](self, "_calculateScaledMetricsUsingSize:", self->_sourceRect.size.width, self->_sourceRect.size.height);
        return;
      }
      if ((objc_msgSend(v16, "isAttributed") & 1) == 0
        && !-[_UILabelMetrics _hyphenationPossiblyDisabledIfURLsDetected](self, "_hyphenationPossiblyDisabledIfURLsDetected"))
      {
        objc_msgSend(v16, "string");
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v4 = 0;
        goto LABEL_16;
      }
      -[_UILabelMetrics _synthesizedAttributedText](self, "_synthesizedAttributedText");
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v4 = 4;
    goto LABEL_16;
  }
}

- (void)draw
{
  _UILabelMetrics *v2;
  char metricsFlags;
  void *v4;
  uint64_t v5;
  _UILabelMetrics *v6;
  _UILabelMetrics *v7;
  _UILabelMetrics *v8;
  double y;
  double x;
  double height;
  double width;
  void *v13;
  _UILabelConfiguration *configuration;
  uint64_t v15;
  _UILabelConfigurationInternal *internal;
  $80F9FF894D804BF481F9E54DC1AB63BD configurationFlags;
  uint64_t v18;
  id textToUse;
  _UILabelMetrics *v20;

  if (self)
  {
    v2 = self;
    metricsFlags = (char)self->_metricsFlags;
    if ((metricsFlags & 8) != 0)
    {
LABEL_5:
      *(_BYTE *)&v2->_metricsFlags = metricsFlags | 8;
      v6 = self;
      v7 = self;
      goto LABEL_6;
    }
    -[UIBarButtonItemGroup _items]((id *)&self->_configuration->super.isa);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");

    if (v5 >= 1)
    {
      v2 = self;
      metricsFlags = (char)self->_metricsFlags;
      goto LABEL_5;
    }
    v20 = -[_UILabelMetrics _initWithConfiguration:sourceRect:synthesizedContent:associatedScaledMetrics:]([_UILabelMetrics alloc], "_initWithConfiguration:sourceRect:synthesizedContent:associatedScaledMetrics:", self->_configuration, 0, self->_associatedScaledMetrics, self->_sourceRect.origin.x, self->_sourceRect.origin.y, self->_sourceRect.size.width, self->_sourceRect.size.height);
    *(_BYTE *)&v20->_metricsFlags |= 8u;
  }
  else
  {
    v20 = 0;
  }
  v7 = self;
  if (v20 != self)
  {
    -[_UILabelMetrics draw](v20, "draw");
    v8 = v20;
    goto LABEL_18;
  }
LABEL_6:
  -[_UILabelMetrics _calculateIfNeeded]((uint64_t)v7);
  v8 = self;
  if (self->_textToUse)
  {
    x = self->_drawingRect.origin.x;
    y = self->_drawingRect.origin.y;
    width = self->_drawingRect.size.width;
    height = self->_drawingRect.size.height;
    -[_UILabelMetrics _stringDrawingContext](self, "_stringDrawingContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    configuration = self->_configuration;
    if (configuration)
    {
      v15 = 1048577;
      internal = configuration->_internal;
      if (internal)
      {
        configurationFlags = internal->_configurationFlags;
        v18 = 1048705;
        if ((*(_BYTE *)&configurationFlags & 2) == 0)
          v18 = 1048577;
        v15 = v18 | (*(_WORD *)&configurationFlags << 7) & 0x200 | (*(_WORD *)&configurationFlags << 7) & 0x400;
      }
    }
    else
    {
      v15 = 0;
    }
    if (-[_UILabelConfiguration numberOfLines](configuration, "numberOfLines") == 1)
      objc_msgSend(v13, "setMinimumScaleFactor:", 0.0);
    textToUse = self->_textToUse;
    if ((*(_BYTE *)&self->_metricsFlags & 4) != 0)
      objc_msgSend(textToUse, "drawWithRect:options:context:", v15, v13, x, y, width, height);
    else
      objc_msgSend(textToUse, "drawWithRect:options:attributes:context:", v15, self->_attributesToUse, v13, x, y, width, height);

    v8 = self;
  }
LABEL_18:

}

- (id)description
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  if ((*(_BYTE *)&self->_metricsFlags & 1) != 0)
    v3 = &stru_1E16EDF20;
  else
    v3 = CFSTR("{Calculated} ");
  if ((*(_BYTE *)&self->_metricsFlags & 2) != 0)
    v4 = &stru_1E16EDF20;
  else
    v4 = CFSTR("{ContentSynthesized} ");
  v5 = v4;
  v6 = v3;
  -[_UILabelMetrics _calculateIfNeeded]((uint64_t)self);
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = objc_opt_class();
  NSStringFromCGRect(self->_sourceRect);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGRect(self->_bounds);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGRect(self->_drawingRect);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGRect(self->_idealBounds);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UILabelMetrics firstLineBaselineOffsetFromTop](self, "firstLineBaselineOffsetFromTop");
  v14 = v13;
  -[_UILabelMetrics lastLineBaselineOffsetFromBottom](self, "lastLineBaselineOffsetFromBottom");
  objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@:%p %@%@sourceBounds=%@ bounds=%@ drawingBounds=%@ idealBounds=%@ firstLineBaseline=%f lastLineBaseline=%f numberOfLines=%ld scaleFactor=%f>"), v8, self, v6, v5, v9, v10, v11, v12, v14, v15, self->_numberOfLines, *(_QWORD *)&self->_scaleFactor);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (_UILabelConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedScaledMetrics, 0);
  objc_storeStrong(&self->_layout, 0);
  objc_storeStrong((id *)&self->_attributesToUse, 0);
  objc_storeStrong(&self->_textToUse, 0);
  objc_storeStrong((id *)&self->_scaledMetrics, 0);
  objc_storeStrong((id *)&self->_synthesizedContent, 0);
  objc_storeStrong((id *)&self->_stringDrawingContext, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
