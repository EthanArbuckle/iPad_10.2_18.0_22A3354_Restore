@implementation STStatusDomainPublisher

- (STStatusDomainPublisher)init
{
  void *v3;
  STStatusDomainPublisher *v4;

  +[STStatusDomainPublisherXPCServerHandle sharedMachServiceServerHandle](STStatusDomainPublisherXPCServerHandle, "sharedMachServiceServerHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[STStatusDomainPublisher initWithServerHandle:](self, "initWithServerHandle:", v3);

  return v4;
}

- (STStatusDomainPublisher)initWithServerHandle:(id)a3
{
  id v5;
  STStatusDomainPublisher *v6;
  STStatusDomainPublisher *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STStatusDomainPublisher;
  v6 = -[STStatusDomainPublisher init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serverHandle, a3);
    v8 = objc_msgSend((id)objc_opt_class(), "statusDomainName");
    objc_msgSend((id)objc_opt_class(), "emptyData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "registerPublisherClient:forDomain:fallbackData:", v7, v8, v9);

  }
  return v7;
}

- (void)updateVolatileDataWithBlock:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__STStatusDomainPublisher_updateVolatileDataWithBlock_completion___block_invoke;
  v8[3] = &unk_1E91E55C0;
  v9 = v6;
  v7 = v6;
  -[STStatusDomainPublisher _updateVolatileDataWithBlock:completion:]((id *)&self->super.isa, v8, a4);

}

- (void)_updateVolatileDataWithBlock:(void *)a3 completion:
{
  id v5;
  void (**v6)(_QWORD);
  char v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  unint64_t v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = objc_msgSend(a1, "isInvalidated");
    if (!v5 || (v7 & 1) != 0)
    {
      if (objc_msgSend(a1, "isInvalidated"))
      {
        STSystemStatusLogPublishing();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        {
          v11 = objc_msgSend((id)objc_opt_class(), "statusDomainName");
          STSystemStatusDescriptionForDomain(v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v16 = v12;
          _os_log_fault_impl(&dword_1D12C7000, v10, OS_LOG_TYPE_FAULT, "%{public}@ publisher attempted to update volatile data after being invalidated", buf, 0xCu);

        }
      }
      if (v6)
        v6[2](v6);
    }
    else
    {
      v8 = a1[2];
      v9 = objc_msgSend((id)objc_opt_class(), "statusDomainName");
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __67__STStatusDomainPublisher__updateVolatileDataWithBlock_completion___block_invoke;
      v13[3] = &unk_1E91E55E8;
      v13[4] = a1;
      v14 = v5;
      objc_msgSend(v8, "updateVolatileDataForPublisherClient:domain:usingDiffProvider:completion:", a1, v9, v13, v6);

    }
  }

}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)updateVolatileData:(id)a3 completion:(id)a4
{
  -[STStatusDomainPublisher _updateVolatileDataWithBlock:completion:]((id *)&self->super.isa, a3, a4);
}

id __67__STStatusDomainPublisher__updateVolatileDataWithBlock_completion___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a2;
  v6 = (void *)objc_msgSend(v5, "mutableCopyWithZone:", 0);
  objc_msgSend((id)objc_opt_class(), "emptyChangeContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopyWithZone:", 0);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (a3)
    *a3 = (id)objc_msgSend(v8, "copyWithZone:", 0);
  objc_msgSend(v6, "diffFromData:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (STStatusDomainDataChangeContext)emptyChangeContext
{
  return objc_alloc_init(STStatusDomainDataChangeContext);
}

uint64_t __66__STStatusDomainPublisher_updateVolatileDataWithBlock_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __55__STStatusDomainPublisher_updateVolatileDataWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updateVolatileDataWithBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__STStatusDomainPublisher_updateVolatileDataWithBlock___block_invoke;
  v6[3] = &unk_1E91E55C0;
  v7 = v4;
  v5 = v4;
  -[STStatusDomainPublisher _updateVolatileDataWithBlock:completion:]((id *)&self->super.isa, v6, 0);

}

id __59__STStatusDomainPublisher__updateDataWithBlock_completion___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a2;
  v6 = (void *)objc_msgSend(v5, "mutableCopyWithZone:", 0);
  objc_msgSend((id)objc_opt_class(), "emptyChangeContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopyWithZone:", 0);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (a3)
    *a3 = (id)objc_msgSend(v8, "copyWithZone:", 0);
  objc_msgSend(v6, "diffFromData:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __47__STStatusDomainPublisher_updateDataWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updateDataWithBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__STStatusDomainPublisher_updateDataWithBlock___block_invoke;
  v6[3] = &unk_1E91E55C0;
  v7 = v4;
  v5 = v4;
  -[STStatusDomainPublisher _updateDataWithBlock:completion:]((id *)&self->super.isa, v6, 0);

}

