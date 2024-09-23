@implementation CRLZipArchive

- (CRLZipArchive)init
{
  return -[CRLZipArchive initWithOptions:](self, "initWithOptions:", 0);
}

- (CRLZipArchive)initWithOptions:(unint64_t)a3
{
  CRLZipArchive *v4;
  CRLZipArchive *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *entriesMap;
  NSMutableOrderedSet *v8;
  NSMutableOrderedSet *entries;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CRLZipArchive;
  v4 = -[CRLZipArchive init](&v11, "init");
  v5 = v4;
  if (v4)
  {
    v4->_options = a3;
    v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    entriesMap = v5->_entriesMap;
    v5->_entriesMap = v6;

    v8 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
    entries = v5->_entries;
    v5->_entries = v8;

  }
  return v5;
}

- (unint64_t)entriesCount
{
  return (unint64_t)-[NSMutableOrderedSet count](self->_entries, "count");
}

- (BOOL)hasNonEmptyEntries
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10011438C;
  v4[3] = &unk_101239108;
  v4[4] = &v5;
  -[CRLZipArchive enumerateEntriesUsingBlock:](self, "enumerateEntriesUsingBlock:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)readArchiveWithQueue:(id)a3 completion:(id)a4
{
  NSObject *v6;
  id v7;
  unint64_t v8;
  id v9;
  void *v10;
  id *v11;
  id v12;
  _QWORD *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD *v18;
  unint64_t v19;
  _QWORD v20[4];
  _QWORD v21[2];
  NSObject *v22;
  id v23;

  v6 = a3;
  v7 = a4;
  v8 = -[CRLZipArchive archiveLength](self, "archiveLength");
  v9 = -[CRLZipArchive newArchiveReadChannel](self, "newArchiveReadChannel");
  v10 = v9;
  if (v9)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1001145B0;
    v20[3] = &unk_101239158;
    v11 = (id *)v21;
    v12 = v9;
    v21[0] = v12;
    v21[1] = self;
    v22 = v6;
    v23 = v7;
    v13 = objc_retainBlock(v20);
    if ((self->_options & 8) != 0)
    {
      -[CRLZipArchive readLocalFileHeaderEntriesFromChannel:offset:previousEntry:seekAttempts:seekForward:completion:](self, "readLocalFileHeaderEntriesFromChannel:offset:previousEntry:seekAttempts:seekForward:completion:", v12, 0, 0, 0, 0, v13);
    }
    else
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1001146A0;
      v16[3] = &unk_1012391C8;
      v16[4] = self;
      v19 = v8 - 22;
      v17 = v12;
      v18 = v13;
      +[CRLIOUtils readAllFromChannel:offset:length:completion:](CRLIOUtils, "readAllFromChannel:offset:length:completion:", v17, v8 - 22, 22, v16);

    }
  }
  else
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100114900;
    v14[3] = &unk_10122D7E0;
    v11 = &v15;
    v15 = v7;
    dispatch_async(v6, v14);
  }

}

- (void)readEndOfCentralDirectoryData:(id)a3 eocdOffset:(int64_t)a4 channel:(id)a5 completion:(id)a6
{
  id v10;
  void (**v11)(id, void *);
  dispatch_data_t v12;
  const __CFString **v13;
  const __CFString **v14;
  void *v15;
  void *v16;
  void *v17;
  size_t size_ptr;
  void *buffer_ptr;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;

  v10 = a5;
  v11 = (void (**)(id, void *))a6;
  size_ptr = 0;
  buffer_ptr = 0;
  v12 = dispatch_data_create_map((dispatch_data_t)a3, (const void **)&buffer_ptr, &size_ptr);
  if (size_ptr <= 0x15)
  {
    v26 = CFSTR("CRLZipArchiveErrorDescription");
    v27 = CFSTR("Wrong data size for CRLZipEndOfCentralDirectoryRecord");
    v13 = &v27;
    v14 = &v26;
    goto LABEL_8;
  }
  if (*(_DWORD *)buffer_ptr != 101010256)
  {
    v24 = CFSTR("CRLZipArchiveErrorDescription");
    v25 = CFSTR("Don't support end of central directory comments");
    v13 = &v25;
    v14 = &v24;
LABEL_8:
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v14, 1));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError crl_fileReadCorruptedFileErrorWithUserInfo:](NSError, "crl_fileReadCorruptedFileErrorWithUserInfo:", v15));

    if (v16)
    {
      v11[2](v11, v16);

    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError crl_fileReadUnknownErrorWithUserInfo:](NSError, "crl_fileReadUnknownErrorWithUserInfo:", 0));
      v11[2](v11, v17);

    }
    goto LABEL_11;
  }
  if (*((_WORD *)buffer_ptr + 2) || *((_WORD *)buffer_ptr + 3))
  {
    v22 = CFSTR("CRLZipArchiveErrorDescription");
    v23 = CFSTR("Don't support multi-disk");
    v13 = &v23;
    v14 = &v22;
    goto LABEL_8;
  }
  if (*((unsigned __int16 *)buffer_ptr + 5) == 0xFFFFLL
    || *((_DWORD *)buffer_ptr + 4) == -1
    || *((_DWORD *)buffer_ptr + 3) == -1)
  {
    -[CRLZipArchive readZip64EndOfCentralDirectoryLocatorWithChannel:eocdOffset:completion:](self, "readZip64EndOfCentralDirectoryLocatorWithChannel:eocdOffset:completion:", v10, a4, v11);
  }
  else
  {
    -[CRLZipArchive readCentralDirectoryWithEntryCount:offset:size:channel:completion:](self, "readCentralDirectoryWithEntryCount:offset:size:channel:completion:");
  }
LABEL_11:

}

