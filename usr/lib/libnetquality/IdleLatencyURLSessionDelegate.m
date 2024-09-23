@implementation IdleLatencyURLSessionDelegate

- (void)executeTaskWithRequest:(id)a3 completionHandler:(id)a4
{
  id v7;
  void *v8;
  id completionHandler;
  __int128 v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  __int128 v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void *)MEMORY[0x212BC1F98](a4);
  completionHandler = self->super._completionHandler;
  self->super._completionHandler = v8;

  objc_storeStrong((id *)&self->super._request, a3);
  if (self->super._parallel)
  {
    v11 = 0;
    *(_QWORD *)&v10 = 136315906;
    v16 = v10;
    do
    {
      -[NetworkQualityExecutions createDefaultNSURLSessionConfiguration](self->super._execution, "createDefaultNSURLSessionConfiguration", v16);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:delegate:delegateQueue:", v12, self, self->super._queue);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](self->super._sessions, "addObject:", v13);
      objc_msgSend(v13, "dataTaskWithRequest:", v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "set_hostOverride:", self->super._testEndpoint);
      -[NSMutableArray addObject:](self->super._tasks, "addObject:", v14);
      netqual_log_init();
      v15 = os_log_netqual;
      if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v16;
        v18 = "-[IdleLatencyURLSessionDelegate executeTaskWithRequest:completionHandler:]";
        v19 = 1024;
        v20 = 325;
        v21 = 2112;
        v22 = v14;
        v23 = 2112;
        v24 = v13;
        _os_log_impl(&dword_20E622000, v15, OS_LOG_TYPE_DEFAULT, "%s:%u - Created IdleLatencyTask %@ on session %@", buf, 0x26u);
      }
      objc_msgSend(v14, "resume");

      ++v11;
    }
    while (v11 < self->super._parallel);
  }

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  BOOL v13;
  NSMutableArray **p_tasks;
  NSError *error;
  void (**completionHandler)(id, NSError *);

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!v10)
  {
    p_tasks = &self->super._tasks;
    -[NSMutableArray removeObject:](self->super._tasks, "removeObject:", v9);
    goto LABEL_7;
  }
  objc_msgSend(v10, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDD1308]))
    v13 = objc_msgSend(v11, "code") == -999;
  else
    v13 = 0;

  p_tasks = &self->super._tasks;
  -[NSMutableArray removeObject:](self->super._tasks, "removeObject:", v9);
  if (v13)
  {
LABEL_7:
    if (!-[NSMutableArray count](*p_tasks, "count") && !self->super._canceled)
    {
      error = self->super._error;
      completionHandler = (void (**)(id, NSError *))self->super._completionHandler;
LABEL_14:
      completionHandler[2](completionHandler, error);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  netqual_log_init();
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR))
    -[IdleLatencyURLSessionDelegate URLSession:task:didCompleteWithError:].cold.1();
  if (!self->super._canceled)
  {
    objc_storeStrong((id *)&self->super._error, a5);
    completionHandler = (void (**)(id, NSError *))self->super._completionHandler;
    error = self->super._error;
    goto LABEL_14;
  }
