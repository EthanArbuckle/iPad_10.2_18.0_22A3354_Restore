@implementation LinkChangePolicyHandler

- (LinkChangePolicyHandler)initWithAnalyticsStore:(id)a3
{
  id v5;
  LinkChangePolicyHandler *v6;
  LinkChangePolicyHandler *v7;
  LinkChangePolicyHandler *v8;
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
  v11.super_class = (Class)LinkChangePolicyHandler;
  v6 = -[LinkChangePolicyHandler init](&v11, sel_init);
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
      v13 = "-[LinkChangePolicyHandler initWithAnalyticsStore:]";
      v14 = 1024;
      v15 = 46;
      _os_log_impl(&dword_212581000, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error getting _roamPolicyMOHandler", buf, 0x12u);
    }

    goto LABEL_7;
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (void)setLinkChange:(BOOL)a3 ssid:(id)a4 bssid:(id)a5 reason:(unint64_t)a6 subReason:(unint64_t)a7 rssi:(int64_t)a8
{
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  int v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  NSObject *v32;
  os_log_type_t v33;
  uint32_t v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  __int16 v43;
  int v44;
  __int16 v45;
  int v46;
  __int16 v47;
  int v48;
  __int16 v49;
  int v50;
  __int16 v51;
  int v52;
  _QWORD v53[3];
  _QWORD v54[5];

  v54[3] = *MEMORY[0x24BDAC8D0];
  v14 = a5;
  v15 = a4;
  -[LinkChangePolicyHandler storeMOHandler](self, "storeMOHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "managedObjectContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[BSSMO getInstance:ssid:moc:](BSSMO, "getInstance:ssid:moc:", v14, v15, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    WALogCategoryDefaultHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      goto LABEL_37;
    *(_DWORD *)buf = 136446466;
    v36 = "-[LinkChangePolicyHandler setLinkChange:ssid:bssid:reason:subReason:rssi:]";
    v37 = 1024;
    v38 = 59;
    v31 = "%{public}s::%d:Error getting bssMo";
    v32 = v30;
    v33 = OS_LOG_TYPE_ERROR;
    v34 = 18;
    goto LABEL_36;
  }
  if (!a3)
  {
    if ((uint64_t)a6 > 999)
    {
      if (a6 == 1000)
      {
        if (objc_msgSend(v18, "disTrgDisCount") == 0x7FFF)
        {
          v28 = v18;
          v29 = 5;
        }
        else
        {
          v29 = (__int16)(objc_msgSend(v18, "disTrgDisCount") + 1);
          v28 = v18;
        }
        objc_msgSend(v28, "setDisTrgDisCount:", v29);
        goto LABEL_29;
      }
      if (a6 != 1011)
        goto LABEL_29;
    }
    else
    {
      if (a6 == 2)
      {
        if (objc_msgSend(v18, "disBcnLossCount") == 0x7FFF)
        {
          v26 = v18;
          v27 = 5;
        }
        else
        {
          v27 = (__int16)(objc_msgSend(v18, "disBcnLossCount") + 1);
          v26 = v18;
        }
        objc_msgSend(v26, "setDisBcnLossCount:", v27);
        goto LABEL_29;
      }
      if (a6 != 5)
      {
LABEL_29:
        if ((int)objc_msgSend(v18, "disBcnLossCount") > 4
          || (int)objc_msgSend(v18, "disTrgDisCount") > 4
          || (int)objc_msgSend(v18, "disUsrForcedInWeakRssiCount") >= 1)
        {
          objc_msgSend(v18, "setIsEdgeForLeave:", 1);
        }
        goto LABEL_33;
      }
    }
    if (a8 <= -75)
    {
      if (objc_msgSend(v18, "disUsrForcedInWeakRssiCount") == 0x7FFF)
        LOWORD(v25) = 5;
      else
        v25 = objc_msgSend(v18, "disUsrForcedInWeakRssiCount") + 1;
      objc_msgSend(v18, "setDisUsrForcedInWeakRssiCount:", (__int16)v25);
      if ((int)objc_msgSend(v18, "disUsrForcedInWeakRssiCount") >= 1)
        objc_msgSend(v18, "setAutoLeaveRssi:", (__int16)a8);
    }
    goto LABEL_29;
  }
  if (a6 == 1 && (a7 == 0x80000 || a7 == 0x40000))
  {
    if (objc_msgSend(v18, "autoLeaveRssi"))
    {
      v53[0] = CFSTR("autoLeaveRssi");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", objc_msgSend(v18, "autoLeaveRssi"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v54[0] = v19;
      v53[1] = CFSTR("reason");
      v20 = 1;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v54[1] = v21;
      v53[2] = CFSTR("subReason");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a7);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v54[2] = v22;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v54, v53, 3);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = v23;
      AnalyticsSendEventLazy();

      objc_msgSend(v18, "setManualJoinAfterAutoLeave:", 1);
      objc_msgSend(v18, "setAutoLeaveRssi:", 0);
      objc_msgSend(v18, "setIsEdgeForLeave:", 0);
      goto LABEL_34;
    }
    objc_msgSend(v18, "setManualJoinAfterAutoLeave:", 0);
  }
LABEL_33:
  v20 = 0;
LABEL_34:
  WALogCategoryDefaultHandle();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136448258;
    v36 = "-[LinkChangePolicyHandler setLinkChange:ssid:bssid:reason:subReason:rssi:]";
    v37 = 1024;
    v38 = 130;
    v39 = 1024;
    v40 = objc_msgSend(v18, "disBcnLossCount");
    v41 = 1024;
    v42 = objc_msgSend(v18, "disTrgDisCount");
    v43 = 1024;
    v44 = objc_msgSend(v18, "disUsrForcedInWeakRssiCount");
    v45 = 1024;
    v46 = objc_msgSend(v18, "autoLeaveRssi");
    v47 = 1024;
    v48 = objc_msgSend(v18, "isEdgeForLeave");
    v49 = 1024;
    v50 = objc_msgSend(v18, "manualJoinAfterAutoLeave");
    v51 = 1024;
    v52 = v20;
    v31 = "%{public}s::%d:disBcnLossCount:%d disTrgDisCount:%d disUsrForcedInWeakRssiCount:%d autoLeaveRssi:%d isEdgeForL"
          "eave:%d, manualJoinAfterAutoLeave:%d (cleared:%d)";
    v32 = v30;
    v33 = OS_LOG_TYPE_DEBUG;
    v34 = 60;
LABEL_36:
    _os_log_impl(&dword_212581000, v32, v33, v31, buf, v34);
  }
