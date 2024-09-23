@implementation TXRAssetCatalogParser

+ (BOOL)exportSetConfig:(id)a3 face:(unsigned int)a4 directoryPath:(id)a5 error:(id *)a6
{
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  TXRImageIndependent *v28;
  TXRImageIndependent *v29;
  void *v30;
  double v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  BOOL v40;
  double v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  id *v48;
  id v49;
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[3];
  _QWORD v53[5];

  v8 = *(_QWORD *)&a4;
  v53[3] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v49 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v52[0] = CFSTR("info");
  v52[1] = CFSTR("properties");
  v53[0] = &unk_1E9783EA8;
  v53[1] = v11;
  v52[2] = CFSTR("levels");
  v53[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "mipmapOption") != 2)
  {
    if (objc_msgSend(v9, "mipmapOption") == 3)
      +[TXRAssetCatalogParser exportSetConfig:face:directoryPath:error:].cold.1(v11);
    if (objc_msgSend(v9, "mipmapOption") == 1)
      +[TXRAssetCatalogParser exportSetConfig:face:directoryPath:error:].cold.2(v11);
    if (!objc_msgSend(v9, "mipmapOption"))
      objc_msgSend(v11, "setObject:forKeyedSubscript:", CFSTR("none"), CFSTR("level-mode"));
  }
  if (!objc_msgSend(v9, "mipmapOption") || objc_msgSend(v9, "mipmapOption") == 2)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("level-0"));
    objc_msgSend(v9, "texture");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "cubemap");

    if (v15)
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" face-%d"), v8);
      objc_msgSend(v13, "appendString:", v16);

    }
    objc_msgSend(v9, "baseFileAttributes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "fileFormat");

    v47 = v10;
    v48 = a6;
    v45 = v12;
    v46 = v11;
    if (v18)
    {
      if (v18 != 1)
      {
        v43 = 0;
        goto LABEL_16;
      }
      v19 = (uint64_t *)MEMORY[0x1E0CA5BA8];
      v20 = CFSTR(".jpg");
    }
    else
    {
      v19 = (uint64_t *)MEMORY[0x1E0CA5C10];
      v20 = CFSTR(".png");
    }
    objc_msgSend(v13, "appendString:", v20);
    v43 = *v19;
LABEL_16:
    v50[0] = CFSTR("filename");
    v50[1] = CFSTR("mipmap-level");
    v51[0] = v13;
    v51[1] = CFSTR("base");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 2);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "texture");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "mipmapLevels");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "elements");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "faces");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectAtIndexedSubscript:", v8);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = v27;
    }
    else
    {
      v29 = [TXRImageIndependent alloc];
      objc_msgSend(v9, "texture");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "dimensions");
      v42 = v31;
      objc_msgSend(v9, "texture");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "pixelFormat");
      objc_msgSend(v9, "texture");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[TXRImageIndependent initWithImage:dimensions:pixelFormat:alphaInfo:](v29, "initWithImage:dimensions:pixelFormat:alphaInfo:", v27, v33, objc_msgSend(v34, "alphaInfo"), v42);

    }
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@/%@"), v49, v13);
    v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", v35, 0);
    objc_msgSend(v9, "baseFileAttributes");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "colorSpace");
    objc_msgSend(v9, "baseFileAttributes");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    a6 = v48;
    +[TXRParserImageIO exportImage:url:uttype:colorSpace:orientation:error:](TXRParserImageIO, "exportImage:url:uttype:colorSpace:orientation:error:", v28, v36, v43, v38, objc_msgSend(v39, "exifOrientation"), v48);

    v10 = v47;
    objc_msgSend(v47, "addObject:", v44);

    v12 = v45;
    v11 = v46;
  }
  v40 = writeContentsJsonAtPath(v12, v49, (uint64_t)a6);

  return v40;
}

