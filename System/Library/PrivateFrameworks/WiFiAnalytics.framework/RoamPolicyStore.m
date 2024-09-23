@implementation RoamPolicyStore

- (RoamPolicyStore)initWithAnalyticsStore:(id)a3
{
  id v5;
  RoamPolicyStore *v6;
  RoamPolicyStore *v7;
  RoamPolicyStore *v8;
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
  v11.super_class = (Class)RoamPolicyStore;
  v6 = -[RoamPolicyStore init](&v11, sel_init);
  v7 = v6;
  if (!v6)
  {
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  objc_storeStrong((id *)&v6->_roamPolicyMOHandler, a3);
  if (!v7->_roamPolicyMOHandler)
  {
    WALogCategoryDefaultHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v13 = "-[RoamPolicyStore initWithAnalyticsStore:]";
      v14 = 1024;
      v15 = 97;
      _os_log_impl(&dword_212581000, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error getting _roamPolicyMOHandler", buf, 0x12u);
    }

    goto LABEL_7;
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (BOOL)isHomeEnvironment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x212BEF45C]();
  -[RoamPolicyStore roamPolicyMOHandler](self, "roamPolicyMOHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[NetworkMO getInstance:moc:](NetworkMO, "getInstance:moc:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    WALogCategoryDefaultHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 136446722;
      v13 = "-[RoamPolicyStore isHomeEnvironment:]";
      v14 = 1024;
      v15 = 112;
      v16 = 2112;
      v17 = v4;
      _os_log_impl(&dword_212581000, v10, OS_LOG_TYPE_ERROR, "%{public}s::%d:networkMO nil for ssid %@", (uint8_t *)&v12, 0x1Cu);
    }

    goto LABEL_7;
  }
  if ((objc_msgSend(v8, "isHome") & 1) == 0)
  {
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  v9 = 1;
LABEL_8:

  objc_autoreleasePoolPop(v5);
  return v9;
}

- (BOOL)isWorkEnvironment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x212BEF45C]();
  -[RoamPolicyStore roamPolicyMOHandler](self, "roamPolicyMOHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[NetworkMO getInstance:moc:](NetworkMO, "getInstance:moc:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    WALogCategoryDefaultHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 136446722;
      v13 = "-[RoamPolicyStore isWorkEnvironment:]";
      v14 = 1024;
      v15 = 126;
      v16 = 2112;
      v17 = v4;
      _os_log_impl(&dword_212581000, v10, OS_LOG_TYPE_ERROR, "%{public}s::%d:networkMO nil for ssid %@", (uint8_t *)&v12, 0x1Cu);
    }

    goto LABEL_7;
  }
  if ((objc_msgSend(v8, "isWork") & 1) == 0)
  {
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  v9 = 1;
LABEL_8:

  objc_autoreleasePoolPop(v5);
  return v9;
}

- (BOOL)isNetworkQualifiedForAdaptiveRoaming:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x212BEF45C]();
  -[RoamPolicyStore roamPolicyMOHandler](self, "roamPolicyMOHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[NetworkMO getInstance:moc:](NetworkMO, "getInstance:moc:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    WALogCategoryDefaultHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 136446722;
      v13 = "-[RoamPolicyStore isNetworkQualifiedForAdaptiveRoaming:]";
      v14 = 1024;
      v15 = 139;
      v16 = 2112;
      v17 = v4;
      _os_log_impl(&dword_212581000, v10, OS_LOG_TYPE_ERROR, "%{public}s::%d:networkMO nil for ssid %@", (uint8_t *)&v12, 0x1Cu);
    }

    goto LABEL_8;
  }
  if (objc_msgSend(v8, "numBSS") < 3 || objc_msgSend(v8, "numBSS") >= 10)
  {
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
  v9 = 1;
LABEL_9:

  objc_autoreleasePoolPop(v5);
  return v9;
}

- (BOOL)doWeHaveEnoughSamplesToBuildChanList:(unint64_t)a3 numRoamSamples:(unint64_t)a4
{
  unint64_t v4;

  v4 = a4 >> 1;
  if (!a4)
    v4 = 50;
  return v4 <= a3;
}

- (BOOL)doWeHaveEnoughSamplesToBuildRoamCache:(unint64_t)a3 numRoamSamples:(unint64_t)a4
{
  unint64_t v4;

  v4 = 100;
  if (a4)
    v4 = a4;
  return v4 <= a3;
}

- (BOOL)doWeHaveEnoughSamplesToDeriveRSSITrigger:(unint64_t)a3 numRoamSamples:(unint64_t)a4
{
  unint64_t v4;

  v4 = 100;
  if (a4)
    v4 = a4;
  return v4 <= a3;
}

- (BOOL)buildRoamPoliciesForNetwork:(id)a3 bssid:(id)a4 numRoamSamples:(unint64_t)a5 deploymentStatus:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  unint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  unint64_t v27;
  uint64_t *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  BOOL v33;
  NSObject *v34;
  NSObject *v36;
  id v37;
  void *v38;
  _QWORD v39[3];
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  unint64_t v45;
  __int16 v46;
  unint64_t v47;
  uint64_t v48;

  v6 = a6;
  v48 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  WALogCategoryDefaultHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "RoamingPolicies buildRoamPoliciesForNetwork", ", buf, 2u);
  }

  v13 = (void *)MEMORY[0x212BEF45C]();
  if (+[WAUtil isWildcardMacAddress:](WAUtil, "isWildcardMacAddress:", v11))
  {
    WALogCategoryDefaultHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v41 = "-[RoamPolicyStore buildRoamPoliciesForNetwork:bssid:numRoamSamples:deploymentStatus:]";
      v42 = 1024;
      v43 = 187;
      v44 = 2112;
      v45 = (unint64_t)v11;
      _os_log_impl(&dword_212581000, v21, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssid(%@) is the wildcard address!! bailing", buf, 0x1Cu);
    }
    goto LABEL_48;
  }
  if (a5)
    v14 = a5;
  else
    v14 = 100;
  if (v6)
  {
    WALogCategoryDefaultHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v41 = "-[RoamPolicyStore buildRoamPoliciesForNetwork:bssid:numRoamSamples:deploymentStatus:]";
      v42 = 1024;
      v43 = 196;
      v44 = 2048;
      v45 = 0;
      _os_log_impl(&dword_212581000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Deployment has changed, Accumulating more roam objects, CurCnt=%lu", buf, 0x1Cu);
    }

    WALogCategoryDefaultHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_signpost_enabled(v16))
      goto LABEL_30;
    *(_WORD *)buf = 0;
    goto LABEL_29;
  }
  v38 = v13;
  -[RoamPolicyStore roamPolicyMOHandler](self, "roamPolicyMOHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "managedObjectContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = +[RoamMO roamsCount:fetchLimit:moc:](RoamMO, "roamsCount:fetchLimit:moc:", v11, v14, v18);

  WALogCategoryDefaultHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (!v19)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v41 = "-[RoamPolicyStore buildRoamPoliciesForNetwork:bssid:numRoamSamples:deploymentStatus:]";
      v42 = 1024;
      v43 = 205;
      _os_log_impl(&dword_212581000, v21, OS_LOG_TYPE_ERROR, "%{public}s::%d:numRoamSamplesCollectedSoFar is 0", buf, 0x12u);
    }
    goto LABEL_48;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v41 = "-[RoamPolicyStore buildRoamPoliciesForNetwork:bssid:numRoamSamples:deploymentStatus:]";
    v42 = 1024;
    v43 = 208;
    v44 = 2048;
    v45 = v14;
    v46 = 2048;
    v47 = v19;
    _os_log_impl(&dword_212581000, v21, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Building Roam Policies: NumRoamSamples to collect = %lu numRoamSamplesCollectedSoFar = %lu", buf, 0x26u);
  }

  if (!-[RoamPolicyStore doWeHaveEnoughSamplesToBuildChanList:numRoamSamples:](self, "doWeHaveEnoughSamplesToBuildChanList:numRoamSamples:", v19, a5))
  {
    WALogCategoryDefaultHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v41 = "-[RoamPolicyStore buildRoamPoliciesForNetwork:bssid:numRoamSamples:deploymentStatus:]";
      v42 = 1024;
      v43 = 231;
      v44 = 2048;
      v45 = v19;
      _os_log_impl(&dword_212581000, v32, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Not enough samples to run the show for Adaptive roaming, Bail out. RoamSamplesCollectedSoFar %lu", buf, 0x1Cu);
    }

    WALogCategoryDefaultHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_signpost_enabled(v16))
      goto LABEL_30;
    *(_WORD *)buf = 0;
    goto LABEL_29;
  }
  v37 = v10;
  v21 = objc_opt_new();
  v39[0] = CFSTR("target.bssid");
  v39[1] = CFSTR("target.channel");
  v39[2] = CFSTR("target.channelFlags");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[RoamPolicyStore roamPolicyMOHandler](self, "roamPolicyMOHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "managedObjectContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[RoamMO fetchRoamProperties:lookForRoamStatus:fetchLimit:properties:moc:](RoamMO, "fetchRoamProperties:lookForRoamStatus:fetchLimit:properties:moc:", v11, 0, v19, v22, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
  {
    WALogCategoryDefaultHandle();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v41 = "-[RoamPolicyStore buildRoamPoliciesForNetwork:bssid:numRoamSamples:deploymentStatus:]";
      v42 = 1024;
      v43 = 220;
      v44 = 2112;
      v45 = (unint64_t)v11;
      _os_log_impl(&dword_212581000, v36, OS_LOG_TYPE_ERROR, "%{public}s::%d:fetchRoamProperties returned nil for %@", buf, 0x1Cu);
    }
    goto LABEL_47;
  }
  objc_msgSend((id)objc_opt_class(), "extractChannelList:channelKeyPath:channelFlagsKeyPath:logFor:", v25, CFSTR("target.channel"), CFSTR("target.channelFlags"), "-[RoamPolicyStore buildRoamPoliciesForNetwork:bssid:numRoamSamples:deploymentStatus:]");
  v26 = objc_claimAutoreleasedReturnValue();

  if (!-[NSObject count](v26, "count"))
  {
    WALogCategoryDefaultHandle();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v41 = "-[RoamPolicyStore buildRoamPoliciesForNetwork:bssid:numRoamSamples:deploymentStatus:]";
      v42 = 1024;
      v43 = 226;
      _os_log_impl(&dword_212581000, v36, OS_LOG_TYPE_ERROR, "%{public}s::%d:resultChannelList empty", buf, 0x12u);
    }
    v21 = v26;
LABEL_47:
    v13 = v38;

    v10 = v37;
LABEL_48:

    WALogCategoryDefaultHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_signpost_enabled(v16))
      goto LABEL_30;
    *(_WORD *)buf = 0;
LABEL_29:
    _os_signpost_emit_with_name_impl(&dword_212581000, v16, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "RoamingPolicies buildRoamPoliciesForNetwork", "No", buf, 2u);
LABEL_30:
    v33 = 0;
    goto LABEL_36;
  }
  -[RoamPolicyStore updateNeighborChannelsFromRoamTargetsChannels:bssid:ssid:](self, "updateNeighborChannelsFromRoamTargetsChannels:bssid:ssid:", v26, v11, v37);

  if (-[RoamPolicyStore doWeHaveEnoughSamplesToDeriveRSSITrigger:numRoamSamples:](self, "doWeHaveEnoughSamplesToDeriveRSSITrigger:numRoamSamples:", v19, a5))
  {
    -[RoamPolicyStore deriveRoamInfo:ssid:numRoamSamplesCollectedSoFar:](self, "deriveRoamInfo:ssid:numRoamSamplesCollectedSoFar:", v11, v37, v19);
    v16 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject count](v16, "count"))
    {
      v27 = 0;
      v28 = &qword_254B53F28;
      do
      {
        -[NSObject objectAtIndex:](v16, "objectAtIndex:", v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        WALogCategoryDefaultHandle();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          v31 = *v28;
          *(_DWORD *)buf = 136446978;
          v41 = "-[RoamPolicyStore buildRoamPoliciesForNetwork:bssid:numRoamSamples:deploymentStatus:]";
          v42 = 1024;
          v43 = 245;
          v44 = 2112;
          v45 = (unint64_t)v29;
          v46 = 2048;
          v47 = v31;
          _os_log_impl(&dword_212581000, v30, OS_LOG_TYPE_DEFAULT, "%{public}s::%d: BSSID: %@ Occurences: %ld", buf, 0x26u);
        }

        ++v27;
        v28 += 44;
      }
      while (v27 < -[NSObject count](v16, "count"));
      v10 = v37;
      goto LABEL_33;
    }
  }
  else
  {
    v16 = 0;
  }
  v10 = v37;
LABEL_33:
  WALogCategoryDefaultHandle();
  v34 = objc_claimAutoreleasedReturnValue();
  v13 = v38;
  if (os_signpost_enabled(v34))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v34, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "RoamingPolicies buildRoamPoliciesForNetwork", ", buf, 2u);
  }

  v33 = 1;
LABEL_36:

  objc_autoreleasePoolPop(v13);
  return v33;
}

- (void)updateNeighborChannelsFromRoamTargetsChannels:(id)a3 bssid:(id)a4 ssid:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  int v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x212BEF45C]();
  if (!v8)
  {
    WALogCategoryDefaultHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v20 = 136446466;
    v21 = "-[RoamPolicyStore updateNeighborChannelsFromRoamTargetsChannels:bssid:ssid:]";
    v22 = 1024;
    v23 = 275;
    v17 = "%{public}s::%d:targetChannels nil";
    goto LABEL_12;
  }
  if (!objc_msgSend(v8, "count"))
  {
    WALogCategoryDefaultHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v20 = 136446466;
    v21 = "-[RoamPolicyStore updateNeighborChannelsFromRoamTargetsChannels:bssid:ssid:]";
    v22 = 1024;
    v23 = 276;
    v17 = "%{public}s::%d:targetChannels is empty";
LABEL_12:
    v18 = v14;
    v19 = 18;
    goto LABEL_15;
  }
  -[RoamPolicyStore roamPolicyMOHandler](self, "roamPolicyMOHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "managedObjectContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[BSSMO getInstance:ssid:moc:](BSSMO, "getInstance:ssid:moc:", v9, v10, v13);
  v14 = objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    WALogCategoryDefaultHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v20 = 136446978;
    v21 = "-[RoamPolicyStore updateNeighborChannelsFromRoamTargetsChannels:bssid:ssid:]";
    v22 = 1024;
    v23 = 280;
    v24 = 2112;
    v25 = v10;
    v26 = 2112;
    v27 = v9;
    v17 = "%{public}s::%d:bssMO nil for %@[%@]";
    v18 = v14;
    v19 = 38;
LABEL_15:
    _os_log_impl(&dword_212581000, v18, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v20, v19);
    goto LABEL_7;
  }
  -[NSObject setNeighborChannels:](v14, "setNeighborChannels:", v8);
  WALogCategoryDefaultHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v20 = 136447234;
    v21 = "-[RoamPolicyStore updateNeighborChannelsFromRoamTargetsChannels:bssid:ssid:]";
    v22 = 1024;
    v23 = 284;
    v24 = 2112;
    v25 = v9;
    v26 = 2112;
    v27 = v10;
    v28 = 2112;
    v29 = v8;
    _os_log_impl(&dword_212581000, v15, OS_LOG_TYPE_DEBUG, "%{public}s::%d:[BSS:%@ SSID:%@] Updated neighborChannels: %@", (uint8_t *)&v20, 0x30u);
  }

  -[RoamPolicyStore roamPolicyMOHandler](self, "roamPolicyMOHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "updateManagedObjectContextWithoutSave");

LABEL_7:
  objc_autoreleasePoolPop(v11);

}

