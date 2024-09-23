@implementation PESerializationUtility

+ (id)editSourceForContentEditingInput:(id)a3 error:(id *)a4
{
  return +[PESerializationUtility editSourceForContentEditingInput:useRawDisplaySizeImage:useEmbeddedPreview:error:](PESerializationUtility, "editSourceForContentEditingInput:useRawDisplaySizeImage:useEmbeddedPreview:error:", a3, 0, 0, a4);
}

+ (id)editSourceForContentEditingInput:(id)a3 useEmbeddedPreview:(BOOL)a4 error:(id *)a5
{
  return +[PESerializationUtility editSourceForContentEditingInput:useRawDisplaySizeImage:useEmbeddedPreview:error:](PESerializationUtility, "editSourceForContentEditingInput:useRawDisplaySizeImage:useEmbeddedPreview:error:", a3, 1, a4, a5);
}

+ (id)editSourceForContentEditingInput:(id)a3 useRawDisplaySizeImage:(BOOL)a4 useEmbeddedPreview:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  _BOOL4 v8;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  uint64_t v39;
  const __CFString *v40;
  uint64_t v41;
  const __CFString *v42;
  uint64_t v43;
  _QWORD v44[2];

  v7 = a5;
  v8 = a4;
  v44[1] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  if (v11)
  {
    if (a6)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PESerializationUtility.m"), 86, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentEditingInput != nil"));

    if (a6)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PESerializationUtility.m"), 87, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error != nil"));

LABEL_3:
  v12 = objc_msgSend(v11, "mediaType");
  if ((unint64_t)(v12 - 2) < 2)
  {
    objc_msgSend(v11, "videoURL");
    v20 = objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      v23 = (void *)MEMORY[0x24BDD1540];
      v41 = *MEMORY[0x24BDD0BA0];
      v42 = CFSTR("Missing video URL");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v23;
      v26 = 2;
LABEL_20:
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("PESerializationUtilityErrorDomain"), v26, v24);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

      v14 = 0;
      v21 = 0;
      goto LABEL_23;
    }
    v14 = (void *)v20;
    v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE72060]), "initWithVideoURL:", v20);
LABEL_23:

    goto LABEL_24;
  }
  if (!v12)
  {
    v22 = (void *)MEMORY[0x24BDD1540];
    v39 = *MEMORY[0x24BDD0BA0];
    v40 = CFSTR("Unknown media type");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("PESerializationUtilityErrorDomain"), 0, v14);
    v21 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  if (v12 == 1)
  {
    objc_msgSend(v11, "fullSizeImageURL");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      objc_msgSend(v11, "uniformTypeIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15
        && (objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", v15),
            v16 = (void *)objc_claimAutoreleasedReturnValue(),
            v17 = objc_msgSend(v16, "conformsToType:", *MEMORY[0x24BDF8550]),
            v16,
            v17)
        && !v8)
      {
        v18 = (id)objc_msgSend(v11, "displaySizeImage");
        v19 = 0;
      }
      else
      {
        objc_msgSend(v11, "displaySizeImage");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE72030]), "initWithURL:type:image:useEmbeddedPreview:", v14, v15, v19, v7);
      objc_msgSend(v11, "livePhoto");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (v28)
      {
        v30 = (void *)MEMORY[0x24BDBCF48];
        objc_msgSend(v28, "videoComplement");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "videoPath");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "fileURLWithPath:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE72060]), "initWithVideoURL:", v33);
        v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE71FD0]), "initWithPhotoSource:videoComplement:", v27, v34);

      }
      else
      {
        v21 = v27;
      }

      goto LABEL_23;
    }
    v35 = (void *)MEMORY[0x24BDD1540];
    v43 = *MEMORY[0x24BDD0BA0];
    v44[0] = CFSTR("Missing image URL");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v35;
    v26 = 1;
    goto LABEL_20;
  }
  v21 = 0;
LABEL_24:

  return v21;
}