- (void)readZip64EndOfCentralDirectoryLocatorWithChannel:(id)a3 eocdOffset:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  const __CFString *v15;
  const __CFString *v16;

  v8 = a3;
  v9 = a5;
  if ((unint64_t)a4 > 0x13)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100114CD8;
    v12[3] = &unk_1012391F0;
    v12[4] = self;
    v13 = v8;
    v14 = v9;
    +[CRLIOUtils readAllFromChannel:offset:length:completion:](CRLIOUtils, "readAllFromChannel:offset:length:completion:", v13, a4 - 20, 20, v12);

  }
  else
  {
    v15 = CFSTR("CRLZipArchiveErrorDescription");
    v16 = CFSTR("File isn't long enough for Zip64 locator");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError crl_fileReadCorruptedFileErrorWithUserInfo:](NSError, "crl_fileReadCorruptedFileErrorWithUserInfo:", v10));
    (*((void (**)(id, void *))v9 + 2))(v9, v11);

  }
}

- (void)readZip64EndOfCentralDirectoryLocatorData:(id)a3 channel:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  dispatch_data_t v10;
  const __CFString **v11;
  const __CFString **v12;
  void *v13;
  void *v14;
  void *v15;
  size_t size_ptr;
  void *buffer_ptr;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;

  v8 = a4;
  v9 = (void (**)(id, void *))a5;
  size_ptr = 0;
  buffer_ptr = 0;
  v10 = dispatch_data_create_map((dispatch_data_t)a3, (const void **)&buffer_ptr, &size_ptr);
  if (size_ptr <= 0x13)
  {
    v22 = CFSTR("CRLZipArchiveErrorDescription");
    v23 = CFSTR("Wrong data size for CRLZip64EndOfCentralDirectoryLocatorRecord");
    v11 = &v23;
    v12 = &v22;
  }
  else if (*(_DWORD *)buffer_ptr == 117853008)
  {
    if (!*((_DWORD *)buffer_ptr + 1) && *((_DWORD *)buffer_ptr + 4) == 1)
    {
      -[CRLZipArchive readZip64EndOfCentralDirectoryWithChannel:offset:completion:](self, "readZip64EndOfCentralDirectoryWithChannel:offset:completion:", v8, *((_QWORD *)buffer_ptr + 1), v9);
      goto LABEL_12;
    }
    v18 = CFSTR("CRLZipArchiveErrorDescription");
    v19 = CFSTR("Multi-disk is not supported");
    v11 = &v19;
    v12 = &v18;
  }
  else
  {
    v20 = CFSTR("CRLZipArchiveErrorDescription");
    v21 = CFSTR("Zip64 end of central directory locator record signature not found");
    v11 = &v21;
    v12 = &v20;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v12, 1));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError crl_fileReadCorruptedFileErrorWithUserInfo:](NSError, "crl_fileReadCorruptedFileErrorWithUserInfo:", v13));

  if (v14)
  {
    v9[2](v9, v14);

  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError crl_fileReadUnknownErrorWithUserInfo:](NSError, "crl_fileReadUnknownErrorWithUserInfo:", 0));
    v9[2](v9, v15);

  }
LABEL_12:

}

- (void)readZip64EndOfCentralDirectoryWithChannel:(id)a3 offset:(int64_t)a4 completion:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100114FA8;
  v9[3] = &unk_1012391F0;
  v9[4] = self;
  v10 = a3;
  v11 = a5;
  v7 = v11;
  v8 = v10;
  +[CRLIOUtils readAllFromChannel:offset:length:completion:](CRLIOUtils, "readAllFromChannel:offset:length:completion:", v8, a4, 56, v9);

}

- (void)readZip64EndOfCentralDirectoryData:(id)a3 channel:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  dispatch_data_t v10;
  const __CFString **v11;
  const __CFString **v12;
  void *v13;
  void *v14;
  void *v15;
  size_t size_ptr;
  void *buffer_ptr;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;

  v8 = a4;
  v9 = (void (**)(id, void *))a5;
  size_ptr = 0;
  buffer_ptr = 0;
  v10 = dispatch_data_create_map((dispatch_data_t)a3, (const void **)&buffer_ptr, &size_ptr);
  if (size_ptr <= 0x37)
  {
    v22 = CFSTR("CRLZipArchiveErrorDescription");
    v23 = CFSTR("Wrong data size for CRLZip64EndOfCentralDirectoryRecord");
    v11 = &v23;
    v12 = &v22;
  }
  else if (*(_DWORD *)buffer_ptr == 101075792)
  {
    if (!*((_DWORD *)buffer_ptr + 4) && !*((_DWORD *)buffer_ptr + 5))
    {
      -[CRLZipArchive readCentralDirectoryWithEntryCount:offset:size:channel:completion:](self, "readCentralDirectoryWithEntryCount:offset:size:channel:completion:", *((_QWORD *)buffer_ptr + 4), *((_QWORD *)buffer_ptr + 6), *((_QWORD *)buffer_ptr + 5), v8, v9);
      goto LABEL_11;
    }
    v18 = CFSTR("CRLZipArchiveErrorDescription");
    v19 = CFSTR("Multi-disk is not supported");
    v11 = &v19;
    v12 = &v18;
  }
  else
  {
    v20 = CFSTR("CRLZipArchiveErrorDescription");
    v21 = CFSTR("Zip64 end of central directory record signature not found");
    v11 = &v21;
    v12 = &v20;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v12, 1));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError crl_fileReadCorruptedFileErrorWithUserInfo:](NSError, "crl_fileReadCorruptedFileErrorWithUserInfo:", v13));

  if (v14)
  {
    v9[2](v9, v14);

  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError crl_fileReadUnknownErrorWithUserInfo:](NSError, "crl_fileReadUnknownErrorWithUserInfo:", 0));
    v9[2](v9, v15);

  }
LABEL_11:

}

- (void)readCentralDirectoryWithEntryCount:(unint64_t)a3 offset:(int64_t)a4 size:(unint64_t)a5 channel:(id)a6 completion:(id)a7
{
  id v12;
  _QWORD v13[5];
  id v14;
  unint64_t v15;

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10011526C;
  v13[3] = &unk_101239218;
  v14 = a7;
  v15 = a3;
  v13[4] = self;
  v12 = v14;
  +[CRLIOUtils readAllFromChannel:offset:length:completion:](CRLIOUtils, "readAllFromChannel:offset:length:completion:", a6, a4, a5, v13);

}

