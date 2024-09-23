@implementation TCMessagePlaceholderInfo

- (TCMessagePlaceholderInfo)init
{
  TCMessagePlaceholderInfo *v2;
  id v3;
  uint64_t v4;
  id mKey;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TCMessagePlaceholderInfo;
  v2 = -[TCMessagePlaceholderInfo init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BDD16E0]);
    ++-[TCMessagePlaceholderInfo init]::sKey;
    v4 = objc_msgSend(v3, "initWithInt:");
    mKey = v2->mKey;
    v2->mKey = (id)v4;

    v2->mInUse = 0;
  }
  return v2;
}

- (id)key
{
  return self->mKey;
}

- (BOOL)isInUse
{
  return self->mInUse;
}

- (void)setInUse:(BOOL)a3
{
  self->mInUse = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->mKey, 0);
}

@end
