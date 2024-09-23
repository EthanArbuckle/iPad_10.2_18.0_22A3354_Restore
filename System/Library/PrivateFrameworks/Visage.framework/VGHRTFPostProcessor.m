@implementation VGHRTFPostProcessor

- (VGHRTFPostProcessor)initWithConfig:(id)a3 error:(id *)a4
{
  id v6;
  VGHRTFPostProcessor *v7;
  uint64_t v8;
  NSString *version;
  uint64_t v10;
  NSString *debugPath;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *modelsRootPath;
  VGHRTFPostProcessor *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  uint64_t v21;
  NSString *v22;
  NSObject *v23;
  NSString *v24;
  NSObject *v25;
  NSString *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSString *v32;
  void *v33;
  NSString *v34;
  id v35;
  id v37;
  objc_super v38;
  uint8_t buf[4];
  NSString *v40;
  _QWORD v41[3];

  v41[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v38.receiver = self;
  v38.super_class = (Class)VGHRTFPostProcessor;
  v7 = -[VGHRTFPostProcessor init](&v38, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "version");
    v8 = objc_claimAutoreleasedReturnValue();
    version = v7->_version;
    v7->_version = (NSString *)v8;

    objc_msgSend(v6, "debugDataRootPath");
    v10 = objc_claimAutoreleasedReturnValue();
    debugPath = v7->_debugPath;
    v7->_debugPath = (NSString *)v10;

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.visage"));
    if (objc_msgSend(v12, "BOOLForKey:", CFSTR("useLocalHRTFModels")))
    {
      __VGLogSharedInstance();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_249CAD000, v13, OS_LOG_TYPE_INFO, " Using hrtf models from the Visage framework ", buf, 2u);
      }

      objc_msgSend(MEMORY[0x24BDD1488], "vg_bundle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "resourcePath");
      v15 = objc_claimAutoreleasedReturnValue();
      modelsRootPath = v7->_modelsRootPath;
      v7->_modelsRootPath = (NSString *)v15;
    }
    else
    {
      objc_msgSend(v6, "modelsRootPath");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18 == 0;

      if (v19)
      {
        __VGLogSharedInstance();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_249CAD000, v27, OS_LOG_TYPE_ERROR, " No hrtf models root path received! ", buf, 2u);
        }

        vg::hrtf::setError(a4, CFSTR("Failed to initialize VGHRTFPostProcessor with nil models path"));
        goto LABEL_22;
      }
      v20 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v6, "modelsRootPath");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = v14;
      v41[1] = CFSTR("HRTFModels");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 2);
      modelsRootPath = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "pathWithComponents:", modelsRootPath);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v7->_modelsRootPath;
      v7->_modelsRootPath = (NSString *)v21;

    }
    __VGLogSharedInstance();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = v7->_modelsRootPath;
      *(_DWORD *)buf = 138412290;
      v40 = v24;
      _os_log_impl(&dword_249CAD000, v23, OS_LOG_TYPE_INFO, " Using HRTFModels at path: %@ ", buf, 0xCu);
    }

    if (!objc_msgSend(v6, "writeDebugData"))
      goto LABEL_16;
    if (v7->_debugPath)
    {
LABEL_13:
      __VGLogSharedInstance();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        v26 = v7->_debugPath;
        *(_DWORD *)buf = 138412290;
        v40 = v26;
        _os_log_impl(&dword_249CAD000, v25, OS_LOG_TYPE_DEBUG, " Using dump path for HRTF post processor data: %@ ", buf, 0xCu);
      }

LABEL_16:
      v7->_finished = 0;
      v17 = v7;
LABEL_23:

      goto LABEL_24;
    }
    v28 = (void *)objc_opt_new();
    objc_msgSend(v28, "setDateFormat:", CFSTR("yyyyMMdd_HHmmss_SSS"));
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringFromDate:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(CFSTR("/private/var/mobile/Library/Caches/VisageTestApp/HRTF/"), "stringByAppendingPathComponent:", v30);
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = v7->_debugPath;
    v7->_debugPath = (NSString *)v31;

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v7->_debugPath;
    v37 = 0;
    objc_msgSend(v33, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v34, 1, 0, &v37);
    v35 = v37;

    if (!v35)
    {

      goto LABEL_13;
    }
    vg::hrtf::setError(a4, CFSTR("Failed to create debug path."));

LABEL_22:
    v17 = 0;
    goto LABEL_23;
  }
  vg::hrtf::setError(a4, CFSTR("Failed to initialize VGHRTFPostProcessor."));
  v17 = 0;
