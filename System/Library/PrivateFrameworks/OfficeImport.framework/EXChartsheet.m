@implementation EXChartsheet

+ (id)edSheetWithState:(id)a3
{
  id v4;
  EDChartSheet *v5;
  void *v6;
  EDChartSheet *v7;
  void *v8;

  v4 = a3;
  v5 = [EDChartSheet alloc];
  objc_msgSend(v4, "workbook");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[EDSheet initWithWorkbook:](v5, "initWithWorkbook:", v6);

  -[EDSheet processors](v7, "processors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setupProcessors:", v8);

  return v7;
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

+ (BOOL)readDistinctSheetElementsFrom:(_xmlTextReader *)a3 state:(id)a4
{
  return 0;
}

@end
