@implementation TACoreAnalyticMetricManager

+ (id)computeMetricsInterVisit:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  TAMetricsInterVisit *v19;
  TAMetricsInterVisit *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v35;
  id obj;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v35 = v3;
  objc_msgSend(v3, "visitState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "interVisitMetricSnapshotBuffer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bufferCopy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reverseObjectEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v8;
  v38 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v38)
  {
    v37 = *(_QWORD *)v46;
    v40 = 1;
LABEL_3:
    v9 = 0;
LABEL_4:
    if (*(_QWORD *)v46 != v37)
      objc_enumerationMutation(obj);
    v10 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v9);
    if (objc_msgSend(v10, "isClosed"))
    {
      v39 = v9;
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      objc_msgSend(v10, "accumulatedDeviceMetrics");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
      if (!v12)
        goto LABEL_20;
      v13 = v12;
      v14 = *(_QWORD *)v42;
      while (1)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v42 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
          objc_msgSend(v10, "accumulatedDeviceMetrics");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKey:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v4, "objectForKey:", v16);
          v19 = (TAMetricsInterVisit *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            v20 = v19;
            -[TAMetricsInterVisit totalInterVisitMetric](v19, "totalInterVisitMetric");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "accumulate:", v18);

LABEL_14:
            goto LABEL_18;
          }
          if ((v40 & 1) != 0)
          {
            objc_msgSend(v18, "duration");
            if (v22 > 0.0)
            {
              v20 = objc_alloc_init(TAMetricsInterVisit);
              -[TAMetricsInterVisit currentInterVisitMetric](v20, "currentInterVisitMetric");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "accumulate:", v18);

              -[TAMetricsInterVisit totalInterVisitMetric](v20, "totalInterVisitMetric");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "accumulate:", v18);

              objc_msgSend(v4, "setObject:forKey:", v20, v16);
              goto LABEL_14;
            }
          }
LABEL_18:

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
        if (!v13)
        {
LABEL_20:

          v40 = 0;
          v9 = v39 + 1;
          if (v39 + 1 == v38)
          {
            v40 = 0;
            v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
            if (!v38)
              goto LABEL_22;
            goto LABEL_3;
          }
          goto LABEL_4;
        }
      }
    }
    v26 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
      +[TACoreAnalyticMetricManager computeMetricsInterVisit:].cold.1(v26, v27, v28, v29, v30, v31, v32, v33);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v25 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_22:

    v25 = v4;
  }

  return v25;
}

+ (id)computeMetricsVisit:(id)a3 withFilterVisitsSettings:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  TAMetricsVisit *v17;
  void *v18;
  void *v19;
  void *v20;
  TAMetricsVisit *v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v32;
  id obj;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  objc_msgSend(v5, "visitState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "visitSnapshotBuffer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "isClosed"))
  {
    v34 = v7;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v32 = v11;
    objc_msgSend(v11, "latestUtAdvertisements");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v36;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v36 != v14)
            objc_enumerationMutation(obj);
          v16 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v15);
          v17 = [TAMetricsVisit alloc];
          objc_msgSend(v8, "visitState");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "visitSnapshotBuffer");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "bufferCopy");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = -[TAMetricsVisit initWithSnapshotHistory:andAddress:andVisitFilterSettings:](v17, "initWithSnapshotHistory:andAddress:andVisitFilterSettings:", v20, v16, v6);

          if (v21)
            objc_msgSend(v34, "setObject:forKey:", v21, v16);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v13);
    }

    v7 = v34;
    v22 = v34;
    v11 = v32;
  }
  else
  {
    v23 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
      +[TACoreAnalyticMetricManager computeMetricsVisit:withFilterVisitsSettings:].cold.1(v23, v24, v25, v26, v27, v28, v29, v30);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v22 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v22;
}

+ (void)computeMetricsInterVisit:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_217877000, a1, a3, "#TACoreAnalyticMetricManager computing metrics for inter-visit type but seeing open inter-visit snapshot. Something is wrong.", a5, a6, a7, a8, 0);
}

+ (void)computeMetricsVisit:(uint64_t)a3 withFilterVisitsSettings:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_217877000, a1, a3, "#TACoreAnalyticMetricManager computing metrics for visit type but seeing open visit snapshot. Something is wrong.", a5, a6, a7, a8, 0);
}

@end
