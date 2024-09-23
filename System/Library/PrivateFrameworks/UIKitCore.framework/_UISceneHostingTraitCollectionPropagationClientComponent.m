@implementation _UISceneHostingTraitCollectionPropagationClientComponent

- (id)windowScene
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v11;

  -[FBSSceneComponent clientScene](self, "clientScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIScene _sceneForFBSScene:](UIScene, "_sceneForFBSScene:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_opt_class();
  v7 = v5;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISceneHostingTraitCollectionPropagationClientComponent.m"), 48, CFSTR("Unable to apply trait collection change to client scene of kind %@"), objc_opt_class());

  }
  return v9;
}

+ (id)modifiedTraitCollectionForHostTraitCollection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (dyld_program_sdk_at_least())
  {
    +[UITraitCollection _fallbackTraitCollection]();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITraitCollection _traitCollectionByPopulatingUnspecifiedTraitsWithValuesFromTraitCollection:](v3, (uint64_t)v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v4, "traitCollectionByModifyingTraits:", &__block_literal_global_471);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)scene:(id)a3 didUpdateSettings:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "settingsDiff");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsProperty:", sel_tintColor);

  objc_msgSend(v5, "settingsDiff");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsProperty:", sel_traitCollection);

  if ((v7 & 1) != 0 || v9)
  {
    -[_UISceneHostingTraitCollectionPropagationClientComponent windowScene](self, "windowScene");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "settings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(&self->super._invalid + 1))
    {
      if (!v7)
        goto LABEL_5;
    }
    else
    {
      -[FBSSceneComponent clientScene](self, "clientScene");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "traitCollectionModificationComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setupWithWindowScene:", v10);

      *(&self->super._invalid + 1) = 1;
      if (!v7)
      {
LABEL_5:
        if (!v9)
        {
LABEL_19:

          goto LABEL_20;
        }
LABEL_16:
        v21 = (void *)objc_opt_class();
        objc_msgSend(v11, "traitCollection");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "modifiedTraitCollectionForHostTraitCollection:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        -[FBSSceneComponent clientScene](self, "clientScene");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "traitCollectionModificationComponent");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "modifiedTraitCollectionForHostTraitCollection:", v23);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          v27 = v26;

          v23 = v27;
        }
        objc_msgSend(v10, "_hostTraitCollectionDidChange:", v23);

        goto LABEL_19;
      }
    }
    objc_msgSend(v11, "tintColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    -[_UISceneHostingTraitCollectionPropagationClientComponent windowScene](self, "windowScene", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "windows");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v29 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "setTintColor:", v14);
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v18);
    }

    if (!v9)
      goto LABEL_19;
    goto LABEL_16;
  }
LABEL_20:

}

@end
