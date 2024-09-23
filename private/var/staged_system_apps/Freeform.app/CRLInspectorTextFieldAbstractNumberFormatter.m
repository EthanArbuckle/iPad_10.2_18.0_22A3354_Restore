@implementation CRLInspectorTextFieldAbstractNumberFormatter

+ (id)formatter
{
  return objc_alloc_init((Class)objc_opt_class(a1, a2));
}

- (CRLInspectorTextFieldAbstractNumberFormatter)init
{
  CRLInspectorTextFieldAbstractNumberFormatter *v2;
  CRLInspectorTextFieldAbstractNumberFormatter *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLInspectorTextFieldAbstractNumberFormatter;
  v2 = -[CRLInspectorTextFieldAbstractNumberFormatter init](&v5, "init");
  v3 = v2;
  if (v2)
    -[CRLInspectorTextFieldAbstractNumberFormatter setRoundingMode:](v2, "setRoundingMode:", 6);
  return v3;
}

- (id)crlaxLocalizedDescriptionFromValue:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  void *v11;
  unint64_t mTSAXRulerUnitType;
  uint64_t v13;

  v4 = a3;
  v5 = v4;
  if (self->mTSAXValueFormat)
  {
    v6 = -[CRLInspectorTextFieldAbstractNumberFormatter copy](self, "copy");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAccessibilityValueFormat numberFormat](self->mTSAXValueFormat, "numberFormat"));
    objc_msgSend(v6, "crl_setFormat:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringFromNumber:", v5));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAccessibilityValueFormat unitStringsDictKey](self->mTSAXValueFormat, "unitStringsDictKey"));
    objc_msgSend(v5, "floatValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v8, v10));

  }
  else
  {
    mTSAXRulerUnitType = self->mTSAXRulerUnitType;
    if (mTSAXRulerUnitType == 5)
    {
      v13 = objc_claimAutoreleasedReturnValue(-[CRLInspectorTextFieldAbstractNumberFormatter stringFromNumber:](self, "stringFromNumber:", v4));
    }
    else
    {
      objc_msgSend(v4, "crl_CGFloatValue");
      v13 = objc_claimAutoreleasedReturnValue(+[CRLRulerUnitsAccessibility crlaxLocalizedDescriptionForUnits:value:](CRLRulerUnitsAccessibility, "crlaxLocalizedDescriptionForUnits:value:", mTSAXRulerUnitType));
    }
    v11 = (void *)v13;
  }

  return v11;
}

- (BOOL)inspectorTextFieldAllowsNilObjectValue
{
  return self->mInspectorTextFieldAllowsNilObjectValue;
}

- (void)setInspectorTextFieldAllowsNilObjectValue:(BOOL)a3
{
  self->mInspectorTextFieldAllowsNilObjectValue = a3;
}

- (CRLAccessibilityValueFormat)crlaxValueFormat
{
  return self->mTSAXValueFormat;
}

- (void)setCrlaxValueFormat:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)crlaxRulerUnitType
{
  return self->mTSAXRulerUnitType;
}

- (void)setCrlaxRulerUnitType:(unint64_t)a3
{
  self->mTSAXRulerUnitType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTSAXValueFormat, 0);
}

@end
