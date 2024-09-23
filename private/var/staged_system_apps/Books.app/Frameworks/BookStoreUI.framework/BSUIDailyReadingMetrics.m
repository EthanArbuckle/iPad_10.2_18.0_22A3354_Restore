@implementation BSUIDailyReadingMetrics

+ (id)elementName
{
  return CFSTR("daily-reading");
}

+ (void)registerAttributes
{
  BSUIAttributeDailyReadingData = (unsigned __int16)+[TUIAttributeRegistry registerCustomAttributeWithName:](TUIAttributeRegistry, "registerCustomAttributeWithName:", CFSTR("daily-reading-data"));
  BSUIAttributeIconMode = (unsigned __int16)+[TUIAttributeRegistry registerCustomAttributeWithName:](TUIAttributeRegistry, "registerCustomAttributeWithName:", CFSTR("icon-mode"));
  BSUIAttributeDetailText = (unsigned __int16)+[TUIAttributeRegistry registerCustomAttributeWithName:](TUIAttributeRegistry, "registerCustomAttributeWithName:", CFSTR("detail-text"));
  BSUIAttributeTimeDisplayedText = (unsigned __int16)+[TUIAttributeRegistry registerCustomAttributeWithName:](TUIAttributeRegistry, "registerCustomAttributeWithName:", CFSTR("time-displayed-text"));
  BSUIAttributeReadingTime = (unsigned __int16)+[TUIAttributeRegistry registerCustomAttributeWithName:](TUIAttributeRegistry, "registerCustomAttributeWithName:", CFSTR("current-reading-time"));
  BSUIAttributeReadingGoal = (unsigned __int16)+[TUIAttributeRegistry registerCustomAttributeWithName:](TUIAttributeRegistry, "registerCustomAttributeWithName:", CFSTR("goal-reading-time"));
  BSUIAttributeProgressToday = (unsigned __int16)+[TUIAttributeRegistry registerCustomAttributeWithName:](TUIAttributeRegistry, "registerCustomAttributeWithName:", CFSTR("progress-today"));
  BSUIAttributeControlColor = (unsigned __int16)+[TUIAttributeRegistry registerCustomAttributeWithName:](TUIAttributeRegistry, "registerCustomAttributeWithName:", CFSTR("control-color"));
  BSUIAttributeProgressColor = (unsigned __int16)+[TUIAttributeRegistry registerCustomAttributeWithName:](TUIAttributeRegistry, "registerCustomAttributeWithName:", CFSTR("progress-color"));
  BSUIAttributeTextColor = (unsigned __int16)+[TUIAttributeRegistry registerCustomAttributeWithName:](TUIAttributeRegistry, "registerCustomAttributeWithName:", CFSTR("text-color"));
  BSUIAttributeNightMode = (unsigned __int16)+[TUIAttributeRegistry registerCustomAttributeWithName:](TUIAttributeRegistry, "registerCustomAttributeWithName:", CFSTR("night-mode"));
  BSUIAttributeRightToLeft = (unsigned __int16)+[TUIAttributeRegistry registerCustomAttributeWithName:](TUIAttributeRegistry, "registerCustomAttributeWithName:", CFSTR("right-to-left"));
}

+ (id)supportedAttributes
{
  if (qword_32BFC0 != -1)
    dispatch_once(&qword_32BFC0, &stru_2E47E0);
  return (id)qword_32BFB8;
}

