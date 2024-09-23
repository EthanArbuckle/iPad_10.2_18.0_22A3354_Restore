@implementation NSItemProvider(UIKitAdditions)

- (uint64_t)isDataAvailableImmediatelyForTypeIdentifier:()UIKitAdditions
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a1, "dataAvailabilityByTypeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "BOOLValue");
  return v7;
}

- (id)dataAvailabilityByTypeIdentifier
{
  return objc_getAssociatedObject(a1, &kDataAvailableImmediately);
}

- (void)setTeamData:()UIKitAdditions
{
  void *v5;
  id v6;

  v6 = a3;
  if ((unint64_t)objc_msgSend(v6, "length") > 0x2000)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSItemProvider+UIKitAdditions.m"), 46, CFSTR("teamData may not exceed %lu bytes in length."), 0x2000);

  }
  objc_msgSend(a1, "_setMetadataValue:forKey:", v6, *MEMORY[0x1E0D6C148]);

}

- (id)teamData
{
  void *v1;

  objc_msgSend(a1, "_metadataValueForKey:", *MEMORY[0x1E0D6C148]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v1 = 0;
    }
  }
  return v1;
}

- (double)preferredPresentationSize
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "_metadataValueForKey:", *MEMORY[0x1E0D6C130]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "CGSizeValue");
  v3 = v2;

  return v3;
}

- (void)setPreferredPresentationSize:()UIKitAdditions
{
  id v5;

  if (a2 == *MEMORY[0x1E0C9D820] && a3 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    objc_msgSend(a1, "_setMetadataValue:forKey:", 0, *MEMORY[0x1E0D6C130]);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_setMetadataValue:forKey:", v5, *MEMORY[0x1E0D6C130]);

  }
}

- (void)_NSItemProviderDidRegisterObject:()UIKitAdditions
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "preferredPresentationSizeForItemProvider");
    objc_msgSend(a1, "setPreferredPresentationSize:");
  }

}

- (uint64_t)preferredPresentationStyle
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_metadataValueForKey:", *MEMORY[0x1E0D6C138]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "integerValue");

  return v2;
}

- (void)setPreferredPresentationStyle:()UIKitAdditions
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setMetadataValue:forKey:", v2, *MEMORY[0x1E0D6C138]);

}

- (void)registerFileProviderItemForTypeIdentifier:()UIKitAdditions visibility:loadHandler:
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v7 = a3;
  v8 = a5;
  if (objc_msgSend(MEMORY[0x1E0D6C0E0], "instancesRespondToSelector:", sel_initWithFPItem_))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __99__NSItemProvider_UIKitAdditions__registerFileProviderItemForTypeIdentifier_visibility_loadHandler___block_invoke;
    v9[3] = &unk_1E16D9878;
    v10 = v8;
    objc_msgSend(a1, "_addRepresentationType_v2:preferredRepresentation:loader:", v7, 1, v9);

  }
}

- (void)registerFileRepresentationForTypeIdentifier:()UIKitAdditions dataAvailableImmediately:visibility:loadHandler:
{
  id v6;

  v6 = a3;
  objc_msgSend(a1, "registerFileRepresentationForTypeIdentifier:fileOptions:visibility:loadHandler:");
  if (a4)
    objc_msgSend(a1, "setDataAvailability:forTypeIdentifier:", 1, v6);

}

- (void)setDataAvailability:()UIKitAdditions forTypeIdentifier:
{
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSItemProvider+UIKitAdditions.m"), 133, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("type"));

  }
  objc_msgSend(a1, "dataAvailabilityByTypeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = (void *)objc_opt_new();
    objc_setAssociatedObject(a1, &kDataAvailableImmediately, v7, (void *)0x301);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, v10);

}

- (uint64_t)isDerivedRepresentationForTypeIdentifier:()UIKitAdditions
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a1, "derivedRepresentationByTypeIdentfier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "BOOLValue");
  return v7;
}

- (BOOL)hasDerivedRepresentations
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "derivedRepresentationByTypeIdentfier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "count") != 0;

  return v2;
}

- (void)setDerivedRepresentation:()UIKitAdditions forTypeIdentifier:
{
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSItemProvider+UIKitAdditions.m"), 160, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("type"));

  }
  objc_msgSend(a1, "derivedRepresentationByTypeIdentfier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = (void *)objc_opt_new();
    objc_setAssociatedObject(a1, &kDataDerivedRepresentation, v7, (void *)0x301);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, v10);

}

- (id)derivedRepresentationByTypeIdentfier
{
  return objc_getAssociatedObject(a1, &kDataDerivedRepresentation);
}

