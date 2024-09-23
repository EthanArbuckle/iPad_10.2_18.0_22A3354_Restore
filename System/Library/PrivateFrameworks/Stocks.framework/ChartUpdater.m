@implementation ChartUpdater

+ (id)_rangeStringForInterval:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 7)
    return CFSTR("1d");
  else
    return off_24D74BA40[a3 - 1];
}

- (void)cancel
{
  StockChartData *currentChartData;
  objc_super v4;

  currentChartData = self->_currentChartData;
  self->_currentChartData = 0;

  v4.receiver = self;
  v4.super_class = (Class)ChartUpdater;
  -[YQLRequest cancel](&v4, sel_cancel);
}

- (BOOL)updateChartForStock:(id)a3 interval:(int64_t)a4
{
  return -[ChartUpdater updateChartForStock:interval:withCompletion:](self, "updateChartForStock:interval:withCompletion:", a3, a4, 0);
}

- (BOOL)updateChartForStock:(id)a3 interval:(int64_t)a4 withCompletion:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  id updateCompletionHandler;
  void *v17;
  NSObject *v18;
  BOOL v19;
  void (**v20)(id, uint64_t, _QWORD);
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  _QWORD block[5];
  _QWORD v38[6];
  _QWORD v39[8];

  v39[6] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  StocksLogForCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[ChartUpdater updateChartForStock:interval:withCompletion:].cold.2(v9, a4, v11);

  +[NetPreferences sharedPreferences](NetPreferences, "sharedPreferences");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isNetworkReachable");

  if ((v13 & 1) != 0)
  {
    objc_msgSend(v9, "symbol");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "length"))
    {
      -[ChartUpdater cancel](self, "cancel");
      v15 = (void *)objc_msgSend(v10, "copy");
      updateCompletionHandler = self->_updateCompletionHandler;
      self->_updateCompletionHandler = v15;

      objc_storeStrong((id *)&self->_stock, a3);
      self->_interval = a4;
      objc_msgSend(v9, "chartDataForInterval:", a4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        StocksLogForCategory(0);
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          -[ChartUpdater updateChartForStock:interval:withCompletion:].cold.1();

        objc_storeStrong((id *)&self->_currentChartData, v17);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __60__ChartUpdater_updateChartForStock_interval_withCompletion___block_invoke;
        block[3] = &unk_24D74B7C0;
        block[4] = self;
        dispatch_async(MEMORY[0x24BDAC9B8], block);
        v19 = 1;
      }
      else
      {
        +[NetPreferences sharedPreferences](NetPreferences, "sharedPreferences");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[YQLRequest YQLLanguageCode](self, "YQLLanguageCode");
        v22 = objc_claimAutoreleasedReturnValue();
        -[YQLRequest YQLCountryCode](self, "YQLCountryCode");
        v23 = objc_claimAutoreleasedReturnValue();
        v39[0] = CFSTR("json");
        v38[0] = CFSTR("format");
        v38[1] = CFSTR("ticker");
        objc_msgSend(v9, "symbol");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v39[1] = v24;
        v38[2] = CFSTR("range");
        +[ChartUpdater _rangeStringForInterval:](ChartUpdater, "_rangeStringForInterval:", a4);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v39[2] = v25;
        v39[3] = v22;
        v35 = (void *)v23;
        v36 = (void *)v22;
        v38[3] = CFSTR("lang");
        v38[4] = CFSTR("region");
        v38[5] = CFSTR("type");
        v39[4] = v23;
        v39[5] = CFSTR("quote");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, v38, 6);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v21, "stocksYQLBaseURL");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "URLByAppendingPathComponent:", CFSTR("/applewf/chart"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v21, "signedRequestForURL:parameters:", v28, v26);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v21;
        if (objc_msgSend(v21, "serviceDebugging"))
        {
          objc_msgSend(v29, "URL");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "absoluteString");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          +[YQLRequest appendDebugString:](YQLRequest, "appendDebugString:", v32);

          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v26);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v21;
          +[YQLRequest appendDebugString:](YQLRequest, "appendDebugString:", v33);

        }
        -[YQLRequest loadRequest:](self, "loadRequest:", v29);

        v19 = 0;
        v17 = 0;
      }
      goto LABEL_16;
    }
    v20 = (void (**)(id, uint64_t, _QWORD))self->_updateCompletionHandler;
    if (v20)
    {
      v19 = 1;
      v20[2](v20, 1, 0);
      v17 = self->_updateCompletionHandler;
      self->_updateCompletionHandler = 0;
LABEL_16:

      goto LABEL_17;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.stocks"), 3, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ChartUpdater failWithError:](self, "failWithError:", v14);
  }
  v19 = 1;
