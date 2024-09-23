@implementation TSDGPUDataArrayBuffer

- (void)p_setupMetalDataBufferIfNecessaryWithDevice:(id)a3
{
  id v4;
  unint64_t vertexCount;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t i;
  void *v11;
  unint64_t v12;
  NSArray *v13;
  NSArray *metalDataBuffers;
  char *gLData;
  id v16;

  v4 = a3;
  if (!self->_dataBufferHasBeenSetup)
  {
    v16 = v4;
    vertexCount = self->_vertexCount;
    v6 = -[TSDGPUDataArrayBuffer dataBufferEntrySize](self, "dataBufferEntrySize") * vertexCount;
    if (v6 > 0xFFF)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[TSDGPUDataArrayBuffer bufferCount](self, "bufferCount"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[TSDGPUDataArrayBuffer bufferCount](self, "bufferCount");
      v9 = v16;
      if (v8)
      {
        for (i = 0; i < v12; ++i)
        {
          v11 = (void *)objc_msgSend(v9, "newBufferWithBytes:length:options:", self->_gLData, v6, 0);
          objc_msgSend(v7, "addObject:", v11);

          v12 = -[TSDGPUDataArrayBuffer bufferCount](self, "bufferCount");
          v9 = v16;
        }
      }
      v13 = (NSArray *)objc_msgSend(v7, "copy");
      metalDataBuffers = self->_metalDataBuffers;
      self->_metalDataBuffers = v13;

      self->_currentBufferIndex = 0;
      self->_usesMetalBuffer = 1;
      self->_dataBufferHasBeenSetup = 1;
      gLData = self->_gLData;
      if (gLData)
      {
        free(gLData);
        self->_gLData = 0;
      }

    }
    else
    {
      self->_bufferCount = 1;
      self->_dataBufferHasBeenSetup = 1;
    }
    v4 = v16;
  }

}

- (unint64_t)p_bufferOffsetOfAttribute:(id)a3 atIndex:(unint64_t)a4 component:(unint64_t)a5
{
  id v8;
  unint64_t v9;
  unint64_t v10;

  v8 = a3;
  v9 = -[TSDGPUDataArrayBuffer dataBufferEntrySize](self, "dataBufferEntrySize");
  v10 = objc_msgSend(v8, "bufferOffset") + v9 * a4;
  if (a5)
    v10 += TSDGPUDataBufferDataTypeSize(objc_msgSend(v8, "dataType")) * a5;

  return v10;
}

- (TSDGPUDataArrayBuffer)initWithVertexAttributes:(id)a3 vertexCount:(unint64_t)a4 bufferCount:(unint64_t)a5
{
  id v8;
  uint64_t v9;
  TSDGPUDataArrayBuffer *v10;
  TSDGPUDataArrayBuffer *v11;
  uint64_t v12;
  NSMutableArray *vertexAttributes;
  NSMutableDictionary *v14;
  NSMutableDictionary *attributeOffsetsDictionary;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  int v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int64_t *v34;
  int64_t *needsUpdateFirstIndex;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  objc_super v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (objc_msgSend(v8, "count"))
  {
    if (a4)
      goto LABEL_3;
LABEL_19:
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGPUDataArrayBuffer initWithVertexAttributes:vertexCount:bufferCount:]");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUDataBuffer.m");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, v30, 497, CFSTR("vertexCount==0!"));

    if (a5)
      goto LABEL_4;
LABEL_20:
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGPUDataArrayBuffer initWithVertexAttributes:vertexCount:bufferCount:]");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUDataBuffer.m");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, v33, 498, CFSTR("bufferCount==0!"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGPUDataArrayBuffer initWithVertexAttributes:vertexCount:bufferCount:]");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUDataBuffer.m");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, v27, 496, CFSTR("no attributes!"));

  if (!a4)
    goto LABEL_19;
LABEL_3:
  if (!a5)
    goto LABEL_20;
