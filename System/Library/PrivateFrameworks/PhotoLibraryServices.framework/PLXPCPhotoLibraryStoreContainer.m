@implementation PLXPCPhotoLibraryStoreContainer

- (PLXPCPhotoLibraryStoreContainer)initWithServer:(id)a3 listener:(id)a4
{
  id v7;
  id v8;
  PLXPCPhotoLibraryStoreContainer *v9;
  PLXPCPhotoLibraryStoreContainer *v10;
  PLXPCPhotoLibraryStoreContainer *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PLXPCPhotoLibraryStoreContainer;
  v9 = -[PLXPCPhotoLibraryStoreContainer init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_server, a3);
    objc_storeStrong((id *)&v10->_listener, a4);
    v11 = v10;
  }

  return v10;
}

- (NSXPCListenerEndpoint)listenerEndpoint
{
  return -[NSXPCListener endpoint](self->_listener, "endpoint");
}

- (NSXPCStoreServer)server
{
  return (NSXPCStoreServer *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_server, 0);
}

+ (id)newContainerWithPathManager:(id)a3 connectionAuthorization:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  PLXPCPhotoLibraryStoreServerRequestHandlingPolicy *v16;
  void *v17;
  PLXPCPhotoLibraryStoreContainer *v18;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLXPCPhotoLibraryStoreContainer.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pathManager"));

  }
  objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedObjectContext managedObjectModelURL](PLManagedObjectContext, "managedObjectModelURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = 0;
  objc_msgSend(v7, "photosDatabasePath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedObjectContext getPersistentStoreURL:options:forDatabasePath:](PLManagedObjectContext, "getPersistentStoreURL:options:forDatabasePath:", &v22, &v21, v11);
  v12 = v22;
  v13 = v21;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setValue:forKey:", v9, *MEMORY[0x1E0C97A38]);
  v23[0] = CFSTR("com.apple.private.assetsd.xpcstore_restricted.access");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setValue:forKey:", v15, *MEMORY[0x1E0C97A48]);

  if (v13)
    objc_msgSend(v14, "addEntriesFromDictionary:", v13);
  v16 = -[PLXPCPhotoLibraryStoreServerRequestHandlingPolicy initWithConnectionAuthorization:]([PLXPCPhotoLibraryStoreServerRequestHandlingPolicy alloc], "initWithConnectionAuthorization:", v8);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97C30]), "initForStoreWithURL:usingModelAtURL:options:policy:", v12, v10, v14, v16);
  objc_msgSend(v9, "setDelegate:", v17);
  objc_msgSend(v17, "startListening");
  v18 = -[PLXPCPhotoLibraryStoreContainer initWithServer:listener:]([PLXPCPhotoLibraryStoreContainer alloc], "initWithServer:listener:", v17, v9);

  return v18;
}

@end
