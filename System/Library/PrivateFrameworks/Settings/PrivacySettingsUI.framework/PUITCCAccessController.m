@implementation PUITCCAccessController

- (PUITCCAccessController)init
{
  PUITCCAccessController *v2;
  PUITCCAccessController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUITCCAccessController;
  v2 = -[PUITCCAccessController init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PUITCCAccessController setReusesCells:](v2, "setReusesCells:", 1);
  return v3;
}

- (void)setSpecifier:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void **v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  void **v28;
  void *v29;
  int v30;
  void *v31;
  int v32;
  void *v33;
  int v34;
  void *v35;
  int v36;
  void *v37;
  int v38;
  void *v39;
  int v40;
  void *v41;
  int v42;
  void *v43;
  int v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  int v51;
  void *v52;
  int v53;
  void *v54;
  int v55;
  objc_super v56;

  v4 = a3;
  v56.receiver = self;
  v56.super_class = (Class)PUITCCAccessController;
  -[PUITCCAccessController setSpecifier:](&v56, sel_setSpecifier_, v4);
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D809F0]);

  if (v6)
  {
    v7 = (void **)MEMORY[0x1E0DB10D0];
LABEL_7:
    v12 = *v7;
    goto LABEL_8;
  }
  objc_msgSend(v4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D80A30]);

  if (v9)
  {
    v7 = (void **)MEMORY[0x1E0DB1198];
    goto LABEL_7;
  }
  objc_msgSend(v4, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D809E0]);

  if (v11)
  {
    v7 = (void **)MEMORY[0x1E0DB10E8];
    goto LABEL_7;
  }
  objc_msgSend(v4, "identifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isEqualToString:", *MEMORY[0x1E0D80A28]);

  if (v25)
  {
    v12 = (void *)*MEMORY[0x1E0DB1188];
    -[PUITCCAccessController setHeader:](self, "setHeader:", CFSTR("PHOTOS_HEADER"));
    goto LABEL_8;
  }
  objc_msgSend(v4, "identifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "isEqualToString:", *MEMORY[0x1E0D809D8]);

  if (v27)
  {
    v28 = (void **)MEMORY[0x1E0DB10E0];
LABEL_20:
    v12 = *v28;
    -[PUITCCAccessController setSupportsClips:](self, "setSupportsClips:", 1);
    goto LABEL_8;
  }
  objc_msgSend(v4, "identifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "isEqualToString:", *MEMORY[0x1E0D80A10]);

  if (v30)
  {
    v28 = (void **)MEMORY[0x1E0DB1168];
    goto LABEL_20;
  }
  objc_msgSend(v4, "identifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "isEqualToString:", *MEMORY[0x1E0D80A38]);

  if (v32)
  {
    v7 = (void **)MEMORY[0x1E0DB11B8];
    goto LABEL_7;
  }
  objc_msgSend(v4, "identifier");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "isEqualToString:", *MEMORY[0x1E0D80A48]);

  if (v34)
  {
    v7 = (void **)MEMORY[0x1E0DB11E8];
    goto LABEL_7;
  }
  objc_msgSend(v4, "identifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "isEqualToString:", *MEMORY[0x1E0D80A18]);

  if (v36)
  {
    v7 = (void **)MEMORY[0x1E0DB1170];
    goto LABEL_7;
  }
  objc_msgSend(v4, "identifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "isEqualToString:", *MEMORY[0x1E0D809E8]);

  if (v38)
  {
    -[PUITCCAccessController setHeader:](self, "setHeader:", CFSTR("CAMERA_HEADER"));
    -[PUITCCAccessController setSupportsClips:](self, "setSupportsClips:", 1);
    v7 = (void **)MEMORY[0x1E0DB10F0];
    goto LABEL_7;
  }
  objc_msgSend(v4, "identifier");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "isEqualToString:", *MEMORY[0x1E0D80A08]);

  if (v40)
  {
    v7 = (void **)MEMORY[0x1E0DB1158];
    goto LABEL_7;
  }
  objc_msgSend(v4, "identifier");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "isEqualToString:", *MEMORY[0x1E0D80A00]);

  if (v42)
  {
    v7 = (void **)MEMORY[0x1E0DB1128];
    goto LABEL_7;
  }
  objc_msgSend(v4, "identifier");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "isEqualToString:", *MEMORY[0x1E0D80A40]);

  if (v44)
  {
    -[PUITCCAccessController setHeader:](self, "setHeader:", CFSTR("TRACKING_HEADER"));
    v7 = (void **)MEMORY[0x1E0DB11C8];
    goto LABEL_7;
  }
  objc_msgSend(v4, "identifier");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "isEqualToString:", *MEMORY[0x1E0D809F8]);

  if (v46)
  {
    v12 = (void *)*MEMORY[0x1E0DB1118];
    PUI_LocalizedStringForPrivacy(CFSTR("EXPOSURE_HEADER"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUITCCAccessController setAppGroupHeader:](self, "setAppGroupHeader:", v47);

  }
  else
  {
    objc_msgSend(v4, "identifier");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "isEqualToString:", CFSTR("CONTACTLESS_NFC"));

    if (v49)
    {
      v7 = (void **)MEMORY[0x1E0DB10F8];
      goto LABEL_7;
    }
    objc_msgSend(v4, "identifier");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "isEqualToString:", CFSTR("SECURE_ELEMENT"));

    if (v51)
    {
      v7 = (void **)MEMORY[0x1E0DB11A0];
      goto LABEL_7;
    }
    objc_msgSend(v4, "identifier");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "isEqualToString:", CFSTR("PASSKEYS"));

    if (v53)
    {
      v7 = (void **)MEMORY[0x1E0DB11D8];
      goto LABEL_7;
    }
    objc_msgSend(v4, "identifier");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v54, "isEqualToString:", *MEMORY[0x1E0D80A20]);

    if (!v55)
      -[PUITCCAccessController setSpecifier:].cold.1();
    v12 = (void *)*MEMORY[0x1E0DB1178];
    -[PUITCCAccessController setFooter:](self, "setFooter:", CFSTR("NEARBY_INTERACTIONS_FOOTER"));
  }
