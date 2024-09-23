@implementation PUPeopleAlbumGadget

- (PUPeopleAlbumGadget)initWithCollection:(id)a3 albumGadgetDelegate:(id)a4
{
  PUPeopleAlbumGadget *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUPeopleAlbumGadget;
  v4 = -[PUAlbumGadget initWithCollection:albumGadgetDelegate:](&v8, sel_initWithCollection_albumGadgetDelegate_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel__peopleAlbumChanged_, *MEMORY[0x1E0D7C5A8], 0);

    objc_msgSend(MEMORY[0x1E0D7B668], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPeopleAlbumGadget setAlbumProvider:](v4, "setAlbumProvider:", v6);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PUPeopleAlbumGadget;
  -[PUPeopleAlbumGadget dealloc](&v4, sel_dealloc);
}

- (id)title
{
  void *v2;
  void *v3;
  void *v4;

  -[PUAlbumGadget collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "px_peoplePetsHomeVisibility");
  PXLocalizedStringForPeoplePetsHomeTitle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)actionManager
{
  return 0;
}

- (void)reconfigure
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUPeopleAlbumGadget;
  -[PUAlbumGadget reconfigure](&v4, sel_reconfigure);
  -[PUPeopleAlbumGadget albumListCellContentView](self, "albumListCellContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPeopleAlbumGadget _configureSubtitleForAlbumListCellContentView:](self, "_configureSubtitleForAlbumListCellContentView:", v3);

}

- (id)albumListCellContentView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUPeopleAlbumGadget;
  -[PUAlbumGadget albumListCellContentView](&v3, sel_albumListCellContentView);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)contentViewWillAppear
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUPeopleAlbumGadget;
  -[PUAlbumGadget contentViewWillAppear](&v4, sel_contentViewWillAppear);
  -[PUPeopleAlbumGadget albumListCellContentView](self, "albumListCellContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPeopleAlbumGadget _configureSubtitleForAlbumListCellContentView:](self, "_configureSubtitleForAlbumListCellContentView:", v3);

}

- (void)_configureSubtitleForAlbumListCellContentView:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  dispatch_block_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id location;

  v4 = a3;
  -[PUPeopleAlbumGadget albumProvider](self, "albumProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isCountAvailable"))
  {
    -[PUPeopleAlbumGadget _setSubtitleForPeopleCount:onAlbumListCellContentView:](self, "_setSubtitleForPeopleCount:onAlbumListCellContentView:", objc_msgSend(v5, "peopleCount"), v4);
  }
  else
  {
    objc_initWeak(&location, self);
    dispatch_get_global_queue(-32768, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __69__PUPeopleAlbumGadget__configureSubtitleForAlbumListCellContentView___block_invoke;
    v8[3] = &unk_1E58AA2E0;
    v9 = v5;
    objc_copyWeak(&v11, &location);
    v10 = v4;
    v7 = dispatch_block_create(DISPATCH_BLOCK_DETACHED, v8);
    dispatch_async(v6, v7);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

}

- (void)_setSubtitleForPeopleCount:(int64_t)a3 onAlbumListCellContentView:(id)a4
{
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  v5 = CFSTR(" ");
  v6 = CFSTR(" ");
  if ((a3 & 0x8000000000000000) == 0)
  {
    PLSharedCountFormatter();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringFromNumber:", v8);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v9, "setSubtitle:animated:", v5, 1);

}

- (PXPeopleAlbumProvider)albumProvider
{
  return self->_albumProvider;
}

- (void)setAlbumProvider:(id)a3
{
  objc_storeStrong((id *)&self->_albumProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_albumProvider, 0);
}

void __69__PUPeopleAlbumGadget__configureSubtitleForAlbumListCellContentView___block_invoke(id *a1)
{
  void *v2;
  id v3;
  id v4[2];

  v2 = (void *)objc_msgSend(a1[4], "peopleCount");
  objc_copyWeak(v4, a1 + 6);
  v4[1] = v2;
  v3 = a1[5];
  px_dispatch_on_main_queue();

  objc_destroyWeak(v4);
}

void __69__PUPeopleAlbumGadget__configureSubtitleForAlbumListCellContentView___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_setSubtitleForPeopleCount:onAlbumListCellContentView:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

@end