+ (id)attributesKindMapping
{
  if (qword_32BFD0 != -1)
    dispatch_once(&qword_32BFD0, &stru_2E4800);
  return (id)qword_32BFC8;
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

- (BSUIDailyReadingMetrics)initWithNode:(id)a3 attributes:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  BSUIDailyReadingMetrics *v11;
  uint64_t v12;
  uint64_t var0;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  unsigned int v20;
  NSString *v21;
  NSString *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  NSString *name;
  uint64_t v36;
  NSNumber *readingGoalSeconds;
  uint64_t v38;
  NSNumber *actualReadingTimeSeconds;
  NSString *title;
  NSString *detailText;
  NSString *timeDisplayedText;
  UIColor *controlColor;
  UIColor *progressColor;
  UIColor *backgroundColor;
  UIColor *v46;
  UIColor *textColor;
  UIColor *v48;
  TUIFontSpec *timeFontSpec;
  TUIFontSpec *v50;
  uint64_t v51;
  NSNumber *progressBarWidth;
  NSNumber *axValue;
  NSNumber *v54;
  uint64_t v55;
  NSNumber *nightMode;
  uint64_t v57;
  NSNumber *rightToLeft;
  uint64_t v59;
  NSNumber *contentsScale;
  NSString *triggerName;
  NSString *v62;
  uint64_t v63;
  NSNumber *triggerDelay;
  NSString *timeSeparator;
  NSString *v67;
  NSString *v68;
  UIColor *v69;
  UIColor *v70;
  UIColor *v71;
  UIColor *v72;
  NSString *v73;
  UIColor *v74;
  _BOOL4 v75;
  uint64_t v76;
  NSString *v77;
  UIColor *v78;
  id v79;
  uint64_t v80;
  NSString *v81;
  _BOOL4 v82;
  NSNumber *v83;
  TUIFontSpec *v84;
  uint64_t v85;
  NSString *v86;
  NSString *v87;
  unsigned __int8 v88;
  objc_super v89;

  v8 = a4;
  v9 = a5;
  v89.receiver = self;
  v89.super_class = (Class)BSUIDailyReadingMetrics;
  v11 = -[BSUIDailyReadingMetrics init](&v89, "init");
  if (v11)
  {
    v12 = objc_opt_class(NSString, v10);
    var0 = a3.var0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 137, a3.var0));
    v15 = BUDynamicCast(v12, v14);
    v86 = (NSString *)objc_claimAutoreleasedReturnValue(v15);

    objc_msgSend(v8, "floatForAttribute:node:", (unsigned __int16)BSUIAttributeReadingGoal, var0);
    v76 = (uint64_t)fmax(v16, 0.0);
    objc_msgSend(v8, "floatForAttribute:node:", (unsigned __int16)BSUIAttributeReadingTime, var0);
    v80 = (uint64_t)fmax(v17, 0.0);
    objc_msgSend(v8, "floatForAttribute:node:", (unsigned __int16)BSUIAttributeProgressToday, var0);
    v19 = fmax(v18, 0.0);
    v20 = objc_msgSend(v8, "BOOLForAttribute:node:", (unsigned __int16)BSUIAttributeIconMode, var0);
    v21 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 204, var0));
    v22 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", (unsigned __int16)BSUIAttributeDetailText, var0));
    v67 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", (unsigned __int16)BSUIAttributeTimeDisplayedText, var0));
    v69 = (UIColor *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "colorForAttribute:node:", (unsigned __int16)BSUIAttributeControlColor, var0));
    v71 = (UIColor *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "colorForAttribute:node:", (unsigned __int16)BSUIAttributeProgressColor, var0));
    v74 = (UIColor *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "colorForAttribute:node:", 30, var0));
    v78 = (UIColor *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "colorForAttribute:node:", (unsigned __int16)BSUIAttributeTextColor, var0));
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fontSpecForNode:", var0));
    v24 = 8;
    if (v20)
      v24 = 3;
    v84 = (TUIFontSpec *)v23;
    v85 = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "environment"));
    v83 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v25, "contentSizeCategory")));

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "environment"));
    v82 = objc_msgSend(v26, "style") == (char *)&dword_0 + 2;

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "environment"));
    v75 = objc_msgSend(v27, "layoutDirection") == (char *)&dword_0 + 2;

    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "environment"));
    objc_msgSend(v28, "contentsScale");
    v30 = v29;

    v73 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 142, var0));
    objc_msgSend(v8, "floatForAttribute:node:", 143, var0);
    v32 = v31;
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 144, var0));
    v79 = +[TUIBox triggerStateFromString:](TUIBox, "triggerStateFromString:", v33);

    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "environment"));
    v88 = objc_msgSend(v34, "useFontFallback");

    name = v11->_name;
    v11->_name = v86;
    v87 = v86;

    v36 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v76));
    readingGoalSeconds = v11->_readingGoalSeconds;
    v11->_readingGoalSeconds = (NSNumber *)v36;

    v38 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v80));
    actualReadingTimeSeconds = v11->_actualReadingTimeSeconds;
    v11->_actualReadingTimeSeconds = (NSNumber *)v38;

    v11->_progressToday = v19;
    v11->_iconMode = v20;
    title = v11->_title;
    v11->_title = v21;
    v81 = v21;

    detailText = v11->_detailText;
    v11->_detailText = v22;
    v77 = v22;

    timeDisplayedText = v11->_timeDisplayedText;
    v11->_timeDisplayedText = v67;
    v68 = v67;

    controlColor = v11->_controlColor;
    v11->_controlColor = v69;
    v70 = v69;

    progressColor = v11->_progressColor;
    v11->_progressColor = v71;
    v72 = v71;

    backgroundColor = v11->_backgroundColor;
    v11->_backgroundColor = v74;
    v46 = v74;

    textColor = v11->_textColor;
    v11->_textColor = v78;
    v48 = v78;

    timeFontSpec = v11->_timeFontSpec;
    v11->_timeFontSpec = v84;
    v50 = v84;

    v51 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v85));
    progressBarWidth = v11->_progressBarWidth;
    v11->_progressBarWidth = (NSNumber *)v51;

    axValue = v11->_axValue;
    v11->_axValue = v83;
    v54 = v83;

    v55 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v82));
    nightMode = v11->_nightMode;
    v11->_nightMode = (NSNumber *)v55;

    v57 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v75));
    rightToLeft = v11->_rightToLeft;
    v11->_rightToLeft = (NSNumber *)v57;

    v59 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v30));
    contentsScale = v11->_contentsScale;
    v11->_contentsScale = (NSNumber *)v59;

    triggerName = v11->_triggerName;
    v11->_triggerName = v73;
    v62 = v73;

    v63 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v32));
    triggerDelay = v11->_triggerDelay;
    v11->_triggerDelay = (NSNumber *)v63;

    v11->_clockTicks = 0;
    timeSeparator = v11->_timeSeparator;
    v11->_targetTriggerState = (unint64_t)v79;
    v11->_timeSeparator = 0;

    v11->_useFontFallback = v88;
    -[BSUIDailyReadingMetrics defaultsMissingMetrics](v11, "defaultsMissingMetrics");
  }

  return v11;
}

