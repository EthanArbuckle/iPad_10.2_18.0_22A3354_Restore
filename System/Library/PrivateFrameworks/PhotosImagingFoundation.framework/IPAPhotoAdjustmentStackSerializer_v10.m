@implementation IPAPhotoAdjustmentStackSerializer_v10

- (id)dataFromPhotoAdjustmentStack:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  id v44;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  IPAPhotoAdjustmentStackSerializer_v10 *v51;
  void *v52;
  id *v53;
  id v54;
  void *v55;
  id obj;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "pipeline");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)objc_opt_new();
    objc_msgSend(v13, "string");
    v15 = objc_claimAutoreleasedReturnValue();
    v51 = self;
    v49 = (void *)v15;
    if (v15)
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("pipelineVersion"));
    else
      _PFAssertContinueHandler();
    v52 = v13;
    v53 = a4;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "orientation"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, CFSTR("orientation"));

    v19 = objc_msgSend(v6, "inputSize");
    v21 = v20;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v22, CFSTR("masterWidth"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v23, CFSTR("masterHeight"));

    v24 = (void *)objc_opt_new();
    v50 = v14;
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v14, CFSTR("metadata"));
    objc_msgSend(v6, "versionInfo");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
    {
      objc_msgSend(v25, "archivalRepresentation");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v27, CFSTR("versionInfo"));

    }
    v47 = v26;
    v48 = v24;
    v54 = v6;
    v55 = (void *)objc_opt_new();
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    objc_msgSend(v6, "adjustments");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v59;
      do
      {
        v31 = 0;
        do
        {
          if (*(_QWORD *)v59 != v30)
            objc_enumerationMutation(obj);
          v32 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v31);
          objc_msgSend(v32, "identifier", v46, v47);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v33)
          {
            v46 = v32;
LABEL_25:
            _PFAssertContinueHandler();
            goto LABEL_28;
          }
          objc_msgSend(v32, "version");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v34)
          {
            objc_msgSend(v32, "identifier");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            IPAAdjustmentCurrentVersionForIdentifier(v35);
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v34)
            {
              v46 = v54;
              goto LABEL_25;
            }
          }
          objc_msgSend(v34, "archivalRepresentation");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (v36)
          {
            v37 = (void *)objc_opt_new();
            objc_msgSend(v37, "setObject:forKeyedSubscript:", v33, CFSTR("identifier"));
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v32, "enabled"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "setObject:forKeyedSubscript:", v38, CFSTR("enabled"));

            objc_msgSend(v37, "setObject:forKeyedSubscript:", v36, CFSTR("formatVersion"));
            objc_msgSend(v32, "maskUUID");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            if (v39)
              objc_msgSend(v37, "setObject:forKeyedSubscript:", v39, CFSTR("maskUUID"));
            objc_msgSend(v32, "settings");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            if (v40)
              objc_msgSend(v37, "setObject:forKeyedSubscript:", v40, CFSTR("settings"));
            objc_msgSend(v32, "autoSettings");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            if (v41)
              objc_msgSend(v37, "setObject:forKeyedSubscript:", v41, CFSTR("auto"));
            objc_msgSend(v55, "addObject:", v37);

          }
          else
          {
            v46 = v34;
            _PFAssertContinueHandler();
          }

LABEL_28:
          ++v31;
        }
        while (v29 != v31);
        v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
        v29 = v42;
      }
      while (v42);
    }

    v17 = v48;
    objc_msgSend(v48, "setObject:forKeyedSubscript:", v55, CFSTR("adjustments"));
    objc_msgSend(v48, "setObject:forKeyedSubscript:", &unk_1E9876CA0, CFSTR("formatVersion"));

    v16 = 0;
    a4 = v53;
    v6 = v54;
    self = v51;
    v13 = v52;
  }
  else
  {
    IPAAdjustmentError(1000, CFSTR("expected adjustment stack to have a pipeline: %@"), v7, v8, v9, v10, v11, v12, (uint64_t)v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
  }
  v57 = v16;
  -[IPAPhotoAdjustmentStackSerializer_v10 dataFromArchive:error:](self, "dataFromArchive:error:", v17, &v57, v46);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v57;

  if (a4 && v44)
    *a4 = objc_retainAutorelease(v44);

  return v43;
}