LABEL_8:
  objc_storeStrong((id *)&self->_serviceKey, v12);
  objc_msgSend(v4, "propertyForKey:", CFSTR("PUITCCAccessControllerAppTypeKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUITCCAccessController setAppType:](self, "setAppType:", (int)objc_msgSend(v13, "intValue"));

  -[PUITCCAccessController footer](self, "footer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v15 = -[PUITCCAccessController appType](self, "appType");
    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "identifier");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v15)
    {
      objc_msgSend(v16, "stringWithFormat:", CFSTR("%@_CLIPS_FOOTER"), v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUITCCAccessController setClipsFooter:](self, "setClipsFooter:", v19);

    }
    else
    {
      objc_msgSend(v16, "stringWithFormat:", CFSTR("%@_FOOTER"), v17);
      v20 = objc_claimAutoreleasedReturnValue();

      -[PUITCCAccessController setFooter:](self, "setFooter:", v20);
      v18 = (void *)v20;
    }

  }
  v21 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("%@_EXPLANATION"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUITCCAccessController setExplanation:](self, "setExplanation:", v23);

}

- (id)specifiers
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t i;
  void *v9;
  __CFBundle *v10;
  __CFBundle *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  void *v53;
  void *v54;
  _BOOL4 v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  char v65;
  NSUInteger v66;
  _QWORD *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unsigned int v85;
  void *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  id v92;
  void *v93;
  id obj;
  void *v95;
  _QWORD v96[4];
  id v97;
  id v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  uint8_t v107[128];
  uint8_t buf[4];
  void *v109;
  _BYTE v110[128];
  uint64_t v111;

  v111 = *MEMORY[0x1E0C80C00];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80590]);
  if (v3)
    return v3;
  v79 = (int)*MEMORY[0x1E0D80590];
  v4 = (void *)TCCAccessCopyInformation();
  v95 = (void *)objc_opt_new();
  v86 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count") + 1);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v103, v110, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v104;
    v89 = *MEMORY[0x1E0D808D0];
    v91 = *MEMORY[0x1E0D808C0];
    v87 = *MEMORY[0x1E0D80990];
    v84 = *MEMORY[0x1E0D80780];
    v7 = (_QWORD *)MEMORY[0x1E0DB1098];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v104 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * i);
        v10 = (__CFBundle *)objc_msgSend(v9, "objectForKey:", *v7);
        v11 = v10;
        if (v10)
        {
          CFBundleGetIdentifier(v10);
          v12 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v95, "addObject:", v12);
          if (PUIIsAppClip(v12))
          {
            objc_msgSend(v86, "addObject:", v12);
            if (!-[PUITCCAccessController appType](self, "appType"))
              goto LABEL_19;
          }
          else if (-[PUITCCAccessController appType](self, "appType") == 1)
          {
            goto LABEL_19;
          }
          v13 = (void *)MEMORY[0x1E0D804E8];
          PUIDisplayNameForApp(v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v14, self, sel_setAccess_forSpecifier_, sel_accesssForSpecifier_, 0, 6, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "setIdentifier:", v12);
          objc_msgSend(v15, "setProperty:forKey:", v12, v91);
          objc_msgSend(v15, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], v89);
          objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0DB10A8]);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setProperty:forKey:", v16, v87);

          objc_msgSend(v15, "setProperty:forKey:", v12, CFSTR("appBundleID"));
          objc_msgSend(v15, "setProperty:forKey:", v12, CFSTR("PUITCCAccessControllerBundleIDKey"));
          -[PUITCCAccessController specifier](self, "specifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("PUITCCAccessControllerCellClassKey"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            -[PUITCCAccessController specifier](self, "specifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("PUITCCAccessControllerCellClassKey"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setProperty:forKey:", v20, v84);

          }
          -[PUITCCAccessController specifier](self, "specifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("PUITCCAccessControllerCellDelegateKey"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            -[PUITCCAccessController specifier](self, "specifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("PUITCCAccessControllerCellDelegateKey"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setProperty:forKey:", v24, CFSTR("PUITCCAccessControllerCellDelegateKey"));

          }
          objc_msgSend(v93, "addObject:", v15);

        }
        else
        {
          _PUILoggingFacility();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v109 = v9;
            _os_log_impl(&dword_1DB1FB000, v12, OS_LOG_TYPE_DEFAULT, "TCCAccess skipping app with nil bundle: %@", buf, 0xCu);
          }
        }
