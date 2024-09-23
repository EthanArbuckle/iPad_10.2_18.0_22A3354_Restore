@implementation SMBDirEnumerator

- (int)cleanup
{
  SMB_rq *f_create_rqp;
  SMB_rq *v4;
  SMB_rq *f_query_dir_rqp;
  SMB_rq *v6;
  SMBPiston *pd;
  void *v8;
  void *v9;
  int v10;

  f_create_rqp = self->f_create_rqp;
  if (f_create_rqp)
  {
    -[SMB_rq smb_rq_done](f_create_rqp, "smb_rq_done");
    v4 = self->f_create_rqp;
    self->f_create_rqp = 0;

  }
  f_query_dir_rqp = self->f_query_dir_rqp;
  if (f_query_dir_rqp)
  {
    -[SMB_rq smb_rq_done](f_query_dir_rqp, "smb_rq_done");
    v6 = self->f_query_dir_rqp;
    self->f_query_dir_rqp = 0;

  }
  if (self->f_need_close == 1)
  {
    pd = self->pd;
    if (pd)
    {
      -[SMBPiston sock](pd, "sock");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
LABEL_15:
        self->f_need_close = 0;
        goto LABEL_16;
      }
      -[SMBPiston sock](self->pd, "sock");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "writeEnabled");

      if (v10 == 1)
      {
        LODWORD(v8) = smb2_smb_close_fid(self->f_node, 0, 0);
        if ((_DWORD)v8 && piston_log_level && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[SMBDirEnumerator cleanup].cold.1();
        goto LABEL_15;
      }
    }
    LODWORD(v8) = 0;
    goto LABEL_15;
  }
  LODWORD(v8) = 0;
LABEL_16:
  self->f_flags = 0;
  return (int)v8;
}

- (void)close:(smb_dir_enum_out *)a3 callBack:(id)a4
{
  void (**v5)(id, uint64_t);
  void *v6;
  void *v7;
  NSObject *v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD block[4];
  void (**v18)(id, uint64_t);
  id v19;
  id location;

  v5 = (void (**)(id, uint64_t))a4;
  objc_initWeak(&location, self);
  -[SMBPiston sock](self->pd, "sock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v9 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v9)
    {
      -[SMBDirEnumerator close:callBack:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
      if (!v5)
        goto LABEL_6;
    }
    else if (!v5)
    {
      goto LABEL_6;
    }
    v5[2](v5, 57);
    goto LABEL_6;
  }
  -[SMBPiston sock](self->pd, "sock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "signing_queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__SMBDirEnumerator_close_callBack___block_invoke;
  block[3] = &unk_24FE013E8;
  v18 = v5;
  objc_copyWeak(&v19, &location);
  dispatch_async(v8, block);

  objc_destroyWeak(&v19);
LABEL_6:
  objc_destroyWeak(&location);

}

void __35__SMBDirEnumerator_close_callBack___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)MEMORY[0x2348B63BC](*(_QWORD *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = objc_msgSend(WeakRetained, "cleanup");

  v4 = v5;
  if (v5)
  {
    (*((void (**)(id, uint64_t))v5 + 2))(v5, v3);
    v4 = v5;
  }

}

- (void)dealloc
{
  objc_super v3;

  -[SMBDirEnumerator cleanup](self, "cleanup");
  v3.receiver = self;
  v3.super_class = (Class)SMBDirEnumerator;
  -[SMBDirEnumerator dealloc](&v3, sel_dealloc);
}

- (int)commonInit:(id)a3 onShareID:(unsigned int)a4 dirName:(id)a5 lookUpName:(id)a6 searchFlags:(unsigned int)a7 outParameters:(smb_dir_enum_out *)a8
{
  char v9;
  id v15;
  id v16;
  NSString *v17;
  int v18;
  NSString *v19;
  NSString *f_createName;
  unsigned int v21;
  NSString *f_lookupName;

  v9 = a7;
  v15 = a3;
  v16 = a5;
  v17 = (NSString *)a6;
  objc_storeStrong((id *)&self->pd, a3);
  v18 = self->f_flags | 1;
  self->f_shareID = a4;
  self->f_flags = v18;
  if (v16)
    v19 = (NSString *)v16;
  else
    v19 = 0;
  f_createName = self->f_createName;
  self->f_createName = v19;

  if ((v9 & 1) != 0)
  {
    v21 = (_DWORD)-[SMBPiston getSessionPtr](self->pd, "getSessionPtr")[80] / 0x60u;
  }
  else
  {
    self->f_flags |= 4u;
    self->f_sfm_conversion = 32;
    LOWORD(v21) = 1;
  }
  self->f_searchCount = v21;
  self->f_infolevel = 37;
  self->f_attrmask = 22;
  f_lookupName = self->f_lookupName;
  self->f_lookupName = v17;

  bzero(self->f_NetworkNameBuffer, 0x3FCuLL);
  a8->var0 = 0;

  return 0;
}

- (id)init:(id)a3 onShareID:(unsigned int)a4 dirName:(id)a5 lookUpName:(id)a6 searchFlags:(unsigned int)a7 outParameters:(smb_dir_enum_out *)a8 callBack:(id)a9
{
  id v15;
  id v16;
  id v17;
  void (**v18)(id, uint64_t);
  SMBDirEnumerator *v19;
  void *v20;
  NSObject *v21;
  smb_dir_enum_out *v22;
  SMBDirEnumerator *v23;
  SMBDirEnumerator *v24;
  _BOOL8 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v34;
  _QWORD block[4];
  SMBDirEnumerator *v36;
  id v37;
  id v38;
  id v39;
  void (**v40)(id, uint64_t);
  smb_dir_enum_out *v41;
  unsigned int v42;
  unsigned int v43;
  objc_super v44;

  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = (void (**)(id, uint64_t))a9;
  v44.receiver = self;
  v44.super_class = (Class)SMBDirEnumerator;
  v19 = -[SMBDirEnumerator init](&v44, sel_init);
  if (!v19)
    goto LABEL_7;
  objc_msgSend(v15, "sock");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    v25 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v25)
    {
      -[SMBDirEnumerator init:onShareID:dirName:lookUpName:searchFlags:outParameters:callBack:].cold.1(v25, v26, v27, v28, v29, v30, v31, v32);
      if (!v18)
        goto LABEL_7;
    }
    else if (!v18)
    {
LABEL_7:
      v24 = 0;
      goto LABEL_8;
    }
    v18[2](v18, 57);
    goto LABEL_7;
  }
  objc_msgSend(v15, "sock");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "signing_queue");
  v21 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __89__SMBDirEnumerator_init_onShareID_dirName_lookUpName_searchFlags_outParameters_callBack___block_invoke;
  block[3] = &unk_24FE01410;
  v22 = a8;
  v23 = v19;
  v36 = v23;
  v37 = v15;
  v42 = a4;
  v38 = v16;
  v43 = a7;
  v39 = v17;
  v41 = v22;
  v40 = v18;
  dispatch_async(v21, block);

  v24 = v23;
