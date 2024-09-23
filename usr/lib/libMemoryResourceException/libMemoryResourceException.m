const __CFString *MREExceptionTypeToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 6)
    return CFSTR("MREExceptionManual");
  else
    return off_24CFC8720[a1 - 1];
}

void ReportMemoryExceptionFromTask(uint64_t a1, char a2, const char *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD);
  BOOL v12;
  id v13;
  void *v14;
  BOOL v15;
  id v16;
  void *v17;
  void (**v18)(_QWORD, _QWORD);
  void *v19;
  void *v20;
  __CFString *v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  void (**v27)(_QWORD, _QWORD);
  int v28;
  char v29;
  unsigned int object_addr;
  unsigned int object_type;
  int x;
  _QWORD v33[5];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  const __CFString *v41;
  uint8_t buf[4];
  const __CFString *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  v11 = (void (**)(_QWORD, _QWORD))v10;
  if ((a1 - 1) >= 0xFFFFFFFE)
  {
    if (v10)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", MREErrorDomain, 9, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v11)[2](v11, v14);

    }
    goto LABEL_31;
  }
  object_addr = 0;
  object_type = 0;
  if (mach_port_kernel_object(*MEMORY[0x24BDAEC58], a1, &object_type, &object_addr))
    v12 = 0;
  else
    v12 = object_type == 2;
  if (!v12)
  {
    if (v11)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", MREErrorDomain, 9, 0);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v11)[2](v11, v13);
LABEL_30:

      goto LABEL_31;
    }
    goto LABEL_31;
  }
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = sub_2134562E8;
  v38 = sub_2134562F8;
  v39 = 0;
  if (a3)
    goto LABEL_13;
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = sub_213456300;
  v33[3] = &unk_24CFC8810;
  v33[4] = &v34;
  if ((sub_21344FF8C(a1, v33) & 1) == 0)
  {
    x = 0;
    if (pid_for_task(a1, &x))
      goto LABEL_20;
    if ((proc_pidpath(x, buf, 0x400u) - 1) <= 0x3FE)
    {
      v22 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", buf);
      v23 = (void *)v35[5];
      v35[5] = v22;

    }
  }
  a3 = (const char *)objc_msgSend(objc_retainAutorelease((id)v35[5]), "UTF8String");
  if (a3)
  {
LABEL_13:
    v15 = strncmp(a3, "/usr/libexec/ReportMemoryException", 0x400uLL) == 0;
    _Block_object_dispose(&v34, 8);

    if (!v15)
    {
      if (SMJobIsEnabled())
      {
        if (qword_253D9AA18 != -1)
          dispatch_once(&qword_253D9AA18, &unk_24CFC8758);
        v16 = (id)qword_253D9AA10;
        if (v16)
        {
          v17 = v16;
          v24[0] = MEMORY[0x24BDAC760];
          v24[1] = 3221225472;
          v24[2] = sub_213455F84;
          v24[3] = &unk_24CFC87E8;
          v27 = v11;
          v28 = a1;
          v29 = a2;
          v13 = v17;
          v25 = v13;
          v26 = v9;
          v18 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199B32E8](v24);
          v18[2](v18, 0);

          v19 = v27;
        }
        else
        {
          if (!v11)
          {
            v13 = 0;
            goto LABEL_30;
          }
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", MREErrorDomain, 7, 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v11)[2](v11, v19);
          v13 = 0;
        }
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v43 = CFSTR("RME is disabled. To re-enable use 'ReportMemoryExceptionTool --enable'");
          _os_log_impl(&dword_21344C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@. Aborting.", buf, 0xCu);
        }
        if (!v11)
          goto LABEL_31;
        v20 = (void *)MEMORY[0x24BDD1540];
        v21 = MREErrorDomain;
        v40 = *MEMORY[0x24BDD0FC8];
        v41 = CFSTR("RME is disabled. To re-enable use 'ReportMemoryExceptionTool --enable'");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, 17, v13);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v19);
      }

      goto LABEL_30;
    }
    goto LABEL_21;
  }
LABEL_20:
  _Block_object_dispose(&v34, 8);

LABEL_21:
  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", MREErrorDomain, 10, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v11)[2](v11, v13);
    goto LABEL_30;
  }
LABEL_31:

}

void sub_21344E37C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

int64x2_t *sub_21344E3A4(int64x2_t *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  int64x2_t *v5;

  if (result)
  {
    v5 = result;
    result = sub_21344E3EC((int64x2_t *)result->i64[1], a2, a3, a4, *a5, a5[1], a5[2], a5[3], a5[4]);
    v5->i64[1] = (uint64_t)result;
  }
  return result;
}

int64x2_t *sub_21344E3EC(int64x2_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  int64x2_t *v17;
  int64x2_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int64x2_t *v24;
  uint64_t *v25;
  int64x2_t *v26;
  int64x2_t *v27;
  int64x2_t *v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  BOOL v33;
  unint64_t v34;
  int64x2_t v35;
  uint64x2_t v36;
  int64x2_t v37;
  int64x2_t v38;
  int8x16_t v39;
  int8x16_t v40;
  int64x2_t v41;
  int8x16_t v42;
  int8x16_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;

  v17 = (int64x2_t *)malloc_type_malloc(0x40uLL, 0x1020040D3BB1902uLL);
  v18 = v17;
  if (!a1)
  {
    v17->i64[0] = a2;
    v17->i64[1] = a3;
    v17[1].i64[0] = a7;
    v17[1].i64[1] = a5;
    v17[2].i64[0] = a6;
    v17[2].i64[1] = a8;
    a1 = v17;
    v17[3].i64[0] = a9;
    v17[3].i64[1] = 0;
    return a1;
  }
  v19 = 0;
  v18->i64[0] = a2;
  v18->i64[1] = a3;
  v18[1].i64[0] = a7;
  v18[1].i64[1] = a5;
  v20 = a4 - 1;
  v21 = -a4;
  v18[2].i64[0] = a6;
  v18[2].i64[1] = a8;
  v22 = a2 & -a4;
  v23 = (a2 + a3 + a4 - 1) & -a4;
  v24 = a1;
  v18[3].i64[0] = a9;
  v18[3].i64[1] = 0;
  do
  {
    v25 = (uint64_t *)v24;
    if (((v24->i64[0] + v20 + v24->i64[1]) & (unint64_t)v21) >= v22)
    {
      v25 = v19;
      if ((v24->i64[0] & (unint64_t)v21) > v23)
      {
        v25 = v19;
        if (!v19)
          goto LABEL_12;
LABEL_7:
        v26 = (int64x2_t *)v25[7];
        if (v26 == v24)
        {
          v25[7] = (uint64_t)v18;
          v18[3].i64[1] = (uint64_t)v24;
          return a1;
        }
        v27 = a1;
        if (v26)
          goto LABEL_14;
        return v27;
      }
    }
    v24 = (int64x2_t *)v24[3].i64[1];
    v19 = v25;
  }
  while (v24);
  if (v25)
    goto LABEL_7;
LABEL_12:
  if (v24 == a1)
  {
    v18[3].i64[1] = (uint64_t)a1;
    return v18;
  }
  v18[3].i64[1] = a1[3].i64[1];
  v26 = a1;
  v27 = v18;
LABEL_14:
  if (v26 == v24)
    return v27;
  do
  {
    v28 = v26;
    v29 = v26->i64[0];
    v30 = v26->i64[0] & v21;
    v31 = v26->i64[1] + v26->i64[0];
    v32 = (v31 + v20) & v21;
    if (v22 > v30)
      v30 = v22;
    if (v23 < v32)
      v32 = v23;
    v33 = v32 >= v30;
    v34 = v32 - v30;
    if (!v33)
      v34 = 0;
    v35 = v26[1];
    v36 = (uint64x2_t)vdupq_n_s64(v34);
    v37 = v18[1];
    v38 = v18[2];
    v39 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v37, (uint64x2_t)v35), (int8x16_t)v37, (int8x16_t)v35);
    v40 = (int8x16_t)vqsubq_u64((uint64x2_t)vaddq_s64(v35, v37), v36);
    v18[1] = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v40, (uint64x2_t)v39), v40, v39);
    v41 = v26[2];
    v42 = (int8x16_t)vqsubq_u64((uint64x2_t)vaddq_s64(v41, v38), v36);
    v43 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v38, (uint64x2_t)v41), (int8x16_t)v38, (int8x16_t)v41);
    v18[2] = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v42, (uint64x2_t)v43), v42, v43);
    v44 = v18[3].u64[0];
    v45 = v26[3].u64[0];
    v46 = v26[3].i64[1];
    v33 = v45 + v44 >= v34;
    v47 = v45 + v44 - v34;
    if (!v33)
      v47 = 0;
    if (v44 <= v45)
      v44 = v26[3].u64[0];
    if (v47 <= v44)
      v47 = v44;
    if (v29 >= v18->i64[0])
      v29 = v18->i64[0];
    if (v18->i64[1] + v18->i64[0] > v31)
      v31 = v18->i64[1] + v18->i64[0];
    v18->i64[0] = v29;
    v18->i64[1] = v31 - v29;
    v18[3].i64[0] = v47;
    v18[3].i64[1] = v46;
    v26 = (int64x2_t *)v26[3].i64[1];
    free(v28);
    a1 = v18;
    if (v25)
    {
      v25[7] = (uint64_t)v18;
      a1 = v27;
    }
    if (!v26)
      break;
    v27 = a1;
  }
  while (v26 != v24);
  return a1;
}

void sub_21344E63C(uint64_t a1, void *a2, uint64_t a3)
{
  _QWORD *v5;
  int64x2_t *v6;
  uint64_t *i;
  _QWORD *v8;

  v5 = a2;
  if (a1)
  {
    v6 = *(int64x2_t **)(a1 + 8);
    v8 = v5;
    for (i = (uint64_t *)v5[1]; i; i = (uint64_t *)i[7])
      v6 = sub_21344E3EC(v6, *i, i[1], a3, i[3], i[4], i[2], i[5], i[6]);
    *(_QWORD *)(a1 + 8) = v6;
    v5 = v8;
  }

}

void sub_21344E6B4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a2;
  if (a1)
  {
    v7 = v5;
    objc_msgSend(v5, "subrangeList");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      sub_21344E63C(a1, v6, a3);
    else
      *(_QWORD *)(a1 + 8) = sub_21344E3EC(*(int64x2_t **)(a1 + 8), objc_msgSend(v7, "offset"), objc_msgSend(v7, "size"), a3, objc_msgSend(v7, "dirtySize"), objc_msgSend(v7, "swappedSize"), objc_msgSend(v7, "cleanSize"), objc_msgSend(v7, "reclaimableSize"), objc_msgSend(v7, "wiredSize"));

    v5 = v7;
  }

}

uint64_t sub_21344E7B4@<X0>(uint64_t result@<X0>, int64x2_t *a2@<X8>)
{
  int64x2_t v2;
  uint64_t v3;
  uint64_t v4;
  int64x2_t v5;

  v2 = 0uLL;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (result)
  {
    v3 = *(_QWORD *)(result + 8);
    if (v3)
    {
      v4 = 0;
      v5 = 0uLL;
      do
      {
        v4 += *(_QWORD *)(v3 + 16);
        v2 = vaddq_s64(*(int64x2_t *)(v3 + 24), v2);
        v5 = vaddq_s64(*(int64x2_t *)(v3 + 40), v5);
        v3 = *(_QWORD *)(v3 + 56);
      }
      while (v3);
      a2[1].i64[0] = v4;
      *a2 = v2;
      *(int64x2_t *)((char *)a2 + 24) = v5;
    }
  }
  return result;
}

id sub_21344E860(void *a1)
{
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = sub_21344EB28;
  v31[3] = &unk_24CFC8540;
  v6 = v2;
  v32 = v6;
  v7 = v3;
  v33 = v7;
  v8 = v4;
  v34 = v8;
  v9 = v5;
  v35 = v9;
  v26 = v1;
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", v31);
  v25 = v6;
  objc_msgSend(v6, "keysSortedByValueUsingComparator:", &unk_24CFC8580);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(v7, "objectForKeyedSubscript:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v19);

        }
        objc_msgSend(v8, "objectForKeyedSubscript:", v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", v17);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v21);

        }
        objc_msgSend(v9, "objectForKeyedSubscript:", v17);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", v17);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v23);

        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    }
    while (v14);
  }

  return v11;
}

void sub_21344EB28(id *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v13 = a2;
  sub_2134642FC(v13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(a1[4], "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "unsignedIntValue");

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v5 + 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "setObject:forKeyedSubscript:", v6, v3);

    if (objc_msgSend(v13, "hasSuffix:", CFSTR(".memgraph")))
    {
      if (objc_msgSend(v13, "containsString:", qword_254B9C588))
      {
        v9 = a1[5];
        v8 = a1 + 5;
        v7 = v9;
      }
      else
      {
        v11 = a1[6];
        v8 = a1 + 6;
        v7 = v11;
      }
    }
    else
    {
      if (!objc_msgSend(v13, "hasSuffix:", CFSTR(".lite_diag")))
        goto LABEL_10;
      v10 = a1[7];
      v8 = a1 + 7;
      v7 = v10;
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      objc_msgSend(*v8, "setObject:forKeyedSubscript:", v13, v3);
  }
LABEL_10:

}

uint64_t sub_21344EC38(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "unsignedIntValue");
  if (v6 <= objc_msgSend(v5, "unsignedIntValue"))
  {
    v8 = objc_msgSend(v4, "unsignedIntValue");
    v7 = v8 < objc_msgSend(v5, "unsignedIntValue");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

uint64_t sub_21344EEF4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(a3, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412802;
    v10 = v7;
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v8;
    _os_log_fault_impl(&dword_21344C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "CacheEnumerator error for %@ at volume %@: %@\n", (uint8_t *)&v9, 0x20u);

  }
  return 1;
}

id sub_21344FB18(void *a1, unint64_t a2, unint64_t *a3)
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unint64_t *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v16 = a3;
  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a1;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v19;
    v11 = *MEMORY[0x24BDBCC48];
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v10)
        objc_enumerationMutation(v6);
      v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12);
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v13, v16);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v13);
      v17 = 0;
      objc_msgSend(v14, "getResourceValue:forKey:error:", &v17, v11, 0);
      v9 += objc_msgSend(v17, "unsignedLongLongValue");

      if (v9 > a2)
        break;
      if (v8 == ++v12)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v8)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v9 = 0;
  }

  if (v16)
    *v16 = v9;

  return v5;
}

id sub_21344FCA8(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  id v11;
  id v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", -86400.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    v7 = *MEMORY[0x24BDBCBF0];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 0;
        objc_msgSend(v10, "getResourceValue:forKey:error:", &v14, v7, 0);
        v11 = v14;
        if (v11 && (objc_msgSend(v2, "compare:", v11) == -1 || !objc_msgSend(v2, "compare:", v11)))
          objc_msgSend(v13, "addObject:", v9);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

  return v13;
}

id sub_21344FE58(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(v4, "containsObject:", v11, (_QWORD)v13) & 1) == 0)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

uint64_t sub_21344FF8C(uint64_t a1, void *a2)
{
  void (**v3)(id, _DWORD *, unint64_t);
  unsigned int *v4;
  _DWORD *v5;
  unint64_t v6;
  mach_vm_address_t v7;
  mach_vm_size_t v9;
  mach_vm_address_t kcd_addr_begin;

  v3 = a2;
  if (!(_DWORD)a1)
    goto LABEL_12;
  v9 = 0;
  kcd_addr_begin = 0;
  v4 = (unsigned int *)MEMORY[0x24BDAEC58];
  if (task_map_corpse_info_64(*MEMORY[0x24BDAEC58], a1, &kcd_addr_begin, &v9))
  {
LABEL_11:
    a1 = 0;
    goto LABEL_12;
  }
  v5 = (_DWORD *)kcd_addr_begin;
  v6 = v9 + kcd_addr_begin;
  v7 = kcd_addr_begin + 16;
  if (kcd_addr_begin + 16 > v9 + kcd_addr_begin
    || v7 + *(unsigned int *)(kcd_addr_begin + 4) > v6
    || *(_DWORD *)kcd_addr_begin != -559025833)
  {
    MEMORY[0x2199B3534](*v4, kcd_addr_begin);
    goto LABEL_11;
  }
  do
  {
    if (v7 + v5[1] > v6)
      break;
    if (*v5 == -242132755)
      break;
    v3[2](v3, v5, v6);
    v5 = (_DWORD *)(v7 + v5[1]);
    v7 = (mach_vm_address_t)(v5 + 4);
  }
  while ((unint64_t)(v5 + 4) <= v6);
  MEMORY[0x2199B3534](*v4, kcd_addr_begin, v9);
  a1 = 1;
LABEL_12:

  return a1;
}

id sub_2134500AC(uint64_t a1)
{
  if (a1)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ [%d]"), *(_QWORD *)(a1 + 64), *(unsigned int *)(a1 + 28));
    a1 = objc_claimAutoreleasedReturnValue();
  }
  return (id)a1;
}

id sub_2134505E8(int a1)
{
  _BYTE buffer[1024];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  if (proc_pidpath(a1, buffer, 0x400u) < 1)
    return 0;
  else
    return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", buffer);
}

void *sub_213450664(int a1)
{
  void *v1;
  size_t size;
  int v4[2];
  int v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  size = 0;
  *(_QWORD *)v4 = 0xE00000001;
  v5 = 1;
  v6 = a1;
  if (sysctl(v4, 4u, 0, &size, 0, 0) < 0)
    return 0;
  v1 = malloc_type_malloc(size, 0xC52EB313uLL);
  if (v1 && sysctl(v4, 4u, v1, &size, 0, 0) < 0)
  {
    free(v1);
    return 0;
  }
  return v1;
}

