@implementation TUISmartGridSwooshLayoutManager

- (TUISmartGridSwooshLayoutManager)initWithContent:(id)a3
{
  id v5;
  TUISmartGridSwooshLayoutManager *v6;
  TUISmartGridSwooshLayoutManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUISmartGridSwooshLayoutManager;
  v6 = -[TUISmartGridSwooshLayoutManager init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_content, a3);

  return v7;
}

+ (void)configureScrollLayout:(id)a3 configuration:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v12 = a3;
  v5 = a4;
  objc_msgSend(v5, "contentInsets");
  v7 = v6;
  v9 = v8;
  if (objc_msgSend(v5, "paginated"))
  {
    objc_msgSend(v5, "width");
    v11 = v10 - v7 - v9;
  }
  else
  {
    objc_msgSend(v5, "width");
  }
  objc_msgSend(v12, "setContainingWidth:", v11);

}

+ (void)configureContentLayout:(id)a3 configuration:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v12 = a3;
  v5 = a4;
  objc_msgSend(v5, "contentInsets");
  v7 = v6;
  v9 = v8;
  if (objc_msgSend(v5, "paginated"))
  {
    objc_msgSend(v5, "width");
    v11 = v10 - v7 - v9;
  }
  else
  {
    objc_msgSend(v5, "width");
  }
  objc_msgSend(v12, "setContainingWidth:", v11);

}

- (void)positionContainerLayout:(id)a3
{
  unsigned int v4;
  double v5;
  double v6;
  id v7;

  v7 = a3;
  v4 = -[TUISmartGridLayoutConfiguration paginated](self->_configuration, "paginated");
  v5 = 0.0;
  if (v4)
  {
    -[TUISmartGridLayoutConfiguration contentInsets](self->_configuration, "contentInsets", 0.0);
    v5 = v6;
  }
  objc_msgSend(v7, "setComputedOrigin:", v5, 0.0);

}

- (unint64_t)ruleLayoutAxis
{
  char *v2;

  v2 = (char *)-[TUISmartGridLayoutConfiguration rows](self->_configuration, "rows");
  if (v2 == (char *)0x7FFFFFFFFFFFFFFFLL || v2 == (_BYTE *)&dword_0 + 1)
    return 2;
  else
    return 1;
}

