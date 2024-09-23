@implementation PLCloudStreamShareJob

- (void)addInfosForRecipients:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSArray *recipientsInfo;
  PLCloudStreamShareJob *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v19 = self;
  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v8);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v19);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "firstName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "lastName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "allEmailsArray");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "allPhonesArray");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("kRecipientFirstNameKey"));
        if (v12)
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("kRecipientLastNameKey"));
        if (v13)
        {
          v15 = (void *)objc_msgSend(v13, "copy");
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, CFSTR("kRecipientEmailsNameKey"));

        }
        if (v14)
        {
          v16 = (void *)objc_msgSend(v14, "copy");
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, CFSTR("kRecipientPhonesNameKey"));

        }
        objc_msgSend(v4, "addObject:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v6);
  }

  v17 = objc_msgSend(v4, "copy");
  recipientsInfo = v19->_recipientsInfo;
  v19->_recipientsInfo = (NSArray *)v17;

}

- (void)encodeToXPCObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PLCloudStreamShareJob;
  v4 = a3;
  -[PLDaemonJob encodeToXPCObject:](&v11, sel_encodeToXPCObject_, v4);
  -[PLCloudStreamShareJob mediaSources](self, "mediaSources", v11.receiver, v11.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKeyPath:", CFSTR("serializedDictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  PLXPCDictionarySetArray();
  -[PLCloudStreamShareJob recipientsInfo](self, "recipientsInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PLXPCDictionarySetArray();

  -[PLCloudStreamShareJob commentText](self, "commentText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PLXPCDictionarySetString();

  -[PLCloudStreamShareJob albumCloudGUID](self, "albumCloudGUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PLXPCDictionarySetString();

  -[PLCloudStreamShareJob albumName](self, "albumName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PLXPCDictionarySetString();

}

- (id)initFromXPCObject:(id)a3 libraryServicesManager:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  PLStreamShareSource *v16;
  PLStreamShareSource *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PLCloudStreamShareJob;
  v7 = -[PLCloudSharingJob initFromXPCObject:libraryServicesManager:](&v27, sel_initFromXPCObject_libraryServicesManager_, v6, a4);
  if (v7)
  {
    PLArrayFromXPCDictionary();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v24;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v14);
          v16 = [PLStreamShareSource alloc];
          v17 = -[PLStreamShareSource initWithDictionary:](v16, "initWithDictionary:", v15, (_QWORD)v23);
          if (v17)
            objc_msgSend(v9, "addObject:", v17);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v12);
    }

    objc_msgSend(v7, "setMediaSources:", v9);
    PLArrayFromXPCDictionary();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRecipientsInfo:", v18);

    PLStringFromXPCDictionary();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCommentText:", v19);

    PLStringFromXPCDictionary();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlbumCloudGUID:", v20);

    PLStringFromXPCDictionary();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlbumName:", v21);

  }
  return v7;
}

- (void)runDaemonSide
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  PLCloudStreamShareJob *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PLPhotoSharingGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v11 = (id)objc_opt_class();
    v12 = 2112;
    v13 = self;
    v4 = v11;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "%@ : runDaemonSide %@", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudStreamShareJob runDaemonSide]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "highPriorityOperationQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__PLCloudStreamShareJob_runDaemonSide__block_invoke;
  v8[3] = &unk_1E3677C18;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "addOperationWithBlock:", v8);

}

- (int64_t)daemonOperation
{
  return 15;
}

