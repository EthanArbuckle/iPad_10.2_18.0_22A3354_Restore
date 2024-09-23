@implementation SheetMetrics

+ (CGRect)frameForPresentedSheetIn:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  v3 = a3;
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v8 = _UISheetPageSize(v3);
  v10 = v9;
  v11 = v7 - v9;

  v12 = v5 - v8;
  v13 = v11;
  v14 = v8;
  v15 = v10;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

+ (double)cornerRadius
{
  return _UISheetCornerRadius;
}

@end
