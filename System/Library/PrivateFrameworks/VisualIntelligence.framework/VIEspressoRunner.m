@implementation VIEspressoRunner

- (id)classificationErrorWithDescription:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = *MEMORY[0x1E0CB2D50];
  v9[0] = a3;
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.argos.espresso.classification"), -1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (VIEspressoRunner)initWithMLNetURL:(id)a3 expectedInputSize:(CGSize)a4 imageInputName:(id)a5 featureNames:(id)a6 outputNames:(id)a7 preferredMetalDevice:(id)a8 usesCPUOnly:(BOOL)a9
{
  _BOOL4 v9;
  CGFloat height;
  CGFloat width;
  id v17;
  VIEspressoRunner *v18;
  VIEspressoRunner *v19;
  id *p_imageInputName;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t context;
  NSObject *v27;
  uint64_t v28;
  uint64_t plan;
  id v30;
  BOOL v31;
  NSObject *v32;
  id v33;
  int v34;
  NSObject *v35;
  int v36;
  id *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  id v42;
  int v43;
  NSObject *v44;
  NSObject *v45;
  int v46;
  VIEspressoRunner *v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  unint64_t j;
  NSObject *v52;
  NSObject *v54;
  int v55;
  id *p_outputNames;
  id v57;
  id v58;
  id v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD v65[4];
  id *v66;
  uint8_t *v67;
  objc_super v68;
  uint8_t v69[4];
  int v70;
  __int16 v71;
  const __CFString *v72;
  uint8_t v73[128];
  uint8_t buf[8];
  __int128 v75;
  char v76;
  uint64_t v77;

  v9 = a9;
  height = a4.height;
  width = a4.width;
  v77 = *MEMORY[0x1E0C80C00];
  v59 = a3;
  v60 = a5;
  v58 = a6;
  v57 = a7;
  v17 = a8;
  v68.receiver = self;
  v68.super_class = (Class)VIEspressoRunner;
  v18 = -[VIEspressoRunner init](&v68, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_expectedInputSize.width = width;
    v18->_expectedInputSize.height = height;
    p_imageInputName = (id *)&v18->_imageInputName;
    objc_storeStrong((id *)&v18->_imageInputName, a5);
    -[VIEspressoRunner setIsImageRequired:](v19, "setIsImageRequired:", v60 != 0);
    p_outputNames = (id *)&v19->_outputNames;
    objc_storeStrong((id *)&v19->_outputNames, a7);
    if (v17)
    {
      if (+[VILogger shouldLogVerboseMessage](_TtC18VisualIntelligence8VILogger, "shouldLogVerboseMessage"))
      {
        +[VILogger verboseLog](_TtC18VisualIntelligence8VILogger, "verboseLog");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D467C000, v21, OS_LOG_TYPE_DEBUG, "VIEspressoRunner().init(): preferredMetalDevice", buf, 2u);
        }

      }
      espresso_device_id_for_metal_device();
    }
    v22 = +[VILogger shouldLogVerboseMessage](_TtC18VisualIntelligence8VILogger, "shouldLogVerboseMessage");
    if (v9)
    {
      if (v22)
      {
        +[VILogger verboseLog](_TtC18VisualIntelligence8VILogger, "verboseLog");
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D467C000, v23, OS_LOG_TYPE_DEBUG, "VIEspressoRunner().init(): only cpu", buf, 2u);
        }

      }
    }
    else
    {
      if (v22)
      {
        +[VILogger verboseLog](_TtC18VisualIntelligence8VILogger, "verboseLog");
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D467C000, v25, OS_LOG_TYPE_DEBUG, "VIEspressoRunner().init(): trying ane", buf, 2u);
        }

      }
      context = espresso_create_context();
      v19->_context = (void *)context;
      if (context)
        goto LABEL_25;
      if (+[VILogger shouldLogVerboseMessage](_TtC18VisualIntelligence8VILogger, "shouldLogVerboseMessage"))
      {
        +[VILogger verboseLog](_TtC18VisualIntelligence8VILogger, "verboseLog");
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D467C000, v27, OS_LOG_TYPE_DEBUG, "VIEspressoRunner().init(): trying mps", buf, 2u);
        }

      }
      v28 = espresso_create_context();
      v19->_context = (void *)v28;
      if (v28)
        goto LABEL_25;
      if (+[VILogger shouldLogVerboseMessage](_TtC18VisualIntelligence8VILogger, "shouldLogVerboseMessage"))
      {
        +[VILogger verboseLog](_TtC18VisualIntelligence8VILogger, "verboseLog");
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D467C000, v44, OS_LOG_TYPE_DEBUG, "VIEspressoRunner().init(): trying cpu", buf, 2u);
        }

      }
    }
    v24 = espresso_create_context();
    v19->_context = (void *)v24;
    if (!v24)
    {
      if (+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
      {
        +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = -1;
          LOWORD(v75) = 2114;
          *(_QWORD *)((char *)&v75 + 2) = CFSTR("context creation failed");
          _os_log_impl(&dword_1D467C000, v35, OS_LOG_TYPE_ERROR, "VIEspressoRunner: failed (status %d): %{public}@", buf, 0x12u);
        }
        goto LABEL_44;
      }
      goto LABEL_69;
    }