- (void)_updateDataWithBlock:(void *)a3 completion:
{
  id v5;
  void (**v6)(_QWORD);
  char v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  unint64_t v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = objc_msgSend(a1, "isInvalidated");
    if (!v5 || (v7 & 1) != 0)
    {
      if (objc_msgSend(a1, "isInvalidated"))
      {
        STSystemStatusLogPublishing();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        {
          v11 = objc_msgSend((id)objc_opt_class(), "statusDomainName");
          STSystemStatusDescriptionForDomain(v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v16 = v12;
          _os_log_fault_impl(&dword_1D12C7000, v10, OS_LOG_TYPE_FAULT, "%{public}@ publisher attempted to update data after being invalidated", buf, 0xCu);

        }
      }
      if (v6)
        v6[2](v6);
    }
    else
    {
      v8 = a1[2];
      v9 = objc_msgSend((id)objc_opt_class(), "statusDomainName");
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __59__STStatusDomainPublisher__updateDataWithBlock_completion___block_invoke;
      v13[3] = &unk_1E91E55E8;
      v13[4] = a1;
      v14 = v5;
      objc_msgSend(v8, "updateDataForPublisherClient:domain:usingDiffProvider:completion:", a1, v9, v13, v6);

    }
  }

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
  if (!-[STStatusDomainPublisher isInvalidated](self, "isInvalidated"))
  {
    STSystemStatusLogPublishing();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      v4 = objc_msgSend((id)objc_opt_class(), "statusDomainName");
      STSystemStatusDescriptionForDomain(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v8 = v5;
      _os_log_fault_impl(&dword_1D12C7000, v3, OS_LOG_TYPE_FAULT, "SYSTEMSTATUS CLIENT ERROR: %{public}@ publisher was deallocated without being invalidated", buf, 0xCu);

    }
  }
  v6.receiver = self;
  v6.super_class = (Class)STStatusDomainPublisher;
  -[STStatusDomainPublisher dealloc](&v6, sel_dealloc);
}