+ (id)compositionControllerForContentEditingInput:(id)a3 asShot:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  +[PESerializationUtility editSourceForContentEditingInput:useRawDisplaySizeImage:useEmbeddedPreview:error:](PESerializationUtility, "editSourceForContentEditingInput:useRawDisplaySizeImage:useEmbeddedPreview:error:", v7, 0, 0, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    +[PESerializationUtility compositionControllerForContentEditingInput:asShot:source:error:](PESerializationUtility, "compositionControllerForContentEditingInput:asShot:source:error:", v7, v6, v8, a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)compositionControllerForContentEditingInput:(id)a3 asShot:(BOOL)a4 source:(id)a5 error:(id *)a6
{
  _BOOL4 v8;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  NSObject *v59;
  id v60;
  void *v61;
  void *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  char v75;
  void *v76;
  void *v77;
  id v78;
  uint64_t v79;
  NSObject *v80;
  void *v82;
  void *v83;
  void *v84;
  id *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  _QWORD v92[4];
  id v93;
  id v94;
  _QWORD v95[4];
  id v96;
  NSObject *v97;
  _QWORD v98[4];
  id v99;
  _QWORD v100[4];
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  uint8_t buf[4];
  NSObject *v107;
  uint64_t v108;

  v8 = a4;
  v108 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a5;
  v13 = v12;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PESerializationUtility.m"), 174, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentEditingInput != nil"));

    if (v13)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PESerializationUtility.m"), 175, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("source != nil"));

LABEL_3:
  v85 = a6;
  if (!a6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PESerializationUtility.m"), 176, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error != nil"));

  }
  objc_msgSend(v11, "originalAdjustmentData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "adjustmentData");
  v15 = objc_claimAutoreleasedReturnValue();
  v89 = v14;
  v90 = v13;
  v88 = (void *)v15;
  if (v8)
  {
    if (v14)
    {
      v16 = (void *)objc_opt_new();
      objc_msgSend(v14, "data");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "formatIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "formatVersion");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = 0;
      objc_msgSend(v16, "loadCompositionFrom:formatIdentifier:formatVersion:sidecarData:error:", v17, v18, v19, 0, &v105);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v105;

      if (!v21)
      {
        v28 = 0;
        goto LABEL_40;
      }
      PLPhotoEditGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v107 = v21;
        _os_log_impl(&dword_20D13D000, v22, OS_LOG_TYPE_ERROR, "PESerializationUtility persistence manager deserialized with error: %@", buf, 0xCu);
      }
      goto LABEL_38;
    }
    v28 = (void *)v15;
    if (v15)
    {
      v29 = objc_alloc(MEMORY[0x24BE71C40]);
      v30 = (void *)objc_msgSend(MEMORY[0x24BE71CC8], "newComposition");
      v21 = objc_msgSend(v29, "initWithComposition:", v30);

      v31 = (void *)objc_opt_new();
      objc_msgSend(v28, "data");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "formatIdentifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "formatVersion");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v104 = 0;
      objc_msgSend(v31, "loadCompositionFrom:formatIdentifier:formatVersion:sidecarData:error:", v32, v33, v34, 0, &v104);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v104;

      if (v22)
      {
        PLPhotoEditGetLog();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v107 = v22;
          _os_log_impl(&dword_20D13D000, v36, OS_LOG_TYPE_ERROR, "PESerializationUtility persistence manager deserialized with error: %@", buf, 0xCu);
        }

      }
      if (v35)
      {
        v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE71C40]), "initWithComposition:", v35);
        v38 = objc_alloc(MEMORY[0x24BE72400]);
        objc_msgSend(v11, "fullSizeImageURL");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = (void *)objc_msgSend(v38, "initWithMediaURL:timeZoneLookup:", v39, 0);

        objc_msgSend(v11, "livePhoto");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        +[PESupport repairedAsShotCompositionController:forCurrentCompositionController:isLivePhoto:metadata:](PESupport, "repairedAsShotCompositionController:forCurrentCompositionController:isLivePhoto:metadata:", v21, v37, v41 != 0, v40);
        v42 = objc_claimAutoreleasedReturnValue();

        -[NSObject composition](v42, "composition");
        v20 = objc_claimAutoreleasedReturnValue();

        v21 = v42;
      }
      else
      {
        v20 = 0;
      }

LABEL_38:
      v28 = 0;
      goto LABEL_39;
    }
