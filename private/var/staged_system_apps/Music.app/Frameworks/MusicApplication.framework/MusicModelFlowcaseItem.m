@implementation MusicModelFlowcaseItem

+ (id)__contentItem_KEY
{
  return CFSTR("MusicModelRelationshipFlowcaseItemContentItem");
}

+ (id)__descriptionTitleText_KEY
{
  return CFSTR("MusicModelPropertyFlowcaseItemDescriptionTitleText");
}

+ (id)__descriptionText_KEY
{
  return CFSTR("MusicModelPropertyFlowcaseItemDescriptionText");
}

+ (id)__headlineText_KEY
{
  return CFSTR("MusicModelPropertyFlowcaseItemHeadlineText");
}

+ (id)__subtitleText_KEY
{
  return CFSTR("MusicModelPropertyFlowcaseItemSubtitleText");
}

+ (id)__titleText_KEY
{
  return CFSTR("MusicModelPropertyFlowcaseItemTitleText");
}

+ (id)__thumbnailHorizontalAlignment_KEY
{
  return CFSTR("MusicModelPropertyFlowcaseItemThumbnailHorizontalAlignment");
}

+ (id)__backgroundArtworkCatalogBlock_KEY
{
  return CFSTR("MusicModelPropertyFlowcaseItemBackgroundArtwork");
}

+ (id)__thumbnailArtworkCatalogBlock_KEY
{
  return CFSTR("MusicModelPropertyFlowcaseItemThumbnailArtwork");
}

- (id)backgroundArtworkCatalog
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = objc_claimAutoreleasedReturnValue(-[MusicModelFlowcaseItem backgroundArtworkCatalogBlock](self, "backgroundArtworkCatalogBlock"));
  v4 = (void *)v3;
  if (v3)
  {
    v5 = (*(uint64_t (**)(uint64_t, MusicModelFlowcaseItem *))(v3 + 16))(v3, self);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)thumbnailArtworkCatalog
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = objc_claimAutoreleasedReturnValue(-[MusicModelFlowcaseItem thumbnailArtworkCatalogBlock](self, "thumbnailArtworkCatalogBlock"));
  v4 = (void *)v3;
  if (v3)
  {
    v5 = (*(uint64_t (**)(uint64_t, MusicModelFlowcaseItem *))(v3 + 16))(v3, self);
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
    v7 = CFSTR("MusicModelRelationshipFlowcaseItemContentItem");
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
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MusicModelFlowcaseItem contentItem](self, "contentItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "relationships"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("MusicModelRelationshipFlowcaseItemContentItem")));
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

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MusicModelFlowcaseItem contentItem](self, "contentItem"));
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
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MusicModelFlowcaseItem identifiers](self, "identifiers"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __83__MusicModelFlowcaseItem_objectWithStoreLibraryPersonalizationRelativeModelObject___block_invoke;
  v9[3] = &unk_1339E70;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  v7 = -[MusicModelFlowcaseItem copyWithIdentifiers:block:](self, "copyWithIdentifiers:block:", v5, v9);

  return v7;
}

void __83__MusicModelFlowcaseItem_objectWithStoreLibraryPersonalizationRelativeModelObject___block_invoke(uint64_t a1, void *a2)
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

- (id)storeContentItemObject
{
  return sub_5CCE40(self, (uint64_t)a2, (SEL *)&selRef_contentItem);
}

- (id)storeContentItemObjectPropertiesFor:(id)a3
{
  id v4;
  MusicModelFlowcaseItem *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_5CCEA4(v4, MusicModelRelationshipFlowcaseItemContentItem);

  return v6;
}

@end
