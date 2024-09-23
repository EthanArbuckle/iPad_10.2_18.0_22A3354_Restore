@implementation StockChartData

- (StockChartData)initWithStock:(id)a3 interval:(int64_t)a4
{
  id v6;
  StockChartData *v7;
  StockChartData *v8;
  uint64_t v9;
  NSMutableDictionary *imageSetCache;
  uint64_t v11;
  NSMutableDictionary *yAxisLabelInfoCache;
  uint64_t v13;
  NSMutableDictionary *xAxisLabelInfoCache;
  uint64_t v15;
  NSMutableDictionary *labelPlacementCache;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)StockChartData;
  v7 = -[StockChartData init](&v18, sel_init);
  v8 = v7;
  if (v7)
  {
    -[StockChartData setStock:](v7, "setStock:", v6);
    v8->_chartInterval = a4;
    v9 = objc_opt_new();
    imageSetCache = v8->_imageSetCache;
    v8->_imageSetCache = (NSMutableDictionary *)v9;

    v11 = objc_opt_new();
    yAxisLabelInfoCache = v8->_yAxisLabelInfoCache;
    v8->_yAxisLabelInfoCache = (NSMutableDictionary *)v11;

    v13 = objc_opt_new();
    xAxisLabelInfoCache = v8->_xAxisLabelInfoCache;
    v8->_xAxisLabelInfoCache = (NSMutableDictionary *)v13;

    v15 = objc_opt_new();
    labelPlacementCache = v8->_labelPlacementCache;
    v8->_labelPlacementCache = (NSMutableDictionary *)v15;

  }
  return v8;
}

- ($87A9BE3275E22128A73FF46D0B92144E)allocateStockValuesWithCount:(unsigned int)a3
{
  $87A9BE3275E22128A73FF46D0B92144E *result;

  result = ($87A9BE3275E22128A73FF46D0B92144E *)malloc_type_calloc(0x18uLL, a3, 0x613E0D22uLL);
  self->_stockValues = result;
  self->_stockValueCount = a3;
  return result;
}

- (id)imageSetForDisplayMode:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_imageSetCache, "objectForKey:", a3);
}

- (void)setImageSet:(id)a3 forDisplayMode:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_imageSetCache, "setObject:forKey:", a3, a4);
}

- (void)clearAllImageSets
{
  -[NSMutableDictionary removeAllObjects](self->_imageSetCache, "removeAllObjects");
}

- (id)yAxisLabelInfoArrayForMode:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_yAxisLabelInfoCache, "objectForKey:", a3);
}

- (void)setYAxisLabelInfoArray:(id)a3 forDisplayMode:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_yAxisLabelInfoCache, "setObject:forKey:", a3, a4);
}

- (id)xAxisLabelInfoArrayForMode:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_xAxisLabelInfoCache, "objectForKey:", a3);
}

- (void)setXAxisLabelInfoArray:(id)a3 forDisplayMode:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_xAxisLabelInfoCache, "setObject:forKey:", a3, a4);
}

- (int64_t)labelPlacementForDisplayMode:(id)a3
{
  void *v3;
  int64_t v4;

  -[NSMutableDictionary objectForKey:](self->_labelPlacementCache, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (void)setLabelPlacement:(int64_t)a3 forDisplayMode:(id)a4
{
  NSMutableDictionary *labelPlacementCache;
  void *v6;
  id v7;
  id v8;

  labelPlacementCache = self->_labelPlacementCache;
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  objc_msgSend(v6, "numberWithInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](labelPlacementCache, "setObject:forKey:", v8, v7);

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[StockChartData stock](self, "stock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "symbol");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ChartUpdater _rangeStringForInterval:](ChartUpdater, "_rangeStringForInterval:", self->_chartInterval);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<StockChartData: %p, symbol = %@, interval = %@"), self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_stockValues);
  v3.receiver = self;
  v3.super_class = (Class)StockChartData;
  -[StockChartData dealloc](&v3, sel_dealloc);
}

- (Stock)stock
{
  return (Stock *)objc_loadWeakRetained((id *)&self->_stock);
}

- (void)setStock:(id)a3
{
  objc_storeWeak((id *)&self->_stock, a3);
}

- (int64_t)chartInterval
{
  return self->_chartInterval;
}

- (void)setChartInterval:(int64_t)a3
{
  self->_chartInterval = a3;
}

- ($87A9BE3275E22128A73FF46D0B92144E)stockValues
{
  return self->_stockValues;
}

- (unsigned)stockValueCount
{
  return self->_stockValueCount;
}

- (NSArray)interestingIndexes
{
  return self->_interestingIndexes;
}

- (void)setInterestingIndexes:(id)a3
{
  objc_storeStrong((id *)&self->_interestingIndexes, a3);
}

- (NSDate)marketOpenDate
{
  return self->_marketOpenDate;
}

- (void)setMarketOpenDate:(id)a3
{
  objc_storeStrong((id *)&self->_marketOpenDate, a3);
}

- (NSDate)marketCloseDate
{
  return self->_marketCloseDate;
}

- (void)setMarketCloseDate:(id)a3
{
  objc_storeStrong((id *)&self->_marketCloseDate, a3);
}

- (NSTimeZone)marketTimeZone
{
  return self->_marketTimeZone;
}

- (void)setMarketTimeZone:(id)a3
{
  objc_storeStrong((id *)&self->_marketTimeZone, a3);
}

- ($87A9BE3275E22128A73FF46D0B92144E)minValue
{
  return self->_minValue;
}

- (void)setMinValue:(id *)a3
{
  self->_minValue = a3;
}

- ($87A9BE3275E22128A73FF46D0B92144E)maxValue
{
  return self->_maxValue;
}

- (void)setMaxValue:(id *)a3
{
  self->_maxValue = a3;
}

- (float)previousClosePrice
{
  return self->_previousClosePrice;
}

- (void)setPreviousClosePrice:(float)a3
{
  self->_previousClosePrice = a3;
}

- (double)expirationTime
{
  return self->_expirationTime;
}

- (void)setExpirationTime:(double)a3
{
  self->_expirationTime = a3;
}

- (BOOL)isUnavailable
{
  return self->_isUnavailable;
}

- (void)setIsUnavailable:(BOOL)a3
{
  self->_isUnavailable = a3;
}

- (BOOL)hasVolume
{
  return self->_hasVolume;
}

- (void)setHasVolume:(BOOL)a3
{
  self->_hasVolume = a3;
}

- (int)yAxisFractionDigits
{
  return self->_yAxisFractionDigits;
}

- (void)setYAxisFractionDigits:(int)a3
{
  self->_yAxisFractionDigits = a3;
}

- (NSDictionary)dataSeriesDict
{
  return self->_dataSeriesDict;
}

- (void)setDataSeriesDict:(id)a3
{
  objc_storeStrong((id *)&self->_dataSeriesDict, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSeriesDict, 0);
  objc_storeStrong((id *)&self->_marketTimeZone, 0);
  objc_storeStrong((id *)&self->_marketCloseDate, 0);
  objc_storeStrong((id *)&self->_marketOpenDate, 0);
  objc_storeStrong((id *)&self->_interestingIndexes, 0);
  objc_destroyWeak((id *)&self->_stock);
  objc_storeStrong((id *)&self->_labelPlacementCache, 0);
  objc_storeStrong((id *)&self->_xAxisLabelInfoCache, 0);
  objc_storeStrong((id *)&self->_yAxisLabelInfoCache, 0);
  objc_storeStrong((id *)&self->_imageSetCache, 0);
}

@end
