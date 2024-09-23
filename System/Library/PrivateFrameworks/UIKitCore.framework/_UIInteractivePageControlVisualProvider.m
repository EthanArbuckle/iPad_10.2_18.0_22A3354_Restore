@implementation _UIInteractivePageControlVisualProvider

- (void)layoutSubviews
{
  unint64_t v3;
  int64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  unint64_t v23;
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
  double v34;
  void *v35;
  void *v36;
  unint64_t v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  unint64_t v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  id *v62;
  void *v63;
  double v64;
  double v65;
  void *v66;
  double v67;
  double v68;
  int64_t numberOfVisibleIndicators;
  BOOL v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  double v74;
  void *v75;
  double v76;
  double v77;
  uint64_t v78;
  double continuousStartIndex;
  double v80;
  double v81;
  double v82;
  void *v83;
  double v84;
  double v85;
  double v86;
  double v87;
  uint64_t v88;
  UIPageControl *pageControl;
  double v90;
  double v91;
  double v92;
  int64_t v93;
  unint64_t v94;
  int64_t indicatorStartIndex;
  void *v96;
  id *v97;
  unint64_t v98;
  void *v99;
  double v100;
  double v101;
  double v102;
  unint64_t v103;
  void *v104;
  double v105;
  double v106;
  void *v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  unint64_t v114;
  unint64_t v115;
  void *v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  void *v122;
  void *v123;
  double v124;
  double v125;
  double v126;
  void *v127;
  int64_t v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  void *v132;
  double v133;
  double v134;
  double v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  double v140;
  double v141;
  void *v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  double v148;
  double v149;
  double v150;
  BOOL v151;
  double v152;
  double v153;
  double v154;
  _BOOL4 v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  char v161;
  double v162;
  double v163;
  double v164;
  double v165;
  double v166;
  double v167;
  double v168;
  double v169;
  double v170;
  double v171;
  double v172;
  double v173;
  double v174;
  void *v175;
  void *v176;
  double v177;
  double v178;
  double v179;
  unint64_t v180;
  double v181;
  id v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t i;
  void *v187;
  double v188;
  double v189;
  double v190;
  double v191;
  void *v192;
  double v193;
  double v194;
  double v195;
  double v196;
  double v197;
  void *v198;
  void *v199;
  double v200;
  double v201;
  double v202;
  double v203;
  double v204;
  double v205;
  double v206;
  double v207;
  unint64_t v208;
  void *v209;
  double v210;
  double v211;
  double v212;
  void *v213;
  void *v214;
  double v215;
  double v216;
  double v217;
  double v218;
  double v219;
  double v220;
  double v221;
  double v222;
  void *v223;
  double v224;
  double v225;
  double v226;
  double v227;
  double v228;
  double v229;
  double v230;
  double v231;
  void *v232;
  void *v233;
  double v234;
  double v235;
  double v236;
  double v237;
  double v238;
  double v239;
  double v240;
  double v241;
  void *v242;
  double v243;
  double v244;
  double v245;
  double v246;
  double v247;
  double v248;
  double v249;
  double v250;
  void *v251;
  void *v252;
  void *v253;
  double v254;
  double v255;
  double v256;
  void *v257;
  double v258;
  double v259;
  unint64_t v260;
  UIControlContentHorizontalAlignment v261;
  double v262;
  BOOL v263;
  UIControlContentVerticalAlignment v264;
  _BOOL4 v265;
  double v266;
  double v267;
  unint64_t v268;
  CGAffineTransform v269;
  CGAffineTransform v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  CGAffineTransform v275;
  CGAffineTransform v276;
  objc_super v277;
  _BYTE v278[128];
  uint64_t v279;

  v279 = *MEMORY[0x1E0C80C00];
  v277.receiver = self;
  v277.super_class = (Class)_UIInteractivePageControlVisualProvider;
  -[_UIPageControlVisualProvider layoutSubviews](&v277, sel_layoutSubviews);
  if (!-[UIPageControl numberOfPages](self->super._pageControl, "numberOfPages"))
    return;
  v3 = -[_UIInteractivePageControlVisualProvider resolvedDirection](self, "resolvedDirection");
  v4 = -[_UIInteractivePageControlVisualProvider resolvedDirection](self, "resolvedDirection");
  -[UIPageControl progress](self->super._pageControl, "progress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIView bounds](self->super._pageControl, "bounds");
  v8 = -[_UIInteractivePageControlVisualProvider _intrinsicContentSizeWithPageControlSize:includeExpandedActiveIndicator:]((id *)&self->super.super.isa, v5 != 0, v6, v7);
  v10 = v9;
  v11 = 0.0;
  if (-[UIPageControl numberOfPages](self->super._pageControl, "numberOfPages") > self->_numberOfVisibleIndicators)
  {
    -[_UIInteractivePageControlVisualProvider interactor](self, "interactor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "joggingDistance");
    v11 = v13;

  }
  -[_UIInteractivePageControlVisualProvider scrubProgress](self, "scrubProgress");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "presentationValue");
  v16 = v11 * v15 + (1.0 - v15) * 0.0;

  -[UIView bounds](self->super._pageControl, "bounds");
  v19 = v18 + v17 * 0.5;
  v22 = v21 + v20 * 0.5;
  v266 = -[_UIInteractivePageControlVisualProvider _indicatorSpacing]((uint64_t)self);
  v23 = -[_UIInteractivePageControlVisualProvider resolvedDirection](self, "resolvedDirection");
  if (v23 >= 2)
    v24 = v22;
  else
    v24 = v19;
  v25 = v16 + v24;
  if (v23 >= 2)
    v22 = v25;
  else
    v19 = v25;
  -[UIView _currentScreenScale](self->super._pageControl, "_currentScreenScale");
  UIRectCenteredAboutPointScale(0.0, 0.0, v8, v10, v19, v22, v26);
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;
  -[_UIInteractivePageControlVisualProvider contentView](self, "contentView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setBounds:", 0.0, 0.0, v32, v34);

  -[_UIInteractivePageControlVisualProvider contentView](self, "contentView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setCenter:", v28 + v32 * 0.5, v30 + v34 * 0.5);

  v37 = -[_UIInteractivePageControlVisualProvider resolvedDirection](self, "resolvedDirection");
  -[_UIInteractivePageControlVisualProvider indicatorStore](self, "indicatorStore");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "contentSizeForNumberOfPages:hasExpandedActiveIndicator:", -[UIPageControl numberOfPages](self->super._pageControl, "numberOfPages"), v5 != 0);
  if (v37 >= 2)
    v41 = v40;
  else
    v41 = v39;

  -[_UIInteractivePageControlVisualProvider contentView](self, "contentView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "bounds");
  v44 = v43;
  v46 = v45;

  if (v3 < 2)
    v44 = v41;
  else
    v46 = v41;
  -[_UIInteractivePageControlVisualProvider indicatorContentView](self, "indicatorContentView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setBounds:", 0.0, 0.0, v44, v46);

  -[_UIInteractivePageControlVisualProvider scrubProgress](self, "scrubProgress");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "presentationValue");
  if (v49 != 0.0)
    goto LABEL_22;
  -[_UIInteractivePageControlVisualProvider scrubProgress](self, "scrubProgress");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "value");
  v52 = v51;

  if (v52 == 0.0)
  {
    v53 = -[_UIInteractivePageControlVisualProvider resolvedDirection](self, "resolvedDirection");
    -[_UIInteractivePageControlVisualProvider contentView](self, "contentView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "bounds");
    v57 = v56 + v55 * 0.5;
    v60 = v59 + v58 * 0.5;
    if (v53 >= 2)
      v61 = v60;
    else
      v61 = v57;

    -[_UIInteractivePageControlVisualProvider interactor](self, "interactor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setUnconstrainedPosition:offset:", v61, 0.0);
LABEL_22:

  }
  v62 = -[_UIInteractivePageControlVisualProvider _numberOfVisibleIndicatorsFittingContentLengthForStartIndex:]((id *)&self->super.super.isa, self->_indicatorStartIndex);
  -[_UIInteractivePageControlVisualProvider continuousDisplayedPage](self, "continuousDisplayedPage");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "value");
  v65 = v64;

  -[_UIInteractivePageControlVisualProvider continuousDisplayedPage](self, "continuousDisplayedPage");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "presentationValue");
  v68 = fmax(fmin(v67, (double)(-[UIPageControl numberOfPages](self->super._pageControl, "numberOfPages") - 1)), 0.0);

  numberOfVisibleIndicators = self->_numberOfVisibleIndicators;
  v71 = numberOfVisibleIndicators - 2;
  v70 = numberOfVisibleIndicators < 2;
  v72 = numberOfVisibleIndicators - 1;
  if (v70)
    v73 = v72;
  else
    v73 = v71;
  v74 = (double)(-[UIPageControl numberOfPages](self->super._pageControl, "numberOfPages") - (uint64_t)v62);
  -[_UIInteractivePageControlVisualProvider continuousDisplayedPage](self, "continuousDisplayedPage");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "presentationValue");
  v77 = v76;

  v78 = -[UIPageControl numberOfPages](self->super._pageControl, "numberOfPages");
  continuousStartIndex = self->_continuousStartIndex;
  if (v62)
  {
    v80 = (double)(uint64_t)fmax(fmin((double)(v73 >> 1), 2.0), 0.0);
    v81 = fmax(v77 - v80, 0.0);
    if (continuousStartIndex < v81)
    {
      v81 = fmin((double)v78, v77 + v80 + 1.0) - (double)(uint64_t)v62;
      if (continuousStartIndex > v81)
      {
        v81 = round(continuousStartIndex);
        if (v81 == continuousStartIndex)
          v81 = self->_continuousStartIndex;
      }
    }
  }
  else
  {
    v81 = self->_continuousStartIndex;
  }
  v82 = fmax(fmin(v81, v74), 0.0);
  self->_continuousStartIndex = v82;
  self->super._displayedPage = llround(v68);
  self->_indicatorStartIndex = vcvtmd_s64_f64(v82);
  self->_numberOfVisibleIndicators = (int64_t)-[_UIInteractivePageControlVisualProvider _numberOfVisibleIndicatorsFittingContentLengthForStartIndex:]((id *)&self->super.super.isa, llround(v82));
  -[_UIInteractivePageControlVisualProvider indicatorContentView](self, "indicatorContentView");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "frame");
  v85 = v84;
  v87 = v86;

  if ((uint64_t)v65 > (uint64_t)v68)
    v88 = 1;
  else
    v88 = 2 * ((uint64_t)v65 < (uint64_t)v68);
  pageControl = self->super._pageControl;
  v90 = 14.0;
  if ((*(_BYTE *)&pageControl->_custom & 2) != 0)
  {
    -[UIPageControl _customHorizontalPadding](pageControl, "_customHorizontalPadding");
    v90 = v91;
    pageControl = self->super._pageControl;
  }
  v92 = self->_continuousStartIndex;
  if (-[UIPageControl backgroundStyle](pageControl, "backgroundStyle") == UIPageControlBackgroundStyleMinimal
    && (*(_BYTE *)&self->super._pageControl->_custom & 3) == 0)
  {
    v90 = 0.0;
  }
  v258 = v16;
  v257 = v5;
  v255 = v68;
  v256 = v65;
  v93 = v4;
  v94 = v3;
  if (v88 == 2)
  {
    indicatorStartIndex = vcvtmd_s64_f64(v92);
  }
  else if (v88 == 1)
  {
    indicatorStartIndex = vcvtpd_s64_f64(v92);
  }
  else
  {
    indicatorStartIndex = self->_indicatorStartIndex;
  }
  -[UIPageControl progress](self->super._pageControl, "progress");
  v96 = (void *)objc_claimAutoreleasedReturnValue();

  v97 = -[_UIInteractivePageControlVisualProvider _numberOfVisibleIndicatorsFittingContentLengthForStartIndex:]((id *)&self->super.super.isa, indicatorStartIndex);
  v98 = -[_UIInteractivePageControlVisualProvider resolvedDirection](self, "resolvedDirection");
  -[_UIInteractivePageControlVisualProvider indicatorStore](self, "indicatorStore");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "minimumContentSizeForIndicatorsInRange:hasExpandedActiveIndicator:", indicatorStartIndex, v97, v96 != 0);
  if (v98 >= 2)
    v102 = v101;
  else
    v102 = v100;

  if (v96)
  {
    v103 = -[_UIInteractivePageControlVisualProvider resolvedDirection](self, "resolvedDirection");
    -[_UIInteractivePageControlVisualProvider indicatorStore](self, "indicatorStore");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "minimumContentSizeForIndicatorsInRange:hasExpandedActiveIndicator:", indicatorStartIndex, v97, 0);
    if (v103 >= 2)
      v105 = v106;
    v267 = v105;

    -[_UIInteractivePageControlVisualProvider scrubProgress](self, "scrubProgress");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "presentationValue");
    v108 = v87;
    v109 = v85;
    v111 = 1.0 - v110;

    v112 = v267 * (1.0 - v111);
    v113 = v102 * v111;
    v85 = v109;
    v87 = v108;
    v102 = v113 + v112;
  }
  v114 = v94;
  v268 = v93 & 0xFFFFFFFFFFFFFFFDLL;
  v115 = -[_UIInteractivePageControlVisualProvider resolvedDirection](self, "resolvedDirection");
  -[_UIInteractivePageControlVisualProvider contentView](self, "contentView");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "bounds");
  if (v115 >= 2)
    v119 = v118;
  else
    v119 = v117;
  v120 = v119 - (v90 + v90);

  v121 = (v120 - v102) * 0.5;
  if (v121 == self->_indicatorPaddingOffset || v92 == (double)indicatorStartIndex)
    self->_indicatorPaddingOffset = v121;
  -[_UIInteractivePageControlVisualProvider indicatorStore](self, "indicatorStore");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "indicatorPositionForContinuousPage:expandedIndicatorPage:", -[_UIInteractivePageControlVisualProvider _pageForExpandedIndicator](self), self->_continuousStartIndex);

  if (v268 == 1)
  {
    -[_UIInteractivePageControlVisualProvider resolvedDirection](self, "resolvedDirection");
    -[_UIInteractivePageControlVisualProvider contentView](self, "contentView");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "bounds");
    -[_UIInteractivePageControlVisualProvider resolvedDirection](self, "resolvedDirection");

  }
  UIRoundToViewScale(self->super._pageControl);
  v260 = v114;
  if (v114 >= 2)
    v125 = 0.0;
  else
    v125 = v124;
  if (v114 >= 2)
    v126 = v124;
  else
    v126 = 0.0;
  -[_UIInteractivePageControlVisualProvider indicatorContentView](self, "indicatorContentView");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "setFrame:", v125, v126, v85, v87);

  v128 = self->_indicatorStartIndex;
  v129 = (uint64_t)fmax((double)(v128 - 2), 0.0);
  v130 = (uint64_t)fmin((double)(v128 + self->_numberOfVisibleIndicators + 2), (double)-[UIPageControl numberOfPages](self->super._pageControl, "numberOfPages"));
  -[_UIInteractivePageControlVisualProvider indicatorFeed](self, "indicatorFeed");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "prepareIndicatorsFrom:to:", v129, v130);

  -[_UIInteractivePageControlVisualProvider indicatorStore](self, "indicatorStore");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "indicatorPositionForContinuousPage:expandedIndicatorPage:", -[_UIInteractivePageControlVisualProvider _pageForExpandedIndicator](self), (double)v129);
  v134 = v133;

  if (v268 == 1)
  {
    if ((unint64_t)-[_UIInteractivePageControlVisualProvider resolvedDirection](self, "resolvedDirection") >= 2)
      v135 = v87;
    else
      v135 = v85;
    v134 = v135 - v134;
  }
  -[_UIInteractivePageControlVisualProvider indicatorContentView](self, "indicatorContentView");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "subviews");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v138 = (void *)objc_msgSend(v137, "mutableCopy");

  -[_UIInteractivePageControlVisualProvider indicatorStore](self, "indicatorStore");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "defaultIndicatorSize");
  v259 = v140;
  v262 = v141;

  v264 = -[UIControl contentVerticalAlignment](self->super._pageControl, "contentVerticalAlignment");
  v261 = -[UIControl contentHorizontalAlignment](self->super._pageControl, "contentHorizontalAlignment");
  -[_UIInteractivePageControlVisualProvider contentView](self, "contentView");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v142, "bounds");
  v144 = v143;
  v146 = v145;
  v148 = v147;
  v150 = v149;

  if (v129 < v130)
  {
    v151 = v260 < 2;
    v152 = v146 + v150 * 0.5;
    if (v260 >= 2)
      v153 = v144 + v148 * 0.5;
    else
      v153 = 0.0;
    if (v260 >= 2)
      v154 = 0.0;
    else
      v154 = v152;
    if (v264)
      v155 = v260 < 2;
    else
      v155 = 0;
    v265 = v155;
    if (v261 == UIControlContentHorizontalAlignmentCenter)
      v151 = 1;
    v263 = v151;
    do
    {
      -[_UIInteractivePageControlVisualProvider indicatorFeed](self, "indicatorFeed");
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v156, "indicatorForPage:", v129);
      v157 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v157, "image");
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIInteractivePageControlVisualProvider indicatorStore](self, "indicatorStore");
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v159, "indicatorImage");
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      v161 = objc_msgSend(v158, "isEqual:", v160);

      if ((v161 & 1) == 0)
      {
        if (v265)
        {
          if (v264 == UIControlContentVerticalAlignmentBottom)
          {
            objc_msgSend(v157, "bounds");
            v163 = v168 - v262;
            v164 = -0.5;
            goto LABEL_95;
          }
          if (v264 == UIControlContentVerticalAlignmentTop)
          {
            objc_msgSend(v157, "bounds");
            v163 = v162 - v262;
            v164 = 0.5;
LABEL_95:
            v154 = v154 + v163 * v164;
          }
        }
        else if (!v263)
        {
          if (v261 == UIControlContentHorizontalAlignmentRight)
          {
            objc_msgSend(v157, "bounds");
            v166 = v169 - v259;
            v167 = -0.5;
            goto LABEL_97;
          }
          if (v261 == UIControlContentHorizontalAlignmentLeft)
          {
            objc_msgSend(v157, "bounds");
            v166 = v165 - v259;
            v167 = 0.5;
LABEL_97:
            v153 = v153 + v166 * v167;
          }
        }
      }
      v170 = -[_UIInteractivePageControlVisualProvider _layoutSizeForIndicator:]((id *)&self->super.super.isa, v157);
      v172 = v171;
      if ((unint64_t)-[_UIInteractivePageControlVisualProvider resolvedDirection](self, "resolvedDirection") >= 2)
        v173 = v172;
      else
        v173 = v170;
      v174 = -[_UIInteractivePageControlVisualProvider _indicatorScaleForPage:]((uint64_t)self, objc_msgSend(v157, "page"));
      objc_msgSend(v157, "superview");
      v175 = (void *)objc_claimAutoreleasedReturnValue();

      if (v175)
      {
        objc_msgSend(v138, "removeObject:", v157);
      }
      else
      {
        -[_UIInteractivePageControlVisualProvider indicatorContentView](self, "indicatorContentView");
        v176 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v176, "addSubview:", v157);

      }
      v177 = v173 * 0.5;
      v178 = v134 - v177;
      v179 = v134 + v177;
      v180 = -[_UIInteractivePageControlVisualProvider resolvedDirection](self, "resolvedDirection");
      if (v268 == 1)
        v134 = v178 - (v266 + v177);
      else
        v134 = v179 + v266 + v177;
      UIRoundToViewScale(self->super._pageControl);
      if (v180 >= 2)
        v154 = v181;
      else
        v153 = v181;
      objc_msgSend(v157, "setDefaultModeSize:", -[_UIInteractivePageControlVisualProvider _layoutSizeForIndicator:progress:]((id *)&self->super.super.isa, v157, 0.0));
      objc_msgSend(v157, "setExpandedModeSize:", -[_UIInteractivePageControlVisualProvider _layoutSizeForIndicator:progress:]((id *)&self->super.super.isa, v157, 1.0));
      objc_msgSend(v157, "setBounds:", 0.0, 0.0, v170, v172);
      objc_msgSend(v157, "setCenter:", v153, v154);
      CGAffineTransformMakeScale(&v276, v174, v174);
      v275 = v276;
      objc_msgSend(v157, "setTransform:", &v275);
      objc_msgSend(v157, "layoutBelowIfNeeded");

      ++v129;
    }
    while (v130 != v129);
  }
  v273 = 0u;
  v274 = 0u;
  v271 = 0u;
  v272 = 0u;
  v182 = v138;
  v183 = objc_msgSend(v182, "countByEnumeratingWithState:objects:count:", &v271, v278, 16);
  if (v183)
  {
    v184 = v183;
    v185 = *(_QWORD *)v272;
    do
    {
      for (i = 0; i != v184; ++i)
      {
        if (*(_QWORD *)v272 != v185)
          objc_enumerationMutation(v182);
        objc_msgSend(*(id *)(*((_QWORD *)&v271 + 1) + 8 * i), "removeFromSuperview");
      }
      v184 = objc_msgSend(v182, "countByEnumeratingWithState:objects:count:", &v271, v278, 16);
    }
    while (v184);
  }

  -[_UIInteractivePageControlVisualProvider contentView](self, "contentView");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "bounds");
  v189 = v188;
  v191 = v190;

  if (v257)
  {
    -[_UIInteractivePageControlVisualProvider scrubProgress](self, "scrubProgress");
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v192, "presentationValue");
    v194 = 1.0 - v193;

    -[UIView bounds](self->super._pageControl, "bounds");
    v189 = v189 * v194
         + (1.0 - v194)
         * -[_UIInteractivePageControlVisualProvider _intrinsicContentSizeWithPageControlSize:includeExpandedActiveIndicator:]((id *)&self->super.super.isa, 0, v195, v196);
    v191 = v191 * v194 + (1.0 - v194) * v197;
  }
  -[_UIInteractivePageControlVisualProvider backgroundView](self, "backgroundView");
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v198, "setBounds:", 0.0, 0.0, v189, v191);
  -[_UIInteractivePageControlVisualProvider contentView](self, "contentView");
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v199, "bounds");
  objc_msgSend(v198, "setCenter:", v201 + v200 * 0.5, v203 + v202 * 0.5);

  v204 = fabs(v258);
  v205 = v204 * 0.0625 / 20.0 + 1.0;
  v206 = v204 * -0.11111112 / 20.0 + 1.0;
  if (v260 > 1)
  {
    v207 = v204 * -0.11111112 / 20.0 + 1.0;
  }
  else
  {
    v207 = v204 * 0.0625 / 20.0 + 1.0;
    v205 = v206;
  }
  CGAffineTransformMakeScale(&v270, v207, v205);
  v269 = v270;
  objc_msgSend(v198, "setTransform:", &v269);
  v208 = -[_UIInteractivePageControlVisualProvider resolvedDirection](self, "resolvedDirection");
  -[_UIInteractivePageControlVisualProvider backgroundView](self, "backgroundView");
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v209, "frame");
  if (v208 >= 2)
    v212 = v210;
  else
    v212 = v211;
  objc_msgSend(v198, "_setContinuousCornerRadius:", v212 * 0.5);

  if (v256 == v255)
  {
    -[_UIInteractivePageControlVisualProvider _visibleLeftIndicator](self);
    v213 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIInteractivePageControlVisualProvider _visibleLeftIndicator](self);
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v214, "bounds");
    v216 = v215;
    v218 = v217;
    v220 = v219;
    v222 = v221;
    -[_UIInteractivePageControlVisualProvider contentView](self, "contentView");
    v223 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v213, "convertRect:toView:", v223, v216, v218, v220, v222);
    v225 = v224;
    v227 = v226;
    v229 = v228;
    v231 = v230;

    -[_UIInteractivePageControlVisualProvider _visibleRightIndicator](self);
    v232 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIInteractivePageControlVisualProvider _visibleRightIndicator](self);
    v233 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v233, "bounds");
    v235 = v234;
    v237 = v236;
    v239 = v238;
    v241 = v240;
    -[_UIInteractivePageControlVisualProvider contentView](self, "contentView");
    v242 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v232, "convertRect:toView:", v242, v235, v237, v239, v241);
    v244 = v243;
    v246 = v245;
    v248 = v247;
    v250 = v249;

    -[_UIInteractivePageControlVisualProvider interactor](self, "interactor");
    v251 = (void *)objc_claimAutoreleasedReturnValue();
    v252 = v251;
    if (v260 > 1)
    {
      objc_msgSend(v251, "updateScrubLowerBound:upperBound:", v227 + v231 * 0.5, v246 + v250 * 0.5);

      -[_UIInteractivePageControlVisualProvider interactor](self, "interactor");
      v253 = (void *)objc_claimAutoreleasedReturnValue();
      v254 = v227 + v231;
      v244 = v246;
    }
    else
    {
      objc_msgSend(v251, "updateScrubLowerBound:upperBound:", v225 + v229 * 0.5, v244 + v248 * 0.5);

      -[_UIInteractivePageControlVisualProvider interactor](self, "interactor");
      v253 = (void *)objc_claimAutoreleasedReturnValue();
      v254 = v225 + v229;
    }
    objc_msgSend(v253, "updateRubberbandLowerBound:upperBound:", v266 + v254, v244 - v266);

  }
}

