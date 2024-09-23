@implementation CRLGLDataArrayBuffer

- (void)p_setupGLDataBufferIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  int64_t *needsUpdateLastIndex;

  if (!self->_dataBufferHasBeenSetup)
  {
    self->_gLDataBuffers = (unsigned int *)malloc_type_malloc(4 * -[CRLGLDataArrayBuffer bufferCount](self, "bufferCount"), 0x100004052888210uLL);
    glGenBuffers((GLsizei)-[CRLGLDataArrayBuffer bufferCount](self, "bufferCount"), self->_gLDataBuffers);
    if (!*self->_gLDataBuffers)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012343E8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF4E70();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101234408);
      v3 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGLDataArrayBuffer p_setupGLDataBufferIfNecessary]"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGLDataBuffer.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 531, 0, "Unable to generate buffer(s)!");

    }
    if (-[CRLGLDataArrayBuffer bufferCount](self, "bufferCount"))
    {
      v6 = 0;
      do
      {
        glBindBuffer(0x8892u, self->_gLDataBuffers[v6]);
        glBufferData(0x8892u, self->_vertexCount * -[CRLGLDataArrayBuffer dataBufferEntrySize](self, "dataBufferEntrySize"), self->_gLData, self->_bufferUsage);
        needsUpdateLastIndex = self->_needsUpdateLastIndex;
        self->_needsUpdateFirstIndex[v6] = -1;
        needsUpdateLastIndex[v6++] = -1;
      }
      while (v6 < -[CRLGLDataArrayBuffer bufferCount](self, "bufferCount"));
    }
    self->_dataBufferHasBeenSetup = 1;
  }
}

- (void)updateDataBufferIfNecessary
{
  NSObject *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int64_t *needsUpdateLastIndex;
  int64_t v8;
  int64_t v9;
  BOOL v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  GLintptr v15;
  GLsizeiptr v16;
  int64_t *needsUpdateFirstIndex;
  int64_t *v18;

  -[CRLGLDataArrayBuffer p_setupGLDataBufferIfNecessary](self, "p_setupGLDataBufferIfNecessary");
  if (-[CRLGLDataArrayBuffer hasUpdatedData](self, "hasUpdatedData"))
  {
    if (self->_bufferUsage == 35044)
    {
      if (qword_10147E368 != -1)
        dispatch_once(&qword_10147E368, &stru_101234428);
      v3 = off_1013D9068;
      if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_ERROR))
        sub_100DF4EF0(v3);
    }
    else
    {
      if (-[CRLGLDataArrayBuffer bufferCount](self, "bufferCount"))
      {
        v4 = 0;
        v5 = -1;
        v6 = 0x7FFFFFFFFFFFFFFFLL;
        do
        {
          v8 = self->_needsUpdateFirstIndex[v4];
          if (v6 >= v8)
            v9 = self->_needsUpdateFirstIndex[v4];
          else
            v9 = v6;
          v10 = v8 == -1;
          needsUpdateLastIndex = self->_needsUpdateLastIndex;
          v11 = needsUpdateLastIndex[v4];
          if (!v10)
            v6 = v9;
          if (v5 <= v11)
            v12 = needsUpdateLastIndex[v4];
          else
            v12 = v5;
          if (v11 != -1)
            v5 = v12;
          ++v4;
        }
        while (v4 < -[CRLGLDataArrayBuffer bufferCount](self, "bufferCount"));
        v13 = v5 + 1;
      }
      else
      {
        v13 = 0;
        v6 = 0x7FFFFFFFFFFFFFFFLL;
      }
      v14 = v13 - v6;
      v15 = -[CRLGLDataArrayBuffer dataBufferEntrySize](self, "dataBufferEntrySize") * v6;
      v16 = -[CRLGLDataArrayBuffer dataBufferEntrySize](self, "dataBufferEntrySize") * v14;
      glBindBuffer(0x8892u, self->_gLDataBuffers[-[CRLGLDataArrayBuffer currentBufferIndex](self, "currentBufferIndex")]);
      glBufferSubData(0x8892u, v15, v16, self->_gLData);
      needsUpdateFirstIndex = self->_needsUpdateFirstIndex;
      needsUpdateFirstIndex[-[CRLGLDataArrayBuffer currentBufferIndex](self, "currentBufferIndex")] = -1;
      v18 = self->_needsUpdateLastIndex;
      v18[-[CRLGLDataArrayBuffer currentBufferIndex](self, "currentBufferIndex")] = -1;
    }
  }
}

