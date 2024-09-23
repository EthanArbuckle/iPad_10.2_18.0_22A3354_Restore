@implementation PXMonthsLayoutGenerator

- (void)updateContentSize:(CGSize *)a3 itemRects:(CGRect *)a4 itemKinds:(int64_t *)a5 zPositions:(float *)a6
{
  uint64_t v10;
  void *v11;
  uint64_t v12;
  double v13;
  void *v14;
  uint64_t v15;
  _BOOL4 v17;
  void *v18;
  double v19;
  double v20;
  double v21;
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
  double v32;
  double v33;
  id v34;
  uint64_t i;
  void *v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;
  _BOOL4 v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  uint64_t v59;
  CGSize *v60;
  double v61;
  CGFloat v62;
  uint64_t *v63;
  uint64_t v64;
  CGRect *v65;
  double v66;
  double v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void (**v73)(_QWORD, _QWORD, double, double, double, double);
  double v74;
  void (*v75)(void *, uint64_t, double, double, double, double);
  void (*v76)(void *, uint64_t, double, double, double, double);
  void (*v77)(void *, uint64_t, double, double, double, double);
  void (*v78)(void *, uint64_t, double, double, double, double);
  double v79;
  void (*v80)(void *, uint64_t, double, double, double, double);
  void (*v81)(void *, uint64_t, double, double, double, double);
  double v82;
  double v83;
  double v84;
  _QWORD *v85;
  uint64_t j;
  CGRect *v87;
  double v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v92;
  CGRect *v93;
  double y;
  double height;
  CGFloat x;
  double width;
  double v98;
  int v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  _BOOL4 v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  uint64_t v146;
  void (**v147)(void);
  double v148;
  double v149;
  int v150;
  id v151;
  double v152;
  double v153;
  char v154;
  void (**v157)(_QWORD, _QWORD);
  PXMonthsLayoutGenerator *v158;
  int v159;
  _BOOL4 v160;
  double v161;
  void *v162;
  _QWORD v163[5];
  void (**v164)(_QWORD, _QWORD);
  uint64_t *v165;
  _QWORD *v166;
  uint64_t *v167;
  uint64_t *v168;
  uint64_t *v169;
  double v170;
  double v171;
  uint64_t v172;
  SEL v173;
  CGRect *v174;
  int64_t *v175;
  float *v176;
  char v177;
  uint64_t v178;
  double *v179;
  uint64_t v180;
  double v181;
  _QWORD v182[4];
  uint64_t v183;
  uint64_t *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t *v192;
  uint64_t v193;
  uint64_t v194;
  _QWORD aBlock[10];
  CGRect v196;
  CGRect v197;
  CGRect v198;

  v10 = -[PXMonthsLayoutGenerator itemCount](self, "itemCount");
  -[PXMonthsLayoutGenerator itemLayoutInfoBlock](self, "itemLayoutInfoBlock");
  v157 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v158 = self;
  -[PXMonthsLayoutGenerator metrics](self, "metrics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "layoutStyle");
  objc_msgSend(v11, "referenceSize");
  v144 = v13;
  +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v159 = objc_msgSend(v14, "allowsModularLayoutForZoomLevel:sizeClass:orientation:layoutStyle:", 2, objc_msgSend(v11, "sizeClass"), objc_msgSend(v11, "orientation"), objc_msgSend(v11, "layoutStyle"));

  v15 = objc_msgSend(v11, "orientation");
  v162 = v11;
  v146 = v15;
  v17 = objc_msgSend(v11, "sizeClass") == 1 && v15 == 2;
  v160 = v17;
  if (v12 == 1)
  {
    +[PXLemonadeSettings sharedInstance](PXLemonadeSettings, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v154 = objc_msgSend(v18, "enableMonthHeroPromotion");

    v19 = 1.5;
  }
  else
  {
    v19 = 1.0;
    v154 = 1;
  }
  objc_msgSend(v11, "padding");
  v21 = v20;
  v23 = v22;
  v142 = v24;
  v26 = v25;
  objc_msgSend(v11, "chapterHeaderPadding");
  v28 = v27;
  v30 = v29;
  v148 = v31;
  v161 = v32;
  objc_msgSend(v11, "interitemSpacing");
  v149 = v33;
  v34 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  if (v10 >= 1)
  {
    for (i = 0; i != v10; ++i)
    {
      v157[2](v157, i);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "weight");
      v38 = v37;

      if (v38 == -1.0)
        objc_msgSend(v34, "addIndex:", i);
    }
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__PXMonthsLayoutGenerator_updateContentSize_itemRects_itemKinds_zPositions___block_invoke;
  aBlock[3] = &unk_1E5125D58;
  aBlock[4] = v158;
  aBlock[5] = v10;
  aBlock[6] = a2;
  aBlock[7] = a4;
  aBlock[8] = a5;
  v147 = (void (**)(void))_Block_copy(aBlock);
  v39 = v144 - (v23 + v26);
  v191 = 0;
  v192 = &v191;
  v193 = 0x2020000000;
  v194 = 0;
  if (v10 <= 0)
  {
    v60 = a3;
  }
  else
  {
    v40 = 0;
    v150 = 0;
    v41 = v146 == 2;
    if (v146 == 2)
      v42 = 1.33333333;
    else
      v42 = 1.0;
    v43 = v149;
    v44 = (v39 + v149 * -2.0) / 3.0;
    v124 = v44 / v42;
    v45 = v149 + v44 / v42 * 2.0;
    v117 = v149 + v44 / v42;
    v118 = v42 * v45;
    v119 = v45;
    v138 = v149 + v45;
    v141 = v149 + v44;
    v129 = v141 + v141;
    v106 = v149 + v42 * v45;
    v46 = (v39 - v149) * 0.5;
    v130 = v46 / 1.77777778;
    v107 = v39 / 1.77777778 + v149 * 2.0 + v46 / 1.77777778;
    v47 = (v39 + v149 * -3.0) * 0.25;
    v48 = v149 + v47 * 2.0;
    v103 = v47 + v48 + v149 * 2.0;
    if (v146 == 2)
      v49 = 1.77777778;
    else
      v49 = v19;
    v50 = 1.5;
    if (v12 != 1)
      v50 = 1.33333333;
    v51 = v39 / v50;
    v52 = (v39 + v149 * -3.66666667) / 3.25;
    v112 = v149 + v149 + v52 / 1.77777778 * 3.0;
    if (v12 == 1)
      v41 = 1;
    v136 = v41;
    v132 = v46 / 1.33333333;
    v53 = (v39 - (v42 + 1.0) * v149) / ((v42 + v42) / v42 + 1.0);
    v54 = v53 / v42;
    v116 = v149 + v53 / v42 * 2.0;
    v55 = v42 * v116;
    v100 = v39 / v19;
    v56 = v30 + v161;
    v57 = v23 + v30;
    v58 = (v39 + v149 * -2.0) / 3.0;
    v152 = v39 - v56;
    v153 = v57;
    v59 = 0x7FFFFFFFFFFFFFFFLL;
    v135 = v39 / v49;
    v127 = v149 + v39 / 1.77777778;
    v128 = v39 / 1.77777778;
    v143 = (v39 - v149) * 0.5;
    v126 = v149 + v149 + v44 * 2.0;
    v122 = v51;
    v123 = (v39 + v149 * -3.0) * 0.25;
    v137 = v149 + v47;
    v110 = v149 + v47 * 2.0;
    v111 = v112 * 1.33333333;
    v105 = v149 + v48;
    v139 = v149 + v51;
    v140 = v149 + v46;
    v120 = v52 / 1.77777778;
    v121 = (v39 + v149 * -3.66666667) / 3.25;
    v114 = v149 + v52 / 1.77777778;
    v115 = v55;
    v108 = v149 + v44 * 2.0;
    v109 = v114 + v114;
    v125 = v149 + v112 * 1.33333333;
    v131 = v149 + v39 / 1.33333333;
    v133 = v54;
    v134 = v53;
    v113 = v149 + v54;
    v101 = v149 + v52;
    v102 = v149 + v53;
    v104 = v149 + v55;
    v60 = a3;
    v145 = v28;
    v151 = v34;
    do
    {
      if (objc_msgSend(v34, "containsIndex:", v40))
      {
        objc_msgSend(v162, "chapterHeaderHeight");
        v62 = v61;
        v63 = v192;
        v64 = v192[3];
        v65 = &a4[v64];
        v67 = v152;
        v66 = v153;
        v65->origin.x = v153;
        v65->origin.y = v21;
        v65->size.width = v152;
        v65->size.height = v62;
        a5[v64] = 0;
        v59 = v63[3];
        a6[v59] = 0.0;
        if (v160)
        {
          v68 = v59;
        }
        else
        {
          v74 = v21;
          v21 = v148 + CGRectGetMaxY(*(CGRect *)&v66);
          v63 = v192;
          v68 = v192[3];
        }
        v40 = v68 + 1;
        v63[3] = v68 + 1;
      }
      else
      {
        v69 = v192[3];
        v70 = objc_msgSend(v34, "indexGreaterThanIndex:", v69);
        if (v70 == 0x7FFFFFFFFFFFFFFFLL)
          v71 = v10;
        else
          v71 = v70;
        v187 = 0;
        v188 = &v187;
        v189 = 0x2020000000;
        v190 = 0x7FFFFFFFFFFFFFFFLL;
        v183 = 0;
        v184 = &v183;
        v185 = 0x2020000000;
        v186 = 0x7FFFFFFFFFFFFFFFLL;
        v182[0] = 0;
        v182[1] = v182;
        v182[2] = 0x2020000000;
        v182[3] = 0;
        v178 = 0;
        v179 = (double *)&v178;
        v180 = 0x2020000000;
        v181 = v21;
        v163[0] = MEMORY[0x1E0C809B0];
        v163[1] = 3221225472;
        v163[2] = __76__PXMonthsLayoutGenerator_updateContentSize_itemRects_itemKinds_zPositions___block_invoke_2;
        v163[3] = &unk_1E5125D80;
        v170 = v23;
        v171 = v21;
        v172 = v10;
        v173 = a2;
        v165 = &v191;
        v163[4] = v158;
        v174 = a4;
        v175 = a5;
        v176 = a6;
        v177 = v154;
        v164 = v157;
        v166 = v182;
        v167 = &v183;
        v168 = &v187;
        v169 = &v178;
        v72 = _Block_copy(v163);
        v73 = (void (**)(_QWORD, _QWORD, double, double, double, double))v72;
        if ((v159 & 1) != 0)
        {
          switch(v71 + ~v69)
          {
            case 0:
              (*((void (**)(void *, uint64_t, double, double, double, double))v72 + 2))(v72, 1, 0.0, 0.0, v39, v135);
              goto LABEL_60;
            case 1:
              v75 = (void (*)(void *, uint64_t, double, double, double, double))*((_QWORD *)v72 + 2);
              if (v146 == 2)
              {
                v75(v72, 1, 0.0, 0.0, v143, v143);
                v73[2](v73, 1, v140, 0.0, v143, v143);
                goto LABEL_60;
              }
              if (v12 == 1)
              {
                v75(v72, 1, 0.0, 0.0, v143, v100);
                v73[2](v73, 1, v140, 0.0, v143, v100);
                goto LABEL_60;
              }
              v75(v72, 1, 0.0, 0.0, v39, v128);
              v73[2](v73, 1, 0.0, v127, v39, v128);
              break;
            case 2:
              if (!v136)
              {
                (*((void (**)(void *, uint64_t, double, double, double, double))v72 + 2))(v72, 2, 0.0, 0.0, v39, v39 / 1.33333333);
                v73[2](v73, 0, 0.0, v131, v143, v132);
                v73[2](v73, 0, v140, v131, v143, v132);
                break;
              }
              v76 = (void (*)(void *, uint64_t, double, double, double, double))*((_QWORD *)v72 + 2);
              if (v150)
              {
                v76(v72, 0, 0.0, 0.0, v134, v133);
                v73[2](v73, 0, 0.0, v113, v134, v133);
                v73[2](v73, 2, v102, 0.0, v115, v116);
                goto LABEL_60;
              }
              v76(v72, 2, 0.0, 0.0, v115, v116);
              v73[2](v73, 0, v104, 0.0, v134, v133);
              v73[2](v73, 0, v104, v113, v134, v133);
              goto LABEL_68;
            case 3:
              if (v146 != 2)
              {
                (*((void (**)(void *, uint64_t, double, double, double, double))v72 + 2))(v72, 2, 0.0, 0.0, v39, v122);
                v73[2](v73, 0, 0.0, v139, v58, v58);
                v73[2](v73, 0, v141, v139, v58, v58);
                v73[2](v73, 0, v129, v139, v58, v58);
                break;
              }
              v77 = (void (*)(void *, uint64_t, double, double, double, double))*((_QWORD *)v72 + 2);
              if (v150)
              {
                v77(v72, 0, 0.0, 0.0, v121, v120);
                v73[2](v73, 0, 0.0, v114, v121, v120);
                v73[2](v73, 0, 0.0, v109, v121, v120);
                v73[2](v73, 2, v101, 0.0, v111, v112);
                goto LABEL_60;
              }
              v77(v72, 2, 0.0, 0.0, v111, v112);
              v73[2](v73, 0, v125, 0.0, v121, v120);
              v73[2](v73, 0, v125, v114, v121, v120);
              v73[2](v73, 0, v125, v109, v121, v120);
              goto LABEL_68;
            case 4:
              if (v146 == 2)
              {
                v78 = (void (*)(void *, uint64_t, double, double, double, double))*((_QWORD *)v72 + 2);
                if (v150)
                {
                  v79 = (v39 + v149 * -3.0) * 0.25;
                  v78(v72, 0, 0.0, 0.0, v123, v123);
                  v73[2](v73, 0, 0.0, v137, v79, v79);
                  v73[2](v73, 0, v137, 0.0, v79, v79);
                  v73[2](v73, 0, v137, v137, v79, v79);
                  v73[2](v73, 2, v137 + v137, 0.0, v110, v110);
                  goto LABEL_60;
                }
                v78(v72, 2, 0.0, 0.0, v110, v110);
                v82 = (v39 + v149 * -3.0) * 0.25;
                v73[2](v73, 0, v105, 0.0, v123, v123);
                v73[2](v73, 0, v105, v137, v82, v82);
                v73[2](v73, 0, v103, 0.0, v82, v82);
                v73[2](v73, 0, v103, v137, v82, v82);
              }
              else
              {
                if (v12 != 1)
                {
                  (*((void (**)(void *, uint64_t, double, double, double, double))v72 + 2))(v72, 2, 0.0, 0.0, v39, v128);
                  v73[2](v73, 0, 0.0, v127, v143, v130);
                  v73[2](v73, 0, v140, v127, v143, v130);
                  v73[2](v73, 0, 0.0, v107, v143, v130);
                  v73[2](v73, 0, v140, v107, v143, v130);
                  break;
                }
                v81 = (void (*)(void *, uint64_t, double, double, double, double))*((_QWORD *)v72 + 2);
                if (v150)
                {
                  v81(v72, 0, 0.0, 0.0, v58, v58);
                  v73[2](v73, 0, 0.0, v141, v58, v58);
                  v73[2](v73, 2, v141, 0.0, v108, v108);
                  v73[2](v73, 0, 0.0, v126, v58, v58);
                  v73[2](v73, 0, v141, v126, v108, v58);
                  goto LABEL_60;
                }
                v81(v72, 2, 0.0, 0.0, v108, v108);
                v73[2](v73, 0, v126, 0.0, v58, v58);
                v73[2](v73, 0, v126, v141, v58, v58);
                v73[2](v73, 0, 0.0, v126, v108, v58);
                v73[2](v73, 0, v126, v126, v58, v58);
              }
              goto LABEL_68;
            case 5:
              if (v12 != 1)
                break;
              v80 = (void (*)(void *, uint64_t, double, double, double, double))*((_QWORD *)v72 + 2);
              if (v150)
              {
                v80(v72, 0, 0.0, 0.0, v58, v124);
                v73[2](v73, 0, 0.0, v117, v58, v124);
                v73[2](v73, 2, v141, 0.0, v118, v119);
                v73[2](v73, 0, 0.0, v138, v58, v124);
                v73[2](v73, 0, v141, v138, v58, v124);
                v73[2](v73, 0, v129, v138, v58, v124);
LABEL_60:
                v150 = 0;
              }
              else
              {
                v80(v72, 2, 0.0, 0.0, v118, v119);
                v73[2](v73, 0, v106, 0.0, v58, v124);
                v73[2](v73, 0, v106, v117, v58, v124);
                v73[2](v73, 0, 0.0, v138, v58, v124);
                v73[2](v73, 0, v141, v138, v58, v124);
                v73[2](v73, 0, v129, v138, v58, v124);
LABEL_68:
                v150 = 2;
              }
              break;
            default:
              break;
          }
        }
        if (v192[3] == v69)
        {
          objc_msgSend(v162, "defaultSectionAspectRatio");
          v84 = v39 / v83;
          v85 = v192 + 3;
          for (j = v192[3]; j < v71; v192[3] = j)
          {
            v87 = &a4[j];
            v87->origin.x = v23;
            v87->origin.y = v21;
            v87->size.width = v39;
            v87->size.height = v84;
            a5[j] = 0;
            a6[*v85] = 0.0;
            v196.origin.x = v23;
            v196.origin.y = v21;
            v196.size.width = v39;
            v196.size.height = v84;
            v21 = v43 + CGRectGetMaxY(v196);
            v85 = v192 + 3;
            j = v192[3] + 1;
          }
          v197.origin.x = v23;
          v197.origin.y = v21;
          v197.size.width = v39;
          v197.size.height = v84;
          v150 = 0;
          v88 = CGRectGetMinY(v197) - v43;
          v179[3] = v88;
        }
        else
        {
          v88 = v179[3];
        }
        if (v188[3] != 0x7FFFFFFFFFFFFFFFLL && v184[3] != 0x7FFFFFFFFFFFFFFFLL)
          v147[2]();
        if (objc_msgSend(v162, "displaceTopLeadingCardTitle"))
        {
          v89 = v188[3];
          if (v89 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v90 = v184[3];
            if (v90 != 0x7FFFFFFFFFFFFFFFLL && v90 != v89)
            {
              if (v69 == v90)
                v92 = v69 + 1;
              else
                v92 = v69;
              if (v69 == v89)
                v69 = v184[3];
              else
                v69 = v92;
            }
          }
          a5[v69] |= 8uLL;
        }
        v34 = v151;
        if (v59 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v93 = &a4[v59];
          y = v93->origin.y;
          if (v160)
          {
            height = v179[3] - y;
            a5[v59] = 2;
            x = 0.0;
            width = v23;
          }
          else
          {
            x = v93->origin.x;
            width = v93->size.width;
            height = v93->size.height;
            if (!v159 || objc_msgSend(v162, "displaceTopLeadingCardTitle"))
            {
              v98 = v179[3];
              v99 = objc_msgSend(v162, "displaceTopLeadingCardTitle");
              if (height < v98 - y)
                height = v98 - y;
              if (v99)
                y = y + 30.0;
            }
            v28 = v145;
          }
          v93->origin.x = x;
          v93->origin.y = y;
          v93->size.width = width;
          v93->size.height = height;
          v43 = v149;
          v58 = (v39 + v149 * -2.0) / 3.0;
        }
        v21 = v28 + v88;

        _Block_object_dispose(&v178, 8);
        _Block_object_dispose(v182, 8);
        _Block_object_dispose(&v183, 8);
        _Block_object_dispose(&v187, 8);
        v40 = v192[3];
        v59 = 0x7FFFFFFFFFFFFFFFLL;
        v60 = a3;
      }
    }
    while (v40 < v10);
  }
  v198.size.height = *(CGFloat *)(MEMORY[0x1E0C9D648] + 24);
  v60->width = v144;
  v198.origin.x = v23;
  v198.origin.y = v21;
  v198.size.width = v39;
  v60->height = v142 + CGRectGetMinY(v198) - v28;
  v158->_presentedSingleColumn = v159 ^ 1;
  _Block_object_dispose(&v191, 8);

}

- (BOOL)presentedSingleColumn
{
  return self->_presentedSingleColumn;
}

__n128 __76__PXMonthsLayoutGenerator_updateContentSize_itemRects_itemKinds_zPositions___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  __n128 *v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  __int128 v10;
  uint64_t v11;
  _OWORD *v12;
  __int128 v13;
  __n128 *v14;
  __n128 result;
  void *v16;
  void *v17;
  __n128 v18;
  __n128 v19;

  v3 = a3;
  if (a2 < 0 || a1[5] <= a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("PXMonthsLayoutGenerator.m"), 124, CFSTR("fromIndex %li out of bounds 0..%li"), a2, a1[5]);

    if ((v3 & 0x8000000000000000) == 0)
    {
LABEL_4:
      if (a1[5] > v3)
        goto LABEL_5;
    }
  }
  else if ((a3 & 0x8000000000000000) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("PXMonthsLayoutGenerator.m"), 125, CFSTR("toIndex %li out of bounds 0..%li"), v3, a1[5]);

LABEL_5:
  v6 = (__n128 *)(a1[7] + 32 * v3);
  v18 = *v6;
  v19 = v6[1];
  v7 = *(_QWORD *)(a1[8] + 8 * v3);
  if (v3 >= a2)
  {
    if (v3 > a2)
    {
      v11 = 32 * v3;
      do
      {
        v12 = (_OWORD *)(a1[7] + v11);
        v13 = *(v12 - 1);
        *v12 = *(v12 - 2);
        v12[1] = v13;
        *(_QWORD *)(a1[8] + 8 * v3) = *(_QWORD *)(a1[8] + 8 * v3 - 8);
        v11 -= 32;
        --v3;
      }
      while (v3 > a2);
    }
  }
  else
  {
    v8 = 32 * v3;
    do
    {
      v9 = (_OWORD *)(a1[7] + v8);
      v10 = v9[3];
      *v9 = v9[2];
      v9[1] = v10;
      *(_QWORD *)(a1[8] + 8 * v3) = *(_QWORD *)(a1[8] + 8 * v3 + 8);
      v8 += 32;
      ++v3;
    }
    while (a2 != v3);
  }
  v14 = (__n128 *)(a1[7] + 32 * a2);
  result = v18;
  *v14 = v18;
  v14[1] = v19;
  *(_QWORD *)(a1[8] + 8 * a2) = v7;
  return result;
}

