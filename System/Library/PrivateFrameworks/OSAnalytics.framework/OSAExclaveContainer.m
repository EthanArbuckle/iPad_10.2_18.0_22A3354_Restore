@implementation OSAExclaveContainer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_threadIdToScId, 0);
  objc_storeStrong((id *)&self->_threads, 0);
  objc_storeStrong((id *)&self->_layouts, 0);
  objc_storeStrong((id *)&self->_addressSpaces, 0);
}

- (NSMutableDictionary)threadIdToScId
{
  return self->_threadIdToScId;
}

- (NSMutableArray)notes
{
  return self->_notes;
}

- (OSAExclaveContainer)init
{
  OSAExclaveContainer *v2;
  uint64_t v3;
  NSMutableDictionary *addressSpaces;
  uint64_t v5;
  NSMutableDictionary *layouts;
  uint64_t v7;
  NSMutableDictionary *threads;
  uint64_t v9;
  NSMutableDictionary *threadIdToScId;
  uint64_t v11;
  NSMutableArray *notes;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)OSAExclaveContainer;
  v2 = -[OSAExclaveContainer init](&v14, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    addressSpaces = v2->_addressSpaces;
    v2->_addressSpaces = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    layouts = v2->_layouts;
    v2->_layouts = (NSMutableDictionary *)v5;

    v7 = objc_opt_new();
    threads = v2->_threads;
    v2->_threads = (NSMutableDictionary *)v7;

    v9 = objc_opt_new();
    threadIdToScId = v2->_threadIdToScId;
    v2->_threadIdToScId = (NSMutableDictionary *)v9;

    v11 = objc_opt_new();
    notes = v2->_notes;
    v2->_notes = (NSMutableArray *)v11;

    v2->_isExclaveValid = 1;
  }
  return v2;
}

- (void)appendNotesTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[OSAExclaveContainer notes](self, "notes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v5);

}

- (void)setThreadId:(id)a3 withScId:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[OSAExclaveContainer threadIdToScId](self, "threadIdToScId");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v7);

}

- (id)getFramesForThread:(id)a3 usingCatalog:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  void *v34;
  unint64_t v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v47;
  id v48;
  OSAExclaveContainer *v49;
  void *v50;
  void *v51;
  uint8_t v52[4];
  _DWORD v53[7];

  *(_QWORD *)&v53[5] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[OSAExclaveContainer isExclaveValid](self, "isExclaveValid"))
  {
    -[OSAExclaveContainer threadIdToScId](self, "threadIdToScId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[OSAExclaveContainer threads](self, "threads");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v47 = v9;
        v48 = v6;
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stackEntries");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count");

        if (v14)
        {
          v15 = 0;
          v49 = self;
          v50 = v11;
          while (1)
          {
            objc_msgSend(v11, "stackEntries");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectAtIndexedSubscript:", v15);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            -[OSAExclaveContainer addressSpaces](self, "addressSpaces");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "addressSpaceId");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectForKeyedSubscript:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v20)
              break;
            -[OSAExclaveContainer layouts](self, "layouts");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "layoutId");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectForKeyedSubscript:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v23)
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                -[OSAExclaveContainer getFramesForThread:usingCatalog:].cold.4(v52, v20, v53);

              goto LABEL_25;
            }
            v51 = v20;
            objc_msgSend(v17, "frames");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "count");

            if (v25)
            {
              v26 = 0;
              do
              {
                objc_msgSend(v17, "frames");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "objectAtIndexedSubscript:", v26);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = objc_msgSend(v28, "unsignedLongLongValue");
                objc_msgSend(v23, "segments");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "searchFrame:in:result:", v29, v30, 0);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "addObject:", v31);

                ++v26;
                objc_msgSend(v17, "frames");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = objc_msgSend(v32, "count");

              }
              while (v33 > v26);
            }

            ++v15;
            v11 = v50;
            objc_msgSend(v50, "stackEntries");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v34, "count");

            self = v49;
            if (v35 <= v15)
              goto LABEL_12;
          }
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[OSAExclaveContainer getFramesForThread:usingCatalog:].cold.3(v17);
LABEL_25:

          v36 = 0;
        }
        else
        {
LABEL_12:
          v36 = v12;
        }
        v9 = v47;
        v6 = v48;

      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[OSAExclaveContainer getFramesForThread:usingCatalog:].cold.2((uint64_t)v9, v39, v40, v41, v42, v43, v44, v45);
        v36 = 0;
      }

    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[OSAExclaveContainer getFramesForThread:usingCatalog:].cold.1(v6);
      v36 = 0;
    }

  }
  else
  {
    -[OSAExclaveContainer notes](self, "notes");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Omitted invalid exclave data for thread %llu"), objc_msgSend(v6, "unsignedLongLongValue"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addObject:", v38);

    v36 = 0;
  }

  return v36;
}