- (void)updateWithConfiguration:(id)a3 context:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  _UNKNOWN **v48;
  _UNKNOWN **v49;
  void *v50;
  id v51;
  void *v52;
  float v53;
  unsigned int v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;

  v5 = a3;
  v7 = objc_opt_class(NSDictionary, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataForKey:", CFSTR("daily-reading-data")));
  v9 = BUDynamicCast(v7, v8);
  v61 = (id)objc_claimAutoreleasedReturnValue(v9);

  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataForKey:", CFSTR("current-reading-time")));
  v12 = objc_opt_class(NSNumber, v11);
  v14 = objc_opt_class(TUIDynamicValue, v13);
  v15 = BUDynamicCast(v14, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "value"));
  v18 = (void *)v17;
  v56 = (void *)v10;
  if (v17)
    v19 = v17;
  else
    v19 = v10;
  v20 = BUDynamicCast(v12, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

  v23 = objc_opt_class(NSNumber, v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataForKey:", CFSTR("goal-reading-time")));
  v25 = BUDynamicCast(v23, v24);
  v55 = (void *)objc_claimAutoreleasedReturnValue(v25);

  v26 = v21;
  v28 = objc_opt_class(NSNumber, v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataForKey:", CFSTR("progress-today")));
  v30 = BUDynamicCast(v28, v29);
  v60 = (void *)objc_claimAutoreleasedReturnValue(v30);

  v54 = objc_msgSend(v5, "BOOLForKey:", CFSTR("icon-mode"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "colorForKey:", CFSTR("control-color")));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "colorForKey:", CFSTR("progress-color")));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "colorForKey:", CFSTR("background-color")));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "colorForKey:", CFSTR("text-color")));
  v34 = objc_opt_class(NSNumber, v33);
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataForKey:", CFSTR("arc-width")));
  v36 = BUDynamicCast(v34, v35);
  v57 = (void *)objc_claimAutoreleasedReturnValue(v36);

  v38 = objc_opt_class(NSNumber, v37);
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataForKey:", CFSTR("progress-bar-width")));
  v40 = BUDynamicCast(v38, v39);
  v41 = (void *)objc_claimAutoreleasedReturnValue(v40);

  v43 = objc_opt_class(NSNumber, v42);
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataForKey:", CFSTR("opacity")));
  v45 = BUDynamicCast(v43, v44);
  v46 = objc_claimAutoreleasedReturnValue(v45);
  v47 = (void *)v46;
  v48 = &off_2FBA38;
  if (v46)
    v48 = (_UNKNOWN **)v46;
  v49 = v48;

  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fontSpecForKey:", CFSTR("time-text-style")));
  v51 = objc_msgSend(v5, "BOOLForKey:", CFSTR("clock-ticks"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringForKey:", CFSTR("time-separator")));

  if (v61)
    -[BSUIDailyReadingMetrics parseDailyReadingData:](self, "parseDailyReadingData:", v61);
  if (v55)
    -[BSUIDailyReadingMetrics setReadingGoalSeconds:](self, "setReadingGoalSeconds:", v55);
  if (v26)
    -[BSUIDailyReadingMetrics setActualReadingTimeSeconds:](self, "setActualReadingTimeSeconds:", v26);
  if (v60)
  {
    objc_msgSend(v60, "floatValue");
    -[BSUIDailyReadingMetrics setProgressToday:](self, "setProgressToday:", v53);
  }
  if (v54)
    -[BSUIDailyReadingMetrics configureIconMode:](self, "configureIconMode:", 1);
  if (v59)
    -[BSUIDailyReadingMetrics setControlColor:](self, "setControlColor:");
  if (v58)
    -[BSUIDailyReadingMetrics setProgressColor:](self, "setProgressColor:");
  if (v31)
    -[BSUIDailyReadingMetrics setBackgroundColor:](self, "setBackgroundColor:", v31);
  if (v32)
    -[BSUIDailyReadingMetrics setTextColor:](self, "setTextColor:", v32);
  -[BSUIDailyReadingMetrics setArcWidth:](self, "setArcWidth:", v57);
  if (v41)
    -[BSUIDailyReadingMetrics setProgressBarWidth:](self, "setProgressBarWidth:", v41);
  if (v50)
    -[BSUIDailyReadingMetrics setTimeFontSpec:](self, "setTimeFontSpec:", v50);
  -[BSUIDailyReadingMetrics setOpacity:](self, "setOpacity:", v49);
  -[BSUIDailyReadingMetrics setClockTicks:](self, "setClockTicks:", v51);
  -[BSUIDailyReadingMetrics setTimeSeparator:](self, "setTimeSeparator:", v52);

}

- (void)defaultsMissingMetrics
{
  UIColor *v3;
  UIColor *controlColor;
  UIColor *v5;
  UIColor *progressColor;
  UIColor *v7;
  UIColor *textColor;
  UIColor *v9;
  UIColor *backgroundColor;
  float v11;
  float v12;
  float v13;
  const __CFString *v14;
  TUIFontSpec *v15;
  TUIFontSpec *detailFontSpec;

  if (!self->_controlColor)
  {
    if (-[NSNumber BOOLValue](self->_nightMode, "BOOLValue"))
      v3 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0980392157, 0.0980392157, 0.0980392157, 1.0));
    else
      v3 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.933333333, 1.0));
    controlColor = self->_controlColor;
    self->_controlColor = v3;

  }
  if (!self->_progressColor)
  {
    v5 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.615686275, 0.862745098, 1.0));
    progressColor = self->_progressColor;
    self->_progressColor = v5;

  }
  if (!self->_textColor)
  {
    if (-[NSNumber BOOLValue](self->_nightMode, "BOOLValue"))
      v7 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    else
      v7 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    textColor = self->_textColor;
    self->_textColor = v7;

  }
  if (!self->_backgroundColor)
  {
    v9 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    backgroundColor = self->_backgroundColor;
    self->_backgroundColor = v9;

  }
  if (!self->_detailFontSpec)
  {
    -[NSNumber floatValue](self->_actualReadingTimeSeconds, "floatValue");
    v12 = v11;
    -[NSNumber floatValue](self->_readingGoalSeconds, "floatValue");
    if (v12 >= v13)
      v14 = CFSTR("SFProText-Semibold");
    else
      v14 = CFSTR("SFProText-Regular");
    v15 = (TUIFontSpec *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec fontSpecWithPostscriptName:size:](TUIFontSpec, "fontSpecWithPostscriptName:size:", v14, 15.0));
    detailFontSpec = self->_detailFontSpec;
    self->_detailFontSpec = v15;

  }
}

