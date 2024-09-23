@implementation OU3DObjectDetector

- (id)init:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  int v6;
  const char *v7;
  const char *v8;
  char *v9;
  OUInternalInfoDumper *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  objc_super v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x24BDAC8D0];
  self->isOnline_ = a3;
  _OULoggingGetOSLogForCategoryObjectUnderstanding();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
    v7 = "Offline";
    if (v3)
      v7 = "Online";
    v8 = "Yes";
    if (!v6)
      v8 = "No";
    *(_DWORD *)buf = 136315394;
    v22 = v7;
    v23 = 2080;
    v24 = v8;
    _os_log_impl(&dword_2294C8000, v5, OS_LOG_TYPE_INFO, "[3DOD] %s OD session is initialized in the main thread: %s.", buf, 0x16u);
  }

  v20.receiver = self;
  v20.super_class = (Class)OU3DObjectDetector;
  v9 = -[OU3DObjectDetector init](&v20, sel_init);
  *(_DWORD *)(v9 + 946) = 0;
  objc_msgSend(v9, "initialization");
  *((_WORD *)v9 + 472) = 257;
  *((_QWORD *)v9 + 113) = 0;
  v10 = objc_alloc_init(OUInternalInfoDumper);
  v11 = (void *)*((_QWORD *)v9 + 116);
  *((_QWORD *)v9 + 116) = v10;

  v12 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v12, "setDateFormat:", CFSTR("MM_dd_yyyy_HH_mm_ss_SSS"));
  v13 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringFromDate:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@%@"), CFSTR("/var/mobile/Documents/Rooms/ObjectUnderstanding/"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*((id *)v9 + 116), "setUpInternalDumpWithLogDir:enable:", v16, 0);
  objc_msgSend(*((id *)v9 + 116), "setEnableARFrameDump:", 0);
  objc_msgSend(*((id *)v9 + 116), "setEnableLiveDump:", 0);
  objc_msgSend(*((id *)v9 + 116), "setEnableARFrameRGB:", 0);
  objc_msgSend(*((id *)v9 + 116), "setEnableARFrameDepth:", 0);
  v17 = operator new();
  v18 = *((_QWORD *)v9 + 117);
  *((_QWORD *)v9 + 117) = v17;
  if (v18)
    MEMORY[0x22E2CAAE8](v18, 0xC400A2AC0F1);

  return v9;
}

- (void)setRgbRefinementEnabled:(BOOL)a3
{
  self->_RgbRefinementEnabled = a3;
}

- (NSSet)supportedObjectTypes
{
  void *v3;
  $965F03D6AAC245BED10E1BEB9B58A841 *det_params;
  unint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", self->det_params->var0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  det_params = self->det_params;
  if (det_params->var0)
  {
    v5 = 0;
    do
    {
      objc_msgSend(v3, "addObject:", det_params->var2[v5++]);
      det_params = self->det_params;
    }
    while (v5 < det_params->var0);
  }
  v6 = (void *)objc_msgSend(v3, "copy");

  return (NSSet *)v6;
}

- (id)updateWithAccumulatePC:(__n128)a3 currentCameraPose:(__n128)a4
{
  *(__n128 *)(a1 + 160) = a2;
  *(__n128 *)(a1 + 176) = a3;
  *(__n128 *)(a1 + 192) = a4;
  *(__n128 *)(a1 + 208) = a5;
  objc_storeStrong((id *)(a1 + 144), a7);
  objc_msgSend((id)a1, "run");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)updateWithAccumulatePC:(id)a3 ouframe:(id)a4
{
  id v7;
  id v8;
  OUCamera *v9;
  OUCamera *camera;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  void *v19;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "camera");
  v9 = (OUCamera *)objc_claimAutoreleasedReturnValue();
  camera = self->camera_;
  self->camera_ = v9;

  objc_storeStrong((id *)&self->arframe_, a4);
  -[_OUFrame GetCameraPoseInVisionWorld](self->arframe_, "GetCameraPoseInVisionWorld");
  *(_OWORD *)self->_anon_a0 = v11;
  *(_OWORD *)&self->_anon_a0[16] = v12;
  *(_OWORD *)&self->_anon_a0[32] = v13;
  *(_OWORD *)&self->_anon_a0[48] = v14;
  -[_OUFrame GetSceneCameraPoseInVisionWorld](self->arframe_, "GetSceneCameraPoseInVisionWorld");
  *(_OWORD *)self->_anon_e0 = v15;
  *(_OWORD *)&self->_anon_e0[16] = v16;
  *(_OWORD *)&self->_anon_e0[32] = v17;
  *(_OWORD *)&self->_anon_e0[48] = v18;
  objc_storeStrong((id *)&self->keyframesPointCloud_, a3);
  -[OU3DObjectDetector run](self, "run");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)getObjectAsset
{
  return self->objectAsset_;
}

- (id)generateOfflineObjects:(id)a3 onlineObjects:(id)a4
{
  OUVizTool *v6;
  OUVizTool *v7;
  OUPointCloud *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  const void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  NSObject *v19;
  NSObject *v20;
  OUVizTool *v21;
  OU3DODInterface *value;
  OUVizTool *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  int v29;
  OU3DObjectMerger *merger;
  void *v31;
  id v32;
  unint64_t k;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  OUVizTool *v40;
  void *v41;
  void *v43;
  OUVizTool *v44;
  OU3DObjectDetector *v45;
  id v46;
  void *v47;
  void *__p[2];
  char v49;
  void **v50[3];
  void **v51[3];
  void **v52[3];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  void **v57[3];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t v62[128];
  uint8_t buf[8];
  uint64_t v64;
  uint64_t v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v46 = a3;
  v6 = (OUVizTool *)a4;
  v7 = (OUVizTool *)OUVizTool::Get(v6);
  OUVizTool::StartNewFrame(v7);
  if (v46 && objc_msgSend(v46, "count"))
  {
    if (!self->offline_detector_.__ptr_.__value_)
      -[OU3DObjectDetector OfflineModelInitialization](self, "OfflineModelInitialization");
    v44 = v6;
    v45 = self;
    v8 = objc_alloc_init(OUPointCloud);
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v9 = v46;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v59;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v59 != v11)
            objc_enumerationMutation(v9);
          objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (const void *)objc_msgSend(v13, "pointsToWorld");
          v15 = objc_msgSend(v13, "pointsToWorld");
          v16 = objc_msgSend(v13, "count");
          *(_QWORD *)buf = 0;
          v64 = 0;
          v65 = 0;
          _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m(buf, v14, v15 + 16 * v16, (v15 + 16 * v16 - (uint64_t)v14) >> 4);
          v17 = objc_msgSend(v13, "count");
          -[OUPointCloud append:points:semanticLabels:semanticVotes:](v8, "append:points:semanticLabels:semanticVotes:", v17, *(_QWORD *)buf, objc_msgSend(v13, "semanticLabels"), objc_msgSend(v13, "semanticVotes"));
          if (*(_QWORD *)buf)
          {
            v64 = *(_QWORD *)buf;
            operator delete(*(void **)buf);
          }

        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
      }
      while (v10);
    }

    v18 = -[OUPointCloud count](v8, "count");
    _OULoggingGetOSLogForCategoryObjectUnderstanding();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v18 > 0x3E7)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2294C8000, v20, OS_LOG_TYPE_INFO, "[3DOU] Running ios train pipeline.", buf, 2u);
      }

      ou3dod::OU3DODInterface::Process((OUDnnInferenceInterface **)v45->offline_detector_.__ptr_.__value_, (const OUPointCloudCpp *)-[OUPointCloud getCpp](v8, "getCpp"));
      value = v45->offline_detector_.__ptr_.__value_;
      v64 = 0;
      v65 = 0;
      *(_QWORD *)buf = 0;
      std::vector<OUBox3d>::__init_with_size[abi:ne180100]<OUBox3d*,OUBox3d*>(buf, *((_QWORD *)value + 1), *((_QWORD *)value + 2), 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((_QWORD *)value + 2) - *((_QWORD *)value + 1)) >> 5));
      ou3dod::OU3DODInterface::GetDetectedBoxes((ou3dod::OU3DODInterface *)v45->offline_detector_.__ptr_.__value_, CFSTR("Cabinet"), (uint64_t *)v57);
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v23 = v44;
      v24 = -[OUVizTool countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
      if (v24)
      {
        v25 = *(_QWORD *)v54;
        do
        {
          for (j = 0; j != v24; ++j)
          {
            if (*(_QWORD *)v54 != v25)
              objc_enumerationMutation(v23);
            v27 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * j);
            objc_msgSend(v27, "detection_source");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v28, "isEqualToString:", CFSTR("online")))
            {
              v29 = objc_msgSend(v27, "hasBoxesDict:", CFSTR("raw_postprocess"));

              if (v29)
                objc_msgSend(v47, "addObject:", v27);
            }
            else
            {

            }
          }
          v24 = -[OUVizTool countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
        }
        while (v24);
      }

      boxesFromObjects(v47, CFSTR("raw_postprocess"), 0, (uint64_t *)v52);
      OU3DKitchenObjectMerger::SetDetectionAndPointCloud((uint64_t)&v45->offline_merger_, (const OUBox3d **)v52, (const OUBox3d **)v57, (_QWORD *)(-[OUPointCloud getCpp](v8, "getCpp") + 24));
      OU3DKitchenObjectMerger::Merge(&v45->offline_merger_);
      OU3DKitchenObjectMerger::GetOutput(&v45->offline_merger_, (uint64_t *)v51);
      merger = v45->merger;
      if (merger)
        -[OU3DObjectMerger removeLowHeightStairObjects:](merger, "removeLowHeightStairObjects:", v51);
      else
        memset(v50, 0, sizeof(v50));
      boxesToObjects((uint64_t *)v50, CFSTR("rawdetection"), 1u);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      boxesToObjects((uint64_t *)buf, CFSTR("raw_offline"), 1u);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v47;
      updateObjectsWithBoxes((uint64_t *)v52, v32, CFSTR("raw_online"));
      for (k = 0; objc_msgSend(v32, "count") > k; ++k)
      {
        objc_msgSend(v32, "objectAtIndexedSubscript:", k);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "corners_status");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (void *)objc_msgSend(v35, "copy");
        objc_msgSend(v32, "objectAtIndexedSubscript:", k);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setCorners_status:", v36);

      }
      -[OU3DObjectDetector assignIdentifiersForNewObjects:withOldObjects:](v45, "assignIdentifiersForNewObjects:withOldObjects:", v31, v32);
      v38 = (void *)objc_msgSend(v31, "mutableCopy");
      objc_msgSend(v38, "addObjectsFromArray:", v32);
      objc_msgSend(v38, "addObjectsFromArray:", v43);
      -[OU3DObjectDetector combineBoxTypeAndEmbeddingByUUID:](v45, "combineBoxTypeAndEmbeddingByUUID:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[OU3DObjectDetector assignParentId:isOffline:](v45, "assignParentId:isOffline:", v39, 1);
      -[OU3DObjectDetector reviseObjectsUponParentId:](v45, "reviseObjectsUponParentId:", v39);
      -[OU3DObjectDetector MergeLShapeObjects:isLastFrame:](v45, "MergeLShapeObjects:isLastFrame:", v39, 1);
      v40 = (OUVizTool *)objc_claimAutoreleasedReturnValue();

      v21 = v40;
      if (v45->_ObjectRepresentationEnabled)
        ou3dor::OU3DObjectRepresentation::AddObjectRepresentation((uint64_t)v45->ou3dor_.__ptr_.__value_, v8, v40);
      v41 = OUVizTool::Get((OUVizTool *)-[OUObjectAsset setObjects:](v45->objectAsset_, "setObjects:", v40));
      std::string::basic_string[abi:ne180100]<0>(__p, "offline_objects");
      OUVizTool::SaveObjects((uint64_t)v41, (uint64_t)__p, v40, CFSTR("rawdetection"));
      if (v49 < 0)
        operator delete(__p[0]);
      CheckOutputValidation(v40);

      __p[0] = v50;
      std::vector<OUBox3d>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
      v50[0] = (void **)v51;
      std::vector<OUBox3d>::__destroy_vector::operator()[abi:ne180100](v50);
      v51[0] = (void **)v52;
      std::vector<OUBox3d>::__destroy_vector::operator()[abi:ne180100](v51);

      v52[0] = (void **)v57;
      std::vector<OUBox3d>::__destroy_vector::operator()[abi:ne180100](v52);
      v57[0] = (void **)buf;
      std::vector<OUBox3d>::__destroy_vector::operator()[abi:ne180100](v57);
    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[OU3DObjectDetector generateOfflineObjects:onlineObjects:].cold.1(buf, -[OUPointCloud count](v8, "count"), v20);

      v21 = v44;
    }

    v6 = v44;
  }
  else
  {
    v21 = v6;
  }

  return v21;
}

- (id)combineBoxTypeAndEmbeddingByUUID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  void *v16;
  void *v17;
  BOOL v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  void *v25;
  void *v26;
  BOOL v27;
  void *v28;
  void *v29;
  _BOOL8 v30;
  void *v31;
  id obj;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t i;
  _OWORD v38[8];
  uint8_t v39;
  _BYTE v40[15];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v3);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v3;
  v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v35)
  {
    v34 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v46 != v34)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(v4, "identifier");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "objectForKey:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6 == 0;

        if (v7)
        {
          objc_msgSend(v4, "identifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "setObject:forKey:", v4, v9);
          goto LABEL_32;
        }
        objc_msgSend(v4, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        objc_msgSend(v4, "boxesDict");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "allKeys");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
        if (v12)
        {
          v13 = *(_QWORD *)v42;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v42 != v13)
                objc_enumerationMutation(v11);
              v15 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j);
              objc_msgSend(v9, "boxesDict");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "objectForKey:", v15);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = v17 == 0;

              if (v18)
              {
                memset(v38, 0, sizeof(v38));
                objc_msgSend(v4, "boxesDict");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "objectForKeyedSubscript:", v15);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                box3dFromNSArray(v21, (uint64_t)v38);

                objc_msgSend(v9, "addBoxesDict:forDictKey:", v38, v15);
              }
              else
              {
                _OULoggingGetOSLogForCategoryObjectUnderstanding();
                v19 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
                  -[OU3DObjectDetector combineBoxTypeAndEmbeddingByUUID:].cold.1(&v39, v40, v19);

              }
            }
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
          }
          while (v12);
        }

        objc_msgSend(v9, "embedding2d");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v22, "count"))
        {
          objc_msgSend(v4, "embedding2d");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "count") == 0;

          if (v24)
            goto LABEL_23;
          objc_msgSend(v4, "embedding2d");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setEmbedding2d:", v22);
        }

LABEL_23:
        objc_msgSend(v9, "embedding3d");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v25, "count"))
          goto LABEL_26;
        objc_msgSend(v4, "embedding3d");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "count") == 0;

        if (!v27)
        {
          objc_msgSend(v4, "embedding3d");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setEmbedding3d:", v25);
LABEL_26:

        }
        objc_msgSend(v9, "cadModelName");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v28)
        {
          objc_msgSend(v4, "cadModelName");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v29 == 0;

          if (v30)
            goto LABEL_32;
          objc_msgSend(v4, "cadModelName");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setCadModelName:", v28);
        }

LABEL_32:
      }
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    }
    while (v35);
  }

  objc_msgSend(v36, "allValues");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (void)clear
{
  NSArray *v3;
  NSArray *pre_size_refined;
  NSArray *v5;
  NSArray *pre_rgb_size_refined;
  OUPointCloud *v7;
  OUPointCloud *worldPointCloud;
  OUPointCloud *v9;
  OUPointCloud *arframePointCloud;
  OUBox3d *end;
  OUBox3d *begin;
  OUBox3d *v13;
  OUBox3d *v14;
  NSArray *allObjects;

  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  pre_size_refined = self->pre_size_refined_;
  self->pre_size_refined_ = v3;

  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  pre_rgb_size_refined = self->pre_rgb_size_refined_;
  self->pre_rgb_size_refined_ = v5;

  v7 = objc_alloc_init(OUPointCloud);
  worldPointCloud = self->worldPointCloud;
  self->worldPointCloud = v7;

  v9 = objc_alloc_init(OUPointCloud);
  arframePointCloud = self->arframePointCloud_;
  self->arframePointCloud_ = v9;

  self->latestTimestamp = 0.0;
  *(_OWORD *)self->_anon_50 = 0u;
  *(_OWORD *)&self->_anon_50[16] = 0u;
  *(_OWORD *)&self->_anon_50[32] = 0u;
  *(_OWORD *)&self->_anon_50[48] = 0u;
  end = self->acc_box3ds_.__end_;
  begin = self->acc_box3ds_.__begin_;
  while (end != begin)
  {
    end = (OUBox3d *)((char *)end - 224);
    std::__destroy_at[abi:ne180100]<OUBox3d,0>((uint64_t)end);
  }
  self->acc_box3ds_.__end_ = begin;
  v13 = self->merged_box3ds_.__end_;
  v14 = self->merged_box3ds_.__begin_;
  while (v13 != v14)
  {
    v13 = (OUBox3d *)((char *)v13 - 224);
    std::__destroy_at[abi:ne180100]<OUBox3d,0>((uint64_t)v13);
  }
  self->merged_box3ds_.__end_ = v14;
  std::vector<std::vector<float>>::__clear[abi:ne180100]((uint64_t *)&self->hist_ori_iou_mat_);
  std::vector<std::vector<float>>::__clear[abi:ne180100]((uint64_t *)&self->hist_nms_iou_mat_);
  self->hist_kept_box_ids_.__end_ = self->hist_kept_box_ids_.__begin_;
  allObjects = self->allObjects;
  self->allObjects = (NSArray *)MEMORY[0x24BDBD1A8];

  self->size_refined_box_ids_.__end_ = self->size_refined_box_ids_.__begin_;
}