- (id)dataFromArchive:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;

  +[IPAAdjustmentStackSerializer dataFromJSON:error:](IPAAdjustmentStackSerializer, "dataFromJSON:error:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[IPAAdjustmentStackSerializer compressData:error:](IPAAdjustmentStackSerializer, "compressData:error:", v5, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)photoAdjustmentFromArchive:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("version"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("formatVersion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("settings"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("enabled"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("PosterFrame")))
  {
    v11 = CFSTR("VideoPosterFrame");

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("frameTime"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v12, CFSTR("time"));
      v13 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v13;
    }

    v14 = (void *)MEMORY[0x1E0C9AAB0];
    v7 = CFSTR("VideoPosterFrame");
  }
  else if (v10)
  {
    v14 = v10;
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0C9AAB0];
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("maskUUID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("auto"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) || !-[__CFString length](v7, "length"))
  {
    v57 = objc_opt_class();
    IPAAdjustmentError(1001, CFSTR("bad input: identifier missing or wrong type: %@, expected NSString"), v25, v26, v27, v28, v29, v30, v57);
LABEL_29:
    v17 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_30;
  }
  if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v58 = objc_opt_class();
    IPAAdjustmentError(1001, CFSTR("bad input: settings missing or wrong type: %@, expected NSDictionary"), v33, v34, v35, v36, v37, v38, v58);
    goto LABEL_29;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v59 = objc_opt_class();
    IPAAdjustmentError(1001, CFSTR("bad input: enabled missing or wrong type: %@, expected NSNumber"), v39, v40, v41, v42, v43, v44, v59);
    goto LABEL_29;
  }
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v15, "length"))
    {
      v60 = objc_opt_class();
      IPAAdjustmentError(1001, CFSTR("bad input: maskUUID is present but wrong type %@, expecting NSString"), v45, v46, v47, v48, v49, v50, v60);
      goto LABEL_29;
    }
  }
  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v61 = objc_opt_class();
      IPAAdjustmentError(1001, CFSTR("bad input: auto settings present but wrong type %@, expecting NSDictionary"), v51, v52, v53, v54, v55, v56, v61);
      goto LABEL_29;
    }
  }
  if (!v8)
  {
    v17 = 0;
LABEL_39:
    v31 = (void *)objc_opt_new();
    objc_msgSend(v31, "setIdentifier:", v7);
    objc_msgSend(v31, "setVersion:", v17);
    objc_msgSend(v31, "setSettings:", v9);
    objc_msgSend(v31, "setEnabled:", objc_msgSend(v14, "BOOLValue"));
    objc_msgSend(v31, "setMaskUUID:", v15);
    objc_msgSend(v31, "setAutoSettings:", v16);

    v17 = 0;
    goto LABEL_33;
  }
  +[IPAAdjustmentVersion versionFromArchivalRepresentation:](IPAAdjustmentVersion, "versionFromArchivalRepresentation:", v8);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (v17)
    goto LABEL_39;
  v18 = objc_opt_class();
  IPAAdjustmentError(1001, CFSTR("bad input: adjustment version wrong type: %@, expected NSNumber|NSString"), v19, v20, v21, v22, v23, v24, v18);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (!v17)
    goto LABEL_39;
LABEL_30:
  v31 = 0;
  if (a4 && v17)
  {
    v17 = objc_retainAutorelease(v17);
    v31 = 0;
    *a4 = v17;
  }
LABEL_33:

  return v31;
}