- (void)readCentralDirectoryData:(id)a3 entryCount:(unint64_t)a4 completion:(id)a5
{
  void (**v8)(id, id);
  dispatch_data_t v9;
  id v10;
  unint64_t v11;
  void *v12;
  unsigned int v13;
  id v15;
  size_t size_ptr;
  void *buffer_ptr;

  v8 = (void (**)(id, id))a5;
  size_ptr = 0;
  buffer_ptr = 0;
  v9 = dispatch_data_create_map((dispatch_data_t)a3, (const void **)&buffer_ptr, &size_ptr);
  v10 = 0;
  if (!a4)
    goto LABEL_7;
  v11 = 1;
  do
  {
    v12 = v10;
    v15 = v10;
    v13 = -[CRLZipArchive readCentralFileHeaderWithBuffer:dataSize:error:](self, "readCentralFileHeaderWithBuffer:dataSize:error:", &buffer_ptr, &size_ptr, &v15);
    v10 = v15;

    if (!v13)
      break;
  }
  while (v11++ < a4);
  if ((v13 & 1) == 0)
  {
    if (!v10)
      v10 = (id)objc_claimAutoreleasedReturnValue(+[NSError crl_fileReadUnknownErrorWithUserInfo:](NSError, "crl_fileReadUnknownErrorWithUserInfo:", 0));
    v8[2](v8, v10);
  }
  else
  {
LABEL_7:
    v8[2](v8, 0);
  }

}

- (BOOL)readCentralFileHeaderWithBuffer:(const void *)a3 dataSize:(unint64_t *)a4 error:(id *)a5
{
  CRLZipEntry *v9;
  CRLZipEntry *v10;
  unsigned __int16 *v11;
  char *v12;
  int v13;
  const __CFString **v14;
  const __CFString **v15;
  void *v16;
  id v17;
  BOOL v18;
  int v20;
  BOOL v21;
  void *v22;
  uint64_t v23;
  unsigned int v24;
  id v25;
  unsigned int v26;
  id v27;
  unsigned int v28;
  id v29;
  void *v30;
  id v31;
  const __CFString *v32;
  const __CFString *v33;
  const __CFString *v34;
  const __CFString *v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  const __CFString *v40;
  const __CFString *v41;

  v9 = objc_alloc_init(CRLZipEntry);
  v10 = v9;
  if (*a4 <= 0x2D)
  {
    v40 = CFSTR("CRLZipArchiveErrorDescription");
    v41 = CFSTR("Central directory too short");
    v14 = &v41;
    v15 = &v40;
    goto LABEL_9;
  }
  v11 = (unsigned __int16 *)*a3;
  v12 = (char *)*a3 + 46;
  v13 = *(_DWORD *)*a3;
  *a4 -= 46;
  *a3 = v12;
  if (v13 != 33639248)
  {
    v38 = CFSTR("CRLZipArchiveErrorDescription");
    v39 = CFSTR("Central directory file header has bad signature");
    v14 = &v39;
    v15 = &v38;
    goto LABEL_9;
  }
  if ((v11[4] & 1) != 0)
  {
    v36 = CFSTR("CRLZipArchiveErrorDescription");
    v37 = CFSTR("Encrypted files are not supported");
    v14 = &v37;
    v15 = &v36;
    goto LABEL_9;
  }
  if (v11[17])
  {
    v34 = CFSTR("CRLZipArchiveErrorDescription");
    v35 = CFSTR("No multi-disk support");
    v14 = &v35;
    v15 = &v34;
LABEL_9:
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v15, 1));
    v17 = (id)objc_claimAutoreleasedReturnValue(+[NSError crl_fileReadCorruptedFileErrorWithUserInfo:](NSError, "crl_fileReadCorruptedFileErrorWithUserInfo:", v16));

    goto LABEL_10;
  }
  v20 = v11[5];
  if (v11[5])
    v21 = v20 == 8;
  else
    v21 = 1;
  if (!v21)
  {
    v32 = CFSTR("CRLZipArchiveErrorDescription");
    v33 = CFSTR("Unsupported compression method");
    v14 = &v33;
    v15 = &v32;
    goto LABEL_9;
  }
  -[CRLZipEntry setCompressed:](v9, "setCompressed:", v20 == 8);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(objc_alloc((Class)NSDate), "crl_initWithDOSTime:", v11[7] | ((unint64_t)v11[6] << 16)));
  -[CRLZipEntry setLastModificationDate:](v10, "setLastModificationDate:", v22);

  -[CRLZipEntry setCRC:](v10, "setCRC:", *((unsigned int *)v11 + 4));
  -[CRLZipEntry setCompressedSize:](v10, "setCompressedSize:", *((unsigned int *)v11 + 5));
  -[CRLZipEntry setSize:](v10, "setSize:", *((unsigned int *)v11 + 6));
  -[CRLZipEntry setOffset:](v10, "setOffset:", *(unsigned int *)(v11 + 21));
  -[CRLZipEntry setNameLength:](v10, "setNameLength:", v11[14]);
  -[CRLZipEntry setExtraFieldsLength:](v10, "setExtraFieldsLength:", v11[15]);
  v23 = v11[14];
  v31 = 0;
  v24 = -[CRLZipArchive readFilenameFromBuffer:nameLength:entry:dataSize:error:](self, "readFilenameFromBuffer:nameLength:entry:dataSize:error:", a3, v23, v10, a4, &v31);
  v25 = v31;
  v17 = v25;
  if (v24)
  {
    if (!v11[15]
      || (v30 = v25,
          v26 = -[CRLZipArchive readExtraFieldsFromBuffer:extraFieldsLength:entry:dataSize:error:](self, "readExtraFieldsFromBuffer:extraFieldsLength:entry:dataSize:error:", a3), v27 = v30, v17, v17 = v27, v26))
    {
      if (!v11[16]
        || (v28 = -[CRLZipArchive readFileCommentFromBuffer:fileCommentLength:entry:dataSize:error:](self, "readFileCommentFromBuffer:fileCommentLength:entry:dataSize:error:", a3), v29 = v17, v17, v17 = v29, v28))
      {
        -[CRLZipArchive addEntry:](self, "addEntry:", v10);
        v18 = 1;
        goto LABEL_13;
      }
    }
  }
