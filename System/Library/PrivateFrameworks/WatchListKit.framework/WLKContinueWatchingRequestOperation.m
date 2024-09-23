@implementation WLKContinueWatchingRequestOperation

+ (void)donateMediaItems:(id)a3
{
  id v3;
  float v4;
  float v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  char v58;
  uint64_t v59;
  NSObject *v60;
  NSObject *v61;
  id v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  float v68;
  double v69;
  void *v70;
  id v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t i;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  NSObject *v91;
  id v92;
  void *v93;
  void *v94;
  NSObject *v95;
  void *v96;
  id obj;
  void *v98;
  void *v99;
  void *v100;
  id v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  void *v105;
  NSObject *v106;
  uint64_t v107;
  id v108;
  void *v109;
  void *v110;
  int v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  _BYTE v120[128];
  uint64_t v121;
  uint8_t buf[4];
  id v123;
  __int16 v124;
  void *v125;
  _BYTE v126[128];
  uint64_t v127;

  v127 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v92 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  MGGetFloat32Answer();
  v5 = v4;
  WLKSiriActionsLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v123 = v7;
    _os_log_impl(&dword_1B515A000, v6, OS_LOG_TYPE_DEFAULT, "WLKContinueWatchingResponse - UpNext items: %@", buf, 0xCu);

  }
  v118 = 0u;
  v119 = 0u;
  v116 = 0u;
  v117 = 0u;
  obj = v3;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v116, v126, 16);
  if (v8)
  {
    v9 = v5 * 60.0;
    v102 = *(_QWORD *)v117;
    do
    {
      v10 = 0;
      v103 = v8;
      do
      {
        if (*(_QWORD *)v117 != v102)
          objc_enumerationMutation(obj);
        v110 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * v10);
        objc_msgSend(v110, "movieOrShowContent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "contentType");
        objc_msgSend(v11, "canonicalID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "title");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "images");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "artworkVariantOfType:", 26);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
        {
          v18 = v16;
        }
        else
        {
          objc_msgSend(v11, "images");
          v107 = v10;
          v19 = v11;
          v20 = v14;
          v21 = v13;
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "artworkVariantOfType:", 4);
          v18 = (id)objc_claimAutoreleasedReturnValue();

          v13 = v21;
          v14 = v20;
          v11 = v19;
          v10 = v107;
        }

        if (v12 != 1)
        {
          if (v12 == 4)
          {
            objc_opt_class();
            v108 = v18;
            v109 = v14;
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v23 = v11;
              objc_msgSend(v23, "images");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "artworkVariantOfType:", 26);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = v29;
              if (v29)
              {
                v27 = v29;
              }
              else
              {
                objc_msgSend(v23, "images");
                v47 = v13;
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "artworkVariantOfType:", 17);
                v27 = (id)objc_claimAutoreleasedReturnValue();

                v13 = v47;
              }

              objc_msgSend(v23, "canonicalShowID");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "showTitle");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = 13;
              goto LABEL_28;
            }
            v27 = 0;
            v40 = 0;
            v39 = 0;
            v43 = 13;
          }
          else
          {
            if (v12 != 2)
              goto LABEL_62;
            v108 = v18;
            objc_msgSend(v110, "movieOrShowContent");
            v23 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "images");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "artworkVariantOfType:", 26);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = v25;
            v109 = v14;
            if (v25)
            {
              v27 = v25;
            }
            else
            {
              objc_msgSend(v110, "movieOrShowContent");
              v105 = v13;
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "images");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "artworkVariantOfType:", 4);
              v46 = objc_claimAutoreleasedReturnValue();

              v27 = (id)v46;
              v13 = v105;
            }

            v40 = 0;
            v39 = 0;
            v43 = 12;
