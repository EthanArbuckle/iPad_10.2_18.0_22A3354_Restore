@implementation _UIDatePickerIOSCompactView

- (void)setContentHorizontalAlignment:(int64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIDatePickerIOSCompactView;
  -[UIControl setContentHorizontalAlignment:](&v4, sel_setContentHorizontalAlignment_, a3);
  -[_UIDatePickerOverlayPresentation setAlignment:](self->_presentation, "setAlignment:", -[UIControl effectiveContentHorizontalAlignment](self, "effectiveContentHorizontalAlignment"));
  -[UIView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (_UIDatePickerIOSCompactView)initWithFrame:(CGRect)a3
{
  _UIDatePickerIOSCompactView *v3;
  uint64_t v4;
  _UIDatePickerCompactDateLabel *dateView;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _UIDatePickerCompactTimeLabel *v12;
  void *v13;
  uint64_t v14;
  _UIDatePickerCompactTimeLabel *timeView;
  _UIDatePickerOverlayPresentation *v16;
  _UIDatePickerOverlayPresentation *presentation;
  uint64_t v18;
  UILayoutGuide *timeViewLayoutGuide;
  uint64_t v20;
  UILayoutGuide *contentLayoutGuide;
  UIPanGestureRecognizer *v22;
  UIPanGestureRecognizer *panGestureRecognizer;
  void *v24;
  id v25;
  objc_super v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v27.receiver = self;
  v27.super_class = (Class)_UIDatePickerIOSCompactView;
  v3 = -[UIControl initWithFrame:](&v27, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_opt_new();
    dateView = v3->_dateView;
    v3->_dateView = (_UIDatePickerCompactDateLabel *)v4;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_dateView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_UIDatePickerCompactDateLabel setDelegate:](v3->_dateView, "setDelegate:", v3);
    -[_UIDatePickerIOSCompactView data](v3, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "effectiveCalendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerIOSCompactView data](v3, "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "effectiveLocale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerIOSCompactView data](v3, "data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIDatePickerCalendarTimeFormat formatWithCalendar:locale:followsSystemHourCycle:](_UIDatePickerCalendarTimeFormat, "formatWithCalendar:locale:followsSystemHourCycle:", v7, v9, objc_msgSend(v10, "followsSystemHourCycle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = [_UIDatePickerCompactTimeLabel alloc];
    -[_UIDatePickerIOSCompactView data](v3, "data");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[_UIDatePickerCompactTimeLabel initWithTimeFormat:minuteInterval:](v12, "initWithTimeFormat:minuteInterval:", v11, objc_msgSend(v13, "minuteInterval"));
    timeView = v3->_timeView;
    v3->_timeView = (_UIDatePickerCompactTimeLabel *)v14;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_timeView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_UIDatePickerCompactTimeLabel setSelectionDelegate:](v3->_timeView, "setSelectionDelegate:", v3);
    v16 = -[_UIDatePickerOverlayPresentation initWithSourceView:]([_UIDatePickerOverlayPresentation alloc], "initWithSourceView:", v3);
    presentation = v3->_presentation;
    v3->_presentation = v16;

    -[_UIDatePickerOverlayPresentation setIgnoresPassthroughOnSourceView:](v3->_presentation, "setIgnoresPassthroughOnSourceView:", 1);
    -[_UIDatePickerOverlayPresentation setAlignment:](v3->_presentation, "setAlignment:", -[UIControl effectiveContentHorizontalAlignment](v3, "effectiveContentHorizontalAlignment"));
    -[_UIDatePickerOverlayPresentation setDelegate:](v3->_presentation, "setDelegate:", v3);
    -[_UIDatePickerCompactDateLabel setOverlayPresentation:](v3->_dateView, "setOverlayPresentation:", v3->_presentation);
    -[_UIDatePickerCompactTimeLabel setOverlayPresentation:](v3->_timeView, "setOverlayPresentation:", v3->_presentation);
    v18 = objc_opt_new();
    timeViewLayoutGuide = v3->_timeViewLayoutGuide;
    v3->_timeViewLayoutGuide = (UILayoutGuide *)v18;

    -[UIView addLayoutGuide:](v3, "addLayoutGuide:", v3->_timeViewLayoutGuide);
    v20 = objc_opt_new();
    contentLayoutGuide = v3->_contentLayoutGuide;
    v3->_contentLayoutGuide = (UILayoutGuide *)v20;

    -[UIView addLayoutGuide:](v3, "addLayoutGuide:", v3->_contentLayoutGuide);
    -[_UIDatePickerIOSCompactView _updateDateBeforeTimeValue](v3, "_updateDateBeforeTimeValue");
    -[UIView setNeedsUpdateConstraints](v3, "setNeedsUpdateConstraints");
    v22 = -[UIPanGestureRecognizer initWithTarget:action:]([UIPanGestureRecognizer alloc], "initWithTarget:action:", v3, sel__didReceivePanGestureRecognizer_);
    panGestureRecognizer = v3->_panGestureRecognizer;
    v3->_panGestureRecognizer = v22;

    -[UIPanGestureRecognizer setDelegate:](v3->_panGestureRecognizer, "setDelegate:", v3);
    -[UIView addGestureRecognizer:](v3, "addGestureRecognizer:", v3->_panGestureRecognizer);
    v28[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[UIView registerForTraitChanges:withAction:](v3, "registerForTraitChanges:withAction:", v24, sel__contentSizeCategoryDidChange_previousTraits_);

  }
  return v3;
}

- (void)willMoveToWindow:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIDatePickerIOSCompactView;
  -[UIView willMoveToWindow:](&v5, sel_willMoveToWindow_);
  if (!a3)
    -[_UIDatePickerIOSCompactView _resignActiveComponentAnimated:](self, "_resignActiveComponentAnimated:", 0);
}

- (void)willMoveToSuperview:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIDatePickerIOSCompactView;
  -[UIView willMoveToSuperview:](&v5, sel_willMoveToSuperview_);
  if (!a3)
    -[_UIDatePickerIOSCompactView _resignActiveComponentAnimated:](self, "_resignActiveComponentAnimated:", 0);
}

- (void)_contentSizeCategoryDidChange:(id)a3 previousTraits:(id)a4
{
  id v5;
  void *v6;
  NSString *v7;
  int IsAccessibilityCategory;
  NSString *v9;

  v5 = a4;
  -[UIView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v7);

  objc_msgSend(v5, "preferredContentSizeCategory");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = UIContentSizeCategoryIsAccessibilityCategory(v9);
  if (IsAccessibilityCategory != (_DWORD)v5)
    -[UIView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)_updateDateBeforeTimeValue
{
  NSDateFormatter *v3;
  NSDateFormatter *layoutFormatter;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t v19;
  void *v20;
  BOOL v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!self->_layoutFormatter)
  {
    v3 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    layoutFormatter = self->_layoutFormatter;
    self->_layoutFormatter = v3;

  }
  -[_UIDatePickerDataModel effectiveLocale](self->_data, "effectiveLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter setLocale:](self->_layoutFormatter, "setLocale:", v5);

  -[_UIDatePickerDataModel effectiveCalendar](self->_data, "effectiveCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter setCalendar:](self->_layoutFormatter, "setCalendar:", v6);

  -[_UIDatePickerDataModel timeZone](self->_data, "timeZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter setTimeZone:](self->_layoutFormatter, "setTimeZone:", v7);

  -[NSDateFormatter setLocalizedDateFormatFromTemplate:](self->_layoutFormatter, "setLocalizedDateFormatFromTemplate:", CFSTR("jy"));
  -[NSDateFormatter dateFormat](self->_layoutFormatter, "dateFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3578], "_componentsFromFormatString:");
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v21 = 0;
    v11 = *(_QWORD *)v23;
    v12 = *MEMORY[0x1E0C99730];
    v13 = *MEMORY[0x1E0C99740];
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v15, "objectForKeyedSubscript:", v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "BOOLValue");

        if ((v17 & 1) == 0)
        {
          objc_msgSend(v15, "objectForKeyedSubscript:", v13);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "characterAtIndex:", 0) - 72;
          if (v19 <= 0x31)
          {
            if (v19 == 49)
            {
              v21 = 1;
            }
            else if (((1 << v19) & 0x900000009) != 0)
            {
              if (self->_dateOnLeadingSide != v21)
                -[UIView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
              self->_dateOnLeadingSide = v21;

              goto LABEL_20;
            }
          }

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_20:

}

- (void)_updateUI
{
  NSDateFormatter *v3;
  NSDateFormatter *dateFormatterMedium;
  void *v5;
  void *v6;
  void *v7;
  NSDateFormatter *v8;
  NSDateFormatter *dateFormatterShort;
  void *v10;
  void *v11;
  void *v12;
  NSDateFormatter *v13;
  void *v14;
  void *v15;
  NSDateFormatter *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _UIDatePickerCompactTimeLabel *timeView;
  void *v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  if (!self->_dateFormatterMedium)
  {
    v3 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    dateFormatterMedium = self->_dateFormatterMedium;
    self->_dateFormatterMedium = v3;

    -[NSDateFormatter setDateStyle:](self->_dateFormatterMedium, "setDateStyle:", 2);
    -[NSDateFormatter setTimeStyle:](self->_dateFormatterMedium, "setTimeStyle:", 0);
    -[NSDateFormatter setFormattingContext:](self->_dateFormatterMedium, "setFormattingContext:", 2);
  }
  -[_UIDatePickerDataModel effectiveLocale](self->_data, "effectiveLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter setLocale:](self->_dateFormatterMedium, "setLocale:", v5);

  -[_UIDatePickerDataModel effectiveCalendar](self->_data, "effectiveCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter setCalendar:](self->_dateFormatterMedium, "setCalendar:", v6);

  -[_UIDatePickerDataModel timeZone](self->_data, "timeZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter setTimeZone:](self->_dateFormatterMedium, "setTimeZone:", v7);

  if (!self->_dateFormatterShort)
  {
    v8 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    dateFormatterShort = self->_dateFormatterShort;
    self->_dateFormatterShort = v8;

    -[NSDateFormatter setDateStyle:](self->_dateFormatterShort, "setDateStyle:", 1);
    -[NSDateFormatter setTimeStyle:](self->_dateFormatterShort, "setTimeStyle:", 0);
    -[NSDateFormatter setFormattingContext:](self->_dateFormatterShort, "setFormattingContext:", 2);
  }
  -[_UIDatePickerDataModel effectiveLocale](self->_data, "effectiveLocale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter setLocale:](self->_dateFormatterShort, "setLocale:", v10);

  -[_UIDatePickerDataModel effectiveCalendar](self->_data, "effectiveCalendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter setCalendar:](self->_dateFormatterShort, "setCalendar:", v11);

  -[_UIDatePickerDataModel timeZone](self->_data, "timeZone");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter setTimeZone:](self->_dateFormatterShort, "setTimeZone:", v12);

  v13 = self->_dateFormatterMedium;
  -[_UIDatePickerDataModel effectiveDate](self->_data, "effectiveDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter stringForObjectValue:](v13, "stringForObjectValue:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v15;
  v16 = self->_dateFormatterShort;
  -[_UIDatePickerDataModel effectiveDate](self->_data, "effectiveDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter stringForObjectValue:](v16, "stringForObjectValue:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerIOSCompactView dateView](self, "dateView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTitles:", v19);

  -[_UIDatePickerCompactTimeLabel setTapInteractionControlledExternally:](self->_timeView, "setTapInteractionControlledExternally:", (*(_BYTE *)&self->_flags >> 1) & 1);
  -[_UIDatePickerCompactDateLabel setTapInteractionControlledExternally:](self->_dateView, "setTapInteractionControlledExternally:", (*(_BYTE *)&self->_flags >> 1) & 1);
  -[UIGestureRecognizer setEnabled:](self->_panGestureRecognizer, "setEnabled:", (*(_BYTE *)&self->_flags & 2) == 0);
  -[_UIDatePickerIOSCompactView _reloadTimeViewTimeFormat](self, "_reloadTimeViewTimeFormat");
  timeView = self->_timeView;
  -[_UIDatePickerDataModel effectiveDate](self->_data, "effectiveDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerCompactTimeLabel reloadWithDate:](timeView, "reloadWithDate:", v22);

  -[_UIDatePickerIOSCompactView _updateEnabledStyling](self, "_updateEnabledStyling");
}

- (void)_updateEnabledStyling
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = *(_BYTE *)&self->_flags & 1;
  -[_UIDatePickerIOSCompactView timeView](self, "timeView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

  -[_UIDatePickerIOSCompactView dateView](self, "dateView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v3);

  -[UIView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", v3);
}

- (void)_updateDateViewTextAlignment
{
  UIControlContentHorizontalAlignment v3;
  uint64_t v4;
  unint64_t v5;
  id v6;

  v3 = -[UIControl effectiveContentHorizontalAlignment](self, "effectiveContentHorizontalAlignment");
  v4 = 1;
  v5 = *((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000;
  switch(v3)
  {
    case UIControlContentHorizontalAlignmentLeft:
      v4 = 0;
      break;
    case UIControlContentHorizontalAlignmentRight:
      v4 = 2;
      break;
    case UIControlContentHorizontalAlignmentLeading:
      v4 = v5 >> 18;
      break;
    case UIControlContentHorizontalAlignmentTrailing:
      v4 = (v5 >> 18) ^ 2;
      break;
    default:
      break;
  }
  -[_UIDatePickerIOSCompactView dateView](self, "dateView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextAlignment:", v4);

}

- (BOOL)alignConstraintsToLayoutGuide
{
  return 0;
}

- (void)tintColorDidChange
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIDatePickerIOSCompactView;
  -[UIView tintColorDidChange](&v5, sel_tintColorDidChange);
  -[_UIDatePickerIOSCompactView _updateEnabledStyling](self, "_updateEnabledStyling");
  -[UIView tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerOverlayPresentation activeDatePicker](self->_presentation, "activeDatePicker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTintColor:", v3);

}

- (void)updateConstraints
{
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  int *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  NSArray *dateTimeConstraints;
  _UIDatePickerCompactDateLabel **p_dateView;
  _UIDatePickerCompactTimeLabel **p_timeView;
  void *v22;
  NSString *v23;
  _BOOL4 IsAccessibilityCategory;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
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
  _BOOL4 v41;
  BOOL v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  double v56;
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
  NSArray *v69;
  NSArray *v70;
  void *v71;
  _QWORD *v72;
  NSArray *v73;
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
  _UIDatePickerCompactTimeLabel *timeView;
  void *v93;
  void *v94;
  double v95;
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
  double v108;
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
  double v119;
  void *v120;
  void *v121;
  void *v122;
  _QWORD *v123;
  void *v124;
  void *v125;
  double v126;
  void *v127;
  void *v128;
  uint64_t v129;
  void *v130;
  void *v131;
  double v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  double v137;
  void *v138;
  void *v139;
  void **v140;
  void *v141;
  id *v142;
  id v143;
  id v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  uint64_t v154;
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
  _UIDatePickerCompactDateLabel **v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  _UIDatePickerCompactTimeLabel **v202;
  void *v203;
  void *v204;
  objc_super v205;
  _QWORD v206[2];
  _QWORD v207[2];
  _QWORD v208[2];
  _QWORD v209[2];
  _QWORD v210[3];
  _QWORD v211[3];
  _QWORD v212[4];
  _QWORD v213[4];
  _QWORD v214[4];
  _QWORD v215[6];
  _QWORD v216[6];
  _QWORD v217[3];
  _QWORD v218[3];
  _QWORD v219[5];
  _QWORD v220[5];
  _QWORD v221[4];
  _QWORD v222[4];
  _QWORD v223[6];
  _QWORD v224[7];

  v224[5] = *MEMORY[0x1E0C80C00];
  v205.receiver = self;
  v205.super_class = (Class)_UIDatePickerIOSCompactView;
  -[UIView updateConstraints](&v205, sel_updateConstraints);
  if (self->_dateTimeConstraints)
    objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = objc_claimAutoreleasedReturnValue();
  -[UIView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDatePicker _styleForIdiom:](UIDatePicker, "_styleForIdiom:", objc_msgSend(v4, "userInterfaceIdiom"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "compactLabelButtonSpacing");
  v7 = v6;
  v8 = &OBJC_IVAR___UITableView__dragSourceDelegate;
  v204 = (void *)v3;
  v179 = v5;
  switch(-[_UIDatePickerDataModel datePickerMode](self->_data, "datePickerMode"))
  {
    case 0:
      -[UIView removeFromSuperview](self->_dateView, "removeFromSuperview");
      -[UIView addSubview:](self, "addSubview:", self->_timeView);
      -[_UIDatePickerCompactTimeLabel setAdjustsFontSizeToFitWidth:](self->_timeView, "setAdjustsFontSizeToFitWidth:", 1);
      -[_UIDatePickerCompactTimeLabel setMinimumScaleFactor:](self->_timeView, "setMinimumScaleFactor:", 0.8);
      -[UIView topAnchor](self->_timeView, "topAnchor");
      v200 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide topAnchor](self->_contentLayoutGuide, "topAnchor");
      v194 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v200, "constraintEqualToAnchor:", v194);
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      v213[0] = v190;
      -[UIView bottomAnchor](self->_timeView, "bottomAnchor");
      v186 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide bottomAnchor](self->_contentLayoutGuide, "bottomAnchor");
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v186, "constraintEqualToAnchor:", v180);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v213[1] = v9;
      -[UIView leadingAnchor](self->_timeView, "leadingAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide leadingAnchor](self->_contentLayoutGuide, "leadingAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "constraintEqualToAnchor:", v11);
      v12 = (void *)v3;
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v213[2] = v13;
      -[UIView trailingAnchor](self->_timeView, "trailingAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide trailingAnchor](self->_contentLayoutGuide, "trailingAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "constraintEqualToAnchor:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v213[3] = v16;
      v17 = (void *)MEMORY[0x1E0C99D20];
      v18 = v213;
      goto LABEL_11;
    case 1:
      -[UIView addSubview:](self, "addSubview:", self->_dateView);
      -[UIView removeFromSuperview](self->_timeView, "removeFromSuperview");
      -[_UIDatePickerCompactDateLabel setAdjustsFontSizeToFitWidth:](self->_dateView, "setAdjustsFontSizeToFitWidth:", 1);
      -[_UIDatePickerCompactDateLabel setMinimumScaleFactor:](self->_dateView, "setMinimumScaleFactor:", 0.8);
      -[_UIDatePickerIOSCompactView _updateDateViewTextAlignment](self, "_updateDateViewTextAlignment");
      -[UIView topAnchor](self->_dateView, "topAnchor");
      v200 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide topAnchor](self->_contentLayoutGuide, "topAnchor");
      v194 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v200, "constraintEqualToAnchor:", v194);
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      v214[0] = v190;
      -[UIView bottomAnchor](self->_dateView, "bottomAnchor");
      v186 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide bottomAnchor](self->_contentLayoutGuide, "bottomAnchor");
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v186, "constraintEqualToAnchor:", v180);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v214[1] = v9;
      -[UIView leadingAnchor](self->_dateView, "leadingAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide leadingAnchor](self->_contentLayoutGuide, "leadingAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "constraintEqualToAnchor:", v11);
      v12 = (void *)v3;
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v214[2] = v13;
      -[UIView trailingAnchor](self->_dateView, "trailingAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide trailingAnchor](self->_contentLayoutGuide, "trailingAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "constraintEqualToAnchor:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v214[3] = v16;
      v17 = (void *)MEMORY[0x1E0C99D20];
      v18 = v214;
      goto LABEL_11;
    case 2:
      p_dateView = &self->_dateView;
      -[UIView addSubview:](self, "addSubview:", self->_dateView);
      p_timeView = &self->_timeView;
      -[UIView addSubview:](self, "addSubview:", self->_timeView);
      -[_UIDatePickerCompactDateLabel setAdjustsFontSizeToFitWidth:](self->_dateView, "setAdjustsFontSizeToFitWidth:", 0);
      -[_UIDatePickerCompactDateLabel setMinimumScaleFactor:](self->_dateView, "setMinimumScaleFactor:", 0.0);
      -[_UIDatePickerCompactTimeLabel setAdjustsFontSizeToFitWidth:](self->_timeView, "setAdjustsFontSizeToFitWidth:", 0);
      -[_UIDatePickerCompactTimeLabel setMinimumScaleFactor:](self->_timeView, "setMinimumScaleFactor:", 0.0);
      -[_UIDatePickerIOSCompactView _updateDateViewTextAlignment](self, "_updateDateViewTextAlignment");
      -[UIView traitCollection](self, "traitCollection");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "preferredContentSizeCategory");
      v23 = (NSString *)objc_claimAutoreleasedReturnValue();
      IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v23);

      if (IsAccessibilityCategory)
      {
        switch(-[UIControl contentHorizontalAlignment](self, "contentHorizontalAlignment"))
        {
          case UIControlContentHorizontalAlignmentCenter:
          case UIControlContentHorizontalAlignmentFill:
            -[UIView centerXAnchor](*p_dateView, "centerXAnchor");
            v157 = (void *)objc_claimAutoreleasedReturnValue();
            -[UILayoutGuide centerXAnchor](self->_contentLayoutGuide, "centerXAnchor");
            v154 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v157, "constraintEqualToAnchor:", v154);
            v191 = (void *)objc_claimAutoreleasedReturnValue();
            v223[0] = v191;
            -[UIView centerXAnchor](*p_timeView, "centerXAnchor");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[UILayoutGuide centerXAnchor](self->_contentLayoutGuide, "centerXAnchor");
            v181 = (void *)objc_claimAutoreleasedReturnValue();
            v187 = v25;
            objc_msgSend(v25, "constraintEqualToAnchor:", v181);
            v175 = (void *)objc_claimAutoreleasedReturnValue();
            v223[1] = v175;
            -[UIView leadingAnchor](*p_dateView, "leadingAnchor");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[UILayoutGuide leadingAnchor](self->_contentLayoutGuide, "leadingAnchor");
            v168 = (void *)objc_claimAutoreleasedReturnValue();
            v172 = v26;
            objc_msgSend(v26, "constraintGreaterThanOrEqualToAnchor:", v168);
            v164 = (void *)objc_claimAutoreleasedReturnValue();
            v223[2] = v164;
            -[UIView trailingAnchor](*p_dateView, "trailingAnchor");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[UILayoutGuide trailingAnchor](self->_contentLayoutGuide, "trailingAnchor");
            v28 = objc_claimAutoreleasedReturnValue();
            v160 = v27;
            objc_msgSend(v27, "constraintLessThanOrEqualToAnchor:", v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v223[3] = v29;
            -[UIView leadingAnchor](*p_timeView, "leadingAnchor");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            -[UILayoutGuide leadingAnchor](self->_contentLayoutGuide, "leadingAnchor");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "constraintGreaterThanOrEqualToAnchor:", v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v223[4] = v32;
            -[UIView trailingAnchor](*p_timeView, "trailingAnchor");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            -[UILayoutGuide trailingAnchor](self->_contentLayoutGuide, "trailingAnchor");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "constraintLessThanOrEqualToAnchor:", v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v223[5] = v35;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v223, 6);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v204, "addObjectsFromArray:", v36);

            v37 = (void *)v28;
            v38 = (void *)v154;

            p_timeView = &self->_timeView;
            v39 = v157;

            p_dateView = &self->_dateView;
            goto LABEL_37;
          case UIControlContentHorizontalAlignmentLeft:
            -[UIView rightAnchor](*p_dateView, "rightAnchor");
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            -[UILayoutGuide rightAnchor](self->_contentLayoutGuide, "rightAnchor");
            v118 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v117, "constraintEqualToAnchor:", v118);
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            LODWORD(v119) = 1132003328;
            objc_msgSend(v39, "setPriority:", v119);
            -[UIView leftAnchor](*p_dateView, "leftAnchor");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            -[UILayoutGuide leftAnchor](self->_contentLayoutGuide, "leftAnchor");
            v191 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "constraintEqualToAnchor:");
            v187 = (void *)objc_claimAutoreleasedReturnValue();
            v222[0] = v187;
            -[UIView rightAnchor](*p_dateView, "rightAnchor");
            v120 = (void *)objc_claimAutoreleasedReturnValue();
            -[UILayoutGuide rightAnchor](self->_contentLayoutGuide, "rightAnchor");
            v181 = v120;
            v175 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v120, "constraintLessThanOrEqualToAnchor:");
            v172 = (void *)objc_claimAutoreleasedReturnValue();
            v222[1] = v172;
            -[UIView leftAnchor](*p_timeView, "leftAnchor");
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            -[UILayoutGuide leftAnchor](self->_contentLayoutGuide, "leftAnchor");
            v164 = (void *)objc_claimAutoreleasedReturnValue();
            v168 = v121;
            objc_msgSend(v121, "constraintEqualToAnchor:", v164);
            v160 = (void *)objc_claimAutoreleasedReturnValue();
            v222[2] = v160;
            -[UIView rightAnchor](*p_timeView, "rightAnchor");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[UILayoutGuide rightAnchor](self->_contentLayoutGuide, "rightAnchor");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "constraintLessThanOrEqualToAnchor:", v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v222[3] = v30;
            v122 = (void *)MEMORY[0x1E0C99D20];
            v123 = v222;
            goto LABEL_32;
          case UIControlContentHorizontalAlignmentRight:
            -[UIView leftAnchor](*p_dateView, "leftAnchor");
            v124 = (void *)objc_claimAutoreleasedReturnValue();
            -[UILayoutGuide leftAnchor](self->_contentLayoutGuide, "leftAnchor");
            v125 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v124, "constraintEqualToAnchor:", v125);
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            LODWORD(v126) = 1132003328;
            objc_msgSend(v39, "setPriority:", v126);
            -[UIView leftAnchor](*p_dateView, "leftAnchor");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            -[UILayoutGuide leftAnchor](self->_contentLayoutGuide, "leftAnchor");
            v191 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "constraintGreaterThanOrEqualToAnchor:");
            v187 = (void *)objc_claimAutoreleasedReturnValue();
            v221[0] = v187;
            -[UIView rightAnchor](*p_dateView, "rightAnchor");
            v127 = (void *)objc_claimAutoreleasedReturnValue();
            -[UILayoutGuide rightAnchor](self->_contentLayoutGuide, "rightAnchor");
            v181 = v127;
            v175 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v127, "constraintEqualToAnchor:");
            v172 = (void *)objc_claimAutoreleasedReturnValue();
            v221[1] = v172;
            -[UIView leftAnchor](*p_timeView, "leftAnchor");
            v128 = (void *)objc_claimAutoreleasedReturnValue();
            -[UILayoutGuide leftAnchor](self->_contentLayoutGuide, "leftAnchor");
            v164 = (void *)objc_claimAutoreleasedReturnValue();
            v168 = v128;
            objc_msgSend(v128, "constraintGreaterThanOrEqualToAnchor:", v164);
            v160 = (void *)objc_claimAutoreleasedReturnValue();
            v221[2] = v160;
            -[UIView rightAnchor](*p_timeView, "rightAnchor");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[UILayoutGuide rightAnchor](self->_contentLayoutGuide, "rightAnchor");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "constraintEqualToAnchor:", v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v221[3] = v30;
            v122 = (void *)MEMORY[0x1E0C99D20];
            v123 = v221;
LABEL_32:
            v129 = 4;
            goto LABEL_36;
          case UIControlContentHorizontalAlignmentLeading:
            -[UIView trailingAnchor](*p_dateView, "trailingAnchor");
            v130 = (void *)objc_claimAutoreleasedReturnValue();
            -[UILayoutGuide trailingAnchor](self->_contentLayoutGuide, "trailingAnchor");
            v131 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v130, "constraintEqualToAnchor:", v131);
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            LODWORD(v132) = 1132003328;
            objc_msgSend(v39, "setPriority:", v132);
            -[UIView leadingAnchor](*p_dateView, "leadingAnchor");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            -[UILayoutGuide leadingAnchor](self->_contentLayoutGuide, "leadingAnchor");
            v191 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "constraintEqualToAnchor:");
            v187 = (void *)objc_claimAutoreleasedReturnValue();
            v220[0] = v187;
            -[UIView trailingAnchor](*p_dateView, "trailingAnchor");
            v133 = (void *)objc_claimAutoreleasedReturnValue();
            -[UILayoutGuide trailingAnchor](self->_contentLayoutGuide, "trailingAnchor");
            v181 = v133;
            v175 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v133, "constraintLessThanOrEqualToAnchor:");
            v172 = (void *)objc_claimAutoreleasedReturnValue();
            v220[1] = v172;
            v220[2] = v39;
            -[UIView leadingAnchor](*p_timeView, "leadingAnchor");
            v134 = (void *)objc_claimAutoreleasedReturnValue();
            -[UILayoutGuide leadingAnchor](self->_contentLayoutGuide, "leadingAnchor");
            v164 = (void *)objc_claimAutoreleasedReturnValue();
            v168 = v134;
            objc_msgSend(v134, "constraintEqualToAnchor:", v164);
            v160 = (void *)objc_claimAutoreleasedReturnValue();
            v220[3] = v160;
            -[UIView trailingAnchor](*p_timeView, "trailingAnchor");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[UILayoutGuide trailingAnchor](self->_contentLayoutGuide, "trailingAnchor");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "constraintLessThanOrEqualToAnchor:", v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v220[4] = v30;
            v122 = (void *)MEMORY[0x1E0C99D20];
            v123 = v220;
            goto LABEL_35;
          case UIControlContentHorizontalAlignmentTrailing:
            -[UIView leadingAnchor](*p_timeView, "leadingAnchor");
            v135 = (void *)objc_claimAutoreleasedReturnValue();
            -[UILayoutGuide leadingAnchor](self->_contentLayoutGuide, "leadingAnchor");
            v136 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v135, "constraintEqualToAnchor:", v136);
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            LODWORD(v137) = 1132003328;
            objc_msgSend(v39, "setPriority:", v137);
            -[UIView leadingAnchor](*p_dateView, "leadingAnchor");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            -[UILayoutGuide leadingAnchor](self->_contentLayoutGuide, "leadingAnchor");
            v191 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "constraintGreaterThanOrEqualToAnchor:");
            v187 = (void *)objc_claimAutoreleasedReturnValue();
            v219[0] = v187;
            -[UIView trailingAnchor](*p_dateView, "trailingAnchor");
            v138 = (void *)objc_claimAutoreleasedReturnValue();
            -[UILayoutGuide trailingAnchor](self->_contentLayoutGuide, "trailingAnchor");
            v181 = v138;
            v175 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v138, "constraintEqualToAnchor:");
            v172 = (void *)objc_claimAutoreleasedReturnValue();
            v219[1] = v172;
            v219[2] = v39;
            -[UIView leadingAnchor](*p_timeView, "leadingAnchor");
            v139 = (void *)objc_claimAutoreleasedReturnValue();
            -[UILayoutGuide leadingAnchor](self->_contentLayoutGuide, "leadingAnchor");
            v164 = (void *)objc_claimAutoreleasedReturnValue();
            v168 = v139;
            objc_msgSend(v139, "constraintGreaterThanOrEqualToAnchor:", v164);
            v160 = (void *)objc_claimAutoreleasedReturnValue();
            v219[3] = v160;
            -[UIView trailingAnchor](*p_timeView, "trailingAnchor");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[UILayoutGuide trailingAnchor](self->_contentLayoutGuide, "trailingAnchor");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "constraintEqualToAnchor:", v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v219[4] = v30;
            v122 = (void *)MEMORY[0x1E0C99D20];
            v123 = v219;
