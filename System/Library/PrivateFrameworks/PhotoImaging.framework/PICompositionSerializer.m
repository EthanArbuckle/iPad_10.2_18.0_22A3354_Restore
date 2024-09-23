@implementation PICompositionSerializer

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("com.apple.photo"), 0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)__s_allowedIdentifiers;
    __s_allowedIdentifiers = v2;

    v4 = (void *)MEMORY[0x1E0C99E60];
    +[PICompositionSerializerFormatVersion locallySupportedFormatVersions](PICompositionSerializerFormatVersion, "locallySupportedFormatVersions");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithArray:", v7);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)__s_allowedVersions;
    __s_allowedVersions = v5;

  }
}

+ (void)disableApertureEffects:(BOOL)a3
{
  sDisableApertureEffects = a3;
}

+ (BOOL)canInterpretDataWithFormatIdentifier:(id)a3 formatVersion:(id)a4
{
  id v5;
  char v6;

  v5 = a4;
  if (objc_msgSend((id)__s_allowedIdentifiers, "containsObject:", a3))
    v6 = objc_msgSend((id)__s_allowedVersions, "containsObject:", v5);
  else
    v6 = 0;

  return v6;
}

+ (id)deserializeCompositionFromData:(id)a3 formatIdentifier:(id)a4 formatVersion:(id)a5 error:(id *)a6
{
  return (id)objc_msgSend(a1, "deserializeCompositionFromData:formatIdentifier:formatVersion:sidecarData:error:", a3, a4, a5, 0, a6);
}

+ (id)deserializeCompositionFromData:(id)a3 formatIdentifier:(id)a4 formatVersion:(id)a5 sidecarData:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  if (!a7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PICompositionSerializer.m"), 82, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error != NULL"));

  }
  objc_msgSend(a1, "deserializeDictionaryFromData:error:", v13, a7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17 && objc_msgSend(a1, "validateAdjustmentsEnvelope:error:", v17, a7))
  {
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("adjustments"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("metadata"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "deserializeCompositionFromAdjustments:metadata:formatIdentifier:formatVersion:sidecarData:error:", v18, v19, v14, v15, v16, a7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

+ (BOOL)validateCompositionWithMissingSource:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  char v9;

  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("source"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0D522E0]);
    objc_msgSend(v7, "setAssetIdentifier:", CFSTR("dummy"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("source"));

  }
  objc_msgSend(v5, "schema");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "validateComposition:error:", v5, a4);

  if (!v6)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, CFSTR("source"));

  return v9;
}

+ (id)deserializeCompositionFromAdjustments:(id)a3 metadata:(id)a4 formatIdentifier:(id)a5 formatVersion:(id)a6 error:(id *)a7
{
  return (id)objc_msgSend(a1, "deserializeCompositionFromAdjustments:metadata:formatIdentifier:formatVersion:sidecarData:error:", a3, a4, a5, a6, 0, a7);
}