- (id)_highestFidelityClassForLoading:()UIKitAdditions
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  id obj;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[2];
  _BYTE v64[128];
  _QWORD v65[2];
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D6C0B0], "defaultRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = v4;
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
  if (v40)
  {
    v39 = *(_QWORD *)v56;
    v36 = a1;
    v37 = v5;
    v42 = v6;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v56 != v39)
        {
          v8 = v7;
          objc_enumerationMutation(obj);
          v7 = v8;
        }
        v41 = v7;
        v9 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v7);
        if (objc_msgSend(a1, "canLoadObjectOfClass:", v9, v36, v37))
        {
          v53 = 0uLL;
          v54 = 0uLL;
          v51 = 0uLL;
          v52 = 0uLL;
          objc_msgSend(a1, "registeredTypeIdentifiers");
          v46 = (id)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v51, v66, 16);
          if (v10)
          {
            v11 = v10;
            v12 = 0;
            v13 = *(_QWORD *)v52;
            v43 = *(_QWORD *)v52;
            v44 = v9;
            do
            {
              v14 = 0;
              v45 = v11;
              do
              {
                if (*(_QWORD *)v52 != v13)
                  objc_enumerationMutation(v46);
                v15 = *(id *)(*((_QWORD *)&v51 + 1) + 8 * v14);
                if ((objc_opt_respondsToSelector() & 1) != 0)
                {
                  objc_msgSend(MEMORY[0x1E0CEC3F8], "_typeWithIdentifier:allowUndeclared:", v15, 1);
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  v59 = 0u;
                  v60 = 0u;
                  v61 = 0u;
                  v62 = 0u;
                  objc_msgSend(v9, "readableTypeIdentifiersForItemProvider");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
                  if (v18)
                  {
                    v19 = v18;
                    v20 = *(_QWORD *)v60;
                    while (2)
                    {
                      for (i = 0; i != v19; ++i)
                      {
                        if (*(_QWORD *)v60 != v20)
                          objc_enumerationMutation(v17);
                        objc_msgSend(MEMORY[0x1E0CEC3F8], "_typeWithIdentifier:allowUndeclared:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i), 1);
                        v22 = (void *)objc_claimAutoreleasedReturnValue();
                        v23 = objc_msgSend(v16, "conformsToType:", v22);

                        if ((v23 & 1) != 0)
                        {

                          v9 = v44;
                          v65[0] = v44;
                          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
                          v24 = (void *)objc_claimAutoreleasedReturnValue();
                          v65[1] = v24;
                          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 2);
                          v25 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v42, "addObject:", v25);

                          goto LABEL_24;
                        }
                      }
                      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
                      if (v19)
                        continue;
                      break;
                    }
                  }

                  v9 = v44;
LABEL_24:
                  v13 = v43;
                  v11 = v45;
                }
                else
                {

                }
                ++v12;
                ++v14;
              }
              while (v14 != v11);
              v11 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v51, v66, 16);
            }
            while (v11);
            a1 = v36;
            v5 = v37;
            v6 = v42;
          }
        }
        else
        {
          v49 = 0uLL;
          v50 = 0uLL;
          v47 = 0uLL;
          v48 = 0uLL;
          objc_msgSend(a1, "registeredTypeIdentifiers");
          v46 = (id)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v47, v64, 16);
          if (v26)
          {
            v27 = v26;
            v28 = *(_QWORD *)v48;
            v29 = 0x10000;
            do
            {
              for (j = 0; j != v27; ++j)
              {
                if (*(_QWORD *)v48 != v28)
                  objc_enumerationMutation(v46);
                if (objc_msgSend(v5, "canCoerceFromRepresentationConformingToType:toObjectOfClass:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * j), v9))
                {
                  v63[0] = v9;
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v29 + j);
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  v63[1] = v31;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 2);
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v6, "addObject:", v32);

                }
              }
              v27 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v47, v64, 16);
              v29 += j;
            }
            while (v27);
          }
        }

        v7 = v41 + 1;
      }
      while (v41 + 1 != v40);
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
    }
    while (v40);
  }

  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "sortUsingComparator:", &__block_literal_global_401);
    objc_msgSend(v6, "firstObject");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "firstObject");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v34 = 0;
  }

  return v34;
}

+ (id)_uikit_bestMatchConformingToTypes:()UIKitAdditions availableTypes:
{
  return _bestMatchConformingToTypes(a3, a4);
}

- (id)_loadObjectOfClass:()UIKitAdditions userInfo:completionHandler:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  char v18;
  void *v19;
  char v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  char v28;

  v8 = a4;
  v9 = a5;
  objc_msgSend(a1, "registeredTypeIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  objc_msgSend(a3, "readableTypeIdentifiersForItemProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _bestMatchConformingToTypes(v12, v11);
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (id)v13;
    v15 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D6C0B0], "defaultRegistry");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "acceptableRepresentationTypesForCreatingObjectOfClass:", a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _bestMatchConformingToTypes(v16, v11);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    if (!v14)
      goto LABEL_11;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v18 = objc_opt_respondsToSelector();
    if (v15)
      goto LABEL_12;
    goto LABEL_9;
  }
  v17 = objc_msgSend(a3, "_preferredRepresentationForItemProviderReadableTypeIdentifier:", v14);
  v18 = objc_opt_respondsToSelector();
  if (!v17)
  {
    if (v15)
      goto LABEL_12;
LABEL_9:
    if ((v18 & 1) == 0)
    {
      v15 = 0;
      goto LABEL_11;
    }
LABEL_12:
    v20 = v18 & 1;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __80__NSItemProvider_UIKitAdditions___loadObjectOfClass_userInfo_completionHandler___block_invoke;
    v22[3] = &unk_1E16D98C0;
    v15 = v15;
    v23 = v15;
    v27 = a3;
    v14 = v14;
    v24 = v14;
    v28 = v20;
    v25 = v8;
    v26 = v9;
    objc_msgSend(a1, "loadDataRepresentationForTypeIdentifier:completionHandler:", v14, v22);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_13;
  }
LABEL_11:
  objc_msgSend(a1, "loadObjectOfClass:completionHandler:", a3, v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v19;
}

@end