LABEL_37:

}

id __74__LinkChangePolicyHandler_setLinkChange_ssid_bssid_reason_subReason_rssi___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (BOOL)checkIpConfigChangeAndInvalidateScope:(id)a3 bssid:(id)a4 ipAddr:(int)a5 routerIp:(int)a6 routerMAC:(id)a7
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  BOOL v26;
  NSObject *v27;
  void *v28;
  int v29;
  int v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  BOOL v43;
  NSObject *v44;
  NSObject *v45;
  const char *v46;
  NSObject *v47;
  os_log_type_t v48;
  uint32_t v49;
  const char *v50;
  NSObject *v51;
  uint32_t v52;
  LinkChangePolicyHandler *v54;
  id v55;
  id v56;
  void *v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t buf[4];
  const char *v66;
  __int16 v67;
  int v68;
  __int16 v69;
  uint64_t v70;
  __int16 v71;
  id v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  id v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  int v80;
  __int16 v81;
  int v82;
  __int16 v83;
  int v84;
  __int16 v85;
  int v86;
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v60 = a7;
  -[LinkChangePolicyHandler storeMOHandler](self, "storeMOHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "managedObjectContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[JoinMO mostRecentJoinsWithBatchSize:bssid:ssid:moc:](JoinMO, "mostRecentJoinsWithBatchSize:bssid:ssid:moc:", 10, v11, v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    WALogCategoryDefaultHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_46;
    *(_DWORD *)buf = 136446466;
    v66 = "-[LinkChangePolicyHandler checkIpConfigChangeAndInvalidateScope:bssid:ipAddr:routerIp:routerMAC:]";
    v67 = 1024;
    v68 = 159;
    v50 = "%{public}s::%d:joinMos nil";
    v51 = v15;
    v52 = 18;
LABEL_45:
    _os_log_impl(&dword_212581000, v51, OS_LOG_TYPE_ERROR, v50, buf, v52);
    goto LABEL_46;
  }
  if ((unint64_t)objc_msgSend(v14, "count") <= 9)
  {
    WALogCategoryDefaultHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_46;
    *(_DWORD *)buf = 136446722;
    v66 = "-[LinkChangePolicyHandler checkIpConfigChangeAndInvalidateScope:bssid:ipAddr:routerIp:routerMAC:]";
    v67 = 1024;
    v68 = 160;
    v69 = 2048;
    v70 = objc_msgSend(v14, "count");
    v50 = "%{public}s::%d:Insufficient joins: %lu. Bailing";
    v51 = v15;
    v52 = 28;
    goto LABEL_45;
  }
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v15 = v14;
  v16 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v61, v87, 16);
  if (!v16)
  {
LABEL_46:
    v26 = 0;
    goto LABEL_47;
  }
  v17 = v16;
  v54 = self;
  v55 = v11;
  v56 = v10;
  v18 = *(_QWORD *)v62;
  v19 = 10;
