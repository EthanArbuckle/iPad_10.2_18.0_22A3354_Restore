@implementation NSThread(NSThread_TSUAdditions)

+ (__CFString)tsu_currentThreadName
{
  int v0;
  char v1;
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  void *v5;
  const char *label;
  uint64_t v7;
  _opaque_pthread_t *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _OWORD v32[2];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v0 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
  v1 = v0;
  v2 = CFSTR("MT");
  if (v0)
    v3 = CFSTR("MT");
  else
    v3 = 0;
  v4 = v3;
  if ((v1 & 1) == 0
    && (objc_msgSend(MEMORY[0x24BDD1710], "currentQueue"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "name"),
        v2 = (__CFString *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v2)
    || !-[__CFString length](v2, "length"))
  {
    label = dispatch_queue_get_label(0);
    if (label)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", label, 1);
      v7 = objc_claimAutoreleasedReturnValue();

      v2 = (__CFString *)v7;
    }
    if (!v2)
      goto LABEL_13;
  }
  if (!-[__CFString length](v2, "length"))
  {
LABEL_13:
    v31 = 0u;
    memset(v32, 0, 28);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = pthread_self();
    pthread_getname_np(v8, (char *)&v15, 0x12CuLL);
    if ((_BYTE)v15)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", &v15, 1);
      v9 = objc_claimAutoreleasedReturnValue();

      v2 = (__CFString *)v9;
    }
    if (!v2)
      goto LABEL_21;
  }
  if (!-[__CFString length](v2, "length", v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31,
          v32[0],
          *(_QWORD *)&v32[1],
          *((_QWORD *)&v32[1] + 1)))
  {
LABEL_21:
    objc_msgSend(MEMORY[0x24BDD17F0], "currentThread", (_QWORD)v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "name");
    v11 = objc_claimAutoreleasedReturnValue();

    v2 = (__CFString *)v11;
    if (!v11)
      goto LABEL_17;
  }
  if (!-[__CFString length](v2, "length"))
  {
LABEL_17:
    objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "description");
    v13 = objc_claimAutoreleasedReturnValue();

    v2 = (__CFString *)v13;
  }
  return v2;
}

@end