LABEL_41:
    v20 = objc_msgSend(MEMORY[0x24BE71CC8], "newComposition");
    goto LABEL_42;
  }
  if (v15)
    v23 = (void *)v15;
  else
    v23 = v14;
  v24 = v23;
  if (!v24)
  {
    v28 = 0;
    goto LABEL_41;
  }
  v21 = v24;
  objc_msgSend(v11, "adjustmentSecondaryDataURL");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
  {
    v28 = 0;
    goto LABEL_28;
  }
  v26 = (void *)MEMORY[0x24BE71C78];
  objc_msgSend(v11, "adjustmentSecondaryDataURL");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = 0;
  objc_msgSend(v26, "loadFromURL:error:", v27, &v103);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v103;

  if (v28)
  {
    if (!v22)
    {
LABEL_28:
      v43 = (void *)objc_opt_new();
      -[NSObject data](v21, "data");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject formatIdentifier](v21, "formatIdentifier");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject formatVersion](v21, "formatVersion");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = 0;
      objc_msgSend(v43, "loadCompositionFrom:formatIdentifier:formatVersion:sidecarData:error:", v44, v45, v46, v28, &v102);
      v20 = objc_claimAutoreleasedReturnValue();
      v22 = v102;

      if (v22)
      {
        PLPhotoEditGetLog();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v107 = v22;
          _os_log_impl(&dword_20D13D000, v47, OS_LOG_TYPE_ERROR, "PESerializationUtility persistence manager deserialized with error: %@", buf, 0xCu);
        }

      }
      goto LABEL_39;
    }
  }
  else
  {
    PLPhotoEditGetLog();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v107 = v22;
      _os_log_impl(&dword_20D13D000, v48, OS_LOG_TYPE_ERROR, "PESerializationUtility sidecard data could not be loaded: %@", buf, 0xCu);
    }

    if (!v22)
      goto LABEL_28;
  }
  v20 = 0;
LABEL_39:

  v13 = v90;
LABEL_40:

  if (!v20)
    goto LABEL_41;
LABEL_42:
  v86 = (void *)v20;
  v49 = (void *)objc_msgSend(MEMORY[0x24BE71CC8], "newCompositionControllerWithComposition:", v20);
  objc_msgSend(v49, "adjustmentConstants");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "source");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setSource:mediaType:", v50, objc_msgSend(v13, "mediaType"));

  if (objc_msgSend(v11, "mediaType") == 2 && (objc_msgSend(v11, "mediaSubtypes") & 0x20000) != 0)
  {
    objc_msgSend(v49, "slomoAdjustmentController");
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v51)
    {
      objc_msgSend(v91, "PISlomoAdjustmentKey");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v100[0] = MEMORY[0x24BDAC760];
      v100[1] = 3221225472;
      v100[2] = __90__PESerializationUtility_compositionControllerForContentEditingInput_asShot_source_error___block_invoke;
      v100[3] = &unk_24C618798;
      v101 = v11;
      objc_msgSend(v49, "modifyAdjustmentWithKey:modificationBlock:", v52, v100);

    }
  }
  objc_msgSend(v49, "depthAdjustmentController");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v53;
  if (v53)
  {
    objc_msgSend(v53, "capturedFocusRect");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "focusRect");
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    if (v55 && !v56)
    {
      v57 = *MEMORY[0x24BE71DB8];
      v98[0] = MEMORY[0x24BDAC760];
      v98[1] = 3221225472;
      v98[2] = __90__PESerializationUtility_compositionControllerForContentEditingInput_asShot_source_error___block_invoke_2;
      v98[3] = &unk_24C6187C0;
      v99 = v55;
      objc_msgSend(v49, "modifyAdjustmentWithKey:modificationBlock:", v57, v98);

    }
  }
  v87 = v28;
  objc_msgSend(v49, "semanticStyleAdjustmentController");
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v58)
  {
    v59 = dispatch_group_create();
    dispatch_group_enter(v59);
    v60 = objc_alloc(MEMORY[0x24BE71CF0]);
    objc_msgSend(v49, "composition");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = (void *)objc_msgSend(v60, "initWithComposition:", v61);

    v95[0] = MEMORY[0x24BDAC760];
    v95[1] = 3221225472;
    v95[2] = __90__PESerializationUtility_compositionControllerForContentEditingInput_asShot_source_error___block_invoke_3;
    v95[3] = &unk_24C618810;
    v96 = v49;
    v97 = v59;
    v63 = v59;
    objc_msgSend(v62, "submit:", v95);
    dispatch_group_wait(v63, 0xFFFFFFFFFFFFFFFFLL);

  }
  v64 = (void *)MEMORY[0x24BE71CC8];
  objc_msgSend(v49, "composition");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "imagePropertiesRequestWithComposition:", v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v66, "setName:", CFSTR("PAEditSupport-compositionControllerDeserialization"));
  v94 = 0;
  objc_msgSend(v66, "submitSynchronous:", &v94);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v94;
  objc_msgSend(v67, "properties");
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v69)
  {
    v78 = 0;
    *v85 = objc_retainAutorelease(v68);
    goto LABEL_66;
  }
  objc_msgSend(v69, "rawProperties");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  if (v70)
  {
    objc_msgSend(v49, "rawAdjustmentController");
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    if (v71)
    {
      objc_msgSend(v49, "rawAdjustmentController");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "inputDecoderVersion");
      v73 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v70, "availableDecoderVersions");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = objc_msgSend(v74, "containsObject:", v73);

      v13 = v90;
      if ((v75 & 1) != 0)
        goto LABEL_61;
    }
    objc_msgSend(v91, "PIRawAdjustmentKey");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v92[0] = MEMORY[0x24BDAC760];
    v92[1] = 3221225472;
    v92[2] = __90__PESerializationUtility_compositionControllerForContentEditingInput_asShot_source_error___block_invoke_75;
    v92[3] = &unk_24C618838;
    v93 = v70;
    objc_msgSend(v49, "modifyAdjustmentWithKey:modificationBlock:", v76, v92);

    v77 = v93;
  }
  else
  {
    objc_msgSend(v91, "PIRawAdjustmentKey");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "removeAdjustmentWithKey:", v77);
  }

