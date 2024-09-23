@implementation BSUIWeeklyProgressMetrics

+ (id)elementName
{
  return CFSTR("weekly-progress");
}

+ (void)registerAttributes
{
  BSUIAttributeCalendarData = (unsigned __int16)+[TUIAttributeRegistry registerCustomAttributeWithName:](TUIAttributeRegistry, "registerCustomAttributeWithName:", CFSTR("calendar-data"));
  BSUIAttributeCompletedTextColor = (unsigned __int16)+[TUIAttributeRegistry registerCustomAttributeWithName:](TUIAttributeRegistry, "registerCustomAttributeWithName:", CFSTR("completed-text-color"));
  BSUIAttributeFutureDayTextColor = (unsigned __int16)+[TUIAttributeRegistry registerCustomAttributeWithName:](TUIAttributeRegistry, "registerCustomAttributeWithName:", CFSTR("future-day-text-color"));
  BSUIAttributePreviousDayBorderColor = (unsigned __int16)+[TUIAttributeRegistry registerCustomAttributeWithName:](TUIAttributeRegistry, "registerCustomAttributeWithName:", CFSTR("previous-day-border-color"));
  BSUIAttributePreviousDayTextColor = (unsigned __int16)+[TUIAttributeRegistry registerCustomAttributeWithName:](TUIAttributeRegistry, "registerCustomAttributeWithName:", CFSTR("previous-day-text-color"));
}

+ (id)supportedAttributes
{
  if (qword_32C028 != -1)
    dispatch_once(&qword_32C028, &stru_2E4D30);
  return (id)qword_32C020;
}

+ (id)attributesKindMapping
{
  if (qword_32C038 != -1)
    dispatch_once(&qword_32C038, &stru_2E4D50);
  return (id)qword_32C030;
}

+ (unint64_t)defaultKindForAttribute:(unsigned __int16)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "attributesKindMapping"));
  if ((_DWORD)v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[TUIAttributeRegistry nameForAttribute:](TUIAttributeRegistry, "nameForAttribute:", v3));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));
    v7 = objc_msgSend(v6, "unsignedIntegerValue");

  }
  else
  {
    v7 = 0;
  }

  return (unint64_t)v7;
}

