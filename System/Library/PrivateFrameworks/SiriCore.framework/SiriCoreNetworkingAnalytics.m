@implementation SiriCoreNetworkingAnalytics

+ (int)connectionModeFromString:(id)a3
{
  void *v3;
  int v4;

  objc_msgSend(a3, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("assistant")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("assistantanddictation")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (int)sessionTypeFromString:(id)a3
{
  void *v3;
  int v4;

  objc_msgSend(a3, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("local")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("remote")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("remotelimited")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("remotefull")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (int)sessionStateFromString:(id)a3
{
  void *v3;
  int v4;

  objc_msgSend(a3, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("initial")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("waiting")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("retrywaiting")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("connectionstarted")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("connectionopened")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("openeddormant")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("authenticating")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("holding")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("createassistant")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("loadassistant")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("destroyassistant")) & 1) != 0)
  {
    v4 = 11;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("active")))
  {
    v4 = 12;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)sessionConnectionFailedError:(id)a3 connectionMode:(id)a4 sessionType:(id)a5 sessionState:(id)a6 dormant:(BOOL)a7 analysisInfo:(id)a8
{
  id v13;
  objc_class *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v38;
  id v39;
  _BOOL4 v40;

  v40 = a7;
  v13 = a3;
  v14 = (objc_class *)MEMORY[0x24BE95340];
  v15 = a8;
  v39 = a6;
  v38 = a5;
  v16 = a4;
  v17 = objc_alloc_init(v14);
  if (v13)
  {
    v18 = objc_alloc_init(MEMORY[0x24BE952F8]);
    objc_msgSend(v13, "domain");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDomain:", v19);

    objc_msgSend(v13, "description");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDescription:", v20);

    objc_msgSend(v18, "setErrorCode:", objc_msgSend(v13, "code"));
  }
  else
  {
    v18 = 0;
  }
  objc_msgSend(v13, "userInfo");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *MEMORY[0x24BDD1398];
  objc_msgSend(v21, "objectForKey:", *MEMORY[0x24BDD1398]);
  v23 = (id)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v13, "userInfo");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKey:", v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_alloc_init(MEMORY[0x24BE952F8]);
    objc_msgSend(v25, "domain");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setDomain:", v26);

    objc_msgSend(v25, "description");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setDescription:", v27);

    objc_msgSend(v23, "setErrorCode:", objc_msgSend(v25, "code"));
  }
  objc_msgSend(v15, "connectionType");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  SiriCoreConnectionTechnologyGetDescription(objc_msgSend(v28, "technology"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "sendBufferSize");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "doubleValue");
  v32 = (unint64_t)v31;

  objc_msgSend(v17, "setConnectionType:", objc_msgSend(a1, "connectionTypeFromString:", v29));
  v33 = objc_msgSend(a1, "connectionModeFromString:", v16);

  objc_msgSend(v17, "setConnectionMode:", v33);
  v34 = objc_msgSend(a1, "sessionTypeFromString:", v38);

  objc_msgSend(v17, "setSessionType:", v34);
  v35 = objc_msgSend(a1, "sessionStateFromString:", v39);

  objc_msgSend(v17, "setNetworkSessionState:", v35);
  objc_msgSend(v17, "setIsWwanPreferred:", objc_msgSend(v15, "wwanPreferred"));
  objc_msgSend(v17, "setIsDormant:", v40);
  objc_msgSend(v17, "setSendBufferSize:", v32);
  objc_msgSend(v15, "policyId");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setPolicyId:", v36);
  objc_msgSend(v17, "setError:", v18);
  objc_msgSend(v17, "setUnderlyingError:", v23);

  return v17;
}

+ (int)snapshotStateFromStringEvent:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("requestEnd"));
}

+ (int)tlsFromString:(id)a3
{
  void *v3;
  int v4;

  objc_msgSend(a3, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("tls14")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("tls13")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("tls12")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("tls11")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("tls10")) & 1) != 0)
  {
    v4 = 2;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("ssl30"));
  }

  return v4;
}

+ (int)connectionMethodFromString:(id)a3
{
  void *v3;
  int v4;

  objc_msgSend(a3, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "containsString:", CFSTR("peer")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "containsString:", CFSTR("tuscany")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "containsString:", CFSTR("florence")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "containsString:", CFSTR("mptcp_policybanned")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "containsString:", CFSTR("tcp_policybanned")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("mptcp")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("tcp")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (int)connectionTypeFromString:(id)a3
{
  void *v3;
  int v4;

  objc_msgSend(a3, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "containsString:", CFSTR("wi-fi")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "containsString:", CFSTR("wwan")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "containsString:", CFSTR("utran")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "containsString:", CFSTR("2g cdma1x")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "containsString:", CFSTR("lte")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "containsString:", CFSTR("2g gprs")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "containsString:", CFSTR("2g edge")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "containsString:", CFSTR("3g wcdma")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "containsString:", CFSTR("3g hsdpa")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "containsString:", CFSTR("3g evdorev0")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "containsString:", CFSTR("3g evdoreva")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "containsString:", CFSTR("cdma evdorevb")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "containsString:", CFSTR("hrpd")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("mptcp")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "containsString:", CFSTR("lednelly")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "containsString:", CFSTR("ids")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "containsString:", CFSTR("pop")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "containsString:", CFSTR("florence")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "containsString:", CFSTR("local")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("nwmptcp")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("5g nrnsa")) & 1) != 0)
  {
    v4 = 21;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("5g nr")))
  {
    v4 = 22;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)networkInterfacesFromDictionary:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = (objc_class *)MEMORY[0x24BDBCEB8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __90__SiriCoreNetworkingAnalytics_SessionConnectionSnapshot__networkInterfacesFromDictionary___block_invoke;
  v9[3] = &unk_24CCE61D0;
  v11 = a1;
  v7 = v6;
  v10 = v7;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);

  return v7;
}

+ (id)sessionConnectionNetworkFromSiriCoreConnectionMetrics:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  double v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  double v30;
  void *v31;
  double v32;
  void *v33;
  double v34;
  void *v35;
  double v36;

  v4 = (objc_class *)MEMORY[0x24BE95350];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v5, "carrierName");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = &stru_24CCE7768;
  objc_msgSend(v6, "setCarrierName:", v9);

  objc_msgSend(v5, "connectionMethod");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConnectionMethod:", objc_msgSend(a1, "connectionMethodFromString:", v10));

  objc_msgSend(v5, "primarySubflowInterfaceName");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (const __CFString *)v11;
  else
    v13 = &stru_24CCE7768;
  objc_msgSend(v6, "setPrimarySubflowInterfaceName:", v13);

  objc_msgSend(v5, "isCaptive");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIsCaptive:", objc_msgSend(v14, "BOOLValue"));

  objc_msgSend(v5, "rssi");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  objc_msgSend(v6, "setRssi:");

  objc_msgSend(v5, "snr");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  objc_msgSend(v6, "setSnr:");

  objc_msgSend(v5, "cca");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "doubleValue");
  objc_msgSend(v6, "setClearChannelAssessmentScore:");

  objc_msgSend(v5, "attemptCount");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "doubleValue");
  objc_msgSend(v6, "setAttempCount:", v19);

  objc_msgSend(v5, "timeUntilFirstByteRead");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "doubleValue");
  objc_msgSend(v6, "setFirstByteTime:", (unint64_t)(v21 * 1000.0));

  objc_msgSend(v5, "connectionStartTimeToDNSResolutionTimeMsec");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "doubleValue");
  objc_msgSend(v6, "setStartToDNSResolution:", (unint64_t)v23);

  objc_msgSend(v5, "dnsResolutionTime");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "doubleValue");
  objc_msgSend(v6, "setDnsResolutionTime:", (unint64_t)v25);

  objc_msgSend(v5, "tlsVersion");
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v26;
  if (v26)
    v28 = (const __CFString *)v26;
  else
    v28 = &stru_24CCE7768;
  objc_msgSend(v6, "setTlsVersion:", objc_msgSend(a1, "tlsFromString:", v28));

  objc_msgSend(v5, "tlsHandshakeTimeMsec");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "doubleValue");
  objc_msgSend(v6, "setTlsHandshakeTime:", (unint64_t)v30);

  objc_msgSend(v5, "connectionEstablishmentTimeMsec");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "doubleValue");
  objc_msgSend(v6, "setConnectionEstablishmentTime:", (unint64_t)v32);

  objc_msgSend(v5, "connectionStartTimeToConnectionEstablishmentTimeMsec");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "doubleValue");
  objc_msgSend(v6, "setConnectionStartToEstablishmentTime:", (unint64_t)v34);

  objc_msgSend(v5, "connectionStartTimeToTLSHandshakeTimeMsec");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v35, "doubleValue");
  objc_msgSend(v6, "setConnectionStartToTLSHandshake:", (unint64_t)v36);

  return v6;
}

+ (int)phyModeFromString:(id)a3
{
  void *v3;
  int v4;

  objc_msgSend(a3, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("802.11a")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("802.11b")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("802.11g")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("802.11n")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("802.11ac")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("802.11ax")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("802.11aj")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("802.11ah")) & 1) != 0)
  {
    v4 = 8;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("802.11ad")))
  {
    v4 = 9;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)debugSessionConnectionNetworkFromSiriCoreConnectionMetrics:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;

  v4 = (objc_class *)MEMORY[0x24BE952D0];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v5, "wifiPhyMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWiFiPhyMode:", objc_msgSend(a1, "phyModeFromString:", v7));

  objc_msgSend(v5, "signalStrengthBars");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  objc_msgSend(v6, "setSignalStrengthBars:");

  objc_msgSend(v5, "timeUntilOpen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  objc_msgSend(v6, "setOpenTimeInMs:", v10 * 1000.0);

  objc_msgSend(v5, "connectedSubflowCount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "doubleValue");
  objc_msgSend(v6, "setConnectedSubflowCount:", v12);

  return v6;
}

+ (id)debugNetworkInterfacesFromSiriCoreConnectionMetrics:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v4, "tcpInfoMetricsByInterfaceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __110__SiriCoreNetworkingAnalytics_SessionConnectionSnapshot__debugNetworkInterfacesFromSiriCoreConnectionMetrics___block_invoke;
  v12[3] = &unk_24CCE6220;
  v13 = v4;
  v15 = a1;
  v7 = v5;
  v14 = v7;
  v8 = v4;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v12);

  v9 = v14;
  v10 = v7;

  return v10;
}

