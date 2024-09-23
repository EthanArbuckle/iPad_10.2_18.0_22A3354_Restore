@implementation PCCRequest

- (PCCRequest)initWithMessage:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  PCCRequest *v8;
  uint64_t v9;
  NSString *jid;
  uint64_t v11;
  NSString *type;
  void *v13;
  const __CFString *v14;
  void *v15;
  int v16;
  NSString *v17;
  uint64_t v18;
  NSString *event;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PCCRequest;
  v8 = -[PCCRequest init](&v21, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("jobId"));
    v9 = objc_claimAutoreleasedReturnValue();
    jid = v8->_jid;
    v8->_jid = (NSString *)v9;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("messageType"));
    v11 = objc_claimAutoreleasedReturnValue();
    type = v8->_type;
    v8->_type = (NSString *)v11;

    if (-[NSString isEqualToString:](v8->_type, "isEqualToString:", CFSTR("initiateLogTransfer")))
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("logFile"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v14 = CFSTR("xfer-file");
      }
      else
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("allFiles"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "BOOLValue");

        v14 = CFSTR("xfer-group");
        if (v16)
          v14 = CFSTR("xfer-all");
      }
      v17 = v8->_type;
      v8->_type = &v14->isa;

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("jobEvent"));
      v18 = objc_claimAutoreleasedReturnValue();
      event = v8->_event;
      v8->_event = (NSString *)v18;

    }
    objc_storeStrong((id *)&v8->_options, a4);
  }

  return v8;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), self->_jid, self->_type);
}

- (NSString)jid
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)event
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (id)callback
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setCallback:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_jid, 0);
}

@end
