@implementation SiriCoreConnectionMetrics

- (void)setConnectionMetricsFromStream:(id)a3 isPop:(BOOL)a4 withCompletion:(id)a5
{
  if (a4)
    -[SiriCoreConnectionMetrics setConnectionMetricsFromStreamForPOP:withCompletion:](self, "setConnectionMetricsFromStreamForPOP:withCompletion:", a3, a5);
  else
    -[SiriCoreConnectionMetrics setConnectionMetricsFromStreamForDirect:withCompletion:](self, "setConnectionMetricsFromStreamForDirect:withCompletion:", a3, a5);
}

- (void)setConnectionMetricsFromStreamForDirect:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  const __CFString *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  char v29[256];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  objc_msgSend(v6, "propertyForKey:", *MEMORY[0x24BDB7650]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  if (v9)
  {
    v10 = v9;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", v9);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", v10);
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __84__SiriCoreConnectionMetrics_setConnectionMetricsFromStreamForDirect_withCompletion___block_invoke;
    v26[3] = &unk_24CCE5F68;
    v27 = v11;
    v28 = v12;
    v13 = v12;
    v14 = v11;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v26);
    -[SiriCoreConnectionMetrics setTCPInfoMetricsByInterfaceName:](self, "setTCPInfoMetricsByInterfaceName:", v14);
    -[SiriCoreConnectionMetrics setFlowNetworkInterfaceType:](self, "setFlowNetworkInterfaceType:", v13);

  }
  else
  {
    -[SiriCoreConnectionMetrics setTCPInfoMetricsByInterfaceName:](self, "setTCPInfoMetricsByInterfaceName:", 0);
  }
  objc_msgSend(v6, "propertyForKey:", *MEMORY[0x24BDB7718]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "BOOLValue");

  if (v16)
  {
    objc_msgSend(v6, "propertyForKey:", *MEMORY[0x24BDB7778]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriCoreConnectionMetrics setSubflowCount:](self, "setSubflowCount:", v17);

    objc_msgSend(v6, "propertyForKey:", *MEMORY[0x24BDB7768]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriCoreConnectionMetrics setConnectedSubflowCount:](self, "setConnectedSubflowCount:", v18);

    objc_msgSend(v6, "propertyForKey:", *MEMORY[0x24BDB7770]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriCoreConnectionMetrics setPrimarySubflowInterfaceName:](self, "setPrimarySubflowInterfaceName:", v19);

    objc_msgSend(v6, "propertyForKey:", *MEMORY[0x24BDB7780]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriCoreConnectionMetrics setSubflowSwitchCounts:](self, "setSubflowSwitchCounts:", v20);

  }
  else
  {
    -[SiriCoreConnectionMetrics setSubflowCount:](self, "setSubflowCount:", 0);
    -[SiriCoreConnectionMetrics setConnectedSubflowCount:](self, "setConnectedSubflowCount:", 0);
    -[SiriCoreConnectionMetrics setPrimarySubflowInterfaceName:](self, "setPrimarySubflowInterfaceName:", 0);
    -[SiriCoreConnectionMetrics setSubflowSwitchCounts:](self, "setSubflowSwitchCounts:", 0);
  }
  objc_msgSend(v6, "propertyForKey:", CFSTR("__kCFStreamPropertyPeerAddress"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    v23 = objc_retainAutorelease(v21);
    if (!getnameinfo((const sockaddr *)objc_msgSend(v23, "bytes"), objc_msgSend(v23, "length"), v29, 0x100u, 0, 0, 2))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v29, 4);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
        -[SiriCoreConnectionMetrics setConnectionEdgeID:](self, "setConnectionEdgeID:", v25);

      if (v7)
        goto LABEL_12;
      goto LABEL_13;
    }
    v24 = CFSTR("addressUnavailable");
  }
  else
  {
    v24 = CFSTR("peerUnavailable");
  }
  -[SiriCoreConnectionMetrics setConnectionEdgeID:](self, "setConnectionEdgeID:", v24);
  if (v7)
