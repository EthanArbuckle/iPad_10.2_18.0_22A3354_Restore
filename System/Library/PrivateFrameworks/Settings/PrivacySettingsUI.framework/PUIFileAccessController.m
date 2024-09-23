@implementation PUIFileAccessController

- (PUIFileAccessController)init
{
  PUIFileAccessController *v2;
  PUIFileAccessController *v3;
  void *v4;
  objc_class *v5;
  FPAccessControlManager *v6;
  FPAccessControlManager *accessManager;
  objc_super v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v9.receiver = self;
  v9.super_class = (Class)PUIFileAccessController;
  v2 = -[PUIFileAccessController init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PUIFileAccessController setReusesCells:](v2, "setReusesCells:", 1);
    v11 = 0;
    v12 = &v11;
    v13 = 0x2050000000;
    v4 = (void *)getFPAccessControlManagerClass_softClass;
    v14 = getFPAccessControlManagerClass_softClass;
    if (!getFPAccessControlManagerClass_softClass)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __getFPAccessControlManagerClass_block_invoke;
      v10[3] = &unk_1EA26B260;
      v10[4] = &v11;
      __getFPAccessControlManagerClass_block_invoke((uint64_t)v10);
      v4 = (void *)v12[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v11, 8);
    v6 = (FPAccessControlManager *)objc_alloc_init(v5);
    accessManager = v3->_accessManager;
    v3->_accessManager = v6;

  }
  return v3;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUIFileAccessController;
  -[PUIFileAccessController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PUIFileAccessController provideNavigationDonations](self, "provideNavigationDonations");
}

- (void)provideNavigationDonations
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc(MEMORY[0x1E0CB3B78]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithKey:table:locale:bundleURL:", CFSTR("FILEACCESS"), CFSTR("Privacy"), v6, v4);

  v8 = objc_alloc(MEMORY[0x1E0CB3B78]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithKey:table:locale:bundleURL:", CFSTR("PRIVACY"), CFSTR("Privacy"), v9, v4);

  v13[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.PrivacyAndSecurity/FILEACCESS"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIFileAccessController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.privacy"), v7, v11, v12);

}

- (id)applicationProxiesDictionary
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA58D0], "enumeratorForApplicationProxiesWithOptions:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      objc_msgSend(v5, "bundleIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lowercaseString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKey:", v5, v7);

      objc_msgSend(v3, "nextObject");
      v8 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v8;
    }
    while (v8);
  }

  return v2;
}

- (id)bundleIdentifiersAccessingFiles
{
  dispatch_semaphore_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  NSObject *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  v3 = dispatch_semaphore_create(0);
  -[PUIFileAccessController accessManager](self, "accessManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __58__PUIFileAccessController_bundleIdentifiersAccessingFiles__block_invoke;
  v12 = &unk_1EA26B2F0;
  v14 = &v15;
  v5 = v3;
  v13 = v5;
  objc_msgSend(v4, "bundleIdentifiersWithAccessToAnyItemCompletionHandler:", &v9);

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v9, v10, v11, v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("com.apple.PrivacySettingsUI.FileAccessStateChanged"), 0);

  v7 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v7;
}