LABEL_35:
            v129 = 5;
LABEL_36:
            objc_msgSend(v122, "arrayWithObjects:count:", v123, v129);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v204, "addObjectsFromArray:", v31);
LABEL_37:

            break;
          default:
            break;
        }
        if (self->_dateOnLeadingSide)
          v140 = (void **)p_dateView;
        else
          v140 = (void **)p_timeView;
        v141 = *v140;
        if (self->_dateOnLeadingSide)
          v142 = (id *)p_timeView;
        else
          v142 = (id *)p_dateView;
        v143 = *v142;
        v144 = v141;
        objc_msgSend(v144, "topAnchor");
        v203 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILayoutGuide topAnchor](self->_contentLayoutGuide, "topAnchor");
        v199 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v203, "constraintEqualToAnchor:", v199);
        v193 = (void *)objc_claimAutoreleasedReturnValue();
        v218[0] = v193;
        objc_msgSend(v143, "topAnchor");
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v144, "bottomAnchor");
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v145, "constraintEqualToAnchor:constant:", v146, v7);
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        v218[1] = v147;
        objc_msgSend(v143, "bottomAnchor");
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILayoutGuide bottomAnchor](self->_contentLayoutGuide, "bottomAnchor");
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v148, "constraintEqualToAnchor:", v149);
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        v218[2] = v150;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v218, 3);
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v204, "addObjectsFromArray:", v151);

        v8 = &OBJC_IVAR___UITableView__dragSourceDelegate;
      }
      else
      {
        -[UIView topAnchor](*p_dateView, "topAnchor");
        v189 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILayoutGuide topAnchor](self->_contentLayoutGuide, "topAnchor");
        v183 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v189, "constraintEqualToAnchor:", v183);
        v177 = (void *)objc_claimAutoreleasedReturnValue();
        v224[0] = v177;
        -[UIView bottomAnchor](*p_dateView, "bottomAnchor");
        v173 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILayoutGuide bottomAnchor](self->_contentLayoutGuide, "bottomAnchor");
        v169 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v173, "constraintEqualToAnchor:", v169);
        v165 = (void *)objc_claimAutoreleasedReturnValue();
        v224[1] = v165;
        -[UIView topAnchor](*p_timeView, "topAnchor");
        v161 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILayoutGuide topAnchor](self->_contentLayoutGuide, "topAnchor");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v161, "constraintEqualToAnchor:", v74);
        v202 = &self->_timeView;
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v224[2] = v75;
        -[UIView bottomAnchor](self->_timeView, "bottomAnchor");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILayoutGuide bottomAnchor](self->_contentLayoutGuide, "bottomAnchor");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "constraintEqualToAnchor:", v77);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v224[3] = v78;
        v196 = &self->_dateView;
        -[UIView heightAnchor](self->_dateView, "heightAnchor");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView heightAnchor](self->_timeView, "heightAnchor");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "constraintEqualToAnchor:", v80);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v224[4] = v81;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v224, 5);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v204, "addObjectsFromArray:", v82);

        -[UILayoutGuide widthAnchor](self->_timeViewLayoutGuide, "widthAnchor");
        v184 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView widthAnchor](self->_timeView, "widthAnchor");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v184, "constraintEqualToAnchor:", v83);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v217[0] = v84;
        -[UILayoutGuide topAnchor](self->_timeViewLayoutGuide, "topAnchor");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView topAnchor](self->_timeView, "topAnchor");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "constraintEqualToAnchor:", v86);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v217[1] = v87;
        -[UILayoutGuide bottomAnchor](self->_timeViewLayoutGuide, "bottomAnchor");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView bottomAnchor](self->_timeView, "bottomAnchor");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "constraintEqualToAnchor:", v89);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        v217[2] = v90;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v217, 3);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v204, "addObjectsFromArray:", v91);

        timeView = self->_timeView;
        if (self->_dateOnLeadingSide)
        {
          -[UIView trailingAnchor](timeView, "trailingAnchor");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILayoutGuide trailingAnchor](self->_contentLayoutGuide, "trailingAnchor");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "constraintEqualToAnchor:", v94);
          v155 = (void *)objc_claimAutoreleasedReturnValue();

          LODWORD(v95) = 1132003328;
          objc_msgSend(v155, "setPriority:", v95);
          -[UILayoutGuide leadingAnchor](self->_timeViewLayoutGuide, "leadingAnchor");
          v185 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView trailingAnchor](*v196, "trailingAnchor");
          v178 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v185, "constraintEqualToAnchor:constant:", v178, v7);
          v174 = (void *)objc_claimAutoreleasedReturnValue();
          v216[0] = v174;
          -[UIView leadingAnchor](*v202, "leadingAnchor");
          v166 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIDatePickerCompactDateLabel backgroundView](*v196, "backgroundView");
          v170 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v170, "trailingAnchor");
          v162 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v166, "constraintEqualToAnchor:constant:", v162, v7);
          v158 = (void *)objc_claimAutoreleasedReturnValue();
          v216[1] = v158;
          -[UIView leadingAnchor](*v196, "leadingAnchor");
          v197 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILayoutGuide leadingAnchor](self->_contentLayoutGuide, "leadingAnchor");
          v152 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v197, "constraintEqualToAnchor:", v152);
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          v216[2] = v96;
          -[UIView trailingAnchor](*v202, "trailingAnchor");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILayoutGuide trailingAnchor](self->_contentLayoutGuide, "trailingAnchor");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "constraintLessThanOrEqualToAnchor:", v98);
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          v216[3] = v99;
          -[UILayoutGuide trailingAnchor](self->_timeViewLayoutGuide, "trailingAnchor");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILayoutGuide trailingAnchor](self->_contentLayoutGuide, "trailingAnchor");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "constraintLessThanOrEqualToAnchor:", v101);
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          v103 = v155;
          v216[4] = v102;
          v216[5] = v155;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v216, 6);
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v204, "addObjectsFromArray:", v104);

          v105 = v166;
        }
        else
        {
          -[UIView leadingAnchor](timeView, "leadingAnchor");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILayoutGuide leadingAnchor](self->_contentLayoutGuide, "leadingAnchor");
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v106, "constraintEqualToAnchor:", v107);
          v156 = (void *)objc_claimAutoreleasedReturnValue();

          LODWORD(v108) = 1132003328;
          objc_msgSend(v156, "setPriority:", v108);
          -[UIView leadingAnchor](*v196, "leadingAnchor");
          v185 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILayoutGuide trailingAnchor](self->_timeViewLayoutGuide, "trailingAnchor");
          v178 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v185, "constraintEqualToAnchor:constant:", v178, v7);
          v174 = (void *)objc_claimAutoreleasedReturnValue();
          v215[0] = v174;
          -[_UIDatePickerCompactDateLabel backgroundView](*v196, "backgroundView");
          v171 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v171, "leadingAnchor");
          v167 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView trailingAnchor](*v202, "trailingAnchor");
          v163 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v167, "constraintEqualToAnchor:constant:", v163, v7);
          v159 = (void *)objc_claimAutoreleasedReturnValue();
          v215[1] = v159;
          -[UIView trailingAnchor](*v196, "trailingAnchor");
          v198 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILayoutGuide trailingAnchor](self->_contentLayoutGuide, "trailingAnchor");
          v153 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v198, "constraintEqualToAnchor:", v153);
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          v215[2] = v109;
          -[UIView leadingAnchor](*v202, "leadingAnchor");
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILayoutGuide leadingAnchor](self->_contentLayoutGuide, "leadingAnchor");
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v110, "constraintGreaterThanOrEqualToAnchor:", v111);
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          v215[3] = v112;
          -[UILayoutGuide leadingAnchor](self->_timeViewLayoutGuide, "leadingAnchor");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILayoutGuide leadingAnchor](self->_contentLayoutGuide, "leadingAnchor");
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v113, "constraintGreaterThanOrEqualToAnchor:", v114);
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          v103 = v156;
          v215[4] = v115;
          v215[5] = v156;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v215, 6);
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v204, "addObjectsFromArray:", v116);

          v105 = v171;
        }

        v8 = &OBJC_IVAR___UITableView__dragSourceDelegate;
      }
      break;
    case 3:
      -[UIView removeFromSuperview](self->_dateView, "removeFromSuperview");
      -[UIView addSubview:](self, "addSubview:", self->_timeView);
      -[_UIDatePickerCompactTimeLabel setAdjustsFontSizeToFitWidth:](self->_timeView, "setAdjustsFontSizeToFitWidth:", 1);
      -[_UIDatePickerCompactTimeLabel setMinimumScaleFactor:](self->_timeView, "setMinimumScaleFactor:", 0.8);
      -[UIView topAnchor](self->_timeView, "topAnchor");
      v200 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide topAnchor](self->_contentLayoutGuide, "topAnchor");
      v194 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v200, "constraintEqualToAnchor:", v194);
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      v212[0] = v190;
      -[UIView bottomAnchor](self->_timeView, "bottomAnchor");
      v186 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide bottomAnchor](self->_contentLayoutGuide, "bottomAnchor");
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v186, "constraintEqualToAnchor:", v180);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v212[1] = v9;
      -[UIView leadingAnchor](self->_timeView, "leadingAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide leadingAnchor](self->_contentLayoutGuide, "leadingAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "constraintEqualToAnchor:", v11);
      v12 = (void *)v3;
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v212[2] = v13;
      -[UIView trailingAnchor](self->_timeView, "trailingAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide trailingAnchor](self->_contentLayoutGuide, "trailingAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "constraintEqualToAnchor:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v212[3] = v16;
      v17 = (void *)MEMORY[0x1E0C99D20];
      v18 = v212;
LABEL_11:
      objc_msgSend(v17, "arrayWithObjects:count:", v18, 4);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObjectsFromArray:", v40);

      v8 = &OBJC_IVAR___UITableView__dragSourceDelegate;
      break;
    default:
      dateTimeConstraints = self->_dateTimeConstraints;
      self->_dateTimeConstraints = 0;

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Unsupported mode for date picker style UIDatePickerStyleCompact."));
      break;
  }
  v41 = -[_UIDatePickerIOSCompactView alignConstraintsToLayoutGuide](self, "alignConstraintsToLayoutGuide");
  v42 = v41;
  -[_UIDatePickerOverlayPresentation setOverlayAnchor:](self->_presentation, "setOverlayAnchor:", v41);
  if (v42)
  {
    -[UIView layoutMarginsGuide](self, "layoutMarginsGuide");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "leadingAnchor");
    v192 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIView layoutMarginsGuide](self, "layoutMarginsGuide");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "trailingAnchor");
    v188 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIView layoutMarginsGuide](self, "layoutMarginsGuide");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "leftAnchor");
    v201 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIView layoutMarginsGuide](self, "layoutMarginsGuide");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "rightAnchor");
    v195 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIView layoutMarginsGuide](self, "layoutMarginsGuide");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "topAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIView layoutMarginsGuide](self, "layoutMarginsGuide");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "centerXAnchor");
    v182 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIView layoutMarginsGuide](self, "layoutMarginsGuide");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "centerYAnchor");
    v51 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[UIView leadingAnchor](self, "leadingAnchor");
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self, "trailingAnchor");
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leftAnchor](self, "leftAnchor");
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView rightAnchor](self, "rightAnchor");
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self, "topAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](self, "centerXAnchor");
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](self, "centerYAnchor");
    v51 = objc_claimAutoreleasedReturnValue();
  }
  v52 = v204;
  v53 = v8[696];
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v53), "topAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:", v48);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v56) = 1132003328;
  objc_msgSend(v55, "setPriority:", v56);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v53), "centerYAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v176 = (void *)v51;
  objc_msgSend(v57, "constraintEqualToAnchor:", v51);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v211[0] = v58;
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v53), "topAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintGreaterThanOrEqualToAnchor:", v48);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v211[1] = v60;
  v211[2] = v55;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v211, 3);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v204, "addObjectsFromArray:", v61);

  switch(-[UIControl effectiveContentHorizontalAlignment](self, "effectiveContentHorizontalAlignment"))
  {
    case UIControlContentHorizontalAlignmentCenter:
    case UIControlContentHorizontalAlignmentFill:
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v53), "leftAnchor");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "constraintGreaterThanOrEqualToAnchor:", v201);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v210[0] = v63;
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v53), "rightAnchor");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "constraintLessThanOrEqualToAnchor:", v195);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v210[1] = v65;
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v53), "centerXAnchor");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "constraintEqualToAnchor:", v182);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v210[2] = v67;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v210, 3);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v204, "arrayByAddingObjectsFromArray:", v68);
      v69 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v70 = self->_dateTimeConstraints;
      self->_dateTimeConstraints = v69;

      v52 = v204;
      goto LABEL_22;
    case UIControlContentHorizontalAlignmentLeft:
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v53), "leftAnchor");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "constraintEqualToAnchor:", v201);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v209[0] = v63;
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v53), "rightAnchor");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "constraintLessThanOrEqualToAnchor:", v195);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v209[1] = v65;
      v71 = (void *)MEMORY[0x1E0C99D20];
      v72 = v209;
      goto LABEL_21;
    case UIControlContentHorizontalAlignmentRight:
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v53), "leftAnchor");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "constraintGreaterThanOrEqualToAnchor:", v201);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v208[0] = v63;
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v53), "rightAnchor");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "constraintEqualToAnchor:", v195);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v208[1] = v65;
      v71 = (void *)MEMORY[0x1E0C99D20];
      v72 = v208;
      goto LABEL_21;
    case UIControlContentHorizontalAlignmentLeading:
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v53), "leadingAnchor");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "constraintEqualToAnchor:", v192);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v207[0] = v63;
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v53), "trailingAnchor");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "constraintLessThanOrEqualToAnchor:", v188);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v207[1] = v65;
      v71 = (void *)MEMORY[0x1E0C99D20];
      v72 = v207;
      goto LABEL_21;
    case UIControlContentHorizontalAlignmentTrailing:
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v53), "leadingAnchor");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "constraintGreaterThanOrEqualToAnchor:", v192);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v206[0] = v63;
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v53), "trailingAnchor");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "constraintEqualToAnchor:", v188);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v206[1] = v65;
      v71 = (void *)MEMORY[0x1E0C99D20];
      v72 = v206;