- (void)p_setupMetalDataBufferIfNecessaryWithDevice:(id)a3
{
  id v4;
  unint64_t vertexCount;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t i;
  id v11;
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
    v6 = -[CRLGLDataArrayBuffer dataBufferEntrySize](self, "dataBufferEntrySize") * vertexCount;
    if (v6 > 0xFFF)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", -[CRLGLDataArrayBuffer bufferCount](self, "bufferCount")));
      v8 = -[CRLGLDataArrayBuffer bufferCount](self, "bufferCount");
      v9 = v16;
      if (v8)
      {
        for (i = 0; i < v12; ++i)
        {
          v11 = objc_msgSend(v9, "newBufferWithBytes:length:options:", self->_gLData, v6, 0);
          objc_msgSend(v7, "addObject:", v11);

          v12 = -[CRLGLDataArrayBuffer bufferCount](self, "bufferCount");
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
  char *v10;

  v8 = a3;
  v9 = -[CRLGLDataArrayBuffer dataBufferEntrySize](self, "dataBufferEntrySize");
  v10 = (char *)objc_msgSend(v8, "bufferOffset") + v9 * a4;
  if (a5)
    v10 += sub_1000B376C((uint64_t)objc_msgSend(v8, "dataType")) * a5;

  return (unint64_t)v10;
}

- (CRLGLDataArrayBuffer)initWithVertexAttributes:(id)a3 vertexCount:(unint64_t)a4 bufferCount:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  CRLGLDataArrayBuffer *v19;
  CRLGLDataArrayBuffer *v20;
  NSMutableArray *v21;
  NSMutableArray *vertexAttributes;
  NSMutableDictionary *v23;
  NSMutableDictionary *attributeOffsetsDictionary;
  NSMutableArray *v25;
  id v26;
  id v27;
  int v28;
  uint64_t v29;
  void *i;
  void *v31;
  int v32;
  unint64_t v33;
  int64_t *v34;
  int64_t *needsUpdateFirstIndex;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  objc_super v42;
  _BYTE v43[128];

  v8 = a3;
  if (objc_msgSend(v8, "count"))
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101234448);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF5030();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101234468);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGLDataArrayBuffer initWithVertexAttributes:vertexCount:bufferCount:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGLDataBuffer.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 641, 0, "no attributes!");

    if (a4)
    {
LABEL_3:
      if (a5)
        goto LABEL_32;
      goto LABEL_23;
    }
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101234488);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DF4FB0();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012344A8);
  v12 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGLDataArrayBuffer initWithVertexAttributes:vertexCount:bufferCount:]"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGLDataBuffer.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 642, 0, "vertexCount==0!");

  if (!a5)
  {
LABEL_23:
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012344C8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF4F30();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012344E8);
    v15 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGLDataArrayBuffer initWithVertexAttributes:vertexCount:bufferCount:]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGLDataBuffer.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 643, 0, "bufferCount==0!");

  }