LABEL_17:

  return v19;
}

uint64_t __60__ChartUpdater_updateChartForStock_interval_withCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didParseData");
}

- (void)parseData:(id)a3
{
  id v4;
  void *v5;
  id v6;
  BOOL v7;
  void *v8;
  id v9;

  v4 = a3;
  v9 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v4, 0, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  if (v6)
    v7 = 1;
  else
    v7 = v5 == 0;
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    -[YQLRequest failToParseWithData:](self, "failToParseWithData:", v4);

  }
  else
  {
    +[YahooResponseParser dictionaryWithDictionaryKeyPath:inJSONObject:](YahooResponseParser, "dictionaryWithDictionaryKeyPath:inJSONObject:", &unk_24D760A90, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      -[ChartUpdater parseDataSeriesDictionary:](self, "parseDataSeriesDictionary:", v8);
    else
      -[YQLRequest failToParseWithData:](self, "failToParseWithData:", v4);

  }
}

- (void)parseDataSeriesDictionary:(id)a3 interval:(int64_t)a4
{
  self->_interval = a4;
  -[ChartUpdater parseDataSeriesDictionary:](self, "parseDataSeriesDictionary:", a3);
}

- (void)parseDataSeriesDictionary:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  StockChartData *v10;
  StockChartData *currentChartData;
  void *v12;
  StockChartData *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  StockChartData *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  StockChartData *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  StockChartData *v46;
  $87A9BE3275E22128A73FF46D0B92144E *v47;
  uint64_t v48;
  uint64_t v49;
  double v50;
  uint64_t j;
  void *v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  double v63;
  void *v64;
  uint64_t v65;
  id v66;
  NSObject *v67;
  BOOL v68;
  double var1;
  double var0;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  id v78;
  void *v79;
  uint64_t v80;
  id v81;
  id obj;
  id v83;
  uint64_t v84;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _QWORD v94[4];
  id v95;
  _QWORD v96[4];
  id v97;
  uint64_t *v98;
  $87A9BE3275E22128A73FF46D0B92144E *v99;
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  char v103;
  _BYTE v104[128];
  _BYTE v105[128];
  _QWORD v106[2];
  _QWORD v107[2];
  _QWORD v108[2];
  uint8_t buf[4];
  id v110;
  __int16 v111;
  id v112;
  uint64_t v113;

  v113 = *MEMORY[0x24BDAC8D0];
  v78 = a3;
  +[YahooResponseParser objectOfClass:withDictionaryKeyPath:inJSONObject:](YahooResponseParser, "objectOfClass:withDictionaryKeyPath:inJSONObject:", objc_opt_class(), &unk_24D760AA8, v78);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = v3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v94[0] = MEMORY[0x24BDAC760];
    v94[1] = 3221225472;
    v94[2] = __42__ChartUpdater_parseDataSeriesDictionary___block_invoke;
    v94[3] = &unk_24D74B9F8;
    v83 = v4;
    v95 = v83;
    objc_msgSend(v79, "enumerateObjectsUsingBlock:", v94);
    v5 = objc_msgSend(v83, "count");
    if (v5 != objc_msgSend(v79, "count"))
    {
      -[YQLRequest failToParseWithDataSeriesDictionary:](self, "failToParseWithDataSeriesDictionary:", v78);
LABEL_80:

      goto LABEL_81;
    }
    v6 = objc_opt_class();
    v108[0] = CFSTR("reference-meta");
    v108[1] = CFSTR("type");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v108, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[YahooResponseParser objectOfClass:withDictionaryKeyPath:inJSONObject:](YahooResponseParser, "objectOfClass:withDictionaryKeyPath:inJSONObject:", v6, v7, v78);
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v76
      || (v80 = objc_msgSend(v76, "caseInsensitiveCompare:", CFSTR("timestamp"))) != 0
      && objc_msgSend(v76, "caseInsensitiveCompare:", CFSTR("date")))
    {
      -[YQLRequest failToParseWithDataSeriesDictionary:](self, "failToParseWithDataSeriesDictionary:", v78);
LABEL_79:

      goto LABEL_80;
    }
    +[YahooResponseParser objectOfClass:withDictionaryKeyPath:inJSONObject:](YahooResponseParser, "objectOfClass:withDictionaryKeyPath:inJSONObject:", objc_opt_class(), &unk_24D760AC0, v78);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v8;
    if (v8 && (v9 = objc_msgSend(v8, "count")) != 0)
    {
      if (!self->_currentChartData)
      {
        v10 = -[StockChartData initWithStock:interval:]([StockChartData alloc], "initWithStock:interval:", self->_stock, self->_interval);
        currentChartData = self->_currentChartData;
        self->_currentChartData = v10;

      }
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithDictionary:", v78);
      -[StockChartData setDataSeriesDict:](self->_currentChartData, "setDataSeriesDict:", v12);

      -[StockChartData allocateStockValuesWithCount:](self->_currentChartData, "allocateStockValuesWithCount:", v9);
      v13 = self->_currentChartData;
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[StockChartData setInterestingIndexes:](v13, "setInterestingIndexes:", v14);

      v15 = objc_opt_class();
      v107[0] = CFSTR("reference-meta");
      v107[1] = CFSTR("open");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v107, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[YahooResponseParser objectOfClass:withDictionaryKeyPath:inJSONObject:](YahooResponseParser, "objectOfClass:withDictionaryKeyPath:inJSONObject:", v15, v16, v78);
      v74 = (void *)objc_claimAutoreleasedReturnValue();

      if (v74)
      {
        v17 = self->_currentChartData;
        objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)objc_msgSend(v74, "integerValue"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[StockChartData setMarketOpenDate:](v17, "setMarketOpenDate:", v18);

        StocksLogForCategory(0);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          -[ChartUpdater parseDataSeriesDictionary:].cold.2((uint64_t)v74, v19, v20, v21, v22, v23, v24, v25);

      }
      v26 = objc_opt_class();
      v106[0] = CFSTR("reference-meta");
      v106[1] = CFSTR("close");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v106, 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      +[YahooResponseParser objectOfClass:withDictionaryKeyPath:inJSONObject:](YahooResponseParser, "objectOfClass:withDictionaryKeyPath:inJSONObject:", v26, v27, v78);
      v73 = (void *)objc_claimAutoreleasedReturnValue();

      if (v73)
      {
        v28 = self->_currentChartData;
        objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)objc_msgSend(v73, "integerValue"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[StockChartData setMarketCloseDate:](v28, "setMarketCloseDate:", v29);

        StocksLogForCategory(0);
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          -[ChartUpdater parseDataSeriesDictionary:].cold.1((uint64_t)v73, v30, v31, v32, v33, v34, v35, v36);

      }
      +[YahooResponseParser objectOfClass:withDictionaryKeyPath:inJSONObject:](YahooResponseParser, "objectOfClass:withDictionaryKeyPath:inJSONObject:", objc_opt_class(), &unk_24D760AD8, v78);
      v92 = 0u;
      v93 = 0u;
      v90 = 0u;
      v91 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v105, 16);
      if (v37)
      {
        v38 = *(_QWORD *)v91;
        do
        {
          for (i = 0; i != v37; ++i)
          {
            if (*(_QWORD *)v91 != v38)
              objc_enumerationMutation(obj);
            v40 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v41 = v40;
              objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("name"));
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("content"));
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v44 = v42;
                  if (objc_msgSend(v44, "isEqualToString:", CFSTR("gmtoffset")))
                  {
                    objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneForSecondsFromGMT:", objc_msgSend(v43, "integerValue"));
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    -[StockChartData setMarketTimeZone:](self->_currentChartData, "setMarketTimeZone:", v45);

                  }
                  else if (objc_msgSend(v44, "isEqualToString:", CFSTR("previous_close")))
                  {
                    v46 = self->_currentChartData;
                    objc_msgSend(v43, "floatValue");
                    -[StockChartData setPreviousClosePrice:](v46, "setPreviousClosePrice:");
                  }

                }
              }

            }
          }
          v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v105, 16);
        }
        while (v37);
      }

      v47 = -[StockChartData stockValues](self->_currentChartData, "stockValues");
      v88 = 0u;
      v89 = 0u;
      v86 = 0u;
      v87 = 0u;
      v81 = v75;
      v48 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v86, v104, 16);
      if (v48)
      {
        v84 = 0;
        v49 = *(_QWORD *)v87;
        v77 = *MEMORY[0x24BDBCA18];
        v50 = 0.0;
        do
        {
          for (j = 0; j != v48; ++j)
          {
            if (*(_QWORD *)v87 != v49)
              objc_enumerationMutation(v81);
            v52 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v53 = v52;
              v54 = v83;
              v100 = 0;
              v101 = &v100;
              v102 = 0x2020000000;
              v103 = 1;
              objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("ref"));
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              v56 = v55;
              if (v55)
              {
                if (v80)
                {
                  v57 = (void *)parseEntryIntoStruct_dateFormatter;
                  if (!parseEntryIntoStruct_dateFormatter)
                  {
                    v58 = objc_alloc_init(MEMORY[0x24BDD1500]);
                    v59 = (void *)parseEntryIntoStruct_dateFormatter;
                    parseEntryIntoStruct_dateFormatter = (uint64_t)v58;

                    v60 = (void *)parseEntryIntoStruct_dateFormatter;
                    objc_msgSend(MEMORY[0x24BDBCE48], "calendarWithIdentifier:", v77);
                    v61 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v60, "setCalendar:", v61);

                    objc_msgSend((id)parseEntryIntoStruct_dateFormatter, "setDateFormat:", CFSTR("yyyyMMdd"));
                    v57 = (void *)parseEntryIntoStruct_dateFormatter;
                  }
                  objc_msgSend(v57, "dateFromString:", v56);
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v62, "timeIntervalSince1970");
                  v47->var0 = v63;

                }
                else
                {
                  v47->var0 = (double)objc_msgSend(v55, "longLongValue");
                }
              }
              else
              {
                *((_BYTE *)v101 + 24) = 0;
              }
              objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("v"));
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              if (v64
                && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
                && (v65 = objc_msgSend(v64, "count"), v65 == objc_msgSend(v54, "count")))
              {
                v96[0] = MEMORY[0x24BDAC760];
                v96[1] = 3221225472;
                v96[2] = __parseEntryIntoStruct_block_invoke;
                v96[3] = &unk_24D74BA20;
                v66 = v64;
                v97 = v66;
                v98 = &v100;
                v99 = v47;
                objc_msgSend(v54, "enumerateObjectsUsingBlock:", v96);

                if (*((_BYTE *)v101 + 24))
                {

                  _Block_object_dispose(&v100, 8);
LABEL_59:
                  var1 = v47->var1;
                  if (!-[StockChartData minValue](self->_currentChartData, "minValue")
                    || var1 < (double)-[StockChartData minValue](self->_currentChartData, "minValue")[8])
                  {
                    -[StockChartData setMinValue:](self->_currentChartData, "setMinValue:", v47);
                  }
                  if (!-[StockChartData maxValue](self->_currentChartData, "maxValue")
                    || var1 > (double)-[StockChartData maxValue](self->_currentChartData, "maxValue")[8])
                  {
                    -[StockChartData setMaxValue:](self->_currentChartData, "setMaxValue:", v47);
                  }
                  if (v47->var2)
                    -[StockChartData setHasVolume:](self->_currentChartData, "setHasVolume:", 1);
                  if (-[StockChartData chartInterval](self->_currentChartData, "chartInterval"))
                  {
                    var0 = v50;
                  }
                  else
                  {
                    var0 = v47->var0;
                    if (v50 != 0.0 && var0 - v50 > 3600.0)
                    {
                      -[StockChartData interestingIndexes](self->_currentChartData, "interestingIndexes");
                      v71 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v84);
                      v72 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v71, "addObject:", v72);

                      var0 = v47->var0;
                    }
                  }
                  ++v47;
                  ++v84;
                  v50 = var0;
                  continue;
                }
              }
              else
              {
                *((_BYTE *)v101 + 24) = 0;
              }
              StocksLogForCategory(0);
              v67 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v110 = v53;
                v111 = 2112;
                v112 = v83;
                _os_log_error_impl(&dword_21736B000, v67, OS_LOG_TYPE_ERROR, "#chartupdater Chart entry %@ has unexpected format or does not match column mapping %@", buf, 0x16u);
              }

              v68 = *((_BYTE *)v101 + 24) == 0;
              _Block_object_dispose(&v100, 8);

              if (!v68)
                goto LABEL_59;
            }
          }
          v48 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v86, v104, 16);
        }
        while (v48);
      }

      -[ChartUpdater didParseData](self, "didParseData");
    }
    else
    {
      -[YQLRequest failToParseWithDataSeriesDictionary:](self, "failToParseWithDataSeriesDictionary:", v78);
    }

    goto LABEL_79;
  }
  -[YQLRequest failToParseWithDataSeriesDictionary:](self, "failToParseWithDataSeriesDictionary:", v78);