- (void)OfflineModelInitialization
{
  OU3DODInterface *v3;
  OU3DODInterface *value;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7[2];
  _BYTE v8[88];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  OU3DSSDConfig::OU3DSSDConfig(v8, 33, (__n128)xmmword_229561DE0, (__n128)vdupq_n_s32(0x3E19999Au), (__n128)xmmword_229561DF0);
  ou3dod::OU3DAnchorFreeDetector::createForOffline((ou3dod::OU3DAnchorFreeDetector *)v8, v7);
  v3 = (OU3DODInterface *)v7[0];
  v7[0] = 0;
  value = self->offline_detector_.__ptr_.__value_;
  self->offline_detector_.__ptr_.__value_ = v3;
  if (value)
  {
    (*(void (**)(OU3DODInterface *))(*(_QWORD *)value + 8))(value);
    v5 = v7[0];
    v7[0] = 0;
    if (v5)
      (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
  }
  _OULoggingGetOSLogForCategoryObjectUnderstanding();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LOWORD(v7[0]) = 0;
    _os_log_impl(&dword_2294C8000, v6, OS_LOG_TYPE_INFO, "[3DOD] Offline model has been loaded.", (uint8_t *)v7, 2u);
  }

}

- (void)InitializeRGBRefinement:(id)a3
{
  id v4;
  __CVBuffer *v5;
  int Width;
  void *v7;
  NSSet *v8;
  NSSet *rgb_refine_supported_types;
  OU3DObjectRGBSizeRefiner *v10;
  _OWORD v11[2];
  std::string v12;
  _OWORD v13[2];
  std::string __p;
  NSSet *v15;
  _OWORD v16[2];
  std::string v17;
  _BYTE v18[28];
  std::string v19;

  v4 = a3;
  v5 = (__CVBuffer *)objc_msgSend(v4, "sceneColorBuffer");
  Width = CVPixelBufferGetWidth(v5);
  *(_QWORD *)v18 = 0x3E99999A3D4CCCCDLL;
  v18[8] = 1;
  *(_DWORD *)&v18[12] = Width;
  *(_DWORD *)&v18[16] = CVPixelBufferGetHeight(v5);
  *(_QWORD *)&v18[20] = 0xC000000100;
  std::string::basic_string[abi:ne180100]<0>(&v19, "rgb");
  *(_QWORD *)&v16[0] = 0x3A83126F00000000;
  BYTE8(v16[0]) = 1;
  *(int64x2_t *)((char *)v16 + 12) = vdupq_n_s64(0xC000000100uLL);
  std::string::basic_string[abi:ne180100]<0>(&v17, "semantic");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("Screen"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v7);
  v8 = (NSSet *)objc_claimAutoreleasedReturnValue();
  rgb_refine_supported_types = self->rgb_refine_supported_types_;
  self->rgb_refine_supported_types_ = v8;

  v11[0] = *(_OWORD *)v18;
  *(_OWORD *)((char *)v11 + 12) = *(_OWORD *)&v18[12];
  if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v12, v19.__r_.__value_.__l.__data_, v19.__r_.__value_.__l.__size_);
  else
    v12 = v19;
  v13[0] = v16[0];
  *(_OWORD *)((char *)v13 + 12) = *(_OWORD *)((char *)v16 + 12);
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&__p, v17.__r_.__value_.__l.__data_, v17.__r_.__value_.__l.__size_);
  else
    __p = v17;
  v15 = self->rgb_refine_supported_types_;
  v10 = (OU3DObjectRGBSizeRefiner *)operator new();
  OU3DObjectRGBSizeRefiner::OU3DObjectRGBSizeRefiner(v10, (const OU3DObjectRGBSizeRefinerParams *)v11);
  std::unique_ptr<OU3DObjectRGBSizeRefiner>::reset[abi:ne180100](&self->object_rgb_size_refiner_.__ptr_.__value_, v10);

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v12.__r_.__value_.__l.__data_);

  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v17.__r_.__value_.__l.__data_);
  if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v19.__r_.__value_.__l.__data_);

}

- (void)initialization
{
  OU3DODInterface *v3;
  OU3DODInterface *value;
  uint64_t v5;
  NSObject *v6;
  ou3dor::OU3DObjectRepresentation *v7;
  $965F03D6AAC245BED10E1BEB9B58A841 *det_params;
  uint64_t v9;
  uint64_t v10;
  OU3DObjectMerger *v11;
  OU3DObjectMerger *merger;
  OUObjectCompleteness *v13;
  OUObjectCompleteness *object_completeness;
  OUObjectAsset *v15;
  OUObjectAsset *objectAsset;
  OUPointCloud *v17;
  OUPointCloud *worldPointCloud;
  uint64_t v19[2];
  uint8_t buf[8];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (self->isOnline_)
  {
    OU3DSSDConfig::OU3DSSDConfig(buf, 33, (__n128)xmmword_229561E00, (__n128)vdupq_n_s32(0x3E19999Au), (__n128)xmmword_229561E10);
    ou3dod::OU3DAnchorFreeDetector::createForOnline((ou3dod::OU3DAnchorFreeDetector *)buf, v19);
    v3 = (OU3DODInterface *)v19[0];
    v19[0] = 0;
    value = self->online_detector_.__ptr_.__value_;
    self->online_detector_.__ptr_.__value_ = v3;
    if (value)
    {
      (*(void (**)(OU3DODInterface *))(*(_QWORD *)value + 8))(value);
      v5 = v19[0];
      v19[0] = 0;
      if (v5)
        (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
    }
    _OULoggingGetOSLogForCategoryObjectUnderstanding();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(v19[0]) = 0;
      _os_log_impl(&dword_2294C8000, v6, OS_LOG_TYPE_INFO, "[3DOD] SSD Online model has been loaded.", (uint8_t *)v19, 2u);
    }

  }
  else
  {
    _OULoggingGetOSLogForCategoryObjectUnderstanding();
    v6 = objc_claimAutoreleasedReturnValue();
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2294C8000, v6, OS_LOG_TYPE_INFO, "============ 3D Object Detector has been initialized. =========", buf, 2u);
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2294C8000, v6, OS_LOG_TYPE_INFO, "Start to init 3D Object Representation.", buf, 2u);
  }

  v7 = (ou3dor::OU3DObjectRepresentation *)operator new();
  ou3dor::OU3DObjectRepresentation::OU3DObjectRepresentation(v7, self->isOnline_);
  std::unique_ptr<ou3dor::OU3DObjectRepresentation>::reset[abi:ne180100]((ou3dor::OU3DObjectRepresentation **)&self->ou3dor_, v7);
  self->det_params = ($965F03D6AAC245BED10E1BEB9B58A841 *)&kOU3DObjectDetectorParamsSSD3d;
  self->tanRgbFOV_ = 0.48306;
  self->worldPointCloudCapacity = 1000000;
  *(_OWORD *)&self->minDetectionInterval = xmmword_229561E20;
  *(_OWORD *)&self->frustumFOV = xmmword_229561E30;
  std::vector<std::vector<float>>::reserve((uint64_t *)&self->hist_ori_iou_mat_, 0x1F4uLL);
  std::vector<std::vector<float>>::reserve((uint64_t *)&self->hist_nms_iou_mat_, 0x1F4uLL);
  self->hist_kept_box_ids_.__end_ = self->hist_kept_box_ids_.__begin_;
  self->hist_boxes_cnt_ = 0;
  det_params = self->det_params;
  if (det_params->var0 >= 1)
  {
    v9 = 0;
    v10 = 0;
    do
    {
      *(_QWORD *)buf = &det_params->var2[v9];
      *((_WORD *)std::__tree<std::__value_type<NSString * {__strong},short>,std::__map_value_compare<NSString * {__strong},std::__value_type<NSString * {__strong},short>,CompareNSString,true>,std::allocator<std::__value_type<NSString * {__strong},short>>>::__emplace_unique_key_args<NSString * {__strong},std::piecewise_construct_t const&,std::tuple<NSString * const {__strong}&>,std::tuple<>>((uint64_t **)&self->obj_type_to_index, *(void ***)buf, (uint64_t)&std::piecewise_construct, (id **)buf)+ 20) = v10++;
      det_params = self->det_params;
      ++v9;
    }
    while (v10 < det_params->var0);
  }
  v11 = objc_alloc_init(OU3DObjectMerger);
  merger = self->merger;
  self->merger = v11;

  v13 = objc_alloc_init(OUObjectCompleteness);
  object_completeness = self->object_completeness_;
  self->object_completeness_ = v13;

  v15 = objc_alloc_init(OUObjectAsset);
  objectAsset = self->objectAsset_;
  self->objectAsset_ = v15;

  v17 = objc_alloc_init(OUPointCloud);
  worldPointCloud = self->worldPointCloud;
  self->worldPointCloud = v17;

  self->floor_height_ = 3.4028e38;
  -[OU3DObjectDetector clear](self, "clear");
}

- (id)run
{
  OUVizTool *v3;
  OUVizTool *v4;
  BOOL v5;
  void *v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSArray *v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSArray *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  void *v41;
  void *v42;
  _OUFrame *v43;
  void *v44;
  float floor_height;
  NSArray *v46;
  uint64_t v47;
  NSArray *pre_rgb_size_refined;
  void *v49;
  uint64_t value;
  void *v51;
  NSArray *v52;
  void *v53;
  int v54;
  NSObject *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSArray *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t j;
  void *v67;
  void *v68;
  char v69;
  void *v70;
  void *v71;
  float v72;
  float v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  OU3DObjectDetector *v78;
  uint64_t v79;
  id v80;
  id *p_allObjects;
  void *v82;
  OU3DObjectDetector *v83;
  void *v84;
  void *v85;
  char *v86;
  uint64_t v87;
  char *v88;
  id v89;
  OUBox3d v90;
  id v91;
  id v92;
  id v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  __int128 v98[8];
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  char **v107;
  char v108;
  OUBox3d v109;
  id v110;
  id v111;
  id v112;
  void *v113;
  void *v114;
  void *__p;
  id v116;
  _BYTE v117[128];
  _BYTE v118[128];
  uint64_t v119;

  v119 = *MEMORY[0x24BDAC8D0];
  v3 = (OUVizTool *)kdebug_trace();
  v4 = (OUVizTool *)OUVizTool::Get(v3);
  OUVizTool::StartNewFrame(v4);
  v83 = self;
  v5 = -[OU3DObjectDetector preprocess](self, "preprocess");
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLForKey:", CFSTR("3dod_earlyout_preprocess"));

  if (v7)
  {
    _OULoggingGetOSLogForCategoryObjectUnderstanding();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[OU3DObjectDetector run].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
LABEL_4:

    v16 = v83->allObjects;
    return v16;
  }
  if (!v5)
  {
    kdebug_trace();
    v16 = (NSArray *)MEMORY[0x24BDBD1A8];
    return v16;
  }
  -[OU3DObjectDetector modelProcess](v83, "modelProcess");
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "BOOLForKey:", CFSTR("3dod_earlyout_inference"));

  if (v18)
  {
    _OULoggingGetOSLogForCategoryObjectUnderstanding();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[OU3DObjectDetector run].cold.2(v8, v19, v20, v21, v22, v23, v24, v25);
    goto LABEL_4;
  }
  -[OU3DObjectDetector postprocess](v83, "postprocess");
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "BOOLForKey:", CFSTR("3dod_earlyout_post_process"));

  if (v28)
  {
    _OULoggingGetOSLogForCategoryObjectUnderstanding();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[OU3DObjectDetector run].cold.3(v8, v29, v30, v31, v32, v33, v34, v35);
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  v36 = v83->allObjects;
  v37 = -[NSArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v103, v118, 16);
  if (v37)
  {
    v38 = *(_QWORD *)v104;
    do
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v104 != v38)
          objc_enumerationMutation(v36);
        v40 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * i);
        if (objc_msgSend(v40, "hasBoxesDict:", CFSTR("rawdetection")))
          objc_msgSend(v85, "addObject:", v40);
      }
      v37 = -[NSArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v103, v118, 16);
    }
    while (v37);
  }

  boxesToObjects((uint64_t *)&v83->merged_box3ds_, CFSTR("rawdetection"), 1u);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  packBoxesDict(v41, (uint64_t *)&v83->merged_box3ds_, CFSTR("raw_postprocess"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  -[OU3DObjectDetector assignIdentifiersForNewObjects:withOldObjects:](v83, "assignIdentifiersForNewObjects:withOldObjects:", v42, v85);
  -[OU3DObjectDetector regulateObjectSize:withOldObjects:](v83, "regulateObjectSize:withOldObjects:", v42, v85);
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  -[OU3DObjectDetector regulateObjectCornerOrders:withOldObjects:](v83, "regulateObjectCornerOrders:withOldObjects:", v82, v85);
  -[OU3DObjectDetector CopyObjectEmbedding:fromOldObjects:](v83, "CopyObjectEmbedding:fromOldObjects:", v82, v85);
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (v83->_RgbRefinementEnabled
    && OU3DObjectRGBSizeRefiner::IsOUFrameValid((OU3DObjectRGBSizeRefiner *)v83->arframe_, v43))
  {
    floor_height = *((float *)v83->online_detector_.__ptr_.__value_ + 40);
    if (floor_height >= v83->floor_height_)
      floor_height = v83->floor_height_;
    v83->floor_height_ = floor_height;
    if (!v83->object_rgb_size_refiner_.__ptr_.__value_)
      -[OU3DObjectDetector InitializeRGBRefinement:](v83, "InitializeRGBRefinement:", v83->arframe_);
    v46 = v83->pre_rgb_size_refined_;
    v47 = objc_msgSend(v82, "copy");
    pre_rgb_size_refined = v83->pre_rgb_size_refined_;
    v83->pre_rgb_size_refined_ = (NSArray *)v47;

    -[OU3DObjectDetector CopyRefineHistory:fromOldObjects:](v83, "CopyRefineHistory:fromOldObjects:", v83->pre_rgb_size_refined_, v85);
    -[OU3DObjectDetector CopyRefineHistory:fromOldObjects:](v83, "CopyRefineHistory:fromOldObjects:", v82, v85);
    -[OU3DObjectDetector ResestObjectSizeHistoryIfSizeChange:withOldObjects:](v83, "ResestObjectSizeHistoryIfSizeChange:withOldObjects:", v82, v85);
    -[OU3DObjectDetector FindNeedRefineBoxUUID:withOldObjects:](v83, "FindNeedRefineBoxUUID:withOldObjects:", v82, v46);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    value = (uint64_t)v83->object_rgb_size_refiner_.__ptr_.__value_;
    *(float *)(value + 352) = v83->floor_height_;
    OU3DObjectRGBSizeRefiner::RefineObjects(value, v82, v83->arframe_, (uint64_t)v83->_anon_e0, (uint64_t)v83->_anon_e0, v85, v49, v44);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    v52 = v83->pre_rgb_size_refined_;
    OU3DObjectRGBSizeRefiner::GetRefinerParams(v83->object_rgb_size_refiner_.__ptr_.__value_, (uint64_t)&v90);
    SmoothRefinedBoxes(v51, v52, (uint64_t)&v90, v44, v85, *((_DWORD *)v83->object_rgb_size_refiner_.__ptr_.__value_ + 49));
    OU3DObjectRGBSizeRefinerParams::~OU3DObjectRGBSizeRefinerParams(&v90.var1);
    v83->num_pre_key_frames_ = v83->num_cur_key_frames_;

    v82 = v51;
  }
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v53, "BOOLForKey:", CFSTR("3dod_earlyout_size_refinement"));

  p_allObjects = (id *)&v83->allObjects;
  if (v54)
  {
    _OULoggingGetOSLogForCategoryObjectUnderstanding();
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
      -[OU3DObjectDetector run].cold.4(v55, v56, v57, v58, v59, v60, v61, v62);

    v16 = (NSArray *)*p_allObjects;
  }
  else
  {
    kdebug_trace();
    -[OUObjectCompleteness updateRawCornersStatusNoTimer:withOldObjects:cameraPose:camera:](v83->object_completeness_, "updateRawCornersStatusNoTimer:withOldObjects:cameraPose:camera:", v82, v85, v83->camera_, *(double *)v83->_anon_a0, *(double *)&v83->_anon_a0[16], *(double *)&v83->_anon_a0[32], *(double *)&v83->_anon_a0[48]);
    kdebug_trace();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = 0u;
    v102 = 0u;
    v99 = 0u;
    v100 = 0u;
    v63 = v83->pre_rgb_size_refined_;
    v64 = -[NSArray countByEnumeratingWithState:objects:count:](v63, "countByEnumeratingWithState:objects:count:", &v99, v117, 16);
    if (v64)
    {
      v65 = *(_QWORD *)v100;
      do
      {
        for (j = 0; j != v64; ++j)
        {
          if (*(_QWORD *)v100 != v65)
            objc_enumerationMutation(v63);
          v67 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * j);
          objc_msgSend(v67, "identifier");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = objc_msgSend(v44, "containsObject:", v68);

          if ((v69 & 1) != 0)
          {
            objc_msgSend(v67, "boxesDict");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "objectForKey:", CFSTR("rawdetection"));
            v71 = (void *)objc_claimAutoreleasedReturnValue();

            if (v71)
            {
              memset(v98, 0, sizeof(v98));
              box3dFromNSArray(v71, (uint64_t)v98);
              objc_msgSend(v67, "type");
              v89 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "confidence");
              v73 = v72;
              objc_msgSend(v67, "identifier");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              OUBox3d::OUBox3d((uint64_t)&v90, v98, &v89, v74, v73);

              OUBox3d::OUBox3d(&v109, &v90);
              v86 = 0;
              v87 = 0;
              v88 = 0;
              v107 = &v86;
              v108 = 0;
              v86 = (char *)operator new(0xE0uLL);
              v87 = (uint64_t)v86;
              v88 = v86 + 224;
              v87 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<OUBox3d>,OUBox3d const*,OUBox3d const*,OUBox3d*>((uint64_t)&v88, (uint64_t)&v109, (uint64_t)v117, (uint64_t)v86);
              boxesToObjects((uint64_t *)&v86, CFSTR("others"), 1u);
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v75, "objectAtIndexedSubscript:", 0);
              v76 = (void *)objc_claimAutoreleasedReturnValue();

              v107 = &v86;
              std::vector<OUBox3d>::__destroy_vector::operator()[abi:ne180100]((void ***)&v107);

              if (__p)
                operator delete(__p);
              if (v113)
              {
                v114 = v113;
                operator delete(v113);
              }

              objc_msgSend(v84, "addObject:", v76);
              if (v96)
                operator delete(v96);
              if (v94)
              {
                v95 = v94;
                operator delete(v94);
              }

            }
          }
        }
        v64 = -[NSArray countByEnumeratingWithState:objects:count:](v63, "countByEnumeratingWithState:objects:count:", &v99, v117, 16);
      }
      while (v64);
    }

    v77 = (void *)objc_msgSend(v84, "mutableCopy");
    objc_msgSend(v77, "addObjectsFromArray:", v82);
    -[OU3DObjectDetector assignParentId:isOffline:](v83, "assignParentId:isOffline:", v82, 0);
    objc_storeStrong(p_allObjects, v82);
    v78 = v83;
    -[OUInternalInfoDumper setFirstARFrame:](v83->debug_dumper_, "setFirstARFrame:", v83->arframe_);
    -[OUInternalInfoDumper dumpObjects:](v78->debug_dumper_, "dumpObjects:", v78->allObjects);
    -[OU3DObjectDetector MergeLShapeObjects:isLastFrame:](v78, "MergeLShapeObjects:isLastFrame:", v78->allObjects, 0);
    v79 = objc_claimAutoreleasedReturnValue();
    v80 = *p_allObjects;
    *p_allObjects = (id)v79;

    kdebug_trace();
    CheckOutputValidation(*p_allObjects);
    v16 = (NSArray *)*p_allObjects;

  }
  return v16;
}