LABEL_32:
  v18 = objc_msgSend(v8, "count");
  v19 = 0;
  if (a5 && a4 && v18)
  {
    v42.receiver = self;
    v42.super_class = (Class)CRLGLDataArrayBuffer;
    v20 = -[CRLGLDataArrayBuffer init](&v42, "init");
    if (v20)
    {
      v21 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", v8);
      vertexAttributes = v20->_vertexAttributes;
      v20->_vertexAttributes = v21;

      v20->_vertexCount = a4;
      v23 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      attributeOffsetsDictionary = v20->_attributeOffsetsDictionary;
      v20->_attributeOffsetsDictionary = v23;

      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v25 = v20->_vertexAttributes;
      v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      if (v26)
      {
        v27 = v26;
        v37 = v8;
        v28 = 0;
        v29 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v27; i = (char *)i + 1)
          {
            if (*(_QWORD *)v39 != v29)
              objc_enumerationMutation(v25);
            v31 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v31, "setDataArrayBuffer:", v20);
            v32 = sub_1000B376C((uint64_t)objc_msgSend(v31, "dataType"));
            if (!v20->_bufferUsage)
              v20->_bufferUsage = objc_msgSend(v31, "bufferUsage");
            objc_msgSend(v31, "setBufferOffset:", v28);
            v28 += (v32 * objc_msgSend(v31, "componentCount") + 3) & 0xFFFFFFFC;
            objc_msgSend(v31, "componentCount");
          }
          v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
        }
        while (v27);
        v33 = v28;
        v8 = v37;
      }
      else
      {
        v33 = 0;
      }

      v20->_dataBufferEntrySize = v33;
      if (-[CRLGLDataArrayBuffer dataBufferEntrySize](v20, "dataBufferEntrySize"))
        v20->_gLData = (char *)malloc_type_calloc(v20->_vertexCount, -[CRLGLDataArrayBuffer dataBufferEntrySize](v20, "dataBufferEntrySize"), 0x981949BuLL);
      v20->_bufferCount = a5;
      v20->_needsUpdateFirstIndex = (int64_t *)malloc_type_malloc(8 * a5, 0x100004000313F17uLL);
      v34 = (int64_t *)malloc_type_malloc(8 * a5, 0x100004000313F17uLL);
      v20->_needsUpdateLastIndex = v34;
      needsUpdateFirstIndex = v20->_needsUpdateFirstIndex;
      do
      {
        *needsUpdateFirstIndex++ = -1;
        *v34++ = -1;
        --a5;
      }
      while (a5);
    }
    self = v20;
    v19 = self;
  }

  return v19;
}

- (void)dealloc
{
  unsigned int *gLDataBuffers;
  char *gLData;
  objc_super v5;

  free(self->_needsUpdateFirstIndex);
  free(self->_needsUpdateLastIndex);
  if (self->_gLDataBuffers)
  {
    glDeleteBuffers((GLsizei)-[CRLGLDataArrayBuffer bufferCount](self, "bufferCount"), self->_gLDataBuffers);
    gLDataBuffers = self->_gLDataBuffers;
    if (gLDataBuffers)
    {
      free(gLDataBuffers);
      self->_gLDataBuffers = 0;
    }
  }
  gLData = self->_gLData;
  if (gLData)
  {
    free(gLData);
    self->_gLData = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)CRLGLDataArrayBuffer;
  -[CRLGLDataArrayBuffer dealloc](&v5, "dealloc");
}

- (void)addAllIndexesNeedUpdate
{
  -[CRLGLDataArrayBuffer addIndexRangeNeedsUpdate:](self, "addIndexRangeNeedsUpdate:", 0, self->_vertexCount);
}

- (void)addIndexRangeNeedsUpdate:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;

  length = a3.length;
  location = a3.location;
  -[CRLGLDataArrayBuffer addIndexNeedsUpdate:](self, "addIndexNeedsUpdate:");
  -[CRLGLDataArrayBuffer addIndexNeedsUpdate:](self, "addIndexNeedsUpdate:", length + location - 1);
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

- (void)enableArrayBufferWithDevice:(id)a3
{
  -[CRLGLDataArrayBuffer p_setupMetalDataBufferIfNecessaryWithDevice:](self, "p_setupMetalDataBufferIfNecessaryWithDevice:", a3);
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
    v10 = (id)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](metalDataBuffers, "objectAtIndexedSubscript:", currentBufferIndex));
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
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  -[CRLGLDataArrayBuffer setCurrentBufferIndex:](self, "setCurrentBufferIndex:", (-[CRLGLDataArrayBuffer currentBufferIndex](self, "currentBufferIndex") + 1)% -[CRLGLDataArrayBuffer bufferCount](self, "bufferCount"));
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
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "setDataArrayBuffer:", self, (_QWORD)v8);
        v7 = (char *)v7 + 1;
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
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_metalDataBuffers, "objectAtIndexedSubscript:", self->_currentBufferIndex)));
  v3 = (char *)objc_msgSend(v2, "contents");

  return v3;
}

