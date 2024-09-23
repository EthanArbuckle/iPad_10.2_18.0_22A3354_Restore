@implementation SIPersonDetector

- (SIPersonDetector)initWithNetworkConfiguration:(id)a3
{
  id v4;
  SIPersonDetector *v5;
  SIPixelBuffer *v6;
  void *v7;
  SIPersonDetector *v8;
  objc_super v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  kdebug_trace();
  v10.receiver = self;
  v10.super_class = (Class)SIPersonDetector;
  v5 = -[SIModel initWithNetworkConfiguration:](&v10, sel_initWithNetworkConfiguration_, v4);
  if (v5)
  {
    v11 = kSIME5PersonDetectorInputTensorName;
    v6 = -[SIPixelBuffer initWithCVPixelBuffer:]([SIPixelBuffer alloc], "initWithCVPixelBuffer:", 0);
    v12[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIModel setInputs:](v5, "setInputs:", v7);

    kdebug_trace();
    v8 = v5;
  }

  return v5;
}

- (CGSize)getInputResolution
{
  void *v3;
  unint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[SIModel network](self, "network");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "getInputWidth:", kSIME5PersonDetectorInputTensorName);
  -[SIModel network](self, "network");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (double)(unint64_t)objc_msgSend(v5, "getInputHeight:", kSIME5PersonDetectorInputTensorName);

  v7 = (double)v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)getOutputResolution
{
  double v2;
  double v3;
  CGSize result;

  v2 = 0.0;
  v3 = 0.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (int64_t)evaluateForInput:(__CVBuffer *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[SIModel inputs](self, "inputs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", kSIME5PersonDetectorInputTensorName);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPixelBuffer:", a3);

  -[SIModel inputs](self, "inputs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIModel outputs](self, "outputs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIModel evaluateWithInput:outputs:](self, "evaluateWithInput:outputs:", v7, v8);

  return 0;
}

- (int64_t)evaluateForInput:(id)a3 output:(id)a4
{
  id v5;
  int64_t v6;

  v5 = a3;
  v6 = -[SIPersonDetector evaluateForInput:](self, "evaluateForInput:", objc_msgSend(v5, "inputImageBuffer"));

  return v6;
}

- (int64_t)copyResultsToData:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int16 *v19;
  __int16 *v20;
  unint64_t v21;
  unint64_t v31;
  uint64_t v32;
  int v33;
  void *v34;
  char *v35;
  uint64_t v36;
  unint64_t v37;
  float v38;
  float v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  float v47;
  float v50;
  NSObject *v51;
  float v54;
  NSObject *v55;
  NSObject *v56;
  NSObject *v57;
  SIPersonDetectorBoundingBox *v58;
  SIPersonDetectorBoundingBox *v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  float *v66;
  float *v67;
  unint64_t v68;
  float v69;
  unint64_t v70;
  uint64_t v71;
  int v72;
  uint64_t v73;
  unint64_t v74;
  float v75;
  float v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  float v81;
  float v82;
  float v83;
  float v84;
  NSObject *v85;
  float v86;
  NSObject *v87;
  NSObject *v88;
  NSObject *v89;
  SIPersonDetectorBoundingBox *v90;
  double v91;
  SIPersonDetectorBoundingBox *v92;
  uint64_t v94;
  uint64_t v95;
  id v96;
  void *v97;
  unint64_t v98;
  char *v99;
  char *v100;
  uint64_t v101;
  uint64_t *v102;
  _QWORD *v103;
  uint64_t v104;
  uint8_t buf[4];
  const char *v106;
  __int16 v107;
  int v108;
  uint64_t v109;

  v109 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "boundingBoxes");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  kdebug_trace();
  -[SIModel network](self, "network");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = objc_msgSend(v4, "getOutputHeight:", kSIME5PersonDetectorOutputHeatMapTensorName);

  -[SIModel network](self, "network");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "getOutputWidth:", kSIME5PersonDetectorOutputHeatMapTensorName);

  -[SIModel network](self, "network");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "getRawOutput:", kSIME5PersonDetectorOutputHeatMapTensorName);

  -[SIModel network](self, "network");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "getRawOutput:", kSIME5PersonDetectorOutputHeatMapMaxPoolTensorName);

  -[SIModel network](self, "network");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = objc_msgSend(v11, "getRawOutput:", kSIME5PersonDetectorOutputBoundingBoxSizeTensorName);

  -[SIModel network](self, "network");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = objc_msgSend(v12, "getRawOutput:", kSIME5PersonDetectorOutputBoundingBoxCenterTensorName);

  -[SIModel network](self, "network");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "supportFloat16IO");

  v96 = v97;
  if (v14)
  {
    v103 = 0;
    v104 = 0;
    v102 = (uint64_t *)&v103;
    v15 = (uint64_t *)&v103;
    if (v98)
    {
      v16 = 0;
      v17 = 2 * v6;
      do
      {
        if (v6)
        {
          v18 = 0;
          v19 = (__int16 *)v8;
          v20 = (__int16 *)v10;
          v21 = v6;
          do
          {
            _H0 = *v19;
            __asm { FCVT            D1, H0 }
            if (_D1 > 0.36)
            {
              __asm { FCVT            S1, H0 }
              _H2 = *v20;
              __asm { FCVT            S2, H2 }
              if ((float)(_S1 - _S2) == 0.0)
              {
                v99 = (char *)(v18 | v16);
                LOWORD(v100) = _H0;
                std::__tree<std::__value_type<std::pair<int,int>,float>,std::__map_value_compare<std::pair<int,int>,std::__value_type<std::pair<int,int>,float>,std::less<std::pair<int,int>>,true>,std::allocator<std::__value_type<std::pair<int,int>,float>>>::__emplace_unique_key_args<std::pair<int,int>,std::pair<std::pair<int,int>,half>>(&v102, (int *)&v99, (uint64_t)&v99);
              }
            }
            v18 += 0x100000000;
            ++v20;
            ++v19;
            --v21;
          }
          while (v21);
        }
        ++v16;
        v10 += v17;
        v8 += v17;
      }
      while (v16 != v98);
      v15 = v102;
    }
    v99 = 0;
    v100 = 0;
    v101 = 0;
    std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<std::__map_iterator<std::__tree_iterator<std::__value_type<std::pair<int,int>,float>,std::__tree_node<std::__value_type<std::pair<int,int>,float>,void *> *,long>>,std::__map_iterator<std::__tree_iterator<std::__value_type<std::pair<int,int>,float>,std::__tree_node<std::__value_type<std::pair<int,int>,float>,void *> *,long>>,std::back_insert_iterator<std::vector<std::pair<std::pair<int,int>,half>>>>((uint64_t)buf, v15, &v103, &v99);
    v31 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * ((v100 - v99) >> 2));
    if (v100 == v99)
      v32 = 0;
    else
      v32 = v31;
    std::__introsort<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<half>(half const*,half const*,half const*,half const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,half> const&,std::pair<std::pair<int,int>,half> const&)#1} &,std::pair<std::pair<int,int>,half>*,false>((uint64_t)v99, (unint64_t)v100, v32, 1);
    v33 = v104;
    if ((int)v104 >= 100)
      v33 = 100;
    v34 = v96;
    std::vector<std::pair<std::pair<int,int>,half>>::resize((uint64_t)&v99, v33);
    v35 = v100;
    if (v100 != v99)
    {
      v36 = 0;
      v37 = 0;
      v38 = (float)v6;
      v39 = (float)v98;
      v40 = (int)v98 * (int)v6;
      v35 = v99;
      do
      {
        v42 = *(int *)&v35[v36];
        v41 = *(int *)&v35[v36 + 4];
        v43 = v41 + v6 * v42;
        _H13 = *(_WORD *)(v94 + 2 * (v43 + v40));
        _H1 = *(_WORD *)(v94 + 2 * v43);
        __asm { FCVT            S1, H1 }
        v47 = (float)(int)v41 + _S1;
        LOWORD(_S1) = *(_WORD *)(v95 + 2 * v43);
        __asm { FCVT            S11, H1 }
        _H14 = *(_WORD *)(v95 + 2 * (v43 + v40));
        v50 = v47 - (float)(_S11 * 0.5);
        if (v50 < 0.0)
        {
          __SceneIntelligenceLogSharedInstance();
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136380931;
            v106 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/PersonDetector/SIPersonDetector.mm";
            v107 = 1025;
            v108 = 183;
            _os_log_impl(&dword_21071A000, v51, OS_LOG_TYPE_INFO, " %{private}s:%{private}d *** [Warning] negative origin x received from the model. Set to 0 ***", buf, 0x12u);
          }

          v50 = 0.0;
        }
        __asm
        {
          FCVT            S1, H13
          FCVT            S13, H14
        }
        v54 = (float)((float)(int)v42 + _S1) - (float)(_S13 * 0.5);
        if (v54 < 0.0)
        {
          __SceneIntelligenceLogSharedInstance();
          v55 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136380931;
            v106 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/PersonDetector/SIPersonDetector.mm";
            v107 = 1025;
            v108 = 188;
            _os_log_impl(&dword_21071A000, v55, OS_LOG_TYPE_INFO, " %{private}s:%{private}d *** [Warning] negative origin y received from the model. Set to 0 ***", buf, 0x12u);
          }

          v54 = 0.0;
        }
        if (_S11 > v38)
        {
          __SceneIntelligenceLogSharedInstance();
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136380931;
            v106 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/PersonDetector/SIPersonDetector.mm";
            v107 = 1025;
            v108 = 193;
            _os_log_impl(&dword_21071A000, v56, OS_LOG_TYPE_INFO, " %{private}s:%{private}d *** [Warning] out of bound width received from the model. Set to max_width ***", buf, 0x12u);
          }

          _S11 = (float)v6;
        }
        if (_S13 > v39)
        {
          __SceneIntelligenceLogSharedInstance();
          v57 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136380931;
            v106 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/PersonDetector/SIPersonDetector.mm";
            v107 = 1025;
            v108 = 198;
            _os_log_impl(&dword_21071A000, v57, OS_LOG_TYPE_INFO, " %{private}s:%{private}d *** [Warning] out of bound height received from the model. Set to max_height ***", buf, 0x12u);
          }

          _S13 = (float)v98;
        }
        v58 = [SIPersonDetectorBoundingBox alloc];
        _H4 = *(_WORD *)&v99[v36 + 8];
        __asm { FCVT            S4, H4 }
        v61 = -[SIPersonDetectorBoundingBox initWithBoundingBox:confidence:](v58, "initWithBoundingBox:confidence:", (float)(v50 / v38), (float)(v54 / v39), (float)(_S11 / v38), (float)(_S13 / v39), _D4);
        objc_msgSend(v96, "addObject:", v61);

        ++v37;
        v35 = v99;
        v36 += 12;
      }
      while (0xAAAAAAAAAAAAAAABLL * ((v100 - v99) >> 2) > v37);
    }
  }
  else
  {
    v103 = 0;
    v104 = 0;
    v102 = (uint64_t *)&v103;
    v62 = (uint64_t *)&v103;
    if (v98)
    {
      v63 = 0;
      v64 = 4 * v6;
      do
      {
        if (v6)
        {
          v65 = 0;
          v66 = (float *)v8;
          v67 = (float *)v10;
          v68 = v6;
          do
          {
            v69 = *v66;
            if (*v66 > 0.36 && (float)(v69 - *v67) == 0.0)
            {
              v99 = (char *)(v65 | v63);
              *(float *)&v100 = v69;
              std::__tree<std::__value_type<std::pair<int,int>,float>,std::__map_value_compare<std::pair<int,int>,std::__value_type<std::pair<int,int>,float>,std::less<std::pair<int,int>>,true>,std::allocator<std::__value_type<std::pair<int,int>,float>>>::__emplace_unique_key_args<std::pair<int,int>,std::pair<std::pair<int,int>,float>>(&v102, (int *)&v99, (uint64_t)&v99);
            }
            v65 += 0x100000000;
            ++v67;
            ++v66;
            --v68;
          }
          while (v68);
        }
        ++v63;
        v10 += v64;
        v8 += v64;
      }
      while (v63 != v98);
      v62 = v102;
    }
    v99 = 0;
    v100 = 0;
    v101 = 0;
    std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<std::__map_iterator<std::__tree_iterator<std::__value_type<std::pair<int,int>,float>,std::__tree_node<std::__value_type<std::pair<int,int>,float>,void *> *,long>>,std::__map_iterator<std::__tree_iterator<std::__value_type<std::pair<int,int>,float>,std::__tree_node<std::__value_type<std::pair<int,int>,float>,void *> *,long>>,std::back_insert_iterator<std::vector<std::pair<std::pair<int,int>,float>>>>((uint64_t)buf, v62, &v103, &v99);
    v70 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * ((v100 - v99) >> 2));
    if (v100 == v99)
      v71 = 0;
    else
      v71 = v70;
    std::__introsort<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<float>(float const*,float const*,float const*,float const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,float> const&,std::pair<std::pair<int,int>,float> const&)#1} &,std::pair<std::pair<int,int>,float>*,false>((uint64_t)v99, (unint64_t)v100, v71, 1);
    v72 = v104;
    if ((int)v104 >= 100)
      v72 = 100;
    v34 = v96;
    std::vector<std::pair<std::pair<int,int>,float>>::resize((uint64_t)&v99, v72);
    v35 = v100;
    if (v100 != v99)
    {
      v73 = 0;
      v74 = 0;
      v75 = (float)v6;
      v76 = (float)v98;
      v77 = (int)v98 * (int)v6;
      v35 = v99;
      do
      {
        v79 = *(int *)&v35[v73];
        v78 = *(int *)&v35[v73 + 4];
        v80 = v78 + v6 * v79;
        v81 = *(float *)(v94 + 4 * (v80 + v77));
        v82 = *(float *)(v95 + 4 * v80);
        v83 = *(float *)(v95 + 4 * (v80 + v77));
        v84 = (float)(*(float *)(v94 + 4 * v80) + (float)(int)v78) - (float)(v82 * 0.5);
        if (v84 < 0.0)
        {
          __SceneIntelligenceLogSharedInstance();
          v85 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136380931;
            v106 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/PersonDetector/SIPersonDetector.mm";
            v107 = 1025;
            v108 = 183;
            _os_log_impl(&dword_21071A000, v85, OS_LOG_TYPE_INFO, " %{private}s:%{private}d *** [Warning] negative origin x received from the model. Set to 0 ***", buf, 0x12u);
          }

          v84 = 0.0;
        }
        v86 = (float)(v81 + (float)(int)v79) - (float)(v83 * 0.5);
        if (v86 < 0.0)
        {
          __SceneIntelligenceLogSharedInstance();
          v87 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136380931;
            v106 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/PersonDetector/SIPersonDetector.mm";
            v107 = 1025;
            v108 = 188;
            _os_log_impl(&dword_21071A000, v87, OS_LOG_TYPE_INFO, " %{private}s:%{private}d *** [Warning] negative origin y received from the model. Set to 0 ***", buf, 0x12u);
          }

          v86 = 0.0;
        }
        if (v82 > v75)
        {
          __SceneIntelligenceLogSharedInstance();
          v88 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136380931;
            v106 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/PersonDetector/SIPersonDetector.mm";
            v107 = 1025;
            v108 = 193;
            _os_log_impl(&dword_21071A000, v88, OS_LOG_TYPE_INFO, " %{private}s:%{private}d *** [Warning] out of bound width received from the model. Set to max_width ***", buf, 0x12u);
          }

          v82 = (float)v6;
        }
        if (v83 > v76)
        {
          __SceneIntelligenceLogSharedInstance();
          v89 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136380931;
            v106 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/PersonDetector/SIPersonDetector.mm";
            v107 = 1025;
            v108 = 198;
            _os_log_impl(&dword_21071A000, v89, OS_LOG_TYPE_INFO, " %{private}s:%{private}d *** [Warning] out of bound height received from the model. Set to max_height ***", buf, 0x12u);
          }

          v83 = (float)v98;
        }
        v90 = [SIPersonDetectorBoundingBox alloc];
        LODWORD(v91) = *(_DWORD *)&v99[v73 + 8];
        v92 = -[SIPersonDetectorBoundingBox initWithBoundingBox:confidence:](v90, "initWithBoundingBox:confidence:", (float)(v84 / v75), (float)(v86 / v76), (float)(v82 / v75), (float)(v83 / v76), v91);
        objc_msgSend(v96, "addObject:", v92);

        ++v74;
        v35 = v99;
        v73 += 12;
      }
      while (0xAAAAAAAAAAAAAAABLL * ((v100 - v99) >> 2) > v74);
    }
  }
  if (v35)
  {
    v100 = v35;
    operator delete(v35);
  }
  std::__tree<std::__value_type<std::pair<int,int>,float>,std::__map_value_compare<std::pair<int,int>,std::__value_type<std::pair<int,int>,float>,std::less<std::pair<int,int>>,true>,std::allocator<std::__value_type<std::pair<int,int>,float>>>::destroy((uint64_t)&v102, v103);

  kdebug_trace();
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
