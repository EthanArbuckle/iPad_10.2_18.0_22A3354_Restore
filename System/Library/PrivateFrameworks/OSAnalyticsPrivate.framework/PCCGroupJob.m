@implementation PCCGroupJob

- (id)result
{
  void *errObj;

  errObj = self->super._errObj;
  if (!errObj)
    errObj = self->_content;
  return errObj;
}

- (id)type
{
  return self->_group_type;
}

- (PCCGroupJob)initWithID:(id)a3 forTarget:(id)a4 options:(id)a5
{
  id v8;
  PCCGroupJob *v9;
  uint64_t v10;
  NSMutableArray *log_sets;
  void *v12;
  uint64_t v13;
  __CFString *v14;
  NSMutableArray *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSMutableArray *v20;
  void *v21;
  void *v22;
  void *v23;
  NSMutableArray *v24;
  void *v25;
  void *v26;
  NSMutableArray *v27;
  void *v28;
  void *v29;
  void *v30;
  unsigned int total_count;
  objc_super v33;
  uint8_t buf[4];
  unsigned int v35;
  void *v36;
  _QWORD v37[5];
  _QWORD v38[5];
  _QWORD v39[5];
  _QWORD v40[7];

  v40[5] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v33.receiver = self;
  v33.super_class = (Class)PCCGroupJob;
  v9 = -[PCCJob initWithID:forTarget:options:](&v33, sel_initWithID_forTarget_options_, a3, a4, v8);
  if (v9)
  {
    v10 = objc_opt_new();
    log_sets = v9->_log_sets;
    v9->_log_sets = (NSMutableArray *)v10;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("allFiles"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "BOOLValue");

    if ((_DWORD)v13)
      v14 = CFSTR("xfer-all");
    else
      v14 = CFSTR("xfer-group");
    objc_storeStrong((id *)&v9->_group_type, v14);
    v15 = v9->_log_sets;
    v39[0] = CFSTR("routing");
    v39[1] = CFSTR("extensions");
    v40[0] = CFSTR("<sync>");
    v40[1] = &unk_1E9552620;
    v40[2] = CFSTR("log-aggregated");
    v39[2] = CFSTR("<sort>");
    v39[3] = CFSTR("<exempt>");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v39[4] = CFSTR("<cleanup>");
    v17 = MEMORY[0x1E0C9AAB0];
    v40[3] = v16;
    v40[4] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "mutableCopy");
    -[NSMutableArray addObject:](v15, "addObject:", v19);

    v20 = v9->_log_sets;
    v37[0] = CFSTR("routing");
    v37[1] = CFSTR("extensions");
    v38[0] = CFSTR("<sync>");
    v38[1] = &unk_1E9552638;
    v38[2] = MEMORY[0x1E0C9AAA0];
    v37[2] = CFSTR("<metadata>");
    v37[3] = CFSTR("<exempt>");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v37[4] = CFSTR("<cleanup>");
    v38[3] = v21;
    v38[4] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "mutableCopy");
    -[NSMutableArray addObject:](v20, "addObject:", v23);

    if ((_DWORD)v13)
    {
      v24 = v9->_log_sets;
      v25 = (void *)objc_msgSend(&unk_1E9552528, "mutableCopy");
      -[NSMutableArray addObject:](v24, "addObject:", v25);

    }
    v26 = (void *)MEMORY[0x1E0D64EC8];
    v27 = v9->_log_sets;
    objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "pathSubmission");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_total_count = objc_msgSend(v26, "scanLogs:from:", v27, v30);

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      total_count = v9->_total_count;
      *(_DWORD *)buf = 67109120;
      v35 = total_count;
      _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "gathered %u files for transfer", buf, 8u);
    }
    -[PCCGroupJob prepareNext](v9, "prepareNext");
  }

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t success_count;
  uint64_t total_count;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PCCJob jid](self, "jid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  success_count = self->_success_count;
  total_count = self->_total_count;
  -[OSALog filepath](self->super._package, "filepath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("group %@ %d/%d %@"), v4, success_count, total_count, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)prepareNext
{
  OSALog *package;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  OSALog *v22;
  unsigned int success_count;
  unsigned int rejected_count;
  unsigned int error_count;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSDictionary *v31;
  NSDictionary *content;
  NSMutableArray *obj;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  _QWORD v43[4];
  uint8_t buf[4];
  _BYTE v45[10];
  __int16 v46;
  unsigned int v47;
  __int16 v48;
  void *v49;
  _QWORD v50[4];
  _QWORD v51[4];
  _QWORD v52[3];
  _QWORD v53[3];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  package = self->super._package;
  self->super._package = 0;

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = self->_log_sets;
  v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v38, v54, 16);
  if (v35)
  {
    v34 = *(_QWORD *)v39;
LABEL_3:
    v4 = 0;
    while (1)
    {
      if (*(_QWORD *)v39 != v34)
        objc_enumerationMutation(obj);
      v36 = v4;
      v5 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v4);
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("routing"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("logs"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("<metadata>"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("<metadata>"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "BOOLValue");

      }
      else
      {
        v9 = 1;
      }

      v52[0] = CFSTR("<metadata>");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v53[0] = v10;
      v52[1] = CFSTR("<exempt>");
      v11 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v5, "objectForKeyedSubscript:");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "numberWithBool:", objc_msgSend(v12, "BOOLValue"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v53[1] = v13;
      v52[2] = CFSTR("<cleanup>");
      v14 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v5, "objectForKeyedSubscript:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "numberWithBool:", objc_msgSend(v15, "BOOLValue"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v53[2] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      while (1)
      {

        if (!objc_msgSend(v6, "count"))
          break;
        objc_msgSend(v6, "firstObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "removeObjectAtIndex:", 0);
        v50[0] = CFSTR("current");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_success_count + 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v51[0] = v18;
        v50[1] = CFSTR("rejects");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_rejected_count);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v51[1] = v19;
        v50[2] = CFSTR("errors");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_error_count);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v51[2] = v20;
        v50[3] = CFSTR("total");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_total_count);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v51[3] = v21;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        -[PCCJob packageLog:forRouting:info:options:](self, "packageLog:forRouting:info:options:", v10, v37, v12, v17);
        if (self->super._package)
        {

          break;
        }
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v45 = v10;
          _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "unable to package %@", buf, 0xCu);
        }
        ++self->_rejected_count;
      }
      v22 = self->super._package;

      if (v22)
        break;
      v4 = v36 + 1;
      if (v36 + 1 == v35)
      {
        v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v38, v54, 16);
        if (v35)
          goto LABEL_3;
        break;
      }
    }
  }

  if (!self->super._package)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      success_count = self->_success_count;
      rejected_count = self->_rejected_count;
      error_count = self->_error_count;
      -[PCCJob jid](self, "jid");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v45 = success_count;
      *(_WORD *)&v45[4] = 1024;
      *(_DWORD *)&v45[6] = rejected_count;
      v46 = 1024;
      v47 = error_count;
      v48 = 2112;
      v49 = v26;
      _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "finished transferring %u logs successfully (%u rejected, %u errors) for job %@", buf, 0x1Eu);

    }
    v42[0] = CFSTR("current");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_success_count);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v27;
    v42[1] = CFSTR("rejects");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_rejected_count);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = v28;
    v42[2] = CFSTR("errors");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_error_count);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v43[2] = v29;
    v42[3] = CFSTR("total");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_total_count);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v43[3] = v30;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 4);
    v31 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    content = self->_content;
    self->_content = v31;

    CFPreferencesSetAppValue(CFSTR("LastSuccess"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0C99D68], "date"), CFSTR("com.apple.ProxiedCrashCopier"));
  }
}