+ (id)exportSet:(id)a3 location:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  char v28;
  id v29;
  void *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  const __CFString *v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  int v48;
  uint64_t v49;
  void *v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const __CFString *v58;
  const __CFString *v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  id v63;
  id v64;
  uint64_t v65;
  void *v66;
  BOOL v67;
  void *v68;
  void *v69;
  int v70;
  void *v71;
  id v72;
  void *v73;
  uint64_t v74;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  id v79;
  void *v80;
  id v81;
  id v82;
  id v83;
  void *v84;
  void *v85;
  int v86;
  int v87;
  id v88;
  id *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  char v99;
  _BYTE v100[128];
  _QWORD v101[2];
  _QWORD v102[2];
  const __CFString *v103;
  _QWORD v104[3];

  v104[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "configs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "texture");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "cubemap");

  v13 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v85 = v8;
  objc_msgSend(v8, "absoluteString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  v87 = v12;
  if (v12)
    v17 = CFSTR("%@/%@.cubetextureset");
  else
    v17 = CFSTR("%@/%@.textureset");
  v18 = (void *)objc_msgSend(v13, "initWithFormat:", v17, v14, v15);

  v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@/Contents.json"), v18);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v99 = 0;
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = a5;
  v84 = (void *)v19;
  if (!objc_msgSend(v94, "fileExistsAtPath:isDirectory:", v19, &v99) || v99)
  {
    objc_msgSend(v7, "name");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "componentsSeparatedByString:", CFSTR("/"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = objc_alloc(MEMORY[0x1E0CB37A0]);
    objc_msgSend(v85, "absoluteString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v25, "initWithFormat:", CFSTR("%@"), v26);

    if (objc_msgSend(v24, "count") != 1)
    {
      v31 = 0;
      v28 = 1;
      while (1)
      {
        objc_msgSend(v27, "appendString:", CFSTR("/"));
        v32 = v24;
        objc_msgSend(v24, "objectAtIndexedSubscript:", v31);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "appendString:", v33);

        if (!objc_msgSend(v94, "fileExistsAtPath:isDirectory:", v27, &v99) || !v99)
        {
          if ((objc_msgSend(v94, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v27, v28 & 1, 0, v89) & 1) == 0)
          {
            _newTXRErrorWithCodeAndErrorString(5, (uint64_t)CFSTR("Could not create folder hierarchy for texture name"));
            *v89 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_101;
          }
          v103 = CFSTR("info");
          v104[0] = &unk_1E9783EA8;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v104, &v103, 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (!writeContentsJsonAtPath(v34, v27, (uint64_t)v89))
          {
            _newTXRErrorWithCodeAndErrorString(5, (uint64_t)CFSTR("Could not create Content.json for hierarchy of texture name"));
            *v89 = (id)objc_claimAutoreleasedReturnValue();

LABEL_101:
            v29 = 0;
            v88 = 0;
            v30 = 0;
            v20 = v32;
            v22 = 0;
LABEL_102:

            goto LABEL_107;
          }

          v28 = 0;
        }
        ++v31;
        v24 = v32;
        if (v31 >= objc_msgSend(v32, "count") - 1)
          goto LABEL_19;
      }
    }
    v28 = 1;
LABEL_19:
    v35 = v28 & 1;
    a5 = v89;
    objc_msgSend(v94, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v18, v35, 0, v89);
    v36 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v7, "configs");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v36, "initWithCapacity:", objc_msgSend(v37, "count"));

    v101[0] = CFSTR("info");
    v101[1] = CFSTR("textures");
    v102[0] = &unk_1E9783EA8;
    v102[1] = v38;
    v88 = (id)v38;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v102, v101, 2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v39);

    if (!objc_msgSend(v7, "interpretation"))
    {
      v29 = 0;
LABEL_27:
      v22 = (id)v40;
      goto LABEL_28;
    }
LABEL_20:
    v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
LABEL_21:
    if (objc_msgSend(v7, "interpretation") == 1)
    {
      v41 = CFSTR("non-premultiplied-colors");
    }
    else
    {
      if (objc_msgSend(v7, "interpretation") != 2)
        +[TXRAssetCatalogParser exportSet:location:error:].cold.2();
      v41 = CFSTR("data");
    }
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v41, CFSTR("interpretation"));
    goto LABEL_27;
  }
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DB0]), "initWithFileAtPath:", v19);
  objc_msgSend(v20, "open");
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithStream:options:error:", v20, 1, a5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "close");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = v21;
  }
  else
  {
    if (a5)
    {
      _newTXRErrorWithCodeAndErrorString(3, (uint64_t)CFSTR("Unexpected format of Contents.json"));
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      v29 = 0;
      v88 = 0;
      v22 = 0;
      v30 = 0;
      goto LABEL_102;
    }
    v22 = 0;
  }
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("properties"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  if (v68)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v82 = v68;
      goto LABEL_92;
    }
    if (a5)
    {
      v69 = v20;
      _newTXRErrorWithCodeAndErrorString(3, (uint64_t)CFSTR("Value of properties key is not an object"));
      v82 = 0;
      v88 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      v70 = 1;
      goto LABEL_105;
    }
  }
  v82 = 0;