+ (id)deserializeCompositionFromAdjustments:(id)a3 metadata:(id)a4 formatIdentifier:(id)a5 formatVersion:(id)a6 sidecarData:(id)a7 error:(id *)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void (**v31)(_QWORD, _QWORD);
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  char v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  const __CFString *v58;
  void *v59;
  void *v60;
  void *v62;
  id v63;
  id *v64;
  id v65;
  id v66;
  id v67;
  id v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  id v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  id obj;
  _QWORD v79[4];
  id v80;
  id v81;
  id v82;
  id v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  if (!a8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PICompositionSerializer.m"), 151, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error != NULL"));

  }
  v63 = a1;
  +[PICompositionSerializerConstants conversionMap](PICompositionSerializerConstants, "conversionMap");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = +[PIPhotoEditHelper newComposition](PIPhotoEditHelper, "newComposition");
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  obj = v15;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v88, 16);
  if (!v21)
    goto LABEL_35;
  v22 = v21;
  v23 = *(_QWORD *)v85;
  v67 = v17;
  v68 = v16;
  v65 = v19;
  v66 = v18;
  v64 = a8;
  v69 = v20;
  v70 = *(_QWORD *)v85;
  while (2)
  {
    v24 = 0;
    v71 = v22;
    do
    {
      if (*(_QWORD *)v85 != v23)
        objc_enumerationMutation(obj);
      v25 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * v24);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("identifier"));
        v26 = objc_claimAutoreleasedReturnValue();
        if (!v26)
        {
          objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", CFSTR("Adjustment missing identifier"), v25);
          *v64 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_48;
        }
        v27 = (void *)v26;
        objc_msgSend(v72, "objectForKeyedSubscript:", v26);
        v28 = objc_claimAutoreleasedReturnValue();
        if (!v28)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Conversion map is missing adjustment identifier '%@'"), v27);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", v60, v72);
          *v64 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_48;
        }
        v29 = (void *)v28;
        objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("settings"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("customIdentifierName"));
        v31 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("supported"));
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = (void *)v32;
        if (v32 && ((*(uint64_t (**)(uint64_t, void *))(v32 + 16))(v32, v30) & 1) == 0)
        {
          v57 = (void *)MEMORY[0x1E0D520A0];
          v58 = CFSTR("Unsupported adjustment");
          v59 = v27;
          goto LABEL_46;
        }
        if (sDisableApertureEffects
          && ((objc_msgSend(v27, "isEqualToString:", CFSTR("DepthEffect")) & 1) != 0
           || objc_msgSend(v27, "isEqualToString:", CFSTR("PortraitEffect"))))
        {
          v57 = (void *)MEMORY[0x1E0D520A0];
          v58 = CFSTR("Configuration does not support Aperture adjustments");
          v59 = 0;
LABEL_46:
          objc_msgSend(v57, "unsupportedError:object:", v58, v59);
          *v64 = (id)objc_claimAutoreleasedReturnValue();

LABEL_47:
LABEL_48:
          v17 = v67;
          v16 = v68;
          v19 = v65;
          v18 = v66;
          v20 = v69;

          goto LABEL_49;
        }
        if (v31)
          ((void (**)(_QWORD, void *))v31)[2](v31, v30);
        else
          objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("identifierName"));
        v34 = objc_claimAutoreleasedReturnValue();

        if (!v34)
        {
          objc_msgSend(MEMORY[0x1E0D520A0], "failureError:object:", CFSTR("Failed to generate or read identifier from composition definition"), v29);
          *v64 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_47;
        }
        v77 = v31;
        v75 = (void *)v34;
        v35 = +[PIPhotoEditHelper newAdjustmentWithName:](PIPhotoEditHelper, "newAdjustmentWithName:", v34);
        objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("enabled"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setObject:forKeyedSubscript:", v36, CFSTR("enabled"));

        objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("auto"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (v37)
          v38 = MEMORY[0x1E0C9AAB0];
        else
          v38 = 0;
        objc_msgSend(v35, "setObject:forKeyedSubscript:", v38, CFSTR("auto"));

        objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("inputKeys"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("identifierName"), CFSTR("compositionName"), CFSTR("custom"), CFSTR("customSerialization"), CFSTR("customIdentifierName"), CFSTR("customCompositionName"), CFSTR("omitIfDisabled"), CFSTR("auto"), 0);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v79[0] = MEMORY[0x1E0C809B0];
        v79[1] = 3221225472;
        v79[2] = __123__PICompositionSerializer_deserializeCompositionFromAdjustments_metadata_formatIdentifier_formatVersion_sidecarData_error___block_invoke;
        v79[3] = &unk_1E50156B8;
        v74 = v40;
        v80 = v74;
        v41 = v35;
        v81 = v41;
        v42 = v30;
        v82 = v42;
        v73 = v39;
        v83 = v73;
        objc_msgSend(v29, "enumerateKeysAndObjectsUsingBlock:", v79);
        objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("custom"));
        v43 = objc_claimAutoreleasedReturnValue();
        v44 = (void *)v43;
        if (v43)
          (*(void (**)(uint64_t, void *, id))(v43 + 16))(v43, v25, v41);
        v76 = v33;
        objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("customCompositionName"));
        v45 = objc_claimAutoreleasedReturnValue();
        v46 = (void *)v45;
        if (v45)
          (*(void (**)(uint64_t, id, id))(v45 + 16))(v45, v42, v41);
        else
          objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("compositionName"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("enabled"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v48, "BOOLValue"))
        {

          v22 = v71;
        }
        else
        {
          objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("omitIfDisabled"));
          v49 = v42;
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = objc_msgSend(v50, "BOOLValue");

          v42 = v49;
          v22 = v71;
          if ((v51 & 1) != 0)
          {
LABEL_32:

            v23 = v70;
            goto LABEL_33;
          }
        }
        objc_msgSend(v69, "setObject:forKeyedSubscript:", v41, v47);
        goto LABEL_32;
      }