- (id)deriveRoamInfo:(id)a3 ssid:(id)a4 numRoamSamplesCollectedSoFar:(unint64_t)a5
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  size_t v26;
  uint64_t v27;
  _QWORD *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  unint64_t v41;
  uint64_t *v42;
  NSObject *v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  unint64_t v53;
  NSObject *v54;
  NSObject *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  id v60;
  NSObject *v62;
  NSObject *v63;
  __int128 v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v78;
  uint8_t buf[4];
  const char *v81;
  __int16 v82;
  int v83;
  __int16 v84;
  size_t v85;
  __int16 v86;
  uint64_t v87;
  __int16 v88;
  unint64_t v89;
  _QWORD v90[8];

  v90[6] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  WALogCategoryDefaultHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "RoamingPolicies deriveRoamInfo:ssid:numRoamSamplesCollectedSoFar:", ", buf, 2u);
  }

  v9 = (void *)MEMORY[0x212BEF45C]();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  bzero(&roamInfo, 0xDC0uLL);
  -[RoamPolicyStore roamPolicyMOHandler](self, "roamPolicyMOHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "managedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[BSSMO getInstance:ssid:moc:](BSSMO, "getInstance:ssid:moc:", v6, v7, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v90[0] = CFSTR("target.bssid");
  v90[1] = CFSTR("fwReason");
  v90[2] = CFSTR("sourceRssi");
  v90[3] = CFSTR("sourceTimeSpentSecs");
  v90[4] = CFSTR("motionState");
  v90[5] = CFSTR("date");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v90, 6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[RoamPolicyStore roamPolicyMOHandler](self, "roamPolicyMOHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "managedObjectContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[RoamMO fetchRoamProperties:lookForRoamStatus:fetchLimit:properties:moc:](RoamMO, "fetchRoamProperties:lookForRoamStatus:fetchLimit:properties:moc:", v6, 1, a5, v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = v17;
  if (!v17)
  {
    WALogCategoryDefaultHandle();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v81 = "-[RoamPolicyStore deriveRoamInfo:ssid:numRoamSamplesCollectedSoFar:]";
      v82 = 1024;
      v83 = 323;
      v84 = 2112;
      v85 = (size_t)v6;
      _os_log_impl(&dword_212581000, v43, OS_LOG_TYPE_ERROR, "%{public}s::%d:fetchRoamProperties returned nil for bssid:%@", buf, 0x1Cu);
    }
LABEL_63:

    WALogCategoryDefaultHandle();
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v63))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_212581000, v63, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "RoamingPolicies deriveRoamInfo:ssid:numRoamSamplesCollectedSoFar:", "failed", buf, 2u);
    }

    v60 = 0;
    goto LABEL_59;
  }
  v65 = v14;
  v66 = v13;
  v67 = v9;
  v68 = v7;
  v69 = v6;
  v74 = v10;
  v70 = v17;
  if (objc_msgSend(v17, "count"))
  {
    v20 = 0;
    v21 = 0;
    *(_QWORD *)&v19 = 136446722;
    v64 = v19;
    v22 = 0x24BDD1000uLL;
    while (1)
    {
      objc_msgSend(v18, "objectAtIndex:", v20, v64);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "valueForKey:", CFSTR("target.bssid"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
        break;
LABEL_26:

      if (++v20 >= (unint64_t)objc_msgSend(v18, "count"))
        goto LABEL_31;
    }
    v73 = v20;
    if (v21 <= 9)
    {
      if ((objc_msgSend(v10, "containsObject:", v24) & 1) != 0)
      {
        if (!v21)
        {
LABEL_25:
          v20 = v73;
          goto LABEL_26;
        }
      }
      else
      {
        objc_msgSend(v10, "addObject:", v24);
        v25 = (const char *)objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
        v26 = strlen(v25);
        if (v26 >= 0x14)
        {
          WALogCategoryDefaultHandle();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v64;
            v81 = "-[RoamPolicyStore deriveRoamInfo:ssid:numRoamSamplesCollectedSoFar:]";
            v82 = 1024;
            v83 = 340;
            v84 = 2048;
            v85 = v26;
            _os_log_impl(&dword_212581000, v38, OS_LOG_TYPE_ERROR, "%{public}s::%d:Length exceeded limit:%lu", buf, 0x1Cu);
          }

          goto LABEL_25;
        }
        memcpy((char *)&roamInfo + 352 * v21++, v25, v26);
      }
    }
    v27 = 0;
    v28 = &roamInfo;
    v76 = v24;
    do
    {
      objc_msgSend(*(id *)(v22 + 1992), "stringWithUTF8String:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v24, "isEqual:", v29))
      {
        objc_msgSend(v23, "valueForKey:", CFSTR("fwReason"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "unsignedIntegerValue");

        objc_msgSend(v23, "valueForKey:", CFSTR("sourceRssi"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = objc_msgSend(v32, "integerValue");

        objc_msgSend(v23, "valueForKey:", CFSTR("sourceTimeSpentSecs"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "unsignedIntegerValue");

        objc_msgSend(v23, "valueForKey:", CFSTR("motionState"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "integerValue");

        objc_msgSend(v23, "valueForKey:", CFSTR("date"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        ++v28[39];
        -[RoamPolicyStore listOutMostUsedRoamReasons:roamReason:](self, "listOutMostUsedRoamReasons:roamReason:", v27, v31);
        -[RoamPolicyStore listOutTimeSpentOnBss:timeSpentOnBss:motionState:](self, "listOutTimeSpentOnBss:timeSpentOnBss:motionState:", v27, v34, v36);
        -[RoamPolicyStore checkForFrequentRoams:date:motionState:](self, "checkForFrequentRoams:date:motionState:", v27, v37, v36);
        switch(v31)
        {
          case 0xE0820C01:
            -[RoamPolicyStore listOutMostUsedSourceRssi:neighborCount:sourceRssi:](self, "listOutMostUsedSourceRssi:neighborCount:sourceRssi:", v75, v27, v78);
            break;
          case 0xE0820C02:
          case 0xE0820C03:
            -[RoamPolicyStore listOutLinkLossSuppressionRoams:](self, "listOutLinkLossSuppressionRoams:", v27);
            break;
          case 0xE0820C04:
          case 0xE0820C05:
          case 0xE0820C07:
          case 0xE0820C09:
          case 0xE0820C0A:
            break;
          case 0xE0820C06:
          case 0xE0820C0B:
            -[RoamPolicyStore listOutBTMRoams:](self, "listOutBTMRoams:", v27);
            break;
          case 0xE0820C08:
            -[RoamPolicyStore listOutLazyRoamScanInfo:neighborCount:sourceRssi:](self, "listOutLazyRoamScanInfo:neighborCount:sourceRssi:", v72, v27, v78);
            break;
          default:
            if ((_DWORD)v31 == -528348141)
              -[RoamPolicyStore listOutReassocRoams:neighborCount:sourceRssi:](self, "listOutReassocRoams:neighborCount:sourceRssi:", v71, v27, v78);
            break;
        }

        v22 = 0x24BDD1000;
        v24 = v76;
      }

      ++v27;
      v28 += 44;
    }
    while (v21 != v27);
    v10 = v74;
    v18 = v70;
    goto LABEL_25;
  }
LABEL_31:
  WALogCategoryDefaultHandle();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v81 = "-[RoamPolicyStore deriveRoamInfo:ssid:numRoamSamplesCollectedSoFar:]";
    v82 = 1024;
    v83 = 406;
    v84 = 2112;
    v85 = (size_t)v69;
    _os_log_impl(&dword_212581000, v39, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Neighbors of BSS %@:", buf, 0x1Cu);
  }

  if (objc_msgSend(v10, "count"))
  {
    v40 = v10;
    v41 = 0;
    v42 = &qword_254B53F28;
    while (1)
    {
      objc_msgSend(v40, "objectAtIndex:", v41);
      v43 = objc_claimAutoreleasedReturnValue();
      WALogCategoryDefaultHandle();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        v45 = *v42;
        *(_DWORD *)buf = 136446978;
        v81 = "-[RoamPolicyStore deriveRoamInfo:ssid:numRoamSamplesCollectedSoFar:]";
        v82 = 1024;
        v83 = 409;
        v84 = 2112;
        v85 = (size_t)v43;
        v86 = 2048;
        v87 = v45;
        _os_log_impl(&dword_212581000, v44, OS_LOG_TYPE_DEFAULT, "%{public}s::%d: BSSID: %@ Occurences: %ld", buf, 0x26u);
      }

      if (*v42 <= 19 && !self->_roamPolicyMOHandler)
        break;

      ++v41;
      v40 = v74;
      v42 += 44;
      if (v41 >= objc_msgSend(v74, "count"))
        goto LABEL_40;
    }
    WALogCategoryDefaultHandle();
    v62 = objc_claimAutoreleasedReturnValue();
    v6 = v69;
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v81 = "-[RoamPolicyStore deriveRoamInfo:ssid:numRoamSamplesCollectedSoFar:]";
      v82 = 1024;
      v83 = 411;
      v84 = 2112;
      v85 = (size_t)v43;
      _os_log_impl(&dword_212581000, v62, OS_LOG_TYPE_ERROR, "%{public}s::%d:Not enough roam samples with %@", buf, 0x1Cu);
    }

    v9 = v67;
    v7 = v68;
    v10 = v74;
    v14 = v65;
    v13 = v66;
    v18 = v70;
    goto LABEL_63;
  }
LABEL_40:
  v46 = v75;
  v47 = objc_msgSend(v75, "count");
  if (v47)
  {
    v48 = v47;
    while (1)
    {
      objc_msgSend(v46, "valueForKeyPath:", CFSTR("@max.self"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = (int)objc_msgSend(v49, "intValue");

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD14E0]), "initWithArray:", v46);
      v53 = objc_msgSend(v52, "countForObject:", v51);
      if (v50 <= -77)
        v50 = -77;
      WALogCategoryDefaultHandle();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136447234;
        v81 = "-[RoamPolicyStore deriveRoamInfo:ssid:numRoamSamplesCollectedSoFar:]";
        v82 = 1024;
        v83 = 429;
        v84 = 2048;
        v85 = v48;
        v86 = 2048;
        v87 = v50;
        v88 = 2048;
        v89 = v53;
        _os_log_impl(&dword_212581000, v54, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:RssiObjects =%ld RSSI value =%ld numOccurances =%lu", buf, 0x30u);
      }

      if (v53 > (unint64_t)(((((unint64_t)(5 * v48) >> 1) & 0x3FFFFFFFFFFFFFFFLL)
                                   * (unsigned __int128)0x28F5C28F5C28F5C3uLL) >> 64) >> 2)
        break;
      v46 = v75;
      objc_msgSend(v75, "removeObject:", v51);
      v48 = objc_msgSend(v75, "count");

      if (!v48)
        goto LABEL_54;
    }
    WALogCategoryDefaultHandle();
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136447234;
      v81 = "-[RoamPolicyStore deriveRoamInfo:ssid:numRoamSamplesCollectedSoFar:]";
      v82 = 1024;
      v83 = 432;
      v84 = 2048;
      v85 = v48;
      v86 = 2048;
      v87 = v50;
      v88 = 2048;
      v89 = v53;
      _os_log_impl(&dword_212581000, v55, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:RssiObjects =%ld Best RSSI value =%ld numOccurances =%lu", buf, 0x30u);
    }

    if (v48 == 1)
      v50 = -70;
  }
  else
  {
    v50 = -128;
  }
LABEL_54:
  WALogCategoryDefaultHandle();
  v56 = objc_claimAutoreleasedReturnValue();
  v6 = v69;
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v81 = "-[RoamPolicyStore deriveRoamInfo:ssid:numRoamSamplesCollectedSoFar:]";
    v82 = 1024;
    v83 = 445;
    v84 = 2112;
    v85 = (size_t)v69;
    v86 = 2048;
    v87 = v50;
    _os_log_impl(&dword_212581000, v56, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:BSSID %@ Derived RSSI =%ld", buf, 0x26u);
  }

  v13 = v66;
  objc_msgSend(v66, "setRoamTriggerRssi:", (__int16)v50);
  v10 = v74;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v74);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setNeighborBSSIDs:", v57);

  -[RoamPolicyStore roamPolicyMOHandler](self, "roamPolicyMOHandler");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "updateManagedObjectContextWithoutSave");

  -[RoamPolicyStore storeNeighborsInfoLearningsFromRoamInfo:neighborCount:](self, "storeNeighborsInfoLearningsFromRoamInfo:neighborCount:", v66, objc_msgSend(v74, "count"));
  WALogCategoryDefaultHandle();
  v59 = objc_claimAutoreleasedReturnValue();
  v9 = v67;
  v7 = v68;
  v14 = v65;
  v18 = v70;
  if (os_signpost_enabled(v59))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v59, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "RoamingPolicies deriveRoamInfo:ssid:numRoamSamplesCollectedSoFar:", ", buf, 2u);
  }

  v60 = v74;
LABEL_59:

  objc_autoreleasePoolPop(v9);
  return v60;
}

- (void)listOutMostUsedRoamReasons:(unint64_t)a3 roamReason:(unint64_t)a4
{
  int v4;
  NSObject *v6;
  NSObject *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v4 = a4;
  v30 = *MEMORY[0x24BDAC8D0];
  switch(a4)
  {
    case 0xE0820C00:
      break;
    case 0xE0820C01:
      ++*((_QWORD *)&roamInfo + 44 * a3 + 3);
      break;
    case 0xE0820C02:
    case 0xE0820C03:
    case 0xE0820C13:
      ++*((_QWORD *)&roamInfo + 44 * a3 + 7);
      break;
    case 0xE0820C04:
    case 0xE0820C05:
      ++*((_QWORD *)&roamInfo + 44 * a3 + 6);
      break;
    case 0xE0820C06:
    case 0xE0820C0B:
      ++*((_QWORD *)&roamInfo + 44 * a3 + 4);
      break;
    case 0xE0820C07:
      ++*((_QWORD *)&roamInfo + 44 * a3 + 9);
      break;
    case 0xE0820C08:
      ++*((_QWORD *)&roamInfo + 44 * a3 + 5);
      break;
    case 0xE0820C09:
      ++*((_QWORD *)&roamInfo + 44 * a3 + 10);
      break;
    case 0xE0820C0A:
      ++*((_QWORD *)&roamInfo + 44 * a3 + 11);
      break;
    case 0xE0820C0C:
      ++*((_QWORD *)&roamInfo + 44 * a3 + 12);
      break;
    case 0xE0820C0D:
      ++*((_QWORD *)&roamInfo + 44 * a3 + 13);
      break;
    case 0xE0820C0E:
      ++*((_QWORD *)&roamInfo + 44 * a3 + 14);
      break;
    case 0xE0820C0F:
      ++*((_QWORD *)&roamInfo + 44 * a3 + 15);
      break;
    case 0xE0820C10:
      ++*((_QWORD *)&roamInfo + 44 * a3 + 16);
      break;
    case 0xE0820C11:
      ++*((_QWORD *)&roamInfo + 44 * a3 + 17);
      break;
    case 0xE0820C12:
      ++*((_QWORD *)&roamInfo + 44 * a3 + 18);
      break;
    default:
      WALogCategoryDefaultHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v14 = 136446722;
        v15 = "-[RoamPolicyStore listOutMostUsedRoamReasons:roamReason:]";
        v16 = 1024;
        v17 = 534;
        v18 = 1024;
        v19 = v4;
        _os_log_impl(&dword_212581000, v6, OS_LOG_TYPE_ERROR, "%{public}s::%d:This Roam reason %u is not categorized", (uint8_t *)&v14, 0x18u);
      }

      break;
  }
  WALogCategoryDefaultHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (_QWORD *)((char *)&roamInfo + 352 * a3);
    v10 = v8[6];
    v9 = v8[7];
    v11 = v8[3];
    v12 = v8[4];
    v13 = v8[5];
    v14 = 136448002;
    v15 = "-[RoamPolicyStore listOutMostUsedRoamReasons:roamReason:]";
    v16 = 1024;
    v17 = 538;
    v18 = 1024;
    v19 = v4;
    v20 = 2048;
    v21 = v11;
    v22 = 2048;
    v23 = v9;
    v24 = 2048;
    v25 = v10;
    v26 = 2048;
    v27 = v12;
    v28 = 2048;
    v29 = v13;
    _os_log_impl(&dword_212581000, v7, OS_LOG_TYPE_INFO, "%{public}s::%d:Roam Reason = %u, LowRSSI = %ld LinkLossSuppression = %ld BeaconsLost = %ld roamDueToBTM = %ld LazyRoamScan = %ld", (uint8_t *)&v14, 0x4Au);
  }

}

