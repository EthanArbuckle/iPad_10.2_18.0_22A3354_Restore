@implementation PFCameraMetadataJSONDebugSerialization

- (PFCameraMetadataJSONDebugSerialization)init
{
  PFCameraMetadataJSONDebugSerialization *v2;
  uint64_t v3;
  NSMutableDictionary *debugInfo;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PFCameraMetadataJSONDebugSerialization;
  v2 = -[PFCameraMetadataJSONDebugSerialization init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    debugInfo = v2->_debugInfo;
    v2->_debugInfo = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)addObject:(id)a3 forKey:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_debugInfo, "setObject:forKeyedSubscript:", a3, a4);
}

- (id)JSONDebugData
{
  PFJSONDebugDumpConverter *v3;
  PFJSONDebugDumpConverter *v4;
  NSMutableDictionary *debugInfo;
  void *v6;
  id v7;
  id v9;
  _QWORD v10[5];
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = [PFJSONDebugDumpConverter alloc];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__PFCameraMetadataJSONDebugSerialization_JSONDebugData__block_invoke;
  v10[3] = &unk_1E45A3880;
  v10[4] = self;
  v4 = -[PFJSONDebugDumpConverter initWithUnknownTypeHandler:](v3, "initWithUnknownTypeHandler:", v10);
  debugInfo = self->_debugInfo;
  v9 = 0;
  -[PFJSONDebugDumpConverter JSONForObject:error:](v4, "JSONForObject:error:", debugInfo, &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v9;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v7;
    _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to serialize camera metadata to JSON: %@", buf, 0xCu);
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugInfo, 0);
}

