@implementation MusicModelGridItem

+ (id)__contentItem_KEY
{
  return CFSTR("MusicModelRelationshipGridItemContentItem");
}

+ (id)__titleText_KEY
{
  return CFSTR("MusicModelPropertyGridItemTitleText");
}

+ (id)__subtitleText_KEY
{
  return CFSTR("MusicModelPropertyGridItemSubtitleText");
}

+ (id)__overlayTitleText_KEY
{
  return CFSTR("MusicModelPropertyGridItemOverlayTitleText");
}

+ (id)__overlaySubtitleText_KEY
{
  return CFSTR("MusicModelPropertyGridItemOverlaySubtitleText");
}

+ (id)__descriptionText_KEY
{
  return CFSTR("MusicModelPropertyGridItemDescriptionText");
}

+ (id)__headlineText_KEY
{
  return CFSTR("MusicModelPropertyGridItemHeadlineText");
}

+ (id)__headlineColor_KEY
{
  return CFSTR("MusicModelPropertyGridItemHeadlineColor");
}

+ (id)__buttonText_KEY
{
  return CFSTR("MusicModelPropertyGridItemButtonText");
}

+ (id)__backgroundArtworkCatalogBlock_KEY
{
  return CFSTR("MusicModelPropertyGridItemBackgroundArtwork");
}

+ (id)__editorialArtworkCatalogBlock_KEY
{
  return CFSTR("MusicModelPropertyGridItemEditorialArtwork");
}

+ (id)__videoBackgroundArtworkCatalogBlock_KEY
{
  return CFSTR("MusicModelPropertyGridItemVideoBackgroundArtwork");
}

+ (id)__accessorySocialPersons_KEY
{
  return CFSTR("MusicModelPropertyGridItemAccessorySocialPersons");
}

- (id)backgroundArtworkCatalog
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = objc_claimAutoreleasedReturnValue(-[MusicModelGridItem backgroundArtworkCatalogBlock](self, "backgroundArtworkCatalogBlock"));
  v4 = (void *)v3;
  if (v3)
  {
    v5 = (*(uint64_t (**)(uint64_t, MusicModelGridItem *))(v3 + 16))(v3, self);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)editorialArtworkCatalog
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = objc_claimAutoreleasedReturnValue(-[MusicModelGridItem editorialArtworkCatalogBlock](self, "editorialArtworkCatalogBlock"));
  v4 = (void *)v3;
  if (v3)
  {
    v5 = (*(uint64_t (**)(uint64_t, MusicModelGridItem *))(v3 + 16))(v3, self);
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

  v3 = objc_claimAutoreleasedReturnValue(-[MusicModelGridItem videoBackgroundArtworkCatalogBlock](self, "videoBackgroundArtworkCatalogBlock"));
  v4 = (void *)v3;
  if (v3)
  {
    v5 = (*(uint64_t (**)(uint64_t, MusicModelGridItem *))(v3 + 16))(v3, self);
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
    v7 = CFSTR("MusicModelRelationshipGridItemContentItem");
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
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MusicModelGridItem contentItem](self, "contentItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "relationships"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("MusicModelRelationshipGridItemContentItem")));
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

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MusicModelGridItem contentItem](self, "contentItem"));
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
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MusicModelGridItem identifiers](self, "identifiers"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __79__MusicModelGridItem_objectWithStoreLibraryPersonalizationRelativeModelObject___block_invoke;
  v9[3] = &unk_1339A38;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  v7 = -[MusicModelGridItem copyWithIdentifiers:block:](self, "copyWithIdentifiers:block:", v5, v9);

  return v7;
}