LABEL_15:

}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v8;
  id v9;
  id v10;
  int v11;
  unsigned int v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  int v50;
  __CFString *v51;
  __CFString *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  NSObject *v61;
  void *v62;
  nw_interface_type_t type;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  __CFString *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  int v77;
  __CFString *v78;
  __CFString *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  double v86;
  void *v87;
  id v88;
  void *v89;
  double v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  double v95;
  void *v96;
  void *v97;
  double v98;
  void *v99;
  void *v100;
  double v101;
  void *v102;
  void *v103;
  void *v104;
  id v105;
  void *v106;
  void *v107;
  void *v108;
  NSObject *report;
  void *v110;
  void *v111;
  id v112;
  id v113;
  _QWORD enumerate_block[4];
  id v115;
  uint64_t *v116;
  uint64_t *v117;
  uint64_t *v118;
  uint64_t *v119;
  uint64_t v120;
  uint64_t *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t *v125;
  uint64_t v126;
  char v127;
  uint64_t v128;
  uint64_t *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t *v133;
  uint64_t v134;
  uint64_t (*v135)(uint64_t, uint64_t);
  void (*v136)(uint64_t);
  id v137;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[LatencyURLSessionDelegate didFinishCollectingMetrics:task:](self, "didFinishCollectingMetrics:task:", v10, v9);
  if (v11 < 0)
    goto LABEL_57;
  v12 = v11;
  -[NetworkQualityExecutionsResult idleLatencyResults](self->super._results, "idleLatencyResults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "valueForKey:", self->super._tcpKey);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[NetworkQualityExecutionsResult idleLatencyResults](self->super._results, "idleLatencyResults");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v14, self->super._tcpKey);

  }
  -[NetworkQualityExecutionsResult idleLatencyResults](self->super._results, "idleLatencyResults");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "valueForKey:", self->super._tlsKey);
  v17 = objc_claimAutoreleasedReturnValue();

  v106 = (void *)v17;
  if (!v17)
  {
    v18 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[NetworkQualityExecutionsResult idleLatencyResults](self->super._results, "idleLatencyResults");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = v18;
    objc_msgSend(v19, "setObject:forKey:", v18, self->super._tlsKey);

  }
  -[NetworkQualityExecutionsResult idleLatencyResults](self->super._results, "idleLatencyResults");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "valueForKey:", self->super._reqrespKey);
  v21 = objc_claimAutoreleasedReturnValue();

  v110 = (void *)v21;
  if (!v21)
  {
    v22 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[NetworkQualityExecutionsResult idleLatencyResults](self->super._results, "idleLatencyResults");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = v22;
    objc_msgSend(v23, "setObject:forKey:", v22, self->super._reqrespKey);

  }
  -[NetworkQualityExecutionsResult mutableOtherValues](self->super._results, "mutableOtherValues");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "valueForKey:", CFSTR("ecn_values"));
  v25 = objc_claimAutoreleasedReturnValue();

  v108 = (void *)v25;
  if (!v25)
  {
    v26 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[NetworkQualityExecutionsResult mutableOtherValues](self->super._results, "mutableOtherValues");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = v26;
    objc_msgSend(v27, "setObject:forKey:", v26, CFSTR("ecn_values"));

  }
  -[NetworkQualityExecutionsResult mutableOtherValues](self->super._results, "mutableOtherValues");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "valueForKey:", CFSTR("l4s_enablement"));
  v29 = objc_claimAutoreleasedReturnValue();

  v107 = (void *)v29;
  if (!v29)
  {
    v30 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[NetworkQualityExecutionsResult mutableOtherValues](self->super._results, "mutableOtherValues");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = v30;
    objc_msgSend(v31, "setObject:forKey:", v30, CFSTR("l4s_enablement"));

  }
  objc_msgSend(v10, "transactionMetrics");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectAtIndex:", v12);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v111 = v33;
  objc_msgSend(v33, "_establishmentReport");
  report = objc_claimAutoreleasedReturnValue();
  if (report)
  {
    v132 = 0;
    v133 = &v132;
    v134 = 0x3032000000;
    v135 = __Block_byref_object_copy__0;
    v136 = __Block_byref_object_dispose__0;
    v137 = 0;
    v128 = 0;
    v129 = &v128;
    v130 = 0x2020000000;
    v131 = 0;
    v124 = 0;
    v125 = &v124;
    v126 = 0x2020000000;
    v127 = 0;
    v120 = 0;
    v121 = &v120;
    v122 = 0x2020000000;
    v123 = 0;
    enumerate_block[0] = MEMORY[0x24BDAC760];
    enumerate_block[1] = 3221225472;
    enumerate_block[2] = __76__IdleLatencyURLSessionDelegate_URLSession_task_didFinishCollectingMetrics___block_invoke;
    enumerate_block[3] = &unk_24C976750;
    v116 = &v132;
    v117 = &v128;
    v115 = v10;
    v118 = &v124;
    v119 = &v120;
    nw_establishment_report_enumerate_protocols(report, enumerate_block);
    if (*((_BYTE *)v125 + 24))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v121[3]);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v34);

    }
    v35 = v133[5];
    if (!v35)
      goto LABEL_20;
    v36 = (void *)MEMORY[0x212BC1DB8]();
    if (MEMORY[0x212BC1DC4](v35, v36))
    {

    }
    else
    {
      v37 = v133[5];
      v38 = (void *)nw_protocol_copy_quic_connection_definition();
      LODWORD(v37) = MEMORY[0x212BC1DC4](v37, v38);

      if (!(_DWORD)v37)
      {
LABEL_20:
        v112 = v108;
        v113 = v107;
        nw_establishment_report_enumerate_protocol_l4s_state();

        _Block_object_dispose(&v120, 8);
        _Block_object_dispose(&v124, 8);
        _Block_object_dispose(&v128, 8);
        _Block_object_dispose(&v132, 8);

        goto LABEL_21;
      }
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v129[3]);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "addObject:", v39);

    goto LABEL_20;
  }