void __76__PXMonthsLayoutGenerator_updateContentSize_itemRects_itemKinds_zPositions___block_invoke_2(uint64_t a1, uint64_t a2, double a3, double a4, CGFloat a5, CGFloat a6)
{
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  double *v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double MaxY;
  void *v21;
  CGRect v22;

  v10 = *(double *)(a1 + 88) + a3;
  v11 = *(double *)(a1 + 96) + a4;
  v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v12 < 0 || v12 >= *(_QWORD *)(a1 + 104))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 32), CFSTR("PXMonthsLayoutGenerator.m"), 183, CFSTR("index %li out of bounds 0..%li"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), *(_QWORD *)(a1 + 104));

    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }
  v13 = *(_QWORD *)(a1 + 128);
  v14 = (double *)(*(_QWORD *)(a1 + 120) + 32 * v12);
  *v14 = v10;
  v14[1] = v11;
  v14[2] = a5;
  v14[3] = a6;
  v15 = 4 * (a2 == 2);
  if (!a2)
    v15 = 1;
  *(_QWORD *)(v13 + 8 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)) = v15;
  *(_DWORD *)(*(_QWORD *)(a1 + 136) + 4 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)) = 0;
  if (*(_BYTE *)(a1 + 144))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "weight");
    v18 = v17;

    if (v18 > *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                              + 24);
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v18;
    }
  }
  if (a2 == 2)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
  v19 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
  v22.origin.x = v10;
  v22.origin.y = v11;
  v22.size.width = a5;
  v22.size.height = a6;
  MaxY = CGRectGetMaxY(v22);
  if (v19 >= MaxY)
    MaxY = v19;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = MaxY;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
}

@end
