@implementation CADisplayLink(PhotosUICore)

+ (id)px_displayLinkWithWeakTarget:()PhotosUICore selector:
{
  id v5;
  _PXDisplayLinkWeakReference *v6;
  void *v7;

  v5 = a3;
  v6 = -[_PXDisplayLinkWeakReference initWithObject:selector:]([_PXDisplayLinkWeakReference alloc], "initWithObject:selector:", v5, a4);

  objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", v6, sel_handleDisplayLink_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
