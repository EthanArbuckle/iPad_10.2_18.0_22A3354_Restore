@implementation ThunderboltPacketDumper

- (void)dumpATCConfigRegisterRead:(unsigned int)a3 value:(unsigned int)a4
{
  -[ThunderboltPacketDumper dumpRegisterOperation:registerNumber:value:](self, "dumpRegisterOperation:registerNumber:value:", 0, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

- (void)dumpATCConfigRegisterWrite:(unsigned int)a3 value:(unsigned int)a4
{
  -[ThunderboltPacketDumper dumpRegisterOperation:registerNumber:value:](self, "dumpRegisterOperation:registerNumber:value:", 1, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

- (void)dumpATCRegisterRead:(unsigned int)a3 value:(unsigned int)a4
{
  -[ThunderboltPacketDumper dumpRegisterOperation:registerNumber:value:](self, "dumpRegisterOperation:registerNumber:value:", 3, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

- (void)dumpATCRegisterWrite:(unsigned int)a3 value:(unsigned int)a4
{
  -[ThunderboltPacketDumper dumpRegisterOperation:registerNumber:value:](self, "dumpRegisterOperation:registerNumber:value:", 4, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

- (void)dumpRegisterOperation:(unsigned __int16)a3 registerNumber:(unsigned int)a4 value:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v9;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v7 = a3;
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendLittleInt32:", v6);
  objc_msgSend(v9, "appendLittleInt32:", v5);
  -[ThunderboltPacketDumper dumpPacketType:data:](self, "dumpPacketType:data:", v7, v9);

}

- (void)dumpATCMetadataRead:(unsigned int)a3 opCode:(unsigned __int16)a4
{
  -[ThunderboltPacketDumper dumpATCMetadataPacketType:metadata:opCode:](self, "dumpATCMetadataPacketType:metadata:opCode:", 5, *(_QWORD *)&a3, a4);
}

- (void)dumpATCMetadataWrite:(unsigned int)a3 opCode:(unsigned __int16)a4
{
  -[ThunderboltPacketDumper dumpATCMetadataPacketType:metadata:opCode:](self, "dumpATCMetadataPacketType:metadata:opCode:", 6, *(_QWORD *)&a3, a4);
}

- (void)dumpATCMetadataPacketType:(unsigned __int16)a3 metadata:(unsigned int)a4 opCode:(unsigned __int16)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v9;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  v7 = a3;
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendLittleInt16:", v5);
  objc_msgSend(v9, "appendLittleInt32:", v6);
  -[ThunderboltPacketDumper dumpPacketType:data:](self, "dumpPacketType:data:", v7, v9);

}

- (void)dumpATCRouterOperationWithOpCode:(unsigned __int16)a3 data:(id)a4
{
  uint64_t v4;
  void *v6;
  id v7;

  v4 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendLittleInt16:", v4);
  if (v7)
    objc_msgSend(v6, "appendData:", v7);
  -[ThunderboltPacketDumper dumpPacketType:data:](self, "dumpPacketType:data:", 2, v6);

}

- (void)dumpPacketType:(unsigned __int16)a3 data:(id)a4
{
  id v6;
  void *v7;
  NSObject *writeQueue;
  _QWORD block[5];
  id v10;
  unsigned __int16 v11;

  v6 = a4;
  v7 = v6;
  if (!self->_suppressed)
  {
    writeQueue = self->_writeQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __47__ThunderboltPacketDumper_dumpPacketType_data___block_invoke;
    block[3] = &unk_251CE3D58;
    v11 = a3;
    block[4] = self;
    v10 = v6;
    dispatch_async(writeQueue, block);

  }
}

uint64_t __47__ThunderboltPacketDumper_dumpPacketType_data___block_invoke(uint64_t a1)
{
  int v2;

  v2 = 4;
  HIWORD(v2) = *(_WORD *)(a1 + 48);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "dumpPacket:type:metadata:metadataLength:", *(_QWORD *)(a1 + 40), 6, &v2, 4);
}

- (BOOL)suppressed
{
  return self->_suppressed;
}

- (void)setSuppressed:(BOOL)a3
{
  self->_suppressed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeQueue, 0);
  objc_storeStrong((id *)&self->_dumper, 0);
}

@end