- (UIEdgeInsets)scrollGradientInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[TUISmartGridLayoutConfiguration gradientInsets](self->_configuration, "gradientInsets");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)scrollGradientFraction
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[TUISmartGridLayoutConfiguration gradientFraction](self->_configuration, "gradientFraction");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)layoutContent:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  char *v11;
  id v12;
  void *v13;
  _BOOL4 v15;
  char *v16;
  char *v17;
  char *v18;
  unint64_t v19;
  id v20;
  id v21;
  id v22;
  unint64_t computedColumns;
  id v24;
  uint64_t v25;
  double v26;
  id v27;
  uint64_t v28;
  char *v29;
  unint64_t v30;
  unint64_t v31;
  char *v32;
  id v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char *v38;
  id v39;
  id v40;
  _BOOL8 v41;
  id v42;
  unint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  id v50;
  int *v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  char *v55;
  int v56;
  char *v57;
  unint64_t v58;
  unint64_t v59;
  id columnsPerSection;
  id v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  id v66;
  id v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t *v70;
  unint64_t v71;
  unint64_t *v72;
  uint64_t v73;
  unint64_t *v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t *v77;
  unint64_t *v78;
  char v79;
  unint64_t *v80;
  unint64_t v81;
  unint64_t v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  id v87;
  id v88;
  void *v89;
  uint64_t v90;
  double v91;
  double v92;
  double v93;
  void *v94;
  double v95;
  double v96;
  unint64_t v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  char *v104;
  uint64_t v105;
  _QWORD *v106;
  unint64_t v107;
  uint64_t i;
  uint64_t v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  NSArray *v117;
  NSArray *v118;
  double v119;
  uint64_t v120;
  double computedColumnSpacing;
  double computedColumnWidth;
  double computedRowSpacing;
  void *v124;
  double v125;
  double v126;
  unint64_t v127;
  double v128;
  double v129;
  uint64_t v130;
  _QWORD *v131;
  double v132;
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
  double v143;
  double v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  NSMutableArray *v149;
  NSMutableArray *v150;
  char *v151;
  char *v152;
  uint64_t v153;
  uint64_t v154;
  id v155;
  id v156;
  int *v157;
  uint64_t v158;
  char *v159;
  double v160;
  double v161;
  double v162;
  double v163;
  double v164;
  double v165;
  double v166;
  double v167;
  double v168;
  double v169;
  double v170;
  NSArray *v171;
  NSArray *nonScrollableAdornmentLayouts;
  double v173;
  __int128 v174;
  double v175;
  double v176;
  double v177;
  void *v178;
  double v179;
  double v180;
  unint64_t v181;
  double v182;
  double v183;
  uint64_t *v184;
  uint64_t *v185;
  uint64_t v186;
  uint64_t v187;
  BOOL v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  BOOL v192;
  uint64_t v193;
  vector<std::pair<TUICellModel *, CGRect>, std::allocator<std::pair<TUICellModel *, CGRect>>> *p_cellBounds;
  char *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  double x;
  double y;
  double width;
  double height;
  id v204;
  id v205;
  char *end;
  char *value;
  void *v208;
  char *begin;
  unint64_t v210;
  unint64_t v211;
  unint64_t v212;
  unint64_t v213;
  char *v214;
  double *v215;
  char *v216;
  uint64_t v217;
  __int128 v218;
  int64x2_t v219;
  void *v220;
  double *v221;
  vector<double, std::allocator<double>> *p_scrollAnchors;
  unint64_t v223;
  unint64_t v224;
  double v225;
  double v226;
  double v227;
  double v228;
  unint64_t v229;
  unint64_t v230;
  double v231;
  double v232;
  double v233;
  double v234;
  unint64_t v235;
  unint64_t v236;
  double v237;
  double v238;
  double v239;
  double v240;
  double *v241;
  double *v242;
  double *v243;
  double *v244;
  uint64_t v245;
  unint64_t v246;
  uint64_t v247;
  unint64_t v248;
  char *v249;
  double *v250;
  uint64_t v251;
  unint64_t **v252;
  char *v253;
  double v254;
  unint64_t *v255;
  unint64_t *v256;
  unint64_t v257;
  BOOL v258;
  double v259;
  double v260;
  double *v261;
  double *v262;
  double *v263;
  double *v264;
  uint64_t v265;
  unint64_t v266;
  uint64_t v267;
  unint64_t v268;
  char *v269;
  double *v270;
  uint64_t v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 *v275;
  double v276;
  double v277;
  char *v278;
  CGFloat v279;
  id v280;
  unint64_t v281;
  unint64_t v282;
  TUISmartGridSwooshLayoutManager *v283;
  char *v284;
  unint64_t v285;
  char *v286;
  unint64_t v287;
  char *j;
  __int128 v289;
  __int128 v290;
  __int128 v291;
  __int128 v292;
  __int128 v293;
  __int128 v294;
  __int128 v295;
  __int128 v296;
  NSMutableArray *v297;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  _BYTE v302[32];
  __int128 v303;
  __int128 v304;
  uint64_t v305;
  double v306;
  int v307;
  void *v308;
  void *v309;
  uint64_t v310;
  __int128 v311;
  uint64_t v312;
  char **v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  double v317;
  int v318;
  char **v319;
  void *v320;
  void *v321;
  uint64_t v322;
  __int128 v323;
  __int128 v324;
  __int128 v325;
  __int128 v326;
  _BYTE v327[32];
  __int128 v328;
  __int128 v329;
  __int128 v330;
  __int128 v331;
  __int128 v332;
  unint64_t v333;
  uint64_t v334;
  CGFloat v335;
  unint64_t v336;
  uint64_t v337;
  double v338;
  double v339;
  double v340;
  double v341;
  double v342;
  double v343;
  double v344;
  double v345;
  double v346;
  id v347;
  double v348;
  unint64_t v349;
  char *v350;
  char *v351;
  _QWORD v352[3];
  __int128 v353;
  void *v354;
  void *v355;
  void *v356;
  void *v357;
  void *v358;
  void *v359;
  CGRect v360;

  v280 = a3;
  v278 = (char *)objc_msgSend(v280, "computedLayoutDirection");
  -[TUISmartGridLayoutConfiguration contentInsets](self->_configuration, "contentInsets");
  v276 = v5;
  v277 = v4;
  v7 = v6;
  v9 = v8;
  -[TUISmartGridLayoutConfiguration width](self->_configuration, "width");
  v279 = v10;
  v11 = (char *)-[TUISmartGridLayoutConfiguration rows](self->_configuration, "rows");
  if (-[TUISmartGridLayoutConfiguration maxPages](self->_configuration, "maxPages") == (id)0x7FFFFFFFFFFFFFFFLL)
    v12 = 0;
  else
    v12 = -[TUISmartGridLayoutConfiguration maxPages](self->_configuration, "maxPages");
  self->_computedColumns = +[TUISmartGridBox columnsWithConfiguration:](TUISmartGridBox, "columnsWithConfiguration:", self->_configuration);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v280, "children"));
  v15 = v11 == (_BYTE *)&dword_0 + 1 || v11 == (char *)0x7FFFFFFFFFFFFFFFLL;
  sub_61D50((uint64_t)&v350, v13, self->_content, v15);

  if (-[TUISmartGridLayoutConfiguration balanceSections](self->_configuration, "balanceSections"))
  {
    v16 = v351;
    v17 = v350;
    if (v351 != v350)
    {
      v18 = v11;
      v19 = 0;
      v285 = 0x2E8BA2E8BA2E8BA3 * ((v351 - v350) >> 3);
      do
      {
        v20 = *((id *)v17 + 6);
        v21 = objc_msgSend(v20, "columns");

        if (v21 == (id)0x7FFFFFFFFFFFFFFFLL)
          v22 = 0;
        else
          v22 = v21;
        v19 += (unint64_t)v22;
        v17 += 88;
      }
      while (v17 != v16);
      v11 = v18;
      if (v19)
      {
        computedColumns = self->_computedColumns;
        if (v19 < computedColumns)
        {
          if (computedColumns % v285)
            self->_computedColumns = v19;
          else
            self->_columnsPerSection = computedColumns / v285;
        }
      }
    }
  }
  v24 = -[TUISmartGridLayoutConfiguration columnSpacing](self->_configuration, "columnSpacing");
  self->_computedColumnSpacing = TUILengthValueWithDefault((uint64_t)v24, v25, 0.0);
  +[TUISmartGridBox columnWidthWithConfiguration:columns:spacing:](TUISmartGridBox, "columnWidthWithConfiguration:columns:spacing:", self->_configuration, self->_computedColumns);
  self->_computedColumnWidth = v26;
  v27 = -[TUISmartGridLayoutConfiguration rowSpacing](self->_configuration, "rowSpacing");
  self->_computedRowSpacing = TUILengthValueWithDefault((uint64_t)v27, v28, 0.0);
  if (v11 != (char *)0x7FFFFFFFFFFFFFFFLL && v11 != (_BYTE *)&dword_0 + 1)
  {
    v53 = 0;
    if (v351 != v350)
    {
      v54 = v350 + 8;
      while (*v54 == *(v54 - 1))
      {
        ++v53;
        v54 += 11;
        if ((v351 - v350) / 88 == v53)
        {
          v53 = (v351 - v350) / 88;
          break;
        }
      }
    }
    v287 = (unint64_t)v11;
    *(_QWORD *)&v311 = &v350;
    *((_QWORD *)&v311 + 1) = v53;
    v312 = 0;
    v313 = &v350;
    v314 = (v351 - v350) / 88;
    v315 = 0;
    v319 = &v350;
    v55 = (char *)-[TUISmartGridLayoutConfiguration verticalPlacement](self->_configuration, "verticalPlacement");
    if ((unint64_t)(v55 - 2) < 4)
      v56 = (_DWORD)v55 - 1;
    else
      v56 = 5;
    v318 = v56;
    v57 = v350;
    v284 = v351;
    if (v350 != v351)
    {
      v58 = 0;
      v59 = self->_computedColumns * (_QWORD)v12;
      v275 = &v328;
      v282 = v59;
      while (1)
      {
        sub_CBE58((uint64_t)v327, v287);
        columnsPerSection = (id)self->_columnsPerSection;
        if (columnsPerSection)
        {
          if (!v59)
            goto LABEL_81;
        }
        else
        {
          v61 = *((id *)v57 + 6);
          columnsPerSection = objc_msgSend(v61, "columns");

          if (!v59)
            goto LABEL_81;
        }
        if (v59 > v58)
        {
          if ((unint64_t)columnsPerSection >= v59 - v58)
            columnsPerSection = (id)(v59 - v58);
          goto LABEL_83;
        }
LABEL_81:
        if (v59)
        {
          v62 = 0;
          goto LABEL_86;
        }
LABEL_83:
        if (columnsPerSection == (id)0x7FFFFFFFFFFFFFFFLL)
          v62 = 0;
        else
          v62 = columnsPerSection;
LABEL_86:
        *(_QWORD *)&v329 = v62;
        *((_QWORD *)v57 + 7) = v58;
        *((_QWORD *)v57 + 8) = 0;
        v64 = *(_QWORD *)v57;
        v63 = *((_QWORD *)v57 + 1);
        while (v64 != v63)
        {
          v65 = *(id *)(v64 + 32);
          v66 = objc_msgSend(v65, "rowSpan");
          v67 = *(id *)(v64 + 32);
          sub_CB1B4((unint64_t *)v327, (uint64_t)v66, (uint64_t)objc_msgSend(v67, "columnSpan"), (uint64_t)v302);

          *(_QWORD *)(v64 + 8) = *(_QWORD *)v302;
          *(_QWORD *)v64 = *(_QWORD *)&v302[8] + v58;
          *(int8x16_t *)(v64 + 16) = vextq_s8(*(int8x16_t *)&v302[16], *(int8x16_t *)&v302[16], 8uLL);
          v64 += 96;
        }
        v68 = *((_QWORD *)&v328 + 1);
        v69 = v328;
        if ((_QWORD)v328)
        {
          v70 = *(unint64_t **)&v327[8];
          v71 = *(_QWORD *)v327;
          v72 = *(unint64_t **)&v327[16];
          v73 = *((_QWORD *)&v328 + 1);
          if (*(_QWORD *)&v327[8] != *(_QWORD *)&v327[16])
          {
            v74 = *(unint64_t **)&v327[8];
            do
            {
              if (*v74)
                --*v74;
              ++v74;
            }
            while (v74 != v72);
            v73 = *((_QWORD *)&v328 + 1);
          }
          v75 = v73 + 1;
          *((_QWORD *)&v328 + 1) = v75;
          *(_QWORD *)&v328 = 0;
          if (v69 < v71)
            goto LABEL_109;
        }
        else
        {
          v70 = *(unint64_t **)&v327[8];
          v72 = *(unint64_t **)&v327[16];
          v75 = *((_QWORD *)&v328 + 1);
        }
        v76 = -1;
        *(_QWORD *)v302 = -1;
        if (v70 == v72)
          goto LABEL_107;
        v77 = v70;
        do
        {
          v78 = v77;
          if (v76 != -1)
          {
            if (*v77 >= v76)
              v78 = (unint64_t *)v302;
            else
              v78 = v77;
          }
          v76 = *v78;
          *(_QWORD *)v302 = *v78;
          ++v77;
        }
        while (v77 != v72);
        if (v76 == -1)
LABEL_107:
          v76 = 0;
        v68 = v76 + v75;
LABEL_109:
        if (v70 != v72)
        {
          v79 = 0;
LABEL_111:
          v80 = v70;
          do
          {
            while (*v80)
            {
              --*v80++;
              v79 = 1;
              if (v80 == v72)
              {
LABEL_118:
                v79 = 0;
                ++*((_QWORD *)&v328 + 1);
                *(_QWORD *)&v328 = 0;
                goto LABEL_111;
              }
            }
            ++v80;
          }
          while (v80 != v72);
          if ((v79 & 1) != 0)
            goto LABEL_118;
        }
        if (-[TUISmartGridLayoutConfiguration columnMultiple](self->_configuration, "columnMultiple", v275)
          && -[TUISmartGridLayoutConfiguration truncate](self->_configuration, "truncate")
          && v68 > (unint64_t)-[TUISmartGridLayoutConfiguration columnMultiple](self->_configuration, "columnMultiple"))
        {
          v81 = *((_QWORD *)&v328 + 1);
          if ((_QWORD)v329)
            v81 = v329;
          if (v68 < v81)
          {
            v82 = (unint64_t)-[TUISmartGridLayoutConfiguration columnMultiple](self->_configuration, "columnMultiple");
            v83 = v68 / v82 * v82;
            *(_QWORD *)v275 = 0;
            *((_QWORD *)v275 + 1) = 0;
            if (v83 == 0x7FFFFFFFFFFFFFFFLL)
              v83 = 0;
            *(_QWORD *)&v329 = v83;
            v85 = *(_QWORD *)v57;
            v84 = *((_QWORD *)v57 + 1);
            while (v85 != v84)
            {
              v86 = *(id *)(v85 + 32);
              v87 = objc_msgSend(v86, "rowSpan");
              v88 = *(id *)(v85 + 32);
              sub_CB1B4((unint64_t *)v327, (uint64_t)v87, (uint64_t)objc_msgSend(v88, "columnSpan"), (uint64_t)v302);

              *(_QWORD *)(v85 + 8) = *(_QWORD *)v302;
              *(_QWORD *)v85 = *(_QWORD *)&v302[8] + v58;
              *(int8x16_t *)(v85 + 16) = vextq_s8(*(int8x16_t *)&v302[16], *(int8x16_t *)&v302[16], 8uLL);
              v85 += 96;
            }
          }
        }
        v89 = *(void **)&v327[8];
        if ((_QWORD)v329)
          v90 = v329;
        else
          v90 = *((_QWORD *)&v328 + 1);
        *((_QWORD *)v57 + 9) = v90;
        *((_QWORD *)v57 + 10) = 1;
        if (v89)
        {
          *(_QWORD *)&v327[16] = v89;
          operator delete(v89);
        }
        v58 += v90;
        v57 += 88;
        v59 = v282;
        if (v57 == v284)
          goto LABEL_174;
      }
    }
    v58 = 0;
LABEL_174:
    sub_CB35C((uint64_t)&v350);
    *(_QWORD *)&v353 = v58;
    v120 = *((_QWORD *)&v353 + 1);
    computedColumnWidth = self->_computedColumnWidth;
    computedColumnSpacing = self->_computedColumnSpacing;
    computedRowSpacing = self->_computedRowSpacing;
    v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v280, "controller"));
    objc_msgSend(v124, "contentsScale");
    v335 = v279;
    v336 = v58;
    v337 = v120;
    v338 = v7;
    v339 = v277;
    v340 = v9;
    v341 = v276;
    v342 = computedColumnWidth;
    v343 = computedColumnSpacing;
    v346 = computedRowSpacing;
    v347 = v278;
    v348 = v125;
    v349 = 0;
    if (v58 < 2 || computedColumnSpacing == 0.0)
    {
      v344 = computedColumnWidth;
    }
    else
    {
      v126 = computedColumnWidth;
      if (v125 > 0.0)
        v126 = floor(computedColumnWidth * v125) / v125;
      v344 = v126;
      computedColumnSpacing = ((computedColumnWidth - v126) * (double)v58 + computedColumnSpacing * (double)(v58 - 1))
                            / (double)(v58 - 1);
    }
    v345 = computedColumnSpacing;

    if (-[TUISmartGridLayoutConfiguration paginated](self->_configuration, "paginated"))
    {
      v127 = self->_computedColumns;
      v349 = v127;
      if (!v127)
        v127 = v336;
      v128 = v343;
      if (v343 == 0.0 || v127 < 2)
      {
        v344 = v342;
      }
      else
      {
        v129 = v342;
        if (v348 > 0.0)
          v129 = floor(v342 * v348) / v348;
        v344 = v129;
        v128 = ((v342 - v129) * (double)v127 + v343 * (double)(v127 - 1)) / (double)(v127 - 1);
      }
      v345 = v128;
    }
    v130 = sub_5F7DC((uint64_t)&v350, (char *)&dword_4 + 1);
    v131 = (_QWORD *)v130;
    if (v352[1] == v130)
    {
      *(CGSize *)v327 = CGSizeZero;
      *(_OWORD *)&v327[16] = 0u;
      v328 = 0u;
      sub_5FCC0((uint64_t)&self->_cellDividers, (uint64_t)v327);
      *(_QWORD *)v302 = &v327[24];
      sub_618C0((void ***)v302);

    }
    else
    {
      if (v349)
      {
        v132 = v344;
        v133 = v348;
        v134 = v345 + v344;
        if (v345 == 0.0)
        {
          v136 = v134 * 0.0;
          if (v348 > 0.0)
            v136 = floor(v136 * v348) / v348;
        }
        else
        {
          v135 = v134 - v345;
          if (v348 > 0.0)
            v135 = floor(v135 * v348) / v348;
          v136 = v135 - v344;
        }
      }
      else
      {
        v132 = v344;
        v133 = v348;
        v134 = v345 + v344;
        v136 = 0.0;
      }
      if (v345 == 0.0)
      {
        v140 = v134 - v345;
        if (v133 <= 0.0)
        {
          v141 = v134 * 0.0;
        }
        else
        {
          v140 = floor(v133 * v140) / v133;
          v141 = floor(v133 * (v134 * 0.0)) / v133;
        }
        v144 = 0.0;
        if (v349)
          v144 = v141;
        v142 = v136 + v140;
        v143 = v144 + v141;
      }
      else
      {
        v137 = v345 * -2.0 + v134 * 2.0;
        if (v133 <= 0.0)
        {
          v138 = v134 - v345;
          v139 = v134 - v345 - v132;
        }
        else
        {
          v137 = floor(v133 * v137) / v133;
          v138 = floor(v133 * (v134 - v345)) / v133;
          v139 = v138 - v132;
        }
        if (!v349)
          v139 = 0.0;
        v142 = v136 + v137 - v132;
        v143 = v139 + v138 - v132;
      }
      sub_658DC((uint64_t)&v297, 0, *(_QWORD *)(v130 + 40), *(_QWORD *)(v130 + 48), v142 - v143);
      v146 = v145;
      v148 = v147;
      v131[9] = v145;
      v131[10] = v147;
      sub_5FA24((uint64_t)v131, 1);
      v149 = objc_opt_new(NSMutableArray);
      sub_5FB58(&v350, v131, v149);
      v150 = v149;
      *(_QWORD *)v327 = v146;
      *(_QWORD *)&v327[8] = v148;
      *(_OWORD *)&v327[16] = (unint64_t)v150;
      v328 = 0uLL;
      sub_5FCC0((uint64_t)&self->_cellDividers, (uint64_t)v327);
      *(_QWORD *)v302 = &v327[24];
      sub_618C0((void ***)v302);

    }
    v151 = v350;
    v152 = v351;
    if (v350 == v351)
    {
      v159 = v350;
LABEL_225:
      v160 = v338;
      v295 = (unint64_t)&v350;
      v296 = (unint64_t)(0x2E8BA2E8BA2E8BA3 * ((v159 - v151) >> 3));
      sub_65C04((uint64_t)&v295);
      *(_QWORD *)&v293 = &v350;
      *((_QWORD *)&v293 + 1) = 0x2E8BA2E8BA2E8BA3 * ((v351 - v350) >> 3);
      v294 = *((unint64_t *)&v293 + 1);
      sub_65C04((uint64_t)&v293);
      *(_OWORD *)v327 = v295;
      *(_OWORD *)&v327[16] = v296;
      v328 = v293;
      v329 = v294;
      *(_QWORD *)&v330 = 0;
      *((double *)&v330 + 1) = v160;
      LODWORD(v331) = 0;
      v334 = 0;
      *((_QWORD *)&v332 + 1) = 0;
      v333 = 0;
      sub_5FE6C((uint64_t)v327, (uint64_t)&v335, &v350, 0);
      v162 = v161;
      v163 = v160 + v161;
      sub_CB3BC((uint64_t)&v311, (uint64_t)&v335, (uint64_t)&self->_cellDividers, 0.0, v160 + v161);
      v110 = v164;
      v166 = v165;
      v291 = (unint64_t)&v350;
      v292 = (unint64_t)(0x2E8BA2E8BA2E8BA3 * ((v351 - v350) >> 3));
      sub_67338((uint64_t)&v291);
      *(_QWORD *)&v289 = &v350;
      *((_QWORD *)&v289 + 1) = 0x2E8BA2E8BA2E8BA3 * ((v351 - v350) >> 3);
      v290 = *((unint64_t *)&v289 + 1);
      sub_67338((uint64_t)&v289);
      v167 = v163 + v166;
      *(_OWORD *)v302 = v291;
      *(_OWORD *)&v302[16] = v292;
      v303 = v289;
      v304 = v290;
      v305 = 0;
      v306 = v163 + v166;
      v307 = 0;
      v309 = 0;
      v310 = 0;
      v308 = 0;
      sub_60890((uint64_t)v302, (uint64_t)&v335, &v350, 0);
      v169 = v168;
      v170 = v340;
      sub_90AE0(&v297);
      sub_CB590((id *)&v297, (uint64_t)&v350, (uint64_t)&v335, &v350, 0.0, v162, v166);
      v171 = (NSArray *)-[NSMutableArray copy](v297, "copy");
      nonScrollableAdornmentLayouts = self->_nonScrollableAdornmentLayouts;
      self->_nonScrollableAdornmentLayouts = v171;

      if (v308)
      {
        v309 = v308;
        operator delete(v308);
      }
      v173 = v167 + v169;
      if (*((_QWORD *)&v332 + 1))
      {
        v333 = *((_QWORD *)&v332 + 1);
        operator delete(*((void **)&v332 + 1));
      }
      v119 = v173 + v170;
      goto LABEL_230;
    }
