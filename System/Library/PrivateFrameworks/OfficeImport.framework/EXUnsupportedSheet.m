@implementation EXUnsupportedSheet

+ (id)edSheetWithState:(id)a3
{
  id v3;
  EDUnsupportedSheet *v4;
  void *v5;
  EDUnsupportedSheet *v6;

  v3 = a3;
  v4 = [EDUnsupportedSheet alloc];
  objc_msgSend(v3, "workbook");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[EDSheet initWithWorkbook:](v4, "initWithWorkbook:", v5);

  return v6;
}

+ (BOOL)readDistinctSheetElementsFrom:(_xmlTextReader *)a3 state:(id)a4
{
  return 0;
}

@end