LABEL_28:

          }
          if (!objc_msgSend(v39, "length") || !objc_msgSend(v40, "length"))
          {
            WLKSiriActionsLogObject();
            v60 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v123 = v39;
              v124 = 2112;
              v125 = v40;
              _os_log_impl(&dword_1B515A000, v60, OS_LOG_TYPE_DEFAULT, "WLKContinueWatchingResponse - Skipping donation, missing media container info. mediaContainerCanonicalId: %@, mediaContainerItemTitle: %@", buf, 0x16u);
            }
            goto LABEL_61;
          }
          v104 = v13;
          objc_msgSend(v27, "artworkSize");
          v50 = v49;
          objc_msgSend(v27, "artworkSize");
          v52 = v50 / v51;
          v53 = (void *)MEMORY[0x1E0CBD958];
          v101 = v27;
          objc_msgSend(v27, "artworkURLForSize:format:", CFSTR("jpg"), v9, v9 * v52);
          v54 = v43;
          v55 = v40;
          v56 = v39;
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "imageWithURL:width:height:", v57, 60.0, v52 * 60.0);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          v39 = v56;
          v40 = v55;
          v41 = objc_msgSend(objc_alloc(MEMORY[0x1E0CBD9E0]), "initWithIdentifier:title:type:artwork:", v39, v55, v54, v37);
          v42 = 0;
          v38 = 0;
          goto LABEL_32;
        }
        v104 = v13;
        v108 = v18;
        v109 = v14;
        if (!objc_msgSend(v13, "length") || !objc_msgSend(v14, "length"))
        {
          v39 = 0;
          v40 = 0;
          v101 = 0;
          v38 = 0;
          v41 = 0;
          v42 = 1;
          goto LABEL_33;
        }
        objc_msgSend(v18, "artworkSize");
        v32 = v31;
        objc_msgSend(v18, "artworkSize");
        v34 = v32 / v33;
        v35 = (void *)MEMORY[0x1E0CBD958];
        objc_msgSend(v18, "artworkURLForSize:format:", CFSTR("jpg"), v9, v9 * v34);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "imageWithURL:width:height:", v36, 60.0, v34 * 60.0);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        v38 = objc_msgSend(objc_alloc(MEMORY[0x1E0CBD9E0]), "initWithIdentifier:title:type:artwork:", v13, v14, 11, v37);
        v39 = 0;
        v40 = 0;
        v101 = 0;
        v41 = 0;
        v42 = 1;
LABEL_32:

LABEL_33:
        v106 = v41;
        v100 = (void *)v38;
        if (!(v38 | v41))
        {
          WLKSiriActionsLogObject();
          v61 = objc_claimAutoreleasedReturnValue();
          v13 = v104;
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v123 = v110;
            _os_log_impl(&dword_1B515A000, v61, OS_LOG_TYPE_DEFAULT, "WLKContinueWatchingResponse - Skipping donation, no mediaItem or container %@", buf, 0xCu);
          }
          v60 = v106;
          v27 = v101;
          goto LABEL_60;
        }
        v99 = v11;
        v58 = v42 ^ 1;
        if (!v38)
          v58 = 1;
        v94 = v39;
        if ((v58 & 1) != 0)
        {
          v59 = 0;
        }
        else
        {
          v121 = v38;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v121, 1);
          v59 = objc_claimAutoreleasedReturnValue();
        }
        v96 = v40;
        v62 = objc_alloc(MEMORY[0x1E0CBDA70]);
        objc_msgSend(v110, "playable");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "playEvent");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        if (v64)
          v65 = MEMORY[0x1E0C9AAB0];
        else
          v65 = MEMORY[0x1E0C9AAA0];
        v95 = v59;
        v66 = (void *)objc_msgSend(v62, "initWithMediaItems:mediaContainer:playShuffled:playbackRepeatMode:resumePlayback:playbackQueueLocation:playbackSpeed:mediaSearch:", v59, v106, MEMORY[0x1E0C9AAA0], 1, v65, 1, &unk_1E68C9908, 0);

        objc_msgSend(v110, "siriActionsExpirationEpochMillis");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "floatValue");
        v69 = v68 / 1000.0;

        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v69);
        v98 = v66;
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "setExpirationDate:");
        objc_msgSend(v110, "siriActionsCategories");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v112 = 0u;
        v113 = 0u;
        v114 = 0u;
        v115 = 0u;
        v72 = v70;
        v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v112, v120, 16);
        if (v73)
        {
          v74 = v73;
          v75 = *(_QWORD *)v113;
          do
          {
            for (i = 0; i != v74; ++i)
            {
              if (*(_QWORD *)v113 != v75)
                objc_enumerationMutation(v72);
              v77 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDC00]), "initWithVocabularyIdentifier:spokenPhrase:pronunciationHint:", *(_QWORD *)(*((_QWORD *)&v112 + 1) + 8 * i), CFSTR("TV"), CFSTR("TV"));
              objc_msgSend(v71, "addObject:", v77);

            }
            v74 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v112, v120, 16);
          }
          while (v74);
        }

        objc_msgSend(v98, "setBuckets:", v71);
        WLKTVAppBundleID();
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "_setLaunchId:");
        objc_msgSend(v98, "_setExtensionBundleId:", 0);
        objc_msgSend(v110, "playable");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "channelDetails");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "appBundleIDs");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "firstObject");
        v82 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v82, "length"))
          goto LABEL_58;
        objc_msgSend(v79, "channelDetails");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v83, "isiTunes"))
        {

LABEL_58:
          v85 = v78;

          v82 = v85;
          goto LABEL_59;
        }
        objc_msgSend(v79, "channelDetails");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v111 = objc_msgSend(v84, "isFirstParty");

        if (v111)
          goto LABEL_58;