LABEL_215:
    v153 = *((_QWORD *)v151 + 3);
    v154 = *((_QWORD *)v151 + 4);
    while (1)
    {
      if (v153 == v154)
      {
        v151 += 88;
        if (v151 == v152)
        {
          v159 = v351;
          v151 = v350;
          goto LABEL_225;
        }
        goto LABEL_215;
      }
      v155 = *(id *)(v153 + 32);
      if (objc_msgSend(v155, "role") == (char *)&dword_0 + 3)
      {

      }
      else
      {
        v156 = *(id *)(v153 + 32);
        v157 = (int *)objc_msgSend(v156, "role");

        if (v157 != &dword_4)
          goto LABEL_221;
      }
      *(_QWORD *)v153 = *((_QWORD *)v151 + 7);
      v158 = *((_QWORD *)v151 + 9);
      *(_QWORD *)(v153 + 8) = 0;
      *(_QWORD *)(v153 + 16) = v158;
      *(_QWORD *)(v153 + 24) = 1;
LABEL_221:
      v153 += 96;
    }
  }
  v29 = v350;
  v286 = v351;
  if (v350 == v351)
  {
    v30 = 0;
    v353 = xmmword_22F3C0;
    v46 = 1;
    goto LABEL_138;
  }
  v30 = 0;
  v31 = self->_computedColumns * (_QWORD)v12;
  v281 = v31;
  v283 = self;
  do
  {
    *((_QWORD *)v29 + 7) = v30;
    *((_QWORD *)v29 + 8) = 0;
    v32 = (char *)self->_columnsPerSection;
    if (v32)
    {
      if (!v31)
        goto LABEL_34;
    }
    else
    {
      v33 = *((id *)v29 + 6);
      v32 = (char *)objc_msgSend(v33, "columns");

      if (!v31)
        goto LABEL_34;
    }
    if (v31 > v30)
    {
      if ((unint64_t)v32 >= v31 - v30)
        v32 = (char *)(v31 - v30);
      goto LABEL_36;
    }
LABEL_34:
    if (v31)
    {
      v34 = 0;
      goto LABEL_39;
    }
LABEL_36:
    if (v32 == (char *)0x7FFFFFFFFFFFFFFFLL)
      v34 = 0;
    else
      v34 = v32;
LABEL_39:
    v36 = *(_QWORD *)v29;
    v35 = *((_QWORD *)v29 + 1);
    if (*(_QWORD *)v29 == v35)
    {
      v37 = 0;
    }
    else
    {
      v37 = 0;
      v38 = v34 - 1;
      do
      {
        v39 = *(id *)(v36 + 32);
        v40 = objc_msgSend(v39, "columnSpan");
        v41 = (unint64_t)v38 >= v37;
        if ((unint64_t)v38 >= v37)
          v42 = v40;
        else
          v42 = 0;
        if ((unint64_t)v38 >= v37)
          v43 = v37;
        else
          v43 = 0;
        if ((unint64_t)v38 >= v37)
          v37 += (unint64_t)v40;

        *(_QWORD *)v36 = v43 + v30;
        *(_QWORD *)(v36 + 8) = 0;
        *(_QWORD *)(v36 + 16) = v42;
        *(_QWORD *)(v36 + 24) = v41;
        v36 += 96;
      }
      while (v36 != v35);
    }
    *((_QWORD *)v29 + 9) = v37;
    *((_QWORD *)v29 + 10) = 1;
    v30 += v37;
    v29 += 88;
    self = v283;
    v31 = v281;
  }
  while (v29 != v286);
  v44 = v350;
  v45 = v351;
  v46 = 1;
  *(_QWORD *)&v353 = v30;
  *((_QWORD *)&v353 + 1) = 1;
  if (v350 != v351)
  {
    while (1)
    {
      v47 = *((_QWORD *)v44 + 3);
      v48 = *((_QWORD *)v44 + 4);
      while (v47 != v48)
      {
        v49 = *(id *)(v47 + 32);
        if (objc_msgSend(v49, "role") == (char *)&dword_0 + 3)
        {

        }
        else
        {
          v50 = *(id *)(v47 + 32);
          v51 = (int *)objc_msgSend(v50, "role");

          if (v51 != &dword_4)
            goto LABEL_60;
        }
        *(_QWORD *)v47 = *((_QWORD *)v44 + 7);
        v52 = *((_QWORD *)v44 + 9);
        *(_QWORD *)(v47 + 8) = 0;
        *(_QWORD *)(v47 + 16) = v52;
        *(_QWORD *)(v47 + 24) = 1;
LABEL_60:
        v47 += 96;
      }
      v44 += 88;
      if (v44 == v45)
      {
        v46 = *((_QWORD *)&v353 + 1);
        v30 = v353;
        break;
      }
    }
  }
