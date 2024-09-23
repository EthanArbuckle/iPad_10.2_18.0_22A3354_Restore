@implementation PIPipelineFilters

+ (id)autoCropFilter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D52260]), "initWithBlock:", &__block_literal_global_20921);
}

+ (id)exifOrientationAndCropStraightenOnly
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D52260]), "initWithBlock:", &__block_literal_global_2);
}

+ (id)rawFaceBalanceFilter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D52260]), "initWithBlock:", &__block_literal_global_7);
}

+ (id)rawSourceFilterIncludingOrientation
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D52260]), "initWithBlock:", &__block_literal_global_26_20896);
}

+ (id)sourceFilterNoOrientation
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D52260]), "initWithBlock:", &__block_literal_global_38);
}

+ (id)sushiLevel1Filter
{
  return (id)objc_msgSend(MEMORY[0x1E0D52260], "stopAtTagFilter:", CFSTR("/RAW/SushiLevel1"));
}

+ (id)noRedEyeFilter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D52260]), "initWithBlock:", &__block_literal_global_48);
}

+ (id)noTrimFilter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D52260]), "initWithBlock:", &__block_literal_global_53_20857);
}

+ (id)noMuteFilter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D52260]), "initWithBlock:", &__block_literal_global_70);
}

+ (id)noCropFilter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D52260]), "initWithBlock:", &__block_literal_global_77_20848);
}

+ (id)iosCropToolFilter
{
  if (iosCropToolFilter_onceToken != -1)
    dispatch_once(&iosCropToolFilter_onceToken, &__block_literal_global_81_20844);
  return (id)iosCropToolFilter_filter;
}

+ (id)stripAllTimeAdjustmentsFilter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D52260]), "initWithBlock:", &__block_literal_global_87);
}

+ (id)noGeometryFilter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D52260]), "initWithBlock:", &__block_literal_global_94);
}

+ (id)noOrientationFilter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D52260]), "initWithBlock:", &__block_literal_global_97);
}

+ (id)orientationAsMetaDataFilter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D52260]), "initWithBlock:", &__block_literal_global_100_20835);
}

+ (id)perspectiveStraightenWithoutCropFilter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D52260]), "initWithBlock:", &__block_literal_global_105_20832);
}

+ (id)preGeometryFilter
{
  return (id)objc_msgSend(MEMORY[0x1E0D52260], "stopAtTagFilter:", CFSTR("/pre-Geometry"));
}

+ (id)postGeometryFilter
{
  return (id)objc_msgSend(MEMORY[0x1E0D52260], "stopAtTagFilter:", CFSTR("/post-Geometry"));
}

+ (id)inputToCropFilter
{
  return (id)objc_msgSend(MEMORY[0x1E0D52260], "stopAtTagFilter:", CFSTR("/perspectiveStraighten"));
}

+ (id)histogramOptimizationFilter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D52260]), "initWithBlock:", &__block_literal_global_108);
}

+ (id)stopAtTagIncludeGeometryFilter:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0D52260]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__PIPipelineFilters_stopAtTagIncludeGeometryFilter___block_invoke;
  v8[3] = &unk_1E5019C50;
  v9 = v3;
  v5 = v3;
  v6 = (void *)objc_msgSend(v4, "initWithBlock:", v8);

  return v6;
}

+ (id)stopAtTagIncludeOrientationFilter:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0D52260]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__PIPipelineFilters_stopAtTagIncludeOrientationFilter___block_invoke;
  v8[3] = &unk_1E5019C50;
  v9 = v3;
  v5 = v3;
  v6 = (void *)objc_msgSend(v4, "initWithBlock:", v8);

  return v6;
}

+ (id)applyOrientationFilter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D52260]), "initWithBlock:", &__block_literal_global_113);
}

+ (id)autoloopStabilizedVideoFilter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D52260]), "initWithBlock:", &__block_literal_global_114);
}

+ (id)sourceFilter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D52260]), "initWithBlock:", &__block_literal_global_119_20805);
}

