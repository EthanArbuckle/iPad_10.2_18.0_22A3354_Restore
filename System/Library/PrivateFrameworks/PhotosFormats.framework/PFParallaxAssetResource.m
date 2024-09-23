@implementation PFParallaxAssetResource

- (PFParallaxAssetResource)init
{
  PFParallaxAssetResource *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFParallaxAssetResource;
  result = -[PFParallaxAssetResource init](&v3, sel_init);
  result->_orientation = 1;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->_proxyImage);
  v3.receiver = self;
  v3.super_class = (Class)PFParallaxAssetResource;
  -[PFParallaxAssetResource dealloc](&v3, sel_dealloc);
}

- (BOOL)isProxyOnly
{
  return ((-[PFParallaxAssetResource type](self, "type") - 1) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (BOOL)saveToArchiveURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *archiveURL;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  NSURL *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  _QWORD v72[3];

  v72[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
    _PFAssertFailHandler();
  v7 = v6;
  v8 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  v60 = 0;
  v9 = objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v7, 0, 0, &v60);
  v10 = v60;
  if ((v9 & 1) != 0)
  {
    -[PFParallaxAssetResource contentsDictionary](self, "contentsDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v11, 200, 0, &v59);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v59;

    if (!v12)
    {
      if (!a4)
      {
        v12 = 0;
        v21 = 0;
        v10 = v13;
LABEL_38:

        goto LABEL_39;
      }
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v69 = *MEMORY[0x1E0CB2938];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to serialize contents plist: \"%@\", error: %@"), v11, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
      archiveURL = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 8, archiveURL);
      v21 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_36;
    }
    objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("contents.plist"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v13;
    v15 = objc_msgSend(v12, "writeToURL:options:error:", v14, 2, &v58);
    v10 = v58;

    if ((v15 & 1) != 0)
    {
      v54 = v14;
      if (-[PFParallaxAssetResource proxyImage](self, "proxyImage"))
      {
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("proxyImage"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "URLByAppendingPathComponent:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v57 = v10;
        v18 = objc_msgSend((id)objc_opt_class(), "saveImage:toURL:error:", -[PFParallaxAssetResource proxyImage](self, "proxyImage"), v17, &v57);
        v13 = v57;

        if ((v18 & 1) == 0)
        {
          if (a4)
          {
            v53 = (void *)MEMORY[0x1E0CB35C8];
            v65 = *MEMORY[0x1E0CB2938];
            v37 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v17, "path");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "stringWithFormat:", CFSTR("Failed to write proxy image file: \"%@\", error: %@"), v38, v13);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v66 = v39;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = v53;
LABEL_31:
            objc_msgSend(v41, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 8, v40);
            *a4 = (id)objc_claimAutoreleasedReturnValue();

            archiveURL = v17;
            v21 = 0;
LABEL_35:
            v14 = v54;
            goto LABEL_36;
          }
          goto LABEL_32;
        }

        v14 = v54;
      }
      else
      {
        v13 = v10;
      }
      -[PFParallaxAssetResource imageFileURL](self, "imageFileURL");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("imageFile"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "URLByAppendingPathComponent:", v27);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        -[PFParallaxAssetResource imageFileURL](self, "imageFileURL");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v13;
        v29 = objc_msgSend(v8, "copyItemAtURL:toURL:error:", v28, v17, &v56);
        v51 = v56;

        if ((v29 & 1) == 0)
        {
          if (a4)
          {
            v42 = (void *)MEMORY[0x1E0CB35C8];
            v63 = *MEMORY[0x1E0CB2938];
            v43 = (void *)MEMORY[0x1E0CB3940];
            -[PFParallaxAssetResource imageFileURL](self, "imageFileURL");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "stringWithFormat:", CFSTR("Failed to copy image file from \"%@\" to \"%@\", error: %@"), v44, v17, v51);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v64 = v45;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = v42;
            archiveURL = v17;
            objc_msgSend(v47, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 8, v46);
            *a4 = (id)objc_claimAutoreleasedReturnValue();

            v21 = 0;
            v13 = v51;
            v14 = v54;
            goto LABEL_36;
          }
          v21 = 0;
          v13 = v51;
          goto LABEL_34;
        }

        v13 = v51;
        v14 = v54;
      }
      -[PFParallaxAssetResource adjustmentData](self, "adjustmentData");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v30)
      {
LABEL_23:
        v36 = v7;
        archiveURL = self->_archiveURL;
        self->_archiveURL = v36;
        v21 = 1;
        goto LABEL_36;
      }
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("adjustmentData"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "URLByAppendingPathComponent:", v31);
      v32 = objc_claimAutoreleasedReturnValue();

      -[PFParallaxAssetResource adjustmentData](self, "adjustmentData");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v13;
      v52 = (void *)v32;
      LOBYTE(v32) = objc_msgSend(v33, "writeToURL:options:error:", v32, 2, &v55);
      v34 = v55;
      v35 = v13;
      v13 = v34;

      if ((v32 & 1) != 0)
      {

        goto LABEL_23;
      }
      v17 = v52;
      if (a4)
      {
        v50 = (void *)MEMORY[0x1E0CB35C8];
        v61 = *MEMORY[0x1E0CB2938];
        v48 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v52, "path");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "stringWithFormat:", CFSTR("Failed to write adjustment data file: \"%@\", error: %@"), v38, v13);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = v39;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v50;
        goto LABEL_31;
      }
