@implementation BSUIWeeklyProgressBoxLayout

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

  -[BSUIWeeklyProgressBoxLayout renderModelSizeWithContext:](self, "renderModelSizeWithContext:", a4);
  v6 = v5;
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressBoxLayout box](self, "box"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressBoxLayout box](self, "box"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "weeklyProgressMetrics"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[BSUIWeeklyProgressView renderModelWithIdentifier:metrics:](BSUIWeeklyProgressView, "renderModelWithIdentifier:metrics:", v10, v12));

  objc_msgSend(v13, "setSize:", v6, v8);
  return v13;
}

- (double)computeIntrinsicAspectRatio
{
  return 1.0;
}

@end