- (BOOL)shouldArchiveXPCToDisk
{
  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)PLCloudStreamShareJob;
  -[PLDaemonJob description](&v13, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudStreamShareJob commentText](self, "commentText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudStreamShareJob mediaSources](self, "mediaSources");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  -[PLCloudStreamShareJob recipientsInfo](self, "recipientsInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudStreamShareJob albumCloudGUID](self, "albumCloudGUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    -[PLCloudStreamShareJob albumCloudGUID](self, "albumCloudGUID");
  else
    -[PLCloudStreamShareJob albumName](self, "albumName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ comment (%@), sources (%lu sources), recipients (%@), album (%@)"), v4, v5, v7, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)executeDaemonOperation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD v30[3];
  char v31;
  _QWORD v32[5];
  id v33;
  _QWORD v34[5];
  id v35;

  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__58402;
  v34[4] = __Block_byref_object_dispose__58403;
  v35 = 0;
  v3 = (void *)objc_opt_new();
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__58402;
  v32[4] = __Block_byref_object_dispose__58403;
  v33 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v31 = 0;
  objc_msgSend(MEMORY[0x1E0D73308], "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudSharingJob transientPhotoLibrary](self, "transientPhotoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v8 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __47__PLCloudStreamShareJob_executeDaemonOperation__block_invoke;
  v21[3] = &unk_1E366DA90;
  v21[4] = self;
  v27 = v30;
  v28 = v34;
  v9 = v5;
  v22 = v9;
  v23 = v6;
  v24 = v7;
  v10 = v4;
  v25 = v10;
  v26 = v3;
  v29 = v32;
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __47__PLCloudStreamShareJob_executeDaemonOperation__block_invoke_80;
  v14[3] = &unk_1E3675150;
  v18 = v30;
  v19 = v34;
  v11 = v23;
  v15 = v11;
  v12 = v26;
  v16 = v12;
  v20 = v32;
  v13 = v24;
  v17 = v13;
  objc_msgSend(v11, "performTransaction:completionHandler:withPriority:", v21, v14, 1);

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);

  _Block_object_dispose(v34, 8);
}

- (NSArray)mediaSources
{
  return self->_mediaSources;
}

- (void)setMediaSources:(id)a3
{
  objc_storeStrong((id *)&self->_mediaSources, a3);
}

- (NSString)albumCloudGUID
{
  return self->_albumCloudGUID;
}

- (void)setAlbumCloudGUID:(id)a3
{
  objc_storeStrong((id *)&self->_albumCloudGUID, a3);
}

- (NSString)albumName
{
  return self->_albumName;
}

- (void)setAlbumName:(id)a3
{
  objc_storeStrong((id *)&self->_albumName, a3);
}

- (NSString)commentText
{
  return self->_commentText;
}

- (void)setCommentText:(id)a3
{
  objc_storeStrong((id *)&self->_commentText, a3);
}

- (NSArray)recipientsInfo
{
  return self->_recipientsInfo;
}

- (void)setRecipientsInfo:(id)a3
{
  objc_storeStrong((id *)&self->_recipientsInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipientsInfo, 0);
  objc_storeStrong((id *)&self->_commentText, 0);
  objc_storeStrong((id *)&self->_albumName, 0);
  objc_storeStrong((id *)&self->_albumCloudGUID, 0);
  objc_storeStrong((id *)&self->_mediaSources, 0);
}