LABEL_32:
      v21 = 0;
LABEL_34:
      archiveURL = v17;
      goto LABEL_35;
    }
    if (a4)
    {
      v24 = (void *)MEMORY[0x1E0CB35C8];
      v67 = *MEMORY[0x1E0CB2938];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to archive contents plist: \"%@\", error: %@"), v12, v10);
      archiveURL = (void *)objc_claimAutoreleasedReturnValue();
      v68 = archiveURL;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 8, v25);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      v21 = 0;
      v13 = v10;
LABEL_36:

      v10 = v13;
      goto LABEL_37;
    }
    v21 = 0;
LABEL_37:

    goto LABEL_38;
  }
  if (a4)
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v71 = *MEMORY[0x1E0CB2938];
    v20 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("Failed to create archive directory: \"%@\", error: %@"), v11, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v72[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, &v71, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 8, v14);
    v21 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  v21 = 0;
LABEL_39:

  return v21;
}

- (BOOL)loadFromArchiveURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  BOOL v14;
  id v15;
  NSURL *v16;
  const void *v17;
  id v18;
  void *v19;
  NSURL *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  BOOL v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  NSURL *archiveURL;
  void *v44;
  unint64_t v45;
  const __CFString *v46;
  id v47;
  void *v48;
  NSURL *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  unint64_t v60;
  const __CFString *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  unint64_t v66;
  const __CFString *v67;
  NSURL *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t *v74;
  uint64_t *v75;
  void *v77;
  NSURL *v78;
  NSURL *v79;
  id v80;
  id v81;
  id v82;
  void *v83;
  void *v84;
  char v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  _QWORD v116[3];

  v116[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
    _PFAssertFailHandler();
  v7 = v6;
  v8 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("contents.plist"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v9, 1, &v96);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v96;
  if (v10)
  {
    v95 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v10, 0, 0, &v95);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v95;

    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v83 = v8;
        v84 = v9;
        v93 = 0;
        v94 = 0;
        v91 = v13;
        v92 = 0;
        v14 = -[PFParallaxAssetResource loadContentsFromDictionary:proxyPath:imagePath:adjustmentPath:error:](self, "loadContentsFromDictionary:proxyPath:imagePath:adjustmentPath:error:", v12, &v94, &v93, &v92, &v91);
        v15 = v94;
        v82 = v93;
        v81 = v92;
        v11 = v91;

        if (v14)
        {
          v80 = v15;
          if (v15)
          {
            objc_msgSend(v7, "URLByAppendingPathComponent:", v15);
            v16 = (NSURL *)objc_claimAutoreleasedReturnValue();
            v90 = v11;
            v17 = (const void *)objc_msgSend((id)objc_opt_class(), "newImageWithContentsOfURL:error:", v16, &v90);
            v18 = v90;

            if (!v17)
            {
              v47 = v18;
              v9 = v84;
              if (a4)
              {
                v48 = (void *)MEMORY[0x1E0CB35C8];
                v107 = *MEMORY[0x1E0CB2938];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to load proxy image from file: '%@', error: %@"), v16, v47);
                v49 = v16;
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                v108 = v50;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v108, &v107, 1);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, v51);
                *a4 = (id)objc_claimAutoreleasedReturnValue();

                archiveURL = v49;
                v27 = 0;
                v11 = v47;
              }
              else
              {
                v27 = 0;
                v11 = v47;
                archiveURL = v16;
              }
              v19 = v82;
              v8 = v83;
              v26 = v80;
              goto LABEL_66;
            }
            -[PFParallaxAssetResource setProxyImage:](self, "setProxyImage:", v17);
            CFRelease(v17);

            v11 = v18;
LABEL_9:
            v8 = v83;
            v9 = v84;
            v19 = v82;
            if (v82)
            {
              objc_msgSend(v7, "URLByAppendingPathComponent:", v82);
              v20 = (NSURL *)objc_claimAutoreleasedReturnValue();
              -[NSURL path](v20, "path");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v85 = objc_msgSend(v83, "isReadableFileAtPath:", v21);

              if ((v85 & 1) == 0)
              {
                archiveURL = v20;
                v26 = v80;
                if (a4)
                {
                  v87 = (void *)MEMORY[0x1E0CB35C8];
                  v103 = *MEMORY[0x1E0CB2938];
                  v54 = (void *)MEMORY[0x1E0CB3940];
                  v79 = v20;
                  -[NSURL path](v20, "path");
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v54, "stringWithFormat:", CFSTR("Cannot read image file '%@'"), v55);
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  v104 = v56;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v104, &v103, 1);
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v87, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, v57);
                  *a4 = (id)objc_claimAutoreleasedReturnValue();

                  archiveURL = v79;
                }
                goto LABEL_65;
              }
              -[PFParallaxAssetResource setImageFileURL:](self, "setImageFileURL:", v20);

              v19 = v82;
              v8 = v83;
            }
            else if (-[PFParallaxAssetResource type](self, "type") == 2
                   || !-[PFParallaxAssetResource type](self, "type"))
            {
              if (a4)
              {
                v58 = (void *)MEMORY[0x1E0CB35C8];
                v101 = *MEMORY[0x1E0CB2938];
                v59 = (void *)MEMORY[0x1E0CB3940];
                v60 = -[PFParallaxAssetResource type](self, "type");
                v26 = v80;
                v88 = v58;
                if (v60 > 6)
                  v61 = CFSTR("???");
                else
                  v61 = off_1E45A1B78[v60];
                objc_msgSend(v59, "stringWithFormat:", CFSTR("Expected image file for type '%@'"), v61);
                v62 = objc_claimAutoreleasedReturnValue();
                v102 = v62;
                v73 = (void *)MEMORY[0x1E0C99D80];
                v74 = &v102;
                v75 = &v101;
                goto LABEL_63;
              }
              v27 = 0;
              v26 = v80;
LABEL_67:

              goto LABEL_68;
            }
            if (v81)
            {
              objc_msgSend(v7, "URLByAppendingPathComponent:");
              v78 = (NSURL *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v53 = v11;

              if (v52)
              {
                -[PFParallaxAssetResource setAdjustmentData:](self, "setAdjustmentData:", v52);

                v11 = v53;
                v26 = v80;
                v19 = v82;
LABEL_53:
                v68 = v7;
                archiveURL = self->_archiveURL;
                self->_archiveURL = v68;
                v27 = 1;
                goto LABEL_66;
              }
              v11 = v53;
              archiveURL = v78;
              v26 = v80;
              if (a4)
              {
                v89 = (void *)MEMORY[0x1E0CB35C8];
                v99 = *MEMORY[0x1E0CB2938];
                v69 = (void *)MEMORY[0x1E0CB3940];
                -[NSURL path](v78, "path");
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v69, "stringWithFormat:", CFSTR("Failed to read adjustment data from file: \"%@\", error: %@"), v70, v11);
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                v100 = v71;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v100, &v99, 1);
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v89, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 8, v72);
                *a4 = (id)objc_claimAutoreleasedReturnValue();

                v8 = v83;
                archiveURL = v78;
              }
              v27 = 0;
