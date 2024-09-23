@implementation WFChooseFromListDataStore

- (WFChooseFromListDataStore)init
{
  WFChooseFromListDataStore *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *contentItems;
  uint64_t v5;
  NSXPCListener *listener;
  uint64_t v7;
  NSXPCListenerEndpoint *endpoint;
  WFChooseFromListDataStore *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WFChooseFromListDataStore;
  v2 = -[WFChooseFromListDataStore init](&v11, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    contentItems = v2->_contentItems;
    v2->_contentItems = v3;

    v2->_contentItemsLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
    v5 = objc_claimAutoreleasedReturnValue();
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v5;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_listener, "resume");
    -[NSXPCListener endpoint](v2->_listener, "endpoint");
    v7 = objc_claimAutoreleasedReturnValue();
    endpoint = v2->_endpoint;
    v2->_endpoint = (NSXPCListenerEndpoint *)v7;

    v9 = v2;
  }

  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0CB3B50];
  v6 = a4;
  objc_msgSend(v5, "interfaceWithProtocol:", &unk_1EF727AD8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExportedInterface:", v7);

  objc_msgSend(v6, "setExportedObject:", self);
  objc_msgSend(v6, "resume");

  return 1;
}

- (NSMutableDictionary)contentItems
{
  os_unfair_lock_s *p_contentItemsLock;
  NSMutableDictionary *v4;

  p_contentItemsLock = &self->_contentItemsLock;
  os_unfair_lock_lock(&self->_contentItemsLock);
  v4 = self->_contentItems;
  os_unfair_lock_unlock(p_contentItemsLock);
  return v4;
}

- (void)addContentItem:(id)a3 withIdentifier:(id)a4
{
  os_unfair_lock_s *p_contentItemsLock;
  id v7;
  id v8;

  p_contentItemsLock = &self->_contentItemsLock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_contentItemsLock);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_contentItems, "setObject:forKeyedSubscript:", v8, v7);

  os_unfair_lock_unlock(p_contentItemsLock);
}

- (void)removeContentItemWithIdentifier:(id)a3
{
  os_unfair_lock_s *p_contentItemsLock;
  id v5;

  p_contentItemsLock = &self->_contentItemsLock;
  v5 = a3;
  os_unfair_lock_lock(p_contentItemsLock);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_contentItems, "setObject:forKeyedSubscript:", 0, v5);

  os_unfair_lock_unlock(p_contentItemsLock);
}

- (void)loadSubtitleWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a4;
  v7 = a3;
  -[WFChooseFromListDataStore contentItems](self, "contentItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __67__WFChooseFromListDataStore_loadSubtitleWithIdentifier_completion___block_invoke;
    v11[3] = &unk_1E7AF3F28;
    v10 = v6;
    v13 = v10;
    v12 = v9;
    if ((objc_msgSend(v12, "getListSubtitle:", v11) & 1) == 0)
      (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);

  }
  else
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

- (void)loadAltTextWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[WFChooseFromListDataStore contentItems](self, "contentItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __66__WFChooseFromListDataStore_loadAltTextWithIdentifier_completion___block_invoke;
    v11[3] = &unk_1E7AF3F50;
    v10 = v6;
    v12 = v10;
    if ((objc_msgSend(v9, "getListAltText:", v11) & 1) == 0)
      (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);

  }
  else
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

- (void)loadImageWithIdentifier:(id)a3 size:(CGSize)a4 completion:(id)a5
{
  double height;
  double width;
  id v9;
  void *v10;
  void *v11;
  id v12;

  height = a4.height;
  width = a4.width;
  v12 = a5;
  v9 = a3;
  -[WFChooseFromListDataStore contentItems](self, "contentItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11 || (objc_msgSend(v11, "getListThumbnail:forSize:", v12, width, height) & 1) == 0)
    (*((void (**)(id, _QWORD, _QWORD))v12 + 2))(v12, 0, 0);

}

- (void)hasAltTextForIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void (**v9)(id, _QWORD);

  v9 = (void (**)(id, _QWORD))a4;
  v6 = a3;
  -[WFChooseFromListDataStore contentItems](self, "contentItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    v9[2](v9, 0);
  v9[2](v9, objc_msgSend(v8, "getListAltText:", 0));

}

- (void)hasImageForIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void (**v9)(id, _QWORD);

  v9 = (void (**)(id, _QWORD))a4;
  v6 = a3;
  -[WFChooseFromListDataStore contentItems](self, "contentItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    v9[2](v9, 0);
  v9[2](v9, objc_msgSend(v8, "getListThumbnail:forSize:", 0, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8)));

}

- (void)hasSubtitleForIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void (**v9)(id, _QWORD);

  v9 = (void (**)(id, _QWORD))a4;
  v6 = a3;
  -[WFChooseFromListDataStore contentItems](self, "contentItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    v9[2](v9, 0);
  v9[2](v9, objc_msgSend(v8, "getListSubtitle:", 0));

}

- (NSXPCListenerEndpoint)endpoint
{
  return self->_endpoint;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setContentItems:(id)a3
{
  objc_storeStrong((id *)&self->_contentItems, a3);
}

- (os_unfair_lock_s)contentItemsLock
{
  return self->_contentItemsLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentItems, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

uint64_t __66__WFChooseFromListDataStore_loadAltTextWithIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __67__WFChooseFromListDataStore_loadSubtitleWithIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    (*(void (**)(_QWORD))(v2 + 16))(*(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "localizedTypeDescription");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

@end
