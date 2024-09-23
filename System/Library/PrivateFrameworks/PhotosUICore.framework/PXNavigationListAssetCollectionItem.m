@implementation PXNavigationListAssetCollectionItem

- (id)viewControllerForCollectionWithGridPresentation:(id)a3 existingAssetsFetchResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  if (viewControllerForCollectionWithGridPresentation_existingAssetsFetchResult__onceToken != -1)
    dispatch_once(&viewControllerForCollectionWithGridPresentation_existingAssetsFetchResult__onceToken, &__block_literal_global_91463);
  -[PXNavigationListDisplayAssetCollectionItem collection](self, "collection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXNavigationListItem identifier](self, "identifier");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9
    && (v10 = (void *)v9,
        v11 = viewControllerForCollectionWithGridPresentation_existingAssetsFetchResult__rootIdentifiers,
        -[PXNavigationListItem identifier](self, "identifier"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        LOBYTE(v11) = objc_msgSend((id)v11, "containsObject:", v12),
        v12,
        v10,
        (v11 & 1) != 0))
  {
    v13 = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v7;
    else
      v14 = 0;
    objc_msgSend(v6, "createViewControllerForAssetCollection:existingAssetsFetchResult:", v8, v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)cpAnalyticsEventName
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  __CFString **v5;
  __CFString *v6;

  -[PXNavigationListDisplayAssetCollectionItem collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "assetCollectionType");
  v4 = objc_msgSend(v2, "assetCollectionSubtype");
  v5 = PXAnalyticsEventNavigationListMediaTypesVideos;
  switch(v4)
  {
    case 201:
      v5 = PXAnalyticsEventNavigationListMediaTypesPanoramas;
      goto LABEL_21;
    case 202:
      goto LABEL_21;
    case 203:
      v5 = PXAnalyticsEventNavigationListFavorites;
      goto LABEL_21;
    case 204:
      v5 = PXAnalyticsEventNavigationListMediaTypesTimelapses;
      goto LABEL_21;
    case 205:
      v5 = PXAnalyticsEventNavigationListHidden;
      goto LABEL_21;
    case 206:
    case 209:
    case 216:
    case 217:
    case 218:
      goto LABEL_6;
    case 207:
      v5 = PXAnalyticsEventNavigationListMediaTypesBursts;
      goto LABEL_21;
    case 208:
      v5 = PXAnalyticsEventNavigationListMediaTypesSlomoVideos;
      goto LABEL_21;
    case 210:
      v5 = PXAnalyticsEventNavigationListMediaTypesSelfPortraits;
      goto LABEL_21;
    case 211:
      v5 = PXAnalyticsEventNavigationListMediaTypesScreenshots;
      goto LABEL_21;
    case 212:
      v5 = PXAnalyticsEventNavigationListMediaTypesDepthEffect;
      goto LABEL_21;
    case 213:
      v5 = PXAnalyticsEventNavigationListMediaTypesLivePhotos;
      goto LABEL_21;
    case 214:
      v5 = PXAnalyticsEventNavigationListMediaTypesAnimated;
      goto LABEL_21;
    case 215:
      v5 = PXAnalyticsEventNavigationListMediaTypesLongExposures;
      goto LABEL_21;
    case 219:
      v5 = PXAnalyticsEventNavigationListMediaTypesSpatial;
      goto LABEL_21;
    default:
      if (v4 == 1000000201)
      {
        v5 = PXAnalyticsEventNavigationListTrashBin;
        goto LABEL_21;
      }
      if (v4 == 1000000203)
      {
        v5 = PXAnalyticsEventNavigationListPlaces;
LABEL_21:
        v6 = *v5;
        goto LABEL_22;
      }
LABEL_6:
      if (v3 == 9)
      {
        v5 = PXAnalyticsEventNavigationListImports;
        goto LABEL_21;
      }
      v6 = 0;
      if (v4 > 1000000205)
      {
        v5 = PXAnalyticsEventNavigationListRecentlyEdited;
        switch(v4)
        {
          case 1000000206:
            goto LABEL_21;
          case 1000000207:
            v5 = PXAnalyticsEventNavigationListMediaTypesScreenRecordings;
            goto LABEL_21;
          case 1000000208:
          case 1000000209:
          case 1000000210:
            goto LABEL_22;
          case 1000000211:
            v5 = PXAnalyticsEventNavigationListMediaTypesProRes;
            goto LABEL_21;
          case 1000000212:
            v5 = PXAnalyticsEventNavigationListLibraryDuplicates;
            goto LABEL_21;
          default:
            if (v4 != 1000000219)
              goto LABEL_22;
            v5 = PXAnalyticsEventNavigationListRecovered;
            break;
        }
        goto LABEL_21;
      }
      if (v4 == 217)
      {
        v5 = PXAnalyticsEventNavigationListMediaTypesRAW;
        goto LABEL_21;
      }
      if (v4 == 218)
      {
        v5 = PXAnalyticsEventNavigationListMediaTypesCinematicVideos;
        goto LABEL_21;
      }
LABEL_22:

      return v6;
  }
}

void __131__PXNavigationListAssetCollectionItem_GridPresentation__viewControllerForCollectionWithGridPresentation_existingAssetsFetchResult___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];

  v2[3] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("PXNavigationIdentifierLibrary");
  v2[1] = CFSTR("PXNavigationIdentifierForYou");
  v2[2] = CFSTR("PXNavigationIdentifierSearch");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)viewControllerForCollectionWithGridPresentation_existingAssetsFetchResult__rootIdentifiers;
  viewControllerForCollectionWithGridPresentation_existingAssetsFetchResult__rootIdentifiers = v0;

}

