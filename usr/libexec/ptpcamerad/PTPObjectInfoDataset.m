@implementation PTPObjectInfoDataset

- (PTPObjectInfoDataset)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PTPObjectInfoDataset;
  return -[PTPObjectInfoDataset init](&v3, "init");
}

- (PTPObjectInfoDataset)initWithData:(id)a3
{
  return -[PTPObjectInfoDataset initWithData:contentType:](self, "initWithData:contentType:", a3, 0);
}

- (PTPObjectInfoDataset)initWithBytes:(char *)a3 length:(unsigned int)a4
{
  return -[PTPObjectInfoDataset initWithBytes:length:contentType:](self, "initWithBytes:length:contentType:", a3, *(_QWORD *)&a4, 0);
}

- (PTPObjectInfoDataset)initWithData:(id)a3 contentType:(int)a4
{
  uint64_t v4;
  id v6;
  id v7;
  id v8;

  v4 = *(_QWORD *)&a4;
  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");

  return -[PTPObjectInfoDataset initWithBytes:length:contentType:](self, "initWithBytes:length:contentType:", v7, v8, v4);
}

- (PTPObjectInfoDataset)initWithBytes:(char *)a3 length:(unsigned int)a4 contentType:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  PTPObjectInfoDataset *v8;
  PTPObjectInfoDataset *v9;
  char *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  NSObject *v16;
  id v17;
  BOOL v18;
  id v19;
  uint64_t v20;
  NSString *filename;
  id v22;
  uint64_t v23;
  NSString *modificationDate;
  NSString *captureDate;
  id v26;
  uint64_t v27;
  NSString *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  id v37;
  uint64_t v39;
  char *v40;
  objc_super v41;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  void *v45;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v41.receiver = self;
  v41.super_class = (Class)PTPObjectInfoDataset;
  v8 = -[PTPObjectInfoDataset init](&v41, "init");
  v9 = v8;
  if (!v8)
    return v9;
  if (-[PTPObjectInfoDataset contentLengthValid:forContentType:](v8, "contentLengthValid:forContentType:", v6, v5))
  {
    v10 = &a3[v6];
    v40 = a3;
    if ((_DWORD)v5)
    {
      v9->_objectHandle = sub_1000273CC(&v40);
      if (v5 > 2)
        v6 = 0;
      else
        v6 = sub_1000273CC(&v40);
    }
    v9->_storageID = sub_1000273CC(&v40);
    v9->_objectFormat = sub_100027350(&v40);
    v9->_protectionStatus = sub_100027350(&v40);
    if (v5 > 1)
    {
      if ((v5 & 0xFFFFFFFE) == 2)
        v9->_objectCompressedSize = sub_100027420((_QWORD **)&v40);
      v18 = (_DWORD)v5 == 3;
      if ((v5 - 5) > 0xFFFFFFFD)
        goto LABEL_18;
    }
    else
    {
      v18 = 0;
      v9->_objectCompressedSize = sub_1000273CC(&v40);
    }
    v9->_thumbFormat = sub_100027350(&v40);
    v9->_thumbCompressedSize = sub_1000273CC(&v40);
    v9->_thumbPixWidth = sub_1000273CC(&v40);
    v9->_thumbPixHeight = sub_1000273CC(&v40);
    v9->_imagePixWidth = sub_1000273CC(&v40);
    v9->_imagePixHeight = sub_1000273CC(&v40);
    v9->_imageBitDepth = sub_1000273CC(&v40);
LABEL_18:
    v9->_parentObject = sub_1000273CC(&v40);
    v9->_associationType = sub_100027350(&v40);
    v9->_associationDesc = sub_1000273CC(&v40);
    v9->_sequenceNumber = sub_1000273CC(&v40);
    v19 = sub_1000274E0((const void **)&v40, (unint64_t)v10);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    filename = v9->_filename;
    v9->_filename = (NSString *)v20;

    v22 = sub_1000274E0((const void **)&v40, (unint64_t)v10);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (v18)
    {
      modificationDate = v9->_modificationDate;
      v9->_modificationDate = (NSString *)v23;
    }
    else
    {
      captureDate = v9->_captureDate;
      v9->_captureDate = (NSString *)v23;

      v26 = sub_1000274E0((const void **)&v40, (unint64_t)v10);
      v27 = objc_claimAutoreleasedReturnValue(v26);
      v28 = v9->_modificationDate;
      v9->_modificationDate = (NSString *)v27;

      v29 = sub_1000274E0((const void **)&v40, (unint64_t)v10);
      modificationDate = (NSString *)objc_claimAutoreleasedReturnValue(v29);
      -[PTPObjectInfoDataset setKeywords:](v9, "setKeywords:", modificationDate);
    }

    v39 = 0;
    -[PTPObjectInfoDataset contentLength:bufferLength:contentType:](v9, "contentLength:bufferLength:contentType:", (char *)&v39 + 4, &v39, v5);
    if (HIDWORD(v39) != (_DWORD)v6)
    {
      __ICOSLogCreate();
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[PTPObjectInfoDataset filename](v9, "filename"));
      if ((unint64_t)objc_msgSend(v30, "length") >= 0x15)
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "substringWithRange:", 0, 18));
        v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "stringByAppendingString:", CFSTR("..")));

        v30 = (void *)v32;
      }
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Output Content Length Mismatch: contentLength: %d  datasetLength: %d\n"), HIDWORD(v39), v6));
      v34 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v35 = objc_retainAutorelease(v30);
        v36 = v34;
        v37 = objc_msgSend(v35, "UTF8String");
        *(_DWORD *)buf = 136446466;
        v43 = v37;
        v44 = 2114;
        v45 = v33;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

      }
    }
    return v9;
  }
  __ICOSLogCreate();
  v11 = CFSTR("PTPObjInfo");
  if ((unint64_t)objc_msgSend(CFSTR("PTPObjInfo"), "length") >= 0x15)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("PTPObjInfo"), "substringWithRange:", 0, 18));
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingString:", CFSTR("..")));

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Input Content Length Mismatch: contentLength: %d"), v6));
  v14 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v15 = objc_retainAutorelease(v11);
    v16 = v14;
    v17 = -[__CFString UTF8String](v15, "UTF8String");
    *(_DWORD *)buf = 136446466;
    v43 = v17;
    v44 = 2114;
    v45 = v13;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  return 0;
}

