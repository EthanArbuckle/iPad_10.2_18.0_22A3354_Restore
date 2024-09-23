@implementation MCFontPayloadHandler

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v9;
  void *v10;
  void *v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *FontDescriptorsFromURL;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  const void *v25;
  const void *v26;
  void *v27;
  os_log_t v28;
  NSObject *v29;
  void *v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  unsigned int v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  __int128 v50;
  uint64_t v51;
  void *v52;
  NSObject *v53;
  char v54;
  NSObject *v55;
  char v57;
  NSObject *v58;
  NSObject *v59;
  uint64_t v60;
  __int128 v61;
  id obj;
  uint64_t v63;
  uint64_t v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  int v69;
  uint64_t v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  unsigned int v76;
  void *v77;
  id v78;
  id v80;
  id v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  id v86;
  id v87;
  id v88;
  CFTypeRef cf;
  _BYTE v90[128];
  void *v91;
  NSFileAttributeKey v92;
  NSFileProtectionType v93;
  uint8_t buf[4];
  _BYTE v95[18];

  v9 = a3;
  v81 = a4;
  v80 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  cf = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fontData"));

  if (!v11)
  {
    v19 = (id)objc_claimAutoreleasedReturnValue(-[MCFontPayloadHandler _errorFontInvalid](self, "_errorFontInvalid"));
    v21 = 0;
    v16 = 0;
    v22 = 0;
    v23 = 0;
    FontDescriptorsFromURL = 0;
LABEL_20:
    if (cf)
      CFRelease(cf);
    if (v19)
    {
      v28 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        v29 = v28;
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "MCVerboseDescription"));
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)v95 = v30;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Cannot install font. Error: %{public}@", buf, 0xCu);

      }
      LOBYTE(v25) = 0;
      if (a6)
        *a6 = objc_msgSend(v19, "MCCopyAsPrimaryError");
    }
    else
    {
      LOBYTE(v25) = 1;
    }
    goto LABEL_28;
  }
  v12 = NSTemporaryDirectory();
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString MCMakeUUID](NSString, "MCMakeUUID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByAppendingPathComponent:", v14));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v15));

  v17 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)v95 = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Writing font to temporary URL %{public}@", buf, 0xCu);
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fontData"));
  v88 = 0;
  objc_msgSend(v18, "writeToURL:options:error:", v16, 268435457, &v88);
  v19 = v88;

  v78 = v9;
  if (v19)
    goto LABEL_5;
  FontDescriptorsFromURL = (void *)MCCTFontManagerCreateFontDescriptorsFromURL(v16);
  if (!objc_msgSend(FontDescriptorsFromURL, "count"))
  {
    v24 = objc_claimAutoreleasedReturnValue(-[MCFontPayloadHandler _errorFontInvalid](self, "_errorFontInvalid"));
    goto LABEL_11;
  }
  if ((unint64_t)objc_msgSend(FontDescriptorsFromURL, "count") >= 2)
  {
    v24 = objc_claimAutoreleasedReturnValue(-[MCFontPayloadHandler _errorFontCollection](self, "_errorFontCollection"));
LABEL_11:
    v19 = (id)v24;
    goto LABEL_12;
  }

  v32 = MCCGDataProviderCreateWithURL(v16);
  if (!v32)
  {
    v42 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "Could not specify font as data provider.", buf, 2u);
    }
    v19 = (id)objc_claimAutoreleasedReturnValue(-[MCFontPayloadHandler _errorFontInvalid](self, "_errorFontInvalid"));
LABEL_5:
    FontDescriptorsFromURL = 0;
LABEL_12:
    v23 = 0;
    v22 = 0;
    v21 = 0;
    v25 = 0;
    v26 = 0;
LABEL_13:
    if (v16)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      objc_msgSend(v27, "removeItemAtURL:error:", v16, 0);

    }
    if (v26)
      CFRelease(v26);
    if (v25)
      CFRelease(v25);
    v9 = v78;
    goto LABEL_20;
  }
  v26 = (const void *)v32;
  v33 = MCCGFontCreateWithDataProvider();
  if (!v33)
  {
    v43 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "Could not create font for introspection.", buf, 2u);
    }
    v19 = (id)objc_claimAutoreleasedReturnValue(-[MCFontPayloadHandler _errorFontInvalid](self, "_errorFontInvalid"));
    FontDescriptorsFromURL = 0;
    v23 = 0;
    v22 = 0;
    v21 = 0;
    v25 = 0;
    goto LABEL_13;
  }
  v25 = (const void *)v33;
  v21 = (void *)MCCGFontCopyFullName();
  if (v21 || (v21 = (void *)MCCGFontCopyPostScriptName(v25)) != 0)
    objc_msgSend(v10, "setName:", v21);
  v34 = GSFontCopyPersistentPostscriptURL(v16, 0);
  if (!v34)
  {
    v44 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "Could not create persistent URL for font.", buf, 2u);
    }
    v19 = (id)objc_claimAutoreleasedReturnValue(-[MCFontPayloadHandler _errorFontInvalid](self, "_errorFontInvalid"));
    FontDescriptorsFromURL = 0;
    v23 = 0;
    v22 = 0;
    goto LABEL_13;
  }
  v22 = (void *)v34;
  objc_msgSend(v10, "setPersistentURL:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](MCDependencyManager, "sharedManager"));
  v70 = kMCDMFontURLToProfileIdentifierKey;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "parentsInDomain:"));

  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "absoluteString"));
  v37 = objc_msgSend(v23, "containsObject:", v36);

  v38 = _MCLogObjects[0];
  if (v37)
  {
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v95 = v21;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "The font “%{public}@” has already been installed. Not installing again.", buf, 0xCu);
    }
    v19 = 0;