- (BOOL)inRange:(int64_t)a3 high:(int64_t)a4 value:(int64_t)a5
{
  return (a5 - a4) * (a5 - a3) < 1;
}

- (void)listOutMostUsedSourceRssi:(id)a3 neighborCount:(unint64_t)a4 sourceRssi:(int64_t)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  int v16;
  uint64_t v17;
  _QWORD *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD *v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = v8;
  if (a5 <= -70)
  {
    v28 = v8;
    v10 = 0;
    v11 = (char *)&roamInfo + 352 * a4;
    v12 = v11 + 200;
    v13 = v11 + 152;
    v30 = v11 + 184;
    v31 = v11 + 192;
    v29 = v11 + 176;
    v14 = v11 + 168;
    v15 = v11 + 160;
    v16 = -70;
    do
    {
      v17 = v16;
      v16 = roamOriginRssiLevels[v10 + 1];
      -[RoamPolicyStore inRange:high:value:](self, "inRange:high:value:", v17, v16, a5, v28);
      v18 = v13;
      switch(v10)
      {
        case 0:
          goto LABEL_10;
        case 1:
          v18 = v15;
          goto LABEL_10;
        case 2:
          v18 = v14;
          goto LABEL_10;
        case 3:
          v18 = v29;
          goto LABEL_10;
        case 4:
          v18 = v30;
          goto LABEL_10;
        case 5:
          v18 = v31;
          goto LABEL_10;
        case 6:
        case 7:
          v18 = v12;
LABEL_10:
          ++*v18;
          break;
        default:
          break;
      }
      ++v10;
    }
    while (v10 != 8);
    WALogCategoryDefaultHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = *v13;
      v21 = *v15;
      v22 = *v14;
      v23 = *v29;
      v24 = *v30;
      v25 = *v31;
      v26 = *v12;
      *(_DWORD *)buf = 136448514;
      v33 = "-[RoamPolicyStore listOutMostUsedSourceRssi:neighborCount:sourceRssi:]";
      v34 = 1024;
      v35 = 581;
      v36 = 2048;
      v37 = a5;
      v38 = 2048;
      v39 = v20;
      v40 = 2048;
      v41 = v21;
      v42 = 2048;
      v43 = v22;
      v44 = 2048;
      v45 = v23;
      v46 = 2048;
      v47 = v24;
      v48 = 2048;
      v49 = v25;
      v50 = 2048;
      v51 = v26;
      _os_log_impl(&dword_212581000, v19, OS_LOG_TYPE_INFO, "%{public}s::%d:Source RSSI %ld HighRSSI %ld UpperHigh %ld Optimum %ld UpperOptimim %ld Mid %ld UpperMid %ld Low %ld", buf, 0x62u);
    }

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a5);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v28;
    objc_msgSend(v28, "addObject:", v27);

  }
}

- (void)listOutTimeSpentOnBss:(unint64_t)a3 timeSpentOnBss:(unint64_t)a4 motionState:(int64_t)a5
{
  char *v7;
  NSObject *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  unint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (a4 > 0x14)
  {
    if (a4 > 0x3C)
    {
      if (a4 > 0x78)
      {
        if (a4 > 0x1F4)
        {
          if (a4 > 0x258)
            goto LABEL_13;
          v7 = (char *)&roamInfo + 352 * a3 + 288;
        }
        else
        {
          v7 = (char *)&roamInfo + 352 * a3 + 280;
        }
      }
      else
      {
        v7 = (char *)&roamInfo + 352 * a3 + 272;
      }
    }
    else
    {
      v7 = (char *)&roamInfo + 352 * a3 + 264;
    }
  }
  else
  {
    if (a5)
      goto LABEL_13;
    v7 = (char *)&roamInfo + 352 * a3 + 256;
  }
  ++*(_QWORD *)v7;
LABEL_13:
  WALogCategoryDefaultHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = (_QWORD *)((char *)&roamInfo + 352 * a3);
    v10 = v9[32];
    v11 = v9[33];
    v12 = v9[34];
    v13 = v9[35];
    v14 = v9[36];
    v15 = 136448002;
    v16 = "-[RoamPolicyStore listOutTimeSpentOnBss:timeSpentOnBss:motionState:]";
    v17 = 1024;
    v18 = 606;
    v19 = 2048;
    v20 = a4;
    v21 = 2048;
    v22 = v10;
    v23 = 2048;
    v24 = v11;
    v25 = 2048;
    v26 = v12;
    v27 = 2048;
    v28 = v13;
    v29 = 2048;
    v30 = v14;
    _os_log_impl(&dword_212581000, v8, OS_LOG_TYPE_DEBUG, "%{public}s::%d:TimeSpent in Seconds %ld numRoamDurLow %ld  numRoamDurUpperLow %ld numRoamDurMid %ld numRoamDurUpperMid %ld numRoamDurHigh %ld", (uint8_t *)&v15, 0x4Eu);
  }

}

- (id)collectRoamCandidates:(id)a3 roamSamplesToCollect:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[RoamPolicyStore roamPolicyMOHandler](self, "roamPolicyMOHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[RoamMO fetchRoamObjects:fetchLimit:moc:](RoamMO, "fetchRoamObjects:fetchLimit:moc:", v6, a4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)checkForFrequentRoams:(unint64_t)a3 date:(id)a4 motionState:(int64_t)a5
{
  uint64_t v7;
  char *v8;
  double *v9;
  uint64_t *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  NSObject *v16;
  int v17;
  NSObject *v18;
  int v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  double v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a4, "timeIntervalSinceReferenceDate");
  v8 = (char *)&roamInfo + 352 * a3;
  v9 = (double *)(v8 + 296);
  *((_QWORD *)v8 + 38) = v7;
  if ((unint64_t)a5 <= 1 && *v9 != 0.0)
  {
    v10 = (uint64_t *)(v8 + 304);
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", *v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", *((double *)v8 + 38));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", v12);
    v14 = v13;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    WALogCategoryDefaultHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v19 = 136447490;
      v20 = "-[RoamPolicyStore checkForFrequentRoams:date:motionState:]";
      v21 = 1024;
      v22 = 634;
      v23 = 2112;
      v24 = v15;
      v25 = 2112;
      v26 = v11;
      v27 = 2112;
      v28 = v12;
      v29 = 2048;
      v30 = v14;
      _os_log_impl(&dword_212581000, v16, OS_LOG_TYPE_INFO, "%{public}s::%d:BSS %@ PrevDate %@ newDate %@ Difference %f", (uint8_t *)&v19, 0x3Au);
    }

    v17 = checkForFrequentRoams_date_motionState__frequentRoamCount;
    if (v14 < 15.0)
      v17 = ++checkForFrequentRoams_date_motionState__frequentRoamCount;
    if (v17 >= 11)
    {
      WALogCategoryDefaultHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = 136446722;
        v20 = "-[RoamPolicyStore checkForFrequentRoams:date:motionState:]";
        v21 = 1024;
        v22 = 640;
        v23 = 2112;
        v24 = v15;
        _os_log_impl(&dword_212581000, v18, OS_LOG_TYPE_INFO, "%{public}s::%d:Frequent RoamCandidate %@", (uint8_t *)&v19, 0x1Cu);
      }

      checkForFrequentRoams_date_motionState__frequentRoamCount = 0;
    }

    v7 = *v10;
  }
  *(_QWORD *)v9 = v7;
}

- (void)listOutLazyRoamScanInfo:(id)a3 neighborCount:(unint64_t)a4 sourceRssi:(int64_t)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  int v16;
  uint64_t v17;
  _QWORD *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  const char *v35;
  NSObject *v36;
  os_log_type_t v37;
  uint32_t v38;
  void *v39;
  _QWORD *v40;
  _QWORD *v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  int64_t v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  uint64_t v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = v8;
  if (a5 && a5 >= -70)
  {
    v39 = v8;
    v10 = 0;
    v11 = (char *)&roamInfo + 352 * a4;
    v12 = v11 + 208;
    v40 = v11 + 240;
    v41 = v11 + 248;
    v13 = v11 + 232;
    v14 = v11 + 224;
    v15 = v11 + 216;
    v16 = -10;
    do
    {
      v17 = v16;
      v16 = lazyRoamOriginRssiLevels[v10 + 1];
      -[RoamPolicyStore inRange:high:value:](self, "inRange:high:value:", v17, v16, a5);
      v18 = v12;
      switch((int)v10)
      {
        case 0:
          goto LABEL_10;
        case 1:
          v18 = v15;
          goto LABEL_10;
        case 2:
          v18 = v14;
          goto LABEL_10;
        case 3:
          v18 = v13;
          goto LABEL_10;
        case 4:
          v18 = v40;
          goto LABEL_10;
        case 5:
          v18 = v41;
LABEL_10:
          ++*v18;
          break;
        default:
          break;
      }
      ++v10;
    }
    while (v10 != 6);
    WALogCategoryDefaultHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = *v12;
      v21 = *v15;
      v22 = *v14;
      v23 = *v13;
      v24 = *v40;
      v25 = *v41;
      *(_DWORD *)buf = 136448258;
      v43 = "-[RoamPolicyStore listOutLazyRoamScanInfo:neighborCount:sourceRssi:]";
      v44 = 1024;
      v45 = 680;
      v46 = 2048;
      v47 = a5;
      v48 = 2048;
      v49 = v20;
      v50 = 2048;
      v51 = v21;
      v52 = 2048;
      v53 = v22;
      v54 = 2048;
      v55 = v23;
      v56 = 2048;
      v57 = v24;
      v58 = 2048;
      v59 = v25;
      _os_log_impl(&dword_212581000, v19, OS_LOG_TYPE_INFO, "%{public}s::%d:Lazy Roam: Source RSSI %ld HighRSSI %ld UpperHigh %ld Optimum %ld UpperOptimim %ld Mid %ld UpperMid %ld", buf, 0x58u);
    }

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a5);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v39;
    objc_msgSend(v39, "addObject:", v26);

    v27 = *v12;
    v28 = *v15;
    v29 = *v14;
    v30 = *v13;
    v31 = *v40;
    v32 = *v41;
    WALogCategoryDefaultHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      if (v27 <= v28)
        v34 = v28;
      else
        v34 = v27;
      if (v34 <= v29)
        v34 = v29;
      if (v34 <= v30)
        v34 = v30;
      if (v34 <= v31)
        v34 = v31;
      if (v34 <= v32)
        v34 = v32;
      *(_DWORD *)buf = 136446722;
      v43 = "-[RoamPolicyStore listOutLazyRoamScanInfo:neighborCount:sourceRssi:]";
      v44 = 1024;
      v45 = 712;
      v46 = 2048;
      v47 = v34 & ~(v34 >> 63);
      v35 = "%{public}s::%d:Largest LazyRoam Bin is %ld\n";
      v36 = v33;
      v37 = OS_LOG_TYPE_INFO;
      v38 = 28;
      goto LABEL_29;
    }
  }
  else
  {
    WALogCategoryDefaultHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v43 = "-[RoamPolicyStore listOutLazyRoamScanInfo:neighborCount:sourceRssi:]";
      v44 = 1024;
      v45 = 651;
      v35 = "%{public}s::%d:Continue";
      v36 = v33;
      v37 = OS_LOG_TYPE_DEBUG;
      v38 = 18;
LABEL_29:
      _os_log_impl(&dword_212581000, v36, v37, v35, buf, v38);
    }
  }

}

- (void)listOutReassocRoams:(id)a3 neighborCount:(unint64_t)a4 sourceRssi:(int64_t)a5
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a3;
  objc_msgSend(v6, "numberWithInt:", a5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);

}

- (void)listOutBTMRoams:(unint64_t)a3
{
  char *v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = (char *)&roamInfo + 352 * a3;
  if (*((_QWORD *)v3 + 4) > 50 * a3 / 0x64)
  {
    WALogCategoryDefaultHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 136446722;
      v7 = "-[RoamPolicyStore listOutBTMRoams:]";
      v8 = 1024;
      v9 = 749;
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_212581000, v4, OS_LOG_TYPE_INFO, "%{public}s::%d:This BSS %@ Object experieces too many BTM's", (uint8_t *)&v6, 0x1Cu);

    }
  }
}