LABEL_33:
      ++v24;
    }
    while (v22 != v24);
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v88, 16);
    v17 = v67;
    v16 = v68;
    v19 = v65;
    v18 = v66;
    a8 = v64;
    v20 = v69;
    if (v22)
      continue;
    break;
  }
LABEL_35:

  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("orientation"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v52)
  {
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("orientation"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v53, "integerValue"))
    {
      v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52128]), "initWithName:", CFSTR("Orientation"));
      v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D520F0]), "initWithIdentifier:", v54);
      objc_msgSend(v55, "setObject:forKeyedSubscript:", v53, CFSTR("value"));
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v55, CFSTR("orientation"));

    }
  }
  objc_msgSend(v63, "_sanitizeComposition:", v20);
  if (objc_msgSend(v63, "validateCompositionWithMissingSource:error:", v20, a8))
    v56 = v20;
  else
LABEL_49:
    v56 = 0;

  return v56;
}

+ (id)serializeComposition:(id)a3 versionInfo:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(a1, "_serializeComposition:versionInfo:skipMetadata:error:", a3, a4, 0, a5);
}

+ (id)_serializeComposition:(id)a3 versionInfo:(id)a4 skipMetadata:(BOOL)a5 error:(id *)a6
{
  id v10;
  id v11;
  PICompositionSerializerMetadata *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v10 = a3;
  v11 = a4;
  v12 = objc_alloc_init(PICompositionSerializerMetadata);
  if (!a5)
  {
    +[PIPhotoEditHelper geometryRequestWithComposition:](PIPhotoEditHelper, "geometryRequestWithComposition:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setName:", CFSTR("PICompositionSerializer-geometry"));
    objc_msgSend(v13, "submitSynchronous:", a6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {

      v20 = 0;
      goto LABEL_6;
    }
    v15 = v14;
    objc_msgSend(v14, "geometry");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PICompositionSerializerMetadata setWidth:](v12, "setWidth:", objc_msgSend(v16, "size"));

    objc_msgSend(v15, "geometry");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "size");
    -[PICompositionSerializerMetadata setHeight:](v12, "setHeight:", v18);

    objc_msgSend(v15, "geometry");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PICompositionSerializerMetadata setOrientation:](v12, "setOrientation:", objc_msgSend(v19, "orientation"));

  }
  objc_msgSend(a1, "serializeComposition:versionInfo:serializerMetadata:error:", v10, v11, v12, a6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v20;
}

