@implementation PICompositionExporter

- (PICompositionExporter)init
{
  objc_super v4;

  if (init_onceToken != -1)
    dispatch_once(&init_onceToken, &__block_literal_global_5945);
  v4.receiver = self;
  v4.super_class = (Class)PICompositionExporter;
  return -[PICompositionExporter init](&v4, sel_init);
}

- (void)exportImageToURL:(id)a3 composition:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  PICompositionExporter *v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __73__PICompositionExporter_exportImageToURL_composition_options_completion___block_invoke;
  v18[3] = &unk_1E5016530;
  v22 = v11;
  v23 = v13;
  v19 = v10;
  v20 = v12;
  v21 = self;
  v14 = v11;
  v15 = v12;
  v16 = v13;
  v17 = v10;
  -[PICompositionExporter prepareImageExportRequest:options:completion:](self, "prepareImageExportRequest:options:completion:", v14, v15, v18);

}

- (void)exportImageToDataWithComposition:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __77__PICompositionExporter_exportImageToDataWithComposition_options_completion___block_invoke;
  v12[3] = &unk_1E5019E90;
  v13 = v8;
  v14 = v9;
  v10 = v8;
  v11 = v9;
  -[PICompositionExporter prepareImageExportRequest:options:completion:](self, "prepareImageExportRequest:options:completion:", a3, v10, v12);

}

- (id)exportVideoToURL:(id)a3 composition:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void (**v24)(_QWORD, _QWORD);
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  id v32;
  PICompositionExporter *v34;
  id v35;
  id v36;
  id v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *))a6;
  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 100);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52330]), "initWithComposition:", v11);
  objc_msgSend(v15, "setName:", CFSTR("PICompositionExporter-videoProperties"));
  objc_msgSend(v12, "priority");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPriority:", v16);

  v37 = 0;
  objc_msgSend(v15, "submitSynchronous:", &v37);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v37;
  objc_msgSend(v17, "properties");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v35 = v10;
    objc_msgSend(v19, "metadata");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v18;
    v34 = self;
    -[PICompositionExporter addVideoProperties:composition:options:error:](self, "addVideoProperties:composition:options:error:", v20, v11, v12, &v36);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v36;

    objc_msgSend(v12, "metadataProcessor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v12, "metadataProcessor");
      v24 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v24)[2](v24, v21);
      v25 = objc_claimAutoreleasedReturnValue();

      v21 = (void *)v25;
    }
    if (v21)
    {
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52368]), "initWithProperties:", v19);
      objc_msgSend(v26, "setMetadata:", v21);
      -[PICompositionExporter _exportVideoToURL:composition:options:properties:progress:completion:](v34, "_exportVideoToURL:composition:options:properties:progress:completion:", v35, v11, v12, v26, v14, v13);
      v27 = v14;

      v10 = v35;
      v18 = v22;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to prepare video metadata"), v19, v22);
      v18 = (id)objc_claimAutoreleasedReturnValue();

      if (*MEMORY[0x1E0D52390] != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_423);
      v10 = v35;
      v30 = *MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v39 = v35;
        v40 = 2112;
        v41 = v18;
        _os_log_error_impl(&dword_1A6382000, v30, OS_LOG_TYPE_ERROR, "Error exporting video to '%@': %@", buf, 0x16u);
      }
      v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithError:", v18);
      v13[2](v13, v31);

      v32 = v14;
    }

  }
  else
  {
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithError:", v18);
    v13[2](v13, v28);

    v29 = v14;
  }

  return v14;
}

- (id)exportComposition:(id)a3 toPrimaryURL:(id)a4 videoComplementURL:(id)a5 videoPosterFrameURL:(id)a6 priority:(id)a7 completionQueue:(id)a8 completion:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  PICompositionExporterAuxiliaryOptions *v22;
  void *v23;

  v15 = a3;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = objc_alloc_init(PICompositionExporterAuxiliaryOptions);
  -[PICompositionExporterAuxiliaryOptions setPrimaryURL:](v22, "setPrimaryURL:", v21);

  -[PICompositionExporterAuxiliaryOptions setVideoComplementURL:](v22, "setVideoComplementURL:", v20);
  -[PICompositionExporterAuxiliaryOptions setVideoPosterFrameURL:](v22, "setVideoPosterFrameURL:", v19);

  if (v16)
    -[PICompositionExporterOptions setPriority:](v22, "setPriority:", v16);
  -[PICompositionExporter exportComposition:options:completionQueue:completion:](self, "exportComposition:options:completionQueue:completion:", v15, v22, v17, v18);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)exportComposition:(id)a3 options:(id)a4 completionQueue:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  char isKindOfClass;
  unsigned __int8 v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id *v28;
  PICompositionExporterVideoOptions *v29;
  void *v30;
  id *v31;
  id v32;
  void *v33;
  PICompositionExporterImageOptions *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  uint64_t v47;
  NSObject *v48;
  PICompositionExporterImageOptions *v49;
  void *v50;
  NSObject *v51;
  uint64_t v53;
  void *v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void *v56;
  void *v57;
  uint64_t v58;
  NSObject *queue;
  unsigned int v61;
  void (**v62)(id, PICompositionExporterVideoOptions *);
  void *v63;
  void *v64;
  uint64_t v65;
  _QWORD block[4];
  void (**v67)(id, PICompositionExporterVideoOptions *);
  _BYTE *v68;
  _QWORD *v69;
  _QWORD *v70;
  _QWORD *v71;
  _QWORD *v72;
  _QWORD *v73;
  _QWORD *v74;
  _QWORD *v75;
  _BYTE *v76;
  _QWORD *v77;
  uint8_t v78[16];
  _QWORD v79[5];
  id v80;
  _QWORD v81[5];
  id v82;
  _QWORD v83[5];
  id v84;
  _QWORD v85[4];
  NSObject *v86;
  _QWORD *v87;
  _QWORD v88[4];
  NSObject *v89;
  _QWORD *v90;
  _QWORD *v91;
  _QWORD *v92;
  _QWORD v93[4];
  NSObject *v94;
  _QWORD *v95;
  _QWORD v96[4];
  NSObject *v97;
  _BYTE *v98;
  _QWORD *v99;
  _QWORD *v100;
  _QWORD v101[4];
  __int128 v102;
  _QWORD v103[5];
  id v104;
  _QWORD v105[5];
  id v106;
  _QWORD v107[5];
  id v108;
  _QWORD v109[5];
  id v110;
  _BYTE buf[24];
  uint64_t (*v112)(uint64_t, uint64_t);
  __int128 v113;
  _BYTE v114[24];
  uint64_t (*v115)(uint64_t, uint64_t);
  void (*v116)(uint64_t);
  id v117;
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  queue = a5;
  v62 = (void (**)(id, PICompositionExporterVideoOptions *))a6;
  v64 = v9;
  v11 = objc_msgSend(v9, "mediaType");
  if (v11 < 2)
  {
LABEL_6:
    v58 = 0;
    v61 = 0;
    v63 = 0;
    v14 = 1;
    goto LABEL_12;
  }
  if (v11 == 2)
  {
    objc_msgSend(v10, "videoPosterFrameURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("videoPosterFrame"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v58) = v16 != 0;

    }
    else
    {
      LODWORD(v58) = 0;
    }

    v14 = 0;
    v61 = 0;
    v63 = 0;
    HIDWORD(v58) = 1;
  }
  else
  {
    if (v11 == 3)
    {
      objc_msgSend(v10, "videoComplementURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "UUIDString");
        v63 = (void *)objc_claimAutoreleasedReturnValue();

        v58 = 0;
        v14 = 1;
        v61 = 1;
        goto LABEL_12;
      }
      goto LABEL_6;
    }
    v58 = 0;
    v14 = 0;
    v61 = 0;
    v63 = 0;
  }
