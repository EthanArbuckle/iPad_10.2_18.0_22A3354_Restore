@implementation AppleTypeCPacketDumper

- (AppleTypeCPacketDumper)initWithFileName:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AppleTypeCPacketDumper;
  return -[AppleTypeCPacketDumper init](&v4, sel_init, a3);
}

- (void)dumpCommand:(id)a3
{
  id v4;
  ATCRTBloodhoundPacketDumper *dumper;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  LOWORD(v8) = 0;
  v4 = a3;
  *(_DWORD *)((char *)&v7 + 2) = bswap32(objc_msgSend(v4, "code", 10, v8));
  dumper = self->_dumper;
  objc_msgSend(v4, "inputData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATCRTBloodhoundPacketDumper dumpPacket:type:metadata:metadataLength:](dumper, "dumpPacket:type:metadata:metadataLength:", v6, 5, &v7, 10);
}

- (void)dumpResponse:(id)a3
{
  id v4;
  void *v5;
  int v6;
  char v7;
  __int16 v8;
  unsigned int v9;
  int v10;

  v4 = a3;
  v8 = 10;
  v9 = bswap32(objc_msgSend(v4, "code"));
  v10 = 1;
  v7 = objc_msgSend(v4, "result");
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithBytes:length:", &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = objc_msgSend(v4, "bytesWritten");
    objc_msgSend(v5, "appendBytes:length:", &v6, 4);
  }
  -[ATCRTBloodhoundPacketDumper dumpPacket:type:metadata:metadataLength:](self->_dumper, "dumpPacket:type:metadata:metadataLength:", v5, 5, &v8, 10);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dumper, 0);
}

@end
