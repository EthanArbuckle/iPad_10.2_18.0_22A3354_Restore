@implementation BSUIReadingGoalsGaugeMetrics

+ (id)elementName
{
  return CFSTR("reading-goals-gauge");
}

+ (void)registerAttributes
{
  BSUIAttributeControlColor = (unsigned __int16)+[TUIAttributeRegistry registerCustomAttributeWithName:](TUIAttributeRegistry, "registerCustomAttributeWithName:", CFSTR("control-color"));
  BSUIAttributeProgressColor = (unsigned __int16)+[TUIAttributeRegistry registerCustomAttributeWithName:](TUIAttributeRegistry, "registerCustomAttributeWithName:", CFSTR("progress-color"));
  BSUIAttributeNightMode = (unsigned __int16)+[TUIAttributeRegistry registerCustomAttributeWithName:](TUIAttributeRegistry, "registerCustomAttributeWithName:", CFSTR("night-mode"));
}

+ (id)supportedAttributes
{
  if (qword_32BF18 != -1)
    dispatch_once(&qword_32BF18, &stru_2E3F18);
  return (id)qword_32BF10;
}

+ (id)attributesKindMapping
{
  if (qword_32BF28 != -1)
    dispatch_once(&qword_32BF28, &stru_2E3F38);
  return (id)qword_32BF20;
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

- (BSUIReadingGoalsGaugeMetrics)initWithNode:(id)a3 attributes:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  BSUIReadingGoalsGaugeMetrics *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSString *v15;
  NSString *v16;
  UIColor *v17;
  UIColor *v18;
  void *v19;
  NSNumber *v20;
  void *v21;
  _BOOL8 v22;
  NSString *name;
  NSString *title;
  NSString *v25;
  UIColor *controlColor;
  UIColor *v27;
  UIColor *progressColor;
  UIColor *v29;
  NSNumber *axValue;
  NSNumber *v31;
  uint64_t v32;
  NSNumber *nightMode;
  CGFloat v34;
  float v35;
  NSString *v37;
  id v38;
  objc_super v39;

  v8 = a4;
  v9 = a5;
  v39.receiver = self;
  v39.super_class = (Class)BSUIReadingGoalsGaugeMetrics;
  v11 = -[BSUIReadingGoalsGaugeMetrics init](&v39, "init");
  if (v11)
  {
    v12 = objc_opt_class(NSString, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 137, a3.var0));
    v14 = BUDynamicCast(v12, v13);
    v15 = (NSString *)objc_claimAutoreleasedReturnValue(v14);

    v16 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 204, a3.var0));
    v17 = (UIColor *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "colorForAttribute:node:", (unsigned __int16)BSUIAttributeControlColor, a3.var0));
    v18 = (UIColor *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "colorForAttribute:node:", (unsigned __int16)BSUIAttributeProgressColor, a3.var0));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "environment"));
    v20 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v19, "contentSizeCategory")));

    v38 = v9;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "environment"));
    v22 = objc_msgSend(v21, "style") == (char *)&dword_0 + 2;

    name = v11->_name;
    v11->_name = v15;
    v37 = v15;

    title = v11->_title;
    v11->_title = v16;
    v25 = v16;

    controlColor = v11->_controlColor;
    v11->_controlColor = v17;
    v27 = v17;

    progressColor = v11->_progressColor;
    v11->_progressColor = v18;
    v29 = v18;

    axValue = v11->_axValue;
    v11->_axValue = v20;
    v31 = v20;

    v32 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v22));
    nightMode = v11->_nightMode;
    v11->_nightMode = (NSNumber *)v32;

    v9 = v38;
    v34 = COERCE_FLOAT(objc_msgSend(v8, "lengthForAttribute:node:", 223, a3.var0));
    v35 = COERCE_FLOAT(objc_msgSend(v8, "lengthForAttribute:node:", 98, a3.var0));
    v11->_size.width = v34;
    v11->_size.height = v35;
    -[BSUIReadingGoalsGaugeMetrics defaultsMissingMetrics](v11, "defaultsMissingMetrics");
  }

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[TUIDynamicProgress unregisterProgressObserver:](self->_readingProgress, "unregisterProgressObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)BSUIReadingGoalsGaugeMetrics;
  -[BSUIReadingGoalsGaugeMetrics dealloc](&v3, "dealloc");
}