void __47__PLCloudStreamShareJob_executeDaemonOperation__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  __CFString *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  int v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  id v96;
  NSObject *v97;
  id v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  id v103;
  id v104;
  NSObject *v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  void *v109;
  _BOOL4 v110;
  void *v111;
  void *v112;
  void *v113;
  uint64_t v114;
  void *v115;
  BOOL v116;
  id v117;
  NSObject *v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  uint64_t v122;
  uint64_t v123;
  id v124;
  uint64_t v125;
  void *v126;
  uint64_t v127;
  id obj;
  id obja;
  id v131;
  _QWORD v132[3];
  _QWORD v133[3];
  id v134;
  id v135;
  uint64_t v136;
  _QWORD v137[4];
  id v138;
  uint8_t *v139;
  _QWORD v140[6];
  _QWORD v141[6];
  _QWORD v142[7];
  uint64_t v143;
  id *v144;
  uint64_t v145;
  uint64_t (*v146)(uint64_t, uint64_t);
  void (*v147)(uint64_t);
  id v148;
  uint8_t buf[8];
  uint8_t *v150;
  uint64_t v151;
  uint64_t (*v152)(uint64_t, uint64_t);
  void (*v153)(uint64_t);
  id v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  uint8_t v163[4];
  uint64_t v164;
  __int16 v165;
  id v166;
  _BYTE v167[128];
  _BYTE v168[128];
  uint64_t v169;

  v169 = *MEMORY[0x1E0C80C00];
  +[PLPhotoSharingHelper sharingPersonID](PLPhotoSharingHelper, "sharingPersonID");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  if (v126)
  {
    objc_msgSend(*(id *)(a1 + 32), "albumCloudGUID");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v1 == 0;

    v2 = *(void **)(a1 + 32);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
    {
      objc_msgSend(v2, "albumName");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLGenericAlbum insertNewCloudSharedAlbumWithTitle:lastInterestingDate:intoLibrary:](PLGenericAlbum, "insertNewCloudSharedAlbumWithTitle:lastInterestingDate:intoLibrary:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v4;

      v7 = MEMORY[0x1E0C9AAB0];
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "setIsOwned:", MEMORY[0x1E0C9AAB0]);
      v8 = MEMORY[0x1E0C9AAA0];
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "setCloudPublicURLEnabled:", MEMORY[0x1E0C9AAA0]);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "setCloudPublicURLEnabledLocal:", v8);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "setCloudMultipleContributorsEnabled:", v7);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "setCloudMultipleContributorsEnabledLocal:", v7);
      v161 = 0u;
      v162 = 0u;
      v159 = 0u;
      v160 = 0u;
      obj = *(id *)(*(_QWORD *)(a1 + 32) + 112);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v159, v168, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v160;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v160 != v10)
              objc_enumerationMutation(obj);
            v12 = *(void **)(*((_QWORD *)&v159 + 1) + 8 * i);
            v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("kRecipientFirstNameKey"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("kRecipientLastNameKey"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("kRecipientdisplayNameKey"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("kRecipientEmailsNameKey"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("kRecipientPhonesNameKey"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = +[PLCloudSharedAlbumInvitationRecord insertNewInvitationRecordIntoAlbum:withFirstName:lastName:fullName:emails:phones:inLibrary:](PLCloudSharedAlbumInvitationRecord, "insertNewInvitationRecordIntoAlbum:withFirstName:lastName:fullName:emails:phones:inLibrary:", v13, v14, v15, v16, v17, v18, *(_QWORD *)(a1 + 48));

          }
          v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v159, v168, 16);
        }
        while (v9);
      }

      v20 = a1;
    }
    else
    {
      objc_msgSend(v2, "albumCloudGUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCloudSharedAlbum cloudSharedAlbumWithGUID:inLibrary:](PLCloudSharedAlbum, "cloudSharedAlbumWithGUID:inLibrary:", v22, *(_QWORD *)(a1 + 48));
      v23 = objc_claimAutoreleasedReturnValue();
      v20 = a1;
      v24 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      v25 = *(void **)(v24 + 40);
      *(_QWORD *)(v24 + 40) = v23;

    }
    objc_msgSend(*(id *)(v20 + 48), "pathManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "temporaryDragAndDropDirectoryCreateIfNeeded:error:", 0, 0);
    v125 = objc_claimAutoreleasedReturnValue();

    v157 = 0u;
    v158 = 0u;
    v155 = 0u;
    v156 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "mediaSources");
    v124 = (id)objc_claimAutoreleasedReturnValue();
    obja = (id)objc_msgSend(v124, "countByEnumeratingWithState:objects:count:", &v155, v167, 16);
    if (obja)
    {
      v127 = *(_QWORD *)v156;
      v123 = *MEMORY[0x1E0D75488];
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v156 != v127)
            objc_enumerationMutation(v124);
          v28 = *(void **)(*((_QWORD *)&v155 + 1) + 8 * (_QWORD)v27);
          *(_QWORD *)buf = 0;
          v150 = buf;
          v151 = 0x3032000000;
          v152 = __Block_byref_object_copy__58402;
          v153 = __Block_byref_object_dispose__58403;
          v154 = 0;
          v143 = 0;
          v144 = (id *)&v143;
          v145 = 0x3032000000;
          v146 = __Block_byref_object_copy__58402;
          v147 = __Block_byref_object_dispose__58403;
          v148 = 0;
          if (objc_msgSend(v28, "mediaType") == 3)
          {
            objc_msgSend(v28, "mediaURL");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "path");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v30, "hasPrefix:", v125);

            if (v31)
            {
              objc_msgSend(v28, "mediaURL");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "pathExtension");
              v33 = (void *)objc_claimAutoreleasedReturnValue();

              v34 = *(void **)(a1 + 56);
              v142[0] = MEMORY[0x1E0C809B0];
              v142[1] = 3221225472;
              v142[2] = __47__PLCloudStreamShareJob_executeDaemonOperation__block_invoke_56;
              v142[3] = &unk_1E366DA40;
              v142[4] = v28;
              v142[5] = &v143;
              v142[6] = buf;
              writeToTemporaryMediaFileWithExtension(v33, v34, v142);

            }
            else
            {
              objc_msgSend(v28, "videoComplement");
              v44 = objc_claimAutoreleasedReturnValue();
              v45 = v144[5];
              v144[5] = (id)v44;

              objc_msgSend(v144[5], "imagePath");
              v46 = objc_claimAutoreleasedReturnValue();
              v47 = (void *)*((_QWORD *)v150 + 5);
              *((_QWORD *)v150 + 5) = v46;

            }
          }
          else
          {
            objc_msgSend(v28, "mediaData");
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            if (v35)
            {
              v36 = a1;
              v37 = objc_msgSend(v28, "mediaType");
              v38 = CFSTR("mp4");
              if (v37 != 1)
              {
                v39 = objc_msgSend(v28, "mediaType");
                v38 = &stru_1E36789C0;
                if (v39 == 2)
                {
                  objc_msgSend(v28, "mediaData");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  v41 = (void *)DCIM_newPLImageWithData();

                  v42 = (void *)DCIM_newJPEGRepresentationWithPLImage();
                  objc_msgSend(v28, "setMediaData:", v42);

                  v38 = CFSTR("jpg");
                  v36 = a1;
                }
              }
              v43 = *(void **)(v36 + 56);
              v141[0] = MEMORY[0x1E0C809B0];
              v141[1] = 3221225472;
              v141[2] = __47__PLCloudStreamShareJob_executeDaemonOperation__block_invoke_67;
              v141[3] = &unk_1E366DA68;
              v141[4] = v28;
              v141[5] = buf;
              writeToTemporaryMediaFileWithExtension(v38, v43, v141);
            }
            else
            {
              objc_msgSend(v28, "mediaURL");
              v48 = (void *)objc_claimAutoreleasedReturnValue();

              if (v48)
              {
                objc_msgSend(v28, "mediaURL");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                v50 = objc_msgSend(v49, "isFileURL");

                if (v50)
                {
                  objc_msgSend(v28, "mediaURL");
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v51, "path");
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  v53 = objc_msgSend(v52, "hasPrefix:", v125);

                  if (v53)
                  {
                    objc_msgSend(v28, "mediaURL");
                    v54 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v54, "pathExtension");
                    v55 = (void *)objc_claimAutoreleasedReturnValue();

                    v56 = *(void **)(a1 + 56);
                    v140[0] = MEMORY[0x1E0C809B0];
                    v140[1] = 3221225472;
                    v140[2] = __47__PLCloudStreamShareJob_executeDaemonOperation__block_invoke_2;
                    v140[3] = &unk_1E366DA68;
                    v140[4] = v28;
                    v140[5] = buf;
                    writeToTemporaryMediaFileWithExtension(v55, v56, v140);

                  }
                  else
                  {
                    objc_msgSend(v28, "mediaURL");
                    v66 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v66, "pathExtension");
                    v67 = (void *)objc_claimAutoreleasedReturnValue();
                    v68 = objc_msgSend(v67, "isEqualToString:", v123);

                    if (v68)
                    {
                      v69 = objc_alloc(MEMORY[0x1E0D75318]);
                      objc_msgSend(v28, "mediaURL");
                      v70 = (void *)objc_claimAutoreleasedReturnValue();
                      v71 = (void *)objc_msgSend(v69, "initWithBundleAtURL:", v70);

                      objc_msgSend(v71, "imagePath");
                      v72 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v71, "videoPath");
                      v73 = objc_claimAutoreleasedReturnValue();
                      v74 = (void *)v73;
                      if (v72 && v73)
                      {
                        objc_storeStrong(v144 + 5, v71);
                        objc_storeStrong((id *)v150 + 5, v72);
                      }

                    }
                    else
                    {
                      objc_msgSend(v28, "mediaURL");
                      v81 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v81, "path");
                      v82 = objc_claimAutoreleasedReturnValue();
                      v83 = (void *)*((_QWORD *)v150 + 5);
                      *((_QWORD *)v150 + 5) = v82;

                    }
                  }
                }
                else
                {
                  objc_msgSend(v28, "mediaURL");
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v57, "scheme");
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  v59 = objc_msgSend(v58, "isEqualToString:", CFSTR("assets-library"));

                  if (v59)
                  {
                    v60 = *(void **)(a1 + 48);
                    objc_msgSend(v28, "mediaURL");
                    v61 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v60, "photoFromAssetURL:", v61);
                    v62 = (void *)objc_claimAutoreleasedReturnValue();

                    if (!v62)
                    {
                      PLPhotoSharingGetLog();
                      v105 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
                      {
                        v120 = *(_QWORD *)(a1 + 32);
                        objc_msgSend(v28, "mediaURL");
                        v121 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)v163 = 138412546;
                        v164 = v120;
                        v165 = 2112;
                        v166 = v121;
                        _os_log_impl(&dword_199541000, v105, OS_LOG_TYPE_ERROR, "%@ couldn't load asset from asset url: %@", v163, 0x16u);

                      }
                      goto LABEL_52;
                    }
                    objc_msgSend(v62, "mainFileURL");
                    v63 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v63, "path");
                    v64 = objc_claimAutoreleasedReturnValue();
                    v65 = (void *)*((_QWORD *)v150 + 5);
                    *((_QWORD *)v150 + 5) = v64;

                  }
                  else
                  {
                    v75 = (void *)MEMORY[0x1E0C99D50];
                    objc_msgSend(v28, "mediaURL");
                    v76 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v75, "dataWithContentsOfURL:", v76);
                    v77 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v77)
                    {
                      objc_msgSend(v28, "mediaURL");
                      v78 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v78, "pathExtension");
                      v79 = (void *)objc_claimAutoreleasedReturnValue();

                      v80 = *(void **)(a1 + 56);
                      v137[0] = MEMORY[0x1E0C809B0];
                      v137[1] = 3221225472;
                      v137[2] = __47__PLCloudStreamShareJob_executeDaemonOperation__block_invoke_71;
                      v137[3] = &unk_1E366DA68;
                      v139 = buf;
                      v138 = v77;
                      writeToTemporaryMediaFileWithExtension(v79, v80, v137);

                    }
                  }
                }
              }
            }
          }
          if (!*((_QWORD *)v150 + 5))
          {
            PLPhotoSharingGetLog();
            v105 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
            {
              v106 = *(_QWORD *)(a1 + 32);
              *(_DWORD *)v163 = 138412546;
              v164 = v106;
              v165 = 2112;
              v166 = v28;
              _os_log_impl(&dword_199541000, v105, OS_LOG_TYPE_ERROR, "%@ unable to find media file path for source: %@", v163, 0x16u);
            }
LABEL_52:

            goto LABEL_69;
          }
          v136 = 0;
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "UUIDString");
          v85 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "cloudGUID");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "pathManager");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*((id *)v150 + 5), "pathExtension");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLCloudSharedAssetSaveJob nextDCIMSaveFileURLForCloudPersonID:cloudAlbumGUID:pathManager:fileExtension:assetUUID:](PLCloudSharedAssetSaveJob, "nextDCIMSaveFileURLForCloudPersonID:cloudAlbumGUID:pathManager:fileExtension:assetUUID:", v126, v86, v87, v88, v85);
          v89 = (void *)objc_claimAutoreleasedReturnValue();

          v90 = (void *)MEMORY[0x1E0D73208];
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", *((_QWORD *)v150 + 5), 0);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          v135 = 0;
          LOBYTE(v90) = objc_msgSend(v90, "copyItemAtURL:toURL:error:", v91, v89, &v135);
          v92 = v135;

          if ((v90 & 1) == 0)
          {
            PLPhotoSharingGetLog();
            v97 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
            {
              v107 = *(_QWORD *)(a1 + 32);
              *(_DWORD *)v163 = 138412546;
              v164 = v107;
              v165 = 2112;
              v166 = v92;
              _os_log_impl(&dword_199541000, v97, OS_LOG_TYPE_ERROR, "%@ Failed to copy media for asset %@", v163, 0x16u);
            }
            v96 = 0;
            v95 = 0;
            goto LABEL_68;
          }
          v93 = *(_QWORD *)(a1 + 48);
          v94 = objc_msgSend(MEMORY[0x1E0D73310], "savedAssetTypeForCloudSharedAsset");
          v134 = 0;
          +[PLManagedAsset insertAssetIntoPhotoLibrary:mainFileURL:savedAssetType:bundleScope:uuid:replacementUUID:imageSource:imageData:](PLManagedAsset, "insertAssetIntoPhotoLibrary:mainFileURL:savedAssetType:bundleScope:uuid:replacementUUID:imageSource:imageData:", v93, v89, v94, 2, v85, 0, &v136, &v134);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          v96 = v134;
          objc_msgSend(v95, "generateAndUpdateThumbnailsWithPreviewImage:thumbnailImage:fromImageSource:imageData:forceSRGBConversion:", 0, 0, v136, v96, 0);
          objc_msgSend(MEMORY[0x1E0D73308], "UUIDString");
          v97 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v95, "setCloudAssetGUID:", v97);
          objc_msgSend(v95, "setCloudBatchID:", *(_QWORD *)(a1 + 64));
          objc_msgSend(v95, "setCloudBatchPublishDate:", *(_QWORD *)(a1 + 40));
          objc_msgSend(v95, "setCloudPlaceholderKind:", 5);
          objc_msgSend(v95, "setCloudIsMyAsset:", 1);
          objc_msgSend(v95, "setCloudIsDeletable:", 1);
          v98 = v144[5];
          if (v98)
          {
            objc_msgSend(v98, "pairingIdentifier");
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            v100 = (void *)MEMORY[0x1E0C99E98];
            objc_msgSend(v144[5], "videoPath");
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v100, "fileURLWithPath:isDirectory:", v101, 0);
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            v103 = v144[5];
            if (v103)
            {
              objc_msgSend(v103, "originalVideoDuration");
              v104 = v144[5];
              if (v104)
              {
                objc_msgSend(v104, "imageDisplayTime");
LABEL_58:
                objc_msgSend(v95, "becomePhotoIrisWithMediaGroupUUID:mainFileMetadata:videoURL:videoDuration:stillDisplayTime:options:", v99, 0, v102, v133, v132, 0);

                goto LABEL_59;
              }
            }
            else
            {
              memset(v133, 0, sizeof(v133));
            }
            memset(v132, 0, sizeof(v132));
            goto LABEL_58;
          }
