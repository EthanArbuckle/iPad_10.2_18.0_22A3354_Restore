@implementation WBOfficeArt

+ (void)readFrom:(id)a3 at:(int)a4 textRun:(WrdCharacterTextRun *)a5 paragraph:(id)a6 to:(id)a7
{
  id v12;
  id v13;
  WrdCharacterProperties *var4;
  WrdCharacterProperties *var5;
  WDCharacterProperties *v16;
  void *v17;
  WDCharacterProperties *v18;
  void *v19;
  WrdFileShapeAddressTable *v20;
  uint64_t FileShapeAddressByCp;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  id v35;
  WrdFileShapeAddress v36;

  v35 = a3;
  v12 = a6;
  v13 = a7;
  if (v13)
  {
    var4 = a5->var4;
    var5 = a5->var5;
    v16 = [WDCharacterProperties alloc];
    objc_msgSend(v12, "document");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[WDCharacterProperties initWithDocument:](v16, "initWithDocument:", v17);

    objc_msgSend(v12, "document");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBCharacterProperties readFrom:wrdProperties:tracked:document:properties:](WBCharacterProperties, "readFrom:wrdProperties:tracked:document:properties:", v35, var4, var5, v19, v18);

    objc_msgSend(v13, "setProperties:", v18);
    objc_msgSend(v13, "checkForFloating:", v12);
    if (a5->var1 == 2)
      v20 = (WrdFileShapeAddressTable *)objc_msgSend(v35, "fileShapeAddressHeaderTable");
    else
      v20 = (WrdFileShapeAddressTable *)objc_msgSend(v35, "fileShapeAddressTable");
    FileShapeAddressByCp = WrdFileShapeAddressTable::getFileShapeAddressByCp(v20, a4);
    WrdFileShapeAddress::WrdFileShapeAddress(&v36, FileShapeAddressByCp);
    objc_msgSend(v35, "drawableForShapeId:", v36.var2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(v13, "setDrawable:", v22);
      objc_opt_class();
      objc_msgSend(v22, "clientData");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "anchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "setShapeAddress:toDrawable:", &v36, v22);
      if ((objc_msgSend(v13, "isFloating") & 1) == 0)
      {
        objc_msgSend(v24, "bounds");
        v26 = v25;
        v28 = v27;
        v30 = v29;
        v32 = v31;
        objc_msgSend(v22, "drawableProperties");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "orientedBounds");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setBounds:", v26, v28, v30, v32);

        objc_msgSend(v23, "clearAnchor");
      }

    }
  }

}

+ (void)setShapeAddress:(const WrdFileShapeAddress *)a3 toDrawable:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  int var4;
  int var3;
  int var6;
  int var5;
  void *v12;
  void *v13;
  _BOOL4 v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;

  v22 = a4;
  objc_opt_class();
  objc_msgSend(v22, "clientData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a3->var7 < 4u)
    objc_msgSend(v6, "setRelativeHorizontalPosition:");
  if (a3->var8 <= 3u)
    objc_msgSend(v7, "setRelativeVerticalPosition:");
  if (a3->var9 <= 5u)
    objc_msgSend(v7, "setTextWrappingMode:");
  if (a3->var10 <= 3u)
    objc_msgSend(v7, "setTextWrappingModeType:");
  var3 = a3->var3;
  var4 = a3->var4;
  var5 = a3->var5;
  var6 = a3->var6;
  objc_msgSend(v22, "drawableProperties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "orientedBounds");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rotation");
  v14 = +[OADOrientedBounds directionCloserToVerticalThanToHorizontal:](OADOrientedBounds, "directionCloserToVerticalThanToHorizontal:");
  v15 = (float)var3 / 20.0;
  v16 = (float)var4 / 20.0;
  v17 = (float)(var5 - var3) / 20.0;
  v18 = (float)(var6 - var4) / 20.0;

  if (v14)
  {
    v15 = NSTransposedRectWithSameCenter((float)var3 / 20.0, (float)var4 / 20.0, (float)(var5 - var3) / 20.0, (float)(var6 - var4) / 20.0);
    v16 = v19;
    v17 = v20;
    v18 = v21;
  }
  objc_msgSend(v7, "setBounds:", v15, v16, v17, v18);

}

@end
