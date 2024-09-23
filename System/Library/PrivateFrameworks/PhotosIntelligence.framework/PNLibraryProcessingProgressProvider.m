@implementation PNLibraryProcessingProgressProvider

+ (void)requestProcessingProgressForLibrary:(id)a3 result:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  _AnalysisProgressQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __82__PNLibraryProcessingProgressProvider_requestProcessingProgressForLibrary_result___block_invoke;
  v10[3] = &unk_2514803C0;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, v10);

}

+ ($DF4FB41D2F0E3F59E20087ACD782DC9D)faceProcessingProgressForLibrary:(SEL)a3
{
  id v5;
  NSObject *v6;
  id v7;
  os_signpost_id_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint32_t denom;
  uint32_t numer;
  id v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  os_signpost_id_t v20;
  NSObject *v21;
  uint64_t v22;
  int64_t v23;
  int64_t v24;
  double v25;
  uint64_t v26;
  mach_timebase_info v27;
  id v28;
  NSObject *v29;
  void *v30;
  $DF4FB41D2F0E3F59E20087ACD782DC9D *result;
  mach_timebase_info v32;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  double v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  retstr->var4 = 0.0;
  v6 = MEMORY[0x24BDACB70];
  v7 = MEMORY[0x24BDACB70];
  v8 = os_signpost_id_generate(v6);
  info = 0;
  mach_timebase_info(&info);
  v9 = v6;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x24BDACB70]))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_SIGNPOST_INTERVAL_BEGIN, v8, "AllowedForAnalysisReport", ", buf, 2u);
  }
  v10 = (void *)MEMORY[0x24BDACB70];

  v11 = mach_absolute_time();
  v12 = objc_msgSend(v5, "fetchCountOfAssetsWithAllowedForAnalysis");
  retstr->var0 = v12;
  v13 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v16 = v10;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x24BDACB70]))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_SIGNPOST_INTERVAL_END, v8, "AllowedForAnalysisReport", ", buf, 2u);
  }
  v17 = MEMORY[0x24BDACB70];

  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v35 = "AllowedForAnalysisReport";
    v36 = 2048;
    v37 = (float)((float)((float)((float)(v13 - v11) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  v18 = MEMORY[0x24BDACB70];
  v19 = MEMORY[0x24BDACB70];
  v20 = os_signpost_id_generate(v18);
  v32 = 0;
  mach_timebase_info(&v32);
  v21 = v18;
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x24BDACB70]))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_SIGNPOST_INTERVAL_BEGIN, v20, "FaceAnalysisReport", ", buf, 2u);
  }

  v22 = mach_absolute_time();
  v23 = objc_msgSend(v5, "fetchCountOfAssetsWithFacesProcessedToLatestVersion");
  retstr->var1 = v23;
  if (v12)
  {
    retstr->var3 = (double)(unint64_t)v23 * 100.0 / (double)(unint64_t)v12;
    v24 = objc_msgSend(v5, "fetchCountOfAssetsWithFacesProcessedToAnyVersion");
    v25 = (double)(unint64_t)v24 * 100.0 / (double)(unint64_t)v12;
  }
  else
  {
    retstr->var3 = 0.0;
    v24 = objc_msgSend(v5, "fetchCountOfAssetsWithFacesProcessedToAnyVersion");
    v25 = 0.0;
  }
  retstr->var2 = v24;
  retstr->var4 = v25;
  v26 = mach_absolute_time();
  v27 = v32;
  v28 = MEMORY[0x24BDACB70];
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x24BDACB70]))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_SIGNPOST_INTERVAL_END, v20, "FaceAnalysisReport", ", buf, 2u);
  }
  v29 = MEMORY[0x24BDACB70];

  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v35 = "FaceAnalysisReport";
    v36 = 2048;
    v37 = (float)((float)((float)((float)(v26 - v22) * (float)v27.numer) / (float)v27.denom) / 1000000.0);
    _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  v30 = (void *)MEMORY[0x24BDACB70];

  return result;
}

+ (void)requestHighlightEnrichmentProgressForLibrary:(id)a3 result:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  _AnalysisProgressQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __91__PNLibraryProcessingProgressProvider_requestHighlightEnrichmentProgressForLibrary_result___block_invoke;
  v10[3] = &unk_2514803C0;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, v10);

}

+ (void)requestSyndicationProgressForLibrary:(id)a3 result:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  _AnalysisProgressQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __83__PNLibraryProcessingProgressProvider_requestSyndicationProgressForLibrary_result___block_invoke;
  v10[3] = &unk_2514803C0;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, v10);

}