LABEL_12:
    v7[2](v7);
LABEL_13:

}

- (void)setConnectionMetricsFromStreamForPOP:(id)a3 withCompletion:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;

  v6 = (objc_class *)MEMORY[0x24BE6B730];
  v7 = a4;
  v8 = a3;
  v9 = (id)objc_msgSend([v6 alloc], "initFromStream:", v8);

  -[SiriCoreConnectionMetrics _setConnectionMetricsFromNSPControlConnection:withCompletion:](self, "_setConnectionMetricsFromNSPControlConnection:withCompletion:", v9, v7);
}

- (void)setTCPInfoMetricsByInterfaceName:(id)a3
{
  NSDictionary *v4;
  NSDictionary *tcpInfoMetricsByInterfaceName;

  v4 = (NSDictionary *)objc_msgSend(a3, "copy");
  tcpInfoMetricsByInterfaceName = self->_tcpInfoMetricsByInterfaceName;
  self->_tcpInfoMetricsByInterfaceName = v4;

}

- (void)_setConnectionMetricsTCPInfo:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v10 = a3;
  v4 = objc_msgSend(v10, "count");
  if (v4)
  {
    v5 = v4;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", v4);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", v5);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __58__SiriCoreConnectionMetrics__setConnectionMetricsTCPInfo___block_invoke;
    v11[3] = &unk_24CCE5F68;
    v12 = v6;
    v13 = v7;
    v8 = v7;
    v9 = v6;
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v11);
    -[SiriCoreConnectionMetrics setTCPInfoMetricsByInterfaceName:](self, "setTCPInfoMetricsByInterfaceName:", v9);
    -[SiriCoreConnectionMetrics setFlowNetworkInterfaceType:](self, "setFlowNetworkInterfaceType:", v8);

  }
  else
  {
    -[SiriCoreConnectionMetrics setTCPInfoMetricsByInterfaceName:](self, "setTCPInfoMetricsByInterfaceName:", 0);
  }

}

- (void)_setConnectionMetricsFromNSPControlConnection:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  void (**v11)(_QWORD);
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = v7;
  if (v6)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __90__SiriCoreConnectionMetrics__setConnectionMetricsFromNSPControlConnection_withCompletion___block_invoke;
    v10[3] = &unk_24CCE5F90;
    v10[4] = self;
    v11 = v7;
    objc_msgSend(v6, "fetchConnectionInfoWithCompletionHandler:", v10);

  }
  else
  {
    if (v7)
      v7[2](v7);
    v9 = *MEMORY[0x24BE08FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FF8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[SiriCoreConnectionMetrics _setConnectionMetricsFromNSPControlConnection:withCompletion:]";
      _os_log_error_impl(&dword_211AB2000, v9, OS_LOG_TYPE_ERROR, "%s NSP Control Connection was nil. Stream did not use NSP.", buf, 0xCu);
    }
  }

}

- (void)setConnectionMetricsFromConnection:(id)a3 isPop:(BOOL)a4 isMPTCP:(BOOL)a5 attemptedEndpoints:(id)a6 completion:(id)a7
{
  _BOOL8 v9;
  _BOOL4 v10;
  id v12;
  id v13;
  void (**v14)(_QWORD);
  NSObject *v15;
  int v16;
  const char *v17;
  uint64_t v18;

  v9 = a5;
  v10 = a4;
  v18 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a6;
  v14 = (void (**)(_QWORD))a7;
  if (!v12)
  {
    v15 = *MEMORY[0x24BE08FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FF8], OS_LOG_TYPE_ERROR))
    {
      v16 = 136315138;
      v17 = "-[SiriCoreConnectionMetrics setConnectionMetricsFromConnection:isPop:isMPTCP:attemptedEndpoints:completion:]";
      _os_log_error_impl(&dword_211AB2000, v15, OS_LOG_TYPE_ERROR, "%s NWConnection nil. Unable to obtain metrics", (uint8_t *)&v16, 0xCu);
      if (!v14)
        goto LABEL_8;
    }
    else if (!v14)
    {
      goto LABEL_8;
    }
    v14[2](v14);
    goto LABEL_8;
  }
  if (v10)
    -[SiriCoreConnectionMetrics setConnectionMetricsFromNWConnectionForPOP:withCompletion:](self, "setConnectionMetricsFromNWConnectionForPOP:withCompletion:", v12, v14);
  else
    -[SiriCoreConnectionMetrics setConnectionMetricsFromNWConnectionForDirect:isMPTCP:attemptedEndpoints:withCompletion:](self, "setConnectionMetricsFromNWConnectionForDirect:isMPTCP:attemptedEndpoints:withCompletion:", v12, v9, v13, v14);