LABEL_19:

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v103, v110, 16);
    }
    while (v5);
  }

  PUIGetActivePairedDevice();
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[PUITCCAccessController appType](self, "appType") && v80 && objc_opt_class())
  {
    v25 = (void *)MEMORY[0x1E0C99E60];
    v26 = (void *)TCCAccessCopyBundleIdentifiersForService();
    objc_msgSend(v25, "setWithArray:", v26);
    v90 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = (void *)MEMORY[0x1E0C99E60];
    v28 = (void *)TCCAccessCopyBundleIdentifiersDisabledForService();
    objc_msgSend(v27, "setWithArray:", v28);
    v78 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v90, "setByAddingObjectsFromSet:", v78);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D51858], "sharedInstance");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    ScreenScale();
    if ((int)v30 == 2)
      v31 = 47;
    else
      v31 = 48;
    v85 = v31;
    v101 = 0u;
    v102 = 0u;
    v99 = 0u;
    v100 = 0u;
    v92 = v29;
    v32 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v99, v107, 16);
    if (v32)
    {
      v33 = *(_QWORD *)v100;
      v83 = *MEMORY[0x1E0D80870];
      v82 = *MEMORY[0x1E0D80990];
      v81 = *MEMORY[0x1E0D80780];
      do
      {
        v34 = 0;
        do
        {
          if (*(_QWORD *)v100 != v33)
            objc_enumerationMutation(v92);
          v35 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * v34);
          if ((objc_msgSend(v95, "containsObject:", v35) & 1) == 0)
          {
            objc_msgSend(v95, "addObject:", v35);
            PUIDisplayNameForWatchApp(v35);
            v36 = objc_claimAutoreleasedReturnValue();
            if (v36)
            {
              v37 = v35;
              v38 = (void *)MEMORY[0x1E0D804E8];
              goto LABEL_35;
            }
            PUIWatchBundleIDForBundleID(v35);
            v37 = objc_claimAutoreleasedReturnValue();
            PUIDisplayNameForWatchApp((void *)v37);
            v36 = objc_claimAutoreleasedReturnValue();
            if (!(v36 | v37))
              goto LABEL_41;
            v38 = (void *)MEMORY[0x1E0D804E8];
            v39 = v35;
            if (v36)
LABEL_35:
              v39 = (void *)v36;
            objc_msgSend(v38, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v39, self, sel_setAccess_forSpecifier_, sel_accesssForSpecifier_, 0, 6, 0);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "setIdentifier:", v35);
            PSBlankIconImage();
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "setProperty:forKey:", v41, v83);

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v90, "containsObject:", v35));
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "setProperty:forKey:", v42, v82);

            objc_msgSend(v40, "setProperty:forKey:", v35, CFSTR("appBundleID"));
            objc_msgSend(v40, "setProperty:forKey:", v35, CFSTR("PUITCCAccessControllerBundleIDKey"));
            -[PUITCCAccessController specifier](self, "specifier");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("PUITCCAccessControllerCellClassKey"));
            v44 = (void *)objc_claimAutoreleasedReturnValue();

            if (v44)
            {
              -[PUITCCAccessController specifier](self, "specifier");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("PUITCCAccessControllerCellClassKey"));
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "setProperty:forKey:", v46, v81);

            }
            -[PUITCCAccessController specifier](self, "specifier");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("PUITCCAccessControllerCellDelegateKey"));
            v48 = (void *)objc_claimAutoreleasedReturnValue();

            if (v48)
            {
              -[PUITCCAccessController specifier](self, "specifier");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("PUITCCAccessControllerCellDelegateKey"));
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "setProperty:forKey:", v50, CFSTR("PUITCCAccessControllerCellDelegateKey"));

            }
            objc_initWeak((id *)buf, self);
            v96[0] = MEMORY[0x1E0C809B0];
            v96[1] = 3221225472;
            v96[2] = __36__PUITCCAccessController_specifiers__block_invoke;
            v96[3] = &unk_1EA26B5F0;
            v51 = v40;
            v97 = v51;
            objc_copyWeak(&v98, (id *)buf);
            objc_msgSend(v88, "getIconForBundleID:iconVariant:block:timeout:", v37, v85, v96, -1.0);
            objc_msgSend(v93, "addObject:", v51);
            objc_destroyWeak(&v98);

            objc_destroyWeak((id *)buf);
          }