+ (id)oneShotPortraitV2ExportFilter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D52260]), "initWithBlock:", &__block_literal_global_123_20789);
}

id __50__PIPipelineFilters_oneShotPortraitV2ExportFilter__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, _QWORD *a5)
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  PIPortraitEffectNode *v18;
  void *v19;
  void *v20;
  PIPortraitEffectNode *v21;
  id v23;

  v8 = a2;
  v9 = a4;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("portraitEffect"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    goto LABEL_9;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("enabled"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "BOOLValue") & 1) == 0)
  {

    goto LABEL_9;
  }
  v13 = objc_msgSend(v8, "versionForPortraitEffect:", v11);

  if (v13 <= 1)
  {
LABEL_9:
    v14 = v9;
    goto LABEL_10;
  }
  v23 = 0;
  objc_msgSend(v8, "inputForPath:error:", CFSTR("/PortraitV2"), &v23);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v15 = v23;
  if (v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v14, "settings");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v16, "mutableCopy");

      objc_msgSend(v17, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("disablePortraitMixing"));
      v18 = [PIPortraitEffectNode alloc];
      objc_msgSend(v14, "input");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "blurMap");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[PIPortraitEffectNode initWithInput:blurMap:settings:](v18, "initWithInput:blurMap:settings:", v19, v20, v17);

      if (objc_msgSend(v8, "resetTag:input:error:", CFSTR("/PortraitV2"), v21, a5))
        v14 = v9;
      else
        v14 = 0;

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "mismatchError:object:", CFSTR("Unexpected PortraitEffect node"), v14);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      v14 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 3, CFSTR("Missing PortraitV2 tag"), 0, v15);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_10:
  return v14;
}

id __33__PIPipelineFilters_sourceFilter__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v7;
  void *v8;
  void *v9;

  v7 = a2;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("source"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "renderNodeFromSource:settings:error:", v8, &unk_1E505CE00, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __50__PIPipelineFilters_autoloopStabilizedVideoFilter__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v7;
  id v8;
  void *v9;

  v7 = a4;
  v8 = a2;
  objc_msgSend(v8, "getTagWithPath:error:", CFSTR("/AutoLoop/StabilizedVideo"), a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resetTag:input:", CFSTR("/AutoLoop/Output"), v9);

  return v7;
}

id __43__PIPipelineFilters_applyOrientationFilter__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v6 = a2;
  v7 = a4;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("orientation"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = v7;
  if (v8)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("value"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "integerValue");

    objc_msgSend(v6, "orientedNode:withOrientation:", v7, v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

id __55__PIPipelineFilters_stopAtTagIncludeOrientationFilter___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7;
  void *v8;
  void *v9;

  v7 = a2;
  objc_msgSend(v7, "getTagWithPath:error:", *(_QWORD *)(a1 + 32), a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v7, "resetTag:input:", CFSTR("/pre-Orientation"), v8);
  objc_msgSend(v7, "getTagWithPath:error:", CFSTR("/Orientation"), a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __52__PIPipelineFilters_stopAtTagIncludeGeometryFilter___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7;
  void *v8;
  void *v9;

  v7 = a2;
  objc_msgSend(v7, "getTagWithPath:error:", *(_QWORD *)(a1 + 32), a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v7, "resetTag:input:", CFSTR("/pre-Geometry"), v8);
  objc_msgSend(v7, "getTagWithPath:error:", CFSTR("/post-Geometry"), a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __48__PIPipelineFilters_histogramOptimizationFilter__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v7;
  id v8;
  void *v9;

  v7 = a2;
  v8 = a4;
  objc_msgSend(v7, "getTagWithPath:error:", CFSTR("pre-PortraitVideo"), a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v7, "resetTag:input:", CFSTR("/post-PortraitVideo"), v9);

  return v8;
}

id __59__PIPipelineFilters_perspectiveStraightenWithoutCropFilter__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v7;
  id v8;
  void *v9;

  v7 = a2;
  v8 = a4;
  objc_msgSend(v7, "getTagWithPath:error:", CFSTR("/perspectiveStraighten"), a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v7, "resetTag:input:", CFSTR("/Crop"), v9);

  return v8;
}

id __48__PIPipelineFilters_orientationAsMetaDataFilter__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a2;
  v7 = a4;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("orientation"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = v7;
  if (v8)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("value"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "integerValue");

    objc_msgSend(v6, "orientedNode:withOrientation:", v7, NUOrientationInverse());
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

id __40__PIPipelineFilters_noOrientationFilter__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v7;
  id v8;
  void *v9;

  v7 = a4;
  v8 = a2;
  objc_msgSend(v8, "getTagWithPath:error:", CFSTR("/pre-Orientation"), a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resetTag:input:", CFSTR("/Orientation"), v9);

  return v7;
}

id __37__PIPipelineFilters_noGeometryFilter__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v7;
  id v8;
  void *v9;

  v7 = a4;
  v8 = a2;
  objc_msgSend(v8, "getTagWithPath:error:", CFSTR("/pre-Geometry"), a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resetTag:input:", CFSTR("/post-Geometry"), v9);

  return v7;
}

id __50__PIPipelineFilters_stripAllTimeAdjustmentsFilter__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a4;
  v8 = a2;
  objc_msgSend(v8, "getTagWithPath:error:", CFSTR("/pre-Trim"), a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resetTag:input:", CFSTR("Trim"), v9);
  objc_msgSend(v8, "getTagWithPath:error:", CFSTR("pre-SloMo"), a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "resetTag:input:", CFSTR("SloMo"), v10);
  return v7;
}

void __38__PIPipelineFilters_iosCropToolFilter__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0D52260]), "initWithBlock:", &__block_literal_global_82_20845);
  v1 = (void *)iosCropToolFilter_filter;
  iosCropToolFilter_filter = v0;

}