LABEL_8:

}

- (void)setConnectionMetricsFromNWConnectionForDirect:(id)a3 isMPTCP:(BOOL)a4 attemptedEndpoints:(id)a5 withCompletion:(id)a6
{
  _BOOL4 v8;
  NSObject *v10;
  id v11;
  void (**v12)(_QWORD);
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  unsigned int subflow_count;
  void *v18;
  void *v19;
  unsigned int primary_subflow_interface_index;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  uint64_t description;
  void *v28;
  uint64_t v29;
  id v30;
  uint64_t i;
  void *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  int negotiated_tls_protocol_version;
  const __CFString *v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  _QWORD applier[4];
  id v48;
  char v49[8];
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;

  v8 = a4;
  v52 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = (void (**)(_QWORD))a6;
  v13 = nw_connection_copy_tcp_info();
  v14 = (void *)v13;
  if (v13 && MEMORY[0x212BE68A4](v13) == MEMORY[0x24BDACFA0] && xpc_dictionary_get_count(v14))
  {
    v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    applier[0] = MEMORY[0x24BDAC760];
    applier[1] = 3221225472;
    applier[2] = __117__SiriCoreConnectionMetrics_setConnectionMetricsFromNWConnectionForDirect_isMPTCP_attemptedEndpoints_withCompletion___block_invoke;
    applier[3] = &unk_24CCE5FB8;
    v48 = v15;
    v16 = v15;
    xpc_dictionary_apply(v14, applier);
    -[SiriCoreConnectionMetrics _setConnectionMetricsTCPInfo:](self, "_setConnectionMetricsTCPInfo:", v16);

  }
  if (!v8)
  {
    -[SiriCoreConnectionMetrics setSubflowCount:](self, "setSubflowCount:", 0);
    -[SiriCoreConnectionMetrics setConnectedSubflowCount:](self, "setConnectedSubflowCount:", 0);
    -[SiriCoreConnectionMetrics setPrimarySubflowInterfaceName:](self, "setPrimarySubflowInterfaceName:", 0);
    -[SiriCoreConnectionMetrics setSubflowSwitchCounts:](self, "setSubflowSwitchCounts:", 0);
    if (!v10)
      goto LABEL_41;
LABEL_14:
    v26 = (void *)nw_connection_copy_connected_remote_endpoint();
    if (v26)
    {
      description = nw_endpoint_get_description();
      if (description)
      {
        v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", description);
        if (v28)
          -[SiriCoreConnectionMetrics setConnectionEdgeID:](self, "setConnectionEdgeID:", v28);

        goto LABEL_29;
      }
      v33 = CFSTR("addressUnavailable");
    }
    else
    {
      if (objc_msgSend(v11, "count"))
      {
        v44 = v14;
        v29 = objc_msgSend(v11, "count");
        v30 = objc_alloc_init(MEMORY[0x24BDD16A8]);
        if (v29)
        {
          for (i = 0; i != v29; ++i)
          {
            if (i)
              objc_msgSend(v30, "appendString:", CFSTR(","));
            objc_msgSend(v11, "objectAtIndexedSubscript:", i);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "appendString:", v32);

          }
        }
        -[SiriCoreConnectionMetrics setConnectionEdgeID:](self, "setConnectionEdgeID:", v30);

        v14 = v44;
        goto LABEL_29;
      }
      v33 = CFSTR("peerUnavailable");
    }
    -[SiriCoreConnectionMetrics setConnectionEdgeID:](self, "setConnectionEdgeID:", v33);
LABEL_29:
    *(_QWORD *)v49 = 0;
    v50 = 0;
    v51 = 0;
    if (nw_connection_fillout_tcp_statistics())
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)v49);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[SiriCoreConnectionMetrics setDnsResolutionTime:](self, "setDnsResolutionTime:", v34);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)&v49[4]);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[SiriCoreConnectionMetrics setConnectionStartTimeToDNSResolutionTimeMsec:](self, "setConnectionStartTimeToDNSResolutionTimeMsec:", v35);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v50);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[SiriCoreConnectionMetrics setConnectionEstablishmentTimeMsec:](self, "setConnectionEstablishmentTimeMsec:", v36);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", HIDWORD(v50));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[SiriCoreConnectionMetrics setConnectionStartTimeToConnectionEstablishmentTimeMsec:](self, "setConnectionStartTimeToConnectionEstablishmentTimeMsec:", v37);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v51);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[SiriCoreConnectionMetrics setTlsHandshakeTimeMsec:](self, "setTlsHandshakeTimeMsec:", v38);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", HIDWORD(v51));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[SiriCoreConnectionMetrics setConnectionStartTimeToTLSHandshakeTimeMsec:](self, "setConnectionStartTimeToTLSHandshakeTimeMsec:", v39);

      v40 = MEMORY[0x212BE6370]();
      v41 = nw_connection_copy_protocol_metadata(v10, v40);

      negotiated_tls_protocol_version = sec_protocol_metadata_get_negotiated_tls_protocol_version(v41);
      switch(negotiated_tls_protocol_version)
      {
        case 768:
          v43 = CFSTR("SSL30");
          break;
        case 769:
          v43 = CFSTR("TLS10");
          break;
        case 770:
          v43 = CFSTR("TLS11");
          break;
        case 771:
          v43 = CFSTR("TLS12");
          break;
        case 772:
          v43 = CFSTR("TLS13");
          break;
        default:
          if (negotiated_tls_protocol_version)
            v43 = CFSTR("TLSOther");
          else
            v43 = CFSTR("Unknown");
          break;
      }
      -[SiriCoreConnectionMetrics setTlsVersion:](self, "setTlsVersion:", v43);

    }
    goto LABEL_41;
  }
  subflow_count = nw_connection_multipath_get_subflow_count();
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", subflow_count);
  -[SiriCoreConnectionMetrics setSubflowCount:](self, "setSubflowCount:", v18);

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", subflow_count);
  -[SiriCoreConnectionMetrics setConnectedSubflowCount:](self, "setConnectedSubflowCount:", v19);

  primary_subflow_interface_index = nw_connection_multipath_get_primary_subflow_interface_index();
  if (if_indextoname(primary_subflow_interface_index, v49))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v49);
    -[SiriCoreConnectionMetrics setPrimarySubflowInterfaceName:](self, "setPrimarySubflowInterfaceName:", v21);

  }
  v22 = nw_connection_multipath_copy_subflow_counts();
  v23 = (void *)v22;
  if (v22 && MEMORY[0x212BE68A4](v22) == MEMORY[0x24BDACFA0])
  {
    v24 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v45[0] = MEMORY[0x24BDAC760];
    v45[1] = 3221225472;
    v45[2] = __117__SiriCoreConnectionMetrics_setConnectionMetricsFromNWConnectionForDirect_isMPTCP_attemptedEndpoints_withCompletion___block_invoke_2;
    v45[3] = &unk_24CCE5FB8;
    v46 = v24;
    v25 = v24;
    xpc_dictionary_apply(v23, v45);
    -[SiriCoreConnectionMetrics setSubflowSwitchCounts:](self, "setSubflowSwitchCounts:", v25);

  }
  if (v10)
    goto LABEL_14;