LABEL_59:
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "mutableAssets");
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v108, "addObject:", v95);

          objc_msgSend(*(id *)(a1 + 72), "addObject:", v95);
          objc_msgSend(*(id *)(a1 + 32), "commentText");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v109, "length"))
            goto LABEL_62;
          v110 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40) == 0;

          if (v110)
          {
            objc_msgSend(*(id *)(a1 + 32), "commentText");
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v111, "stringByTrimmingCharactersInSet:", v112);
            v109 = (void *)objc_claimAutoreleasedReturnValue();

            +[PLCloudSharedComment insertNewCommentIntoAsset:commentDate:withText:isLike:isMyComment:inLibrary:](PLCloudSharedComment, "insertNewCommentIntoAsset:commentDate:withText:isLike:isMyComment:inLibrary:", v95, 0, v109, 0, 1, *(_QWORD *)(a1 + 48));
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v113, "setIsBatchComment:", MEMORY[0x1E0C9AAB0]);
            objc_msgSend(v113, "setIsCaption:", MEMORY[0x1E0C9AAB0]);
            v114 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
            v115 = *(void **)(v114 + 40);
            *(_QWORD *)(v114 + 40) = v113;

LABEL_62:
          }
          v131 = 0;
          v116 = +[PLResourceInstaller installInternalResourcesForExistingAsset:assumeNoExistingResources:referencedResourceURLs:error:](PLResourceInstaller, "installInternalResourcesForExistingAsset:assumeNoExistingResources:referencedResourceURLs:error:", v95, 1, 0, &v131);
          v117 = v131;
          if (!v116)
          {
            PLPhotoSharingGetLog();
            v118 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
            {
              v119 = *(_QWORD *)(a1 + 32);
              *(_DWORD *)v163 = 138412546;
              v164 = v119;
              v165 = 2112;
              v166 = v117;
              _os_log_impl(&dword_199541000, v118, OS_LOG_TYPE_ERROR, "%@ Failed to install resources for asset %@", v163, 0x16u);
            }

          }