+ (id)serializeComposition:(id)a3 versionInfo:(id)a4 serializerMetadata:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void (**v58)(_QWORD, _QWORD, _QWORD);
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t *v65;
  void *v66;
  os_log_t *v67;
  void *v68;
  void *v69;
  NSObject *v70;
  void *v71;
  uint64_t v72;
  os_log_t v73;
  void *specific;
  void *v75;
  id v76;
  NSObject *v77;
  void *v78;
  void *v79;
  os_log_t v80;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  id v87;
  id *v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  PICompositionController *v98;
  id obj;
  void *v100;
  void *v101;
  void *v102;
  id v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  _QWORD v108[4];
  id v109;
  id v110;
  id v111;
  _QWORD v112[4];
  id v113;
  id v114;
  id v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  _QWORD v120[4];
  _QWORD v121[4];
  _QWORD v122[2];
  _QWORD v123[2];
  _BYTE v124[128];
  const __CFString *v125;
  uint8_t buf[4];
  void *v127;
  __int16 v128;
  void *v129;
  _BYTE v130[128];
  uint64_t v131;

  v131 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v88 = a6;
  if (!a6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PICompositionSerializer.m"), 321, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error != nil"));

  }
  v86 = a1;
  v89 = v12;
  v14 = 0x1E0C99000uLL;
  v15 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v13, "width"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("masterWidth"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v13, "height"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, CFSTR("masterHeight"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v13, "orientation"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = v15;
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, CFSTR("orientation"));

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = +[PICompositionNoOpRemoval copyOfCompositionRemovingNoOps:](PICompositionNoOpRemoval, "copyOfCompositionRemovingNoOps:", v11);

  v91 = v19;
  v98 = -[PICompositionController initWithComposition:]([PICompositionController alloc], "initWithComposition:", v19);
  -[PICompositionController adjustmentControllerForKey:](v98, "adjustmentControllerForKey:", CFSTR("orientation"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("orientation"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v22, CFSTR("orientation"));

  }
  v90 = v21;
  v87 = v13;
  +[PICompositionSerializerConstants mapForSerialization](PICompositionSerializerConstants, "mapForSerialization");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("source"), CFSTR("orientation"), CFSTR("sourceSpatialOvercapture"), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = 0u;
  v117 = 0u;
  v118 = 0u;
  v119 = 0u;
  -[PICompositionController compositionKeys](v98, "compositionKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v116, v130, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v117;
    v93 = *(_QWORD *)v117;
    v94 = v23;
LABEL_9:
    v27 = 0;
    v95 = v25;
    while (1)
    {
      if (*(_QWORD *)v117 != v26)
        objc_enumerationMutation(obj);
      v28 = *(_QWORD *)(*((_QWORD *)&v116 + 1) + 8 * v27);
      if ((objc_msgSend(v23, "containsObject:", v28) & 1) != 0)
        goto LABEL_41;
      objc_msgSend(v97, "objectForKeyedSubscript:", v28);
      v29 = objc_claimAutoreleasedReturnValue();
      if (!v29)
      {
        v65 = (uint64_t *)MEMORY[0x1E0D52390];
        if (*MEMORY[0x1E0D52390] != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_1309);
        v61 = v89;
        v66 = v87;
        v67 = (os_log_t *)MEMORY[0x1E0D52380];
        v68 = (void *)*MEMORY[0x1E0D52380];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52380], OS_LOG_TYPE_DEFAULT))
        {
          v69 = (void *)MEMORY[0x1E0CB3940];
          v70 = v68;
          objc_msgSend(v69, "stringWithFormat:", CFSTR("Serialization map has no entry for %@"), v28);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v127 = v71;
          _os_log_impl(&dword_1A6382000, v70, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

          v72 = *v65;
          if (dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
          {
            if (v72 != -1)
              dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_1309);
LABEL_53:
            v73 = *v67;
            if (os_log_type_enabled(*v67, OS_LOG_TYPE_ERROR))
            {
              specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
              v75 = (void *)MEMORY[0x1E0CB3978];
              v76 = specific;
              v77 = v73;
              objc_msgSend(v75, "callStackSymbols");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v78, "componentsJoinedByString:", CFSTR("\n"));
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v127 = specific;
              v128 = 2114;
              v129 = v79;
              _os_log_error_impl(&dword_1A6382000, v77, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

              goto LABEL_63;
            }
            goto LABEL_60;
          }
          if (v72 != -1)
            dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_1309);
        }
        else if (dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
        {
          goto LABEL_53;
        }
        v80 = *v67;
        if (os_log_type_enabled(*v67, OS_LOG_TYPE_ERROR))
        {
          v82 = (void *)MEMORY[0x1E0CB3978];
          v77 = v80;
          objc_msgSend(v82, "callStackSymbols");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "componentsJoinedByString:", CFSTR("\n"));
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v127 = v84;
          _os_log_error_impl(&dword_1A6382000, v77, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_63:
        }
LABEL_60:
        _NUAssertContinueHandler();
        objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", CFSTR("Serialization map missing adjustment key"), v28, v28);
        v63 = 0;
        *v88 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_61;
      }
      v30 = (void *)v29;
      -[PICompositionController adjustmentControllerForKey:](v98, "adjustmentControllerForKey:", v28);
      v31 = objc_claimAutoreleasedReturnValue();
      if (!v31)
      {
        objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", CFSTR("Missing adjustment"), v28);
        *v88 = (id)objc_claimAutoreleasedReturnValue();

        v63 = 0;
        v61 = v89;
        v66 = v87;
        goto LABEL_61;
      }
      v32 = (void *)v31;
      v33 = (void *)objc_opt_new();
      v34 = (void *)objc_opt_new();
      objc_msgSend(v33, "setObject:forKeyedSubscript:", v34, CFSTR("settings"));
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("identifierName"), CFSTR("compositionName"), CFSTR("custom"), CFSTR("customSerialization"), CFSTR("customIdentifierName"), CFSTR("customCompositionName"), CFSTR("omitIfDisabled"), CFSTR("inputKeys"), CFSTR("requiresEnabled"), 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v112[0] = MEMORY[0x1E0C809B0];
      v112[1] = 3221225472;
      v112[2] = __85__PICompositionSerializer_serializeComposition_versionInfo_serializerMetadata_error___block_invoke;
      v112[3] = &unk_1E50156E0;
      v36 = v35;
      v113 = v36;
      v37 = v32;
      v114 = v37;
      v38 = v34;
      v115 = v38;
      objc_msgSend(v30, "enumerateKeysAndObjectsUsingBlock:", v112);
      v100 = v30;
      objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("inputKeys"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (v39)
      {
        v40 = objc_alloc_init(*(Class *)(v14 + 3592));
        objc_msgSend(v38, "setObject:forKeyedSubscript:", v40, CFSTR("inputKeys"));
        v108[0] = MEMORY[0x1E0C809B0];
        v108[1] = 3221225472;
        v108[2] = __85__PICompositionSerializer_serializeComposition_versionInfo_serializerMetadata_error___block_invoke_2;
        v108[3] = &unk_1E50156E0;
        v109 = v36;
        v110 = v37;
        v111 = v40;
        v41 = v40;
        objc_msgSend(v39, "enumerateKeysAndObjectsUsingBlock:", v108);

      }
      v103 = v36;
      objc_msgSend(v100, "objectForKeyedSubscript:", CFSTR("customSerialization"));
      v42 = objc_claimAutoreleasedReturnValue();
      if (v42)
      {
        objc_msgSend(v37, "adjustment");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, id, void *))(v42 + 16))(v42, v38, v43);

      }
      v101 = (void *)v42;
      v102 = v38;
      v125 = CFSTR("enabled");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v125, 1);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v104 = 0u;
      v105 = 0u;
      v106 = 0u;
      v107 = 0u;
      v45 = v44;
      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v104, v124, 16);
      if (v46)
      {
        v47 = v46;
        v48 = *(_QWORD *)v105;
        do
        {
          for (i = 0; i != v47; ++i)
          {
            if (*(_QWORD *)v105 != v48)
              objc_enumerationMutation(v45);
            v50 = *(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * i);
            if (objc_msgSend(v37, "hasInputKey:", v50))
            {
              objc_msgSend(v37, "objectForKeyedSubscript:", v50);
              v51 = (void *)objc_claimAutoreleasedReturnValue();

              if (v51)
              {
                objc_msgSend(v37, "objectForKeyedSubscript:", v50);
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "setObject:forKeyedSubscript:", v52, v50);

              }
            }
          }
          v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v104, v124, 16);
        }
        while (v47);
      }

      objc_msgSend(v100, "objectForKeyedSubscript:", CFSTR("requiresEnabled"));
      v53 = objc_claimAutoreleasedReturnValue();
      if (v53)
      {
        v54 = (void *)v53;
        objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("enabled"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v55)
          objc_msgSend(v33, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("enabled"));
      }
      v14 = 0x1E0C99000;
      v25 = v95;
      v56 = v103;
      if (objc_msgSend(v37, "hasInputKey:", CFSTR("auto")))
      {
        objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("auto"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();

        if (v57)
          break;
      }
LABEL_40:
      objc_msgSend(v100, "objectForKeyedSubscript:", CFSTR("identifierName"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setObject:forKeyedSubscript:", v60, CFSTR("identifier"));

      objc_msgSend(v33, "setObject:forKeyedSubscript:", CFSTR("com.apple.photo"), CFSTR("formatIdentifier"));
      objc_msgSend(v33, "setObject:forKeyedSubscript:", &unk_1E5051010, CFSTR("formatVersion"));
      objc_msgSend(v96, "addObject:", v33);

      v26 = v93;
      v23 = v94;
LABEL_41:
      if (++v27 == v25)
      {
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v116, v130, 16);
        if (v25)
          goto LABEL_9;
        goto LABEL_43;
      }
    }
    objc_msgSend(v100, "objectForKeyedSubscript:", CFSTR("autoValue"));
    v58 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v58)
    {
      objc_msgSend(v37, "adjustment");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, void *))v58)[2](v58, v33, v59);
    }
    else
    {
      if (!objc_msgSend(v37, "isAuto"))
      {
LABEL_39:

        goto LABEL_40;
      }
      v122[0] = CFSTR("auto");
      v122[1] = CFSTR("current");
      v123[0] = MEMORY[0x1E0C9AA70];
      v123[1] = CFSTR("auto");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v123, v122, 2);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0x1E0C99000;
      objc_msgSend(v33, "setObject:forKeyedSubscript:", v59, CFSTR("auto"));
    }

    v56 = v103;
    goto LABEL_39;
  }
