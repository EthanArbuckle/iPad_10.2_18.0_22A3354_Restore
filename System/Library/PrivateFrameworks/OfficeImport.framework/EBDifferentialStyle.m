@implementation EBDifferentialStyle

+ (id)edDifferentialStyleFromXlDXf:(XlDXf *)a3 edResources:(id)a4
{
  id v5;
  void *v6;
  unsigned __int8 var3;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a4;
  +[EDDifferentialStyle differentialStyle](EDDifferentialStyle, "differentialStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  var3 = a3->var3;
  if ((var3 & 2) != 0)
  {
    +[EBContentFormat edContentFormatFromXlDXfUserFmt:edResources:](EBContentFormat, "edContentFormatFromXlDXfUserFmt:edResources:", a3->var6, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContentFormat:", v8);

    var3 = a3->var3;
  }
  if ((var3 & 4) != 0)
  {
    +[EBFont edFontFromXlDXfFont:edResources:](EBFont, "edFontFromXlDXfFont:edResources:", a3->var7, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFont:", v9);

    var3 = a3->var3;
  }
  if ((var3 & 0x10) != 0)
  {
    +[EBBorders edBordersFromXlDXf:edResources:](EBBorders, "edBordersFromXlDXf:edResources:", a3, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBorders:", v10);

    var3 = a3->var3;
  }
  if ((var3 & 0x20) != 0)
  {
    +[EBFill edFillFromXlDXf:edResources:](EBFill, "edFillFromXlDXf:edResources:", a3, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFill:", v11);

  }
  return v6;
}

+ (unsigned)xlDXfPatternFlagsFromEDDifferentialStyle:(id)a3
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  unsigned __int8 v12;

  v3 = a3;
  objc_msgSend(v3, "fill");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v3, "fill");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "type");
    objc_msgSend(v6, "foreColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "backColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v7)
      v11 = 62;
    else
      v11 = 63;
    if (v8)
      v12 = v11 & 0x3D;
    else
      v12 = v11;

    if (v10)
      v12 &= 0x3Bu;

  }
  else
  {
    v12 = 63;
  }

  return v12;
}

+ (unsigned)xlDXfBordersFlagsFromEDDifferentialStyle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  unsigned __int8 v14;

  v3 = a3;
  objc_msgSend(v3, "borders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leftBorder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "borders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rightBorder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "borders");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topBorder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "borders");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bottomBorder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v5)
    v13 = -5;
  else
    v13 = -1;
  if (v7)
    v13 &= ~8u;
  if (v9)
    v14 = v13 & 0xEF;
  else
    v14 = v13;

  if (v12)
    v14 &= ~0x20u;

  return v14;
}

@end