+ (id)pingInfoFromSiriCoreConnectionMetrics:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  double v11;

  v3 = (objc_class *)MEMORY[0x24BE952D8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "pingCount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  objc_msgSend(v5, "setPingCount:", v7);

  objc_msgSend(v4, "meanPing");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  objc_msgSend(v5, "setMeanPingInMs:", v9 * 1000.0);

  objc_msgSend(v4, "unacknowledgedPingCount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "doubleValue");
  objc_msgSend(v5, "setUnacknowledgedPingCount:", v11);

  return v5;
}

+ (int)qualityFromString:(id)a3
{
  void *v3;
  int v4;

  objc_msgSend(a3, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("bad")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("good")) & 1) != 0)
  {
    v4 = 2;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("unavailable"));
  }

  return v4;
}

+ (id)sessionConnectionQualityFromSiriCoreConnectionMetrics:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[9];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int v24;

  v4 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  objc_msgSend(v4, "symptomsBasedNetworkQuality");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __112__SiriCoreNetworkingAnalytics_SessionConnectionSnapshot__sessionConnectionQualityFromSiriCoreConnectionMetrics___block_invoke;
  v8[3] = &unk_24CCE6248;
  v8[7] = &v9;
  v8[8] = a1;
  v8[4] = &v21;
  v8[5] = &v17;
  v8[6] = &v13;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);

  v6 = objc_alloc_init(MEMORY[0x24BE952E0]);
  objc_msgSend(v6, "setSymptomsCellularHistorical:", *((unsigned int *)v18 + 6));
  objc_msgSend(v6, "setSymptomsCellularInstant:", *((unsigned int *)v22 + 6));
  objc_msgSend(v6, "setSymptomsWiFiHistorical:", *((unsigned int *)v10 + 6));
  objc_msgSend(v6, "setSymptomsWiFiInstant:", *((unsigned int *)v14 + 6));
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v6;
}

+ (int)providerFromString:(id)a3
{
  void *v3;
  int v4;
  objc_class *v5;
  void *v6;
  void *v7;
  char v8;
  objc_class *v9;
  void *v10;
  void *v11;
  int v12;

  objc_msgSend(a3, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("adpeerconnectionprovider")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lowercaseString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v3, "isEqualToString:", v7);

    if ((v8 & 1) != 0)
    {
      v4 = 3;
    }
    else
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lowercaseString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v3, "isEqualToString:", v11);

      if (v12)
        v4 = 2;
      else
        v4 = 0;
    }
  }

  return v4;
}

void __112__SiriCoreNetworkingAnalytics_SessionConnectionSnapshot__sessionConnectionQualityFromSiriCoreConnectionMetrics___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  objc_msgSend(a2, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("cellularinstant")))
  {
    v6 = objc_msgSend(*(id *)(a1 + 64), "qualityFromString:", v8);
    v7 = a1 + 32;
LABEL_9:
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v7 + 8) + 24) = v6;
    goto LABEL_10;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("cellularhistorical")))
  {
    v6 = objc_msgSend(*(id *)(a1 + 64), "qualityFromString:", v8);
    v7 = a1 + 40;
    goto LABEL_9;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("wifiinstant")))
  {
    v6 = objc_msgSend(*(id *)(a1 + 64), "qualityFromString:", v8);
    v7 = a1 + 48;
    goto LABEL_9;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("wifihistorical")))
  {
    v6 = objc_msgSend(*(id *)(a1 + 64), "qualityFromString:", v8);
    v7 = a1 + 56;
    goto LABEL_9;
  }
LABEL_10:

}

void __110__SiriCoreNetworkingAnalytics_SessionConnectionSnapshot__debugNetworkInterfacesFromSiriCoreConnectionMetrics___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  double v30;
  void *v31;
  double v32;
  void *v33;
  double v34;
  void *v35;
  double v36;
  void *v37;
  double v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  double v43;
  void *v44;
  uint64_t v45;
  id v46;
  id v47;
  _QWORD v48[4];
  id v49;
  id v50;
  uint64_t v51;

  v5 = a2;
  v6 = (objc_class *)MEMORY[0x24BE952C8];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  objc_msgSend(v7, "rttCurrent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  objc_msgSend(v8, "setRttCurrent:", v10);

  objc_msgSend(v7, "rttSmoothed");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  objc_msgSend(v8, "setRttSmoothed:", v12);

  objc_msgSend(v7, "rttVariance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  objc_msgSend(v8, "setRttVariance:", v14);

  objc_msgSend(v7, "rttBest");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  objc_msgSend(v8, "setRttBest:", v16);

  objc_msgSend(v7, "packetsSent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "doubleValue");
  objc_msgSend(v8, "setPacketsSent:", (unint64_t)v18);

  objc_msgSend(v7, "packetsReceived");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "doubleValue");
  objc_msgSend(v8, "setPacketsReceived:", (unint64_t)v20);

  objc_msgSend(v7, "bytesSent");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "doubleValue");
  objc_msgSend(v8, "setBytesSent:", (unint64_t)v22);

  objc_msgSend(v7, "bytesRetransmitted");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "doubleValue");
  objc_msgSend(v8, "setBytesRetransmitted:", (unint64_t)v24);

  objc_msgSend(v7, "bytesUnacked");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "doubleValue");
  objc_msgSend(v8, "setBytesUnacked:", (unint64_t)v26);

  objc_msgSend(v7, "bytesReceived");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "doubleValue");
  objc_msgSend(v8, "setBytesReceived:", (unint64_t)v28);

  objc_msgSend(v7, "duplicateBytesReceived");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "doubleValue");
  objc_msgSend(v8, "setDuplicateBytesReceived:", (unint64_t)v30);

  objc_msgSend(v7, "outOfOrderBytesReceived");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "doubleValue");
  objc_msgSend(v8, "setOutOfOrderBytesReceived:", (unint64_t)v32);

  objc_msgSend(v7, "sendBufferBytes");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "doubleValue");
  objc_msgSend(v8, "setSendBufferBytes:", (unint64_t)v34);

  objc_msgSend(v7, "sendBandwidth");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "doubleValue");
  objc_msgSend(v8, "setSendBandwidth:", (unint64_t)v36);

  objc_msgSend(v7, "synRetransmits");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "doubleValue");
  objc_msgSend(v8, "setSynRetransmits:", v38);

  objc_msgSend(v7, "tfoSynDataAcked");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v39, "doubleValue");
  objc_msgSend(v8, "setTfoSynDataAcked:", v40);

  objc_msgSend(*(id *)(a1 + 32), "subflowSwitchCounts");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "objectForKeyedSubscript:", v5);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "doubleValue");
  objc_msgSend(v8, "setSubflowSwitchCount:", v43);

  objc_msgSend(*(id *)(a1 + 32), "flowNetworkInterfaceType");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = MEMORY[0x24BDAC760];
  v48[1] = 3221225472;
  v48[2] = __110__SiriCoreNetworkingAnalytics_SessionConnectionSnapshot__debugNetworkInterfacesFromSiriCoreConnectionMetrics___block_invoke_2;
  v48[3] = &unk_24CCE61F8;
  v45 = *(_QWORD *)(a1 + 48);
  v50 = v8;
  v51 = v45;
  v49 = v5;
  v46 = v8;
  v47 = v5;
  objc_msgSend(v44, "enumerateKeysAndObjectsUsingBlock:", v48);

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v46);
}

void __110__SiriCoreNetworkingAnalytics_SessionConnectionSnapshot__debugNetworkInterfacesFromSiriCoreConnectionMetrics___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  const __CFString *v9;
  __CFString *v10;

  v10 = a2;
  v7 = a3;
  if (v7 && -[__CFString isEqualToString:](v10, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    v8 = objc_alloc_init(MEMORY[0x24BE95320]);
    if (v10)
      v9 = v10;
    else
      v9 = &stru_24CCE7768;
    objc_msgSend(v8, "setName:", v9);
    objc_msgSend(v8, "setConnectionType:", objc_msgSend(*(id *)(a1 + 48), "connectionTypeFromString:", v7));
    objc_msgSend(*(id *)(a1 + 40), "setNetworkInterface:", v8);
    *a4 = 1;

  }
}

void __90__SiriCoreNetworkingAnalytics_SessionConnectionSnapshot__networkInterfacesFromDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  __CFString *v7;
  id v8;
  const __CFString *v9;
  uint64_t v10;
  id v11;

  if (a3)
  {
    v5 = (objc_class *)MEMORY[0x24BE95320];
    v6 = a3;
    v7 = a2;
    v8 = objc_alloc_init(v5);
    v11 = v8;
    if (v7)
      v9 = v7;
    else
      v9 = &stru_24CCE7768;
    objc_msgSend(v8, "setName:", v9);

    v10 = objc_msgSend(*(id *)(a1 + 40), "connectionTypeFromString:", v6);
    objc_msgSend(v11, "setConnectionType:", v10);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);

  }
}