LABEL_5:
  v20 = 0;
  while (1)
  {
    if (*(_QWORD *)v62 != v18)
      objc_enumerationMutation(v15);
    if (!v19)
      goto LABEL_21;
    v21 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v20);
    objc_msgSend(v21, "routerMAC");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22 || !objc_msgSend(v21, "ipv4Addr"))
    {

      goto LABEL_19;
    }
    v23 = objc_msgSend(v21, "ipv4routerAddr");

    if (!v23
      || (unsigned __int16)objc_msgSend(v21, "ipv4Addr") == 65193
      || (unsigned __int16)objc_msgSend(v21, "ipv4routerAddr") == 65193)
    {
      goto LABEL_19;
    }
    objc_msgSend(v21, "routerMAC");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v60, "isEqualToString:", v24);

    if (!v25
      || ((objc_msgSend(v21, "ipv4Addr") ^ a5) & 0xFFFFFF) != 0
      || ((objc_msgSend(v21, "ipv4routerAddr") ^ a6) & 0xFFFFFF) != 0)
    {
      break;
    }
    --v19;
LABEL_19:
    if (v17 == ++v20)
    {
      v17 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v61, v87, 16);
      if (v17)
        goto LABEL_5;
LABEL_21:
      v26 = 0;
      goto LABEL_22;
    }
  }
  WALogCategoryDefaultHandle();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v21, "routerMAC");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v21, "ipv4Addr");
    v30 = objc_msgSend(v21, "ipv4routerAddr");
    *(_DWORD *)buf = 136448770;
    v66 = "-[LinkChangePolicyHandler checkIpConfigChangeAndInvalidateScope:bssid:ipAddr:routerIp:routerMAC:]";
    v67 = 1024;
    v68 = 182;
    v69 = 2048;
    v70 = v19;
    v71 = 2112;
    v72 = v56;
    v73 = 2112;
    v74 = v55;
    v75 = 2112;
    v76 = v60;
    v77 = 2112;
    v78 = v28;
    v79 = 1024;
    v80 = a5;
    v81 = 1024;
    v82 = v29;
    v83 = 1024;
    v84 = a6;
    v85 = 1024;
    v86 = v30;
    _os_log_impl(&dword_212581000, v27, OS_LOG_TYPE_DEBUG, "%{public}s::%d:At idx:%lu for %@[%@] RouterMAC:%@ existing:%@ IPv4 Addr:0x%x existing:0x%x RouterIP:0x%x existing:0x%x", buf, 0x5Cu);

  }
  -[LinkChangePolicyHandler storeMOHandler](v54, "storeMOHandler");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "managedObjectContext");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[NetworkMO getInstance:moc:](NetworkMO, "getInstance:moc:", v56, v32);
  v15 = objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[NSObject colocatedScopeId](v15, "colocatedScopeId");
    v33 = objc_claimAutoreleasedReturnValue();
    -[NSObject UUIDString](v33, "UUIDString");
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = (void *)v34;
    if (v33 && v34)
    {
      WALogCategoryDefaultHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136447234;
        v66 = "-[LinkChangePolicyHandler checkIpConfigChangeAndInvalidateScope:bssid:ipAddr:routerIp:routerMAC:]";
        v67 = 1024;
        v68 = 199;
        v69 = 2112;
        v70 = (uint64_t)v56;
        v71 = 2112;
        v72 = v55;
        v73 = 2112;
        v74 = v35;
        _os_log_impl(&dword_212581000, v36, OS_LOG_TYPE_INFO, "%{public}s::%d:IP Configuration changed for %@[%@]. Will invalidate colocatedScopeId %@", buf, 0x30u);
      }

      v37 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v35);
      -[LinkChangePolicyHandler storeMOHandler](v54, "storeMOHandler");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "managedObjectContext");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = (void *)v37;
      v40 = +[NetworkMO copyAllSsidsWithColocatedScopeId:moc:](NetworkMO, "copyAllSsidsWithColocatedScopeId:moc:", v37, v39);

      if (objc_msgSend(v40, "count"))
      {
        -[LinkChangePolicyHandler storeMOHandler](v54, "storeMOHandler");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "managedObjectContext");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = +[NetworkMO invalidateColocatedScopeForSsidArray:moc:](NetworkMO, "invalidateColocatedScopeForSsidArray:moc:", v40, v42);

        WALogCategoryDefaultHandle();
        v44 = objc_claimAutoreleasedReturnValue();
        v45 = v44;
        if (v43)
        {
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136446978;
            v66 = "-[LinkChangePolicyHandler checkIpConfigChangeAndInvalidateScope:bssid:ipAddr:routerIp:routerMAC:]";
            v67 = 1024;
            v68 = 208;
            v69 = 2112;
            v70 = (uint64_t)v35;
            v71 = 2112;
            v72 = v40;
            v46 = "%{public}s::%d:invalidated colocatedScopeId %@ for %@";
            v47 = v45;
            v48 = OS_LOG_TYPE_INFO;
            v49 = 38;
            goto LABEL_36;
          }
        }
        else if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          v66 = "-[LinkChangePolicyHandler checkIpConfigChangeAndInvalidateScope:bssid:ipAddr:routerIp:routerMAC:]";
          v67 = 1024;
          v68 = 206;
          v69 = 2112;
          v70 = (uint64_t)v35;
          v46 = "%{public}s::%d:Failed to invalidate %@";
          v47 = v45;
          v48 = OS_LOG_TYPE_ERROR;
          v49 = 28;
