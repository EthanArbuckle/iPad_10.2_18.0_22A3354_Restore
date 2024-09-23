@implementation PXProgrammaticNavigationDestination

- (BOOL)isTargetingAsset
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[PXProgrammaticNavigationDestination revealMode](self, "revealMode") != 1
    && -[PXProgrammaticNavigationDestination revealMode](self, "revealMode") != 2)
  {
    return 0;
  }
  if (-[PXProgrammaticNavigationDestination type](self, "type") == 6
    || -[PXProgrammaticNavigationDestination type](self, "type") == 19)
  {
    return 1;
  }
  -[PXProgrammaticNavigationDestination assetUUID](self, "assetUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v3 = 1;
  }
  else
  {
    -[PXProgrammaticNavigationDestination assetLocalIdentifier](self, "assetLocalIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v3 = 1;
    }
    else
    {
      -[PXProgrammaticNavigationDestination assetCloudIdentifier](self, "assetCloudIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v6 != 0;

    }
  }

  return v3;
}

- (int64_t)revealMode
{
  return self->_revealMode;
}

- (int64_t)type
{
  return self->_type;
}

- (PXProgrammaticNavigationDestination)initWithType:(int64_t)a3 revealMode:(int64_t)a4 assetUUID:(id)a5 assetCollectionUUID:(id)a6
{
  id v10;
  id v11;
  PXProgrammaticNavigationDestination *v12;
  PXProgrammaticNavigationDestination *v13;
  uint64_t v14;
  NSString *assetUUID;
  uint64_t v16;
  NSString *assetCollectionUUID;

  v10 = a5;
  v11 = a6;
  v12 = -[PXProgrammaticNavigationDestination init](self, "init");
  v13 = v12;
  if (v12)
  {
    v12->_type = a3;
    v12->_revealMode = a4;
    v14 = objc_msgSend(v10, "copy");
    assetUUID = v13->_assetUUID;
    v13->_assetUUID = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    assetCollectionUUID = v13->_assetCollectionUUID;
    v13->_assetCollectionUUID = (NSString *)v16;

  }
  return v13;
}

- (PXProgrammaticNavigationDestination)initWithType:(int64_t)a3 revealMode:(int64_t)a4
{
  return -[PXProgrammaticNavigationDestination initWithType:revealMode:assetUUID:assetCollectionUUID:](self, "initWithType:revealMode:assetUUID:assetCollectionUUID:", a3, a4, 0, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryViewMode, 0);
  objc_storeStrong((id *)&self->_completionKey, 0);
  objc_storeStrong((id *)&self->_additionalAttributes, 0);
  objc_storeStrong((id *)&self->_sidebarBackNavigationRootDestination, 0);
  objc_storeStrong((id *)&self->_memoryCreationText, 0);
  objc_storeStrong((id *)&self->_lemonadeNavigationDestination, 0);
  objc_storeStrong((id *)&self->_shelfSlug, 0);
  objc_storeStrong((id *)&self->_importSource, 0);
  objc_storeStrong((id *)&self->_socialGroupLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_socialGroupUUID, 0);
  objc_storeStrong((id *)&self->_personLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_personUUID, 0);
  objc_storeStrong((id *)&self->_collectionListName, 0);
  objc_storeStrong((id *)&self->_collectionListUUID, 0);
  objc_storeStrong((id *)&self->_assetCollectionTransientIdentifier, 0);
  objc_storeStrong((id *)&self->_assetCollectionCloudIdentifier, 0);
  objc_storeStrong((id *)&self->_assetCollectionLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_assetCollectionUUID, 0);
  objc_storeStrong((id *)&self->_assetCloudIdentifier, 0);
  objc_storeStrong((id *)&self->_assetLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_assetUUID, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_socialGroup, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_collectionHierarchy, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_collectionList, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_userAlbumName, 0);
}

