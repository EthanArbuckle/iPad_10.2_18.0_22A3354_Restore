@implementation AWDCoreRoutineLocationAwarenessStatistics(MetricManager)

- (char)_init
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  int v44;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  objc_super v52;

  v52.receiver = a1;
  v52.super_class = (Class)&off_1EFCDC638;
  v1 = (char *)objc_msgSendSuper2(&v52, sel_init);
  if (v1)
  {
    v2 = objc_opt_new();
    v3 = (int)*MEMORY[0x1E0DDD3E8];
    v4 = *(void **)&v1[v3];
    v51 = v3;
    *(_QWORD *)&v1[v3] = v2;

    v5 = objc_opt_new();
    v6 = (int)*MEMORY[0x1E0DDD3A0];
    v7 = *(void **)&v1[v6];
    v50 = v6;
    *(_QWORD *)&v1[v6] = v5;

    v8 = objc_opt_new();
    v9 = (int)*MEMORY[0x1E0DDD408];
    v10 = *(void **)&v1[v9];
    v49 = v9;
    *(_QWORD *)&v1[v9] = v8;

    v11 = objc_opt_new();
    v12 = (int)*MEMORY[0x1E0DDD3F0];
    v13 = *(void **)&v1[v12];
    v48 = v12;
    *(_QWORD *)&v1[v12] = v11;

    v14 = objc_opt_new();
    v15 = (int)*MEMORY[0x1E0DDD400];
    v16 = *(void **)&v1[v15];
    v47 = v15;
    *(_QWORD *)&v1[v15] = v14;

    v17 = objc_opt_new();
    v18 = (int)*MEMORY[0x1E0DDD3F8];
    v19 = *(void **)&v1[v18];
    v46 = v18;
    *(_QWORD *)&v1[v18] = v17;

    v20 = objc_opt_new();
    v21 = (int)*MEMORY[0x1E0DDD3D8];
    v22 = *(void **)&v1[v21];
    *(_QWORD *)&v1[v21] = v20;

    v23 = objc_opt_new();
    v24 = (int)*MEMORY[0x1E0DDD3E0];
    v25 = *(void **)&v1[v24];
    *(_QWORD *)&v1[v24] = v23;

    v26 = objc_opt_new();
    v27 = (int)*MEMORY[0x1E0DDD3B0];
    v28 = *(void **)&v1[v27];
    *(_QWORD *)&v1[v27] = v26;

    v29 = objc_opt_new();
    v30 = (int)*MEMORY[0x1E0DDD3B8];
    v31 = *(void **)&v1[v30];
    *(_QWORD *)&v1[v30] = v29;

    v32 = objc_opt_new();
    v33 = (int)*MEMORY[0x1E0DDD3C0];
    v34 = *(void **)&v1[v33];
    *(_QWORD *)&v1[v33] = v32;

    v35 = objc_opt_new();
    v36 = (int)*MEMORY[0x1E0DDD3C8];
    v37 = *(void **)&v1[v36];
    *(_QWORD *)&v1[v36] = v35;

    v38 = objc_opt_new();
    v39 = (int)*MEMORY[0x1E0DDD3D0];
    v40 = *(void **)&v1[v39];
    *(_QWORD *)&v1[v39] = v38;

    v41 = objc_opt_new();
    v42 = (int)*MEMORY[0x1E0DDD3A8];
    v43 = *(void **)&v1[v42];
    *(_QWORD *)&v1[v42] = v41;

    v44 = 24;
    do
    {
      objc_msgSend(*(id *)&v1[v51], "addCount:", 0, v46);
      objc_msgSend(*(id *)&v1[v50], "addCount:", 0);
      objc_msgSend(*(id *)&v1[v49], "addCount:", 0);
      objc_msgSend(*(id *)&v1[v48], "addCount:", 0);
      objc_msgSend(*(id *)&v1[v47], "addCount:", 0);
      objc_msgSend(*(id *)&v1[v46], "addCount:", 0);
      objc_msgSend(*(id *)&v1[v21], "addCount:", 0);
      objc_msgSend(*(id *)&v1[v24], "addCount:", 0);
      objc_msgSend(*(id *)&v1[v27], "addCount:", 0);
      objc_msgSend(*(id *)&v1[v30], "addCount:", 0);
      objc_msgSend(*(id *)&v1[v33], "addCount:", 0);
      objc_msgSend(*(id *)&v1[v36], "addCount:", 0);
      objc_msgSend(*(id *)&v1[v39], "addCount:", 0);
      objc_msgSend(*(id *)&v1[v42], "addCount:", 0);
      --v44;
    }
    while (v44);
  }
  return v1;
}

- (uint64_t)metricId
{
  return 2883622;
}

- (BOOL)valid:()MetricManager
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  __CFString *v24;
  _QWORD v25[15];

  v25[14] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a1, "conformsToProtocol:", &unk_1EFCD9890) & 1) == 0)
  {
    v16 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromProtocol((Protocol *)&unk_1EFCD9890);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("Invalid metric. metric does not conform to the %@ protocol."), v17);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!a3)
      goto LABEL_16;
    goto LABEL_14;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v15 = CFSTR("Invalid metric. the metric does not have an ID.");
    if (!a3)
      goto LABEL_16;
    goto LABEL_14;
  }
  v5 = *(_QWORD *)&a1[*MEMORY[0x1E0DDD3A0]];
  v25[0] = *(_QWORD *)&a1[*MEMORY[0x1E0DDD3E8]];
  v25[1] = v5;
  v6 = *(_QWORD *)&a1[*MEMORY[0x1E0DDD3F0]];
  v25[2] = *(_QWORD *)&a1[*MEMORY[0x1E0DDD408]];
  v25[3] = v6;
  v7 = *(_QWORD *)&a1[*MEMORY[0x1E0DDD3F8]];
  v25[4] = *(_QWORD *)&a1[*MEMORY[0x1E0DDD400]];
  v25[5] = v7;
  v8 = *(_QWORD *)&a1[*MEMORY[0x1E0DDD3E0]];
  v25[6] = *(_QWORD *)&a1[*MEMORY[0x1E0DDD3D8]];
  v25[7] = v8;
  v9 = *(_QWORD *)&a1[*MEMORY[0x1E0DDD3B8]];
  v25[8] = *(_QWORD *)&a1[*MEMORY[0x1E0DDD3B0]];
  v25[9] = v9;
  v10 = *(_QWORD *)&a1[*MEMORY[0x1E0DDD3C8]];
  v25[10] = *(_QWORD *)&a1[*MEMORY[0x1E0DDD3C0]];
  v25[11] = v10;
  v11 = *(_QWORD *)&a1[*MEMORY[0x1E0DDD3A8]];
  v25[12] = *(_QWORD *)&a1[*MEMORY[0x1E0DDD3D0]];
  v25[13] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {
    v13 = 0;
    while (1)
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "countsCount") != 24)
        break;

      if (objc_msgSend(v12, "count") <= (unint64_t)++v13)
        goto LABEL_7;
    }
    v18 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v14, "countsCount"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("Invalid metric. Incorrect bin count, %@, for histogram field at index %d."), v19, v13);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_7:
    v15 = 0;
  }

  if (a3)
  {
LABEL_14:
    if (v15)
    {
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v23 = *MEMORY[0x1E0CB2D50];
      v24 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("RTMetricManagerErrorDomain"), 1, v21);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
LABEL_16:

  return v15 == 0;
}

@end