LABEL_41:
  if (v12)
    v12[2](v12);

}

- (void)setConnectionMetricsFromNWConnectionForPOP:(id)a3 withCompletion:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;

  v6 = (objc_class *)MEMORY[0x24BE6B730];
  v7 = a4;
  v8 = a3;
  v9 = (id)objc_msgSend([v6 alloc], "initFromNWConnection:", v8);

  -[SiriCoreConnectionMetrics _setConnectionMetricsFromNSPControlConnection:withCompletion:](self, "_setConnectionMetricsFromNSPControlConnection:withCompletion:", v9, v7);
}

- (void)setConnectionMetricsForIDS:(double)a3 messageDelay:(double)a4 openErrorCode:(unint64_t)a5
{
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriCoreConnectionMetrics setIdsLastMessageDelay:](self, "setIdsLastMessageDelay:", v8);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriCoreConnectionMetrics setIdsLastSocketDelay:](self, "setIdsLastSocketDelay:", v9);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[SiriCoreConnectionMetrics setIdsLastSocketOpenError:](self, "setIdsLastSocketOpenError:", v10);

}

- (id)getConnectionMetricsDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SiriCoreConnectionMetrics connectionMethod](self, "connectionMethod");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriCoreConnectionMetrics connectionEdgeID](self, "connectionEdgeID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriCoreConnectionMetrics tcpInfoMetricsByInterfaceName](self, "tcpInfoMetricsByInterfaceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("ConnectionMethod: %@ on Edge: %@ TCP_INFO: %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)timeUntilOpen
{
  return self->_timeUntilOpen;
}

- (void)setTimeUntilOpen:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)timeUntilFirstByteRead
{
  return self->_timeUntilFirstByteRead;
}

- (void)setTimeUntilFirstByteRead:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)attemptCount
{
  return self->_attemptCount;
}