- (id)content
{
  return -[PTPObjectInfoDataset content:](self, "content:", 0);
}

- (void)contentLength:(unsigned int *)a3 bufferLength:(unsigned int *)a4 contentType:(int)a5
{
  NSUInteger v9;
  int v10;
  NSUInteger v11;
  int v12;
  NSUInteger v13;
  int v14;
  id v15;
  int v16;
  unsigned int v17;
  int v18;
  int v19;

  v9 = -[NSString length](self->_filename, "length");
  if (v9)
    v10 = v9 + 1;
  else
    v10 = 0;
  v11 = -[NSString length](self->_captureDate, "length");
  if (v11)
    v12 = v11 + 1;
  else
    v12 = 0;
  v13 = -[NSString length](self->_modificationDate, "length");
  if (v13)
    v14 = v13 + 1;
  else
    v14 = 0;
  v15 = -[NSMutableString length](self->_keywords, "length");
  if (v15)
    v16 = (_DWORD)v15 + 1;
  else
    v16 = 0;
  if (a5 == 2)
  {
    v18 = 2 * (v14 + v10 + v12 + v16);
    *a3 = v18 + 60;
    v17 = v18 + 68;
  }
  else if (a5 == 1)
  {
    v19 = 2 * (v14 + v10 + v12 + v16);
    *a3 = v19 + 56;
    v17 = v19 + 64;
  }
  else
  {
    if (a5)
    {
      if ((a5 - 3) > 1)
        return;
      v17 = 2 * (v14 + v10) + 36;
    }
    else
    {
      v17 = 2 * (v14 + v10 + v12 + v16) + 56;
    }
    *a3 = v17;
  }
  *a4 = v17;
}

- (BOOL)contentLengthValid:(unsigned int)a3 forContentType:(int)a4
{
  uint64_t v6;

  v6 = 0;
  -[PTPObjectInfoDataset contentLength:bufferLength:contentType:](self, "contentLength:bufferLength:contentType:", (char *)&v6 + 4, &v6, *(_QWORD *)&a4);
  return HIDWORD(v6) <= a3;
}