+ (int)endpointTypeFromNumber:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToNumber:", &unk_24CCF5438) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToNumber:", &unk_24CCF5450) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToNumber:", &unk_24CCF5468) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToNumber:", &unk_24CCF5480) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToNumber:", &unk_24CCF5498))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)endpointFromDictionary:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BE952F0]);
  objc_msgSend(v4, "objectForKey:", CFSTR("type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("type"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &unk_24CCF5438;
  }
  objc_msgSend(v5, "setType:", objc_msgSend(a1, "endpointTypeFromNumber:", v7));
  if (v6)

  objc_msgSend(v4, "objectForKey:", CFSTR("port"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("port"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    objc_msgSend(v5, "setPort:", v10);

  }
  else
  {
    objc_msgSend(v5, "setPort:", 0);
  }

  return v5;
}

+ (id)endpointsFromArray:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(a1, "endpointFromDictionary:", v11, (_QWORD)v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

+ (int)pathTypeFromNumber:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToNumber:", &unk_24CCF5438) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToNumber:", &unk_24CCF5450) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToNumber:", &unk_24CCF5468) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToNumber:", &unk_24CCF5480) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToNumber:", &unk_24CCF5498))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)pathInterfacesFromArray:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  id v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v21 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = v9;
          v11 = objc_alloc_init(MEMORY[0x24BE95328]);
          objc_msgSend(v10, "objectForKey:", CFSTR("type"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            objc_msgSend(v10, "objectForKey:", CFSTR("type"));
            v3 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = v3;
          }
          else
          {
            v13 = &unk_24CCF5438;
          }
          objc_msgSend(v11, "setType:", objc_msgSend(a1, "pathTypeFromNumber:", v13));
          if (v12)

          objc_msgSend(v10, "objectForKey:", CFSTR("name"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            objc_msgSend(v10, "objectForKey:", CFSTR("name"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setName:", v15);

          }
          else
          {
            objc_msgSend(v11, "setName:", &stru_24CCE7768);
          }

          objc_msgSend(v10, "objectForKey:", CFSTR("index"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            objc_msgSend(v10, "objectForKey:", CFSTR("index"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "doubleValue");
            objc_msgSend(v11, "setIndex:", v18);

          }
          else
          {
            objc_msgSend(v11, "setIndex:", 0);
          }

          objc_msgSend(v21, "addObject:", v11);
        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v6);
  }

  return v21;
}

+ (int)pathStatusFromNumber:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToNumber:", &unk_24CCF5438) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToNumber:", &unk_24CCF5450) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToNumber:", &unk_24CCF5468) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToNumber:", &unk_24CCF5480))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)establishmentResolutionFromArray:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  id v29;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v29 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v33 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = v10;
          v12 = objc_alloc_init(MEMORY[0x24BE95300]);
          objc_msgSend(v11, "objectForKey:", CFSTR("duration"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            objc_msgSend(v11, "objectForKey:", CFSTR("duration"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "doubleValue");
            objc_msgSend(v12, "setDuration:", (unint64_t)v15);

          }
          else
          {
            objc_msgSend(v12, "setDuration:", 0);
          }

          objc_msgSend(v11, "objectForKey:", CFSTR("resolutionSource"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            objc_msgSend(v11, "objectForKey:", CFSTR("resolutionSource"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "doubleValue");
            objc_msgSend(v12, "setResolutionSource:", v18);

          }
          else
          {
            objc_msgSend(v12, "setResolutionSource:", 0);
          }

          objc_msgSend(v11, "objectForKey:", CFSTR("successfulEndpoint"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            objc_msgSend(v11, "objectForKey:", CFSTR("successfulEndpoint"));
            v4 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v4;
          }
          else
          {
            v20 = &unk_24CCF5438;
          }
          objc_msgSend(a1, "endpointFromDictionary:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setSuccessfulEndpoint:", v21);

          if (v19)
          objc_msgSend(v11, "objectForKey:", CFSTR("preferredEndpoint"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            objc_msgSend(v11, "objectForKey:", CFSTR("preferredEndpoint"));
            v3 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v3;
          }
          else
          {
            v23 = &unk_24CCF5438;
          }
          objc_msgSend(a1, "endpointFromDictionary:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setPreferredEndpoint:", v24);

          if (v22)
          objc_msgSend(v11, "objectForKey:", CFSTR("endpointCount"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25)
          {
            objc_msgSend(v11, "objectForKey:", CFSTR("endpointCount"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "doubleValue");
            objc_msgSend(v12, "setEndpointCount:", v27);

          }
          else
          {
            objc_msgSend(v12, "setEndpointCount:", 0);
          }

          objc_msgSend(v29, "addObject:", v12);
        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v7);
  }

  return v29;
}

+ (id)proxyConfigurationFromDictionary:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BE95338]);
  objc_msgSend(v3, "objectForKey:", CFSTR("proxyConfigured"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("proxyConfigured"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIsProxyConfigured:", objc_msgSend(v6, "BOOLValue"));

  }
  else
  {
    objc_msgSend(v4, "setIsProxyConfigured:", 0);
  }

  objc_msgSend(v3, "objectForKey:", CFSTR("usingConfiguredProxy"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("usingConfiguredProxy"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUsingConfiguredProxy:", objc_msgSend(v8, "BOOLValue"));

  }
  else
  {
    objc_msgSend(v4, "setUsingConfiguredProxy:", 0);
  }

  return v4;
}

+ (int)handshakeProtocolFromString:(id)a3
{
  void *v3;
  int v4;

  objc_msgSend(a3, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "containsString:", CFSTR("tcp")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "containsString:", CFSTR("tls")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "containsString:", CFSTR("http")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)handShakeProtocolFromArray:(id)a3
{
  __CFString *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  id v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  id v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v22 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = v9;
          v11 = objc_alloc_init(MEMORY[0x24BE95308]);
          objc_msgSend(v10, "objectForKey:", CFSTR("protocol"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            objc_msgSend(v10, "objectForKey:", CFSTR("protocol"));
            v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v13 = v3;
          }
          else
          {
            v13 = &stru_24CCE7768;
          }
          objc_msgSend(v11, "setProtocol:", objc_msgSend(a1, "handshakeProtocolFromString:", v13));
          if (v12)

          objc_msgSend(v10, "objectForKey:", CFSTR("handShakeRTT"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            objc_msgSend(v10, "objectForKey:", CFSTR("handShakeRTT"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "doubleValue");
            objc_msgSend(v11, "setHandShakeRTT:", v16);

          }
          else
          {
            objc_msgSend(v11, "setHandShakeRTT:", 0);
          }

          objc_msgSend(v10, "objectForKey:", CFSTR("handShakeDuration"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            objc_msgSend(v10, "objectForKey:", CFSTR("handShakeDuration"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "doubleValue");
            objc_msgSend(v11, "setHandShakeDuration:", (unint64_t)v19);

          }
          else
          {
            objc_msgSend(v11, "setHandShakeDuration:", 0);
          }

          objc_msgSend(v22, "addObject:", v11);
        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v6);
  }

  return v22;
}

- (SiriCoreNetworkingAnalytics)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SiriCoreNetworkingAnalytics.m"), 55, CFSTR("%s is marked as NS_UNAVAILABLE. Use the designated initializer instead."), "-[SiriCoreNetworkingAnalytics init]");

  return 0;
}

- (id)_init
{
  SiriCoreNetworkingAnalytics *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  uint64_t v7;
  SiriCoreNetEventMessage *httpHeaderEvent;
  uint64_t v9;
  SiriCoreNetEventMessage *preparationSnapshotEvent;
  uint64_t v11;
  SiriCoreNetEventMessage *debugPreparationSnapshotEvent;
  uint64_t v13;
  SiriCoreNetEventMessage *readySnapshotEvent;
  uint64_t v15;
  SiriCoreNetEventMessage *debugReadySnapshotEvent;
  uint64_t v17;
  SiriCoreNetEventMessage *sessionConnectionSnapthotEvent;
  uint64_t v19;
  SiriCoreNetEventMessage *debugSessionConnectionSnapthotEvent;
  uint64_t v21;
  SiriCoreNetEventMessage *sessionConnectionFailedEvent;
  uint64_t v23;
  SiriCoreNetEventMessage *peerConnectionFailedEvent;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)SiriCoreNetworkingAnalytics;
  v2 = -[SiriCoreNetworkingAnalytics init](&v26, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = dispatch_queue_create("com.apple.assistantd.siricore.networking.analytics", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v2->_sequenceNumber = 0;
    *(_WORD *)&v2->_isConnectionActive = 0;
    v7 = objc_opt_new();
    httpHeaderEvent = v2->_httpHeaderEvent;
    v2->_httpHeaderEvent = (SiriCoreNetEventMessage *)v7;

    v9 = objc_opt_new();
    preparationSnapshotEvent = v2->_preparationSnapshotEvent;
    v2->_preparationSnapshotEvent = (SiriCoreNetEventMessage *)v9;

    v11 = objc_opt_new();
    debugPreparationSnapshotEvent = v2->_debugPreparationSnapshotEvent;
    v2->_debugPreparationSnapshotEvent = (SiriCoreNetEventMessage *)v11;

    v13 = objc_opt_new();
    readySnapshotEvent = v2->_readySnapshotEvent;
    v2->_readySnapshotEvent = (SiriCoreNetEventMessage *)v13;

    v15 = objc_opt_new();
    debugReadySnapshotEvent = v2->_debugReadySnapshotEvent;
    v2->_debugReadySnapshotEvent = (SiriCoreNetEventMessage *)v15;

    v17 = objc_opt_new();
    sessionConnectionSnapthotEvent = v2->_sessionConnectionSnapthotEvent;
    v2->_sessionConnectionSnapthotEvent = (SiriCoreNetEventMessage *)v17;

    v19 = objc_opt_new();
    debugSessionConnectionSnapthotEvent = v2->_debugSessionConnectionSnapthotEvent;
    v2->_debugSessionConnectionSnapthotEvent = (SiriCoreNetEventMessage *)v19;

    v21 = objc_opt_new();
    sessionConnectionFailedEvent = v2->_sessionConnectionFailedEvent;
    v2->_sessionConnectionFailedEvent = (SiriCoreNetEventMessage *)v21;

    v23 = objc_opt_new();
    peerConnectionFailedEvent = v2->_peerConnectionFailedEvent;
    v2->_peerConnectionFailedEvent = (SiriCoreNetEventMessage *)v23;

  }
  return v2;
}

- (void)reset
{
  -[SiriCoreNetworkingAnalytics resetNetId](self, "resetNetId");
  -[SiriCoreNetworkingAnalytics resetSequenceNumber](self, "resetSequenceNumber");
}

- (void)resetNetId
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__SiriCoreNetworkingAnalytics_resetNetId__block_invoke;
  block[3] = &unk_24CCE6BA8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)setNetId:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __40__SiriCoreNetworkingAnalytics_setNetId___block_invoke;
  v7[3] = &unk_24CCE6BD0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)setNetworkConnectionId:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__SiriCoreNetworkingAnalytics_setNetworkConnectionId___block_invoke;
  v7[3] = &unk_24CCE6BD0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)setConnectionProvider:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__SiriCoreNetworkingAnalytics_setConnectionProvider___block_invoke;
  v7[3] = &unk_24CCE6BD0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (unsigned)getSequenceNumber
{
  NSObject *queue;
  unsigned int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __48__SiriCoreNetworkingAnalytics_getSequenceNumber__block_invoke;
  v5[3] = &unk_24CCE6730;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setIsConnectionActive:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __53__SiriCoreNetworkingAnalytics_setIsConnectionActive___block_invoke;
  v4[3] = &unk_24CCE6670;
  v4[4] = self;
  v5 = a3;
  dispatch_async(queue, v4);
}

- (void)setNetIdAvailable:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __49__SiriCoreNetworkingAnalytics_setNetIdAvailable___block_invoke;
  v4[3] = &unk_24CCE6670;
  v4[4] = self;
  v5 = a3;
  dispatch_async(queue, v4);
}

- (BOOL)isNetIdAvailable
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __47__SiriCoreNetworkingAnalytics_isNetIdAvailable__block_invoke;
  v5[3] = &unk_24CCE6730;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)increaseSequenceNumber
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__SiriCoreNetworkingAnalytics_increaseSequenceNumber__block_invoke;
  block[3] = &unk_24CCE6BA8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)resetSequenceNumber
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__SiriCoreNetworkingAnalytics_resetSequenceNumber__block_invoke;
  block[3] = &unk_24CCE6BA8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)setOrchestratorRequestId:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__SiriCoreNetworkingAnalytics_setOrchestratorRequestId___block_invoke;
  v7[3] = &unk_24CCE6BD0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (id)orchestratorRequestId
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2165;
  v10 = __Block_byref_object_dispose__2166;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __52__SiriCoreNetworkingAnalytics_orchestratorRequestId__block_invoke;
  v5[3] = &unk_24CCE6730;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)emitLogDebug
{
  if (arc4random_uniform(0xAu))
    return AFIsInternalInstall();
  else
    return 1;
}

- (id)_createRequestLinkInfoFromUUID:(id)a3 component:(int)a4
{
  uint64_t v4;
  objc_class *v5;
  id v6;
  void *v7;
  id v8;

  v4 = *(_QWORD *)&a4;
  v5 = (objc_class *)MEMORY[0x24BE95C78];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithNSUUID:", v6);

  v8 = objc_alloc_init(MEMORY[0x24BE95B68]);
  objc_msgSend(v8, "setUuid:", v7);
  objc_msgSend(v8, "setComponent:", v4);

  return v8;
}

- (id)_createSchemaClientEventFromNetId:(id)a3 networkConnectionId:(id)a4 connectionProvider:(int)a5
{
  uint64_t v5;
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = *(_QWORD *)&a5;
  v7 = (objc_class *)MEMORY[0x24BE952A8];
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(v7);
  v11 = objc_alloc_init(MEMORY[0x24BE952B0]);
  objc_msgSend(v10, "setEventMetadata:", v11);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE95C78]), "initWithNSUUID:", v9);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE95C78]), "initWithNSUUID:", v8);

  objc_msgSend(v10, "eventMetadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setNetId:", v12);

  objc_msgSend(v10, "eventMetadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setNetworkConnectionId:", v13);

  objc_msgSend(v10, "eventMetadata");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setProvider:", v5);

  return v10;
}

