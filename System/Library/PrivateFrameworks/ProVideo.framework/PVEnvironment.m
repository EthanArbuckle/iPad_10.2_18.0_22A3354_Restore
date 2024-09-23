@implementation PVEnvironment

+ (void)Initialize
{
  if (+[PVEnvironment Initialize]::once != -1)
    dispatch_once(&+[PVEnvironment Initialize]::once, &__block_literal_global_4);
}

void __27__PVEnvironment_Initialize__block_invoke()
{
  char *v0;
  char *v1;
  char *v2;
  char *v3;
  int v4;
  void *v5;
  char *v6;
  int v7;
  void *v8;
  char *v9;
  int v10;
  void *v11;
  char *v12;
  int v13;
  char *v14;
  int v15;
  char *v16;
  int v17;
  char *v18;
  int v19;
  char *v20;
  int v21;
  char *v22;
  int v23;
  char *v24;
  BOOL v25;
  char *v26;
  void *v27;
  int v28;
  char *v29;
  char *v30;
  char *v31;
  char *v32;
  char *v33;
  char *v34;
  char *v35;
  char *v36;
  void *v37;
  unint64_t v38;
  char *v39;
  char *v40;
  char *v41;
  char *v42;
  char *v43;
  char *v44;
  char *v45;
  char *v46;
  char *v47;
  char *v48;
  char *v49;
  char *v50;
  id v51;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v51 = (id)objc_claimAutoreleasedReturnValue();
  v0 = getenv("PV_DISABLE_PROXY_RENDERING");
  if (v0 && atoi(v0))
    s_disableProxyRendering = 1;
  v1 = getenv("PV_DISABLE_TIMELINE_SCROLLING");
  if (v1 && atoi(v1))
    s_disableTimelineScrolling = 1;
  v2 = getenv("PV_DISABLE_YCBCR_INPUTS");
  if (v2 && atoi(v2))
    s_disableYCbCrInputs = 1;
  v3 = getenv("PV_PERFORMANCE_LOG_LEVEL");
  if (v3)
  {
    v4 = atoi(v3);
  }
  else
  {
    objc_msgSend(v51, "objectForKey:", CFSTR("PV_PERFORMANCE_LOG_LEVEL"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      goto LABEL_15;
    v4 = objc_msgSend(v51, "integerForKey:", CFSTR("PV_PERFORMANCE_LOG_LEVEL"));
  }
  PVPerfStats::_logLevel = v4;
LABEL_15:
  v6 = getenv("PV_PERFORMANCE_LOG_FORMAT");
  if (v6)
  {
    v7 = atoi(v6);
  }
  else
  {
    objc_msgSend(v51, "objectForKey:", CFSTR("PV_PERFORMANCE_LOG_FORMAT"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_20;
    v7 = objc_msgSend(v51, "integerForKey:", CFSTR("PV_PERFORMANCE_LOG_FORMAT"));
  }
  PVPerfStats::_logFormat = v7;
LABEL_20:
  v9 = getenv("PV_PERFORMANCE_LOG_OUTPUT");
  if (v9)
  {
    v10 = atoi(v9);
  }
  else
  {
    objc_msgSend(v51, "objectForKey:", CFSTR("PV_PERFORMANCE_LOG_OUTPUT"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      goto LABEL_25;
    v10 = objc_msgSend(v51, "integerForKey:", CFSTR("PV_PERFORMANCE_LOG_OUTPUT"));
  }
  PVPerfStats::_logOutput = v10;
LABEL_25:
  v12 = getenv("PV_TEXTURE_BORDER_WIDTH");
  if (v12)
  {
    v13 = atoi(v12);
    s_textureBorderWidth = v13 & ~(v13 >> 31);
  }
  v14 = getenv("PV_TEXTURE_POOL_SIZE_MB");
  if (v14)
    v15 = atoi(v14);
  else
    v15 = (int)((double)((unint64_t)+[PVDeviceCharacteristics actualMemory](PVDeviceCharacteristics, "actualMemory") >> 20)* 0.2);
  s_texturePoolSizeMB = v15;
  v16 = getenv("PV_TEXTURE_POOL_FINISH_SIZE_RATIO");
  if (v16)
  {
    *(float *)&v17 = atof(v16);
    s_texturePoolFinishSizeRatio = v17;
  }
  v18 = getenv("PV_TEXTURE_CLUSTER_PADDING_REMEMBRANCE");
  if (v18)
    v19 = atoi(v18);
  else
    v19 = 20;
  s_textureClusterPaddingRemembrance = v19;
  v20 = getenv("PV_TEXTURE_CLUSTER_PADDING_CUSHIONING");
  if (v20)
    v21 = atoi(v20);
  else
    v21 = 32;
  s_textureClusterPaddingCushioning = v21;
  v22 = getenv("PV_TEXTURE_CLUSTER_PADDING_CLUMPING");
  if (v22)
    v23 = atoi(v22);
  else
    v23 = 64;
  s_textureClusterPaddingClumping = v23;
  v24 = getenv("PV_ENABLE_CHECK_PASSTHRUS");
  if (v24)
    v25 = atoi(v24) != 0;
  else
    v25 = 0;
  s_enableCheckPassthrus = v25;
  v26 = getenv("PV_MULTI_SOURCE_PLAYBACK_FPS");
  if (v26 && atoi(v26))
    s_enableMultiSourcePlaybackFPS = 1;
  objc_msgSend(v51, "objectForKey:", CFSTR("PV_MULTI_SOURCE_PLAYBACK_FPS"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = objc_msgSend(v51, "BOOLForKey:", CFSTR("PV_MULTI_SOURCE_PLAYBACK_FPS"));

    if (v28)
      s_enableMultiSourcePlaybackFPS = 1;
  }
  v29 = getenv("PV_NUM_RENDER_PASSES");
  if (v29)
    s_numRenderPasses = atoi(v29);
  v30 = getenv("PV_RENDER_PASS_TEST_TYPE");
  if (v30)
    s_renderPassTestType = atoi(v30);
  v31 = getenv("PV_ENABLE_420V_OUTPUT");
  if (v31 && atoi(v31))
    s_enable420vOutput = 1;
  v32 = getenv("PV_ENABLE_BGRA_OUTPUT_EXPORT");
  if (v32 && atoi(v32))
    s_enableBGRAOutputExport = 1;
  v33 = getenv("PV_ENABLE_AVF_COLOR_CONFORM_INPUTS");
  if (v33 && atoi(v33))
    s_enableAVFColorConformInputs = 1;
  v34 = getenv("PV_APPLY_AVF_RENDER_TRANSFORM_TO_OUTPUT");
  if (v34 && atoi(v34))
    s_applyAVFRenderTransformToOutput = 1;
  v35 = getenv("PV_RENDER_THREAD_PRIORITY");
  if (v35)
    s_renderThreadPriority = atoi(v35);
  v36 = getenv("PV_SERIALIZE_EXPORT_REQUESTS");
  if (v36 && atoi(v36)
    || +[PVDeviceCharacteristics isLowMemDevice](PVDeviceCharacteristics, "isLowMemDevice"))
  {
    s_serializeExportRequests = 1;
  }
  objc_msgSend(v51, "objectForKey:", CFSTR("PVExportPrefilterValue"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    v38 = objc_msgSend(v51, "integerForKey:", CFSTR("PVExportPrefilterValue"));
    if (v38 < 5)
      s_exportPrefilterValue = dword_1B304F1B0[v38];
  }
  v39 = getenv("PV_THROTTLE_AVF_EXPORT_REQUEST_HANDLING_MS");
  if (v39)
    s_throttleAVFExportRequestReturnMS = atoi(v39);
  v40 = getenv("PV_THROTTLE_EXPORT_ON_MEM_WARNING");
  if (v40 && !atoi(v40))
    s_throttleExportOnMemWarning = 1;
  v41 = getenv("PV_DEBUG_COLOR_OUT_OF_RANGE_EFFECTS");
  if (v41 && atoi(v41))
    s_debugColorOutOfRangeEffects = 1;
  v42 = getenv("PV_DEBUG_COLOR_NO_SOURCE_TRACK_NODE");
  if (v42 && atoi(v42))
    s_debugColorNoSourceTrackNode = 1;
  v43 = getenv("PV_ENABLE_ENV_LOGS");
  if (v43 && atoi(v43))
    s_enableEnvLogs = 1;
  v44 = getenv("PV_MAX_EXPECTED_LIVE_COMPOSITORS");
  if (v44)
    s_maxExpectedLiveCompositors = atoi(v44);
  v45 = getenv("PV_HIGHLIGHT_OUT_OF_GAMUT");
  if (v45 && atoi(v45))
    s_highlightOutOfGamut = 1;
  v46 = getenv("PV_CLAMP_XR_INPUTS_TO_FILTERS");
  if (v46 && !atoi(v46))
    s_clampInputsToFilters = 1;
  v47 = getenv("PV_HG_POOL_OBSERVER_INTERVAL");
  if (v47)
    s_hgPoolObserverInterval = atoi(v47);
  v48 = getenv("PV_METAL_COMMAND_Q_COMMAND_BUFFER_COUNT_MIN");
  if (v48)
    s_metalCommandQCommandBufferCountMin = atoi(v48);
  v49 = getenv("PV_METAL_COMMAND_Q_COMMAND_BUFFER_COUNT_MAX");
  if (v49)
    s_metalCommandQCommandBufferCountMax = atoi(v49);
  v50 = getenv("PV_METAL_COMMAND_Q_MEM_USAGE");
  if (v50)
    s_metalCommandQMemUsage = atoi(v50);

}

+ (BOOL)PV_DISABLE_PROXY_RENDERING
{
  objc_msgSend((id)objc_opt_class(), "Initialize");
  return s_disableProxyRendering;
}

+ (BOOL)PV_DISABLE_TIMELINE_SCROLLING
{
  objc_msgSend((id)objc_opt_class(), "Initialize");
  return s_disableTimelineScrolling;
}

+ (BOOL)PV_DISABLE_YCBCR_INPUTS
{
  objc_msgSend((id)objc_opt_class(), "Initialize");
  return s_disableYCbCrInputs;
}

+ (int)PV_PERFORMANCE_LOG_LEVEL
{
  objc_msgSend((id)objc_opt_class(), "Initialize");
  return PVPerfStats::_logLevel;
}

+ (int)PV_PERFORMANCE_LOG_FORMAT
{
  objc_msgSend((id)objc_opt_class(), "Initialize");
  return PVPerfStats::_logFormat;
}

+ (int)PV_PERFORMANCE_LOG_OUTPUT
{
  objc_msgSend((id)objc_opt_class(), "Initialize");
  return PVPerfStats::_logOutput;
}

+ (int)PV_TEXTURE_BORDER_WIDTH
{
  objc_msgSend((id)objc_opt_class(), "Initialize");
  return s_textureBorderWidth;
}

+ (int)PV_TEXTURE_POOL_SIZE_MB
{
  objc_msgSend((id)objc_opt_class(), "Initialize");
  return s_texturePoolSizeMB;
}

+ (float)PV_TEXTURE_POOL_FINISH_SIZE_RATIO
{
  objc_msgSend((id)objc_opt_class(), "Initialize");
  return *(float *)&s_texturePoolFinishSizeRatio;
}

+ (unsigned)PV_TEXTURE_CLUSTER_PADDING_REMEMBRANCE
{
  objc_msgSend((id)objc_opt_class(), "Initialize");
  return s_textureClusterPaddingRemembrance;
}

+ (unsigned)PV_TEXTURE_CLUSTER_PADDING_CUSHIONING
{
  objc_msgSend((id)objc_opt_class(), "Initialize");
  return s_textureClusterPaddingCushioning;
}

+ (unsigned)PV_TEXTURE_CLUSTER_PADDING_CLUMPING
{
  objc_msgSend((id)objc_opt_class(), "Initialize");
  return s_textureClusterPaddingClumping;
}

+ (BOOL)PV_ENABLE_CHECK_PASSTHRUS
{
  objc_msgSend((id)objc_opt_class(), "Initialize");
  return s_enableCheckPassthrus;
}

+ (BOOL)PV_MULTI_SOURCE_PLAYBACK_FPS
{
  objc_msgSend((id)objc_opt_class(), "Initialize");
  return s_enableMultiSourcePlaybackFPS;
}

+ (int)PV_NUM_RENDER_PASSES
{
  objc_msgSend((id)objc_opt_class(), "Initialize");
  return s_numRenderPasses;
}

+ (int)PV_RENDER_PASS_TEST_TYPE
{
  objc_msgSend((id)objc_opt_class(), "Initialize");
  return s_renderPassTestType;
}

+ (BOOL)PV_ENABLE_420V_OUTPUT
{
  objc_msgSend((id)objc_opt_class(), "Initialize");
  return s_enable420vOutput;
}

+ (BOOL)PV_ENABLE_BGRA_OUTPUT_EXPORT
{
  objc_msgSend((id)objc_opt_class(), "Initialize");
  return s_enableBGRAOutputExport;
}

+ (BOOL)PV_ENABLE_AVF_COLOR_CONFORM_INPUTS
{
  objc_msgSend((id)objc_opt_class(), "Initialize");
  return s_enableAVFColorConformInputs;
}

+ (BOOL)PV_APPLY_AVF_RENDER_TRANSFORM_TO_OUTPUT
{
  objc_msgSend((id)objc_opt_class(), "Initialize");
  return s_applyAVFRenderTransformToOutput;
}

+ (int)PV_RENDER_THREAD_PRIORITY
{
  objc_msgSend((id)objc_opt_class(), "Initialize");
  return s_renderThreadPriority;
}

+ (BOOL)PV_SERIALIZE_EXPORT_REQUESTS
{
  objc_msgSend((id)objc_opt_class(), "Initialize");
  return s_serializeExportRequests;
}

+ (unsigned)PV_THROTTLE_AVF_EXPORT_REQUEST_HANDLING_MS
{
  objc_msgSend((id)objc_opt_class(), "Initialize");
  return s_throttleAVFExportRequestReturnMS;
}

+ (BOOL)PV_THROTTLE_EXPORT_ON_MEM_WARNING
{
  objc_msgSend((id)objc_opt_class(), "Initialize");
  return (s_throttleExportOnMemWarning & 1) == 0;
}

+ (BOOL)PV_DEBUG_COLOR_OUT_OF_RANGE_EFFECTS
{
  objc_msgSend((id)objc_opt_class(), "Initialize");
  return s_debugColorOutOfRangeEffects;
}

+ (BOOL)PV_DEBUG_COLOR_NO_SOURCE_TRACK_NODE
{
  objc_msgSend((id)objc_opt_class(), "Initialize");
  return s_debugColorNoSourceTrackNode;
}

+ (BOOL)PV_ENABLE_ENV_LOGS
{
  objc_msgSend((id)objc_opt_class(), "Initialize");
  return s_enableEnvLogs;
}

+ (unsigned)PV_MAX_EXPECTED_LIVE_COMPOSITORS
{
  objc_msgSend((id)objc_opt_class(), "Initialize");
  return s_maxExpectedLiveCompositors;
}

+ (BOOL)PV_HIGHLIGHT_OUT_OF_GAMUT
{
  objc_msgSend((id)objc_opt_class(), "Initialize");
  return s_highlightOutOfGamut;
}

+ (BOOL)PV_CLAMP_XR_INPUTS_TO_FILTERS
{
  objc_msgSend((id)objc_opt_class(), "Initialize");
  return (s_clampInputsToFilters & 1) == 0;
}

+ (unsigned)PV_HG_POOL_OBSERVER_INTERVAL
{
  objc_msgSend((id)objc_opt_class(), "Initialize");
  return s_hgPoolObserverInterval;
}

+ (unsigned)PV_METAL_COMMAND_Q_COMMAND_BUFFER_COUNT_MIN
{
  objc_msgSend((id)objc_opt_class(), "Initialize");
  return s_metalCommandQCommandBufferCountMin;
}

+ (unsigned)PV_METAL_COMMAND_Q_COMMAND_BUFFER_COUNT_MAX
{
  objc_msgSend((id)objc_opt_class(), "Initialize");
  return s_metalCommandQCommandBufferCountMax;
}

+ (unsigned)PV_METAL_COMMAND_Q_MEM_USAGE
{
  objc_msgSend((id)objc_opt_class(), "Initialize");
  return s_metalCommandQMemUsage;
}

+ (float)PVExportPrefilterValue
{
  objc_msgSend((id)objc_opt_class(), "Initialize");
  return *(float *)&s_exportPrefilterValue;
}

+ (BOOL)PVHighlightHDRRegions
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("PVHighlightHDRRegions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "intValue") != 0;
  else
    v5 = 0;

  return v5;
}

+ (unsigned)PVPageSize
{
  objc_msgSend((id)objc_opt_class(), "Initialize");
  return 2048;
}

+ (unsigned)PVPageSizeBackgrounded
{
  objc_msgSend((id)objc_opt_class(), "Initialize");
  return 1024;
}

+ (unsigned)PVPageSizeLowMemExport
{
  objc_msgSend((id)objc_opt_class(), "Initialize");
  return 512;
}

+ (id)versionInfo
{
  _QWORD v3[11];

  qmemcpy(v3, "@(#)PROG@(#)PROG@(#)PROG@(#)PROG@(#)PROG@(#)PROG@(#)PROG@(#)PROG@(#)PROG@(#)PROG@(#)PROG", sizeof(v3));
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n"), 0x3FF0000000000000, v3[0], v3[1], v3[2], v3[3], v3[4], v3[5], v3[6], v3[7], v3[8], v3[9], v3[10]);
}

@end
