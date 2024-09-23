@implementation PTGlobalVideoHeaderMetadataVersion1

- (PTGlobalVideoHeaderMetadataVersion1)initWithMinorVersion:(unsigned int)a3
{
  PTGlobalVideoHeaderMetadataVersion1 *v3;
  PTGlobalVideoHeaderMetadataVersion1 *v4;
  PTGlobalVideoHeaderMetadataVersion1 *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PTGlobalVideoHeaderMetadataVersion1;
  v3 = -[PTGlobalVideoHeaderMetadata initWithMajorVersion:minorVersion:](&v7, sel_initWithMajorVersion_minorVersion_, 1, *(_QWORD *)&a3);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

- (PTGlobalVideoHeaderMetadataVersion1)initWithData:(id)a3
{
  id v4;
  unsigned int *v5;
  uint64_t v6;
  PTGlobalVideoHeaderMetadataVersion1 *v7;
  uint64_t v8;
  BOOL v9;
  PTGlobalVideoHeaderMetadataVersion1 *v10;
  objc_super v12;

  v4 = objc_retainAutorelease(a3);
  v5 = (unsigned int *)objc_msgSend(v4, "bytes");
  v6 = bswap32(v5[3]);
  v12.receiver = self;
  v12.super_class = (Class)PTGlobalVideoHeaderMetadataVersion1;
  v7 = -[PTGlobalVideoHeaderMetadata initWithMajorVersion:minorVersion:](&v12, sel_initWithMajorVersion_minorVersion_, 1, v6);
  if (v7
    && ((v8 = bswap32(*v5), objc_msgSend(v4, "length") == v8) ? (v9 = (v8 & 7) == 0) : (v9 = 0),
        v9
     && -[PTGlobalVideoHeaderMetadata majorVersion](v7, "majorVersion") == 1
     && -[PTGlobalVideoHeaderMetadata majorVersion](v7, "majorVersion") == bswap32(v5[2])))
  {
    v10 = v7;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unsigned)sizeOfSerializedObjectWithOptions:(id)a3
{
  return 16;
}

- (BOOL)writeToData:(id)a3 withOptions:(id)a4
{
  id v6;
  id v7;
  unsigned int v8;
  _DWORD *v9;
  BOOL v10;

  v6 = a3;
  v7 = a4;
  v8 = -[PTGlobalVideoHeaderMetadataVersion1 sizeOfSerializedObjectWithOptions:](self, "sizeOfSerializedObjectWithOptions:", v7);
  if (objc_msgSend(v6, "length") >= (unint64_t)v8
    && -[PTGlobalVideoHeaderMetadata majorVersion](self, "majorVersion") == 1)
  {
    v9 = (_DWORD *)objc_msgSend(objc_retainAutorelease(v6), "mutableBytes");
    *v9 = bswap32(-[PTGlobalVideoHeaderMetadataVersion1 sizeOfSerializedObjectWithOptions:](self, "sizeOfSerializedObjectWithOptions:", v7));
    v9[1] = 1919182966;
    v9[2] = bswap32(-[PTGlobalVideoHeaderMetadata majorVersion](self, "majorVersion"));
    v9[3] = bswap32(-[PTGlobalVideoHeaderMetadata minorVersion](self, "minorVersion"));
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