LABEL_138:
  v92 = self->_computedColumnWidth;
  v91 = self->_computedColumnSpacing;
  v93 = self->_computedRowSpacing;
  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v280, "controller"));
  objc_msgSend(v94, "contentsScale");
  v335 = v279;
  v336 = v30;
  v337 = v46;
  v338 = v7;
  v339 = v277;
  v340 = v9;
  v341 = v276;
  v342 = v92;
  v343 = v91;
  v346 = v93;
  v347 = v278;
  v348 = v95;
  v349 = 0;
  if (v30 < 2 || v91 == 0.0)
  {
    v344 = v92;
  }
  else
  {
    v96 = v92;
    if (v95 > 0.0)
      v96 = floor(v92 * v95) / v95;
    v344 = v96;
    v91 = ((v92 - v96) * (double)v30 + v91 * (double)(v30 - 1)) / (double)(v30 - 1);
  }
  v345 = v91;

  if (-[TUISmartGridLayoutConfiguration paginated](self->_configuration, "paginated"))
  {
    v97 = self->_computedColumns;
    v349 = v97;
    if (!v97)
      v97 = v336;
    v98 = v343;
    if (v343 == 0.0 || v97 < 2)
    {
      v344 = v342;
    }
    else
    {
      v99 = v342;
      if (v348 > 0.0)
        v99 = floor(v342 * v348) / v348;
      v344 = v99;
      v98 = ((v342 - v99) * (double)v97 + v343 * (double)(v97 - 1)) / (double)(v97 - 1);
    }
    v345 = v98;
  }
  v100 = v338;
  *(_QWORD *)&v325 = &v350;
  *((_QWORD *)&v325 + 1) = 0;
  v326 = (unint64_t)(0x2E8BA2E8BA2E8BA3 * ((v351 - v350) >> 3));
  sub_65C04((uint64_t)&v325);
  *(_QWORD *)&v323 = &v350;
  *((_QWORD *)&v323 + 1) = 0x2E8BA2E8BA2E8BA3 * ((v351 - v350) >> 3);
  v324 = *((unint64_t *)&v323 + 1);
  sub_65C04((uint64_t)&v323);
  *(_OWORD *)v327 = v325;
  *(_OWORD *)&v327[16] = v326;
  v328 = v323;
  v329 = v324;
  *(_QWORD *)&v330 = 0;
  *((double *)&v330 + 1) = v100;
  LODWORD(v331) = 0;
  v334 = 0;
  *((_QWORD *)&v332 + 1) = 0;
  v333 = 0;
  sub_5FE6C((uint64_t)v327, (uint64_t)&v335, &v350, 0);
  v102 = v101;
  v103 = v100 + v101;
  v104 = v350;
  v105 = 0;
  if (v351 != v350)
  {
    v106 = v350 + 8;
    while (*v106 == *(v106 - 1))
    {
      ++v105;
      v106 += 11;
      if ((v351 - v350) / 88 == v105)
      {
        v105 = (v351 - v350) / 88;
        break;
      }
    }
  }
  *(_QWORD *)&v311 = &v350;
  *((_QWORD *)&v311 + 1) = v105;
  v312 = 0;
  v313 = &v350;
  v315 = 0;
  v316 = 0;
  v314 = (v351 - v350) / 88;
  v317 = v100 + v101;
  v318 = 0;
  v321 = 0;
  v322 = 0;
  v320 = 0;
  v107 = 1;
  if (v351 != v350)
  {
    do
    {
      for (i = *(_QWORD *)v104; i != *((_QWORD *)v104 + 1); i += 96)
      {
        v109 = *(_QWORD *)(i + 48);
        if ((*(_QWORD *)(i + 56) - v109) >> 6 > v107)
          v107 = (*(_QWORD *)(i + 56) - v109) >> 6;
      }
      v104 += 88;
    }
    while (v104 != v351);
  }
  v110 = sub_CA954(&v311, (uint64_t)&v335, &v350, v107);
  v112 = v111;
  *(_QWORD *)&v300 = &v350;
  *((_QWORD *)&v300 + 1) = 0;
  v301 = (unint64_t)(0x2E8BA2E8BA2E8BA3 * ((v351 - v350) >> 3));
  sub_67338((uint64_t)&v300);
  *(_QWORD *)&v298 = &v350;
  *((_QWORD *)&v298 + 1) = 0x2E8BA2E8BA2E8BA3 * ((v351 - v350) >> 3);
  v299 = *((unint64_t *)&v298 + 1);
  sub_67338((uint64_t)&v298);
  v113 = v103 + v112;
  *(_OWORD *)v302 = v300;
  *(_OWORD *)&v302[16] = v301;
  v303 = v298;
  v304 = v299;
  v305 = 0;
  v306 = v113;
  v307 = 0;
  v309 = 0;
  v310 = 0;
  v308 = 0;
  sub_60890((uint64_t)v302, (uint64_t)&v335, &v350, 0);
  v115 = v114;
  v116 = v340;
  sub_90AE0(&v297);
  sub_CAFAC((id *)&v297, (uint64_t *)&v320, (uint64_t)&v350, (uint64_t)&v335, &v350, 0.0, v102);
  v117 = (NSArray *)-[NSMutableArray copy](v297, "copy");
  v118 = self->_nonScrollableAdornmentLayouts;
  self->_nonScrollableAdornmentLayouts = v117;

  if (v308)
  {
    v309 = v308;
    operator delete(v308);
  }
  if (v320)
  {
    v321 = v320;
    operator delete(v320);
  }
  if (*((_QWORD *)&v332 + 1))
  {
    v333 = *((_QWORD *)&v332 + 1);
    operator delete(*((void **)&v332 + 1));
  }
  v119 = v113 + v115 + v116;
