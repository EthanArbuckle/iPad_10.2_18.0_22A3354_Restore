@implementation BSUIElementReadingGoalsGauge

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)supportedAttributes
{
  return +[BSUIReadingGoalsGaugeMetrics supportedAttributes](BSUIReadingGoalsGaugeMetrics, "supportedAttributes");
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(BSUIReadingGoalsGaugeBox, a2);
}

+ (Class)builderClass
{
  return (Class)objc_opt_class(TUIWidgetBuilder, a2);
}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc((Class)TUIConfiguration);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "finalizeWidgetWithParent:", 0));

  v12 = objc_msgSend(v10, "initWithData:", v11);
  objc_msgSend(v9, "setConfiguration:", v12);

  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "readingGoalsGaugeMetrics"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "configuration"));

  objc_msgSend(v14, "updateWithConfiguration:context:", v13, v7);
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v9;
  id v10;
  id v11;
  BSUIReadingGoalsGaugeMetrics *v12;

  v9 = a6;
  v10 = a5;
  v11 = a3;
  v12 = -[BSUIReadingGoalsGaugeMetrics initWithNode:attributes:context:]([BSUIReadingGoalsGaugeMetrics alloc], "initWithNode:attributes:context:", a4.var0, v10, v9);

  objc_msgSend(v11, "setReadingGoalsGaugeMetrics:", v12);
}

@end