void __58__PUIFileAccessController_bundleIdentifiersAccessingFiles__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)specifiers
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
  void *v12;
  PUIFileAccessController *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  __CFBundle *BundleWithIdentifier;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  __CFString *v40;
  void *v41;
  __CFBundle *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v51;
  void *v52;
  uint64_t v53;
  CFURLRef v54;
  CFURLRef v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  PUIFileAccessController *v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80590]);
  if (!v3)
  {
    v53 = (int)*MEMORY[0x1E0D80590];
    -[PUIFileAccessController applicationProxiesDictionary](self, "applicationProxiesDictionary");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0C99E60];
    -[PUIFileAccessController bundleIdentifiersAccessingFiles](self, "bundleIdentifiersAccessingFiles");
    v61 = self;
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(MEMORY[0x1E0CBC250], "bundleIdentifiersAccessingExternalMediaDevices");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, 0, 0, 0, 0, 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setIdentifier:", CFSTR("FILE_APP_GROUP"));
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("FILEACCESS_FOOTER"), &stru_1EA26D430, CFSTR("Privacy"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setProperty:forKey:", v12, *MEMORY[0x1E0D80848]);

    v13 = v61;
    v70 = v9;
    v52 = v10;
    objc_msgSend(v9, "addObject:", v10);
    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    v14 = v6;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
    v60 = v14;
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v77;
      v58 = *MEMORY[0x1E0C9AAC8];
      v56 = *MEMORY[0x1E0C9AE88];
      v66 = *MEMORY[0x1E0D808C0];
      v64 = *MEMORY[0x1E0C9AE50];
      v62 = *MEMORY[0x1E0D808D0];
      v68 = *(_QWORD *)v77;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v77 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
          objc_msgSend(v19, "lowercaseString");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.documentsapp")) & 1) == 0)
          {
            objc_msgSend(v71, "objectForKey:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = v21;
            if (v21)
            {
              objc_msgSend(v21, "bundleIdentifier");
              v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "localizedNameForContext:", 0);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend(v24, "length"))
              {
                BundleWithIdentifier = CFBundleGetBundleWithIdentifier(v23);
                CFBundleGetInfoDictionary(BundleWithIdentifier);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "objectForKeyedSubscript:", v58);
                v27 = (void *)objc_claimAutoreleasedReturnValue();

                if (!objc_msgSend(v27, "length"))
                {
                  objc_msgSend(v26, "objectForKeyedSubscript:", v56);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();

                  if (objc_msgSend(v28, "length"))
                  {
                    v27 = v28;
                  }
                  else
                  {
                    v54 = CFBundleCopyBundleURL(BundleWithIdentifier);
                    -[__CFURL lastPathComponent](v54, "lastPathComponent");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v29, "stringByDeletingPathExtension");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();

                  }
                }

                v24 = v27;
                v14 = v60;
                v13 = v61;
              }
              objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v24, v13, sel_setAccess_forSpecifier_, sel_accesssForSpecifier_, 0, 6, 0);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "setIdentifier:", v19);
              objc_msgSend(v30, "setProperty:forKey:", v23, v66);
              objc_msgSend(v30, "setProperty:forKey:", v64, v62);
              objc_msgSend(v70, "addObject:", v30);

              v17 = v68;
            }

          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
      }
      while (v16);
    }

    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v31 = v51;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v73;
      v59 = *MEMORY[0x1E0C9AAC8];
      v57 = *MEMORY[0x1E0C9AE88];
      v69 = *MEMORY[0x1E0D808C0];
      v67 = *MEMORY[0x1E0C9AE50];
      v63 = v31;
      v65 = *MEMORY[0x1E0D808D0];
      do
      {
        for (j = 0; j != v33; ++j)
        {
          if (*(_QWORD *)v73 != v34)
            objc_enumerationMutation(v31);
          v36 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * j);
          if ((objc_msgSend(v36, "isEqualToString:", CFSTR("com.apple.MobileSlideShow")) & 1) == 0)
          {
            objc_msgSend(v36, "lowercaseString");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "objectForKey:", v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = v38;
            if (v38)
            {
              objc_msgSend(v38, "bundleIdentifier");
              v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "localizedNameForContext:", 0);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend(v41, "length"))
              {
                v42 = CFBundleGetBundleWithIdentifier(v40);
                CFBundleGetInfoDictionary(v42);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "objectForKeyedSubscript:", v59);
                v44 = (void *)objc_claimAutoreleasedReturnValue();

                if (!objc_msgSend(v44, "length"))
                {
                  objc_msgSend(v43, "objectForKeyedSubscript:", v57);
                  v45 = (void *)objc_claimAutoreleasedReturnValue();

                  if (objc_msgSend(v45, "length"))
                  {
                    v44 = v45;
                  }
                  else
                  {
                    v55 = CFBundleCopyBundleURL(v42);
                    -[__CFURL lastPathComponent](v55, "lastPathComponent");
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v46, "stringByDeletingPathExtension");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();

                  }
                }
                v31 = v63;

                v41 = v44;
                v13 = v61;
              }
              objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v41, v13, sel_setCameraAccess_forSpecifier_, sel_cameraAccessForSpecifier_, 0, 6, 0);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "setIdentifier:", v40);
              objc_msgSend(v47, "setProperty:forKey:", v40, v69);
              objc_msgSend(v47, "setProperty:forKey:", v67, v65);
              objc_msgSend(v70, "addObject:", v47);

            }
          }
        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
      }
      while (v33);
    }

    objc_msgSend(v70, "sortUsingComparator:", &__block_literal_global);
    v48 = objc_msgSend(v70, "copy");
    v49 = *(Class *)((char *)&v13->super.super.super.super.super.isa + v53);
    *(Class *)((char *)&v13->super.super.super.super.super.isa + v53) = (Class)v48;

    v3 = *(Class *)((char *)&v13->super.super.super.super.super.isa + v53);
  }
  return v3;
}

uint64_t __37__PUIFileAccessController_specifiers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedCaseInsensitiveCompare:", v6);
  return v7;
}

- (void)setAccess:(id)a3 forSpecifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v6 = a4;
  if ((objc_msgSend(a3, "BOOLValue") & 1) == 0)
  {
    -[PUIFileAccessController accessManager](self, "accessManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __50__PUIFileAccessController_setAccess_forSpecifier___block_invoke;
    v9[3] = &unk_1EA26B380;
    v9[4] = self;
    objc_msgSend(v7, "revokeAccessToAllItemsForBundle:completionHandler:", v8, v9);

  }
}

void __50__PUIFileAccessController_setAccess_forSpecifier___block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__PUIFileAccessController_setAccess_forSpecifier___block_invoke_2;
  block[3] = &unk_1EA26B358;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __50__PUIFileAccessController_setAccess_forSpecifier___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (id)accesssForSpecifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
}

- (void)setCameraAccess:(id)a3 forSpecifier:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;

  v6 = (void *)MEMORY[0x1E0CBC250];
  v7 = a3;
  objc_msgSend(a4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(v6, "updateBundleIdentifierAccessingExternalMediaDevices:withStatus:", v8, v9);
  -[PUIFileAccessController reloadSpecifiers](self, "reloadSpecifiers");
}

- (id)cameraAccessForSpecifier:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CBC250], "bundleIdentifiersAccessingExternalMediaDevicesWithStatus");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("bundle_id"), (_QWORD)v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqualToString:", v11);

        if ((v12 & 1) != 0)
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("whitelisted"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v13;
}

- (BOOL)isAccess
{
  return self->_isAccess;
}

- (void)setIsAccess:(BOOL)a3
{
  self->_isAccess = a3;
}

- (FPAccessControlManager)accessManager
{
  return self->_accessManager;
}

- (void)setAccessManager:(id)a3
{
  objc_storeStrong((id *)&self->_accessManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessManager, 0);
}

@end