LABEL_8:

  return v24;
}

uint64_t __89__SMBDirEnumerator_init_onShareID_dirName_lookUpName_searchFlags_outParameters_callBack___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "commonInit:onShareID:dirName:lookUpName:searchFlags:outParameters:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 80), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 84), *(_QWORD *)(a1 + 72));
  result = *(_QWORD *)(a1 + 64);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v2);
  return result;
}

+ (void)enumeratorWithParameters:(id)a3 onShareID:(unsigned int)a4 dirName:(id)a5 lookUpName:(id)a6 searchFlags:(unsigned int)a7 outParameters:(smb_dir_enum_out *)a8 callBack:(id)a9
{
  uint64_t v10;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void (**v17)(id, uint64_t, _QWORD);
  SMBDirEnumerator *v18;
  void *v19;
  _BOOL8 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  SMBDirEnumerator *v29;

  v10 = *(_QWORD *)&a7;
  v13 = *(_QWORD *)&a4;
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = (void (**)(id, uint64_t, _QWORD))a9;
  v18 = objc_alloc_init(SMBDirEnumerator);
  objc_msgSend(v14, "sock");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    v20 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v20)
      +[SMBDirEnumerator enumeratorWithParameters:onShareID:dirName:lookUpName:searchFlags:outParameters:callBack:].cold.1(v20, v21, v22, v23, v24, v25, v26, v27);
    v17[2](v17, 57, 0);
  }
  v28 = -[SMBDirEnumerator commonInit:onShareID:dirName:lookUpName:searchFlags:outParameters:](v18, "commonInit:onShareID:dirName:lookUpName:searchFlags:outParameters:", v14, v13, v15, v16, v10, a8);
  if ((_DWORD)v28)
    v29 = 0;
  else
    v29 = v18;
  ((void (**)(id, uint64_t, SMBDirEnumerator *))v17)[2](v17, v28, v29);

}

- (void)nextEntry:(id)a3 outParameters:(smb_dir_enum_out *)a4 callBack:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t);
  void *v10;
  void *v11;
  NSObject *v12;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL8 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[5];
  id v31;
  void (**v32)(id, uint64_t);
  id v33[2];
  id location;

  v8 = a3;
  v9 = (void (**)(id, uint64_t))a5;
  objc_initWeak(&location, self);
  if (!v8)
  {
    v13 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v13)
    {
      -[SMBDirEnumerator nextEntry:outParameters:callBack:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
      if (!v9)
        goto LABEL_11;
    }
    else if (!v9)
    {
      goto LABEL_11;
    }
    v21 = 22;
LABEL_10:
    v9[2](v9, v21);
    goto LABEL_11;
  }
  -[SMBPiston sock](self->pd, "sock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v22 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v22)
    {
      -[SMBDirEnumerator nextEntry:outParameters:callBack:].cold.2(v22, v23, v24, v25, v26, v27, v28, v29);
      if (!v9)
        goto LABEL_11;
    }
    else if (!v9)
    {
      goto LABEL_11;
    }
    v21 = 57;
    goto LABEL_10;
  }
  -[SMBPiston sock](self->pd, "sock");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "signing_queue");
  v12 = objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __53__SMBDirEnumerator_nextEntry_outParameters_callBack___block_invoke;
  v30[3] = &unk_24FE01438;
  v30[4] = self;
  objc_copyWeak(v33, &location);
  v31 = v8;
  v33[1] = a4;
  v32 = v9;
  dispatch_async(v12, v30);

  objc_destroyWeak(v33);
LABEL_11:
  objc_destroyWeak(&location);

}

