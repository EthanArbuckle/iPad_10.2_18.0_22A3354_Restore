@implementation VFXWeakPointer

- (id)copyWeakRef
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend_weakRef(self, a2, v2, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)weakRef
{
  return objc_loadWeakRetained(&self->weakRef);
}

- (void)setWeakRef:(id)a3
{
  objc_storeWeak(&self->weakRef, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->weakRef);
}

@end
