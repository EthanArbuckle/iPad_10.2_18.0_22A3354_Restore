@implementation PHAssetCollection(PhotosUICore)

- (uint64_t)px_curationType
{
  return 0;
}

- (BOOL)px_fetchIsEmptyWithOptions:()PhotosUICore
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = objc_msgSend(a1, "estimatedAssetCount");
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_6;
  v6 = v5;
  if (objc_msgSend(v4, "sharingFilter") != 2)
    goto LABEL_6;
  objc_msgSend(v4, "predicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

LABEL_6:
    v9 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v9, "setWantsIncrementalChangeDetails:", 0);
    objc_msgSend(v9, "setFetchLimit:", 1);
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", a1, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v10, "count");

    goto LABEL_7;
  }
  objc_msgSend(v4, "internalPredicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    goto LABEL_6;
LABEL_7:

  return v6 == 0;
}

- (uint64_t)px_assetsDropMode
{
  void *v3;
  int v4;

  if ((objc_msgSend(a1, "px_isAllPhotosSmartAlbum") & 1) != 0
    || (objc_msgSend(a1, "px_isRecentsSmartAlbum") & 1) != 0
    || (objc_msgSend(a1, "px_isPhotosVirtualCollection") & 1) != 0)
  {
    return 2;
  }
  if ((objc_msgSend(a1, "px_isFavoritesSmartAlbum") & 1) != 0)
    return 1;
  if ((objc_msgSend(a1, "canPerformEditOperation:", 3) & 1) != 0)
    return 1;
  if (objc_msgSend(a1, "px_isMemory"))
  {
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "allowCustomUserAssets");

    if (v4)
      return 1;
  }
  return 0;
}

- (const)px_navigationURLHost
{
  return CFSTR("album");
}

- (uint64_t)px_navigationWellKnownName
{
  return objc_msgSend(MEMORY[0x1E0CD13B8], "px_builtInAlbumNameForSubtype:", objc_msgSend(a1, "assetCollectionSubtype"));
}

