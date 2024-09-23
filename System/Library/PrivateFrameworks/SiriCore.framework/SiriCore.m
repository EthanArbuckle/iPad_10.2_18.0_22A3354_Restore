void sub_211AB5D7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *SiriCoreSQLiteQueryCreateParametrizedAndCommaSeparatedString(unint64_t a1)
{
  __CFString *v2;
  char *v3;
  unint64_t v4;
  char *v5;

  if (a1 >= 0x11)
  {
    v3 = (char *)malloc_type_malloc(3 * a1 - 2, 0x210D532EuLL);
    bzero(v3, 3 * a1 - 2);
    v4 = a1 - 1;
    v5 = v3;
    do
    {
      *(_WORD *)v5 = 11327;
      v5[2] = 32;
      v5 += 3;
      --v4;
    }
    while (v4);
    *v5 = 63;
    v2 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v3, 3 * a1 - 2, 1, 1);
  }
  else
  {
    v2 = off_24CCE6328[a1];
  }
  return v2;
}

id WRM_iRATInterfaceFunction()
{
  return (id)classWRM_iRATInterface;
}

id initWRM_iRATInterface()
{
  if (initWRM_iRATInterface_sOnce != -1)
    dispatch_once(&initWRM_iRATInterface_sOnce, &__block_literal_global_111);
  return (id)classWRM_iRATInterface;
}

Class __initWRM_iRATInterface_block_invoke()
{
  Class result;

  if (WirelessCoexManagerLibrary_sOnce != -1)
    dispatch_once(&WirelessCoexManagerLibrary_sOnce, &__block_literal_global_36);
  result = objc_getClass("WRM_iRATInterface");
  classWRM_iRATInterface = (uint64_t)result;
  if (!result)
    __assert_rtn("initWRM_iRATInterface_block_invoke", "SiriCoreLinkRecommendationInfo.m", 15, "classWRM_iRATInterface");
  getWRM_iRATInterfaceClass = WRM_iRATInterfaceFunction;
  return result;
}

void sub_211AB8B88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_211AB9F38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_211ABA478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

SiriCoreConnectionTCPInfoMetrics *SiriCoreConnectionTCPInfoMetricsCreate(void *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
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
  void *v19;
  void *v20;
  SiriCoreConnectionTCPInfoMetrics *v21;
  SiriCoreConnectionTCPInfoMetrics *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a1;
  if (!v26)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "SiriCoreConnectionTCPInfoMetrics *SiriCoreConnectionTCPInfoMetricsCreate(NSString *__strong, const struct tcp_info *)");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("SiriCoreConnectionMetrics.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("interfaceName != nil"));

    if (a2)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "SiriCoreConnectionTCPInfoMetrics *SiriCoreConnectionTCPInfoMetricsCreate(NSString *__strong, const struct tcp_info *)");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("SiriCoreConnectionMetrics.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tcpInfo != NULL"));

    goto LABEL_3;
  }
  if (!a2)
    goto LABEL_5;
LABEL_3:
  v21 = [SiriCoreConnectionTCPInfoMetrics alloc];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(a2 + 20));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(a2 + 24));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(a2 + 28));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(a2 + 32));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(a2 + 68));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(a2 + 76));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(a2 + 84));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(a2 + 92));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(a2 + 100));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(a2 + 108));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(a2 + 116));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(a2 + 124));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(a2 + 64));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(a2 + 132));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", *(unsigned __int8 *)(a2 + 140));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", (*(unsigned __int16 *)(a2 + 244) >> 4) & 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[SiriCoreConnectionTCPInfoMetrics initWithInterfaceName:rttCurrent:rttSmoothed:rttVariance:rttBest:packetsSent:bytesSent:bytesRetransmitted:bytesUnacked:packetsReceived:bytesReceived:duplicateBytesReceived:outOfOrderBytesReceived:sendBufferBytes:sendBandwidth:synRetransmits:tfoSynDataAcked:](v21, "initWithInterfaceName:rttCurrent:rttSmoothed:rttVariance:rttBest:packetsSent:bytesSent:bytesRetransmitted:bytesUnacked:packetsReceived:bytesReceived:duplicateBytesReceived:outOfOrderBytesReceived:sendBufferBytes:sendBandwidth:synRetransmits:tfoSynDataAcked:", v26, v25, v23, v20, v19, v18, v24, v16, v15, v14, v17, v13, v3, v4, v5,
          v6,
          v7);

  return v22;
}

void sub_211ABFF44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _SiriCoreSiriConnectionMethodGetNextSupported(uint64_t a1, void *a2, int a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  int v12;

  v5 = a2;
  v6 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v7 = *MEMORY[0x24BE81AF0];
  while (1)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v8);

    if (a1 == 3)
    {
      a1 = 4;
      if ((objc_msgSend(v5, "isEqualToString:", v7) & (a3 ^ 1) & 1) != 0)
        goto LABEL_12;
      goto LABEL_8;
    }
    if (a1 == 2)
    {
      a1 = 0;
      goto LABEL_12;
    }
    if (a1 == 4)
      break;
    a1 = 3;
    if ((a3 & 1) != 0)
      goto LABEL_12;
LABEL_8:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v6, "containsObject:", v9);

    if ((v10 & 1) != 0)
      goto LABEL_12;
  }
  a1 = 2;
LABEL_12:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v6, "containsObject:", v11);

  if (v12)
    a1 = 0;

  return a1;
}

void sub_211AC79A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 128), 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

