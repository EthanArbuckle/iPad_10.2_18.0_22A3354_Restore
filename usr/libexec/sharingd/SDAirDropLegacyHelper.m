@implementation SDAirDropLegacyHelper

+ (id)realPathURL:(__CFURL *)a3
{
  CFURLRef v3;
  const __CFURL *v4;
  uint64_t v5;
  size_t v6;
  Boolean v7;
  CFURLRef v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  CFTypeRef cf;
  char __s[1024];
  UInt8 buffer[1024];

  cf = 0;
  v3 = CFURLCreateFilePathURL(0, a3, (CFErrorRef *)&cf);
  if (v3)
  {
    v4 = v3;
    bzero(buffer, 0x400uLL);
    v5 = CFURLGetFileSystemRepresentation(v4, 1u, buffer, 1024);
    if ((_DWORD)v5)
    {
      bzero(__s, 0x400uLL);
      if (realpath_DARWIN_EXTSN((const char *)buffer, __s))
      {
        v6 = strlen(__s);
        v7 = sub_10019A9F0(v4);
        v8 = CFURLCreateFromFileSystemRepresentation(0, (const UInt8 *)__s, v6, v7);
        if (v8)
        {
LABEL_15:
          CFRelease(v4);
          return v8;
        }
        v9 = airdrop_log(0);
        v10 = objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          sub_10019A370();
      }
      else
      {
        v21 = airdrop_log(0);
        v10 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          sub_10019A2DC((uint64_t)buffer, v10);
      }
    }
    else
    {
      v20 = airdrop_log(v5);
      v10 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_10019A27C();
    }

    v8 = 0;
    goto LABEL_15;
  }
  v11 = airdrop_log(0);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    sub_10019A214((uint64_t)&cf, v12, v13, v14, v15, v16, v17, v18);

  CFRelease(cf);
  return 0;
}

+ (void)convertMediaItemsWithFileURLs:(id)a3 clientBundleID:(id)a4 mediaCapabilities:(id)a5 supportsLivePhoto:(BOOL)a6 supportsAssetBundles:(BOOL)a7 supportsWideGamut:(BOOL)a8 completionHandler:(id)a9
{
  _BOOL8 v10;
  _BOOL8 v11;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;

  v10 = a7;
  v11 = a6;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100196D08;
  v17[3] = &unk_1007199F8;
  v18 = a9;
  v15 = v18;
  LOBYTE(v16) = a8;
  +[SDAirDropLegacyHelper convertMediaItemsWithFileURLs:clientBundleID:conversionManager:mediaCapabilities:supportsLivePhoto:supportsAssetBundles:supportsWideGamut:queue:progressHandler:completionHandler:](SDAirDropLegacyHelper, "convertMediaItemsWithFileURLs:clientBundleID:conversionManager:mediaCapabilities:supportsLivePhoto:supportsAssetBundles:supportsWideGamut:queue:progressHandler:completionHandler:", a3, a4, 0, a5, v11, v10, v16, &_dispatch_main_q, &stru_1007199D0, v17);

}

