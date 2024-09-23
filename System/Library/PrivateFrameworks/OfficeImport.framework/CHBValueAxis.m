@implementation CHBValueAxis

+ (id)readFrom:(XlChartPlotAxis *)a3 state:(id)a4
{
  id v5;
  CHDValueAxis *v6;
  void *v7;
  CHDValueAxis *v8;
  double *var0;
  double v10;
  int isLogScale;
  double v12;
  double v13;
  int v14;
  double v15;
  double v16;
  int v17;
  double v18;
  double v19;
  int v20;
  double v21;
  double v22;
  int v23;
  double v24;
  uint64_t v25;
  uint64_t v26;

  v5 = a4;
  if (a3)
  {
    v6 = [CHDValueAxis alloc];
    objc_msgSend(v5, "resources");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[CHDValueAxis initWithResources:](v6, "initWithResources:", v7);

    var0 = (double *)a3[1].var0;
    if (var0)
    {
      if ((XlChartValueRange::isAutoMax((XlChartValueRange *)a3[1].var0) & 1) == 0)
      {
        v10 = var0[3];
        isLogScale = XlChartValueRange::isLogScale((XlChartValueRange *)var0);
        v12 = __exp10(v10);
        if (!isLogScale)
          v12 = v10;
        -[CHDAxis setScalingMaximum:](v8, "setScalingMaximum:", v12);
      }
      if ((XlChartValueRange::isAutoMin((XlChartValueRange *)var0) & 1) == 0)
      {
        v13 = var0[2];
        v14 = XlChartValueRange::isLogScale((XlChartValueRange *)var0);
        v15 = __exp10(v13);
        if (!v14)
          v15 = v13;
        -[CHDAxis setScalingMinimum:](v8, "setScalingMinimum:", v15);
      }
      if ((XlChartValueRange::isAutoMajor((XlChartValueRange *)var0) & 1) == 0)
      {
        v16 = var0[4];
        v17 = XlChartValueRange::isLogScale((XlChartValueRange *)var0);
        v18 = __exp10(v16);
        if (!v17)
          v18 = v16;
        -[CHDValueAxis setMajorUnitValue:](v8, "setMajorUnitValue:", v18);
      }
      if ((XlChartValueRange::isAutoMinor((XlChartValueRange *)var0) & 1) == 0)
      {
        v19 = var0[5];
        v20 = XlChartValueRange::isLogScale((XlChartValueRange *)var0);
        v21 = __exp10(v19);
        if (!v20)
          v21 = v19;
        -[CHDValueAxis setMinorUnitValue:](v8, "setMinorUnitValue:", v21);
      }
      if ((XlChartValueRange::isAutoCross((XlChartValueRange *)var0) & 1) == 0)
      {
        v22 = var0[6];
        v23 = XlChartValueRange::isLogScale((XlChartValueRange *)var0);
        v24 = __exp10(v22);
        if (!v23)
          v24 = v22;
        -[CHDAxis setCrossesAt:](v8, "setCrossesAt:", v24);
      }
      -[CHDAxis setReverseOrder:](v8, "setReverseOrder:", XlChartValueRange::isReverse((XlChartValueRange *)var0));
      if (XlChartValueRange::isLogScale((XlChartValueRange *)var0))
        -[CHDValueAxis setScalingLogBase:](v8, "setScalingLogBase:", 10.0);
    }
    v25 = *(_QWORD *)&a3[1].var1;
    if (v25)
    {
      v26 = *(int *)(v25 + 16);
      if (v26 < 0xA && ((0x327u >> v26) & 1) != 0)
        -[CHDValueAxis setBuiltInUnit:](v8, "setBuiltInUnit:", dword_22A4C18A8[v26]);
      -[CHDValueAxis setShowBuiltInUnitFlag:](v8, "setShowBuiltInUnitFlag:", *(unsigned __int8 *)(v25 + 20));
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (XlChartPlotAxis)writeXlAxisFrom:(id)a3
{
  id v3;
  XlChartValueAxis *v4;
  XlChartValueRange *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;

  v3 = a3;
  v4 = (XlChartValueAxis *)operator new();
  XlChartValueAxis::XlChartValueAxis(v4);
  v5 = (XlChartValueRange *)operator new();
  XlChartValueRange::XlChartValueRange(v5);
  XlChartValueRange::setReverseFlag((uint64_t)v5, objc_msgSend(v3, "isReverseOrder"));
  objc_msgSend(v3, "crossesAt");
  *((_QWORD *)v5 + 6) = v6;
  XlChartValueRange::setAutoCrossFlag((uint64_t)v5, objc_msgSend(v3, "isAutoCrossValue"));
  objc_msgSend(v3, "scalingMaximum");
  *((_QWORD *)v5 + 3) = v7;
  XlChartValueRange::setAutoMaxFlag((uint64_t)v5, objc_msgSend(v3, "isAutoMaximumValue"));
  objc_msgSend(v3, "scalingMinimum");
  *((_QWORD *)v5 + 2) = v8;
  XlChartValueRange::setAutoMinFlag((uint64_t)v5, objc_msgSend(v3, "isAutoMinimumValue"));
  objc_msgSend(v3, "minorUnitValue");
  *((_QWORD *)v5 + 5) = v9;
  XlChartValueRange::setAutoMinorFlag((uint64_t)v5, objc_msgSend(v3, "isAutoMinorUnitValue"));
  objc_msgSend(v3, "majorUnitValue");
  *((_QWORD *)v5 + 4) = v10;
  XlChartValueRange::setAutoMajorFlag((uint64_t)v5, objc_msgSend(v3, "isAutoMajorUnitValue"));
  objc_msgSend(v3, "scalingLogBase");
  if (v11 != 0.0)
    XlChartValueRange::setLogScaleFlag((uint64_t)v5, 1);
  XlChartCategoryAxis::takeRange((uint64_t)v4, (uint64_t)v5);

  return (XlChartPlotAxis *)v4;
}

@end
