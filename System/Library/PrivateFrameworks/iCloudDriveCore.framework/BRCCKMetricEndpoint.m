@implementation BRCCKMetricEndpoint

- (BRCCKMetricEndpoint)initWithSession:(id)a3
{
  id v5;
  BRCCKMetricEndpoint *v6;
  BRCCKMetricEndpoint *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRCCKMetricEndpoint;
  v6 = -[BRCCKMetricEndpoint init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_session, a3);

  return v7;
}

- (void)submitEventMetric:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;

  v4 = a3;
  if (v4)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[BRCCKMetricEndpoint submitEventMetric:].cold.1();

    objc_msgSend(v4, "associatedCKEventMetricIfAvailable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v8 = objc_alloc(MEMORY[0x24BDB9098]);
      objc_msgSend(v4, "eventName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "startTime");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v8, "initWithEventName:atTime:", v9, v10);

    }
    objc_msgSend(v4, "startTime");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setStartTime:", v11);

    objc_msgSend(v4, "endTime");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEndTime:", v12);

    objc_msgSend(v4, "additionalPayload");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __41__BRCCKMetricEndpoint_submitEventMetric___block_invoke;
    v18[3] = &unk_24FE40C08;
    v19 = v7;
    v14 = v7;
    objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v18);

    -[BRCAccountSessionFPFS syncContextProvider](self->_session, "syncContextProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "defaultSyncContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "ckContainer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "submitEventMetric:", v14);
  }

}

uint64_t __41__BRCCKMetricEndpoint_submitEventMetric___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a3, a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
}

- (void)submitEventMetric:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_230455000, v0, (uint64_t)v0, "[DEBUG] analytics: submitting event %@%@", v1);
  OUTLINED_FUNCTION_0();
}

@end