- (BOOL)monitorDeploymentChanges:(id)a3 ssid:(id)a4 roamStatus:(unint64_t)a5 originBssid:(id)a6 targetBssid:(id)a7
{
  id v11;
  id v12;
  _UNKNOWN **v13;
  _BOOL4 v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  NSObject *v39;
  _UNKNOWN **v40;
  RoamPolicyStore *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  unint64_t v63;
  int v64;
  NSObject *v65;
  NSObject *v66;
  char *v67;
  int v68;
  uint64_t v69;
  NSObject *v70;
  NSObject *v71;
  const char *v72;
  uint32_t v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
  void *v77;
  void *v78;
  void *v79;
  NSObject *v80;
  uint64_t v81;
  NSObject *v82;
  void *v83;
  char v84;
  void *v85;
  NSObject *v86;
  NSObject *v88;
  __int128 v89;
  NSObject *v90;
  uint64_t v91;
  id v92;
  id v93;
  void *v94;
  char v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  uint64_t v101;
  id v102;
  uint64_t v103;
  id obj;
  id v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  id v110;
  void *v111;
  void *v112;
  uint64_t v113;
  void *v114;
  id v115;
  void *v116;
  void *v117;
  _BYTE *v118;
  RoamPolicyStore *v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  _BYTE v132[128];
  uint8_t v133[128];
  uint8_t buf[4];
  const char *v135;
  __int16 v136;
  int v137;
  __int16 v138;
  id v139;
  __int16 v140;
  uint64_t v141;
  __int16 v142;
  unint64_t v143;
  __int16 v144;
  uint64_t v145;
  _BYTE v146[128];
  _QWORD v147[7];

  v147[4] = *MEMORY[0x24BDAC8D0];
  v92 = a3;
  v110 = a4;
  v11 = a6;
  v12 = a7;
  v91 = MEMORY[0x212BEF45C]();
  v13 = &off_24CDDB000;
  v94 = v11;
  if (+[WAUtil isWildcardMacAddress:](WAUtil, "isWildcardMacAddress:", v11))
  {
    WALogCategoryDefaultHandle();
    v86 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v135 = "-[RoamPolicyStore monitorDeploymentChanges:ssid:roamStatus:originBssid:targetBssid:]";
      v136 = 1024;
      v137 = 770;
      v138 = 2112;
      v139 = v11;
      _os_log_impl(&dword_212581000, v86, OS_LOG_TYPE_ERROR, "%{public}s::%d:originBSS(%@) is the wildcard address!! bailing", buf, 0x1Cu);
    }
    v44 = 0;
    v84 = 0;
    v83 = v12;
    goto LABEL_109;
  }
  v93 = v12;
  if (+[WAUtil isWildcardMacAddress:](WAUtil, "isWildcardMacAddress:", v12))
  {
    WALogCategoryDefaultHandle();
    v86 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v135 = "-[RoamPolicyStore monitorDeploymentChanges:ssid:roamStatus:originBssid:targetBssid:]";
      v136 = 1024;
      v137 = 771;
      v138 = 2112;
      v83 = v12;
      v139 = v12;
      _os_log_impl(&dword_212581000, v86, OS_LOG_TYPE_ERROR, "%{public}s::%d:targetBSS(%@) is the wildcard address!! bailing", buf, 0x1Cu);
      v44 = 0;
      v84 = 0;
    }
    else
    {
      v44 = 0;
      v84 = 0;
      v83 = v12;
    }
LABEL_109:
    v85 = (void *)v91;
LABEL_96:

    goto LABEL_99;
  }
  v14 = -[RoamPolicyStore isHomeEnvironment:](self, "isHomeEnvironment:", v110);
  WALogCategoryDefaultHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446722;
    v135 = "-[RoamPolicyStore monitorDeploymentChanges:ssid:roamStatus:originBssid:targetBssid:]";
    v136 = 1024;
    v137 = 776;
    v138 = 1024;
    LODWORD(v139) = v14;
    _os_log_impl(&dword_212581000, v15, OS_LOG_TYPE_DEBUG, "%{public}s::%d:isHome Network %d", buf, 0x18u);
  }

  v147[0] = CFSTR("neighborCache");
  v147[1] = CFSTR("cacheChannel");
  v147[2] = CFSTR("cacheChannelFlags");
  v147[3] = CFSTR("cacheRssiBin");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v147, 4);
  v16 = objc_claimAutoreleasedReturnValue();
  -[RoamPolicyStore roamPolicyMOHandler](self, "roamPolicyMOHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "managedObjectContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = v16;
  +[RoamMO fetchRoamProperties:lookForRoamStatus:fetchLimit:properties:moc:](RoamMO, "fetchRoamProperties:lookForRoamStatus:fetchLimit:properties:moc:", v94, 0, 100, v16, v18);
  v19 = objc_claimAutoreleasedReturnValue();

  v96 = (void *)v19;
  if (!v19)
  {
    WALogCategoryDefaultHandle();
    v88 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v135 = "-[RoamPolicyStore monitorDeploymentChanges:ssid:roamStatus:originBssid:targetBssid:]";
      v136 = 1024;
      v137 = 790;
      v138 = 2112;
      v139 = v94;
      _os_log_impl(&dword_212581000, v88, OS_LOG_TYPE_ERROR, "%{public}s::%d:fetchRoamProperties returned nil for originBSS:%@", buf, 0x1Cu);
    }

    v44 = 0;
    v84 = 0;
    v83 = v93;
    v86 = v90;
    v85 = (void *)v91;
    goto LABEL_96;
  }
  -[RoamPolicyStore roamPolicyMOHandler](self, "roamPolicyMOHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "managedObjectContext");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = +[RoamMO roamsCount:fetchLimit:moc:](RoamMO, "roamsCount:fetchLimit:moc:", v93, 100, v21);

  if (v22)
  {
    v130 = 0u;
    v131 = 0u;
    v128 = 0u;
    v129 = 0u;
    obj = v92;
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v128, v146, 16);
    if (v23)
    {
      v25 = v23;
      v116 = 0;
      v118 = 0;
      v95 = 0;
      v26 = *(_QWORD *)v129;
      *(_QWORD *)&v24 = 136446466;
      v89 = v24;
      v101 = *(_QWORD *)v129;
      v119 = self;
      while (2)
      {
        v27 = 0;
        v103 = v25;
        do
        {
          if (*(_QWORD *)v129 != v26)
            objc_enumerationMutation(obj);
          v28 = *(_QWORD *)(*((_QWORD *)&v128 + 1) + 8 * v27);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v106 = v27;
            objc_msgSend((id)objc_opt_class(), "cleanChannelFlagsIn:", v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "objectForKey:", CFSTR("bssid"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "objectForKey:", CFSTR("rssi"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "objectForKey:", CFSTR("roamDelta"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v113 = objc_msgSend(v31, "integerValue");
            v33 = objc_msgSend(v32, "integerValue");
            v34 = (void *)objc_opt_class();
            objc_msgSend(v29, "objectForKey:", CFSTR("channel"));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v35, "integerValue");
            objc_msgSend(v29, "objectForKey:", CFSTR("channelFlags"));
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "makeChanInfoFromChannel:andFlags:", v36, objc_msgSend(v37, "integerValue"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v13[107], "isWildcardMacAddress:", v30))
            {

              v26 = v101;
              v27 = v106;
            }
            else
            {
              v98 = v32;
              v99 = v31;
              v100 = v29;
              WALogCategoryDefaultHandle();
              v39 = objc_claimAutoreleasedReturnValue();
              v40 = &off_24CDDB000;
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136447490;
                v135 = "-[RoamPolicyStore monitorDeploymentChanges:ssid:roamStatus:originBssid:targetBssid:]";
                v136 = 1024;
                v137 = 819;
                v138 = 2112;
                v139 = v30;
                v140 = 2048;
                v141 = v113;
                v142 = 2112;
                v143 = (unint64_t)v38;
                v144 = 2048;
                v145 = v33;
                _os_log_impl(&dword_212581000, v39, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:currentCacheBssid  %@ currentRssi %ld currentChannel: %@ currentRoamDelta %ld", buf, 0x3Au);
              }
              v111 = v38;

              v41 = v119;
              -[RoamPolicyStore roamPolicyMOHandler](v119, "roamPolicyMOHandler");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "managedObjectContext");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              +[BSSMO getInstance:ssid:moc:](BSSMO, "getInstance:ssid:moc:", v30, v110, v43);
              v44 = (void *)objc_claimAutoreleasedReturnValue();

              if (v44)
              {
                objc_msgSend((id)objc_opt_class(), "makeChanInfoFromChannel:andFlags:", (int)objc_msgSend(v44, "channel"), (int)objc_msgSend(v44, "channelFlags"));
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                WALogCategoryDefaultHandle();
                v46 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136447234;
                  v135 = "-[RoamPolicyStore monitorDeploymentChanges:ssid:roamStatus:originBssid:targetBssid:]";
                  v136 = 1024;
                  v137 = 827;
                  v138 = 2112;
                  v139 = v30;
                  v140 = 2112;
                  v141 = (uint64_t)v110;
                  v142 = 2112;
                  v143 = (unint64_t)v45;
                  _os_log_impl(&dword_212581000, v46, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:MyChannel for bssid[%@] ssid[%@] : %@", buf, 0x30u);
                }

                if ((objc_msgSend(v45, "isEqualToDictionary:", v111) & 1) == 0)
                {
                  WALogCategoryDefaultHandle();
                  v47 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136447234;
                    v135 = "-[RoamPolicyStore monitorDeploymentChanges:ssid:roamStatus:originBssid:targetBssid:]";
                    v136 = 1024;
                    v137 = 830;
                    v138 = 2112;
                    v139 = v30;
                    v140 = 2112;
                    v141 = (uint64_t)v111;
                    v142 = 2112;
                    v143 = (unint64_t)v45;
                    _os_log_impl(&dword_212581000, v47, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Change in Channel for BSSID =%@, currentChannel = %@, bssChannel = %@", buf, 0x30u);
                  }

                  -[RoamPolicyStore updateNeighborChannelsInCoreDataWith:bssid:ssid:](v119, "updateNeighborChannelsInCoreDataWith:bssid:ssid:", v45, v30, v110);
                }
              }
              else
              {
                v45 = 0;
              }
              v126 = 0u;
              v127 = 0u;
              v124 = 0u;
              v125 = 0u;
              v105 = v96;
              v112 = v30;
              v107 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v124, v133, 16);
              if (v107)
              {
                v108 = *(_QWORD *)v125;
                v48 = v105;
                v97 = v44;
                v114 = v45;
                do
                {
                  v49 = 0;
                  do
                  {
                    if (*(_QWORD *)v125 != v108)
                    {
                      v50 = v49;
                      objc_enumerationMutation(v48);
                      v49 = v50;
                    }
                    v109 = v49;
                    v51 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * v49);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      objc_msgSend(v51, "valueForKey:", CFSTR("neighborCache"));
                      v52 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v52)
                      {
                        v122 = 0u;
                        v123 = 0u;
                        v120 = 0u;
                        v121 = 0u;
                        v102 = v52;
                        v115 = v52;
                        v53 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v120, v132, 16);
                        if (v53)
                        {
                          v54 = v53;
                          v55 = *(_QWORD *)v121;
                          while (2)
                          {
                            v56 = 0;
                            do
                            {
                              if (*(_QWORD *)v121 != v55)
                                objc_enumerationMutation(v115);
                              objc_msgSend(*(id *)(*((_QWORD *)&v120 + 1) + 8 * v56), "objectForKey:", CFSTR("bssid"), v89);
                              v57 = (void *)objc_claimAutoreleasedReturnValue();
                              if ((objc_msgSend(v13[107], "isWildcardMacAddress:", v57) & 1) == 0)
                              {
                                v58 = v40[96];
                                -[RoamPolicyStore roamPolicyMOHandler](v41, "roamPolicyMOHandler");
                                v59 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v59, "managedObjectContext");
                                v60 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v58, "fetchRoamObjects:fetchLimit:moc:", v57, 1, v60);
                                v61 = objc_claimAutoreleasedReturnValue();

                                if (!v61)
                                {
                                  WALogCategoryDefaultHandle();
                                  v61 = objc_claimAutoreleasedReturnValue();
                                  if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
                                  {
                                    *(_DWORD *)buf = v89;
                                    v135 = "-[RoamPolicyStore monitorDeploymentChanges:ssid:roamStatus:originBssid:targetBssid:]";
                                    v136 = 1024;
                                    v137 = 850;
                                    _os_log_impl(&dword_212581000, v61, OS_LOG_TYPE_ERROR, "%{public}s::%d:roamManagedObject is nil", buf, 0x12u);
                                  }
                                  v76 = 4;
LABEL_78:
                                  v77 = v100;
                                  v26 = v101;
                                  v27 = v106;
                                  v79 = v98;
                                  v78 = v99;

                                  v44 = v97;
                                  v45 = v114;
                                  goto LABEL_79;
                                }
                                -[NSObject objectAtIndex:](v61, "objectAtIndex:", 0);
                                v62 = (void *)objc_claimAutoreleasedReturnValue();
                                if (objc_msgSend(v62, "cacheChannel"))
                                {
                                  objc_msgSend((id)objc_opt_class(), "makeChanInfoFromChannel:andFlags:", (int)objc_msgSend(v62, "cacheChannel"), (int)objc_msgSend(v62, "cacheChannelFlags"));
                                  v117 = (void *)objc_claimAutoreleasedReturnValue();
                                  v63 = (int)objc_msgSend(v62, "cacheRssiBin");
                                  v64 = objc_msgSend(v62, "roamDelta");
                                  WALogCategoryDefaultHandle();
                                  v65 = objc_claimAutoreleasedReturnValue();
                                  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
                                  {
                                    *(_DWORD *)buf = 136447490;
                                    v135 = "-[RoamPolicyStore monitorDeploymentChanges:ssid:roamStatus:originBssid:targetBssid:]";
                                    v136 = 1024;
                                    v137 = 860;
                                    v138 = 2112;
                                    v139 = v57;
                                    v140 = 2048;
                                    v141 = v63;
                                    v142 = 2112;
                                    v143 = (unint64_t)v117;
                                    v144 = 2048;
                                    v145 = v64;
                                    _os_log_impl(&dword_212581000, v65, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:CacheBssid  %@ CacheRssiBin %ld CacheChannel %@ CacheRoamDelta %ld", buf, 0x3Au);
                                  }

                                  if (objc_msgSend(v112, "isEqualToString:", v57))
                                  {
                                    if (!objc_msgSend(v117, "isEqualToDictionary:", v111))
                                    {
                                      WALogCategoryDefaultHandle();
                                      v66 = objc_claimAutoreleasedReturnValue();
                                      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
                                      {
                                        *(_DWORD *)buf = 136447234;
                                        v135 = "-[RoamPolicyStore monitorDeploymentChanges:ssid:roamStatus:originBssid:targetBssid:]";
                                        v136 = 1024;
                                        v137 = 866;
                                        v138 = 2112;
                                        v139 = v57;
                                        v140 = 2112;
                                        v141 = (uint64_t)v117;
                                        v142 = 2112;
                                        v143 = (unint64_t)v114;
                                        _os_log_impl(&dword_212581000, v66, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Change in Channel for BSSID %@: CurrentCacheChannel = %@ cacheChannel = %@", buf, 0x30u);
                                      }

                                      -[RoamPolicyStore updateNeighborChannelsInCoreDataWith:bssid:ssid:](v119, "updateNeighborChannelsInCoreDataWith:bssid:ssid:", v111, v57, v110);
                                    }
                                    v67 = 0;
                                    v68 = -10;
                                    while (2)
                                    {
                                      v69 = v68;
                                      v68 = roamCacheRssiLevels[(_QWORD)v67 + 1];
                                      -[RoamPolicyStore inRange:high:value:](v119, "inRange:high:value:", v69, v68, v113);
                                      switch((unint64_t)v67)
                                      {
                                        case 0uLL:
                                        case 1uLL:
                                        case 2uLL:
                                        case 3uLL:
                                          v118 = v67;
                                          goto LABEL_50;
                                        case 4uLL:
                                          v118 = v67;
                                          goto LABEL_51;
                                        default:
LABEL_50:
                                          if (++v67 != (char *)5)
                                            continue;
LABEL_51:
                                          if (v118 == (_BYTE *)v63)
                                          {
                                            WALogCategoryDefaultHandle();
                                            v70 = objc_claimAutoreleasedReturnValue();
                                            if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
                                            {
                                              *(_DWORD *)buf = 136447234;
                                              v135 = "-[RoamPolicyStore monitorDeploymentChanges:ssid:roamStatus:originBs"
                                                     "sid:targetBssid:]";
                                              v136 = 1024;
                                              v137 = 893;
                                              v138 = 2112;
                                              v139 = v57;
                                              v140 = 2048;
                                              v141 = v63;
                                              v142 = 2048;
                                              v143 = v63;
                                              v71 = v70;
                                              v72 = "%{public}s::%d:No Change in location of the BSS = %@ CurrentRssiLeve"
                                                    "l = %lu cacheRssiBin = %ld";
                                              v73 = 48;
                                              goto LABEL_60;
                                            }
                                            goto LABEL_62;
                                          }
                                          v74 = v63 - (_QWORD)v118;
                                          if ((unint64_t)v118 > v63)
                                            v74 = (uint64_t)&v118[-v63];
                                          if (v74 >= 2)
                                          {
                                            WALogCategoryDefaultHandle();
                                            v80 = objc_claimAutoreleasedReturnValue();
                                            if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
                                            {
                                              *(_DWORD *)buf = 136447234;
                                              v135 = "-[RoamPolicyStore monitorDeploymentChanges:ssid:roamStatus:originBs"
                                                     "sid:targetBssid:]";
                                              v136 = 1024;
                                              v137 = 897;
                                              v138 = 2112;
                                              v139 = v57;
                                              v140 = 2048;
                                              v141 = (uint64_t)v118;
                                              v142 = 2112;
                                              v143 = (unint64_t)v117;
                                              _os_log_impl(&dword_212581000, v80, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Deployment Changed: Network %@ is signicantly moved in or an obstacle is taken out.CurrentRssiLevel = %lu cacheChannel = %@", buf, 0x30u);
                                            }

                                            v76 = 1;
                                            v95 = 1;
                                            v13 = &off_24CDDB000;
                                            goto LABEL_78;
                                          }
                                          v40 = &off_24CDDB000;
                                          if (v74 == 1)
                                          {
                                            WALogCategoryDefaultHandle();
                                            v70 = objc_claimAutoreleasedReturnValue();
                                            if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
                                            {
                                              *(_DWORD *)buf = 136446978;
                                              v135 = "-[RoamPolicyStore monitorDeploymentChanges:ssid:roamStatus:originBs"
                                                     "sid:targetBssid:]";
                                              v136 = 1024;
                                              v137 = 901;
                                              v138 = 2048;
                                              v63 = (unint64_t)v118;
                                              v139 = v118;
                                              v140 = 2112;
                                              v141 = (uint64_t)v117;
                                              v71 = v70;
                                              v72 = "%{public}s::%d:Deployment did Change but the change is not significa"
                                                    "nt, CurrentRssiLevel = %lu cacheChannel = %@";
                                              v73 = 38;
LABEL_60:
                                              _os_log_impl(&dword_212581000, v71, OS_LOG_TYPE_DEFAULT, v72, buf, v73);
                                            }
                                            else
                                            {
                                              v63 = (unint64_t)v118;
                                            }
LABEL_62:

                                            v118 = (_BYTE *)v63;
                                            goto LABEL_63;
                                          }
                                          break;
                                      }
                                      break;
                                    }
                                  }
                                  else
                                  {
LABEL_63:
                                    v40 = &off_24CDDB000;
                                  }

                                  v13 = &off_24CDDB000;
                                }

                                v45 = v114;
                                v41 = v119;
                              }

                              ++v56;
                            }
                            while (v56 != v54);
                            v75 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v120, v132, 16);
                            v54 = v75;
                            if (v75)
                              continue;
                            break;
                          }
                        }

                        v44 = v97;
                        v48 = v105;
                        v52 = v102;
                      }

                    }
                    v49 = v109 + 1;
                  }
                  while (v109 + 1 != v107);
                  v107 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v124, v133, 16);
                }
                while (v107);
              }
              v76 = 0;
              v77 = v100;
              v26 = v101;
              v27 = v106;
              v79 = v98;
              v78 = v99;
