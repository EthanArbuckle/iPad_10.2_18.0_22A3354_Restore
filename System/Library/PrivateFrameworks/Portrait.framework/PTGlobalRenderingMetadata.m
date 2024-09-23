@implementation PTGlobalRenderingMetadata

- (PTGlobalRenderingMetadata)initWithMajorVersion:(unsigned int)a3 minorVersion:(unsigned int)a4
{
  PTGlobalRenderingMetadata *v6;
  PTGlobalRenderingMetadata *v7;
  PTGlobalRenderingMetadata *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PTGlobalRenderingMetadata;
  v6 = -[PTGlobalRenderingMetadata init](&v10, sel_init);
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

+ (id)objectFromData:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  unsigned int v6;
  __objc2_class **v7;
  void *v8;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "length") < 0x10)
    goto LABEL_8;
  v4 = objc_retainAutorelease(v3);
  v5 = objc_msgSend(v4, "bytes");
  if (*(_DWORD *)(v5 + 4) != 1684956530)
    goto LABEL_8;
  v6 = bswap32(*(_DWORD *)(v5 + 8));
  if (v6 == 1)
  {
    v7 = off_1E8229528;
    goto LABEL_7;
  }
  if (v6 != 2)
  {
LABEL_8:
    v8 = 0;
    goto LABEL_9;
  }
  v7 = off_1E8229530;
LABEL_7:
  v8 = (void *)objc_msgSend(objc_alloc(*v7), "initWithData:", v4);
LABEL_9:

  return v8;
}

- (unsigned)sizeOfSerializedObjectWithOptions:(id)a3
{
  return 0;
}

- (BOOL)writeToData:(id)a3 withOptions:(id)a4
{
  return 0;
}

- (BOOL)matchesRenderState:(id)a3
{
  return 0;
}

- (BOOL)applyToRenderState:(id)a3 error:(id *)a4
{
  return 0;
}

- (double)cameraIntrinsic
{
  return *(double *)&_PromotedConst;
}

- (unsigned)majorVersion
{
  return self->_majorVersion;
}

- (unsigned)minorVersion
{
  return self->_minorVersion;
}

- (unsigned)renderingVersion
{
  return self->_renderingVersion;
}

- (void)setRenderingVersion:(unsigned int)a3
{
  self->_renderingVersion = a3;
}

@end