- (BOOL)isAX
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingMetrics axValue](self, "axValue"));
  v3 = (unint64_t)objc_msgSend(v2, "integerValue") > 7;

  return v3;
}

- (void)parseDailyReadingData:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;

  v24 = a3;
  v5 = objc_opt_class(BSUIDynamicValue, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("dynamicProgressToday")));
  v7 = BUDynamicCast(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
    objc_storeStrong((id *)&self->_lastVisibleProgressToday, v8);
  v10 = objc_opt_class(BSUIDynamicValue, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("streakDayGoal")));
  v12 = BUDynamicCast(v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  if (v13)
    objc_storeStrong((id *)&self->_dynamicStreakDayGoal, v13);
  v15 = objc_opt_class(BSUIDynamicValue, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("timeReadToday")));
  v17 = BUDynamicCast(v15, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  if (v18)
    objc_storeStrong((id *)&self->_dynamicTimeReadToday, v18);
  v20 = objc_opt_class(BSUIDynamicValue, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("completedReadingGoal")));
  v22 = BUDynamicCast(v20, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

  if (v23)
    objc_storeStrong((id *)&self->_dynamicCompletedReadingGoal, v23);

}

- (void)configureIconMode:(BOOL)a3
{
  uint64_t v4;
  NSNumber *v5;
  NSNumber *progressBarWidth;

  self->_iconMode = a3;
  if (a3)
    v4 = 3;
  else
    v4 = 8;
  v5 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v4));
  progressBarWidth = self->_progressBarWidth;
  self->_progressBarWidth = v5;

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
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
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
  void *v41;
  void *v42;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v41 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingMetrics name](self, "name"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[BSUIDailyReadingMetrics iconMode](self, "iconMode")));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingMetrics readingGoalSeconds](self, "readingGoalSeconds"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingMetrics actualReadingTimeSeconds](self, "actualReadingTimeSeconds"));
  -[BSUIDailyReadingMetrics progressToday](self, "progressToday");
  v6 = v5;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingMetrics lastVisibleProgressToday](self, "lastVisibleProgressToday"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingMetrics lastVisibleProgressToday](self, "lastVisibleProgressToday"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "value"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingMetrics dynamicStreakDayGoal](self, "dynamicStreakDayGoal"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingMetrics dynamicStreakDayGoal](self, "dynamicStreakDayGoal"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "value"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingMetrics dynamicTimeReadToday](self, "dynamicTimeReadToday"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingMetrics dynamicTimeReadToday](self, "dynamicTimeReadToday"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "value"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingMetrics dynamicCompletedReadingGoal](self, "dynamicCompletedReadingGoal"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingMetrics dynamicCompletedReadingGoal](self, "dynamicCompletedReadingGoal"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "value"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingMetrics title](self, "title"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingMetrics detailText](self, "detailText"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingMetrics timeDisplayedText](self, "timeDisplayedText"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingMetrics controlColor](self, "controlColor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingMetrics progressColor](self, "progressColor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingMetrics backgroundColor](self, "backgroundColor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingMetrics textColor](self, "textColor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingMetrics timeFontSpec](self, "timeFontSpec"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingMetrics arcWidth](self, "arcWidth"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingMetrics progressBarWidth](self, "progressBarWidth"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingMetrics axValue](self, "axValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingMetrics nightMode](self, "nightMode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingMetrics rightToLeft](self, "rightToLeft"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingMetrics triggerName](self, "triggerName"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingMetrics triggerDelay](self, "triggerDelay"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[BSUIDailyReadingMetrics targetTriggerState](self, "targetTriggerState")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingMetrics opacity](self, "opacity"));
  v21 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@(%p) n=%@ iconMode=%@ readingGoalSeconds=%@ actualReadingTimeSeconds=%@ progressToday=%.1f lastVisibleProgressToday=%@ [%@] dynamicStreakDayGoal=%@ [%@] dynamicTimeReadToday=%@ [%@] dynamicCompletedReadingGoal=%@ [%@] title=\"%@\" detailText=\"%@\" timeDisplayedText=\"%@\" controlColor=%@ progressColor=%@ backgroundColor=%@ textColor=%@ timeFontSpec=%@ arcWidth=%@ progressBarWidth=%@ axValue=%@ nightMode=%@ rightToLeft=%@ triggerName:%@ triggerDelay:%@ triggerState: %@ opacity: %@>"), v41, self, v42, v39, v40, v19, v6, v38, v37, v36, v33, v35, v18, v34, v32,
                v17,
                v31,
                v30,
                v29,
                v28,
                v27,
                v26,
                v25,
                v16,
                v15,
                v7,
                v8,
                v9,
                v10,
                v11,
                v12,
                v13));

  return v21;
}