- (BOOL)hasUpdatedData
{
  unint64_t v3;
  int64_t v4;
  BOOL v5;

  if (!-[CRLGLDataArrayBuffer bufferCount](self, "bufferCount"))
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
  while (v3 < -[CRLGLDataArrayBuffer bufferCount](self, "bufferCount"));
  return v5;
}

- (unint64_t)vertexCount
{
  return self->_vertexCount;
}

- (float)GLfloatForAttribute:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  char *v7;
  id v8;
  int v9;
  float v10;

  v6 = a3;
  v7 = &self->_gLData[-[CRLGLDataArrayBuffer p_bufferOffsetOfAttribute:atIndex:component:](self, "p_bufferOffsetOfAttribute:atIndex:component:", v6, a4, 0)];
  v8 = objc_msgSend(v6, "dataType");
  v9 = objc_msgSend(v6, "isNormalized");

  return sub_1000B3960(v7, (uint64_t)v8, v9, v10);
}

- (void)setGLfloat:(float)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  char *v9;
  id v10;
  int v11;

  v8 = a4;
  v9 = &self->_gLData[-[CRLGLDataArrayBuffer p_bufferOffsetOfAttribute:atIndex:component:](self, "p_bufferOffsetOfAttribute:atIndex:component:", v8, a5, 0)];
  v10 = objc_msgSend(v8, "dataType");
  v11 = objc_msgSend(v8, "isNormalized");

  sub_1000B3BA0(v9, (uint64_t)v10, v11, a3);
  -[CRLGLDataArrayBuffer addIndexNeedsUpdate:](self, "addIndexNeedsUpdate:", a5);
}

- (void)setCGFloat:(double)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5
{
  *(float *)&a3 = a3;
  -[CRLGLDataArrayBuffer setGLfloat:forAttribute:atIndex:](self, "setGLfloat:forAttribute:atIndex:", a4, a5, a3);
}

- ($94F468A8D4C62B317260615823C2B210)GLPoint2DForAttribute:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  char *v7;
  id v8;
  int v9;
  float v10;
  float v11;
  float v12;
  $94F468A8D4C62B317260615823C2B210 result;

  v6 = a3;
  v7 = &self->_gLData[-[CRLGLDataArrayBuffer p_bufferOffsetOfAttribute:atIndex:component:](self, "p_bufferOffsetOfAttribute:atIndex:component:", v6, a4, 0)];
  v8 = objc_msgSend(v6, "dataType");
  v9 = objc_msgSend(v6, "isNormalized");

  v11 = sub_1000B3DCC(v7, (uint64_t)v8, v9, v10);
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

- (void)setGLPoint2D:(id)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5
{
  float var1;
  float var0;
  id v9;
  char *v10;
  id v11;
  int v12;

  var1 = a3.var1;
  var0 = a3.var0;
  v9 = a4;
  v10 = &self->_gLData[-[CRLGLDataArrayBuffer p_bufferOffsetOfAttribute:atIndex:component:](self, "p_bufferOffsetOfAttribute:atIndex:component:", v9, a5, 0)];
  v11 = objc_msgSend(v9, "dataType");
  v12 = objc_msgSend(v9, "isNormalized");

  sub_1000B4060((uint64_t)v10, (uint64_t)v11, v12, var0, var1);
  -[CRLGLDataArrayBuffer addIndexNeedsUpdate:](self, "addIndexNeedsUpdate:", a5);
}

- ($E2C29196C7A5C696474C6955C5A9CE06)GLPoint3DForAttribute:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  char *v7;
  id v8;
  int v9;
  float v10;
  float v11;
  float v12;
  float v13;
  $E2C29196C7A5C696474C6955C5A9CE06 result;

  v6 = a3;
  v7 = &self->_gLData[-[CRLGLDataArrayBuffer p_bufferOffsetOfAttribute:atIndex:component:](self, "p_bufferOffsetOfAttribute:atIndex:component:", v6, a4, 0)];
  v8 = objc_msgSend(v6, "dataType");
  v9 = objc_msgSend(v6, "isNormalized");

  v11 = sub_1000B42F0(v7, (uint64_t)v8, v9, v10);
  result.var2 = v13;
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