LABEL_12:
  objc_msgSend(v10, "imageExportFormat");
  v65 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "videoCodecType");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (id)v17;
  if (!v61)
  {
    v19 = (id)v65;
    if (HIDWORD(v58) && !v17 || v65 | v17)
      goto LABEL_49;
    v65 = 0;
    v18 = 0;
    goto LABEL_28;
  }
  v19 = (id)v65;
  if (v65 && v17)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    objc_opt_class();
    v21 = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0 && v18 == (id)*MEMORY[0x1E0C8AE78] || (v21 & (v18 == (id)*MEMORY[0x1E0C8AE70])) != 0)
      goto LABEL_49;
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_423);
    v22 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v114 = 138543618;
      *(_QWORD *)&v114[4] = v18;
      *(_WORD *)&v114[12] = 2114;
      *(_QWORD *)&v114[14] = v65;
      _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "Unexpected Live Photo export format pairing. Video codec (%{public}@) and image export format (%{public}@)", v114, 0x16u);
    }
    objc_msgSend(MEMORY[0x1E0D520A0], "mismatchError:object:", CFSTR("Expecting HEIF/HEVC or JPEG/H264 when exporting Live Photo still and video complement"), 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    if (!v23)
      goto LABEL_48;
LABEL_35:
    v29 = (PICompositionExporterVideoOptions *)objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithError:", v23);
    v62[2](v62, v29);
    v30 = 0;
    goto LABEL_85;
  }
  if (!v65 && v17)
  {
    if (v17 == *MEMORY[0x1E0C8AE78])
    {
      v19 = objc_alloc_init(MEMORY[0x1E0D52150]);
    }
    else
    {
      if (v17 != *MEMORY[0x1E0C8AE70])
      {
        objc_msgSend(MEMORY[0x1E0D520A0], "unsupportedError:object:", CFSTR("Unexpected video codec when attempting to export Live Photo"), v17);
        v23 = (id)objc_claimAutoreleasedReturnValue();
        v65 = 0;
        if (v23)
          goto LABEL_35;
LABEL_48:
        v19 = (id)v65;
        goto LABEL_49;
      }
      v19 = objc_alloc_init(MEMORY[0x1E0D52158]);
      objc_msgSend(v19, "setCompressionQuality:", 0.9);
    }
    goto LABEL_49;
  }
  if (!v65 || v17)
  {
LABEL_28:
    v24 = (void *)MEMORY[0x1E0D752F0];
    objc_msgSend(v10, "primaryURL");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "pathExtension");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "typeWithFilenameExtension:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v27, "conformsToType:", *MEMORY[0x1E0CEC698]))
    {
      v19 = objc_alloc_init(MEMORY[0x1E0D52150]);
      v28 = (id *)MEMORY[0x1E0C8AE78];
    }
    else
    {
      v19 = objc_alloc_init(MEMORY[0x1E0D52158]);
      objc_msgSend(v19, "setCompressionQuality:", 0.9);
      v28 = (id *)MEMORY[0x1E0C8AE70];
    }

    v32 = *v28;
    v18 = v32;
    goto LABEL_49;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v31 = (id *)MEMORY[0x1E0C8AE78];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "unsupportedError:object:", CFSTR("Unexpected image export format when attempting to export Live Photo"), v65);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      v18 = 0;
      if (v23)
        goto LABEL_35;
      goto LABEL_48;
    }
    v31 = (id *)MEMORY[0x1E0C8AE70];
  }
  v18 = *v31;