LABEL_59:
        v39 = v94;
        objc_msgSend(v98, "setProxiedBundleIdentifier:", v82);
        objc_msgSend(v92, "addObject:", v98);

        v13 = v104;
        v60 = v106;
        v11 = v99;
        v27 = v101;
        v61 = v95;
        v40 = v96;
LABEL_60:

LABEL_61:
        v18 = v108;
        v14 = v109;
LABEL_62:

        ++v10;
      }
      while (v10 != v103);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v116, v126, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x1E0CBDCC0], "sharedManager");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "setPredictionMode:forType:", 1, 12);

  objc_msgSend(MEMORY[0x1E0CBDCC0], "sharedManager");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setPredictionMode:forType:", 1, 13);

  objc_msgSend(MEMORY[0x1E0CBDCC0], "sharedManager");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setPredictionMode:forType:", 1, 11);

  objc_msgSend(MEMORY[0x1E0CBDCC0], "sharedManager");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = (void *)objc_msgSend(v92, "copy");
  objc_msgSend(v89, "setSuggestedMediaIntents:", v90);

  WLKSiriActionsLogObject();
  v91 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v123 = v92;
    _os_log_impl(&dword_1B515A000, v91, OS_LOG_TYPE_DEFAULT, "WLKContinueWatchingResponse - Donated media intents: %@", buf, 0xCu);
  }

}

- (WLKContinueWatchingRequestOperation)init
{
  return -[WLKContinueWatchingRequestOperation initWithQueryParameters:](self, "initWithQueryParameters:", 0);
}

- (WLKContinueWatchingRequestOperation)initWithCaller:(id)a3 options:(int64_t)a4
{
  return -[WLKContinueWatchingRequestOperation initWithQueryParameters:](self, "initWithQueryParameters:", 0, a4);
}

- (WLKContinueWatchingRequestOperation)initWithQueryParameters:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  WLKContinueWatchingRequestOperation *v8;
  objc_super v10;

  v4 = a3;
  if ((WLKIsTVApp() & 1) != 0)
    v5 = 0;
  else
    v5 = WLKIsTool() ^ 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 15.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[WLKURLRequestProperties requestPropertiesWithEndpoint:queryParameters:httpMethod:headers:caller:timeout:apiVersion:options:](WLKURLRequestProperties, "requestPropertiesWithEndpoint:queryParameters:httpMethod:headers:caller:timeout:apiVersion:options:", CFSTR("shelves/uts.col.UpNext"), v4, 0, 0, 0, v6, &unk_1E68C98F0, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10.receiver = self;
  v10.super_class = (Class)WLKContinueWatchingRequestOperation;
  v8 = -[WLKUTSNetworkRequestOperation initWithRequestProperties:](&v10, sel_initWithRequestProperties_, v7);

  return v8;
}

- (void)processResponse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  WLKDictionaryResponseProcessor *v10;

  v10 = objc_alloc_init(WLKDictionaryResponseProcessor);
  -[WLKDictionaryResponseProcessor setObjectClass:](v10, "setObjectClass:", objc_opt_class());
  -[WLKNetworkRequestOperation data](self, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLKDictionaryResponseProcessor processResponseData:error:](v10, "processResponseData:error:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLKContinueWatchingRequestOperation setResponse:](self, "setResponse:", v4);

  -[WLKUTSNetworkRequestOperation requestProperties](self, "requestProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queryParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "count") && WLKIsTVApp())
  {
    if (-[WLKNetworkRequestOperation resourceFetchType](self, "resourceFetchType") == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "postNotificationName:object:", CFSTR("WLKContinueWatchingRequestDidCompleteNotification"), 0);

    }
    v8 = (void *)objc_opt_class();
    -[WLKContinueWatchingResponse items](self->_response, "items");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "donateMediaItems:", v9);

  }
}

- (WLKContinueWatchingResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
}

@end