LABEL_68:

LABEL_69:
          _Block_object_dispose(&v143, 8);

          _Block_object_dispose(buf, 8);
          v27 = (char *)v27 + 1;
        }
        while (obja != v27);
        v122 = objc_msgSend(v124, "countByEnumeratingWithState:objects:count:", &v155, v167, 16);
        obja = (id)v122;
      }
      while (v122);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "updateCloudLastInterestingChangeDateWithDate:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "updateCloudLastContributionDateWithDate:", *(_QWORD *)(a1 + 40));
    v21 = v125;
  }
  else
  {
    PLPhotoSharingGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "ERROR: sharingPersonID is nil, ending job", buf, 2u);
    }
  }

}

void __47__PLCloudStreamShareJob_executeDaemonOperation__block_invoke_80(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[4];
  id v7;
  __int128 v8;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    +[PLPhotoSharingHelper publishCloudSharedAlbumToServer:](PLPhotoSharingHelper, "publishCloudSharedAlbumToServer:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v2 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__PLCloudStreamShareJob_executeDaemonOperation__block_invoke_2_81;
  v6[3] = &unk_1E3677830;
  v3 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = *(_OWORD *)(a1 + 64);
  v4[0] = v2;
  v4[1] = 3221225472;
  v4[2] = __47__PLCloudStreamShareJob_executeDaemonOperation__block_invoke_3;
  v4[3] = &unk_1E3677AA0;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v3, "performTransaction:completionHandler:withPriority:", v6, v4, 1);

}

