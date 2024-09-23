@implementation SAStockObject

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.stock");
}

- (id)encodedClassName
{
  return CFSTR("Object");
}

+ (id)object
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)averageDailyVolume
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("averageDailyVolume"));
}

- (void)setAverageDailyVolume:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("averageDailyVolume"), a3);
}

- (NSNumber)change
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("change"));
}

- (void)setChange:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("change"), a3);
}

- (NSNumber)changePercent
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("changePercent"));
}

- (void)setChangePercent:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("changePercent"), a3);
}

- (NSString)chartData
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("chartData"));
}

- (void)setChartData:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("chartData"), a3);
}

- (NSString)currency
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("currency"));
}

- (void)setCurrency:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("currency"), a3);
}

- (NSString)displayStyle
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("displayStyle"));
}

- (void)setDisplayStyle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("displayStyle"), a3);
}

- (NSNumber)dividendYield
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("dividendYield"));
}

- (void)setDividendYield:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("dividendYield"), a3);
}

- (NSNumber)earningsPerShare
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("earningsPerShare"));
}

- (void)setEarningsPerShare:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("earningsPerShare"), a3);
}

- (NSString)exchange
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("exchange"));
}

- (void)setExchange:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("exchange"), a3);
}

- (NSNumber)fiftyTwoWeekHigh
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("fiftyTwoWeekHigh"));
}

- (void)setFiftyTwoWeekHigh:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("fiftyTwoWeekHigh"), a3);
}

- (NSNumber)fiftyTwoWeekLow
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("fiftyTwoWeekLow"));
}

- (void)setFiftyTwoWeekLow:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("fiftyTwoWeekLow"), a3);
}

- (NSNumber)high
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("high"));
}

- (void)setHigh:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("high"), a3);
}

- (NSString)link
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("link"));
}

- (void)setLink:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("link"), a3);
}

- (NSNumber)low
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("low"));
}

- (void)setLow:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("low"), a3);
}

- (NSString)marketCap
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("marketCap"));
}

- (void)setMarketCap:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("marketCap"), a3);
}

- (NSString)name
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("name"));
}

- (void)setName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("name"), a3);
}

- (NSNumber)open
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("open"));
}

- (void)setOpen:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("open"), a3);
}

- (NSNumber)peRatio
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("peRatio"));
}

- (void)setPeRatio:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("peRatio"), a3);
}

- (NSNumber)prevClose
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("prevClose"));
}

- (void)setPrevClose:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("prevClose"), a3);
}

- (NSNumber)price
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("price"));
}

- (void)setPrice:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("price"), a3);
}

- (NSNumber)realTimeChange
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("realTimeChange"));
}

- (void)setRealTimeChange:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("realTimeChange"), a3);
}

- (NSNumber)realTimeChangePercent
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("realTimeChangePercent"));
}

- (void)setRealTimeChangePercent:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("realTimeChangePercent"), a3);
}

- (NSNumber)realTimePrice
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("realTimePrice"));
}

- (void)setRealTimePrice:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("realTimePrice"), a3);
}

- (NSNumber)realTimeTS
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("realTimeTS"));
}

- (void)setRealTimeTS:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("realTimeTS"), a3);
}

- (NSArray)requests
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("requests"), v3);
}

- (void)setRequests:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("requests"), (uint64_t)a3);
}

- (NSNumber)status
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("status"));
}

- (void)setStatus:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("status"), a3);
}

- (NSArray)stockNews
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("stockNews"), v3);
}

- (void)setStockNews:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("stockNews"), (uint64_t)a3);
}

- (NSString)symbol
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("symbol"));
}

- (void)setSymbol:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("symbol"), a3);
}

- (NSNumber)timeStamp
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("timeStamp"));
}

- (void)setTimeStamp:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("timeStamp"), a3);
}

- (NSNumber)volume
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("volume"));
}

- (void)setVolume:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("volume"), a3);
}

- (NSString)yearRange
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("yearRange"));
}

- (void)setYearRange:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("yearRange"), a3);
}

@end
