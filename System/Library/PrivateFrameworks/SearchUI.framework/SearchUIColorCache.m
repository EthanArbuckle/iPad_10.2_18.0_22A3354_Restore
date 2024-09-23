@implementation SearchUIColorCache

- (SearchUIColorCache)init
{
  SearchUIColorCache *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SearchUIColorCache;
  v2 = -[TLKAsyncCache init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_clear, *MEMORY[0x1E0DC4508], 0);

  }
  return v2;
}

- (void)computeObjectForKey:(id)a3 completionHandler:(id)a4
{
  +[SearchUIBackgroundColorUtilities computeResolvedColoringForColorRequest:completionHandler:](SearchUIBackgroundColorUtilities, "computeResolvedColoringForColorRequest:completionHandler:", a3, a4);
}

@end
