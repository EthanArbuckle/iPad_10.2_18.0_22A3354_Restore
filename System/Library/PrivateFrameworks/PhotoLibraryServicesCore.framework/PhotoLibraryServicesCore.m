uint64_t PLPlatformPhotosAccessLoggingSupported()
{
  return 1;
}

id PLImageManagerGetLog()
{
  if (PLImageManagerGetLog_predicate != -1)
    dispatch_once(&PLImageManagerGetLog_predicate, &__block_literal_global_44);
  return (id)PLImageManagerGetLog_log;
}

BOOL PLIsForegroundApplication()
{
  return qos_class_main() == QOS_CLASS_USER_INTERACTIVE;
}

CFStringRef DCIM_NSStringFromCGSize(double a1, double a2)
{
  return (id)CFStringCreateWithFormat(0, 0, CFSTR("{%.*g, %.*g}"), 17, *(_QWORD *)&a1, 17, *(_QWORD *)&a2);
}

uint64_t DCIM_newPLImageWithCGImage(uint64_t a1, uint64_t a2, double a3)
{
  return objc_msgSend(objc_alloc(NSClassFromString((NSString *)CFSTR("UIImage"))), "initWithCGImage:scale:orientation:", a1, a2, a3);
}

uint64_t PUTIsPersistentURL(void *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = (void *)MEMORY[0x19AEC2E4C]();
  objc_msgSend(a1, "scheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("assets-library")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("ipod-library"));

  objc_autoreleasePoolPop(v2);
  return v4;
}

void pl_dispatch_async(NSObject *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __pl_dispatch_async_block_invoke;
  block[3] = &unk_1E376C0E0;
  v6 = v3;
  v4 = v3;
  dispatch_async(a1, block);

}

void __pl_dispatch_sync_block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x19AEC2E4C]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

uint64_t PLIsAssetsd()
{
  pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_42_3368);
  return (PLIsReallyAssetsd_isAssetsd != 0) | __PLIsAssetsdProxyService & 1u;
}

BOOL PLIsLimitedLibraryClient()
{
  _BOOL8 v0;
  void *v1;
  uint64_t v2;

  pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_42_3368);
  v0 = 0;
  if (!PLIsReallyAssetsd_isAssetsd && (__PLIsAssetsdProxyService & 1) == 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&PLIsLimitedLibraryClient_lock);
    if ((PLIsLimitedLibraryClient_didResolveKnownAllowedResult & 1) == 0)
    {
      +[PLPrivacy sharedInstance](PLPrivacy, "sharedInstance");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = objc_msgSend(v1, "photosAccessAllowedWithScope:", 7);

      if (v2 != 1)
      {
        PLIsLimitedLibraryClient_didResolveKnownAllowedResult = 1;
        PLIsLimitedLibraryClient_limitedLibraryMode = PLIsAllowedResultEffectivelyLimited(v2);
      }
    }
    v0 = PLIsLimitedLibraryClient_limitedLibraryMode != 0;
    os_unfair_lock_unlock((os_unfair_lock_t)&PLIsLimitedLibraryClient_lock);
  }
  return v0;
}

void PLPrivacyAccountingLogPhotosAccess(_OWORD *a1)
{
  void *v1;
  __int128 v2;
  void *v3;
  void *v4;
  _OWORD v5[2];

  v1 = (void *)*MEMORY[0x1E0DB1188];
  v2 = a1[1];
  v5[0] = *a1;
  v5[1] = v2;
  objc_msgSend(MEMORY[0x1E0D80C80], "accessWithAuditToken:forService:", v5, v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D80C48], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "log:", v3);

}

void sub_199DF9E04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id PLPhotoKitGetLog()
{
  if (PLPhotoKitGetLog_predicate != -1)
    dispatch_once(&PLPhotoKitGetLog_predicate, &__block_literal_global_70);
  return (id)PLPhotoKitGetLog_log;
}

void pl_dispatch_sync(NSObject *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __pl_dispatch_sync_block_invoke;
  block[3] = &unk_1E376C0E0;
  v6 = v3;
  v4 = v3;
  dispatch_sync(a1, block);

}

void pl_dispatch_barrier_sync(NSObject *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __pl_dispatch_barrier_sync_block_invoke;
  block[3] = &unk_1E376C0E0;
  v6 = v3;
  v4 = v3;
  dispatch_barrier_sync(a1, block);

}

void sub_199DFA160(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199DFA4D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

id PLUnderlyingErrorThatHasDomainAndCode(void *a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  if (!a2)
    return 0;
  v14 = a2;
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a2;
  v7 = a1;
  objc_msgSend(v5, "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  PLUnderlyingErrorThatMatchesCodesByDomain(v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id PLUnderlyingErrorThatMatchesCodesByDomain(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v17;

  v3 = a1;
  v4 = a2;
  v5 = v3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("*"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v5;
  if (v5)
  {
    v7 = 0;
    v8 = *MEMORY[0x1E0CB3388];
    do
    {
      objc_msgSend(v5, "domain");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "code"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "containsObject:", v11) & 1) != 0
        || objc_msgSend(v10, "containsObject:", v11))
      {
        v5 = v5;
        v12 = v5;
      }
      else
      {
        objc_msgSend(v5, "userInfo");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v8);
        v14 = objc_claimAutoreleasedReturnValue();

        v12 = 0;
        ++v7;
        v5 = (id)v14;
      }

    }
    while (v5 && !v12 && v7 < 10);
  }
  else
  {
    v12 = 0;
  }
  v15 = v12;

  return v15;
}

id PLDCIMURLForResourceProperties(uint64_t a1, uint64_t a2, unsigned int a3, int a4, void *a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  unsigned int v24;
  unsigned int v25;
  void *v26;
  id v27;
  NSObject *v28;
  const char *v29;
  uint8_t *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  uint64_t v37;
  BOOL v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  __CFString *v49;
  const __CFString *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  void *v65;
  uint8_t buf[2];
  __int16 v69;
  __int16 v70;

  v17 = a5;
  v18 = a6;
  v19 = v18;
  if (!v18)
  {
    v27 = v17;
    PLBackendGetLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v70 = 0;
    v29 = "PLDCIMURLForResourceProperties: assetDirectory is NULL";
    v30 = (uint8_t *)&v70;
LABEL_13:
    _os_log_impl(&dword_199DF7000, v28, OS_LOG_TYPE_DEFAULT, v29, v30, 2u);
    goto LABEL_14;
  }
  if (!v17)
  {
    v27 = 0;
    PLBackendGetLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v69 = 0;
    v29 = "PLDCIMURLForResourceProperties: assetFilename is NULL";
    v30 = (uint8_t *)&v69;
    goto LABEL_13;
  }
  if (!a1)
  {
    v27 = v17;
    PLBackendGetLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v29 = "PLDCIMURLForResourceProperties: extension is NULL";
      v30 = buf;
      goto LABEL_13;
    }
LABEL_14:

    v31 = 0;
    v26 = v27;
    goto LABEL_15;
  }
  v62 = a1;
  v64 = v18;
  objc_msgSend(v17, "stringByDeletingPathExtension");
  v20 = v17;
  v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v63 = objc_msgSend(v21, "UTF8String");

  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 128);
  v23 = v22;
  v24 = a3;
  v25 = HIWORD(a3);
  v65 = v20;
  if (HIWORD(a3) != 4)
  {
    if (a3 == 65749)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a12);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "stringByDeletingLastPathComponent");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "stringByAppendingPathComponent:", CFSTR("VideoKeyFrames"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = v64;
      v26 = v65;
      objc_msgSend(v23, "appendFormat:", CFSTR("%@/%@/%@/"), v35, v64, v65);

      v36 = CFSTR("LocalVideoKeyFrame.jpg");
LABEL_37:
      objc_msgSend(v23, "appendFormat:", v36, v56, v58, v59);
      goto LABEL_38;
    }
    v19 = v64;
    if (a4 == 14)
    {
      objc_msgSend(v22, "appendFormat:", CFSTR("%s/%@/%s/"), a11, v64, v63, v61);
    }
    else if ((a2 - 1) < 2)
    {
      objc_msgSend(v22, "appendFormat:", CFSTR("%s/%@/%s/%@/"), a9, v64, v63, CFSTR("Adjustments"));
    }
    else
    {
      if ((_DWORD)a2 && (_DWORD)a2 != 3)
      {
LABEL_28:
        if (v24)
        {
          if (v25 == 1)
          {
            v26 = v65;
            switch(v24)
            {
              case 0x10191u:
                v39 = CFSTR("SubstandardFullSizeRender.jpg");
                goto LABEL_91;
              case 0x10192u:
                if ((_DWORD)a2 == 1)
                {
                  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSURL * _Nullable PLDCIMURLForResourceProperties(const char * _Nonnull, PLResourceVersion, PLResourceRecipeID, PLResourceType, NSString *__strong _Nonnull, NSString *__strong _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull)");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "handleFailureInFunction:file:lineNumber:description:", v54, CFSTR("PLPhotoLibraryPathManagerDCIM.m"), 1070, CFSTR("DCIM layout does not support penultimate image resources with a receipID set."));

                }
                objc_msgSend(v23, "appendFormat:", CFSTR("FullSizeRender.%s"), v62, v57, v59);
                goto LABEL_38;
              case 0x10193u:
              case 0x10194u:
              case 0x10196u:
              case 0x10199u:
              case 0x1019Bu:
              case 0x1019Du:
              case 0x1019Eu:
                goto LABEL_38;
              case 0x10195u:
                v39 = CFSTR("AsyncRenderPreview.JPG");
                goto LABEL_91;
              case 0x10197u:
LABEL_69:
                v49 = CFSTR("D");
                goto LABEL_93;
              case 0x10198u:
LABEL_36:
                v56 = v63;
                v58 = v62;
                v36 = CFSTR("%s.%s");
                goto LABEL_37;
              case 0x1019Au:
LABEL_49:
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v63);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                +[PLPhotoLibraryPathManagerCore basenameForSpatialOverCaptureFromOriginalBasename:](PLPhotoLibraryPathManagerCore, "basenameForSpatialOverCaptureFromOriginalBasename:", v40);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v62);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "appendFormat:", CFSTR("%@.%@"), v41, v42);

                goto LABEL_38;
              case 0x1019Cu:
                v39 = CFSTR("VideoPosterFramePreview.jpg");
LABEL_91:
                objc_msgSend(v23, "appendString:", v39);
                break;
              case 0x1019Fu:
                v49 = CFSTR("X");
LABEL_93:
                objc_msgSend(v23, "appendFormat:", CFSTR("%s%s.%s"), v63, -[__CFString UTF8String](v49, "UTF8String"), v62);
                break;
              default:
                v26 = v65;
                switch(v24)
                {
                  case 0x100C9u:
                    objc_msgSend(v23, "appendFormat:", CFSTR("%s.full.JPG"), v63, v57, v59);
                    break;
                  case 0x100CAu:
                  case 0x100CCu:
                  case 0x100CEu:
                  case 0x100D0u:
                  case 0x100D2u:
                    goto LABEL_38;
                  case 0x100CBu:
                    objc_msgSend(v23, "appendFormat:", CFSTR("%s.large.JPG"), v63, v57, v59);
                    break;
                  case 0x100CDu:
                    objc_msgSend(v23, "appendFormat:", CFSTR("%s.JPG"), v63, v57, v59);
                    break;
                  case 0x100CFu:
                    objc_msgSend(v23, "appendFormat:", CFSTR("%s.medium.JPG"), v63, v57, v59);
                    break;
                  case 0x100D1u:
                    objc_msgSend(v23, "appendFormat:", CFSTR("%s_sRGB.JPG"), v63, v57, v59);
                    break;
                  case 0x100D3u:
                    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSURL * _Nullable PLDCIMURLForResourceProperties(const char * _Nonnull, PLResourceVersion, PLResourceRecipeID, PLResourceType, NSString *__strong _Nonnull, NSString *__strong _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull)");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    v45 = CFSTR("DCIM layout does not support PLImageRecipeID_Pri_SourceColorSpace_1K.");
                    v46 = v43;
                    v47 = v44;
                    v48 = 1107;
LABEL_99:
                    objc_msgSend(v46, "handleFailureInFunction:file:lineNumber:description:", v47, CFSTR("PLPhotoLibraryPathManagerDCIM.m"), v48, v45, v55);
                    goto LABEL_100;
                  default:
                    if (v24 == 66137)
                      objc_msgSend(v23, "appendFormat:", CFSTR("Alchemist.%s"), v62, v57, v59);
                    break;
                }
                break;
            }
          }
          else if (v25 == 2)
          {
            v26 = v65;
            switch(v24)
            {
              case 0x20000u:
                if ((_DWORD)a2 == 1)
                {
                  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSURL * _Nullable PLDCIMURLForResourceProperties(const char * _Nonnull, PLResourceVersion, PLResourceRecipeID, PLResourceType, NSString *__strong _Nonnull, NSString *__strong _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull)");
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v51, "handleFailureInFunction:file:lineNumber:description:", v52, CFSTR("PLPhotoLibraryPathManagerDCIM.m"), 1132, CFSTR("DCIM layout does not support penultimate video resources with a receipID set."));

                }
                goto LABEL_57;
              case 0x20001u:
              case 0x20002u:
              case 0x20004u:
              case 0x20006u:
              case 0x20008u:
                goto LABEL_38;
              case 0x20003u:
LABEL_57:
                v39 = CFSTR("FullSizeRender.mov");
                goto LABEL_91;
              case 0x20005u:
                v50 = CFSTR("large.MOV");
                goto LABEL_85;
              case 0x20007u:
                v50 = CFSTR("medium.MP4");
                goto LABEL_85;
              case 0x20009u:
                v50 = CFSTR("small.MP4");
                goto LABEL_85;
              default:
                v26 = v65;
                switch(v24)
                {
                  case 0x200C8u:
                    if ((_DWORD)a2 == 1)
                      v39 = CFSTR("PenultimateFullSizeRender.mov");
                    else
                      v39 = CFSTR("FullSizeRender.mov");
                    goto LABEL_91;
                  case 0x200C9u:
                  case 0x200CAu:
                  case 0x200CCu:
                  case 0x200CEu:
                    goto LABEL_38;
                  case 0x200CBu:
                    v50 = CFSTR("medium.MOV");
                    break;
                  case 0x200CDu:
                    v50 = CFSTR("small.MOV");
                    break;
                  case 0x200CFu:
                    goto LABEL_69;
                  case 0x200D0u:
                    goto LABEL_36;
                  default:
                    if (v24 != 131475)
                      goto LABEL_38;
                    v50 = CFSTR("medium-hdr.MOV");
                    break;
                }
LABEL_85:
                objc_msgSend(v23, "appendFormat:", CFSTR("%s.%@"), v63, v50, v59);
                break;
            }
          }
          else
          {
            v38 = v25 == 5;
            v26 = v65;
            if (v38)
            {
              v31 = 0;
              switch(v24)
              {
                case 0x50003u:
                  objc_msgSend(v23, "appendFormat:", CFSTR("%s.media.dat"), v63, v57, v59);
                  goto LABEL_38;
                case 0x50005u:
                  goto LABEL_40;
                case 0x50007u:
                  v39 = CFSTR("WallpaperComputeResources.dat");
                  goto LABEL_91;
                case 0x50009u:
                  v39 = CFSTR("ComputeSyncWrapper.dat");
                  goto LABEL_91;
                case 0x5000Bu:
                  v39 = CFSTR("ComputeSyncMediaAnalysisPayload.dat");
                  goto LABEL_91;
                case 0x5000Du:
                  v39 = CFSTR("GenerativePlaygroundFaceResources.dat");
                  goto LABEL_91;
                default:
                  goto LABEL_38;
              }
            }
          }
          goto LABEL_38;
        }
        goto LABEL_35;
      }
      v37 = a7;
      if (((a3 != 131279) & a3 & ((a3 & 0xFFFFFFF7) != 65943)) != 0)
        v37 = a10;
      objc_msgSend(v22, "appendFormat:", CFSTR("%s/%@/"), v37, v64, v59, v61);
    }
    v24 = a3;
    goto LABEL_28;
  }
  v60 = v20;
  v19 = v64;
  objc_msgSend(v22, "appendFormat:", CFSTR("%s/%@/%@/"), a12, v64, v60);
  if (!a3)
  {
LABEL_35:
    v26 = v65;
    switch(a4)
    {
      case 0:
        if ((_DWORD)a2 != 1)
          goto LABEL_36;
        objc_msgSend(v23, "appendFormat:", CFSTR("PenultimateFullSizeRender.%s"), v62, v57, v59);
        goto LABEL_38;
      case 1:
      case 3:
        if ((_DWORD)a2 != 1)
          goto LABEL_36;
        v39 = CFSTR("PenultimateFullSizeRender.mov");
        goto LABEL_91;
      case 2:
      case 4:
      case 5:
      case 12:
      case 31:
        goto LABEL_36;
      case 6:
        if (!(_DWORD)a2)
        {
          objc_msgSend(v23, "appendFormat:", CFSTR("%s.data"), v63, v57, v59);
          goto LABEL_38;
        }
        if ((_DWORD)a2 == 2)
        {
          v39 = CFSTR("Adjustments.data");
          goto LABEL_91;
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSURL * _Nullable PLDCIMURLForResourceProperties(const char * _Nonnull, PLResourceVersion, PLResourceRecipeID, PLResourceType, NSString *__strong _Nonnull, NSString *__strong _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull)");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", v44, CFSTR("PLPhotoLibraryPathManagerDCIM.m"), 1008, CFSTR("Unexpected resource version (%d) for adjustment resource data (PLResourceTypeAdjustmentData)."), a2);
        break;
      case 7:
        v39 = CFSTR("AdjustmentsSecondary.data");
        goto LABEL_91;
      case 8:
        v39 = CFSTR("Adjustments.plist");
        goto LABEL_91;
      case 9:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSURL * _Nullable PLDCIMURLForResourceProperties(const char * _Nonnull, PLResourceVersion, PLResourceRecipeID, PLResourceType, NSString *__strong _Nonnull, NSString *__strong _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull)");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = CFSTR("Resource with type PLResourceTypeMediaMetadata must have a recipeID set.");
        v46 = v43;
        v47 = v44;
        v48 = 1016;
        goto LABEL_99;
      case 10:
      case 11:
        goto LABEL_49;
      case 13:
        objc_msgSend(v23, "appendFormat:", CFSTR("%s%@.%@"), v63, CFSTR("videometadata"), CFSTR("mov"));
        goto LABEL_38;
      case 14:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSURL * _Nullable PLDCIMURLForResourceProperties(const char * _Nonnull, PLResourceVersion, PLResourceRecipeID, PLResourceType, NSString *__strong _Nonnull, NSString *__strong _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull)");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = CFSTR("Resource with type PLResourceTypeCompute must have a recipeID set.");
        v46 = v43;
        v47 = v44;
        v48 = 1022;
        goto LABEL_99;
      case 15:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSURL * _Nullable PLDCIMURLForResourceProperties(const char * _Nonnull, PLResourceVersion, PLResourceRecipeID, PLResourceType, NSString *__strong _Nonnull, NSString *__strong _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull)");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = CFSTR("Resource with type PLResourceTypeAdjustmentSuggestionImage must have a recipeID set.");
        v46 = v43;
        v47 = v44;
        v48 = 1025;
        goto LABEL_99;
      default:
        goto LABEL_38;
    }
LABEL_100:

    goto LABEL_38;
  }
  objc_msgSend(v23, "appendFormat:", CFSTR("%s"), a13);
  v26 = v65;
LABEL_38:
  if (v23)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v23, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_40:

  }
  else
  {
    v31 = 0;
  }
LABEL_15:

  return v31;
}

void PLRunWithUnfairLock(os_unfair_lock_s *a1, void *a2)
{
  void (**v3)(_QWORD);

  v3 = a2;
  os_unfair_lock_lock(a1);
  v3[2](v3);

  os_unfair_lock_unlock(a1);
}

void pl_dispatch_once(dispatch_once_t *a1, void *a2)
{
  id v3;
  dispatch_once_t v4;
  id v5;
  void *v6;
  id v7;
  _QWORD block[4];
  id v9;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __pl_dispatch_once_block_invoke;
  block[3] = &unk_1E376C0E0;
  v9 = v3;
  v4 = *a1;
  v5 = v3;
  v7 = v5;
  if (v4 == -1)
  {
    v6 = v5;
  }
  else
  {
    dispatch_once(a1, block);
    v6 = v9;
  }

}

id PLResultWithUnfairLock(os_unfair_lock_s *a1, void *a2)
{
  void (**v3)(_QWORD);
  void *v4;

  v3 = a2;
  os_unfair_lock_lock(a1);
  v3[2](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(a1);
  return v4;
}

void sub_199DFC740(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id PLChangeHandlingGetLog()
{
  if (PLChangeHandlingGetLog_predicate != -1)
    dispatch_once(&PLChangeHandlingGetLog_predicate, &__block_literal_global_26);
  return (id)PLChangeHandlingGetLog_log;
}

id PLFetchPerformanceGetLog()
{
  if (PLFetchPerformanceGetLog_predicate != -1)
    dispatch_once(&PLFetchPerformanceGetLog_predicate, &__block_literal_global_50);
  return (id)PLFetchPerformanceGetLog_log;
}

void sub_199DFCBFC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t PLPlatformEagerlyFetchFaceRegions()
{
  return 0;
}

void __pl_dispatch_async_block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x19AEC2E4C]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

uint64_t PLDegreesForImageOrientation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 6)
    return 0;
  else
    return dword_199EB0820[a1 - 1];
}

uint64_t PLIsSuppressingLogsForUnitTesting()
{
  return _suppressLogsForUnitTesting;
}

double PLSplitToCGRectFromInt64(uint64_t a1, double *a2)
{
  double result;

  *a2 = (double)(a1 >> 48) / 100.0;
  a2[1] = (double)((int)((unint64_t)a1 >> 16) >> 16) / 100.0;
  result = (double)(__int16)a1 / 100.0;
  a2[2] = (double)((int)a1 >> 16) / 100.0;
  a2[3] = result;
  return result;
}

BOOL PLPhotosAccessAllowed(uint64_t a1)
{
  return (a1 & 0xFFFFFFFFFFFFFFFBLL) == 0;
}

uint64_t PLPlatformCloudPhotosPrimarySyncSupported()
{
  return 1;
}

uint64_t PLValidatedSavedAssetTypeApplies(unsigned int a1, uint64_t a2)
{
  uint64_t result;
  NSObject *v4;
  uint8_t buf[4];
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  switch((int)a2)
  {
    case 0:
      result = a1 & 1;
      break;
    case 1:
      result = (a1 >> 1) & 1;
      break;
    case 2:
      result = (a1 >> 2) & 1;
      break;
    case 3:
      result = (a1 >> 3) & 1;
      break;
    case 4:
      result = (a1 >> 4) & 1;
      break;
    case 5:
      result = (a1 >> 5) & 1;
      break;
    case 6:
      result = (a1 >> 6) & 1;
      break;
    case 7:
      result = (a1 >> 7) & 1;
      break;
    case 8:
      result = (a1 >> 8) & 1;
      break;
    case 9:
      result = (a1 >> 9) & 1;
      break;
    case 10:
      result = (a1 >> 10) & 1;
      break;
    case 11:
      result = (a1 >> 11) & 1;
      break;
    case 12:
      result = (a1 >> 12) & 1;
      break;
    case 13:
      result = (a1 >> 13) & 1;
      break;
    case 14:
      result = (a1 >> 14) & 1;
      break;
    default:
      if ((_DWORD)a2 == 256)
      {
        result = (a1 & 0x8000u) != 0;
      }
      else
      {
        PLBackendGetLog();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109120;
          v6 = a2;
          _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_FAULT, "Unrecognized savedAssetType %d", buf, 8u);
        }

        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Unrecognized savedAssetType %d"), a2);
        result = 0;
      }
      break;
  }
  return result;
}

id PLPhotosObjectLifecycleGetLog()
{
  if (PLPhotosObjectLifecycleGetLog_predicate != -1)
    dispatch_once(&PLPhotosObjectLifecycleGetLog_predicate, &__block_literal_global_78_2268);
  return (id)PLPhotosObjectLifecycleGetLog_log;
}

id PLSharedLibraryGetLog()
{
  if (PLSharedLibraryGetLog_predicate != -1)
    dispatch_once(&PLSharedLibraryGetLog_predicate, &__block_literal_global_188);
  return (id)PLSharedLibraryGetLog_log;
}

id PLSyndicationUIGetLog()
{
  if (PLSyndicationUIGetLog_predicate != -1)
    dispatch_once(&PLSyndicationUIGetLog_predicate, &__block_literal_global_190);
  return (id)PLSyndicationUIGetLog_log;
}

id PLGridInlinePlaybackGetLog()
{
  if (PLGridInlinePlaybackGetLog_predicate != -1)
    dispatch_once(&PLGridInlinePlaybackGetLog_predicate, &__block_literal_global_120);
  return (id)PLGridInlinePlaybackGetLog_log;
}

void sub_199DFD650(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_199DFDA50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __pl_dispatch_barrier_sync_block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x19AEC2E4C]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

PLPhotoLibraryPathManager *PLPathManagerFromLibraryID(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  PLPhotoLibraryPathManager *v5;
  void *v7;
  void *v8;

  v1 = a1;
  if (!v1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PLPhotoLibraryPathManager * _Nonnull PLPathManagerFromLibraryID(__strong PLPhotoLibraryID _Nonnull)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PLPhotoLibraryPathManagerIdentifier.m"), 79, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("libraryID"));

  }
  v2 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:isDirectory:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[PLPhotoLibraryPathManager initWithLibraryURL:bundleScope:libraryFormat:]([PLPhotoLibraryPathManager alloc], "initWithLibraryURL:bundleScope:libraryFormat:", v4, 0, objc_msgSend(v1, "bundleFormat"));
  return v5;
}

PLPhotoLibraryPathManagerIdentifier *PLLibraryIDFromPathManager(void *a1)
{
  id v1;
  PLPhotoLibraryPathManagerIdentifier *v2;
  void *v4;
  void *v5;

  v1 = a1;
  if (!v1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PLPhotoLibraryID  _Nonnull PLLibraryIDFromPathManager(PLPhotoLibraryPathManager *__strong _Nonnull)");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PLPhotoLibraryPathManagerIdentifier.m"), 87, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pathManager"));

  }
  v2 = -[PLPhotoLibraryPathManagerIdentifier initWithPathManager:]([PLPhotoLibraryPathManagerIdentifier alloc], "initWithPathManager:", v1);

  return v2;
}

void sub_199DFFBBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *PLBundleIdentifier()
{
  void *v0;
  __CFString *v1;
  pid_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  CFDictionaryRef v8;
  void *v9;
  char v11[4104];
  uint64_t v12;

  MEMORY[0x1E0C80A78]();
  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v1)
    return v1;
  v2 = getpid();
  proc_pidpath(v2, v11, 0x1000u);
  if (strlen(v11) > 1)
  {
    v3 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v11);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fileURLWithPath:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = +[PLSandboxHelper processCanReadSandboxForPath:](PLSandboxHelper, "processCanReadSandboxForPath:", v6);

    if (v7)
    {
      v8 = CFBundleCopyInfoDictionaryForURL((CFURLRef)v5);
      -[__CFDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AE78]);
      v1 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v1)
        return v1;
    }
    else
    {

    }
  }
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "processName");
  v1 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (-[__CFString isEqualToString:](v1, "isEqualToString:", CFSTR("photolibraryd")))
  {

    return CFSTR("com.apple.photolibraryd");
  }
  if (-[__CFString isEqualToString:](v1, "isEqualToString:", CFSTR("photoanalysisd")))
  {

    return CFSTR("com.apple.photoanalysisd");
  }
  if (-[__CFString isEqualToString:](v1, "isEqualToString:", CFSTR("assetsd")))
  {

    return CFSTR("com.apple.assetsd");
  }
  if (-[__CFString isEqualToString:](v1, "isEqualToString:", CFSTR("replayd")))
  {

    v1 = CFSTR("com.apple.replayd");
  }
  return v1;
}

void sub_199DFFE20(_Unwind_Exception *exception_object)
{
  char v1;

  if ((v1 & 1) != 0)
    objc_end_catch();
  _Unwind_Resume(exception_object);
}

void sub_199DFFE64(void *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, __int128 a9)
{
  id v10;
  id v11;

  if (a2)
  {
    v10 = objc_begin_catch(exc_buf);
    if (a2 == 2)
    {
      v11 = v10;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        LODWORD(a9) = 138412290;
        *(_QWORD *)((char *)&a9 + 4) = v11;
        _os_log_debug_impl(&dword_199DF7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Failed to get bundle identifer for process. Exception: %@", (uint8_t *)&a9, 0xCu);
      }
      objc_end_catch();
      JUMPOUT(0x199DFFC50);
    }
    JUMPOUT(0x199DFFC54);
  }
  JUMPOUT(0x199DFFE5CLL);
}

uint64_t PLIsUBFOnDCIMLibraryURLForSingletonLibraryPath(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a1;
  objc_msgSend(a2, "stringByAppendingPathComponent:", CFSTR("PhotoData"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("UBF"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "isEqualToString:", v5);
  return v7;
}

double PLSplitToDoubleFromInt64(uint64_t a1, double *a2, double *a3, double *a4, double *a5)
{
  double result;

  *a2 = (double)(a1 >> 48) / 100.0;
  *a3 = (double)((int)((unint64_t)a1 >> 16) >> 16) / 100.0;
  *a4 = (double)((int)a1 >> 16) / 100.0;
  result = (double)(__int16)a1 / 100.0;
  *a5 = result;
  return result;
}

uint64_t PLIsPhotoPicker()
{
  pl_dispatch_once(&PLIsPhotoPicker_didCheck, &__block_literal_global_78_3401);
  return PLIsPhotoPicker_isPhotoPicker;
}

uint64_t PLQueryReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  PLQuery *v24;
  uint64_t v25;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 2u:
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 40) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_37;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_39;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_37:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_39:
        *(_DWORD *)(a1 + 8) = v19;
        goto LABEL_40;
      case 3u:
        v24 = objc_alloc_init(PLQuery);
        v25 = 16;
        goto LABEL_30;
      case 4u:
        v24 = objc_alloc_init(PLQuery);
        v25 = 24;
LABEL_30:
        objc_storeStrong((id *)(a1 + v25), v24);
        if (!PBReaderPlaceMark() || (PLQueryReadFrom(v24, a2) & 1) == 0)
          goto LABEL_42;
        goto LABEL_35;
      case 5u:
        v24 = objc_alloc_init(PLSingleQuery);
        objc_msgSend((id)a1, "addSingleQueries:", v24);
        if (PBReaderPlaceMark() && (PLSingleQueryReadFrom((uint64_t)v24, a2) & 1) != 0)
        {
LABEL_35:
          PBReaderRecallMark();

LABEL_40:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_42:

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_40;
    }
  }
}

id PLBackendGetLog()
{
  if (PLBackendGetLog_predicate != -1)
    dispatch_once(&PLBackendGetLog_predicate, &__block_literal_global_10_2216);
  return (id)PLBackendGetLog_log;
}

id PLUIGetLog()
{
  if (PLUIGetLog_predicate != -1)
    dispatch_once(&PLUIGetLog_predicate, &__block_literal_global_164);
  return (id)PLUIGetLog_log;
}

id PLLibraryBundleGetLog()
{
  if (PLLibraryBundleGetLog_predicate != -1)
    dispatch_once(&PLLibraryBundleGetLog_predicate, &__block_literal_global_54_2253);
  return (id)PLLibraryBundleGetLog_log;
}

uint64_t PLIsPTPD()
{
  pl_dispatch_once(&PLIsPTPD_didCheckReadOnly, &__block_literal_global_54_3383);
  return PLIsPTPD_isPTPD;
}

void _freeCGImageDataProviderBuffer(OSQueueHead ***a1)
{
  OSQueueHead **v2;
  OSQueueHead **v3;

  if (a1)
  {
    v2 = *a1;
    if (v2)
      PLPositionalTableMemoryPool_Free(v2);
    v3 = a1[1];
    a1[1] = 0;

    free(a1);
  }
}

void PLPositionalTableMemoryPool_Free(OSQueueHead **__new)
{
  void *v2;
  void *v3;

  if (!__new)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void PLPositionalTableMemoryPool_Free(PLPositionalTableMemoryPoolNode *)");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PLPositionalTableAllocator.m"), 83, CFSTR("no node."));

  }
  if (*((_BYTE *)__new + 16))
  {
    OSAtomicEnqueue(__new[1], __new, 0x18uLL);
  }
  else
  {
    free(*__new);
    free(__new);
  }
}

uint64_t PLIsValidStateForMinimumStateRequirement(uint64_t a1, uint64_t a2)
{
  _BOOL4 v3;

  v3 = a1 < 8 && a1 >= a2;
  return a1 == a2 || v3;
}

_QWORD *PLPositionalTableMemoryPool_Alloc(OSQueueHead *__list, void *a2)
{
  _QWORD *v4;

  if (!__list || __list[1].opaque1 != a2 || (v4 = OSAtomicDequeue(__list, 0x18uLL)) == 0)
  {
    v4 = malloc_type_calloc(1uLL, 0x20uLL, 0x10A0040D921DB92uLL);
    v4[1] = __list;
    *v4 = malloc_type_malloc((size_t)a2, 0x6119C188uLL);
  }
  return v4;
}

OSQueueHead *PLPositionalTableMemoryPool_Create(void *a1, int a2)
{
  unint64_t v4;
  size_t v5;
  vm_size_t v6;
  OSQueueHead *v7;
  void *v8;
  vm_address_t *v9;
  uint64_t v10;
  vm_address_t v11;
  vm_address_t address;

  v4 = ((unint64_t)a1 + 7) & 0xFFFFFFFFFFFFFFF8;
  v5 = a2;
  v6 = (*MEMORY[0x1E0C85AD8] + v4 * a2 - 1) & -*MEMORY[0x1E0C85AD8];
  address = 0;
  v7 = 0;
  if (!vm_allocate(*MEMORY[0x1E0C83DA0], &address, v6, -117440511))
  {
    v7 = (OSQueueHead *)malloc_type_calloc(1uLL, 0x40uLL, 0x1080040D6C77673uLL);
    v7->opaque1 = 0;
    v7->opaque2 = 0;
    LODWORD(v7[1].opaque2) = a2;
    v7[1].opaque1 = a1;
    v7[2].opaque2 = address;
    v7[3].opaque1 = (void *)v6;
    v8 = malloc_type_calloc(v5, 0x20uLL, 0x10A0040D921DB92uLL);
    v7[2].opaque1 = v8;
    if (SLODWORD(v7[1].opaque2) >= 1)
    {
      v9 = (vm_address_t *)v8;
      v10 = 0;
      v11 = address;
      do
      {
        *v9 = v11;
        v9[1] = (vm_address_t)v7;
        *((_BYTE *)v9 + 16) = 1;
        OSAtomicEnqueue(v7, v9, 0x18uLL);
        v11 += v4;
        ++v10;
        v9 += 4;
      }
      while (v10 < SLODWORD(v7[1].opaque2));
    }
  }
  return v7;
}

void sub_199E04450(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_199E047DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id PLPrivacyGetLog()
{
  if (PLPrivacyGetLog_predicate != -1)
    dispatch_once(&PLPrivacyGetLog_predicate, &__block_literal_global_72);
  return (id)PLPrivacyGetLog_log;
}

void sub_199E04D28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id PLLibraryServicesGetLog()
{
  if (PLLibraryServicesGetLog_predicate != -1)
    dispatch_once(&PLLibraryServicesGetLog_predicate, &__block_literal_global_56);
  return (id)PLLibraryServicesGetLog_log;
}

id PLPersistentHistoryGetLog()
{
  if (PLPersistentHistoryGetLog_predicate != -1)
    dispatch_once(&PLPersistentHistoryGetLog_predicate, &__block_literal_global_66);
  return (id)PLPersistentHistoryGetLog_log;
}

id PLPhotoLibraryGetLog()
{
  if (PLPhotoLibraryGetLog_predicate != -1)
    dispatch_once(&PLPhotoLibraryGetLog_predicate, &__block_literal_global_96_2286);
  return (id)PLPhotoLibraryGetLog_log;
}

id PLCuratedLibraryGetLog()
{
  if (PLCuratedLibraryGetLog_predicate != -1)
    dispatch_once(&PLCuratedLibraryGetLog_predicate, &__block_literal_global_116);
  return (id)PLCuratedLibraryGetLog_log;
}

uint64_t PLIsSystemLibraryAccessProhibited()
{
  if (PLIsSystemLibraryAccessProhibited_onceToken != -1)
    dispatch_once(&PLIsSystemLibraryAccessProhibited_onceToken, &__block_literal_global_41);
  return _systemLibraryAccessProhibited;
}

uint64_t PLIsCamera()
{
  pl_dispatch_once(&PLIsCamera_didCheck, &__block_literal_global_60_3388);
  return PLIsCamera_isCamera;
}

const __CFString *DCIM_applicationBackgroundedNotificationName()
{
  return CFSTR("UIApplicationDidEnterBackgroundNotification");
}

id PLWindowSceneDelegateGetLog()
{
  if (PLWindowSceneDelegateGetLog_predicate != -1)
    dispatch_once(&PLWindowSceneDelegateGetLog_predicate, &__block_literal_global_176);
  return (id)PLWindowSceneDelegateGetLog_log;
}

id PLPhotoSharingGetLog()
{
  if (PLPhotoSharingGetLog_predicate != -1)
    dispatch_once(&PLPhotoSharingGetLog_predicate, &__block_literal_global_76_2266);
  return (id)PLPhotoSharingGetLog_log;
}

id PLSafeResultWithUnfairLock(os_unfair_lock_s *a1, void *a2)
{
  void (**v3)(_QWORD);
  void *v4;

  v3 = a2;
  os_unfair_lock_lock(a1);
  v3[2](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(a1);

  return v4;
}

void sub_199E050B4(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_199E050C8(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

uint64_t PLIsMobileSlideShow()
{
  pl_dispatch_once(&PLIsMobileSlideShow_didCheck, &__block_literal_global_66_3394);
  return PLIsMobileSlideShow_isMobileslideshow;
}

id PLSearchBackendIndexManagerGetLog()
{
  if (PLSearchBackendIndexManagerGetLog_predicate != -1)
    dispatch_once(&PLSearchBackendIndexManagerGetLog_predicate, &__block_literal_global_230);
  return (id)PLSearchBackendIndexManagerGetLog_log;
}

BOOL PLIsPhotosAppAnyPlatform()
{
  pl_dispatch_once(&PLIsPhotosApp_didCheck, &__block_literal_global_69);
  if (PLIsPhotosApp_isPhotosApp)
    return 1;
  pl_dispatch_once(&PLIsMobileSlideShow_didCheck, &__block_literal_global_66_3394);
  if (PLIsMobileSlideShow_isMobileslideshow)
    return 1;
  pl_dispatch_once(&PLIsTVPhotosApp_didCheck, &__block_literal_global_72_3396);
  return PLIsTVPhotosApp_isTVPhotosApp != 0;
}

id pl_result_with_autoreleasepool(void *a1)
{
  void (**v1)(_QWORD);
  void *v2;
  void *v3;

  v1 = a1;
  v2 = (void *)MEMORY[0x19AEC2E4C]();
  v1[2](v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v2);

  return v3;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

id PLUserStatusGetLog()
{
  if (PLUserStatusGetLog_predicate != -1)
    dispatch_once(&PLUserStatusGetLog_predicate, &__block_literal_global_168);
  return (id)PLUserStatusGetLog_log;
}

uint64_t PLIsAssetsdProxyService()
{
  return __PLIsAssetsdProxyService;
}

const __CFString *DCIM_applicationDidReceiveMemoryWarningNotificationName()
{
  return CFSTR("UIApplicationDidReceiveMemoryWarningNotification");
}

void __pl_dispatch_once_block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x19AEC2E4C]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

void ___ensureSystemPhotoDataDirectoryPath_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  +[PLFileUtilities _defaultSystemLibraryPath](PLFileUtilities, "_defaultSystemLibraryPath");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("PhotoData"));
  v1 = objc_claimAutoreleasedReturnValue();

  v2 = (void *)sPhotoDataDirectoryPath;
  sPhotoDataDirectoryPath = v1;

}

void ___ensureSystemDCIMDirectoryPath_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  +[PLFileUtilities _defaultSystemLibraryPath](PLFileUtilities, "_defaultSystemLibraryPath");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("DCIM"));
  v1 = objc_claimAutoreleasedReturnValue();

  v2 = (void *)sDCIMDirectoryPath;
  sDCIMDirectoryPath = v1;

}

id DCIM_newPLImageWithContentsOfFile(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  v2 = (void *)objc_msgSend(objc_alloc(NSClassFromString((NSString *)CFSTR("UIImage"))), "initWithContentsOfFile:", v1);

  return v2;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

BOOL PLDoesIndicatorFileExistAtPath(void *a1)
{
  int v1;
  int v2;

  v1 = open((const char *)objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation"), 4);
  v2 = v1;
  if ((v1 & 0x80000000) == 0)
    close(v1);
  return v2 >= 0;
}

void sub_199E06710(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,void *a30,os_signpost_id_t a31,os_activity_scope_state_s a32,SEL sel)
{
  uint64_t v33;
  uint64_t v34;
  NSObject *v36;
  NSObject *v37;
  const char *Name;

  if (a29)
    os_activity_scope_leave(&a32);
  if (a31)
  {
    PLRequestGetLog();
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (a31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      Name = sel_getName(sel);
      *(_DWORD *)(v34 - 112) = 136446210;
      *(_QWORD *)(v33 + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v37, OS_SIGNPOST_INTERVAL_END, a31, "PLXPC Sync", "%{public}s", (uint8_t *)(v34 - 112), 0xCu);
    }

  }
  _Unwind_Resume(a1);
}

void sub_199E06C44(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_199E07EE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,SEL sel,uint64_t a27,uint64_t a28,uint8_t buf)
{

  _Unwind_Resume(a1);
}

void sub_199E082AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,SEL sel,uint8_t buf)
{

  _Unwind_Resume(a1);
}

id PLRequestGetLog()
{
  if (PLRequestGetLog_predicate != -1)
    dispatch_once(&PLRequestGetLog_predicate, &__block_literal_global_1080);
  return (id)PLRequestGetLog_log;
}

void sub_199E08858(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,os_signpost_id_t a27,os_activity_scope_state_s a28,SEL sel)
{
  uint64_t v29;
  uint64_t v30;
  NSObject *v32;
  NSObject *v33;
  const char *Name;

  _Block_object_dispose((const void *)(v30 - 176), 8);
  if (a25)
    os_activity_scope_leave(&a28);
  if (a27)
  {
    PLRequestGetLog();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (a27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      Name = sel_getName(sel);
      *(_DWORD *)(v30 - 176) = 136446210;
      *(_QWORD *)(v29 + 116) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v33, OS_SIGNPOST_INTERVAL_END, a27, "PLXPC Sync", "%{public}s", (uint8_t *)(v30 - 176), 0xCu);
    }

  }
  _Unwind_Resume(a1);
}

void sub_199E08BC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id PLGatekeeperXPCGetLog()
{
  if (PLGatekeeperXPCGetLog_predicate != -1)
    dispatch_once(&PLGatekeeperXPCGetLog_predicate, &__block_literal_global_42_2244);
  return (id)PLGatekeeperXPCGetLog_log;
}

id pathKeyForLibraryURL(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(v1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  +[PLFileUtilities realPathForPath:error:](PLFileUtilities, "realPathForPath:error:", v2, &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;

  if (!v3)
  {
    if (!v1)
    {
      v3 = 0;
      goto LABEL_10;
    }
    PLBackendGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v11 = v1;
      v12 = 2112;
      v13 = v4;
      _os_log_impl(&dword_199DF7000, v7, OS_LOG_TYPE_DEFAULT, "Unable to determine realpath for URL %@ error: %@", buf, 0x16u);
    }

    objc_msgSend(v1, "URLByStandardizingPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (objc_msgSend(v3, "hasSuffix:", CFSTR("/")))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *pathKeyForLibraryURL(NSURL *__strong)");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PLLibraryBookmarkManager.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("![path hasSuffix:@\"/\"]"));

LABEL_8:
  }
LABEL_10:

  return v3;
}

id PLSandboxExtensionTokenAsData(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    v2 = (void *)MEMORY[0x1E0C99D50];
    v3 = objc_retainAutorelease(v1);
    objc_msgSend(v2, "dataWithBytes:length:", objc_msgSend(v3, "UTF8String"), strlen((const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String")) + 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id PLGetSandboxExtensionTokenWithFlags(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v5 = a1;
  v6 = v5;
  if (v5
    && ((objc_msgSend(objc_retainAutorelease(v5), "fileSystemRepresentation"), !a4)
      ? (v7 = sandbox_extension_issue_file())
      : (v7 = sandbox_extension_issue_file_to_process()),
        (v8 = (void *)v7) != 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    free(v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

const __CFString *PLStringFromWellKnownPhotoLibraryIdentifier(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("PLWellKnownPhotoLibraryIdentifierNone");
  else
    return off_1E376BE90[a1 - 1];
}

id PLPTPGetLog()
{
  if (PLPTPGetLog_predicate != -1)
    dispatch_once(&PLPTPGetLog_predicate, &__block_literal_global_64);
  return (id)PLPTPGetLog_log;
}

id PLPPTGetLog()
{
  if (PLPPTGetLog_predicate != -1)
    dispatch_once(&PLPPTGetLog_predicate, &__block_literal_global_138);
  return (id)PLPPTGetLog_log;
}

CGColorSpaceRef ___create5551BGRACGImageFromTableEntryNode_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateDeviceRGB();
  _create5551BGRACGImageFromTableEntryNode_s_colorSpace = (uint64_t)result;
  return result;
}

const __CFString *PLStringFromQoSClass(int a1)
{
  if (a1 > 16)
  {
    if (a1 > 24)
    {
      if (a1 == 33)
        return CFSTR("QOS_CLASS_USER_INTERACTIVE");
      if (a1 == 25)
        return CFSTR("QOS_CLASS_USER_INITIATED");
    }
    else
    {
      if (a1 == 17)
        return CFSTR("QOS_CLASS_UTILITY");
      if (a1 == 21)
        return CFSTR("QOS_CLASS_DEFAULT");
    }
    return CFSTR("UNKNOWN");
  }
  if (!a1)
    return CFSTR("QOS_CLASS_UNSPECIFIED");
  if (a1 != 5)
  {
    if (a1 == 9)
      return CFSTR("QOS_CLASS_BACKGROUND");
    return CFSTR("UNKNOWN");
  }
  return CFSTR("QOS_CLASS_MAINTENANCE");
}

id PLCameraTaskConstraintsGetLog()
{
  if (PLCameraTaskConstraintsGetLog_predicate != -1)
    dispatch_once(&PLCameraTaskConstraintsGetLog_predicate, &__block_literal_global_24_2229);
  return (id)PLCameraTaskConstraintsGetLog_log;
}

id PLBackgroundJobServiceGetLog()
{
  if (PLBackgroundJobServiceGetLog_predicate != -1)
    dispatch_once(&PLBackgroundJobServiceGetLog_predicate, &__block_literal_global_14_2219);
  return (id)PLBackgroundJobServiceGetLog_log;
}

uint64_t PLPlatformSearchSupported()
{
  pl_dispatch_once(&PLPlatformSearchSupported_didCheck, &__block_literal_global_231);
  return PLPlatformSearchSupported_searchSupported;
}

void pl_notify_register_dispatch_with_retry(const char *a1, int *a2, void *a3, int a4, void *a5)
{
  NSObject *v9;
  id v10;
  unsigned __int8 v11;
  uint64_t v12;
  char v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = atomic_load(sNotifyIsDisabledForShutdown);
  if ((v11 & 1) == 0)
  {
    LODWORD(v12) = 0;
    v13 = 0;
    do
    {
      if ((v13 & 1) != 0)
      {
        PLBackendGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109890;
          v20 = 1000000;
          v21 = 2080;
          v22 = a1;
          v23 = 1024;
          v24 = v12;
          v25 = 1024;
          v26 = a4;
          _os_log_impl(&dword_199DF7000, v14, OS_LOG_TYPE_ERROR, "Error %d occurred while trying to connect notify handler for %s. (attempt number: %d of %d)", buf, 0x1Eu);
        }

        usleep(0x186A0u);
      }
      v15 = pl_notify_register_dispatch(a1, a2, v9, v10);
      v12 = (v12 + 1);
      if ((_DWORD)v15 != 1000000)
        break;
      v13 = 1;
    }
    while ((int)v12 < a4);
    PLBackendGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109890;
      v20 = v15;
      v21 = 2082;
      v22 = a1;
      v23 = 1024;
      v24 = v12;
      v25 = 1024;
      v26 = a4;
      _os_log_impl(&dword_199DF7000, v16, OS_LOG_TYPE_DEBUG, "notify_register_dispatch() returned %#x for %{public}s after number %d of %d", buf, 0x1Eu);
    }

    if ((_DWORD)v15)
    {
      if (PLIsSecureCaptureExtension())
      {
        PLBackendGetLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          v20 = v15;
          v21 = 1024;
          LODWORD(v22) = v12;
          _os_log_impl(&dword_199DF7000, v17, OS_LOG_TYPE_DEFAULT, "notify_register_dispatch() failed for capture extension: (%#x) after %d retries", buf, 0xEu);
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v17 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void pl_notify_register_dispatch_with_retry(const char *, int *, __strong dispatch_queue_t, int, void (^__strong)(int))");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject handleFailureInFunction:file:lineNumber:description:](v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("PLDispatchHelpers.m"), 104, CFSTR("notify_register_dispatch() failed: (%#x) after %d retries"), v15, v12);

      }
    }
  }

}

uint64_t pl_notify_register_dispatch(const char *a1, int *a2, NSObject *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  _QWORD handler[4];
  id v12;

  v7 = a4;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __pl_notify_register_dispatch_block_invoke;
  handler[3] = &unk_1E3769550;
  v12 = v7;
  v8 = v7;
  v9 = notify_register_dispatch(a1, a2, a3, handler);

  return v9;
}

const __CFString *PLStringFromLibraryServicesState(uint64_t a1)
{
  const __CFString *result;

  switch(a1)
  {
    case 0:
      result = CFSTR("none");
      break;
    case 1:
      result = CFSTR("initializing");
      break;
    case 2:
      result = CFSTR("unobtainable");
      break;
    case 3:
      result = CFSTR("prep-pre-migration");
      break;
    case 4:
      result = CFSTR("prep-migration");
      break;
    case 5:
      result = CFSTR("prep-post-migration");
      break;
    case 6:
      result = CFSTR("prep-accessible");
      break;
    case 7:
      result = CFSTR("running");
      break;
    case 8:
      result = CFSTR("terminating");
      break;
    default:
      if (a1 == 99)
        result = CFSTR("error");
      else
        result = 0;
      break;
  }
  return result;
}

uint64_t PLMobileSlideShowPhotoLibraryTestingMode()
{
  if (PLMobileSlideShowPhotoLibraryTestingMode_onceToken != -1)
    dispatch_once(&PLMobileSlideShowPhotoLibraryTestingMode_onceToken, &__block_literal_global_3361);
  return PLMobileSlideShowPhotoLibraryTestingMode_sMobileSlideShowPhotoLibraryTestingMode;
}

uint64_t PLIsEDUMode()
{
  if (PLIsEDUMode_onceToken != -1)
    dispatch_once(&PLIsEDUMode_onceToken, &__block_literal_global_129_3449);
  return PLIsEDUMode_isEDUMode;
}

uint64_t PLIsChinaSKU()
{
  if (PLIsChinaSKU_onceToken != -1)
    dispatch_once(&PLIsChinaSKU_onceToken, &__block_literal_global_327);
  return PLIsChinaSKU_isChinaSKU;
}

void __pl_dispatch_after_block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x19AEC2E4C]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

void sub_199E0AE68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void PLSafeRunWithUnfairLock(os_unfair_lock_s *a1, void *a2)
{
  void (**v3)(void);

  v3 = a2;
  os_unfair_lock_lock(a1);
  v3[2]();
  os_unfair_lock_unlock(a1);

}

void sub_199E0AECC(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_199E0AEE0(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_199E0B7F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  void *v15;

  objc_sync_exit(v15);
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

id PLVisualIntelligenceGetLog()
{
  if (PLVisualIntelligenceGetLog_predicate != -1)
    dispatch_once(&PLVisualIntelligenceGetLog_predicate, &__block_literal_global_194);
  return (id)PLVisualIntelligenceGetLog_log;
}

id PLUserStatusUIGetLog()
{
  if (PLUserStatusUIGetLog_predicate != -1)
    dispatch_once(&PLUserStatusUIGetLog_predicate, &__block_literal_global_170);
  return (id)PLUserStatusUIGetLog_log;
}

id PLMigrationGetLog()
{
  if (PLMigrationGetLog_predicate != -1)
    dispatch_once(&PLMigrationGetLog_predicate, &__block_literal_global_58);
  return (id)PLMigrationGetLog_log;
}

id PLDragAndDropGetLog()
{
  if (PLDragAndDropGetLog_predicate != -1)
    dispatch_once(&PLDragAndDropGetLog_predicate, &__block_literal_global_118);
  return (id)PLDragAndDropGetLog_log;
}

id PLBoopGetLog()
{
  if (PLBoopGetLog_predicate != -1)
    dispatch_once(&PLBoopGetLog_predicate, &__block_literal_global_154);
  return (id)PLBoopGetLog_log;
}

BOOL PLIsFeaturedContentAllowed()
{
  _BOOL8 result;
  NSObject *v1;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  CFPreferencesAppSynchronize(CFSTR("com.apple.mobileslideshow"));
  keyExistsAndHasValidFormat = 0;
  result = CFPreferencesGetAppBooleanValue(CFSTR("FeaturedContentAllowed"), CFSTR("com.apple.mobileslideshow"), &keyExistsAndHasValidFormat) != 0;
  if (!keyExistsAndHasValidFormat)
  {
    PLPreferencesGetLog();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v4 = CFSTR("com.apple.mobileslideshow");
      _os_log_impl(&dword_199DF7000, v1, OS_LOG_TYPE_INFO, "Featured content allowed default not set in domain %@. Defaulting to YES", buf, 0xCu);
    }

    return 1;
  }
  return result;
}

BOOL PLIsSharedLibrarySuggestionsEnabled()
{
  _BOOL8 result;
  NSObject *v1;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  CFPreferencesAppSynchronize(CFSTR("com.apple.mobileslideshow"));
  keyExistsAndHasValidFormat = 0;
  result = CFPreferencesGetAppBooleanValue(CFSTR("SharedLibrarySuggestionsEnabled"), CFSTR("com.apple.mobileslideshow"), &keyExistsAndHasValidFormat) != 0;
  if (!keyExistsAndHasValidFormat)
  {
    PLPreferencesGetLog();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v4 = CFSTR("com.apple.mobileslideshow");
      _os_log_impl(&dword_199DF7000, v1, OS_LOG_TYPE_INFO, "Shared Library suggestions default not set in domain %@. Defaulting to YES", buf, 0xCu);
    }

    return 1;
  }
  return result;
}

id PLPreferencesGetLog()
{
  if (PLPreferencesGetLog_predicate != -1)
    dispatch_once(&PLPreferencesGetLog_predicate, &__block_literal_global_148);
  return (id)PLPreferencesGetLog_log;
}

void pl_dispatch_source_set_event_handler(NSObject *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD handler[4];
  id v6;

  v3 = a2;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __pl_dispatch_source_set_event_handler_block_invoke;
  handler[3] = &unk_1E376C0E0;
  v6 = v3;
  v4 = v3;
  dispatch_source_set_event_handler(a1, handler);

}

double PLPhysicalScreenSize()
{
  int v0;
  int v1;
  void *v3;
  double v4;
  double v5;

  v0 = MGGetSInt32Answer();
  v1 = MGGetSInt32Answer();
  if (v0 != -1 && v1 != -1)
    return (double)v1;
  -[objc_class mainScreen](NSClassFromString((NSString *)CFSTR("UIScreen")), "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nativeBounds");
  v5 = v4;

  return v5;
}

void PLDebugEnableCoreDataMultithreadedAsserts()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;

  if (PFOSVariantHasInternalDiagnostics())
  {
    v0 = (void *)MEMORY[0x19AEC2E4C]();
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "arguments");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = objc_msgSend(v2, "indexOfObjectPassingTest:", &__block_literal_global_159);
    if (v3 == 0x7FFFFFFFFFFFFFFFLL || objc_msgSend(v2, "count") <= (unint64_t)(v3 + 1))
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObjectForKey:", CFSTR("com.apple.CoreData.ConcurrencyDebug"));

    }
    else
    {
      objc_msgSend(v2, "objectAtIndexedSubscript:");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "intValue");

      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeObjectForKey:", CFSTR("com.apple.CoreData.ConcurrencyDebug"));

      if (!v5)
        goto LABEL_9;
    }
    PLEnableCoreDataMultithreadedAsserts();
LABEL_9:

    objc_autoreleasePoolPop(v0);
  }
}

id PLClientBundleIdentifierFromXPCConnection(void *a1)
{
  id v1;
  void *v2;
  NSObject *v3;
  int v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  void *v9;
  int *v10;
  char *v11;
  CFStringRef v13;
  uint8_t v14[4];
  void *v15;
  __int16 v16;
  char *v17;
  uint8_t buf[16];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (!v1)
  {
    v9 = 0;
    goto LABEL_16;
  }
  objc_msgSend(v1, "auditToken");
  v13 = 0;
  *(_OWORD *)buf = 0u;
  v19 = 0u;
  if (!CPCopyBundleIdentifierAndTeamFromAuditToken())
  {
    PLGatekeeperXPCGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v2;
      _os_log_impl(&dword_199DF7000, v3, OS_LOG_TYPE_DEFAULT, "%@ has no bundle identifier. Will fallback on process ID", buf, 0xCu);
    }

    v4 = objc_msgSend(v2, "processIdentifier");
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    *(_OWORD *)buf = 0u;
    v19 = 0u;
    if (proc_name(v4, buf, 0x100u))
    {
      v13 = CFStringCreateWithCString(0, (const char *)buf, 0x8000100u);
      if (v13)
        goto LABEL_14;
      PLGatekeeperXPCGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        goto LABEL_13;
      *(_WORD *)v14 = 0;
      v6 = "Can't decypher process name";
      v7 = v5;
      v8 = 2;
    }
    else
    {
      PLGatekeeperXPCGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
LABEL_13:

        goto LABEL_14;
      }
      v10 = __error();
      v11 = strerror(*v10);
      *(_DWORD *)v14 = 138412546;
      v15 = v2;
      v16 = 2080;
      v17 = v11;
      v6 = "Can't get process name for %@: %s";
      v7 = v5;
      v8 = 22;
    }
    _os_log_impl(&dword_199DF7000, v7, OS_LOG_TYPE_ERROR, v6, v14, v8);
    goto LABEL_13;
  }
LABEL_14:
  v9 = (void *)v13;
  if (!v13)
    v9 = (void *)CFRetain(CFSTR("anonymous"));
LABEL_16:

  return v9;
}

void __destroy_helper_block_e8_48n4_8_s8(uint64_t a1)
{

}

__n128 __copy_helper_block_e8_48n18_8_8_t0w1_s8_t16w32(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(id *)(a2 + 56);
  result = *(__n128 *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(__n128 *)(a1 + 80) = result;
  return result;
}

uint64_t PLIsPhotosReliveWidget()
{
  pl_dispatch_once(&PLIsPhotosReliveWidget_predicate, &__block_literal_global_124_3444);
  return PLIsPhotosReliveWidget_isPhotosReliveWidget;
}

id PLClientServerTransactionsGetLog()
{
  if (PLClientServerTransactionsGetLog_predicate != -1)
    dispatch_once(&PLClientServerTransactionsGetLog_predicate, &__block_literal_global_28);
  return (id)PLClientServerTransactionsGetLog_log;
}

BOOL setupUIGraphicsFunctions()
{
  _BOOL8 result;

  if (setupUIGraphicsFunctions_onceToken != -1)
    dispatch_once(&setupUIGraphicsFunctions_onceToken, &__block_literal_global_71);
  result = 0;
  if (sUIGraphicsBeginImageContext
    && sUIGraphicsGetCurrentContext
    && sUIGraphicsGetImageFromCurrentImageContext
    && sUIGraphicsEndImageContext
    && sUIGraphicsPushContext
    && sUIGraphicsPopContext
    && s_UIImageJPEGRepresentation)
  {
    if (sUIImagePNGRepresentation)
      return sUICreateCGImageFromIOSurface != 0;
  }
  return result;
}

__IOSurface *PLCreateCGImageFromIOSurfaceScaledToSize(__IOSurface *a1, CVPixelBufferRef *a2, double a3, double a4)
{
  __IOSurface *v4;
  const __CFAllocator *v8;
  CVReturn v9;
  __CVBuffer *v10;
  IOSurfaceRef IOSurface;
  VTPixelTransferSessionRef pixelTransferSessionOut;
  CVPixelBufferRef pixelBufferOut;
  CVPixelBufferRef texture;

  v4 = a1;
  if (!a1)
    return v4;
  if (!setupUIGraphicsFunctions())
    return 0;
  pixelBufferOut = 0;
  texture = 0;
  pixelTransferSessionOut = 0;
  v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v9 = CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v4, 0, &pixelBufferOut);
  v4 = 0;
  if (!v9)
  {
    if (VTPixelTransferSessionCreate(v8, &pixelTransferSessionOut))
      goto LABEL_5;
    v4 = 0;
    if (a3 <= 0.0 || a4 <= 0.0)
      goto LABEL_6;
    if (FigCreateIOSurfaceBackedCVPixelBuffer()
      || VTPixelTransferSessionTransferImage(pixelTransferSessionOut, pixelBufferOut, texture))
    {
LABEL_5:
      v4 = 0;
    }
    else
    {
      IOSurface = CVPixelBufferGetIOSurface(texture);
      v4 = (__IOSurface *)sUICreateCGImageFromIOSurface(IOSurface);
    }
  }
LABEL_6:
  v10 = pixelBufferOut;
  if (a2)
  {
    *a2 = pixelBufferOut;
    pixelBufferOut = 0;
    v10 = 0;
  }
  CVPixelBufferRelease(v10);
  if (pixelTransferSessionOut)
    CFRelease(pixelTransferSessionOut);
  CVPixelBufferRelease(texture);
  return v4;
}

void __setupUIGraphicsFunctions_block_invoke()
{
  void *v0;
  const __CFAllocator *v1;
  const __CFURL *v2;
  __CFBundle *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", NSClassFromString((NSString *)CFSTR("UIImage")));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0)
  {
    v1 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v4 = v0;
    objc_msgSend(v0, "bundleURL");
    v2 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    v3 = CFBundleCreate(v1, v2);

    v0 = v4;
    if (v3)
    {
      sUIGraphicsBeginImageContext = CFBundleGetFunctionPointerForName(v3, CFSTR("UIGraphicsBeginImageContext"));
      sUIGraphicsGetCurrentContext = CFBundleGetFunctionPointerForName(v3, CFSTR("UIGraphicsGetCurrentContext"));
      sUIGraphicsGetImageFromCurrentImageContext = CFBundleGetFunctionPointerForName(v3, CFSTR("UIGraphicsGetImageFromCurrentImageContext"));
      sUIGraphicsEndImageContext = CFBundleGetFunctionPointerForName(v3, CFSTR("UIGraphicsEndImageContext"));
      sUIGraphicsPushContext = CFBundleGetFunctionPointerForName(v3, CFSTR("UIGraphicsPushContext"));
      sUIGraphicsPopContext = CFBundleGetFunctionPointerForName(v3, CFSTR("UIGraphicsPopContext"));
      s_UIImageJPEGRepresentation = CFBundleGetFunctionPointerForName(v3, CFSTR("_UIImageJPEGRepresentation"));
      sUIImagePNGRepresentation = CFBundleGetFunctionPointerForName(v3, CFSTR("UIImagePNGRepresentation"));
      sUICreateCGImageFromIOSurface = (uint64_t (*)(_QWORD))CFBundleGetFunctionPointerForName(v3, CFSTR("UICreateCGImageFromIOSurface"));
      CFRelease(v3);
      v0 = v4;
    }
  }

}

uint64_t PLDeviceOrientationFromImageOrientation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 3)
    return 1;
  else
    return (a1 + 1);
}

uint64_t PLImageOrientationFromDeviceOrientation(int a1)
{
  uint64_t v1;

  v1 = (a1 - 2);
  if (v1 < 3)
    return v1 + 1;
  else
    return 0;
}

uint64_t PLSensorOrientationFromCaptureOrientation(int a1, int a2)
{
  int v2;
  int v3;
  unsigned int v4;

  if (a2)
    v2 = 1;
  else
    v2 = 2;
  if (a2)
    v3 = 2;
  else
    v3 = 1;
  if (a1 == 3)
    v4 = v3;
  else
    v4 = 4;
  if (a1 == 4)
    v4 = v2;
  if (a1 == 2)
    return 3;
  else
    return v4;
}

uint64_t PLImageOrientationFromImageProperties(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  uint64_t v7;

  v1 = a1;
  v2 = *MEMORY[0x1E0CBCFF0];
  objc_msgSend(v1, "objectForKey:", *MEMORY[0x1E0CBCFF0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v3, "intValue") - 1;
    if (v5 >= 8)
    {
LABEL_7:
      v7 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    objc_msgSend(v1, "objectForKey:", *MEMORY[0x1E0CBD090]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      goto LABEL_7;
    v5 = objc_msgSend(v4, "intValue") - 1;
    if (v5 > 7)
      goto LABEL_7;
  }
  v7 = PLImageOrientationFromExifOrientation_orientationMapping[v5];
LABEL_8:

  return v7;
}

uint64_t PLImageOrientationFromExifOrientation(int a1)
{
  if ((a1 - 1) > 7)
    return 0;
  else
    return PLImageOrientationFromExifOrientation_orientationMapping[a1 - 1];
}

uint64_t PLExifOrientationFromImageOrientation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 6)
    return 1;
  else
    return dword_199EB07D8[a1 - 1];
}

uint64_t PLInverseExifOrientationFromImageOrientation(unint64_t a1)
{
  if (a1 > 7)
    return 1;
  else
    return dword_199EB07F4[a1];
}

BOOL PLIsRotatedExifOrientation(int a1)
{
  return a1 > 4;
}

uint64_t PLCaptureOrientationFromImageOrientation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return 3;
  else
    return dword_199EB0814[a1 - 1];
}

BOOL PLFlipDimensionsForImageOrientation(uint64_t a1)
{
  return (a1 & 0xFFFFFFFFFFFFFFFALL) == 2;
}

CGImageSource *PLImageOrientationFromImageData(const __CFData *a1)
{
  CGImageSource *v1;
  CGImageSource *v2;

  v1 = CGImageSourceCreateWithData(a1, 0);
  v2 = _ImageOrientationFromImageSource(v1);
  if (v1)
    CFRelease(v1);
  return v2;
}

CGImageSource *_ImageOrientationFromImageSource(CGImageSource *result)
{
  CGImageSource *v1;
  CFDictionaryRef v2;
  uint64_t v3;

  if (result)
  {
    v1 = result;
    v2 = CGImageSourceCopyPropertiesAtIndex(result, 0, 0);
    if (!v2)
      v2 = CGImageSourceCopyPropertiesAtIndex(v1, 0, (CFDictionaryRef)&unk_1E378FD90);
    v3 = PLImageOrientationFromImageProperties(v2);

    return (CGImageSource *)v3;
  }
  return result;
}

BOOL PLImageOrientationIsMirrored(uint64_t a1)
{
  return (a1 & 0xFFFFFFFFFFFFFFFCLL) == 4;
}

uint64_t PLUnmirroredImageOrientation(uint64_t result)
{
  uint64_t v1;

  if ((unint64_t)(result - 5) >= 3)
    v1 = 0;
  else
    v1 = result - 4;
  if ((result & 0xFFFFFFFFFFFFFFFCLL) == 4)
    return v1;
  return result;
}

uint64_t PLMirroredImageOrientation(uint64_t result)
{
  uint64_t v1;

  v1 = 4;
  if ((unint64_t)(result - 1) < 3)
    v1 = result + 4;
  if ((result & 0xFFFFFFFFFFFFFFFCLL) != 4)
    return v1;
  return result;
}

uint64_t PLTransformForImageOrientation@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  unint64_t v2;
  uint64_t v3;
  __int128 v4;

  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  switch(result)
  {
    case 1:
      v2 = 0xBFF0000000000000;
      *(_QWORD *)a2 = 0xBFF0000000000000;
      *(_QWORD *)(a2 + 8) = 0;
      goto LABEL_8;
    case 2:
      _Q0 = xmmword_199EB02E0;
      goto LABEL_11;
    case 3:
      _Q0 = xmmword_199EB02D0;
      goto LABEL_11;
    case 4:
      *(_QWORD *)a2 = 0xBFF0000000000000;
      *(_QWORD *)(a2 + 8) = 0;
      v2 = 0x3FF0000000000000;
      goto LABEL_8;
    case 5:
      *(_QWORD *)a2 = 0x3FF0000000000000;
      *(_QWORD *)(a2 + 8) = 0;
      v2 = 0xBFF0000000000000;
LABEL_8:
      *(_QWORD *)(a2 + 16) = 0;
      *(_QWORD *)(a2 + 24) = v2;
      *(_QWORD *)(a2 + 32) = 0;
      *(_QWORD *)(a2 + 40) = 0;
      return result;
    case 6:
      __asm { FMOV            V0.2D, #1.0; jumptable 0000000199E0E074 case 6 }
      goto LABEL_11;
    case 7:
      __asm { FMOV            V0.2D, #-1.0; jumptable 0000000199E0E074 case 7 }
LABEL_11:
      *(_OWORD *)(a2 + 8) = _Q0;
      *(_QWORD *)(a2 + 32) = 0;
      *(_QWORD *)(a2 + 40) = 0;
      *(_QWORD *)(a2 + 24) = 0;
      break;
    default:
      v3 = MEMORY[0x1E0C9BAA8];
      v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)a2 = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)(a2 + 16) = v4;
      *(_OWORD *)(a2 + 32) = *(_OWORD *)(v3 + 32);
      break;
  }
  return result;
}

uint64_t PLImageOrientationRotatedByDegrees(uint64_t a1, float a2)
{
  int v2;
  int v3;
  BOOL v4;
  int v5;
  int v6;
  BOOL v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  if ((a1 & 0xFFFFFFFFFFFFFFFCLL) == 4)
  {
    if (a1 != 5)
    {
      if (a1 != 6)
      {
        if (a1 == 7)
        {
          if (a2 < 0.0)
            a2 = a2 + 360.0;
          v2 = (int)(a2 / 90.0);
          goto LABEL_13;
        }
        v3 = 0;
        if (a2 < 0.0)
          a2 = a2 + 360.0;
        v2 = (int)(a2 / 90.0);
        goto LABEL_26;
      }
      if (a2 < 0.0)
        a2 = a2 + 360.0;
      v2 = (int)(a2 / 90.0);
LABEL_21:
      v3 = 3;
      goto LABEL_26;
    }
    if (a2 < 0.0)
      a2 = a2 + 360.0;
    v2 = (int)(a2 / 90.0);
LABEL_17:
    v3 = 2;
    goto LABEL_26;
  }
  if (a2 < 0.0)
    a2 = a2 + 360.0;
  v2 = (int)(a2 / 90.0);
  switch(a1)
  {
    case 1:
      goto LABEL_17;
    case 2:
      goto LABEL_21;
    case 3:
LABEL_13:
      v3 = 1;
      goto LABEL_26;
  }
  v3 = 0;
LABEL_26:
  v4 = __OFADD__(v3, v2);
  v5 = v3 + v2;
  if (v5 < 0 != v4)
    v5 += 4;
  v6 = v5 & 3;
  v8 = -v5;
  v7 = v8 < 0;
  v9 = v8 & 3;
  if (v7)
    v10 = v6;
  else
    v10 = -v9;
  v11 = PLImageOrientationRotatedByDegrees_orientations[v10];
  v12 = 4;
  if ((unint64_t)(v11 - 1) < 3)
    v12 = v11 + 4;
  if ((a1 & 0xFFFFFFFFFFFFFFFCLL) == 4)
    return v12;
  else
    return v11;
}

uint64_t PLExifOrientationForSensorOrientation(int a1)
{
  if ((a1 - 2) > 2)
    return 6;
  else
    return dword_199EB083C[a1 - 2];
}

void PLAddTIFFDPIPropertiesToDictionary(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;

  v1 = (objc_class *)MEMORY[0x1E0CB37E8];
  v2 = a1;
  v3 = (id)objc_msgSend([v1 alloc], "initWithInt:", 72);
  objc_msgSend(v2, "setObject:forKey:", v3, *MEMORY[0x1E0CBD0F8]);
  objc_msgSend(v2, "setObject:forKey:", v3, *MEMORY[0x1E0CBD108]);

}

CFStringRef PLCreateEXIFDateString(void *a1, void *a2)
{
  const __CFDate *v3;
  __CFString *v4;
  __CFDateFormatter *v5;
  __CFDateFormatter *v6;
  CFStringRef StringWithDate;

  v3 = a1;
  v4 = a2;
  v5 = CFDateFormatterCreate(0, 0, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  if (v5)
  {
    v6 = v5;
    CFDateFormatterSetFormat(v5, v4);
    StringWithDate = CFDateFormatterCreateStringWithDate(0, v6, v3);
    CFRelease(v6);
  }
  else
  {
    StringWithDate = 0;
  }

  return StringWithDate;
}

id PLCreationDateFromImageProperties(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  uint64_t v12;
  id v13;

  v1 = a1;
  objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCB50]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCB40]);
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCCA0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4
      || (objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCB38]),
          v4 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCC98]),
          v6 = objc_claimAutoreleasedReturnValue(),
          v5,
          v5 = (void *)v6,
          v4))
    {
LABEL_8:
      if (PLEXIFDateFormatter_onceToken != -1)
        dispatch_once(&PLEXIFDateFormatter_onceToken, &__block_literal_global_65);
      objc_msgSend((id)PLEXIFDateFormatter__dateFormatter, "dateFromString:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 && objc_msgSend(v5, "length"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0.%@"), v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "doubleValue");
        if (v11 <= 0.0 || v11 >= 1.0)
        {
          v9 = (void *)v4;
          v5 = v10;
        }
        else
        {
          objc_msgSend(v8, "dateByAddingTimeInterval:");
          v12 = objc_claimAutoreleasedReturnValue();

          v9 = (void *)v4;
          v5 = v10;
          v8 = (void *)v12;
        }
      }
      else
      {
        v9 = (void *)v4;
      }
      goto LABEL_18;
    }
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD090]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    v9 = 0;
    goto LABEL_18;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD088]);
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = 0;
  v9 = 0;
  v8 = 0;
  if (v4)
    goto LABEL_8;
LABEL_18:
  v13 = v8;

  return v13;
}

uint64_t PLPhysicalDeviceIsIPad()
{
  pl_dispatch_once(&PLPhysicalDeviceIsIPad___onceToken, &__block_literal_global);
  return PLPhysicalDeviceIsIPad___isIPad;
}

__IOSurface *PLCreateCGImageFromIOSurface(__IOSurface *a1)
{
  double Width;
  double Height;

  Width = (double)IOSurfaceGetWidth(a1);
  Height = (double)IOSurfaceGetHeight(a1);
  return PLCreateCGImageFromIOSurfaceScaledToSize(a1, 0, Width, Height);
}

__IOSurface *PLCreateCGImageFromIOSurfaceBackedUIImage(void *a1)
{
  return PLCreateCGImageFromIOSurface((__IOSurface *)objc_msgSend(a1, "ioSurface"));
}

uint64_t PLCreateImageFromPreviewImageSurface(__IOSurface *a1)
{
  return PLCreateImageAndJPEGDataFromPreviewImageSurface(a1, 0);
}

uint64_t PLCreateImageAndJPEGDataFromPreviewImageSurface(__IOSurface *a1, uint64_t a2)
{
  _BOOL4 v4;
  uint64_t v5;
  size_t Width;
  double v7;
  const __CFAllocator *v8;
  CVReturn v9;
  BOOL v10;
  BOOL v11;
  int v12;
  __CVBuffer *v13;
  __CVBuffer *v14;
  int IOSurfaceBackedCVPixelBuffer;
  BOOL v16;
  OSStatus v17;
  BOOL v18;
  __CVBuffer *v19;
  CVPixelBufferRef v20;
  int IOSurfaceBackedCVPixelBufferWithAttributes;
  BOOL v22;
  NSObject *v23;
  __CVBuffer *v25;
  IOSurfaceRef IOSurface;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  VTPixelTransferSessionRef pixelTransferSessionOut;
  CVPixelBufferRef pixelBufferOut;
  CVPixelBufferRef texture;
  _BYTE destinationBuffer[12];
  __int16 v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  _QWORD v39[2];
  _QWORD v40[3];

  v40[2] = *MEMORY[0x1E0C80C00];
  v4 = setupUIGraphicsFunctions();
  v5 = 0;
  if (!a1 || !v4)
    return v5;
  texture = 0;
  Width = IOSurfaceGetWidth(a1);
  +[PLAssetFormatsCore scaledSizeForSize:format:capLength:](PLAssetFormatsCore, "scaledSizeForSize:format:capLength:", +[PLAssetFormatsCore masterThumbnailFormat](PLAssetFormatsCore, "masterThumbnailFormat"), 1, (double)Width, (double)IOSurfaceGetHeight(a1));
  if ((double)Width / v7 <= 4.0)
  {
    v12 = CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a1, 0, &texture);
    v13 = texture;
    goto LABEL_25;
  }
  *(_QWORD *)destinationBuffer = 0;
  pixelTransferSessionOut = 0;
  pixelBufferOut = 0;
  v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v9 = CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a1, 0, &pixelBufferOut);
  if (v9)
    v10 = 1;
  else
    v10 = pixelBufferOut == 0;
  if (v10
    || ((v9 = VTPixelTransferSessionCreate(v8, &pixelTransferSessionOut)) == 0
      ? (v11 = pixelTransferSessionOut == 0)
      : (v11 = 1),
        v11))
  {
    v12 = v9;
    v13 = 0;
    v14 = 0;
    goto LABEL_23;
  }
  IOSurfaceBackedCVPixelBuffer = FigCreateIOSurfaceBackedCVPixelBuffer();
  v14 = *(__CVBuffer **)destinationBuffer;
  if (IOSurfaceBackedCVPixelBuffer)
    v16 = 1;
  else
    v16 = *(_QWORD *)destinationBuffer == 0;
  if (v16)
  {
    v12 = IOSurfaceBackedCVPixelBuffer;
LABEL_22:
    v13 = 0;
    goto LABEL_23;
  }
  v17 = VTPixelTransferSessionTransferImage(pixelTransferSessionOut, pixelBufferOut, *(CVPixelBufferRef *)destinationBuffer);
  v12 = v17;
  v14 = *(__CVBuffer **)destinationBuffer;
  if (v17)
    goto LABEL_22;
  v13 = CVPixelBufferRetain(*(CVPixelBufferRef *)destinationBuffer);
  texture = v13;
  v14 = *(__CVBuffer **)destinationBuffer;
LABEL_23:
  CVPixelBufferRelease(v14);
  CVPixelBufferRelease(pixelBufferOut);
  if (pixelTransferSessionOut)
    CFRelease(pixelTransferSessionOut);
LABEL_25:
  if (v12)
    v18 = 1;
  else
    v18 = v13 == 0;
  if (v18)
  {
    v19 = 0;
    v5 = 0;
    goto LABEL_45;
  }
  *(_QWORD *)destinationBuffer = 0;
  pixelBufferOut = 0;
  v12 = VTImageRotationSessionCreate();
  v19 = 0;
  v20 = pixelBufferOut;
  if (!v12 && pixelBufferOut)
  {
    VTSessionSetProperty(pixelBufferOut, (CFStringRef)*MEMORY[0x1E0CED6D0], (CFTypeRef)*MEMORY[0x1E0C9AE50]);
    IOSurfaceBackedCVPixelBufferWithAttributes = FigCreateIOSurfaceBackedCVPixelBufferWithAttributes();
    if (IOSurfaceBackedCVPixelBufferWithAttributes)
      v22 = 1;
    else
      v22 = *(_QWORD *)destinationBuffer == 0;
    if (v22 || (IOSurfaceBackedCVPixelBufferWithAttributes = MEMORY[0x19AEC290C](pixelBufferOut, texture)) != 0)
    {
      v12 = IOSurfaceBackedCVPixelBufferWithAttributes;
      v19 = 0;
    }
    else
    {
      v25 = CVPixelBufferRetain(*(CVPixelBufferRef *)destinationBuffer);
      v19 = v25;
      if (v25)
      {
        IOSurface = CVPixelBufferGetIOSurface(v25);
        v5 = sUICreateCGImageFromIOSurface(IOSurface);
        v12 = 0;
        if (a2 && IOSurface)
        {
          v27 = *MEMORY[0x1E0D09418];
          v40[0] = &unk_1E378EFA8;
          v28 = *MEMORY[0x1E0D09410];
          v39[0] = v27;
          v39[1] = v28;
          v37 = *MEMORY[0x1E0D09618];
          v38 = &unk_1E378F950;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v40[1] = v29;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          v12 = PFFigJPEGDataFromImage();
        }
LABEL_40:
        v20 = pixelBufferOut;
        if (!pixelBufferOut)
          goto LABEL_44;
        goto LABEL_43;
      }
      v12 = 0;
    }
    v5 = 0;
    goto LABEL_40;
  }
  v5 = 0;
  if (pixelBufferOut)
LABEL_43:
    CFRelease(v20);
LABEL_44:
  CVPixelBufferRelease(*(CVPixelBufferRef *)destinationBuffer);
  v13 = texture;
LABEL_45:
  CVPixelBufferRelease(v13);
  CVPixelBufferRelease(v19);
  if (v12)
  {
    PLBackendGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)destinationBuffer = 136315394;
      *(_QWORD *)&destinationBuffer[4] = "CGImageRef PLCreateImageAndJPEGDataFromPreviewImageSurface(CFTypeRef, NSData *_"
                                         "_autoreleasing *, UIImageOrientation)";
      v35 = 2048;
      v36 = v12;
      _os_log_impl(&dword_199DF7000, v23, OS_LOG_TYPE_DEFAULT, "%s error %ld", destinationBuffer, 0x16u);
    }

  }
  return v5;
}

id PLCreateJPEGDataFromPreviewImageSurface(IOSurfaceRef surface, unint64_t a2)
{
  CVReturn v3;
  __CVBuffer *v4;
  BOOL v5;
  id v6;
  int v8;
  __CVBuffer *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  CVPixelBufferRef pixelBufferOut;
  CVPixelBufferRef texture[3];
  uint64_t v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  if (!surface)
    return 0;
  pixelBufferOut = 0;
  v3 = CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x1E0C9AE00], surface, 0, &pixelBufferOut);
  v4 = pixelBufferOut;
  if (pixelBufferOut)
    v5 = v3 == 0;
  else
    v5 = 0;
  if (v5)
  {
    if (a2 > 7)
      goto LABEL_25;
    if (((1 << a2) & 0x22) != 0)
    {
      v8 = 1;
    }
    else if (((1 << a2) & 0x44) != 0)
    {
      v8 = 0;
    }
    else
    {
      if (((1 << a2) & 0x88) == 0)
        goto LABEL_25;
      v8 = 0;
    }
    texture[0] = 0;
    v9 = 0;
    if (!VTImageRotationSessionCreate())
    {
      VTSessionSetProperty(0, (CFStringRef)*MEMORY[0x1E0CED6D0], (CFTypeRef)*MEMORY[0x1E0C9AE50]);
      if (v8)
      {
        CVPixelBufferGetWidth(pixelBufferOut);
        CVPixelBufferGetHeight(pixelBufferOut);
      }
      else
      {
        CVPixelBufferGetHeight(pixelBufferOut);
        CVPixelBufferGetWidth(pixelBufferOut);
      }
      CVPixelBufferGetPixelFormatType(pixelBufferOut);
      v9 = 0;
      if (!FigCreateIOSurfaceBackedCVPixelBufferWithAttributes())
      {
        if (MEMORY[0x19AEC290C](0, pixelBufferOut, texture[0]))
          v9 = 0;
        else
          v9 = CVPixelBufferRetain(texture[0]);
      }
    }
    CVPixelBufferRelease(texture[0]);
    if (v9)
      goto LABEL_26;
    v4 = pixelBufferOut;
LABEL_25:
    v9 = CVPixelBufferRetain(v4);
    if (!v9)
    {
      v6 = 0;
LABEL_31:
      CVPixelBufferRelease(v9);
      v4 = pixelBufferOut;
      goto LABEL_32;
    }
LABEL_26:
    v10 = *MEMORY[0x1E0D09418];
    v21[0] = &unk_1E378EFA8;
    v11 = *MEMORY[0x1E0D09410];
    v20[0] = v10;
    v20[1] = v11;
    v18 = *MEMORY[0x1E0D09618];
    v19 = &unk_1E378F950;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = PFFigJPEGDataFromImage();
    v6 = 0;
    if (v14)
    {
      PLBackendGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        LODWORD(texture[0]) = 136315138;
        *(CVPixelBufferRef *)((char *)texture + 4) = (CVPixelBufferRef)"NSData *PLCreateJPEGDataFromPreviewImageSurface(C"
                                                                       "FTypeRef, UIImageOrientation)";
        _os_log_impl(&dword_199DF7000, v15, OS_LOG_TYPE_ERROR, "Error received from PFFigJPEGDataFromImage() in %s", (uint8_t *)texture, 0xCu);
      }

    }
    goto LABEL_31;
  }
  v6 = 0;
LABEL_32:
  CVPixelBufferRelease(v4);
  return v6;
}

double DCIMScaledSizeForFormat(uint64_t a1, double a2, double a3)
{
  double v5;
  double v6;

  +[PLAssetFormatsCore sizeForFormat:](PLAssetFormatsCore, "sizeForFormat:", a1);
  return PLScaledSizeWithinSizeCore(a2, a3, v5, v6);
}

id PLCreateScaledImageFromImage(void *a1, void *a2, uint64_t a3, _QWORD *a4, CGFloat a5, CGFloat a6)
{
  id v11;
  id v12;
  _BOOL4 v13;
  id v14;
  BOOL v15;
  int v16;
  size_t v17;
  uint32_t v18;
  double v19;
  double v20;
  CGFloat v21;
  int v22;
  CGFloat v23;
  CGFloat v24;
  void *v25;
  CGColorSpace *DeviceRGB;
  id v27;
  CGContext *v28;
  id v30;
  CGAffineTransform v31;

  v11 = a1;
  v12 = a2;
  v13 = setupUIGraphicsFunctions();
  v14 = 0;
  if (v11 && v13)
  {
    v15 = a3 == 1;
    if (a3 == 1)
      v16 = 2;
    else
      v16 = 4;
    if (v15)
      v17 = 5;
    else
      v17 = 8;
    if (v15)
      v18 = 4102;
    else
      v18 = 2;
    v19 = PLScaledImageSizeForPLImage(v11);
    v21 = v20;
    v22 = ((int)(a5 * (double)v16) + 8 * v16 - 1) / (8 * v16) * 8 * v16;
    v24 = *MEMORY[0x1E0C9D538];
    v23 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", (int)(a6 * (double)v22));
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v27 = objc_retainAutorelease(v25);
    v28 = CGBitmapContextCreate((void *)objc_msgSend(v27, "mutableBytes"), (unint64_t)a5, (unint64_t)a6, v17, v22, DeviceRGB, v18);
    CGContextTranslateCTM(v28, 0.0, a6);
    CGContextScaleCTM(v28, 1.0, -1.0);
    CGAffineTransformMakeScale(&v31, 1.0, -1.0);
    CGContextSetBaseCTM();
    sUIGraphicsPushContext(v28);
    v30 = 0;
    PLCreateCroppedImageInContextFromImageWithQuality(v11, v12, v28, kCGInterpolationHigh, &v30, v24, v23, v19, v21, a5, a6);
    v14 = v30;
    sUIGraphicsPopContext(v14);
    CGContextRelease(v28);
    CGColorSpaceRelease(DeviceRGB);
    if (a4)
      *a4 = objc_retainAutorelease(v27);

  }
  return v14;
}

double PLScaledImageSizeForPLImage(void *a1)
{
  id v1;
  double v2;
  double v3;

  v1 = a1;
  v2 = DCIM_sizeFromPLImage(v1);
  v3 = DCIM_scaleFromPLImage(v1);

  return v2 * v3;
}

void PLCreateCroppedImageInContextFromImageWithQuality(void *a1, void *a2, CGContext *a3, CGInterpolationQuality a4, _QWORD *a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9, CGFloat a10, CGFloat a11)
{
  id v19;
  id v20;
  void *v21;
  float v22;
  float v23;
  double v24;
  double v25;
  double v26;
  double MidX;
  CGFloat MidY;
  float v29;
  float v30;
  unint64_t v31;
  CGFloat *v32;
  CGFloat *v33;
  CGFloat *v34;
  CGFloat v35;
  CGFloat *v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  id v42;
  CGImage *v43;
  CGFloat Width;
  CGFloat v45;
  CGFloat v46;
  CGImage *Image;
  double v48;
  double v49;
  double v52;
  CGAffineTransform transform;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;

  v19 = a1;
  v20 = a2;
  CGContextSaveGState(a3);
  if (a4)
    CGContextSetInterpolationQuality(a3, a4);
  CGContextTranslateCTM(a3, 0.0, a11);
  CGContextScaleCTM(a3, 1.0, -1.0);
  -[objc_class blackColor](NSClassFromString((NSString *)CFSTR("UIColor")), "blackColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  CGContextSetFillColorWithColor(a3, (CGColorRef)objc_msgSend(v21, "CGColor"));
  v54.origin.x = 0.0;
  v54.origin.y = 0.0;
  v54.size.width = a10;
  v54.size.height = a11;
  CGContextFillRect(a3, v54);
  v48 = a10 * 0.5;
  CGContextTranslateCTM(a3, a10 * 0.5, a11 * 0.5);
  v22 = a10 / a8;
  v23 = a11 / a9;
  CGContextScaleCTM(a3, v22, v23);
  v52 = a10;
  v49 = a10 * -0.5;
  CGContextTranslateCTM(a3, a10 * -0.5, a11 * -0.5);
  v24 = PLScaledImageSizeForPLImage(v19);
  v26 = v25;
  v55.origin.x = a6;
  v55.origin.y = a7;
  v55.size.width = a8;
  v55.size.height = a9;
  MidX = CGRectGetMidX(v55);
  v56.origin.x = a6;
  v56.origin.y = a7;
  v56.size.width = a8;
  v56.size.height = a9;
  MidY = CGRectGetMidY(v56);
  v29 = v24 * 0.5 - MidX;
  v30 = MidY + v26 * -0.5;
  CGContextTranslateCTM(a3, v29, v30);
  v31 = objc_msgSend(v19, "imageOrientation") - 1;
  if (v31 >= 7)
  {
    v36 = (CGFloat *)MEMORY[0x1E0C9BAA8];
    v34 = (CGFloat *)(MEMORY[0x1E0C9BAA8] + 8);
    v33 = (CGFloat *)(MEMORY[0x1E0C9BAA8] + 16);
    v32 = (CGFloat *)(MEMORY[0x1E0C9BAA8] + 24);
    v35 = *(double *)(MEMORY[0x1E0C9BAA8] + 32);
    v37 = *(double *)(MEMORY[0x1E0C9BAA8] + 40);
  }
  else
  {
    v32 = (CGFloat *)((char *)&unk_199EB0848 + 8 * v31);
    v33 = (CGFloat *)((char *)&unk_199EB0880 + 8 * v31);
    v34 = (CGFloat *)((char *)&unk_199EB08B8 + 8 * v31);
    v35 = 0.0;
    v36 = (CGFloat *)((char *)&unk_199EB08F0 + 8 * v31);
    v37 = 0.0;
  }
  v38 = *v36;
  v39 = *v34;
  v40 = *v33;
  v41 = *v32;
  CGContextTranslateCTM(a3, v48, a11 * 0.5);
  transform.a = v38;
  transform.b = v39;
  transform.c = v40;
  transform.d = v41;
  transform.tx = v35;
  transform.ty = v37;
  CGContextConcatCTM(a3, &transform);
  CGContextTranslateCTM(a3, v49, a11 * -0.5);
  v42 = objc_retainAutorelease(v19);
  v43 = (CGImage *)objc_msgSend(v42, "CGImage");
  Width = (double)CGImageGetWidth(v43);
  v57.size.height = (double)CGImageGetHeight(v43);
  v57.origin.x = (v52 - Width) * 0.5;
  v57.origin.y = (a11 - v57.size.height) * 0.5;
  v57.size.width = Width;
  CGContextDrawImage(a3, v57, v43);
  CGContextRestoreGState(a3);
  if (v20)
  {
    CGContextSaveGState(a3);
    objc_msgSend(v20, "frame");
    CGContextTranslateCTM(a3, v45, v46);
    objc_msgSend(v20, "renderInContext:", a3);
    CGContextRestoreGState(a3);
  }
  if (a5)
  {
    Image = CGBitmapContextCreateImage(a3);
    *a5 = (id)objc_msgSend(objc_alloc(NSClassFromString((NSString *)CFSTR("UIImage"))), "initWithCGImage:scale:orientation:", Image, 0, 1.0);
    CGImageRelease(Image);
  }

}

double DCIM_sizeFromPLImage(void *a1)
{
  id v1;
  void *v2;
  double v3;
  double v4;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "size");
    v4 = v3;
  }
  else
  {
    v4 = *MEMORY[0x1E0C9D820];
  }

  return v4;
}

double DCIM_scaleFromPLImage(void *a1)
{
  id v1;
  double v2;
  double v3;

  v1 = a1;
  NSClassFromString((NSString *)CFSTR("UIImage"));
  v2 = 1.0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v1, "scale");
    v2 = v3;
  }

  return v2;
}

uint64_t PLSubsampleFactorForImageSizeScaledToSize(double a1, double a2, double a3, double a4)
{
  int v4;
  double v5;
  float v6;
  int v7;

  v4 = (int)a2;
  if ((int)a2 <= (int)a1)
    v4 = (int)a1;
  if (a3 >= a4)
    v5 = a3;
  else
    v5 = a4;
  v6 = floor(log2((double)(int)((double)v4 / v5)));
  v7 = (int)exp2f(v6);
  if (v7 >= 32)
    v7 = 32;
  if (v7 <= 1)
    return 1;
  else
    return v7;
}

id PLCreateImageWithFormatFromImage(void *a1, void *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  id v18;

  v9 = a2;
  v10 = a1;
  v11 = DCIM_sizeFromPLImage(v10);
  v13 = v12;
  +[PLAssetFormatsCore sizeForFormat:](PLAssetFormatsCore, "sizeForFormat:", a3);
  v16 = PLScaledSizeWithinSizeCore(v11, v13, v14, v15);
  v18 = PLCreateScaledImageFromImage(v10, v9, a4, a5, v16, v17);

  return v18;
}

double PLSquareCropRectForSize(double a1, double a2)
{
  BOOL v2;
  double v3;
  float v4;
  float v5;
  double result;

  v2 = a1 > a2;
  if (a1 >= a2)
    v3 = a2;
  else
    v3 = a1;
  v4 = v3;
  v5 = (a1 - v4) * 0.5;
  result = rintf(v5);
  if (!v2)
    return 0.0;
  return result;
}

uint64_t DCIM_CGImageRefFromPLImage(void *a1)
{
  return objc_msgSend(objc_retainAutorelease(a1), "CGImage");
}

id PLCreateCroppedImageFromImageWithQuality(void *a1, CGInterpolationQuality a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, double a7, CGFloat a8)
{
  id v15;
  CGColorSpace *DeviceRGB;
  CGContext *v17;
  id v18;
  NSObject *v19;
  id v21;
  uint8_t buf[4];
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v15 = a1;
  if (!v15)
  {
LABEL_7:
    v18 = 0;
    goto LABEL_8;
  }
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v17 = CGBitmapContextCreate(0, (unint64_t)a7, (unint64_t)a8, 8uLL, vcvtd_n_u64_f64(a7, 2uLL), DeviceRGB, 5u);
  CGColorSpaceRelease(DeviceRGB);
  if (!v17)
  {
    PLBackendGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "PLImage *PLCreateCroppedImageFromImageWithQuality(PLImage *__strong, CGRect, CGSize, CGInterpolationQuality)";
      _os_log_impl(&dword_199DF7000, v19, OS_LOG_TYPE_ERROR, "%s: failed to create context", buf, 0xCu);
    }

    goto LABEL_7;
  }
  CGContextTranslateCTM(v17, 0.0, a8);
  CGContextScaleCTM(v17, 1.0, -1.0);
  v21 = 0;
  PLCreateCroppedImageInContextFromImageWithQuality(v15, 0, v17, a2, &v21, a3, a4, a5, a6, a7, a8);
  v18 = v21;
  CGContextRelease(v17);
LABEL_8:

  return v18;
}

id PLCreateCroppedImageFromImage(void *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, double a6, CGFloat a7)
{
  return PLCreateCroppedImageFromImageWithQuality(a1, kCGInterpolationDefault, a2, a3, a4, a5, a6, a7);
}

id DCIM_newPLImageWithContentsOfFileURL(void *a1, int a2)
{
  const __CFURL *v3;
  const __CFURL *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFDictionary *v12;
  CGImageSource *v13;
  CGImage *ImageAtIndex;
  CGImageSource *v15;
  void *v16;
  uint64_t v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = v3;
  if (a2)
  {
    v5 = _os_feature_enabled_impl();
    v6 = (void *)MEMORY[0x1E0C99E08];
    v7 = *MEMORY[0x1E0CBD1A0];
    v21[0] = *MEMORY[0x1E0CBD1B0];
    v8 = *MEMORY[0x1E0CBD1A8];
    v20[0] = v7;
    v20[1] = v8;
    v18 = *MEMORY[0x1E0CBC6B0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryWithDictionary:", v11);
    v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    v13 = CGImageSourceCreateWithURL(v4, 0);
    ImageAtIndex = CGImageSourceCreateImageAtIndex(v13, 0, v12);
    v15 = _ImageOrientationFromImageSource(v13);
    v16 = (void *)objc_msgSend(objc_alloc(NSClassFromString((NSString *)CFSTR("UIImage"))), "initWithCGImage:scale:orientation:", ImageAtIndex, v15, 1.0);
    CGImageRelease(ImageAtIndex);
    if (v13)
      CFRelease(v13);
  }
  else
  {
    -[__CFURL path](v3, "path");
    v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    DCIM_newPLImageWithContentsOfFile(v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

uint64_t DCIM_NSStringFromCGAffineTransform(_QWORD *a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%0.2f, %0.2f, %0.2f, %0.2f, %0.2f, %0.2f}"), *a1, a1[1], a1[2], a1[3], a1[4], a1[5]);
}

double DCIM_sizeScale(double a1, double a2, double a3)
{
  return a1 * a3;
}

double DCIM_sizeScaleToFillSize(double a1, double a2, double a3, double a4)
{
  return fmax(a3 / a1, a4 / a2);
}

double DCIM_sizeScaleToFitSize(double a1, double a2, double a3, double a4)
{
  return fmin(a3 / a1, a4 / a2);
}

id DCIM_scaleImageFromURL(void *a1, double a2, double a3)
{
  id v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  int CGImageFromImageData;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v5 = a1;
  if (v5)
  {
    v23 = *MEMORY[0x1E0D09568];
    if (a2 >= a3)
      v6 = a2;
    else
      v6 = a3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:", v5);
    CGImageFromImageData = PFFigCreateCGImageFromImageData();
    if (CGImageFromImageData)
    {
      PLPhotoKitGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v18 = "PLImage *DCIM_scaleImageFromURL(NSURL *__strong, CGSize, UIImageOrientation)";
        v19 = 2048;
        v20 = CGImageFromImageData;
        v21 = 2112;
        v22 = v5;
        _os_log_impl(&dword_199DF7000, v11, OS_LOG_TYPE_DEFAULT, "PFFigCreateCGImageFromImageData %s returned %ld from %@", buf, 0x20u);
      }

    }
    objc_msgSend(v5, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    DCIM_newPLImageWithContentsOfFile(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    DCIM_resizedImage(v13, a2, a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v14;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

id DCIM_resizedImage(void *a1, double a2, double a3)
{
  id v5;
  void (*v6)(double, double);
  id v7;
  void *v8;

  v5 = a1;
  if (v5 && setupUIGraphicsFunctions())
  {
    v6 = (void (*)(double, double))sUIGraphicsBeginImageContext;
    v7 = v5;
    v6(a2, a3);
    objc_msgSend(v7, "drawInRect:", 0.0, 0.0, a2, a3);

    sUIGraphicsGetImageFromCurrentImageContext();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    sUIGraphicsEndImageContext();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t DCIM_blackColorRef()
{
  void *v0;
  uint64_t v1;

  -[objc_class blackColor](NSClassFromString((NSString *)CFSTR("UIColor")), "blackColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "CGColor");

  return v1;
}

uint64_t DCIM_blackColor()
{
  return -[objc_class blackColor](NSClassFromString((NSString *)CFSTR("UIColor")), "blackColor");
}

uint64_t DCIM_whiteColor()
{
  return -[objc_class whiteColor](NSClassFromString((NSString *)CFSTR("UIColor")), "whiteColor");
}

uint64_t DCIM_redColor()
{
  return -[objc_class redColor](NSClassFromString((NSString *)CFSTR("UIColor")), "redColor");
}

uint64_t DCIM_greenColor()
{
  return -[objc_class greenColor](NSClassFromString((NSString *)CFSTR("UIColor")), "greenColor");
}

uint64_t DCIM_blueColor()
{
  return -[objc_class blueColor](NSClassFromString((NSString *)CFSTR("UIColor")), "blueColor");
}

id DCIM_resolvedPlaceholderImageColor()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[objc_class mainScreen](NSClassFromString((NSString *)CFSTR("UIScreen")), "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class systemBackgroundColor](NSClassFromString((NSString *)CFSTR("UIColor")), "systemBackgroundColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class quaternarySystemFillColor](NSClassFromString((NSString *)CFSTR("UIColor")), "quaternarySystemFillColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_colorBlendedWithColor:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resolvedColorWithTraitCollection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

CFStringRef DCIM_NSStringFromCGRect(double a1, double a2, double a3, double a4)
{
  return (id)CFStringCreateWithFormat(0, 0, CFSTR("{{%.*g, %.*g}, {%.*g, %.*g}}"), 17, *(_QWORD *)&a1, 17, *(_QWORD *)&a2, 17, *(_QWORD *)&a3, 17, *(_QWORD *)&a4);
}

uint64_t DCIM_newResizablePLImageWithCGImage(uint64_t a1, uint64_t a2, double a3)
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(objc_alloc(NSClassFromString((NSString *)CFSTR("UIImage"))), "initWithCGImage:scale:orientation:", a1, a2, a3);
  objc_msgSend(v3, "resizableImageWithCapInsets:", 0.0, 0.0, 0.0, 0.0);
  v4 = objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t DCIM_newPLImageWithData(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  v2 = objc_msgSend(objc_alloc(NSClassFromString((NSString *)CFSTR("UIImage"))), "initWithData:", v1);

  return v2;
}

uint64_t DCIM_newPLImageWithIOSurface(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(objc_alloc(NSClassFromString((NSString *)CFSTR("UIImage"))), "_initWithIOSurface:imageOrientation:", a1, a2);
}

uint64_t DCIM_boldSystemFontOfSize(double a1)
{
  return -[objc_class boldSystemFontOfSize:](NSClassFromString((NSString *)CFSTR("UIFont")), "boldSystemFontOfSize:", a1);
}

double DCIM_boundsFromMainScreen()
{
  void *v0;
  void *v1;
  double v2;
  double v3;

  -[objc_class mainScreen](NSClassFromString((NSString *)CFSTR("UIScreen")), "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
  {
    objc_msgSend(v0, "bounds");
    v3 = v2;
  }
  else
  {
    v3 = *MEMORY[0x1E0C9D648];
  }

  return v3;
}

double DCIM_boundsFromScreen(void *a1)
{
  double result;

  if (!a1)
    return *MEMORY[0x1E0C9D648];
  objc_msgSend(a1, "bounds");
  return result;
}

double DCIM_scaleFromMainScreen()
{
  void *v0;
  void *v1;
  double v2;
  double v3;

  -[objc_class mainScreen](NSClassFromString((NSString *)CFSTR("UIScreen")), "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
  {
    objc_msgSend(v0, "scale");
    v3 = v2;
  }
  else
  {
    v3 = 1.0;
  }

  return v3;
}

double DCIM_scaleFromScreen(void *a1, const char *a2)
{
  double result;

  if (!a1)
    return 1.0;
  objc_msgSend(a1, "scale");
  return result;
}

const __CFString *DCIM_applicationWillResignActiveNotificationName()
{
  return CFSTR("UIApplicationWillResignActiveNotification");
}

const __CFString *DCIM_applicationDidBecomeActiveNotificationName()
{
  return CFSTR("UIApplicationDidBecomeActiveNotification");
}

const __CFString *DCIM_applicationSuspendedEventsOnlyNotificationName()
{
  return CFSTR("UIApplicationSuspendedEventsOnlyNotification");
}

id DCIM_currentDeviceModelName()
{
  void *v0;
  void *v1;

  -[objc_class currentDevice](NSClassFromString((NSString *)CFSTR("UIDevice")), "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "model");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id DCIM_labelAttributesWithFontAndColor(void *a1, void *a2)
{
  void *v2;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v2 = 0;
  v9[2] = *MEMORY[0x1E0C80C00];
  if (a1 && a2)
  {
    v8[0] = CFSTR("NSFont");
    v8[1] = CFSTR("NSForegroundColor");
    v9[0] = a1;
    v9[1] = a2;
    v4 = (void *)MEMORY[0x1E0C99D80];
    v5 = a2;
    v6 = a1;
    objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

id DCIM_ASCIIDescriptionForPLImage(void *a1)
{
  id v1;
  double v2;
  double v3;
  double v4;
  void *v5;
  int64_t v6;
  int64_t v7;
  id v8;
  BOOL v9;
  void *v10;
  CGColorSpace *DeviceGray;
  CGContext *v12;
  id v13;
  CGImage *v14;
  double v15;
  uint64_t v16;
  double v17;
  __int128 v18;
  __int128 v19;
  CGFloat v20;
  CGFloat v21;
  unsigned __int8 *Data;
  size_t BytesPerRow;
  _DWORD *v24;
  _DWORD *v25;
  uint64_t v26;
  _DWORD *v27;
  unsigned __int8 *v28;
  _DWORD *v29;
  int64_t v30;
  int v31;
  unsigned int v32;
  void *v33;
  CGAffineTransform transform;
  CGRect v36;

  v1 = a1;
  v2 = DCIM_sizeFromPLImage(v1);
  v4 = 700.0 / v2;
  if (700.0 / v2 >= 1300.0 / v3)
    v4 = 1300.0 / v3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = vcvtpd_s64_f64(v2 * v4 / 7.0);
  v7 = vcvtpd_s64_f64(v3 * v4 / 13.0);
  v8 = v1;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (v9)
  {
    v10 = 0;
  }
  else
  {
    DeviceGray = CGColorSpaceCreateDeviceGray();
    v12 = CGBitmapContextCreate(0, v6, v7, 8uLL, 0, DeviceGray, 0);
    CGColorSpaceRelease(DeviceGray);
    v13 = objc_retainAutorelease(v8);
    v14 = (CGImage *)objc_msgSend(v13, "CGImage");
    CGContextSaveGState(v12);
    v15 = (double)v6;
    v16 = objc_msgSend(v13, "imageOrientation");
    if (((v16 - 2) & 0xFFFFFFFFFFFFFFFALL) != 0)
      v17 = (double)v7;
    else
      v17 = (double)v6;
    if (((v16 - 2) & 0xFFFFFFFFFFFFFFFALL) == 0)
      v15 = (double)v7;
    switch(objc_msgSend(v13, "imageOrientation"))
    {
      case 1:
        v18 = xmmword_199EB0300;
        v19 = xmmword_199EB02F0;
        v20 = v15;
        goto LABEL_21;
      case 2:
        v18 = xmmword_199EB02F0;
        v19 = xmmword_199EB0320;
        v21 = 0.0;
        v20 = v17;
        break;
      case 3:
        v18 = xmmword_199EB0310;
        v19 = xmmword_199EB0300;
        v20 = 0.0;
        goto LABEL_23;
      case 4:
        v18 = xmmword_199EB0320;
        v19 = xmmword_199EB02F0;
        v21 = 0.0;
        v20 = v15;
        break;
      case 5:
        v18 = xmmword_199EB0300;
        v19 = xmmword_199EB0310;
        v20 = 0.0;
LABEL_21:
        v21 = v17;
        break;
      case 6:
        v18 = xmmword_199EB02F0;
        v19 = xmmword_199EB0300;
        v20 = v17;
LABEL_23:
        v21 = v15;
        break;
      case 7:
        v18 = xmmword_199EB0310;
        v19 = xmmword_199EB0320;
        v20 = 0.0;
        v21 = 0.0;
        break;
      default:
        v19 = *MEMORY[0x1E0C9BAA8];
        v18 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        v20 = *(double *)(MEMORY[0x1E0C9BAA8] + 32);
        v21 = *(double *)(MEMORY[0x1E0C9BAA8] + 40);
        break;
    }
    *(_OWORD *)&transform.a = v19;
    *(_OWORD *)&transform.c = v18;
    transform.tx = v20;
    transform.ty = v21;
    CGContextConcatCTM(v12, &transform);
    v36.origin.x = 0.0;
    v36.origin.y = 0.0;
    v36.size.width = v15;
    v36.size.height = v17;
    CGContextDrawImage(v12, v36, v14);
    CGContextRestoreGState(v12);
    Data = (unsigned __int8 *)CGBitmapContextGetData(v12);
    BytesPerRow = CGBitmapContextGetBytesPerRow(v12);
    v24 = malloc_type_malloc(4 * v7 * (v6 + 1), 0x53995AEFuLL);
    v25 = v24;
    if (v7 >= 1)
    {
      v26 = 0;
      v27 = v24;
      do
      {
        v28 = Data;
        v29 = v27;
        v30 = v6;
        if (v6 >= 1)
        {
          do
          {
            v31 = *v28++;
            v32 = (171 * (v31 ^ 0xFFu)) >> 9;
            if (v32 >= 0x45)
              v32 = 69;
            *v29++ = CharacterForBrightness_chars[v32];
            --v30;
          }
          while (v30);
        }
        v25[++v26 * (v6 + 1) - 1] = 10;
        v27 += v6 + 1;
        Data += BytesPerRow;
      }
      while (v26 != v7);
    }
    CGContextRelease(v12);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v25, 4 * v7 * (v6 + 1), 2617245952, 1);
  }

  objc_msgSend(v5, "stringWithFormat:", CFSTR("\n%@"), v10);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

uint64_t DCIM_NSValueFromCGSize()
{
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithSize:");
}

uint64_t DCIM_NSValueFromCGPoint()
{
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPoint:");
}

uint64_t DCIM_NSValueFromCGRect()
{
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:");
}

uint64_t DCIM_NSValueToCGAffineTransform@<X0>(void *a1@<X0>, _OWORD *x8_0@<X8>)
{
  x8_0[1] = 0u;
  x8_0[2] = 0u;
  *x8_0 = 0u;
  return objc_msgSend(a1, "getValue:", x8_0);
}

uint64_t DCIM_newJPEGRepresentationWithPLImage(void *a1, double a2)
{
  id v3;
  uint64_t v4;

  v3 = a1;
  if (setupUIGraphicsFunctions())
  {
    s_UIImageJPEGRepresentation(v3, 1, a2);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t DCIM_newPNGRepresentationWithPLImage(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  if (objc_msgSend(v1, "CGImage") && setupUIGraphicsFunctions())
  {
    sUIImagePNGRepresentation(v1);
    v2 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id DCIM_imageWithColor(void *a1, double a2, double a3)
{
  id v5;
  uint64_t v6;
  CGContext *CurrentContext;
  void *v8;
  CGRect v10;

  v5 = a1;
  if (v5 && setupUIGraphicsFunctions())
  {
    v6 = sUIGraphicsBeginImageContext(a2, a3);
    CurrentContext = (CGContext *)sUIGraphicsGetCurrentContext(v6);
    CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v5, "CGColor"));
    v10.origin.x = 0.0;
    v10.origin.y = 0.0;
    v10.size.width = a2;
    v10.size.height = a3;
    CGContextFillRect(CurrentContext, v10);
    sUIGraphicsGetImageFromCurrentImageContext();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    sUIGraphicsEndImageContext();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t DCIM_IS_PAD()
{
  if (DCIM_IS_PAD_onceToken != -1)
    dispatch_once(&DCIM_IS_PAD_onceToken, &__block_literal_global_54);
  return DCIM_IS_PAD_retval;
}

id DCIM_newPLImageWithStoredJPEGData(void *a1)
{
  id v1;
  void *v2;
  int CVPixelBufferFromImageData;
  int v4;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  const __CFString *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    v14 = *MEMORY[0x1E0D09558];
    v15[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    CVPixelBufferFromImageData = PFFigCreateCVPixelBufferFromImageData();
    if (CVPixelBufferFromImageData)
    {
      v4 = CVPixelBufferFromImageData;
      PLBackendGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v9 = CFSTR("DCIM_newPLImageWithStoredJPEGData");
        v10 = 2048;
        v11 = v4;
        v12 = 2048;
        v13 = objc_msgSend(v1, "length");
        _os_log_impl(&dword_199DF7000, v5, OS_LOG_TYPE_DEFAULT, "PFFigCreateCVPixelBufferFromImageData %@ returned %ld from %lu", buf, 0x20u);
      }

    }
  }
  v6 = (void *)DCIM_newPLImageWithData(v1);
  if (v6)
    objc_setAssociatedObject(v6, CFSTR("PLImageJPEGDataKey"), v1, (void *)0x301);

  return v6;
}

id DCIM_storedJPEGDataFromImage(void *a1)
{
  return objc_getAssociatedObject(a1, CFSTR("PLImageJPEGDataKey"));
}

void DCIM_decorateThumbnailWithTime(CGContext *a1, void *a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  _BOOL4 v16;
  void *v17;
  void *v18;
  Class v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  id v30;

  v30 = a2;
  v16 = setupUIGraphicsFunctions();
  v17 = v30;
  if (v16)
  {
    if (objc_msgSend(v30, "unsignedIntegerValue") == 0x7FFFFFFFFFFFFFFFLL)
    {
      v18 = 0;
    }
    else
    {
      v19 = NSClassFromString((NSString *)CFSTR("UIMovieScrubber"));
      objc_msgSend(v30, "doubleValue");
      -[objc_class timeStringForSeconds:forceFullWidthComponents:isElapsed:](v19, "timeStringForSeconds:forceFullWidthComponents:isElapsed:", (int)rint(v20), 0, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (objc_msgSend(v18, "length"))
    {
      sUIGraphicsPushContext(a1);
      CGContextScaleCTM(a1, 1.0, -1.0);
      CGContextTranslateCTM(a1, 0.0, -a4);
      v21 = ceil(a4 - a8 - a6) + -1.0;
      pl_dispatch_once(&PLPhysicalScreenScale_didCheck, &__block_literal_global_133_3455);
      v22 = a7 + *(double *)&PLPhysicalScreenScale_screenScale * -5.0 * a9;
      -[objc_class whiteColor](NSClassFromString((NSString *)CFSTR("UIColor")), "whiteColor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "set");

      pl_dispatch_once(&PLPhysicalScreenScale_didCheck, &__block_literal_global_133_3455);
      -[objc_class boldSystemFontOfSize:](NSClassFromString((NSString *)CFSTR("UIFont")), "boldSystemFontOfSize:", *(double *)&PLPhysicalScreenScale_screenScale * 12.0 * a9);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_legacy_sizeWithFont:constrainedToSize:lineBreakMode:", v24, 2, v22, a8);
      v26 = round(v21 + (a8 - v25) * 0.5);
      if (v25 >= a8)
        v27 = v21;
      else
        v27 = v26;
      if (v25 >= a8)
        v28 = a8;
      else
        v28 = v25;
      v29 = objc_msgSend(v18, "_legacy_drawInRect:withFont:lineBreakMode:alignment:", v24, 2, 2, a5, v27, v22, v28);
      sUIGraphicsPopContext(v29);

    }
    v17 = v30;
  }

}

Class DCIM_isApplicationSuspended()
{
  Class result;
  void *v1;
  uint64_t v2;

  result = NSClassFromString((NSString *)CFSTR("UIApplication"));
  if (result)
  {
    -[objc_class sharedApplication](NSClassFromString((NSString *)CFSTR("UIApplication")), "sharedApplication");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "isSuspended");

    return (Class)v2;
  }
  return result;
}

char *DCIM_MakeUniqueDirectoryWithPath(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  char *v4;
  char *v5;
  void *v6;
  void *v8;
  char v9;
  char __s[1024];
  char v11;
  char v12[16];
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0CB2AA8];
  v14[0] = &unk_1E378EFD8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "fileExistsAtPath:", v1) & 1) != 0
    || !objc_msgSend(v2, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v1, 1, v3, 0)|| (v4 = (char *)v1) == 0)
  {
    strcpy(v12, ".tmp.XXXXXX");
    if (objc_msgSend(v1, "getFileSystemRepresentation:maxLength:", __s, 1023))
    {
      v11 = 0;
      v5 = &__s[strlen(__s)];
      objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      sprintf(v5, "-T%p", v6);

      __strcat_chk();
      v4 = mkdtemp(__s);
      if (v4)
      {
LABEL_6:
        objc_msgSend(v2, "stringWithFileSystemRepresentation:length:", v4, strlen(v4));
        v4 = (char *)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
      if (*__error() == 2)
      {
        objc_msgSend(v1, "stringByDeletingLastPathComponent");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v2, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, v3, 0);

        if ((v9 & 1) == 0)
        {
          v4 = 0;
          *__error() = 2;
          goto LABEL_9;
        }
        objc_msgSend(v1, "getFileSystemRepresentation:maxLength:", __s, 1023);
        v11 = 0;
        __strcat_chk();
        v4 = mkdtemp(__s);
        if (!v4)
          goto LABEL_9;
        goto LABEL_6;
      }
    }
    else
    {
      NSLog((NSString *)CFSTR("*** Warning: invalid path %@"), v1);
    }
    v4 = 0;
  }
LABEL_9:

  return v4;
}

CGImageRef createImageByRemovingBlackBarsFromPreviewImage(CGImage *a1, int a2, int a3)
{
  size_t Width;
  size_t Height;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  double v13;
  double v14;
  double v15;
  double v16;
  float v17;
  float v18;

  Width = CGImageGetWidth(a1);
  Height = CGImageGetHeight(a1);
  if (a2 >= 1 && a3 >= 1 && Width && Height)
  {
    v8 = (float)a2 / (float)a3;
    v9 = (float)Width;
    v10 = (float)Height;
    v11 = ceilf((float)((float)Height - floorf((float)Width / v8)) * 0.5);
    if (v11 <= 2.0)
    {
      v17 = ceilf((float)(v9 - floorf(v8 * v10)) * 0.5);
      if (v17 > 2.0)
      {
        v18 = v9 + (float)(v17 * -2.0);
        if (v18 > 0.0)
        {
          v16 = v17;
          v14 = v18;
          v15 = (double)Height;
          v13 = 0.0;
          return CGImageCreateWithImageInRect(a1, *(CGRect *)&v16);
        }
      }
    }
    else
    {
      v12 = v10 + (float)(v11 * -2.0);
      if (v12 > 0.0)
      {
        v13 = v11;
        v14 = (double)Width;
        v15 = v12;
        v16 = 0.0;
        return CGImageCreateWithImageInRect(a1, *(CGRect *)&v16);
      }
    }
  }
  return 0;
}

Class UIImageClass()
{
  return NSClassFromString((NSString *)CFSTR("UIImage"));
}

uint64_t PLSingleQueryReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  char v24;
  unsigned int v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  char v37;
  unsigned int v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  uint64_t v42;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 48) |= 2u;
          while (1)
          {
            v20 = *v3;
            v21 = *(_QWORD *)(a2 + v20);
            if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
              break;
            v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
            *(_QWORD *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0)
              goto LABEL_53;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_55;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_53:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_55:
          v42 = 24;
          goto LABEL_68;
        case 2u:
          v24 = 0;
          v25 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 48) |= 8u;
          while (2)
          {
            v26 = *v3;
            v27 = *(_QWORD *)(a2 + v26);
            if (v27 == -1 || v27 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v28 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v27);
              *(_QWORD *)(a2 + v26) = v27 + 1;
              v19 |= (unint64_t)(v28 & 0x7F) << v24;
              if (v28 < 0)
              {
                v24 += 7;
                v14 = v25++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_59;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_59:
          v42 = 44;
          goto LABEL_68;
        case 3u:
          PBReaderReadData();
          v29 = objc_claimAutoreleasedReturnValue();
          v30 = 16;
          goto LABEL_37;
        case 4u:
          PBReaderReadData();
          v29 = objc_claimAutoreleasedReturnValue();
          v30 = 32;
LABEL_37:
          v31 = *(void **)(a1 + v30);
          *(_QWORD *)(a1 + v30) = v29;

          continue;
        case 5u:
          v32 = 0;
          v33 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 48) |= 1u;
          while (2)
          {
            v34 = *v3;
            v35 = *(_QWORD *)(a2 + v34);
            if (v35 == -1 || v35 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v36 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v35);
              *(_QWORD *)(a2 + v34) = v35 + 1;
              v19 |= (unint64_t)(v36 & 0x7F) << v32;
              if (v36 < 0)
              {
                v32 += 7;
                v14 = v33++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_63;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_63:
          v42 = 8;
          goto LABEL_68;
        case 6u:
          v37 = 0;
          v38 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 48) |= 4u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v39 = *v3;
        v40 = *(_QWORD *)(a2 + v39);
        if (v40 == -1 || v40 >= *(_QWORD *)(a2 + *v4))
          break;
        v41 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v40);
        *(_QWORD *)(a2 + v39) = v40 + 1;
        v19 |= (unint64_t)(v41 & 0x7F) << v37;
        if ((v41 & 0x80) == 0)
          goto LABEL_65;
        v37 += 7;
        v14 = v38++ >= 9;
        if (v14)
        {
          LODWORD(v19) = 0;
          goto LABEL_67;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_65:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v19) = 0;
LABEL_67:
      v42 = 40;
LABEL_68:
      *(_DWORD *)(a1 + v42) = v19;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_199E15404(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_199E156EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_199E159E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_199E15CC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_199E15FA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_199E162C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_199E165A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_199E16928(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_199E16BF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_199E16ED8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

uint64_t PLPlatformCloudPhotosPrefetchSupported()
{
  return 1;
}

uint64_t PLPlatformCloudFeedSupported()
{
  return 1;
}

uint64_t PLPlatformMomentsSupported()
{
  return 1;
}

uint64_t PLPlatformMomentAnalysisSupported()
{
  return 1;
}

uint64_t PLPlatformMediaStreamSupported()
{
  return 1;
}

uint64_t PLPlatformSharedStreamsSupported()
{
  return 1;
}

uint64_t PLPlatformHighlightsSupported()
{
  return 1;
}

uint64_t PLPlatformUseNanoThumbnailFormats()
{
  return 0;
}

uint64_t PLPlatformMobileCheckpointSupported()
{
  return 1;
}

uint64_t PLPlatformExtendedAttributesSupported()
{
  return 1;
}

uint64_t PLPlatformLimitedLibrarySupported()
{
  return 1;
}

uint64_t PLPlatformComputeSyncSupported()
{
  return 1;
}

uint64_t PLPlatformWaitsForDataMigrator()
{
  return 1;
}

uint64_t PLPlatformCameraCaptureSupported()
{
  return 1;
}

uint64_t PLPlatformIsFrameDropRecoverySupported()
{
  return MGIsDeviceOneOfType();
}

uint64_t PLPlatformGenerativeModelSystemsSupported()
{
  pl_dispatch_once(&PLPlatformGenerativeModelSystemsSupported_once, &__block_literal_global_18);
  return PLPlatformGenerativeModelSystemsSupported_gmSupported;
}

uint64_t PLPlatformIsMachineReadableCodeDataSupported()
{
  return 1;
}

void sub_199E176B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_199E179EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E17DAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,SEL sel,uint8_t buf)
{

  _Unwind_Resume(a1);
}

void sub_199E1817C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,SEL sel,uint8_t buf)
{

  _Unwind_Resume(a1);
}

void sub_199E185D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E189BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E18C98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E191E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, SEL sel,char a21)
{

  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

void sub_199E1958C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{

  _Unwind_Resume(a1);
}

void sub_199E19890(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E19B28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E19EE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,SEL sel,uint8_t buf)
{

  _Unwind_Resume(a1);
}

void sub_199E1A2BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,void *a30,uint64_t a31,uint64_t a32,uint64_t a33,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E1A688(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{

  _Unwind_Resume(a1);
}

void sub_199E1A9B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E1ACFC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_199E1B010(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{

  _Unwind_Resume(a1);
}

void sub_199E1B31C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{

  _Unwind_Resume(a1);
}

void sub_199E1B68C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E1BA28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,SEL sel,uint8_t buf)
{

  _Unwind_Resume(a1);
}

__n128 __copy_helper_block_e8_56n18_8_8_t0w1_s8_t16w32(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(id *)(a2 + 64);
  result = *(__n128 *)(a2 + 88);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(__n128 *)(a1 + 88) = result;
  return result;
}

void __destroy_helper_block_e8_56n4_8_s8(uint64_t a1)
{

}

__n128 __copy_helper_block_e8_32n18_8_8_t0w1_s8_t16w32(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(id *)(a2 + 40);
  result = *(__n128 *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(__n128 *)(a1 + 64) = result;
  return result;
}

void __destroy_helper_block_e8_32n4_8_s8(uint64_t a1)
{

}

void sub_199E1EBCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199E1EF3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_199E1F674(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_199E2115C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E215C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,void *a36,uint64_t a37,uint64_t a38,uint64_t a39,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E219B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,void *a30,uint64_t a31,uint64_t a32,uint64_t a33,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E21D1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,SEL sel,uint8_t buf)
{

  _Unwind_Resume(a1);
}

void sub_199E22058(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,SEL sel,uint8_t buf)
{

  _Unwind_Resume(a1);
}

void sub_199E22380(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,SEL sel,uint8_t buf)
{

  _Unwind_Resume(a1);
}

void sub_199E22740(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,SEL sel)
{

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__859(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__860(uint64_t a1)
{

}

void sub_199E23740(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,void *a30,uint64_t a31,uint64_t a32,uint64_t a33,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E23B0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E241AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E244A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,void *a24,uint64_t a25,uint64_t a26,uint64_t a27,SEL sel)
{

  _Unwind_Resume(a1);
}

uint64_t PUTCreatePathForPersistentURL(void *a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v2 = (void *)MEMORY[0x19AEC2E4C]();
  objc_msgSend(a1, "scheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("ipod-library"));

  if (v4)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2050000000;
    v5 = (void *)getMPMediaLibraryClass_softClass;
    v17 = getMPMediaLibraryClass_softClass;
    if (!getMPMediaLibraryClass_softClass)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __getMPMediaLibraryClass_block_invoke;
      v13[3] = &unk_1E376CAD8;
      v13[4] = &v14;
      __getMPMediaLibraryClass_block_invoke((uint64_t)v13);
      v5 = (void *)v15[3];
    }
    v6 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v14, 8);
    objc_msgSend(v6, "defaultMediaLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isValidAssetURL:", a1))
    {
      objc_msgSend(v7, "pathForAssetURL:", a1);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    +[PLAssetsdClient sharedSystemLibraryAssetsdClient](PLAssetsdClient, "sharedSystemLibraryAssetsdClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resourceClient");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    objc_msgSend(v9, "fileURLForAssetURL:withAdjustments:fileURL:error:", a1, 1, &v12, 0);
    v10 = v12;

    objc_msgSend(v10, "path");
    v8 = objc_claimAutoreleasedReturnValue();

  }
  objc_autoreleasePoolPop(v2);
  return v8;
}

void sub_199E24B50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMPMediaLibraryClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!MediaPlayerLibraryCore_frameworkLibrary)
    MediaPlayerLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!MediaPlayerLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *MediaPlayerLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PersistentURLTranslator.m"), 39, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("MPMediaLibrary");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getMPMediaLibraryClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PersistentURLTranslator.m"), 40, CFSTR("Unable to find class %s"), "MPMediaLibrary");

LABEL_8:
    __break(1u);
  }
  getMPMediaLibraryClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id PUTCreateSandboxExtensionURLForPersistentURL(void *a1)
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v9;
  uint8_t buf[16];

  v2 = (void *)MEMORY[0x19AEC2E4C]();
  objc_msgSend(a1, "scheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("ipod-library"));

  if (v4)
  {
    PLBackendGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199DF7000, v5, OS_LOG_TYPE_ERROR, "Requesting sandbox extension URL for Music URL, which is not supported", buf, 2u);
    }
    v6 = 0;
  }
  else
  {
    +[PLAssetsdClient sharedSystemLibraryAssetsdClient](PLAssetsdClient, "sharedSystemLibraryAssetsdClient");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject resourceClient](v5, "resourceClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    objc_msgSend(v7, "sandboxExtensionFileURLForAssetURL:withAdjustments:fileURL:error:", a1, 1, &v9, 0);
    v6 = v9;

  }
  objc_autoreleasePoolPop(v2);
  return v6;
}

uint64_t PUTGetCurrentAccess()
{
  return 2;
}

uint64_t PUTGetCurrentAccessForURLAndToken(void *a1, _OWORD *a2)
{
  void *v4;
  void *v5;
  __int128 v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  _OWORD v12[2];

  v4 = (void *)MEMORY[0x19AEC2E4C]();
  +[PLPrivacy sharedInstance](PLPrivacy, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = a2[1];
  v12[0] = *a2;
  v12[1] = v6;
  v7 = objc_msgSend(v5, "photosAccessAllowedWithScope:auditToken:clientAuthorization:", 7, v12, 0);

  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) != 0
    && (objc_msgSend(a1, "scheme"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("ipod-library")),
        v8,
        !v9))
  {
    v10 = 0;
  }
  else
  {
    v10 = 2;
  }
  objc_autoreleasePoolPop(v4);
  return v10;
}

unint64_t PLSizeMake(unsigned int a1, uint64_t a2)
{
  return a1 | (unint64_t)(a2 << 32);
}

unint64_t PLSizeFromCGSize(double a1, double a2)
{
  return (int)a1 | ((unint64_t)(int)a2 << 32);
}

unint64_t PLScaleDimensionsToShortSide(uint64_t a1, unsigned int a2, signed int a3)
{
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;

  if ((int)a1 >= SHIDWORD(a1))
    v3 = HIDWORD(a1);
  else
    v3 = a1;
  if ((int)a1 <= SHIDWORD(a1))
    v4 = HIDWORD(a1);
  else
    v4 = a1;
  v5 = (int)(v4 * a2) / v3;
  if (a3 < 1 || v5 <= a3)
  {
    if (v5 != a3)
    {
      if (v5 >= -1)
        v8 = v5 + 1;
      else
        v8 = v5 + 2;
      a3 = v8 & 0xFFFFFFFE;
    }
  }
  else
  {
    v6 = v3 * a3 / v4;
    if (v6 != a2)
    {
      if (v6 >= -1)
        v7 = v6 + 1;
      else
        v7 = v6 + 2;
      a2 = v7 & 0xFFFFFFFE;
    }
  }
  if ((int)a1 <= SHIDWORD(a1))
    return a2 | ((unint64_t)a3 << 32);
  else
    return a3 | ((unint64_t)a2 << 32);
}

double PLRectByCenteringSquareToFitDimensions(uint64_t a1)
{
  return PLRectByCenteringAndScalingDimensionsToFitDimensions(0x100000001, a1);
}

double PLRectByCenteringAndScalingDimensionsToFitDimensions(uint64_t a1, uint64_t a2)
{
  double v2;
  double v3;
  BOOL v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double result;
  CGRect v12;

  v2 = (double)(int)a1 / (double)SHIDWORD(a1);
  v3 = (double)(int)a2;
  v4 = v2 <= (double)(int)a2 / (double)SHIDWORD(a2);
  v5 = v2 * (double)SHIDWORD(a2);
  v6 = (double)(int)a2 / v2;
  if (v4)
    v7 = (double)SHIDWORD(a2);
  else
    v7 = v6;
  if (v4)
    v8 = v5;
  else
    v8 = (double)(int)a2;
  if (v8 == v3)
  {
    v9 = *MEMORY[0x1E0C9D648];
    v10 = ((double)SHIDWORD(a2) - v7) * 0.5;
  }
  else
  {
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v9 = (v3 - v8) * 0.5;
  }
  v12 = CGRectIntegral(*(CGRect *)(&v7 - 3));
  if (v12.size.width <= v12.size.height)
  {
    if (v12.size.height > v12.size.width)
      v12.size.height = v12.size.height + -1.0;
  }
  else
  {
    v12.size.width = v12.size.width + -1.0;
  }
  *(_QWORD *)&result = (unint64_t)CGRectStandardize(v12);
  return result;
}

double PLCGSizeScaledToFitSize(uint64_t a1, uint64_t a2)
{
  double v2;
  double result;

  v2 = (double)(int)a1 / (double)SHIDWORD(a1);
  result = (double)(int)a2;
  if (v2 <= (double)(int)a2 / (double)SHIDWORD(a2))
    return v2 * (double)SHIDWORD(a2);
  return result;
}

void sub_199E28170(_Unwind_Exception *exception_object)
{
  char v1;

  if ((v1 & 1) != 0)
    objc_end_catch();
  _Unwind_Resume(exception_object);
}

id PLURLForResourceProperties(uint64_t a1, uint64_t a2, unsigned int a3, int a4, unsigned int a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  void *v11;
  void *v12;

  PLPathForResourceProperties(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

id PLPathForResourceProperties(uint64_t a1, uint64_t a2, unsigned int a3, int a4, unsigned int a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  int v16;
  _WORD *FileMarker;
  unsigned int v19;
  void *v20;
  uint8_t buf[16];

  v16 = 31;
  if (a3 <= 0xF)
  {
    if (((1 << a3) & 0x2C38) != 0)
    {
      if (a5 | a4)
      {
        v16 = 31;
        goto LABEL_7;
      }
      goto LABEL_6;
    }
    if (((1 << a3) & 0xC000) != 0 || a3 == 7 && (v16 = 31, a4 == 2) && !a5)
LABEL_6:
      v16 = a3;
  }
LABEL_7:
  if (a1)
  {
    switch(a4)
    {
      case 0:
        if (a5)
        {
          FileMarker = _createFileMarker(v16, 0, a5);
LABEL_11:
          a7 = a9;
LABEL_43:
          +[PLPhotoLibraryPathManagerCore managedPathWithUuid:base:fileMarker:extension:](PLPhotoLibraryPathManagerCore, "managedPathWithUuid:base:fileMarker:extension:", a1, a7, FileMarker, a2);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (FileMarker)
            free(FileMarker);
          return v20;
        }
        if (v16 == 31)
        {
LABEL_20:
          FileMarker = 0;
          goto LABEL_43;
        }
        FileMarker = malloc_type_calloc(1uLL, 3uLL, 0x2D4F4517uLL);
        if (snprintf((char *)FileMarker, 3uLL, "%d", v16) < 3)
          goto LABEL_43;
        break;
      case 1:
        if (v16 == 31)
        {
          FileMarker = malloc_type_calloc(1uLL, 2uLL, 0x3C36B57DuLL);
          *FileMarker = 112;
LABEL_27:
          a7 = a8;
          goto LABEL_43;
        }
        FileMarker = malloc_type_calloc(1uLL, 5uLL, 0x1620EE3EuLL);
        a7 = a8;
        if (snprintf((char *)FileMarker, 5uLL, "%c_%d", 112, v16) >= 5)
          break;
        goto LABEL_43;
      case 2:
        if (!a5 && v16 == 31 && (a6 & 1) != 0)
        {
          FileMarker = 0;
          goto LABEL_27;
        }
        FileMarker = _createFileMarker(v16, 2, a5);
        if ((a5 & 1) != 0)
          a7 = a9;
        else
          a7 = a8;
        goto LABEL_43;
      case 3:
        if ((a5 & 0xFFFF0000) == 0x40000)
        {
          a7 = a11;
          FileMarker = malloc_type_calloc(1uLL, 0xBuLL, 0xDA9688A5uLL);
          v19 = snprintf((char *)FileMarker, 0xBuLL, "%d_%d_%c", HIWORD(a5), (unsigned __int16)a5 >> 1, 99);
        }
        else
        {
          if ((v16 & 0xFFFFFFFE) == 0xE)
          {
            a7 = a10;
            FileMarker = _createFileMarker(v16, 3, a5);
            goto LABEL_43;
          }
          if (!a5)
          {
            FileMarker = malloc_type_calloc(1uLL, 2uLL, 0x3C36B57DuLL);
            *FileMarker = 99;
            goto LABEL_11;
          }
          FileMarker = malloc_type_calloc(1uLL, 0xBuLL, 0xDA9688A5uLL);
          v19 = snprintf((char *)FileMarker, 0xBuLL, "%d_%d_%c", HIWORD(a5), (unsigned __int16)a5 >> 1, 99);
          a7 = a9;
        }
        if (v19 < 0xB)
          goto LABEL_43;
        break;
      default:
        a7 = 0;
        goto LABEL_20;
    }
    __assert_rtn("_createFileMarker", "PLPhotoLibraryPathManagerUBF.m", 113, "formattedLen < markerLen");
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_199DF7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "_pathForResourceProperties uuid is NULL", buf, 2u);
  }
  return 0;
}

char *_createFileMarker(int a1, int a2, int a3)
{
  char v3;
  char *v4;
  unint64_t v5;
  int v6;

  v3 = a2;
  if (!a3 || a1 == 31)
  {
    if (a1 == 31 && a3)
    {
      v4 = (char *)malloc_type_calloc(1uLL, 0xBuLL, 0xDA9688A5uLL);
      v5 = 11;
      v6 = snprintf(v4, 0xBuLL, "%d_%d_%c");
    }
    else if (a1 == 31 || !a2)
    {
      if (a1 == 31 || a2)
      {
        if (!a2)
          return 0;
        v4 = (char *)malloc_type_calloc(1uLL, 2uLL, 0x3C36B57DuLL);
        *(_WORD *)v4 = (0x6361706Fu >> (8 * v3));
        return v4;
      }
      v5 = 3;
      v4 = (char *)malloc_type_calloc(1uLL, 3uLL, 0x2D4F4517uLL);
      v6 = snprintf(v4, 3uLL, "%d");
    }
    else
    {
      v5 = 5;
      v4 = (char *)malloc_type_calloc(1uLL, 5uLL, 0x1620EE3EuLL);
      v6 = snprintf(v4, 5uLL, "%c_%d");
    }
  }
  else
  {
    v4 = (char *)malloc_type_calloc(1uLL, 0xEuLL, 0x9E52B664uLL);
    v5 = 14;
    v6 = snprintf(v4, 0xEuLL, "%d_%d_%c_%d");
  }
  if (v5 <= v6)
    __assert_rtn("_createFileMarker", "PLPhotoLibraryPathManagerUBF.m", 113, "formattedLen < markerLen");
  return v4;
}

uint64_t PLResourceVersionDesignatorForResourceVersion(unsigned int a1)
{
  unsigned int v1;

  v1 = 0x6361706Fu >> (8 * a1);
  if (a1 >= 4)
    LOBYTE(v1) = 111;
  return v1 & 0x7F;
}

BOOL PLResourceTypeIsAllowedForUseInFilename(unsigned int a1, int a2, int a3)
{
  int v3;
  _BOOL4 v5;
  int v6;
  _BOOL4 v7;

  v3 = 1 << a1;
  v5 = a2 == 2 && a3 == 0;
  if (a1 != 7)
    v5 = 0;
  v6 = (v3 & 0xC000) != 0 || v5;
  if ((v3 & 0x2C38) != 0)
    v7 = (a3 | a2) == 0;
  else
    v7 = v6;
  return a1 <= 0xF && v7;
}

id PLAllowedResourceTypesForOriginalResources()
{
  if (PLAllowedResourceTypesForOriginalResources_onceToken != -1)
    dispatch_once(&PLAllowedResourceTypesForOriginalResources_onceToken, &__block_literal_global_1240);
  return (id)PLAllowedResourceTypesForOriginalResources_allowedResourceTypes;
}

id PLResourceDataStoreErrorCreate(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;

  v5 = (objc_class *)MEMORY[0x1E0C99E08];
  v6 = a3;
  v7 = a2;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CB2938]);

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CB3388]);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("PLResourceDataStoreErrorDomain"), a1, v8);

  return v9;
}

id PLGuessResourceUTIForResourceType(int a1, int a2, void *a3)
{
  void *v5;
  id v6;
  id *v7;
  void *v8;

  objc_msgSend(a3, "pathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "length")
    || (objc_msgSend(MEMORY[0x1E0D752F0], "resourceModelTypeForFilenameExtension:", v5),
        (v6 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v6 = 0;
    switch(a1)
    {
      case 0:
      case 4:
      case 15:
        v7 = (id *)MEMORY[0x1E0CEC520];
        goto LABEL_13;
      case 1:
        v7 = (id *)MEMORY[0x1E0CEC568];
        goto LABEL_13;
      case 2:
        v7 = (id *)MEMORY[0x1E0CEC450];
        goto LABEL_13;
      case 3:
      case 11:
      case 13:
        v7 = (id *)MEMORY[0x1E0CEC5B0];
        goto LABEL_13;
      case 5:
      case 12:
      case 31:
        v7 = (id *)MEMORY[0x1E0CEC528];
        goto LABEL_13;
      case 6:
      case 8:
        v7 = (id *)MEMORY[0x1E0CEC5A8];
        goto LABEL_13;
      case 7:
      case 9:
      case 14:
        v7 = (id *)MEMORY[0x1E0CEC4A0];
        goto LABEL_13;
      case 10:
        v7 = (id *)MEMORY[0x1E0CEC520];
        if (a2)
          v7 = (id *)MEMORY[0x1E0CEC568];
LABEL_13:
        v6 = *v7;
        break;
      default:
        break;
    }
  }
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void sub_199E29A84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1337(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1338(uint64_t a1)
{

}

BOOL PLIsValidUUIDString(void *a1)
{
  id v1;
  const char *v2;
  _BOOL8 v3;
  uuid_t uu;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (objc_msgSend(v1, "length") == 36
    && (v2 = (const char *)objc_msgSend(objc_retainAutorelease(v1), "cStringUsingEncoding:", 4)) != 0)
  {
    memset(uu, 0, sizeof(uu));
    v3 = uuid_parse(v2, uu) == 0;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void sub_199E2A978(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_199E2ACD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E2B0E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,void *a22,os_signpost_id_t a23,os_activity_scope_state_s a24,SEL sel,int buf)
{
  uint64_t v26;
  NSObject *v28;
  NSObject *v29;
  const char *Name;

  if (a21)
    os_activity_scope_leave(&a24);
  if (a23)
  {
    PLRequestGetLog();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (a23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      Name = sel_getName(sel);
      buf = 136446210;
      *(_QWORD *)(v26 + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v29, OS_SIGNPOST_INTERVAL_END, a23, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  _Unwind_Resume(a1);
}

void sub_199E2B4F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,void *a22,os_signpost_id_t a23,os_activity_scope_state_s a24,SEL sel,int buf)
{
  uint64_t v26;
  NSObject *v28;
  NSObject *v29;
  const char *Name;

  if (a21)
    os_activity_scope_leave(&a24);
  if (a23)
  {
    PLRequestGetLog();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (a23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      Name = sel_getName(sel);
      buf = 136446210;
      *(_QWORD *)(v26 + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v29, OS_SIGNPOST_INTERVAL_END, a23, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1441(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1442(uint64_t a1)
{

}

__n128 __copy_helper_block_e8_40n18_8_8_t0w1_s8_t16w32(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(id *)(a2 + 48);
  result = *(__n128 *)(a2 + 72);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(__n128 *)(a1 + 72) = result;
  return result;
}

void __destroy_helper_block_e8_40n4_8_s8(uint64_t a1)
{

}

void sub_199E2BE10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E2C054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_199E2C348(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E2C658(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E2C968(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E2CC70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,void *a24,uint64_t a25,uint64_t a26,uint64_t a27,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E2EAE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{

  _Unwind_Resume(a1);
}

void sub_199E2EE80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,void *a30,os_signpost_id_t a31,os_activity_scope_state_s a32,SEL sel)
{
  uint64_t v33;
  uint64_t v34;
  NSObject *v36;
  NSObject *v37;
  const char *Name;

  if (a29)
    os_activity_scope_leave(&a32);
  if (a31)
  {
    PLRequestGetLog();
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (a31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      Name = sel_getName(sel);
      *(_DWORD *)(v34 - 112) = 136446210;
      *(_QWORD *)(v33 + 52) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v37, OS_SIGNPOST_INTERVAL_END, a31, "PLXPC Sync", "%{public}s", (uint8_t *)(v34 - 112), 0xCu);
    }

  }
  _Unwind_Resume(a1);
}

void sub_199E2F160(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_199E2F430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_199E2F78C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{

  _Unwind_Resume(a1);
}

void sub_199E2FB80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E2FF80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E303A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E30810(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,void *a28,os_signpost_id_t a29,os_activity_scope_state_s a30,SEL sel)
{
  uint64_t v31;
  uint64_t v32;
  NSObject *v34;
  NSObject *v35;
  const char *Name;

  if (a27)
    os_activity_scope_leave(&a30);
  if (a29)
  {
    PLRequestGetLog();
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (a29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
    {
      Name = sel_getName(sel);
      *(_DWORD *)(v32 - 160) = 136446210;
      *(_QWORD *)(v31 + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v35, OS_SIGNPOST_INTERVAL_END, a29, "PLXPC Sync", "%{public}s", (uint8_t *)(v32 - 160), 0xCu);
    }

  }
  _Unwind_Resume(a1);
}

void sub_199E30B68(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_199E30EAC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_199E312A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{

  _Unwind_Resume(a1);
}

void sub_199E31630(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{

  _Unwind_Resume(a1);
}

void sub_199E31868(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_199E319EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_199E31C28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_199E31EF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_199E32250(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, SEL sel,char a21)
{

  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

void sub_199E3253C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_199E32898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{

  _Unwind_Resume(a1);
}

void sub_199E32C04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{

  _Unwind_Resume(a1);
}

void sub_199E32F80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{

  _Unwind_Resume(a1);
}

void sub_199E33260(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_199E33530(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_199E3397C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,os_signpost_id_t a27,os_activity_scope_state_s a28,SEL sel)
{
  uint64_t v29;
  uint64_t v30;
  NSObject *v32;
  NSObject *v33;
  const char *Name;

  if (a25)
    os_activity_scope_leave(&a28);
  if (a27)
  {
    PLRequestGetLog();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (a27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      Name = sel_getName(sel);
      *(_DWORD *)(v30 - 160) = 136446210;
      *(_QWORD *)(v29 + 52) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v33, OS_SIGNPOST_INTERVAL_END, a27, "PLXPC Sync", "%{public}s", (uint8_t *)(v30 - 160), 0xCu);
    }

  }
  _Unwind_Resume(a1);
}

void sub_199E33E84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,void *a34,os_signpost_id_t a35,os_activity_scope_state_s a36,SEL sel)
{
  uint64_t v37;
  uint64_t v38;
  NSObject *v40;
  NSObject *v41;
  const char *Name;

  if (a33)
    os_activity_scope_leave(&a36);
  if (a35)
  {
    PLRequestGetLog();
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = v40;
    if (a35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
    {
      Name = sel_getName(sel);
      *(_DWORD *)(v38 - 160) = 136446210;
      *(_QWORD *)(v37 + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v41, OS_SIGNPOST_INTERVAL_END, a35, "PLXPC Sync", "%{public}s", (uint8_t *)(v38 - 160), 0xCu);
    }

  }
  _Unwind_Resume(a1);
}

void sub_199E341B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_199E344A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_199E347D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E34AE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E34E64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{

  _Unwind_Resume(a1);
}

void sub_199E351F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{

  _Unwind_Resume(a1);
}

void sub_199E3557C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{

  _Unwind_Resume(a1);
}

void sub_199E35908(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{

  _Unwind_Resume(a1);
}

void sub_199E35C94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{

  _Unwind_Resume(a1);
}

void sub_199E35FA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E362C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,void *a24,uint64_t a25,uint64_t a26,uint64_t a27,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E365E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E368CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E36BC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E36E98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E3717C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{

  _Unwind_Resume(a1);
}

void sub_199E374CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,void *a24,uint64_t a25,uint64_t a26,uint64_t a27,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E377C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{

  _Unwind_Resume(a1);
}

void sub_199E37B18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,void *a24,uint64_t a25,uint64_t a26,uint64_t a27,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E37E14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{

  _Unwind_Resume(a1);
}

void sub_199E38164(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,void *a24,uint64_t a25,uint64_t a26,uint64_t a27,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E384D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E3883C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E38BA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E38F14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E39278(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E3960C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E39964(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E39CA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E39FE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E3A33C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,SEL sel)
{

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1695(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1696(uint64_t a1)
{

}

void sub_199E3F35C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id PLClientApplicationIdentifierFromXPCConnection(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  NSObject *v4;
  __int128 v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "auditToken");
    PLClientApplicationIdentifierFromAuditToken(&v6, v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PLGatekeeperXPCGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v8 = "NSString *PLClientApplicationIdentifierFromXPCConnection(NSXPCConnection *__strong)";
      _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "%{public}s: missing required connection", buf, 0xCu);
    }

    v3 = 0;
  }

  return v3;
}

__CFString *PLClientApplicationIdentifierFromAuditToken(_OWORD *a1, void *a2)
{
  id v3;
  const __CFAllocator *v4;
  __int128 v5;
  __SecTask *v6;
  __SecTask *v7;
  __CFString *v8;
  NSObject *v9;
  const char *v10;
  audit_token_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v5 = a1[1];
  *(_OWORD *)v12.val = *a1;
  *(_OWORD *)&v12.val[4] = v5;
  v6 = SecTaskCreateWithAuditToken(v4, &v12);
  if (!v6)
  {
    PLGatekeeperXPCGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12.val[0] = 136446466;
      *(_QWORD *)&v12.val[1] = "NSString *PLClientApplicationIdentifierFromAuditToken(audit_token_t, __strong id)";
      LOWORD(v12.val[3]) = 2114;
      *(_QWORD *)((char *)&v12.val[3] + 2) = v3;
      v10 = "%{public}s: failed to get SecTask from %{public}@";
      goto LABEL_7;
    }
LABEL_8:

    v8 = 0;
    goto LABEL_9;
  }
  v7 = v6;
  v8 = (__CFString *)SecTaskCopySigningIdentifier(v6, 0);
  CFRelease(v7);
  if (!v8)
  {
    PLGatekeeperXPCGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12.val[0] = 136446466;
      *(_QWORD *)&v12.val[1] = "NSString *PLClientApplicationIdentifierFromAuditToken(audit_token_t, __strong id)";
      LOWORD(v12.val[3]) = 2114;
      *(_QWORD *)((char *)&v12.val[3] + 2) = v3;
      v10 = "%{public}s: failed to get identifier from %{public}@";
LABEL_7:
      _os_log_impl(&dword_199DF7000, v9, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v12, 0x16u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:

  return v8;
}

id PLDescriptionFromXPCObject()
{
  void *v0;
  void *v1;

  v0 = (void *)MEMORY[0x19AEC35C0]();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  free(v0);
  return v1;
}

__CFString *PLStringFromXPCChangeSource(uint64_t a1)
{
  if (a1 < 3)
    return off_1E3768D58[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(".Unknown(%d)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

id PLDescriptionFromXPCErrorDictionary(void *a1)
{
  id v1;
  void *v2;
  NSObject *v3;
  Class Class;
  const char *string;
  void *v6;
  int v8;
  void *v9;
  __int16 v10;
  Class v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (!v1 || object_getClass(v1) != (Class)MEMORY[0x1E0C81310])
  {
    PLBackendGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      if (v2)
        Class = object_getClass(v2);
      else
        Class = 0;
      v8 = 134218240;
      v9 = v2;
      v10 = 2048;
      v11 = Class;
      _os_log_impl(&dword_199DF7000, v3, OS_LOG_TYPE_DEFAULT, "Bogus value type in xpc, error dictionary %p = %p", (uint8_t *)&v8, 0x16u);
    }

    goto LABEL_11;
  }
  string = xpc_dictionary_get_string(v2, (const char *)*MEMORY[0x1E0C81270]);
  if (!string)
  {
LABEL_11:
    v6 = 0;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v6;
}

id PLStringFromXPCDictionary(void *a1, const char *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  Class Class;
  const char *string;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  Class v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = v3;
  if (!v3 || object_getClass(v3) != (Class)MEMORY[0x1E0C812F8])
  {
    PLBackendGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (v4)
        Class = object_getClass(v4);
      else
        Class = 0;
      v10 = 134218240;
      v11 = v4;
      v12 = 2048;
      v13 = Class;
      _os_log_impl(&dword_199DF7000, v5, OS_LOG_TYPE_DEFAULT, "Bogus value type in xpc, dictionary %p = %p", (uint8_t *)&v10, 0x16u);
    }

    goto LABEL_11;
  }
  string = xpc_dictionary_get_string(v4, a2);
  if (!string)
  {
LABEL_11:
    v8 = 0;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v8;
}

id PLErrorFromXPCDictionary(void *a1, const char *a2)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PLDataFromXPCDictionary(a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v7 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v2, &v7);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v7;
    if (!v3)
    {
      PLBackendGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v9 = v4;
        _os_log_impl(&dword_199DF7000, v5, OS_LOG_TYPE_DEFAULT, "Failed to unarchive NSError, error: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id PLDataFromXPCDictionary(void *a1, const char *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  Class Class;
  void *v7;
  const char *v8;
  int64_t int64;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  Class v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = v3;
  if (v3 && object_getClass(v3) == (Class)MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(v4, a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (const char *)_PLDataExplicitLengthKey((uint64_t)a2);
    int64 = xpc_dictionary_get_int64(v4, v8);
    PLDataFromXPCDataObject(v7, int64);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PLBackendGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (v4)
        Class = object_getClass(v4);
      else
        Class = 0;
      v12 = 134218240;
      v13 = v4;
      v14 = 2048;
      v15 = Class;
      _os_log_impl(&dword_199DF7000, v5, OS_LOG_TYPE_DEFAULT, "Bogus value type in xpc, dictionary %p = %p", (uint8_t *)&v12, 0x16u);
    }

    v10 = 0;
  }

  return v10;
}

uint64_t _PLDataExplicitLengthKey(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingString:", CFSTR("__LENGTH"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_retainAutorelease(v2);
  v4 = objc_msgSend(v3, "UTF8String");

  return v4;
}

id PLDataFromXPCDataObject(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  Class Class;
  void *v6;
  id v8;
  const void *bytes_ptr;
  size_t length;
  PLXPCShMemData *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;

  v3 = a1;
  v4 = v3;
  if (!v3)
    goto LABEL_5;
  Class = object_getClass(v3);
  if (Class == (Class)MEMORY[0x1E0C81350])
    goto LABEL_5;
  if (Class == (Class)MEMORY[0x1E0C812E8])
  {
    v8 = objc_alloc(MEMORY[0x1E0C99D50]);
    bytes_ptr = xpc_data_get_bytes_ptr(v4);
    length = xpc_data_get_length(v4);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __PLDataFromXPCDataObject_block_invoke;
    v13[3] = &unk_1E3768C68;
    v14 = v4;
    v6 = (void *)objc_msgSend(v8, "initWithBytesNoCopy:length:deallocator:", bytes_ptr, length, v13);

    goto LABEL_6;
  }
  if (Class == (Class)MEMORY[0x1E0C81388])
  {
    v11 = [PLXPCShMemData alloc];
    if (a2 < 1)
      v12 = -[PLXPCShMemData initWithXPCShmem:](v11, "initWithXPCShmem:", v4);
    else
      v12 = -[PLXPCShMemData initWithXPCShmem:length:](v11, "initWithXPCShmem:length:", v4, a2);
    v6 = (void *)v12;
  }
  else
  {
LABEL_5:
    v6 = 0;
  }
LABEL_6:

  return v6;
}

id PLURLFromXPCDictionary(void *a1, const char *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  Class Class;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  Class v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = v3;
  if (v3 && object_getClass(v3) == (Class)MEMORY[0x1E0C812F8])
  {
    PLStringFromXPCDictionary(v4, a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    PLBackendGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (v4)
        Class = object_getClass(v4);
      else
        Class = 0;
      v10 = 134218240;
      v11 = v4;
      v12 = 2048;
      v13 = Class;
      _os_log_impl(&dword_199DF7000, v5, OS_LOG_TYPE_DEFAULT, "Bogus value type in xpc, dictionary %p = %p", (uint8_t *)&v10, 0x16u);
    }

    v8 = 0;
  }

  return v8;
}

id PLDictionaryFromXPCDictionary(void *a1, const char *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  Class Class;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  Class v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = v3;
  if (v3 && object_getClass(v3) == (Class)MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(v4, a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PLDictionaryFromXPCObject(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PLBackendGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (v4)
        Class = object_getClass(v4);
      else
        Class = 0;
      v10 = 134218240;
      v11 = v4;
      v12 = 2048;
      v13 = Class;
      _os_log_impl(&dword_199DF7000, v5, OS_LOG_TYPE_DEFAULT, "Bogus value type in xpc, dictionary %p = %p", (uint8_t *)&v10, 0x16u);
    }

    v8 = 0;
  }

  return v8;
}

id PLDictionaryFromXPCObject(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (v1 && object_getClass(v1) != (Class)MEMORY[0x1E0C81350])
  {
    v3 = (void *)_CFXPCCreateCFObjectFromXPCMessage();
    if (v3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v4 = v3;
LABEL_12:

        goto LABEL_13;
      }
      PLBackendGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = (objc_class *)objc_opt_class();
        NSStringFromClass(v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138412290;
        v10 = v7;
        _os_log_impl(&dword_199DF7000, v5, OS_LOG_TYPE_ERROR, "ERROR: PLDictionaryFromXPCDictionary failed to deserialize dictionary (root object not a dictionary: %@)", (uint8_t *)&v9, 0xCu);

      }
    }
    else
    {
      PLBackendGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_199DF7000, v5, OS_LOG_TYPE_ERROR, "ERROR: PLDictionaryFromXPCDictionary failed to deserialize dictionary", (uint8_t *)&v9, 2u);
      }
    }

    v4 = 0;
    goto LABEL_12;
  }
  v4 = 0;
LABEL_13:

  return v4;
}

id PLArrayFromXPCDictionary(void *a1, const char *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  Class Class;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  Class v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = v3;
  if (v3 && object_getClass(v3) == (Class)MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(v4, a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PLArrayFromXPCObject(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PLBackendGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (v4)
        Class = object_getClass(v4);
      else
        Class = 0;
      v10 = 134218240;
      v11 = v4;
      v12 = 2048;
      v13 = Class;
      _os_log_impl(&dword_199DF7000, v5, OS_LOG_TYPE_DEFAULT, "Bogus value type in xpc, dictionary %p = %p", (uint8_t *)&v10, 0x16u);
    }

    v8 = 0;
  }

  return v8;
}

id PLArrayFromXPCObject(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (v1 && object_getClass(v1) != (Class)MEMORY[0x1E0C81350])
  {
    v3 = (void *)_CFXPCCreateCFObjectFromXPCMessage();
    if (v3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v4 = v3;
LABEL_12:

        goto LABEL_13;
      }
      PLBackendGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = (objc_class *)objc_opt_class();
        NSStringFromClass(v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138412290;
        v10 = v7;
        _os_log_impl(&dword_199DF7000, v5, OS_LOG_TYPE_ERROR, "ERROR: PLArrayFromXPCDictionary failed to deserialize array (root object not an array: %@)", (uint8_t *)&v9, 0xCu);

      }
    }
    else
    {
      PLBackendGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_199DF7000, v5, OS_LOG_TYPE_ERROR, "ERROR: PLArrayFromXPCDictionary failed to deserialize array", (uint8_t *)&v9, 2u);
      }
    }

    v4 = 0;
    goto LABEL_12;
  }
  v4 = 0;
LABEL_13:

  return v4;
}

id PLDateFromXPCDictionary(void *a1, const char *a2)
{
  void *v2;
  void *v3;

  xpc_dictionary_get_value(a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PLDateFromXPCObject(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id PLDateFromXPCObject(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  v2 = v1;
  if (v1 && object_getClass(v1) == (Class)MEMORY[0x1E0C81300])
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", xpc_double_get_value(v2));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id PLManagedObjectIDFromXPCValue(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  Class Class;
  size_t length;
  size_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  int v17;
  uint8_t *v18;
  __int16 v19;
  void *v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  Class v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (!v3 || object_getClass(v3) != (Class)MEMORY[0x1E0C812E8])
  {
    PLBackendGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
LABEL_14:

      v9 = 0;
      goto LABEL_15;
    }
    if (v3)
      Class = object_getClass(v3);
    else
      Class = 0;
    *(_DWORD *)buf = 134218240;
    v22 = v3;
    v23 = 2048;
    v24 = Class;
    v13 = "Bogus value type in xpc, data %p = %p";
    v14 = v5;
    v15 = 22;
LABEL_13:
    _os_log_impl(&dword_199DF7000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
    goto LABEL_14;
  }
  length = xpc_data_get_length(v3);
  if (length + 1 > 0xC7)
  {
    PLBackendGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v13 = "Bogus object ID in xpc data.";
    v14 = v5;
    v15 = 2;
    goto LABEL_13;
  }
  v8 = length;
  xpc_data_get_bytes_ptr(v3);
  __strncpy_chk();
  buf[v8] = 0;
  objc_msgSend(v4, "managedObjectIDFromUTF8String:length:", buf, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(v4, "persistentStores");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "valueForKey:", CFSTR("identifier"));
    v5 = objc_claimAutoreleasedReturnValue();

    PLBackendGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      -[NSObject componentsJoinedByString:](v5, "componentsJoinedByString:", CFSTR(", "));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 136315394;
      v18 = buf;
      v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_199DF7000, v11, OS_LOG_TYPE_ERROR, "Unable to get object ID for %s, persistent store IDs: %@", (uint8_t *)&v17, 0x16u);

    }
    goto LABEL_14;
  }
LABEL_15:

  return v9;
}

IOSurfaceRef PLCreateIOSurfaceFromXPCDictionary(void *a1, const char *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  Class Class;
  void *v7;
  void *v8;
  IOSurfaceRef v9;
  int v11;
  void *v12;
  __int16 v13;
  Class v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = v3;
  if (v3 && object_getClass(v3) == (Class)MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(v4, a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      v9 = IOSurfaceLookupFromXPCObject(v7);
    else
      v9 = 0;

  }
  else
  {
    PLBackendGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (v4)
        Class = object_getClass(v4);
      else
        Class = 0;
      v11 = 134218240;
      v12 = v4;
      v13 = 2048;
      v14 = Class;
      _os_log_impl(&dword_199DF7000, v5, OS_LOG_TYPE_DEFAULT, "Bogus value type in xpc, dictionary %p = %p", (uint8_t *)&v11, 0x16u);
    }

    v9 = 0;
  }

  return v9;
}

id PLIndexSetFromXPCDictionary(void *a1, const char *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  Class Class;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  _BYTE *v12;
  _BYTE buf[24];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = v3;
  if (!v3 || object_getClass(v3) != (Class)MEMORY[0x1E0C812F8])
  {
    PLBackendGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (v4)
        Class = object_getClass(v4);
      else
        Class = 0;
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = v4;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = Class;
      _os_log_impl(&dword_199DF7000, v5, OS_LOG_TYPE_DEFAULT, "Bogus value type in xpc, dictionary %p = %p", buf, 0x16u);
    }
    goto LABEL_10;
  }
  xpc_dictionary_get_value(v4, a2);
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
LABEL_10:
    v8 = 0;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v14 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __PLIndexSetFromXPCDictionary_block_invoke;
  v10[3] = &unk_1E3768C90;
  v12 = buf;
  v8 = v7;
  v11 = v8;
  xpc_array_apply(v5, v10);

  _Block_object_dispose(buf, 8);
LABEL_11:

  return v8;
}

void sub_199E40CDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id PLDataFromManagedObjectID(void *a1)
{
  const __CFURL *v1;
  void *v2;
  UInt8 buffer[250];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "URIRepresentation");
  v1 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", buffer, CFURLGetBytes(v1, buffer, 250));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id PLManagedObjectIDFromData(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  int v13;
  uint8_t *v14;
  __int16 v15;
  void *v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = objc_msgSend(v3, "length");
  if ((unint64_t)(v5 + 1) > 0xC8)
  {
    PLBackendGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v18 = v3;
      _os_log_impl(&dword_199DF7000, v9, OS_LOG_TYPE_ERROR, "Bogus object ID from data: %{public}@", buf, 0xCu);
    }
    goto LABEL_8;
  }
  v6 = v5;
  objc_msgSend(v3, "getBytes:length:", buf, v5);
  buf[v6] = 0;
  objc_msgSend(v4, "managedObjectIDFromUTF8String:length:", buf, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v4, "persistentStores");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "valueForKey:", CFSTR("identifier"));
    v9 = objc_claimAutoreleasedReturnValue();

    PLBackendGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[NSObject componentsJoinedByString:](v9, "componentsJoinedByString:", CFSTR(", "));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 136315394;
      v14 = buf;
      v15 = 2112;
      v16 = v11;
      _os_log_impl(&dword_199DF7000, v10, OS_LOG_TYPE_ERROR, "Unable to get object ID for %s, persistent store IDs: %@", (uint8_t *)&v13, 0x16u);

    }
LABEL_8:

    v7 = 0;
  }

  return v7;
}

void PLXPCDictionarySetString(void *a1, const char *a2, void *a3)
{
  const char *v5;
  xpc_object_t xdict;

  xdict = a1;
  v5 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  if (v5)
    xpc_dictionary_set_string(xdict, a2, v5);

}

void PLXPCDictionarySetError(void *a1, const char *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  if (a3)
  {
    v9 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (v6)
    {
      PLXPCDictionarySetData(v5, a2, v6);
    }
    else
    {
      PLBackendGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v11 = v7;
        _os_log_impl(&dword_199DF7000, v8, OS_LOG_TYPE_DEFAULT, "Failed to archive errorData, error: %@", buf, 0xCu);
      }

    }
  }

}

void PLXPCDictionarySetData(void *a1, const char *a2, void *a3)
{
  id v5;
  NSObject *v6;
  xpc_object_t value;

  if (a3)
  {
    v5 = a1;
    v6 = objc_msgSend(a3, "_createDispatchData");
    value = xpc_data_create_with_dispatch_data(v6);

    xpc_dictionary_set_value(v5, a2, value);
  }
}

void PLXPCDictionarySetURL(void *a1, const char *a2, void *a3)
{
  void *v5;
  void *v6;
  xpc_object_t xdict;

  xdict = a1;
  objc_msgSend(a3, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    xpc_dictionary_set_string(xdict, a2, (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));

}

void PLXPCDictionarySetXPCDataWithLength(void *a1, const char *a2, void *a3, void *a4)
{
  id v7;
  int64_t v8;
  const char *v9;
  xpc_object_t xdict;

  v7 = a4;
  xdict = a1;
  xpc_dictionary_set_value(xdict, a2, a3);
  v8 = objc_msgSend(v7, "longLongValue");

  v9 = (const char *)_PLDataExplicitLengthKey((uint64_t)a2);
  xpc_dictionary_set_int64(xdict, v9, v8);

}

void PLXPCDictionarySetDictionary(void *a1, const char *a2, uint64_t a3)
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a1;
    v5 = (id)_CFXPCCreateXPCMessageWithCFObject();
    xpc_dictionary_set_value(v4, a2, v5);

  }
}

void PLXPCDictionarySetArray(void *a1, const char *a2, uint64_t a3)
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a1;
    v5 = (id)_CFXPCCreateXPCMessageWithCFObject();
    xpc_dictionary_set_value(v4, a2, v5);

  }
}

void PLXPCDictionarySetDate(void *a1, const char *a2, void *a3)
{
  double v5;
  xpc_object_t xdict;

  if (a3)
  {
    xdict = a1;
    objc_msgSend(a3, "timeIntervalSinceReferenceDate");
    xpc_dictionary_set_double(xdict, a2, v5);

  }
}

void PLXPCDictionarySetIOSurface(void *a1, const char *a2, __IOSurface *a3)
{
  id v5;
  xpc_object_t XPCObject;
  xpc_object_t xdict;

  v5 = a1;
  if (a3)
  {
    xdict = v5;
    XPCObject = IOSurfaceCreateXPCObject(a3);
    if (XPCObject)
      xpc_dictionary_set_value(xdict, a2, XPCObject);

    v5 = xdict;
  }

}

void PLXPCDictionarySetIndexSet(void *a1, const char *a2, void *a3)
{
  id v5;
  id v6;
  xpc_object_t v7;
  id v8;
  _QWORD v9[4];
  id v10;

  if (a3)
  {
    v5 = a3;
    v6 = a1;
    v7 = xpc_array_create(0, 0);
    xpc_dictionary_set_value(v6, a2, v7);

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __PLXPCDictionarySetIndexSet_block_invoke;
    v9[3] = &unk_1E3768CB8;
    v10 = v7;
    v8 = v7;
    objc_msgSend(v5, "enumerateRangesUsingBlock:", v9);

  }
}

void PLXPCDictionarySetManagedObjectID(void *a1, const char *a2, void *a3)
{
  id v5;
  const __CFURL *v6;
  const __CFURL *v7;
  int64_t v8;
  UInt8 buffer[250];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  objc_msgSend(a3, "URIRepresentation");
  v6 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = CFURLGetBytes(v6, buffer, 250);
    if (v8 >= 1)
      xpc_dictionary_set_data(v5, a2, buffer, v8);
  }

}

void PLXPCArrayAppendManagedObjectID(void *a1, void *a2)
{
  id v3;
  const __CFURL *v4;
  const __CFURL *v5;
  int64_t v6;
  UInt8 buffer[250];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "URIRepresentation");
  v4 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = CFURLGetBytes(v4, buffer, 250);
    if (v6 >= 1)
      xpc_array_set_data(v3, 0xFFFFFFFFFFFFFFFFLL, buffer, v6);
  }

}

PLSandboxedURL *PLSandboxedURLFromXPCDictionary(void *a1, const char *a2)
{
  id v3;
  void *v4;
  const char *v5;
  void *v6;
  PLSandboxedURL *v7;

  v3 = a1;
  PLURLFromXPCDictionary(v3, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (const char *)_PLSandboxedURLTokenKey((uint64_t)a2);
  PLStringFromXPCDictionary(v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PLSandboxedURL initWithURL:sandboxExtensionToken:consume:]([PLSandboxedURL alloc], "initWithURL:sandboxExtensionToken:consume:", v4, v6, 1);
  return v7;
}

uint64_t _PLSandboxedURLTokenKey(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingString:", CFSTR("__TOKEN"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_retainAutorelease(v2);
  v4 = objc_msgSend(v3, "UTF8String");

  return v4;
}

void PLXPCDictionarySetSandboxedURL(void *a1, const char *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  const char *v8;
  id v9;

  v9 = a3;
  v5 = a1;
  if (objc_msgSend(v9, "isFileURL"))
  {
    objc_msgSend(v9, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PLGetSandboxExtensionTokenWithFlags(v6, *MEMORY[0x1E0C80000], *MEMORY[0x1E0C806D0], 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  PLXPCDictionarySetURL(v5, a2, v9);
  v8 = (const char *)_PLSandboxedURLTokenKey((uint64_t)a2);
  PLXPCDictionarySetString(v5, v8, v7);

}

id PLGetSandboxExtensionToken(void *a1, uint64_t a2)
{
  return PLGetSandboxExtensionTokenWithFlags(a1, a2, *MEMORY[0x1E0C806D0], 0);
}

void PLDictionarySetSandboxedURL(void *a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = a1;
  if (objc_msgSend(v10, "isFileURL"))
  {
    objc_msgSend(v10, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PLGetSandboxExtensionTokenWithFlags(v6, *MEMORY[0x1E0C80000], *MEMORY[0x1E0C806D0], 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, v8);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", _PLSandboxedURLTokenKey(a2));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, v9);

}

PLSandboxedURL *PLSandboxedURLFromDictionary(void *a1, uint64_t a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PLSandboxedURL *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a1;
  objc_msgSend(v3, "stringWithUTF8String:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", _PLSandboxedURLTokenKey(a2));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[PLSandboxedURL initWithURL:sandboxExtensionToken:consume:]([PLSandboxedURL alloc], "initWithURL:sandboxExtensionToken:consume:", v6, v8, 1);
  return v9;
}

void PLJobLogDictionary(void *a1, void *a2)
{
  _PLJobLogDictionary(a1, 0, a2);
}

void _PLJobLogDictionary(void *a1, int a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  int v14;

  v10 = a1;
  v5 = a3;
  v6 = (void *)objc_msgSend(CFSTR("\t"), "mutableCopy");
  if (a2 >= 1)
  {
    v7 = a2;
    do
    {
      objc_msgSend(v6, "appendString:", CFSTR("\t"), v10);
      --v7;
    }
    while (v7);
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = ___PLJobLogDictionary_block_invoke;
  v11[3] = &unk_1E3768D38;
  v12 = v5;
  v13 = v6;
  v14 = a2;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v11);

}

xpc_object_t PLCreateMemoryMappedXPCObjectFromFileURL(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  id v7;
  int v8;
  size_t v9;
  void *v10;
  int v11;
  uint64_t *v12;
  uint64_t *v13;
  int v14;
  void *v15;
  uint64_t *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  xpc_object_t v30;
  int v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  int v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v41;
  _QWORD *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  objc_msgSend(v5, "path");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = open((const char *)objc_msgSend(v7, "fileSystemRepresentation"), 0);

  if (v8 <= 0)
  {
    v23 = *__error();
    v24 = (void *)MEMORY[0x1E0CB35C8];
    v25 = *MEMORY[0x1E0CB2FE0];
    v50 = *MEMORY[0x1E0CB2D50];
    v26 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "lastPathComponent");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("Unable to open '%@' for reading. (%s)"), v27, strerror(v23));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, v23, v29);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
  }
  else
  {
    v42 = a3;
    v43 = v5;
    v41 = v6;
    v9 = objc_msgSend(v6, "unsignedLongValue");
    v10 = mmap(0, v9, 1, 1, v8, 0);
    v11 = close(v8);
    v12 = (uint64_t *)MEMORY[0x1E0CB2FE0];
    v13 = (uint64_t *)MEMORY[0x1E0CB2D50];
    if (v11)
    {
      v14 = *__error();
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = v12;
      v17 = *v12;
      v48 = *v13;
      v18 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v43, "lastPathComponent");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("Error closing file '%@'. (%s)"), v19, strerror(v14));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", v17, v14, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = (uint64_t *)MEMORY[0x1E0CB2FE0];
      v22 = 0;
    }
    if (v10 == (void *)-1)
    {
      v36 = *__error();
      v37 = (void *)MEMORY[0x1E0CB35C8];
      v38 = *v16;
      v46 = *MEMORY[0x1E0CB2D50];
      v39 = (void *)MEMORY[0x1E0CB3940];
      v5 = v43;
      objc_msgSend(v43, "lastPathComponent");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "stringWithFormat:", CFSTR("mmap(2) failed for '%@'. (%s)"), v27, strerror(v36));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v28;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "errorWithDomain:code:userInfo:", v38, v36, v29);
      v35 = objc_claimAutoreleasedReturnValue();

      v30 = 0;
    }
    else
    {
      v30 = xpc_shmem_create(v10, v9);
      if (!munmap(v10, v9))
      {
        v6 = v41;
        a3 = v42;
        v5 = v43;
        if (!v42)
          goto LABEL_13;
        goto LABEL_12;
      }
      v31 = *__error();
      v32 = (void *)MEMORY[0x1E0CB35C8];
      v33 = *v16;
      v44 = *MEMORY[0x1E0CB2D50];
      v34 = (void *)MEMORY[0x1E0CB3940];
      v5 = v43;
      objc_msgSend(v43, "lastPathComponent");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "stringWithFormat:", CFSTR("munmap(2) failed for '%@'. (%s)"), v27, strerror(v31));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v28;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "errorWithDomain:code:userInfo:", v33, v31, v29);
      v35 = objc_claimAutoreleasedReturnValue();

    }
    v22 = (void *)v35;
    v6 = v41;
    a3 = v42;
  }

  if (a3)
LABEL_12:
    *a3 = objc_retainAutorelease(v22);
LABEL_13:

  return v30;
}

xpc_object_t PLCreateMemoryMappedXPCObjectFromData(void *a1, _QWORD *a2)
{
  id v3;
  size_t v4;
  size_t v5;
  void *v6;
  void *v7;
  xpc_object_t v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = objc_msgSend(v3, "length");
  if (!v4)
  {
    v15 = 0;
    v8 = 0;
    if (!a2)
      goto LABEL_10;
    goto LABEL_9;
  }
  v5 = v4;
  v6 = mmap(0, v4, 3, 4097, 1207959552, 0);
  if (v6 == (void *)-1)
  {
    v16 = *__error();
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0CB2FE0];
    v19 = v16;
    v23 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mmap(2) failed. (%s)"), strerror(v16));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, v19, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
  }
  else
  {
    v7 = v6;
    memcpy(v6, (const void *)objc_msgSend(objc_retainAutorelease(v3), "bytes"), v5);
    v8 = xpc_shmem_create(v7, v5);
    if (!munmap(v7, v5))
    {
      v15 = 0;
      if (!a2)
        goto LABEL_10;
      goto LABEL_9;
    }
    v9 = *__error();
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0CB2FE0];
    v12 = v9;
    v21 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("munmap(2) failed. (%s)"), strerror(v9), v21);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, v12, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (a2)
LABEL_9:
    *a2 = objc_retainAutorelease(v15);
LABEL_10:

  return v8;
}

id PLGetSandboxExtensionTokenIfPossible(void *a1, uint64_t a2)
{
  return PLGetSandboxExtensionTokenWithFlags(a1, a2, *MEMORY[0x1E0C806E0], 0);
}

id PLGetSandboxExtensionTokenForProcess(void *a1, uint64_t a2, uint64_t a3)
{
  return PLGetSandboxExtensionTokenWithFlags(a1, a2, *MEMORY[0x1E0C806D0], a3);
}

void PLXPCActivityRegister(const char *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD handler[4];
  id v11;
  id v12;
  const char *v13;

  v5 = a2;
  v6 = a3;
  v7 = (void *)*MEMORY[0x1E0C80748];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __PLXPCActivityRegister_block_invoke;
  handler[3] = &unk_1E3768CE0;
  v12 = v6;
  v13 = a1;
  v11 = v5;
  v8 = v6;
  v9 = v5;
  xpc_activity_register(a1, v7, handler);

}

void sub_199E42634(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_199E426B0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id PLDCIMURLForResourcePropertiesAndPathManager(uint64_t a1, unsigned int a2, unsigned int a3, int a4, void *a5, void *a6, void *a7, uint64_t a8)
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  objc_msgSend(v12, "photoDirectoryWithType:", 1);
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v16 = objc_msgSend(v15, "UTF8String");

  objc_msgSend(v12, "photoDirectoryWithType:", 4);
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v17, "UTF8String");

  objc_msgSend(v12, "photoDirectoryWithType:", 9);
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v19 = objc_msgSend(v18, "UTF8String");

  objc_msgSend(v12, "photoDirectoryWithType:", 10);
  v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v21 = objc_msgSend(v20, "UTF8String");

  objc_msgSend(v12, "photoDirectoryWithType:", 18);
  v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v23 = objc_msgSend(v22, "UTF8String");

  objc_msgSend(v12, "photoDirectoryWithType:", 12);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_retainAutorelease(v24);
  v26 = objc_msgSend(v25, "UTF8String");

  PLDCIMURLForResourceProperties(a1, a2, a3, a4, v14, v13, v16, v27, v19, v21, v23, v26, a8);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

id PLAggdGetLog()
{
  if (PLAggdGetLog_predicate != -1)
    dispatch_once(&PLAggdGetLog_predicate, &__block_literal_global_2207);
  return (id)PLAggdGetLog_log;
}

id PLAnalysisCoordinatorGetLog()
{
  if (PLAnalysisCoordinatorGetLog_predicate != -1)
    dispatch_once(&PLAnalysisCoordinatorGetLog_predicate, &__block_literal_global_2);
  return (id)PLAnalysisCoordinatorGetLog_log;
}

id PLAssetAnalysisGetLog()
{
  if (PLAssetAnalysisGetLog_predicate != -1)
    dispatch_once(&PLAssetAnalysisGetLog_predicate, &__block_literal_global_4_2210);
  return (id)PLAssetAnalysisGetLog_log;
}

id PLAssetImportGetLog()
{
  if (PLAssetImportGetLog_predicate != -1)
    dispatch_once(&PLAssetImportGetLog_predicate, &__block_literal_global_6);
  return (id)PLAssetImportGetLog_log;
}

id PLAvailabilityRequestGetLog()
{
  if (PLAvailabilityRequestGetLog_predicate != -1)
    dispatch_once(&PLAvailabilityRequestGetLog_predicate, &__block_literal_global_8);
  return (id)PLAvailabilityRequestGetLog_log;
}

id PLPhotoKitIngestGetLog()
{
  if (PLPhotoKitIngestGetLog_predicate != -1)
    dispatch_once(&PLPhotoKitIngestGetLog_predicate, &__block_literal_global_12);
  return (id)PLPhotoKitIngestGetLog_log;
}

id PLCPLGetLog()
{
  if (PLCPLGetLog_predicate != -1)
    dispatch_once(&PLCPLGetLog_predicate, &__block_literal_global_16);
  return (id)PLCPLGetLog_log;
}

id PLCPLSignpostsTelemetryGetLog()
{
  if (PLCPLSignpostsTelemetryGetLog_predicate != -1)
    dispatch_once(&PLCPLSignpostsTelemetryGetLog_predicate, &__block_literal_global_18_2222);
  return (id)PLCPLSignpostsTelemetryGetLog_log;
}

id PLCacheMetricsCollectorGetLog()
{
  if (PLCacheMetricsCollectorGetLog_predicate != -1)
    dispatch_once(&PLCacheMetricsCollectorGetLog_predicate, &__block_literal_global_20_2226);
  return (id)PLCacheMetricsCollectorGetLog_log;
}

id PLCameraConnectionKitGetLog()
{
  if (PLCameraConnectionKitGetLog_predicate != -1)
    dispatch_once(&PLCameraConnectionKitGetLog_predicate, &__block_literal_global_22);
  return (id)PLCameraConnectionKitGetLog_log;
}

id PLCloudResourcePruneGetLog()
{
  if (PLCloudResourcePruneGetLog_predicate != -1)
    dispatch_once(&PLCloudResourcePruneGetLog_predicate, &__block_literal_global_30);
  return (id)PLCloudResourcePruneGetLog_log;
}

id PLDaemonJobsGetLog()
{
  if (PLDaemonJobsGetLog_predicate != -1)
    dispatch_once(&PLDaemonJobsGetLog_predicate, &__block_literal_global_32);
  return (id)PLDaemonJobsGetLog_log;
}

id PLDeferredProcessingGetLog()
{
  if (PLDeferredProcessingGetLog_predicate != -1)
    dispatch_once(&PLDeferredProcessingGetLog_predicate, &__block_literal_global_34_2235);
  return (id)PLDeferredProcessingGetLog_log;
}

id PLDupesGetLog()
{
  if (PLDupesGetLog_predicate != -1)
    dispatch_once(&PLDupesGetLog_predicate, &__block_literal_global_36_2237);
  return (id)PLDupesGetLog_log;
}

id PLDuplicateDetectionGetLog()
{
  if (PLDuplicateDetectionGetLog_predicate != -1)
    dispatch_once(&PLDuplicateDetectionGetLog_predicate, &__block_literal_global_38);
  return (id)PLDuplicateDetectionGetLog_log;
}

id PLAssetStackGetLog()
{
  if (PLAssetStackGetLog_predicate != -1)
    dispatch_once(&PLAssetStackGetLog_predicate, &__block_literal_global_40_2240);
  return (id)PLAssetStackGetLog_log;
}

id PLImageWriterGetLog()
{
  if (PLImageWriterGetLog_predicate != -1)
    dispatch_once(&PLImageWriterGetLog_predicate, &__block_literal_global_46);
  return (id)PLImageWriterGetLog_log;
}

id PLImportantFetchGetLog()
{
  if (PLImportantFetchGetLog_predicate != -1)
    dispatch_once(&PLImportantFetchGetLog_predicate, &__block_literal_global_48_2248);
  return (id)PLImportantFetchGetLog_log;
}

id PLInterLibraryTransferGetLog()
{
  if (PLInterLibraryTransferGetLog_predicate != -1)
    dispatch_once(&PLInterLibraryTransferGetLog_predicate, &__block_literal_global_52_2251);
  return (id)PLInterLibraryTransferGetLog_log;
}

id PLMomentGenerationGetLog()
{
  if (PLMomentGenerationGetLog_predicate != -1)
    dispatch_once(&PLMomentGenerationGetLog_predicate, &__block_literal_global_60);
  return (id)PLMomentGenerationGetLog_log;
}

id PLMyPhotoStreamGetLog()
{
  if (PLMyPhotoStreamGetLog_predicate != -1)
    dispatch_once(&PLMyPhotoStreamGetLog_predicate, &__block_literal_global_62_2258);
  return (id)PLMyPhotoStreamGetLog_log;
}

id PLPhotoAnalysisQueriesGetLog()
{
  if (PLPhotoAnalysisQueriesGetLog_predicate != -1)
    dispatch_once(&PLPhotoAnalysisQueriesGetLog_predicate, &__block_literal_global_68);
  return (id)PLPhotoAnalysisQueriesGetLog_log;
}

id PLImportGetLog()
{
  if (PLImportGetLog_predicate != -1)
    dispatch_once(&PLImportGetLog_predicate, &__block_literal_global_74);
  return (id)PLImportGetLog_log;
}

id PLPrefetchGetLog()
{
  if (PLPrefetchGetLog_predicate != -1)
    dispatch_once(&PLPrefetchGetLog_predicate, &__block_literal_global_80);
  return (id)PLPrefetchGetLog_log;
}

id PLResourceCachingGetLog()
{
  if (PLResourceCachingGetLog_predicate != -1)
    dispatch_once(&PLResourceCachingGetLog_predicate, &__block_literal_global_82_2271);
  return (id)PLResourceCachingGetLog_log;
}

id PLSearchIndexGetLog()
{
  if (PLSearchIndexGetLog_predicate != -1)
    dispatch_once(&PLSearchIndexGetLog_predicate, &__block_literal_global_84_2273);
  return (id)PLSearchIndexGetLog_log;
}

id PLSyncGetLog()
{
  if (PLSyncGetLog_predicate != -1)
    dispatch_once(&PLSyncGetLog_predicate, &__block_literal_global_86);
  return (id)PLSyncGetLog_log;
}

id PLSyndicationGetLog()
{
  if (PLSyndicationGetLog_predicate != -1)
    dispatch_once(&PLSyndicationGetLog_predicate, &__block_literal_global_88_2276);
  return (id)PLSyndicationGetLog_log;
}

id PLThumbnailsGetLog()
{
  if (PLThumbnailsGetLog_predicate != -1)
    dispatch_once(&PLThumbnailsGetLog_predicate, &__block_literal_global_90_2280);
  return (id)PLThumbnailsGetLog_log;
}

id PLUserSmartAlbumGetLog()
{
  if (PLUserSmartAlbumGetLog_predicate != -1)
    dispatch_once(&PLUserSmartAlbumGetLog_predicate, &__block_literal_global_92_2282);
  return (id)PLUserSmartAlbumGetLog_log;
}

id PLUserFeedbackGetLog()
{
  if (PLUserFeedbackGetLog_predicate != -1)
    dispatch_once(&PLUserFeedbackGetLog_predicate, &__block_literal_global_94_2284);
  return (id)PLUserFeedbackGetLog_log;
}

id PLBackendSharingGetLog()
{
  if (PLBackendSharingGetLog_predicate != -1)
    dispatch_once(&PLBackendSharingGetLog_predicate, &__block_literal_global_98);
  return (id)PLBackendSharingGetLog_log;
}

id PLStoreDemoModeGetLog()
{
  if (PLStoreDemoModeGetLog_predicate != -1)
    dispatch_once(&PLStoreDemoModeGetLog_predicate, &__block_literal_global_100_2289);
  return (id)PLStoreDemoModeGetLog_log;
}

id PLAirPlayGetLog()
{
  if (PLAirPlayGetLog_predicate != -1)
    dispatch_once(&PLAirPlayGetLog_predicate, &__block_literal_global_102);
  return (id)PLAirPlayGetLog_log;
}

id PLAmbientPhotoFrameGetLog()
{
  if (PLAmbientPhotoFrameGetLog_predicate != -1)
    dispatch_once(&PLAmbientPhotoFrameGetLog_predicate, &__block_literal_global_104_2292);
  return (id)PLAmbientPhotoFrameGetLog_log;
}

id PLAnimationTelemetryGetLog()
{
  if (PLAnimationTelemetryGetLog_predicate != -1)
    dispatch_once(&PLAnimationTelemetryGetLog_predicate, &__block_literal_global_106);
  return (id)PLAnimationTelemetryGetLog_log;
}

id PLAudioPlaybackGetLog()
{
  if (PLAudioPlaybackGetLog_predicate != -1)
    dispatch_once(&PLAudioPlaybackGetLog_predicate, &__block_literal_global_108);
  return (id)PLAudioPlaybackGetLog_log;
}

id PLCloudFeedGetLog()
{
  if (PLCloudFeedGetLog_predicate != -1)
    dispatch_once(&PLCloudFeedGetLog_predicate, &__block_literal_global_110);
  return (id)PLCloudFeedGetLog_log;
}

id PLSharedAlbumsGetLog()
{
  if (PLSharedAlbumsGetLog_predicate != -1)
    dispatch_once(&PLSharedAlbumsGetLog_predicate, &__block_literal_global_112);
  return (id)PLSharedAlbumsGetLog_log;
}

id PLSharingGetLog()
{
  if (PLSharingGetLog_predicate != -1)
    dispatch_once(&PLSharingGetLog_predicate, &__block_literal_global_114);
  return (id)PLSharingGetLog_log;
}

id PLGridZeroGetLog()
{
  if (PLGridZeroGetLog_predicate != -1)
    dispatch_once(&PLGridZeroGetLog_predicate, &__block_literal_global_122_2302);
  return (id)PLGridZeroGetLog_log;
}

id PLLivePhotoPlaybackGetLog()
{
  if (PLLivePhotoPlaybackGetLog_predicate != -1)
    dispatch_once(&PLLivePhotoPlaybackGetLog_predicate, &__block_literal_global_124_2304);
  return (id)PLLivePhotoPlaybackGetLog_log;
}

id PLMemoriesGetLog()
{
  if (PLMemoriesGetLog_predicate != -1)
    dispatch_once(&PLMemoriesGetLog_predicate, &__block_literal_global_126);
  return (id)PLMemoriesGetLog_log;
}

id PLMomentsGetLog()
{
  if (PLMomentsGetLog_predicate != -1)
    dispatch_once(&PLMomentsGetLog_predicate, &__block_literal_global_128);
  return (id)PLMomentsGetLog_log;
}

id PLOneUpGetLog()
{
  if (PLOneUpGetLog_predicate != -1)
    dispatch_once(&PLOneUpGetLog_predicate, &__block_literal_global_130);
  return (id)PLOneUpGetLog_log;
}

id PLPAImageGetLog()
{
  if (PLPAImageGetLog_predicate != -1)
    dispatch_once(&PLPAImageGetLog_predicate, &__block_literal_global_132);
  return (id)PLPAImageGetLog_log;
}

id PLPALayerGetLog()
{
  if (PLPALayerGetLog_predicate != -1)
    dispatch_once(&PLPALayerGetLog_predicate, &__block_literal_global_134);
  return (id)PLPALayerGetLog_log;
}

id PLPeopleGetLog()
{
  if (PLPeopleGetLog_predicate != -1)
    dispatch_once(&PLPeopleGetLog_predicate, &__block_literal_global_136);
  return (id)PLPeopleGetLog_log;
}

id PLPhotoEditGetLog()
{
  if (PLPhotoEditGetLog_predicate != -1)
    dispatch_once(&PLPhotoEditGetLog_predicate, &__block_literal_global_140);
  return (id)PLPhotoEditGetLog_log;
}

id PLPhotoPickerGetLog()
{
  if (PLPhotoPickerGetLog_predicate != -1)
    dispatch_once(&PLPhotoPickerGetLog_predicate, &__block_literal_global_142);
  return (id)PLPhotoPickerGetLog_log;
}

id PLPhotosSearchGetLog()
{
  if (PLPhotosSearchGetLog_predicate != -1)
    dispatch_once(&PLPhotosSearchGetLog_predicate, &__block_literal_global_144);
  return (id)PLPhotosSearchGetLog_log;
}

id PLPickerGetLog()
{
  if (PLPickerGetLog_predicate != -1)
    dispatch_once(&PLPickerGetLog_predicate, &__block_literal_global_146);
  return (id)PLPickerGetLog_log;
}

id PLRelatedGetLog()
{
  if (PLRelatedGetLog_predicate != -1)
    dispatch_once(&PLRelatedGetLog_predicate, &__block_literal_global_150);
  return (id)PLRelatedGetLog_log;
}

id PLShareSheetGetLog()
{
  if (PLShareSheetGetLog_predicate != -1)
    dispatch_once(&PLShareSheetGetLog_predicate, &__block_literal_global_152);
  return (id)PLShareSheetGetLog_log;
}

id PLSidebarGetLog()
{
  if (PLSidebarGetLog_predicate != -1)
    dispatch_once(&PLSidebarGetLog_predicate, &__block_literal_global_156);
  return (id)PLSidebarGetLog_log;
}

id PLStoryGetLog()
{
  if (PLStoryGetLog_predicate != -1)
    dispatch_once(&PLStoryGetLog_predicate, &__block_literal_global_158);
  return (id)PLStoryGetLog_log;
}

id PLHomeGetLog()
{
  if (PLHomeGetLog_predicate != -1)
    dispatch_once(&PLHomeGetLog_predicate, &__block_literal_global_160);
  return (id)PLHomeGetLog_log;
}

id PLLemonadeGetLog()
{
  if (PLLemonadeGetLog_predicate != -1)
    dispatch_once(&PLLemonadeGetLog_predicate, &__block_literal_global_162);
  return (id)PLLemonadeGetLog_log;
}

id PLUIActionsGetLog()
{
  if (PLUIActionsGetLog_predicate != -1)
    dispatch_once(&PLUIActionsGetLog_predicate, &__block_literal_global_166);
  return (id)PLUIActionsGetLog_log;
}

id PLVideoPlaybackGetLog()
{
  if (PLVideoPlaybackGetLog_predicate != -1)
    dispatch_once(&PLVideoPlaybackGetLog_predicate, &__block_literal_global_172);
  return (id)PLVideoPlaybackGetLog_log;
}

id PLWallpaperGetLog()
{
  if (PLWallpaperGetLog_predicate != -1)
    dispatch_once(&PLWallpaperGetLog_predicate, &__block_literal_global_174);
  return (id)PLWallpaperGetLog_log;
}

id PLGadgetsGetLog()
{
  if (PLGadgetsGetLog_predicate != -1)
    dispatch_once(&PLGadgetsGetLog_predicate, &__block_literal_global_178);
  return (id)PLGadgetsGetLog_log;
}

id PLPlacesGetLog()
{
  if (PLPlacesGetLog_predicate != -1)
    dispatch_once(&PLPlacesGetLog_predicate, &__block_literal_global_180);
  return (id)PLPlacesGetLog_log;
}

id PLTipsGetLog()
{
  if (PLTipsGetLog_predicate != -1)
    dispatch_once(&PLTipsGetLog_predicate, &__block_literal_global_182);
  return (id)PLTipsGetLog_log;
}

id PLAppIntentsGetLog()
{
  if (PLAppIntentsGetLog_predicate != -1)
    dispatch_once(&PLAppIntentsGetLog_predicate, &__block_literal_global_184);
  return (id)PLAppIntentsGetLog_log;
}

id PLUserActivityGetLog()
{
  if (PLUserActivityGetLog_predicate != -1)
    dispatch_once(&PLUserActivityGetLog_predicate, &__block_literal_global_186);
  return (id)PLUserActivityGetLog_log;
}

id PLContentPrivacyUIGetLog()
{
  if (PLContentPrivacyUIGetLog_predicate != -1)
    dispatch_once(&PLContentPrivacyUIGetLog_predicate, &__block_literal_global_192);
  return (id)PLContentPrivacyUIGetLog_log;
}

id PLAssetExplorerGetLog()
{
  if (PLAssetExplorerGetLog_predicate != -1)
    dispatch_once(&PLAssetExplorerGetLog_predicate, &__block_literal_global_196);
  return (id)PLAssetExplorerGetLog_log;
}

id PLCameraGetLog()
{
  if (PLCameraGetLog_predicate != -1)
    dispatch_once(&PLCameraGetLog_predicate, &__block_literal_global_199);
  return (id)PLCameraGetLog_log;
}

id PLTimelineGetLog()
{
  if (PLTimelineGetLog_predicate != -1)
    dispatch_once(&PLTimelineGetLog_predicate, &__block_literal_global_202_2320);
  return (id)PLTimelineGetLog_log;
}

id PLUpNextGetLog()
{
  if (PLUpNextGetLog_predicate != -1)
    dispatch_once(&PLUpNextGetLog_predicate, &__block_literal_global_205);
  return (id)PLUpNextGetLog_log;
}

id PLPhotosSearchCurationGetLog()
{
  if (PLPhotosSearchCurationGetLog_predicate != -1)
    dispatch_once(&PLPhotosSearchCurationGetLog_predicate, &__block_literal_global_208);
  return (id)PLPhotosSearchCurationGetLog_log;
}

id PLPhotosStatusGetLog()
{
  if (PLPhotosStatusGetLog_predicate != -1)
    dispatch_once(&PLPhotosStatusGetLog_predicate, &__block_literal_global_211);
  return (id)PLPhotosStatusGetLog_log;
}

id PLSearchUIDisplayGetLog()
{
  if (PLSearchUIDisplayGetLog_predicate != -1)
    dispatch_once(&PLSearchUIDisplayGetLog_predicate, &__block_literal_global_214);
  return (id)PLSearchUIDisplayGetLog_log;
}

id PLSearchUIQueryGetLog()
{
  if (PLSearchUIQueryGetLog_predicate != -1)
    dispatch_once(&PLSearchUIQueryGetLog_predicate, &__block_literal_global_216);
  return (id)PLSearchUIQueryGetLog_log;
}

id PLSearchUIParsecAnalyticsGetLog()
{
  if (PLSearchUIParsecAnalyticsGetLog_predicate != -1)
    dispatch_once(&PLSearchUIParsecAnalyticsGetLog_predicate, &__block_literal_global_218);
  return (id)PLSearchUIParsecAnalyticsGetLog_log;
}

id PLSearchUIAssetCurationGetLog()
{
  if (PLSearchUIAssetCurationGetLog_predicate != -1)
    dispatch_once(&PLSearchUIAssetCurationGetLog_predicate, &__block_literal_global_220);
  return (id)PLSearchUIAssetCurationGetLog_log;
}

id PLSearchUISpotlightGetLog()
{
  if (PLSearchUISpotlightGetLog_predicate != -1)
    dispatch_once(&PLSearchUISpotlightGetLog_predicate, &__block_literal_global_222);
  return (id)PLSearchUISpotlightGetLog_log;
}

id PLSearchUIBiomeGetLog()
{
  if (PLSearchUIBiomeGetLog_predicate != -1)
    dispatch_once(&PLSearchUIBiomeGetLog_predicate, &__block_literal_global_224);
  return (id)PLSearchUIBiomeGetLog_log;
}

id PLSearchBackendIndexStatusGetLog()
{
  if (PLSearchBackendIndexStatusGetLog_predicate != -1)
    dispatch_once(&PLSearchBackendIndexStatusGetLog_predicate, &__block_literal_global_226);
  return (id)PLSearchBackendIndexStatusGetLog_log;
}

id PLSearchBackendIndexRebuildGetLog()
{
  if (PLSearchBackendIndexRebuildGetLog_predicate != -1)
    dispatch_once(&PLSearchBackendIndexRebuildGetLog_predicate, &__block_literal_global_228);
  return (id)PLSearchBackendIndexRebuildGetLog_log;
}

id PLSearchBackendIndexingEngineGetLog()
{
  if (PLSearchBackendIndexingEngineGetLog_predicate != -1)
    dispatch_once(&PLSearchBackendIndexingEngineGetLog_predicate, &__block_literal_global_232);
  return (id)PLSearchBackendIndexingEngineGetLog_log;
}

id PLSearchBackendIndexWorkerGetLog()
{
  if (PLSearchBackendIndexWorkerGetLog_predicate != -1)
    dispatch_once(&PLSearchBackendIndexWorkerGetLog_predicate, &__block_literal_global_234);
  return (id)PLSearchBackendIndexWorkerGetLog_log;
}

id PLSearchBackendLibraryChangeTrackingGetLog()
{
  if (PLSearchBackendLibraryChangeTrackingGetLog_predicate != -1)
    dispatch_once(&PLSearchBackendLibraryChangeTrackingGetLog_predicate, &__block_literal_global_236);
  return (id)PLSearchBackendLibraryChangeTrackingGetLog_log;
}

id PLSearchBackendGraphUpdatesGetLog()
{
  if (PLSearchBackendGraphUpdatesGetLog_predicate != -1)
    dispatch_once(&PLSearchBackendGraphUpdatesGetLog_predicate, &__block_literal_global_238);
  return (id)PLSearchBackendGraphUpdatesGetLog_log;
}

id PLSearchBackendDonationsGetLog()
{
  if (PLSearchBackendDonationsGetLog_predicate != -1)
    dispatch_once(&PLSearchBackendDonationsGetLog_predicate, &__block_literal_global_240);
  return (id)PLSearchBackendDonationsGetLog_log;
}

id PLSearchBackendDonationProgressGetLog()
{
  if (PLSearchBackendDonationProgressGetLog_predicate != -1)
    dispatch_once(&PLSearchBackendDonationProgressGetLog_predicate, &__block_literal_global_242);
  return (id)PLSearchBackendDonationProgressGetLog_log;
}

id PLSearchBackendModelTranslationGetLog()
{
  if (PLSearchBackendModelTranslationGetLog_predicate != -1)
    dispatch_once(&PLSearchBackendModelTranslationGetLog_predicate, &__block_literal_global_244);
  return (id)PLSearchBackendModelTranslationGetLog_log;
}

id PLSearchBackendStickerSuggestionsGetLog()
{
  if (PLSearchBackendStickerSuggestionsGetLog_predicate != -1)
    dispatch_once(&PLSearchBackendStickerSuggestionsGetLog_predicate, &__block_literal_global_246);
  return (id)PLSearchBackendStickerSuggestionsGetLog_log;
}

id PLSearchBackendPhotosDatabaseFetchGetLog()
{
  if (PLSearchBackendPhotosDatabaseFetchGetLog_predicate != -1)
    dispatch_once(&PLSearchBackendPhotosDatabaseFetchGetLog_predicate, &__block_literal_global_248);
  return (id)PLSearchBackendPhotosDatabaseFetchGetLog_log;
}

id PLSearchBackendSceneTaxonomyGetLog()
{
  if (PLSearchBackendSceneTaxonomyGetLog_predicate != -1)
    dispatch_once(&PLSearchBackendSceneTaxonomyGetLog_predicate, &__block_literal_global_250);
  return (id)PLSearchBackendSceneTaxonomyGetLog_log;
}

id PLSearchBackendQueryGetLog()
{
  if (PLSearchBackendQueryGetLog_predicate != -1)
    dispatch_once(&PLSearchBackendQueryGetLog_predicate, &__block_literal_global_252);
  return (id)PLSearchBackendQueryGetLog_log;
}

id PLSearchBackendResultProcessingGetLog()
{
  if (PLSearchBackendResultProcessingGetLog_predicate != -1)
    dispatch_once(&PLSearchBackendResultProcessingGetLog_predicate, &__block_literal_global_254);
  return (id)PLSearchBackendResultProcessingGetLog_log;
}

id PLSearchBackendPSIDatabaseGetLog()
{
  if (PLSearchBackendPSIDatabaseGetLog_predicate != -1)
    dispatch_once(&PLSearchBackendPSIDatabaseGetLog_predicate, &__block_literal_global_256);
  return (id)PLSearchBackendPSIDatabaseGetLog_log;
}

id PLSearchBackendIndexStatusMaintenanceTaskGetLog()
{
  if (PLSearchBackendIndexStatusMaintenanceTaskGetLog_predicate != -1)
    dispatch_once(&PLSearchBackendIndexStatusMaintenanceTaskGetLog_predicate, &__block_literal_global_258);
  return (id)PLSearchBackendIndexStatusMaintenanceTaskGetLog_log;
}

id PLSearchBackendPhotoKitAPIGetLog()
{
  if (PLSearchBackendPhotoKitAPIGetLog_predicate != -1)
    dispatch_once(&PLSearchBackendPhotoKitAPIGetLog_predicate, &__block_literal_global_260);
  return (id)PLSearchBackendPhotoKitAPIGetLog_log;
}

id PLSearchBackendInitialSuggestionsGetLog()
{
  if (PLSearchBackendInitialSuggestionsGetLog_predicate != -1)
    dispatch_once(&PLSearchBackendInitialSuggestionsGetLog_predicate, &__block_literal_global_262);
  return (id)PLSearchBackendInitialSuggestionsGetLog_log;
}

id PLSearchBackendRecentSuggestionsGetLog()
{
  if (PLSearchBackendRecentSuggestionsGetLog_predicate != -1)
    dispatch_once(&PLSearchBackendRecentSuggestionsGetLog_predicate, &__block_literal_global_264);
  return (id)PLSearchBackendRecentSuggestionsGetLog_log;
}

void sub_199E48418(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void PLDonateMomentShareURL(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[16];

  v3 = a2;
  v4 = a1;
  PLGatekeeperXPCGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199DF7000, v5, OS_LOG_TYPE_DEFAULT, "Received moment share donation URL from external client", buf, 2u);
  }

  +[PLAssetsdClient sharedSystemLibraryAssetsdClient](PLAssetsdClient, "sharedSystemLibraryAssetsdClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cloudInternalClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __PLDonateMomentShareURL_block_invoke;
  v9[3] = &unk_1E3769448;
  v10 = v3;
  v8 = v3;
  objc_msgSend(v7, "fetchShareFromShareURL:ignoreExistingShare:completionHandler:", v4, 0, v9);

}

void pl_dispatch_group_async(NSObject *a1, NSObject *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __pl_dispatch_group_async_block_invoke;
  block[3] = &unk_1E376C0E0;
  v8 = v5;
  v6 = v5;
  dispatch_group_async(a1, a2, block);

}

void __pl_dispatch_group_async_block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x19AEC2E4C]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

void pl_dispatch_async_without_boost(dispatch_block_t block)
{
  dispatch_block_t v1;
  NSObject *v2;
  id v3;
  _QWORD blocka[4];
  id v5;

  v1 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_DETACHED, QOS_CLASS_BACKGROUND, 0, block);
  dispatch_get_global_queue(9, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  blocka[0] = MEMORY[0x1E0C809B0];
  blocka[1] = 3221225472;
  blocka[2] = __pl_dispatch_async_without_boost_block_invoke;
  blocka[3] = &unk_1E376C0E0;
  v5 = v1;
  v3 = v1;
  dispatch_async(v2, blocka);

}

void __pl_dispatch_async_without_boost_block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x19AEC2E4C]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

void pl_dispatch_async_without_boost_on_queue(void *a1, void *a2)
{
  NSObject *v3;
  dispatch_block_t v4;

  v3 = a1;
  v4 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_DETACHED, QOS_CLASS_BACKGROUND, 0, a2);
  dispatch_async(v3, v4);

}

void pl_dispatch_group_notify(NSObject *a1, NSObject *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __pl_dispatch_group_notify_block_invoke;
  block[3] = &unk_1E376C0E0;
  v8 = v5;
  v6 = v5;
  dispatch_group_notify(a1, a2, block);

}

void __pl_dispatch_group_notify_block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x19AEC2E4C]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

void pl_dispatch_barrier_async(NSObject *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __pl_dispatch_barrier_async_block_invoke;
  block[3] = &unk_1E376C0E0;
  v6 = v3;
  v4 = v3;
  dispatch_barrier_async(a1, block);

}

void __pl_dispatch_barrier_async_block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x19AEC2E4C]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

void pl_dispatch_after(dispatch_time_t a1, NSObject *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __pl_dispatch_after_block_invoke;
  block[3] = &unk_1E376C0E0;
  v8 = v5;
  v6 = v5;
  dispatch_after(a1, a2, block);

}

void __pl_dispatch_source_set_event_handler_block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x19AEC2E4C]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

void pl_notify_disable_for_shutdown()
{
  NSObject *v0;
  uint8_t v1[16];

  PLBackendGetLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_199DF7000, v0, OS_LOG_TYPE_DEFAULT, "Disabling libnotify calls due to shutdown", v1, 2u);
  }

  atomic_store(1u, sNotifyIsDisabledForShutdown);
}

void __pl_notify_register_dispatch_block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x19AEC2E4C]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

uint64_t pl_notify_post_with_retry(char *name, int a2)
{
  unsigned __int8 v2;
  char v5;
  int v6;
  NSObject *v7;
  uint64_t result;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = atomic_load(sNotifyIsDisabledForShutdown);
  if ((v2 & 1) != 0)
    return 0;
  v5 = 0;
  v6 = 1;
  do
  {
    if ((v5 & 1) != 0)
    {
      PLBackendGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109890;
        v11 = 1000000;
        v12 = 2080;
        v13 = name;
        v14 = 1024;
        v15 = v6 - 1;
        v16 = 1024;
        v17 = a2;
        _os_log_impl(&dword_199DF7000, v7, OS_LOG_TYPE_ERROR, "Error %d occurred while trying to call notify_post for: %s. (attempt number: %d of %d)", buf, 0x1Eu);
      }

      usleep(0x186A0u);
    }
    result = notify_post(name);
    if ((_DWORD)result != 1000000)
      break;
    v5 = 1;
  }
  while (v6++ < a2);
  return result;
}

NSObject *pl_dispatch_queue_create_with_fallback_qos(const char *a1, dispatch_queue_attr_t attr)
{
  NSObject *v3;
  NSObject *v4;

  dispatch_queue_attr_make_initially_inactive(attr);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create(a1, v3);
  dispatch_set_qos_class_fallback();
  dispatch_activate(v4);

  return v4;
}

NSObject *pl_dispatch_queue_create_with_qos_and_fallback_qos(const char *a1, dispatch_queue_attr_t attr)
{
  NSObject *v3;
  NSObject *v4;

  dispatch_queue_attr_make_initially_inactive(attr);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create(a1, v3);
  dispatch_set_qos_class();
  dispatch_set_qos_class_fallback();
  dispatch_activate(v4);

  return v4;
}

void sub_199E4AAAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2791(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2792(uint64_t a1)
{

}

void ALGetPhotosAndVideosCount(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v1 = a1;
  if (v1)
  {
    ALSharedAssetsdClient();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "libraryInternalClient");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __ALGetPhotosAndVideosCount_block_invoke;
    v4[3] = &unk_1E3769528;
    v5 = v1;
    objc_msgSend(v3, "getAssetCountsWithReply:", v4);

  }
}

id ALSharedAssetsdClient()
{
  if (ALSharedAssetsdClient_onceToken != -1)
    dispatch_once(&ALSharedAssetsdClient_onceToken, &__block_literal_global_2904);
  return (id)ALSharedAssetsdClient_assetsdClient;
}

id ALRegisterForPhotosAndVideosCount(void *a1, NSObject *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD handler[4];
  id v9;
  int out_token;

  v3 = a1;
  out_token = 0;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __ALRegisterForPhotosAndVideosCount_block_invoke;
  handler[3] = &unk_1E3769550;
  v4 = v3;
  v9 = v4;
  v5 = notify_register_dispatch("ALPhotosAndVideosCount", &out_token, a2, handler);
  if ((_DWORD)v5)
  {
    NSLog((NSString *)CFSTR("notify_register_dispatch() failed for ALRegisterForPhotosAndVideosCount(). (%d)"), v5);
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", out_token);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

void ALUnregisterForPhotosAndVideosCount(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  id v4;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v4 = v1;
    v3 = notify_cancel(objc_msgSend(v1, "intValue"));
    v2 = v4;
    if ((_DWORD)v3)
    {
      NSLog((NSString *)CFSTR("notify_cancel() failed for ALUnregisterForPhotosAndVideosCount(). (%d)"), v4, v3);
      v2 = v4;
    }
  }

}

unint64_t ALSecondsNeededToMigrateStore(void *a1)
{
  sqlite3_int64 v1;

  v1 = PLGenericAssetCountInDatabaseWithPath((const char *)objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation"));
  if (v1 == -1)
    return 30;
  if (v1 >= 100)
    return v1 / 0x53uLL;
  return 1;
}

void ALGetLibrarySizes(void *a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  BOOL v17;
  NSObject *v18;
  id v19;
  _QWORD block[4];
  id v21;
  unint64_t v22;
  _QWORD v23[4];
  NSObject *v24;
  id v25;
  __int128 *p_buf;
  id v27;
  id v28;
  __int128 buf;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v19 = a1;
  v5 = a3;
  ALSharedAssetsdClient();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "libraryInternalClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v28 = 0;
  v8 = objc_msgSend(v7, "synchronouslyGetLibrarySizesFromDB:sizes:error:", 0, &v28, &v27);
  v9 = v28;
  v10 = v27;

  if (v8)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v30 = 0x2020000000;
    v11 = MEMORY[0x1E0C809B0];
    v31 = a2;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __ALGetLibrarySizes_block_invoke;
    v23[3] = &unk_1E37695A0;
    p_buf = &buf;
    v12 = v19;
    v24 = v12;
    v13 = v5;
    v25 = v13;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v23);
    v14 = *((_QWORD *)&buf + 1);
    v15 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 24);
    if (v15)
    {
      v16 = 1;
      do
      {
        if ((v15 & v16) != 0)
        {
          block[0] = v11;
          block[1] = 3221225472;
          block[2] = __ALGetLibrarySizes_block_invoke_3;
          block[3] = &unk_1E37695C8;
          v21 = v13;
          v22 = v16;
          dispatch_async(v12, block);

          v14 = *((_QWORD *)&buf + 1);
        }
        v15 = *(_QWORD *)(v14 + 24) & ~v16;
        *(_QWORD *)(v14 + 24) = v15;
        if (v15)
          v17 = v16 >= 8;
        else
          v17 = 1;
        v16 *= 2;
      }
      while (!v17);
    }

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    PLBackendGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v10;
      _os_log_impl(&dword_199DF7000, v18, OS_LOG_TYPE_FAULT, "Failed to get library sizes with error: %@", (uint8_t *)&buf, 0xCu);
    }

    (*((void (**)(id, uint64_t, _QWORD))v5 + 2))(v5, a2, 0);
  }

}

void sub_199E4BCAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199E4C270(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2947(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2948(uint64_t a1)
{

}

void sub_199E4CD04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3012(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3013(uint64_t a1)
{

}

void sub_199E4D35C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_199E4D6B8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_199E4DB48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,void *a34,os_signpost_id_t a35,os_activity_scope_state_s a36,SEL sel)
{
  uint64_t v37;
  uint64_t v38;
  NSObject *v40;
  NSObject *v41;
  const char *Name;

  if (a33)
    os_activity_scope_leave(&a36);
  if (a35)
  {
    PLRequestGetLog();
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = v40;
    if (a35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
    {
      Name = sel_getName(sel);
      *(_DWORD *)(v38 - 160) = 136446210;
      *(_QWORD *)(v37 + 52) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v41, OS_SIGNPOST_INTERVAL_END, a35, "PLXPC Sync", "%{public}s", (uint8_t *)(v38 - 160), 0xCu);
    }

  }
  _Unwind_Resume(a1);
}

void sub_199E4DFDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,void *a32,os_signpost_id_t a33,os_activity_scope_state_s a34,SEL sel)
{
  uint64_t v35;
  uint64_t v36;
  NSObject *v38;
  NSObject *v39;
  const char *Name;

  if (a31)
    os_activity_scope_leave(&a34);
  if (a33)
  {
    PLRequestGetLog();
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = v38;
    if (a33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
    {
      Name = sel_getName(sel);
      *(_DWORD *)(v36 - 144) = 136446210;
      *(_QWORD *)(v35 + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v39, OS_SIGNPOST_INTERVAL_END, a33, "PLXPC Sync", "%{public}s", (uint8_t *)(v36 - 144), 0xCu);
    }

  }
  _Unwind_Resume(a1);
}

void sub_199E4E3BC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_199E4E7CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,void *a22,os_signpost_id_t a23,os_activity_scope_state_s a24,SEL sel,int buf)
{
  uint64_t v26;
  NSObject *v28;
  NSObject *v29;
  const char *Name;

  if (a21)
    os_activity_scope_leave(&a24);
  if (a23)
  {
    PLRequestGetLog();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (a23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      Name = sel_getName(sel);
      buf = 136446210;
      *(_QWORD *)(v26 + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v29, OS_SIGNPOST_INTERVAL_END, a23, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  _Unwind_Resume(a1);
}

void sub_199E4EAB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_199E4EE64(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_199E4F2A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,os_signpost_id_t a27,os_activity_scope_state_s a28,SEL sel)
{
  uint64_t v29;
  uint64_t v30;
  NSObject *v32;
  NSObject *v33;
  const char *Name;

  if (a25)
    os_activity_scope_leave(&a28);
  if (a27)
  {
    PLRequestGetLog();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (a27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      Name = sel_getName(sel);
      *(_DWORD *)(v30 - 144) = 136446210;
      *(_QWORD *)(v29 + 52) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v33, OS_SIGNPOST_INTERVAL_END, a27, "PLXPC Sync", "%{public}s", (uint8_t *)(v30 - 144), 0xCu);
    }

  }
  _Unwind_Resume(a1);
}

void sub_199E4F5CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,void *a24,uint64_t a25,uint64_t a26,uint64_t a27,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E4F914(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E4FC60(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_199E4FFA4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_199E50420(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,void *a32,os_signpost_id_t a33,os_activity_scope_state_s a34,SEL sel)
{
  uint64_t v35;
  uint64_t v36;
  NSObject *v38;
  NSObject *v39;
  const char *Name;

  if (a31)
    os_activity_scope_leave(&a34);
  if (a33)
  {
    PLRequestGetLog();
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = v38;
    if (a33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
    {
      Name = sel_getName(sel);
      *(_DWORD *)(v36 - 128) = 136446210;
      *(_QWORD *)(v35 + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v39, OS_SIGNPOST_INTERVAL_END, a33, "PLXPC Sync", "%{public}s", (uint8_t *)(v36 - 128), 0xCu);
    }

  }
  _Unwind_Resume(a1);
}

void sub_199E5079C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{

  _Unwind_Resume(a1);
}

void sub_199E50AF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E50EA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,os_signpost_id_t a27,os_activity_scope_state_s a28,SEL sel)
{
  uint64_t v29;
  uint64_t v30;
  NSObject *v32;
  NSObject *v33;
  const char *Name;

  if (a25)
    os_activity_scope_leave(&a28);
  if (a27)
  {
    PLRequestGetLog();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (a27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      Name = sel_getName(sel);
      *(_DWORD *)(v30 - 144) = 136446210;
      *(_QWORD *)(v29 + 52) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v33, OS_SIGNPOST_INTERVAL_END, a27, "PLXPC Sync", "%{public}s", (uint8_t *)(v30 - 144), 0xCu);
    }

  }
  _Unwind_Resume(a1);
}

void sub_199E511F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,void *a24,uint64_t a25,uint64_t a26,uint64_t a27,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E51548(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E51898(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E51B84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{

  _Unwind_Resume(a1);
}

void sub_199E51E78(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_199E521C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E525C8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_199E5293C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_199E52C48(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_199E52F6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_199E53254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_199E53648(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E539BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{

  _Unwind_Resume(a1);
}

void sub_199E53CB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E540A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E54418(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,void *a30,uint64_t a31,uint64_t a32,uint64_t a33,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E54760(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_199E54AA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E54E08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E55158(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E554B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,SEL sel)
{

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3102(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3103(uint64_t a1)
{

}

void sub_199E590E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199E59340(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3258(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3259(uint64_t a1)
{

}

__CFString *build_error_event_string(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  if (a1)
  {
    v1 = (void *)MEMORY[0x1E0CB3940];
    v2 = a1;
    objc_msgSend(v2, "domain");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "stringWithFormat:", CFSTR("%@_%ld"), v3, objc_msgSend(v2, "code"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      build_error_event_string(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString stringByAppendingFormat:](v4, "stringByAppendingFormat:", CFSTR(":%@"), v7);
      v8 = objc_claimAutoreleasedReturnValue();

      v4 = (__CFString *)v8;
    }

  }
  else
  {
    v4 = CFSTR("unknown");
  }
  return v4;
}

id PLUUIDDataFromString(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[2];

  v1 = a1;
  if (v1)
  {
    v2 = objc_opt_class();
    if (v2 == objc_opt_class())
    {
      objc_msgSend(v1, "UUIDData");
      v4 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7[0] = PLUUIDBytesFromString(v1);
      v7[1] = v3;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v7, 16);
      v4 = objc_claimAutoreleasedReturnValue();
    }
    v5 = (void *)v4;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t PLUUIDBytesFromString(void *a1)
{
  __CFString *v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  int v6;
  BOOL v7;
  const char *v8;
  int8x16_t v9;
  int8x16_t v10;
  uint8x16_t v11;
  int8x16_t v12;
  int8x16_t v13;
  uint8x16_t v14;
  int8x16_t v15;
  int8x16_t v16;
  int8x16_t v17;
  int8x16_t v18;
  int8x16_t v19;
  uint64_t v20;
  const __CFUUID *v21;
  const __CFUUID *v22;
  _WORD v24[64];
  _BYTE v25[33];
  uint64_t v26;
  int8x16x2_t v27;

  v26 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!v1)
    goto LABEL_17;
  v2 = objc_opt_class();
  if (v2 == objc_opt_class())
  {
    v20 = -[__CFString UUIDBytes](v1, "UUIDBytes");
    goto LABEL_19;
  }
  v3 = -[__CFString length](v1, "length");
  -[__CFString getCharacters:range:](v1, "getCharacters:range:", v24, 0, v3);
  if (!v3)
    goto LABEL_15;
  v4 = 0;
  v5 = 0;
  do
  {
    v6 = v24[v4];
    if ((v6 - 48) < 0xA
      || ((v6 - 65) <= 0x25
        ? (v7 = ((1 << (v6 - 65)) & 0x3F0000003FLL) == 0)
        : (v7 = 1),
          !v7))
    {
      v25[v5++] = v6;
    }
    ++v4;
  }
  while (v4 < v3 && v5 < 0x20);
  if (v5 != 32)
  {
LABEL_15:
    v21 = CFUUIDCreateFromString(0, v1);
    if (v21)
    {
      v22 = v21;
      v20 = *(_OWORD *)&CFUUIDGetUUIDBytes(v21);
      CFAutorelease(v22);
      goto LABEL_19;
    }
LABEL_17:
    v20 = 0;
    goto LABEL_19;
  }
  v8 = v25;
  v27 = vld2q_s8(v8);
  v9.i64[0] = 0xD0D0D0D0D0D0D0D0;
  v9.i64[1] = 0xD0D0D0D0D0D0D0D0;
  v10 = vaddq_s8(v27.val[0], v9);
  v11.i64[0] = 0xA0A0A0A0A0A0A0ALL;
  v11.i64[1] = 0xA0A0A0A0A0A0A0ALL;
  v12 = (int8x16_t)vcgtq_u8(v11, (uint8x16_t)v10);
  v13.i64[0] = 0x9F9F9F9F9F9F9F9FLL;
  v13.i64[1] = 0x9F9F9F9F9F9F9F9FLL;
  v14.i64[0] = 0x606060606060606;
  v14.i64[1] = 0x606060606060606;
  v15.i64[0] = 0xBFBFBFBFBFBFBFBFLL;
  v15.i64[1] = 0xBFBFBFBFBFBFBFBFLL;
  v16.i64[0] = 0xC9C9C9C9C9C9C9C9;
  v16.i64[1] = 0xC9C9C9C9C9C9C9C9;
  v17.i64[0] = 0xA9A9A9A9A9A9A9A9;
  v17.i64[1] = 0xA9A9A9A9A9A9A9A9;
  v18 = vaddq_s8(v27.val[1], v9);
  v19 = (int8x16_t)vcgtq_u8(v11, (uint8x16_t)v18);
  v20 = vorrq_s8(vbslq_s8(v19, v18, vbslq_s8(vorrq_s8(v19, (int8x16_t)vcgtq_u8(v14, (uint8x16_t)vaddq_s8(v27.val[1], v13))), vaddq_s8(v27.val[1], v17), vandq_s8(vaddq_s8(v27.val[1], v16), (int8x16_t)vcgtq_u8(v14, (uint8x16_t)vaddq_s8(v27.val[1], v15))))), vshlq_n_s8(vbslq_s8(v12, v10, vbslq_s8(vorrq_s8(v12, (int8x16_t)vcgtq_u8(v14, (uint8x16_t)vaddq_s8(v27.val[0], v13))), vaddq_s8(v27.val[0], v17), vandq_s8(vaddq_s8(v27.val[0], v16), (int8x16_t)vcgtq_u8(v14, (uint8x16_t)vaddq_s8(v27.val[0], v15))))), 4uLL)).u64[0];
LABEL_19:

  return v20;
}

PLUUIDString *PLStringFromUUIDData(void *a1)
{
  id v1;
  PLUUIDString *v2;

  if (a1)
  {
    v1 = a1;
    v2 = -[PLUUIDString initWithUUIDData:]([PLUUIDString alloc], "initWithUUIDData:", v1);

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

id PLStringFromUUID(const unsigned __int8 *a1)
{
  _BYTE v2[37];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  memset(v2, 0, sizeof(v2));
  uuid_unparse(a1, v2);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

BOOL PLIsMercuryBase64String(void *a1)
{
  id v1;
  _BOOL8 v2;

  v1 = a1;
  v2 = objc_msgSend(v1, "length") == 22
    && strspn((const char *)objc_msgSend(objc_retainAutorelease(v1), "UTF8String"), "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+%") == 22;

  return v2;
}

BOOL PLIsCanonicalUUIDString(void *a1)
{
  id v1;
  const char *v2;
  _BOOL8 v3;
  uuid_t uu;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v3 = objc_msgSend(v1, "length") == 36
    && (memset(uu, 0, sizeof(uu)),
        v2 = (const char *)objc_msgSend(objc_retainAutorelease(v1), "UTF8String"),
        strspn(v2, "-01234567890abcdefABCDEF") == 36)
    && uuid_parse(v2, uu) == 0;

  return v3;
}

id PLConvertMercuryUUIDString(void *a1)
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _BYTE v12[40];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (!v1)
    goto LABEL_9;
  if (PLIsCanonicalUUIDString(v1))
  {
    v2 = v2;
    v3 = v2;
    goto LABEL_12;
  }
  if (!PLIsMercuryBase64String(v2))
  {
LABEL_9:
    v3 = 0;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("%"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "rangeOfCharacterFromSet:options:", v4, 0);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("%"), CFSTR("/"), 0, v5, v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v2 = (id)v7;
  }
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("=="));
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v8, 0);
  v10 = v9;
  if (v9)
  {
    memset(v12, 0, 37);
    uuid_unparse_upper((const unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v9), "bytes", 0, 0, 0, 0, *(_QWORD *)&v12[32], v13), v12);
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v12);
  }
  else
  {
    v3 = 0;
  }

  v2 = (id)v8;
LABEL_12:

  return v3;
}

id PLUUIDFromLocalMercuryLocalIdentifier(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;

  v1 = a1;
  v2 = objc_msgSend(v1, "length");
  if (v2 == 22)
  {
    v5 = v1;
    goto LABEL_7;
  }
  if (v2 == 29)
  {
    v3 = objc_msgSend(v1, "rangeOfString:", CFSTR("/L0/"));
    if (v4)
    {
      objc_msgSend(v1, "substringToIndex:", v3);
      v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:
      v6 = v5;
      goto LABEL_8;
    }
  }
  v6 = 0;
LABEL_8:

  return v6;
}

void PLSetIsAssetsdProxyService()
{
  __PLIsAssetsdProxyService = 1;
}

void PLUnSetIsAssetsdProxyService()
{
  __PLIsAssetsdProxyService = 0;
}

void PLSetIsMigrationService()
{
  __PLIsMigrationService = 1;
}

uint64_t PLIsMigrationService()
{
  return __PLIsMigrationService;
}

BOOL PLIsContentPrivacyEnabled()
{
  _BOOL8 result;
  NSObject *v1;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if ((PFProcessIsLaunchedToExecuteTests() & 1) != 0)
    return 0;
  CFPreferencesAppSynchronize(CFSTR("com.apple.mobileslideshow"));
  keyExistsAndHasValidFormat = 0;
  result = CFPreferencesGetAppBooleanValue(CFSTR("ContentPrivacyEnabled"), CFSTR("com.apple.mobileslideshow"), &keyExistsAndHasValidFormat) != 0;
  if (!keyExistsAndHasValidFormat)
  {
    PLPreferencesGetLog();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v4 = CFSTR("com.apple.mobileslideshow");
      _os_log_impl(&dword_199DF7000, v1, OS_LOG_TYPE_DEBUG, "Content privacy default not set in domain %@. Defaulting to YES", buf, 0xCu);
    }

    return 1;
  }
  return result;
}

void PLSetContentPrivacyEnabled(uint64_t a1)
{
  void *value;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1);
  value = (void *)objc_claimAutoreleasedReturnValue();
  CFPreferencesAppSynchronize(CFSTR("com.apple.mobileslideshow"));
  CFPreferencesSetAppValue(CFSTR("ContentPrivacyEnabled"), value, CFSTR("com.apple.mobileslideshow"));

}

void PLSetFeaturedContentAllowed(uint64_t a1)
{
  void *v1;
  double v2;
  void *v3;
  void *value;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1);
  value = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v1, "numberWithLong:", (uint64_t)v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(CFSTR("FeaturedContentAllowed"), value, CFSTR("com.apple.mobileslideshow"));
  CFPreferencesSetAppValue(CFSTR("FeaturedContentAllowedToggleDate"), v3, CFSTR("com.apple.mobileslideshow"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.mobileslideshow"));

}

id PLIsFeaturedContentAllowedGetLastDateSet()
{
  CFIndex AppIntegerValue;
  void *v1;
  Boolean keyExistsAndHasValidFormat;

  CFPreferencesAppSynchronize(CFSTR("com.apple.mobileslideshow"));
  keyExistsAndHasValidFormat = 0;
  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("FeaturedContentAllowedToggleDate"), CFSTR("com.apple.mobileslideshow"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)AppIntegerValue);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = 0;
  }
  return v1;
}

BOOL PLShouldExcludeLocationWhenSharing()
{
  _BOOL8 result;
  NSObject *v1;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if ((PFProcessIsLaunchedToExecuteTests() & 1) == 0)
  {
    CFPreferencesAppSynchronize(CFSTR("com.apple.mobileslideshow"));
    keyExistsAndHasValidFormat = 0;
    result = CFPreferencesGetAppBooleanValue(CFSTR("ExcludeLocationWhenSharing"), CFSTR("com.apple.mobileslideshow"), &keyExistsAndHasValidFormat) != 0;
    if (keyExistsAndHasValidFormat)
      return result;
    PLPreferencesGetLog();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v4 = CFSTR("com.apple.mobileslideshow");
      _os_log_impl(&dword_199DF7000, v1, OS_LOG_TYPE_DEBUG, "Default for excluding location when sharing is not set in domain %@. Defaulting to NO", buf, 0xCu);
    }

  }
  return 0;
}

void PLSetShouldExcludeLocationWhenSharing(uint64_t a1)
{
  void *value;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1);
  value = (void *)objc_claimAutoreleasedReturnValue();
  CFPreferencesAppSynchronize(CFSTR("com.apple.mobileslideshow"));
  CFPreferencesSetAppValue(CFSTR("ExcludeLocationWhenSharing"), value, CFSTR("com.apple.mobileslideshow"));

}

uint64_t PLSetIsSuppressingLogsForUnitTesting(uint64_t result)
{
  _suppressLogsForUnitTesting = result;
  return result;
}

char *PLIsConfiguredForUnitTesting()
{
  char *result;

  result = getenv("CONFIGURE_FOR_UNIT_TESTING");
  if (result)
    return (char *)(*result == 49);
  return result;
}

uint64_t PLSetSystemLibraryAccessProhibited(uint64_t result)
{
  _systemLibraryAccessProhibited = result;
  return result;
}

BOOL PLXCTestAllowsProhibitedSystemLibraryAccess()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "environment");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("PHOTOS_TEST_PLAN_ALLOW_SYSTEM_LIBRARY_DESTRUCTIVE_ACTION"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2 != 0;
}

uint64_t PLIsReallyAssetsd()
{
  pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_42_3368);
  return PLIsReallyAssetsd_isAssetsd;
}

uint64_t PLIsInternalTool()
{
  pl_dispatch_once(&PLIsInternalTool_didCheckReadOnly, &__block_literal_global_45_3377);
  return PLIsInternalTool_isInternalTool;
}

uint64_t PLIsSpringboard()
{
  pl_dispatch_once(&PLIsSpringboard_didCheck, &__block_literal_global_57_3386);
  return PLIsSpringboard_isSpringBoard;
}

uint64_t PLIsLockScreenCamera()
{
  pl_dispatch_once(&PLIsLockScreenCamera_didCheck, &__block_literal_global_65_3393);
  return PLIsLockScreenCamera_isCamera;
}

uint64_t PLIsPhotosApp()
{
  pl_dispatch_once(&PLIsPhotosApp_didCheck, &__block_literal_global_69);
  return PLIsPhotosApp_isPhotosApp;
}

uint64_t PLIsTVPhotosApp()
{
  pl_dispatch_once(&PLIsTVPhotosApp_didCheck, &__block_literal_global_72_3396);
  return PLIsTVPhotosApp_isTVPhotosApp;
}

uint64_t PLIsPhotosMessagesApp()
{
  pl_dispatch_once(&PLIsPhotosMessagesApp_didCheck, &__block_literal_global_75);
  return PLIsPhotosMessagesApp_isPhotosMessagesApp;
}

uint64_t PLIsSpotlight()
{
  pl_dispatch_once(&PLIsSpotlight_didCheck, &__block_literal_global_83);
  return PLIsSpotlight_isSpotlight;
}

uint64_t PLIsPreferences()
{
  pl_dispatch_once(&PLIsPreferences_didCheck, &__block_literal_global_86_3408);
  return PLIsPreferences_isPreferences;
}

uint64_t PLIsPeopleViewService()
{
  pl_dispatch_once(&PLIsPeopleViewService_didCheck, &__block_literal_global_89);
  return PLIsPeopleViewService_isPeopleViewService;
}

uint64_t PLIsPhotoanalysisd()
{
  pl_dispatch_once(&PLIsPhotoanalysisd_didCheck, &__block_literal_global_92_3413);
  return PLIsPhotoanalysisd_isPhotoanalysisd;
}

uint64_t PLIsNebulad()
{
  pl_dispatch_once(&PLIsNebulad_didCheck, &__block_literal_global_95);
  return PLIsNebulad_isNebulad;
}

uint64_t PLIsMediaanalysisd()
{
  pl_dispatch_once(&PLIsMediaanalysisd_didCheck, &__block_literal_global_98_3418);
  return PLIsMediaanalysisd_isMAD;
}

uint64_t PLIsDemod()
{
  pl_dispatch_once(&PLIsDemod_didCheck, &__block_literal_global_101);
  return PLIsDemod_isDemod;
}

uint64_t PLIsProcessWithAppleBundleIdentifier()
{
  pl_dispatch_once(&PLIsProcessWithAppleBundleIdentifier_didCheck, &__block_literal_global_104_3423);
  return PLIsProcessWithAppleBundleIdentifier_isAppleBundleIdentifier;
}

uint64_t PLShouldPreventAutomaticLimitedAccessAlert()
{
  if (PLShouldPreventAutomaticLimitedAccessAlert_onceToken != -1)
    dispatch_once(&PLShouldPreventAutomaticLimitedAccessAlert_onceToken, &__block_literal_global_108_3426);
  return PLShouldPreventAutomaticLimitedAccessAlert_shouldPreventAlert;
}

uint64_t PLHasPhotoLibraryAddUsageDescription()
{
  if (PLHasPhotoLibraryAddUsageDescription_onceToken != -1)
    dispatch_once(&PLHasPhotoLibraryAddUsageDescription_onceToken, &__block_literal_global_119);
  return PLHasPhotoLibraryAddUsageDescription_hasUsageDescription;
}

uint64_t PLHasPhotoLibraryUsageDescription()
{
  if (PLHasPhotoLibraryUsageDescription_onceToken != -1)
    dispatch_once(&PLHasPhotoLibraryUsageDescription_onceToken, &__block_literal_global_122_3441);
  return PLHasPhotoLibraryUsageDescription_hasUsageDescription;
}

uint64_t PLIsAllowedResultEffectivelyLimited(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  int v5;
  NSObject *v6;
  uint8_t buf[16];
  uint64_t v9;
  uint64_t v10;

  if (a1 == 4)
    return 1;
  v9 = v1;
  v10 = v2;
  if (a1)
    return 0;
  pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_42_3368);
  if (PLIsReallyAssetsd_isAssetsd)
    return 0;
  if ((__PLIsAssetsdProxyService & 1) != 0)
    return 0;
  +[PLPhotoLibraryPathManagerDCIM defaultDCIMPath](PLPhotoLibraryPathManagerDCIM, "defaultDCIMPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  getpid();
  v4 = objc_retainAutorelease(v3);
  objc_msgSend(v4, "fileSystemRepresentation");
  v5 = sandbox_check();

  if (!v5)
    return 0;
  PLBackendGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199DF7000, v6, OS_LOG_TYPE_DEFAULT, "Capture Session: Forcing Limited Library mode in the client", buf, 2u);
  }

  return 1;
}

uint64_t PLIsDeveloperMode()
{
  if (PLIsDeveloperMode_onceToken != -1)
    dispatch_once(&PLIsDeveloperMode_onceToken, &__block_literal_global_131_3450);
  return PLIsDeveloperMode_isDeveloperMode;
}

void sub_199E5B7A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getAMFIIsDeveloperModeEnabledSymbolLoc_block_invoke(_QWORD *a1)
{
  void *v2;
  void *result;
  void *v4;

  if (!AppleMobileFileIntegrityLibraryCore_frameworkLibrary)
    AppleMobileFileIntegrityLibraryCore_frameworkLibrary = _sl_dlopen();
  v2 = (void *)AppleMobileFileIntegrityLibraryCore_frameworkLibrary;
  if (!AppleMobileFileIntegrityLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AppleMobileFileIntegrityLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("PLHelper.m"), 44, CFSTR("%s"), 0);

    __break(1u);
    free(v4);
  }
  result = dlsym(v2, "AMFIIsDeveloperModeEnabled");
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  getAMFIIsDeveloperModeEnabledSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(a1[4] + 8) + 24);
  return result;
}

uint64_t PLIsLockdownMode()
{
  if (PLIsLockdownMode_onceToken != -1)
    dispatch_once(&PLIsLockdownMode_onceToken, &__block_literal_global_132_3452);
  return PLIsLockdownMode_isLockdownMode;
}

void sub_199E5B9EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getLockdownModeManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!LockdownModeLibraryCore_frameworkLibrary)
    LockdownModeLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!LockdownModeLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *LockdownModeLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PLHelper.m"), 71, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("LockdownModeManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getLockdownModeManagerClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PLHelper.m"), 72, CFSTR("Unable to find class %s"), "LockdownModeManager");

LABEL_8:
    __break(1u);
  }
  getLockdownModeManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

BOOL PLIsSharedAlbumsAllowed()
{
  int v0;

  if (PLIsEDUMode_onceToken != -1)
    dispatch_once(&PLIsEDUMode_onceToken, &__block_literal_global_129_3449);
  v0 = PLIsEDUMode_isEDUMode;
  if (PLIsLockdownMode_onceToken != -1)
    dispatch_once(&PLIsLockdownMode_onceToken, &__block_literal_global_132_3452);
  return (PLIsLockdownMode_isLockdownMode | v0) == 0;
}

double PLPhysicalScreenScale()
{
  pl_dispatch_once(&PLPhysicalScreenScale_didCheck, &__block_literal_global_133_3455);
  return *(double *)&PLPhysicalScreenScale_screenScale;
}

uint64_t PLIsTallScreen()
{
  pl_dispatch_once(&PLIsTallScreen_didCheck, &__block_literal_global_142_3466);
  return PLIsTallScreen_isTallScreen;
}

uint64_t PLIsPadMini()
{
  if (PLIsPadMini_onceToken != -1)
    dispatch_once(&PLIsPadMini_onceToken, &__block_literal_global_143);
  return PLIsPadMini_isIpadMini;
}

uint64_t PLHasHomeButton()
{
  if (PLHasHomeButton_onceToken != -1)
    dispatch_once(&PLHasHomeButton_onceToken, &__block_literal_global_146_3469);
  return PLHasHomeButton_hasHomeButton;
}

id PLPhotoLibraryFrameworkBundle()
{
  void *v0;
  Class v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v0 = (void *)__PLPhotoLibraryFrameworkBundle;
  if (!__PLPhotoLibraryFrameworkBundle)
  {
    v1 = NSClassFromString((NSString *)CFSTR("PLPhotoTileViewController"));
    if (v1)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", v1);
      v2 = objc_claimAutoreleasedReturnValue();
      v3 = (void *)__PLPhotoLibraryFrameworkBundle;
      __PLPhotoLibraryFrameworkBundle = v2;
    }
    else
    {
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", CFSTR("/System/Library/PrivateFrameworks/PhotoLibrary.framework"), 1);
      v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB34D0]), "initWithURL:", v3);
      v5 = (void *)__PLPhotoLibraryFrameworkBundle;
      __PLPhotoLibraryFrameworkBundle = v4;

    }
    v0 = (void *)__PLPhotoLibraryFrameworkBundle;
  }
  return v0;
}

id PLPhotoLibraryServicesFrameworkBundle()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)__PLPhotoLibraryServicesFrameworkBundle;
  if (!__PLPhotoLibraryServicesFrameworkBundle)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", NSClassFromString((NSString *)CFSTR("PLPhotoLibrary")));
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)__PLPhotoLibraryServicesFrameworkBundle;
    __PLPhotoLibraryServicesFrameworkBundle = v1;

    v0 = (void *)__PLPhotoLibraryServicesFrameworkBundle;
  }
  return v0;
}

void PLEnableCoreDataMultithreadedAsserts()
{
  void *v0;
  void *v1;
  const __CFString *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = CFSTR("com.apple.CoreData.ConcurrencyDebug");
  v3[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "registerDefaults:", v1);

}

id PLRelativePrettyDateForDate(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v1 = a1;
  v2 = v1;
  if (!PLRelativePrettyDateForDate___relativeDateFormatter)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v5 = (void *)PLRelativePrettyDateForDate___relativeDateFormatter;
    PLRelativePrettyDateForDate___relativeDateFormatter = (uint64_t)v4;

    objc_msgSend((id)PLRelativePrettyDateForDate___relativeDateFormatter, "setDateStyle:", 2);
    objc_msgSend((id)PLRelativePrettyDateForDate___relativeDateFormatter, "setTimeStyle:", 1);
    v6 = (void *)PLRelativePrettyDateForDate___relativeDateFormatter;
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLocale:", v7);

    objc_msgSend((id)PLRelativePrettyDateForDate___relativeDateFormatter, "setDoesRelativeDateFormatting:", 1);
    if (v2)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    goto LABEL_6;
  }
  if (!v1)
    goto LABEL_5;
LABEL_3:
  objc_msgSend((id)PLRelativePrettyDateForDate___relativeDateFormatter, "stringFromDate:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v3;
}

id PLMillisecondDateFormatter()
{
  if (PLMillisecondDateFormatter_onceToken != -1)
    dispatch_once(&PLMillisecondDateFormatter_onceToken, &__block_literal_global_165);
  return (id)PLMillisecondDateFormatter_dateFormatter;
}

id PLCompleteDateFormatter()
{
  if (PLCompleteDateFormatter_onceToken != -1)
    dispatch_once(&PLCompleteDateFormatter_onceToken, &__block_literal_global_171);
  return (id)PLCompleteDateFormatter_formatter;
}

id _localizedStringFromTableInBundle(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  __CFNotificationCenter *LocalCenter;
  id v10;
  uint64_t v11;
  void *v12;
  const __CFArray *v13;
  CFArrayRef v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = (void *)__PLPreferredLanguage;
  if (!__PLPreferredLanguage)
  {
    _UpdatePreferredLanguage();
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)_UpdatePreferredLanguage, (CFStringRef)*MEMORY[0x1E0C9B070], 0, CFNotificationSuspensionBehaviorDrop);
    v8 = (void *)__PLPreferredLanguage;
  }
  v10 = v8;
  if (!objc_msgSend(v5, "length"))
    goto LABEL_15;
  if (!objc_msgSend(v6, "length"))
    goto LABEL_15;
  v11 = objc_msgSend(v10, "length");
  if (!v7 || !v11)
    goto LABEL_15;
  objc_msgSend(v7, "localizations");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v10);
  v13 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "count") ? CFBundleCopyLocalizationsForPreferences((CFArrayRef)v12, v13) : 0;
  if (-[__CFArray count](v14, "count")
    && (-[__CFArray objectAtIndex:](v14, "objectAtIndex:", 0),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "pathForResource:ofType:inDirectory:forLocalization:", v6, CFSTR("strings"), 0, v15),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v15,
        v16))
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", v5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }

  if (!v18)
  {
LABEL_15:
    objc_msgSend(v7, "localizedStringForKey:value:table:", v5, &stru_1E376D3F8, v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

void _UpdatePreferredLanguage()
{
  const __CFString *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v0 = (const __CFString *)*MEMORY[0x1E0C9B228];
  CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x1E0C9B228]);
  v6 = (id)CFPreferencesCopyValue(CFSTR("AppleLanguages"), v0, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  objc_msgSend(v6, "objectAtIndex:", 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)__PLPreferredLanguage;
  __PLPreferredLanguage = v1;

  if (!__PLPreferredLanguage)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0C997E8]);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)__PLPreferredLanguage;
    __PLPreferredLanguage = v4;

    if (!__PLPreferredLanguage)
      __PLPreferredLanguage = (uint64_t)CFSTR("en");
  }

}

id PLServicesLocalizedFrameworkStringForAssetsd(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PLPhotoLibraryServicesFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _localizedStringFromTableInBundle(v1, CFSTR("PhotoLibraryServices"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id PLServicesLivePortraitLocalizedFrameworkString(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PLPhotoLibraryServicesFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_1E376D3F8, CFSTR("PhotoLibraryServicesLivePortrait"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id PLServicesLocalizedFrameworkString(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PLPhotoLibraryServicesFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_1E376D3F8, CFSTR("PhotoLibraryServices"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

BOOL _PLIsNotificationTypeEnabledForKey(void *a1, _BOOL8 a2)
{
  __CFString *v3;
  int AppBooleanValue;
  NSObject *v5;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  __CFString *v9;
  __int16 v10;
  const __CFString *v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  CFPreferencesAppSynchronize(CFSTR("com.apple.mobileslideshow"));
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(v3, CFSTR("com.apple.mobileslideshow"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    a2 = AppBooleanValue != 0;
  }
  else
  {
    PLPreferencesGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543874;
      v9 = v3;
      v10 = 2114;
      v11 = CFSTR("com.apple.mobileslideshow");
      v12 = 1024;
      v13 = a2;
      _os_log_impl(&dword_199DF7000, v5, OS_LOG_TYPE_INFO, "Photos notifications default %{public}@ not set in domain %{public}@. Defaulting to %d", buf, 0x1Cu);
    }

  }
  return a2;
}

BOOL PLIsNotificationTypeEnabledForKey(void *a1)
{
  return _PLIsNotificationTypeEnabledForKey(a1, 1);
}

void PLSetNotificationTypeEnabledForKey(void *a1, uint64_t a2)
{
  void *v3;
  __CFString *v4;
  void *value;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a1;
  objc_msgSend(v3, "numberWithBool:", a2);
  value = (void *)objc_claimAutoreleasedReturnValue();
  CFPreferencesAppSynchronize(CFSTR("com.apple.mobileslideshow"));
  CFPreferencesSetAppValue(v4, value, CFSTR("com.apple.mobileslideshow"));

}

void _PLResetNotificationTypeEnabledKey(void *a1)
{
  __CFString *key;

  key = a1;
  CFPreferencesAppSynchronize(CFSTR("com.apple.mobileslideshow"));
  CFPreferencesSetAppValue(key, 0, CFSTR("com.apple.mobileslideshow"));

}

id PLServicesSharedLibraryLocalizedFrameworkString(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PLPhotoLibraryServicesFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_1E376D3F8, CFSTR("PhotoLibraryServicesSharedLibrary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void PLSetSharedLibrarySuggestionsEnabled(uint64_t a1)
{
  void *value;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1);
  value = (void *)objc_claimAutoreleasedReturnValue();
  CFPreferencesAppSynchronize(CFSTR("com.apple.mobileslideshow"));
  CFPreferencesSetAppValue(CFSTR("SharedLibrarySuggestionsEnabled"), value, CFSTR("com.apple.mobileslideshow"));

}

BOOL PLIsSharedLibraryAssetTrashedByParticipantsNotificationEnabled()
{
  return _PLIsNotificationTypeEnabledForKey(CFSTR("PhotosNotificationTypeSharedLibraryDeletionNotificationsEnabled"), 1);
}

void PLSetSharedLibraryAssetTrashedByParticipantsNotificationEnabled(uint64_t a1)
{
  PLSetNotificationTypeEnabledForKey(CFSTR("PhotosNotificationTypeSharedLibraryDeletionNotificationsEnabled"), a1);
}

void PLResetSharedLibraryAssetTrashedByParticipantsNotificationKey()
{
  _PLResetNotificationTypeEnabledKey(CFSTR("PhotosNotificationTypeSharedLibraryDeletionNotificationsEnabled"));
}

id PLLocalizedFrameworkString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = a1;
  PLPhotoLibraryFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_1E376D3F8, CFSTR("PhotoLibrary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", v1))
  {
    objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_1E376D3F8, CFSTR("PhotoLibrary-GM"));
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  if (objc_msgSend(v3, "isEqualToString:", v1))
  {
    objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_1E376D3F8, CFSTR("PhotoLibrary-bravo"));
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }

  return v3;
}

uint64_t PLAssetTypeForItems(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v1 = a1;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v12;
    v5 = 3;
    v6 = 1;
LABEL_3:
    v7 = 0;
    v8 = v5;
    while (1)
    {
      if (*(_QWORD *)v12 != v4)
        objc_enumerationMutation(v1);
      v9 = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "kind", (_QWORD)v11);
      v5 = v9;
      if ((v6 & 1) == 0)
      {
        v5 = v8;
        if ((unsigned __int16)v8 != (unsigned __int16)v9)
          break;
      }
      v6 = 0;
      ++v7;
      v8 = v5;
      if (v3 == v7)
      {
        v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        v6 = 0;
        if (v3)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
  }
  LOWORD(v5) = 3;
LABEL_12:

  return (__int16)v5;
}

id PLAssetsLibraryLocalizedFrameworkString(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = _AssetsLibraryServicesFrameworkBundle_predicate;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&_AssetsLibraryServicesFrameworkBundle_predicate, &__block_literal_global_425);
  objc_msgSend((id)_AssetsLibraryServicesFrameworkBundle__AssetsLibraryServicesFrameworkBundle, "localizedStringForKey:value:table:", v2, &stru_1E376D3F8, CFSTR("AssetsLibraryServices"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

__CFString *PLLocalizedCountDescription(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  const __CFString *v8;
  const __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  const __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  const __CFString *v20;
  __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  __CFString *v24;
  __CFString *v25;
  __CFString *v26;
  id v27;
  __CFString *v28;
  __CFString *v29;
  id v30;
  __CFString *v31;
  __CFString *v32;
  __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    if (a2)
    {
      if (a3)
      {
        v14 = CFSTR("PLLocalizedCountDescriptionVideosCommaItems");
        if (a4)
          v14 = CFSTR("PLLocalizedCountDescriptionVideosCommaItemsTitleCase");
        v15 = CFSTR("PLLocalizedCountDescriptionVideosAndItemsTitleCase");
        if (!a4)
          v15 = CFSTR("PLLocalizedCountDescriptionVideosAndItems");
        if (a5)
          v16 = (__CFString *)v15;
        else
          v16 = (__CFString *)v14;
        PLAssetsLibraryLocalizedFrameworkString(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 0;
        objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v17, CFSTR("%lu %lu"), &v37, a2, a3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v37;
      }
      else
      {
        if (a4)
          v26 = CFSTR("PLLocalizedCountDescriptionVideosTitleCase");
        else
          v26 = CFSTR("PLLocalizedCountDescriptionVideos");
        PLAssetsLibraryLocalizedFrameworkString(v26);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 0;
        objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v17, CFSTR("%lu"), &v40, a2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v40;
      }
    }
    else
    {
      if (!a3)
      {
        if (a4)
          v34 = CFSTR("PLLocalizedCountDescriptionNoItemsTitleCase");
        else
          v34 = CFSTR("PLLocalizedCountDescriptionNoItems");
        PLAssetsLibraryLocalizedFrameworkString(v34);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 0;
        goto LABEL_54;
      }
      if (a4)
        v25 = CFSTR("PLLocalizedCountDescriptionItemsTitleCase");
      else
        v25 = CFSTR("PLLocalizedCountDescriptionItems");
      PLAssetsLibraryLocalizedFrameworkString(v25);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 0;
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v17, CFSTR("%lu"), &v39, a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v39;
    }
    v27 = v18;

    goto LABEL_54;
  }
  if (a2)
  {
    if (a3)
    {
      v8 = CFSTR("PLLocalizedCountDescriptionPhotosCommaVideosCommaItems");
      if (a4)
        v8 = CFSTR("PLLocalizedCountDescriptionPhotosCommaVideosCommaItemsTitleCase");
      v9 = CFSTR("PLLocalizedCountDescriptionPhotosAndVideosAndItemsTitleCase");
      if (!a4)
        v9 = CFSTR("PLLocalizedCountDescriptionPhotosAndVideosAndItems");
      if (a5)
        v10 = (__CFString *)v9;
      else
        v10 = (__CFString *)v8;
      PLAssetsLibraryLocalizedFrameworkString(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0;
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v11, CFSTR("%lu %lu %lu"), &v35, a1, a2, a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v35;
    }
    else
    {
      v22 = CFSTR("PLLocalizedCountDescriptionPhotosCommaVideos");
      if (a4)
        v22 = CFSTR("PLLocalizedCountDescriptionPhotosCommaVideosTitleCase");
      v23 = CFSTR("PLLocalizedCountDescriptionPhotosAndVideosTitleCase");
      if (!a4)
        v23 = CFSTR("PLLocalizedCountDescriptionPhotosAndVideos");
      if (a5)
        v24 = (__CFString *)v23;
      else
        v24 = (__CFString *)v22;
      PLAssetsLibraryLocalizedFrameworkString(v24);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 0;
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v11, CFSTR("%lu %lu"), &v38, a1, a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v38;
    }
  }
  else if (a3)
  {
    v19 = CFSTR("PLLocalizedCountDescriptionPhotosCommaItems");
    if (a4)
      v19 = CFSTR("PLLocalizedCountDescriptionPhotosCommaItemsTitleCase");
    v20 = CFSTR("PLLocalizedCountDescriptionPhotosAndItemsTitleCase");
    if (!a4)
      v20 = CFSTR("PLLocalizedCountDescriptionPhotosAndItems");
    if (a5)
      v21 = (__CFString *)v20;
    else
      v21 = (__CFString *)v19;
    PLAssetsLibraryLocalizedFrameworkString(v21);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v11, CFSTR("%lu %lu"), &v36, a1, a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v36;
  }
  else
  {
    if (a4)
      v28 = CFSTR("PLLocalizedCountDescriptionPhotosTitleCase");
    else
      v28 = CFSTR("PLLocalizedCountDescriptionPhotos");
    PLAssetsLibraryLocalizedFrameworkString(v28);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v11, CFSTR("%lu"), &v41, a1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v41;
  }
  v27 = v13;

LABEL_54:
  v29 = v12;
  v30 = v27;
  v31 = v29;
  if (!v29)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v43 = "PLLocalizedCountDescription";
      v44 = 2112;
      v45 = v30;
      _os_log_error_impl(&dword_199DF7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "error making validated localized string in %s: %@", buf, 0x16u);
    }
    v31 = &stru_1E376D3F8;
  }

  v32 = v31;
  return v32;
}

__CFString *PLSuffixForItems(void *a1)
{
  int v1;
  __CFString *v2;

  v1 = PLAssetTypeForItems(a1);
  v2 = CFSTR("ITEM");
  if (v1 == 1)
    v2 = CFSTR("VIDEO");
  if (v1)
    return v2;
  else
    return CFSTR("PHOTO");
}

const __CFString *PLLocalizedKeyForAssetType(int a1)
{
  const __CFString *v1;

  v1 = CFSTR("ITEM");
  if (a1 == 1)
    v1 = CFSTR("VIDEO");
  if (a1)
    return v1;
  else
    return CFSTR("PHOTO");
}

id PLLocalizedSelectionMessageForItems(void *a1)
{
  id v1;
  unsigned int v2;
  __CFString *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = PLAssetTypeForItems(v1);
  if (v2 > 3)
    v3 = 0;
  else
    v3 = off_1E3769CF8[(unsigned __int16)v2];
  v4 = (void *)MEMORY[0x1E0CB3940];
  PLServicesLocalizedFrameworkString(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v6 = objc_msgSend(v1, "count");

  objc_msgSend(v4, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v5, CFSTR("%ld"), &v12, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;

  v9 = v7;
  v10 = v8;
  if (!v9 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "PLLocalizedSelectionMessageForItems";
    v15 = 2112;
    v16 = v10;
    _os_log_error_impl(&dword_199DF7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "error making validated localized string in %s: %@", buf, 0x16u);
  }

  return v9;
}

id PLLocalizedImportantMemoryNotificationTitle()
{
  return PLServicesLocalizedFrameworkStringForAssetsd(CFSTR("IMPORTANT_MEMORY_NOTIFICATION_TITLE"));
}

id PLLocalizedAddPhotosPickerPromptForItems(void *a1, void *a2)
{
  return PLLocalizedAddPhotosPickerPromptForItemsAndLimit(a1, 0, a2);
}

id PLLocalizedAddPhotosPickerPromptForItemsAndLimit(void *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
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
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a3;
  v7 = objc_msgSend(v5, "count");
  if (!v7)
  {
    if (!v6)
    {
      PLLocalizedFrameworkString(CFSTR("ADD_ITEMS_PICKER_PROMPT_0_NO_ALBUM"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0;
      goto LABEL_14;
    }
    v13 = (void *)MEMORY[0x1E0CB3940];
    PLLocalizedFrameworkString(CFSTR("ADD_ITEMS_PICKER_PROMPT_0"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    objc_msgSend(v13, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v14, CFSTR("%@"), &v27, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v27;
    goto LABEL_13;
  }
  v8 = v7;
  if (!v6)
  {
    if (a2)
    {
      _PLKeyWithSuffixForItems(CFSTR("ADD_ITEMS_PICKER_PROMPT_LIMIT_NO_ALBUM_"), v5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      PLLocalizedFrameworkString(v16);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = 0;
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v10, CFSTR("%lu %lu"), &v24, v8, a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v24;
      goto LABEL_9;
    }
    _PLKeyWithSuffixForItems(CFSTR("ADD_ITEMS_PICKER_PROMPT_NO_ALBUM_"), v5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PLLocalizedFrameworkString(v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v14, CFSTR("%lu"), &v23, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v23;
LABEL_13:
    v17 = v15;

    goto LABEL_14;
  }
  if (!a2)
  {
    _PLKeyWithSuffixForItems(CFSTR("ADD_ITEMS_PICKER_PROMPT_"), v5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PLLocalizedFrameworkString(v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v14, CFSTR("%lu %@"), &v25, v8, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v25;
    goto LABEL_13;
  }
  _PLKeyWithSuffixForItems(CFSTR("ADD_ITEMS_PICKER_PROMPT_LIMIT_"), v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PLLocalizedFrameworkString(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v10, CFSTR("%lu %lu %@"), &v26, v8, a2, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v26;
LABEL_9:
  v17 = v12;

LABEL_14:
  v20 = v11;
  v21 = v17;
  if (!v20 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v29 = "PLLocalizedAddPhotosPickerPromptForItemsAndLimit";
    v30 = 2112;
    v31 = v21;
    _os_log_error_impl(&dword_199DF7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "error making validated localized string in %s: %@", buf, 0x16u);
  }

  return v20;
}

id _PLKeyWithSuffixForItems(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a1;
  PLSuffixForItems(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id PLConvertPathToSRGBPath(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = a1;
  objc_msgSend(v1, "pathExtension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByDeletingPathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByAppendingString:", CFSTR("_sRGB"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathExtension:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id PLLocalizedStringForAction(void *a1, void *a2, void (*a3)(void))
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;

  v5 = a1;
  v6 = a2;
  a3();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "count");

  if (v8)
  {
    if (v8 == 1)
    {
      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v5, v7);
LABEL_8:
        v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
        v11 = v10;
        PLLocalizedFrameworkString(v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_11;
      }
    }
    else if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@S"), v5, v7);
      goto LABEL_8;
    }
    v10 = v5;
    goto LABEL_10;
  }
  v9 = 0;
LABEL_11:

  return v9;
}

id PLLocalizedHidePhotosEverywhereWarning(void *a1, unint64_t a2)
{
  __CFString *v4;
  __CFString *v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("N_ALBUMS");
  if (a2 == 1)
    v4 = CFSTR("1_ALBUM");
  v5 = v4;
  v6 = objc_msgSend(a1, "count");
  if (v6)
  {
    if (v6 == 1)
      v7 = CFSTR("HIDE_EVERYWHERE_CONF_TITLE_1_PHOTO_%@");
    else
      v7 = CFSTR("HIDE_EVERYWHERE_CONF_TITLE_N_PHOTOS_%@");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v7, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (a2 < 2)
    {
      PLLocalizedFrameworkString(v8);
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      PLLocalizedFrameworkString(v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0;
      objc_msgSend(v10, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v11, CFSTR("%lu"), &v17, a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v17;

      v14 = v12;
      v15 = v13;
      if (!v14 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "PLLocalizedHidePhotosEverywhereWarning";
        v20 = 2112;
        v21 = v15;
        _os_log_error_impl(&dword_199DF7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "error making validated localized string in %s: %@", buf, 0x16u);
      }

    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void PLAssetCountsByType(void *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5)
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  _QWORD *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v9 = a1;
  *a5 = 0;
  *a4 = 0;
  *a3 = 0;
  *a2 = 0;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13), "kind");
        v15 = a2;
        switch(v14)
        {
          case 0:
            goto LABEL_10;
          case 1:
            v15 = a3;
            goto LABEL_10;
          case 2:
            v15 = a4;
            goto LABEL_10;
          case 3:
            v15 = a5;
LABEL_10:
            ++*v15;
            break;
          default:
            break;
        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

}

id PLSharedCountFormatter()
{
  pl_dispatch_once(&PLSharedCountFormatter_onceToken, &__block_literal_global_297);
  return (id)PLSharedCountFormatter_sharedCountFormatter;
}

id PLPersonNameComponentsWithFirstAndLastName(void *a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;

  v3 = (objc_class *)MEMORY[0x1E0CB3850];
  v4 = a2;
  v5 = a1;
  v6 = objc_alloc_init(v3);
  objc_msgSend(v6, "setGivenName:", v5);

  objc_msgSend(v6, "setFamilyName:", v4);
  return v6;
}

id PLLocalizedNameWithFirstAndLastName(void *a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x1E0CB3858];
  v4 = a2;
  v5 = a1;
  v6 = objc_alloc_init(v3);
  PLPersonNameComponentsWithFirstAndLastName(v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringFromPersonNameComponents:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t PLPIDForProcessNamed(const char *a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  size_t v5;
  const char *v6;
  size_t size;
  int v9[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)v9 = xmmword_199EB0B20;
  v10 = 0;
  size = 0;
  v2 = sysctl(v9, 3u, 0, &size, 0, 0);
  if (!(_DWORD)v2)
  {
    v3 = (char *)malloc_type_malloc(size, 0x70EAA790uLL);
    v4 = sysctl(v9, 3u, v3, &size, 0, 0);
    if ((_DWORD)v4)
    {
      v2 = v4;
    }
    else
    {
      if (size < 0x288)
      {
LABEL_10:
        free(v3);
        return 0xFFFFFFFFLL;
      }
      v5 = size / 0x288;
      v6 = v3 + 243;
      while (1)
      {
        v2 = *(unsigned int *)(v6 - 203);
        if ((int)v2 >= 1 && !strncmp(a1, v6, 0x10uLL))
          break;
        v6 += 648;
        if (!--v5)
          goto LABEL_10;
      }
    }
    free(v3);
  }
  return v2;
}

void PLSimulateCrash(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void (*v5)(uint64_t, uint64_t, id);
  void (*v6)(uint64_t, uint64_t, id);
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = dlopen((const char *)objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/CrashReporterSupport.framework/CrashReporterSupport"), "fileSystemRepresentation"), 1);
  v5 = (void (*)(uint64_t, uint64_t, id))dlsym(v4, "SimulateCrash");
  if (v5)
  {
    v6 = v5;
    v7 = getpid();
    v6(v7, a1, v3);
  }
  else
  {
    PLBackendGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 134218242;
      v10 = a1;
      v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_199DF7000, v8, OS_LOG_TYPE_ERROR, "Simulating crash with exception code: 0x%08lx, description %@", (uint8_t *)&v9, 0x16u);
    }

  }
}

sqlite3_int64 PLAbortWithReason(uint64_t a1)
{
  NSObject *v2;
  const char *v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PLBackendGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v5 = 136446210;
    v6 = a1;
    _os_log_impl(&dword_199DF7000, v2, OS_LOG_TYPE_ERROR, "ABORT: %{public}s", (uint8_t *)&v5, 0xCu);
  }

  v3 = (const char *)abort_with_reason();
  return PLGenericAssetCountInDatabaseWithPath(v3);
}

sqlite3_int64 PLGenericAssetCountInDatabaseWithPath(const char *a1)
{
  void *v2;
  int v3;
  int v4;
  sqlite3_int64 v5;
  int v6;
  int v7;
  void *v8;
  int v9;
  const char *v10;
  BOOL v11;
  int v12;
  stat ppStmt;
  sqlite3 *ppDb;

  ppDb = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[PLSQLiteDatabase dataProtectionOpenFlagForPath:](PLSQLiteDatabase, "dataProtectionOpenFlagForPath:", v2) | 2;

  v4 = sqlite3_open_v2(a1, &ppDb, v3, 0);
  if (v4)
  {
    v5 = -1;
  }
  else
  {
    *(_QWORD *)&ppStmt.st_dev = 0;
    v6 = sqlite3_prepare_v2(ppDb, "SELECT count(*) FROM zasset;", -1, (sqlite3_stmt **)&ppStmt, 0);
    if (v6)
    {
      v7 = v6;
      v5 = -1;
    }
    else
    {
      v5 = -1;
      while (sqlite3_step(*(sqlite3_stmt **)&ppStmt.st_dev) == 100)
      {
        v8 = (void *)MEMORY[0x19AEC2E4C]();
        v5 = sqlite3_column_int64(*(sqlite3_stmt **)&ppStmt.st_dev, 0);
        objc_autoreleasePoolPop(v8);
      }
      v9 = sqlite3_finalize(*(sqlite3_stmt **)&ppStmt.st_dev);
      if (!v9)
        goto LABEL_12;
      v7 = v9;
    }
    v10 = sqlite3_errmsg(ppDb);
    syslog(3, "Failed to %s %d %s", "fetch asset count", v7, v10);
  }
LABEL_12:
  if (v4)
    v11 = v5 == -1;
  else
    v11 = 0;
  if (!v11)
    goto LABEL_23;
  memset(&ppStmt, 0, sizeof(ppStmt));
  if (stat(a1, &ppStmt))
  {
    v12 = *__error();
    if (v12 == 2)
    {
      v5 = 0;
      goto LABEL_23;
    }
    strerror(v12);
    syslog(3, "Failed to %s, can't stat %s error=%s");
  }
  else
  {
    syslog(3, "Failed to %s on %s (uid %d, size %d)");
  }
  v5 = -1;
LABEL_23:
  if (ppDb)
    sqlite3_close(ppDb);
  return v5;
}

id indexSetForManagedObjectsMatchingIDs(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v32;
  id obj;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") && objc_msgSend(v4, "count"))
  {
    v35 = v5;
    objc_msgSend(v4, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v4;
    v7 = objc_msgSend(v4, "count");
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v32 = v3;
    v8 = v3;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = 0;
      v13 = *(_QWORD *)v41;
      while (2)
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v41 != v13)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v14), "objectID", v32);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v15, "isEqual:", v6))
          {
            objc_msgSend(v35, "addIndex:", v11 + v14);
            if (++v12 >= v7)
            {
              v5 = v35;
              v29 = v35;

              goto LABEL_26;
            }
            objc_msgSend(v34, "objectAtIndex:", v12);
            v16 = objc_claimAutoreleasedReturnValue();

            v6 = (void *)v16;
          }

          ++v14;
        }
        while (v10 != v14);
        v11 += v14;
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
        if (v10)
          continue;
        break;
      }
    }

    objc_msgSend(v35, "removeAllIndexes");
    v17 = (void *)objc_msgSend(v34, "mutableCopy");
    v18 = objc_msgSend(v17, "count");
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = v8;
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v19)
    {
      v20 = v19;
      v21 = 0;
      v22 = *(_QWORD *)v37;
      while (2)
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v37 != v22)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v23), "objectID", v32);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v17, "indexOfObject:inRange:", v24, 0, v18);
          if (v25 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v26 = v25;
            objc_msgSend(v35, "addIndex:", v21 + v23);
            objc_msgSend(v17, "removeObjectAtIndex:", v26);
            if (!--v18)
            {
              v5 = v35;
              v30 = v35;

              goto LABEL_26;
            }
          }

          ++v23;
        }
        while (v20 != v23);
        v21 += v23;
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
        if (v20)
          continue;
        break;
      }
    }

    v5 = v35;
    v27 = v35;
LABEL_26:

    v3 = v32;
    v4 = v34;
  }
  else
  {
    v28 = v5;
  }

  return v5;
}

unint64_t PLCombineToInt64(double a1, double a2, double a3, double a4)
{
  return ((unint64_t)(int)(a2 * 100.0) << 32) | ((unint64_t)(int)(a1 * 100.0) << 48) | ((uint64_t)(int)(a3 * 100.0) << 16) | (int)(a4 * 100.0);
}

BOOL PLCGRectIsNormalized(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  CGRect v9;
  CGRect v10;
  CGRect v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;

  if (CGRectGetMinX(*(CGRect *)&a1) < 0.0)
    return 0;
  v9.origin.x = a1;
  v9.origin.y = a2;
  v9.size.width = a3;
  v9.size.height = a4;
  if (CGRectGetMinX(v9) > 1.0)
    return 0;
  v10.origin.x = a1;
  v10.origin.y = a2;
  v10.size.width = a3;
  v10.size.height = a4;
  if (CGRectGetMinY(v10) < 0.0)
    return 0;
  v11.origin.x = a1;
  v11.origin.y = a2;
  v11.size.width = a3;
  v11.size.height = a4;
  if (CGRectGetMinY(v11) > 1.0)
    return 0;
  v12.origin.x = a1;
  v12.origin.y = a2;
  v12.size.width = a3;
  v12.size.height = a4;
  if (CGRectGetMaxX(v12) < 0.0)
    return 0;
  v13.origin.x = a1;
  v13.origin.y = a2;
  v13.size.width = a3;
  v13.size.height = a4;
  if (CGRectGetMaxX(v13) > 1.0)
    return 0;
  v14.origin.x = a1;
  v14.origin.y = a2;
  v14.size.width = a3;
  v14.size.height = a4;
  if (CGRectGetMaxY(v14) < 0.0)
    return 0;
  v15.origin.x = a1;
  v15.origin.y = a2;
  v15.size.width = a3;
  v15.size.height = a4;
  return CGRectGetMaxY(v15) <= 1.0;
}

BOOL PLCopySQLiteDatabase(void *a1, void *a2, int a3, _QWORD *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  int v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void **v20;
  uint64_t *v21;
  id v22;
  uint64_t v23;
  _BOOL8 v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  sqlite3 *v32;
  sqlite3 *ppDb;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  v32 = 0;
  ppDb = 0;
  v9 = objc_retainAutorelease(v7);
  if (sqlite3_open_v2((const char *)objc_msgSend(v9, "UTF8String"), &ppDb, 1, 0))
  {
    if (ppDb)
      sqlite3_close(ppDb);
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "absoluteString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAppendingString:", CFSTR("?readonly_shm=1"));
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = sqlite3_open_v2((const char *)objc_msgSend(v12, "UTF8String"), &ppDb, 1, 0);

    if (v13)
    {
      if (ppDb)
        sqlite3_close(ppDb);
      NSLog((NSString *)CFSTR("couldn't open source database readonly, trying read/write mode"));
      v14 = objc_retainAutorelease(v9);
      v15 = sqlite3_open_v2((const char *)objc_msgSend(v14, "UTF8String"), &ppDb, 2, 0);
      if ((_DWORD)v15)
      {
        v16 = v15;
        if (ppDb)
          sqlite3_close(ppDb);
        if (!a4)
          goto LABEL_23;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to open src db %@: sqlite error %d\n"), v14, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x1E0CB35C8];
        v38 = *MEMORY[0x1E0CB3388];
        v39[0] = v17;
        v19 = (void *)MEMORY[0x1E0C99D80];
        v20 = (void **)v39;
        v21 = &v38;
        goto LABEL_22;
      }
    }
  }
  v22 = objc_retainAutorelease(v8);
  v23 = sqlite3_open_v2((const char *)objc_msgSend(v22, "UTF8String"), &v32, 6, 0);
  v24 = (_DWORD)v23 == 0;
  if ((_DWORD)v23)
  {
    v25 = v23;
    if (ppDb)
      sqlite3_close(ppDb);
    if (v32)
      sqlite3_close(v32);
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to open dst db %@: sqlite error %d\n"), v22, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)MEMORY[0x1E0CB35C8];
      v36 = *MEMORY[0x1E0CB3388];
      v37 = v26;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("PLHelperErrorDomain"), 0, v28);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  v29 = sqlite3_file_control(v32, 0, 102, ppDb);
  if ((_DWORD)v29)
  {
    if (!a4)
    {
LABEL_23:
      v24 = 0;
      goto LABEL_27;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to replace %@ with %@: sqlite error %d\n"), v22, v9, v29);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v34 = *MEMORY[0x1E0CB3388];
    v35 = v17;
    v19 = (void *)MEMORY[0x1E0C99D80];
    v20 = &v35;
    v21 = &v34;
LABEL_22:
    objc_msgSend(v19, "dictionaryWithObjects:forKeys:count:", v20, v21, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("PLHelperErrorDomain"), 0, v30);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_23;
  }
  if (a3)
    sqlite3_exec(v32, "pragma journal_mode=delete", 0, 0, 0);
  sqlite3_exec(v32, "pragma vacuum", 0, 0, 0);
LABEL_27:
  if (ppDb)
    sqlite3_close(ppDb);
  if (v32)
    sqlite3_close(v32);

  return v24;
}

id PLRenderableImageUniformTypeIdentifiers()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v1;
  objc_msgSend((id)*MEMORY[0x1E0CEC600], "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v2;
  objc_msgSend((id)*MEMORY[0x1E0CEC460], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[3] = v3;
  objc_msgSend((id)*MEMORY[0x1E0CEC5B8], "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[4] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t PLUniformTypeIdentifierIsRenderableImage(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  char v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  PLRenderableImageUniformTypeIdentifiers();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v2, "conformsToType:", v7);

        if ((v8 & 1) != 0)
        {
          v4 = 1;
          goto LABEL_14;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_14:

  return v4;
}

uint64_t PLSleepUntilNotification()
{
  NSObject *v0;
  FILE **v1;
  uint64_t v2;
  unint64_t v3;
  FILE *v4;
  pid_t v5;
  NSObject *v6;
  pid_t v7;
  FILE *v8;
  pid_t v9;
  _QWORD handler[5];
  int out_token;
  uint8_t buf[4];
  pid_t v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  PLSleepUntilNotificationWithName_waiting = 1;
  out_token = 0;
  dispatch_get_global_queue(0, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __PLSleepUntilNotificationWithName_block_invoke;
  handler[3] = &__block_descriptor_40_e8_v12__0i8l;
  handler[4] = "com.apple.photos.debug.go";
  notify_register_dispatch("com.apple.photos.debug.go", &out_token, v0, handler);

  v1 = (FILE **)MEMORY[0x1E0C80C10];
  if (PLSleepUntilNotificationWithName_waiting)
  {
    v2 = 0;
    v3 = 0;
    do
    {
      if (!(v2 + 5 * (v3 / 5)))
      {
        v4 = *v1;
        v5 = getpid();
        fprintf(v4, "PID %d: Waiting for: notifyutil -p %s\n", v5, "com.apple.photos.debug.go");
        PLBackendGetLog();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          v7 = getpid();
          *(_DWORD *)buf = 67109378;
          v14 = v7;
          v15 = 2080;
          v16 = "com.apple.photos.debug.go";
          _os_log_impl(&dword_199DF7000, v6, OS_LOG_TYPE_DEFAULT, "PID %d: Waiting for: notifyutil -p %s\n", buf, 0x12u);
        }

      }
      sleep(1u);
      ++v3;
      --v2;
    }
    while (PLSleepUntilNotificationWithName_waiting);
  }
  v8 = *v1;
  v9 = getpid();
  return fprintf(v8, "PID %d: Running\n", v9);
}

uint64_t PLIsDeviceClassiPhone()
{
  void *v0;
  uint64_t v1;

  v0 = (void *)MGCopyAnswer();
  v1 = objc_msgSend(v0, "isEqualToString:", CFSTR("iPhone"));

  return v1;
}

uint64_t PLDeviceSupportsASTC()
{
  if (PLDeviceSupportsASTC_s_onceToken != -1)
    dispatch_once(&PLDeviceSupportsASTC_s_onceToken, &__block_literal_global_334);
  return PLDeviceSupportsASTC_s_hasSupport;
}

uint64_t PLIsCaptureSessionEnabled()
{
  if (PLIsCaptureSessionEnabled_sOnceToken != -1)
    dispatch_once(&PLIsCaptureSessionEnabled_sOnceToken, &__block_literal_global_337);
  return PLIsCaptureSessionEnabled_sIsCaptureSessionEnabled;
}

uint64_t PLIsSecureCaptureExtension()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0CA58E0], "extensionPointRecordForCurrentProcess");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
  {
    objc_msgSend(v0, "identifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(CFSTR("com.apple.securecapture"), "isEqualToString:", v2);

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void *PLCameraBundleIdentifiers()
{
  return &unk_1E378FF78;
}

uint64_t PLIsCameraBundleIdentifier(uint64_t a1)
{
  return objc_msgSend(&unk_1E378FF78, "containsObject:", a1);
}

id _MetadataFileExtensions()
{
  pl_dispatch_once(&_InitializeFileExtensions_onceToken, &__block_literal_global_3681);
  return (id)__metadataFileExtensions;
}

id _ObsoleteFileExtensions()
{
  pl_dispatch_once(&_InitializeFileExtensions_onceToken, &__block_literal_global_3681);
  return (id)__obsoleteFileExtensions;
}

BOOL PLCanMoveFromSourceStateToTargetState(uint64_t a1, uint64_t a2)
{
  return a1 + 1 == a2 || a1 == a2 || a2 == 99;
}

BOOL PLHasPathFromSourceStateToTargetState(uint64_t a1, uint64_t a2)
{
  return a1 <= a2;
}

void PLRunWithLock(void *a1, void *a2)
{
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a1;
  v3 = a2;
  v4 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void PLRunWithLock(__strong id<NSLocking> _Nonnull, void (^__strong _Nonnull)(void))");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PLLockHelpers.m"), 10, CFSTR("lock cannot be nil"));

    v4 = 0;
  }
  v5 = (void *)MEMORY[0x19AEC2E4C](objc_msgSend(v4, "lock"));
  v3[2](v3);
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v8, "unlock");

}

void sub_199E611D8(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_199E611F8(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x199E61148);
}

uint64_t PLBoolResultWithUnfairLock(os_unfair_lock_s *a1, void *a2)
{
  uint64_t (**v3)(_QWORD);
  uint64_t v4;

  v3 = a2;
  os_unfair_lock_lock(a1);
  v4 = v3[2](v3);

  os_unfair_lock_unlock(a1);
  return v4;
}

BOOL PLIntegerResultWithUnfairLock(os_unfair_lock_s *a1, void *a2)
{
  uint64_t (**v3)(_QWORD);
  uint64_t v4;

  v3 = a2;
  os_unfair_lock_lock(a1);
  v4 = v3[2](v3);

  os_unfair_lock_unlock(a1);
  return v4 != 0;
}

BOOL PLPresentLimitedLibraryPickerRepromptForApplication(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  __CFUserNotification *v16;
  __CFUserNotification *v17;
  CFOptionFlags v18;
  _BOOL8 v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  CFOptionFlags responseFlags;
  uint8_t buf[4];
  id v26;
  _QWORD v27[6];
  _QWORD v28[7];

  v28[6] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = (void *)MEMORY[0x1E0CB3940];
  PLAssetsLibraryLocalizedFrameworkString(CFSTR("PLLocalizedLimitedLibraryRepromptTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v6, CFSTR("%@"), 0, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  PLAssetsLibraryLocalizedFrameworkString(CFSTR("PLLocalizedLimitedLibraryRepromptSelectLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PLAssetsLibraryLocalizedFrameworkString(CFSTR("PLLocalizedLimitedLibraryRepromptKeepLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0C99E08];
  v11 = *MEMORY[0x1E0C9B830];
  v27[0] = *MEMORY[0x1E0C9B800];
  v27[1] = v11;
  v28[0] = v7;
  v28[1] = v8;
  v12 = *MEMORY[0x1E0C9B820];
  v27[2] = *MEMORY[0x1E0C9B868];
  v27[3] = v12;
  v28[2] = v9;
  v28[3] = MEMORY[0x1E0C9AAB0];
  v27[4] = CFSTR("DismissOnLock");
  v27[5] = CFSTR("SBUserNotificationDontDismissOnUnlock");
  v28[4] = MEMORY[0x1E0C9AAB0];
  v28[5] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryWithDictionary:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
    objc_msgSend(v14, "setObject:forKey:", v4, *MEMORY[0x1E0C9B810]);
  PLBackendGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v26 = v3;
    _os_log_impl(&dword_199DF7000, v15, OS_LOG_TYPE_DEFAULT, "Presenting library picker alert on behalf of %{public}@", buf, 0xCu);
  }

  v16 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0.0, 0x20uLL, 0, (CFDictionaryRef)v14);
  if (v16)
  {
    v17 = v16;
    responseFlags = 0;
    CFUserNotificationReceiveResponse(v16, 0.0, &responseFlags);
    v18 = responseFlags & 3;
    v19 = v18 == 1;
    CFRelease(v17);
    PLBackendGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      if (v18 == 1)
        v21 = v8;
      else
        v21 = v9;
      *(_DWORD *)buf = 138543362;
      v26 = v21;
      _os_log_impl(&dword_199DF7000, v20, OS_LOG_TYPE_DEFAULT, "User selected: %{public}@", buf, 0xCu);
    }

  }
  else
  {
    PLBackendGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v26 = v3;
      _os_log_impl(&dword_199DF7000, v22, OS_LOG_TYPE_ERROR, "Failed to present library picker alert on behalf of '%{public}@'", buf, 0xCu);
    }

    v19 = 0;
  }

  return v19;
}

void PLPresentLimitedLibraryPicker(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  NSObject *v5;
  const __CFString *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 buf;
  Class (*v12)(uint64_t);
  void *v13;
  uint64_t *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v8 = &v7;
  v9 = 0x2050000000;
  v2 = (void *)getPHLimitedLibraryPickerClass_softClass;
  v10 = getPHLimitedLibraryPickerClass_softClass;
  if (!getPHLimitedLibraryPickerClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v12 = __getPHLimitedLibraryPickerClass_block_invoke;
    v13 = &unk_1E376CAD8;
    v14 = &v7;
    __getPHLimitedLibraryPickerClass_block_invoke((uint64_t)&buf);
    v2 = (void *)v8[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v7, 8);
  PLBackendGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = CFSTR("async");
      if ((_DWORD)a1)
        v6 = CFSTR("sync");
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_199DF7000, v5, OS_LOG_TYPE_DEFAULT, "Presenting limited library picker (%@)", (uint8_t *)&buf, 0xCu);
    }

    objc_msgSend(v3, "presentLimitedLibraryPicker:waitForDismissal:", &stru_1E376D3F8, a1, v7);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_199DF7000, v5, OS_LOG_TYPE_ERROR, "Failed to register limited library picker", (uint8_t *)&buf, 2u);
    }

  }
}

void sub_199E6175C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

Class __getPHLimitedLibraryPickerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!PhotosUILibraryCore_frameworkLibrary)
    PhotosUILibraryCore_frameworkLibrary = _sl_dlopen();
  if (!PhotosUILibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *PhotosUILibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PLPrivacyUserInteraction.m"), 17, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("PHLimitedLibraryPicker");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getPHLimitedLibraryPickerClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PLPrivacyUserInteraction.m"), 18, CFSTR("Unable to find class %s"), "PHLimitedLibraryPicker");

LABEL_8:
    __break(1u);
  }
  getPHLimitedLibraryPickerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t PLIsClientApplicationStateReadyForLimitedLibraryPickerReprompt()
{
  Class v0;
  void *v1;
  _BOOL8 v2;

  v0 = NSClassFromString((NSString *)CFSTR("UIApplication"));
  if (!v0 || (objc_opt_respondsToSelector() & 1) == 0)
    return 1;
  -[objc_class sharedApplication](v0, "sharedApplication");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "applicationState") == 0;

  return v2;
}

void sub_199E619B8(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9)
{
  id v9;
  NSObject *v10;

  if (a2 == 1)
  {
    v9 = objc_begin_catch(a1);
    PLBackendGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LODWORD(a9) = 138543362;
      *(_QWORD *)((char *)&a9 + 4) = v9;
      _os_log_impl(&dword_199DF7000, v10, OS_LOG_TYPE_ERROR, "Encountered exception attempting to determine application state for limited library picker reprompt: %{public}@", (uint8_t *)&a9, 0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x199E61988);
  }
  _Unwind_Resume(a1);
}

__CFString *PLValidatedSavedAssetTypeDescription(unsigned int a1)
{
  __CFString *v3;

  v3 = CFSTR("PhotoBooth");
  switch(a1)
  {
    case 0u:
      v3 = CFSTR("Unknown");
      return v3;
    case 1u:
      return v3;
    case 2u:
      return CFSTR("PhotoStream");
    case 3u:
      return CFSTR("Camera");
    case 4u:
      return CFSTR("CloudShared");
    case 5u:
      return CFSTR("CameraConnectionKit");
    case 6u:
      return CFSTR("CloudPhotoLibrary");
    case 7u:
      return CFSTR("Wallpaper");
    case 8u:
      return CFSTR("MomentShared");
    case 9u:
      return CFSTR("Placeholder");
    case 0xAu:
      return CFSTR("Referenced");
    case 0xBu:
      return CFSTR("Alternate");
    case 0xCu:
      return CFSTR("Guest");
    case 0xDu:
      return CFSTR("CompanionSynced");
    case 0xEu:
      return CFSTR("Recovered");
    default:
      if (a1 == 256)
        return CFSTR("LegacyImport");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unrecognized savedAssetType %d"), a1);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v3;
  }
}

void sub_199E67F00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  uint64_t v35;

  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4251(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4252(uint64_t a1)
{

}

id PLUnderlyingPOSIXError(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;

  v1 = a1;
  v2 = *MEMORY[0x1E0CB2FE0];
  v3 = *MEMORY[0x1E0CB3388];
  v4 = v1;
  do
  {
    objc_msgSend(v4, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqual:", v2);

    if ((v6 & 1) != 0)
      break;
    objc_msgSend(v4, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v3);
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v8;
  }
  while (v8);

  return v4;
}

void PLMakeIndicatorFileExistAtPath(void *a1, int a2)
{
  id v3;
  const char *v4;
  int v5;
  NSObject *v6;
  int *v7;
  char *v8;
  const char *v9;
  void *v10;
  int v11;
  __CFString *v12;
  id v13;
  int v14;
  int *v15;
  char *v16;
  NSObject *v17;
  int *v18;
  char *v19;
  const __CFString *v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  char *v25;
  __int16 v26;
  const __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = objc_retainAutorelease(a1);
  v4 = (const char *)objc_msgSend(v3, "fileSystemRepresentation");
  if (a2)
  {
    v5 = open(v4, 513, 438);
    if ((v5 & 0x80000000) == 0)
    {
      close(v5);
      goto LABEL_21;
    }
    if (*__error() == 2)
    {
      objc_msgSend(v3, "stringByDeletingLastPathComponent");
      v6 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      v11 = objc_msgSend(v10, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v21);
      v12 = (__CFString *)v21;

      v13 = objc_retainAutorelease(v3);
      v14 = open((const char *)objc_msgSend(v13, "fileSystemRepresentation"), 513, 438);
      if (v14 < 0)
      {
        PLBackendGetLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v18 = __error();
          v19 = strerror(*v18);
          v20 = CFSTR("succeeded");
          *(_DWORD *)buf = 138543874;
          v23 = v13;
          if (!v11)
            v20 = v12;
          v24 = 2082;
          v25 = v19;
          v26 = 2114;
          v27 = v20;
          _os_log_impl(&dword_199DF7000, v17, OS_LOG_TYPE_ERROR, "%{public}@ could not be created, error: %{public}s, dir creation %{public}@", buf, 0x20u);
        }

      }
      else
      {
        close(v14);
      }

      goto LABEL_20;
    }
    PLBackendGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v15 = __error();
      v16 = strerror(*v15);
      *(_DWORD *)buf = 138543618;
      v23 = v3;
      v24 = 2082;
      v25 = v16;
      v9 = "%{public}@ could not be created, error: %{public}s";
      goto LABEL_13;
    }
    goto LABEL_20;
  }
  if (unlink(v4) && *__error() != 2)
  {
    PLBackendGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = __error();
      v8 = strerror(*v7);
      *(_DWORD *)buf = 138543618;
      v23 = v3;
      v24 = 2082;
      v25 = v8;
      v9 = "%{public}@ could not be removed, error: %{public}s";
LABEL_13:
      _os_log_impl(&dword_199DF7000, v6, OS_LOG_TYPE_ERROR, v9, buf, 0x16u);
    }
LABEL_20:

  }
LABEL_21:

}

uint64_t PLQualityOfServiceFromQoSClass(int a1)
{
  if (a1 <= 20)
  {
    if (a1 && a1 != 17)
      return 9;
    return 17;
  }
  switch(a1)
  {
    case 21:
      return 17;
    case 25:
      return 25;
    case 33:
      return 33;
  }
  return 9;
}

const __CFString *PLShortStringFromQoSClass(int a1)
{
  if (a1 > 16)
  {
    if (a1 > 24)
    {
      if (a1 == 33)
        return CFSTR("UI");
      if (a1 == 25)
        return CFSTR("IN");
    }
    else
    {
      if (a1 == 17)
        return CFSTR("UT");
      if (a1 == 21)
        return CFSTR("DEF");
    }
    return CFSTR("UNKNOWN");
  }
  if (!a1)
    return CFSTR("UN");
  if (a1 != 5)
  {
    if (a1 == 9)
      return CFSTR("BG");
    return CFSTR("UNKNOWN");
  }
  return CFSTR("MAINTENANCE");
}

const __CFString *PLStringFromQualityOfService(uint64_t a1)
{
  if (a1 <= 16)
  {
    if (a1 == -1)
      return CFSTR("NSQualityOfServiceDefault");
    if (a1 == 9)
      return CFSTR("NSQualityOfServiceBackground");
  }
  else
  {
    switch(a1)
    {
      case 17:
        return CFSTR("NSQualityOfServiceUtility");
      case 33:
        return CFSTR("NSQualityOfServiceUserInteractive");
      case 25:
        return CFSTR("NSQualityOfServiceUserInitiated");
    }
  }
  return CFSTR("Unknown");
}

void sub_199E6A8BC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

id stringFromData(void *a1)
{
  objc_class *v1;
  id v2;
  void *v3;

  v1 = (objc_class *)MEMORY[0x1E0CB3940];
  v2 = a1;
  v3 = (void *)objc_msgSend([v1 alloc], "initWithData:encoding:", v2, 4);

  return v3;
}

id dateFromData(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  double v5;

  v5 = 0.0;
  objc_msgSend(a1, "getBytes:length:", &v5, 8);
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "startOfDayForDate:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id circularRegionFromData(void *a1)
{
  void *v1;
  id v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3710];
  v2 = a1;
  objc_msgSend(v1, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id convertToData(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  const __CFNumber *v4;
  CFNumberType Type;
  double v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v1 = a1;
  if (!v1)
    goto LABEL_15;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    dataFromDate(v1);
    v2 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v3 = (void *)v2;
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v1, "dataUsingEncoding:", 4);
    v2 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v1, 1, 0);
    v2 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSData * _Nullable convertToData(NSObject * _Nullable __strong)");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PLSingleQuery+Utilities.m"), 96, CFSTR("Object value must be either date, string, or number but is: <%@:%p>"), objc_opt_class(), v1);

LABEL_15:
    v3 = 0;
    goto LABEL_16;
  }
  v4 = (const __CFNumber *)v1;
  Type = CFNumberGetType(v4);
  if ((unint64_t)Type <= kCFNumberCGFloatType && ((1 << Type) & 0x13060) != 0)
  {
    -[__CFNumber doubleValue](v4, "doubleValue");
    dataFromDouble(v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    dataFromInteger(-[__CFNumber integerValue](v4, "integerValue"));
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v3 = (void *)v7;

LABEL_16:
  return v3;
}

id dataFromDate(void *a1)
{
  uint64_t v1;
  uint64_t v3;

  objc_msgSend(a1, "timeIntervalSinceReferenceDate");
  v3 = v1;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v3, 8);
  return (id)objc_claimAutoreleasedReturnValue();
}

id dataFromDouble(double a1)
{
  double v2;

  v2 = a1;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v2, 8);
  return (id)objc_claimAutoreleasedReturnValue();
}

id dataFromInteger(uint64_t a1)
{
  uint64_t v2;

  v2 = a1;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v2, 8);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t integerFromData(void *a1)
{
  uint64_t v2;

  v2 = 0;
  objc_msgSend(a1, "getBytes:length:", &v2, 8);
  return v2;
}

double doubleFromData(void *a1)
{
  double v2;

  v2 = 0.0;
  objc_msgSend(a1, "getBytes:length:", &v2, 8);
  return v2;
}

void sub_199E6AFFC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_199E6B808(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,SEL sel,uint8_t buf)
{

  _Unwind_Resume(a1);
}

void sub_199E6BC04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,SEL sel,uint8_t buf)
{

  _Unwind_Resume(a1);
}

void sub_199E6BE4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_199E6BFE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_199E6C344(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,SEL sel,uint8_t buf)
{

  _Unwind_Resume(a1);
}

void sub_199E6C72C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E6CAF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E6CEB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,SEL sel,uint8_t buf)
{

  _Unwind_Resume(a1);
}

void sub_199E6D2DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,void *a32,uint64_t a33,uint64_t a34,uint64_t a35,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E6D778(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_199E6DBD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E6DFF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E6E49C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,SEL sel)
{

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4782(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4783(uint64_t a1)
{

}

id PLProgressPercentGroupCheck(void *a1)
{
  id v1;
  void *v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v1 = a1;
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  objc_msgSend(v1, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __PLProgressPercentGroupCheck_block_invoke;
  v4[3] = &unk_1E376A230;
  v4[4] = &v5;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v4);

  if (v6[3] >= 101)
    __assert_rtn("PLProgressPercentGroupCheck", "PLLibraryServicesOperationProgress.m", 80, "totalPercent <= 100");
  _Block_object_dispose(&v5, 8);
  return v1;
}

void sub_199E6F3F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id PLProgressPercentGroupForLaunchStateMachine()
{
  void *v0;
  id v1;
  void *v2;
  _QWORD v4[14];
  _QWORD v5[14];
  _QWORD v6[5];
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("Wait for data migration checkpoint");
  v6[1] = CFSTR("Prepare for OTA restore if necessary");
  v7[0] = &unk_1E378F410;
  v7[1] = &unk_1E378F428;
  v6[2] = CFSTR("Wait for first unlock");
  v6[3] = CFSTR("Migrate or rebuild library if necessary");
  v7[2] = &unk_1E378F410;
  v7[3] = &unk_1E378F440;
  v6[4] = CFSTR("Initialize CPL manager");
  v7[4] = &unk_1E378F410;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 5);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v1, "addEntriesFromDictionary:", v0);
  v4[0] = CFSTR("Create constraints director");
  v4[1] = CFSTR("Notify library availability");
  v5[0] = &unk_1E378F458;
  v5[1] = &unk_1E378F410;
  v4[2] = CFSTR("Activate TCC");
  v4[3] = CFSTR("Initialize change handling");
  v5[2] = &unk_1E378F458;
  v5[3] = &unk_1E378F410;
  v4[4] = CFSTR("Detect and enqueue outstanding transaction crash recovery operations");
  v4[5] = CFSTR("CrashRecovery: Rebuild all moments");
  v5[4] = &unk_1E378F410;
  v5[5] = &unk_1E378F410;
  v4[6] = CFSTR("CrashRecovery: Recalculate album counts");
  v4[7] = CFSTR("CrashRecovery: Cloud feed rebuild");
  v5[6] = &unk_1E378F458;
  v5[7] = &unk_1E378F458;
  v4[8] = CFSTR("CrashRecovery: Import from file system");
  v4[9] = CFSTR("CrashRecovery: Reset search index");
  v5[8] = &unk_1E378F458;
  v5[9] = &unk_1E378F458;
  v4[10] = CFSTR("CrashRecovery: Restart pending placeholder assets");
  v4[11] = CFSTR("File System Import Notify Enter");
  v5[10] = &unk_1E378F458;
  v5[11] = &unk_1E378F458;
  v4[12] = CFSTR("Create singleton albums if required");
  v4[13] = CFSTR("Create singleton albums if required");
  v5[12] = &unk_1E378F458;
  v5[13] = &unk_1E378F458;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 14);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addEntriesFromDictionary:", v2);

  return v1;
}

id PLProgressPercentGroupForRunningStateMachine()
{
  void *v0;
  id v1;
  void *v2;
  _QWORD v4[6];
  _QWORD v5[6];
  _QWORD v6[5];
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("Camera ingest recovery");
  v6[1] = CFSTR("Build quick action items");
  v7[0] = &unk_1E378F458;
  v7[1] = &unk_1E378F458;
  v6[2] = CFSTR("Asset creation recovery");
  v6[3] = CFSTR("Register background job service on library");
  v7[2] = &unk_1E378F458;
  v7[3] = &unk_1E378F458;
  v6[4] = CFSTR("Recovery from Duplicate Merge crash recovery");
  v7[4] = &unk_1E378F458;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 5);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v1, "addEntriesFromDictionary:", v0);
  v4[0] = CFSTR("Tell photoanalysisd about a newly opened library");
  v4[1] = CFSTR("Handle thumbnail rebuild request");
  v5[0] = &unk_1E378F458;
  v5[1] = &unk_1E378F458;
  v4[2] = CFSTR("Start Journal Manager");
  v4[3] = CFSTR("Handle locale change if necessary");
  v5[2] = &unk_1E378F458;
  v5[3] = &unk_1E378F458;
  v4[4] = CFSTR("Handle green tea contacts authorization change if necessary");
  v4[5] = CFSTR("File System Import");
  v5[4] = &unk_1E378F458;
  v5[5] = &unk_1E378F470;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addEntriesFromDictionary:", v2);

  return v1;
}

void PLProgressPercentForOperationAddMap(void *a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  v3 = a1;
  PLProgressPercentGroupCheck(v4);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

}

uint64_t PLProgressPercentForOperationName(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;

  v1 = PLProgressPercentForOperationName_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&PLProgressPercentForOperationName_onceToken, &__block_literal_global_4945);
  objc_msgSend((id)PLProgressPercentForOperationName_progressPercentMap, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "intValue");
  return v4;
}

uint64_t __Block_byref_object_copy__4995(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4996(uint64_t a1)
{

}

void sub_199E703B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_199E70670(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E70914(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E70D08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E71104(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E71500(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E71904(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E71C0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,void *a24,uint64_t a25,uint64_t a26,uint64_t a27,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E71F58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E722A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E725F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E72948(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E72D6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E73058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_199E732F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E735E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_199E73928(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E73C20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_199E73E50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_199E74174(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E74460(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_199E74794(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E74BB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E74F94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,void *a30,uint64_t a31,uint64_t a32,uint64_t a33,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E752C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E755F0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_199E75918(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E75C40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E75F88(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_199E762C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,void *a24,uint64_t a25,uint64_t a26,uint64_t a27,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E7662C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_199E76954(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E76C90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,void *a30,uint64_t a31,uint64_t a32,uint64_t a33,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E76FEC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_199E772E4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_199E775DC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_199E778D4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_199E77BFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E77F24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E78180(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_199E784A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E787BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E78AB4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_199E78DC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E790EC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_199E793E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E79738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{

  _Unwind_Resume(a1);
}

void sub_199E79A80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E79D64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_199E7A088(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, SEL sel)
{

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5222(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5223(uint64_t a1)
{

}

void sub_199E80F64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26)
{

  _Unwind_Resume(a1);
}

void sub_199E81070(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5524(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5525(uint64_t a1)
{

}

id PLAssetFormatsAllKnownFormatIDs()
{
  if (PLAssetFormatsAllKnownFormatIDs_onceToken != -1)
    dispatch_once(&PLAssetFormatsAllKnownFormatIDs_onceToken, &__block_literal_global_5612);
  return (id)PLAssetFormatsAllKnownFormatIDs_formatIDs;
}

uint64_t __Block_byref_object_copy__5667(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5668(uint64_t a1)
{

}

void sub_199E82D14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_199E82FEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6068(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6069(uint64_t a1)
{

}

BOOL PLImageFormatSizeIsMaxSize(double a1, double a2)
{
  return a2 <= 0.0 || a1 <= 0.0;
}

void sub_199E85464(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id PLPhotosPickerLogDateFormatter()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v0, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss.SSSZZZZZ"));
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setLocale:", v1);

  return v0;
}

__CFString *PLStringFromPhotosAccessScope(uint64_t a1)
{
  __CFString *v1;
  char v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (a1 != 1)
  {
    v2 = a1;
    if ((a1 & 7) != 0)
    {
      v1 = CFSTR("read-write");
      return v1;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if ((v2 & 2) != 0)
    {
      objc_msgSend(v3, "addObject:", CFSTR("read"));
      if ((v2 & 4) == 0)
      {
LABEL_7:
        if ((v2 & 1) == 0)
        {
LABEL_9:
          v5 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v4, "componentsJoinedByString:", CFSTR("|"));
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "stringWithFormat:", CFSTR("read-write (%@)"), v6);
          v1 = (__CFString *)objc_claimAutoreleasedReturnValue();

          return v1;
        }
LABEL_8:
        objc_msgSend(v4, "addObject:", CFSTR("add"));
        goto LABEL_9;
      }
    }
    else if ((v2 & 4) == 0)
    {
      goto LABEL_7;
    }
    objc_msgSend(v4, "addObject:", CFSTR("modify"));
    if ((v2 & 1) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  v1 = CFSTR("add-only");
  return v1;
}

uint64_t gettcc_authorization_audit_token_report_useSymbolLoc()
{
  uint64_t v0;
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = gettcc_authorization_audit_token_report_useSymbolLoc_ptr;
  v6 = gettcc_authorization_audit_token_report_useSymbolLoc_ptr;
  if (!gettcc_authorization_audit_token_report_useSymbolLoc_ptr)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __gettcc_authorization_audit_token_report_useSymbolLoc_block_invoke;
    v2[3] = &unk_1E376CAD8;
    v2[4] = &v3;
    __gettcc_authorization_audit_token_report_useSymbolLoc_block_invoke(v2);
    v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_199E865B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__gettcc_authorization_audit_token_report_useSymbolLoc_block_invoke(_QWORD *a1)
{
  void *v2;
  void *result;
  void *v4;

  if (!TCCLibraryCore_frameworkLibrary)
    TCCLibraryCore_frameworkLibrary = _sl_dlopen();
  v2 = (void *)TCCLibraryCore_frameworkLibrary;
  if (!TCCLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *TCCLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("PLPrivacy.m"), 31, CFSTR("%s"), 0);

    __break(1u);
    free(v4);
  }
  result = dlsym(v2, "tcc_authorization_audit_token_report_use");
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  gettcc_authorization_audit_token_report_useSymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  return result;
}

id _ValidatedClientLogFromDictionary(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (!v1)
  {
    v9 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("bundleIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("timestamp"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  PLPhotosPickerLogDateFormatter();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateFromString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_7;
  v9 = 0;
  if (!objc_msgSend(v3, "length") || !v8)
    goto LABEL_8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14[0] = CFSTR("bundleIdentifier");
    v14[1] = CFSTR("timestamp");
    v15[0] = v3;
    v15[1] = v8;
    v14[2] = CFSTR("pickerUsesOptions");
    v10 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v2, "objectForKeyedSubscript:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "numberWithBool:", objc_msgSend(v11, "BOOLValue"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_7:
    v9 = 0;
  }
LABEL_8:

LABEL_10:
  return v9;
}

BOOL PLPhotosFullAccessAllowed(uint64_t a1)
{
  return a1 == 0;
}

BOOL PLPhotosLimitedAccessAllowed(uint64_t a1)
{
  return a1 == 4;
}

uint64_t PLPhotosAccessAllowedResultForClientAuditToken()
{
  unint64_t v0;
  uint64_t v1;

  v0 = tcc_authorization_check_audit_token();
  if (v0 >= 5)
    v1 = 1;
  else
    v1 = v0;
  return qword_199EB0BD8[v1];
}

void sub_199E87C44(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_199E87DB8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6878(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6879(uint64_t a1)
{

}

__CFString *PLStringFromPLPhotoLibraryPathManagerLibraryFormatShort(int a1)
{
  unint64_t v2;
  __CFString *v3;
  __CFString *v4;
  uint64_t v5;

  v2 = objc_msgSend(CFSTR("PLPhotoLibraryPathManagerLibraryFormat"), "length");
  v3 = CFSTR("PLPhotoLibraryPathManagerLibraryFormatDefault");
  if (a1 == 1)
    v3 = CFSTR("PLPhotoLibraryPathManagerLibraryFormatDCIM");
  if (a1 == 2)
    v3 = CFSTR("PLPhotoLibraryPathManagerLibraryFormatUBF");
  v4 = v3;
  if (-[__CFString length](v4, "length") > v2)
  {
    -[__CFString substringFromIndex:](v4, "substringFromIndex:", v2);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (__CFString *)v5;
  }
  return v4;
}

const __CFString *PLStringFromPLPhotoLibraryPathManagerLibraryFormat(int a1)
{
  const __CFString *v1;

  v1 = CFSTR("PLPhotoLibraryPathManagerLibraryFormatDefault");
  if (a1 == 1)
    v1 = CFSTR("PLPhotoLibraryPathManagerLibraryFormatDCIM");
  if (a1 == 2)
    return CFSTR("PLPhotoLibraryPathManagerLibraryFormatUBF");
  else
    return v1;
}

id PLUnarchiveUUIDStringsSetFromData(void *a1)
{
  id v1;
  unint64_t v2;
  unint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unsigned int v8;
  void *v9;
  void *v11;
  _BYTE v13[37];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = objc_msgSend(v1, "length");
  v3 = v2 >> 4;
  v4 = objc_retainAutorelease(v1);
  v5 = objc_msgSend(v4, "bytes");
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", v2 >> 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 >= 0x10)
  {
    v7 = 0;
    v8 = 1;
    do
    {
      memset(v13, 0, sizeof(v13));
      uuid_unparse((const unsigned __int8 *)(v5 + 16 * v7), v13);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v9);

      v7 = v8;
    }
    while (v3 > v8++);
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id PLArchiveDataFromUUIDStringsSet(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = objc_msgSend(v1, "count");
  if (v2)
  {
    v3 = 16 * v2;
    v4 = (char *)malloc_type_malloc(16 * v2, 0x5BE23801uLL);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v1;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v5);
          v8 += +[PLUUIDString parseUUIDString:uuidBuffer:](PLUUIDString, "parseUUIDString:uuidBuffer:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10++), &v4[16 * v8], (_QWORD)v13);
        }
        while (v7 != v10);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v4, v3, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

const __CFString *PLAdjustmentBaseVersionDescription(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("unadjusted");
  if (a1 == 2)
    v1 = CFSTR("current");
  if (a1 == 1)
    return CFSTR("penultimate");
  else
    return v1;
}

const __CFString *PLStringFromPLQueryConjunction(int a1)
{
  const __CFString *v1;

  v1 = CFSTR("kPLQueryConjunction_OR");
  if (a1 == 1)
    v1 = CFSTR("kPLQueryConjunction_AND");
  if (a1 == 2)
    return CFSTR("kPLQueryConjunction_NOT");
  else
    return v1;
}

const __CFString *PLStringFromPLQueryKey(int a1)
{
  const __CFString *result;
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  BOOL v6;
  const __CFString *v7;

  result = CFSTR("kPLQueryKey_unknown");
  if (a1 <= 299)
  {
    if (a1 > 99)
    {
      v3 = CFSTR("kPLQueryKey_inAlbum");
      v4 = CFSTR("kPLQueryKey_dateCaptured");
      v5 = CFSTR("kPLQueryKey_dateAdded");
      if (a1 != 201)
        v5 = CFSTR("kPLQueryKey_unknown");
      if (a1 != 200)
        v4 = v5;
      v6 = a1 == 100;
      goto LABEL_24;
    }
    switch(a1)
    {
      case 1:
        result = CFSTR("kPLQueryKey_isFavorite");
        break;
      case 2:
        result = CFSTR("kPLQueryKey_isHidden");
        break;
      case 3:
        result = CFSTR("kPLQueryKey_isAdjusted");
        break;
      case 4:
        result = CFSTR("kPLQueryKey_isRAW");
        break;
      case 5:
        result = CFSTR("kPLQueryKey_assetType");
        break;
      case 6:
        result = CFSTR("kPLQueryKey_isReferenced");
        break;
      case 7:
        result = CFSTR("kPLQueryKey_isOnline");
        break;
      case 8:
        result = CFSTR("kPLQueryKey_isMissing");
        break;
      case 9:
        result = CFSTR("kPLQueryKey_isProRes");
        break;
      default:
        return result;
    }
  }
  else
  {
    if (a1 <= 399)
    {
      switch(a1)
      {
        case 300:
          result = CFSTR("kPLQueryKey_aperture");
          break;
        case 301:
          result = CFSTR("kPLQueryKey_cameraModel");
          break;
        case 302:
          result = CFSTR("kPLQueryKey_flash");
          break;
        case 303:
          result = CFSTR("kPLQueryKey_focalLength");
          break;
        case 304:
          result = CFSTR("kPLQueryKey_iso");
          break;
        case 305:
          result = CFSTR("kPLQueryKey_lensModel");
          break;
        case 306:
          result = CFSTR("kPLQueryKey_shutterSpeed");
          break;
        case 309:
          result = CFSTR("kPLQueryKey_bitrate");
          break;
        case 310:
          result = CFSTR("kPLQueryKey_cameraMake");
          break;
        case 311:
          result = CFSTR("kPLQueryKey_codec");
          break;
        case 312:
          result = CFSTR("kPLQueryKey_duration");
          break;
        case 313:
          result = CFSTR("kPLQueryKey_exposureBias");
          break;
        case 314:
          result = CFSTR("kPLQueryKey_fps");
          break;
        case 315:
          result = CFSTR("kPLQueryKey_meteringMode");
          break;
        case 316:
          result = CFSTR("kPLQueryKey_sampleRate");
          break;
        case 317:
          result = CFSTR("kPLQueryKey_trackFormat");
          break;
        case 318:
          result = CFSTR("kPLQueryKey_whiteBalance");
          break;
        case 319:
          result = CFSTR("kPLQueryKey_hasLocation");
          break;
        default:
          return result;
      }
      return result;
    }
    if (a1 > 549)
    {
      if (a1 <= 599)
      {
        switch(a1)
        {
          case 550:
            result = CFSTR("kPLQueryKey_personName");
            break;
          case 551:
            result = CFSTR("kPLQueryKey_personUUID");
            break;
          case 552:
            result = CFSTR("kPLQueryKey_personUUIDInProximity_unused");
            break;
          case 553:
            result = CFSTR("kPLQueryKey_personUUIDInMomentForSharedLibrary");
            break;
          default:
            return result;
        }
        return result;
      }
      v3 = CFSTR("kPLQueryKey_inCircularRegion");
      v4 = CFSTR("kPLQueryKey_notAbleToCPLUpload");
      v7 = CFSTR("kPLQueryKey_isCPLQuarantine");
      if (a1 != 1001)
        v7 = CFSTR("kPLQueryKey_unknown");
      if (a1 != 1000)
        v4 = v7;
      v6 = a1 == 600;
LABEL_24:
      if (v6)
        return v3;
      else
        return v4;
    }
    switch(a1)
    {
      case 400:
        result = CFSTR("kPLQueryKey_filename");
        break;
      case 401:
        result = CFSTR("kPLQueryKey_title");
        break;
      case 402:
        result = CFSTR("kPLQueryKey_text");
        break;
      case 403:
        result = CFSTR("kPLQueryKey_description");
        break;
      default:
        if (a1 == 500)
          result = CFSTR("kPLQueryKey_keyword");
        break;
    }
  }
  return result;
}

const __CFString *PLStringFromPLQueryValueType(int a1)
{
  if ((a1 - 1) > 4)
    return CFSTR("kPLQueryValueType_unknown");
  else
    return *(&off_1E376B9D8 + (a1 - 1));
}

const __CFString *PLStringFromPLQueryComparatorType(int a1)
{
  const __CFString *result;
  const __CFString *v3;

  result = CFSTR("kPLQueryComparatorType_unknown");
  switch(a1)
  {
    case 1:
      result = CFSTR("kPLQueryComparatorType_isEqual");
      break;
    case 2:
      result = CFSTR("kPLQueryComparatorType_isNotEqual");
      break;
    case 3:
      result = CFSTR("kPLQueryComparatorType_isGreaterThan");
      break;
    case 4:
      result = CFSTR("kPLQueryComparatorType_isLessThan");
      break;
    case 5:
      result = CFSTR("kPLQueryComparatorType_isGreaterOrEqualThan");
      break;
    case 6:
      result = CFSTR("kPLQueryComparatorType_isLessOrEqualThan");
      break;
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 26:
    case 27:
    case 28:
    case 29:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
      return result;
    case 20:
      result = CFSTR("kPLQueryComparatorType_textIncludes");
      break;
    case 21:
      result = CFSTR("kPLQueryComparatorType_textNotIncludes");
      break;
    case 22:
      result = CFSTR("kPLQueryComparatorType_textIs");
      break;
    case 23:
      result = CFSTR("kPLQueryComparatorType_textIsNot");
      break;
    case 24:
      result = CFSTR("kPLQueryComparatorType_textStartsWith");
      break;
    case 25:
      result = CFSTR("kPLQueryComparatorType_textEndsWith");
      break;
    case 30:
      result = CFSTR("kPLQueryComparatorType_isInRange");
      break;
    case 31:
      result = CFSTR("kPLQueryComparatorType_isIn");
      break;
    case 32:
      result = CFSTR("kPLQueryComparatorType_isNotIn");
      break;
    case 40:
      result = CFSTR("kPLQueryComparatorType_isInTheLast");
      break;
    case 41:
      result = CFSTR("kPLQueryComparatorType_isNotInTheLast");
      break;
    default:
      v3 = CFSTR("kPLQueryComparatorType_isAny");
      if (a1 != 51)
        v3 = CFSTR("kPLQueryComparatorType_unknown");
      if (a1 == 50)
        result = CFSTR("kPLQueryComparatorType_isEmpty");
      else
        result = v3;
      break;
  }
  return result;
}

const __CFString *PLStringFromPLQueryUnit(int a1)
{
  if ((a1 - 1) > 4)
    return CFSTR("kPLQueryUnit_unused");
  else
    return *(&off_1E376BA00 + (a1 - 1));
}

const __CFString *PLStringFromPLQueryValue(int a1)
{
  if ((a1 - 1) > 0x10)
    return CFSTR("kPLQueryValue_unknown");
  else
    return *(&off_1E376BA28 + (a1 - 1));
}

void PLUpdateSizeUnit(double *a1, _QWORD *a2, double a3)
{
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(&unk_1E378FFD8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = a3 * 1000.0;
    v9 = *(_QWORD *)v14;
    v10 = 1.0;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(&unk_1E378FFD8);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (v8 < 1000.0
          || objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "isEqualToString:", CFSTR("TB")))
        {
          if (a1)
            *a1 = v10 * 1000.0;
          if (a2)
            *a2 = objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
          return;
        }
        v10 = v10 / 1000.0;
        v8 = v8 / 1000.0;
      }
      v7 = objc_msgSend(&unk_1E378FFD8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
}

id PLIndentToString(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1 >= 1)
  {
    do
    {
      objc_msgSend(v2, "appendString:", PLIndent);
      --a1;
    }
    while (a1);
  }
  return v2;
}

id PLEmptyContainerDescription(void *a1)
{
  void *v1;
  id v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = a1;
  objc_msgSend(v1, "stringWithFormat:", CFSTR("<%@: %p> <empty>"), objc_opt_class(), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t PLObjectIsEqual(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v3 == v4)
  {
    v6 = 1;
  }
  else
  {
    v6 = 0;
    if (v3 && v4)
      v6 = objc_msgSend(v3, "isEqual:", v4);
  }

  return v6;
}

id PLAggregateComparator(void *a1)
{
  objc_class *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v1 = (objc_class *)MEMORY[0x1E0C99D20];
  v2 = a1;
  v3 = (void *)objc_msgSend([v1 alloc], "initWithArray:copyItems:", v2, 1);

  v4 = v3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = ___PLAggregateComparatorFromArray_block_invoke;
  v8[3] = &unk_1E376BB98;
  v9 = v4;
  v5 = (void *)MEMORY[0x19AEC3014](v8);
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

id PLNullToNil(void *a1)
{
  id v1;
  id v2;
  id v3;
  id v5;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)*MEMORY[0x1E0C9B0D0];

  if (v2 == v1 || v3 == v1)
    v5 = 0;
  else
    v5 = v1;

  return v5;
}

id PLFullMethodName(void *a1, const char *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = a1;
  v4 = objc_opt_class();

  v5 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 45;
  if ((id)v4 == v3)
    v7 = 43;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%c[%@ %@]"), v7, v4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id PLAbstractMethodException(void *a1, const char *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a1;
  PLFullMethodName(v3, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99778];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: must override selector sent to %p"), v4, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id PLMethodNotImplementedException(void *a1, const char *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a1;
  PLFullMethodName(v3, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99778];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: method not implemented sent to %p"), v4, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void sub_199E8EB60(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_199E8F164(void *a1)
{
  objc_begin_catch(a1);
  objc_end_catch();
}

uint64_t PLIsErrorEqualToCode(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  v5 = a1;
  v6 = a2;
  if (v5 && objc_msgSend(v5, "code") == a3)
  {
    objc_msgSend(v5, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", v6);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

__CFString *NSStringFromPLErrorCode(uint64_t a1)
{
  __CFString *v2;
  __CFString *result;

  if (a1 > 46799)
  {
    if (a1 <= 51000)
    {
      if (a1 > 48000)
      {
        if (a1 <= 49400)
        {
          switch(a1)
          {
            case 48001:
              return CFSTR("PLPhotosErrorFailedToFinalizeDeferredPhotoGeneric");
            case 48002:
              return CFSTR("PLPhotosErrorDeferredProcessingInvalidated");
            case 49001:
              return CFSTR("PLPhotosErrorInsufficientResourcesForEdit");
          }
          goto LABEL_230;
        }
        switch(a1)
        {
          case 49401:
            result = CFSTR("PLPhotosErrorDuplicateInvalidLibrary");
            break;
          case 49402:
            result = CFSTR("PLPhotosErrorDuplicateInvalidLibraryManager");
            break;
          case 49403:
            result = CFSTR("PLPhotosErrorDuplicateInvalidParameter");
            break;
          case 49404:
            result = CFSTR("PLPhotosErrorDuplicateMissingAlbum");
            break;
          case 49405:
            result = CFSTR("PLPhotosErrorDuplicateNotMergeReady");
            break;
          case 49406:
            result = CFSTR("PLPhotosErrorDuplicateCancelled");
            break;
          case 49407:
            result = CFSTR("PLPhotosErrorDuplicateIncompatibleResource");
            break;
          case 49408:
            result = CFSTR("PLPhotosErrorDuplicatePropertyMergeFailure");
            break;
          case 49409:
            result = CFSTR("PLPhotosErrorDuplicateInvalidCPLState");
            break;
          default:
            switch(a1)
            {
              case 50001:
                result = CFSTR("PLPhotosErrorBackgroundJobWorkerCompletionHandlerForcefullyCalled");
                break;
              case 50002:
                result = CFSTR("PLPhotosErrorBackgroundJobWorkerNoWorkNeeded");
                break;
              case 50003:
                result = CFSTR("PLPhotosErrorBackgroundJobWorkerStopRunningRemainingWorkItems");
                break;
              case 50004:
                result = CFSTR("PLPhotosErrorBackgroundJobWorkerRequestedDeferral");
                break;
              case 50005:
                result = CFSTR("PLPhotosErrorBackgroundJobWorkerCancelled");
                break;
              case 50006:
                result = CFSTR("PLPhotosErrorBackgroundJobWorkerInvalidParameter");
                break;
              case 50007:
                result = CFSTR("PLPhotosErrorBackgroundJobWorkerIncorrectWorkItem");
                break;
              default:
                switch(a1)
                {
                  case 49501:
                    result = CFSTR("PLPhotosErrorSyndicationInvalidContentType");
                    break;
                  case 49502:
                    result = CFSTR("PLPhotosErrorSyndicationIngestDataTooLarge");
                    break;
                  case 49503:
                    result = CFSTR("PLPhotosErrorSyndicationIngestDataSizeInvalid");
                    break;
                  case 49504:
                    result = CFSTR("PLPhotosErrorSyndicationIngestUnknownTypeIdentifier");
                    break;
                  default:
                    goto LABEL_230;
                }
                break;
            }
            break;
        }
      }
      else
      {
        if (a1 <= 47000)
        {
          switch(a1)
          {
            case 46800:
              return CFSTR("PLPhotosErrorFailedToCreateDefaultDirectories");
            case 46801:
              return CFSTR("PLPhotosErrorInvalidFileIdentifier");
            case 46802:
              return CFSTR("PLPhotosErrorMissingLibraryBundle");
          }
          goto LABEL_230;
        }
        switch(a1)
        {
          case 47001:
            result = CFSTR("PLPhotosErrorFailedToGenerateLocalResourceGeneric");
            break;
          case 47002:
            result = CFSTR("PLPhotosErrorFailedToGenerateLocalResourcesCallerCancelledError");
            break;
          case 47003:
            result = CFSTR("PLPhotosErrorFailedToGenerateLocalResourcesMissingIngredients");
            break;
          case 47004:
            result = CFSTR("PLPhotosErrorFailedToGenerateLocalResourcesNoSupportedVersions");
            break;
          case 47005:
            result = CFSTR("PLPhotosErrorFailedToGenerateLocalResourcesRecipeNotSupported");
            break;
          case 47006:
            result = CFSTR("PLPhotosErrorFailedToGenerateLocalResourcesMissingURLsOrUTI");
            break;
          case 47007:
            result = CFSTR("PLPhotosErrorFailedToGenerateLocalResourcesMediaConversion");
            break;
          case 47008:
            result = CFSTR("PLPhotosErrorFailedToGenerateLocalResourcesThumbnailGenerationFailed");
            break;
          case 47009:
            result = CFSTR("PLPhotosErrorFailedToGenerateLocalResourcesStoreFailed");
            break;
          case 47010:
            result = CFSTR("PLPhotosErrorFailedToGenerateLocalResourcesStoreFailedCantCreateExternalResource");
            break;
          case 47011:
            result = CFSTR("PLPhotosErrorFailedToMoveResourceFile");
            break;
          case 47012:
            result = CFSTR("PLPhotosErrorFailedToObtainWritePathForResourceFile");
            break;
          case 47013:
            result = CFSTR("PLPhotosErrorResourceFileNotFound");
            break;
          case 47014:
            result = CFSTR("PLPhotosErrorResourceCannotResolveInode");
            break;
          case 47015:
            result = CFSTR("PLPhotosErrorFailedToGenerateLocalResourcesMissingAdjustmentData");
            break;
          case 47016:
            result = CFSTR("PLPhotosErrorInvalidAdjustmentData");
            break;
          case 47017:
            result = CFSTR("PLPhotosErrorResourceNotFound");
            break;
          case 47018:
            result = CFSTR("PLPhotosErrorNetworkAccessRequired");
            break;
          case 47019:
            result = CFSTR("PLPhotosErrorResourceNotPurgeable");
            break;
          case 47020:
            result = CFSTR("PLPhotosErrorInvalidMetadata");
            break;
          case 47021:
            result = CFSTR("PLPhotosErrorFailedToGenerateLocalResourcesGenerateAdjustmentFileNotFound");
            break;
          default:
            goto LABEL_230;
        }
      }
    }
    else if (a1 <= 61000)
    {
      switch(a1)
      {
        case 51001:
          result = CFSTR("PLPhotosErrorJournalEntryParse");
          break;
        case 51002:
          result = CFSTR("PLPhotosErrorJournalEntryWrite");
          break;
        case 51003:
          result = CFSTR("PLPhotosErrorJournalFileRead");
          break;
        case 51004:
          result = CFSTR("PLPhotosErrorJournalFileWrite");
          break;
        case 51005:
          result = CFSTR("PLPhotosErrorJournalFileAtEOF");
          break;
        case 51006:
          result = CFSTR("PLPhotosErrorJournalDoesNotExist");
          break;
        case 51007:
          result = CFSTR("PLPhotosErrorJournalPayloadTooNew");
          break;
        case 51008:
          result = CFSTR("PLPhotosErrorJournalInvalidJournalManagerState");
          break;
        case 51009:
          result = CFSTR("PLPhotosErrorJournalManagerNeedsSnapshot");
          break;
        case 51010:
          result = CFSTR("PLPhotosErrorJournalManagerHistoryIterate");
          break;
        case 51011:
          result = CFSTR("PLPhotosErrorJournalManagerHistoryIterateFromStart");
          break;
        case 51012:
          result = CFSTR("PLPhotosErrorJournalSnapshotExists");
          break;
        default:
          switch(a1)
          {
            case 52001:
              result = CFSTR("PLPhotosErrorComputeCacheUnsupported");
              break;
            case 52002:
              result = CFSTR("PLPhotosErrorComputeCacheRestoreCount");
              break;
            case 52003:
              result = CFSTR("PLPhotosErrorComputeCacheTooManyRestoreAttempts");
              break;
            case 52004:
              result = CFSTR("PLPhotosErrorComputeCacheRestoreStateCompleted");
              break;
            case 52005:
              result = CFSTR("PLPhotosErrorComputeCacheRestoreStateNotPermitted");
              break;
            case 52006:
              result = CFSTR("PLPhotosErrorComputeCacheRestoreDisabledByConfiguration");
              break;
            case 52007:
              result = CFSTR("PLPhotosErrorComputeCacheRestoreStateInProgress");
              break;
            case 52008:
              result = CFSTR("PLPhotosErrorComputeCacheBackupInvalidState");
              break;
            case 52009:
              result = CFSTR("PLPhotosErrorComputeCacheBackupSnapshotMissing");
              break;
            case 52010:
              result = CFSTR("PLPhotosErrorComputeCacheRemove");
              break;
            case 52011:
              result = CFSTR("PLPhotosErrorComputeCacheEncryptionNotInitialized");
              break;
            default:
              if (a1 != 53001)
                goto LABEL_230;
              result = CFSTR("PLPhotosErrorAnalysisCoordinatorCancelled");
              break;
          }
          break;
      }
    }
    else
    {
      if (a1 > 73000)
      {
        if (a1 <= 82000)
        {
          if (a1 > 81001)
          {
            if (a1 == 81002)
              return CFSTR("PLPhotosErrorLibraryAssetSuggestionStateInvalid");
            if (a1 == 81003)
              return CFSTR("PLPhotosErrorLibraryScopeDoesNotHaveACurrentUser");
          }
          else
          {
            if (a1 == 73001)
              return CFSTR("PLPhotosErrorPersonMissingKeyFace");
            if (a1 == 81001)
              return CFSTR("PLPhotosErrorLibraryScopeIsOwned");
          }
        }
        else
        {
          if (a1 <= 82002)
          {
            if (a1 == 82001)
              return CFSTR("PLPhotosErrorFeatureAvailabilityServiceNotAvailable");
            else
              return CFSTR("PLPhotosErrorFeatureAvailabilityInternalError");
          }
          switch(a1)
          {
            case 82003:
              return CFSTR("PLPhotosErrorFeatureAvailabilityRequestFailed");
            case 500000:
              return CFSTR("PLPhotosErrorReserved01");
            case 599999:
              return CFSTR("PLPhotosErrorReserved02");
          }
        }
        goto LABEL_230;
      }
      if (a1 <= 71000)
      {
        switch(a1)
        {
          case 61001:
            result = CFSTR("PLPhotosErrorThumbnailFailedDownscale");
            break;
          case 61002:
            result = CFSTR("PLPhotosErrorThumbnailBadParameters");
            break;
          case 61003:
            result = CFSTR("PLPhotosErrorThumbnailFailedEncode");
            break;
          case 61004:
            result = CFSTR("PLPhotosErrorThumbnailGenericError");
            break;
          default:
            if (a1 == 70001)
            {
              result = CFSTR("PLPhotosErrorTransferCopyObjectFailed");
            }
            else
            {
              if (a1 != 70002)
                goto LABEL_230;
              result = CFSTR("PLPhotosErrorTransferFileURLMissing");
            }
            break;
        }
      }
      else
      {
        switch(a1)
        {
          case 72001:
            result = CFSTR("PLPhotosErrorLibraryImportUnknown");
            break;
          case 72002:
            result = CFSTR("PLPhotosErrorLibraryImportInvalid");
            break;
          case 72003:
            result = CFSTR("PLPhotosErrorLibraryImportNeedsMigration");
            break;
          case 72004:
            result = CFSTR("PLPhotosErrorLibraryImportNeedsForceRepair");
            break;
          case 72005:
            result = CFSTR("PLPhotosErrorLibraryImportNeedsTimeMachineRestore");
            break;
          case 72006:
            result = CFSTR("PLPhotosErrorLibraryImportNeedsDisableCPL");
            break;
          case 72007:
            result = CFSTR("PLPhotosErrorLibraryImportNeedsDisabledCPLCleanupCompletion");
            break;
          case 72008:
            result = CFSTR("PLPhotosErrorLibraryImportProcessingError");
            break;
          case 72009:
            result = CFSTR("PLPhotosErrorLibraryImportIsLegacyLibrary");
            break;
          default:
            if (a1 != 71001)
              goto LABEL_230;
            result = CFSTR("PLPhotosErrorManagedObjectConstraitsError");
            break;
        }
      }
    }
  }
  else
  {
    if (a1 <= 46100)
    {
      if (a1 <= 43000)
      {
        v2 = CFSTR("PLAssetsdServiceErrorUnknown");
        switch(a1)
        {
          case 41001:
            return v2;
          case 41002:
            v2 = CFSTR("PLAssetsdServiceErrorXPC");
            return v2;
          case 41003:
            return CFSTR("PLAssetsdServiceErrorInternal");
          case 41004:
            return CFSTR("PLAssetsdServiceErrorNotFound");
          case 41005:
            return CFSTR("PLAssetsdServiceErrorForbidden");
          case 41006:
            return CFSTR("PLAssetsdServiceErrorReadFailure");
          case 41007:
            return CFSTR("PLAssetsdServiceErrorWriteFailure");
          case 41008:
            return CFSTR("PLAssetsdServiceErrorInvalidParameter");
          case 41009:
            return CFSTR("PLAssetsdServiceErrorMissingEntitlement");
          case 41010:
            return CFSTR("PLAssetsdServiceErrorAuthorizationFailed");
          case 41011:
            return CFSTR("PLAssetsdServiceErrorTCCAuthorizationDenied");
          case 41012:
            return CFSTR("PLAssetsdServiceErrorRequiresOpenLibrary");
          case 41013:
            return CFSTR("PLAssetsdServiceErrorRequiresLibraryUpgrade");
          case 41014:
            return CFSTR("PLAssetsdServiceErrorBookmarkResolutionFailed");
          case 41015:
            return CFSTR("PLAssetsdServiceErrorLibraryDirectoryNotFound");
          case 41016:
            goto LABEL_230;
          case 41017:
            return CFSTR("PLAssetsdServiceErrorNoSSBAvailble");
          case 41018:
            return CFSTR("PLAssetsdServiceErrorRelinquishingLibraryBundleToWriter");
          case 41019:
            return CFSTR("PLAssetsdServiceErrorSwitchingSystemPhotoLibrary");
          case 41020:
            return CFSTR("PLAssetsdServiceErrorRebuildRequested");
          case 41021:
            return CFSTR("PLAssetsdServiceErrorShutdownRequested");
          case 41022:
            return CFSTR("PLAssetsdServiceErrorNoCloudPhotoLibraryManager");
          case 41023:
            return CFSTR("PLAssetsdServiceErrorClientNormalClose");
          case 41024:
            return CFSTR("PLAssetsdServiceErrorClientDealloc");
          case 41025:
            return CFSTR("PLAssetsdServiceErrorClientRequestedCloseAndDeleteLibrary");
          case 41026:
            return CFSTR("PLAssetsdServiceErrorLibraryFilesystemDeleteFailed");
          case 41027:
            return CFSTR("PLAssetsdServiceErrorSandboxExtensionConsumeFailed");
          case 41028:
            return CFSTR("PLAssetsdServiceErrorSandboxExtensionCreateFailed");
          case 41029:
            return CFSTR("PLAssetsdServiceErrorClientRequestedCloseLibrary");
          case 41030:
            return CFSTR("PLAssetsdServiceErrorDataVaultRequiresClientSandboxOrEntitlement");
          case 41031:
            return CFSTR("PLAssetsdServiceErrorOperationCancelled");
          case 41032:
            return CFSTR("PLAssetsdServiceErrorUnsupportedDeviceLibraryConfigurationChange");
          case 41033:
            return CFSTR("PLAssetsdServiceErrorRegisteringAppLibrary");
          default:
            if (a1 == 42001)
            {
              result = CFSTR("PLAssetsdServiceErrorImageWriterNoData");
            }
            else
            {
              if (a1 != 42002)
                goto LABEL_230;
              result = CFSTR("PLAssetsdServiceErrorImageWriterJobQueueFull");
            }
            break;
        }
        return result;
      }
      if (a1 > 45700)
      {
        switch(a1)
        {
          case 45998:
            return CFSTR("PLPhotosErrorFeatureDisabledServerSide");
          case 45999:
            return CFSTR("PLPhotosErrorPlatformDisabled");
          case 46000:
            goto LABEL_230;
          case 46001:
            return CFSTR("PLPhotosErrorLibraryUnsupported");
          case 46002:
            return CFSTR("PLPhotosErrorUnknownLibraryState");
          case 46003:
            return CFSTR("PLPhotosErrorPostMigration");
          case 46004:
            return CFSTR("PLPhotosErrorLibraryBookmarkResolutionFailed");
          case 46005:
            return CFSTR("PLPhotosErrorNoPersistentStores");
          case 46006:
            return CFSTR("PLPhotosErrorLibraryTooNew");
          case 46007:
            return CFSTR("PLPhotosErrorLibraryRequiresMigration");
          case 46008:
            return CFSTR("PLPhotosErrorLightweightMigrationFailed");
          case 46009:
            return CFSTR("PLPhotosErrorLibraryCannotOpen");
          case 46010:
            return CFSTR("PLPhotosErrorExclusiveLockFailed");
          case 46011:
            return CFSTR("PLPhotosErrorLibraryTooOld");
          case 46012:
            return CFSTR("PLPhotosErrorLibraryVolumeUnmountRequested");
          case 46013:
            return CFSTR("PLPhotosErrorStagedMigrationFailed");
          case 46014:
            return CFSTR("PLPhotosErrorBackgroundMigrationFailed");
          case 46015:
            return CFSTR("PLPhotosErrorLibraryInTimeMachineBackupLocation");
          case 46016:
            return CFSTR("PLPhotosErrorUserPreventedRebuild");
          case 46017:
            return CFSTR("PLPhotosErrorLibraryInFileProviderSyncRoot");
          case 46018:
            return CFSTR("PLPhotosErrorLibraryCreationFailed");
          case 46019:
            return CFSTR("PLPhotosErrorUnsafeLibraryShutdownRequested");
          case 46020:
            return CFSTR("PLPhotosErrorLibraryClientsUninstalled");
          default:
            if (a1 == 45701)
            {
              result = CFSTR("PLPhotosErrorMissingData");
            }
            else
            {
              if (a1 != 45702)
                goto LABEL_230;
              result = CFSTR("PLPhotosErrorChangeNotSupported");
            }
            break;
        }
        return result;
      }
      if (a1 <= 44000)
      {
        switch(a1)
        {
          case 43001:
            return CFSTR("PLLibraryServiceStateUnknownError");
          case 43002:
            return CFSTR("PLLibraryServiceStateInvalidError");
          case 43003:
            return CFSTR("PLLibraryServiceStateTerminatingError");
        }
      }
      else
      {
        if (a1 <= 45000)
        {
          switch(a1)
          {
            case 44001:
              result = CFSTR("PLAssetsdClientErrorUnknown");
              break;
            case 44002:
              result = CFSTR("PLAssetsdClientErrorInvalidParameter");
              break;
            case 44003:
              result = CFSTR("PLAssetsdClientErrorSandboxExtensionConsumeFailed");
              break;
            case 44004:
              result = CFSTR("PLAssetsdClientErrorSandboxExtensionCreateFailed");
              break;
            default:
              goto LABEL_230;
          }
          return result;
        }
        switch(a1)
        {
          case 45001:
            return CFSTR("PLPhotosDatabaseLoadFailed");
          case 45002:
            return CFSTR("PLPhotosErrorLibraryAccessUserDenied");
          case 45700:
            return CFSTR("PLPhotosErrorNilParameter");
        }
      }
LABEL_230:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown PL error code %td"), a1);
      v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v2;
    }
    switch(a1)
    {
      case 46501:
        result = CFSTR("PLPhotosErrorFailedToOpenLibrary");
        break;
      case 46502:
        result = CFSTR("PLPhotosErrorInvalidState");
        break;
      case 46503:
        result = CFSTR("PLPhotosErrorMigrationPhase");
        break;
      case 46504:
        result = CFSTR("PLPhotosErrorNewerSchema");
        break;
      case 46505:
        result = CFSTR("PLPhotosErrorNoConnectionInterrupted");
        break;
      case 46506:
        result = CFSTR("PLPhotosErrorNoConnectionInvalidated");
        break;
      case 46507:
        result = CFSTR("PLPhotosErrorNoDelegate");
        break;
      case 46508:
        result = CFSTR("PLPhotosErrorNoURLBookmark");
        break;
      case 46509:
        result = CFSTR("PLPhotosErrorObtainPIDLockFail");
        break;
      case 46510:
        result = CFSTR("PLPhotosErrorPreMigrationPhase");
        break;
      case 46511:
        result = CFSTR("PLPhotosErrorResumeFailed");
        break;
      case 46512:
        result = CFSTR("PLPhotosErrorTimeout");
        break;
      case 46513:
        result = CFSTR("PLPhotosErrorValidationIssue");
        break;
      case 46514:
        result = CFSTR("PLPhotosErrorException");
        break;
      case 46515:
        result = CFSTR("PLPhotosErrorDeletionCheck");
        break;
      case 46516:
        result = CFSTR("PLPhotosErrorInsufficientDiskSpace");
        break;
      case 46517:
        result = CFSTR("PLPhotosErrorLegacyUpgradeFailed");
        break;
      case 46518:
        result = CFSTR("PLPhotosErrorMissingDatabaseFiles");
        break;
      case 46519:
        result = CFSTR("PLPhotosErrorMigrationInProgress");
        break;
      case 46520:
        result = CFSTR("PLPhotosErrorMigrationRebuild");
        break;
      case 46521:
        result = CFSTR("PLPhotosErrorMigrationAquireFSReservation");
        break;
      case 46522:
        result = CFSTR("PLPhotosErrorMigrationAquirePIDLock");
        break;
      case 46523:
        result = CFSTR("PLPhotosErrorMigrationPLMUInternal");
        break;
      case 46524:
        result = CFSTR("PLPhotosErrorMigrationLithiumInternal");
        break;
      case 46525:
        result = CFSTR("PLPhotosErrorMigrationUnknownLibraryType");
        break;
      case 46526:
        result = CFSTR("PLPhotosErrorMigrationDatabaseCorrupt");
        break;
      case 46527:
        result = CFSTR("PLPhotosErrorMigrationMissingRebuildData");
        break;
      default:
        switch(a1)
        {
          case 46301:
            result = CFSTR("PLPhotosErrorCoreData");
            break;
          case 46302:
            result = CFSTR("PLPhotosErrorDirectoryCreation");
            break;
          case 46303:
            result = CFSTR("PLPhotosErrorDirectoryMove");
            break;
          case 46304:
            result = CFSTR("PLPhotosErrorFileClone");
            break;
          case 46305:
            result = CFSTR("PLPhotosErrorFileCloneUnsupported");
            break;
          case 46306:
            result = CFSTR("PLPhotosErrorFileMove");
            break;
          case 46307:
            result = CFSTR("PLPhotosErrorModelCreation");
            break;
          case 46308:
            result = CFSTR("PLPhotosErrorModelMigration");
            break;
          case 46309:
            result = CFSTR("PLPhotosErrorUnsupported");
            break;
          case 46310:
            result = CFSTR("PLPhotosErrorLibraryClone");
            break;
          case 46311:
            result = CFSTR("PLPhotosErrorPLMUUpgradeCompleted");
            break;
          case 46312:
            result = CFSTR("PLPhotosErrorMigrationCancelled");
            break;
          case 46313:
            result = CFSTR("PLPhotosErrorUnsupportedLegacyLibrary");
            break;
          default:
            switch(a1)
            {
              case 46101:
                result = CFSTR("PLPhotosErrorDatabaseOpenError");
                break;
              case 46102:
                result = CFSTR("PLPhotosErrorInvalidURL");
                break;
              case 46103:
                result = CFSTR("PLPhotosErrorLibraryInTrash");
                break;
              case 46104:
                result = CFSTR("PLPhotosErrorNoPermission");
                break;
              case 46105:
                result = CFSTR("PLPhotosErrorReadOnlyFilesystem");
                break;
              case 46106:
                result = CFSTR("PLPhotosErrorSandboxNoPermission");
                break;
              case 46107:
                result = CFSTR("PLPhotosErrorUnsupportedFilesystem");
                break;
              case 46108:
                result = CFSTR("PLPhotosErrorSectionData");
                break;
              case 46109:
                result = CFSTR("PLPhotosErrorMismatchURL");
                break;
              case 46110:
                result = CFSTR("PLPhotosErrorExistingIdentifier");
                break;
              case 46111:
                result = CFSTR("PLPhotosErrorIdentifierNotFound");
                break;
              default:
                goto LABEL_230;
            }
            break;
        }
        break;
    }
  }
  return result;
}

BOOL PLIsLowDiskSpaceError(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  int v7;
  int *v8;
  char *v9;
  _BOOL8 v10;
  unint64_t v11;
  statvfs v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  int v17;
  __int16 v18;
  char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2AA0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v2, "length"))
  {
    memset(&v13, 0, sizeof(v13));
    v3 = objc_retainAutorelease(v2);
    if (!statvfs((const char *)objc_msgSend(v3, "fileSystemRepresentation", 0), &v13))
    {
      v11 = v13.f_frsize * v13.f_bavail;
      v10 = v11 < +[PLFileSystemCapabilities minimumAvailableBytesRequiredForLibraryOpen](PLFileSystemCapabilities, "minimumAvailableBytesRequiredForLibraryOpen");
      goto LABEL_8;
    }
    PLBackendGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "lastPathComponent");
      v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v6 = objc_msgSend(v5, "UTF8String");
      v7 = *__error();
      v8 = __error();
      v9 = strerror(*v8);
      *(_DWORD *)buf = 136315650;
      v15 = v6;
      v16 = 1024;
      v17 = v7;
      v18 = 2080;
      v19 = v9;
      _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "failed to stat the filesytem for library: %s. Error (%d) %s", buf, 0x1Cu);

    }
  }
  v10 = 0;
LABEL_8:

  return v10;
}

uint64_t PLPhotosErrorCodeFromUnderlyingError(void *a1, uint64_t a2)
{
  id v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v17;
  int v18;
  uint64_t v19;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v3 = a1;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = a2;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __PLPhotosErrorCodeFromUnderlyingError_block_invoke;
  v20[3] = &unk_1E376BC28;
  v20[4] = &v21;
  v20[5] = &v25;
  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x19AEC3014](v20);
  objc_msgSend(v3, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB28A8]);

  if (v6)
  {
    v7 = objc_msgSend(v3, "code");
    v8 = 46104;
    if (v7 == 257 || v7 == 513)
      goto LABEL_11;
    if (v7 != 640)
      goto LABEL_12;
    goto LABEL_10;
  }
  objc_msgSend(v3, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB2FE0]);

  if (v10)
  {
    v11 = objc_msgSend(v3, "code");
    v8 = 46104;
    if (v11 == 1 || v11 == 13)
      goto LABEL_11;
    if (v11 != 28)
      goto LABEL_12;
    goto LABEL_10;
  }
  objc_msgSend(v3, "domain");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("NSSQLiteErrorDomain"));

  if (!v18)
    goto LABEL_12;
  v19 = objc_msgSend(v3, "code");
  if (v19 == 3)
  {
    v8 = 46104;
    goto LABEL_11;
  }
  if (v19 == 11)
  {
    v8 = 46526;
    goto LABEL_11;
  }
  if (v19 == 13 && PLIsLowDiskSpaceError(v3))
  {
LABEL_10:
    v8 = 46516;
LABEL_11:
    v4[2](v4, v8);
  }
LABEL_12:
  if (!*((_BYTE *)v26 + 24))
  {
    objc_msgSend(v3, "userInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = PLPhotosErrorCodeFromUnderlyingError(v13, a2);
      v22[3] = v14;
    }

  }
  v15 = v22[3];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v15;
}

void sub_199E90C44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t PLUnderlyingErrorHasOSDomain(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t HasOSDomain;
  void *v6;
  char v7;
  void *v8;

  v1 = a1;
  objc_msgSend(v1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB28A8]) & 1) != 0)
    goto LABEL_4;
  objc_msgSend(v1, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
  {

LABEL_4:
    HasOSDomain = 1;
    goto LABEL_5;
  }
  objc_msgSend(v1, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("NSSQLiteErrorDomain"));

  if ((v7 & 1) != 0)
  {
    HasOSDomain = 1;
    goto LABEL_6;
  }
  objc_msgSend(v1, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    HasOSDomain = PLUnderlyingErrorHasOSDomain(v2);
  else
    HasOSDomain = 0;
LABEL_5:

LABEL_6:
  return HasOSDomain;
}

uint64_t PLUnderlyingErrorCodeForDomain(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  v4 = a1;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v3);

  if ((v6 & 1) != 0)
  {
    v7 = objc_msgSend(v4, "code");
  }
  else
  {
    objc_msgSend(v4, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v4 = (id)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v9 = 0;
      goto LABEL_7;
    }
    v7 = PLUnderlyingErrorCodeForDomain(v4, v3);
  }
  v9 = v7;
LABEL_7:

  return v9;
}

uint64_t PLIsErrorFileNotFound(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  v2 = (void *)*MEMORY[0x1E0CB28A8];
  if ((PLIsErrorEqualToCode(v1, (void *)*MEMORY[0x1E0CB28A8], 260) & 1) != 0
    || (PLIsErrorEqualToCode(v1, v2, 4) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v3 = PLIsErrorEqualToCode(v1, (void *)*MEMORY[0x1E0CB2FE0], 2);
  }

  return v3;
}

uint64_t PLIsErrorXPCConnectionInvalid(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v1 = a1;
  v2 = (void *)*MEMORY[0x1E0CB28A8];
  if ((PLIsErrorEqualToCode(v1, (void *)*MEMORY[0x1E0CB28A8], 4099) & 1) != 0)
  {
    v3 = 1;
  }
  else if (PLIsErrorEqualToCode(v1, CFSTR("com.apple.photos.error"), 41002))
  {
    objc_msgSend(v1, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = PLIsErrorEqualToCode(v5, v2, 4099);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t PLIsErrorEqualToSQLiteCode(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = a1;
  if ((PLIsErrorEqualToCode(v3, CFSTR("NSSQLiteErrorDomain"), a2) & 1) != 0
    || (objc_msgSend(v3, "userInfo"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NSSQLiteErrorDomain")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "integerValue"),
        v5,
        v4,
        v6 == a2))
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v3, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      v7 = PLIsErrorEqualToSQLiteCode(v9, a2);
    else
      v7 = 0;

  }
  return v7;
}

uint64_t PLIsErrorSQLiteDiskFull(void *a1)
{
  return PLIsErrorEqualToSQLiteCode(a1, 13);
}

uint64_t PLErrorCreate(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;

  v5 = (objc_class *)MEMORY[0x1E0C99E08];
  v6 = a3;
  v7 = a2;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CB2938]);

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CB3388]);
  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.photos.error"), a1, v8);

  return v9;
}

id PLUnderlyingErrorWithDomain(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;

  v3 = a1;
  v4 = a2;
  v5 = v3;
  v6 = v5;
  if (v5)
  {
    v7 = 0;
    v8 = *MEMORY[0x1E0CB3388];
    v9 = v5;
    while (1)
    {
      objc_msgSend(v9, "domain");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", v4);

      if (v11)
        break;
      objc_msgSend(v9, "userInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = 0;
      if (v13)
      {
        v9 = v13;
        if (v7++ < 9)
          continue;
      }
      goto LABEL_10;
    }
    v14 = v9;
    v13 = v14;
  }
  else
  {
    v14 = 0;
    v13 = 0;
  }
LABEL_10:

  return v14;
}

BOOL PLErrorOrUnderlyingErrorMatchesCodesByDomain(void *a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  PLUnderlyingErrorThatMatchesCodesByDomain(a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

BOOL PLErrorOrUnderlyingErrorHasDomainAndCode(void *a1, void *a2, uint64_t a3)
{
  void *v3;
  _BOOL8 v4;

  PLUnderlyingErrorThatHasDomainAndCode(a1, a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

id PLTopLevelErrorAndAllUnderlyingErrors(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  void *v4;

  v1 = (objc_class *)MEMORY[0x1E0C99E10];
  v2 = a1;
  v3 = objc_alloc_init(v1);
  objc_msgSend(v3, "addObject:", v2);
  PLRecursiveAddUnderlyingErrorsToOrderedSet(v2, v3);

  objc_msgSend(v3, "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void PLRecursiveAddUnderlyingErrorsToOrderedSet(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(a1, "underlyingErrors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((objc_msgSend(v3, "containsObject:", v9) & 1) == 0)
        {
          objc_msgSend(v3, "addObject:", v9);
          PLRecursiveAddUnderlyingErrorsToOrderedSet(v9, v3);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

id PLErrorCodeStringOfTopLevelErrorAndAllUnderlyingErrors(void *a1)
{
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  PLTopLevelErrorAndAllUnderlyingErrors(v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    v7 = 1;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
        if ((v7 & 1) == 0)
          objc_msgSend(v2, "appendFormat:", CFSTR("_"));
        objc_msgSend(v2, "appendFormat:", CFSTR("%ld"), objc_msgSend(v9, "code"));
        v7 = 0;
        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v7 = 0;
    }
    while (v5);
  }

  return v2;
}

BOOL PLIsErrorOrUnderlyingErrorFileExists(void *a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  _BOOL8 v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v1 = *MEMORY[0x1E0CB2FE0];
  v7[0] = *MEMORY[0x1E0CB28A8];
  v7[1] = v1;
  v8[0] = &unk_1E378FFF0;
  v8[1] = &unk_1E3790008;
  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = a1;
  objc_msgSend(v2, "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = PLErrorOrUnderlyingErrorMatchesCodesByDomain(v3, v4);

  return v5;
}

BOOL PLIsErrorOrUnderlyingErrorFileNotFound(void *a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  _BOOL8 v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v1 = *MEMORY[0x1E0CB2FE0];
  v7[0] = *MEMORY[0x1E0CB28A8];
  v7[1] = v1;
  v8[0] = &unk_1E3790020;
  v8[1] = &unk_1E3790038;
  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = a1;
  objc_msgSend(v2, "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = PLErrorOrUnderlyingErrorMatchesCodesByDomain(v3, v4);

  return v5;
}

id PLSanitizedErrorForXPC(void *a1)
{
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (v1)
  {
    v42 = v1;
    v2 = v1;
    objc_msgSend(v2, "userInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *MEMORY[0x1E0CB3388];
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v5 = objc_claimAutoreleasedReturnValue();

    v41 = (void *)v5;
    if (v5)
    {
      PLSanitizedErrorForXPC(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((void *)v5 != v6)
      {
        objc_msgSend(v2, "userInfo");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)objc_msgSend(v7, "mutableCopy");

        objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v4);
        v9 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(v2, "domain");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, objc_msgSend(v2, "code"), v8);
        v11 = objc_claimAutoreleasedReturnValue();

        v2 = (id)v11;
      }

    }
    v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    objc_msgSend(v2, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v50 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          if ((objc_msgSend(v18, "isEqualToString:", v4) & 1) == 0)
          {
            objc_msgSend(v2, "userInfo");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "objectForKeyedSubscript:", v18);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (!_PLErrorUserInfoObjectIsSafeForXPC(v20)
              || objc_msgSend(v20, "conformsToProtocol:", &unk_1EE38FF30)
              && (_PLErrorUserInfoContainerIsSafeForXPC(v20) & 1) == 0)
            {
              objc_msgSend(v12, "addObject:", v18);
            }

          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
      }
      while (v15);
    }

    if (objc_msgSend(v12, "count"))
    {
      v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v2, "domain");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isEqualToString:", *MEMORY[0x1E0CB28A8]);

      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      objc_msgSend(v2, "userInfo");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
      if (v44)
      {
        v25 = *(_QWORD *)v46;
        v43 = *(_QWORD *)v46;
        do
        {
          for (j = 0; j != v44; ++j)
          {
            if (*(_QWORD *)v46 != v25)
              objc_enumerationMutation(v24);
            v27 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * j);
            if (objc_msgSend(v12, "containsObject:", v27))
            {
              if ((_DWORD)v23)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_<stripped>"), v27);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "setObject:forKeyedSubscript:", CFSTR("<stripped>"), v28);
              }
              else
              {
                objc_msgSend(v2, "userInfo");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "objectForKeyedSubscript:", v27);
                v30 = v24;
                v31 = v12;
                v32 = v2;
                v33 = v23;
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "description");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_description"), v27);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "setObject:forKeyedSubscript:", v35, v36);

                v23 = v33;
                v2 = v32;
                v12 = v31;
                v24 = v30;
                v25 = v43;
              }
            }
            else
            {
              objc_msgSend(v2, "userInfo");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "objectForKeyedSubscript:", v27);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "setObject:forKeyedSubscript:", v29, v27);

            }
          }
          v44 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
        }
        while (v44);
      }

      v37 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v2, "domain");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "errorWithDomain:code:userInfo:", v38, objc_msgSend(v2, "code"), v21);
      v39 = objc_claimAutoreleasedReturnValue();

      v2 = (id)v39;
    }

    v1 = v42;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

uint64_t _PLErrorUserInfoObjectIsSafeForXPC(void *a1)
{
  id v1;
  void *v2;
  objc_class *v3;
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  uint64_t v8;

  v1 = a1;
  v2 = v1;
  if (!v1)
    goto LABEL_5;
  if (!objc_msgSend(v1, "conformsToProtocol:", &unk_1EE373E40))
    goto LABEL_4;
  v3 = (objc_class *)MEMORY[0x1E0C99E60];
  v4 = v2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithArray:", &unk_1E3790050);
  v6 = (objc_class *)objc_opt_class();

  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v5, "containsObject:", v7);

  if ((_DWORD)v6)
LABEL_4:
    v8 = 0;
  else
LABEL_5:
    v8 = 1;

  return v8;
}

uint64_t _PLErrorUserInfoContainerIsSafeForXPC(void *a1)
{
  id v1;
  char isKindOfClass;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  int IsSafeForXPC;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (!___PLErrorUserInfoContainerIsSafeForXPC_block_invoke(v8)
          || !_PLErrorUserInfoObjectIsSafeForXPC(v8))
        {
          goto LABEL_16;
        }
        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v3, "objectForKeyedSubscript:", v8, (_QWORD)v13);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if ((___PLErrorUserInfoContainerIsSafeForXPC_block_invoke(v9) & 1) == 0)
          {

LABEL_16:
            v11 = 0;
            goto LABEL_17;
          }
          IsSafeForXPC = _PLErrorUserInfoObjectIsSafeForXPC(v9);

          if (!IsSafeForXPC)
            goto LABEL_16;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v11 = 1;
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v11 = 1;
  }
LABEL_17:

  return v11;
}

double DCIMScaledSizeForFormatCore(uint64_t a1, double a2, double a3)
{
  double v5;
  double v6;

  +[PLAssetFormatsCore sizeForFormat:](PLAssetFormatsCore, "sizeForFormat:", a1);
  return PLScaledSizeWithinSizeCore(a2, a3, v5, v6);
}

double PLScaledSizeWithinSizeCore(double a1, double a2, double a3, double a4)
{
  double v5;
  float v6;
  double result;
  double v8;

  if (a2 == 0.0)
    return *MEMORY[0x1E0C9D820];
  if (a3 >= a4)
    v5 = a3;
  else
    v5 = a4;
  v6 = a1 / a2;
  result = (double)(int)v5;
  v8 = v6;
  if (a1 <= a2)
    return rint(v8 * result);
  return result;
}

double PLScaleDimensionsForThumbnailCore(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (a5 < 1 || a6 <= 0)
    return *MEMORY[0x1E0C9D820];
  if (a5 >= a6)
    v6 = a6;
  else
    v6 = a5;
  if (a5 <= a6)
    v7 = a6;
  else
    v7 = a5;
  if (v7 <= a1)
  {
    v8 = v6;
  }
  else
  {
    v8 = v6 * a1 / v7;
    if (v8 < a2)
    {
      v8 = v6;
      a1 = v7;
      if (v6 > a2)
      {
        v9 = v7 * a2;
        v10 = v6 * a3 / v7;
        if (v10 <= 1)
          v10 = 1;
        v11 = v9 / v6;
        if (v11 > a3)
          v8 = v10;
        else
          v8 = a2;
        if (v11 > a3)
          a1 = a3;
        else
          a1 = v11;
      }
    }
    if (a4 >= 2 && v8 > a2)
      v8 = v8 / a4 * a4;
    if (a4 < 2 || a1 <= a2)
    {
      v7 = a1;
    }
    else
    {
      v12 = a4 - 1;
      if (v8 != a2)
        v12 = 0;
      v7 = (a1 + v12) / a4 * a4;
    }
  }
  if (a5 >= (unint64_t)a6)
    return (double)v7;
  else
    return (double)v8;
}

id stringWithoutTrailingSlashes(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if ((unint64_t)objc_msgSend(v1, "length") >= 2)
  {
    while (objc_msgSend(v1, "hasSuffix:", CFSTR("/")))
    {
      objc_msgSend(v1, "substringToIndex:", objc_msgSend(v1, "length") - 1);
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      v1 = v2;
      if ((unint64_t)objc_msgSend(v2, "length") <= 1)
        return v2;
    }
  }
  v2 = v1;
  return v2;
}

const __CFString *PLStringFromPLPhotoLibrarySubPathType(unsigned int a1)
{
  if (a1 < 0x11)
  {
    if (a1 <= 0xA)
      return off_1E376BD40[a1];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Invalid type %d: %s"), a1, "NSString *PLStringFromPLPhotoLibrarySubPathType(PLPhotoLibrarySubPathType)");
  }
  return CFSTR("PLPhotoLibrarySubPathTypeLast");
}

const __CFString *PLStringFromPLPhotoLibrarySubPathLeafType(unsigned int a1)
{
  if (a1 < 4)
    return off_1E376BD98[a1];
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Invalid type %d: %s"), a1, "NSString *PLStringFromPLPhotoLibrarySubPathLeafType(PLPhotoLibrarySubPathLeafType)");
  return CFSTR("PLPhotoLibrarySubPathLeafTypeLast");
}

const __CFString *PLStringFromPLPhotoLibraryCacheSubPathType(unsigned int a1)
{
  if (a1 < 0x11)
    return off_1E376BDB8[a1];
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Invalid type %d: %s"), a1, "NSString *PLStringFromPLPhotoLibraryCacheSubPathType(PLPhotoLibraryCacheSubPathType)");
  return CFSTR("PLPhotoLibraryCacheSubPathTypeLast");
}

const __CFString *PLStringFromPLPhotoLibraryExternalPathType(unsigned int a1)
{
  if (a1 < 4)
    return off_1E376BE40[a1];
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Invalid type %d: %s"), a1, "NSString *PLStringFromPLPhotoLibraryExternalPathType(PLPhotoLibraryExternalPathType)");
  return CFSTR("PLPhotoLibraryExternalPathTypeLast");
}

const __CFString *PLStringFromPLPhotoLibraryInternalPathType(unsigned int a1)
{
  if (a1 < 6)
    return off_1E376BE60[a1];
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Invalid type %d: %s"), a1, "NSString *PLStringFromPLPhotoLibraryInternalPathType(PLPhotoLibraryInternalPathType)");
  return CFSTR("PLPhotoLibraryInternalPathTypeLast");
}

void sub_199E952D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,void *a44,uint64_t a45,uint64_t a46,uint64_t a47,SEL sel,uint8_t buf)
{

  _Unwind_Resume(a1);
}

void sub_199E95668(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_199E959FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_199E95BE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9300(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9301(uint64_t a1)
{

}

void sub_199E96E94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 64), 8);
  _Unwind_Resume(a1);
}

BOOL PLPositionalTableIsValidIndexForReading(unint64_t a1, uint64_t a2)
{
  if (*(_BYTE *)(a2 + 20))
    return a1 != 0x7FFFFFFFFFFFFFFFLL;
  else
    return *(_QWORD *)(a2 + 40) > a1;
}

BOOL PLPositionalTableIndexIsInRangeOfTable(unint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 40) > a1;
}

uint64_t PLDebugAssert(uint64_t a1, _BYTE *a2, const char *a3, const char *a4, const char *a5, uint64_t a6, int a7)
{
  FILE **v12;

  v12 = (FILE **)MEMORY[0x1E0C80C10];
  if (a2 && *a2)
    fprintf((FILE *)*MEMORY[0x1E0C80C10], "Assertion failed: %s: %s");
  else
    fprintf((FILE *)*MEMORY[0x1E0C80C10], "Check failed: %s:");
  if (a3)
    fprintf(*v12, " %s", a3);
  if (a4)
    fprintf(*v12, " %s", a4);
  if (a5)
  {
    fprintf(*v12, " file: %s", a5);
    if (a6 >= 1)
      fprintf(*v12, ":%ld", a6);
  }
  if (a7)
    fprintf(*v12, " error: %d", a7);
  return fputc(10, *v12);
}

void sub_199E98444(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_199E986A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

char *PLPhotoBakedFormatInfoForFormat(int a1)
{
  char *v1;
  _DWORD *v2;
  uint64_t v3;
  int v4;

  if (a1 == 1095)
    return (char *)&_borderedFormatInfos;
  v2 = &_borderedFormatInfos;
  v3 = 39;
  while (--v3)
  {
    v1 = (char *)(v2 + 44);
    v4 = v2[44];
    v2 += 44;
    if (v4 == a1)
      return v1;
  }
  return 0;
}

BOOL PLPhotoBakedFormatIsDynamicallySized(int a1)
{
  char *v1;
  _DWORD *v2;
  uint64_t v3;
  int v4;

  if (a1 == 1095)
  {
    v1 = (char *)&_borderedFormatInfos;
    return CGRectIsEmpty(*(CGRect *)(v1 + 24));
  }
  else
  {
    v2 = &_borderedFormatInfos;
    v3 = 39;
    while (--v3)
    {
      v1 = (char *)(v2 + 44);
      v4 = v2[44];
      v2 += 44;
      if (v4 == a1)
        return CGRectIsEmpty(*(CGRect *)(v1 + 24));
    }
    return 0;
  }
}

void sub_199E98E9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,void *a30,os_signpost_id_t a31,os_activity_scope_state_s a32,SEL sel)
{
  uint64_t v33;
  uint64_t v34;
  NSObject *v36;
  NSObject *v37;
  const char *Name;

  if (a29)
    os_activity_scope_leave(&a32);
  if (a31)
  {
    PLRequestGetLog();
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (a31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      Name = sel_getName(sel);
      *(_DWORD *)(v34 - 112) = 136446210;
      *(_QWORD *)(v33 + 52) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v37, OS_SIGNPOST_INTERVAL_END, a31, "PLXPC Sync", "%{public}s", (uint8_t *)(v34 - 112), 0xCu);
    }

  }
  _Unwind_Resume(a1);
}

void sub_199E991C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199E995F4(_Unwind_Exception *a1)
{
  uint64_t v1;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  const char *Name;

  if (*(_BYTE *)(v1 - 176))
    os_activity_scope_leave((os_activity_scope_state_t)(v1 - 152));
  if (*(_QWORD *)(v1 - 160))
  {
    PLRequestGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = *(_QWORD *)(v1 - 160);
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
    {
      Name = sel_getName(*(SEL *)(v1 - 136));
      *(_DWORD *)(v1 - 128) = 136446210;
      *(_QWORD *)(v1 - 124) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v4, OS_SIGNPOST_INTERVAL_END, v5, "PLXPC Sync", "%{public}s", (uint8_t *)(v1 - 128), 0xCu);
    }

  }
  _Unwind_Resume(a1);
}

void sub_199E999A8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_199E99D68(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_199E9A1C0(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  const char *Name;

  if (*(_BYTE *)(v2 - 192))
    os_activity_scope_leave((os_activity_scope_state_t)(v2 - 168));
  if (*(_QWORD *)(v2 - 176))
  {
    PLRequestGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = *(_QWORD *)(v2 - 176);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      Name = sel_getName(*(SEL *)(v2 - 152));
      *(_DWORD *)(v2 - 144) = 136446210;
      *(_QWORD *)(v1 + 52) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v5, OS_SIGNPOST_INTERVAL_END, v6, "PLXPC Sync", "%{public}s", (uint8_t *)(v2 - 144), 0xCu);
    }

  }
  _Unwind_Resume(a1);
}

void PLPositionalTableMemoryPool_Destroy(OSQueueHead *__list)
{
  _BYTE *v2;
  void *v3;
  void *v4;

  if (__list)
  {
    while (1)
    {
      v2 = OSAtomicDequeue(__list, 0x18uLL);
      if (!v2)
        break;
      if (!v2[16])
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void PLPositionalTableMemoryPool_Destroy(PLPositionalTableMemoryPool *)");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PLPositionalTableAllocator.m"), 100, CFSTR("Expect only pool nodes to be dequeued."));

      }
    }
    if (__list[3].opaque1)
    {
      MEMORY[0x19AEC3548](*MEMORY[0x1E0C83DA0], __list[2].opaque2);
      __list[2].opaque2 = 0;
      __list[3].opaque1 = 0;
    }
    free(__list[2].opaque1);
    free(__list);
  }
}

void sub_199E9BD94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9795(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9796(uint64_t a1)
{

}

void sub_199E9C508(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9951(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9952(uint64_t a1)
{

}

void sub_199E9D3E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_199E9D7E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,SEL sel)
{

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9991(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9992(uint64_t a1)
{

}

void sub_199E9DCDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,void *a28,os_signpost_id_t a29,os_activity_scope_state_s a30,SEL sel)
{
  uint64_t v31;
  uint64_t v32;
  NSObject *v34;
  NSObject *v35;
  const char *Name;

  if (a27)
    os_activity_scope_leave(&a30);
  if (a29)
  {
    PLRequestGetLog();
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (a29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
    {
      Name = sel_getName(sel);
      *(_DWORD *)(v32 - 144) = 136446210;
      *(_QWORD *)(v31 + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v35, OS_SIGNPOST_INTERVAL_END, a29, "PLXPC Sync", "%{public}s", (uint8_t *)(v32 - 144), 0xCu);
    }

  }
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10030(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10031(uint64_t a1)
{

}

void sub_199E9E7D4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_199E9EB60(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_199E9EF8C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_199E9F478(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,void *a34,os_signpost_id_t a35,os_activity_scope_state_s a36,SEL sel)
{
  uint64_t v37;
  uint64_t v38;
  NSObject *v40;
  NSObject *v41;
  const char *Name;

  if (a33)
    os_activity_scope_leave(&a36);
  if (a35)
  {
    PLRequestGetLog();
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = v40;
    if (a35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
    {
      Name = sel_getName(sel);
      *(_DWORD *)(v38 - 160) = 136446210;
      *(_QWORD *)(v37 + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v41, OS_SIGNPOST_INTERVAL_END, a35, "PLXPC Sync", "%{public}s", (uint8_t *)(v38 - 160), 0xCu);
    }

  }
  _Unwind_Resume(a1);
}

void sub_199E9F984(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,void *a34,os_signpost_id_t a35,os_activity_scope_state_s a36,SEL sel)
{
  uint64_t v37;
  uint64_t v38;
  NSObject *v40;
  NSObject *v41;
  const char *Name;

  if (a33)
    os_activity_scope_leave(&a36);
  if (a35)
  {
    PLRequestGetLog();
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = v40;
    if (a35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
    {
      Name = sel_getName(sel);
      *(_DWORD *)(v38 - 160) = 136446210;
      *(_QWORD *)(v37 + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v41, OS_SIGNPOST_INTERVAL_END, a35, "PLXPC Sync", "%{public}s", (uint8_t *)(v38 - 160), 0xCu);
    }

  }
  _Unwind_Resume(a1);
}

void sub_199E9FE94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,void *a34,os_signpost_id_t a35,os_activity_scope_state_s a36,SEL sel)
{
  uint64_t v37;
  uint64_t v38;
  NSObject *v40;
  NSObject *v41;
  const char *Name;

  if (a33)
    os_activity_scope_leave(&a36);
  if (a35)
  {
    PLRequestGetLog();
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = v40;
    if (a35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
    {
      Name = sel_getName(sel);
      *(_DWORD *)(v38 - 176) = 136446210;
      *(_QWORD *)(v37 + 52) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v41, OS_SIGNPOST_INTERVAL_END, a35, "PLXPC Sync", "%{public}s", (uint8_t *)(v38 - 176), 0xCu);
    }

  }
  _Unwind_Resume(a1);
}

void sub_199EA03F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,void *a36,uint64_t a37,uint64_t a38,uint64_t a39,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199EA078C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,void *a30,uint64_t a31,uint64_t a32,uint64_t a33,SEL sel)
{

  _Unwind_Resume(a1);
}

void sub_199EA0C70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,void *a34,os_signpost_id_t a35,os_activity_scope_state_s a36,SEL sel)
{
  uint64_t v37;
  uint64_t v38;
  NSObject *v40;
  NSObject *v41;
  const char *Name;

  if (a33)
    os_activity_scope_leave(&a36);
  if (a35)
  {
    PLRequestGetLog();
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = v40;
    if (a35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
    {
      Name = sel_getName(sel);
      *(_DWORD *)(v38 - 160) = 136446210;
      *(_QWORD *)(v37 + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v41, OS_SIGNPOST_INTERVAL_END, a35, "PLXPC Sync", "%{public}s", (uint8_t *)(v38 - 160), 0xCu);
    }

  }
  _Unwind_Resume(a1);
}

void sub_199EA1210(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  const char *Name;

  if (*(_BYTE *)(v2 - 224))
    os_activity_scope_leave((os_activity_scope_state_t)(v2 - 200));
  if (*(_QWORD *)(v2 - 208))
  {
    PLRequestGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = *(_QWORD *)(v2 - 208);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      Name = sel_getName(*(SEL *)(v2 - 184));
      *(_DWORD *)(v2 - 176) = 136446210;
      *(_QWORD *)(v1 + 52) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v5, OS_SIGNPOST_INTERVAL_END, v6, "PLXPC Sync", "%{public}s", (uint8_t *)(v2 - 176), 0xCu);
    }

  }
  _Unwind_Resume(a1);
}

void sub_199EA1620(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,void *a30,os_signpost_id_t a31,os_activity_scope_state_s a32,SEL sel)
{
  uint64_t v33;
  uint64_t v34;
  NSObject *v36;
  NSObject *v37;
  const char *Name;

  if (a29)
    os_activity_scope_leave(&a32);
  if (a31)
  {
    PLRequestGetLog();
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (a31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      Name = sel_getName(sel);
      *(_DWORD *)(v34 - 112) = 136446210;
      *(_QWORD *)(v33 + 52) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v37, OS_SIGNPOST_INTERVAL_END, a31, "PLXPC Sync", "%{public}s", (uint8_t *)(v34 - 112), 0xCu);
    }

  }
  _Unwind_Resume(a1);
}

void sub_199EA1B60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,os_signpost_id_t a27,os_activity_scope_state_s a28,SEL sel,__int128 buf)
{
  NSObject *v31;
  NSObject *v32;
  const char *Name;

  if (a25)
    os_activity_scope_leave(&a28);
  if (a27)
  {
    PLRequestGetLog();
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (a27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
    {
      Name = sel_getName(sel);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v32, OS_SIGNPOST_INTERVAL_END, a27, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  _Unwind_Resume(a1);
}

void sub_199EA1F20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,void *a32,os_signpost_id_t a33,os_activity_scope_state_s a34,SEL sel)
{
  uint64_t v35;
  uint64_t v36;
  NSObject *v38;
  NSObject *v39;
  const char *Name;

  if (a31)
    os_activity_scope_leave(&a34);
  if (a33)
  {
    PLRequestGetLog();
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = v38;
    if (a33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
    {
      Name = sel_getName(sel);
      *(_DWORD *)(v36 - 128) = 136446210;
      *(_QWORD *)(v35 + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v39, OS_SIGNPOST_INTERVAL_END, a33, "PLXPC Sync", "%{public}s", (uint8_t *)(v36 - 128), 0xCu);
    }

  }
  _Unwind_Resume(a1);
}

void sub_199EA22E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,void *a22,os_signpost_id_t a23,os_activity_scope_state_s a24,SEL sel)
{
  uint64_t v25;
  uint64_t v26;
  NSObject *v28;
  NSObject *v29;
  const char *Name;

  if (a21)
    os_activity_scope_leave(&a24);
  if (a23)
  {
    PLRequestGetLog();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (a23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      Name = sel_getName(sel);
      *(_DWORD *)(v26 - 112) = 136446210;
      *(_QWORD *)(v25 + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v29, OS_SIGNPOST_INTERVAL_END, a23, "PLXPC Sync", "%{public}s", (uint8_t *)(v26 - 112), 0xCu);
    }

  }
  _Unwind_Resume(a1);
}

void sub_199EA279C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,void *a22,os_signpost_id_t a23,os_activity_scope_state_s a24,SEL sel,uint64_t a26,uint64_t a27,int buf)
{
  uint64_t v28;
  NSObject *v30;
  NSObject *v31;
  const char *Name;

  if (a21)
    os_activity_scope_leave(&a24);
  if (a23)
  {
    PLRequestGetLog();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (a23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
    {
      Name = sel_getName(sel);
      buf = 136446210;
      *(_QWORD *)(v28 + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v31, OS_SIGNPOST_INTERVAL_END, a23, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  _Unwind_Resume(a1);
}

void sub_199EA2AF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, void *a18, os_signpost_id_t a19, os_activity_scope_state_s a20,SEL sel)
{
  uint64_t v21;
  NSObject *v23;
  NSObject *v24;
  const char *Name;

  if (a17)
    os_activity_scope_leave(&a20);
  if (a19)
  {
    PLRequestGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (a19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      Name = sel_getName(sel);
      *(_DWORD *)(v21 - 96) = 136446210;
      *(_QWORD *)(v21 - 92) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v24, OS_SIGNPOST_INTERVAL_END, a19, "PLXPC Sync", "%{public}s", (uint8_t *)(v21 - 96), 0xCu);
    }

  }
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10083(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10084(uint64_t a1)
{

}

id dataWithMappedContentsOfFileDescriptor(int a1)
{
  int64_t st_size;
  void *v3;
  stat v5;

  memset(&v5, 0, sizeof(v5));
  if (fstat(a1, &v5))
    st_size = 0;
  else
    st_size = v5.st_size;
  if (st_size < 1)
    return 0;
  v3 = mmap(0, st_size, 1, 1, a1, 0);
  if (v3 == (void *)-1)
    return 0;
  else
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:deallocator:", v3, st_size, &__block_literal_global_136_10141);
}

uint64_t __dataWithMappedContentsOfFileDescriptor_block_invoke(int a1, void *a2, size_t a3)
{
  return munmap(a2, a3);
}

uint64_t __Block_byref_object_copy__10282(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10283(uint64_t a1)
{

}

uint64_t PLSuppressionContextForMomentShareUUID(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), CFSTR("MomentShareView"), a1);
}

uint64_t DiskSpaceDidBecomeLow(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_diskSpaceDidBecomeLow");
}

void sub_199EA6E68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199EA7A84(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_199EA7E08(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_199EA7EB4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_199EA8040(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_199EA8224(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_199EA839C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_199EA8420(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_199EA84B0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_199EA86F8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1E0D15420]();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80368](data, *(_QWORD *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
}

CFDictionaryRef CFBundleCopyInfoDictionaryForURL(CFURLRef url)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98028](url);
}

CFArrayRef CFBundleCopyLocalizationsForPreferences(CFArrayRef locArray, CFArrayRef prefArray)
{
  return (CFArrayRef)MEMORY[0x1E0C98040](locArray, prefArray);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1E0C980D0](allocator, bundleURL);
}

void *__cdecl CFBundleGetFunctionPointerForName(CFBundleRef bundle, CFStringRef functionName)
{
  return (void *)MEMORY[0x1E0C98108](bundle, functionName);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x1E0C983F0](theData, range.location, range.length, buffer);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x1E0C98460](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateStringWithDate(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFDateRef date)
{
  return (CFStringRef)MEMORY[0x1E0C98490](allocator, formatter, date);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
{
  MEMORY[0x1E0C984C0](formatter, formatString);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x1E0C985E8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988D0]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x1E0C989A8](number);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A78](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98D70](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1E0C98D98](allocator, capacity, callBacks);
}

const void *__cdecl CFSetGetValue(CFSetRef theSet, const void *value)
{
  return (const void *)MEMORY[0x1E0C98DC0](theSet, value);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const char *buffer)
{
  return (CFStringRef)MEMORY[0x1E0C99008](alloc, buffer);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x1E0C990C0](theString, range.location, range.length, buffer);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1E0C990C8](theString);
}

CFIndex CFURLGetBytes(CFURLRef url, UInt8 *buffer, CFIndex bufferLength)
{
  return MEMORY[0x1E0C99488](url, buffer, bufferLength);
}

CFUUIDRef CFUUIDCreateFromString(CFAllocatorRef alloc, CFStringRef uuidStr)
{
  return (CFUUIDRef)MEMORY[0x1E0C99520](alloc, uuidStr);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1;
  uint64_t v2;
  CFUUIDBytes result;

  v1 = MEMORY[0x1E0C99568](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1E0C995A8](allocator, flags, error, dictionary, timeout);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x1E0C995E8](userNotification, responseFlags, timeout);
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
  MEMORY[0x1E0C99600](stream);
}

CFTypeRef CFWriteStreamCopyProperty(CFWriteStreamRef stream, CFStreamPropertyKey propertyName)
{
  return (CFTypeRef)MEMORY[0x1E0C99610](stream, propertyName);
}

CFWriteStreamRef CFWriteStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFWriteStreamRef)MEMORY[0x1E0C99630](alloc, fileURL);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x1E0C99650](stream);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1E0C9BB20](context);
}

size_t CGBitmapContextGetBytesPerRow(CGContextRef context)
{
  return MEMORY[0x1E0C9BB60](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x1E0C9BB70](context);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDE8]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE50](name);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
  MEMORY[0x1E0C9C050](c, transform);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x1E0C9C170](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C220](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x1E0C9C340](c);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x1E0C9C370](c);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x1E0C9C388](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x1E0C9C390](c, sx, sy);
}

uint64_t CGContextSetBaseCTM()
{
  return MEMORY[0x1E0C9C3C0]();
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C408](c, color);
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
  MEMORY[0x1E0C9C458](c, *(_QWORD *)&quality);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x1E0C9C588](c, tx, ty);
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9C600](info, data, size, releaseData);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
  MEMORY[0x1E0C9C638](provider);
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1E0C9CB80](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(_QWORD *)&bitmapInfo, provider);
}

CGImageRef CGImageCreateCopyWithColorSpace(CGImageRef image, CGColorSpaceRef space)
{
  return (CGImageRef)MEMORY[0x1E0C9CB98](image, space);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x1E0C9CBA8](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x1E0CBC308](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC338](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1E0CBC358](idst);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1E0C9CC60](image);
}

CFStringRef CGImageGetUTType(CGImageRef image)
{
  return (CFStringRef)MEMORY[0x1E0C9CCC8](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1E0C9CCD0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1E0CBC530](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1E0CBC568](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC590](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC5C0](url, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x1E0CBC5F0](isrc);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x1E0CBC618](isrc);
}

uint64_t CGImageWriteEXIFJPEGWithMetadata()
{
  return MEMORY[0x1E0CBC670]();
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D5F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1E0C9D608]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectStandardize(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D638]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return MEMORY[0x1E0C9E300]((__n128)coord, *(__n128 *)&coord.longitude);
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  double v2;
  double v3;
  CLLocationCoordinate2D result;

  MEMORY[0x1E0C9E308](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

uint64_t CPCopyBundleIdentifierAndTeamFromAuditToken()
{
  return MEMORY[0x1E0CFA238]();
}

uint64_t CPFileBuildDirectoriesToPath()
{
  return MEMORY[0x1E0CFA280]();
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x1E0CFA6C0]();
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1E0CA8AC0](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B20](pixelBuffer);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x1E0CA8B30](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B38](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B50](pixelBuffer);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
  MEMORY[0x1E0CA8BF0](texture);
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x1E0CA8BF8](texture);
}

uint64_t FigCreateIOSurfaceBackedCVPixelBuffer()
{
  return MEMORY[0x1E0CEC8C8]();
}

uint64_t FigCreateIOSurfaceBackedCVPixelBufferWithAttributes()
{
  return MEMORY[0x1E0CEC8D0]();
}

IOReturn IOPMAssertionCreateWithDescription(CFStringRef AssertionType, CFStringRef Name, CFStringRef Details, CFStringRef HumanReadableReason, CFStringRef LocalizationBundlePath, CFTimeInterval Timeout, CFStringRef TimeoutAction, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x1E0CBB700](AssertionType, Name, Details, HumanReadableReason, LocalizationBundlePath, TimeoutAction, AssertionID, Timeout);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x1E0CBB738](*(_QWORD *)&AssertionID);
}

xpc_object_t IOSurfaceCreateXPCObject(IOSurfaceRef aSurface)
{
  return (xpc_object_t)MEMORY[0x1E0CBBB10](aSurface);
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBB38](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x1E0CBBB40](buffer);
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBC28](buffer);
}

CFTypeID IOSurfaceGetTypeID(void)
{
  return MEMORY[0x1E0CBBCC8]();
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBCE0](buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1E0CBBD28](buffer, *(_QWORD *)&options, seed);
}

IOSurfaceRef IOSurfaceLookupFromXPCObject(xpc_object_t xobj)
{
  return (IOSurfaceRef)MEMORY[0x1E0CBBD48](xobj);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1E0CBBE88](buffer, *(_QWORD *)&options, seed);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetFloat32Answer()
{
  return MEMORY[0x1E0DE2B58]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

uint64_t MGIsDeviceOneOfType()
{
  return MEMORY[0x1E0DE2B90]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB2C00]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1E0CB3220](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

void *__cdecl OSAtomicDequeue(OSQueueHead *__list, size_t a2)
{
  return (void *)MEMORY[0x1E0C80658](__list, a2);
}

void OSAtomicEnqueue(OSQueueHead *__list, void *__new, size_t a3)
{
  MEMORY[0x1E0C80660](__list, __new, a3);
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1E0D82C28]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1E0D82C58]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1E0D82CB0]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1E0D82CE0]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1E0D82CF0]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1E0D82D10]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1E0D82D28]();
}

uint64_t PFAbstractMethodException()
{
  return MEMORY[0x1E0D71098]();
}

uint64_t PFFigCopyImageDataWithProperties()
{
  return MEMORY[0x1E0D75430]();
}

uint64_t PFFigCreateCGImageFromImageData()
{
  return MEMORY[0x1E0D75440]();
}

uint64_t PFFigCreateCVPixelBufferFromImageData()
{
  return MEMORY[0x1E0D75448]();
}

uint64_t PFFigJPEGDataFromImage()
{
  return MEMORY[0x1E0D75468]();
}

uint64_t PFMethodNotImplementedException()
{
  return MEMORY[0x1E0D710D0]();
}

uint64_t PFOSVariantHasInternalDiagnostics()
{
  return MEMORY[0x1E0D710D8]();
}

uint64_t PFOSVariantHasInternalUI()
{
  return MEMORY[0x1E0D710E0]();
}

uint64_t PFObjc_implementsClassMethod()
{
  return MEMORY[0x1E0D710F0]();
}

uint64_t PFProcessIsLaunchedToExecuteTests()
{
  return MEMORY[0x1E0D71108]();
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x1E0CD65E0](task, error);
}

CFDictionaryRef SecTaskCopyValuesForEntitlements(SecTaskRef task, CFArrayRef entitlements, CFErrorRef *error)
{
  return (CFDictionaryRef)MEMORY[0x1E0CD6600](task, entitlements, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1E0CD6610](allocator);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1E0CD6620](allocator, token);
}

uint64_t TCCAccessRestricted()
{
  return MEMORY[0x1E0DB1048]();
}

uint64_t VTImageRotationSessionCreate()
{
  return MEMORY[0x1E0CECB88]();
}

uint64_t VTImageRotationSessionTransferImage()
{
  return MEMORY[0x1E0CECBA8]();
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x1E0CECD18](allocator, pixelTransferSessionOut);
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x1E0CECD38](session, sourceBuffer, destinationBuffer);
}

OSStatus VTSessionSetProperty(VTSessionRef session, CFStringRef propertyKey, CFTypeRef propertyValue)
{
  return MEMORY[0x1E0CECD80](session, propertyKey, propertyValue);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1E0C9A0D0]();
}

uint64_t _CFURLAttachSecurityScopeToFileURL()
{
  return MEMORY[0x1E0C9A5B0]();
}

uint64_t _CFURLCopySecurityScopeFromFileURL()
{
  return MEMORY[0x1E0C9A678]();
}

uint64_t _CFXPCCreateCFObjectFromXPCMessage()
{
  return MEMORY[0x1E0C9A7F0]();
}

uint64_t _CFXPCCreateXPCMessageWithCFObject()
{
  return MEMORY[0x1E0C9A808]();
}

uint64_t _PFAssertContinueHandler()
{
  return MEMORY[0x1E0D71158]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t __strcat_chk()
{
  return MEMORY[0x1E0C80C30]();
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x1E0C80C40]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C80C48]();
}

uint64_t __strncpy_chk()
{
  return MEMORY[0x1E0C80C58]();
}

uint64_t _objc_registerTaggedPointerClass()
{
  return MEMORY[0x1E0DE79C8]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1E0C80FC0](dso, description, activity, *(_QWORD *)&flags);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t _xpc_runtime_is_app_sandboxed()
{
  return MEMORY[0x1E0C812A0]();
}

uint64_t abort_with_reason()
{
  return MEMORY[0x1E0C813C0]();
}

int atoi(const char *a1)
{
  return MEMORY[0x1E0C81668](a1);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int chflags(const char *a1, __uint32_t a2)
{
  return MEMORY[0x1E0C82630](a1, *(_QWORD *)&a2);
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x1E0DE7A50](cls, name, imp, types);
}

int clonefile(const char *a1, const char *a2, uint32_t a3)
{
  return MEMORY[0x1E0C82678](a1, a2, *(_QWORD *)&a3);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1E0C82698](a1);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C28](queue, block);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C48](queue, block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C60](flags, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C68](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82C98](block, timeout);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1E0C82D08](key);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D10](group, queue, block);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E20](attr);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
  MEMORY[0x1E0C82E80](queue, key, context, destructor);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

uint64_t dispatch_set_qos_class()
{
  return MEMORY[0x1E0C82EF0]();
}

uint64_t dispatch_set_qos_class_fallback()
{
  return MEMORY[0x1E0C82EF8]();
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x1E0C82F08](object, queue);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

float exp2f(float a1)
{
  float result;

  MEMORY[0x1E0C83290](a1);
  return result;
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

ssize_t fgetxattr(int fd, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C833A8](*(_QWORD *)&fd, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

ssize_t flistxattr(int fd, char *namebuff, size_t size, int options)
{
  return MEMORY[0x1E0C833F8](*(_QWORD *)&fd, namebuff, size, *(_QWORD *)&options);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1E0C83488](*(_QWORD *)&a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fremovexattr(int fd, const char *name, int options)
{
  return MEMORY[0x1E0C834E0](*(_QWORD *)&fd, name, *(_QWORD *)&options);
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1E0C83528](a1, a2, a3, *(_QWORD *)&a4);
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C83548](*(_QWORD *)&fd, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

int fsync(int a1)
{
  return MEMORY[0x1E0C83578](*(_QWORD *)&a1);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1E0C83590](*(_QWORD *)&a1, a2);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1E0C83610](a1, a2, a3, a4, *(_QWORD *)&a5);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1E0C83668]();
}

int gethostname(char *a1, size_t a2)
{
  return MEMORY[0x1E0C836B8](a1, a2);
}

int gethostuuid(uuid_t a1, const timespec *a2)
{
  return MEMORY[0x1E0C836C0](a1, a2);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x1E0C83790](a1);
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
}

IMP imp_implementationWithBlock(id block)
{
  return (IMP)MEMORY[0x1E0DE7B10](block);
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BC0](__x);
  return result;
}

long double log2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BE8](__x);
  return result;
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C83C40](a1, a2);
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1E0C83C80](*(_QWORD *)&error_value);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

char *__cdecl mkdtemp(char *a1)
{
  return (char *)MEMORY[0x1E0C84170](a1);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1E0DE7FF8](a1);
}

const char *__cdecl object_getClassName(id a1)
{
  return (const char *)MEMORY[0x1E0DE8000](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1E0C844C0](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84510](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84518](state);
}

uint64_t os_eligibility_get_domain_answer()
{
  return MEMORY[0x1E0C84678]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84990](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

uint64_t pc_session_add_metric()
{
  return MEMORY[0x1E0DE8148]();
}

uint64_t pc_session_begin()
{
  return MEMORY[0x1E0DE8160]();
}

uint64_t pc_session_create()
{
  return MEMORY[0x1E0DE8168]();
}

uint64_t pc_session_destroy()
{
  return MEMORY[0x1E0DE8180]();
}

uint64_t pc_session_end()
{
  return MEMORY[0x1E0DE8190]();
}

uint64_t pc_session_get_value()
{
  return MEMORY[0x1E0DE81A0]();
}

uint64_t pc_session_set_procpid()
{
  return MEMORY[0x1E0DE81B8]();
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1E0C84BC8](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C20](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x1E0C84C40](*(_QWORD *)&pid, *(_QWORD *)&flavor, arg, buffer, *(_QWORD *)&buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C50](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

int pthread_threadid_np(pthread_t a1, __uint64_t *a2)
{
  return MEMORY[0x1E0C84F38](a1, a2);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1E0C84F68](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

qos_class_t qos_class_main(void)
{
  return MEMORY[0x1E0C84F78]();
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1E0C84F80]();
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1E0C85008](a1);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1E0C85040](a1, a2);
}

int renamex_np(const char *a1, const char *a2, unsigned int a3)
{
  return MEMORY[0x1E0C85118](a1, a2, *(_QWORD *)&a3);
}

int rmdir(const char *a1)
{
  return MEMORY[0x1E0C85138](a1);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1E0C85178]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1E0C851A0]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1E0C851A8]();
}

uint64_t sandbox_extension_issue_file_to_process()
{
  return MEMORY[0x1E0C851B0]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1E0C851F8]();
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1E0DE80C8](sel);
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C853A0](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1E0C85438](*(_QWORD *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85460](a1, a2);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8650](a1);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8698](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1E0DE8788](a1);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return (const char *)MEMORY[0x1E0DE8790](*(_QWORD *)&a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1E0DE8798](a1, sql, callback, a4, errmsg);
}

int sqlite3_file_control(sqlite3 *a1, const char *zDbName, int op, void *a4)
{
  return MEMORY[0x1E0DE87C0](a1, zDbName, *(_QWORD *)&op, a4);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE87C8](pStmt);
}

void sqlite3_free(void *a1)
{
  MEMORY[0x1E0DE87D0](a1);
}

char *sqlite3_mprintf(const char *a1, ...)
{
  return (char *)MEMORY[0x1E0DE8848](a1);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1E0DE8870](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1E0DE8880](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE89A8](a1);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1E0C854E0](a1, a2);
}

int statvfs(const char *a1, statvfs *a2)
{
  return MEMORY[0x1E0C854E8](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C85570](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1E0C855C0](__s1, __n);
}

size_t strspn(const char *__s, const char *__charset)
{
  return MEMORY[0x1E0C85608](__s, __charset);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x1E0C857D0](*(_QWORD *)&a1, a2);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1E0C85838](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

uint64_t tcc_authorization_check_audit_token()
{
  return MEMORY[0x1E0DB11F8]();
}

uint64_t tcc_authorization_preflight()
{
  return MEMORY[0x1E0DB1200]();
}

uint64_t tcc_authorization_request()
{
  return MEMORY[0x1E0DB1238]();
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1E0C859E0](*(_QWORD *)&a1);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x1E0C85A08](uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
  MEMORY[0x1E0C85A10](dst, src);
}

void uuid_generate(uuid_t out)
{
  MEMORY[0x1E0C85A18](out);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x1E0C85A38](in, uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x1E0C85A40](uu, out);
}

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x1E0C85A50](uu, out);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x1E0C85A80](*(_QWORD *)&target_task, address, size, *(_QWORD *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1E0C85A98](*(_QWORD *)&target_task, address, size);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1E0C85D90](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
  MEMORY[0x1E0C85D98](identifier, criteria, handler);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1E0C85DF8](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C85E00](objects, count);
}

void xpc_array_set_data(xpc_object_t xarray, size_t index, const void *bytes, size_t length)
{
  MEMORY[0x1E0C85EA8](xarray, index, bytes, length);
}

void xpc_array_set_uint64(xpc_object_t xarray, size_t index, uint64_t value)
{
  MEMORY[0x1E0C85ED8](xarray, index, value);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1E0C85F00](xBOOL);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x1E0C85FD0]();
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1E0C86108](object);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x1E0C86120]();
}

xpc_object_t xpc_data_create_with_dispatch_data(dispatch_data_t ddata)
{
  return (xpc_object_t)MEMORY[0x1E0C86188](ddata);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1E0C86198](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1E0C861A8](xdata);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862A0](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x1E0C86330](xdict, key, bytes, length);
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
  MEMORY[0x1E0C86348](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  double result;

  MEMORY[0x1E0C863E0](xdouble);
  return result;
}

int xpc_fd_dup(xpc_object_t xfd)
{
  return MEMORY[0x1E0C864B0](xfd);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

xpc_object_t xpc_shmem_create(void *region, size_t length)
{
  return (xpc_object_t)MEMORY[0x1E0C866F0](region, length);
}

size_t xpc_shmem_map(xpc_object_t xshmem, void **region)
{
  return MEMORY[0x1E0C86700](xshmem, region);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1E0C86758](xstring);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1E0C867B8](xuint);
}