+ (void)convertMediaItemsWithFileURLs:(id)a3 clientBundleID:(id)a4 conversionManager:(id)a5 mediaCapabilities:(id)a6 supportsLivePhoto:(BOOL)a7 supportsAssetBundles:(BOOL)a8 supportsWideGamut:(BOOL)a9 queue:(id)a10 progressHandler:(id)a11 completionHandler:(id)a12
{
  id v15;
  PHMediaFormatConversionManager *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  uint64_t v22;
  SDAirDropConvertMediaItemsResult *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  dispatch_group_t v29;
  id v30;
  void *v31;
  unsigned int v32;
  void *v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  char v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  BOOL v55;
  uint64_t v56;
  NSObject *v57;
  uint64_t *v58;
  id v59;
  void *v60;
  uint64_t v61;
  NSObject *v62;
  void *v64;
  id v65;
  NSObject *v66;
  id v67;
  PHMediaFormatConversionManager *v68;
  id v69;
  _QWORD *v70;
  _QWORD *v71;
  id v72;
  void *v73;
  uint64_t v74;
  NSObject *v75;
  void *v76;
  id v77;
  void *v78;
  uint64_t v79;
  NSObject *v80;
  void *v81;
  void *v82;
  dispatch_queue_global_t v83;
  NSObject *v84;
  id v85;
  id v86;
  id v87;
  NSObject *v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  void *v94;
  id v95;
  _BOOL4 v96;
  _BOOL4 v97;
  id obj;
  uint64_t v99;
  uint64_t v100;
  id v101;
  id v102;
  id v103;
  uint64_t v104;
  PHMediaFormatConversionManager *v105;
  dispatch_group_t group;
  _QWORD *v107;
  void *j;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _QWORD block[4];
  dispatch_group_t v114;
  PHMediaFormatConversionManager *v115;
  id v116;
  id v117;
  id v118;
  id v119;
  uint64_t *v120;
  uint64_t *v121;
  _QWORD *v122;
  BOOL v123;
  _QWORD v124[4];
  id v125;
  _QWORD *v126;
  _QWORD *v127;
  _QWORD v128[4];
  NSObject *v129;
  id v130;
  PHMediaFormatConversionManager *v131;
  id v132;
  id v133;
  id v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  _QWORD v139[4];
  id v140;
  id v141;
  id v142;
  dispatch_group_t v143;
  uint64_t *v144;
  uint64_t *v145;
  uint64_t v146;
  uint64_t *v147;
  uint64_t v148;
  uint64_t (*v149)(uint64_t, uint64_t);
  void (*v150)(uint64_t);
  id v151;
  uint64_t v152;
  uint64_t *v153;
  uint64_t v154;
  uint64_t v155;
  _QWORD v156[5];
  id v157;
  uint8_t v158[128];
  uint8_t buf[4];
  void *v160;
  __int16 v161;
  void *v162;
  _BYTE v163[128];

  v96 = a7;
  v97 = a8;
  v15 = a3;
  v92 = a4;
  v16 = (PHMediaFormatConversionManager *)a5;
  v102 = a6;
  v95 = a10;
  v101 = a11;
  v93 = a12;
  v94 = v15;
  if ((SFIsDeviceAudioAccessory(v93) & 1) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v15, "count")));
    v111 = 0u;
    v112 = 0u;
    v109 = 0u;
    v110 = 0u;
    v18 = v15;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v109, v158, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v110;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(_QWORD *)v110 != v20)
            objc_enumerationMutation(v18);
          v22 = *(_QWORD *)(*((_QWORD *)&v109 + 1) + 8 * (_QWORD)i);
          v23 = objc_alloc_init(SDAirDropConvertMediaItemsResult);
          -[SDAirDropConvertMediaItemsResult setUrl:](v23, "setUrl:", v22);
          objc_msgSend(v17, "addObject:", v23);

        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v109, v158, 16);
      }
      while (v19);
    }

    (*((void (**)(id, void *, void *, void *, void *, uint64_t, _QWORD, PHMediaFormatConversionManager *, _QWORD))v93
     + 2))(v93, v17, &__NSArray0__struct, &__NSArray0__struct, &__kCFBooleanFalse, 4, 0, v16, 0);

  }
  else
  {
    if (!v16)
    {
      v16 = objc_opt_new(PHMediaFormatConversionManager);
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[PLPhotoLibrary systemPhotoLibrary](PLPhotoLibrary, "systemPhotoLibrary"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "photoOutboundSharingTmpDirectoryURL"));
      -[PHMediaFormatConversionManager setDirectoryForTemporaryFiles:](v16, "setDirectoryForTemporaryFiles:", v25);

    }
    v156[0] = 0;
    v156[1] = v156;
    v156[2] = 0x3032000000;
    v156[3] = sub_1001979AC;
    v156[4] = sub_1001979BC;
    v157 = 0;
    v152 = 0;
    v153 = &v152;
    v154 = 0x2020000000;
    v155 = 0;
    v146 = 0;
    v147 = &v146;
    v148 = 0x3032000000;
    v149 = sub_1001979AC;
    v150 = sub_1001979BC;
    v151 = 0;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v15, "count")));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v15, "count")));
    v105 = v16;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v29 = dispatch_group_create();
    v139[0] = _NSConcreteStackBlock;
    v139[1] = 3221225472;
    v139[2] = sub_1001979C4;
    v139[3] = &unk_100719A20;
    v91 = v26;
    v140 = v91;
    v90 = v27;
    v141 = v90;
    v89 = v28;
    v142 = v89;
    v144 = &v152;
    v145 = &v146;
    group = v29;
    v143 = group;
    v107 = objc_retainBlock(v139);
    v137 = 0u;
    v138 = 0u;
    v135 = 0u;
    v136 = 0u;
    obj = v15;
    v103 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v135, v163, 16);
    if (v103)
    {
      v99 = PFAssetBundleFileExtension;
      v100 = *(_QWORD *)v136;
      v104 = PFLivePhotoBundleExtension;
      do
      {
        for (j = 0; j != v103; j = (char *)j + 1)
        {
          if (*(_QWORD *)v136 != v100)
            objc_enumerationMutation(obj);
          v30 = *(id *)(*((_QWORD *)&v135 + 1) + 8 * (_QWORD)j);
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "pathExtension"));
          v32 = objc_msgSend(v31, "isEqual:", v99);

          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "pathExtension"));
          v34 = objc_msgSend(v33, "isEqual:", v104);

          if (v32)
          {
            v36 = airdrop_log(v35);
            v37 = objc_claimAutoreleasedReturnValue(v36);
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "lastPathComponent"));
              *(_DWORD *)buf = 138412290;
              v160 = v38;
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "attempting to send asset bundle %@", buf, 0xCu);

            }
            v39 = objc_msgSend(objc_alloc((Class)PFAssetBundle), "initWithAssetBundleAtURL:", v30);
            v40 = v39;
            if (v39)
            {
              if (v97)
              {
                v41 = airdrop_log(v39);
                v42 = objc_claimAutoreleasedReturnValue(v41);
                if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
                {
                  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "lastPathComponent"));
                  *(_DWORD *)buf = 138412290;
                  v160 = v43;
                  _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "receiver supports receiving asset bundle %@", buf, 0xCu);

                }
                dispatch_group_enter(group);
                ((void (*)(_QWORD *, id, _QWORD, _QWORD))v107[2])(v107, v30, 0, 0);
                v44 = 1;
              }
              else
              {
                v45 = airdrop_log(v39);
                v46 = objc_claimAutoreleasedReturnValue(v45);
                if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                {
                  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "lastPathComponent"));
                  *(_DWORD *)buf = 138412290;
                  v160 = v47;
                  _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "receiver does not support receiving asset bundle %@. Conversion required.", buf, 0xCu);

                }
                v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
                v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "UUIDString"));

                v50 = (void *)objc_claimAutoreleasedReturnValue(-[PHMediaFormatConversionManager directoryForTemporaryFiles](v105, "directoryForTemporaryFiles"));
                v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "URLByAppendingPathComponent:", v49));

                v134 = 0;
                v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "writeDowngradedRepresentationToDirectory:error:", v51, &v134));
                v53 = v134;
                v54 = v53;
                if (v53)
                  v55 = 1;
                else
                  v55 = v52 == 0;
                v44 = v55;
                if (v55)
                {
                  v56 = airdrop_log(v53);
                  v57 = objc_claimAutoreleasedReturnValue(v56);
                  if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412546;
                    v160 = v51;
                    v161 = 2112;
                    v162 = v54;
                    _os_log_error_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "assetBundle returned NULL for writing downgraded version to URL: %@. Error: %@", buf, 0x16u);
                  }

                  v153[3] = 10;
                  v58 = v147;
                  v59 = v54;
                  v60 = (void *)v58[5];
                  v58[5] = (uint64_t)v59;
                }
                else
                {
                  v61 = airdrop_log(v53);
                  v62 = objc_claimAutoreleasedReturnValue(v61);
                  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
                  {
                    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "lastPathComponent"));
                    *(_DWORD *)buf = 138412290;
                    v160 = v64;
                    _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "asset bundle was downgraded to: %@", buf, 0xCu);

                  }
                  v65 = v52;

                  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "pathExtension"));
                  v34 = objc_msgSend(v60, "isEqual:", v104);
                  v30 = v65;
                }

              }
            }
            else
            {
              v44 = 0;
            }

          }
          else
          {
            v44 = 0;
          }
          v128[0] = _NSConcreteStackBlock;
          v128[1] = 3221225472;
          v128[2] = sub_100197DEC;
          v128[3] = &unk_100719A48;
          v66 = group;
          v129 = v66;
          v67 = v102;
          v130 = v67;
          v68 = v105;
          v131 = v68;
          v69 = v101;
          v132 = v69;
          v70 = v107;
          v133 = v70;
          v71 = objc_retainBlock(v128);
          if (v34
            && (v72 = objc_msgSend(objc_alloc((Class)PFVideoComplement), "initWithBundleAtURL:", v30),
                (v73 = v72) != 0))
          {
            if (v96)
            {
              v74 = airdrop_log(v72);
              v75 = objc_claimAutoreleasedReturnValue(v74);
              if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
              {
                v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "lastPathComponent"));
                *(_DWORD *)buf = 138412290;
                v160 = v76;
                _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "attempting conversion of live photo bundle %@", buf, 0xCu);

              }
              dispatch_group_enter(v66);
              v124[0] = _NSConcreteStackBlock;
              v124[1] = 3221225472;
              v124[2] = sub_100197E40;
              v124[3] = &unk_100719A70;
              v127 = v156;
              v77 = v30;
              v125 = v77;
              v126 = v70;
              +[SDAirDropLegacyHelper convertLivePhotoBundleIfNeeded:capabilities:conversionManager:queue:progressHandler:completionHandler:](SDAirDropLegacyHelper, "convertLivePhotoBundleIfNeeded:capabilities:conversionManager:queue:progressHandler:completionHandler:", v77, v67, v68, v95, v69, v124);

              v78 = v125;
            }
            else
            {
              v79 = airdrop_log(v72);
              v80 = objc_claimAutoreleasedReturnValue(v79);
              if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
              {
                v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "lastPathComponent"));
                *(_DWORD *)buf = 138412290;
                v160 = v81;
                _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "attempting conversion of extracted photo from live photo bundle %@", buf, 0xCu);

              }
              v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "imagePath"));
              v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v78));
              ((void (*)(_QWORD *, void *))v71[2])(v71, v82);

            }
          }
          else if ((v44 & 1) == 0)
          {
            ((void (*)(_QWORD *, id))v71[2])(v71, v30);
          }

        }
        v103 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v135, v163, 16);
      }
      while (v103);
    }

    v83 = sub_10019AB98();
    v84 = objc_claimAutoreleasedReturnValue(v83);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100197EE8;
    block[3] = &unk_100719AC0;
    v114 = group;
    v120 = &v152;
    v119 = v93;
    v121 = &v146;
    v123 = a9;
    v16 = v105;
    v115 = v16;
    v116 = v90;
    v117 = v91;
    v118 = v89;
    v122 = v156;
    v85 = v89;
    v86 = v91;
    v87 = v90;
    v88 = group;
    dispatch_async(v84, block);

    _Block_object_dispose(&v146, 8);
    _Block_object_dispose(&v152, 8);
    _Block_object_dispose(v156, 8);

  }
}