LABEL_39:
    v74 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](MCDependencyManager, "sharedManager"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "absoluteString"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "profile"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "identifier"));
    objc_msgSend(v74, "addDependent:ofParent:inDomain:reciprocalDomain:", v39, v40, kMCDMProfileIdentifierToFontURLKey, v70);

    v41 = v74;
LABEL_56:

    FontDescriptorsFromURL = 0;
    goto LABEL_13;
  }
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)v95 = v21;
    *(_WORD *)&v95[8] = 2114;
    *(_QWORD *)&v95[10] = v22;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEBUG, "Installing font “%{public}@” to URL %{public}@", buf, 0x16u);
  }
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "path"));
  v66 = v45;
  LODWORD(v45) = objc_msgSend(v45, "fileExistsAtPath:", v46);

  if ((_DWORD)v45)
    objc_msgSend(v66, "removeItemAtURL:error:", v22, 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v87 = 0;
  objc_msgSend(v47, "copyItemAtURL:toURL:error:", v16, v22, &v87);
  v19 = v87;

  if (v19)
    goto LABEL_55;
  v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v92 = NSFileProtectionKey;
  v93 = NSFileProtectionNone;
  v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v93, &v92, 1));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "path"));
  v86 = 0;
  objc_msgSend(v75, "setAttributes:ofItemAtPath:error:", v72, v48, &v86);
  v19 = v86;

  if (v19)
  {
LABEL_55:
    v41 = v66;
    goto LABEL_56;
  }
  v91 = v22;
  GSFontRegisterPersistentURLs(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v91, 1), &cf);
  if (!cf)
  {
    v19 = 0;
    goto LABEL_84;
  }
  v49 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)v95 = cf;
    _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEBUG, "Results: %{public}@", buf, 0xCu);
  }
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  obj = (id)cf;
  v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v90, 16);
  v19 = 0;
  if (!v65)
  {
LABEL_81:

LABEL_84:
    v58 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v95 = v21;
      _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "Installed font “%{public}@”.", buf, 0xCu);
    }

    goto LABEL_39;
  }
  v64 = *(_QWORD *)v83;
  *(_QWORD *)&v50 = 67240450;
  v61 = v50;
LABEL_62:
  v51 = 0;
  while (1)
  {
    if (*(_QWORD *)v83 != v64)
      objc_enumerationMutation(obj);
    v73 = v51;
    v67 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("result"), v61));
    v76 = objc_msgSend(v52, "intValue");

    if (!v76 || v76 == 105)
    {
      v55 = _MCLogObjects[0];
      v69 = 1;
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v69 = 1;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "Successfully installed font.", buf, 2u);
      }
      v54 = 0;
    }
    else
    {
      if (v76 == 305)
      {
        v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("error")));
        v59 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)v95 = v77;
          _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "Failed to install font with 305 'Font Already Installed' error: %{public}@", buf, 0xCu);
        }
        v60 = objc_claimAutoreleasedReturnValue(-[MCFontPayloadHandler _errorFontAlreadyInstalled](self, "_errorFontAlreadyInstalled"));

        v19 = (id)v60;
        goto LABEL_55;
      }
      v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("error")));
      v53 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v61;
        *(_DWORD *)v95 = v76;
        *(_WORD *)&v95[4] = 2114;
        *(_QWORD *)&v95[6] = v68;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "Failed to install font with %{public}d error: %{public}@", buf, 0x12u);
      }
      v63 = objc_claimAutoreleasedReturnValue(-[MCFontPayloadHandler _errorFontUnknownWithUnderlyingError:](self, "_errorFontUnknownWithUnderlyingError:", v68));

      v69 = 0;
      v54 = 1;
      v19 = (id)v63;
    }
    if (v76 != 105 && v76 != 0)
      break;
    v51 = v73 + 1;
    if (v65 == (id)(v73 + 1))
    {
      v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v90, 16);
      if (v65)
        goto LABEL_62;
      goto LABEL_81;
    }
  }
  v57 = v54;

  if (v69)
    goto LABEL_84;

  FontDescriptorsFromURL = 0;
  if ((v57 & 1) != 0)
    goto LABEL_13;
  v9 = v78;
LABEL_28:

  return v25 & 1;
}

- (void)remove
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](MCDependencyManager, "sharedManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "persistentURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "absoluteString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "profile"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  objc_msgSend(v2, "removeDependent:fromParent:inDomain:reciprocalDomain:", v4, v6, kMCDMProfileIdentifierToFontURLKey, kMCDMFontURLToProfileIdentifierKey);

}

- (id)_errorFontInvalid
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = MCFontErrorDomain;
  v3 = MCErrorArray(CFSTR("FONT_ERROR_INVALID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v2, 35000, v4, MCErrorTypeFatal, 0));

  return v5;
}

- (id)_errorFontCollection
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = MCFontErrorDomain;
  v3 = MCErrorArray(CFSTR("FONT_ERROR_COLLECTION"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v2, 35002, v4, MCErrorTypeFatal, 0));

  return v5;
}

- (id)_errorFontAlreadyInstalled
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = MCFontErrorDomain;
  v3 = MCErrorArray(CFSTR("FONT_ERROR_ALREADY_INSTALLED"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v2, 35003, v4, MCErrorTypeFatal, 0));

  return v5;
}

- (id)_errorFontUnknownWithUnderlyingError:(id)a3
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = MCFontErrorDomain;
  v4 = a3;
  v5 = MCErrorArray(CFSTR("FONT_ERROR_UNKNOWN"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v3, 35001, v6, v4, MCErrorTypeFatal, 0));

  return v7;
}

@end