id SiriCoreGetConnectionNetworkPathReport(void *a1, void *a2)
{
  id v2;
  objc_class *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  _QWORD enumerate_block[4];
  id v25;

  v2 = 0;
  if (a1 && a2)
  {
    v4 = (objc_class *)MEMORY[0x24BDBCED8];
    v5 = a2;
    v6 = a1;
    v2 = objc_alloc_init(v4);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", nw_path_get_status(v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v7, CFSTR("connectionPreparingPathStatus"));

    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v9 = MEMORY[0x24BDAC760];
    enumerate_block[0] = MEMORY[0x24BDAC760];
    enumerate_block[1] = 3221225472;
    enumerate_block[2] = __SiriCoreGetConnectionNetworkPathReport_block_invoke;
    enumerate_block[3] = &unk_24CCE6270;
    v10 = v8;
    v25 = v10;
    nw_path_enumerate_interfaces(v5, enumerate_block);
    objc_msgSend(v2, "setObject:forKey:", v10, CFSTR("connectionPreparingPathInterfaces"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", nw_path_is_expensive(v5));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v11, CFSTR("connectionPreparingPathIsExpensive"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", nw_path_is_constrained(v5));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v12, CFSTR("connectionPreparingPathIsConstrained"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", nw_path_has_ipv4(v5));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v13, CFSTR("connectionPreparingPathHasIpv4"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", nw_path_has_ipv6(v5));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v14, CFSTR("connectionPreparingPathHasIpv6"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", nw_path_has_dns(v5));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v15, CFSTR("connectionPreparingPathHasDNS"));

    v19 = v9;
    v20 = 3221225472;
    v21 = __SiriCoreGetConnectionNetworkPathReport_block_invoke_2;
    v22 = &unk_24CCE6298;
    v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v23 = v16;
    nw_path_enumerate_gateways(v5, &v19);

    objc_msgSend(v2, "setObject:forKey:", v16, CFSTR("connectionPreparingPathGateways"), v19, v20, v21, v22);
    _getConnectionDescription(v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      objc_msgSend(v2, "setObject:forKey:", v17, CFSTR("connectionInfo"));

  }
  return v2;
}

id _getConnectionDescription(NSObject *a1)
{
  char *v1;
  char *v2;
  void *v3;

  v1 = nw_connection_copy_description(a1);
  if (v1)
  {
    v2 = v1;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    free(v2);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

id _getEndpointInfo(void *a1)
{
  NSObject *v1;
  id v2;
  uint64_t type;
  void *v4;
  char *v5;
  char *v6;
  void *v7;

  v1 = a1;
  if (v1)
  {
    v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    type = nw_endpoint_get_type(v1);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", type);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("type"));

    if ((type - 1) <= 1)
    {
      v5 = nw_endpoint_copy_port_string(v1);
      if (v5)
      {
        v6 = v5;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKey:", v7, CFSTR("port"));
        free(v6);

      }
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id SiriCoreGetConnectionReadyReport(void *a1, void *a2)
{
  id v2;
  objc_class *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t duration_milliseconds;
  uint64_t attempt_started_after_milliseconds;
  uint64_t previous_attempt_count;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  nw_endpoint_t v20;
  void *v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t, uint64_t, uint64_t, void *, void *);
  void *v27;
  id v28;
  _QWORD enumerate_block[4];
  id v30;

  v2 = 0;
  if (a1 && a2)
  {
    v4 = (objc_class *)MEMORY[0x24BDBCED8];
    v5 = a2;
    v6 = a1;
    v2 = objc_alloc_init(v4);
    duration_milliseconds = nw_establishment_report_get_duration_milliseconds(v5);
    attempt_started_after_milliseconds = nw_establishment_report_get_attempt_started_after_milliseconds(v5);
    previous_attempt_count = nw_establishment_report_get_previous_attempt_count(v5);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", duration_milliseconds);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v10, CFSTR("connectionEstablishmentDuration"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", attempt_started_after_milliseconds);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v11, CFSTR("connectionEstablishmentAttemptDelay"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", previous_attempt_count);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v12, CFSTR("connectionEstablishmentPreviousAttemptCount"));

    v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v14 = MEMORY[0x24BDAC760];
    enumerate_block[0] = MEMORY[0x24BDAC760];
    enumerate_block[1] = 3221225472;
    enumerate_block[2] = __SiriCoreGetConnectionReadyReport_block_invoke;
    enumerate_block[3] = &unk_24CCE62C0;
    v15 = v13;
    v30 = v15;
    nw_establishment_report_enumerate_protocols(v5, enumerate_block);
    objc_msgSend(v2, "setObject:forKey:", v15, CFSTR("connectionEstablishmentProtocols"));
    v24 = v14;
    v25 = 3221225472;
    v26 = __SiriCoreGetConnectionReadyReport_block_invoke_2;
    v27 = &unk_24CCE62E8;
    v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v28 = v16;
    nw_establishment_report_enumerate_resolutions(v5, &v24);
    objc_msgSend(v2, "setObject:forKey:", v16, CFSTR("connectionEstablishmentResolution"), v24, v25, v26, v27);
    v17 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v18 = &unk_24CCF5420;
    if (nw_establishment_report_get_proxy_configured(v5))
      v19 = &unk_24CCF5408;
    else
      v19 = &unk_24CCF5420;
    if (nw_establishment_report_get_used_proxy(v5))
      v18 = &unk_24CCF5408;
    objc_msgSend(v17, "setObject:forKey:", v19, CFSTR("proxyConfigured"));
    objc_msgSend(v17, "setObject:forKey:", v18, CFSTR("usingConfiguredProxy"));
    v20 = nw_establishment_report_copy_proxy_endpoint(v5);

    if (v20)
    {
      _getEndpointInfo(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
        objc_msgSend(v17, "setObject:forKey:", v21, CFSTR("proxyEndpoint"));

    }
    objc_msgSend(v2, "setObject:forKey:", v17, CFSTR("connectionEstablishmentProxyConfiguration"));
    _getConnectionDescription(v6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
      objc_msgSend(v2, "setObject:forKey:", v22, CFSTR("connectionInfo"));

  }
  return v2;
}

id SiriCoreSQLiteQueryCreateColumnDefinition(void *a1)
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "siriCoreSQLiteValue_escapedString:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v5);

  }
  objc_msgSend(v1, "type");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v2, "addObject:", v6);
  v21 = (void *)v6;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v22 = v1;
  objc_msgSend(v1, "constraints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v12, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(v2, "addObject:", CFSTR("CONSTRAINT"));
          objc_msgSend(v13, "siriCoreSQLiteValue_escapedString:", 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v14);

        }
        switch(objc_msgSend(v12, "type"))
        {
          case 1:
            objc_msgSend(v2, "addObject:", CFSTR("PRIMARY KEY"));
            if ((objc_msgSend(v12, "options") & 1) != 0)
            {
              v15 = v2;
              v16 = CFSTR("AUTOINCREMENT");
              goto LABEL_17;
            }
            break;
          case 2:
            v15 = v2;
            v16 = CFSTR("NOT NULL");
            goto LABEL_17;
          case 3:
            v15 = v2;
            v16 = CFSTR("UNIQUE");
LABEL_17:
            objc_msgSend(v15, "addObject:", v16);
            break;
          case 4:
            objc_msgSend(v2, "addObject:", CFSTR("DEFAULT"));
            objc_msgSend(v12, "value");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "siriCoreSQLiteValue_escapedString:", 0);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "addObject:", v18);

            break;
          default:
            break;
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "componentsJoinedByString:", CFSTR(" "));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

__CFString *SiriCoreSQLiteQueryCreateEscapedAndCommaSeparatedString(void *a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    if (v4 == 1)
    {
      objc_msgSend(v3, "objectAtIndex:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "siriCoreSQLiteValue_escapedString:", a2);
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v4);
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v8 = v3;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v16;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v16 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "siriCoreSQLiteValue_escapedString:", a2, (_QWORD)v15);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v13);

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v10);
      }

      objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (__CFString *)v6;

  }
  else
  {
    v7 = &stru_24CCE7768;
  }

  return v7;
}

id SiriCoreSQLiteQueryCreateCriterionExpression(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  id v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  void *v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(v1, "columnName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v1, "comparisonOperator"))
  {
    case 1:
      v4 = objc_alloc(MEMORY[0x24BDD17C8]);
      objc_msgSend(v2, "siriCoreSQLiteValue_escapedString:", 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "siriCoreSQLiteValue_escapedString:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v4, "initWithFormat:", CFSTR("%@ == %@"), v5, v6);
      goto LABEL_8;
    case 2:
      v8 = objc_alloc(MEMORY[0x24BDD17C8]);
      objc_msgSend(v2, "siriCoreSQLiteValue_escapedString:", 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "siriCoreSQLiteValue_escapedString:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "initWithFormat:", CFSTR("%@ > %@"), v5, v6);
      goto LABEL_8;
    case 3:
      v9 = objc_alloc(MEMORY[0x24BDD17C8]);
      objc_msgSend(v2, "siriCoreSQLiteValue_escapedString:", 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "siriCoreSQLiteValue_escapedString:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v9, "initWithFormat:", CFSTR("%@ >= %@"), v5, v6);
      goto LABEL_8;
    case 4:
      v10 = objc_alloc(MEMORY[0x24BDD17C8]);
      objc_msgSend(v2, "siriCoreSQLiteValue_escapedString:", 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "siriCoreSQLiteValue_escapedString:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v10, "initWithFormat:", CFSTR("%@ < %@"), v5, v6);
      goto LABEL_8;
    case 5:
      v11 = objc_alloc(MEMORY[0x24BDD17C8]);
      objc_msgSend(v2, "siriCoreSQLiteValue_escapedString:", 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "siriCoreSQLiteValue_escapedString:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v11, "initWithFormat:", CFSTR("%@ <= %@"), v5, v6);
      goto LABEL_8;
    case 6:
      v12 = objc_alloc(MEMORY[0x24BDD17C8]);
      objc_msgSend(v2, "siriCoreSQLiteValue_escapedString:", 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "siriCoreSQLiteValue_escapedString:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v12, "initWithFormat:", CFSTR("%@ != %@"), v5, v6);
LABEL_8:
      v13 = (void *)v7;

      if (!v13)
        goto LABEL_10;
      v14 = v13;
      break;
    default:
LABEL_10:
      objc_msgSend(v1, "values");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "subcriteria");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      switch(objc_msgSend(v1, "logicalOperator"))
      {
        case 1:
          v51 = v15;
          v52 = v3;
          v53 = v2;
          v17 = objc_msgSend(v16, "count");
          v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v17);
          v62 = 0u;
          v63 = 0u;
          v64 = 0u;
          v65 = 0u;
          v56 = v16;
          v19 = v16;
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v63;
            do
            {
              v23 = 0;
              do
              {
                if (*(_QWORD *)v63 != v22)
                  objc_enumerationMutation(v19);
                SiriCoreSQLiteQueryCreateCriterionExpression(*(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * v23));
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                if (v24)
                {
                  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("(%@)"), v24);
                  objc_msgSend(v18, "addObject:", v25);

                }
                ++v23;
              }
              while (v21 != v23);
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
            }
            while (v21);
          }

          if (!objc_msgSend(v18, "count"))
            goto LABEL_53;
          v26 = CFSTR(" AND ");
          goto LABEL_52;
        case 2:
          v54 = objc_alloc(MEMORY[0x24BDD17C8]);
          objc_msgSend(v2, "siriCoreSQLiteValue_escapedString:", 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "firstObject");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "siriCoreSQLiteValue_escapedString:", 0);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "lastObject");
          v57 = v16;
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "siriCoreSQLiteValue_escapedString:", 0);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v54, "initWithFormat:", CFSTR("%@ BETWEEN %@ AND %@"), v18, v28, v30);
          goto LABEL_30;
        case 3:
          v32 = objc_alloc(MEMORY[0x24BDD17C8]);
          objc_msgSend(v2, "siriCoreSQLiteValue_escapedString:", 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          SiriCoreSQLiteQueryCreateEscapedAndCommaSeparatedString(v15, 0);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "initWithFormat:", CFSTR("%@ IN (%@)"), v18, v27);
          goto LABEL_33;
        case 4:
          v34 = objc_alloc(MEMORY[0x24BDD17C8]);
          objc_msgSend(v2, "siriCoreSQLiteValue_escapedString:", 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "siriCoreSQLiteValue_escapedString:", 0);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v34, "initWithFormat:", CFSTR("%@ IS %@"), v18, v27);
          goto LABEL_33;
        case 5:
          v35 = objc_alloc(MEMORY[0x24BDD17C8]);
          objc_msgSend(v2, "siriCoreSQLiteValue_escapedString:", 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "siriCoreSQLiteValue_escapedString:", 0);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v35, "initWithFormat:", CFSTR("%@ IS NOT %@"), v18, v27);
          goto LABEL_33;
        case 6:
          v36 = objc_alloc(MEMORY[0x24BDD17C8]);
          objc_msgSend(v2, "siriCoreSQLiteValue_escapedString:", 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "initWithFormat:", CFSTR("%@ ISNULL"), v18);
          goto LABEL_40;
        case 7:
          v38 = objc_alloc(MEMORY[0x24BDD17C8]);
          objc_msgSend(v2, "siriCoreSQLiteValue_escapedString:", 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "siriCoreSQLiteValue_escapedString:", 0);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v38, "initWithFormat:", CFSTR("%@ LIKE %@"), v18, v27);
          goto LABEL_33;
        case 8:
          v55 = objc_alloc(MEMORY[0x24BDD17C8]);
          objc_msgSend(v2, "siriCoreSQLiteValue_escapedString:", 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "firstObject");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "siriCoreSQLiteValue_escapedString:", 0);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "lastObject");
          v57 = v16;
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "siriCoreSQLiteValue_escapedString:", 0);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v55, "initWithFormat:", CFSTR("%@ NOT BETWEEN %@ AND %@"), v18, v28, v30);
LABEL_30:
          v14 = (id)v31;

          v16 = v57;
          goto LABEL_34;
        case 9:
          v39 = objc_alloc(MEMORY[0x24BDD17C8]);
          objc_msgSend(v2, "siriCoreSQLiteValue_escapedString:", 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          SiriCoreSQLiteQueryCreateEscapedAndCommaSeparatedString(v15, 0);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v39, "initWithFormat:", CFSTR("%@ NOT IN (%@)"), v18, v27);
          goto LABEL_33;
        case 10:
          v40 = objc_alloc(MEMORY[0x24BDD17C8]);
          objc_msgSend(v2, "siriCoreSQLiteValue_escapedString:", 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "siriCoreSQLiteValue_escapedString:", 0);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v40, "initWithFormat:", CFSTR("%@ NOT LIKE %@"), v18, v27);