- (id)photoAdjustmentStackFromData:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  uint64_t v51;
  void *v52;
  id v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  id v69;
  uint64_t v71;
  void *v72;
  id *v73;
  id obj;
  id obja;
  void *v76;
  void *v77;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  id v83;
  id v84;
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v84 = 0;
  +[IPAAdjustmentStackSerializer decompressData:error:](IPAAdjustmentStackSerializer, "decompressData:error:", a3, &v84);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v84;
  if (v6)
  {
    v83 = v7;
    +[IPAAdjustmentStackSerializer JSONFromData:error:](IPAAdjustmentStackSerializer, "JSONFromData:error:", v6, &v83);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (unint64_t)v83;

    if (!v8)
    {
      v29 = 0;
      v28 = 0;
      v37 = 0;
      goto LABEL_55;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v38 = objc_opt_class();
      IPAAdjustmentError(1007, CFSTR("Malformed archive of type: %@"), v39, v40, v41, v42, v43, v44, v38);
      v36 = objc_claimAutoreleasedReturnValue();
      v29 = 0;
      v28 = 0;
      goto LABEL_16;
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("formatVersion"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = v10;
      +[IPAAdjustmentVersion versionFromArchivalRepresentation:](IPAAdjustmentVersion, "versionFromArchivalRepresentation:", v10);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        +[IPAAdjustmentVersion versionForMajor:minor:](IPAAdjustmentVersion, "versionForMajor:minor:", 1, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "isEqualToAdjustmentVersion:", v19);

        if ((v20 & 1) != 0)
        {

          goto LABEL_8;
        }
        IPAAdjustmentError(1007, CFSTR("unsupported version %@"), v21, v22, v23, v24, v25, v26, (uint64_t)v18);
      }
      else
      {
        IPAAdjustmentError(1007, CFSTR("unable to parse stack formatVersion: %@"), v12, v13, v14, v15, v16, v17, v11);
      }
      v54 = objc_claimAutoreleasedReturnValue();

      v29 = 0;
      v28 = 0;
      v37 = 0;
      v9 = v54;
      goto LABEL_54;
    }
LABEL_8:
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("versionInfo"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[IPAAdjustmentVersionInfo versionInfoFromArchivalRepresentation:](IPAAdjustmentVersionInfo, "versionInfoFromArchivalRepresentation:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("adjustments"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v29 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      if (!v9)
      {
        objc_opt_class();
        IPAAdjustmentError(1001, CFSTR("bad input: archived '%@' missing or wrong type: %@"), v30, v31, v32, v33, v34, v35, (uint64_t)CFSTR("adjustments"));
        v36 = objc_claimAutoreleasedReturnValue();
LABEL_16:
        v37 = 0;
        v11 = v9;
        v9 = v36;
LABEL_54:

LABEL_55:
        v7 = (id)v9;
        if (!a4)
          goto LABEL_58;
        goto LABEL_56;
      }
    }
    v45 = objc_msgSend(v29, "count");
    v72 = v28;
    v73 = a4;
    if (!v45)
    {
      v11 = 0;
LABEL_39:
      if (!(v11 | v9))
      {
        objc_msgSend(MEMORY[0x1E0C99D20], "array");
        v11 = objc_claimAutoreleasedReturnValue();
      }
      if (v11)
      {
        v37 = (void *)objc_opt_new();
        objc_msgSend(v37, "setAdjustments:", v11);
        objc_msgSend(v37, "setVersionInfo:", v28);
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("metadata"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("pipelineVersion"));
        v71 = objc_claimAutoreleasedReturnValue();
        +[IPAPhotoAdjustmentPipeline pipelineFromString:](IPAPhotoAdjustmentPipeline, "pipelineFromString:");
        v56 = objc_claimAutoreleasedReturnValue();
        v77 = (void *)v56;
        if (v56)
        {
          objc_msgSend(v37, "setPipeline:", v56);
        }
        else
        {
          +[IPAPhotoAdjustmentPipeline current](IPAPhotoAdjustmentPipeline, "current");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setPipeline:", v57);

        }
        objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("orientation"));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        if (v58
          || (objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("masterOrientation")),
              (v58 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          v59 = v55;
          v60 = objc_msgSend(v58, "integerValue");

        }
        else
        {
          v59 = v55;
          v60 = 0;
        }
        objc_msgSend(v37, "setOrientation:", v60);
        v61 = v59;
        objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("masterWidth"));
        v62 = objc_claimAutoreleasedReturnValue();
        obja = v61;
        objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("masterHeight"));
        v63 = objc_claimAutoreleasedReturnValue();
        v64 = (void *)v63;
        v65 = 0;
        v66 = (void *)v62;
        v67 = 0;
        if (v62)
        {
          v68 = (void *)v71;
          if (v63)
          {
            v65 = objc_msgSend(v66, "integerValue");
            v67 = objc_msgSend(v64, "integerValue");
          }
        }
        else
        {
          v68 = (void *)v71;
        }
        objc_msgSend(v37, "setInputSize:", v65, v67);

        v28 = v72;
        a4 = v73;
      }
      else
      {
        v37 = 0;
      }
      goto LABEL_54;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v45);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v46 = v29;
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v79, v85, 16);
    if (v47)
    {
      v48 = v47;
      obj = v46;
      v49 = *(_QWORD *)v80;
      while (2)
      {
        for (i = 0; i != v48; ++i)
        {
          if (*(_QWORD *)v80 != v49)
            objc_enumerationMutation(obj);
          v51 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * i);
          v78 = (id)v9;
          -[IPAPhotoAdjustmentStackSerializer_v10 photoAdjustmentFromArchive:error:](self, "photoAdjustmentFromArchive:error:", v51, &v78);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = v78;

          if (v52)
            objc_msgSend(v76, "addObject:", v52);

          if (v53)
          {

            v11 = 0;
            v28 = v72;
            a4 = v73;
            goto LABEL_38;
          }
          v9 = 0;
        }
        v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v85, 16);
        v9 = 0;
        if (v48)
          continue;
        break;
      }

      v28 = v72;
    }
    else
    {

      if (v9)
      {
        v11 = 0;
        v53 = (id)v9;
        goto LABEL_37;
      }
    }
    v11 = v76;
    v53 = 0;
LABEL_37:
    a4 = v73;
LABEL_38:

    v9 = (unint64_t)v53;
    goto LABEL_39;
  }
  v29 = 0;
  v28 = 0;
  v8 = 0;
  v37 = 0;
  if (!a4)
    goto LABEL_58;
LABEL_56:
  if (v7)
    *a4 = objc_retainAutorelease(v7);
LABEL_58:
  v69 = v37;

  return v69;
}

- (id)archiveFromData:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;

  +[IPAAdjustmentStackSerializer decompressData:error:](IPAAdjustmentStackSerializer, "decompressData:error:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[IPAAdjustmentStackSerializer JSONFromData:error:](IPAAdjustmentStackSerializer, "JSONFromData:error:", v5, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
