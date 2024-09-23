@implementation ApplyBlurmap

- (ApplyBlurmap)init
{
  NSObject *v2;
  id v3;
  const char *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  uni_logger_api();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = objc_retainAutorelease((id)objc_opt_class());
    v6 = 136446466;
    v7 = "-[ApplyBlurmap init]";
    v8 = 2080;
    v9 = objc_msgSend_UTF8String(v3, v4, v5);
    _os_log_error_impl(&dword_24B6B5000, v2, OS_LOG_TYPE_ERROR, "%{public}s invalid initialization method for %s", (uint8_t *)&v6, 0x16u);
  }

  abort();
}

- (ApplyBlurmap)initWithMetalQueue:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char *v10;
  id v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  UniLibrary *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  const char *v31;
  void *v32;
  char isKindOfClass;
  const char *v34;
  void *v35;
  const char *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  const char *v48;
  void *v49;
  char v50;
  const char *v51;
  void *v52;
  const char *v53;
  void *v54;
  void *v55;
  UniMorphology *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  ApplyBlurmap *v60;
  objc_super v62;

  v5 = a3;
  v8 = v5;
  if (v5)
  {
    objc_msgSend_device(v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  v62.receiver = self;
  v62.super_class = (Class)ApplyBlurmap;
  v10 = -[ApplyBlurmap init](&v62, sel_init);
  if (!v10)
    sub_24B6ED458();
  v11 = v10;
  *((_QWORD *)v10 + 28) = 0x23D4CCCCDLL;
  *(_OWORD *)(v10 + 232) = xmmword_24B6F5560;
  *((_DWORD *)v10 + 63) = 0;
  *((_QWORD *)v10 + 32) = 0x400000004;
  *((_QWORD *)v10 + 33) = 0x2B8CBCCC00000004;
  *((_QWORD *)v10 + 34) = 0x33DCCCCCDLL;
  *(_OWORD *)(v10 + 280) = xmmword_24B6F5570;
  *(_OWORD *)(v10 + 296) = xmmword_24B6F5580;
  *((_DWORD *)v10 + 78) = 50;
  *(_OWORD *)(v10 + 316) = xmmword_24B6F5590;
  *(_OWORD *)(v10 + 332) = xmmword_24B6F55A0;
  *((_DWORD *)v10 + 91) = 8;
  *((_DWORD *)v10 + 90) = 0;
  *((_QWORD *)v10 + 44) = 0;
  *((_DWORD *)v10 + 87) = 0;
  *((_DWORD *)v10 + 93) = 1082130432;
  *((_QWORD *)v10 + 52) = 0x3F40000000000000;
  objc_storeStrong((id *)v10 + 1, a3);
  v12 = (void *)MEMORY[0x24BDD1488];
  v13 = objc_opt_class();
  objc_msgSend_bundleForClass_(v12, v14, v13);
  v15 = objc_claimAutoreleasedReturnValue();
  if (!v15)
    sub_24B6ED480();
  v16 = (void *)v15;
  v17 = [UniLibrary alloc];
  v19 = objc_msgSend_initWithDevice_metalOnly_(v17, v18, (uint64_t)v9, v8 != 0);
  v20 = (void *)*((_QWORD *)v11 + 2);
  *((_QWORD *)v11 + 2) = v19;

  if (!*((_QWORD *)v11 + 2))
    sub_24B6ED4A8();
  sub_24B6B81BC(*((_WORD *)v11 + 132));
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)*((_QWORD *)v11 + 25);
  *((_QWORD *)v11 + 25) = v21;

  v25 = (void *)*((_QWORD *)v11 + 25);
  if (!v25)
    sub_24B6ED4D0();
  v28 = objc_msgSend_count(v25, v23, v24);
  v29 = (void *)*((_QWORD *)v11 + 25);
  if (v28 != 2)
  {
    if (objc_msgSend_count(v29, v26, v27) != 2)
      sub_24B6ED598();
    syslog(3, "(2 == [_segmentArray count]) is NULL, (%s) at %s:%d");
    goto LABEL_24;
  }
  objc_msgSend_objectAtIndexedSubscript_(v29, v26, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

  }
  else
  {
    objc_msgSend_objectAtIndexedSubscript_(*((void **)v11 + 25), v31, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend_objectAtIndexedSubscript_(*((void **)v11 + 25), v34, 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (objc_msgSend_objectAtIndexedSubscript_(*((void **)v11 + 25), v36, 1),
            v37 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            (objc_opt_isKindOfClass() & 1) == 0))
      {
        sub_24B6ED570();
      }

      syslog(3, "[_segmentArray[0] isKindOfClass:[NSData class]] && [_segmentArray[1] isKindOfClass:[NSData class]] is NULL, (%s) at %s:%d");
      goto LABEL_24;
    }
  }
  if (*((int *)v11 + 96) < 1)
  {
LABEL_25:
    v56 = [UniMorphology alloc];
    v58 = objc_msgSend_initWithDevice_(v56, v57, (uint64_t)v9);
    v59 = (void *)*((_QWORD *)v11 + 24);
    *((_QWORD *)v11 + 24) = v58;

    v55 = v11;
    goto LABEL_26;
  }
  sub_24B6B81BC(*((_DWORD *)v11 + 96));
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = (void *)*((_QWORD *)v11 + 26);
  *((_QWORD *)v11 + 26) = v38;

  v42 = (void *)*((_QWORD *)v11 + 26);
  if (!v42)
    sub_24B6ED4F8();
  v45 = objc_msgSend_count(v42, v40, v41);
  v46 = (void *)*((_QWORD *)v11 + 26);
  if (v45 == 2)
  {
    objc_msgSend_objectAtIndexedSubscript_(v46, v43, 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {

      goto LABEL_25;
    }
    objc_msgSend_objectAtIndexedSubscript_(*((void **)v11 + 26), v48, 1);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v50 = objc_opt_isKindOfClass();

    if ((v50 & 1) == 0)
      goto LABEL_25;
    objc_msgSend_objectAtIndexedSubscript_(*((void **)v11 + 26), v51, 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (objc_msgSend_objectAtIndexedSubscript_(*((void **)v11 + 26), v53, 1),
          v54 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          (objc_opt_isKindOfClass() & 1) == 0))
    {
      sub_24B6ED520();
    }

    syslog(3, "[_fgSegmentArray[0] isKindOfClass:[NSData class]] && [_fgSegmentArray[1] isKindOfClass:[NSData class]] is NULL, (%s) at %s:%d");
  }
  else
  {
    if (objc_msgSend_count(v46, v43, v44) != 2)
      sub_24B6ED548();
    syslog(3, "(2 == [_fgSegmentArray count]) is NULL, (%s) at %s:%d");
  }
LABEL_24:
  v55 = 0;
LABEL_26:
  v60 = v55;

  return v60;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ApplyBlurmap;
  -[ApplyBlurmap dealloc](&v2, sel_dealloc);
}

- (id)hairnetModelPath
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_24B6B84B8;
  block[3] = &unk_251C8F0C0;
  block[4] = self;
  if (qword_2544D9C98 != -1)
    dispatch_once(&qword_2544D9C98, block);
  return (id)qword_2544D9C90;
}