- (void)_emitAllCachedMessagesFor:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__SiriCoreNetworkingAnalytics__emitAllCachedMessagesFor___block_invoke;
  block[3] = &unk_24CCE6BA8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)logRequestLinkBetweenOrchestratorAndNetworkComponent
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __83__SiriCoreNetworkingAnalytics_logRequestLinkBetweenOrchestratorAndNetworkComponent__block_invoke;
  block[3] = &unk_24CCE6BA8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)logSessionConnectionHttpHeaderCreated:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *queue;
  id v7;
  _QWORD block[5];
  id v9;
  uint64_t v10;

  v4 = a3;
  v5 = mach_absolute_time();
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__SiriCoreNetworkingAnalytics_logSessionConnectionHttpHeaderCreated___block_invoke;
  block[3] = &unk_24CCE6698;
  block[4] = self;
  v9 = v4;
  v10 = v5;
  v7 = v4;
  dispatch_async(queue, block);

}

- (void)logNetworkConnectionStatePreparationSnapshotCaptured:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *queue;
  id v7;
  _QWORD block[5];
  id v9;
  uint64_t v10;

  v4 = a3;
  v5 = mach_absolute_time();
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __84__SiriCoreNetworkingAnalytics_logNetworkConnectionStatePreparationSnapshotCaptured___block_invoke;
  block[3] = &unk_24CCE6698;
  block[4] = self;
  v9 = v4;
  v10 = v5;
  v7 = v4;
  dispatch_async(queue, block);

}

- (void)logDebugNetworkConnectionStatePreparationSnapshotCaptured:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *queue;
  _QWORD block[5];
  id v8;
  uint64_t v9;

  v4 = a3;
  if (-[SiriCoreNetworkingAnalytics emitLogDebug](self, "emitLogDebug"))
  {
    v5 = mach_absolute_time();
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __89__SiriCoreNetworkingAnalytics_logDebugNetworkConnectionStatePreparationSnapshotCaptured___block_invoke;
    block[3] = &unk_24CCE6698;
    block[4] = self;
    v8 = v4;
    v9 = v5;
    dispatch_async(queue, block);

  }
}

- (void)logNetworkConnectionStateReadySnapshotCaptured:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *queue;
  id v7;
  _QWORD block[5];
  id v9;
  uint64_t v10;

  v4 = a3;
  v5 = mach_absolute_time();
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78__SiriCoreNetworkingAnalytics_logNetworkConnectionStateReadySnapshotCaptured___block_invoke;
  block[3] = &unk_24CCE6698;
  block[4] = self;
  v9 = v4;
  v10 = v5;
  v7 = v4;
  dispatch_async(queue, block);

}

- (void)logDebugNetworkConnectionStateReadySnapshotCaptured:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *queue;
  _QWORD block[5];
  id v8;
  uint64_t v9;

  v4 = a3;
  if (-[SiriCoreNetworkingAnalytics emitLogDebug](self, "emitLogDebug"))
  {
    v5 = mach_absolute_time();
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __83__SiriCoreNetworkingAnalytics_logDebugNetworkConnectionStateReadySnapshotCaptured___block_invoke;
    block[3] = &unk_24CCE6698;
    block[4] = self;
    v8 = v4;
    v9 = v5;
    dispatch_async(queue, block);

  }
}

- (void)logSessionConnectionSnapshotCaptured:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *queue;
  id v7;
  _QWORD block[5];
  id v9;
  uint64_t v10;

  v4 = a3;
  v5 = mach_absolute_time();
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__SiriCoreNetworkingAnalytics_logSessionConnectionSnapshotCaptured___block_invoke;
  block[3] = &unk_24CCE6698;
  block[4] = self;
  v9 = v4;
  v10 = v5;
  v7 = v4;
  dispatch_async(queue, block);

}

- (void)logDebugSessionConnectionSnapshotCaptured:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *queue;
  _QWORD block[5];
  id v8;
  uint64_t v9;

  v4 = a3;
  if (-[SiriCoreNetworkingAnalytics emitLogDebug](self, "emitLogDebug"))
  {
    v5 = mach_absolute_time();
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __73__SiriCoreNetworkingAnalytics_logDebugSessionConnectionSnapshotCaptured___block_invoke;
    block[3] = &unk_24CCE6698;
    block[4] = self;
    v8 = v4;
    v9 = v5;
    dispatch_async(queue, block);

  }
}

- (void)logSessionConnectionFailed:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *queue;
  id v7;
  _QWORD block[5];
  id v9;
  uint64_t v10;

  v4 = a3;
  v5 = mach_absolute_time();
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__SiriCoreNetworkingAnalytics_logSessionConnectionFailed___block_invoke;
  block[3] = &unk_24CCE6698;
  block[4] = self;
  v9 = v4;
  v10 = v5;
  v7 = v4;
  dispatch_async(queue, block);

}

- (void)logPeerConnectionFailed:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *queue;
  id v7;
  _QWORD block[5];
  id v9;
  uint64_t v10;

  v4 = a3;
  v5 = mach_absolute_time();
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__SiriCoreNetworkingAnalytics_logPeerConnectionFailed___block_invoke;
  block[3] = &unk_24CCE6698;
  block[4] = self;
  v9 = v4;
  v10 = v5;
  v7 = v4;
  dispatch_async(queue, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_netIdForRequestLink, 0);
  objc_storeStrong((id *)&self->_peerConnectionFailedEvent, 0);
  objc_storeStrong((id *)&self->_sessionConnectionFailedEvent, 0);
  objc_storeStrong((id *)&self->_debugSessionConnectionSnapthotEvent, 0);
  objc_storeStrong((id *)&self->_sessionConnectionSnapthotEvent, 0);
  objc_storeStrong((id *)&self->_debugReadySnapshotEvent, 0);
  objc_storeStrong((id *)&self->_readySnapshotEvent, 0);
  objc_storeStrong((id *)&self->_debugPreparationSnapshotEvent, 0);
  objc_storeStrong((id *)&self->_preparationSnapshotEvent, 0);
  objc_storeStrong((id *)&self->_httpHeaderEvent, 0);
  objc_storeStrong((id *)&self->_orchestratorRequestId, 0);
  objc_storeStrong((id *)&self->_networkConnectionId, 0);
  objc_storeStrong((id *)&self->_netId, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __55__SiriCoreNetworkingAnalytics_logPeerConnectionFailed___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  int v22;
  const char *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 16))
  {
    v10 = *MEMORY[0x24BE08FA0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
      return;
    v22 = 136315138;
    v23 = "-[SiriCoreNetworkingAnalytics logPeerConnectionFailed:]_block_invoke";
    v7 = "%s No netId generated";
    v8 = v10;
    v9 = 12;
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(v1 + 120), "netId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

  if (v4)
  {
    v5 = *MEMORY[0x24BE08FA0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
      return;
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    v22 = 136315394;
    v23 = "-[SiriCoreNetworkingAnalytics logPeerConnectionFailed:]_block_invoke";
    v24 = 2112;
    v25 = v6;
    v7 = "%s Peer connection failed already sent for netId %@";
    v8 = v5;
    v9 = 22;
LABEL_7:
    _os_log_impl(&dword_211AB2000, v8, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v22, v9);
    return;
  }
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 120);
  v13 = (void *)objc_msgSend(*(id *)(v11 + 16), "copy");
  objc_msgSend(v12, "setNetId:", v13);

  objc_msgSend(*(id *)(a1 + 32), "_createSchemaClientEventFromNetId:networkConnectionId:connectionProvider:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 32));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPeerConnectionFailed:", *(_QWORD *)(a1 + 40));
  v15 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128));
  v16 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  if ((v15 & 1) != 0)
  {
    objc_msgSend(v16, "setClientEvent:", 0);
    objc_msgSend(MEMORY[0x24BE909B0], "sharedStream");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "emitMessage:timestamp:", v14, *(_QWORD *)(a1 + 48));

    v18 = *MEMORY[0x24BE08FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
    {
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      v22 = 136315394;
      v23 = "-[SiriCoreNetworkingAnalytics logPeerConnectionFailed:]_block_invoke";
      v24 = 2112;
      v25 = v19;
      v20 = "%s _peerConnectionFailedEvent emitted: %@";
LABEL_13:
      _os_log_impl(&dword_211AB2000, v18, OS_LOG_TYPE_INFO, v20, (uint8_t *)&v22, 0x16u);
    }
  }
  else
  {
    objc_msgSend(v16, "setClientEvent:", v14);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "setTimestamp:", *(_QWORD *)(a1 + 48));
    v18 = *MEMORY[0x24BE08FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
    {
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      v22 = 136315394;
      v23 = "-[SiriCoreNetworkingAnalytics logPeerConnectionFailed:]_block_invoke";
      v24 = 2112;
      v25 = v21;
      v20 = "%s No _netIdForRequestLink for netId: %@";
      goto LABEL_13;
    }
  }

}

