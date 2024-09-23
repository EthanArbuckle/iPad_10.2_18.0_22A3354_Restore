@implementation NSItemProvider(UIKitAdditions_Internal)

- (void)_addFileURLRepresentationIfPossible
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  id (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;
  id location;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  objc_msgSend(a1, "registeredTypeIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __78__NSItemProvider_UIKitAdditions_Internal___addFileURLRepresentationIfPossible__block_invoke;
  v12[3] = &unk_1E16D98E8;
  v12[4] = &v13;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v12);

  if (!*((_BYTE *)v14 + 24))
  {
    objc_msgSend(a1, "registeredTypeIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _UIFirstTypeIdentifierEligibleForMassStorage(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
LABEL_10:

      goto LABEL_11;
    }
    objc_msgSend(a1, "_representationConformingToType:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "preferredRepresentation") == 2)
    {
      v7 = objc_msgSend(v6, "visibility");
      v8 = v5;
      if (a1)
      {
        objc_initWeak(&location, a1);
        v9 = *MEMORY[0x1E0CEC4E0];
        v17 = v3;
        v18 = 3221225472;
        v19 = __112__NSItemProvider_UIKitAdditions_Internal___addFileURLRepresentationForOpenInPlaceWithTypeIdentifier_visibility___block_invoke;
        v20 = &unk_1E16D9938;
        objc_copyWeak(&v22, &location);
        v21 = v8;
        objc_msgSend(a1, "registerDataRepresentationForContentType:visibility:loadHandler:", v9, v7, &v17);
LABEL_8:

        objc_destroyWeak(&v22);
        objc_destroyWeak(&location);
      }
    }
    else
    {
      v10 = objc_msgSend(v6, "visibility");
      v8 = v5;
      if (a1)
      {
        objc_initWeak(&location, a1);
        v11 = *MEMORY[0x1E0CEC4E0];
        v17 = v3;
        v18 = 3221225472;
        v19 = __131__NSItemProvider_UIKitAdditions_Internal___addFileURLRepresentationByCopyingAndCachingRepresentationWithTypeIdentifier_visibility___block_invoke;
        v20 = &unk_1E16D9938;
        objc_copyWeak(&v22, &location);
        v21 = v8;
        objc_msgSend(a1, "registerDataRepresentationForContentType:visibility:loadHandler:", v11, v10, &v17);
        goto LABEL_8;
      }
    }

    goto LABEL_10;
  }
LABEL_11:
  _Block_object_dispose(&v13, 8);
}

@end