LABEL_43:

  v120[0] = CFSTR("metadata");
  v120[1] = CFSTR("adjustments");
  v121[0] = v92;
  v121[1] = v96;
  v120[2] = CFSTR("formatVersion");
  v120[3] = CFSTR("versionInfo");
  v121[2] = &unk_1E5051028;
  v61 = v89;
  v121[3] = v89;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v121, v120, 4);
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "serializeDictionary:error:");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  if (v62)
  {
    v63 = (void *)objc_opt_new();
    objc_msgSend(v63, "setFormatIdentifier:", CFSTR("com.apple.photo"));
    +[PICompositionSerializerFormatVersion adjustmentDataFormatVersionForComposition:](PICompositionSerializerFormatVersion, "adjustmentDataFormatVersionForComposition:", v91);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setFormatVersion:", v64);

    objc_msgSend(v63, "setData:", v62);
  }
  else
  {
    v63 = 0;
  }
  v66 = v87;

LABEL_61:
  return v63;
}

+ (BOOL)validateAdjustmentsEnvelope:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  id v20;
  id v21;
  _QWORD v22[3];
  _QWORD v23[3];
  _QWORD v24[3];
  _QWORD v25[4];

  v25[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v24[0] = CFSTR("metadata");
  v25[0] = objc_opt_class();
  v24[1] = CFSTR("formatVersion");
  v25[1] = objc_opt_class();
  v24[2] = CFSTR("adjustments");
  v25[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E5058D28);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v9 = objc_msgSend(a1, "_validateValueTypesForKeys:requiredKeys:inDictionary:error:", v7, v8, v6, &v21);
  v10 = v21;
  v11 = v10;
  if ((v9 & 1) != 0)
  {
    v22[0] = CFSTR("masterHeight");
    v23[0] = objc_opt_class();
    v22[1] = CFSTR("masterWidth");
    v23[1] = objc_opt_class();
    v22[2] = CFSTR("orientation");
    v23[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v12, "allKeys");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("metadata"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v17 = objc_msgSend(a1, "_validateValueTypesForKeys:requiredKeys:inDictionary:error:", v12, v15, v16, &v20);
    v18 = v20;

    if (a4 && (v17 & 1) == 0)
      *a4 = objc_retainAutorelease(v18);

  }
  else if (a4)
  {
    v18 = objc_retainAutorelease(v10);
    v17 = 0;
    *a4 = v18;
  }
  else
  {
    v17 = 0;
    v18 = v10;
  }

  return v17;
}

+ (BOOL)_validateValueTypesForKeys:(id)a3 requiredKeys:(id)a4 inDictionary:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 1;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __86__PICompositionSerializer__validateValueTypesForKeys_requiredKeys_inDictionary_error___block_invoke;
  v16[3] = &unk_1E5015708;
  v12 = v11;
  v17 = v12;
  v13 = v10;
  v18 = v13;
  v19 = &v21;
  v20 = &v27;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v16);
  if (a6)
    *a6 = objc_retainAutorelease((id)v22[5]);
  v14 = *((_BYTE *)v28 + 24);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v14;
}