id sub_213450730(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "initWithTimeIntervalSince1970:", (double)a1);
  objc_msgSend(v3, "dateByAddingTimeInterval:", (double)a2 / 1000000.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id sub_21345078C(unint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  if (a1 >= 2)
  {
    v2 = xpc_coalition_copy_info();
    v3 = (void *)v2;
    if (v2 && MEMORY[0x2199B35DC](v2) == MEMORY[0x24BDACFA0])
      v1 = v3;
    else
      v1 = 0;

  }
  else
  {
    v1 = 0;
  }
  return v1;
}

__CFString *sub_2134507F0(int a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  __CFBundle *v8;
  __CFBundle *v9;
  const __CFString *Identifier;
  __CFString *Copy;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    if (a1 == 1)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:", v5);
      if (v7)
      {
        v8 = (__CFBundle *)_CFBundleCreateWithExecutableURLIfLooksLikeBundle();
        if (v8)
        {
          v9 = v8;
          Identifier = CFBundleGetIdentifier(v8);
          if (Identifier)
          {
            Copy = (__CFString *)CFStringCreateCopy(0, Identifier);
            CFRelease(v9);
            if (Copy)
            {
LABEL_15:

              goto LABEL_16;
            }
          }
          else
          {
            CFRelease(v9);
          }
        }
        if (v6)
        {
          Copy = (__CFString *)xpc_dictionary_get_string(v6, (const char *)*MEMORY[0x24BDAC718]);
          if (Copy)
            Copy = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", Copy);
          goto LABEL_15;
        }
      }
      Copy = 0;
      goto LABEL_15;
    }
    Copy = MREBundleStringForUnbundledProcess;
  }
  else
  {
    Copy = 0;
  }
LABEL_16:

  return Copy;
}

char *sub_21345090C(void *a1)
{
  id v1;
  void *v2;
  char *string;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    string = (char *)xpc_dictionary_get_string(v1, (const char *)*MEMORY[0x24BDAC710]);
    if (string || (string = (char *)xpc_dictionary_get_string(v2, (const char *)*MEMORY[0x24BDAC718])) != 0)
      string = (char *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", string);
  }
  else
  {
    string = 0;
  }

  return string;
}

BOOL sub_213450990(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB3430]), "initWithTask:", a1);

  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315650;
      v9 = "isMSLEnabledForTask";
      v10 = 1024;
      v11 = a2;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_21344C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s - the target process (pid%i %@) has MallocStackLogging enabled", (uint8_t *)&v8, 0x1Cu);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v8 = 136315650;
    v9 = "isMSLEnabledForTask";
    v10 = 1024;
    v11 = a2;
    v12 = 2112;
    v13 = v5;
    _os_log_debug_impl(&dword_21344C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%s - the target process  (pid%i %@) has MallocStackLogging disabled", (uint8_t *)&v8, 0x1Cu);
  }

  return v6 != 0;
}

void sub_213450AFC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  uint64_t v5;
  void *v6;
  unsigned int v7;
  unsigned int v8;
  BOOL v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  _BYTE v18[1024];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    if ((*(_DWORD *)a2 & 0xFFFFFFF0) == 0x20)
      v3 = 17;
    else
      v3 = *(_DWORD *)a2;
    switch(v3)
    {
      case 2053:
        *(_DWORD *)(v2 + 28) = *(_DWORD *)(a2 + 16);
        break;
      case 2054:
        *(_DWORD *)(v2 + 32) = *(_DWORD *)(a2 + 16);
        break;
      case 2055:
      case 2056:
      case 2057:
      case 2058:
      case 2060:
      case 2061:
      case 2064:
      case 2065:
      case 2066:
      case 2067:
      case 2068:
      case 2070:
      case 2071:
      case 2072:
      case 2075:
      case 2076:
      case 2077:
        return;
      case 2059:
        sub_213450730(*(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24));
        v5 = objc_claimAutoreleasedReturnValue();
        v6 = *(void **)(v2 + 184);
        *(_QWORD *)(v2 + 184) = v5;

        break;
      case 2062:
        v7 = *(_DWORD *)(a2 + 4);
        v8 = *(_DWORD *)(a2 + 8) & 0xF;
        v9 = v7 >= v8;
        v10 = v7 - v8;
        if (!v9)
          v10 = 0;
        if (v10 >= 8)
        {
          v11 = *(_QWORD *)(a2 + 16);
          *(_QWORD *)(v2 + 200) = v11;
          *(_QWORD *)(v2 + 104) = v11 & 0x1FFF;
        }
        break;
      case 2063:
        __strlcpy_chk();
        v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v18);
        v13 = *(void **)(v2 + 72);
        *(_QWORD *)(v2 + 72) = v12;

        v14 = *(void **)(v2 + 72);
        if (v14)
        {
          objc_msgSend(v14, "lastPathComponent");
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = *(void **)(v2 + 64);
          *(_QWORD *)(v2 + 64) = v15;

        }
        break;
      case 2069:
        v17 = *(_DWORD *)(a2 + 16);
        *(_DWORD *)(v2 + 40) = v17;
        *(_BYTE *)(v2 + 16) = (v17 & 4) != 0;
        break;
      case 2073:
        *(_DWORD *)(v2 + 36) = *(_DWORD *)(a2 + 16);
        break;
      case 2074:
        *(_QWORD *)(v2 + 208) = *(_QWORD *)(a2 + 16);
        break;
      case 2078:
        *(_QWORD *)(v2 + 232) = *(_QWORD *)(a2 + 16);
        break;
      case 2079:
        *(_QWORD *)(v2 + 240) = *(_QWORD *)(a2 + 16);
        break;
      case 2080:
        *(_QWORD *)(v2 + 288) = *(_QWORD *)(a2 + 16);
        break;
      case 2081:
        *(_QWORD *)(v2 + 248) = *(_QWORD *)(a2 + 16);
        break;
      case 2082:
        *(_QWORD *)(v2 + 256) = *(_QWORD *)(a2 + 16);
        break;
      case 2083:
        *(_QWORD *)(v2 + 264) = *(_QWORD *)(a2 + 16);
        break;
      case 2084:
        *(_QWORD *)(v2 + 272) = *(_QWORD *)(a2 + 16);
        break;
      case 2085:
        *(_QWORD *)(v2 + 280) = *(_QWORD *)(a2 + 16);
        break;
      case 2086:
        *(_QWORD *)(v2 + 216) = *(_QWORD *)(a2 + 16);
        break;
      case 2087:
        *(_QWORD *)(v2 + 224) = *(_QWORD *)(a2 + 16);
        break;
      case 2088:
        *(_QWORD *)(v2 + 304) = *(_QWORD *)(a2 + 16);
        break;
      case 2089:
        *(_QWORD *)(v2 + 312) = *(_QWORD *)(a2 + 16);
        break;
      case 2090:
        *(_QWORD *)(v2 + 296) = *(_QWORD *)(a2 + 16);
        break;
      default:
        if (v3 == 17 && HIDWORD(*(_QWORD *)(a2 + 8)) == 2075 && *(_QWORD *)(a2 + 8) != 0)
          *(_QWORD *)(v2 + 176) = *(_QWORD *)(a2 + 16);
        break;
    }
  }
}

uint64_t sub_213450FF8(uint64_t a1)
{
  uint64_t result;
  uint64_t *v3;
  uint64_t v4;

  result = CSIsNull();
  if ((_DWORD)result)
  {
    v3 = *(uint64_t **)(a1 + 32);
    *v3 = CSSymbolicatorGetSymbolOwnerWithUUIDAtTime();
    v3[1] = v4;
    result = CSIsNull();
    if ((result & 1) == 0)
      return CSRetain();
  }
  return result;
}

void sub_213451074(uint64_t a1, void *a2)
{
  CSRelease();
  free(a2);
}

uint64_t sub_213452248(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v4 = qword_254B9C3D0;
  v5 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", qword_254B9C3D0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v6, "unsignedLongLongValue");
  if (v8 >= objc_msgSend(v7, "unsignedLongLongValue"))
  {
    v10 = objc_msgSend(v6, "unsignedLongLongValue");
    if (v10 <= objc_msgSend(v7, "unsignedLongLongValue"))
      v9 = 0;
    else
      v9 = -1;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

void sub_213452CA4(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_2134541D0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 184), 8);
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_2134541FC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t v51[128];
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  id v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5 && objc_msgSend(v5, "count"))
  {
    v40 = v6;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v41 = v5;
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v44 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          objc_msgSend(v12, "processIDs");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 28));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "containsObject:", v14);

          if (v15)
          {
            v16 = v12;
            objc_opt_self();
            objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v16, "surfaceID"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, qword_254B9C3B8);

            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v16, "length"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, qword_254B9C3D0);

            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v16, "dirtyLength"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setObject:forKeyedSubscript:", v20, qword_254B9C3D8);

            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v16, "residentLength"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setObject:forKeyedSubscript:", v21, qword_254B9C3E0);

            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v16, "wired"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setObject:forKeyedSubscript:", v22, qword_254B9C3E8);

            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v16, "purgeable"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setObject:forKeyedSubscript:", v23, qword_254B9C3F0);

            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v16, "cachedCopy"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setObject:forKeyedSubscript:", v24, qword_254B9C3F8);

            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v16, "memoryPool"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setObject:forKeyedSubscript:", v25, qword_254B9C3C8);

            objc_msgSend(v16, "formattedDescriptions");
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v17, "setObject:forKeyedSubscript:", v26, qword_254B9C3C0);
            objc_msgSend(v42, "addObject:", v17);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
      }
      while (v9);
    }

    v27 = *(_QWORD *)(a1 + 32);
    v28 = *(void **)(v27 + 160);
    *(_QWORD *)(v27 + 160) = v42;
    v29 = v42;

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
    v6 = v40;
    v5 = v41;
  }
  else
  {
    if (v6 && objc_msgSend(v6, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v31 = v6;
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v48;
        do
        {
          for (j = 0; j != v33; ++j)
          {
            if (*(_QWORD *)v48 != v34)
              objc_enumerationMutation(v31);
            objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * j), "description");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "addObject:", v36);

          }
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
        }
        while (v33);
      }

      v37 = *(_QWORD *)(a1 + 32);
      v38 = *(void **)(v37 + 168);
      *(_QWORD *)(v37 + 168) = v30;

    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      sub_2134500AC(*(_QWORD *)(a1 + 32));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v53 = v39;
      v54 = 2112;
      v55 = v6;
      _os_log_error_impl(&dword_21344C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Didn't get any IOAccel memory info for %@ (this is not necessarily an error). Errors: %@", buf, 0x16u);

    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }

}

id *sub_213454918(id *a1, void *a2, void *a3, _QWORD *a4)
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  id *v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  uint64_t v36;
  id v37;
  id v38;
  uint64_t v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  id v45;
  id v46;
  uint64_t v47;
  id v48;
  id v49;
  uint64_t v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  id v68;
  id v69;
  uint64_t v70;
  id v71;
  id v72;
  uint64_t v73;
  id v74;
  id v75;
  int v76;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  objc_super v86;
  uint64_t v87;
  _QWORD v88[2];

  v88[1] = *MEMORY[0x24BDAC8D0];
  v8 = a2;
  v9 = a3;
  if (!a1)
    goto LABEL_11;
  v86.receiver = a1;
  v86.super_class = (Class)MemoryResourceException;
  a1 = (id *)objc_msgSendSuper2(&v86, sel_init);
  if (!a1)
    goto LABEL_95;
  objc_msgSend(v8, "objectForKeyedSubscript:", qword_254B9C228);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid metadata version %@. Expected non-nil number"), v10, v78);
