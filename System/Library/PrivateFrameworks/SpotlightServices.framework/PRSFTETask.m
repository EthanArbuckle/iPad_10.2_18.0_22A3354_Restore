@implementation PRSFTETask

- (BOOL)needsBag
{
  return 1;
}

- (PRSFTETask)initWithReply:(id)a3
{
  id v4;
  PRSFTETask *v5;
  uint64_t v6;
  id reply;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRSFTETask;
  v5 = -[PRSFTETask init](&v9, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x1BCCB38DC](v4);
    reply = v5->_reply;
    v5->_reply = (id)v6;

  }
  return v5;
}

- (void)triggerQuery:(BOOL)a3
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (**reply)(id, void *, void *, void *, void *, _QWORD);
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  +[PRSBagHandler sharedHandler](PRSBagHandler, "sharedHandler", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "status") == 4)
  {
    PRSLogCategoryDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[PRSFTETask triggerQuery:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

    (*((void (**)(void))self->_reply + 2))();
  }
  else
  {
    reply = (void (**)(id, void *, void *, void *, void *, _QWORD))self->_reply;
    objc_msgSend(v4, "fteLocString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fteLearnMoreString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fteContinueString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enabledDomains");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    reply[2](reply, v14, v15, v16, v17, 0);

  }
}

- (BOOL)allowLocation
{
  return 1;
}

- (id)reply
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setReply:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_reply, 0);
}

- (void)triggerQuery:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1B86C5000, a1, a3, "[FTE] returning nil in trigger query", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