- (BSUIWeeklyProgressMetrics)initWithNode:(id)a3 attributes:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  BSUIWeeklyProgressMetrics *v10;
  uint64_t v11;
  uint64_t var0;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  double v25;
  double v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  UIColor *v32;
  UIColor *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  UIColor *v40;
  UIColor *v41;
  UIColor *v42;
  uint64_t v43;
  double v44;
  uint64_t v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  UIColor *v53;
  UIColor *v54;
  void *v55;
  uint64_t v56;
  _BOOL8 v57;
  double v58;
  NSArray *days;
  BSUIDynamicValue *lastVisibleProgressToday;
  UIColor *controlColor;
  UIColor *progressColor;
  UIColor *previousDayBackgroundColor;
  UIColor *textColor;
  UIColor *completedTextColor;
  UIColor *futureDayTextColor;
  UIColor *v67;
  UIColor *previousDayBorderColor;
  UIColor *v69;
  UIColor *previousDayTextColor;
  UIColor *v71;
  TUIFontSpec *fontSpec;
  id v73;
  uint64_t v74;
  NSNumber *spacerWidth;
  uint64_t v76;
  NSNumber *spacerHeight;
  NSNumber *axValue;
  NSNumber *v79;
  uint64_t v80;
  NSNumber *nightMode;
  uint64_t v82;
  NSNumber *rightToLeft;
  uint64_t v84;
  UIColor *backgroundColor;
  NSString *triggerName;
  NSString *v87;
  uint64_t v88;
  NSNumber *triggerDelay;
  char *v91;
  uint64_t v92;
  UIColor *v93;
  uint64_t v94;
  NSArray *v95;
  UIColor *v96;
  BSUIDynamicValue *v97;
  UIColor *v98;
  id v99;
  UIColor *v100;
  NSNumber *v101;
  NSString *v102;
  unsigned __int8 v103;
  BSUIDynamicValue *v104;
  id v105;
  void *v106;
  id v107;
  UIColor *v108;
  UIColor *v109;
  UIColor *v110;
  UIColor *v111;
  char *v112;
  NSArray *v113;
  uint64_t v114;
  UIColor *v115;
  void *v116;
  objc_super v117;

  v8 = a4;
  v9 = a5;
  v117.receiver = self;
  v117.super_class = (Class)BSUIWeeklyProgressMetrics;
  v10 = -[BSUIWeeklyProgressMetrics init](&v117, "init");
  if (!v10)
    goto LABEL_39;
  v11 = objc_opt_class(NSDictionary);
  var0 = a3.var0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForAttribute:node:", (unsigned __int16)BSUIAttributeCalendarData, a3.var0));
  v14 = BUDynamicCast(v11, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  v16 = objc_msgSend((id)objc_opt_class(v10), "parseCalendarData:", v15);
  v95 = (NSArray *)objc_claimAutoreleasedReturnValue(v16);
  v17 = objc_opt_class(NSNumber);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("runningStreak")));
  v19 = BUDynamicCast(v17, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v103 = objc_msgSend(v20, "BOOLValue");

  v21 = objc_opt_class(NSNumber);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("dailyReadingGoal")));
  v23 = BUDynamicCast(v21, v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v99 = objc_msgSend(v24, "integerValue");

  objc_msgSend(v8, "floatForAttribute:node:", (unsigned __int16)BSUIAttributeProgressToday, var0);
  v26 = v25;
  v27 = objc_opt_class(BSUIDynamicValue);
  v106 = v15;
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("dynamicProgressToday")));
  v29 = BUDynamicCast(v27, v28);
  v97 = (BSUIDynamicValue *)objc_claimAutoreleasedReturnValue(v29);

  v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "colorForAttribute:node:", (unsigned __int16)BSUIAttributeControlColor, var0));
  v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "colorForAttribute:node:", (unsigned __int16)BSUIAttributeProgressColor, var0));
  v92 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "colorForAttribute:node:", 30, var0));
  v94 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "colorForAttribute:node:", (unsigned __int16)BSUIAttributeTextColor, var0));
  v110 = (UIColor *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "colorForAttribute:node:", (unsigned __int16)BSUIAttributeCompletedTextColor, var0));
  v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fontSpecForNode:", var0));
  v32 = (UIColor *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "colorForAttribute:node:", (unsigned __int16)BSUIAttributeFutureDayTextColor, var0));
  v33 = (UIColor *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "colorForAttribute:node:", (unsigned __int16)BSUIAttributePreviousDayBorderColor, var0));
  v114 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "colorForAttribute:node:", (unsigned __int16)BSUIAttributePreviousDayTextColor, var0));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "environment"));
  v101 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v34, "contentSizeCategory")));

  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "environment"));
  v112 = (char *)objc_msgSend(v35, "style");

  v107 = v9;
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "environment"));
  v91 = (char *)objc_msgSend(v36, "layoutDirection");

  v102 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 142, var0));
  objc_msgSend(v8, "floatForAttribute:node:", 143, var0);
  v38 = v37;
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 144, var0));
  v105 = +[TUIBox triggerStateFromString:](TUIBox, "triggerStateFromString:", v39);

  v108 = (UIColor *)v30;
  if (!v30)
    v108 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", dbl_255CB0[v112 == (_BYTE *)&dword_0 + 2], 1.0));
  v40 = (UIColor *)v31;
  if (!v31)
    v40 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.615686275, 0.862745098, 1.0));
  v41 = (UIColor *)v92;
  v42 = (UIColor *)v94;
  if (v92)
  {
    if (v94)
      goto LABEL_16;
    if (v112 != (_BYTE *)&dword_0 + 2)
    {
LABEL_14:
      v43 = objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor", v91));
      goto LABEL_15;
    }
  }
  else
  {
    if (v112 != (_BYTE *)&dword_0 + 2)
    {
      v41 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.235294118, 0.235294118, 0.262745098, 0.3));
      if (v94)
        goto LABEL_16;
      goto LABEL_14;
    }
    v41 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.2, 1.0));
    if (v94)
      goto LABEL_16;
  }
  v43 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor", v91));