- (PXProgrammaticNavigationDestination)initWithURL:(id)a3
{
  id v4;
  PXProgrammaticNavigationDestination *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void (**v12)(_QWORD);
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSString *source;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void (**v24)(_QWORD);
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  int v29;
  uint64_t v30;
  void *v31;
  int v32;
  uint64_t v33;
  PHCloudIdentifier *v34;
  void (**v35)(_QWORD);
  void *v36;
  void *v37;
  void **p_assetUUID;
  NSString *assetUUID;
  NSString *v40;
  void *v41;
  void *v42;
  void (**v43)(_QWORD);
  uint64_t v44;
  void *v45;
  uint64_t v46;
  NSString *v47;
  uint64_t v48;
  NSString *completionKey;
  uint64_t v50;
  uint64_t v51;
  NSString *libraryViewMode;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  PHCloudIdentifier *assetCloudIdentifier;
  uint64_t v60;
  NSString *assetCollectionUUID;
  void *v62;
  void *v63;
  void *v64;
  void (**v65)(_QWORD);
  void *v66;
  void *v67;
  void *v69;
  void *v70;
  void *v71;
  int v72;
  void *v73;
  unint64_t v74;
  uint64_t v75;
  id *p_assetCollectionLocalIdentifier;
  void *v77;
  void *v78;
  uint64_t v79;
  PHCloudIdentifier *assetCollectionCloudIdentifier;
  void *v81;
  int v82;
  void (**v83)(_QWORD);
  uint64_t v84;
  uint64_t v85;
  __int128 v86;
  NSString *shelfSlug;
  __int128 v88;
  uint64_t v89;
  NSString *v90;
  void (**v91)(_QWORD);
  void *v92;
  uint64_t v93;
  NSString *v94;
  uint64_t v95;
  NSString *assetCollectionLocalIdentifier;
  id *p_personUUID;
  uint64_t v98;
  NSString *v99;
  __int128 v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  NSObject *memoryCreationText;
  void *v105;
  uint64_t v106;
  NSObject *additionalAttributes;
  uint64_t v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  id v117;
  id v118;
  void (**v119)(_QWORD);
  id v120;
  id v121;
  _BOOL4 v122;
  id v123;
  unint64_t obj;
  _QWORD aBlock[4];
  PHCloudIdentifier *v126;

  v4 = a3;
  v5 = -[PXProgrammaticNavigationDestination init](self, "init");
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v4, 0);
    objc_msgSend(v6, "host");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PXProgrammaticNavigationPathComponentsForURLComponents(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PXProgrammaticNavigationQueryValuesForComponents(v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scheme");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("photos"));

    if (v11)
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __51__PXProgrammaticNavigationDestination_initWithURL___block_invoke;
      aBlock[3] = &unk_1E5149198;
      v126 = (PHCloudIdentifier *)v4;
      v12 = (void (**)(_QWORD))_Block_copy(aBlock);
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("identifier"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("uuid"));
      v14 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("name"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_prefersImmersiveMode = 0;
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("source"));
      v16 = objc_claimAutoreleasedReturnValue();
      source = v5->_source;
      v5->_source = (NSString *)v16;

      obj = (unint64_t)v13;
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("contentmode")))
      {
        v117 = v4;
        v120 = (id)v14;
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("id"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("assetuuid"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v116 = v7;
        if (!objc_msgSend(v19, "length"))
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("assetUUID"));
          v20 = v15;
          v21 = objc_claimAutoreleasedReturnValue();

          v19 = (void *)v21;
          v15 = v20;
        }
        v22 = v15;
        v23 = v8;
        v24 = v12;
        if (!objc_msgSend(v19, "length"))
        {
          v25 = (void *)MEMORY[0x1E0CD1698];
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("assetidentifier"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "uuidFromLocalIdentifier:", v26);
          v27 = objc_claimAutoreleasedReturnValue();

          v19 = (void *)v27;
        }
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("oneUp"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "BOOLValue");

        if (objc_msgSend(v18, "isEqualToString:", CFSTR("photos")))
        {
          v5->_type = 5;
          v12 = v24;
          if (v19)
          {
            v30 = 1;
            if (!v29)
              v30 = 2;
            v5->_revealMode = v30;
            objc_storeStrong((id *)&v5->_assetUUID, v19);
          }
          else
          {
            v5->_revealMode = 3;
          }
          v8 = v23;
          v15 = v22;
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("libraryViewMode"));
          v51 = objc_claimAutoreleasedReturnValue();
          libraryViewMode = v5->_libraryViewMode;
          v5->_libraryViewMode = (NSString *)v51;

        }
        else
        {
          v12 = v24;
          if (objc_msgSend(v18, "isEqualToString:", CFSTR("search")))
          {
            *(_OWORD *)&v5->_type = xmmword_1A7C0C630;
            v8 = v23;
            v7 = v116;
            v15 = v22;
LABEL_34:

LABEL_35:
            v4 = v117;
            v53 = (void *)obj;
LABEL_36:
            v14 = (uint64_t)v120;
LABEL_55:

            v34 = v126;
            goto LABEL_56;
          }
          v8 = v23;
          v15 = v22;
          if (!objc_msgSend(v18, "isEqualToString:", CFSTR("albums")))
          {
            v7 = v116;
            if (objc_msgSend(v18, "isEqualToString:", CFSTR("forYou")))
              *(_OWORD *)&v5->_type = xmmword_1A7C0C620;
            goto LABEL_34;
          }
          *(_OWORD *)&v5->_type = xmmword_1A7C0C550;
        }
        v7 = v116;
        goto LABEL_34;
      }
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("asset")))
      {
        v113 = v15;
        v35 = v12;
        *(_OWORD *)&v5->_type = xmmword_1A7BC4F00;
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("prefersImmersiveMode"));
        v36 = (void *)v14;
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v5->_prefersImmersiveMode = objc_msgSend(v37, "BOOLValue");

        objc_storeStrong((id *)&v5->_assetLocalIdentifier, v13);
        p_assetUUID = (void **)&v5->_assetUUID;
        v121 = v36;
        objc_storeStrong((id *)&v5->_assetUUID, v36);
        assetUUID = v5->_assetUUID;
        if (assetUUID)
        {
          v40 = assetUUID;
          v41 = *p_assetUUID;
          *p_assetUUID = v40;
          v12 = v35;
        }
        else
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("assetuuid"));
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v54;
          if (v54)
          {
            v55 = v54;
          }
          else
          {
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("assetUUID"));
            v55 = (id)objc_claimAutoreleasedReturnValue();
          }
          v12 = v35;
          v57 = *p_assetUUID;
          *p_assetUUID = v55;

        }
        v15 = v113;

        PXProgrammaticNavigationCloudIdentifierForURLQueryValues(v9);
        v58 = objc_claimAutoreleasedReturnValue();
        assetCloudIdentifier = v5->_assetCloudIdentifier;
        v5->_assetCloudIdentifier = (PHCloudIdentifier *)v58;

        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("albumuuid"));
        v60 = objc_claimAutoreleasedReturnValue();
        assetCollectionUUID = v5->_assetCollectionUUID;
        v5->_assetCollectionUUID = (NSString *)v60;

        v14 = (uint64_t)v121;
        if (!-[NSString length](v5->_assetCollectionUUID, "length"))
        {
          v62 = (void *)MEMORY[0x1E0CD13B8];
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("albumname"));
          v118 = v4;
          v63 = v7;
          v64 = v8;
          v65 = v12;
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = v62;
          v14 = (uint64_t)v121;
          v15 = v113;
          objc_msgSend(v67, "px_getType:subtype:forBuiltInAlbumName:", &v5->_assetCollectionType, &v5->_assetCollectionSubtype, v66);

          v12 = v65;
          v8 = v64;
          v7 = v63;
          v4 = v118;
        }
        goto LABEL_54;
      }
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("edit")))
      {
        v42 = v15;
        v43 = v12;
        v44 = v14;
        objc_msgSend(v8, "firstObject");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v45, "isEqualToString:", CFSTR("enter")) & 1) != 0)
        {
          v122 = +[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled");

          v14 = v44;
          v12 = v43;
          v15 = v42;
          if (v122)
          {
            *(_OWORD *)&v5->_type = xmmword_1A7BC4F00;
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("assetUUID"));
            v46 = objc_claimAutoreleasedReturnValue();
            v47 = v5->_assetUUID;
            v5->_assetUUID = (NSString *)v46;

            v5->_wantsEditMode = 1;
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("completionKey"));
            v48 = objc_claimAutoreleasedReturnValue();
            completionKey = v5->_completionKey;
            v5->_completionKey = (NSString *)v48;

LABEL_54:
            v53 = (void *)obj;
            goto LABEL_55;
          }
        }
        else
        {

          v14 = v44;
          v12 = v43;
          v15 = v42;
        }
      }
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("lastasset")))
      {
        *(_OWORD *)&v5->_type = xmmword_1A7BB85D0;
        goto LABEL_54;
      }
      v53 = (void *)obj;
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("allphotos")))
      {
        v5->_type = 5;
        goto LABEL_55;
      }
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("folder")))
      {
        v5->_type = 17;
        objc_storeStrong((id *)&v5->_collectionListUUID, (id)v14);
        objc_storeStrong((id *)&v5->_collectionListName, v15);
        *(_OWORD *)&v5->_collectionListType = xmmword_1A7C0C610;
        v5->_revealMode = 3;
        goto LABEL_55;
      }
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("album")))
      {
        v119 = v12;
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("revealassetuuid"));
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v112 = v69;
        v70 = (void *)v14;
        if (v69)
        {
          *(_OWORD *)&v5->_type = xmmword_1A7C0C600;
          objc_storeStrong((id *)&v5->_assetUUID, v69);
        }
        else
        {
          *(_OWORD *)&v5->_type = xmmword_1A7C0C550;
        }
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("show-options"));
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v111, "lowercaseString");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = objc_msgSend(v71, "isEqualToString:", CFSTR("true"));

        if (v72)
          v5->_displayAlbumOptions = 1;
        v73 = v70;
        v74 = v70;
        v123 = v15;
        objc_msgSend(MEMORY[0x1E0CD16F8], "px_transientIdentifierForWellKnownAssetCollectionName:");
        v75 = objc_claimAutoreleasedReturnValue();
        v114 = v15;
        v109 = (void *)v75;
        v110 = (void *)v74;
        if (v74 | obj)
        {
          objc_storeStrong((id *)&v5->_assetCollectionUUID, v73);
          p_assetCollectionLocalIdentifier = (id *)&v5->_assetCollectionLocalIdentifier;
          v77 = (void *)obj;
        }
        else
        {
          v78 = (void *)v75;
          if (!v75)
          {
            v5->_utilityCollectionType = objc_msgSend(MEMORY[0x1E0CD1800], "px_utilityCollectionTypeforBuiltInAlbumName:", v123, 0);
            objc_msgSend(MEMORY[0x1E0CD13B8], "px_getType:subtype:forBuiltInAlbumName:", &v5->_assetCollectionType, &v5->_assetCollectionSubtype, v123);
            goto LABEL_80;
          }
          p_assetCollectionLocalIdentifier = (id *)&v5->_assetCollectionTransientIdentifier;
          v77 = v78;
        }
        objc_storeStrong(p_assetCollectionLocalIdentifier, v77);
