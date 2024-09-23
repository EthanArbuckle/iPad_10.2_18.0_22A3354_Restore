@implementation SBHIconImageCacheCancellation

- (SBHIconImageCacheCancellation)init
{
  SBHIconImageCacheCancellation *v2;
  NSUUID *v3;
  NSUUID *identifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBHIconImageCacheCancellation;
  v2 = -[SBHIconImageCacheCancellation init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSUUID *)objc_alloc_init(MEMORY[0x1E0CB3A28]);
    identifier = v2->_identifier;
    v2->_identifier = v3;

  }
  return v2;
}

- (void)cancel
{
  if (self)
    self->_cancelled = 1;
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
  SBHIconImageCacheCancellation *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__SBHIconImageCacheCancellation_appendDescriptionToStream___block_invoke;
  v6[3] = &unk_1E8D84EF0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "appendProem:block:", self, v6);

}

id __59__SBHIconImageCacheCancellation_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("identifier"));

  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    v6 = *(_BYTE *)(v5 + 8) & 1;
  else
    v6 = 0;
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", v6, CFSTR("cancelled"));
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