LABEL_61:
  v79 = objc_msgSend(v69, "orientation");
  if ((NUOrientationIsValid() & 1) == 0)
  {
    PLPhotoEditGetLog();
    v80 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v107) = v79;
      _os_log_impl(&dword_20D13D000, v80, OS_LOG_TYPE_ERROR, "PESerializationUtility image orientation from the image properties is invalid: %d", buf, 8u);
    }

    v79 = 1;
    v13 = v90;
  }
  objc_msgSend(MEMORY[0x24BE71F80], "compositionController:setInputOrientation:", v49, v79);
  v78 = v49;

LABEL_66:
  return v78;
}

+ (BOOL)adjustmentDataIsSupported:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  BOOL v11;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "formatIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "formatVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  objc_msgSend(v4, "loadCompositionFrom:formatIdentifier:formatVersion:sidecarData:error:", v5, v6, v7, 0, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;

  if (v9)
  {
    PLPhotoEditGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v9;
      _os_log_impl(&dword_20D13D000, v10, OS_LOG_TYPE_INFO, "PESerializationUtility adjustment data is not supported: %@", buf, 0xCu);
    }

    v11 = 0;
  }
  else
  {
    v11 = v8 != 0;
  }

  return v11;
}

+ (id)contentEditingOutputForContentEditingInput:(id)a3 compositionController:(id)a4 asset:(id)a5 async:(BOOL)a6 onlyChangingOriginalChoice:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL8 v8;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  int v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  id v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  id v63;
  NSObject *v64;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  void *v74;
  id v75;
  CMTime time;
  id v77;
  id v78;
  id v79;
  id v80;
  uint8_t buf[4];
  id v82;
  uint64_t v83;

  v7 = a7;
  v8 = a6;
  v83 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
LABEL_43:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PESerializationUtility.m"), 388, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("compositionController != nil"));

    if (v15)
      goto LABEL_4;
    goto LABEL_44;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PESerializationUtility.m"), 387, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentEditingInput != nil"));

  if (!v14)
    goto LABEL_43;
LABEL_3:
  if (v15)
    goto LABEL_4;
LABEL_44:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PESerializationUtility.m"), 389, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset != nil"));

