@implementation CHXSeriesAxis

+ (id)chdAxisFromXmlAxisElement:(_xmlNode *)a3 state:(id)a4
{
  id v4;
  CHDSeriesAxis *v5;
  void *v6;
  CHDSeriesAxis *v7;

  v4 = a4;
  v5 = [CHDSeriesAxis alloc];
  objc_msgSend(v4, "resources");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CHDSeriesAxis initWithResources:](v5, "initWithResources:", v6);

  return v7;
}

@end