- (void)registerResult:(BOOL)a3 error:(id)a4
{
  _BOOL4 v5;
  id v7;
  OSALog *package;
  unsigned int v9;
  unsigned int consecutive_error_count;
  OSALog *v11;
  _DWORD v12[2];
  uint64_t v13;

  v5 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  package = self->super._package;
  if (!package)
    -[PCCGroupJob registerResult:error:].cold.1();
  if (v5)
  {
    -[OSALog retire:](package, "retire:", "transferred");
    self->_consecutive_error_count = 0;
    ++self->_success_count;
LABEL_7:
    -[PCCGroupJob prepareNext](self, "prepareNext");
    goto LABEL_8;
  }
  ++self->_error_count;
  v9 = self->_consecutive_error_count + 1;
  self->_consecutive_error_count = v9;
  if (v9 <= 2)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      consecutive_error_count = self->_consecutive_error_count;
      v12[0] = 67109120;
      v12[1] = consecutive_error_count;
      _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "consecutive file send failure #%u", (uint8_t *)v12, 8u);
    }
    goto LABEL_7;
  }
  objc_storeStrong((id *)&self->super._errObj, a4);
  v11 = self->super._package;
  self->super._package = 0;

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12[0]) = 0;
    _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "file send failure limit, abandoning job", (uint8_t *)v12, 2u);
  }
LABEL_8:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group_type, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_log_sets, 0);
}

- (void)registerResult:error:.cold.1()
{
  __assert_rtn("-[PCCGroupJob registerResult:error:]", "PCCJob.m", 256, "_package");
}

@end