- (kcdata_iter)parseKCdata:(kcdata_iter)a3
{
  kcdata_item *end;
  kcdata_item_t item;
  void *v6;
  kcdata_item_t v7;
  kcdata_item_t v8;
  unint64_t v9;
  unint64_t v10;
  kcdata_item *v12;
  kcdata_item *v13;
  uint64_t flags;
  unint64_t v15;
  int type;
  void *v17;
  void *v18;
  void *v19;
  ExclaveThread *v20;
  void *v21;
  uint64_t v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  KCContainer *v35;
  void *v36;
  ExclaveThread *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  kcdata_item *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  kcdata_item_t v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  OSAExclaveContainer *v56;
  kcdata_item *v57;
  kcdata_iter result;

  end = (kcdata_item *)a3.end;
  item = a3.item;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = item + 1;
  v8 = item;
  v57 = item;
  if (&item[1] <= end)
  {
    v8 = item;
    do
    {
      v9 = (unint64_t)v7 + v8->size;
      if (v9 > (unint64_t)end)
        break;
      if (v8->type == -242132755)
        goto LABEL_13;
      if (v8->type == 19 && v8[1].type == 2377)
        break;
      v7 = (kcdata_item_t)(v9 + 16);
      v8 = (kcdata_item_t)v9;
    }
    while (v9 + 16 <= (unint64_t)end);
  }
  v56 = self;
  v10 = (unint64_t)&v8[1];
  if (v8->type != -242132755 && v10 <= (unint64_t)end)
  {
    LOBYTE(flags) = 0;
    v15 = 0x1E0CB3000uLL;
    do
    {
      if (v10 + v8->size > (unint64_t)end || (flags & 1) != 0)
        break;
      LOBYTE(flags) = 0;
      type = v8->type;
      if ((v8->type & 0xFFFFFFF0) == 0x20)
        type = 17;
      if (type > 2378)
      {
        switch(type)
        {
          case 2379:
            objc_msgSend(v6, "top");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v17 || (v18 = v17, objc_msgSend(v17, "type") != 2378))
              -[OSAExclaveContainer parseKCdata:].cold.4();
            objc_msgSend(v18, "data");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "objectForKeyedSubscript:", &unk_1E4DFDC78);
            v20 = (ExclaveThread *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(*(id *)(v15 + 2024), "numberWithUnsignedLongLong:", *(_QWORD *)&v8[1].type);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[ExclaveThread setSchedulingContextId:](v20, "setSchedulingContextId:", v21);
            goto LABEL_71;
          case 2381:
            objc_msgSend(v6, "top");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v24 || (v18 = v24, objc_msgSend(v24, "type") != 2380))
              -[OSAExclaveContainer parseKCdata:].cold.5();
            objc_msgSend(v18, "data");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "objectForKeyedSubscript:", &unk_1E4DFDCC0);
            v20 = (ExclaveThread *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(*(id *)(v15 + 2024), "numberWithUnsignedLongLong:", *(_QWORD *)&v8[1].type);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[ExclaveThread setAddressSpaceId:](v20, "setAddressSpaceId:", v21);
            goto LABEL_71;
          case 2384:
            objc_msgSend(v6, "top");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v26 || (v18 = v26, objc_msgSend(v26, "type") != 2383))
              -[OSAExclaveContainer parseKCdata:].cold.6();
            objc_msgSend(v18, "data");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "objectForKeyedSubscript:", &unk_1E4DFDC90);
            v20 = (ExclaveThread *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(*(id *)(v15 + 2024), "numberWithUnsignedLongLong:", *(_QWORD *)&v8[1].type);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[ExclaveThread setAddressSpaceId:](v20, "setAddressSpaceId:", v28);

            v29 = *(void **)(v15 + 2024);
            v30 = *(_QWORD *)&v8[2].type;
            goto LABEL_41;
          case 2385:
            objc_msgSend(v6, "top");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v31 || (v18 = v31, objc_msgSend(v31, "type") != 2383))
              -[OSAExclaveContainer parseKCdata:].cold.7();
            objc_msgSend(v18, "data");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "objectForKeyedSubscript:", &unk_1E4DFDC90);
            v20 = (ExclaveThread *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", &v8[1]);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[ExclaveThread setName:](v20, "setName:", v21);
            goto LABEL_71;
          case 2387:
            objc_msgSend(v6, "top");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v33 || (v18 = v33, objc_msgSend(v33, "type") != 2386))
              -[OSAExclaveContainer parseKCdata:].cold.8();
            objc_msgSend(v18, "data");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "objectForKeyedSubscript:", &unk_1E4DFDCA8);
            v20 = (ExclaveThread *)objc_claimAutoreleasedReturnValue();

            v29 = *(void **)(v15 + 2024);
            v30 = *(_QWORD *)&v8[1].type;
