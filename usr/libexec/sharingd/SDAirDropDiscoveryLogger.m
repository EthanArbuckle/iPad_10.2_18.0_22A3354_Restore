@implementation SDAirDropDiscoveryLogger

- (SDAirDropDiscoveryLogger)init
{
  SDAirDropDiscoveryLogger *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *realNameToMetricsMap;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SDAirDropDiscoveryLogger;
  v2 = -[SDAirDropDiscoveryLogger init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableDictionary);
    realNameToMetricsMap = v2->_realNameToMetricsMap;
    v2->_realNameToMetricsMap = v3;

  }
  return v2;
}

- (void)updateWithAirDropNodes:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v11 = (void *)SFNodeCopyRealName(v10, v6);
        v12 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_realNameToMetricsMap, "objectForKeyedSubscript:", v11));
        if (!v12)
          v12 = objc_opt_new(NSMutableDictionary);
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDAirDropDiscoveryLogger updateMetrics:withNode:](SDAirDropDiscoveryLogger, "updateMetrics:withNode:", v12, v10));

        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_realNameToMetricsMap, "setObject:forKeyedSubscript:", v13, v11);
      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (void)logMetricsWithSessionTime:(double)a3
{
  _UNKNOWN **v3;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _UNKNOWN **v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  const __CFString *v17;
  _UNKNOWN **v18;
  _BYTE v19[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_realNameToMetricsMap, "allValues", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9);
        v17 = CFSTR("sessionTime");
        if (a3 == 0.0)
        {
          v11 = &off_10074B880;
        }
        else
        {
          v3 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
          v11 = v3;
        }
        v18 = v11;
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
        objc_msgSend(v10, "addEntriesFromDictionary:", v12);

        if (a3 != 0.0)
        SFMetricsLog(CFSTR("com.apple.sharing.Airdrop.CoalescedNodes.Discovery"), v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v7);
  }

}

+ (id)updateMetrics:(id)a3 withNode:(__SFNode *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  char v28;
  char v29;
  char v30;
  char v31;
  char v32;
  void *v33;
  void *v34;
  uint64_t v35;
  BOOL v36;
  unsigned __int16 v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v47;
  id obj;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  char v54;
  unsigned int v55;
  unsigned int v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("contactLevel")));
  if (v6)
    v7 = (uint64_t)v6;
  else
    v7 = -1;
  v52 = v7;

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("foundBonjour")));
  v55 = objc_msgSend(v8, "BOOLValueSafe");

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("foundRapport")));
  v56 = objc_msgSend(v9, "BOOLValueSafe");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rpFlagMyiCloud")));
  v11 = objc_msgSend(v10, "BOOLValueSafe");

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rpFlagFriend")));
  v13 = objc_msgSend(v12, "BOOLValueSafe");

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rpFlagFamily")));
  v15 = objc_msgSend(v14, "BOOLValueSafe");

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rpFlagSharedHome")));
  v17 = objc_msgSend(v16, "BOOLValueSafe");

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rpFlagStranger")));
  v19 = objc_msgSend(v18, "BOOLValueSafe");

  v20 = (void *)SFNodeCopySiblingNodes(a4);
  v21 = objc_msgSend(v20, "mutableCopy");

  if (!v21)
    v21 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", a4, 0);
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = v21;
  v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
  if (v53)
  {
    v47 = v5;
    v22 = 0;
    v23 = 0;
    v51 = *(_QWORD *)v58;
    v50 = kSFNodeKindBonjour;
    v49 = kSFNodeKindRapport;
    do
    {
      v24 = 0;
      v25 = v22;
      v26 = v23;
      do
      {
        if (*(_QWORD *)v58 != v51)
          objc_enumerationMutation(obj);
        v27 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)v24);
        if (v27)
        {
          v54 = (char)v11;
          v28 = (char)v13;
          v29 = (char)v15;
          v30 = (char)v17;
          v31 = (char)v19;
          v32 = sub_10004E26C(*(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)v24));
          v33 = (void *)SFNodeCopyContactIdentifier(v27);
          v34 = (void *)SFNodeCopyUserName(v27);
          v35 = 2;
          if (!v34)
            v35 = 3;
          if (v33)
            v35 = 1;
          v36 = (v32 & 1) == 0;
          LOBYTE(v19) = v31;
          LOBYTE(v17) = v30;
          LOBYTE(v15) = v29;
          LOBYTE(v13) = v28;
          LOBYTE(v11) = v54;
          if (!v36)
            v35 = 0;
          v52 = v35;

        }
        else
        {
          v52 = -1;
        }
        v23 = (void *)SFNodeCopyKinds(v27);

        v55 |= objc_msgSend(v23, "containsObject:", v50);
        v56 |= objc_msgSend(v23, "containsObject:", v49);
        v22 = (void *)SFNodeCopyRapportFlags(v27);

        v37 = (unsigned __int16)objc_msgSend(v22, "unsignedIntegerValue");
        v11 = (id)((v37 | v11) & 1);
        v13 = (id)(v13 & 1u | ((v37 & 4) != 0));
        v15 = (id)(v15 & 1u | ((v37 & 8) != 0));
        v17 = (id)(v17 & 1u | ((v37 & 0x40) != 0));
        v19 = (id)((v19 | HIBYTE(v37)) & 1);
        v24 = (char *)v24 + 1;
        v25 = v22;
        v26 = v23;
      }
      while (v53 != v24);
      v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
    }
    while (v53);

    v5 = v47;
  }

  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v52));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v38, CFSTR("contactLevel"));

  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v55 & 1));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v39, CFSTR("foundBonjour"));

  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v56 & 1));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v40, CFSTR("foundRapport"));

  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v11));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v41, CFSTR("rpFlagMyiCloud"));

  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v13));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v42, CFSTR("rpFlagFriend"));

  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v15));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v43, CFSTR("rpFlagFamily"));

  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v17));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v44, CFSTR("rpFlagSharedHome"));

  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v19));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v45, CFSTR("rpFlagStranger"));

  return v5;
}

+ (id)discoverabilityMetricsForNode:(__SFNode *)a3
{
  NSMutableDictionary *v4;
  void *v5;

  v4 = objc_opt_new(NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDAirDropDiscoveryLogger updateMetrics:withNode:](SDAirDropDiscoveryLogger, "updateMetrics:withNode:", v4, a3));

  return v5;
}

- (NSMutableDictionary)realNameToMetricsMap
{
  return self->_realNameToMetricsMap;
}

- (void)setRealNameToMetricsMap:(id)a3
{
  objc_storeStrong((id *)&self->_realNameToMetricsMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_realNameToMetricsMap, 0);
}

@end