LABEL_79:

              if (v76)
              {

                if (v76 == 4)
                {
                  v83 = v93;
                  v85 = (void *)v91;
                  v84 = v95;
                  goto LABEL_99;
                }
                v84 = 1;
                v83 = v93;
                goto LABEL_98;
              }
              v116 = v44;
            }
            v25 = v103;
          }
          ++v27;
        }
        while (v27 != v25);
        v81 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v128, v146, 16);
        v25 = v81;
        if (v81)
          continue;
        break;
      }
    }
    else
    {
      v116 = 0;
      v95 = 0;
    }

    v44 = v116;
    v83 = v93;
    v86 = v90;
    v85 = (void *)v91;
    v84 = v95;
    goto LABEL_96;
  }
  WALogCategoryDefaultHandle();
  v82 = objc_claimAutoreleasedReturnValue();
  v83 = v93;
  if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v135 = "-[RoamPolicyStore monitorDeploymentChanges:ssid:roamStatus:originBssid:targetBssid:]";
    v136 = 1024;
    v137 = 796;
    v138 = 2112;
    v139 = v93;
    _os_log_impl(&dword_212581000, v82, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:New BSS  %@ Added to the deployment", buf, 0x1Cu);
  }

  v44 = 0;
  v84 = 1;
LABEL_98:
  v85 = (void *)v91;
LABEL_99:

  objc_autoreleasePoolPop(v85);
  return v84 & 1;
}

- (BOOL)buildRoamCacheInfoForNetwork:(id)a3 bssid:(id)a4 numRoamSamples:(unint64_t)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  RoamPolicyStore *v18;
  unint64_t v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  RoamPolicyStore *v26;
  uint64_t v27;
  uint64_t v28;
  RoamPolicyStore *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  char *v39;
  void *v40;
  char v41;
  const char *v42;
  size_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  void *v47;
  NSObject *v48;
  NSObject *v49;
  uint64_t v50;
  _QWORD *v51;
  RoamPolicyStore *v52;
  unint64_t v53;
  unint64_t v54;
  int v55;
  void *v56;
  unint64_t v57;
  unint64_t v58;
  void *v59;
  void *v60;
  unint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  RoamPolicyStore *v77;
  uint64_t v78;
  NSObject *v79;
  NSObject *v80;
  void *v81;
  void *v82;
  NSObject *v83;
  BOOL v84;
  NSObject *v86;
  NSObject *v87;
  const char *v88;
  NSObject *v89;
  uint32_t v90;
  _BOOL4 v91;
  NSObject *v92;
  void *v93;
  id v94;
  void *v95;
  void *v96;
  unint64_t v97;
  id v98;
  RoamPolicyStore *v99;
  void *v100;
  int v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  unsigned int v106;
  id obj;
  id obja;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  NSObject *v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  _BYTE v119[128];
  const __CFString *v120;
  uint8_t buf[4];
  const char *v122;
  __int16 v123;
  int v124;
  __int16 v125;
  size_t v126;
  uint64_t v127;

  v127 = *MEMORY[0x24BDAC8D0];
  v94 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x212BEF45C]();
  WALogCategoryDefaultHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "RoamingPolicies buildRoamCacheInfoForNetwork", ", buf, 2u);
  }

  if (+[WAUtil isWildcardMacAddress:](WAUtil, "isWildcardMacAddress:", v8))
  {
    WALogCategoryDefaultHandle();
    v87 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v122 = "-[RoamPolicyStore buildRoamCacheInfoForNetwork:bssid:numRoamSamples:]";
      v123 = 1024;
      v124 = 918;
      v125 = 2112;
      v126 = (size_t)v8;
      _os_log_impl(&dword_212581000, v87, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssid(%@) is the wildcard address!! bailing", buf, 0x1Cu);
    }
    goto LABEL_116;
  }
  v93 = v9;
  bzero(&roamCacheInfo, 0x410uLL);
  v120 = CFSTR("neighborCache");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v120, 1);
  v11 = objc_claimAutoreleasedReturnValue();
  v99 = self;
  -[RoamPolicyStore roamPolicyMOHandler](self, "roamPolicyMOHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "managedObjectContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = v11;
  +[RoamMO fetchRoamProperties:lookForRoamStatus:fetchLimit:properties:moc:](RoamMO, "fetchRoamProperties:lookForRoamStatus:fetchLimit:properties:moc:", v8, 0, 100, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v95 = v14;
  if (!v14)
  {
    WALogCategoryDefaultHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v122 = "-[RoamPolicyStore buildRoamCacheInfoForNetwork:bssid:numRoamSamples:]";
      v123 = 1024;
      v124 = 936;
      v125 = 2112;
      v126 = (size_t)v8;
      v88 = "%{public}s::%d:fetchRoamProperties returned nil for bssid:%@";
      v89 = v17;
      v90 = 28;
LABEL_113:
      _os_log_impl(&dword_212581000, v89, OS_LOG_TYPE_ERROR, v88, buf, v90);
    }
LABEL_114:
    v87 = v11;
    v9 = v93;
    goto LABEL_115;
  }
  v15 = objc_msgSend(v14, "count");
  WALogCategoryDefaultHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v122 = "-[RoamPolicyStore buildRoamCacheInfoForNetwork:bssid:numRoamSamples:]";
      v123 = 1024;
      v124 = 940;
      v88 = "%{public}s::%d:numRoamSamplesCollectedSoFar is 0";
      v89 = v17;
      v90 = 18;
      goto LABEL_113;
    }
    goto LABEL_114;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v122 = "-[RoamPolicyStore buildRoamCacheInfoForNetwork:bssid:numRoamSamples:]";
    v123 = 1024;
    v124 = 943;
    v125 = 2048;
    v126 = v15;
    _os_log_impl(&dword_212581000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Roam Cache Policy: numRoamSamplesCollectedSoFar =%lu", buf, 0x1Cu);
  }

  v18 = v99;
  v91 = -[RoamPolicyStore doWeHaveEnoughSamplesToBuildRoamCache:numRoamSamples:](v99, "doWeHaveEnoughSamplesToBuildRoamCache:numRoamSamples:", v15, a5);
  if (!v91)
  {
    WALogCategoryDefaultHandle();
    v79 = objc_claimAutoreleasedReturnValue();
    v80 = v11;
    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v122 = "-[RoamPolicyStore buildRoamCacheInfoForNetwork:bssid:numRoamSamples:]";
      v123 = 1024;
      v124 = 947;
      v125 = 2048;
      v126 = v15;
      _os_log_impl(&dword_212581000, v79, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Not enough samples to derive policies on RoamCache, Bail out. RoamSamplesCollectedSoFar %lu", buf, 0x1Cu);
    }
    v9 = v93;
    goto LABEL_102;
  }
  if (!objc_msgSend(v14, "count"))
  {
    v78 = 0;
    v77 = v99;
LABEL_97:
    -[RoamPolicyStore roamPolicyMOHandler](v77, "roamPolicyMOHandler");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "managedObjectContext");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    +[BSSMO getInstance:ssid:moc:](BSSMO, "getInstance:ssid:moc:", v8, v94, v82);
    v79 = objc_claimAutoreleasedReturnValue();

    if (v79)
      -[RoamPolicyStore storeNeighborsInfoLearningsFromRoamCacheInfo:neighborCount:](v77, "storeNeighborsInfoLearningsFromRoamCacheInfo:neighborCount:", v79, v78);
    WALogCategoryDefaultHandle();
    v83 = objc_claimAutoreleasedReturnValue();
    v9 = v93;
    if (os_signpost_enabled(v83))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_212581000, v83, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "RoamingPolicies buildRoamCacheInfoForNetwork", ", buf, 2u);
    }

    v80 = v92;
LABEL_102:
    v84 = v91;

    goto LABEL_103;
  }
  v101 = 0;
  v102 = 0;
  v19 = 0;
  v20 = v8;
  v98 = v8;
  do
  {
    objc_msgSend(v14, "objectAtIndex:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "valueForKey:", CFSTR("neighborCache"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v96 = v21;
      v97 = v19;
      objc_msgSend(MEMORY[0x24BDD16A8], "string");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v115 = 0u;
      v116 = 0u;
      v117 = 0u;
      v118 = 0u;
      obj = v22;
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v119, 16);
      if (!v23)
      {
        v26 = v18;
        goto LABEL_53;
      }
      v24 = v23;
      v25 = *(_QWORD *)v116;
      v26 = v18;
      v103 = *(_QWORD *)v116;
      v104 = v22;
      while (1)
      {
        v27 = 0;
        v105 = v24;
        do
        {
          if (*(_QWORD *)v116 != v25)
            objc_enumerationMutation(obj);
          v28 = *(_QWORD *)(*((_QWORD *)&v115 + 1) + 8 * v27);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v29 = v26;
            objc_msgSend((id)objc_opt_class(), "cleanChannelFlagsIn:", v28);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "objectForKey:", CFSTR("channel"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "objectForKey:", CFSTR("rssi"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "objectForKey:", CFSTR("bssid"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "objectForKey:", CFSTR("roamDelta"));
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            v113 = objc_msgSend(v31, "integerValue");
            objc_msgSend(v30, "objectForKey:", CFSTR("channelFlags"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v111 = objc_msgSend(v34, "integerValue");

            v35 = objc_msgSend(v32, "integerValue");
            if (v20)
            {
              v26 = v29;
              if (!v31)
                goto LABEL_46;
              if (!v32)
                goto LABEL_46;
              v36 = v35;
              if (+[WAUtil isWildcardMacAddress:](WAUtil, "isWildcardMacAddress:", v33))
                goto LABEL_46;
              objc_msgSend(v100, "appendFormat:", CFSTR(" {%@, %@, %@, %@} "), v33, v32, v31, v109);
              WALogCategoryDefaultHandle();
              v37 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136446722;
                v122 = "-[RoamPolicyStore buildRoamCacheInfoForNetwork:bssid:numRoamSamples:]";
                v123 = 1024;
                v124 = 980;
                v125 = 2112;
                v126 = (size_t)v100;
                _os_log_impl(&dword_212581000, v37, OS_LOG_TYPE_DEBUG, "%{public}s::%d:roamCacheStr:%@", buf, 0x1Cu);
              }

              v38 = v102;
              if (v102)
              {
                v39 = (char *)&roamCacheInfo;
                while (1)
                {
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v39);
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  v41 = objc_msgSend(v40, "isEqualToString:", v33);

                  if ((v41 & 1) != 0)
                    break;
                  v39 += 104;
                  if (!--v38)
                    goto LABEL_33;
                }
                v101 = 1;
                v44 = v102;
LABEL_36:
                v26 = v99;
                if (v44)
                {
                  v45 = 0;
                  v46 = &roamCacheInfo;
                  do
                  {
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v46);
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v33, "isEqual:", v47))
                    {
                      -[RoamPolicyStore locateTheNeighbor:cacheRssi:](v99, "locateTheNeighbor:cacheRssi:", v45, v36);
                      v46[8] = v113;
                      v46[9] = v111;
                    }

                    ++v45;
                    v46 += 13;
                  }
                  while (v44 != v45);
                  v102 = v44;
                  v20 = v98;
                  v26 = v99;
                }
                else
                {
                  v102 = 0;
                  v20 = v98;
                }
                goto LABEL_46;
              }
              if (!v101)
              {
LABEL_33:
                v42 = (const char *)objc_msgSend(objc_retainAutorelease(v33), "UTF8String");
                v43 = strlen(v42);
                if (v43 >= 0x14)
                {
                  WALogCategoryDefaultHandle();
                  v48 = objc_claimAutoreleasedReturnValue();
                  v20 = v98;
                  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136446722;
                    v122 = "-[RoamPolicyStore buildRoamCacheInfoForNetwork:bssid:numRoamSamples:]";
                    v123 = 1024;
                    v124 = 1000;
                    v125 = 2048;
                    v126 = v43;
                    _os_log_impl(&dword_212581000, v48, OS_LOG_TYPE_ERROR, "%{public}s::%d:Length exceeded limit:%lu", buf, 0x1Cu);
                  }

                  v101 = 0;
                  v26 = v99;
                  goto LABEL_46;
                }
                memcpy((char *)&roamCacheInfo + 104 * v102, v42, v43);
                v101 = 0;
                v44 = v102 + 1;
                goto LABEL_36;
              }
              v102 = 0;
              v101 = 1;
              v20 = v98;
              v26 = v99;
            }
            else
            {
              v26 = v29;
            }
LABEL_46:

            v25 = v103;
            v22 = v104;
            v24 = v105;
          }
          ++v27;
        }
        while (v27 != v24);
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v119, 16);
        if (!v24)
        {
LABEL_53:
          v18 = v26;

          v14 = v95;
          v21 = v96;
          v19 = v97;
          goto LABEL_54;
        }
      }
    }
    WALogCategoryDefaultHandle();
    v49 = objc_claimAutoreleasedReturnValue();
    v100 = v49;
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446466;
      v122 = "-[RoamPolicyStore buildRoamCacheInfoForNetwork:bssid:numRoamSamples:]";
      v123 = 1024;
      v124 = 958;
      _os_log_impl(&dword_212581000, v49, OS_LOG_TYPE_INFO, "%{public}s::%d:RoamCache is nil", buf, 0x12u);
    }