LABEL_41:
            objc_msgSend(v29, "numberWithUnsignedLongLong:", v30, v56);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[ExclaveThread setLayoutId:](v20, "setLayoutId:", v21);
            goto LABEL_71;
          default:
            goto LABEL_75;
        }
      }
      switch(type)
      {
        case 17:
          flags = v8->flags;
          if (objc_msgSend(v6, "count"))
          {
            objc_msgSend(v6, "top");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v18 = 0;
          }
          if (HIDWORD(flags) == 2388)
          {
            if (!v18 || objc_msgSend(v18, "type") != 2386)
              -[OSAExclaveContainer parseKCdata:].cold.3();
            objc_msgSend(v18, "data");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "objectForKeyedSubscript:", &unk_1E4DFDCA8);
            v20 = (ExclaveThread *)objc_claimAutoreleasedReturnValue();

            if ((_DWORD)flags)
            {
              v47 = v8 + 1;
              flags = flags;
              do
              {
                -[ExclaveThread segments](v20, "segments", v56);
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "addImage:address:size:", v47, *(_QWORD *)&v47[1].type, 0);

                v47 = (kcdata_item_t)((char *)v47 + 24);
                --flags;
              }
              while (flags);
            }
            -[ExclaveThread segments](v20, "segments", v56);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "sortByAddressAndSetInferredSizes");
            LOBYTE(flags) = 0;
            goto LABEL_72;
          }
          if (HIDWORD(flags) == 2382)
          {
            if (!v18 || objc_msgSend(v18, "type") != 2380)
              -[OSAExclaveContainer parseKCdata:].cold.2();
            objc_msgSend(v18, "data");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "objectForKeyedSubscript:", &unk_1E4DFDCC0);
            v20 = (ExclaveThread *)objc_claimAutoreleasedReturnValue();

            if ((_DWORD)flags)
            {
              v43 = v8 + 1;
              flags = flags;
              do
              {
                v44 = *(_QWORD *)&v43->type;
                v43 = (kcdata_item *)((char *)v43 + 8);
                objc_msgSend(*(id *)(v15 + 2024), "numberWithUnsignedLongLong:", v44, v56);
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                -[ExclaveThread addFrames:](v20, "addFrames:", v45);

                --flags;
              }
              while (flags);
            }
            goto LABEL_73;
          }
          LOBYTE(flags) = 0;
          break;
        case 19:
          v35 = -[KCContainer initWithKCData:]([KCContainer alloc], "initWithKCData:", v8, end);
          objc_msgSend(v6, "push:", v35);

          LOBYTE(flags) = 0;
          switch(v8[1].type)
          {
            case 0x94Au:
              objc_msgSend(v6, "top");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_alloc_init(ExclaveThread);
              objc_msgSend(v18, "data");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = v36;
              v37 = v20;
              v38 = &unk_1E4DFDC78;
              goto LABEL_70;
            case 0x94Cu:
              objc_msgSend(v6, "top");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_alloc_init(ExclaveStackEntry);
              objc_msgSend(v18, "data");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = v36;
              v37 = v20;
              v38 = &unk_1E4DFDCC0;
              goto LABEL_70;
            case 0x94Fu:
              objc_msgSend(v6, "top");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_alloc_init(ExclaveAddressSpace);
              objc_msgSend(v18, "data");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = v36;
              v37 = v20;
              v38 = &unk_1E4DFDC90;
              goto LABEL_70;
            case 0x952u:
              objc_msgSend(v6, "top");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_alloc_init(ExclaveLayout);
              objc_msgSend(v18, "data");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = v36;
              v37 = v20;
              v38 = &unk_1E4DFDCA8;
LABEL_70:
              objc_msgSend(v36, "setObject:forKeyedSubscript:", v37, v38, v56);
LABEL_71:
              LOBYTE(flags) = 0;
              goto LABEL_72;
            default:
              goto LABEL_75;
          }
        case 20:
          objc_msgSend(v6, "pop");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v8->flags;
          if (v22 != objc_msgSend(v18, "tag"))
            -[OSAExclaveContainer parseKCdata:].cold.1();
          v23 = objc_msgSend(v18, "type");
          LOBYTE(flags) = v23 == 2377;
          if (v23 != 2377)
          {
            if (objc_msgSend(v18, "type") == 2380)
            {
              objc_msgSend(v6, "top");
              v20 = (ExclaveThread *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "data");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "objectForKeyedSubscript:", &unk_1E4DFDCC0);
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              -[ExclaveThread data](v20, "data");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "objectForKeyedSubscript:", &unk_1E4DFDC78);
              v41 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v41, "addStackEntries:", v21);
              goto LABEL_84;
            }
            if (objc_msgSend(v18, "type") == 2378)
            {
              objc_msgSend(v18, "data");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "objectForKeyedSubscript:", &unk_1E4DFDC78);
              v20 = (ExclaveThread *)objc_claimAutoreleasedReturnValue();

              -[ExclaveThread schedulingContextId](v20, "schedulingContextId");
              v50 = (void *)objc_claimAutoreleasedReturnValue();

              if (v50)
              {
                -[OSAExclaveContainer threads](v56, "threads");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                -[ExclaveThread schedulingContextId](v20, "schedulingContextId");
                v51 = objc_claimAutoreleasedReturnValue();
LABEL_83:
                v41 = (void *)v51;
                objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, v51, v56);