+ (id)serializeDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  const void **v13;
  void *specific;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  void *v18;
  const void **v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    NUAssertLogger_1319();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "dictionary != nil");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v12;
      _os_log_error_impl(&dword_1A6382000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v13 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_1319();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (!specific)
    {
      if (!v16)
        goto LABEL_23;
      goto LABEL_17;
    }
    if (v16)
    {
      v24 = dispatch_get_specific(*v13);
      v25 = (void *)MEMORY[0x1E0CB3978];
      v26 = v24;
      objc_msgSend(v25, "callStackSymbols");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v37 = v24;
      v38 = 2114;
      v39 = v28;
      _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_23:

    _NUAssertFailHandler();
    __break(1u);
    JUMPOUT(0x1A639A980);
  }
  if (!a4)
  {
    NUAssertLogger_1319();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v18;
      _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v19 = (const void **)MEMORY[0x1E0D51D48];
    v20 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_1319();
    v15 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (v20)
    {
      if (v21)
      {
        v29 = dispatch_get_specific(*v19);
        v30 = (void *)MEMORY[0x1E0CB3978];
        v31 = v29;
        objc_msgSend(v30, "callStackSymbols");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v37 = v29;
        v38 = 2114;
        v39 = v33;
        _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v21)
    {
LABEL_17:
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v23;
      _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      goto LABEL_23;
    }
    goto LABEL_23;
  }
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v5, 0, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v35 = 0;
    objc_msgSend(MEMORY[0x1E0D75350], "compressData:options:error:", v7, 0, &v35);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v35;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to compress composition data"), v6, v9);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)deserializeDictionaryFromData:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  const void **v11;
  void *specific;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  const void **v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    NUAssertLogger_1319();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "data != nil");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v10;
      _os_log_error_impl(&dword_1A6382000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v11 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_1319();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (!specific)
    {
      if (!v14)
        goto LABEL_22;
      goto LABEL_16;
    }
    if (v14)
    {
      v22 = dispatch_get_specific(*v11);
      v23 = (void *)MEMORY[0x1E0CB3978];
      v24 = v22;
      objc_msgSend(v23, "callStackSymbols");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v22;
      v35 = 2114;
      v36 = v26;
      _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_22:

    _NUAssertFailHandler();
    __break(1u);
    JUMPOUT(0x1A639AEA0);
  }
  if (!a4)
  {
    NUAssertLogger_1319();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v16;
      _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v17 = (const void **)MEMORY[0x1E0D51D48];
    v18 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_1319();
    v13 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (v18)
    {
      if (v19)
      {
        v27 = dispatch_get_specific(*v17);
        v28 = (void *)MEMORY[0x1E0CB3978];
        v29 = v27;
        objc_msgSend(v28, "callStackSymbols");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "componentsJoinedByString:", CFSTR("\n"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v34 = v27;
        v35 = 2114;
        v36 = v31;
        _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v19)
    {
LABEL_16:
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v21;
      _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      goto LABEL_22;
    }
    goto LABEL_22;
  }
  v6 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D75350], "decompressData:options:error:", v6, 0, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 0, a4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "mismatchError:object:", CFSTR("Data object is not of the correct type"), v6);
    v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (void)_sanitizeComposition:(id)a3
{
  PICompositionController *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *specific;
  void *v27;
  void *v28;
  os_log_t log;
  NSObject *loga;
  PICompositionController *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v3 = -[PICompositionController initWithComposition:]([PICompositionController alloc], "initWithComposition:", v32);
  -[PICompositionController compositionKeys](v3, "compositionKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v34;
    v31 = v3;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v34 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v8);
        if ((objc_msgSend(v9, "isEqualToString:", CFSTR("orientation"), v24, v25) & 1) == 0
          && (objc_msgSend(v9, "isEqualToString:", CFSTR("mute")) & 1) == 0)
        {
          -[PICompositionController adjustmentControllerForKey:](v3, "adjustmentControllerForKey:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "_isDefault"))
          {
            objc_msgSend(v32, "debugDescription");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "setObject:forKeyedSubscript:", 0, v9);
            if (*MEMORY[0x1E0D52390] != -1)
              dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_1309);
            v12 = (void *)*MEMORY[0x1E0D52380];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52380], OS_LOG_TYPE_DEFAULT))
            {
              v13 = (void *)MEMORY[0x1E0CB3940];
              v14 = v12;
              objc_msgSend(v13, "stringWithFormat:", CFSTR("Adjustment for %@ is identity\n%@"), v9, v11);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v38 = v15;
              _os_log_impl(&dword_1A6382000, v14, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

              v16 = *MEMORY[0x1E0D52390];
            }
            else
            {
              v16 = -1;
            }
            if (dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
            {
              if (v16 != -1)
                dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_1309);
              v17 = (void *)*MEMORY[0x1E0D52380];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52380], OS_LOG_TYPE_ERROR))
              {
                specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
                v18 = (void *)MEMORY[0x1E0CB3978];
                log = specific;
                v19 = v17;
                objc_msgSend(v18, "callStackSymbols");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v38 = specific;
                v39 = 2114;
                v40 = v20;
                _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

              }
            }
            else
            {
              if (v16 != -1)
                dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_1309);
              v21 = (void *)*MEMORY[0x1E0D52380];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52380], OS_LOG_TYPE_ERROR))
              {
                v22 = (void *)MEMORY[0x1E0CB3978];
                loga = v21;
                objc_msgSend(v22, "callStackSymbols");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v38 = v23;
                _os_log_error_impl(&dword_1A6382000, loga, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

              }
            }
            v24 = v9;
            v25 = v11;
            _NUAssertContinueHandler();

            v3 = v31;
          }

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v6);
  }

}