LABEL_41:
          ++v34;
        }
        while (v32 != v34);
        v52 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v99, v107, 16);
        v32 = v52;
      }
      while (v52);
    }

  }
  objc_msgSend(v93, "sortUsingComparator:", &__block_literal_global_1);
  v53 = (void *)objc_msgSend(v93, "copy");
  -[PUITCCAccessController setAppSpecifiers:](self, "setAppSpecifiers:", v53);

  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v54, "isAppClipsAllowed") && !-[PUITCCAccessController appType](self, "appType"))
    {
      v55 = -[PUITCCAccessController supportsClips](self, "supportsClips");

      if (!v55)
        goto LABEL_56;
      v56 = (void *)MEMORY[0x1E0D804E8];
      PUI_LocalizedStringForDimSum(CFSTR("APP_CLIPS"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v57, self, 0, 0, objc_opt_class(), 1, 0);
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      -[PUITCCAccessController specifier](self, "specifier");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "identifier");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setIdentifier:", v59);

      objc_msgSend(v54, "setObject:forKeyedSubscript:", &unk_1EA27E618, CFSTR("PUITCCAccessControllerAppTypeKey"));
      objc_msgSend(v54, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D808D0]);
      objc_msgSend(v54, "setObject:forKeyedSubscript:", CFSTR("com.apple.graphic-icon.app-clips"), *MEMORY[0x1E0D80880]);
      -[PUITCCAccessController specifier](self, "specifier");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("PUITCCAccessControllerCellClassKey"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      if (v61)
      {
        -[PUITCCAccessController specifier](self, "specifier");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "objectForKeyedSubscript:", CFSTR("PUITCCAccessControllerCellClassKey"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "setProperty:forKey:", v63, CFSTR("PUITCCAccessControllerCellClassKey"));

      }
      objc_msgSend(v93, "insertObject:atIndex:", v54, 0);
    }

  }