uint64_t __47__PLCloudStreamShareJob_executeDaemonOperation__block_invoke_2_81(_QWORD *a1)
{
  uint64_t result;

  result = +[PLPhotoSharingHelper enqueueCloudSharedAssetsForPublishToServer:inSharedAlbum:](PLPhotoSharingHelper, "enqueueCloudSharedAssetsForPublishToServer:inSharedAlbum:", a1[4], *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));
  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
    return +[PLPhotoSharingHelper publishCloudSharedCommentToServer:](PLPhotoSharingHelper, "publishCloudSharedCommentToServer:");
  return result;
}

void __47__PLCloudStreamShareJob_executeDaemonOperation__block_invoke_3(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t buf[4];
  uint64_t v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v15, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v1);
        v6 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i);
        PLPhotoSharingGetLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v14 = v6;
          _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "PLCloudShareStreamJob removing temporary media file at path %@", buf, 0xCu);
        }

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeItemAtPath:error:", v6, 0);

      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v15, 16);
    }
    while (v3);
  }

}

uint64_t __47__PLCloudStreamShareJob_executeDaemonOperation__block_invoke_56(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "mediaURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v6 = objc_msgSend(v4, "moveItemAtURL:toURL:error:", v5, v3, &v16);
  v7 = v16;

  if ((_DWORD)v6)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0D75318]), "initWithBundleAtURL:", v3);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "imagePath");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(NSObject **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;
  }
  else
  {
    PLPhotoSharingGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "mediaURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v18 = v14;
      v19 = 2112;
      v20 = v3;
      v21 = 2112;
      v22 = v7;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "Couldn't move asset from url: %@ to url: %@ with error %@.", buf, 0x20u);

    }
  }

  return v6;
}