uint64_t __53__SMBDirEnumerator_nextEntry_outParameters_callBack___block_invoke(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  _OWORD *v4;
  id WeakRetained;
  uint64_t v6;
  _OWORD *v7;
  id v8;
  uint64_t v9;
  size_t v10;
  UInt8 *v11;
  UInt8 *v12;
  void *v13;
  void *v14;
  void *v15;
  _OWORD *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BOOL8 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t result;
  unint64_t v33;
  unsigned int v34;
  __int128 v35;
  _OWORD v36[15];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v34 = 0;
  v33 = 0;
  v2 = (id *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 32);
  while (1)
  {
    v35 = *(_OWORD *)(v3 + 1216);
    v4 = (_OWORD *)(v3 + 1112);
    *v4 = 0u;
    v4[1] = 0u;
    v4[2] = 0u;
    v4[3] = 0u;
    v4[4] = 0u;
    v4[5] = 0u;
    v4[6] = 0u;
    v4[7] = 0u;
    v4[8] = 0u;
    v4[9] = 0u;
    v4[10] = 0u;
    v4[11] = 0u;
    v4[12] = 0u;
    v4[13] = 0u;
    v4[14] = 0u;
    *(_OWORD *)(*(_QWORD *)(a1 + 32) + 1216) = v35;
    WeakRetained = objc_loadWeakRetained(v2);
    v6 = objc_msgSend(WeakRetained, "smb2fs_smb_findnext:", &v34, v33);

    if ((_DWORD)v6 == 35)
    {
      v7 = *(_OWORD **)(a1 + 32);
      v35 = v7[76];
      v7 = (_OWORD *)((char *)v7 + 1112);
      *v7 = 0u;
      v7[1] = 0u;
      v7[2] = 0u;
      v7[3] = 0u;
      v7[4] = 0u;
      v7[5] = 0u;
      v7[6] = 0u;
      v7[7] = 0u;
      v7[8] = 0u;
      v7[9] = 0u;
      v7[10] = 0u;
      v7[11] = 0u;
      v7[12] = 0u;
      v7[13] = 0u;
      v7[14] = 0u;
      *(_OWORD *)(*(_QWORD *)(a1 + 32) + 1216) = v35;
      v8 = objc_loadWeakRetained(v2);
      v6 = objc_msgSend(v8, "smb2fs_smb_findnext:", &v34);

    }
    if ((_DWORD)v6)
      break;
    v3 = *(_QWORD *)(a1 + 32);
    v9 = *(unsigned int *)(v3 + 1104);
    if ((_DWORD)v9 == 4)
    {
      if (*(_DWORD *)(v3 + 84) != 3014702)
        goto LABEL_10;
    }
    else if ((_DWORD)v9 != 2 || *(_WORD *)(v3 + 84) != 46)
    {
LABEL_10:
      v33 = *(unsigned int *)(v3 + 1104);
      if ((unint64_t)(9 * v9) >= 0x1FFFF)
        v10 = 0x1FFFFLL;
      else
        v10 = 9 * v9;
      v11 = (UInt8 *)malloc_type_malloc(v10, 0xA51215ECuLL);
      if (v11)
      {
        v12 = v11;
        bzero(v11, v10);
        v6 = smbfs_ntwrkname_tolocal_buffer((const UInt8 *)(*(_QWORD *)(a1 + 32) + 84), &v33, v12, v10, 1);
        if (!(_DWORD)v6)
        {
          objc_msgSend(*(id *)(a1 + 40), "setNtstatus:", v34, v33);
          if (strnlen((const char *)v12, v10))
          {
            v13 = *(void **)(a1 + 40);
            v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCString:encoding:", v12, 4);
            objc_msgSend(v13, "setName:", v14);

          }
          v15 = *(void **)(a1 + 40);
          v16 = (_OWORD *)(*(_QWORD *)(a1 + 32) + 1112);
          v17 = *(_OWORD *)(*(_QWORD *)(a1 + 32) + 1320);
          v36[12] = *(_OWORD *)(*(_QWORD *)(a1 + 32) + 1304);
          v36[13] = v17;
          v36[14] = v16[14];
          v18 = v16[9];
          v36[8] = v16[8];
          v36[9] = v18;
          v19 = v16[11];
          v36[10] = v16[10];
          v36[11] = v19;
          v20 = v16[5];
          v36[4] = v16[4];
          v36[5] = v20;
          v21 = v16[7];
          v36[6] = v16[6];
          v36[7] = v21;
          v22 = v16[1];
          v36[0] = *v16;
          v36[1] = v22;
          v23 = v16[3];
          v36[2] = v16[2];
          v36[3] = v23;
          objc_msgSend(v15, "setAttributes:", v36);
        }
        free(v12);
      }
      else
      {
        v24 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v24)
          __53__SMBDirEnumerator_nextEntry_outParameters_callBack___block_invoke_cold_1(v24, v25, v26, v27, v28, v29, v30, v31);
        v6 = 12;
      }
      break;
    }
  }
  **(_DWORD **)(a1 + 64) = v34;
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v6);
  return result;
}

