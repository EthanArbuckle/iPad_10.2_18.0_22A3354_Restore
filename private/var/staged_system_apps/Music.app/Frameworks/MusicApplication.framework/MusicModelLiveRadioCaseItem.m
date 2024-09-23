@implementation MusicModelLiveRadioCaseItem

+ (id)__contentItem_KEY
{
  return CFSTR("MusicModelRelationshipLiveRadioCaseItemContentItem");
}

+ (id)__headerTitleText_KEY
{
  return CFSTR("MusicModelPropertyLiveRadioCaseItemHeaderTitleText");
}

+ (id)__headerSubtitleText_KEY
{
  return CFSTR("MusicModelPropertyLiveRadioCaseItemHeaderSubtitleText");
}

+ (id)__accessoryButtonTitleText_KEY
{
  return CFSTR("MusicModelPropertyLiveRadioCaseItemAccessoryButtonTitleText");
}

+ (id)__headlineText_KEY
{
  return CFSTR("MusicModelPropertyLiveRadioCaseItemHeadlineText");
}

+ (id)__titleText_KEY
{
  return CFSTR("MusicModelPropertyLiveRadioCaseItemTitleText");
}

+ (id)__subtitleText_KEY
{
  return CFSTR("MusicModelPropertyLiveRadioCaseItemSubtitleText");
}

+ (id)__backgroundArtworkCatalogBlock_KEY
{
  return CFSTR("MusicModelPropertyLiveRadioCaseBackgroundArtwork");
}

+ (id)__videoBackgroundArtworkCatalogBlock_KEY
{
  return CFSTR("MusicModelPropertyLiveRadioCaseVideoBackgroundArtwork");
}

- (id)backgroundArtworkCatalog
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = objc_claimAutoreleasedReturnValue(-[MusicModelLiveRadioCaseItem backgroundArtworkCatalogBlock](self, "backgroundArtworkCatalogBlock"));
  v4 = (void *)v3;
  if (v3)
  {
    v5 = (*(uint64_t (**)(uint64_t, MusicModelLiveRadioCaseItem *))(v3 + 16))(v3, self);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)videoBackgroundArtworkCatalog
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = objc_claimAutoreleasedReturnValue(-[MusicModelLiveRadioCaseItem videoBackgroundArtworkCatalogBlock](self, "videoBackgroundArtworkCatalogBlock"));
  v4 = (void *)v3;
  if (v3)
  {
    v5 = (*(uint64_t (**)(uint64_t, MusicModelLiveRadioCaseItem *))(v3 + 16))(v3, self);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)requiredStoreLibraryPersonalizationProperties
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  const __CFString *v7;
  void *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelStoreBrowseContentItem requiredStoreLibraryPersonalizationProperties](MPModelStoreBrowseContentItem, "requiredStoreLibraryPersonalizationProperties"));
  if (v2)
  {
    v3 = objc_alloc((Class)MPPropertySet);
    v7 = CFSTR("MusicModelRelationshipLiveRadioCaseItemContentItem");
    v8 = v2;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
    v5 = objc_msgSend(v3, "initWithProperties:relationships:", &__NSArray0__struct, v4);

  }
  else
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(+[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet"));
  }

  return v5;
}

- (id)personalizationScopedPropertiesForProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MusicModelLiveRadioCaseItem contentItem](self, "contentItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "relationships"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("MusicModelRelationshipLiveRadioCaseItemContentItem")));
  v8 = v7;
  if (!v7)
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "personalizationScopedPropertiesForProperties:", v8));
  v10 = v9;
  if (v9)
    v11 = v9;
  else
    v11 = (id)objc_claimAutoreleasedReturnValue(+[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet"));
  v12 = v11;

  if (!v7)
  return v12;
}

- (id)relativeModelObjectForStoreLibraryPersonalization
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MusicModelLiveRadioCaseItem contentItem](self, "contentItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "relativeModelObjectForStoreLibraryPersonalization"));

  return v3;
}

- (id)objectWithStoreLibraryPersonalizationRelativeModelObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MusicModelLiveRadioCaseItem identifiers](self, "identifiers"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __88__MusicModelLiveRadioCaseItem_objectWithStoreLibraryPersonalizationRelativeModelObject___block_invoke;
  v9[3] = &unk_13396C0;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  v7 = -[MusicModelLiveRadioCaseItem copyWithIdentifiers:block:](self, "copyWithIdentifiers:block:", v5, v9);

  return v7;
}

void __88__MusicModelLiveRadioCaseItem_objectWithStoreLibraryPersonalizationRelativeModelObject___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contentItem"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectWithStoreLibraryPersonalizationRelativeModelObject:", *(_QWORD *)(a1 + 40)));

  objc_msgSend(v4, "setContentItem:", v6);
}

