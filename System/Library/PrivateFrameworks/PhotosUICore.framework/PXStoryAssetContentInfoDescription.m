@implementation PXStoryAssetContentInfoDescription

void __PXStoryAssetContentInfoDescription_block_invoke(uint64_t a1, void *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  void *v11;
  void *v12;
  id v13;
  CGRect v14;

  v13 = a2;
  v14.origin.x = a3;
  v14.origin.y = a4;
  v14.size.width = a5;
  v14.size.height = a6;
  if (!CGRectIsNull(v14))
  {
    v11 = *(void **)(a1 + 32);
    PXRectDescription();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendFormat:", CFSTR(", %@=%@"), v13, v12);

  }
}

@end
