@implementation MusicMonogramArtworkDataSource

- (MusicMonogramArtworkDataSource)init
{
  MusicMonogramArtworkDataSource *v2;
  NSCache *v3;
  NSCache *cache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MusicMonogramArtworkDataSource;
  v2 = -[MusicMonogramArtworkDataSource init](&v6, "init");
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init((Class)NSCache);
    cache = v2->_cache;
    v2->_cache = v3;

  }
  return v2;
}

+ (MusicMonogramArtworkDataSource)sharedMonogramArtworkDataSource
{
  if (sharedMonogramArtworkDataSource_sMonogramArtworkDataSourceOnceToken != -1)
    dispatch_once(&sharedMonogramArtworkDataSource_sMonogramArtworkDataSourceOnceToken, &__block_literal_global_22);
  return (MusicMonogramArtworkDataSource *)(id)sharedMonogramArtworkDataSource_sSharedMonogramArtworkDataSource;
}

void __65__MusicMonogramArtworkDataSource_sharedMonogramArtworkDataSource__block_invoke(id a1)
{
  MusicMonogramArtworkDataSource *v1;
  void *v2;

  v1 = objc_alloc_init(MusicMonogramArtworkDataSource);
  v2 = (void *)sharedMonogramArtworkDataSource_sSharedMonogramArtworkDataSource;
  sharedMonogramArtworkDataSource_sSharedMonogramArtworkDataSource = (uint64_t)v1;

}

+ (OS_dispatch_queue)loadingQueue
{
  if (loadingQueue_onceToken != -1)
    dispatch_once(&loadingQueue_onceToken, &__block_literal_global_71);
  return (OS_dispatch_queue *)(id)loadingQueue_loadingQueue;
}

void __46__MusicMonogramArtworkDataSource_loadingQueue__block_invoke(id a1)
{
  dispatch_queue_attr_t v1;
  dispatch_queue_t v2;
  void *v3;
  NSObject *v4;

  v1 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v4 = objc_claimAutoreleasedReturnValue(v1);
  v2 = dispatch_queue_create("com.apple.Music.MusicMonogramArtworkDataSource.loadingQueue", v4);
  v3 = (void *)loadingQueue_loadingQueue;
  loadingQueue_loadingQueue = (uint64_t)v2;

}

- (BOOL)areRepresentationsAvailableForCatalog:(id)a3
{
  return 1;
}

- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4
{
  return 0;
}

- (id)existingRepresentationForArtworkCatalog:(id)a3
{
  return 0;
}

- (void)loadRepresentationForArtworkCatalog:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  MusicMonogramArtworkDataSource *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend((id)objc_opt_class(self), "loadingQueue");
  v9 = objc_claimAutoreleasedReturnValue(v8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __88__MusicMonogramArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke;
  block[3] = &unk_13D0508;
  v13 = v6;
  v14 = self;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

void __88__MusicMonogramArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  double v13;
  double v14;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "token"));
  objc_msgSend(*(id *)(a1 + 32), "fittingSize");
  v4 = v3;
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "destinationScale");
  v8 = v7;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __88__MusicMonogramArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_2;
  v10[3] = &unk_13D04E0;
  v9 = *(void **)(a1 + 40);
  v11 = *(id *)(a1 + 32);
  v13 = v4;
  v14 = v6;
  v12 = *(id *)(a1 + 48);
  objc_msgSend(v9, "_monogramImageForToken:fittingSize:scale:completionHandler:", v2, v10, v4, v6, v8);

}

void __88__MusicMonogramArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "visualIdenticalityIdentifier"));
  v6 = (id)objc_claimAutoreleasedReturnValue(+[MPArtworkRepresentation representationForVisualIdentity:withSize:image:](MPArtworkRepresentation, "representationForVisualIdentity:withSize:image:", v5, v4, *(double *)(a1 + 48), *(double *)(a1 + 56)));

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)cancelLoadingRepresentationForArtworkCatalog:(id)a3
{
  CNCancelable *cancelableRenderer;

  -[CNCancelable cancel](self->_cancelableRenderer, "cancel", a3);
  cancelableRenderer = self->_cancelableRenderer;
  self->_cancelableRenderer = 0;

}

- (id)visualIdenticalityIdentifierForCatalog:(id)a3
{
  return objc_msgSend(a3, "token");
}

