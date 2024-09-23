@implementation CHBString

+ (id)edRunsFromXlChartTextFrame:(const void *)a3 state:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unsigned int v9;
  unint64_t v10;
  unsigned __int16 *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  uint64_t v20;

  v19 = a4;
  objc_msgSend(v19, "resources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (((*((_DWORD *)a3 + 38) - *((_DWORD *)a3 + 36)) & 0x3FFFC) != 0)
  {
    +[EDCollection collection](EDRunsCollection, "collection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *((_QWORD *)a3 + 18);
    v8 = *((_QWORD *)a3 + 19) - v7;
    if ((v8 & 0x3FFFC) != 0)
    {
      v9 = 0;
      v10 = v8 >> 2;
      do
      {
        if ((unsigned __int16)v9 >= v10)
          std::vector<TSU::UUIDData<TSP::UUIDData>>::__throw_out_of_range[abi:ne180100]();
        v11 = (unsigned __int16 *)(v7 + 4 * (unsigned __int16)v9);
        if ((v8 & 0x3FFFC) != 4 || *((__int16 *)a3 + 93) < 0)
        {
          +[EDRun runWithCharIndex:fontIndex:resources:](EDRun, "runWithCharIndex:fontIndex:resources:", *v11, +[EBFontTable edFontIndexFromXlFontIndex:](EBFontTable, "edFontIndexFromXlFontIndex:", *(unsigned __int16 *)(v7 + 4 * (unsigned __int16)v9 + 2)), v5);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v5, "fonts");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectAtIndex:", +[EBFontTable edFontIndexFromXlFontIndex:](EBFontTable, "edFontIndexFromXlFontIndex:", *(unsigned __int16 *)(v7 + 4 * (unsigned __int16)v9 + 2)));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)objc_msgSend(v13, "copy");
          if (*(_BYTE *)(objc_msgSend(v19, "xlReader") + 1344) && *((__int16 *)a3 + 93) >= 64)
          {
            v20 = *((_QWORD *)a3 + 12);
            +[OITSUColor colorWithCsColour:](OITSUColor, "colorWithCsColour:", &v20);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v5, "colors");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "colorWithIndex:", *((__int16 *)a3 + 93));
            v15 = (void *)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend(v14, "setColor:", v15);
          +[EDRun runWithCharIndex:font:resources:](EDRun, "runWithCharIndex:font:resources:", *v11, v14, v5);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v6, "addObject:", v16);

        ++v9;
        v7 = *((_QWORD *)a3 + 18);
        v8 = *((_QWORD *)a3 + 19) - v7;
        v10 = v8 >> 2;
      }
      while (v9 < (unsigned __int16)(v8 >> 2));
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)edStringFromXlChartTextFrame:(const void *)a3 state:(id)a4
{
  id v6;
  EDString *v7;
  xmlNodePtr v8;
  xmlNodePtr v9;
  EXOfficeArtState *v10;
  CHXReadState *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;

  v6 = a4;
  if (a3)
  {
    v7 = objc_alloc_init(EDString);
    v8 = CXGetRootElement(*((const unsigned __int8 **)a3 + 14), *((_DWORD *)a3 + 45));
    v9 = v8;
    if (v8)
    {
      if (xmlStrEqual(v8->name, (const xmlChar *)"txPr") || xmlStrEqual(v9->name, (const xmlChar *)"richFrt"))
      {
        v10 = -[OAXDrawingState initWithClient:]([EXOfficeArtState alloc], "initWithClient:", 0);
        v11 = -[CHXReadState initWithDrawingState:]([CHXReadState alloc], "initWithDrawingState:", v10);
        objc_msgSend(v6, "resources");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CHXReadState setResources:](v11, "setResources:", v12);

        +[CHXFont edRunCollectionFromXmlTextPropertiesElement:state:](CHXFont, "edRunCollectionFromXmlTextPropertiesElement:state:", v9, v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          -[EDString setRuns:](v7, "setRuns:", v13);

      }
      else
      {
        v13 = 0;
      }
      xmlFreeDoc(v9->doc);
    }
    else
    {
      v13 = 0;
    }
    if (*((_QWORD *)a3 + 11))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithOcText:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDString setString:](v7, "setString:", v14);

    }
    if (v13)
    {
      objc_msgSend(a1, "edRunsFromXlChartTextFrame:state:", a3, v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");
      if (v16 >= objc_msgSend(v13, "count"))
      {
        v17 = objc_msgSend(v13, "count");
        if (v17)
        {
          for (i = 0; i != v17; ++i)
          {
            objc_msgSend(v13, "objectAtIndex:", i);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectAtIndex:", i);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "font");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "overrideFont:", v21);

          }
        }
      }
    }
    else
    {
      objc_msgSend(a1, "edRunsFromXlChartTextFrame:state:", a3, v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDString setRuns:](v7, "setRuns:", v15);
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (unint64_t)edFontIndexForXlChartTextFrame:(void *)a3 state:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;

  v5 = a4;
  +[CHBString edStringFromXlChartTextFrame:state:](CHBString, "edStringFromXlChartTextFrame:state:", a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "areThereRuns"))
  {
    objc_msgSend(v6, "runs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "fontIndex");

  }
  else
  {
    objc_msgSend(v5, "chart");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "defaultFontIndex");
  }

  return v9;
}

+ (id)nsStringWithHandlingMultilevelCategoryDataFromOCText:(const OcText *)a3 chdFormula:(id)a4 state:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  _BOOL4 v10;
  int v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int16 *v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  unsigned int v26;

  v7 = a4;
  v8 = a5;
  if (!v7 || objc_msgSend(v7, "tokenCount") != 1)
    goto LABEL_18;
  v26 = 0;
  v9 = objc_msgSend(v7, "lastExtendedDataForTokenAtIndex:length:", 0, &v26);
  v10 = 0;
  if (!v9 || v26 < 8)
    goto LABEL_19;
  v11 = objc_msgSend(v7, "tokenTypeAtIndex:", 0);
  v12 = 1;
  v13 = 1;
  v14 = 3;
  v15 = 2;
  if (v11 > 90)
  {
    if (v11 != 91)
    {
      v16 = (unsigned __int16 *)v9;
      if (v11 == 101)
        goto LABEL_15;
      v17 = 1;
      v18 = 1;
      v19 = 1;
      if (v11 != 123)
        goto LABEL_16;
    }
LABEL_13:
    v16 = (unsigned __int16 *)(v9 + 2);
    v14 = 4;
    v15 = 3;
    v12 = 2;
    goto LABEL_15;
  }
  if (v11 == 37)
  {
    v16 = (unsigned __int16 *)v9;
    goto LABEL_15;
  }
  if (v11 == 59)
    goto LABEL_13;
  v16 = (unsigned __int16 *)v9;
  v17 = 1;
  v18 = 1;
  v19 = 1;
  if (v11 == 69)
  {
LABEL_15:
    v13 = *v16;
    v18 = *(unsigned __int16 *)(v9 + 2 * v12);
    v17 = *(unsigned __int16 *)(v9 + 2 * v15);
    v19 = *(unsigned __int16 *)(v9 + 2 * v14);
  }
LABEL_16:
  if (v13 == v18 && v17 <= v19)
  {
LABEL_18:
    v10 = 0;
    goto LABEL_19;
  }
  v10 = v13 > v18 || v17 != v19;
LABEL_19:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithOcText:", a3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v10)
  {
    objc_msgSend(v20, "componentsSeparatedByString:", CFSTR("\n"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "count"))
    {
      objc_msgSend(v22, "objectAtIndex:", objc_msgSend(v22, "count") - 1);
      v23 = objc_claimAutoreleasedReturnValue();

      v21 = (void *)v23;
    }

  }
  return v21;
}

@end
