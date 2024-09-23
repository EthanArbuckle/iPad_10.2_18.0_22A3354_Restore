@implementation WorkingLatencyURLSessionDelegate

- (WorkingLatencyURLSessionDelegate)initWithConfiguration:(id)a3 testName:(id)a4 queue:(id)a5 testEndpoint:(id)a6 resultsObject:(id)a7 resultsDelegate:(id)a8 urlSessions:(id)a9 tcpKey:(id)a10 tlsKey:(id)a11 reqrespKey:(id)a12 selfKey:(id)a13
{
  id v19;
  WorkingLatencyURLSessionDelegate *v20;
  WorkingLatencyURLSessionDelegate *v21;
  NSMutableArray *v22;
  NSMutableArray *tcpTmpArray;
  TrimmedMean *v24;
  unint64_t v25;
  double v26;
  uint64_t v27;
  TrimmedMean *tcpTrim;
  NSMutableArray *v29;
  NSMutableArray *tlsTmpArray;
  TrimmedMean *v31;
  unint64_t v32;
  double v33;
  uint64_t v34;
  TrimmedMean *tlsTrim;
  NSMutableArray *v36;
  NSMutableArray *h2TmpArray;
  TrimmedMean *v38;
  unint64_t v39;
  double v40;
  uint64_t v41;
  TrimmedMean *h2Trim;
  NSMutableArray *v43;
  NSMutableArray *selfTmpArray;
  TrimmedMean *v45;
  unint64_t v46;
  double v47;
  uint64_t v48;
  TrimmedMean *selfTrim;
  LatencySaturationDetection *v50;
  LatencySaturationDetection *saturation;
  uint64_t v52;
  NSDate *start;
  id v55;
  objc_super v56;

  v19 = a3;
  v55 = a9;
  v56.receiver = self;
  v56.super_class = (Class)WorkingLatencyURLSessionDelegate;
  v20 = -[LatencyURLSessionDelegate initWithConfiguration:testName:queue:testEndpoint:resultsObject:resultsDelegate:tcpKey:tlsKey:reqrespKey:selfKey:](&v56, sel_initWithConfiguration_testName_queue_testEndpoint_resultsObject_resultsDelegate_tcpKey_tlsKey_reqrespKey_selfKey_, v19, a4, a5, a6, a7, a8, a10, a11, a12, a13);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_workingSessions, a9);
    v21->_probeLoadConnections = 1;
    v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    tcpTmpArray = v21->_tcpTmpArray;
    v21->_tcpTmpArray = v22;

    v24 = [TrimmedMean alloc];
    v25 = (unint64_t)((double)-[NetworkQualityConfiguration movingAveragePeriod](v21->super._config, "movingAveragePeriod")/ 0.2);
    *(float *)&v26 = (float)-[NetworkQualityConfiguration trimmedMeanThreshold](v21->super._config, "trimmedMeanThreshold")/ 100.0;
    v27 = -[TrimmedMean initWithSize:withTrimAt:](v24, "initWithSize:withTrimAt:", v25, v26);
    tcpTrim = v21->_tcpTrim;
    v21->_tcpTrim = (TrimmedMean *)v27;

    v29 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    tlsTmpArray = v21->_tlsTmpArray;
    v21->_tlsTmpArray = v29;

    v31 = [TrimmedMean alloc];
    v32 = (unint64_t)((double)-[NetworkQualityConfiguration movingAveragePeriod](v21->super._config, "movingAveragePeriod")/ 0.2);
    *(float *)&v33 = (float)-[NetworkQualityConfiguration trimmedMeanThreshold](v21->super._config, "trimmedMeanThreshold")/ 100.0;
    v34 = -[TrimmedMean initWithSize:withTrimAt:](v31, "initWithSize:withTrimAt:", v32, v33);
    tlsTrim = v21->_tlsTrim;
    v21->_tlsTrim = (TrimmedMean *)v34;

    v36 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    h2TmpArray = v21->_h2TmpArray;
    v21->_h2TmpArray = v36;

    v38 = [TrimmedMean alloc];
    v39 = (unint64_t)((double)-[NetworkQualityConfiguration movingAveragePeriod](v21->super._config, "movingAveragePeriod")/ 0.2);
    *(float *)&v40 = (float)-[NetworkQualityConfiguration trimmedMeanThreshold](v21->super._config, "trimmedMeanThreshold")/ 100.0;
    v41 = -[TrimmedMean initWithSize:withTrimAt:](v38, "initWithSize:withTrimAt:", v39, v40);
    h2Trim = v21->_h2Trim;
    v21->_h2Trim = (TrimmedMean *)v41;

    v43 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    selfTmpArray = v21->_selfTmpArray;
    v21->_selfTmpArray = v43;

    v45 = [TrimmedMean alloc];
    v46 = (unint64_t)((double)-[NetworkQualityConfiguration movingAveragePeriod](v21->super._config, "movingAveragePeriod")/ 0.2);
    *(float *)&v47 = (float)-[NetworkQualityConfiguration trimmedMeanThreshold](v21->super._config, "trimmedMeanThreshold")/ 100.0;
    v48 = -[TrimmedMean initWithSize:withTrimAt:](v45, "initWithSize:withTrimAt:", v46, v47);
    selfTrim = v21->_selfTrim;
    v21->_selfTrim = (TrimmedMean *)v48;

    v50 = -[LatencySaturationDetection initWithConfig:]([LatencySaturationDetection alloc], "initWithConfig:", v19);
    saturation = v21->_saturation;
    v21->_saturation = v50;

    v21->_saturation_reached = 0;
    v21->_exit_value = 60000.0 / (float)objc_msgSend(v19, "latencyCriteria");
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v52 = objc_claimAutoreleasedReturnValue();
    start = v21->_start;
    v21->_start = (NSDate *)v52;

    objc_storeStrong((id *)&v21->_current, v21->_start);
  }

  return v21;
}