LABEL_84:

LABEL_72:
                v15 = 0x1E0CB3000;
              }
            }
            else if (objc_msgSend(v18, "type") == 2383)
            {
              objc_msgSend(v18, "data");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "objectForKeyedSubscript:", &unk_1E4DFDC90);
              v20 = (ExclaveThread *)objc_claimAutoreleasedReturnValue();

              -[ExclaveThread addressSpaceId](v20, "addressSpaceId");
              v53 = (void *)objc_claimAutoreleasedReturnValue();

              if (v53)
              {
                -[OSAExclaveContainer addressSpaces](v56, "addressSpaces");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                -[ExclaveThread addressSpaceId](v20, "addressSpaceId");
                v51 = objc_claimAutoreleasedReturnValue();
                goto LABEL_83;
              }
            }
            else
            {
              if (objc_msgSend(v18, "type") != 2386)
                break;
              objc_msgSend(v18, "data");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v54, "objectForKeyedSubscript:", &unk_1E4DFDCA8);
              v20 = (ExclaveThread *)objc_claimAutoreleasedReturnValue();

              -[ExclaveThread layoutId](v20, "layoutId");
              v55 = (void *)objc_claimAutoreleasedReturnValue();

              if (v55)
              {
                -[OSAExclaveContainer layouts](v56, "layouts");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                -[ExclaveThread layoutId](v20, "layoutId");
                v51 = objc_claimAutoreleasedReturnValue();
                goto LABEL_83;
              }
            }
LABEL_73:

            break;
          }
          v57 = v8;
          break;
        default:
          goto LABEL_75;
      }

