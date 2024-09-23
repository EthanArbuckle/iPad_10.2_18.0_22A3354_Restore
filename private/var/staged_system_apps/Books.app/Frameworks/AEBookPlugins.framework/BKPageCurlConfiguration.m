@implementation BKPageCurlConfiguration

- (BKPageCurlConfiguration)initWithContext:(id)a3
{
  id v4;
  BKPageCurlConfiguration *v5;
  BKPageCurlConfiguration *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BKPageCurlConfiguration;
  v5 = -[BKPageCurlConfiguration init](&v8, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_context, v4);
    -[BKPageCurlConfiguration _setupPortraitCompactWidth](v6, "_setupPortraitCompactWidth");
    -[BKPageCurlConfiguration _setupDefault](v6, "_setupDefault");
  }

  return v6;
}

- (double)heightAllowanceScalar
{
  void *v3;
  double v4;
  double v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurlConfiguration context](self, "context"));
  -[BKPageCurlConfiguration floatForKey:context:](self, "floatForKey:context:", CFSTR("heightAllowanceScalar"), v3);
  v5 = v4;

  return v5;
}

- (void)_setupPortraitCompactWidth
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[IMConfigurationPredicate portraitPredicate](IMConfigurationPredicate, "portraitPredicate"));
  -[BKPageCurlConfiguration addWithPredicate:adder:](self, "addWithPredicate:adder:", v3, &stru_1C0208);

}

- (void)_setupDefault
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[IMConfigurationPredicate defaultPredicate](IMConfigurationPredicate, "defaultPredicate"));
  -[BKPageCurlConfiguration addWithPredicate:adder:](self, "addWithPredicate:adder:", v3, &stru_1C0368);

}

- (IMFrameEnvironment)context
{
  return (IMFrameEnvironment *)objc_loadWeakRetained((id *)&self->_context);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_context);
}

@end
