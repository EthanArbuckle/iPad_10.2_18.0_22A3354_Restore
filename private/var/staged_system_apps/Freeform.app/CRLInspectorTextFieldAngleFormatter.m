@implementation CRLInspectorTextFieldAngleFormatter

+ (CRLInspectorTextFieldAngleFormatter)sharedFormatter
{
  return (CRLInspectorTextFieldAngleFormatter *)+[CRLInspectorTextFieldNumberFormatter angleFormatter](CRLInspectorTextFieldNumberFormatter, "angleFormatter");
}

- (void)p_commonInitAngleFormatter
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("0.#°;-0.#°"), 0, 0));
  -[CRLInspectorTextFieldAngleFormatter crl_setFormat:](self, "crl_setFormat:", v4);

  self->_normalizesAngle = 1;
  -[CRLInspectorTextFieldAngleFormatter setMaximumFractionDigits:](self, "setMaximumFractionDigits:", 0);
}

- (CRLInspectorTextFieldAngleFormatter)initWithCoder:(id)a3
{
  CRLInspectorTextFieldAngleFormatter *v3;
  CRLInspectorTextFieldAngleFormatter *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLInspectorTextFieldAngleFormatter;
  v3 = -[CRLInspectorTextFieldClampNumberFormatter initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[CRLInspectorTextFieldAngleFormatter p_commonInitAngleFormatter](v3, "p_commonInitAngleFormatter");
  return v4;
}

- (CRLInspectorTextFieldAngleFormatter)init
{
  CRLInspectorTextFieldAngleFormatter *v2;
  CRLInspectorTextFieldAngleFormatter *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLInspectorTextFieldAngleFormatter;
  v2 = -[CRLInspectorTextFieldClampNumberFormatter init](&v5, "init");
  v3 = v2;
  if (v2)
    -[CRLInspectorTextFieldAngleFormatter p_commonInitAngleFormatter](v2, "p_commonInitAngleFormatter");
  return v3;
}

- (id)stringForObjectValue:(id)a3 originalValue:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  long double v13;
  NSNumber *v14;
  uint64_t v15;
  id v16;
  void *v17;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  objc_opt_class(NSNumber, v8);
  v10 = sub_100221D0C(v9, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "doubleValue");
    v14 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)fmod(v13, 360.0));
    v15 = objc_claimAutoreleasedReturnValue(v14);

    v6 = (id)v15;
  }
  v19.receiver = self;
  v19.super_class = (Class)CRLInspectorTextFieldAngleFormatter;
  v16 = -[CRLInspectorTextFieldClampNumberFormatter stringForObjectValue:originalValue:](&v19, "stringForObjectValue:originalValue:", v6, v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLInspectorTextFieldAngleFormatter;
  v4 = -[CRLInspectorTextFieldNumberFormatter copyWithZone:](&v6, "copyWithZone:", a3);
  objc_msgSend(v4, "setNormalizesAngle:", -[CRLInspectorTextFieldAngleFormatter normalizesAngle](self, "normalizesAngle"));
  return v4;
}

- (id)p_clampNumber:(id)a3 toMinimum:(id)a4 andMaximum:(id)a5 wasNumberClamped:(BOOL *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  long double v14;
  double v15;
  uint64_t v16;
  BOOL v17;
  id v18;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!-[CRLInspectorTextFieldAngleFormatter normalizesAngle](self, "normalizesAngle"))
  {
    v20.receiver = self;
    v20.super_class = (Class)CRLInspectorTextFieldAngleFormatter;
    v18 = -[CRLInspectorTextFieldClampNumberFormatter p_clampNumber:toMinimum:andMaximum:wasNumberClamped:](&v20, "p_clampNumber:toMinimum:andMaximum:wasNumberClamped:", v10, v11, v12, a6);
    v13 = (id)objc_claimAutoreleasedReturnValue(v18);
    goto LABEL_11;
  }
  v13 = v10;
  if (objc_msgSend(v13, "compare:", &off_1012CCA88) != (id)-1
    && objc_msgSend(v13, "compare:", &off_1012CCA98) != (id)1)
  {
    v17 = 0;
    if (!a6)
      goto LABEL_11;
LABEL_10:
    *a6 = v17;
    goto LABEL_11;
  }
  objc_msgSend(v13, "doubleValue");
  v15 = fmod(v14, 360.0);
  if (v15 < 0.0)
    v15 = v15 + 360.0;
  v16 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v15));

  v17 = 1;
  v13 = (id)v16;
  if (a6)
    goto LABEL_10;
LABEL_11:

  return v13;
}

- (id)crlaxLocalizedDescriptionFromValue:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  v5 = CRLAccessibilityStringsDictKey(CFSTR("angle.unit.degrees"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (v6)
  {
    objc_msgSend(v4, "crl_CGFloatValue");
    v8 = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v8));
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInspectorTextFieldAngleFormatter stringFromNumber:](self, "stringFromNumber:", v4));

  }
  return v9;
}

- (BOOL)normalizesAngle
{
  return self->_normalizesAngle;
}

- (void)setNormalizesAngle:(BOOL)a3
{
  self->_normalizesAngle = a3;
}

@end
