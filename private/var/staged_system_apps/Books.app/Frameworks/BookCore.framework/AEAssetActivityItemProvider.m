@implementation AEAssetActivityItemProvider

- (AEAssetActivityItemProvider)initWithAnnotation:(id)a3 propertySource:(id)a4
{
  id v6;
  void *v7;
  AEAssetActivityItemProvider *v8;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", a3));
  v8 = -[AEAssetActivityItemProvider initWithAnnotations:propertySource:](self, "initWithAnnotations:propertySource:", v7, v6);

  if (v8)
    v8->_shareType = 0;

  return v8;
}

- (AEAssetActivityItemProvider)initWithAnnotations:(id)a3 propertySource:(id)a4
{
  id v7;
  AEAssetActivityItemProvider *v8;
  AEAssetActivityItemProvider *v9;

  v7 = a3;
  v8 = -[AEAssetActivityItemProvider initWithPropertySource:](self, "initWithPropertySource:", a4);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_annotations, a3);
    v9->_shareType = 1;
  }

  return v9;
}

- (AEAssetActivityItemProvider)initWithPropertySource:(id)a3
{
  id v4;
  AEAssetActivityItemProvider *v5;
  id v6;
  id propertySource;

  v4 = a3;
  v5 = -[AEAssetActivityItemProvider init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    propertySource = v5->_propertySource;
    v5->_propertySource = v6;

    v5->_shareType = 2;
  }

  return v5;
}

- (void)dealloc
{
  id propertySource;
  objc_super v4;

  propertySource = self->_propertySource;
  self->_propertySource = 0;

  objc_storeWeak((id *)&self->_paginationDataSource, 0);
  v4.receiver = self;
  v4.super_class = (Class)AEAssetActivityItemProvider;
  -[AEAssetActivityItemProvider dealloc](&v4, "dealloc");
}

- (id)pasteboardString
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = -[AEAssetActivityItemProvider shareType](self, "shareType");
  if (v3 == 2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProvider propertySource](self, "propertySource"));
    v8 = objc_claimAutoreleasedReturnValue(+[AEAssetTextActivityItemProvider textItemWithPropertySource:](AEAssetTextActivityItemProvider, "textItemWithPropertySource:", v6));
    goto LABEL_7;
  }
  if (!v3 && -[AEAssetActivityItemProvider areCitationsAllowed](self, "areCitationsAllowed"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProvider annotations](self, "annotations"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProvider propertySource](self, "propertySource"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotationActivityItemProviderSource activityItemProviderSourceWithAnnotations:propertySource:](AEAnnotationTextActivityItemProvider, "activityItemProviderSourceWithAnnotations:propertySource:", v4, v5));

    objc_msgSend(v6, "setCitationsAllowed:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProvider paginationDataSource](self, "paginationDataSource"));
    objc_msgSend(v6, "setPaginationDataSource:", v7);

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activityViewController:itemForActivityType:", 0, UIActivityTypeCopyToPasteboard));
LABEL_7:
    v9 = (void *)v8;

    return v9;
  }
  v9 = 0;
  return v9;
}