LABEL_22:
              v19 = v82;
LABEL_66:

              goto LABEL_67;
            }
            v26 = v80;
            if (-[PFParallaxAssetResource type](self, "type") != 4)
              goto LABEL_53;
            if (a4)
            {
              v88 = (void *)MEMORY[0x1E0CB35C8];
              v97 = *MEMORY[0x1E0CB2938];
              v65 = (void *)MEMORY[0x1E0CB3940];
              v66 = -[PFParallaxAssetResource type](self, "type");
              if (v66 > 6)
                v67 = CFSTR("???");
              else
                v67 = off_1E45A1B78[v66];
              objc_msgSend(v65, "stringWithFormat:", CFSTR("Expected adjustment data for type '%@'"), v67);
              v62 = objc_claimAutoreleasedReturnValue();
              v98 = v62;
              v73 = (void *)MEMORY[0x1E0C99D80];
              v74 = &v98;
              v75 = &v97;
LABEL_63:
              objc_msgSend(v73, "dictionaryWithObjects:forKeys:count:", v74, v75, 1);
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              v64 = v88;
LABEL_64:
              objc_msgSend(v64, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, v63);
              *a4 = (id)objc_claimAutoreleasedReturnValue();

              archiveURL = (NSURL *)v62;
LABEL_65:
              v27 = 0;
              v19 = v82;
              v8 = v83;
              goto LABEL_66;
            }
            v27 = 0;
            goto LABEL_67;
          }
          if (-[PFParallaxAssetResource type](self, "type") != 3 && -[PFParallaxAssetResource type](self, "type") != 1)
            goto LABEL_9;
          v8 = v83;
          v9 = v84;
          if (a4)
          {
            v77 = (void *)MEMORY[0x1E0CB35C8];
            v105 = *MEMORY[0x1E0CB2938];
            v44 = (void *)MEMORY[0x1E0CB3940];
            v45 = -[PFParallaxAssetResource type](self, "type");
            v26 = 0;
            if (v45 > 6)
              v46 = CFSTR("???");
            else
              v46 = off_1E45A1B78[v45];
            objc_msgSend(v44, "stringWithFormat:", CFSTR("Expected proxy image for type '%@'"), v46);
            v62 = objc_claimAutoreleasedReturnValue();
            v106 = v62;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v106, &v105, 1);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            v64 = v77;
            goto LABEL_64;
          }
          v27 = 0;
          v26 = 0;
        }
        else
        {
          v26 = v15;
          if (a4)
          {
            v40 = (void *)MEMORY[0x1E0CB35C8];
            v109 = *MEMORY[0x1E0CB2938];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to load contents dictionary: \"%@\", error: %@"), v12, v11);
            v41 = objc_claimAutoreleasedReturnValue();
            v110 = v41;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v110, &v109, 1);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 8, v42);
            *a4 = (id)objc_claimAutoreleasedReturnValue();

            archiveURL = (NSURL *)v41;
            v27 = 0;
            v8 = v83;
            v9 = v84;
            goto LABEL_22;
          }
          v27 = 0;
          v8 = v83;
          v9 = v84;
        }
        v19 = v82;
        goto LABEL_67;
      }
      if (a4)
      {
        v34 = (void *)MEMORY[0x1E0CB35C8];
        v111 = *MEMORY[0x1E0CB2938];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Expected contents dictionary but got '%@'"), v12);
        v86 = v9;
        v35 = v12;
        v36 = v7;
        v37 = v10;
        v38 = objc_claimAutoreleasedReturnValue();
        v112 = v38;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v112, &v111, 1);
        v39 = a4;
        v33 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, v33);
        v27 = 0;
        *v39 = (id)objc_claimAutoreleasedReturnValue();
        v26 = (void *)v38;
        v10 = v37;
        v7 = v36;
        v12 = v35;
        v9 = v86;
        goto LABEL_18;
      }
    }
    else
    {
      if (a4)
      {
        v28 = (void *)MEMORY[0x1E0CB35C8];
        v113 = *MEMORY[0x1E0CB2938];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to deserialize contents plist from data: \"%@\", error: %@"), v10, v13);
        v29 = v7;
        v30 = v10;
        v31 = objc_claimAutoreleasedReturnValue();
        v114 = v31;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v114, &v113, 1);
        v32 = a4;
        v33 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 8, v33);
        v27 = 0;
        *v32 = (id)objc_claimAutoreleasedReturnValue();
        v26 = (void *)v31;
        v10 = v30;
        v7 = v29;
        v12 = 0;
