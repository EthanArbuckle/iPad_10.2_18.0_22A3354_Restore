@implementation UserCollectionHandler

- (UserCollectionHandler)initWithCollection:(id)a3
{
  id v4;
  uint64_t v5;
  UserCollectionHandler *v6;
  UserCollectionHandler *v7;
  UserCollectionHandler *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  NSObject *v13;
  char *v14;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;

  v4 = a3;
  v5 = objc_opt_class(MSCollection);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v16.receiver = self;
    v16.super_class = (Class)UserCollectionHandler;
    v6 = -[CollectionHandler initWithCollection:](&v16, "initWithCollection:", v4);
    v7 = v6;
    if (v6)
    {
      v6->_modficationLock._os_unfair_lock_opaque = 0;
      -[UserCollectionHandler rebuildContent](v6, "rebuildContent");
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v9 = sub_1004318FC();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("collection is not a MapsSync Collection")));
      *(_DWORD *)buf = 136315906;
      v18 = "-[UserCollectionHandler initWithCollection:]";
      v19 = 2080;
      v20 = "UserCollectionHandler.m";
      v21 = 1024;
      v22 = 57;
      v23 = 2112;
      v24 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly! '%@'", buf, 0x26u);

    }
    if (sub_100A70734())
    {
      v12 = sub_1004318FC();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v18 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
    v8 = 0;
  }

  return v8;
}

- (void)setCollection:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  char *v11;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  v4 = a3;
  v5 = objc_opt_class(MSCollection);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0)
  {
    v6 = sub_1004318FC();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("collection is not a MapsSync Collection")));
      *(_DWORD *)buf = 136315906;
      v14 = "-[UserCollectionHandler setCollection:]";
      v15 = 2080;
      v16 = "UserCollectionHandler.m";
      v17 = 1024;
      v18 = 71;
      v19 = 2112;
      v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly! '%@'", buf, 0x26u);

    }
    if (sub_100A70734())
    {
      v9 = sub_1004318FC();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v14 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)UserCollectionHandler;
  -[CollectionHandler setCollection:](&v12, "setCollection:", v4);

}

- (MSCollection)collectionAsMapsSyncCollection
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  char *v12;
  int v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler collection](self, "collection"));
  v4 = objc_opt_class(MSCollection);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler collection](self, "collection"));
  }
  else
  {
    v7 = sub_1004318FC();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("collection is not a MapsSync Collection")));
      v14 = 136315906;
      v15 = "-[UserCollectionHandler collectionAsMapsSyncCollection]";
      v16 = 2080;
      v17 = "UserCollectionHandler.m";
      v18 = 1024;
      v19 = 79;
      v20 = 2112;
      v21 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly! '%@'", (uint8_t *)&v14, 0x26u);

    }
    if (sub_100A70734())
    {
      v10 = sub_1004318FC();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v14 = 138412290;
        v15 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v14, 0xCu);

      }
    }
    v6 = 0;
  }
  return (MSCollection *)v6;
}

- (void)startModification
{
  os_unfair_lock_s *p_modficationLock;

  p_modficationLock = &self->_modficationLock;
  os_unfair_lock_lock(&self->_modficationLock);
  ++self->_modificationCount;
  os_unfair_lock_unlock(p_modficationLock);
}

- (void)endModification
{
  os_unfair_lock_s *p_modficationLock;

  p_modficationLock = &self->_modficationLock;
  os_unfair_lock_lock(&self->_modficationLock);
  --self->_modificationCount;
  os_unfair_lock_unlock(p_modficationLock);
}

- (BOOL)beingModified
{
  UserCollectionHandler *v2;
  os_unfair_lock_s *p_modficationLock;

  v2 = self;
  p_modficationLock = &self->_modficationLock;
  os_unfair_lock_lock(&self->_modficationLock);
  LOBYTE(v2) = v2->_modificationCount != 0;
  os_unfair_lock_unlock(p_modficationLock);
  return (char)v2;
}

- (int64_t)handlerType
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v4 = a3;
  v5 = objc_opt_class(self);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UserCollectionHandler identifier](self, "identifier"));
    v8 = objc_msgSend(v6, "isEqual:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)sharingURL
{
  return -[CollectionHandler sharingURLFromContainedMapItems](self, "sharingURLFromContainedMapItems");
}

- (id)identifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler collection](self, "collection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUIDString"));

  return v4;
}

- (id)title
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UserCollectionHandler stagedTitle](self, "stagedTitle"));
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler collection](self, "collection"));
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));

  }
  return v5;
}

- (id)stagedTitle
{
  return self->_stagedTitle;
}

- (void)setStagedTitle:(id)a3
{
  objc_storeStrong((id *)&self->_stagedTitle, a3);
}

- (BOOL)canDelete
{
  void *v2;
  char v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler collection](self, "collection"));
  v3 = objc_msgSend(v2, "isLegacyFavoritesCollection") ^ 1;

  return v3;
}