- (int64_t)resolvedDirection
{
  return self->_resolvedDirection;
}

- (double)_layoutSizeForIndicator:(double)a3 progress:
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    v7 = v5;
    objc_msgSend(a1, "indicatorStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "page");

    objc_msgSend(v8, "resolvedIndicatorLayoutSizeForPage:", v9);
    v11 = v10;

    if (a3 != 0.0)
    {
      objc_msgSend(v7, "page");
      v12 = objc_msgSend(v7, "page");
      if (v12 != objc_msgSend(a1[1], "numberOfPages") - 1)
      {
        objc_msgSend(a1, "indicatorStore");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "resolvedIndicatorLayoutSizeForPage:", objc_msgSend(v7, "page") + 1);

      }
      -[_UIInteractivePageControlVisualProvider _indicatorSpacing]((uint64_t)a1);
      objc_msgSend(a1, "resolvedDirection");
      objc_msgSend(a1, "resolvedDirection");
      UIRoundToViewScale(a1[1]);
      v15 = v14;
      if ((unint64_t)objc_msgSend(a1, "resolvedDirection") < 2)
        v11 = v15;
    }
  }
  else
  {
    v11 = 0.0;
  }

  return v11;
}

- (_UIPageIndicatorStore)indicatorStore
{
  return self->_indicatorStore;
}

- (_UIPageControlContentView)contentView
{
  return self->_contentView;
}

- (_UIPageIndicatorFeed)indicatorFeed
{
  return self->_indicatorFeed;
}

- (double)_indicatorSpacing
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  double result;

  if (!a1)
    return 0.0;
  v1 = *(_QWORD *)(a1 + 8);
  if ((*(_BYTE *)(v1 + 476) & 4) != 0)
    return *(double *)(v1 + 496);
  objc_msgSend((id)v1, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  result = 8.0;
  if (v3 == 5)
    return 12.0;
  return result;
}

- (double)_indicatorScaleForPage:(uint64_t)a1
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  BOOL v13;
  double v14;
  double v15;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  float v25;
  double v26;

  if (!a1)
    return 0.0;
  v4 = *(_QWORD *)(a1 + 320);
  v5 = v4 - 2;
  if (v4 < 2)
    v5 = v4 - 1;
  v6 = (uint64_t)fmax(fmin((double)(v5 >> 1), 2.0), 0.0);
  v7 = *(double *)(a1 + 368);
  v8 = (double)a2;
  v9 = (double)a2 - v7;
  v10 = objc_msgSend(*(id *)(a1 + 8), "numberOfPages");
  v11 = 1.0;
  v12 = fmax(fmin((v7 + -0.999) / -0.999, 1.0), 0.0);
  if (a2 || (v12 > 0.0 ? (v13 = v6 < 1) : (v13 = 1), v13))
  {
    if (a2 == 1 && v12 > 0.0 && v6 >= 2)
    {
      v17 = (v9 + 0.5) / 1.5;
LABEL_31:
      v15 = fmin(v17, 1.0);
      goto LABEL_32;
    }
    v18 = (double)v4;
    if (fmax(fmin((v7 - ((double)(v10 - v4) + -1.0)) / ((double)(v10 - v4) - ((double)(v10 - v4) + -1.0)), 1.0), 0.0) > 0.0)
    {
      if (objc_msgSend(*(id *)(a1 + 8), "numberOfPages") - 1 == a2 && v6 >= 1)
      {
        v19 = (double)(v4 - 1);
LABEL_30:
        v17 = (v9 - v18) / (v19 - v18);
        goto LABEL_31;
      }
      if (objc_msgSend(*(id *)(a1 + 8), "numberOfPages") - 2 == a2 && v6 >= 2)
      {
        v19 = v18 + -1.5;
        goto LABEL_30;
      }
    }
    v20 = (double)v6;
    if (v7 != 0.0 && v9 < v20)
    {
      v11 = 1.0;
      v14 = (v9 + 1.0) / (v20 + 1.0);
      goto LABEL_10;
    }
    v21 = fmax(v7, v7 + v18 + -1.0);
    v22 = 1.0;
    if (v21 + 1.0 == (double)objc_msgSend(*(id *)(a1 + 8), "numberOfPages") || v21 - v20 >= v8)
      goto LABEL_33;
    v19 = (double)(v4 + ~v6);
    goto LABEL_30;
  }
  v14 = v9 + 1.0;
LABEL_10:
  v15 = fmin(v14, v11);
LABEL_32:
  v22 = fmax(v15, 0.0);
LABEL_33:
  objc_msgSend((id)a1, "indicatorTransformCurve");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v24 = v22;
  objc_msgSend(v23, "_solveForInput:", v24);
  v26 = fabsf(v25);

  return v26;
}

- (CAMediaTimingFunction)indicatorTransformCurve
{
  return self->_indicatorTransformCurve;
}

- (double)_layoutSizeForIndicator:(id *)a1
{
  id v3;
  double v4;
  double v5;

  if (!a1)
    return 0.0;
  v3 = a2;
  objc_msgSend(v3, "currentExpandProgress");
  v5 = -[_UIInteractivePageControlVisualProvider _layoutSizeForIndicator:progress:](a1, v3, v4);

  return v5;
}

- (_UIPageControlIndicatorContentView)indicatorContentView
{
  return self->_indicatorContentView;
}

- (UIViewFloatAnimatableProperty)continuousDisplayedPage
{
  return self->_continuousDisplayedPage;
}

- (UIViewFloatAnimatableProperty)scrubProgress
{
  return self->_scrubProgress;
}

- (_UIPageControlInteractor)interactor
{
  return self->_interactor;
}

- (uint64_t)_pageForExpandedIndicator
{
  uint64_t v1;
  void *v3;
  double v4;

  if (!a1)
    return 0;
  if (-[_UIInteractivePageControlVisualProvider _hasActiveExpandedIndicator]((id *)a1))
  {
    objc_msgSend(a1, "continuousDisplayedPage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "value");
    v1 = (uint64_t)v4;

  }
  return v1;
}

- (id)backgroundView
{
  UIView *backgroundView;
  UIVisualEffectView *v4;
  void *v5;
  UIView *v6;
  UIView *v7;

  backgroundView = self->_backgroundView;
  if (!backgroundView)
  {
    v4 = [UIVisualEffectView alloc];
    -[_UIInteractivePageControlVisualProvider _resolvedVisualEffect]((id *)&self->super.super.isa);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[UIVisualEffectView initWithEffect:](v4, "initWithEffect:", v5);
    v7 = self->_backgroundView;
    self->_backgroundView = v6;

    -[_UIInteractivePageControlVisualProvider _installBackgroundViewIfNeeded]((id *)&self->super.super.isa);
    backgroundView = self->_backgroundView;
  }
  return backgroundView;
}

- (id)_visibleRightIndicator
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  void *v4;

  v1 = (uint64_t)a1;
  if (a1)
  {
    v2 = objc_msgSend(a1, "resolvedDirection") & 0xFFFFFFFFFFFFFFFDLL;
    v3 = *(_QWORD *)(v1 + 312);
    if (v2 != 1)
      v3 = v3 + *(_QWORD *)(v1 + 320) - 1;
    if (v3 < 0 || v3 >= objc_msgSend(*(id *)(v1 + 8), "numberOfPages"))
    {
      v1 = 0;
    }
    else
    {
      objc_msgSend((id)v1, "indicatorFeed");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "indicatorForPage:", v3);
      v1 = objc_claimAutoreleasedReturnValue();

    }
  }
  return (id)v1;
}

- (id)_visibleLeftIndicator
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  void *v4;

  v1 = (uint64_t)a1;
  if (a1)
  {
    v2 = objc_msgSend(a1, "resolvedDirection") & 0xFFFFFFFFFFFFFFFDLL;
    v3 = *(_QWORD *)(v1 + 312);
    if (v2 == 1)
      v3 = v3 + *(_QWORD *)(v1 + 320) - 1;
    if (v3 < 0 || v3 >= objc_msgSend(*(id *)(v1 + 8), "numberOfPages"))
    {
      v1 = 0;
    }
    else
    {
      objc_msgSend((id)v1, "indicatorFeed");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "indicatorForPage:", v3);
      v1 = objc_claimAutoreleasedReturnValue();

    }
  }
  return (id)v1;
}

- (void)_installBackgroundViewIfNeeded
{
  id v2;

  if (a1)
  {
    if (a1[47])
    {
      objc_msgSend(a1[47], "setAlpha:", (double)objc_msgSend(a1, "isPlatterExpanded"));
      objc_msgSend(a1, "contentView");
      v2 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "insertSubview:atIndex:", a1[47], 0);

    }
  }
}

- (BOOL)_indicatorModeForPage:(id *)a1
{
  _BOOL8 v2;
  double v4;
  void *v5;
  double v6;

  v2 = (_BOOL8)a1;
  if (a1)
  {
    if (-[_UIInteractivePageControlVisualProvider _hasActiveExpandedIndicator](a1))
    {
      v4 = (double)a2;
      objc_msgSend((id)v2, "continuousDisplayedPage");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "value");
      v2 = v6 == v4;

    }
    else
    {
      return 0;
    }
  }
  return v2;
}