LABEL_18:
        v11 = v13;
        v19 = (void *)v33;
        goto LABEL_68;
      }
      v12 = 0;
    }
    v27 = 0;
LABEL_69:

    v11 = v13;
    goto LABEL_70;
  }
  if (a4)
  {
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v115 = *MEMORY[0x1E0CB2938];
    v23 = v8;
    v24 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v9, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    v8 = v23;
    objc_msgSend(v25, "stringWithFormat:", CFSTR("Failed to read contents plist data from file: \"%@\", error: %@"), v12, v11);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v116[0] = v26;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v116, &v115, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 8, v19);
    v27 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_68:

    v13 = v11;
    goto LABEL_69;
  }
  v27 = 0;
LABEL_70:

  return v27;
}

- (id)contentsDictionary
{
  id v3;
  unint64_t v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E45CA1A8, CFSTR("version"));
  v4 = -[PFParallaxAssetResource type](self, "type");
  if (v4 > 6)
    v5 = CFSTR("???");
  else
    v5 = off_1E45A1B78[v4];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("type"));
  if (-[PFParallaxAssetResource proxyImage](self, "proxyImage"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("proxy.heic"), CFSTR("proxyImage"));
  -[PFParallaxAssetResource imageFileURL](self, "imageFileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PFParallaxAssetResource imageFileURL](self, "imageFileURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pathExtension");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = -[PFParallaxAssetResource type](self, "type");
    if (v9 > 6)
      v10 = CFSTR("???");
    else
      v10 = off_1E45A1B78[v9];
    -[__CFString stringByAppendingPathExtension:](v10, "stringByAppendingPathExtension:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("imageFile"));

  }
  -[PFParallaxAssetResource fileType](self, "fileType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("fileType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PFParallaxAssetResource orientation](self, "orientation"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("orientation"));

  -[PFParallaxAssetResource adjustmentFormat](self, "adjustmentFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("adjustmentFormat"));

  -[PFParallaxAssetResource adjustmentVersion](self, "adjustmentVersion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("adjustmentVersion"));

  -[PFParallaxAssetResource adjustmentData](self, "adjustmentData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("adjustment.data"), CFSTR("adjustmentData"));
  return v3;
}

- (BOOL)loadContentsFromDictionary:(id)a3 proxyPath:(id *)a4 imagePath:(id *)a5 adjustmentPath:(id *)a6 error:(id *)a7
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void **v23;
  uint64_t *v24;
  BOOL v25;
  void *v26;
  void *v27;
  void **v28;
  uint64_t *v29;
  id *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t *v42;
  uint64_t *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v51;
  void *v52;
  void *v53;
  void **v54;
  uint64_t *v55;
  void *v56;
  void *v57;
  void **v58;
  uint64_t *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  id *v91;
  uint64_t v92;
  id *v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  _QWORD v103[3];

  v103[1] = *MEMORY[0x1E0C80C00];
  v17 = a3;
  if (!v17)
  {
    _PFAssertFailHandler();
    goto LABEL_100;
  }
  v7 = v17;
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("version"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v18;
  if (v18)
  {
    if ((objc_msgSend(v18, "isEqual:", &unk_1E45CA1A8) & 1) != 0)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("type"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v19 = v9;
          if ((objc_msgSend(v19, "isEqualToString:", CFSTR("Adjusted")) & 1) != 0)
          {
            v20 = &unk_1E45CA1C0;
            goto LABEL_33;
          }
          if ((objc_msgSend(v19, "isEqualToString:", CFSTR("AdjustedProxy")) & 1) != 0)
          {
            v20 = &unk_1E45CA1D8;
            goto LABEL_33;
          }
          if ((objc_msgSend(v19, "isEqualToString:", CFSTR("Original")) & 1) != 0)
          {
            v20 = &unk_1E45CA1F0;
            goto LABEL_33;
          }
          if ((objc_msgSend(v19, "isEqualToString:", CFSTR("OriginalProxy")) & 1) != 0)
          {
            v20 = &unk_1E45CA208;
            goto LABEL_33;
          }
          if ((objc_msgSend(v19, "isEqualToString:", CFSTR("EditingInput")) & 1) != 0)
          {
            v20 = &unk_1E45CA220;
            goto LABEL_33;
          }
          if ((objc_msgSend(v19, "isEqualToString:", CFSTR("LegacyMigration")) & 1) != 0)
          {
            v20 = &unk_1E45CA238;
            goto LABEL_33;
          }
          if ((objc_msgSend(v19, "isEqualToString:", CFSTR("LivePhotoOriginal")) & 1) != 0)
          {
            v20 = &unk_1E45CA250;
LABEL_33:

            -[PFParallaxAssetResource setType:](self, "setType:", objc_msgSend(v20, "integerValue"));
            objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("proxyImage"));
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              if (a4)
                *a4 = objc_retainAutorelease(v10);
              objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("imageFile"));
              a4 = (id *)objc_claimAutoreleasedReturnValue();
              if (!a4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                if (a5)
                  *a5 = objc_retainAutorelease(a4);
                if (a4)
                {
                  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("fileType"));
                  v30 = (id *)objc_claimAutoreleasedReturnValue();
                  if (!v30)
                  {
                    if (a7)
                    {
                      v44 = (void *)MEMORY[0x1E0CB35C8];
                      v88 = *MEMORY[0x1E0CB2938];
                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing file type"));
                      v32 = (void *)objc_claimAutoreleasedReturnValue();
                      v89 = v32;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v89, &v88, 1);
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v44, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, v33);
                      v34 = (id)objc_claimAutoreleasedReturnValue();
                      a5 = 0;
                      goto LABEL_59;
                    }
                    a5 = 0;
                    goto LABEL_79;
                  }
                  a5 = v30;
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    if (a7)
                    {
                      v31 = (void *)MEMORY[0x1E0CB35C8];
                      v86 = *MEMORY[0x1E0CB2938];
                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid file type: '%@'"), a5);
                      v32 = (void *)objc_claimAutoreleasedReturnValue();
                      v87 = v32;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v87, &v86, 1);
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, v33);
                      v34 = (id)objc_claimAutoreleasedReturnValue();
LABEL_59:
                      v25 = 0;
                      *a7 = v34;
LABEL_66:

                      goto LABEL_82;
                    }
LABEL_79:
                    v25 = 0;
                    goto LABEL_83;
                  }
                }
                else
                {
                  a5 = 0;
                }
                -[PFParallaxAssetResource setFileType:](self, "setFileType:", a5);
                objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("orientation"));
                v37 = objc_claimAutoreleasedReturnValue();
                if (!v37)
                {
                  if (a7)
                  {
                    v45 = (void *)MEMORY[0x1E0CB35C8];
                    v84 = *MEMORY[0x1E0CB2938];
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing orientation value"));
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    v85 = v33;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1);
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v45, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, v46);
                    *a7 = (id)objc_claimAutoreleasedReturnValue();

                    v32 = 0;