+ (void)convertLivePhotoBundleIfNeeded:(id)a3 capabilities:(id)a4 conversionManager:(id)a5 queue:(id)a6 progressHandler:(id)a7 completionHandler:(id)a8
{
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10019828C;
  v15[3] = &unk_100719AE8;
  v16 = a6;
  v17 = a8;
  v13 = v17;
  v14 = v16;
  +[SDAirDropLegacyHelper convertMediaItemFromURL:forMediaCapabilities:conversionManager:progressHandler:completionHandler:](SDAirDropLegacyHelper, "convertMediaItemFromURL:forMediaCapabilities:conversionManager:progressHandler:completionHandler:", a3, a4, a5, a7, v15);

}

+ (void)convertMediaItemFromURL:(id)a3 forMediaCapabilities:(id)a4 conversionManager:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void (**v15)(id, id, _QWORD, uint64_t);
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  unsigned int v36;
  uint64_t v37;
  void *v38;
  unsigned __int8 v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  id v44;
  char v45;
  void *v46;
  void *v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  void (**v54)(id, id, _QWORD, uint64_t);
  id v55;
  char v56;
  id v57;
  uint8_t buf[4];
  void *v59;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (void (**)(id, id, _QWORD, uint64_t))a7;
  v16 = objc_claimAutoreleasedReturnValue(+[PHMediaFormatConversionSource sourceForFileURL:](PHMediaFormatConversionSource, "sourceForFileURL:", v11));
  v17 = (void *)v16;
  if (!v12 || !v16)
  {
    if (!v16)
      goto LABEL_15;
    v24 = airdrop_log(v16);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "fileURL"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "lastPathComponent"));
      *(_DWORD *)buf = 138412290;
      v59 = v27;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Assuming no conversion needed for %@", buf, 0xCu);

    }
    v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "fileURL"));
    v29 = (void *)v28;
    if (v28)
      v30 = (void *)v28;
    else
      v30 = v11;
    v31 = v30;

    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "fileType"));
    if (objc_msgSend(v32, "isEqualToString:", CFSTR("com.apple.live-photo-bundle")))
    {

    }
    else
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "fileType"));
      v36 = objc_msgSend(v35, "isEqualToString:", CFSTR("com.apple.private.live-photo-bundle"));

      if (!v36)
      {
        if ((objc_msgSend(v17, "containsVideoWithFormatEligibleForTranscoding") & 1) != 0)
          v40 = 1;
        else
          v40 = (uint64_t)objc_msgSend(v17, "containsHEIFImage");
        v37 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v40));
        goto LABEL_31;
      }
    }
    v37 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v17, "containsHEIFImage")));