LABEL_21:
      objc_msgSend(v71, "arrayWithObjects:count:", v72, 2);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v204, "arrayByAddingObjectsFromArray:", v66);
      v73 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v67 = self->_dateTimeConstraints;
      self->_dateTimeConstraints = v73;
LABEL_22:

      break;
    default:
      break;
  }
  if (self->_dateTimeConstraints)
    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:");

}

- (void)_didReceivePanGestureRecognizer:(id)a3
{
  -[_UIDatePickerIOSCompactView _resignActiveComponentAnimated:](self, "_resignActiveComponentAnimated:", 1);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return self->_panGestureRecognizer != a3 || self->_activeComponent != 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return self->_panGestureRecognizer == a3;
}

- (void)compactTimeLabel:(id)a3 didSelectTime:(id)a4
{
  _UIDatePickerCalendarDay *v5;
  void *v6;
  void *v7;
  _UIDatePickerCalendarDay *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  void *v17;
  void *v18;
  id WeakRetained;
  void *v20;
  void *v21;
  _UIDatePickerCalendarDay *v22;
  id v23;

  v23 = a4;
  v5 = [_UIDatePickerCalendarDay alloc];
  -[_UIDatePickerDataModel effectiveDate](self->_data, "effectiveDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerDataModel effectiveCalendar](self->_data, "effectiveCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_UIDatePickerCalendarDay initWithDate:calendar:](v5, "initWithDate:calendar:", v6, v7);

  v22 = v8;
  -[_UIDatePickerCalendarDateComponent components](v8, "components");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "components");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9;
  v12 = (void *)objc_opt_new();
  for (i = 1; i != 64; ++i)
  {
    v14 = objc_msgSend(v11, "valueForComponent:", 1 << i);
    v15 = objc_msgSend(v10, "valueForComponent:", 1 << i);
    if (v14 != 0x7FFFFFFFFFFFFFFFLL && v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSDateComponents * _Nonnull _UIDatePickerCombinedDateComponents(NSDateComponents * _Nonnull __strong, NSDateComponents * _Nonnull __strong)");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("_UIDatePickerCalendarDateComponent.h"), 68, CFSTR("Error combining %@ and %@. Both components contain values for NSCalendarUnit %lu"), v11, v10, 1 << i);

LABEL_9:
      objc_msgSend(v12, "setValue:forComponent:", v14, 1 << i);
      continue;
    }
    if (v14 != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_9;
    v14 = v15;
    if (v15 != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_9;
  }

  -[_UIDatePickerDataModel effectiveCalendar](self->_data, "effectiveCalendar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCalendar:", v17);

  objc_msgSend(v12, "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerDataModel setDate:](self->_data, "setDate:", v18);
  WeakRetained = objc_loadWeakRetained((id *)&self->_datePicker);
  objc_msgSend(WeakRetained, "_emitValueChanged");

}

- (void)compactTimeLabelDidBeginEditing:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_datePicker);
  objc_msgSend(WeakRetained, "_emitBeginEditing");

}