- (int)smb2fs_smb_findnext:(unsigned int *)a3
{
  smb_session *v5;
  SMB_rq *v6;
  char v7;
  SMB_rq **p_f_create_rqp;
  uint64_t v9;
  uint64_t v10;
  id v11;
  int fid;
  SMB_rq *f_create_rqp;
  SMB_rq *v14;
  SMB_rq *f_query_dir_rqp;
  SMB_rq *v16;
  unsigned int f_flags;
  int v18;
  char v19;
  unsigned int sv_maxtransact;
  id v21;
  int v22;
  SMBNode *v23;
  SMBNode *f_node;
  SMBNode *v25;
  unint64_t option_flags;
  SMB_rq *v27;
  SMB_rq *v28;
  SMB_rq *v29;
  SMB_rq *v30;
  int v32;
  _BOOL8 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int v41;
  id location;
  timeval v43;
  uint8_t buf[4];
  _DWORD v45[7];

  *(_QWORD *)&v45[5] = *MEMORY[0x24BDAC8D0];
  v5 = -[SMBPiston getSessionPtr](self->pd, "getSessionPtr");
  objc_initWeak(&location, self);
  v41 = 0;
  *a3 = 0;
  if (!self->f_output_buf_len)
  {
    if ((self->f_flags & 2) != 0)
    {
      fid = 2;
      goto LABEL_39;
    }
    v43.tv_sec = 0;
    *(_QWORD *)&v43.tv_usec = 0;
    gettimeofday(&v43, 0);
    f_create_rqp = self->f_create_rqp;
    if (f_create_rqp)
    {
      -[SMB_rq smb_rq_done](f_create_rqp, "smb_rq_done");
      v14 = self->f_create_rqp;
      self->f_create_rqp = 0;

    }
    f_query_dir_rqp = self->f_query_dir_rqp;
    if (f_query_dir_rqp)
    {
      -[SMB_rq smb_rq_done](f_query_dir_rqp, "smb_rq_done");
      v16 = self->f_query_dir_rqp;
      self->f_query_dir_rqp = 0;

    }
    f_flags = self->f_flags;
    self->f_flags = f_flags & 0xFFFFEFFF;
    v18 = f_flags & 1 | (2 * ((f_flags >> 2) & 1));
    v19 = 1;
    while (1)
    {
      self->f_query_inp.fileInfoClass = self->f_infolevel;
      self->f_query_inp.flags = v18;
      self->f_query_inp.fileIndex = 0;
      if ((v5->option_flags & 4) != 0)
      {
        sv_maxtransact = 0x10000;
      }
      else
      {
        sv_maxtransact = v5->sv_maxtransact;
        if (sv_maxtransact >= 0x100000)
          sv_maxtransact = 0x100000;
      }
      self->f_query_buffer_len = sv_maxtransact;
      self->f_query_inp.fileNameFlags = self->f_sfm_conversion;
      if (self->f_need_close)
      {
        self->f_output_buf_len = 0;
        v21 = objc_loadWeakRetained(&location);
        v22 = objc_msgSend(v21, "smb2_smb_query_dir:", &v41);
      }
      else
      {
        v23 = -[SMBNode init:]([SMBNode alloc], "init:", self->pd);
        f_node = self->f_node;
        self->f_node = v23;

        v25 = self->f_node;
        if (!v25)
        {
          v33 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v33)
            -[SMBDirEnumerator smb2fs_smb_findnext:].cold.1(v33, v34, v35, v36, v37, v38, v39, v40);
          fid = 12;
          goto LABEL_39;
        }
        fid = -[SMBNode commonInit:onShareID:](v25, "commonInit:onShareID:", self->pd, self->f_shareID);
        if (fid)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[SMBDirEnumerator smb2fs_smb_findnext:].cold.5();
          goto LABEL_39;
        }
        fid = smb2_smb_create_fid(self->f_node, self->f_createName, 0, 1048705, 2, 7, 1, 0, 0, 0, 0);
        if (fid)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[SMBDirEnumerator smb2fs_smb_findnext:].cold.4();
          goto LABEL_39;
        }
        self->f_need_close = 1;
        v21 = objc_loadWeakRetained(&location);
        v22 = objc_msgSend(v21, "smb2_smb_query_dir:", &v41);
      }
      fid = v22;

      *a3 = v41;
      if (fid != 22)
        break;
      if (self->f_query_inp.ntStatus != -1073741811)
        goto LABEL_37;
      option_flags = v5->option_flags;
      if ((option_flags >> 2) & 1 | ((v19 & 1) == 0))
        goto LABEL_37;
      if (piston_log_level)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[SMBDirEnumerator smb2fs_smb_findnext:].cold.3(buf, v45);
        option_flags = v5->option_flags;
      }
      v5->option_flags = option_flags | 4;
      v27 = self->f_create_rqp;
      if (v27)
      {
        -[SMB_rq smb_rq_done](v27, "smb_rq_done");
        v28 = self->f_create_rqp;
        self->f_create_rqp = 0;

      }
      v19 = 0;
      v29 = self->f_query_dir_rqp;
      if (v29)
      {
        -[SMB_rq smb_rq_done](v29, "smb_rq_done");
        v30 = self->f_query_dir_rqp;
        self->f_query_dir_rqp = 0;

        v19 = 0;
      }
    }
    if (fid)
    {
      if (fid == 2)
        self->f_flags |= 2u;
      goto LABEL_39;
    }
    v32 = self->f_flags;
    if ((v32 & 1) != 0)
      self->f_flags = v32 & 0xFFFFFFFE;
    self->f_eofs = 0;
    self->f_attr.fa_reqtime.tv_sec = v43.tv_sec;
    self->f_attr.fa_reqtime.tv_nsec = 1000 * v43.tv_usec;
  }
  self->f_NetworkNameLen = 0;
  v6 = self->f_query_dir_rqp;
  if (self->f_create_rqp)
  {
    v7 = -[SMB_rq sr_extflags](v6, "sr_extflags");
    p_f_create_rqp = &self->f_create_rqp;
    if ((v7 & 2) != 0)
      p_f_create_rqp = &self->f_query_dir_rqp;
    v6 = *p_f_create_rqp;
  }
  v9 = -[SMB_rq smb_rq_getreply](v6, "smb_rq_getreply");
  if (self->f_infolevel - 37 > 1)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[SMBDirEnumerator smb2fs_smb_findnext:].cold.2();