- (id)content:(int)a3
{
  id v5;
  id v6;
  int objectCompressedSize;
  id *p_modificationDate;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v15;
  _WORD *v16;

  v15 = 0;
  -[PTPObjectInfoDataset contentLength:bufferLength:contentType:](self, "contentLength:bufferLength:contentType:", (char *)&v15 + 4, &v15, *(_QWORD *)&a3);
  v5 = objc_alloc((Class)NSMutableData);
  v6 = objc_retainAutorelease(objc_msgSend(v5, "initWithLength:", v15));
  v16 = objc_msgSend(v6, "mutableBytes");
  if (a3)
  {
    sub_1000273B4((_DWORD **)&v16, self->_objectHandle);
    if (a3 <= 2)
      sub_1000273B4((_DWORD **)&v16, SHIDWORD(v15));
  }
  sub_1000273B4((_DWORD **)&v16, self->_storageID);
  sub_100027338(&v16, self->_objectFormat);
  sub_100027338(&v16, self->_protectionStatus);
  if (a3 <= 1)
  {
    if (HIDWORD(self->_objectCompressedSize))
      objectCompressedSize = -1;
    else
      objectCompressedSize = self->_objectCompressedSize;
    sub_1000273B4((_DWORD **)&v16, objectCompressedSize);
  }
  if ((a3 & 0xFFFFFFFE) == 2)
    sub_100027408((_QWORD **)&v16, self->_objectCompressedSize);
  if ((a3 - 5) <= 0xFFFFFFFD)
  {
    sub_100027338(&v16, self->_thumbFormat);
    sub_1000273B4((_DWORD **)&v16, self->_thumbCompressedSize);
    sub_1000273B4((_DWORD **)&v16, self->_thumbPixWidth);
    sub_1000273B4((_DWORD **)&v16, self->_thumbPixHeight);
    sub_1000273B4((_DWORD **)&v16, self->_imagePixWidth);
    sub_1000273B4((_DWORD **)&v16, self->_imagePixHeight);
    sub_1000273B4((_DWORD **)&v16, self->_imageBitDepth);
  }
  sub_1000273B4((_DWORD **)&v16, self->_parentObject);
  sub_100027338(&v16, self->_associationType);
  sub_1000273B4((_DWORD **)&v16, self->_associationDesc);
  sub_1000273B4((_DWORD **)&v16, self->_sequenceNumber);
  sub_100027514((_BYTE **)&v16, self->_filename);
  if (a3 == 3)
  {
    p_modificationDate = (id *)&self->_modificationDate;
  }
  else
  {
    sub_100027514((_BYTE **)&v16, self->_captureDate);
    sub_100027514((_BYTE **)&v16, self->_modificationDate);
    p_modificationDate = (id *)&self->_keywords;
    if ((unint64_t)-[NSMutableString length](self->_keywords, "length") >= 0x100)
    {
      __ICOSLogCreate();
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PTPObjectInfoDataset filename](self, "filename"));
      if ((unint64_t)objc_msgSend(v9, "length") >= 0x15)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "substringWithRange:", 0, 18));
        v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingString:", CFSTR("..")));

        v9 = (void *)v11;
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Keywords length of: %lu is larger than a uint8 and cannot be written."), objc_msgSend(*p_modificationDate, "length")));
      v13 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
        sub_10002FDB8(v9, v13);

    }
  }
  sub_100027514((_BYTE **)&v16, *p_modificationDate);
  return v6;
}