- (int64_t)getProbeTimeout
{
  uint64_t v3;
  float v4;
  float v5;
  BOOL v6;
  float v7;

  v3 = -[NetworkQualityExecutions currentThroughput](self->super._execution, "currentThroughput");
  if (!-[NetworkQualityExecutions currentThroughput](self->super._execution, "currentThroughput"))
    return 1000000000;
  v4 = 24000.0 / (float)((float)((float)v3 * 5.0) / 100.0);
  if (v4 > 1.0)
    v4 = 1.0;
  v5 = v4 * 1000000000.0;
  v6 = v4 < 0.04;
  v7 = 40000000.0;
  if (!v6)
    return (uint64_t)v5;
  return (uint64_t)v7;
}

- (void)scheduleNewTaskSelf
{
  dispatch_time_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  NSMutableArray *tasks;
  NSObject *v10;
  int v11;
  dispatch_time_t v12;
  NSObject *v13;
  _QWORD v14[5];
  _QWORD block[5];
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  unint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (!self->super._canceled && self->_probeLoadConnections)
  {
    if (-[NSMutableArray count](self->_workingSessions, "count")
      && (unint64_t)-[NSMutableArray count](self->super._tasks, "count") <= 0x32
      && (unint64_t)-[NSMutableArray count](self->super._sessions, "count") < 0x33)
    {
      -[NSMutableArray objectAtIndex:](self->_workingSessions, "objectAtIndex:", arc4random_uniform(-[NSMutableArray count](self->_workingSessions, "count")));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dataTaskWithRequest:", self->super._request);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setDelegate:", self);
      objc_msgSend(v6, "set_hostOverride:", self->super._testEndpoint);
      -[NSMutableArray addObject:](self->super._tasks, "addObject:", v6);
      v7 = -[WorkingLatencyURLSessionDelegate getProbeTimeout](self, "getProbeTimeout");
      netqual_log_init();
      v8 = (void *)os_log_netqual;
      if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
      {
        tasks = self->super._tasks;
        v10 = v8;
        LODWORD(tasks) = -[NSMutableArray count](tasks, "count");
        v11 = -[NSMutableArray count](self->super._sessions, "count");
        *(_DWORD *)buf = 136316674;
        v17 = "-[WorkingLatencyURLSessionDelegate scheduleNewTaskSelf]";
        v18 = 1024;
        v19 = 780;
        v20 = 2112;
        v21 = v6;
        v22 = 2112;
        v23 = v5;
        v24 = 1024;
        v25 = (int)tasks;
        v26 = 1024;
        v27 = v11;
        v28 = 2048;
        v29 = v7 / 0xF4240;
        _os_log_impl(&dword_20E622000, v10, OS_LOG_TYPE_DEFAULT, "%s:%u - Created Self WorkingLatencyTask %@ on session %@, task-count %u session-count %u next in %llu ms", buf, 0x3Cu);

      }
      objc_msgSend(v6, "resume");
      v12 = dispatch_time(0, v7);
      -[NSOperationQueue underlyingQueue](self->super._queue, "underlyingQueue");
      v13 = objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __55__WorkingLatencyURLSessionDelegate_scheduleNewTaskSelf__block_invoke_215;
      v14[3] = &unk_24C9764D0;
      v14[4] = self;
      dispatch_after(v12, v13, v14);

    }
    else
    {
      v3 = dispatch_time(0, -[WorkingLatencyURLSessionDelegate getProbeTimeout](self, "getProbeTimeout"));
      -[NSOperationQueue underlyingQueue](self->super._queue, "underlyingQueue");
      v4 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __55__WorkingLatencyURLSessionDelegate_scheduleNewTaskSelf__block_invoke;
      block[3] = &unk_24C9764D0;
      block[4] = self;
      dispatch_after(v3, v4, block);

    }
  }
}

uint64_t __55__WorkingLatencyURLSessionDelegate_scheduleNewTaskSelf__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "scheduleNewTaskSelf");
}

uint64_t __55__WorkingLatencyURLSessionDelegate_scheduleNewTaskSelf__block_invoke_215(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "scheduleNewTaskSelf");
}

