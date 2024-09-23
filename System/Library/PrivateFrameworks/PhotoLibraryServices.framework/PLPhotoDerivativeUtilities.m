@implementation PLPhotoDerivativeUtilities

+ (id)generateDerivativeForMSAsset:(id)a3 derivativeType:(int)a4 withSpecificationInfo:(id)a5 collectionGUID:(id)a6
{
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  NSObject *v23;
  NSObject *v24;
  const char *v25;
  NSObject *v26;
  os_log_type_t v27;
  uint32_t v28;
  NSObject *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  char v37;
  NSObject *v38;
  const char *v39;
  NSObject *v40;
  os_log_type_t v41;
  dispatch_semaphore_t v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  NSObject *v58;
  _QWORD *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  uint64_t v64;
  NSObject *v65;
  id v67;
  id v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  int v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  id v78;
  _QWORD v79[4];
  id v80;
  id v81;
  NSObject *v82;
  _BYTE *v83;
  uint8_t v84[4];
  void *v85;
  __int16 v86;
  id v87;
  _BYTE buf[28];
  __int16 v89;
  id v90;
  uint64_t v91;

  v8 = *(_QWORD *)&a4;
  v91 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v75 = a6;
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v8;
      *(_WORD *)&buf[18] = 2112;
      *(_QWORD *)&buf[20] = v10;
      v89 = 2112;
      v90 = v75;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEBUG, "generateDerivativeForMSAsset %@ type %i specificationInfo %@ collectionGUID %@", buf, 0x26u);
    }

  }
  objc_msgSend(v9, "path");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "metadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = *MEMORY[0x1E0D16FD0];
  objc_msgSend(v12, "objectForKey:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  v70 = *MEMORY[0x1E0D16FC8];
  objc_msgSend(v12, "objectForKey:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  v18 = v17;

  objc_msgSend(v9, "type");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D752F0], "typeWithIdentifier:", v77);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)*MEMORY[0x1E0CEC530];
  objc_msgSend(v19, "isEqual:", *MEMORY[0x1E0CEC530]);
  v21 = objc_msgSend(v19, "isEqual:", *MEMORY[0x1E0CEC4F8]);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v8)
    v22 = 0;
  else
    v22 = v21;
  v72 = v22;
  if (v15 == 0.0 || v18 == 0.0)
  {
    if (*MEMORY[0x1E0D115D0])
      goto LABEL_35;
    __CPLAssetsdOSLogDomain();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v76;
      v25 = "no width or height to generate derived asset for %@";
      v26 = v24;
      v27 = OS_LOG_TYPE_ERROR;
      v28 = 12;
LABEL_24:
      _os_log_impl(&dword_199541000, v26, v27, v25, buf, v28);
    }
LABEL_25:
    v29 = 0;
