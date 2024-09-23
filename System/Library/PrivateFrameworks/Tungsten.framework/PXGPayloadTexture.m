@implementation PXGPayloadTexture

- (NSCopying)payload
{
  return self->_payload;
}

- (unsigned)presentationType
{
  return self->_presentationType;
}

- (PXGPayloadTexture)initWithPayload:(id)a3 presentationType:(unsigned __int8)a4
{
  id v6;
  PXGPayloadTexture *v7;
  uint64_t v8;
  NSCopying *payload;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXGPayloadTexture;
  v7 = -[PXGBaseTexture init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copyWithZone:", 0);
    payload = v7->_payload;
    v7->_payload = (NSCopying *)v8;

    v7->_presentationType = a4;
  }

  return v7;
}

- (CGSize)pixelSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x24BDBF148];
  v3 = *(double *)(MEMORY[0x24BDBF148] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
}

- (PXGPayloadTexture)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGPayloadTexture.m"), 25, CFSTR("%s is not available as initializer"), "-[PXGPayloadTexture init]");

  abort();
}

- (int64_t)estimatedByteSize
{
  return 0;
}

- (CGImage)imageRepresentation
{
  return 0;
}

- (BOOL)isOpaque
{
  return 0;
}

@end
