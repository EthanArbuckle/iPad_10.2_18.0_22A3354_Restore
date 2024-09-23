@implementation CHBTrendLineLabel

+ (id)readFrom:(void *)a3 state:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t CachedCustomLabel;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v5 = a4;
  v6 = v5;
  if (a3)
  {
    objc_msgSend(v5, "resources");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CHDTrendlineLabel trendlineLabelWithResources:](CHDTrendlineLabel, "trendlineLabelWithResources:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (((*((_DWORD *)a3 + 20) - *((_DWORD *)a3 + 18)) & 0x7FFF8) != 0)
    {
      CachedCustomLabel = XlChartDataSeries::getCachedCustomLabel((XlChartDataSeries *)a3, 0);
      v10 = CachedCustomLabel;
      if (CachedCustomLabel)
      {
        v11 = *(_QWORD *)(CachedCustomLabel + 104);
        v12 = *(__int16 *)(CachedCustomLabel + 178);
        v13 = objc_opt_class();
        objc_msgSend(v6, "ebReaderSheetState");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[EBFormula edFormulaFromXlFmlaDefinition:withFormulaLength:formulaClass:state:](EBFormula, "edFormulaFromXlFmlaDefinition:withFormulaLength:formulaClass:state:", v11, v12, v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v6, "workbook");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setWorkbook:", v16);

        }
        objc_msgSend(v6, "chart");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setName:chart:", v15, v17);

        objc_msgSend(v8, "setContentFormatId:", *(__int16 *)(v10 + 184));
        objc_msgSend(v8, "setIsContentFormatDerivedFromDataPoints:", *(unsigned __int8 *)(v10 + 202));
        objc_msgSend(v8, "setGeneratedText:", *(unsigned __int8 *)(v10 + 192));
        objc_msgSend(v8, "setAutomaticLabelDeleted:", *(unsigned __int8 *)(v10 + 193));
        +[CHBString edStringFromXlChartTextFrame:state:](CHBString, "edStringFromXlChartTextFrame:state:", v10, v6);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setLastCachedName:", v18);

        +[CHBGraphicProperties oadGraphicPropertiesFromXlChartTextFrame:state:](CHBGraphicProperties, "oadGraphicPropertiesFromXlChartTextFrame:state:", v10, v6);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setGraphicProperties:", v19);

      }
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
