@implementation Stock

+ (id)urlForStockSymbol:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return 0;
  v8 = CFSTR("symbol");
  v9[0] = a3;
  v3 = (void *)MEMORY[0x24BDBCE70];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[StocksOpenURLHelper URLForStockComponents:](StocksOpenURLHelper, "URLForStockComponents:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)urlForStock:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "symbol");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "urlForStockSymbol:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)symbolForURL:(id)a3
{
  void *v3;
  void *v4;

  +[StocksOpenURLHelper componentDictionaryFromURL:](StocksOpenURLHelper, "componentDictionaryFromURL:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("symbol"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)BlankValueString
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)BlankValueString_blankValueString;
  if (!BlankValueString_blankValueString)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%C"), 8212);
    v4 = (void *)BlankValueString_blankValueString;
    BlankValueString_blankValueString = v3;

    v2 = (void *)BlankValueString_blankValueString;
  }
  return v2;
}

+ (id)postfixCharacterForMagnitude:(unsigned int)a3 unitMagnitude:(unsigned int *)a4
{
  unsigned int v4;
  __CFString *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  *a4 = 0;
  if (a3 >= 0xC)
    v4 = 12;
  else
    v4 = a3;
  if (v4 >= 3)
  {
    +[StocksBundles getBundle:](StocksBundles, "getBundle:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("MAGNITUDE_POSTFIX_%u"), v4 + 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", v7, &stru_24D74CF50, CFSTR("Localizable"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByTrimmingCharactersInSet:](v8, "stringByTrimmingCharactersInSet:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[__CFString length](v8, "length"))
    {
      while (1)
      {
        +[StocksBundles getBundle:](StocksBundles, "getBundle:", 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("MAGNITUDE_POSTFIX_%u"), v4 + 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "localizedStringForKey:value:table:", v12, &stru_24D74CF50, CFSTR("Localizable"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringByTrimmingCharactersInSet:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v15, "isEqualToString:", v10) & 1) == 0)
          break;

        if (--v4 <= 2)
          goto LABEL_11;
      }
      *a4 = v4 + 1;

    }
LABEL_11:

    v5 = v8;
  }
  else
  {
    v5 = &stru_24D74CF50;
  }
  return v5;
}

+ (id)localizedMagnitudeAbbreviatedStringWithString:(id)a3 fractionDigits:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  float v8;
  float v9;
  float v10;
  unsigned int v11;
  void *v13;
  void *v14;
  unsigned int v15;
  unsigned int v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  id v21;
  unsigned int v23;

  LODWORD(v4) = a4;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "floatValue");
    v9 = v8;
    v10 = log10f(v8);
    v11 = v10;
    if (v9 <= 0.0 || v11 >= 0xF)
    {
      +[Stock BlankValueString](Stock, "BlankValueString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
      objc_msgSend(a1, "postfixCharacterForMagnitude:unitMagnitude:", v10, &v23);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v23;
      if (v23)
      {
        v9 = v9 / __exp10((float)v23);
        v15 = v23;
      }
      v16 = v15 - v11 + 3;
      if ((_DWORD)v4 == -1)
        v4 = v16;
      else
        v4 = v4;
      +[StockDataFormatter sharedDataFormatter](StockDataFormatter, "sharedDataFormatter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v18 = v9;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "formattedNumber:withPrecision:useGroupSeparator:", v19, v4, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v14, "length"))
      {
        objc_msgSend(v20, "stringByAppendingString:", v14);
        v21 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = v20;
      }
      v13 = v21;

    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)localizedMagnitudeAbbreviatedStringWithString:(id)a3
{
  return (id)objc_msgSend(a1, "localizedMagnitudeAbbreviatedStringWithString:fractionDigits:", a3, 0xFFFFFFFFLL);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[Stock listName](self, "listName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[Stock formattedPrice](self, "formattedPrice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<Stock %p>: List name = %@, formatted price = %@"), self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)populateFromDictionary:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  StockDataSource *v52;
  void *v53;
  double v54;
  void *v55;
  double v56;
  id v57;

  v57 = a3;
  objc_msgSend(v57, "objectForKey:", CFSTR("companyName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[Stock setCompanyName:](self, "setCompanyName:", v4);

  objc_msgSend(v57, "objectForKey:", CFSTR("shortCompanyName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[Stock setShortCompanyName:](self, "setShortCompanyName:", v5);

  objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("exchange"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[ExchangeManager sharedManager](ExchangeManager, "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exchangeWithName:createIfNotFound:", v6, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[Stock setExchange:](self, "setExchange:", v8);

  }
  +[Stock BlankValueString](Stock, "BlankValueString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "objectForKey:", CFSTR("open"));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (void *)v10;
  else
    v12 = v9;
  -[Stock setOpen:](self, "setOpen:", v12);

  objc_msgSend(v57, "objectForKey:", CFSTR("high"));
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (void *)v13;
  else
    v15 = v9;
  -[Stock setHigh:](self, "setHigh:", v15);

  objc_msgSend(v57, "objectForKey:", CFSTR("low"));
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = (void *)v16;
  else
    v18 = v9;
  -[Stock setLow:](self, "setLow:", v18);

  objc_msgSend(v57, "objectForKey:", CFSTR("yearHigh"));
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v19)
    v21 = (void *)v19;
  else
    v21 = v9;
  -[Stock setYearHigh:](self, "setYearHigh:", v21);

  objc_msgSend(v57, "objectForKey:", CFSTR("yearLow"));
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  if (v22)
    v24 = (void *)v22;
  else
    v24 = v9;
  -[Stock setYearLow:](self, "setYearLow:", v24);

  objc_msgSend(v57, "objectForKey:", CFSTR("volume"));
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v25;
  if (v25)
    v27 = (void *)v25;
  else
    v27 = v9;
  -[Stock setVolume:](self, "setVolume:", v27);

  objc_msgSend(v57, "objectForKey:", CFSTR("averageVolume"));
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)v28;
  if (v28)
    v30 = (void *)v28;
  else
    v30 = v9;
  -[Stock setAverageVolume:](self, "setAverageVolume:", v30);

  objc_msgSend(v57, "objectForKey:", CFSTR("marketcap"));
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = (void *)v31;
  if (v31)
    v33 = (void *)v31;
  else
    v33 = v9;
  -[Stock setMarketcap:](self, "setMarketcap:", v33);

  objc_msgSend(v57, "objectForKey:", CFSTR("peRatio"));
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = (void *)v34;
  if (v34)
    v36 = (void *)v34;
  else
    v36 = v9;
  -[Stock setPeRatio:](self, "setPeRatio:", v36);

  objc_msgSend(v57, "objectForKey:", CFSTR("dividendYield"));
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = (void *)v37;
  if (v37)
    v39 = (void *)v37;
  else
    v39 = v9;
  -[Stock setDividendYield:](self, "setDividendYield:", v39);

  objc_msgSend(v57, "objectForKey:", CFSTR("type"));
  v40 = objc_claimAutoreleasedReturnValue();
  v41 = (void *)v40;
  if (v40)
    v42 = (void *)v40;
  else
    v42 = v9;
  -[Stock setSymbolType:](self, "setSymbolType:", v42);

  objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("currency"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v44 = v43;
  else
    v44 = 0;
  -[Stock setCurrency:](self, "setCurrency:", v44);
  objc_msgSend(v57, "objectForKey:", CFSTR("price"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v46 = v45;
  else
    v46 = 0;
  -[Stock setPrice:](self, "setPrice:", v46);
  objc_msgSend(v57, "objectForKey:", CFSTR("change"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[Stock setChange:](self, "setChange:", v47);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NSString stringValue](self->_change, "stringValue");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[Stock setChange:](self, "setChange:", v48);

  }
  objc_msgSend(v57, "objectForKey:", CFSTR("infoURL"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (v49)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[Stock setInfoURL:](self, "setInfoURL:", v50);

  }
  objc_msgSend(v57, "objectForKey:", CFSTR("dataSource"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v52 = -[StockDataSource initWithDictionary:]([StockDataSource alloc], "initWithDictionary:", v51);
    -[Stock setDataSource:](self, "setDataSource:", v52);

  }
  objc_msgSend(v57, "objectForKey:", CFSTR("lastUpdateTime"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "doubleValue");
  self->_timeQuoteLastUpdated = v54;

  objc_msgSend(v57, "objectForKey:", CFSTR("lastMetadataUpdateTime"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "doubleValue");
  self->_timeMetadataLastUpdated = v56;

  -[Stock _updatePricePrecision](self, "_updatePricePrecision");
}

- (Stock)initWithDictionary:(id)a3
{
  id v4;
  Stock *v5;
  void *v6;
  Stock *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)Stock;
  v5 = -[Stock init](&v9, sel_init);
  if (v5
    && (objc_msgSend(v4, "objectForKey:", CFSTR("symbol")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        -[Stock setSymbol:](v5, "setSymbol:", v6),
        v6,
        v5->_symbol))
  {
    -[Stock populateFromDictionary:](v5, "populateFromDictionary:", v4);
    v7 = v5;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)dealloc
{
  uint64_t i;
  objc_super v4;

  for (i = 0; i != 9; ++i)
    -[Stock setChartData:forInterval:](self, "setChartData:forInterval:", 0, i);
  v4.receiver = self;
  v4.super_class = (Class)Stock;
  -[Stock dealloc](&v4, sel_dealloc);
}

- (id)archiveDictionary
{
  void *v3;
  NSString *companyName;
  NSString *shortCompanyName;
  NSString *currency;
  NSString *price;
  NSString *change;
  Exchange *exchange;
  void *v10;
  uint64_t v11;
  NSString *v12;
  NSString *symbolType;
  NSString *open;
  NSString *high;
  NSString *low;
  NSString *yearHigh;
  NSString *yearLow;
  NSString *volume;
  NSString *averageVolume;
  NSString *marketcap;
  NSString *peRatio;
  NSString *dividendYield;
  NSURL *infoURL;
  void *v25;
  void *v26;
  void *v27;
  StockDataSource *dataSource;
  void *v29;

  if (-[Stock isTransient](self, "isTransient") || !self->_symbol)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 18);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", self->_symbol, CFSTR("symbol"));
    companyName = self->_companyName;
    if (companyName)
      objc_msgSend(v3, "setObject:forKey:", companyName, CFSTR("companyName"));
    shortCompanyName = self->_shortCompanyName;
    if (shortCompanyName)
      objc_msgSend(v3, "setObject:forKey:", shortCompanyName, CFSTR("shortCompanyName"));
    currency = self->_currency;
    if (currency)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", currency, CFSTR("currency"));
    price = self->_price;
    if (price)
      objc_msgSend(v3, "setObject:forKey:", price, CFSTR("price"));
    change = self->_change;
    if (change)
      objc_msgSend(v3, "setObject:forKey:", change, CFSTR("change"));
    exchange = self->_exchange;
    if (exchange)
    {
      -[Exchange name](exchange, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("exchange"));

    }
    +[Stock BlankValueString](Stock, "BlankValueString");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (NSString *)v11;
    symbolType = self->_symbolType;
    if (symbolType && symbolType != (NSString *)v11)
      objc_msgSend(v3, "setObject:forKey:", symbolType, CFSTR("type"));
    open = self->_open;
    if (open && open != v12)
      objc_msgSend(v3, "setObject:forKey:", open, CFSTR("open"));
    high = self->_high;
    if (high && high != v12)
      objc_msgSend(v3, "setObject:forKey:", high, CFSTR("high"));
    low = self->_low;
    if (low && low != v12)
      objc_msgSend(v3, "setObject:forKey:", low, CFSTR("low"));
    yearHigh = self->_yearHigh;
    if (yearHigh && yearHigh != v12)
      objc_msgSend(v3, "setObject:forKey:", yearHigh, CFSTR("yearHigh"));
    yearLow = self->_yearLow;
    if (yearLow && yearLow != v12)
      objc_msgSend(v3, "setObject:forKey:", yearLow, CFSTR("yearLow"));
    volume = self->_volume;
    if (volume && volume != v12)
      objc_msgSend(v3, "setObject:forKey:", volume, CFSTR("volume"));
    averageVolume = self->_averageVolume;
    if (averageVolume && averageVolume != v12)
      objc_msgSend(v3, "setObject:forKey:", averageVolume, CFSTR("averageVolume"));
    marketcap = self->_marketcap;
    if (marketcap && marketcap != v12)
      objc_msgSend(v3, "setObject:forKey:", marketcap, CFSTR("marketcap"));
    peRatio = self->_peRatio;
    if (peRatio && peRatio != v12)
      objc_msgSend(v3, "setObject:forKey:", peRatio, CFSTR("peRatio"));
    dividendYield = self->_dividendYield;
    if (dividendYield && dividendYield != v12)
      objc_msgSend(v3, "setObject:forKey:", dividendYield, CFSTR("dividendYield"));
    infoURL = self->_infoURL;
    if (infoURL)
    {
      -[NSURL absoluteString](infoURL, "absoluteString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("infoURL"));

    }
    if (self->_timeQuoteLastUpdated != 0.0)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("lastUpdateTime"));

    }
    if (self->_timeMetadataLastUpdated != 0.0)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("lastMetadataUpdateTime"));

    }
    dataSource = self->_dataSource;
    if (dataSource)
    {
      -[StockDataSource archiveDictionary](dataSource, "archiveDictionary");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("dataSource"));

    }
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[Stock symbol](self, "symbol");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "symbol");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[Stock symbol](self, "symbol");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)changeIsNegative
{
  void *v3;
  void *v4;
  BOOL v5;

  -[Stock change](self, "change");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    -[Stock change](self, "change");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "characterAtIndex:", 0) == 45;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)changeIsZero
{
  void *v3;
  void *v4;
  void *v5;

  -[Stock formattedChangePercent:](self, "formattedChangePercent:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[StockDataFormatter sharedDataFormatter](StockDataFormatter, "sharedDataFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "formattedNumber:withPrecision:useGroupSeparator:", &unk_24D75EFE0, -[Stock pricePrecision](self, "pricePrecision"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v3, "isEqualToString:", v5);
  return (char)v4;
}

- (BOOL)isIndex
{
  return -[NSString isEqualToString:](self->_symbolType, "isEqualToString:", CFSTR("index"));
}

- (BOOL)marketIsOpen
{
  return -[Exchange marketIsOpen](self->_exchange, "marketIsOpen");
}

- (double)_updateInterval
{
  double result;
  _BOOL4 v4;

  -[Exchange streamInterval](self->_exchange, "streamInterval");
  if (result == 0.0)
  {
    v4 = -[Stock marketIsOpen](self, "marketIsOpen");
    result = 300.0;
    if (v4)
      return 60.0;
  }
  return result;
}

- (BOOL)isQuoteStale
{
  CFAbsoluteTime v4;
  CFAbsoluteTime v5;

  if (self->_timeQuoteLastUpdated == 0.0)
    return 1;
  v4 = CFAbsoluteTimeGetCurrent() - self->_timeQuoteLastUpdated;
  -[Stock _updateInterval](self, "_updateInterval");
  return v4 >= v5;
}

- (BOOL)isMetadataStale
{
  CFAbsoluteTime v4;
  CFAbsoluteTime v5;

  if (self->_timeMetadataLastUpdated == 0.0)
    return 1;
  v4 = CFAbsoluteTimeGetCurrent() - self->_timeMetadataLastUpdated;
  -[Stock _updateInterval](self, "_updateInterval");
  return v4 >= v5;
}

- (BOOL)doesQuoteNeedUpdate
{
  CFAbsoluteTime v4;
  double v5;

  if (self->_timeQuoteLastUpdated == 0.0)
    return 1;
  v4 = CFAbsoluteTimeGetCurrent() - self->_timeQuoteLastUpdated;
  -[Stock _updateInterval](self, "_updateInterval");
  return v4 >= fmax(v5, 300.0);
}

- (BOOL)doesMetadataNeedUpdate
{
  CFAbsoluteTime v4;
  double v5;

  if (self->_timeMetadataLastUpdated == 0.0)
    return 1;
  v4 = CFAbsoluteTimeGetCurrent() - self->_timeMetadataLastUpdated;
  -[Stock _updateInterval](self, "_updateInterval");
  return v4 >= fmax(v5, 300.0);
}

- (id)listName
{
  return -[Stock listNameWithMaxIndexNameLength:](self, "listNameWithMaxIndexNameLength:", 12);
}

- (id)listNameWithMaxIndexNameLength:(unint64_t)a3
{
  NSString *v5;
  NSString *v6;
  NSString **p_shortCompanyName;
  NSString *v8;

  -[Stock listNameOverride](self, "listNameOverride");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    p_shortCompanyName = &self->_shortCompanyName;
    if (!-[NSString length](self->_shortCompanyName, "length"))
    {
      if (-[Stock shouldUseCompanyNameAsListName:](self, "shouldUseCompanyNameAsListName:", a3))
        p_shortCompanyName = &self->_companyName;
      else
        p_shortCompanyName = &self->_symbol;
    }
    v6 = *p_shortCompanyName;
  }
  v8 = v6;

  return v8;
}

- (id)listNameOverride
{
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "listNameOverridesBySymbol");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", self->_symbol);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)listNameOverridesBySymbol
{
  if (listNameOverridesBySymbol_onceToken != -1)
    dispatch_once(&listNameOverridesBySymbol_onceToken, &__block_literal_global_1);
  return (id)listNameOverridesBySymbol_nameOverridesBySymbol;
}

void __34__Stock_listNameOverridesBySymbol__block_invoke()
{
  void *v0;

  v0 = (void *)listNameOverridesBySymbol_nameOverridesBySymbol;
  listNameOverridesBySymbol_nameOverridesBySymbol = (uint64_t)&unk_24D760328;

}

- (BOOL)shouldUseCompanyNameAsListName:(unint64_t)a3
{
  _BOOL4 v5;

  if ((-[NSString naui_containsCJKScripts](self->_companyName, "naui_containsCJKScripts") & 1) != 0
    || (v5 = -[Stock isIndex](self, "isIndex")))
  {
    LOBYTE(v5) = -[NSString length](self->_companyName, "length")
              && -[NSString length](self->_companyName, "length") <= a3;
  }
  return v5;
}

- (id)chartDataForInterval:(int64_t)a3
{
  StockChartData *v5;
  double Current;
  double v7;
  void *v8;

  v5 = self->_chartDataArray[a3];
  Current = CFAbsoluteTimeGetCurrent();
  -[StockChartData expirationTime](v5, "expirationTime");
  if (Current < v7)
  {
    +[StockManager sharedManager](StockManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UpdateChartDataInLRU:", v5);
LABEL_5:

    return v5;
  }
  if (v5)
  {
    -[Stock setChartData:forInterval:](self, "setChartData:forInterval:", 0, a3);
    v8 = v5;
    v5 = 0;
    goto LABEL_5;
  }
  return v5;
}

- (void)setChartData:(id)a3 forInterval:(int64_t)a4
{
  Class v7;
  Class *v8;
  Class v9;
  id *v10;
  Class v11;
  objc_class *v12;
  void *v13;
  Class v14;

  v7 = (Class)a3;
  v8 = &self->super.isa + a4;
  v11 = v8[1];
  v10 = (id *)(v8 + 1);
  v9 = v11;
  v14 = v7;
  if (v11 != v7)
  {
    v12 = v9;
    +[StockManager sharedManager](StockManager, "sharedManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "RemoveChartDataFromLRU:", v12);
    objc_storeStrong(v10, a3);
    objc_msgSend(v13, "UpdateChartDataInLRU:", v14);

  }
}

- (void)updateQuoteWithDictionary:(id)a3 forTime:(double)a4
{
  NSString *v6;
  NSString *currency;
  NSString *v8;
  NSString *price;
  NSString *v10;
  NSString *change;
  NSString *v12;
  NSString *symbolType;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  StockDataSource *v21;
  NSString *v22;
  NSString *shortCompanyName;
  id v24;

  v24 = a3;
  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("currency"));
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  currency = v6;
  if (!v6)
    currency = self->_currency;
  -[Stock setCurrency:](self, "setCurrency:", currency);

  objc_msgSend(v24, "objectForKey:", CFSTR("price"));
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  price = v8;
  if (!v8)
    price = self->_price;
  -[Stock setPrice:](self, "setPrice:", price);

  objc_msgSend(v24, "objectForKey:", CFSTR("change"));
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  change = v10;
  if (!v10)
    change = self->_change;
  -[Stock setChange:](self, "setChange:", change);

  objc_msgSend(v24, "objectForKey:", CFSTR("type"));
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  symbolType = v12;
  if (!v12)
    symbolType = self->_symbolType;
  -[Stock setSymbolType:](self, "setSymbolType:", symbolType);

  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("exchange"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    +[ExchangeManager sharedManager](ExchangeManager, "sharedManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "exchangeWithName:createIfNotFound:", v14, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[Stock setExchange:](self, "setExchange:", v16);

  }
  objc_msgSend(v24, "objectForKey:", CFSTR("marketcap"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    if ((objc_msgSend(v17, "isEqualToString:", CFSTR("N/A")) & 1) != 0)
    {
      +[Stock BlankValueString](Stock, "BlankValueString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[Stock setMarketcap:](self, "setMarketcap:", v19);

    }
    else
    {
      -[Stock setMarketcap:](self, "setMarketcap:", v18);
    }
  }
  objc_msgSend(v24, "objectForKey:", CFSTR("dataSource"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = -[StockDataSource initWithDictionary:]([StockDataSource alloc], "initWithDictionary:", v20);
    -[Stock setDataSource:](self, "setDataSource:", v21);

  }
  objc_msgSend(v24, "objectForKey:", CFSTR("shortCompanyName"));
  v22 = (NSString *)objc_claimAutoreleasedReturnValue();
  shortCompanyName = v22;
  if (!v22)
    shortCompanyName = self->_shortCompanyName;
  -[Stock setShortCompanyName:](self, "setShortCompanyName:", shortCompanyName);

  self->_timeQuoteLastUpdated = a4;
  -[Stock _updatePricePrecision](self, "_updatePricePrecision");

}

- (void)updateMetadataWithDictionary:(id)a3 forTime:(double)a4
{
  id v6;
  NSString *v7;
  NSString *companyName;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  NSString *currency;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  float v23;
  NSString *v24;
  NSString *open;
  NSString *v26;
  NSString *high;
  NSString *v28;
  NSString *low;
  NSString *v30;
  NSString *yearHigh;
  NSString *v32;
  NSString *yearLow;
  NSString *v34;
  NSString *volume;
  NSString *v36;
  NSString *averageVolume;
  NSString *v38;
  NSString *marketcap;
  NSString *v40;
  NSString *peRatio;
  NSString *v42;
  NSString *dividendYield;
  void *v44;
  void *v45;
  void *v46;
  Stock *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "objectForKey:", CFSTR("companyName"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  companyName = v7;
  if (!v7)
    companyName = self->_companyName;
  -[Stock setCompanyName:](self, "setCompanyName:", companyName);

  objc_msgSend(v6, "objectForKey:", CFSTR("exchange"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    +[ExchangeManager sharedManager](ExchangeManager, "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "exchangeWithName:createIfNotFound:", v9, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[Stock setExchange:](self, "setExchange:", v11);

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("currency"));
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  currency = v12;
  if (!v12)
    currency = self->_currency;
  -[Stock setCurrency:](self, "setCurrency:", currency);

  +[Stock BlankValueString](Stock, "BlankValueString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  +[Stock _potentiallyAbsentKeys](Stock, "_potentiallyAbsentKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v16)
  {
    v17 = v16;
    v46 = v9;
    v47 = self;
    v18 = 0;
    v19 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        v21 = v18;
        if (*(_QWORD *)v49 != v19)
          objc_enumerationMutation(v15);
        v22 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKey:", v22, v46, v47);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          if ((objc_msgSend(v18, "isEqualToString:", CFSTR("N/A")) & 1) != 0
            || (objc_msgSend(v18, "floatValue"), v23 == 0.0))
          {
            objc_msgSend(v6, "setObject:forKey:", v14, v22);
          }
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    }
    while (v17);

    v9 = v46;
    self = v47;
  }

  objc_msgSend(v6, "objectForKey:", CFSTR("open"));
  v24 = (NSString *)objc_claimAutoreleasedReturnValue();
  open = v24;
  if (!v24)
    open = self->_open;
  -[Stock setOpen:](self, "setOpen:", open);

  objc_msgSend(v6, "objectForKey:", CFSTR("high"));
  v26 = (NSString *)objc_claimAutoreleasedReturnValue();
  high = v26;
  if (!v26)
    high = self->_high;
  -[Stock setHigh:](self, "setHigh:", high);

  objc_msgSend(v6, "objectForKey:", CFSTR("low"));
  v28 = (NSString *)objc_claimAutoreleasedReturnValue();
  low = v28;
  if (!v28)
    low = self->_low;
  -[Stock setLow:](self, "setLow:", low);

  objc_msgSend(v6, "objectForKey:", CFSTR("yearHigh"));
  v30 = (NSString *)objc_claimAutoreleasedReturnValue();
  yearHigh = v30;
  if (!v30)
    yearHigh = self->_yearHigh;
  -[Stock setYearHigh:](self, "setYearHigh:", yearHigh);

  objc_msgSend(v6, "objectForKey:", CFSTR("yearLow"));
  v32 = (NSString *)objc_claimAutoreleasedReturnValue();
  yearLow = v32;
  if (!v32)
    yearLow = self->_yearLow;
  -[Stock setYearLow:](self, "setYearLow:", yearLow);

  objc_msgSend(v6, "objectForKey:", CFSTR("volume"));
  v34 = (NSString *)objc_claimAutoreleasedReturnValue();
  volume = v34;
  if (!v34)
    volume = self->_volume;
  -[Stock setVolume:](self, "setVolume:", volume);

  objc_msgSend(v6, "objectForKey:", CFSTR("averageVolume"));
  v36 = (NSString *)objc_claimAutoreleasedReturnValue();
  averageVolume = v36;
  if (!v36)
    averageVolume = self->_averageVolume;
  -[Stock setAverageVolume:](self, "setAverageVolume:", averageVolume);

  objc_msgSend(v6, "objectForKey:", CFSTR("marketcap"));
  v38 = (NSString *)objc_claimAutoreleasedReturnValue();
  marketcap = v38;
  if (!v38)
    marketcap = self->_marketcap;
  -[Stock setMarketcap:](self, "setMarketcap:", marketcap);

  objc_msgSend(v6, "objectForKey:", CFSTR("peRatio"));
  v40 = (NSString *)objc_claimAutoreleasedReturnValue();
  peRatio = v40;
  if (!v40)
    peRatio = self->_peRatio;
  -[Stock setPeRatio:](self, "setPeRatio:", peRatio);

  objc_msgSend(v6, "objectForKey:", CFSTR("dividendYield"));
  v42 = (NSString *)objc_claimAutoreleasedReturnValue();
  dividendYield = v42;
  if (!v42)
    dividendYield = self->_dividendYield;
  -[Stock setDividendYield:](self, "setDividendYield:", dividendYield);

  objc_msgSend(v6, "objectForKey:", CFSTR("infoURL"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (v44)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[Stock setInfoURL:](self, "setInfoURL:", v45);

  }
  else
  {
    -[Stock setInfoURL:](self, "setInfoURL:", 0);
  }
  self->_timeMetadataLastUpdated = a4;

}

+ (id)_potentiallyAbsentKeys
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)_potentiallyAbsentKeys_potentiallyAbsentKeys;
  if (!_potentiallyAbsentKeys_potentiallyAbsentKeys)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", CFSTR("open"), CFSTR("high"), CFSTR("low"), CFSTR("yearHigh"), CFSTR("yearLow"), CFSTR("volume"), CFSTR("averageVolume"), CFSTR("marketcap"), CFSTR("peRatio"), CFSTR("dividendYield"), 0);
    v4 = (void *)_potentiallyAbsentKeys_potentiallyAbsentKeys;
    _potentiallyAbsentKeys_potentiallyAbsentKeys = v3;

    v2 = (void *)_potentiallyAbsentKeys_potentiallyAbsentKeys;
  }
  return v2;
}

- (void)_updatePricePrecision
{
  void *v3;
  uint64_t v4;
  void *v5;
  float v6;
  unsigned int v7;
  id v8;

  -[Stock price](self, "price");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "rangeOfString:", CFSTR("."));

  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    self->_pricePrecision = 0;
  }
  else if (-[NSString hasSuffix:](self->_symbol, "hasSuffix:", CFSTR("=X")))
  {
    self->_pricePrecision = 3;
  }
  else
  {
    -[Stock price](self, "price");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)(objc_msgSend(v8, "length") - v4) < 3)
    {
      self->_pricePrecision = 2;
    }
    else
    {
      -[Stock price](self, "price");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "floatValue");
      if (v6 >= 1.0)
        v7 = 2;
      else
        v7 = 3;
      self->_pricePrecision = v7;

    }
  }
}

- (NSString)marketStatusDescription
{
  void *v3;
  void *v4;

  if (-[Stock marketIsOpen](self, "marketIsOpen"))
  {
    -[Stock dataSource](self, "dataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedSourceDescription");
  }
  else
  {
    +[StocksBundles getBundle:](StocksBundles, "getBundle:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Market closed"), &stru_24D74CF50, CFSTR("Localizable"));
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)formattedPrice
{
  void *v3;
  void *v4;

  +[StockDataFormatter sharedDataFormatter](StockDataFormatter, "sharedDataFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "formattedPriceForStock:withPrecision:", self, -[Stock pricePrecision](self, "pricePrecision"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)formattedChange
{
  void *v3;
  void *v4;

  +[StockDataFormatter sharedDataFormatter](StockDataFormatter, "sharedDataFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "formattedChangeInPointsForStock:withPrecision:", self, -[Stock pricePrecision](self, "pricePrecision"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)formattedChangePercent
{
  void *v3;
  void *v4;

  +[StockDataFormatter sharedDataFormatter](StockDataFormatter, "sharedDataFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "formattedChangeInPercentForStock:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)formattedChangePercent:(BOOL)a3
{
  if (a3)
    -[Stock formattedChangePercent](self, "formattedChangePercent");
  else
    -[Stock formattedChange](self, "formattedChange");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)formattedPriceDroppingFractionDigitsIfLengthExceeds:(unint64_t)a3
{
  void *v5;
  void *v6;

  +[StockDataFormatter sharedDataFormatter](StockDataFormatter, "sharedDataFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "formattedPriceForStock:withPrecision:droppingFractionDigitsIfLengthExceeds:", self, -[Stock pricePrecision](self, "pricePrecision"), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)symbol
{
  return self->_symbol;
}

- (void)setSymbol:(id)a3
{
  objc_storeStrong((id *)&self->_symbol, a3);
}

- (NSString)companyName
{
  return self->_companyName;
}

- (void)setCompanyName:(id)a3
{
  objc_storeStrong((id *)&self->_companyName, a3);
}

- (NSString)shortCompanyName
{
  return self->_shortCompanyName;
}

- (void)setShortCompanyName:(id)a3
{
  objc_storeStrong((id *)&self->_shortCompanyName, a3);
}

- (Exchange)exchange
{
  return self->_exchange;
}

- (void)setExchange:(id)a3
{
  objc_storeStrong((id *)&self->_exchange, a3);
}

- (NSString)price
{
  return self->_price;
}

- (void)setPrice:(id)a3
{
  objc_storeStrong((id *)&self->_price, a3);
}

- (NSString)change
{
  return self->_change;
}

- (void)setChange:(id)a3
{
  objc_storeStrong((id *)&self->_change, a3);
}

- (NSString)currency
{
  return self->_currency;
}

- (void)setCurrency:(id)a3
{
  objc_storeStrong((id *)&self->_currency, a3);
}

- (NSString)symbolType
{
  return self->_symbolType;
}

- (void)setSymbolType:(id)a3
{
  objc_storeStrong((id *)&self->_symbolType, a3);
}

- (NSString)open
{
  return self->_open;
}

- (void)setOpen:(id)a3
{
  objc_storeStrong((id *)&self->_open, a3);
}

- (NSString)high
{
  return self->_high;
}

- (void)setHigh:(id)a3
{
  objc_storeStrong((id *)&self->_high, a3);
}

- (NSString)low
{
  return self->_low;
}

- (void)setLow:(id)a3
{
  objc_storeStrong((id *)&self->_low, a3);
}

- (NSString)yearHigh
{
  return self->_yearHigh;
}

- (void)setYearHigh:(id)a3
{
  objc_storeStrong((id *)&self->_yearHigh, a3);
}

- (NSString)yearLow
{
  return self->_yearLow;
}

- (void)setYearLow:(id)a3
{
  objc_storeStrong((id *)&self->_yearLow, a3);
}

- (NSString)volume
{
  return self->_volume;
}

- (void)setVolume:(id)a3
{
  objc_storeStrong((id *)&self->_volume, a3);
}

- (NSString)averageVolume
{
  return self->_averageVolume;
}

- (void)setAverageVolume:(id)a3
{
  objc_storeStrong((id *)&self->_averageVolume, a3);
}

- (NSString)marketcap
{
  return self->_marketcap;
}

- (void)setMarketcap:(id)a3
{
  objc_storeStrong((id *)&self->_marketcap, a3);
}

- (NSString)peRatio
{
  return self->_peRatio;
}

- (void)setPeRatio:(id)a3
{
  objc_storeStrong((id *)&self->_peRatio, a3);
}

- (NSString)dividendYield
{
  return self->_dividendYield;
}

- (void)setDividendYield:(id)a3
{
  objc_storeStrong((id *)&self->_dividendYield, a3);
}

- (unsigned)pricePrecision
{
  return self->_pricePrecision;
}

- (NSURL)infoURL
{
  return self->_infoURL;
}

- (void)setInfoURL:(id)a3
{
  objc_storeStrong((id *)&self->_infoURL, a3);
}

- (StockDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (double)timeQuoteLastUpdated
{
  return self->_timeQuoteLastUpdated;
}

- (void)setTimeQuoteLastUpdated:(double)a3
{
  self->_timeQuoteLastUpdated = a3;
}

- (double)timeMetadataLastUpdated
{
  return self->_timeMetadataLastUpdated;
}

- (void)setTimeMetadataLastUpdated:(double)a3
{
  self->_timeMetadataLastUpdated = a3;
}

- (BOOL)isTransient
{
  return self->_transient;
}

- (void)setTransient:(BOOL)a3
{
  self->_transient = a3;
}

- (void).cxx_destruct
{
  uint64_t v3;

  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_infoURL, 0);
  objc_storeStrong((id *)&self->_dividendYield, 0);
  objc_storeStrong((id *)&self->_peRatio, 0);
  objc_storeStrong((id *)&self->_marketcap, 0);
  objc_storeStrong((id *)&self->_averageVolume, 0);
  objc_storeStrong((id *)&self->_volume, 0);
  objc_storeStrong((id *)&self->_yearLow, 0);
  objc_storeStrong((id *)&self->_yearHigh, 0);
  objc_storeStrong((id *)&self->_low, 0);
  objc_storeStrong((id *)&self->_high, 0);
  objc_storeStrong((id *)&self->_open, 0);
  objc_storeStrong((id *)&self->_symbolType, 0);
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_change, 0);
  objc_storeStrong((id *)&self->_price, 0);
  objc_storeStrong((id *)&self->_exchange, 0);
  objc_storeStrong((id *)&self->_shortCompanyName, 0);
  objc_storeStrong((id *)&self->_companyName, 0);
  objc_storeStrong((id *)&self->_symbol, 0);
  v3 = 72;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

@end