void __58__SiriCoreNetworkingAnalytics_logSessionConnectionFailed___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  int v22;
  const char *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 16))
  {
    v10 = *MEMORY[0x24BE08FA0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
      return;
    v22 = 136315138;
    v23 = "-[SiriCoreNetworkingAnalytics logSessionConnectionFailed:]_block_invoke";
    v7 = "%s No netId generated";
    v8 = v10;
    v9 = 12;
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(v1 + 112), "netId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

  if (v4)
  {
    v5 = *MEMORY[0x24BE08FA0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
      return;
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    v22 = 136315394;
    v23 = "-[SiriCoreNetworkingAnalytics logSessionConnectionFailed:]_block_invoke";
    v24 = 2112;
    v25 = v6;
    v7 = "%s Session connection failed already sent for netId %@";
    v8 = v5;
    v9 = 22;
LABEL_7:
    _os_log_impl(&dword_211AB2000, v8, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v22, v9);
    return;
  }
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 112);
  v13 = (void *)objc_msgSend(*(id *)(v11 + 16), "copy");
  objc_msgSend(v12, "setNetId:", v13);

  objc_msgSend(*(id *)(a1 + 32), "_createSchemaClientEventFromNetId:networkConnectionId:connectionProvider:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 32));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSessionConnectionFailed:", *(_QWORD *)(a1 + 40));
  v15 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128));
  v16 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  if ((v15 & 1) != 0)
  {
    objc_msgSend(v16, "setClientEvent:", 0);
    objc_msgSend(MEMORY[0x24BE909B0], "sharedStream");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "emitMessage:timestamp:", v14, *(_QWORD *)(a1 + 48));

    v18 = *MEMORY[0x24BE08FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
    {
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      v22 = 136315394;
      v23 = "-[SiriCoreNetworkingAnalytics logSessionConnectionFailed:]_block_invoke";
      v24 = 2112;
      v25 = v19;
      v20 = "%s _sessionConnectionFailedEvent emitted: %@";
LABEL_13:
      _os_log_impl(&dword_211AB2000, v18, OS_LOG_TYPE_INFO, v20, (uint8_t *)&v22, 0x16u);
    }
  }
  else
  {
    objc_msgSend(v16, "setClientEvent:", v14);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "setTimestamp:", *(_QWORD *)(a1 + 48));
    v18 = *MEMORY[0x24BE08FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
    {
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      v22 = 136315394;
      v23 = "-[SiriCoreNetworkingAnalytics logSessionConnectionFailed:]_block_invoke";
      v24 = 2112;
      v25 = v21;
      v20 = "%s No _netIdForRequestLink for netId: %@";
      goto LABEL_13;
    }
  }

}

void __73__SiriCoreNetworkingAnalytics_logDebugSessionConnectionSnapshotCaptured___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  int v25;
  const char *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 16))
  {
    v10 = *MEMORY[0x24BE08FA0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
      return;
    v25 = 136315138;
    v26 = "-[SiriCoreNetworkingAnalytics logDebugSessionConnectionSnapshotCaptured:]_block_invoke";
    v7 = "%s No netId generated";
    v8 = v10;
    v9 = 12;
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(v1 + 104), "netId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

  if (v4)
  {
    v5 = *MEMORY[0x24BE08FA0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
      return;
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    v25 = 136315394;
    v26 = "-[SiriCoreNetworkingAnalytics logDebugSessionConnectionSnapshotCaptured:]_block_invoke";
    v27 = 2112;
    v28 = v6;
    v7 = "%s Debug session connection snapshot already sent for netId %@";
    v8 = v5;
    v9 = 22;
LABEL_7:
    _os_log_impl(&dword_211AB2000, v8, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v25, v9);
    return;
  }
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 104);
  v13 = (void *)objc_msgSend(*(id *)(v11 + 16), "copy");
  objc_msgSend(v12, "setNetId:", v13);

  objc_msgSend(*(id *)(a1 + 32), "_createSchemaClientEventFromNetId:networkConnectionId:connectionProvider:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 32));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDebugSessionConnectionSnapshotCaptured:", *(_QWORD *)(a1 + 40));
  v15 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128));
  v16 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  if ((v15 & 1) != 0)
  {
    objc_msgSend(v16, "setClientEvent:", 0);
    objc_msgSend(MEMORY[0x24BE909B0], "sharedStream");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "emitMessage:timestamp:", v14, *(_QWORD *)(a1 + 48));

    v18 = (void *)*MEMORY[0x24BE08FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
    {
      v19 = *(_QWORD *)(a1 + 32);
      v20 = *(void **)(a1 + 40);
      v21 = *(_QWORD *)(v19 + 16);
      v22 = v18;
      v25 = 136315650;
      v26 = "-[SiriCoreNetworkingAnalytics logDebugSessionConnectionSnapshotCaptured:]_block_invoke";
      v27 = 2112;
      v28 = v21;
      v29 = 1024;
      v30 = objc_msgSend(v20, "sequenceNumber");
      _os_log_impl(&dword_211AB2000, v22, OS_LOG_TYPE_INFO, "%s _debugSessionConnectionSnapthotEvent emitted: %@, sequenceNumber: %u", (uint8_t *)&v25, 0x1Cu);

    }
  }
  else
  {
    objc_msgSend(v16, "setClientEvent:", v14);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setTimestamp:", *(_QWORD *)(a1 + 48));
    v23 = *MEMORY[0x24BE08FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
    {
      v24 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      v25 = 136315394;
      v26 = "-[SiriCoreNetworkingAnalytics logDebugSessionConnectionSnapshotCaptured:]_block_invoke";
      v27 = 2112;
      v28 = v24;
      _os_log_impl(&dword_211AB2000, v23, OS_LOG_TYPE_INFO, "%s No _netIdForRequestLink for netId: %@", (uint8_t *)&v25, 0x16u);
    }
  }

}

void __68__SiriCoreNetworkingAnalytics_logSessionConnectionSnapshotCaptured___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  int v25;
  const char *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 16))
  {
    v10 = *MEMORY[0x24BE08FA0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
      return;
    v25 = 136315138;
    v26 = "-[SiriCoreNetworkingAnalytics logSessionConnectionSnapshotCaptured:]_block_invoke";
    v7 = "%s No netId generated";
    v8 = v10;
    v9 = 12;
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(v1 + 96), "netId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

  if (v4)
  {
    v5 = *MEMORY[0x24BE08FA0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
      return;
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    v25 = 136315394;
    v26 = "-[SiriCoreNetworkingAnalytics logSessionConnectionSnapshotCaptured:]_block_invoke";
    v27 = 2112;
    v28 = v6;
    v7 = "%s Session connection snapshot already sent for netId %@";
    v8 = v5;
    v9 = 22;
LABEL_7:
    _os_log_impl(&dword_211AB2000, v8, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v25, v9);
    return;
  }
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 96);
  v13 = (void *)objc_msgSend(*(id *)(v11 + 16), "copy");
  objc_msgSend(v12, "setNetId:", v13);

  objc_msgSend(*(id *)(a1 + 32), "_createSchemaClientEventFromNetId:networkConnectionId:connectionProvider:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 32));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSessionConnectionSnapshotCaptured:", *(_QWORD *)(a1 + 40));
  v15 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128));
  v16 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  if ((v15 & 1) != 0)
  {
    objc_msgSend(v16, "setClientEvent:", 0);
    objc_msgSend(MEMORY[0x24BE909B0], "sharedStream");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "emitMessage:timestamp:", v14, *(_QWORD *)(a1 + 48));

    v18 = (void *)*MEMORY[0x24BE08FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
    {
      v19 = *(_QWORD *)(a1 + 32);
      v20 = *(void **)(a1 + 40);
      v21 = *(_QWORD *)(v19 + 16);
      v22 = v18;
      v25 = 136315650;
      v26 = "-[SiriCoreNetworkingAnalytics logSessionConnectionSnapshotCaptured:]_block_invoke";
      v27 = 2112;
      v28 = v21;
      v29 = 1024;
      v30 = objc_msgSend(v20, "sequenceNumber");
      _os_log_impl(&dword_211AB2000, v22, OS_LOG_TYPE_INFO, "%s _sessionConnectionSnapthotEvent emitted: %@, sequenceNumber: %u", (uint8_t *)&v25, 0x1Cu);

    }
  }
  else
  {
    objc_msgSend(v16, "setClientEvent:", v14);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setTimestamp:", *(_QWORD *)(a1 + 48));
    v23 = *MEMORY[0x24BE08FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
    {
      v24 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      v25 = 136315394;
      v26 = "-[SiriCoreNetworkingAnalytics logSessionConnectionSnapshotCaptured:]_block_invoke";
      v27 = 2112;
      v28 = v24;
      _os_log_impl(&dword_211AB2000, v23, OS_LOG_TYPE_INFO, "%s No _netIdForRequestLink for netId: %@", (uint8_t *)&v25, 0x16u);
    }
  }

}