- (id)px_navigationURLComponents
{
  __CFString *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  if ((objc_msgSend(a1, "px_isPlacesSmartAlbum") & 1) != 0)
  {
    v2 = CFSTR("places");
LABEL_5:
    v5 = (void *)MEMORY[0x1E0CB3998];
    objc_msgSend(CFSTR("photos://"), "stringByAppendingString:", v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsWithString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
  if (objc_msgSend(a1, "isTransient"))
  {
    v3 = (void *)MEMORY[0x1E0CD13B8];
    objc_msgSend(a1, "transientIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "px_albumNameForTransientIdentifier:", v4);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v2)
      goto LABEL_5;
  }
  v9.receiver = a1;
  v9.super_class = (Class)&off_1EEB7AB80;
  objc_msgSendSuper2(&v9, sel_px_navigationURLComponents);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)px_debugDictionary
{
  void *v2;
  uint64_t v3;
  unint64_t v4;
  const __CFString *v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  uint64_t v21;
  void *v22;
  __CFString *v23;
  void *v24;
  __CFString *v25;
  void *v26;
  __CFString *v28;
  void *v29;
  void *v30;
  objc_super v31;
  _QWORD v32[8];
  _QWORD v33[10];

  v33[8] = *MEMORY[0x1E0C80C00];
  v31.receiver = a1;
  v31.super_class = (Class)&off_1EEB7AB80;
  objc_msgSendSuper2(&v31, sel_px_debugDictionary);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mutableCopy");

  v4 = objc_msgSend(a1, "assetCollectionType");
  if (v4 > 0xB)
    v5 = CFSTR("nil");
  else
    v5 = off_1E5139E80[v4];
  v6 = objc_msgSend(a1, "assetCollectionSubtype");
  v7 = CFSTR("nil");
  v30 = (void *)v3;
  if (v6 > 1000000000)
  {
    if (v6 > 1000000300)
    {
      if (v6 > 1000000400)
      {
        if (v6 > 1000000600)
        {
          if (v6 == 1000000601)
          {
            v7 = CFSTR("Duplicates");
          }
          else if (v6 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v7 = CFSTR("Any");
          }
        }
        else if (v6 == 1000000401)
        {
          v7 = CFSTR("Screen Saver Activity Collection");
        }
        else if (v6 == 1000000501)
        {
          v7 = CFSTR("Content Syndication");
        }
      }
      else
      {
        switch(v6)
        {
          case 1000000301:
            v7 = CFSTR("Photos Highlight Day");
            break;
          case 1000000302:
            v7 = CFSTR("Photos Highlight Month");
            break;
          case 1000000303:
            v7 = CFSTR("Photos Highlight Year");
            break;
          case 1000000304:
            v7 = CFSTR("Photos Highlight Day Group");
            break;
          default:
            break;
        }
      }
    }
    else
    {
      switch(v6)
      {
        case 1000000201:
          v7 = CFSTR("Trash Bin");
          break;
        case 1000000202:
        case 1000000208:
        case 1000000209:
        case 1000000210:
        case 1000000213:
        case 1000000216:
        case 1000000217:
          break;
        case 1000000203:
          v7 = CFSTR("Places");
          break;
        case 1000000204:
          v7 = CFSTR("User Smart Album");
          break;
        case 1000000205:
          v7 = CFSTR("Smart Album All Photos");
          break;
        case 1000000206:
          v7 = CFSTR("Smart Album Recently Edited");
          break;
        case 1000000207:
          v7 = CFSTR("Smart Album Screen Recordings");
          break;
        case 1000000211:
          v7 = CFSTR("Smart Album ProRes");
          break;
        case 1000000212:
          v7 = CFSTR("All Library Duplicates");
          break;
        case 1000000214:
          v7 = CFSTR("Smart Album Shared Library Sharing Suggestions");
          break;
        case 1000000215:
          v5 = CFSTR("Smart Album Action Cam");
          v7 = CFSTR("nil");
          break;
        case 1000000218:
          v7 = CFSTR("Saved");
          break;
        case 1000000219:
          v7 = CFSTR("Recovered");
          break;
        default:
          if (v6 == 1000000001)
            v7 = CFSTR("Camera Roll");
          break;
      }
    }
  }
  else if (v6 <= 199)
  {
    switch(v6)
    {
      case 2:
        v7 = CFSTR("Regular");
        break;
      case 3:
        v7 = CFSTR("Synced Event");
        break;
      case 4:
        v7 = CFSTR("Synced Faces");
        break;
      case 5:
        v7 = CFSTR("Synced Album");
        break;
      case 6:
        v7 = CFSTR("Imported");
        break;
      default:
        if (v6 == 100)
        {
          v7 = CFSTR("My Photo Stream");
        }
        else if (v6 == 101)
        {
          v7 = CFSTR("Cloud Shared");
        }
        break;
    }
  }
  else
  {
    switch(v6)
    {
      case 200:
        v7 = CFSTR("Smart Album Generic");
        break;
      case 201:
        v7 = CFSTR("Smart Album Panaramas");
        break;
      case 202:
        v7 = CFSTR("Smart Album Videos");
        break;
      case 203:
        v7 = CFSTR("Smart Album Favorites");
        break;
      case 204:
        v7 = CFSTR("Smart Album Timelapses");
        break;
      case 205:
        v7 = CFSTR("Smart Album All Hidden");
        break;
      case 206:
        v7 = CFSTR("Smart Album Recently Added");
        break;
      case 207:
        v7 = CFSTR("Smart Album Bursts");
        break;
      case 208:
        v7 = CFSTR("Smart Album Slomo Videos");
        break;
      case 209:
        v7 = CFSTR("Smart Album User Library");
        break;
      case 210:
        v7 = CFSTR("Smart Album Self Portraits");
        break;
      case 211:
        v7 = CFSTR("Smart Album Screenshots");
        break;
      case 212:
        v7 = CFSTR("Smart Album Depth Effect");
        break;
      case 213:
        v7 = CFSTR("Smart Album Live Photos");
        break;
      case 214:
        v7 = CFSTR("Smart Album Animated");
        break;
      case 215:
        v7 = CFSTR("Smart album Long Exposures");
        break;
      case 216:
        v7 = CFSTR("Smart album Unable to Upload");
        break;
      case 217:
        v7 = CFSTR("Smart Album RAW");
        break;
      case 218:
        v7 = CFSTR("Smart Album Cinematic");
        break;
      case 219:
        v7 = CFSTR("Smart Album Spatial");
        break;
      default:
        break;
    }
  }
  v32[0] = CFSTR("debugDescription");
  objc_msgSend(a1, "debugDescription");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v29;
  v33[1] = v5;
  v32[1] = CFSTR("assetCollectionType");
  v32[2] = CFSTR("assetCollectionSubtype");
  v33[2] = v7;
  v32[3] = CFSTR("estimatedAssetCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "estimatedAssetCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = v8;
  v32[4] = CFSTR("startDate");
  objc_msgSend(a1, "startDate");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (__CFString *)v9;
  else
    v11 = CFSTR("nil");
  v33[4] = v11;
  v32[5] = CFSTR("endDate");
  v28 = v11;
  objc_msgSend(a1, "endDate");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (__CFString *)v12;
  else
    v14 = CFSTR("nil");
  v33[5] = v14;
  v32[6] = CFSTR("approximateLocation");
  v15 = v14;
  objc_msgSend(a1, "approximateLocation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "debugDescription");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    v19 = (__CFString *)v17;
  else
    v19 = CFSTR("nil");
  v33[6] = v19;
  v32[7] = CFSTR("localizedLocationNames");
  v20 = v19;
  objc_msgSend(a1, "localizedLocationNames");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  if (v21)
    v23 = (__CFString *)v21;
  else
    v23 = CFSTR("nil");
  v33[7] = v23;
  v24 = (void *)MEMORY[0x1E0C99D80];
  v25 = v23;
  objc_msgSend(v24, "dictionaryWithObjects:forKeys:count:", v33, v32, 8);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v30, "addEntriesFromDictionary:", v26);
  return v30;
}

- (uint64_t)px_estimatedCuratedAssetsCount
{
  uint64_t v4;
  id v5;
  int v6;
  uint64_t v7;
  void *v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;

  v4 = objc_msgSend(a1, "estimatedAssetCount");
  if (objc_msgSend(a1, "assetCollectionType") == 6)
  {
    v5 = a1;
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_4;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "px_descriptionForAssertionMessage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("PHCollection+PhotosUICore.m"), 745, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self"), v11, v13);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, 0, CFSTR("PHCollection+PhotosUICore.m"), 745, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self"), v11);
    }

LABEL_4:
    v6 = objc_msgSend(v5, "px_curationType");
    if (v6 == 2)
    {
      v7 = objc_msgSend(v5, "extendedCount");
    }
    else
    {
      if (v6 != 1)
      {
LABEL_9:

        return v4;
      }
      v7 = objc_msgSend(v5, "summaryCount");
    }
    v4 = v7;
    goto LABEL_9;
  }
  return v4;
}

- (uint64_t)px_isTransientCollectionWithIdentifier:()PhotosUICore
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  if (objc_msgSend(a1, "isTransient"))
  {
    objc_msgSend(a1, "transientIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqual:", v4);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)px_fetchAncestorThatSupportsCustomKeyAssets
{
  id v2;
  id v3;
  void *v4;

  if (!objc_msgSend(a1, "canContainCustomKeyAssets"))
  {
    if (objc_msgSend(a1, "assetCollectionType") == 6)
    {
      v3 = a1;
      if (objc_msgSend(v3, "type") - 5 <= 1)
      {
        objc_msgSend(MEMORY[0x1E0CD1708], "fetchParentDayGroupHighlightForHighlight:options:", v3, 0);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "firstObject");
        v2 = (id)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v2, "canContainCustomKeyAssets") & 1) != 0)
        {

          return v2;
        }

      }
    }
    v2 = 0;
    return v2;
  }
  v2 = a1;
  return v2;
}

