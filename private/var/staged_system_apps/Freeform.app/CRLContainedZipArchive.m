@implementation CRLContainedZipArchive

+ (id)zipArchiveFromEntry:(id)a3 zipArchive:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  dispatch_semaphore_t v13;
  dispatch_queue_global_t global_queue;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v21[4];
  NSObject *v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v10 = a3;
  v11 = a4;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_1003EDD38;
  v35 = sub_1003EDD48;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_1003EDD38;
  v29 = sub_1003EDD48;
  v30 = 0;
  v12 = objc_msgSend(objc_alloc((Class)a1), "initWithEntry:zipArchive:options:", v10, v11, a5);
  if (v12)
  {
    v13 = dispatch_semaphore_create(0);
    global_queue = dispatch_get_global_queue(0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1003EDD50;
    v21[3] = &unk_10125A6C0;
    v23 = &v31;
    v24 = &v25;
    v16 = v13;
    v22 = v16;
    objc_msgSend(v12, "readArchiveWithQueue:completion:", v15, v21);
    dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);

  }
  if (a6 && !v32[5])
  {
    v17 = (void *)v26[5];
    if (v17)
    {
      *a6 = objc_retainAutorelease(v17);
    }
    else
    {
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSError crl_fileReadUnknownErrorWithUserInfo:](NSError, "crl_fileReadUnknownErrorWithUserInfo:", 0)));
      *a6 = v18;

    }
  }
  v19 = (id)v32[5];

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v19;
}

- (CRLContainedZipArchive)initWithEntry:(id)a3 zipArchive:(id)a4 options:(unint64_t)a5
{
  id v9;
  id v10;
  void *v11;
  CRLContainedZipArchive *v12;
  CRLContainedZipArchive *v13;
  id *p_isa;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  v12 = 0;
  if (v9 && v10)
  {
    v16.receiver = self;
    v16.super_class = (Class)CRLContainedZipArchive;
    v13 = -[CRLZipArchive initWithOptions:](&v16, "initWithOptions:", a5);
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
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLContainedZipArchive;
  v4 = -[CRLZipArchive readChannelForEntry:validateCRC:](&v6, "readChannelForEntry:validateCRC:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (id)streamReadChannelForEntry:(id)a3 validateCRC:(BOOL)a4
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLContainedZipArchive;
  v4 = -[CRLZipArchive streamReadChannelForEntry:validateCRC:](&v6, "streamReadChannelForEntry:validateCRC:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (unint64_t)archiveLength
{
  return -[CRLZipEntry size](self->_entry, "size");
}

- (id)newArchiveReadChannel
{
  return (id)objc_claimAutoreleasedReturnValue(-[CRLZipArchive readChannelForEntry:validateCRC:](self->_zipArchive, "readChannelForEntry:validateCRC:", self->_entry, 1));
}

- (BOOL)isValid
{
  return -[CRLZipArchive isValid](self->_zipArchive, "isValid");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entry, 0);
  objc_storeStrong((id *)&self->_zipArchive, 0);
}

@end
