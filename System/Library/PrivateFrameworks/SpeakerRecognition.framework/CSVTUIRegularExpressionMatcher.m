@implementation CSVTUIRegularExpressionMatcher

+ (int64_t)matchWithString:(id)a3 TrailingStr:(id)a4 LeadingStr:(id)a5 Pattern:(id)a6
{
  int64_t v6;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v6 = 0;
  v19 = *MEMORY[0x24BDAC8D0];
  if (a3 && a4 && a5 && a6)
  {
    v10 = a6;
    objc_msgSend(a3, "_stringByStrippingNoiseLeadingNoise:TrailingNoise:", a5, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x24BE28368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315394;
      v16 = "+[CSVTUIRegularExpressionMatcher matchWithString:TrailingStr:LeadingStr:Pattern:]";
      v17 = 2112;
      v18 = v11;
      _os_log_impl(&dword_2117D4000, v12, OS_LOG_TYPE_DEFAULT, "%s Testing [%@] against regex.", (uint8_t *)&v15, 0x16u);
    }
    objc_msgSend(v11, "_firstMatchesForRegularExpression:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v13, "count") != 0;
  }
  return v6;
}

@end