- (CGRect)indicatorFrameForPage:(int64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  -[_UIInteractivePageControlVisualProvider indicatorFeed](self, "indicatorFeed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeIndicatorForPage:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "bounds");
    objc_msgSend(v6, "convertRect:toView:", self->super._pageControl);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
  }
  else
  {
    v8 = *MEMORY[0x1E0C9D628];
    v10 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v12 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v14 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void)_transitionIndicatorForPage:(uint64_t)a3 toEnabled:
{
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _OWORD v17[10];
  _OWORD v18[10];

  if (a1)
  {
    objc_msgSend(a1, "indicatorFeed");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "indicators");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = a2 - objc_msgSend(v8, "page");

    if ((v9 & 0x8000000000000000) == 0)
    {
      objc_msgSend(a1, "indicatorFeed");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "indicators");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      if (v9 < v12)
      {
        objc_msgSend(a1, "indicatorFeed");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "indicatorForPage:", a2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        -[_UIInteractivePageControlVisualProvider _indicatorColorForEnabled:]((id *)a1, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setActiveIndicatorColor:", v15);

        -[_UIInteractivePageControlVisualProvider _indicatorColorForEnabled:]((id *)a1, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setIndicatorColor:", v16);

        objc_msgSend(a1, "pageIndicatorVibrantColorMatrix");
        v18[2] = v18[7];
        v18[3] = v18[8];
        v18[4] = v18[9];
        v18[0] = v18[5];
        v18[1] = v18[6];
        objc_msgSend(v14, "setVibrantColorMatrix:", v18);
        objc_msgSend(a1, "activePageIndicatorVibrantColorMatrix");
        v17[2] = v17[7];
        v17[3] = v17[8];
        v17[4] = v17[9];
        v17[0] = v17[5];
        v17[1] = v17[6];
        objc_msgSend(v14, "setActiveVibrantColorMatrix:", v17);
        objc_msgSend(v14, "setActive:", a3);

      }
    }
  }
}

- (id)_indicatorColorForEnabled:(id *)a1
{
  id *v2;
  void *v3;
  id *v4;
  char v5;
  id v6;

  v2 = a1;
  if (a1)
  {
    if (a2)
    {
      objc_msgSend(a1[1], "currentPageIndicatorTintColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
      {
        +[UIColor systemWhiteColor](UIColor, "systemWhiteColor");
        v4 = (id *)objc_claimAutoreleasedReturnValue();
LABEL_12:
        v2 = v4;

        return v2;
      }
LABEL_11:
      v4 = v3;
      goto LABEL_12;
    }
    v5 = objc_msgSend(a1, "isPlatterExpanded");
    v6 = v2[1];
    if ((v5 & 1) == 0)
    {
      objc_msgSend(v6, "pageIndicatorTintColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
      {
        +[UIColor _pageControlIndicatorColor](UIColor, "_pageControlIndicatorColor");
        v4 = (id *)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
      goto LABEL_11;
    }
    if (objc_msgSend(v6, "backgroundStyle") != 1
      || !dyld_program_sdk_at_least()
      || (objc_msgSend(v2[1], "pageIndicatorTintColor"), (v2 = (id *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      +[UIColor _pageControlPlatterIndicatorColor](UIColor, "_pageControlPlatterIndicatorColor");
      v2 = (id *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v2;
}

- (BOOL)isPlatterExpanded
{
  return (*(_BYTE *)&self->_state >> 1) & 1;
}

- (void)_updateReuseQueue
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 312);
    v3 = *(_QWORD *)(a1 + 320);
    v4 = objc_msgSend(*(id *)(a1 + 8), "numberOfPages");
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend((id)a1, "indicatorFeed", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "indicators");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = (uint64_t)fmax((double)(v2 - 2), 0.0);
      v10 = (uint64_t)fmin((double)(v2 + v3 + 2), (double)v4);
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v6);
          v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v13, "page") < v9 || objc_msgSend(v13, "page") >= v10)
            objc_msgSend(v13, "invalidate");
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

    objc_msgSend((id)a1, "indicatorFeed");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "updateReuseQueue");

  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIPageControl *pageControl;
  double v18;
  double v19;
  double v20;
  double v21;
  _BOOL4 v22;
  double v23;
  double v24;
  int hasContent;
  double v26;
  unint64_t v27;
  double v28;
  double v29;
  _BOOL8 v30;
  double v31;
  double v32;
  double v33;
  unint64_t v34;
  _BOOL4 v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41[6];
  CGSize result;

  height = a3.height;
  width = a3.width;
  if ((unint64_t)-[_UIInteractivePageControlVisualProvider resolvedDirection](self, "resolvedDirection") >= 2)
    v6 = height;
  else
    v6 = width;
  if (v6 == 0.0)
  {
    -[_UIInteractivePageControlVisualProvider intrinsicContentSize](self, "intrinsicContentSize");
  }
  else
  {
    if (self)
    {
      -[UIPageControl progress](self->super._pageControl, "progress");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        v10 = 4;
      else
        v10 = 5;
      v11 = -[_UIInteractivePageControlVisualProvider resolvedDirection](self, "resolvedDirection");
      -[_UIInteractivePageControlVisualProvider indicatorStore](self, "indicatorStore");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "defaultIndicatorSize");
      if (v11 >= 2)
        v13 = v14;
      v15 = v13 * (double)v10;
      v16 = -[_UIInteractivePageControlVisualProvider _indicatorSpacing]((uint64_t)self) * (double)(v10 - 1);
      pageControl = self->super._pageControl;
      v18 = 28.0;
      if ((*(_BYTE *)&pageControl->_custom & 2) != 0)
      {
        -[UIPageControl _customHorizontalPadding](pageControl, "_customHorizontalPadding");
        v18 = v19 + v19;
      }
      v20 = v16 + v15;

      if (qword_1ECD7B7C8 != -1)
        dispatch_once(&qword_1ECD7B7C8, &__block_literal_global_557);
      v21 = v20 + v18;
      if (_MergedGlobals_23_6)
      {
        v22 = -[UIPageControl allowsContinuousInteraction](self->super._pageControl, "allowsContinuousInteraction");
        v23 = 42.5;
        if (!v22)
          v23 = 0.0;
        v24 = v21 + v23;
        hasContent = -[_UIInteractivePageControlVisualProvider _hasContentScaling]((id *)&self->super.super.isa);
        v26 = 1.05;
        if (!hasContent)
          v26 = 1.0;
        v21 = v24 * v26;
      }
    }
    else
    {
      v21 = 0.0;
    }
    v27 = -[_UIInteractivePageControlVisualProvider resolvedDirection](self, "resolvedDirection");
    if ((unint64_t)-[_UIInteractivePageControlVisualProvider resolvedDirection](self, "resolvedDirection") >= 2)
      v28 = height;
    else
      v28 = width;
    v29 = fmax(v21, v28);
    if (v27 >= 2)
      height = v29;
    else
      width = v29;
    v30 = -[_UIInteractivePageControlVisualProvider _supportsExpandedIndicator]((uint64_t)self);
    v31 = -[_UIInteractivePageControlVisualProvider _intrinsicContentSizeWithPageControlSize:includeExpandedActiveIndicator:]((id *)&self->super.super.isa, v30, width, height);
    v33 = v32;
    if (qword_1ECD7B7C8 != -1)
      dispatch_once(&qword_1ECD7B7C8, &__block_literal_global_557);
    if (_MergedGlobals_23_6)
    {
      v34 = -[_UIInteractivePageControlVisualProvider resolvedDirection](self, "resolvedDirection");
      if (self)
      {
        v35 = -[UIPageControl allowsContinuousInteraction](self->super._pageControl, "allowsContinuousInteraction");
        v36 = 42.5;
        if (!v35)
          v36 = 0.0;
      }
      else
      {
        v36 = 0.0;
      }
      if (v34 >= 2)
        v37 = v33;
      else
        v37 = v31;
      v38 = v37 + v36;
      if (v34 >= 2)
        v39 = v31;
      else
        v39 = v38;
      if (v34 >= 2)
        v33 = v38;
      -[_UIInteractivePageControlVisualProvider _contentTransformForActiveState:]((uint64_t)v41, (id *)&self->super.super.isa, 1);
      v31 = v39 * v41[0] + v33 * v41[2];
      v33 = v39 * v41[1] + v33 * v41[3];
    }
    -[UIView _currentScreenScale](self->super._pageControl, "_currentScreenScale");
    v7 = UISizeRoundToScale(v31, v33, v40);
  }
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)sizeForNumberOfPages:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  unint64_t v10;
  UIPageControl *pageControl;
  char custom;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  unint64_t v18;
  double v19;
  double v20;
  _BOOL4 v21;
  double v22;
  double v23;
  unint64_t v24;
  double v25;
  double v26;
  double v27;
  CGSize result;

  -[_UIInteractivePageControlVisualProvider indicatorStore](self, "indicatorStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentSizeForNumberOfPages:hasExpandedActiveIndicator:", a3, -[_UIInteractivePageControlVisualProvider _supportsExpandedIndicator]((uint64_t)self));
  v7 = v6;
  v9 = v8;

  if (self
    && (-[UIPageControl backgroundStyle](self->super._pageControl, "backgroundStyle") != UIPageControlBackgroundStyleMinimal
     || (*(_BYTE *)&self->super._pageControl->_custom & 3) != 0))
  {
    v10 = -[_UIInteractivePageControlVisualProvider resolvedDirection](self, "resolvedDirection");
    pageControl = self->super._pageControl;
    custom = (char)pageControl->_custom;
    if (v10 > 1)
    {
      v13 = 16.0;
      if ((*(_BYTE *)&pageControl->_custom & 1) != 0)
      {
        -[UIPageControl _customVerticalPadding](pageControl, "_customVerticalPadding");
        v13 = v17 + v17;
        pageControl = self->super._pageControl;
        custom = (char)pageControl->_custom;
      }
      v15 = 28.0;
      if ((custom & 2) == 0)
        goto LABEL_14;
      -[UIPageControl _customHorizontalPadding](pageControl, "_customHorizontalPadding", 28.0);
    }
    else
    {
      v13 = 28.0;
      if ((*(_BYTE *)&pageControl->_custom & 2) != 0)
      {
        -[UIPageControl _customHorizontalPadding](pageControl, "_customHorizontalPadding");
        v13 = v14 + v14;
        pageControl = self->super._pageControl;
        custom = (char)pageControl->_custom;
      }
      v15 = 16.0;
      if ((custom & 1) == 0)
        goto LABEL_14;
      -[UIPageControl _customVerticalPadding](pageControl, "_customVerticalPadding", 16.0);
    }
    v15 = v16 + v16;
LABEL_14:
    v7 = v7 + v13;
    v9 = v9 + v15;
  }
  if (qword_1ECD7B7C8 != -1)
    dispatch_once(&qword_1ECD7B7C8, &__block_literal_global_557);
  if (_MergedGlobals_23_6)
  {
    v18 = -[_UIInteractivePageControlVisualProvider resolvedDirection](self, "resolvedDirection");
    v19 = 0.0;
    v20 = 0.0;
    if (self)
    {
      v21 = -[UIPageControl allowsContinuousInteraction](self->super._pageControl, "allowsContinuousInteraction", 0.0);
      v20 = 42.5;
      if (!v21)
        v20 = 0.0;
    }
    if (v18 >= 2)
      v22 = v9;
    else
      v22 = v7;
    v23 = v22 + v20;
    if (v18 >= 2)
      v9 = v23;
    else
      v7 = v23;
    v24 = -[_UIInteractivePageControlVisualProvider resolvedDirection](self, "resolvedDirection");
    if ((unint64_t)-[_UIInteractivePageControlVisualProvider resolvedDirection](self, "resolvedDirection") >= 2)
      v25 = v9;
    else
      v25 = v7;
    if (self)
    {
      if (-[_UIInteractivePageControlVisualProvider _hasContentScaling]((id *)&self->super.super.isa))
        v19 = 1.05;
      else
        v19 = 1.0;
    }
    if (v24 >= 2)
      v9 = v25 * v19;
    else
      v7 = v25 * v19;
  }
  v26 = v7;
  v27 = v9;
  result.height = v27;
  result.width = v26;
  return result;
}

- (double)_intrinsicContentSizeWithPageControlSize:(double)a3 includeExpandedActiveIndicator:(double)a4
{
  int v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  _BYTE *v13;
  double v14;
  double v15;
  int v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  _BYTE *v25;
  unint64_t v26;
  char v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;

  if (!a1)
    return 0.0;
  if (qword_1ECD7B7C8 != -1)
    dispatch_once(&qword_1ECD7B7C8, &__block_literal_global_557);
  v8 = _MergedGlobals_23_6;
  if (_MergedGlobals_23_6)
  {
    if (-[_UIInteractivePageControlVisualProvider _hasContentScaling](a1))
      v9 = 1.05;
    else
      v9 = 1.0;
  }
  else
  {
    v9 = 1.0;
  }
  if ((unint64_t)objc_msgSend(a1, "resolvedDirection") >= 2)
    v10 = a4;
  else
    v10 = a3;
  v11 = v10 / v9;
  v12 = objc_msgSend(a1[1], "backgroundStyle");
  v13 = a1[1];
  if (v12 != 2 || (v13[476] & 3) != 0)
  {
    v14 = 28.0;
    if ((v13[476] & 2) != 0)
    {
      objc_msgSend(v13, "_customHorizontalPadding", 28.0);
      v14 = v15 + v15;
      v13 = a1[1];
    }
    v11 = v11 - v14;
  }
  if (!objc_msgSend(v13, "numberOfPages"))
    return *MEMORY[0x1E0C9D820];
  if (v8)
  {
    v16 = objc_msgSend(a1[1], "allowsContinuousInteraction");
    v17 = 42.5;
    if (!v16)
      v17 = 0.0;
  }
  else
  {
    v17 = 0.0;
  }
  v19 = ceil(v11 - v17);
  objc_msgSend(a1, "indicatorStore");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sizeForMaximumContentSizeFittingLength:hasExpandedActiveIndicator:", a2, v19);
  v22 = v21;
  v24 = v23;

  if (objc_msgSend(a1[1], "backgroundStyle") != 2 || (v25 = a1[1], (v25[476] & 3) != 0))
  {
    v26 = objc_msgSend(a1, "resolvedDirection");
    v25 = a1[1];
    v27 = v25[476];
    if ((v27 & 2) != 0)
    {
      objc_msgSend(v25, "_customHorizontalPadding");
      v28 = v29;
      v25 = a1[1];
      v27 = v25[476];
    }
    else
    {
      v28 = 14.0;
    }
    v30 = 8.0;
    if ((v27 & 1) != 0)
    {
      objc_msgSend(v25, "_customVerticalPadding", 8.0);
      v25 = a1[1];
    }
    if (v26 >= 2)
      v31 = v30;
    else
      v31 = v28;
    if (v26 >= 2)
      v30 = v28;
    v24 = v24 + v30 + v30;
    v22 = v22 + v31 + v31;
  }
  objc_msgSend(v25, "_currentScreenScale");
  v33 = v32;
  UICeilToScale(v22, v32);
  v18 = v34;
  UICeilToScale(v24, v33);
  return v18;
}

- (id)_hasActiveExpandedIndicator
{
  id *v1;
  void *v2;

  if (result)
  {
    v1 = result;
    objc_msgSend(result[1], "progress");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
      return (id *)(objc_msgSend(v1, "isScrubbing") ^ 1);
    else
      return 0;
  }
  return result;
}

- (id)_numberOfVisibleIndicatorsFittingContentLengthForStartIndex:(id *)result
{
  id *v3;
  unint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  _BYTE *v10;
  double v12;
  double v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  uint64_t v17;

  if (result)
  {
    v3 = result;
    v4 = objc_msgSend(result, "resolvedDirection");
    objc_msgSend(v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    if (v4 >= 2)
      v8 = v7;
    else
      v8 = v6;

    v9 = objc_msgSend(v3[1], "backgroundStyle");
    v10 = v3[1];
    if (v9 != 2 || (v10[476] & 3) != 0)
    {
      v12 = 28.0;
      if ((v10[476] & 2) != 0)
      {
        objc_msgSend(v10, "_customHorizontalPadding", 28.0);
        v12 = v13 + v13;
      }
      v8 = v8 - v12;
    }
    objc_msgSend(v3, "indicatorStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3[1], "progress");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15 != 0;

    v17 = objc_msgSend(v14, "numberOfVisibleIndicatorsForStartIndex:fittingLength:hasExpandedActiveIndicator:", a2, v16, v8);
    return (id *)v17;
  }
  return result;
}

- (BOOL)supportsContinuousInteraction
{
  void *v2;
  BOOL v3;

  -[UIView traitCollection](self->super._pageControl, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") != 6;

  return v3;
}

- (BOOL)_supportsExpandedIndicator
{
  void *v1;
  _BOOL8 v2;

  if (!a1)
    return 0;
  objc_msgSend(*(id *)(a1 + 8), "progress");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (unint64_t)maxVisibleIndicators
{
  if (self->super._pageControl->_preferredNumberOfVisibleIndicators <= 0xA)
    return 10;
  else
    return self->super._pageControl->_preferredNumberOfVisibleIndicators;
}

- (void)configureIndicatorImagesForIndicator:(id)a3 atPage:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a3;
  -[_UIInteractivePageControlVisualProvider indicatorStore](self, "indicatorStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indicatorImageForPage:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v8);

  -[_UIInteractivePageControlVisualProvider indicatorStore](self, "indicatorStore");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activeIndicatorImageForPage:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActiveImage:", v9);

}

- (CGSize)indicatorSizeForImage:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  v4 = a3;
  -[_UIInteractivePageControlVisualProvider indicatorFeed](self, "indicatorFeed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indicatorSizeForCustomImage:", v4);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)prepare
{
  _UIPageIndicatorFeed *v3;
  void *v4;
  void *v5;
  void *v6;
  _UIPageControlInteractor *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  UIPageControl *pageControl;
  void *v29;
  UITapGestureRecognizer *v30;
  void *v31;
  UILongPressGestureRecognizer *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  UISelectionFeedbackGenerator *v42;
  void *v43;
  void *v44;
  UIImpactFeedbackGenerator *v45;
  _QWORD v46[4];
  id v47;
  id location;
  objc_super v49;
  _QWORD v50[3];

  v50[2] = *MEMORY[0x1E0C80C00];
  v49.receiver = self;
  v49.super_class = (Class)_UIInteractivePageControlVisualProvider;
  -[_UIPageControlVisualProvider prepare](&v49, sel_prepare);
  self->_numberOfVisibleIndicators = 0;
  -[UIPageControl setAllowsContinuousInteraction:](self->super._pageControl, "setAllowsContinuousInteraction:", 1);
  -[UIPageControl _setAllowsDiscreteInteraction:](self->super._pageControl, "_setAllowsDiscreteInteraction:", 1);
  -[UIPageControl _setFlickToEndGestureEnabled:](self->super._pageControl, "_setFlickToEndGestureEnabled:", 1);
  self->_preciseTouchedPage = -1.79769313e308;
  v3 = -[_UIPageIndicatorFeed initWithPageControl:]([_UIPageIndicatorFeed alloc], "initWithPageControl:", self->super._pageControl);
  -[_UIInteractivePageControlVisualProvider setIndicatorFeed:](self, "setIndicatorFeed:", v3);

  -[_UIInteractivePageControlVisualProvider indicatorFeed](self, "indicatorFeed");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

  v5 = (void *)objc_opt_new();
  -[_UIInteractivePageControlVisualProvider setIndicatorStore:](self, "setIndicatorStore:", v5);

  -[_UIInteractivePageControlVisualProvider indicatorStore](self, "indicatorStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);

  v7 = -[_UIPageControlInteractor initWithMaximumDistance:]([_UIPageControlInteractor alloc], "initWithMaximumDistance:", 20.0);
  -[_UIInteractivePageControlVisualProvider setInteractor:](self, "setInteractor:", v7);

  v8 = objc_alloc(MEMORY[0x1E0CD27D0]);
  LODWORD(v9) = 0.375;
  LODWORD(v10) = -0.125;
  LODWORD(v11) = -0.3125;
  LODWORD(v12) = 0.125;
  v13 = (void *)objc_msgSend(v8, "initWithControlPoints::::", v9, v10, v11, v12);
  -[_UIInteractivePageControlVisualProvider setIndicatorTransformCurve:](self, "setIndicatorTransformCurve:", v13);

  v14 = (void *)objc_opt_new();
  -[_UIInteractivePageControlVisualProvider setContentView:](self, "setContentView:", v14);

  v15 = (void *)objc_opt_new();
  -[_UIInteractivePageControlVisualProvider setIndicatorContentView:](self, "setIndicatorContentView:", v15);

  -[_UIInteractivePageControlVisualProvider contentView](self, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  -[_UIInteractivePageControlVisualProvider indicatorContentView](self, "indicatorContentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFrame:", v18, v20, v22, v24);

  -[_UIInteractivePageControlVisualProvider contentView](self, "contentView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIInteractivePageControlVisualProvider indicatorContentView](self, "indicatorContentView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addSubview:", v27);

  pageControl = self->super._pageControl;
  -[_UIInteractivePageControlVisualProvider contentView](self, "contentView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addSubview:](pageControl, "addSubview:", v29);

  -[_UIInteractivePageControlVisualProvider didUpdateLayoutDirection](self, "didUpdateLayoutDirection");
  v30 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", self, sel_didTapPageControl_);
  -[UIGestureRecognizer setDelegate:](v30, "setDelegate:", self);
  -[UIGestureRecognizer setCancelsTouchesInView:](v30, "setCancelsTouchesInView:", 0);
  -[UIView addGestureRecognizer:](self->super._pageControl, "addGestureRecognizer:", v30);
  -[_UIInteractivePageControlVisualProvider setTapGestureRecognizer:](self, "setTapGestureRecognizer:", v30);
  v31 = (void *)objc_opt_new();
  objc_msgSend(v31, "setDelegate:", self);
  objc_msgSend(v31, "setControlEventsDelegate:", self);
  objc_msgSend(v31, "setDelaysTouchesEnded:", 0);
  objc_msgSend(v31, "setCancelsTouchesInView:", 0);
  -[UIView addGestureRecognizer:](self->super._pageControl, "addGestureRecognizer:", v31);
  -[_UIPageControlVisualProvider setInteractionState:](self, "setInteractionState:", 0);
  v32 = -[UILongPressGestureRecognizer initWithTarget:action:]([UILongPressGestureRecognizer alloc], "initWithTarget:action:", self, sel_didScrubPageControl_);
  -[UILongPressGestureRecognizer setMinimumPressDuration:](v32, "setMinimumPressDuration:", 0.15);
  -[UIGestureRecognizer setDelegate:](v32, "setDelegate:", self);
  -[UIGestureRecognizer setCancelsTouchesInView:](v32, "setCancelsTouchesInView:", 0);
  -[UILongPressGestureRecognizer setAllowableMovement:](v32, "setAllowableMovement:", 1.79769313e308);
  -[UIView addGestureRecognizer:](self->super._pageControl, "addGestureRecognizer:", v32);
  -[_UIInteractivePageControlVisualProvider setScrubbingGestureRecognizer:](self, "setScrubbingGestureRecognizer:", v32);
  v33 = (void *)objc_opt_new();
  -[_UIInteractivePageControlVisualProvider setContinuousDisplayedPage:](self, "setContinuousDisplayedPage:", v33);

  v34 = (void *)objc_opt_new();
  -[_UIInteractivePageControlVisualProvider setScrubProgress:](self, "setScrubProgress:", v34);

  -[_UIInteractivePageControlVisualProvider continuousDisplayedPage](self, "continuousDisplayedPage");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setValue:", 0.0);

  -[_UIInteractivePageControlVisualProvider scrubProgress](self, "scrubProgress");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setValue:", 0.0);

  -[_UIInteractivePageControlVisualProvider continuousDisplayedPage](self, "continuousDisplayedPage");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v37;
  -[_UIInteractivePageControlVisualProvider scrubProgress](self, "scrubProgress");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v50[1] = v38;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __50___UIInteractivePageControlVisualProvider_prepare__block_invoke;
  v46[3] = &unk_1E16B3F40;
  objc_copyWeak(&v47, &location);
  +[UIView _createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:](UIView, "_createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:", v39, v46);
  -[_UIInteractivePageControlVisualProvider resetSuccessiveTapInfo](self, "resetSuccessiveTapInfo");
  -[_UIInteractivePageControlVisualProvider didUpdateCustomLayoutValues](self, "didUpdateCustomLayoutValues");
  +[_UISelectionFeedbackGeneratorConfiguration pageControlConfiguration](_UISelectionFeedbackGeneratorConfiguration, "pageControlConfiguration");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "tweakedConfigurationForClass:usage:", objc_opt_class(), CFSTR("pageControl"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = -[UIFeedbackGenerator initWithConfiguration:view:]([UISelectionFeedbackGenerator alloc], "initWithConfiguration:view:", v41, self->super._pageControl);
  -[_UIInteractivePageControlVisualProvider setSelectionFeedbackGenerator:](self, "setSelectionFeedbackGenerator:", v42);

  +[_UIImpactFeedbackGeneratorConfiguration lightConfiguration](_UIImpactFeedbackGeneratorConfiguration, "lightConfiguration");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "tweakedConfigurationForClass:usage:", objc_opt_class(), CFSTR("pageControl"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = -[UIFeedbackGenerator initWithConfiguration:view:]([UIImpactFeedbackGenerator alloc], "initWithConfiguration:view:", v44, self->super._pageControl);
  -[_UIInteractivePageControlVisualProvider setJoggingFeedbackGenerator:](self, "setJoggingFeedbackGenerator:", v45);

  -[UIView setNeedsLayout](self->super._pageControl, "setNeedsLayout");
  objc_destroyWeak(&v47);
  objc_destroyWeak(&location);

}

- (void)didUpdateCustomLayoutValues
{
  double v3;
  void *v4;

  v3 = -[_UIInteractivePageControlVisualProvider _indicatorSpacing]((uint64_t)self);
  -[_UIInteractivePageControlVisualProvider indicatorStore](self, "indicatorStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIndicatorSpacing:", v3);

  -[UIView invalidateIntrinsicContentSize](self->super._pageControl, "invalidateIntrinsicContentSize");
  -[UIView setNeedsLayout](self->super._pageControl, "setNeedsLayout");
}

- (void)didUpdateInteractionTypeAvailability
{
  double v3;
  void *v4;
  _BOOL8 v5;
  id v6;

  -[_UIInteractivePageControlVisualProvider updateScrubbingGestureRecognizer]((id *)&self->super.super.isa);
  -[UIView invalidateIntrinsicContentSize](self->super._pageControl, "invalidateIntrinsicContentSize");
  -[UIView setNeedsLayout](self->super._pageControl, "setNeedsLayout");
  if (-[UIPageControl _allowsDiscreteInteraction](self->super._pageControl, "_allowsDiscreteInteraction"))
    v3 = 0.15;
  else
    v3 = 0.0;
  -[_UIInteractivePageControlVisualProvider scrubbingGestureRecognizer](self, "scrubbingGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMinimumPressDuration:", v3);

  v5 = -[UIPageControl _allowsDiscreteInteraction](self->super._pageControl, "_allowsDiscreteInteraction");
  -[_UIInteractivePageControlVisualProvider tapGestureRecognizer](self, "tapGestureRecognizer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v5);

}

- (void)updateScrubbingGestureRecognizer
{
  uint64_t v2;
  id v3;

  if (a1)
  {
    v2 = objc_msgSend(a1[1], "allowsContinuousInteraction");
    objc_msgSend(a1, "scrubbingGestureRecognizer");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setEnabled:", v2);

  }
}

- (UILongPressGestureRecognizer)scrubbingGestureRecognizer
{
  return self->_scrubbingGestureRecognizer;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)updateDisplayedPageToCurrentPage
{
  void *v3;
  void *v4;

  if (-[_UIInteractivePageControlVisualProvider isScrubbing](self, "isScrubbing")
    && -[UIPageControl currentPage](self->super._pageControl, "currentPage") != self->super._displayedPage)
  {
    -[_UIInteractivePageControlVisualProvider scrubbingGestureRecognizer](self, "scrubbingGestureRecognizer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setEnabled:", 0);

    -[_UIInteractivePageControlVisualProvider scrubbingGestureRecognizer](self, "scrubbingGestureRecognizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEnabled:", 1);

  }
  self->_targetPage = -[UIPageControl currentPage](self->super._pageControl, "currentPage");
  -[_UIPageControlVisualProvider setInteractionState:](self, "setInteractionState:", 0);
  -[_UIInteractivePageControlVisualProvider _setDisplayedPage:completion:]((id *)&self->super.super.isa, -[UIPageControl currentPage](self->super._pageControl, "currentPage"), 0);
}

- (BOOL)isScrubbing
{
  return *(_BYTE *)&self->_state & 1;
}

- (void)_setDisplayedPage:(void *)a3 completion:
{
  void (**v5)(_QWORD);
  void *v6;
  double v7;
  double v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __objc2_class **v18;
  unsigned int v19;
  double v20;
  uint64_t v21;
  id *v22;
  __objc2_class *v23;
  double v24;
  uint64_t *v25;
  __objc2_class *v26;
  _QWORD v27[4];
  void (**v28)(_QWORD);
  _QWORD v29[4];
  id v30;
  _QWORD aBlock[7];
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id *v36;
  uint64_t v37;
  _QWORD v38[6];
  _QWORD v39[4];
  uint64_t *v40;

  v5 = a3;
  if (a1)
  {
    objc_msgSend(a1, "continuousDisplayedPage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "value");
    v8 = v7;

    if (v8 != (double)a2)
    {
      if (objc_msgSend(a1, "interactionState"))
      {
        v9 = 1;
      }
      else
      {
        objc_msgSend(a1[1], "window");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v10 != 0;

      }
      v11 = objc_msgSend(a1, "interactionState");
      objc_msgSend(a1, "continuousDisplayedPage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "value");
      v14 = (uint64_t)v13;

      v15 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __72___UIInteractivePageControlVisualProvider__setDisplayedPage_completion___block_invoke;
      aBlock[3] = &unk_1E16B4E70;
      aBlock[4] = a1;
      aBlock[5] = a2;
      aBlock[6] = v14;
      v16 = _Block_copy(aBlock);
      v17 = v16;
      v18 = off_1E167B000;
      if (v9)
      {
        v19 = -[_UIInteractivePageControlVisualProvider _hasActiveExpandedIndicator](a1);
        if (v19)
          v20 = 0.35;
        else
          v20 = 0.15;
        v21 = v19 ^ 1;
        v29[0] = v15;
        v29[1] = 3221225472;
        v29[2] = __72___UIInteractivePageControlVisualProvider__setDisplayedPage_completion___block_invoke_2;
        v29[3] = &unk_1E16B1BF8;
        v30 = v17;
        v27[0] = v15;
        v27[1] = 3221225472;
        v27[2] = __72___UIInteractivePageControlVisualProvider__setDisplayedPage_completion___block_invoke_3;
        v27[3] = &unk_1E16C0E38;
        v28 = v5;
        v18 = off_1E167B000;
        +[UIView _animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:](UIView, "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:", v21, v29, v27, 1.0, v20, 0.08, 1.0, 0.08, 0.995);

      }
      else
      {
        (*((void (**)(void *))v16 + 2))(v16);
        if (v5)
          v5[2](v5);
      }
      v38[0] = v15;
      v38[1] = 3221225472;
      v38[2] = __93___UIInteractivePageControlVisualProvider_animateTransitionIndicatorsFromPage_toPage_ripple___block_invoke;
      v38[3] = &unk_1E16B1888;
      v38[4] = a1;
      v38[5] = v14;
      v22 = v38;
      v23 = v18[372];
      v24 = 0.25;
      if (v11 == 1)
        v24 = 0.125;
      v32 = v15;
      v33 = 3221225472;
      v34 = ___UIPageIndicatorAnimateFadeOut_block_invoke;
      v35 = &unk_1E16B1BF8;
      v36 = v22;
      -[__objc2_class animateWithDuration:delay:options:animations:completion:](v23, "animateWithDuration:delay:options:animations:completion:", 131076, &v32, 0, v24, 0.0);

      v32 = v15;
      v33 = 3221225472;
      v34 = __93___UIInteractivePageControlVisualProvider_animateTransitionIndicatorsFromPage_toPage_ripple___block_invoke_2;
      v35 = &unk_1E16B1888;
      v36 = a1;
      v37 = a2;
      v25 = &v32;
      v26 = v18[372];
      v39[0] = v15;
      v39[1] = 3221225472;
      v39[2] = ___UIPageIndicatorAnimateFadeIn_block_invoke;
      v39[3] = &unk_1E16B1BF8;
      v40 = v25;
      -[__objc2_class animateWithDuration:delay:options:animations:completion:](v26, "animateWithDuration:delay:options:animations:completion:", 7, v39, 0, 0.015625, 0.0);

    }
  }

}

- (void)setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, a3);
}

- (void)setSelectionFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_selectionFeedbackGenerator, a3);
}

- (void)setScrubbingGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_scrubbingGestureRecognizer, a3);
}

- (void)setScrubProgress:(id)a3
{
  objc_storeStrong((id *)&self->_scrubProgress, a3);
}

- (void)setPreviousMoveDirection:(int64_t)a3
{
  self->_previousMoveDirection = a3;
}

- (void)setJoggingFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_joggingFeedbackGenerator, a3);
}

- (void)setInteractor:(id)a3
{
  objc_storeStrong((id *)&self->_interactor, a3);
}

- (void)setIndicatorTransformCurve:(id)a3
{
  objc_storeStrong((id *)&self->_indicatorTransformCurve, a3);
}

- (void)setIndicatorStore:(id)a3
{
  objc_storeStrong((id *)&self->_indicatorStore, a3);
}

- (void)setIndicatorFeed:(id)a3
{
  objc_storeStrong((id *)&self->_indicatorFeed, a3);
}

- (void)setIndicatorContentView:(id)a3
{
  objc_storeStrong((id *)&self->_indicatorContentView, a3);
}

- (void)setContinuousDisplayedPage:(id)a3
{
  objc_storeStrong((id *)&self->_continuousDisplayedPage, a3);
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (CGSize)intrinsicContentSize
{
  unint64_t preferredNumberOfVisibleIndicators;
  double v4;
  double v5;
  CGSize result;

  if (self)
  {
    if (self->super._pageControl->_preferredNumberOfVisibleIndicators)
      preferredNumberOfVisibleIndicators = self->super._pageControl->_preferredNumberOfVisibleIndicators;
    else
      preferredNumberOfVisibleIndicators = 8;
  }
  else
  {
    preferredNumberOfVisibleIndicators = 0;
  }
  -[_UIInteractivePageControlVisualProvider sizeForNumberOfPages:](self, "sizeForNumberOfPages:", preferredNumberOfVisibleIndicators);
  -[_UIInteractivePageControlVisualProvider sizeThatFits:](self, "sizeThatFits:");
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)resetSuccessiveTapInfo
{
  -[_UIInteractivePageControlVisualProvider setPreviousTouchLocation:](self, "setPreviousTouchLocation:", -100.0, -100.0);
  -[_UIInteractivePageControlVisualProvider setPreviousMoveDirection:](self, "setPreviousMoveDirection:", 0);
}

- (void)setPreviousTouchLocation:(CGPoint)a3
{
  self->_previousTouchLocation = a3;
}

- (void)_updateIndicatorTintColor
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  double v11;
  void *v12;
  double v13;
  _BOOL8 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    -[_UIInteractivePageControlVisualProvider _indicatorColorForEnabled:](a1, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIInteractivePageControlVisualProvider _indicatorColorForEnabled:](a1, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(a1, "indicatorFeed", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "indicators");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          v11 = (double)objc_msgSend(v10, "page");
          objc_msgSend(a1, "continuousDisplayedPage");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "value");
          v14 = v13 == v11;

          -[_UIInteractivePageControlVisualProvider _transitionIndicatorForPage:toEnabled:](a1, objc_msgSend(v10, "page"), v14);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
    }

  }
}

- (void)didUpdateNumberOfPages
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int64_t numberOfVisibleIndicators;
  int64_t v8;

  -[UIView invalidateIntrinsicContentSize](self->super._pageControl, "invalidateIntrinsicContentSize");
  -[_UIInteractivePageControlVisualProvider updateScrubbingGestureRecognizer]((id *)&self->super.super.isa);
  v3 = -[UIPageControl numberOfPages](self->super._pageControl, "numberOfPages");
  -[_UIInteractivePageControlVisualProvider indicatorStore](self, "indicatorStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfPages");

  if (v5 != v3)
  {
    -[_UIInteractivePageControlVisualProvider indicatorStore](self, "indicatorStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateStoreForNumberOfPages:", v3);

    numberOfVisibleIndicators = self->_numberOfVisibleIndicators;
    if (numberOfVisibleIndicators + self->_indicatorStartIndex > v3)
      self->_indicatorStartIndex = (v3 - numberOfVisibleIndicators) & ~((v3 - numberOfVisibleIndicators) >> 63);
    if (v3 < 1)
      v8 = -1;
    else
      v8 = (uint64_t)fmax(fmin((double)self->super._displayedPage, (double)(-[UIPageControl numberOfPages](self->super._pageControl, "numberOfPages") - 1)), 0.0);
    self->super._displayedPage = v8;
    -[_UIInteractivePageControlVisualProvider _updateReuseQueue]((uint64_t)self);
    -[UIView setNeedsLayout](self->super._pageControl, "setNeedsLayout");
  }
}

- (void)setCustomIndicatorImage:(id)a3 forPage:(int64_t)a4
{
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  unint64_t v13;
  id v14;

  v14 = a3;
  -[_UIInteractivePageControlVisualProvider indicatorStore](self, "indicatorStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "customIndicatorImageForPage:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", v14);

  if ((v8 & 1) == 0)
  {
    -[_UIInteractivePageControlVisualProvider indicatorStore](self, "indicatorStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateImage:forPage:", v14, a4);

    -[_UIInteractivePageControlVisualProvider indicatorFeed](self, "indicatorFeed");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reloadIndicatorImageForPage:", a4);

    -[_UIInteractivePageControlVisualProvider continuousDisplayedPage](self, "continuousDisplayedPage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "value");
    v13 = llround(v12);

    -[_UIInteractivePageControlVisualProvider _transitionIndicatorForPage:toEnabled:](self, a4, v13 == a4);
    -[UIView invalidateIntrinsicContentSize](self->super._pageControl, "invalidateIntrinsicContentSize");
    -[UIView setNeedsLayout](self->super._pageControl, "setNeedsLayout");
  }

}

- (void)traitCollectionDidChangeOnSubtree:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIView traitCollection](self->super._pageControl, "traitCollection");
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (v4)
    {
      v6 = v5[13];
      v7 = v4[13];

      if (v6 == v7)
        goto LABEL_14;
    }
    else
    {

    }
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[_UIInteractivePageControlVisualProvider indicatorFeed](self, "indicatorFeed", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "indicators");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v13++), "sizeToFit");
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

  }
LABEL_14:
  -[_UIInteractivePageControlVisualProvider didUpdateLayoutDirection](self, "didUpdateLayoutDirection");
  -[_UIInteractivePageControlVisualProvider indicatorStore](self, "indicatorStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "invalidateLayoutCache");

  -[UIView invalidateIntrinsicContentSize](self->super._pageControl, "invalidateIntrinsicContentSize");
  -[UIView setNeedsLayout](self->super._pageControl, "setNeedsLayout");

}

- (void)didUpdateLayoutDirection
{
  UIPageControl *v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = self->super._pageControl;
  v4 = 0;
  switch(-[UIPageControl direction](v3, "direction"))
  {
    case UIPageControlDirectionNatural:
      v4 = -[UIView _shouldReverseLayoutDirection](v3, "_shouldReverseLayoutDirection");
      break;
    case UIPageControlDirectionRightToLeft:
      v4 = 1;
      break;
    case UIPageControlDirectionTopToBottom:
      v4 = 2;
      break;
    case UIPageControlDirectionBottomToTop:
      v4 = 3;
      break;
    default:
      break;
  }

  -[_UIInteractivePageControlVisualProvider indicatorStore](self, "indicatorStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDirection:", v4);

  if (v4 >= 2)
    v6 = 2;
  else
    v6 = 16;
  -[_UIInteractivePageControlVisualProvider indicatorContentView](self, "indicatorContentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAutoresizingMask:", v6);

  if (self->_resolvedDirection != v4)
  {
    self->_resolvedDirection = v4;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[_UIInteractivePageControlVisualProvider indicatorFeed](self, "indicatorFeed", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "indicators");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "setDirection:", v4);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

    -[UIView invalidateIntrinsicContentSize](self->super._pageControl, "invalidateIntrinsicContentSize");
    -[UIView setNeedsLayout](self->super._pageControl, "setNeedsLayout");
  }
}