LABEL_15:
  v42 = (UIColor *)v43;
LABEL_16:
  if (v110)
  {
    if (v32)
      goto LABEL_18;
  }
  else
  {
    v110 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    if (v32)
    {
LABEL_18:
      if (!v33)
      {
        v44 = 0.0;
        if (v112 != (_BYTE *)&dword_0 + 2)
          goto LABEL_26;
        goto LABEL_24;
      }
      goto LABEL_27;
    }
  }
  if (v112 == (_BYTE *)&dword_0 + 2)
  {
    v32 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.301960784, 1.0));
    if (!v33)
    {
LABEL_24:
      v44 = 1.0;
LABEL_26:
      v33 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v44, 0.15, v91));
    }
  }
  else
  {
    v44 = 0.0;
    v32 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.2));
    if (!v33)
      goto LABEL_26;
  }
LABEL_27:
  v45 = v114;
  if (!v114)
  {
    if (v112 == (_BYTE *)&dword_0 + 2)
    {
      v46 = 0.45;
      v47 = 1.0;
    }
    else
    {
      v46 = 0.2;
      v47 = 0.0;
    }
    v45 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v47, v46, v91));
  }
  v115 = (UIColor *)v45;
  v48 = fmax(v26, 0.0);
  if (!v116 || (v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "font")), v49, !v49))
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec defaultFontSpec](TUIFontSpec, "defaultFontSpec", v91));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "fontSpecWithDesign:", UIFontDescriptorSystemDesignDefault));
    v52 = v8;
    v53 = v32;
    v54 = v42;
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "fontSpecWithWeight:", UIFontWeightSemibold));
    v93 = v40;
    v56 = objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "fontSpecWithPointSize:", 12.0));

    v42 = v54;
    v32 = v53;
    v8 = v52;

    v116 = (void *)v56;
    v40 = v93;
  }
  v57 = v112 == (_BYTE *)&dword_0 + 2;
  if ((unint64_t)-[NSNumber integerValue](v10->_axValue, "integerValue") <= 6)
    v58 = 12.0;
  else
    v58 = 6.0;
  days = v10->_days;
  v10->_days = v95;
  v113 = v95;

  v10->_isRunningStreak = v103;
  v10->_progressToday = v48;
  lastVisibleProgressToday = v10->_lastVisibleProgressToday;
  v10->_dailyReadingGoal = (int64_t)v99;
  v10->_lastVisibleProgressToday = v97;
  v104 = v97;

  controlColor = v10->_controlColor;
  v10->_controlColor = v108;
  v109 = v108;

  progressColor = v10->_progressColor;
  v10->_progressColor = v40;
  v100 = v40;

  previousDayBackgroundColor = v10->_previousDayBackgroundColor;
  v10->_previousDayBackgroundColor = v41;
  v98 = v41;

  textColor = v10->_textColor;
  v10->_textColor = v42;
  v96 = v42;

  completedTextColor = v10->_completedTextColor;
  v10->_completedTextColor = v110;
  v111 = v110;

  futureDayTextColor = v10->_futureDayTextColor;
  v10->_futureDayTextColor = v32;
  v67 = v32;

  previousDayBorderColor = v10->_previousDayBorderColor;
  v10->_previousDayBorderColor = v33;
  v69 = v33;

  previousDayTextColor = v10->_previousDayTextColor;
  v10->_previousDayTextColor = v115;
  v71 = v115;

  fontSpec = v10->_fontSpec;
  v10->_fontSpec = (TUIFontSpec *)v116;
  v73 = v116;

  v74 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v58));
  spacerWidth = v10->_spacerWidth;
  v10->_spacerWidth = (NSNumber *)v74;

  v76 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 3.0));
  spacerHeight = v10->_spacerHeight;
  v10->_spacerHeight = (NSNumber *)v76;

  axValue = v10->_axValue;
  v10->_axValue = v101;
  v79 = v101;

  v80 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v57));
  nightMode = v10->_nightMode;
  v10->_nightMode = (NSNumber *)v80;

  v82 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v91 == (_BYTE *)&dword_0 + 2));
  rightToLeft = v10->_rightToLeft;
  v10->_rightToLeft = (NSNumber *)v82;

  v84 = objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  backgroundColor = v10->_backgroundColor;
  v10->_backgroundColor = (UIColor *)v84;

  triggerName = v10->_triggerName;
  v10->_triggerName = v102;
  v87 = v102;

  v88 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v38));
  triggerDelay = v10->_triggerDelay;
  v10->_triggerDelay = (NSNumber *)v88;

  v10->_targetTriggerState = (unint64_t)v105;
  v9 = v107;