LABEL_79:

    goto LABEL_80;
  }
  PLMyPhotoStreamGetLog();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v76;
    _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_DEBUG, "derivedAssetForMasterAsset for master image at path %@", buf, 0xCu);
  }

  if ((_DWORD)v8 != 1)
  {
    if (!(_DWORD)v8)
    {
      if (v75)
      {
        +[PLPhotoSharingHelper temporaryDerivativePathForCollectionGUID:uti:](PLPhotoSharingHelper, "temporaryDerivativePathForCollectionGUID:uti:", v75, v77);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      }
      objc_msgSend(v9, "GUID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLPhotoSharingHelper temporaryDerivativePathForCollectionGUID:uti:](PLPhotoSharingHelper, "temporaryDerivativePathForCollectionGUID:uti:", v30, v77);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    }
    if (*MEMORY[0x1E0D115D0])
      goto LABEL_35;
    __CPLAssetsdOSLogDomain();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v8;
      v25 = "ERROR, unknown PLDerivativeType %i";
      v26 = v24;
      v27 = OS_LOG_TYPE_DEFAULT;
      v28 = 8;
      goto LABEL_24;
    }
    goto LABEL_25;
  }
  if (v75)
  {
    +[PLPhotoSharingHelper temporaryThumbnailPathForCollectionGUID:](PLPhotoSharingHelper, "temporaryThumbnailPathForCollectionGUID:");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }
  objc_msgSend(v9, "GUID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPhotoSharingHelper temporaryThumbnailPathForCollectionGUID:](PLPhotoSharingHelper, "temporaryThumbnailPathForCollectionGUID:", v30);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_28:

LABEL_29:
  if (v73)
  {
    objc_msgSend(v74, "removeItemAtPath:error:", v73, 0);
    +[PLPhotoSharingHelper derivedAssetSizeForMasterSizeWidth:height:derivativeType:withSpecificationInfo:](PLPhotoSharingHelper, "derivedAssetSizeForMasterSizeWidth:height:derivativeType:withSpecificationInfo:", v8, v10, v15, v18);
    v32 = v31;
    v34 = v33;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    buf[24] = 0;
    if (v72)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v76, 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v73, 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v74, "copyItemAtURL:toURL:error:", v35, v36, 0);
      *(_BYTE *)(*(_QWORD *)&buf[8] + 24) = v37;

      if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
      {
        if (*MEMORY[0x1E0D115D0])
          goto LABEL_42;
        __CPLAssetsdOSLogDomain();
        v38 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
LABEL_40:

          if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
            goto LABEL_42;
          goto LABEL_41;
        }
        *(_WORD *)v84 = 0;
        v39 = "will use copy of original JPEG that's already within size";
        v40 = v38;
        v41 = OS_LOG_TYPE_DEBUG;
LABEL_39:
        _os_log_impl(&dword_199541000, v40, v41, v39, v84, 2u);
        goto LABEL_40;
      }
      if (!*MEMORY[0x1E0D115D0])
      {
        __CPLAssetsdOSLogDomain();
        v38 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          goto LABEL_40;
        *(_WORD *)v84 = 0;
        v39 = "failed to make copy of original JPEG that's already within size";
        v40 = v38;
        v41 = OS_LOG_TYPE_ERROR;
        goto LABEL_39;
      }
    }
LABEL_41:
    v68 = v10;
    v42 = dispatch_semaphore_create(0);
    v43 = (void *)MEMORY[0x1E0D11618];
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v76, 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v73, 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v79[0] = MEMORY[0x1E0C809B0];
    v79[1] = 3221225472;
    v79[2] = __111__PLPhotoDerivativeUtilities_generateDerivativeForMSAsset_derivativeType_withSpecificationInfo_collectionGUID___block_invoke;
    v79[3] = &unk_1E366F758;
    v80 = v76;
    v81 = v73;
    v83 = buf;
    v46 = v42;
    v82 = v46;
    objc_msgSend(v43, "resizeImageAtURL:destinationURL:maximumPixelCount:bakeInOrientation:colorOutput:reason:completionHandler:", v44, v45, (uint64_t)(v32 * v34), 1, 1, CFSTR("Photo Stream full size image fallback generation"), v79);

    v10 = v68;
    dispatch_semaphore_wait(v46, 0xFFFFFFFFFFFFFFFFLL);

    if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
    {
      v48 = 0;
LABEL_78:
      v24 = v48;
      _Block_object_dispose(buf, 8);

      v29 = v24;
      goto LABEL_79;
    }
LABEL_42:
    v78 = 0;
    objc_msgSend(v74, "attributesOfItemAtPath:error:", v73, &v78);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = v78;
    if (!v47)
    {
      if (*MEMORY[0x1E0D115D0])
      {
        v48 = 0;
LABEL_77:

        goto LABEL_78;
      }
      __CPLAssetsdOSLogDomain();
      v58 = objc_claimAutoreleasedReturnValue();
      v69 = v58;
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v84 = 138412546;
        v85 = v73;
        v86 = 2112;
        v87 = v67;
        _os_log_impl(&dword_199541000, v58, OS_LOG_TYPE_ERROR, "Couldn't read attributes for file %@ : %@", v84, 0x16u);
      }
      v48 = 0;