LABEL_54:

    ++v19;
  }
  while (v19 < objc_msgSend(v14, "count"));
  v50 = v102;
  if (!v102)
  {
    v78 = 0;
    v77 = v18;
    v8 = v20;
    goto LABEL_97;
  }
  v51 = &roamCacheInfo;
  v52 = v18;
  while (1)
  {
    v110 = v50;
    v54 = v51[3];
    v53 = v51[4];
    v55 = v53 > v54;
    if (v53 <= v54)
      v56 = (void *)v51[3];
    else
      v56 = (void *)v51[4];
    v58 = v51[5];
    v57 = v51[6];
    if (v58 <= (unint64_t)v56)
      v59 = v56;
    else
      v59 = (void *)v51[5];
    if (v58 > (unint64_t)v56)
      v55 = 2;
    if (v57 <= (unint64_t)v59)
      v60 = v59;
    else
      v60 = (void *)v51[6];
    if (v57 > (unint64_t)v59)
      v55 = 3;
    v61 = v51[7];
    obja = v60;
    if (v61 > (unint64_t)v60)
      v55 = 4;
    v106 = v55;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v51);
    v62 = objc_claimAutoreleasedReturnValue();
    -[RoamPolicyStore roamPolicyMOHandler](v52, "roamPolicyMOHandler");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "managedObjectContext");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = v62;
    +[RoamMO fetchRoamObjects:fetchLimit:moc:](RoamMO, "fetchRoamObjects:fetchLimit:moc:", v62, 1, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v64)
      break;
    if (v53 <= v54)
      v65 = 0;
    else
      v65 = v53;
    v66 = v65 + v54;
    if (v58 <= (unint64_t)v56)
      v67 = 0;
    else
      v67 = v58;
    v68 = v66 + v67;
    if (v57 <= (unint64_t)v59)
      v69 = 0;
    else
      v69 = v57;
    v70 = v68 + v69;
    if (v61 <= (unint64_t)obja)
      v71 = 0;
    else
      v71 = v61;
    v72 = v70 + v71;
    if (v61 <= (unint64_t)obja)
      v73 = (unint64_t)obja;
    else
      v73 = v61;
    objc_msgSend(v64, "objectAtIndex:", 0);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v74;
    if (v73 >= 50 * v72 / 0x64)
      objc_msgSend(v74, "setCacheRssiBin:", v106);
    objc_msgSend(v75, "setCacheChannel:", *((__int16 *)v51 + 32));
    objc_msgSend(v75, "setCacheChannelFlags:", *((__int16 *)v51 + 36));
    v52 = v99;
    -[RoamPolicyStore roamPolicyMOHandler](v99, "roamPolicyMOHandler");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "updateManagedObjectContextWithoutSave");

    v51 += 13;
    v50 = v110 - 1;
    if (v110 == 1)
    {
      v8 = v98;
      v77 = v99;
      v78 = v102;
      goto LABEL_97;
    }
  }
  WALogCategoryDefaultHandle();
  v86 = objc_claimAutoreleasedReturnValue();
  v8 = v98;
  if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v122 = "-[RoamPolicyStore buildRoamCacheInfoForNetwork:bssid:numRoamSamples:]";
    v123 = 1024;
    v124 = 1055;
    _os_log_impl(&dword_212581000, v86, OS_LOG_TYPE_ERROR, "%{public}s::%d:roamManagedObject is nil", buf, 0x12u);
  }

  v87 = v92;
  v9 = v93;
  v17 = v114;
LABEL_115:

LABEL_116:
  WALogCategoryDefaultHandle();
  v80 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v80))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v80, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "RoamingPolicies buildRoamCacheInfoForNetwork", ", buf, 2u);
  }
  v84 = 0;
LABEL_103:

  objc_autoreleasePoolPop(v9);
  return v84;
}

- (void)locateTheNeighbor:(unint64_t)a3 cacheRssi:(int64_t)a4
{
  uint64_t v6;
  char *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  int v12;
  uint64_t v13;
  _QWORD *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  int64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v6 = 0;
  v42 = *MEMORY[0x24BDAC8D0];
  v7 = (char *)&roamCacheInfo + 104 * a3;
  v22 = a3;
  v23 = v7 + 56;
  v8 = v7 + 24;
  v9 = v7 + 48;
  v10 = v7 + 40;
  v11 = v7 + 32;
  v12 = -10;
  do
  {
    v13 = v12;
    v12 = roamCacheRssiLevels[v6 + 1];
    -[RoamPolicyStore inRange:high:value:](self, "inRange:high:value:", v13, v12, a4, v22);
    v14 = v8;
    switch(v6)
    {
      case 0:
        goto LABEL_7;
      case 1:
        v14 = v11;
        goto LABEL_7;
      case 2:
        v14 = v10;
        goto LABEL_7;
      case 3:
        v14 = v9;
        goto LABEL_7;
      case 4:
        v14 = v23;
LABEL_7:
        ++*v14;
        break;
      default:
        break;
    }
    ++v6;
  }
  while (v6 != 8);
  WALogCategoryDefaultHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", (char *)&roamCacheInfo + 104 * v22);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *v8;
    v18 = *v11;
    v19 = *v10;
    v20 = *v9;
    v21 = *v23;
    *(_DWORD *)buf = 136448258;
    v25 = "-[RoamPolicyStore locateTheNeighbor:cacheRssi:]";
    v26 = 1024;
    v27 = 1110;
    v28 = 2112;
    v29 = v16;
    v30 = 2048;
    v31 = a4;
    v32 = 2048;
    v33 = v17;
    v34 = 2048;
    v35 = v18;
    v36 = 2048;
    v37 = v19;
    v38 = 2048;
    v39 = v20;
    v40 = 2048;
    v41 = v21;
    _os_log_impl(&dword_212581000, v15, OS_LOG_TYPE_INFO, "%{public}s::%d:BSS =%@ BSSCacheRSSI =%ld HighRSSI =%ld MidRssi =%ld UpperMid =%ld LowRssi =%ld ReallyLow =%ld", buf, 0x58u);

  }
}

- (void)resetAdaptiveRoamingStateMachine:(id)a3 bssid:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x212BEF45C]();
  -[RoamPolicyStore roamPolicyMOHandler](self, "roamPolicyMOHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[BSSMO getInstance:ssid:moc:](BSSMO, "getInstance:ssid:moc:", v7, v6, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "setRoamTriggerRssi:", 4294967168);
    objc_msgSend(v11, "setNeighborChannels:", 0);
    -[RoamPolicyStore roamPolicyMOHandler](self, "roamPolicyMOHandler");
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject updateManagedObjectContextWithoutSave](v12, "updateManagedObjectContextWithoutSave");
  }
  else
  {
    WALogCategoryDefaultHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = 136446978;
      v14 = "-[RoamPolicyStore resetAdaptiveRoamingStateMachine:bssid:]";
      v15 = 1024;
      v16 = 1120;
      v17 = 2112;
      v18 = v6;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_212581000, v12, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssMO nil for %@[%@]", (uint8_t *)&v13, 0x26u);
    }
  }

  objc_autoreleasePoolPop(v8);
}

- (void)updateNeighborChannelsInCoreDataWith:(id)a3 bssid:(id)a4 ssid:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x212BEF45C]();
  -[RoamPolicyStore roamPolicyMOHandler](self, "roamPolicyMOHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "managedObjectContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[BSSMO getInstance:ssid:moc:](BSSMO, "getInstance:ssid:moc:", v9, v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = (void *)MEMORY[0x24BDBCEF0];
    +[RoamPolicyStore neighborChannelsAsArray:log:For:](RoamPolicyStore, "neighborChannelsAsArray:log:For:", v14, 0, "-[RoamPolicyStore updateNeighborChannelsInCoreDataWith:bssid:ssid:]");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithArray:", v16);
    v17 = objc_claimAutoreleasedReturnValue();

    -[NSObject addObject:](v17, "addObject:", v8);
    WALogCategoryDefaultHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("channel"));
      v22 = v11;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "bandFromChInfo:", v8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136447490;
      v24 = "-[RoamPolicyStore updateNeighborChannelsInCoreDataWith:bssid:ssid:]";
      v25 = 1024;
      v26 = 1148;
      v27 = 2112;
      v28 = v9;
      v29 = 2112;
      v30 = v10;
      v31 = 2112;
      v32 = v19;
      v33 = 2112;
      v34 = v20;
      _os_log_impl(&dword_212581000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:[BSS:%@ SSID:%@] Added Channel %@ Band %@", buf, 0x3Au);

      v11 = v22;
    }

    objc_msgSend(v14, "setNeighborChannels:", v17);
    -[RoamPolicyStore roamPolicyMOHandler](self, "roamPolicyMOHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "updateManagedObjectContextWithoutSave");

  }
  else
  {
    WALogCategoryDefaultHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v24 = "-[RoamPolicyStore updateNeighborChannelsInCoreDataWith:bssid:ssid:]";
      v25 = 1024;
      v26 = 1144;
      v27 = 2112;
      v28 = v10;
      v29 = 2112;
      v30 = v9;
      _os_log_impl(&dword_212581000, v17, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssMO nil for %@[%@]", buf, 0x26u);
    }
  }

  objc_autoreleasePoolPop(v11);
}

- (BOOL)checkForNewBSSAddition:(id)a3 bssid:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[RoamPolicyStore roamPolicyMOHandler](self, "roamPolicyMOHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[BSSMO getInstance:ssid:moc:](BSSMO, "getInstance:ssid:moc:", v6, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10 == 0;
}

