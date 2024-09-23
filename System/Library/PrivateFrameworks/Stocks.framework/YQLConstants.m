@implementation YQLConstants

+ (id)YQLQuoteToStocksKeyMap
{
  if (YQLQuoteToStocksKeyMap_onceToken != -1)
    dispatch_once(&YQLQuoteToStocksKeyMap_onceToken, &__block_literal_global_7);
  return (id)YQLQuoteToStocksKeyMap_quoteKeyMap;
}

void __38__YQLConstants_YQLQuoteToStocksKeyMap__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[19];
  _QWORD v3[20];

  v3[19] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("id_symbol");
  v2[1] = CFSTR("price");
  v3[0] = CFSTR("symbol");
  v3[1] = CFSTR("price");
  v2[2] = CFSTR("change");
  v2[3] = CFSTR("market_cap");
  v3[2] = CFSTR("change");
  v3[3] = CFSTR("marketcap");
  v2[4] = CFSTR("name");
  v2[5] = CFSTR("short_name");
  v3[4] = CFSTR("companyName");
  v3[5] = CFSTR("shortCompanyName");
  v2[6] = CFSTR("currency");
  v2[7] = CFSTR("open");
  v3[6] = CFSTR("currency");
  v3[7] = CFSTR("open");
  v2[8] = CFSTR("day_high");
  v2[9] = CFSTR("day_low");
  v3[8] = CFSTR("high");
  v3[9] = CFSTR("low");
  v2[10] = CFSTR("volume");
  v2[11] = CFSTR("avg_3m_volume");
  v3[10] = CFSTR("volume");
  v3[11] = CFSTR("averageVolume");
  v2[12] = CFSTR("exchange");
  v2[13] = CFSTR("pe_ratio");
  v3[12] = CFSTR("exchange");
  v3[13] = CFSTR("peRatio");
  v2[14] = CFSTR("year_high");
  v2[15] = CFSTR("year_low");
  v3[14] = CFSTR("yearHigh");
  v3[15] = CFSTR("yearLow");
  v2[16] = CFSTR("dividend_yield");
  v2[17] = CFSTR("details_url");
  v3[16] = CFSTR("dividendYield");
  v3[17] = CFSTR("infoURL");
  v2[18] = CFSTR("data_type");
  v3[18] = CFSTR("type");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 19);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)YQLQuoteToStocksKeyMap_quoteKeyMap;
  YQLQuoteToStocksKeyMap_quoteKeyMap = v0;

}

+ (id)YQLExchangeToStocksKeyMap
{
  if (YQLExchangeToStocksKeyMap_onceToken != -1)
    dispatch_once(&YQLExchangeToStocksKeyMap_onceToken, &__block_literal_global_154);
  return (id)YQLExchangeToStocksKeyMap_exchangeKeyMap;
}

void __41__YQLConstants_YQLExchangeToStocksKeyMap__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[11];
  _QWORD v3[12];

  v3[11] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("PRE_MARKET");
  v2[1] = CFSTR("REGULAR_MARKET");
  v3[0] = &unk_24D75F088;
  v3[1] = &unk_24D75F0A0;
  v2[2] = CFSTR("AFTERHOURS_MARKET");
  v2[3] = CFSTR("AFTER_AFTER_HOURS");
  v3[2] = &unk_24D75F0B8;
  v3[3] = &unk_24D75F0D0;
  v2[4] = CFSTR("PRE_PRE_MARKET_HOURS");
  v2[5] = CFSTR("MARKET_CLOSED");
  v3[4] = &unk_24D75F0E8;
  v3[5] = &unk_24D75F100;
  v2[6] = CFSTR("EXTENDED_HOURS_MARKET");
  v2[7] = CFSTR("WEEKEND_MARKET_CLOSED");
  v3[6] = &unk_24D75F0A0;
  v3[7] = &unk_24D75F100;
  v2[8] = CFSTR("HOLIDAY_MARKET_CLOSED");
  v2[9] = CFSTR("CHANGE_DATA_RESET");
  v3[8] = &unk_24D75F100;
  v3[9] = &unk_24D75F100;
  v2[10] = CFSTR("name");
  v3[10] = CFSTR("name");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 11);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)YQLExchangeToStocksKeyMap_exchangeKeyMap;
  YQLExchangeToStocksKeyMap_exchangeKeyMap = v0;

}

+ (id)YQLDataSourceToStocksKeyMap
{
  if (YQLDataSourceToStocksKeyMap_onceToken != -1)
    dispatch_once(&YQLDataSourceToStocksKeyMap_onceToken, &__block_literal_global_161);
  return (id)YQLDataSourceToStocksKeyMap_datasourceKeyMap;
}

void __43__YQLConstants_YQLDataSourceToStocksKeyMap__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];
  _QWORD v3[4];

  v3[3] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("id");
  v2[1] = CFSTR("name");
  v3[0] = CFSTR("id");
  v3[1] = CFSTR("name");
  v2[2] = CFSTR("text");
  v3[2] = CFSTR("text");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)YQLDataSourceToStocksKeyMap_datasourceKeyMap;
  YQLDataSourceToStocksKeyMap_datasourceKeyMap = v0;

}

@end
