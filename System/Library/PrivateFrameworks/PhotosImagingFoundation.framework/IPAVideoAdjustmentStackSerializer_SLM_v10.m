@implementation IPAVideoAdjustmentStackSerializer_SLM_v10

- (id)videoAdjustmentStackFromData:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v11;
  uint64_t v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13 = 0;
  +[IPAAdjustmentStackSerializer unarchiveData:error:](IPAAdjustmentStackSerializer, "unarchiveData:error:", a3, &v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v13;
  if (v5)
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "setIdentifier:", CFSTR("SloMo"));
    objc_msgSend(v7, "setSettings:", v5);
    v8 = (void *)objc_opt_new();
    v14[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAdjustments:", v9);

    if (!a4)
      goto LABEL_7;
  }
  else
  {
    v8 = 0;
    if (!a4)
      goto LABEL_7;
  }
  if (v6)
    *a4 = objc_retainAutorelease(v6);
LABEL_7:
  v11 = *MEMORY[0x1E0CA2E68];
  v12 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  objc_msgSend(v8, "setNaturalDuration:", &v11);

  return v8;
}

- (id)dataFromVideoAdjustmentStack:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  id v26;

  v6 = a3;
  objc_msgSend(v6, "adjustments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") != 1)
  {
    IPAAdjustmentError(1000, CFSTR("SLM serializer only for singleton SLM adjustments: %@"), v8, v9, v10, v11, v12, v13, (uint64_t)v6);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    if (!a4)
      goto LABEL_10;
    goto LABEL_8;
  }
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SloMo")) & 1) != 0)
  {
    objc_msgSend(v14, "settings");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    -[IPAVideoAdjustmentStackSerializer_SLM_v10 dataFromArchive:error:](self, "dataFromArchive:error:", v22, &v26);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v26;

  }
  else
  {
    IPAAdjustmentError(1000, CFSTR("SLM serializer only for singleton SLM adjustments: %@"), v16, v17, v18, v19, v20, v21, (uint64_t)v6);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v23 = 0;
  }

  if (a4)
  {
LABEL_8:
    if (v24)
      *a4 = objc_retainAutorelease(v24);
  }
LABEL_10:

  return v23;
}

- (id)dataFromArchive:(id)a3 error:(id *)a4
{
  return +[IPAAdjustmentStackSerializer archiveDictionary:error:](IPAAdjustmentStackSerializer, "archiveDictionary:error:", a3, a4);
}

- (id)archiveFromData:(id)a3 error:(id *)a4
{
  return +[IPAAdjustmentStackSerializer unarchiveData:error:](IPAAdjustmentStackSerializer, "unarchiveData:error:", a3, a4);
}

@end
