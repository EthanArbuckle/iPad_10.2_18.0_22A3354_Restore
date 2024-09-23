@implementation _PXOverriddenAppleMusicStatusProvider

- (_PXOverriddenAppleMusicStatusProvider)initWithAppleMusicStatusProvider:(id)a3 overrides:(id)a4
{
  id v7;
  id v8;
  _PXOverriddenAppleMusicStatusProvider *v9;
  _PXOverriddenAppleMusicStatusProvider *v10;
  uint64_t v11;
  NSDictionary *overrides;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_PXOverriddenAppleMusicStatusProvider;
  v9 = -[_PXOverriddenAppleMusicStatusProvider init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_subProvider, a3);
    v11 = objc_msgSend(v8, "copy");
    overrides = v10->_overrides;
    v10->_overrides = (NSDictionary *)v11;

  }
  return v10;
}

- (_PXOverriddenAppleMusicStatusProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAppleMusicStatusProvider.m"), 50, CFSTR("%s is not available as initializer"), "-[_PXOverriddenAppleMusicStatusProvider init]");

  abort();
}

- (NSError)error
{
  return (NSError *)-[PXAppleMusicStatusProvider error](self->_subProvider, "error");
}

- (PXObservable)observable
{
  return (PXObservable *)-[PXAppleMusicStatusProvider observable](self->_subProvider, "observable");
}

- (void)startGatheringCapabilityStatuses
{
  -[PXAppleMusicStatusProvider startGatheringCapabilityStatuses](self->_subProvider, "startGatheringCapabilityStatuses");
}

- (void)requestStatusForCapability:(int64_t)a3 handler:(id)a4
{
  NSDictionary *overrides;
  void *v7;
  void *v8;
  void (**v9)(id, uint64_t, _QWORD);

  v9 = (void (**)(id, uint64_t, _QWORD))a4;
  overrides = self->_overrides;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](overrides, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9[2](v9, objc_msgSend(v8, "integerValue"), 0);
  else
    -[PXAppleMusicStatusProvider requestStatusForCapability:handler:](self->_subProvider, "requestStatusForCapability:handler:", a3, v9);

}

- (int64_t)statusForCapability:(int64_t)a3
{
  NSDictionary *overrides;
  void *v6;
  void *v7;
  uint64_t v8;
  int64_t v9;

  overrides = self->_overrides;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](overrides, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = objc_msgSend(v7, "integerValue");
  else
    v8 = -[PXAppleMusicStatusProvider statusForCapability:](self->_subProvider, "statusForCapability:", a3);
  v9 = v8;

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subProvider, 0);
  objc_storeStrong((id *)&self->_overrides, 0);
}

@end
