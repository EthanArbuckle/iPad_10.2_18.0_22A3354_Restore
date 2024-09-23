@implementation MonthDayTransitionView

+ (Class)monthDayNavigationTransitionViewClass
{
  return (Class)objc_opt_class(MonthDayNavigationTransitionView);
}

- (MonthDayTransitionView)initWithFrame:(CGRect)a3
{
  MonthDayTransitionView *v3;
  MonthDayTransitionView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MonthDayTransitionView;
  v3 = -[MonthDayTransitionView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[MonthDayTransitionView _createViews](v3, "_createViews");
  return v4;
}

- (void)_createViews
{
  void *v3;
  double v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL8 v9;
  void *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[MonthDayTransitionView setBackgroundColor:](self, "setBackgroundColor:", v3);

  *(_QWORD *)&v4 = objc_opt_class(self).n128_u64[0];
  v6 = objc_alloc_init((Class)objc_msgSend(v5, "monthDayNavigationTransitionViewClass", v4));
  -[MonthDayTransitionView setScrubber:](self, "setScrubber:", v6);

  v9 = UIAnimationDragCoefficient(v7, v8) > 1.5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView scrubber](self, "scrubber"));
  objc_msgSend(v10, "setDebug:", v9);

  v11 = (id)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView scrubber](self, "scrubber"));
  objc_msgSend(v11, "setHidden:", 1);

}

- (CGRect)weekDayInitialsDay
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_weekDayInitialsDay.origin.x;
  y = self->_weekDayInitialsDay.origin.y;
  width = self->_weekDayInitialsDay.size.width;
  height = self->_weekDayInitialsDay.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setWeekDayInitialsDay:(CGRect)a3
{
  self->_weekDayInitialsDay = a3;
}

- (CGRect)weekDayInitialsMonth
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_weekDayInitialsMonth.origin.x;
  y = self->_weekDayInitialsMonth.origin.y;
  width = self->_weekDayInitialsMonth.size.width;
  height = self->_weekDayInitialsMonth.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setWeekDayInitialsMonth:(CGRect)a3
{
  self->_weekDayInitialsMonth = a3;
}

- (double)animationDuration
{
  return dbl_1001A1690[UIAnimationDragCoefficient(self, a2) > 1.5];
}

- (void)prepareTransitionWithTopView:(id)a3 bottomView:(id)a4 allDayView:(id)a5 topLabelsContainer:(id)a6
{
  UIView *v10;
  UIView *v11;
  id v12;
  UIView *allDayView;
  UIView *topLabelsContainer;
  UIView *v15;

  v10 = (UIView *)a5;
  v11 = (UIView *)a6;
  v12 = a4;
  -[MonthDayTransitionView setTopView:](self, "setTopView:", a3);
  -[MonthDayTransitionView setBottomView:](self, "setBottomView:", v12);

  allDayView = self->_allDayView;
  self->_allDayView = v10;
  v15 = v10;

  topLabelsContainer = self->_topLabelsContainer;
  self->_topLabelsContainer = v11;

}