LABEL_8:
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (a4)
    {
      v13 = (void *)MEMORY[0x24BDD1540];
      v14 = MREErrorDomain;
      v87 = *MEMORY[0x24BDD0FC8];
      v88[0] = v11;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v88, &v87, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 18, v15);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_10;
  }
  if ((unint64_t)objc_msgSend(v10, "unsignedIntegerValue") >= 2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Diagnostic metadata version %@ is newer than the MRE log version %d"), v10, 1);
    goto LABEL_8;
  }
  a1[17] = (id)objc_msgSend(v10, "integerValue");
  objc_msgSend(v8, "objectForKeyedSubscript:", qword_254B9C240);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = a1[8];
  a1[8] = (id)v17;

  v19 = a1[8];
  objc_opt_class();
  if (!v19 || (objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", qword_254B9C248);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = a1[9];
    a1[9] = (id)v20;

    v22 = a1[9];
    objc_opt_class();
    if (!v22 || (objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", qword_254B9C250);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = a1[10];
      a1[10] = (id)v23;

      v25 = a1[10];
      objc_opt_class();
      if (!v25 || (objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", qword_254B9C258);
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = a1[11];
        a1[11] = (id)v26;

        v28 = a1[11];
        objc_opt_class();
        if (!v28 || (objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", qword_254B9C230);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if (!v29 || (objc_opt_isKindOfClass() & 1) == 0)
          {

            goto LABEL_11;
          }
          *((_DWORD *)a1 + 7) = objc_msgSend(v29, "integerValue");
          objc_msgSend(v8, "objectForKeyedSubscript:", qword_254B9C238);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if (v30 && (objc_opt_isKindOfClass() & 1) != 0)
          {
            v85 = v30;
            *((_DWORD *)a1 + 8) = objc_msgSend(v30, "integerValue");
            objc_msgSend(v8, "objectForKeyedSubscript:", qword_254B9C298);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if (v31 && (objc_opt_isKindOfClass() & 1) != 0)
            {
              v84 = v31;
              *((_DWORD *)a1 + 9) = objc_msgSend(v31, "unsignedIntegerValue");
              objc_msgSend(v8, "objectForKeyedSubscript:", qword_254B9C260);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if (!v32)
                goto LABEL_83;
              if ((objc_opt_isKindOfClass() & 1) == 0)
                goto LABEL_83;
              a1[12] = (id)objc_msgSend(v32, "integerValue");
              objc_msgSend(v8, "objectForKeyedSubscript:", qword_254B9C268);
              v33 = objc_claimAutoreleasedReturnValue();
              v34 = a1[42];
              a1[42] = (id)v33;

              v82 = a1[42];
              objc_opt_class();
              if (!v82 || (objc_opt_isKindOfClass() & 1) != 0)
              {
                v83 = v32;
                objc_msgSend(v8, "objectForKeyedSubscript:", qword_254B9C270);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if (v35)
                {
                  v81 = v35;
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                    goto LABEL_84;
                  a1[13] = (id)objc_msgSend(v35, "unsignedLongLongValue");
                  objc_msgSend(v8, "objectForKeyedSubscript:", qword_254B9C278);
                  v36 = objc_claimAutoreleasedReturnValue();
                  v37 = a1[15];
                  a1[15] = (id)v36;

                  v38 = a1[15];
                  objc_opt_class();
                  if (v38)
                  {
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                      goto LABEL_84;
                  }
                  objc_msgSend(v8, "objectForKeyedSubscript:", qword_254B9C280);
                  v39 = objc_claimAutoreleasedReturnValue();
                  v40 = a1[16];
                  a1[16] = (id)v39;

                  v41 = a1[16];
                  objc_opt_class();
                  if (!v41 || (objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_msgSend(v8, "objectForKeyedSubscript:", qword_254B9C288);
                    v42 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    v80 = v42;
                    if (v42 && (objc_opt_isKindOfClass() & 1) != 0)
                    {
                      a1[14] = (id)objc_msgSend(v42, "longLongValue");
                      objc_msgSend(v8, "objectForKeyedSubscript:", qword_254B9C290);
                      v43 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      v79 = v43;
                      if (!v43)
                        goto LABEL_87;
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                        goto LABEL_87;
                      *((_BYTE *)a1 + 16) = objc_msgSend(v43, "BOOLValue");
                      objc_msgSend(v8, "objectForKeyedSubscript:", qword_254B9C2A0);
                      v44 = objc_claimAutoreleasedReturnValue();
                      v45 = a1[7];
                      a1[7] = (id)v44;

                      v46 = a1[7];
                      objc_opt_class();
                      if (v46)
                      {
                        if ((objc_opt_isKindOfClass() & 1) == 0)
                          goto LABEL_87;
                      }
                      objc_msgSend(v8, "objectForKeyedSubscript:", qword_254B9C2A8);
                      v47 = objc_claimAutoreleasedReturnValue();
                      v48 = a1[40];
                      a1[40] = (id)v47;

                      v49 = a1[40];
                      objc_opt_class();
                      if (v49)
                      {
                        if ((objc_opt_isKindOfClass() & 1) == 0)
                          goto LABEL_87;
                      }
                      objc_msgSend(v8, "objectForKeyedSubscript:", qword_254B9C2B8);
                      v50 = objc_claimAutoreleasedReturnValue();
                      v51 = a1[18];
                      a1[18] = (id)v50;

                      v52 = a1[18];
                      objc_opt_class();
                      if (!v52 || (objc_opt_isKindOfClass() & 1) != 0)
                      {
                        objc_msgSend(v8, "objectForKeyedSubscript:", qword_254B9C2C0);
                        v53 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_opt_class();
                        v54 = v53;
                        if (v53 && (objc_opt_isKindOfClass() & 1) == 0)
                          goto LABEL_97;
                        a1[27] = (id)objc_msgSend(v53, "unsignedLongLongValue");
                        objc_msgSend(v8, "objectForKeyedSubscript:", qword_254B9C2C8);
                        v55 = (void *)objc_claimAutoreleasedReturnValue();

                        objc_opt_class();
                        v54 = v55;
                        if (v55)
                        {
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                            goto LABEL_97;
                        }
                        a1[28] = (id)objc_msgSend(v55, "unsignedLongLongValue");
                        objc_msgSend(v8, "objectForKeyedSubscript:", qword_254B9C2D0);
                        v56 = (void *)objc_claimAutoreleasedReturnValue();

                        objc_opt_class();
                        v54 = v56;
                        if (v56)
                        {
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                            goto LABEL_97;
                        }
                        a1[29] = (id)objc_msgSend(v56, "unsignedLongLongValue");
                        objc_msgSend(v8, "objectForKeyedSubscript:", qword_254B9C2D8);
                        v57 = (void *)objc_claimAutoreleasedReturnValue();

                        objc_opt_class();
                        v54 = v57;
                        if (v57)
                        {
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                            goto LABEL_97;
                        }
                        a1[30] = (id)objc_msgSend(v57, "unsignedLongLongValue");
                        objc_msgSend(v8, "objectForKeyedSubscript:", qword_254B9C2E0);
                        v58 = (void *)objc_claimAutoreleasedReturnValue();

                        objc_opt_class();
                        v54 = v58;
                        if (v58)
                        {
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                            goto LABEL_97;
                        }
                        a1[31] = (id)objc_msgSend(v58, "unsignedLongLongValue");
                        objc_msgSend(v8, "objectForKeyedSubscript:", qword_254B9C2E8);
                        v59 = (void *)objc_claimAutoreleasedReturnValue();

                        objc_opt_class();
                        v54 = v59;
                        if (v59)
                        {
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                            goto LABEL_97;
                        }
                        a1[32] = (id)objc_msgSend(v59, "unsignedLongLongValue");
                        objc_msgSend(v8, "objectForKeyedSubscript:", qword_254B9C2F0);
                        v60 = (void *)objc_claimAutoreleasedReturnValue();

                        objc_opt_class();
                        v54 = v60;
                        if (v60)
                        {
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                            goto LABEL_97;
                        }
                        a1[33] = (id)objc_msgSend(v60, "unsignedLongLongValue");
                        objc_msgSend(v8, "objectForKeyedSubscript:", qword_254B9C2F8);
                        v61 = (void *)objc_claimAutoreleasedReturnValue();

                        objc_opt_class();
                        v54 = v61;
                        if (v61)
                        {
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                            goto LABEL_97;
                        }
                        a1[34] = (id)objc_msgSend(v61, "unsignedLongLongValue");
                        objc_msgSend(v8, "objectForKeyedSubscript:", qword_254B9C308);
                        v62 = (void *)objc_claimAutoreleasedReturnValue();

                        objc_opt_class();
                        v54 = v62;
                        if (v62)
                        {
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                            goto LABEL_97;
                        }
                        a1[36] = (id)objc_msgSend(v62, "unsignedLongLongValue");
                        objc_msgSend(v8, "objectForKeyedSubscript:", qword_254B9C300);
                        v63 = (void *)objc_claimAutoreleasedReturnValue();

                        objc_opt_class();
                        v54 = v63;
                        if (v63)
                        {
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                            goto LABEL_97;
                        }
                        a1[35] = (id)objc_msgSend(v63, "unsignedLongLongValue");
                        objc_msgSend(v8, "objectForKeyedSubscript:", qword_254B9C310);
                        v64 = (void *)objc_claimAutoreleasedReturnValue();

                        objc_opt_class();
                        v54 = v64;
                        if (v64)
                        {
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                            goto LABEL_97;
                        }
                        a1[37] = (id)objc_msgSend(v64, "unsignedLongLongValue");
                        objc_msgSend(v8, "objectForKeyedSubscript:", qword_254B9C318);
                        v65 = (void *)objc_claimAutoreleasedReturnValue();

                        objc_opt_class();
                        v54 = v65;
                        if (v65)
                        {
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                            goto LABEL_97;
                        }
                        a1[38] = (id)objc_msgSend(v65, "unsignedLongLongValue");
                        objc_msgSend(v8, "objectForKeyedSubscript:", qword_254B9C320);
                        v66 = (void *)objc_claimAutoreleasedReturnValue();

                        objc_opt_class();
                        v54 = v66;
                        if (v66)
                        {
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                            goto LABEL_97;
                        }
                        a1[39] = (id)objc_msgSend(v66, "unsignedLongLongValue");
                        objc_msgSend(v8, "objectForKeyedSubscript:", qword_254B9C328);
                        v67 = objc_claimAutoreleasedReturnValue();
                        v68 = a1[19];
                        a1[19] = (id)v67;

                        v69 = a1[19];
                        objc_opt_class();
                        if (v69)
                        {
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                            goto LABEL_97;
                        }
                        objc_msgSend(v8, "objectForKeyedSubscript:", qword_254B9C330);
                        v70 = objc_claimAutoreleasedReturnValue();
                        v71 = a1[20];
                        a1[20] = (id)v70;

                        v72 = a1[20];
                        objc_opt_class();
                        if (v72)
                        {
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                            goto LABEL_97;
                        }
                        objc_msgSend(v8, "objectForKeyedSubscript:", qword_254B9C338);
                        v73 = objc_claimAutoreleasedReturnValue();
                        v74 = a1[21];
                        a1[21] = (id)v73;

                        v75 = a1[21];
                        objc_opt_class();
                        if (v75 && (objc_opt_isKindOfClass() & 1) == 0)
                        {
LABEL_97:
                          v76 = 1;
                        }
                        else
                        {
                          objc_storeStrong(a1 + 6, a3);
                          *((_DWORD *)a1 + 5) = 0;
                          objc_storeStrong(a1 + 41, a2);
                          v76 = 0;
                        }

                      }
                      else
                      {
LABEL_87:
                        v76 = 1;
                      }

                    }
                    else
                    {
                      v76 = 1;
                    }

                  }
                  else
                  {
LABEL_84:
                    v76 = 1;
                  }
                  v35 = v81;
                }
                else
                {
                  v76 = 1;
                }

                v32 = v83;
              }
              else
              {
LABEL_83:
                v76 = 1;
              }

              v31 = v84;
            }
            else
            {
              v76 = 1;
            }

            v30 = v85;
          }
          else
          {
            v76 = 1;
          }

          if (v76)
            goto LABEL_11;
LABEL_95:
          a1 = a1;
          v16 = a1;
          goto LABEL_96;
        }
      }
    }
  }
  v12 = 0;
LABEL_10:

LABEL_11:
  v16 = 0;
LABEL_96:

  return v16;
}

unint64_t sub_213455CD0(uint64_t a1)
{
  const char *Name;
  unint64_t result;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  Name = (const char *)CSRegionGetName();
  if (!strncmp(Name, "__TEXT", 6uLL) || (result = strcmp(Name, "MACH_HEADER"), !(_DWORD)result))
  {
    result = CSRegionGetRange();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (*(_QWORD *)(v5 + 24) - 1 >= result)
      *(_QWORD *)(v5 + 24) = result;
    v6 = v4 + result - 1;
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (v6 > *(_QWORD *)(v7 + 24))
      *(_QWORD *)(v7 + 24) = v6;
  }
  return result;
}

void sub_213455D7C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  size_t v4;
  _BYTE v5[128];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v4 = 0;
  sysctlbyname("hw.model", 0, &v4, 0, 0);
  if (v4 - 1 <= 0x7E && !sysctlbyname("hw.model", v5, &v4, 0, 0))
  {
    v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v5);
    v1 = (void *)qword_253D9A9F8;
    qword_253D9A9F8 = v0;

  }
  v2 = _CFCopySupplementalVersionDictionary();
  v3 = (void *)qword_253D9AA00;
  qword_253D9AA00 = v2;

}

void sub_213455E48()
{
  xpc_connection_t mach_service;
  void *v1;

  mach_service = xpc_connection_create_mach_service("com.apple.ReportMemoryException", 0, 2uLL);
  v1 = (void *)qword_253D9AA10;
  qword_253D9AA10 = (uint64_t)mach_service;

  if (qword_253D9AA10)
  {
    xpc_connection_set_event_handler((xpc_connection_t)qword_253D9AA10, &unk_24CFC8798);
    xpc_connection_resume((xpc_connection_t)qword_253D9AA10);
  }
}

void sub_213455EA8(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  BOOL v4;
  const char *string;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = MEMORY[0x2199B35DC]();
  v4 = v2 != (id)MEMORY[0x24BDACF30] && v3 == MEMORY[0x24BDACFB8];
  if (v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    string = xpc_dictionary_get_string(v2, (const char *)*MEMORY[0x24BDACF40]);
    v6 = 136315138;
    v7 = string;
    _os_log_error_impl(&dword_21344C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Got xpc error message: %s\n", (uint8_t *)&v6, 0xCu);
  }

}

void sub_213455F84(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  xpc_object_t v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _xpc_connection_s *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  _QWORD handler[4];
  id v17;
  uint8_t buf[12];
  int v19;

  v3 = a2;
  if (!v3)
  {
    v5 = xpc_dictionary_create(0, 0, 0);
    if (v5)
    {
      v19 = 0;
      if (MEMORY[0x2199B30B4](*MEMORY[0x24BDAEC58], *(unsigned int *)(a1 + 56), 0, &v19) != 15)
      {
        xpc_dictionary_set_int64(v5, "MessageType", 2);
        xpc_dictionary_set_mach_send();
        xpc_dictionary_set_BOOL(v5, "WithMemgraph", *(_BYTE *)(a1 + 60));
        v11 = *(void **)(a1 + 48);
        if (!v11)
        {
          xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), v5);
          goto LABEL_14;
        }
        v12 = *(_xpc_connection_s **)(a1 + 32);
        v13 = *(NSObject **)(a1 + 40);
        if (v13)
        {
          handler[0] = MEMORY[0x24BDAC760];
          handler[1] = 3221225472;
          handler[2] = sub_2134561B4;
          handler[3] = &unk_24CFC87C0;
          v17 = v11;
          xpc_connection_send_message_with_reply(v12, v5, v13, handler);

          goto LABEL_14;
        }
        v10 = xpc_connection_send_message_with_reply_sync(*(xpc_connection_t *)(a1 + 32), v5);
        v14 = *(_QWORD *)(a1 + 48);
        sub_2134561FC(v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);

        goto LABEL_13;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_21344C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Timed out on authenticating. Skipping sending corpse to RME for analysis.", buf, 2u);
      }
      v6 = *(_QWORD *)(a1 + 48);
      if (!v6)
        goto LABEL_14;
      v7 = (void *)MEMORY[0x24BDD1540];
      v8 = MREErrorDomain;
      v9 = 15;
    }
    else
    {
      v6 = *(_QWORD *)(a1 + 48);
      if (!v6)
      {
LABEL_14:

        goto LABEL_15;
      }
      v7 = (void *)MEMORY[0x24BDD1540];
      v8 = MREErrorDomain;
      v9 = 6;
    }
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v10);
LABEL_13:

    goto LABEL_14;
  }
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
LABEL_15:

}

void sub_2134561B4(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  sub_2134561FC(a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

id sub_2134561FC(void *a1)
{
  id v1;
  void *v2;
  void *string;
  int64_t int64;
  void *v6;
  void *v7;

  v1 = a1;
  v2 = v1;
  if (v1 && MEMORY[0x2199B35DC](v1) == MEMORY[0x24BDACFA0])
  {
    string = (void *)xpc_dictionary_get_string(v2, "ErrorDomain");
    if (string)
    {
      int64 = xpc_dictionary_get_int64(v2, "ErrorCode");
      v6 = (void *)MEMORY[0x24BDD1540];
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", string);
      objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, int64, 0);
      string = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", MREErrorDomain, 7, 0);
    string = (void *)objc_claimAutoreleasedReturnValue();
  }

  return string;
}

uint64_t sub_2134562E8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_2134562F8(uint64_t a1)
{

}

void sub_213456300(uint64_t a1, _DWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _BYTE v6[1024];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (*a2 == 2063)
  {
    __strlcpy_chk();
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v6);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

void *sub_2134563A4(void *a1, mach_port_name_t a2, uint64_t a3, void *a4, uint64_t a5, unsigned int a6)
{
  id v11;
  mach_error_t v12;
  void *v13;
  void *v14;
  _OWORD v16[8];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  if (a1)
  {
    v12 = mach_port_mod_refs(*MEMORY[0x24BDAEC58], a2, 0, 1);
    if (v12)
    {
      mach_error("initWithCorpse:mach_port_mod_refs", v12);

      a1 = 0;
    }
    else
    {
      *((_DWORD *)a1 + 24) = a2;
      v17 = 0;
      memset(v16, 0, sizeof(v16));
      HIDWORD(v16[0]) = a3;
      LODWORD(v16[0]) = a6 & 0x4000 | (a6 >> 9) & 1 | (16 * ((a6 >> 2) & 1)) & 0xFFFFDF7F | (((a6 >> 1) & 1) << 7) & 0xFFFFDFFF | HIWORD(a6) & 0x100 | (((a6 >> 8) & 1) << 13);
      *((_BYTE *)a1 + 13) = (a6 & 0x20000) != 0;
      v13 = (void *)objc_msgSend(a1, "initWithBsdInfo:", v16);
      a1 = v13;
      if (v13)
      {
        objc_msgSend(v13, "setName:", v11);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ [%d] (corpse)"), v11, a3);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "setDisplayString:", v14);

        objc_msgSend(a1, "_setIdleExitStatusFromDirtyFlags:", a5);
      }
    }
  }

  return a1;
}

uint64_t sub_2134567A4(int a1, _OWORD *buffer)
{
  uint64_t result;

  if (proc_pidinfo(a1, 3, 0, buffer, 136) == 136)
    return 1;
  if (a1)
    return 0;
  *((_QWORD *)buffer + 16) = 0;
  buffer[4] = xmmword_213467340;
  buffer[5] = unk_213467350;
  buffer[6] = xmmword_213467360;
  buffer[7] = unk_213467370;
  *buffer = xmmword_213467300;
  buffer[1] = *(_OWORD *)algn_213467310;
  result = 1;
  buffer[2] = xmmword_213467320;
  buffer[3] = unk_213467330;
  return result;
}

__CFString *sub_21345689C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  __CFString *v7;

  objc_opt_self();
  v3 = a2 + 64;
  if (*(_BYTE *)(a2 + 64))
  {
    v4 = 32;
  }
  else
  {
    v6 = *(unsigned __int8 *)(a2 + 48);
    v5 = a2 + 48;
    if (!v6)
    {
      v7 = CFSTR("Unknown");
      return v7;
    }
    v4 = 16;
    v3 = v5;
  }
  v7 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%.*s"), v4, v3);
  return v7;
}

void *sub_213456BEC(_QWORD *a1)
{
  int v2;
  int v3;
  char *v4;
  unsigned int v5;
  unsigned int v6;
  _OWORD *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  unsigned int v13;
  void *v14;

  *a1 = 0;
  v2 = proc_listallpids(0, 0);
  if (v2 < 0)
    return 0;
  v3 = 4 * (v2 + 20);
  v4 = (char *)malloc_type_malloc(4 * (v2 + 20), 0x100004052888210uLL);
  v5 = proc_listallpids(v4, v3);
  if ((v5 & 0x80000000) != 0)
  {
    v14 = v4;
LABEL_11:
    free(v14);
    return 0;
  }
  v6 = v5;
  v7 = malloc_type_malloc(136 * v5, 0x11B869D5uLL);
  v8 = v7;
  if (!v6)
  {
    free(v4);
LABEL_10:
    v14 = v8;
    goto LABEL_11;
  }
  v9 = 0;
  LODWORD(v10) = 0;
  v11 = 4 * v6;
  v12 = v7;
  do
  {
    v13 = sub_2134567A4(*(_DWORD *)&v4[v9], v12);
    v12 = (_OWORD *)((char *)v12 + 136 * v13);
    v10 = v10 + v13;
    v9 += 4;
  }
  while (v11 != v9);
  free(v4);
  if (!(_DWORD)v10)
    goto LABEL_10;
  *a1 = v10;
  return v8;
}

void sub_213457FB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  uint64_t v49;

  _Block_object_dispose(&a49, 8);
  _Block_object_dispose((const void *)(v49 - 256), 8);
  _Unwind_Resume(a1);
}

void sub_213458220(id *a1, void *a2)
{
  id v3;
  int *v4;
  void *v5;
  FILE *v6;
  id v7;
  const char *v8;
  id v9;
  char __strerrbuf[256];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v3 = a2;
    v4 = __error();
    strerror_r(*v4, __strerrbuf, 0x100uLL);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ - %s"), v3, __strerrbuf);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (FILE *)*MEMORY[0x24BDAC8D8];
    objc_msgSend(a1, "displayString");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = (const char *)objc_msgSend(v7, "UTF8String");
    v9 = objc_retainAutorelease(v5);
    fprintf(v6, "%s: %s\n", v8, (const char *)objc_msgSend(v9, "UTF8String"));

    objc_msgSend(a1[5], "addObject:", v9);
  }
}

void sub_213458620(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  uint64_t v26;

  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_213458658(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  _BOOL4 v7;
  _BOOL4 v8;
  int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  BOOL v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _BOOL4 v36;
  uint64_t v37;
  uint64_t v38;

  if (a3)
  {
    v6 = 0;
    v32 = a4;
    v33 = a5 - 1;
    v31 = a3 - 1;
    do
    {
      v7 = !(v6 | a4) && !*(_BYTE *)(a1 + 80) && *(_BYTE *)(a1 + 81) != 0;
      v8 = 0;
      if (v33 == a4 && v31 == v6)
        v8 = *(_BYTE *)(a1 + 82) != 0;
      v9 = *(_DWORD *)(a2 + 4 * v6);
      v10 = *(_QWORD *)(a1 + 64);
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v13 = *(id *)(a1 + 32);
      v14 = v13;
      v36 = v8;
      if (v7)
      {
        v15 = objc_msgSend(v13, "start");
        v16 = objc_msgSend(v14, "size");
        v10 = v10 - v15 + (v15 & -(uint64_t)v10);
      }
      else
      {
        if (!v8)
          goto LABEL_15;
        v17 = objc_msgSend(v13, "end");
        v16 = objc_msgSend(v14, "size");
        v10 = v10 - ((v10 + v17 - 1) & -(uint64_t)v10) + v17;
      }
      if (v16 < v10)
        v10 = objc_msgSend(v14, "size");
LABEL_15:
      v18 = (v9 & 0x81) == 1 || (v9 & 8) != 0;
      if (v18)
      {
        v19 = (_QWORD *)(v11 + 24);
LABEL_22:
        *v19 += v10;
        goto LABEL_23;
      }
      if ((v9 & 0x10) != 0)
      {
        v19 = (_QWORD *)(v12 + 24);
        goto LABEL_22;
      }
LABEL_23:

      if (v7 && *(_QWORD *)(*(_QWORD *)(a1 + 40) + 168))
      {
        v20 = objc_msgSend(*(id *)(a1 + 32), "start");
        if (v20 != objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 168), "end"))
        {
          _os_assert_log();
          _os_crash();
          __break(1u);
          return;
        }
        v37 = 0;
        v38 = 0;
        v21 = *(_QWORD *)(a1 + 64);
        v22 = *(id *)(*(_QWORD *)(a1 + 40) + 168);
        v23 = objc_msgSend(v22, "end");
        v24 = objc_msgSend(v22, "size");
        v25 = v21 - ((v21 + v23 - 1) & -v21) + v23;
        if (v24 < v25)
          v25 = objc_msgSend(v22, "size");
        if (v18)
        {
          v26 = (unint64_t *)&v38;
          goto LABEL_34;
        }
        if ((v9 & 0x10) != 0)
        {
          v26 = (unint64_t *)&v37;
LABEL_34:
          *v26 = v25;
          v27 = v37;
          v28 = v38;
        }
        else
        {
          v27 = 0;
          v28 = 0;
        }

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 168), "setDirtySize:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 168), "dirtySize") + v28);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 168), "setSwappedSize:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 168), "swappedSize") + v27);
        v29 = *(_QWORD *)(a1 + 40);
        v30 = *(void **)(v29 + 168);
        *(_QWORD *)(v29 + 168) = 0;

      }
      if (v36)
      {
        *(_QWORD *)(*(_QWORD *)(a1 + 40) + 152) = *(_QWORD *)(a1 + 72) - *(_QWORD *)(a1 + 64);
        *(_DWORD *)(*(_QWORD *)(a1 + 40) + 160) = v9;
      }
      ++v6;
      a4 = v32;
    }
    while (a3 != v6);
  }
}