LABEL_31:
    v20 = (void *)v37;
    v15[2](v15, v31, 0, v37);
LABEL_32:

    goto LABEL_33;
  }
  v57 = 0;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[PHMediaFormatConversionRequest requestForSource:destinationCapabilities:error:](PHMediaFormatConversionRequest, "requestForSource:destinationCapabilities:error:", v16, v12, &v57));
  v19 = v57;
  v20 = v19;
  if (v18)
  {
    v46 = v14;
    v47 = v13;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "fileURL"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "lastPathComponent"));

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "fileType"));
    if (objc_msgSend(v23, "isEqualToString:", CFSTR("com.apple.live-photo-bundle")))
    {

    }
    else
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "fileType"));
      v39 = objc_msgSend(v38, "isEqualToString:", CFSTR("com.apple.private.live-photo-bundle"));

      if ((v39 & 1) == 0)
      {
        objc_msgSend(v18, "setLivePhotoPairingIdentifierBehavior:", 5);
        v45 = 0;
        goto LABEL_26;
      }
    }
    v45 = 1;
LABEL_26:
    v41 = airdrop_log(objc_msgSend(v18, "setUseTransferBehaviorUserPreference:", 1));
    v42 = objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v59 = v22;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Determining if conversion required for %@", buf, 0xCu);
    }

    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_100198928;
    v48[3] = &unk_100719B38;
    v49 = v18;
    v54 = v15;
    v50 = v11;
    v51 = v22;
    v43 = v22;
    v14 = v46;
    v55 = v46;
    v13 = v47;
    v52 = v47;
    v53 = v17;
    v56 = v45;
    v44 = v43;
    v31 = v18;
    objc_msgSend(v52, "preflightConversionRequest:completionHandler:", v31, v48);

    goto LABEL_32;
  }

