@implementation WiFiUsageLQMWindowAnalysisLinkTest

- (WiFiUsageLQMWindowAnalysisLinkTest)initWithRollingWindow:(id)a3 andReason:(id)a4 withWFMeasureResults:(id)a5 andContext:(context)a6 andTimestamp:(id)a7 onQueue:(id)a8
{
  uint64_t v12;
  id v13;
  id v14;
  WiFiUsageLQMWindowAnalysisLinkTest *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)WiFiUsageLQMWindowAnalysisLinkTest;
  v12 = *(_QWORD *)&a6.var0 & 0xFFFFFFLL;
  v13 = a5;
  v14 = a4;
  v15 = -[WiFiUsageLQMWindowAnalysis initWithRollingWindow:andReason:andContext:andTimestamp:onQueue:](&v17, sel_initWithRollingWindow_andReason_andContext_andTimestamp_onQueue_, a3, CFSTR("LinkTest"), v12, a7, a8);
  -[WiFiUsageLQMWindowAnalysisLinkTest setLinkTestResults:](v15, "setLinkTestResults:", v13, v17.receiver, v17.super_class);

  -[WiFiUsageLQMWindowAnalysisLinkTest setLinkTestReason:](v15, "setLinkTestReason:", v14);
  return v15;
}

- (id)addDimensionsTo:(id)a3
{
  id v4;
  id v5;
  void *v6;
  WiFiUsageLQMWindowAnalysisLinkTest *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)WiFiUsageLQMWindowAnalysisLinkTest;
  v5 = -[WiFiUsageLQMWindowAnalysis addDimensionsTo:](&v26, sel_addDimensionsTo_, v4);
  v6 = v4;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_linkTestReason, CFSTR("linktest_reason"));
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = self;
  -[WFMeasureResult allPrimitiveProperties](self->_linkTestResults, "allPrimitiveProperties");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        -[WFMeasureResult binnedProperty:](self->_linkTestResults, "binnedProperty:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("linktest_%@"), v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, v14);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v9);
  }

  -[WFMeasureResult typeAsString](self->_linkTestResults, "typeAsString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v6;
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("linktest_type"));

  -[WFMeasureResult statusForLocal](v7->_linkTestResults, "statusForLocal");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setValue:forKey:", v17, CFSTR("linktest_statusForLocal"));

  -[WFMeasureResult statusForInternet](v7->_linkTestResults, "statusForInternet");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setValue:forKey:", v18, CFSTR("linktest_statusForInternet"));

  -[WFMeasureResult statusForDNS](v7->_linkTestResults, "statusForDNS");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setValue:forKey:", v19, CFSTR("linktest_statusForDNS"));

  return v16;
}

- (WFMeasureResult)linkTestResults
{
  return self->_linkTestResults;
}

- (void)setLinkTestResults:(id)a3
{
  objc_storeStrong((id *)&self->_linkTestResults, a3);
}

- (NSString)linkTestReason
{
  return self->_linkTestReason;
}

- (void)setLinkTestReason:(id)a3
{
  objc_storeStrong((id *)&self->_linkTestReason, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkTestReason, 0);
  objc_storeStrong((id *)&self->_linkTestResults, 0);
}

@end