LABEL_56:
  if (objc_msgSend(v93, "count")
    || (-[PUITCCAccessController serviceKey](self, "serviceKey"),
        v64 = (void *)objc_claimAutoreleasedReturnValue(),
        v65 = objc_msgSend(v64, "isEqualToString:", *MEMORY[0x1E0DB1118]),
        v64,
        (v65 & 1) == 0))
  {
    v66 = -[NSString length](self->_header, "length");
    v67 = (_QWORD *)MEMORY[0x1E0D80848];
    if (v66)
    {
      objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, 0, 0, 0, 0, 0, 0);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      PUI_LocalizedStringForPrivacy(self->_header);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "setProperty:forKey:", v69, *v67);

      objc_msgSend(v93, "insertObject:atIndex:", v68, 0);
    }
    v70 = (void *)MEMORY[0x1E0D804E8];
    -[PUITCCAccessController appGroupHeader](self, "appGroupHeader");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v71, 0, 0, 0, 0, 0, 0);
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v72, "setIdentifier:", CFSTR("APP_GROUP"));
    -[PUITCCAccessController clipsFooter](self, "clipsFooter");
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    if (v73)
    {
      -[PUITCCAccessController clipsFooter](self, "clipsFooter");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      PUI_LocalizedStringForDimSum(v74);
    }
    else
    {
      -[PUITCCAccessController footer](self, "footer");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      PUI_LocalizedStringForPrivacy(v74);
    }
    v75 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v72, "setProperty:forKey:", v75, *v67);
    objc_msgSend(v93, "insertObject:atIndex:", v72, v66 != 0);

  }
  v76 = *(Class *)((char *)&self->super.super.super.super.super.isa + v79);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v79) = (Class)v93;

  -[PUITCCAccessController updateSpecifiersForImposedSettings](self, "updateSpecifiersForImposedSettings");
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v79);
  return v3;
}

void __36__PUITCCAccessController_specifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__PUITCCAccessController_specifiers__block_invoke_2;
  block[3] = &unk_1EA26B5C8;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v8);

}

void __36__PUITCCAccessController_specifiers__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "setProperty:forKey:", *(_QWORD *)(a1 + 40), *MEMORY[0x1E0D80870]);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "reloadSpecifier:", *(_QWORD *)(a1 + 32));

}

uint64_t __36__PUITCCAccessController_specifiers__block_invoke_3(uint64_t a1, void *a2, void *a3)
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

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUITCCAccessController;
  -[PUITCCAccessController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[PUITCCAccessController updateSpecifiersForImposedSettings](self, "updateSpecifiersForImposedSettings");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUITCCAccessController;
  -[PUITCCAccessController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PUITCCAccessController provideNavigationDonations](self, "provideNavigationDonations");
}