LABEL_36:
          _os_log_impl(&dword_212581000, v47, v48, v46, buf, v49);
        }

      }
    }

  }
  else
  {
    WALogCategoryDefaultHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v66 = "-[LinkChangePolicyHandler checkIpConfigChangeAndInvalidateScope:bssid:ipAddr:routerIp:routerMAC:]";
      v67 = 1024;
      v68 = 194;
      v69 = 2112;
      v70 = (uint64_t)v56;
      _os_log_impl(&dword_212581000, v33, OS_LOG_TYPE_ERROR, "%{public}s::%d:networkMO nil for ssid %@", buf, 0x1Cu);
    }
  }

  v26 = 1;
LABEL_22:
  v11 = v55;
  v10 = v56;
LABEL_47:

  return v26;
}

- (void)checkAndApplyColocatedNetworkScope:(id)a3 bssid:(id)a4 ipAddr:(int)a5 routerIp:(int)a6 routerMAC:(id)a7
{
  uint64_t v8;
  uint64_t v9;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  NSObject *v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  int v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v8 = *(_QWORD *)&a6;
  v9 = *(_QWORD *)&a5;
  v34 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a7;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[LinkChangePolicyHandler storeMOHandler](self, "storeMOHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "managedObjectContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[JoinMO ssidsWithRouterMAC:moc:](JoinMO, "ssidsWithRouterMAC:moc:", v12, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16 || !objc_msgSend(v16, "count"))
  {
    WALogCategoryDefaultHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v28 = 136446722;
      v29 = "-[LinkChangePolicyHandler checkAndApplyColocatedNetworkScope:bssid:ipAddr:routerIp:routerMAC:]";
      v30 = 1024;
      v31 = 225;
      v32 = 2112;
      v33 = v12;
      v25 = "%{public}s::%d:No ssids using routerMAC:%@";
LABEL_18:
      v26 = v24;
      v27 = 28;
      goto LABEL_19;
    }
LABEL_20:

    goto LABEL_8;
  }
  objc_msgSend(v13, "addObjectsFromArray:", v16);
  WALogCategoryDefaultHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v13, "allObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "componentsJoinedByString:", CFSTR(", "));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 136446722;
    v29 = "-[LinkChangePolicyHandler checkAndApplyColocatedNetworkScope:bssid:ipAddr:routerIp:routerMAC:]";
    v30 = 1024;
    v31 = 230;
    v32 = 2112;
    v33 = v19;
    _os_log_impl(&dword_212581000, v17, OS_LOG_TYPE_ERROR, "%{public}s::%d:Matching SSIDs with routerMAC:%@", (uint8_t *)&v28, 0x1Cu);

  }
  objc_msgSend(v13, "addObject:", v11);
  if ((unint64_t)objc_msgSend(v13, "count") <= 1)
  {
    WALogCategoryDefaultHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    v28 = 136446466;
    v29 = "-[LinkChangePolicyHandler checkAndApplyColocatedNetworkScope:bssid:ipAddr:routerIp:routerMAC:]";
    v30 = 1024;
    v31 = 235;
    v25 = "%{public}s::%d:Not enough matching ssids before prune checks";
LABEL_15:
    v26 = v24;
    v27 = 18;
LABEL_19:
    _os_log_impl(&dword_212581000, v26, OS_LOG_TYPE_ERROR, v25, (uint8_t *)&v28, v27);
    goto LABEL_20;
  }
  -[LinkChangePolicyHandler pruneNetworksNotInRangeOf:networks:](self, "pruneNetworksNotInRangeOf:networks:", v11, v13);
  -[LinkChangePolicyHandler pruneNetworksWithMoreThanOneBssidFromSet:](self, "pruneNetworksWithMoreThanOneBssidFromSet:", v13);
  -[LinkChangePolicyHandler pruneNetworksFailingBssidPatternAndIpConfigChangeChecks:ipAddr:routerIp:routerMAC:](self, "pruneNetworksFailingBssidPatternAndIpConfigChangeChecks:ipAddr:routerIp:routerMAC:", v13, v9, v8, v12);
  if ((unint64_t)objc_msgSend(v13, "count") <= 1)
  {
    WALogCategoryDefaultHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    v28 = 136446466;
    v29 = "-[LinkChangePolicyHandler checkAndApplyColocatedNetworkScope:bssid:ipAddr:routerIp:routerMAC:]";
    v30 = 1024;
    v31 = 243;
    v25 = "%{public}s::%d:Not enough matching ssids after prune checks";
    goto LABEL_15;
  }
  objc_msgSend(v13, "allObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[LinkChangePolicyHandler storeMOHandler](self, "storeMOHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "managedObjectContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = +[NetworkMO coalesceSsidsIntoColocatedScope:moc:](NetworkMO, "coalesceSsidsIntoColocatedScope:moc:", v20, v22);

  if (!v23)
  {
    WALogCategoryDefaultHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v28 = 136446722;
      v29 = "-[LinkChangePolicyHandler checkAndApplyColocatedNetworkScope:bssid:ipAddr:routerIp:routerMAC:]";
      v30 = 1024;
      v31 = 246;
      v32 = 2112;
      v33 = v13;
      v25 = "%{public}s::%d:Failed to coalesce ssids into colocatedScope: %@";
      goto LABEL_18;
    }
    goto LABEL_20;
  }