void __83__SiriCoreNetworkingAnalytics_logDebugNetworkConnectionStateReadySnapshotCaptured___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  int v22;
  const char *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 16))
  {
    v10 = *MEMORY[0x24BE08FA0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
      return;
    v22 = 136315138;
    v23 = "-[SiriCoreNetworkingAnalytics logDebugNetworkConnectionStateReadySnapshotCaptured:]_block_invoke";
    v7 = "%s No netId generated";
    v8 = v10;
    v9 = 12;
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(v1 + 88), "netId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

  if (v4)
  {
    v5 = *MEMORY[0x24BE08FA0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
      return;
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    v22 = 136315394;
    v23 = "-[SiriCoreNetworkingAnalytics logDebugNetworkConnectionStateReadySnapshotCaptured:]_block_invoke";
    v24 = 2112;
    v25 = v6;
    v7 = "%s Debug ready snapshot already sent for netId %@";
    v8 = v5;
    v9 = 22;
LABEL_7:
    _os_log_impl(&dword_211AB2000, v8, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v22, v9);
    return;
  }
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 88);
  v13 = (void *)objc_msgSend(*(id *)(v11 + 16), "copy");
  objc_msgSend(v12, "setNetId:", v13);

  objc_msgSend(*(id *)(a1 + 32), "_createSchemaClientEventFromNetId:networkConnectionId:connectionProvider:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 32));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDebugNetworkConnectionStateReadySnapshotCaptured:", *(_QWORD *)(a1 + 40));
  v15 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128));
  v16 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  if ((v15 & 1) != 0)
  {
    objc_msgSend(v16, "setClientEvent:", 0);
    objc_msgSend(MEMORY[0x24BE909B0], "sharedStream");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "emitMessage:timestamp:", v14, *(_QWORD *)(a1 + 48));

    v18 = *MEMORY[0x24BE08FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
    {
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      v22 = 136315394;
      v23 = "-[SiriCoreNetworkingAnalytics logDebugNetworkConnectionStateReadySnapshotCaptured:]_block_invoke";
      v24 = 2112;
      v25 = v19;
      v20 = "%s _debugReadySnapshotEvent emitted: %@";
LABEL_13:
      _os_log_impl(&dword_211AB2000, v18, OS_LOG_TYPE_INFO, v20, (uint8_t *)&v22, 0x16u);
    }
  }
  else
  {
    objc_msgSend(v16, "setClientEvent:", v14);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setTimestamp:", *(_QWORD *)(a1 + 48));
    v18 = *MEMORY[0x24BE08FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
    {
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      v22 = 136315394;
      v23 = "-[SiriCoreNetworkingAnalytics logDebugNetworkConnectionStateReadySnapshotCaptured:]_block_invoke";
      v24 = 2112;
      v25 = v21;
      v20 = "%s No _netIdForRequestLink for netId: %@";
      goto LABEL_13;
    }
  }

}

void __78__SiriCoreNetworkingAnalytics_logNetworkConnectionStateReadySnapshotCaptured___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  int v22;
  const char *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 16))
  {
    v10 = *MEMORY[0x24BE08FA0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
      return;
    v22 = 136315138;
    v23 = "-[SiriCoreNetworkingAnalytics logNetworkConnectionStateReadySnapshotCaptured:]_block_invoke";
    v7 = "%s No netId generated";
    v8 = v10;
    v9 = 12;
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(v1 + 80), "netId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

  if (v4)
  {
    v5 = *MEMORY[0x24BE08FA0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
      return;
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    v22 = 136315394;
    v23 = "-[SiriCoreNetworkingAnalytics logNetworkConnectionStateReadySnapshotCaptured:]_block_invoke";
    v24 = 2112;
    v25 = v6;
    v7 = "%s Ready snapshot already sent for netId %@";
    v8 = v5;
    v9 = 22;
LABEL_7:
    _os_log_impl(&dword_211AB2000, v8, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v22, v9);
    return;
  }
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 80);
  v13 = (void *)objc_msgSend(*(id *)(v11 + 16), "copy");
  objc_msgSend(v12, "setNetId:", v13);

  objc_msgSend(*(id *)(a1 + 32), "_createSchemaClientEventFromNetId:networkConnectionId:connectionProvider:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 32));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setNetworkConnectionStateReadySnapshotCaptured:", *(_QWORD *)(a1 + 40));
  v15 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128));
  v16 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  if ((v15 & 1) != 0)
  {
    objc_msgSend(v16, "setClientEvent:", 0);
    objc_msgSend(MEMORY[0x24BE909B0], "sharedStream");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "emitMessage:timestamp:", v14, *(_QWORD *)(a1 + 48));

    v18 = *MEMORY[0x24BE08FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
    {
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      v22 = 136315394;
      v23 = "-[SiriCoreNetworkingAnalytics logNetworkConnectionStateReadySnapshotCaptured:]_block_invoke";
      v24 = 2112;
      v25 = v19;
      v20 = "%s _readySnapshotEvent emitted: %@";
LABEL_13:
      _os_log_impl(&dword_211AB2000, v18, OS_LOG_TYPE_INFO, v20, (uint8_t *)&v22, 0x16u);
    }
  }
  else
  {
    objc_msgSend(v16, "setClientEvent:", v14);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setTimestamp:", *(_QWORD *)(a1 + 48));
    v18 = *MEMORY[0x24BE08FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
    {
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      v22 = 136315394;
      v23 = "-[SiriCoreNetworkingAnalytics logNetworkConnectionStateReadySnapshotCaptured:]_block_invoke";
      v24 = 2112;
      v25 = v21;
      v20 = "%s No _netIdForRequestLink for netId: %@";
      goto LABEL_13;
    }
  }

}

void __89__SiriCoreNetworkingAnalytics_logDebugNetworkConnectionStatePreparationSnapshotCaptured___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  int v22;
  const char *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 16))
  {
    v10 = *MEMORY[0x24BE08FA0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
      return;
    v22 = 136315138;
    v23 = "-[SiriCoreNetworkingAnalytics logDebugNetworkConnectionStatePreparationSnapshotCaptured:]_block_invoke";
    v7 = "%s No netId generated";
    v8 = v10;
    v9 = 12;
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(v1 + 72), "netId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

  if (v4)
  {
    v5 = *MEMORY[0x24BE08FA0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
      return;
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    v22 = 136315394;
    v23 = "-[SiriCoreNetworkingAnalytics logDebugNetworkConnectionStatePreparationSnapshotCaptured:]_block_invoke";
    v24 = 2112;
    v25 = v6;
    v7 = "%s Debug preparation snapshot already sent for netId %@";
    v8 = v5;
    v9 = 22;
LABEL_7:
    _os_log_impl(&dword_211AB2000, v8, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v22, v9);
    return;
  }
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 72);
  v13 = (void *)objc_msgSend(*(id *)(v11 + 16), "copy");
  objc_msgSend(v12, "setNetId:", v13);

  objc_msgSend(*(id *)(a1 + 32), "_createSchemaClientEventFromNetId:networkConnectionId:connectionProvider:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 32));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDebugNetworkConnectionStatePreparationSnapshotCaptured:", *(_QWORD *)(a1 + 40));
  v15 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128));
  v16 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  if ((v15 & 1) != 0)
  {
    objc_msgSend(v16, "setClientEvent:", 0);
    objc_msgSend(MEMORY[0x24BE909B0], "sharedStream");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "emitMessage:timestamp:", v14, *(_QWORD *)(a1 + 48));

    v18 = *MEMORY[0x24BE08FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
    {
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      v22 = 136315394;
      v23 = "-[SiriCoreNetworkingAnalytics logDebugNetworkConnectionStatePreparationSnapshotCaptured:]_block_invoke";
      v24 = 2112;
      v25 = v19;
      v20 = "%s _debugPreparationSnapshotEvent emitted: %@";
LABEL_13:
      _os_log_impl(&dword_211AB2000, v18, OS_LOG_TYPE_INFO, v20, (uint8_t *)&v22, 0x16u);
    }
  }
  else
  {
    objc_msgSend(v16, "setClientEvent:", v14);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setTimestamp:", *(_QWORD *)(a1 + 48));
    v18 = *MEMORY[0x24BE08FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
    {
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      v22 = 136315394;
      v23 = "-[SiriCoreNetworkingAnalytics logDebugNetworkConnectionStatePreparationSnapshotCaptured:]_block_invoke";
      v24 = 2112;
      v25 = v21;
      v20 = "%s No _netIdForRequestLink for netId: %@";
      goto LABEL_13;
    }
  }

}

void __84__SiriCoreNetworkingAnalytics_logNetworkConnectionStatePreparationSnapshotCaptured___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  int v22;
  const char *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 16))
  {
    v10 = *MEMORY[0x24BE08FA0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
      return;
    v22 = 136315138;
    v23 = "-[SiriCoreNetworkingAnalytics logNetworkConnectionStatePreparationSnapshotCaptured:]_block_invoke";
    v7 = "%s No netId generated";
    v8 = v10;
    v9 = 12;
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(v1 + 64), "netId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

  if (v4)
  {
    v5 = *MEMORY[0x24BE08FA0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
      return;
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    v22 = 136315394;
    v23 = "-[SiriCoreNetworkingAnalytics logNetworkConnectionStatePreparationSnapshotCaptured:]_block_invoke";
    v24 = 2112;
    v25 = v6;
    v7 = "%s Preparation snapshot already sent for netId %@";
    v8 = v5;
    v9 = 22;
LABEL_7:
    _os_log_impl(&dword_211AB2000, v8, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v22, v9);
    return;
  }
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 64);
  v13 = (void *)objc_msgSend(*(id *)(v11 + 16), "copy");
  objc_msgSend(v12, "setNetId:", v13);

  objc_msgSend(*(id *)(a1 + 32), "_createSchemaClientEventFromNetId:networkConnectionId:connectionProvider:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 32));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setNetworkConnectionStatePreparationSnapshotCaptured:", *(_QWORD *)(a1 + 40));
  v15 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128));
  v16 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  if ((v15 & 1) != 0)
  {
    objc_msgSend(v16, "setClientEvent:", 0);
    objc_msgSend(MEMORY[0x24BE909B0], "sharedStream");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "emitMessage:timestamp:", v14, *(_QWORD *)(a1 + 48));

    v18 = *MEMORY[0x24BE08FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
    {
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      v22 = 136315394;
      v23 = "-[SiriCoreNetworkingAnalytics logNetworkConnectionStatePreparationSnapshotCaptured:]_block_invoke";
      v24 = 2112;
      v25 = v19;
      v20 = "%s _preparationSnapshotEvent emitted: %@";
LABEL_13:
      _os_log_impl(&dword_211AB2000, v18, OS_LOG_TYPE_INFO, v20, (uint8_t *)&v22, 0x16u);
    }
  }
  else
  {
    objc_msgSend(v16, "setClientEvent:", v14);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setTimestamp:", *(_QWORD *)(a1 + 48));
    v18 = *MEMORY[0x24BE08FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
    {
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      v22 = 136315394;
      v23 = "-[SiriCoreNetworkingAnalytics logNetworkConnectionStatePreparationSnapshotCaptured:]_block_invoke";
      v24 = 2112;
      v25 = v21;
      v20 = "%s No _netIdForRequestLink for netId: %@";
      goto LABEL_13;
    }
  }

}

