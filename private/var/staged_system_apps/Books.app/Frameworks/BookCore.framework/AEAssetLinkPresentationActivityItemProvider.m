@implementation AEAssetLinkPresentationActivityItemProvider

- (AEAssetLinkPresentationActivityItemProvider)initWithDelegate:(id)a3 propertySource:(id)a4
{
  id v5;
  AEAssetLinkPresentationActivityItemProvider *v6;
  AEAssetActivityPropertyProvider *v7;
  AEAssetActivityPropertyProvider *propertyProvider;
  objc_super v10;

  v5 = a4;
  v10.receiver = self;
  v10.super_class = (Class)AEAssetLinkPresentationActivityItemProvider;
  v6 = -[AEAssetLinkPresentationActivityItemProvider init](&v10, "init");
  if (v6)
  {
    v7 = -[AEAssetActivityPropertyProvider initWithPropertySource:]([AEAssetActivityPropertyProvider alloc], "initWithPropertySource:", v5);
    propertyProvider = v6->_propertyProvider;
    v6->_propertyProvider = v7;

  }
  return v6;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return &stru_296430;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  return 0;
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  return -[AEAssetLinkPresentationActivityItemProvider _generateLinkMetaData](self, "_generateLinkMetaData", a3);
}

- (id)activityViewControllerLinkPresentationMetadata:(id)a3
{
  return -[AEAssetLinkPresentationActivityItemProvider _generateLinkMetaData](self, "_generateLinkMetaData", a3);
}

- (id)_generateLinkMetaData
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  UIImage *v10;
  NSData *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  __CFString *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v47;
  uint64_t v48;

  v3 = objc_alloc_init((Class)LPLinkMetadata);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetLinkPresentationActivityItemProvider propertyProvider](self, "propertyProvider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "storeURL"));

  objc_msgSend(v3, "setURL:", v5);
  objc_msgSend(v3, "setOriginalURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetLinkPresentationActivityItemProvider propertyProvider](self, "propertyProvider"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "previewAssetCoverItemProvider"));

  if (v7)
  {
    v8 = objc_msgSend(objc_alloc((Class)LPImage), "initWithItemProvider:properties:placeholderImage:", v7, 0, 0);
    if (!v8)
      goto LABEL_28;
LABEL_11:
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "activeStoreAccount"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "ams_storefront"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetLinkPresentationActivityItemProvider propertyProvider](self, "propertyProvider"));
    v17 = (uint64_t)objc_msgSend(v16, "assetType");

    if (v17 != 1 && v17 != 4)
    {
      if (v17 == 6)
      {
        v21 = objc_alloc_init((Class)LPiTunesMediaAudioBookMetadata);
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetLinkPresentationActivityItemProvider propertyProvider](self, "propertyProvider"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "title"));
        objc_msgSend(v21, "setName:", v23);

        v24 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetLinkPresentationActivityItemProvider propertyProvider](self, "propertyProvider"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "author"));
        objc_msgSend(v21, "setAuthor:", v25);

        objc_msgSend(v21, "setArtwork:", v8);
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetLinkPresentationActivityItemProvider propertyProvider](self, "propertyProvider"));
        LODWORD(v25) = objc_msgSend(v26, "isStoreAsset");

        if ((_DWORD)v25)
        {
          objc_msgSend(v21, "setStoreFrontIdentifier:", v15);
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetLinkPresentationActivityItemProvider propertyProvider](self, "propertyProvider"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "storeID"));
          objc_msgSend(v21, "setStoreIdentifier:", v28);
LABEL_20:

        }
      }
      else
      {
        if ((v17 & 0xFFFFFFFFFFFFFFFELL) != 2)
        {
          BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AssetsEngine/AEServices/Sharing/Private/AEAssetActivityItemProviderSource.m", 984, (uint64_t)"-[AEAssetLinkPresentationActivityItemProvider _generateLinkMetaData]", (uint64_t)"NO", CFSTR("Trying to show link preview for unsupported asset type"), v18, v19, v20, v47);
          goto LABEL_27;
        }
        v21 = objc_alloc_init((Class)LPFileMetadata);
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetLinkPresentationActivityItemProvider propertyProvider](self, "propertyProvider"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "title"));
        objc_msgSend(v21, "setName:", v39);

        v40 = BCAssetUTIForContentType(v17);
        v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
        objc_msgSend(v21, "setType:", v41);

        v42 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetLinkPresentationActivityItemProvider propertyProvider](self, "propertyProvider"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "bookURL"));
        v48 = 0;
        v44 = objc_msgSend(v43, "bu_fileAllocatedSizeWithError:", &v48);
        v45 = v48;

        if (!v45 && v44)
          objc_msgSend(v21, "setSize:", v44);
        objc_msgSend(v21, "setThumbnail:", v8);
      }
LABEL_26:
      objc_msgSend(v3, "setSpecialization:", v21);

LABEL_27:
      goto LABEL_28;
    }
    v21 = objc_alloc_init((Class)LPiTunesMediaBookMetadata);
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetLinkPresentationActivityItemProvider propertyProvider](self, "propertyProvider"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "title"));
    objc_msgSend(v21, "setName:", v30);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetLinkPresentationActivityItemProvider propertyProvider](self, "propertyProvider"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "author"));
    objc_msgSend(v21, "setAuthor:", v32);

    objc_msgSend(v21, "setArtwork:", v8);
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetLinkPresentationActivityItemProvider propertyProvider](self, "propertyProvider"));
    LODWORD(v32) = objc_msgSend(v33, "isStoreAsset");

    if ((_DWORD)v32)
    {
      objc_msgSend(v21, "setStoreFrontIdentifier:", v15);
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetLinkPresentationActivityItemProvider propertyProvider](self, "propertyProvider"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "storeID"));
      objc_msgSend(v21, "setStoreIdentifier:", v35);

    }
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetLinkPresentationActivityItemProvider propertyProvider](self, "propertyProvider"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "readingDirection"));

    if (!v37)
      goto LABEL_26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetLinkPresentationActivityItemProvider propertyProvider](self, "propertyProvider"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "readingDirection"));
    objc_msgSend(v21, "setHasSpineOnRight:", objc_msgSend(v28, "isEqualToString:", CFSTR("rtl")));
    goto LABEL_20;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetLinkPresentationActivityItemProvider propertyProvider](self, "propertyProvider"));
  v10 = (UIImage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "assetCover"));

  if (v10)
  {
    v11 = UIImagePNGRepresentation(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if (v12)
      v8 = objc_msgSend(objc_alloc((Class)LPImage), "initWithData:MIMEType:", v12, CFSTR("image/png"));
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }

  if (v8)
    goto LABEL_11;
LABEL_28:

  return v3;
}

- (BOOL)shouldShareActivityType:(id)a3
{
  return 1;
}

- (BOOL)supportsActivityType:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", UIActivityTypeMessage);
}

- (AEAssetActivityPropertyProvider)propertyProvider
{
  return self->_propertyProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyProvider, 0);
}

@end
