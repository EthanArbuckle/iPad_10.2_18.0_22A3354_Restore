@implementation WiFiSettlementObserver

BOOL __60__WiFiSettlementObserver__handleScanResults_error_userInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[WiFiSettlementContext networkQualifiesForSettlement:](WiFiSettlementContext, "networkQualifiesForSettlement:", a2);
}

- (void)_handleScanResults:(id)a3 error:(id)a4 userInfo:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  WiFiSettlementObserver *v29;
  uint64_t v30;
  WiFiSettlementContext *v31;
  void *v32;
  WiFiSettlementContext *v33;
  unint64_t v34;
  void *v35;
  unint64_t v36;
  id v37;

  v37 = a3;
  v7 = a5;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("resultType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("clientName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("directed"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  NSLog(CFSTR("%s: scanType=%lu client='%@' directed=%d results='%@'"), "-[WiFiSettlementObserver _handleScanResults:error:userInfo:]", v9, v10, v11 != 0, v37);
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "filteredSetUsingPredicate:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[WiFiSettlementObserver currentContext](self, "currentContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {

    }
    else if (objc_msgSend(v13, "count"))
    {
      v31 = [WiFiSettlementContext alloc];
      -[WiFiSettlementObserver configuration](self, "configuration");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[WiFiSettlementContext initWithNetworks:maxCount:](v31, "initWithNetworks:maxCount:", v13, objc_msgSend(v32, "maxNetworksForSettlement"));
      -[WiFiSettlementObserver setCurrentContext:](self, "setCurrentContext:", v33);

      goto LABEL_19;
    }
    -[WiFiSettlementObserver currentContext](self, "currentContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[WiFiSettlementObserver currentContext](self, "currentContext");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "compareWithScanResults:", v13);

      if (!v17)
      {
        v34 = -[WiFiSettlementObserver consecutiveScansWithoutMatch](self, "consecutiveScansWithoutMatch");
        -[WiFiSettlementObserver configuration](self, "configuration");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "maxScansWithoutMatchForUnsettlement");

        if (v34 >= v36)
          -[WiFiSettlementObserver resetSettlement](self, "resetSettlement");
        else
          -[WiFiSettlementObserver setConsecutiveScansWithoutMatch:](self, "setConsecutiveScansWithoutMatch:", -[WiFiSettlementObserver consecutiveScansWithoutMatch](self, "consecutiveScansWithoutMatch") + 1);
        goto LABEL_19;
      }
      -[WiFiSettlementObserver currentContext](self, "currentContext");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "creationDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "timeIntervalSinceNow");
      v21 = -v20;

      NSLog(CFSTR("%s: settled for %.2f seconds"), "-[WiFiSettlementObserver _handleScanResults:error:userInfo:]", *(_QWORD *)&v21);
      -[WiFiSettlementObserver setConsecutiveScansWithoutMatch:](self, "setConsecutiveScansWithoutMatch:", 0);
      -[WiFiSettlementObserver currentContext](self, "currentContext");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "updateNetworks:", v37);

      if (-[WiFiSettlementObserver confidence](self, "confidence")
        || (-[WiFiSettlementObserver configuration](self, "configuration"),
            v23 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v23, "lowConfidenceSettlementTime"),
            v25 = v24,
            v23,
            v25 > v21))
      {
        if (-[WiFiSettlementObserver confidence](self, "confidence") > 1)
          goto LABEL_19;
        -[WiFiSettlementObserver configuration](self, "configuration");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "highConfidenceSettlementTime");
        v28 = v27;

        if (v28 > v21)
          goto LABEL_19;
        v29 = self;
        v30 = 2;
      }
      else
      {
        v29 = self;
        v30 = 1;
      }
      -[WiFiSettlementObserver _updateSettlementStatus:confidence:](v29, "_updateSettlementStatus:confidence:", 1, v30);
    }
LABEL_19:

    goto LABEL_20;
  }
  NSLog(CFSTR("%s: skipping directed scan"), "-[WiFiSettlementObserver _handleScanResults:error:userInfo:]");
LABEL_20:

}

- (WiFiSettlementContext)currentContext
{
  return self->_currentContext;
}

- (unint64_t)consecutiveScansWithoutMatch
{
  return self->_consecutiveScansWithoutMatch;
}

- (void)setConsecutiveScansWithoutMatch:(unint64_t)a3
{
  self->_consecutiveScansWithoutMatch = a3;
}

- (WiFiSettlementConfiguration)configuration
{
  return self->_configuration;
}

- (unint64_t)confidence
{
  return self->_confidence;
}

