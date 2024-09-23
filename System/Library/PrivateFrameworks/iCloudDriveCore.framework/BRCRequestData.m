@implementation BRCRequestData

- (BRCRequestData)initWithProgress:(id)a3 requestType:(signed __int16)a4 finishBlock:(id)a5
{
  id v9;
  id v10;
  BRCRequestData *v11;
  BRCRequestData *v12;
  uint64_t v13;
  id finishBlock;
  objc_super v16;

  v9 = a3;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)BRCRequestData;
  v11 = -[BRCRequestData init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_progress, a3);
    v13 = MEMORY[0x2348BA0DC](v10);
    finishBlock = v12->_finishBlock;
    v12->_finishBlock = (id)v13;

    v12->_requestType = a4;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[BRCRequestData initWithProgress:requestType:finishBlock:]([BRCRequestData alloc], "initWithProgress:requestType:finishBlock:", self->_progress, self->_requestType, self->_finishBlock);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  unint64_t requestType;
  const __CFString *v6;
  void *v7;
  NSObject *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  requestType = self->_requestType;
  if (requestType >= 3)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[BRCRequestData description].cold.1((uint64_t)v7, v8);

    v6 = CFSTR("invalid");
  }
  else
  {
    v6 = off_24FE49228[requestType];
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p type:%@ %@ progress:%@>"), v4, self, v6, &stru_24FE4A790, self->_progress);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BRCProgress)progress
{
  return self->_progress;
}

- (id)finishBlock
{
  return self->_finishBlock;
}

- (signed)requestType
{
  return self->_requestType;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_finishBlock, 0);
  objc_storeStrong((id *)&self->_progress, 0);
}

- (void)description
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_230455000, a2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Recieved an invalid request type%@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_0();
}

@end