- (id)px_fetchAncestorThatSupportsExplictlyRemovingAssets
{
  id v2;
  __int16 v3;
  id v4;
  void *v5;

  if (objc_msgSend(a1, "assetCollectionType") == 6)
  {
    v2 = a1;
    v3 = objc_msgSend(v2, "type");
    if (MEMORY[0x1A85CC160]())
    {
      v4 = v2;
LABEL_10:

      return v4;
    }
    if ((unsigned __int16)(v3 - 5) <= 1u)
    {
      objc_msgSend(MEMORY[0x1E0CD1708], "fetchParentDayGroupHighlightForHighlight:options:", v2, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "firstObject");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      if (MEMORY[0x1A85CC160](objc_msgSend(v4, "type")))
      {

        goto LABEL_10;
      }

    }
    v4 = 0;
    goto LABEL_10;
  }
  v4 = 0;
  return v4;
}

+ (id)px_albumNameForTransientIdentifier:()PhotosUICore
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = px_albumNameForTransientIdentifier__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&px_albumNameForTransientIdentifier__onceToken, &__block_literal_global_229237);
  objc_msgSend((id)px_albumNameForTransientIdentifier__albumNames, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (__CFString)px_builtInAlbumNameForSubtype:()PhotosUICore
{
  __CFString *v3;
  __CFString **v4;

  v3 = 0;
  if (a3 > 1000000200)
  {
    switch(a3)
    {
      case 1000000212:
        v4 = PXProgrammaticNavigationWellKnownNameDuplicates;
        break;
      case 1000000213:
      case 1000000215:
      case 1000000216:
      case 1000000217:
        return v3;
      case 1000000214:
        v4 = PXProgrammaticNavigationWellKnownNameSharedLibrarySuggestions;
        break;
      case 1000000218:
        v4 = PXProgrammaticNavigationWellKnownNameRecentlySaved;
        break;
      case 1000000219:
        v4 = PXProgrammaticNavigationWellKnownNameRecovered;
        break;
      default:
        if (a3 != 1000000201)
          return v3;
        v4 = PXProgrammaticNavigationWellKnownNameRecentlyDeleted;
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case 201:
        v4 = PXProgrammaticNavigationWellKnownNamePanoramas;
        break;
      case 202:
        v4 = PXProgrammaticNavigationWellKnownNameVideos;
        break;
      case 203:
        v4 = PXProgrammaticNavigationWellKnownNameFavorites;
        break;
      case 204:
        v4 = PXProgrammaticNavigationWellKnownNameTimelapses;
        break;
      case 205:
        v4 = PXProgrammaticNavigationWellKnownNameHidden;
        break;
      case 206:
        return v3;
      case 207:
        v4 = PXProgrammaticNavigationWellKnownNameBursts;
        break;
      case 208:
        v4 = PXProgrammaticNavigationWellKnownNameSlomo;
        break;
      case 209:
        v4 = PXProgrammaticNavigationWellKnownNameCameraRoll;
        break;
      case 210:
        v4 = PXProgrammaticNavigationWellKnownNameSelfies;
        break;
      case 211:
        v4 = PXProgrammaticNavigationWellKnownNameScreenshots;
        break;
      case 212:
        v4 = PXProgrammaticNavigationWellKnownNameDepthEffect;
        break;
      case 213:
        v4 = PXProgrammaticNavigationWellKnownNameLivePhotos;
        break;
      case 214:
        v4 = PXProgrammaticNavigationWellKnownNameAnimated;
        break;
      case 215:
        v4 = PXProgrammaticNavigationWellKnownNameLongExposures;
        break;
      case 216:
        v4 = PXProgrammaticNavigationWellKnownNameUnableToUpload;
        break;
      case 217:
        v4 = PXProgrammaticNavigationWellKnownNameRaw;
        break;
      case 218:
        v4 = PXProgrammaticNavigationWellKnownNameCinematicVideos;
        break;
      case 219:
        v4 = PXProgrammaticNavigationWellKnownNameSpatial;
        break;
      default:
        if (a3 == 4)
        {
          v4 = PXProgrammaticNavigationWellKnownNameSyncedFaces;
        }
        else
        {
          if (a3 != 100)
            return v3;
          v4 = PXProgrammaticNavigationWellKnownNamePhotoStream;
        }
        break;
    }
  }
  v3 = *v4;
  return v3;
}

+ (void)px_getType:()PhotosUICore subtype:forBuiltInAlbumName:
{
  uint64_t v7;
  uint64_t v8;
  int v9;
  id v10;

  v10 = a5;
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("faces")) & 1) != 0)
  {
    v7 = 4;
LABEL_7:
    v8 = 1;
    goto LABEL_8;
  }
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("import-history")) & 1) == 0)
  {
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("photostream")) & 1) != 0)
    {
      v7 = 100;
      goto LABEL_7;
    }
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("panoramas")) & 1) != 0)
    {
      v7 = 201;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("spatial")) & 1) != 0)
    {
      v7 = 219;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("videos")) & 1) != 0)
    {
      v7 = 202;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("favorites")) & 1) != 0)
    {
      v7 = 203;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("timelapses")) & 1) != 0)
    {
      v7 = 204;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("hidden")) & 1) != 0)
    {
      v7 = 205;
    }
    else
    {
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("recents")) & 1) != 0)
        goto LABEL_22;
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("bursts")) & 1) != 0)
      {
        v7 = 207;
        goto LABEL_56;
      }
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("slomo")) & 1) != 0)
      {
        v7 = 208;
        goto LABEL_56;
      }
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("camera-roll")) & 1) != 0)
      {
LABEL_22:
        v7 = 209;
      }
      else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("selfies")) & 1) != 0)
      {
        v7 = 210;
      }
      else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("screenshots")) & 1) != 0)
      {
        v7 = 211;
      }
      else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("depth-effect")) & 1) != 0)
      {
        v7 = 212;
      }
      else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("live-photos")) & 1) != 0)
      {
        v7 = 213;
      }
      else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("animated")) & 1) != 0)
      {
        v7 = 214;
      }
      else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("long-exposures")) & 1) != 0)
      {
        v7 = 215;
      }
      else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("unable-to-upload")) & 1) != 0)
      {
        v7 = 216;
      }
      else
      {
        if ((objc_msgSend(v10, "isEqualToString:", CFSTR("recently-deleted")) & 1) != 0)
        {
          v8 = 2;
          v7 = 1000000201;
          goto LABEL_8;
        }
        if ((objc_msgSend(v10, "isEqualToString:", CFSTR("shared-library-sharing-suggestions")) & 1) != 0)
        {
          v7 = 1000000214;
        }
        else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("duplicates")) & 1) != 0)
        {
          v7 = 1000000212;
        }
        else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("cinematic")) & 1) != 0)
        {
          v7 = 218;
        }
        else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("raw")) & 1) != 0)
        {
          v7 = 217;
        }
        else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("recently-saved")) & 1) != 0)
        {
          v7 = 1000000218;
        }
        else
        {
          v9 = objc_msgSend(v10, "isEqualToString:", CFSTR("recovered"));
          v7 = 1000000219;
          if (!v9)
            v7 = 0x7FFFFFFFFFFFFFFFLL;
        }
      }
    }
