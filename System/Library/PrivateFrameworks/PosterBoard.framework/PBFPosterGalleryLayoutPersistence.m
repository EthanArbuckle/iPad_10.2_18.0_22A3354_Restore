@implementation PBFPosterGalleryLayoutPersistence

- (PBFPosterGalleryLayoutPersistence)initWithURL:(id)a3
{
  id v4;
  PBFPosterGalleryLayoutPersistence *v5;
  uint64_t v6;
  NSURL *url;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PBFPosterGalleryLayoutPersistence;
  v5 = -[PBFPosterGalleryLayoutPersistence init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    url = v5->_url;
    v5->_url = (NSURL *)v6;

  }
  return v5;
}

- (id)loadNewestUsableGalleryLayoutReturningError:(id *)a3
{
  return -[PBFPosterGalleryLayoutPersistence loadNewestUsableGalleryLayoutReturningPersistenceDate:purgeableGalleryLayoutURLs:error:](self, "loadNewestUsableGalleryLayoutReturningPersistenceDate:purgeableGalleryLayoutURLs:error:", 0, 0, a3);
}

- (id)loadNewestUsableGalleryLayoutReturningPersistenceDate:(id *)a3 purgeableGalleryLayoutURLs:(id *)a4 error:(id *)a5
{
  void *v9;
  NSURL *url;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  id *v38;
  void *v39;
  id *v40;
  id *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  url = self->_url;
  v50 = 0;
  objc_msgSend(v9, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", url, 0, 5, &v50);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v50;

  if (v12)
  {
    a3 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v12);
    goto LABEL_39;
  }
  v41 = a4;
  objc_msgSend(v11, "sortedArrayUsingComparator:", &__block_literal_global_19);
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  v42 = v13;
  if (!v14)
  {

    if (a3)
    {
      v40 = a3;
      v16 = 0;
      a3 = 0;
      v27 = 0;
      v28 = 0;
      goto LABEL_26;
    }
    v16 = 0;
    v27 = 0;
LABEL_33:
    if (v41)
      goto LABEL_34;
    goto LABEL_36;
  }
  v15 = v14;
  v39 = v11;
  v40 = a3;
  v38 = a5;
  v16 = 0;
  v17 = *(_QWORD *)v47;
LABEL_6:
  v18 = 0;
  while (1)
  {
    if (*(_QWORD *)v47 != v17)
      objc_enumerationMutation(v13);
    v19 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v18);

    v45 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v19, 1, &v45);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v45;
    if (!v20)
      goto LABEL_13;
    v21 = (void *)MEMORY[0x1E0CB3710];
    v22 = objc_opt_class();
    v44 = v16;
    objc_msgSend(v21, "unarchivedObjectOfClass:fromData:error:", v22, v20, &v44);
    a3 = (id *)objc_claimAutoreleasedReturnValue();
    v23 = v44;

    if (a3)
      goto LABEL_21;
    v24 = (void *)MEMORY[0x1E0CB3710];
    v25 = objc_opt_class();
    v43 = v23;
    objc_msgSend(v24, "unarchivedObjectOfClass:fromData:error:", v25, v20, &v43);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v43;

    objc_msgSend(v26, "posterBoardRepresentation");
    a3 = (id *)objc_claimAutoreleasedReturnValue();

    if (a3)
      break;

    v13 = v42;
LABEL_13:
    if (v15 == ++v18)
    {
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      if (v15)
        goto LABEL_6;

      if (v40)
      {
        a3 = 0;
        v27 = 0;
        v28 = 0;
        a5 = v38;
        v11 = v39;
        goto LABEL_26;
      }
      a3 = 0;
      v27 = 0;
      a5 = v38;
      v11 = v39;
      goto LABEL_33;
    }
  }
  v23 = v16;
  v13 = v42;
LABEL_21:
  v27 = v19;

  a5 = v38;
  v11 = v39;
  if (!v40)
    goto LABEL_27;
  if (v27)
  {
    objc_msgSend(v27, "lastPathComponent");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringByDeletingPathExtension");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "doubleValue");
    v32 = v31;

    v13 = v42;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v32);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = 0;
  }
  v16 = v23;
LABEL_26:
  v33 = objc_retainAutorelease(v28);
  *v40 = v33;

  v23 = v16;
LABEL_27:
  if (v41)
  {
    if (v27)
    {
      v34 = (void *)objc_msgSend(v13, "mutableCopy");
      objc_msgSend(v34, "removeObject:", v27);
      v35 = (id)objc_msgSend(v34, "copy");

      v13 = v42;
      v16 = v23;
      goto LABEL_35;
    }
    v16 = v23;
LABEL_34:
    v35 = v13;
    v27 = 0;
LABEL_35:
    v36 = objc_retainAutorelease(v35);
    *v41 = v36;

  }
  else
  {
    v16 = v23;
  }
LABEL_36:
  if (a5)
    *a5 = objc_retainAutorelease(v16);

LABEL_39:
  return a3;
}

uint64_t __124__PBFPosterGalleryLayoutPersistence_loadNewestUsableGalleryLayoutReturningPersistenceDate_purgeableGalleryLayoutURLs_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByDeletingPathExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "lastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringByDeletingPathExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "compare:options:", v6, 64);
  return v9;
}

- (BOOL)saveGalleryLayout:(id)a3 returningPersistenceDate:(id *)a4 error:(id *)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSURL *url;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  void *v20;
  id v22;
  id v23;

  v23 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v23);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v23;
  v10 = v9;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    url = self->_url;
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v11, "timeIntervalSince1970");
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%f"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURL URLByAppendingPathComponent:](url, "URLByAppendingPathComponent:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "URLByAppendingPathExtension:", CFSTR("plist"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = 0;
    v18 = objc_msgSend(v8, "writeToURL:options:error:", v17, 268435457, &v22);
    v19 = v22;
    v20 = v19;
    if ((v18 & 1) != 0)
    {
      v19 = v11;
      a5 = a4;
      if (!a4)
        goto LABEL_9;
    }
    else if (!a5)
    {
LABEL_9:

      goto LABEL_10;
    }
    *a5 = objc_retainAutorelease(v19);
    goto LABEL_9;
  }
  v18 = 0;
  if (a5)
    *a5 = objc_retainAutorelease(v9);
LABEL_10:

  return v18;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

@end