- (void)compactTimeLabelDidEndEditing:(id)a3
{
  _UIDatePickerCompactTimeLabel *timeView;
  void *v5;
  id WeakRetained;

  timeView = self->_timeView;
  -[_UIDatePickerDataModel effectiveDate](self->_data, "effectiveDate", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerCompactTimeLabel reloadWithDate:](timeView, "reloadWithDate:", v5);

  WeakRetained = objc_loadWeakRetained((id *)&self->_datePicker);
  objc_msgSend(WeakRetained, "_emitEndEditing");

}

- (void)compactTimeLabelWillBecomeFirstResponder:(id)a3
{
  if (-[_UIDatePickerOverlayPresentation activeMode](self->_presentation, "activeMode", a3) == 2)
    -[_UIDatePickerOverlayPresentation dismissPresentationAnimated:](self->_presentation, "dismissPresentationAnimated:", 1);
}

- (BOOL)compactTimeLabel:(id)a3 shouldDismissForInteractionAtLocation:(CGPoint)a4
{
  void *v5;
  BOOL v6;
  id WeakRetained;
  void *v8;

  objc_msgSend(a3, "convertPoint:toView:", self, a4.x, a4.y);
  -[UIControl hitTest:withEvent:](self, "hitTest:withEvent:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = 1;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_datePicker);
    objc_msgSend(WeakRetained, "_compactStyleDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v8 == 0;

  }
  return v6;
}

- (void)compactDateLabelDidBeginEditing:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_datePicker);
  objc_msgSend(WeakRetained, "_emitBeginEditing");

}