- (STStatusDomainData)data
{
  void *v3;
  STStatusDomainPublisherServerHandle *serverHandle;
  STStatusDomainPublisherServerHandle *v5;

  if (-[STStatusDomainPublisher isInvalidated](self, "isInvalidated"))
  {
    v3 = 0;
  }
  else
  {
    if (self)
      serverHandle = self->_serverHandle;
    else
      serverHandle = 0;
    v5 = serverHandle;
    -[STStatusDomainPublisherServerHandle publishedDataForDomain:](v5, "publishedDataForDomain:", objc_msgSend((id)objc_opt_class(), "statusDomainName"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (STStatusDomainData *)v3;
}

- (void)invalidate
{
  NSObject *v3;
  STStatusDomainPublisherServerHandle *serverHandle;
  unint64_t v5;
  void *v6;
  STStatusDomainPublisherServerHandle *v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (-[STStatusDomainPublisher isInvalidated](self, "isInvalidated"))
  {
    STSystemStatusLogPublishing();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      v5 = objc_msgSend((id)objc_opt_class(), "statusDomainName");
      STSystemStatusDescriptionForDomain(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v9 = v6;
      _os_log_fault_impl(&dword_1D12C7000, v3, OS_LOG_TYPE_FAULT, "Attempted to invalidate %{public}@ publisher which was already invalidated", buf, 0xCu);

    }
  }
  else
  {
    if (self)
    {
      self->_invalidated = 1;
      serverHandle = self->_serverHandle;
    }
    else
    {
      serverHandle = 0;
    }
    v7 = serverHandle;
    -[STStatusDomainPublisherServerHandle removePublisherClient:forDomain:](v7, "removePublisherClient:forDomain:", self, objc_msgSend((id)objc_opt_class(), "statusDomainName"));

  }
}

- (void)setData:(id)a3
{
  -[STStatusDomainPublisher _setData:withChangeContext:completion:]((id *)&self->super.isa, a3, 0, 0);
}

- (void)_setData:(void *)a3 withChangeContext:(void *)a4 completion:
{
  id v7;
  id v8;
  void (**v9)(_QWORD);
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  unint64_t v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    if ((objc_msgSend(a1, "isInvalidated") & 1) != 0)
    {
      STSystemStatusLogPublishing();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        v14 = objc_msgSend((id)objc_opt_class(), "statusDomainName");
        STSystemStatusDescriptionForDomain(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543362;
        v17 = v15;
        _os_log_fault_impl(&dword_1D12C7000, v10, OS_LOG_TYPE_FAULT, "%{public}@ publisher attempted to set data after being invalidated", (uint8_t *)&v16, 0xCu);

      }
      if (v9)
        v9[2](v9);
    }
    else
    {
      -[STStatusDomainPublisher _validatedChangeContext:]((uint64_t)a1, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = a1[2];
      v13 = (void *)objc_msgSend(v7, "copyWithZone:", 0);
      objc_msgSend(v12, "publishData:forPublisherClient:domain:withChangeContext:completion:", v13, a1, objc_msgSend((id)objc_opt_class(), "statusDomainName"), v11, v9);

    }
  }

}

- (void)setData:(id)a3 completion:(id)a4
{
  -[STStatusDomainPublisher _setData:withChangeContext:completion:]((id *)&self->super.isa, a3, 0, a4);
}

- (void)setData:(id)a3 withContext:(id)a4 completion:(id)a5
{
  -[STStatusDomainPublisher _setData:withChangeContext:completion:]((id *)&self->super.isa, a3, a4, a5);
}

- (void)updateDataWithBlock:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__STStatusDomainPublisher_updateDataWithBlock_completion___block_invoke;
  v8[3] = &unk_1E91E55C0;
  v9 = v6;
  v7 = v6;
  -[STStatusDomainPublisher _updateDataWithBlock:completion:]((id *)&self->super.isa, v8, a4);

}

uint64_t __58__STStatusDomainPublisher_updateDataWithBlock_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updateData:(id)a3 completion:(id)a4
{
  -[STStatusDomainPublisher _updateDataWithBlock:completion:]((id *)&self->super.isa, a3, a4);
}

- (STStatusDomainData)volatileData
{
  void *v3;
  STStatusDomainPublisherServerHandle *serverHandle;
  STStatusDomainPublisherServerHandle *v5;

  if (-[STStatusDomainPublisher isInvalidated](self, "isInvalidated"))
  {
    v3 = 0;
  }
  else
  {
    if (self)
      serverHandle = self->_serverHandle;
    else
      serverHandle = 0;
    v5 = serverHandle;
    -[STStatusDomainPublisherServerHandle publishedVolatileDataForDomain:](v5, "publishedVolatileDataForDomain:", objc_msgSend((id)objc_opt_class(), "statusDomainName"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (STStatusDomainData *)v3;
}

- (void)setVolatileData:(id)a3
{
  -[STStatusDomainPublisher _setVolatileData:withChangeContext:completion:]((id *)&self->super.isa, a3, 0, 0);
}

- (void)_setVolatileData:(void *)a3 withChangeContext:(void *)a4 completion:
{
  id v7;
  id v8;
  void (**v9)(_QWORD);
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  unint64_t v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    if ((objc_msgSend(a1, "isInvalidated") & 1) != 0)
    {
      STSystemStatusLogPublishing();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        v14 = objc_msgSend((id)objc_opt_class(), "statusDomainName");
        STSystemStatusDescriptionForDomain(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543362;
        v17 = v15;
        _os_log_fault_impl(&dword_1D12C7000, v10, OS_LOG_TYPE_FAULT, "%{public}@ publisher attempted to set volatile data after being invalidated", (uint8_t *)&v16, 0xCu);

      }
      if (v9)
        v9[2](v9);
    }
    else
    {
      -[STStatusDomainPublisher _validatedChangeContext:]((uint64_t)a1, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = a1[2];
      v13 = (void *)objc_msgSend(v7, "copyWithZone:", 0);
      objc_msgSend(v12, "publishVolatileData:forPublisherClient:domain:withChangeContext:completion:", v13, a1, objc_msgSend((id)objc_opt_class(), "statusDomainName"), v11, v9);

    }
  }

}

- (void)setVolatileData:(id)a3 completion:(id)a4
{
  -[STStatusDomainPublisher _setVolatileData:withChangeContext:completion:]((id *)&self->super.isa, a3, 0, a4);
}

- (void)setVolatileData:(id)a3 withContext:(id)a4 completion:(id)a5
{
  -[STStatusDomainPublisher _setVolatileData:withChangeContext:completion:]((id *)&self->super.isa, a3, a4, a5);
}

+ (unint64_t)statusDomainName
{
  return -1;
}

+ (STStatusDomainData)emptyData
{
  return 0;
}

- (id)_validatedChangeContext:(uint64_t)a1
{
  id v2;
  id v3;
  void *v4;
  void *v5;

  v2 = a2;
  if (v2)
  {
    objc_msgSend((id)objc_opt_class(), "emptyChangeContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v3 = v2;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = (void *)objc_msgSend(v4, "mutableCopyWithZone:", 0);
        objc_msgSend(v5, "setUserInitiated:", objc_msgSend(v2, "isUserInitiated"));
        v3 = (id)objc_msgSend(v5, "copyWithZone:", 0);

      }
      else
      {
        v3 = 0;
      }
    }

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverHandle, 0);
}

@end