- (BOOL)isEqual:(id)a3
{
  MusicModelLiveRadioCaseItem *v4;
  uint64_t v5;
  MusicModelLiveRadioCaseItem *v6;
  id v7;
  id v8;
  unsigned int v9;
  BOOL v10;
  id v11;
  id v12;
  unsigned int v13;
  id v14;
  id v15;
  unsigned int v16;
  id v17;
  id v18;
  void *v19;
  unsigned int v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  unsigned int v25;
  id v26;
  id v27;
  void *v28;
  unsigned int v29;
  id v30;
  id v31;
  void *v32;
  unsigned int v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  unsigned int v39;
  void *v40;
  void *v41;
  void *v42;
  unsigned __int8 v43;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;

  v4 = (MusicModelLiveRadioCaseItem *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    v5 = objc_opt_class(MusicModelLiveRadioCaseItem);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      v7 = (id)objc_claimAutoreleasedReturnValue(-[MusicModelLiveRadioCaseItem contentItem](self, "contentItem"));
      v8 = (id)objc_claimAutoreleasedReturnValue(-[MusicModelLiveRadioCaseItem contentItem](v6, "contentItem"));
      if (v7 == v8)
      {

      }
      else
      {
        v9 = objc_msgSend(v7, "isEqual:", v8);

        if (!v9)
        {
          v10 = 0;
LABEL_48:

          goto LABEL_49;
        }
      }
      v11 = (id)objc_claimAutoreleasedReturnValue(-[MusicModelLiveRadioCaseItem headerTitleText](self, "headerTitleText"));
      v12 = (id)objc_claimAutoreleasedReturnValue(-[MusicModelLiveRadioCaseItem headerTitleText](v6, "headerTitleText"));
      if (v11 == v12)
      {

      }
      else
      {
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if (!v13)
        {
          v10 = 0;
LABEL_47:

          goto LABEL_48;
        }
      }
      v14 = (id)objc_claimAutoreleasedReturnValue(-[MusicModelLiveRadioCaseItem headerSubtitleText](self, "headerSubtitleText"));
      v15 = (id)objc_claimAutoreleasedReturnValue(-[MusicModelLiveRadioCaseItem headerSubtitleText](v6, "headerSubtitleText"));
      v56 = v14;
      if (v14 == v15)
      {

      }
      else
      {
        v16 = objc_msgSend(v14, "isEqual:", v15);

        if (!v16)
        {
          v10 = 0;
LABEL_46:

          goto LABEL_47;
        }
      }
      v17 = (id)objc_claimAutoreleasedReturnValue(-[MusicModelLiveRadioCaseItem accessoryButtonTitleText](self, "accessoryButtonTitleText"));
      v18 = (id)objc_claimAutoreleasedReturnValue(-[MusicModelLiveRadioCaseItem accessoryButtonTitleText](v6, "accessoryButtonTitleText"));
      v54 = v17;
      v55 = v18;
      if (v17 == v18)
      {

      }
      else
      {
        v19 = v18;
        v20 = objc_msgSend(v17, "isEqual:", v18);

        if (!v20)
        {
          v10 = 0;
          v21 = v54;
LABEL_45:

          goto LABEL_46;
        }
      }
      v22 = (id)objc_claimAutoreleasedReturnValue(-[MusicModelLiveRadioCaseItem headlineText](self, "headlineText"));
      v23 = (id)objc_claimAutoreleasedReturnValue(-[MusicModelLiveRadioCaseItem headlineText](v6, "headlineText"));
      v51 = v23;
      v52 = v22;
      if (v22 == v23)
      {

      }
      else
      {
        v24 = v23;
        v25 = objc_msgSend(v22, "isEqual:", v23);

        if (!v25)
        {
          v10 = 0;
          v21 = v54;
LABEL_44:

          goto LABEL_45;
        }
      }
      v26 = (id)objc_claimAutoreleasedReturnValue(-[MusicModelLiveRadioCaseItem subtitleText](self, "subtitleText"));
      v27 = (id)objc_claimAutoreleasedReturnValue(-[MusicModelLiveRadioCaseItem subtitleText](v6, "subtitleText"));
      v53 = v26;
      v50 = v27;
      if (v26 == v27)
      {

      }
      else
      {
        v28 = v27;
        v29 = objc_msgSend(v53, "isEqual:", v27);

        if (!v29)
        {
          v10 = 0;
          v21 = v54;
LABEL_43:

          goto LABEL_44;
        }
      }
      v30 = (id)objc_claimAutoreleasedReturnValue(-[MusicModelLiveRadioCaseItem titleText](self, "titleText"));
      v31 = (id)objc_claimAutoreleasedReturnValue(-[MusicModelLiveRadioCaseItem titleText](v6, "titleText"));
      v48 = v31;
      v49 = v30;
      if (v30 == v31)
      {

      }
      else
      {
        v32 = v31;
        v33 = objc_msgSend(v30, "isEqual:", v31);

        if (!v33)
        {
          v10 = 0;
          v21 = v54;
LABEL_42:

          goto LABEL_43;
        }
      }
      v34 = (id)objc_claimAutoreleasedReturnValue(-[MusicModelLiveRadioCaseItem backgroundArtworkCatalog](self, "backgroundArtworkCatalog"));
      v35 = (id)objc_claimAutoreleasedReturnValue(-[MusicModelLiveRadioCaseItem backgroundArtworkCatalog](v6, "backgroundArtworkCatalog"));
      v47 = v35;
      if (v34 == v35)
      {

      }
      else
      {
        v36 = v35;
        v37 = v34;
        v45 = v34;
        v38 = v36;
        v39 = objc_msgSend(v37, "isEqual:", v36);

        v34 = v45;
        if (!v39)
        {
          v10 = 0;
          v21 = v54;
LABEL_41:

          goto LABEL_42;
        }
      }
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[MusicModelLiveRadioCaseItem videoBackgroundArtworkCatalog](self, "videoBackgroundArtworkCatalog"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[MusicModelLiveRadioCaseItem videoBackgroundArtworkCatalog](v6, "videoBackgroundArtworkCatalog"));
      v46 = v40;
      if (v40 == v41)
      {
        v10 = 1;
      }
      else
      {
        v42 = v41;
        v43 = objc_msgSend(v40, "isEqual:", v41);
        v41 = v42;
        v10 = v43;
      }
      v21 = v54;

      goto LABEL_41;
    }
    v10 = 0;
  }
LABEL_49:

  return v10;
}

@end