LABEL_49:
  v65 = (uint64_t)v19;
  v29 = objc_alloc_init(PICompositionExporterVideoOptions);
  -[PICompositionExporterOptions setPairingIdentifier:](v29, "setPairingIdentifier:", v63);
  objc_msgSend(v10, "priority");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[PICompositionExporterOptions setPriority:](v29, "setPriority:", v33);

  -[PICompositionExporterVideoOptions setVideoCodecType:](v29, "setVideoCodecType:", v18);
  -[PICompositionExporterVideoOptions setApplyVideoOrientationAsMetadata:](v29, "setApplyVideoOrientationAsMetadata:", objc_msgSend(v10, "applyVideoOrientationAsMetadata"));
  v34 = objc_alloc_init(PICompositionExporterImageOptions);
  -[PICompositionExporterOptions setPairingIdentifier:](v34, "setPairingIdentifier:", v63);
  objc_msgSend(v10, "priority");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[PICompositionExporterOptions setPriority:](v34, "setPriority:", v35);

  -[PICompositionExporterImageOptions setImageExportFormat:](v34, "setImageExportFormat:", v19);
  -[PICompositionExporterImageOptions setApplyImageOrientationAsMetadata:](v34, "setApplyImageOrientationAsMetadata:", objc_msgSend(v10, "applyImageOrientationAsMetadata"));
  -[PICompositionExporterImageOptions setOptimizeForBackgroundProcessing:](v34, "setOptimizeForBackgroundProcessing:", objc_msgSend(v10, "optimizeForBackgroundProcessing"));
  objc_msgSend(v10, "auxiliaryImageTypes");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[PICompositionExporterImageOptions setAuxiliaryImageTypes:](v34, "setAuxiliaryImageTypes:", v36);

  if ((_DWORD)v14)
    -[PICompositionExporterImageOptions setEnableHDR:](v34, "setEnableHDR:", 1);
  v37 = dispatch_group_create();
  *(_QWORD *)v114 = 0;
  *(_QWORD *)&v114[8] = v114;
  *(_QWORD *)&v114[16] = 0x3032000000;
  v115 = __Block_byref_object_copy__5926;
  v116 = __Block_byref_object_dispose__5927;
  v117 = 0;
  v109[0] = 0;
  v109[1] = v109;
  v109[2] = 0x3032000000;
  v109[3] = __Block_byref_object_copy__5926;
  v109[4] = __Block_byref_object_dispose__5927;
  v110 = 0;
  v107[0] = 0;
  v107[1] = v107;
  v107[2] = 0x3032000000;
  v107[3] = __Block_byref_object_copy__5926;
  v107[4] = __Block_byref_object_dispose__5927;
  v108 = 0;
  v105[0] = 0;
  v105[1] = v105;
  v105[2] = 0x3032000000;
  v105[3] = __Block_byref_object_copy__5926;
  v105[4] = __Block_byref_object_dispose__5927;
  v106 = 0;
  v103[0] = 0;
  v103[1] = v103;
  v103[2] = 0x3032000000;
  v103[3] = __Block_byref_object_copy__5926;
  v103[4] = __Block_byref_object_dispose__5927;
  v104 = 0;
  v101[0] = 0;
  v101[1] = v101;
  v101[2] = 0x3010000000;
  v101[3] = "";
  v102 = *MEMORY[0x1E0D51F08];
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_423);
  v38 = (id)*MEMORY[0x1E0D52398];
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v14);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v61);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", HIDWORD(v58));
    v55 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v58);
    v53 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = v57;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v56;
    *(_WORD *)&buf[22] = 2114;
    v112 = v55;
    LOWORD(v113) = 2114;
    *(_QWORD *)((char *)&v113 + 2) = v53;
    v54 = (void *)v53;
    _os_log_debug_impl(&dword_1A6382000, v38, OS_LOG_TYPE_DEBUG, "Export Composition: exportImage: %{public}@ / exportVideoComplement: %{public}@ / exportVideo: %{public}@ / exportVideoPosterFrame: %{public}@", buf, 0x2Au);

  }
  if ((_DWORD)v14)
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_423);
    v39 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1A6382000, v39, OS_LOG_TYPE_DEBUG, "Export Composition: exporting image", buf, 2u);
    }
    dispatch_group_enter(v37);
    objc_msgSend(v10, "primaryURL");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v96[0] = MEMORY[0x1E0C809B0];
    v96[1] = 3221225472;
    v96[2] = __78__PICompositionExporter_exportComposition_options_completionQueue_completion___block_invoke;
    v96[3] = &unk_1E5016558;
    v98 = v114;
    v99 = v103;
    v100 = v101;
    v97 = v37;
    -[PICompositionExporter exportImageToURL:composition:options:completion:](self, "exportImageToURL:composition:options:completion:", v40, v64, v34, v96);

  }
  if (v61)
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_423);
    v41 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1A6382000, v41, OS_LOG_TYPE_DEBUG, "Export Composition: exporting video complement", buf, 2u);
    }
    dispatch_group_enter(v37);
    objc_msgSend(v10, "videoCodecType");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[PICompositionExporterVideoOptions setVideoCodecType:](v29, "setVideoCodecType:", v42);

    objc_msgSend(v10, "videoComplementURL");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v93[0] = MEMORY[0x1E0C809B0];
    v93[1] = 3221225472;
    v93[2] = __78__PICompositionExporter_exportComposition_options_completionQueue_completion___block_invoke_352;
    v93[3] = &unk_1E5016580;
    v95 = v109;
    v94 = v37;
    -[PICompositionExporter exportVideoToURL:composition:options:completion:](self, "exportVideoToURL:composition:options:completion:", v43, v64, v29, v93);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v44 = 0;
  }
  if (HIDWORD(v58))
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_423);
    v45 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1A6382000, v45, OS_LOG_TYPE_DEBUG, "Export Composition: exporting video", buf, 2u);
    }
    dispatch_group_enter(v37);
    -[PICompositionExporterVideoOptions setBypassOutputSettingsIfNoComposition:](v29, "setBypassOutputSettingsIfNoComposition:", 1);
    objc_msgSend(v10, "primaryURL");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v88[0] = MEMORY[0x1E0C809B0];
    v88[1] = 3221225472;
    v88[2] = __78__PICompositionExporter_exportComposition_options_completionQueue_completion___block_invoke_353;
    v88[3] = &unk_1E5016558;
    v90 = v107;
    v91 = v103;
    v92 = v101;
    v89 = v37;
    -[PICompositionExporter exportVideoToURL:composition:options:completion:](self, "exportVideoToURL:composition:options:completion:", v46, v64, v29, v88);
    v47 = objc_claimAutoreleasedReturnValue();

    v44 = (void *)v47;
  }
  if ((_DWORD)v58)
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_423);
    v48 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1A6382000, v48, OS_LOG_TYPE_DEBUG, "Export Composition: exporting video poster frame", buf, 2u);
    }
    v49 = objc_alloc_init(PICompositionExporterImageOptions);
    dispatch_group_enter(v37);
    objc_msgSend(v10, "videoPosterFrameURL");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v85[0] = MEMORY[0x1E0C809B0];
    v85[1] = 3221225472;
    v85[2] = __78__PICompositionExporter_exportComposition_options_completionQueue_completion___block_invoke_354;
    v85[3] = &unk_1E5016580;
    v87 = v105;
    v86 = v37;
    -[PICompositionExporter exportImageToURL:composition:options:completion:](self, "exportImageToURL:composition:options:completion:", v50, v64, v49, v85);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v112 = __Block_byref_object_copy__5926;
  *(_QWORD *)&v113 = __Block_byref_object_dispose__5927;
  *((_QWORD *)&v113 + 1) = 0;
  v83[0] = 0;
  v83[1] = v83;
  v83[2] = 0x3032000000;
  v83[3] = __Block_byref_object_copy__5926;
  v83[4] = __Block_byref_object_dispose__5927;
  v84 = 0;
  v81[0] = 0;
  v81[1] = v81;
  v81[2] = 0x3032000000;
  v81[3] = __Block_byref_object_copy__5926;
  v81[4] = __Block_byref_object_dispose__5927;
  v82 = 0;
  v79[0] = 0;
  v79[1] = v79;
  v79[2] = 0x3032000000;
  v79[3] = __Block_byref_object_copy__5926;
  v79[4] = __Block_byref_object_dispose__5927;
  v80 = 0;
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_423);
  v51 = *MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v78 = 0;
    _os_log_debug_impl(&dword_1A6382000, v51, OS_LOG_TYPE_DEBUG, "Export Composition: waiting on notify", v78, 2u);
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__PICompositionExporter_exportComposition_options_completionQueue_completion___block_invoke_355;
  block[3] = &unk_1E50165A8;
  v68 = v114;
  v69 = v109;
  v70 = v107;
  v71 = v105;
  v72 = v81;
  v73 = v79;
  v67 = v62;
  v74 = v103;
  v75 = v101;
  v76 = buf;
  v77 = v83;
  dispatch_group_notify(v37, queue, block);
  v23 = v44;

  _Block_object_dispose(v79, 8);
  _Block_object_dispose(v81, 8);

  _Block_object_dispose(v83, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(v101, 8);
  _Block_object_dispose(v103, 8);

  _Block_object_dispose(v105, 8);
  _Block_object_dispose(v107, 8);

  _Block_object_dispose(v109, 8);
  _Block_object_dispose(v114, 8);

  v30 = v23;
LABEL_85:

  return v30;
}

- (id)variationForFlavor:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = variationForFlavor__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&variationForFlavor__onceToken, &__block_literal_global_357);
  objc_msgSend((id)variationForFlavor__map, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)prepareImageExportRequest:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __70__PICompositionExporter_prepareImageExportRequest_options_completion___block_invoke;
  v14[3] = &unk_1E5019080;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v9;
  v12 = v8;
  v13 = v10;
  -[PICompositionExporter prepareAuxiliaryImagesFetchProperties:options:completion:](self, "prepareAuxiliaryImagesFetchProperties:options:completion:", v12, v11, v14);

}

- (void)prepareAuxiliaryImagesFetchProperties:(id)a3 options:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  objc_class *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v7 = a4;
  v8 = a5;
  v9 = (objc_class *)MEMORY[0x1E0D51FF8];
  v10 = a3;
  v11 = (void *)objc_msgSend([v9 alloc], "initWithComposition:", v10);

  objc_msgSend(v11, "setName:", CFSTR("PICompositionExporter-auxPropertiesRequest"));
  objc_msgSend(v7, "priority");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPriority:", v12);

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __82__PICompositionExporter_prepareAuxiliaryImagesFetchProperties_options_completion___block_invoke;
  v16[3] = &unk_1E5019368;
  v18 = v11;
  v19 = v8;
  v17 = v7;
  v13 = v11;
  v14 = v7;
  v15 = v8;
  objc_msgSend(v13, "submit:", v16);

}