- (BOOL)IsValidLShapePair:(const void *)a3 l_shape_pair:(const void *)a4
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  BOOL v10;
  BOOL v11;
  void *__p[2];
  char v14;
  _OWORD v15[2];
  int v16;

  memset(v15, 0, sizeof(v15));
  v16 = 1065353216;
  v5 = *(_QWORD *)a3;
  v6 = *((_QWORD *)a3 + 1);
  while (v5 != v6)
  {
    objc_msgSend(*(id *)(v5 + 144), "UUIDString");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v7, "UTF8String"));
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string>((uint64_t)v15, (unsigned __int8 *)__p, (uint64_t)__p);
    if (v14 < 0)
      operator delete(__p[0]);

    v5 += 224;
  }
  v8 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v15, (unsigned __int8 *)a4);
  v9 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v15, (unsigned __int8 *)a4 + 24);
  if (v8)
    v10 = v9 == 0;
  else
    v10 = 1;
  v11 = !v10;
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)v15);
  return v11;
}

- (id)MergeLShapeObjects:(id)a3 isLastFrame:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t *m;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  id v38;
  _QWORD *v39;
  void *v40;
  int v41;
  void *v42;
  int v43;
  NSObject *v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  OUVizTool *v53;
  void *v54;
  OUVizTool *v55;
  void *v56;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  uint64_t LShapeMergeInfo;
  id v63;
  NSObject *oslog;
  id v65;
  id obj;
  id v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  int v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint64_t v81;
  uint8_t *v82;
  _BYTE v83[128];
  id v84;
  uint8_t buf[16];
  uint64_t v86;
  _BYTE v87[128];
  const __CFString *v88;
  _QWORD v89[3];
  _QWORD v90[4];

  v4 = a4;
  v90[2] = *MEMORY[0x24BDAC8D0];
  v61 = a3;
  v6 = (void *)MEMORY[0x24BDBCF20];
  v71 = v4;
  if (v4)
  {
    v90[0] = CFSTR("Table");
    v90[1] = CFSTR("Cabinet");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v90, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v89[0] = CFSTR("Table");
    v89[1] = CFSTR("Cabinet");
    v89[2] = CFSTR("Sofa");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v89, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if ((v8 & 1) == 0
  {
    v58 = (void *)MEMORY[0x24BDBCF20];
    v88 = CFSTR("Table");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v88, 1, v60, v61);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setWithArray:", v59);
    -[OU3DObjectDetector MergeLShapeObjects:isLastFrame:]::kObjectTypesWithParentId = objc_claimAutoreleasedReturnValue();

  }
  LODWORD(v80) = 33;
  v9 = std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::find<int>(ou3dor::k3DORSupportedAttributeTypeMap, (int *)&v80);
  if (!v9)
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  v63 = (id)v9[3];
  -[NSDictionary allValues](self->keyframesPointCloud_, "allValues");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  rawBoxesFromObjects(v61, (uint64_t *)&v80);
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  obj = v60;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v87, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v77;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v77 != v11)
          objc_enumerationMutation(obj);
        v13 = *(id *)(*((_QWORD *)&v76 + 1) + 8 * i);
        v14 = (void *)MEMORY[0x24BDBCF20];
        v84 = v13;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v84, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setWithArray:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        ou3dod::OU3DLShapeObjectMerger::MergeLShape((uint64_t *)&v80, v70, v16, v71, buf);
        std::vector<OUBox3d>::__vdeallocate((void **)&v80);
        v80 = *(_OWORD *)buf;
        v81 = v86;
        v86 = 0;
        memset(buf, 0, sizeof(buf));
        v82 = buf;
        std::vector<OUBox3d>::__destroy_vector::operator()[abi:ne180100]((void ***)&v82);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v87, 16);
    }
    while (v10);
  }

  LShapeMergeInfo = ou3dod::OU3DLShapeObjectMerger::GetLShapeMergeInfo((ou3dod::OU3DLShapeObjectMerger *)self->l_shape_merger_.__ptr_.__value_);
  _OULoggingGetOSLogForCategoryObjectUnderstanding();
  v17 = objc_claimAutoreleasedReturnValue();
  oslog = v17;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    -[OU3DObjectDetector MergeLShapeObjects:isLastFrame:].cold.1(v17, v18, v19);

  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v65 = v61;
  v20 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v72, v83, 16);
  if (v20)
  {
    v68 = *(_QWORD *)v73;
    do
    {
      v69 = v20;
      for (j = 0; j != v69; ++j)
      {
        if (*(_QWORD *)v73 != v68)
          objc_enumerationMutation(v65);
        v22 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * j);
        if ((objc_msgSend(v22, "hasBoxesDict:", CFSTR("rawdetection"), v60) & 1) != 0)
        {
          v23 = *((_QWORD *)&v80 + 1);
          for (k = v80; k != v23; k += 224)
          {
            objc_msgSend(v22, "identifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "UUIDString");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(k + 144), "UUIDString");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v26, "isEqualToString:", v27);

            if (v28)
            {
              objc_msgSend(v22, "addBoxesDict:forDictKey:", k, CFSTR("lshaped"));
              for (m = *(uint64_t **)(LShapeMergeInfo + 16); m; m = (uint64_t *)*m)
              {
                if (*((_BYTE *)m + 64)
                  && -[OU3DObjectDetector IsValidLShapePair:l_shape_pair:](self, "IsValidLShapePair:l_shape_pair:", &v80, m + 2))
                {
                  objc_msgSend(v22, "identifier");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v30, "UUIDString");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  v32 = objc_alloc(MEMORY[0x24BDD17C8]);
                  if (*((char *)m + 39) < 0)
                    v33 = m[2];
                  else
                    v33 = (uint64_t)(m + 2);
                  v34 = (void *)objc_msgSend(v32, "initWithUTF8String:", v33);
                  v35 = objc_msgSend(v31, "isEqualToString:", v34);

                  objc_msgSend(v22, "identifier");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "UUIDString");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  v38 = objc_alloc(MEMORY[0x24BDD17C8]);
                  v39 = m + 5;
                  if (*((char *)m + 63) < 0)
                    v39 = (_QWORD *)*v39;
                  v40 = (void *)objc_msgSend(v38, "initWithUTF8String:", v39);
                  v41 = objc_msgSend(v37, "isEqualToString:", v40);

                  if ((v35 | v41) == 1 && (v71 & 1) != 0)
                  {
                    objc_msgSend(v22, "type");
                    v42 = (void *)objc_claimAutoreleasedReturnValue();
                    v43 = objc_msgSend(v42, "isEqualToString:", CFSTR("Table"));

                    if (v43)
                    {
                      v44 = oslog;
                      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
                      {
                        objc_msgSend(v22, "identifier");
                        v51 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v51, "UUIDString");
                        v52 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138412290;
                        *(_QWORD *)&buf[4] = v52;
                        _os_log_debug_impl(&dword_2294C8000, oslog, OS_LOG_TYPE_DEBUG, "[3DOD] Add L shape attribute %@", buf, 0xCu);

                        v44 = oslog;
                      }

                      objc_msgSend(v22, "addObjectPartAttribute:", v63);
                    }
                    if (v41)
                    {
                      v45 = (void *)-[OU3DObjectDetector MergeLShapeObjects:isLastFrame:]::kObjectTypesWithParentId;
                      objc_msgSend(v22, "type");
                      v46 = (void *)objc_claimAutoreleasedReturnValue();
                      LODWORD(v45) = objc_msgSend(v45, "containsObject:", v46);

                      if ((_DWORD)v45)
                      {
                        v47 = objc_alloc(MEMORY[0x24BDD1880]);
                        if (*((char *)m + 39) >= 0)
                          v48 = (uint64_t)(m + 2);
                        else
                          v48 = m[2];
                        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v48);
                        v49 = (void *)objc_claimAutoreleasedReturnValue();
                        v50 = (void *)objc_msgSend(v47, "initWithUUIDString:", v49);

                        objc_msgSend(v22, "setParent_id:", v50);
                      }
                    }
                  }
                }
              }
              goto LABEL_47;
            }
          }
        }
        else
        {
LABEL_47:
          objc_msgSend(v67, "addObject:", v22);
        }
      }
      v20 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v72, v83, 16);
    }
    while (v20);
  }

  v54 = OUVizTool::Get(v53);
  std::string::basic_string[abi:ne180100]<0>(buf, "before_l_shape");
  OUVizTool::SaveObjects((uint64_t)v54, (uint64_t)buf, v67, CFSTR("rawdetection"));
  if (SHIBYTE(v86) < 0)
    operator delete(*(void **)buf);
  v56 = OUVizTool::Get(v55);
  std::string::basic_string[abi:ne180100]<0>(buf, "after_l_shape");
  OUVizTool::SaveObjects((uint64_t)v56, (uint64_t)buf, v67, CFSTR("lshaped"));
  if (SHIBYTE(v86) < 0)
    operator delete(*(void **)buf);
  *(_QWORD *)buf = &v80;
  std::vector<OUBox3d>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);

  return v67;
}

- (void)buildFrustumPointCloudFromWorldPointCloud
{
  double v3;
  uint64_t v4;
  float v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  float32x4_t v12;
  uint64_t v13;
  uint64_t j;
  float32x4_t v15;
  unint64_t v16;
  float32x4_t *v17;
  _OWORD *f32;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char *v23;
  float32x4_t *v24;
  float32x4_t *v25;
  char *v26;
  float32x4_t v27;
  unint64_t v28;
  _DWORD *v29;
  _DWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char *v35;
  char *v36;
  char *v37;
  char *v38;
  int v39;
  _QWORD *v40;
  unint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char *v47;
  char *v48;
  char *v49;
  char *v50;
  uint64_t v51;
  NSDictionary *obj;
  unsigned __int8 *v53;
  unsigned __int8 *v54;
  unsigned __int8 *v55;
  uint64_t v56;
  float32x4_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  kdebug_trace();
  *(_QWORD *)&self->_anon_1c0[8] = *(_QWORD *)self->_anon_1c0;
  *(_QWORD *)&self->_anon_1c0[32] = *(_QWORD *)&self->_anon_1c0[24];
  *(_QWORD *)&self->_anon_1c0[56] = *(_QWORD *)&self->_anon_1c0[48];
  *(_QWORD *)&self->_anon_1c0[80] = *(_QWORD *)&self->_anon_1c0[72];
  OUPointCloudCpp::Reserve((OUPointCloudCpp *)self->_anon_1c0, 0x1ADB0uLL);
  -[OUPointCloud reset](self->worldPointCloud, "reset");
  v3 = tan(self->frustumFOV * 0.5);
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  obj = self->keyframesPointCloud_;
  v4 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
  if (v4)
  {
    v54 = &self->_anon_1c0[48];
    v55 = &self->_anon_1c0[24];
    v53 = &self->_anon_1c0[72];
    v5 = v3;
    v56 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v59 != v56)
          objc_enumerationMutation(obj);
        -[NSDictionary objectForKey:](self->keyframesPointCloud_, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "count");
        v9 = objc_msgSend(v7, "semanticLabels");
        v10 = objc_msgSend(v7, "points");
        v11 = objc_msgSend(v7, "semanticVotes");
        if (v8)
        {
          v13 = v11;
          for (j = 0; j != v8; ++j)
          {
            v12.i32[0] = *(_DWORD *)(v9 + 4 * j);
            *(int16x4_t *)v12.f32 = vceq_s16((int16x4_t)(vmovl_u8(*(uint8x8_t *)v12.f32).u64[0] & 0xFF00FF00FF00FFLL), (int16x4_t)0xA000A000A000ALL);
            if ((vmaxv_u16(*(uint16x4_t *)v12.f32) & 1) == 0)
            {
              v12 = *(float32x4_t *)(v10 + 16 * j);
              v15 = vaddq_f32(*(float32x4_t *)&self->_anon_140[48], vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*(float32x4_t *)self->_anon_140, v12.f32[0]), *(float32x4_t *)&self->_anon_140[16], *(float32x2_t *)v12.f32, 1), *(float32x4_t *)&self->_anon_140[32], v12, 2));
              if (v15.f32[0] <= 3.6
                && v15.f32[0] >= -3.6
                && v15.f32[1] <= 4.8
                && v15.f32[1] >= 0.0
                && fabsf(v15.f32[0] / v15.f32[1]) <= v5)
              {
                v57 = v15;
                v17 = *(float32x4_t **)&self->_anon_1c0[32];
                v16 = *(_QWORD *)&self->_anon_1c0[40];
                if ((unint64_t)v17 >= v16)
                {
                  v19 = ((uint64_t)v17 - *(_QWORD *)v55) >> 4;
                  if ((unint64_t)(v19 + 1) >> 60)
                    std::vector<float>::__throw_length_error[abi:ne180100]();
                  v20 = v16 - *(_QWORD *)v55;
                  v21 = v20 >> 3;
                  if (v20 >> 3 <= (unint64_t)(v19 + 1))
                    v21 = v19 + 1;
                  if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFF0)
                    v22 = 0xFFFFFFFFFFFFFFFLL;
                  else
                    v22 = v21;
                  if (v22)
                    v23 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv3_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&self->_anon_1c0[40], v22);
                  else
                    v23 = 0;
                  v24 = (float32x4_t *)&v23[16 * v19];
                  *v24 = v57;
                  f32 = (_OWORD *)v24[1].f32;
                  v26 = *(char **)&self->_anon_1c0[24];
                  v25 = *(float32x4_t **)&self->_anon_1c0[32];
                  if (v25 != (float32x4_t *)v26)
                  {
                    do
                    {
                      v27 = v25[-1];
                      --v25;
                      v24[-1] = v27;
                      --v24;
                    }
                    while (v25 != (float32x4_t *)v26);
                    v25 = *(float32x4_t **)v55;
                  }
                  *(_QWORD *)&self->_anon_1c0[24] = v24;
                  *(_QWORD *)&self->_anon_1c0[32] = f32;
                  *(_QWORD *)&self->_anon_1c0[40] = &v23[16 * v22];
                  if (v25)
                    operator delete(v25);
                }
                else
                {
                  *v17 = v15;
                  f32 = (_OWORD *)v17[1].f32;
                }
                *(_QWORD *)&self->_anon_1c0[32] = f32;
                v29 = *(_DWORD **)&self->_anon_1c0[56];
                v28 = *(_QWORD *)&self->_anon_1c0[64];
                if ((unint64_t)v29 >= v28)
                {
                  v31 = ((uint64_t)v29 - *(_QWORD *)v54) >> 2;
                  if ((unint64_t)(v31 + 1) >> 62)
                    std::vector<float>::__throw_length_error[abi:ne180100]();
                  v32 = v28 - *(_QWORD *)v54;
                  v33 = v32 >> 1;
                  if (v32 >> 1 <= (unint64_t)(v31 + 1))
                    v33 = v31 + 1;
                  if ((unint64_t)v32 >= 0x7FFFFFFFFFFFFFFCLL)
                    v34 = 0x3FFFFFFFFFFFFFFFLL;
                  else
                    v34 = v33;
                  if (v34)
                    v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&self->_anon_1c0[64], v34);
                  else
                    v35 = 0;
                  v36 = &v35[4 * v31];
                  *(_DWORD *)v36 = *(_DWORD *)(v9 + 4 * j);
                  v30 = v36 + 4;
                  v38 = *(char **)&self->_anon_1c0[48];
                  v37 = *(char **)&self->_anon_1c0[56];
                  if (v37 != v38)
                  {
                    do
                    {
                      v39 = *((_DWORD *)v37 - 1);
                      v37 -= 4;
                      *((_DWORD *)v36 - 1) = v39;
                      v36 -= 4;
                    }
                    while (v37 != v38);
                    v37 = *(char **)v54;
                  }
                  *(_QWORD *)&self->_anon_1c0[48] = v36;
                  *(_QWORD *)&self->_anon_1c0[56] = v30;
                  *(_QWORD *)&self->_anon_1c0[64] = &v35[4 * v34];
                  if (v37)
                    operator delete(v37);
                }
                else
                {
                  *v29 = *(_DWORD *)(v9 + 4 * j);
                  v30 = v29 + 1;
                }
                *(_QWORD *)&self->_anon_1c0[56] = v30;
                v40 = *(_QWORD **)&self->_anon_1c0[80];
                v41 = *(_QWORD *)&self->_anon_1c0[88];
                if ((unint64_t)v40 >= v41)
                {
                  v43 = ((uint64_t)v40 - *(_QWORD *)v53) >> 3;
                  if ((unint64_t)(v43 + 1) >> 61)
                    std::vector<float>::__throw_length_error[abi:ne180100]();
                  v44 = v41 - *(_QWORD *)v53;
                  v45 = v44 >> 2;
                  if (v44 >> 2 <= (unint64_t)(v43 + 1))
                    v45 = v43 + 1;
                  if ((unint64_t)v44 >= 0x7FFFFFFFFFFFFFF8)
                    v46 = 0x1FFFFFFFFFFFFFFFLL;
                  else
                    v46 = v45;
                  if (v46)
                    v47 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&self->_anon_1c0[88], v46);
                  else
                    v47 = 0;
                  v48 = &v47[8 * v43];
                  v12.i64[0] = *(_QWORD *)(v13 + 8 * j);
                  *(_QWORD *)v48 = v12.i64[0];
                  v42 = v48 + 8;
                  v49 = *(char **)&self->_anon_1c0[80];
                  v50 = *(char **)&self->_anon_1c0[72];
                  if (v49 != v50)
                  {
                    do
                    {
                      v51 = *((_QWORD *)v49 - 1);
                      v49 -= 8;
                      v12.i32[1] = HIDWORD(v51);
                      *((_QWORD *)v48 - 1) = v51;
                      v48 -= 8;
                    }
                    while (v49 != v50);
                    v49 = *(char **)v53;
                  }
                  *(_QWORD *)&self->_anon_1c0[72] = v48;
                  *(_QWORD *)&self->_anon_1c0[80] = v42;
                  *(_QWORD *)&self->_anon_1c0[88] = &v47[8 * v46];
                  if (v49)
                    operator delete(v49);
                }
                else
                {
                  v12.i64[0] = *(_QWORD *)(v13 + 8 * j);
                  *v40 = v12.i64[0];
                  v42 = v40 + 1;
                }
                *(_QWORD *)&self->_anon_1c0[80] = v42;
              }
            }
          }
        }
        _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE6resizeEm((uint64_t)self->_anon_1c0, (uint64_t)(*(_QWORD *)&self->_anon_1c0[32] - *(_QWORD *)&self->_anon_1c0[24]) >> 4);
        -[OUPointCloud append:points:semanticLabels:semanticVotes:colors:](self->worldPointCloud, "append:points:semanticLabels:semanticVotes:colors:", objc_msgSend(v7, "count"), objc_msgSend(v7, "points"), objc_msgSend(v7, "semanticLabels"), objc_msgSend(v7, "semanticVotes"), objc_msgSend(v7, "colors"));

      }
      v4 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
    }
    while (v4);
  }

  kdebug_trace();
}

