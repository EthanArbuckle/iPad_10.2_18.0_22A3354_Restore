@implementation CHBBubbleType

+ (id)chdChartTypeWithState:(id)a3
{
  id v3;
  CHDBubbleType *v4;
  void *v5;
  CHDBubbleType *v6;
  uint64_t v7;
  uint64_t v8;

  v3 = a3;
  v4 = [CHDBubbleType alloc];
  objc_msgSend(v3, "chart");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CHDBubbleType initWithChart:](v4, "initWithChart:", v5);

  v7 = objc_msgSend(v3, "xlCurrentPlot");
  v8 = v7;
  if (v7)
  {
    -[CHDBubbleType setBubbleScale:](v6, "setBubbleScale:", *(unsigned __int16 *)(v7 + 160));
    -[CHDBubbleType setSizeRepresentsRadius:](v6, "setSizeRepresentsRadius:", *(_DWORD *)(v8 + 164) == 2);
    -[CHDBubbleType setShowNegBubbles:](v6, "setShowNegBubbles:", XlChartLegendXn::isLabel((XlChartLegendXn *)(v8 + 144)));
  }

  return v6;
}

+ (void)xlChartPlotFrom:(id)a3 state:(id)a4
{
  id v4;
  uint64_t v5;
  int v6;

  v4 = a3;
  v5 = operator new();
  XlChartScatterPlot::XlChartScatterPlot((XlChartScatterPlot *)v5);
  XlChartScatter::setBubblesFlag(v5 + 144, 1);
  *(_WORD *)(v5 + 160) = objc_msgSend(v4, "bubbleScale");
  if (objc_msgSend(v4, "isSizeRepresentingRadius"))
    v6 = 2;
  else
    v6 = 1;
  *(_DWORD *)(v5 + 164) = v6;
  XlChartScatter::setShowNegativeBubblesFlag(v5 + 144, objc_msgSend(v4, "isShowNegBubbles"));

  return (void *)v5;
}

@end