- (id)description
{
  __CFString *v3;
  __CFString *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  uint64_t thumbPixWidth;
  uint64_t thumbPixHeight;
  uint64_t imagePixWidth;
  uint64_t imagePixHeight;
  uint64_t imageBitDepth;
  uint64_t parentObject;
  __CFString *v14;
  void *v15;
  void *v16;
  uint64_t thumbCompressedSize;
  unint64_t objectCompressedSize;
  void *v20;
  uint64_t storageID;
  uint64_t objectHandle;

  objectHandle = self->_objectHandle;
  storageID = self->_storageID;
  v3 = sub_1000288B4(self->_objectFormat);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v4 = sub_100028854(self->_protectionStatus);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objectCompressedSize = self->_objectCompressedSize;
  v6 = sub_1000288B4(self->_thumbFormat);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  thumbCompressedSize = self->_thumbCompressedSize;
  thumbPixWidth = self->_thumbPixWidth;
  thumbPixHeight = self->_thumbPixHeight;
  imagePixWidth = self->_imagePixWidth;
  imagePixHeight = self->_imagePixHeight;
  imageBitDepth = self->_imageBitDepth;
  parentObject = self->_parentObject;
  v14 = sub_100028AF8(self->_associationType);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("<PTPObjectInfoDataset %p>{\n  _objectHandle:            0x%08lX\n  _storageID:            0x%08lX\n  _objectFormat:         %@\n  _protectionStatus:     %@\n  _objectCompressedSize: %llu\n  _thumbFormat:          %@\n  _thumbCompressedSize:  %lu\n  _thumbPixWidth:        %lu\n  _thumbPixHeight:       %lu\n  _imagePixWidth:        %lu\n  _imagePixHeight:       %lu\n  _imageBitDepth:        %lu\n  _parentObject:         0x%08lX\n  _associationType:      %@\n  _associationDesc:      0x%08lX\n  _sequenceNumber:       %lu\n  _filename:             %@\n  _captureDate:          %@\n  _modificationDate:     %@\n  _keywords:             %@\n}"), self, objectHandle, storageID, v20, v5, objectCompressedSize, v7, thumbCompressedSize, thumbPixWidth, thumbPixHeight, imagePixWidth, imagePixHeight, imageBitDepth, parentObject, v15,
                    self->_associationDesc,
                    self->_sequenceNumber,
                    self->_filename,
                    self->_captureDate,
                    self->_modificationDate,
                    self->_keywords));

  return v16;
}

- (unint64_t)objectCompressedSize64
{
  return self->_objectCompressedSize;
}

- (unsigned)objectCompressedSize
{
  if (HIDWORD(self->_objectCompressedSize))
    return -1;
  else
    return self->_objectCompressedSize;
}

- (void)setObjectCompressedSize:(unint64_t)a3
{
  self->_objectCompressedSize = a3;
}

- (id)keywords
{
  return -[NSMutableString copy](self->_keywords, "copy");
}

- (void)setKeywords:(id)a3
{
  NSMutableString *v4;
  NSMutableString *keywords;
  id v6;

  v6 = a3;
  if ((-[NSMutableString isEqualToString:](self->_keywords, "isEqualToString:") & 1) == 0)
  {
    v4 = (NSMutableString *)objc_msgSend(v6, "mutableCopy");
    keywords = self->_keywords;
    self->_keywords = v4;

  }
}

- (void)addCustomKeyword:(id)a3 withIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSMutableString *v9;
  NSMutableString *keywords;
  id v11;
  char *v12;
  char *v13;
  id v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    if (!self->_keywords)
    {
      v9 = (NSMutableString *)objc_alloc_init((Class)NSMutableString);
      keywords = self->_keywords;
      self->_keywords = v9;

    }
    v11 = objc_msgSend(v6, "length");
    v12 = (char *)objc_msgSend(v8, "length");
    v13 = &v12[(_QWORD)v11 + 3 + (unint64_t)-[NSMutableString length](self->_keywords, "length")];
    if ((unint64_t)v13 > 0xFF)
    {
      __ICOSLogCreate();
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[PTPObjectInfoDataset filename](self, "filename"));
      if ((unint64_t)objc_msgSend(v16, "length") >= 0x15)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "substringWithRange:", 0, 18));
        v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByAppendingString:", CFSTR("..")));

        v16 = (void *)v18;
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Dropping keyword: %@ identifier: %@ -- Would create string of illegal length: 0x%llx > 0xFF"), v6, v8, v13));
      v20 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
        sub_10002FDB8(v16, v20);

    }
    else
    {
      v14 = -[NSMutableString length](self->_keywords, "length");
      v15 = CFSTR("&");
      if (!v14)
        v15 = &stru_10004A300;
      -[NSMutableString appendFormat:](self->_keywords, "appendFormat:", CFSTR("%@%@^%@"), v15, v8, v6);
    }
  }

}

- (unsigned)objectContentSizeForContentType:(int)a3
{
  int v4;
  unsigned int v5;

  v5 = 0;
  v4 = 0;
  -[PTPObjectInfoDataset contentLength:bufferLength:contentType:](self, "contentLength:bufferLength:contentType:", &v5, &v4, *(_QWORD *)&a3);
  return v5;
}

- (unsigned)objectBufferSizeForContentType:(int)a3
{
  unsigned int v4;
  int v5;

  v5 = 0;
  v4 = 0;
  -[PTPObjectInfoDataset contentLength:bufferLength:contentType:](self, "contentLength:bufferLength:contentType:", &v5, &v4, *(_QWORD *)&a3);
  return v4;
}