- (void)prepareTransitionScrubberWithSelectedDate:(id)a3 todayDate:(id)a4 dayViewController:(id)a5 monthViewController:(id)a6 paletteView:(id)a7 reverse:(BOOL)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  id v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  int IsLeftToRight;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  BOOL v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  id v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  id v88;
  uint64_t v89;
  id v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  id v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  double v101;
  void *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  uint64_t v112;
  int v113;
  void *v114;
  uint64_t v115;
  int v116;
  void *v117;
  id v118;
  id v119;
  uint64_t v120;
  void *v121;
  unsigned int v122;
  uint64_t v123;
  unsigned int v124;
  uint64_t v125;
  void *v126;
  void *v127;
  unsigned int v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  uint64_t v132;
  void *v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  id v137;
  void *v138;
  id *p_isa;
  _BOOL4 v140;
  void *v141;
  uint64_t v142;
  void *v143;
  id v144;
  void *v145;
  double v146;
  double v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  void *v154;
  double v155;
  double v156;
  double v157;
  double v158;
  double v159;
  double v160;
  double v161;
  double v162;
  double v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  id v168;
  id v169;
  uint64_t v170;
  void *i;
  void *v172;
  uint64_t v173;
  void *v174;
  id v175;
  double v176;
  double v177;
  double v178;
  double v179;
  double v180;
  double v181;
  double v182;
  double v183;
  double v184;
  void *v185;
  void *v186;
  void *v187;
  double v188;
  double v189;
  double v190;
  double v191;
  double v192;
  double v193;
  double v194;
  double v195;
  void *v196;
  double v197;
  double v198;
  double v199;
  double v200;
  double v201;
  void *v202;
  void *v203;
  void *v204;
  double v205;
  double v206;
  id v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  id v212;
  _BOOL8 v214;
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
  CGFloat v235;
  CGFloat v236;
  double v237;
  CGFloat v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  double v246;
  double v247;
  double v248;
  double v249;
  double v250;
  id v251;
  id v252;
  char *v253;
  void *v254;
  double v255;
  double v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  _BOOL4 v261;
  void *v262;
  void *v263;
  void *v264;
  id v265;
  double v266;
  void *v267;
  uint64_t v268;
  void *v269;
  void *v270;
  void *v271;
  double v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  uint64_t v278;
  MonthDayTransitionView *v279;
  void *v280;
  void *v281;
  id v282;
  void *v283;
  void *v284;
  uint64_t v285;
  void *v286;
  void *v287;
  void *v288;
  id v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  _BOOL4 obj;
  id obja;
  void *v295;
  __int128 v296;
  __int128 v297;
  __int128 v298;
  __int128 v299;
  _BYTE v300[128];

  v261 = a8;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v251 = a7;
  v17 = a7;
  -[MonthDayTransitionView setSelectedDate:](self, "setSelectedDate:", v13);
  objc_storeStrong((id *)&self->_monthViewController, a6);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dayScrubberController"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "view"));
  objc_msgSend(v19, "layoutIfNeeded");

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dayScrubberController"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "weekScrollView"));
  objc_msgSend(v21, "frame");
  v255 = v22;

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dayScrubberController"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "weekScrollView"));
  objc_msgSend(v24, "cellSize");
  v256 = v25;
  v272 = v26;

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "view"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dayScrubberController"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "view"));
  objc_msgSend(v29, "frame");
  v263 = v17;
  objc_msgSend(v27, "convertRect:fromView:", v17);
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;

  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "view"));
  -[MonthDayTransitionView convertRect:fromView:](self, "convertRect:fromView:", v38, v31, v33, v35, v37);
  v249 = v40;
  v250 = v39;
  v247 = v42;
  v248 = v41;

  v262 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "cellFramesForWeekContainingDate:", v13));
  objc_msgSend(v16, "frameForWeekContainingDate:", v13);
  v44 = v43;
  v46 = v45;
  v48 = v47;
  v50 = v49;
  v277 = v16;
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "view"));
  -[MonthDayTransitionView convertRect:fromView:](self, "convertRect:fromView:", v51, v44, v46, v48, v50);
  v53 = v52;
  v55 = v54;
  v57 = v56;
  v246 = v58;

  v265 = v15;
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dayScrubberController"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "weekScrollView"));
  v61 = (char *)objc_msgSend(v60, "firstVisibleDayOffsetFromSelectedDay");

  v62 = (uint64_t)(v61 + 6);
  v64 = CUIKCalendar(v63);
  v65 = (void *)objc_claimAutoreleasedReturnValue(v64);
  v66 = objc_alloc_init((Class)NSDateComponents);
  objc_msgSend(v66, "setHour:", 1);
  v260 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "dateByAddingComponents:toDate:options:", v66, v13, 0));
  v259 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "components:fromDate:", 512));
  v67 = objc_msgSend(v259, "weekday");
  v68 = CUIKZeroIndexedWeekStart(v67);
  IsLeftToRight = CalTimeDirectionIsLeftToRight(v68, v69);
  v71 = v68 - (_QWORD)v67 - 6;
  if (!IsLeftToRight)
    v71 = (uint64_t)v67 - v68 + 6;
  v72 = v71 % 7;
  v73 = (7 - (uint64_t)v67) % 7;
  v75 = &v61[-v72];
  v74 = (uint64_t)v61 < v72;
  if ((uint64_t)v61 >= v72)
    v76 = v72;
  else
    v76 = (uint64_t)v61;
  if ((uint64_t)v61 >= v72)
    v77 = 0;
  else
    v77 = v72 - (_QWORD)v61;
  v285 = v77;
  if (v74)
    v78 = 0;
  else
    v78 = v75;
  v253 = v78;
  if (v62 <= v73)
    v62 = v73;
  v79 = objc_alloc_init((Class)NSDateComponents);
  if (CalTimeDirectionIsLeftToRight(v79, v80))
    v81 = v76;
  else
    v81 = -v76;
  objc_msgSend(v79, "setDay:", v81);
  v258 = v79;
  v82 = v13;
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "dateByAddingComponents:toDate:options:", v79, v13, 0));
  v283 = v65;
  v273 = v66;
  v84 = objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "dateByAddingComponents:toDate:options:", v66, v83, 0));

  if (v76 >= 0)
    v85 = v76;
  else
    v85 = -v76;
  if (v62 < 0)
    v62 = -v62;
  v289 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v85 + v62 + 1);
  v87 = CUIKGetOverlayCalendar(v289, v86);
  v88 = (id)objc_claimAutoreleasedReturnValue(v87);
  v281 = v88;
  if (v88)
    v88 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v85 + v62 + 1);
  v288 = v88;
  v89 = objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "components:fromDate:", 542, v84));
  v274 = v82;
  v271 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "components:fromDate:", 542, v82));
  v287 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "dateFromComponents:"));
  v90 = v14;
  if (v14)
  {
    v270 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "components:fromDate:", 542, v14));
    v91 = objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "dateFromComponents:"));
  }
  else
  {
    v91 = 0;
    v270 = 0;
  }
  v254 = (void *)v89;
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "dateFromComponents:", v89));
  v93 = objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "dateByAddingComponents:toDate:options:", v273, v92, 0));

  v94 = objc_alloc_init((Class)NSDateComponents);
  v95 = objc_msgSend(v94, "setHour:", 0);
  if (CalTimeDirectionIsLeftToRight(v95, v96))
    v97 = 1;
  else
    v97 = -1;
  v286 = v94;
  objc_msgSend(v94, "setDay:", v97);
  v279 = self;
  v264 = v90;
  v257 = (void *)v84;
  obj = (_os_feature_enabled_impl("Calendar", "all_on") & 1) != 0
     || _os_feature_enabled_impl("Calendar", "resizeable_month");
  v282 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v85 + v62 + 1);
  v280 = 0;
  v98 = 0;
  v99 = 0;
  v100 = v62 + v85 + 1;
  v101 = 0.0;
  v291 = -1;
  v292 = -1;
  v290 = -1;
  v278 = -1;
  v102 = v283;
  v284 = (void *)v91;
  do
  {
    v103 = v98;
    v104 = (void *)v93;
    v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "components:fromDate:", 542, v93));
    v105 = CUIKLocalizedStringForInteger(objc_msgSend(v98, "day"));
    v106 = (void *)objc_claimAutoreleasedReturnValue(v105);
    objc_msgSend(v289, "addObject:", v106);

    if (v288)
    {
      v107 = v98;
      v108 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKDateStrings overlayShortStringForDate:inCalendar:](CUIKDateStrings, "overlayShortStringForDate:inCalendar:", v104, v281));
      objc_msgSend(v288, "addObject:", v108);

      v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v281, "components:fromDate:", 24, v104));
      v110 = v284;
      if (objc_msgSend(v109, "day") == (id)1)
      {
        if (objc_msgSend(v109, "month") == (id)1 && (objc_msgSend(v109, "isLeapMonth") & 1) == 0)
        {
          v114 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView traitCollection](v279, "traitCollection"));
          v116 = EKUIUsesLargeTextLayout(v114, v115);

          if (v116)
            v101 = 3.0;
          else
            v101 = 1.5;
        }
        else
        {
          v111 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView traitCollection](v279, "traitCollection"));
          v113 = EKUIUsesLargeTextLayout(v111, v112);

          if (v113)
            v101 = 2.0;
          else
            v101 = 1.0;
        }
        v278 = v99;
        v102 = v283;
      }

      v98 = v107;
    }
    else
    {
      v110 = v284;
    }
    if (objc_msgSend(v98, "weekday") == (id)1 || objc_msgSend(v98, "weekday") == (id)7)
    {
      v117 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v99));
      objc_msgSend(v282, "addObject:", v117);

    }
    if (v103)
    {
      v118 = objc_msgSend(v98, "month");
      v119 = objc_msgSend(v103, "month");
      v120 = v291;
      if (v118 != v119)
        v120 = v99 - 1;
      v291 = v120;
    }
    v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "dateFromComponents:", v98));
    v122 = objc_msgSend(v121, "isEqualToDate:", v287);
    v123 = v292;
    if (v122)
      v123 = v99;
    v292 = v123;
    if (v110)
    {
      v124 = objc_msgSend(v121, "isEqualToDate:", v110);
      v125 = v290;
      if (v124)
        v125 = v99;
      v290 = v125;
    }
    if (v285 == v99)
    {
      v126 = v98;
      v127 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
      v128 = objc_msgSend(v127, "showWeekNumbers");

      if (v128)
      {
        v102 = v283;
        v129 = CUIKLocalizedStringForInteger(objc_msgSend(v283, "component:fromDate:", 0x2000, v104));
        v130 = objc_claimAutoreleasedReturnValue(v129);

        v280 = (void *)v130;
      }
      else
      {
        v102 = v283;
      }
      v98 = v126;
    }
    v93 = objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "dateByAddingComponents:toDate:options:", v286, v104, 0));

    ++v99;
  }
  while (v100 != v99);
  v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "timeZone"));
  v132 = objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v274, v131));

  v133 = v277;
  v245 = (void *)v132;
  v134 = objc_claimAutoreleasedReturnValue(objc_msgSend(v277, "subviewForDate:", v132));
  objc_opt_class(CompactMonthWeekView);
  v244 = (void *)v134;
  if ((objc_opt_isKindOfClass(v134, v135) & 1) != 0)
    v136 = (void *)v134;
  else
    v136 = 0;
  v137 = v136;
  v267 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v137, "visibleDaySummaryViews"));
  v138 = v265;
  p_isa = (id *)&v279->super.super.super.isa;
  v295 = v137;
  if (v137)
  {
    v275 = v98;
    if (v267)
      v140 = 0;
    else
      v140 = obj;
    if (v140)
    {
      v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v137, "occurrencesView"));
      v142 = captureImageFromView(v141, 0);
      v143 = (void *)objc_claimAutoreleasedReturnValue(v142);

      v144 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v143);
      v145 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v295, "occurrencesView"));
      objc_msgSend(v145, "bounds");
      v147 = v146;
      v149 = v148;
      v151 = v150;
      v153 = v152;
      v154 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v295, "occurrencesView"));
      objc_msgSend(v295, "convertRect:fromView:", v154, v147, v149, v151, v153);
      v156 = v155;
      v158 = v157;
      v160 = v159;
      v162 = v161;

      objc_msgSend(v144, "setFrame:", v156, v158, v160, v162);
      if (objc_msgSend(v295, "containsFirstDayOfMonth"))
      {
        +[CompactMonthWeekView headerHeight](CompactMonthWeekView, "headerHeight");
        v158 = v158 - v163;
      }
      v164 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView scrubber](v279, "scrubber"));
      objc_msgSend(v164, "setMonthOccurrencesSnapshot:", v144);

      v165 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView scrubber](v279, "scrubber"));
      objc_msgSend(v165, "setMonthOccurrencesFrame:", v156, v158, v160, v162);

      v98 = v275;
    }
    else
    {
      v268 = v93;
      v166 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v267, "count")));
      v167 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v267, "count")));
      v296 = 0u;
      v297 = 0u;
      v298 = 0u;
      v299 = 0u;
      obja = v267;
      v168 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v296, v300, 16);
      if (v168)
      {
        v169 = v168;
        v170 = *(_QWORD *)v297;
        do
        {
          for (i = 0; i != v169; i = (char *)i + 1)
          {
            if (*(_QWORD *)v297 != v170)
              objc_enumerationMutation(obja);
            v172 = *(void **)(*((_QWORD *)&v296 + 1) + 8 * (_QWORD)i);
            v173 = captureImageFromView(v172, 1);
            v174 = (void *)objc_claimAutoreleasedReturnValue(v173);
            v175 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v174);
            objc_msgSend(v172, "bounds");
            objc_msgSend(v295, "convertRect:fromView:", v172);
            v177 = v176;
            v179 = v178;
            v181 = v180;
            v183 = v182;
            objc_msgSend(v175, "setFrame:");
            if (objc_msgSend(v295, "containsFirstDayOfMonth"))
            {
              +[CompactMonthWeekView headerHeight](CompactMonthWeekView, "headerHeight");
              v179 = v179 - v184;
            }
            objc_msgSend(v166, "addObject:", v175);
            v185 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v177, v179, v181, v183));
            objc_msgSend(v167, "addObject:", v185);

          }
          v169 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v296, v300, 16);
        }
        while (v169);
      }

      p_isa = (id *)&v279->super.super.super.isa;
      v186 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView scrubber](v279, "scrubber"));
      objc_msgSend(v186, "setMonthSummarySnapshots:", v166);

      v187 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView scrubber](v279, "scrubber"));
      objc_msgSend(v187, "setMonthSummaryFrames:", v167);

      v138 = v265;
      v98 = v275;
      v133 = v277;
      v110 = v284;
      v93 = v268;
    }
  }
  objc_storeStrong(p_isa + 15, v251);
  objc_msgSend(p_isa, "setDayScrubberFrame:", v250, v249, v248, v247);
  objc_msgSend(p_isa, "setMonthScrubberFrame:", v53, v55, v57, v246);
  objc_msgSend(p_isa[15], "convertRect:fromView:", p_isa, v250, v249, v248, v247);
  v189 = v188;
  v191 = v190;
  v193 = v192;
  v195 = v194;
  objc_msgSend(p_isa[15], "convertRect:fromView:", p_isa, v53, v55, v57, v246);
  v252 = v196;
  v198 = v197;
  v266 = v199;
  v201 = v200;
  v202 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa[15], "window"));

  if (!v202)
  {
    v203 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v133, "navigationController"));
    v204 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v203, "navigationBar"));
    objc_msgSend(v204, "frame");
    v206 = v205;

    v198 = v198 - v206;
  }
  v269 = (void *)v93;
  v276 = v98;
  v207 = p_isa[15];
  v208 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa, "scrubber"));
  objc_msgSend(v207, "addSubview:", v208);

  v209 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa, "scrubber"));
  objc_msgSend(v209, "setDayCellSize:", v256, v272);

  v210 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa, "scrubber"));
  objc_msgSend(v210, "setSelectedIndex:", v292);

  v211 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa, "scrubber"));
  objc_msgSend(v211, "setTodayIndex:", v290);

  v212 = objc_msgSend(v270, "month");
  v214 = v212 == objc_msgSend(v271, "month") && v290 >= 0;
  v215 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa, "scrubber"));
  objc_msgSend(v215, "setStrings:overlayStrings:weekNumberString:todayInWeek:", v289, v288, v280, v214);

  if ((v278 & 0x8000000000000000) == 0)
  {
    v216 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa, "scrubber"));
    objc_msgSend(v216, "setUnderlineThickness:forOverlayStringAtIndex:", v278, v101);

  }
  v217 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa, "scrubber"));
  objc_msgSend(v217, "setWeekendIndices:", v282);

  v218 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa, "scrubber"));
  v219 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "dayScrubberController"));
  v220 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v219, "visibleCellDayTypes"));
  v221 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "dayScrubberController"));
  v222 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v221, "visibleCellBadgeColors"));
  v223 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "dayScrubberController"));
  v224 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v223, "visibleCellBadgeLocales"));
  objc_msgSend(v218, "setDayTypes:badgeColors:badgeLocales:", v220, v222, v224);

  v225 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView scrubber](v279, "scrubber"));
  objc_msgSend(v225, "setDayFrame:", v189, v191, v193, v195);

  v226 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView scrubber](v279, "scrubber"));
  objc_msgSend(v226, "setMonthFrame:", *(double *)&v252, v198, v266, v201);

  v227 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView scrubber](v279, "scrubber"));
  objc_msgSend(v227, "setFirstDayCellInset:", v255);

  v228 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView scrubber](v279, "scrubber"));
  objc_msgSend(v228, "setFirstDayCellIndex:", v253);

  v229 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView scrubber](v279, "scrubber"));
  objc_msgSend(v229, "setFirstMonthCellIndex:", v285);

  v230 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView scrubber](v279, "scrubber"));
  objc_msgSend(v230, "setMonthCellFrames:", v262);

  v231 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView scrubber](v279, "scrubber"));
  objc_msgSend(v231, "setMonthRowHeight:", v201);

  v232 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView scrubber](v279, "scrubber"));
  objc_msgSend(v232, "setMonthBreakIndex:", v291);

  -[MonthDayTransitionView setDayCellSize:](v279, "setDayCellSize:", v256, v272);
  v233 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView scrubber](v279, "scrubber"));
  objc_msgSend(v233, "completeSetup");

  v234 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView bottomView](v279, "bottomView"));
  objc_msgSend(v234, "frame");
  v279->_dayViewDayLocation.x = v235;
  v279->_dayViewDayLocation.y = v236;

  -[MonthDayTransitionView monthScrubberFrame](v279, "monthScrubberFrame");
  v279->_dayViewMonthLocation.x = v238;
  v279->_dayViewMonthLocation.y = v201 + v237;
  if (v261)
  {
    v239 = v277;
    v240 = v263;
    objc_msgSend(v277, "updatePalette:", v263);
    objc_msgSend(v263, "layoutSubviews");
    v241 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v263, "dayInitialsHeaderView"));
    objc_msgSend(v241, "frame");
    -[MonthDayTransitionView setWeekDayInitialsMonth:](v279, "setWeekDayInitialsMonth:");

    objc_msgSend(v138, "updatePalette:", v263);
    objc_msgSend(v263, "layoutSubviews");
    v242 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v263, "dayInitialsHeaderView"));
    objc_msgSend(v242, "frame");
    -[MonthDayTransitionView setWeekDayInitialsDay:](v279, "setWeekDayInitialsDay:");
  }
  else
  {
    v240 = v263;
    objc_msgSend(v138, "updatePalette:", v263);
    objc_msgSend(v263, "layoutSubviews");
    v243 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v263, "dayInitialsHeaderView"));
    objc_msgSend(v243, "frame");
    -[MonthDayTransitionView setWeekDayInitialsDay:](v279, "setWeekDayInitialsDay:");

    v239 = v277;
    objc_msgSend(v277, "updatePalette:", v263);
    objc_msgSend(v263, "layoutSubviews");
    v242 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v263, "dayInitialsHeaderView"));
    objc_msgSend(v242, "frame");
    -[MonthDayTransitionView setWeekDayInitialsMonth:](v279, "setWeekDayInitialsMonth:");
  }

}