LABEL_15:
  v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "fileURL"));
  v20 = (void *)v33;
  if (v33)
    v34 = (id)v33;
  else
    v34 = v11;
  v15[2](v15, v34, 0, 0);
LABEL_33:

}

+ (id)convertWideGamutToClampedPhotoForURLs:(id)a3 outTmpDirectory:(id *)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  __CFString *PreferredIdentifierForTag;
  void *v14;
  const __CFURL *v15;
  CGImageSource *v16;
  CGImageSource *v17;
  const __CFString *Type;
  CGImageDestinationRef v19;
  CGImageDestination *v20;
  const __CFDictionary *v21;
  CFDictionaryRef v22;
  void *v23;
  float v24;
  float v25;
  void *v26;
  double v27;
  void *v28;
  const __CFDictionary *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  id v35;
  id v36;
  void *v38;
  uint64_t v39;
  id v40;
  const __CFURL *v41;
  id v42;
  uint8_t buf[16];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[2];
  _QWORD v49[2];
  CFStringRef v50;
  void *v51;
  _BYTE v52[128];

  v4 = a3;
  v35 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
  if (v6)
  {
    v7 = v6;
    v42 = 0;
    v8 = *(_QWORD *)v45;
    v9 = kUTTagClassFilenameExtension;
    v36 = v5;
    v39 = *(_QWORD *)v45;
    do
    {
      v10 = 0;
      v40 = v7;
      do
      {
        if (*(_QWORD *)v45 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)v10);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "pathExtension", v35));
        PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag(v9, v12, 0);
        if (SFIsImage(PreferredIdentifierForTag))
        {
          if (!v42)
          {
            v42 = (id)objc_claimAutoreleasedReturnValue(+[SDAirDropLegacyHelper tmpDirectory](SDAirDropLegacyHelper, "tmpDirectory"));
            if (a4)
            {
              v42 = objc_retainAutorelease(v42);
              *a4 = v42;
            }
          }
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
          v15 = (const __CFURL *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "URLByAppendingPathComponent:", v14));

          v16 = CGImageSourceCreateWithURL((CFURLRef)v11, 0);
          if (v16)
          {
            v17 = v16;
            Type = CGImageSourceGetType(v16);
            v41 = v15;
            v19 = CGImageDestinationCreateWithURL(v15, Type, 1uLL, 0);
            if (v19)
            {
              v20 = v19;
              v50 = kCGImageSourceShouldCache;
              v51 = &__kCFBooleanFalse;
              v21 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1));
              v22 = CGImageSourceCopyPropertiesAtIndex(v17, 0, v21);

              v38 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", kCGImagePropertyPixelWidth));
              v23 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", kCGImagePropertyPixelHeight));
              v48[0] = kCGImageDestinationOptimizeColorForSharing;
              v48[1] = kCGImageDestinationImageMaxPixelSize;
              v49[0] = &__kCFBooleanTrue;
              objc_msgSend(v38, "floatValue");
              v25 = v24;
              v26 = v23;
              objc_msgSend(v23, "floatValue");
              if (v25 >= *(float *)&v27)
                *(float *)&v27 = v25;
              v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v27));
              v49[1] = v28;
              v29 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v49, v48, 2));

              CGImageDestinationAddImageFromSource(v20, v17, 0, v29);
              LODWORD(v28) = CGImageDestinationFinalize(v20);
              CFRelease(v20);

              v5 = v36;
              CFRelease(v17);
              v15 = v41;
              if ((_DWORD)v28)
              {
                v31 = airdrop_log(v30);
                v32 = objc_claimAutoreleasedReturnValue(v31);
                if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Clamped one image", buf, 2u);
                }

                v15 = v41;
                v33 = (void *)objc_claimAutoreleasedReturnValue(+[SDAirDropLegacyHelper realPathURL:](SDAirDropLegacyHelper, "realPathURL:", v41));
                objc_msgSend(v35, "setObject:forKeyedSubscript:", v33, v11);

              }
            }
            else
            {
              CFRelease(v17);
            }
          }

          v9 = kUTTagClassFilenameExtension;
          v8 = v39;
          v7 = v40;
        }

        v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    }
    while (v7);
  }
  else
  {
    v42 = 0;
  }

  return v35;
}

+ (id)tmpDirectory
{
  NSString *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v13;
  uint8_t buf[4];
  void *v15;

  v2 = NSHomeDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v3, 1));

  v13 = 0;
  v5 = sub_10019B6D4(v4, &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v13;
  v8 = airdrop_log(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
      *(_DWORD *)buf = 138412290;
      v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "created temporary directory %@", buf, 0xCu);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    sub_10019A5A0();
  }

  return v6;
}