LABEL_39:

  return v10;
}

- (void)updateWithConfiguration:(id)a3 context:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  float v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;

  v5 = a3;
  v6 = objc_opt_class(UIColor);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "colorForKey:", CFSTR("control-color")));
  v8 = BUDynamicCast(v6, v7);
  v62 = (id)objc_claimAutoreleasedReturnValue(v8);

  v9 = objc_opt_class(UIColor);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "colorForKey:", CFSTR("progress-color")));
  v11 = BUDynamicCast(v9, v10);
  v57 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v12 = objc_opt_class(UIColor);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "colorForKey:", CFSTR("previous-day-background-color")));
  v14 = BUDynamicCast(v12, v13);
  v56 = (void *)objc_claimAutoreleasedReturnValue(v14);

  v15 = objc_opt_class(UIColor);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "colorForKey:", CFSTR("previous-day-border-color")));
  v17 = BUDynamicCast(v15, v16);
  v61 = (void *)objc_claimAutoreleasedReturnValue(v17);

  v18 = objc_opt_class(UIColor);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "colorForKey:", CFSTR("text-color")));
  v20 = BUDynamicCast(v18, v19);
  v60 = (void *)objc_claimAutoreleasedReturnValue(v20);

  v21 = objc_opt_class(UIColor);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "colorForKey:", CFSTR("completed-text-color")));
  v23 = BUDynamicCast(v21, v22);
  v59 = (void *)objc_claimAutoreleasedReturnValue(v23);

  v24 = objc_opt_class(UIColor);
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "colorForKey:", CFSTR("previous-day-text-color")));
  v26 = BUDynamicCast(v24, v25);
  v58 = (void *)objc_claimAutoreleasedReturnValue(v26);

  v27 = objc_opt_class(UIColor);
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "colorForKey:", CFSTR("future-day-text-color")));
  v29 = BUDynamicCast(v27, v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);

  v31 = objc_opt_class(UIColor);
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "colorForKey:", CFSTR("background-color")));
  v33 = BUDynamicCast(v31, v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue(v33);

  v35 = objc_opt_class(TUIFontSpec);
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fontSpecForKey:", CFSTR("font-spec")));
  v37 = BUDynamicCast(v35, v36);
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);

  v39 = objc_opt_class(NSNumber);
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataForKey:", CFSTR("progress-today")));
  v41 = BUDynamicCast(v39, v40);
  v42 = (void *)objc_claimAutoreleasedReturnValue(v41);

  v43 = objc_opt_class(NSNumber);
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataForKey:", CFSTR("spacer-width")));
  v45 = BUDynamicCast(v43, v44);
  v46 = (void *)objc_claimAutoreleasedReturnValue(v45);

  v47 = objc_opt_class(NSNumber);
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataForKey:", CFSTR("spacer-height")));
  v49 = BUDynamicCast(v47, v48);
  v50 = (void *)objc_claimAutoreleasedReturnValue(v49);

  v51 = objc_opt_class(NSDictionary);
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataForKey:", CFSTR("calendar-data")));

  v53 = BUDynamicCast(v51, v52);
  v54 = (void *)objc_claimAutoreleasedReturnValue(v53);

  if (v62)
    -[BSUIWeeklyProgressMetrics setControlColor:](self, "setControlColor:", v62);
  if (v57)
    -[BSUIWeeklyProgressMetrics setProgressColor:](self, "setProgressColor:", v57);
  if (v56)
    -[BSUIWeeklyProgressMetrics setPreviousDayBackgroundColor:](self, "setPreviousDayBackgroundColor:", v56);
  if (v61)
    -[BSUIWeeklyProgressMetrics setPreviousDayBorderColor:](self, "setPreviousDayBorderColor:");
  if (v60)
    -[BSUIWeeklyProgressMetrics setTextColor:](self, "setTextColor:");
  if (v59)
    -[BSUIWeeklyProgressMetrics setCompletedTextColor:](self, "setCompletedTextColor:");
  if (v58)
    -[BSUIWeeklyProgressMetrics setPreviousDayTextColor:](self, "setPreviousDayTextColor:");
  if (v30)
    -[BSUIWeeklyProgressMetrics setFutureDayTextColor:](self, "setFutureDayTextColor:", v30);
  if (v38)
    -[BSUIWeeklyProgressMetrics setFontSpec:](self, "setFontSpec:", v38);
  if (v42)
  {
    objc_msgSend(v42, "floatValue");
    -[BSUIWeeklyProgressMetrics setProgressToday:](self, "setProgressToday:", v55);
  }
  if (v46)
    -[BSUIWeeklyProgressMetrics setSpacerWidth:](self, "setSpacerWidth:", v46);
  if (v50)
    -[BSUIWeeklyProgressMetrics setSpacerHeight:](self, "setSpacerHeight:", v50);
  if (v54)
    -[BSUIWeeklyProgressMetrics parseCalendarData:](self, "parseCalendarData:", v54);
  if (v34)
    -[BSUIWeeklyProgressMetrics setBackgroundColor:](self, "setBackgroundColor:", v34);

}