LABEL_21:
  -[NetworkQualityExecutionsResult mutableOtherValues](self->super._results, "mutableOtherValues", v8);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "objectForKey:", CFSTR("protocols_seen"));
  v41 = (id)objc_claimAutoreleasedReturnValue();

  if (!v41)
  {
    v41 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[NetworkQualityExecutionsResult mutableOtherValues](self->super._results, "mutableOtherValues");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setValue:forKey:", v41, CFSTR("protocols_seen"));

  }
  objc_msgSend(v111, "networkProtocolName");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "objectForKey:", v43);
  v44 = objc_claimAutoreleasedReturnValue();
  if (v44)
    v45 = (void *)v44;
  else
    v45 = &unk_24C97CC58;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v45, "intValue") + 1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v41, "setObject:forKey:", v46, v43);
  -[NetworkQualityExecutionsResult mutableOtherValues](self->super._results, "mutableOtherValues");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "objectForKey:", CFSTR("proxy_state"));
  v48 = (id)objc_claimAutoreleasedReturnValue();

  if (!v48)
  {
    v48 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[NetworkQualityExecutionsResult mutableOtherValues](self->super._results, "mutableOtherValues");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setValue:forKey:", v48, CFSTR("proxy_state"));

  }
  v104 = v14;
  v105 = v10;
  v50 = objc_msgSend(v111, "isProxyConnection");
  v51 = CFSTR("not_proxied");
  if (v50)
    v51 = CFSTR("proxied");
  v52 = v51;
  objc_msgSend(v48, "objectForKey:", v52);
  v53 = objc_claimAutoreleasedReturnValue();
  if (v53)
    v54 = (void *)v53;
  else
    v54 = &unk_24C97CC58;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v54, "intValue") + 1);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v48, "setObject:forKey:", v55, v52);
  -[NetworkQualityExecutionsResult mutableOtherValues](self->super._results, "mutableOtherValues");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "objectForKey:", CFSTR("interface-type"));
  v57 = (id)objc_claimAutoreleasedReturnValue();

  v58 = &unk_24C97CC58;
  if (!v57)
  {
    v57 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[NetworkQualityExecutionsResult mutableOtherValues](self->super._results, "mutableOtherValues");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setValue:forKey:", v57, CFSTR("interface-type"));

  }
  objc_msgSend(v111, "_interfaceName");
  v60 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v60, "UTF8String");
  v61 = nw_interface_create_with_name();

  v62 = (void *)MEMORY[0x24BDD17C8];
  type = nw_interface_get_type(v61);
  objc_msgSend(v62, "stringWithUTF8String:", nw_interface_type_to_string(type));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "objectForKey:", v64);
  v65 = objc_claimAutoreleasedReturnValue();
  if (v65)
    v58 = (void *)v65;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v58, "intValue") + 1);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v57, "setObject:forKey:", v66, v64);
  -[NetworkQualityExecutionsResult mutableOtherValues](self->super._results, "mutableOtherValues");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "objectForKey:", CFSTR("rat"));
  v68 = (id)objc_claimAutoreleasedReturnValue();

  if (!v68)
  {
    v68 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[NetworkQualityExecutionsResult mutableOtherValues](self->super._results, "mutableOtherValues");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setValue:forKey:", v68, CFSTR("rat"));

  }
  if (nw_interface_get_radio_type())
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", nw_interface_radio_type_to_string());
    v70 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v70 = CFSTR("unknown");
  }

  objc_msgSend(v68, "objectForKey:", v70);
  v71 = objc_claimAutoreleasedReturnValue();

  if (v71)
    v72 = (void *)v71;
  else
    v72 = &unk_24C97CC58;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v72, "intValue") + 1);
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v68, "setObject:forKey:", v73, v70);
  -[NetworkQualityExecutionsResult mutableOtherValues](self->super._results, "mutableOtherValues");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "objectForKey:", CFSTR("multipath"));
  v75 = (id)objc_claimAutoreleasedReturnValue();

  if (!v75)
  {
    v75 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[NetworkQualityExecutionsResult mutableOtherValues](self->super._results, "mutableOtherValues");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setValue:forKey:", v75, CFSTR("multipath"));

  }
  v77 = objc_msgSend(v111, "isMultipath");
  v78 = CFSTR("disabled");
  if (v77)
    v78 = CFSTR("enabled");
  v79 = v78;
  objc_msgSend(v75, "objectForKey:", v79);
  v80 = objc_claimAutoreleasedReturnValue();
  if (v80)
    v81 = (void *)v80;
  else
    v81 = &unk_24C97CC58;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v81, "intValue") + 1);
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v75, "setObject:forKey:", v82, v79);
  v83 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v111, "responseEndDate");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "requestStartDate");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "timeIntervalSinceDate:", v85);
  objc_msgSend(v83, "numberWithInt:", (int)(v86 * 1000.0));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "addObject:", v87);

  v88 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v88, "addObjectsFromArray:", v104);
  objc_msgSend(v88, "addObjectsFromArray:", v106);
  objc_msgSend(v88, "addObjectsFromArray:", v110);
  v89 = (void *)MEMORY[0x24BDD16E0];
  *(float *)&v90 = get_average(v88);
  objc_msgSend(v89, "numberWithFloat:", v90);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  -[NetworkQualityResult latency](self->super._results, "latency");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "setValue:", v91);

  -[NetworkQualityResult latency](self->super._results, "latency");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "updateConfidence:", 3);

  v10 = v105;
  if (objc_msgSend(v104, "count"))
  {
    v94 = (void *)MEMORY[0x24BDD16E0];
    *(float *)&v95 = get_average(v104);
    objc_msgSend(v94, "numberWithFloat:", v95);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    -[NetworkQualityResult setTcpLatency:](self->super._results, "setTcpLatency:", v96);

  }
  v8 = v103;
  if (objc_msgSend(v106, "count"))
  {
    v97 = (void *)MEMORY[0x24BDD16E0];
    *(float *)&v98 = get_average(v106);
    objc_msgSend(v97, "numberWithFloat:", v98);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    -[NetworkQualityResult setTlsLatency:](self->super._results, "setTlsLatency:", v99);

  }
  v100 = (void *)MEMORY[0x24BDD16E0];
  *(float *)&v101 = get_average(v110);
  objc_msgSend(v100, "numberWithFloat:", v101);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  -[NetworkQualityResult setHttpLatency:](self->super._results, "setHttpLatency:", v102);

  -[LatencyURLSessionDelegate shareProgress](self, "shareProgress");