- (void)setAttemptCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)metricsCount
{
  return self->_metricsCount;
}

- (void)setMetricsCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)meanPing
{
  return self->_meanPing;
}

- (void)setMeanPing:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)pingCount
{
  return self->_pingCount;
}

- (void)setPingCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)unacknowledgedPingCount
{
  return self->_unacknowledgedPingCount;
}

- (void)setUnacknowledgedPingCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDictionary)tcpInfoMetricsByInterfaceName
{
  return self->_tcpInfoMetricsByInterfaceName;
}

- (NSNumber)subflowCount
{
  return self->_subflowCount;
}

- (void)setSubflowCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)connectedSubflowCount
{
  return self->_connectedSubflowCount;
}

- (void)setConnectedSubflowCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)primarySubflowInterfaceName
{
  return self->_primarySubflowInterfaceName;
}

- (void)setPrimarySubflowInterfaceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSDictionary)subflowSwitchCounts
{
  return self->_subflowSwitchCounts;
}

- (void)setSubflowSwitchCounts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (SiriCoreConnectionMetrics)remoteMetrics
{
  return self->_remoteMetrics;
}

- (void)setRemoteMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_remoteMetrics, a3);
}

- (NSString)connectionMethod
{
  return self->_connectionMethod;
}

- (void)setConnectionMethod:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)connectionEdgeID
{
  return self->_connectionEdgeID;
}

- (void)setConnectionEdgeID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSArray)connectionMethodHistory
{
  return self->_connectionMethodHistory;
}

- (void)setConnectionMethodHistory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)connectionEdgeType
{
  return self->_connectionEdgeType;
}

- (void)setConnectionEdgeType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSNumber)connectionFallbackReason
{
  return self->_connectionFallbackReason;
}

- (void)setConnectionFallbackReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSNumber)connectionDelay
{
  return self->_connectionDelay;
}

- (void)setConnectionDelay:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSNumber)firstTxByteDelay
{
  return self->_firstTxByteDelay;
}

- (void)setFirstTxByteDelay:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)carrierName
{
  return self->_carrierName;
}

