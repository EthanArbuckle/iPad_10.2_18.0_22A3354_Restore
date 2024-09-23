@implementation PLCloudSharedUpdateAlbumMetadataJob

- (void)encodeToXPCObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLCloudSharedUpdateAlbumMetadataJob;
  -[PLDaemonJob encodeToXPCObject:](&v10, sel_encodeToXPCObject_, v4);
  -[PLCloudSharedUpdateAlbumMetadataJob metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)MEMORY[0x19AEC1554]();
    -[PLCloudSharedUpdateAlbumMetadataJob _argumentsDictionaryAsData:](self, "_argumentsDictionaryAsData:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = objc_retainAutorelease(v7);
      xpc_dictionary_set_data(v4, "arguments-dictionary", (const void *)objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"));
    }
    else
    {
      NSLog(CFSTR("ERROR: PLCloudSharedUpdateAlbumMetadataJob failed serialize its arguments"));
    }

    objc_autoreleasePoolPop(v6);
  }

}

- (id)initFromXPCObject:(id)a3 libraryServicesManager:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  objc_super v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PLCloudSharedUpdateAlbumMetadataJob;
  v7 = -[PLCloudSharingJob initFromXPCObject:libraryServicesManager:](&v13, sel_initFromXPCObject_libraryServicesManager_, v6, a4);
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "_argumentsDictionaryFromXPCEvent:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      PLPhotoSharingGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "ERROR: PLCloudSharedUpdateAlbumMetadataJob couldn't get arguments from xpc event", buf, 2u);
      }

    }
    PLPhotoSharingGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v9;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "PLCloudSharedUpdateAlbumMetadataJob got arguments dictionary %@", buf, 0xCu);
    }

    objc_msgSend(v8, "setMetadata:", v9);
  }

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PLCloudSharedUpdateAlbumMetadataJob;
  -[PLDaemonJob description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudSharedUpdateAlbumMetadataJob metadata](self, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" metadata %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)daemonOperation
{
  return 3;
}

- (void)runDaemonSide
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudSharedUpdateAlbumMetadataJob runDaemonSide]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "lowPriorityOperationQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__PLCloudSharedUpdateAlbumMetadataJob_runDaemonSide__block_invoke;
  v6[3] = &unk_1E3677C18;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "addOperationWithBlock:", v6);

}

- (id)_argumentsDictionaryAsData:(id)a3
{
  id v3;
  void *v4;
  uint64_t v6;

  v3 = a3;
  v6 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v3, 200, 0, &v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    NSLog(CFSTR("ERROR: _argumentsDictionaryAsData unable to serialize dictionary %@ error %@"), v3, v6);

  return v4;
}

- (id)_argumentsDictionaryFromXPCEvent:(id)a3
{
  const void *data;
  NSObject *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v9;
  size_t length;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  length = 0;
  data = xpc_dictionary_get_data(a3, "arguments-dictionary", &length);
  if (data)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", data, length);
    v4 = objc_claimAutoreleasedReturnValue();
    v9 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v4, 0, 0, &v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v9;
    if (!v5)
    {
      PLPhotoSharingGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v6;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "ERROR: _argumentsDictionaryFromXPCEvent failed to deserialize arguments dictionary %@", buf, 0xCu);
      }

    }
  }
  else
  {
    PLPhotoSharingGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "ERROR: _argumentsDictionaryFromXPCEvent failed to get arguments-dictionary from xpc event", buf, 2u);
    }
    v5 = 0;
  }

  return v5;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
}

void __52__PLCloudSharedUpdateAlbumMetadataJob_runDaemonSide__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  objc_super v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x19AEC1554]();
  PLPhotoSharingGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "metadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "PLCloudSharedUpdateAlbumMetadataJob runDaemonSide %@", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "transientPhotoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__PLCloudSharedUpdateAlbumMetadataJob_runDaemonSide__block_invoke_27;
  v8[3] = &unk_1E3677C18;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v6 = v5;
  objc_msgSend(v6, "performTransactionAndWait:", v8);
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)PLCloudSharedUpdateAlbumMetadataJob;
  objc_msgSendSuper2(&v7, sel_runDaemonSide);
  objc_msgSend(*(id *)(a1 + 40), "stillAlive");

  objc_autoreleasePoolPop(v2);
}