LABEL_230:
  v174 = v353;
  v176 = self->_computedColumnWidth;
  v175 = self->_computedColumnSpacing;
  v177 = self->_computedRowSpacing;
  v178 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v280, "controller"));
  objc_msgSend(v178, "contentsScale");
  *(CGFloat *)v327 = v279;
  *(_OWORD *)&v327[8] = v174;
  *(double *)&v327[24] = v7;
  *(double *)&v328 = v277;
  *((double *)&v328 + 1) = v9;
  *(double *)&v329 = v276;
  *((double *)&v329 + 1) = v176;
  *(double *)&v330 = v175;
  *((double *)&v331 + 1) = v177;
  *(_QWORD *)&v332 = v278;
  *((double *)&v332 + 1) = v179;
  v333 = 0;
  if ((unint64_t)v174 < 2 || v175 == 0.0)
  {
    *((double *)&v330 + 1) = v176;
  }
  else
  {
    v180 = v176;
    if (v179 > 0.0)
      v180 = floor(v176 * v179) / v179;
    *((double *)&v330 + 1) = v180;
    v175 = ((v176 - v180) * (double)(unint64_t)v174 + v175 * (double)(unint64_t)(v174 - 1))
         / (double)(unint64_t)(v174 - 1);
  }
  *(double *)&v331 = v175;

  if (-[TUISmartGridLayoutConfiguration paginated](self->_configuration, "paginated"))
  {
    v181 = self->_computedColumns;
    v333 = v181;
    if (!v181)
      v181 = *(_QWORD *)&v327[8];
    v182 = *(double *)&v330;
    if (*(double *)&v330 == 0.0 || v181 < 2)
    {
      *((_QWORD *)&v330 + 1) = *((_QWORD *)&v329 + 1);
    }
    else
    {
      v183 = *((double *)&v329 + 1);
      if (*((double *)&v332 + 1) > 0.0)
        v183 = floor(*((double *)&v329 + 1) * *((double *)&v332 + 1)) / *((double *)&v332 + 1);
      *((double *)&v330 + 1) = v183;
      v182 = ((*((double *)&v329 + 1) - v183) * (double)v181 + *(double *)&v330 * (double)(v181 - 1))
           / (double)(v181 - 1);
    }
    *(double *)&v331 = v182;
  }
  v184 = (uint64_t *)v350;
  v185 = (uint64_t *)v351;
  while (v184 != v185)
  {
    v186 = *v184;
    v187 = v184[1];
    while (v186 != v187)
    {
      if (*(_QWORD *)(v186 + 16))
        v188 = *(_QWORD *)(v186 + 24) == 0;
      else
        v188 = 1;
      v189 = v188;
      sub_60DAC(v186, v189);
      v186 += 96;
    }
    v190 = v184[3];
    v191 = v184[4];
    while (v190 != v191)
    {
      if (*(_QWORD *)(v190 + 16))
        v192 = *(_QWORD *)(v190 + 24) == 0;
      else
        v192 = 1;
      v193 = v192;
      sub_5FA24(v190, v193);
      v190 += 96;
    }
    v184 += 11;
  }
  p_cellBounds = &self->_cellBounds;
  sub_5F770((uint64_t)&self->_cellBounds, (uint64_t)self->_cellBounds.__begin_, (uint64_t *)self->_cellBounds.__end_);
  v195 = v350;
  for (j = v351; v195 != j; v195 += 88)
  {
    v196 = *(_QWORD *)v195;
    v197 = *((_QWORD *)v195 + 1);
    while (v196 != v197)
    {
      if (!*(_BYTE *)(v196 + 40))
      {
        v199 = *(_QWORD *)(v196 + 48);
        v198 = *(_QWORD *)(v196 + 56);
        if (v199 == v198)
        {
          x = CGRectNull.origin.x;
          y = CGRectNull.origin.y;
          width = CGRectNull.size.width;
          height = CGRectNull.size.height;
        }
        else
        {
          x = *(double *)(v199 + 32);
          y = *(double *)(v199 + 40);
          width = *(double *)(v198 - 32) + *(double *)(v198 - 16) - x;
          height = *(double *)(v198 - 24) + *(double *)(v198 - 8) - y;
        }
        v360.origin.x = x;
        v360.origin.y = y;
        v360.size.width = width;
        v360.size.height = height;
        if (!CGRectIsNull(v360))
        {
          v204 = *(id *)(v196 + 32);
          v205 = v204;
          end = (char *)self->_cellBounds.__end_;
          value = (char *)self->_cellBounds.__end_cap_.__value_;
          if (end >= value)
          {
            begin = (char *)p_cellBounds->__begin_;
            v210 = 0xCCCCCCCCCCCCCCCDLL * ((end - (char *)p_cellBounds->__begin_) >> 3);
            v211 = v210 + 1;
            if (v210 + 1 > 0x666666666666666)
              sub_6F9C();
            v212 = 0xCCCCCCCCCCCCCCCDLL * ((value - begin) >> 3);
            if (2 * v212 > v211)
              v211 = 2 * v212;
            if (v212 >= 0x333333333333333)
              v213 = 0x666666666666666;
            else
              v213 = v211;
            *(_QWORD *)&v303 = &self->_cellBounds.__end_cap_;
            if (v213)
            {
              v214 = (char *)sub_672A4((uint64_t)&self->_cellBounds.__end_cap_, v213);
              begin = (char *)self->_cellBounds.__begin_;
              end = (char *)self->_cellBounds.__end_;
            }
            else
            {
              v214 = 0;
            }
            v215 = (double *)&v214[40 * v210];
            *(_QWORD *)v215 = v205;
            v215[1] = x;
            v215[2] = y;
            v215[3] = width;
            v215[4] = height;
            if (end == begin)
            {
              v219 = vdupq_n_s64((unint64_t)begin);
              v216 = &v214[40 * v210];
            }
            else
            {
              v216 = &v214[40 * v210];
              do
              {
                v217 = *((_QWORD *)end - 5);
                end -= 40;
                *(_QWORD *)end = 0;
                *((_QWORD *)v216 - 5) = v217;
                v216 -= 40;
                v218 = *(_OWORD *)(end + 8);
                *(_OWORD *)(v216 + 24) = *(_OWORD *)(end + 24);
                *(_OWORD *)(v216 + 8) = v218;
              }
              while (end != begin);
              v219 = *(int64x2_t *)&p_cellBounds->__begin_;
            }
            v208 = v215 + 5;
            self->_cellBounds.__begin_ = v216;
            self->_cellBounds.__end_ = v215 + 5;
            *(int64x2_t *)&v302[8] = v219;
            v220 = self->_cellBounds.__end_cap_.__value_;
            self->_cellBounds.__end_cap_.__value_ = &v214[40 * v213];
            *(_QWORD *)&v302[24] = v220;
            *(_QWORD *)v302 = v219.i64[0];
            sub_672E8((uint64_t)v302);
          }
          else
          {
            *(_QWORD *)end = v204;
            *((double *)end + 1) = x;
            *((double *)end + 2) = y;
            v208 = end + 40;
            *((double *)end + 3) = width;
            *((double *)end + 4) = height;
          }
          self->_cellBounds.__end_ = v208;
        }
      }
      v196 += 96;
    }
  }
  v221 = self->_scrollAnchors.__begin_;
  p_scrollAnchors = &self->_scrollAnchors;
  if (v221 != self->_scrollAnchors.__end_)
    self->_scrollAnchors.__end_ = v221;
  if (-[TUISmartGridLayoutConfiguration paginated](self->_configuration, "paginated"))
  {
    v223 = v333;
    if (v333)
    {
      v224 = 0;
      do
      {
        if (v224 >= (v223 + *(_QWORD *)&v327[8] - 1) / v223)
          break;
        v225 = *(double *)&v331 + *((double *)&v330 + 1);
        if (*(double *)&v331 == 0.0)
        {
          v233 = v225 * (double)v223;
          if (*((double *)&v332 + 1) > 0.0)
            v233 = floor(v233 * *((double *)&v332 + 1)) / *((double *)&v332 + 1);
          v234 = v225 * 0.0;
          if (*((double *)&v332 + 1) > 0.0)
            v234 = floor(v234 * *((double *)&v332 + 1)) / *((double *)&v332 + 1);
          v228 = v233 + v234;
          if ((_QWORD)v332 == 2)
          {
            v235 = (*(_QWORD *)&v327[8] - 1) / v223 * v223;
            v236 = (*(_QWORD *)&v327[8] - 1) % v223;
            v237 = v225 * (double)v235;
            if (*((double *)&v332 + 1) <= 0.0)
            {
              v238 = -(*(double *)&v331 - v225 * (double)(v236 + 1));
            }
            else
            {
              v237 = floor(*((double *)&v332 + 1) * v237) / *((double *)&v332 + 1);
              v238 = floor(*((double *)&v332 + 1) * -(*(double *)&v331 - v225 * (double)(v236 + 1)))
                   / *((double *)&v332 + 1);
            }
            v240 = v237 + v238;
            goto LABEL_321;
          }
        }
        else
        {
          v226 = -(*(double *)&v331 - v225 * (double)(v223 + 1));
          if (*((double *)&v332 + 1) > 0.0)
            v226 = floor(v226 * *((double *)&v332 + 1)) / *((double *)&v332 + 1);
          v227 = v225 - *(double *)&v331;
          if (*((double *)&v332 + 1) > 0.0)
            v227 = floor(v227 * *((double *)&v332 + 1)) / *((double *)&v332 + 1);
          v228 = v226 - *((double *)&v330 + 1) + v227 - *((double *)&v330 + 1);
          if ((_QWORD)v332 == 2)
          {
            v229 = (*(_QWORD *)&v327[8] - 1) / v223 * v223;
            v230 = (*(_QWORD *)&v327[8] - 1) % v223;
            v231 = v225 * (double)(v229 + 1) - *(double *)&v331;
            if (*((double *)&v332 + 1) <= 0.0)
            {
              v232 = *(double *)&v331 * -2.0 + v225 * (double)(v230 + 2);
            }
            else
            {
              v231 = floor(*((double *)&v332 + 1) * v231) / *((double *)&v332 + 1);
              v232 = floor(*((double *)&v332 + 1) * (*(double *)&v331 * -2.0 + v225 * (double)(v230 + 2)))
                   / *((double *)&v332 + 1);
            }
            v240 = v231 - *((double *)&v330 + 1) + v232 - *((double *)&v330 + 1);
LABEL_321:
            v239 = v240 - (double)v224 * v228;
            goto LABEL_322;
          }
        }
        v239 = v228 * (double)v224;
LABEL_322:
        v242 = self->_scrollAnchors.__end_;
        v241 = self->_scrollAnchors.__end_cap_.__value_;
        if (v242 >= v241)
        {
          v244 = p_scrollAnchors->__begin_;
          v245 = v242 - p_scrollAnchors->__begin_;
          v246 = v245 + 1;
          if ((unint64_t)(v245 + 1) >> 61)
            sub_6F9C();
          v247 = (char *)v241 - (char *)v244;
          if (v247 >> 2 > v246)
            v246 = v247 >> 2;
          if ((unint64_t)v247 >= 0x7FFFFFFFFFFFFFF8)
            v248 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v248 = v246;
          if (v248)
          {
            v249 = (char *)sub_39CC4((uint64_t)&self->_scrollAnchors.__end_cap_, v248);
            v244 = self->_scrollAnchors.__begin_;
            v242 = self->_scrollAnchors.__end_;
          }
          else
          {
            v249 = 0;
          }
          v250 = (double *)&v249[8 * v245];
          *v250 = v239;
          v243 = v250 + 1;
          while (v242 != v244)
          {
            v251 = *((_QWORD *)v242-- - 1);
            *((_QWORD *)v250-- - 1) = v251;
          }
          self->_scrollAnchors.__begin_ = v250;
          self->_scrollAnchors.__end_ = v243;
          self->_scrollAnchors.__end_cap_.__value_ = (double *)&v249[8 * v248];
          if (v244)
            operator delete(v244);
        }
        else
        {
          *v242 = v239;
          v243 = v242 + 1;
        }
        self->_scrollAnchors.__end_ = v243;
        ++v224;
        v223 = v333;
      }
      while (v333);
    }
  }
  else
  {
    v252 = (unint64_t **)v350;
    v253 = v351;
    if (v350 != v351)
    {
      if (v278 == (_BYTE *)&dword_0 + 2)
        v254 = v276;
      else
        v254 = -v277;
      do
      {
        v255 = *v252;
        v256 = v252[1];
        while (v255 != v256)
        {
          v257 = v255[2];
          if (v257)
            v258 = v255[3] == 0;
          else
            v258 = 1;
          if (!v258)
          {
            sub_66124((uint64_t)v327, *v255, v257, 0);
            v260 = v254 + v259;
            v262 = self->_scrollAnchors.__end_;
            v261 = self->_scrollAnchors.__end_cap_.__value_;
            if (v262 >= v261)
            {
              v264 = p_scrollAnchors->__begin_;
              v265 = v262 - p_scrollAnchors->__begin_;
              v266 = v265 + 1;
              if ((unint64_t)(v265 + 1) >> 61)
                sub_6F9C();
              v267 = (char *)v261 - (char *)v264;
              if (v267 >> 2 > v266)
                v266 = v267 >> 2;
              if ((unint64_t)v267 >= 0x7FFFFFFFFFFFFFF8)
                v268 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v268 = v266;
              if (v268)
              {
                v269 = (char *)sub_39CC4((uint64_t)&self->_scrollAnchors.__end_cap_, v268);
                v264 = self->_scrollAnchors.__begin_;
                v262 = self->_scrollAnchors.__end_;
              }
              else
              {
                v269 = 0;
              }
              v270 = (double *)&v269[8 * v265];
              *v270 = v260;
              v263 = v270 + 1;
              while (v262 != v264)
              {
                v271 = *((_QWORD *)v262-- - 1);
                *((_QWORD *)v270-- - 1) = v271;
              }
              self->_scrollAnchors.__begin_ = v270;
              self->_scrollAnchors.__end_ = v263;
              self->_scrollAnchors.__end_cap_.__value_ = (double *)&v269[8 * v268];
              if (v264)
                operator delete(v264);
            }
            else
            {
              *v262 = v260;
              v263 = v262 + 1;
            }
            self->_scrollAnchors.__end_ = v263;
          }
          v255 += 12;
        }
        v252 += 11;
      }
      while (v252 != (unint64_t **)v253);
    }
  }
  v272 = v331;
  *(_OWORD *)&self->_columnSystem._specifiedColumnSpacing = v330;
  *(_OWORD *)&self->_columnSystem._computedColumnSpacing = v272;
  *(_OWORD *)&self->_columnSystem._layoutDirection = v332;
  v273 = *(_OWORD *)&v327[16];
  *(_OWORD *)&self->_columnSystem._containerWidth = *(_OWORD *)v327;
  *(_OWORD *)&self->_columnSystem._rows = v273;
  v274 = v329;
  *(_OWORD *)&self->_columnSystem._insets.left = v328;
  self->_columnSystem._columnsPerPage = v333;
  *(_OWORD *)&self->_columnSystem._insets.right = v274;
  self->_contentLayoutSize.width = v110;
  self->_contentLayoutSize.height = v119;
  self->_layoutSize.width = v279;
  self->_layoutSize.height = v119;
  if (v358)
  {
    v359 = v358;
    operator delete(v358);
  }
  if (v356)
  {
    v357 = v356;
    operator delete(v356);
  }
  if (v354)
  {
    v355 = v354;
    operator delete(v354);
  }
  *(_QWORD *)v327 = v352;
  sub_6192C((void ***)v327);
  *(_QWORD *)v327 = &v350;
  sub_61B28((void ***)v327);

}

