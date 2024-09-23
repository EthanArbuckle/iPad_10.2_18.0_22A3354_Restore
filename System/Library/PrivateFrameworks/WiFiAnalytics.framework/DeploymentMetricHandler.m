@implementation DeploymentMetricHandler

- (DeploymentMetricHandler)initWithAnalyticsStore:(id)a3
{
  id v5;
  DeploymentMetricHandler *v6;
  DeploymentMetricHandler *v7;
  DeploymentMetricHandler *v8;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DeploymentMetricHandler;
  v6 = -[DeploymentMetricHandler init](&v11, sel_init);
  v7 = v6;
  if (!v6)
  {
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  objc_storeStrong((id *)&v6->_storeMOHandler, a3);
  if (!v7->_storeMOHandler)
  {
    WALogCategoryDefaultHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v13 = "-[DeploymentMetricHandler initWithAnalyticsStore:]";
      v14 = 1024;
      v15 = 101;
      _os_log_impl(&dword_212581000, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error getting _roamPolicyMOHandler", buf, 0x12u);
    }

    goto LABEL_7;
  }
  v7->_isInternalInstall = MGGetBoolAnswer();
  v8 = v7;
LABEL_8:

  return v8;
}

- (BOOL)metricNeedsSubmission:(id)a3 deploymentUuid:(id)a4 interval:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  double v26;
  uint64_t v27;
  BOOL v28;
  _BOOL4 v29;
  NSObject *v30;
  const char *v31;
  NSObject *v33;
  const char *v34;
  _BYTE v35[38];
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  unint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8)
  {
    WALogCategoryDefaultHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v35 = 136446466;
      *(_QWORD *)&v35[4] = "-[DeploymentMetricHandler metricNeedsSubmission:deploymentUuid:interval:]";
      *(_WORD *)&v35[12] = 1024;
      *(_DWORD *)&v35[14] = 120;
      v34 = "%{public}s::%d:networkMO nil";
LABEL_33:
      _os_log_impl(&dword_212581000, v33, OS_LOG_TYPE_ERROR, v34, v35, 0x12u);
    }
LABEL_34:

    LOBYTE(v29) = 0;
    goto LABEL_28;
  }
  if (!v9)
  {
    WALogCategoryDefaultHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v35 = 136446466;
      *(_QWORD *)&v35[4] = "-[DeploymentMetricHandler metricNeedsSubmission:deploymentUuid:interval:]";
      *(_WORD *)&v35[12] = 1024;
      *(_DWORD *)&v35[14] = 121;
      v34 = "%{public}s::%d:deploymentUuid nil";
      goto LABEL_33;
    }
    goto LABEL_34;
  }
  v11 = (void *)MEMORY[0x212BEF45C]();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[NetworkMO networkManagedObjectPropertyValue:forKey:](NetworkMO, "networkManagedObjectPropertyValue:forKey:", v8, CFSTR("DeploymentMetricInfo"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "objectForKey:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = v15;
      objc_msgSend(v15, "objectForKey:", CFSTR("DeploymentMetricLastSubmissionDate"));
      v17 = objc_claimAutoreleasedReturnValue();

      if (v17)
        goto LABEL_16;
      goto LABEL_13;
    }
    WALogCategoryDefaultHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v35 = 136446722;
      *(_QWORD *)&v35[4] = "-[DeploymentMetricHandler metricNeedsSubmission:deploymentUuid:interval:]";
      *(_WORD *)&v35[12] = 1024;
      *(_DWORD *)&v35[14] = 136;
      *(_WORD *)&v35[18] = 2112;
      *(_QWORD *)&v35[20] = v10;
      v19 = "%{public}s::%d:No previous metric info for deployment:%@";
      v20 = v18;
      v21 = 28;
      goto LABEL_11;
    }
  }
  else
  {
    WALogCategoryDefaultHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v35 = 136446466;
      *(_QWORD *)&v35[4] = "-[DeploymentMetricHandler metricNeedsSubmission:deploymentUuid:interval:]";
      *(_WORD *)&v35[12] = 1024;
      *(_DWORD *)&v35[14] = 139;
      v19 = "%{public}s::%d:No previous deployment metric available";
      v20 = v18;
      v21 = 18;
LABEL_11:
      _os_log_impl(&dword_212581000, v20, OS_LOG_TYPE_DEBUG, v19, v35, v21);
    }
  }

LABEL_13:
  objc_msgSend(v8, "ssid", *(_OWORD *)v35, *(_OWORD *)&v35[16]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[DeploymentMetricHandler storeMOHandler](self, "storeMOHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "managedObjectContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[JoinMO earliestJoinDate:moc:](JoinMO, "earliestJoinDate:moc:", v22, v24);
  v17 = objc_claimAutoreleasedReturnValue();

  WALogCategoryDefaultHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v35 = 136446722;
    *(_QWORD *)&v35[4] = "-[DeploymentMetricHandler metricNeedsSubmission:deploymentUuid:interval:]";
    *(_WORD *)&v35[12] = 1024;
    *(_DWORD *)&v35[14] = 144;
    *(_WORD *)&v35[18] = 2112;
    *(_QWORD *)&v35[20] = v17;
    _os_log_impl(&dword_212581000, v25, OS_LOG_TYPE_DEBUG, "%{public}s::%d:No previous submission: Earliest join date %@", v35, 0x1Cu);
  }

  if (!v17)
  {
    WALogCategoryDefaultHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v35 = 136446466;
      *(_QWORD *)&v35[4] = "-[DeploymentMetricHandler metricNeedsSubmission:deploymentUuid:interval:]";
      *(_WORD *)&v35[12] = 1024;
      *(_DWORD *)&v35[14] = 147;
      _os_log_impl(&dword_212581000, v17, OS_LOG_TYPE_ERROR, "%{public}s::%d:Not enough time elapsed.. bailing", v35, 0x12u);
    }
    LOBYTE(v29) = 0;
    goto LABEL_27;
  }
LABEL_16:
  objc_msgSend(v12, "timeIntervalSinceDate:", v17);
  v27 = (uint64_t)(v26 / 86400.0);
  if (a5)
    v28 = v27 <= (uint64_t)a5;
  else
    v28 = 0;
  v29 = !v28;
  WALogCategoryDefaultHandle();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    *(_QWORD *)&v35[4] = "-[DeploymentMetricHandler metricNeedsSubmission:deploymentUuid:interval:]";
    *(_WORD *)&v35[12] = 1024;
    v31 = "NO";
    *(_DWORD *)&v35[14] = 154;
    *(_WORD *)&v35[18] = 2080;
    *(_DWORD *)v35 = 136447490;
    if (v29)
      v31 = "YES";
    *(_QWORD *)&v35[20] = v31;
    *(_WORD *)&v35[28] = 2112;
    *(_QWORD *)&v35[30] = v17;
    v36 = 2048;
    v37 = v27;
    v38 = 2048;
    v39 = a5;
    _os_log_impl(&dword_212581000, v30, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Needs submisssion: %s (Previous metric from %@, diffDays:%ld interval:%ld) ", v35, 0x3Au);
  }