LABEL_4:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;
  v18 = objc_msgSend(v15, "isLivePhoto");
  v19 = objc_alloc_init(MEMORY[0x24BDE3538]);
  v20 = v19;
  v74 = v19;
  if (v7)
  {
    objc_msgSend(v19, "setOnlyChangingOriginalChoice:", 1);
  }
  else
  {
    objc_msgSend(v19, "setAsyncAdjustment:", v8);
    objc_msgSend(v15, "uniformTypeIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "conformsToType:", *MEMORY[0x24BDF8720]);

    }
    else
    {
      v23 = 0;
    }
    v20 = v74;
    objc_msgSend(v74, "setPreferHEICForRenderedImages:", v23 | ((unint64_t)objc_msgSend(v17, "mediaSubtypes") >> 23) & 1);
    if (v18)
    {
      objc_msgSend(v14, "autoLoopAdjustmentController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v74;
      objc_msgSend(v74, "setPlaybackStyle:", +[PESerializationUtility _playbackStyleForAutoLoopController:](PESerializationUtility, "_playbackStyleForAutoLoopController:", v24));

    }
  }
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE3530]), "initWithContentEditingInput:withOptions:", v13, v20);
  v75 = v14;
  if (!v7)
  {
    v72 = v17;
    v26 = v13;
    if (v17)
      v27 = (int)objc_msgSend(v17, "exifOrientation");
    else
      v27 = 1;
    v28 = (void *)MEMORY[0x24BE72018];
    v29 = objc_msgSend(v15, "pixelWidth");
    v30 = objc_msgSend(v15, "pixelHeight");
    objc_msgSend(v15, "duration");
    objc_msgSend(v28, "exportPropertiesWithImageWidth:imageHeight:exifOrientation:duration:", v29, v30, v27);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_opt_new();
    v79 = 0;
    v80 = 0;
    objc_msgSend(v32, "dataFromCompositionController:outFormatIdentifier:outFormatVersion:exportProperties:", v75, &v80, &v79, v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v80;
    v35 = v79;

    v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE3480]), "initWithFormatIdentifier:formatVersion:data:", v34, v35, v33);
    objc_msgSend(v25, "setAdjustmentData:", v36);

    v13 = v26;
    objc_msgSend(v26, "originalAdjustmentData");
    v37 = objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      v38 = (void *)v37;
      objc_msgSend(v26, "adjustmentData");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v39)
      {
        objc_msgSend(v26, "originalAdjustmentData");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "adjustmentRenderTypes");
        objc_msgSend(v25, "adjustmentData");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setAdjustmentRenderTypes:", v41);

      }
    }

    v14 = v75;
    v17 = v72;
  }
  if (v18)
  {
    objc_msgSend(v14, "autoLoopAdjustmentController");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = +[PESerializationUtility _playbackVariationForAutoLoopController:](PESerializationUtility, "_playbackVariationForAutoLoopController:", v43);

    v14 = v75;
    if ((_DWORD)v44 != objc_msgSend(v15, "playbackVariation"))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setPlaybackVariation:", v45);

    }
  }
  if (objc_msgSend(v25, "isAsyncAdjustment"))
  {
    v46 = objc_alloc(MEMORY[0x24BE6C398]);
    objc_msgSend(v14, "composition");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)objc_msgSend(v46, "initWithComposition:", v47);

    objc_msgSend(v48, "setName:", CFSTR("+[PESerializationUtility contentEditingOutputForContentEditingInput:]-Geometry"));
    v78 = 0;
    objc_msgSend(v48, "submitSynchronous:", &v78);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v78;
    objc_msgSend(v49, "geometry");
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    v71 = v50;
    if (v51)
    {
      v52 = objc_msgSend(v51, "size");
      v54 = v53;
      v14 = v75;
    }
    else
    {
      PLPhotoEditGetLog();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v82 = v50;
        _os_log_impl(&dword_20D13D000, v55, OS_LOG_TYPE_INFO, "Failed to request geometry with error: %@", buf, 0xCu);
      }

      v52 = objc_msgSend(v15, "pixelWidth");
      v54 = objc_msgSend(v15, "pixelHeight");
      v14 = v75;
      if ((v54 | v52) < 0)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NUPixelSize NUPixelSizeMake(NSInteger, NSInteger)");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "handleFailureInFunction:file:lineNumber:description:", v70, CFSTR("NUGeometryPrimitives.h"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(width >= 0) && (height >= 0)"), v71);

        v14 = v75;
      }
    }
    objc_msgSend(v25, "setFullSizeRenderWidth:", v52);
    objc_msgSend(v25, "setFullSizeRenderHeight:", v54);
    if (objc_msgSend(v14, "mediaType") == 2)
    {
      v73 = v17;
      v56 = v13;
      v57 = objc_alloc(MEMORY[0x24BE6C420]);
      objc_msgSend(v14, "composition");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = (void *)objc_msgSend(v57, "initWithComposition:", v58);

      objc_msgSend(v59, "setName:", CFSTR("+[PESerializationUtility contentEditingOutputForContentEditingInput:]-VideoAttributes"));
      v77 = 0;
      objc_msgSend(v59, "submitSynchronous:", &v77);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = v77;
      objc_msgSend(v60, "videoAttributes");
      v62 = (void *)objc_claimAutoreleasedReturnValue();

      if (v62)
      {
        objc_msgSend(v62, "duration");
        objc_msgSend(v25, "setFullSizeRenderDuration:", CMTimeGetSeconds(&time));
        v14 = v75;
      }
      else
      {
        v63 = v61;
        PLPhotoEditGetLog();
        v64 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v82 = v63;
          _os_log_impl(&dword_20D13D000, v64, OS_LOG_TYPE_INFO, "Failed to request video attributes with error: %@", buf, 0xCu);
        }

        v14 = v75;
        v61 = v63;
      }

      v13 = v56;
      v17 = v73;
    }

  }
  return v25;
}