- (double)widthForColumnSpan:(unint64_t)a3
{
  if (a3)
    return -(self->_computedColumnSpacing - (self->_computedColumnWidth + self->_computedColumnSpacing) * (double)a3);
  else
    return 0.0;
}

- (void)appendAnchorsToSet:(id)a3 forLayout:(id)a4 inRoot:(id)a5
{
  id v8;
  id v9;
  id v10;
  double height;
  double *end;
  double *begin;
  double v14;
  __int128 v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "axis") == (char *)&dword_0 + 1)
  {
    height = self->_contentLayoutSize.height;
    v15 = 0u;
    if (v9)
      objc_msgSend(v9, "computedTransformInAncestorLayout:", v10);
    begin = self->_scrollAnchors.__begin_;
    end = self->_scrollAnchors.__end_;
    if (begin != end)
    {
      v14 = height * 0.5;
      do
        objc_msgSend(v8, "appendScrollAnchor:", v14 * 0.0 + *(double *)&v15 * *begin++ + 0.0, v15);
      while (begin != end);
    }
  }

}

- (void)appendAdornmentRenderModelsCompatibleWithKind:(unint64_t)a3 transform:(CGAffineTransform *)a4 context:(id)a5 box:(id)a6 toModels:(id)a7
{
  id v12;
  id v13;
  id v14;
  __int128 v15;
  double width;
  double height;
  void *v18;
  __int128 v19;
  void *v20;
  _OWORD v21[3];
  _OWORD v22[3];

  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = *(_OWORD *)&a4->c;
  v22[0] = *(_OWORD *)&a4->a;
  v22[1] = v15;
  v22[2] = *(_OWORD *)&a4->tx;
  sub_611B0((uint64_t)&self->_cellDividers, a3, (double *)v22, v12, v14);
  if (a3 >= 4 && objc_msgSend(v12, "debugVisualLayout"))
  {
    width = self->_contentLayoutSize.width;
    height = self->_contentLayoutSize.height;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
    v19 = *(_OWORD *)&a4->c;
    v21[0] = *(_OWORD *)&a4->a;
    v21[1] = v19;
    v21[2] = *(_OWORD *)&a4->tx;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[TUISmartGridDebugRenderModel renderModelWithSize:columnSystem:identifier:transform:](TUISmartGridDebugRenderModel, "renderModelWithSize:columnSystem:identifier:transform:", &self->_columnSystem, v18, v21, width, height));

    objc_msgSend(v14, "addObject:", v20);
  }

}