- (id)addImageProperties:(id)a3 composition:(id)a4 options:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  PICompositionController *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  int v32;
  _BOOL4 v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  unint64_t v37;
  void *v38;
  void *v39;
  int v40;
  uint64_t v41;
  void *v42;
  int v43;
  uint64_t v44;
  int v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  char v70;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = -[PICompositionController initWithComposition:]([PICompositionController alloc], "initWithComposition:", v10);
  v13 = (void *)objc_msgSend(v9, "mutableCopy");
  objc_msgSend(v11, "pairingIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v11, "pairingIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PIMakerNoteUtilities addAssetIdentifier:toMetadataDictionary:](PIMakerNoteUtilities, "addAssetIdentifier:toMetadataDictionary:", v15, v13);

  }
  -[PICompositionController autoLoopAdjustmentController](v12, "autoLoopAdjustmentController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v16, "enabled"))
    goto LABEL_6;
  objc_msgSend(v16, "flavor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("LongExposure"));

  if (!v18
    || (objc_msgSend((id)objc_opt_class(), "metadataConverter"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        -[PICompositionExporter variationForFlavor:](self, "variationForFlavor:", CFSTR("LongExposure")),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v21 = objc_msgSend(v19, "setImageVariation:properties:error:", v20, v13, a6),
        v20,
        v19,
        v21))
  {
LABEL_6:
    objc_msgSend((id)objc_opt_class(), "metadataConverter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "photoProcessingFlagsFromProperties:error:", v9, a6);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
    {
      v26 = 0;
LABEL_53:

      goto LABEL_54;
    }
    -[PICompositionController depthAdjustmentController](v12, "depthAdjustmentController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "integerValue"))
      v25 = 1;
    else
      v25 = objc_msgSend(v24, "enabled");
    -[PICompositionController semanticEnhanceAdjustmentController](v12, "semanticEnhanceAdjustmentController");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v68, "enabled");
    v65 = v10;
    v66 = v11;
    v67 = v24;
    if ((v25 & 1) == 0 && !v27)
      goto LABEL_36;
    v28 = objc_msgSend(v23, "integerValue");
    if (objc_msgSend(v24, "enabled"))
      v29 = v28 | 0x40;
    else
      v29 = v28 & 0xFFFFFFBF;
    -[PICompositionController livePhotoKeyFrameAdjustmentController](v12, "livePhotoKeyFrameAdjustmentController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v30 && (objc_msgSend(v30, "keyFrameTime"), (v70 & 1) != 0))
    {
      v33 = (v29 & 2) == 0;
    }
    else
    {
      v32 = objc_msgSend(v16, "enabled");
      v33 = (v29 & 2) == 0;
      if (!v32)
      {
        v63 = 0;
        v34 = v29;
        goto LABEL_23;
      }
    }
    v34 = v29 & 0xFFFFFFFD;
    v63 = 1;
LABEL_23:
    if (!v33)
      v29 = v34;
    v35 = objc_msgSend(v68, "enabled");
    v36 = 0x8000;
    if (!v35)
      v36 = 0;
    v37 = v29 & 0xFFFFFFFFFFFF7FFFLL | v36;
    objc_msgSend((id)objc_opt_class(), "metadataConverter");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v38, "setPhotoProcessingFlags:properties:error:", v39, v13, a6);

    if (!v40)
    {
      v26 = 0;
      v10 = v65;
      v11 = v66;
      goto LABEL_52;
    }
    v41 = *MEMORY[0x1E0CBCB50];
    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCB50]);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)objc_msgSend(v61, "mutableCopy");
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v42, v41);
    v43 = objc_msgSend(v67, "enabled");
    v44 = *MEMORY[0x1E0CBCB30];
    if (v43)
    {
      objc_msgSend(v42, "setObject:forKeyedSubscript:", &unk_1E5051280, *MEMORY[0x1E0CBCB30]);
      v10 = v65;
      v11 = v66;
LABEL_35:

LABEL_36:
      objc_msgSend((id)objc_opt_class(), "metadataConverter");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "photoFeatureFlags:error:", v9, a6);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        -[PICompositionController portraitAdjustmentController](v12, "portraitAdjustmentController");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v31, "intValue")
          && ((objc_msgSend(v64, "enabled") & 1) != 0 || objc_msgSend(v67, "enabled")))
        {
          v47 = objc_msgSend(v31, "unsignedIntegerValue") & 0xFFFFFFFELL;
          objc_msgSend((id)objc_opt_class(), "metadataConverter");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v47);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v48, "setPhotoFeatureFlags:properties:error:", v49, v13, a6);

          v11 = v66;
          if (!v50)
          {
            v26 = 0;
            v10 = v65;
            goto LABEL_51;
          }
        }
        if (objc_msgSend(v11, "optimizeForSharing"))
          objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CBC7A0]);
        v10 = v65;
        objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("semanticStyle"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = v51;
        if (v51)
        {
          objc_msgSend(v51, "settings");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          PISemanticStyleMakerNotePropertiesFromSettings(v52);
          v53 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend((id)objc_opt_class(), "metadataConverter");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "addSemanticStyleMakeNoteProperties:toImageProperties:", v53, v13);
        }
        else
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCF70]);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = *MEMORY[0x1E0C89D10];
          objc_msgSend(v53, "objectForKeyedSubscript:", *MEMORY[0x1E0C89D10]);
          v56 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v56)
          {
LABEL_49:

            v26 = (void *)objc_msgSend(v13, "copy");
            v11 = v66;
LABEL_51:

            goto LABEL_52;
          }
          objc_msgSend(v53, "objectForKeyedSubscript:", v55);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = (void *)objc_msgSend(v57, "mutableCopy");

          objc_msgSend(v54, "setObject:forKey:", &unk_1E50512B0, *MEMORY[0x1E0C89D30]);
          objc_msgSend((id)objc_opt_class(), "metadataConverter");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "addSemanticStyleMakeNoteProperties:toImageProperties:", v54, v13);

        }
        goto LABEL_49;
      }
      v26 = 0;
LABEL_52:

      goto LABEL_53;
    }
    objc_msgSend(v42, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCB30]);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (__int16)objc_msgSend(v60, "intValue");
    if ((v45 - 2) >= 3)
    {
      v11 = v66;
      if (v45 != 8)
        goto LABEL_34;
    }
    else
    {
      v11 = v66;
      if (!v63)
      {
LABEL_34:

        v10 = v65;
        goto LABEL_35;
      }
    }
    objc_msgSend(v42, "setObject:forKeyedSubscript:", &unk_1E5051298, v44);
    goto LABEL_34;
  }
  v26 = 0;
LABEL_54:

  return v26;
}