+ (id)archiveURLForSidecarData:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PESerializationUtility.m"), 476, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sidecarData != nil"));

  }
  objc_msgSend(v5, "sourceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PESerializationUtility.m"), 477, CFSTR("Invalid sidecar data source identifier"));

  }
  v8 = objc_alloc(MEMORY[0x24BDBCF48]);
  NSTemporaryDirectory();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initFileURLWithPath:", v9);

  objc_msgSend(v10, "URLByAppendingPathComponent:", CFSTR("com.apple.PhotoImaging.Masks"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "sourceIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URLByAppendingPathComponent:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "URLByAppendingPathExtension:", CFSTR("aar"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (BOOL)saveSidecarData:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  char v15;
  void *v17;
  void *v18;
  void *v19;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_9:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PESerializationUtility.m"), 488, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("archiveURL != nil"));

    if (a5)
      goto LABEL_4;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PESerializationUtility.m"), 487, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sidecarData != nil"));

  if (!v11)
    goto LABEL_9;
LABEL_3:
  if (a5)
    goto LABEL_4;
LABEL_10:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PESerializationUtility.m"), 489, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error != NULL"));

LABEL_4:
  objc_msgSend(v11, "URLByDeletingLastPathComponent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v12, 1, 0, a5);

  if (v14)
    v15 = objc_msgSend(v9, "saveToURL:error:", v11, a5);
  else
    v15 = 0;

  return v15;
}

+ (id)exportCompositionController:(id)a3 forContentEditingOutput:(id)a4 settings:(id)a5 completionQueue:(id)a6 completion:(id)a7
{
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD *v35;
  _BOOL8 v36;
  void *v37;
  void *v38;
  id v39;
  id *v40;
  id *v41;
  id *v42;
  void *v43;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  NSObject *v52;
  _QWORD v53[4];
  id v54;
  uint64_t v55;
  id v56;
  _QWORD v57[4];
  id v58;
  uint64_t v59;
  NSObject *v60;
  id v61;
  _QWORD block[4];
  id v63;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (v14)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PESerializationUtility.m"), 507, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentEditingOutput != nil"));

    if (v13)
    {
LABEL_3:
      if (v15)
        goto LABEL_4;
      goto LABEL_28;
    }
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PESerializationUtility.m"), 508, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("compositionController != nil"));

  if (v15)
  {
LABEL_4:
    if (v16)
      goto LABEL_5;
LABEL_29:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PESerializationUtility.m"), 510, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionQueue != nil"));

    if (v17)
      goto LABEL_6;
    goto LABEL_30;
  }
LABEL_28:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PESerializationUtility.m"), 509, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("settings != nil"));

  if (!v16)
    goto LABEL_29;
LABEL_5:
  if (v17)
    goto LABEL_6;
LABEL_30:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PESerializationUtility.m"), 511, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion != nil"));