- (PXNavigationListAssetCollectionItem)initWithAssetCollection:(id)a3 itemCount:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  PXNavigationListAssetCollectionItem *v12;
  uint64_t v13;
  objc_super v15;

  v6 = a3;
  objc_msgSend(v6, "transientIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v6, "localIdentifier");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  objc_msgSend(v6, "localizedTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)PXNavigationListAssetCollectionItem;
  v12 = -[PXNavigationListDisplayAssetCollectionItem initWithIdentifier:title:displayAssetCollection:itemCount:](&v15, sel_initWithIdentifier_title_displayAssetCollection_itemCount_, v10, v11, v6, a4);

  if (v12)
  {
    v13 = (objc_msgSend(v6, "isTransient") & 1) == 0
       && (objc_msgSend(v6, "collectionHasFixedOrder") & 1) == 0
       && -[PXNavigationListDisplayAssetCollectionItem isReorderable](v12, "isReorderable");
    -[PXNavigationListDisplayAssetCollectionItem setReorderable:](v12, "setReorderable:", v13);
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXNavigationListAssetCollectionItem;
  return -[PXNavigationListDisplayAssetCollectionItem copyWithZone:](&v4, sel_copyWithZone_, a3);
}

- (BOOL)isDraggable
{
  unsigned int v4;
  void *v5;
  BOOL v6;
  void *v8;
  objc_class *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PXNavigationListAssetCollectionItem;
  v4 = -[PXNavigationListDisplayAssetCollectionItem isDraggable](&v13, sel_isDraggable);
  -[PXNavigationListDisplayAssetCollectionItem collection](self, "collection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (!v4)
        goto LABEL_5;
      goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "px_descriptionForAssertionMessage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNavigationListItem.m"), 446, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.collection"), v10, v12);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNavigationListItem.m"), 446, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.collection"), v10);
  }

  if (!v4)
    goto LABEL_5;
LABEL_4:
  if ((objc_msgSend(v5, "isTransient") & 1) == 0)
  {
    v6 = -[PXNavigationListItem lockState](self, "lockState") != 1;
    goto LABEL_7;
  }
LABEL_5:
  v6 = 0;
LABEL_7:

  return v6;
}

- (id)accessoryTitle
{
  void *v3;
  char v4;
  objc_super v6;

  -[PXNavigationListDisplayAssetCollectionItem collection](self, "collection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "px_containsPrivateContent");

  if ((v4 & 1) != 0)
    return CFSTR(" ");
  v6.receiver = self;
  v6.super_class = (Class)PXNavigationListAssetCollectionItem;
  -[PXNavigationListItem accessoryTitle](&v6, sel_accessoryTitle);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)accessoryGlyphImageName
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXNavigationListAssetCollectionItem;
  -[PXNavigationListItem accessoryGlyphImageName](&v7, sel_accessoryGlyphImageName);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PXNavigationListItem lockState](self, "lockState");
  if (v4 == 1)
  {
    v5 = CFSTR("lock.fill");
    goto LABEL_5;
  }
  if (v4 == 2)
  {
    v5 = CFSTR("lock.open.fill");
LABEL_5:

    v3 = (void *)v5;
  }
  return v3;
}

@end
