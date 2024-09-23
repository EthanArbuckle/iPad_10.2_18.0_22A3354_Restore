@implementation EBGraphic

+ (void)readGraphicsWithState:(id)a3
{
  id v4;
  XlBinaryReader *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v5 = (XlBinaryReader *)objc_msgSend(v8, "xlReader");
  objc_msgSend(v8, "edSheet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  while (XlBinaryReader::hasMoreGraphics(v5))
  {
    objc_msgSend(a1, "readGraphicWithDictionary:state:", v4, v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addDrawable:", v7);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "readNotesWithDictionary:state:", v4, v8);

}

+ (void)readNotesWithDictionary:(id)a3 state:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  uint64_t v10;
  EDComment *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void (**v18)(XlCollection *__hidden);
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;

  v5 = a3;
  v6 = a4;
  v20 = 0;
  v21 = 0;
  v19 = 0;
  v18 = &off_24F3A7D18;
  v7 = objc_msgSend(v6, "xlReader");
  (*(void (**)(uint64_t, void (***)(XlCollection *__hidden)))(*(_QWORD *)v7 + 400))(v7, &v18);
  v8 = v19;
  if (((v20 - (_QWORD)v19) & 0x7FFFFFFF8) != 0)
  {
    v9 = 0;
    do
    {
      v10 = v8[v9];
      v11 = objc_alloc_init(EDComment);
      -[EDComment setRowIndex:](v11, "setRowIndex:", *(unsigned __int16 *)(v10 + 32));
      -[EDComment setColumnIndex:](v11, "setColumnIndex:", *(__int16 *)(v10 + 34));
      v12 = *(_QWORD *)(v10 + 16);
      objc_msgSend(v6, "resources");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[EBString edStringFromXlString:edResources:](EBString, "edStringFromXlString:edResources:", v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDComment setAuthor:](v11, "setAuthor:", v14);

      -[EDComment setVisible:](v11, "setVisible:", *(unsigned __int8 *)(v10 + 38));
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(__int16 *)(v10 + 36));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKey:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_opt_class();
        objc_msgSend(v16, "clientData");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setComment:", v11);

      }
      ++v9;
      v8 = v19;
    }
    while (v9 < ((unint64_t)(v20 - (_QWORD)v19) >> 3));
  }
  v18 = &off_24F3A7B20;
  CsSimpleHeapVector<XlRecord>::~CsSimpleHeapVector((void **)&v19);

}