- (void)updateWithConfiguration:(id)a3 context:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  _UNKNOWN **v31;
  _UNKNOWN **v32;
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
  id v43;

  v5 = a3;
  v43 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "colorForKey:", CFSTR("control-color")));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "colorForKey:", CFSTR("progress-color")));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataForKey:", CFSTR("current-reading-time")));
  v9 = objc_opt_class(NSNumber, v8);
  v11 = objc_opt_class(TUIDynamicValue, v10);
  v12 = BUDynamicCast(v11, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "value"));
  v15 = (void *)v14;
  v41 = (void *)v7;
  if (v14)
    v16 = v14;
  else
    v16 = v7;
  v17 = BUDynamicCast(v9, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  v19 = v18;
  v21 = objc_opt_class(NSNumber, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataForKey:", CFSTR("goal-reading-time")));
  v23 = BUDynamicCast(v21, v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

  v26 = objc_opt_class(NSNumber, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataForKey:", CFSTR("opacity")));
  v28 = BUDynamicCast(v26, v27);
  v29 = objc_claimAutoreleasedReturnValue(v28);
  v30 = (void *)v29;
  v31 = &off_2FBA08;
  if (v29)
    v31 = (_UNKNOWN **)v29;
  v32 = v31;

  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fontSpecForKey:", CFSTR("time-text-style")));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fontSpecForKey:", CFSTR("streak-day-text-style")));

  if (v43)
    -[BSUIReadingGoalsGaugeMetrics setControlColor:](self, "setControlColor:", v43);
  if (v6)
    -[BSUIReadingGoalsGaugeMetrics setProgressColor:](self, "setProgressColor:", v6);
  if (v19)
    -[BSUIReadingGoalsGaugeMetrics setActualReadingTimeSeconds:](self, "setActualReadingTimeSeconds:", v19);
  if (v24)
    -[BSUIReadingGoalsGaugeMetrics setReadingGoalSeconds:](self, "setReadingGoalSeconds:", v24);
  if (v33)
    -[BSUIReadingGoalsGaugeMetrics setTimeFontSpec:](self, "setTimeFontSpec:", v33);
  v42 = (void *)v6;
  if (v34)
    -[BSUIReadingGoalsGaugeMetrics setStreakFontSpec:](self, "setStreakFontSpec:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[BSUITemplate manager](BSUITemplate, "manager"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "dynamicRegistry"));

  v37 = (void *)objc_claimAutoreleasedReturnValue(+[BCReadingTimeToday kind](BCReadingTimeToday, "kind"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "progressProviderForKind:", v37));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "dynamicProgressForKind:instance:parameters:", v37, 0, 0));
  -[BSUIReadingGoalsGaugeMetrics setReadingProgress:](self, "setReadingProgress:", v39);

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIReadingGoalsGaugeMetrics readingProgress](self, "readingProgress"));
  objc_msgSend(v40, "registerProgressObserver:", self);

  -[BSUIReadingGoalsGaugeMetrics setOpacity:](self, "setOpacity:", v32);
}

- (void)defaultsMissingMetrics
{
  UIColor *v3;
  UIColor *controlColor;
  UIColor *v5;
  UIColor *progressColor;

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
}

