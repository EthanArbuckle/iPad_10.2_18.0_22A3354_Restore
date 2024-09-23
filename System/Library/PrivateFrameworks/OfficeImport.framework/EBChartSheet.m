@implementation EBChartSheet

+ (void)readWithState:(id)a3
{
  void *v4;
  void *v5;
  float *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "edSheet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "processors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setupProcessors:", v5);

    v6 = (float *)objc_msgSend(v7, "xlReader");
    objc_msgSend(v4, "setBounds:", v6[389], v6[390], (float)(v6[391] - v6[389]), (float)(v6[392] - v6[390]));
  }

}

+ (void)setupProcessors:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "removeAllObjects");
  objc_msgSend(v3, "addProcessorClass:", objc_opt_class());
  objc_msgSend(v3, "addProcessorClass:", objc_opt_class());
  objc_msgSend(v3, "addProcessorClass:", objc_opt_class());
  objc_msgSend(v3, "addProcessorClass:", objc_opt_class());
  objc_msgSend(v3, "addProcessorClass:", objc_opt_class());
  objc_msgSend(v3, "addProcessorClass:", objc_opt_class());
  objc_msgSend(v3, "addProcessorClass:", objc_opt_class());
  objc_msgSend(v3, "addProcessorClass:", objc_opt_class());
  objc_msgSend(v3, "addProcessorClass:", objc_opt_class());
  objc_msgSend(v3, "addProcessorClass:", objc_opt_class());

}

+ (void)readChildrenWithState:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "edSheet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[EBGraphic readMainChartWithState:](EBGraphic, "readMainChartWithState:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMainChart:", v4);

  +[EBGraphic readGraphicsWithState:](EBGraphic, "readGraphicsWithState:", v5);
}

@end
