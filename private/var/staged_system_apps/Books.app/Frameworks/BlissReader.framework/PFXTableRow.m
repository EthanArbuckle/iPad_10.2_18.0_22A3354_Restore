@implementation PFXTableRow

+ (void)ensureMinimumNumberOfRows:(unsigned __int16)a3 withState:(id)a4
{
  unsigned int v4;
  id v5;
  id v6;

  v4 = a3;
  v5 = objc_msgSend(a4, "currentTableReader");
  v6 = objc_msgSend(v5, "tableModel");
  if (objc_msgSend(v6, "numberOfRows") < v4)
    TSTTableInsertRows(v6, objc_msgSend(v6, "numberOfRows"), (unsigned __int16)(v4 - (unsigned __int16)objc_msgSend(v6, "numberOfRows")), 0);
  objc_msgSend(v5, "ensureStrokeMatricesMatchModel");
}

- (BOOL)mapStartElementWithState:(id)a3
{
  id v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v4 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentHtmlStackEntry"), "currentEntryMediaState"), "propertySet");
  v5 = objc_msgSend(a3, "currentTableReader");
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "startRow");
    objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(v4, "valueForProperty:", "height"), "lastObject"), "value"), "doubleValue");
    v8 = v7 / 100.0;
    objc_msgSend(v6, "height");
    v10 = v8 * v9;
    objc_msgSend(v6, "setNumberOfRows:", (unsigned __int16)((unsigned __int16)objc_msgSend(v6, "numberOfRows") + 1));
    +[PFXTableRow ensureMinimumNumberOfRows:withState:](PFXTableRow, "ensureMinimumNumberOfRows:withState:", objc_msgSend(v6, "numberOfRows"), a3);
    TSTTableSetHeightOfRow(objc_msgSend(v6, "tableModel"), (unsigned __int16)((unsigned __int16)objc_msgSend(v6, "numberOfRows") - 1), v10);
  }
  return v6 != 0;
}

- (void)mapEndElementWithState:(id)a3
{
  objc_msgSend(objc_msgSend(a3, "currentTableReader"), "endRow");
}

@end