- (void)storeNeighborsInfoLearningsFromRoamInfo:(id)a3 neighborCount:(unint64_t)a4
{
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
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
  id v44;
  void *v45;
  NSObject *v46;
  id v47;
  id v48;
  id v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  const char *v56;
  NSObject *v57;
  uint32_t v58;
  void *v59;
  void *v61;
  unint64_t v62;
  id v63;
  unint64_t v64;
  NSObject *log;
  id v66;
  void *v67;
  id v68;
  NSObject *v69;
  void *context;
  unint64_t v71;
  void *v72;
  _QWORD v73[4];
  id v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  uint8_t buf[4];
  const char *v81;
  __int16 v82;
  int v83;
  __int16 v84;
  unint64_t v85;
  __int16 v86;
  id v87;
  __int16 v88;
  id v89;
  __int16 v90;
  id v91;
  __int16 v92;
  id v93;
  __int16 v94;
  id v95;
  __int16 v96;
  id v97;
  __int16 v98;
  void *v99;
  uint64_t v100;

  v100 = *MEMORY[0x24BDAC8D0];
  v68 = a3;
  v59 = (void *)MEMORY[0x212BEF45C]();
  WALogCategoryDefaultHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446722;
    v81 = "-[RoamPolicyStore storeNeighborsInfoLearningsFromRoamInfo:neighborCount:]";
    v82 = 1024;
    v83 = 1177;
    v84 = 2048;
    v85 = a4;
    _os_log_impl(&dword_212581000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:neighborCount: %lu", buf, 0x1Cu);
  }
  v62 = a4;

  if (!v68)
  {
    WALogCategoryDefaultHandle();
    v55 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    *(_DWORD *)buf = 136446466;
    v81 = "-[RoamPolicyStore storeNeighborsInfoLearningsFromRoamInfo:neighborCount:]";
    v82 = 1024;
    v83 = 1179;
    v56 = "%{public}s::%d:bssMO nil";
    goto LABEL_34;
  }
  if (!a4)
  {
    WALogCategoryDefaultHandle();
    v55 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    *(_DWORD *)buf = 136446466;
    v81 = "-[RoamPolicyStore storeNeighborsInfoLearningsFromRoamInfo:neighborCount:]";
    v82 = 1024;
    v83 = 1180;
    v56 = "%{public}s::%d:neighborCount is 0";
LABEL_34:
    v57 = v55;
    v58 = 18;
    goto LABEL_37;
  }
  if (a4 >= 0xA)
  {
    WALogCategoryDefaultHandle();
    v55 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    *(_DWORD *)buf = 136446722;
    v81 = "-[RoamPolicyStore storeNeighborsInfoLearningsFromRoamInfo:neighborCount:]";
    v82 = 1024;
    v83 = 1181;
    v84 = 2048;
    v85 = a4;
    v56 = "%{public}s::%d:neighborCount %lu greater than kMaxNumOfNeighbors.. bailing";
    v57 = v55;
    v58 = 28;
LABEL_37:
    _os_log_impl(&dword_212581000, v57, OS_LOG_TYPE_ERROR, v56, buf, v58);
    goto LABEL_29;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array", v59);
  v69 = objc_claimAutoreleasedReturnValue();
  +[BSSMO bssManagedObjectPropertyValue:forKey:](BSSMO, "bssManagedObjectPropertyValue:forKey:", v68, CFSTR("NeighborInfo"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (v61)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v72)
    {
      v72 = 0;
      goto LABEL_14;
    }
    WALogCategoryDefaultHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = objc_msgSend(v72, "count");
      objc_msgSend(v68, "bssid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446978;
      v81 = "-[RoamPolicyStore storeNeighborsInfoLearningsFromRoamInfo:neighborCount:]";
      v82 = 1024;
      v83 = 1189;
      v84 = 2048;
      v85 = v7;
      v86 = 2112;
      v87 = v8;
      _os_log_impl(&dword_212581000, v6, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Prev Neighbor count:%lu for BSSID:%@", buf, 0x26u);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    WALogCategoryDefaultHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v68, "bssid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446722;
      v81 = "-[RoamPolicyStore storeNeighborsInfoLearningsFromRoamInfo:neighborCount:]";
      v82 = 1024;
      v83 = 1193;
      v84 = 2112;
      v85 = (unint64_t)v9;
      _os_log_impl(&dword_212581000, v6, OS_LOG_TYPE_DEBUG, "%{public}s::%d:No Neighbor Info for BSSID:%@", buf, 0x1Cu);

    }
  }

LABEL_14:
  WALogCategoryDefaultHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v68, "bssid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446978;
    v81 = "-[RoamPolicyStore storeNeighborsInfoLearningsFromRoamInfo:neighborCount:]";
    v82 = 1024;
    v83 = 1196;
    v84 = 2048;
    v85 = v62;
    v86 = 2112;
    v87 = v11;
    _os_log_impl(&dword_212581000, v10, OS_LOG_TYPE_DEBUG, "%{public}s::%d:new Neighbor count:%lu  Info for BSSID:%@", buf, 0x26u);

  }
  v12 = &roamInfo;
  v71 = v62;
  do
  {
    context = (void *)MEMORY[0x212BEF45C]();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValue:forKey:", v14, CFSTR("NeighborBssid"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12[3]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValue:forKey:", v15, CFSTR("NeighborBssNumRoamDueToLowRssi"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12[4]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValue:forKey:", v16, CFSTR("NeighborBssNumRoamDueToBTM"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12[5]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValue:forKey:", v17, CFSTR("NeighborBssNumRoamDueToLazyScan"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12[6]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValue:forKey:", v18, CFSTR("NeighborBssNumRoamDueToBeaconLoss"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12[7]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValue:forKey:", v19, CFSTR("NeighborBssNumRoamDueToLinkLossSuppression"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12[8]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValue:forKey:", v20, CFSTR("NeighborBssNumRoamDueToFastRoamFailure"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12[9]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValue:forKey:", v21, CFSTR("NeighborBssNumRoamDueToTSpecRejection"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12[10]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValue:forKey:", v22, CFSTR("NeighborBssNumRoamDueToMinTxRate"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12[11]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValue:forKey:", v23, CFSTR("NeighborBssNumRoamDueToAsymmetricChannel"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12[12]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValue:forKey:", v24, CFSTR("NeighborBssNumRoamDueToLowRssiAndChannelUsage"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12[13]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValue:forKey:", v25, CFSTR("NeighborBssNumRoamDueToRadar"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12[14]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValue:forKey:", v26, CFSTR("NeighborBssNumRoamDueToCSA"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12[15]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValue:forKey:", v27, CFSTR("NeighborBssNumRoamDueToEstimatedTPutLow"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12[16]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValue:forKey:", v28, CFSTR("NeighborBssNumRoamDueToSilentRoam"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12[17]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValue:forKey:", v29, CFSTR("NeighborBssNumRoamDueToInactivity"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12[18]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValue:forKey:", v30, CFSTR("NeighborBssNumRoamDueToRoamScanTimeout"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v12[19]);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValue:forKey:", v31, CFSTR("NeighborBssNumRoamOriginRssiHigh"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v12[20]);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValue:forKey:", v32, CFSTR("NeighborBssNumRoamOriginRssiUpperHigh"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v12[21]);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValue:forKey:", v33, CFSTR("NeighborBssNumRoamOriginRssiOptimum"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v12[22]);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValue:forKey:", v34, CFSTR("NeighborBssNumRoamOriginRssiUpperOptimum"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v12[23]);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValue:forKey:", v35, CFSTR("NeighborBssNumRoamOriginRssiMid"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v12[24]);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValue:forKey:", v36, CFSTR("NeighborBssNumRoamOriginRssiUpperMid"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v12[25]);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValue:forKey:", v37, CFSTR("NeighborBssNumRoamOriginRssiLow"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v12[26]);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValue:forKey:", v38, CFSTR("NeighborBssNumLazyRoamOriginRssiHigh"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v12[27]);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValue:forKey:", v39, CFSTR("NeighborBssNumLazyRoamOriginRssiUpperHigh"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v12[28]);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValue:forKey:", v40, CFSTR("NeighborBssNumLazyRoamOriginRssiOptimum"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v12[29]);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValue:forKey:", v41, CFSTR("NeighborBssNumLazyRoamOriginRssiUpperOptimum"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v12[30]);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValue:forKey:", v42, CFSTR("NeighborBssNumLazyRoamOriginRssiMid"));

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v12);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v72 && objc_msgSend(v72, "count"))
    {
      v76 = 0;
      v77 = &v76;
      v78 = 0x2020000000;
      v79 = -1;
      v73[0] = MEMORY[0x24BDAC760];
      v73[1] = 3221225472;
      v73[2] = __73__RoamPolicyStore_storeNeighborsInfoLearningsFromRoamInfo_neighborCount___block_invoke;
      v73[3] = &unk_24CDDE628;
      v44 = v43;
      v74 = v44;
      v75 = &v76;
      objc_msgSend(v72, "enumerateObjectsUsingBlock:", v73);
      if (v77[3] != -1)
      {
        objc_msgSend(v72, "objectAtIndex:");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "addEntriesFromDictionary:", v13);
        objc_msgSend(v72, "replaceObjectAtIndex:withObject:", v77[3], v45);
        WALogCategoryDefaultHandle();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          v64 = v77[3];
          log = v46;
          objc_msgSend(v45, "valueForKey:", CFSTR("NeighborBssNumRoamOriginRssiHigh"));
          v63 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "valueForKey:", CFSTR("NeighborBssNumRoamOriginRssiUpperHigh"));
          v66 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "valueForKey:", CFSTR("NeighborBssNumRoamOriginRssiOptimum"));
          v47 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "valueForKey:", CFSTR("NeighborBssNumRoamOriginRssiMid"));
          v48 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "valueForKey:", CFSTR("NeighborBssNumRoamOriginRssiUpperMid"));
          v49 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "valueForKey:", CFSTR("NeighborBssNumRoamOriginRssiLow"));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136448514;
          v81 = "-[RoamPolicyStore storeNeighborsInfoLearningsFromRoamInfo:neighborCount:]";
          v82 = 1024;
          v83 = 1265;
          v84 = 2048;
          v85 = v64;
          v86 = 2112;
          v87 = v44;
          v88 = 2112;
          v89 = v63;
          v90 = 2112;
          v91 = v66;
          v92 = 2112;
          v93 = v47;
          v94 = 2112;
          v95 = v48;
          v96 = 2112;
          v97 = v49;
          v98 = 2112;
          v99 = v50;
          _os_log_impl(&dword_212581000, log, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Replaced index %lu with Neighbor:%@ LowRssiRoam (High:%@ UpperHigh:%@ Opt:%@ Mid:%@ UpperMid:%@ Low:%@)", buf, 0x62u);

          v46 = log;
        }

        _Block_object_dispose(&v76, 8);
        goto LABEL_27;
      }

      _Block_object_dispose(&v76, 8);
    }
    WALogCategoryDefaultHandle();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v68, "bssid");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446978;
      v81 = "-[RoamPolicyStore storeNeighborsInfoLearningsFromRoamInfo:neighborCount:]";
      v82 = 1024;
      v83 = 1270;
      v84 = 2112;
      v85 = (unint64_t)v52;
      v86 = 2112;
      v87 = v43;
      _os_log_impl(&dword_212581000, v51, OS_LOG_TYPE_DEBUG, "%{public}s::%d:New Neighbor for BSSID:%@ --- %@", buf, 0x26u);

    }
    -[NSObject addObject:](v69, "addObject:", v13);
LABEL_27:

    objc_autoreleasePoolPop(context);
    v12 += 44;
    --v71;
  }
  while (v71);
  objc_msgSend(v72, "addObjectsFromArray:", v69);
  -[RoamPolicyStore roamPolicyMOHandler](self, "roamPolicyMOHandler");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setBssManagedObjectPropertyValueForKeyWithoutSave:forKey:withValue:", v68, CFSTR("NeighborInfo"), v72);

  objc_msgSend(v68, "bssid");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[RoamPolicyStore setDeploymentFromRoamInfo:neighborCount:](self, "setDeploymentFromRoamInfo:neighborCount:", v54, v62);

  v55 = v69;
LABEL_29:

  objc_autoreleasePoolPop(v59);
}

void __73__RoamPolicyStore_storeNeighborsInfoLearningsFromRoamInfo_neighborCount___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  if (a2)
  {
    objc_msgSend(a2, "valueForKey:", CFSTR("NeighborBssid"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32)))
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
      *a4 = 1;
    }

  }
}

- (void)storeNeighborsInfoLearningsFromRoamCacheInfo:(id)a3 neighborCount:(unint64_t)a4
{
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  const char *v33;
  NSObject *v34;
  uint32_t v35;
  void *context;
  void *v37;
  unint64_t v39;
  id v40;
  NSObject *v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  int v53;
  __int16 v54;
  unint64_t v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v40 = a3;
  context = (void *)MEMORY[0x212BEF45C]();
  WALogCategoryDefaultHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446722;
    v51 = "-[RoamPolicyStore storeNeighborsInfoLearningsFromRoamCacheInfo:neighborCount:]";
    v52 = 1024;
    v53 = 1291;
    v54 = 2048;
    v55 = a4;
    _os_log_impl(&dword_212581000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:neighborCount: %lu", buf, 0x1Cu);
  }
  v39 = a4;

  if (!v40)
  {
    WALogCategoryDefaultHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    *(_DWORD *)buf = 136446466;
    v51 = "-[RoamPolicyStore storeNeighborsInfoLearningsFromRoamCacheInfo:neighborCount:]";
    v52 = 1024;
    v53 = 1293;
    v33 = "%{public}s::%d:bssMO nil";
    goto LABEL_34;
  }
  if (!a4)
  {
    WALogCategoryDefaultHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    *(_DWORD *)buf = 136446466;
    v51 = "-[RoamPolicyStore storeNeighborsInfoLearningsFromRoamCacheInfo:neighborCount:]";
    v52 = 1024;
    v53 = 1294;
    v33 = "%{public}s::%d:neighborCount is 0";
LABEL_34:
    v34 = v32;
    v35 = 18;
    goto LABEL_37;
  }
  if (a4 >= 0xA)
  {
    WALogCategoryDefaultHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    *(_DWORD *)buf = 136446722;
    v51 = "-[RoamPolicyStore storeNeighborsInfoLearningsFromRoamCacheInfo:neighborCount:]";
    v52 = 1024;
    v53 = 1295;
    v54 = 2048;
    v55 = a4;
    v33 = "%{public}s::%d:neighborCount %lu greater than kMaxNumOfNeighbors.. bailing";
    v34 = v32;
    v35 = 28;
LABEL_37:
    _os_log_impl(&dword_212581000, v34, OS_LOG_TYPE_ERROR, v33, buf, v35);
    goto LABEL_29;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array", context);
  v41 = objc_claimAutoreleasedReturnValue();
  +[BSSMO bssManagedObjectPropertyValue:forKey:](BSSMO, "bssManagedObjectPropertyValue:forKey:", v40, CFSTR("NeighborInfo"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v42)
    {
      v42 = 0;
      goto LABEL_14;
    }
    WALogCategoryDefaultHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = objc_msgSend(v42, "count");
      objc_msgSend(v40, "bssid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136447234;
      v51 = "-[RoamPolicyStore storeNeighborsInfoLearningsFromRoamCacheInfo:neighborCount:]";
      v52 = 1024;
      v53 = 1303;
      v54 = 2048;
      v55 = v7;
      v56 = 2112;
      v57 = v8;
      v58 = 2112;
      v59 = v42;
      _os_log_impl(&dword_212581000, v6, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Prev Neighbor count:%lu  Info for BSSID:%@ --- %@", buf, 0x30u);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    WALogCategoryDefaultHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v40, "bssid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446722;
      v51 = "-[RoamPolicyStore storeNeighborsInfoLearningsFromRoamCacheInfo:neighborCount:]";
      v52 = 1024;
      v53 = 1307;
      v54 = 2112;
      v55 = (unint64_t)v9;
      _os_log_impl(&dword_212581000, v6, OS_LOG_TYPE_DEBUG, "%{public}s::%d:No Neighbor Info for BSSID:%@", buf, 0x1Cu);

    }
  }

LABEL_14:
  WALogCategoryDefaultHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v40, "bssid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446978;
    v51 = "-[RoamPolicyStore storeNeighborsInfoLearningsFromRoamCacheInfo:neighborCount:]";
    v52 = 1024;
    v53 = 1310;
    v54 = 2048;
    v55 = v39;
    v56 = 2112;
    v57 = v11;
    _os_log_impl(&dword_212581000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:new Neighbor count:%lu  Info for BSSID:%@", buf, 0x26u);

  }
  v12 = &roamCacheInfo;
  v13 = v39;
  do
  {
    v14 = (void *)MEMORY[0x212BEF45C]();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setValue:forKey:", v16, CFSTR("NeighborBssid"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12[3]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setValue:forKey:", v17, CFSTR("NeighborBssNumRoamCacheRssiHigh"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12[4]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setValue:forKey:", v18, CFSTR("NeighborBssNumRoamCacheRssiMid"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12[5]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setValue:forKey:", v19, CFSTR("NeighborBssNumRoamCacheRssiUpperMid"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12[6]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setValue:forKey:", v20, CFSTR("NeighborBssNumRoamCacheRssiLow"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12[7]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setValue:forKey:", v21, CFSTR("NeighborBssNumRoamCacheRssiReallyLow"));

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v12);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v42 && objc_msgSend(v42, "count"))
    {
      v46 = 0;
      v47 = &v46;
      v48 = 0x2020000000;
      v49 = -1;
      v43[0] = MEMORY[0x24BDAC760];
      v43[1] = 3221225472;
      v43[2] = __78__RoamPolicyStore_storeNeighborsInfoLearningsFromRoamCacheInfo_neighborCount___block_invoke;
      v43[3] = &unk_24CDDE628;
      v23 = v22;
      v44 = v23;
      v45 = &v46;
      objc_msgSend(v42, "enumerateObjectsUsingBlock:", v43);
      if (v47[3] != -1)
      {
        objc_msgSend(v42, "objectAtIndex:");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addEntriesFromDictionary:", v15);
        objc_msgSend(v42, "replaceObjectAtIndex:withObject:", v47[3], v25);
        WALogCategoryDefaultHandle();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          v27 = (void *)v47[3];
          *(_DWORD *)buf = 136446978;
          v51 = "-[RoamPolicyStore storeNeighborsInfoLearningsFromRoamCacheInfo:neighborCount:]";
          v52 = 1024;
          v53 = 1347;
          v54 = 2112;
          v55 = (unint64_t)v23;
          v56 = 2048;
          v57 = v27;
          _os_log_impl(&dword_212581000, v26, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Replaced neighbor %@ dict at existing array index %lu", buf, 0x26u);
        }

        _Block_object_dispose(&v46, 8);
        goto LABEL_27;
      }

      _Block_object_dispose(&v46, 8);
    }
    WALogCategoryDefaultHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v40, "bssid");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446978;
      v51 = "-[RoamPolicyStore storeNeighborsInfoLearningsFromRoamCacheInfo:neighborCount:]";
      v52 = 1024;
      v53 = 1352;
      v54 = 2112;
      v55 = (unint64_t)v29;
      v56 = 2112;
      v57 = v22;
      _os_log_impl(&dword_212581000, v28, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:New Neighbor for BSSID:%@ --- %@", buf, 0x26u);

    }
    -[NSObject addObject:](v41, "addObject:", v15);
LABEL_27:

    objc_autoreleasePoolPop(v14);
    v12 += 13;
    --v13;
  }
  while (v13);
  objc_msgSend(v42, "addObjectsFromArray:", v41);
  -[RoamPolicyStore roamPolicyMOHandler](self, "roamPolicyMOHandler");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setBssManagedObjectPropertyValueForKeyWithoutSave:forKey:withValue:", v40, CFSTR("NeighborInfo"), v42);

  objc_msgSend(v40, "bssid");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[RoamPolicyStore setDeploymentFromRoamCacheInfo:neighborCount:](self, "setDeploymentFromRoamCacheInfo:neighborCount:", v31, v39);

  v32 = v41;
LABEL_29:

  objc_autoreleasePoolPop(context);
}