LABEL_27:
  objc_autoreleasePoolPop(v11);
LABEL_28:

  return v29;
}

- (void)networkDeploymentMetricCheckAndSubmit:(id)a3 deploymentUuid:(id)a4 interval:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  double v16;
  unint64_t v17;
  void *v18;
  char v19;
  NSObject *v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  os_log_type_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  NSObject *v32;
  const char *v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  id v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8)
  {
    WALogCategoryDefaultHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v35 = "-[DeploymentMetricHandler networkDeploymentMetricCheckAndSubmit:deploymentUuid:interval:]";
      v36 = 1024;
      v37 = 163;
      v33 = "%{public}s::%d:ssid nil";
LABEL_25:
      _os_log_impl(&dword_212581000, v32, OS_LOG_TYPE_ERROR, v33, buf, 0x12u);
    }
LABEL_26:

    goto LABEL_20;
  }
  if (!v9)
  {
    WALogCategoryDefaultHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v35 = "-[DeploymentMetricHandler networkDeploymentMetricCheckAndSubmit:deploymentUuid:interval:]";
      v36 = 1024;
      v37 = 164;
      v33 = "%{public}s::%d:deploymentUuid nil";
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  v11 = (void *)MEMORY[0x212BEF45C]();
  -[DeploymentMetricHandler storeMOHandler](self, "storeMOHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "managedObjectContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[NetworkMO getInstance:moc:](NetworkMO, "getInstance:moc:", v8, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    WALogCategoryDefaultHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v35 = "-[DeploymentMetricHandler networkDeploymentMetricCheckAndSubmit:deploymentUuid:interval:]";
      v36 = 1024;
      v37 = 169;
      v38 = 2112;
      v39 = v8;
      _os_log_impl(&dword_212581000, v15, OS_LOG_TYPE_ERROR, "%{public}s::%d:networkMO nil for ssid %@", buf, 0x1Cu);
    }
    goto LABEL_18;
  }
  if (-[DeploymentMetricHandler metricNeedsSubmission:deploymentUuid:interval:](self, "metricNeedsSubmission:deploymentUuid:interval:", v14, v10, a5))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!-[DeploymentMetricHandler appendNetworkAnalyticsToMetric:ssid:deploymentUuid:maxAgeInDays:](self, "appendNetworkAnalyticsToMetric:ssid:deploymentUuid:maxAgeInDays:", v15, v8, v10, 14))
    {
LABEL_18:

      goto LABEL_19;
    }
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    v17 = llround(v16);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v18, CFSTR("MetricStitchIndex"));

    v15 = v15;
    v19 = AnalyticsSendEventLazy();
    WALogCategoryDefaultHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if ((v19 & 1) != 0)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136447234;
        v35 = "-[DeploymentMetricHandler networkDeploymentMetricCheckAndSubmit:deploymentUuid:interval:]";
        v36 = 1024;
        v37 = 190;
        v38 = 2112;
        v39 = v8;
        v40 = 2112;
        v41 = v10;
        v42 = 2048;
        v43 = -[NSObject count](v15, "count");
        v22 = "%{public}s::%d:Sending DeploymentMetric for ssid: %@ (deploymentUuid: %@) with fieldCount: %lu";
        v23 = v21;
        v24 = OS_LOG_TYPE_DEBUG;
LABEL_11:
        _os_log_impl(&dword_212581000, v23, v24, v22, buf, 0x30u);
      }
    }
    else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136447234;
      v35 = "-[DeploymentMetricHandler networkDeploymentMetricCheckAndSubmit:deploymentUuid:interval:]";
      v36 = 1024;
      v37 = 188;
      v38 = 2112;
      v39 = v8;
      v40 = 2112;
      v41 = v10;
      v42 = 2048;
      v43 = -[NSObject count](v15, "count");
      v22 = "%{public}s::%d:Failed sending DeploymentMetric for ssid: %@ (deploymentUuid: %@) with fieldCount: %lu";
      v23 = v21;
      v24 = OS_LOG_TYPE_ERROR;
      goto LABEL_11;
    }

    -[DeploymentMetricHandler submitBssAnalyticsMetrics:deploymentUuid:stitchIndex:](self, "submitBssAnalyticsMetrics:deploymentUuid:stitchIndex:", v8, v10, v17);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    WALogCategoryDefaultHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446722;
      v35 = "-[DeploymentMetricHandler networkDeploymentMetricCheckAndSubmit:deploymentUuid:interval:]";
      v36 = 1024;
      v37 = 198;
      v38 = 2112;
      v39 = v25;
      _os_log_impl(&dword_212581000, v27, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Metric updated date: %@", buf, 0x1Cu);
    }

    objc_msgSend(v26, "setObject:forKey:", v25, CFSTR("DeploymentMetricLastSubmissionDate"));
    +[NetworkMO networkManagedObjectPropertyValue:forKey:](NetworkMO, "networkManagedObjectPropertyValue:forKey:", v14, CFSTR("DeploymentMetricInfo"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v28)
    {
      objc_msgSend(v28, "removeObjectForKey:", v10);
      objc_msgSend(v29, "setObject:forKey:", v26, v10);
      v30 = v29;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v30 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setObject:forKey:", v26, v10);
    }
    -[DeploymentMetricHandler storeMOHandler](self, "storeMOHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setNetworkManagedObjectPropertyValueForKeyWithoutSave:forKey:withValue:", v14, CFSTR("DeploymentMetricInfo"), v30);

    goto LABEL_18;
  }
LABEL_19:

  objc_autoreleasePoolPop(v11);
LABEL_20:

}