- (BOOL)preprocess
{
  unint64_t v3;
  float v4;
  int32x4_t v5;
  int32x4_t v6;
  int32x4_t v7;
  int32x4_t v8;
  __float2 v9;
  uint64_t v10;
  int32x4_t v11;
  float32x2x2_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float *v15;
  uint64_t v16;
  BOOL v17;
  simd_float4 v19;
  simd_float4 v20;
  int32x4_t v21;
  simd_float4 v22;
  int32x4_t v23;
  __int128 v24;
  simd_float4 v25;
  _OWORD v26[2];
  _OWORD v27[2];
  simd_float4x4 v28;
  simd_float4x4 v29;

  kdebug_trace();
  v24 = *(_OWORD *)&self->_anon_a0[48];
  v3 = vaddq_f32(*(float32x4_t *)&self->_anon_a0[32], vmlaq_f32(vmulq_f32(*(float32x4_t *)self->_anon_a0, (float32x4_t)0), (float32x4_t)0, *(float32x4_t *)&self->_anon_a0[16])).u64[0];
  v4 = 1.57079633 - atan2f(*((float *)&v3 + 1), *(float *)&v3);
  v5.i64[0] = 0;
  v5.i32[2] = 0;
  *(float *)&v5.i32[3] = -*(float *)&v24;
  v6.i64[0] = 0;
  v6.i32[2] = 0;
  *(float *)&v6.i32[3] = -*((float *)&v24 + 1);
  v21 = vzip2q_s32(v5, (int32x4_t)xmmword_2295604C0);
  v23 = vzip2q_s32(v6, (int32x4_t)xmmword_229560490);
  v9 = __sincosf_stret(v4);
  *(float *)v8.i32 = v9.__cosval;
  *(__float2 *)v7.i8 = v9;
  v10 = 0;
  *(float *)&v8.i32[1] = -v9.__sinval;
  v11 = vzip1q_s32(v8, (int32x4_t)0);
  v12 = (float32x2x2_t)vzip1q_s32(v7, (int32x4_t)0);
  v13 = (float32x4_t)vzip1q_s32(v11, (int32x4_t)v12);
  v14 = (float32x4_t)vzip2q_s32(v11, (int32x4_t)v12);
  v26[0] = xmmword_2295604A0;
  v26[1] = xmmword_2295604B0;
  v15 = (float *)v27;
  v12.val[0] = (float32x2_t)v21.i64[0];
  v16 = v23.i64[0];
  vst2_f32(v15, v12);
  v27[1] = vzip2q_s32(v21, v23);
  do
  {
    v28.columns[v10] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v13, COERCE_FLOAT(v26[v10])), v14, *(float32x2_t *)&v26[v10], 1), (float32x4_t)xmmword_2295604C0, (float32x4_t)v26[v10], 2), (float32x4_t)xmmword_229560490, (float32x4_t)v26[v10], 3);
    ++v10;
  }
  while (v10 != 4);
  v25 = v28.columns[0];
  v20 = v28.columns[2];
  v22 = v28.columns[1];
  v19 = v28.columns[3];
  v29 = __invert_f4(v28);
  *(simd_float4 *)self->_anon_140 = v25;
  *(simd_float4 *)&self->_anon_140[16] = v22;
  *(simd_float4 *)&self->_anon_140[32] = v20;
  *(simd_float4 *)&self->_anon_140[48] = v19;
  *(simd_float4x4 *)self->_anon_180 = v29;
  -[OU3DObjectDetector buildFrustumPointCloudFromWorldPointCloud](self, "buildFrustumPointCloudFromWorldPointCloud");
  v17 = *(_QWORD *)&self->_anon_1c0[32] - *(_QWORD *)&self->_anon_1c0[24] > 0x3E70uLL;
  kdebug_trace();
  return v17;
}

- (void)modelProcess
{
  OU3DODInterface *value;

  ou3dod::OU3DODInterface::Process((OUDnnInferenceInterface **)self->online_detector_.__ptr_.__value_, (const OUPointCloudCpp *)self->_anon_1c0);
  value = self->online_detector_.__ptr_.__value_;
  if (&self->cur_box3ds_ != (vector<OUBox3d, std::allocator<OUBox3d>> *)((char *)value + 8))
    std::vector<OUBox3d>::__assign_with_size[abi:ne180100]<OUBox3d*,OUBox3d*>((uint64_t)&self->cur_box3ds_, *((__int128 **)value + 1), *((__int128 **)value + 2), 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((_QWORD *)value + 2) - *((_QWORD *)value + 1)) >> 5));
}

- (void)ValidateRawDetections:(void *)a3
{
  __int128 *v4;
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  float32x4_t v10;

  v4 = (__int128 *)*((_QWORD *)a3 + 1);
  v5 = *(_QWORD *)a3;
  v6 = -1227133513 * (((unint64_t)v4 - *(_QWORD *)a3) >> 5);
  v7 = v6 - 1;
  if (v6 >= 1)
  {
    v8 = 0;
    do
    {
      v9 = *(_QWORD *)a3;
      if (objc_msgSend(*(id *)(*(_QWORD *)a3 + 224 * v8 + 128), "isEqualToString:", CFSTR("Chair"))
        && (v10 = vsubq_f32(*(float32x4_t *)(v9 + 224 * v8 + 16), *(float32x4_t *)(v9 + 224 * v8 + 32)),
            sqrtf(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v10, v10))) > 0.9))
      {
        std::swap[abi:ne180100]<OUBox3d>((__n128 *)(*(_QWORD *)a3 + 224 * v8), (__n128 *)(*(_QWORD *)a3 + 224 * v7--));
      }
      else
      {
        ++v8;
      }
    }
    while (v8 <= v7);
    v5 = *(_QWORD *)a3;
    v4 = (__int128 *)*((_QWORD *)a3 + 1);
  }
  std::vector<OUBox3d>::erase((uint64_t)a3, (__n128 *)(v5 + 224 * v7 + 224), v4);
}

- (void)postprocess
{
  NSObject *v3;
  uint64_t v4;
  OUBox3d *begin;
  OUBox3d *end;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  uint64_t i;
  __int128 *v12;
  OUBox3d *v13;
  __int128 *v14;
  void *v15;
  vector<int, std::allocator<int>> *p_hist_kept_box_ids;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  int *v21;
  void *v22;
  OU3DObjectMerger *merger;
  void *v24;
  OU3DObjectMerger *v25;
  OUVizTool *v26;
  void *v27;
  OU3DObjectMerger *v28;
  uint64_t *p_merged_box3ds;
  OUVizTool *v30;
  void *v31;
  __int128 v32;
  OUBox3d *v33;
  void *v34;
  _BYTE *v35;
  uint64_t v36[3];
  std::vector<int> v37;
  int v38;
  OUBox3d buf;
  id v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  void *__p;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  kdebug_trace();
  -[OU3DObjectDetector ValidateRawDetections:](self, "ValidateRawDetections:", &self->cur_box3ds_);
  _OULoggingGetOSLogForCategoryObjectUnderstanding();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 0x6DB6DB6DB6DB6DB7 * (((char *)self->cur_box3ds_.__end_ - (char *)self->cur_box3ds_.__begin_) >> 5);
    LODWORD(buf.var1) = 134217984;
    *(id *)((char *)&buf.var1 + 4) = (id)v4;
    _os_log_impl(&dword_2294C8000, v3, OS_LOG_TYPE_INFO, "[3DOD] Detected new objects: %zu", (uint8_t *)&buf, 0xCu);
  }

  begin = self->cur_box3ds_.__begin_;
  end = self->cur_box3ds_.__end_;
  if (begin != end)
  {
    v7 = *(float32x4_t *)self->_anon_180;
    v8 = *(float32x4_t *)&self->_anon_180[16];
    v9 = *(float32x4_t *)&self->_anon_180[32];
    v10 = *(float32x4_t *)&self->_anon_180[48];
    do
    {
      for (i = 0; i != 128; i += 16)
        *(float32x4_t *)((char *)&begin->var1 + i) = vaddq_f32(v10, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v7, COERCE_FLOAT(*(_OWORD *)((char *)&begin->var1 + i))), v8, *(float32x2_t *)((char *)&begin->var1 + i), 1), v9, *(float32x4_t *)((char *)&begin->var1 + i), 2));
      begin = (OUBox3d *)((char *)begin + 224);
    }
    while (begin != end);
  }
  sizeRevision((uint64_t *)&self->cur_box3ds_);
  v12 = (__int128 *)self->cur_box3ds_.__begin_;
  v13 = self->cur_box3ds_.__end_;
  if (v12 != (__int128 *)v13)
  {
    v14 = std::vector<OUBox3d>::__insert_with_size[abi:ne180100]<std::__wrap_iter<OUBox3d*>,std::__wrap_iter<OUBox3d*>>((uint64_t *)&self->acc_box3ds_, (__int128 *)self->acc_box3ds_.__end_, v12, (uint64_t)v13, 0x6DB6DB6DB6DB6DB7 * (((char *)v13 - (char *)v12) >> 5));
    v15 = OUVizTool::Get((OUVizTool *)v14);
    std::string::basic_string[abi:ne180100]<0>(&buf, "accumulatedBoxData");
    OUVizTool::SaveBoxes((uint64_t)v15, (uint64_t)&buf, (uint64_t *)&self->acc_box3ds_);
    if (SHIBYTE(buf.var3) < 0)
      operator delete(buf.var1);
    memset(v36, 0, sizeof(v36));
    p_hist_kept_box_ids = &self->hist_kept_box_ids_;
    withinClassNMS(&self->acc_box3ds_.__begin_, (std::vector<int> *)&self->hist_kept_box_ids_, &self->hist_ori_iou_mat_.__begin_, (uint64_t *)&self->hist_nms_iou_mat_, v36, (unint64_t **)&v34, 0.2);
    v33 = 0;
    v32 = 0uLL;
    std::vector<OUBox3d>::reserve((uint64_t *)&v32, (v35 - (_BYTE *)v34) >> 3);
    v17 = v34;
    v18 = v35;
    memset(&v37, 0, sizeof(v37));
    std::vector<OUBox3d>::__init_with_size[abi:ne180100]<OUBox3d*,OUBox3d*>(&v37, (uint64_t)self->acc_box3ds_.__begin_, (uint64_t)self->acc_box3ds_.__end_, 0x6DB6DB6DB6DB6DB7 * (((char *)self->acc_box3ds_.__end_ - (char *)self->acc_box3ds_.__begin_) >> 5));
    for (; v17 != v18; ++v17)
    {
      OUBox3d::OUBox3d(&buf, (const OUBox3d *)&v37.__begin_[56 * *v17]);
      std::vector<OUBox3d>::push_back[abi:ne180100]((uint64_t *)&v32, (__int128 *)&buf);

      if (__p)
        operator delete(__p);
      if (v43)
      {
        v44 = v43;
        operator delete(v43);
      }

    }
    buf.var1 = &v37;
    std::vector<OUBox3d>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
    std::vector<OUBox3d>::__vdeallocate((void **)&self->acc_box3ds_.__begin_);
    *(_OWORD *)&self->acc_box3ds_.__begin_ = v32;
    self->acc_box3ds_.__end_cap_.__value_ = v33;
    v33 = 0;
    v32 = 0uLL;
    buf.var1 = &v32;
    std::vector<OUBox3d>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
    memset(&v37, 0, sizeof(v37));
    std::vector<int>::reserve(&v37, (v35 - (_BYTE *)v34) >> 3);
    v19 = v34;
    v20 = v35;
    memset(&buf, 0, 24);
    std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(&buf, self->hist_kept_box_ids_.__begin_, (uint64_t)self->hist_kept_box_ids_.__end_, self->hist_kept_box_ids_.__end_ - self->hist_kept_box_ids_.__begin_);
    *(_QWORD *)&v32 = &v37;
    while (v19 != v20)
    {
      v38 = *((_DWORD *)buf.var1 + *v19);
      std::back_insert_iterator<std::vector<int>>::operator=[abi:ne180100]((uint64_t *)&v32, &v38);
      ++v19;
    }
    if (buf.var1)
    {
      *(_QWORD *)&buf.var2 = buf.var1;
      operator delete(buf.var1);
    }
    v21 = p_hist_kept_box_ids->__begin_;
    if (p_hist_kept_box_ids->__begin_)
    {
      self->hist_kept_box_ids_.__end_ = v21;
      operator delete(v21);
      p_hist_kept_box_ids->__begin_ = 0;
      self->hist_kept_box_ids_.__end_ = 0;
      self->hist_kept_box_ids_.__end_cap_.__value_ = 0;
    }
    self->hist_kept_box_ids_ = (vector<int, std::allocator<int>>)v37;
    v22 = OUVizTool::Get((OUVizTool *)v21);
    std::string::basic_string[abi:ne180100]<0>(&buf, "withinClassNMSBoxData");
    OUVizTool::SaveBoxes((uint64_t)v22, (uint64_t)&buf, (uint64_t *)&self->acc_box3ds_);
    if (SHIBYTE(buf.var3) < 0)
      operator delete(buf.var1);
    merger = self->merger;
    if (merger)
      merger = -[OU3DObjectMerger mergeOtherObjects:](merger, "mergeOtherObjects:", &self->acc_box3ds_, (_QWORD)v32);
    else
      memset(&buf, 0, 24);
    v24 = OUVizTool::Get((OUVizTool *)merger);
    std::string::basic_string[abi:ne180100]<0>(&v37, "mergeOtherObjectsBoxData");
    OUVizTool::SaveBoxes((uint64_t)v24, (uint64_t)&v37, (uint64_t *)&buf);
    if (SHIBYTE(v37.__end_cap_.__value_) < 0)
      operator delete(v37.__begin_);
    v25 = self->merger;
    if (v25)
      -[OU3DObjectMerger mergeCabinets:iou_mat:](v25, "mergeCabinets:iou_mat:", &buf, v36);
    else
      memset(&v37, 0, sizeof(v37));
    std::vector<OUBox3d>::__vdeallocate(&buf.var1);
    *(_OWORD *)&buf.var1 = *(_OWORD *)&v37.__begin_;
    buf.var3 = v37.__end_cap_.__value_;
    memset(&v37, 0, sizeof(v37));
    *(_QWORD *)&v32 = &v37;
    std::vector<OUBox3d>::__destroy_vector::operator()[abi:ne180100]((void ***)&v32);
    v27 = OUVizTool::Get(v26);
    std::string::basic_string[abi:ne180100]<0>(&v37, "mergeCabinetsBoxData");
    OUVizTool::SaveBoxes((uint64_t)v27, (uint64_t)&v37, (uint64_t *)&buf);
    if (SHIBYTE(v37.__end_cap_.__value_) < 0)
      operator delete(v37.__begin_);
    v28 = self->merger;
    if (v28)
      -[OU3DObjectMerger crossClassNMS:](v28, "crossClassNMS:", &buf);
    else
      memset(&v37, 0, sizeof(v37));
    p_merged_box3ds = (uint64_t *)&self->merged_box3ds_;
    std::vector<OUBox3d>::__vdeallocate((void **)&self->merged_box3ds_.__begin_);
    self->merged_box3ds_ = (vector<OUBox3d, std::allocator<OUBox3d>>)v37;
    memset(&v37, 0, sizeof(v37));
    *(_QWORD *)&v32 = &v37;
    std::vector<OUBox3d>::__destroy_vector::operator()[abi:ne180100]((void ***)&v32);
    v31 = OUVizTool::Get(v30);
    std::string::basic_string[abi:ne180100]<0>(&v37, "crossClassNMSBoxData");
    OUVizTool::SaveBoxes((uint64_t)v31, (uint64_t)&v37, p_merged_box3ds);
    if (SHIBYTE(v37.__end_cap_.__value_) < 0)
      operator delete(v37.__begin_);
    v37.__begin_ = (std::vector<int>::pointer)&buf;
    std::vector<OUBox3d>::__destroy_vector::operator()[abi:ne180100]((void ***)&v37);
    if (v34)
    {
      v35 = v34;
      operator delete(v34);
    }
    buf.var1 = v36;
    std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
  }
  kdebug_trace();
}

