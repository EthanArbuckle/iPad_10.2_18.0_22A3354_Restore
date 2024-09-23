@implementation PHAsset(PhotosFaceLayout)

- (id)pfl_modificationDate
{
  void *v2;

  objc_msgSend(a1, "modificationDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(a1, "creationDate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v2;
}

@end