- (void)provideNavigationDonations
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  const __CFString *v19;
  const __CFString *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc(MEMORY[0x1E0CB3B78]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithKey:table:locale:bundleURL:", CFSTR("PRIVACY"), CFSTR("Privacy"), v6, v4);

  v29[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSString isEqualToString:](self->_serviceKey, "isEqualToString:", *MEMORY[0x1E0DB1158]))
  {
    v9 = objc_alloc(MEMORY[0x1E0CB3B78]);
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithKey:table:locale:bundleURL:", CFSTR("MEDIALIBRARY"), CFSTR("Privacy"), v10, v4);

    v12 = objc_alloc(MEMORY[0x1E0CB3B78]);
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "initWithKey:table:locale:bundleURL:", CFSTR("PRIVACY"), CFSTR("Privacy"), v13, v4);

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.PrivacyAndSecurity/MEDIALIBRARY"));
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v11 && v15)
      -[PUITCCAccessController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.privacy"), v11, v8, v15);
    v7 = (void *)v14;
  }
  else
  {
    if (-[NSString isEqualToString:](self->_serviceKey, "isEqualToString:", *MEMORY[0x1E0DB10E0]))
    {
      v17 = objc_alloc(MEMORY[0x1E0CB3B78]);
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v17, "initWithKey:table:locale:bundleURL:", CFSTR("BT_PERIPHERAL"), CFSTR("Privacy"), v18, v4);
      v19 = CFSTR("com.apple.graphic-icon.bluetooth");
      v20 = CFSTR("settings-navigation://com.apple.Settings.PrivacyAndSecurity/BT_PERIPHERAL");
    }
    else if (-[NSString isEqualToString:](self->_serviceKey, "isEqualToString:", *MEMORY[0x1E0DB11E8]))
    {
      v21 = objc_alloc(MEMORY[0x1E0CB3B78]);
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v21, "initWithKey:table:locale:bundleURL:", CFSTR("WILLOW"), CFSTR("Privacy"), v18, v4);
      v19 = CFSTR("com.apple.graphic-icon.home");
      v20 = CFSTR("settings-navigation://com.apple.Settings.PrivacyAndSecurity/WILLOW");
    }
    else if (-[NSString isEqualToString:](self->_serviceKey, "isEqualToString:", *MEMORY[0x1E0DB11D8]))
    {
      v22 = objc_alloc(MEMORY[0x1E0CB3B78]);
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v22, "initWithKey:table:locale:bundleURL:", CFSTR("PASSKEYS"), CFSTR("Privacy"), v18, v4);
      v19 = CFSTR("com.apple.graphic-icon.person-passkey");
      v20 = CFSTR("settings-navigation://com.apple.Settings.PrivacyAndSecurity/PASSKEYS");
    }
    else if (-[NSString isEqualToString:](self->_serviceKey, "isEqualToString:", *MEMORY[0x1E0DB1198]))
    {
      v23 = objc_alloc(MEMORY[0x1E0CB3B78]);
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v23, "initWithKey:table:locale:bundleURL:", CFSTR("REMINDERS"), CFSTR("Privacy"), v18, v4);
      v19 = CFSTR("com.apple.graphic-icon.privacy");
      v20 = CFSTR("settings-navigation://com.apple.Settings.PrivacyAndSecurity/REMINDERS");
    }
    else if (-[NSString isEqualToString:](self->_serviceKey, "isEqualToString:", *MEMORY[0x1E0DB10F0]))
    {
      v24 = objc_alloc(MEMORY[0x1E0CB3B78]);
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v24, "initWithKey:table:locale:bundleURL:", CFSTR("CAMERA"), CFSTR("Privacy"), v18, v4);
      v19 = CFSTR("com.apple.graphic-icon.camera");
      v20 = CFSTR("settings-navigation://com.apple.Settings.PrivacyAndSecurity/CAMERA");
    }
    else if (-[NSString isEqualToString:](self->_serviceKey, "isEqualToString:", *MEMORY[0x1E0DB1168]))
    {
      v25 = objc_alloc(MEMORY[0x1E0CB3B78]);
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v25, "initWithKey:table:locale:bundleURL:", CFSTR("MICROPHONE"), CFSTR("Privacy"), v18, v4);
      v19 = CFSTR("com.apple.graphic-icon.microphone-access");
      v20 = CFSTR("settings-navigation://com.apple.Settings.PrivacyAndSecurity/MICROPHONE");
    }
    else if (-[NSString isEqualToString:](self->_serviceKey, "isEqualToString:", *MEMORY[0x1E0DB1178]))
    {
      v26 = objc_alloc(MEMORY[0x1E0CB3B78]);
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v26, "initWithKey:table:locale:bundleURL:", CFSTR("NEARBY_INTERACTIONS"), CFSTR("Privacy"), v18, v4);
      v19 = CFSTR("com.apple.graphic-icon.nearby-interactions");
      v20 = CFSTR("settings-navigation://com.apple.Settings.PrivacyAndSecurity/NEARBY_INTERACTIONS");
    }
    else
    {
      if (!-[NSString isEqualToString:](self->_serviceKey, "isEqualToString:", *MEMORY[0x1E0DB11B8]))
      {
        v16 = 0;
        v11 = 0;
        goto LABEL_25;
      }
      v27 = objc_alloc(MEMORY[0x1E0CB3B78]);
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v27, "initWithKey:table:locale:bundleURL:", CFSTR("SPEECH_RECOGNITION"), CFSTR("Privacy"), v18, v4);
      v19 = CFSTR("com.apple.graphic-icon.waveform");
      v20 = CFSTR("settings-navigation://com.apple.Settings.PrivacyAndSecurity/SPEECH_RECOGNITION");
    }

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v20);
    v28 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v28;
    if (v11 && v28)
      -[PUITCCAccessController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", v19, v11, v8, v28);
  }