LABEL_57:

}

uint64_t __76__IdleLatencyURLSessionDelegate_URLSession_task_didFinishCollectingMetrics___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;
  nw_protocol_definition_t v7;
  int v8;

  v6 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "isProxy") & 1) == 0)
  {
    v7 = nw_protocol_copy_tcp_definition();
    v8 = MEMORY[0x212BC1DC4](v6, v7);

    if (v8)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = a3;
    }
  }

  return 1;
}

uint64_t __76__IdleLatencyURLSessionDelegate_URLSession_task_didFinishCollectingMetrics___block_invoke_2(uint64_t a1, void *a2, unsigned int a3, uint64_t a4, int a5)
{
  id v8;
  nw_protocol_definition_t v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  uint64_t v21;

  v8 = a2;
  v9 = nw_protocol_copy_tcp_definition();
  if (MEMORY[0x212BC1DC4](v8, v9))
  {

  }
  else
  {
    v10 = (void *)nw_protocol_copy_quic_connection_definition();
    v11 = MEMORY[0x212BC1DC4](v8, v10);

    if (!v11)
    {
      v21 = 1;
      goto LABEL_13;
    }
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", nw_connection_client_accurate_ecn_state_to_string(a3));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v12);
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
    v14 = (void *)v13;
  else
    v14 = &unk_24C97CC58;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v14, "intValue") + 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v15, v12);
  v16 = CFSTR("disabled");
  if (a5)
    v16 = CFSTR("enabled");
  v17 = *(void **)(a1 + 40);
  v18 = v16;
  objc_msgSend(v17, "objectForKey:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
    v19 = &unk_24C97CC58;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v19, "intValue") + 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v20, v18);
  v21 = 0;
LABEL_13:

  return v21;
}

- (void)URLSession:task:didCompleteWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_20E622000, v0, v1, "%s:%u - Load failed with error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

@end