LABEL_37:
    fid = 22;
  }
  else
  {
    v10 = v9;
    v11 = objc_loadWeakRetained(&location);
    fid = objc_msgSend(v11, "smb2_smb_parse_query_dir_both_dir_info:", v10);

  }
LABEL_39:
  objc_destroyWeak(&location);
  return fid;
}

- (int)smb2_smb_parse_query_dir_both_dir_info:(mdchain *)a3
{
  smb_session *v5;
  int uint32le;
  int v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int uint64le;
  _BOOL8 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  _BOOL8 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  _BOOL8 v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  _BOOL8 v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  _BOOL8 v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  _BOOL8 v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  int v80;
  _BOOL8 v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char v89;
  int v90;
  int *p_f_NetworkNameLen;
  int v92;
  _BOOL8 v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  int v101;
  _BOOL8 v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  int v111;
  int v112;
  _BOOL8 v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  int uint16;
  _BOOL8 v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  int v130;
  unsigned int v131;
  int v132;
  unsigned __int8 *f_NetworkNameBuffer;
  int mem;
  _BOOL8 v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  unint64_t session_server_caps;
  unsigned __int16 fa_fstatus;
  unint64_t fa_valid_mask;
  unint64_t v146;
  unsigned int v147;
  int v148;
  _BOOL8 v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  int v157;
  _BOOL8 v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  int v166;
  _BOOL8 v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  unsigned int v175;
  uint64_t v176;
  int v177;
  _BOOL8 v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  int v186;
  _BOOL8 v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  int v195;
  _BOOL8 v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  _BOOL8 v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  int v212;
  unsigned int v213;
  int uint16le;
  _BOOL8 v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  int v223;
  _BOOL8 v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  int v232;
  _BOOL8 v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  int v241;
  _BOOL8 v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  int v250;
  _BOOL8 v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  int v259;
  _BOOL8 v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  __int128 v268;
  __int128 v269;
  int v270;
  _BOOL8 v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  int v279;
  _BOOL8 v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  __int16 v288;
  unsigned __int16 v289;
  __int128 v290;
  __int128 v291;
  uint64_t v292;
  __int128 v293;
  __int128 v294;
  uint64_t v295;
  unint64_t v296;
  unsigned int v297;
  uint64_t v298;

  v298 = 0;
  v297 = 0;
  v295 = 0;
  v296 = 0;
  v293 = 0u;
  v294 = 0u;
  v292 = 0;
  v290 = 0u;
  v291 = 0u;
  v289 = 0;
  v5 = -[SMBPiston getSessionPtr](self->pd, "getSessionPtr");
  v288 = 0;
  uint32le = md_get_uint32le(a3, (_DWORD *)&v298 + 1);
  if (uint32le)
  {
    v7 = uint32le;
    v8 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v8)
      -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:].cold.29(v8, v9, v10, v11, v12, v13, v14, v15);
    return v7;
  }
  v16 = HIDWORD(v298);
  v17 = md_get_uint32le(a3, &v297);
  if (v17)
  {
    v7 = v17;
    v18 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v18)
      -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:].cold.28(v18, v19, v20, v21, v22, v23, v24, v25);
    return v7;
  }
  uint64le = md_get_uint64le(a3, &v296);
  if (uint64le)
  {
    v7 = uint64le;
    v27 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v27)
      -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:].cold.27(v27, v28, v29, v30, v31, v32, v33, v34);
    return v7;
  }
  if (v296)
    smb_time_NT2local(v296, &self->f_attr.fa_crtime.tv_sec);
  v35 = md_get_uint64le(a3, &v296);
  if (v35)
  {
    v7 = v35;
    v36 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v36)
      -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:].cold.26(v36, v37, v38, v39, v40, v41, v42, v43);
    return v7;
  }
  if (v296)
    smb_time_NT2local(v296, &self->f_attr.fa_atime.tv_sec);
  v44 = md_get_uint64le(a3, &v296);
  if (v44)
  {
    v7 = v44;
    v45 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v45)
      -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:].cold.25(v45, v46, v47, v48, v49, v50, v51, v52);
    return v7;
  }
  if (v296)
    smb_time_NT2local(v296, &self->f_attr.fa_mtime.tv_sec);
  v53 = md_get_uint64le(a3, &v296);
  if (v53)
  {
    v7 = v53;
    v54 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v54)
      -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:].cold.24(v54, v55, v56, v57, v58, v59, v60, v61);
    return v7;
  }
  if (v296)
    smb_time_NT2local(v296, &self->f_attr.fa_chtime.tv_sec);
  v62 = md_get_uint64le(a3, &v296);
  if (v62)
  {
    v7 = v62;
    v63 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v63)
      -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:].cold.23(v63, v64, v65, v66, v67, v68, v69, v70);
    return v7;
  }
  self->f_attr.fa_size = v296;
  v71 = md_get_uint64le(a3, &v296);
  if (v71)
  {
    v7 = v71;
    v72 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v72)
      -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:].cold.22(v72, v73, v74, v75, v76, v77, v78, v79);
    return v7;
  }
  self->f_attr.fa_data_alloc = v296;
  v80 = md_get_uint32le(a3, &v298);
  if (v80)
  {
    v7 = v80;
    v81 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v81)
      -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:].cold.21(v81, v82, v83, v84, v85, v86, v87, v88);
    return v7;
  }
  v89 = v298;
  self->f_attr.fa_attr = v298;
  if ((v5->session_server_caps & 4) != 0 || (v89 & 0x10) != 0)
    self->f_attr.fa_valid_mask |= 1uLL;
  if ((v89 & 0x10) != 0)
    v90 = 2;
  else
    v90 = 1;
  self->f_attr.fa_vtype = v90;
  self->f_attr.fa_uid = 4294967195;
  self->f_attr.fa_gid = 4294967195;
  p_f_NetworkNameLen = (int *)&self->f_NetworkNameLen;
  v92 = md_get_uint32le(a3, &self->f_NetworkNameLen);
  if (v92)
  {
    v7 = v92;
    v93 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v93)
      -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:].cold.20(v93, v94, v95, v96, v97, v98, v99, v100);
    return v7;
  }
  self->f_attr.fa_valid_mask |= 2uLL;
  v101 = md_get_uint32le(a3, (_DWORD *)&v295 + 1);
  if (v101)
  {
    v7 = v101;
    v102 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v102)
      -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:].cold.19(v102, v103, v104, v105, v106, v107, v108, v109);
    return v7;
  }
  if ((self->f_attr.fa_attr & 0x400) != 0)
  {
    v111 = HIDWORD(v295);
    self->f_attr.fa_reparse_tag = HIDWORD(v295);
    if (v111 == -1610612724)
    {
      self->f_attr.fa_valid_mask |= 1uLL;
      self->f_attr.fa_vtype = 5;
    }
  }
  else
  {
    self->f_attr.fa_reparse_tag = 0;
  }
  if (self->f_infolevel == 38)
  {
    v112 = md_get_uint32le(a3, 0);
    if (v112)
    {
      v7 = v112;
      v113 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v113)
        -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:].cold.4(v113, v114, v115, v116, v117, v118, v119, v120);
      return v7;
    }
    v130 = 80;