+ (id)preprocessItems:(id)a3 forClientBundleID:(id)a4 receiverIdentifier:(id)a5 receiverSupportsURLs:(BOOL)a6 receiverIsUnknown:(BOOL)a7
{
  id v9;
  id v10;
  void *v11;
  SDAirDropPreprocessItemsResult *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __objc2_meth_list **p_opt_class_meths;
  void *v17;
  CFTypeID v18;
  CFStringRef v19;
  CFStringRef v20;
  id v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  id v34;
  uint64_t v35;
  void *v36;
  id v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  void *v45;
  unsigned __int8 v46;
  void *v47;
  uint64_t v48;
  NSObject *v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  __SecKey *v56;
  __SecKey *v57;
  uint64_t v58;
  uint64_t v59;
  __SecKey *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  NSObject *v64;
  void *v65;
  uint64_t v66;
  NSObject *v67;
  uint64_t v68;
  NSObject *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  NSObject *v74;
  id v76;
  void *v77;
  id v78;
  _BOOL4 v79;
  _BOOL4 v80;
  id v81;
  void *v82;
  CFTypeRef cf2;
  void *v84;
  void *v85;
  uint8_t v86;
  char v87[15];
  uint8_t v88;
  char v89[15];
  uint8_t buf[4];
  id v91;

  v79 = a7;
  v80 = a6;
  v9 = a3;
  v10 = a4;
  v81 = a5;
  v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v12 = objc_alloc_init(SDAirDropPreprocessItemsResult);
  -[SDAirDropPreprocessItemsResult setSuccess:](v12, "setSuccess:", 1);
  v13 = (uint64_t)objc_msgSend(v9, "count");
  if (v13 >= 1)
  {
    v14 = v13;
    v15 = 0;
    cf2 = (CFTypeRef)kSFNodeProtocolFile;
    p_opt_class_meths = &OBJC_PROTOCOL___SDSharePointBrowserDelegate.opt_class_meths;
    while (1)
    {
      if (!-[SDAirDropPreprocessItemsResult success](v12, "success"))
        goto LABEL_78;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v15));

      v18 = CFURLGetTypeID();
      if (v18 != CFGetTypeID(v17))
      {
        v26 = objc_msgSend(v11, "addObject:", v17);
        if (v17)
        {
          objc_msgSend(v85, "addObject:", v17);
        }
        else
        {
          v32 = airdrop_log(v26);
          v33 = objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v91 = 0;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "### Could not create URL from item %@", buf, 0xCu);
          }

        }
        goto LABEL_49;
      }
      v19 = CFURLCopyScheme((CFURLRef)v17);
      if (!v19)
      {
        v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "absoluteString")));
        v28 = objc_msgSend(v27, "UTF8String");

        v30 = airdrop_log(v29);
        v31 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v91 = v28;
          _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "SDAirDropClient: splitOutFileURLs url \"%s\" has no scheme", buf, 0xCu);
        }

        -[SDAirDropPreprocessItemsResult setSuccess:](v12, "setSuccess:", 0);
        goto LABEL_49;
      }
      v20 = v19;
      if (CFEqual(v19, cf2))
      {
        v21 = v17;
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "pathExtension"));
        v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("webloc"));

        if (v23)
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[SDAirDropLegacyHelper webURLFromInternetLocationFile:](SDAirDropLegacyHelper, "webURLFromInternetLocationFile:", v21));
          if (v24)
          {
            objc_msgSend(v11, "addObject:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v24));
            if (v25)
            {
              objc_msgSend(v85, "addObject:", v25);
            }
            else
            {
              v76 = v10;
              v48 = airdrop_log(0);
              v49 = objc_claimAutoreleasedReturnValue(v48);
              if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v91 = v24;
                _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "### Could not create URL from webloc string: %@", buf, 0xCu);
              }

              v10 = v76;
            }

          }
          else
          {
            objc_msgSend(v84, "addObject:", v21);
          }

        }
        else
        {
          objc_msgSend(v84, "addObject:", v21);
        }
        p_opt_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___SDSharePointBrowserDelegate + 48);
        goto LABEL_39;
      }
      v34 = ((id (__cdecl *)())p_opt_class_meths[44])();
      v35 = objc_claimAutoreleasedReturnValue(v34);
      if (v35)
      {
        v36 = (void *)v35;
        v37 = ((id (__cdecl *)())p_opt_class_meths[44])();
        v38 = CFEqual(v20, v37);

        if (v38)
          break;
      }
      if (v80
        && (v45 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor")),
            v46 = objc_msgSend(v45, "enableWebloc"),
            v45,
            (v46 & 1) == 0))
      {
        v53 = objc_msgSend(v11, "addObject:", CFURLGetString((CFURLRef)v17));
        if (!v17)
        {
          v63 = airdrop_log(v53);
          v64 = objc_claimAutoreleasedReturnValue(v63);
          p_opt_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___SDSharePointBrowserDelegate + 48);
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v91 = 0;
            _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "### Could not create URL from item %@", buf, 0xCu);
          }

          goto LABEL_48;
        }
        objc_msgSend(v85, "addObject:", v17);
      }
      else
      {
        v47 = (void *)objc_claimAutoreleasedReturnValue(+[SDAirDropLegacyHelper internetLocationFile:](SDAirDropLegacyHelper, "internetLocationFile:", v17));
        if (v47)
        {
          objc_msgSend(v84, "addObject:", v47);
          objc_msgSend(v82, "addObject:", v47);
        }
        else
        {
          v51 = airdrop_log(0);
          v52 = objc_claimAutoreleasedReturnValue(v51);
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            sub_10019A600(&v86, v87, v52);

          -[SDAirDropPreprocessItemsResult setSuccess:](v12, "setSuccess:", 0);
        }

      }
      p_opt_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___SDSharePointBrowserDelegate + 48);