LABEL_10:
  if (a5)
  {
    v17 = objc_retainAutorelease(v17);
    v18 = 0;
    *a5 = v17;
  }
  else
  {
    v18 = 0;
  }
LABEL_13:

  return v18;
}

- (BOOL)readFilenameFromBuffer:(const void *)a3 nameLength:(unsigned __int16)a4 entry:(id)a5 dataSize:(unint64_t *)a6 error:(id *)a7
{
  unsigned int v9;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  void *v16;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;

  v9 = a4;
  v11 = a5;
  if (*a6 < v9)
  {
    v18 = CFSTR("CRLZipArchiveErrorDescription");
    v19 = CFSTR("Central directory too short");
    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError crl_fileReadCorruptedFileErrorWithUserInfo:](NSError, "crl_fileReadCorruptedFileErrorWithUserInfo:", v12));
LABEL_6:
    v15 = 0;
    goto LABEL_7;
  }
  v14 = v9;
  v12 = objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", *a3, v9, 4);
  objc_msgSend(v11, "setName:", v12);
  *a6 -= v14;
  *a3 = (char *)*a3 + v14;
  v15 = v12 != 0;
  if (!v12)
  {
    v20 = CFSTR("CRLZipArchiveErrorDescription");
    v21 = CFSTR("Couldn't read name");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError crl_fileReadCorruptedFileErrorWithUserInfo:](NSError, "crl_fileReadCorruptedFileErrorWithUserInfo:", v16));

    goto LABEL_6;
  }
  v13 = 0;
LABEL_7:

  if (a7 && !v15)
    *a7 = objc_retainAutorelease(v13);

  return v15;
}

- (BOOL)readExtraFieldsFromBuffer:(const void *)a3 extraFieldsLength:(unsigned __int16)a4 entry:(id)a5 dataSize:(unint64_t *)a6 error:(id *)a7
{
  unsigned int v9;
  void *v12;
  void *v13;
  BOOL v14;
  char *v15;
  unsigned __int8 v16;
  char *v17;
  char *v18;
  unint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id *v27;
  id v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;

  v9 = a4;
  v28 = a5;
  if (*a6 < v9)
  {
    v29 = CFSTR("CRLZipArchiveErrorDescription");
    v30 = CFSTR("Central directory too short");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError crl_fileReadCorruptedFileErrorWithUserInfo:](NSError, "crl_fileReadCorruptedFileErrorWithUserInfo:", v12));
    v14 = 0;
    goto LABEL_22;
  }
  v27 = a7;
  v13 = 0;
  v15 = (char *)*a3 + v9;
  v16 = 1;
  while (1)
  {
    v17 = (char *)*a3;
    v18 = (char *)*a3 + 4;
    v14 = v18 > v15;
    if (v18 > v15)
      break;
    v19 = *a6 - 4;
    *a6 = v19;
    *a3 = v18;
    v20 = *((unsigned __int16 *)v17 + 1);
    if (&v18[v20] > v15)
    {
      v31 = CFSTR("CRLZipArchiveErrorDescription");
      v32 = CFSTR("Invalid Zip entry extra field length");
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
      v23 = objc_claimAutoreleasedReturnValue(+[NSError crl_fileReadCorruptedFileErrorWithUserInfo:](NSError, "crl_fileReadCorruptedFileErrorWithUserInfo:", v22));

      v13 = (void *)v23;
LABEL_11:
      v17 = (char *)*a3;
      break;
    }
    if (*(_WORD *)v17 == 1)
    {
      v16 = -[CRLZipArchive readZip64ExtraFieldFromBuffer:dataLength:entry:error:](self, "readZip64ExtraFieldFromBuffer:dataLength:entry:error:");
      v21 = v13;

      v20 = *((unsigned __int16 *)v17 + 1);
      v19 = *a6;
      v13 = v21;
      v18 = (char *)*a3;
    }
    *a6 = v19 - v20;
    *a3 = &v18[v20];
    if ((v16 & 1) == 0)
      goto LABEL_11;
  }
  if (v17 != v15)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101239238);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DFBEEC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101239258);
    a7 = v27;
    v24 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v24);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLZipArchive readExtraFieldsFromBuffer:extraFieldsLength:entry:dataSize:error:]", v27));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipArchive.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v25, 458, 0, "Unexpected buffer position while reading extra fields.");

LABEL_22:
    if (!a7)
      goto LABEL_25;
    goto LABEL_23;
  }
  a7 = v27;
  if (!v27)
    goto LABEL_25;
LABEL_23:
  if (!v14)
    *a7 = objc_retainAutorelease(v13);
LABEL_25:

  return v14;
}

