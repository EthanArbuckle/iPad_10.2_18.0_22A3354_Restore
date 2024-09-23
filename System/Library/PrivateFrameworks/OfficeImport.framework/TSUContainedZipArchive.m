@implementation TSUContainedZipArchive

+ (id)zipArchiveFromEntry:(id)a3 zipArchive:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  dispatch_semaphore_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v20[4];
  NSObject *v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v10 = a3;
  v11 = a4;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__9;
  v34 = __Block_byref_object_dispose__9;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__9;
  v28 = __Block_byref_object_dispose__9;
  v29 = 0;
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEntry:zipArchive:options:", v10, v11, a5);
  if (v12)
  {
    v13 = dispatch_semaphore_create(0);
    dispatch_get_global_queue(0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __71__TSUContainedZipArchive_zipArchiveFromEntry_zipArchive_options_error___block_invoke;
    v20[3] = &unk_24F39B880;
    v22 = &v30;
    v23 = &v24;
    v15 = v13;
    v21 = v15;
    objc_msgSend(v12, "readArchiveWithQueue:completion:", v14, v20);
    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);

  }
  if (a6 && !v31[5])
  {
    v16 = (void *)v25[5];
    if (v16)
    {
      *a6 = objc_retainAutorelease(v16);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "tsu_fileReadUnknownErrorWithUserInfo:", 0);
      v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a6 = v17;

    }
  }
  v18 = (id)v31[5];

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v18;
}

void __71__TSUContainedZipArchive_zipArchiveFromEntry_zipArchive_options_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (TSUContainedZipArchive)initWithEntry:(id)a3 zipArchive:(id)a4 options:(unint64_t)a5
{
  id v9;
  id v10;
  void *v11;
  TSUContainedZipArchive *v12;
  TSUContainedZipArchive *v13;
  id *p_isa;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  v12 = 0;
  if (v9 && v10)
  {
    v16.receiver = self;
    v16.super_class = (Class)TSUContainedZipArchive;
    v13 = -[TSUZipArchive initWithOptions:](&v16, sel_initWithOptions_, a5);
    p_isa = (id *)&v13->super.super.isa;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_zipArchive, a4);
      objc_storeStrong(p_isa + 6, a3);
    }
    self = p_isa;
    v12 = self;
  }

  return v12;
}

- (id)readChannelForEntry:(id)a3 validateCRC:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSUContainedZipArchive;
  -[TSUZipArchive readChannelForEntry:validateCRC:](&v5, sel_readChannelForEntry_validateCRC_, a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)streamReadChannelForEntry:(id)a3 validateCRC:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSUContainedZipArchive;
  -[TSUZipArchive streamReadChannelForEntry:validateCRC:](&v5, sel_streamReadChannelForEntry_validateCRC_, a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)archiveLength
{
  return -[TSUZipEntry size](self->_entry, "size");
}

- (id)newArchiveReadChannel
{
  -[TSUZipArchive readChannelForEntry:validateCRC:](self->_zipArchive, "readChannelForEntry:validateCRC:", self->_entry, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isValid
{
  return -[TSUZipArchive isValid](self->_zipArchive, "isValid");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entry, 0);
  objc_storeStrong((id *)&self->_zipArchive, 0);
}

@end