LABEL_48:
      CFRelease(v20);
LABEL_49:
      if (v14 == ++v15)
        goto LABEL_78;
    }
    v40 = airdrop_log(v39);
    v41 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Found Credential to AirDrop", buf, 2u);
    }

    v42 = SFIsAllowedAirDropCredentialClient(v10);
    p_opt_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___SDSharePointBrowserDelegate + 48);
    if ((v42 & 1) == 0)
    {
      v50 = airdrop_log(v42);
      v44 = objc_claimAutoreleasedReturnValue(v50);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v91 = v10;
        _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "### Sending credentials from %@ is not permitted", buf, 0xCu);
      }
      goto LABEL_42;
    }
    if (v79)
    {
      v43 = airdrop_log(v42);
      v44 = objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        sub_10019A634(&v88, v89, v44);
LABEL_42:

      -[SDAirDropPreprocessItemsResult setSuccess:](v12, "setSuccess:", 0);
      goto LABEL_48;
    }
    v54 = SFSharablePasswordForURL(v17);
    v55 = objc_claimAutoreleasedReturnValue(v54);
    v21 = (id)v55;
    if (v81)
    {
      v56 = +[SDAirDropLegacyHelper copyReceiverPublicKeyForIdentifier:](SDAirDropLegacyHelper, "copyReceiverPublicKeyForIdentifier:");
      if (v56
        && (v57 = v56,
            v58 = SFSharablePasswordAirDropURLEncryptedString(v21, v56),
            v59 = objc_claimAutoreleasedReturnValue(v58),
            v60 = v57,
            v61 = (void *)v59,
            CFRelease(v60),
            v61))
      {
        v56 = (__SecKey *)objc_msgSend(v61, "length");
        if (v56)
        {
          objc_msgSend(v11, "addObject:", v61);
          v77 = v61;
          v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v61));
          if (v62)
          {
            objc_msgSend(v85, "addObject:", v62);
          }
          else
          {
            v73 = airdrop_log(0);
            v74 = objc_claimAutoreleasedReturnValue(v73);
            if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v91 = v77;
              _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "### Could not create URL from credential string: %@", buf, 0xCu);
            }

            p_opt_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___SDSharePointBrowserDelegate + 48);
          }

          v71 = v77;
LABEL_72:

LABEL_39:
          goto LABEL_48;
        }
        v78 = v21;
        v65 = v61;
      }
      else
      {
        v78 = v21;
        v65 = 0;
      }
      v66 = airdrop_log(v56);
      v67 = objc_claimAutoreleasedReturnValue(v66);
      if (!os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
      {
LABEL_71:

        -[SDAirDropPreprocessItemsResult setSuccess:](v12, "setSuccess:", 0);
        v71 = v65;
        v21 = v78;
        goto LABEL_72;
      }
    }
    else
    {
      v68 = airdrop_log(v55);
      v69 = objc_claimAutoreleasedReturnValue(v68);
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "Skipping extra encrypt due to lack of identifier", buf, 2u);
      }

      v70 = SFSharablePasswordAirDropUnencryptedURL(v21);
      v71 = (void *)objc_claimAutoreleasedReturnValue(v70);
      if (v71)
      {
        objc_msgSend(v85, "addObject:", v71);
        goto LABEL_72;
      }
      v78 = v21;
      v65 = 0;
      v72 = airdrop_log(0);
      v67 = objc_claimAutoreleasedReturnValue(v72);
      if (!os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        goto LABEL_71;
    }
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "### No credential URL to AirDrop?", buf, 2u);
    goto LABEL_71;
  }