- (void)compactDateLabelDidEndEditing:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_datePicker);
  objc_msgSend(WeakRetained, "_emitEndEditing");

}

- (id)createDatePickerForCompactTimeLabel:(id)a3
{
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;

  -[_UIDatePickerIOSCompactView data](self, "data", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createDatePickerRepresentingDataModelForMode:style:", 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_datePicker);
  objc_msgSend(WeakRetained, "tintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v7);

  return v5;
}

- (id)createDatePickerForCompactDateLabel:(id)a3
{
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  _QWORD v10[5];

  -[_UIDatePickerIOSCompactView data](self, "data", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createDatePickerRepresentingDataModelForMode:style:", 1, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_datePicker);
  objc_msgSend(WeakRetained, "tintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v7);

  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67___UIDatePickerIOSCompactView_createDatePickerForCompactDateLabel___block_invoke;
  v10[3] = &unk_1E16B2C10;
  v10[4] = self;
  +[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:forControlEvents:", v8, 0x2000);

  return v5;
}

- (void)didChangeCompactStyleDelegate
{
  id WeakRetained;
  char v4;
  char v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_datePicker);
  objc_msgSend(WeakRetained, "_compactStyleDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = 2;
    else
      v4 = 0;
    v5 = *(_BYTE *)&self->_flags & 0xFD | v4;
  }
  else
  {
    v5 = *(_BYTE *)&self->_flags & 0xFD;
  }
  *(_BYTE *)&self->_flags = v5;
  -[_UIDatePickerIOSCompactView _updateUI](self, "_updateUI");

}

- (void)_datePickerPresentation:(id)a3 didChangeActiveMode:(int64_t)a4
{
  int64_t v4;
  UIDatePicker **p_datePicker;
  void *v6;
  id v7;
  id WeakRetained;

  if (a4 == 1)
    v4 = 2;
  else
    v4 = a4 == 2;
  if (v4 != self->_activeComponent)
  {
    self->_activeComponent = v4;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
    {
      p_datePicker = &self->_datePicker;
      WeakRetained = objc_loadWeakRetained((id *)&self->_datePicker);
      objc_msgSend(WeakRetained, "_compactStyleDelegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_loadWeakRetained((id *)p_datePicker);
      objc_msgSend(v6, "_datePicker:didSelectComponent:", v7, v4);

    }
  }
}

- (void)setActiveComponent:(int64_t)a3
{
  uint64_t v3;

  if (self->_activeComponent != a3)
  {
    self->_activeComponent = a3;
    if (a3 == 2)
    {
      v3 = 576;
    }
    else
    {
      if (a3 != 1)
      {
        if (!a3)
          -[_UIDatePickerIOSCompactView _resignActiveComponentAnimated:](self, "_resignActiveComponentAnimated:", 1);
        return;
      }
      v3 = 568;
    }
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v3), "activateLabel");
  }
}

- (void)_resignActiveComponentAnimated:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  self->_activeComponent = 0;
  if (-[_UIDatePickerOverlayPresentation activeMode](self->_presentation, "activeMode"))
    -[_UIDatePickerOverlayPresentation dismissPresentationAnimated:](self->_presentation, "dismissPresentationAnimated:", v3);
}

- (NSDictionary)overrideAttributes
{
  return -[_UIDatePickerCompactDateLabel overrideAttributes](self->_dateView, "overrideAttributes");
}

- (void)setOverrideAttributes:(id)a3
{
  _UIDatePickerCompactDateLabel *dateView;
  id v5;

  dateView = self->_dateView;
  v5 = a3;
  -[_UIDatePickerCompactDateLabel setOverrideAttributes:](dateView, "setOverrideAttributes:", v5);
  -[_UIDatePickerCompactTimeLabel setOverrideAttributes:](self->_timeView, "setOverrideAttributes:", v5);

}

- (void)_reloadTimeViewTimeFormat
{
  _UIDatePickerCompactTimeLabel *timeView;
  void *v4;
  _BOOL8 v5;
  id WeakRetained;
  id v7;

  -[_UIDatePickerCalendarTimeLabel setMinuteInterval:](self->_timeView, "setMinuteInterval:", -[_UIDatePickerDataModel minuteInterval](self->_data, "minuteInterval"));
  -[_UIDatePickerCalendarTimeLabel setRoundsToMinuteInterval:](self->_timeView, "setRoundsToMinuteInterval:", -[_UIDatePickerDataModel roundsToMinuteInterval](self->_data, "roundsToMinuteInterval"));
  timeView = self->_timeView;
  -[_UIDatePickerDataModel effectiveCalendar](self->_data, "effectiveCalendar");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerDataModel effectiveLocale](self->_data, "effectiveLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_UIDatePickerDataModel followsSystemHourCycle](self->_data, "followsSystemHourCycle");
  WeakRetained = objc_loadWeakRetained((id *)&self->_datePicker);
  -[_UIDatePickerCompactTimeLabel reloadWithCalendar:locale:followsSystemHourCycle:displaysTimeZone:](timeView, "reloadWithCalendar:locale:followsSystemHourCycle:displaysTimeZone:", v7, v4, v5, objc_msgSend(WeakRetained, "_displaysTimeZone"));

}

- (void)setData:(id)a3
{
  _UIDatePickerDataModel *v5;
  uint64_t v6;
  id WeakRetained;
  _UIDatePickerDataModel *v8;

  v5 = (_UIDatePickerDataModel *)a3;
  if (self->_data != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_data, a3);
    if (-[_UIDatePickerIOSCompactView datePickerStyle](self, "datePickerStyle") == 2)
    {
      if (dyld_program_sdk_at_least())
        v6 = 5;
      else
        v6 = 4;
    }
    else
    {
      v6 = 5;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_datePicker);
    objc_msgSend(WeakRetained, "setContentHorizontalAlignment:", v6);

    -[_UIDatePickerIOSCompactView didChangeMinuteInterval](self, "didChangeMinuteInterval");
    -[_UIDatePickerIOSCompactView didChangeRoundsToMinuteInterval](self, "didChangeRoundsToMinuteInterval");
    -[_UIDatePickerIOSCompactView didChangeCompactStyleDelegate](self, "didChangeCompactStyleDelegate");
    -[_UIDatePickerIOSCompactView _updateUI](self, "_updateUI");
    v5 = v8;
  }

}

- (int64_t)datePickerStyle
{
  return 2;
}

- (void)didChangeMode
{
  -[_UIDatePickerIOSCompactView _updateUI](self, "_updateUI");
  -[UIView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  -[_UIDatePickerIOSCompactView _resignActiveComponentAnimated:](self, "_resignActiveComponentAnimated:", 1);
}

- (void)didChangeLocale
{
  void *v3;
  id v4;

  -[_UIDatePickerIOSCompactView _updateUI](self, "_updateUI");
  -[_UIDatePickerIOSCompactView _updateDateBeforeTimeValue](self, "_updateDateBeforeTimeValue");
  -[_UIDatePickerDataModel locale](self->_data, "locale");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerOverlayPresentation activeDatePicker](self->_presentation, "activeDatePicker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLocale:", v4);

}

- (void)didChangeTimeZone
{
  void *v3;
  id v4;

  -[_UIDatePickerIOSCompactView _updateUI](self, "_updateUI");
  -[_UIDatePickerIOSCompactView _updateDateBeforeTimeValue](self, "_updateDateBeforeTimeValue");
  -[_UIDatePickerDataModel timeZone](self->_data, "timeZone");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerOverlayPresentation activeDatePicker](self->_presentation, "activeDatePicker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimeZone:", v4);

}

