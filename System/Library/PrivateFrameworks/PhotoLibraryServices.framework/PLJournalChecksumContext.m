@implementation PLJournalChecksumContext

- (PLJournalChecksumContext)init
{
  PLJournalChecksumContext *v2;
  PLJournalChecksumContext *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLJournalChecksumContext;
  v2 = -[PLJournalChecksumContext init](&v5, sel_init);
  v3 = v2;
  if (v2)
    CC_SHA256_Init(&v2->_context);
  return v3;
}

- (void)update:(id)a3
{
  CC_SHA256_CTX *p_context;
  id v4;
  const void *v5;
  CC_LONG v6;

  p_context = &self->_context;
  v4 = objc_retainAutorelease(a3);
  v5 = (const void *)objc_msgSend(v4, "bytes");
  v6 = objc_msgSend(v4, "length");

  CC_SHA256_Update(p_context, v5, v6);
}

- (id)finalizedChecksum
{
  NSString *finalizedChecksum;
  void *v4;
  uint64_t i;
  NSString *v6;
  NSString *v7;
  unsigned __int8 md[32];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  finalizedChecksum = self->_finalizedChecksum;
  if (!finalizedChecksum)
  {
    CC_SHA256_Final(md, &self->_context);
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 64);
    for (i = 0; i != 32; ++i)
      objc_msgSend(v4, "appendFormat:", CFSTR("%02x"), md[i]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v4);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v7 = self->_finalizedChecksum;
    self->_finalizedChecksum = v6;

    finalizedChecksum = self->_finalizedChecksum;
  }
  return finalizedChecksum;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finalizedChecksum, 0);
}

@end