LABEL_61:
    v7 = md_get_uint64le(a3, &self->f_attr.fa_ino);
    if (v7)
      return v7;
    v131 = *p_f_NetworkNameLen;
    if (HIDWORD(v298))
      v132 = HIDWORD(v298);
    else
      v132 = *p_f_NetworkNameLen + v130;
    if (v131 >= 0x3FD)
    {
      v131 = 1020;
      *p_f_NetworkNameLen = 1020;
    }
    f_NetworkNameBuffer = self->f_NetworkNameBuffer;
    mem = md_get_mem(a3, (char *)self->f_NetworkNameBuffer, v131, 0);
    if (mem)
    {
      v7 = mem;
      v135 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v135)
        -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:].cold.3(v135, v136, v137, v138, v139, v140, v141, v142);
      return v7;
    }
    smb2fs_smb_file_id_check((uint64_t)v5, self->f_attr.fa_ino, self->f_NetworkNameBuffer, *p_f_NetworkNameLen);
    v175 = *p_f_NetworkNameLen;
    if (HIDWORD(v298))
    {
      v176 = HIDWORD(v298) - v130 - v175;
      if ((int)v176 < 1)
      {
        if ((v176 & 0x80000000) != 0)
        {
          v204 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v204)
            -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:].cold.2(v204, v205, v206, v207, v208, v209, v210, v211);
          return 72;
        }
      }
      else
      {
        v177 = md_get_mem(a3, 0, v176, 0);
        if (v177)
        {
          v7 = v177;
          v178 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v178)
            -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:].cold.1(v178, v179, v180, v181, v182, v183, v184, v185);
          return v7;
        }
        v175 = *p_f_NetworkNameLen;
      }
    }
    v212 = v175 - 2;
    if (v175 >= 2)
    {
      if (f_NetworkNameBuffer[v175 - 1] || f_NetworkNameBuffer[v212])
        goto LABEL_109;
      *p_f_NetworkNameLen = v212;
      v175 -= 2;
    }
    if (v175)
    {
LABEL_109:
      v7 = 0;
      self->f_resume_file_index = v297;
      self->f_eofs += v132;
      v213 = self->f_output_buf_len - v132;
      if (!v16)
        v213 = 0;
      self->f_output_buf_len = v213;
      return v7;
    }
    return 72;
  }
  uint16 = md_get_uint16(a3, (char *)&v288);
  if (uint16)
  {
    v7 = uint16;
    v122 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v122)
      -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:].cold.18(v122, v123, v124, v125, v126, v127, v128, v129);
    return v7;
  }
  if ((v5->option_flags & 0x40) != 0
    && (session_server_caps = v5->session_server_caps, (session_server_caps & 0x11) != 0))
  {
    fa_fstatus = self->f_attr.fa_fstatus;
    self->f_attr.fa_fstatus = fa_fstatus & 0xFFFD;
    fa_valid_mask = self->f_attr.fa_valid_mask;
    v146 = fa_valid_mask & 0xFFFFFFFFFFFFFFFBLL;
    if ((session_server_caps & 0x10) != 0 && (v288 & 1) != 0)
    {
      self->f_attr.fa_fstatus = fa_fstatus | 2;
      v146 = fa_valid_mask | 4;
    }
    if ((self->f_attr.fa_attr & 0x400) != 0)
      v147 = 2032127;
    else
      v147 = HIDWORD(v295);
    self->f_attr.fa_max_access = v147;
    self->f_attr.fa_valid_mask = v146 | 0x40;
    v148 = md_get_uint64le(a3, &self->f_attr.fa_rsrc_size);
    if (v148)
    {
      v7 = v148;
      v149 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v149)
        -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:].cold.17(v149, v150, v151, v152, v153, v154, v155, v156);
      return v7;
    }
    self->f_attr.fa_rsrc_alloc = smb2_smb_get_alloc_size(self->f_node, self->f_attr.fa_rsrc_size);
    self->f_attr.fa_valid_mask |= 0x10uLL;
    if (self->f_attr.fa_vtype == 2)
    {
      v292 = 0;
      v290 = 0u;
      v291 = 0u;
      v186 = md_get_uint64le(a3, &v290);
      if (v186)
      {
        v7 = v186;
        v187 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v187)
          -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:].cold.11(v187, v188, v189, v190, v191, v192, v193, v194);
        return v7;
      }
      uint16le = md_get_uint16le(a3, (_WORD *)&v290 + 4);
      if (uint16le)
      {
        v7 = uint16le;
        v215 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v215)
          -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:].cold.10(v215, v216, v217, v218, v219, v220, v221, v222);
        return v7;
      }
      v232 = md_get_uint16le(a3, (_WORD *)&v291 + 6);
      if (v232)
      {
        v7 = v232;
        v233 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v233)
          -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:].cold.9(v233, v234, v235, v236, v237, v238, v239, v240);
        return v7;
      }
      v250 = md_get_uint32le(a3, (_DWORD *)&v291 + 2);
      if (v250)
      {
        v7 = v250;
        v251 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v251)
          -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:].cold.8(v251, v252, v253, v254, v255, v256, v257, v258);
        return v7;
      }
      v268 = v290;
      v269 = v291;
    }
    else
    {
      LODWORD(v295) = 0;
      v293 = 0u;
      v294 = 0u;
      v195 = md_get_uint32le(a3, &v293);
      if (v195)
      {
        v7 = v195;
        v196 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v196)
          -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:].cold.16(v196, v197, v198, v199, v200, v201, v202, v203);
        return v7;
      }
      v223 = md_get_uint32le(a3, (_DWORD *)&v293 + 1);
      if (v223)
      {
        v7 = v223;
        v224 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v224)
          -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:].cold.15(v224, v225, v226, v227, v228, v229, v230, v231);
        return v7;
      }
      v241 = md_get_uint16le(a3, (_WORD *)&v293 + 4);
      if (v241)
      {
        v7 = v241;
        v242 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v242)
          -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:].cold.14(v242, v243, v244, v245, v246, v247, v248, v249);
        return v7;
      }
      v259 = md_get_uint16le(a3, (_WORD *)&v294 + 6);
      if (v259)
      {
        v7 = v259;
        v260 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v260)
          -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:].cold.13(v260, v261, v262, v263, v264, v265, v266, v267);
        return v7;
      }
      v270 = md_get_uint32le(a3, (_DWORD *)&v294 + 2);
      if (v270)
      {
        v7 = v270;
        v271 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v271)
          -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:].cold.12(v271, v272, v273, v274, v275, v276, v277, v278);
        return v7;
      }
      v268 = v293;
      v269 = v294;
    }
    *(_OWORD *)self->f_attr.fa_finder_info = v268;
    *(_OWORD *)&self->f_attr.fa_finder_info[16] = v269;
    self->f_attr.fa_valid_mask |= 0x20uLL;
    v279 = md_get_uint16le(a3, &v289);
    if (!v279)
    {
      v130 = 104;
      if ((v5->session_server_caps & 4) != 0 && v289)
      {
        self->f_attr.fa_permissions = v289;
        self->f_attr.fa_valid_mask |= 8uLL;
      }
      goto LABEL_61;
    }
    v7 = v279;
    v280 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v280)
      -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:].cold.7(v280, v281, v282, v283, v284, v285, v286, v287);
  }
  else
  {
    v157 = md_get_mem(a3, 0, 24, 0);
    if (v157)
    {
      v7 = v157;
      v158 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v158)
        -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:].cold.6(v158, v159, v160, v161, v162, v163, v164, v165);
    }
    else
    {
      v166 = md_get_uint16le(a3, 0);
      if (!v166)
      {
        v130 = 104;
        goto LABEL_61;
      }
      v7 = v166;
      v167 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v167)
        -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:].cold.4(v167, v168, v169, v170, v171, v172, v173, v174);
    }
  }
  return v7;
}