- (void)appendNonScrollableAdornmentRenderModelsCompatibleWithKind:(unint64_t)a3 transform:(CGAffineTransform *)a4 context:(id)a5 box:(id)a6 toModels:(id)a7
{
  id v11;
  id v12;
  double width;
  double height;
  NSArray *v15;
  id v16;
  uint64_t v17;
  double v18;
  double v19;
  void *i;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  __int128 v28;
  CGAffineTransform v29;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  v11 = a5;
  v12 = a7;
  width = self->_layoutSize.width;
  height = self->_layoutSize.height;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v15 = self->_nonScrollableAdornmentLayouts;
  v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v34;
    v18 = -width;
    v19 = -height;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v17)
          objc_enumerationMutation(v15);
        v21 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v21, "computedOrigin");
        v23 = v22;
        v25 = v24;
        objc_msgSend(v21, "computedTransformedSize");
        memset(&v32, 0, sizeof(v32));
        CGAffineTransformMakeTranslation(&t1, v23 + v26 * 0.5 + v18 * 0.5, v25 + v27 * 0.5 + v19 * 0.5);
        v28 = *(_OWORD *)&a4->c;
        *(_OWORD *)&t2.a = *(_OWORD *)&a4->a;
        *(_OWORD *)&t2.c = v28;
        *(_OWORD *)&t2.tx = *(_OWORD *)&a4->tx;
        CGAffineTransformConcat(&v32, &t1, &t2);
        v29 = v32;
        objc_msgSend(v21, "appendRenderModelIgnoreHiddenCompatibleWithKind:context:transform:toModels:", a3, v11, &v29, v12);
      }
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v16);
  }

}