- (void)animateToDayWithCompletion:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
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
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double x;
  double y;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  double v63;
  void *v64;
  uint64_t v65;
  void *v66;
  double v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  id v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  int64_t v79;
  dispatch_time_t v80;
  id v81;
  void *v82;
  _QWORD block[5];
  _QWORD v84[5];
  _QWORD v85[5];
  _QWORD v86[6];

  v81 = a3;
  if (self->_animating)
    -[MonthDayTransitionView _haltAnimations](self, "_haltAnimations");
  -[MonthDayTransitionView weekDayInitialsMonth](self, "weekDayInitialsMonth", v81);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteView dayInitialsHeaderView](self->_paletteView, "dayInitialsHeaderView"));
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteView dayInitialsHeaderView](self->_paletteView, "dayInitialsHeaderView"));
  objc_msgSend(v13, "setAlpha:", 1.0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteView dateLabel](self->_paletteView, "dateLabel"));
  objc_msgSend(v14, "setAlpha:", 1.0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteView animatableDateLabel](self->_paletteView, "animatableDateLabel"));
  objc_msgSend(v15, "setAlpha:", 1.0);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView topView](self, "topView"));
  objc_msgSend(v16, "bounds");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView topView](self, "topView"));
  -[MonthDayTransitionView convertRect:fromView:](self, "convertRect:fromView:", v25, v18, v20, v22, v24);

  -[MonthDayTransitionView monthScrubberFrame](self, "monthScrubberFrame");
  -[MonthDayTransitionView _topExtensionHeight](self, "_topExtensionHeight");
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView topView](self, "topView"));
  objc_msgSend(v26, "bounds");
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView topView](self, "topView"));
  -[MonthDayTransitionView convertRect:fromView:](self, "convertRect:fromView:", v35, v28, v30, v32, v34);

  -[MonthDayTransitionView monthScrubberFrame](self, "monthScrubberFrame");
  -[MonthDayTransitionView monthScrubberFrame](self, "monthScrubberFrame");
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView topView](self, "topView"));
  objc_msgSend(v36, "bounds");

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](self->_monthViewController, "view"));
  -[MonthDayTransitionView monthScrubberFrame](self, "monthScrubberFrame");
  objc_msgSend(v37, "convertRect:fromView:", self);
  v39 = v38;
  v41 = v40;
  v43 = v42;
  v45 = v44;

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](self->_monthViewController, "view"));
  -[MonthDayTransitionView dayScrubberFrame](self, "dayScrubberFrame");
  objc_msgSend(v46, "convertPoint:fromView:", self);
  v48 = v47;

  -[CompactWidthMonthViewController enterAnimationSplitStateWithCutOutArea:topBoundary:](self->_monthViewController, "enterAnimationSplitStateWithCutOutArea:topBoundary:", v39, v41, v43, v45, v48);
  -[CompactWidthMonthViewController setSplitStateOpen:](self->_monthViewController, "setSplitStateOpen:", 0);
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView topView](self, "topView"));
  objc_msgSend(v49, "setAlpha:", 1.0);

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView bottomView](self, "bottomView"));
  objc_msgSend(v50, "frame");
  v52 = v51;
  v54 = v53;

  x = self->_dayViewMonthLocation.x;
  y = self->_dayViewMonthLocation.y;
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView bottomView](self, "bottomView"));
  objc_msgSend(v57, "setFrame:", x, y, v52, v54);

  -[UIView setAlpha:](self->_allDayView, "setAlpha:", 0.0);
  -[UIView setAlpha:](self->_topLabelsContainer, "setAlpha:", 0.0);
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteView dayScrubberController](self->_paletteView, "dayScrubberController"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "view"));
  objc_msgSend(v59, "setHidden:", 1);

  v60 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView scrubber](self, "scrubber"));
  objc_msgSend(v60, "setHidden:", 0);

  v61 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView scrubber](self, "scrubber"));
  objc_msgSend(v61, "animateToDayLayout");

  v63 = springAnimationDuration(v62);
  v64 = (void *)objc_claimAutoreleasedReturnValue(+[SpringFactory sharedFactory](SpringFactory, "sharedFactory"));
  v86[0] = _NSConcreteStackBlock;
  v86[1] = 3221225472;
  v86[2] = sub_100095A58;
  v86[3] = &unk_1001B2538;
  v86[4] = self;
  v65 = navigationAnimationsPreferringFRR(v86);
  v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, v64, v66, 0, v63, 0.0);

  self->_animating = 1;
  v67 = springAnimationDuration(-[MonthDayTransitionView setCompletion:](self, "setCompletion:", v82));
  v68 = (void *)objc_claimAutoreleasedReturnValue(+[SpringFactory sharedFactory](SpringFactory, "sharedFactory"));
  v85[0] = _NSConcreteStackBlock;
  v85[1] = 3221225472;
  v85[2] = sub_100095A6C;
  v85[3] = &unk_1001B2538;
  v85[4] = self;
  v69 = navigationAnimationsPreferringFRR(v85);
  v70 = (void *)objc_claimAutoreleasedReturnValue(v69);
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, v68, v70, 0, v67, 0.0);

  v71 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView bottomView](self, "bottomView"));
  v72 = -[MonthDayTransitionView _animateView:toPosition:setDelegate:](self, "_animateView:toPosition:setDelegate:", v71, 1, self->_dayViewDayLocation.x, self->_dayViewDayLocation.y);

  v84[0] = _NSConcreteStackBlock;
  v84[1] = 3221225472;
  v84[2] = sub_100095B4C;
  v84[3] = &unk_1001B2538;
  v84[4] = self;
  v73 = navigationAnimationsPreferringFRR(v84);
  v74 = (void *)objc_claimAutoreleasedReturnValue(v73);
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 327680, v74, 0, 0.395, 0.205);

  if (UIAnimationDragCoefficient(v75, v76) <= 1.5)
    v79 = 600000000;
  else
    v79 = (uint64_t)(UIAnimationDragCoefficient(v77, v78) * 0.91 * 1000000000.0);
  v80 = dispatch_time(0, v79);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100095B94;
  block[3] = &unk_1001B2538;
  block[4] = self;
  dispatch_after(v80, (dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)animateToMonthWithCompletion:(id)a3
{
  id v4;
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
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double x;
  double y;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  double v55;
  void *v56;
  uint64_t v57;
  void *v58;
  double v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  id v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  int64_t v71;
  dispatch_time_t v72;
  _QWORD v73[5];
  _QWORD v74[5];
  _QWORD v75[5];
  _QWORD v76[5];
  _QWORD v77[6];

  v4 = a3;
  if (self->_animating)
    -[MonthDayTransitionView _haltAnimations](self, "_haltAnimations");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteView dateLabel](self->_paletteView, "dateLabel"));
  objc_msgSend(v5, "setHidden:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteView animatableDateLabel](self->_paletteView, "animatableDateLabel"));
  objc_msgSend(v6, "setAlpha:", 0.0);

  -[MonthDayTransitionView weekDayInitialsDay](self, "weekDayInitialsDay");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteView dayInitialsHeaderView](self->_paletteView, "dayInitialsHeaderView"));
  objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteView dayInitialsHeaderView](self->_paletteView, "dayInitialsHeaderView"));
  objc_msgSend(v16, "setAlpha:", 1.0);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](self->_monthViewController, "view"));
  -[MonthDayTransitionView monthScrubberFrame](self, "monthScrubberFrame");
  objc_msgSend(v17, "convertRect:fromView:", self);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](self->_monthViewController, "view"));
  -[MonthDayTransitionView dayScrubberFrame](self, "dayScrubberFrame");
  objc_msgSend(v26, "convertPoint:fromView:", self);
  v28 = v27;

  -[CompactWidthMonthViewController enterAnimationSplitStateWithCutOutArea:topBoundary:](self->_monthViewController, "enterAnimationSplitStateWithCutOutArea:topBoundary:", v19, v21, v23, v25, v28);
  -[CompactWidthMonthViewController setSplitStateOpen:](self->_monthViewController, "setSplitStateOpen:", 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](self->_monthViewController, "view"));
  objc_msgSend(v29, "setAlpha:", 0.0);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView topView](self, "topView"));
  objc_msgSend(v30, "bounds");
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v38 = v37;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView topView](self, "topView"));
  -[MonthDayTransitionView convertRect:fromView:](self, "convertRect:fromView:", v39, v32, v34, v36, v38);

  -[MonthDayTransitionView monthScrubberFrame](self, "monthScrubberFrame");
  -[MonthDayTransitionView _topExtensionHeight](self, "_topExtensionHeight");
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView topView](self, "topView"));
  objc_msgSend(v40, "setAlpha:", 1.0);

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView bottomView](self, "bottomView"));
  objc_msgSend(v41, "setAlpha:", 1.0);

  -[MonthDayTransitionView dayScrubberFrame](self, "dayScrubberFrame");
  -[MonthDayTransitionView _topExtensionHeight](self, "_topExtensionHeight");
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView bottomView](self, "bottomView"));
  objc_msgSend(v42, "frame");
  v44 = v43;
  v46 = v45;

  x = self->_dayViewDayLocation.x;
  y = self->_dayViewDayLocation.y;
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView bottomView](self, "bottomView"));
  objc_msgSend(v49, "setFrame:", x, y, v44, v46);

  -[UIView setAlpha:](self->_allDayView, "setAlpha:", 1.0);
  -[UIView setAlpha:](self->_topLabelsContainer, "setAlpha:", 1.0);
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView scrubber](self, "scrubber"));
  objc_msgSend(v50, "setHidden:", 0);

  v51 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView scrubber](self, "scrubber"));
  objc_msgSend(v51, "animateToMonthLayout");

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteView dayScrubberController](self->_paletteView, "dayScrubberController"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "view"));
  objc_msgSend(v53, "setHidden:", 1);

  v55 = springAnimationDuration(v54);
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[SpringFactory sharedFactory](SpringFactory, "sharedFactory"));
  v77[0] = _NSConcreteStackBlock;
  v77[1] = 3221225472;
  v77[2] = sub_10009611C;
  v77[3] = &unk_1001B2538;
  v77[4] = self;
  v57 = navigationAnimationsPreferringFRR(v77);
  v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, v56, v58, 0, v55, 0.0);

  self->_animating = 1;
  v59 = springAnimationDuration(-[MonthDayTransitionView setCompletion:](self, "setCompletion:", v4));
  v60 = (void *)objc_claimAutoreleasedReturnValue(+[SpringFactory sharedFactory](SpringFactory, "sharedFactory"));
  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472;
  v76[2] = sub_100096130;
  v76[3] = &unk_1001B2538;
  v76[4] = self;
  v61 = navigationAnimationsPreferringFRR(v76);
  v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
  v75[0] = _NSConcreteStackBlock;
  v75[1] = 3221225472;
  v75[2] = sub_100096210;
  v75[3] = &unk_1001B25D0;
  v75[4] = self;
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, v60, v62, v75, v59, 0.0);

  v63 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView bottomView](self, "bottomView"));
  v64 = -[MonthDayTransitionView _animateView:toPosition:setDelegate:](self, "_animateView:toPosition:setDelegate:", v63, 1, self->_dayViewMonthLocation.x, self->_dayViewMonthLocation.y);

  v74[0] = _NSConcreteStackBlock;
  v74[1] = 3221225472;
  v74[2] = sub_100096284;
  v74[3] = &unk_1001B2538;
  v74[4] = self;
  v65 = navigationAnimationsPreferringFRR(v74);
  v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 327680, v66, 0, 0.25, 0.0);

  if (UIAnimationDragCoefficient(v67, v68) <= 1.5)
    v71 = 600000000;
  else
    v71 = (uint64_t)(UIAnimationDragCoefficient(v69, v70) * 0.91 * 1000000000.0);
  v72 = dispatch_time(0, v71);
  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3221225472;
  v73[2] = sub_1000962CC;
  v73[3] = &unk_1001B2538;
  v73[4] = self;
  dispatch_after(v72, (dispatch_queue_t)&_dispatch_main_q, v73);

}