- (void)scheduleNewTaskForeign
{
  dispatch_time_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  NSMutableArray *tasks;
  NSObject *v11;
  int v12;
  dispatch_time_t v13;
  NSObject *v14;
  _QWORD v15[5];
  _QWORD block[5];
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  unint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (!self->super._canceled)
  {
    if ((unint64_t)-[NSMutableArray count](self->super._tasks, "count") <= 0x32
      && (unint64_t)-[NSMutableArray count](self->super._sessions, "count") < 0x33)
    {
      -[NetworkQualityExecutions createDefaultNSURLSessionConfiguration](self->super._execution, "createDefaultNSURLSessionConfiguration");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:delegate:delegateQueue:", v5, self, self->super._queue);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](self->super._sessions, "addObject:", v6);
      objc_msgSend(v6, "dataTaskWithRequest:", self->super._request);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDelegate:", self);
      objc_msgSend(v7, "set_hostOverride:", self->super._testEndpoint);
      -[NSMutableArray addObject:](self->super._tasks, "addObject:", v7);
      v8 = -[WorkingLatencyURLSessionDelegate getProbeTimeout](self, "getProbeTimeout");
      netqual_log_init();
      v9 = (void *)os_log_netqual;
      if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
      {
        tasks = self->super._tasks;
        v11 = v9;
        LODWORD(tasks) = -[NSMutableArray count](tasks, "count");
        v12 = -[NSMutableArray count](self->super._sessions, "count");
        *(_DWORD *)buf = 136316674;
        v18 = "-[WorkingLatencyURLSessionDelegate scheduleNewTaskForeign]";
        v19 = 1024;
        v20 = 817;
        v21 = 2112;
        v22 = v7;
        v23 = 2112;
        v24 = v6;
        v25 = 1024;
        v26 = (int)tasks;
        v27 = 1024;
        v28 = v12;
        v29 = 2048;
        v30 = v8 / 0xF4240;
        _os_log_impl(&dword_20E622000, v11, OS_LOG_TYPE_DEFAULT, "%s:%u - Created Foreign WorkingLatencyTask %@ on session %@, task-count %u session-count %u next in %llu ms", buf, 0x3Cu);

      }
      objc_msgSend(v7, "resume");
      v13 = dispatch_time(0, v8);
      -[NSOperationQueue underlyingQueue](self->super._queue, "underlyingQueue");
      v14 = objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __58__WorkingLatencyURLSessionDelegate_scheduleNewTaskForeign__block_invoke_216;
      v15[3] = &unk_24C9764D0;
      v15[4] = self;
      dispatch_after(v13, v14, v15);

    }
    else
    {
      v3 = dispatch_time(0, -[WorkingLatencyURLSessionDelegate getProbeTimeout](self, "getProbeTimeout"));
      -[NSOperationQueue underlyingQueue](self->super._queue, "underlyingQueue");
      v4 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __58__WorkingLatencyURLSessionDelegate_scheduleNewTaskForeign__block_invoke;
      block[3] = &unk_24C9764D0;
      block[4] = self;
      dispatch_after(v3, v4, block);

    }
  }
}

uint64_t __58__WorkingLatencyURLSessionDelegate_scheduleNewTaskForeign__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "scheduleNewTaskForeign");
}

uint64_t __58__WorkingLatencyURLSessionDelegate_scheduleNewTaskForeign__block_invoke_216(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "scheduleNewTaskForeign");
}

- (void)executeTaskWithRequest:(id)a3 completionHandler:(id)a4
{
  NSURLRequest *v6;
  void *v7;
  id completionHandler;
  NSURLRequest *request;
  NSURLRequest *v10;
  dispatch_time_t v11;
  NSObject *v12;
  uint64_t v13;
  dispatch_time_t v14;
  NSObject *v15;
  _QWORD v16[5];
  _QWORD block[5];

  v6 = (NSURLRequest *)a3;
  v7 = (void *)MEMORY[0x212BC1F98](a4);
  completionHandler = self->super._completionHandler;
  self->super._completionHandler = v7;

  request = self->super._request;
  self->super._request = v6;
  v10 = v6;

  v11 = dispatch_time(0, -[WorkingLatencyURLSessionDelegate getProbeTimeout](self, "getProbeTimeout"));
  -[NSOperationQueue underlyingQueue](self->super._queue, "underlyingQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__WorkingLatencyURLSessionDelegate_executeTaskWithRequest_completionHandler___block_invoke;
  block[3] = &unk_24C9764D0;
  block[4] = self;
  dispatch_after(v11, v12, block);

  v14 = dispatch_time(0, -[WorkingLatencyURLSessionDelegate getProbeTimeout](self, "getProbeTimeout"));
  -[NSOperationQueue underlyingQueue](self->super._queue, "underlyingQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  v16[0] = v13;
  v16[1] = 3221225472;
  v16[2] = __77__WorkingLatencyURLSessionDelegate_executeTaskWithRequest_completionHandler___block_invoke_2;
  v16[3] = &unk_24C9764D0;
  v16[4] = self;
  dispatch_after(v14, v15, v16);

}

uint64_t __77__WorkingLatencyURLSessionDelegate_executeTaskWithRequest_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "scheduleNewTaskForeign");
}

uint64_t __77__WorkingLatencyURLSessionDelegate_executeTaskWithRequest_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "scheduleNewTaskSelf");
}

- (void)waitForSaturation:(id)a3
{
  void *v4;
  id saturationHandler;

  v4 = (void *)MEMORY[0x212BC1F98](a3, a2);
  saturationHandler = self->super._saturationHandler;
  self->super._saturationHandler = v4;

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8;
  id v9;

  v8 = a3;
  v9 = a5;
  -[NSMutableArray removeObject:](self->super._tasks, "removeObject:", a4);
  if (!self->super._canceled)
  {
    if (-[NSMutableArray indexOfObject:](self->super._sessions, "indexOfObject:", v8) != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v8, "invalidateAndCancel");
    if (v9)
    {
      netqual_log_init();
      if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR))
        -[WorkingLatencyURLSessionDelegate URLSession:task:didCompleteWithError:].cold.1();
      if (!self->super._canceled)
      {
        objc_storeStrong((id *)&self->super._error, a5);
        (*((void (**)(void))self->super._completionHandler + 2))();
      }
    }
  }

}