- (void)ResestObjectSizeHistoryIfSizeChange:(id)a3 withOldObjects:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  BOOL v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id obj;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *__p[3];
  float32x4_t v30[8];
  void *v31[3];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v25 = a4;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v6)
  {
    v26 = *(_QWORD *)v37;
    do
    {
      v27 = v6;
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v37 != v26)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v7, "refined_box_history");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "count") == 0;

        if (!v9)
        {
          v34 = 0u;
          v35 = 0u;
          v32 = 0u;
          v33 = 0u;
          v10 = v25;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          if (v11)
          {
            v12 = *(_QWORD *)v33;
            do
            {
              for (j = 0; j != v11; ++j)
              {
                if (*(_QWORD *)v33 != v12)
                  objc_enumerationMutation(v10);
                objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * j), "identifier");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "identifier");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                v16 = objc_msgSend(v14, "isEqual:", v15);

                if ((v16 & 1) != 0)
                {
                  objc_msgSend(v7, "boxesDict");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("rawdetection"));
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  box3dFromNSArray(v18, (uint64_t)v30);
                  box3dToCentroidSizeAngle(v30, (uint64_t *)v31);

                  objc_msgSend(v7, "refined_box_history");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "lastObject");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "preRefinedBox");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  box3dFromNSArray(v21, (uint64_t)v30);
                  box3dToCentroidSizeAngle(v30, (uint64_t *)__p);

                  v22 = __p[0];
                  if ((float)(vabds_f32(*((float *)v31[0] + 3), *((float *)__p[0] + 3)) / *((float *)__p[0] + 3)) <= 0.25
                    && (float)(vabds_f32(*((float *)v31[0] + 4), *((float *)__p[0] + 4)) / *((float *)__p[0] + 4)) <= 0.25
                    && (float)(vabds_f32(*((float *)v31[0] + 5), *((float *)__p[0] + 5)) / *((float *)__p[0] + 5)) <= 0.25
                    || (v23 = (void *)objc_opt_new(),
                        objc_msgSend(v7, "setRefined_box_history:", v23),
                        v23,
                        (v22 = __p[0]) != 0))
                  {
                    __p[1] = v22;
                    operator delete(v22);
                  }
                  if (v31[0])
                  {
                    v31[1] = v31[0];
                    operator delete(v31[0]);
                  }
                }
              }
              v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
            }
            while (v11);
          }

        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v6);
  }

}

- (void)CopyRefineHistory:(id)a3 fromOldObjects:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  id obj;
  uint64_t v20;
  id v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v21 = a4;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v6)
  {
    v20 = *(_QWORD *)v28;
    do
    {
      v22 = v6;
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v9 = v21;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v10)
        {
          v11 = *(_QWORD *)v24;
          do
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v24 != v11)
                objc_enumerationMutation(v9);
              v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
              objc_msgSend(v13, "identifier");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "identifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v14, "isEqual:", v15);

              if ((v16 & 1) != 0)
              {
                objc_msgSend(v13, "refined_box_history");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = (void *)objc_msgSend(v17, "copy");
                objc_msgSend(v8, "setRefined_box_history:", v18);

              }
            }
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          }
          while (v10);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v6);
  }

}

- (void)CopyObjectEmbedding:(id)a3 fromOldObjects:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id obj;
  uint64_t v22;
  id v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v23 = a4;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v6)
  {
    v22 = *(_QWORD *)v30;
    do
    {
      v24 = v6;
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v30 != v22)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v9 = v23;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v10)
        {
          v11 = *(_QWORD *)v26;
          do
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v26 != v11)
                objc_enumerationMutation(v9);
              v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
              objc_msgSend(v13, "identifier");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "identifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v14, "isEqual:", v15);

              if ((v16 & 1) != 0)
              {
                objc_msgSend(v13, "embedding2d");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = (void *)objc_msgSend(v17, "copy");
                objc_msgSend(v8, "setEmbedding2d:", v18);

                objc_msgSend(v13, "embedding3d");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = (void *)objc_msgSend(v19, "copy");
                objc_msgSend(v8, "setEmbedding3d:", v20);

              }
            }
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          }
          while (v10);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v6);
  }

}

- (id)FindNeedRefineBoxUUID:(id)a3 withOldObjects:(id)a4
{
  id v5;
  id v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  float32x4_t *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void **v21;
  float32x4_t *v22;
  id *v23;
  uint64_t v24;
  char v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  uint64_t v31;
  void *__p[3];
  void *v34[3];
  float32x4_t *v35;
  void **v36;
  uint64_t v37[3];

  v5 = a3;
  v6 = a4;
  rawBoxesFromObjects(v5, v37);
  rawBoxesFromObjects(v6, (uint64_t *)&v35);
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v6;
  v7 = objc_msgSend(v5, "count");
  if (v7 >= 1)
  {
    v8 = 0;
    v31 = v7;
    do
    {
      v9 = v37[0];
      v10 = (float32x4_t *)(v37[0] + 224 * v8);
      if (-[NSSet containsObject:](self->rgb_refine_supported_types_, "containsObject:", v10[8].i64[0]))
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "refined_box_history");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "count");

        if (!v13)
          goto LABEL_15;
        if (self->num_pre_key_frames_ != self->num_cur_key_frames_)
          goto LABEL_11;
        objc_msgSend(v5, "objectAtIndexedSubscript:", v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v5;
        objc_msgSend(v14, "refined_box_history");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v16, "count"))
        {

          v5 = v15;
LABEL_11:
          v22 = v35;
          v21 = v36;
          if (v35 != (float32x4_t *)v36)
          {
            v23 = (id *)(v9 + 224 * v8 + 144);
            while (!objc_msgSend(*v23, "isEqual:", v22[9].i64[0]))
            {
              v22 += 14;
              if (v22 == (float32x4_t *)v21)
                goto LABEL_15;
            }
            box3dToCentroidSizeAngle(v22, (uint64_t *)v34);
            box3dToCentroidSizeAngle(v10, (uint64_t *)__p);
            v24 = 0;
            v25 = 0;
            v26 = __p[0];
            do
            {
              v25 |= vabds_f32(*(float *)((char *)v34[0] + v24), *(float *)((char *)__p[0] + v24)) > 0.05;
              v24 += 4;
            }
            while (v24 != 24);
            if ((v25 & 1) == 0 || (objc_msgSend(v30, "addObject:", *v23), (v26 = __p[0]) != 0))
            {
              __p[1] = v26;
              operator delete(v26);
            }
            if (v34[0])
            {
              v34[1] = v34[0];
              operator delete(v34[0]);
            }
            goto LABEL_23;
          }
LABEL_15:
          objc_msgSend(v30, "addObject:", *(_QWORD *)(v9 + 224 * v8 + 144));
          goto LABEL_23;
        }
        objc_msgSend(v15, "objectAtIndexedSubscript:", v8);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "refined_box_history");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "lastObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "refinedBox");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v5 = v15;
        if (!v20)
          goto LABEL_11;
      }
LABEL_23:
      ++v8;
    }
    while (v8 != v31);
  }
  v27 = (void *)objc_msgSend(v30, "copy");

  v34[0] = &v35;
  std::vector<OUBox3d>::__destroy_vector::operator()[abi:ne180100]((void ***)v34);
  v35 = (float32x4_t *)v37;
  std::vector<OUBox3d>::__destroy_vector::operator()[abi:ne180100]((void ***)&v35);

  return v27;
}

- (id)regulateObjectSize:(id)a3 withOldObjects:(id)a4
{
  id v5;
  int v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  id v20;
  __int32 i;
  void *v22;
  const __CFString *v24;
  id v25;
  void *__p[3];
  float32x4_t v27[8];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  int v32;
  _QWORD v33[4];
  int v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v25 = a4;
  v6 = 0;
  memset(v33, 0, sizeof(v33));
  v34 = 1065353216;
  v24 = CFSTR("rawdetection");
  while (1)
  {
    v32 = v6;
    if (objc_msgSend(v5, "count", v24) <= (unint64_t)v6)
      break;
    objc_msgSend(v5, "objectAtIndexedSubscript:", v32);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "type");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("Screen"));

    if ((v9 & 1) != 0)
    {
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v10 = v25;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v29;
LABEL_6:
        v13 = 0;
        while (1)
        {
          if (*(_QWORD *)v29 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v13);
          objc_msgSend(v7, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v15, "isEqual:", v16);

          if ((v17 & 1) != 0)
            break;
          if (v11 == ++v13)
          {
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
            if (v11)
              goto LABEL_6;
            goto LABEL_12;
          }
        }
      }
      else
      {
LABEL_12:

        objc_msgSend(v7, "boxesDict");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKey:", v24);
        v10 = (id)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          memset(v27, 0, sizeof(v27));
          box3dFromNSArray(v10, (uint64_t)v27);
          box3dToCentroidSizeAngle(v27, (uint64_t *)__p);
          v19 = __p[0];
          if (sqrtf((float)(*((float *)__p[0] + 5) * *((float *)__p[0] + 5))+ (float)(*((float *)__p[0] + 3) * *((float *)__p[0] + 3))) >= 0.94|| (std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>((uint64_t)v33, &v32, &v32), (v19 = __p[0]) != 0))
          {
            __p[1] = v19;
            operator delete(v19);
          }
        }
      }

    }
    v6 = v32 + 1;
  }
  v20 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  for (i = 0; ; i = v27[0].i32[0] + 1)
  {
    v27[0].i32[0] = i;
    if (objc_msgSend(v5, "count") <= (unint64_t)i)
      break;
    if (!std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::find<int>(v33, (int *)v27))
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v27[0].i32[0]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObject:", v22);

    }
  }
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)v33);

  return v20;
}

- (void)regulateObjectCornerOrders:(id)a3 withOldObjects:(id)a4
{
  id v5;
  OUVizTool *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  __int128 *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  float v22;
  uint64_t v23;
  float v24;
  int v25;
  float32x4_t v26;
  float32x4_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  int v35;
  int v36;
  uint64_t v37;
  int v38;
  int v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *__p[2];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  v5 = a3;
  v41 = a4;
  v44 = v5;
  kdebug_trace();
  rawBoxesFromObjects(v5, &v55);
  rawBoxesFromObjects(v41, &v53);
  v7 = OUVizTool::Get(v6);
  std::string::basic_string[abi:ne180100]<0>(__p, "regulateObjectCornerOrders");
  OUVizTool::SaveBoxes((uint64_t)v7, (uint64_t)__p, &v55);
  if (SBYTE7(v46) < 0)
    operator delete(__p[0]);
  v8 = v55;
  v9 = v56;
  if (v56 != v55)
  {
    v10 = 0;
    v11 = 0;
    v12 = v53;
    v13 = v54;
    v14 = 64;
    do
    {
      if (v13 == v12)
      {
        v13 = v12;
      }
      else
      {
        v15 = 0;
        v16 = 0;
        v17 = (__int128 *)(v8 + 224 * v11);
        v42 = v14;
        v43 = v10;
        v18 = v8 + v10;
        v19 = v8 + v14;
        do
        {
          if ((objc_msgSend(*(id *)(v55 + 224 * v11 + 144), "isEqual:", *(_QWORD *)(v12 + 224 * v16 + 144)) & 1) != 0)
          {
            v20 = 0;
            v21 = 0;
            v22 = 3.4028e38;
            do
            {
              v23 = 0;
              v24 = 0.0;
              do
              {
                v25 = (v20 + v23) & 3;
                if (v20 + (int)v23 <= 0)
                  v25 = -(-(v20 + v23) & 3);
                v26 = vsubq_f32((float32x4_t)v17[v25], *(float32x4_t *)(v53 + v15 + 16 * v23));
                v27 = vmulq_f32(v26, v26);
                v24 = v24
                    + sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v27, 2), vaddq_f32(v27, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v27.f32, 1))).f32[0]);
                ++v23;
              }
              while (v23 != 4);
              if (v24 < v22)
              {
                v22 = v24;
                v21 = v20;
              }
              ++v20;
            }
            while (v20 != 4);
            v51 = 0u;
            v52 = 0u;
            v49 = 0u;
            v50 = 0u;
            v47 = 0u;
            v48 = 0u;
            *(_OWORD *)__p = 0u;
            v46 = 0u;
            v28 = *v17;
            v29 = v17[1];
            v30 = v17[3];
            v47 = v17[2];
            v48 = v30;
            *(_OWORD *)__p = v28;
            v46 = v29;
            v31 = v17[4];
            v32 = v17[5];
            v33 = v17[7];
            v51 = v17[6];
            v52 = v33;
            v49 = v31;
            v50 = v32;
            if (v21 >= 1)
            {
              v34 = 0;
              v35 = 4 - v21;
              do
              {
                if (v35 + (int)v34 <= 0)
                  v36 = -(-(v35 + v34) & 3);
                else
                  v36 = (v35 + v34) & 3;
                *(_OWORD *)&__p[2 * v36] = *(_OWORD *)(v18 + 16 * v34++);
              }
              while (v34 != 4);
              v37 = 0;
              v38 = 8 - v21;
              do
              {
                if (v38 + (int)v37 <= 0)
                  v39 = -(-(v38 + v37) & 3);
                else
                  v39 = (v38 + v37) & 3;
                *(_OWORD *)&__p[2 * (v39 + 4)] = *(_OWORD *)(v19 + 16 * v37++);
              }
              while (v37 != 4);
            }
            objc_msgSend(v44, "objectAtIndexedSubscript:", v11);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "addBoxesDict:forDictKey:", __p, CFSTR("rawdetection"));

          }
          ++v16;
          v12 = v53;
          v13 = v54;
          v15 += 224;
        }
        while (0x6DB6DB6DB6DB6DB7 * ((v54 - v53) >> 5) > v16);
        v8 = v55;
        v9 = v56;
        v14 = v42;
        v10 = v43;
      }
      ++v11;
      v10 += 224;
      v14 += 224;
    }
    while (0x6DB6DB6DB6DB6DB7 * ((v9 - v8) >> 5) > v11);
  }
  kdebug_trace();
  __p[0] = &v53;
  std::vector<OUBox3d>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  __p[0] = &v55;
  std::vector<OUBox3d>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);

}

- (void)reviseObjectsUponParentId:(id)a3
{
  unint64_t i;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t j;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  uint64_t v22;
  void *v23;
  void *v24;
  float *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  float32x4_t v30[8];
  void *__p[3];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _OWORD v36[7];
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v29 = a3;
  for (i = 0; i < objc_msgSend(v29, "count"); ++i)
  {
    objc_msgSend(v29, "objectAtIndexedSubscript:", i);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "type");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Stove")) & 1) != 0)
    {
      objc_msgSend(v29, "objectAtIndexedSubscript:", i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "parent_id");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(v29, "objectAtIndexedSubscript:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        for (j = 0; ; ++j)
        {
          if (j >= objc_msgSend(v29, "count"))
          {

            goto LABEL_25;
          }
          objc_msgSend(v29, "objectAtIndexedSubscript:", j);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "parent_id");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v10, "isEqual:", v11) & 1) != 0)
          {
            objc_msgSend(v29, "objectAtIndexedSubscript:", j);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "hasBoxesDict:", CFSTR("rawdetection"));

            if ((v13 & 1) == 0)
              continue;
            objc_msgSend(v29, "objectAtIndexedSubscript:", j);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = 0u;
            memset(v36, 0, sizeof(v36));
            v28 = v14;
            objc_msgSend(v14, "boxesDict");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectForKey:", CFSTR("rawdetection"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            box3dFromNSArray(v16, (uint64_t)v36);

            v34 = 0u;
            v35 = 0u;
            v32 = 0u;
            v33 = 0u;
            objc_msgSend(v8, "boxesDict");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "allKeys");
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
            if (v19)
            {
              v20 = *(_QWORD *)v33;
              do
              {
                for (k = 0; k != v19; ++k)
                {
                  if (*(_QWORD *)v33 != v20)
                    objc_enumerationMutation(v18);
                  v22 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * k);
                  objc_msgSend(v8, "boxesDict");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "objectForKey:", v22);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  box3dFromNSArray(v24, (uint64_t)v30);
                  box3dToCentroidSizeAngle(v30, (uint64_t *)__p);

                  v25 = (float *)__p[0];
                  *((_DWORD *)__p[0] + 5) = 1028443341;
                  v25[2] = *((float *)&v37 + 2) + 0.025;
                  memset(v30, 0, sizeof(v30));
                  centroidSizeAngleToBox3d((uint64_t *)__p, 1, v30);
                  objc_msgSend(v8, "boxesDict");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  box3dToNSArray((__n128 *)v30);
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "setValue:forKey:", v27, v22);

                  if (__p[0])
                  {
                    __p[1] = __p[0];
                    operator delete(__p[0]);
                  }
                }
                v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
              }
              while (v19);
            }

          }
          else
          {

          }
        }
      }
    }
    else
    {

    }
  }
LABEL_25:

}

