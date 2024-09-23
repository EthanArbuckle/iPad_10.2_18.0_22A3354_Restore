@implementation PFCameraMetadataSerialization

+ (id)deserializedMetadataFromData:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v13;
  if (!v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "+[PFCameraMetadataSerialization deserializedMetadataFromData:error:]";
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: Unable to deserialize camera metadata: %@. Attempting to deserialize legacy version.", buf, 0x16u);
    }
    v12 = v7;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v12;

    if (v10)
    {
      objc_msgSend((id)objc_opt_class(), "deserializedMetadataFromPrivateClientMetadata:error:", v10, a4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

      goto LABEL_13;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "+[PFCameraMetadataSerialization deserializedMetadataFromData:error:]";
      v16 = 2112;
      v17 = v9;
      _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%s: Unable to deserialize legacy camera metadata: %@.", buf, 0x16u);
      if (a4)
        goto LABEL_9;
    }
    else if (a4)
    {
LABEL_9:
      v8 = 0;
      *a4 = objc_retainAutorelease(v9);
      goto LABEL_12;
    }
    v8 = 0;
    goto LABEL_12;
  }
  objc_msgSend((id)objc_opt_class(), "deserializedMetadataFromCameraClientMetadata:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
LABEL_13:

  return v8;
}

+ (id)deserializedMetadataFromPrivateClientMetadata:(id)a3 error:(id *)a4
{
  id v6;
  PFCameraClientMetadata *v7;
  void *v8;

  v6 = a3;
  v7 = -[PFCameraClientMetadata initWithPrivateClientMetadata:contactIDsInProximity:sharedLibraryMode:]([PFCameraClientMetadata alloc], "initWithPrivateClientMetadata:contactIDsInProximity:sharedLibraryMode:", v6, 0, 0);

  objc_msgSend(a1, "deserializedMetadataFromCameraClientMetadata:error:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)deserializedMetadataFromCameraClientMetadata:(id)a3 error:(id *)a4
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id VNClassificationObservationClass;
  void *v11;
  id v12;
  id VNSaliencyImageObservationClass;
  id VNSceneObservationClass;
  id VNObservationClass;
  id VNRecognizedObjectObservationClass;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t m;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t n;
  void *v52;
  int v53;
  int v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  PFCameraMetadata *v61;
  uint64_t v62;
  void *v63;
  double v64;
  uint64_t v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  uint64_t v85;
  void *v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  PFCameraMetadata *v93;
  uint64_t v94;
  char v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  id obj;
  id obja;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  void *v105;
  void *v106;
  uint64_t v107;
  void *v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  _QWORD v133[4];
  id v134;
  id v135;
  uint64_t v136;
  _QWORD v137[5];
  uint64_t v138;
  uint64_t *v139;
  uint64_t v140;
  uint64_t v141;
  _BYTE v142[128];
  _BYTE v143[128];
  _BYTE v144[128];
  _BYTE v145[128];
  _BYTE v146[128];
  _BYTE v147[128];
  uint64_t v148;

  v148 = *MEMORY[0x1E0C80C00];
  v83 = a3;
  objc_msgSend(v83, "privateClientMetadata");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "inferenceAttachments");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  VNClassificationObservationClass = getVNClassificationObservationClass();
  v138 = 0;
  v139 = &v138;
  v140 = 0x2050000000;
  v11 = (void *)getVNImageAestheticsObservationClass_softClass;
  v141 = getVNImageAestheticsObservationClass_softClass;
  if (!getVNImageAestheticsObservationClass_softClass)
  {
    v137[0] = MEMORY[0x1E0C809B0];
    v137[1] = 3221225472;
    v137[2] = __getVNImageAestheticsObservationClass_block_invoke;
    v137[3] = &unk_1E45A3198;
    v137[4] = &v138;
    __getVNImageAestheticsObservationClass_block_invoke((uint64_t)v137);
    v11 = (void *)v139[3];
  }
  v104 = v7;
  v107 = v6;
  v12 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v138, 8);
  VNSaliencyImageObservationClass = getVNSaliencyImageObservationClass();
  VNSceneObservationClass = getVNSceneObservationClass();
  VNObservationClass = getVNObservationClass();
  VNRecognizedObjectObservationClass = getVNRecognizedObjectObservationClass();
  objc_msgSend(v4, "setWithObjects:", v5, v107, v104, v8, v9, VNClassificationObservationClass, v12, VNSaliencyImageObservationClass, VNSceneObservationClass, VNObservationClass, VNRecognizedObjectObservationClass, getVNFaceObservationClass(), 0);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "objectForKeyedSubscript:", *MEMORY[0x1E0C8A040]);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  if (v82 && !*a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v84, v82);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v69 = 0;
  }
  objc_msgSend(v89, "objectForKeyedSubscript:", *MEMORY[0x1E0C8A020]);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  if (v81 && !*a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v84, v81);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
  v67 = v17;
  objc_msgSend(v17, "firstObject");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "objectForKeyedSubscript:", *MEMORY[0x1E0C8A050]);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  if (v80 && !*a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v84, v80);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v70 = 0;
  }
  objc_msgSend(v89, "objectForKeyedSubscript:", *MEMORY[0x1E0C8A028]);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  if (v79 && !*a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v84, v79);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v72 = 0;
  }
  objc_msgSend(v89, "objectForKeyedSubscript:", *MEMORY[0x1E0C8A000]);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  if (v78 && !*a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v84, v78);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v75 = 0;
  }
  objc_msgSend(v89, "objectForKeyedSubscript:", *MEMORY[0x1E0C89FF8]);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  if (v77 && !*a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v84, v77);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v133[0] = MEMORY[0x1E0C809B0];
  v133[1] = 3221225472;
  v133[2] = __84__PFCameraMetadataSerialization_deserializedMetadataFromCameraClientMetadata_error___block_invoke;
  v133[3] = &unk_1E45A3170;
  v68 = v18;
  v134 = v68;
  v136 = 3737841669;
  v73 = v19;
  v135 = v73;
  objc_msgSend(v75, "enumerateObjectsUsingBlock:", v133);
  objc_msgSend(v89, "objectForKeyedSubscript:", *MEMORY[0x1E0C8A030]);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  if (v76 && !*a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v84, v76);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v74 = 0;
  }
  v20 = (void *)objc_opt_new();
  v21 = (void *)objc_opt_new();
  v22 = (void *)objc_opt_new();
  v23 = (void *)objc_opt_new();
  v108 = (void *)objc_opt_new();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v87, "detectedObjectInfo");
    obj = (id)objc_claimAutoreleasedReturnValue();
    if (obj)
    {
      v131 = 0u;
      v132 = 0u;
      v129 = 0u;
      v130 = 0u;
      v98 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v129, v147, 16);
      if (v98)
      {
        v96 = *(_QWORD *)v130;
        v94 = *MEMORY[0x1E0D04FB0];
        v92 = *MEMORY[0x1E0D04F88];
        v91 = *MEMORY[0x1E0D04F80];
        v90 = *MEMORY[0x1E0D04F60];
        v88 = *MEMORY[0x1E0D04F70];
        v85 = *MEMORY[0x1E0D04FA8];
        do
        {
          v24 = 0;
          do
          {
            if (*(_QWORD *)v130 != v96)
            {
              v25 = v24;
              objc_enumerationMutation(obj);
              v24 = v25;
            }
            v102 = v24;
            v26 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * v24);
            objc_msgSend(obj, "objectForKeyedSubscript:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "objectForKeyedSubscript:", v94);
            v105 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v26, "isEqualToString:", v92))
            {
              v127 = 0u;
              v128 = 0u;
              v125 = 0u;
              v126 = 0u;
              v28 = v105;
              v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v125, v146, 16);
              if (v29)
              {
                v30 = *(_QWORD *)v126;
                do
                {
                  for (i = 0; i != v29; ++i)
                  {
                    if (*(_QWORD *)v126 != v30)
                      objc_enumerationMutation(v28);
                    +[_PFCameraMetadataAVMetadataObject humanFaceObjectWithFigEmbeddedCaptureDeviceObjectDictionary:](_PFCameraMetadataAVMetadataObject, "humanFaceObjectWithFigEmbeddedCaptureDeviceObjectDictionary:", *(_QWORD *)(*((_QWORD *)&v125 + 1) + 8 * i));
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v20, "addObject:", v32);

                  }
                  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v125, v146, 16);
                }
                while (v29);
              }
            }
            else if (objc_msgSend(v26, "isEqualToString:", v91))
            {
              v123 = 0u;
              v124 = 0u;
              v121 = 0u;
              v122 = 0u;
              v33 = v105;
              v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v121, v145, 16);
              if (v34)
              {
                v35 = *(_QWORD *)v122;
                do
                {
                  for (j = 0; j != v34; ++j)
                  {
                    if (*(_QWORD *)v122 != v35)
                      objc_enumerationMutation(v33);
                    +[_PFCameraMetadataAVMetadataObject humanBodyObjectWithFigEmbeddedCaptureDeviceObjectDictionary:](_PFCameraMetadataAVMetadataObject, "humanBodyObjectWithFigEmbeddedCaptureDeviceObjectDictionary:", *(_QWORD *)(*((_QWORD *)&v121 + 1) + 8 * j));
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v21, "addObject:", v37);

                  }
                  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v121, v145, 16);
                }
                while (v34);
              }
            }
            else if (objc_msgSend(v26, "isEqualToString:", v90))
            {
              v119 = 0u;
              v120 = 0u;
              v117 = 0u;
              v118 = 0u;
              v38 = v105;
              v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v117, v144, 16);
              if (v39)
              {
                v40 = *(_QWORD *)v118;
                do
                {
                  for (k = 0; k != v39; ++k)
                  {
                    if (*(_QWORD *)v118 != v40)
                      objc_enumerationMutation(v38);
                    +[_PFCameraMetadataAVMetadataObject catBodyObjectWithFigEmbeddedCaptureDeviceObjectDictionary:](_PFCameraMetadataAVMetadataObject, "catBodyObjectWithFigEmbeddedCaptureDeviceObjectDictionary:", *(_QWORD *)(*((_QWORD *)&v117 + 1) + 8 * k));
                    v42 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v22, "addObject:", v42);

                  }
                  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v117, v144, 16);
                }
                while (v39);
              }
            }
            else if (objc_msgSend(v26, "isEqualToString:", v88))
            {
              v115 = 0u;
              v116 = 0u;
              v113 = 0u;
              v114 = 0u;
              v43 = v105;
              v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v113, v143, 16);
              if (v44)
              {
                v45 = *(_QWORD *)v114;
                do
                {
                  for (m = 0; m != v44; ++m)
                  {
                    if (*(_QWORD *)v114 != v45)
                      objc_enumerationMutation(v43);
                    +[_PFCameraMetadataAVMetadataObject dogBodyObjectWithFigEmbeddedCaptureDeviceObjectDictionary:](_PFCameraMetadataAVMetadataObject, "dogBodyObjectWithFigEmbeddedCaptureDeviceObjectDictionary:", *(_QWORD *)(*((_QWORD *)&v113 + 1) + 8 * m));
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v23, "addObject:", v47);

                  }
                  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v113, v143, 16);
                }
                while (v44);
              }
            }
            else
            {
              if (!objc_msgSend(v26, "isEqualToString:", v85))
                goto LABEL_83;
              v111 = 0u;
              v112 = 0u;
              v109 = 0u;
              v110 = 0u;
              v48 = v105;
              v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v109, v142, 16);
              if (v49)
              {
                v50 = *(_QWORD *)v110;
                do
                {
                  for (n = 0; n != v49; ++n)
                  {
                    if (*(_QWORD *)v110 != v50)
                      objc_enumerationMutation(v48);
                    +[_PFCameraMetadataAVMetadataObject salientObjectWithFigEmbeddedCaptureDeviceObjectDictionary:](_PFCameraMetadataAVMetadataObject, "salientObjectWithFigEmbeddedCaptureDeviceObjectDictionary:", *(_QWORD *)(*((_QWORD *)&v109 + 1) + 8 * n));
                    v52 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v108, "addObject:", v52);

                  }
                  v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v109, v142, 16);
                }
                while (v49);
              }
            }

