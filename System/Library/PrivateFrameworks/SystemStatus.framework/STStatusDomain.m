@implementation STStatusDomain

- (void)observeData:(id)a3 forDomain:(unint64_t)a4 withChangeContext:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a5;
  if (!-[STStatusDomain isInvalidated](self, "isInvalidated")
    && objc_msgSend((id)objc_opt_class(), "statusDomainName") == a4)
  {
    if (self)
    {
      v9 = self->_dataChangedBlock;
      v10 = v9;
      if (v9)
        (*((void (**)(id, id))v9 + 2))(v9, v13);
      v11 = self->_dataChangedWithContextBlock;
      if (v11)
      {
        v12 = v11;
        (*((void (**)(id, id, id))v11 + 2))(v11, v13, v8);

      }
    }
    else
    {
      v10 = 0;
    }

  }
}

- (STStatusDomainData)data
{
  void *v3;
  void *v4;

  if (-[STStatusDomain isInvalidated](self, "isInvalidated"))
  {
    v3 = 0;
  }
  else
  {
    -[STStatusDomain serverHandle](self, "serverHandle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataForDomain:", objc_msgSend((id)objc_opt_class(), "statusDomainName"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (STStatusDomainData *)v3;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (STStatusDomainServerHandle)serverHandle
{
  return self->_serverHandle;
}

- (STStatusDomain)init
{
  void *v3;
  STStatusDomain *v4;

  +[STStatusDomainXPCServerHandle sharedMachServiceServerHandle](STStatusDomainXPCServerHandle, "sharedMachServiceServerHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[STStatusDomain initWithServerHandle:](self, "initWithServerHandle:", v3);

  return v4;
}

- (STStatusDomain)initWithServerHandle:(id)a3
{
  id v5;
  STStatusDomain *v6;
  STStatusDomain *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STStatusDomain;
  v6 = -[STStatusDomain init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serverHandle, a3);
    objc_msgSend(v5, "registerClient:forDomain:", v7, objc_msgSend((id)objc_opt_class(), "statusDomainName"));
  }

  return v7;
}

- (void)dealloc
{
  NSObject *v3;
  unint64_t v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!-[STStatusDomain isInvalidated](self, "isInvalidated"))
  {
    STSystemStatusLogObservation();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      v4 = objc_msgSend((id)objc_opt_class(), "statusDomainName");
      STSystemStatusDescriptionForDomain(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v8 = v5;
      _os_log_fault_impl(&dword_1D12C7000, v3, OS_LOG_TYPE_FAULT, "SYSTEMSTATUS CLIENT ERROR: %{public}@ domain was deallocated without being invalidated", buf, 0xCu);

    }
  }
  v6.receiver = self;
  v6.super_class = (Class)STStatusDomain;
  -[STStatusDomain dealloc](&v6, sel_dealloc);
}

- (void)invalidate
{
  NSObject *v3;
  unint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (-[STStatusDomain isInvalidated](self, "isInvalidated"))
  {
    STSystemStatusLogObservation();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      v4 = objc_msgSend((id)objc_opt_class(), "statusDomainName");
      STSystemStatusDescriptionForDomain(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v8 = v5;
      _os_log_fault_impl(&dword_1D12C7000, v3, OS_LOG_TYPE_FAULT, "Attempted to invalidate %{public}@ domain which was already invalidated", buf, 0xCu);

    }
  }
  else
  {
    if (self)
      self->_invalidated = 1;
    -[STStatusDomain serverHandle](self, "serverHandle");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeClient:forDomain:", self, objc_msgSend((id)objc_opt_class(), "statusDomainName"));

  }
}

- (void)observeDataWithBlock:(id)a3
{
  char *v4;
  char *v5;
  char *v6;

  v4 = (char *)a3;
  v5 = v4;
  if (self && self->_dataChangedBlock != v4)
  {
    v6 = v4;
    objc_setProperty_nonatomic_copy(self, v4, v4, 16);
    v5 = v6;
  }

}

- (void)observeData:(id)a3
{
  char *v4;
  char *v5;
  char *v6;

  v4 = (char *)a3;
  v5 = v4;
  if (self && self->_dataChangedWithContextBlock != v4)
  {
    v6 = v4;
    objc_setProperty_nonatomic_copy(self, v4, v4, 24);
    v5 = v6;
  }

}

+ (unint64_t)statusDomainName
{
  return -1;
}

- (NSArray)preferredLocalizations
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredLocalizations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverHandle, 0);
  objc_storeStrong(&self->_dataChangedWithContextBlock, 0);
  objc_storeStrong(&self->_dataChangedBlock, 0);
}

@end
