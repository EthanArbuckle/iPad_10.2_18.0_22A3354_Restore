@implementation SearchUILocalAudioCache

- (void)computeObjectForKey:(id)a3 completionHandler:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x1E0CC2408];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "defaultMediaLibrary");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "entityWithSpotlightIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  (*((void (**)(id, void *))a4 + 2))(v7, v9);
}

@end
