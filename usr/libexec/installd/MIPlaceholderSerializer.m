@implementation MIPlaceholderSerializer

+ (BOOL)serializedPlaceholderForInstalledAppWithBundeID:(id)a3 personaUniqueString:(id)a4 atResultURL:(id)a5 onDevice:(int)a6 onBehalfOf:(id *)a7 withError:(id *)a8
{
  uint64_t v9;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  unsigned __int8 v30;
  void *v31;
  unsigned __int8 v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  unsigned int v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  FILE *v50;
  void *v51;
  void *v52;
  __int128 v53;
  unsigned __int8 v54;
  int v55;
  id v56;
  uint64_t v57;
  id v58;
  void *v59;
  id v60;
  void *v62;
  uint64_t v63;
  id v64;
  FILE *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  $115C4C562B26FF47E01F9F4EA65B5887 *v72;
  void *v73;
  BOOL v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  _OWORD v83[2];
  id v84;
  _OWORD v85[2];
  uint64_t v86;
  FILE *v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  uint64_t v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  uint64_t v101;
  _QWORD v102[5];
  _QWORD v103[5];

  v9 = *(_QWORD *)&a6;
  v12 = a3;
  v82 = a4;
  v13 = a5;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](MIFileManager, "defaultManager"));
  v101 = 0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
  v100 = 0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stagingRootForDevice:url:identifier:error:", v9, v13, &v101, &v100));
  v17 = v100;

  v78 = v13;
  v80 = v14;
  if (!v16)
  {
    v79 = 0;
    v19 = 0;
LABEL_13:
    v77 = 0;
    v81 = 0;
    v75 = 0;
    v34 = 0;
    v22 = 0;
LABEL_14:
    v35 = 0;
    v76 = 0;
    v36 = 0;
    v23 = 0;
    goto LABEL_32;
  }
  v99 = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[MIBundleContainer appBundleContainerWithIdentifier:createIfNeeded:created:error:](MIBundleContainer, "appBundleContainerWithIdentifier:createIfNeeded:created:error:", v12, 0, 0, &v99));
  v20 = v99;

  if (!v19)
  {
    v79 = 0;
    v76 = 0;
    v77 = 0;
    v81 = 0;
    v75 = 0;
    v34 = 0;
    v22 = 0;
    v35 = 0;
    v36 = 0;
    v23 = 0;
LABEL_31:
    v17 = v20;
    goto LABEL_32;
  }
  v72 = a7;
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bundle"));
  if (!v81)
  {
    v37 = sub_100010E50((uint64_t)"+[MIPlaceholderSerializer serializedPlaceholderForInstalledAppWithBundeID:personaUniqueString:atResultURL:onDevice:onBehalfOf:withError:]", 59, MIInstallerErrorDomain, 4, 0, 0, CFSTR("Failed to locate app bundle in container for %@"), v21, (uint64_t)v12);
    v17 = (id)objc_claimAutoreleasedReturnValue(v37);

    v79 = 0;
    goto LABEL_13;
  }
  v98 = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "createTemporaryDirectoryInDirectoryURL:error:", v16, &v98));
  v17 = v98;

  if (!v22)
  {
    v79 = 0;
    v77 = 0;
    v75 = 0;
    v34 = 0;
    goto LABEL_14;
  }
  v97 = v17;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "createTemporaryDirectoryInDirectoryURL:error:", v22, &v97));
  v20 = v97;

  if (!v23)
  {
    v36 = 0;
    v75 = 0;
    v76 = 0;
    v77 = 0;
    v79 = 0;
    v34 = 0;
LABEL_30:
    objc_msgSend(v80, "removeItemAtURL:error:", v22, 0);
    v35 = 0;
    goto LABEL_31;
  }
  v70 = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "URLByAppendingPathComponent:isDirectory:", CFSTR("Payload"), 1));
  v96 = v20;
  v25 = objc_msgSend(v14, "createDirectoryAtURL:withIntermediateDirectories:mode:error:", v24, 0, 493, &v96);
  v26 = v96;

  if (!v25)
  {
    v75 = 0;
    v76 = 0;
    v77 = 0;
    v79 = 0;
    v20 = v26;
    v23 = 0;
    v34 = v70;
    v36 = v24;
    goto LABEL_30;
  }
  v67 = v22;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "bundleName"));
  v66 = v24;
  v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "URLByAppendingPathComponent:isDirectory:", v27, 1));

  v69 = (void *)v28;
  if (objc_msgSend(v81, "isPlaceholder"))
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "bundleURL"));
    v95 = v26;
    v30 = objc_msgSend(v14, "copyItemAtURL:toURL:error:", v29, v28, &v95);
    v31 = v14;
    v32 = v30;
    v33 = v95;

    v79 = 0;
    v22 = v67;
    if ((v32 & 1) == 0)
    {
      v75 = 0;
      v76 = 0;
      v20 = v33;
      v77 = 0;
LABEL_29:
      v23 = v69;
      v34 = v70;
      v36 = v24;
      goto LABEL_30;
    }
  }
  else
  {
    v38 = objc_alloc((Class)MIPlaceholderConstructor);
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "bundleURL"));
    v94 = v26;
    v40 = objc_msgSend(v38, "initWithSource:byPreservingFullInfoPlist:error:", v39, 1, &v94);
    v20 = v94;

    if (!v40)
    {
      v75 = 0;
      v76 = 0;
      v77 = 0;
      v79 = 0;
      v22 = v67;
      goto LABEL_29;
    }
    v93 = v20;
    v79 = v40;
    v41 = objc_msgSend(v40, "materializeIntoBundleDirectory:error:", v69, &v93);
    v33 = v93;

    v22 = v67;
    if (!v41)
    {
      v75 = 0;
      v76 = 0;
      v77 = 0;
      v20 = v33;
      goto LABEL_29;
    }
    v31 = v14;
  }
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "containerURL"));
  v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "URLByAppendingPathComponent:isDirectory:", CFSTR("iTunesMetadata.plist"), 0));

  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "URLByAppendingPathComponent:isDirectory:", CFSTR("iTunesMetadata.plist"), 0));
  v92 = v33;
  v76 = (void *)v43;
  LODWORD(v43) = objc_msgSend(v31, "copyItemIfExistsAtURL:toURL:error:", v43, v44, &v92);
  v20 = v92;

  if (!(_DWORD)v43)
  {
    v75 = 0;
    v77 = 0;
    goto LABEL_29;
  }
  v68 = v20;
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "URLByAppendingPathComponent:isDirectory:", v45, 0));

  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "lastPathComponent"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), v47, v48));

  v49 = objc_retainAutorelease(v46);
  v50 = fopen((const char *)objc_msgSend(v49, "fileSystemRepresentation"), "wx");
  if (!v50)
  {
    v55 = *__error();
    v75 = objc_retainAutorelease(v49);
    v56 = objc_msgSend(v75, "fileSystemRepresentation");
    strerror(v55);
    v58 = sub_100010E50((uint64_t)"+[MIPlaceholderSerializer serializedPlaceholderForInstalledAppWithBundeID:personaUniqueString:atResultURL:onDevice:onBehalfOf:withError:]", 108, NSPOSIXErrorDomain, v55, 0, 0, CFSTR("Failed to create output file %s: %s"), v57, (uint64_t)v56);
    v20 = (id)objc_claimAutoreleasedReturnValue(v58);

    goto LABEL_29;
  }
  v75 = v49;
  v91 = 0;
  v89 = 0u;
  v90 = 0u;
  v86 = 0;
  v88 = 0u;
  memset(v85, 0, sizeof(v85));
  v65 = v50;
  v87 = v50;
  v102[0] = kSZArchiverOptionCompressionOptions;
  v102[1] = kSZArchiverOptionNoCache;
  v102[2] = kSZArchiverOptionZlibCompressionLevel;
  v102[3] = kSZArchiverOptionSkipPrescan;
  v103[2] = &off_10008ED90;
  v103[3] = &__kCFBooleanFalse;
  v103[0] = kSZArchiverCompressionOptionTryRecompress;
  v103[1] = &__kCFBooleanTrue;
  v102[4] = kSZArchiverOptionUncompressBloatedFiles;
  v103[4] = &__kCFBooleanTrue;
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v103, v102, 5));
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v51));

  v34 = objc_retainAutorelease(v70);
  v36 = v66;
  if ((SZArchiverCreateStreamableZip(objc_msgSend(v34, "fileSystemRepresentation"), v85, v35, 0) & 1) != 0)
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[MIHelperServiceClient sharedInstance](MIHelperServiceClient, "sharedInstance"));
    v84 = v68;
    v53 = *(_OWORD *)&v72->var0[4];
    v83[0] = *(_OWORD *)v72->var0;
    v83[1] = v53;
    v73 = v52;
    v54 = objc_msgSend(v52, "moveItemInStagingDirectory:atRelativePath:toDestinationURL:onBehalfOf:withError:", v101, v77, v78, v83, &v84);
    v17 = v84;

    v23 = v69;
  }
  else
  {
    v62 = (void *)MIInstallerErrorDomain;
    v23 = v69;
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "path"));
    v64 = sub_100010E50((uint64_t)"+[MIPlaceholderSerializer serializedPlaceholderForInstalledAppWithBundeID:personaUniqueString:atResultURL:onDevice:onBehalfOf:withError:]", 124, v62, 4, 0, 0, CFSTR("Failed to archive contents of %@"), v63, (uint64_t)v73);
    v17 = (id)objc_claimAutoreleasedReturnValue(v64);

    v54 = 0;
  }

  objc_msgSend(v80, "removeItemAtURL:error:", v22, 0);
  fclose(v65);
  if ((v54 & 1) != 0)
  {
    v74 = 1;
    goto LABEL_35;
  }
LABEL_32:
  v59 = v17;
  v60 = sub_100010E50((uint64_t)"+[MIPlaceholderSerializer serializedPlaceholderForInstalledAppWithBundeID:personaUniqueString:atResultURL:onDevice:onBehalfOf:withError:]", 146, MIInstallerErrorDomain, 175, v17, 0, CFSTR("Failed to create a serialized placeholder for %@/%@"), v18, (uint64_t)v12);
  v17 = (id)objc_claimAutoreleasedReturnValue(v60);

  if (a8)
  {
    v17 = objc_retainAutorelease(v17);
    v74 = 0;
    *a8 = v17;
  }
  else
  {
    v74 = 0;
  }
LABEL_35:

  return v74;
}

@end