+ (id)readGraphicWithDictionary:(id)a3 state:(id)a4
{
  id v6;
  id v7;
  XlBinaryReader *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  OADHyperlink *v22;
  id v23;
  uint64_t v24;
  int v25;
  int v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  _BYTE v33[8];
  int v34;
  __int16 v35;
  char v36;
  int v37;
  char v38;
  char v39;

  v6 = a3;
  v7 = a4;
  v8 = (XlBinaryReader *)objc_msgSend(v7, "xlReader");
  XlGraphicsInfo::XlGraphicsInfo((XlGraphicsInfo *)v33);
  (*(void (**)(XlBinaryReader *, _BYTE *))(*(_QWORD *)v8 + 440))(v8, v33);
  objc_msgSend(v7, "readerState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[EBEscher readRootObjectWithType:state:](EBEscher, "readRootObjectWithType:state:", 3, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  v11 = 0;
  if ((v34 - 11) >= 0xA && v34 != 7)
  {
    if (v34 == 48)
    {
      v12 = objc_msgSend(v10, "eshObject");
      if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v12 + 16))(v12) == 61445)
      {
        objc_msgSend(v7, "readerState");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "oaState");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[OABDrawing applyRulesFromSolverContainer:state:](OABDrawing, "applyRulesFromSolverContainer:state:", v10, v13);
        v11 = 0;
        goto LABEL_28;
      }
      goto LABEL_7;
    }
    v15 = objc_msgSend(v10, "eshObject");
    if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v15 + 16))(v15) == 61442)
    {
      objc_msgSend(v10, "shapeContainer");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v32, "childCount") <= 1)
      {
        v11 = 0;
        goto LABEL_33;
      }
      objc_msgSend(v32, "childAt:", 1);
      v16 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v16;
    }
    if (v34 == 5)
      objc_msgSend(v10, "setChart:", 1);
    objc_msgSend(v7, "readerState");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "oaState");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = v18;
    +[OABDrawable readDrawableFromObject:state:](OABDrawable, "readDrawableFromObject:state:", v10, v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v11, "altId");
    if (v19 == -1)
    {
      v20 = objc_msgSend(v10, "eshObject");
      if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v20 + 16))(v20) == 7)
      {
        if (EshShapeProperties::isHyperlinkSet((EshShapeProperties *)(objc_msgSend(v10, "eshShape") + 424)))
        {
          objc_msgSend(v11, "drawableProperties");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_alloc_init(OADHyperlink);
          objc_msgSend(v21, "setClickHyperlink:", v22);

        }
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = v11;
      objc_msgSend(v18, "pushGroup:", v23);
      v24 = objc_msgSend(v10, "eshObject");
      v25 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v24 + 40))(v24);
      v26 = v25 - 1;
      if (v25 != 1)
      {
        do
        {
          if (!XlBinaryReader::hasMoreGraphics(v8))
            break;
          objc_msgSend(a1, "readGraphicWithDictionary:state:", v6, v7);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
            objc_msgSend(v23, "addChild:", v27);

          --v26;
        }
        while (v26);
      }
      v28 = (id)objc_msgSend(v32, "popGroup");

    }
    if (v19 != -1)
    {
LABEL_26:
      if (!v11)
      {
LABEL_33:

        goto LABEL_8;
      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v35);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v11, v13);
LABEL_28:

      goto LABEL_33;
    }
    if (v39)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        objc_msgSend(a1, "readOle:xlGraphicsInfo:state:", v11, v33, v7);
        goto LABEL_26;
      }
    }
    if (v34 == 8)
    {
      if (v38)
      {
        objc_opt_class();
        objc_msgSend(a1, "readImage:xlGraphicsInfo:state:", v11, v33, v7);
        goto LABEL_26;
      }
    }
    else if (v34 == 5 && v37)
    {
      objc_opt_class();
      v29 = v11;
      objc_msgSend(a1, "readChart:chartIndex:state:", v29, (__int16)objc_msgSend(v7, "nextChartIndex"), v7);
      goto LABEL_42;
    }
    if (!v36)
      goto LABEL_26;
    objc_msgSend(v11, "clientData");
    v29 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resources");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[EBTextBox edTextBoxFromXlGraphicsInfo:edResources:](EBTextBox, "edTextBoxFromXlGraphicsInfo:edResources:", v33, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "setTextBox:", v31);
LABEL_42:

    goto LABEL_26;
  }
LABEL_8:

  XlGraphicsInfo::~XlGraphicsInfo((XlGraphicsInfo *)v33);
  return v11;
}

+ (id)readMainChartWithState:(id)a3
{
  id v4;
  CHDChart *v5;
  EDOfficeArtClient *v6;

  v4 = a3;
  v5 = objc_alloc_init(CHDChart);
  v6 = objc_alloc_init(EDOfficeArtClient);
  -[EDOfficeArtClient setBounds:](v6, "setBounds:", 0.0, 0.0, 200.0, 200.0);
  -[OADDrawable setClientData:](v5, "setClientData:", v6);
  objc_msgSend(a1, "readChart:chartIndex:state:", v5, 0xFFFFFFFFLL, v4);

  return v5;
}

+ (void)readChart:(id)a3 chartIndex:(signed __int16)a4 state:(id)a5
{
  signed int v6;
  id v7;
  XlChartBinaryReader *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v11 = a3;
  v7 = a5;
  v8 = (XlChartBinaryReader *)objc_msgSend(v7, "xlReader");
  if ((__int16)XlChartBinaryReader::getChartCount(v8) > v6)
  {
    XlChartBinaryReader::setChart(v8, v6);
    +[CHBReader readChart:state:](CHBReader, "readChart:state:", v11, v7);
    objc_msgSend(v11, "clientData", XlChartBinaryReader::closeChart(v8));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "edSheet");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setSheet:", v10);

    }
  }

}