void __78__RoamPolicyStore_storeNeighborsInfoLearningsFromRoamCacheInfo_neighborCount___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  if (a2)
  {
    objc_msgSend(a2, "valueForKey:", CFSTR("NeighborBssid"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32)))
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
      *a4 = 1;
    }

  }
}

- (void)setDeploymentFromRoamInfo:(id)a3 neighborCount:(unint64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  char *v9;
  unint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  int v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  unint64_t v24;
  __int16 v25;
  unint64_t v26;
  __int16 v27;
  NSObject *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x212BEF45C]();
  if (!v6)
  {
    WALogCategoryDefaultHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    v19 = 136446466;
    v20 = "-[RoamPolicyStore setDeploymentFromRoamInfo:neighborCount:]";
    v21 = 1024;
    v22 = 1371;
    v16 = "%{public}s::%d:bssid nil";
    v17 = v8;
    v18 = 18;
LABEL_16:
    _os_log_impl(&dword_212581000, v17, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v19, v18);
    goto LABEL_11;
  }
  if (a4 >= 0xA)
  {
    WALogCategoryDefaultHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    v19 = 136446722;
    v20 = "-[RoamPolicyStore setDeploymentFromRoamInfo:neighborCount:]";
    v21 = 1024;
    v22 = 1372;
    v23 = 2048;
    v24 = a4;
    v16 = "%{public}s::%d:neighborCount %lu greater than kMaxNumOfNeighbors.. bailing";
    v17 = v8;
    v18 = 28;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v8 = objc_claimAutoreleasedReturnValue();
  -[NSObject addObject:](v8, "addObject:", v6);
  if (a4)
  {
    v9 = (char *)&roamInfo;
    v10 = a4;
    do
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        -[NSObject addObject:](v8, "addObject:", v11);

      v9 += 352;
      --v10;
    }
    while (v10);
  }
  WALogCategoryDefaultHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v19 = 136447234;
    v20 = "-[RoamPolicyStore setDeploymentFromRoamInfo:neighborCount:]";
    v21 = 1024;
    v22 = 1384;
    v23 = 2112;
    v24 = (unint64_t)v6;
    v25 = 2048;
    v26 = a4;
    v27 = 2112;
    v28 = v8;
    _os_log_impl(&dword_212581000, v12, OS_LOG_TYPE_DEBUG, "%{public}s::%d:bssid:%@ neighborCount: %lu neigbors: %@", (uint8_t *)&v19, 0x30u);
  }

  -[NSObject allObjects](v8, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[RoamPolicyStore roamPolicyMOHandler](self, "roamPolicyMOHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "managedObjectContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[BSSMO coalesceBssidsIntoDeployment:moc:](BSSMO, "coalesceBssidsIntoDeployment:moc:", v13, v15);

LABEL_11:
  objc_autoreleasePoolPop(v7);

}

- (void)setDeploymentFromRoamCacheInfo:(id)a3 neighborCount:(unint64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  char *v9;
  unint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  int v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  unint64_t v24;
  __int16 v25;
  NSObject *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x212BEF45C]();
  if (!v6)
  {
    WALogCategoryDefaultHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    v19 = 136446466;
    v20 = "-[RoamPolicyStore setDeploymentFromRoamCacheInfo:neighborCount:]";
    v21 = 1024;
    v22 = 1396;
    v16 = "%{public}s::%d:bssid nil";
    v17 = v8;
    v18 = 18;
LABEL_16:
    _os_log_impl(&dword_212581000, v17, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v19, v18);
    goto LABEL_11;
  }
  if (a4 >= 0xA)
  {
    WALogCategoryDefaultHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    v19 = 136446722;
    v20 = "-[RoamPolicyStore setDeploymentFromRoamCacheInfo:neighborCount:]";
    v21 = 1024;
    v22 = 1397;
    v23 = 2048;
    v24 = a4;
    v16 = "%{public}s::%d:neighborCount %lu greater than kMaxNumOfNeighbors.. bailing";
    v17 = v8;
    v18 = 28;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v8 = objc_claimAutoreleasedReturnValue();
  -[NSObject addObject:](v8, "addObject:", v6);
  if (a4)
  {
    v9 = (char *)&roamCacheInfo;
    v10 = a4;
    do
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        -[NSObject addObject:](v8, "addObject:", v11);

      v9 += 104;
      --v10;
    }
    while (v10);
  }
  WALogCategoryDefaultHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v19 = 136446978;
    v20 = "-[RoamPolicyStore setDeploymentFromRoamCacheInfo:neighborCount:]";
    v21 = 1024;
    v22 = 1409;
    v23 = 2048;
    v24 = a4;
    v25 = 2112;
    v26 = v8;
    _os_log_impl(&dword_212581000, v12, OS_LOG_TYPE_DEBUG, "%{public}s::%d:neighborCount: %lu neigbors: %@", (uint8_t *)&v19, 0x26u);
  }

  -[NSObject allObjects](v8, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[RoamPolicyStore roamPolicyMOHandler](self, "roamPolicyMOHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "managedObjectContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[BSSMO coalesceBssidsIntoDeployment:moc:](BSSMO, "coalesceBssidsIntoDeployment:moc:", v13, v15);

LABEL_11:
  objc_autoreleasePoolPop(v7);

}

+ (id)rangeStringWithRssiLevel:(unint64_t)a3
{
  int *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (a3 >= 8)
  {
    WALogCategoryDefaultHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v14 = "+[RoamPolicyStore rangeStringWithRssiLevel:]";
      v15 = 1024;
      v16 = 1422;
      _os_log_impl(&dword_212581000, v12, OS_LOG_TYPE_ERROR, "%{public}s::%d:invalid level nil", buf, 0x12u);
    }

    return 0;
  }
  else
  {
    v3 = &roamOriginRssiLevels[a3];
    v4 = *v3;
    v5 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v3[1]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("[%@,%@]"), v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    return v10;
  }
}

- (void)deriveRoamDeltaFromRoamCacheInfo:(id)a3 neighborCount:(unint64_t)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  char *v8;
  unint64_t v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  unint64_t v20;
  __int16 v21;
  NSObject *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)MEMORY[0x212BEF45C]();
  if (!v5)
  {
    WALogCategoryDefaultHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    v15 = 136446466;
    v16 = "-[RoamPolicyStore deriveRoamDeltaFromRoamCacheInfo:neighborCount:]";
    v17 = 1024;
    v18 = 1438;
    v12 = "%{public}s::%d:bssid nil";
    v13 = v7;
    v14 = 18;
LABEL_16:
    _os_log_impl(&dword_212581000, v13, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v15, v14);
    goto LABEL_11;
  }
  if (a4 >= 0xA)
  {
    WALogCategoryDefaultHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    v15 = 136446722;
    v16 = "-[RoamPolicyStore deriveRoamDeltaFromRoamCacheInfo:neighborCount:]";
    v17 = 1024;
    v18 = 1439;
    v19 = 2048;
    v20 = a4;
    v12 = "%{public}s::%d:neighborCount %lu greater than kMaxNumOfNeighbors.. bailing";
    v13 = v7;
    v14 = 28;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v7 = objc_claimAutoreleasedReturnValue();
  -[NSObject addObject:](v7, "addObject:", v5);
  if (a4)
  {
    v8 = (char *)&roamCacheInfo;
    v9 = a4;
    do
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        -[NSObject addObject:](v7, "addObject:", v10);

      v8 += 104;
      --v9;
    }
    while (v9);
  }
  WALogCategoryDefaultHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v15 = 136446978;
    v16 = "-[RoamPolicyStore deriveRoamDeltaFromRoamCacheInfo:neighborCount:]";
    v17 = 1024;
    v18 = 1451;
    v19 = 2048;
    v20 = a4;
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_212581000, v11, OS_LOG_TYPE_DEBUG, "%{public}s::%d:neighborCount: %lu neigbors: %@", (uint8_t *)&v15, 0x26u);
  }

LABEL_11:
  objc_autoreleasePoolPop(v6);

}

+ (id)cleanChannelFlagsIn:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDBCED8];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("channelFlags"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v6, "unsignedIntValue") & 0x2018;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v4 | 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("channelFlags"));

  return v5;
}

+ (id)makeChanInfoFromChannel:(int64_t)a3 andFlags:(int64_t)a4
{
  uint64_t v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v5 = 18;
  if (a3 < 15)
    v5 = 10;
  if (a4)
    v6 = a4;
  else
    v6 = v5;
  v12[0] = CFSTR("channel");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v12[1] = CFSTR("channelFlags");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "cleanChannelFlagsIn:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)convertChannelList:(id)a3 log:(BOOL)a4 For:(const char *)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  _BOOL8 v23;
  id v24;
  void *v25;
  uint64_t v26;
  __int128 v28;
  uint64_t v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v5 = a4;
  v46 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void *)objc_opt_new();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v45, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v32;
    *(_QWORD *)&v11 = 136446978;
    v28 = v11;
    do
    {
      v14 = 0;
      v29 = v12;
      do
      {
        if (*(_QWORD *)v32 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v14);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend((id)objc_opt_class(), "makeChanInfoFromChannel:andFlags:", objc_msgSend(v15, "integerValue"), 0);
          v16 = objc_claimAutoreleasedReturnValue();
LABEL_10:
          v17 = v16;
          if (v5)
          {
            WALogCategoryDefaultHandle();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              -[NSObject objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", CFSTR("channel"));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1, "bandFromChInfo:", v17);
              v20 = v13;
              v21 = a1;
              v22 = v8;
              v23 = v5;
              v24 = v9;
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136447234;
              v36 = "+[RoamPolicyStore convertChannelList:log:For:]";
              v37 = 1024;
              v38 = 1519;
              v39 = 2080;
              v40 = a5;
              v41 = 2112;
              v42 = v19;
              v43 = 2112;
              v44 = v25;
              _os_log_impl(&dword_212581000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:[%s] - Channel %@ Band %@", buf, 0x30u);

              v9 = v24;
              v5 = v23;
              v8 = v22;
              a1 = v21;
              v13 = v20;
              v12 = v29;
            }

          }
          objc_msgSend(v8, "addObject:", v17, v28);
          goto LABEL_15;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend((id)objc_opt_class(), "cleanChannelFlagsIn:", v15);
          v16 = objc_claimAutoreleasedReturnValue();
          goto LABEL_10;
        }
        WALogCategoryDefaultHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v28;
          v36 = "+[RoamPolicyStore convertChannelList:log:For:]";
          v37 = 1024;
          v38 = 1514;
          v39 = 2080;
          v40 = a5;
          v41 = 2112;
          v42 = v15;
          _os_log_impl(&dword_212581000, v17, OS_LOG_TYPE_ERROR, "%{public}s::%d:[%s] Channel is neither a number nor a dictionary: %@", buf, 0x26u);
        }
LABEL_15:

        ++v14;
      }
      while (v12 != v14);
      v26 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v45, 16);
      v12 = v26;
    }
    while (v26);
  }

  return v8;
}

+ (id)extractChannelList:(id)a3 channelKeyPath:(id)a4 channelFlagsKeyPath:(id)a5 logFor:(const char *)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  __int128 v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v32 = a5;
  v33 = (id)objc_opt_new();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)v35;
    *(_QWORD *)&v13 = 136446978;
    v31 = v13;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v35 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v17, "valueForKey:", v10, v31);
        v18 = objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          v19 = (void *)v18;
          objc_msgSend(v17, "valueForKey:", v10);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "integerValue");

          if (v21)
          {
            v22 = (void *)objc_opt_class();
            objc_msgSend(v17, "valueForKey:", v10);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "integerValue");
            objc_msgSend(v17, "valueForKey:", v32);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "makeChanInfoFromChannel:andFlags:", v24, objc_msgSend(v25, "integerValue"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            WALogCategoryDefaultHandle();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("channel"));
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1, "bandFromChInfo:", v26);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v31;
              v39 = "+[RoamPolicyStore extractChannelList:channelKeyPath:channelFlagsKeyPath:logFor:]";
              v40 = 1024;
              v41 = 1540;
              v42 = 2112;
              v43 = v28;
              v44 = 2112;
              v45 = v29;
              _os_log_impl(&dword_212581000, v27, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Channel %@ Band %@", buf, 0x26u);

            }
            objc_msgSend(v33, "addObject:", v26);

          }
        }
      }
      v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
    }
    while (v14);
  }

  return v33;
}

+ (id)bandFromChInfo:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  char v7;
  void *v8;
  __int16 v9;
  const __CFString *v10;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("channelFlags"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntValue");

  if ((v5 & 8) != 0)
  {
    v10 = CFSTR("2.4Ghz");
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("channelFlags"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedIntValue");

    if ((v7 & 0x10) != 0)
    {
      v10 = CFSTR("5Ghz");
    }
    else
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("channelFlags"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "unsignedIntValue");

      if ((v9 & 0x2000) != 0)
        v10 = CFSTR("6Ghz");
      else
        v10 = CFSTR("N/A");
    }
  }

  return (id)v10;
}

+ (id)neighborChannelsAsArray:(id)a3 log:(BOOL)a4 For:(const char *)a5
{
  _BOOL8 v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  int v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v6 = a4;
  v31 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    objc_msgSend(v8, "neighborChannels");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v8, "neighborChannels");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        v12 = (void *)objc_opt_class();
        objc_msgSend(v8, "neighborChannels");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "convertChannelList:log:For:", v13, v6, a5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "allObjects");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
        goto LABEL_13;
      }
      objc_msgSend(v8, "neighborChannels");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v17 = objc_opt_isKindOfClass();

      if ((v17 & 1) != 0)
      {
        objc_msgSend(v8, "neighborChannels");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "allObjects");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_12;
      }
      WALogCategoryDefaultHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "neighborChannels");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 136446978;
        v24 = "+[RoamPolicyStore neighborChannelsAsArray:log:For:]";
        v25 = 1024;
        v26 = 1573;
        v27 = 2080;
        v28 = a5;
        v29 = 2112;
        v30 = (id)objc_opt_class();
        v21 = v30;
        _os_log_impl(&dword_212581000, v19, OS_LOG_TYPE_ERROR, "%{public}s::%d:[%s] bssMO.neighborChannels is neither Array nor Set! (%@)", (uint8_t *)&v23, 0x26u);

      }
    }
    v15 = 0;
    goto LABEL_12;
  }
  v15 = 0;
LABEL_13:

  return v15;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (AnalyticsStoreMOHandler)roamPolicyMOHandler
{
  return self->_roamPolicyMOHandler;
}

- (void)setRoamPolicyMOHandler:(id)a3
{
  objc_storeStrong((id *)&self->_roamPolicyMOHandler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roamPolicyMOHandler, 0);
}

@end