- (void)isDownlinkTest
{
  self->isDownlink = 1;
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  double v8;
  id v9;
  id v10;
  int v11;
  unsigned int v12;
  void *v13;
  NSMutableArray *selfTmpArray;
  void *v15;
  double v16;
  uint64_t v17;
  NSMutableArray *v18;
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
  NSMutableArray *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  NSMutableArray *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  int v49;
  __CFString *v50;
  __CFString *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  NSObject *v59;
  void *v60;
  nw_interface_type_t type;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  __CFString *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  int v76;
  __CFString *v77;
  __CFString *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  NSMutableArray *h2TmpArray;
  void *v83;
  void *v84;
  void *v85;
  double v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  double v93;
  void *v94;
  double v95;
  NSMutableArray *v96;
  NSMutableArray *tcpTmpArray;
  NSMutableArray *v98;
  NSMutableArray *tlsTmpArray;
  NSMutableArray *v100;
  NSMutableArray *v101;
  NSMutableArray *v102;
  NSMutableArray *v103;
  float v104;
  float v105;
  float v106;
  float v107;
  float v108;
  float v109;
  double v110;
  float v111;
  float v112;
  float v113;
  float v114;
  float v115;
  int v116;
  float v117;
  float v118;
  float v119;
  float v120;
  NSObject *v121;
  BOOL v122;
  double v123;
  void *v124;
  NetworkQualityExecutionsResult *results;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  __n128 v133;
  __n128 v134;
  void *v135;
  double v136;
  void *v137;
  double v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  double v149;
  void *v150;
  double v151;
  void *v152;
  float v153;
  nw_establishment_report_t report;
  float reporta;
  id v156;
  float v157;
  id v158;
  NSString *v159;
  id obj;
  id obja;
  id v162;
  id v163;
  void *v164;
  id v165;
  id v166;
  _QWORD enumerate_block[4];
  id v168;
  _BYTE *v169;
  uint64_t *v170;
  uint64_t *v171;
  uint64_t *v172;
  uint64_t v173;
  uint64_t *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t *v178;
  uint64_t v179;
  char v180;
  uint64_t v181;
  uint64_t *v182;
  uint64_t v183;
  uint64_t v184;
  _BYTE buf[40];
  double v186;
  __int16 v187;
  double v188;
  __int16 v189;
  double v190;
  __int16 v191;
  double v192;
  __int16 v193;
  double v194;
  uint64_t v195;

  v195 = *MEMORY[0x24BDAC8D0];
  v8 = COERCE_DOUBLE(a3);
  v9 = a4;
  v10 = a5;
  if (!self->_saturation_reached && !-[WorkingLatencyURLSessionDelegate checkLimits](self, "checkLimits"))
  {
    v11 = -[LatencyURLSessionDelegate didFinishCollectingMetrics:task:](self, "didFinishCollectingMetrics:task:", v10, v9);
    if ((v11 & 0x80000000) == 0)
    {
      v12 = v11;
      objc_msgSend(v10, "transactionMetrics");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndex:", v12);
      v164 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[NSMutableArray indexOfObject:](self->_workingSessions, "indexOfObject:", *(_QWORD *)&v8) != 0x7FFFFFFFFFFFFFFFLL)
      {
        if ((objc_msgSend(v164, "isReusedConnection") & 1) == 0)
        {
          netqual_log_init();
          v33 = os_log_netqual;
          if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            *(_QWORD *)&buf[4] = "-[WorkingLatencyURLSessionDelegate URLSession:task:didFinishCollectingMetrics:]";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 905;
            *(_WORD *)&buf[18] = 2080;
            *(_QWORD *)&buf[20] = "-[WorkingLatencyURLSessionDelegate URLSession:task:didFinishCollectingMetrics:]";
            *(_WORD *)&buf[28] = 2112;
            *(_QWORD *)&buf[30] = v9;
            *(_WORD *)&buf[38] = 2112;
            v186 = v8;
            _os_log_impl(&dword_20E622000, v33, OS_LOG_TYPE_DEFAULT, "%s:%u - %s - request for task %@ was not reused on session %@", buf, 0x30u);
          }
          self->_probeLoadConnections = 0;
          goto LABEL_109;
        }
        if (!self->_probeLoadConnections)
        {
LABEL_109:

          goto LABEL_110;
        }
      }
      if (-[NSMutableArray indexOfObject:](self->super._sessions, "indexOfObject:", *(_QWORD *)&v8) == 0x7FFFFFFFFFFFFFFFLL)
      {
        v159 = self->super._selfKey;
        selfTmpArray = self->_selfTmpArray;
        v15 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v164, "responseEndDate");
        obj = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v164, "requestStartDate");
        v162 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(obj, "timeIntervalSinceDate:", v162);
        objc_msgSend(v15, "numberWithInt:", (int)(v16 * 1000.0));
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = selfTmpArray;
        v19 = (void *)v17;
        -[NSMutableArray addObject:](v18, "addObject:", v17);
        goto LABEL_63;
      }
      -[NetworkQualityExecutionsResult workingLatencyResults](self->super._results, "workingLatencyResults");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "valueForKey:", self->super._tcpKey);
      obj = (id)objc_claimAutoreleasedReturnValue();

      if (!obj)
      {
        obj = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        -[NetworkQualityExecutionsResult workingLatencyResults](self->super._results, "workingLatencyResults");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKey:", obj, self->super._tcpKey);

      }
      -[NetworkQualityExecutionsResult workingLatencyResults](self->super._results, "workingLatencyResults");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "valueForKey:", self->super._tlsKey);
      v162 = (id)objc_claimAutoreleasedReturnValue();

      if (!v162)
      {
        v162 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        -[NetworkQualityExecutionsResult workingLatencyResults](self->super._results, "workingLatencyResults");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setObject:forKey:", v162, self->super._tlsKey);

      }
      -[NetworkQualityExecutionsResult mutableOtherValues](self->super._results, "mutableOtherValues");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "valueForKey:", CFSTR("ecn_values"));
      v158 = (id)objc_claimAutoreleasedReturnValue();

      if (!v158)
      {
        v158 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        -[NetworkQualityExecutionsResult mutableOtherValues](self->super._results, "mutableOtherValues");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setObject:forKey:", v158, CFSTR("ecn_values"));

      }
      -[NetworkQualityExecutionsResult mutableOtherValues](self->super._results, "mutableOtherValues");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "valueForKey:", CFSTR("l4s_enablement"));
      v156 = (id)objc_claimAutoreleasedReturnValue();

      if (!v156)
      {
        v156 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        -[NetworkQualityExecutionsResult mutableOtherValues](self->super._results, "mutableOtherValues");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setObject:forKey:", v156, CFSTR("l4s_enablement"));

      }
      objc_msgSend(v164, "_establishmentReport");
      report = (nw_establishment_report_t)objc_claimAutoreleasedReturnValue();
      if (!report)
      {
LABEL_28:
        objc_msgSend(v164, "networkProtocolName");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (v39)
        {
          -[NetworkQualityExecutionsResult mutableOtherValues](self->super._results, "mutableOtherValues");
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
          objc_msgSend(v41, "objectForKey:", v39);
          v43 = objc_claimAutoreleasedReturnValue();
          if (v43)
            v44 = (void *)v43;
          else
            v44 = &unk_24C97CC58;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v44, "intValue") + 1);
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v41, "setObject:forKey:", v45, v39);
        }

        -[NetworkQualityExecutionsResult mutableOtherValues](self->super._results, "mutableOtherValues");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "objectForKey:", CFSTR("proxy_state"));
        v47 = (id)objc_claimAutoreleasedReturnValue();

        if (!v47)
        {
          v47 = objc_alloc_init(MEMORY[0x24BDBCED8]);
          -[NetworkQualityExecutionsResult mutableOtherValues](self->super._results, "mutableOtherValues");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "setValue:forKey:", v47, CFSTR("proxy_state"));

        }
        v49 = objc_msgSend(v164, "isProxyConnection");
        v50 = CFSTR("not_proxied");
        if (v49)
          v50 = CFSTR("proxied");
        v51 = v50;
        objc_msgSend(v47, "objectForKey:", v51);
        v52 = objc_claimAutoreleasedReturnValue();
        if (v52)
          v53 = (void *)v52;
        else
          v53 = &unk_24C97CC58;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v53, "intValue") + 1);
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v47, "setObject:forKey:", v54, v51);
        -[NetworkQualityExecutionsResult mutableOtherValues](self->super._results, "mutableOtherValues");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "objectForKey:", CFSTR("interface-type"));
        v56 = (id)objc_claimAutoreleasedReturnValue();

        if (!v56)
        {
          v56 = objc_alloc_init(MEMORY[0x24BDBCED8]);
          -[NetworkQualityExecutionsResult mutableOtherValues](self->super._results, "mutableOtherValues");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "setValue:forKey:", v56, CFSTR("interface-type"));

        }
        objc_msgSend(v164, "_interfaceName");
        v58 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v58, "UTF8String");
        v59 = nw_interface_create_with_name();

        v60 = (void *)MEMORY[0x24BDD17C8];
        type = nw_interface_get_type(v59);
        objc_msgSend(v60, "stringWithUTF8String:", nw_interface_type_to_string(type));
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "objectForKey:", v62);
        v63 = objc_claimAutoreleasedReturnValue();
        if (v63)
          v64 = (void *)v63;
        else
          v64 = &unk_24C97CC58;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v64, "intValue") + 1);
        v65 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v56, "setObject:forKey:", v65, v62);
        -[NetworkQualityExecutionsResult mutableOtherValues](self->super._results, "mutableOtherValues");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "objectForKey:", CFSTR("rat"));
        v67 = (id)objc_claimAutoreleasedReturnValue();

        if (!v67)
        {
          v67 = objc_alloc_init(MEMORY[0x24BDBCED8]);
          -[NetworkQualityExecutionsResult mutableOtherValues](self->super._results, "mutableOtherValues");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "setValue:forKey:", v67, CFSTR("rat"));

        }
        if (nw_interface_get_radio_type())
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", nw_interface_radio_type_to_string());
          v69 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v69 = CFSTR("unknown");
        }

        objc_msgSend(v67, "objectForKey:", v69);
        v70 = objc_claimAutoreleasedReturnValue();

        if (v70)
          v71 = (void *)v70;
        else
          v71 = &unk_24C97CC58;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v71, "intValue") + 1);
        v72 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v67, "setObject:forKey:", v72, v69);
        -[NetworkQualityExecutionsResult mutableOtherValues](self->super._results, "mutableOtherValues");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "objectForKey:", CFSTR("multipath"));
        v74 = (id)objc_claimAutoreleasedReturnValue();

        if (!v74)
        {
          v74 = objc_alloc_init(MEMORY[0x24BDBCED8]);
          -[NetworkQualityExecutionsResult mutableOtherValues](self->super._results, "mutableOtherValues");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "setValue:forKey:", v74, CFSTR("multipath"));

        }
        v76 = objc_msgSend(v164, "isMultipath");
        v77 = CFSTR("disabled");
        if (v76)
          v77 = CFSTR("negotiated");
        v78 = v77;
        objc_msgSend(v74, "objectForKey:", v78);
        v79 = objc_claimAutoreleasedReturnValue();
        if (v79)
          v80 = (void *)v79;
        else
          v80 = &unk_24C97CC58;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v80, "intValue") + 1);
        v81 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v74, "setObject:forKey:", v81, v78);
        v159 = self->super._reqrespKey;
        h2TmpArray = self->_h2TmpArray;
        v83 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v164, "responseEndDate");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v164, "requestStartDate");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "timeIntervalSinceDate:", v85);
        objc_msgSend(v83, "numberWithInt:", (int)(v86 * 1000.0));
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](h2TmpArray, "addObject:", v87);

        v19 = v158;