- (void)configureIndicator:(id)a3 atPage:(int64_t)a4
{
  id v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  uint64_t v14;
  _OWORD v15[10];
  _OWORD v16[10];
  CGAffineTransform v17;
  CGAffineTransform v18;

  v6 = a3;
  v7 = -[_UIInteractivePageControlVisualProvider _indicatorScaleForPage:]((uint64_t)self, a4);
  CGAffineTransformMakeScale(&v18, v7, v7);
  v17 = v18;
  objc_msgSend(v6, "setTransform:", &v17);
  objc_msgSend(v6, "setDirection:", -[_UIInteractivePageControlVisualProvider resolvedDirection](self, "resolvedDirection"));
  objc_msgSend(v6, "setSupportsExpandedIndicator:", -[_UIInteractivePageControlVisualProvider _supportsExpandedIndicator]((uint64_t)self));
  -[_UIInteractivePageControlVisualProvider _indicatorColorForEnabled:]((id *)&self->super.super.isa, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActiveIndicatorColor:", v8);

  -[_UIInteractivePageControlVisualProvider _indicatorColorForEnabled:]((id *)&self->super.super.isa, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIndicatorColor:", v9);

  -[_UIPageControlVisualProvider pageIndicatorVibrantColorMatrix](self, "pageIndicatorVibrantColorMatrix");
  v16[2] = v16[7];
  v16[3] = v16[8];
  v16[4] = v16[9];
  v16[0] = v16[5];
  v16[1] = v16[6];
  objc_msgSend(v6, "setVibrantColorMatrix:", v16);
  -[_UIPageControlVisualProvider activePageIndicatorVibrantColorMatrix](self, "activePageIndicatorVibrantColorMatrix");
  v15[2] = v15[7];
  v15[3] = v15[8];
  v15[4] = v15[9];
  v15[0] = v15[5];
  v15[1] = v15[6];
  objc_msgSend(v6, "setActiveVibrantColorMatrix:", v15);
  -[_UIInteractivePageControlVisualProvider continuousDisplayedPage](self, "continuousDisplayedPage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "value");
  objc_msgSend(v6, "setActive:", (uint64_t)v11 == a4);

  -[_UIInteractivePageControlVisualProvider continuousDisplayedPage](self, "continuousDisplayedPage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "value");
  if (self)
  {
    if ((uint64_t)v13 >= a4)
      v14 = 2 * ((uint64_t)v13 > a4);
    else
      v14 = 1;
  }
  else
  {
    v14 = 0;
  }

  objc_msgSend(v6, "setMode:direction:", -[_UIInteractivePageControlVisualProvider _indicatorModeForPage:]((id *)&self->super.super.isa, a4), v14);
}

- (id)_resolvedVisualEffect
{
  id *v1;
  void *v2;

  if (a1)
  {
    v1 = a1;
    objc_msgSend(a1[1], "_platterEffect");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
      objc_msgSend(v1[1], "_platterEffect");
    else
      +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 7);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)setIndicatorOpacity:(double)a3
{
  -[UIView setAlpha:](self->_indicatorContentView, "setAlpha:", a3);
}

- (void)didUpdatePageProgress
{
  id *v3;
  id v4;

  -[UIView invalidateIntrinsicContentSize](self->super._pageControl, "invalidateIntrinsicContentSize");
  -[UIView setNeedsLayout](self->super._pageControl, "setNeedsLayout");
  -[_UIInteractivePageControlVisualProvider _updateIndicatorMode]((id *)&self->super.super.isa);
  v3 = -[_UIInteractivePageControlVisualProvider _hasActiveExpandedIndicator]((id *)&self->super.super.isa);
  -[UIPageControl progress](self->super._pageControl, "progress");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_progressVisibilityChanged:", v3);

}

- (void)didUpdateCurrentPageProgress
{
  void *v3;
  void *v4;
  id v5;

  -[_UIInteractivePageControlVisualProvider indicatorFeed](self, "indicatorFeed");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeIndicatorForPage:", -[UIPageControl currentPage](self->super._pageControl, "currentPage"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[UIPageControl progress](self->super._pageControl, "progress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentProgress");
  objc_msgSend(v5, "setCurrentProgress:");

}

- (id)_updateIndicatorMode
{
  id *v1;
  void *v2;
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    objc_msgSend(result, "continuousDisplayedPage");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "value");
    v4 = v3;

    objc_msgSend(v1[1], "progress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v1, "indicatorFeed");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "indicators");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v7;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = (uint64_t)v4;
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          v14 = objc_msgSend(v13, "page");
          if (v14 > v10)
            v15 = 1;
          else
            v15 = 2 * (v14 < v10);
          v16 = -[_UIInteractivePageControlVisualProvider _indicatorModeForPage:](v1, objc_msgSend(v13, "page"));
          objc_msgSend(v13, "setSupportsExpandedIndicator:", v5 != 0);
          objc_msgSend(v13, "setMode:direction:", v16, v15);
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

    return (id *)objc_msgSend(v1, "didUpdateCurrentPageProgress");
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_joggingFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_selectionFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_indicatorTransformCurve, 0);
  objc_storeStrong((id *)&self->_scrubProgress, 0);
  objc_storeStrong((id *)&self->_continuousDisplayedPage, 0);
  objc_storeStrong((id *)&self->_interactor, 0);
  objc_storeStrong((id *)&self->_indicatorStore, 0);
  objc_storeStrong((id *)&self->_indicatorFeed, 0);
  objc_storeStrong((id *)&self->_successiveTapAction, 0);
  objc_storeStrong((id *)&self->_scrubbingGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_indicatorContentView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

- (void)pruneArchivedSubviews:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIInteractivePageControlVisualProvider contentView](self, "contentView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", v5);

}

- (BOOL)shouldDisableTouchTracking
{
  return 1;
}

- (double)_contentTransformForActiveState:(int)a3
{
  int hasContent;
  double v6;
  __int128 v7;
  uint64_t v8;
  __int128 v9;

  if (a2)
  {
    hasContent = -[_UIInteractivePageControlVisualProvider _hasContentScaling](a2);
    if (a3)
    {
      v6 = 1.05;
      if (!hasContent)
        v6 = 1.0;
      CGAffineTransformMakeScale((CGAffineTransform *)a1, v6, v6);
    }
    else
    {
      v8 = MEMORY[0x1E0C9BAA8];
      v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)a1 = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)(a1 + 16) = v9;
      v7 = *(_OWORD *)(v8 + 32);
      *(_OWORD *)(a1 + 32) = v7;
    }
  }
  else
  {
    *(_QWORD *)&v7 = 0;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)a1 = 0u;
  }
  return *(double *)&v7;
}

