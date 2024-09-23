@implementation AEAnnotationActivityItemProviderSource

+ (unint64_t)citationWordCountLimit
{
  return 200;
}

+ (id)truncatedAnnotationSelectedText:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "annotationSelectedText"));
  v11 = 0;
  objc_msgSend(v4, "tokenCountWithEnumerationOptions:maxTokenCount:outLimitLength:", 3, objc_msgSend(a1, "citationWordCountLimit"), &v11);
  v5 = v11;
  v6 = IMCommonCoreBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("[\\U2026]"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByTruncatingToLength:options:truncationString:", v5, 3, v8));

  return v9;
}

+ (id)activityItemProviderSourceWithAnnotations:(id)a3 propertySource:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)a1), "initWithAnnotations:propertySource:", v7, v6);

  return v8;
}

- (AEAnnotationActivityItemProviderSource)initWithAnnotations:(id)a3 propertySource:(id)a4
{
  id v7;
  AEAnnotationActivityItemProviderSource *v8;
  AEAnnotationActivityItemProviderSource *v9;

  v7 = a3;
  v8 = -[AEAssetActivityItemProviderSource initWithPropertySource:](self, "initWithPropertySource:", a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_annotations, a3);

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  objc_storeWeak((id *)&self->_paginationDataSource, 0);
  v3.receiver = self;
  v3.super_class = (Class)AEAnnotationActivityItemProviderSource;
  -[AEAnnotationActivityItemProviderSource dealloc](&v3, "dealloc");
}

- (id)copyrightCitation
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AEAnnotationActivityItemProviderSource;
  v2 = -[AEAssetActivityItemProviderSource citation](&v9, "citation");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = IMCommonCoreBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("This material may be protected by copyright."), &stru_296430, CFSTR("BCCommonCoreLocalizable")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("\n%@"), v6));

  return v7;
}

- (id)chapterTitleForAnnotation:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if ((objc_opt_respondsToSelector(v4, "chapterTitle") & 1) == 0
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "chapterTitle"))) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationActivityItemProviderSource paginationDataSource](self, "paginationDataSource"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "chapterTitleForAnnotation:", v4));

  }
  return v5;
}

- (id)text
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationActivityItemProviderSource annotations](self, "annotations"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "truncatedAnnotationSelectedText:", v5));

  return v6;
}

- (id)_generateLinkMetadata
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  unsigned int v8;
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
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
  UIImage *v37;
  NSData *v38;
  void *v39;
  void *v40;
  void *v41;
  __CFString *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  id v48;
  uint64_t v50;
  uint64_t v51;

  v3 = objc_alloc_init((Class)LPLinkMetadata);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProviderSource propertyProvider](self, "propertyProvider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "previewAssetCoverItemProvider"));

  if (v5)
  {
    v6 = objc_msgSend(objc_alloc((Class)LPImage), "initWithItemProvider:properties:placeholderImage:", v5, 0, 0);
    if (v6)
      goto LABEL_3;
LABEL_28:
    v48 = 0;
    goto LABEL_29;
  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProviderSource propertyProvider](self, "propertyProvider"));
  v37 = (UIImage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "assetCover"));

  if (v37)
  {
    v38 = UIImagePNGRepresentation(v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    if (v39)
      v6 = objc_msgSend(objc_alloc((Class)LPImage), "initWithData:MIMEType:", v39, CFSTR("image/png"));
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  if (!v6)
    goto LABEL_28;
LABEL_3:
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProviderSource propertyProvider](self, "propertyProvider"));
  v8 = objc_msgSend(v7, "isStoreAsset");

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProviderSource propertyProvider](self, "propertyProvider"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "storeURL"));

    objc_msgSend(v3, "setURL:", v10);
    objc_msgSend(v3, "setOriginalURL:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationActivityItemProviderSource annotations](self, "annotations"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));

    if ((objc_msgSend(v12, "annotationHasNote") & 1) == 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotationActivityItemProviderSource truncatedAnnotationSelectedText:](AEAnnotationActivityItemProviderSource, "truncatedAnnotationSelectedText:", v12));
      objc_msgSend(v3, "setSelectedText:", v13);

    }
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProviderSource propertyProvider](self, "propertyProvider"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "title"));
  objc_msgSend(v3, "setTitle:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "activeStoreAccount"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "ams_storefront"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProviderSource propertyProvider](self, "propertyProvider"));
  v20 = (uint64_t)objc_msgSend(v19, "assetType");

  if (v20 == 4 || v20 == 1)
  {
    v24 = objc_alloc_init((Class)LPiTunesMediaBookMetadata);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProviderSource propertyProvider](self, "propertyProvider"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "title"));
    objc_msgSend(v24, "setName:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProviderSource propertyProvider](self, "propertyProvider"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "author"));
    objc_msgSend(v24, "setAuthor:", v28);

    objc_msgSend(v24, "setArtwork:", v6);
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProviderSource propertyProvider](self, "propertyProvider"));
    LODWORD(v28) = objc_msgSend(v29, "isStoreAsset");

    if ((_DWORD)v28)
    {
      objc_msgSend(v24, "setStoreFrontIdentifier:", v18);
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProviderSource propertyProvider](self, "propertyProvider"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "storeID"));
      objc_msgSend(v24, "setStoreIdentifier:", v31);

    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProviderSource propertyProvider](self, "propertyProvider"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "readingDirection"));

    if (v33)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProviderSource propertyProvider](self, "propertyProvider"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "readingDirection"));
      objc_msgSend(v24, "setHasSpineOnRight:", objc_msgSend(v35, "isEqualToString:", CFSTR("rtl")));

    }
  }
  else
  {
    if ((v20 & 0xFFFFFFFFFFFFFFFELL) != 2)
    {
      BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AssetsEngine/AEServices/Sharing/Private/AEAnnotationActivityItemProviderSource.m", 170, (uint64_t)"-[AEAnnotationActivityItemProviderSource _generateLinkMetadata]", (uint64_t)"NO", CFSTR("Trying to show link preview for unsupported asset type"), v21, v22, v23, v50);
      goto LABEL_22;
    }
    v24 = objc_alloc_init((Class)LPFileMetadata);
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProviderSource propertyProvider](self, "propertyProvider"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "title"));
    objc_msgSend(v24, "setName:", v41);

    v42 = BCAssetUTIForContentType(v20);
    v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
    objc_msgSend(v24, "setType:", v43);

    v44 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProviderSource propertyProvider](self, "propertyProvider"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "bookURL"));
    v51 = 0;
    v46 = objc_msgSend(v45, "bu_fileAllocatedSizeWithError:", &v51);
    v47 = v51;

    if (!v47 && v46)
      objc_msgSend(v24, "setSize:", v46);
    objc_msgSend(v24, "setThumbnail:", v6);
  }
  objc_msgSend(v3, "setSpecialization:", v24);

LABEL_22:
  v48 = v3;

LABEL_29:
  return v48;
}

- (NSArray)annotations
{
  return self->_annotations;
}

- (AEAnnotationPaginationDataSource)paginationDataSource
{
  return (AEAnnotationPaginationDataSource *)objc_loadWeakRetained((id *)&self->_paginationDataSource);
}

- (void)setPaginationDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_paginationDataSource, a3);
}

- (BOOL)areCitationAllowed
{
  return self->_citationsAllowed;
}

- (void)setCitationsAllowed:(BOOL)a3
{
  self->_citationsAllowed = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_paginationDataSource);
  objc_storeStrong((id *)&self->_annotations, 0);
}

@end