LABEL_65:
                    v25 = 0;
                    goto LABEL_66;
                  }
                  v32 = 0;
                  goto LABEL_81;
                }
                v32 = (void *)v37;
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  if (a7)
                  {
                    v39 = (void *)MEMORY[0x1E0CB35C8];
                    v82 = *MEMORY[0x1E0CB2938];
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid orientation value: '%@'"), v32);
                    v69 = v32;
                    v40 = objc_claimAutoreleasedReturnValue();
                    v83 = v40;
                    v41 = (void *)MEMORY[0x1E0C99D80];
                    v42 = &v83;
                    v43 = &v82;
                    goto LABEL_64;
                  }
LABEL_81:
                  v25 = 0;
                  goto LABEL_82;
                }
                v38 = objc_msgSend(v32, "intValue");
                if ((v38 - 9) <= 0xFFFFFFF7)
                {
                  if (a7)
                  {
                    v39 = (void *)MEMORY[0x1E0CB35C8];
                    v80 = *MEMORY[0x1E0CB2938];
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid orientation value: '%@'"), v32);
                    v69 = v32;
                    v40 = objc_claimAutoreleasedReturnValue();
                    v81 = v40;
                    v41 = (void *)MEMORY[0x1E0C99D80];
                    v42 = &v81;
                    v43 = &v80;
LABEL_64:
                    objc_msgSend(v41, "dictionaryWithObjects:forKeys:count:", v42, v43, 1);
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v39, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, v47);
                    *a7 = (id)objc_claimAutoreleasedReturnValue();

                    v33 = (void *)v40;
                    v32 = v69;
                    goto LABEL_65;
                  }
                  goto LABEL_81;
                }
                v68 = v32;
                -[PFParallaxAssetResource setOrientation:](self, "setOrientation:", v38);
                objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("adjustmentData"));
                v11 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  if (a6)
                    *a6 = objc_retainAutorelease(v11);
                  v66 = v11;
                  if (v11)
                  {
                    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("adjustmentFormat"));
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v48)
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v64 = v48;
                        -[PFParallaxAssetResource setAdjustmentFormat:](self, "setAdjustmentFormat:", v48);
                        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("adjustmentVersion"));
                        v49 = (void *)objc_claimAutoreleasedReturnValue();
                        v32 = v68;
                        if (v49)
                        {
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            -[PFParallaxAssetResource setAdjustmentVersion:](self, "setAdjustmentVersion:", v49);

                            v25 = 1;
LABEL_110:
                            v33 = v66;
                            goto LABEL_66;
                          }
                          if (!a7)
                            goto LABEL_108;
                          v61 = (void *)MEMORY[0x1E0CB35C8];
                          v70 = *MEMORY[0x1E0CB2938];
                          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid adjustment version: '%@'"), v49);
                          v63 = (void *)objc_claimAutoreleasedReturnValue();
                          v71 = v63;
                          v57 = (void *)MEMORY[0x1E0C99D80];
                          v58 = &v71;
                          v59 = &v70;
                        }
                        else
                        {
                          if (!a7)
                          {
LABEL_108:

                            goto LABEL_109;
                          }
                          v61 = (void *)MEMORY[0x1E0CB35C8];
                          v72 = *MEMORY[0x1E0CB2938];
                          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing adjustment version"));
                          v63 = (void *)objc_claimAutoreleasedReturnValue();
                          v73 = v63;
                          v57 = (void *)MEMORY[0x1E0C99D80];
                          v58 = &v73;
                          v59 = &v72;
                        }
                        objc_msgSend(v57, "dictionaryWithObjects:forKeys:count:", v58, v59, 1);
                        v60 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v61, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, v60);
                        *a7 = (id)objc_claimAutoreleasedReturnValue();

                        goto LABEL_108;
                      }
                      v32 = v68;
                      if (a7)
                      {
                        v62 = (void *)MEMORY[0x1E0CB35C8];
                        v74 = *MEMORY[0x1E0CB2938];
                        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid adjustment format: '%@'"), v48);
                        v65 = (void *)objc_claimAutoreleasedReturnValue();
                        v75 = v65;
                        v53 = (void *)MEMORY[0x1E0C99D80];
                        v54 = &v75;
                        v55 = &v74;
                        goto LABEL_97;
                      }
                    }
                    else
                    {
                      v32 = v68;
                      if (a7)
                      {
                        v62 = (void *)MEMORY[0x1E0CB35C8];
                        v76 = *MEMORY[0x1E0CB2938];
                        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing adjustment format"));
                        v65 = (void *)objc_claimAutoreleasedReturnValue();
                        v77 = v65;
                        v53 = (void *)MEMORY[0x1E0C99D80];
                        v54 = &v77;
                        v55 = &v76;
LABEL_97:
                        objc_msgSend(v53, "dictionaryWithObjects:forKeys:count:", v54, v55, 1);
                        v56 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v62, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, v56);
                        *a7 = (id)objc_claimAutoreleasedReturnValue();

                      }
                    }

