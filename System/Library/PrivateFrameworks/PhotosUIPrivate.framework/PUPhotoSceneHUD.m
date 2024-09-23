@implementation PUPhotoSceneHUD

- (PUPhotoSceneHUD)initWithPhoto:(id)a3
{
  id v4;
  PUPhotoSceneHUD *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v24;
  id v25;
  id v26;
  PUPhotoSceneHUD *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)PUPhotoSceneHUD;
  v5 = -[PUPhotoSceneHUD initWithFrame:](&v32, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = objc_alloc_init(MEMORY[0x1E0D7B4D8]);
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBorderWidth:", 1.0);

  objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = objc_msgSend(v8, "CGColor");
  objc_msgSend(v6, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBorderColor:", v9);

  -[PUPhotoSceneHUD addSubview:](v5, "addSubview:", v6);
  objc_storeStrong((id *)&v5->_hudView, v6);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v25 = v6;
    v26 = v4;
    v27 = v5;
    v11 = v4;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v24 = v11;
    objc_msgSend(v11, "fileURLsForDiagnosticFiles");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v29 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v18, "path");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v12, "fileExistsAtPath:", v19) & 1) != 0)
          {
            objc_msgSend(v18, "path");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "lowercaseString");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "hasSuffix:", CFSTR("mdata"));

            if (v22)
            {
              objc_storeStrong((id *)&v27->_mdataURL, v18);
              goto LABEL_13;
            }
          }
          else
          {

          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v15);
    }
LABEL_13:

    v4 = v26;
    v5 = v27;
    v6 = v25;
  }

  return v5;
}

- (void)update
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  float v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t k;
  void *v51;
  id v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  float v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  id v82;
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  -[PUPhotoSceneHUD hudView](self, "hudView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoSceneHUD mdataURL](self, "mdataURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v22 = CFSTR("Could not find MDATA file.");
LABEL_16:
    v7 = objc_alloc_init(MEMORY[0x1E0D7B4E0]);
    objc_msgSend(v7, "setTitle:", v22);
    objc_msgSend(v3, "addVisualization:", v7);
    goto LABEL_39;
  }
  v5 = (void *)MEMORY[0x1E0C99D50];
  -[PUPhotoSceneHUD mdataURL](self, "mdataURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataWithContentsOfURL:options:error:", v6, 2, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v22 = CFSTR("Could not read MDATA file.");
    goto LABEL_16;
  }
  v82 = 0;
  objc_msgSend(MEMORY[0x1E0D750D8], "deserializedMetadataFromData:error:", v7, &v82);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v82;
  v10 = v9;
  if (!v8)
  {

    v22 = CFSTR("Could not deserialize MDATA.");
    goto LABEL_16;
  }
  objc_msgSend(v8, "semanticDevelopmentGatingObservations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v10;
  v69 = v7;
  v66 = v11;
  v67 = v8;
  if (objc_msgSend(v11, "count"))
  {
    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v78, v85, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v79;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v79 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * i);
          v18 = objc_alloc_init(MEMORY[0x1E0D7B4C8]);
          objc_msgSend(v17, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setTitle:", v19);

          v20 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v17, "confidence");
          objc_msgSend(v20, "numberWithFloat:");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setValue:", v21);

          objc_msgSend(v3, "addVisualization:", v18);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v78, v85, 16);
      }
      while (v14);
      v7 = v69;
      v11 = v66;
      v8 = v67;
    }
  }
  else
  {
    v12 = objc_alloc_init(MEMORY[0x1E0D7B4E0]);
    objc_msgSend(v12, "setTitle:", CFSTR("No scene detected"));
    objc_msgSend(v3, "addVisualization:", v12);
  }

  objc_msgSend(v8, "foodAndDrinkObservations");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "count"))
  {
    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    v24 = v23;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v74, v84, 16);
    if (v25)
    {
      v26 = v25;
      v65 = v23;
      v27 = *(_QWORD *)v75;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v75 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * j);
          v30 = objc_alloc_init(MEMORY[0x1E0D7B4C8]);
          objc_msgSend(v29, "labels");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "firstObject");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "identifier");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setTitle:", v33);

          v34 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v29, "boundingBox");
          v36 = v35;
          objc_msgSend(v29, "boundingBox");
          v38 = v37;
          objc_msgSend(v29, "boundingBox");
          v40 = v39;
          objc_msgSend(v29, "boundingBox");
          v42 = v41;
          objc_msgSend(v29, "confidence");
          objc_msgSend(v34, "stringWithFormat:", CFSTR("(%.3f, %.3f, %.3f, %.3f) %.3f"), v36, v38, v40, v42, v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setValue:", v44);

          objc_msgSend(v3, "addVisualization:", v30);
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v74, v84, 16);
      }
      while (v26);
      v10 = v68;
      v7 = v69;
      v11 = v66;
      v8 = v67;
      v23 = v65;
    }
  }
  else
  {
    v24 = objc_alloc_init(MEMORY[0x1E0D7B4E0]);
    objc_msgSend(v24, "setTitle:", CFSTR("No food/drink detected"));
    objc_msgSend(v3, "addVisualization:", v24);
  }

  objc_msgSend(v8, "faceObservations");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v45, "count"))
  {
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v46 = v45;
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
    if (v47)
    {
      v48 = v47;
      v64 = v45;
      v49 = *(_QWORD *)v71;
      do
      {
        for (k = 0; k != v48; ++k)
        {
          if (*(_QWORD *)v71 != v49)
            objc_enumerationMutation(v46);
          v51 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * k);
          v52 = objc_alloc_init(MEMORY[0x1E0D7B4C8]);
          objc_msgSend(v52, "setTitle:", CFSTR("Face"));
          v53 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v51, "boundingBox");
          v55 = v54;
          objc_msgSend(v51, "boundingBox");
          v57 = v56;
          objc_msgSend(v51, "boundingBox");
          v59 = v58;
          objc_msgSend(v51, "boundingBox");
          v61 = v60;
          objc_msgSend(v51, "confidence");
          objc_msgSend(v53, "stringWithFormat:", CFSTR("(%.3f, %.3f, %.3f, %.3f) %.3f"), v55, v57, v59, v61, v62);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "setValue:", v63);

          objc_msgSend(v3, "addVisualization:", v52);
        }
        v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
      }
      while (v48);
      v10 = v68;
      v7 = v69;
      v11 = v66;
      v8 = v67;
      v45 = v64;
    }
  }
  else
  {
    v46 = objc_alloc_init(MEMORY[0x1E0D7B4E0]);
    objc_msgSend(v46, "setTitle:", CFSTR("No faces detected"));
    objc_msgSend(v3, "addVisualization:", v46);
  }

LABEL_39:
}

- (PXHUDView)hudView
{
  return self->_hudView;
}

- (NSURL)mdataURL
{
  return self->_mdataURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mdataURL, 0);
  objc_storeStrong((id *)&self->_hudView, 0);
}

@end