id __89__DeploymentMetricHandler_networkDeploymentMetricCheckAndSubmit_deploymentUuid_interval___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)submitBssAnalyticsMetrics:(id)a3 deploymentUuid:(id)a4 stitchIndex:(int64_t)a5
{
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  int v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  const char *v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  int v46;
  NSObject *v47;
  NSObject *v48;
  NSObject *v49;
  uint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  const char *v53;
  NSObject *v54;
  uint64_t v55;
  NSObject *v56;
  const char *v57;
  void *v58;
  NSObject *v59;
  uint64_t v60;
  NSObject *v61;
  NSObject *v62;
  uint64_t v63;
  void *v65;
  DeploymentMetricHandler *v66;
  uint8_t buf[4];
  const char *v68;
  __int16 v69;
  int v70;
  __int16 v71;
  NSObject *v72;
  __int16 v73;
  NSObject *v74;
  __int16 v75;
  uint64_t v76;
  __int16 v77;
  uint64_t v78;
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x212BEF45C]();
  if (!v7)
  {
    WALogCategoryDefaultHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v68 = "-[DeploymentMetricHandler submitBssAnalyticsMetrics:deploymentUuid:stitchIndex:]";
      v69 = 1024;
      v70 = 232;
      v57 = "%{public}s::%d:ssid nil";
LABEL_49:
      _os_log_impl(&dword_212581000, v14, OS_LOG_TYPE_ERROR, v57, buf, 0x12u);
    }
LABEL_50:
    v12 = 0;
LABEL_44:

    goto LABEL_40;
  }
  -[DeploymentMetricHandler storeMOHandler](self, "storeMOHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = +[BSSMO copyBssidsForDeployment:deploymentUuid:moc:](BSSMO, "copyBssidsForDeployment:deploymentUuid:moc:", v7, v8, v11);

  if (!v12)
  {
    WALogCategoryDefaultHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v68 = "-[DeploymentMetricHandler submitBssAnalyticsMetrics:deploymentUuid:stitchIndex:]";
      v69 = 1024;
      v70 = 236;
      v57 = "%{public}s::%d:bssidArray nil";
      goto LABEL_49;
    }
    goto LABEL_50;
  }
  if (!objc_msgSend(v12, "count"))
  {
    WALogCategoryDefaultHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v68 = "-[DeploymentMetricHandler submitBssAnalyticsMetrics:deploymentUuid:stitchIndex:]";
      v69 = 1024;
      v70 = 237;
      _os_log_impl(&dword_212581000, v14, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssidArray empty", buf, 0x12u);
    }
    goto LABEL_44;
  }
  v60 = objc_msgSend(v12, "count");
  if (v60)
  {
    v66 = self;
    v58 = v9;
    v61 = v8;
    v13 = 0;
    v59 = v7;
    v65 = v12;
    while (1)
    {
      objc_msgSend(v12, "objectAtIndex:", v13);
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
        break;
LABEL_38:

      if (++v13 == v60)
      {
        v8 = v61;
        v9 = v58;
        goto LABEL_40;
      }
    }
    -[DeploymentMetricHandler storeMOHandler](v66, "storeMOHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "managedObjectContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[BSSMO getInstance:ssid:moc:](BSSMO, "getInstance:ssid:moc:", v14, v7, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      WALogCategoryDefaultHandle();
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v68 = "-[DeploymentMetricHandler submitBssAnalyticsMetrics:deploymentUuid:stitchIndex:]";
        v69 = 1024;
        v70 = 246;
        v71 = 2112;
        v72 = v7;
        v73 = 2112;
        v74 = v14;
        _os_log_impl(&dword_212581000, v56, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssMo nil for %@[%@]", buf, 0x26u);
      }

      v8 = v61;
      v9 = v58;
      goto LABEL_44;
    }
    objc_msgSend(v17, "bssid");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v12, "indexOfObject:", v18);

    +[BSSMO bssManagedObjectPropertyValue:forKey:](BSSMO, "bssManagedObjectPropertyValue:forKey:", v17, CFSTR("NeighborInfo"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x212BEF45C]();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v14;
    if (!-[DeploymentMetricHandler appendBssAnalyticsToMetric:bssMo:maxAgeInDays:](v66, "appendBssAnalyticsToMetric:bssMo:maxAgeInDays:", v22, v17, 14)|| v19 == 0x7FFFFFFFFFFFFFFFLL)
    {

      objc_autoreleasePoolPop(v21);
LABEL_37:

      v7 = v59;
      v12 = v65;
      v14 = v62;
      goto LABEL_38;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v23, CFSTR("MetricStitchIndex"));

    if (v20)
    {
      v24 = objc_msgSend(v20, "count");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v25, CFSTR("NeighborsCount"));

    }
    else
    {
      v24 = 0;
    }
    v63 = v19 + 1;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v26, CFSTR("BssIndex"));

    v27 = v22;
    v28 = AnalyticsSendEventLazy();
    WALogCategoryDefaultHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v28)
    {
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        goto LABEL_20;
      v31 = objc_msgSend(v27, "count");
      *(_DWORD *)buf = 136447234;
      v68 = "-[DeploymentMetricHandler submitBssAnalyticsMetrics:deploymentUuid:stitchIndex:]";
      v69 = 1024;
      v70 = 272;
      v71 = 2112;
      v72 = v14;
      v73 = 2112;
      v74 = v61;
      v75 = 2048;
      v76 = v31;
      v32 = v30;
      v33 = OS_LOG_TYPE_DEBUG;
      v34 = "%{public}s::%d:Send success DeploymentBssInfo for bssid: %@ (deploymentUuid: %@) with fieldCount: %lu";
    }
    else
    {
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        goto LABEL_20;
      v35 = objc_msgSend(v27, "count");
      *(_DWORD *)buf = 136447234;
      v68 = "-[DeploymentMetricHandler submitBssAnalyticsMetrics:deploymentUuid:stitchIndex:]";
      v69 = 1024;
      v70 = 274;
      v71 = 2112;
      v72 = v14;
      v73 = 2112;
      v74 = v61;
      v75 = 2048;
      v76 = v35;
      v32 = v30;
      v33 = OS_LOG_TYPE_ERROR;
      v34 = "%{public}s::%d:Failed sending DeploymentBssInfo for bssid: %@ (deploymentUuid: %@) with fieldCount: %lu";
    }
    _os_log_impl(&dword_212581000, v32, v33, v34, buf, 0x30u);