LABEL_25:
    plan = espresso_create_plan();
    v19->_plan = (void *)plan;
    if (!plan)
    {
      if (+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
      {
        +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = -1;
          LOWORD(v75) = 2114;
          *(_QWORD *)((char *)&v75 + 2) = CFSTR("plan creation failed");
          _os_log_impl(&dword_1D467C000, v35, OS_LOG_TYPE_ERROR, "VIEspressoRunner: failed (status %d): %{public}@", buf, 0x12u);
        }
        goto LABEL_44;
      }
LABEL_69:
      v47 = 0;
      goto LABEL_80;
    }
    objc_msgSend(v59, "path");
    v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v30, "UTF8String");
    v31 = espresso_plan_add_network() == 0;

    if (!v31)
    {
      if (+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
      {
        +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v59, "path");
          v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          objc_msgSend(v33, "UTF8String");
          v34 = espresso_plan_add_network();
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = v34;
          LOWORD(v75) = 2114;
          *(_QWORD *)((char *)&v75 + 2) = CFSTR("espresso_plan_add_network");
          _os_log_impl(&dword_1D467C000, v32, OS_LOG_TYPE_ERROR, "VIEspressoRunner: failed (status %d): %{public}@", buf, 0x12u);

        }
      }
      goto LABEL_69;
    }
    if (*p_imageInputName)
    {
      objc_msgSend(*p_imageInputName, "UTF8String");
      if (espresso_network_declare_input())
      {
        if (+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
        {
          +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            -[NSString UTF8String](v19->_imageInputName, "UTF8String");
            v36 = espresso_network_declare_input();
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)&buf[4] = v36;
            LOWORD(v75) = 2114;
            *(_QWORD *)((char *)&v75 + 2) = CFSTR("espresso_network_declare_input");
            _os_log_impl(&dword_1D467C000, v35, OS_LOG_TYPE_ERROR, "VIEspressoRunner: failed (status %d): %{public}@", buf, 0x12u);
          }
LABEL_44:

          goto LABEL_69;
        }
        goto LABEL_69;
      }
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&v75 = buf;
    *((_QWORD *)&v75 + 1) = 0x2020000000;
    v76 = 1;
    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v65[2] = __128__VIEspressoRunner_initWithMLNetURL_expectedInputSize_imageInputName_featureNames_outputNames_preferredMetalDevice_usesCPUOnly___block_invoke;
    v65[3] = &unk_1E9807998;
    v37 = v19;
    v66 = v37;
    v67 = buf;
    objc_msgSend(v58, "enumerateObjectsUsingBlock:", v65);
    if (*(_BYTE *)(v75 + 24))
    {
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v38 = v57;
      v39 = -[NSObject countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
      if (v39)
      {
        v40 = *(_QWORD *)v62;
        while (2)
        {
          for (i = 0; i != v39; ++i)
          {
            if (*(_QWORD *)v62 != v40)
              objc_enumerationMutation(v38);
            v42 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v61 + 1) + 8 * i));
            objc_msgSend(v42, "UTF8String");
            if (espresso_network_declare_output())
            {
              if (+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
              {
                +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
                v45 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(objc_retainAutorelease(v42), "UTF8String");
                  v46 = espresso_network_declare_output();
                  *(_DWORD *)v69 = 67109378;
                  v70 = v46;
                  v71 = 2114;
                  v72 = CFSTR("espresso_network_declare_output");
                  _os_log_impl(&dword_1D467C000, v45, OS_LOG_TYPE_ERROR, "VIEspressoRunner: failed (status %d): %{public}@", v69, 0x12u);
                }

              }
              goto LABEL_67;
            }
          }
          v39 = -[NSObject countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
          if (v39)
            continue;
          break;
        }
      }

      if (!espresso_plan_build())
      {
        objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 168 * -[NSObject count](v38, "count"));
        v48 = objc_claimAutoreleasedReturnValue();
        v49 = v37[9];
        v37[9] = (id)v48;

        v50 = objc_msgSend(v37[9], "mutableBytes");
        for (j = 0; ; ++j)
        {
          if (objc_msgSend(*p_outputNames, "count") <= j)
          {

            _Block_object_dispose(buf, 8);
            goto LABEL_75;
          }
          objc_msgSend(*p_outputNames, "objectAtIndexedSubscript:", j);
          v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          -[NSObject UTF8String](v38, "UTF8String");
          if (espresso_network_bind_buffer())
            break;

          v50 += 168;
        }
        if (+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
        {
          +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
          v54 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          {
            -[NSObject UTF8String](objc_retainAutorelease(v38), "UTF8String");
            v55 = espresso_network_bind_buffer();
            *(_DWORD *)v69 = 67109378;
            v70 = v55;
            v71 = 2114;
            v72 = CFSTR("espresso_network_bind_buffer");
            _os_log_impl(&dword_1D467C000, v54, OS_LOG_TYPE_ERROR, "VIEspressoRunner: failed (status %d): %{public}@", v69, 0x12u);
          }

        }
        goto LABEL_67;
      }
      if (+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
      {
        +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          v43 = espresso_plan_build();
          *(_DWORD *)v69 = 67109378;
          v70 = v43;
          v71 = 2114;
          v72 = CFSTR("espresso_plan_build");
          _os_log_impl(&dword_1D467C000, v38, OS_LOG_TYPE_ERROR, "VIEspressoRunner: failed (status %d): %{public}@", v69, 0x12u);
        }
LABEL_67:

      }
    }

    _Block_object_dispose(buf, 8);
    goto LABEL_69;
  }