LABEL_4:
  v9 = objc_msgSend(v8, "count");
  v10 = 0;
  if (a5 && a4 && v9)
  {
    v42.receiver = self;
    v42.super_class = (Class)TSDGPUDataArrayBuffer;
    v11 = -[TSDGPUDataArrayBuffer init](&v42, sel_init);
    if (v11)
    {
      v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", v8);
      vertexAttributes = v11->_vertexAttributes;
      v11->_vertexAttributes = (NSMutableArray *)v12;

      v11->_vertexCount = a4;
      v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      attributeOffsetsDictionary = v11->_attributeOffsetsDictionary;
      v11->_attributeOffsetsDictionary = v14;

      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v16 = v11->_vertexAttributes;
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      if (v17)
      {
        v18 = v17;
        v37 = v8;
        v19 = 0;
        v20 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v39 != v20)
              objc_enumerationMutation(v16);
            v22 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
            objc_msgSend(v22, "setDataArrayBuffer:", v11);
            v23 = TSDGPUDataBufferDataTypeSize(objc_msgSend(v22, "dataType"));
            if (!v11->_bufferUsage)
              v11->_bufferUsage = objc_msgSend(v22, "bufferUsage");
            objc_msgSend(v22, "setBufferOffset:", v19);
            v19 += (v23 * objc_msgSend(v22, "componentCount") + 3) & 0xFFFFFFFC;
            objc_msgSend(v22, "componentCount");
          }
          v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
        }
        while (v18);
        v24 = v19;
        v8 = v37;
      }
      else
      {
        v24 = 0;
      }

      v11->_dataBufferEntrySize = v24;
      if (-[TSDGPUDataArrayBuffer dataBufferEntrySize](v11, "dataBufferEntrySize"))
        v11->_gLData = (char *)malloc_type_calloc(v11->_vertexCount, -[TSDGPUDataArrayBuffer dataBufferEntrySize](v11, "dataBufferEntrySize"), 0x693EB9EEuLL);
      v11->_bufferCount = a5;
      v11->_needsUpdateFirstIndex = (int64_t *)malloc_type_malloc(8 * a5, 0x100004000313F17uLL);
      v34 = (int64_t *)malloc_type_malloc(8 * a5, 0x100004000313F17uLL);
      v11->_needsUpdateLastIndex = v34;
      needsUpdateFirstIndex = v11->_needsUpdateFirstIndex;
      do
      {
        *needsUpdateFirstIndex++ = -1;
        *v34++ = -1;
        --a5;
      }
      while (a5);
    }
    self = v11;
    v10 = self;
  }

  return v10;
}

- (void)dealloc
{
  unsigned int *gLDataBuffers;
  char *gLData;
  objc_super v5;

  free(self->_needsUpdateFirstIndex);
  free(self->_needsUpdateLastIndex);
  gLDataBuffers = self->_gLDataBuffers;
  if (gLDataBuffers)
  {
    free(gLDataBuffers);
    self->_gLDataBuffers = 0;
  }
  gLData = self->_gLData;
  if (gLData)
  {
    free(gLData);
    self->_gLData = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)TSDGPUDataArrayBuffer;
  -[TSDGPUDataArrayBuffer dealloc](&v5, sel_dealloc);
}

- (void)addAllIndexesNeedUpdate
{
  -[TSDGPUDataArrayBuffer addIndexRangeNeedsUpdate:](self, "addIndexRangeNeedsUpdate:", 0, self->_vertexCount);
}

- (void)addIndexRangeNeedsUpdate:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;

  length = a3.length;
  location = a3.location;
  -[TSDGPUDataArrayBuffer addIndexNeedsUpdate:](self, "addIndexNeedsUpdate:");
  -[TSDGPUDataArrayBuffer addIndexNeedsUpdate:](self, "addIndexNeedsUpdate:", length + location - 1);
}

