@implementation PUSuggestLessPersonActivity

+ (int64_t)activityCategory
{
  return 0;
}

+ (int64_t)_activityStyle
{
  return 1;
}

- (id)activityType
{
  return (id)*MEMORY[0x1E0D7BE50];
}

- (id)activityTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *cachedImageName;
  __CFString *v13;

  -[PUSuggestLessPersonActivity _facesInCurrentAsset](self, "_facesInCurrentAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUSuggestLessPersonActivity _personFromFace:](self, "_personFromFace:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_localizedName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "userFeedbackProperties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userFeedback");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (objc_msgSend(v7, "length"))
      {
        PXLocalizedStringForPersonOrPetAndVisibility();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        PXStringWithValidatedFormat();
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        PXLocalizedStringForPersonOrPetAndVisibility();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      cachedImageName = self->_cachedImageName;
      v13 = CFSTR("person.crop.circle.badge.plus");
    }
    else
    {
      PXLocalizedStringForPersonOrPetAndVisibility();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      cachedImageName = self->_cachedImageName;
      v13 = CFSTR("person.crop.circle.badge.minus");
    }
    self->_cachedImageName = &v13->isa;

  }
  else
  {
    PXLocalizedString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = self->_cachedImageName;
    self->_cachedImageName = (NSString *)CFSTR("minus.circle");
  }

  return v11;
}

- (id)_systemImageName
{
  NSString *cachedImageName;
  __CFString *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *v11;

  cachedImageName = self->_cachedImageName;
  if (cachedImageName)
  {
    v3 = cachedImageName;
  }
  else
  {
    -[PUSuggestLessPersonActivity _facesInCurrentAsset](self, "_facesInCurrentAsset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count") == 1)
    {
      objc_msgSend(v5, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUSuggestLessPersonActivity _personFromFace:](self, "_personFromFace:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "userFeedbackProperties");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "userFeedback");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
        v3 = CFSTR("person.crop.circle.badge.plus");
      else
        v3 = CFSTR("person.crop.circle.badge.minus");

    }
    else
    {
      v3 = CFSTR("minus.circle");
    }
    v11 = self->_cachedImageName;
    self->_cachedImageName = &v3->isa;

  }
  return v3;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v13 = objc_msgSend(v4, "count") != 0;
  if (*((_BYTE *)v11 + 24))
  {
    -[PXActivity itemSourceController](self, "itemSourceController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assets");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __59__PUSuggestLessPersonActivity_canPerformWithActivityItems___block_invoke;
    v9[3] = &unk_1E58A5220;
    v9[4] = &v10;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

    v7 = *((_BYTE *)v11 + 24) != 0;
  }
  else
  {
    v7 = 0;
  }
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (void)performActivity
{
  -[UIActivity activityDidFinish:](self, "activityDidFinish:", 1);
}

- (id)_facesInCurrentAsset
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PXActivity itemSourceController](self, "itemSourceController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD1570], "fetchOptionsWithPhotoLibrary:orObject:", 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFetchLimit:", 2);
  objc_msgSend(v5, "setPersonContext:", 5);
  objc_msgSend(MEMORY[0x1E0CD1528], "fetchFacesInAsset:options:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_personFromFace:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[PXActivity itemSourceController](self, "itemSourceController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD1570], "fetchOptionsWithPhotoLibrary:orObject:", 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFetchLimit:", 1);
  v14[0] = *MEMORY[0x1E0CD1D60];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFetchPropertySets:", v8);

  v9 = (void *)MEMORY[0x1E0CD16C0];
  -[PUSuggestLessPersonActivity _facesInCurrentAsset](self, "_facesInCurrentAsset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchPersonWithFace:options:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedImageName, 0);
}

uint64_t __59__PUSuggestLessPersonActivity_canPerformWithActivityItems___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "px_isSyndicatedAsset");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result ^ 1;
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) ^ 1;
  return result;
}

@end
