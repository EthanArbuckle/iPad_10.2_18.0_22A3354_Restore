@implementation PFMediaItemMetadataLoader

- (PFMediaItemMetadataLoader)init
{
  PFMediaItemMetadataLoader *v2;
  MTMediaItemMetadataLoader *v3;
  MTMediaItemMetadataLoader *loader;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PFMediaItemMetadataLoader;
  v2 = -[PFMediaItemMetadataLoader init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MTMediaItemMetadataLoader);
    loader = v2->_loader;
    v2->_loader = v3;

  }
  return v2;
}

- (void)keyIdentifiersFromAsset:(id)a3 completion:(id)a4
{
  id v6;
  MTMediaItemMetadataLoader *loader;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  loader = self->_loader;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__PFMediaItemMetadataLoader_keyIdentifiersFromAsset_completion___block_invoke;
  v9[3] = &unk_1E54D1118;
  v10 = v6;
  v8 = v6;
  -[MTMediaItemMetadataLoader keyIdentifiersFrom:completion:](loader, "keyIdentifiersFrom:completion:", a3, v9);

}

uint64_t __64__PFMediaItemMetadataLoader_keyIdentifiersFromAsset_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loader, 0);
}

@end