void __79__MusicModelGridItem_objectWithStoreLibraryPersonalizationRelativeModelObject___block_invoke(uint64_t a1, void *a2)
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
  id v4;
  uint64_t v5;
  BOOL v6;
  _QWORD v8[4];
  id v9;
  MusicModelGridItem *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v5 = objc_opt_class(MusicModelGridItem);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __30__MusicModelGridItem_isEqual___block_invoke;
    v8[3] = &unk_1339A60;
    v10 = self;
    v11 = &v12;
    v9 = v4;
    +[MPModelObject performWithoutEnforcement:](MPModelObject, "performWithoutEnforcement:", v8);
    v6 = *((_BYTE *)v13 + 24) != 0;

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __30__MusicModelGridItem_isEqual___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  char v56;
  id v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  char v65;
  void *v66;
  void *v67;
  char v68;
  void *v69;
  void *v70;
  unsigned __int8 v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;

  v75 = *(id *)(a1 + 32);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "contentItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "identifiers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "contentItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifiers"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "intersectsSet:", v5);

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v6 + 24))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "contentItem"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "innerObject"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifiers"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "contentItem"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "innerObject"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifiers"));
    if (v9 == v12)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
    else
    {
      v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "contentItem"));
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "innerObject"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "identifiers"));
      v74 = v7;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "contentItem"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "innerObject"));
      v16 = v9;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifiers"));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v13, "intersectsSet:", v17);

      v9 = v16;
      v7 = v74;

    }
  }
  else
  {
    *(_BYTE *)(v6 + 24) = 0;
  }
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v18 + 24))
  {
    v19 = *(void **)(a1 + 40);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "contentItem"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "innerObject"));
    LOBYTE(v19) = objc_msgSend(v19, "isFavoritedModelObject:", v21);
    v22 = *(void **)(a1 + 40);
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "contentItem"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "innerObject"));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v19 ^ objc_msgSend(v22, "isFavoritedModelObject:", v24) ^ 1;

  }
  else
  {
    *(_BYTE *)(v18 + 24) = 0;
  }
  v25 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v25 + 24))
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "titleText"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "titleText"));
    if (v26 == v27)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
    else
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "titleText"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "titleText"));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v28, "isEqualToString:", v29);

    }
  }
  else
  {
    *(_BYTE *)(v25 + 24) = 0;
  }
  v30 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v30 + 24))
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "subtitleText"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "subtitleText"));
    if (v31 == v32)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
    else
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "subtitleText"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "subtitleText"));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v33, "isEqualToString:", v34);

    }
  }
  else
  {
    *(_BYTE *)(v30 + 24) = 0;
  }
  v35 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v35 + 24))
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "overlayTitleText"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "overlayTitleText"));
    if (v36 == v37)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
    else
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "overlayTitleText"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "overlayTitleText"));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v38, "isEqualToString:", v39);

    }
  }
  else
  {
    *(_BYTE *)(v35 + 24) = 0;
  }
  v40 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v40 + 24))
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "overlaySubtitleText"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "overlaySubtitleText"));
    if (v41 == v42)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
    else
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "overlaySubtitleText"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "overlaySubtitleText"));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v43, "isEqualToString:", v44);

    }
  }
  else
  {
    *(_BYTE *)(v40 + 24) = 0;
  }
  v45 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v45 + 24))
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "descriptionText"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "descriptionText"));
    if (v46 == v47)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
    else
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "descriptionText"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "descriptionText"));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v48, "isEqualToString:", v49);

    }
  }
  else
  {
    *(_BYTE *)(v45 + 24) = 0;
  }
  v50 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v50 + 24))
  {
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "headlineText"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "headlineText"));
    if (v51 == v52)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
    else
    {
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "headlineText"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "headlineText"));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v53, "isEqualToString:", v54);

    }
  }
  else
  {
    *(_BYTE *)(v50 + 24) = 0;
  }
  v55 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v56 = *(_BYTE *)(v55 + 24);
  if (v56)
  {
    v57 = objc_msgSend(*(id *)(a1 + 40), "headlineColor");
    v56 = v57 == objc_msgSend(v75, "headlineColor");
    v55 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  }
  *(_BYTE *)(v55 + 24) = v56;
  v58 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v58 + 24))
  {
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "buttonText"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "buttonText"));
    if (v59 == v60)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
    else
    {
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "buttonText"));
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "buttonText"));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v61, "isEqualToString:", v62);

    }
  }
  else
  {
    *(_BYTE *)(v58 + 24) = 0;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "backgroundArtworkCatalog"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "backgroundArtworkCatalog"));
    v65 = v63 == v64 ? 1 : objc_msgSend(v63, "isEqual:", v64);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v65;

    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "editorialArtworkCatalog"));
      v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "editorialArtworkCatalog"));
      v68 = v66 == v67 ? 1 : objc_msgSend(v66, "isEqual:", v67);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v68;

      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      {
        v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "videoBackgroundArtworkCatalog"));
        v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "videoBackgroundArtworkCatalog"));
        if (v69 == v70)
          v71 = 1;
        else
          v71 = objc_msgSend(v69, "isEqual:", v70);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v71;

      }
    }
  }

}

- (BOOL)isFavoritedModelObject:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;

  v3 = a3;
  v4 = objc_opt_class(MPModelSong);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0
    || (v5 = objc_opt_class(MPModelAlbum), (objc_opt_isKindOfClass(v3, v5) & 1) != 0)
    || (v6 = objc_opt_class(MPModelPlaylist), (objc_opt_isKindOfClass(v3, v6) & 1) != 0)
    || (v7 = objc_opt_class(MPModelArtist), (objc_opt_isKindOfClass(v3, v7) & 1) != 0))
  {
    v8 = objc_msgSend(v3, "isFavorite");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)storeContentItemObject
{
  return sub_5CCE40(self, (uint64_t)a2, (SEL *)&selRef_contentItem);
}

- (id)storeContentItemObjectPropertiesFor:(id)a3
{
  id v4;
  MusicModelGridItem *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_5CCEA4(v4, MusicModelRelationshipGridItemContentItem);

  return v6;
}

- (id)innermostModelObject
{
  id v1;
  id v2;
  void *v3;
  id v4;

  v1 = a1;
  v2 = objc_msgSend(v1, "contentItem");
  if (v2)
  {
    v3 = v2;
    v4 = objc_msgSend(v2, "innermostModelObject");

    v1 = v4;
  }
  return v1;
}

@end