LABEL_33:
          v14 = (id)v33;
LABEL_34:

          goto LABEL_35;
        case 11:
          v42 = objc_alloc(MEMORY[0x24BDD17C8]);
          objc_msgSend(v2, "siriCoreSQLiteValue_escapedString:", 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v42, "initWithFormat:", CFSTR("%@ NOTNULL"), v18);
LABEL_40:
          v14 = (id)v37;
          goto LABEL_35;
        case 12:
          v51 = v15;
          v52 = v3;
          v53 = v2;
          v43 = objc_msgSend(v16, "count");
          v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v43);
          v58 = 0u;
          v59 = 0u;
          v60 = 0u;
          v61 = 0u;
          v56 = v16;
          v44 = v16;
          v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
          if (v45)
          {
            v46 = v45;
            v47 = *(_QWORD *)v59;
            do
            {
              v48 = 0;
              do
              {
                if (*(_QWORD *)v59 != v47)
                  objc_enumerationMutation(v44);
                SiriCoreSQLiteQueryCreateCriterionExpression(*(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * v48));
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                if (v49)
                {
                  v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("(%@)"), v49);
                  objc_msgSend(v18, "addObject:", v50);

                }
                ++v48;
              }
              while (v46 != v48);
              v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
            }
            while (v46);
          }

          if (objc_msgSend(v18, "count"))
          {
            v26 = CFSTR(" OR ");
LABEL_52:
            objc_msgSend(v18, "componentsJoinedByString:", v26);
            v14 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
LABEL_53:
            v14 = 0;
          }
          v3 = v52;
          v2 = v53;
          v15 = v51;
          v16 = v56;