LABEL_20:

    objc_autoreleasePoolPop(v21);
    if (v24)
    {
      v36 = 0;
      while (1)
      {
        v37 = (void *)MEMORY[0x212BEF45C]();
        objc_msgSend(v20, "objectAtIndex:", v36);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v38)
        {
          WALogCategoryDefaultHandle();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v17, "bssid");
            v54 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136446978;
            v68 = "-[DeploymentMetricHandler submitBssAnalyticsMetrics:deploymentUuid:stitchIndex:]";
            v69 = 1024;
            v70 = 284;
            v71 = 2048;
            v72 = v36;
            v73 = 2112;
            v74 = v54;
            _os_log_impl(&dword_212581000, v45, OS_LOG_TYPE_ERROR, "%{public}s::%d:No neighbor data at index %lu for bssid:%@", buf, 0x26u);

          }
          goto LABEL_36;
        }
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "addEntriesFromDictionary:", v38);
        objc_msgSend(v38, "valueForKey:", CFSTR("NeighborBssid"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v65, "indexOfObject:", v40);

        if (v41 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v41 + 1);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "setObject:forKeyedSubscript:", v42, CFSTR("NeighborBssIndex"));

        }
        if (!-[DeploymentMetricHandler isInternalInstall](v66, "isInternalInstall"))
          objc_msgSend(v39, "removeObjectForKey:", CFSTR("NeighborBssid"));
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setObject:forKeyedSubscript:", v43, CFSTR("MetricStitchIndex"));

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v63);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setObject:forKeyedSubscript:", v44, CFSTR("BssIndex"));

        v45 = v39;
        v46 = AnalyticsSendEventLazy();
        WALogCategoryDefaultHandle();
        v47 = objc_claimAutoreleasedReturnValue();
        v48 = v47;
        if (v46)
        {
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v38, "valueForKey:", CFSTR("NeighborBssid"));
            v49 = objc_claimAutoreleasedReturnValue();
            v50 = -[NSObject count](v45, "count");
            *(_DWORD *)buf = 136447490;
            v68 = "-[DeploymentMetricHandler submitBssAnalyticsMetrics:deploymentUuid:stitchIndex:]";
            v69 = 1024;
            v70 = 311;
            v71 = 2112;
            v72 = v49;
            v73 = 2112;
            v74 = v62;
            v75 = 2112;
            v76 = (uint64_t)v61;
            v77 = 2048;
            v78 = v50;
            v51 = v48;
            v52 = OS_LOG_TYPE_DEBUG;
            v53 = "%{public}s::%d:Send success DeploymentBssNeighborInfo for neighbor: %@ of bssid: %@ (deploymentUuid: %"
                  "@) with fieldCount: %lu";
LABEL_34:
            _os_log_impl(&dword_212581000, v51, v52, v53, buf, 0x3Au);

          }
        }
        else if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v38, "valueForKey:", CFSTR("NeighborBssid"));
          v49 = objc_claimAutoreleasedReturnValue();
          v55 = -[NSObject count](v45, "count");
          *(_DWORD *)buf = 136447490;
          v68 = "-[DeploymentMetricHandler submitBssAnalyticsMetrics:deploymentUuid:stitchIndex:]";
          v69 = 1024;
          v70 = 313;
          v71 = 2112;
          v72 = v49;
          v73 = 2112;
          v74 = v62;
          v75 = 2112;
          v76 = (uint64_t)v61;
          v77 = 2048;
          v78 = v55;
          v51 = v48;
          v52 = OS_LOG_TYPE_ERROR;
          v53 = "%{public}s::%d:Failed sending DeploymentBssNeighborInfo for neighbor: %@ of bssid: %@ (deploymentUuid: %"
                "@) with fieldCount: %lu";
          goto LABEL_34;
        }

LABEL_36:
        objc_autoreleasePoolPop(v37);
        v36 = ((char *)v36 + 1);
        if (v24 == v36)
          goto LABEL_37;
      }
    }
    goto LABEL_37;
  }
LABEL_40:

  objc_autoreleasePoolPop(v9);
}

id __80__DeploymentMetricHandler_submitBssAnalyticsMetrics_deploymentUuid_stitchIndex___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __80__DeploymentMetricHandler_submitBssAnalyticsMetrics_deploymentUuid_stitchIndex___block_invoke_65(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (BOOL)appendNetworkAnalyticsToMetric:(id)a3 ssid:(id)a4 deploymentUuid:(id)a5 maxAgeInDays:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  NSObject *v43;
  const char *v44;
  NSObject *v45;
  unint64_t v46;
  void *v47;
  id v48;
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  int v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v11)
  {
    WALogCategoryDefaultHandle();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v50 = "-[DeploymentMetricHandler appendNetworkAnalyticsToMetric:ssid:deploymentUuid:maxAgeInDays:]";
      v51 = 1024;
      v52 = 331;
      v44 = "%{public}s::%d:ssidStr nil";
LABEL_17:
      _os_log_impl(&dword_212581000, v43, OS_LOG_TYPE_ERROR, v44, buf, 0x12u);
    }
