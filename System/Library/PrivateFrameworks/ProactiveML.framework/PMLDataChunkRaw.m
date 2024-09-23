@implementation PMLDataChunkRaw

- (NSData)data
{
  return self->super._backingData;
}

+ (unsigned)dataChunkType
{
  return 0;
}

+ (id)chunkWithData:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithData:", v3);

  return v4;
}

@end
