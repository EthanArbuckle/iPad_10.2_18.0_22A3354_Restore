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
  if (qword_1004C96D8 != -1)
    dispatch_once(&qword_1004C96D8, &stru_100468128);
  return (MusicMonogramArtworkDataSource *)(id)qword_1004C96D0;
}

+ (OS_dispatch_queue)loadingQueue
{
  if (qword_1004C96E8 != -1)
    dispatch_once(&qword_1004C96E8, &stru_100468148);
  return (OS_dispatch_queue *)(id)qword_1004C96E0;
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
  uint64_t v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  MusicMonogramArtworkDataSource *v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v10 = objc_msgSend((id)objc_opt_class(self, v8, v9), "loadingQueue");
  v11 = objc_claimAutoreleasedReturnValue(v10);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10037A478;
  block[3] = &unk_100468198;
  v15 = v6;
  v16 = self;
  v17 = v7;
  v12 = v7;
  v13 = v6;
  dispatch_async(v11, block);

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
    v16 = (void *)qword_1004C96F0;
    v41 = qword_1004C96F0;
    if (!qword_1004C96F0)
    {
      v33 = _NSConcreteStackBlock;
      v34 = 3221225472;
      v35 = sub_10037AA4C;
      v36 = &unk_1004681C0;
      v37 = &v38;
      sub_10037AA4C((uint64_t)&v33);
      v16 = (void *)v39[3];
    }
    v17 = objc_retainAutorelease(v16);
    _Block_object_dispose(&v38, 8);
    v18 = [v17 alloc];
    v38 = 0;
    v39 = &v38;
    v40 = 0x2050000000;
    v19 = (void *)qword_1004C9700;
    v41 = qword_1004C9700;
    if (!qword_1004C9700)
    {
      v33 = _NSConcreteStackBlock;
      v34 = 3221225472;
      v35 = sub_10037AB44;
      v36 = &unk_1004681C0;
      v37 = &v38;
      sub_10037AB44((uint64_t)&v33);
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
  v24 = (void *)qword_1004C9708;
  v41 = qword_1004C9708;
  if (!qword_1004C9708)
  {
    v33 = _NSConcreteStackBlock;
    v34 = 3221225472;
    v35 = sub_10037AB98;
    v36 = &unk_1004681C0;
    v37 = &v38;
    sub_10037AB98((uint64_t)&v33);
    v24 = (void *)v39[3];
  }
  v25 = objc_retainAutorelease(v24);
  _Block_object_dispose(&v38, 8);
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "scopeWithPointSize:scale:rightToLeft:style:", objc_msgSend(v11, "rightToLeft"), 0, height, height, a5));
  v38 = 0;
  v39 = &v38;
  v40 = 0x2050000000;
  v27 = (void *)qword_1004C9710;
  v41 = qword_1004C9710;
  if (!qword_1004C9710)
  {
    v33 = _NSConcreteStackBlock;
    v34 = 3221225472;
    v35 = sub_10037ABEC;
    v36 = &unk_1004681C0;
    v37 = &v38;
    sub_10037ABEC((uint64_t)&v33);
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