- (double)_topExtensionHeight
{
  double v2;

  -[MonthDayTransitionView monthScrubberFrame](self, "monthScrubberFrame");
  return v2 + -5.0;
}

- (void)_haltAnimations
{
  void *v2;
  uint64_t v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView window](self, "window"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layer"));
  recursiveAnimationRemove(v2, v3);

}

- (id)_animateView:(id)a3 toPosition:(CGPoint)a4 setDelegate:(BOOL)a5
{
  uint64_t v7;
  void *v8;

  if (!a5)
    self = 0;
  v7 = springAnimateViewPosition(a3, 1, self, (__n128)a4, *(__n128 *)&a4.y);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  preferredNavigationAnimationFrameRateRange();
  objc_msgSend(v8, "setPreferredFrameRateRange:");
  return v8;
}

- (void)_animateView:(id)a3 toPosition:(CGPoint)a4
{
  id v4;

  v4 = -[MonthDayTransitionView _animateView:toPosition:setDelegate:](self, "_animateView:toPosition:setDelegate:", a3, 0, a4.x, a4.y);
}

- (void)_animateView:(id)a3 toAlpha:(double)a4 delay:(double)a5
{
  id v7;
  uint64_t v8;
  float v9;
  dispatch_time_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  double v14;

  v7 = a3;
  v9 = UIAnimationDragCoefficient(v7, v8);
  v10 = dispatch_time(0, (uint64_t)(v9 * a5 * 1000000000.0));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100096458;
  v12[3] = &unk_1001B2838;
  v13 = v7;
  v14 = a4;
  v11 = v7;
  dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, v12);

}