uint64_t sub_21345892C(void *a1, mach_vm_offset_t a2, unint64_t a3, void *a4)
{
  void (**v7)(id, char *, mach_vm_size_t, _QWORD, unint64_t);
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  mach_vm_size_t v17;
  uint64_t v18;
  mach_error_t v19;
  uint64_t v21;
  _BYTE *v22;
  mach_vm_size_t dispositions_count[2];

  dispositions_count[1] = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  if (a1)
  {
    v8 = objc_msgSend(a1, "pageSize");
    if (a3 >= 0x1000)
      v9 = 4096;
    else
      v9 = a3;
    v10 = a3 + 4095;
    if (a3 + 4095 >= 0x1000)
    {
      v12 = v8;
      v21 = (uint64_t)&v21;
      v22 = a1;
      v13 = 0;
      v14 = v10 >> 12;
      if (v10 >> 12 <= 1)
        v15 = 1;
      else
        v15 = v10 >> 12;
      v16 = v8 << 12;
      while (1)
      {
        v17 = a3 >= v9 ? v9 : a3;
        dispositions_count[0] = v17;
        v18 = v12;
        v19 = mach_vm_page_range_query(*((_DWORD *)v22 + 24), a2, v17 * v12, (mach_vm_address_t)&v21 - ((unsigned __int16)(4 * v9 + 15) & 0xFFF0), dispositions_count);
        if (v19)
          break;
        v7[2](v7, (char *)&v21 - ((unsigned __int16)(4 * v9 + 15) & 0xFFF0), dispositions_count[0], v13++, v14);
        a2 += v16;
        a3 -= 4096;
        v12 = v18;
        if (v15 == v13)
        {
          v11 = 1;
          goto LABEL_18;
        }
      }
      sub_213458F14(v22, v19, CFSTR("mach_vm_page_range_query"));
      v11 = 0;
    }
    else
    {
      v11 = 1;
    }
  }
  else
  {
    v11 = 0;
  }
LABEL_18:

  return v11;
}

void sub_213458F14(_BYTE *a1, mach_error_t a2, void *a3)
{
  id v5;
  const char *v6;
  int v7;
  BOOL v8;
  BOOL v9;
  _BOOL4 v10;
  _BOOL4 v11;
  BOOL v12;
  const char *v13;
  void *v14;
  int *v15;
  FILE *v16;
  id v17;
  _OWORD buffer[4];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (a1 && !a1[176])
  {
    a1[176] = 1;
    v6 = "";
    if (objc_msgSend(a1, "_isAlive"))
    {
      memset(buffer, 0, sizeof(buffer));
      if (proc_pidinfo(objc_msgSend(a1, "pid"), 13, 1uLL, buffer, 64) == 64)
        v7 = 0;
      else
        v7 = *__error();
      v10 = v7 == 0;
      v11 = HIDWORD(buffer[0]) == 5;
      v8 = v10 && v11;
      v12 = !v10 || !v11;
      v13 = " (zombie)";
      if (v12)
        v13 = "";
      v9 = v7 == 3;
      if (v7 == 3)
        v6 = " (process exited)";
      else
        v6 = v13;
    }
    else
    {
      v8 = 0;
      v9 = 0;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ - %s%s"), v5, mach_error_string(a2), v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = &OBJC_IVAR___FPProcess__warnings;
    if (!v8 && !v9)
    {
      v16 = (FILE *)*MEMORY[0x24BDAC8D8];
      objc_msgSend(a1, "displayString");
      v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      fprintf(v16, "%s: bailing out due to error: %s\n", (const char *)objc_msgSend(v17, "UTF8String"), (const char *)objc_msgSend(objc_retainAutorelease(v14), "UTF8String"));

      v15 = &OBJC_IVAR___FPProcess__errors;
    }
    objc_msgSend(*(id *)&a1[*v15], "addObject:", v14);

  }
}

void sub_213459270(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_213459294(uint64_t result, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v5;
  uint64_t v8;
  unint64_t i;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;

  if (a5 - 1 == a4)
    v5 = a3 + 1;
  else
    v5 = a3;
  if (v5)
  {
    v8 = result;
    for (i = 0; i != v5; ++i)
    {
      if (i >= a3)
      {
        v11 = 0;
      }
      else
      {
        v10 = *(_DWORD *)(a2 + 4 * i);
        if ((v10 & 0x10) != 0)
        {
          v11 = 2;
        }
        else if ((*(_DWORD *)(v8 + 64) & v10) != 0)
        {
          v11 = 1;
        }
        else
        {
          v17 = (*(_DWORD *)(v8 + 68) & v10) == 0;
          v12 = 4 * (v10 & 1);
          if (v17)
            v11 = v12;
          else
            v11 = 3;
        }
      }
      v13 = *(_QWORD *)(v8 + 40);
      v14 = *(_QWORD *)(v13 + 8);
      v15 = *(_QWORD *)(v14 + 24);
      if (v15 != v11)
      {
        v16 = *(_QWORD *)(v8 + 48);
        v17 = !v15 || *(_QWORD *)(*(_QWORD *)(v16 + 8) + 40) == 0;
        if (!v17)
        {
          v22 = 0u;
          v23 = 0u;
          v21 = 0u;
          switch(*(_QWORD *)(*(_QWORD *)(v13 + 8) + 24))
          {
            case 0:
              _os_crash();
              __break(1u);
              JUMPOUT(0x213459470);
            case 1:
              *(_QWORD *)&v21 = *(_QWORD *)(*(_QWORD *)(v16 + 8) + 40);
              break;
            case 2:
              *((_QWORD *)&v21 + 1) = *(_QWORD *)(*(_QWORD *)(v16 + 8) + 40);
              break;
            case 3:
              *((_QWORD *)&v22 + 1) = *(_QWORD *)(*(_QWORD *)(v16 + 8) + 40);
              break;
            case 4:
              *(_QWORD *)&v22 = *(_QWORD *)(*(_QWORD *)(v16 + 8) + 40);
              break;
            default:
              break;
          }
          v18 = *(_QWORD *)(v16 + 8);
          if (*(_BYTE *)(v8 + 72))
          {
            *(_QWORD *)&v23 = *(_QWORD *)(v18 + 40);
            v18 = *(_QWORD *)(v16 + 8);
          }
          result = objc_msgSend(*(id *)(v8 + 32), "addSubrange:memoryTotal:pageSize:", *(_QWORD *)(v18 + 32), *(_QWORD *)(v18 + 40), &v21, *(_QWORD *)(v8 + 56));
          v19 = *(_QWORD *)(*(_QWORD *)(v8 + 48) + 8);
          *(_QWORD *)(v19 + 32) += *(_QWORD *)(v19 + 40);
          *(_QWORD *)(v19 + 40) = 0;
          v14 = *(_QWORD *)(*(_QWORD *)(v8 + 40) + 8);
        }
      }
      *(_QWORD *)(v14 + 24) = v11;
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v8 + 40) + 8) + 24))
        v20 = 40;
      else
        v20 = 32;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v8 + 48) + 8) + v20) += *(_QWORD *)(v8 + 56);
    }
  }
  return result;
}

uint64_t sub_213459488(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_213459498(uint64_t a1)
{

}

uint64_t sub_2134594A0(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, void *a6, void *a7, int a8)
{
  id v15;
  id v16;
  unint64_t v17;
  unint64_t v18;
  FPMemoryRegion *v20;
  uint64_t v21;
  uint64_t v22;
  FPMemoryRegion *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  unsigned int v29;
  uint64_t v30;
  unsigned __int8 *v31;
  void *v32;
  FPMemoryRegion *v33;
  unsigned __int8 *v34;
  unint64_t v35;
  FPMemoryRegion *v36;
  unint64_t dirtySize;
  uint64_t v38;
  unsigned __int8 *v39;
  FPMemoryRegion *v40;
  FPMemoryRegion *v41;
  unint64_t v42;
  unint64_t swappedSize;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  id v47;
  id v48;
  int v49;
  void *v50;
  unsigned int v51;
  unsigned int v52;
  unsigned int v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  id v57;
  const __CFString *v58;
  void *v59;
  int v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  unint64_t v65;
  int v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t *v73;
  void *v74;
  id v75;
  uint64_t v76;
  void *v77;
  void *v78;
  uint64_t v80;
  uint64_t v81;
  id v82;
  uint64_t v83;
  id v84;
  void *v85;
  void *v86;
  unsigned int v87;
  id v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;

  v15 = a6;
  v16 = a7;
  v17 = *(_QWORD *)(a1 + 80);
  v18 = a3 + a2;
  if (v17 >= a3 + a2 || *(_QWORD *)(a1 + 88) + v17 <= a2)
  {
    v84 = v15;
    v20 = objc_alloc_init(FPMemoryRegion);
    -[FPMemoryRegion setStart:](v20, "setStart:", a2);
    -[FPMemoryRegion setSize:](v20, "setSize:", a3);
    -[FPMemoryRegion setUser_tag:](v20, "setUser_tag:", *(unsigned int *)(a4 + 20));
    -[FPMemoryRegion setObject_id:](v20, "setObject_id:", *(_QWORD *)(a4 + 68));
    -[FPMemoryRegion setShare_mode:](v20, "setShare_mode:", *(unsigned __int8 *)(a4 + 47));
    -[FPMemoryRegion setOffset:](v20, "setOffset:", *(_QWORD *)(a4 + 12));
    -[FPMemoryRegion setInSharedCache:](v20, "setInSharedCache:", 0);
    -[FPMemoryRegion setWired:](v20, "setWired:", *(_WORD *)(a4 + 60) != 0);
    v87 = a5;
    if (a5 == 2)
    {
      -[FPMemoryRegion setDirtySize:](v20, "setDirtySize:", 0);
      v23 = v20;
      v22 = a3;
    }
    else
    {
      if (a5 != 1)
      {
        if (*(_BYTE *)(a4 + 46) || *(_BYTE *)(a1 + 97))
          v51 = *(_DWORD *)(a4 + 36);
        else
          v51 = *(_DWORD *)(a4 + 24) - *(_DWORD *)(a4 + 64);
        -[FPMemoryRegion setDirtySize:](v20, "setDirtySize:", objc_msgSend(*(id *)(a1 + 32), "pageSize") * v51);
        -[FPMemoryRegion setReclaimableSize:](v20, "setReclaimableSize:", objc_msgSend(*(id *)(a1 + 32), "pageSize") * *(unsigned int *)(a4 + 64));
        -[FPMemoryRegion setSwappedSize:](v20, "setSwappedSize:", objc_msgSend(*(id *)(a1 + 32), "pageSize") * *(unsigned int *)(a4 + 32));
        v52 = *(_DWORD *)(a4 + 24);
        v53 = *(_DWORD *)(a4 + 64) + v51;
        if (*(_BYTE *)(a1 + 97) && v52 < v53)
          v54 = 0;
        else
          v54 = objc_msgSend(*(id *)(a1 + 32), "pageSize") * (v52 - v53);
        -[FPMemoryRegion setCleanSize:](v20, "setCleanSize:", v54);
        if (*(_DWORD *)(a4 + 20) == -1)
        {
          if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 144))
          {
LABEL_129:

            v24 = 0;
LABEL_130:
            v15 = v84;
            goto LABEL_131;
          }
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v20);
          if (!*(_QWORD *)(a4 + 68))
            -[FPMemoryRegion setObject_id:](v20, "setObject_id:", *(unsigned int *)(a4 + 56));
        }
LABEL_68:
        sub_2134629C0(*(_QWORD *)(a1 + 48), a2, a3 + a2);
        v55 = objc_claimAutoreleasedReturnValue();
        -[FPMemoryRegion setSegment:](v20, "setSegment:", 1);
        if (a8)
          -[FPMemoryRegion setVerbose:](v20, "setVerbose:", 1);
        if (v55)
        {
          v56 = *(id *)(v55 + 32);
          -[FPMemoryRegion setName:](v20, "setName:", v56);

          v57 = *(id *)(v55 + 40);
          -[FPMemoryRegion setDetailedName:](v20, "setDetailedName:", v57);

          -[FPMemoryRegion setSegment:](v20, "setSegment:", *(unsigned __int8 *)(v55 + 8));
          goto LABEL_121;
        }
        if (v16)
        {
          -[FPMemoryRegion setName:](v20, "setName:", v16);
          goto LABEL_121;
        }
        if ((v84 || *(_BYTE *)(a4 + 46)) && *(_DWORD *)(a4 + 20) != 88)
        {
          -[FPMemoryRegion setName:](v20, "setName:", CFSTR("mapped file"));
          -[FPMemoryRegion setDetailedName:](v20, "setDetailedName:", v84);
          goto LABEL_121;
        }
        if (a2 == 0xFC0000000 && a3 == 0x40000000)
        {
          v58 = CFSTR("commpage (reserved)");
LABEL_89:
          -[FPMemoryRegion setName:](v20, "setName:", v58);
          -[FPMemoryRegion setVerbose:](v20, "setVerbose:", 1);
          goto LABEL_121;
        }
        if (a2 == 0x1000000000 && a3 == 0x6000000000)
        {
          v58 = CFSTR("GPU Carveout (reserved)");
          goto LABEL_89;
        }
        +[FPMemoryRegion categoryNameForTag:](FPMemoryRegion, "categoryNameForTag:", *(unsigned int *)(a4 + 20));
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        -[FPMemoryRegion setName:](v20, "setName:", v59);

        if (*(_BYTE *)(a1 + 98))
        {
          v60 = *(_DWORD *)(a4 + 20);
          if (v60 == 100 || v60 == 88)
          {
            if (v84)
            {
              -[FPMemoryRegion setExtendedInfo:](v20, "setExtendedInfo:", v84);
            }
            else if (v60 != 100 || *(_BYTE *)(a1 + 99))
            {
              objc_msgSend(*(id *)(a1 + 32), "extendedInfoForRegionType:at:extendedInfoProvider:");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              -[FPMemoryRegion setExtendedInfo:](v20, "setExtendedInfo:", v61);

            }
          }
        }
        if (!*(_BYTE *)(a1 + 100))
          goto LABEL_121;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(a4 + 68));
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "objectForKeyedSubscript:", v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = *(void **)(*(_QWORD *)(a1 + 32) + 144);
        if (v63)
        {
          objc_msgSend(v64, "removeObjectForKey:", v62);
          -[FPMemoryRegion setOwnedExclusivelyByParentProcess:](v20, "setOwnedExclusivelyByParentProcess:", 1);
          v93 = 0;
          v92 = 0;
          v90 = 0u;
          v91 = 0u;
          v89 = 0u;
          objc_msgSend(v63, "getBytes:length:", &v89, 56);
          v65 = v92;
          v66 = (v92 >> 4) & 3;
          if (v66 != 3 && v66)
          {
            v69 = 0;
            v94 = 0;
            v68 = *((_QWORD *)&v90 + 1);
            v67 = v90 - *((_QWORD *)&v90 + 1);
          }
          else
          {
            v67 = v91;
            v68 = v90 - v91;
            v69 = *((_QWORD *)&v91 + 1);
            v94 = *((_QWORD *)&v91 + 1);
          }
          v86 = v62;
          if ((v92 & 1) != 0)
          {
            v93 = v68 + v69;
            v73 = &v94;
            v68 = 0;
          }
          else
          {
            v73 = &v93;
          }
          *v73 = 0;
          +[FPMemoryRegion vmLedgerNameForTag:](FPMemoryRegion, "vmLedgerNameForTag:", (v65 >> 1) & 7);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          if (v74)
          {
            v75 = objc_alloc(MEMORY[0x24BDD17C8]);
            -[FPMemoryRegion name](v20, "name");
            v76 = v67;
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            v78 = (void *)objc_msgSend(v75, "initWithFormat:", CFSTR("%@ (%@)"), v77, v74);
            -[FPMemoryRegion setName:](v20, "setName:", v78);

            v67 = v76;
          }

          v72 = v93;
          v71 = v94;
        }
        else
        {
          if (v64 || a5 == 3 || *(_DWORD *)(a4 + 20) == 87 || !*(_DWORD *)(a4 + 24))
            goto LABEL_120;
          v86 = v62;
          objc_msgSend(0, "removeObjectForKey:", v62);
          -[FPMemoryRegion setOwnedExclusivelyByParentProcess:](v20, "setOwnedExclusivelyByParentProcess:", 1);
          v70 = -[FPMemoryRegion dirtySize](v20, "dirtySize");
          v68 = -[FPMemoryRegion cleanSize](v20, "cleanSize") + v70;
          v71 = -[FPMemoryRegion swappedSize](v20, "swappedSize");
          v72 = 0;
          v67 = 0;
        }
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) += v68 + v71;
        -[FPMemoryRegion setDirtySize:](v20, "setDirtySize:", v68);
        -[FPMemoryRegion setCleanSize:](v20, "setCleanSize:", v72);
        -[FPMemoryRegion setSwappedSize:](v20, "setSwappedSize:", v71);
        -[FPMemoryRegion setReclaimableSize:](v20, "setReclaimableSize:", v67);
        v62 = v86;