LABEL_81:

}

void __42__ChartUpdater_parseDataSeriesDictionary___block_invoke(uint64_t a1, void *a2)
{
  char isKindOfClass;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = v6;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("id"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

    v4 = v6;
  }

}

- (void)didParseData
{
  StockChartData *currentChartData;
  double *v4;
  int v5;
  void *v6;
  uint64_t v7;
  $87A9BE3275E22128A73FF46D0B92144E *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  double *v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *WeakRetained;
  StockChartData *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  double v55;
  void *v56;
  void *v57;
  double v58;
  void *v59;
  void (**updateCompletionHandler)(id, uint64_t, _QWORD);
  id v61;

  currentChartData = self->_currentChartData;
  if (currentChartData)
  {
    v4 = -[StockChartData stockValues](currentChartData, "stockValues");
    v5 = -[StockChartData stockValueCount](self->_currentChartData, "stockValueCount");
    if (-[StockChartData isUnavailable](self->_currentChartData, "isUnavailable"))
    {
      v6 = (void *)MEMORY[0x24BDD1540];
      v7 = 2;
LABEL_18:
      objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("com.apple.stocks"), v7, 0);
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
      -[ChartUpdater failWithError:](self, "failWithError:", WeakRetained);
LABEL_19:

      v32 = self->_currentChartData;
      self->_currentChartData = 0;

      return;
    }
    if (v5 < 2
      || (v8 = -[StockChartData maxValue](self->_currentChartData, "maxValue"),
          v8 == -[StockChartData minValue](self->_currentChartData, "minValue")))
    {
      v6 = (void *)MEMORY[0x24BDD1540];
      v7 = 1;
      goto LABEL_18;
    }
    -[StockChartData marketOpenDate](self->_currentChartData, "marketOpenDate");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!v9)
      goto LABEL_22;
    v10 = (void *)v9;
    -[StockChartData marketCloseDate](self->_currentChartData, "marketCloseDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      goto LABEL_22;
    if (-[StockChartData chartInterval](self->_currentChartData, "chartInterval"))
      goto LABEL_25;
    v12 = *v4;
    -[StockChartData marketCloseDate](self->_currentChartData, "marketCloseDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSince1970");
    if (v12 <= v14)
    {
      v15 = &v4[3 * (v5 - 1)];
      v16 = *v15;
      -[StockChartData marketOpenDate](self->_currentChartData, "marketOpenDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "timeIntervalSince1970");
      v19 = v18;

      if (v16 < v19)
        goto LABEL_22;
      v20 = objc_alloc(MEMORY[0x24BDBCE48]);
      v21 = (void *)objc_msgSend(v20, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
      -[StockChartData marketOpenDate](self->_currentChartData, "marketOpenDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[StockChartData marketCloseDate](self->_currentChartData, "marketCloseDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "components:fromDate:toDate:options:", 96, v22, v23, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v13, "hour") != 24 || objc_msgSend(v13, "minute"))
        goto LABEL_24;
      v24 = *v4;
      -[StockChartData marketOpenDate](self->_currentChartData, "marketOpenDate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "timeIntervalSince1970");
      if (v24 >= v26)
      {
        v27 = *v15;
        -[StockChartData marketCloseDate](self->_currentChartData, "marketCloseDate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "timeIntervalSince1970");
        v30 = v29;

        if (v27 <= v30)
          goto LABEL_25;
LABEL_22:
        objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", *v4);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[StockChartData setMarketOpenDate:](self->_currentChartData, "setMarketOpenDate:", v33);

        objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", v4[3 * (v5 - 1)]);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[StockChartData setMarketCloseDate:](self->_currentChartData, "setMarketCloseDate:", v34);

        if (!-[StockChartData chartInterval](self->_currentChartData, "chartInterval"))
        {
          objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[StockChartData marketOpenDate](self->_currentChartData, "marketOpenDate");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "components:fromDate:", 32, v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "hour") - 9;

          v39 = (void *)MEMORY[0x24BDBCF38];
          objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "timeZoneForSecondsFromGMT:", (uint64_t)((double)objc_msgSend(v40, "secondsFromGMT") + (double)v38 * -3600.0));
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          -[StockChartData setMarketTimeZone:](self->_currentChartData, "setMarketTimeZone:", v13);
LABEL_24:

        }
LABEL_25:
        if (!-[StockChartData chartInterval](self->_currentChartData, "chartInterval"))
        {
          objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = (void *)objc_msgSend(v41, "copy");

          -[StockChartData marketTimeZone](self->_currentChartData, "marketTimeZone");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setTimeZone:", v43);

          -[StockChartData marketOpenDate](self->_currentChartData, "marketOpenDate");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "components:fromDate:", 192, v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          v46 = objc_msgSend(v45, "minute");
          v47 = objc_msgSend(v45, "second") + 60 * v46;
          if ((unint64_t)(v47 - 1) <= 0x382)
          {
            v48 = (double)v47;
            -[StockChartData marketOpenDate](self->_currentChartData, "marketOpenDate");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "dateByAddingTimeInterval:", -v48);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            -[StockChartData setMarketOpenDate:](self->_currentChartData, "setMarketOpenDate:", v50);

          }
          -[StockChartData marketCloseDate](self->_currentChartData, "marketCloseDate");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "components:fromDate:", 192, v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();

          v53 = 60 - objc_msgSend(v52, "minute");
          v54 = 60 * v53 - objc_msgSend(v52, "second");
          if ((unint64_t)(v54 - 1) <= 0x382)
          {
            v55 = (double)v54;
            -[StockChartData marketCloseDate](self->_currentChartData, "marketCloseDate");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "dateByAddingTimeInterval:", v55);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            -[StockChartData setMarketCloseDate:](self->_currentChartData, "setMarketCloseDate:", v57);

          }
        }
        v58 = 0.0;
        if (v5 >= 3)
          v58 = v4[3 * (v5 - 1)] - v4[3 * (v5 - 3)];
        -[StockChartData setExpirationTime:](self->_currentChartData, "setExpirationTime:", v58 + CFAbsoluteTimeGetCurrent());
        -[StockChartData stock](self->_currentChartData, "stock");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "setChartData:forInterval:", self->_currentChartData, -[StockChartData chartInterval](self->_currentChartData, "chartInterval"));

        updateCompletionHandler = (void (**)(id, uint64_t, _QWORD))self->_updateCompletionHandler;
        if (updateCompletionHandler)
        {
          updateCompletionHandler[2](updateCompletionHandler, 1, 0);
          v61 = self->_updateCompletionHandler;
          self->_updateCompletionHandler = 0;

        }
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "chartUpdater:didReceiveStockChartData:", self, self->_currentChartData);
        goto LABEL_19;
      }

    }
    goto LABEL_22;
  }
}