LABEL_18:

    v17 = 0;
    goto LABEL_12;
  }
  if (!v10)
  {
    WALogCategoryDefaultHandle();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v50 = "-[DeploymentMetricHandler appendNetworkAnalyticsToMetric:ssid:deploymentUuid:maxAgeInDays:]";
      v51 = 1024;
      v52 = 332;
      v44 = "%{public}s::%d:metricDict nil";
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  v13 = (void *)MEMORY[0x212BEF45C]();
  -[DeploymentMetricHandler storeMOHandler](self, "storeMOHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "managedObjectContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[NetworkMO getInstance:moc:](NetworkMO, "getInstance:moc:", v11, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v16 != 0;
  if (v16)
  {
    v47 = v13;
    v48 = v12;
    -[DeploymentMetricHandler storeMOHandler](self, "storeMOHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "managedObjectContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = +[RoamMO dwellTimeInBand:bandIs24:bssid:maxAgeInDays:moc:](RoamMO, "dwellTimeInBand:bandIs24:bssid:maxAgeInDays:moc:", v11, 1, 0, 0, v19);

    -[DeploymentMetricHandler storeMOHandler](self, "storeMOHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "managedObjectContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = +[RoamMO dwellTimeInBand:bandIs24:bssid:maxAgeInDays:moc:](RoamMO, "dwellTimeInBand:bandIs24:bssid:maxAgeInDays:moc:", v11, 0, 0, 0, v21);

    -[DeploymentMetricHandler storeMOHandler](self, "storeMOHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "managedObjectContext");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = +[BSSMO numBssInBand:bandIs24:moc:](BSSMO, "numBssInBand:bandIs24:moc:", v11, 1, v24);

    -[DeploymentMetricHandler storeMOHandler](self, "storeMOHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "managedObjectContext");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = +[BSSMO numBssInBand:bandIs24:moc:](BSSMO, "numBssInBand:bandIs24:moc:", v11, 0, v27);

    +[NetworkMO networkManagedObjectPropertyValue:forKey:](NetworkMO, "networkManagedObjectPropertyValue:forKey:", v16, CFSTR("NetworkSummaryNetworkFlags"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[DeploymentMetricHandler isInternalInstall](self, "isInternalInstall"))
    {
      objc_msgSend(v16, "ssid");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v30, CFSTR("Ssid"));

    }
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v29, CFSTR("AuthFlags"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v16, "numBSS"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v31, CFSTR("NumBss"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v46);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v32, CFSTR("DwellTimePct_24GHZ"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v22);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v33, CFSTR("DwellTimePct_5GHZ"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v25);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v34, CFSTR("NumBss_24GHZ"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v28);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v35, CFSTR("NumBss_5GHZ"));

    v36 = (void *)MEMORY[0x212BEF45C](-[DeploymentMetricHandler appendJoinsSummaryToMetric:ssid:maxAgeInDays:](self, "appendJoinsSummaryToMetric:ssid:maxAgeInDays:", v10, v11, a6));
    -[DeploymentMetricHandler roamsSummary:bssid:maxAgeInDays:](self, "roamsSummary:bssid:maxAgeInDays:", v11, 0, a6);
    v37 = objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      v38 = (void *)v37;
      objc_msgSend(v10, "addEntriesFromDictionary:", v37);

    }
    objc_autoreleasePoolPop(v36);
    v39 = (void *)MEMORY[0x212BEF45C]();
    -[DeploymentMetricHandler leavesSummary:bssid:maxAgeInDays:](self, "leavesSummary:bssid:maxAgeInDays:", v11, 0, a6);
    v40 = objc_claimAutoreleasedReturnValue();
    v12 = v48;
    if (v40)
    {
      v41 = (void *)v40;
      objc_msgSend(v10, "addEntriesFromDictionary:", v40);

    }
    objc_autoreleasePoolPop(v39);

    v13 = v47;
    v17 = 1;
  }
  else
  {
    WALogCategoryDefaultHandle();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v50 = "-[DeploymentMetricHandler appendNetworkAnalyticsToMetric:ssid:deploymentUuid:maxAgeInDays:]";
      v51 = 1024;
      v52 = 340;
      v53 = 2112;
      v54 = v11;
      _os_log_impl(&dword_212581000, v45, OS_LOG_TYPE_ERROR, "%{public}s::%d:networkMo nil for ssid %@", buf, 0x1Cu);
    }

  }
  objc_autoreleasePoolPop(v13);
LABEL_12:

  return v17;
}

- (id)roamsSummary:(id)a3 bssid:(id)a4 maxAgeInDays:(unint64_t)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
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
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  unint64_t v44;
  void *v45;
  void *v46;
  unint64_t v47;
  void *v48;
  void *v49;
  unint64_t v50;
  void *v51;
  void *v52;
  unint64_t v53;
  void *v54;
  void *v55;
  unint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  NSObject *v67;
  unint64_t v68;
  unint64_t v69;
  DeploymentMetricHandler *v70;
  void *v71;
  void *context;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  _QWORD v80[7];
  _QWORD v81[7];
  _QWORD v82[2];
  _QWORD v83[2];
  _QWORD v84[2];
  _QWORD v85[2];
  _QWORD v86[2];
  _QWORD v87[2];
  _QWORD v88[2];
  _QWORD v89[3];
  uint8_t buf[4];
  const char *v91;
  __int16 v92;
  int v93;
  uint64_t v94;

  v94 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    v70 = self;
    context = (void *)MEMORY[0x212BEF45C]();
    +[RoamMO entityName](RoamMO, "entityName");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x24BDD14C0];
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("source.network.ssid == %@"), v8);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    v73 = v8;
    v71 = (void *)v10;
    if (v9)
    {
      v89[0] = v12;
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("source.bssid == %@"), v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v89[1] = v14;
      +[AnalyticsStoreProxy predicateForEntityWithAge:maxAge:](AnalyticsStoreProxy, "predicateForEntityWithAge:maxAge:", v10, a5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v15, "copy");
      v89[2] = v16;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v89, 3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "andPredicateWithSubpredicates:", v17);
      v18 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v88[0] = v12;
      +[AnalyticsStoreProxy predicateForEntityWithAge:maxAge:](AnalyticsStoreProxy, "predicateForEntityWithAge:maxAge:", v10, a5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v14, "copy");
      v88[1] = v15;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v88, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "andPredicateWithSubpredicates:", v16);
      v18 = objc_claimAutoreleasedReturnValue();
    }

    v19 = (void *)MEMORY[0x24BDD14C0];
    v87[0] = v18;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("status == 0"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v87[1] = v20;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v87, 2);
    v21 = (void *)v18;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "andPredicateWithSubpredicates:", v22);
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = (void *)MEMORY[0x24BDD14C0];
    v86[0] = v21;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("status != 0"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v86[1] = v24;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v86, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "andPredicateWithSubpredicates:", v25);
    v79 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = (void *)MEMORY[0x24BDD14C0];
    v85[0] = v21;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("status == %d"), 3766617089);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v85[1] = v27;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v85, 2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "andPredicateWithSubpredicates:", v28);
    v78 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = (void *)MEMORY[0x24BDD14C0];
    v84[0] = v21;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("status == %d"), 3766617092);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v84[1] = v30;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v84, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "andPredicateWithSubpredicates:", v31);
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = (void *)MEMORY[0x24BDD14C0];
    v83[0] = v21;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("status == %d"), 3766617091);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v83[1] = v33;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v83, 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "andPredicateWithSubpredicates:", v34);
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = (void *)MEMORY[0x24BDD14C0];
    v82[0] = v21;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("status == %d"), 3766617163);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v82[1] = v36;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v82, 2);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "andPredicateWithSubpredicates:", v37);
    v75 = (void *)objc_claimAutoreleasedReturnValue();

    -[DeploymentMetricHandler storeMOHandler](v70, "storeMOHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "managedObjectContext");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = +[AnalyticsStoreProxy entityCount:withPredicate:moc:](AnalyticsStoreProxy, "entityCount:withPredicate:moc:", v71, v21, v39);

    -[DeploymentMetricHandler storeMOHandler](v70, "storeMOHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "managedObjectContext");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = +[AnalyticsStoreProxy entityCount:withPredicate:moc:](AnalyticsStoreProxy, "entityCount:withPredicate:moc:", v71, v74, v41);

    -[DeploymentMetricHandler storeMOHandler](v70, "storeMOHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "managedObjectContext");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = +[AnalyticsStoreProxy entityCount:withPredicate:moc:](AnalyticsStoreProxy, "entityCount:withPredicate:moc:", v71, v79, v43);

    -[DeploymentMetricHandler storeMOHandler](v70, "storeMOHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "managedObjectContext");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = +[AnalyticsStoreProxy entityCount:withPredicate:moc:](AnalyticsStoreProxy, "entityCount:withPredicate:moc:", v71, v78, v46);

    -[DeploymentMetricHandler storeMOHandler](v70, "storeMOHandler");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "managedObjectContext");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = +[AnalyticsStoreProxy entityCount:withPredicate:moc:](AnalyticsStoreProxy, "entityCount:withPredicate:moc:", v71, v77, v49);

    -[DeploymentMetricHandler storeMOHandler](v70, "storeMOHandler");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "managedObjectContext");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = +[AnalyticsStoreProxy entityCount:withPredicate:moc:](AnalyticsStoreProxy, "entityCount:withPredicate:moc:", v71, v76, v52);

    -[DeploymentMetricHandler storeMOHandler](v70, "storeMOHandler");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "managedObjectContext");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = +[AnalyticsStoreProxy entityCount:withPredicate:moc:](AnalyticsStoreProxy, "entityCount:withPredicate:moc:", v71, v75, v55);

    v80[0] = CFSTR("RoamsAttempted");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v69);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v81[0] = v57;
    v80[1] = CFSTR("RoamsSuccess");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v68);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v81[1] = v58;
    v80[2] = CFSTR("RoamsFailed");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v44);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v81[2] = v59;
    v80[3] = CFSTR("RoamsFailReasonFailed");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v47);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v81[3] = v60;
    v80[4] = CFSTR("RoamsFailReasonAbort");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v50);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v81[4] = v61;
    v80[5] = CFSTR("RoamsFailReasonNoCand");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v53);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v81[5] = v62;
    v80[6] = CFSTR("RoamsFailReasonNoCandByScore");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v56);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v81[6] = v63;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v81, v80, 7);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    v65 = (void *)objc_msgSend(v64, "copy");
    objc_autoreleasePoolPop(context);
    v8 = v73;
  }
  else
  {
    WALogCategoryDefaultHandle();
    v67 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v91 = "-[DeploymentMetricHandler roamsSummary:bssid:maxAgeInDays:]";
      v92 = 1024;
      v93 = 385;
      _os_log_impl(&dword_212581000, v67, OS_LOG_TYPE_ERROR, "%{public}s::%d:ssid nil", buf, 0x12u);
    }

    v65 = 0;
  }

  return v65;
}