LABEL_120:

LABEL_121:
        if (*(_BYTE *)(a1 + 97)
          && !*(_BYTE *)(a1 + 101)
          && !*(_BYTE *)(a1 + 96)
          && -[FPMemoryRegion eligibleForSubrangesUsingPageSize:](v20, "eligibleForSubrangesUsingPageSize:", objc_msgSend(*(id *)(a1 + 32), "pageSize")))
        {
          objc_msgSend(*(id *)(a1 + 32), "_addSubrangesForRegion:purgeState:", v20, v87);
        }
        if (v20 != *(FPMemoryRegion **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v20);

        goto LABEL_129;
      }
      -[FPMemoryRegion setDirtySize:](v20, "setDirtySize:", 0);
      v21 = *(unsigned int *)(a4 + 24);
      v22 = objc_msgSend(*(id *)(a1 + 32), "pageSize") * v21;
      v23 = v20;
    }
    -[FPMemoryRegion setReclaimableSize:](v23, "setReclaimableSize:", v22);
    -[FPMemoryRegion setSwappedSize:](v20, "setSwappedSize:", 0);
    -[FPMemoryRegion setCleanSize:](v20, "setCleanSize:", 0);
    goto LABEL_68;
  }
  if (*(_BYTE *)(a1 + 96))
  {
    v24 = 0;
    goto LABEL_131;
  }
  v84 = v15;
  v25 = *(_QWORD *)(a1 + 32);
  v26 = *(void **)(a1 + 48);
  v88 = *(id *)(a1 + 40);
  v27 = v26;
  v28 = (uint64_t)v27;
  if (!v25)
  {

    v24 = 1;
    goto LABEL_130;
  }
  v82 = v16;
  v29 = objc_msgSend(*(id *)(v25 + 24), "alignment");
  v30 = objc_msgSend((id)v25, "pageSize");
  v31 = 0;
  v32 = *(void **)(v25 + 168);
  *(_QWORD *)(v25 + 168) = 0;

  v85 = (void *)v28;
  sub_2134629C0(v28, a2, v18);
  v33 = (FPMemoryRegion *)objc_claimAutoreleasedReturnValue();
  if (v18 <= a2)
  {
LABEL_84:

    v24 = 0;
    goto LABEL_85;
  }
  v34 = 0;
  v83 = v29 - 1;
  v80 = -(uint64_t)v29;
  v81 = v30 - 1;
  v35 = a2;
  while (1)
  {
    v36 = v33;
    if (v33 && v35 >= v33->_dirtySize)
      goto LABEL_39;
    v33 = objc_alloc_init(FPMemoryRegion);
    -[FPMemoryRegion setStart:](v33, "setStart:", v35);
    dirtySize = v18;
    if (v36)
    {
      if (v36->_dirtySize >= v18)
        dirtySize = v18;
      else
        dirtySize = v36->_dirtySize;
    }
    -[FPMemoryRegion setEnd:](v33, "setEnd:", dirtySize);
    -[FPMemoryRegion setUser_tag:](v33, "setUser_tag:", *(unsigned int *)(a4 + 20));
    -[FPMemoryRegion setObject_id:](v33, "setObject_id:", *(_QWORD *)(a4 + 68));
    -[FPMemoryRegion setShare_mode:](v33, "setShare_mode:", *(unsigned __int8 *)(a4 + 47));
    -[FPMemoryRegion setOffset:](v33, "setOffset:", *(_QWORD *)(a4 + 12) - a2 + -[FPMemoryRegion start](v33, "start"));
    -[FPMemoryRegion setInSharedCache:](v33, "setInSharedCache:", 1);
    -[FPMemoryRegion setName:](v33, "setName:", CFSTR("unused dyld shared cache area"));
    -[FPMemoryRegion setUnusedSharedCacheRegion:](v33, "setUnusedSharedCacheRegion:", 1);
    -[FPMemoryRegion setWired:](v33, "setWired:", *(_WORD *)(a4 + 60) != 0);
    if (v34)
    {
      v38 = v34[8];
      if ((_DWORD)v38 == 2)
      {
        if (!v36)
        {
          -[FPMemoryRegion setSegment:](v33, "setSegment:", 2);
          goto LABEL_37;
        }
      }
      else if (!v36 || (_DWORD)v38 != 4)
      {
        goto LABEL_33;
      }
    }
    else if (!v36)
    {
      -[FPMemoryRegion setSegment:](v33, "setSegment:", 0);
LABEL_35:
      if (((-[FPMemoryRegion end](v33, "end") | v35) & v81) != 0
        && !objc_msgSend((id)v25, "_populateMemoryRegionWithPageQueries:regionInfo:", v33, a4))
      {
        goto LABEL_93;
      }
      goto LABEL_37;
    }
    v38 = *((unsigned __int8 *)v36 + 8);
    if ((_DWORD)v38 == 4 || (_DWORD)v38 == 2)
    {
      if (v34)
        v39 = v34;
      else
        v39 = (unsigned __int8 *)v36;
      v38 = v39[8];
    }
LABEL_33:
    -[FPMemoryRegion setSegment:](v33, "setSegment:", v38);
    if ((_DWORD)v38 != 2 && (_DWORD)v38 != 4)
      goto LABEL_35;
LABEL_37:
    objc_msgSend(v88, "addObject:", v33);
    v35 = -[FPMemoryRegion end](v33, "end");

    if (!v36 || v35 >= v18)
    {
      v33 = v36;
      v31 = v34;
      goto LABEL_84;
    }
LABEL_39:
    v40 = objc_alloc_init(FPMemoryRegion);
    v41 = v40;
    if (v36->_dirtySize <= v35)
      v42 = v35;
    else
      v42 = v36->_dirtySize;
    -[FPMemoryRegion setStart:](v40, "setStart:", v42);
    swappedSize = v36->_swappedSize;
    if (swappedSize + v36->_dirtySize >= v18)
      v44 = v18;
    else
      v44 = swappedSize + v36->_dirtySize;
    -[FPMemoryRegion setEnd:](v41, "setEnd:", v44);
    sub_2134629C0((uint64_t)v85, -[FPMemoryRegion end](v41, "end"), v18);
    v33 = (FPMemoryRegion *)objc_claimAutoreleasedReturnValue();
    if (v36 != v33)
    {
      v45 = -[FPMemoryRegion start](v41, "start");
      v46 = v33 ? v33->_dirtySize : 0;
      if (((v46 | v45) & v83) == 0)
        -[FPMemoryRegion setEnd:](v41, "setEnd:", (-[FPMemoryRegion end](v41, "end") + v83) & v80);
    }
    -[FPMemoryRegion setUser_tag:](v41, "setUser_tag:", *(unsigned int *)(a4 + 20));
    -[FPMemoryRegion setObject_id:](v41, "setObject_id:", *(_QWORD *)(a4 + 68));
    -[FPMemoryRegion setShare_mode:](v41, "setShare_mode:", *(unsigned __int8 *)(a4 + 47));
    -[FPMemoryRegion setOffset:](v41, "setOffset:", *(_QWORD *)(a4 + 12) - a2 + -[FPMemoryRegion start](v41, "start"));
    -[FPMemoryRegion setInSharedCache:](v41, "setInSharedCache:", 1);
    v47 = (id)v36->_cleanSize;
    -[FPMemoryRegion setName:](v41, "setName:", v47);

    v48 = (id)v36->_reclaimableSize;
    -[FPMemoryRegion setDetailedName:](v41, "setDetailedName:", v48);

    v49 = *((unsigned __int8 *)v36 + 8);
    -[FPMemoryRegion setSegment:](v41, "setSegment:", *((unsigned __int8 *)v36 + 8));
    -[FPMemoryRegion setWired:](v41, "setWired:", *(_WORD *)(a4 + 60) != 0);
    if (v49 == 2 || v49 == 4)
    {
      v50 = *(void **)(v25 + 168);
      if (v50)
      {
        *(_QWORD *)(v25 + 168) = 0;

      }
      goto LABEL_55;
    }
    if ((objc_msgSend((id)v25, "_populateMemoryRegionWithPageQueries:regionInfo:", v41, a4) & 1) == 0)
      break;
LABEL_55:
    objc_msgSend(v88, "addObject:", v41);
    v35 = -[FPMemoryRegion end](v41, "end");
    v31 = v36;

    v34 = v31;
    if (v35 >= v18)
      goto LABEL_84;
  }

LABEL_93:
  v24 = 1;
LABEL_85:
  v15 = v84;
  v16 = v82;
LABEL_131:

  return v24;
}

void sub_21345A498(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 72), 8);
  _Unwind_Resume(a1);
}

void sub_21345A4C4(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  FILE *v6;
  id v7;
  const char *v8;
  id v9;
  _QWORD v10[4];
  __int128 v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD v14[5];
  id v15;

  v4 = (void *)MEMORY[0x2199B3174]();
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = sub_213459488;
  v14[4] = sub_213459498;
  v15 = 0;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_21345A650;
  v10[3] = &unk_24CFC88B0;
  v11 = *(_OWORD *)(a1 + 32);
  v12 = v14;
  v13 = a2;
  if ((MEMORY[0x2199B2FA0](a2, v10) & 1) == 0 && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to iterate over image segments"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (FILE *)*MEMORY[0x24BDAC8D8];
    objc_msgSend(*(id *)(a1 + 32), "displayString");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = (const char *)objc_msgSend(v7, "UTF8String");
    v9 = objc_retainAutorelease(v5);
    fprintf(v6, "%s: %s\n", v8, (const char *)objc_msgSend(v9, "UTF8String"));

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObject:", v9);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

  }
  _Block_object_dispose(v14, 8);

  objc_autoreleasePoolPop(v4);
}

void sub_21345A634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21345A650(_QWORD *a1, char *__s, unint64_t a3, unint64_t a4)
{
  size_t v6;
  uint64_t v7;
  __CFString *v8;
  __CFString *v9;
  unint64_t *v10;
  void *v11;
  __CFString *v12;
  id v13;
  const char *v14;
  __CFString *v15;
  uint64_t v16;
  unint64_t v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  const char *v25;
  id v26;
  unsigned int v27;
  void *v28;
  unint64_t v29;
  unint64_t *v30;
  void *v31;
  id v32;
  int v33;
  id v34;
  const char *v35;
  uint64_t v36;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  FPImage *v46;
  FPImage *v47;
  __CFString *v48;
  SEL v49;
  __CFString *v50;
  _BYTE v53[1025];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    v6 = strlen(__s);
    v7 = 0;
    v8 = 0;
    v9 = 0;
    do
    {
      v10 = (unint64_t *)((char *)&unk_253D9AAF8 + 8 * v7);
      v11 = (void *)atomic_load(v10);
      v12 = v11;

      if (v11)
      {
        v8 = v12;
      }
      else
      {
        if (!v9)
          v9 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", __s, v6, 4);
        while (1)
        {
          v8 = (__CFString *)__ldaxr(v10);
          if (v8)
            break;
          if (!__stlxr((unint64_t)v9, v10))
          {
            v15 = v9;
            v16 = objc_claimAutoreleasedReturnValue();
            v8 = v9;
            goto LABEL_19;
          }
        }
        __clrex();
        v13 = v8;
      }
      if (-[__CFString length](v8, "length") == v6)
      {
        v14 = v53;
        if ((-[__CFString getCString:maxLength:encoding:](v8, "getCString:maxLength:encoding:", v53, 32, 4) & 1) == 0)
          v14 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v8), "UTF8String");
        if (!strncmp(v14, __s, v6))
        {
          v8 = v8;

          v9 = v8;
          goto LABEL_20;
        }
      }
      ++v7;
    }
    while (v7 != 16);
    if (!v9)
    {
      v16 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", __s, v6, 4);
LABEL_19:
      v9 = (__CFString *)v16;
    }
LABEL_20:
    v17 = a3;

    v18 = objc_msgSend(*(id *)(a1[4] + 24), "containsAddress:", a3);
    if (v18 && -[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("__LINKEDIT")))
    {
      v19 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v19) = objc_msgSend(v19, "containsObject:", v20);

      if ((v19 & 1) != 0)
      {
LABEL_60:

        return;
      }
      v21 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObject:", v22);

      v23 = CFSTR("dyld shared cache");
    }
    else
    {
      v24 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
      if (!v24)
      {
        v25 = (const char *)MEMORY[0x2199B2FAC](a1[7]);
        if (v25 || (v25 = (const char *)MEMORY[0x2199B2FB8](a1[7])) != 0)
        {
          if (v18)
          {
            v26 = 0;
            v27 = 0;
            v28 = 0;
            v29 = ((a3 >> 16) ^ (a3 >> 8) ^ (a3 >> 24) ^ a3) % 0x7FF;
            do
            {
              v30 = (unint64_t *)((char *)&unk_253D9AB78 + 8 * v29);
              v31 = (void *)atomic_load(v30);
              v32 = v31;

              if (v31)
              {
                v26 = v32;
              }
              else
              {
                if (!v28)
                  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v25);
                while (1)
                {
                  v26 = (id)__ldaxr(v30);
                  if (v26)
                    break;
                  if (!__stlxr((unint64_t)v28, v30))
                  {
                    v33 = 1;
                    goto LABEL_37;
                  }
                }
                v33 = 0;
                __clrex();
LABEL_37:
                if (v33)
                {
                  v44 = v28;
                  v38 = objc_claimAutoreleasedReturnValue();
                  v26 = v28;
                  goto LABEL_50;
                }
                v34 = v26;
              }
              v35 = v53;
              if ((objc_msgSend(v26, "getCString:maxLength:encoding:", v53, 1025, 4) & 1) == 0)
                v35 = (const char *)objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
              if (!strcmp(v35, v25))
              {
                v26 = v26;

                v28 = v26;
                goto LABEL_51;
              }
              v36 = ((v29 + 1) * (unsigned __int128)0x20040080100201uLL) >> 64;
              v29 = v29 + 1 - 2047 * ((v36 + ((v29 + 1 - v36) >> 1)) >> 10);
            }
            while (v27++ < 0x11);
            if (v28)
              goto LABEL_51;
            v38 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v25);
LABEL_50:
            v28 = (void *)v38;
LABEL_51:
            v17 = a3;

            v45 = *(_QWORD *)(a1[6] + 8);
            v39 = *(void **)(v45 + 40);
            *(_QWORD *)(v45 + 40) = v28;
          }
          else
          {
            v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v25);
            objc_msgSend(v39, "stringByResolvingSymlinksInPath");
            v40 = objc_claimAutoreleasedReturnValue();
            v41 = *(_QWORD *)(a1[6] + 8);
            v42 = *(void **)(v41 + 40);
            *(_QWORD *)(v41 + 40) = v40;

          }
        }
        else
        {
          v43 = *(_QWORD *)(a1[6] + 8);
          v39 = *(void **)(v43 + 40);
          *(_QWORD *)(v43 + 40) = CFSTR("unknown dylib");
        }

        v24 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
      }
      v23 = v24;
    }
    v46 = objc_alloc_init(FPImage);
    v47 = v46;
    if (v46)
    {
      v46->_start = v17;
      v46->_size = a4;
      if (v9)
        v48 = v9;
      else
        v48 = CFSTR("unknown");
      sub_213462860((uint64_t)v46, v48);
      objc_setProperty_nonatomic_copy(v47, v49, v23, 40);
    }
    else
    {
      if (v9)
        v50 = v9;
      else
        v50 = CFSTR("unknown");
      sub_213462860(0, v50);
    }
    objc_msgSend(*(id *)(a1[4] + 136), "addObject:", v47);

    goto LABEL_60;
  }
}

uint64_t sub_21345AB6C(uint64_t a1, void *a2, void *a3)
{
  _QWORD *v4;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;

  v4 = a2;
  v5 = a3;
  if (v4)
  {
    v6 = v4[2];
    if (v5)
    {
LABEL_3:
      v7 = v5[2];
      goto LABEL_4;
    }
  }
  else
  {
    v6 = 0;
    if (v5)
      goto LABEL_3;
  }
  v7 = 0;
LABEL_4:
  if (v6 >= v7)
  {
    if (v4)
    {
      v9 = v4[2];
      if (v5)
      {
LABEL_8:
        v10 = v5[2];
LABEL_9:
        v8 = v9 > v10;
        goto LABEL_10;
      }
    }
    else
    {
      v9 = 0;
      if (v5)
        goto LABEL_8;
    }
    v10 = 0;
    goto LABEL_9;
  }
  v8 = -1;
LABEL_10:

  return v8;
}

const char *sub_21345AD10(uint64_t a1, int a2)
{
  const char *v2;
  const char *v3;

  v2 = "-";
  v3 = "N";
  if (a2 == 3)
    v3 = "Y";
  if (a2 != 1)
    v2 = v3;
  if (a2)
    return v2;
  else
    return 0;
}

void sub_21345B780(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = v5;
  if (!a1)
    goto LABEL_4;
  if (v5)
  {
    sub_21345B7F4(a1, v7, objc_msgSend(v5, "pageSize"), v5);
LABEL_4:

    return;
  }
  _os_assert_log();
  _os_crash();
  __break(1u);
}