LABEL_6:
  objc_msgSend(v14, "renderedContentURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {

    goto LABEL_9;
  }
  if ((objc_msgSend(v14, "isAsyncAdjustment") & 1) != 0)
  {
LABEL_9:
    v19 = (void *)MEMORY[0x24BE71CC8];
    objc_msgSend(v13, "composition");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "validatedCompositionCopyForComposition:mediaType:", v20, objc_msgSend(v13, "mediaType"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v50 = v15;
    v51 = v17;
    v52 = v16;
    if (objc_msgSend(v14, "isAsyncAdjustment"))
    {
      v22 = objc_msgSend(v14, "mediaType");
      if (v22 == 2)
        objc_msgSend(v14, "renderedVideoPosterURL");
      else
        objc_msgSend(v14, "renderedPreviewContentURL");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v22 != 2;
      v28 = (void *)objc_opt_new();
      v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6C3E8]), "initWithLevel:", 1);
      objc_msgSend(v28, "setPriority:", v37);

      objc_msgSend(v15, "scalePolicy");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setScalePolicy:", v38);

      objc_msgSend(v28, "setEnableHDR:", v36);
      v39 = objc_alloc_init(MEMORY[0x24BE71C48]);
      v57[0] = MEMORY[0x24BDAC760];
      v57[1] = 3221225472;
      v57[2] = __114__PESerializationUtility_exportCompositionController_forContentEditingOutput_settings_completionQueue_completion___block_invoke_2;
      v57[3] = &unk_24C618888;
      v40 = &v58;
      v41 = (id *)&v59;
      v58 = v14;
      v59 = 0;
      v42 = (id *)&v60;
      v60 = v52;
      v61 = v51;
      objc_msgSend(v39, "exportImageToURL:composition:options:completion:", v23, v21, v28, v57);

      v43 = 0;
      goto LABEL_24;
    }
    v23 = (void *)objc_opt_new();
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6C3E8]), "initWithLevel:", 0);
    objc_msgSend(v23, "setPriority:", v24);

    objc_msgSend(v14, "renderedContentURL");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setPrimaryURL:", v25);

    objc_msgSend(v14, "renderedVideoComplementContentURL");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setVideoComplementURL:", v26);

    objc_msgSend(v14, "renderedVideoPosterURL");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setVideoPosterFrameURL:", v27);

    objc_msgSend(v23, "setApplyVideoOrientationAsMetadata:", objc_msgSend(v15, "applyVideoOrientationAsMetadata"));
    objc_msgSend(v13, "autoLoopAdjustmentController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v28, "enabled")
      || (objc_msgSend(v28, "flavor"),
          v29 = (void *)objc_claimAutoreleasedReturnValue(),
          PIAutoLoopFlavorFromString(),
          v30 = PIAutoLoopFlavorProducesOnlyVideo(),
          v29,
          !v30))
    {
LABEL_23:
      v39 = objc_alloc_init(MEMORY[0x24BE71C48]);
      v53[0] = MEMORY[0x24BDAC760];
      v53[1] = 3221225472;
      v53[2] = __114__PESerializationUtility_exportCompositionController_forContentEditingOutput_settings_completionQueue_completion___block_invoke_4;
      v53[3] = &unk_24C618990;
      v40 = &v54;
      v41 = (id *)&v55;
      v54 = v14;
      v55 = 0;
      v42 = &v56;
      v56 = v51;
      objc_msgSend(v39, "exportComposition:options:completionQueue:completion:", v21, v23, v52, v53);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:

      v15 = v50;
      v17 = v51;
      v16 = v52;
      goto LABEL_25;
    }
    v31 = (void *)MEMORY[0x24BE72468];
    objc_msgSend(v14, "renderedVideoPosterURL");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "pathExtension");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "typeWithFilenameExtension:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v34, "conformsToType:", *MEMORY[0x24BDF8438]) & 1) != 0)
    {
      v35 = (_QWORD *)MEMORY[0x24BDB2298];
    }
    else
    {
      if (!objc_msgSend(v34, "conformsToType:", *MEMORY[0x24BDF83E8]))
      {
LABEL_22:

        goto LABEL_23;
      }
      v35 = (_QWORD *)MEMORY[0x24BDB22A0];
    }
    objc_msgSend(v23, "setVideoCodecType:", *v35);
    goto LABEL_22;
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __114__PESerializationUtility_exportCompositionController_forContentEditingOutput_settings_completionQueue_completion___block_invoke;
  block[3] = &unk_24C618E88;
  v63 = v17;
  dispatch_async(v16, block);
  v43 = 0;
  v21 = v63;
LABEL_25:

  return v43;
}