- (void)assignParentId:(id)a3 isOffline:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t j;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t k;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t m;
  void *v39;
  __CFString *v40;
  void *v41;
  int v42;
  uint64_t n;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  double v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  _BOOL4 v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  char v76;
  void *v77;
  char v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  float v85;
  float v86;
  double v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  NSObject *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  float32x4_t v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  float32x4_t v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  float32x4_t v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  uint8_t v127[4];
  void *v128;
  __int16 v129;
  void *v130;
  __int16 v131;
  double v132;
  __int16 v133;
  double v134;
  uint8_t buf[32];
  float v136[6];
  uint64_t v137;

  v4 = a4;
  v137 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = objc_msgSend(v5, "count");
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("Dishwasher"), CFSTR("Washer"), CFSTR("Oven"), 0);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("Stove"), CFSTR("Sink"), 0);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    _OULoggingGetOSLogForCategoryObjectUnderstanding();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[OU3DObjectDetector assignParentId:isOffline:].cold.1(v7, v8, v9);

    if (!v6)
      goto LABEL_59;
    for (i = 0; i != v6; ++i)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", i);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setParent_id:", 0);

    }
  }
  if (v6)
  {
    for (j = 0; j != v6; ++j)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", j);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "type");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v14, "isEqualToString:", CFSTR("Cabinet")) & 1) != 0)
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", j);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "hasBoxesDict:", CFSTR("rawdetection"));

        if ((v16 & 1) != 0)
        {
          v125 = 0u;
          v126 = 0u;
          v123 = 0u;
          v124 = 0u;
          v121 = 0u;
          v122 = 0u;
          v119 = 0u;
          v120 = 0u;
          objc_msgSend(v5, "objectAtIndexedSubscript:", j);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "boxesDict");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("rawdetection"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          box3dFromNSArray(v19, (uint64_t)&v119);

          for (k = 0; k != v6; ++k)
          {
            objc_msgSend(v5, "objectAtIndexedSubscript:", k);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "type");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v102, "containsObject:", v22) & 1) != 0)
            {
              objc_msgSend(v5, "objectAtIndexedSubscript:", k);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend(v23, "hasBoxesDict:", CFSTR("rawdetection"));

              if ((v24 & 1) != 0)
              {
                v117 = 0u;
                v118 = 0u;
                v115 = 0u;
                v116 = 0u;
                v113 = 0u;
                v114 = 0u;
                v111 = 0u;
                v112 = 0u;
                objc_msgSend(v5, "objectAtIndexedSubscript:", k);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "boxesDict");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("rawdetection"));
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                box3dFromNSArray(v27, (uint64_t)&v111);

                v104 = 0u;
                v105 = 0u;
                v103 = 0u;
                box3dIou(&v119, &v111, 0, (uint64_t)&v103);
                if (v103.f32[3] >= 0.8)
                {
                  LODWORD(v28) = v104;
                  if (*(float *)&v104 < *((float *)&v104 + 1))
                  {
                    objc_msgSend(v5, "objectAtIndexedSubscript:", j, v28);
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v29, "identifier");
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    v31 = (void *)objc_msgSend(v30, "copy");
                    objc_msgSend(v5, "objectAtIndexedSubscript:", k);
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v32, "setParent_id:", v31);

                    _OULoggingGetOSLogForCategoryObjectUnderstanding();
                    v33 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
                    {
                      objc_msgSend(v5, "objectAtIndexedSubscript:", k);
                      v97 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v97, "type");
                      v99 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v5, "objectAtIndexedSubscript:", j);
                      v34 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v34, "type");
                      v35 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v5, "objectAtIndexedSubscript:", k);
                      v36 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v36, "parent_id");
                      v37 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412802;
                      *(_QWORD *)&buf[4] = v99;
                      *(_WORD *)&buf[12] = 2112;
                      *(_QWORD *)&buf[14] = v35;
                      *(_WORD *)&buf[22] = 2112;
                      *(_QWORD *)&buf[24] = v37;
                      _os_log_debug_impl(&dword_2294C8000, v33, OS_LOG_TYPE_DEBUG, "%@ has parent object (%@) with parent_id: %@", buf, 0x20u);

                    }
                  }
                }
              }
            }
            else
            {

            }
          }
        }
      }
      else
      {

      }
    }
    for (m = 0; m != v6; ++m)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", m);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "type");
      v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v40 == CFSTR("Cabinet"))
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", m);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "hasBoxesDict:", CFSTR("rawdetection"));

        if (v42)
        {
          for (n = 0; n != v6; ++n)
          {
            objc_msgSend(v5, "objectAtIndexedSubscript:", n);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "type");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v101, "containsObject:", v45) & 1) != 0)
            {
              objc_msgSend(v5, "objectAtIndexedSubscript:", n);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v47 = objc_msgSend(v46, "hasBoxesDict:", CFSTR("rawdetection"));

              if ((v47 & 1) != 0)
              {
                v125 = 0u;
                v126 = 0u;
                v123 = 0u;
                v124 = 0u;
                v121 = 0u;
                v122 = 0u;
                v119 = 0u;
                v120 = 0u;
                objc_msgSend(v5, "objectAtIndexedSubscript:", m);
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "boxesDict");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("rawdetection"));
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                box3dFromNSArray(v50, (uint64_t)&v119);

                v117 = 0u;
                v118 = 0u;
                v115 = 0u;
                v116 = 0u;
                v113 = 0u;
                v114 = 0u;
                v111 = 0u;
                v112 = 0u;
                objc_msgSend(v5, "objectAtIndexedSubscript:", n);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "boxesDict");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("rawdetection"));
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                box3dFromNSArray(v53, (uint64_t)&v111);

                v109 = 0u;
                v110 = 0u;
                v107 = 0u;
                v108 = 0u;
                v105 = 0u;
                v106 = 0u;
                v103 = 0u;
                v104 = 0u;
                box3dEnlarge(&v111, 0.0, 0.0, 0.3, &v103);
                *(_OWORD *)v136 = 0u;
                memset(buf, 0, sizeof(buf));
                box3dIou(&v119, &v103, 0, (uint64_t)buf);
                if (*(float *)buf >= 0.000001)
                {
                  *(float *)&v54 = v136[1];
                  if (v136[1] >= 0.5)
                  {
                    objc_msgSend(v5, "objectAtIndexedSubscript:", m, v54);
                    v55 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v55, "identifier");
                    v56 = (void *)objc_claimAutoreleasedReturnValue();
                    v57 = (void *)objc_msgSend(v56, "copy");
                    objc_msgSend(v5, "objectAtIndexedSubscript:", n);
                    v58 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v58, "setParent_id:", v57);

                    _OULoggingGetOSLogForCategoryObjectUnderstanding();
                    v59 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
                    {
                      objc_msgSend(v5, "objectAtIndexedSubscript:", n);
                      v98 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v98, "type");
                      v100 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v5, "objectAtIndexedSubscript:", m);
                      v60 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v60, "type");
                      v61 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v5, "objectAtIndexedSubscript:", n);
                      v62 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v62, "parent_id");
                      v63 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
                      *(_DWORD *)v127 = 138412802;
                      v128 = v100;
                      v129 = 2112;
                      v130 = v61;
                      v131 = 2112;
                      v132 = v63;
                      _os_log_debug_impl(&dword_2294C8000, v59, OS_LOG_TYPE_DEBUG, "%@ has parent object (%@) with parent_id: %@", v127, 0x20u);

                    }
                  }
                }
              }
            }
            else
            {

            }
          }
        }
      }
      else
      {

      }
    }
    v64 = 0;
    while (1)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "type");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v66, "isEqualToString:", CFSTR("Sink")))
        goto LABEL_57;
      objc_msgSend(v5, "objectAtIndexedSubscript:", v64);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v67, "hasBoxesDict:", CFSTR("rawdetection")) & 1) == 0)
        break;
      objc_msgSend(v5, "objectAtIndexedSubscript:", v64);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "parent_id");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = v69 == 0;

      if (v70)
      {
        v71 = 0;
        while (1)
        {
          objc_msgSend(v5, "objectAtIndexedSubscript:", v71);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "type");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v73, "isEqualToString:", CFSTR("Cabinet")))
            break;
          objc_msgSend(v5, "objectAtIndexedSubscript:", v71);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "type");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = objc_msgSend(v75, "isEqualToString:", CFSTR("Table"));

          if ((v76 & 1) != 0)
            goto LABEL_47;
LABEL_54:
          if (v6 == ++v71)
            goto LABEL_58;
        }

LABEL_47:
        objc_msgSend(v5, "objectAtIndexedSubscript:", v71);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = objc_msgSend(v77, "hasBoxesDict:", CFSTR("rawdetection"));

        if ((v78 & 1) != 0)
        {
          v125 = 0u;
          v126 = 0u;
          v123 = 0u;
          v124 = 0u;
          v121 = 0u;
          v122 = 0u;
          v119 = 0u;
          v120 = 0u;
          objc_msgSend(v5, "objectAtIndexedSubscript:", v64);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "boxesDict");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "objectForKeyedSubscript:", CFSTR("rawdetection"));
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          box3dFromNSArray(v81, (uint64_t)&v119);

          v117 = 0u;
          v118 = 0u;
          v115 = 0u;
          v116 = 0u;
          v113 = 0u;
          v114 = 0u;
          v111 = 0u;
          v112 = 0u;
          objc_msgSend(v5, "objectAtIndexedSubscript:", v71);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "boxesDict");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("rawdetection"));
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          box3dFromNSArray(v84, (uint64_t)&v111);

          v85 = *((float *)&v123 + 2);
          v86 = *((float *)&v115 + 2);
          v109 = 0u;
          v110 = 0u;
          v107 = 0u;
          v108 = 0u;
          v105 = 0u;
          v106 = 0u;
          v103 = 0u;
          v104 = 0u;
          box3dEnlarge(&v119, 0.0, 0.0, 0.2, &v103);
          *(_OWORD *)v136 = 0u;
          memset(buf, 0, sizeof(buf));
          box3dIou(&v103, &v111, 0, (uint64_t)buf);
          v87 = *(float *)buf;
          if (*(float *)buf > 0.01 && v85 > v86)
          {
            *(float *)&v87 = v136[1];
            if (v136[1] >= 0.5)
            {
              objc_msgSend(v5, "objectAtIndexedSubscript:", v71, v87);
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v88, "identifier");
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              v90 = (void *)objc_msgSend(v89, "copy");
              objc_msgSend(v5, "objectAtIndexedSubscript:", v64);
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v91, "setParent_id:", v90);

              _OULoggingGetOSLogForCategoryObjectUnderstanding();
              v92 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v5, "objectAtIndexedSubscript:", v71);
                v93 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v93, "type");
                v94 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "objectAtIndexedSubscript:", v64);
                v95 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v95, "parent_id");
                v96 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v127 = 138413058;
                v128 = v94;
                v129 = 2112;
                v130 = v96;
                v131 = 2048;
                v132 = v136[0];
                v133 = 2048;
                v134 = v136[1];
                _os_log_debug_impl(&dword_2294C8000, v92, OS_LOG_TYPE_DEBUG, "The sink has parent object (%@) with parent_id: %@, %f, %f", v127, 0x2Au);

              }
            }
          }
        }
        goto LABEL_54;
      }
LABEL_58:
      if (++v64 == v6)
        goto LABEL_59;
    }

LABEL_57:
    goto LABEL_58;
  }
LABEL_59:

}

- (void)assignIdentifiersForNewObjects:(id)a3 withOldObjects:(id)a4
{
  id v5;
  id v6;
  __CFString *v7;
  uint64_t i;
  uint64_t j;
  uint64_t k;
  uint64_t m;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  void **v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t n;
  uint64_t v27;
  _DWORD *v28;
  _DWORD **v29;
  unint64_t v30;
  _QWORD *v31;
  _DWORD *v32;
  _DWORD *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char *v38;
  char *v39;
  int v40;
  uint64_t v41;
  _DWORD *v42;
  _DWORD **v43;
  unint64_t v44;
  _QWORD *v45;
  _DWORD *v46;
  _DWORD *v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char *v52;
  char *v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  int *v57;
  int *v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  int *v64;
  int *v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  int v69;
  void *v70;
  uint64_t v71;
  int *v72;
  void *v73;
  void *v74;
  void *v75;
  unint64_t v76;
  uint64_t v77;
  int *v78;
  int *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  unint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  int v92;
  int v93;
  _QWORD v94[3];
  int v95;
  _QWORD v96[3];
  int v97;
  _QWORD v98[3];
  _QWORD v99[6];
  float32x4_t v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  void *__p[2];
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  uint64_t v116;
  uint64_t v117;
  char v118[8];
  _QWORD *v119;
  char v120[8];
  _QWORD *v121;
  char v122[8];
  _QWORD *v123;
  char v124[8];
  _QWORD *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128[3];
  void *v129[2];
  void *v130[2];
  void *v131[2];
  void *v132[4];

  v132[2] = *(void **)MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  kdebug_trace();
  rawBoxesFromObjects(v5, v128);
  rawBoxesFromObjects(v6, &v126);
  v7 = CFSTR("Cabinet");
  v132[0] = v7;
  v132[1] = CFSTR("Shelf");
  std::set<NSString * {__strong},CompareNSString,std::allocator<NSString * {__strong}>>::set[abi:ne180100]((uint64_t)v124, v132, 2);
  for (i = 1; i != -1; --i)

  v131[0] = CFSTR("Sofa");
  v131[1] = CFSTR("Chair");
  std::set<NSString * {__strong},CompareNSString,std::allocator<NSString * {__strong}>>::set[abi:ne180100]((uint64_t)v122, v131, 2);
  for (j = 1; j != -1; --j)

  v130[0] = CFSTR("Dishwasher");
  v130[1] = CFSTR("Refrigerator");
  std::set<NSString * {__strong},CompareNSString,std::allocator<NSString * {__strong}>>::set[abi:ne180100]((uint64_t)v120, v130, 2);
  for (k = 1; k != -1; --k)

  v129[0] = v7;
  v129[1] = CFSTR("Table");
  std::set<NSString * {__strong},CompareNSString,std::allocator<NSString * {__strong}>>::set[abi:ne180100]((uint64_t)v118, v129, 2);
  for (m = 1; m != -1; --m)

  v13 = v128[0];
  v12 = v128[1];
  v90 = v126;
  v91 = v127;
  v100.i32[0] = -1082130432;
  v88 = 0x6DB6DB6DB6DB6DB7 * ((v127 - v126) >> 5);
  v84 = v6;
  std::vector<float>::vector(__p, v88, &v100);
  std::vector<std::vector<float>>::vector(&v116, (v12 - v13) / 224, (uint64_t)__p);
  v87 = (v12 - v13) / 224;
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  v85 = v13;
  v86 = v12;
  if (v12 != v13)
  {
    v14 = 0;
    if (v88 <= 1)
      v15 = 1;
    else
      v15 = v88;
    if (v87 <= 1)
      v16 = 1;
    else
      v16 = (v12 - v13) / 224;
    while (v91 == v90)
    {
LABEL_40:
      if (++v14 == v16)
        goto LABEL_41;
    }
    v17 = 0;
    v18 = 128;
    while (1)
    {
      v19 = objc_msgSend(*(id *)(v128[0] + 224 * v14 + 128), "isEqualToString:", *(_QWORD *)(v126 + v18));
      v20 = (void **)(v128[0] + 224 * v14 + 128);
      if ((v19 & 1) != 0)
        break;
      if (std::__tree<NSString * {__strong},CompareNSString,std::allocator<NSString * {__strong}>>::__count_unique<NSString * {__strong}>((uint64_t)v124, v20)
        && std::__tree<NSString * {__strong},CompareNSString,std::allocator<NSString * {__strong}>>::__count_unique<NSString * {__strong}>((uint64_t)v124, (void **)(v126 + v18)))
      {
        box3dIou((float32x4_t *)(v128[0] + 224 * v14), (float32x4_t *)(v126 + v18 - 128), 0, (uint64_t)__p);
        *(_DWORD *)(*(_QWORD *)(v116 + 24 * v14) + 4 * v17) = __p[0];
      }
      if (std::__tree<NSString * {__strong},CompareNSString,std::allocator<NSString * {__strong}>>::__count_unique<NSString * {__strong}>((uint64_t)v122, (void **)(v128[0] + 224 * v14 + 128))
        && std::__tree<NSString * {__strong},CompareNSString,std::allocator<NSString * {__strong}>>::__count_unique<NSString * {__strong}>((uint64_t)v122, (void **)(v126 + v18))
        || std::__tree<NSString * {__strong},CompareNSString,std::allocator<NSString * {__strong}>>::__count_unique<NSString * {__strong}>((uint64_t)v120, (void **)(v128[0] + 224 * v14 + 128))
        && std::__tree<NSString * {__strong},CompareNSString,std::allocator<NSString * {__strong}>>::__count_unique<NSString * {__strong}>((uint64_t)v120, (void **)(v126 + v18)))
      {
        box3dIou((float32x4_t *)(v128[0] + 224 * v14), (float32x4_t *)(v126 + v18 - 128), 0, (uint64_t)__p);
        if (*(float *)__p > 0.7)
          *(_DWORD *)(*(_QWORD *)(v116 + 24 * v14) + 4 * v17) = __p[0];
      }
      if (!std::__tree<NSString * {__strong},CompareNSString,std::allocator<NSString * {__strong}>>::__count_unique<NSString * {__strong}>((uint64_t)v118, (void **)(v128[0] + 224 * v14 + 128))
        || !std::__tree<NSString * {__strong},CompareNSString,std::allocator<NSString * {__strong}>>::__count_unique<NSString * {__strong}>((uint64_t)v118, (void **)(v126 + v18)))
      {
        goto LABEL_39;
      }
      box3dIou((float32x4_t *)(v128[0] + 224 * v14), (float32x4_t *)(v126 + v18 - 128), 0, (uint64_t)__p);
      v21 = (int)__p[0];
      v22 = *(_QWORD *)(v116 + 24 * v14);
      if (*(float *)__p > 0.3)
        goto LABEL_38;
      *(_DWORD *)(v22 + 4 * v17) = -1073741824;
LABEL_39:
      ++v17;
      v18 += 224;
      if (v15 == v17)
        goto LABEL_40;
    }
    if (objc_msgSend(*v20, "isEqualToString:", CFSTR("Screen")))
    {
      v114 = 0u;
      v115 = 0u;
      v112 = 0u;
      v113 = 0u;
      v110 = 0u;
      v111 = 0u;
      *(_OWORD *)__p = 0u;
      v109 = 0u;
      box3dEnlarge((float32x4_t *)(v128[0] + 224 * v14), 0.0, 0.5, 0.0, __p);
      v106 = 0u;
      v107 = 0u;
      v104 = 0u;
      v105 = 0u;
      v102 = 0u;
      v103 = 0u;
      v100 = 0u;
      v101 = 0u;
      box3dEnlarge((float32x4_t *)(v126 + v18 - 128), 0.0, 0.5, 0.0, &v100);
      box3dIou((float32x4_t *)__p, &v100, 0, (uint64_t)v99);
      v21 = v99[0];
    }
    else
    {
      box3dIou((float32x4_t *)(v128[0] + 224 * v14), (float32x4_t *)(v126 + v18 - 128), 0, (uint64_t)__p);
      v21 = (int)__p[0];
    }
    v22 = *(_QWORD *)(v116 + 24 * v14);
LABEL_38:
    *(_DWORD *)(v22 + 4 * v17) = v21;
    goto LABEL_39;
  }
LABEL_41:
  std::vector<std::vector<int>>::vector(v99, v88);
  std::vector<std::vector<int>>::vector(v98, v87);
  if (v12 != v85)
  {
    v83 = v5;
    v23 = 0;
    if (v88 <= 1)
      v24 = 1;
    else
      v24 = v88;
    v25 = v87;
    if (v87 <= 1)
      v25 = 1;
    v89 = v25;
    do
    {
      if (v91 != v90)
      {
        for (n = 0; n != v24; ++n)
        {
          if (*(float *)(*(_QWORD *)(v116 + 24 * v23) + 4 * n) > 0.0)
          {
            v27 = v99[0] + 24 * n;
            v29 = (_DWORD **)(v27 + 8);
            v28 = *(_DWORD **)(v27 + 8);
            v31 = (_QWORD *)(v27 + 16);
            v30 = *(_QWORD *)(v27 + 16);
            if ((unint64_t)v28 >= v30)
            {
              v33 = *(_DWORD **)v27;
              v34 = ((uint64_t)v28 - *(_QWORD *)v27) >> 2;
              v35 = v34 + 1;
              if ((unint64_t)(v34 + 1) >> 62)
                goto LABEL_116;
              v36 = v30 - (_QWORD)v33;
              if (v36 >> 1 > v35)
                v35 = v36 >> 1;
              if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFFCLL)
                v37 = 0x3FFFFFFFFFFFFFFFLL;
              else
                v37 = v35;
              if (v37)
              {
                v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)v31, v37);
                v28 = *v29;
                v33 = *(_DWORD **)v27;
              }
              else
              {
                v38 = 0;
              }
              v39 = &v38[4 * v34];
              *(_DWORD *)v39 = v23;
              v32 = v39 + 4;
              while (v28 != v33)
              {
                v40 = *--v28;
                *((_DWORD *)v39 - 1) = v40;
                v39 -= 4;
              }
              *(_QWORD *)v27 = v39;
              *v29 = v32;
              *v31 = &v38[4 * v37];
              if (v33)
                operator delete(v33);
            }
            else
            {
              *v28 = v23;
              v32 = v28 + 1;
            }
            *v29 = v32;
            v41 = v98[0] + 24 * v23;
            v43 = (_DWORD **)(v41 + 8);
            v42 = *(_DWORD **)(v41 + 8);
            v45 = (_QWORD *)(v41 + 16);
            v44 = *(_QWORD *)(v41 + 16);
            if ((unint64_t)v42 >= v44)
            {
              v47 = *(_DWORD **)v41;
              v48 = ((uint64_t)v42 - *(_QWORD *)v41) >> 2;
              v49 = v48 + 1;
              if ((unint64_t)(v48 + 1) >> 62)
LABEL_116:
                std::vector<float>::__throw_length_error[abi:ne180100]();
              v50 = v44 - (_QWORD)v47;
              if (v50 >> 1 > v49)
                v49 = v50 >> 1;
              if ((unint64_t)v50 >= 0x7FFFFFFFFFFFFFFCLL)
                v51 = 0x3FFFFFFFFFFFFFFFLL;
              else
                v51 = v49;
              if (v51)
              {
                v52 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)v45, v51);
                v42 = *v43;
                v47 = *(_DWORD **)v41;
              }
              else
              {
                v52 = 0;
              }
              v53 = &v52[4 * v48];
              *(_DWORD *)v53 = n;
              v46 = v53 + 4;
              while (v42 != v47)
              {
                v54 = *--v42;
                *((_DWORD *)v53 - 1) = v54;
                v53 -= 4;
              }
              *(_QWORD *)v41 = v53;
              *v43 = v46;
              *v45 = &v52[4 * v51];
              if (v47)
                operator delete(v47);
            }
            else
            {
              *v42 = n;
              v46 = v42 + 1;
            }
            *v43 = v46;
          }
        }
      }
      ++v23;
    }
    while (v23 != v89);
    v55 = 0;
    v56 = 0;
    v5 = v83;
    do
    {
      v57 = *(int **)(v98[0] + v55);
      v58 = *(int **)(v98[0] + v55 + 8);
      memset(v96, 0, sizeof(v96));
      std::vector<std::vector<float>>::__init_with_size[abi:ne180100]<std::vector<float>*,std::vector<float>*>(v96, v116, v117, 0xAAAAAAAAAAAAAAABLL * ((v117 - v116) >> 3));
      v59 = 126 - 2 * __clz(v58 - v57);
      v97 = v56;
      if (v58 == v57)
        v60 = 0;
      else
        v60 = v59;
      std::__introsort<std::_ClassicAlgPolicy,-[OU3DObjectDetector assignIdentifiersForNewObjects:withOldObjects:]::$_0 &,int *,false>(v57, v58, (uint64_t)v96, v60, 1);
      __p[0] = v96;
      std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
      ++v56;
      v55 += 24;
    }
    while (v89 != v56);
  }
  if (v91 != v90)
  {
    v61 = 0;
    v62 = 0;
    if (v88 <= 1)
      v63 = 1;
    else
      v63 = v88;
    do
    {
      v64 = *(int **)(v99[0] + v61);
      v65 = *(int **)(v99[0] + v61 + 8);
      memset(v94, 0, sizeof(v94));
      std::vector<std::vector<float>>::__init_with_size[abi:ne180100]<std::vector<float>*,std::vector<float>*>(v94, v116, v117, 0xAAAAAAAAAAAAAAABLL * ((v117 - v116) >> 3));
      v66 = 126 - 2 * __clz(v65 - v64);
      v95 = v62;
      if (v65 == v64)
        v67 = 0;
      else
        v67 = v66;
      std::__introsort<std::_ClassicAlgPolicy,-[OU3DObjectDetector assignIdentifiersForNewObjects:withOldObjects:]::$_1 &,int *,false>(v64, v65, (uint64_t)v94, v67, 1);
      __p[0] = v94;
      std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
      ++v62;
      v61 += 24;
    }
    while (v63 != v62);
  }
  *(_OWORD *)__p = 0u;
  v109 = 0u;
  LODWORD(v110) = 1065353216;
  v100 = 0u;
  v101 = 0u;
  LODWORD(v102) = 1065353216;
  v93 = 0;
  if (v86 == v85)
  {
    v70 = v84;
  }
  else
  {
    v68 = 0;
    v69 = 0;
    v70 = v84;
    do
    {
      v71 = v98[0] + 24 * v68;
      v72 = *(int **)v71;
      if (*(_QWORD *)v71 != *(_QWORD *)(v71 + 8))
      {
        v92 = 0;
        v92 = *v72;
        if (**(_DWORD **)(v99[0] + 24 * v92) == v69)
        {
          objc_msgSend(v84, "objectAtIndexedSubscript:");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "identifier");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "objectAtIndexedSubscript:", v93);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "setIdentifier:", v74);

          std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>((uint64_t)__p, &v93, &v93);
          std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>((uint64_t)&v100, &v92, &v92);
          v69 = v93;
        }
      }
      v93 = ++v69;
      v68 = v69;
    }
    while (v87 > v69);
    v93 = 0;
    if (v86 != v85)
    {
      do
      {
        if (!std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::find<int>(__p, &v93))
        {
          v77 = v98[0] + 24 * v93;
          v78 = *(int **)v77;
          v79 = *(int **)(v77 + 8);
          while (v78 != v79)
          {
            v92 = 0;
            v92 = *v78;
            if (!std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::find<int>(&v100, &v92))
            {
              objc_msgSend(v84, "objectAtIndexedSubscript:", v92);
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v80, "identifier");
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "objectAtIndexedSubscript:", v93);
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v82, "setIdentifier:", v81);

              std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>((uint64_t)&v100, &v92, &v92);
              break;
            }
            ++v78;
          }
        }
        v76 = ++v93;
      }
      while (v87 > v76);
    }
  }
  kdebug_trace();
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&v100);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)__p);
  __p[0] = v98;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  __p[0] = v99;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  __p[0] = &v116;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  std::__tree<std::__value_type<NSString * {__strong},float>,std::__map_value_compare<NSString * {__strong},std::__value_type<NSString * {__strong},float>,CompareNSString,true>,std::allocator<std::__value_type<NSString * {__strong},float>>>::destroy((uint64_t)v118, v119);
  std::__tree<std::__value_type<NSString * {__strong},float>,std::__map_value_compare<NSString * {__strong},std::__value_type<NSString * {__strong},float>,CompareNSString,true>,std::allocator<std::__value_type<NSString * {__strong},float>>>::destroy((uint64_t)v120, v121);
  std::__tree<std::__value_type<NSString * {__strong},float>,std::__map_value_compare<NSString * {__strong},std::__value_type<NSString * {__strong},float>,CompareNSString,true>,std::allocator<std::__value_type<NSString * {__strong},float>>>::destroy((uint64_t)v122, v123);
  std::__tree<std::__value_type<NSString * {__strong},float>,std::__map_value_compare<NSString * {__strong},std::__value_type<NSString * {__strong},float>,CompareNSString,true>,std::allocator<std::__value_type<NSString * {__strong},float>>>::destroy((uint64_t)v124, v125);
  __p[0] = &v126;
  std::vector<OUBox3d>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  __p[0] = v128;
  std::vector<OUBox3d>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);

}