LABEL_25:

}

- (void)setAccess:(id)a3 forSpecifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  id v34;
  _QWORD v35[4];
  void (**v36)(_QWORD);
  _QWORD v37[4];
  id v38;
  id v39;
  PUITCCAccessController *v40;

  v6 = a3;
  v7 = a4;
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __49__PUITCCAccessController_setAccess_forSpecifier___block_invoke;
  v37[3] = &unk_1EA26B638;
  v8 = v6;
  v38 = v8;
  v9 = v7;
  v39 = v9;
  v40 = self;
  v10 = (void (**)(_QWORD))MEMORY[0x1DF0AB308](v37);
  if ((objc_msgSend(v8, "BOOLValue") & 1) != 0
    || (-[PUITCCAccessController specifier](self, "specifier"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PUITCCAccessControllerPromptTitleKey")),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        v11,
        !v12))
  {
    v10[2](v10);
  }
  else
  {
    -[PUITCCAccessController specifier](self, "specifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("PUITCCAccessControllerPromptTitleKey"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUITCCAccessController specifier](self, "specifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("PUITCCAccessControllerPromptDetailKey"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0CB3940];
    PUI_LocalizedStringForPrivacy(v32);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", v16, v17);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x1E0CB3940];
    PUI_LocalizedStringForPrivacy(v31);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v30, v21, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1E0DC3448];
    PUI_LocalizedStringForPrivacy(CFSTR("TCC_ALERT_TURN_OFF"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = MEMORY[0x1E0C809B0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __49__PUITCCAccessController_setAccess_forSpecifier___block_invoke_135;
    v35[3] = &unk_1EA26B660;
    v36 = v10;
    objc_msgSend(v23, "actionWithTitle:style:handler:", v24, 2, v35);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addAction:", v26);

    v27 = (void *)MEMORY[0x1E0DC3448];
    PUI_LocalizedStringForPrivacy(CFSTR("TCC_ALERT_CANCEL"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v25;
    v33[1] = 3221225472;
    v33[2] = __49__PUITCCAccessController_setAccess_forSpecifier___block_invoke_2;
    v33[3] = &unk_1EA26B688;
    v33[4] = self;
    v34 = v9;
    objc_msgSend(v27, "actionWithTitle:style:handler:", v28, 1, v33);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addAction:", v29);

    -[PUITCCAccessController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v22, 1, 0);
  }

}

void __49__PUITCCAccessController_setAccess_forSpecifier___block_invoke(id *a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  v3 = *MEMORY[0x1E0D80990];
  objc_msgSend(a1[5], "propertyForKey:", *MEMORY[0x1E0D80990]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v2, "isEqual:", v4);

  if ((v2 & 1) == 0)
  {
    v5 = objc_msgSend(a1[5], "propertyForKey:", CFSTR("appBundleID"));
    objc_msgSend(a1[4], "BOOLValue");
    TCCAccessSetForBundleId();
    objc_msgSend(a1[5], "setProperty:forKey:", a1[4], v3);
    if (objc_msgSend(a1[4], "BOOLValue"))
      v6 = 3;
    else
      v6 = 2;
    objc_msgSend(MEMORY[0x1E0D8D658], "trackingStateOfRequestForSpecificApp:view:", v6, CFSTR("PrivacyTracking"));
    _PUILoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v5;
      _os_log_impl(&dword_1DB1FB000, v7, OS_LOG_TYPE_DEFAULT, "########### Quitting application (%@) in response to privacy settings change.", (uint8_t *)&v10, 0xCu);
    }

  }
  objc_msgSend(a1[6], "serviceKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0DB11C8]);

  if (v9)
    PUIResetIDFAIfNeeded();
}

uint64_t __49__PUITCCAccessController_setAccess_forSpecifier___block_invoke_135(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __49__PUITCCAccessController_setAccess_forSpecifier___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifier:animated:", *(_QWORD *)(a1 + 40), 1);
}

- (id)accesssForSpecifier:(id)a3
{
  return (id)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x1E0D80990]);
}

+ (BOOL)isServiceRestricted:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  v3 = a3;
  CFPreferencesAppSynchronize(CFSTR("com.apple.springboard"));
  v4 = (void *)CFPreferencesCopyAppValue(CFSTR("SBParentalControlsCapabilities"), CFSTR("com.apple.springboard"));
  v5 = v4;
  if (v4)
    LOBYTE(v6) = objc_msgSend(v4, "containsObject:", v3);
  else
    LOBYTE(v6) = 0;
  TCCAccessGetOverride();
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DB11C8]))
  {
    v7 = (void *)objc_opt_new();
    v8 = v7;
    if ((v6 & 1) != 0)
      LOBYTE(v6) = 1;
    else
      v6 = objc_msgSend(v7, "crossAppTrackingAllowedSwitchEnabled") ^ 1;

  }
  return v6;
}