- (void)setGLPoint3D:(id)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5
{
  float var2;
  float var1;
  float var0;
  id v10;
  char *v11;
  id v12;
  int v13;

  var2 = a3.var2;
  var1 = a3.var1;
  var0 = a3.var0;
  v10 = a4;
  v11 = &self->_gLData[-[CRLGLDataArrayBuffer p_bufferOffsetOfAttribute:atIndex:component:](self, "p_bufferOffsetOfAttribute:atIndex:component:", v10, a5, 0)];
  v12 = objc_msgSend(v10, "dataType");
  v13 = objc_msgSend(v10, "isNormalized");

  sub_1000B45D8((uint64_t)v11, (uint64_t)v12, v13, var0, var1, var2);
  -[CRLGLDataArrayBuffer addIndexNeedsUpdate:](self, "addIndexNeedsUpdate:", a5);
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)GLPoint4DForAttribute:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  int16x4_t *v7;
  id v8;
  unsigned int v9;
  float v10;
  float v11;
  float v12;
  float v13;
  $C28CD4A45FD07A4F97CC9D5F91F25271 result;

  v6 = a3;
  v7 = (int16x4_t *)&self->_gLData[-[CRLGLDataArrayBuffer p_bufferOffsetOfAttribute:atIndex:component:](self, "p_bufferOffsetOfAttribute:atIndex:component:", v6, a4, 0)];
  v8 = objc_msgSend(v6, "dataType");
  v9 = objc_msgSend(v6, "isNormalized");

  LODWORD(v10) = sub_1000B48A4(v7, (uint64_t)v8, v9).u32[0];
  result.var3 = v13;
  result.var2 = v12;
  result.var1 = v11;
  result.var0 = v10;
  return result;
}

- (void)setGLPoint4D:(id)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5
{
  float var3;
  float var2;
  float var1;
  float var0;
  id v11;
  char *v12;
  id v13;
  int v14;

  var3 = a3.var3;
  var2 = a3.var2;
  var1 = a3.var1;
  var0 = a3.var0;
  v11 = a4;
  v12 = &self->_gLData[-[CRLGLDataArrayBuffer p_bufferOffsetOfAttribute:atIndex:component:](self, "p_bufferOffsetOfAttribute:atIndex:component:", v11, a5, 0)];
  v13 = objc_msgSend(v11, "dataType");
  v14 = objc_msgSend(v11, "isNormalized");

  sub_1000B4B20((uint64_t)v12, (uint64_t)v13, v14, var0, var1, var2, var3);
  -[CRLGLDataArrayBuffer addIndexNeedsUpdate:](self, "addIndexNeedsUpdate:", a5);
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
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  bufferUsage = self->_bufferUsage;
  switch(bufferUsage)
  {
    case 0x88E0u:
      v5 = CFSTR("GL_STREAM_DRAW");
      break;
    case 0x88E8u:
      v5 = CFSTR("GL_DYNAMIC_DRAW");
      break;
    case 0x88E4u:
      v5 = CFSTR("GL_STATIC_DRAW");
      break;
    default:
      v5 = CFSTR("UNKNOWN");
      break;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("bufferUsage:%@"), v5));
  objc_msgSend(v3, "addObject:", v6);

  v7 = self->_vertexCount * -[CRLGLDataArrayBuffer dataBufferEntrySize](self, "dataBufferEntrySize");
  if (v7 > 0x100000)
  {
    v8 = CFSTR("(%0.1fMB)");
    v9 = 0.000000953674316;
LABEL_12:
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v9 * (double)v7));
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
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("bufferSize:%ldB%@"), v7, v10));
  objc_msgSend(v3, "addObject:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("attributes:%@"), self->_vertexAttributes));
  objc_msgSend(v3, "addObject:", v12);

  if ((id)-[CRLGLDataArrayBuffer bufferCount](self, "bufferCount") != (id)1)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("bufferCount:%d"), -[CRLGLDataArrayBuffer bufferCount](self, "bufferCount")));
    objc_msgSend(v3, "addObject:", v13);

  }
  v19.receiver = self;
  v19.super_class = (Class)CRLGLDataArrayBuffer;
  v14 = -[CRLGLDataArrayBuffer description](&v19, "description");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", CFSTR(",")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: {%@}"), v15, v16));

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