- (void)_basicAnimateView:(id)a3 toAlpha:(double)a4 duration:(double)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v7 = a3;
  v13 = objc_alloc_init((Class)CABasicAnimation);
  objc_msgSend(v13, "setKeyPath:", CFSTR("opacity"));
  objc_msgSend(v7, "alpha");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v13, "setFromValue:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4));
  objc_msgSend(v13, "setToValue:", v9);

  objc_msgSend(v13, "setDuration:", UIAnimationDragCoefficient(v10, v11) * a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layer"));
  objc_msgSend(v12, "addAnimation:forKey:", v13, CFSTR("opacity"));

  preferredNavigationAnimationFrameRateRange();
  objc_msgSend(v13, "setPreferredFrameRateRange:");
  objc_msgSend(v7, "setAlpha:", a4);

}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double x;
  double y;
  void *v18;
  void *v19;
  id v20;

  -[CompactWidthMonthViewController endAnimationSplitState](self->_monthViewController, "endAnimationSplitState", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](self->_monthViewController, "view"));
  objc_msgSend(v5, "setAlpha:", 1.0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView scrubber](self, "scrubber"));
  objc_msgSend(v6, "setHidden:", 1);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView scrubber](self, "scrubber"));
  objc_msgSend(v7, "setAlpha:", 1.0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView scrubber](self, "scrubber"));
  objc_msgSend(v8, "removeFromSuperview");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteView dayScrubberController](self->_paletteView, "dayScrubberController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
  objc_msgSend(v10, "setHidden:", 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView bottomView](self, "bottomView"));
  objc_msgSend(v11, "frame");
  v13 = v12;
  v15 = v14;

  x = self->_dayViewDayLocation.x;
  y = self->_dayViewDayLocation.y;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView bottomView](self, "bottomView"));
  objc_msgSend(v18, "setFrame:", x, y, v13, v15);

  -[UIView setAlpha:](self->_allDayView, "setAlpha:", 1.0);
  -[UIView setAlpha:](self->_topLabelsContainer, "setAlpha:", 1.0);
  -[MonthDayTransitionView setAlpha:](self, "setAlpha:", 1.0);
  self->_animating = 0;
  v20 = (id)objc_claimAutoreleasedReturnValue(-[MonthDayTransitionView completion](self, "completion"));
  -[MonthDayTransitionView setCompletion:](self, "setCompletion:", 0);
  v19 = v20;
  if (v20)
  {
    (*((void (**)(id))v20 + 2))(v20);
    v19 = v20;
  }

}

