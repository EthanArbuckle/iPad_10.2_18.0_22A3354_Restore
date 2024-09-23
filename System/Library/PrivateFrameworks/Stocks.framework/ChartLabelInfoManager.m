@implementation ChartLabelInfoManager

+ (id)sharedLabelInfoManager
{
  void *v2;
  ChartLabelInfoManager *v3;
  void *v4;

  v2 = (void *)__sharedInstance;
  if (!__sharedInstance)
  {
    v3 = objc_alloc_init(ChartLabelInfoManager);
    v4 = (void *)__sharedInstance;
    __sharedInstance = (uint64_t)v3;

    v2 = (void *)__sharedInstance;
  }
  return v2;
}

+ (void)clearSharedManager
{
  void *v2;

  v2 = (void *)__sharedInstance;
  __sharedInstance = 0;

}

+ (id)chartLabelFont
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  void *v8;

  v2 = (void *)axisLabelFont;
  if (!axisLabelFont)
  {
    v3 = (void *)MEMORY[0x24BDF6A70];
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_referenceBounds");
    v5 = 12.0;
    if (v6 == 667.0)
      v5 = 15.0;
    objc_msgSend(v3, "systemFontOfSize:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)axisLabelFont;
    axisLabelFont = v7;

    v2 = (void *)axisLabelFont;
  }
  return v2;
}

- (ChartLabelInfoManager)init
{
  ChartLabelInfoManager *v2;
  ChartLabelInfoManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ChartLabelInfoManager;
  v2 = -[ChartLabelInfoManager init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[ChartLabelInfoManager resetLocale](v2, "resetLocale");
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[ChartLabelInfoManager resetLocale](self, "resetLocale");
  v3.receiver = self;
  v3.super_class = (Class)ChartLabelInfoManager;
  -[ChartLabelInfoManager dealloc](&v3, sel_dealloc);
}

- (id)labelInfoWithString:(id)a3
{
  id v3;
  ChartLabelInfo *v4;

  v3 = a3;
  v4 = objc_alloc_init(ChartLabelInfo);
  -[ChartLabelInfo setString:](v4, "setString:", v3);

  return v4;
}

- (id)labelInfoForYAxis
{
  ChartLabelInfo *yAxisLabelInfo;
  ChartLabelInfo *v4;
  ChartLabelInfo *v5;

  yAxisLabelInfo = self->_yAxisLabelInfo;
  if (!yAxisLabelInfo)
  {
    v4 = objc_alloc_init(ChartLabelInfo);
    v5 = self->_yAxisLabelInfo;
    self->_yAxisLabelInfo = v4;

    -[ChartLabelInfo setPosition:](self->_yAxisLabelInfo, "setPosition:", 1.0);
    -[ChartLabelInfo setImmutable:](self->_yAxisLabelInfo, "setImmutable:", 1);
    yAxisLabelInfo = self->_yAxisLabelInfo;
  }
  return yAxisLabelInfo;
}

- (id)labelInfoWithUnsignedInteger:(unint64_t)a3
{
  int v5;
  NSMutableArray *v6;
  NSMutableArray *integerLabelInfoArray;
  NSMutableArray *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v15;
  void *v16;
  void *v17;
  ChartLabelInfo *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _BYTE v26[2];

  if (!self->_integerLabelInfoArray)
  {
    v5 = 31;
    v6 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 31);
    integerLabelInfoArray = self->_integerLabelInfoArray;
    self->_integerLabelInfoArray = v6;

    do
    {
      v8 = self->_integerLabelInfoArray;
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v8, "addObject:", v9);

      --v5;
    }
    while (v5);
  }
  if (a3 - 32 > 0xFFFFFFFFFFFFFFE0)
  {
    v15 = a3 - 1;
    -[NSMutableArray objectAtIndex:](self->_integerLabelInfoArray, "objectAtIndex:", a3 - 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16 == v17)
    {
      v18 = objc_alloc_init(ChartLabelInfo);
      +[StockDataFormatter sharedDataFormatter](StockDataFormatter, "sharedDataFormatter");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "doesLocaleUseASCII");

      if (v20)
      {
        v26[0] = (a3 % 0xAu) | 0x30;
        if (a3 < 0xA)
        {
          v21 = 1;
        }
        else
        {
          v26[1] = (a3 % 0xAu) | 0x30;
          v26[0] = a3 / 0xAu + 48;
          v21 = 2;
        }
        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v26, v21, 1);
        -[ChartLabelInfo setString:](v18, "setString:", v25);

      }
      else
      {
        +[StockDataFormatter sharedDataFormatter](StockDataFormatter, "sharedDataFormatter");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "formattedNumber:withPrecision:useGroupSeparator:", v23, 0, 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[ChartLabelInfo setString:](v18, "setString:", v24);

      }
      -[ChartLabelInfo setImmutable:](v18, "setImmutable:", 1);
      -[NSMutableArray replaceObjectAtIndex:withObject:](self->_integerLabelInfoArray, "replaceObjectAtIndex:withObject:", v15, v18);

    }
    -[NSMutableArray objectAtIndex:](self->_integerLabelInfoArray, "objectAtIndex:", v15);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[StockDataFormatter sharedDataFormatter](StockDataFormatter, "sharedDataFormatter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "formattedNumber:withPrecision:useGroupSeparator:", v11, 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ChartLabelInfoManager labelInfoWithString:](self, "labelInfoWithString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    return v13;
  }
}

