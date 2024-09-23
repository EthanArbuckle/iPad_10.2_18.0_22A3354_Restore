@implementation TSDGPUDataBufferAttribute

+ (id)attributeWithName:(id)a3 bufferUsage:(unsigned int)a4 dataType:(int64_t)a5 normalized:(BOOL)a6 componentCount:(unint64_t)a7
{
  _BOOL8 v8;
  uint64_t v10;
  id v11;
  TSDGPUDataBufferAttribute *v12;

  v8 = a6;
  v10 = *(_QWORD *)&a4;
  v11 = a3;
  v12 = -[TSDGPUDataBufferAttribute initWithName:bufferUsage:dataType:normalized:componentCount:]([TSDGPUDataBufferAttribute alloc], "initWithName:bufferUsage:dataType:normalized:componentCount:", v11, v10, a5, v8, a7);

  return v12;
}

- (TSDGPUDataBufferAttribute)initWithName:(id)a3 bufferUsage:(unsigned int)a4 dataType:(int64_t)a5 normalized:(BOOL)a6 componentCount:(unint64_t)a7
{
  int v7;
  id v12;
  TSDGPUDataBufferAttribute *v13;
  TSDGPUDataBufferAttribute *v14;
  int64_t v15;
  objc_super v17;

  v7 = a7;
  v12 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TSDGPUDataBufferAttribute;
  v13 = -[TSDGPUDataBufferAttribute init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    -[TSDGPUDataBufferAttribute setName:](v13, "setName:", v12);
    v15 = 5;
    if (a5 != 3)
      v15 = a5;
    v14->_dataType = v15;
    v14->_bufferUsage = a4;
    v14->_componentCount = v7;
    v14->_isNormalized = a6;
    v14->_locationInShader = -1;
  }

  return v14;
}

- (void)setBufferUsage:(unsigned int)a3
{
  self->_bufferUsage = a3;
}

- (void)setComponentCount:(int)a3
{
  self->_componentCount = a3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  __CFString *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  -[TSDGPUDataBufferAttribute name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("\"%@\"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  v7 = -[TSDGPUDataBufferAttribute dataType](self, "dataType");
  if (v7 > 5)
    v8 = 0;
  else
    v8 = off_24D82C448[v7];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("dataType:%@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("components:%d"), -[TSDGPUDataBufferAttribute componentCount](self, "componentCount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  v11 = -[TSDGPUDataBufferAttribute bufferUsage](self, "bufferUsage");
  switch(v11)
  {
    case 0x88E0u:
      v12 = CFSTR("METAL_STREAM_DRAW");
      break;
    case 0x88E8u:
      v12 = CFSTR("METAL_DYNAMIC_DRAW");
      break;
    case 0x88E4u:
      v12 = CFSTR("METAL_STATIC_DRAW");
      break;
    default:
      v12 = CFSTR("UNKNOWN");
      break;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("bufferUsage:%@"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v13);

  if (-[TSDGPUDataBufferAttribute isNormalized](self, "isNormalized"))
    objc_msgSend(v3, "addObject:", CFSTR("normalized"));
  v14 = (void *)MEMORY[0x24BDD17C8];
  v19.receiver = self;
  v19.super_class = (Class)TSDGPUDataBufferAttribute;
  -[TSDGPUDataBufferAttribute description](&v19, sel_description);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@: {%@}"), v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unsigned)bufferUsage
{
  return self->_bufferUsage;
}

- (int64_t)dataType
{
  return self->_dataType;
}

- (int)componentCount
{
  return self->_componentCount;
}

- (BOOL)isNormalized
{
  return self->_isNormalized;
}

- (int)locationInShader
{
  return self->_locationInShader;
}

- (void)setLocationInShader:(int)a3
{
  self->_locationInShader = a3;
}

- (unint64_t)bufferOffset
{
  return self->_bufferOffset;
}

- (void)setBufferOffset:(unint64_t)a3
{
  self->_bufferOffset = a3;
}

- (TSDGPUDataArrayBuffer)dataArrayBuffer
{
  return self->_dataArrayBuffer;
}

- (void)setDataArrayBuffer:(id)a3
{
  self->_dataArrayBuffer = (TSDGPUDataArrayBuffer *)a3;
}

- (TSDGPUDataBuffer)dataBuffer
{
  return self->_dataBuffer;
}

- (void)setDataBuffer:(id)a3
{
  self->_dataBuffer = (TSDGPUDataBuffer *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