+ (id)parseCalendarData:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  float v17;
  double v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  BSUIWeeklyProgressDay *v32;
  void *v34;
  id obj;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];

  v3 = a3;
  v4 = objc_opt_class(NSArray);
  v34 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("progressDays")));
  v6 = BUDynamicCast(v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v36 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v38;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v38 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v11);
        v13 = objc_opt_class(NSNumber);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("percentComplete")));
        v15 = BUDynamicCast(v13, v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        objc_msgSend(v16, "floatValue");
        v18 = v17;

        v19 = objc_opt_class(NSString);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("dayLabel")));
        v21 = BUDynamicCast(v19, v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

        v23 = objc_opt_class(NSNumber);
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("dayType")));
        v25 = BUDynamicCast(v23, v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
        v27 = objc_msgSend(v26, "integerValue");

        v28 = objc_opt_class(NSString);
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("dateShortString")));
        v30 = BUDynamicCast(v28, v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue(v30);

        v32 = -[BSUIWeeklyProgressDay initWithType:progress:text:dateShortString:]([BSUIWeeklyProgressDay alloc], "initWithType:progress:text:dateShortString:", v27, v22, v31, v18);
        objc_msgSend(v36, "addObject:", v32);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v9);
  }

  return v36;
}

- (void)parseCalendarData:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(self), "parseCalendarData:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[BSUIWeeklyProgressMetrics setDays:](self, "setDays:", v6);
  v7 = objc_opt_class(NSNumber);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("runningStreak")));
  v9 = BUDynamicCast(v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = objc_msgSend(v10, "BOOLValue");

  if (v11)
    -[BSUIWeeklyProgressMetrics setIsRunningStreak:](self, "setIsRunningStreak:", 1);
  v12 = objc_opt_class(BSUIDynamicValue);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dynamicProgressToday")));
  v14 = BUDynamicCast(v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  -[BSUIWeeklyProgressMetrics setLastVisibleProgressToday:](self, "setLastVisibleProgressToday:", v15);
  v16 = objc_opt_class(NSNumber);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dailyReadingGoal")));
  v18 = BUDynamicCast(v16, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

  if (v19)
    -[BSUIWeeklyProgressMetrics setDailyReadingGoal:](self, "setDailyReadingGoal:", objc_msgSend(v19, "integerValue"));
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_25470;
  v26 = sub_25480;
  v27 = 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_25488;
  v21[3] = &unk_2E4D78;
  v21[4] = &v22;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v23[5], "dateShortString"));
  -[BSUIWeeklyProgressMetrics setCurrentDayShortString:](self, "setCurrentDayShortString:", v20);

  _Block_object_dispose(&v22, 8);
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressMetrics days](self, "days"));
  v18 = -[BSUIWeeklyProgressMetrics isRunningStreak](self, "isRunningStreak");
  -[BSUIWeeklyProgressMetrics progressToday](self, "progressToday");
  v6 = v5;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressMetrics lastVisibleProgressToday](self, "lastVisibleProgressToday"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressMetrics controlColor](self, "controlColor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressMetrics progressColor](self, "progressColor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressMetrics previousDayBackgroundColor](self, "previousDayBackgroundColor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressMetrics textColor](self, "textColor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressMetrics completedTextColor](self, "completedTextColor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressMetrics futureDayTextColor](self, "futureDayTextColor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressMetrics previousDayBorderColor](self, "previousDayBorderColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressMetrics previousDayTextColor](self, "previousDayTextColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressMetrics fontSpec](self, "fontSpec"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressMetrics axValue](self, "axValue"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressMetrics nightMode](self, "nightMode"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressMetrics rightToLeft](self, "rightToLeft"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressMetrics triggerName](self, "triggerName"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressMetrics triggerDelay](self, "triggerDelay"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@(%p) days=%@ isRunningStreak=%d progressToday=%.1f lastVisibleProgressToday=%@ controlColor=%@ progressColor=%@ previousDayBackgroundColor=%@ textColor=%@ completedTextColor=%@ futureDayTextColor=%@ previousDayBorderColor=%@ previousDayTextColor=%@ fontSpec=%@ axValue=%@ nightMode=%@ rightToLeft=%@ triggerName:%@ triggerDelay:%@ triggerState: %ld >"), v20, self, v19, v18, v6, v26, v17, v25, v24, v23, v22, v16, v15, v7, v8,
                    v9,
                    v10,
                    v11,
                    v12,
                    v13,
                    -[BSUIWeeklyProgressMetrics targetTriggerState](self, "targetTriggerState")));

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v4 = a3;
  v5 = objc_opt_class(BSUIWeeklyProgressMetrics);
  v6 = BUDynamicCast(v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressMetrics days](self, "days"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "days"));
    if (objc_msgSend(v8, "isEqualToArray:", v9)
      && (v10 = -[BSUIWeeklyProgressMetrics isRunningStreak](self, "isRunningStreak"),
          v10 == objc_msgSend(v7, "isRunningStreak"))
      && (-[BSUIWeeklyProgressMetrics progressToday](self, "progressToday"),
          v12 = v11,
          objc_msgSend(v7, "progressToday"),
          v12 == v13))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressMetrics lastVisibleProgressToday](self, "lastVisibleProgressToday"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastVisibleProgressToday"));
      if (v14 == v15)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressMetrics fontSpec](self, "fontSpec"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fontSpec"));
        if (objc_msgSend(v18, "isEqual:", v19))
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressMetrics axValue](self, "axValue"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "axValue"));
          if (objc_msgSend(v20, "isEqualToNumber:", v21))
          {
            v28 = v20;
            v22 = objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressMetrics nightMode](self, "nightMode"));
            v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nightMode"));
            v29 = (void *)v22;
            v24 = (void *)v22;
            v25 = (void *)v23;
            if (objc_msgSend(v24, "isEqualToNumber:", v23))
            {
              v27 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressMetrics rightToLeft](self, "rightToLeft"));
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rightToLeft"));
              v16 = objc_msgSend(v27, "isEqualToNumber:", v26);

            }
            else
            {
              v16 = 0;
            }

            v20 = v28;
          }
          else
          {
            v16 = 0;
          }

        }
        else
        {
          v16 = 0;
        }

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (NSArray)days
{
  return self->_days;
}