- (void)addIndexNeedsUpdate:(int64_t)a3
{
  unint64_t currentBufferIndex;
  int64_t *needsUpdateFirstIndex;
  int64_t *needsUpdateLastIndex;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  unint64_t v9;
  int64_t v10;
  int64_t v11;
  int64_t v12;

  currentBufferIndex = self->_currentBufferIndex;
  needsUpdateFirstIndex = self->_needsUpdateFirstIndex;
  needsUpdateLastIndex = self->_needsUpdateLastIndex;
  v6 = needsUpdateFirstIndex[currentBufferIndex];
  if (v6 >= a3)
    v7 = a3;
  else
    v7 = needsUpdateFirstIndex[currentBufferIndex];
  if (v6 == -1)
    v8 = a3;
  else
    v8 = v7;
  needsUpdateFirstIndex[currentBufferIndex] = v8;
  v9 = self->_currentBufferIndex;
  v10 = needsUpdateLastIndex[v9];
  if (v10 <= a3)
    v11 = a3;
  else
    v11 = needsUpdateLastIndex[v9];
  if (v10 == -1)
    v12 = a3;
  else
    v12 = v11;
  needsUpdateLastIndex[v9] = v12;
}

- (void)encodeArrayBufferWithEncoder:(id)a3 atIndex:(int64_t)a4
{
  unint64_t v5;
  NSArray *metalDataBuffers;
  unint64_t currentBufferIndex;
  id v8;
  char *gLData;
  id v10;

  v5 = self->_dataBufferEntrySize * self->_vertexCount;
  if (v5 <= 0x1000)
  {
    gLData = self->_gLData;
    v10 = a3;
    objc_msgSend(v10, "setVertexBytes:length:atIndex:", gLData, v5, a4);
  }
  else
  {
    metalDataBuffers = self->_metalDataBuffers;
    currentBufferIndex = self->_currentBufferIndex;
    v8 = a3;
    -[NSArray objectAtIndexedSubscript:](metalDataBuffers, "objectAtIndexedSubscript:", currentBufferIndex);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setVertexBuffer:offset:atIndex:");

  }
}

- (void)setCurrentBufferIndex:(unint64_t)a3
{
  self->_currentBufferIndex = a3;
}

- (void)swapGPUDataBuffers
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[TSDGPUDataArrayBuffer setCurrentBufferIndex:](self, "setCurrentBufferIndex:", (-[TSDGPUDataArrayBuffer currentBufferIndex](self, "currentBufferIndex") + 1)% -[TSDGPUDataArrayBuffer bufferCount](self, "bufferCount"));
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = self->_vertexAttributes;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setDataArrayBuffer:", self, (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (char)dataPointer
{
  id v2;
  char *v3;

  if (!self->_usesMetalBuffer)
    return self->_gLData;
  -[NSArray objectAtIndexedSubscript:](self->_metalDataBuffers, "objectAtIndexedSubscript:", self->_currentBufferIndex);
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = (char *)objc_msgSend(v2, "contents");

  return v3;
}

- (BOOL)hasUpdatedData
{
  unint64_t v3;
  int64_t v4;
  BOOL v5;

  if (!-[TSDGPUDataArrayBuffer bufferCount](self, "bufferCount"))
    return 0;
  v3 = 0;
  do
  {
    v4 = self->_needsUpdateFirstIndex[v3];
    v5 = v4 != -1;
    if (v4 != -1)
      break;
    ++v3;
  }
  while (v3 < -[TSDGPUDataArrayBuffer bufferCount](self, "bufferCount"));
  return v5;
}

- (unint64_t)vertexCount
{
  return self->_vertexCount;
}

- (float)metalFloatForAttribute:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  __int16 *v7;
  uint64_t v8;
  int v9;
  float v10;

  v6 = a3;
  v7 = (__int16 *)&self->_gLData[-[TSDGPUDataArrayBuffer p_bufferOffsetOfAttribute:atIndex:component:](self, "p_bufferOffsetOfAttribute:atIndex:component:", v6, a4, 0)];
  v8 = objc_msgSend(v6, "dataType");
  v9 = objc_msgSend(v6, "isNormalized");

  return TSDGPUDataBufferMetalfloatWithDataType(v7, v8, v9, v10);
}

