@implementation CuratedCollectionLinkMetadataProvider

- (CuratedCollectionLinkMetadataProvider)initWithCuratedCollection:(id)a3 refinedMapItems:(id)a4
{
  id v6;
  CuratedCollectionLinkMetadataProvider *v7;
  CollectionThumbnailGenerator *v8;
  CollectionThumbnailGenerator *thumbnailGenerator;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CuratedCollectionLinkMetadataProvider;
  v7 = -[CuratedCollectionActivityProvider initWithCuratedCollection:refinedMapItems:](&v11, "initWithCuratedCollection:refinedMapItems:", v6, a4);
  if (v7)
  {
    v8 = -[CollectionThumbnailGenerator initWithPlaceCollection:size:]([CollectionThumbnailGenerator alloc], "initWithPlaceCollection:size:", v6, 70.0, 70.0);
    thumbnailGenerator = v7->_thumbnailGenerator;
    v7->_thumbnailGenerator = v8;

  }
  return v7;
}

- (id)activityViewControllerLinkPresentationMetadata:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionLinkMetadataProvider cachedMetadata](self, "cachedMetadata", a3));

  if (!v4)
  {
    v5 = objc_alloc_init((Class)LPLinkMetadata);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActivityProvider url](self, "url"));
    objc_msgSend(v5, "setURL:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActivityProvider url](self, "url"));
    objc_msgSend(v5, "setOriginalURL:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActivityProvider title](self, "title"));
    objc_msgSend(v5, "setTitle:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActivityProvider curatedCollection](self, "curatedCollection"));
    if (v9)
    {
      v10 = objc_claimAutoreleasedReturnValue(-[CuratedCollectionLinkMetadataProvider _curatedCollectionSpecialization](self, "_curatedCollectionSpecialization"));
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActivityProvider publisher](self, "publisher"));

      if (!v11)
      {
LABEL_7:
        -[CuratedCollectionLinkMetadataProvider setCachedMetadata:](self, "setCachedMetadata:", v5);

        return -[CuratedCollectionLinkMetadataProvider cachedMetadata](self, "cachedMetadata");
      }
      v10 = objc_claimAutoreleasedReturnValue(-[CuratedCollectionLinkMetadataProvider _publisherSpecialization](self, "_publisherSpecialization"));
    }
    v12 = (void *)v10;
    objc_msgSend(v5, "setSpecialization:", v10);

    goto LABEL_7;
  }
  return -[CuratedCollectionLinkMetadataProvider cachedMetadata](self, "cachedMetadata");
}

- (id)_publisherSpecialization
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActivityProvider publisher](self, "publisher"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "publisherAttribution"));

  v5 = objc_alloc_init((Class)LPMapCollectionPublisherMetadata);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayName"));
  objc_msgSend(v5, "setName:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKPlaceCollectionsPublisherIconManager sharedInstance](MKPlaceCollectionsPublisherIconManager, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayName"));
  v9 = objc_msgSend(v4, "iconIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v10, "scale");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "iconForPublisherNamed:usingId:usingContentScale:usingSizeGroup:isNightMode:", v8, v9, 5, 0));

  if (v11)
  {
    v12 = objc_msgSend(objc_alloc((Class)LPImage), "initWithPlatformImage:", v11);
    objc_msgSend(v5, "setIcon:", v12);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActivityProvider publisher](self, "publisher"));
  objc_msgSend(v5, "setNumberOfPublishedCollections:", objc_msgSend(v13, "totalCollectionCount"));

  return v5;
}

- (id)_curatedCollectionSpecialization
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t Handler;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  void *v41;
  void *v42;
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  id location;

  v3 = objc_alloc_init((Class)LPMapCollectionMetadata);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActivityProvider curatedCollection](self, "curatedCollection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionTitle"));
  objc_msgSend(v3, "setName:", v5);

  v6 = objc_alloc_init((Class)NSItemProvider);
  objc_initWeak(&location, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypePNG, "identifier"));
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_10068FEF8;
  v46[3] = &unk_1011BFC58;
  objc_copyWeak(&v47, &location);
  v42 = v6;
  objc_msgSend(v6, "registerItemForTypeIdentifier:loadHandler:", v7, v46);

  v8 = objc_alloc((Class)LPImage);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionLinkMetadataProvider thumbnailGenerator](self, "thumbnailGenerator"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "placeholderImage"));
  v43 = objc_msgSend(v8, "initWithPlatformImage:", v10);

  if (v43)
  {
    v11 = objc_msgSend(objc_alloc((Class)LPImage), "initWithItemProvider:properties:placeholderImage:", v42, 0, v43);
    objc_msgSend(v3, "setIcon:", v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActivityProvider curatedCollection](self, "curatedCollection"));
  objc_msgSend(v3, "setNumberOfItems:", objc_msgSend(v12, "numberOfItems"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActivityProvider refinedMapItems](self, "refinedMapItems"));
  v14 = sub_10039DCD4(v13, &stru_1011BFC78);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  v16 = objc_msgSend(v15, "copy");
  objc_msgSend(v3, "setAddresses:", v16);
  v41 = v15;

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActivityProvider curatedCollection](self, "curatedCollection"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "photos"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "firstObject"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v20, "scale");
  v22 = v21;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapItemPhotoOptions defaultPhotoOptionsWithAllowSmaller:](GEOMapItemPhotoOptions, "defaultPhotoOptionsWithAllowSmaller:", 0));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bestPhotoForFrameSize:displayScale:options:", v23, kRichPreviewSnapshotSize[0], kRichPreviewSnapshotSize[1], v22));

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActivityProvider curatedCollection](self, "curatedCollection"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "joeColorImage"));
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_1006900F8;
  v44[3] = &unk_1011BFCA0;
  v27 = v24;
  v45 = v27;
  Handler = imageWithPlaceholderAndLoadHandler(v26, v44);
  v29 = (void *)objc_claimAutoreleasedReturnValue(Handler);

  objc_msgSend(v3, "setImage:", v29);
  objc_msgSend(v3, "setDarkImage:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActivityProvider curatedCollection](self, "curatedCollection"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "publisher"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "publisherAttribution"));

  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "displayName"));
  objc_msgSend(v3, "setPublisherName:", v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[MKPlaceCollectionsPublisherIconManager sharedInstance](MKPlaceCollectionsPublisherIconManager, "sharedInstance"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "displayName"));
  v36 = objc_msgSend(v32, "iconIdentifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v37, "scale");
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "iconForPublisherNamed:usingId:usingContentScale:usingSizeGroup:isNightMode:", v35, v36, 5, 0));

  if (v38)
  {
    v39 = objc_msgSend(objc_alloc((Class)LPImage), "initWithPlatformImage:", v38, v41);
    objc_msgSend(v3, "setPublisherIcon:", v39);

  }
  objc_destroyWeak(&v47);
  objc_destroyWeak(&location);

  return v3;
}

- (LPLinkMetadata)cachedMetadata
{
  return self->_cachedMetadata;
}

- (void)setCachedMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_cachedMetadata, a3);
}

- (CollectionThumbnailGenerator)thumbnailGenerator
{
  return self->_thumbnailGenerator;
}

- (void)setThumbnailGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailGenerator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailGenerator, 0);
  objc_storeStrong((id *)&self->_cachedMetadata, 0);
}

@end
