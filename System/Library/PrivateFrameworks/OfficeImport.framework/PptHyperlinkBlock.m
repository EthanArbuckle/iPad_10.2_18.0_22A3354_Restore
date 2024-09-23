@implementation PptHyperlinkBlock

- (void)setInteractiveInfoContainerHolder:(id)a3
{
  objc_storeStrong((id *)&self->mInteractiveInfoContainerHolder, a3);
}

- (void)setTxInteractiveInfoAtomHolder:(id)a3
{
  objc_storeStrong((id *)&self->mTxInteractiveInfoAtomHolder, a3);
}

- (PptTxInteracInfoAtom)txtInteractiveInfoAtom
{
  ESDObject *mTxInteractiveInfoAtomHolder;
  EshObject *v3;
  PptTxInteracInfoAtom *v4;
  PptTxInteracInfoAtom *v5;
  _DWORD *exception;

  mTxInteractiveInfoAtomHolder = self->mTxInteractiveInfoAtomHolder;
  if (!mTxInteractiveInfoAtomHolder
    || (v3 = -[ESDObject eshObject](mTxInteractiveInfoAtomHolder, "eshObject")) == 0
  {
    exception = __cxa_allocate_exception(4uLL);
    *exception = 1000;
  }
  return v5;
}

- (id)interactiveInfoContainerHolder
{
  return self->mInteractiveInfoContainerHolder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTxInteractiveInfoAtomHolder, 0);
  objc_storeStrong((id *)&self->mInteractiveInfoContainerHolder, 0);
}

@end