LABEL_75:
      v8 = (kcdata_item_t)(v10 + v8->size);
      v10 = (unint64_t)&v8[1];
    }
    while (&v8[1] <= end);
  }
LABEL_13:

  v12 = v57;
  v13 = end;
  result.end = v13;
  result.item = v12;
  return result;
}

- (NSMutableDictionary)addressSpaces
{
  return self->_addressSpaces;
}

- (NSMutableDictionary)layouts
{
  return self->_layouts;
}

- (NSMutableDictionary)threads
{
  return self->_threads;
}

- (void)setNotes:(id)a3
{
  objc_storeStrong((id *)&self->_notes, a3);
}

- (BOOL)isExclaveValid
{
  return self->_isExclaveValid;
}

- (void)setIsExclaveValid:(BOOL)a3
{
  self->_isExclaveValid = a3;
}

- (void)getFramesForThread:(void *)a1 usingCatalog:.cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(a1, "unsignedLongLongValue");
  OUTLINED_FUNCTION_0_1(&dword_1A4D21000, MEMORY[0x1E0C81028], v1, "Exclave data not present for thread %llu", v2, v3, v4, v5, 0);
}

- (void)getFramesForThread:(uint64_t)a3 usingCatalog:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A4D21000, MEMORY[0x1E0C81028], a3, "Exclave data not present for SCID %@", a5, a6, a7, a8, 2u);
}

- (void)getFramesForThread:(void *)a1 usingCatalog:.cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "addressSpaceId");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1(&dword_1A4D21000, MEMORY[0x1E0C81028], v2, "Address space info does exist for asid %@", v3, v4, v5, v6, 2u);

}

- (void)getFramesForThread:(_QWORD *)a3 usingCatalog:.cold.4(uint8_t *a1, void *a2, _QWORD *a3)
{
  void *v5;

  objc_msgSend(a2, "layoutId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v5;
  _os_log_error_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Layout info does not exist for layout id %@", a1, 0xCu);

}

- (void)parseKCdata:.cold.1()
{
  __assert_rtn("-[OSAExclaveContainer parseKCdata:]", "OSAExclave.m", 174, "kcdata_iter_container_id(kcData) == end.tag");
}

- (void)parseKCdata:.cold.2()
{
  __assert_rtn("-[OSAExclaveContainer parseKCdata:]", "OSAExclave.m", 216, "container && (container.type == STACKSHOT_KCCONTAINER_EXCLAVE_IPCSTACKENTRY)");
}

- (void)parseKCdata:.cold.3()
{
  __assert_rtn("-[OSAExclaveContainer parseKCdata:]", "OSAExclave.m", 230, "container && (container.type == STACKSHOT_KCCONTAINER_EXCLAVE_TEXTLAYOUT)");
}

- (void)parseKCdata:.cold.4()
{
  __assert_rtn("-[OSAExclaveContainer parseKCdata:]", "OSAExclave.m", 248, "container && (container.type == STACKSHOT_KCCONTAINER_EXCLAVE_SCRESULT)");
}

- (void)parseKCdata:.cold.5()
{
  __assert_rtn("-[OSAExclaveContainer parseKCdata:]", "OSAExclave.m", 262, "container && (container.type == STACKSHOT_KCCONTAINER_EXCLAVE_IPCSTACKENTRY)");
}

- (void)parseKCdata:.cold.6()
{
  __assert_rtn("-[OSAExclaveContainer parseKCdata:]", "OSAExclave.m", 276, "container && (container.type == STACKSHOT_KCCONTAINER_EXCLAVE_ADDRESSSPACE)");
}

- (void)parseKCdata:.cold.7()
{
  __assert_rtn("-[OSAExclaveContainer parseKCdata:]", "OSAExclave.m", 291, "container && (container.type == STACKSHOT_KCCONTAINER_EXCLAVE_ADDRESSSPACE)");
}

- (void)parseKCdata:.cold.8()
{
  __assert_rtn("-[OSAExclaveContainer parseKCdata:]", "OSAExclave.m", 305, "container && (container.type == STACKSHOT_KCCONTAINER_EXCLAVE_TEXTLAYOUT)");
}

@end
