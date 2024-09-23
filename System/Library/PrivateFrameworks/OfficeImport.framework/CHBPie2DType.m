@implementation CHBPie2DType

+ (void)readWithState:(id)a3 chartType:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  id v9;

  v9 = a3;
  v5 = a4;
  v6 = objc_msgSend(v9, "xlCurrentPlot");
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v5, "setFirstSliceAngle:", *(__int16 *)(v6 + 162));
    if (*(_WORD *)(v7 + 160))
      objc_msgSend(v5, "setDoughnutType:", 1);
    if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v7 + 16))(v7) == 3)
    {
      v8 = *(_DWORD *)(v7 + 164);
      if (v8 == 1)
      {
        objc_msgSend(v5, "setPieOfPieType:", 1);
        v8 = *(_DWORD *)(v7 + 164);
      }
      if (v8 == 2)
        objc_msgSend(v5, "setBarOfPieType:", 1);
    }
  }

}

+ (id)chdChartTypeWithState:(id)a3
{
  id v4;
  CHDPie2DType *v5;
  void *v6;
  CHDPie2DType *v7;

  v4 = a3;
  v5 = [CHDPie2DType alloc];
  objc_msgSend(v4, "chart");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CHDPie2DType initWithChart:](v5, "initWithChart:", v6);

  objc_msgSend(a1, "readWithState:chartType:", v4, v7);
  return v7;
}

@end
