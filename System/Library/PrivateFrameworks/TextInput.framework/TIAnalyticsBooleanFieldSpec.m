@implementation TIAnalyticsBooleanFieldSpec

- (TIAnalyticsBooleanFieldSpec)initWithName:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TIAnalyticsBooleanFieldSpec;
  return -[TIAnalyticsFieldSpec initWithName:](&v4, sel_initWithName_, a3);
}

- (BOOL)validate:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  if (v6)
  {
    if (+[TIAnalyticsUtil isBoolean:](TIAnalyticsUtil, "isBoolean:", v6))
    {
      v7 = 0;
      goto LABEL_9;
    }
    -[TIAnalyticsFieldSpec name](self, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIAnalyticsFieldSpec errorFromValue:code:message:](self, "errorFromValue:code:message:", v6, 10, CFSTR("Field '%@' must be a BOOLean."), v8);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (!a4)
      goto LABEL_9;
  }
  else
  {
    -[TIAnalyticsFieldSpec errorFromNil](self, "errorFromNil");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!a4)
      goto LABEL_9;
  }
  if (v7)
  {
    v7 = objc_retainAutorelease(v7);
    *a4 = v7;
  }
LABEL_9:

  return v7 == 0;
}

@end