LABEL_92:
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("textures"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  if (v71)
  {
    objc_opt_class();
    v69 = v20;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a5)
      {
        _newTXRErrorWithCodeAndErrorString(3, (uint64_t)CFSTR("Value of textures key is not an array"));
        v88 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        v70 = 1;
      }
      else
      {
        v70 = 0;
        v88 = 0;
      }
      goto LABEL_104;
    }
    v88 = v71;
  }
  else
  {
    v69 = v20;
    v72 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v7, "configs");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend(v72, "initWithCapacity:", objc_msgSend(v73, "count"));

    v88 = (id)v74;
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v74, CFSTR("textures"));
  }
  v70 = 0;
LABEL_104:

LABEL_105:
  if (v70)
  {
    v30 = 0;
    v29 = v82;
    goto LABEL_107;
  }
  v29 = v82;
  if (objc_msgSend(v7, "interpretation"))
  {
    v40 = (uint64_t)v22;
    if (v82)
      goto LABEL_21;
    goto LABEL_20;
  }
  if (v82)
    objc_msgSend(v82, "removeObjectForKey:", CFSTR("interpretation"));
LABEL_28:
  if (objc_msgSend(v7, "origin") == 1)
  {
    if (v29)
    {
      objc_msgSend(v29, "setObject:forKeyedSubscript:", CFSTR("bottom-left"), CFSTR("origin"));
LABEL_34:
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v29, CFSTR("properties"));
      goto LABEL_35;
    }
    v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v29, "setObject:forKeyedSubscript:", CFSTR("bottom-left"), CFSTR("origin"));
    if (v29)
      goto LABEL_34;
  }
  else if (v29)
  {
    objc_msgSend(v29, "removeObjectForKey:", CFSTR("origin"));
    goto LABEL_34;
  }
LABEL_35:
  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  objc_msgSend(v7, "configs");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v95, v100, 16);
  if (v77)
  {
    if (v87)
      v42 = 6;
    else
      v42 = 1;
    v86 = v42;
    v43 = *(_QWORD *)v96;
    v81 = v29;
    v83 = v7;
    v79 = v22;
    v80 = v20;
    v76 = *(_QWORD *)v96;
    while (1)
    {
      v44 = 0;
LABEL_41:
      if (*(_QWORD *)v96 != v43)
      {
        v45 = v44;
        objc_enumerationMutation(v20);
        v44 = v45;
      }
      v78 = v44;
      v46 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * v44);
      objc_msgSend(v46, "texture");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "cubemap");

      if (v87 != v48)
        break;
      v49 = 0;
      do
      {
        v50 = v18;
        v51 = objc_msgSend(v46, "idiom");
        if (v51 > 5)
        {
          v52 = 0;
          v53 = 0;
        }
        else
        {
          v52 = (uint64_t)*(&off_1E977F5F0 + v51);
          v53 = (uint64_t)*(&off_1E977F620 + v51);
        }
        v54 = objc_msgSend(v46, "graphicsFeatureSet") - 1;
        if (v54 > 3)
        {
          v93 = 0;
          v91 = 0;
        }
        else
        {
          v93 = (uint64_t)*(&off_1E977F650 + v54);
          v91 = (uint64_t)*(&off_1E977F670 + v54);
        }
        v55 = objc_msgSend(v46, "memory") - 1;
        if (v55 > 3)
        {
          v90 = 0;
          v56 = 0;
        }
        else
        {
          v90 = (uint64_t)*(&off_1E977F690 + v55);
          v56 = (uint64_t)*(&off_1E977F6B0 + v55);
        }
        v57 = objc_msgSend(v46, "displayColorSpace");
        v58 = CFSTR("sRGB");
        if (v57 != 1)
          v58 = 0;
        if (v57 == 2)
          v59 = CFSTR("P3");
        else
          v59 = v58;
        v60 = 0;
        v61 = objc_msgSend(v46, "scaleFactor") - 1;
        if (v61 <= 2)
          v60 = (uint64_t)*(&off_1E977F6D0 + v61);
        v62 = objc_msgSend(v46, "pixelFormat");
        if ((unint64_t)(v62 - 1) > 0xB)
          v92 = 0;
        else
          v92 = (uint64_t)*(&off_1E977F6E8 + v62 - 1);
        v63 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
        v64 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v64, "setObject:forKeyedSubscript:", v53, CFSTR("idiom"));
        objc_msgSend(v63, "setString:", v52);
        v18 = v50;
        if (v87)
        {
          if (v49 >= 6u)
            +[TXRAssetCatalogParser exportSet:location:error:].cold.1();
          v65 = (uint64_t)*(&off_1E977F748 + (char)v49);
          objc_msgSend(v64, "setObject:forKeyedSubscript:", *(&off_1E977F778 + (char)v49), CFSTR("cube-face"));
          objc_msgSend(v63, "appendString:", CFSTR(" "));
          objc_msgSend(v63, "appendString:", v65);
        }
        if (objc_msgSend(v46, "memory"))
        {
          objc_msgSend(v64, "setObject:forKeyedSubscript:", v56, CFSTR("memory"));
          objc_msgSend(v63, "appendString:", CFSTR(" "));
          objc_msgSend(v63, "appendString:", v90);
        }
        if (objc_msgSend(v46, "graphicsFeatureSet"))
        {
          objc_msgSend(v64, "setObject:forKeyedSubscript:", v91, CFSTR("graphics-feature-set"));
          objc_msgSend(v63, "appendString:", CFSTR(" "));
          objc_msgSend(v63, "appendString:", v93);
        }
        if (objc_msgSend(v46, "displayColorSpace"))
        {
          objc_msgSend(v64, "setObject:forKeyedSubscript:", v59, CFSTR("color-space"));
          objc_msgSend(v63, "appendString:", CFSTR(" "));
          objc_msgSend(v63, "appendString:", v59);
        }
        if (objc_msgSend(v46, "scaleFactor"))
        {
          objc_msgSend(v64, "setObject:forKeyedSubscript:", v60, CFSTR("scale"));
          objc_msgSend(v63, "appendString:", CFSTR(" "));
          objc_msgSend(v63, "appendString:", v60);
        }
        if (objc_msgSend(v46, "pixelFormat"))
          objc_msgSend(v64, "setObject:forKeyedSubscript:", v92, CFSTR("pixel-format"));
        objc_msgSend(v63, "appendString:", CFSTR(".mipmapset"));
        objc_msgSend(v64, "setObject:forKeyedSubscript:", v63, CFSTR("filename"));
        objc_msgSend(v88, "addObject:", v64);
        v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@/%@"), v50, v63);
        a5 = v89;
        objc_msgSend(v94, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v66, 1, 0, v89);
        v67 = +[TXRAssetCatalogParser exportSetConfig:face:directoryPath:error:](TXRAssetCatalogParser, "exportSetConfig:face:directoryPath:error:", v46, v49, v66, v89);

        if (!v67)
        {
          v30 = 0;
          v29 = v81;
          v7 = v83;
          v22 = v79;
          v20 = v80;
          goto LABEL_102;
        }
        v49 = (v49 + 1);
      }
      while (v86 != (_DWORD)v49);
      v44 = v78 + 1;
      v29 = v81;
      v7 = v83;
      v22 = v79;
      v20 = v80;
      v43 = v76;
      if (v78 + 1 != v77)
        goto LABEL_41;
      v77 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v95, v100, 16);
      if (!v77)
        goto LABEL_81;
    }
    _newTXRErrorWithCodeAndErrorString(7, (uint64_t)CFSTR("Inconsistant set specifed.  Some mipmapsets specified are cubemap textures while other mipmapsets are 2D textures"));
    v30 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    v29 = v81;
    v7 = v83;
    goto LABEL_102;
  }