- (id)leavesSummary:(id)a3 bssid:(id)a4 maxAgeInDays:(unint64_t)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
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
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
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
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  unint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  unint64_t v64;
  void *v65;
  void *v66;
  unint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  NSObject *v80;
  unint64_t v81;
  unint64_t v82;
  unint64_t v83;
  unint64_t v84;
  unint64_t v85;
  unint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *context;
  id v93;
  id v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  _QWORD v100[2];
  _QWORD v101[2];
  _QWORD v102[2];
  _QWORD v103[2];
  _QWORD v104[2];
  _QWORD v105[2];
  _QWORD v106[2];
  _QWORD v107[2];
  _QWORD v108[2];
  _QWORD v109[2];
  _QWORD v110[3];
  uint8_t buf[4];
  const char *v112;
  __int16 v113;
  int v114;
  uint64_t v115;

  v115 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    context = (void *)MEMORY[0x212BEF45C]();
    +[LeaveMO entityName](LeaveMO, "entityName");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x24BDD14C0];
    v94 = v8;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("bss.network.ssid == %@"), v8);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    v93 = v9;
    v91 = (void *)v10;
    if (v9)
    {
      v110[0] = v12;
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("bss.bssid == %@"), v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v110[1] = v14;
      +[AnalyticsStoreProxy predicateForEntityWithAge:maxAge:](AnalyticsStoreProxy, "predicateForEntityWithAge:maxAge:", v10, a5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v15, "copy");
      v110[2] = v16;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v110, 3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "andPredicateWithSubpredicates:", v17);
      v18 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v109[0] = v12;
      +[AnalyticsStoreProxy predicateForEntityWithAge:maxAge:](AnalyticsStoreProxy, "predicateForEntityWithAge:maxAge:", v10, a5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v14, "copy");
      v109[1] = v15;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v109, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "andPredicateWithSubpredicates:", v16);
      v18 = objc_claimAutoreleasedReturnValue();
    }

    v19 = (void *)MEMORY[0x24BDD14C0];
    v108[0] = v18;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("reason == %d"), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v108[1] = v20;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v108, 2);
    v21 = (void *)v18;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "andPredicateWithSubpredicates:", v22);
    v98 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = (void *)MEMORY[0x24BDD14C0];
    v107[0] = v21;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("reason == %d"), 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v107[1] = v24;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v107, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "andPredicateWithSubpredicates:", v25);
    v99 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = (void *)MEMORY[0x24BDD14C0];
    v106[0] = v21;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("reason == %d"), 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v106[1] = v27;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v106, 2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "andPredicateWithSubpredicates:", v28);
    v96 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = (void *)MEMORY[0x24BDD14C0];
    v105[0] = v21;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("reason == %d"), 4);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v105[1] = v30;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v105, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "andPredicateWithSubpredicates:", v31);
    v97 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = (void *)MEMORY[0x24BDD14C0];
    v104[0] = v21;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("reason == %d"), 1000);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v104[1] = v33;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v104, 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "andPredicateWithSubpredicates:", v34);
    v90 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = (void *)MEMORY[0x24BDD14C0];
    v103[0] = v21;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("reason == %d"), 1006);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v103[1] = v36;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v103, 2);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "andPredicateWithSubpredicates:", v37);
    v95 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = (void *)MEMORY[0x24BDD14C0];
    v102[0] = v21;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("reason == %d"), 1011);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v102[1] = v39;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v102, 2);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "andPredicateWithSubpredicates:", v40);
    v89 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = (void *)MEMORY[0x24BDD14C0];
    v101[0] = v21;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("reason == %d"), 1013);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v101[1] = v42;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v101, 2);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "andPredicateWithSubpredicates:", v43);
    v88 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = (void *)MEMORY[0x24BDD14C0];
    v100[0] = v21;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("reason == %d"), 1007);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v100[1] = v45;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v100, 2);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "andPredicateWithSubpredicates:", v46);
    v87 = (void *)objc_claimAutoreleasedReturnValue();

    -[DeploymentMetricHandler storeMOHandler](self, "storeMOHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "managedObjectContext");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = +[AnalyticsStoreProxy entityCount:withPredicate:moc:](AnalyticsStoreProxy, "entityCount:withPredicate:moc:", v91, v98, v48);

    -[DeploymentMetricHandler storeMOHandler](self, "storeMOHandler");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "managedObjectContext");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = +[AnalyticsStoreProxy entityCount:withPredicate:moc:](AnalyticsStoreProxy, "entityCount:withPredicate:moc:", v91, v99, v50);

    -[DeploymentMetricHandler storeMOHandler](self, "storeMOHandler");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "managedObjectContext");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = +[AnalyticsStoreProxy entityCount:withPredicate:moc:](AnalyticsStoreProxy, "entityCount:withPredicate:moc:", v91, v96, v52);

    -[DeploymentMetricHandler storeMOHandler](self, "storeMOHandler");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "managedObjectContext");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = +[AnalyticsStoreProxy entityCount:withPredicate:moc:](AnalyticsStoreProxy, "entityCount:withPredicate:moc:", v91, v97, v54);

    -[DeploymentMetricHandler storeMOHandler](self, "storeMOHandler");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "managedObjectContext");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = +[AnalyticsStoreProxy entityCount:withPredicate:moc:](AnalyticsStoreProxy, "entityCount:withPredicate:moc:", v91, v90, v56);

    -[DeploymentMetricHandler storeMOHandler](self, "storeMOHandler");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "managedObjectContext");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = +[AnalyticsStoreProxy entityCount:withPredicate:moc:](AnalyticsStoreProxy, "entityCount:withPredicate:moc:", v91, v95, v59);

    -[DeploymentMetricHandler storeMOHandler](self, "storeMOHandler");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "managedObjectContext");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = +[AnalyticsStoreProxy entityCount:withPredicate:moc:](AnalyticsStoreProxy, "entityCount:withPredicate:moc:", v91, v89, v61);

    -[DeploymentMetricHandler storeMOHandler](self, "storeMOHandler");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "managedObjectContext");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = +[AnalyticsStoreProxy entityCount:withPredicate:moc:](AnalyticsStoreProxy, "entityCount:withPredicate:moc:", v91, v88, v63);

    -[DeploymentMetricHandler storeMOHandler](self, "storeMOHandler");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "managedObjectContext");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = +[AnalyticsStoreProxy entityCount:withPredicate:moc:](AnalyticsStoreProxy, "entityCount:withPredicate:moc:", v91, v87, v66);

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v86);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setObject:forKeyedSubscript:", v69, CFSTR("LinkDownReasonUnknown"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v85);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setObject:forKeyedSubscript:", v70, CFSTR("LinkDownReasonDeauth"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v84);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setObject:forKeyedSubscript:", v71, CFSTR("LinkDownReasonBeaconLoss"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v83);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setObject:forKeyedSubscript:", v72, CFSTR("LinkDownReasonSystemSleep"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v57);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setObject:forKeyedSubscript:", v73, CFSTR("LinkDownReasonTrigDisc"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v82);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setObject:forKeyedSubscript:", v74, CFSTR("LinkDownReasonThermal"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v81);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setObject:forKeyedSubscript:", v75, CFSTR("LinkDownReasonControlCenter"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v64);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setObject:forKeyedSubscript:", v76, CFSTR("LinkDownReasonNetworkTrans"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v67);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setObject:forKeyedSubscript:", v77, CFSTR("LinkDownReasonInternetSharing"));

    v78 = (void *)objc_msgSend(v68, "copy");
    objc_autoreleasePoolPop(context);
    v9 = v93;
    v8 = v94;
  }
  else
  {
    WALogCategoryDefaultHandle();
    v80 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v112 = "-[DeploymentMetricHandler leavesSummary:bssid:maxAgeInDays:]";
      v113 = 1024;
      v114 = 435;
      _os_log_impl(&dword_212581000, v80, OS_LOG_TYPE_ERROR, "%{public}s::%d:ssid nil", buf, 0x12u);
    }

    v78 = 0;
  }

  return v78;
}