- (void)setDays:(id)a3
{
  objc_storeStrong((id *)&self->_days, a3);
}

- (BOOL)isRunningStreak
{
  return self->_isRunningStreak;
}

- (void)setIsRunningStreak:(BOOL)a3
{
  self->_isRunningStreak = a3;
}

- (double)progressToday
{
  return self->_progressToday;
}

- (void)setProgressToday:(double)a3
{
  self->_progressToday = a3;
}

- (int64_t)dailyReadingGoal
{
  return self->_dailyReadingGoal;
}

- (void)setDailyReadingGoal:(int64_t)a3
{
  self->_dailyReadingGoal = a3;
}

- (BSUIDynamicValue)lastVisibleProgressToday
{
  return self->_lastVisibleProgressToday;
}

- (void)setLastVisibleProgressToday:(id)a3
{
  objc_storeStrong((id *)&self->_lastVisibleProgressToday, a3);
}

- (NSString)currentDayShortString
{
  return self->_currentDayShortString;
}

- (void)setCurrentDayShortString:(id)a3
{
  objc_storeStrong((id *)&self->_currentDayShortString, a3);
}

- (UIColor)controlColor
{
  return self->_controlColor;
}

- (void)setControlColor:(id)a3
{
  objc_storeStrong((id *)&self->_controlColor, a3);
}