- (void)setPreciseTouchedPage:(double)a3
{
  double preciseTouchedPage;
  _BOOL4 IsIdentity;
  double v7;
  double v8;
  NSInteger v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  __int128 v21;
  double v22;
  void *v23;
  _BOOL4 v24;
  double v25;
  double v26;
  _BOOL8 v27;
  id v28;
  int v29;
  char state;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  id v35;
  CGAffineTransform t2;
  _QWORD aBlock[5];
  CGAffineTransform v38;
  CGAffineTransform transform;
  CGAffineTransformComponents v40;
  CGAffineTransform v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  CGAffineTransform v46;
  CGAffineTransform v47;
  CGAffineTransform v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  preciseTouchedPage = self->_preciseTouchedPage;
  if (preciseTouchedPage != a3)
  {
    self->_preciseTouchedPage = a3;
    memset(&v48, 0, sizeof(v48));
    -[_UIPageControlVisualProvider activeTransformForTouchedPage](self, "activeTransformForTouchedPage");
    v47 = v48;
    if (!CGAffineTransformIsIdentity(&v47))
    {
      memset(&v47, 0, sizeof(v47));
      -[_UIPageControlVisualProvider targetTransformForTouchedPage](self, "targetTransformForTouchedPage");
      v46 = v47;
      IsIdentity = CGAffineTransformIsIdentity(&v46);
      v7 = floor(a3);
      if (a3 >= 0.0)
        v8 = (double)(uint64_t)a3;
      else
        v8 = v7;
      v9 = -[UIPageControl numberOfPages](self->super._pageControl, "numberOfPages");
      if (fmax(fmin((double)(uint64_t)v8, (double)(-[UIPageControl numberOfPages](self->super._pageControl, "numberOfPages") - 1)), 0.0) == (double)(uint64_t)v8)
      {
        v10 = floor(preciseTouchedPage);
        if (preciseTouchedPage >= 0.0)
          v10 = (double)(uint64_t)preciseTouchedPage;
        if (preciseTouchedPage != -1.79769313e308
          && fmax(fmin((double)(uint64_t)v10, (double)(v9 - 1)), 0.0) != (double)(uint64_t)v10)
        {
          -[_UIInteractivePageControlVisualProvider selectionFeedbackGenerator](self, "selectionFeedbackGenerator");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView center](self->super._pageControl, "center");
          objc_msgSend(v11, "selectionChangedAtLocation:");

        }
      }
      state = (char)self->_state;
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      -[_UIInteractivePageControlVisualProvider indicatorFeed](self, "indicatorFeed");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "indicators");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v43;
        v17 = (state & 4) == 0 || IsIdentity;
        v29 = v17;
        v32 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        v33 = *MEMORY[0x1E0C9BAA8];
        v31 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        v18 = MEMORY[0x1E0C809B0];
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v43 != v16)
              objc_enumerationMutation(v13);
            v20 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
            *(_OWORD *)&v46.a = v33;
            *(_OWORD *)&v46.c = v32;
            *(_OWORD *)&v46.tx = v31;
            *(_OWORD *)&v41.a = v33;
            *(_OWORD *)&v41.c = v32;
            *(_OWORD *)&v41.tx = v31;
            if (a3 == -1.79769313e308)
            {
              *(_OWORD *)&v46.a = v33;
              *(_OWORD *)&v46.c = v32;
              *(_OWORD *)&v46.tx = v31;
              goto LABEL_33;
            }
            if (objc_msgSend(v20, "page") == (uint64_t)v8)
            {
              if ((state & 4) != 0)
              {
                v46 = v48;
              }
              else
              {
                v40 = (CGAffineTransformComponents)v48;
                _UITransformLerp(MEMORY[0x1E0C9BAA8], &v40, (uint64_t)&v46, 0.333333333);
              }
              *(_OWORD *)&v41.a = *(_OWORD *)&v46.a;
              *(_OWORD *)&v41.c = *(_OWORD *)&v46.c;
              v21 = *(_OWORD *)&v46.tx;
            }
            else
            {
              if (v29)
              {
                *(_OWORD *)&v46.a = v33;
                *(_OWORD *)&v46.c = v32;
                *(_OWORD *)&v46.tx = v31;
                goto LABEL_33;
              }
              v22 = fmax(fmin(vabdd_f64(a3, (double)objc_msgSend(v20, "page")) * -0.25 + 1.0, 1.0), 0.0);
              transform = v47;
              _UITransformLerp(MEMORY[0x1E0C9BAA8], &transform, (uint64_t)&v40, v22);
              v46 = (CGAffineTransform)v40;
              if (fabs(v22) >= 2.22044605e-16)
              {
                *(_OWORD *)&v41.a = *(_OWORD *)&v47.a;
                *(_OWORD *)&v41.c = *(_OWORD *)&v47.c;
                v21 = *(_OWORD *)&v47.tx;
              }
              else
              {
                *(_OWORD *)&v41.a = v33;
                *(_OWORD *)&v41.c = v32;
                v21 = v31;
              }
            }
            *(_OWORD *)&v41.tx = v21;
