@implementation CHBScatterType

+ (id)chdChartTypeWithState:(id)a3
{
  id v3;
  CHDScatterType *v4;
  void *v5;
  CHDScatterType *v6;

  v3 = a3;
  v4 = [CHDScatterType alloc];
  objc_msgSend(v3, "chart");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CHDChartType initWithChart:](v4, "initWithChart:", v5);

  return v6;
}

@end