LABEL_78:
  if (-[SDAirDropPreprocessItemsResult success](v12, "success"))
  {
    -[SDAirDropPreprocessItemsResult setFiles:](v12, "setFiles:", v84);
    -[SDAirDropPreprocessItemsResult setLinks:](v12, "setLinks:", v85);
    -[SDAirDropPreprocessItemsResult setOtherStuff:](v12, "setOtherStuff:", v11);
    -[SDAirDropPreprocessItemsResult setFilesToCleanup:](v12, "setFilesToCleanup:", v82);
  }

  return v12;
}

+ (id)temporaryWeblocURL:(__CFURL *)a3
{
  CFURLRef v4;
  const __CFURL *v5;
  const __CFString *v6;
  const __CFString *v7;
  CFMutableStringRef MutableCopy;
  const __CFString *v9;
  const __CFString *v10;
  const __CFURL *v11;
  const __CFURL *v12;
  CFURLRef v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  CFRange v21;

  v4 = sub_10019BC64(0, 65537);
  if (v4)
  {
    v5 = v4;
    v6 = CFURLCopyHostName(a3);
    if (v6)
    {
      v7 = v6;
      MutableCopy = CFStringCreateMutableCopy(0, 0, v6);
      if (!CFStringHasSuffix(MutableCopy, CFSTR(".")))
        CFStringTrim(MutableCopy, CFSTR("."));
      v21.length = CFStringGetLength(MutableCopy);
      v21.location = 0;
      CFStringFindAndReplace(MutableCopy, CFSTR("."), CFSTR("-"), v21, 0);
      v9 = CFStringCreateWithFormat(0, 0, CFSTR("%@.webloc"), MutableCopy);
      if (v9)
      {
        v10 = v9;
        v11 = CFURLCreateWithFileSystemPathRelativeToBase(0, v9, kCFURLPOSIXPathStyle, 0, v5);
        if (v11)
        {
          v12 = v11;
          v13 = CFURLCopyAbsoluteURL(v11);
          CFRelease(v12);
        }
        else
        {
          v18 = airdrop_log(0);
          v19 = objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            sub_10019A6C0();

          v13 = 0;
        }
        CFRelease(v10);
      }
      else
      {
        v13 = 0;
      }
      CFRelease(MutableCopy);
      CFRelease(v7);
    }
    else
    {
      v16 = airdrop_log(0);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_10019A694();

      v13 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v14 = airdrop_log(0);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_10019A668();

    v13 = 0;
  }
  return v13;
}

+ (id)internetLocationFile:(__CFURL *)a3
{
  const __CFURL *v4;
  CFStringRef v5;
  __CFDictionary *Mutable;
  __CFWriteStream *v7;
  __CFWriteStream *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  CFErrorRef error;

  v4 = (const __CFURL *)objc_claimAutoreleasedReturnValue(+[SDAirDropLegacyHelper temporaryWeblocURL:](SDAirDropLegacyHelper, "temporaryWeblocURL:"));
  if (v4)
  {
    v5 = CFURLGetString(a3);
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(Mutable, CFSTR("URL"), v5);
    v7 = CFWriteStreamCreateWithFile(0, v4);
    if (v7)
    {
      v8 = v7;
      v9 = CFWriteStreamOpen(v7);
      if ((_DWORD)v9)
      {
        error = 0;
        if (!CFPropertyListWrite(Mutable, v8, kCFPropertyListBinaryFormat_v1_0, 0, &error))
        {
          v10 = airdrop_log(0);
          v11 = objc_claimAutoreleasedReturnValue(v10);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            sub_10019A744((uint64_t)&error, v11, v12, v13, v14, v15, v16, v17);

          CFRelease(error);
        }
        CFWriteStreamClose(v8);
      }
      else
      {
        v20 = airdrop_log(v9);
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          sub_10019A718();

      }
      CFRelease(v8);
    }
    else
    {
      v18 = airdrop_log(0);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_10019A6EC();

    }
    CFRelease(Mutable);
  }
  return v4;
}

+ (id)webURLFromInternetLocationFile:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](NSData, "dataWithContentsOfURL:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v3, 0, 0, 0));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("URL")));
  v6 = v5;
  if (v5)
    v7 = v5;

  return v6;
}

+ (__SecKey)copyReceiverPublicKeyForIdentifier:(id)a3
{
  id v3;
  void *v4;
  __SecCertificate *v5;
  uint64_t v6;
  __SecKey *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;

  v3 = a3;
  if (!v3)
  {
    v10 = airdrop_log(0);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_10019A7AC();
    goto LABEL_12;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v5 = (__SecCertificate *)objc_msgSend(v4, "copyCertificateForRealName:", v3);

  if (!v5)
  {
    v12 = airdrop_log(v6);
    v11 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_10019A7D8();
LABEL_12:

    v7 = 0;
    goto LABEL_13;
  }
  v7 = SecCertificateCopyKey(v5);
  if (!v7)
  {
    v8 = airdrop_log(0);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10019A804();

  }
  CFRelease(v5);
LABEL_13:

  return v7;
}

@end