- (BOOL)readZip64ExtraFieldFromBuffer:(const void *)a3 dataLength:(unsigned __int16)a4 entry:(id)a5 error:(id *)a6
{
  unsigned int v7;
  id v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  BOOL v14;
  const __CFString **v15;
  const __CFString **v16;
  void *v17;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;

  v7 = a4;
  v9 = a5;
  if (objc_msgSend(v9, "size") == (id)0xFFFFFFFFLL)
  {
    v10 = v7 >= 8;
    LOWORD(v7) = v7 - 8;
    if (!v10)
    {
      v23 = CFSTR("CRLZipArchiveErrorDescription");
      v24 = CFSTR("Not enough room for Zip64 uncompressed size");
      v15 = &v24;
      v16 = &v23;
      goto LABEL_14;
    }
    v11 = *(_QWORD *)a3;
    a3 = (char *)a3 + 8;
    objc_msgSend(v9, "setSize:", v11);
  }
  if (objc_msgSend(v9, "compressedSize") == (id)0xFFFFFFFFLL)
  {
    if ((unsigned __int16)v7 < 8u)
    {
      v21 = CFSTR("CRLZipArchiveErrorDescription");
      v22 = CFSTR("Not enough room for Zip64 compressed size");
      v15 = &v22;
      v16 = &v21;
      goto LABEL_14;
    }
    v12 = *(_QWORD *)a3;
    a3 = (char *)a3 + 8;
    objc_msgSend(v9, "setCompressedSize:", v12);
    LOWORD(v7) = v7 - 8;
  }
  if (objc_msgSend(v9, "offset") != (id)0xFFFFFFFFLL)
  {
LABEL_11:
    v13 = 0;
    v14 = 1;
    goto LABEL_17;
  }
  if ((unsigned __int16)v7 >= 8u)
  {
    objc_msgSend(v9, "setOffset:", *(_QWORD *)a3);
    goto LABEL_11;
  }
  v19 = CFSTR("CRLZipArchiveErrorDescription");
  v20 = CFSTR("Not enough room for Zip64 offset");
  v15 = &v20;
  v16 = &v19;
LABEL_14:
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v16, 1));
  v13 = (id)objc_claimAutoreleasedReturnValue(+[NSError crl_fileReadCorruptedFileErrorWithUserInfo:](NSError, "crl_fileReadCorruptedFileErrorWithUserInfo:", v17));

  if (a6)
  {
    v13 = objc_retainAutorelease(v13);
    v14 = 0;
    *a6 = v13;
  }
  else
  {
    v14 = 0;
  }
LABEL_17:

  return v14;
}

- (BOOL)readFileCommentFromBuffer:(const void *)a3 fileCommentLength:(unsigned __int16)a4 entry:(id)a5 dataSize:(unint64_t *)a6 error:(id *)a7
{
  unsigned int v9;
  id v11;
  unint64_t v12;
  unint64_t v13;
  id v14;
  void *v15;
  const __CFString *v17;
  const __CFString *v18;

  v9 = a4;
  v11 = a5;
  v12 = *a6;
  v13 = v9;
  if (*a6 < v9)
  {
    v17 = CFSTR("CRLZipArchiveErrorDescription");
    v18 = CFSTR("Central directory too short");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
    v14 = (id)objc_claimAutoreleasedReturnValue(+[NSError crl_fileReadCorruptedFileErrorWithUserInfo:](NSError, "crl_fileReadCorruptedFileErrorWithUserInfo:", v15));

    if (a7)
    {
      v14 = objc_retainAutorelease(v14);
      *a7 = v14;
    }
  }
  else
  {
    v14 = 0;
    *a6 = v12 - v13;
    *a3 = (char *)*a3 + v13;
  }

  return v12 >= v13;
}

- (void)readLocalFileHeaderEntriesFromChannel:(id)a3 offset:(int64_t)a4 previousEntry:(id)a5 seekAttempts:(unsigned int)a6 seekForward:(BOOL)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  int64_t v23;
  unsigned int v24;
  BOOL v25;

  v14 = a3;
  v15 = a5;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100116068;
  v19[3] = &unk_101239308;
  v22 = a8;
  v23 = a4;
  v19[4] = self;
  v20 = v14;
  v25 = a7;
  v24 = a6;
  v21 = v15;
  v16 = v22;
  v17 = v15;
  v18 = v14;
  +[CRLIOUtils readAllFromChannel:offset:length:completion:](CRLIOUtils, "readAllFromChannel:offset:length:completion:", v18, a4, 30, v19);

}

- (void)readLocalFileHeaderData:(id)a3 atOffset:(int64_t)a4 channel:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  dispatch_data_t v12;
  unsigned __int16 *v13;
  __int16 v14;
  BOOL v15;
  CRLZipEntry *v16;
  void *v17;
  unint64_t v18;
  int64_t v19;
  CRLZipEntry *v20;
  _BOOL8 v21;
  const __CFString **v22;
  const __CFString **v23;
  void *v24;
  const __CFString **v25;
  const __CFString **v26;
  void *v27;
  _QWORD v28[5];
  CRLZipEntry *v29;
  id v30;
  size_t size_ptr;
  void *buffer_ptr;
  const __CFString *v33;
  const __CFString *v34;
  const __CFString *v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  const __CFString *v40;
  const __CFString *v41;
  const __CFString *v42;

  v10 = a5;
  v11 = a6;
  size_ptr = 0;
  buffer_ptr = 0;
  v12 = dispatch_data_create_map((dispatch_data_t)a3, (const void **)&buffer_ptr, &size_ptr);
  if (size_ptr <= 0x1D)
  {
    v41 = CFSTR("CRLZipArchiveErrorDescription");
    v42 = CFSTR("Wrong data size for CRLZipLocalFileHeaderRecord");
    v21 = 1;
    v22 = &v42;
    v23 = &v41;
    goto LABEL_13;
  }
  v13 = (unsigned __int16 *)buffer_ptr;
  if (*(_DWORD *)buffer_ptr != 67324752)
  {
    v21 = *(_DWORD *)buffer_ptr == 33639248;
    v39 = CFSTR("CRLZipArchiveErrorDescription");
    v40 = CFSTR("Local file header has bad signature");
    v22 = &v40;
    v23 = &v39;
LABEL_13:
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v23, 1));
    v20 = (CRLZipEntry *)objc_claimAutoreleasedReturnValue(+[NSError crl_fileReadCorruptedFileErrorWithUserInfo:](NSError, "crl_fileReadCorruptedFileErrorWithUserInfo:", v24));

    if (-[NSMutableOrderedSet count](self->_entries, "count"))
    {
      (*((void (**)(id, _QWORD, _QWORD, _BOOL8))v11 + 2))(v11, 0, 0, v21);
      goto LABEL_21;
    }
    goto LABEL_18;
  }
  v14 = *((_WORD *)buffer_ptr + 3);
  if ((v14 & 1) != 0)
  {
    v37 = CFSTR("CRLZipArchiveErrorDescription");
    v38 = CFSTR("Encrypted files are not supported");
    v25 = &v38;
    v26 = &v37;
  }
  else if ((v14 & 8) != 0)
  {
    v35 = CFSTR("CRLZipArchiveErrorDescription");
    v36 = CFSTR("Local file header does not have the entry CRC and size");
    v25 = &v36;
    v26 = &v35;
  }
  else
  {
    if (*((_WORD *)buffer_ptr + 4))
      v15 = *((unsigned __int16 *)buffer_ptr + 4) == 8;
    else
      v15 = 1;
    if (v15)
    {
      v16 = objc_alloc_init(CRLZipEntry);
      -[CRLZipEntry setCompressed:](v16, "setCompressed:", v13[4] == 8);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(objc_alloc((Class)NSDate), "crl_initWithDOSTime:", v13[6] | ((unint64_t)v13[5] << 16)));
      -[CRLZipEntry setLastModificationDate:](v16, "setLastModificationDate:", v17);

      -[CRLZipEntry setCRC:](v16, "setCRC:", *(unsigned int *)(v13 + 7));
      -[CRLZipEntry setCompressedSize:](v16, "setCompressedSize:", *(unsigned int *)(v13 + 9));
      -[CRLZipEntry setSize:](v16, "setSize:", *(unsigned int *)(v13 + 11));
      -[CRLZipEntry setOffset:](v16, "setOffset:", a4);
      -[CRLZipEntry setNameLength:](v16, "setNameLength:", v13[13]);
      -[CRLZipEntry setExtraFieldsLength:](v16, "setExtraFieldsLength:", v13[14]);
      v18 = v13[14] + (unint64_t)v13[13];
      -[CRLZipEntry setFileHeaderLength:](v16, "setFileHeaderLength:", v18 + 30);
      v19 = a4 + 30;
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_1001168A0;
      v28[3] = &unk_1012391F0;
      v28[4] = self;
      v29 = v16;
      v30 = v11;
      v20 = v16;
      +[CRLIOUtils readAllFromChannel:offset:length:completion:](CRLIOUtils, "readAllFromChannel:offset:length:completion:", v10, v19, v18, v28);

      goto LABEL_21;
    }
    v33 = CFSTR("CRLZipArchiveErrorDescription");
    v34 = CFSTR("Unsupported compression method");
    v25 = &v34;
    v26 = &v33;
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v25, v26, 1));
  v20 = (CRLZipEntry *)objc_claimAutoreleasedReturnValue(+[NSError crl_fileReadCorruptedFileErrorWithUserInfo:](NSError, "crl_fileReadCorruptedFileErrorWithUserInfo:", v27));

