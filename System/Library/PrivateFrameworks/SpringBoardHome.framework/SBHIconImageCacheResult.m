@implementation SBHIconImageCacheResult

- (SBHIconImageCacheResult)initWithRequestIdentifier:(id)a3
{
  id v4;
  SBHIconImageCacheResult *v5;
  uint64_t v6;
  NSUUID *requestIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBHIconImageCacheResult;
  v5 = -[SBHIconImageCacheResult init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    requestIdentifier = v5->_requestIdentifier;
    v5->_requestIdentifier = (NSUUID *)v6;

    v5->_startTime = mach_continuous_time();
  }

  return v5;
}

- (SBHIconImageCacheResult)init
{
  id v3;
  SBHIconImageCacheResult *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
  v4 = -[SBHIconImageCacheResult initWithRequestIdentifier:](self, "initWithRequestIdentifier:", v3);

  return v4;
}

- (void)calculateElapsedTime
{
  double v3;

  mach_continuous_time();
  BSTimeDifferenceFromMachTimeToMachTime();
  self->_elapsedTime = v3;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (id)succinctDescription
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D01750];
  objc_msgSend(MEMORY[0x1E0D01758], "succinctStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptionForRootObject:withStyle:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  SBHIconImageCacheResult *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__SBHIconImageCacheResult_appendDescriptionToStream___block_invoke;
  v6[3] = &unk_1E8D84EF0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "appendProem:block:", self, v6);

}

id __53__SBHIconImageCacheResult_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "requestIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("requestIdentifier"));

  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isFinished"), CFSTR("isFinished"));
  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "elapsedTime");
  return (id)objc_msgSend(v6, "appendFloat:withName:", CFSTR("elapsedTime"));
}

- (NSUUID)requestIdentifier
{
  return self->_requestIdentifier;
}

- (double)elapsedTime
{
  return self->_elapsedTime;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
}

@end
