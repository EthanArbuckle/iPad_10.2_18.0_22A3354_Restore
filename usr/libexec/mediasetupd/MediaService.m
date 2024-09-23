@implementation MediaService

- (void)populateMediaService:(id)a3 homeID:(id)a4 homeUserID:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v28 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService serviceID](self, "serviceID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
  v10 = objc_msgSend(v9, "isEqualToString:", kAppleMusicServiceIdentifier);

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService _getAppleMusicAccountName:](self, "_getAppleMusicAccountName:", v28));
    -[MediaService setAccountName:](self, "setAccountName:", v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serviceIconPath"));
  -[MediaService setRemoteIconURL:](self, "setRemoteIconURL:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serviceType"));
  v14 = objc_msgSend(v13, "copy");
  -[MediaService setServiceType:](self, "setServiceType:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serviceName"));
  v16 = objc_msgSend(v15, "copy");
  -[MediaService setServiceName:](self, "setServiceName:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleIDS"));
  v18 = objc_msgSend(v17, "copy");
  -[MediaService setAlternateBundleIdentifiers:](self, "setAlternateBundleIdentifiers:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "configurationPublicKey"));
  v20 = objc_msgSend(v19, "copy");
  -[MediaService setConfigPublicKey:](self, "setConfigPublicKey:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleIDS"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "firstObject"));
  v23 = objc_msgSend(v22, "copy");
  -[MediaService setBundleIdentifier:](self, "setBundleIdentifier:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService serviceID](self, "serviceID"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "UUIDString"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serviceIconPath"));

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService _getLocalIconImagePath:remoteIconURL:](self, "_getLocalIconImagePath:remoteIconURL:", v25, v26));
  -[MediaService setIconImageURL:](self, "setIconImageURL:", v27);

}

- (id)_getAppleMusicAccountName:(id)a3
{
  id v3;
  MSDAccount *v4;
  void *v5;

  v3 = a3;
  v4 = -[MSDAccount initWithHomeIdentifier:]([MSDAccount alloc], "initWithHomeIdentifier:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccount iTunesAccountName](v4, "iTunesAccountName"));
  return v5;
}

- (id)_getLocalIconImagePath:(id)a3 remoteIconURL:(id)a4
{
  id v5;
  id v6;
  MSDArtworkManager *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  v7 = -[MSDArtworkManager initWithServiceID:remoteImageURL:]([MSDArtworkManager alloc], "initWithServiceID:remoteImageURL:", v6, v5);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDArtworkManager getLocalCachedImageURL](v7, "getLocalCachedImageURL"));
  return v8;
}

@end