LABEL_109:
                    v25 = 0;
                    goto LABEL_110;
                  }
                  v33 = 0;
                  v25 = 1;
LABEL_101:
                  v32 = v68;
                  goto LABEL_66;
                }
                if (a7)
                {
                  v67 = (void *)MEMORY[0x1E0CB35C8];
                  v78 = *MEMORY[0x1E0CB2938];
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid adjustment data path: '%@'"), v11);
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  v79 = v51;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v67, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, v52);
                  *a7 = (id)objc_claimAutoreleasedReturnValue();

                  v33 = v11;
                  v25 = 0;
                  goto LABEL_101;
                }
LABEL_100:
                v25 = 0;
                v33 = v11;
                goto LABEL_101;
              }
              if (a7)
              {
                v36 = (void *)MEMORY[0x1E0CB35C8];
                v90 = *MEMORY[0x1E0CB2938];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid image path: '%@'"), a4);
                a5 = (id *)objc_claimAutoreleasedReturnValue();
                v91 = a5;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v91, &v90, 1);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, v32);
                v25 = 0;
                *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_82:

                goto LABEL_83;
              }
              v25 = 0;
LABEL_84:

              goto LABEL_85;
            }
            if (a7)
            {
              v35 = (void *)MEMORY[0x1E0CB35C8];
              v92 = *MEMORY[0x1E0CB2938];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid proxy image path: '%@'"), v10);
              a4 = (id *)objc_claimAutoreleasedReturnValue();
              v93 = a4;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v93, &v92, 1);
              a5 = (id *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, a5);
              v25 = 0;
              *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_83:

              goto LABEL_84;
            }
            v25 = 0;
            v9 = v19;