LABEL_18:
  if (!v20)
    v20 = (CRLZipEntry *)objc_claimAutoreleasedReturnValue(+[NSError crl_fileReadUnknownErrorWithUserInfo:](NSError, "crl_fileReadUnknownErrorWithUserInfo:", 0));
  (*((void (**)(id, _QWORD, CRLZipEntry *, _QWORD))v11 + 2))(v11, 0, v20, 0);
LABEL_21:

}

- (BOOL)readLocalFileHeaderFilenameAndExtraFieldsData:(id)a3 forEntry:(id)a4 error:(id *)a5
{
  id v8;
  dispatch_data_t v9;
  size_t v10;
  unsigned int v11;
  id v12;
  id v13;
  BOOL v14;
  unsigned int v15;
  id v17;
  id v18;
  size_t size_ptr;
  void *buffer_ptr;
  const __CFString *v21;
  const __CFString *v22;

  v8 = a4;
  size_ptr = 0;
  buffer_ptr = 0;
  v9 = dispatch_data_create_map((dispatch_data_t)a3, (const void **)&buffer_ptr, &size_ptr);
  v10 = size_ptr;
  v11 = objc_msgSend(v8, "nameLength");
  if (v10 >= objc_msgSend(v8, "extraFieldsLength") + (unint64_t)v11)
  {
    v18 = 0;
    v15 = -[CRLZipArchive readFilenameFromBuffer:nameLength:entry:dataSize:error:](self, "readFilenameFromBuffer:nameLength:entry:dataSize:error:", &buffer_ptr, objc_msgSend(v8, "nameLength"), v8, &size_ptr, &v18);
    v12 = v18;
    if (!v15)
    {
      v14 = 0;
      if (!a5)
        goto LABEL_11;
      goto LABEL_9;
    }
    if (!objc_msgSend(v8, "extraFieldsLength"))
    {
      v14 = 1;
      goto LABEL_11;
    }
    v17 = v12;
    v14 = -[CRLZipArchive readExtraFieldsFromBuffer:extraFieldsLength:entry:dataSize:error:](self, "readExtraFieldsFromBuffer:extraFieldsLength:entry:dataSize:error:", &buffer_ptr, objc_msgSend(v8, "extraFieldsLength"), v8, &size_ptr, &v17);
    v13 = v17;
  }
  else
  {
    v21 = CFSTR("CRLZipArchiveErrorDescription");
    v22 = CFSTR("Wrong data size for CRLZipLocalFileHeaderRecord filename and extra fields");
    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
    v13 = (id)objc_claimAutoreleasedReturnValue(+[NSError crl_fileReadCorruptedFileErrorWithUserInfo:](NSError, "crl_fileReadCorruptedFileErrorWithUserInfo:", v12));
    v14 = 0;
  }

  v12 = v13;
  if (!a5)
    goto LABEL_11;
LABEL_9:
  if (!v14)
  {
    v12 = objc_retainAutorelease(v12);
    v14 = 0;
    *a5 = v12;
  }
LABEL_11:

  return v14;
}

- (void)addEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLZipArchive normalizeEntryName:](self, "normalizeEntryName:", v6));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_entriesMap, "objectForKeyedSubscript:", v7));
    if (v8)
    {
      if (qword_10147E368 != -1)
        dispatch_once(&qword_10147E368, &stru_101239328);
      v9 = off_1013D9068;
      if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_ERROR))
        sub_100DFC0D4((uint64_t)v7, v9, v10);
    }
    else
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_entriesMap, "setObject:forKeyedSubscript:", v5, v7);
      -[NSMutableOrderedSet addObject:](self->_entries, "addObject:", v5);
    }

  }
}

- (id)readChannelForEntry:(id)a3
{
  return -[CRLZipArchive readChannelForEntry:validateCRC:](self, "readChannelForEntry:validateCRC:", a3, 1);
}