- (void)didChangeCalendar
{
  void *v3;
  id v4;

  -[_UIDatePickerIOSCompactView _updateUI](self, "_updateUI");
  -[_UIDatePickerIOSCompactView _updateDateBeforeTimeValue](self, "_updateDateBeforeTimeValue");
  -[_UIDatePickerDataModel calendar](self->_data, "calendar");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerOverlayPresentation activeDatePicker](self->_presentation, "activeDatePicker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCalendar:", v4);

}

- (void)didChangeDateFrom:(id)a3 animated:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[_UIDatePickerDataModel effectiveDate](self->_data, "effectiveDate", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerIOSCompactView timeView](self, "timeView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTimeZoneReferenceDate:", v5);

  -[_UIDatePickerIOSCompactView _updateUI](self, "_updateUI");
  -[_UIDatePickerDataModel effectiveDate](self->_data, "effectiveDate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerOverlayPresentation activeDatePicker](self->_presentation, "activeDatePicker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDate:", v9);

}

- (void)displaySelectedDateAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[_UIDatePickerOverlayPresentation activeDatePicker](self->_presentation, "activeDatePicker");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerDataModel effectiveDate](self->_data, "effectiveDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDate:animated:", v5, v3);

}

- (void)didChangeMinimumDate
{
  void *v3;
  id v4;

  -[_UIDatePickerDataModel minimumDate](self->_data, "minimumDate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerOverlayPresentation activeDatePicker](self->_presentation, "activeDatePicker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMinimumDate:", v4);

}

- (void)didChangeMaximumDate
{
  void *v3;
  id v4;

  -[_UIDatePickerDataModel maximumDate](self->_data, "maximumDate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerOverlayPresentation activeDatePicker](self->_presentation, "activeDatePicker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMaximumDate:", v4);

}

- (void)didChangeMinuteInterval
{
  int64_t v3;
  void *v4;
  int64_t v5;
  id v6;

  v3 = -[_UIDatePickerDataModel minuteInterval](self->_data, "minuteInterval");
  -[_UIDatePickerIOSCompactView timeView](self, "timeView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMinuteInterval:", v3);

  v5 = -[_UIDatePickerDataModel minuteInterval](self->_data, "minuteInterval");
  -[_UIDatePickerOverlayPresentation activeDatePicker](self->_presentation, "activeDatePicker");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMinuteInterval:", v5);

}

- (void)didChangeRoundsToMinuteInterval
{
  _BOOL8 v3;
  void *v4;
  _BOOL8 v5;
  id v6;

  v3 = -[_UIDatePickerDataModel roundsToMinuteInterval](self->_data, "roundsToMinuteInterval");
  -[_UIDatePickerIOSCompactView timeView](self, "timeView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRoundsToMinuteInterval:", v3);

  v5 = -[_UIDatePickerDataModel roundsToMinuteInterval](self->_data, "roundsToMinuteInterval");
  -[_UIDatePickerOverlayPresentation activeDatePicker](self->_presentation, "activeDatePicker");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRoundsToMinuteInterval:", v5);

}

- (void)didReset
{
  -[_UIDatePickerIOSCompactView _updateUI](self, "_updateUI");
  -[_UIDatePickerIOSCompactView _updateDateBeforeTimeValue](self, "_updateDateBeforeTimeValue");
}

- (UIEdgeInsets)appliedInsetsToEdgeOfContent
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedWidth
{
  return 0;
}

- (BOOL)usesAutoLayout
{
  return 1;
}

- (void)_setEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
  -[_UIDatePickerIOSCompactView _updateEnabledStyling](self, "_updateEnabledStyling");
}

- (CGSize)_sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = *MEMORY[0x1E0C9D820];
  v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)defaultSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)hasDefaultSize
{
  return 0;
}

- (UIDatePicker)datePicker
{
  return (UIDatePicker *)objc_loadWeakRetained((id *)&self->_datePicker);
}

- (void)setDatePicker:(id)a3
{
  objc_storeWeak((id *)&self->_datePicker, a3);
}

- (_UIDatePickerDataModel)data
{
  return self->_data;
}

- (_UIDatePickerCompactDateLabel)dateView
{
  return self->_dateView;
}

- (_UIDatePickerCompactTimeLabel)timeView
{
  return self->_timeView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeView, 0);
  objc_storeStrong((id *)&self->_dateView, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_destroyWeak((id *)&self->_datePicker);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_presentation, 0);
  objc_storeStrong((id *)&self->_dateTimeConstraints, 0);
  objc_storeStrong((id *)&self->_layoutFormatter, 0);
  objc_storeStrong((id *)&self->_contentLayoutGuide, 0);
  objc_storeStrong((id *)&self->_timeViewLayoutGuide, 0);
  objc_storeStrong((id *)&self->_dateFormatterShort, 0);
  objc_storeStrong((id *)&self->_dateFormatterMedium, 0);
}

@end