LABEL_80:
        PXProgrammaticNavigationCloudIdentifierForURLQueryValues(v9);
        v79 = objc_claimAutoreleasedReturnValue();
        assetCollectionCloudIdentifier = v5->_assetCollectionCloudIdentifier;
        v5->_assetCollectionCloudIdentifier = (PHCloudIdentifier *)v79;

        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("render"));
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = objc_msgSend(v81, "BOOLValue");

        if (v82)
          v5->_renderAlbumAssetsWithDeferredProcessing = 1;

        v14 = (uint64_t)v110;
        v12 = v119;
        v15 = v114;
        goto LABEL_54;
      }
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("userAlbum")))
      {
        *(_OWORD *)&v5->_type = xmmword_1A7C0C550;
        objc_storeStrong((id *)&v5->_userAlbumName, v15);
        *(_OWORD *)&v5->_assetCollectionType = xmmword_1A7BA05F0;
        goto LABEL_55;
      }
      if (objc_msgSend(v7, "isEqual:", CFSTR("memory")))
      {
        if (!(obj | v14) || obj && v14)
          v12[2](v12);
        if (obj)
        {
          if (!v14)
          {
            objc_msgSend(MEMORY[0x1E0CD1698], "uuidFromLocalIdentifier:", obj);
            v14 = objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CD1630], "localIdentifierWithUUID:", v14);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_storeStrong((id *)&v5->_assetCollectionLocalIdentifier, v53);
        objc_storeStrong((id *)&v5->_assetCollectionUUID, (id)v14);
        v5->_assetCollectionType = 4;
        v88 = xmmword_1A7C0C560;
        goto LABEL_95;
      }
      if (objc_msgSend(v7, "isEqual:", CFSTR("shelf")))
      {
        v115 = v15;
        v83 = v12;
        v84 = v14;
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("id"));
        v85 = objc_claimAutoreleasedReturnValue();
        if (!v85)
          v83[2](v83);
        v86 = xmmword_1A7C0C5F0;
LABEL_92:
        *(_OWORD *)&v5->_type = v86;
        shelfSlug = v5->_shelfSlug;
        v5->_shelfSlug = (NSString *)v85;

        v14 = v84;
        v12 = v83;
        v15 = v115;
        goto LABEL_55;
      }
      if (objc_msgSend(v7, "isEqual:", CFSTR("shelf-details")))
      {
        v115 = v15;
        v83 = v12;
        v84 = v14;
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("id"));
        v85 = objc_claimAutoreleasedReturnValue();
        if (!v85)
          v83[2](v83);
        v86 = xmmword_1A7C0C5E0;
        goto LABEL_92;
      }
      if (objc_msgSend(v7, "isEqual:", CFSTR("memoryfeed")))
      {
        v88 = xmmword_1A7BF1240;
LABEL_95:
        *(_OWORD *)&v5->_type = v88;
        goto LABEL_55;
      }
      if (objc_msgSend(v7, "isEqual:", CFSTR("events")))
      {
        *(_OWORD *)&v5->_type = xmmword_1A7BCF630;
        v5->_assetCollectionType = 6;
        if (v14 || !obj)
        {
          objc_storeStrong((id *)&v5->_assetCollectionUUID, (id)v14);
          if (!obj && v14)
          {
            objc_msgSend(MEMORY[0x1E0CD1708], "localIdentifierWithUUID:", v14);
            v95 = objc_claimAutoreleasedReturnValue();
            assetCollectionLocalIdentifier = v5->_assetCollectionLocalIdentifier;
            v5->_assetCollectionLocalIdentifier = (NSString *)v95;

            v53 = 0;
            goto LABEL_55;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CD1698], "uuidFromLocalIdentifier:", obj);
          v89 = objc_claimAutoreleasedReturnValue();
          v90 = v5->_assetCollectionUUID;
          v5->_assetCollectionUUID = (NSString *)v89;

        }
        v53 = (void *)obj;
        objc_storeStrong((id *)&v5->_assetCollectionLocalIdentifier, (id)obj);
        goto LABEL_55;
      }
      v117 = v4;
      v120 = (id)v14;
      v91 = v12;
      v92 = v7;
      if (objc_msgSend(v7, "isEqual:", CFSTR("trips")))
      {
        *(_OWORD *)&v5->_type = xmmword_1A7BCF640;
        v5->_assetCollectionType = 6;
        if (!v14 && obj)
        {
          objc_msgSend(MEMORY[0x1E0CD1698], "uuidFromLocalIdentifier:", obj);
          v93 = objc_claimAutoreleasedReturnValue();
          v94 = v5->_assetCollectionUUID;
          v5->_assetCollectionUUID = (NSString *)v93;

LABEL_115:
          v53 = (void *)obj;
          objc_storeStrong((id *)&v5->_assetCollectionLocalIdentifier, (id)obj);
LABEL_116:
          v12 = v91;
          v4 = v117;
          goto LABEL_36;
        }
        objc_storeStrong((id *)&v5->_assetCollectionUUID, (id)v14);
        if (obj || !v14)
          goto LABEL_115;
        objc_msgSend(MEMORY[0x1E0CD1708], "localIdentifierWithUUID:", v14);
        v98 = objc_claimAutoreleasedReturnValue();
        v99 = v5->_assetCollectionLocalIdentifier;
        v5->_assetCollectionLocalIdentifier = (NSString *)v98;

        v53 = 0;
LABEL_120:
        v12 = v91;
        v4 = v117;
        goto LABEL_55;
      }
      if (objc_msgSend(v7, "isEqual:", CFSTR("people")))
      {
        *(_OWORD *)&v5->_type = xmmword_1A7C0C5D0;
        v53 = (void *)obj;
        objc_storeStrong((id *)&v5->_personLocalIdentifier, (id)obj);
        p_personUUID = (id *)&v5->_personUUID;
LABEL_119:
        objc_storeStrong(p_personUUID, (id)v14);
        goto LABEL_120;
      }
      if (objc_msgSend(v7, "isEqual:", CFSTR("social-groups")))
      {
        *(_OWORD *)&v5->_type = xmmword_1A7C0C5C0;
        v53 = (void *)obj;
        objc_storeStrong((id *)&v5->_socialGroupLocalIdentifier, (id)obj);
        p_personUUID = (id *)&v5->_socialGroupUUID;
        goto LABEL_119;
      }
      if (objc_msgSend(v7, "isEqual:", CFSTR("places")))
      {
        v100 = xmmword_1A7BD3430;
      }
      else if (objc_msgSend(v7, "isEqual:", CFSTR("icloud-links")))
      {
        v100 = xmmword_1A7C0C5B0;
      }
      else if (objc_msgSend(v7, "isEqualToString:", CFSTR("profile")))
      {
        v100 = xmmword_1A7C0C5A0;
      }
      else if (objc_msgSend(v7, "isEqual:", CFSTR("photoschallengesubmission")))
      {
        v100 = xmmword_1A7BC7470;
      }
      else
      {
        if (!objc_msgSend(v7, "isEqual:", CFSTR("spatial")))
        {
          if (objc_msgSend(v7, "isEqualToString:", CFSTR("featuredPhoto")))
          {
            *(_OWORD *)&v5->_type = xmmword_1A7C0C590;
            v53 = (void *)obj;
            objc_storeStrong((id *)&v5->_assetCollectionLocalIdentifier, (id)obj);
            v5->_assetCollectionType = 8;
            goto LABEL_116;
          }
          if (objc_msgSend(v7, "isEqualToString:", CFSTR("forYou")))
          {
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("type"));
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v101, "isEqualToString:", CFSTR("sharedLibrarySuggestions")))
              *(_OWORD *)&v5->_type = xmmword_1A7BE2FF0;
          }
          else
          {
            if (!objc_msgSend(v7, "isEqualToString:", CFSTR("library")))
            {
              if (objc_msgSend(v7, "isEqualToString:", CFSTR("memory-generation")))
              {
                *(_OWORD *)&v5->_type = xmmword_1A7C0C580;
                objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("query"));
                v103 = objc_claimAutoreleasedReturnValue();
                memoryCreationText = v5->_memoryCreationText;
                v5->_memoryCreationText = (NSString *)v103;
              }
              else
              {
                if (objc_msgSend(v7, "isEqualToString:", CFSTR("oneyearago"))
                  && +[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"))
                {
                  *(_OWORD *)&v5->_type = xmmword_1A7C0C570;
                  PXLocalizedStringFromTable(CFSTR("SEARCH_SUGGESTION_LAST_YEAR"), CFSTR("PhotosUICore"));
                  v105 = (void *)objc_claimAutoreleasedReturnValue();
                  +[PXSearchNavigationAttributes attributesWithGenericSearchText:](PXSearchNavigationAttributes, "attributesWithGenericSearchText:", v105);
                  v106 = objc_claimAutoreleasedReturnValue();
                  additionalAttributes = v5->_additionalAttributes;
                  v5->_additionalAttributes = v106;

                  goto LABEL_132;
                }
                if (!objc_msgSend(v7, "isEqualToString:", CFSTR("cloudfeed"))
                  || !+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"))
                {
                  goto LABEL_132;
                }
                v5->_type = 20;
                +[PXSharedAlbumNavigationAttributes attributesForURLComponents:](PXSharedAlbumNavigationAttributes, "attributesForURLComponents:", v6);
                v108 = objc_claimAutoreleasedReturnValue();
                memoryCreationText = v5->_additionalAttributes;
                v5->_additionalAttributes = v108;
              }

LABEL_132:
              v7 = v92;
              v12 = v91;
              goto LABEL_35;
            }
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("zoomLevel"));
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v101, "isEqualToString:", CFSTR("all-photos")))
            {
              v102 = 5;
            }
            else if (objc_msgSend(v101, "isEqualToString:", CFSTR("days")))
            {
              v102 = 4;
            }
            else if (objc_msgSend(v101, "isEqualToString:", CFSTR("months")))
            {
              v102 = 3;
            }
            else if (objc_msgSend(v101, "isEqualToString:", CFSTR("years")))
            {
              v102 = 2;
            }
            else
            {
              v102 = 1;
            }
            v5->_type = v102;
            v5->_revealMode = 1;
          }

          goto LABEL_132;
        }
        v100 = xmmword_1A7BCF620;
      }
      *(_OWORD *)&v5->_type = v100;
      goto LABEL_132;
    }
    objc_msgSend(v6, "scheme");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "isEqualToString:", CFSTR("photos-navigation"));

    if (v32)
    {
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("search")))
      {
        *(_OWORD *)&v5->_type = xmmword_1A7C0C570;
        +[PXSearchNavigationAttributes attributesForURLComponents:](PXSearchNavigationAttributes, "attributesForURLComponents:", v6);
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = (PHCloudIdentifier *)v5->_additionalAttributes;
        v5->_additionalAttributes = v33;
LABEL_56:

        goto LABEL_57;
      }
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("memories")))
      {
        *(_OWORD *)&v5->_type = xmmword_1A7C0C560;
      }
      else
      {
        if (objc_msgSend(v7, "isEqualToString:", CFSTR("asset")))
        {
          *(_OWORD *)&v5->_type = xmmword_1A7BC4F00;
          PXProgrammaticNavigationCloudIdentifierForURLQueryValues(v9);
          v50 = objc_claimAutoreleasedReturnValue();
          v34 = v5->_assetCloudIdentifier;
          v5->_assetCloudIdentifier = (PHCloudIdentifier *)v50;
          goto LABEL_56;
        }
        if (objc_msgSend(v7, "isEqualToString:", CFSTR("album")))
        {
          *(_OWORD *)&v5->_type = xmmword_1A7C0C550;
          PXProgrammaticNavigationCloudIdentifierForURLQueryValues(v9);
          v56 = objc_claimAutoreleasedReturnValue();
          v34 = v5->_assetCollectionCloudIdentifier;
          v5->_assetCollectionCloudIdentifier = (PHCloudIdentifier *)v56;
          goto LABEL_56;
        }
      }
    }