+ (id)adjustmentInformationForComposition:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a1, "adjustmentInformationForComposition:skipMetadata:error:", a3, 0, a4);
}

+ (id)adjustmentInformationForComposition:(id)a3 skipMetadata:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  _QWORD v31[4];
  _QWORD v32[5];

  v6 = a4;
  v32[4] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (void *)_CFCopySystemVersionDictionary();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AB90]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PICompositionSerializer.m"), 638, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("composition"));

  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "infoDictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", CFSTR("CFBundleVersion"));
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  v16 = &stru_1E501A310;
  if (v14)
    v16 = (__CFString *)v14;
  v17 = v16;

  v31[0] = CFSTR("platform");
  v31[1] = CFSTR("buildNumber");
  v32[0] = CFSTR("iOS");
  v32[1] = v11;
  v31[2] = CFSTR("appVersion");
  v31[3] = CFSTR("schemaRevision");
  v32[2] = v17;
  v32[3] = &unk_1E5051040;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  +[PICompositionSerializer _serializeComposition:versionInfo:skipMetadata:error:](PICompositionSerializer, "_serializeComposition:versionInfo:skipMetadata:error:", v9, v18, v6, &v28);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = v28;
  v21 = v20;
  if (v19)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "data");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v23, CFSTR("adjustmentData"));

    objc_msgSend(v19, "formatIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v24, CFSTR("adjustmentFormatIdentifier"));

    objc_msgSend(v19, "formatVersion");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v25, CFSTR("adjustmentFormatVersion"));

  }
  else
  {
    if (a5)
      *a5 = objc_retainAutorelease(v20);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v30 = v21;
      _os_log_error_impl(&dword_1A6382000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to serialize finalized composition: %{public}@", buf, 0xCu);
    }
    v22 = 0;
  }

  return v22;
}

