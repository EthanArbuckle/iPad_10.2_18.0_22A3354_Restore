@implementation STSReaderAnalyticsLogger

+ (id)sharedCALogger
{
  if (qword_254DE9380 != -1)
    dispatch_once(&qword_254DE9380, &unk_24D3A77A8);
  return (id)qword_254DE9378;
}

- (STSReaderAnalyticsLogger)init
{
  STSReaderAnalyticsLogger *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STSReaderAnalyticsLogger;
  v2 = -[STSReaderAnalyticsLogger init](&v8, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.sts.analyticsLogger", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)_postReaderTransactionEvent:(id)a3 prepOnly:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  uint64_t v21;
  void *v22;
  void *v23;
  char v24;
  uint64_t v25;
  void *v26;
  void *v27;
  char v28;
  uint64_t v29;
  void *v30;
  void *v31;
  char v32;
  uint64_t v33;
  void *v34;
  void *v35;
  char v36;
  uint64_t v37;
  void *v38;
  void *v39;
  char v40;
  uint64_t v41;
  void *v42;
  void *v43;
  char v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  unsigned int v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  int v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  double v65;
  double v66;
  uint64_t v67;
  uint64_t v68;
  double v69;
  uint64_t v70;
  double v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  int v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  _QWORD v95[4];
  _QWORD v96[4];
  _QWORD v97[11];
  _QWORD v98[13];

  v4 = a4;
  v98[11] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("transactionStartEventTime"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("transactionStartEventTime"));
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)qword_254DE9388;
      qword_254DE9388 = v9;

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("engagementType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v12 = objc_opt_isKindOfClass();

    if ((v12 & 1) != 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("engagementType"));
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)qword_254DE91B8;
      qword_254DE91B8 = v13;

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("supportedtedReaderBTRoles"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v16 = objc_opt_isKindOfClass();

    if ((v16 & 1) != 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("supportedtedReaderBTRoles"));
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)qword_254DE91C0;
      qword_254DE91C0 = v17;

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("responseSize"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v20 = objc_opt_isKindOfClass();

    if ((v20 & 1) != 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("responseSize"));
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)qword_254DE91D0;
      qword_254DE91D0 = v21;

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("requestSize"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v24 = objc_opt_isKindOfClass();

    if ((v24 & 1) != 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("requestSize"));
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)qword_254DE91C8;
      qword_254DE91C8 = v25;

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("handoverResponseSize"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v28 = objc_opt_isKindOfClass();

    if ((v28 & 1) != 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("handoverResponseSize"));
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = (void *)qword_254DE91E0;
      qword_254DE91E0 = v29;

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("handoverRequestSize"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v32 = objc_opt_isKindOfClass();

    if ((v32 & 1) != 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("handoverRequestSize"));
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = (void *)qword_254DE91D8;
      qword_254DE91D8 = v33;

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("handoverStartEventTime"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v36 = objc_opt_isKindOfClass();

    if ((v36 & 1) != 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("handoverStartEventTime"));
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = (void *)qword_254DE9390;
      qword_254DE9390 = v37;

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("handoverEndEventTime"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v40 = objc_opt_isKindOfClass();

    if ((v40 & 1) != 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("handoverEndEventTime"));
      v41 = objc_claimAutoreleasedReturnValue();
      v42 = (void *)qword_254DE9398;
      qword_254DE9398 = v41;

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("altCarrierStartEventTime"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v44 = objc_opt_isKindOfClass();

    if ((v44 & 1) != 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("altCarrierStartEventTime"));
      v45 = objc_claimAutoreleasedReturnValue();
      v46 = (void *)qword_254DE93A0;
      qword_254DE93A0 = v45;

    }
    v47 = &unk_24D3B35A8;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "UUIDString");
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    v53 = qword_254DE9388;
    if (!qword_254DE9388)
      sub_2158CDF18(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReaderAnalyticsLogger _postReaderTransactionEvent:prepOnly:]", 146, CFSTR("Missing startEvent time"), v50, v51, v52, v92);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("transactionEndEventTime"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v55 = (v53 != 0) & objc_opt_isKindOfClass();

    if (v55 == 1)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("transactionEndEventTime"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      sub_2158CDF18(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReaderAnalyticsLogger _postReaderTransactionEvent:prepOnly:]", 153, CFSTR("Missing dictionary element %@"), v56, v57, v58, (uint64_t)CFSTR("transactionEndEventTime"));
      v59 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("errorCode"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v61 = v55 & objc_opt_isKindOfClass();

    if (v61 == 1)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("errorCode"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      sub_2158CDF18(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReaderAnalyticsLogger _postReaderTransactionEvent:prepOnly:]", 159, CFSTR("Missing dictionary element %@"), v62, v63, v64, (uint64_t)CFSTR("errorCode"));
      v47 = &unk_24D3B35A8;
    }
    if (v55)
    {
      objc_msgSend(v59, "timeIntervalSinceDate:", qword_254DE9388);
      v66 = v65;
      v67 = 0;
      v68 = qword_254DE9398;
      v94 = v59;
      if (qword_254DE9390 && qword_254DE9398)
      {
        objc_msgSend((id)qword_254DE9398, "timeIntervalSinceDate:");
        v67 = (uint64_t)(v69 * 1000.0);
        v68 = qword_254DE9398;
      }
      v70 = 0;
      if (qword_254DE93A0 && v68)
      {
        objc_msgSend(v94, "timeIntervalSinceDate:");
        v70 = (uint64_t)(v71 * 1000.0);
      }
      v97[0] = CFSTR("transactionUUID");
      v97[1] = CFSTR("engagementType");
      v93 = v49;
      v98[0] = v49;
      v98[1] = qword_254DE91B8;
      v97[2] = CFSTR("supportedtedReaderBTRoles");
      v97[3] = CFSTR("errorCode");
      v98[2] = qword_254DE91C0;
      v98[3] = v47;
      v97[4] = CFSTR("totalDurationSec");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", (uint64_t)v66);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v98[4] = v72;
      v97[5] = CFSTR("engagementDurationMSec");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v67);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v98[5] = v73;
      v97[6] = CFSTR("altCarrierTransactionDurationMSecs");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v70);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v98[6] = v74;
      v98[7] = qword_254DE91D0;
      v97[7] = CFSTR("responseSize");
      v97[8] = CFSTR("requestSize");
      v98[8] = qword_254DE91C8;
      v98[9] = qword_254DE91D8;
      v97[9] = CFSTR("handoverRequestSize");
      v97[10] = CFSTR("handoverResponseSize");
      v98[10] = qword_254DE91E0;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v98, v97, 11);
      v75 = (void *)objc_claimAutoreleasedReturnValue();

      +[CALogger postCAEventFor:eventInput:](CALogger, "postCAEventFor:eventInput:", CFSTR("com.apple.sts.readerISO18013TransactionEvent"), v75);
      v95[0] = CFSTR("totalNFCEngagementTransactions");
      if (objc_msgSend((id)qword_254DE91B8, "intValue") == 1)
        v76 = &unk_24D3B35D8;
      else
        v76 = &unk_24D3B35A8;
      v96[0] = v76;
      v95[1] = CFSTR("totalQRCodeEngagementTransactions");
      if (objc_msgSend((id)qword_254DE91B8, "intValue") == 2)
        v77 = &unk_24D3B35D8;
      else
        v77 = &unk_24D3B35A8;
      v96[1] = v77;
      v95[2] = CFSTR("totalSuccessfulNFCEngagementTransactions");
      v78 = objc_msgSend((id)qword_254DE91B8, "intValue");
      v79 = &unk_24D3B35A8;
      if (v78 == 1)
      {
        if (objc_msgSend(v47, "intValue"))
          v79 = &unk_24D3B35A8;
        else
          v79 = &unk_24D3B35D8;
      }
      v96[2] = v79;
      v95[3] = CFSTR("totalSuccessfulQRCodeEngagementTransactions");
      v80 = &unk_24D3B35A8;
      if (objc_msgSend((id)qword_254DE91B8, "intValue") == 2
        && !objc_msgSend(v47, "intValue"))
      {
        v80 = &unk_24D3B35D8;
      }
      v96[3] = v80;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v96, v95, 4);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      +[CALogger postCAEventFor:eventInput:](CALogger, "postCAEventFor:eventInput:", CFSTR("com.apple.sts.dailyReaderISO18013Statistics"), v81);

      v49 = v93;
      v59 = v94;
    }
    v82 = (void *)qword_254DE9388;
    qword_254DE9388 = 0;

    v83 = (void *)qword_254DE9390;
    qword_254DE9390 = 0;

    v84 = (void *)qword_254DE9398;
    qword_254DE9398 = 0;

    v85 = (void *)qword_254DE93A0;
    qword_254DE93A0 = 0;

    v86 = (void *)qword_254DE91B8;
    qword_254DE91B8 = (uint64_t)&unk_24D3B35C0;

    v87 = (void *)qword_254DE91C8;
    qword_254DE91C8 = (uint64_t)&unk_24D3B35A8;

    v88 = (void *)qword_254DE91D0;
    qword_254DE91D0 = (uint64_t)&unk_24D3B35A8;

    v89 = (void *)qword_254DE91D8;
    qword_254DE91D8 = (uint64_t)&unk_24D3B35A8;

    v90 = (void *)qword_254DE91E0;
    qword_254DE91E0 = (uint64_t)&unk_24D3B35A8;

    v91 = (void *)qword_254DE91C0;
    qword_254DE91C0 = (uint64_t)&unk_24D3B35C0;

  }
}

- (void)_postReaderSessionEvent:(id)a3
{
  +[CALogger postCAEventFor:eventInput:](CALogger, "postCAEventFor:eventInput:", CFSTR("com.apple.sts.readerISO18013SessionEvent"), a3);
}

- (void)postReaderTransactionEvent:(id)a3 prepOnly:(BOOL)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2158CEF4C;
  block[3] = &unk_24D3A77D0;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(queue, block);

}

- (void)postReaderSessionEvent:(id)a3
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
  v7[2] = sub_2158CEFD8;
  v7[3] = &unk_24D3A6EE0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