- (void)_monogramImageForToken:(id)a3 fittingSize:(CGSize)a4 scale:(double)a5 completionHandler:(id)a6
{
  double height;
  double width;
  id v11;
  void (**v12)(id, void *);
  void *v13;
  double v14;
  void *v15;
  void *v16;
  objc_class *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  CNAvatarImageRenderer *v22;
  CNAvatarImageRenderer *renderer;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  CNAvatarImageRenderer *v30;
  void *v31;
  void *v32;
  void **v33;
  uint64_t v34;
  Class (*v35)(uint64_t);
  void *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;

  height = a4.height;
  width = a4.width;
  v11 = a3;
  v12 = (void (**)(id, void *))a6;
  if (width < height)
    height = width;
  if (a5 <= 0.0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v13, "scale");
    a5 = v14;

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fullName"));
  if (!self->_renderer)
  {
    v38 = 0;
    v39 = &v38;
    v40 = 0x2050000000;
    v16 = (void *)getCNAvatarImageRendererClass_softClass;
    v41 = getCNAvatarImageRendererClass_softClass;
    if (!getCNAvatarImageRendererClass_softClass)
    {
      v33 = _NSConcreteStackBlock;
      v34 = 3221225472;
      v35 = __getCNAvatarImageRendererClass_block_invoke;
      v36 = &unk_13D0530;
      v37 = &v38;
      __getCNAvatarImageRendererClass_block_invoke((uint64_t)&v33);
      v16 = (void *)v39[3];
    }
    v17 = objc_retainAutorelease(v16);
    _Block_object_dispose(&v38, 8);
    v18 = [v17 alloc];
    v38 = 0;
    v39 = &v38;
    v40 = 0x2050000000;
    v19 = (void *)getCNAvatarImageRendererSettingsClass_softClass;
    v41 = getCNAvatarImageRendererSettingsClass_softClass;
    if (!getCNAvatarImageRendererSettingsClass_softClass)
    {
      v33 = _NSConcreteStackBlock;
      v34 = 3221225472;
      v35 = __getCNAvatarImageRendererSettingsClass_block_invoke;
      v36 = &unk_13D0530;
      v37 = &v38;
      __getCNAvatarImageRendererSettingsClass_block_invoke((uint64_t)&v33);
      v19 = (void *)v39[3];
    }
    v20 = objc_retainAutorelease(v19);
    _Block_object_dispose(&v38, 8);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "defaultSettings"));
    v22 = (CNAvatarImageRenderer *)objc_msgSend(v18, "initWithSettings:", v21);
    renderer = self->_renderer;
    self->_renderer = v22;

  }
  v38 = 0;
  v39 = &v38;
  v40 = 0x2050000000;
  v24 = (void *)getCNAvatarImageRenderingScopeClass_softClass;
  v41 = getCNAvatarImageRenderingScopeClass_softClass;
  if (!getCNAvatarImageRenderingScopeClass_softClass)
  {
    v33 = _NSConcreteStackBlock;
    v34 = 3221225472;
    v35 = __getCNAvatarImageRenderingScopeClass_block_invoke;
    v36 = &unk_13D0530;
    v37 = &v38;
    __getCNAvatarImageRenderingScopeClass_block_invoke((uint64_t)&v33);
    v24 = (void *)v39[3];
  }
  v25 = objc_retainAutorelease(v24);
  _Block_object_dispose(&v38, 8);
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "scopeWithPointSize:scale:rightToLeft:style:", objc_msgSend(v11, "rightToLeft"), 0, height, height, a5));
  v38 = 0;
  v39 = &v38;
  v40 = 0x2050000000;
  v27 = (void *)getCNContactClass_softClass;
  v41 = getCNContactClass_softClass;
  if (!getCNContactClass_softClass)
  {
    v33 = _NSConcreteStackBlock;
    v34 = 3221225472;
    v35 = __getCNContactClass_block_invoke;
    v36 = &unk_13D0530;
    v37 = &v38;
    __getCNContactClass_block_invoke((uint64_t)&v33);
    v27 = (void *)v39[3];
  }
  v28 = objc_retainAutorelease(v27);
  _Block_object_dispose(&v38, 8);
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "contactWithDisplayName:emailOrPhoneNumber:", v15, 0));
  v30 = self->_renderer;
  v42 = v29;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v42, 1));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CNAvatarImageRenderer avatarImageForContacts:scope:](v30, "avatarImageForContacts:scope:", v31, v26));

  v12[2](v12, v32);
}

- (CNCancelable)cancelableRenderer
{
  return self->_cancelableRenderer;
}

- (void)setCancelableRenderer:(id)a3
{
  objc_storeStrong((id *)&self->_cancelableRenderer, a3);
}

- (CNAvatarImageRenderer)renderer
{
  return self->_renderer;
}

- (void)setRenderer:(id)a3
{
  objc_storeStrong((id *)&self->_renderer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_cancelableRenderer, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
