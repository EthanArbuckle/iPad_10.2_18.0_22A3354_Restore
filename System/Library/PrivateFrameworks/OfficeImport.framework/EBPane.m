@implementation EBPane

+ (void)readXlPaneFrom:(XlSheetPresentation *)a3 state:(id)a4
{
  id v5;
  XlPane *var3;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a4;
  var3 = a3->var3;
  if (var3)
  {
    v12 = v5;
    +[EDPane pane](EDPane, "pane");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setActivePane:", *((unsigned int *)var3 + 6));
    LOWORD(v8) = *((_WORD *)var3 + 8);
    objc_msgSend(v7, "setXSplitPosition:", (double)v8);
    LOWORD(v9) = *((_WORD *)var3 + 9);
    objc_msgSend(v7, "setYSplitPosition:", (double)v9);
    +[EDReference referenceWithFirstRow:lastRow:firstColumn:lastColumn:](EDReference, "referenceWithFirstRow:lastRow:firstColumn:lastColumn:", *((unsigned __int16 *)var3 + 10), *((unsigned __int16 *)var3 + 10), *((unsigned __int16 *)var3 + 11), *((unsigned __int16 *)var3 + 11));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTopLeftCell:", v10);

    objc_msgSend(v12, "edSheet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPane:", v7);

    v5 = v12;
  }

}

+ (void)writePaneForSheet:(id)a3 toXlSheetPresentation:(XlSheetPresentation *)a4 xlWindow2:(XlWindow2 *)a5
{
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v13, "pane");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = operator new();
      XlPane::XlPane((XlPane *)v8);
      *(_DWORD *)(v8 + 24) = objc_msgSend(v7, "activePane");
      objc_msgSend(v7, "xSplitPosition");
      *(_WORD *)(v8 + 16) = (int)v9;
      objc_msgSend(v7, "ySplitPosition");
      *(_WORD *)(v8 + 18) = (int)v10;
      objc_msgSend(v7, "topLeftCell");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_WORD *)(v8 + 20) = objc_msgSend(v11, "firstRow");

      objc_msgSend(v7, "topLeftCell");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_WORD *)(v8 + 22) = objc_msgSend(v12, "firstColumn");

      XlChartPlot::takeChartSeriesFormat((XlChartPlot *)a4, (XlChartSeriesFormat *)v8);
      a5->var8 = 1;
      a5->var13 = 1;
    }

  }
}

@end