void __69__SiriCoreNetworkingAnalytics_logSessionConnectionHttpHeaderCreated___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  int v22;
  const char *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 16))
  {
    v10 = *MEMORY[0x24BE08FA0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
      return;
    v22 = 136315138;
    v23 = "-[SiriCoreNetworkingAnalytics logSessionConnectionHttpHeaderCreated:]_block_invoke";
    v7 = "%s No netId generated";
    v8 = v10;
    v9 = 12;
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(v1 + 56), "netId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

  if (v4)
  {
    v5 = *MEMORY[0x24BE08FA0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
      return;
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    v22 = 136315394;
    v23 = "-[SiriCoreNetworkingAnalytics logSessionConnectionHttpHeaderCreated:]_block_invoke";
    v24 = 2112;
    v25 = v6;
    v7 = "%s Http header already sent for netId %@";
    v8 = v5;
    v9 = 22;
LABEL_7:
    _os_log_impl(&dword_211AB2000, v8, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v22, v9);
    return;
  }
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 56);
  v13 = (void *)objc_msgSend(*(id *)(v11 + 16), "copy");
  objc_msgSend(v12, "setNetId:", v13);

  objc_msgSend(*(id *)(a1 + 32), "_createSchemaClientEventFromNetId:networkConnectionId:connectionProvider:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 32));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSessionConnectionHttpHeaderCreated:", *(_QWORD *)(a1 + 40));
  v15 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128));
  v16 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  if ((v15 & 1) != 0)
  {
    objc_msgSend(v16, "setClientEvent:", 0);
    objc_msgSend(MEMORY[0x24BE909B0], "sharedStream");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "emitMessage:timestamp:", v14, *(_QWORD *)(a1 + 48));

    v18 = *MEMORY[0x24BE08FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
    {
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      v22 = 136315394;
      v23 = "-[SiriCoreNetworkingAnalytics logSessionConnectionHttpHeaderCreated:]_block_invoke";
      v24 = 2112;
      v25 = v19;
      v20 = "%s _httpHeaderEvent emitted: %@";
LABEL_13:
      _os_log_impl(&dword_211AB2000, v18, OS_LOG_TYPE_INFO, v20, (uint8_t *)&v22, 0x16u);
    }
  }
  else
  {
    objc_msgSend(v16, "setClientEvent:", v14);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setTimestamp:", *(_QWORD *)(a1 + 48));
    v18 = *MEMORY[0x24BE08FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
    {
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      v22 = 136315394;
      v23 = "-[SiriCoreNetworkingAnalytics logSessionConnectionHttpHeaderCreated:]_block_invoke";
      v24 = 2112;
      v25 = v21;
      v20 = "%s No _netIdForRequestLink for netId: %@";
      goto LABEL_13;
    }
  }

}

void __83__SiriCoreNetworkingAnalytics_logRequestLinkBetweenOrchestratorAndNetworkComponent__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v3;
  uint64_t v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id *v22;
  void *v23;
  int v24;
  const char *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 16))
  {
    v8 = *MEMORY[0x24BE08FA0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
      return;
    v24 = 136315138;
    v25 = "-[SiriCoreNetworkingAnalytics logRequestLinkBetweenOrchestratorAndNetworkComponent]_block_invoke";
    v5 = "%s No netId generated";
LABEL_16:
    v6 = v8;
    v7 = 12;
LABEL_17:
    _os_log_impl(&dword_211AB2000, v6, OS_LOG_TYPE_INFO, v5, (uint8_t *)&v24, v7);
    return;
  }
  if (objc_msgSend(*(id *)(v1 + 128), "isEqual:"))
  {
    v3 = *MEMORY[0x24BE08FA0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
      return;
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    v24 = 136315394;
    v25 = "-[SiriCoreNetworkingAnalytics logRequestLinkBetweenOrchestratorAndNetworkComponent]_block_invoke";
    v26 = 2112;
    v27 = v4;
    v5 = "%s Request Link already sent for netId %@";
    v6 = v3;
    v7 = 22;
    goto LABEL_17;
  }
  v9 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v9 + 40))
  {
    v8 = *MEMORY[0x24BE08FA0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
      return;
    v24 = 136315138;
    v25 = "-[SiriCoreNetworkingAnalytics logRequestLinkBetweenOrchestratorAndNetworkComponent]_block_invoke";
    v5 = "%s No orchestrator requestId";
    goto LABEL_16;
  }
  if (!*(_BYTE *)(v9 + 48))
  {
    v8 = *MEMORY[0x24BE08FA0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
      return;
    v24 = 136315138;
    v25 = "-[SiriCoreNetworkingAnalytics logRequestLinkBetweenOrchestratorAndNetworkComponent]_block_invoke";
    v5 = "%s No active connection";
    goto LABEL_16;
  }
  objc_msgSend((id)v9, "_createRequestLinkInfoFromUUID:component:", *(_QWORD *)(v9 + 16), 18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_createRequestLinkInfoFromUUID:component:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = mach_absolute_time();
  v13 = objc_alloc_init(MEMORY[0x24BE95B60]);
  objc_msgSend(v13, "setSource:", v10);
  objc_msgSend(v13, "setTarget:", v11);
  objc_msgSend(MEMORY[0x24BE909B0], "sharedStream");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "emitMessage:timestamp:", v13, v12);

  v15 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(void **)(v16 + 128);
  *(_QWORD *)(v16 + 128) = v15;

  v18 = *MEMORY[0x24BE08FA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
  {
    v19 = *(_QWORD *)(a1 + 32);
    v20 = *(_QWORD *)(v19 + 16);
    v21 = *(_QWORD *)(v19 + 40);
    v24 = 136315650;
    v25 = "-[SiriCoreNetworkingAnalytics logRequestLinkBetweenOrchestratorAndNetworkComponent]_block_invoke";
    v26 = 2112;
    v27 = v20;
    v28 = 2112;
    v29 = v21;
    _os_log_impl(&dword_211AB2000, v18, OS_LOG_TYPE_INFO, "%s netId: %@, orchestratorRequestId: %@", (uint8_t *)&v24, 0x20u);
  }
  v22 = *(id **)(a1 + 32);
  v23 = (void *)objc_msgSend(v22[2], "copy");
  objc_msgSend(v22, "_emitAllCachedMessagesFor:", v23);

}

uint64_t __57__SiriCoreNetworkingAnalytics__emitAllCachedMessagesFor___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  uint64_t v73;
  int v75;
  const char *v76;
  __int16 v77;
  uint64_t v78;
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  objc_msgSend(*(id *)(v2 + 56), "netId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqual:", v4) & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "clientEvent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(MEMORY[0x24BE909B0], "sharedStream");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "clientEvent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "emitMessage:timestamp:", v7, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "timestamp"));

      v8 = *MEMORY[0x24BE08FA0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
      {
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
        v75 = 136315394;
        v76 = "-[SiriCoreNetworkingAnalytics _emitAllCachedMessagesFor:]_block_invoke";
        v77 = 2112;
        v78 = v9;
        _os_log_impl(&dword_211AB2000, v8, OS_LOG_TYPE_INFO, "%s _httpHeaderEvent emitted: %@", (uint8_t *)&v75, 0x16u);
      }
    }
  }
  else
  {

  }
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 16);
  objc_msgSend(*(id *)(v10 + 64), "netId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isEqual:", v12) & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "clientEvent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(MEMORY[0x24BE909B0], "sharedStream");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "clientEvent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "emitMessage:timestamp:", v15, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "timestamp"));

      v16 = *MEMORY[0x24BE08FA0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
      {
        v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
        v75 = 136315394;
        v76 = "-[SiriCoreNetworkingAnalytics _emitAllCachedMessagesFor:]_block_invoke";
        v77 = 2112;
        v78 = v17;
        _os_log_impl(&dword_211AB2000, v16, OS_LOG_TYPE_INFO, "%s _preparationSnapshotEvent emitted: %@", (uint8_t *)&v75, 0x16u);
      }
    }
  }
  else
  {

  }
  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(void **)(v18 + 16);
  objc_msgSend(*(id *)(v18 + 72), "netId");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v19, "isEqual:", v20) & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "clientEvent");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(MEMORY[0x24BE909B0], "sharedStream");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "clientEvent");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "emitMessage:timestamp:", v23, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "timestamp"));

      v24 = *MEMORY[0x24BE08FA0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
      {
        v25 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
        v75 = 136315394;
        v76 = "-[SiriCoreNetworkingAnalytics _emitAllCachedMessagesFor:]_block_invoke";
        v77 = 2112;
        v78 = v25;
        _os_log_impl(&dword_211AB2000, v24, OS_LOG_TYPE_INFO, "%s _debugPreparationSnapshotEvent emitted: %@", (uint8_t *)&v75, 0x16u);
      }
    }
  }
  else
  {

  }
  v26 = *(_QWORD *)(a1 + 32);
  v27 = *(void **)(v26 + 16);
  objc_msgSend(*(id *)(v26 + 80), "netId");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v27, "isEqual:", v28) & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "clientEvent");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend(MEMORY[0x24BE909B0], "sharedStream");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "clientEvent");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "emitMessage:timestamp:", v31, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "timestamp"));

      v32 = *MEMORY[0x24BE08FA0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
      {
        v33 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
        v75 = 136315394;
        v76 = "-[SiriCoreNetworkingAnalytics _emitAllCachedMessagesFor:]_block_invoke";
        v77 = 2112;
        v78 = v33;
        _os_log_impl(&dword_211AB2000, v32, OS_LOG_TYPE_INFO, "%s _readySnapshotEvent emitted: %@", (uint8_t *)&v75, 0x16u);
      }
    }
  }
  else
  {

  }
  v34 = *(_QWORD *)(a1 + 32);
  v35 = *(void **)(v34 + 16);
  objc_msgSend(*(id *)(v34 + 88), "netId");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v35, "isEqual:", v36) & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "clientEvent");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      objc_msgSend(MEMORY[0x24BE909B0], "sharedStream");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "clientEvent");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "emitMessage:timestamp:", v39, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "timestamp"));

      v40 = *MEMORY[0x24BE08FA0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
      {
        v41 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
        v75 = 136315394;
        v76 = "-[SiriCoreNetworkingAnalytics _emitAllCachedMessagesFor:]_block_invoke";
        v77 = 2112;
        v78 = v41;
        _os_log_impl(&dword_211AB2000, v40, OS_LOG_TYPE_INFO, "%s _debugReadySnapshotEvent emitted: %@", (uint8_t *)&v75, 0x16u);
      }
    }
  }
  else
  {

  }
  v42 = *(_QWORD *)(a1 + 32);
  v43 = *(void **)(v42 + 16);
  objc_msgSend(*(id *)(v42 + 96), "netId");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v43, "isEqual:", v44) & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "clientEvent");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (v45)
    {
      objc_msgSend(MEMORY[0x24BE909B0], "sharedStream");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "clientEvent");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "emitMessage:timestamp:", v47, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "timestamp"));

      v48 = *MEMORY[0x24BE08FA0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
      {
        v49 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
        v75 = 136315394;
        v76 = "-[SiriCoreNetworkingAnalytics _emitAllCachedMessagesFor:]_block_invoke";
        v77 = 2112;
        v78 = v49;
        _os_log_impl(&dword_211AB2000, v48, OS_LOG_TYPE_INFO, "%s _sessionConnectionSnapthotEvent emitted: %@", (uint8_t *)&v75, 0x16u);
      }
    }
  }
  else
  {

  }
  v50 = *(_QWORD *)(a1 + 32);
  v51 = *(void **)(v50 + 16);
  objc_msgSend(*(id *)(v50 + 104), "netId");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v51, "isEqual:", v52) & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "clientEvent");
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    if (v53)
    {
      objc_msgSend(MEMORY[0x24BE909B0], "sharedStream");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "clientEvent");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "emitMessage:timestamp:", v55, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "timestamp"));

      v56 = *MEMORY[0x24BE08FA0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
      {
        v57 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
        v75 = 136315394;
        v76 = "-[SiriCoreNetworkingAnalytics _emitAllCachedMessagesFor:]_block_invoke";
        v77 = 2112;
        v78 = v57;
        _os_log_impl(&dword_211AB2000, v56, OS_LOG_TYPE_INFO, "%s _debugSessionConnectionSnapthotEvent emitted: %@", (uint8_t *)&v75, 0x16u);
      }
    }
  }
  else
  {

  }
  v58 = *(_QWORD *)(a1 + 32);
  v59 = *(void **)(v58 + 16);
  objc_msgSend(*(id *)(v58 + 112), "netId");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v59, "isEqual:", v60) & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "clientEvent");
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    if (v61)
    {
      objc_msgSend(MEMORY[0x24BE909B0], "sharedStream");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "clientEvent");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "emitMessage:timestamp:", v63, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "timestamp"));

      v64 = *MEMORY[0x24BE08FA0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
      {
        v65 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
        v75 = 136315394;
        v76 = "-[SiriCoreNetworkingAnalytics _emitAllCachedMessagesFor:]_block_invoke";
        v77 = 2112;
        v78 = v65;
        _os_log_impl(&dword_211AB2000, v64, OS_LOG_TYPE_INFO, "%s _sessionConnectionFailedEvent emitted: %@", (uint8_t *)&v75, 0x16u);
      }
    }
  }
  else
  {

  }
  v66 = *(_QWORD *)(a1 + 32);
  v67 = *(void **)(v66 + 16);
  objc_msgSend(*(id *)(v66 + 120), "netId");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v67, "isEqual:", v68) & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "clientEvent");
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    if (v69)
    {
      objc_msgSend(MEMORY[0x24BE909B0], "sharedStream");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "clientEvent");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "emitMessage:timestamp:", v71, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "timestamp"));

      v72 = *MEMORY[0x24BE08FA0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
      {
        v73 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
        v75 = 136315394;
        v76 = "-[SiriCoreNetworkingAnalytics _emitAllCachedMessagesFor:]_block_invoke";
        v77 = 2112;
        v78 = v73;
        _os_log_impl(&dword_211AB2000, v72, OS_LOG_TYPE_INFO, "%s _peerConnectionFailedEvent emitted: %@", (uint8_t *)&v75, 0x16u);
      }
    }
  }
  else
  {

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setClientEvent:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setClientEvent:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setClientEvent:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setClientEvent:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setClientEvent:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setClientEvent:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setClientEvent:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "setClientEvent:", 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "setClientEvent:", 0);
}