- (void)setCarrierName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSNumber)signalStrengthBars
{
  return self->_signalStrengthBars;
}

- (void)setSignalStrengthBars:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSString)providerStyle
{
  return self->_providerStyle;
}

- (void)setProviderStyle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSString)policyId
{
  return self->_policyId;
}

- (void)setPolicyId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSDictionary)flowNetworkInterfaceType
{
  return self->_flowNetworkInterfaceType;
}

- (void)setFlowNetworkInterfaceType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSString)wifiPhyMode
{
  return self->_wifiPhyMode;
}

- (void)setWifiPhyMode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSString)wifiChannelInfo
{
  return self->_wifiChannelInfo;
}

- (void)setWifiChannelInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSNumber)rssi
{
  return self->_rssi;
}

- (void)setRssi:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSNumber)snr
{
  return self->_snr;
}

- (void)setSnr:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSNumber)cca
{
  return self->_cca;
}

- (void)setCca:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSNumber)isCaptive
{
  return self->_isCaptive;
}

- (void)setIsCaptive:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSDictionary)symptomsBasedNetworkQuality
{
  return self->_symptomsBasedNetworkQuality;
}

- (void)setSymptomsBasedNetworkQuality:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSNumber)dnsResolutionTime
{
  return self->_dnsResolutionTime;
}

- (void)setDnsResolutionTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSNumber)connectionStartTimeToDNSResolutionTimeMsec
{
  return self->_connectionStartTimeToDNSResolutionTimeMsec;
}

- (void)setConnectionStartTimeToDNSResolutionTimeMsec:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSNumber)connectionEstablishmentTimeMsec
{
  return self->_connectionEstablishmentTimeMsec;
}

- (void)setConnectionEstablishmentTimeMsec:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSNumber)connectionStartTimeToConnectionEstablishmentTimeMsec
{
  return self->_connectionStartTimeToConnectionEstablishmentTimeMsec;
}

- (void)setConnectionStartTimeToConnectionEstablishmentTimeMsec:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (NSNumber)tlsHandshakeTimeMsec
{
  return self->_tlsHandshakeTimeMsec;
}

- (void)setTlsHandshakeTimeMsec:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (NSNumber)connectionStartTimeToTLSHandshakeTimeMsec
{
  return self->_connectionStartTimeToTLSHandshakeTimeMsec;
}

- (void)setConnectionStartTimeToTLSHandshakeTimeMsec:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (NSNumber)idsLastMessageDelay
{
  return self->_idsLastMessageDelay;
}

- (void)setIdsLastMessageDelay:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (NSNumber)idsLastSocketDelay
{
  return self->_idsLastSocketDelay;
}

- (void)setIdsLastSocketDelay:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (NSNumber)idsLastSocketOpenError
{
  return self->_idsLastSocketOpenError;
}

- (void)setIdsLastSocketOpenError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (NSString)tlsVersion
{
  return self->_tlsVersion;
}

- (void)setTlsVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (NSNumber)simSubscriptions
{
  return self->_simSubscriptions;
}