- (BOOL)canEditImage
{
  return 1;
}

- (BOOL)canEditTitle
{
  void *v2;
  char v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler collection](self, "collection"));
  v3 = objc_msgSend(v2, "isLegacyFavoritesCollection") ^ 1;

  return v3;
}

- (BOOL)canAddContent
{
  return 1;
}

- (BOOL)canDeleteContent
{
  return 1;
}

- (int64_t)contentType
{
  return 1;
}

- (BOOL)updateTitle:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[CollectionHandler setHasBeenModified:](self, "setHasBeenModified:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler collection](self, "collection"));
  objc_msgSend(v5, "setTitle:", v4);

  -[UserCollectionHandler setStagedTitle:](self, "setStagedTitle:", v4);
  -[CollectionHandler notifyObserversInfoUpdated](self, "notifyObserversInfoUpdated");
  return 1;
}

- (BOOL)updateImage:(id)a3
{
  UIImage *v4;
  double v5;
  UIImage *ImageFromCurrentImageContext;
  uint64_t v7;
  NSData *v8;
  void *v9;
  void *v10;
  CGSize v12;

  v4 = (UIImage *)a3;
  -[CollectionHandler setHasBeenModified:](self, "setHasBeenModified:", 1);
  -[UIImage size](v4, "size");
  if (v5 > 300.0)
  {
    v12.width = 300.0;
    v12.height = 300.0;
    UIGraphicsBeginImageContext(v12);
    -[UIImage drawInRect:](v4, "drawInRect:", 0.0, 0.0, 300.0, 300.0);
    ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
    v7 = objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);

    UIGraphicsEndImageContext();
    v4 = (UIImage *)v7;
  }
  v8 = UIImagePNGRepresentation(v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler collection](self, "collection"));
  objc_msgSend(v10, "setImage:", v9);

  -[CollectionHandler setStagedImage:](self, "setStagedImage:", v4);
  if (!self->_needsToBePersisted)
    -[UserCollectionHandler updateCollection:](self, "updateCollection:", &stru_1011B9868);
  -[CollectionHandler loadImage](self, "loadImage");

  return 1;
}

- (void)addObjects:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _BYTE location[12];
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  void *v30;

  v6 = a3;
  v7 = a4;
  -[UserCollectionHandler startModification](self, "startModification");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UserCollectionHandler collectionAsMapsSyncCollection](self, "collectionAsMapsSyncCollection"));
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", (char *)objc_msgSend(v6, "count") + 1);
    objc_initWeak((id *)location, self);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100504D64;
    v17[3] = &unk_1011B9890;
    objc_copyWeak(&v23, (id *)location);
    v18 = v6;
    v19 = 0;
    v20 = v8;
    v21 = v9;
    v22 = v7;
    v10 = v9;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v17);

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)location);
  }
  else
  {
    v11 = sub_1004318FC();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("self.collection not a MapsSync Collection")));
      *(_DWORD *)location = 136315906;
      *(_QWORD *)&location[4] = "-[UserCollectionHandler addObjects:completion:]";
      v25 = 2080;
      v26 = "UserCollectionHandler.m";
      v27 = 1024;
      v28 = 217;
      v29 = 2112;
      v30 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly! '%@'", location, 0x26u);

    }
    if (sub_100A70734())
    {
      v14 = sub_1004318FC();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)location = 138412290;
        *(_QWORD *)&location[4] = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", location, 0xCu);

      }
    }
    if (v7)
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

- (void)removeObjects:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  _UNKNOWN **v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  UserCollectionHandler *v29;
  _UNKNOWN **v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void (**v42)(_QWORD, _QWORD);
  id v43;
  id v44;
  _QWORD block[4];
  id v46;
  id v47;
  void (**v48)(_QWORD, _QWORD);
  id v49;
  objc_super v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE location[12];
  __int16 v57;
  const char *v58;
  __int16 v59;
  int v60;
  __int16 v61;
  void *v62;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[UserCollectionHandler collectionAsMapsSyncCollection](self, "collectionAsMapsSyncCollection"));
  v9 = (void *)v8;
  if (v8)
  {
    v41 = (void *)v8;
    v42 = (void (**)(_QWORD, _QWORD))v7;
    v10 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v43 = v6;
    v11 = v6;
    v12 = (void *)v10;
    v13 = v11;
    v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    if (!v14)
      goto LABEL_21;
    v15 = v14;
    v16 = *(_QWORD *)v52;
    v17 = CPLaneGuidance_ptr;
    while (1)
    {
      v18 = 0;
      v44 = v15;
      do
      {
        if (*(_QWORD *)v52 != v16)
          objc_enumerationMutation(v13);
        v19 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)v18);
        v20 = objc_opt_class(v17[491]);
        if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0)
        {
          v50.receiver = self;
          v50.super_class = (Class)UserCollectionHandler;
          v21 = -[CollectionHandler itemForMapItem:](&v50, "itemForMapItem:", v19);
          v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
          if (v22)
            goto LABEL_18;
        }
        else
        {
          v23 = v19;
          if (objc_msgSend(v23, "conformsToProtocol:", &OBJC_PROTOCOL___GEOTransitLine))
            v24 = v23;
          else
            v24 = 0;
          v25 = v24;

          if (v25)
          {
            v26 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler mapping](self, "mapping"));
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKey:", v25));

            if (!v22)
            {
              v27 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler mapping](self, "mapping"));
              v28 = v16;
              v29 = self;
              v30 = v17;
              v31 = v13;
              v32 = v12;
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "name"));
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", v33));

              v12 = v32;
              v13 = v31;
              v17 = v30;
              self = v29;
              v16 = v28;
              v15 = v44;

            }
          }
          else
          {
            v22 = 0;
          }

          if (v22)