LABEL_57:

  }
  return v5;
}

- (PXProgrammaticNavigationDestination)initWithObject:(id)a3 revealMode:(int64_t)a4
{
  return -[PXProgrammaticNavigationDestination initWithObject:revealMode:sidebarNavigationBackButtonRootDestination:](self, "initWithObject:revealMode:sidebarNavigationBackButtonRootDestination:", a3, a4, 0);
}

- (PXProgrammaticNavigationDestination)initWithObject:(id)a3 revealMode:(int64_t)a4 sidebarNavigationBackButtonRootDestination:(id)a5
{
  id v10;
  id v11;
  PXProgrammaticNavigationDestination *v12;
  PXProgrammaticNavigationDestination *v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  PXDisplayCollectionList *collectionList;
  id v20;
  uint64_t v21;
  NSString *collectionListUUID;
  uint64_t v23;
  void *v24;
  char v25;
  void *v26;
  char v27;
  uint64_t v28;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  NSString *assetCollectionUUID;
  void *v34;
  void *v35;

  v10 = a3;
  v11 = a5;
  v12 = -[PXProgrammaticNavigationDestination init](self, "init");
  v13 = v12;
  if (v12)
  {
    v12->_revealMode = a4;
    objc_storeStrong((id *)&v12->_sidebarBackNavigationRootDestination, a5);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v10;
      if ((objc_msgSend(v14, "px_isPhotosVirtualCollection") & 1) != 0)
      {
        v15 = 1;
LABEL_22:
        v28 = 80;
LABEL_23:
        *(Class *)((char *)&v13->super.isa + v28) = (Class)v15;

        goto LABEL_24;
      }
      if ((objc_msgSend(v14, "px_isForYouVirtualCollection") & 1) != 0)
      {
        v15 = 18;
        goto LABEL_22;
      }
      if ((objc_msgSend(v14, "px_isSharedActivityVirtualCollection") & 1) != 0)
      {
        v15 = 20;
        goto LABEL_22;
      }
      if (objc_msgSend(v14, "isTransient"))
      {
        objc_msgSend(v14, "transientIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("PXPhotosSearchVirtualCollection"));

        if ((v25 & 1) != 0)
        {
          v15 = 14;
          goto LABEL_22;
        }
      }
      if (objc_msgSend(v14, "isTransient"))
      {
        objc_msgSend(v14, "transientIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("PXPrototypeVirtualCollection"));

        if ((v27 & 1) != 0)
        {
          v15 = 16;
          goto LABEL_22;
        }
      }
      if ((objc_msgSend(v14, "px_isContentSyndicationAlbum") & 1) != 0)
      {
        v30 = 8;
      }
      else
      {
        v31 = objc_msgSend(v14, "assetCollectionType");
        if (v31 > 0xB)
        {
LABEL_30:
          objc_storeStrong((id *)&v13->_assetCollection, a3);
          objc_msgSend(v14, "uuid");
          v32 = objc_claimAutoreleasedReturnValue();
          assetCollectionUUID = v13->_assetCollectionUUID;
          v13->_assetCollectionUUID = (NSString *)v32;

          v13->_assetCollectionType = objc_msgSend(v14, "assetCollectionType");
          v15 = objc_msgSend(v14, "assetCollectionSubtype");
          v28 = 168;
          goto LABEL_23;
        }
        v30 = qword_1A7C099D0[v31];
      }
      v13->_type = v30;
      goto LABEL_30;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("PXProgrammaticNavigationDestination.m"), 367, CFSTR("%@ currently only supports PHAssetCollection and PHCollectionList objects."), v35);

      abort();
    }
    v16 = v10;
    if ((objc_msgSend(v16, "px_isTripsVirtualCollection") & 1) != 0)
    {
      v17 = 28;
    }
    else
    {
      v18 = objc_msgSend(v16, "collectionListType");
      if ((unint64_t)(v18 - 1) > 2)
      {
LABEL_13:
        collectionList = v13->_collectionList;
        v13->_collectionList = (PXDisplayCollectionList *)v16;
        v20 = v16;

        objc_msgSend(v20, "uuid");
        v21 = objc_claimAutoreleasedReturnValue();
        collectionListUUID = v13->_collectionListUUID;
        v13->_collectionListUUID = (NSString *)v21;

        v13->_collectionListType = objc_msgSend(v20, "collectionListType");
        v23 = objc_msgSend(v20, "collectionListSubtype");

        v13->_collectionListSubtype = v23;
        goto LABEL_24;
      }
      v17 = qword_1A7C09A30[v18 - 1];
    }
    v13->_type = v17;
    goto LABEL_13;
  }
LABEL_24:

  return v13;
}