- (UIColor)progressColor
{
  return self->_progressColor;
}

- (void)setProgressColor:(id)a3
{
  objc_storeStrong((id *)&self->_progressColor, a3);
}

- (UIColor)previousDayBackgroundColor
{
  return self->_previousDayBackgroundColor;
}

- (void)setPreviousDayBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_previousDayBackgroundColor, a3);
}

- (UIColor)previousDayBorderColor
{
  return self->_previousDayBorderColor;
}

- (void)setPreviousDayBorderColor:(id)a3
{
  objc_storeStrong((id *)&self->_previousDayBorderColor, a3);
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_textColor, a3);
}

- (UIColor)completedTextColor
{
  return self->_completedTextColor;
}

- (void)setCompletedTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_completedTextColor, a3);
}

- (UIColor)previousDayTextColor
{
  return self->_previousDayTextColor;
}

- (void)setPreviousDayTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_previousDayTextColor, a3);
}

- (UIColor)futureDayTextColor
{
  return self->_futureDayTextColor;
}

- (void)setFutureDayTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_futureDayTextColor, a3);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (TUIFontSpec)fontSpec
{
  return self->_fontSpec;
}

- (void)setFontSpec:(id)a3
{
  objc_storeStrong((id *)&self->_fontSpec, a3);
}

- (NSNumber)spacerWidth
{
  return self->_spacerWidth;
}

- (void)setSpacerWidth:(id)a3
{
  objc_storeStrong((id *)&self->_spacerWidth, a3);
}

- (NSNumber)spacerHeight
{
  return self->_spacerHeight;
}

- (void)setSpacerHeight:(id)a3
{
  objc_storeStrong((id *)&self->_spacerHeight, a3);
}

- (NSNumber)axValue
{
  return self->_axValue;
}

- (NSNumber)nightMode
{
  return self->_nightMode;
}

- (NSNumber)rightToLeft
{
  return self->_rightToLeft;
}

- (NSString)triggerName
{
  return self->_triggerName;
}

- (NSNumber)triggerDelay
{
  return self->_triggerDelay;
}

- (unint64_t)targetTriggerState
{
  return self->_targetTriggerState;
}

- (void)setTargetTriggerState:(unint64_t)a3
{
  self->_targetTriggerState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerDelay, 0);
  objc_storeStrong((id *)&self->_triggerName, 0);
  objc_storeStrong((id *)&self->_rightToLeft, 0);
  objc_storeStrong((id *)&self->_nightMode, 0);
  objc_storeStrong((id *)&self->_axValue, 0);
  objc_storeStrong((id *)&self->_spacerHeight, 0);
  objc_storeStrong((id *)&self->_spacerWidth, 0);
  objc_storeStrong((id *)&self->_fontSpec, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_futureDayTextColor, 0);
  objc_storeStrong((id *)&self->_previousDayTextColor, 0);
  objc_storeStrong((id *)&self->_completedTextColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_previousDayBorderColor, 0);
  objc_storeStrong((id *)&self->_previousDayBackgroundColor, 0);
  objc_storeStrong((id *)&self->_progressColor, 0);
  objc_storeStrong((id *)&self->_controlColor, 0);
  objc_storeStrong((id *)&self->_currentDayShortString, 0);
  objc_storeStrong((id *)&self->_lastVisibleProgressToday, 0);
  objc_storeStrong((id *)&self->_days, 0);
}

@end