void __86__PICompositionSerializer__validateValueTypesForKeys_requiredKeys_inDictionary_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int isKindOfClass;
  int v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;

  v21 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    isKindOfClass = objc_opt_isKindOfClass();
    v9 = 0;
  }
  else
  {
    v9 = objc_msgSend(*(id *)(a1 + 40), "containsObject:", v21);
    isKindOfClass = 1;
  }
  v10 = objc_opt_class() != a3 && objc_opt_class() != a3;
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", CFSTR("Missing required key"), v21);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    *a4 = 1;
  }
  else if (((isKindOfClass | v10) & 1) == 0)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("Value for key %@ has type %@; expected type %@"), v21, v16, a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D520A0], "mismatchError:object:", v17, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    *a4 = 1;

  }
}

void __85__PICompositionSerializer_serializeComposition_versionInfo_serializerMetadata_error___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if ((objc_msgSend(a1[4], "containsObject:", v8) & 1) == 0)
  {
    objc_msgSend(a1[5], "objectForKeyedSubscript:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(a1[5], "objectForKeyedSubscript:", v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v7, v5);

    }
  }

}

void __85__PICompositionSerializer_serializeComposition_versionInfo_serializerMetadata_error___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if ((objc_msgSend(a1[4], "containsObject:", v8) & 1) == 0)
  {
    objc_msgSend(a1[5], "objectForKeyedSubscript:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(a1[5], "objectForKeyedSubscript:", v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v7, v5);

    }
  }

}

void __123__PICompositionSerializer_deserializeCompositionFromAdjustments_metadata_formatIdentifier_formatVersion_sidecarData_error___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if ((objc_msgSend(a1[4], "containsObject:", v8) & 1) == 0)
  {
    objc_msgSend(a1[5], "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(a1[6], "objectForKeyedSubscript:", v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7
        || (objc_msgSend(a1[7], "objectForKeyedSubscript:", v8),
            (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        objc_msgSend(a1[5], "setObject:forKeyedSubscript:", v7, v5);

      }
    }
  }

}

@end