- (int)loadModels:(const void *)a3
{
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;

  if (a3 && (*((float *)a3 + 3) != 0.0 || *((float *)a3 + 4) != 0.0))
  {
    objc_msgSend_hairnetModelPath(self, a2, (uint64_t)a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cachedEspressoWrapper_(EspressoWrapper, v4, (uint64_t)v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_buildWait(v5, v6, v7);

  }
  return 0;
}

- (int)unloadModels
{
  uint64_t v2;

  objc_msgSend_clearCache(EspressoWrapper, a2, v2);
  return 0;
}

- (int)setOptions:(const void *)a3 isPrewarm:(BOOL)a4
{
  _BOOL4 v4;
  NSArray *v7;
  NSArray *segmentArray;
  const char *v9;
  uint64_t v10;
  NSArray *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSArray *v15;
  void *v16;
  const char *v17;
  void *v18;
  char isKindOfClass;
  void *v20;
  const char *v21;
  void *v22;
  NSArray *v23;
  NSArray *fgSegmentArray;
  const char *v25;
  uint64_t v26;
  NSArray *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  NSArray *v31;
  void *v32;
  const char *v33;
  void *v34;
  char v35;
  void *v36;
  const char *v37;
  void *v38;
  int result;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  int v49;
  int v50;
  int v51;
  int nRings;
  int v53;
  int Shaders;

  if (!a3)
    sub_24B6ED610();
  v4 = a4;
  if (*((_DWORD *)a3 + 12) != self->_config_params.nRings)
  {
    sub_24B6B81BC(*((_DWORD *)a3 + 12));
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    segmentArray = self->_segmentArray;
    self->_segmentArray = v7;

    v11 = self->_segmentArray;
    if (!v11)
      sub_24B6ED6B0();
    v14 = objc_msgSend_count(v11, v9, v10);
    v15 = self->_segmentArray;
    if (v14 != 2)
    {
      if (objc_msgSend_count(v15, v12, v13) != 2)
        sub_24B6ED700();
      syslog(3, "(2 == [_segmentArray count]) is NULL, (%s) at %s:%d");
      return -1;
    }
    objc_msgSend_objectAtIndexedSubscript_(v15, v12, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {

    }
    else
    {
      objc_msgSend_objectAtIndexedSubscript_(self->_segmentArray, v17, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend_objectAtIndexedSubscript_(self->_segmentArray, a2, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || (objc_msgSend_objectAtIndexedSubscript_(self->_segmentArray, v21, 1),
              v22 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_opt_class(),
              (objc_opt_isKindOfClass() & 1) == 0))
        {
          sub_24B6ED6D8();
        }

        syslog(3, "[_segmentArray[0] isKindOfClass:[NSData class]] && [_segmentArray[1] isKindOfClass:[NSData class]] is NULL, (%s) at %s:%d");
        return -1;
      }
    }
  }
  if (*((_DWORD *)a3 + 42) != self->_config_params.fgNRings || !self->_fgSegmentArray)
  {
    sub_24B6B81BC(*((_DWORD *)a3 + 42));
    v23 = (NSArray *)objc_claimAutoreleasedReturnValue();
    fgSegmentArray = self->_fgSegmentArray;
    self->_fgSegmentArray = v23;

    v27 = self->_fgSegmentArray;
    if (!v27)
      sub_24B6ED638();
    v30 = objc_msgSend_count(v27, v25, v26);
    v31 = self->_fgSegmentArray;
    if (v30 != 2)
    {
      if (objc_msgSend_count(v31, v28, v29) != 2)
        sub_24B6ED688();
      syslog(3, "(2 == [_fgSegmentArray count]) is NULL, (%s) at %s:%d");
      return -1;
    }
    objc_msgSend_objectAtIndexedSubscript_(v31, v28, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {

    }
    else
    {
      objc_msgSend_objectAtIndexedSubscript_(self->_fgSegmentArray, v33, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v35 = objc_opt_isKindOfClass();

      if ((v35 & 1) != 0)
      {
        objc_msgSend_objectAtIndexedSubscript_(self->_fgSegmentArray, a2, 0);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || (objc_msgSend_objectAtIndexedSubscript_(self->_fgSegmentArray, v37, 1),
              v38 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_opt_class(),
              (objc_opt_isKindOfClass() & 1) == 0))
        {
          sub_24B6ED660();
        }

        syslog(3, "[_fgSegmentArray[0] isKindOfClass:[NSData class]] && [_fgSegmentArray[1] isKindOfClass:[NSData class]] is NULL, (%s) at %s:%d");
        return -1;
      }
    }
  }
  *(_OWORD *)&self->_config_params.simulatedAperture = *(_OWORD *)a3;
  v40 = *((_OWORD *)a3 + 1);
  v41 = *((_OWORD *)a3 + 2);
  v42 = *((_OWORD *)a3 + 4);
  *(_OWORD *)&self->_config_params.nRings = *((_OWORD *)a3 + 3);
  *(_OWORD *)&self->_config_params.relativeWeightThreshold = v42;
  *(_OWORD *)&self->_config_params.maxBlur = v40;
  *(_OWORD *)&self->_config_params.lumaNoiseAmplitude = v41;
  v43 = *((_OWORD *)a3 + 5);
  v44 = *((_OWORD *)a3 + 6);
  v45 = *((_OWORD *)a3 + 8);
  *(_OWORD *)&self->_config_params.xhlrbMaxIntensityT1 = *((_OWORD *)a3 + 7);
  *(_OWORD *)&self->_config_params.xhlrbWeightGain = v45;
  *(_OWORD *)&self->_config_params.ringAmplitude = v43;
  *(_OWORD *)&self->_config_params.xhlrbIterations = v44;
  v46 = *((_OWORD *)a3 + 9);
  v47 = *((_OWORD *)a3 + 10);
  v48 = *((_OWORD *)a3 + 12);
  *(_OWORD *)&self->_config_params.fgHitThreshold = *((_OWORD *)a3 + 11);
  *(_OWORD *)&self->_config_params.fgBlurWeightSmoothstepEnd = v48;
  *(_OWORD *)&self->_config_params.ohlbIntensityGain = v46;
  *(_OWORD *)&self->_config_params.fgMinNRings = v47;
  if (v4)
  {
    v49 = *((_DWORD *)a3 + 11);
    if (qword_2544D9CE0 != -1)
      dispatch_once(&qword_2544D9CE0, &unk_251C8F368);
    if (v49 >= dword_2579AEA38)
      v50 = dword_2579AEA38;
    else
      v50 = v49;
    if (*((_DWORD *)a3 + 10) >= v50)
      v51 = v50;
    else
      v51 = *((_DWORD *)a3 + 10);
    nRings = self->_config_params.nRings;
    v53 = v50 + 1;
    do
    {
      self->_config_params.nRings = v51;
      Shaders = objc_msgSend_loadShaders(self, a2, (uint64_t)a3);
      self->_config_params.nRings = nRings;
      if (Shaders)
        goto LABEL_36;
    }
    while (v53 != ++v51);
  }
  result = objc_msgSend_loadShaders(self, a2, (uint64_t)a3);
  if (result)
  {
LABEL_36:
    syslog(3, "err error, (%s) at %s:%d");
    return -1;
  }
  return result;
}

- (void)_setROICallbacks
{
  const char *v3;
  const char *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;

  objc_msgSend_setRoiCallback_(self->_prefilterX, a2, (uint64_t)&unk_251C8F100);
  objc_msgSend_setRoiCallback_(self->_prefilterY, v3, (uint64_t)&unk_251C8F120);
  objc_msgSend_setRoiCallback_(self->_preprocess, v4, (uint64_t)&unk_251C8F140);
  objc_msgSend_setRoiCallback_(self->_preprocessScaled, v5, (uint64_t)&unk_251C8F160);
  objc_msgSend_setRoiCallback_(self->_gainmapMultiply, v6, (uint64_t)&unk_251C8F180);
  objc_msgSend_setRoiCallback_(self->_gainmapRGBMultiply, v7, (uint64_t)&unk_251C8F1A0);
  objc_msgSend_setRoiCallback_(self->_sparseWithAlpha, v8, (uint64_t)&unk_251C8F1C0);
  objc_msgSend_setRoiCallback_(self->_sparseNoAlpha, v9, (uint64_t)&unk_251C8F1E0);
  objc_msgSend_setRoiCallback_(self->_sparseNoAlphaRayFg, v10, (uint64_t)&unk_251C8F200);
  objc_msgSend_setRoiCallback_(self->_antialiasX, v11, (uint64_t)&unk_251C8F220);
  objc_msgSend_setRoiCallback_(self->_antialiasY, v12, (uint64_t)&unk_251C8F240);
  objc_msgSend_setRoiCallback_(self->_antialiasRGBAX, v13, (uint64_t)&unk_251C8F260);
  objc_msgSend_setRoiCallback_(self->_antialiasRGBAY, v14, (uint64_t)&unk_251C8F280);
  objc_msgSend_setRoiCallback_(self->_yuv1, v15, (uint64_t)&unk_251C8F2A0);
  objc_msgSend_setRoiCallback_(self->_yuv2, v16, (uint64_t)&unk_251C8F2C0);
  objc_msgSend_setRoiCallback_(self->_localContrast, v17, (uint64_t)&unk_251C8F2E0);
  objc_msgSend_setRoiCallback_(self->_blendRaytraced, v18, (uint64_t)&unk_251C8F300);
}

- (int)loadShaders
{
  int nRings;
  float relativeWeightThreshold;
  float maxBlur;
  float v6;
  float v7;
  float v8;
  float antiAliasBlurStrength;
  float xhlrbMaxIntensityT0;
  float v11;
  float xhlrbMinIntensityT0;
  float v13;
  float v14;
  float v15;
  float v16;
  void *v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  const char *v26;
  const char *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  const char *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  const char *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  const char *v43;
  void *v44;
  const char *v45;
  void *v46;
  uint64_t v47;
  const char *v48;
  void *v49;
  const char *v50;
  void *v51;
  uint64_t v52;
  const char *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  const char *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  const char *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  const char *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  const char *v69;
  void *v70;
  const char *v71;
  void *v72;
  uint64_t v73;
  const char *v74;
  void *v75;
  uint64_t v76;
  const char *v77;
  const char *v78;
  const char *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  const char *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  const char *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  const char *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  const char *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  const char *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  const char *v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  const char *v107;
  void *v108;
  void *v109;
  uint64_t v110;
  const char *v111;
  void *v112;
  const char *v113;
  void *v114;
  uint64_t v115;
  const char *v116;
  void *v117;
  const char *v118;
  void *v119;
  uint64_t v120;
  const char *v121;
  void *v122;
  const char *v123;
  void *v124;
  uint64_t v125;
  const char *v126;
  const char *v127;
  void *v128;
  uint64_t v129;
  const char *v130;
  void *v131;
  void *v132;
  uint64_t v133;
  const char *v134;
  void *v135;
  void *v136;
  uint64_t v137;
  const char *v138;
  void *v139;
  void *v140;
  uint64_t v141;
  const char *v142;
  void *v143;
  void *v144;
  uint64_t v145;
  const char *v146;
  void *v147;
  void *v148;
  uint64_t v149;
  const char *v150;
  void *v151;
  void *v152;
  uint64_t v153;
  const char *v154;
  void *v155;
  void *v156;
  uint64_t v157;
  const char *v158;
  void *v159;
  const char *v160;
  void *v161;
  uint64_t v162;
  const char *v163;
  void *v164;
  void *v165;
  uint64_t v166;
  const char *v167;
  void *v168;
  void *v169;
  uint64_t v170;
  const char *v171;
  void *v172;
  const char *v173;
  void *v174;
  const char *v175;
  void *v176;
  void *v177;
  uint64_t v178;
  const char *v179;
  void *v180;
  void *v181;
  uint64_t v182;
  const char *v183;
  void *v184;
  void *v185;
  uint64_t v186;
  const char *v187;
  void *v188;
  void *v189;
  uint64_t v190;
  const char *v191;
  void *v192;
  const char *v193;
  void *v194;
  void *v195;
  uint64_t v196;
  const char *v197;
  void *v198;
  const char *v199;
  void *v200;
  UniKernel *v201;
  const char *v202;
  UniKernel *v203;
  UniKernel *preprocess;
  const char *v205;
  UniKernel *v206;
  UniKernel *v207;
  const char *v208;
  UniKernel *v209;
  UniKernel *preprocessScaled;
  const char *v211;
  UniKernel *v212;
  UniHighlightRecovery *v213;
  const char *v214;
  uint64_t v215;
  void *v216;
  const char *v217;
  UniKernel *v218;
  UniKernel *highlightRecovery;
  UniKernel *v220;
  const char *v221;
  UniKernel *v222;
  UniKernel *prefilterX;
  const char *v224;
  UniKernel *v225;
  UniKernel *v226;
  const char *v227;
  UniKernel *v228;
  UniKernel *prefilterY;
  const char *v230;
  UniKernel *v231;
  UniKernel *v232;
  const char *v233;
  UniKernel *v234;
  UniKernel *sparseNoAlpha;
  const char *v236;
  UniKernel *v237;
  UniKernel *v238;
  const char *v239;
  UniKernel *v240;
  UniKernel *sparseNoAlphaRayFg;
  const char *v242;
  UniKernel *v243;
  UniKernel *v244;
  const char *v245;
  UniKernel *v246;
  UniKernel *sparseWithAlpha;
  const char *v248;
  UniKernel *v249;
  UniKernel *v250;
  const char *v251;
  UniKernel *v252;
  UniKernel *gainmapMultiply;
  const char *v254;
  UniKernel *v255;
  UniKernel *v256;
  const char *v257;
  UniKernel *v258;
  UniKernel *gainmapRGBMultiply;
  const char *v260;
  UniKernel *v261;
  const char *v262;
  UniKernel *v263;
  UniKernel *antialiasX;
  const char *v265;
  UniKernel *v266;
  UniKernel *v267;
  const char *v268;
  UniKernel *v269;
  UniKernel *antialiasY;
  const char *v271;
  UniKernel *v272;
  UniKernel *v273;
  const char *v274;
  UniKernel *v275;
  UniKernel *antialiasRGBAX;
  const char *v277;
  UniKernel *v278;
  UniKernel *v279;
  const char *v280;
  UniKernel *v281;
  UniKernel *antialiasRGBAY;
  const char *v283;
  UniKernel *v284;
  UniKernel *v285;
  const char *v286;
  UniKernel *v287;
  UniKernel *addNoiseOnly;
  const char *v289;
  UniKernel *v290;
  UniKernel *v291;
  const char *v292;
  UniKernel *v293;
  UniKernel *yuv1;
  const char *v295;
  UniKernel *v296;
  UniKernel *v297;
  const char *v298;
  UniKernel *v299;
  UniKernel *yuv2;
  const char *v301;
  UniKernel *v302;
  const char *v303;
  UniKernel *v304;
  UniKernel *localContrast;
  const char *v306;
  UniKernel *v307;
  const char *v308;
  UniKernel *v309;
  UniKernel *extractPositiveBlurValues;
  const char *v311;
  UniKernel *v312;
  UniKernel *v313;
  const char *v314;
  UniKernel *v315;
  UniKernel *extractNegativeBlurValues;
  const char *v317;
  UniKernel *v318;
  UniMorphology *v319;
  const char *v320;
  uint64_t v321;
  void *v322;
  const char *v323;
  UniMorphology *v324;
  UniMorphology *morphology;
  const char *v326;
  UniKernel *v327;
  const char *v328;
  UniKernel *v329;
  UniKernel *blendRaytraced;
  const char *v331;
  UniKernel *v332;
  const char *v333;
  uint64_t v334;
  void *v336;
  void *v337;
  void *v338;
  void *v339;
  void *v340;
  void *v341;
  void *v342;
  unsigned int xhlrbTileSize;
  void *v344;
  void *v345;
  void *v346;
  void *v347;
  unsigned int v348;
  void *v349;
  unsigned int v350;
  void *v351;
  const __CFString *v352;
  void *v353;
  _QWORD v354[5];
  _QWORD v355[5];
  _QWORD v356[3];
  _QWORD v357[3];
  _QWORD v358[10];
  _QWORD v359[10];
  _QWORD v360[10];
  _QWORD v361[10];
  _QWORD v362[5];
  _QWORD v363[5];
  const __CFString *v364;
  void *v365;
  _QWORD v366[3];
  _QWORD v367[3];
  _QWORD v368[3];
  _QWORD v369[5];

  v369[3] = *MEMORY[0x24BDAC8D0];
  nRings = self->_config_params.nRings;
  v350 = 3 * nRings * nRings;
  v348 = 3 * self->_config_params.fgNRings * self->_config_params.fgNRings;
  relativeWeightThreshold = self->_config_params.relativeWeightThreshold;
  maxBlur = self->_config_params.maxBlur;
  v6 = 0.5 / (float)(relativeWeightThreshold / maxBlur);
  v7 = (float)(relativeWeightThreshold * v6) / maxBlur;
  v8 = 1.0 - self->_config_params.alphaEpsilon;
  antiAliasBlurStrength = self->_config_params.antiAliasBlurStrength;
  xhlrbMaxIntensityT0 = self->_config_params.xhlrbMaxIntensityT0;
  v11 = 1.0 / (float)(self->_config_params.xhlrbMaxIntensityT1 - xhlrbMaxIntensityT0);
  xhlrbMinIntensityT0 = self->_config_params.xhlrbMinIntensityT0;
  v13 = 1.0 / (float)(self->_config_params.xhlrbMinIntensityT1 - xhlrbMinIntensityT0);
  xhlrbTileSize = self->_config_params.xhlrbTileSize;
  v14 = -(float)(v11 * xhlrbMaxIntensityT0);
  v15 = -(float)(v13 * xhlrbMinIntensityT0);
  v368[0] = CFSTR("SparseRenderer::kPreFilterRadius");
  v16 = antiAliasBlurStrength / (float)nRings;
  objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], a2, self->_config_params.preFilterRadius);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v369[0] = v17;
  v368[1] = CFSTR("SparseRenderer::kMaxBlur_ushort");
  v18 = (void *)MEMORY[0x24BDD16E0];
  v19 = convertFloatToF16AsUshort(self->_config_params.maxBlur);
  objc_msgSend_numberWithUnsignedShort_(v18, v20, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v369[1] = v21;
  v368[2] = CFSTR("SparseRenderer::kAntiAliasBlurStrength_ushort");
  v22 = (void *)MEMORY[0x24BDD16E0];
  v23 = convertFloatToF16AsUshort(v16);
  objc_msgSend_numberWithUnsignedShort_(v22, v24, v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v369[2] = v25;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v26, (uint64_t)v369, v368, 3);
  v338 = (void *)objc_claimAutoreleasedReturnValue();

  v366[0] = CFSTR("SparseRenderer::kAntiAliasRadius");
  objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v27, self->_config_params.antiAliasRadius);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v367[0] = v28;
  v366[1] = CFSTR("SparseRenderer::kMaxBlur_ushort");
  v29 = (void *)MEMORY[0x24BDD16E0];
  v30 = convertFloatToF16AsUshort(self->_config_params.maxBlur);
  objc_msgSend_numberWithUnsignedShort_(v29, v31, v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v367[1] = v32;
  v366[2] = CFSTR("SparseRenderer::kAntiAliasBlurStrength_ushort");
  v33 = (void *)MEMORY[0x24BDD16E0];
  v34 = convertFloatToF16AsUshort(v16);
  objc_msgSend_numberWithUnsignedShort_(v33, v35, v34);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v367[2] = v36;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v37, (uint64_t)v367, v366, 3);
  v38 = objc_claimAutoreleasedReturnValue();

  v337 = (void *)v38;
  objc_msgSend_dictionaryWithDictionary_(MEMORY[0x24BDBCED8], v39, v38);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)MEMORY[0x24BDD16E0];
  v42 = convertFloatToF16AsUshort(self->_config_params.lumaNoiseModelCoeff);
  objc_msgSend_numberWithUnsignedShort_(v41, v43, v42);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v336 = v40;
  objc_msgSend_setObject_forKeyedSubscript_(v40, v45, (uint64_t)v44, CFSTR("SparseRenderer::kLumaNoiseModelCoeff_ushort"));

  v364 = CFSTR("SparseRenderer::kLumaNoiseModelCoeff_ushort");
  v46 = (void *)MEMORY[0x24BDD16E0];
  v47 = convertFloatToF16AsUshort(self->_config_params.lumaNoiseModelCoeff);
  objc_msgSend_numberWithUnsignedShort_(v46, v48, v47);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v365 = v49;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v50, (uint64_t)&v365, &v364, 1);
  v345 = (void *)objc_claimAutoreleasedReturnValue();

  v362[0] = CFSTR("SparseRenderer::kSharpRadius_ushort");
  v51 = (void *)MEMORY[0x24BDD16E0];
  v52 = convertFloatToF16AsUshort(self->_config_params.sharpRadius);
  objc_msgSend_numberWithUnsignedShort_(v51, v53, v52);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v363[0] = v54;
  v362[1] = CFSTR("SparseRenderer::kSoftRadius_ushort");
  v55 = (void *)MEMORY[0x24BDD16E0];
  v56 = convertFloatToF16AsUshort(self->_config_params.softRadius);
  objc_msgSend_numberWithUnsignedShort_(v55, v57, v56);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v363[1] = v58;
  v362[2] = CFSTR("SparseRenderer::kMaxBlur_ushort");
  v59 = (void *)MEMORY[0x24BDD16E0];
  v60 = convertFloatToF16AsUshort(self->_config_params.maxBlur);
  objc_msgSend_numberWithUnsignedShort_(v59, v61, v60);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v363[2] = v62;
  v362[3] = CFSTR("SparseRenderer::kBlendingQuarterResAlphaGain_ushort");
  v63 = (void *)MEMORY[0x24BDD16E0];
  v64 = convertFloatToF16AsUshort(self->_config_params.blendingQuarterResAlphaGain);
  objc_msgSend_numberWithUnsignedShort_(v63, v65, v64);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v363[3] = v66;
  v362[4] = CFSTR("SparseRenderer::kBlendingFullResAlphaGain_ushort");
  v67 = (void *)MEMORY[0x24BDD16E0];
  v68 = convertFloatToF16AsUshort(self->_config_params.blendingFullResAlphaGain);
  objc_msgSend_numberWithUnsignedShort_(v67, v69, v68);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v363[4] = v70;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v71, (uint64_t)v363, v362, 5);
  v344 = (void *)objc_claimAutoreleasedReturnValue();

  v360[0] = CFSTR("SparseRenderer::kMaxBlur_ushort");
  v72 = (void *)MEMORY[0x24BDD16E0];
  v73 = convertFloatToF16AsUshort(self->_config_params.maxBlur);
  objc_msgSend_numberWithUnsignedShort_(v72, v74, v73);
  v346 = (void *)objc_claimAutoreleasedReturnValue();
  v361[0] = v346;
  v360[1] = CFSTR("SparseRenderer::kSharpRadius_ushort");
  v75 = (void *)MEMORY[0x24BDD16E0];
  v76 = convertFloatToF16AsUshort(self->_config_params.sharpRadius);
  objc_msgSend_numberWithUnsignedShort_(v75, v77, v76);
  v341 = (void *)objc_claimAutoreleasedReturnValue();
  v361[1] = v341;
  v360[2] = CFSTR("SparseRenderer::kBasePixelWeight_uint32");
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v78, LODWORD(self->_config_params.basePixelWeight));
  v339 = (void *)objc_claimAutoreleasedReturnValue();
  v361[2] = v339;
  v360[3] = CFSTR("SparseRenderer::kNumSegments");
  objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v79, v350);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v361[3] = v80;
  v360[4] = CFSTR("SparseRenderer::kRingAmplitude_ushort");
  v81 = (void *)MEMORY[0x24BDD16E0];
  v82 = convertFloatToF16AsUshort(self->_config_params.ringAmplitude);
  objc_msgSend_numberWithUnsignedShort_(v81, v83, v82);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v361[4] = v84;
  v360[5] = CFSTR("SparseRenderer::kRingSharpness_ushort");
  v85 = (void *)MEMORY[0x24BDD16E0];
  v86 = convertFloatToF16AsUshort(self->_config_params.ringSharpness);
  objc_msgSend_numberWithUnsignedShort_(v85, v87, v86);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v361[5] = v88;
  v360[6] = CFSTR("SparseRenderer::kHighlightBoostGain_ushort");
  v89 = (void *)MEMORY[0x24BDD16E0];
  v90 = convertFloatToF16AsUshort(self->_config_params.highlightBoostGain);
  objc_msgSend_numberWithUnsignedShort_(v89, v91, v90);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v361[6] = v92;
  v360[7] = CFSTR("SparseRenderer::kLinearBoostGain_ushort");
  v93 = (void *)MEMORY[0x24BDD16E0];
  v94 = convertFloatToF16AsUshort(self->_config_params.linearBoostGain);
  objc_msgSend_numberWithUnsignedShort_(v93, v95, v94);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v361[7] = v96;
  v360[8] = CFSTR("SparseRenderer::kRelativeWeightThresholdM_ushort");
  v97 = (void *)MEMORY[0x24BDD16E0];
  v98 = convertFloatToF16AsUshort(v6);
  objc_msgSend_numberWithUnsignedShort_(v97, v99, v98);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v361[8] = v100;
  v360[9] = CFSTR("SparseRenderer::kRelativeWeightThresholdC_ushort");
  v101 = (void *)MEMORY[0x24BDD16E0];
  v102 = convertFloatToF16AsUshort(v7);
  objc_msgSend_numberWithUnsignedShort_(v101, v103, v102);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v361[9] = v104;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v105, (uint64_t)v361, v360, 10);
  v106 = objc_claimAutoreleasedReturnValue();

  v351 = (void *)v106;
  objc_msgSend_dictionaryWithDictionary_(MEMORY[0x24BDBCED8], v107, v106);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = (void *)MEMORY[0x24BDD16E0];
  v110 = convertFloatToF16AsUshort(self->_config_params.alphaEpsilon);
  objc_msgSend_numberWithUnsignedShort_(v109, v111, v110);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v108, v113, (uint64_t)v112, CFSTR("SparseRenderer::kAlphaEpsilon_ushort"));

  v114 = (void *)MEMORY[0x24BDD16E0];
  v115 = convertFloatToF16AsUshort(v8);
  objc_msgSend_numberWithUnsignedShort_(v114, v116, v115);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v108, v118, (uint64_t)v117, CFSTR("SparseRenderer::kAlphaEpsilonRem_ushort"));

  v119 = (void *)MEMORY[0x24BDD16E0];
  v120 = convertFloatToF16AsUshort(self->_config_params.alphaGain);
  objc_msgSend_numberWithUnsignedShort_(v119, v121, v120);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v347 = v108;
  objc_msgSend_setObject_forKeyedSubscript_(v108, v123, (uint64_t)v122, CFSTR("SparseRenderer::kAlphaGain_ushort"));

  v358[0] = CFSTR("SparseRenderer::kMaxBlur_ushort");
  v124 = (void *)MEMORY[0x24BDD16E0];
  v125 = convertFloatToF16AsUshort(self->_config_params.maxBlur);
  objc_msgSend_numberWithUnsignedShort_(v124, v126, v125);
  v342 = (void *)objc_claimAutoreleasedReturnValue();
  v359[0] = v342;
  v358[1] = CFSTR("SparseRenderer::kNumSegments");
  objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v127, v348);
  v340 = (void *)objc_claimAutoreleasedReturnValue();
  v359[1] = v340;
  v358[2] = CFSTR("SparseRenderer::kRingAmplitude_ushort");
  v128 = (void *)MEMORY[0x24BDD16E0];
  v129 = convertFloatToF16AsUshort(self->_config_params.ringAmplitude);
  objc_msgSend_numberWithUnsignedShort_(v128, v130, v129);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v359[2] = v131;
  v358[3] = CFSTR("SparseRenderer::kRingSharpness_ushort");
  v132 = (void *)MEMORY[0x24BDD16E0];
  v133 = convertFloatToF16AsUshort(self->_config_params.ringSharpness);
  objc_msgSend_numberWithUnsignedShort_(v132, v134, v133);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v359[3] = v135;
  v358[4] = CFSTR("SparseRenderer::kFGTraceStepScale_ushort");
  v136 = (void *)MEMORY[0x24BDD16E0];
  v137 = convertFloatToF16AsUshort(self->_config_params.fgTraceStepScale);
  objc_msgSend_numberWithUnsignedShort_(v136, v138, v137);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v359[4] = v139;
  v358[5] = CFSTR("SparseRenderer::kFGHitThreshold_ushort");
  v140 = (void *)MEMORY[0x24BDD16E0];
  v141 = convertFloatToF16AsUshort(self->_config_params.fgHitThreshold);
  objc_msgSend_numberWithUnsignedShort_(v140, v142, v141);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v359[5] = v143;
  v358[6] = CFSTR("SparseRenderer::kFGAlphaSmoothstepStart_ushort");
  v144 = (void *)MEMORY[0x24BDD16E0];
  v145 = convertFloatToF16AsUshort(self->_config_params.fgAlphaSmoothstepStart);
  objc_msgSend_numberWithUnsignedShort_(v144, v146, v145);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v359[6] = v147;
  v358[7] = CFSTR("SparseRenderer::kFGAlphaSmoothstepEnd_ushort");
  v148 = (void *)MEMORY[0x24BDD16E0];
  v149 = convertFloatToF16AsUshort(self->_config_params.fgAlphaSmoothstepEnd);
  objc_msgSend_numberWithUnsignedShort_(v148, v150, v149);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v359[7] = v151;
  v358[8] = CFSTR("SparseRenderer::kFGBlurWeightSmoothstepStart_ushort");
  v152 = (void *)MEMORY[0x24BDD16E0];
  v153 = convertFloatToF16AsUshort(self->_config_params.fgBlurWeightSmoothstepStart);
  objc_msgSend_numberWithUnsignedShort_(v152, v154, v153);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v359[8] = v155;
  v358[9] = CFSTR("SparseRenderer::kFGBlurWeightSmoothstepEnd_ushort");
  v156 = (void *)MEMORY[0x24BDD16E0];
  v157 = convertFloatToF16AsUshort(self->_config_params.fgBlurWeightSmoothstepEnd);
  objc_msgSend_numberWithUnsignedShort_(v156, v158, v157);
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  v359[9] = v159;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v160, (uint64_t)v359, v358, 10);
  v349 = (void *)objc_claimAutoreleasedReturnValue();

  v356[0] = CFSTR("SparseRenderer::kMaxBlur_ushort");
  v161 = (void *)MEMORY[0x24BDD16E0];
  v162 = convertFloatToF16AsUshort(self->_config_params.maxBlur);
  objc_msgSend_numberWithUnsignedShort_(v161, v163, v162);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  v357[0] = v164;
  v356[1] = CFSTR("SparseRenderer::kSharpRadius_ushort");
  v165 = (void *)MEMORY[0x24BDD16E0];
  v166 = convertFloatToF16AsUshort(self->_config_params.sharpRadius);
  objc_msgSend_numberWithUnsignedShort_(v165, v167, v166);
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v357[1] = v168;
  v356[2] = CFSTR("SparseRenderer::kSoftRadius_ushort");
  v169 = (void *)MEMORY[0x24BDD16E0];
  v170 = convertFloatToF16AsUshort(self->_config_params.softRadius);
  objc_msgSend_numberWithUnsignedShort_(v169, v171, v170);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  v357[2] = v172;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v173, (uint64_t)v357, v356, 3);
  v174 = (void *)objc_claimAutoreleasedReturnValue();

  v354[0] = CFSTR("SparseRenderer::kXhlrbTileSize");
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v175, xhlrbTileSize);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  v355[0] = v176;
  v354[1] = CFSTR("SparseRenderer::kXhlrbMaxIntensityThresholdM_ushort");
  v177 = (void *)MEMORY[0x24BDD16E0];
  v178 = convertFloatToF16AsUshort(v11);
  objc_msgSend_numberWithUnsignedShort_(v177, v179, v178);
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  v355[1] = v180;
  v354[2] = CFSTR("SparseRenderer::kXhlrbMaxIntensityThresholdC_ushort");
  v181 = (void *)MEMORY[0x24BDD16E0];
  v182 = convertFloatToF16AsUshort(v14);
  objc_msgSend_numberWithUnsignedShort_(v181, v183, v182);
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  v355[2] = v184;
  v354[3] = CFSTR("SparseRenderer::kXhlrbMinIntensityThresholdM_ushort");
  v185 = (void *)MEMORY[0x24BDD16E0];
  v186 = convertFloatToF16AsUshort(v13);
  objc_msgSend_numberWithUnsignedShort_(v185, v187, v186);
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  v355[3] = v188;
  v354[4] = CFSTR("SparseRenderer::kXhlrbMinIntensityThresholdC_ushort");
  v189 = (void *)MEMORY[0x24BDD16E0];
  v190 = convertFloatToF16AsUshort(v15);
  objc_msgSend_numberWithUnsignedShort_(v189, v191, v190);
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  v355[4] = v192;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v193, (uint64_t)v355, v354, 5);
  v194 = (void *)objc_claimAutoreleasedReturnValue();

  v352 = CFSTR("SparseRenderer::kLocalContrastBias_ushort");
  v195 = (void *)MEMORY[0x24BDD16E0];
  v196 = convertFloatToF16AsUshort(0.0);
  objc_msgSend_numberWithUnsignedShort_(v195, v197, v196);
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  v353 = v198;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v199, (uint64_t)&v353, &v352, 1);
  v200 = (void *)objc_claimAutoreleasedReturnValue();

  v201 = [UniKernel alloc];
  v203 = (UniKernel *)objc_msgSend_initWithName_library_(v201, v202, (uint64_t)CFSTR("sparserendering_preprocess"), self->_library);
  preprocess = self->_preprocess;
  self->_preprocess = v203;

  v206 = self->_preprocess;
  if (!v206)
    sub_24B6ED728();
  objc_msgSend_setPreferredOutputFormat_(v206, v205, (uint64_t)&unk_251C9CB28);
  v207 = [UniKernel alloc];
  v209 = (UniKernel *)objc_msgSend_initWithName_library_(v207, v208, (uint64_t)CFSTR("sparserendering_preprocess_scaled"), self->_library);
  preprocessScaled = self->_preprocessScaled;
  self->_preprocessScaled = v209;

  v212 = self->_preprocessScaled;
  if (!v212)
    sub_24B6ED750();
  objc_msgSend_setPreferredOutputFormat_(v212, v211, (uint64_t)&unk_251C9CB28);
  v213 = [UniHighlightRecovery alloc];
  objc_msgSend_device(self->_mtlQueue, v214, v215);
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  v218 = (UniKernel *)objc_msgSend_initWithDevice_library_constants_(v213, v217, (uint64_t)v216, self->_library, v194);
  highlightRecovery = self->_highlightRecovery;
  self->_highlightRecovery = v218;

  if (!self->_highlightRecovery)
    sub_24B6ED778();
  v220 = [UniKernel alloc];
  v222 = (UniKernel *)objc_msgSend_initWithName_library_constants_(v220, v221, (uint64_t)CFSTR("sparserendering_prefilter_x"), self->_library, v338);
  prefilterX = self->_prefilterX;
  self->_prefilterX = v222;

  v225 = self->_prefilterX;
  if (!v225)
    sub_24B6ED7A0();
  objc_msgSend_setPreferredOutputFormat_(v225, v224, (uint64_t)&unk_251C9CB40);
  v226 = [UniKernel alloc];
  v228 = (UniKernel *)objc_msgSend_initWithName_library_constants_(v226, v227, (uint64_t)CFSTR("sparserendering_prefilter_y"), self->_library, v338);
  prefilterY = self->_prefilterY;
  self->_prefilterY = v228;

  v231 = self->_prefilterY;
  if (!v231)
    sub_24B6ED7C8();
  objc_msgSend_setPreferredOutputFormat_(v231, v230, (uint64_t)&unk_251C9CB40);
  v232 = [UniKernel alloc];
  v234 = (UniKernel *)objc_msgSend_initWithName_library_constants_(v232, v233, (uint64_t)CFSTR("sparserendering_sample_noAlpha"), self->_library, v351);
  sparseNoAlpha = self->_sparseNoAlpha;
  self->_sparseNoAlpha = v234;

  v237 = self->_sparseNoAlpha;
  if (!v237)
    sub_24B6ED7F0();
  objc_msgSend_setPreferredOutputFormat_(v237, v236, (uint64_t)&unk_251C9CB40);
  v238 = [UniKernel alloc];
  v240 = (UniKernel *)objc_msgSend_initWithName_library_constants_(v238, v239, (uint64_t)CFSTR("sparserendering_sample_noAlpha_ray"), self->_library, v349);
  sparseNoAlphaRayFg = self->_sparseNoAlphaRayFg;
  self->_sparseNoAlphaRayFg = v240;

  v243 = self->_sparseNoAlphaRayFg;
  if (!v243)
    sub_24B6ED818();
  objc_msgSend_setPreferredOutputFormat_(v243, v242, (uint64_t)&unk_251C9CB40);
  v244 = [UniKernel alloc];
  v246 = (UniKernel *)objc_msgSend_initWithName_library_constants_(v244, v245, (uint64_t)CFSTR("sparserendering_sample_withAlpha"), self->_library, v347);
  sparseWithAlpha = self->_sparseWithAlpha;
  self->_sparseWithAlpha = v246;

  v249 = self->_sparseWithAlpha;
  if (!v249)
    sub_24B6ED840();
  objc_msgSend_setPreferredOutputFormat_(v249, v248, (uint64_t)&unk_251C9CB40);
  v250 = [UniKernel alloc];
  v252 = (UniKernel *)objc_msgSend_initWithName_library_(v250, v251, (uint64_t)CFSTR("gainmapMultiply_scaled"), self->_library);
  gainmapMultiply = self->_gainmapMultiply;
  self->_gainmapMultiply = v252;

  v255 = self->_gainmapMultiply;
  if (!v255)
    sub_24B6ED868();
  objc_msgSend_setPreferredOutputFormat_(v255, v254, (uint64_t)&unk_251C9CB58);
  v256 = [UniKernel alloc];
  v258 = (UniKernel *)objc_msgSend_initWithName_library_(v256, v257, (uint64_t)CFSTR("gainmapMultiply_rgb_scaled"), self->_library);
  gainmapRGBMultiply = self->_gainmapRGBMultiply;
  self->_gainmapRGBMultiply = v258;

  if (!self->_gainmapMultiply)
    sub_24B6ED890();
  objc_msgSend_setPreferredOutputFormat_(self->_gainmapRGBMultiply, v260, (uint64_t)&unk_251C9CB58);
  v261 = [UniKernel alloc];
  v263 = (UniKernel *)objc_msgSend_initWithName_library_constants_(v261, v262, (uint64_t)CFSTR("sparserendering_antialias_x"), self->_library, v337);
  antialiasX = self->_antialiasX;
  self->_antialiasX = v263;

  v266 = self->_antialiasX;
  if (!v266)
    sub_24B6ED8B8();
  objc_msgSend_setPreferredOutputFormat_(v266, v265, (uint64_t)&unk_251C9CB40);
  v267 = [UniKernel alloc];
  v269 = (UniKernel *)objc_msgSend_initWithName_library_constants_(v267, v268, (uint64_t)CFSTR("sparserendering_antialias_y"), self->_library, v336);
  antialiasY = self->_antialiasY;
  self->_antialiasY = v269;

  v272 = self->_antialiasY;
  if (!v272)
    sub_24B6ED8E0();
  objc_msgSend_setPreferredOutputFormat_(v272, v271, (uint64_t)&unk_251C9CB40);
  v273 = [UniKernel alloc];
  v275 = (UniKernel *)objc_msgSend_initWithName_library_(v273, v274, (uint64_t)CFSTR("sparserendering_antialias_x_4chan"), self->_library);
  antialiasRGBAX = self->_antialiasRGBAX;
  self->_antialiasRGBAX = v275;

  v278 = self->_antialiasRGBAX;
  if (!v278)
    sub_24B6ED908();
  objc_msgSend_setPreferredOutputFormat_(v278, v277, (uint64_t)&unk_251C9CB40);
  v279 = [UniKernel alloc];
  v281 = (UniKernel *)objc_msgSend_initWithName_library_constants_(v279, v280, (uint64_t)CFSTR("sparserendering_antialias_y_4chan"), self->_library, v345);
  antialiasRGBAY = self->_antialiasRGBAY;
  self->_antialiasRGBAY = v281;

  v284 = self->_antialiasRGBAY;
  if (!v284)
    sub_24B6ED930();
  objc_msgSend_setPreferredOutputFormat_(v284, v283, (uint64_t)&unk_251C9CB40);
  v285 = [UniKernel alloc];
  v287 = (UniKernel *)objc_msgSend_initWithName_library_constants_(v285, v286, (uint64_t)CFSTR("sparserendering_add_noise_only"), self->_library, v345);
  addNoiseOnly = self->_addNoiseOnly;
  self->_addNoiseOnly = v287;

  v290 = self->_addNoiseOnly;
  if (!v290)
    sub_24B6ED958();
  objc_msgSend_setPreferredOutputFormat_(v290, v289, (uint64_t)&unk_251C9CB40);
  v291 = [UniKernel alloc];
  v293 = (UniKernel *)objc_msgSend_initWithName_library_constants_(v291, v292, (uint64_t)CFSTR("sparserendering_yuv_out_1"), self->_library, v344);
  yuv1 = self->_yuv1;
  self->_yuv1 = v293;

  v296 = self->_yuv1;
  if (!v296)
    sub_24B6ED980();
  objc_msgSend_setPreferredOutputFormat_(v296, v295, (uint64_t)&unk_251C9CB28);
  v297 = [UniKernel alloc];
  v299 = (UniKernel *)objc_msgSend_initWithName_library_(v297, v298, (uint64_t)CFSTR("sparserendering_yuv_out_2"), self->_library);
  yuv2 = self->_yuv2;
  self->_yuv2 = v299;

  objc_msgSend_setPreferredOutputFormat_(self->_yuv2, v301, (uint64_t)&unk_251C9CB28);
  if (!self->_yuv2)
    sub_24B6ED9A8();
  v302 = [UniKernel alloc];
  v304 = (UniKernel *)objc_msgSend_initWithName_library_constants_(v302, v303, (uint64_t)CFSTR("sparserendering_localContrast"), self->_library, v200);
  localContrast = self->_localContrast;
  self->_localContrast = v304;

  objc_msgSend_setPreferredOutputFormat_(self->_localContrast, v306, (uint64_t)&unk_251C9CB70);
  if (!self->_localContrast)
    sub_24B6ED9D0();
  v307 = [UniKernel alloc];
  v309 = (UniKernel *)objc_msgSend_initWithName_library_(v307, v308, (uint64_t)CFSTR("disparity_refinement_extract_positive_blur_values"), self->_library);
  extractPositiveBlurValues = self->_extractPositiveBlurValues;
  self->_extractPositiveBlurValues = v309;

  v312 = self->_extractPositiveBlurValues;
  if (!v312)
    sub_24B6ED9F8();
  objc_msgSend_setPreferredOutputFormat_(v312, v311, (uint64_t)&unk_251C9CB70);
  v313 = [UniKernel alloc];
  v315 = (UniKernel *)objc_msgSend_initWithName_library_(v313, v314, (uint64_t)CFSTR("disparity_refinement_extract_negative_blur_values"), self->_library);
  extractNegativeBlurValues = self->_extractNegativeBlurValues;
  self->_extractNegativeBlurValues = v315;

  v318 = self->_extractNegativeBlurValues;
  if (!v318)
    sub_24B6EDA20();
  objc_msgSend_setPreferredOutputFormat_(v318, v317, (uint64_t)&unk_251C9CB70);
  v319 = [UniMorphology alloc];
  objc_msgSend_device(self->_mtlQueue, v320, v321);
  v322 = (void *)objc_claimAutoreleasedReturnValue();
  v324 = (UniMorphology *)objc_msgSend_initWithDevice_(v319, v323, (uint64_t)v322);
  morphology = self->_morphology;
  self->_morphology = v324;

  objc_msgSend_setPreferredOutputFormat_(self->_morphology, v326, (uint64_t)&unk_251C9CB58);
  if (!self->_morphology)
    sub_24B6EDA48();
  v327 = [UniKernel alloc];
  v329 = (UniKernel *)objc_msgSend_initWithName_library_constants_(v327, v328, (uint64_t)CFSTR("sparserendering_blend_raytraced"), self->_library, v174);
  blendRaytraced = self->_blendRaytraced;
  self->_blendRaytraced = v329;

  v332 = self->_blendRaytraced;
  if (!v332)
    sub_24B6EDA70();
  objc_msgSend_setPreferredOutputFormat_(v332, v331, (uint64_t)&unk_251C9CB40);
  objc_msgSend__setROICallbacks(self, v333, v334);

  return 0;
}

