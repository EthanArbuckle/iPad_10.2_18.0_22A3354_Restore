@implementation PHAsset(PhotosUICoreAccessibility)

- (id)px_accessibilityLabelForStyles:()PhotosUICoreAccessibility
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  unint64_t v13;
  double v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  unint64_t v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v28;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a3 & 1) != 0)
  {
    objc_msgSend(a1, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(a1, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v7);

    }
  }
  if ((a3 & 8) != 0)
  {
    v8 = (void *)MEMORY[0x1E0CB3578];
    objc_msgSend(a1, "creationDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringFromDate:dateStyle:timeStyle:", v9, 2, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      objc_msgSend(v5, "addObject:", v10);

    if ((a3 & 4) == 0)
    {
LABEL_6:
      if ((a3 & 0x10) == 0)
        goto LABEL_21;
      goto LABEL_14;
    }
  }
  else if ((a3 & 4) == 0)
  {
    goto LABEL_6;
  }
  objc_msgSend(a1, "_faceNamesStringForAsset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v5, "addObject:", v11);

  if ((a3 & 0x10) != 0)
  {
LABEL_14:
    if (objc_msgSend(a1, "mediaType") == 2)
    {
      objc_msgSend(a1, "duration");
      v13 = (unint64_t)(v12 / 3600.0);
      v14 = v12 - (double)(3600 * v13);
      v15 = (unint64_t)(v14 / 60.0);
      v16 = vcvtad_u64_f64(v14 - (double)(60 * v15));
      PXLocalizedStringFromTable(CFSTR("PXCameraSettingsMediaDurationAXDescription"), CFSTR("PhotosUICore"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %lu:%02lu:%02lu"), v17, v13, v15, v16);
      else
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %lu:%02lu"), v17, v15, v16, v28);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "length"))
        objc_msgSend(v5, "addObject:", v18);

    }
  }
LABEL_21:
  v19 = objc_msgSend(a1, "isFavorite");
  if ((a3 & 2) != 0 && v19)
  {
    PXLocalizedStringFromTable(CFSTR("PXFavoritedBadgeAXLabel"), CFSTR("PhotosUICore"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v20);

  }
  if ((a3 & 0x40) != 0)
  {
    v21 = objc_msgSend(a1, "pixelWidth");
    if (v21 >= objc_msgSend(a1, "pixelHeight"))
      v22 = CFSTR("PXAXStringOrientationNormal");
    else
      v22 = CFSTR("PXAXStringOrientationRotate90");
    PXLocalizedStringFromTable(v22, CFSTR("PhotosUICore"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v23);

  }
  if ((a3 & 0x20) != 0)
  {
    objc_msgSend(a1, "fetchPropertySetsIfNeeded");
    objc_msgSend(a1, "photosOneUpProperties");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedGeoDescriptionIsHome:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
      objc_msgSend(v5, "addObject:", v25);

  }
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (id)_faceNamesStringForAsset
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD1570], "fetchOptionsWithPhotoLibrary:orObject:", 0, a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__191543;
  v27 = __Block_byref_object_dispose__191544;
  v28 = (id)MEMORY[0x1E0C9AA60];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __62__PHAsset_PhotosUICoreAccessibility___faceNamesStringForAsset__block_invoke;
  v22[3] = &unk_1E5133D08;
  v22[4] = &v23;
  +[PXPeopleUtilities peopleFaceTilesForAsset:options:completion:](PXPeopleUtilities, "peopleFaceTilesForAsset:options:completion:", a1, v2, v22);
  v3 = (void *)objc_msgSend((id)v24[5], "count");
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = (id)v24[5];
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v29, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v19;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v9), "person");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(v5, "addObject:", v10);
          objc_msgSend(v10, "px_localizedName");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "length"))
            objc_msgSend(v4, "addObject:", v11);

        }
        v12 = (unint64_t)objc_msgSend(v4, "count") < 2;

        if (!v12)
          break;
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v29, 16);
          if (v7)
            goto LABEL_4;
          break;
        }
      }
    }

    v13 = objc_msgSend(v4, "count");
    if (v13)
    {
      if (v13 == 1)
      {
        PXLocalizedStringFromTable(CFSTR("PXFace1NamedPerson"), CFSTR("PhotosUICore"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        PXLocalizedStringWithValidatedFormat(v14, CFSTR("%ld %@"));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        PXLocalizedStringFromTable(CFSTR("PXFace2NamedPeople"), CFSTR("PhotosUICore"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        PXLocalizedStringWithValidatedFormat(v14, CFSTR("%ld %@ %@"));
        v3 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      PXLocalizedStringForPeople(v5, CFSTR("PXFace0NamedPeople"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      PXLocalizedStringWithValidatedFormat(v14, CFSTR("%ld"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  _Block_object_dispose(&v23, 8);

  return v3;
}

@end