LABEL_8:

}

- (void)pruneNetworksNotInRangeOf:(id)a3 networks:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  double v14;
  double v15;
  double v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  void *v28;
  BOOL v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _OWORD v41[4];
  _BYTE v42[128];
  _BYTE v43[128];
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  id v49;
  __int16 v50;
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LinkChangePolicyHandler storeMOHandler](self, "storeMOHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[GeoTagMO geoTagsForNetwork:moc:](GeoTagMO, "geoTagsForNetwork:moc:", v6, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (objc_msgSend(v11, "count") != 1)
    {
      WALogCategoryDefaultHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v45 = "-[LinkChangePolicyHandler pruneNetworksNotInRangeOf:networks:]";
        v46 = 1024;
        v47 = 261;
        v48 = 2112;
        v49 = v6;
        v50 = 2048;
        v51 = objc_msgSend(v11, "count");
        v18 = "%{public}s::%d:More than one geoTag for network:%@ count: %lu";
        v19 = v17;
        v20 = 38;
        goto LABEL_25;
      }
      goto LABEL_20;
    }
    memset(v41, 0, sizeof(v41));
    if (objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", v41, v43, 16))
    {
      v12 = (void *)**((_QWORD **)&v41[0] + 1);
      v13 = objc_alloc(MEMORY[0x24BDBFA78]);
      objc_msgSend(v12, "latitude");
      v15 = v14;
      objc_msgSend(v12, "longitude");
      v17 = objc_msgSend(v13, "initWithLatitude:longitude:", v15, v16);
      if (!v17)
      {
        WALogCategoryDefaultHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v45 = "-[LinkChangePolicyHandler pruneNetworksNotInRangeOf:networks:]";
          v46 = 1024;
          v47 = 265;
          v18 = "%{public}s::%d:location nil";
          v19 = v17;
          v20 = 18;
LABEL_25:
          _os_log_impl(&dword_212581000, v19, OS_LOG_TYPE_ERROR, v18, buf, v20);
          goto LABEL_20;
        }
        goto LABEL_20;
      }
    }
    else
    {
      v17 = 0;
    }
    v33 = v11;
    v34 = v7;
    v21 = v8;
    v35 = v6;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    obj = v7;
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v38 != v24)
            objc_enumerationMutation(obj);
          v26 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
          -[LinkChangePolicyHandler storeMOHandler](self, "storeMOHandler", v33);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "managedObjectContext");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = +[GeoTagMO isNetworkWithinRangeOfLocation:range:location:moc:count:](GeoTagMO, "isNetworkWithinRangeOfLocation:range:location:moc:count:", v26, v17, v28, 0, 300.0);

          if (!v29)
            objc_msgSend(v21, "addObject:", v26);
        }
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v23);
    }

    WALogCategoryDefaultHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    v8 = v21;
    v11 = v33;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v21, "allObjects");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "componentsJoinedByString:", CFSTR(", "));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446722;
      v45 = "-[LinkChangePolicyHandler pruneNetworksNotInRangeOf:networks:]";
      v46 = 1024;
      v47 = 278;
      v48 = 2112;
      v49 = v32;
      _os_log_impl(&dword_212581000, v30, OS_LOG_TYPE_INFO, "%{public}s::%d:Pruning ssids: %@", buf, 0x1Cu);

    }
    objc_msgSend(obj, "minusSet:", v21);
    v7 = v34;
    v6 = v35;
    goto LABEL_20;
  }
  WALogCategoryDefaultHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446722;
    v45 = "-[LinkChangePolicyHandler pruneNetworksNotInRangeOf:networks:]";
    v46 = 1024;
    v47 = 260;
    v48 = 2112;
    v49 = v6;
    v18 = "%{public}s::%d:Error getting geoTags for network:%@";
    v19 = v17;
    v20 = 28;
    goto LABEL_25;
  }