- (void)appendJoinsSummaryToMetric:(id)a3 ssid:(id)a4 maxAgeInDays:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
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
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  unint64_t v44;
  void *v45;
  void *v46;
  unint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  unint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  unint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  const char *v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  void *v64;
  DeploymentMetricHandler *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *context;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  _QWORD v77[3];
  _QWORD v78[3];
  _QWORD v79[2];
  _QWORD v80[3];
  _QWORD v81[3];
  _QWORD v82[2];
  _QWORD v83[2];
  uint8_t buf[4];
  const char *v85;
  __int16 v86;
  int v87;
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    WALogCategoryDefaultHandle();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v85 = "-[DeploymentMetricHandler appendJoinsSummaryToMetric:ssid:maxAgeInDays:]";
      v86 = 1024;
      v87 = 505;
      v60 = "%{public}s::%d:ssid nil";
LABEL_9:
      _os_log_impl(&dword_212581000, v59, OS_LOG_TYPE_ERROR, v60, buf, 0x12u);
    }
LABEL_10:

    goto LABEL_4;
  }
  if (!v8)
  {
    WALogCategoryDefaultHandle();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v85 = "-[DeploymentMetricHandler appendJoinsSummaryToMetric:ssid:maxAgeInDays:]";
      v86 = 1024;
      v87 = 506;
      v60 = "%{public}s::%d:dict nil";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  context = (void *)MEMORY[0x212BEF45C]();
  +[JoinMO entityName](JoinMO, "entityName");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD14C0];
  v68 = v8;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("bss.network.ssid == %@"), v9);
  v72 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v83[0] = v11;
  +[AnalyticsStoreProxy predicateForEntityWithAge:maxAge:](AnalyticsStoreProxy, "predicateForEntityWithAge:maxAge:", v66, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");
  v83[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v83, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "andPredicateWithSubpredicates:", v14);
  v65 = self;
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("reason == %d"), 1);
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("reason == %d"), 0);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "predicateWithFormat:", CFSTR("success == %@"), v18);
  v19 = objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "predicateWithFormat:", CFSTR("success == %@"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)MEMORY[0x24BDD14C0];
  v82[0] = v15;
  v82[1] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v82, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "andPredicateWithSubpredicates:", v24);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)MEMORY[0x24BDD14C0];
  v81[0] = v15;
  v81[1] = v19;
  v69 = (void *)v19;
  v70 = (void *)v16;
  v81[2] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v81, 3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "andPredicateWithSubpredicates:", v26);
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = (void *)MEMORY[0x24BDD14C0];
  v80[0] = v15;
  v80[1] = v22;
  v80[2] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v80, 3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "andPredicateWithSubpredicates:", v28);
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = (void *)MEMORY[0x24BDD14C0];
  v79[0] = v15;
  v79[1] = v75;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v79, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "andPredicateWithSubpredicates:", v30);
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = (void *)MEMORY[0x24BDD14C0];
  v78[0] = v15;
  v78[1] = v19;
  v78[2] = v75;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v78, 3);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "andPredicateWithSubpredicates:", v32);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = (void *)MEMORY[0x24BDD14C0];
  v77[0] = v15;
  v77[1] = v22;
  v77[2] = v75;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v77, 3);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "andPredicateWithSubpredicates:", v34);
  v35 = objc_claimAutoreleasedReturnValue();

  -[DeploymentMetricHandler storeMOHandler](v65, "storeMOHandler");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "managedObjectContext");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = +[AnalyticsStoreProxy entityCount:withPredicate:moc:](AnalyticsStoreProxy, "entityCount:withPredicate:moc:", v66, v67, v37);

  -[DeploymentMetricHandler storeMOHandler](v65, "storeMOHandler");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "managedObjectContext");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = +[AnalyticsStoreProxy entityCount:withPredicate:moc:](AnalyticsStoreProxy, "entityCount:withPredicate:moc:", v66, v73, v39);

  -[DeploymentMetricHandler storeMOHandler](v65, "storeMOHandler");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "managedObjectContext");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = +[AnalyticsStoreProxy entityCount:withPredicate:moc:](AnalyticsStoreProxy, "entityCount:withPredicate:moc:", v66, v76, v41);

  -[DeploymentMetricHandler storeMOHandler](v65, "storeMOHandler");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "managedObjectContext");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = +[AnalyticsStoreProxy entityCount:withPredicate:moc:](AnalyticsStoreProxy, "entityCount:withPredicate:moc:", v66, v74, v43);

  -[DeploymentMetricHandler storeMOHandler](v65, "storeMOHandler");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "managedObjectContext");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = +[AnalyticsStoreProxy entityCount:withPredicate:moc:](AnalyticsStoreProxy, "entityCount:withPredicate:moc:", v66, v64, v46);

  -[DeploymentMetricHandler storeMOHandler](v65, "storeMOHandler");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "managedObjectContext");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)v35;
  v51 = +[AnalyticsStoreProxy entityCount:withPredicate:moc:](AnalyticsStoreProxy, "entityCount:withPredicate:moc:", v66, v35, v49);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v63);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v68;
  objc_msgSend(v68, "setObject:forKeyedSubscript:", v52, CFSTR("ManualJoinsAttempted"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v62);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setObject:forKeyedSubscript:", v53, CFSTR("ManualJoinsFailed"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v61);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setObject:forKeyedSubscript:", v54, CFSTR("ManualJoinsSuccess"));

  v55 = v44;
  v9 = v72;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setObject:forKeyedSubscript:", v56, CFSTR("AutoJoinsAttempted"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v47);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setObject:forKeyedSubscript:", v57, CFSTR("AutoJoinsFailed"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v51);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setObject:forKeyedSubscript:", v58, CFSTR("AutoJoinsSuccess"));

  objc_autoreleasePoolPop(context);