LABEL_85:

            goto LABEL_86;
          }

          if (!a7)
          {
            v25 = 0;
            v9 = v19;
            goto LABEL_86;
          }
          v26 = (void *)MEMORY[0x1E0CB35C8];
          v94 = *MEMORY[0x1E0CB2938];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid type: '%@'"), v19);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v95 = v10;
          v27 = (void *)MEMORY[0x1E0C99D80];
          v28 = &v95;
          v29 = &v94;
LABEL_18:
          objc_msgSend(v27, "dictionaryWithObjects:forKeys:count:", v28, v29, 1);
          a4 = (id *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, a4);
          v25 = 0;
          *a7 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_84;
        }
        if (a7)
        {
          v26 = (void *)MEMORY[0x1E0CB35C8];
          v96 = *MEMORY[0x1E0CB2938];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid type: '%@'"), v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v97 = v10;
          v27 = (void *)MEMORY[0x1E0C99D80];
          v28 = &v97;
          v29 = &v96;
          goto LABEL_18;
        }
      }
      else
      {
        if (a7)
        {
          v26 = (void *)MEMORY[0x1E0CB35C8];
          v98 = *MEMORY[0x1E0CB2938];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing type info"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v99 = v10;
          v27 = (void *)MEMORY[0x1E0C99D80];
          v28 = &v99;
          v29 = &v98;
          goto LABEL_18;
        }
        v9 = 0;
      }
      v25 = 0;
LABEL_86:

      goto LABEL_87;
    }
    if (a7)
    {
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v100 = *MEMORY[0x1E0CB2938];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported version: '%@'"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = v9;
      v22 = (void *)MEMORY[0x1E0C99D80];
      v23 = &v101;
      v24 = &v100;
      goto LABEL_12;
    }
  }
  else if (a7)
  {
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v102 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing version info"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v103[0] = v9;
    v22 = (void *)MEMORY[0x1E0C99D80];
    v23 = (void **)v103;
    v24 = &v102;
LABEL_12:
    objc_msgSend(v22, "dictionaryWithObjects:forKeys:count:", v23, v24, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, v10);
    v25 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_85;
  }
  v25 = 0;
