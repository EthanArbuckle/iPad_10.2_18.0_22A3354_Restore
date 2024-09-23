@implementation MBManateePlugin

- (id)_standardizePath:(id)a3 fromDomain:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  uint64_t v12;
  void *v14;
  void *v15;

  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "stringByStandardizingPath"));
  if (objc_msgSend(v8, "isAbsolutePath"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rootPath"));
    v10 = objc_msgSend(v8, "hasPrefix:", v9);

    if ((v10 & 1) == 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rootPath"));
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBManateePlugin.m"), 33, CFSTR("Absolute path doesn't have domain root %@ as prefix: %@"), v15, v8);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rootPath"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "substringFromIndex:", (char *)objc_msgSend(v11, "length") + 1));

    v8 = (void *)v12;
  }

  return v8;
}

- (id)startingBackupWithEngine:(id)a3
{
  id v3;
  unsigned __int8 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSMutableSet *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  _UNKNOWN **v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  unsigned int v34;
  void *v35;
  unsigned __int8 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  _BOOL4 v41;
  id v42;
  id v43;
  uint64_t v44;
  void *j;
  void *v46;
  id v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  NSObject *v52;
  id v53;
  id v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  NSObject *v61;
  void *v62;
  id v63;
  id v65;
  id obj;
  uint64_t v67;
  id v68;
  void *v69;
  void *v70;
  id v71;
  uint64_t v72;
  id v73;
  uint64_t v74;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  id v96;
  char v97;
  _BYTE v98[128];
  uint8_t v99[128];
  uint8_t buf[4];
  void *v101;
  __int16 v102;
  void *v103;
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE v106[128];

  v3 = a3;
  if (objc_msgSend(v3, "backsUpPrimaryAccount"))
  {
    v97 = 0;
    if (objc_msgSend(v3, "isCloudKitEngine"))
    {
      v96 = 0;
      v4 = objc_msgSend(v3, "fetchDeviceToDeviceEncryptionSupportedByAccount:error:", &v97, &v96);
      v5 = v96;
      if ((v4 & 1) == 0)
      {
        v63 = v5;
        v6 = v63;
LABEL_79:

        goto LABEL_80;
      }
      v65 = v5;
    }
    else
    {
      v65 = 0;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domainManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allDomains"));

    v94 = 0u;
    v95 = 0u;
    v92 = 0u;
    v93 = 0u;
    obj = v8;
    v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v106, 16);
    if (v68)
    {
      v67 = *(_QWORD *)v93;
      v70 = v3;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v93 != v67)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * (_QWORD)v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "relativePathsToBackupToDriveAndStandardAccount"));

          if (v11)
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "relativePathsToBackupToDriveAndStandardAccount"));
            v13 = objc_msgSend(v12, "mutableCopy");

            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "relativePathsToBackupAndRestore"));
            v69 = v9;
            if (v14)
            {
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "relativePathsToBackupAndRestore"));
              v16 = (NSMutableSet *)objc_msgSend(v15, "mutableCopy");

            }
            else
            {
              v16 = objc_opt_new(NSMutableSet);
            }
            v90 = 0u;
            v91 = 0u;
            v88 = 0u;
            v89 = 0u;
            v17 = v13;
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v88, v105, 16);
            if (v18)
            {
              v19 = v18;
              v20 = *(_QWORD *)v89;
              do
              {
                for (i = 0; i != v19; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v89 != v20)
                    objc_enumerationMutation(v17);
                  v22 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * (_QWORD)i);
                  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MBManateePlugin _standardizePath:fromDomain:](self, "_standardizePath:fromDomain:", v22, v10));
                  v24 = -[NSMutableSet containsObject:](v16, "containsObject:", v23);
                  if ((_DWORD)v24)
                  {
                    v26 = MBGetDefaultLog(v24, v25);
                    v27 = objc_claimAutoreleasedReturnValue(v26);
                    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412290;
                      v101 = v22;
                      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Removing manatee path: %@", buf, 0xCu);
                      _MBLog(CFSTR("INFO"), "Removing manatee path: %@", v22);
                    }

                    -[NSMutableSet removeObject:](v16, "removeObject:", v23);
                  }

                }
                v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v88, v105, 16);
              }
              while (v19);
            }

            v3 = v70;
            if (objc_msgSend(v70, "isCloudKitEngine"))
            {
              if (qword_1000F9E58 != -1)
                dispatch_once(&qword_1000F9E58, &stru_1000D9F78);
              v28 = &AnalyticsSendEventLazy_ptr;
              v29 = (id)qword_1000F9E50;
              v84 = 0u;
              v85 = 0u;
              v86 = 0u;
              v87 = 0u;
              v73 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v84, v104, 16);
              if (v73)
              {
                v30 = *(_QWORD *)v85;
                v71 = v29;
                v72 = *(_QWORD *)v85;
                do
                {
                  v31 = 0;
                  do
                  {
                    if (*(_QWORD *)v85 != v30)
                      objc_enumerationMutation(v29);
                    v74 = v31;
                    v32 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * v31);
                    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "rootPath"));
                    v34 = objc_msgSend(v32, "hasPrefix:", v33);

                    if (v34)
                    {
                      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28[211], "defaultManager"));
                      v36 = objc_msgSend(v35, "fileExistsAtPath:", v32);

                      v39 = MBGetDefaultLog(v37, v38);
                      v40 = objc_claimAutoreleasedReturnValue(v39);
                      v41 = os_log_type_enabled(v40, OS_LOG_TYPE_INFO);
                      if ((v36 & 1) != 0)
                      {
                        if (v41)
                        {
                          *(_DWORD *)buf = 138412546;
                          v101 = v10;
                          v102 = 2112;
                          v103 = v32;
                          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "Marker found for %@ at %@", buf, 0x16u);
                          _MBLog(CFSTR("INFO"), "Marker found for %@ at %@", v10, v32);
                        }

                        v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", v32));
                        v80 = 0u;
                        v81 = 0u;
                        v82 = 0u;
                        v83 = 0u;
                        v42 = -[NSObject countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v80, v99, 16);
                        if (v42)
                        {
                          v43 = v42;
                          v44 = *(_QWORD *)v81;
                          do
                          {
                            for (j = 0; j != v43; j = (char *)j + 1)
                            {
                              if (*(_QWORD *)v81 != v44)
                                objc_enumerationMutation(v40);
                              v46 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * (_QWORD)j);
                              v47 = objc_msgSend(v17, "containsObject:", v46);
                              v48 = (char)v47;
                              v50 = MBGetDefaultLog(v47, v49);
                              v51 = objc_claimAutoreleasedReturnValue(v50);
                              v52 = v51;
                              if ((v48 & 1) != 0)
                              {
                                if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
                                {
                                  *(_DWORD *)buf = 138412290;
                                  v101 = v46;
                                  _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "Adding manatee path (marker detected): %@", buf, 0xCu);
                                  _MBLog(CFSTR("INFO"), "Adding manatee path (marker detected): %@", v46);
                                }

                                v52 = objc_claimAutoreleasedReturnValue(-[MBManateePlugin _standardizePath:fromDomain:](self, "_standardizePath:fromDomain:", v46, v10));
                                -[NSMutableSet addObject:](v16, "addObject:", v52);
                                objc_msgSend(v17, "removeObject:", v52);
                              }
                              else if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
                              {
                                *(_DWORD *)buf = 138412290;
                                v101 = v46;
                                _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "Domains plist does not contain path found in hardcoded manatee exclusion list: %@", buf, 0xCu);
                                _MBLog(CFSTR("ERROR"), "Domains plist does not contain path found in hardcoded manatee exclusion list: %@", v46);
                              }

                            }
                            v43 = -[NSObject countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v80, v99, 16);
                          }
                          while (v43);
                          v28 = &AnalyticsSendEventLazy_ptr;
                          v29 = v71;
                        }
                      }
                      else if (v41)
                      {
                        *(_DWORD *)buf = 138412546;
                        v101 = v10;
                        v102 = 2112;
                        v103 = v32;
                        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "Marker not found for %@ at %@", buf, 0x16u);
                        _MBLog(CFSTR("INFO"), "Marker not found for %@ at %@", v10, v32);
                      }
                      v30 = v72;

                    }
                    v31 = v74 + 1;
                  }
                  while ((id)(v74 + 1) != v73);
                  v73 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v84, v104, 16);
                }
                while (v73);
              }

              v3 = v70;
            }
            if ((objc_msgSend(v3, "isDeviceTransferEngine") & 1) != 0
              || objc_msgSend(v3, "isDriveEngine")
              && (objc_msgSend(v3, "encrypted") & 1) != 0
              || objc_msgSend(v3, "isCloudKitEngine") && !v97)
            {
              v78 = 0u;
              v79 = 0u;
              v76 = 0u;
              v77 = 0u;
              v53 = v17;
              v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v76, v98, 16);
              if (v54)
              {
                v56 = v54;
                v57 = *(_QWORD *)v77;
                do
                {
                  v58 = 0;
                  do
                  {
                    if (*(_QWORD *)v77 != v57)
                      objc_enumerationMutation(v53);
                    v59 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * (_QWORD)v58);
                    v60 = MBGetDefaultLog(v54, v55);
                    v61 = objc_claimAutoreleasedReturnValue(v60);
                    if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412290;
                      v101 = v59;
                      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_INFO, "Adding manatee path: %@", buf, 0xCu);
                      _MBLog(CFSTR("INFO"), "Adding manatee path: %@", v59);
                    }

                    v62 = (void *)objc_claimAutoreleasedReturnValue(-[MBManateePlugin _standardizePath:fromDomain:](self, "_standardizePath:fromDomain:", v59, v10));
                    -[NSMutableSet addObject:](v16, "addObject:", v62);

                    v58 = (char *)v58 + 1;
                  }
                  while (v56 != v58);
                  v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v76, v98, 16);
                  v56 = v54;
                }
                while (v54);
              }

              v3 = v70;
            }
            objc_msgSend(v10, "setRelativePathsToBackupAndRestore:", v16);

            v9 = v69;
          }
          v9 = (char *)v9 + 1;
        }
        while (v9 != v68);
        v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v106, 16);
      }
      while (v68);
    }

    v6 = 0;
    v63 = v65;
    goto LABEL_79;
  }
  v6 = 0;
LABEL_80:

  return v6;
}

@end
