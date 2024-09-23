@implementation NSMutableDictionary(OSAStackshotKCDataExtension)

- (void)addTurnstileInfoDesc:()OSAStackshotKCDataExtension count:elSize:
{
  void *v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[2];
  void (*v14)(uint64_t, uint64_t, uint64_t);
  void *v15;
  void *v16;
  id v17;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    v10 = 0;
    v11 = 0;
    v12 = MEMORY[0x1E0C809B0];
    do
    {
      v13[0] = v12;
      v13[1] = 3221225472;
      v14 = __86__NSMutableDictionary_OSAStackshotKCDataExtension__addTurnstileInfoDesc_count_elSize___block_invoke;
      v15 = &unk_1E4DED748;
      v16 = a1;
      v17 = v9;
      v14((uint64_t)v13, v11, a3 + v10);

      ++v11;
      v10 += a5;
    }
    while (a4 != v11);
  }
  if (objc_msgSend(v9, "count"))
    objc_msgSend(a1, "setObject:forKeyedSubscript:", v9, CFSTR("turnstileInfo"));

}

- (void)addWaitInfoDesc:()OSAStackshotKCDataExtension count:elSize:
{
  void *v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[2];
  void (*v14)(uint64_t, uint64_t, uint64_t *);
  void *v15;
  void *v16;
  id v17;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    v10 = 0;
    v11 = 0;
    v12 = MEMORY[0x1E0C809B0];
    do
    {
      v13[0] = v12;
      v13[1] = 3221225472;
      v14 = __81__NSMutableDictionary_OSAStackshotKCDataExtension__addWaitInfoDesc_count_elSize___block_invoke;
      v15 = &unk_1E4DED770;
      v16 = a1;
      v17 = v9;
      v14((uint64_t)v13, v11, (uint64_t *)(a3 + v10));

      ++v11;
      v10 += a5;
    }
    while (a4 != v11);
  }
  if (objc_msgSend(v9, "count"))
    objc_msgSend(a1, "setObject:forKeyedSubscript:", v9, CFSTR("waitInfo"));

}

- (void)parsePortLabelContainer:()OSAStackshotKCDataExtension
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  char *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("portlabels"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(a1, "setObject:forKeyedSubscript:", v8, CFSTR("portlabels"));

  }
  v9 = a3 + 16;
  if (a3 + 16 <= a4)
  {
    v10 = 0xFFFFFFFFLL;
    v17 = CFSTR("(unknown)");
    do
    {
      if (v9 + (unint64_t)*(unsigned int *)(a3 + 4) > a4)
        break;
      v11 = *(_DWORD *)a3;
      if (*(_DWORD *)a3 == -242132755)
        break;
      if ((v11 & 0xFFFFFFF0) == 0x20)
        v11 = 17;
      switch(v11)
      {
        case 19:
          if (*(_DWORD *)(a3 + 16) != 2356)
            -[NSMutableDictionary(OSAStackshotKCDataExtension) parsePortLabelContainer:].cold.2();
          v10 = *(unsigned int *)(a3 + 8);
          break;
        case 2357:
          if ((_DWORD)v10 != *(__int16 *)(a3 + 16))
            -[NSMutableDictionary(OSAStackshotKCDataExtension) parsePortLabelContainer:].cold.1();
          v13 = (*(_WORD *)(a3 + 18) & 2) != 0 ? " (service throttled by launchd)" : ";
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%s"), v17, v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("portlabels"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v14);

          break;
        case 2358:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3 + 16);
          v12 = objc_claimAutoreleasedReturnValue();

          v17 = (__CFString *)v12;
          break;
        default:
          goto LABEL_22;
      }
      a3 = v9 + *(unsigned int *)(a3 + 4);
      v9 = a3 + 16;
    }
    while (a3 + 16 <= a4);
  }
  else
  {
    v17 = CFSTR("(unknown)");
  }
LABEL_22:

}

- (void)parsePortLabelContainer:()OSAStackshotKCDataExtension .cold.1()
{
  __assert_rtn("-[NSMutableDictionary(OSAStackshotKCDataExtension) parsePortLabelContainer:]", "OSAStackShotReport.m", 322, "portlabel_info->portlabel_id == portlabel_id");
}

- (void)parsePortLabelContainer:()OSAStackshotKCDataExtension .cold.2()
{
  __assert_rtn("-[NSMutableDictionary(OSAStackshotKCDataExtension) parsePortLabelContainer:]", "OSAStackShotReport.m", 334, "kcdata_iter_container_type(iter) == STACKSHOT_KCCONTAINER_PORTLABEL");
}

@end
