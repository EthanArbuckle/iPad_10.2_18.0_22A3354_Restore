@implementation CollectionLinkMetadataProvider

- (id)activityViewControllerLinkPresentationMetadata:(id)a3
{
  LPLinkMetadata *cachedMetadata;
  LPLinkMetadata *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  UIImage *v19;
  NSData *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  LPLinkMetadata *v34;

  cachedMetadata = self->_cachedMetadata;
  if (!cachedMetadata)
  {
    v5 = (LPLinkMetadata *)objc_alloc_init((Class)LPLinkMetadata);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionActivityProvider collectionInfo](self, "collectionInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sharingURL"));
    -[LPLinkMetadata setURL:](v5, "setURL:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionActivityProvider collectionInfo](self, "collectionInfo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sharingURL"));
    -[LPLinkMetadata setOriginalURL:](v5, "setOriginalURL:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionActivityProvider collectionInfo](self, "collectionInfo"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "title"));
    -[LPLinkMetadata setTitle:](v5, "setTitle:", v11);

    v12 = objc_alloc_init((Class)LPMapCollectionMetadata);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionActivityProvider collectionInfo](self, "collectionInfo"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "title"));
    objc_msgSend(v12, "setName:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionActivityProvider collectionInfo](self, "collectionInfo"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "image"));

    if (v16)
    {
      v17 = objc_alloc((Class)LPImage);
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionActivityProvider collectionInfo](self, "collectionInfo"));
      v19 = (UIImage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "image"));
      v20 = UIImagePNGRepresentation(v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v22 = objc_msgSend(v17, "initWithData:MIMEType:", v21, CFSTR("image/png"));
      objc_msgSend(v12, "setIcon:", v22);

    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionActivityProvider mapItems](self, "mapItems"));
    objc_msgSend(v12, "setNumberOfItems:", objc_msgSend(v23, "count"));

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionActivityProvider mapItems](self, "mapItems"));
    v25 = sub_10039DCD4(v24, &stru_1011ACB30);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);

    v27 = objc_msgSend(v26, "copy");
    objc_msgSend(v12, "setAddresses:", v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionActivityProvider mapItems](self, "mapItems"));
    v29 = annotatedSnapshotImageWithMapItems(v28, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    objc_msgSend(v12, "setImage:", v30);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionActivityProvider mapItems](self, "mapItems"));
    v32 = annotatedSnapshotImageWithMapItems(v31, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    objc_msgSend(v12, "setDarkImage:", v33);

    -[LPLinkMetadata setSpecialization:](v5, "setSpecialization:", v12);
    v34 = self->_cachedMetadata;
    self->_cachedMetadata = v5;

    cachedMetadata = self->_cachedMetadata;
  }
  return cachedMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedMetadata, 0);
}

@end