LABEL_35:

          if (v14)
            v14 = v14;
          break;
        default:
          v14 = 0;
          break;
      }

      break;
  }

  return v14;
}

id SiriCoreSQLiteQueryCreateOrderExpression(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "columnNames");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count"))
    {
      v4 = objc_msgSend(v2, "mode");
      switch(v4)
      {
        case 2:
          v9 = objc_alloc(MEMORY[0x24BDD17C8]);
          SiriCoreSQLiteQueryCreateEscapedAndCommaSeparatedString(v3, 1);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = objc_msgSend(v9, "initWithFormat:", CFSTR("ORDER BY %@ DESC"), v6);
          goto LABEL_11;
        case 1:
          v10 = objc_alloc(MEMORY[0x24BDD17C8]);
          SiriCoreSQLiteQueryCreateEscapedAndCommaSeparatedString(v3, 1);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = objc_msgSend(v10, "initWithFormat:", CFSTR("ORDER BY %@ ASC"), v6);
          goto LABEL_11;
        case 0:
          v5 = objc_alloc(MEMORY[0x24BDD17C8]);
          SiriCoreSQLiteQueryCreateEscapedAndCommaSeparatedString(v3, 1);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = objc_msgSend(v5, "initWithFormat:", CFSTR("ORDER BY %@"), v6);
LABEL_11:
          v8 = (void *)v7;

          goto LABEL_12;
      }
    }
    v8 = 0;
LABEL_12:

    goto LABEL_13;
  }
  v8 = 0;
LABEL_13:

  return v8;
}

id SiriCoreSQLiteQueryCreateRangeExpression(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v9;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = objc_msgSend(v1, "offset");
    v4 = objc_alloc(MEMORY[0x24BDD17C8]);
    v5 = objc_msgSend(v2, "limit");
    if (v3)
      v6 = objc_msgSend(v4, "initWithFormat:", CFSTR("LIMIT %tu OFFSET %tu"), v5, v3);
    else
      v6 = objc_msgSend(v4, "initWithFormat:", CFSTR("LIMIT %tu"), v5, v9);
    v7 = (void *)v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __Block_byref_object_copy__1540(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1541(uint64_t a1)
{

}

uint64_t _RouteHostStringIsAcceptable(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  v2 = v1;
  if (v1 && (objc_msgSend(v1, "hasSuffix:", CFSTR("apple.com")) & 1) == 0)
    v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("17."));
  else
    v3 = 1;

  return v3;
}

uint64_t __Block_byref_object_copy__2165(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2166(uint64_t a1)
{

}

void sub_211AD6994(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  uint64_t v45;

  _Block_object_dispose(&a41, 8);
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose((const void *)(v45 - 160), 8);
  _Block_object_dispose((const void *)(v45 - 240), 8);
  _Block_object_dispose((const void *)(v45 - 208), 8);
  _Unwind_Resume(a1);
}

id WRM_iRATInterfaceFunction_2348()
{
  return (id)classWRM_iRATInterface_2354;
}

id initWRM_iRATInterface_2349()
{
  if (initWRM_iRATInterface_sOnce_2353 != -1)
    dispatch_once(&initWRM_iRATInterface_sOnce_2353, &__block_literal_global_287);
  return (id)classWRM_iRATInterface_2354;
}

Class __initWRM_iRATInterface_block_invoke_2355()
{
  Class result;

  if (WirelessCoexManagerLibrary_sOnce_2356 != -1)
    dispatch_once(&WirelessCoexManagerLibrary_sOnce_2356, &__block_literal_global_289);
  result = objc_getClass("WRM_iRATInterface");
  classWRM_iRATInterface_2354 = (uint64_t)result;
  getWRM_iRATInterfaceClass_2347 = WRM_iRATInterfaceFunction_2348;
  return result;
}

uint64_t __Block_byref_object_copy__2359(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2360(uint64_t a1)
{

}

void sub_211AD8F40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void SiriCoreNetworkQuality(BOOL *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;

  if (a1)
  {
    if (a2)
    {
      if (a2 == 2)
      {
        +[SiriCoreNetworkManager sharedInstance](SiriCoreNetworkManager, "sharedInstance");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = objc_msgSend(v3, "anyNetworkQuality");
      }
      else
      {
        +[SiriCoreNetworkManager sharedInstance](SiriCoreNetworkManager, "sharedInstance");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = objc_msgSend(v3, "cellularNetworkQuality");
      }
    }
    else
    {
      +[SiriCoreNetworkManager sharedInstance](SiriCoreNetworkManager, "sharedInstance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "wifiNetworkQuality");
    }
    v5 = v4;

    if (v5)
      *a1 = v5 != 2;
  }
}

const __CFString *SiriCoreConnectionTechnologyGetDescription(uint64_t a1)
{
  uint64_t v1;
  const __CFString *result;

  if (a1 > 2999)
  {
    switch(a1)
    {
      case 3000:
      case 3006:
        result = CFSTR("MPTCP");
        break;
      case 3001:
        result = CFSTR("LedBelly");
        break;
      case 3002:
        result = CFSTR("IDS");
        break;
      case 3003:
        result = CFSTR("POP");
        break;
      case 3004:
        result = CFSTR("Florence");
        break;
      case 3005:
        result = CFSTR("Local");
        break;
      default:
LABEL_8:
        result = CFSTR("Unknown");
        break;
    }
  }
  else
  {
    v1 = a1 - 2000;
    result = CFSTR("UTRAN");
    switch(v1)
    {
      case 0:
        result = CFSTR("WWAN");
        break;
      case 1:
        return result;
      case 2:
        result = CFSTR("2G CDMA1x");
        break;
      case 3:
        result = CFSTR("LTE");
        break;
      case 4:
        result = CFSTR("2G GPRS");
        break;
      case 5:
        result = CFSTR("2G Edge");
        break;
      case 6:
        result = CFSTR("3G WCDMA");
        break;
      case 7:
        result = CFSTR("3G HSDPA");
        break;
      case 8:
        result = CFSTR("3G HSUPA");
        break;
      case 9:
        result = CFSTR("3G EVDORev0");
        break;
      case 10:
        result = CFSTR("3G EVDORevA");
        break;
      case 11:
        result = CFSTR("CDMA EVDORevB");
        break;
      case 12:
        result = CFSTR("HRPD");
        break;
      case 13:
        result = CFSTR("5G NRNSA");
        break;
      case 14:
        result = CFSTR("5G NR");
        break;
      default:
        if (CFSTR("UTRAN") != (__CFString *)1000)
          goto LABEL_8;
        result = CFSTR("Wi-Fi");
        break;
    }
  }
  return result;
}

id SiriCoreSQLiteDatabaseCreateSQLiteAPIErrorFromResultCode(int a1, uint64_t a2)
{
  const char *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (a1)
  {
    v4 = sqlite3_errstr(a1);
    if (v4)
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v4);
      v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v7 = v6;
      if (v5)
      {
        objc_msgSend(v6, "setObject:forKey:", v5, *MEMORY[0x24BDD0FC8]);

      }
    }
    else
    {
      v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v9, CFSTR("SiriCoreSQLiteAPIErrorExtendedCode"));

    v10 = (void *)MEMORY[0x24BDD1540];
    v11 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("SiriCoreSQLiteAPIErrorDomain"), a1, v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

BOOL SiriCoreSQLiteDatabaseIsErrorUnrecoverable(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  _BOOL8 v9;

  v1 = a1;
  objc_msgSend(v1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "isEqualToString:", CFSTR("SiriCoreSQLiteDatabaseErrorDomain")))
    goto LABEL_10;
  v3 = objc_msgSend(v1, "code");

  if (v3 != 2)
  {
    v9 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v1, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDD1398]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("SiriCoreSQLiteAPIErrorDomain"));

  if (v6)
  {
    v7 = objc_msgSend(v2, "code");
    v9 = v7 == 11 || v7 == 26;
  }
  else
  {
LABEL_10:
    v9 = 0;
  }

LABEL_13:
  return v9;
}

void sub_211ADAE64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2662(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2663(uint64_t a1)
{

}

void sub_211ADB3BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id _SiriCoreSQLiteApplyIndexToQuery(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;

  v3 = a1;
  v4 = a2;
  if (v3 && objc_msgSend(v3, "length"))
  {
    objc_msgSend(v4, "stringByAppendingFormat:", CFSTR(" INDEXED BY %@"), v3);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v5;
  }

  return v4;
}

void sub_211ADEA10(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 136));
  _Unwind_Resume(a1);
}

void sub_211ADFF40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *SiriCoreUUIDStringCreate()
{
  const __CFUUID *v0;
  __CFString *v1;

  v0 = CFUUIDCreate(0);
  v1 = (__CFString *)CFUUIDCreateString(0, v0);
  if (v0)
    CFRelease(v0);
  return v1;
}

id SiriCoreUserAgentStringCreate(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v1 = a1;
  AFProductType();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD17C8];
  AFDeviceName();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(v1, "stringByAppendingString:", v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v2;
  }
  AFProductName();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  AFProductVersion();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  AFBuildVersion();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Assistant(%@/%@; %@/%@/%@) Ace/%@"),
    v4,
    v5,
    v6,
    v7,
    v8,
    *MEMORY[0x24BE81A80]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  return v9;
}