LABEL_4:

}

- (BOOL)appendBssAnalyticsToMetric:(id)a3 bssMo:(id)a4 maxAgeInDays:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  _BOOL8 v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  NSObject *v30;
  const char *v31;
  _BOOL8 v32;
  void *v33;
  void *v34;
  void *context;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8)
  {
    WALogCategoryDefaultHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v37 = "-[DeploymentMetricHandler appendBssAnalyticsToMetric:bssMo:maxAgeInDays:]";
      v38 = 1024;
      v39 = 565;
      v31 = "%{public}s::%d:metricDict nil";
LABEL_11:
      _os_log_impl(&dword_212581000, v30, OS_LOG_TYPE_ERROR, v31, buf, 0x12u);
    }
LABEL_12:

    v28 = 0;
    goto LABEL_6;
  }
  if (!v9)
  {
    WALogCategoryDefaultHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v37 = "-[DeploymentMetricHandler appendBssAnalyticsToMetric:bssMo:maxAgeInDays:]";
      v38 = 1024;
      v39 = 566;
      v31 = "%{public}s::%d:bssMo nil";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  context = (void *)MEMORY[0x212BEF45C]();
  objc_msgSend(v10, "network");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ssid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "bssid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[DeploymentMetricHandler leavesSummary:bssid:maxAgeInDays:](self, "leavesSummary:bssid:maxAgeInDays:", v12, v13, a5);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "bssid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[DeploymentMetricHandler roamsSummary:bssid:maxAgeInDays:](self, "roamsSummary:bssid:maxAgeInDays:", v12, v14, a5);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v10, "channel");
  v16 = v15 < 15;
  v32 = v15 > 14;
  objc_msgSend(v10, "bssid");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[DeploymentMetricHandler storeMOHandler](self, "storeMOHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "managedObjectContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = +[RoamMO dwellTimeInBand:bandIs24:bssid:maxAgeInDays:moc:](RoamMO, "dwellTimeInBand:bandIs24:bssid:maxAgeInDays:moc:", v12, v16, v17, a5, v19);

  objc_msgSend(v10, "parsedBeacon");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[DeploymentMetricHandler isInternalInstall](self, "isInternalInstall"))
  {
    objc_msgSend(v10, "bssid");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v22, CFSTR("Bssid"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v10, "isEdgeForJoin"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v23, CFSTR("IsEdgeForJoin"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v10, "isEdgeForLeave"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v24, CFSTR("IsEdgeForLeave"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", objc_msgSend(v10, "roamTriggerRssi"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v25, CFSTR("RoamTriggerRssi"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v20);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v26, CFSTR("DwellTime"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v32);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v27, CFSTR("Band"));

  objc_msgSend(v8, "addEntriesFromDictionary:", v34);
  objc_msgSend(v8, "addEntriesFromDictionary:", v33);
  objc_msgSend(v8, "addEntriesFromDictionary:", v21);

  objc_autoreleasePoolPop(context);
  v28 = 1;
LABEL_6:

  return v28;
}

- (AnalyticsStoreMOHandler)storeMOHandler
{
  return self->_storeMOHandler;
}

- (void)setStoreMOHandler:(id)a3
{
  objc_storeStrong((id *)&self->_storeMOHandler, a3);
}

- (BOOL)isInternalInstall
{
  return self->_isInternalInstall;
}

- (void)setIsInternalInstall:(BOOL)a3
{
  self->_isInternalInstall = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeMOHandler, 0);
}

@end