- (__int16)computeDynamicParams
{
  float v2;
  float v3;
  BOOL v4;
  float v5;
  float v6;
  float v7;
  __int16 result;

  v2 = *(float *)(a1 + 216);
  v3 = *(float *)(a1 + 220);
  v4 = v3 <= 0.0 || v2 <= 0.0;
  v5 = v3 / v2;
  if (v4)
    v5 = 1.0;
  v6 = *(float *)(a1 + 232);
  v7 = (float)(*(float *)(a1 + 316) * v5) / v6;
  _S3 = 1.0 / (float)((float)((float)(*(float *)(a1 + 320) * v5) / v6) - v7);
  _S2 = -(float)(_S3 * v7);
  _S0 = v5 * *(float *)(a1 + 292);
  __asm { FCVT            H0, S0 }
  *(_WORD *)a2 = LOWORD(_S0);
  __asm { FCVT            H0, S3 }
  *(_WORD *)(a2 + 2) = LOWORD(_S0);
  __asm { FCVT            H0, S2 }
  *(_WORD *)(a2 + 4) = LOWORD(_S0);
  *(float16x4_t *)(a2 + 6) = vcvt_f16_f32(*(float32x4_t *)(a1 + 340));
  _S0 = *(_DWORD *)(a1 + 356);
  __asm { FCVT            H0, S0 }
  *(_WORD *)(a2 + 14) = _S0;
  _S0 = *(_DWORD *)(a1 + 360);
  __asm { FCVT            H0, S0 }
  *(_WORD *)(a2 + 16) = _S0;
  _S0 = *(_DWORD *)(a1 + 248);
  __asm { FCVT            H0, S0 }
  *(_WORD *)(a2 + 18) = _S0;
  _S0 = sqrtf(4.0 / fminf(fmaxf(*(float *)(a1 + 368), 1.0), 4.0));
  __asm { FCVT            H0, S0 }
  *(_WORD *)(a2 + 20) = result;
  return result;
}