LABEL_63:

        -[NetworkQualityExecutionsResult workingLatencyResults](self->super._results, "workingLatencyResults");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "valueForKey:", v159);
        v163 = (id)objc_claimAutoreleasedReturnValue();

        if (!v163)
        {
          v163 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          -[NetworkQualityExecutionsResult workingLatencyResults](self->super._results, "workingLatencyResults");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "setObject:forKey:", v163, v159);

        }
        v90 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v164, "responseEndDate");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v164, "requestStartDate");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "timeIntervalSinceDate:", v92);
        objc_msgSend(v90, "numberWithInt:", (int)(v93 * 1000.0));
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v163, "addObject:", v94);

        objc_msgSend(MEMORY[0x24BDBCE60], "now");
        obja = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(obja, "timeIntervalSinceDate:", self->_start);
        if (v95 < 0.2)
          goto LABEL_108;
        objc_storeStrong((id *)&self->_start, obja);
        -[TrimmedMean add:](self->_tcpTrim, "add:", self->_tcpTmpArray);
        v96 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
        tcpTmpArray = self->_tcpTmpArray;
        self->_tcpTmpArray = v96;

        -[TrimmedMean add:](self->_tlsTrim, "add:", self->_tlsTmpArray);
        v98 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
        tlsTmpArray = self->_tlsTmpArray;
        self->_tlsTmpArray = v98;

        -[TrimmedMean add:](self->_h2Trim, "add:", self->_h2TmpArray);
        v100 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v101 = self->_h2TmpArray;
        self->_h2TmpArray = v100;

        -[TrimmedMean add:](self->_selfTrim, "add:", self->_selfTmpArray);
        v102 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v103 = self->_selfTmpArray;
        self->_selfTmpArray = v102;

        -[TrimmedMean getTrimmedMean](self->_tcpTrim, "getTrimmedMean");
        v105 = v104;
        -[TrimmedMean getTrimmedMean](self->_tlsTrim, "getTrimmedMean");
        v107 = v106;
        -[TrimmedMean getTrimmedMean](self->_h2Trim, "getTrimmedMean");
        v109 = v108;
        -[TrimmedMean getTrimmedMean](self->_selfTrim, "getTrimmedMean");
        v111 = *(float *)&v110;
        v112 = fabsf(v105);
        v113 = fabsf(v107);
        v114 = fabsf(v109);
        if (v112 >= 0.00000011921 || v113 >= 0.00000011921 || (v115 = 0.0, v114 >= 0.00000011921))
        {
          v116 = v105 != 0.0;
          if (v107 != 0.0)
            ++v116;
          if (v109 != 0.0)
            ++v116;
          v115 = (float)((float)(v105 + v107) + v109) / (float)v116;
        }
        v117 = fabsf(*(float *)&v110);
        if (fabsf(v115) < 0.00000011921)
        {
          HIDWORD(v110) = 872415232;
          if (v117 < 0.00000011921)
          {
LABEL_108:

            goto LABEL_109;
          }
        }
        else
        {
          *(_QWORD *)&v110 = LODWORD(v115) | 0x3400000000000000;
          if (v117 >= 0.00000011921)
            *(float *)&v110 = (float)(v111 + v115) * 0.5;
        }
        v157 = v113;
        v153 = v117;
        reporta = v114;
        v118 = 60000.0 / *(float *)&v110;
        *(float *)&v110 = 60000.0 / *(float *)&v110;
        if (-[SaturationDetection add:](self->_saturation, "add:", v110)
          && (-[NetworkQualityExecutions throughputSaturated](self->super._execution, "throughputSaturated")
           || -[NetworkQualityExecutions throughputMetExitCriteria](self->super._execution, "throughputMetExitCriteria")))
        {
          if (self->super._saturationHandler)
            self->_saturation_reached = 1;
          -[SaturationDetection getSaturation](self->_saturation, "getSaturation");
        }
        else
        {
          -[SaturationDetection getAverage](self->_saturation, "getAverage");
        }
        v120 = v119;
        netqual_log_init();
        v121 = (id)os_log_netqual;
        if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136317186;
          *(_QWORD *)&buf[4] = "-[WorkingLatencyURLSessionDelegate URLSession:task:didFinishCollectingMetrics:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 1165;
          *(_WORD *)&buf[18] = 2048;
          *(double *)&buf[20] = v118;
          *(_WORD *)&buf[28] = 2048;
          *(double *)&buf[30] = v120;
          *(_WORD *)&buf[38] = 2048;
          v186 = v105;
          v187 = 2048;
          v188 = v107;
          v189 = 2048;
          v190 = v109;
          v191 = 2048;
          v192 = v115;
          v193 = 2048;
          v194 = v111;
          _os_log_impl(&dword_20E622000, v121, OS_LOG_TYPE_DEFAULT, "%s:%u - Responsiveness: %.3f, Saturated: %.3f tcpMean: %.3f tlsMean: %.3f rrMean %.3f foreignMean %.3f srrMean %.3f", buf, 0x58u);
        }

        v122 = !self->isDownlink;
        *(float *)&v123 = v120;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v123);
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        results = self->super._results;
        if (v122)
        {
          -[NetworkQualityResult uplinkResponsiveness](results, "uplinkResponsiveness");
          v141 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v141, "setValue:", v124);

          v142 = (void *)MEMORY[0x24BDD16E0];
          -[NetworkQualityResult uplinkResponsiveness](self->super._results, "uplinkResponsiveness");
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v143, "value");
          v144 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v142, "numberWithLong:", +[NetworkQualityResult ratingForResponsivenessScore:](NetworkQualityResult, "ratingForResponsivenessScore:", objc_msgSend(v144, "integerValue")));
          v145 = (void *)objc_claimAutoreleasedReturnValue();
          -[NetworkQualityResult uplinkResponsiveness](self->super._results, "uplinkResponsiveness");
          v146 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v146, "setRating:", v145);

          -[NetworkQualityResult uplinkResponsiveness](self->super._results, "uplinkResponsiveness");
          v147 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v147, "updateConfidence:", -[WorkingLatencyURLSessionDelegate currentResponsivenessConfidenceValue](self, "currentResponsivenessConfidenceValue"));

          if (v112 >= 0.00000011921)
          {
            v133.n128_f32[0] = 60000.0 / v105;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v133.n128_f64[0]);
            v148 = (void *)objc_claimAutoreleasedReturnValue();
            -[NetworkQualityResult setUplinkTCPResponsiveness:](self->super._results, "setUplinkTCPResponsiveness:", v148);

          }
          HIDWORD(v149) = 872415232;
          v134.n128_f32[0] = v157;
          if (v157 >= 0.00000011921)
          {
            *(float *)&v149 = 60000.0 / v107;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v149, v134.n128_f64[0]);
            v150 = (void *)objc_claimAutoreleasedReturnValue();
            -[NetworkQualityResult setUplinkTLSResponsiveness:](self->super._results, "setUplinkTLSResponsiveness:", v150);

          }
          HIDWORD(v151) = 872415232;
          v134.n128_f32[0] = reporta;
          if (reporta >= 0.00000011921)
          {
            *(float *)&v151 = 60000.0 / v109;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v151, v134.n128_f64[0]);
            v152 = (void *)objc_claimAutoreleasedReturnValue();
            -[NetworkQualityResult setUplinkHTTPForeignResponsiveness:](self->super._results, "setUplinkHTTPForeignResponsiveness:", v152);

          }
          v133.n128_u64[0] = 0x3400000034000000;
          v134.n128_f32[0] = v153;
          if (v153 < 0.00000011921)
            goto LABEL_105;
          v133.n128_f32[0] = 60000.0 / v111;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v133.n128_f64[0], v134.n128_f64[0]);
          v140 = (void *)objc_claimAutoreleasedReturnValue();
          -[NetworkQualityResult setUplinkHTTPSelfResponsiveness:](self->super._results, "setUplinkHTTPSelfResponsiveness:", v140);
        }
        else
        {
          -[NetworkQualityResult downlinkResponsiveness](results, "downlinkResponsiveness");
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v126, "setValue:", v124);

          v127 = (void *)MEMORY[0x24BDD16E0];
          -[NetworkQualityResult downlinkResponsiveness](self->super._results, "downlinkResponsiveness");
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v128, "value");
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v127, "numberWithLong:", +[NetworkQualityResult ratingForResponsivenessScore:](NetworkQualityResult, "ratingForResponsivenessScore:", objc_msgSend(v129, "integerValue")));
          v130 = (void *)objc_claimAutoreleasedReturnValue();
          -[NetworkQualityResult downlinkResponsiveness](self->super._results, "downlinkResponsiveness");
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v131, "setRating:", v130);

          -[NetworkQualityResult downlinkResponsiveness](self->super._results, "downlinkResponsiveness");
          v132 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v132, "updateConfidence:", -[WorkingLatencyURLSessionDelegate currentResponsivenessConfidenceValue](self, "currentResponsivenessConfidenceValue"));

          if (v112 >= 0.00000011921)
          {
            v133.n128_f32[0] = 60000.0 / v105;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v133.n128_f64[0]);
            v135 = (void *)objc_claimAutoreleasedReturnValue();
            -[NetworkQualityResult setDownlinkTCPResponsiveness:](self->super._results, "setDownlinkTCPResponsiveness:", v135);

          }
          HIDWORD(v136) = 872415232;
          v134.n128_f32[0] = v157;
          if (v157 >= 0.00000011921)
          {
            *(float *)&v136 = 60000.0 / v107;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v136, v134.n128_f64[0]);
            v137 = (void *)objc_claimAutoreleasedReturnValue();
            -[NetworkQualityResult setDownlinkTLSResponsiveness:](self->super._results, "setDownlinkTLSResponsiveness:", v137);

          }
          HIDWORD(v138) = 872415232;
          v134.n128_f32[0] = reporta;
          if (reporta >= 0.00000011921)
          {
            *(float *)&v138 = 60000.0 / v109;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v138, v134.n128_f64[0]);
            v139 = (void *)objc_claimAutoreleasedReturnValue();
            -[NetworkQualityResult setDownlinkHTTPForeignResponsiveness:](self->super._results, "setDownlinkHTTPForeignResponsiveness:", v139);

          }
          v133.n128_u64[0] = 0x3400000034000000;
          v134.n128_f32[0] = v153;
          if (v153 < 0.00000011921)
            goto LABEL_105;
          v133.n128_f32[0] = 60000.0 / v111;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v133.n128_f64[0], v134.n128_f64[0]);
          v140 = (void *)objc_claimAutoreleasedReturnValue();
          -[NetworkQualityResult setDownlinkHTTPSelfResponsiveness:](self->super._results, "setDownlinkHTTPSelfResponsiveness:", v140);
        }

