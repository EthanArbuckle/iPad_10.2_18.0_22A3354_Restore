@implementation WBList

+ (void)readFrom:(id)a3 list:(id)a4 override:(void *)a5
{
  id v7;
  unsigned int v8;
  int v9;
  int v10;
  uint64_t DefaultFormat;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v7 = a4;
  v8 = *((_DWORD *)a5 + 8) - *((_DWORD *)a5 + 6);
  v9 = (v8 >> 3);
  if ((v8 >> 3))
  {
    v10 = 0;
    do
    {
      DefaultFormat = XlChartDataSeries::getDefaultFormat((XlChartDataSeries *)a5, v10);
      objc_msgSend(v7, "addLevelOverrideWithLevel:", *(unsigned __int8 *)(DefaultFormat + 20));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "targetDocument");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[WBListLevelOverride readFrom:listLevelOverride:formatOverride:document:](WBListLevelOverride, "readFrom:listLevelOverride:formatOverride:document:", v14, v12, DefaultFormat, v13);

      ++v10;
    }
    while (v9 != v10);
  }

}

+ (void)write:(id)a3 list:(id)a4 to:(void *)a5
{
  id v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "levelOverrideCount");
  WrdListFormatOverride::setNumberOfLevelsOverridden((WrdListFormatOverride *)a5, v8);
  *((_DWORD *)a5 + 4) = objc_msgSend(v7, "listDefinitionId");
  if (v8)
  {
    for (i = 0; i != v8; ++i)
    {
      objc_msgSend(v7, "levelOverrideAt:", i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[WBListLevelOverride write:listLevelOverride:wrdFormatOverride:](WBListLevelOverride, "write:listLevelOverride:wrdFormatOverride:", v11, v10, XlChartDataSeries::getDefaultFormat((XlChartDataSeries *)a5, i));

    }
  }

}

@end