void __52__SiriCoreNetworkingAnalytics_orchestratorRequestId__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 40));
}

void __56__SiriCoreNetworkingAnalytics_setOrchestratorRequestId___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *MEMORY[0x24BE08FA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
    v7 = 136315394;
    v8 = "-[SiriCoreNetworkingAnalytics setOrchestratorRequestId:]_block_invoke";
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_211AB2000, v5, OS_LOG_TYPE_INFO, "%s OrchestratorRequestId Updated: %@", (uint8_t *)&v7, 0x16u);
  }
}

uint64_t __50__SiriCoreNetworkingAnalytics_resetSequenceNumber__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 52) = 1;
  return result;
}

uint64_t __53__SiriCoreNetworkingAnalytics_increaseSequenceNumber__block_invoke(uint64_t result)
{
  uint64_t v1;
  unsigned int v2;
  int v3;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_DWORD *)(v1 + 52);
  if (v2 <= 0x3E8)
    v3 = v2 + 1;
  else
    v3 = 1;
  *(_DWORD *)(v1 + 52) = v3;
  return result;
}

void __47__SiriCoreNetworkingAnalytics_isNetIdAvailable__block_invoke(uint64_t a1)
{
  NSObject *v2;
  const __CFString *v3;
  int v4;
  const char *v5;
  __int16 v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 49);
  v2 = *MEMORY[0x24BE08FA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
  {
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 49))
      v3 = CFSTR("YES");
    else
      v3 = CFSTR("NO");
    v4 = 136315394;
    v5 = "-[SiriCoreNetworkingAnalytics isNetIdAvailable]_block_invoke";
    v6 = 2112;
    v7 = v3;
    _os_log_impl(&dword_211AB2000, v2, OS_LOG_TYPE_INFO, "%s NetId available: %@", (uint8_t *)&v4, 0x16u);
  }
}

void __49__SiriCoreNetworkingAnalytics_setNetIdAvailable___block_invoke(uint64_t a1)
{
  NSObject *v2;
  const __CFString *v3;
  int v4;
  const char *v5;
  __int16 v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 49) = *(_BYTE *)(a1 + 40);
  v2 = *MEMORY[0x24BE08FA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
  {
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 49))
      v3 = CFSTR("YES");
    else
      v3 = CFSTR("NO");
    v4 = 136315394;
    v5 = "-[SiriCoreNetworkingAnalytics setNetIdAvailable:]_block_invoke";
    v6 = 2112;
    v7 = v3;
    _os_log_impl(&dword_211AB2000, v2, OS_LOG_TYPE_INFO, "%s NetId available: %@", (uint8_t *)&v4, 0x16u);
  }
}

uint64_t __53__SiriCoreNetworkingAnalytics_setIsConnectionActive___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 48) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __48__SiriCoreNetworkingAnalytics_getSequenceNumber__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 52);
  return result;
}

void __53__SiriCoreNetworkingAnalytics_setConnectionProvider___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 32) = +[SiriCoreNetworkingAnalytics providerFromString:](SiriCoreNetworkingAnalytics, "providerFromString:", *(_QWORD *)(a1 + 40));
  v2 = *MEMORY[0x24BE08FA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = 136315394;
    v5 = "-[SiriCoreNetworkingAnalytics setConnectionProvider:]_block_invoke";
    v6 = 2112;
    v7 = v3;
    _os_log_impl(&dword_211AB2000, v2, OS_LOG_TYPE_INFO, "%s ConnectionProvider Updated: %@", (uint8_t *)&v4, 0x16u);
  }
}

void __54__SiriCoreNetworkingAnalytics_setNetworkConnectionId___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
  v2 = *MEMORY[0x24BE08FA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
    v4 = 136315394;
    v5 = "-[SiriCoreNetworkingAnalytics setNetworkConnectionId:]_block_invoke";
    v6 = 2112;
    v7 = v3;
    _os_log_impl(&dword_211AB2000, v2, OS_LOG_TYPE_INFO, "%s NetworkConnectionId Updated: %@", (uint8_t *)&v4, 0x16u);
  }
}

void __40__SiriCoreNetworkingAnalytics_setNetId___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

  v5 = *MEMORY[0x24BE08FA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    v7 = 136315394;
    v8 = "-[SiriCoreNetworkingAnalytics setNetId:]_block_invoke";
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_211AB2000, v5, OS_LOG_TYPE_INFO, "%s NetId Updated: %@", (uint8_t *)&v7, 0x16u);
  }
}

void __41__SiriCoreNetworkingAnalytics_resetNetId__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

  v5 = *MEMORY[0x24BE08FA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    v7 = 136315394;
    v8 = "-[SiriCoreNetworkingAnalytics resetNetId]_block_invoke";
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_211AB2000, v5, OS_LOG_TYPE_INFO, "%s NetId Updated: %@", (uint8_t *)&v7, 0x16u);
  }
}

+ (id)sharedSiriCoreNetworkingAnalytics
{
  if (sharedSiriCoreNetworkingAnalytics_onceToken != -1)
    dispatch_once(&sharedSiriCoreNetworkingAnalytics_onceToken, &__block_literal_global_2189);
  return (id)sharedSiriCoreNetworkingAnalytics_shared;
}

void __64__SiriCoreNetworkingAnalytics_sharedSiriCoreNetworkingAnalytics__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[SiriCoreNetworkingAnalytics _init]([SiriCoreNetworkingAnalytics alloc], "_init");
  v1 = (void *)sharedSiriCoreNetworkingAnalytics_shared;
  sharedSiriCoreNetworkingAnalytics_shared = (uint64_t)v0;

}

@end
