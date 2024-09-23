@implementation PPSMetricManager

+ (id)metricDeclMap
{
  NSObject *v2;

  if (metricDeclMap_onceToken != -1)
    dispatch_once(&metricDeclMap_onceToken, &__block_literal_global_0);
  logHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    +[PPSMetricManager metricDeclMap].cold.1();

  return (id)metricDeclMap_subsystemToDeclClassMap;
}

void __33__PPSMetricManager_metricDeclMap__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;
  _QWORD block[4];
  id v5;

  v0 = (void *)objc_opt_new();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__PPSMetricManager_metricDeclMap__block_invoke_2;
  block[3] = &unk_25141D640;
  v5 = v0;
  v3 = v0;
  objc_enumerateClasses(0, 0, (Protocol *)&unk_2572DC6B8, 0, block);
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)metricDeclMap_subsystemToDeclClassMap;
  metricDeclMap_subsystemToDeclClassMap = v1;

}

+ (id)allDeclMetricsForSubsystem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v4 = a3;
  objc_msgSend(a1, "metricDeclMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && (objc_msgSend(v6, "conformsToProtocol:", &unk_2572DC6B8) & 1) != 0)
  {
    objc_msgSend(v6, "allDeclMetrics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    logHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      +[PPSMetricManager allDeclMetricsForSubsystem:].cold.1((uint64_t)v4, v8);

    v7 = 0;
  }

  return v7;
}

void __33__PPSMetricManager_metricDeclMap__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  NSObject *v5;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "subsystem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", a2, v4);

  logHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __33__PPSMetricManager_metricDeclMap__block_invoke_2_cold_1(a2);

}

+ (id)allDeclSubsystem
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "metricDeclMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)allDeclMetrics
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "metricDeclMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __34__PPSMetricManager_allDeclMetrics__block_invoke;
  v8[3] = &unk_25141D668;
  v6 = v3;
  v9 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

  return v6;
}

void __34__PPSMetricManager_allDeclMetrics__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_2572DC6B8))
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v5, "allDeclMetrics");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v4);

  }
}

+ (void)metricDeclMap
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend((id)metricDeclMap_subsystemToDeclClassMap, "count");
  OUTLINED_FUNCTION_0(&dword_24399D000, v0, v1, "subsystemToDeclClassMap count is %lu", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_1();
}

void __33__PPSMetricManager_metricDeclMap__block_invoke_2_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "subsystem");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_24399D000, v2, v3, "subsystemToDeclClassMap class name %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

+ (void)allDeclMetricsForSubsystem:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_24399D000, a2, OS_LOG_TYPE_DEBUG, "No static declaration available for subsystem: %@", (uint8_t *)&v2, 0xCu);
}

@end
