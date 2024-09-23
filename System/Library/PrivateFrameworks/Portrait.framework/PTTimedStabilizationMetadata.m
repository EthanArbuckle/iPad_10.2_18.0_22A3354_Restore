@implementation PTTimedStabilizationMetadata

- (PTTimedStabilizationMetadata)initWithMajorVersion:(unsigned int)a3 minorVersion:(unsigned int)a4
{
  PTTimedStabilizationMetadata *v6;
  PTTimedStabilizationMetadata *v7;
  PTTimedStabilizationMetadata *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PTTimedStabilizationMetadata;
  v6 = -[PTTimedStabilizationMetadata init](&v10, sel_init);
  v7 = v6;
  v8 = 0;
  if (a3 == 1 && v6)
  {
    v6->_majorVersion = 1;
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
  unsigned int *v9;
  PTTimedStabilizationMetadataVersion1 *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *(_QWORD *)&a5;
  v7 = a3;
  if ((unint64_t)objc_msgSend(v7, "length") < 8)
  {
LABEL_11:
    v10 = 0;
    goto LABEL_10;
  }
  v8 = objc_retainAutorelease(v7);
  v9 = (unsigned int *)objc_msgSend(v8, "bytes");
  v10 = 0;
  if (a4 == 1 && v9[1] == 1650553971)
  {
    v11 = bswap32(*v9);
    v12 = objc_msgSend(v8, "length");
    if ((v11 & 7) != 0 || v12 != v11)
      goto LABEL_11;
    v10 = -[PTTimedStabilizationMetadataVersion1 initWithData:minorVersion:]([PTTimedStabilizationMetadataVersion1 alloc], "initWithData:minorVersion:", v8, v5);
  }
LABEL_10:

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