- (void)updateSpecifiersForImposedSettings
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int *v14;
  int v15;
  int v16;
  BOOL v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id obj;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend((id)objc_opt_class(), "isServiceRestricted:", self->_serviceKey) ^ 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[PUITCCAccessController appSpecifiers](self, "appSpecifiers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v24;
    v6 = *MEMORY[0x1E0D80808];
    v19 = *MEMORY[0x1E0D80990];
    v20 = *MEMORY[0x1E0D80940];
    v7 = (int *)MEMORY[0x1E0D805B0];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v24 != v5)
          objc_enumerationMutation(obj);
        v9 = *(char **)(*((_QWORD *)&v23 + 1) + 8 * v8);
        if (*(_QWORD *)&v9[*v7] == 6)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v8), "propertyForKey:", v6);
          v10 = objc_claimAutoreleasedReturnValue();
          if (!v10)
            goto LABEL_9;
          v11 = (void *)v10;
          objc_msgSend(v9, "objectForKeyedSubscript:", v6);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v5;
          v14 = v7;
          v15 = objc_msgSend(v12, "BOOLValue");
          v16 = objc_msgSend(v22, "BOOLValue");

          v17 = v15 == v16;
          v7 = v14;
          v5 = v13;
          if (!v17)
          {
LABEL_9:
            objc_msgSend(v9, "setProperty:forKey:", v22, v6, v19);
            objc_msgSend(v9, "propertyForKey:", v20);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setCellEnabled:", objc_msgSend(v22, "BOOLValue"));

            if ((objc_msgSend(v22, "BOOLValue") & 1) == 0)
              objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v19);
          }
        }
        ++v8;
      }
      while (v4 != v8);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v4);
  }

}

- (NSString)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1392);
}

- (NSString)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1400);
}

- (NSString)explanation
{
  return self->_explanation;
}

- (void)setExplanation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1408);
}

- (NSString)serviceKey
{
  return self->_serviceKey;
}

- (NSString)clipsFooter
{
  return self->_clipsFooter;
}

- (void)setClipsFooter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1416);
}

- (BOOL)supportsClips
{
  return self->_supportsClips;
}

- (void)setSupportsClips:(BOOL)a3
{
  self->_supportsClips = a3;
}

- (unint64_t)appType
{
  return self->_appType;
}

- (void)setAppType:(unint64_t)a3
{
  self->_appType = a3;
}

- (NSString)appGroupHeader
{
  return self->_appGroupHeader;
}

- (void)setAppGroupHeader:(id)a3
{
  objc_storeStrong((id *)&self->_appGroupHeader, a3);
}

- (NSArray)appSpecifiers
{
  return self->_appSpecifiers;
}

- (void)setAppSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_appSpecifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appSpecifiers, 0);
  objc_storeStrong((id *)&self->_appGroupHeader, 0);
  objc_storeStrong((id *)&self->_clipsFooter, 0);
  objc_storeStrong((id *)&self->_explanation, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_serviceKey, 0);
}

- (void)setSpecifier:.cold.1()
{
  __assert_rtn("-[PUITCCAccessController setSpecifier:]", "PUITCCAccessController.m", 137, "0");
}

@end