+ (int64_t)_playbackStyleForAutoLoopController:(id)a3
{
  id v3;
  void *v4;
  int64_t v5;

  v3 = a3;
  if (objc_msgSend(v3, "enabled"))
  {
    objc_msgSend(v3, "flavor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PIAutoLoopFlavorFromString();

    if (PIAutoLoopFlavorProducesOnlyVideo())
      v5 = 5;
    else
      v5 = 3;
  }
  else
  {
    v5 = 3;
  }

  return v5;
}

+ (unsigned)_playbackVariationForAutoLoopController:(id)a3
{
  id v3;
  void *v4;
  unsigned __int16 v5;

  v3 = a3;
  if (objc_msgSend(v3, "enabled"))
  {
    objc_msgSend(v3, "flavor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = PIAutoLoopFlavorFromString();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __114__PESerializationUtility_exportCompositionController_forContentEditingOutput_settings_completionQueue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __114__PESerializationUtility_exportCompositionController_forContentEditingOutput_settings_completionQueue_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  BOOL v11;
  id v12;

  v12 = 0;
  objc_msgSend(a2, "result:", &v12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v12;
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "setAdjustmentSecondaryDataURL:", *(_QWORD *)(a1 + 40));
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __114__PESerializationUtility_exportCompositionController_forContentEditingOutput_settings_completionQueue_completion___block_invoke_3;
  v8[3] = &unk_24C618860;
  v5 = *(NSObject **)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  v11 = v3 != 0;
  v9 = v4;
  v10 = v6;
  v7 = v4;
  dispatch_async(v5, v8);

}

void __114__PESerializationUtility_exportCompositionController_forContentEditingOutput_settings_completionQueue_completion___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v5 = 0;
  objc_msgSend(a2, "result:", &v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v5;
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "setAdjustmentSecondaryDataURL:", *(_QWORD *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __114__PESerializationUtility_exportCompositionController_forContentEditingOutput_settings_completionQueue_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __90__PESerializationUtility_compositionControllerForContentEditingInput_asShot_source_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  float v7;
  CMTime v8;
  CMTimeRange range;
  CMTime v10;
  __int128 v11;
  CMTimeEpoch epoch;
  CMTimeRange v13;

  v2 = (void *)MEMORY[0x24BE72470];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "audiovisualAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultSlowMotionAdjustmentsForAsset:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  memset(&v13, 0, sizeof(v13));
  if (v6)
    objc_msgSend(v6, "slowMotionTimeRange");
  v11 = *(_OWORD *)&v13.start.value;
  epoch = v13.start.epoch;
  objc_msgSend(v4, "setStartTime:", &v11);
  range = v13;
  CMTimeRangeGetEnd(&v10, &range);
  v8 = v10;
  objc_msgSend(v4, "setEndTime:", &v8);
  objc_msgSend(v6, "slowMotionRate");
  objc_msgSend(v4, "setRate:", v7);

}

uint64_t __90__PESerializationUtility_compositionControllerForContentEditingInput_asShot_source_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFocusRect:", *(_QWORD *)(a1 + 32));
}

void __90__PESerializationUtility_compositionControllerForContentEditingInput_asShot_source_error___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v13 = 0;
  objc_msgSend(a2, "result:", &v13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v13;
  if (v4)
  {
    PLPhotoEditGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "localizedDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v6;
      _os_log_impl(&dword_20D13D000, v5, OS_LOG_TYPE_ERROR, "PESerializationUtility error while running semantic style autocalc: %@", buf, 0xCu);

    }
    goto LABEL_7;
  }
  if (v3)
  {
    objc_msgSend(v3, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      v9 = *(void **)(a1 + 32);
      v10 = *MEMORY[0x24BE71E78];
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __90__PESerializationUtility_compositionControllerForContentEditingInput_asShot_source_error___block_invoke_4;
      v11[3] = &unk_24C6187E8;
      v12 = v3;
      objc_msgSend(v9, "modifyAdjustmentWithKey:modificationBlock:", v10, v11);
      v5 = v12;
LABEL_7:

    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __90__PESerializationUtility_compositionControllerForContentEditingInput_asShot_source_error___block_invoke_75(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = (void *)MEMORY[0x24BE71CC8];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "rawAdjustmentWithRawImageProperties:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFromAdjustment:", v5);

}

uint64_t __90__PESerializationUtility_compositionControllerForContentEditingInput_asShot_source_error___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateWithSemStyleInfo:", *(_QWORD *)(a1 + 32));
}

@end
