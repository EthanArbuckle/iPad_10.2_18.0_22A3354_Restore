@implementation CRLVerboseSecondsDurationFormatter

+ (CRLVerboseSecondsDurationFormatter)sharedFormatter
{
  return (CRLVerboseSecondsDurationFormatter *)+[CRLInspectorTextFieldNumberFormatter verboseSecondsFormatter](CRLInspectorTextFieldNumberFormatter, "verboseSecondsFormatter");
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
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("0.## sec"), 0, 0));
  -[CRLVerboseSecondsDurationFormatter crl_setFormat:](self, "crl_setFormat:", v4);

  v5 = [CRLAccessibilityValueFormat alloc];
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("0.##"), 0, 0));
  v7 = CRLAccessibilityStringsDictKey(CFSTR("inspector.field.seconds"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = -[CRLAccessibilityValueFormat initWithNumberFormat:andUnitStringsDictKey:](v5, "initWithNumberFormat:andUnitStringsDictKey:", v6, v8);
  -[CRLInspectorTextFieldAbstractNumberFormatter setCrlaxValueFormat:](self, "setCrlaxValueFormat:", v9);

}

@end