LABEL_33:
            transform = v41;
            memset(&v40, 0, sizeof(v40));
            CGAffineTransformDecompose(&v40, &transform);
            objc_msgSend(v20, "setImageDisplayScaleFactor:", fmax(v40.scale.width, v40.scale.height));
            aBlock[0] = v18;
            aBlock[1] = 3221225472;
            aBlock[2] = __65___UIInteractivePageControlVisualProvider_setPreciseTouchedPage___block_invoke;
            aBlock[3] = &unk_1E16BF720;
            aBlock[4] = v20;
            v38 = v46;
            v23 = _Block_copy(aBlock);
            transform = v46;
            t2 = v48;
            v24 = CGAffineTransformEqualToTransform(&transform, &t2);
            if (v24)
              v25 = 0.49991;
            else
              v25 = 1.0;
            v34[0] = v18;
            if (v24)
              v26 = 0.4;
            else
              v26 = 0.25;
            v27 = !v24;
            v34[1] = 3221225472;
            v34[2] = __65___UIInteractivePageControlVisualProvider_setPreciseTouchedPage___block_invoke_2;
            v34[3] = &unk_1E16B1BF8;
            v35 = v23;
            v28 = v23;
            +[UIView _animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:](UIView, "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:", v27, v34, 0, v25, v26, 0.08, 1.0, 0.0, 0.0);

          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
        }
        while (v15);
      }

    }
  }
}

- (void)setPage:(int64_t)a3 interactionState:(int64_t)a4
{
  _QWORD v7[7];

  -[_UIPageControlVisualProvider setInteractionState:](self, "setInteractionState:", a4);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68___UIInteractivePageControlVisualProvider_setPage_interactionState___block_invoke;
  v7[3] = &unk_1E16B4E70;
  v7[4] = self;
  v7[5] = a3;
  v7[6] = a4;
  -[_UIInteractivePageControlVisualProvider _updateCurrentPage:completion:]((id *)&self->super.super.isa, a3, v7);
}

- (void)_updateCurrentPage:(void *)a3 completion:
{
  id v5;
  id v6;

  if (a1)
  {
    v5 = a1[1];
    v6 = a3;
    objc_msgSend(v5, "_updateCurrentPage:updateDisplayImmediately:", a2, 0);
    objc_msgSend(a1[1], "_emitValueChanged");
    -[_UIInteractivePageControlVisualProvider _setDisplayedPage:completion:](a1, a2, v6);

  }
}

- (void)didUpdateBackgroundStyle
{
  -[_UIInteractivePageControlVisualProvider _updateCurrentPlatterMode]((uint64_t)self);
  -[UIView invalidateIntrinsicContentSize](self->super._pageControl, "invalidateIntrinsicContentSize");
  -[UIView setNeedsLayout](self->super._pageControl, "setNeedsLayout");
}

- (uint64_t)_updateCurrentPlatterMode
{
  void *v1;
  uint64_t v2;

  if (result)
  {
    v1 = (void *)result;
    result = objc_msgSend(*(id *)(result + 8), "backgroundStyle");
    if (result == 2)
    {
      v2 = 0;
    }
    else if (result == 1)
    {
      v2 = 1;
    }
    else
    {
      if (result)
        return result;
      v2 = objc_msgSend(v1, "isScrubbing");
    }
    return objc_msgSend(v1, "setPlatterExpanded:", v2);
  }
  return result;
}

- (void)didUpdateBackgroundEffect
{
  char custom;
  UIView *v4;
  char isKindOfClass;
  void *v6;
  UIView *v7;

  custom = (char)self->super._pageControl->_custom;
  v4 = self->_backgroundView;
  if ((custom & 8) == 0)
  {
    v7 = v4;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v4 = v7;
    if ((isKindOfClass & 1) != 0)
    {
      -[_UIInteractivePageControlVisualProvider _resolvedVisualEffect]((id *)&self->super.super.isa);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setEffect:](v7, "setEffect:", v6);

      v4 = v7;
    }
  }

}

- (void)setPageIndicatorVibrantColorMatrix:(CAColorMatrix *)a3
{
  __int128 v4;
  __int128 v5;
  _OWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIInteractivePageControlVisualProvider;
  v4 = *(_OWORD *)&a3->m33;
  v6[2] = *(_OWORD *)&a3->m24;
  v6[3] = v4;
  v6[4] = *(_OWORD *)&a3->m42;
  v5 = *(_OWORD *)&a3->m15;
  v6[0] = *(_OWORD *)&a3->m11;
  v6[1] = v5;
  -[_UIPageControlVisualProvider setPageIndicatorVibrantColorMatrix:](&v7, sel_setPageIndicatorVibrantColorMatrix_, v6);
  -[_UIInteractivePageControlVisualProvider _updateIndicatorTintColor]((id *)&self->super.super.isa);
}

- (void)setActivePageIndicatorVibrantColorMatrix:(CAColorMatrix *)a3
{
  __int128 v4;
  __int128 v5;
  _OWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIInteractivePageControlVisualProvider;
  v4 = *(_OWORD *)&a3->m33;
  v6[2] = *(_OWORD *)&a3->m24;
  v6[3] = v4;
  v6[4] = *(_OWORD *)&a3->m42;
  v5 = *(_OWORD *)&a3->m15;
  v6[0] = *(_OWORD *)&a3->m11;
  v6[1] = v5;
  -[_UIPageControlVisualProvider setActivePageIndicatorVibrantColorMatrix:](&v7, sel_setActivePageIndicatorVibrantColorMatrix_, v6);
  -[_UIInteractivePageControlVisualProvider _updateIndicatorTintColor]((id *)&self->super.super.isa);
}

- (double)indicatorOpacity
{
  double result;

  -[UIView alpha](self->_indicatorContentView, "alpha");
  return result;
}

- (void)setBackgroundView:(id)a3
{
  UIView *v4;
  UIView *backgroundView;
  UIView *v6;

  v4 = (UIView *)a3;
  -[UIView removeFromSuperview](self->_backgroundView, "removeFromSuperview");
  backgroundView = self->_backgroundView;
  self->_backgroundView = v4;
  v6 = v4;

  -[_UIInteractivePageControlVisualProvider _installBackgroundViewIfNeeded]((id *)&self->super.super.isa);
  -[UIView setNeedsLayout](self->super._pageControl, "setNeedsLayout");

}

- (void)invalidateIndicators
{
  void *v3;

  -[UIView invalidateIntrinsicContentSize](self->super._pageControl, "invalidateIntrinsicContentSize");
  -[_UIInteractivePageControlVisualProvider indicatorFeed](self, "indicatorFeed");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateIndicators");

  -[_UIInteractivePageControlVisualProvider _updateReuseQueue]((uint64_t)self);
  -[UIView setNeedsLayout](self->super._pageControl, "setNeedsLayout");
}

- (BOOL)_isPageWithinPermittedDisplayedRange:(_BOOL8)result
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (result)
  {
    v3 = result;
    v4 = *(_QWORD *)(result + 312);
    v5 = a2 - v4;
    v6 = *(_QWORD *)(result + 320);
    v7 = objc_msgSend(*(id *)(result + 8), "numberOfPages");
    result = 0;
    v8 = *(_QWORD *)(v3 + 320);
    v10 = v8 - 2;
    v9 = v8 < 2;
    v11 = v8 - 1;
    if (!v9)
      v11 = v10;
    if ((v5 & 0x8000000000000000) == 0 && v5 < v6)
    {
      v12 = (uint64_t)fmax(fmin((double)(v11 >> 1), 2.0), 0.0);
      if (v4 && v5 < v12)
        return 0;
      if (objc_msgSend(*(id *)(v3 + 8), "numberOfPages") - v12 <= a2)
      {
        v13 = *(_QWORD *)(v3 + 312);
        if (v13 == v7 - v6 || v5 + v12 < v6)
          return v13 + v6 <= objc_msgSend(*(id *)(v3 + 8), "numberOfPages");
      }
      else if (v5 + v12 < v6)
      {
        v13 = *(_QWORD *)(v3 + 312);
        return v13 + v6 <= objc_msgSend(*(id *)(v3 + 8), "numberOfPages");
      }
      return 0;
    }
  }
  return result;
}

