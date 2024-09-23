@implementation PFAIAnchoredDrawableChild

- (BOOL)mapStartElementWithState:(id)a3
{
  return 1;
}

- (void)mapEndElementWithState:(id)a3
{
  id v3;
  id v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  NSMutableArray *v18;
  NSMutableArray *v19;

  v3 = objc_msgSend(a3, "currentStackEntry");
  v4 = objc_msgSend(v3, "flowState");
  v5 = (char *)objc_msgSend(v4, "childResultCount");
  if (objc_msgSend(objc_msgSend(v3, "paginatedState"), "childResultCount") == (char *)&dword_0 + 1)
    objc_msgSend(objc_msgSend(v3, "paginatedState"), "setResult:", objc_msgSend(objc_msgSend(v3, "paginatedState"), "childResultAtIndex:", 0));
  if (v5 == (_BYTE *)&dword_0 + 2)
  {
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 1;
    do
    {
      v10 = v9;
      v11 = objc_msgSend(v4, "childResultAtIndex:", v6);
      v12 = objc_opt_class(TSWPParagraphStyle);
      v14 = TSUDynamicCast(v12, v11).n128_u64[0];
      if (v13)
      {
        v7 = v13;
      }
      else
      {
        v15 = objc_opt_class(TSDImageInfo);
        v14 = TSUDynamicCast(v15, v11).n128_u64[0];
        if (v16)
          v8 = v16;
      }
      v9 = 0;
      v6 = 1;
    }
    while ((v10 & 1) != 0);
    v17 = objc_msgSend(objc_msgSend(v3, "currentEntryOrientationState", 1, *(double *)&v14), "propertySet");
    v18 = +[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", v17, PFXTSDInfoGeometry((const char *)objc_msgSend(v3, "xmlValueForAttribute:", PFXWidgetConstantDataGeometry[0])), objc_msgSend(v3, "valueForAttribute:", PFXWidgetConstantDataGutterOrder[0]), 0);
    v19 = v18;
    if (v8)
      -[NSMutableArray addObject:](v18, "addObject:", v8);
    if (v7)
      -[NSMutableArray addObject:](v19, "addObject:", v7);
    objc_msgSend(objc_msgSend(v3, "flowState"), "setResult:", v19);
  }
}

@end