- (int)smb2_smb_query_dir:(unsigned int *)a3
{
  uint64_t v5;
  uint64_t v6;
  SMBPiston *pd;
  int dir;
  id v9;
  id v10;
  mbchain *v12;
  uint64_t v13;
  _WORD *v14;
  char *cstring_len;
  int v16;
  _BOOL8 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  mdchain *v25;
  uint64_t v26;
  id v27;
  unsigned int f_query_buffer_len;
  unsigned int v29;

  f_query_buffer_len = self->f_query_buffer_len;
  v29 = 0;
  *a3 = 0;
  v5 = -[SMBNode treeID](self->f_node, "treeID");
  v6 = -[SMBNode onEncryptedShare](self->f_node, "onEncryptedShare");
  pd = self->pd;
  v27 = 0;
  dir = smb2_rq_alloc(14, v5, v6, &f_query_buffer_len, pd, &v27);
  v9 = v27;
  v10 = v27;
  if (dir)
    goto LABEL_2;
  objc_storeStrong((id *)&self->f_query_dir_rqp, v9);
  v12 = -[SMB_rq smb_rq_getrequest](self->f_query_dir_rqp, "smb_rq_getrequest");
  mb_put_uint16le((uint64_t)v12, 33);
  mb_put_uint8((uint64_t)v12, self->f_query_inp.fileInfoClass);
  mb_put_uint8((uint64_t)v12, self->f_query_inp.flags);
  mb_put_uint32le((uint64_t)v12, self->f_query_inp.fileIndex);
  mb_put_uint64le((uint64_t)v12, -[SMBNode fid](self->f_node, "fid"));
  -[SMBNode fid](self->f_node, "fid");
  mb_put_uint64le((uint64_t)v12, v13);
  mb_put_uint16le((uint64_t)v12, 96);
  v14 = (_WORD *)mb_reserve((uint64_t)v12, 2uLL);
  mb_put_uint32le((uint64_t)v12, f_query_buffer_len);
  if (!self->f_lookupName)
  {
    *v14 = 0;
    mb_put_uint16le((uint64_t)v12, 0);
LABEL_13:
    dir = smb_rq_simple(self->pd, self->f_query_dir_rqp);
    *a3 = -[SMB_rq sr_ntstatus](self->f_query_dir_rqp, "sr_ntstatus");
    if (dir)
    {
      if (dir != 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[SMBDirEnumerator smb2_smb_query_dir:].cold.1((id *)&self->f_query_dir_rqp);
    }
    else
    {
      v25 = -[SMB_rq smb_rq_getreply](self->f_query_dir_rqp, "smb_rq_getreply");
      dir = smb2_smb_parse_query_dir(v25, v26, 0, &self->f_output_buf_len);
    }
    goto LABEL_2;
  }
  smb2_rq_bstart(self->f_query_dir_rqp, (uint64_t)v14);
  cstring_len = (char *)smb_get_cstring_len(self->f_lookupName, &v29);
  if (cstring_len)
  {
    v16 = smb2fs_fullpath((uint64_t)v12, cstring_len, v29, 0, 0, self->f_query_inp.fileNameFlags);
    if (v16)
    {
      dir = v16;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[SMBDirEnumerator smb2_smb_query_dir:].cold.3();
      goto LABEL_2;
    }
    smb_rq_bend(self->f_query_dir_rqp);
    goto LABEL_13;
  }
  v17 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (v17)
    -[SMBDirEnumerator smb2_smb_query_dir:].cold.2(v17, v18, v19, v20, v21, v22, v23, v24);
  dir = 22;
LABEL_2:

  return dir;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->f_query_dir_rqp, 0);
  objc_storeStrong((id *)&self->f_create_rqp, 0);
  objc_storeStrong((id *)&self->f_node, 0);
  objc_storeStrong((id *)&self->f_createName, 0);
  objc_storeStrong((id *)&self->f_lookupName, 0);
  objc_storeStrong((id *)&self->pd, 0);
}