LABEL_73:

      if (!*MEMORY[0x1E0D115D0])
      {
        __CPLAssetsdOSLogDomain();
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v84 = 138412546;
          v85 = v73;
          v86 = 2112;
          v87 = v48;
          _os_log_impl(&dword_199541000, v65, OS_LOG_TYPE_DEBUG, "generated derived asset at path %@ : %@", v84, 0x16u);
        }

      }
      goto LABEL_77;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v47, "fileSize"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_alloc_init(MEMORY[0x1E0D16C70]);
    objc_msgSend(v9, "fileHash");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setMasterAssetHash:", v49);

    objc_msgSend(v48, "setPath:", v73);
    v50 = v77;
    if ((v72 & 1) == 0)
    {
      objc_msgSend(v20, "identifier");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v48, "setType:", v50);
    if ((v72 & 1) == 0)

    v51 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v51, "setObject:forKey:", v69, *MEMORY[0x1E0D16FC0]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v32);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setObject:forKey:", v52, v71);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v34);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setObject:forKey:", v53, v70);

    objc_msgSend(v48, "setMetadata:", v51);
    if (!v10)
    {
      if ((_DWORD)v8)
      {
        objc_msgSend(v48, "setMediaAssetType:", 2);
        v59 = (_QWORD *)MEMORY[0x1E0D16FB8];
      }
      else
      {
        objc_msgSend(v48, "setMediaAssetType:", 3);
        v59 = (_QWORD *)MEMORY[0x1E0D16FB0];
      }
      objc_msgSend(v51, "setObject:forKey:", *v59, *MEMORY[0x1E0D16FA8]);
      goto LABEL_72;
    }
    v54 = *MEMORY[0x1E0D16FA8];
    objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0D16FA8]);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v55;
    if (!v55)
    {
LABEL_62:
      v60 = v48;
      v61 = *MEMORY[0x1E0D16FA0];
      objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0D16FA0]);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v62;
      if (!v62)
      {
LABEL_69:

        v48 = v60;
LABEL_72:

        goto LABEL_73;
      }
      if ((objc_msgSend(v62, "intValue") & 1) != 0)
      {
        v64 = 2;
      }
      else
      {
        if ((objc_msgSend(v63, "intValue") & 2) == 0)
        {
LABEL_68:
          objc_msgSend(v51, "setObject:forKey:", v63, v61);
          goto LABEL_69;
        }
        v64 = 3;
      }
      objc_msgSend(v60, "setMediaAssetType:", v64);
      goto LABEL_68;
    }
    if ((objc_msgSend(v55, "isEqualToString:", *MEMORY[0x1E0D16FB8]) & 1) != 0)
    {
      v57 = 2;
    }
    else
    {
      if (!objc_msgSend(v56, "isEqualToString:", *MEMORY[0x1E0D16FB0]))
      {
LABEL_61:
        objc_msgSend(v51, "setObject:forKey:", v56, v54);
        goto LABEL_62;
      }
      v57 = 3;
    }
    objc_msgSend(v48, "setMediaAssetType:", v57);
    goto LABEL_61;
  }
LABEL_35:
  v29 = 0;
LABEL_80:

  return v29;
}

void __111__PLPhotoDerivativeUtilities_generateDerivativeForMSAsset_derivativeType_withSpecificationInfo_collectionGUID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = *(_QWORD *)(a1 + 32);
        v9 = *(_QWORD *)(a1 + 40);
        v10 = 138412802;
        v11 = v8;
        v12 = 2112;
        v13 = v9;
        v14 = 2112;
        v15 = v6;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "failed to resize %@ to %@: %@", (uint8_t *)&v10, 0x20u);
      }

    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

@end