- (void)setMetalFloat:(float)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  char *v9;
  uint64_t v10;
  int v11;

  v8 = a4;
  v9 = &self->_gLData[-[TSDGPUDataArrayBuffer p_bufferOffsetOfAttribute:atIndex:component:](self, "p_bufferOffsetOfAttribute:atIndex:component:", v8, a5, 0)];
  v10 = objc_msgSend(v8, "dataType");
  v11 = objc_msgSend(v8, "isNormalized");

  TSDGPUDataBufferSetMetalfloatWithDataType(v9, v10, v11, a3);
  -[TSDGPUDataArrayBuffer addIndexNeedsUpdate:](self, "addIndexNeedsUpdate:", a5);
}

- (void)setCGFloat:(double)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5
{
  *(float *)&a3 = a3;
  -[TSDGPUDataArrayBuffer setMetalFloat:forAttribute:atIndex:](self, "setMetalFloat:forAttribute:atIndex:", a4, a5, a3);
}

- ($94F468A8D4C62B317260615823C2B210)metalPoint2DForAttribute:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  __int16 *v7;
  uint64_t v8;
  int v9;
  float v10;
  float v11;
  float v12;
  $94F468A8D4C62B317260615823C2B210 result;

  v6 = a3;
  v7 = (__int16 *)&self->_gLData[-[TSDGPUDataArrayBuffer p_bufferOffsetOfAttribute:atIndex:component:](self, "p_bufferOffsetOfAttribute:atIndex:component:", v6, a4, 0)];
  v8 = objc_msgSend(v6, "dataType");
  v9 = objc_msgSend(v6, "isNormalized");

  v11 = TSDGPUDataBufferMetalPoint2DWithDataType(v7, v8, v9, v10);
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

- (void)setMetalPoint2D:(id)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5
{
  float var1;
  float var0;
  id v9;
  char *v10;
  uint64_t v11;
  int v12;

  var1 = a3.var1;
  var0 = a3.var0;
  v9 = a4;
  v10 = &self->_gLData[-[TSDGPUDataArrayBuffer p_bufferOffsetOfAttribute:atIndex:component:](self, "p_bufferOffsetOfAttribute:atIndex:component:", v9, a5, 0)];
  v11 = objc_msgSend(v9, "dataType");
  v12 = objc_msgSend(v9, "isNormalized");

  TSDGPUDataBufferSetMetalPoint2DWithDataType((uint64_t)v10, v11, v12, var0, var1);
  -[TSDGPUDataArrayBuffer addIndexNeedsUpdate:](self, "addIndexNeedsUpdate:", a5);
}

- ($E2C29196C7A5C696474C6955C5A9CE06)metalPoint3DForAttribute:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  __int16 *v7;
  uint64_t v8;
  int v9;
  float v10;
  float v11;
  float v12;
  float v13;
  $E2C29196C7A5C696474C6955C5A9CE06 result;

  v6 = a3;
  v7 = (__int16 *)&self->_gLData[-[TSDGPUDataArrayBuffer p_bufferOffsetOfAttribute:atIndex:component:](self, "p_bufferOffsetOfAttribute:atIndex:component:", v6, a4, 0)];
  v8 = objc_msgSend(v6, "dataType");
  v9 = objc_msgSend(v6, "isNormalized");

  v11 = TSDGPUDataBufferMetalPoint3DWithDataType(v7, v8, v9, v10);
  result.var2 = v13;
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

- (void)setMetalPoint3D:(id)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5
{
  float var2;
  float var1;
  float var0;
  id v10;
  char *v11;
  uint64_t v12;
  int v13;

  var2 = a3.var2;
  var1 = a3.var1;
  var0 = a3.var0;
  v10 = a4;
  v11 = &self->_gLData[-[TSDGPUDataArrayBuffer p_bufferOffsetOfAttribute:atIndex:component:](self, "p_bufferOffsetOfAttribute:atIndex:component:", v10, a5, 0)];
  v12 = objc_msgSend(v10, "dataType");
  v13 = objc_msgSend(v10, "isNormalized");

  TSDGPUDataBufferSetMetalPoint3DWithDataType((uint64_t)v11, v12, v13, var0, var1, var2);
  -[TSDGPUDataArrayBuffer addIndexNeedsUpdate:](self, "addIndexNeedsUpdate:", a5);
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)metalPoint4DForAttribute:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  int16x4_t *v7;
  uint64_t v8;
  unsigned int v9;
  float v10;
  float v11;
  float v12;
  float v13;
  $C28CD4A45FD07A4F97CC9D5F91F25271 result;

  v6 = a3;
  v7 = (int16x4_t *)&self->_gLData[-[TSDGPUDataArrayBuffer p_bufferOffsetOfAttribute:atIndex:component:](self, "p_bufferOffsetOfAttribute:atIndex:component:", v6, a4, 0)];
  v8 = objc_msgSend(v6, "dataType");
  v9 = objc_msgSend(v6, "isNormalized");

  LODWORD(v10) = TSDGPUDataBufferMetalPoint4DWithDataType(v7, v8, v9).u32[0];
  result.var3 = v13;
  result.var2 = v12;
  result.var1 = v11;
  result.var0 = v10;
  return result;
}