id __38__PIPipelineFilters_iosCropToolFilter__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v7;
  id v8;
  void *v9;

  v7 = a4;
  v8 = a2;
  objc_msgSend(v8, "getTagWithPath:error:", CFSTR("/pre-Geometry"), a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resetTag:input:", CFSTR("/post-Adjustments"), v9);

  return v7;
}

id __33__PIPipelineFilters_noCropFilter__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v7;
  id v8;
  void *v9;

  v7 = a4;
  v8 = a2;
  objc_msgSend(v8, "getTagWithPath:error:", CFSTR("/pre-Crop"), a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resetTag:input:", CFSTR("/pre-Orientation"), v9);

  return v7;
}

id __33__PIPipelineFilters_noMuteFilter__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v6;
  void *v7;
  void *v8;

  v6 = a2;
  objc_msgSend(v6, "getTagWithPath:error:", CFSTR("pre-Mute"), a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resetTag:input:", CFSTR("Mute"), v7);
  objc_msgSend(v6, "getTagWithPath:error:", CFSTR("Image"), a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __33__PIPipelineFilters_noTrimFilter__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int64_t v15;
  void *v16;
  void *v17;
  int64_t v18;
  void *v19;
  void *v20;
  unsigned int v21;
  unsigned int v22;
  CMTime v24;
  CMTime v25;
  CMTime v26;
  CMTime v27;

  v8 = a2;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "getTagWithPath:error:", CFSTR("/pre-Trim"), a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resetTag:input:", CFSTR("/SloMo"), v11);
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("slomo"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v9;
  if (v12)
  {
    memset(&v27, 0, sizeof(v27));
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("start"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (int)objc_msgSend(v14, "intValue");
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("startScale"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    CMTimeMake(&v27, v15, objc_msgSend(v16, "intValue"));

    memset(&v26, 0, sizeof(v26));
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("end"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (int)objc_msgSend(v17, "intValue");
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("endScale"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    CMTimeMake(&v26, v18, objc_msgSend(v19, "intValue"));

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("rate"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "floatValue");
    v22 = v21;

    v25 = v27;
    v24 = v26;
    objc_msgSend(v8, "createSloMoWithInput:startTime:endTime:rate:error:", v9, &v25, &v24, a5, COERCE_DOUBLE(__PAIR64__(HIDWORD(v26.value), v22)));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

id __35__PIPipelineFilters_noRedEyeFilter__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v6;
  void *v7;
  void *v8;

  v6 = a2;
  objc_msgSend(v6, "getTagWithPath:error:", CFSTR("/pre-RedEye"), a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resetTag:input:", CFSTR("/post-RedEye"), v7);
  objc_msgSend(v6, "getTagWithPath:error:", CFSTR("/post-RedEye"), a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __46__PIPipelineFilters_sourceFilterNoOrientation__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v7 = a2;
  v8 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", &unk_1E505CDD8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("raw"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("inputDecoderVersion"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("inputDecoderVersion"));

    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("inputSushiLevel"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("kCGImageSourceShouldExtendRaw"));
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("gainMapVersion"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, CFSTR("gainMapVersion"));

    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("gainMapParameters"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, CFSTR("gainMapParameters"));

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("source"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "renderNodeFromSource:settings:error:", v16, v9, a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v7, "getTagWithPath:error:", CFSTR("/ShowOriginalSource"), a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

id __56__PIPipelineFilters_rawSourceFilterIncludingOrientation__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v19;
  void *v20;
  const void **v21;
  void *specific;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a3;
  v10 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("raw"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = v12;
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("inputDecoderVersion"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("inputDecoderVersion"));

    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("inputSushiLevel"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, CFSTR("kCGImageSourceShouldExtendRaw"));

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("source"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "renderNodeFromSource:settings:error:", v16, v11, a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    return v17;
  }
  else
  {
    NUAssertLogger_20897();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("expected RAW in rawSourceFilterIncludingOrientation"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138543362;
      v33 = v20;
      _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v32, 0xCu);

    }
    v21 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_20897();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        v27 = dispatch_get_specific(*v21);
        v28 = (void *)MEMORY[0x1E0CB3978];
        v29 = v27;
        objc_msgSend(v28, "callStackSymbols");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "componentsJoinedByString:", CFSTR("\n"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 138543618;
        v33 = v27;
        v34 = 2114;
        v35 = v31;
        _os_log_error_impl(&dword_1A6382000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v32, 0x16u);

      }
    }
    else if (v24)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138543362;
      v33 = v26;
      _os_log_error_impl(&dword_1A6382000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v32, 0xCu);

    }
    _NUAssertFailHandler();
    return NUAssertLogger_20897();
  }
}

id __41__PIPipelineFilters_rawFaceBalanceFilter__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("raw"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("inputDecoderVersion"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("inputDecoderVersion"));

    objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("skipOrientation"));
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("source"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "renderNodeFromSource:settings:error:", v13, v9, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "getTagWithPath:error:", CFSTR("Raw/Linear"), a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {

    v18[0] = CFSTR("inputImage");
    v18[1] = CFSTR("inputBoost");
    v19[0] = v15;
    v19[1] = &unk_1E5052238;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "nodeByApplyingFilterWithName:useHDRFilter:settingsAndInputs:", CFSTR("PIForwardFakeBoost"), 0, v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

id __57__PIPipelineFilters_exifOrientationAndCropStraightenOnly__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v6 = a2;
  objc_msgSend(v6, "getTagWithPath:error:", CFSTR("/pre-Adjustments"), a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resetTag:input:", CFSTR("/pre-Crop"), v7);
  objc_msgSend(v6, "getTagWithPath:error:", CFSTR("/Crop"), a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "outputImageGeometry:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "orientation");

  objc_msgSend(v6, "orientedNode:withOrientation:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __35__PIPipelineFilters_autoCropFilter__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a2;
  objc_msgSend(v6, "getTagWithPath:error:", CFSTR("/pre-Adjustments"), a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "outputImageGeometry:", a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v6, "orientedNode:withOrientation:", v8, objc_msgSend(v9, "orientation"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
