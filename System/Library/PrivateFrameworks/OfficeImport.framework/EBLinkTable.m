@implementation EBLinkTable

+ (void)readFromState:(id)a3
{
  void *v3;
  _DWORD *v4;
  unsigned int v5;
  int v6;
  unsigned int v7;
  unsigned __int16 *MergeRegion;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t Link;
  void *v18;
  uint64_t v19;
  unsigned int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  int v25;
  void *v27;

  v24 = a3;
  objc_msgSend(v24, "resources");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "links");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (_DWORD *)objc_msgSend(v24, "xlLinkTable");
  v5 = v4[8] - v4[6];
  v6 = (unsigned __int16)(v5 >> 3);
  if ((unsigned __int16)(v5 >> 3))
  {
    v7 = 0;
    do
    {
      MergeRegion = (unsigned __int16 *)XlMerge::getMergeRegion((XlMerge *)(v4 + 2), v7);
      v9 = MergeRegion[1];
      v10 = MergeRegion[2];
      if (v9 == 65534)
        v11 = -2;
      else
        v11 = MergeRegion[1];
      if (v9 == 0xFFFF)
        v12 = -1;
      else
        v12 = v11;
      if (v10 == 65534)
        v13 = -2;
      else
        v13 = MergeRegion[2];
      if (v10 == 0xFFFF)
        v14 = -1;
      else
        v14 = v13;
      +[EDLinkReference linkReferenceWithLinkIndex:firstSheetIndex:lastSheetIndex:](EDLinkReference, "linkReferenceWithLinkIndex:firstSheetIndex:lastSheetIndex:", *MergeRegion, v12, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addReference:", v15);

      ++v7;
    }
    while (v6 != v7);
  }
  v25 = (unsigned __int16)((v4[14] - v4[12]) >> 3);
  if ((unsigned __int16)((v4[14] - v4[12]) >> 3))
  {
    v16 = 0;
    do
    {
      Link = XlLinkTable::getLink((XlLinkTable *)v4, (unsigned __int16)v16);
      +[EDLink linkWithType:](EDLink, "linkWithType:", objc_msgSend(a1, "mapXlLinkTypeToED:", *(unsigned int *)(Link + 16)));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (*(_QWORD *)(Link + 64) - *(_QWORD *)(Link + 56)) >> 3;
      if ((_DWORD)v19)
      {
        v20 = 0;
        v21 = 0;
        do
        {
          if (!v21)
          {
            objc_msgSend(v18, "externalNames");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v22 = *(_QWORD *)(XlLink::getExternalName((XlLink *)Link, v20) + 32);
          if (v22)
            +[EBString edStringFromXlString:edResources:](EBString, "edStringFromXlString:edResources:", v22, v3);
          else
            +[EDString string](EDString, "string");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v23);

          ++v20;
        }
        while ((_DWORD)v19 != v20);
      }
      else
      {
        v21 = 0;
      }
      objc_msgSend(v27, "addLink:", v18);

      ++v16;
    }
    while (v16 != v25);
  }

}

+ (int)mapXlLinkTypeToED:(int)a3
{
  if ((a3 - 1) > 3)
    return 0;
  else
    return dword_22A4C1D20[a3 - 1];
}

+ (void)createXlLinkTableFromLinksCollection:(id)a3 workbook:(id)a4 state:(id)a5
{
  id v7;
  uint64_t v8;
  XlCoordList *v9;
  uint64_t v10;
  uint64_t i;
  XlVertex *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  unsigned __int8 *v24;
  void *v25;
  void *v26;
  id v28;
  void *v29;
  uint64_t v30;
  XlLinkTable *v32;
  uint64_t v33;
  void *v34;
  id v35;

  v7 = a3;
  v28 = a4;
  v35 = a5;
  v8 = operator new();
  *(_QWORD *)v8 = &off_24F3AF8F8;
  *(_QWORD *)(v8 + 8) = &off_24F3AF888;
  v9 = (XlCoordList *)(v8 + 8);
  *(_QWORD *)(v8 + 24) = 0;
  *(_QWORD *)(v8 + 32) = 0;
  *(_QWORD *)(v8 + 40) = 0;
  *(_QWORD *)(v8 + 48) = 0;
  *(_BYTE *)(v8 + 16) = 1;
  *(_QWORD *)(v8 + 56) = 0;
  *(_QWORD *)(v8 + 64) = 0;
  v32 = (XlLinkTable *)v8;
  v10 = objc_msgSend(v7, "referencesCount");
  if (v10)
  {
    for (i = 0; i != v10; ++i)
    {
      v12 = (XlVertex *)operator new();
      *(_DWORD *)v12 = 0;
      *((_WORD *)v12 + 2) = 0;
      objc_msgSend(v7, "referenceAtIndex:", i);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *((_WORD *)v12 + 1) = objc_msgSend(v13, "firstSheetIndex");

      objc_msgSend(v7, "referenceAtIndex:", i);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *((_WORD *)v12 + 2) = objc_msgSend(v14, "lastSheetIndex");

      objc_msgSend(v7, "referenceAtIndex:", i);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_WORD *)v12 = objc_msgSend(v15, "linkIndex");

      XlCoordList::appendVertex(v9, v12);
    }
  }
  v30 = objc_msgSend(v7, "linksCount", v28);
  if (v30)
  {
    v16 = 0;
    do
    {
      v33 = v16;
      objc_msgSend(v7, "linkAtIndex:");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "type");
      v19 = operator new();
      XlLink::XlLink((XlLink *)v19);
      *(_DWORD *)(v19 + 16) = objc_msgSend(a1, "mapEDLinkTypeToXl:", v18);
      if ((_DWORD)v18 == 1)
        *(_WORD *)(v19 + 20) = objc_msgSend(v29, "sheetCount");
      v34 = v17;
      objc_msgSend(v17, "externalNames");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");
      if (v21)
      {
        for (j = 0; j != v21; ++j)
        {
          v23 = operator new();
          XlExternName::XlExternName((XlExternName *)v23);
          *(_WORD *)(v23 + 12) = 35;
          *(_BYTE *)(v23 + 14) = 9;
          v24 = (unsigned __int8 *)operator new(1uLL);
          *(_WORD *)v24 = 5916;
          XlExternName::setNameDefinition((XlExternName *)v23, v24, 2);
          objc_msgSend(v20, "objectAtIndex:", j);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "string");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_BYTE *)(v23 + 28) = objc_msgSend(v26, "length");

          XlChartPlot::takeDropLineFormat((XlChartPlot *)v23, (XlChartLineStyle *)+[EBString xlStringFromEDString:state:](EBString, "xlStringFromEDString:state:", v25, v35));
          XlExternName::setContentType(v23, 0);
          XlSxExt::appendODBC((XlSxExt *)v19, (XlSxString *)v23);

        }
      }
      XlLinkTable::appendLink(v32, (XlLink *)v19);

      v16 = v33 + 1;
    }
    while (v33 + 1 != v30);
  }

  return v32;
}

+ (int)mapEDLinkTypeToXl:(int)a3
{
  if ((a3 - 1) > 3)
    return 0;
  else
    return dword_22A4C1D20[a3 - 1];
}

@end
