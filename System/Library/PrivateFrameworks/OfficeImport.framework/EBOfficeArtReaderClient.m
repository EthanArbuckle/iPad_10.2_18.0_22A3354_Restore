@implementation EBOfficeArtReaderClient

+ (BOOL)escherIsFullySupported
{
  return 0;
}

+ (void)readClientDataFromShape:(id)a3 toGraphic:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  EDOfficeArtClient *v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(EDOfficeArtClient);
  v11 = (uint64_t *)objc_msgSend(v15, "eshObject");
  if (v11)
  v12 = v11[72];
  if (v12)
    +[EBOfficeArtReaderClient readEshClientAnchor:targetClientData:state:](EBOfficeArtReaderClient, "readEshClientAnchor:targetClientData:state:", v12, v10, v9);
  else
    -[EDOfficeArtClient setBounds:](v10, "setBounds:", (double)*((int *)v11 + 64), (double)*((int *)v11 + 65), (double)(*((_DWORD *)v11 + 66) - *((_DWORD *)v11 + 64)), (double)(*((_DWORD *)v11 + 67) - *((_DWORD *)v11 + 65)));
  objc_msgSend(v8, "setClientData:", v10);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "textBody");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "properties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setVerticalOverflowType:", 2);
    objc_msgSend(a1, "setAutoInsetForShape:", objc_msgSend(v15, "eshShape"));

  }
}

+ (void)readEshClientAnchor:(const void *)a3 targetClientData:(id)a4 state:(id)a5
{
  EDTwoCellAnchor *v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  float32x2_t v11;
  float32x2_t v12;
  float32x2_t v13;
  int8x16_t v14;
  uint64_t v15;
  float32x2_t v16;
  float32x2_t v17;
  id v18;

  v18 = a4;
  v6 = objc_alloc_init(EDTwoCellAnchor);
  objc_msgSend(v18, "setAnchor:", v6);
  -[EDTwoCellAnchor setRelative:](v6, "setRelative:", 1);
  v7 = *((__int16 *)a3 + 14);
  v8 = v7 << 17;
  if (v7 >= 0)
    v9 = 1;
  else
    v9 = 2;
  -[EDTwoCellAnchor setEditAs:](v6, "setEditAs:", v9 & (v8 >> 31));
  v10 = *((_QWORD *)a3 + 4);
  v11 = vcvt_f32_s32(*(int32x2_t *)((char *)a3 + 48));
  v12.i32[0] = 981467136;
  v12.i32[0] = vmul_f32(v11, v12).u32[0];
  v13 = (float32x2_t)vdup_n_s32(0x437E0000u);
  v12.i32[1] = vdiv_f32(v11, v13).i32[1];
  v14.i64[0] = v10;
  v14.i64[1] = HIDWORD(v10);
  -[EDTwoCellAnchor setFrom:](v6, "setFrom:", vorrq_s8((int8x16_t)vshll_n_s32((int32x2_t)v12, 0x20uLL), v14));
  v15 = *((_QWORD *)a3 + 5);
  v16 = vcvt_f32_s32(*(int32x2_t *)((char *)a3 + 56));
  v17.i32[0] = 981467136;
  v17.i32[0] = vmul_f32(v16, v17).u32[0];
  v17.i32[1] = vdiv_f32(v16, v13).i32[1];
  v14.i64[0] = v15;
  v14.i64[1] = HIDWORD(v15);
  -[EDTwoCellAnchor setTo:](v6, "setTo:", vorrq_s8((int8x16_t)vshll_n_s32((int32x2_t)v17, 0x20uLL), v14));

}

+ (void)setAutoInsetForShape:(void *)a3
{
  EshTextBox *v3;
  int DefaultPositionHorizontal;

  v3 = (EshTextBox *)((char *)a3 + 272);
  DefaultPositionHorizontal = EshContentProperties::getDefaultPositionHorizontal((EshContentProperties *)a1);
  if (EshTextBox::isAutoInsetSet(v3))
  {
    if ((EshTextBox::getAutoInset(v3) & 1) == 0)
      return;
LABEL_5:
    EshTextBox::setInsetLeft(v3, 0x594Cu);
    EshTextBox::setInsetRight(v3, 0x594Cu);
    EshTextBox::setInsetTop(v3, 0x594Cu);
    EshTextBox::setInsetBottom(v3, 0x594Cu);
    return;
  }
  if (DefaultPositionHorizontal)
    goto LABEL_5;
}

+ (BOOL)tablesAreAllowed
{
  return 0;
}

+ (void)readClientDataFromGroup:(id)a3 toGroup:(id)a4 state:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  EDOfficeArtClient *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  v8 = a5;
  if (v9)
  {
    v10 = objc_alloc_init(EDOfficeArtClient);
    +[EBOfficeArtReaderClient readEshClientAnchor:targetClientData:state:](EBOfficeArtReaderClient, "readEshClientAnchor:targetClientData:state:", v9, v10, v8);
    objc_msgSend(v7, "setClientData:", v10);

  }
}

+ (BOOL)xmlEquivalentOfDrawableCanBeUsed
{
  return 1;
}

+ (int)oadSchemeColorValueForEshSchemeColorIndex:(unsigned __int16)a3 state:(id)a4
{
  return -1;
}

+ (id)readDrawableFromPackagePart:(id)a3 foundInObject:(id)a4 state:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  xmlNodePtr v9;
  void *v10;
  _xmlNode *v11;
  void *v12;

  v6 = a3;
  objc_msgSend(a5, "xmlDrawingState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "excelState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPackagePart:", v6);
  v9 = OCXGetRootElement((_xmlDoc *)objc_msgSend(v6, "xmlDocument"));
  if (xmlStrEqual(v9->name, (const xmlChar *)"anchor"))
  {
    +[EXDrawing readAnchorNode:state:](EXDrawing, "readAnchorNode:state:", OCXFirstChild(v9), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (xmlStrEqual(v9->name, (const xmlChar *)"object"))
  {
    v11 = OCXFirstChild(v9);
    objc_msgSend(v8, "EXSpreadsheetDrawingNamespace");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[OAXDrawable readDrawableFromXmlNode:inNamespace:drawingState:](OAXDrawable, "readDrawableFromXmlNode:inNamespace:drawingState:", v11, v12, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v7, "setPackagePart:", 0);

  return v10;
}

@end