- (BOOL)animating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (BOOL)dividedMonthView
{
  return self->_dividedMonthView;
}

- (void)setDividedMonthView:(BOOL)a3
{
  self->_dividedMonthView = a3;
}

- (NSDate)selectedDate
{
  return self->_selectedDate;
}

- (void)setSelectedDate:(id)a3
{
  objc_storeStrong((id *)&self->_selectedDate, a3);
}

- (UIView)topView
{
  return self->_topView;
}

- (void)setTopView:(id)a3
{
  objc_storeStrong((id *)&self->_topView, a3);
}

- (UIView)bottomView
{
  return self->_bottomView;
}

- (void)setBottomView:(id)a3
{
  objc_storeStrong((id *)&self->_bottomView, a3);
}

- (MonthDayNavigationTransitionView)scrubber
{
  return self->_scrubber;
}

- (void)setScrubber:(id)a3
{
  objc_storeStrong((id *)&self->_scrubber, a3);
}

- (CGRect)dayScrubberFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_dayScrubberFrame.origin.x;
  y = self->_dayScrubberFrame.origin.y;
  width = self->_dayScrubberFrame.size.width;
  height = self->_dayScrubberFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setDayScrubberFrame:(CGRect)a3
{
  self->_dayScrubberFrame = a3;
}