- (id)createLocalContrastImage:(id)a3 coreImageRender:(BOOL)a4 morphologicalRadius:(double)a5 inputHalfRes1:(id)a6 inputHalfResRGTex:(id)a7 device:(id)a8 context:(id)a9
{
  return (id)objc_msgSend_null(MEMORY[0x24BDBCEF8], a2, (uint64_t)a3, a4, a6, a7, a8, a9, a5);
}

- (id)erodeAndDilate:(id)a3 radius:(int)a4 coreImageRender:(BOOL)a5 context:(id)a6 extent:(CGRect)a7 pixelFormat:(unint64_t)a8
{
  double height;
  double width;
  double y;
  double x;
  id v17;
  const char *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  UniFakeImage *v28;
  const char *v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  void *v39;
  UniKernel *extractNegativeBlurValues;
  void *v41;
  const char *v42;
  void *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  UniMorphology *morphology;
  void *v48;
  void *v49;
  uint64_t v50;
  const char *v51;
  id v52;
  void *v53;
  const char *v54;
  void *v55;
  const char *v56;
  void *v57;
  UniMorphology *v58;
  const char *v59;
  void *v60;
  const char *v61;
  void *v62;
  const char *v63;
  void *v64;
  const char *v65;
  int v66;
  void *v67;
  unint64_t v68;
  void *v69;
  id v71;
  void *v72;
  _QWORD v73[2];
  _QWORD v74[5];
  _QWORD v75[5];
  _QWORD v76[5];
  _QWORD v77[5];
  _QWORD v78[3];
  _QWORD v79[3];
  _QWORD v80[3];
  _QWORD v81[4];

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v81[2] = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  v20 = a6;
  if (v17 && a4 > 0)
  {
    if (a5)
    {
      v21 = (void *)MEMORY[0x24BDBF660];
      objc_msgSend_blackColor(MEMORY[0x24BDBF638], v18, v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_imageWithColor_(v21, v23, (uint64_t)v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_imageByCroppingToRect_(v24, v25, v26, x, y, width, height);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = [UniFakeImage alloc];
      v30 = (void *)objc_msgSend_initWithCIImage_format_(v28, v29, (uint64_t)v27, a8);
      v80[0] = v30;
      v80[1] = v30;
      v80[2] = v30;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v31, (uint64_t)v80, 3);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      tmpTexturesFromTexture(v17, 3u, a8);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }
    extractNegativeBlurValues = self->_extractNegativeBlurValues;
    v79[0] = v17;
    v78[0] = CFSTR("signedBlurMapTex");
    v78[1] = CFSTR("outputBlurMapTex");
    objc_msgSend_objectAtIndexedSubscript_(v32, v33, 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v78[2] = CFSTR("_renderContext");
    v79[1] = v41;
    v79[2] = v20;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v42, (uint64_t)v79, v78, 3);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageByApplyingParameters_(extractNegativeBlurValues, v44, (uint64_t)v43);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v72 = v32;
    if (v34)
    {
      v71 = v17;
      morphology = self->_morphology;
      v77[0] = v34;
      v76[0] = CFSTR("inputImage");
      v76[1] = CFSTR("outputImage");
      objc_msgSend_objectAtIndexedSubscript_(v32, v45, 1);
      v48 = v32;
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v77[1] = v49;
      v76[2] = CFSTR("inputRadius");
      v50 = (2 * a4) | 1u;
      objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v51, v50);
      v52 = v20;
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v77[2] = v53;
      v77[3] = &unk_251C9CBA0;
      v76[3] = CFSTR("inputDoMin");
      v76[4] = CFSTR("_renderContext");
      v77[4] = v52;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v54, (uint64_t)v77, v76, 5);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_imageByApplyingParameters_(morphology, v56, (uint64_t)v55);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = v52;
      v58 = self->_morphology;
      v75[0] = v34;
      v74[0] = CFSTR("inputImage");
      v74[1] = CFSTR("outputImage");
      objc_msgSend_objectAtIndexedSubscript_(v48, v59, 2);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v75[1] = v60;
      v74[2] = CFSTR("inputRadius");
      objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v61, v50);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v75[2] = v62;
      v75[3] = &unk_251C9CB88;
      v74[3] = CFSTR("inputDoMin");
      v74[4] = CFSTR("_renderContext");
      v75[4] = v52;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v63, (uint64_t)v75, v74, 5);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_imageByApplyingParameters_(v58, v65, (uint64_t)v64);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (v57)
      {
        v66 = 0;
        v67 = v57;
        v68 = 0x24BDBC000;
        v17 = v71;
        goto LABEL_13;
      }
      v68 = 0x24BDBC000uLL;
      v17 = v71;
    }
    else
    {
      v37 = 0;
      v68 = 0x24BDBC000;
    }
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v45, v46);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0;
    v66 = 1;
LABEL_13:
    v73[0] = v67;
    v69 = v37;
    if (!v37)
    {
      objc_msgSend_null(MEMORY[0x24BDBCEF8], v45, v46);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v73[1] = v69;
    objc_msgSend_arrayWithObjects_count_(*(void **)(v68 + 3632), v45, (uint64_t)v73, 2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      if (!v66)
      {
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {

      if (!v66)
        goto LABEL_18;
    }

    goto LABEL_18;
  }
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v18, v19);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v81[0] = v34;
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v81[1] = v37;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v38, (uint64_t)v81, 2);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

  return v39;
}

- (id)gainMapToLightMap:(id)a3 inputImage:(id)a4 inputLuma:(id)a5 inputChroma:(id)a6 headroom:(float)a7 context:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  UniFakeImage *v37;
  const char *v38;
  UniKernel *gainmapRGBMultiply;
  void *v40;
  id v41;
  double v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  void *v47;
  id v48;
  double v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  void *v53;
  const char *v54;
  void *v55;
  _QWORD v57[6];
  _QWORD v58[6];
  _QWORD v59[5];
  _QWORD v60[6];

  v60[5] = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  if (objc_msgSend_conformsToProtocol_(v14, v19, (uint64_t)&unk_2579B9140))
  {
    tmpTexturesFromTexture(v14, 1u, 25);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v20, v21, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_texture(v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v26 = sub_24B6BB644(v14);
    v28 = v27;
    v29 = (void *)MEMORY[0x24BDBF660];
    objc_msgSend_blackColor(MEMORY[0x24BDBF638], v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageWithColor_(v29, v33, (uint64_t)v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageByCroppingToRect_(v34, v35, v36, 0.0, 0.0, v26, v28);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = [UniFakeImage alloc];
    v25 = (void *)objc_msgSend_initWithCIImage_format_(v37, v38, (uint64_t)v20, 25);
  }

  if (v15)
  {
    gainmapRGBMultiply = self->_gainmapRGBMultiply;
    v59[0] = CFSTR("inputRGBTex");
    v59[1] = CFSTR("inputGainMapTex");
    v60[0] = v15;
    v60[1] = v14;
    v60[2] = v25;
    v59[2] = CFSTR("outputTex");
    v59[3] = CFSTR("headroom");
    v40 = (void *)MEMORY[0x24BDD16E0];
    v41 = v14;
    *(float *)&v42 = a7;
    objc_msgSend_numberWithFloat_(v40, v43, v44, v42);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v59[4] = CFSTR("_renderContext");
    v60[3] = v45;
    v60[4] = v18;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v46, (uint64_t)v60, v59, 5);
  }
  else
  {
    gainmapRGBMultiply = self->_gainmapMultiply;
    v57[0] = CFSTR("inputLumaTex");
    v57[1] = CFSTR("inputChromaTex");
    v58[0] = v16;
    v58[1] = v17;
    v57[2] = CFSTR("inputGainMapTex");
    v57[3] = CFSTR("outputTex");
    v58[2] = v14;
    v58[3] = v25;
    v57[4] = CFSTR("headroom");
    v47 = (void *)MEMORY[0x24BDD16E0];
    v48 = v14;
    *(float *)&v49 = a7;
    objc_msgSend_numberWithFloat_(v47, v50, v51, v49);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v57[5] = CFSTR("_renderContext");
    v58[4] = v45;
    v58[5] = v18;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v52, (uint64_t)v58, v57, 6);
  }
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_imageByApplyingParameters_(gainmapRGBMultiply, v54, (uint64_t)v53);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  return v55;
}