- (id)readChannelForEntry:(id)a3 validateCRC:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  unsigned int v7;
  CRLZipReadChannel *v8;
  CRLBufferedReadChannel *v9;
  CRLBufferedReadChannel *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  BOOL v17;

  v4 = a4;
  v6 = a3;
  if (!-[NSMutableOrderedSet containsObject:](self->_entries, "containsObject:", v6))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101239370);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DFC13C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101239390);
    v12 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLZipArchive readChannelForEntry:validateCRC:]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipArchive.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v13, 776, 0, "Entry isn't part of this archive");

    v8 = 0;
    goto LABEL_13;
  }
  v7 = objc_msgSend(v6, "isCompressed") ^ 1;
  v8 = -[CRLZipReadChannel initWithEntry:archive:validateCRC:]([CRLZipReadChannel alloc], "initWithEntry:archive:validateCRC:", v6, self, v4 & v7);
  if ((v7 & 1) == 0)
  {
    v9 = [CRLBufferedReadChannel alloc];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100116E7C;
    v15[3] = &unk_101239350;
    v16 = v6;
    v17 = v4;
    v10 = -[CRLBufferedReadChannel initWithReadChannel:blockInfos:streamReadChannelBlock:](v9, "initWithReadChannel:blockInfos:streamReadChannelBlock:", v8, 0, v15);

    v11 = v16;
    v8 = (CRLZipReadChannel *)v10;
LABEL_13:

  }
  return v8;
}

- (id)streamReadChannelForEntry:(id)a3
{
  return -[CRLZipArchive streamReadChannelForEntry:validateCRC:](self, "streamReadChannelForEntry:validateCRC:", a3, 1);
}

- (id)streamReadChannelForEntry:(id)a3 validateCRC:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  unsigned int v7;
  CRLZipReadChannel *v8;
  CRLZipInflateReadChannel *v9;
  CRLZipInflateReadChannel *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a4;
  v6 = a3;
  if (-[NSMutableOrderedSet containsObject:](self->_entries, "containsObject:", v6))
  {
    v7 = objc_msgSend(v6, "isCompressed") ^ 1;
    v8 = -[CRLZipReadChannel initWithEntry:archive:validateCRC:]([CRLZipReadChannel alloc], "initWithEntry:archive:validateCRC:", v6, self, v4 & v7);
    if ((v7 & 1) == 0)
    {
      v9 = [CRLZipInflateReadChannel alloc];
      objc_msgSend(v6, "size");
      v10 = -[CRLZipInflateReadChannel initWithReadChannel:uncompressedSize:CRC:validateCRC:](v9, "initWithReadChannel:uncompressedSize:CRC:validateCRC:", v8, objc_msgSend(v6, "size"), objc_msgSend(v6, "CRC"), v4);

      v8 = (CRLZipReadChannel *)v10;
    }
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012393B0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DFC1BC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012393D0);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLZipArchive streamReadChannelForEntry:validateCRC:]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipArchive.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 799, 0, "Entry isn't part of this archive");

    v8 = 0;
  }

  return v8;
}

- (id)containedZipArchiveForEntry:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  return +[CRLContainedZipArchive zipArchiveFromEntry:zipArchive:options:error:](CRLContainedZipArchive, "zipArchiveFromEntry:zipArchive:options:error:", a3, self, a4, a5);
}

- (id)normalizeEntryName:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = v4;
  if ((self->_options & 2) != 0)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lowercaseString"));

    v5 = (void *)v6;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "precomposedStringWithCanonicalMapping"));

  return v7;
}

- (id)entryForName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLZipArchive normalizeEntryName:](self, "normalizeEntryName:", v4));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_entriesMap, "objectForKeyedSubscript:", v6));
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)enumerateEntriesUsingBlock:(id)a3
{
  void (**v4)(id, void *, void *, _BYTE *);
  NSMutableOrderedSet *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  char v17;
  _BYTE v18[128];

  v4 = (void (**)(id, void *, void *, _BYTE *))a3;
  v17 = 0;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_entries;
  v6 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "collapsedName", (_QWORD)v13));
      if (v11)
      {
        v4[2](v4, v11, v10, &v17);
      }
      else
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
        v4[2](v4, v12, v10, &v17);

      }
      if (v17)
        break;
      if (v7 == (id)++v9)
      {
        v7 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (id)sortedEntriesUsingComparator:(id)a3
{
  return -[NSMutableOrderedSet sortedArrayUsingComparator:](self->_entries, "sortedArrayUsingComparator:", a3);
}

- (void)collapseCommonRootDirectory
{
  void *v3;
  unint64_t v4;
  NSMutableDictionary *entriesMap;
  void *v6;
  id v7;
  id v8;
  void *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  _QWORD v13[4];
  NSMutableDictionary *v14;
  CRLZipArchive *v15;
  id v16;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_1001175DC;
  v22 = sub_1001175EC;
  v23 = 0;
  v3 = objc_autoreleasePoolPush();
  v4 = (self->_options >> 1) & 1 | 2;
  entriesMap = self->_entriesMap;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1001175F4;
  v17[3] = &unk_1012393F8;
  v17[4] = &v18;
  v17[5] = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](entriesMap, "enumerateKeysAndObjectsUsingBlock:", v17);
  objc_autoreleasePoolPop(v3);
  if (objc_msgSend((id)v19[5], "count"))
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](NSString, "pathWithComponents:", v19[5]));
  else
    v6 = 0;
  v7 = objc_msgSend(v6, "length");
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", -[NSMutableDictionary count](self->_entriesMap, "count"));
    v9 = objc_autoreleasePoolPush();
    v10 = self->_entriesMap;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1001177BC;
    v13[3] = &unk_101239420;
    v16 = v7;
    v11 = (NSMutableDictionary *)v8;
    v14 = v11;
    v15 = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v10, "enumerateKeysAndObjectsUsingBlock:", v13);

    objc_autoreleasePoolPop(v9);
    v12 = self->_entriesMap;
    self->_entriesMap = v11;

  }
  _Block_object_dispose(&v18, 8);

}

