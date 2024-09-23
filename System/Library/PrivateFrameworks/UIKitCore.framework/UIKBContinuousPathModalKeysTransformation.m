@implementation UIKBContinuousPathModalKeysTransformation

+ (id)_donorKeyplaneForKeyplane:(id)a3 transformationContext:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  objc_msgSend(a3, "alternateKeyplaneName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeKeyboard");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "subtreeWithName:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_donorControlKeysForLastDisplayRowForKeyplane:(id)a3 transformationContext:(id)a4
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_donorKeyplaneForKeyplane:transformationContext:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = objc_msgSend(&unk_1E1A94250, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(&unk_1E1A94250);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v4, "firstCachedKeyWithName:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          objc_msgSend(v4, "keysByKeyName:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "firstObject");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v11)
            continue;
        }
        objc_msgSend(v5, "addObject:", v11);

      }
      v7 = objc_msgSend(&unk_1E1A94250, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v5;
}

+ (id)transformKeyplane:(id)a3 withTransformationContext:(id)a4
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(v4, "keys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &__block_literal_global_364);

  return v4;
}

void __89__UIKBContinuousPathModalKeysTransformation_transformKeyplane_withTransformationContext___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (objc_msgSend(v2, "supportsSupplementalDisplayString"))
  {
    if (objc_msgSend(v2, "displayType"))
    {
      if (objc_msgSend(v2, "displayType") == 7)
      {
        objc_msgSend(v2, "secondaryRepresentedStrings");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "lastObject");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v6[0] = v4;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setSecondaryDisplayStrings:", v5);

      }
    }
    else
    {
      objc_msgSend(v2, "setDisplayType:", 7);
    }
  }

}

+ (id)rollbackKeyplane:(id)a3 withTransformationContext:(id)a4
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(v4, "keys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &__block_literal_global_22_7);

  return v4;
}

void __88__UIKBContinuousPathModalKeysTransformation_rollbackKeyplane_withTransformationContext___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (objc_msgSend(v2, "supportsSupplementalDisplayString"))
  {
    objc_msgSend(v2, "secondaryRepresentedStrings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (v4 < 2)
    {
      if (objc_msgSend(v2, "displayType") == 7)
        objc_msgSend(v2, "setDisplayType:", 0);
    }
    else
    {
      objc_msgSend(v2, "secondaryRepresentedStrings");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setSecondaryDisplayStrings:", v7);

    }
  }

}

+ (id)transformationIdentifier
{
  return CFSTR("cpmodal");
}

@end