LABEL_105:
        if (self->_saturation_reached)
        {
          (*((void (**)(__n128, __n128))self->super._completionHandler + 2))(v133, v134);
          v133.n128_f64[0] = (*((double (**)(void))self->super._saturationHandler + 2))();
        }
        -[LatencyURLSessionDelegate shareProgress](self, "shareProgress", v133.n128_f64[0], v134.n128_f64[0]);
        goto LABEL_108;
      }
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      *(_QWORD *)&buf[24] = __Block_byref_object_copy__0;
      *(_QWORD *)&buf[32] = __Block_byref_object_dispose__0;
      v186 = 0.0;
      v181 = 0;
      v182 = &v181;
      v183 = 0x2020000000;
      v184 = 0;
      v177 = 0;
      v178 = &v177;
      v179 = 0x2020000000;
      v180 = 0;
      v173 = 0;
      v174 = &v173;
      v175 = 0x2020000000;
      v176 = 0;
      enumerate_block[0] = MEMORY[0x24BDAC760];
      enumerate_block[1] = 3221225472;
      enumerate_block[2] = __79__WorkingLatencyURLSessionDelegate_URLSession_task_didFinishCollectingMetrics___block_invoke;
      enumerate_block[3] = &unk_24C976750;
      v169 = buf;
      v170 = &v181;
      v168 = v10;
      v171 = &v177;
      v172 = &v173;
      nw_establishment_report_enumerate_protocols(report, enumerate_block);
      if (*((_BYTE *)v178 + 24))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v174[3]);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(obj, "addObject:", v28);

        v29 = self->_tcpTmpArray;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v174[3]);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](v29, "addObject:", v30);

      }
      v31 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      v32 = (void *)MEMORY[0x212BC1DB8]();
      if (MEMORY[0x212BC1DC4](v31, v32))
      {

      }
      else
      {
        v34 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
        v35 = (void *)nw_protocol_copy_quic_connection_definition();
        LODWORD(v34) = MEMORY[0x212BC1DC4](v34, v35);

        if (!(_DWORD)v34)
        {
LABEL_27:
          v165 = v158;
          v166 = v156;
          nw_establishment_report_enumerate_protocol_l4s_state();

          _Block_object_dispose(&v173, 8);
          _Block_object_dispose(&v177, 8);
          _Block_object_dispose(&v181, 8);
          _Block_object_dispose(buf, 8);

          goto LABEL_28;
        }
      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v182[3]);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v162, "addObject:", v36);

      v37 = self->_tlsTmpArray;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v182[3]);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v37, "addObject:", v38);

      goto LABEL_27;
    }
  }