- (void)setMetalPoint4D:(id)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5
{
  float var3;
  float var2;
  float var1;
  float var0;
  id v11;
  char *v12;
  uint64_t v13;
  int v14;

  var3 = a3.var3;
  var2 = a3.var2;
  var1 = a3.var1;
  var0 = a3.var0;
  v11 = a4;
  v12 = &self->_gLData[-[TSDGPUDataArrayBuffer p_bufferOffsetOfAttribute:atIndex:component:](self, "p_bufferOffsetOfAttribute:atIndex:component:", v11, a5, 0)];
  v13 = objc_msgSend(v11, "dataType");
  v14 = objc_msgSend(v11, "isNormalized");

  TSDGPUDataBufferSetMetalPoint4DWithDataType((uint64_t)v12, v13, v14, var0, var1, var2, var3);
  -[TSDGPUDataArrayBuffer addIndexNeedsUpdate:](self, "addIndexNeedsUpdate:", a5);
}

- (NSString)description
{
  void *v3;
  unsigned int bufferUsage;
  const __CFString *v5;
  void *v6;
  unint64_t v7;
  const __CFString *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  bufferUsage = self->_bufferUsage;
  switch(bufferUsage)
  {
    case 0x88E0u:
      v5 = CFSTR("METAL_STREAM_DRAW");
      break;
    case 0x88E8u:
      v5 = CFSTR("METAL_DYNAMIC_DRAW");
      break;
    case 0x88E4u:
      v5 = CFSTR("METAL_STATIC_DRAW");
      break;
    default:
      v5 = CFSTR("UNKNOWN");
      break;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("bufferUsage:%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  v7 = self->_vertexCount * -[TSDGPUDataArrayBuffer dataBufferEntrySize](self, "dataBufferEntrySize");
  if (v7 > 0x100000)
  {
    v8 = CFSTR("(%0.1fMB)");
    v9 = 0.000000953674316;
LABEL_12:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v8, v9 * (double)v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if (v7 >= 0x401)
  {
    v8 = CFSTR("(%0.1fKB)");
    v9 = 0.0009765625;
    goto LABEL_12;
  }
  v10 = 0;
LABEL_14:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("bufferSize:%ldB%@"), v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v11);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("attributes:%@"), self->_vertexAttributes);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v12);

  if (-[TSDGPUDataArrayBuffer bufferCount](self, "bufferCount") != 1)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("bufferCount:%d"), -[TSDGPUDataArrayBuffer bufferCount](self, "bufferCount"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v13);

  }
  v14 = (void *)MEMORY[0x24BDD17C8];
  v19.receiver = self;
  v19.super_class = (Class)TSDGPUDataArrayBuffer;
  -[TSDGPUDataArrayBuffer description](&v19, sel_description);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@: {%@}"), v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v17;
}

- (unint64_t)dataBufferEntrySize
{
  return self->_dataBufferEntrySize;
}

- (unint64_t)bufferCount
{
  return self->_bufferCount;
}

- (unint64_t)currentBufferIndex
{
  return self->_currentBufferIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalDataBuffers, 0);
  objc_storeStrong((id *)&self->_attributeOffsetsDictionary, 0);
  objc_storeStrong((id *)&self->_vertexAttributes, 0);
}

@end
