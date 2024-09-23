@implementation SSMetricsDialogEvent

- (SSMetricsDialogEvent)init
{
  SSMetricsDialogEvent *v2;
  SSMetricsDialogEvent *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SSMetricsDialogEvent;
  v2 = -[SSMetricsBaseEvent init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SSMetricsMutableEvent setEventType:](v2, "setEventType:", CFSTR("dialog"));
    -[SSMetricsMutableEvent setEventVersion:](v3, "setEventVersion:", &unk_1E481E660);
  }
  return v3;
}

- (NSString)actionType
{
  void *v2;
  void *v3;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("actionType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSString *)v3;
}

- (NSString)actionURL
{
  void *v2;
  void *v3;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("actionURL"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSString *)v3;
}

- (NSDictionary)details
{
  return (NSDictionary *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("details"));
}

- (NSString)dialogId
{
  void *v2;
  void *v3;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("dialogId"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSString *)v3;
}

- (NSString)dialogType
{
  void *v2;
  void *v3;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("dialogType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSString *)v3;
}

- (NSString)dualAction
{
  void *v2;
  void *v3;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("dualAction"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSString *)v3;
}

- (NSString)message
{
  void *v2;
  void *v3;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("message"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSString *)v3;
}

- (NSString)result
{
  void *v2;
  void *v3;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("result"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSString *)v3;
}

- (void)setActionType:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("actionType"));
}

- (void)setActionURL:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("actionURL"));
}

- (void)setDetails:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("details"));
}

- (void)setDialogId:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("dialogId"));
}

- (void)setDialogType:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("dialogType"));
}

- (void)setDualAction:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("dualAction"));
}

- (void)setMessage:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("message"));
}

- (void)setResult:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("result"));
}

- (void)setTargetId:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("targetId"));
}

- (void)setUserActions:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("userActions"));
}

- (NSString)targetId
{
  void *v2;
  void *v3;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("targetId"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSString *)v3;
}

- (NSArray)userActions
{
  return (NSArray *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("userActions"));
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = xpc_dictionary_create(0, 0, 0);
  -[SSMetricsDialogEvent actionType](self, "actionType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SSXPCDictionarySetObject(v3, "300", v4);

  -[SSMetricsDialogEvent actionURL](self, "actionURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SSXPCDictionarySetObject(v3, "301", v5);

  -[SSMetricsDialogEvent details](self, "details");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SSXPCDictionarySetObject(v3, "302", v6);

  -[SSMetricsDialogEvent dialogId](self, "dialogId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SSXPCDictionarySetObject(v3, "303", v7);

  -[SSMetricsDialogEvent dialogType](self, "dialogType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SSXPCDictionarySetObject(v3, "304", v8);

  -[SSMetricsDialogEvent dualAction](self, "dualAction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SSXPCDictionarySetObject(v3, "311", v9);

  -[SSMetricsMutableEvent eventType](self, "eventType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  SSXPCDictionarySetObject(v3, "305", v10);

  -[SSMetricsDialogEvent message](self, "message");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  SSXPCDictionarySetObject(v3, "306", v11);

  -[SSMetricsDialogEvent result](self, "result");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  SSXPCDictionarySetObject(v3, "307", v12);

  -[SSMetricsDialogEvent targetId](self, "targetId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  SSXPCDictionarySetObject(v3, "308", v13);

  -[SSMetricsDialogEvent userActions](self, "userActions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  SSXPCDictionarySetObject(v3, "309", v14);

  -[SSMetricsMutableEvent userAgent](self, "userAgent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  SSXPCDictionarySetObject(v3, "310", v15);

  return v3;
}

- (SSMetricsDialogEvent)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  SSMetricsDialogEvent *v6;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  objc_super v32;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A85863E4](v4) == MEMORY[0x1E0C812F8])
  {
    v32.receiver = self;
    v32.super_class = (Class)SSMetricsDialogEvent;
    v6 = -[SSMetricsBaseEvent init](&v32, sel_init);
    if (v6)
    {
      v8 = objc_opt_class();
      v9 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "300", v8);
      -[SSMetricsDialogEvent setActionType:](v6, "setActionType:", v9);

      v10 = objc_opt_class();
      v11 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "301", v10);
      -[SSMetricsDialogEvent setActionURL:](v6, "setActionURL:", v11);

      v12 = objc_opt_class();
      v13 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "302", v12);
      -[SSMetricsDialogEvent setDetails:](v6, "setDetails:", v13);

      v14 = objc_opt_class();
      v15 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "303", v14);
      -[SSMetricsDialogEvent setDialogId:](v6, "setDialogId:", v15);

      v16 = objc_opt_class();
      v17 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "304", v16);
      -[SSMetricsDialogEvent setDialogType:](v6, "setDialogType:", v17);

      v18 = objc_opt_class();
      v19 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "311", v18);
      -[SSMetricsDialogEvent setDualAction:](v6, "setDualAction:", v19);

      v20 = objc_opt_class();
      v21 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "305", v20);
      -[SSMetricsMutableEvent setEventType:](v6, "setEventType:", v21);

      v22 = objc_opt_class();
      v23 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "306", v22);
      -[SSMetricsDialogEvent setMessage:](v6, "setMessage:", v23);

      v24 = objc_opt_class();
      v25 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "307", v24);
      -[SSMetricsDialogEvent setResult:](v6, "setResult:", v25);

      v26 = objc_opt_class();
      v27 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "308", v26);
      -[SSMetricsDialogEvent setTargetId:](v6, "setTargetId:", v27);

      v28 = objc_opt_class();
      v29 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "309", v28);
      -[SSMetricsDialogEvent setUserActions:](v6, "setUserActions:", v29);

      v30 = objc_opt_class();
      v31 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "310", v30);
      -[SSMetricsMutableEvent setUserAgent:](v6, "setUserAgent:", v31);

    }
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

@end