LABEL_75:
  if (+[VILogger shouldLogVerboseMessage](_TtC18VisualIntelligence8VILogger, "shouldLogVerboseMessage"))
  {
    +[VILogger verboseLog](_TtC18VisualIntelligence8VILogger, "verboseLog");
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D467C000, v52, OS_LOG_TYPE_DEBUG, "*** --- VIEspressoRunner.init()", buf, 2u);
    }

  }
  v47 = v19;
LABEL_80:

  return v47;
}

void __128__VIEspressoRunner_initWithMLNetURL_expectedInputSize_imageInputName_featureNames_outputNames_preferredMetalDevice_usesCPUOnly___block_invoke(uint64_t a1, id a2, uint64_t a3, _BYTE *a4)
{
  int v6;
  int v7;
  NSObject *v8;
  _DWORD v9[2];
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(objc_retainAutorelease(a2), "UTF8String");
  v6 = espresso_network_declare_input();
  if (v6)
  {
    v7 = v6;
    if (+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
    {
      +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9[0] = 67109378;
        v9[1] = v7;
        v10 = 2114;
        v11 = CFSTR("declare input");
        _os_log_impl(&dword_1D467C000, v8, OS_LOG_TYPE_ERROR, "VIEspressoRunner: failed (status %d): %{public}@", (uint8_t *)v9, 0x12u);
      }

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (void)dealloc
{
  NSObject *v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[16];

  if (espresso_plan_get_phase() == 1
    && (espresso_plan_build_clean() || espresso_plan_destroy())
    && +[VILogger shouldLogVerboseMessage](_TtC18VisualIntelligence8VILogger, "shouldLogVerboseMessage"))
  {
    +[VILogger verboseLog](_TtC18VisualIntelligence8VILogger, "verboseLog");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D467C000, v3, OS_LOG_TYPE_ERROR, "EspressoRunner.dealloc plan clean failed", buf, 2u);
    }

  }
  if (espresso_context_destroy()
    && +[VILogger shouldLogVerboseMessage](_TtC18VisualIntelligence8VILogger, "shouldLogVerboseMessage"))
  {
    +[VILogger verboseLog](_TtC18VisualIntelligence8VILogger, "verboseLog");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D467C000, v4, OS_LOG_TYPE_ERROR, "EspressoRunner.dealloc context destroy failed", buf, 2u);
    }

  }
  v5.receiver = self;
  v5.super_class = (Class)VIEspressoRunner;
  -[VIEspressoRunner dealloc](&v5, sel_dealloc);
}