- (id)customIndicatorImageForPage:(int64_t)a3
{
  void *v4;
  void *v5;

  -[_UIInteractivePageControlVisualProvider indicatorStore](self, "indicatorStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "customIndicatorImageForPage:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setPreferredIndicatorImage:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_UIInteractivePageControlVisualProvider indicatorStore](self, "indicatorStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v8);

  if ((v6 & 1) == 0)
  {
    -[_UIInteractivePageControlVisualProvider indicatorStore](self, "indicatorStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPreferredImage:", v8);

    -[_UIInteractivePageControlVisualProvider invalidateIndicators](self, "invalidateIndicators");
  }

}

- (id)preferredIndicatorImage
{
  void *v2;
  void *v3;

  -[_UIInteractivePageControlVisualProvider indicatorStore](self, "indicatorStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)customActiveIndicatorImageForPage:(int64_t)a3
{
  void *v4;
  void *v5;

  -[_UIInteractivePageControlVisualProvider indicatorStore](self, "indicatorStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "customActiveIndicatorImageForPage:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setCustomActiveIndicatorImage:(id)a3 forPage:(int64_t)a4
{
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  unint64_t v13;
  id v14;

  v14 = a3;
  -[_UIInteractivePageControlVisualProvider indicatorStore](self, "indicatorStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "customActiveIndicatorImageForPage:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", v14);

  if ((v8 & 1) == 0)
  {
    -[_UIInteractivePageControlVisualProvider indicatorStore](self, "indicatorStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateActiveImage:forPage:", v14, a4);

    -[_UIInteractivePageControlVisualProvider indicatorFeed](self, "indicatorFeed");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reloadIndicatorImageForPage:", a4);

    -[_UIInteractivePageControlVisualProvider continuousDisplayedPage](self, "continuousDisplayedPage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "value");
    v13 = llround(v12);

    -[_UIInteractivePageControlVisualProvider _transitionIndicatorForPage:toEnabled:](self, a4, v13 == a4);
    -[UIView invalidateIntrinsicContentSize](self->super._pageControl, "invalidateIntrinsicContentSize");
    -[UIView setNeedsLayout](self->super._pageControl, "setNeedsLayout");
  }

}

- (void)setPreferredActiveIndicatorImage:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_UIInteractivePageControlVisualProvider indicatorStore](self, "indicatorStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredActiveImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v8);

  if ((v6 & 1) == 0)
  {
    -[_UIInteractivePageControlVisualProvider indicatorStore](self, "indicatorStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPreferredActiveImage:", v8);

    -[_UIInteractivePageControlVisualProvider invalidateIndicators](self, "invalidateIndicators");
  }

}

- (id)preferredActiveIndicatorImage
{
  void *v2;
  void *v3;

  -[_UIInteractivePageControlVisualProvider indicatorStore](self, "indicatorStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredActiveImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)_preciseIndicatorPageForPoint:(double)a3
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  unint64_t v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  unint64_t v20;
  double v21;
  double v22;
  double v23;
  unint64_t v24;
  double v25;
  double v26;
  double v27;
  unint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  unint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  unint64_t v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  unint64_t v51;
  double v52;
  double v53;
  double v54;
  unint64_t v55;
  double v56;
  double v57;
  double v58;
  unint64_t v59;
  double v60;
  double v61;
  double v62;
  uint64_t v63;
  double v64;
  double v65;
  double v66;
  unint64_t v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v73;
  double v74;
  double v75;
  double v76;

  if (!a1)
    return 0.0;
  objc_msgSend((id)a1, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "indicatorContentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertPoint:toView:", v7, a2, a3);
  v74 = v9;
  v76 = v8;

  v10 = objc_msgSend((id)a1, "resolvedDirection") & 0xFFFFFFFFFFFFFFFDLL;
  v11 = -[_UIInteractivePageControlVisualProvider _indicatorSpacing](a1) * 0.5;
  objc_msgSend(*(id *)(a1 + 8), "_currentScreenScale");
  v13 = v12;
  v14 = *(_QWORD *)(a1 + 320) + *(_QWORD *)(a1 + 312);
  v15 = objc_msgSend(*(id *)(a1 + 8), "numberOfPages");
  if (v14 >= v15)
    v16 = v15;
  else
    v16 = v14;
  v17 = *(_QWORD *)(a1 + 312);
  if (v17 >= v16)
  {
LABEL_23:
    v43 = objc_msgSend((id)a1, "resolvedDirection", *(_QWORD *)&v74);
    objc_msgSend((id)a1, "indicatorStore");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "defaultIndicatorSize");
    if (v43 >= 2)
      v45 = v46;
    v47 = v11 + v11 + v45;

    -[_UIInteractivePageControlVisualProvider _visibleLeftIndicator]((id)a1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIInteractivePageControlVisualProvider _visibleRightIndicator]((id)a1);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v76;
    if ((unint64_t)objc_msgSend((id)a1, "resolvedDirection") >= 2)
      v50 = v75;
    else
      v50 = v76;
    v51 = objc_msgSend((id)a1, "resolvedDirection");
    objc_msgSend(v19, "center");
    if (v51 >= 2)
      v54 = v53;
    else
      v54 = v52;
    if ((unint64_t)objc_msgSend((id)a1, "resolvedDirection") >= 2)
      v49 = v75;
    v55 = objc_msgSend((id)a1, "resolvedDirection");
    if (v50 >= v54)
    {
      objc_msgSend(v48, "center");
      if (v55 >= 2)
        v66 = v65;
      else
        v66 = v64;
      v67 = objc_msgSend((id)a1, "resolvedDirection");
      v68 = -[_UIInteractivePageControlVisualProvider _layoutSizeForIndicator:]((id *)a1, v19);
      if (v67 >= 2)
        v68 = v69;
      v62 = v11 + v66 + v68 * 0.5;
      v63 = objc_msgSend(v48, "page") + 1;
    }
    else
    {
      objc_msgSend(v19, "center");
      if (v55 >= 2)
        v58 = v57;
      else
        v58 = v56;
      v59 = objc_msgSend((id)a1, "resolvedDirection");
      v60 = -[_UIInteractivePageControlVisualProvider _layoutSizeForIndicator:]((id *)a1, v19);
      if (v59 >= 2)
        v60 = v61;
      v62 = v58 + v60 * -0.5 - v11;
      v63 = objc_msgSend(v19, "page");
    }
    v70 = (v49 - v62) / v47;
    if (v10 == 1)
      v70 = -v70;
    v71 = v70 + (double)v63;

  }
  else
  {
    while (1)
    {
      objc_msgSend((id)a1, "indicatorFeed", *(_QWORD *)&v74);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "indicatorForPage:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = objc_msgSend((id)a1, "resolvedDirection");
      objc_msgSend(v19, "center");
      if (v20 >= 2)
        v23 = v22;
      else
        v23 = v21;
      v24 = objc_msgSend((id)a1, "resolvedDirection");
      v25 = -[_UIInteractivePageControlVisualProvider _layoutSizeForIndicator:]((id *)a1, v19);
      if (v24 >= 2)
        v25 = v26;
      v27 = v23 + v25 * -0.5 - v11;
      v28 = objc_msgSend((id)a1, "resolvedDirection");
      objc_msgSend(v19, "center");
      v30 = v29;
      v32 = v31;
      v33 = objc_msgSend((id)a1, "resolvedDirection");
      v34 = -[_UIInteractivePageControlVisualProvider _layoutSizeForIndicator:]((id *)a1, v19);
      v36 = v35;
      v37 = (unint64_t)objc_msgSend((id)a1, "resolvedDirection") >= 2 ? v74 : v76;
      UIFloorToScale(v27, v13);
      if (v37 >= v38)
      {
        v39 = v28 >= 2 ? v32 : v30;
        v40 = v33 >= 2 ? v36 : v34;
        v41 = v11 + v39 + v40 * 0.5;
        UICeilToScale(v41, v13);
        if (v37 <= v42)
          break;
      }

      if (v16 == ++v17)
        goto LABEL_23;
    }
    v73 = (v37 - v41) / (v27 - v41);
    if (v10 != 1)
      v73 = (v37 - v27) / (v41 - v27);
    v71 = v73 + (double)v17;
  }

  return v71;
}

- (void)controlEventsGestureRecognizer:(id)a3 recognizedControlEvent:(unint64_t)a4 withEvent:(id)a5
{
  -[UIControl _sendActionsForEvents:withEvent:](self->super._pageControl, "_sendActionsForEvents:withEvent:", a4, a5);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "_isGestureType:", 1))
  {
    -[_UIInteractivePageControlVisualProvider contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIInteractivePageControlVisualProvider contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationInView:", v6);
    LOBYTE(self) = objc_msgSend(v5, "pointInside:withEvent:", 0);

  }
  else if (objc_msgSend(v4, "_isGestureType:", 0))
  {
    LODWORD(self) = !-[_UIInteractivePageControlVisualProvider isScrubbing](self, "isScrubbing");
  }
  else
  {
    LOBYTE(self) = 1;
  }

  return (char)self;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5;
  id v6;
  char v7;
  char v8;

  v5 = a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "isMemberOfClass:", objc_opt_class());

  if ((v7 & 1) != 0)
    v8 = 1;
  else
    v8 = objc_msgSend(v5, "isMemberOfClass:", objc_opt_class());

  return v8;
}

- (void)didTapPageControl:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  int v19;
  _BOOL4 v20;
  uint64_t v21;
  int64_t indicatorStartIndex;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  int64_t v36;
  unint64_t v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  _BOOL4 v61;
  double v62;
  unint64_t v63;
  unint64_t v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  unint64_t v70;
  unint64_t v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  void *v76;
  CGFloat v77;
  CGFloat v78;
  BOOL v79;
  void *v80;
  double v81;
  double v82;
  double v83;
  double v84;
  unint64_t v85;
  int v86;
  BOOL v87;
  int v88;
  void *v89;
  void *v90;
  UIDelayedAction *v91;
  double v92;
  id v93;
  CGPoint v94;
  CGPoint v95;
  CGRect v96;
  CGRect v97;

  v93 = a3;
  -[_UIInteractivePageControlVisualProvider contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "locationInView:", v4);
  v6 = v5;
  v8 = v7;

  if (!self)
    goto LABEL_10;
  v9 = v93;
  objc_msgSend(v9, "touches");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "_isPointerTouch");

  -[_UIInteractivePageControlVisualProvider contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIInteractivePageControlVisualProvider contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "locationInView:", v14);
  v16 = v15;
  v18 = v17;

  v19 = objc_msgSend(v13, "pointInside:withEvent:", 0, v16, v18);
  v20 = -[UIPageControl _prefersTargetPageForDiscreteInteraction](self->super._pageControl, "_prefersTargetPageForDiscreteInteraction")&& -[_UIInteractivePageControlVisualProvider _indicatorSpacing]((uint64_t)self) > 20.0;
  if (((v12 | v20) & v19) != 1)
  {
LABEL_10:
    if (-[UIPageControl numberOfPages](self->super._pageControl, "numberOfPages") == 2)
    {
      v21 = -[UIPageControl currentPage](self->super._pageControl, "currentPage") == 0;
LABEL_56:
      if (v21 != -[UIPageControl currentPage](self->super._pageControl, "currentPage"))
        -[_UIInteractivePageControlVisualProvider setPage:interactionState:](self, "setPage:interactionState:", v21, 1);
      goto LABEL_58;
    }
    v35 = -[_UIInteractivePageControlVisualProvider _indicatorSpacing]((uint64_t)self);
    v36 = -[_UIInteractivePageControlVisualProvider previousMoveDirection](self, "previousMoveDirection");
    v37 = -[_UIInteractivePageControlVisualProvider resolvedDirection](self, "resolvedDirection");
    -[_UIInteractivePageControlVisualProvider previousTouchLocation](self, "previousTouchLocation");
    v39 = v8 - v38;
    v41 = v6 - v40;
    if (v37 >= 2)
      v41 = v39;
    if (v36)
    {
      v41 = fabs(v41);
      if (v41 <= v35)
      {
LABEL_48:
        v21 = -[UIPageControl currentPage](self->super._pageControl, "currentPage");
        if (v36 != 1)
        {
          if (v36 != 2)
          {
LABEL_52:
            -[_UIInteractivePageControlVisualProvider successiveTapAction](self, "successiveTapAction");
            v89 = (void *)objc_claimAutoreleasedReturnValue();

            if (v89)
            {
              -[_UIInteractivePageControlVisualProvider successiveTapAction](self, "successiveTapAction");
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v90, "cancel");

              -[_UIInteractivePageControlVisualProvider setSuccessiveTapAction:](self, "setSuccessiveTapAction:", 0);
            }
            v91 = -[UIDelayedAction initWithTarget:action:userInfo:delay:]([UIDelayedAction alloc], "initWithTarget:action:userInfo:delay:", self, sel_resetSuccessiveTapInfo, 0, 0.75);
            -[_UIInteractivePageControlVisualProvider setSuccessiveTapAction:](self, "setSuccessiveTapAction:", v91);

            -[_UIInteractivePageControlVisualProvider setPreviousTouchLocation:](self, "setPreviousTouchLocation:", v6, v8);
LABEL_55:
            if (v21 == -1)
              goto LABEL_58;
            goto LABEL_56;
          }
          v36 = -1;
        }
        v21 = (uint64_t)fmax(fmin((double)(v36 + v21), (double)(-[UIPageControl numberOfPages](self->super._pageControl, "numberOfPages") - 1)), 0.0);
        goto LABEL_52;
      }
    }
    -[_UIInteractivePageControlVisualProvider indicatorFeed](self, "indicatorFeed", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "activeIndicatorForPage:", -[UIPageControl currentPage](self->super._pageControl, "currentPage"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v43)
    {
      objc_msgSend(v43, "bounds");
      v45 = v44;
      v47 = v46;
      v49 = v48;
      v51 = v50;
      -[_UIInteractivePageControlVisualProvider contentView](self, "contentView");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "convertRect:toView:", v52, v45, v47, v49, v51);
      v54 = v53;
      v56 = v55;
      v58 = v57;
      v60 = v59;

      v96.origin.x = v54;
      v96.origin.y = v56;
      v96.size.width = v58;
      v96.size.height = v60;
      v94.x = v6;
      v94.y = v8;
      if (CGRectContainsPoint(v96, v94))
      {
LABEL_47:
        -[_UIInteractivePageControlVisualProvider setPreviousMoveDirection:](self, "setPreviousMoveDirection:", v36);

        goto LABEL_48;
      }
    }
    else
    {
      -[_UIInteractivePageControlVisualProvider contentView](self, "contentView");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "bounds");
      v54 = v81;
      v56 = v82;
      v58 = v83;
      v60 = v84;

    }
    v85 = -[_UIInteractivePageControlVisualProvider resolvedDirection](self, "resolvedDirection");
    v86 = (-[_UIInteractivePageControlVisualProvider resolvedDirection](self, "resolvedDirection") & 0xFFFFFFFFFFFFFFFDLL) == 1;
    if (v85 > 1)
      v87 = v8 > v60 * 0.5 + v56;
    else
      v87 = v6 > v58 * 0.5 + v54;
    v88 = v87;
    if (v88 != v86)
      v36 = 1;
    else
      v36 = 2;
    goto LABEL_47;
  }
  v21 = (uint64_t)-[_UIInteractivePageControlVisualProvider _preciseIndicatorPageForPoint:]((uint64_t)self, v6, v8);
  indicatorStartIndex = self->_indicatorStartIndex;
  if (indicatorStartIndex <= v21 && self->_numberOfVisibleIndicators + indicatorStartIndex > v21)
  {
    -[_UIInteractivePageControlVisualProvider indicatorFeed](self, "indicatorFeed");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "indicatorForPage:", v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "bounds");
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;
    objc_msgSend(v9, "touches");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "firstObject");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v34, "_isPointerTouch") & 1) != 0)
    {

    }
    else
    {
      v61 = -[UIPageControl _prefersTargetPageForDiscreteInteraction](self->super._pageControl, "_prefersTargetPageForDiscreteInteraction");

      if (v61)
      {
        v62 = *(double *)(MEMORY[0x1E0C9D820] + 8);
        v92 = *MEMORY[0x1E0C9D820];
        v63 = -[_UIInteractivePageControlVisualProvider resolvedDirection](self, "resolvedDirection");
        v64 = -[_UIInteractivePageControlVisualProvider resolvedDirection](self, "resolvedDirection");
        objc_msgSend(v24, "bounds");
        if (v64 >= 2)
          v67 = v66;
        else
          v67 = v65;
        v68 = -[_UIInteractivePageControlVisualProvider _indicatorSpacing]((uint64_t)self) + v67;
        if (v63 >= 2)
          v69 = v92;
        else
          v69 = v68;
        if (v63 >= 2)
          v62 = v68;
        v70 = -[_UIInteractivePageControlVisualProvider resolvedDirection](self, "resolvedDirection");
        v71 = -[_UIInteractivePageControlVisualProvider resolvedDirection](self, "resolvedDirection");
        -[_UIInteractivePageControlVisualProvider contentView](self, "contentView");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "bounds");
        if (v71 >= 2)
          v75 = v73;
        else
          v75 = v74;
        if (v70 < 2)
          v62 = v75;
        else
          v69 = v75;

        v26 = v26 + (v30 - v69) * 0.5;
        v28 = v28 + (v32 - v62) * 0.5;
        v32 = v62;
        v30 = v69;
      }
    }
    -[_UIInteractivePageControlVisualProvider contentView](self, "contentView");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "convertPoint:toView:", v24, v6, v8);
    v95.x = v77;
    v95.y = v78;
    v97.origin.x = v26;
    v97.origin.y = v28;
    v97.size.width = v30;
    v97.size.height = v32;
    v79 = CGRectContainsPoint(v97, v95);

    if (v79)
      goto LABEL_55;
  }
LABEL_58:

}

- (void)didScrubPageControl:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  NSInteger v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  int64_t v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  id v69;

  v69 = a3;
  objc_msgSend(v69, "locationInView:", self->super._pageControl);
  v5 = v4;
  v7 = v6;
  v8 = objc_msgSend(v69, "state");
  if (v8 == 4)
  {
    -[_UIInteractivePageControlVisualProvider selectionFeedbackGenerator](self, "selectionFeedbackGenerator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "userInteractionCancelledAtLocation:", v5, v7);
LABEL_7:

    -[_UIInteractivePageControlVisualProvider joggingFeedbackGenerator](self, "joggingFeedbackGenerator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deactivate");
    goto LABEL_8;
  }
  if (v8 == 3)
  {
    -[_UIInteractivePageControlVisualProvider selectionFeedbackGenerator](self, "selectionFeedbackGenerator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "userInteractionEndedAtLocation:", v5, v7);
    goto LABEL_7;
  }
  if (v8 != 1)
    goto LABEL_9;
  -[_UIInteractivePageControlVisualProvider selectionFeedbackGenerator](self, "selectionFeedbackGenerator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "userInteractionStartedAtLocation:", v5, v7);

  -[_UIInteractivePageControlVisualProvider joggingFeedbackGenerator](self, "joggingFeedbackGenerator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activateWithCompletionBlock:", 0);
LABEL_8:

LABEL_9:
  v12 = objc_msgSend(v69, "state");
  if ((unint64_t)(v12 - 3) < 2)
  {
    -[_UIInteractivePageControlVisualProvider contentView](self, "contentView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "velocityInView:", v46);
    v48 = v47;
    v50 = v49;

    if (-[UIPageControl _flickToEndGestureEnabled](self->super._pageControl, "_flickToEndGestureEnabled"))
    {
      v51 = (unint64_t)-[_UIInteractivePageControlVisualProvider resolvedDirection](self, "resolvedDirection") >= 2
          ? v50
          : v48;
      if (fabs(v51) > 800.0)
      {
        if ((unint64_t)-[_UIInteractivePageControlVisualProvider resolvedDirection](self, "resolvedDirection") >= 2)
          v52 = v50;
        else
          v52 = v48;
        if (v52 > 0.0 == ((-[_UIInteractivePageControlVisualProvider resolvedDirection](self, "resolvedDirection") & 0xFFFFFFFFFFFFFFFDLL) == 1))
          v53 = 0;
        else
          v53 = -[UIPageControl numberOfPages](self->super._pageControl, "numberOfPages") - 1;
        self->_targetPage = v53;
        -[_UIInteractivePageControlVisualProvider _updateCurrentPage:completion:]((id *)&self->super.super.isa, v53, 0);
      }
    }
    -[_UIInteractivePageControlVisualProvider interactor](self, "interactor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "commitTranslation");

    -[_UIInteractivePageControlVisualProvider setScrubbing:](self, "setScrubbing:", 0);
  }
  else if (v12 == 2)
  {
    -[_UIInteractivePageControlVisualProvider contentView](self, "contentView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "_translationInView:", v54);
    v56 = v55;
    v58 = v57;

    -[_UIInteractivePageControlVisualProvider contentView](self, "contentView");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "velocityInView:", v59);
    v61 = v60;
    v63 = v62;

    -[_UIInteractivePageControlVisualProvider interactor](self, "interactor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)-[_UIInteractivePageControlVisualProvider resolvedDirection](self, "resolvedDirection") >= 2)
      v65 = v58;
    else
      v65 = v56;
    if ((unint64_t)-[_UIInteractivePageControlVisualProvider resolvedDirection](self, "resolvedDirection") >= 2)
      v66 = v63;
    else
      v66 = v61;
    objc_msgSend(v64, "setTranslation:velocity:", v65, v66);

    if ((unint64_t)-[_UIInteractivePageControlVisualProvider resolvedDirection](self, "resolvedDirection") >= 2)
      v67 = v58;
    else
      v67 = v56;
    self->_panDistance = v67;
    -[UIView setNeedsLayout](self->super._pageControl, "setNeedsLayout");
  }
  else if (v12 == 1)
  {
    -[_UIInteractivePageControlVisualProvider setScrubbing:](self, "setScrubbing:", 1);
    *(_BYTE *)&self->_state &= ~4u;
    -[_UIInteractivePageControlVisualProvider contentView](self, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "startPoint");
    v15 = v14;
    v17 = v16;
    objc_msgSend(v69, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "convertPoint:fromView:", v18, v15, v17);
    v20 = v19;
    v22 = v21;

    v23 = (uint64_t)fmax(fmin(-[_UIInteractivePageControlVisualProvider _preciseIndicatorPageForPoint:]((uint64_t)self, v20, v22), (double)(-[UIPageControl numberOfPages](self->super._pageControl, "numberOfPages") - 1)), 0.0);
    v24 = -[UIPageControl currentPage](self->super._pageControl, "currentPage");
    -[_UIInteractivePageControlVisualProvider indicatorFeed](self, "indicatorFeed");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "indicatorForPage:", v23);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "center");
    v28 = v27;
    v30 = v29;

    -[_UIInteractivePageControlVisualProvider indicatorFeed](self, "indicatorFeed");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "indicatorForPage:", v24);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "center");
    v34 = v33;
    v36 = v35;

    if ((unint64_t)-[_UIInteractivePageControlVisualProvider resolvedDirection](self, "resolvedDirection") >= 2)
      v34 = v36;
    if ((unint64_t)-[_UIInteractivePageControlVisualProvider resolvedDirection](self, "resolvedDirection") >= 2)
      v37 = v30;
    else
      v37 = v28;
    v38 = v34 - v37;
    -[_UIInteractivePageControlVisualProvider interactor](self, "interactor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)-[_UIInteractivePageControlVisualProvider resolvedDirection](self, "resolvedDirection") >= 2)
      v40 = v22;
    else
      v40 = v20;
    objc_msgSend(v39, "setUnconstrainedPosition:offset:", v40, v38);

    -[_UIInteractivePageControlVisualProvider displayLink](self, "displayLink");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v41)
    {
      -[UIView _screen](self->super._pageControl, "_screen");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "displayLinkWithTarget:selector:", self, sel_displayLinkTicked_);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "addToRunLoop:forMode:", v44, *MEMORY[0x1E0C99860]);

      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "addToRunLoop:forMode:", v45, CFSTR("UITrackingRunLoopMode"));

      -[_UIInteractivePageControlVisualProvider setDisplayLink:](self, "setDisplayLink:", v43);
    }
  }

}