- (id)addVideoProperties:(id)a3 composition:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  PICompositionController *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v28;
  void *v29;
  const void **v30;
  void *specific;
  NSObject *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!a6)
  {
    NUAssertLogger_5916();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v29;
      _os_log_error_impl(&dword_1A6382000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v30 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_5916();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v33)
      {
        v36 = dispatch_get_specific(*v30);
        v37 = (void *)MEMORY[0x1E0CB3978];
        v38 = v36;
        objc_msgSend(v37, "callStackSymbols");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "componentsJoinedByString:", CFSTR("\n"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v43 = v36;
        v44 = 2114;
        v45 = v40;
        _os_log_error_impl(&dword_1A6382000, v32, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v33)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "componentsJoinedByString:", CFSTR("\n"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v35;
      _os_log_error_impl(&dword_1A6382000, v32, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v13 = v12;
  v14 = -[PICompositionController initWithComposition:]([PICompositionController alloc], "initWithComposition:", v11);
  -[PICompositionController autoLoopAdjustmentController](v14, "autoLoopAdjustmentController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v10;
  if ((objc_msgSend(v15, "enabled") & 1) != 0)
  {
    objc_msgSend(v15, "recipe");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v10, "mutableCopy");
    if (v16)
    {
      +[PIMakerNoteUtilities removeAssetIdentifierFromMetadataArray:](PIMakerNoteUtilities, "removeAssetIdentifierFromMetadataArray:", v17);

      v18 = 0;
      goto LABEL_7;
    }
  }
  else
  {
    v17 = (void *)objc_msgSend(v10, "mutableCopy");
  }
  v18 = 1;
LABEL_7:
  objc_msgSend(v13, "pairingIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v13, "pairingIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[PIMakerNoteUtilities addAssetIdentifier:toMetadataArray:](PIMakerNoteUtilities, "addAssetIdentifier:toMetadataArray:", v20, v17);

  }
  if ((v18 & 1) == 0)
  {
    objc_msgSend(v15, "flavor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PICompositionExporter variationForFlavor:](self, "variationForFlavor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      v25 = (void *)MEMORY[0x1E0D520A0];
      objc_msgSend(v15, "flavor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "invalidError:object:", CFSTR("Unknown autoloop flavor"), v26);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

      v24 = 0;
      goto LABEL_16;
    }
    objc_msgSend((id)objc_opt_class(), "metadataConverter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "videoMetadataForVariation:error:", v22, a6);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
    {

      goto LABEL_16;
    }
    objc_msgSend(v17, "addObjectsFromArray:", v24);

  }
  v24 = (void *)objc_msgSend(v17, "copy");
LABEL_16:

  return v24;
}

- (void)_exportVideoToURL:(id)a3 composition:(id)a4 options:(id)a5 properties:(id)a6 progress:(id)a7 completion:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  objc_class *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  PICompositionController *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  NSObject *v34;
  const char *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  uint8_t buf[16];

  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = a8;
  v17 = (objc_class *)MEMORY[0x1E0D52320];
  v18 = a6;
  v19 = a3;
  v20 = (void *)objc_msgSend([v17 alloc], "initWithComposition:destinationURL:", v13, v19);

  objc_msgSend(v20, "setName:", CFSTR("PICompositionExporter-video"));
  objc_msgSend(v14, "priority");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setPriority:", v21);

  objc_msgSend(v14, "scalePolicy");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setScalePolicy:", v22);

  objc_msgSend(v20, "setRequireHardwareEncoder:", objc_msgSend(v14, "requireHardwareEncoder"));
  objc_msgSend(v18, "metadata");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "setMetadata:", v23);
  objc_msgSend(v20, "setIncludeCinematicVideoTracks:", objc_msgSend(v14, "includeCinematicVideoTracks"));
  objc_msgSend(v20, "setComputeDigest:", objc_msgSend(v14, "computeDigest"));
  v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!objc_msgSend(v14, "applyVideoOrientationAsMetadata"))
  {
    v29 = 0;
    goto LABEL_25;
  }
  v25 = -[PICompositionController initWithComposition:]([PICompositionController alloc], "initWithComposition:", v13);
  -[PICompositionController autoLoopAdjustmentController](v25, "autoLoopAdjustmentController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v26, "enabled"))
  {
    objc_msgSend(v26, "flavor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("Mirror"));

  }
  else
  {
    v28 = 0;
  }
  v42 = v15;
  if (objc_msgSend(v26, "enabled"))
  {
    objc_msgSend(v26, "flavor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("AutoLoop"));

  }
  else
  {
    v31 = 0;
  }
  -[PICompositionController orientationAdjustmentController](v25, "orientationAdjustmentController", v42);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v32)
    objc_msgSend(v32, "orientation");
  if ((v28 | v31) == 1)
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_423);
    v34 = *MEMORY[0x1E0D52398];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_INFO))
      goto LABEL_22;
    *(_WORD *)buf = 0;
    v35 = "Skipping applyVideoOrientationAsMetadata. Bounces and Autoloops are not supported. Falling back to burned-in orientation.";
    goto LABEL_21;
  }
  if (!NUOrientationHasFlip())
  {
    v29 = 1;
    goto LABEL_24;
  }
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_423);
  v34 = *MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    v35 = "Skipping applyVideoOrientationAsMetadata. Flipped orientations are not supported. Falling back to burned-in orientation.";
LABEL_21:
    _os_log_impl(&dword_1A6382000, v34, OS_LOG_TYPE_INFO, v35, buf, 2u);
  }
LABEL_22:
  v29 = 0;
LABEL_24:

  v15 = v43;
LABEL_25:
  objc_msgSend(v20, "setApplyOrientationAsMetadata:", v29);
  objc_msgSend(v20, "setPipelineFilters:", v24);
  objc_msgSend(v20, "setBypassOutputSettingsIfNoComposition:", objc_msgSend(v14, "bypassOutputSettingsIfNoComposition"));
  objc_msgSend(v20, "outputSettings");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(v36, "mutableCopy");

  objc_msgSend(v14, "videoCodecType");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
    objc_msgSend(v37, "setObject:forKey:", v38, *MEMORY[0x1E0C8AE68]);
  objc_msgSend(v20, "setOutputSettings:", v37);
  if (objc_msgSend(v14, "preserveSourceColorSpace"))
  {
    objc_msgSend(v20, "setColorSpace:", 0);
  }
  else
  {
    objc_msgSend(v14, "colorSpace");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
    {
      objc_msgSend(v14, "colorSpace");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setColorSpace:", v40);

    }
  }
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __94__PICompositionExporter__exportVideoToURL_composition_options_properties_progress_completion___block_invoke;
  v44[3] = &unk_1E5019A68;
  v45 = v16;
  v41 = v16;
  objc_msgSend(v20, "submitWithProgress:completion:", v15, v44);

}

void __94__PICompositionExporter__exportVideoToURL_composition_options_properties_progress_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  PICompositionExportResult *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  objc_msgSend(a2, "result:", &v13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v13;
  if (v3)
  {
    v5 = objc_alloc_init(PICompositionExportResult);
    objc_msgSend(v3, "geometry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PICompositionExportResult setGeometry:](v5, "setGeometry:", v6);

    objc_msgSend(v3, "digest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PICompositionExportResult setDigest:](v5, "setDigest:", v7);

    objc_msgSend(v3, "destinationURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PICompositionExportResult setExportedFileURL:](v5, "setExportedFileURL:", v8);

    v9 = *(_QWORD *)(a1 + 32);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithResult:", v5);
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

  }
  else
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_423);
    v11 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v4;
      _os_log_error_impl(&dword_1A6382000, v11, OS_LOG_TYPE_ERROR, "Failed to export video: %@", buf, 0xCu);
    }
    v12 = *(_QWORD *)(a1 + 32);
    v5 = (PICompositionExportResult *)objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithError:", v4);
    (*(void (**)(uint64_t, PICompositionExportResult *))(v12 + 16))(v12, v5);
  }

}