LABEL_81:

  if (writeContentsJsonAtPath(v22, v18, (uint64_t)a5))
  {
    objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("%20"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v20);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_102;
  }
  v30 = 0;
LABEL_107:

  return v30;
}

+ (void)exportSetConfig:(void *)a1 face:directoryPath:error:.cold.1(void *a1)
{
  objc_msgSend(a1, "setObject:forKeyedSubscript:", CFSTR("fixed"), CFSTR("level-mode"));
  __assert_rtn("+[TXRAssetCatalogParser exportSetConfig:face:directoryPath:error:]", "TXRAssetCatalogParser.m", 76, "!\"TODO: Iterate through MipFileAttributes list\");
}

+ (void)exportSetConfig:(void *)a1 face:directoryPath:error:.cold.2(void *a1)
{
  objc_msgSend(a1, "setObject:forKeyedSubscript:", CFSTR("fixed"), CFSTR("level-mode"));
  __assert_rtn("+[TXRAssetCatalogParser exportSetConfig:face:directoryPath:error:]", "TXRAssetCatalogParser.m", 82, "!\"TODO: Iterate through all mipmaps of given face output images and write stuff\");
}

+ (void)exportSet:location:error:.cold.1()
{
  __assert_rtn("+[TXRAssetCatalogParser exportSet:location:error:]", "TXRAssetCatalogParser.m", 545, "!\"Invalid face index\");
}

+ (void)exportSet:location:error:.cold.2()
{
  __assert_rtn("+[TXRAssetCatalogParser exportSet:location:error:]", "TXRAssetCatalogParser.m", 311, "TXRAssetInterpretationData == set.interpretation");
}

@end