- (id)expandedItemProviders
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  int64_t v6;
  AEAssetLinkPresentationActivityItemProvider *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  AEAnnotationLinkPresentationItemProvider *v11;
  AEAssetTextActivityItemProvider *v12;
  AEAssetNotesActivityItemProvider *v13;
  void *v14;
  void *v15;
  AEAssetURLActivityItemProvider *v16;
  void *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  AEAnnotationLinkPresentationItemProvider *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  AEAnnotationLinkPresentationItemProvider *v27;
  _QWORD v28[3];
  _QWORD v29[2];
  _QWORD v30[5];
  void *v31;

  v3 = -[AEAssetActivityItemProvider areCitationsAllowed](self, "areCitationsAllowed");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProvider propertySource](self, "propertySource"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProvider paginationDataSource](self, "paginationDataSource"));
  v6 = -[AEAssetActivityItemProvider shareType](self, "shareType");
  switch(v6)
  {
    case 2:
      v12 = -[AEAssetTextActivityItemProvider initWithDelegate:propertySource:]([AEAssetTextActivityItemProvider alloc], "initWithDelegate:propertySource:", self, v4);
      -[AEAssetActivityItemProvider setTextProvider:](self, "setTextProvider:", v12);

      v13 = -[AEAssetNotesActivityItemProvider initWithDelegate:propertySource:]([AEAssetNotesActivityItemProvider alloc], "initWithDelegate:propertySource:", self, v4);
      -[AEAssetActivityItemProvider setNotesProvider:](self, "setNotesProvider:", v13);

      v7 = -[AEAssetLinkPresentationActivityItemProvider initWithDelegate:propertySource:]([AEAssetLinkPresentationActivityItemProvider alloc], "initWithDelegate:propertySource:", self, v4);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProvider textProvider](self, "textProvider"));
      v28[0] = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProvider notesProvider](self, "notesProvider"));
      v28[1] = v15;
      v28[2] = v7;
      v11 = (AEAnnotationLinkPresentationItemProvider *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v28, 3));

      v16 = -[AEAssetURLActivityItemProvider initWithDelegate:propertySource:]([AEAssetURLActivityItemProvider alloc], "initWithDelegate:propertySource:", self, v4);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetBaseActivityItemProvider propertyProvider](v16, "propertyProvider"));
      if ((objc_msgSend(v17, "isStoreAsset") & 1) != 0)
      {

      }
      else
      {
        v19 = sub_119BC(v16, 0);

        if ((v19 & 1) == 0)
        {
LABEL_17:

          goto LABEL_18;
        }
      }
      -[AEAssetActivityItemProvider setUrlProvider:](self, "setUrlProvider:", v16);
      v18 = objc_claimAutoreleasedReturnValue(-[AEAnnotationLinkPresentationItemProvider arrayByAddingObject:](v11, "arrayByAddingObject:", v16));
      goto LABEL_13;
    case 1:
      v7 = (AEAssetLinkPresentationActivityItemProvider *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProvider annotations](self, "annotations"));
      v16 = (AEAssetURLActivityItemProvider *)objc_claimAutoreleasedReturnValue(+[AEAnnotationActivityItemProviderSource activityItemProviderSourceWithAnnotations:propertySource:](AEAnnotationGroupHTMLActivityItemProvider, "activityItemProviderSourceWithAnnotations:propertySource:", v7, v4));
      -[AEAssetURLActivityItemProvider setCitationsAllowed:](v16, "setCitationsAllowed:", v3);
      -[AEAssetURLActivityItemProvider setPaginationDataSource:](v16, "setPaginationDataSource:", v5);
      v11 = -[AEAnnotationActivityItemProviderSource initWithAnnotations:propertySource:]([AEAnnotationLinkPresentationItemProvider alloc], "initWithAnnotations:propertySource:", v7, v4);
      v29[0] = v16;
      v29[1] = v11;
      v18 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 2));
LABEL_13:
      v20 = v18;
LABEL_16:

      v11 = (AEAnnotationLinkPresentationItemProvider *)v20;
      goto LABEL_17;
    case 0:
      v7 = (AEAssetLinkPresentationActivityItemProvider *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProvider annotations](self, "annotations"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetLinkPresentationActivityItemProvider objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", 0));
      v9 = objc_msgSend(v8, "annotationHasNote");

      if (v3 | v9)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotationActivityItemProviderSource activityItemProviderSourceWithAnnotations:propertySource:](AEAnnotationGroupHTMLActivityItemProvider, "activityItemProviderSourceWithAnnotations:propertySource:", v7, v4));
        objc_msgSend(v10, "setCitationsAllowed:", v3);
        objc_msgSend(v10, "setPaginationDataSource:", v5);
        v31 = v10;
        v11 = (AEAnnotationLinkPresentationItemProvider *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v31, 1));

        if (!v3)
          goto LABEL_18;
      }
      else
      {
        v11 = (AEAnnotationLinkPresentationItemProvider *)&__NSArray0__struct;
        if (!v3)
        {
LABEL_18:

          goto LABEL_19;
        }
      }
      v16 = (AEAssetURLActivityItemProvider *)objc_claimAutoreleasedReturnValue(+[AEAnnotationActivityItemProviderSource activityItemProviderSourceWithAnnotations:propertySource:](AEAnnotationFacebookActivityItemProvider, "activityItemProviderSourceWithAnnotations:propertySource:", v7, v4));
      v21 = (AEAnnotationLinkPresentationItemProvider *)objc_claimAutoreleasedReturnValue(+[AEAnnotationActivityItemProviderSource activityItemProviderSourceWithAnnotations:propertySource:](AEAnnotationTwitterWeiboActivityItemProvider, "activityItemProviderSourceWithAnnotations:propertySource:", v7, v4));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotationActivityItemProviderSource activityItemProviderSourceWithAnnotations:propertySource:](AEAnnotationTextActivityItemProvider, "activityItemProviderSourceWithAnnotations:propertySource:", v7, v4));
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotationActivityItemProviderSource activityItemProviderSourceWithAnnotations:propertySource:](AEAnnotationAirDropTextActivityItemProvider, "activityItemProviderSourceWithAnnotations:propertySource:", v7, v4));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotationActivityItemProviderSource activityItemProviderSourceWithAnnotations:propertySource:](AEAnnotationGenericTextActivityItemProvider, "activityItemProviderSourceWithAnnotations:propertySource:", v7, v4));
      -[AEAssetURLActivityItemProvider setCitationsAllowed:](v16, "setCitationsAllowed:", 1);
      -[AEAnnotationActivityItemProviderSource setCitationsAllowed:](v21, "setCitationsAllowed:", 1);
      objc_msgSend(v22, "setCitationsAllowed:", 1);
      objc_msgSend(v23, "setCitationsAllowed:", 1);
      objc_msgSend(v24, "setCitationsAllowed:", 1);
      -[AEAssetURLActivityItemProvider setPaginationDataSource:](v16, "setPaginationDataSource:", v5);
      v27 = v21;
      -[AEAnnotationActivityItemProviderSource setPaginationDataSource:](v21, "setPaginationDataSource:", v5);
      objc_msgSend(v22, "setPaginationDataSource:", v5);
      objc_msgSend(v23, "setPaginationDataSource:", v5);
      objc_msgSend(v24, "setPaginationDataSource:", v5);
      v30[0] = v16;
      v30[1] = v21;
      v30[2] = v22;
      v30[3] = v23;
      v30[4] = v24;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 5));
      v20 = objc_claimAutoreleasedReturnValue(-[AEAnnotationLinkPresentationItemProvider arrayByAddingObjectsFromArray:](v11, "arrayByAddingObjectsFromArray:", v25));

      v11 = v27;
      goto LABEL_16;
  }
  v11 = (AEAnnotationLinkPresentationItemProvider *)&__NSArray0__struct;