- (void)setSimSubscriptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simSubscriptions, 0);
  objc_storeStrong((id *)&self->_tlsVersion, 0);
  objc_storeStrong((id *)&self->_idsLastSocketOpenError, 0);
  objc_storeStrong((id *)&self->_idsLastSocketDelay, 0);
  objc_storeStrong((id *)&self->_idsLastMessageDelay, 0);
  objc_storeStrong((id *)&self->_connectionStartTimeToTLSHandshakeTimeMsec, 0);
  objc_storeStrong((id *)&self->_tlsHandshakeTimeMsec, 0);
  objc_storeStrong((id *)&self->_connectionStartTimeToConnectionEstablishmentTimeMsec, 0);
  objc_storeStrong((id *)&self->_connectionEstablishmentTimeMsec, 0);
  objc_storeStrong((id *)&self->_connectionStartTimeToDNSResolutionTimeMsec, 0);
  objc_storeStrong((id *)&self->_dnsResolutionTime, 0);
  objc_storeStrong((id *)&self->_symptomsBasedNetworkQuality, 0);
  objc_storeStrong((id *)&self->_isCaptive, 0);
  objc_storeStrong((id *)&self->_cca, 0);
  objc_storeStrong((id *)&self->_snr, 0);
  objc_storeStrong((id *)&self->_rssi, 0);
  objc_storeStrong((id *)&self->_wifiChannelInfo, 0);
  objc_storeStrong((id *)&self->_wifiPhyMode, 0);
  objc_storeStrong((id *)&self->_flowNetworkInterfaceType, 0);
  objc_storeStrong((id *)&self->_policyId, 0);
  objc_storeStrong((id *)&self->_providerStyle, 0);
  objc_storeStrong((id *)&self->_signalStrengthBars, 0);
  objc_storeStrong((id *)&self->_carrierName, 0);
  objc_storeStrong((id *)&self->_firstTxByteDelay, 0);
  objc_storeStrong((id *)&self->_connectionDelay, 0);
  objc_storeStrong((id *)&self->_connectionFallbackReason, 0);
  objc_storeStrong((id *)&self->_connectionEdgeType, 0);
  objc_storeStrong((id *)&self->_connectionMethodHistory, 0);
  objc_storeStrong((id *)&self->_connectionEdgeID, 0);
  objc_storeStrong((id *)&self->_connectionMethod, 0);
  objc_storeStrong((id *)&self->_remoteMetrics, 0);
  objc_storeStrong((id *)&self->_subflowSwitchCounts, 0);
  objc_storeStrong((id *)&self->_primarySubflowInterfaceName, 0);
  objc_storeStrong((id *)&self->_connectedSubflowCount, 0);
  objc_storeStrong((id *)&self->_subflowCount, 0);
  objc_storeStrong((id *)&self->_tcpInfoMetricsByInterfaceName, 0);
  objc_storeStrong((id *)&self->_unacknowledgedPingCount, 0);
  objc_storeStrong((id *)&self->_pingCount, 0);
  objc_storeStrong((id *)&self->_meanPing, 0);
  objc_storeStrong((id *)&self->_metricsCount, 0);
  objc_storeStrong((id *)&self->_attemptCount, 0);
  objc_storeStrong((id *)&self->_timeUntilFirstByteRead, 0);
  objc_storeStrong((id *)&self->_timeUntilOpen, 0);
}

uint64_t __117__SiriCoreConnectionMetrics_setConnectionMetricsFromNWConnectionForDirect_isMPTCP_attemptedEndpoints_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  const void *bytes_ptr;
  const void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  bytes_ptr = xpc_data_get_bytes_ptr(v5);
  if (bytes_ptr)
  {
    v7 = bytes_ptr;
    if (xpc_data_get_length(v5) == 408 && MEMORY[0x212BE68A4](v5) == MEMORY[0x24BDACF90])
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v7, 408);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v9, v8);

    }
  }

  return 1;
}

uint64_t __117__SiriCoreConnectionMetrics_setConnectionMetricsFromNWConnectionForDirect_isMPTCP_attemptedEndpoints_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2, xpc_object_t xuint)
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", xpc_uint64_get_value(xuint));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

  return 1;
}