- (BOOL)use24hrTime
{
  return self->_use24hrTime;
}

+ (__CFString)_CFDateFormatterPropertyForMonthLabelLength:(int64_t)a3
{
  __CFString **v3;

  switch(a3)
  {
    case 0:
      v3 = (__CFString **)MEMORY[0x24BDBD350];
      return *v3;
    case 1:
      v3 = (__CFString **)MEMORY[0x24BDBD308];
      return *v3;
    case 2:
      v3 = (__CFString **)MEMORY[0x24BDBD328];
      return *v3;
  }
  return 0;
}

- (id)monthLabelInfoArrayForLabelLength:(int64_t)a3
{
  NSMutableArray *monthLabelInfoArrays;
  int v6;
  NSMutableArray *v7;
  NSMutableArray *v8;
  NSMutableArray *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  __CFString *v15;
  const __CFString *v16;
  __CFDateFormatter *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v29;
  void *v30;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  monthLabelInfoArrays = self->_monthLabelInfoArrays;
  if (!monthLabelInfoArrays)
  {
    v6 = 3;
    v7 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 3);
    v8 = self->_monthLabelInfoArrays;
    self->_monthLabelInfoArrays = v7;

    do
    {
      v9 = self->_monthLabelInfoArrays;
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v9, "addObject:", v10);

      --v6;
    }
    while (v6);
    monthLabelInfoArrays = self->_monthLabelInfoArrays;
  }
  -[NSMutableArray objectAtIndex:](monthLabelInfoArrays, "objectAtIndex:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v12)
  {
    v15 = +[ChartLabelInfoManager _CFDateFormatterPropertyForMonthLabelLength:](ChartLabelInfoManager, "_CFDateFormatterPropertyForMonthLabelLength:", a3);
    if (!v15)
      goto LABEL_26;
    v16 = v15;
    v17 = (__CFDateFormatter *)dateFormatter;
    if (!dateFormatter)
    {
      v17 = CFDateFormatterCreate(0, (CFLocaleRef)objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale"), kCFDateFormatterShortStyle, kCFDateFormatterShortStyle);
      dateFormatter = (uint64_t)v17;
    }
    v18 = (void *)CFDateFormatterCopyProperty(v17, v16);
    if (!v18)
    {
LABEL_26:
      v14 = 0;
      goto LABEL_27;
    }
    v19 = v18;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v18, "count"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v20 = v19;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v34;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v34 != v23)
            objc_enumerationMutation(v20);
          -[ChartLabelInfoManager labelInfoWithString:](self, "labelInfoWithString:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v24), (_QWORD)v33);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v25);

          ++v24;
        }
        while (v22 != v24);
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v22);
    }

    v26 = (void *)CFDateFormatterCopyProperty((CFDateFormatterRef)dateFormatter, (CFDateFormatterKey)*MEMORY[0x24BDBD2E0]);
    v27 = objc_msgSend(v26, "count");
    if (v27 == objc_msgSend(v13, "count") && v27 >= 1)
    {
      v29 = 0;
      do
      {
        objc_msgSend(v13, "objectAtIndex:", v29, (_QWORD)v33);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectAtIndex:", v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setAccessibilityLabel:", v31);

        ++v29;
      }
      while (v27 != v29);
    }
    -[NSMutableArray replaceObjectAtIndex:withObject:](self->_monthLabelInfoArrays, "replaceObjectAtIndex:withObject:", a3, v13, (_QWORD)v33);

  }
  else
  {
    v13 = v11;
  }
  v11 = v13;
  v14 = v11;
LABEL_27:

  return v14;
}

- (void)resetLocale
{
  NSMutableArray *monthLabelInfoArrays;
  NSMutableArray *integerLabelInfoArray;
  void *v5;
  void *v6;
  void *v7;

  monthLabelInfoArrays = self->_monthLabelInfoArrays;
  self->_monthLabelInfoArrays = 0;

  integerLabelInfoArray = self->_integerLabelInfoArray;
  self->_integerLabelInfoArray = 0;

  self->_use24hrTime = _CPTimeFormatIs24HourMode() != 0;
  if (dateFormatter)
  {
    CFRelease((CFTypeRef)dateFormatter);
    dateFormatter = 0;
  }
  v5 = (void *)monthDayFormatter;
  monthDayFormatter = 0;

  v6 = (void *)yearFormatter;
  yearFormatter = 0;

  v7 = (void *)axisLabelFont;
  axisLabelFont = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_integerLabelInfoArray, 0);
  objc_storeStrong((id *)&self->_monthLabelInfoArrays, 0);
  objc_storeStrong((id *)&self->_yAxisLabelInfo, 0);
}

@end