- (id)applyBackgroundUsingConfig:(const rendering_config_params *)a3 inputBlurMap:(id)a4 inputAlpha:(id)a5 inputGainMap:(id)a6 inputImage:(id)a7 inputLuma:(id)a8 inputChroma:(id)a9 inputHalfRes1:(id)a10 inputHalfRes2:(id)a11 scale:(float)a12 coreImageRender:(BOOL)a13 version:(int)a14 context:(id)a15 captureFolderMiscPath:(id)a16
{
  id v22;
  const rendering_config_params *v23;
  void *v24;
  void (**v25)(_QWORD);
  const char *v26;
  const char *v27;
  id v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  void *v33;
  BOOL v34;
  int v35;
  BOOL v36;
  BOOL v37;
  BOOL v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _BOOL4 v47;
  _BOOL4 v49;
  _BOOL4 v50;
  float v52;
  id v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  float v66;
  float v67;
  const char *v68;
  uint64_t v69;
  float v70;
  float v71;
  float v72;
  float v73;
  NSObject *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  double v82;
  const char *v83;
  const char *v84;
  uint64_t v85;
  const char *v86;
  const char *v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  UniRunInfo *v97;
  float64x2_t v98;
  const char *v104;
  const char *v105;
  uint64_t v106;
  id v107;
  double v108;
  double v109;
  void *v110;
  CGColorSpace *v111;
  const char *v112;
  void *v113;
  const char *v114;
  void *v115;
  id v116;
  const char *v117;
  uint64_t v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  const char *v127;
  void *v128;
  const char *v129;
  void *v130;
  const char *v131;
  void *v132;
  double v133;
  double v134;
  double v135;
  const char *v136;
  double v137;
  UniKernel *preprocess;
  const char *v139;
  uint64_t v140;
  UniKernel *preprocessScaled;
  const char *v142;
  const char *v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  void *v147;
  const char *v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  void *v152;
  id v153;
  const char *v154;
  uint64_t v155;
  double v156;
  UniKernel *highlightRecovery;
  void *v158;
  const char *v159;
  void *v160;
  void *v161;
  const char *v162;
  void *v163;
  const char *v164;
  void *v165;
  id v166;
  UniKernel *prefilterX;
  void *v168;
  double v169;
  const char *v170;
  uint64_t v171;
  void *v172;
  const char *v173;
  void *v174;
  const char *v175;
  void *v176;
  UniKernel *prefilterY;
  void *v178;
  double v179;
  const char *v180;
  uint64_t v181;
  void *v182;
  const char *v183;
  void *v184;
  const char *v185;
  UniKernel *sparseWithAlpha;
  void *v187;
  const char *v188;
  const char *v189;
  uint64_t v190;
  void *v191;
  void *v192;
  void *v193;
  const char *v194;
  void *v195;
  const char *v196;
  void *v197;
  const char *v198;
  int v199;
  UniKernel *sparseNoAlpha;
  void *v201;
  const char *v202;
  const char *v203;
  uint64_t v204;
  void *v205;
  void *v206;
  void *v207;
  const char *v208;
  void *v209;
  const char *v210;
  UniKernel *antialiasX;
  void *v212;
  double v213;
  const char *v214;
  uint64_t v215;
  void *v216;
  const char *v217;
  void *v218;
  const char *v219;
  void *v220;
  UniKernel *antialiasY;
  void *v222;
  double v223;
  const char *v224;
  uint64_t v225;
  void *v226;
  const char *v227;
  void *v228;
  const char *v229;
  void *v230;
  id v231;
  id v233;
  void *v234;
  id v235;
  id v236;
  id v237;
  UniTextureView *v238;
  UniTextureView *v239;
  double v240;
  double v241;
  id v242;
  void *v243;
  id v244;
  id v245;
  void *v246;
  id v247;
  void *v248;
  id v249;
  id v250;
  uint64x2_t v252;
  uint64_t v253;
  uint64_t v254;
  _QWORD v255[2];
  float gainMapHeadroom;
  _QWORD v257[7];
  _QWORD v258[3];
  int v259;
  uint64_t v260;
  uint64_t *v261;
  uint64_t v262;
  uint64_t (*v263)(uint64_t, uint64_t);
  void (*v264)(uint64_t);
  id v265;
  uint64_t v266;
  uint64_t *v267;
  uint64_t v268;
  uint64_t (*v269)(uint64_t, uint64_t);
  void (*v270)(uint64_t);
  id v271;
  float v272;
  _QWORD v273[5];
  _QWORD v274[5];
  _QWORD v275[4];
  _QWORD v276[4];
  _QWORD v277[7];
  _QWORD v278[7];
  _QWORD v279[8];
  _QWORD v280[8];
  _QWORD v281[5];
  _QWORD v282[5];
  _QWORD v283[5];
  _QWORD v284[5];
  _QWORD v285[6];
  _QWORD v286[6];
  _QWORD v287[3];
  _QWORD v288[3];
  _QWORD v289[3];
  _QWORD v290[3];
  _QWORD v291[5];
  _QWORD v292[5];
  _QWORD v293[5];
  _QWORD v294[5];
  _QWORD v295[4];

  v295[2] = *MEMORY[0x24BDAC8D0];
  v242 = a4;
  v22 = a5;
  v249 = a6;
  v236 = a7;
  v235 = a8;
  v245 = a9;
  v247 = a10;
  v237 = a11;
  v250 = a15;
  v233 = a16;
  v234 = v22;
  if (v22)
  {
    v23 = a3;
    if (a3->alphaGain <= 0.0)
    {
      v24 = 0;
    }
    else
    {
      v24 = v22;
      if (a3->alphaEpsilon >= 1.0)
        v24 = 0;
    }
  }
  else
  {
    v24 = 0;
    v23 = a3;
  }
  v244 = v24;
  v239 = objc_alloc_init(UniTextureView);
  v238 = objc_alloc_init(UniTextureView);
  v266 = 0;
  v267 = &v266;
  v268 = 0x3032000000;
  v269 = sub_24B6BC9EC;
  v270 = sub_24B6BC9FC;
  v271 = 0;
  v260 = 0;
  v261 = &v260;
  v262 = 0x3032000000;
  v263 = sub_24B6BC9EC;
  v264 = sub_24B6BC9FC;
  v265 = 0;
  v258[0] = 0;
  v258[1] = v258;
  v258[2] = 0x2020000000;
  v259 = 0;
  v257[0] = MEMORY[0x24BDAC760];
  v257[1] = 3221225472;
  v257[2] = sub_24B6BCA04;
  v257[3] = &unk_251C8F328;
  v257[4] = v258;
  v257[5] = &v266;
  v257[6] = &v260;
  v25 = (void (**)(_QWORD))MEMORY[0x24BD259B4](v257);
  if (objc_msgSend_setOptions_isPrewarm_(self, v26, (uint64_t)v23, 0))
  {
    syslog(3, "err error, (%s) at %s:%d", "-[ApplyBlurmap applyBackgroundUsingConfig:inputBlurMap:inputAlpha:inputGainMap:inputImage:inputLuma:inputChroma:inputHalfRes1:inputHalfRes2:scale:coreImageRender:version:context:captureFolderMiscPath:]", "/Library/Caches/com.apple.xbs/Sources/CameraCapture/VideoProcessors/Portrait/CCPortrait/ApplyBlurmap.m", 1957);
LABEL_100:
    v246 = 0;
    v243 = 0;
    v248 = 0;
    v230 = 0;
    goto LABEL_97;
  }
  gainMapHeadroom = 0.0;
  if (v249 && a14 >= 7)
  {
    v28 = v249;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_properties(v28, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v31, v32, *MEMORY[0x24BDD91D0]);
    }
    else
    {
      v31 = 0;
      objc_msgSend_objectForKeyedSubscript_(0, v29, *MEMORY[0x24BDD91D0]);
    }
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v272 = 0.0;
    v34 = sub_24B6BF704((const CGImageMetadata *)v33, CFSTR("HDRGainMap:HDRGainMapVersion"), &v272);
    v35 = LODWORD(v272);
    v272 = 0.0;
    v36 = sub_24B6BF704((const CGImageMetadata *)v33, CFSTR("HDRToneMap:Version"), &v272);
    v37 = v35 >= 0x20000 && v34;
    v38 = SLODWORD(v272) > 0 && v36;
    if (!v37 && !v38)
    {
      uni_logger_api();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        sub_24B6EDB0C(v39, v40, v41, v42, v43, v44, v45, v46);

      v249 = v28;
LABEL_61:

      goto LABEL_62;
    }
    gainMapHeadroom = v23->gainMapHeadroom;
    if (gainMapHeadroom != 0.0)
    {
LABEL_58:

      *(float *)&v82 = gainMapHeadroom;
      if (gainMapHeadroom < 1.0)
      {
        v249 = v28;
        goto LABEL_62;
      }
      objc_msgSend_gainMapToLightMap_inputImage_inputLuma_inputChroma_headroom_context_(self, v27, (uint64_t)v28, v236, v235, v245, v250, v82);
      v249 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_61;
    }
    if (v33)
    {
      v272 = 0.0;
      v47 = sub_24B6BF704((const CGImageMetadata *)v33, CFSTR("HDRGainMap:HDRGainMapVersion"), &v272);
      v49 = SLODWORD(v272) >= 0x20000
         && v47
         && sub_24B6BF828((const CGImageMetadata *)v33, CFSTR("HDRGainMap::HDRGainMapHeadroom"), &gainMapHeadroom);
      v272 = 0.0;
      v50 = sub_24B6BF704((const CGImageMetadata *)v33, CFSTR("HDRToneMap:Version"), &v272);
      if (SLODWORD(v272) > 0 && v50)
      {
        v272 = 0.0;
        v49 = sub_24B6BF828((const CGImageMetadata *)v33, CFSTR("HDRToneMap:AlternateHeadroom"), &v272);
        if (v49)
          gainMapHeadroom = exp2f(v272);
      }
      if (v49)
      {
        v52 = gainMapHeadroom;
        if (gainMapHeadroom != 0.0)
        {
LABEL_54:
          if (v52 == 0.0)
          {
            uni_logger_api();
            v74 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
              sub_24B6EDA98(v74, v75, v76, v77, v78, v79, v80, v81);

          }
          goto LABEL_58;
        }
      }
    }
    v53 = v236;
    objc_msgSend_properties(v53, v54, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_valueForKeyPath_(v56, v57, (uint64_t)CFSTR("{MakerApple}.33"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    v52 = 0.0;
    if (v58)
    {
LABEL_53:

      gainMapHeadroom = v52;
      goto LABEL_54;
    }
    objc_msgSend_properties(v53, v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_valueForKeyPath_(v61, v62, (uint64_t)CFSTR("{MakerApple}.48"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    if (v63)
    {
LABEL_52:

      goto LABEL_53;
    }
    objc_msgSend_floatValue(0, v64, v65);
    v67 = v66;
    objc_msgSend_floatValue(0, v68, v69);
    if (v67 >= 1.0)
    {
      if (v70 <= 0.01)
      {
        v73 = (float)(v70 * -70.0) + 3.0;
        goto LABEL_51;
      }
      v71 = 2.303;
      v72 = -0.303;
    }
    else if (v70 <= 0.01)
    {
      v71 = 1.8;
      v72 = -20.0;
    }
    else
    {
      v71 = 1.601;
      v72 = -0.101;
    }
    v73 = v71 + (float)(v70 * v72);
LABEL_51:
    v52 = exp2f(v73);
    goto LABEL_52;
  }
LABEL_62:
  if (objc_msgSend_setOptions_isPrewarm_(self, v27, (uint64_t)v23, 0))
  {
    syslog(3, "err error, (%s) at %s:%d", "-[ApplyBlurmap applyBackgroundUsingConfig:inputBlurMap:inputAlpha:inputGainMap:inputImage:inputLuma:inputChroma:inputHalfRes1:inputHalfRes2:scale:coreImageRender:version:context:captureFolderMiscPath:]", "/Library/Caches/com.apple.xbs/Sources/CameraCapture/VideoProcessors/Portrait/CCPortrait/ApplyBlurmap.m", 2012);
    goto LABEL_100;
  }
  objc_msgSend_imageWithObject_(UniImage, v83, (uint64_t)v242);
  v246 = (void *)objc_claimAutoreleasedReturnValue();
  v254 = 0;
  v255[0] = 0;
  *(_QWORD *)((char *)v255 + 6) = 0;
  objc_msgSend_computeDynamicParams(self, v84, v85);
  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v86, (uint64_t)&v254, 22);
  v248 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_imageWithObject_(UniImage, v87, (uint64_t)v247);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_extent(v88, v89, v90);
  v240 = v91;
  v241 = v92;
  v94 = v93;
  v96 = v95;

  v97 = [UniRunInfo alloc];
  v98.f64[0] = v240;
  v98.f64[1] = v241;
  __asm { FMOV            V1.2D, #0.5 }
  v252 = vcvtq_u64_f64(vmulq_f64(v98, _Q1));
  v253 = 1;
  v243 = (void *)objc_msgSend_initWithGridSize_kernel_(v97, v104, (uint64_t)&v252, self->_preprocess);
  objc_msgSend_setCoreImageOutputExtent_(v243, v105, v106, v94, v96, v240, v241);
  if (a13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v107 = v236;
    v108 = sub_24B6BB644(v246);
    sub_24B6BCA44(v107, v108, v109, v23->bicubicDownsampleParamB, v23->bicubicDownsampleParamC);
    v110 = (void *)objc_claimAutoreleasedReturnValue();

    v111 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF228]);
    objc_msgSend_imageByColorMatchingWorkingSpaceToColorSpace_(v110, v112, (uint64_t)v111);
    v113 = (void *)objc_claimAutoreleasedReturnValue();

    CGColorSpaceRelease(v111);
    objc_msgSend_colorKernelWithName_(CoreImageOnlyLibrary, v114, (uint64_t)CFSTR("ccp_preprocess"));
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = v242;
    objc_msgSend_extent(v116, v117, v118);
    v120 = v119;
    v122 = v121;
    v124 = v123;
    v126 = v125;
    v295[0] = v113;
    v295[1] = v116;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v127, (uint64_t)v295, 2);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applyWithExtent_arguments_(v115, v129, (uint64_t)v128, v120, v122, v124, v126);
    v130 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_imageWithCIImage_(UniImage, v131, (uint64_t)v130);
    v132 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v133 = sub_24B6BB644(v246);
    v135 = v134;
    if (v133 == sub_24B6BB644(v245) && v135 == v137)
    {
      preprocess = self->_preprocess;
      v293[0] = CFSTR("inputLumaTex");
      v293[1] = CFSTR("inputChromaTex");
      v294[0] = v235;
      v294[1] = v245;
      v293[2] = CFSTR("inputBlurMapTex");
      v294[2] = v246;
      v294[3] = v247;
      v293[3] = CFSTR("outputTex");
      v293[4] = CFSTR("_renderContext");
      v294[4] = v250;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v136, (uint64_t)v294, v293, 5);
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_imageByApplyingParameters_runInfo_(preprocess, v139, (uint64_t)v130, v243);
      v140 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      preprocessScaled = self->_preprocessScaled;
      v291[0] = CFSTR("inputLumaTex");
      v291[1] = CFSTR("inputChromaTex");
      v292[0] = v235;
      v292[1] = v245;
      v291[2] = CFSTR("inputBlurMapTex");
      v291[3] = CFSTR("outputTex");
      v292[2] = v246;
      v292[3] = v247;
      v291[4] = CFSTR("_renderContext");
      v292[4] = v250;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v136, (uint64_t)v292, v291, 5);
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_imageByApplyingParameters_(preprocessScaled, v142, (uint64_t)v130);
      v140 = objc_claimAutoreleasedReturnValue();
    }
    v132 = (void *)v140;
  }

  if (!v132)
  {
    v198 = "image";
    v199 = 2071;
    goto LABEL_110;
  }
  v289[0] = CFSTR("inputImage");
  v289[1] = CFSTR("_renderContext");
  v290[0] = v132;
  v290[1] = v250;
  v289[2] = CFSTR("desiredFormat");
  v290[2] = &unk_251C9CB40;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v143, (uint64_t)v290, v289, 3);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_imageByApplyingParameters_(v239, v145, (uint64_t)v144);
  v146 = objc_claimAutoreleasedReturnValue();
  v147 = (void *)v267[5];
  v267[5] = v146;

  if (!v267[5])
  {
    v198 = "image1As_sRGB";
    v199 = 2081;
    goto LABEL_110;
  }
  v287[0] = CFSTR("inputImage");
  v287[1] = CFSTR("_renderContext");
  v288[0] = v237;
  v288[1] = v250;
  v287[2] = CFSTR("desiredFormat");
  v288[2] = &unk_251C9CB40;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v148, (uint64_t)v288, v287, 3);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_imageByApplyingParameters_(v238, v150, (uint64_t)v149);
  v151 = objc_claimAutoreleasedReturnValue();
  v152 = (void *)v261[5];
  v261[5] = v151;

  if (!v261[5])
  {
    v198 = "image2As_sRGB";
    v199 = 2088;
    goto LABEL_110;
  }
  v153 = (id)v267[5];

  if (v23->xhlrbIterations >= 1)
  {
    highlightRecovery = self->_highlightRecovery;
    v285[0] = *MEMORY[0x24BDBF988];
    *(float *)&v156 = a12;
    objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v154, v155, v156);
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    v286[0] = v158;
    v285[1] = CFSTR("inputIterations");
    objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v159, v23->xhlrbIterations);
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    v286[1] = v160;
    v286[2] = v248;
    v285[2] = CFSTR("dynamic_params");
    v285[3] = CFSTR("inputImage");
    v286[3] = v153;
    v285[4] = CFSTR("outputImage");
    v25[2](v25);
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    v285[5] = CFSTR("_renderContext");
    v286[4] = v161;
    v286[5] = v250;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v162, (uint64_t)v286, v285, 6);
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageByApplyingParameters_(highlightRecovery, v164, (uint64_t)v163);
    v165 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v165)
    {
      v198 = "image";
      v199 = 2129;
      goto LABEL_110;
    }
    if (a13)
    {
      v153 = v165;
    }
    else
    {
      v166 = (id)((uint64_t (*)(_QWORD))v25[2])(v25);
      v153 = (id)v267[5];

    }
  }
  if (v23->preFilterRadius >= 1 && v23->preFilterBlurStrength > 0.0)
  {
    prefilterX = self->_prefilterX;
    v283[0] = CFSTR("dynamic_params");
    v283[1] = CFSTR("inputTex");
    v284[0] = v248;
    v284[1] = v153;
    v283[2] = CFSTR("outputTex");
    v25[2](v25);
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    v284[2] = v168;
    v284[3] = v250;
    v283[3] = CFSTR("_renderContext");
    v283[4] = CFSTR("_kernelScale");
    *(float *)&v169 = a12;
    objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v170, v171, v169);
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    v284[4] = v172;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v173, (uint64_t)v284, v283, 5);
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageByApplyingParameters_(prefilterX, v175, (uint64_t)v174);
    v176 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v176)
    {
      v198 = "image";
      v199 = 2153;
      goto LABEL_110;
    }
    prefilterY = self->_prefilterY;
    v281[0] = CFSTR("dynamic_params");
    v281[1] = CFSTR("inputTex");
    v282[0] = v248;
    v282[1] = v176;
    v281[2] = CFSTR("outputTex");
    v25[2](v25);
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    v282[2] = v178;
    v282[3] = v250;
    v281[3] = CFSTR("_renderContext");
    v281[4] = CFSTR("_kernelScale");
    *(float *)&v179 = a12;
    objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v180, v181, v179);
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    v282[4] = v182;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v183, (uint64_t)v282, v281, 5);
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageByApplyingParameters_(prefilterY, v185, (uint64_t)v184);
    v153 = (id)objc_claimAutoreleasedReturnValue();

    if (!v153)
    {
      v198 = "image";
      v199 = 2162;
      goto LABEL_110;
    }
  }
  if (!v244)
  {
    sparseNoAlpha = self->_sparseNoAlpha;
    v278[0] = v248;
    v277[0] = CFSTR("dynamic_params");
    v277[1] = CFSTR("segmentStepLUT");
    objc_msgSend_objectAtIndexedSubscript_(self->_segmentArray, v154, 0);
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    v278[1] = v201;
    v277[2] = CFSTR("segmentBaseVecLUT");
    objc_msgSend_objectAtIndexedSubscript_(self->_segmentArray, v202, 1);
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    v278[2] = v205;
    v278[3] = v153;
    v277[3] = CFSTR("inputTex");
    v277[4] = CFSTR("gainTex");
    v206 = v249;
    if (!v249)
    {
      objc_msgSend_null(MEMORY[0x24BDBCEF8], v203, v204);
      v206 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v278[4] = v206;
    v277[5] = CFSTR("outputTex");
    v25[2](v25);
    v207 = (void *)objc_claimAutoreleasedReturnValue();
    v277[6] = CFSTR("_renderContext");
    v278[5] = v207;
    v278[6] = v250;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v208, (uint64_t)v278, v277, 7);
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageByApplyingParameters_(sparseNoAlpha, v210, (uint64_t)v209);
    v197 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v249)
    if (v197)
      goto LABEL_95;
    v198 = "image";
    v199 = 2187;
LABEL_110:
    __assert_rtn("-[ApplyBlurmap applyBackgroundUsingConfig:inputBlurMap:inputAlpha:inputGainMap:inputImage:inputLuma:inputChroma:inputHalfRes1:inputHalfRes2:scale:coreImageRender:version:context:captureFolderMiscPath:]", "ApplyBlurmap.m", v199, v198);
  }
  sparseWithAlpha = self->_sparseWithAlpha;
  v280[0] = v248;
  v279[0] = CFSTR("dynamic_params");
  v279[1] = CFSTR("segmentStepLUT");
  objc_msgSend_objectAtIndexedSubscript_(self->_segmentArray, v154, 0);
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  v280[1] = v187;
  v279[2] = CFSTR("segmentBaseVecLUT");
  objc_msgSend_objectAtIndexedSubscript_(self->_segmentArray, v188, 1);
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  v280[2] = v191;
  v280[3] = v153;
  v279[3] = CFSTR("inputTex");
  v279[4] = CFSTR("gainTex");
  v192 = v249;
  if (!v249)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v189, v190);
    v192 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v280[4] = v192;
  v279[5] = CFSTR("outputTex");
  v25[2](v25);
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  v280[5] = v193;
  v280[6] = v244;
  v279[6] = CFSTR("alphaTex");
  v279[7] = CFSTR("_renderContext");
  v280[7] = v250;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v194, (uint64_t)v280, v279, 8);
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_imageByApplyingParameters_(sparseWithAlpha, v196, (uint64_t)v195);
  v197 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v249)
  if (!v197)
  {
    v198 = "image";
    v199 = 2176;
    goto LABEL_110;
  }
