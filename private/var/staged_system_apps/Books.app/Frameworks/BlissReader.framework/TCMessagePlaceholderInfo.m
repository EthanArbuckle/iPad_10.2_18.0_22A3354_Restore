@implementation TCMessagePlaceholderInfo

- (TCMessagePlaceholderInfo)init
{
  TCMessagePlaceholderInfo *v2;
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TCMessagePlaceholderInfo;
  v2 = -[TCMessagePlaceholderInfo init](&v5, "init");
  if (v2)
  {
    v3 = objc_alloc((Class)NSNumber);
    ++dword_543360;
    v2->mKey = objc_msgSend(v3, "initWithInt:");
    v2->mInUse = 0;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TCMessagePlaceholderInfo;
  -[TCMessagePlaceholderInfo dealloc](&v3, "dealloc");
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

@end