- (id)relatedUUID
{
  char *v3;
  char *v4;
  id v5;
  void *v6;
  NSUUID *v7;
  NSUUID *relatedUUID;
  void *v9;
  NSUUID *v10;
  NSUUID *v11;
  char __dst[37];

  if (!self->_relatedUUID)
  {
    v3 = strstr((char *)-[NSMutableString UTF8String](self->_keywords, "UTF8String"), "RUUID^");
    if (v3 && (v4 = v3, strlen(v3) >= 0x2A))
    {
      __dst[36] = 0;
      strncpy(__dst, v4 + 6, 0x24uLL);
      v5 = objc_alloc((Class)NSUUID);
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", __dst));
      v7 = (NSUUID *)objc_msgSend(v5, "initWithUUIDString:", v6);
      relatedUUID = self->_relatedUUID;
      self->_relatedUUID = v7;

    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      v10 = (NSUUID *)objc_msgSend(v9, "copy");
      v11 = self->_relatedUUID;
      self->_relatedUUID = v10;

    }
  }
  return self->_relatedUUID;
}

- (int64_t)intervalSince1970
{
  int64_t result;

  result = self->_intervalSince1970;
  if (!result)
  {
    result = sub_10002EAE0(self->_captureDate);
    self->_intervalSince1970 = result;
  }
  return result;
}

- (unsigned)objectHandle
{
  return self->_objectHandle;
}

- (void)setObjectHandle:(unsigned int)a3
{
  self->_objectHandle = a3;
}

- (unsigned)storageID
{
  return self->_storageID;
}

- (void)setStorageID:(unsigned int)a3
{
  self->_storageID = a3;
}

- (unsigned)parentObject
{
  return self->_parentObject;
}

- (void)setParentObject:(unsigned int)a3
{
  self->_parentObject = a3;
}

- (unsigned)associationType
{
  return self->_associationType;
}

- (void)setAssociationType:(unsigned __int16)a3
{
  self->_associationType = a3;
}

- (unsigned)associationDesc
{
  return self->_associationDesc;
}

- (void)setAssociationDesc:(unsigned int)a3
{
  self->_associationDesc = a3;
}

- (unsigned)objectFormat
{
  return self->_objectFormat;
}

- (void)setObjectFormat:(unsigned __int16)a3
{
  self->_objectFormat = a3;
}

- (unsigned)protectionStatus
{
  return self->_protectionStatus;
}

- (void)setProtectionStatus:(unsigned __int16)a3
{
  self->_protectionStatus = a3;
}

- (unsigned)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(unsigned int)a3
{
  self->_sequenceNumber = a3;
}

- (unsigned)thumbCompressedSize
{
  return self->_thumbCompressedSize;
}

- (void)setThumbCompressedSize:(unsigned int)a3
{
  self->_thumbCompressedSize = a3;
}

- (unsigned)thumbFormat
{
  return self->_thumbFormat;
}

- (void)setThumbFormat:(unsigned __int16)a3
{
  self->_thumbFormat = a3;
}

- (unsigned)thumbOffset
{
  return self->_thumbOffset;
}

- (void)setThumbOffset:(unsigned int)a3
{
  self->_thumbOffset = a3;
}

- (unsigned)thumbPixWidth
{
  return self->_thumbPixWidth;
}

- (void)setThumbPixWidth:(unsigned int)a3
{
  self->_thumbPixWidth = a3;
}

- (unsigned)thumbPixHeight
{
  return self->_thumbPixHeight;
}

- (void)setThumbPixHeight:(unsigned int)a3
{
  self->_thumbPixHeight = a3;
}

- (unsigned)imagePixWidth
{
  return self->_imagePixWidth;
}

- (void)setImagePixWidth:(unsigned int)a3
{
  self->_imagePixWidth = a3;
}

- (unsigned)imagePixHeight
{
  return self->_imagePixHeight;
}

- (void)setImagePixHeight:(unsigned int)a3
{
  self->_imagePixHeight = a3;
}

- (unsigned)imageBitDepth
{
  return self->_imageBitDepth;
}

- (void)setImageBitDepth:(unsigned int)a3
{
  self->_imageBitDepth = a3;
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)captureDate
{
  return self->_captureDate;
}

- (void)setCaptureDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_captureDate, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_relatedUUID, 0);
  objc_storeStrong((id *)&self->_keywords, 0);
}

@end