- (void)appendHoverRegions:(id)a3 transform:(CGAffineTransform *)a4
{
  id v6;
  id *begin;
  id *i;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  __int128 v15;
  id v16;
  id v17;
  id v18;
  double x;
  double y;
  double width;
  double height;
  TUIHoverIdentifier *v23;
  void *v24;
  TUIHoverIdentifier *v25;
  TUIHoverRegion *v26;
  CGAffineTransform v27;
  CGRect v28;

  v6 = a3;
  begin = (id *)self->_cellBounds.__begin_;
  for (i = (id *)self->_cellBounds.__end_; begin != i; begin += 5)
  {
    v9 = *begin;
    v10 = begin[1];
    v11 = begin[2];
    v12 = begin[3];
    v13 = begin[4];
    v14 = v9;
    v15 = *(_OWORD *)&a4->c;
    *(_OWORD *)&v27.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&v27.c = v15;
    *(_OWORD *)&v27.tx = *(_OWORD *)&a4->tx;
    v16 = v10;
    *(_QWORD *)&v15 = v11;
    v17 = v12;
    v18 = v13;
    v28 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v15 - 8), &v27);
    x = v28.origin.x;
    y = v28.origin.y;
    width = v28.size.width;
    height = v28.size.height;
    v23 = [TUIHoverIdentifier alloc];
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
    v25 = -[TUIHoverIdentifier initWithName:identifier:](v23, "initWithName:identifier:", CFSTR("cell"), v24);

    v26 = -[TUIHoverRegion initWithBounds:]([TUIHoverRegion alloc], "initWithBounds:", x, y, width, height);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v26, v25);

  }
}

- (TUISmartGridContentBox)content
{
  return self->_content;
}

- (TUISmartGridLayoutConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (unint64_t)computedColumns
{
  return self->_computedColumns;
}

- (double)computedColumnWidth
{
  return self->_computedColumnWidth;
}

- (double)computedColumnSpacing
{
  return self->_computedColumnSpacing;
}

- (CGSize)layoutSize
{
  double width;
  double height;
  CGSize result;

  width = self->_layoutSize.width;
  height = self->_layoutSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)contentLayoutSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentLayoutSize.width;
  height = self->_contentLayoutSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  double *begin;
  void **p_begin;

  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_nonScrollableAdornmentLayouts, 0);
  p_begin = &self->_cellDividers._positions.__begin_;
  sub_618C0(&p_begin);

  p_begin = &self->_cellBounds.__begin_;
  sub_679FC(&p_begin);
  begin = self->_scrollAnchors.__begin_;
  if (begin)
  {
    self->_scrollAnchors.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  __int128 v2;

  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *(CGSize *)((char *)self + 56) = CGSizeZero;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *((_QWORD *)self + 15) = 0;
  v2 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
  *((_OWORD *)self + 8) = *(_OWORD *)&UIEdgeInsetsZero.top;
  *((_OWORD *)self + 9) = v2;
  *((_QWORD *)self + 27) = 0;
  *((_QWORD *)self + 20) = 0;
  *((_QWORD *)self + 21) = 0;
  *((_QWORD *)self + 24) = 0;
  *((_QWORD *)self + 25) = 0;
  return self;
}

@end