LABEL_83:
            v24 = v102 + 1;
          }
          while (v102 + 1 != v98);
          v98 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v129, v147, 16);
        }
        while (v98);
      }
    }

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v97 = objc_msgSend(v87, "spatialOverCaptureImageStitchingConfidenceScore");
  else
    v97 = 0;
  v53 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v87, "spatialOverCaptureImageHorizonLinePresent"))
  {
    objc_msgSend(v87, "spatialOverCaptureImageHorizonLineAngleInDegrees");
    v53 = v54;
    v95 = 1;
  }
  else
  {
    v95 = 0;
  }
  objc_msgSend(v89, "objectForKeyedSubscript:", *MEMORY[0x1E0C8A008]);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "objectForKeyedSubscript:", *MEMORY[0x1E0C8A038]);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  if (v106 && !*a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v84, v106);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v55 = 0;
  }
  v56 = v55;
  objc_msgSend(v55, "firstObject");
  obja = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "objectForKeyedSubscript:", *MEMORY[0x1E0C8A048]);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  if (v103 && !*a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v84, v103);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v57 = 0;
  }
  objc_msgSend(v57, "firstObject");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "contactIDsInProximity");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(v83, "sharedLibraryMode");
  if (*a4)
  {
    v61 = 0;
  }
  else
  {
    v62 = v60;
    v93 = [PFCameraMetadata alloc];
    objc_msgSend(v87, "captureFolderClientPath");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v66) = v95;
    LODWORD(v64) = v53;
    v61 = -[PFCameraMetadata initWithJunkImageClassificationObservations:imageAestheticsObservation:saliencyObservation:scenePrintObservation:detectedObjectsInfoHumanFaces:detectedObjectsInfoHumanBodies:detectedObjectsInfoCatBodies:detectedObjectsInfoDogBodies:detectedObjectsSalientObjects:smartCamInfo:stitchConfidence:horizonLinePresent:horizonLineAngleInDegrees:captureFolderPath:semanticDevelopmentGatingObservations:faceObservations:torsoprints:foodAndDrinkObservations:semanticEnhanceScene:contactIDsInProximity:sharedLibraryMode:](v93, "initWithJunkImageClassificationObservations:imageAestheticsObservation:saliencyObservation:scenePrintObservation:detectedObjectsInfoHumanFaces:detectedObjectsInfoHumanBodies:detectedObjectsInfoCatBodies:detectedObjectsInfoDogBodies:detectedObjectsSalientObjects:smartCamInfo:stitchConfidence:horizonLinePresent:horizonLineAngleInDegrees:captureFolderPath:semanticDevelopmentGatingObservations:faceObservations:torsoprints:foodAndDrinkObservations:semanticEnhanceScene:contactIDsInProximity:sharedLibraryMode:", v69, v71, obja, v58, v20, v21, v64, v22, v23, v108, v99, v97, v66,
            v63,
            v70,
            v72,
            v73,
            v74,
            0,
            v59,
            v62);

  }
  return v61;
}

