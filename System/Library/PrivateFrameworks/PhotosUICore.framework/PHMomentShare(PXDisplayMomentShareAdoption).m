@implementation PHMomentShare(PXDisplayMomentShareAdoption)

- (uint64_t)px_momentShareType
{
  int v1;
  void *v3;
  void *v4;

  v1 = objc_msgSend(a1, "status");
  if ((v1 - 2) < 2)
    return 1;
  if (!v1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PHMomentShare(PXDisplayMomentShareAdoption) px_momentShareType]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PHAsset+PXDisplayAssetAdoption.m"), 1498, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  return 0;
}

@end
