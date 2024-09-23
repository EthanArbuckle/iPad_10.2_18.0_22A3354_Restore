@implementation AtlasRecordData

- (id)description
{
  void *v3;
  unsigned int v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[AtlasRecordData sfi](self, "sfi");
  v5 = -[AtlasRecordData recordId](self, "recordId");
  -[AtlasRecordData content](self, "content");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "asHexString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("SFI : %02X - RecordId : %02X - Content : %@"), v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unsigned)sfi
{
  return self->sfi;
}

- (void)setSfi:(unsigned __int8)a3
{
  self->sfi = a3;
}

- (unsigned)recordId
{
  return self->recordId;
}

- (void)setRecordId:(unsigned __int8)a3
{
  self->recordId = a3;
}

- (NSData)content
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->content, 0);
}

@end