LABEL_95:
  antialiasX = self->_antialiasX;
  v276[0] = v197;
  v275[0] = CFSTR("inputTex");
  v275[1] = CFSTR("outputTex");
  v25[2](v25);
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  v276[1] = v212;
  v276[2] = v250;
  v275[2] = CFSTR("_renderContext");
  v275[3] = CFSTR("_kernelScale");
  *(float *)&v213 = a12;
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v214, v215, v213);
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  v276[3] = v216;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v217, (uint64_t)v276, v275, 4);
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_imageByApplyingParameters_(antialiasX, v219, (uint64_t)v218);
  v220 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v220)
  {
    v198 = "image";
    v199 = 2198;
    goto LABEL_110;
  }
  antialiasY = self->_antialiasY;
  v274[0] = v220;
  v273[0] = CFSTR("inputTex");
  v273[1] = CFSTR("outputTex");
  v25[2](v25);
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  v274[1] = v222;
  v274[2] = v248;
  v273[2] = CFSTR("dynamic_params");
  v273[3] = CFSTR("_renderContext");
  v274[3] = v250;
  v273[4] = CFSTR("_kernelScale");
  *(float *)&v223 = a12;
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v224, v225, v223);
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  v274[4] = v226;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v227, (uint64_t)v274, v273, 5);
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_imageByApplyingParameters_(antialiasY, v229, (uint64_t)v228);
  v230 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v230)
  {
    v198 = "image";
    v199 = 2207;
    goto LABEL_110;
  }
LABEL_97:
  v231 = v230;

  _Block_object_dispose(v258, 8);
  _Block_object_dispose(&v260, 8);

  _Block_object_dispose(&v266, 8);
  return v231;
}

- (id)applyHairnetUsingConfig:(const rendering_config_params *)a3 hairnetParams:(hairnet_params *)a4 inputImage:(id)a5 inputBackBlurImage:(id)a6 inputBlurMap:(id)a7 inputAlpha:(id)a8 scale:(float)a9 coreImageRender:(BOOL)a10 version:(int)a11 context:(id)a12 captureFolderMiscPath:(id)a13
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  const char *v25;
  void *v26;
  const char *v27;
  void *v28;
  id v29;
  id v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  int v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  int v41;
  const char *v42;
  BOOL v43;
  const char *v44;
  uint64_t v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  const char *v54;
  const char *v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  const char *v64;
  uint64_t v65;
  double v66;
  double v67;
  const char *v68;
  void *v69;
  const char *v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  const char *v77;
  double v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  double v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  void *v87;
  const char *v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  void *v93;
  const char *v94;
  CGColorSpaceRef v95;
  unint64_t v96;
  unint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  const char *v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  CGColorSpaceRef v113;
  void *v114;
  const char *v115;
  void *v116;
  void *v117;
  UniKernel *addNoiseOnly;
  void *v119;
  CGColorSpace *space;
  CGColorSpaceRef spacea;
  CGColorSpaceRef spaceb;
  void *v123;
  CGColorSpace *v124;
  id v125;
  void *v126;
  void *v127;
  id v128;
  void *v129;
  id v130;
  void *v131;
  void *v132;
  int v133;
  void *v134;
  void *v135;
  void *v136;
  unsigned int v137;
  void *v138;
  id v139;
  _QWORD v140[2];
  _QWORD v141[2];
  _QWORD v142[2];
  _QWORD v143[4];
  _QWORD v144[4];
  _QWORD v145[3];

  v145[1] = *MEMORY[0x24BDAC8D0];
  v139 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a12;
  v24 = a13;
  objc_msgSend_imageWithCIImage_(UniImage, v25, (uint64_t)v20);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v26;
  if (!a10 || !v22)
  {
    v29 = v26;
    goto LABEL_6;
  }
  if (!objc_msgSend_setOptions_isPrewarm_(self, v27, (uint64_t)a3, 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      sub_24B6EDBA8();
    v31 = v21;
    if (objc_msgSend_outputFormat(v31, v32, v33) == *MEMORY[0x24BDBF890]
      || (v36 = objc_msgSend_outputFormat(v31, v34, v35), v137 = *MEMORY[0x24BDBF8D0], v36 == *MEMORY[0x24BDBF8D0])
      || objc_msgSend_outputFormat(v31, v37, v38) == *MEMORY[0x24BDBF898])
    {

    }
    else
    {
      v133 = objc_msgSend_outputFormat(v31, v39, v40);
      v136 = v31;
      v41 = *MEMORY[0x24BDBF8C8];

      v43 = v133 == v41;
      v31 = v136;
      if (!v43)
      {
        objc_msgSend_colorKernelWithName_andOutputFormat_(CoreImageOnlyLibrary, v42, (uint64_t)CFSTR("ccp_just_inpaint"), v137);
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_extent(v136, v44, v45);
        v47 = v46;
        v49 = v48;
        v51 = v50;
        v53 = v52;
        v145[0] = v136;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v54, (uint64_t)v145, 1);
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_applyWithExtent_arguments_(v134, v55, (uint64_t)v131, v47, v49, v51, v53);
        v138 = (void *)objc_claimAutoreleasedReturnValue();

        if (v138)
        {
          objc_msgSend_hairnetModelPath(self, v56, v57);
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_cachedEspressoWrapper_(EspressoWrapper, v58, (uint64_t)v129);
          v135 = (void *)objc_claimAutoreleasedReturnValue();
          if (v135)
          {
            v130 = v20;
            objc_msgSend_extent(v130, v59, v60);
            objc_msgSend_imageBySettingAlphaOneInExtent_(v130, v61, v62);
            v127 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend_imageByApplyingFilter_(v127, v63, (uint64_t)CFSTR("CILinearToSRGBToneCurve"));
            v132 = (void *)objc_claimAutoreleasedReturnValue();

            v128 = v22;
            v125 = v139;
            objc_msgSend_extent(v132, v64, v65);
            sub_24B6BCA44(v125, v66, v67, a3->bicubicDownsampleParamB, a3->bicubicDownsampleParamC);
            v123 = (void *)objc_claimAutoreleasedReturnValue();

            space = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF228]);
            objc_msgSend_imageByColorMatchingWorkingSpaceToColorSpace_(v123, v68, (uint64_t)space);
            v126 = (void *)objc_claimAutoreleasedReturnValue();

            CGColorSpaceRelease(space);
            ApplyHairnetProcessor(v126, v128, v132, v138, v135, (uint64_t)a4, v24);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_imageByApplyingFilter_(v69, v70, (uint64_t)CFSTR("CISRGBToneCurveToLinear"));
            v124 = (CGColorSpace *)objc_claimAutoreleasedReturnValue();

            if (a3->lumaNoiseAmplitude <= 0.0)
            {
              v96 = 0x251C8E000uLL;
              v97 = 0x24BDBC000uLL;
              v95 = v124;
            }
            else
            {
              addNoiseOnly = self->_addNoiseOnly;
              v144[0] = v124;
              v143[0] = CFSTR("inputTex");
              v143[1] = CFSTR("outputTex");
              objc_msgSend_blackImage(MEMORY[0x24BDBF660], v71, v72);
              spacea = (CGColorSpaceRef)objc_claimAutoreleasedReturnValue();
              objc_msgSend_extent(v124, v73, v74);
              objc_msgSend_imageByCroppingToRect_(spacea, v75, v76);
              v117 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_imageWithCIImage_(UniImage, v77, (uint64_t)v117);
              v116 = (void *)objc_claimAutoreleasedReturnValue();
              v144[1] = v116;
              v143[2] = CFSTR("inputLumaNoiseAmplitude");
              *(float *)&v78 = a3->lumaNoiseAmplitude;
              objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v79, v80, v78);
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              v144[2] = v81;
              v143[3] = CFSTR("_kernelScale");
              *(float *)&v82 = a9;
              objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v83, v84, v82);
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              v144[3] = v85;
              objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v86, (uint64_t)v144, v143, 4);
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_imageByApplyingParameters_(addNoiseOnly, v88, (uint64_t)v87);
              v119 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend_image(v119, v89, v90);
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              v141[0] = CFSTR("inputBackgroundImage");
              v141[1] = CFSTR("inputMaskImage");
              v31 = v136;
              v142[0] = v124;
              v142[1] = v138;
              objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v92, (uint64_t)v142, v141, 2);
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_imageByApplyingFilter_withInputParameters_(v91, v94, (uint64_t)CFSTR("CIBlendWithRedMask"), v93);
              spaceb = (CGColorSpaceRef)objc_claimAutoreleasedReturnValue();

              v95 = spaceb;
              v96 = 0x251C8E000;
              v97 = 0x24BDBC000;
            }
            objc_msgSend_colorKernelWithName_(*(void **)(v96 + 2680), v71, (uint64_t)CFSTR("ccp_copy_alpha"));
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_extent(v95, v99, v100);
            v102 = v101;
            v104 = v103;
            v106 = v105;
            v108 = v107;
            v140[0] = v95;
            v140[1] = v130;
            objc_msgSend_arrayWithObjects_count_(*(void **)(v97 + 3632), v109, (uint64_t)v140, 2);
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_applyWithExtent_arguments_(v98, v111, (uint64_t)v110, v102, v104, v106, v108);
            v112 = objc_claimAutoreleasedReturnValue();
            v113 = v95;
            v114 = (void *)v112;

            objc_msgSend_imageWithCIImage_(UniImage, v115, (uint64_t)v114);
            v29 = (id)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v29 = v28;
          }

          goto LABEL_13;
        }
      }
    }
    v29 = v28;
LABEL_13:

    goto LABEL_6;
  }
  v29 = 0;
LABEL_6:

  return v29;
}

- (id)applyForegroundUsingConfig:(const rendering_config_params *)a3 image:(id)a4 inputBlurMap:(id)a5 inputAlpha:(id)a6 inputGainMap:(id)a7 inputImage:(id)a8 inputLuma:(id)a9 inputChroma:(id)a10 inputIntermediate:(id)a11 inputHalfRes1:(id)a12 inputHalfRes2:(id)a13 inputHalfResRG:(id)a14 outputLuma:(id)a15 outputChroma:(id)a16 scale:(float)a17 coreImageRender:(BOOL)a18 version:(int)a19 context:(id)a20 captureFolderMiscPath:(id)a21
{
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  unint64_t v46;
  const char *v47;
  uint64_t v48;
  double v49;
  uint64_t v50;
  id v51;
  void *v52;
  ApplyBlurmap *v53;
  _BOOL4 v54;
  void *v55;
  ApplyBlurmap *v56;
  uint64_t v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  float v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  UniFakeImage *v76;
  const char *v77;
  void *v78;
  const char *v79;
  void *v80;
  const char *v81;
  const char *v82;
  uint64_t v83;
  unsigned int v84;
  void *v85;
  UniKernel *sparseNoAlphaRayFg;
  const char *v87;
  void *v88;
  const char *v89;
  void *v90;
  const char *v91;
  void *v92;
  const char *v93;
  void *v94;
  const char *v95;
  void *v96;
  const char *v97;
  void *v98;
  const char *v99;
  void *v100;
  const char *v101;
  UniKernel *antialiasRGBAX;
  void *v103;
  double v104;
  const char *v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  void *v109;
  const char *v110;
  void *v111;
  const char *v112;
  UniKernel *antialiasRGBAY;
  void *v114;
  double v115;
  const char *v116;
  uint64_t v117;
  void *v118;
  double v119;
  const char *v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  void *v124;
  const char *v125;
  UniKernel *addNoiseOnly;
  void *v127;
  const char *v134;
  uint64_t v135;
  void *v136;
  double v137;
  const char *v138;
  uint64_t v139;
  void *v140;
  const char *v141;
  void *v142;
  const char *v143;
  void *v144;
  const char *v145;
  void *v146;
  const char *v147;
  id v148;
  void *v149;
  id v150;
  UniRunInfo *v151;
  const char *v152;
  void *v153;
  const char *v154;
  UniKernel *blendRaytraced;
  void *v156;
  const char *v157;
  void *v158;
  const char *v159;
  void *v160;
  const char *v161;
  uint64_t v162;
  const char *v163;
  uint64_t v164;
  UniKernel *yuv1;
  void *v166;
  void *v167;
  void *v168;
  const char *v169;
  void *v170;
  const char *v171;
  UniKernel *yuv2;
  void *v173;
  const char *v174;
  id v176;
  id v177;
  id v178;
  _BOOL4 v179;
  id v180;
  id v181;
  void *v182;
  id v183;
  id v184;
  UniTextureView *v185;
  ApplyBlurmap *v186;
  id v187;
  void *v189;
  id v190;
  id v191;
  id v192;
  id v193;
  void *v194;
  _QWORD v195[3];
  _QWORD v196[3];
  _QWORD v197[3];
  _QWORD v198[7];
  _QWORD v199[7];
  _QWORD v200[4];
  _QWORD v201[4];
  _QWORD v202[7];
  _QWORD v203[7];
  _QWORD v204[3];
  _QWORD v205[3];
  _QWORD v206[5];
  _QWORD v207[5];
  _QWORD v208[6];
  _QWORD v209[6];
  _QWORD v210[4];
  _QWORD v211[4];
  _QWORD v212[9];
  _QWORD v213[9];
  _QWORD v214[4];

  v214[2] = *MEMORY[0x24BDAC8D0];
  v190 = a4;
  v193 = a5;
  v27 = a6;
  v184 = a7;
  v28 = a8;
  v29 = a9;
  v192 = a10;
  v30 = a11;
  v183 = a12;
  v31 = a13;
  v32 = a14;
  v33 = a15;
  v191 = a16;
  v34 = a20;
  v187 = a21;
  v194 = v33;
  v189 = v27;
  if (objc_msgSend_setOptions_isPrewarm_(self, v35, (uint64_t)a3, 0))
  {
    v38 = v193;
    v39 = v31;
    v40 = 0;
    v41 = v190;
    v42 = v184;
  }
  else
  {
    memset(v195, 0, 22);
    objc_msgSend_computeDynamicParams(self, v36, v37);
    objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v43, (uint64_t)v195, 22);
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    v185 = objc_alloc_init(UniTextureView);
    v186 = self;
    v46 = 0x24BDBC000;
    v176 = v30;
    v177 = v28;
    v178 = v31;
    v180 = v32;
    v181 = v29;
    if (self->_config_params.fgNRings < 1)
    {
      v51 = v31;
      v52 = 0;
      v53 = self;
      v54 = a18;
      v55 = v190;
    }
    else
    {
      if (a18)
      {
        objc_msgSend_extent(v193, v44, v45);
        v50 = (unint64_t)v49;
      }
      else
      {
        v50 = objc_msgSend_width(v193, v44, v45);
      }
      v56 = self;
      v57 = (int)(float)(ceilf(self->_config_params.maxBlur * (float)(unint64_t)v50) + 1.0);
      if (a18)
      {
        objc_msgSend_extent(v193, v47, v48);
        v59 = v58;
        v61 = v60;
        v63 = v62;
        v65 = v64;
        v66 = self->_config_params.fgAARadius * a17;
        v179 = v66 > 0.0;
        v67 = (void *)MEMORY[0x24BDBF660];
        objc_msgSend_blackColor(MEMORY[0x24BDBF638], v68, v69);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_imageWithColor_(v67, v71, (uint64_t)v70);
        v72 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_imageByCroppingToRect_(v72, v73, v74, v59, v61, v63, v65);
        v75 = (void *)objc_claimAutoreleasedReturnValue();

        v76 = [UniFakeImage alloc];
        v78 = (void *)objc_msgSend_initWithCIImage_format_(v76, v77, (uint64_t)v75, 71);
        v214[0] = v78;
        v214[1] = v78;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v79, (uint64_t)v214, 2);
        v80 = (void *)objc_claimAutoreleasedReturnValue();

        v56 = v186;
      }
      else
      {
        v63 = (double)(unint64_t)objc_msgSend_width(v193, v47, v48);
        v65 = (double)(unint64_t)objc_msgSend_height(v193, v82, v83);
        v66 = self->_config_params.fgAARadius * a17;
        v179 = v66 > 0.0;
        if (v66 <= 0.0)
          v84 = 1;
        else
          v84 = 2;
        tmpTexturesFromTexture(v193, v84, 71);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = 0.0;
        v61 = 0.0;
      }
      objc_msgSend_erodeAndDilate_radius_coreImageRender_context_extent_pixelFormat_(v56, v81, (uint64_t)v193, v57, a18, v34, 10, v59, v61, v63, v65);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      sparseNoAlphaRayFg = v56->_sparseNoAlphaRayFg;
      v213[0] = v182;
      v212[0] = CFSTR("dynamic_params");
      v212[1] = CFSTR("segmentStepLUT");
      objc_msgSend_objectAtIndexedSubscript_(v56->_fgSegmentArray, v87, 0);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v213[1] = v88;
      v212[2] = CFSTR("segmentBaseVecLUT");
      objc_msgSend_objectAtIndexedSubscript_(v56->_fgSegmentArray, v89, 1);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v213[2] = v90;
      v213[3] = v190;
      v212[3] = CFSTR("inputTex");
      v212[4] = CFSTR("signedBlurMapTex");
      v213[4] = v193;
      v212[5] = CFSTR("erodedBlurTex");
      objc_msgSend_objectAtIndexedSubscript_(v85, v91, 0);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v213[5] = v92;
      v212[6] = CFSTR("dilatedBlurTex");
      objc_msgSend_objectAtIndexedSubscript_(v85, v93, 1);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v213[6] = v94;
      v212[7] = CFSTR("outputTex");
      objc_msgSend_objectAtIndexedSubscript_(v80, v95, 1);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v212[8] = CFSTR("_renderContext");
      v213[7] = v96;
      v213[8] = v34;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v97, (uint64_t)v213, v212, 9);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_imageByApplyingParameters_(sparseNoAlphaRayFg, v99, (uint64_t)v98);
      v100 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v100)
        sub_24B6EDBD0();
      if (v179)
      {
        antialiasRGBAX = v186->_antialiasRGBAX;
        v211[0] = v100;
        v210[0] = CFSTR("inputTex");
        v210[1] = CFSTR("outputTex");
        objc_msgSend_objectAtIndexedSubscript_(v80, v101, 0);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        v211[1] = v103;
        v211[2] = v34;
        v210[2] = CFSTR("_renderContext");
        v210[3] = CFSTR("inputBlurRadius");
        *(float *)&v104 = v66;
        objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v105, v106, v104);
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        v211[3] = v107;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v108, (uint64_t)v211, v210, 4);
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_imageByApplyingParameters_(antialiasRGBAX, v110, (uint64_t)v109);
        v111 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v111)
          sub_24B6EDBF8();
        antialiasRGBAY = v186->_antialiasRGBAY;
        v209[0] = v111;
        v208[0] = CFSTR("inputTex");
        v208[1] = CFSTR("outputTex");
        objc_msgSend_objectAtIndexedSubscript_(v80, v112, 1);
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        v209[1] = v114;
        v209[2] = v182;
        v208[2] = CFSTR("dynamic_params");
        v208[3] = CFSTR("_renderContext");
        v209[3] = v34;
        v208[4] = CFSTR("_kernelScale");
        *(float *)&v115 = a17;
        objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v116, v117, v115);
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        v209[4] = v118;
        v208[5] = CFSTR("inputBlurRadius");
        *(float *)&v119 = v66;
        objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v120, v121, v119);
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        v209[5] = v122;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v123, (uint64_t)v209, v208, 6);
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_imageByApplyingParameters_(antialiasRGBAY, v125, (uint64_t)v124);
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        v54 = a18;
        if (!v52)
          sub_24B6EDC20();
      }
      else
      {
        addNoiseOnly = v186->_addNoiseOnly;
        v207[0] = v100;
        v206[0] = CFSTR("inputTex");
        v206[1] = CFSTR("outputTex");
        objc_msgSend_objectAtIndexedSubscript_(v80, v101, 0);
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        v207[1] = v127;
        v206[2] = CFSTR("inputLumaNoiseAmplitude");
        _H0 = WORD1(v195[2]);
        __asm { FCVT            S0, H0 }
        objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v134, v135, _D0);
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        v207[2] = v136;
        v207[3] = v34;
        v206[3] = CFSTR("_renderContext");
        v206[4] = CFSTR("_kernelScale");
        *(float *)&v137 = a17;
        objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v138, v139, v137);
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        v207[4] = v140;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v141, (uint64_t)v207, v206, 5);
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_imageByApplyingParameters_(addNoiseOnly, v143, (uint64_t)v142);
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        v54 = a18;
        if (!v52)
          sub_24B6EDD10();
      }

      v33 = v194;
      v53 = v186;
      v46 = 0x24BDBC000uLL;
      v55 = v190;
      v51 = v178;
    }
    v204[0] = CFSTR("inputImage");
    v204[1] = CFSTR("_renderContext");
    v205[0] = v55;
    v205[1] = v34;
    v204[2] = CFSTR("desiredFormat");
    v205[2] = &unk_251C9CB28;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(*(void **)(v46 + 3696), v44, (uint64_t)v205, v204, 3);
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageByApplyingParameters_(v185, v145, (uint64_t)v144);
    v146 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v146)
      sub_24B6EDC48();
    if (v53->_config_params.fgNRings <= 0)
    {
      v149 = v189;
      if (v189)
      {
        v150 = v181;
        if (a3->alphaGain <= 0.0 || a3->alphaEpsilon >= 1.0)
          v149 = 0;
        else
          v149 = v189;
      }
      else
      {
        v150 = v181;
      }
      v148 = v149;
      yuv1 = v53->_yuv1;
      v202[0] = CFSTR("blurredTex");
      v202[1] = CFSTR("inputLumaTex");
      v203[0] = v146;
      v203[1] = v150;
      v166 = v150;
      v202[2] = CFSTR("inputChromaTex");
      v202[3] = CFSTR("outputLumaTex");
      v203[2] = v192;
      v203[3] = v180;
      v202[4] = CFSTR("outputChromaTex");
      v202[5] = CFSTR("inputAlphaTex");
      v167 = v148;
      v203[4] = v191;
      if (!v148)
      {
        objc_msgSend_null(MEMORY[0x24BDBCEF8], v163, v164);
        v167 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v202[6] = CFSTR("_renderContext");
      v203[5] = v167;
      v203[6] = v34;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v163, (uint64_t)v203, v202, 7);
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_imageByApplyingParameters_(yuv1, v169, (uint64_t)v168);
      v170 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v148)
      if (!v170)
        sub_24B6EDCC0();
      yuv2 = v186->_yuv2;
      v200[0] = CFSTR("filteredLumaTex");
      v200[1] = CFSTR("inputLumaTex");
      v201[0] = v170;
      v201[1] = v166;
      v200[2] = CFSTR("outputLumaTex");
      v29 = v166;
      v200[3] = CFSTR("_renderContext");
      v201[2] = v194;
      v201[3] = v34;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v171, (uint64_t)v201, v200, 4);
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_imageByApplyingParameters_(yuv2, v174, (uint64_t)v173);
      v158 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = v193;
      v51 = v178;
      if (!v158)
        sub_24B6EDCE8();
    }
    else
    {
      if (v54)
      {
        v148 = 0;
      }
      else
      {
        v151 = [UniRunInfo alloc];
        objc_msgSend_imageWithMTLTexture_(UniImage, v152, (uint64_t)v33);
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        v148 = (id)objc_msgSend_initWithImageDiv2_(v151, v154, (uint64_t)v153);

        v33 = v194;
      }
      blendRaytraced = v53->_blendRaytraced;
      v198[0] = CFSTR("stockRenderTex");
      v198[1] = CFSTR("raytracedRenderTex");
      v199[0] = v146;
      v199[1] = v52;
      v198[2] = CFSTR("inputLumaTex");
      v198[3] = CFSTR("inputChromaTex");
      v199[2] = v181;
      v199[3] = v192;
      v199[4] = v33;
      v198[4] = CFSTR("outputLumaTex");
      v198[5] = CFSTR("outputChromaTex");
      v199[5] = v191;
      v199[6] = v34;
      v198[6] = CFSTR("_renderContext");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v147, (uint64_t)v199, v198, 7);
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_imageByApplyingParameters_runInfo_(blendRaytraced, v157, (uint64_t)v156, v148);
      v158 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v158)
        sub_24B6EDC70();
      if (v54)
      {
        v196[0] = CFSTR("inputImage");
        v196[1] = CFSTR("_renderContext");
        v197[0] = v158;
        v197[1] = v34;
        v196[2] = CFSTR("desiredFormat");
        v197[2] = &unk_251C9CB28;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v159, (uint64_t)v197, v196, 3);
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_imageByApplyingParameters_(v185, v161, (uint64_t)v160);
        v162 = objc_claimAutoreleasedReturnValue();

        v158 = (void *)v162;
        v38 = v193;
        v29 = v181;
        if (!v162)
          sub_24B6EDC98();
      }
      else
      {
        v38 = v193;
        v29 = v181;
      }
    }
    v39 = v51;

    v41 = v158;
    v40 = v41;
    v42 = v184;
    v30 = v176;
    v28 = v177;
    v32 = v180;
  }

  return v40;
}