LABEL_18:
            objc_msgSend(v12, "addObject:", v22);
        }

        v18 = (char *)v18 + 1;
      }
      while (v15 != v18);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
      if (!v15)
      {
LABEL_21:

        if (objc_msgSend(v12, "count"))
        {
          -[UserCollectionHandler startModification](self, "startModification");
          objc_initWeak((id *)location, self);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1005054E0;
          block[3] = &unk_1011B3550;
          objc_copyWeak(&v49, (id *)location);
          v46 = v12;
          v9 = v41;
          v47 = v41;
          v7 = v42;
          v48 = v42;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

          objc_destroyWeak(&v49);
          objc_destroyWeak((id *)location);
        }
        else
        {
          v9 = v41;
          v7 = v42;
          if (v42)
          {
            v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSError GEOErrorWithCode:reason:](NSError, "GEOErrorWithCode:reason:", 0, CFSTR("No object to remove")));
            ((void (**)(_QWORD, void *))v42)[2](v42, v40);

          }
        }

        v6 = v43;
        goto LABEL_34;
      }
    }
  }
  v34 = sub_1004318FC();
  v35 = objc_claimAutoreleasedReturnValue(v34);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("self.collection not a MapsSync Collection")));
    *(_DWORD *)location = 136315906;
    *(_QWORD *)&location[4] = "-[UserCollectionHandler removeObjects:completion:]";
    v57 = 2080;
    v58 = "UserCollectionHandler.m";
    v59 = 1024;
    v60 = 269;
    v61 = 2112;
    v62 = v36;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly! '%@'", location, 0x26u);

  }
  if (sub_100A70734())
  {
    v37 = sub_1004318FC();
    v38 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      *(_DWORD *)location = 138412290;
      *(_QWORD *)&location[4] = v39;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%@", location, 0xCu);

    }
  }
  if (v7)
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
LABEL_34:

}

- (void)rebuildContent
{
  dispatch_queue_global_t global_queue;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  global_queue = dispatch_get_global_queue(21, 0);
  v3 = objc_claimAutoreleasedReturnValue(global_queue);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100505860;
  v4[3] = &unk_1011AD260;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)updateWithMapsSyncCollection:(id)a3
{
  -[UserCollectionHandler setCollection:](self, "setCollection:", a3);
  -[UserCollectionHandler rebuildContent](self, "rebuildContent");
}

- (void)updateTitle:(id)a3 forMapItem:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  void *v20;

  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler itemForMapItem:](self, "itemForMapItem:", a4));
  objc_msgSend(v10, "setCustomName:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSyncStore sharedStore](_TtC8MapsSync13MapsSyncStore, "sharedStore"));
  v20 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
  v19 = 0;
  objc_msgSend(v11, "saveWithObjects:error:", v12, &v19);
  v13 = v19;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100505AA0;
  block[3] = &unk_1011ACAD0;
  v17 = v13;
  v18 = v8;
  v14 = v13;
  v15 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (BOOL)containsItem:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UserCollectionHandler;
  v3 = -[CollectionHandler itemForMapItem:](&v7, "itemForMapItem:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = v4 != 0;

  return v5;
}

- (void)updateCollection:(id)a3
{
  id v4;
  id v5;
  objc_super v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100505BF0;
  v7[3] = &unk_1011B98B8;
  v5 = v4;
  v8 = v5;
  objc_copyWeak(&v9, &location);
  v6.receiver = self;
  v6.super_class = (Class)UserCollectionHandler;
  -[CollectionHandler updateCollection:](&v6, "updateCollection:", v7);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

- (int)showAction
{
  void *v2;
  unsigned int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler collection](self, "collection"));
  v3 = objc_msgSend(v2, "isLegacyFavoritesCollection");

  if (v3)
    return 2084;
  else
    return 2067;
}

- (BOOL)needsToBePersisted
{
  return self->_needsToBePersisted;
}

- (void)setNeedsToBePersisted:(BOOL)a3
{
  self->_needsToBePersisted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stagedTitle, 0);
}

@end
