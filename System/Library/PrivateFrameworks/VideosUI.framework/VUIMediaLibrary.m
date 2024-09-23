@implementation VUIMediaLibrary

- (VUIMediaLibrary)initWithIdentifier:(id)a3 type:(unint64_t)a4 manager:(id)a5
{
  id v8;
  id v9;
  VUIMediaLibrary *v10;
  uint64_t v11;
  VUIMediaLibraryIdentifier *identifier;
  objc_super v14;

  v8 = a3;
  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)VUIMediaLibrary;
  v10 = -[VUIMediaLibraryImageLoader init](&v14, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    identifier = v10->_identifier;
    v10->_identifier = (VUIMediaLibraryIdentifier *)v11;

    v10->_type = a4;
    objc_storeWeak((id *)&v10->_manager, v9);
    v10->_revision = 1;
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;

  v3 = -[VUIMediaLibrary type](self, "type");
  v4 = v3 ^ (2 * -[VUIMediaLibrary revision](self, "revision"));
  -[VUIMediaLibrary identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ objc_msgSend(v5, "hash");

  return v6;
}

- (unint64_t)type
{
  return self->_type;
}

- (VUIMediaLibraryIdentifier)identifier
{
  return self->_identifier;
}

- (unint64_t)revision
{
  VUIMediaLibrary *v2;
  unint64_t revision;

  v2 = self;
  objc_sync_enter(v2);
  revision = v2->_revision;
  objc_sync_exit(v2);

  return revision;
}

void __53__VUIMediaLibrary__postContentsDidChangeNotification__block_invoke(uint64_t a1)
{
  id WeakRetained;
  VUIMediaLibraryContentsChange *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (+[VUIUtilities isSUIEnabled](VUIUtilities, "isSUIEnabled")
      || _os_feature_enabled_impl())
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v3 = (VUIMediaLibraryContentsChange *)objc_claimAutoreleasedReturnValue();
      -[VUIMediaLibraryContentsChange postNotificationName:object:](v3, "postNotificationName:object:", CFSTR("VUISideBandContentsDidChangeNotification"), 0);
    }
    else
    {
      v3 = -[VUIMediaLibraryContentsChange initWithRevision:]([VUIMediaLibraryContentsChange alloc], "initWithRevision:", *(_QWORD *)(a1 + 40));
      v6 = CFSTR("VUIMediaLibraryContentsDidChangeUserInfoKeyContentsChange");
      v7[0] = v3;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("VUIMediaLibraryContentsDidChangeNotification"), WeakRetained, v4);

    }
  }

}

- (void)_postContentsDidChangeNotification
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6[2];
  id location;

  v3 = -[VUIMediaLibrary _incrementRevision](self, "_incrementRevision");
  objc_initWeak(&location, self);
  -[VUIMediaLibrary manager](self, "manager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__VUIMediaLibrary__postContentsDidChangeNotification__block_invoke;
  v5[3] = &unk_1E9F9C210;
  objc_copyWeak(v6, &location);
  v6[1] = v3;
  objc_msgSend(v4, "_enqueueCompletionQueueBlock:", v5);

  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

- (VUIMediaLibraryManager)manager
{
  return (VUIMediaLibraryManager *)objc_loadWeakRetained((id *)&self->_manager);
}

- (unint64_t)_incrementRevision
{
  VUIMediaLibrary *v2;
  unint64_t v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_revision + 1;
  v2->_revision = v3;
  objc_sync_exit(v2);

  return v3;
}

- (VUIMediaLibrary)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (NSString)title
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("The %@ method needs to be override by a subclass."), v4);

  return (NSString *)&stru_1E9FF3598;
}

- (unint64_t)connectionState
{
  return 2;
}

- (BOOL)supportsDRMContent
{
  return 1;
}

- (BOOL)isConnectable
{
  return 1;
}

- (void)connectWithCompletionHandler:(id)a3 progressHandler:(id)a4
{
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v5 = a3;
  if (v5)
  {
    -[VUIMediaLibrary manager](self, "manager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __64__VUIMediaLibrary_connectWithCompletionHandler_progressHandler___block_invoke;
    v7[3] = &unk_1E9F98E68;
    v8 = v5;
    objc_msgSend(v6, "_enqueueCompletionQueueBlock:", v7);

  }
}

uint64_t __64__VUIMediaLibrary_connectWithCompletionHandler_progressHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)enqueueMediaItemEntityTypesFetchWithCompletionHandler:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ method needs to be override by a subclass."), v5);

  return 0;
}

- (id)enqueueFetchRequests:(id)a3 completionHandler:(id)a4
{
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("The %@ method needs to be override by a subclass."), v6);

  return 0;
}

- (id)saveMediaEntity:(id)a3 completionHandler:(id)a4
{
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("The %@ method needs to be override by a subclass."), v6);

  return 0;
}

- (id)_imageLoaderIdentifier
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("The %@ method needs to be override by a subclass."), v4);

  return 0;
}

- (id)_imageLoadParamsForImageLoaderObject:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ method needs to be override by a subclass."), v5);

  return 0;
}

- (id)_imageLoadOperationWithParams:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5
{
  void *v5;
  uint64_t v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "raise:format:", v6, CFSTR("The %@ method needs to be override by a subclass."), v7);

  return 0;
}

- (BOOL)isEqual:(id)a3
{
  VUIMediaLibrary *v4;
  VUIMediaLibrary *v5;
  VUIMediaLibrary *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  char v14;

  v4 = (VUIMediaLibrary *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v14 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = -[VUIMediaLibrary type](self, "type");
    if (v7 == -[VUIMediaLibrary type](v6, "type")
      && (v8 = -[VUIMediaLibrary revision](self, "revision"), v8 == -[VUIMediaLibrary revision](v6, "revision")))
    {
      -[VUIMediaLibrary identifier](self, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIMediaLibrary identifier](v6, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v9;
      v12 = v10;
      v13 = v12;
      if (v11 == v12)
      {
        v14 = 1;
      }
      else
      {
        v14 = 0;
        if (v11 && v12)
          v14 = objc_msgSend(v11, "isEqual:", v12);
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v28;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v28.receiver = self;
  v28.super_class = (Class)VUIMediaLibrary;
  -[VUIMediaLibrary description](&v28, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaLibrary identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("identifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  VUIMediaLibraryTypeLogString(-[VUIMediaLibrary type](self, "type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("type"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@=%lu"), CFSTR("revision"), -[VUIMediaLibrary revision](self, "revision"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v11);

  v12 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaLibrary title](self, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("title"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v14);

  v15 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaLibrary isConnectable](self, "isConnectable");
  VUIBoolLogString();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("connectable"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v17);

  v18 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaLibrary supportsDRMContent](self, "supportsDRMContent");
  VUIBoolLogString();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("supportsDRMContent"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v20);

  v21 = (void *)MEMORY[0x1E0CB3940];
  VUIMediaLibraryConnectionStateLogString(-[VUIMediaLibrary connectionState](self, "connectionState"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("connectionState"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v23);

  v24 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringWithFormat:", CFSTR("<%@>"), v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (void)_updateWithTitle:(id)a3 connectionState:(unint64_t)a4
{
  void *v4;
  uint64_t v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("The %@ method needs to be override by a subclass."), v6);

}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void)setRevision:(unint64_t)a3
{
  self->_revision = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_manager);
}

@end