void __82__PICompositionExporter_prepareAuxiliaryImagesFetchProperties_options_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  PICompositionExportAuxiliaryResult *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  dispatch_queue_t v33;
  void *v34;
  id v35;
  PICompositionExportAuxiliaryResult *v36;
  id v37;
  void *v38;
  uint64_t v39;
  id obj;
  _QWORD v41[4];
  PICompositionExportAuxiliaryResult *v42;
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  id v52;
  void *v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v52 = 0;
  objc_msgSend(a2, "result:", &v52);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v52;
  if (v3)
  {
    v5 = objc_alloc_init(PICompositionExportAuxiliaryResult);
    objc_msgSend(v3, "properties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PICompositionExportAuxiliaryResult setProperties:](v5, "setProperties:", v6);

    objc_msgSend(v3, "properties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "size");
    -[PICompositionExportResult setInputSize:](v5, "setInputSize:", v8, v9);

    if (objc_msgSend(v3, "canPropagateOriginalAuxiliaryData"))
    {
      v10 = *(_QWORD *)(a1 + 48);
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithResult:", v5);
      (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
    }
    else
    {
      v36 = v5;
      v37 = v4;
      objc_msgSend(MEMORY[0x1E0D52290], "begin");
      v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v38 = v3;
      objc_msgSend(v3, "properties");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "auxiliaryImageTypes");
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
      v15 = MEMORY[0x1E0C809B0];
      if (v14)
      {
        v16 = v14;
        v17 = *(_QWORD *)v49;
        do
        {
          v18 = 0;
          v39 = v16;
          do
          {
            if (*(_QWORD *)v49 != v17)
              objc_enumerationMutation(obj);
            v19 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v18);
            v20 = NUAuxiliaryImageTypeFromString();
            objc_msgSend(v11, "auxiliaryImagePropertiesForType:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            if (v21)
            {
              v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D51FF0]), "initWithRequest:", *(_QWORD *)(a1 + 40));
              objc_msgSend(v22, "setSkipRenderIfNotRequired:", 1);
              objc_msgSend(v22, "setAuxiliaryImageType:", v20);
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PICompositionExporter-%@"), v19);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "setName:", v23);

              if (objc_msgSend(*(id *)(a1 + 32), "optimizeForBackgroundProcessing"))
              {
                objc_msgSend(v22, "setShouldUseLowMemoryMode:", 1);
                objc_msgSend(v22, "setIsOneShot:", 1);
              }
              if (objc_msgSend(*(id *)(a1 + 32), "applyImageOrientationAsMetadata"))
              {
                +[PIPipelineFilters orientationAsMetaDataFilter](PIPipelineFilters, "orientationAsMetaDataFilter");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v53 = v24;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
                v25 = a1;
                v26 = v17;
                v27 = v11;
                v28 = v13;
                v29 = v15;
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "setPipelineFilters:", v30);

                v15 = v29;
                v13 = v28;
                v11 = v27;
                v17 = v26;
                a1 = v25;
                v16 = v39;

              }
              v45[0] = v15;
              v45[1] = 3221225472;
              v45[2] = __82__PICompositionExporter_prepareAuxiliaryImagesFetchProperties_options_completion___block_invoke_2;
              v45[3] = &unk_1E50165D0;
              v46 = v13;
              v47 = v19;
              objc_msgSend(v22, "submit:", v45);

            }
            ++v18;
          }
          while (v16 != v18);
          v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
        }
        while (v16);
      }
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v31 = v15;
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = dispatch_queue_create("PICompositionExporter.imageProperties.transaction", v32);

      v34 = (void *)MEMORY[0x1E0D52290];
      v41[0] = v31;
      v41[1] = 3221225472;
      v41[2] = __82__PICompositionExporter_prepareAuxiliaryImagesFetchProperties_options_completion___block_invoke_378;
      v41[3] = &unk_1E5018E10;
      v5 = v36;
      v42 = v36;
      v43 = v13;
      v44 = *(id *)(a1 + 48);
      v35 = v13;
      objc_msgSend(v34, "commitAndNotifyOnQueue:withBlock:", v33, v41);

      v4 = v37;
      v3 = v38;
    }

  }
  else
  {
    v12 = *(_QWORD *)(a1 + 48);
    v5 = (PICompositionExportAuxiliaryResult *)objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithError:", v4);
    (*(void (**)(uint64_t, PICompositionExportAuxiliaryResult *))(v12 + 16))(v12, v5);
  }

}

void __82__PICompositionExporter_prepareAuxiliaryImagesFetchProperties_options_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  objc_msgSend(a2, "result:", &v13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v13;
  v5 = v4;
  if (v3)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v3, "auxiliaryImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v7, *(_QWORD *)(a1 + 40));

  }
  else
  {
    v8 = objc_msgSend(v4, "code");
    v9 = *MEMORY[0x1E0D52390];
    if (v8 == 13)
    {
      if (v9 != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_423);
      v10 = *MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_INFO))
      {
        v11 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v15 = v11;
        _os_log_impl(&dword_1A6382000, v10, OS_LOG_TYPE_INFO, "Aux image can be obtained from original data, skipped: %@", buf, 0xCu);
      }
    }
    else
    {
      if (v9 != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_423);
      v12 = *MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v5;
        _os_log_error_impl(&dword_1A6382000, v12, OS_LOG_TYPE_ERROR, "failed to render auxiliary image data: %@", buf, 0xCu);
      }
    }
  }

}

void __82__PICompositionExporter_prepareAuxiliaryImagesFetchProperties_options_completion___block_invoke_378(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(*(id *)(a1 + 32), "setAuxiliaryImages:", v2);

  v3 = *(_QWORD *)(a1 + 48);
  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithResult:", *(_QWORD *)(a1 + 32));
  (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

void __70__PICompositionExporter_prepareImageExportRequest_options_completion___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD);
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  PICompositionExportImagePrepareResult *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;

  v36 = 0;
  objc_msgSend(a2, "result:", &v36);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v36;
  if (v3)
  {
    objc_msgSend(v3, "properties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "metadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "resetImageProperties:preserveRegions:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)a1[4];
    v9 = a1[5];
    v10 = a1[6];
    v35 = 0;
    objc_msgSend(v8, "addImageProperties:composition:options:error:", v7, v9, v10, &v35);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v35;

    objc_msgSend((id)a1[6], "metadataProcessor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend((id)a1[6], "metadataProcessor");
      v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v14)[2](v14, v11);
      v15 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v15;
    }
    if (!v11)
    {
      if (!v12)
      {
        objc_msgSend(MEMORY[0x1E0D520A0], "unknownError:object:", CFSTR("unable to prepare image properties"), 0);
        v12 = (id)objc_claimAutoreleasedReturnValue();
      }
      v18 = a1[7];
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithError:", v12);
      (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v19);
      goto LABEL_14;
    }
    objc_msgSend((id)a1[5], "objectForKeyedSubscript:", CFSTR("depthEffect"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {

    }
    else
    {
      objc_msgSend((id)a1[5], "objectForKeyedSubscript:", CFSTR("portraitEffect"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        v21 = 0;
        goto LABEL_13;
      }
    }
    v21 = objc_msgSend(MEMORY[0x1E0D52108], "disableIOSurfacePortaitExport") ^ 1;
LABEL_13:
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52160]), "initWithComposition:", a1[5]);
    objc_msgSend(v19, "setName:", CFSTR("PICompositionExporter-image"));
    objc_msgSend((id)a1[6], "priority");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setPriority:", v22);

    objc_msgSend((id)a1[6], "colorSpace");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setColorSpace:", v23);

    objc_msgSend((id)a1[6], "scalePolicy");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setScalePolicy:", v24);

    objc_msgSend(v19, "setImageProperties:", v11);
    objc_msgSend(v3, "auxiliaryImages");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAuxImages:", v25);

    objc_msgSend(v19, "setRenderWithIOSurface:", v21);
    objc_msgSend((id)a1[6], "auxiliaryImageTypes");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAuxiliaryImageTypes:", v26);

    v27 = objc_alloc_init(PICompositionExportImagePrepareResult);
    -[PICompositionExportImagePrepareResult setRequest:](v27, "setRequest:", v19);
    v28 = objc_msgSend(v3, "inputSize");
    -[PICompositionExportImagePrepareResult setInputSize:](v27, "setInputSize:", v28, v29);
    objc_msgSend(v3, "properties");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PICompositionExportImagePrepareResult setInputIsHDR:](v27, "setInputIsHDR:", objc_msgSend(v30, "isHDR"));

    objc_msgSend(v3, "properties");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "colorSpace");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PICompositionExportImagePrepareResult setInputColorSpace:](v27, "setInputColorSpace:", v32);

    v33 = a1[7];
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithResult:", v27);
    (*(void (**)(uint64_t, void *))(v33 + 16))(v33, v34);