- (PXProgrammaticNavigationDestination)initWithType:(int64_t)a3 revealMode:(int64_t)a4 asset:(id)a5 assetCollection:(id)a6
{
  id v11;
  id v12;
  PXProgrammaticNavigationDestination *v13;
  PXProgrammaticNavigationDestination *v14;
  uint64_t v15;
  NSString *assetUUID;
  uint64_t v17;
  NSString *assetCollectionUUID;

  v11 = a5;
  v12 = a6;
  v13 = -[PXProgrammaticNavigationDestination init](self, "init");
  v14 = v13;
  if (v13)
  {
    v13->_type = a3;
    v13->_revealMode = a4;
    objc_storeStrong((id *)&v13->_asset, a5);
    objc_msgSend(v11, "uuid");
    v15 = objc_claimAutoreleasedReturnValue();
    assetUUID = v14->_assetUUID;
    v14->_assetUUID = (NSString *)v15;

    objc_storeStrong((id *)&v14->_assetCollection, a6);
    objc_msgSend(v12, "uuid");
    v17 = objc_claimAutoreleasedReturnValue();
    assetCollectionUUID = v14->_assetCollectionUUID;
    v14->_assetCollectionUUID = (NSString *)v17;

  }
  return v14;
}

- (PXProgrammaticNavigationDestination)initWithImportSource:(id)a3 revealMode:(int64_t)a4
{
  id v7;
  PXProgrammaticNavigationDestination *v8;
  PXProgrammaticNavigationDestination *v9;

  v7 = a3;
  v8 = -[PXProgrammaticNavigationDestination initWithType:revealMode:](self, "initWithType:revealMode:", 21, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_importSource, a3);

  return v9;
}