- (void)failWithError:(id)a3
{
  id v4;
  id WeakRetained;
  void (**updateCompletionHandler)(id, _QWORD, id);
  id v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ChartUpdater;
  -[YQLRequest failWithError:](&v8, sel_failWithError_, v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "chartUpdater:didFailWithError:", self, v4);

  updateCompletionHandler = (void (**)(id, _QWORD, id))self->_updateCompletionHandler;
  if (updateCompletionHandler)
  {
    updateCompletionHandler[2](updateCompletionHandler, 0, v4);
    v7 = self->_updateCompletionHandler;
    self->_updateCompletionHandler = 0;

  }
}

- (id)dataSeries
{
  void *v2;
  void *v3;
  void *v4;

  -[Stock chartDataForInterval:](self->_stock, "chartDataForInterval:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "dataSeriesDict");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (ChartUpdaterDelegate)delegate
{
  return (ChartUpdaterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)interval
{
  return self->_interval;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_updateCompletionHandler, 0);
  objc_storeStrong((id *)&self->_currentChartData, 0);
  objc_storeStrong((id *)&self->_stock, 0);
}

- (void)updateChartForStock:interval:withCompletion:.cold.1()
{
  int v0;
  NSObject *v1;
  uint8_t v2[14];
  int v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  v3 = v0;
  OUTLINED_FUNCTION_2_0(&dword_21736B000, v1, (uint64_t)v1, "#chartupdater Returning cached chart data for symbol %@ interval %i", v2);
  OUTLINED_FUNCTION_3();
}

- (void)updateChartForStock:(void *)a1 interval:(int)a2 withCompletion:(NSObject *)a3 .cold.2(void *a1, int a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint8_t v7[14];
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "symbol");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  v8 = a2;
  OUTLINED_FUNCTION_2_0(&dword_21736B000, a3, v6, "#chartupdater updateChartForStock: %@ interval: %i", v7);

}

- (void)parseData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[ChartUpdater parseData:]";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_21736B000, a2, OS_LOG_TYPE_ERROR, "#chartupdater *** [%s] Caught exception: %@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_3();
}

- (void)parseDataSeriesDictionary:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21736B000, a2, a3, "#chartupdater marketCloseStr %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)parseDataSeriesDictionary:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21736B000, a2, a3, "#chartupdater marketOpenStr %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

@end