LABEL_14:
    goto LABEL_15;
  }
  v17 = a1[7];
  v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithError:", v4);
  (*(void (**)(uint64_t, id))(v17 + 16))(v17, v12);
LABEL_15:

}

void __44__PICompositionExporter_variationForFlavor___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("AutoLoop");
  v2[1] = CFSTR("Mirror");
  v3[0] = &unk_1E5051238;
  v3[1] = &unk_1E5051250;
  v2[2] = CFSTR("LongExposure");
  v3[2] = &unk_1E5051268;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)variationForFlavor__map;
  variationForFlavor__map = v0;

}

void __78__PICompositionExporter_exportComposition_options_completionQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint8_t v12[8];
  id obj;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(a2, "result:", &obj);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  objc_msgSend(v4, "geometry");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  v8 = objc_msgSend(v4, "inputSize");
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  *(_QWORD *)(v9 + 32) = v8;
  *(_QWORD *)(v9 + 40) = v10;
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_423);
  v11 = *MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v12 = 0;
    _os_log_debug_impl(&dword_1A6382000, v11, OS_LOG_TYPE_DEBUG, "Export Composition: exporting image complete", v12, 2u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __78__PICompositionExporter_exportComposition_options_completionQueue_completion___block_invoke_352(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  NSObject *v5;
  uint8_t v6[8];
  id obj;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v3 + 40);
  v4 = (id)objc_msgSend(a2, "result:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_423);
  v5 = *MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_debug_impl(&dword_1A6382000, v5, OS_LOG_TYPE_DEBUG, "Export Composition: exporting video complement complete", v6, 2u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __78__PICompositionExporter_exportComposition_options_completionQueue_completion___block_invoke_353(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint8_t v12[8];
  id obj;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(a2, "result:", &obj);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  objc_msgSend(v4, "geometry");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  v8 = objc_msgSend(v4, "inputSize");
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  *(_QWORD *)(v9 + 32) = v8;
  *(_QWORD *)(v9 + 40) = v10;
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_423);
  v11 = *MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v12 = 0;
    _os_log_debug_impl(&dword_1A6382000, v11, OS_LOG_TYPE_DEBUG, "Export Composition: exporting video complete", v12, 2u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __78__PICompositionExporter_exportComposition_options_completionQueue_completion___block_invoke_354(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  NSObject *v5;
  uint8_t v6[8];
  id obj;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v3 + 40);
  v4 = (id)objc_msgSend(a2, "result:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_423);
  v5 = *MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_debug_impl(&dword_1A6382000, v5, OS_LOG_TYPE_DEBUG, "Export Composition: exporting video poster frame complete", v6, 2u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __78__PICompositionExporter_exportComposition_options_completionQueue_completion___block_invoke_355(_QWORD *a1)
{
  _QWORD *v2;
  os_log_t *v3;
  NSObject *v4;
  PICompositionExportAuxiliaryResult *v5;
  PICompositionExportAuxiliaryResult *v6;
  void *v7;
  PICompositionExportAuxiliaryResult *v8;
  void *v9;
  PICompositionExportAuxiliaryResult *v10;
  void *v11;
  PICompositionExportAuxiliaryResult *v12;
  void *v13;
  PICompositionExportAuxiliaryResult *v14;
  void *v15;
  PICompositionExportAuxiliaryResult *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  int v22;
  PICompositionExportAuxiliaryResult *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = (_QWORD *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_423);
  v3 = (os_log_t *)MEMORY[0x1E0D52398];
  v4 = *MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v22) = 0;
    _os_log_debug_impl(&dword_1A6382000, v4, OS_LOG_TYPE_DEBUG, "Export Composition: notify triggered", (uint8_t *)&v22, 2u);
  }
  v5 = *(PICompositionExportAuxiliaryResult **)(*(_QWORD *)(a1[5] + 8) + 40);
  if (v5)
    v6 = v5;
  v7 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  if (v7)
  {
    v8 = v7;

    v5 = v8;
  }
  v9 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
  if (v9)
  {
    v10 = v9;

    v5 = v10;
  }
  v11 = *(void **)(*(_QWORD *)(a1[8] + 8) + 40);
  if (v11)
  {
    v12 = v11;

    v5 = v12;
  }
  v13 = *(void **)(*(_QWORD *)(a1[9] + 8) + 40);
  if (v13)
  {
    v14 = v13;

    v5 = v14;
  }
  v15 = *(void **)(*(_QWORD *)(a1[10] + 8) + 40);
  if (v15)
  {
    v16 = v15;

    v5 = v16;
LABEL_18:
    if (*v2 != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_423);
    v17 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEBUG))
    {
      v22 = 138543362;
      v23 = v5;
      _os_log_debug_impl(&dword_1A6382000, v17, OS_LOG_TYPE_DEBUG, "Export Composition: calling completion with error: %{public}@", (uint8_t *)&v22, 0xCu);
    }
    v18 = a1[4];
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithError:", v5);
    goto LABEL_23;
  }
  if (v5)
    goto LABEL_18;
  v5 = objc_alloc_init(PICompositionExportAuxiliaryResult);
  -[PICompositionExportResult setGeometry:](v5, "setGeometry:", *(_QWORD *)(*(_QWORD *)(a1[11] + 8) + 40));
  -[PICompositionExportResult setInputSize:](v5, "setInputSize:", *(_QWORD *)(*(_QWORD *)(a1[12] + 8) + 32), *(_QWORD *)(*(_QWORD *)(a1[12] + 8) + 40));
  -[PICompositionExportAuxiliaryResult setCompanionImageData:](v5, "setCompanionImageData:", *(_QWORD *)(*(_QWORD *)(a1[13] + 8) + 40));
  -[PICompositionExportAuxiliaryResult setCompanionVideoURL:](v5, "setCompanionVideoURL:", *(_QWORD *)(*(_QWORD *)(a1[14] + 8) + 40));
  if (*v2 != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_423);
  v21 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEBUG))
  {
    v22 = 138543362;
    v23 = v5;
    _os_log_debug_impl(&dword_1A6382000, v21, OS_LOG_TYPE_DEBUG, "Export Composition: calling completion with result: %{public}@", (uint8_t *)&v22, 0xCu);
  }
  v18 = a1[4];
  v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithResult:", v5);
LABEL_23:
  v20 = (void *)v19;
  (*(void (**)(uint64_t, uint64_t))(v18 + 16))(v18, v19);

}

void __77__PICompositionExporter_exportImageToDataWithComposition_options_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  objc_msgSend(a2, "result:", &v18);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v18;
  if (v3)
  {
    objc_msgSend(v3, "request");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "inputSize");
    v8 = v7;
    objc_msgSend(v5, "setRenderToData:", 1);
    objc_msgSend(*(id *)(a1 + 32), "imageExportFormatForURL:isHDR:", 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFormat:", v9);

    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (objc_msgSend(*(id *)(a1 + 32), "applyImageOrientationAsMetadata"))
    {
      +[PIPipelineFilters orientationAsMetaDataFilter](PIPipelineFilters, "orientationAsMetaDataFilter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v11);

    }
    objc_msgSend(v5, "setPipelineFilters:", v10);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __77__PICompositionExporter_exportImageToDataWithComposition_options_completion___block_invoke_328;
    v14[3] = &unk_1E5016508;
    v15 = *(id *)(a1 + 40);
    v16 = v6;
    v17 = v8;
    objc_msgSend(v5, "submit:", v14);

  }
  else
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_423);
    v12 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v4;
      _os_log_error_impl(&dword_1A6382000, v12, OS_LOG_TYPE_ERROR, "Failed to export image to data: %@", buf, 0xCu);
    }
    v13 = *(_QWORD *)(a1 + 40);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithError:", v4);
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v5);
  }

}