- (void)setObjectRepresentationEnabled:(BOOL)a3
{
  ou3dor::OU3DObjectRepresentation *v4;
  ou3dor::OU3DObjectRepresentation **p_ou3dor;
  ou3dor::OU3DObjectRepresentation *v6;

  self->_ObjectRepresentationEnabled = a3;
  if (a3)
  {
    v4 = (ou3dor::OU3DObjectRepresentation *)operator new();
    ou3dor::OU3DObjectRepresentation::OU3DObjectRepresentation(v4, self->isOnline_);
    p_ou3dor = (ou3dor::OU3DObjectRepresentation **)&self->ou3dor_;
    v6 = v4;
  }
  else
  {
    p_ou3dor = (ou3dor::OU3DObjectRepresentation **)&self->ou3dor_;
    v6 = 0;
  }
  std::unique_ptr<ou3dor::OU3DObjectRepresentation>::reset[abi:ne180100](p_ou3dor, v6);
}

- (signed)online_model_
{
  return self->online_model_;
}

- (signed)offline_model_
{
  return self->offline_model_;
}

- (unint64_t)worldPointCloudCapacity
{
  return self->worldPointCloudCapacity;
}

- (void)setWorldPointCloudCapacity:(unint64_t)a3
{
  self->worldPointCloudCapacity = a3;
}

- (float)frustumFOV
{
  return self->frustumFOV;
}

- (void)setFrustumFOV:(float)a3
{
  self->frustumFOV = a3;
}

- (OUPointCloud)worldPointCloud
{
  return self->worldPointCloud;
}

- (double)minDetectionInterval
{
  return self->minDetectionInterval;
}

- (void)setMinDetectionInterval:(double)a3
{
  self->minDetectionInterval = a3;
}

- (double)maxDetectionInterval
{
  return self->maxDetectionInterval;
}

- (void)setMaxDetectionInterval:(double)a3
{
  self->maxDetectionInterval = a3;
}

- (float)translationalSensitivity
{
  return self->translationalSensitivity;
}

- (void)setTranslationalSensitivity:(float)a3
{
  self->translationalSensitivity = a3;
}

- (float)rotationalSensitivity
{
  return self->rotationalSensitivity;
}

- (void)setRotationalSensitivity:(float)a3
{
  self->rotationalSensitivity = a3;
}

- (float)depthConfidenceThreshold
{
  return self->depthConfidenceThreshold;
}

- (void)setDepthConfidenceThreshold:(float)a3
{
  self->depthConfidenceThreshold = a3;
}

- (NSArray)allObjects
{
  return self->allObjects;
}

- (OUPointCloud)frustumPointCloud
{
  return self->_frustumPointCloud;
}

- (BOOL)RgbRefinementEnabled
{
  return self->_RgbRefinementEnabled;
}

- (BOOL)ObjectRepresentationEnabled
{
  return self->_ObjectRepresentationEnabled;
}

- (void).cxx_destruct
{
  OU3DLShapeObjectMerger *value;
  int *begin;
  int *v5;
  OU3DODInterface *v6;
  OU3DODInterface *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void **p_begin;

  objc_storeStrong((id *)&self->_frustumPointCloud, 0);
  objc_storeStrong((id *)&self->allObjects, 0);
  value = self->l_shape_merger_.__ptr_.__value_;
  self->l_shape_merger_.__ptr_.__value_ = 0;
  if (value)
    MEMORY[0x22E2CAAE8](value, 0xC400A2AC0F1);
  objc_storeStrong((id *)&self->debug_dumper_, 0);
  objc_storeStrong((id *)&self->rgb_refine_supported_types_, 0);
  objc_storeStrong((id *)&self->pre_rgb_size_refined_, 0);
  objc_storeStrong((id *)&self->pre_size_refined_, 0);
  begin = self->size_refined_box_ids_.__begin_;
  if (begin)
  {
    self->size_refined_box_ids_.__end_ = begin;
    operator delete(begin);
  }
  v5 = self->hist_kept_box_ids_.__begin_;
  if (v5)
  {
    self->hist_kept_box_ids_.__end_ = v5;
    operator delete(v5);
  }
  p_begin = &self->hist_nms_iou_mat_.__begin_;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&p_begin);
  p_begin = &self->hist_ori_iou_mat_.__begin_;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&p_begin);
  p_begin = (void **)&self->merged_box3ds_.__begin_;
  std::vector<OUBox3d>::__destroy_vector::operator()[abi:ne180100](&p_begin);
  p_begin = (void **)&self->acc_box3ds_.__begin_;
  std::vector<OUBox3d>::__destroy_vector::operator()[abi:ne180100](&p_begin);
  p_begin = (void **)&self->cur_box3ds_.__begin_;
  std::vector<OUBox3d>::__destroy_vector::operator()[abi:ne180100](&p_begin);
  objc_storeStrong((id *)&self->objectAsset_, 0);
  objc_storeStrong((id *)&self->object_completeness_, 0);
  objc_storeStrong((id *)&self->merger, 0);
  std::unique_ptr<ou3dor::OU3DObjectRepresentation>::reset[abi:ne180100]((ou3dor::OU3DObjectRepresentation **)&self->ou3dor_, 0);
  p_begin = (void **)&self->offline_merger_.fused_cabinets_.__begin_;
  std::vector<OU3DKitchenObject>::__destroy_vector::operator()[abi:ne180100](&p_begin);
  p_begin = (void **)&self->offline_merger_.other_objects_.__begin_;
  std::vector<OU3DKitchenObject>::__destroy_vector::operator()[abi:ne180100](&p_begin);
  p_begin = (void **)&self->offline_merger_.new_cabinets_.__begin_;
  std::vector<OU3DKitchenObject>::__destroy_vector::operator()[abi:ne180100](&p_begin);
  p_begin = (void **)&self->offline_merger_.old_cabinets_.__begin_;
  std::vector<OU3DKitchenObject>::__destroy_vector::operator()[abi:ne180100](&p_begin);
  v6 = self->offline_detector_.__ptr_.__value_;
  self->offline_detector_.__ptr_.__value_ = 0;
  if (v6)
    (*(void (**)(OU3DODInterface *))(*(_QWORD *)v6 + 8))(v6);
  v7 = self->online_detector_.__ptr_.__value_;
  self->online_detector_.__ptr_.__value_ = 0;
  if (v7)
    (*(void (**)(OU3DODInterface *))(*(_QWORD *)v7 + 8))(v7);
  std::unique_ptr<OU3DObjectRGBSizeRefiner>::reset[abi:ne180100](&self->object_rgb_size_refiner_.__ptr_.__value_, 0);
  v8 = *(void **)&self->_anon_1c0[72];
  if (v8)
  {
    *(_QWORD *)&self->_anon_1c0[80] = v8;
    operator delete(v8);
  }
  v9 = *(void **)&self->_anon_1c0[48];
  if (v9)
  {
    *(_QWORD *)&self->_anon_1c0[56] = v9;
    operator delete(v9);
  }
  v10 = *(void **)&self->_anon_1c0[24];
  if (v10)
  {
    *(_QWORD *)&self->_anon_1c0[32] = v10;
    operator delete(v10);
  }
  v11 = *(void **)self->_anon_1c0;
  if (v11)
  {
    *(_QWORD *)&self->_anon_1c0[8] = v11;
    operator delete(v11);
  }
  objc_storeStrong((id *)&self->arframe_, 0);
  objc_storeStrong((id *)&self->camera_, 0);
  objc_storeStrong((id *)&self->keyframesPointCloud_, 0);
  objc_storeStrong((id *)&self->arframePointCloud_, 0);
  objc_storeStrong((id *)&self->worldPointCloud, 0);
  std::__tree<std::__value_type<NSString * {__strong},float>,std::__map_value_compare<NSString * {__strong},std::__value_type<NSString * {__strong},float>,CompareNSString,true>,std::allocator<std::__value_type<NSString * {__strong},float>>>::destroy((uint64_t)&self->obj_type_to_index, (_QWORD *)self->obj_type_to_index.__tree_.__pair1_.__value_.__left_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 3) = (char *)self + 32;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *((_QWORD *)self + 85) = 0;
  *((_QWORD *)self + 108) = 0;
  *((_QWORD *)self + 110) = 0;
  *((_QWORD *)self + 109) = 0;
  *((_QWORD *)self + 117) = 0;
  *((_OWORD *)self + 10) = 0u;
  *((_OWORD *)self + 11) = 0u;
  *((_OWORD *)self + 12) = 0u;
  *((_OWORD *)self + 13) = 0u;
  *((_OWORD *)self + 14) = 0u;
  *((_OWORD *)self + 15) = 0u;
  *((_OWORD *)self + 16) = 0u;
  *((_OWORD *)self + 17) = 0u;
  *((_OWORD *)self + 32) = 0u;
  *((_OWORD *)self + 33) = 0u;
  *((_OWORD *)self + 30) = 0u;
  *((_OWORD *)self + 31) = 0u;
  *((_OWORD *)self + 28) = 0u;
  *((_OWORD *)self + 29) = 0u;
  *((_OWORD *)self + 26) = 0u;
  *((_OWORD *)self + 27) = 0u;
  *((_OWORD *)self + 24) = 0u;
  *((_OWORD *)self + 25) = 0u;
  *((_OWORD *)self + 22) = 0u;
  *((_OWORD *)self + 23) = 0u;
  *((_OWORD *)self + 20) = 0u;
  *((_OWORD *)self + 21) = 0u;
  *((_QWORD *)self + 83) = 0;
  *(_OWORD *)((char *)self + 632) = 0u;
  *(_OWORD *)((char *)self + 648) = 0u;
  *(_OWORD *)((char *)self + 600) = 0u;
  *(_OWORD *)((char *)self + 616) = 0u;
  *(_OWORD *)((char *)self + 568) = 0u;
  *(_OWORD *)((char *)self + 584) = 0u;
  *(_OWORD *)((char *)self + 552) = 0u;
  *(_OWORD *)((char *)self + 824) = 0u;
  *(_OWORD *)((char *)self + 840) = 0u;
  *(_OWORD *)((char *)self + 792) = 0u;
  *(_OWORD *)((char *)self + 808) = 0u;
  *(_OWORD *)((char *)self + 760) = 0u;
  *(_OWORD *)((char *)self + 776) = 0u;
  *(_OWORD *)((char *)self + 728) = 0u;
  *(_OWORD *)((char *)self + 744) = 0u;
  *(_OWORD *)((char *)self + 712) = 0u;
  return self;
}

- (vector<unsigned)runwithinClassNMS:(OU3DObjectDetector *)self ids:(SEL)a3 ori_iou:(const void *)a4 nms_iou:(void *)a5
{
  vector<unsigned long, std::allocator<unsigned long>> *result;
  uint64_t v8[3];
  void **v9;

  memset(v8, 0, sizeof(v8));
  withinClassNMS(a4, (std::vector<int> *)a5, a6, (uint64_t *)a7, v8, &retstr->var0, 0.2);
  v9 = (void **)v8;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v9);
  return result;
}

