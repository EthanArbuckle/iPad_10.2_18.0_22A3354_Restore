@implementation CRLSecondsDurationFormatter

+ (CRLSecondsDurationFormatter)sharedFormatter
{
  return (CRLSecondsDurationFormatter *)+[CRLInspectorTextFieldNumberFormatter secondsFormatter](CRLInspectorTextFieldNumberFormatter, "secondsFormatter");
}

- (void)p_commonInitDurationFormatter
{
  void *v3;
  void *v4;
  CRLAccessibilityValueFormat *v5;
  void *v6;
  id v7;
  void *v8;
  CRLAccessibilityValueFormat *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("0.## s"), 0, 0));
  -[CRLSecondsDurationFormatter crl_setFormat:](self, "crl_setFormat:", v4);

  v5 = [CRLAccessibilityValueFormat alloc];
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("0.##"), 0, 0));
  v7 = CRLAccessibilityStringsDictKey(CFSTR("inspector.field.seconds"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = -[CRLAccessibilityValueFormat initWithNumberFormat:andUnitStringsDictKey:](v5, "initWithNumberFormat:andUnitStringsDictKey:", v6, v8);
  -[CRLInspectorTextFieldAbstractNumberFormatter setCrlaxValueFormat:](self, "setCrlaxValueFormat:", v9);

}

- (CRLSecondsDurationFormatter)initWithCoder:(id)a3
{
  CRLSecondsDurationFormatter *v3;
  CRLSecondsDurationFormatter *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLSecondsDurationFormatter;
  v3 = -[CRLInspectorTextFieldClampNumberFormatter initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[CRLSecondsDurationFormatter p_commonInitDurationFormatter](v3, "p_commonInitDurationFormatter");
  return v4;
}

- (CRLSecondsDurationFormatter)init
{
  CRLSecondsDurationFormatter *v2;
  CRLSecondsDurationFormatter *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLSecondsDurationFormatter;
  v2 = -[CRLInspectorTextFieldClampNumberFormatter init](&v5, "init");
  v3 = v2;
  if (v2)
    -[CRLSecondsDurationFormatter p_commonInitDurationFormatter](v2, "p_commonInitDurationFormatter");
  return v3;
}

@end