void sub_21345B7F4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  FPRangeList *v15;
  void *v16;
  id v17;

  v17 = a2;
  v7 = a4;
  if (!a1)
  {
LABEL_16:

    return;
  }
  if ((*(_BYTE *)(a1 + 8) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 16), "addObject:", v17);
    if (objc_msgSend(v17, "object_id"))
    {
      if (v7
        && !+[FPFootprint isSharingAnalysisDisabled](FPFootprint, "isSharingAnalysisDisabled")
        && (*(_QWORD *)(a1 + 64) || objc_msgSend(v17, "eligibleForProcessView")))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v7, "pid"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *(void **)(a1 + 64);
        if (!v9)
        {
          v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
          v11 = *(void **)(a1 + 64);
          *(_QWORD *)(a1 + 64) = v10;

          v9 = *(void **)(a1 + 64);
        }
        objc_msgSend(v9, "objectForKeyedSubscript:", v8);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          v13 = *(void **)(a1 + 64);
          v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v8);
        }
        objc_msgSend(v12, "addObject:", v17);

      }
      v14 = *(_QWORD *)(a1 + 72);
      if (!v14)
      {
        v15 = objc_alloc_init(FPRangeList);
        v16 = *(void **)(a1 + 72);
        *(_QWORD *)(a1 + 72) = v15;

        v14 = *(_QWORD *)(a1 + 72);
      }
      sub_21344E6B4(v14, v17, a3);
      objc_msgSend(v17, "freeSubrangeList");
    }
    goto LABEL_16;
  }
  _os_assert_log();
  _os_crash();
  __break(1u);
}

void sub_21345BA20(uint64_t a1, int a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t j;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t k;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t m;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  int64x2_t v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return;
  if ((*(_BYTE *)(a1 + 8) & 1) != 0)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  v60 = 0u;
  v61 = 0u;
  v59 = 0u;
  sub_21344E7B4(*(_QWORD *)(a1 + 72), &v59);
  if (a2)
  {
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v4 = *(id *)(a1 + 16);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v56 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
          *(_QWORD *)(a1 + 24) += objc_msgSend(v9, "dirtySize");
          *(_QWORD *)(a1 + 32) += objc_msgSend(v9, "swappedSize");
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
      }
      while (v6);
    }
LABEL_34:

    goto LABEL_35;
  }
  *(int64x2_t *)(a1 + 24) = v59;
  if (*(_QWORD *)(a1 + 64)
    && +[FPFootprint breakDownPhysFootprint](FPFootprint, "breakDownPhysFootprint"))
  {
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    objc_msgSend(*(id *)(a1 + 64), "objectEnumerator");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
    if (v38)
    {
      v37 = *(_QWORD *)v52;
      do
      {
        for (j = 0; j != v38; ++j)
        {
          if (*(_QWORD *)v52 != v37)
            objc_enumerationMutation(v4);
          v11 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
          v47 = 0u;
          v48 = 0u;
          v49 = 0u;
          v50 = 0u;
          v12 = v11;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v47, v64, 16);
          if (v13)
          {
            v14 = v13;
            v15 = 0;
            v16 = 0;
            v17 = *(_QWORD *)v48;
            do
            {
              for (k = 0; k != v14; ++k)
              {
                if (*(_QWORD *)v48 != v17)
                  objc_enumerationMutation(v12);
                v19 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * k);
                v16 += objc_msgSend(v19, "dirtySize");
                v15 += objc_msgSend(v19, "swappedSize");
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v47, v64, 16);
            }
            while (v14);

            if (v16 > *(_QWORD *)(a1 + 24))
              *(_QWORD *)(a1 + 24) = v16;
            if (v15 > *(_QWORD *)(a1 + 32))
              *(_QWORD *)(a1 + 32) = v15;
          }
          else
          {

          }
        }
        v38 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
      }
      while (v38);
      LOBYTE(a2) = 0;
    }
    goto LABEL_34;
  }
LABEL_35:
  *(_OWORD *)(a1 + 40) = v60;
  *(_QWORD *)(a1 + 56) = v61;
  v20 = *(void **)(a1 + 72);
  *(_QWORD *)(a1 + 72) = 0;

  if ((a2 & 1) == 0 && (unint64_t)objc_msgSend(*(id *)(a1 + 64), "count") >= 2)
  {
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    objc_msgSend(*(id *)(a1 + 64), "objectEnumerator");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v43, v63, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v44;
LABEL_39:
      v25 = 0;
      while (1)
      {
        if (*(_QWORD *)v44 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v25);
        if ((unint64_t)objc_msgSend(v26, "count") > 1)
          goto LABEL_52;
        objc_msgSend(v26, "firstObject");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v27, "dirtySize") != *(_QWORD *)(a1 + 24)
          || objc_msgSend(v27, "swappedSize") != *(_QWORD *)(a1 + 32)
          || objc_msgSend(v27, "cleanSize") != *(_QWORD *)(a1 + 40)
          || objc_msgSend(v27, "reclaimableSize") != *(_QWORD *)(a1 + 48)
          || objc_msgSend(v27, "wiredSize") != *(_QWORD *)(a1 + 56))
        {

          goto LABEL_52;
        }

        if (v23 == ++v25)
        {
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v43, v63, 16);
          if (v23)
            goto LABEL_39;
          break;
        }
      }
    }

    *(_BYTE *)(a1 + 8) |= 2u;
  }
  v21 = *(void **)(a1 + 64);
  *(_QWORD *)(a1 + 64) = 0;
LABEL_52:

  if ((a2 & 1) == 0 && objc_msgSend((id)a1, "containsFakeRegion"))
  {
    sub_21345BF74(a1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v28, "isFake") & 1) == 0)
    {
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v29 = *(id *)(a1 + 16);
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v39, v62, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v40;
        do
        {
          for (m = 0; m != v31; ++m)
          {
            if (*(_QWORD *)v40 != v32)
              objc_enumerationMutation(v29);
            v34 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * m);
            if (objc_msgSend(v34, "isFake"))
            {
              objc_msgSend(v28, "name");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "setName:", v35);

              objc_msgSend(v28, "detailedName");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "setDetailedName:", v36);

            }
          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v39, v62, 16);
        }
        while (v31);
      }

    }
  }
  *(_BYTE *)(a1 + 8) |= 1u;
}

id sub_21345BF74(uint64_t a1)
{
  void *v2;
  int v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  objc_msgSend(*(id *)(a1 + 16), "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "inSharedCache");
  if ((v3 & 1) != 0 || *(_DWORD *)(a1 + 12) != -1)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = *(id *)(a1 + 16);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (v3)
          {
            if ((objc_msgSend(v9, "unusedSharedCacheRegion") & 1) == 0)
              goto LABEL_17;
          }
          else if (!objc_msgSend(v9, "isFake", (_QWORD)v12))
          {
LABEL_17:
            v10 = v9;

            goto LABEL_18;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v6)
          continue;
        break;
      }
    }

  }
  v10 = v2;
LABEL_18:

  return v10;
}

void sub_21345CB10()
{
  uint64_t i;
  uint64_t v1;
  char *v2;
  void *v3;

  for (i = 0; i != 16; ++i)
  {
    v1 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("app-specific tag %d"), i + 1);
    v2 = (char *)&unk_253D9AA20 + 8 * i;
    v3 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v1;

  }
}

void sub_21345D178()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_253D9AA30;
  qword_253D9AA30 = v0;

}

id sub_21345DA74(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  id obj;
  uint64_t v18;
  id v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[6];
  _QWORD v26[6];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v16 = v3;
  if (a1)
  {
    v4 = v3;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v4, "objectEnumerator");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    if (v20)
    {
      v18 = *(_QWORD *)v22;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v22 != v18)
            objc_enumerationMutation(obj);
          v6 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v5);
          v25[0] = CFSTR("dirty");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v6, "totalSwappedSize") + objc_msgSend(v6, "totalDirtySize"));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v26[0] = v7;
          v25[1] = CFSTR("swapped");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v6, "totalSwappedSize"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v26[1] = v8;
          v25[2] = CFSTR("clean");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v6, "totalCleanSize"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v26[2] = v9;
          v25[3] = CFSTR("reclaimable");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v6, "totalReclaimableSize"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v26[3] = v10;
          v25[4] = CFSTR("wired");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v6, "totalWiredSize"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v26[4] = v11;
          v25[5] = CFSTR("regions");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v6, "totalRegions"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v26[5] = v12;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 6);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "fullName");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v13, v14);

          ++v5;
        }
        while (v20 != v5);
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      }
      while (v20);
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

void sub_21345E7A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_21345E7D0()
{
  void *v0;
  id v1;
  void *v2;

  objc_opt_self();
  v0 = (void *)qword_253D9EB78;
  if (!qword_253D9EB78)
  {
    v1 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v2 = (void *)qword_253D9EB78;
    qword_253D9EB78 = (uint64_t)v1;

    v0 = (void *)qword_253D9EB78;
  }
  return v0;
}

uint64_t sub_21345E814(uint64_t result)
{
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24))
    return dyld_shared_cache_for_file();
  return result;
}

uint64_t sub_21345E87C(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x2199B3030](a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void sub_21345E8AC()
{
  void *v0;

  objc_opt_self();
  os_unfair_lock_lock((os_unfair_lock_t)&unk_253D9EB70);
  v0 = (void *)qword_253D9EB78;
  qword_253D9EB78 = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_253D9EB70);
}

void sub_21345EE74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21345EE8C(uint64_t a1, uint64_t a2)
{
  id v3;

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 96))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "gatherData:extendedInfoProvider:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32));

  }
}

void sub_21345F974(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  objc_opt_self();
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v4, "objectEnumerator", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(id *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        *(_QWORD *)a3 += objc_msgSend(v10, "totalDirtySize");
        *(_QWORD *)(a3 + 8) += objc_msgSend(v10, "totalSwappedSize");
        *(_QWORD *)(a3 + 16) += objc_msgSend(v10, "totalCleanSize");
        *(_QWORD *)(a3 + 24) += objc_msgSend(v10, "totalReclaimableSize");
        *(_QWORD *)(a3 + 32) += objc_msgSend(v10, "totalWiredSize");
        v11 = objc_msgSend(v10, "totalRegions");

        *(_DWORD *)(a3 + 40) += v11;
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

id sub_21346145C(id a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("hiddenFromDisplay == NO"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "processes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "filteredArrayUsingPredicate:", v2);
    v1 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

id sub_2134614CC(uint64_t a1, void *a2, void *a3, char *a4, uint64_t a5)
{
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  char *v21;
  id v22;
  id obj;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v24 = a3;
  if (a1)
  {
    v21 = a4;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v22 = v9;
    obj = v9;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v11)
    {
      v12 = v11;
      v13 = 0;
      v14 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v26 != v14)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          if ((a5 & 1) != 0)
            objc_msgSend(v16, "name");
          else
            objc_msgSend(v16, "fullName");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", v17);
          v18 = (id)objc_claimAutoreleasedReturnValue();
          if (!v18)
          {
            v18 = -[FPMemoryCategory initSummary:]([FPMemoryCategory alloc], "initSummary:", a5);
            objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, v17);
          }
          objc_msgSend(v16, "viewForProcess:", v24);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addMemoryObject:", v19);
          if (v13 == 2 || v19 == v16)
          {
            if (!v13)
              v13 = objc_msgSend(v16, "couldHaveProcessView");
          }
          else
          {
            v13 = 2;
          }

        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v12);
    }
    else
    {
      v13 = 0;
    }

    if (v21)
      *v21 = v13;
    v9 = v22;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

id sub_2134616F0(void *a1, uint64_t a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  id obj;
  uint64_t v18;
  uint64_t v19;
  void *context;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  sub_21346145C(a1);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v19)
  {
    v18 = *(_QWORD *)v27;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v27 != v18)
          objc_enumerationMutation(obj);
        v21 = v6;
        v7 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v6);
        context = (void *)MEMORY[0x2199B3174]();
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        objc_msgSend(v7, "memoryRegions");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v23;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v23 != v11)
                objc_enumerationMutation(v8);
              objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "memoryObject");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v4, "containsObject:", v13) & 1) == 0)
              {
                objc_msgSend(v4, "addObject:", v13);
                if ((a2 & 1) != 0)
                  objc_msgSend(v13, "name");
                else
                  objc_msgSend(v13, "fullName");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "objectForKeyedSubscript:", v14);
                v15 = (id)objc_claimAutoreleasedReturnValue();
                if (!v15)
                {
                  v15 = -[FPMemoryCategory initSummary:]([FPMemoryCategory alloc], "initSummary:", a2);
                  objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, v14);
                }
                objc_msgSend(v15, "addMemoryObject:", v13);

              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          }
          while (v10);
        }

        objc_autoreleasePoolPop(context);
        v6 = v21 + 1;
      }
      while (v21 + 1 != v19);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v19);
  }

  return v5;
}

void sub_21346197C(uint64_t a1, id *a2, uint64_t a3)
{
  uint64_t v3;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  FPProcessGroupMinimal *v12;

  if (a3)
  {
    v3 = a3;
    while (1)
    {
      v6 = *a2;
      objc_msgSend(v6, "memoryObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (!*(_BYTE *)(a1 + 72))
        break;
      if (objc_msgSend(v7, "ownerPid") != -1)
      {
        v9 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v8, "ownerPid"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v9, "containsObject:", v10) & 1) == 0)
          goto LABEL_13;
        v11 = objc_msgSend(v8, "containsFakeRegion");

        if (v11)
          break;
      }
LABEL_14:

      ++a2;
      if (!--v3)
        return;
    }
    if (*(_QWORD *)(a1 + 40)
      && objc_msgSend(v6, "inSharedCache")
      && (objc_msgSend(v6, "privateSharedCacheRegion") & 1) == 0)
    {
      sub_2134630BC(*(_QWORD *)(a1 + 48), v8);
      goto LABEL_14;
    }
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v10);
    v12 = (FPProcessGroupMinimal *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v12 = objc_alloc_init(FPProcessGroupMinimal);
      objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v12, v10);
    }
    -[FPProcessGroupMinimal addProcess:](v12, "addProcess:", *(_QWORD *)(a1 + 64));

LABEL_13:
    goto LABEL_14;
  }
}

uint64_t sub_213461AEC(uint64_t a1, void *a2, void *a3)
{
  id v4;
  int v5;

  v4 = a3;
  LODWORD(a2) = objc_msgSend(a2, "pid");
  v5 = objc_msgSend(v4, "pid");

  if ((int)a2 > v5)
    return -1;
  else
    return 1;
}

uint64_t sub_213461B40(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v5, "pid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v6, "pid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "compare:", v9);
  if (!v13)
  {
    v14 = objc_msgSend(v5, "pid");
    if (v14 > (int)objc_msgSend(v6, "pid"))
      v13 = -1;
    else
      v13 = 1;
  }

  return v13;
}

BOOL sub_213461F00(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "virtualAddress") == *(_QWORD *)(a1 + 32);
}

void sub_213462564(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_213462590(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_2134625A0(uint64_t a1)
{

}

void sub_2134625A8(uint64_t a1, void *a2)
{
  id v3;
  uint64_t i;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  uint64_t v11;
  void *v12;
  id obj;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v3;
  v15 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v15)
  {
    v14 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v5, "processIDs");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v17;
          do
          {
            for (j = 0; j != v8; ++j)
            {
              if (*(_QWORD *)v17 != v9)
                objc_enumerationMutation(v6);
              v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j);
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectForKeyedSubscript:", v11);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v12)
              {
                objc_msgSend(MEMORY[0x24BDBCEB8], "array");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v12, v11);
              }
              objc_msgSend(v12, "addObject:", v5);

            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          }
          while (v8);
        }

      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v15);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

BOOL sub_21346284C(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

unint64_t sub_213462858(unint64_t a1)
{
  return a1 >> 8;
}

void sub_213462860(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  int v8;
  void *v9;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v9 = v3;
    v5 = objc_msgSend(v3, "copy");
    v6 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = v5;

    if ((objc_msgSend(v9, "hasPrefix:", CFSTR("__TEXT")) & 1) != 0
      || (objc_msgSend(v9, "hasPrefix:", CFSTR("__OBJC_RO")) & 1) != 0)
    {
      v7 = 2;
    }
    else
    {
      if ((objc_msgSend(v9, "hasPrefix:", CFSTR("__LINKEDIT")) & 1) == 0)
      {
        v8 = objc_msgSend(v9, "hasPrefix:", CFSTR("__"));
        v4 = v9;
        if (!v8)
          goto LABEL_7;
        v7 = 3;
        goto LABEL_6;
      }
      v7 = 4;
    }
    v4 = v9;
LABEL_6:
    *(_BYTE *)(a1 + 8) = v7;
  }
LABEL_7:

}

id *sub_213462948(id *a1, void *a2)
{
  id v4;
  id *v5;
  objc_super v7;

  v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)FPImageEnumerator;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5)
    {
      v5[2] = 0;
      objc_storeStrong(v5 + 1, a2);
    }
  }

  return a1;
}

_QWORD *sub_2134629C0(uint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v6;
  _QWORD *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD *v12;

  if (a1)
  {
    while (1)
    {
      v6 = *(_QWORD *)(a1 + 16);
      if (v6 >= objc_msgSend(*(id *)(a1 + 8), "count"))
        break;
      objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 16));
      v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        v9 = v7[2];
        v10 = v7[3] + v9;
        if (v9 <= a2 && v10 > a2)
        {
LABEL_16:
          v12 = v7;
LABEL_18:

          return v12;
        }
      }
      else
      {
        v10 = 0;
        v9 = 0;
      }
      if (v9 < a3 && v10 >= a3 || v9 >= a2 && v10 <= a3)
        goto LABEL_16;
      if (v9 >= a2)
      {
        v12 = 0;
        goto LABEL_18;
      }
      ++*(_QWORD *)(a1 + 16);

    }
  }
  v12 = 0;
  return v12;
}

void sub_213462A9C()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = 0;
  v1 = 40;
  do
  {
    v2 = 2 * v1;
    v7 = 2 * v1;
    v0 = malloc_type_realloc(v0, 192 * v1, 0x1000040565EDBD2uLL);
    if ((ledger() & 0x80000000) != 0)
    {
      free(v0);
      qword_254B9C610 = -1;
      perror("Unable to retrieve ledger template info");
      return;
    }
    v1 = v2;
  }
  while (v2 == v7);
  qword_254B9C610 = v7;
  *(_QWORD *)&v3 = -1;
  *((_QWORD *)&v3 + 1) = -1;
  xmmword_254B9C5F0 = v3;
  unk_254B9C600 = v3;
  if (v7 >= 1)
  {
    v4 = 0;
    v5 = 0;
    do
    {
      v6 = 0;
      while (v6 == 2 || strcmp(off_24CFC9438[v6], (const char *)v0 + 96 * v4))
      {
        if (++v6 == 4)
          goto LABEL_12;
      }
      *(_QWORD *)((char *)&xmmword_254B9C5F0 + v6 * 8) = v4;
      if (++v5 == 4)
        break;
LABEL_12:
      ++v4;
    }
    while (v4 != v7);
  }
  free(v0);
}