LABEL_24:

  return v17;
}

- (id)processCaptureUpdateData:(id)a3 error:(id *)a4
{
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  unint64_t i;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  void *v22;
  id v23;
  unint64_t v24;
  size_t v25;
  _DWORD *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  int v30;
  void *v31;
  int v32;
  uint64_t v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  unint64_t j;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  char *v59;
  char *v60;
  uint64_t v61;
  unint64_t k;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  __int128 v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  unint64_t v74;
  char *v75;
  char *v76;
  uint64_t v77;
  NSString *version;
  const std::string::value_type *v79;
  id v80;
  void ***v81;
  NSString *debugPath;
  void *v84;
  NSObject *v85;
  void *v86;
  void *v89;
  id v90;
  int v91;
  int v92;
  int v93;
  void *v94;
  __int128 v95;
  __int128 v96;
  uint8_t buf[16];
  __int128 v98;
  __int128 v99;
  __int128 v100;
  void *__p[2];
  __int128 v102;
  vg::hrtf::HRTFModel *v103;
  void *memptr[2];
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  void *v109;
  size_t v110;
  int v111;
  uint64_t v112;

  v112 = *MEMORY[0x24BDAC8D0];
  v90 = a3;
  __VGLogSharedInstance();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_249CAD000, v4, OS_LOG_TYPE_DEBUG, " Started HRTF model processing... ", buf, 2u);
  }

  v5 = -[VGHRTFPostProcessUpdateData initEmpty]([VGHRTFPostProcessUpdateData alloc], "initEmpty");
  objc_msgSend(v5, "setState:", 0);
  std::string::basic_string[abi:ne180100]<0>(buf, (char *)-[NSString UTF8String](self->_modelsRootPath, "UTF8String"));
  vg::hrtf::HRTFModel::create((uint64_t *)buf, &v103);
  if (SBYTE7(v98) < 0)
    operator delete(*(void **)buf);
  if (!v103)
  {
    v39 = CFSTR("Failed to create HRTFModel.");
LABEL_51:
    vg::hrtf::setError(a4, v39);
    v80 = 0;
    goto LABEL_52;
  }
  objc_msgSend(v90, "faceCaptureUpdateData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v39 = CFSTR("Face capture update data unavailable.");
    goto LABEL_51;
  }
  v86 = v5;
  objc_msgSend(v90, "faceCaptureUpdateData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "result");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 == 0;

  if (v9)
  {
    v39 = CFSTR("Face capture update data unavailable.");
LABEL_50:
    v5 = v86;
    goto LABEL_51;
  }
  v5 = v86;
  objc_msgSend(v90, "earCaptureUpdateData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v39 = CFSTR("Ear capture update data unavailable.");
    goto LABEL_51;
  }
  objc_msgSend(v90, "earCaptureUpdateData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "result");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12 == 0;

  if (v13)
  {
    v39 = CFSTR("Ear capture update data unavailable.");
    goto LABEL_50;
  }
  *(_OWORD *)__p = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  *(_OWORD *)buf = 0u;
  v98 = 0u;
  objc_msgSend(v90, "faceCaptureUpdateData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "result");
  v89 = (void *)objc_claimAutoreleasedReturnValue();

  for (i = 0; i < objc_msgSend(v89, "count"); ++i)
  {
    objc_msgSend(v89, "objectAtIndexedSubscript:", i);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "rgbImage");
    *(_QWORD *)&v105 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "objectAtIndexedSubscript:", i);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "depthImage");
    *((_QWORD *)&v105 + 1) = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "objectAtIndexedSubscript:", i);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "depthIntrinsics");
    v19 = v18;
    HIDWORD(v19) = v93;
    HIDWORD(v20) = v92;
    HIDWORD(v21) = v91;
    v106 = v19;
    v107 = v20;
    v108 = v21;
    objc_msgSend(v89, "objectAtIndexedSubscript:", i);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "landmarks");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");
    v25 = (((4 * v24) & 0x3FFFFFFF8) + 31) & 0x7FFFFFFE0;
    v109 = 0;
    v110 = v25 >> 2;
    memptr[0] = 0;
    malloc_type_posix_memalign(memptr, 0x20uLL, v25, 0x49090899uLL);
    v26 = memptr[0];
    v109 = memptr[0];
    v111 = v24 >> 1;
    if (v111)
    {
      v27 = 0;
      v28 = v24 & 0x1FFFFFFFELL;
      do
      {
        objc_msgSend(v23, "objectAtIndexedSubscript:", v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "floatValue");
        v26[v27] = v30;

        objc_msgSend(v23, "objectAtIndexedSubscript:", (v27 + 1));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "floatValue");
        v26[(v27 + 1)] = v32;

        v27 += 2;
      }
      while (v28 != v27);
    }

    v33 = *(_QWORD *)&buf[8];
    if (*(_QWORD *)&buf[8] >= (unint64_t)v98)
    {
      v38 = std::vector<vg::hrtf::FaceFrameData>::__push_back_slow_path<vg::hrtf::FaceFrameData>((uint64_t *)buf, &v105);
      v34 = v109;
    }
    else
    {
      v34 = 0;
      v35 = v105;
      v105 = 0u;
      **(_OWORD **)&buf[8] = v35;
      v36 = v107;
      v37 = v108;
      *(_OWORD *)(v33 + 16) = v106;
      *(_OWORD *)(v33 + 32) = v36;
      *(_OWORD *)(v33 + 48) = v37;
      *(_OWORD *)(v33 + 64) = 0u;
      *(_QWORD *)(v33 + 64) = v109;
      *(_QWORD *)(v33 + 72) = v110;
      *(_DWORD *)(v33 + 80) = v111;
      v109 = 0;
      v110 = 0;
      v111 = 0;
      v38 = v33 + 96;
    }
    *(_QWORD *)&buf[8] = v38;
    free(v34);

  }
  objc_msgSend(v90, "earCaptureUpdateData");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "result");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "leftEarFrames");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v90, "earCaptureUpdateData");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "result");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "rightEarFrames");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  for (j = 0; j < objc_msgSend(v42, "count"); ++j)
  {
    objc_msgSend(v42, "objectAtIndexedSubscript:", j);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "rgbImage");
    v48 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "objectAtIndexedSubscript:", j);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "depthImage");
    v50 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "objectAtIndexedSubscript:", j);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "earBox");
    v53 = v99;
    if ((unint64_t)v99 >= *((_QWORD *)&v99 + 1))
    {
      v95 = v52;
      v55 = (uint64_t)(v99 - *((_QWORD *)&v98 + 1)) >> 5;
      v56 = v55 + 1;
      if ((unint64_t)(v55 + 1) >> 59)
        std::vector<vg::hrtf::FaceFrameData>::__throw_length_error[abi:ne180100]();
      v57 = *((_QWORD *)&v99 + 1) - *((_QWORD *)&v98 + 1);
      if ((uint64_t)(*((_QWORD *)&v99 + 1) - *((_QWORD *)&v98 + 1)) >> 4 > v56)
        v56 = v57 >> 4;
      if ((unint64_t)v57 >= 0x7FFFFFFFFFFFFFE0)
        v58 = 0x7FFFFFFFFFFFFFFLL;
      else
        v58 = v56;
      *(_QWORD *)&v107 = (char *)&v99 + 8;
      v59 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<vg::hrtf::EarFrameData>>((uint64_t)&v99 + 8, v58);
      v60 = &v59[32 * v55];
      *(_QWORD *)&v105 = v59;
      *((_QWORD *)&v105 + 1) = v60;
      *((_QWORD *)&v106 + 1) = &v59[32 * v61];
      *(_QWORD *)v60 = v48;
      *((_QWORD *)v60 + 1) = v50;
      *((_OWORD *)v60 + 1) = v95;
      *(_QWORD *)&v106 = v60 + 32;
      std::vector<vg::hrtf::EarFrameData>::__swap_out_circular_buffer((uint64_t *)&v98 + 1, &v105);
      v54 = v99;
      std::__split_buffer<vg::hrtf::EarFrameData>::~__split_buffer((uint64_t)&v105);
    }
    else
    {
      *(_QWORD *)v99 = v48;
      *(_QWORD *)(v53 + 8) = v50;
      v54 = v53 + 32;
      *(_OWORD *)(v53 + 16) = v52;
    }
    *(_QWORD *)&v99 = v54;

  }
  for (k = 0; k < objc_msgSend(v45, "count"); ++k)
  {
    objc_msgSend(v45, "objectAtIndexedSubscript:", k);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "rgbImage");
    v64 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "objectAtIndexedSubscript:", k);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "depthImage");
    v66 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "objectAtIndexedSubscript:", k);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "earBox");
    v69 = *((_QWORD *)&v100 + 1);
    if ((void *)*((_QWORD *)&v100 + 1) >= __p[0])
    {
      v96 = v68;
      v71 = (uint64_t)(*((_QWORD *)&v100 + 1) - v100) >> 5;
      v72 = v71 + 1;
      if ((unint64_t)(v71 + 1) >> 59)
        std::vector<vg::hrtf::FaceFrameData>::__throw_length_error[abi:ne180100]();
      v73 = (uint64_t)__p[0] - v100;
      if ((uint64_t)((uint64_t)__p[0] - v100) >> 4 > v72)
        v72 = v73 >> 4;
      if ((unint64_t)v73 >= 0x7FFFFFFFFFFFFFE0)
        v74 = 0x7FFFFFFFFFFFFFFLL;
      else
        v74 = v72;
      *(_QWORD *)&v107 = __p;
      v75 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<vg::hrtf::EarFrameData>>((uint64_t)__p, v74);
      v76 = &v75[32 * v71];
      *(_QWORD *)&v105 = v75;
      *((_QWORD *)&v105 + 1) = v76;
      *((_QWORD *)&v106 + 1) = &v75[32 * v77];
      *(_QWORD *)v76 = v64;
      *((_QWORD *)v76 + 1) = v66;
      *((_OWORD *)v76 + 1) = v96;
      *(_QWORD *)&v106 = v76 + 32;
      std::vector<vg::hrtf::EarFrameData>::__swap_out_circular_buffer((uint64_t *)&v100, &v105);
      v70 = *((_QWORD *)&v100 + 1);
      std::__split_buffer<vg::hrtf::EarFrameData>::~__split_buffer((uint64_t)&v105);
    }
    else
    {
      **((_QWORD **)&v100 + 1) = v64;
      *(_QWORD *)(v69 + 8) = v66;
      v70 = v69 + 32;
      *(_OWORD *)(v69 + 16) = v68;
    }
    *((_QWORD *)&v100 + 1) = v70;

  }
  version = self->_version;
  if (version)
    v79 = -[NSString UTF8String](version, "UTF8String");
  else
    v79 = "";
  std::string::__assign_external((std::string *)&__p[1], v79);
  LOBYTE(v105) = 0;
  BYTE8(v106) = 0;
  debugPath = self->_debugPath;
  if (debugPath)
  {
    memptr[0] = (void *)-[NSString UTF8String](debugPath, "UTF8String");
    std::optional<std::string>::operator=[abi:ne180100]<char const*,void>((std::string *)&v105, (std::string::value_type **)memptr);
  }
  vg::hrtf::HRTFModel::predict((uint64_t *)v103, (const vg::hrtf::HRTFModelInputs *)buf, (uint64_t)&v105);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  if (v84)
  {
    objc_msgSend(v86, "setState:", 1);
    objc_msgSend(v86, "setResult:", v84);
    __VGLogSharedInstance();
    v85 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(memptr[0]) = 0;
      _os_log_impl(&dword_249CAD000, v85, OS_LOG_TYPE_DEBUG, " Successfully finished HRTF model processing ", (uint8_t *)memptr, 2u);
    }

    self->_finished = 1;
    v80 = v86;
  }
  else
  {
    vg::hrtf::setError(a4, CFSTR("Failed to predict HRTF results."));
    v80 = 0;
  }

  if (BYTE8(v106) && SBYTE7(v106) < 0)
    operator delete((void *)v105);

  if (SHIBYTE(v102) < 0)
    operator delete(__p[1]);
  *(_QWORD *)&v105 = &v100;
  std::vector<vg::hrtf::EarFrameData>::__destroy_vector::operator()[abi:ne180100]((void ***)&v105);
  *(_QWORD *)&v105 = (char *)&v98 + 8;
  std::vector<vg::hrtf::EarFrameData>::__destroy_vector::operator()[abi:ne180100]((void ***)&v105);
  *(_QWORD *)&v105 = buf;
  std::vector<vg::hrtf::FaceFrameData>::__destroy_vector::operator()[abi:ne180100]((void ***)&v105);
  v5 = v86;
LABEL_52:
  v81 = (void ***)v103;
  v103 = 0;
  if (v81)
  {
    vg::hrtf::HRTFModel::~HRTFModel(v81);
    MEMORY[0x24BD02D60]();
  }

  return v80;
}

- (BOOL)finished
{
  return self->_finished;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_modelsRootPath, 0);
  objc_storeStrong((id *)&self->_debugPath, 0);
}

@end
