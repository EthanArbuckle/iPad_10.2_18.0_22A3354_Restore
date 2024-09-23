@implementation CRLInspectorTextFieldPercentFormatter

+ (CRLInspectorTextFieldPercentFormatter)sharedFormatter
{
  return (CRLInspectorTextFieldPercentFormatter *)+[CRLInspectorTextFieldNumberFormatter percentFormatter](CRLInspectorTextFieldNumberFormatter, "percentFormatter");
}

- (void)p_commonInitPercentFormatter
{
  -[CRLInspectorTextFieldPercentFormatter setNumberStyle:](self, "setNumberStyle:", 3);
  -[CRLInspectorTextFieldPercentFormatter setMultiplier:](self, "setMultiplier:", &off_1012CCA78);
}

- (CRLInspectorTextFieldPercentFormatter)initWithCoder:(id)a3
{
  CRLInspectorTextFieldPercentFormatter *v3;
  CRLInspectorTextFieldPercentFormatter *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLInspectorTextFieldPercentFormatter;
  v3 = -[CRLInspectorTextFieldClampNumberFormatter initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[CRLInspectorTextFieldPercentFormatter p_commonInitPercentFormatter](v3, "p_commonInitPercentFormatter");
  return v4;
}

- (CRLInspectorTextFieldPercentFormatter)init
{
  CRLInspectorTextFieldPercentFormatter *v2;
  CRLInspectorTextFieldPercentFormatter *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLInspectorTextFieldPercentFormatter;
  v2 = -[CRLInspectorTextFieldClampNumberFormatter init](&v5, "init");
  v3 = v2;
  if (v2)
    -[CRLInspectorTextFieldPercentFormatter p_commonInitPercentFormatter](v2, "p_commonInitPercentFormatter");
  return v3;
}

- (id)p_numberUnscaledWithMultiplerForNumber:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  double v12;
  double v13;
  double v14;
  id v15;
  void *v16;

  v4 = a3;
  objc_opt_class(NSNumber, v5);
  v7 = sub_100221D0C(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v9 = objc_claimAutoreleasedReturnValue(-[CRLInspectorTextFieldPercentFormatter multiplier](self, "multiplier"));
  v10 = (void *)v9;
  if (v8)
    v11 = v9 == 0;
  else
    v11 = 1;
  if (v11)
  {
    v15 = v8;
  }
  else
  {
    objc_msgSend(v8, "doubleValue");
    v13 = v12;
    objc_msgSend(v10, "doubleValue");
    v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v13 / v14));
  }
  v16 = v15;

  return v16;
}

- (id)p_numberScaledWithMultiplerForNumber:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  double v12;
  double v13;
  double v14;
  id v15;
  void *v16;

  v4 = a3;
  objc_opt_class(NSNumber, v5);
  v7 = sub_100221D0C(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v9 = objc_claimAutoreleasedReturnValue(-[CRLInspectorTextFieldPercentFormatter multiplier](self, "multiplier"));
  v10 = (void *)v9;
  if (v8)
    v11 = v9 == 0;
  else
    v11 = 1;
  if (v11)
  {
    v15 = v8;
  }
  else
  {
    objc_msgSend(v8, "doubleValue");
    v13 = v12;
    objc_msgSend(v10, "doubleValue");
    v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v13 * v14));
  }
  v16 = v15;

  return v16;
}

- (id)p_clampNumber:(id)a3 toMinimum:(id)a4 andMaximum:(id)a5 wasNumberClamped:(BOOL *)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  objc_super v17;

  v10 = a5;
  v11 = a4;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInspectorTextFieldPercentFormatter p_numberScaledWithMultiplerForNumber:](self, "p_numberScaledWithMultiplerForNumber:", a3));
  v17.receiver = self;
  v17.super_class = (Class)CRLInspectorTextFieldPercentFormatter;
  v13 = -[CRLInspectorTextFieldClampNumberFormatter p_clampNumber:toMinimum:andMaximum:wasNumberClamped:](&v17, "p_clampNumber:toMinimum:andMaximum:wasNumberClamped:", v12, v11, v10, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInspectorTextFieldPercentFormatter p_numberUnscaledWithMultiplerForNumber:](self, "p_numberUnscaledWithMultiplerForNumber:", v14));
  return v15;
}

- (id)stringForObjectValue:(id)a3
{
  _UNKNOWN **v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  float v14;
  id v15;
  void *v16;
  objc_super v18;

  v4 = (_UNKNOWN **)a3;
  objc_opt_class(NSNumber, v5);
  v7 = sub_100221D0C(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "doubleValue");
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInspectorTextFieldPercentFormatter multiplier](self, "multiplier"));
    objc_msgSend(v12, "doubleValue");
    *(float *)&v13 = v11 * v13;
    v14 = roundf(*(float *)&v13);

    if (v14 == 0.0 || fabsf(v14) < 0.01)
    {

      v4 = &off_1012CCA88;
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)CRLInspectorTextFieldPercentFormatter;
  v15 = -[CRLInspectorTextFieldClampNumberFormatter stringForObjectValue:](&v18, "stringForObjectValue:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  return v16;
}

@end