- (BOOL)isAX
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIReadingGoalsGaugeMetrics axValue](self, "axValue"));
  v3 = (unint64_t)objc_msgSend(v2, "integerValue") > 7;

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  unsigned __int8 v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  unsigned __int8 v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  char v42;
  char v43;

  v4 = a3;
  v6 = objc_opt_class(BSUIReadingGoalsGaugeMetrics, v5);
  v7 = BUDynamicCast(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v10 = objc_opt_class(NSNumber, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "axValue"));
  v12 = BUDynamicCast(v10, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);

  v14 = objc_claimAutoreleasedReturnValue(-[BSUIReadingGoalsGaugeMetrics axValue](self, "axValue"));
  if (v14 | v13)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIReadingGoalsGaugeMetrics axValue](self, "axValue"));
    v16 = 0;
    if (v15 && v13)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIReadingGoalsGaugeMetrics axValue](self, "axValue"));
      v16 = objc_msgSend(v17, "isEqualToNumber:", v13);

    }
    v43 = v16;

  }
  else
  {
    v43 = 1;
  }

  v19 = objc_opt_class(NSNumber, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "nightMode"));
  v21 = BUDynamicCast(v19, v20);
  v22 = objc_claimAutoreleasedReturnValue(v21);

  v23 = objc_claimAutoreleasedReturnValue(-[BSUIReadingGoalsGaugeMetrics nightMode](self, "nightMode"));
  if (v23 | v22)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIReadingGoalsGaugeMetrics nightMode](self, "nightMode"));
    v25 = 0;
    if (v24 && v22)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIReadingGoalsGaugeMetrics nightMode](self, "nightMode"));
      v25 = objc_msgSend(v26, "isEqualToNumber:", v22);

    }
    v42 = v25;

  }
  else
  {
    v42 = 1;
  }

  v28 = objc_opt_class(NSNumber, v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "opacity"));
  v30 = BUDynamicCast(v28, v29);
  v31 = objc_claimAutoreleasedReturnValue(v30);

  v32 = objc_claimAutoreleasedReturnValue(-[BSUIReadingGoalsGaugeMetrics opacity](self, "opacity"));
  if (v32 | v31)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIReadingGoalsGaugeMetrics opacity](self, "opacity"));
    v34 = 0;
    if (v33 && v31)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIReadingGoalsGaugeMetrics opacity](self, "opacity"));
      v34 = objc_msgSend(v35, "isEqualToNumber:", v31);

    }
  }
  else
  {
    v34 = 1;
  }

  if (v8)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIReadingGoalsGaugeMetrics timeFontSpec](self, "timeFontSpec"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "timeFontSpec"));
    if (objc_msgSend(v36, "isEqual:", v37))
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIReadingGoalsGaugeMetrics streakFontSpec](self, "streakFontSpec"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "streakFontSpec"));
      if (objc_msgSend(v38, "isEqual:", v39))
        v40 = v43 & v42 & v34;
      else
        v40 = 0;

    }
    else
    {
      v40 = 0;
    }

  }
  else
  {
    v40 = 0;
  }

  return v40;
}

- (void)dynamicProgressChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "progress"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "progress"));
    objc_msgSend(v5, "doubleValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    -[BSUIReadingGoalsGaugeMetrics setActualReadingTimeSeconds:](self, "setActualReadingTimeSeconds:", v6);

  }
}

- (NSString)name
{
  return self->_name;
}

- (NSString)title
{
  return self->_title;
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

- (NSNumber)axValue
{
  return self->_axValue;
}

- (NSNumber)nightMode
{
  return self->_nightMode;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSNumber)actualReadingTimeSeconds
{
  return self->_actualReadingTimeSeconds;
}

- (void)setActualReadingTimeSeconds:(id)a3
{
  objc_storeStrong((id *)&self->_actualReadingTimeSeconds, a3);
}

- (NSNumber)readingGoalSeconds
{
  return self->_readingGoalSeconds;
}

- (void)setReadingGoalSeconds:(id)a3
{
  objc_storeStrong((id *)&self->_readingGoalSeconds, a3);
}

- (TUIFontSpec)timeFontSpec
{
  return self->_timeFontSpec;
}

- (void)setTimeFontSpec:(id)a3
{
  objc_storeStrong((id *)&self->_timeFontSpec, a3);
}

- (TUIFontSpec)streakFontSpec
{
  return self->_streakFontSpec;
}

- (void)setStreakFontSpec:(id)a3
{
  objc_storeStrong((id *)&self->_streakFontSpec, a3);
}

- (NSNumber)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(id)a3
{
  objc_storeStrong((id *)&self->_opacity, a3);
}

- (TUIDynamicProgress)readingProgress
{
  return self->_readingProgress;
}

- (void)setReadingProgress:(id)a3
{
  objc_storeStrong((id *)&self->_readingProgress, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readingProgress, 0);
  objc_storeStrong((id *)&self->_opacity, 0);
  objc_storeStrong((id *)&self->_streakFontSpec, 0);
  objc_storeStrong((id *)&self->_timeFontSpec, 0);
  objc_storeStrong((id *)&self->_readingGoalSeconds, 0);
  objc_storeStrong((id *)&self->_actualReadingTimeSeconds, 0);
  objc_storeStrong((id *)&self->_nightMode, 0);
  objc_storeStrong((id *)&self->_axValue, 0);
  objc_storeStrong((id *)&self->_progressColor, 0);
  objc_storeStrong((id *)&self->_controlColor, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
