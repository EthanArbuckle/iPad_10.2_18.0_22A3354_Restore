@implementation SXLastViewportComponentInsertionCondition

- (BOOL)validateMarker:(id)a3 componentTraits:(unint64_t)a4 layoutProvider:(id)a5
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v6 = a5;
  objc_msgSend(a3, "approximateLocation");
  v8 = v7;
  objc_msgSend(v6, "documentSize");
  v10 = v9;
  objc_msgSend(v6, "viewportSize");
  v12 = v11;

  return v8 < v10 - v12;
}

@end