- (void)cleanup
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_smb_close_fid failed %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)close:(uint64_t)a3 callBack:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: sock is NULL. \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)init:(uint64_t)a3 onShareID:(uint64_t)a4 dirName:(uint64_t)a5 lookUpName:(uint64_t)a6 searchFlags:(uint64_t)a7 outParameters:(uint64_t)a8 callBack:.cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: sock is NULL. \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)enumeratorWithParameters:(uint64_t)a3 onShareID:(uint64_t)a4 dirName:(uint64_t)a5 lookUpName:(uint64_t)a6 searchFlags:(uint64_t)a7 outParameters:(uint64_t)a8 callBack:.cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: sock is NULL. \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)nextEntry:(uint64_t)a3 outParameters:(uint64_t)a4 callBack:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: entry is NULL. \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)nextEntry:(uint64_t)a3 outParameters:(uint64_t)a4 callBack:(uint64_t)a5 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: sock is NULL. \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __53__SMBDirEnumerator_nextEntry_outParameters_callBack___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: malloc failed \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)smb2fs_smb_findnext:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: SMBNode failed\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)smb2fs_smb_findnext:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: unexpected info level %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)smb2fs_smb_findnext:(uint8_t *)buf .cold.3(uint8_t *buf, _QWORD *a2)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "-[SMBDirEnumerator smb2fs_smb_findnext:]";
  _os_log_error_impl(&dword_23028F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: SMB 2/3 server cant handle large OutputBufferLength in Query_Dir. Reducing to 64Kb.\n", buf, 0xCu);
}

- (void)smb2fs_smb_findnext:.cold.4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Create failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)smb2fs_smb_findnext:.cold.5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: commonInit failed %d \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: failed getting add pad\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: out of sync\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: failed getting file name\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: failed getting resv\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: failed getting short name\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: failed getting unix_mode\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: failed getting folder finfo date added\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: failed getting folder finfo ext flags\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: failed getting folder finfo flags\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.11(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: failed getting folder finfo reserved1\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.12(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: failed getting file finfo date added\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.13(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: failed getting file finfo ext flags\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: failed getting file finfo flags\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.15(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: failed getting file finfo creator\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.16(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: failed getting file finfo type\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.17(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: failed getting rsrc fork len\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: failed getting flags \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.19(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: failed getting ea_size\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: failed getting file name len\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.21(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: failed getting file attr\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.22(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: failed getting alloc size\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.23(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: failed getting eof\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: failed getting ctime\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.25(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: failed getting wrtime\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.26(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: failed getting atime\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.27(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: failed getting crtime\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: failed getting index\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.29(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: failed getting next\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)smb2_smb_query_dir:(id *)a1 .cold.1(id *a1)
{
  uint64_t v1;
  int v2[6];

  OUTLINED_FUNCTION_7(a1);
  v2[0] = 136315650;
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_1(&dword_23028F000, MEMORY[0x24BDACB70], v1, "%s: Reply failed <%d> ntStatus <0x%x> \n", (uint8_t *)v2);
  OUTLINED_FUNCTION_4_0();
}

- (void)smb2_smb_query_dir:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: c_lookup_namep is NULL\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)smb2_smb_query_dir:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: error 0x%x from smb_put_dmem for name\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

@end