LABEL_56:
    v8 = 2;
    goto LABEL_8;
  }
  v7 = 200;
  v8 = 9;
LABEL_8:
  *a3 = v8;
  *a4 = v7;

}

+ (id)px_mediaTypeSmartAlbumSubtypes
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__PHAssetCollection_PhotosUICore__px_mediaTypeSmartAlbumSubtypes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (px_mediaTypeSmartAlbumSubtypes_onceToken != -1)
    dispatch_once(&px_mediaTypeSmartAlbumSubtypes_onceToken, block);
  return (id)px_mediaTypeSmartAlbumSubtypes_subtypes;
}

+ (id)px_otherAlbumsSubtypes
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__PHAssetCollection_PhotosUICore__px_otherAlbumsSubtypes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (px_otherAlbumsSubtypes_onceToken != -1)
    dispatch_once(&px_otherAlbumsSubtypes_onceToken, block);
  return (id)px_otherAlbumsSubtypes_subtypes;
}

+ (id)px_regularAlbumWithTitle:()PhotosUICore
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CD1570];
  v4 = a3;
  objc_msgSend(v3, "px_standardFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFetchLimit:", 1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("title == %@"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setPredicate:", v6);
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 1, 2, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)px_smartAlbumWithSubtype:()PhotosUICore
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "px_fetchSmartAlbumWithSubtype:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)px_fetchSmartAlbumWithSubtype:()PhotosUICore
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CD1570], "px_standardFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIncludePlacesSmartAlbum:", a3 == 1000000203);
  objc_msgSend(v5, "setIncludeAllPhotosSmartAlbum:", a3 == 1000000205);
  objc_msgSend(v5, "setIncludeRecentlyEditedSmartAlbum:", a3 == 1000000206);
  objc_msgSend(v5, "setIncludeScreenRecordingsSmartAlbum:", a3 == 1000000207);
  objc_msgSend(v5, "setIncludeUserSmartAlbums:", a3 == 1000000204);
  objc_msgSend(v5, "setIncludeProResSmartAlbum:", a3 == 1000000211);
  objc_msgSend(v5, "setIncludeSharedLibrarySharingSuggestionsSmartAlbum:", a3 == 1000000214);
  objc_msgSend(v5, "setIncludeDuplicatesAlbums:", a3 == 1000000212);
  objc_msgSend(a1, "fetchAssetCollectionsWithType:subtype:options:", 2, a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)px_fetchContainingCollectionsForAsset:()PhotosUICore excludedAssetCollection:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "librarySpecificFetchOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self != %@"), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPredicate:", v9);

  }
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsContainingAsset:withType:options:", v5, 1, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)px_fetchSmartAlbumCollectionsBySubtypeForAlbumSubtypes:()PhotosUICore photoLibrary:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a4, "px_standardLibrarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIncludePlacesSmartAlbum:", objc_msgSend(v5, "containsObject:", &unk_1E53EF000));
  objc_msgSend(v6, "setIncludeDuplicatesAlbums:", objc_msgSend(v5, "containsObject:", &unk_1E53EEFD0));
  objc_msgSend(v6, "setIncludeAllPhotosSmartAlbum:", objc_msgSend(v5, "containsObject:", &unk_1E53EF018));
  objc_msgSend(v6, "setIncludeRecentlyEditedSmartAlbum:", objc_msgSend(v5, "containsObject:", &unk_1E53EEFE8));
  objc_msgSend(v6, "setIncludeScreenRecordingsSmartAlbum:", objc_msgSend(v5, "containsObject:", &unk_1E53EEEF8));
  objc_msgSend(v6, "setIncludeActionCamVideoSmartAlbum:", objc_msgSend(v5, "containsObject:", &unk_1E53EEE80));
  objc_msgSend(v6, "setIncludeProResSmartAlbum:", objc_msgSend(v5, "containsObject:", &unk_1E53EEF58));
  objc_msgSend(v6, "setIncludeSharedLibrarySharingSuggestionsSmartAlbum:", objc_msgSend(v5, "containsObject:", &unk_1E53EF030));
  objc_msgSend(v6, "setIncludeTrashBinAlbum:", objc_msgSend(v5, "containsObject:", &unk_1E53EEF88));
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("assetCollectionSubtype IN %@"), v5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:");
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 2, 0x7FFFFFFFFFFFFFFFLL, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v14, "assetCollectionSubtype"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, v15);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  return v8;
}

+ (id)px_fetchAssetCollectionsWithAlbumSubtypes:()PhotosUICore photoLibrary:
{
  id v6;
  id v7;
  void *v8;
  void *v10;

  v6 = a3;
  objc_msgSend(a1, "px_fetchSmartAlbumCollectionsBySubtypeForAlbumSubtypes:photoLibrary:", v6, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;
  PXMap();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
