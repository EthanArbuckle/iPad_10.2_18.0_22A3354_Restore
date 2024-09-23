@implementation PFCameraAdjustmentsSerialization

+ (id)deserializedAdjustmentsFromData:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0CB3710];
  v6 = a3;
  objc_msgSend(v5, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)serializedAdjustments:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, a4);
}

+ (id)serializedDictionaryForFilters:(id)a3 portraitMetadata:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  id v20;

  v8 = a3;
  v9 = a4;
  if (v8)
  {
    v20 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, &v20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v20;
    v12 = 0;
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to serialize filters, error: %@"), v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_errorWithMessage:code:", v13, -94102);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (!v9)
    {
LABEL_9:
      v14 = 0;
      v15 = 0;
      v16 = 0;
      if (v12)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else
  {
    objc_msgSend(a1, "_errorWithMessage:code:", CFSTR("Missing filters parameter"), -94103);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    if (!v9)
      goto LABEL_9;
  }
  if (v12)
    goto LABEL_9;
  v19 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, &v19);
  v14 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", CFSTR("0.0"), CFSTR("version"));
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v10, CFSTR("filters"));
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v14, CFSTR("portraitMetadata"));
  v16 = (void *)objc_msgSend(v17, "copy");

  v12 = 0;
  v15 = (void *)v14;
LABEL_11:
  if (a5)
    *a5 = objc_retainAutorelease(v12);

  return v16;
}

+ (BOOL)deserializeDictionary:(id)a3 toFilters:(id *)a4 portraitMetadata:(id *)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id *v25;
  id *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id *v31;
  void *v32;
  BOOL v33;
  void *v35;
  uint64_t v36;
  id *v37;
  void *v38;
  id v39;
  void *v40;
  void *context;
  void *contexta;
  uint64_t v43;
  id v44;
  id v45;
  uint64_t v46;
  _QWORD v47[3];

  v47[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = v10;
  if (!v10)
  {
    v15 = 0;
    v16 = 0;
    v17 = 0;
    goto LABEL_35;
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("version"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("filters"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("portraitMetadata"));
  v43 = objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v14 = CFSTR("Missing version");
LABEL_13:
    v18 = a1;
    v19 = -94100;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = CFSTR("Version value is wrong type");
    goto LABEL_13;
  }
  if ((objc_msgSend(v12, "isEqualToString:", CFSTR("0.0")) & 1) != 0)
  {
    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (!v43)
          goto LABEL_16;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_16;
        v14 = CFSTR("PortraitMetadata value is wrong type");
      }
      else
      {
        v14 = CFSTR("Filters value is wrong type");
      }
    }
    else
    {
      v14 = CFSTR("Missing filters");
    }
    goto LABEL_13;
  }
  v19 = -94101;
  v14 = CFSTR("Unsupported version");
  v18 = a1;
LABEL_14:
  objc_msgSend(v18, "_errorWithMessage:code:", v14, v19);
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v17 = 0;
    v16 = 0;
    goto LABEL_31;
  }
LABEL_16:
  context = (void *)MEMORY[0x1A1B0CDDC]();
  v47[0] = objc_opt_class();
  v47[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v20);
  v21 = v13;
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0;
  v40 = v21;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v21, &v45);
  v15 = (uint64_t)v45;
  objc_msgSend(v23, "setDelegate:", a1);
  v39 = a1;
  if (v23)
  {
    objc_msgSend(v23, "decodeObjectOfClasses:forKey:", v22, *MEMORY[0x1E0CB2CD0]);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error unarchiving filters, error: %@"), v15);
    v35 = v12;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_errorWithMessage:code:", v24, -94100);
    v37 = a4;
    v25 = a5;
    v26 = a6;
    v27 = objc_claimAutoreleasedReturnValue();

    v17 = 0;
    v15 = v27;
    a6 = v26;
    a5 = v25;
    v12 = v35;
    a4 = v37;
  }
  if (!(v17 | v15))
  {
    objc_msgSend(v39, "_errorWithMessage:code:", CFSTR("No filters could be extracted"), -94100);
    v15 = objc_claimAutoreleasedReturnValue();
  }

  objc_autoreleasePoolPop(context);
  v16 = 0;
  v28 = (void *)v43;
  if (!v43 || v15)
  {
    v13 = v40;
    goto LABEL_32;
  }
  contexta = (void *)MEMORY[0x1A1B0CDDC]();
  v46 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v43, &v44);
  v15 = (uint64_t)v44;
  if (v30)
  {
    objc_msgSend(v30, "decodeObjectOfClasses:forKey:", v29, *MEMORY[0x1E0CB2CD0]);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error unarchiving portrait metadata, error: %@"), v15);
    v31 = a6;
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "_errorWithMessage:code:", v32, -94100);
    v36 = objc_claimAutoreleasedReturnValue();

    a6 = v31;
    v16 = 0;
    v15 = v36;
  }
  if (!(v16 | v15))
  {
    objc_msgSend(v39, "_errorWithMessage:code:", CFSTR("No portrait metadata could be extracted"), -94100);
    v15 = objc_claimAutoreleasedReturnValue();
  }

  objc_autoreleasePoolPop(contexta);
  v13 = v40;
LABEL_31:
  v28 = (void *)v43;
LABEL_32:

  if (!v15)
  {
LABEL_35:
    v33 = 1;
    if (!a4)
      goto LABEL_37;
    goto LABEL_36;
  }

  v33 = 0;
  v16 = 0;
  v17 = 0;
  if (a4)
LABEL_36:
    *a4 = objc_retainAutorelease((id)v17);
LABEL_37:
  if (a5)
    *a5 = objc_retainAutorelease((id)v16);
  if (a6)
    *a6 = objc_retainAutorelease((id)v15);

  return v33;
}

+ (id)_errorWithMessage:(id)a3 code:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0CB2D50];
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PFCameraAdjustmentsSerializationErrorDomain"), a4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (Class)unarchiver:(id)a3 cannotDecodeObjectOfClassName:(id)a4 originalClasses:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  objc_class *v9;

  v6 = a4;
  if (objc_msgSend(a5, "containsObject:", CFSTR("CIFilter")))
  {
    objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_opt_class();

  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  return v9;
}

@end
