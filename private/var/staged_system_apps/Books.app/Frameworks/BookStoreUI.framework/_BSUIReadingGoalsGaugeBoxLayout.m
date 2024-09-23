@implementation _BSUIReadingGoalsGaugeBoxLayout

- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (a3 < 4)
    return 0;
  -[_BSUIReadingGoalsGaugeBoxLayout computedNaturalSize](self, "computedNaturalSize");
  v6 = v5;
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_BSUIReadingGoalsGaugeBoxLayout box](self, "box"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_BSUIReadingGoalsGaugeBoxLayout box](self, "box"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "readingGoalsGaugeMetrics"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[BSUIReadingGoalsGaugeView renderModelWithIdentifier:metrics:](BSUIReadingGoalsGaugeView, "renderModelWithIdentifier:metrics:", v10, v12));

  objc_msgSend(v13, "setSize:", v6, v8);
  return v13;
}

@end