uint64_t sub_213462D80()
{
  return mach_timebase_info((mach_timebase_info_t)&dword_253D9AAC0);
}

_QWORD *sub_213462D94(void *a1, uint64_t a2)
{
  _QWORD *v3;
  id v4;
  void *v5;
  objc_super v7;

  if (!a1)
    return 0;
  v7.receiver = a1;
  v7.super_class = (Class)FPProcessGroupMinimal;
  v3 = objc_msgSendSuper2(&v7, sel_init);
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v5 = (void *)v3[1];
    v3[1] = v4;

    v3[2] = a2;
  }
  return v3;
}

FPProcessGroup *sub_213462EC0(uint64_t a1)
{
  FPProcessGroup *v2;

  if (a1)
  {
    v2 = objc_alloc_init(FPProcessGroup);
    v2->super._hashValue = *(_QWORD *)(a1 + 16);
    objc_storeStrong((id *)&v2->super._processes, *(id *)(a1 + 8));
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

void sub_2134630BC(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      v6 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

void sub_21346314C(uint64_t a1, void *a2, int a3)
{
  id v6;
  id v7;

  v6 = a2;
  if (!a1)
    goto LABEL_4;
  if (a3)
  {
    *(_DWORD *)(a1 + 24) = a3;
    v7 = v6;
    objc_storeStrong((id *)(a1 + 40), a2);
    v6 = v7;
LABEL_4:

    return;
  }
  _os_assert_log();
  _os_crash();
  __break(1u);
}

id sub_2134631C4(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;

  if (a1)
  {
    v2 = *(id *)(a1 + 40);
    if (v2)
    {
      if (!--*(_DWORD *)(a1 + 24))
      {
        v3 = *(void **)(a1 + 40);
        *(_QWORD *)(a1 + 40) = 0;

      }
      v4 = v2;
    }

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

id sub_2134632E0()
{
  void *v0;
  void *v1;

  sub_213463324(0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKeyedSubscript:", qword_254B9C580);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id sub_213463324(__CFString *a1)
{
  __CFString *v1;
  __CFString *v2;
  void *v3;
  int v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  int has_internal_diagnostics;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  void *v64;
  void *v65;
  void *v67;
  id v68;
  __CFString *v69;
  id v70;

  v1 = CFSTR("/Library/Managed Preferences/mobile/com.apple.ReportMemoryException.plist");
  if (a1)
    v1 = a1;
  v2 = v1;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileExistsAtPath:", v2);
  if (v4)
    v5 = v2;
  else
    v5 = 0;
  v6 = v5;

  v7 = 0;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[RMECacheEnumerator getEPLProfilePath](RMECacheEnumerator, "getEPLProfilePath");
  v8 = objc_claimAutoreleasedReturnValue();
  v69 = v6;
  if (v8)
  {
    v9 = (void *)v8;
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "fileExistsAtPath:", v9))
      v11 = v9;
    else
      v11 = 0;
    v12 = v11;

    if (v12)
    {
      v67 = v9;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v12);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v67 = 0;
    }
  }
  else
  {
    v67 = 0;
    v12 = 0;
  }
  v68 = v7;
  v70 = v12;
  v13 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  if ((has_internal_diagnostics & 1) != 0)
    v15 = 30;
  else
    v15 = 0;
  v16 = (has_internal_diagnostics & 1) != 0;
  if ((has_internal_diagnostics & 1) != 0)
    v17 = 120;
  else
    v17 = 0;
  if ((has_internal_diagnostics & 1) != 0)
    v18 = 2;
  else
    v18 = 0;
  if ((has_internal_diagnostics & 1) != 0)
    v19 = 10;
  else
    v19 = 0;
  if ((has_internal_diagnostics & 1) != 0)
    v20 = 12;
  else
    v20 = 0;
  v21 = has_internal_diagnostics ^ 1u;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v15);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v22, CFSTR("FullDiagLimit"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v16);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v23, CFSTR("GCoreDiagLimit"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v17);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v24, CFSTR("LiteDiagLimit"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v16);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v25, CFSTR("PerProcessLimit"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v20);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v26, CFSTR("LitePerProcessLimit"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v18);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v27, CFSTR("PerCriticalProcessLimit"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v19);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v28, CFSTR("MSLFullDiagLimit"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v19);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v29, CFSTR("ThresholdFullDiagLimit"));

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v30, CFSTR("ProcessSpecificFullDiagQuotas"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v21);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v31, CFSTR("AllowAllProcessesInSysdiagnose"));

  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithArray:", &unk_24CFD0078);
  if (objc_msgSend(v32, "count"))
    v33 = (id)objc_msgSend(v32, "mutableCopy");
  else
    v33 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v34 = v33;
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v33, CFSTR("ProcessesAllowedInSysdiagnose"));

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_variant_has_internal_diagnostics())
  {
    objc_msgSend(v35, "addObject:", CFSTR("mediaserverd"));
    objc_msgSend(v35, "addObject:", CFSTR("cameracaptured"));
  }
  if (os_variant_has_internal_diagnostics())
    objc_msgSend(v35, "addObject:", CFSTR("backboardd"));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v35, CFSTR("LargeExemptedProcesses"));

  objc_msgSend(v13, "setObject:forKeyedSubscript:", v32, qword_254B9C580);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v36, CFSTR("CollectIOAccelMemInfo"));

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v37, CFSTR("FullContentExecNamesList"));

  v38 = objc_alloc(MEMORY[0x24BDBCED8]);
  v39 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v40 = (void *)objc_msgSend(v38, "initWithObjectsAndKeys:", v39, CFSTR("ExecNameList"), 0);
  MREExceptionTypeToString(2);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v40, v41);

  v42 = objc_alloc(MEMORY[0x24BDBCED8]);
  v43 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v44 = (void *)objc_msgSend(v42, "initWithObjectsAndKeys:", v43, CFSTR("ExecNameList"), 0);
  MREExceptionTypeToString(3);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v44, v45);

  v46 = objc_alloc(MEMORY[0x24BDBCED8]);
  v47 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v48 = (void *)objc_msgSend(v46, "initWithObjectsAndKeys:", v47, CFSTR("ExecNameList"), 0);
  MREExceptionTypeToString(4);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v48, v49);

  v50 = objc_alloc(MEMORY[0x24BDBCED8]);
  v51 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v52 = (void *)objc_msgSend(v50, "initWithObjectsAndKeys:", v51, CFSTR("ExecNameList"), 0);
  MREExceptionTypeToString(5);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v52, v53);

  v54 = objc_alloc(MEMORY[0x24BDBCED8]);
  v55 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v56 = (void *)objc_msgSend(v54, "initWithObjectsAndKeys:", v55, CFSTR("ExecNameList"), 0);
  MREExceptionTypeToString(1);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v56, v57);

  v58 = objc_alloc(MEMORY[0x24BDBCED8]);
  v59 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v60 = (void *)objc_msgSend(v58, "initWithObjectsAndKeys:", v59, CFSTR("ExecNameList"), 0);
  MREExceptionTypeToString(6);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v60, v61);

  v62 = objc_alloc(MEMORY[0x24BDBCED8]);
  v63 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v64 = (void *)objc_msgSend(v62, "initWithObjectsAndKeys:", v63, CFSTR("ExecNameList"), 0);
  MREExceptionTypeToString(0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v64, v65);

  if (v70)
    sub_213463ABC(v13, v70);
  if (v68)
    sub_213463ABC(v13, v68);

  return v13;
}

uint64_t sub_213463A70(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  sub_2134632E0();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", v1);

  return v3;
}

void sub_213463ABC(void *a1, void *a2)
{
  id v3;
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  void *v29;
  int v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  id v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  const char *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t v59[128];
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  const __CFString *v63;
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  v5 = 0x24BDBC000uLL;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ExpirationDate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
LABEL_5:
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      objc_msgSend(v3, "allKeys");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
      if (!v11)
        goto LABEL_75;
      v12 = v11;
      v13 = *(_QWORD *)v56;
      v44 = v10;
      while (1)
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v56 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v14);
          if ((objc_msgSend(v15, "isEqualToString:", CFSTR("FullDiagLimit")) & 1) != 0
            || (objc_msgSend(v15, "isEqualToString:", CFSTR("GCoreDiagLimit")) & 1) != 0
            || (objc_msgSend(v15, "isEqualToString:", CFSTR("MSLFullDiagLimit")) & 1) != 0
            || (objc_msgSend(v15, "isEqualToString:", CFSTR("ThresholdFullDiagLimit")) & 1) != 0
            || (objc_msgSend(v15, "isEqualToString:", CFSTR("LiteDiagLimit")) & 1) != 0
            || (objc_msgSend(v15, "isEqualToString:", CFSTR("PerProcessLimit")) & 1) != 0
            || (objc_msgSend(v15, "isEqualToString:", CFSTR("LitePerProcessLimit")) & 1) != 0
            || (objc_msgSend(v15, "isEqualToString:", CFSTR("PerCriticalProcessLimit")) & 1) != 0
            || objc_msgSend(v15, "isEqualToString:", CFSTR("AllowAllProcessesInSysdiagnose")))
          {
            objc_msgSend(v4, "objectForKeyedSubscript:", v15);
            v16 = (id)objc_claimAutoreleasedReturnValue();
            if (v16)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0
                && (unint64_t)(objc_msgSend(v16, "integerValue") + 1) <= 0x2711)
              {
                objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, v15);
              }
            }
          }
          else if (objc_msgSend(v15, "isEqualToString:", CFSTR("ProcessSpecificFullDiagQuotas")))
          {
            objc_msgSend(v4, "objectForKeyedSubscript:", v15);
            v16 = (id)objc_claimAutoreleasedReturnValue();
            if (v16)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v3, "objectForKeyedSubscript:", v15);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                sub_21346499C(v17, v16);

              }
            }
          }
          else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("LargeExemptedProcesses")) & 1) != 0
                 || (objc_msgSend(v15, "isEqualToString:", CFSTR("FullContentExecNamesList")) & 1) != 0
                 || objc_msgSend(v15, "isEqualToString:", qword_254B9C580))
          {
            objc_msgSend(v4, "objectForKeyedSubscript:", v15);
            v16 = (id)objc_claimAutoreleasedReturnValue();
            if (v16)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v41 = v6;
                v43 = v3;
                v53 = 0u;
                v54 = 0u;
                v51 = 0u;
                v52 = 0u;
                v16 = v16;
                v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
                if (v18)
                {
                  v19 = v18;
                  v45 = *(_QWORD *)v52;
                  do
                  {
                    for (i = 0; i != v19; ++i)
                    {
                      if (*(_QWORD *)v52 != v45)
                        objc_enumerationMutation(v16);
                      v21 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        if (!objc_msgSend(v15, "isEqualToString:", CFSTR("FullContentExecNamesList"))
                          || os_variant_has_internal_diagnostics()
                          && (objc_msgSend(v21, "isEqualToString:", CFSTR("mediaserverd")) & 1) != 0)
                        {
                          objc_msgSend(v43, "objectForKeyedSubscript:", v15);
                          v22 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v22, "addObject:", v21);

                          v10 = v44;
                          if (objc_msgSend(v15, "isEqualToString:", qword_254B9C580))
                          {
                            objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("ProcessesAllowedInSysdiagnose"));
                            v23 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v23, "addObject:", v21);

                            v10 = v44;
                          }
                        }
                        else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138412546;
                          v61 = v21;
                          v62 = 2112;
                          v63 = CFSTR("FullContentExecNamesList");
                          _os_log_impl(&dword_21344C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Ignoring process \"%@\" for \"%@\" key, since it isn't know to have received privacy approval for collecting fullContent memgraphs for this OS configuration.", buf, 0x16u);
                        }
                      }
                    }
                    v19 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
                  }
                  while (v19);
                }
LABEL_49:

                v3 = v43;
                v6 = v41;
                v5 = 0x24BDBC000;
              }
            }
          }
          else
          {
            if (!objc_msgSend(v15, "isEqualToString:", CFSTR("ProcessesAllowedInSysdiagnose")))
            {
              v30 = objc_msgSend(v15, "isEqualToString:", CFSTR("CollectIOAccelMemInfo"));
              objc_msgSend(v4, "objectForKeyedSubscript:", v15);
              v31 = objc_claimAutoreleasedReturnValue();
              v16 = (id)v31;
              if (v30)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("CollectIOAccelMemInfo"));
                goto LABEL_73;
              }
              if (v31)
              {
                v42 = v6;
                objc_msgSend(v3, "objectForKeyedSubscript:", v15);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("PerProcessLimit"));
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                if (v33 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  if ((unint64_t)(objc_msgSend(v33, "integerValue") + 1) <= 0x2711)
                  {
                    objc_msgSend(v32, "setObject:forKeyedSubscript:", v33, CFSTR("PerProcessLimit"));
                    goto LABEL_71;
                  }
                }
                else
                {
LABEL_71:
                  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("ExecNameList"));
                  v46 = v32;
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ExecNameList"));
                  v35 = v5;
                  v36 = v3;
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  sub_21346499C(v34, v37);

                  v3 = v36;
                  v5 = v35;

                  v32 = v46;
                }

                v6 = v42;
              }
LABEL_73:
              v10 = v44;
              goto LABEL_23;
            }
            objc_msgSend(v4, "objectForKeyedSubscript:", v15);
            v16 = (id)objc_claimAutoreleasedReturnValue();
            if (v16)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v41 = v6;
                v43 = v3;
                v49 = 0u;
                v50 = 0u;
                v47 = 0u;
                v48 = 0u;
                v16 = v16;
                v24 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
                if (v24)
                {
                  v25 = v24;
                  v26 = *(_QWORD *)v48;
                  do
                  {
                    for (j = 0; j != v25; ++j)
                    {
                      if (*(_QWORD *)v48 != v26)
                        objc_enumerationMutation(v16);
                      v28 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * j);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("ProcessesAllowedInSysdiagnose"));
                        v29 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v29, "addObject:", v28);

                        v10 = v44;
                      }
                    }
                    v25 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
                  }
                  while (v25);
                }
                goto LABEL_49;
              }
            }
          }
LABEL_23:

          ++v14;
        }
        while (v14 != v12);
        v38 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
        v12 = v38;
        if (!v38)
        {
LABEL_75:

          goto LABEL_79;
        }
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "compare:", v7);

      v9 = v8 == -1;
      v5 = 0x24BDBC000uLL;
      if (!v9)
        goto LABEL_5;
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_79;
      *(_WORD *)buf = 0;
      v39 = MEMORY[0x24BDACB70];
      v40 = "The input preferences have expired. Skipping.";
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
LABEL_79:

        goto LABEL_80;
      }
      *(_WORD *)buf = 0;
      v39 = MEMORY[0x24BDACB70];
      v40 = "The input preferences are malformed. Skipping.";
    }
    _os_log_error_impl(&dword_21344C000, v39, OS_LOG_TYPE_ERROR, v40, buf, 2u);
    goto LABEL_79;
  }
LABEL_80:

}

id sub_2134642FC(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v1 = a1;
  v2 = objc_msgSend(v1, "rangeOfString:", CFSTR("_"));
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_10;
  v3 = v2;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", ".memgraph");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v1, "hasSuffix:", v4);

  if ((v5 & 1) != 0)
  {
    v6 = 34;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", ".lite_diag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v1, "hasSuffix:", v7);

  if (!v8)
  {
LABEL_10:
    v12 = 0;
    goto LABEL_11;
  }
  v6 = 35;
LABEL_6:
  v9 = v3 + 1;
  if (objc_msgSend(v1, "containsString:", qword_254B9C588))
    v9 += objc_msgSend((id)qword_254B9C588, "length");
  v10 = v9 + v6;
  v11 = objc_msgSend(v1, "length");
  if (v11 <= v10)
    goto LABEL_10;
  objc_msgSend(v1, "substringWithRange:", v9, v11 - v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v12;
}

id sub_213464414(char a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v37;
  int v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  id v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  id v54;
  id v55;
  id v56;
  id v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v44 = a2;
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", -3600.0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v42 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v4, "nextValidURL");
  v8 = objc_claimAutoreleasedReturnValue();
  v39 = v4;
  v41 = (void *)v6;
  if (v8)
  {
    v9 = (void *)v8;
    v10 = *MEMORY[0x24BDBCBF0];
    v45 = *MEMORY[0x24BDBCCD0];
    while (1)
    {
      v11 = (void *)MEMORY[0x2199B3174]();
      v57 = 0;
      objc_msgSend(v9, "getResourceValue:forKey:error:", &v57, v10, 0);
      v12 = v57;
      if (v12)
        break;
LABEL_25:

      objc_autoreleasePoolPop(v11);
      objc_msgSend(v4, "nextValidURL");
      v22 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v22;
      if (!v22)
        goto LABEL_26;
    }
    v56 = 0;
    objc_msgSend(v9, "getResourceValue:forKey:error:", &v56, v45, 0);
    v13 = v56;
    if (!v13 || (a1 & 1) == 0 && objc_msgSend(v12, "compare:", v6) != -1 && objc_msgSend(v12, "compare:", v6))
    {
LABEL_24:

      goto LABEL_25;
    }
    if (!v44 || objc_msgSend(v13, "hasSuffix:", CFSTR(".lite_diag")))
    {
      objc_msgSend(v42, "addObject:", v9);
      goto LABEL_24;
    }
    sub_2134642FC(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
      goto LABEL_24;
    v40 = v14;
    v15 = v44;
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("AllowAllProcessesInSysdiagnose"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16 && objc_msgSend(v16, "BOOLValue"))
    {

      v18 = v40;
      v4 = v39;
    }
    else
    {
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("ProcessesAllowedInSysdiagnose"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v15;
      v18 = v40;
      v38 = objc_msgSend(v19, "containsObject:", v40);

      v4 = v39;
      v6 = (uint64_t)v41;
      if (!v38)
      {
LABEL_23:

        goto LABEL_24;
      }
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v55 = 0;
      objc_msgSend(v9, "getResourceValue:forKey:error:", &v55, v10, 0);
      v21 = v55;
      v54 = 0;
      objc_msgSend(v20, "getResourceValue:forKey:error:", &v54, v10, 0);
      if (objc_msgSend(v54, "compare:", v21) == -1)
      {
        objc_msgSend(v42, "addObject:");
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v40);
      }
      else
      {
        objc_msgSend(v42, "addObject:", v9);
      }

    }
    else
    {
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v18);
    }

    v18 = v40;
    v6 = (uint64_t)v41;
    goto LABEL_23;
  }
LABEL_26:
  objc_msgSend(v42, "sortUsingComparator:", &unk_24CFC9498);
  objc_msgSend(v7, "keysSortedByValueUsingComparator:", &unk_24CFC9498);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v51 != v26)
          objc_enumerationMutation(v23);
        objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "path");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v29);

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    }
    while (v25);
  }
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v30 = v42;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v47;
    do
    {
      for (j = 0; j != v32; ++j)
      {
        if (*(_QWORD *)v47 != v33)
          objc_enumerationMutation(v30);
        objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * j), "path");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v35);

      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
    }
    while (v32);
  }

  return v5;
}