void __52__PLCloudSharedUpdateAlbumMetadataJob_runDaemonSide__block_invoke_27(uint64_t a1)
{
  void *v2;
  __CFString *v3;
  NSObject *v4;
  __CFString *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  __CFString *v19;
  NSObject *v20;
  __CFString *v21;
  __CFString *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  const __CFString *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  char v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  __CFString *v64;
  __CFString *v65;
  void *v66;
  void *v67;
  __CFString *v68;
  void *v69;
  int v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  const __CFString *v79;
  void *v80;
  __CFString *v81;
  void *v82;
  void *v83;
  __CFString *v84;
  NSObject *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  _QWORD v90[4];
  id v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  uint8_t buf[4];
  __CFString *v97;
  __int16 v98;
  const __CFString *v99;
  __int16 v100;
  void *v101;
  __int16 v102;
  void *v103;
  __int16 v104;
  void *v105;
  __int16 v106;
  void *v107;
  __int16 v108;
  void *v109;
  __int16 v110;
  const __CFString *v111;
  _BYTE v112[128];
  uint64_t v113;

  v113 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("album-guid"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("album-relationshipState"));
    v4 = objc_claimAutoreleasedReturnValue();
    +[PLCloudSharedAlbum cloudSharedAlbumWithGUID:inLibrary:](PLCloudSharedAlbum, "cloudSharedAlbumWithGUID:inLibrary:", v3, *(_QWORD *)(a1 + 40));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (-[NSObject intValue](v4, "intValue") == 1)
    {
      if (v5
        && -[__CFString cloudRelationshipStateLocalValue](v5, "cloudRelationshipStateLocalValue") == 2)
      {
        PLPhotoSharingGetLog();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v97 = v5;
          _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "PLCloudSharedUpdateAlbumMetadataJob ignoring pending relationship for already subscribed album %@", buf, 0xCu);
        }

        goto LABEL_75;
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v88 = 0;
    }
    v7 = v5;
    v85 = v4;
    v86 = a1;
    v81 = v5;
    if (!v5)
    {
      v83 = v2;
      +[PLGenericAlbum insertNewCloudSharedAlbumWithTitle:lastInterestingDate:intoLibrary:](PLGenericAlbum, "insertNewCloudSharedAlbumWithTitle:lastInterestingDate:intoLibrary:", 0, v88, *(_QWORD *)(a1 + 40));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setCloudGUID:", v3);
      v8 = -[NSObject intValue](v4, "intValue");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8 == 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setIsOwned:", v9);

      PLPhotoSharingGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = CFSTR("NO");
        if (!v8)
          v11 = CFSTR("YES");
        *(_DWORD *)buf = 138412546;
        v97 = v3;
        v98 = 2112;
        v99 = v11;
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "inserting shared album with GUID %@ isOwned %@", buf, 0x16u);
      }

      v12 = v3;
      +[PLCloudSharedAlbumInvitationRecord cloudSharedAlbumInvitationRecordsWithAlbumGUID:inLibrary:](PLCloudSharedAlbumInvitationRecord, "cloudSharedAlbumInvitationRecordsWithAlbumGUID:inLibrary:", v3, *(_QWORD *)(a1 + 40));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = 0u;
      v93 = 0u;
      v94 = 0u;
      v95 = 0u;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v92, v112, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v93;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            v18 = v7;
            if (*(_QWORD *)v93 != v16)
              objc_enumerationMutation(v13);
            v19 = *(__CFString **)(*((_QWORD *)&v92 + 1) + 8 * i);
            PLPhotoSharingGetLog();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v97 = v19;
              v98 = 2112;
              v99 = v12;
              _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEFAULT, "Linking invitation record %@ to newly created album with GUID %@", buf, 0x16u);
            }

            v21 = v19;
            v7 = v18;
            -[__CFString setAlbum:](v21, "setAlbum:", v18);
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v92, v112, 16);
        }
        while (v15);
      }

      v3 = (__CFString *)v12;
      v2 = v83;
      v4 = v85;
      v5 = 0;
    }
    objc_msgSend(v2, "objectForKey:", CFSTR("kPLAlbumOwnerDictionaryKey"));
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v89 = v7;
    v84 = v22;
    if (-[__CFString count](v22, "count"))
    {
      PLPhotoSharingGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v97 = v22;
        _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_DEFAULT, "found album owner info %@", buf, 0xCu);
      }

      -[__CFString objectForKey:](v22, "objectForKey:", CFSTR("kPLAlbumOwnerFirstNameKey"));
      v24 = objc_claimAutoreleasedReturnValue();
      if (v24)
        objc_msgSend(v7, "setCloudOwnerFirstName:", v24);
      -[__CFString objectForKey:](v22, "objectForKey:", CFSTR("kPLAlbumOwnerLastNameKey"));
      v25 = objc_claimAutoreleasedReturnValue();
      if (v25)
        objc_msgSend(v7, "setCloudOwnerLastName:", v25);
      v79 = v3;
      -[__CFString objectForKey:](v22, "objectForKey:", CFSTR("kPLAlbumOwnerEmailKey"));
      v26 = objc_claimAutoreleasedReturnValue();
      if (v26)
        objc_msgSend(v7, "setCloudOwnerEmail:", v26);
      -[__CFString objectForKey:](v22, "objectForKey:", CFSTR("kPLAlbumOwnerFullNameKey"));
      v27 = objc_claimAutoreleasedReturnValue();
      if (v27)
        objc_msgSend(v7, "setCloudOwnerFullName:", v27);
      v73 = (void *)v27;
      -[__CFString objectForKey:](v22, "objectForKey:", CFSTR("kPLAlbumOwnerHashedPersonIDKey"));
      v28 = objc_claimAutoreleasedReturnValue();
      if (v28)
        objc_msgSend(v7, "setCloudOwnerHashedPersonID:", v28);
      v72 = (void *)v28;
      -[__CFString objectForKey:](v22, "objectForKey:", CFSTR("kPLAlbumOwnerIsWhitelistedKey"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (v29)
        objc_msgSend(v7, "setCloudOwnerIsWhitelisted:", objc_msgSend(v29, "BOOLValue"));
      -[__CFString objectForKey:](v22, "objectForKey:", CFSTR("kPLAlbumOwnerSubscriptionDateKey"), v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v31)
        objc_msgSend(v7, "setCloudSubscriptionDate:", v31);
      v74 = (void *)v26;
      v75 = (void *)v25;
      v77 = (void *)v24;
      PLPhotoSharingGetLog();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v2, "objectForKey:", CFSTR("album-name"));
        v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "cloudOwnerFirstName");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "cloudOwnerLastName");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "cloudOwnerFullName");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "cloudOwnerEmail");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "cloudOwnerHashedPersonID");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v89, "cloudOwnerIsWhitelisted");
        *(_DWORD *)buf = 138414082;
        v40 = CFSTR("NO");
        v97 = v33;
        v98 = 2112;
        if (v39)
          v40 = CFSTR("YES");
        v99 = v79;
        v100 = 2112;
        v101 = v34;
        v102 = 2112;
        v103 = v35;
        v104 = 2112;
        v105 = v36;
        v106 = 2112;
        v107 = v37;
        v108 = 2112;
        v109 = v38;
        v110 = 2112;
        v111 = v40;
        _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_DEFAULT, "setting person info for album '%@' (%@): %@, %@, %@, %@, hashedPersonID %@, whitelist: %@", buf, 0x52u);

        v7 = v89;
      }

      objc_msgSend(*(id *)(v86 + 40), "personInfoManager");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "cloudOwnerFirstName");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "cloudOwnerLastName");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "cloudOwnerFullName");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "cloudOwnerEmail");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "cloudOwnerHashedPersonID");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setFirstName:lastName:fullName:email:forPersonID:", v42, v43, v44, v45, v46);

      v7 = v89;
      v5 = v81;
      v22 = v84;
      v3 = (__CFString *)v79;
    }
    if (v4)
      objc_msgSend(v7, "setCloudRelationshipState:", v4);
    objc_msgSend(v2, "objectForKey:", CFSTR("album-name"));
    v47 = objc_claimAutoreleasedReturnValue();
    if (v47)
      objc_msgSend(v7, "setTitle:", v47);
    v80 = (void *)v47;
    objc_msgSend(v2, "objectForKey:", CFSTR("album-metadata"));
    v48 = objc_claimAutoreleasedReturnValue();
    if (v48)
      objc_msgSend(v7, "setCloudMetadata:", v48);
    v78 = (void *)v48;
    objc_msgSend(v2, "objectForKey:", CFSTR("album-isPublic"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (v49)
    {
      objc_msgSend(v7, "setCloudPublicURLEnabled:", v49);
      objc_msgSend(v7, "setCloudPublicURLEnabledLocal:", v49);
      objc_msgSend(v2, "objectForKey:", CFSTR("album-publicURLString"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if (v50)
        objc_msgSend(v7, "setPublicURL:", v50);

    }
    v51 = objc_msgSend(v7, "cloudRelationshipStateValue");
    objc_msgSend(v2, "objectForKey:", CFSTR("album-allowsMultipleContributors"));
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    if (v87)
    {
      objc_msgSend(v7, "cloudMultipleContributorsEnabled");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v52, "BOOLValue");

      LODWORD(v52) = objc_msgSend(v87, "BOOLValue");
      objc_msgSend(v7, "setCloudMultipleContributorsEnabled:", v87);
      objc_msgSend(v7, "setCloudMultipleContributorsEnabledLocal:", v87);
      if (v53 != (_DWORD)v52 && v51 == 2)
      {
        +[PLNotificationManager sharedManager](PLNotificationManager, "sharedManager");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "objectForKey:", CFSTR("mstreamd-info"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "noteMultipleContributorStatusChangedForAlbum:mstreamdInfo:", v7, v55);

      }
    }
    objc_msgSend(v2, "objectForKey:", CFSTR("album-isFamilySharedAlbum"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCloudAlbumSubtype:", objc_msgSend(v56, "BOOLValue"));
    objc_msgSend(v2, "objectForKey:", CFSTR("album-creationDate"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (v57)
      objc_msgSend(v7, "setCloudCreationDate:", v57);
    v58 = objc_msgSend(v7, "isOwnedCloudSharedAlbum");
    v4 = v85;
    if (!v5 && (v58 & 1) == 0 && v51 == 1)
    {
      v59 = v49;
      objc_msgSend(v7, "setHasUnseenContentBoolValue:", 1);
      +[PLNotificationManager sharedManager](PLNotificationManager, "sharedManager");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "noteDidReceiveInvitationForSharedAlbum:", v7);

      objc_msgSend(v7, "updateCloudLastInterestingChangeDateWithDate:", v88);
      objc_msgSend(v2, "objectForKey:", CFSTR("album-autoAcceptInvitation"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = v61;
      if (v61 && objc_msgSend(v61, "BOOLValue"))
      {
        v90[0] = MEMORY[0x1E0C809B0];
        v90[1] = 3221225472;
        v90[2] = __52__PLCloudSharedUpdateAlbumMetadataJob_runDaemonSide__block_invoke_61;
        v90[3] = &unk_1E3674D50;
        v91 = v7;
        +[PLPhotoSharingHelper acceptPendingInvitationForAlbum:completionHandler:](PLPhotoSharingHelper, "acceptPendingInvitationForAlbum:completionHandler:", v91, v90);

      }
      v49 = v59;
    }
    PLPhotoSharingGetLog();
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "cloudGUID");
      v64 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "title");
      v82 = v49;
      v65 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "isOwned");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "cloudPublicURLEnabled");
      v76 = v56;
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "cloudRelationshipState");
      v68 = v3;
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = objc_msgSend(v69, "intValue");
      *(_DWORD *)buf = 138413314;
      v97 = v64;
      v98 = 2112;
      v99 = v65;
      v100 = 2112;
      v101 = v66;
      v102 = 2112;
      v103 = v67;
      v104 = 1024;
      LODWORD(v105) = v70;
      _os_log_impl(&dword_199541000, v63, OS_LOG_TYPE_DEFAULT, "PLCloudSharedUpdateAlbumMetadataJob finished processing album GUID:%@ title:%@ isOwned:%@ isPublic:%@ relationshipState:%i", buf, 0x30u);

      v3 = v68;
      v4 = v85;

      v56 = v76;
      v22 = v84;

      v49 = v82;
      v7 = v89;
    }

    objc_msgSend(v7, "persistRecoveryMetadata");
  }
  else
  {
    PLPhotoSharingGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "ERROR: PLCloudSharedUpdateAlbumMetadataJob didn't get an album-guid in arguments, ignoring request", buf, 2u);
    }
  }
LABEL_75:

}

void __52__PLCloudSharedUpdateAlbumMetadataJob_runDaemonSide__block_invoke_61(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLPhotoSharingGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Automatically accepted invitation for album %@ error: %@", (uint8_t *)&v6, 0x16u);
  }

}

+ (void)updateAlbumMetadata:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_opt_new();
  objc_msgSend(v4, "setMetadata:", v3);

  objc_msgSend(v4, "runAndWaitForMessageToBeSent");
}

@end