- (void)runAssignParentID:(id)a3
{
  -[OU3DObjectDetector assignParentId:isOffline:](self, "assignParentId:isOffline:", a3, 1);
}

- (int)assignIdentifiersForNewObjects:(uint64_t)a3 withOldObjects:(uint64_t)a4
{
  int *v9;
  int *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int *v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  float v21;
  uint64_t v22;
  int v23;
  int *v24;
  int *v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int *v30;
  int *v31;
  uint64_t v32;
  float v33;
  int v34;
  int v35;
  int *v36;
  BOOL v37;
  int v38;
  int *v39;
  int *v40;
  int v41;
  int v42;
  int v43;
  uint64_t v44;
  float v45;
  int v46;
  int v47;
  int *v48;
  int v49;
  int v50;
  int *v51;
  int *v52;
  int v53;
  int v54;
  uint64_t v55;
  int v56;
  int v57;
  uint64_t v58;
  int v59;
  int v60;
  int *v61;
  uint64_t v62;
  uint64_t v63;
  int *v64;
  int v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  int *v69;
  int64_t v70;
  uint64_t v71;
  int64_t v72;
  int64_t v73;
  uint64_t v74;
  int *v75;
  int *v76;
  int v77;
  int v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  float v83;
  float v84;
  uint64_t v85;
  uint64_t v86;
  int v87;
  uint64_t v88;
  int *v89;
  int *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  int *v95;
  int v96;
  int v97;
  uint64_t v98;
  int *v99;
  int *v101;
  uint64_t v102;
  int v103;
  int v104;
  int v105;
  uint64_t v106;
  int *v107;
  int *v108;

  v9 = result;
LABEL_2:
  v108 = a2 - 1;
  v10 = v9;
  while (2)
  {
    v9 = v10;
    v11 = (char *)a2 - (char *)v10;
    v12 = a2 - v10;
    switch(v12)
    {
      case 0uLL:
      case 1uLL:
        return result;
      case 2uLL:
        v49 = *(a2 - 1);
        v50 = *v10;
        if (*(float *)(*(_QWORD *)(*(_QWORD *)a3 + 24 * v49) + 4 * *(int *)(a3 + 24)) > *(float *)(*(_QWORD *)(*(_QWORD *)a3 + 24 * *v10) + 4 * *(int *)(a3 + 24)))
        {
          *v10 = v49;
          *(a2 - 1) = v50;
        }
        return result;
      case 3uLL:
        return std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[OU3DObjectDetector assignIdentifiersForNewObjects:withOldObjects:]::$_1 &,int *>(v10, v10 + 1, v108, (uint64_t *)a3);
      case 4uLL:
        return std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[OU3DObjectDetector assignIdentifiersForNewObjects:withOldObjects:]::$_1 &,int *>(v10, v10 + 1, v10 + 2, v108, a3);
      case 5uLL:
        v51 = v10 + 2;
        v52 = v10 + 3;
        result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[OU3DObjectDetector assignIdentifiersForNewObjects:withOldObjects:]::$_1 &,int *>(v10, v10 + 1, v10 + 2, v10 + 3, a3);
        v53 = *(a2 - 1);
        v54 = v10[3];
        v55 = *(_QWORD *)a3;
        if (*(float *)(*(_QWORD *)(*(_QWORD *)a3 + 24 * v53) + 4 * *(int *)(a3 + 24)) > *(float *)(*(_QWORD *)(*(_QWORD *)a3 + 24 * v54) + 4 * *(int *)(a3 + 24)))
        {
          *v52 = v53;
          *(a2 - 1) = v54;
          v56 = *v52;
          v57 = *v51;
          v58 = *(_QWORD *)(v55 + 24 * *v52);
          if (*(float *)(v58 + 4 * *(int *)(a3 + 24)) > *(float *)(*(_QWORD *)(v55 + 24 * *v51)
                                                                    + 4 * *(int *)(a3 + 24)))
          {
            *v51 = v56;
            *v52 = v57;
            v59 = v10[1];
            if (*(float *)(v58 + 4 * *(int *)(a3 + 24)) > *(float *)(*(_QWORD *)(v55 + 24 * v59)
                                                                      + 4 * *(int *)(a3 + 24)))
            {
              v10[1] = v56;
              v10[2] = v59;
              v60 = *v10;
              if (*(float *)(v58 + 4 * *(int *)(a3 + 24)) > *(float *)(*(_QWORD *)(v55 + 24 * *v10)
                                                                        + 4 * *(int *)(a3 + 24)))
              {
                *v10 = v56;
                v10[1] = v60;
              }
            }
          }
        }
        return result;
      default:
        if (v11 <= 95)
        {
          if ((a5 & 1) != 0)
          {
            if (v10 != a2)
            {
              v61 = v10 + 1;
              if (v10 + 1 != a2)
              {
                v62 = 0;
                v63 = *(_QWORD *)a3;
                v64 = v10;
                do
                {
                  v66 = *v64;
                  v65 = v64[1];
                  v64 = v61;
                  v67 = *(_QWORD *)(v63 + 24 * v65);
                  if (*(float *)(v67 + 4 * *(int *)(a3 + 24)) > *(float *)(*(_QWORD *)(v63 + 24 * v66)
                                                                            + 4 * *(int *)(a3 + 24)))
                  {
                    v68 = v62;
                    while (1)
                    {
                      *(int *)((char *)v10 + v68 + 4) = v66;
                      if (!v68)
                        break;
                      v66 = *(int *)((char *)v10 + v68 - 4);
                      v68 -= 4;
                      if (*(float *)(v67 + 4 * *(int *)(a3 + 24)) <= *(float *)(*(_QWORD *)(v63 + 24 * v66)
                                                                                 + 4 * *(int *)(a3 + 24)))
                      {
                        v69 = (int *)((char *)v10 + v68 + 4);
                        goto LABEL_75;
                      }
                    }
                    v69 = v10;
LABEL_75:
                    *v69 = v65;
                  }
                  v61 = v64 + 1;
                  v62 += 4;
                }
                while (v64 + 1 != a2);
              }
            }
          }
          else if (v10 != a2)
          {
            v101 = v10 + 1;
            if (v10 + 1 != a2)
            {
              v102 = *(_QWORD *)a3;
              do
              {
                v104 = *v9;
                v103 = v9[1];
                v9 = v101;
                v105 = v104;
                v106 = *(_QWORD *)(v102 + 24 * v103);
                if (*(float *)(v106 + 4 * *(int *)(a3 + 24)) > *(float *)(*(_QWORD *)(v102 + 24 * v105)
                                                                           + 4 * *(int *)(a3 + 24)))
                {
                  v107 = v9;
                  do
                  {
                    *v107 = v105;
                    v105 = *(v107 - 2);
                    --v107;
                  }
                  while (*(float *)(v106 + 4 * *(int *)(a3 + 24)) > *(float *)(*(_QWORD *)(v102 + 24 * v105)
                                                                                + 4 * *(int *)(a3 + 24)));
                  *v107 = v103;
                }
                v101 = v9 + 1;
              }
              while (v9 + 1 != a2);
            }
          }
          return result;
        }
        if (!a4)
        {
          if (v10 != a2)
          {
            v70 = (v12 - 2) >> 1;
            v71 = *(_QWORD *)a3;
            v72 = v70;
            do
            {
              v73 = v72;
              if (v70 >= v72)
              {
                v74 = (2 * v72) | 1;
                v75 = &v10[v74];
                if (2 * v73 + 2 >= (uint64_t)v12)
                {
                  result = (int *)*(int *)(a3 + 24);
                }
                else
                {
                  result = (int *)*(int *)(a3 + 24);
                  if (*(float *)(*(_QWORD *)(v71 + 24 * *v75) + 4 * (_QWORD)result) > *(float *)(*(_QWORD *)(v71 + 24 * v75[1]) + 4 * (_QWORD)result))
                  {
                    ++v75;
                    v74 = 2 * v73 + 2;
                  }
                }
                v76 = &v10[v73];
                v77 = *v75;
                v78 = *v76;
                v79 = *(_QWORD *)(v71 + 24 * *v76);
                if (*(float *)(*(_QWORD *)(v71 + 24 * *v75) + 4 * (_QWORD)result) <= *(float *)(v79 + 4 * (_QWORD)result))
                {
                  do
                  {
                    result = v75;
                    *v76 = v77;
                    if (v70 < v74)
                      break;
                    v80 = 2 * v74;
                    v74 = (2 * v74) | 1;
                    v75 = &v10[v74];
                    v81 = v80 + 2;
                    v82 = *(int *)(a3 + 24);
                    if (v81 < (uint64_t)v12
                      && *(float *)(*(_QWORD *)(v71 + 24 * *v75) + 4 * v82) > *(float *)(*(_QWORD *)(v71 + 24 * v75[1])
                                                                                         + 4 * v82))
                    {
                      ++v75;
                      v74 = v81;
                    }
                    v77 = *v75;
                    v83 = *(float *)(*(_QWORD *)(v71 + 24 * *v75) + 4 * v82);
                    v84 = *(float *)(v79 + 4 * v82);
                    v76 = result;
                  }
                  while (v83 <= v84);
                  *result = v78;
                }
              }
              v72 = v73 - 1;
            }
            while (v73);
            v85 = (unint64_t)v11 >> 2;
            do
            {
              v86 = 0;
              v87 = *v10;
              v88 = *(_QWORD *)a3;
              v89 = v10;
              do
              {
                v90 = v89;
                v89 += v86 + 1;
                v91 = 2 * v86;
                v86 = (2 * v86) | 1;
                v92 = v91 + 2;
                if (v92 < v85)
                {
                  result = *(int **)(v88 + 24 * v89[1]);
                  if (*(float *)(*(_QWORD *)(v88 + 24 * *v89) + 4 * *(int *)(a3 + 24)) > *(float *)&result[*(int *)(a3 + 24)])
                  {
                    ++v89;
                    v86 = v92;
                  }
                }
                *v90 = *v89;
              }
              while (v86 <= (uint64_t)((unint64_t)(v85 - 2) >> 1));
              if (v89 == --a2)
              {
                *v89 = v87;
              }
              else
              {
                *v89 = *a2;
                *a2 = v87;
                v93 = (char *)v89 - (char *)v10 + 4;
                if (v93 >= 5)
                {
                  v94 = (((unint64_t)v93 >> 2) - 2) >> 1;
                  v95 = &v10[v94];
                  v96 = *v95;
                  v97 = *v89;
                  v98 = *(_QWORD *)(v88 + 24 * *v89);
                  if (*(float *)(*(_QWORD *)(v88 + 24 * *v95) + 4 * *(int *)(a3 + 24)) > *(float *)(v98 + 4 * *(int *)(a3 + 24)))
                  {
                    do
                    {
                      v99 = v95;
                      *v89 = v96;
                      if (!v94)
                        break;
                      v94 = (v94 - 1) >> 1;
                      v95 = &v10[v94];
                      v96 = *v95;
                      result = (int *)*(int *)(a3 + 24);
                      v89 = v99;
                    }
                    while (*(float *)(*(_QWORD *)(v88 + 24 * *v95) + 4 * (_QWORD)result) > *(float *)(v98 + 4 * (_QWORD)result));
                    *v99 = v97;
                  }
                }
              }
            }
            while (v85-- > 2);
          }
          return result;
        }
        v13 = v12 >> 1;
        v14 = &v10[v12 >> 1];
        if ((unint64_t)v11 < 0x201)
        {
          result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[OU3DObjectDetector assignIdentifiersForNewObjects:withOldObjects:]::$_1 &,int *>(&v9[v12 >> 1], v9, v108, (uint64_t *)a3);
        }
        else
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[OU3DObjectDetector assignIdentifiersForNewObjects:withOldObjects:]::$_1 &,int *>(v9, &v9[v12 >> 1], v108, (uint64_t *)a3);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[OU3DObjectDetector assignIdentifiersForNewObjects:withOldObjects:]::$_1 &,int *>(v9 + 1, v14 - 1, a2 - 2, (uint64_t *)a3);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[OU3DObjectDetector assignIdentifiersForNewObjects:withOldObjects:]::$_1 &,int *>(v9 + 2, &v9[v13 + 1], a2 - 3, (uint64_t *)a3);
          result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[OU3DObjectDetector assignIdentifiersForNewObjects:withOldObjects:]::$_1 &,int *>(v14 - 1, v14, &v9[v13 + 1], (uint64_t *)a3);
          v15 = *v9;
          *v9 = *v14;
          *v14 = v15;
        }
        --a4;
        v16 = *v9;
        v17 = *v9;
        v18 = *(_QWORD *)a3;
        v19 = *(int *)(a3 + 24);
        if ((a5 & 1) == 0)
        {
          v20 = *(_QWORD *)(v18 + 24 * v17);
          v21 = *(float *)(v20 + 4 * v19);
          if (*(float *)(*(_QWORD *)(v18 + 24 * *(v9 - 1)) + 4 * v19) > v21)
            goto LABEL_12;
          if (v21 <= *(float *)(*(_QWORD *)(v18 + 24 * *v108) + 4 * v19))
          {
            v39 = v9 + 1;
            do
            {
              v10 = v39;
              if (v39 >= a2)
                break;
              ++v39;
            }
            while (v21 <= *(float *)(*(_QWORD *)(v18 + 24 * *v10) + 4 * v19));
          }
          else
          {
            v10 = v9;
            do
            {
              v38 = v10[1];
              ++v10;
            }
            while (v21 <= *(float *)(*(_QWORD *)(v18 + 24 * v38) + 4 * v19));
          }
          v40 = a2;
          if (v10 < a2)
          {
            v40 = a2;
            do
              v41 = *--v40;
            while (v21 > *(float *)(*(_QWORD *)(v18 + 24 * v41) + 4 * v19));
          }
          if (v10 < v40)
          {
            v42 = *v10;
            v43 = *v40;
            do
            {
              *v10 = v43;
              *v40 = v42;
              v44 = *(int *)(a3 + 24);
              v45 = *(float *)(v20 + 4 * v44);
              do
              {
                v46 = v10[1];
                ++v10;
                v42 = v46;
              }
              while (v45 <= *(float *)(*(_QWORD *)(v18 + 24 * v46) + 4 * v44));
              do
              {
                v47 = *--v40;
                v43 = v47;
              }
              while (v45 > *(float *)(*(_QWORD *)(v18 + 24 * v47) + 4 * v44));
            }
            while (v10 < v40);
          }
          v48 = v10 - 1;
          if (v10 - 1 != v9)
            *v9 = *v48;
          a5 = 0;
          *v48 = v16;
          continue;
        }
        v20 = *(_QWORD *)(v18 + 24 * v17);
        v21 = *(float *)(v20 + 4 * v19);
LABEL_12:
        v22 = 0;
        do
          v23 = v9[++v22];
        while (*(float *)(*(_QWORD *)(v18 + 24 * v23) + 4 * v19) > v21);
        v24 = &v9[v22];
        v25 = a2;
        if (v22 == 1)
        {
          v25 = a2;
          do
          {
            if (v24 >= v25)
              break;
            v27 = *--v25;
          }
          while (*(float *)(*(_QWORD *)(v18 + 24 * v27) + 4 * v19) <= v21);
        }
        else
        {
          do
            v26 = *--v25;
          while (*(float *)(*(_QWORD *)(v18 + 24 * v26) + 4 * v19) <= v21);
        }
        if (v24 >= v25)
        {
          v36 = v24 - 1;
        }
        else
        {
          v28 = *v25;
          v29 = v23;
          v30 = v24;
          v31 = v25;
          do
          {
            *v30 = v28;
            *v31 = v29;
            v32 = *(int *)(a3 + 24);
            v33 = *(float *)(v20 + 4 * v32);
            do
            {
              v34 = v30[1];
              ++v30;
              v29 = v34;
            }
            while (*(float *)(*(_QWORD *)(v18 + 24 * v34) + 4 * v32) > v33);
            do
            {
              v35 = *--v31;
              v28 = v35;
            }
            while (*(float *)(*(_QWORD *)(v18 + 24 * v35) + 4 * v32) <= v33);
          }
          while (v30 < v31);
          v36 = v30 - 1;
        }
        if (v36 != v9)
          *v9 = *v36;
        *v36 = v16;
        if (v24 < v25)
        {
LABEL_33:
          result = (int *)std::__introsort<std::_ClassicAlgPolicy,-[OU3DObjectDetector assignIdentifiersForNewObjects:withOldObjects:]::$_1 &,int *,false>(v9, v36, a3, a4, a5 & 1);
          a5 = 0;
          v10 = v36 + 1;
          continue;
        }
        v37 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[OU3DObjectDetector assignIdentifiersForNewObjects:withOldObjects:]::$_1 &,int *>(v9, v36, a3);
        v10 = v36 + 1;
        result = (int *)std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[OU3DObjectDetector assignIdentifiersForNewObjects:withOldObjects:]::$_1 &,int *>(v36 + 1, a2, a3);
        if (!(_DWORD)result)
        {
          if (v37)
            continue;
          goto LABEL_33;
        }
        a2 = v36;
        if (!v37)
          goto LABEL_2;
        return result;
    }
  }
}

- (void)generateOfflineObjects:(os_log_t)log onlineObjects:.cold.1(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *(_QWORD *)(buf + 4) = a2;
  _os_log_debug_impl(&dword_2294C8000, log, OS_LOG_TYPE_DEBUG, "[3DOD] Return online result (might be nil) due to insufficient pc: %zu", buf, 0xCu);
}

- (void)combineBoxTypeAndEmbeddingByUUID:(NSObject *)a3 .cold.1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_0(&dword_2294C8000, a3, (uint64_t)a3, "[3DOD] WARNING: there shouldn't be duplicated object box type in the reference array.", a1);
}

- (void)run
{
  OUTLINED_FUNCTION_0_5(&dword_2294C8000, a1, a3, "[3DOD] pnp measurement: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)MergeLShapeObjects:(uint64_t)a3 isLastFrame:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_0(&dword_2294C8000, a1, a3, "[3DOD] L Shape start", v3);
}

- (void)assignParentId:(uint64_t)a3 isOffline:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_0(&dword_2294C8000, a1, a3, "In offline, we need to clear online parentid info.", v3);
}

@end