+ (id)serializedDataFromClientMetadata:(id)a3 error:(id *)a4
{
  id v6;
  PFCameraClientMetadata *v7;
  void *v8;

  v6 = a3;
  v7 = -[PFCameraClientMetadata initWithPrivateClientMetadata:contactIDsInProximity:sharedLibraryMode:]([PFCameraClientMetadata alloc], "initWithPrivateClientMetadata:contactIDsInProximity:sharedLibraryMode:", v6, 0, 0);

  objc_msgSend(a1, "serializedDataFromCameraClientMetadata:error:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)serializedDataFromCameraClientMetadata:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, a4);
}

+ (id)serializedDataFromClientMetadata:(id)a3 contactIDsInProximity:(id)a4 sharedLibraryMode:(int64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  PFCameraClientMetadata *v12;
  void *v13;

  v10 = a4;
  v11 = a3;
  v12 = -[PFCameraClientMetadata initWithPrivateClientMetadata:contactIDsInProximity:sharedLibraryMode:]([PFCameraClientMetadata alloc], "initWithPrivateClientMetadata:contactIDsInProximity:sharedLibraryMode:", v11, v10, a5);

  objc_msgSend(a1, "serializedDataFromCameraClientMetadata:error:", v12, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __84__PFCameraMetadataSerialization_deserializedMetadataFromCameraClientMetadata_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  objc_class *v9;
  id v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v5 = a2;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
    goto LABEL_8;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v27 = &v26;
  v28 = 0x2050000000;
  v8 = (void *)getVNFaceprintClass_softClass;
  v29 = getVNFaceprintClass_softClass;
  if (!getVNFaceprintClass_softClass)
  {
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __getVNFaceprintClass_block_invoke;
    v24 = &unk_1E45A3198;
    v25 = &v26;
    __getVNFaceprintClass_block_invoke((uint64_t)&v21);
    v8 = (void *)v27[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v26, 8);
  v10 = [v9 alloc];
  v11 = objc_retainAutorelease(v5);
  v12 = objc_msgSend(v11, "bytes");
  v13 = (unint64_t)objc_msgSend(v11, "length") >> 2;
  v14 = objc_msgSend(v11, "length");
  objc_msgSend(v7, "floatValue");
  v15 = (void *)objc_msgSend(v10, "initWithRawData:elementCount:elementType:lengthInBytes:confidence:requestRevision:", v12, v13, 1, v14, *(_QWORD *)(a1 + 48));
  v26 = 0;
  v27 = &v26;
  v28 = 0x2050000000;
  v16 = (void *)getVNFaceTorsoprintClass_softClass;
  v29 = getVNFaceTorsoprintClass_softClass;
  if (!getVNFaceTorsoprintClass_softClass)
  {
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __getVNFaceTorsoprintClass_block_invoke;
    v24 = &unk_1E45A3198;
    v25 = &v26;
    __getVNFaceTorsoprintClass_block_invoke((uint64_t)&v21);
    v16 = (void *)v27[3];
  }
  v17 = objc_retainAutorelease(v16);
  _Block_object_dispose(&v26, 8);
  v18 = (void *)objc_msgSend([v17 alloc], "initWithFaceprint:torsoprint:", v15, 0);

  if (!v18)
  {
LABEL_8:
    v20 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v20;
  }
  else
  {
    v19 = *(void **)(a1 + 40);
  }
  objc_msgSend(v19, "addObject:", v18);

}

@end