LABEL_20:

}

- (void)pruneNetworksWithMoreThanOneBssidFromSet:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  uint32_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  uint64_t v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v9);
        if (v10)
        {
          -[LinkChangePolicyHandler storeMOHandler](self, "storeMOHandler");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "managedObjectContext");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          +[NetworkMO getInstance:moc:](NetworkMO, "getInstance:moc:", v10, v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            if (objc_msgSend(v13, "numBSS") == 1)
            {
LABEL_9:

              goto LABEL_10;
            }
            WALogCategoryDefaultHandle();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              v18 = objc_msgSend(v13, "numBSS");
              *(_DWORD *)buf = 136446978;
              v29 = "-[LinkChangePolicyHandler pruneNetworksWithMoreThanOneBssidFromSet:]";
              v30 = 1024;
              v31 = 295;
              v32 = 2112;
              v33 = v10;
              v34 = 2048;
              v35 = v18;
              v15 = v14;
              v16 = "%{public}s::%d:%@ has %lld bssids";
              v17 = 38;
LABEL_16:
              _os_log_impl(&dword_212581000, v15, OS_LOG_TYPE_ERROR, v16, buf, v17);
            }
          }
          else
          {
            WALogCategoryDefaultHandle();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446722;
              v29 = "-[LinkChangePolicyHandler pruneNetworksWithMoreThanOneBssidFromSet:]";
              v30 = 1024;
              v31 = 294;
              v32 = 2112;
              v33 = v10;
              v15 = v14;
              v16 = "%{public}s::%d:networkMO nil for ssid %@";
              v17 = 28;
              goto LABEL_16;
            }
          }

          objc_msgSend(v23, "addObject:", v10);
          goto LABEL_9;
        }
