@implementation SMMMediaLibrary

+ (void)addTrackWithIdentifier:(int64_t)a3 completion:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  objc_msgSend(MEMORY[0x24BDDC7F0], "defaultMediaLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__SMMMediaLibrary_addTrackWithIdentifier_completion___block_invoke;
  v8[3] = &unk_24DC6AAC8;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "addStoreItem:andAddTracksToCloudLibrary:withCompletion:", a3, 1, v8);

}

uint64_t __53__SMMMediaLibrary_addTrackWithIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)addGlobalPlaylistWithIdentifier:(id)a3 completion:(id)a4
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x24BDDC7F0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "defaultMediaLibrary");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addGlobalPlaylistWithID:andAddToCloudLibrary:completion:", v7, 1, v6);

}

+ (id)predicateForTracksWithAdamIdentifiers:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDDC7A0], "predicateWithProperty:values:", *MEMORY[0x24BDDBCC8], a3);
}

+ (id)identifierForItem:(id)a3
{
  return (id)objc_msgSend(a3, "valueForProperty:", *MEMORY[0x24BDDBCC8]);
}

@end
