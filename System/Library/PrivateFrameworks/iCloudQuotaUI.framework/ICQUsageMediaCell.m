@implementation ICQUsageMediaCell

- (ICQUsageMediaCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8;
  ICQUsageMediaCell *v9;
  ICQUsageMediaCell *v10;
  uint64_t v11;
  MPArtworkCatalog *artworkCatalog;
  MPArtworkCatalog *v13;
  void *v14;
  objc_super v16;

  v8 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ICQUsageMediaCell;
  v9 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v16, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, v8);
  v10 = v9;
  if (v9)
  {
    -[ICQUsageMediaCell setClipsContents:](v9, "setClipsContents:", 1);
    if (initWithStyle_reuseIdentifier_specifier__onceToken != -1)
      dispatch_once(&initWithStyle_reuseIdentifier_specifier__onceToken, &__block_literal_global_8);
    -[ICQUsageMediaCell setLayoutManager:](v10, "setLayoutManager:", initWithStyle_reuseIdentifier_specifier__layoutManager);
    objc_msgSend(v8, "propertyForKey:", CFSTR("ICON_LOADER"));
    v11 = objc_claimAutoreleasedReturnValue();
    artworkCatalog = v10->_artworkCatalog;
    v10->_artworkCatalog = (MPArtworkCatalog *)v11;

    -[MPArtworkCatalog setFittingSize:](v10->_artworkCatalog, "setFittingSize:", 44.0, 44.0);
    v13 = v10->_artworkCatalog;
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "scale");
    -[MPArtworkCatalog setDestinationScale:](v13, "setDestinationScale:");

  }
  return v10;
}

void __61__ICQUsageMediaCell_initWithStyle_reuseIdentifier_specifier___block_invoke()
{
  ICQUsageMediaCellLayoutManager *v0;
  void *v1;

  v0 = objc_alloc_init(ICQUsageMediaCellLayoutManager);
  v1 = (void *)initWithStyle_reuseIdentifier_specifier__layoutManager;
  initWithStyle_reuseIdentifier_specifier__layoutManager = (uint64_t)v0;

}

- (id)getLazyIcon
{
  dispatch_semaphore_t v3;
  MPArtworkCatalog *artworkCatalog;
  NSObject *v5;
  id v6;
  _QWORD v8[4];
  NSObject *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1;
  v15 = __Block_byref_object_dispose__1;
  v16 = 0;
  v3 = dispatch_semaphore_create(0);
  artworkCatalog = self->_artworkCatalog;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __32__ICQUsageMediaCell_getLazyIcon__block_invoke;
  v8[3] = &unk_24E3F4240;
  v10 = &v11;
  v5 = v3;
  v9 = v5;
  -[MPArtworkCatalog requestImageWithCompletionHandler:](artworkCatalog, "requestImageWithCompletionHandler:", v8);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __32__ICQUsageMediaCell_getLazyIcon__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)getLazyIconID
{
  return self->_artworkCatalog;
}

- (id)blankIcon
{
  return objc_alloc_init(MEMORY[0x24BEBD640]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkCatalog, 0);
}

@end