LABEL_110:

}

uint64_t __79__WorkingLatencyURLSessionDelegate_URLSession_task_didFinishCollectingMetrics___block_invoke(uint64_t a1, void *a2, uint64_t a3)
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

uint64_t __79__WorkingLatencyURLSessionDelegate_URLSession_task_didFinishCollectingMetrics___block_invoke_2(uint64_t a1, void *a2, unsigned int a3, uint64_t a4, int a5)
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

- (int64_t)currentResponsivenessConfidenceValue
{
  if (!self->_probeLoadConnections
    || !-[NetworkQualityExecutions throughputSaturated](self->super._execution, "throughputSaturated"))
  {
    return 1;
  }
  if (self->_saturation_reached)
    return 3;
  return 2;
}

- (BOOL)checkLimits
{
  BOOL v3;
  void *v4;
  double v5;
  float v7;
  int exitCriteriaCounter;

  if (!self->super._saturationHandler)
    return 0;
  if (!-[LatencyURLSessionDelegate metExitCriteria](self, "metExitCriteria"))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", self->_current);
    if (v5 >= 0.2)
    {
      objc_storeStrong((id *)&self->_current, v4);
      -[SaturationDetection getAverage](self->_saturation, "getAverage");
      exitCriteriaCounter = self->super._exitCriteriaCounter;
      if (self->_exit_value >= (float)(uint64_t)v7)
      {
        if (exitCriteriaCounter >= 1)
        {
          v3 = 0;
          self->super._exitCriteriaCounter = 0;
          goto LABEL_7;
        }
      }
      else
      {
        self->super._exitCriteriaCounter = exitCriteriaCounter + 1;
        if (-[LatencyURLSessionDelegate metExitCriteria](self, "metExitCriteria"))
        {
          (*((void (**)(void))self->super._saturationHandler + 2))();
          -[LatencyURLSessionDelegate shareProgress](self, "shareProgress");
          v3 = 1;
          goto LABEL_7;
        }
      }
    }
    v3 = 0;
LABEL_7:

    return v3;
  }
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_current, 0);
  objc_storeStrong((id *)&self->_start, 0);
  objc_storeStrong((id *)&self->_saturation, 0);
  objc_storeStrong((id *)&self->_selfTrim, 0);
  objc_storeStrong((id *)&self->_selfTmpArray, 0);
  objc_storeStrong((id *)&self->_h2Trim, 0);
  objc_storeStrong((id *)&self->_h2TmpArray, 0);
  objc_storeStrong((id *)&self->_tlsTrim, 0);
  objc_storeStrong((id *)&self->_tlsTmpArray, 0);
  objc_storeStrong((id *)&self->_tcpTrim, 0);
  objc_storeStrong((id *)&self->_tcpTmpArray, 0);
  objc_storeStrong((id *)&self->_workingSessions, 0);
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
