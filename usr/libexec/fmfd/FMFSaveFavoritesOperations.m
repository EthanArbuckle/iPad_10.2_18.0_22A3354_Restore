@implementation FMFSaveFavoritesOperations

- (FMFSaveFavoritesOperations)initWithFavorites:(id)a3 clientSession:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  FMFSaveFavoritesOperations *v11;
  NSUUID *v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  objc_super v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)FMFSaveFavoritesOperations;
  v11 = -[FMFSaveFavoritesOperations init](&v18, "init");
  if (v11)
  {
    v12 = objc_opt_new(NSUUID);
    -[FMFSaveFavoritesOperations setIdentifier:](v11, "setIdentifier:", v12);

    v13 = objc_msgSend(v8, "copy");
    -[FMFSaveFavoritesOperations setFavorites:](v11, "setFavorites:", v13);

    -[FMFSaveFavoritesOperations setClientSession:](v11, "setClientSession:", v9);
    -[FMFSaveFavoritesOperations setCompletionBlock:](v11, "setCompletionBlock:", v10);
    v14 = sub_100011D0C();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMFSaveFavoritesOperations identifier](v11, "identifier"));
      *(_DWORD *)buf = 138412546;
      v20 = v16;
      v21 = 2112;
      v22 = v8;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "FMFSaveFavoritesOperations initialized: %@ withFavorites: %@", buf, 0x16u);

    }
  }

  return v11;
}

- (void)executeWithCompletion:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;

  v4 = a3;
  v5 = sub_100011D0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMFSaveFavoritesOperations identifier](self, "identifier"));
    *(_DWORD *)buf = 138412290;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FMFSaveFavoritesOperations executing: %@", buf, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMFSaveFavoritesOperations favorites](self, "favorites"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMFSaveFavoritesOperations clientSession](self, "clientSession"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10004024C;
  v12[3] = &unk_100099F90;
  v12[4] = self;
  v13 = v4;
  v11 = v4;
  objc_msgSend(v8, "saveFavorites:clientSession:completion:", v9, v10, v12);

}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSArray)favorites
{
  return self->_favorites;
}

- (void)setFavorites:(id)a3
{
  objc_storeStrong((id *)&self->_favorites, a3);
}

- (FMFClientSession)clientSession
{
  return self->_clientSession;
}

- (void)setClientSession:(id)a3
{
  objc_storeStrong((id *)&self->_clientSession, a3);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_clientSession, 0);
  objc_storeStrong((id *)&self->_favorites, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