- (NSNumber)readingGoalSeconds
{
  return self->_readingGoalSeconds;
}

- (void)setReadingGoalSeconds:(id)a3
{
  objc_storeStrong((id *)&self->_readingGoalSeconds, a3);
}

- (NSNumber)actualReadingTimeSeconds
{
  return self->_actualReadingTimeSeconds;
}

- (void)setActualReadingTimeSeconds:(id)a3
{
  objc_storeStrong((id *)&self->_actualReadingTimeSeconds, a3);
}

- (double)progressToday
{
  return self->_progressToday;
}

- (void)setProgressToday:(double)a3
{
  self->_progressToday = a3;
}

- (BSUIDynamicValue)lastVisibleProgressToday
{
  return self->_lastVisibleProgressToday;
}

- (BSUIDynamicValue)dynamicStreakDayGoal
{
  return self->_dynamicStreakDayGoal;
}

- (BSUIDynamicValue)dynamicTimeReadToday
{
  return self->_dynamicTimeReadToday;
}

- (BSUIDynamicValue)dynamicCompletedReadingGoal
{
  return self->_dynamicCompletedReadingGoal;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)iconMode
{
  return self->_iconMode;
}

- (void)setIconMode:(BOOL)a3
{
  self->_iconMode = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)detailText
{
  return self->_detailText;
}