void __83__PNLibraryProcessingProgressProvider_requestSyndicationProgressForLibrary_result___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  os_signpost_id_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  uint32_t denom;
  uint32_t numer;
  id v24;
  NSObject *v25;
  void (*v26)(void);
  os_signpost_id_t spid;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  mach_timebase_info info;
  _BYTE buf[24];
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _BYTE v50[128];
  _QWORD v51[5];

  v51[3] = *MEMORY[0x24BDAC8D0];
  v2 = MEMORY[0x24BDACB70];
  v3 = MEMORY[0x24BDACB70];
  v4 = os_signpost_id_generate(v2);
  info = 0;
  mach_timebase_info(&info);
  v5 = v2;
  v30 = v4 - 1;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x24BDACB70]))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_SIGNPOST_INTERVAL_BEGIN, v4, "SyndicationReport", ", buf, 2u);
  }
  spid = v4;

  v28 = mach_absolute_time();
  v32 = a1;
  objc_msgSend(*(id *)(a1 + 32), "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BDE3720];
  v51[0] = *MEMORY[0x24BDE3750];
  v51[1] = v7;
  v51[2] = *MEMORY[0x24BDE36F8];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFetchPropertySets:", v8);

  +[PNAssetCurationUtilities internalPredicateToIncludeOnlyReceivedSyndicatedAssets](PNAssetCurationUtilities, "internalPredicateToIncludeOnlyReceivedSyndicatedAssets");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInternalPredicate:", v9);

  objc_msgSend(v6, "setIncludeGuestAssets:", 1);
  objc_msgSend(v6, "setWantsIncrementalChangeDetails:", 0);
  v31 = v6;
  objc_msgSend(MEMORY[0x24BDE3488], "fetchAssetsWithOptions:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v10, "count");
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
  if (v12)
  {
    v13 = v12;
    v35 = 0;
    v36 = 0;
    v33 = 0;
    v34 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v38 != v19)
          objc_enumerationMutation(v11);
        switch(objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "syndicationEligibility", spid))
        {
          case -6:
            ++v36;
            break;
          case -5:
            ++v35;
            break;
          case -4:
            ++v34;
            break;
          case -3:
            ++v33;
            break;
          case -2:
            ++v14;
            break;
          case -1:
            ++v15;
            break;
          case 0:
            ++v16;
            break;
          case 1:
            ++v17;
            break;
          case 2:
            ++v18;
            break;
          default:
            continue;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
    }
    while (v13);
  }
  else
  {
    v35 = 0;
    v36 = 0;
    v33 = 0;
    v34 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
  }

  v21 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v24 = MEMORY[0x24BDACB70];
  if (v30 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x24BDACB70]))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_SIGNPOST_INTERVAL_END, spid, "SyndicationReport", ", buf, 2u);
  }
  v25 = MEMORY[0x24BDACB70];

  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "SyndicationReport";
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = (float)((float)((float)((float)(v21 - v28) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  v26 = *(void (**)(void))(*(_QWORD *)(v32 + 40) + 16);
  *(_QWORD *)buf = v29;
  *(_QWORD *)&buf[8] = v36;
  *(_QWORD *)&buf[16] = v35;
  v43 = v34;
  v44 = v33;
  v45 = v14;
  v46 = v15;
  v47 = v16;
  v48 = v17;
  v49 = v18;
  v26();

}

void __91__PNLibraryProcessingProgressProvider_requestHighlightEnrichmentProgressForLibrary_result___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  os_signpost_id_t v4;
  NSObject *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  double v18;
  double v19;
  uint64_t v20;
  uint32_t denom;
  uint32_t numer;
  id v23;
  NSObject *v24;
  void (*v25)(void);
  os_signpost_id_t spid;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  mach_timebase_info info;
  _BYTE buf[24];
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  double v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v2 = MEMORY[0x24BDACB70];
  v3 = MEMORY[0x24BDACB70];
  v4 = os_signpost_id_generate(v2);
  info = 0;
  mach_timebase_info(&info);
  v5 = v2;
  v6 = v4 - 1;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x24BDACB70]))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_SIGNPOST_INTERVAL_BEGIN, v4, "HighlightEnrichmentReport", ", buf, 2u);
  }
  spid = v4;

  v28 = mach_absolute_time();
  objc_msgSend(*(id *)(a1 + 32), "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("category"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v8);

  objc_msgSend(v7, "setWantsIncrementalChangeDetails:", 0);
  v29 = v7;
  objc_msgSend(MEMORY[0x24BDE3498], "fetchAssetCollectionsWithType:subtype:options:", 6, 1000000301, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  if (v10)
  {
    v27 = a1;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    do
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      switch(objc_msgSend(v17, "enrichmentState"))
      {
        case 0u:
          ++v12;
          break;
        case 1u:
          ++v13;
          break;
        case 2u:
          ++v14;
          break;
        case 3u:
          ++v15;
          break;
        case 4u:
          ++v16;
          break;
        default:
          break;
      }

      ++v11;
    }
    while (v10 != v11);
    v18 = (double)v16 * 100.0 / (double)v10;
    v19 = (double)(v15 + v16 + v14 + v13) * 100.0 / (double)v10;
    a1 = v27;
  }
  else
  {
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v18 = 0.0;
    v19 = 0.0;
  }
  v20 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v23 = MEMORY[0x24BDACB70];
  if (v6 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(MEMORY[0x24BDACB70]))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_SIGNPOST_INTERVAL_END, spid, "HighlightEnrichmentReport", ", buf, 2u);
  }
  v24 = MEMORY[0x24BDACB70];

  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "HighlightEnrichmentReport";
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = (float)((float)((float)((float)(v20 - v28) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  v25 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  *(_QWORD *)buf = v10;
  *(_QWORD *)&buf[8] = v16;
  *(_QWORD *)&buf[16] = v15;
  v32 = v14;
  v33 = v13;
  v34 = v12;
  v35 = v18;
  v36 = v19;
  v25();

}

void __82__PNLibraryProcessingProgressProvider_requestProcessingProgressForLibrary_result___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  os_signpost_id_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint32_t denom;
  uint32_t numer;
  id v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  NSObject *v17;
  uint64_t v18;
  unint64_t v19;
  double v20;
  uint64_t v21;
  uint32_t v22;
  uint32_t v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  os_signpost_id_t v27;
  NSObject *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  double v32;
  uint64_t v33;
  uint32_t v34;
  uint32_t v35;
  id v36;
  NSObject *v37;
  NSObject *v38;
  os_signpost_id_t v39;
  NSObject *v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  double v44;
  uint64_t v45;
  uint32_t v46;
  uint32_t v47;
  id v48;
  NSObject *v49;
  NSObject *v50;
  os_signpost_id_t v51;
  NSObject *v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  double v56;
  uint64_t v57;
  uint32_t v58;
  uint32_t v59;
  id v60;
  NSObject *v61;
  void (*v62)(void);
  void *v63;
  unint64_t v64;
  mach_timebase_info v65;
  mach_timebase_info v66;
  mach_timebase_info v67;
  mach_timebase_info v68;
  mach_timebase_info info;
  _BYTE buf[24];
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  double v74;
  double v75;
  double v76;
  double v77;
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  v2 = MEMORY[0x24BDACB70];
  v3 = MEMORY[0x24BDACB70];
  v4 = os_signpost_id_generate(v2);
  info = 0;
  mach_timebase_info(&info);
  v5 = v2;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x24BDACB70]))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_SIGNPOST_INTERVAL_BEGIN, v4, "AllowedForAnalysisReport", ", buf, 2u);
  }
  v6 = (void *)MEMORY[0x24BDACB70];

  v7 = mach_absolute_time();
  v8 = objc_msgSend(*(id *)(a1 + 32), "fetchCountOfAssetsWithAllowedForAnalysis");
  v9 = objc_msgSend(*(id *)(a1 + 32), "fetchCountOfVideosWithAllowedForAnalysis");
  v10 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v13 = v6;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x24BDACB70]))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_SIGNPOST_INTERVAL_END, v4, "AllowedForAnalysisReport", ", buf, 2u);
  }
  v14 = MEMORY[0x24BDACB70];

  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "AllowedForAnalysisReport";
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = (float)((float)((float)((float)(v10 - v7) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  v15 = v14;
  v16 = os_signpost_id_generate(v14);
  v68 = 0;
  mach_timebase_info(&v68);
  v17 = v14;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x24BDACB70]))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_SIGNPOST_INTERVAL_BEGIN, v16, "SceneAnalysisReport", ", buf, 2u);
  }

  v18 = mach_absolute_time();
  v19 = objc_msgSend(*(id *)(a1 + 32), "fetchCountOfAssetsWithScenesProcessed");
  v64 = v19;
  if (v8)
    v20 = (double)v19 * 100.0 / (double)v8;
  else
    v20 = 0.0;
  v21 = mach_absolute_time();
  v23 = v68.numer;
  v22 = v68.denom;
  v24 = MEMORY[0x24BDACB70];
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x24BDACB70]))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_SIGNPOST_INTERVAL_END, v16, "SceneAnalysisReport", ", buf, 2u);
  }
  v25 = MEMORY[0x24BDACB70];

  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "SceneAnalysisReport";
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = (float)((float)((float)((float)(v21 - v18) * (float)v23) / (float)v22) / 1000000.0);
    _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  v26 = v25;
  v27 = os_signpost_id_generate(v25);
  v67 = 0;
  mach_timebase_info(&v67);
  v28 = v25;
  if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x24BDACB70]))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_SIGNPOST_INTERVAL_BEGIN, v27, "FaceAnalysisReport", ", buf, 2u);
  }

  v29 = mach_absolute_time();
  v30 = objc_msgSend(*(id *)(a1 + 32), "fetchCountOfAssetsWithFacesProcessedToLatestVersion");
  v31 = v30;
  if (v8)
    v32 = (double)v30 * 100.0 / (double)v8;
  else
    v32 = 0.0;
  v33 = mach_absolute_time();
  v35 = v67.numer;
  v34 = v67.denom;
  v36 = MEMORY[0x24BDACB70];
  if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x24BDACB70]))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_SIGNPOST_INTERVAL_END, v27, "FaceAnalysisReport", ", buf, 2u);
  }
  v37 = MEMORY[0x24BDACB70];

  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "FaceAnalysisReport";
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = (float)((float)((float)((float)(v33 - v29) * (float)v35) / (float)v34) / 1000000.0);
    _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  v38 = v37;
  v39 = os_signpost_id_generate(v37);
  v66 = 0;
  mach_timebase_info(&v66);
  v40 = v37;
  if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x24BDACB70]))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_SIGNPOST_INTERVAL_BEGIN, v39, "MediaAnalysisImageReport", ", buf, 2u);
  }

  v41 = mach_absolute_time();
  v42 = objc_msgSend(*(id *)(a1 + 32), "fetchCountOfAssetsWithMediaAnalysisImageProcessed");
  v43 = v42;
  if (v8)
    v44 = (double)v42 * 100.0 / (double)v8;
  else
    v44 = 0.0;
  v45 = mach_absolute_time();
  v47 = v66.numer;
  v46 = v66.denom;
  v48 = MEMORY[0x24BDACB70];
  if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x24BDACB70]))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_SIGNPOST_INTERVAL_END, v39, "MediaAnalysisImageReport", ", buf, 2u);
  }
  v49 = MEMORY[0x24BDACB70];

  if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "MediaAnalysisImageReport";
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = (float)((float)((float)((float)(v45 - v41) * (float)v47) / (float)v46) / 1000000.0);
    _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  v50 = v49;
  v51 = os_signpost_id_generate(v49);
  v65 = 0;
  mach_timebase_info(&v65);
  v52 = v49;
  if (v51 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x24BDACB70]))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_SIGNPOST_INTERVAL_BEGIN, v51, "MediaAnalysisVideoReport", ", buf, 2u);
  }

  v53 = mach_absolute_time();
  v54 = objc_msgSend(*(id *)(a1 + 32), "fetchCountOfAssetsWithMediaAnalysisVideoProcessed");
  v55 = v54;
  if (v9)
    v56 = (double)v54 * 100.0 / (double)v9;
  else
    v56 = 0.0;
  v57 = mach_absolute_time();
  v59 = v65.numer;
  v58 = v65.denom;
  v60 = MEMORY[0x24BDACB70];
  if (v51 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x24BDACB70]))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_SIGNPOST_INTERVAL_END, v51, "MediaAnalysisVideoReport", ", buf, 2u);
  }
  v61 = MEMORY[0x24BDACB70];

  if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "MediaAnalysisVideoReport";
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = (float)((float)((float)((float)(v57 - v53) * (float)v59) / (float)v58) / 1000000.0);
    _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  v62 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  *(_QWORD *)buf = v8;
  *(_QWORD *)&buf[8] = v9;
  *(_QWORD *)&buf[16] = v64;
  v71 = v31;
  v72 = v43;
  v73 = v55;
  v74 = v20;
  v75 = v32;
  v76 = v44;
  v77 = v56;
  v62();
  v63 = (void *)MEMORY[0x24BDACB70];

}

@end
