@implementation MOEventBundleRanking(MORankingParamsMO)

- (void)setRankingParamsFromRankingParamsMO:()MORankingParamsMO .cold.1(void *a1, NSObject *a2)
{
  int v3;
  id v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;

  v3 = 134218754;
  v4 = objc_msgSend(a1, "count");
  v5 = 2048;
  v6 = 15;
  v7 = 2080;
  v8 = "-[MOEventBundleRanking(MORankingParamsMO) setRankingParamsFromRankingParamsMO:]";
  v9 = 1024;
  v10 = 44;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Mismatch between ranking modelParameterDict, %lu and bundle interface type, %lu (in %s:%d)", (uint8_t *)&v3, 0x26u);
}

- (void)setRankingParamsFromRankingParamsMO:()MORankingParamsMO .cold.2(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;

  v1 = 136315394;
  v2 = "-[MOEventBundleRanking(MORankingParamsMO) setRankingParamsFromRankingParamsMO:]";
  v3 = 1024;
  v4 = 23;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "MOEventBundleRanking was not initialized (in %s:%d)", (uint8_t *)&v1, 0x12u);
}

@end