- (int)enqueueRenderingUsingRenderingConfig:(const rendering_config_params *)a3 inputBlurMap:(id)a4 inputAlpha:(id)a5 inputGainMap:(id)a6 inputLuma:(id)a7 inputChroma:(id)a8 inputIntermediate:(id)a9 inputHalfRes1:(id)a10 inputHalfRes2:(id)a11 inputHalfResRG:(id)a12 outputLuma:(id)a13 outputChroma:(id)a14 scale:(float)a15 version:(int)a16 context:(id)a17 captureFolderMiscPath:(id)a18
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  double v26;
  const char *v27;
  double v28;
  const char *v29;
  void *v30;
  const char *v31;
  int v32;
  id v34;
  id v36;
  id v38;
  id v39;
  id v41;
  id v42;
  void *v44;
  id v45;

  v20 = a18;
  v21 = a17;
  v45 = a14;
  v42 = a13;
  v39 = a12;
  v22 = a11;
  v23 = a10;
  v34 = a9;
  v24 = a8;
  v36 = a7;
  v38 = a6;
  v41 = a5;
  v25 = a4;
  *(float *)&v26 = a15;
  objc_msgSend_applyBackgroundUsingConfig_inputBlurMap_inputAlpha_inputGainMap_inputImage_inputLuma_inputChroma_inputHalfRes1_inputHalfRes2_scale_coreImageRender_version_context_captureFolderMiscPath_(self, v27, (uint64_t)a3, v25, v41, v38, 0, v36, v26, v24, v23, v22, 0, v21, v20);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v28 = a15;
  objc_msgSend_applyForegroundUsingConfig_image_inputBlurMap_inputAlpha_inputGainMap_inputImage_inputLuma_inputChroma_inputIntermediate_inputHalfRes1_inputHalfRes2_inputHalfResRG_outputLuma_outputChroma_scale_coreImageRender_version_context_captureFolderMiscPath_(self, v29, (uint64_t)a3, v44, v25, v41, v38, 0, v28, v36, v24, v34, v23, v22, v39, v42, v45, 0, v21,
    v20);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_metalRender_waitUntilScheduled_waitUntilCompleted_(v30, v31, (uint64_t)self->_mtlQueue, 0, 0);
  if (v30)
    v32 = 0;
  else
    v32 = -1;

  return v32;
}

- (int)enqueueRenderingUsingArgs:(id)a3
{
  id v4;
  void *v5;
  UniContext *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *RenderingParametersFromMetaData;
  const char *v14;
  uint64_t v15;
  int v16;
  int v17;
  const char *v18;
  uint64_t v19;
  int v20;
  int v21;
  const char *v22;
  uint64_t v23;
  int v24;
  double v25;
  double v26;
  double v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  float v31;
  float v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  float v37;
  int v38;
  int v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  int RenderingVersion;
  const char *v74;
  uint64_t v75;
  void *v76;
  double v77;
  const char *v78;
  const char *v79;
  uint64_t v80;
  int v81;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  ApplyBlurmap *v92;
  void *v93;
  void *v94;
  _OWORD v95[3];
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BD25858]();
  v6 = objc_alloc_init(UniContext);
  if (objc_msgSend_validateForMetal(v4, v7, v8)
    && (objc_msgSend_metadata(v4, v9, v10),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        RenderingParametersFromMetaData = (void *)objc_msgSend_getRenderingParametersFromMetaData_(SDOFMetadata, v12, (uint64_t)v11), v11, RenderingParametersFromMetaData))
  {
    v104 = 0u;
    v105 = 0u;
    v102 = 0u;
    v103 = 0u;
    v100 = 0u;
    v101 = 0u;
    v98 = 0u;
    v99 = 0u;
    v96 = 0u;
    v97 = 0u;
    memset(v95, 0, sizeof(v95));
    objc_msgSend_simulatedAperture(v4, v14, v15);
    v17 = v16;
    objc_msgSend_lumaNoiseAmplitude(v4, v18, v19);
    v21 = v20;
    objc_msgSend_maxBlur(v4, v22, v23);
    LODWORD(v25) = v24;
    LODWORD(v26) = v17;
    LODWORD(v27) = v21;
    objc_msgSend_loadRenderingParams_simulatedAperture_lumaNoiseAmplitude_maxBlur_(SDOFMetadata, v28, (uint64_t)RenderingParametersFromMetaData, v26, v27, v25);
    objc_msgSend_simulatedAperture(v4, v29, v30);
    v32 = v31;
    objc_msgSend_inputScale(v4, v33, v34);
    v38 = (int)fminf(fmaxf(roundf(sqrtf(v37) * fminf(fmaxf(roundf((float)(sqrtf(0.0) * (float)0) / sqrtf(v32)), (float)0), (float)0)), (float)0), (float)0);
    LODWORD(v96) = v38;
    v92 = self;
    if (qword_2544D9CE0 != -1)
      dispatch_once(&qword_2544D9CE0, &unk_251C8F368);
    if (v38 >= dword_2579AEA38)
      v39 = dword_2579AEA38;
    else
      v39 = v38;
    LODWORD(v96) = v39;
    objc_msgSend_inputBlurMap(v4, v35, v36);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_inputAlpha(v4, v40, v41);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_inputGainMap(v4, v42, v43);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_inputImageLuma(v4, v44, v45);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_inputImageChroma(v4, v46, v47);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_intermediates(v4, v48, v49);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_inputIntermediateTex(v91, v50, v51);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_intermediates(v4, v52, v53);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_inputHalfResTex1(v90, v54, v55);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_intermediates(v4, v56, v57);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_inputHalfResTex2(v87, v58, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_intermediates(v4, v61, v62);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_inputHalfResRGTex(v86, v63, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_outputImageLuma(v4, v66, v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_outputImageChroma(v4, v69, v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    RenderingVersion = objc_msgSend_getRenderingVersion_(SDOFMetadata, v72, (uint64_t)RenderingParametersFromMetaData);
    objc_msgSend_captureFolderMiscPath(v4, v74, v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v77) = 1.0;
    objc_msgSend_enqueueRenderingUsingRenderingConfig_inputBlurMap_inputAlpha_inputGainMap_inputLuma_inputChroma_inputIntermediate_inputHalfRes1_inputHalfRes2_inputHalfResRG_outputLuma_outputChroma_scale_version_context_captureFolderMiscPath_(v92, v78, (uint64_t)v95, v94, v93, v85, v89, v88, v77, v84, v83, v60, v65, v68, v71, RenderingVersion, v6, v76);

    free(RenderingParametersFromMetaData);
    objc_msgSend_empty(v6, v79, v80);
    v81 = 0;
  }
  else
  {
    v81 = -1;
  }

  objc_autoreleasePoolPop(v5);
  return v81;
}

- (BOOL)gainMapNeedsGamma22:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  void *v9;
  BOOL v10;
  BOOL v11;
  BOOL v12;
  BOOL v13;
  int v15;
  int v16;

  v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_properties(v3, v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      if (v6)
      {
        objc_msgSend_objectForKeyedSubscript_(v6, v7, *MEMORY[0x24BDD91D0]);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          v15 = 0;
          v10 = sub_24B6BF704((const CGImageMetadata *)v9, CFSTR("HDRGainMap:HDRGainMapVersion"), &v15);
          v11 = v15 >= 0x20000 && v10;
          v16 = 0;
          v12 = sub_24B6BF704((const CGImageMetadata *)v9, CFSTR("HDRToneMap:Version"), &v16);
          v13 = v16 > 0 && v12;
          LOBYTE(v9) = v11 || v13;
        }
        goto LABEL_15;
      }
    }
    else
    {
      v8 = 0;
    }
    LOBYTE(v9) = 0;
LABEL_15:

    goto LABEL_16;
  }
  LOBYTE(v9) = 0;
LABEL_16:

  return (char)v9;
}