- (void)_updateSettlementStatus:(int64_t)a3 confidence:(unint64_t)a4
{
  unint64_t confidence;
  unint64_t *p_confidence;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (self->_status != a3)
  {
    NSLog(CFSTR("%s: settlement status changed from %ld -> %ld"), a2, "-[WiFiSettlementObserver _updateSettlementStatus:confidence:]", self->_status, a3);
    self->_status = a3;
    if (a3 == 1)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[WiFiSettlementObserver setSettledDate:](self, "setSettledDate:", v9);

    }
    else
    {
      -[WiFiSettlementObserver setSettledDate:](self, "setSettledDate:", 0);
    }
    p_confidence = &self->_confidence;
    confidence = self->_confidence;
    if (confidence == a4)
      goto LABEL_9;
    goto LABEL_8;
  }
  p_confidence = &self->_confidence;
  confidence = self->_confidence;
  if (confidence != a4)
  {
LABEL_8:
    NSLog(CFSTR("%s: settlement confidence changed from %lu -> %lu"), a2, "-[WiFiSettlementObserver _updateSettlementStatus:confidence:]", confidence, a4);
    *p_confidence = a4;
LABEL_9:
    v12 = CFSTR("confidence");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_confidence);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[WiFiSettlementObserver _callSettlementCallbackWithStatus:userInfo:](self, "_callSettlementCallbackWithStatus:userInfo:", self->_status, v11);
  }
}

- (void)setSettledDate:(id)a3
{
  self->_settledDate = (NSDate *)a3;
}

- (void)_callSettlementCallbackWithStatus:(int64_t)a3 userInfo:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[WiFiSettlementObserver callbacks](self, "callbacks", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++) + 16))();
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (NSMutableArray)callbacks
{
  return self->_callbacks;
}

void __61__WiFiSettlementObserver_initWithScanProvider_configuration___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id v9;
  id WeakRetained;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "_handleScanResults:error:userInfo:", v9, v8, v7);

}

- (WiFiSettlementObserver)initWithScanProvider:(id)a3 configuration:(id)a4
{
  id v7;
  id v8;
  WiFiSettlementObserver *v9;
  WiFiSettlementObserver *v10;
  NSMutableArray *v11;
  NSMutableArray *callbacks;
  WiFiScanProvider *scanProvider;
  _QWORD v15[4];
  id v16;
  id location;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)WiFiSettlementObserver;
  v9 = -[WiFiSettlementObserver init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_scanProvider, a3);
    objc_storeStrong((id *)&v10->_configuration, a4);
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    callbacks = v10->_callbacks;
    v10->_callbacks = v11;

    NSLog(CFSTR("%s: configuration: %@"), "-[WiFiSettlementObserver initWithScanProvider:configuration:]", v8);
    objc_initWeak(&location, v10);
    scanProvider = v10->_scanProvider;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __61__WiFiSettlementObserver_initWithScanProvider_configuration___block_invoke;
    v15[3] = &unk_1E881CC50;
    objc_copyWeak(&v16, &location);
    -[WiFiScanProvider addScanResultsCallback:](scanProvider, "addScanResultsCallback:", v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (void)addSettlementCallback:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = a3;
    -[WiFiSettlementObserver callbacks](self, "callbacks");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1D17AC9EC](v4);

    objc_msgSend(v6, "addObject:", v5);
  }
}

- (void)removeSettlementCallback:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = a3;
    -[WiFiSettlementObserver callbacks](self, "callbacks");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1D17AC9EC](v4);

    objc_msgSend(v6, "removeObject:", v5);
  }
}

- (void)resetSettlement
{
  NSLog(CFSTR("%s: resetting settlement"), a2, "-[WiFiSettlementObserver resetSettlement]");
  -[WiFiSettlementObserver setCurrentContext:](self, "setCurrentContext:", 0);
  -[WiFiSettlementObserver setConsecutiveScansWithoutMatch:](self, "setConsecutiveScansWithoutMatch:", 0);
  -[WiFiSettlementObserver _updateSettlementStatus:confidence:](self, "_updateSettlementStatus:confidence:", 0, 0);
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (void)setConfidence:(unint64_t)a3
{
  self->_confidence = a3;
}

- (NSDate)settledDate
{
  return self->_settledDate;
}

- (WiFiScanProvider)scanProvider
{
  return self->_scanProvider;
}

- (void)setScanProvider:(id)a3
{
  objc_storeStrong((id *)&self->_scanProvider, a3);
}

- (void)setCurrentContext:(id)a3
{
  objc_storeStrong((id *)&self->_currentContext, a3);
}

- (void)setCallbacks:(id)a3
{
  objc_storeStrong((id *)&self->_callbacks, a3);
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_callbacks, 0);
  objc_storeStrong((id *)&self->_currentContext, 0);
  objc_storeStrong((id *)&self->_scanProvider, 0);
}

@end