uint64_t __47__PLCloudStreamShareJob_executeDaemonOperation__block_invoke_67(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  uint64_t v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "mediaData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "writeToFile:options:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 1073741825, 0);

  return v6;
}

uint64_t __47__PLCloudStreamShareJob_executeDaemonOperation__block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "mediaURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v8 = objc_msgSend(v6, "moveItemAtURL:toURL:error:", v7, v5, &v13);
  v9 = v13;

  if ((v8 & 1) == 0)
  {
    PLPhotoSharingGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "mediaURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v15 = v11;
      v16 = 2112;
      v17 = v5;
      v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Couldn't move asset from url: %@ to url: %@ with error %@.", buf, 0x20u);

    }
  }

  return v8;
}

uint64_t __47__PLCloudStreamShareJob_executeDaemonOperation__block_invoke_71(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  v5 = objc_msgSend(*(id *)(a1 + 32), "writeToFile:options:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 1073741825, 0);

  return v5;
}

void __38__PLCloudStreamShareJob_runDaemonSide__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  xpc_object_t v4;
  objc_super v5;

  v2 = (void *)MEMORY[0x19AEC1554]();
  objc_msgSend(*(id *)(a1 + 32), "executeDaemonOperation");
  v3 = *(void **)(a1 + 32);
  v4 = xpc_dictionary_create(0, 0, 0);
  objc_msgSend(v3, "setXpcReply:", v4);

  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)PLCloudStreamShareJob;
  objc_msgSendSuper2(&v5, sel_runDaemonSide);
  objc_msgSend(*(id *)(a1 + 40), "stillAlive");
  objc_autoreleasePoolPop(v2);
}

+ (void)publishMediaFromSources:(id)a3 toSharedAlbum:(id)a4 withCommentText:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_opt_class();
  v14 = (id)objc_opt_new();
  objc_msgSend(v14, "setMediaSources:", v12);

  objc_msgSend(v11, "cloudGUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setAlbumCloudGUID:", v13);
  objc_msgSend(v14, "setCommentText:", v10);

  objc_msgSend(v14, "runWithCompletionHandler:", v9);
}

+ (void)publishMediaFromSources:(id)a3 toNewSharedAlbumWithName:(id)a4 withCommentText:(id)a5 recipients:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_opt_class();
  v13 = (id)objc_opt_new();
  objc_msgSend(v13, "setMediaSources:", v12);

  objc_msgSend(v13, "setAlbumName:", v11);
  objc_msgSend(v13, "setCommentText:", v10);

  objc_msgSend(v13, "addInfosForRecipients:", v9);
  objc_msgSend(v13, "runWithCompletionHandler:", 0);

}

@end