id productTypeFromUserAgentString(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = (void *)MEMORY[0x24BDD14A8];
  v2 = a1;
  objc_msgSend(v1, "characterSetWithCharactersInString:", CFSTR("(/;)"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsSeparatedByCharactersInSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v4, "count") >= 3)
  {
    objc_msgSend(v4, "objectAtIndex:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void sub_211AE537C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3571(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3572(uint64_t a1)
{

}

id _SiriCoreSharedResourcesDirectory()
{
  if (_SiriCoreSharedResourcesDirectory_once != -1)
    dispatch_once(&_SiriCoreSharedResourcesDirectory_once, &__block_literal_global_3639);
  return (id)_SiriCoreSharedResourcesDirectory_sUserSupportDirectoryPath;
}

uint64_t AFAnalyticsContextCreateWithError()
{
  return MEMORY[0x24BE08B68]();
}

uint64_t AFAnalyticsContextsMerge()
{
  return MEMORY[0x24BE08B88]();
}

uint64_t AFAnalyticsEventTypeGetName()
{
  return MEMORY[0x24BE08B98]();
}

uint64_t AFBuildVersion()
{
  return MEMORY[0x24BE08BD0]();
}

uint64_t AFDeviceName()
{
  return MEMORY[0x24BE08C58]();
}

uint64_t AFDeviceRegionCode()
{
  return MEMORY[0x24BE08C60]();
}

uint64_t AFDeviceSupportsSiriUOD()
{
  return MEMORY[0x24BE08CC0]();
}

uint64_t AFDeviceSupportsWiFiLPASMode()
{
  return MEMORY[0x24BE08CD8]();
}

uint64_t AFErrorEnumerate()
{
  return MEMORY[0x24BE08D00]();
}

uint64_t AFHasCellularData()
{
  return MEMORY[0x24BE08D38]();
}

uint64_t AFIsHorseman()
{
  return MEMORY[0x24BE08D98]();
}

uint64_t AFIsInternalInstall()
{
  return MEMORY[0x24BE08DA8]();
}

uint64_t AFIsNano()
{
  return MEMORY[0x24BE08DB8]();
}

uint64_t AFMachAbsoluteTimeGetTimeInterval()
{
  return MEMORY[0x24BE08E18]();
}

uint64_t AFProductName()
{
  return MEMORY[0x24BE08EF8]();
}

uint64_t AFProductType()
{
  return MEMORY[0x24BE08F00]();
}

uint64_t AFProductVersion()
{
  return MEMORY[0x24BE08F08]();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC358](data, *(_QWORD *)&len, md);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

Boolean CFHTTPMessageAppendBytes(CFHTTPMessageRef message, const UInt8 *newBytes, CFIndex numBytes)
{
  return MEMORY[0x24BDB7298](message, newBytes, numBytes);
}

CFDictionaryRef CFHTTPMessageCopyAllHeaderFields(CFHTTPMessageRef message)
{
  return (CFDictionaryRef)MEMORY[0x24BDB72A0](message);
}

CFDataRef CFHTTPMessageCopyBody(CFHTTPMessageRef message)
{
  return (CFDataRef)MEMORY[0x24BDB72A8](message);
}

CFStringRef CFHTTPMessageCopyHeaderFieldValue(CFHTTPMessageRef message, CFStringRef headerField)
{
  return (CFStringRef)MEMORY[0x24BDB72B0](message, headerField);
}

CFDataRef CFHTTPMessageCopySerializedMessage(CFHTTPMessageRef message)
{
  return (CFDataRef)MEMORY[0x24BDB72C8](message);
}

CFHTTPMessageRef CFHTTPMessageCreateEmpty(CFAllocatorRef alloc, Boolean isRequest)
{
  return (CFHTTPMessageRef)MEMORY[0x24BDB72D0](alloc, isRequest);
}

CFHTTPMessageRef CFHTTPMessageCreateRequest(CFAllocatorRef alloc, CFStringRef requestMethod, CFURLRef url, CFStringRef httpVersion)
{
  return (CFHTTPMessageRef)MEMORY[0x24BDB72D8](alloc, requestMethod, url, httpVersion);
}

CFIndex CFHTTPMessageGetResponseStatusCode(CFHTTPMessageRef response)
{
  return MEMORY[0x24BDB72E8](response);
}

Boolean CFHTTPMessageIsHeaderComplete(CFHTTPMessageRef message)
{
  return MEMORY[0x24BDB72F8](message);
}

void CFHTTPMessageSetHeaderFieldValue(CFHTTPMessageRef message, CFStringRef headerField, CFStringRef value)
{
  MEMORY[0x24BDB7310](message, headerField, value);
}

void CFReadStreamSetDispatchQueue(CFReadStreamRef stream, dispatch_queue_t q)
{
  MEMORY[0x24BDBC278](stream, q);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8D0](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x24BDBC8E8](alloc, uuid);
}

void CFWriteStreamSetDispatchQueue(CFWriteStreamRef stream, dispatch_queue_t q)
{
  MEMORY[0x24BDBC9C0](stream, q);
}

Boolean CFWriteStreamSetProperty(CFWriteStreamRef stream, CFStreamPropertyKey propertyName, CFTypeRef propertyValue)
{
  return MEMORY[0x24BDBC9C8](stream, propertyName, propertyValue);
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x24BE04728]();
}

void *__cdecl NSMapGet(NSMapTable *table, const void *key)
{
  return (void *)MEMORY[0x24BDD1018](table, key);
}

void NSMapInsert(NSMapTable *table, const void *key, const void *value)
{
  MEMORY[0x24BDD1020](table, key, value);
}

void NSMapRemove(NSMapTable *table, const void *key)
{
  MEMORY[0x24BDD1038](table, key);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t NetworkServiceProxyEnableInParameters()
{
  return MEMORY[0x24BE6B710]();
}

uint64_t NetworkServiceProxyIsEnabled()
{
  return MEMORY[0x24BE6B718]();
}

uint64_t NetworkServiceProxySetServiceNameForConnection()
{
  return MEMORY[0x24BE6B720]();
}

uint64_t NetworkServiceProxySetServiceNameInParameters()
{
  return MEMORY[0x24BE6B728]();
}

uint64_t TRIProject_ProjectId_IsValidValue()
{
  return MEMORY[0x24BEBA9A8]();
}

uint64_t WiFiDeviceClientCopyCurrentNetwork()
{
  return MEMORY[0x24BE678E8]();
}

uint64_t WiFiManagerClientCopyDevices()
{
  return MEMORY[0x24BE67990]();
}

uint64_t WiFiManagerClientCreate()
{
  return MEMORY[0x24BE679D0]();
}

uint64_t WiFiManagerClientGetPower()
{
  return MEMORY[0x24BE67A30]();
}

uint64_t WiFiManagerClientSetType()
{
  return MEMORY[0x24BE67B50]();
}

uint64_t WiFiNetworkGetChannel()
{
  return MEMORY[0x24BE67BE0]();
}

uint64_t WiFiNetworkGetChannelWidthInMHz()
{
  return MEMORY[0x24BE67BE8]();
}

uint64_t WiFiNetworkGetIntProperty()
{
  return MEMORY[0x24BE67C00]();
}

uint64_t WiFiNetworkGetOperatingBand()
{
  return MEMORY[0x24BE67C18]();
}

uint64_t WiFiNetworkGetPhyMode()
{
  return MEMORY[0x24BE67C28]();
}

uint64_t WiFiNetworkIsCaptive()
{
  return MEMORY[0x24BE67C78]();
}

uint64_t _AFMemoryPressureConditionGetName()
{
  return MEMORY[0x24BE093F8]();
}

uint64_t _AFPreferencesForceOnDeviceOnlyDictationEnabled()
{
  return MEMORY[0x24BE09408]();
}

uint64_t _AFPreferencesGetTuscanyStatus()
{
  return MEMORY[0x24BE09420]();
}

uint64_t _AFPreferencesNetworkStackOverride()
{
  return MEMORY[0x24BE09428]();
}

uint64_t _AFPreferencesShouldUseTFO()
{
  return MEMORY[0x24BE09440]();
}

uint64_t _AFPreferencesShowAllDialogVariantsEnabled()
{
  return MEMORY[0x24BE09448]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CTServerConnectionCreateOnTargetQueue()
{
  return MEMORY[0x24BDC2888]();
}

uint64_t _CTServerConnectionDormancySuspendAssertionCreateWithExpirationCB()
{
  return MEMORY[0x24BDC28A8]();
}

uint64_t _CTServerForceFastDormancy()
{
  return MEMORY[0x24BDC2998]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x24BDAD170](*(_QWORD *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x24BEDF1C8](strm, *(_QWORD *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x24BEDF1D8](strm);
}

int deflateInit_(z_streamp strm, int level, const char *version, int stream_size)
{
  return MEMORY[0x24BEDF1E8](strm, *(_QWORD *)&level, version, *(_QWORD *)&stream_size);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

BOOL dispatch_data_apply(dispatch_data_t data, dispatch_data_applier_t applier)
{
  return MEMORY[0x24BDADD48](data, applier);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x24BDADD60](buffer, size, queue, destructor);
}

dispatch_data_t dispatch_data_create_concat(dispatch_data_t data1, dispatch_data_t data2)
{
  return (dispatch_data_t)MEMORY[0x24BDADD70](data1, data2);
}

dispatch_data_t dispatch_data_create_subrange(dispatch_data_t data, size_t offset, size_t length)
{
  return (dispatch_data_t)MEMORY[0x24BDADD80](data, offset, length);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x24BDADD90](data);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDB8](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED8](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int getnameinfo(const sockaddr *a1, socklen_t a2, char *a3, socklen_t a4, char *a5, socklen_t a6, int a7)
{
  return MEMORY[0x24BDAE6A0](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5, *(_QWORD *)&a6, *(_QWORD *)&a7);
}

char *__cdecl if_indextoname(unsigned int a1, char *a2)
{
  return (char *)MEMORY[0x24BDAE850](*(_QWORD *)&a1, a2);
}

unsigned int if_nametoindex(const char *a1)
{
  return MEMORY[0x24BDAE860](a1);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x24BEDF260](strm, *(_QWORD *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x24BEDF268](strm);
}

int inflateInit_(z_streamp strm, const char *version, int stream_size)
{
  return MEMORY[0x24BEDF278](strm, version, *(_QWORD *)&stream_size);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x24BDAE8C8](*(_QWORD *)&a1, a2);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x24BDAE958]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

uint64_t nw_activity_activate()
{
  return MEMORY[0x24BDE0950]();
}

uint64_t nw_activity_complete_with_reason_and_underlying_error()
{
  return MEMORY[0x24BDE0970]();
}

uint64_t nw_activity_create()
{
  return MEMORY[0x24BDE0990]();
}

uint64_t nw_activity_get_label()
{
  return MEMORY[0x24BDE09C0]();
}

uint64_t nw_activity_get_token()
{
  return MEMORY[0x24BDE09C8]();
}

uint64_t nw_activity_set_parent_activity()
{
  return MEMORY[0x24BDE09E8]();
}

uint64_t nw_array_get_count()
{
  return MEMORY[0x24BDE0A48]();
}

uint64_t nw_array_get_object_at_index()
{
  return MEMORY[0x24BDE0A50]();
}

void nw_connection_access_establishment_report(nw_connection_t connection, dispatch_queue_t queue, nw_establishment_report_access_block_t access_block)
{
  MEMORY[0x24BDE0AE8](connection, queue, access_block);
}

void nw_connection_cancel(nw_connection_t connection)
{
  MEMORY[0x24BDE0AF8](connection);
}

uint64_t nw_connection_copy_attempted_endpoint_array()
{
  return MEMORY[0x24BDE0B10]();
}

uint64_t nw_connection_copy_connected_path()
{
  return MEMORY[0x24BDE0B20]();
}

uint64_t nw_connection_copy_connected_remote_endpoint()
{
  return MEMORY[0x24BDE0B28]();
}

nw_path_t nw_connection_copy_current_path(nw_connection_t connection)
{
  return (nw_path_t)MEMORY[0x24BDE0B30](connection);
}

char *__cdecl nw_connection_copy_description(nw_connection_t connection)
{
  return (char *)MEMORY[0x24BDE0B38](connection);
}

nw_protocol_metadata_t nw_connection_copy_protocol_metadata(nw_connection_t connection, nw_protocol_definition_t definition)
{
  return (nw_protocol_metadata_t)MEMORY[0x24BDE0B50](connection, definition);
}

uint64_t nw_connection_copy_tcp_info()
{
  return MEMORY[0x24BDE0B60]();
}

nw_connection_t nw_connection_create(nw_endpoint_t endpoint, nw_parameters_t parameters)
{
  return (nw_connection_t)MEMORY[0x24BDE0B68](endpoint, parameters);
}

uint64_t nw_connection_end_activity()
{
  return MEMORY[0x24BDE0B98]();
}

uint64_t nw_connection_fillout_tcp_statistics()
{
  return MEMORY[0x24BDE0BA0]();
}

uint64_t nw_connection_get_id()
{
  return MEMORY[0x24BDE0BB8]();
}

uint64_t nw_connection_multipath_copy_subflow_counts()
{
  return MEMORY[0x24BDE0C08]();
}

uint64_t nw_connection_multipath_get_primary_subflow_interface_index()
{
  return MEMORY[0x24BDE0C10]();
}

uint64_t nw_connection_multipath_get_subflow_count()
{
  return MEMORY[0x24BDE0C18]();
}

void nw_connection_receive(nw_connection_t connection, uint32_t minimum_incomplete_length, uint32_t maximum_length, nw_connection_receive_completion_t completion)
{
  MEMORY[0x24BDE0C28](connection, *(_QWORD *)&minimum_incomplete_length, *(_QWORD *)&maximum_length, completion);
}

void nw_connection_send(nw_connection_t connection, dispatch_data_t content, nw_content_context_t context, BOOL is_complete, nw_connection_send_completion_t completion)
{
  MEMORY[0x24BDE0C58](connection, content, context, is_complete, completion);
}

void nw_connection_set_better_path_available_handler(nw_connection_t connection, nw_connection_BOOLean_event_handler_t handler)
{
  MEMORY[0x24BDE0C68](connection, handler);
}

uint64_t nw_connection_set_event_handler()
{
  return MEMORY[0x24BDE0C80]();
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
  MEMORY[0x24BDE0C98](connection, queue);
}

uint64_t nw_connection_set_read_close_handler()
{
  return MEMORY[0x24BDE0CA0]();
}

void nw_connection_set_viability_changed_handler(nw_connection_t connection, nw_connection_BOOLean_event_handler_t handler)
{
  MEMORY[0x24BDE0CB8](connection, handler);
}

uint64_t nw_connection_set_write_close_handler()
{
  return MEMORY[0x24BDE0CC0]();
}

void nw_connection_start(nw_connection_t connection)
{
  MEMORY[0x24BDE0CD0](connection);
}

uint64_t nw_connection_start_activity()
{
  return MEMORY[0x24BDE0CD8]();
}

uint64_t nw_connection_uses_multipath()
{
  return MEMORY[0x24BDE0CF8]();
}

uint64_t nw_context_create()
{
  return MEMORY[0x24BDE0DA0]();
}

uint64_t nw_context_set_isolate_protocol_cache()
{
  return MEMORY[0x24BDE0DB8]();
}

uint64_t nw_context_set_isolate_protocol_stack()
{
  return MEMORY[0x24BDE0DC0]();
}

uint64_t nw_context_set_privacy_level()
{
  return MEMORY[0x24BDE0DC8]();
}

uint64_t nw_context_set_scheduling_mode()
{
  return MEMORY[0x24BDE0DD0]();
}

char *__cdecl nw_endpoint_copy_port_string(nw_endpoint_t endpoint)
{
  return (char *)MEMORY[0x24BDE0E50](endpoint);
}

nw_endpoint_t nw_endpoint_create_host(const char *hostname, const char *port)
{
  return (nw_endpoint_t)MEMORY[0x24BDE0E88](hostname, port);
}

uint64_t nw_endpoint_get_description()
{
  return MEMORY[0x24BDE0EF8]();
}

nw_endpoint_type_t nw_endpoint_get_type(nw_endpoint_t endpoint)
{
  return MEMORY[0x24BDE0F50](endpoint);
}

uint64_t nw_endpoint_set_alternate_port()
{
  return MEMORY[0x24BDE0F90]();
}

CFErrorRef nw_error_copy_cf_error(nw_error_t error)
{
  return (CFErrorRef)MEMORY[0x24BDE0FA8](error);
}

int nw_error_get_error_code(nw_error_t error)
{
  return MEMORY[0x24BDE0FB8](error);
}

nw_error_domain_t nw_error_get_error_domain(nw_error_t error)
{
  return MEMORY[0x24BDE0FC8](error);
}

nw_endpoint_t nw_establishment_report_copy_proxy_endpoint(nw_establishment_report_t report)
{
  return (nw_endpoint_t)MEMORY[0x24BDE0FD0](report);
}

void nw_establishment_report_enumerate_protocols(nw_establishment_report_t report, nw_report_protocol_enumerator_t enumerate_block)
{
  MEMORY[0x24BDE0FE0](report, enumerate_block);
}

void nw_establishment_report_enumerate_resolutions(nw_establishment_report_t report, nw_report_resolution_enumerator_t enumerate_block)
{
  MEMORY[0x24BDE0FF0](report, enumerate_block);
}

uint64_t nw_establishment_report_get_attempt_started_after_milliseconds(nw_establishment_report_t report)
{
  return MEMORY[0x24BDE0FF8](report);
}

uint64_t nw_establishment_report_get_duration_milliseconds(nw_establishment_report_t report)
{
  return MEMORY[0x24BDE1000](report);
}

uint32_t nw_establishment_report_get_previous_attempt_count(nw_establishment_report_t report)
{
  return MEMORY[0x24BDE1008](report);
}

BOOL nw_establishment_report_get_proxy_configured(nw_establishment_report_t report)
{
  return MEMORY[0x24BDE1010](report);
}

BOOL nw_establishment_report_get_used_proxy(nw_establishment_report_t report)
{
  return MEMORY[0x24BDE1018](report);
}

uint32_t nw_interface_get_index(nw_interface_t interface)
{
  return MEMORY[0x24BDE13A8](interface);
}

const char *__cdecl nw_interface_get_name(nw_interface_t interface)
{
  return (const char *)MEMORY[0x24BDE13C0](interface);
}

nw_interface_type_t nw_interface_get_type(nw_interface_t interface)
{
  return MEMORY[0x24BDE13D8](interface);
}

nw_parameters_t nw_parameters_create_secure_tcp(nw_parameters_configure_protocol_block_t configure_tls, nw_parameters_configure_protocol_block_t configure_tcp)
{
  return (nw_parameters_t)MEMORY[0x24BDE1588](configure_tls, configure_tcp);
}

uint64_t nw_parameters_set_context()
{
  return MEMORY[0x24BDE1648]();
}

uint64_t nw_parameters_set_data_mode()
{
  return MEMORY[0x24BDE1658]();
}

void nw_parameters_set_expired_dns_behavior(nw_parameters_t parameters, nw_parameters_expired_dns_behavior_t expired_dns_behavior)
{
  MEMORY[0x24BDE1678](parameters, *(_QWORD *)&expired_dns_behavior);
}

uint64_t nw_parameters_set_indefinite()
{
  return MEMORY[0x24BDE16A8]();
}

uint64_t nw_parameters_set_initial_data_payload()
{
  return MEMORY[0x24BDE16B0]();
}

void nw_parameters_set_multipath_service(nw_parameters_t parameters, nw_multipath_service_t multipath_service)
{
  MEMORY[0x24BDE16E0](parameters, *(_QWORD *)&multipath_service);
}

void nw_parameters_set_required_interface_type(nw_parameters_t parameters, nw_interface_type_t interface_type)
{
  MEMORY[0x24BDE1748](parameters, *(_QWORD *)&interface_type);
}

uint64_t nw_parameters_set_source_application()
{
  return MEMORY[0x24BDE1770]();
}

uint64_t nw_parameters_set_tfo()
{
  return MEMORY[0x24BDE1780]();
}

uint64_t nw_parameters_set_tls_session_id()
{
  return MEMORY[0x24BDE1788]();
}

uint64_t nw_parameters_set_traffic_class()
{
  return MEMORY[0x24BDE1790]();
}

uint64_t nw_path_copy_interface()
{
  return MEMORY[0x24BDE17D8]();
}

uint64_t nw_path_create_evaluator_for_endpoint()
{
  return MEMORY[0x24BDE17F0]();
}

void nw_path_enumerate_gateways(nw_path_t path, nw_path_enumerate_gateways_block_t enumerate_block)
{
  MEMORY[0x24BDE1800](path, enumerate_block);
}

void nw_path_enumerate_interfaces(nw_path_t path, nw_path_enumerate_interfaces_block_t enumerate_block)
{
  MEMORY[0x24BDE1808](path, enumerate_block);
}

uint64_t nw_path_evaluator_cancel()
{
  return MEMORY[0x24BDE1818]();
}

uint64_t nw_path_evaluator_set_update_handler()
{
  return MEMORY[0x24BDE1848]();
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x24BDE1938](path);
}

BOOL nw_path_has_dns(nw_path_t path)
{
  return MEMORY[0x24BDE1968](path);
}

BOOL nw_path_has_ipv4(nw_path_t path)
{
  return MEMORY[0x24BDE1978](path);
}

BOOL nw_path_has_ipv6(nw_path_t path)
{
  return MEMORY[0x24BDE1988](path);
}

BOOL nw_path_is_constrained(nw_path_t path)
{
  return MEMORY[0x24BDE19A0](path);
}

BOOL nw_path_is_expensive(nw_path_t path)
{
  return MEMORY[0x24BDE19C8](path);
}

BOOL nw_path_uses_interface_type(nw_path_t path, nw_interface_type_t interface_type)
{
  return MEMORY[0x24BDE1A68](path, *(_QWORD *)&interface_type);
}

nw_protocol_definition_t nw_protocol_copy_tls_definition(void)
{
  return (nw_protocol_definition_t)MEMORY[0x24BDE1B88]();
}

void nw_tcp_options_set_enable_keepalive(nw_protocol_options_t options, BOOL enable_keepalive)
{
  MEMORY[0x24BDE25B8](options, enable_keepalive);
}

void nw_tcp_options_set_keepalive_count(nw_protocol_options_t options, uint32_t keepalive_count)
{
  MEMORY[0x24BDE25C0](options, *(_QWORD *)&keepalive_count);
}

void nw_tcp_options_set_keepalive_idle_time(nw_protocol_options_t options, uint32_t keepalive_idle_time)
{
  MEMORY[0x24BDE25C8](options, *(_QWORD *)&keepalive_idle_time);
}

void nw_tcp_options_set_keepalive_interval(nw_protocol_options_t options, uint32_t keepalive_interval)
{
  MEMORY[0x24BDE25D0](options, *(_QWORD *)&keepalive_interval);
}

void nw_tcp_options_set_no_delay(nw_protocol_options_t options, BOOL no_delay)
{
  MEMORY[0x24BDE25D8](options, no_delay);
}

void nw_tcp_options_set_retransmit_connection_drop_time(nw_protocol_options_t options, uint32_t retransmit_connection_drop_time)
{
  MEMORY[0x24BDE25E0](options, *(_QWORD *)&retransmit_connection_drop_time);
}

sec_protocol_options_t nw_tls_copy_sec_protocol_options(nw_protocol_options_t options)
{
  return (sec_protocol_options_t)MEMORY[0x24BDE2600](options);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x24BDAF6F8](*(_QWORD *)&pid, *(_QWORD *)&flavor, arg, buffer, *(_QWORD *)&buffersize);
}

tls_protocol_version_t sec_protocol_metadata_get_negotiated_tls_protocol_version(sec_protocol_metadata_t metadata)
{
  return (unsigned __int16)MEMORY[0x24BDE95C0](metadata);
}

void sec_protocol_options_add_tls_application_protocol(sec_protocol_options_t options, const char *application_protocol)
{
  MEMORY[0x24BDE95D8](options, application_protocol);
}

void sec_protocol_options_set_max_tls_protocol_version(sec_protocol_options_t options, tls_protocol_version_t version)
{
  MEMORY[0x24BDE9628](options, version);
}

void sec_protocol_options_set_tls_false_start_enabled(sec_protocol_options_t options, BOOL false_start_enabled)
{
  MEMORY[0x24BDE9690](options, false_start_enabled);
}

void sec_protocol_options_set_tls_resumption_enabled(sec_protocol_options_t options, BOOL resumption_enabled)
{
  MEMORY[0x24BDE9698](options, resumption_enabled);
}

void sec_protocol_options_set_tls_tickets_enabled(sec_protocol_options_t options, BOOL tickets_enabled)
{
  MEMORY[0x24BDE96A8](options, tickets_enabled);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x24BDAFE50](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sqlite3_bind_blob64(sqlite3_stmt *a1, int a2, const void *a3, sqlite3_uint64 a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x24BEDDF50](a1, *(_QWORD *)&a2, a3, a4, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x24BEDDF58](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x24BEDDF68](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x24BEDDF70](a1, *(_QWORD *)&a2);
}

int sqlite3_bind_parameter_count(sqlite3_stmt *a1)
{
  return MEMORY[0x24BEDDF78](a1);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x24BEDDF98](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x24BEDE008](a1);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return MEMORY[0x24BEDE018](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x24BEDE020](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE028](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE038](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  double result;

  MEMORY[0x24BEDE048](a1, *(_QWORD *)&iCol);
  return result;
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE058](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x24BEDE060](a1, *(_QWORD *)&N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x24BEDE068](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE078](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return (const char *)MEMORY[0x24BEDE110](*(_QWORD *)&a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x24BEDE118](a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_errcode(sqlite3 *db)
{
  return MEMORY[0x24BEDE128](db);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE140](pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x24BEDE1C0](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x24BEDE1D0](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE1E0](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x24BEDE2A8](a1);
}

int sqlite3_wal_checkpoint_v2(sqlite3 *db, const char *zDb, int eMode, int *pnLog, int *pnCkpt)
{
  return MEMORY[0x24BEDE398](db, zDb, *(_QWORD *)&eMode, pnLog, pnCkpt);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x24BDB0180](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x24BDB0328](uu);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x24BDB0868](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x24BDB0880](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x24BDB0888](xdata);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x24BDB08B0](xdict, applier);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x24BDB0910](xdict);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x24BDB0BE0](xuint);
}