LABEL_19:

  return v11;
}

- (BOOL)itemProviderSource:(id)a3 shouldShareActivityType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  unsigned int v11;
  int v12;
  id v13;
  id v14;
  id v15;
  char v16;
  char v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProvider notesProvider](self, "notesProvider"));
  v9 = objc_msgSend(v8, "supportsActivityType:", v7);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "propertyProvider"));
  v11 = objc_msgSend(v10, "isStoreAsset");

  v12 = sub_119BC(v6, v7);
  v13 = (id)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProvider textProvider](self, "textProvider"));

  if (v13 == v6)
  {
    if ((v11 | v12) == 1)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProvider urlProvider](self, "urlProvider"));
      v17 = v18 == 0;

    }
    else
    {
      v17 = 1;
    }
  }
  else
  {
    v14 = (id)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProvider urlProvider](self, "urlProvider"));

    if (v14 == v6)
    {
      if (v9)
        v17 = v12;
      else
        v17 = v11 | v12;
    }
    else
    {
      v15 = (id)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProvider notesProvider](self, "notesProvider"));

      if (v15 == v6)
        v16 = v9;
      else
        v16 = 0;
      v17 = v16 & v11;
    }
  }

  return v17;
}

- (NSArray)annotations
{
  return self->_annotations;
}

- (void)setAnnotations:(id)a3
{
  objc_storeStrong((id *)&self->_annotations, a3);
}

- (int64_t)shareType
{
  return self->_shareType;
}

- (void)setShareType:(int64_t)a3
{
  self->_shareType = a3;
}

- (id)propertySource
{
  return self->_propertySource;
}

- (void)setPropertySource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (AEAnnotationPaginationDataSource)paginationDataSource
{
  return (AEAnnotationPaginationDataSource *)objc_loadWeakRetained((id *)&self->_paginationDataSource);
}

- (void)setPaginationDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_paginationDataSource, a3);
}

- (BOOL)areCitationsAllowed
{
  return self->_citationsAllowed;
}

- (void)setCitationsAllowed:(BOOL)a3
{
  self->_citationsAllowed = a3;
}

- (AEAssetTextActivityItemProvider)textProvider
{
  return self->_textProvider;
}

- (void)setTextProvider:(id)a3
{
  objc_storeStrong((id *)&self->_textProvider, a3);
}

- (AEAssetURLActivityItemProvider)urlProvider
{
  return self->_urlProvider;
}

- (void)setUrlProvider:(id)a3
{
  objc_storeStrong((id *)&self->_urlProvider, a3);
}

- (AEAssetNotesActivityItemProvider)notesProvider
{
  return self->_notesProvider;
}

- (void)setNotesProvider:(id)a3
{
  objc_storeStrong((id *)&self->_notesProvider, a3);
}

- (NSString)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(id)a3
{
  objc_storeStrong((id *)&self->_activityType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_notesProvider, 0);
  objc_storeStrong((id *)&self->_urlProvider, 0);
  objc_storeStrong((id *)&self->_textProvider, 0);
  objc_destroyWeak((id *)&self->_paginationDataSource);
  objc_storeStrong(&self->_propertySource, 0);
  objc_storeStrong((id *)&self->_annotations, 0);
  objc_storeStrong((id *)&self->_contentProtected, 0);
}

@end