- (id)backgroundImageUsingArgs:(id)a3
{
  id v3;
  void *v4;
  UniContext *v5;
  const char *v6;
  uint64_t v7;
  CGColorSpace *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *RenderingParametersFromMetaData;
  const char *v14;
  uint64_t v15;
  int v16;
  int v17;
  const char *v18;
  uint64_t v19;
  int v20;
  int v21;
  const char *v22;
  uint64_t v23;
  int v24;
  double v25;
  double v26;
  double v27;
  const char *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  float v32;
  float v33;
  const char *v34;
  uint64_t v35;
  float v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  double v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  int v67;
  int v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  double v72;
  const char *v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  id v83;
  void *v84;
  CGColorSpace *v86;
  void *v87;
  _OWORD v89[3];
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;

  v3 = a3;
  v4 = (void *)MEMORY[0x24BD25858]();
  v5 = objc_alloc_init(UniContext);
  if (!objc_msgSend_validateForCoreImage(v3, v6, v7))
  {
    v8 = 0;
    v50 = 0;
    RenderingParametersFromMetaData = 0;
LABEL_12:
    v74 = 0;
    goto LABEL_6;
  }
  v8 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF228]);
  objc_msgSend_metadata(v3, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  RenderingParametersFromMetaData = (void *)objc_msgSend_getRenderingParametersFromMetaData_(SDOFMetadata, v12, (uint64_t)v11);

  if (!RenderingParametersFromMetaData)
  {
    v50 = 0;
    goto LABEL_12;
  }
  v86 = v8;
  v87 = v4;
  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  memset(v89, 0, sizeof(v89));
  objc_msgSend_simulatedAperture(v3, v14, v15);
  v17 = v16;
  objc_msgSend_lumaNoiseAmplitude(v3, v18, v19);
  v21 = v20;
  objc_msgSend_maxBlur(v3, v22, v23);
  LODWORD(v25) = v24;
  LODWORD(v26) = v17;
  LODWORD(v27) = v21;
  objc_msgSend_loadRenderingParams_simulatedAperture_lumaNoiseAmplitude_maxBlur_(SDOFMetadata, v28, (uint64_t)RenderingParametersFromMetaData, v26, v27, v25);
  objc_msgSend_getRenderingVersion_(SDOFMetadata, v29, (uint64_t)RenderingParametersFromMetaData);
  objc_msgSend_simulatedAperture(v3, v30, v31);
  v33 = v32;
  objc_msgSend_inputScale(v3, v34, v35);
  LODWORD(v90) = (int)fminf(fmaxf(roundf(sqrtf(v36)* fminf(fmaxf(roundf((float)(sqrtf(0.0) * (float)0) / sqrtf(v33)), (float)0), (float)0)), (float)0), (float)0);
  free(RenderingParametersFromMetaData);
  v37 = (void *)MEMORY[0x24BDBF660];
  objc_msgSend_blackColor(MEMORY[0x24BDBF638], v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_imageWithColor_(v37, v41, (uint64_t)v40);
  RenderingParametersFromMetaData = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_inputBlurMap(v3, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = sub_24B6BE988(v44);
  objc_msgSend_imageByCroppingToRect_(RenderingParametersFromMetaData, v46, v47, v45);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_imageWithCIImage_(UniImage, v49, (uint64_t)v48);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_inputGainMap(v3, v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_gainMapNeedsGamma22_(self, v54, (uint64_t)v53))
  {
    objc_msgSend_imageByApplyingFilter_(v53, v55, (uint64_t)CFSTR("CISRGBToneCurveToLinear"));
    v57 = objc_claimAutoreleasedReturnValue();

    v53 = (void *)v57;
  }
  objc_msgSend_inputBlurMap(v3, v55, v56);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_inputAlpha(v3, v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_inputImage(v3, v62, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_inputScale(v3, v65, v66);
  v68 = v67;
  objc_msgSend_captureFolderMiscPath(v3, v69, v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v72) = v68;
  objc_msgSend_applyBackgroundUsingConfig_inputBlurMap_inputAlpha_inputGainMap_inputImage_inputLuma_inputChroma_inputHalfRes1_inputHalfRes2_scale_coreImageRender_version_context_captureFolderMiscPath_(self, v73, (uint64_t)v89, v58, v61, v53, v64, 0, v72, 0, v50, v50, 1, v5, v71);
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_empty(v5, v75, v76);
  v8 = v86;
  v4 = v87;
LABEL_6:

  objc_autoreleasePoolPop(v4);
  CGColorSpaceRelease(v8);
  objc_msgSend_image(v74, v77, v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = v79;
  if (v79)
  {
    v83 = v79;
  }
  else
  {
    objc_msgSend_emptyImage(MEMORY[0x24BDBF660], v80, v81);
    v83 = (id)objc_claimAutoreleasedReturnValue();
  }
  v84 = v83;

  return v84;
}

- (id)imageUsingArgs:(id)a3 backgroundBlur:(id)a4
{
  id v6;
  void *v7;
  UniContext *v8;
  const char *v9;
  uint64_t v10;
  CGColorSpaceRef v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  const char *v38;
  void *v39;
  const char *v40;
  void *v41;
  double x;
  double y;
  double width;
  double height;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  const char *v61;
  void *v62;
  const char *v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  void *RenderingParametersFromMetaData;
  const char *v74;
  uint64_t v75;
  int v76;
  int v77;
  const char *v78;
  uint64_t v79;
  int v80;
  int v81;
  const char *v82;
  uint64_t v83;
  int v84;
  double v85;
  double v86;
  double v87;
  const char *v88;
  const char *v89;
  const char *v90;
  uint64_t v91;
  float v92;
  float v93;
  const char *v94;
  uint64_t v95;
  float v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  const char *v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  const char *v115;
  uint64_t v116;
  void *v117;
  double v118;
  const char *v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  const char *v124;
  const char *v125;
  const char *v126;
  const char *v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  int v135;
  int v136;
  const char *v137;
  uint64_t v138;
  void *v139;
  UniContext *v140;
  double v141;
  const char *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  const char *v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  int v157;
  int v158;
  const char *v159;
  uint64_t v160;
  void *v161;
  double v162;
  void *v163;
  void *v164;
  const char *v165;
  void *v166;
  void *v167;
  const char *v168;
  uint64_t v169;
  void *v170;
  CGColorSpace *v171;
  const char *v172;
  void *v173;
  const char *v174;
  uint64_t v175;
  const char *v176;
  uint64_t v177;
  void *v178;
  void *v179;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  void *v184;
  void *v185;
  void *v186;
  uint64_t v187;
  double v188;
  void *v189;
  double v190;
  void *v191;
  void *v192;
  uint64_t v193;
  UniContext *v194;
  void *context;
  double v196;
  void *v197;
  void *v198;
  ApplyBlurmap *v199;
  void *v200;
  double v201;
  void *v202;
  id v203;
  void *v204;
  _OWORD v205[4];
  _OWORD v206[3];
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  CGAffineTransform v217;
  CGAffineTransform v218;
  void *v219;
  _QWORD v220[3];
  CGRect v221;
  CGRect v222;
  CGRect v223;

  v220[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v203 = a4;
  v7 = (void *)MEMORY[0x24BD25858]();
  v8 = objc_alloc_init(UniContext);
  v198 = v6;
  if ((objc_msgSend_validateForCoreImage(v6, v9, v10) & 1) == 0)
  {

    objc_autoreleasePoolPop(v7);
    CGColorSpaceRelease(0);
    v179 = 0;
    v167 = 0;
    v202 = 0;
    RenderingParametersFromMetaData = 0;
    v166 = 0;
    v197 = 0;
    v204 = 0;
    v178 = 0;
LABEL_9:
    objc_msgSend_inputImage(v198, v176, v177);
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v11 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF228]);
  objc_msgSend_inputImage(v6, v12, v13);
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_inputImageLuma(v6, v15, v16);
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_inputImageChroma(v6, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_inputGainMap(v6, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  context = v7;
  if (objc_msgSend_gainMapNeedsGamma22_(self, v23, (uint64_t)v22))
  {
    objc_msgSend_imageByApplyingFilter_(v22, v24, (uint64_t)CFSTR("CISRGBToneCurveToLinear"));
    v26 = objc_claimAutoreleasedReturnValue();

    v22 = (void *)v26;
  }
  v199 = self;
  v200 = (void *)v14;
  v193 = (uint64_t)v11;
  v194 = v8;
  v192 = v22;
  if (v14)
  {
    objc_msgSend_imageYCC444_matrix_fullRange_colorSpace_(MEMORY[0x24BDBF660], v24, v14, 601, 1, v11);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_extent(v27, v28, v29);
    v31 = v30;
    v188 = v30;
    v190 = v32;
    v33 = v32;
    v35 = v34;
    v196 = v34;
    v37 = v36;
    v201 = v36;
    objc_msgSend_colorKernelWithName_andOutputFormat_(CoreImageOnlyLibrary, v38, (uint64_t)CFSTR("ccp_chroma"), *MEMORY[0x24BDBF8C8]);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_colorKernelWithName_andOutputFormat_(CoreImageOnlyLibrary, v40, (uint64_t)CFSTR("ccp_luma"), *MEMORY[0x24BDBF8D0]);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    memset(&v218, 0, sizeof(v218));
    CGAffineTransformMakeScale(&v218, 0.5, 0.5);
    v217 = v218;
    v221.origin.x = v31;
    v221.origin.y = v33;
    v221.size.width = v35;
    v221.size.height = v37;
    v222 = CGRectApplyAffineTransform(v221, &v217);
    v223 = CGRectIntegral(v222);
    x = v223.origin.x;
    y = v223.origin.y;
    width = v223.size.width;
    height = v223.size.height;
    objc_msgSend_imageByClampingToExtent(v27, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v217 = v218;
    objc_msgSend_imageByApplyingTransform_(v48, v49, (uint64_t)&v217);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_extent(v50, v51, v52);
    v54 = v53;
    v56 = v55;
    v58 = v57;
    v60 = v59;
    v220[0] = v50;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v61, (uint64_t)v220, 1);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applyWithExtent_arguments_(v39, v63, (uint64_t)v62, v54, v56, v58, v60);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_imageByCroppingToRect_(v64, v65, v66, x, y, width, height);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v219 = v27;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v67, (uint64_t)&v219, 1);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applyWithExtent_arguments_(v41, v69, (uint64_t)v68, v188, v190, v196, v201);
    v70 = objc_claimAutoreleasedReturnValue();

    v204 = (void *)v70;
  }
  objc_msgSend_metadata(v6, v24, v25);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  RenderingParametersFromMetaData = (void *)objc_msgSend_getRenderingParametersFromMetaData_(SDOFMetadata, v72, (uint64_t)v71);

  v197 = v19;
  if (RenderingParametersFromMetaData)
  {
    v215 = 0u;
    v216 = 0u;
    v213 = 0u;
    v214 = 0u;
    v211 = 0u;
    v212 = 0u;
    v209 = 0u;
    v210 = 0u;
    v207 = 0u;
    v208 = 0u;
    memset(v206, 0, sizeof(v206));
    objc_msgSend_simulatedAperture(v6, v74, v75);
    v77 = v76;
    objc_msgSend_lumaNoiseAmplitude(v6, v78, v79);
    v81 = v80;
    objc_msgSend_maxBlur(v6, v82, v83);
    LODWORD(v85) = v84;
    LODWORD(v86) = v77;
    LODWORD(v87) = v81;
    objc_msgSend_loadRenderingParams_simulatedAperture_lumaNoiseAmplitude_maxBlur_(SDOFMetadata, v88, (uint64_t)RenderingParametersFromMetaData, v86, v87, v85);
    objc_msgSend_getRenderingVersion_(SDOFMetadata, v89, (uint64_t)RenderingParametersFromMetaData);
    objc_msgSend_simulatedAperture(v6, v90, v91);
    v93 = v92;
    objc_msgSend_inputScale(v6, v94, v95);
    LODWORD(v207) = (int)fminf(fmaxf(roundf(sqrtf(v96)* fminf(fmaxf(roundf((float)(sqrtf(0.0) * (float)0) / sqrtf(v93)), (float)0), (float)0)), (float)0), (float)0);
    v97 = (void *)MEMORY[0x24BDBF660];
    objc_msgSend_blackColor(MEMORY[0x24BDBF638], v98, v99);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageWithColor_(v97, v101, (uint64_t)v100);
    v102 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_extent(v19, v103, v104);
    objc_msgSend_imageByCroppingToRect_(v102, v105, v106);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageWithCIImage_(UniImage, v108, (uint64_t)v107);
    v202 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_extent(v204, v109, v110);
    v189 = v102;
    objc_msgSend_imageByCroppingToRect_(v102, v111, v112);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageWithCIImage_(UniImage, v114, (uint64_t)v113);
    v187 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_inputBlurMap(v6, v115, v116);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = sub_24B6BE988(v117);
    objc_msgSend_imageByCroppingToRect_(v102, v119, v120, v118);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageWithCIImage_(UniImage, v122, (uint64_t)v121);
    v123 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_imageWithCIImage_(UniImage, v124, (uint64_t)v204);
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageWithCIImage_(UniImage, v125, (uint64_t)v19);
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    memset(v205, 0, sizeof(v205));
    objc_msgSend_loadHairnetParams_(SDOFMetadata, v126, (uint64_t)RenderingParametersFromMetaData);
    objc_msgSend_inputBlurMap(v6, v127, v128);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_inputAlpha(v6, v130, v131);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_inputScale(v6, v133, v134);
    v136 = v135;
    objc_msgSend_captureFolderMiscPath(v6, v137, v138);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    v140 = v194;
    LODWORD(v141) = v136;
    objc_msgSend_applyHairnetUsingConfig_hairnetParams_inputImage_inputBackBlurImage_inputBlurMap_inputAlpha_scale_coreImageRender_version_context_captureFolderMiscPath_(v199, v142, (uint64_t)v206, v205, v200, v203, v129, v132, v141, 1, v194, v139);
    v185 = (void *)objc_claimAutoreleasedReturnValue();

    free(RenderingParametersFromMetaData);
    objc_msgSend_image(v185, v143, v144);
    v145 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_inputBlurMap(v6, v146, v147);
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_inputAlpha(v6, v149, v150);
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_inputImage(v6, v152, v153);
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_inputScale(v6, v155, v156);
    v158 = v157;
    objc_msgSend_captureFolderMiscPath(v6, v159, v160);
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    v183 = v123;
    v181 = v123;
    v182 = v123;
    v191 = (void *)v123;
    LODWORD(v162) = v158;
    v163 = (void *)v145;
    v164 = v192;
    objc_msgSend_applyForegroundUsingConfig_image_inputBlurMap_inputAlpha_inputGainMap_inputImage_inputLuma_inputChroma_inputIntermediate_inputHalfRes1_inputHalfRes2_inputHalfResRG_outputLuma_outputChroma_scale_coreImageRender_version_context_captureFolderMiscPath_(v199, v165, (uint64_t)v206, v145, v148, v151, v192, v154, v162, v186, v184, v181, v182, v183, v202, v187, v202, 1, v194,
      v161);
    v166 = (void *)objc_claimAutoreleasedReturnValue();

    RenderingParametersFromMetaData = v189;
    v167 = (void *)v187;
    objc_msgSend_image(v166, v168, v169);
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    v171 = (CGColorSpace *)v193;
    objc_msgSend_imageByColorMatchingColorSpaceToWorkingSpace_(v170, v172, v193);
    v173 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_empty(v194, v174, v175);
  }
  else
  {
    objc_msgSend_emptyImage(MEMORY[0x24BDBF660], v74, v75);
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    v191 = 0;
    v167 = 0;
    v202 = 0;
    v166 = 0;
    v171 = (CGColorSpace *)v193;
    v140 = v194;
    v164 = v192;
  }

  objc_autoreleasePoolPop(context);
  CGColorSpaceRelease(v171);
  v178 = v200;
  v179 = v191;
  if (!v173)
    goto LABEL_9;
LABEL_10:

  return v173;
}

- (id)addChromaNoise:(id)a3
{
  uint64_t v3;
  id v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  CGColorSpace *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  void *v33;
  _QWORD v35[4];

  v35[3] = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDBF8C0];
  v4 = a3;
  objc_msgSend_colorKernelWithName_andOutputFormat_(CoreImageOnlyLibrary, v5, (uint64_t)CFSTR("addChromaNoise"), v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_filterWithName_(MEMORY[0x24BDBF658], v7, (uint64_t)CFSTR("CIRandomGenerator"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_outputImage(v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF228]);
  objc_msgSend_imageByColorMatchingWorkingSpaceToColorSpace_(v4, v13, (uint64_t)v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_extent(v14, v15, v16);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  LODWORD(v17) = 998244352;
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v25, v26, v17, v14, v11);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v27;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v28, (uint64_t)v35, 3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applyWithExtent_arguments_(v6, v30, (uint64_t)v29, v18, v20, v22, v24);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_imageByColorMatchingColorSpaceToWorkingSpace_(v31, v32, (uint64_t)v12);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  CGColorSpaceRelease(v12);
  return v33;
}

- (id)imageUsingArgs:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;

  v4 = a3;
  if (!objc_msgSend_validateForCoreImage(v4, v5, v6))
  {
    v9 = 0;
    goto LABEL_3;
  }
  objc_msgSend_backgroundImageUsingArgs_(self, v7, (uint64_t)v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_imageUsingArgs_backgroundBlur_(self, v10, (uint64_t)v4, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addChromaNoise_(self, v12, (uint64_t)v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
LABEL_3:
    objc_msgSend_inputImage(v4, v7, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fgSegmentArray, 0);
  objc_storeStrong((id *)&self->_segmentArray, 0);
  objc_storeStrong((id *)&self->_morphology, 0);
  objc_storeStrong((id *)&self->_blendRaytraced, 0);
  objc_storeStrong((id *)&self->_extractNegativeBlurValues, 0);
  objc_storeStrong((id *)&self->_extractPositiveBlurValues, 0);
  objc_storeStrong((id *)&self->_localContrast, 0);
  objc_storeStrong((id *)&self->_yuv2, 0);
  objc_storeStrong((id *)&self->_yuv1, 0);
  objc_storeStrong((id *)&self->_addNoiseOnly, 0);
  objc_storeStrong((id *)&self->_antialiasRGBAY, 0);
  objc_storeStrong((id *)&self->_antialiasRGBAX, 0);
  objc_storeStrong((id *)&self->_antialiasY, 0);
  objc_storeStrong((id *)&self->_antialiasX, 0);
  objc_storeStrong((id *)&self->_gainmapRGBMultiply, 0);
  objc_storeStrong((id *)&self->_gainmapMultiply, 0);
  objc_storeStrong((id *)&self->_sparseWithAlpha, 0);
  objc_storeStrong((id *)&self->_sparseNoAlphaRayFg, 0);
  objc_storeStrong((id *)&self->_sparseNoAlpha, 0);
  objc_storeStrong((id *)&self->_prefilterY, 0);
  objc_storeStrong((id *)&self->_prefilterX, 0);
  objc_storeStrong((id *)&self->_highlightRecovery, 0);
  objc_storeStrong((id *)&self->_preprocessScaled, 0);
  objc_storeStrong((id *)&self->_preprocess, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_mtlQueue, 0);
}

@end