uint64_t sub_213464904(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  id v9;
  id v10;

  v10 = 0;
  v4 = *MEMORY[0x24BDBCBF0];
  v5 = a3;
  objc_msgSend(a2, "getResourceValue:forKey:error:", &v10, v4, 0);
  v9 = 0;
  v6 = v10;
  objc_msgSend(v5, "getResourceValue:forKey:error:", &v9, v4, 0);

  v7 = objc_msgSend(v9, "compare:", v6);
  return v7;
}

void sub_21346499C(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v11 = a1;
  v3 = a2;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      objc_msgSend(v3, "allKeys");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v13;
        do
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v13 != v7)
              objc_enumerationMutation(v4);
            v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v3, "objectForKeyedSubscript:", v9);
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              if (v10)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0
                  && (unint64_t)(objc_msgSend(v10, "integerValue") + 1) <= 0x2711)
                {
                  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v9);
                }
              }

            }
            ++v8;
          }
          while (v6 != v8);
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v6);
      }

    }
  }

}

uint64_t sub_213464B50()
{
  return 1;
}

FPAuxData *sub_213464B58(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  id v7;
  id v8;
  int v9;
  FPAuxData *v10;
  FPAuxData *v11;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v9 = objc_msgSend(v7, "fp_isContainer");
    if (v9 != objc_msgSend(v8, "fp_isContainer"))
      __assert_rtn("-[NSDictionary(FPAuxData) fp_mergeAuxDatum:withDatum:forceAggregate:]", "FPAuxData.m", 18, "!datum2 || datum1.fp_isContainer == datum2.fp_isContainer");
  }
  if (objc_msgSend(v7, "fp_isContainer"))
  {
    objc_msgSend(v7, "fp_mergeWithData:forceAggregate:", v8, a5);
    v10 = (FPAuxData *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((a5 & 1) == 0 && !objc_msgSend(v7, "shouldAggregate"))
    {
      v11 = 0;
      goto LABEL_11;
    }
    if (v8)
      v10 = -[FPAuxData initWithValue:shouldAggregate:]([FPAuxData alloc], "initWithValue:shouldAggregate:", objc_msgSend(v8, "value") + objc_msgSend(v7, "value"), objc_msgSend(v7, "shouldAggregate"));
    else
      v10 = (FPAuxData *)v7;
  }
  v11 = v10;
LABEL_11:

  return v11;
}

uint64_t sub_213464C68(void *a1, const char *a2, uint64_t a3)
{
  return objc_msgSend(a1, "fp_mergeWithData:forceAggregate:", a3, 0);
}

id sub_213464C70(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v27 = a3;
  if (v27 || !(_DWORD)a4)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v8 = a1;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v33 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v8, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "objectForKeyedSubscript:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "fp_mergeAuxDatum:withDatum:forceAggregate:", v14, v15, a4);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v10);
    }

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v17 = v27;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v29;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v29 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j);
          objc_msgSend(v8, "objectForKeyedSubscript:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v23)
          {
            objc_msgSend(v17, "objectForKeyedSubscript:", v22);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "fp_mergeAuxDatum:withDatum:forceAggregate:", v24, 0, a4);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v25, v22);

          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      }
      while (v19);
    }

    if (objc_msgSend(v7, "count"))
      v6 = v7;
    else
      v6 = 0;

  }
  else
  {
    v6 = a1;
  }

  return v6;
}

id sub_213464F10(void *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = a1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v8, (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "fp_jsonRepresentation");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  return v2;
}

void sub_21346529C()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;
  const char *v5;
  const char *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint8_t buf[4];
  const char *v17;
  stat v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v15 = 1;
  v0 = container_system_group_path_for_identifier();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s/MemoryLimitViolations"), v0);
    if (objc_msgSend(v2, "hasPrefix:", CFSTR("/private")))
    {
      objc_msgSend(v2, "substringFromIndex:", objc_msgSend(CFSTR("/private"), "length"));
      v3 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v3;
    }
    v4 = objc_retainAutorelease(v2);
    v5 = (const char *)objc_msgSend(v4, "UTF8String");
    if (!v5)
      goto LABEL_21;
    v6 = v5;
    memset(&v18, 0, sizeof(v18));
    v7 = stat(v5, &v18);
    if (v7)
    {
      if (v7 != -1)
      {
LABEL_21:
        free(v1);
        goto LABEL_22;
      }
      if (mkpath_np(v6, 0x1C0u))
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v17 = v6;
          _os_log_error_impl(&dword_21344C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unable to create container at %s", buf, 0xCu);
        }
        goto LABEL_21;
      }
    }
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = *MEMORY[0x24BDBCC68];
      v14 = 0;
      v11 = objc_msgSend(v8, "setResourceValue:forKey:error:", MEMORY[0x24BDBD1C8], v10, &v14);
      v12 = v14;
      v13 = v12;
      if (v11 && !v12)
      {

        objc_storeStrong((id *)&qword_253D9AAD0, v4);
        goto LABEL_21;
      }
    }
    else
    {
      v13 = 0;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v17 = v6;
      _os_log_error_impl(&dword_21344C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unable to exclude the container from backups: %s", buf, 0xCu);
    }

    goto LABEL_21;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v18.st_dev = 134217984;
    *(_QWORD *)&v18.st_mode = v15;
    _os_log_error_impl(&dword_21344C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Error fetching container: %llu", (uint8_t *)&v18, 0xCu);
  }
  v4 = (id)qword_253D9AAD0;
  qword_253D9AAD0 = 0;
LABEL_22:

}

void sub_21346559C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint8_t buf[4];
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v0 = container_system_group_path_for_identifier();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s/epl_preferences.plist"), v0);
    v3 = (void *)qword_253D9AAE0;
    qword_253D9AAE0 = v2;

    free(v1);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v6 = 1;
      _os_log_error_impl(&dword_21344C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Error fetching container: %llu", buf, 0xCu);
    }
    v4 = (void *)qword_253D9AAE0;
    qword_253D9AAE0 = 0;

  }
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x24BDBBAC0](bundle);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionaryReplaceValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE50](theDict, key, value);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x24BDBC520](alloc, theString);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC858](allocator, filePath, pathStyle, isDirectory);
}

CFUUIDRef CFUUIDCreateFromString(CFAllocatorRef alloc, CFStringRef uuidStr)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8D8](alloc, uuidStr);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8E0](alloc, *(_QWORD *)&bytes.byte0, *(_QWORD *)&bytes.byte8);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x24BDBC8E8](alloc, uuid);
}

uint64_t CSIsNull()
{
  return MEMORY[0x24BE286D0]();
}

uint64_t CSRegionGetName()
{
  return MEMORY[0x24BE286E8]();
}

uint64_t CSRegionGetRange()
{
  return MEMORY[0x24BE286F0]();
}

uint64_t CSRelease()
{
  return MEMORY[0x24BE286F8]();
}

uint64_t CSRetain()
{
  return MEMORY[0x24BE28700]();
}

uint64_t CSSymbolGetName()
{
  return MEMORY[0x24BE28758]();
}

uint64_t CSSymbolGetRange()
{
  return MEMORY[0x24BE28760]();
}

uint64_t CSSymbolOwnerForeachSegment()
{
  return MEMORY[0x24BE28790]();
}

uint64_t CSSymbolOwnerGetArchitecture()
{
  return MEMORY[0x24BE287A8]();
}

uint64_t CSSymbolOwnerGetBaseAddress()
{
  return MEMORY[0x24BE287B0]();
}

uint64_t CSSymbolOwnerGetCFUUIDBytes()
{
  return MEMORY[0x24BE287B8]();
}

uint64_t CSSymbolOwnerGetName()
{
  return MEMORY[0x24BE287C8]();
}

uint64_t CSSymbolOwnerGetPath()
{
  return MEMORY[0x24BE287D0]();
}

uint64_t CSSymbolOwnerGetSymbolWithAddress()
{
  return MEMORY[0x24BE287E0]();
}

uint64_t CSSymbolicatorCreateWithTaskFlagsAndNotification()
{
  return MEMORY[0x24BE28868]();
}

uint64_t CSSymbolicatorForeachSymbolicatorWithURL()
{
  return MEMORY[0x24BE288A0]();
}

uint64_t CSSymbolicatorGetFlagsForNoSymbolOrSourceInfoData()
{
  return MEMORY[0x24BE288C0]();
}

uint64_t CSSymbolicatorGetSymbolOwnerWithAddressAtTime()
{
  return MEMORY[0x24BE288F0]();
}

uint64_t CSSymbolicatorGetSymbolOwnerWithUUIDAtTime()
{
  return MEMORY[0x24BE28908]();
}

uint64_t NSLocalizedFileSizeDescription()
{
  return MEMORY[0x24BDD0FE0]();
}

const NXArchInfo *__cdecl NXGetArchInfoFromCpuType(cpu_type_t cputype, cpu_subtype_t cpusubtype)
{
  return (const NXArchInfo *)MEMORY[0x24BDAC4B8](*(_QWORD *)&cputype, *(_QWORD *)&cpusubtype);
}

uint64_t SMJobIsEnabled()
{
  return MEMORY[0x24BE85458]();
}

uint64_t VMUGetFlagsForAllVMRegionStatistics()
{
  return MEMORY[0x24BEB3450]();
}

uint64_t VMURegionTypeDescriptionForTagShareProtAndPager()
{
  return MEMORY[0x24BEB3458]();
}

uint64_t VMUScanningMaskForAllReferences()
{
  return MEMORY[0x24BEB3460]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFBundleCreateWithExecutableURLIfLooksLikeBundle()
{
  return MEMORY[0x24BDBCF88]();
}

uint64_t _CFCopySupplementalVersionDictionary()
{
  return MEMORY[0x24BDBCFA8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x24BDACB40]();
}

uint64_t _os_crash()
{
  return MEMORY[0x24BDACB50]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t container_system_group_path_for_identifier()
{
  return MEMORY[0x24BDADBA8]();
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
  MEMORY[0x24BDADC70](iterations, queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

uint64_t dyld_image_for_each_segment_info()
{
  return MEMORY[0x24BDAE0E8]();
}

uint64_t dyld_image_get_file_path()
{
  return MEMORY[0x24BDAE0F0]();
}

uint64_t dyld_image_get_installname()
{
  return MEMORY[0x24BDAE0F8]();
}

uint64_t dyld_process_create_for_task()
{
  return MEMORY[0x24BDAE110]();
}

uint64_t dyld_process_dispose()
{
  return MEMORY[0x24BDAE118]();
}

uint64_t dyld_process_snapshot_create_for_process()
{
  return MEMORY[0x24BDAE120]();
}

uint64_t dyld_process_snapshot_dispose()
{
  return MEMORY[0x24BDAE128]();
}

uint64_t dyld_process_snapshot_for_each_image()
{
  return MEMORY[0x24BDAE130]();
}

uint64_t dyld_process_snapshot_get_shared_cache()
{
  return MEMORY[0x24BDAE138]();
}

uint64_t dyld_shared_cache_copy_uuid()
{
  return MEMORY[0x24BDAE150]();
}

uint64_t dyld_shared_cache_for_each_file()
{
  return MEMORY[0x24BDAE158]();
}

uint64_t dyld_shared_cache_for_file()
{
  return MEMORY[0x24BDAE160]();
}

uint64_t dyld_shared_cache_get_base_address()
{
  return MEMORY[0x24BDAE168]();
}

uint64_t dyld_shared_cache_get_mapped_size()
{
  return MEMORY[0x24BDAE170]();
}

uint64_t dyld_shared_cache_is_mapped_private()
{
  return MEMORY[0x24BDAE178]();
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x24BDAE780](a1, a2);
}

uint64_t ledger()
{
  return MEMORY[0x24BDAEA48]();
}

void mach_error(const char *str, mach_error_t error_value)
{
  MEMORY[0x24BDAEB50](str, *(_QWORD *)&error_value);
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x24BDAEB58](*(_QWORD *)&error_value);
}

uint64_t mach_get_times()
{
  return MEMORY[0x24BDAEB60]();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x24BDAEBB0](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_port_get_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_urefs_t *refs)
{
  return MEMORY[0x24BDAEBD8](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&right, refs);
}

kern_return_t mach_port_kernel_object(ipc_space_read_t task, mach_port_name_t name, unsigned int *object_type, unsigned int *object_addr)
{
  return MEMORY[0x24BDAEBF0](*(_QWORD *)&task, *(_QWORD *)&name, object_type, object_addr);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x24BDAEBF8](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&right, *(_QWORD *)&delta);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

kern_return_t mach_vm_page_range_query(vm_map_read_t target_map, mach_vm_offset_t address, mach_vm_size_t size, mach_vm_address_t dispositions, mach_vm_size_t *dispositions_count)
{
  return MEMORY[0x24BDAEC90](*(_QWORD *)&target_map, address, size, dispositions, dispositions_count);
}

kern_return_t mach_vm_purgable_control(vm_map_t target_task, mach_vm_address_t address, vm_purgable_t control, int *state)
{
  return MEMORY[0x24BDAECA0](*(_QWORD *)&target_task, address, *(_QWORD *)&control, state);
}

kern_return_t mach_vm_region(vm_map_read_t target_task, mach_vm_address_t *address, mach_vm_size_t *size, vm_region_flavor_t flavor, vm_region_info_t info, mach_msg_type_number_t *infoCnt, mach_port_t *object_name)
{
  return MEMORY[0x24BDAECA8](*(_QWORD *)&target_task, address, size, *(_QWORD *)&flavor, info, infoCnt, object_name);
}

kern_return_t mach_vm_region_recurse(vm_map_read_t target_task, mach_vm_address_t *address, mach_vm_size_t *size, natural_t *nesting_depth, vm_region_recurse_info_t info, mach_msg_type_number_t *infoCnt)
{
  return MEMORY[0x24BDAECB0](*(_QWORD *)&target_task, address, size, nesting_depth, info, infoCnt);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED88](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

int mkpath_np(const char *path, mode_t omode)
{
  return MEMORY[0x24BDAEF60](path, omode);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x24BDAF4D0]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x24BDAF4D8]();
}

void perror(const char *a1)
{
  MEMORY[0x24BDAF5A8](a1);
}

kern_return_t pid_for_task(mach_port_name_t t, int *x)
{
  return MEMORY[0x24BDAF5B0](*(_QWORD *)&t, x);
}

int proc_get_dirty(pid_t pid, uint32_t *flags)
{
  return MEMORY[0x24BDAF6C0](*(_QWORD *)&pid, flags);
}

int proc_listallpids(void *buffer, int buffersize)
{
  return MEMORY[0x24BDAF6C8](buffer, *(_QWORD *)&buffersize);
}

int proc_pid_rusage(int pid, int flavor, rusage_info_t *buffer)
{
  return MEMORY[0x24BDAF6E8](*(_QWORD *)&pid, *(_QWORD *)&flavor, buffer);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x24BDAF6F8](*(_QWORD *)&pid, *(_QWORD *)&flavor, arg, buffer, *(_QWORD *)&buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x24BDAF708](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

int proc_regionfilename(int pid, uint64_t address, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x24BDAF718](*(_QWORD *)&pid, address, buffer, *(_QWORD *)&buffersize);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x24BDAFE00](*(_QWORD *)&a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return MEMORY[0x24BDAFF20](*(_QWORD *)&__errnum, __strerrbuf, __buflen);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x24BDB00F8](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

kern_return_t task_map_corpse_info_64(task_t task, task_read_t corspe_task, mach_vm_address_t *kcd_addr_begin, mach_vm_size_t *kcd_size)
{
  return MEMORY[0x24BDB0188](*(_QWORD *)&task, *(_QWORD *)&corspe_task, kcd_addr_begin, kcd_size);
}

uint64_t task_read_for_pid()
{
  return MEMORY[0x24BDB0198]();
}

kern_return_t task_resume2(task_suspension_token_t suspend_token)
{
  return MEMORY[0x24BDB01A8](*(_QWORD *)&suspend_token);
}

kern_return_t task_suspend2(task_read_t target_task, task_suspension_token_t *suspend_token)
{
  return MEMORY[0x24BDB01C0](*(_QWORD *)&target_task, suspend_token);
}

kern_return_t thread_info(thread_inspect_t target_act, thread_flavor_t flavor, thread_info_t thread_info_out, mach_msg_type_number_t *thread_info_outCnt)
{
  return MEMORY[0x24BDB0210](*(_QWORD *)&target_act, *(_QWORD *)&flavor, thread_info_out, thread_info_outCnt);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x24BDB0390](*(_QWORD *)&target_task, address, size);
}

uint64_t xpc_coalition_copy_info()
{
  return MEMORY[0x24BDB0708]();
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x24BDB0740](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x24BDB0798](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x24BDB07A8](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x24BDB07B0](connection, message, replyq, handler);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x24BDB07B8](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0938](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x24BDB09A8](xdict, key, value);
}

uint64_t xpc_dictionary_set_mach_send()
{
  return MEMORY[0x24BDB09B8]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