- (unint64_t)archiveLength
{
  unsigned int v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  objc_class *v16;
  NSString *v17;
  void *v18;
  uint64_t v19;
  objc_class *v20;
  NSString *v21;
  void *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  unsigned int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;

  v3 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101239440);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    v7 = (objc_class *)objc_opt_class(self, v6);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 67110146;
    v26 = v3;
    v27 = 2082;
    v28 = "-[CRLZipArchive archiveLength]";
    v29 = 2082;
    v30 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipArchive.m";
    v31 = 1024;
    v32 = 916;
    v33 = 2114;
    v34 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101239460);
  v10 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v11 = v10;
    v12 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v26 = v3;
    v27 = 2114;
    v28 = v12;
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLZipArchive archiveLength]"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipArchive.m"));
  v16 = (objc_class *)objc_opt_class(self, v15);
  v17 = NSStringFromClass(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 916, 0, "Abstract method not overridden by %{public}@", v18);

  v20 = (objc_class *)objc_opt_class(self, v19);
  v21 = NSStringFromClass(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v22, "-[CRLZipArchive archiveLength]"));
  v24 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v23, 0));

  objc_exception_throw(v24);
}

- (id)newArchiveReadChannel
{
  unsigned int v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  objc_class *v16;
  NSString *v17;
  void *v18;
  uint64_t v19;
  objc_class *v20;
  NSString *v21;
  void *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  unsigned int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;

  v3 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101239480);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    v7 = (objc_class *)objc_opt_class(self, v6);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 67110146;
    v26 = v3;
    v27 = 2082;
    v28 = "-[CRLZipArchive newArchiveReadChannel]";
    v29 = 2082;
    v30 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipArchive.m";
    v31 = 1024;
    v32 = 920;
    v33 = 2114;
    v34 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012394A0);
  v10 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v11 = v10;
    v12 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v26 = v3;
    v27 = 2114;
    v28 = v12;
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLZipArchive newArchiveReadChannel]"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipArchive.m"));
  v16 = (objc_class *)objc_opt_class(self, v15);
  v17 = NSStringFromClass(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 920, 0, "Abstract method not overridden by %{public}@", v18);

  v20 = (objc_class *)objc_opt_class(self, v19);
  v21 = NSStringFromClass(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v22, "-[CRLZipArchive newArchiveReadChannel]"));
  v24 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v23, 0));

  objc_exception_throw(v24);
}

- (BOOL)isValid
{
  unsigned int v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  objc_class *v16;
  NSString *v17;
  void *v18;
  uint64_t v19;
  objc_class *v20;
  NSString *v21;
  void *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  unsigned int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;

  v3 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012394C0);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    v7 = (objc_class *)objc_opt_class(self, v6);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 67110146;
    v26 = v3;
    v27 = 2082;
    v28 = "-[CRLZipArchive isValid]";
    v29 = 2082;
    v30 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipArchive.m";
    v31 = 1024;
    v32 = 924;
    v33 = 2114;
    v34 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012394E0);
  v10 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v11 = v10;
    v12 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v26 = v3;
    v27 = 2114;
    v28 = v12;
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLZipArchive isValid]"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipArchive.m"));
  v16 = (objc_class *)objc_opt_class(self, v15);
  v17 = NSStringFromClass(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 924, 0, "Abstract method not overridden by %{public}@", v18);

  v20 = (objc_class *)objc_opt_class(self, v19);
  v21 = NSStringFromClass(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v22, "-[CRLZipArchive isValid]"));
  v24 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v23, 0));

  objc_exception_throw(v24);
}

- (void)validateCRCWithQueue:(id)a3 completion:(id)a4
{
  dispatch_queue_attr_t v6;
  NSObject *v7;
  dispatch_queue_t v8;
  NSMutableOrderedSet *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD *v21;
  _QWORD block[6];
  NSObject *v23;
  _QWORD *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[5];
  id v30;
  _BYTE v31[128];

  v17 = a3;
  v16 = a4;
  v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = dispatch_queue_create("CRLZipArchive.Validation", v7);

  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = sub_1001175DC;
  v29[4] = sub_1001175EC;
  v30 = 0;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = self->_entries;
  v10 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v26;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v9);
        v13 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v12);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100118420;
        block[3] = &unk_101239528;
        block[4] = self;
        block[5] = v13;
        v24 = v29;
        v23 = v8;
        dispatch_async(v23, block);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v10);
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100118608;
  v18[3] = &unk_101239578;
  v19 = v17;
  v20 = v16;
  v21 = v29;
  v14 = v17;
  v15 = v16;
  dispatch_async(v8, v18);

  _Block_object_dispose(v29, 8);
}

- (BOOL)validateCRCAndReturnError:(id *)a3
{
  NSObject *v5;
  dispatch_queue_global_t global_queue;
  void *v7;
  void *v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_1001175DC;
  v15 = sub_1001175EC;
  v16 = 0;
  v5 = dispatch_semaphore_create(0);
  global_queue = dispatch_get_global_queue(0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001187EC;
  v10[3] = &unk_101236818;
  v10[4] = v5;
  v10[5] = &v11;
  -[CRLZipArchive validateCRCWithQueue:completion:](self, "validateCRCWithQueue:completion:", v7, v10);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  v8 = (void *)v12[5];
  if (a3 && v8)
    *a3 = objc_retainAutorelease(v8);

  _Block_object_dispose(&v11, 8);
  return v8 == 0;
}

- (id)debugDescription
{
  CRLDescription *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v3 = +[CRLDescription descriptionWithObject:class:](CRLDescription, "descriptionWithObject:class:", self, objc_opt_class(self, a2));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet array](self->_entries, "array"));
  v6 = sub_10003DB48(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v4, "addField:value:", CFSTR("entries"), v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "descriptionString"));
  return v8;
}

- (unint64_t)options
{
  return self->_options;
}

- (int64_t)endOfLastEntry
{
  return self->_endOfLastEntry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_entriesMap, 0);
}

@end