- (CGSize)dayCellSize
{
  double width;
  double height;
  CGSize result;

  width = self->_dayCellSize.width;
  height = self->_dayCellSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setDayCellSize:(CGSize)a3
{
  self->_dayCellSize = a3;
}

- (CGRect)monthScrubberFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_monthScrubberFrame.origin.x;
  y = self->_monthScrubberFrame.origin.y;
  width = self->_monthScrubberFrame.size.width;
  height = self->_monthScrubberFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setMonthScrubberFrame:(CGRect)a3
{
  self->_monthScrubberFrame = a3;
}

- (CompactWidthMonthViewController)monthViewController
{
  return self->_monthViewController;
}

- (void)setMonthViewController:(id)a3
{
  objc_storeStrong((id *)&self->_monthViewController, a3);
}

- (PaletteView)paletteView
{
  return self->_paletteView;
}

- (void)setPaletteView:(id)a3
{
  objc_storeStrong((id *)&self->_paletteView, a3);
}

- (UIView)allDayView
{
  return self->_allDayView;
}

- (void)setAllDayView:(id)a3
{
  objc_storeStrong((id *)&self->_allDayView, a3);
}

- (UIView)topLabelsContainer
{
  return self->_topLabelsContainer;
}

- (void)setTopLabelsContainer:(id)a3
{
  objc_storeStrong((id *)&self->_topLabelsContainer, a3);
}

- (CGPoint)dayViewDayLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_dayViewDayLocation.x;
  y = self->_dayViewDayLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setDayViewDayLocation:(CGPoint)a3
{
  self->_dayViewDayLocation = a3;
}

- (CGPoint)dayViewMonthLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_dayViewMonthLocation.x;
  y = self->_dayViewMonthLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setDayViewMonthLocation:(CGPoint)a3
{
  self->_dayViewMonthLocation = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_topLabelsContainer, 0);
  objc_storeStrong((id *)&self->_allDayView, 0);
  objc_storeStrong((id *)&self->_paletteView, 0);
  objc_storeStrong((id *)&self->_monthViewController, 0);
  objc_storeStrong((id *)&self->_scrubber, 0);
  objc_storeStrong((id *)&self->_bottomView, 0);
  objc_storeStrong((id *)&self->_topView, 0);
  objc_storeStrong((id *)&self->_selectedDate, 0);
}

@end
