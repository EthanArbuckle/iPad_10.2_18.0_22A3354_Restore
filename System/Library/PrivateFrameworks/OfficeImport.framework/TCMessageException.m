@implementation TCMessageException

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && (initAllMessages(void)::alreadyDone & 1) == 0)
  {
    initAllMessages(void)::alreadyDone = 1;
    objc_opt_class();
  }
}

- (TCMessageException)initWithMessage:(id)a3
{
  id v4;
  TCMessageException *v5;
  TCMessageEntry *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  TCMessageEntry *m_entry;
  objc_super v12;
  uint64_t v13;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TCMessageException;
  v5 = -[TCMessageException initWithName:reason:userInfo:](&v12, sel_initWithName_reason_userInfo_, CFSTR("TCMessageException"), 0, 0);
  if (v5)
  {
    v6 = [TCMessageEntry alloc];
    v7 = objc_msgSend(v4, "messageTag");
    objc_msgSend(v4, "messageText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[TCMessageEntry initWithTag:affectedObject:text:parameters:](v6, "initWithTag:affectedObject:text:parameters:", v7, 0, v8, &v13);
    m_entry = v5->m_entry;
    v5->m_entry = (TCMessageEntry *)v9;

  }
  return v5;
}

- (TCMessageException)initWithUntaggedMessage:(id)a3
{
  id v4;
  TCMessageException *v5;
  TCMessageEntry *v6;
  TCMessageEntry *m_entry;
  objc_super v9;
  uint64_t v10;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TCMessageException;
  v5 = -[TCMessageException initWithName:reason:userInfo:](&v9, sel_initWithName_reason_userInfo_, CFSTR("TCMessageException"), 0, 0);
  if (v5)
  {
    v6 = -[TCMessageEntry initWithTag:affectedObject:text:parameters:]([TCMessageEntry alloc], "initWithTag:affectedObject:text:parameters:", 0xFFFFFFFFLL, 0, v4, &v10);
    m_entry = v5->m_entry;
    v5->m_entry = v6;

  }
  return v5;
}

+ (id)exceptionWithMessage:(id)a3
{
  id v4;
  _QWORD *v5;
  TCMessageEntry *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;

  v4 = a3;
  v5 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "initWithName:reason:userInfo:", CFSTR("TCMessageException"), 0, 0);
  if (v5)
  {
    v6 = [TCMessageEntry alloc];
    v7 = objc_msgSend(v4, "messageTag");
    objc_msgSend(v4, "messageText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[TCMessageEntry initWithTag:affectedObject:text:parameters:](v6, "initWithTag:affectedObject:text:parameters:", v7, 0, v8, &v12);
    v10 = (void *)v5[5];
    v5[5] = v9;

  }
  return v5;
}

+ (id)exceptionWithUntaggedMessage:(id)a3
{
  id v4;
  _QWORD *v5;
  TCMessageEntry *v6;
  void *v7;
  uint64_t v9;

  v4 = a3;
  v5 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "initWithName:reason:userInfo:", CFSTR("TCMessageException"), 0, 0);
  if (v5)
  {
    v6 = -[TCMessageEntry initWithTag:affectedObject:text:parameters:]([TCMessageEntry alloc], "initWithTag:affectedObject:text:parameters:", 0xFFFFFFFFLL, 0, v4, &v9);
    v7 = (void *)v5[5];
    v5[5] = v6;

  }
  return v5;
}

- (id)getEntry
{
  return self->m_entry;
}

+ (void)raise:(id)a3
{
  id v3;
  _QWORD *v4;
  TCMessageEntry *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v3 = a3;
  +[TCMessageException exceptionWithName:reason:userInfo:](TCMessageException, "exceptionWithName:reason:userInfo:", CFSTR("TCMessageException"), 0, 0);
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v5 = [TCMessageEntry alloc];
  v6 = objc_msgSend(v3, "messageTag");
  objc_msgSend(v3, "messageText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TCMessageEntry initWithTag:affectedObject:text:parameters:](v5, "initWithTag:affectedObject:text:parameters:", v6, 0, v7, &v10);
  v9 = (void *)v4[5];
  v4[5] = v8;

  objc_msgSend(v4, "raise");
}

+ (void)raiseUntaggedMessage:(id)a3
{
  id v3;
  _QWORD *v4;
  TCMessageEntry *v5;
  void *v6;
  uint64_t v7;

  v3 = a3;
  +[TCMessageException exceptionWithName:reason:userInfo:](TCMessageException, "exceptionWithName:reason:userInfo:", CFSTR("TCMessageException"), 0, 0);
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v5 = -[TCMessageEntry initWithTag:affectedObject:text:parameters:]([TCMessageEntry alloc], "initWithTag:affectedObject:text:parameters:", 0xFFFFFFFFLL, 0, v3, &v7);
  v6 = (void *)v4[5];
  v4[5] = v5;

  objc_msgSend(v4, "raise");
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[TCMessageEntry description](self->m_entry, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("TCMessageException: %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)nsError:(id)a3 domain:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  int v20;
  uint64_t v21;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v5, "getEntry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getMessageText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {

    goto LABEL_10;
  }
  objc_msgSend((id)TCUnknownProblemMessage, "messageText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if ((v10 & 1) != 0)
  {
LABEL_10:
    objc_msgSend(v5, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", *MEMORY[0x24BDBCB70]);

    if (v20)
    {
      objc_msgSend((id)TCOutOfMemoryMessage, "messageText");
      v21 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v21;
    }
    v12 = 0;
    v14 = 0;
    v17 = 0;
    v16 = (void *)MEMORY[0x24BDD1540];
    goto LABEL_13;
  }
  objc_msgSend(v5, "getEntry");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = objc_msgSend(v11, "getMessageTag");

  objc_msgSend(v5, "getEntry");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "getAdditionalText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isEqualToString:", CFSTR("TCUserCancelled")))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 3072, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      goto LABEL_16;
  }
  v16 = (void *)MEMORY[0x24BDD1540];
  v12 = (int)v12;
  if (v14)
  {
    v23 = *MEMORY[0x24BDD0FD8];
    v24[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    goto LABEL_14;
  }
  v17 = 0;
LABEL_13:
  v18 = 1;
LABEL_14:
  objc_msgSend(v16, "tsu_errorWithDomain:code:alertTitle:alertMessage:userInfo:", v6, v12, v8, v14, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v18 & 1) == 0)

LABEL_16:
  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_entry, 0);
}

@end
