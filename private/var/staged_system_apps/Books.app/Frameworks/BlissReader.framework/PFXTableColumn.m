@implementation PFXTableColumn

- (BOOL)mapStartElementWithState:(id)a3
{
  double v4;
  double v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  id v10;
  unsigned int v11;

  objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentHtmlStackEntry"), "currentEntryMediaState"), "propertySet"), "valueForProperty:", "width"), "lastObject"), "value"), "doubleValue");
  v5 = v4;
  v6 = objc_msgSend(a3, "currentTableReader");
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "width");
    v9 = v5 / 100.0 * v8;
    objc_msgSend(v7, "setNumberOfColumns:", (unsigned __int16)((unsigned __int16)objc_msgSend(v7, "numberOfColumns") + 1));
    v10 = objc_msgSend(v7, "tableModel");
    v11 = objc_msgSend(v7, "numberOfColumns");
    if (v11 > objc_msgSend(v10, "numberOfColumns"))
      TSTTableInsertColumns(v10, objc_msgSend(v10, "numberOfColumns"), 1, 0);
    TSTTableSetWidthOfColumn(v10, (objc_msgSend(v10, "numberOfColumns") - 1), v9);
  }
  return v7 != 0;
}

@end