void __77__PICompositionExporter_exportImageToDataWithComposition_options_completion___block_invoke_328(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  PICompositionExportDataResult *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = 0;
  objc_msgSend(a2, "result:", &v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v11;
  if (v3)
  {
    v5 = objc_alloc_init(PICompositionExportDataResult);
    objc_msgSend(v3, "geometry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PICompositionExportResult setGeometry:](v5, "setGeometry:", v6);

    -[PICompositionExportResult setInputSize:](v5, "setInputSize:", a1[5], a1[6]);
    objc_msgSend(v3, "destinationData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PICompositionExportDataResult setData:](v5, "setData:", v7);

    v8 = a1[4];
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithResult:", v5);
    (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, v9);

    v4 = (id)v9;
  }
  else
  {
    v10 = a1[4];
    v5 = (PICompositionExportDataResult *)objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithError:", v4);
    (*(void (**)(uint64_t, PICompositionExportDataResult *))(v10 + 16))(v10, v5);
  }

}

void __73__PICompositionExporter_exportImageToURL_composition_options_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v23 = 0;
  objc_msgSend(a2, "result:", &v23);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v23;
  if (v3)
  {
    objc_msgSend(v3, "request");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "inputSize");
    v8 = v7;
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    +[PIPipelineFilters oneShotPortraitV2ExportFilter](PIPipelineFilters, "oneShotPortraitV2ExportFilter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

    objc_msgSend(v5, "setApplyOrientationAsMetadata:", objc_msgSend(*(id *)(a1 + 40), "applyImageOrientationAsMetadata"));
    if (objc_msgSend((id)objc_opt_class(), "_lowMemoryModeSupportedForComposition:pixelSize:", *(_QWORD *)(a1 + 56), v6, v8))v11 = objc_msgSend(*(id *)(a1 + 40), "optimizeForBackgroundProcessing");
    else
      v11 = 0;
    objc_msgSend(v5, "setShouldUseLowMemoryMode:", v11);
    objc_msgSend(v5, "setDestinationURL:", *(_QWORD *)(a1 + 32));
    v14 = objc_msgSend(v3, "inputIsHDR");
    objc_msgSend(*(id *)(a1 + 40), "imageExportFormatForURL:isHDR:", *(_QWORD *)(a1 + 32), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v14
      && objc_msgSend(*(id *)(a1 + 40), "enableHDR")
      && objc_msgSend(v15, "supportsHDR")
      && objc_msgSend(MEMORY[0x1E0D52108], "enableDash5"))
    {
      objc_msgSend(v3, "inputColorSpace");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "isHDR"))
      {
        objc_msgSend(v5, "setColorSpace:", v16);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D52068], "itur2100PQColorSpace");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setColorSpace:", v18);

      }
      objc_msgSend(v5, "setRenderWithIOSurface:", 1);

    }
    objc_msgSend(v5, "setFormat:", v15);
    objc_msgSend(v5, "setPipelineFilters:", v9);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __73__PICompositionExporter_exportImageToURL_composition_options_completion___block_invoke_325;
    v19[3] = &unk_1E5016508;
    v20 = *(id *)(a1 + 64);
    v21 = v6;
    v22 = v8;
    objc_msgSend(v5, "submit:", v19);

  }
  else
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_423);
    v12 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
    {
      v17 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v25 = v17;
      v26 = 2112;
      v27 = v4;
      _os_log_error_impl(&dword_1A6382000, v12, OS_LOG_TYPE_ERROR, "Failed to export image to %@: %@", buf, 0x16u);
    }
    v13 = *(_QWORD *)(a1 + 64);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithError:", v4);
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v5);
  }

}

void __73__PICompositionExporter_exportImageToURL_composition_options_completion___block_invoke_325(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  PICompositionExportResult *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = 0;
  objc_msgSend(a2, "result:", &v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v11;
  if (v3)
  {
    v5 = objc_alloc_init(PICompositionExportResult);
    objc_msgSend(v3, "geometry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PICompositionExportResult setGeometry:](v5, "setGeometry:", v6);

    -[PICompositionExportResult setInputSize:](v5, "setInputSize:", a1[5], a1[6]);
    objc_msgSend(v3, "destinationURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PICompositionExportResult setExportedFileURL:](v5, "setExportedFileURL:", v7);

    v8 = a1[4];
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithResult:", v5);
    (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, v9);

    v4 = (id)v9;
  }
  else
  {
    v10 = a1[4];
    v5 = (PICompositionExportResult *)objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithError:", v4);
    (*(void (**)(uint64_t, PICompositionExportResult *))(v10 + 16))(v10, v5);
  }

}

void __29__PICompositionExporter_init__block_invoke()
{
  _PICompositionExporterMetadataConverter *v0;
  void *v1;

  if (!sMetadataConverter)
  {
    v0 = objc_alloc_init(_PICompositionExporterMetadataConverter);
    v1 = (void *)sMetadataConverter;
    sMetadataConverter = (uint64_t)v0;

  }
}

+ (void)setMetadataConverter:(id)a3
{
  id v3;
  _PICompositionExporterMetadataConverter *v4;
  void *v5;
  id v6;

  v3 = a3;
  v6 = v3;
  if (v3)
    v4 = (_PICompositionExporterMetadataConverter *)v3;
  else
    v4 = objc_alloc_init(_PICompositionExporterMetadataConverter);
  v5 = (void *)sMetadataConverter;
  sMetadataConverter = (uint64_t)v4;

}

+ (id)metadataConverter
{
  return (id)sMetadataConverter;
}

+ (BOOL)_lowMemoryModeSupportedForComposition:(id)a3 pixelSize:(id)a4
{
  int64_t var1;
  int64_t var0;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  BOOL v12;

  var1 = a4.var1;
  var0 = a4.var0;
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("depthEffect"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7
    && (objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("enabled")),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "BOOLValue"),
        v9,
        v10))
  {
    v11 = !+[PIPhotoEditHelper compositionHasAnyStageEffect:](PIPhotoEditHelper, "compositionHasAnyStageEffect:", v6);
    if ((double)(var0 * var1) / 1000000.0 > 20.0)
      v12 = v11;
    else
      v12 = 0;
  }
  else
  {
    v12 = 1;
  }

  return v12;
}

+ (id)resetImageProperties:(id)a3 preserveRegions:(BOOL)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v5, "removeObjectForKey:", *MEMORY[0x1E0CBCFF0]);
  v6 = *MEMORY[0x1E0CBD090];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD090]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  if (v8)
  {
    objc_msgSend(v8, "removeObjectForKey:", *MEMORY[0x1E0CBD0C0]);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, v6);
  }
  if (!a4)
  {
    v9 = *MEMORY[0x1E0CBCA28];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCA28]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    if (v11)
    {
      objc_msgSend(v11, "removeObjectForKey:", CFSTR("Regions"));
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v9);
    }

  }
  v12 = (void *)objc_msgSend(v5, "copy");

  return v12;
}

@end