LABEL_10:
        ++v9;
      }
      while (v7 != v9);
      v19 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
      v7 = v19;
    }
    while (v19);
  }

  WALogCategoryDefaultHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v23, "allObjects");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "componentsJoinedByString:", CFSTR(", "));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446722;
    v29 = "-[LinkChangePolicyHandler pruneNetworksWithMoreThanOneBssidFromSet:]";
    v30 = 1024;
    v31 = 306;
    v32 = 2112;
    v33 = v22;
    _os_log_impl(&dword_212581000, v20, OS_LOG_TYPE_INFO, "%{public}s::%d:Pruning ssids: %@", buf, 0x1Cu);

  }
  objc_msgSend(v5, "minusSet:", v23);

}

- (void)pruneNetworksFailingBssidPatternAndIpConfigChangeChecks:(id)a3 ipAddr:(int)a4 routerIp:(int)a5 routerMAC:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t k;
  void *v53;
  NSObject *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  id obj;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _BYTE v88[128];
  _BYTE v89[128];
  uint8_t v90[128];
  uint8_t buf[4];
  const char *v92;
  __int16 v93;
  int v94;
  __int16 v95;
  uint64_t v96;
  __int16 v97;
  void *v98;
  _BYTE v99[128];
  uint64_t v100;

  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  v100 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v71 = a6;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  obj = v10;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v99, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v85;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v85 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * i);
        -[LinkChangePolicyHandler storeMOHandler](self, "storeMOHandler");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "managedObjectContext");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[BSSMO allBssidsForSsid:moc:](BSSMO, "allBssidsForSsid:moc:", v15, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
          objc_msgSend(v63, "addObjectsFromArray:", v18);

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v99, 16);
    }
    while (v12);
  }

  objc_msgSend(v63, "allObjects");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "copy");

  v22 = objc_msgSend(v63, "count");
  v23 = 0;
  v59 = v21;
  if (v22 && v21)
  {
    if (+[WAUtil isMacAddress:](WAUtil, "isMacAddress:", v21))
    {
      objc_msgSend(v21, "substringToIndex:", objc_msgSend(v21, "length") - 1);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "stringByAppendingString:", CFSTR("?"));
      v24 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("SELF LIKE[cd] %@"), v24);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "filteredSetUsingPredicate:");
      v25 = objc_claimAutoreleasedReturnValue();
      WALogCategoryDefaultHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v63, "allObjects");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "componentsJoinedByString:", CFSTR(", "));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136446722;
        v92 = "-[LinkChangePolicyHandler pruneNetworksFailingBssidPatternAndIpConfigChangeChecks:ipAddr:routerIp:routerMAC:]";
        v93 = 1024;
        v94 = 335;
        v95 = 2112;
        v96 = (uint64_t)v28;
        _os_log_impl(&dword_212581000, v26, OS_LOG_TYPE_INFO, "%{public}s::%d:All bssids: %@", buf, 0x1Cu);

      }
      v66 = (void *)v25;
      objc_msgSend(v63, "minusSet:", v25);
      WALogCategoryDefaultHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v63, "allObjects");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "componentsJoinedByString:", CFSTR(", "));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136446978;
        v92 = "-[LinkChangePolicyHandler pruneNetworksFailingBssidPatternAndIpConfigChangeChecks:ipAddr:routerIp:routerMAC:]";
        v93 = 1024;
        v94 = 338;
        v95 = 2112;
        v96 = v24;
        v97 = 2112;
        v98 = v31;
        _os_log_impl(&dword_212581000, v29, OS_LOG_TYPE_INFO, "%{public}s::%d:seachStr: %@, unqualifiedBssids: %@", buf, 0x26u);

      }
      v60 = (id)v24;

      v82 = 0u;
      v83 = 0u;
      v80 = 0u;
      v81 = 0u;
      v32 = v63;
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v80, v90, 16);
      if (v33)
      {
        v34 = v33;
        v69 = *(_QWORD *)v81;
        do
        {
          for (j = 0; j != v34; ++j)
          {
            if (*(_QWORD *)v81 != v69)
              objc_enumerationMutation(v32);
            v36 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * j);
            -[LinkChangePolicyHandler storeMOHandler](self, "storeMOHandler");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "managedObjectContext");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            +[BSSMO allSsidsForBssid:moc:](BSSMO, "allSsidsForBssid:moc:", v36, v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            WALogCategoryDefaultHandle();
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v70, "allObjects");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "componentsJoinedByString:", CFSTR(", "));
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136446722;
              v92 = "-[LinkChangePolicyHandler pruneNetworksFailingBssidPatternAndIpConfigChangeChecks:ipAddr:routerIp:routerMAC:]";
              v93 = 1024;
              v94 = 343;
              v95 = 2112;
              v96 = (uint64_t)v42;
              _os_log_impl(&dword_212581000, v40, OS_LOG_TYPE_INFO, "%{public}s::%d:Will prune ssids with unqualified bssids: %@", buf, 0x1Cu);

            }
            objc_msgSend(v70, "addObjectsFromArray:", v39);

          }
          v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v80, v90, 16);
        }
        while (v34);
      }

      v23 = v66;
    }
    else
    {
      v23 = 0;
    }
  }
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v61 = v23;
  v67 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v76, v89, 16);
  if (v67)
  {
    v65 = *(_QWORD *)v77;
    do
    {
      v43 = 0;
      do
      {
        if (*(_QWORD *)v77 != v65)
          objc_enumerationMutation(v61);
        v68 = v43;
        v44 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * v43);
        -[LinkChangePolicyHandler storeMOHandler](self, "storeMOHandler");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "managedObjectContext");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        +[BSSMO allSsidsForBssid:moc:](BSSMO, "allSsidsForBssid:moc:", v44, v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        v74 = 0u;
        v75 = 0u;
        v72 = 0u;
        v73 = 0u;
        v48 = v47;
        v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v72, v88, 16);
        if (v49)
        {
          v50 = v49;
          v51 = *(_QWORD *)v73;
          do
          {
            for (k = 0; k != v50; ++k)
            {
              if (*(_QWORD *)v73 != v51)
                objc_enumerationMutation(v48);
              v53 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * k);
              if (-[LinkChangePolicyHandler checkIpConfigChangeAndInvalidateScope:bssid:ipAddr:routerIp:routerMAC:](self, "checkIpConfigChangeAndInvalidateScope:bssid:ipAddr:routerIp:routerMAC:", v53, v44, v8, v7, v71))
              {
                WALogCategoryDefaultHandle();
                v54 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136446978;
                  v92 = "-[LinkChangePolicyHandler pruneNetworksFailingBssidPatternAndIpConfigChangeChecks:ipAddr:routerIp:routerMAC:]";
                  v93 = 1024;
                  v94 = 355;
                  v95 = 2112;
                  v96 = (uint64_t)v53;
                  v97 = 2112;
                  v98 = v44;
                  _os_log_impl(&dword_212581000, v54, OS_LOG_TYPE_INFO, "%{public}s::%d:checkIpConfigChange failed for ssid:%@[%@]. Will prune", buf, 0x26u);
                }

                objc_msgSend(v70, "addObjectsFromArray:", v48);
              }
            }
            v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v72, v88, 16);
          }
          while (v50);
        }

        v43 = v68 + 1;
      }
      while (v68 + 1 != v67);
      v67 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v76, v89, 16);
    }
    while (v67);
  }

  WALogCategoryDefaultHandle();
  v55 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v70, "allObjects");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "componentsJoinedByString:", CFSTR(", "));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446722;
    v92 = "-[LinkChangePolicyHandler pruneNetworksFailingBssidPatternAndIpConfigChangeChecks:ipAddr:routerIp:routerMAC:]";
    v93 = 1024;
    v94 = 361;
    v95 = 2112;
    v96 = (uint64_t)v57;
    _os_log_impl(&dword_212581000, v55, OS_LOG_TYPE_INFO, "%{public}s::%d:Pruning ssids: %@", buf, 0x1Cu);

  }
  objc_msgSend(obj, "minusSet:", v70);

}

- (AnalyticsStoreMOHandler)storeMOHandler
{
  return self->_storeMOHandler;
}

- (void)setStoreMOHandler:(id)a3
{
  objc_storeStrong((id *)&self->_storeMOHandler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeMOHandler, 0);
}

@end
