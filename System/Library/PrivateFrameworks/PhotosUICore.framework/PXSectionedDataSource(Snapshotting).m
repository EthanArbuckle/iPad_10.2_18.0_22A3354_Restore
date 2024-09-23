@implementation PXSectionedDataSource(Snapshotting)

- (id)objectIdentifierForSpriteTag:()Snapshotting
{
  void *v2;
  _OWORD v4[2];
  __int128 v5;
  __int128 v6;

  v5 = 0u;
  v6 = 0u;
  objc_msgSend(a1, "identifier");
  PXGSectionedSpriteTagGetIndexPath();
  if (objc_msgSend(a1, "identifier"))
  {
    v2 = 0;
  }
  else
  {
    v4[0] = v5;
    v4[1] = v6;
    objc_msgSend(a1, "objectIDAtIndexPath:", v4);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

@end
