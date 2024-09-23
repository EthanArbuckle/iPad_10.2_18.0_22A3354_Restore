@implementation HomeAnalyticsManager

+ (void)captureCuratedCollectionAction:(int)a3 withCollectionHandler:(id)a4 verticalIndex:(unint64_t)a5
{
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t buf[16];

  v6 = *(_QWORD *)&a3;
  v7 = a4;
  v8 = objc_opt_class(CuratedCollectionHandler);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "curatedCollectionIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v9, "muid")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a5));
    +[GEOAPPortal captureCuratedCollectionUserAction:target:value:publisherId:following:collectionId:collectionCategory:collectionCurrentlySaved:verticalIndex:horizontalIndex:placeCardType:possibleActions:impossibleActions:modules:](GEOAPPortal, "captureCuratedCollectionUserAction:target:value:publisherId:following:collectionId:collectionCategory:collectionCurrentlySaved:verticalIndex:horizontalIndex:placeCardType:possibleActions:impossibleActions:modules:", v6, 8, 0, 0, 0, v10, 0, &__kCFBooleanTrue, v11, 0, 0, 0, 0, 0);

  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: [collectionHandler isKindOfClass:CuratedCollectionHandler.class]", buf, 2u);
  }

}

+ (void)captureCuratedCollectionCarouselTapCollectionWithIdentifier:(id)a3 atIndex:(int64_t)a4 isSaved:(BOOL)a5
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;

  v5 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(a3, "muid")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v5));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  +[GEOAPPortal captureCuratedCollectionUserAction:target:value:publisherId:following:collectionId:collectionCategory:collectionCurrentlySaved:verticalIndex:horizontalIndex:placeCardType:possibleActions:impossibleActions:modules:](GEOAPPortal, "captureCuratedCollectionUserAction:target:value:publisherId:following:collectionId:collectionCategory:collectionCurrentlySaved:verticalIndex:horizontalIndex:placeCardType:possibleActions:impossibleActions:modules:", 2198, 8, 0, 0, 0, v9, 0, v7, 0, v8, 0, 0, 0, 0);

}

+ (void)_captureCuratedCollectionCarouselScrollAction:(int)a3
{
  +[GEOAPPortal captureCuratedCollectionUserAction:target:value:publisherId:following:collectionId:collectionCategory:collectionCurrentlySaved:verticalIndex:horizontalIndex:placeCardType:possibleActions:impossibleActions:modules:](GEOAPPortal, "captureCuratedCollectionUserAction:target:value:publisherId:following:collectionId:collectionCategory:collectionCurrentlySaved:verticalIndex:horizontalIndex:placeCardType:possibleActions:impossibleActions:modules:", *(_QWORD *)&a3, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
}

+ (void)captureCuratedCollectionCarouselScrollForward
{
  _objc_msgSend(a1, "_captureCuratedCollectionCarouselScrollAction:", 2199);
}

+ (void)captureCuratedCollectionCarouselScrollBackward
{
  _objc_msgSend(a1, "_captureCuratedCollectionCarouselScrollAction:", 2200);
}

+ (void)captureTapActionWithFavorite:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "analyticsGrouping"));
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2039, 8, v3);

  switch((unint64_t)objc_msgSend(v7, "type"))
  {
    case 1uLL:
    case 6uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "geoMapItem"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_mapsCategoryId"));

      +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2049, 8, v5);
      break;
    case 2uLL:
      if (objc_msgSend(v7, "isShortcutForSetup"))
        v6 = 2042;
      else
        v6 = 2046;
      goto LABEL_12;
    case 3uLL:
      if (objc_msgSend(v7, "isShortcutForSetup"))
        v6 = 2043;
      else
        v6 = 2047;
      goto LABEL_12;
    case 5uLL:
      if (objc_msgSend(v7, "isShortcutForSetup"))
        v6 = 2169;
      else
        v6 = 84;
LABEL_12:
      +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", v6, 8, 0);
      break;
    default:
      break;
  }

}

+ (void)captureTapActionWithEntry:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unsigned __int8 v9;
  id v10;

  v10 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "analyticsGrouping"));
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2039, 8, v3);

  v4 = objc_msgSend(v10, "type");
  switch((unint64_t)v4)
  {
    case 0x12uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "geoMapItem"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_mapsCategoryId"));

      +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2049, 8, v6);
      goto LABEL_17;
    case 0x13uLL:
      if (objc_msgSend(v10, "isShortcutForSetup"))
        v7 = 2169;
      else
        v7 = 84;
      goto LABEL_16;
    case 0x14uLL:
      goto LABEL_17;
    case 0x15uLL:
      goto LABEL_10;
    case 0x16uLL:
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uniqueIdentifier"));
      v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("NearbyTransit"));

      if ((v9 & 1) != 0)
        goto LABEL_17;
LABEL_10:
      v7 = 118;
      goto LABEL_16;
    default:
      if (v4 == (id)2)
      {
        if (objc_msgSend(v10, "isShortcutForSetup"))
          v7 = 2043;
        else
          v7 = 2047;
      }
      else
      {
        if (v4 != (id)1)
          goto LABEL_17;
        if (objc_msgSend(v10, "isShortcutForSetup"))
          v7 = 2042;
        else
          v7 = 2046;
      }
LABEL_16:
      +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", v7, 8, 0);
LABEL_17:

      return;
  }
}

+ (void)captureDisplayActionWithEntry:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "analyticsGrouping"));
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 359, 8, v3);

}

+ (void)captureDisplayActionWithFavorite:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "analyticsGrouping"));
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 359, 8, v3);

}

+ (void)captureRatingRequestDiscoveryAction:(int)a3
{
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", *(_QWORD *)&a3, 697, 0);
}

+ (void)captureRatingSuggestionTapAction
{
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2142, 8, 0);
}

+ (void)captureFeatureDiscoveryBannerDidAppear
{
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 97, 8, 0);
}

+ (void)captureExploreGuidesTapAction
{
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 180, 8, 0);
}

+ (void)captureShareMyLocationAction
{
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 245, 8, 0);
}

+ (void)captureMarkMyLocationAction
{
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 5031, 8, 0);
}

+ (void)captureRAPAction
{
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 5013, 8, 0);
}

+ (void)captureStateWithShortcuts:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v9, "isShortcutForSetup") & 1) == 0)
        {
          if (objc_msgSend(v9, "type") == (id)1)
          {
            v10 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
            objc_msgSend(v10, "setMapFeatureIsHomeFavoriteSet:", 1);

          }
          if (objc_msgSend(v9, "type") == (id)2)
          {
            v11 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
            objc_msgSend(v11, "setMapFeatureIsWorkFavoriteSet:", 1);

          }
          if (objc_msgSend(v9, "type") == (id)19)
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
            objc_msgSend(v12, "setMapFeatureIsSchoolFavoriteSet:", 1);

          }
          v6 = (v6 + 1);
          if (objc_msgSend(v9, "type") == (id)22)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uniqueIdentifier"));
            v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("NearbyTransit"));

            if (v14)
            {
              v15 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
              objc_msgSend(v15, "setMapFeatureIsTransitFavoriteSet:", 1);

            }
          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v16, "setMapFeatureFavoritesCount:", v6);

}

@end