- (void)setDetailText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)timeDisplayedText
{
  return self->_timeDisplayedText;
}

- (void)setTimeDisplayedText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
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

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_textColor, a3);
}

- (TUIFontSpec)timeFontSpec
{
  return self->_timeFontSpec;
}

- (void)setTimeFontSpec:(id)a3
{
  objc_storeStrong((id *)&self->_timeFontSpec, a3);
}

- (TUIFontSpec)titleFontSpec
{
  return self->_titleFontSpec;
}

- (TUIFontSpec)detailFontSpec
{
  return self->_detailFontSpec;
}

- (NSNumber)arcWidth
{
  return self->_arcWidth;
}

- (void)setArcWidth:(id)a3
{
  objc_storeStrong((id *)&self->_arcWidth, a3);
}

- (NSNumber)progressBarWidth
{
  return self->_progressBarWidth;
}

- (void)setProgressBarWidth:(id)a3
{
  objc_storeStrong((id *)&self->_progressBarWidth, a3);
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

- (NSNumber)contentsScale
{
  return self->_contentsScale;
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

- (BOOL)clockTicks
{
  return self->_clockTicks;
}

- (void)setClockTicks:(BOOL)a3
{
  self->_clockTicks = a3;
}

- (NSString)timeSeparator
{
  return self->_timeSeparator;
}

- (void)setTimeSeparator:(id)a3
{
  objc_storeStrong((id *)&self->_timeSeparator, a3);
}

- (NSNumber)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(id)a3
{
  objc_storeStrong((id *)&self->_opacity, a3);
}

- (BOOL)goalCompleted
{
  return self->_goalCompleted;
}

- (BOOL)useLargeLayoutMode
{
  return self->_useLargeLayoutMode;
}

- (void)setUseLargeLayoutMode:(BOOL)a3
{
  self->_useLargeLayoutMode = a3;
}

- (BOOL)useNarrowLayoutMode
{
  return self->_useNarrowLayoutMode;
}

- (void)setUseNarrowLayoutMode:(BOOL)a3
{
  self->_useNarrowLayoutMode = a3;
}

- (BOOL)useFontFallback
{
  return self->_useFontFallback;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_opacity, 0);
  objc_storeStrong((id *)&self->_timeSeparator, 0);
  objc_storeStrong((id *)&self->_triggerDelay, 0);
  objc_storeStrong((id *)&self->_triggerName, 0);
  objc_storeStrong((id *)&self->_contentsScale, 0);
  objc_storeStrong((id *)&self->_rightToLeft, 0);
  objc_storeStrong((id *)&self->_nightMode, 0);
  objc_storeStrong((id *)&self->_axValue, 0);
  objc_storeStrong((id *)&self->_progressBarWidth, 0);
  objc_storeStrong((id *)&self->_arcWidth, 0);
  objc_storeStrong((id *)&self->_detailFontSpec, 0);
  objc_storeStrong((id *)&self->_titleFontSpec, 0);
  objc_storeStrong((id *)&self->_timeFontSpec, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_progressColor, 0);
  objc_storeStrong((id *)&self->_controlColor, 0);
  objc_storeStrong((id *)&self->_timeDisplayedText, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_dynamicCompletedReadingGoal, 0);
  objc_storeStrong((id *)&self->_dynamicTimeReadToday, 0);
  objc_storeStrong((id *)&self->_dynamicStreakDayGoal, 0);
  objc_storeStrong((id *)&self->_lastVisibleProgressToday, 0);
  objc_storeStrong((id *)&self->_actualReadingTimeSeconds, 0);
  objc_storeStrong((id *)&self->_readingGoalSeconds, 0);
}

@end