void __90__SiriCoreConnectionMetrics__setConnectionMetricsFromNSPControlConnection_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v20;
  unint64_t v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  uint64_t v31;
  int v32;
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE08FC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
  {
    v32 = 136315138;
    v33 = "-[SiriCoreConnectionMetrics _setConnectionMetricsFromNSPControlConnection:withCompletion:]_block_invoke";
    _os_log_impl(&dword_211AB2000, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v32, 0xCu);
  }
  objc_msgSend(v3, "TCPInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_setConnectionMetricsTCPInfo:", v5);
  v6 = objc_msgSend(v3, "isMultipath");
  v7 = *(void **)(a1 + 32);
  if (v6)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", objc_msgSend(v3, "multipathSubflowCount"));
    objc_msgSend(v7, "setSubflowCount:", v8);

    v9 = *(void **)(a1 + 32);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", objc_msgSend(v3, "multipathConnectedSubflowCount"));
    objc_msgSend(v9, "setConnectedSubflowCount:", v10);

    if (if_indextoname(objc_msgSend(v3, "multipathPrimarySubflowInterfaceIndex"), (char *)&v32))
    {
      v11 = *(void **)(a1 + 32);
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v32);
      objc_msgSend(v11, "setPrimarySubflowInterfaceName:", v12);

    }
    objc_msgSend(v3, "multipathSubflowSwitchCounts");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      objc_msgSend(*(id *)(a1 + 32), "setSubflowSwitchCounts:", v13);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setSubflowCount:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setConnectedSubflowCount:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setPrimarySubflowInterfaceName:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setSubflowSwitchCounts:", 0);
  }
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", CFSTR("Tuscany"));
  v15 = objc_msgSend(v3, "pathType");
  v16 = CFSTR("_DirectTCP");
  if (v6)
  {
    v16 = CFSTR("_DirectMPTCP");
    v17 = CFSTR("_UnknownMPTCP");
  }
  else
  {
    v17 = CFSTR("_UnknownTCP");
  }
  v18 = CFSTR("_TCP");
  if (v6)
    v18 = CFSTR("_MPTCP");
  if (v15 == 1)
    v17 = v18;
  if (v15 == 2)
    v19 = v16;
  else
    v19 = v17;
  objc_msgSend(v14, "appendString:", v19);
  objc_msgSend(*(id *)(a1 + 32), "setConnectionMethod:", v14);
  objc_msgSend(v3, "edgeAddress");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    objc_msgSend(*(id *)(a1 + 32), "setConnectionEdgeID:", v20);
  v21 = objc_msgSend(v3, "edgeType");
  if (v21 > 3)
    v22 = CFSTR("Unavailable");
  else
    v22 = off_24CCE5FD8[v21];
  objc_msgSend(*(id *)(a1 + 32), "setConnectionEdgeType:", v22);
  if (objc_msgSend(v3, "fallbackReason"))
  {
    v23 = *(void **)(a1 + 32);
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", objc_msgSend(v3, "fallbackReason"));
    objc_msgSend(v23, "setConnectionFallbackReason:", v24);

  }
  objc_msgSend(v3, "connectionDelay");
  if (v25 != 0.0)
  {
    v26 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setConnectionDelay:", v27);

  }
  objc_msgSend(v3, "firstTxByteDelay");
  if (v28 != 0.0)
  {
    v29 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setFirstTxByteDelay:", v30);

  }
  v31 = *(_QWORD *)(a1 + 40);
  if (v31)
    (*(void (**)(void))(v31 + 16))();

}

void __58__SiriCoreConnectionMetrics__setConnectionMetricsTCPInfo___block_invoke(uint64_t a1, void *a2, id a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = objc_retainAutorelease(a3);
  v6 = a2;
  SiriCoreConnectionTCPInfoMetricsCreate(v6, objc_msgSend(v5, "bytes"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v8, v6);
  SiriCoreConnectionTechnologyGetDescription(+[SiriCoreNetworkManager connectionTypeForInterface:](SiriCoreNetworkManager, "connectionTypeForInterface:", v6));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v7, v6);

}

void __84__SiriCoreConnectionMetrics_setConnectionMetricsFromStreamForDirect_withCompletion___block_invoke(uint64_t a1, void *a2, id a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = objc_retainAutorelease(a3);
  v6 = a2;
  SiriCoreConnectionTCPInfoMetricsCreate(v6, objc_msgSend(v5, "bytes"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v8, v6);
  SiriCoreConnectionTechnologyGetDescription(+[SiriCoreNetworkManager connectionTypeForInterface:](SiriCoreNetworkManager, "connectionTypeForInterface:", v6));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v7, v6);

}

@end
