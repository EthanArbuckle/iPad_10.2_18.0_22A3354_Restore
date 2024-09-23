@implementation PTTimedRenderingMetadata

- (PTTimedRenderingMetadata)initWithMajorVersion:(unsigned int)a3 minorVersion:(unsigned int)a4
{
  PTTimedRenderingMetadata *v6;
  PTTimedRenderingMetadata *v7;
  PTTimedRenderingMetadata *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PTTimedRenderingMetadata;
  v6 = -[PTTimedRenderingMetadata init](&v10, sel_init);
  v7 = v6;
  v8 = 0;
  if (a3 - 3 >= 0xFFFFFFFE && v6)
  {
    v6->_majorVersion = a3;
    v6->_minorVersion = a4;
    v8 = v6;
  }

  return v8;
}

+ (id)objectFromData:(id)a3 withMajorVersion:(unsigned int)a4 minorVersion:(unsigned int)a5
{
  uint64_t v5;
  id v7;
  id v8;
  __objc2_class **v9;
  void *v10;

  v5 = *(_QWORD *)&a5;
  v7 = a3;
  if ((unint64_t)objc_msgSend(v7, "length") < 8)
    goto LABEL_8;
  v8 = objc_retainAutorelease(v7);
  if (*(_DWORD *)(objc_msgSend(v8, "bytes") + 4) != 1684956530)
    goto LABEL_8;
  if (a4 == 1)
  {
    v9 = off_1E82296B0;
    goto LABEL_7;
  }
  if (a4 != 2)
  {
LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
  v9 = off_1E82296B8;
LABEL_7:
  v10 = (void *)objc_msgSend(objc_alloc(*v9), "initWithData:minorVersion:", v8, v5);
LABEL_9:

  return v10;
}

+ (id)objectFromData:(id)a3
{
  return 0;
}

- (unsigned)sizeOfSerializedObjectWithOptions:(id)a3
{
  return 0;
}

- (BOOL)writeToData:(id)a3 withOptions:(id)a4
{
  return 0;
}

- (unsigned)majorVersion
{
  return self->_majorVersion;
}

- (unsigned)minorVersion
{
  return self->_minorVersion;
}

@end