+ (void)readGraphicsInChart:(id)a3 state:(id)a4
{
  id v6;
  id v7;
  XlBinaryReader *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (v10 && v6)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v8 = (XlBinaryReader *)objc_msgSend(v6, "xlReader");
    while (XlBinaryReader::hasMoreGraphics(v8))
    {
      objc_msgSend(a1, "readGraphicWithDictionary:state:", v7, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addChild:", v9);

    }
  }

}

+ (void)readOle:(id)a3 xlGraphicsInfo:(void *)a4 state:(id)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v7 = a5;
  v8 = *((_QWORD *)a4 + 16);
  v9 = objc_msgSend(v7, "xlReader");
  v10 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v9 + 88))(v9);
  if (v8)
  {
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v7, "readerState");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "cancelDelegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithOcText:", v8 + 8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[OABOle readFromParentStorage:storageName:cancel:](OABOle, "readFromParentStorage:storageName:cancel:", v11, v14, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "setOle:", v15);
    }
  }

}

+ (void)readImage:(id)a3 xlGraphicsInfo:(void *)a4 state:(id)a5
{
  id v7;
  id v8;
  unsigned int v9;
  void *v10;
  int v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  unsigned int var3;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  OADSubBlip *v20;
  OADBlip *v21;
  uint64_t v22;
  OcBinaryData v23;
  int v24;
  unsigned int v25;
  __int16 v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  XlBinaryData::XlBinaryData((XlBinaryData *)&v22);
  v9 = *((_DWORD *)a4 + 28);
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithCapacity:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *((_DWORD *)a4 + 29);
  if (v11 == 2)
  {
    if (*((_DWORD *)a4 + 30) == 1)
      v12 = 4;
    else
      v12 = 6;
  }
  else
  {
    v12 = v11 == 9;
  }
  OcBinaryData::setMinimumCapacity(&v23, 0x1000u);
  v13 = 0;
  v24 = *((_DWORD *)a4 + 27);
  v25 = v9;
  v26 = 127;
  while (1)
  {
    v23.var1 = v13;
    if (v13 >= v9)
      break;
    v14 = objc_msgSend(v8, "xlReader");
    (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v14 + 144))(v14, &v22);
    var3 = v23.var3;
    if (!v23.var3)
      break;
    v13 += v23.var3;
    v16 = v9 - v13;
    if (v9 < v13)
    {
      var3 = v16 + v23.var3;
      OcBinaryData::setMinimumCapacity(&v23, v16 + v23.var3);
      v23.var3 = var3;
    }
    objc_msgSend(v10, "appendBytes:length:", v23.var5, var3);
  }
  objc_msgSend(v7, "imageProperties");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "imageFill");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "blipRef");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[OADSubBlip initWithData:type:]([OADSubBlip alloc], "initWithData:type:", v10, v12);
  v21 = objc_alloc_init(OADBlip);
  -[OADBlip setMainSubBlip:](v21, "setMainSubBlip:", v20);
  objc_msgSend(v19, "setBlip:", v21);

  OcBinaryData::~OcBinaryData(&v23);
}

+ (int)objectTypeForShape:(id)a3
{
  int result;

  result = EshShapeProperties::getShapeType((EshShapeProperties *)(objc_msgSend(a3, "eshShape") + 424));
  if (result > 19)
  {
    if (result > 200)
    {
      if (result == 201)
        return 5;
      if (result == 202)
        return 6;
    }
    else
    {
      if (result == 20)
        return 1;
      if (result == 75)
        return 8;
    }
  }
  else if (result > 2)
  {
    if (result == 3)
      return result;
    if (result == 19)
      return 4;
  }
  else
  {
    if ((result - 1) < 2)
      return 2;
    if (!result)
      return 9;
  }
  return 30;
}

@end