- (PXProgrammaticNavigationDestination)initWithSearchTerm:(id)a3
{
  id v4;
  PXProgrammaticNavigationDestination *v5;
  uint64_t v6;
  NSObject *additionalAttributes;

  v4 = a3;
  v5 = -[PXProgrammaticNavigationDestination initWithType:revealMode:](self, "initWithType:revealMode:", 14, 1);
  if (v5)
  {
    +[PXSearchNavigationAttributes attributesWithGenericSearchTerm:](PXSearchNavigationAttributes, "attributesWithGenericSearchTerm:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    additionalAttributes = v5->_additionalAttributes;
    v5->_additionalAttributes = v6;

  }
  return v5;
}

- (PXProgrammaticNavigationDestination)initWithSearchText:(id)a3
{
  id v4;
  PXProgrammaticNavigationDestination *v5;
  uint64_t v6;
  NSObject *additionalAttributes;

  v4 = a3;
  v5 = -[PXProgrammaticNavigationDestination initWithType:revealMode:](self, "initWithType:revealMode:", 14, 1);
  if (v5)
  {
    +[PXSearchNavigationAttributes attributesWithGenericSearchText:](PXSearchNavigationAttributes, "attributesWithGenericSearchText:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    additionalAttributes = v5->_additionalAttributes;
    v5->_additionalAttributes = v6;

  }
  return v5;
}

- (PXProgrammaticNavigationDestination)initWithLemonadeNavigationDestination:(id)a3
{
  id v5;
  PXProgrammaticNavigationDestination *v6;
  PXProgrammaticNavigationDestination *v7;

  v5 = a3;
  v6 = -[PXProgrammaticNavigationDestination initWithType:revealMode:](self, "initWithType:revealMode:", 32, 1);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_lemonadeNavigationDestination, a3);

  return v7;
}

- (BOOL)isLemonadeHome
{
  void *v4;
  char v5;

  if (-[PXProgrammaticNavigationDestination type](self, "type") == 14)
    return 1;
  -[PXProgrammaticNavigationDestination assetCollection](self, "assetCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "px_isMomentsVirtualCollection");

  return v5;
}

- (PXDisplayAsset)asset
{
  PXDisplayAsset *asset;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PXDisplayAsset *v10;
  PXDisplayAsset *v11;
  uint64_t v13;
  void *v14;
  void *v15;
  PXDisplayAsset *v16;
  PXDisplayAsset *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  asset = self->_asset;
  if (!asset)
  {
    -[PXProgrammaticNavigationDestination assetUUID](self, "assetUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXProgrammaticNavigationDestination assetLocalIdentifier](self, "assetLocalIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5 && v4)
    {
      objc_msgSend(MEMORY[0x1E0CD1390], "localIdentifierWithUUID:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (v5)
      goto LABEL_6;
    -[PXProgrammaticNavigationDestination assetCloudIdentifier](self, "assetCloudIdentifier");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
      goto LABEL_12;
    v14 = (void *)v13;
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PXProgrammaticNavigationLocalIdentifierForCloudIdentifier(v14, v15);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
LABEL_6:
      objc_msgSend(MEMORY[0x1E0CD1570], "px_standardFetchOptions");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setIncludeHiddenAssets:", 1);
      objc_msgSend(v6, "setIncludeGuestAssets:", 1);
      v7 = (void *)MEMORY[0x1E0CD1390];
      v18[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "fetchAssetsWithLocalIdentifiers:options:", v8, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v10 = (PXDisplayAsset *)objc_claimAutoreleasedReturnValue();
      v11 = self->_asset;
      self->_asset = v10;

    }
    else
    {
LABEL_12:
      if (-[PXProgrammaticNavigationDestination type](self, "type") != 19)
        goto LABEL_8;
      objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXProgrammaticNavigationDestination assetCollectionLocalIdentifier](self, "assetCollectionLocalIdentifier");
      v16 = (PXDisplayAsset *)objc_claimAutoreleasedReturnValue();
      v6 = v16;
      if (v16)
      {
        objc_msgSend(v5, "px_fetchAssetForSuggestionWithLocalIdentifier:", v16);
        v16 = (PXDisplayAsset *)objc_claimAutoreleasedReturnValue();
      }
      v17 = self->_asset;
      self->_asset = v16;

    }
LABEL_8:

    asset = self->_asset;
  }
  return asset;
}

- (BOOL)isTargetingAlbum
{
  void *v2;
  char v3;

  -[PXProgrammaticNavigationDestination assetCollection](self, "assetCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "px_isUserCreated") & 1) != 0 || (objc_msgSend(v2, "px_isSmartAlbum") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "px_isLemonadeUtilitiesAlbum");

  return v3;
}

- (PXDisplayAssetCollection)assetCollection
{
  PXDisplayAssetCollection *assetCollection;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PXDisplayAssetCollection *v15;
  PXDisplayAssetCollection *v16;
  PXDisplayAssetCollection *v17;
  PXDisplayAssetCollection *v18;
  void *v19;
  void *v20;
  id v21;
  PXDisplayAssetCollection *v22;
  PXDisplayAssetCollection *v23;
  void *v25;
  void *v26;
  PXDisplayAssetCollection *v27;
  PXDisplayAssetCollection *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  assetCollection = self->_assetCollection;
  if (!assetCollection)
  {
    -[PXProgrammaticNavigationDestination assetCollectionUUID](self, "assetCollectionUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXProgrammaticNavigationDestination assetCollectionLocalIdentifier](self, "assetCollectionLocalIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5 && v4)
    {
      objc_msgSend(MEMORY[0x1E0CD13B8], "localIdentifierWithUUID:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[PXProgrammaticNavigationDestination assetCollectionTransientIdentifier](self, "assetCollectionTransientIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      -[PXProgrammaticNavigationDestination assetCollectionCloudIdentifier](self, "assetCollectionCloudIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        PXProgrammaticNavigationLocalIdentifierForCloudIdentifier(v8, v7);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = 0;
      }

    }
    objc_msgSend(v7, "librarySpecificFetchOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v5)
    {
      objc_msgSend(v10, "setIncludeScreenRecordingsSmartAlbum:", 1);
      objc_msgSend(v11, "setIncludeLocalMemories:", 1);
      objc_msgSend(v11, "setIncludeStoryMemories:", 1);
      objc_msgSend(v11, "setIncludePendingMemories:", 1);
      objc_msgSend(v11, "setIncludeProResSmartAlbum:", 1);
      objc_msgSend(v11, "setIncludeSharedLibrarySharingSuggestionsSmartAlbum:", 1);
      v12 = (void *)MEMORY[0x1E0CD13B8];
      v29[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "fetchAssetCollectionsWithLocalIdentifiers:options:", v13, v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "firstObject");
      v15 = (PXDisplayAssetCollection *)objc_claimAutoreleasedReturnValue();
      v16 = self->_assetCollection;
      self->_assetCollection = v15;

LABEL_23:
      assetCollection = self->_assetCollection;
      return assetCollection;
    }
    if (v6)
    {
      objc_msgSend(v7, "px_assetCollectionWithTransientIdentifier:", v6);
      v17 = (PXDisplayAssetCollection *)objc_claimAutoreleasedReturnValue();
      v18 = self->_assetCollection;
      self->_assetCollection = v17;

      goto LABEL_23;
    }
    if (-[PXProgrammaticNavigationDestination utilityCollectionType](self, "utilityCollectionType"))
    {
      objc_msgSend(MEMORY[0x1E0CD13B8], "fetchUtilityCollectionsWithType:options:", -[PXProgrammaticNavigationDestination utilityCollectionType](self, "utilityCollectionType"), v11);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!-[PXProgrammaticNavigationDestination assetCollectionType](self, "assetCollectionType"))
      {
        -[PXProgrammaticNavigationDestination asset](self, "asset");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
          v21 = v25;
        else
          v21 = 0;

        if (objc_msgSend(v21, "sourceType") == 2)
        {
          objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsContainingAsset:withType:options:", v21, 1, 0);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "firstObject");
          v27 = (PXDisplayAssetCollection *)objc_claimAutoreleasedReturnValue();
          v28 = self->_assetCollection;
          self->_assetCollection = v27;

        }
        goto LABEL_22;
      }
      if (-[PXProgrammaticNavigationDestination assetCollectionType](self, "assetCollectionType") == 1
        && self->_userAlbumName)
      {
        objc_msgSend(v11, "setIncludeAllPhotosSmartAlbum:", 0);
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("title == %@"), self->_userAlbumName);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setPredicate:", v20);

      }
      objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", -[PXProgrammaticNavigationDestination assetCollectionType](self, "assetCollectionType"), -[PXProgrammaticNavigationDestination assetCollectionSubtype](self, "assetCollectionSubtype"), v11);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v21 = v19;
    objc_msgSend(v19, "firstObject");
    v22 = (PXDisplayAssetCollection *)objc_claimAutoreleasedReturnValue();
    v23 = self->_assetCollection;
    self->_assetCollection = v22;

LABEL_22:
    goto LABEL_23;
  }
  return assetCollection;
}

- (PXDisplayCollectionList)collectionList
{
  PXDisplayCollectionList *collectionList;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PXDisplayCollectionList *v12;
  PXDisplayCollectionList *v13;
  PXDisplayCollectionList *v14;
  PXDisplayCollectionList *v15;
  void *v17;
  int64_t v18;
  int64_t v19;
  void *v20;
  void *v21;
  PXDisplayCollectionList *v22;
  PXDisplayCollectionList *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  collectionList = self->_collectionList;
  if (!collectionList)
  {
    -[PXProgrammaticNavigationDestination collectionListUUID](self, "collectionListUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXProgrammaticNavigationDestination collectionListName](self, "collectionListName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CD14E0], "localIdentifierWithUUID:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0CD14E0];
      v24[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "librarySpecificFetchOptions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "fetchCollectionListsWithLocalIdentifiers:options:", v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v12 = (PXDisplayCollectionList *)objc_claimAutoreleasedReturnValue();
      v13 = self->_collectionList;
      self->_collectionList = v12;

    }
    else
    {
      if (!v5)
      {
        if (-[PXProgrammaticNavigationDestination collectionListType](self, "collectionListType"))
        {
          v17 = (void *)MEMORY[0x1E0CD14E0];
          v18 = -[PXProgrammaticNavigationDestination collectionListType](self, "collectionListType");
          v19 = -[PXProgrammaticNavigationDestination collectionListSubtype](self, "collectionListSubtype");
          objc_msgSend(v6, "librarySpecificFetchOptions");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "fetchCollectionListsWithType:subtype:options:", v18, v19, v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "firstObject");
          v22 = (PXDisplayCollectionList *)objc_claimAutoreleasedReturnValue();
          v23 = self->_collectionList;
          self->_collectionList = v22;

        }
        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x1E0CD14E0], "px_transientIdentifierForWellKnownFolderName:", v5);
      v14 = (PXDisplayCollectionList *)objc_claimAutoreleasedReturnValue();
      v7 = v14;
      if (v14)
      {
        objc_msgSend(v6, "px_collectionListWithTransientIdentifier:", v14);
        v14 = (PXDisplayCollectionList *)objc_claimAutoreleasedReturnValue();
      }
      v15 = self->_collectionList;
      self->_collectionList = v14;

    }
LABEL_9:

    collectionList = self->_collectionList;
  }
  return collectionList;
}

- (PXDisplayCollection)collection
{
  PXDisplayCollection *collection;
  PXDisplayCollection *v4;
  PXDisplayCollection *v5;

  collection = self->_collection;
  if (!collection)
  {
    -[PXProgrammaticNavigationDestination assetCollection](self, "assetCollection");
    v4 = (PXDisplayCollection *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      -[PXProgrammaticNavigationDestination collectionList](self, "collectionList");
      v4 = (PXDisplayCollection *)objc_claimAutoreleasedReturnValue();
    }
    v5 = self->_collection;
    self->_collection = v4;

    collection = self->_collection;
  }
  return collection;
}

- (NSArray)collectionHierarchy
{
  NSArray **p_collectionHierarchy;
  void *v4;
  id v5;
  id v6;
  void *v7;

  p_collectionHierarchy = &self->_collectionHierarchy;
  v4 = (void *)-[NSArray copy](self->_collectionHierarchy, "copy");
  if (!v4)
  {
    -[PXProgrammaticNavigationDestination collection](self, "collection");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;

      if (!v6)
      {
        v4 = 0;
        goto LABEL_8;
      }
      objc_msgSend(v6, "px_fetchAncestryIncludingRoot:", 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)objc_msgSend(v7, "copy");
    }
    else
    {
      v6 = 0;
      v4 = 0;
      v7 = v5;
    }

LABEL_8:
    objc_storeStrong((id *)p_collectionHierarchy, v4);

  }
  return (NSArray *)v4;
}

- (PXDisplayPerson)person
{
  PXDisplayPerson *person;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PXDisplayPerson *v11;
  PXDisplayPerson *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  person = self->_person;
  if (!person)
  {
    -[PXProgrammaticNavigationDestination personUUID](self, "personUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXProgrammaticNavigationDestination personLocalIdentifier](self, "personLocalIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5 && v4)
    {
      objc_msgSend(MEMORY[0x1E0CD16C0], "localIdentifierWithUUID:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CD1570], "px_standardFetchOptions");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD1570], "px_defaultDetectionTypes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setIncludedDetectionTypes:", v7);

      v8 = (void *)MEMORY[0x1E0CD16C0];
      v14[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "fetchPersonsWithLocalIdentifiers:options:", v9, v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "firstObject");
      v11 = (PXDisplayPerson *)objc_claimAutoreleasedReturnValue();
      v12 = self->_person;
      self->_person = v11;

    }
    person = self->_person;
  }
  return person;
}

- (PXDisplaySocialGroup)socialGroup
{
  PXDisplaySocialGroup *socialGroup;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PXDisplaySocialGroup *v10;
  PXDisplaySocialGroup *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  socialGroup = self->_socialGroup;
  if (!socialGroup)
  {
    -[PXProgrammaticNavigationDestination socialGroupUUID](self, "socialGroupUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXProgrammaticNavigationDestination socialGroupLocalIdentifier](self, "socialGroupLocalIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5 && v4)
    {
      objc_msgSend(MEMORY[0x1E0CD17C0], "localIdentifierWithUUID:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CD1570], "px_standardFetchOptions");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0CD17C0];
      v13[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "fetchSocialGroupsWithLocalIdentifiers:options:", v8, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v10 = (PXDisplaySocialGroup *)objc_claimAutoreleasedReturnValue();
      v11 = self->_socialGroup;
      self->_socialGroup = v10;

    }
    socialGroup = self->_socialGroup;
  }
  return socialGroup;
}

- (NSString)importSourceUUID
{
  void *v2;
  void *v3;

  -[PXProgrammaticNavigationDestination importSource](self, "importSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isEqualToNavigationDestination:(id)a3
{
  PXProgrammaticNavigationDestination *v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  char v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  int64_t v13;
  int64_t v14;
  id v15;
  id v16;
  void *v17;
  char v18;
  int64_t v19;
  int64_t v20;
  void *v21;
  uint64_t v22;
  void *v24;

  v4 = (PXProgrammaticNavigationDestination *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    v5 = -[PXProgrammaticNavigationDestination type](self, "type");
    if (v5 == -[PXProgrammaticNavigationDestination type](v4, "type"))
    {
      v6 = -[PXProgrammaticNavigationDestination revealMode](self, "revealMode");
      if (v6 == -[PXProgrammaticNavigationDestination revealMode](v4, "revealMode"))
      {
        v7 = -[PXProgrammaticNavigationDestination type](self, "type");
        v8 = 1;
        switch(v7)
        {
          case 7:
            -[PXProgrammaticNavigationDestination assetUUID](self, "assetUUID");
            v9 = (id)objc_claimAutoreleasedReturnValue();
            -[PXProgrammaticNavigationDestination assetUUID](v4, "assetUUID");
            v10 = (id)objc_claimAutoreleasedReturnValue();
            if (v9 == v10)
            {

            }
            else
            {
              v11 = v10;
              v12 = objc_msgSend(v9, "isEqual:", v10);

              if ((v12 & 1) == 0)
                break;
            }
            -[PXProgrammaticNavigationDestination assetLocalIdentifier](self, "assetLocalIdentifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[PXProgrammaticNavigationDestination assetLocalIdentifier](v4, "assetLocalIdentifier");
            v22 = objc_claimAutoreleasedReturnValue();
            goto LABEL_29;
          case 8:
          case 9:
          case 19:
            goto LABEL_11;
          case 10:
          case 11:
          case 12:
          case 13:
          case 14:
          case 15:
          case 16:
          case 18:
          case 20:
            goto LABEL_20;
          case 17:
            v19 = -[PXProgrammaticNavigationDestination collectionListType](self, "collectionListType");
            if (v19 != -[PXProgrammaticNavigationDestination collectionListType](v4, "collectionListType"))
              break;
            v20 = -[PXProgrammaticNavigationDestination collectionListSubtype](self, "collectionListSubtype");
            if (v20 != -[PXProgrammaticNavigationDestination collectionListSubtype](v4, "collectionListSubtype"))
              break;
            -[PXProgrammaticNavigationDestination collectionListUUID](self, "collectionListUUID");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[PXProgrammaticNavigationDestination collectionListUUID](v4, "collectionListUUID");
            v22 = objc_claimAutoreleasedReturnValue();
            goto LABEL_29;
          case 21:
            -[PXProgrammaticNavigationDestination importSource](self, "importSource");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[PXProgrammaticNavigationDestination importSource](v4, "importSource");
            v22 = objc_claimAutoreleasedReturnValue();
            goto LABEL_23;
          default:
            if (v7 == 32)
            {
              -[PXProgrammaticNavigationDestination lemonadeNavigationDestination](self, "lemonadeNavigationDestination");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              -[PXProgrammaticNavigationDestination lemonadeNavigationDestination](v4, "lemonadeNavigationDestination");
              v22 = objc_claimAutoreleasedReturnValue();
LABEL_23:
              if (v21 != (void *)v22)
              {
LABEL_30:
                v24 = (void *)v22;
                v8 = objc_msgSend(v21, "isEqual:", v22);
LABEL_33:

                goto LABEL_20;
              }
LABEL_32:
              v24 = v21;
              goto LABEL_33;
            }
            if (v7 != 33)
              goto LABEL_20;
LABEL_11:
            v13 = -[PXProgrammaticNavigationDestination assetCollectionType](self, "assetCollectionType");
            if (v13 == -[PXProgrammaticNavigationDestination assetCollectionType](v4, "assetCollectionType"))
            {
              v14 = -[PXProgrammaticNavigationDestination assetCollectionSubtype](self, "assetCollectionSubtype");
              if (v14 == -[PXProgrammaticNavigationDestination assetCollectionSubtype](v4, "assetCollectionSubtype"))
              {
                -[PXProgrammaticNavigationDestination assetCollectionUUID](self, "assetCollectionUUID");
                v15 = (id)objc_claimAutoreleasedReturnValue();
                -[PXProgrammaticNavigationDestination assetCollectionUUID](v4, "assetCollectionUUID");
                v16 = (id)objc_claimAutoreleasedReturnValue();
                if (v15 == v16)
                {

                }
                else
                {
                  v17 = v16;
                  v18 = objc_msgSend(v15, "isEqual:", v16);

                  if ((v18 & 1) == 0)
                    break;
                }
                -[PXProgrammaticNavigationDestination assetCollectionLocalIdentifier](self, "assetCollectionLocalIdentifier");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                -[PXProgrammaticNavigationDestination assetCollectionLocalIdentifier](v4, "assetCollectionLocalIdentifier");
                v22 = objc_claimAutoreleasedReturnValue();
LABEL_29:
                if (v21 != (void *)v22)
                  goto LABEL_30;
                v8 = 1;
                goto LABEL_32;
              }
            }
            break;
        }
      }
    }
    v8 = 0;
  }
LABEL_20:

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  PXProgrammaticNavigationDestination *v4;
  BOOL v5;

  v4 = (PXProgrammaticNavigationDestination *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PXProgrammaticNavigationDestination isEqualToNavigationDestination:](self, "isEqualToNavigationDestination:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  int64_t v3;
  int64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;

  v3 = -[PXProgrammaticNavigationDestination type](self, "type");
  v4 = v3 ^ (4 * -[PXProgrammaticNavigationDestination revealMode](self, "revealMode"));
  -[PXProgrammaticNavigationDestination assetUUID](self, "assetUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");

  -[PXProgrammaticNavigationDestination assetLocalIdentifier](self, "assetLocalIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4 ^ v6 ^ objc_msgSend(v7, "hash");

  -[PXProgrammaticNavigationDestination assetCollectionUUID](self, "assetCollectionUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");

  -[PXProgrammaticNavigationDestination assetCollectionLocalIdentifier](self, "assetCollectionLocalIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash");

  -[PXProgrammaticNavigationDestination collectionListUUID](self, "collectionListUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v8 ^ v12 ^ objc_msgSend(v13, "hash");

  return v14;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = (void *)MEMORY[0x1E0CB3940];
  PXProgrammaticNavigationDestinationTypeDescription(-[PXProgrammaticNavigationDestination type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("type=%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v6;
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = -[PXProgrammaticNavigationDestination revealMode](self, "revealMode");
  if (v8 > 3)
    v9 = CFSTR("?");
  else
    v9 = off_1E512A0F0[v8];
  objc_msgSend(v7, "stringWithFormat:", CFSTR("revealMode=%@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)(-[PXProgrammaticNavigationDestination type](self, "type") - 29) <= 1)
  {
    -[PXProgrammaticNavigationDestination shelfSlug](self, "shelfSlug");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("shelfSlug=%@"), v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v15);

    }
  }
  v16 = (void *)MEMORY[0x1E0CB3940];
  v17 = (objc_class *)objc_opt_class();
  NSStringFromClass(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "componentsJoinedByString:", CFSTR(", "));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("<%@: %p, %@>"), v18, self, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (NSString)publicDescription
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  const __CFString *v8;
  void *v9;
  id v10;
  void (**v11)(void *, const __CFString *, void *);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD aBlock[4];
  id v20;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PXProgrammaticNavigationDestinationTypeDescription(-[PXProgrammaticNavigationDestination type](self, "type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PXProgrammaticNavigationDestination revealMode](self, "revealMode");
  if (v7 > 3)
    v8 = CFSTR("?");
  else
    v8 = off_1E512A0F0[v7];
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p, type=%@ revealMode=%@"), v5, self, v6, v8);

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__PXProgrammaticNavigationDestination_publicDescription__block_invoke;
  aBlock[3] = &unk_1E5129FC0;
  v20 = v9;
  v10 = v9;
  v11 = (void (**)(void *, const __CFString *, void *))_Block_copy(aBlock);
  -[PXProgrammaticNavigationDestination assetLocalIdentifier](self, "assetLocalIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((((uint64_t (*)(void *, const __CFString *, void *))v11[2])(v11, CFSTR("assetLocalIdentifier"), v12) & 1) == 0)
  {
    -[PXProgrammaticNavigationDestination assetUUID](self, "assetUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, CFSTR("assetUUID"), v13);

  }
  -[PXProgrammaticNavigationDestination assetCollectionLocalIdentifier](self, "assetCollectionLocalIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((((uint64_t (*)(void *, const __CFString *, void *))v11[2])(v11, CFSTR("assetCollectionLocalIdentifier"), v14) & 1) == 0)
  {
    -[PXProgrammaticNavigationDestination assetCollectionUUID](self, "assetCollectionUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, CFSTR("assetCollectionUUID"), v15);

  }
  -[PXProgrammaticNavigationDestination collectionListUUID](self, "collectionListUUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2](v11, CFSTR("collectionListUUID"), v16);

  v17 = (void *)objc_msgSend(v10, "copy");
  return (NSString *)v17;
}

- (BOOL)prefersImmersiveMode
{
  return self->_prefersImmersiveMode;
}

- (NSString)source
{
  return self->_source;
}

- (NSString)assetUUID
{
  return self->_assetUUID;
}

- (NSString)assetLocalIdentifier
{
  return self->_assetLocalIdentifier;
}

- (PHCloudIdentifier)assetCloudIdentifier
{
  return self->_assetCloudIdentifier;
}

- (NSString)assetCollectionUUID
{
  return self->_assetCollectionUUID;
}

- (NSString)assetCollectionLocalIdentifier
{
  return self->_assetCollectionLocalIdentifier;
}

- (PHCloudIdentifier)assetCollectionCloudIdentifier
{
  return self->_assetCollectionCloudIdentifier;
}

- (NSString)assetCollectionTransientIdentifier
{
  return self->_assetCollectionTransientIdentifier;
}

- (int64_t)assetCollectionType
{
  return self->_assetCollectionType;
}

- (int64_t)assetCollectionSubtype
{
  return self->_assetCollectionSubtype;
}

- (unsigned)utilityCollectionType
{
  return self->_utilityCollectionType;
}

- (NSString)collectionListUUID
{
  return self->_collectionListUUID;
}

- (NSString)collectionListName
{
  return self->_collectionListName;
}

- (int64_t)collectionListType
{
  return self->_collectionListType;
}

- (int64_t)collectionListSubtype
{
  return self->_collectionListSubtype;
}

- (NSString)personUUID
{
  return self->_personUUID;
}

- (NSString)personLocalIdentifier
{
  return self->_personLocalIdentifier;
}

- (NSString)socialGroupUUID
{
  return self->_socialGroupUUID;
}

- (NSString)socialGroupLocalIdentifier
{
  return self->_socialGroupLocalIdentifier;
}

- (PHImportSource)importSource
{
  return self->_importSource;
}

- (NSString)shelfSlug
{
  return self->_shelfSlug;
}

- (PXLemonadeNavigationDestinationProtocol)lemonadeNavigationDestination
{
  return self->_lemonadeNavigationDestination;
}

- (NSString)memoryCreationText
{
  return self->_memoryCreationText;
}

- (PXProgrammaticNavigationDestination)sidebarBackNavigationRootDestination
{
  return self->_sidebarBackNavigationRootDestination;
}

- (NSObject)additionalAttributes
{
  return self->_additionalAttributes;
}

- (BOOL)renderAlbumAssetsWithDeferredProcessing
{
  return self->_renderAlbumAssetsWithDeferredProcessing;
}

- (BOOL)displayAlbumOptions
{
  return self->_displayAlbumOptions;
}

- (BOOL)wantsEditMode
{
  return self->_wantsEditMode;
}

- (NSString)completionKey
{
  return self->_completionKey;
}

- (NSString)libraryViewMode
{
  return self->_libraryViewMode;
}

BOOL __56__PXProgrammaticNavigationDestination_publicDescription__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR(" %@=%@"), a2, a3);
  return a3 != 0;
}

void __51__PXProgrammaticNavigationDestination_initWithURL___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PLUIGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_ERROR, "destination URL is malformed: %@", (uint8_t *)&v4, 0xCu);
  }

}

@end