- (void)displayLinkTicked:(id)a3
{
  int *v4;
  unint64_t v5;
  void *v6;
  double v7;
  double MidY;
  uint64_t v9;
  double MidX;
  double v14;
  double v15;
  unint64_t v16;
  void *v17;
  double v18;
  double v19;
  uint64_t v20;
  double v24;
  double v25;
  uint64_t v27;
  int64_t v28;
  uint64_t v29;
  int64_t indicatorStartIndex;
  void *v31;
  uint64_t v32;
  int64_t v33;
  NSInteger v34;
  int v35;
  int v36;
  double v37;
  double v38;
  double v39;
  double v40;
  _BOOL4 v41;
  double v42;
  double v43;
  _BOOL4 v44;
  double v45;
  int64_t v46;
  _BOOL4 v47;
  _BOOL4 v48;
  NSInteger v49;
  NSInteger v50;
  NSInteger v51;
  uint64_t v52;
  int64_t numberOfVisibleIndicators;
  NSInteger v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  BOOL v64;
  double v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  uint64_t v72;
  uint64_t v73;
  objc_class *v74;
  NSInteger v75;
  NSInteger v76;
  uint64_t v77;
  BOOL v78;
  double v79;
  double v80;
  void *v81;
  double v83;
  double v84;
  uint64_t v85;
  id v86;

  v4 = &OBJC_IVAR___UITableView__dragSourceDelegate;
  if (-[_UIInteractivePageControlVisualProvider isScrubbing](self, "isScrubbing", a3))
  {
    v5 = -[_UIInteractivePageControlVisualProvider resolvedDirection](self, "resolvedDirection");
    -[_UIInteractivePageControlVisualProvider interactor](self, "interactor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unconstrainedPosition");
    MidY = v7;
    -[UIView bounds](self->super._pageControl, "bounds");
    if (v5 > 1)
    {
      MidX = CGRectGetMidX(*(CGRect *)&v9);
    }
    else
    {
      MidX = MidY;
      MidY = CGRectGetMidY(*(CGRect *)&v9);
    }

    v14 = -[_UIInteractivePageControlVisualProvider _preciseIndicatorPageForPoint:]((uint64_t)self, MidX, MidY);
    -[_UIInteractivePageControlVisualProvider setPreciseTouchedPage:](self, "setPreciseTouchedPage:");
    v15 = fabs(self->_panDistance);
    if (v15 <= 16.0)
    {
      if ((*(_BYTE *)&self->_state & 4) == 0)
        return;
    }
    else
    {
      *(_BYTE *)&self->_state |= 4u;
    }
    v16 = -[_UIInteractivePageControlVisualProvider resolvedDirection](self, "resolvedDirection");
    -[_UIInteractivePageControlVisualProvider interactor](self, "interactor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "boundedScrubPosition");
    v19 = v18;
    -[UIView bounds](self->super._pageControl, "bounds");
    if (v16 > 1)
    {
      v24 = CGRectGetMidX(*(CGRect *)&v20);
    }
    else
    {
      v24 = v19;
      v19 = CGRectGetMidY(*(CGRect *)&v20);
    }

    v25 = -[_UIInteractivePageControlVisualProvider _preciseIndicatorPageForPoint:]((uint64_t)self, v24, v19);
    if (v15 <= 16.0 && self->_tickThreshold != 0)
    {
LABEL_37:
      v46 = self->_currentTick + 1;
      self->_currentTick = v46;
      if (v46 < self->_tickThreshold)
        goto LABEL_72;
      self->_currentTick = 0;
      v47 = -[_UIInteractivePageControlVisualProvider _isPageWithinPermittedDisplayedRange:]((_BOOL8)self, (uint64_t)v14);
      v48 = -[_UIInteractivePageControlVisualProvider _isPageWithinPermittedDisplayedRange:]((_BOOL8)self, (uint64_t)v25);
      v49 = -[UIPageControl currentPage](self->super._pageControl, "currentPage");
      v50 = -[UIPageControl numberOfPages](self->super._pageControl, "numberOfPages");
      v51 = -[UIPageControl numberOfPages](self->super._pageControl, "numberOfPages");
      if (v47 || !v48)
      {
        v52 = (uint64_t)fmax(fmin(v25, (double)(v51 - 1)), 0.0);
        if (!v47 || v48 || v49 == v52)
          goto LABEL_64;
        -[_UIInteractivePageControlVisualProvider indicatorFeed](self, "indicatorFeed");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "indicatorSizeForPage:", v49);
        v58 = v57;
        v60 = v59;

        if ((unint64_t)-[_UIInteractivePageControlVisualProvider resolvedDirection](self, "resolvedDirection") >= 2)
          v61 = v60;
        else
          v61 = v58;
        v62 = v61 * 0.25;
      }
      else
      {
        v52 = (uint64_t)fmax(fmin(v14, (double)(v50 - 1)), 0.0);
        numberOfVisibleIndicators = self->_numberOfVisibleIndicators;
        v54 = -[UIPageControl numberOfPages](self->super._pageControl, "numberOfPages");
        if (v15 > 16.0 && numberOfVisibleIndicators != v54)
        {
          -[_UIInteractivePageControlVisualProvider interactor](self, "interactor");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "reduceScrubOffsetByRatio:", 3.0);
LABEL_63:

LABEL_64:
          if (v52 > v49)
            v72 = 1;
          else
            v72 = 2 * (v52 < v49);
          v73 = v4[261];
          v74 = *(Class *)((char *)&self->super.super.isa + v73);
          if (v72 != 1)
          {
            if (v72 != 2)
            {
LABEL_71:
              *(Class *)((char *)&self->super.super.isa + v73) = v74;
              goto LABEL_72;
            }
            v72 = -1;
          }
          v74 = (objc_class *)(uint64_t)fmax(fmin((double)((uint64_t)v74 + v72), (double)(-[UIPageControl numberOfPages](self->super._pageControl, "numberOfPages")- 1)), 0.0);
          goto LABEL_71;
        }
        v64 = v15 <= 16.0 || numberOfVisibleIndicators != v54;
        if (v49 == v52 && v64)
        {
          v52 = v49;
          goto LABEL_64;
        }
        v65 = -[_UIInteractivePageControlVisualProvider _indicatorSpacing]((uint64_t)self);
        -[_UIInteractivePageControlVisualProvider indicatorFeed](self, "indicatorFeed");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "indicatorSizeForPage:", v49);
        v68 = v67;
        v70 = v69;

        if ((unint64_t)-[_UIInteractivePageControlVisualProvider resolvedDirection](self, "resolvedDirection") >= 2)
          v71 = v70;
        else
          v71 = v68;
        v62 = v65 + v71;
      }
      -[_UIInteractivePageControlVisualProvider interactor](self, "interactor");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "reduceScrubOffsetByOffset:", v62);
      goto LABEL_63;
    }
    v27 = -[UIPageControl numberOfPages](self->super._pageControl, "numberOfPages");
    v28 = self->_numberOfVisibleIndicators;
    v29 = v28 - 2;
    indicatorStartIndex = self->_indicatorStartIndex;
    if (v28 < 2)
      v29 = v28 - 1;
    v85 = v29;
    -[_UIInteractivePageControlVisualProvider displayLink](self, "displayLink");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "actualFramesPerSecond");

    v33 = self->_numberOfVisibleIndicators;
    v34 = -[UIPageControl numberOfPages](self->super._pageControl, "numberOfPages");
    v35 = -[_UIInteractivePageControlVisualProvider _isPageWithinValidJoggingOffset:]((uint64_t)self, v14);
    v36 = -[_UIInteractivePageControlVisualProvider _isPageWithinValidJoggingOffset:]((uint64_t)self, v25);
    if ((double)v28 * 0.5 + (double)indicatorStartIndex >= v14)
    {
      v38 = (double)self->_indicatorStartIndex;
      v37 = v14;
    }
    else
    {
      v37 = (double)(indicatorStartIndex + v28);
      v38 = v14;
    }
    v39 = (double)v32;
    v40 = v38 - v37;
    v4 = &OBJC_IVAR___UITableView__dragSourceDelegate;
    if (v33 == v34)
    {
      v41 = v14 < -1.0 && -[UIPageControl currentPage](self->super._pageControl, "currentPage") > 1;
      v44 = v14 > (double)v27 && -[UIPageControl currentPage](self->super._pageControl, "currentPage") < v27 - 2;
      v45 = 0.0;
      if (!v41 && !v44)
        goto LABEL_36;
      v43 = exp2(fmin(v40, 3.0));
    }
    else
    {
      if ((v35 & v36) != 1)
      {
        v45 = v39 * 0.25;
        if (v35 == v36)
          v45 = 0.0;
        goto LABEL_36;
      }
      v42 = fmax(fmin((double)(v85 >> 1), 2.0), 0.0);
      v43 = pow(1.6, fmin((double)(uint64_t)v42 + 3.5, v40 + (double)(uint64_t)v42));
    }
    v45 = v39 / v43;
LABEL_36:
    self->_tickThreshold = (uint64_t)v45;
    self->_panDistance = 0.0;
    goto LABEL_37;
  }
LABEL_72:
  v75 = -[UIPageControl currentPage](self->super._pageControl, "currentPage");
  v76 = -[UIPageControl numberOfPages](self->super._pageControl, "numberOfPages");
  v77 = (uint64_t)fmax(fmin((double)*(uint64_t *)((char *)&self->super.super.isa + v4[261]), (double)(-[UIPageControl numberOfPages](self->super._pageControl, "numberOfPages") - 1)), 0.0);
  if (v75 != v77)
  {
    -[_UIPageControlVisualProvider setInteractionState:](self, "setInteractionState:", 2);
    -[_UIInteractivePageControlVisualProvider _updateCurrentPage:completion:]((id *)&self->super.super.isa, v77, 0);
    if (v76 != self->_numberOfVisibleIndicators)
    {
      if (v77)
        v78 = v76 - 1 == v77;
      else
        v78 = 1;
      if (v78)
      {
        -[_UIInteractivePageControlVisualProvider joggingFeedbackGenerator](self, "joggingFeedbackGenerator");
        v86 = (id)objc_claimAutoreleasedReturnValue();
        -[UIView center](self->super._pageControl, "center");
        objc_msgSend(v86, "impactOccurredWithIntensity:atLocation:", 1.0, v79, v80);
LABEL_86:

        return;
      }
      if (!-[_UIInteractivePageControlVisualProvider _isPageWithinPermittedDisplayedRange:]((_BOOL8)self, v77))
      {
        -[_UIInteractivePageControlVisualProvider joggingFeedbackGenerator](self, "joggingFeedbackGenerator");
        v86 = (id)objc_claimAutoreleasedReturnValue();
        -[UIView center](self->super._pageControl, "center");
        objc_msgSend(v86, "impactOccurredWithIntensity:atLocation:", 0.45, v83, v84);
        goto LABEL_86;
      }
    }
    -[_UIInteractivePageControlVisualProvider selectionFeedbackGenerator](self, "selectionFeedbackGenerator");
    v86 = (id)objc_claimAutoreleasedReturnValue();
    -[UIView center](self->super._pageControl, "center");
    objc_msgSend(v86, "selectionChangedAtLocation:");
    goto LABEL_86;
  }
  if (!-[_UIInteractivePageControlVisualProvider isScrubbing](self, "isScrubbing"))
  {
    -[_UIInteractivePageControlVisualProvider displayLink](self, "displayLink");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "invalidate");

    -[_UIInteractivePageControlVisualProvider setDisplayLink:](self, "setDisplayLink:", 0);
  }
}

- (BOOL)_isPageWithinValidJoggingOffset:(uint64_t)a1
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;

  v4 = *(_QWORD *)(a1 + 312);
  v5 = *(_QWORD *)(a1 + 320);
  if (-[_UIInteractivePageControlVisualProvider _isPageWithinPermittedDisplayedRange:](a1, (uint64_t)a2))
    return 0;
  if (a2 <= 0.0 && *(_QWORD *)(a1 + 312) == 0)
    return 0;
  v7 = v5 + v4;
  v8 = objc_msgSend(*(id *)(a1 + 8), "numberOfPages");
  return (double)(v7 - 1) > a2 || v7 != v8;
}

- (void)setScrubbing:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD aBlock[5];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  BOOL v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  v3 = a3;
  if (-[_UIInteractivePageControlVisualProvider isScrubbing](self, "isScrubbing") != a3)
  {
    *(_BYTE *)&self->_state = *(_BYTE *)&self->_state & 0xFE | v3;
    self->_targetPage = -[UIPageControl currentPage](self->super._pageControl, "currentPage");
    self->_tickThreshold = 0;
    -[_UIInteractivePageControlVisualProvider _updateCurrentPlatterMode]((uint64_t)self);
    if (v3)
    {
      v5 = 2;
    }
    else
    {
      -[_UIInteractivePageControlVisualProvider setPreciseTouchedPage:](self, "setPreciseTouchedPage:", -1.79769313e308);
      v5 = 0;
    }
    -[_UIPageControlVisualProvider setInteractionState:](self, "setInteractionState:", v5);
    -[UIPageControl progress](self->super._pageControl, "progress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_progressVisibilityChanged:", !v3);

    v16 = 0u;
    v17 = 0u;
    v15 = 0u;
    -[_UIInteractivePageControlVisualProvider _contentTransformForActiveState:]((uint64_t)&v15, (id *)&self->super.super.isa, v3);
    aBlock[0] = MEMORY[0x1E0C809B0];
    v11 = v15;
    aBlock[1] = 3221225472;
    aBlock[2] = __56___UIInteractivePageControlVisualProvider_setScrubbing___block_invoke;
    aBlock[3] = &unk_1E16BF6D8;
    aBlock[4] = self;
    v12 = v16;
    v13 = v17;
    v14 = v3;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __56___UIInteractivePageControlVisualProvider_setScrubbing___block_invoke_2;
    v8[3] = &unk_1E16B1BF8;
    v9 = _Block_copy(aBlock);
    v7 = v9;
    +[UIView _animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:](UIView, "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:", 1, v8, 0, 1.0, 0.25, 0.08, 1.0, 0.0, 0.0);

  }
}

- (uint64_t)_hasContentScaling
{
  uint64_t result;
  CGAffineTransform v3;

  result = objc_msgSend(a1[1], "backgroundStyle");
  if (result)
  {
    objc_msgSend(a1, "activeTransformForTouchedPage");
    return CGAffineTransformIsIdentity(&v3);
  }
  return result;
}

- (void)setPlatterExpanded:(BOOL)a3
{
  _BOOL4 v3;
  char v5;
  void *v6;
  uint64_t v7;
  id v8;
  void (**v9)(_QWORD);
  _QWORD *v10;
  _QWORD v11[5];
  _QWORD v12[4];
  void (**v13)(_QWORD);
  _QWORD aBlock[4];
  id v15;
  BOOL v16;
  _QWORD v17[4];
  id v18;

  v3 = a3;
  if (-[_UIInteractivePageControlVisualProvider isPlatterExpanded](self, "isPlatterExpanded") != a3)
  {
    if (v3)
      v5 = 2;
    else
      v5 = 0;
    *(_BYTE *)&self->_state = *(_BYTE *)&self->_state & 0xFD | v5;
    -[_UIInteractivePageControlVisualProvider backgroundView](self, "backgroundView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __62___UIInteractivePageControlVisualProvider_setPlatterExpanded___block_invoke;
    aBlock[3] = &unk_1E16B1B78;
    v8 = v6;
    v15 = v8;
    v16 = v3;
    v9 = (void (**)(_QWORD))_Block_copy(aBlock);
    if (v3 && !-[UIPageControl _allowsDiscreteInteraction](self->super._pageControl, "_allowsDiscreteInteraction"))
    {
      v9[2](v9);
      -[_UIInteractivePageControlVisualProvider didUpdatePageIndicatorTintColor](self, "didUpdatePageIndicatorTintColor");
    }
    else
    {
      v12[0] = v7;
      v12[1] = 3221225472;
      v12[2] = __62___UIInteractivePageControlVisualProvider_setPlatterExpanded___block_invoke_2;
      v12[3] = &unk_1E16B1BF8;
      v13 = v9;
      +[UIView _animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:](UIView, "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:", 1, v12, 0, 1.0, 0.1, 0.08, 1.0, 0.0, 0.0);
      v11[0] = v7;
      v11[1] = 3221225472;
      v11[2] = __62___UIInteractivePageControlVisualProvider_setPlatterExpanded___block_invoke_3;
      v11[3] = &unk_1E16B1B28;
      v11[4] = self;
      v10 = v11;
      v17[0] = v7;
      v17[1] = 3221225472;
      v17[2] = ___UIPageIndicatorAnimateFadeIn_block_invoke;
      v17[3] = &unk_1E16B1BF8;
      v18 = v10;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 7, v17, 0, 0.015625, 0.0);

    }
  }
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
  objc_storeStrong((id *)&self->_displayLink, a3);
}

- (double)preciseTouchedPage
{
  return self->_preciseTouchedPage;
}

- (UIDelayedAction)successiveTapAction
{
  return self->_successiveTapAction;
}

- (void)setSuccessiveTapAction:(id)a3
{
  objc_storeStrong((id *)&self->_successiveTapAction, a3);
}

- (int64_t)previousMoveDirection
{
  return self->_previousMoveDirection;
}

- (CGPoint)previousTouchLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_previousTouchLocation.x;
  y = self->_previousTouchLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (UISelectionFeedbackGenerator)selectionFeedbackGenerator
{
  return self->_selectionFeedbackGenerator;
}

- (UIImpactFeedbackGenerator)joggingFeedbackGenerator
{
  return self->_joggingFeedbackGenerator;
}

@end
