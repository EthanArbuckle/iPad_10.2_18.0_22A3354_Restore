@implementation CRLGLDataBufferAttribute

+ (id)attributeWithName:(id)a3 bufferUsage:(unsigned int)a4 dataType:(int64_t)a5 normalized:(BOOL)a6 componentCount:(unint64_t)a7
{
  _BOOL8 v8;
  uint64_t v10;
  id v11;
  CRLGLDataBufferAttribute *v12;

  v8 = a6;
  v10 = *(_QWORD *)&a4;
  v11 = a3;
  v12 = -[CRLGLDataBufferAttribute initWithName:bufferUsage:dataType:normalized:componentCount:]([CRLGLDataBufferAttribute alloc], "initWithName:bufferUsage:dataType:normalized:componentCount:", v11, v10, a5, v8, a7);

  return v12;
}

- (CRLGLDataBufferAttribute)initWithName:(id)a3 bufferUsage:(unsigned int)a4 dataType:(int64_t)a5 normalized:(BOOL)a6 componentCount:(unint64_t)a7
{
  int v7;
  id v12;
  CRLGLDataBufferAttribute *v13;
  CRLGLDataBufferAttribute *v14;
  int64_t v15;
  objc_super v17;

  v7 = a7;
  v12 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CRLGLDataBufferAttribute;
  v13 = -[CRLGLDataBufferAttribute init](&v17, "init");
  v14 = v13;
  if (v13)
  {
    -[CRLGLDataBufferAttribute setName:](v13, "setName:", v12);
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
  unint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  const __CFString *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGLDataBufferAttribute name](self, "name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\"%@\"), v4));
  objc_msgSend(v3, "addObject:", v5);

  v6 = -[CRLGLDataBufferAttribute dataType](self, "dataType");
  if (v6 > 5)
    v7 = 0;
  else
    v7 = off_101234808[v6];
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("dataType:%@"), v7));
  objc_msgSend(v3, "addObject:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("components:%d"), -[CRLGLDataBufferAttribute componentCount](self, "componentCount")));
  objc_msgSend(v3, "addObject:", v9);

  v10 = -[CRLGLDataBufferAttribute bufferUsage](self, "bufferUsage");
  switch(v10)
  {
    case 0x88E0u:
      v11 = CFSTR("GL_STREAM_DRAW");
      break;
    case 0x88E8u:
      v11 = CFSTR("GL_DYNAMIC_DRAW");
      break;
    case 0x88E4u:
      v11 = CFSTR("GL_STATIC_DRAW");
      break;
    default:
      v11 = CFSTR("UNKNOWN");
      break;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("bufferUsage:%@"), v11));
  objc_msgSend(v3, "addObject:", v12);

  if (-[CRLGLDataBufferAttribute isNormalized](self, "isNormalized"))
    objc_msgSend(v3, "addObject:", CFSTR("normalized"));
  v18.receiver = self;
  v18.super_class = (Class)CRLGLDataBufferAttribute;
  v13 = -[CRLGLDataBufferAttribute description](&v18, "description");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", CFSTR(",")));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: {%@}"), v14, v15));

  return v16;
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

- (CRLGLDataArrayBuffer)dataArrayBuffer
{
  return self->_dataArrayBuffer;
}

- (void)setDataArrayBuffer:(id)a3
{
  self->_dataArrayBuffer = (CRLGLDataArrayBuffer *)a3;
}

- (CRLGPUDataBuffer)dataBuffer
{
  return self->_dataBuffer;
}

- (void)setDataBuffer:(id)a3
{
  self->_dataBuffer = (CRLGPUDataBuffer *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