- (BOOL)setFrame:(__CVBuffer *)a3 error:(id *)a4
{
  void *v7;
  NSObject *v8;
  BOOL result;
  NSObject *v10;
  id v11;
  int v12;
  _BYTE v13[18];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!self->_imageInputName)
    return 1;
  if (floor(self->_expectedInputSize.width) != (double)CVPixelBufferGetWidth(a3)
    || floor(self->_expectedInputSize.height) != (double)CVPixelBufferGetHeight(a3))
  {
    -[VIEspressoRunner classificationErrorWithDescription:](self, "classificationErrorWithDescription:", CFSTR("setFrame(): Image size mismatch"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[VILogger shouldLogVerboseMessage](_TtC18VisualIntelligence8VILogger, "shouldLogVerboseMessage"))
    {
      +[VILogger verboseLog](_TtC18VisualIntelligence8VILogger, "verboseLog");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v12 = 136315394;
        *(_QWORD *)v13 = "-[VIEspressoRunner setFrame:error:]";
        *(_WORD *)&v13[8] = 2112;
        *(_QWORD *)&v13[10] = v7;
        _os_log_impl(&dword_1D467C000, v8, OS_LOG_TYPE_ERROR, "%s failed with error: %@", (uint8_t *)&v12, 0x16u);
      }

    }
    if (a4)
      *a4 = objc_retainAutorelease(v7);

    return 0;
  }
  -[NSString UTF8String](self->_imageInputName, "UTF8String");
  if (!espresso_network_bind_cvpixelbuffer())
    return 1;
  if (+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
  {
    +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[NSString UTF8String](self->_imageInputName, "UTF8String");
      v12 = 67109378;
      *(_DWORD *)v13 = espresso_network_bind_cvpixelbuffer();
      *(_WORD *)&v13[4] = 2114;
      *(_QWORD *)&v13[6] = CFSTR("espresso_network_bind_cvpixelbuffer");
      _os_log_impl(&dword_1D467C000, v10, OS_LOG_TYPE_ERROR, "VIEspressoRunner: failed (status %d): %{public}@", (uint8_t *)&v12, 0x12u);
    }

  }
  if (!a4)
    return 0;
  -[VIEspressoRunner classificationErrorWithDescription:](self, "classificationErrorWithDescription:", CFSTR("espresso_network_bind_cvpixelbuffer"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  result = 0;
  *a4 = v11;
  return result;
}

- (BOOL)setFeatures:(id)a3 error:(id *)a4
{
  id v6;
  int v7;
  BOOL v8;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v6 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 1;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __38__VIEspressoRunner_setFeatures_error___block_invoke;
  v10[3] = &unk_1E98079C0;
  v10[4] = self;
  v10[5] = &v17;
  v10[6] = &v11;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v10);
  v7 = *((unsigned __int8 *)v18 + 24);
  if (a4 && !*((_BYTE *)v18 + 24))
  {
    *a4 = objc_retainAutorelease((id)v12[5]);
    v7 = *((unsigned __int8 *)v18 + 24);
  }
  v8 = v7 != 0;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __38__VIEspressoRunner_setFeatures_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  size_t v17;
  id v18;

  v7 = a3;
  objc_msgSend(objc_retainAutorelease(a2), "UTF8String");
  v8 = espresso_network_bind_buffer();
  if ((_DWORD)v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("setFeatures(): bind feature failed. %d"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    objc_msgSend(*(id *)(a1 + 32), "classificationErrorWithDescription:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    *a4 = 1;
  }
  if (objc_msgSend(v7, "dataType") != 65568)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("setFeatures(): unsupported data type. %d"), v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    objc_msgSend(*(id *)(a1 + 32), "classificationErrorWithDescription:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    *a4 = 1;
  }
  v17 = 4 * objc_msgSend(v7, "count");
  v18 = objc_retainAutorelease(v7);
  memcpy(0, (const void *)objc_msgSend(v18, "dataPointer"), v17);

}

- (id)processWithError:(id *)a3
{
  NSObject *v5;
  void *v7;
  char *v8;
  unint64_t v9;
  unint64_t rank;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  double v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  id *v28;
  char *v29;
  void *v30;
  VIEspressoRunner *v31;
  char *v32;
  _QWORD v33[5];
  uint8_t buf[4];
  int v35;
  __int16 v36;
  const __CFString *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (espresso_plan_execute_sync())
  {
    if (+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
    {
      +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109378;
        v35 = espresso_plan_execute_sync();
        v36 = 2114;
        v37 = CFSTR("espresso_plan_execute_sync");
        _os_log_impl(&dword_1D467C000, v5, OS_LOG_TYPE_ERROR, "VIEspressoRunner: failed (status %d): %{public}@", buf, 0x12u);
      }

    }
    if (a3)
    {
      -[VIEspressoRunner classificationErrorWithDescription:](self, "classificationErrorWithDescription:", CFSTR("espresso_plan_execute_sync"));
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  else
  {
    v28 = a3;
    v7 = (void *)objc_opt_new();
    v8 = -[NSMutableData mutableBytes](self->_outputBuffers, "mutableBytes");
    if (-[NSArray count](self->_outputNames, "count"))
    {
      v9 = 0;
      v30 = v7;
      v31 = self;
      v29 = v8;
      while (1)
      {
        rank = espresso_buffer_get_rank();
        if (rank >= 6)
          break;
        v11 = rank;
        v32 = &v8[168 * v9];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *((_QWORD *)v32 + 14));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v33[0] = v12;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *((_QWORD *)v32 + 13));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v33[1] = v13;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *((_QWORD *)v32 + 12));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v33[2] = v14;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *((_QWORD *)v32 + 11));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v33[3] = v15;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *((_QWORD *)v32 + 10));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v33[4] = v16;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 5);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = objc_alloc(MEMORY[0x1E0C9E970]);
        objc_msgSend(v17, "subarrayWithRange:", 5 - v11, v11);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(v18, "initWithShape:dataType:error:", v19, 65568, 0);

        if (*((_QWORD *)v32 + 19))
        {
          v22 = 0;
          v23 = *(_QWORD *)v32;
          do
          {
            LODWORD(v21) = *(_DWORD *)(v23 + 4 * v22);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v21, v28);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setObject:atIndexedSubscript:", v24, v22);

            ++v22;
          }
          while (*((_QWORD *)v32 + 19) > v22);
        }
        self = v31;
        -[NSArray objectAtIndexedSubscript:](v31->_outputNames, "objectAtIndexedSubscript:", v9, v28);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v30;
        objc_msgSend(v30, "setObject:forKey:", v20, v25);

        ++v9;
        v8 = v29;
        if (-[NSArray count](v31->_outputNames, "count") <= v9)
          goto LABEL_16;
      }
      if (+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
      {
        +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109378;
          v35 = 0;
          v36 = 2114;
          v37 = CFSTR("outputs up to only rank 5 are supported");
          _os_log_impl(&dword_1D467C000, v27, OS_LOG_TYPE_ERROR, "VIEspressoRunner: failed (status %d): %{public}@", buf, 0x12u);
        }

      }
      if (v28)
      {
        -[VIEspressoRunner classificationErrorWithDescription:](self, "classificationErrorWithDescription:", CFSTR("outputs up to only rank 5 are supported"));
        v26 = 0;
        *v28 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v26 = 0;
      }
    }
    else
    {
LABEL_16:
      v26 = v7;
    }

    return v26;
  }
}

- (BOOL)isImageRequired
{
  return self->_isImageRequired;
}

- (void)setIsImageRequired:(BOOL)a3
{
  self->_isImageRequired = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputBuffers, 0);
  objc_storeStrong((id *)&self->_outputNames, 0);
  objc_storeStrong((id *)&self->_imageInputName, 0);
}

@end