LABEL_87:

  return v25;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (CGImage)proxyImage
{
  return self->_proxyImage;
}

- (void)setProxyImage:(CGImage *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSURL)imageFileURL
{
  return self->_imageFileURL;
}

- (void)setImageFileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)fileType
{
  return self->_fileType;
}

- (void)setFileType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSURL)videoFileURL
{
  return self->_videoFileURL;
}

- (void)setVideoFileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unsigned)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(unsigned int)a3
{
  self->_orientation = a3;
}

- (NSString)adjustmentFormat
{
  return self->_adjustmentFormat;
}

- (void)setAdjustmentFormat:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)adjustmentVersion
{
  return self->_adjustmentVersion;
}

- (void)setAdjustmentVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSData)adjustmentData
{
  return self->_adjustmentData;
}

- (void)setAdjustmentData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSURL)archiveURL
{
  return self->_archiveURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archiveURL, 0);
  objc_storeStrong((id *)&self->_adjustmentData, 0);
  objc_storeStrong((id *)&self->_adjustmentVersion, 0);
  objc_storeStrong((id *)&self->_adjustmentFormat, 0);
  objc_storeStrong((id *)&self->_videoFileURL, 0);
  objc_storeStrong((id *)&self->_fileType, 0);
  objc_storeStrong((id *)&self->_imageFileURL, 0);
}

+ (BOOL)saveImage:(CGImage *)a3 toURL:(id)a4 error:(id *)a5
{
  const __CFURL *v7;
  const __CFURL *v8;
  __CFString *v9;
  CGImageDestination *v10;
  CGImageDestination *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void **v16;
  uint64_t *v17;
  void *v18;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v7 = (const __CFURL *)a4;
  if (!a3)
  {
    _PFAssertFailHandler();
LABEL_13:
    _PFAssertFailHandler();
  }
  v8 = v7;
  if (!v7)
    goto LABEL_13;
  objc_msgSend((id)*MEMORY[0x1E0CEC508], "identifier");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v10 = CGImageDestinationCreateWithURL(v8, v9, 1uLL, 0);
  if (!v10)
  {
    if (!a5)
    {
LABEL_10:
      v12 = 0;
      goto LABEL_11;
    }
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), CFSTR("Failed to create image destination"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v14;
    v15 = (void *)MEMORY[0x1E0C99D80];
    v16 = (void **)v23;
    v17 = &v22;
LABEL_9:
    objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 8, v18);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  v11 = v10;
  CGImageDestinationAddImage(v10, a3, 0);
  v12 = CGImageDestinationFinalize(v11);
  CFRelease(v11);
  if (a5 && !v12)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), CFSTR("Failed to finalize image destination"), *MEMORY[0x1E0CB2938]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v14;
    v15 = (void *)MEMORY[0x1E0C99D80];
    v16 = &v21;
    v17 = &v20;
    goto LABEL_9;
  }
LABEL_11:

  return v12;
}

+ (CGImage)newImageWithContentsOfURL:(id)a3 error:(id *)a4
{
  const __CFURL *v5;
  const __CFURL *v6;
  CGImageSource *v7;
  CGImageSource *v8;
  CGImage *ImageAtIndex;
  void *v10;
  void *v11;
  void *v12;
  void **v13;
  uint64_t *v14;
  void *v15;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v5 = (const __CFURL *)a3;
  if (!v5)
    _PFAssertFailHandler();
  v6 = v5;
  v7 = CGImageSourceCreateWithURL(v5, 0);
  if (!v7)
  {
    if (!a4)
    {
LABEL_9:
      ImageAtIndex = 0;
      goto LABEL_10;
    }
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), CFSTR("Failed to create image source"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v11;
    v12 = (void *)MEMORY[0x1E0C99D80];
    v13 = (void **)v20;
    v14 = &v19;
LABEL_8:
    objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", v13, v14, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 8, v15);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  v8 = v7;
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v7, 0, 0);
  CFRelease(v8);
  if (a4 && !ImageAtIndex)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), CFSTR("Failed to load image"), *MEMORY[0x1E0CB2938]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v11;
    v12 = (void *)MEMORY[0x1E0C99D80];
    v13 = &v18;
    v14 = &v17;
    goto LABEL_8;
  }
LABEL_10:

  return ImageAtIndex;
}

@end