id __55__PFCameraMetadataJSONDebugSerialization_JSONDebugData__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  getVNObservationClass();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (getVNEspressoModelImageprintClass(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend((id)objc_opt_class(), "vnObjectPlaceholderForObject:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (id)vnObjectPlaceholderForObject:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  double v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  double v71;
  double v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t i;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _OWORD v97[2];
  CMTime v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  CMTime time;
  uint64_t v103;
  uint64_t v104;
  Class (*v105)(uint64_t);
  void *v106;
  uint64_t *v107;
  uint64_t v108;
  uint64_t *v109;
  uint64_t v110;
  uint64_t v111;
  _BYTE v112[128];
  _QWORD v113[2];
  _QWORD v114[2];
  _QWORD v115[2];
  _QWORD v116[2];
  _QWORD v117[2];
  _QWORD v118[2];
  _QWORD v119[2];
  _QWORD v120[2];
  _QWORD v121[4];
  _QWORD v122[4];
  _QWORD v123[2];
  _QWORD v124[2];
  _QWORD v125[2];
  _QWORD v126[4];

  v126[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C99E08];
  v125[0] = CFSTR("ObjectDescription");
  objc_msgSend(v3, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v125[1] = CFSTR("ClassName");
  v126[0] = v5;
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v126[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v126, v125, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryWithDictionary:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EE6615C0))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "requestRevision"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("requestRevision"));

  }
  getVNObservationClass();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v3;
    objc_msgSend(v11, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("uuid"));

    v14 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v11, "confidence");
    objc_msgSend(v14, "numberWithFloat:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, CFSTR("confidence"));

    v123[0] = CFSTR("start");
    v16 = (void *)MEMORY[0x1E0CB37E8];
    if (v11)
    {
      objc_msgSend(v11, "timeRange");
    }
    else
    {
      v100 = 0u;
      v101 = 0u;
      v99 = 0u;
    }
    *(_OWORD *)&time.value = v99;
    time.epoch = v100;
    objc_msgSend(v16, "numberWithDouble:", CMTimeGetSeconds(&time));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v123[1] = CFSTR("duration");
    v124[0] = v17;
    v18 = (void *)MEMORY[0x1E0CB37E8];
    if (v11)
    {
      objc_msgSend(v11, "timeRange");
    }
    else
    {
      memset(v97, 0, sizeof(v97));
      v96 = 0u;
    }
    v98 = *(CMTime *)((char *)v97 + 8);
    objc_msgSend(v18, "numberWithDouble:", CMTimeGetSeconds(&v98));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v124[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v124, v123, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v20, CFSTR("timeRange"));

  }
  v108 = 0;
  v109 = &v108;
  v110 = 0x2050000000;
  v21 = (void *)getVNFeaturePrintObservationClass_softClass;
  v111 = getVNFeaturePrintObservationClass_softClass;
  if (!getVNFeaturePrintObservationClass_softClass)
  {
    v103 = MEMORY[0x1E0C809B0];
    v104 = 3221225472;
    v105 = __getVNFeaturePrintObservationClass_block_invoke;
    v106 = &unk_1E45A3198;
    v107 = &v108;
    __getVNFeaturePrintObservationClass_block_invoke((uint64_t)&v103);
    v21 = (void *)v109[3];
  }
  v22 = objc_retainAutorelease(v21);
  _Block_object_dispose(&v108, 8);
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v23 = (void *)MEMORY[0x1E0CB37E8];
    v24 = v3;
    objc_msgSend(v23, "numberWithUnsignedInteger:", objc_msgSend(v24, "elementType"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v25, CFSTR("elementType"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v24, "elementCount"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v26, CFSTR("elementCount"));

    objc_msgSend(v24, "data");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setObject:forKeyedSubscript:", v27, CFSTR("data"));
  }
  getVNSceneObservationClass();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "sceneprints");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v28, CFSTR("sceneprints"));

  }
  getVNClassificationObservationClass();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "identifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v29, CFSTR("identifier"));

  }
  v108 = 0;
  v109 = &v108;
  v110 = 0x2050000000;
  v30 = (void *)getVNPixelBufferObservationClass_softClass;
  v111 = getVNPixelBufferObservationClass_softClass;
  if (!getVNPixelBufferObservationClass_softClass)
  {
    v103 = MEMORY[0x1E0C809B0];
    v104 = 3221225472;
    v105 = __getVNPixelBufferObservationClass_block_invoke;
    v106 = &unk_1E45A3198;
    v107 = &v108;
    __getVNPixelBufferObservationClass_block_invoke((uint64_t)&v103);
    v30 = (void *)v109[3];
  }
  v31 = objc_retainAutorelease(v30);
  _Block_object_dispose(&v108, 8);
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "featureName");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v32, CFSTR("featureName"));

  }
  getVNSaliencyImageObservationClass();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "salientObjects");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v33, CFSTR("salientObjects"));

  }
  v108 = 0;
  v109 = &v108;
  v110 = 0x2050000000;
  v34 = (void *)getVNDetectedObjectObservationClass_softClass;
  v111 = getVNDetectedObjectObservationClass_softClass;
  if (!getVNDetectedObjectObservationClass_softClass)
  {
    v103 = MEMORY[0x1E0C809B0];
    v104 = 3221225472;
    v105 = __getVNDetectedObjectObservationClass_block_invoke;
    v106 = &unk_1E45A3198;
    v107 = &v108;
    __getVNDetectedObjectObservationClass_block_invoke((uint64_t)&v103);
    v34 = (void *)v109[3];
  }
  v35 = objc_retainAutorelease(v34);
  _Block_object_dispose(&v108, 8);
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "boundingBox");
    v37 = v36;
    v39 = v38;
    v41 = v40;
    v121[0] = CFSTR("origin.x");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v122[0] = v42;
    v121[1] = CFSTR("origin.y");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v37);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v122[1] = v43;
    v121[2] = CFSTR("size.width");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v39);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v122[2] = v44;
    v121[3] = CFSTR("size.height");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v41);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v122[3] = v45;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v122, v121, 4);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v46, CFSTR("boundingBox"));

  }
  v108 = 0;
  v109 = &v108;
  v110 = 0x2050000000;
  v47 = (void *)getVNRectangleObservationClass_softClass;
  v111 = getVNRectangleObservationClass_softClass;
  if (!getVNRectangleObservationClass_softClass)
  {
    v103 = MEMORY[0x1E0C809B0];
    v104 = 3221225472;
    v105 = __getVNRectangleObservationClass_block_invoke;
    v106 = &unk_1E45A3198;
    v107 = &v108;
    __getVNRectangleObservationClass_block_invoke((uint64_t)&v103);
    v47 = (void *)v109[3];
  }
  v48 = objc_retainAutorelease(v47);
  _Block_object_dispose(&v108, 8);
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v119[0] = CFSTR("x");
    v49 = (void *)MEMORY[0x1E0CB37E8];
    v50 = v3;
    objc_msgSend(v50, "topLeft");
    objc_msgSend(v49, "numberWithDouble:");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v120[0] = v51;
    v119[1] = CFSTR("y");
    v52 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v50, "topLeft");
    objc_msgSend(v52, "numberWithDouble:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v120[1] = v54;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v120, v119, 2);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v55, CFSTR("topLeft"));

    v117[0] = CFSTR("x");
    v56 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v50, "topRight");
    objc_msgSend(v56, "numberWithDouble:");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v117[1] = CFSTR("y");
    v118[0] = v57;
    v58 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v50, "topRight");
    objc_msgSend(v58, "numberWithDouble:", v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v118[1] = v60;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v118, v117, 2);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v61, CFSTR("topRight"));

    v115[0] = CFSTR("x");
    v62 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v50, "bottomLeft");
    objc_msgSend(v62, "numberWithDouble:");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v115[1] = CFSTR("y");
    v116[0] = v63;
    v64 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v50, "bottomLeft");
    objc_msgSend(v64, "numberWithDouble:", v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v116[1] = v66;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v116, v115, 2);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v67, CFSTR("bottomLeft"));

    v113[0] = CFSTR("x");
    v68 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v50, "bottomRight");
    objc_msgSend(v68, "numberWithDouble:");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v113[1] = CFSTR("y");
    v114[0] = v69;
    v70 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v50, "bottomRight");
    v72 = v71;

    objc_msgSend(v70, "numberWithDouble:", v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v114[1] = v73;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v114, v113, 2);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v74, CFSTR("bottomRight"));

  }
  getVNRecognizedObjectObservationClass();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v75 = v3;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = 0u;
    v95 = 0u;
    v92 = 0u;
    v93 = 0u;
    objc_msgSend(v75, "labels", 0);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v92, v112, 16);
    if (v78)
    {
      v79 = *(_QWORD *)v93;
      do
      {
        for (i = 0; i != v78; ++i)
        {
          if (*(_QWORD *)v93 != v79)
            objc_enumerationMutation(v77);
          objc_msgSend(v76, "addObject:", *(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * i));
        }
        v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v92, v112, 16);
      }
      while (v78);
    }

    objc_msgSend(v9, "setObject:forKeyedSubscript:", v76, CFSTR("labels"));
  }
  getVNEspressoModelImageprintClass();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v81 = v3;
    objc_msgSend((id)objc_opt_class(), "currentVersion");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v82, CFSTR("currentVersion"));

    objc_msgSend(v81, "descriptorData");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v83, CFSTR("descriptorData"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v81, "elementCount"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v84, CFSTR("elementCount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v81, "lengthInBytes"));
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v85, CFSTR("lengthInBytes"));

    objc_msgSend(v81, "labelsAndConfidence");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v86, CFSTR("labelsAndConfidence"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v81, "confidenceScoreType"));
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v87, CFSTR("confidenceScoreType"));

    v88 = (void *)MEMORY[0x1E0CB37E8];
    v89 = objc_msgSend(v81, "requestRevision");

    objc_msgSend(v88, "numberWithUnsignedInteger:", v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v90, CFSTR("requestRevision"));

  }
  return v9;
}

@end
