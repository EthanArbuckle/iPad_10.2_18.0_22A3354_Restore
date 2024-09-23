@implementation CRLGPUDataBuffer

- (void)p_setupElementArrayBufferIfNecessary
{
  double width;
  double height;
  uint64_t v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;

  if (!self->_gLElementDataBufferWasSetup)
  {
    if (self->_gLElementData)
    {
      width = self->_gLElementMeshSize.width;
      height = self->_gLElementMeshSize.height;
      if (width != CGSizeZero.width || height != CGSizeZero.height)
      {
        if (height + -1.0 > 0.0)
        {
          v6 = 0;
          v7 = 0;
          v8 = 0.0;
          do
          {
            v9 = (double)++v7;
            if (width > 0.0)
            {
              v10 = 0.0;
              v11 = 1;
              do
              {
                v12 = v6 + 1;
                -[CRLGPUDataBuffer setGLushort:forIndexElement:](self, "setGLushort:forIndexElement:", (int)(v10 + v8 * width), v6);
                v6 += 2;
                -[CRLGPUDataBuffer setGLushort:forIndexElement:](self, "setGLushort:forIndexElement:", (int)(v10 + v9 * self->_gLElementMeshSize.width), v12);
                v10 = (double)v11;
                width = self->_gLElementMeshSize.width;
                ++v11;
              }
              while (width > v10);
              height = self->_gLElementMeshSize.height;
            }
            v8 = (double)v7;
          }
          while (height + -1.0 > v9);
          goto LABEL_24;
        }
        goto LABEL_23;
      }
      if (self->_gLElementQuadParticleCount)
      {
        if (self->_conformsToMetalProtocol)
          -[CRLGPUDataBuffer setMetalDrawMode:](self, "setMetalDrawMode:", 3);
        else
          -[CRLGPUDataBuffer setDrawMode:](self, "setDrawMode:", 4);
        if (self->_gLElementQuadParticleCount)
        {
          v13 = 0;
          v14 = 0;
          do
          {
            -[CRLGPUDataBuffer setGLushort:forIndexElement:](self, "setGLushort:forIndexElement:", 4 * (v14 & 0x3FFF), v13);
            -[CRLGPUDataBuffer setGLushort:forIndexElement:](self, "setGLushort:forIndexElement:", (unsigned __int16)(4 * v14) | 1u, v13 + 1);
            -[CRLGPUDataBuffer setGLushort:forIndexElement:](self, "setGLushort:forIndexElement:", (4 * (_DWORD)v14) & 0xFFFC | 2u, v13 + 2);
            -[CRLGPUDataBuffer setGLushort:forIndexElement:](self, "setGLushort:forIndexElement:", 4 * (v14 & 0x3FFF), v13 + 3);
            -[CRLGPUDataBuffer setGLushort:forIndexElement:](self, "setGLushort:forIndexElement:", (4 * (_DWORD)v14) & 0xFFFC | 2u, v13 + 4);
            v6 = v13 + 6;
            -[CRLGPUDataBuffer setGLushort:forIndexElement:](self, "setGLushort:forIndexElement:", (unsigned __int16)(4 * v14++) | 3u, v13 + 5);
            v13 += 6;
          }
          while (v14 < self->_gLElementQuadParticleCount);
LABEL_24:
          if (v6 != self->_elementArrayCount)
          {
            +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_101234508);
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
              sub_100DF50B0();
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_101234528);
            v15 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
              sub_100DE7468(v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGPUDataBuffer p_setupElementArrayBufferIfNecessary]"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGLDataBuffer.m"));
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 948, 0, "Element array count Sanity check");

          }
          goto LABEL_34;
        }
LABEL_23:
        v6 = 0;
        goto LABEL_24;
      }
    }
LABEL_34:
    self->_gLElementDataBufferWasSetup = 1;
  }
}

- (void)p_setupGLElementArrayBufferIfNecessary
{
  GLuint gLElementDataBuffer;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int16 *gLElementData;

  if (!self->_gLElementDataBufferWasSetup)
  {
    if (self->_gLElementData)
    {
      -[CRLGPUDataBuffer p_setupElementArrayBufferIfNecessary](self, "p_setupElementArrayBufferIfNecessary");
      glGenBuffers(1, &self->_gLElementDataBuffer);
      gLElementDataBuffer = self->_gLElementDataBuffer;
      if (!gLElementDataBuffer)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101234548);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DF5130();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101234568);
        v4 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGPUDataBuffer p_setupGLElementArrayBufferIfNecessary]"));
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGLDataBuffer.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 971, 0, "Unable to generate buffer!");

        gLElementDataBuffer = self->_gLElementDataBuffer;
      }
      glBindBuffer(0x8893u, gLElementDataBuffer);
      glBufferData(0x8893u, 2 * self->_elementArrayCount, self->_gLElementData, 0x88E4u);
      gLElementData = self->_gLElementData;
      if (gLElementData)
      {
        free(gLElementData);
        self->_gLElementData = 0;
      }
    }
    else
    {
      self->_gLElementDataBufferWasSetup = 1;
    }
  }
}

- (CRLGPUDataBuffer)initWithVertexAttributes:(id)a3 vertexCount:(unint64_t)a4 indexElementCount:(unint64_t)a5 bufferCount:(unint64_t)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  CRLGPUDataBuffer *v14;
  CRLGPUDataBuffer *v15;
  CRLGPUDataBuffer *v16;
  NSArray *v17;
  NSArray *vertexAttributes;
  NSMutableArray *v19;
  NSMutableArray *arrayBuffers;
  NSMutableDictionary *v21;
  NSMutableDictionary *attributeToArrayBuffersDictionary;
  __int128 v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  void *i;
  void *v31;
  unsigned int v32;
  CRLGLDataArrayBuffer *v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  void *j;
  void *v39;
  NSMutableDictionary *v40;
  void *v41;
  unsigned int v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  char *v48;
  __int128 v50;
  unint64_t count;
  id v52;
  void *v53;
  unint64_t v54;
  void *v55;
  unint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  objc_super v65;
  uint8_t v66[128];
  uint8_t buf[4];
  unsigned int v68;
  __int16 v69;
  const char *v70;
  __int16 v71;
  const char *v72;
  __int16 v73;
  int v74;
  _BYTE v75[128];

  v10 = a3;
  v54 = a4;
  if (a4 < 0xFFFF)
  {
    v65.receiver = self;
    v65.super_class = (Class)CRLGPUDataBuffer;
    v15 = -[CRLGPUDataBuffer init](&v65, "init");
    v16 = v15;
    if (v15)
    {
      count = a5;
      -[CRLGPUDataBuffer setDrawMode:](v15, "setDrawMode:", 5);
      -[CRLGPUDataBuffer setMetalDrawMode:](v16, "setMetalDrawMode:", 4);
      v17 = (NSArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", v10);
      vertexAttributes = v16->_vertexAttributes;
      v16->_vertexAttributes = v17;

      v16->_vertexCount = a4;
      v19 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      arrayBuffers = v16->_arrayBuffers;
      v16->_arrayBuffers = v19;

      v21 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", -[NSArray count](v16->_vertexAttributes, "count"));
      attributeToArrayBuffersDictionary = v16->_attributeToArrayBuffersDictionary;
      v16->_attributeToArrayBuffersDictionary = v21;

      v16->_isDynamicallyBuffered = 1;
      v52 = v10;
      v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v10));
      if (objc_msgSend(v53, "count"))
      {
        *(_QWORD *)&v23 = 67109378;
        v50 = v23;
        do
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectAtIndex:", 0, v50));
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
          v61 = 0u;
          v62 = 0u;
          v63 = 0u;
          v64 = 0u;
          v26 = v53;
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v61, v75, 16);
          if (v27)
          {
            v28 = v27;
            v29 = *(_QWORD *)v62;
            do
            {
              for (i = 0; i != v28; i = (char *)i + 1)
              {
                if (*(_QWORD *)v62 != v29)
                  objc_enumerationMutation(v26);
                v31 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)i);
                v32 = objc_msgSend(v31, "bufferUsage");
                if (v32 == objc_msgSend(v24, "bufferUsage"))
                  objc_msgSend(v25, "addObject:", v31);
              }
              v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v61, v75, 16);
            }
            while (v28);
          }

          if (objc_msgSend(v24, "bufferUsage") == 35044)
          {
            v16->_isDynamicallyBuffered = 0;
            a6 = 1;
          }
          v33 = -[CRLGLDataArrayBuffer initWithVertexAttributes:vertexCount:bufferCount:]([CRLGLDataArrayBuffer alloc], "initWithVertexAttributes:vertexCount:bufferCount:", v25, v54, a6);
          if (v33)
          {
            v55 = v25;
            v56 = a6;
            v59 = 0u;
            v60 = 0u;
            v57 = 0u;
            v58 = 0u;
            v34 = v25;
            v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
            if (v35)
            {
              v36 = v35;
              v37 = *(_QWORD *)v58;
              do
              {
                for (j = 0; j != v36; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v58 != v37)
                    objc_enumerationMutation(v34);
                  v39 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)j);
                  objc_msgSend(v39, "setDataBuffer:", v16);
                  v40 = v16->_attributeToArrayBuffersDictionary;
                  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "name"));
                  -[NSMutableDictionary setObject:forKey:](v40, "setObject:forKey:", v33, v41);

                }
                v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
              }
              while (v36);
            }

            -[NSMutableArray addObject:](v16->_arrayBuffers, "addObject:", v33);
            v25 = v55;
            a6 = v56;
          }
          else
          {
            v42 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_1012345C8);
            v43 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109890;
              v68 = v42;
              v69 = 2082;
              v70 = "-[CRLGPUDataBuffer initWithVertexAttributes:vertexCount:indexElementCount:bufferCount:]";
              v71 = 2082;
              v72 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGLDataBuffer.m";
              v73 = 1024;
              v74 = 1023;
              _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Error creating array buffer!", buf, 0x22u);
            }
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_1012345E8);
            v44 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              v47 = v44;
              v48 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
              *(_DWORD *)buf = v50;
              v68 = v42;
              v69 = 2114;
              v70 = v48;
              _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

            }
            v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGPUDataBuffer initWithVertexAttributes:vertexCount:indexElementCount:bufferCount:]"));
            v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGLDataBuffer.m"));
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v45, v46, 1023, 0, "Error creating array buffer!");

          }
          objc_msgSend(v26, "removeObjectsInArray:", v25);

        }
        while (objc_msgSend(v26, "count"));
      }
      if (count)
      {
        v16->_elementArrayCount = count;
        v16->_gLElementData = (unsigned __int16 *)malloc_type_calloc(count, 2uLL, 0x1000040BDFB0063uLL);
      }

      v10 = v52;
    }
    self = v16;
    v14 = self;
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101234588);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF51B0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012345A8);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGPUDataBuffer initWithVertexAttributes:vertexCount:indexElementCount:bufferCount:]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGLDataBuffer.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 988, 0, "Too many vertices!");

    v14 = 0;
  }

  return v14;
}

- (CRLGPUDataBuffer)initWithVertexAttributes:(id)a3 meshSize:(CGSize)a4 bufferCount:(unint64_t)a5
{
  double height;
  double width;
  id v9;
  void *v11;
  void *v12;
  void *v13;
  CRLGPUDataBuffer *v14;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  if (width <= 1.0 || height <= 1.0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101234608);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF5230();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101234628);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGPUDataBuffer initWithVertexAttributes:meshSize:bufferCount:]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGLDataBuffer.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 1045, 0, "Mesh size is not at least 2x2!");

  }
  v14 = -[CRLGPUDataBuffer initWithVertexAttributes:vertexCount:indexElementCount:bufferCount:](self, "initWithVertexAttributes:vertexCount:indexElementCount:bufferCount:", v9, (unint64_t)(width * height), (unint64_t)((width + width) * (height + -1.0)), a5);
  v14->_gLElementMeshSize.width = width;
  v14->_gLElementMeshSize.height = height;

  return v14;
}

+ (id)newDataBufferWithVertexAttributes:(id)a3 vertexCount:(unint64_t)a4 indexElementCount:(unint64_t)a5
{
  id v8;
  id v9;

  v8 = a3;
  v9 = objc_msgSend(objc_alloc((Class)a1), "initWithVertexAttributes:vertexCount:indexElementCount:bufferCount:", v8, a4, a5, 2);

  return v9;
}

+ (id)newDataBufferWithVertexAttributes:(id)a3 meshSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  id v8;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)a1), "initWithVertexAttributes:meshSize:bufferCount:", v7, 2, width, height);

  return v8;
}

+ (id)newDataBufferWithVertexAttributes:(id)a3 quadParticleCount:(unint64_t)a4
{
  unint64_t v6;
  unint64_t v7;
  id v8;
  _QWORD *v9;

  v6 = 4 * a4;
  v7 = 6 * a4;
  v8 = a3;
  v9 = objc_msgSend(objc_alloc((Class)a1), "initWithVertexAttributes:vertexCount:indexElementCount:bufferCount:", v8, v6, v7, 2);

  if (v9)
    v9[10] = a4;
  return v9;
}

+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 meshSize:(CGSize)a5 textureFlipped:(BOOL)a6 includeCenterAttribute:(BOOL)a7
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithVertexRect:textureRect:meshSize:textureFlipped:includeCenterAttribute:addTransparentBorder:", *(_QWORD *)&a5.width, *(_QWORD *)&a5.height, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 meshSize:(CGSize)a5 textureFlipped:(BOOL)a6 includeCenterAttribute:(BOOL)a7 addTransparentBorder:(BOOL)a8
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithVertexRect:textureRect:meshSize:textureFlipped:includeCenterAttribute:addTransparentBorder:", *(_QWORD *)&a5.width, *(_QWORD *)&a5.height, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

+ (void)p_addTransparentBorderInsetToTextureRect:(CGRect *)a3 vertexRect:(CGRect *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double width;
  double height;
  double v14;
  double v15;
  double v16;
  CGFloat x;
  CGFloat y;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;

  if (a3)
  {
    if (a4)
      goto LABEL_22;
    goto LABEL_13;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101234648);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DF5350();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101234668);
  v6 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLGPUDataBuffer p_addTransparentBorderInsetToTextureRect:vertexRect:]"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGLDataBuffer.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 1097, 0, "invalid nil value for '%{public}s'", "textureRect");

  if (!a4)
  {
LABEL_13:
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101234688);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF52B0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012346A8);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLGPUDataBuffer p_addTransparentBorderInsetToTextureRect:vertexRect:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGLDataBuffer.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 1098, 0, "invalid nil value for '%{public}s'", "vertexRect");

  }
LABEL_22:
  width = a3->size.width;
  if (width != 0.0)
  {
    height = a3->size.height;
    if (height != 0.0)
    {
      v14 = a4->size.width;
      if (v14 != 0.0)
      {
        v15 = a4->size.height;
        if (v15 != 0.0)
        {
          v16 = v14 / width;
          x = a3->origin.x;
          y = a3->origin.y;
          v19 = v15 / height;
          if (CGRectGetMinX(*(CGRect *)(&width - 2)) == 0.0)
            v20 = -1.0;
          else
            v20 = 0.0;
          if (CGRectGetMaxX(*a3) == 1.0)
            v21 = 1.0;
          else
            v21 = 0.0;
          if (CGRectGetMinY(*a3) == 0.0)
            v22 = -1.0;
          else
            v22 = 0.0;
          CGRectGetMaxY(*a3);
          v23 = v20 / v16 + CGRectGetMinX(*a3);
          v24 = v22 / v19 + CGRectGetMinY(*a3);
          v25 = v21 / v16 + CGRectGetMaxX(*a3);
          CGRectGetMaxY(*a3);
          v26 = sub_10005FDB0(v23, v24, v25);
          v28 = v27;
          v30 = v29;
          v32 = v31;
          v33 = CGRectGetMinX(*a4) + v20;
          v34 = CGRectGetMinY(*a4) + v22;
          v35 = CGRectGetMaxX(*a4) + v21;
          CGRectGetMaxY(*a4);
          v36 = sub_10005FDB0(v33, v34, v35);
          a3->origin.x = v26;
          a3->origin.y = v28;
          a3->size.width = v30;
          a3->size.height = v32;
          a4->origin.x = v36;
          a4->origin.y = v37;
          a4->size.width = v38;
          a4->size.height = v39;
        }
      }
    }
  }
}

- (CRLGPUDataBuffer)initWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 meshSize:(CGSize)a5 textureFlipped:(BOOL)a6 includeCenterAttribute:(BOOL)a7 addTransparentBorder:(BOOL)a8
{
  _BOOL4 v8;
  int height_low;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t v15;
  BOOL v16;
  id v17;
  CRLGLDataBufferAttribute *v18;
  CRLGLDataBufferAttribute *v19;
  CRLGLDataBufferAttribute *v20;
  CRLGPUDataBuffer *v21;
  double v22;
  uint64_t v23;
  unint64_t v24;
  float v25;
  double v26;
  float v27;
  double v28;
  unint64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v38;
  unint64_t v39;
  unint64_t v40;
  int width_low;
  CGRect v42;
  CGRect v43;
  double v44;
  double v45;
  CGRect v46;
  CGRect v47;

  v8 = a6;
  height_low = LODWORD(a5.height);
  width_low = LODWORD(a5.width);
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v43 = a3;
  v42 = a4;
  v47.origin.x = CGRectZero.origin.x;
  v47.origin.y = CGRectZero.origin.y;
  v47.size.width = CGRectZero.size.width;
  v47.size.height = CGRectZero.size.height;
  v46.origin.x = x;
  v46.origin.y = y;
  v46.size.width = width;
  v46.size.height = height;
  v16 = CGRectEqualToRect(v46, v47);
  if (v8)
    objc_msgSend((id)objc_opt_class(self, v15), "p_addTransparentBorderInsetToTextureRect:vertexRect:", &v42, &v43);
  v17 = objc_alloc_init((Class)NSMutableArray);
  v18 = -[CRLGLDataBufferAttribute initWithName:bufferUsage:dataType:normalized:componentCount:]([CRLGLDataBufferAttribute alloc], "initWithName:bufferUsage:dataType:normalized:componentCount:", CFSTR("Position"), 35044, 5, 0, 2);
  objc_msgSend(v17, "addObject:", v18);
  if (v16)
  {
    v19 = 0;
  }
  else
  {
    v19 = -[CRLGLDataBufferAttribute initWithName:bufferUsage:dataType:normalized:componentCount:]([CRLGLDataBufferAttribute alloc], "initWithName:bufferUsage:dataType:normalized:componentCount:", CFSTR("TexCoord"), 35044, 3, 1, 2);
    objc_msgSend(v17, "addObject:", v19);
  }
  if (height_low)
  {
    v20 = -[CRLGLDataBufferAttribute initWithName:bufferUsage:dataType:normalized:componentCount:]([CRLGLDataBufferAttribute alloc], "initWithName:bufferUsage:dataType:normalized:componentCount:", CFSTR("Center"), 35044, 5, 0, 2);
    objc_msgSend(v17, "addObject:", v20);
  }
  else
  {
    v20 = 0;
  }
  v38 = v17;
  v21 = -[CRLGPUDataBuffer initWithVertexAttributes:meshSize:bufferCount:](self, "initWithVertexAttributes:meshSize:bufferCount:", v17, 1, v44, v45);
  if (v21)
  {
    v21->_positionAttributeIndex = (unint64_t)objc_msgSend(v17, "indexOfObject:", v18);
    if (!v16)
      v21->_texCoordAttributeIndex = (unint64_t)objc_msgSend(v17, "indexOfObject:", v19);
    if (height_low)
      v21->_centerAttributeIndex = (unint64_t)objc_msgSend(v17, "indexOfObject:", v20);
    v22 = sub_100061400(v43.origin.x, v43.origin.y, v43.size.width, v43.size.height);
    v23 = 0;
    v24 = 0;
    v25 = v22;
    v39 = (unint64_t)(v45 + -1.0);
    v27 = v26;
    v28 = (double)(unint64_t)(v44 + -1.0);
    do
    {
      v29 = 0;
      v40 = v24;
      v30 = (double)v24 / (double)v39;
      do
      {
        v31 = sub_1000626CC((double)v29 / v28, v30, v43.origin.x, v43.origin.y, v43.size.width);
        *(float *)&v31 = v31;
        *(float *)&v32 = v32;
        -[CRLGPUDataBuffer setGLPoint2D:forAttribute:atIndex:](v21, "setGLPoint2D:forAttribute:atIndex:", v18, v23 + v29, v31, v32);
        if (!v16)
        {
          v35 = sub_1000626CC((double)v29 / v28, v30, v42.origin.x, v42.origin.y, v42.size.width);
          *(float *)&v35 = v35;
          *(float *)&v36 = v36;
          if (width_low)
            *(float *)&v36 = 1.0 - *(float *)&v36;
          -[CRLGPUDataBuffer setGLPoint2D:forAttribute:atIndex:](v21, "setGLPoint2D:forAttribute:atIndex:", v19, v23 + v29, v35, v36);
        }
        if (height_low)
        {
          *(float *)&v33 = v25;
          *(float *)&v34 = v27;
          -[CRLGPUDataBuffer setGLPoint2D:forAttribute:atIndex:](v21, "setGLPoint2D:forAttribute:atIndex:", v20, v23 + v29, v33, v34);
        }
        ++v29;
      }
      while (v29 <= (unint64_t)(v44 + -1.0));
      v24 = v40 + 1;
      v23 += v29;
    }
    while (v40 + 1 <= v39);
  }

  return v21;
}

+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 meshSize:(CGSize)a5 textureFlipped:(BOOL)a6
{
  return +[CRLGPUDataBuffer newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:includeCenterAttribute:](CRLGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:includeCenterAttribute:", *(_QWORD *)&a5.width, 0, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 meshSize:(CGSize)a5
{
  return +[CRLGPUDataBuffer newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:](CRLGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:", 1, *(_QWORD *)&a5.height, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4
{
  return +[CRLGPUDataBuffer newDataBufferWithVertexRect:textureRect:meshSize:](CRLGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:meshSize:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, 0x4000000000000000, 0x4000000000000000);
}

+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 textureFlipped:(BOOL)a5
{
  return +[CRLGPUDataBuffer newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:](CRLGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:", a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, 0x4000000000000000, 0x4000000000000000);
}

- (void)enableDataBuffer
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  MTLBuffer *v8;
  MTLBuffer *metalElementData;
  unsigned __int16 *gLElementData;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  if (self->_device)
  {
    self->_conformsToMetalProtocol = 1;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v3 = self->_arrayBuffers;
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "enableArrayBufferWithDevice:", self->_device, (_QWORD)v14);
        }
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v5);
    }

    if (!self->_metalElementData && self->_elementArrayCount)
    {
      -[CRLGPUDataBuffer p_setupElementArrayBufferIfNecessary](self, "p_setupElementArrayBufferIfNecessary");
      v8 = (MTLBuffer *)-[MTLDevice newBufferWithBytes:length:options:](self->_device, "newBufferWithBytes:length:options:", self->_gLElementData, 2 * self->_elementArrayCount, 0);
      metalElementData = self->_metalElementData;
      self->_metalElementData = v8;

      gLElementData = self->_gLElementData;
      if (gLElementData)
      {
        free(gLElementData);
        self->_gLElementData = 0;
      }
    }
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012346C8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF53F0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012346E8);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGPUDataBuffer enableDataBuffer]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGLDataBuffer.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 1233, 0, "Can't initialize metal buffers without a device!");

  }
}

+ (id)newDataBufferWithVertexAttributes:(id)a3 vertexCount:(unint64_t)a4 indexElementCount:(unint64_t)a5 device:(id)a6
{
  id v11;
  id v12;
  id *v13;

  v11 = a6;
  v12 = a3;
  v13 = (id *)objc_msgSend(objc_alloc((Class)a1), "initWithVertexAttributes:vertexCount:indexElementCount:bufferCount:", v12, a4, a5, 3);

  if (v13)
    objc_storeStrong(v13 + 12, a6);

  return v13;
}

+ (id)newDataBufferWithVertexAttributes:(id)a3 meshSize:(CGSize)a4 device:(id)a5
{
  double height;
  double width;
  id v8;
  id v9;
  void *v11;
  void *v12;
  void *v13;
  double *v14;
  double *v15;

  height = a4.height;
  width = a4.width;
  v8 = a3;
  v9 = a5;
  if (width <= 1.0 || height <= 1.0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101234708);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF5470();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101234728);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLGPUDataBuffer newDataBufferWithVertexAttributes:meshSize:device:]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGLDataBuffer.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 1261, 0, "Mesh size is not at least 2x2!");

  }
  v14 = +[CRLGPUDataBuffer newDataBufferWithVertexAttributes:vertexCount:indexElementCount:device:](CRLGPUDataBuffer, "newDataBufferWithVertexAttributes:vertexCount:indexElementCount:device:", v8, (unint64_t)(width * height), (unint64_t)((width + width) * (height + -1.0)), v9);
  v15 = v14;
  if (v14)
  {
    v14[8] = width;
    v14[9] = height;
  }

  return v15;
}

+ (id)newDataBufferWithVertexAttributes:(id)a3 quadParticleCount:(unint64_t)a4 device:(id)a5
{
  id result;

  result = +[CRLGPUDataBuffer newDataBufferWithVertexAttributes:vertexCount:indexElementCount:device:](CRLGPUDataBuffer, "newDataBufferWithVertexAttributes:vertexCount:indexElementCount:device:", a3, 4 * a4, 6 * a4, a5);
  if (result)
    *((_QWORD *)result + 10) = a4;
  return result;
}

+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 device:(id)a5
{
  return +[CRLGPUDataBuffer newDataBufferWithVertexRect:textureRect:meshSize:device:](CRLGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:meshSize:device:", a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, 0x4000000000000000, 0x4000000000000000);
}

+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 textureFlipped:(BOOL)a5 device:(id)a6
{
  return +[CRLGPUDataBuffer newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:device:](CRLGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:device:", a5, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, 0x4000000000000000, 0x4000000000000000);
}

+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 meshSize:(CGSize)a5 device:(id)a6
{
  return +[CRLGPUDataBuffer newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:device:](CRLGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:device:", 1, *(_QWORD *)&a5.width, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 meshSize:(CGSize)a5 textureFlipped:(BOOL)a6 device:(id)a7
{
  return +[CRLGPUDataBuffer newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:includeCenterAttribute:device:](CRLGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:includeCenterAttribute:device:", *(_QWORD *)&a5.width, 0, *(_QWORD *)&a5.height, a7, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 meshSize:(CGSize)a5 textureFlipped:(BOOL)a6 includeCenterAttribute:(BOOL)a7 device:(id)a8
{
  return +[CRLGPUDataBuffer newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:includeCenterAttribute:addTransparentBorder:device:](CRLGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:includeCenterAttribute:addTransparentBorder:device:", *(_QWORD *)&a5.width, *(_QWORD *)&a5.height, 1, a6, a8, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 meshSize:(CGSize)a5 textureFlipped:(BOOL)a6 includeCenterAttribute:(BOOL)a7 addTransparentBorder:(BOOL)a8 device:(id)a9
{
  _BOOL8 v9;
  _BOOL8 v10;
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  double v15;
  double v16;
  double v17;
  double v18;
  id v20;
  id *v21;
  id *v22;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t v27;

  v9 = a7;
  v10 = a6;
  height = a5.height;
  width = a5.width;
  v24 = a4.size.width;
  v25 = a4.size.height;
  y = a4.origin.y;
  x = a4.origin.x;
  v15 = a3.size.height;
  v16 = a3.size.width;
  v17 = a3.origin.y;
  v18 = a3.origin.x;
  v20 = (id)a7;
  v21 = (id *)objc_msgSend(objc_alloc((Class)a1), "initWithVertexRect:textureRect:meshSize:textureFlipped:includeCenterAttribute:addTransparentBorder:", *(_QWORD *)&width, *(_QWORD *)&height, v10, v18, v17, v16, v15, x, y, v24, v25, v26, v27);
  v22 = v21;
  if (v21)
    objc_storeStrong(v21 + 12, (id)v9);

  return v22;
}

- (void)teardown
{
  NSArray *vertexAttributes;
  NSMutableArray *arrayBuffers;
  NSMutableDictionary *attributeToArrayBuffersDictionary;
  unsigned __int16 *gLElementData;
  unsigned int *gLVertexArrayObjects;
  GLsizei v8;
  MTLBuffer *metalElementData;

  if (self->_didTeardown)
    return;
  vertexAttributes = self->_vertexAttributes;
  self->_vertexAttributes = 0;

  arrayBuffers = self->_arrayBuffers;
  self->_arrayBuffers = 0;

  attributeToArrayBuffersDictionary = self->_attributeToArrayBuffersDictionary;
  self->_attributeToArrayBuffersDictionary = 0;

  gLElementData = self->_gLElementData;
  if (gLElementData)
  {
    free(gLElementData);
    self->_gLElementData = 0;
  }
  if (self->_gLElementDataBuffer)
    glDeleteBuffers(1, &self->_gLElementDataBuffer);
  gLVertexArrayObjects = self->_gLVertexArrayObjects;
  if (self->_gLVertexArrayObjects[1])
  {
    v8 = 2;
LABEL_10:
    glDeleteVertexArrays(v8, gLVertexArrayObjects);
    goto LABEL_11;
  }
  if (*gLVertexArrayObjects)
  {
    v8 = 1;
    goto LABEL_10;
  }
LABEL_11:
  metalElementData = self->_metalElementData;
  if (metalElementData)
  {
    self->_metalElementData = 0;

  }
  self->_didTeardown = 1;
}

- (void)dealloc
{
  objc_super v3;

  -[CRLGPUDataBuffer teardown](self, "teardown");
  v3.receiver = self;
  v3.super_class = (Class)CRLGPUDataBuffer;
  -[CRLGPUDataBuffer dealloc](&v3, "dealloc");
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t elementArrayCount;
  unint64_t v7;
  const __CFString *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  __CFString **v14;
  unsigned int v15;
  const __CFString *v16;
  void *v17;
  NSString *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("vertexCount:%ld"), -[CRLGPUDataBuffer vertexCount](self, "vertexCount")));
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("elementArrayCount:%ld"), self->_elementArrayCount));
  objc_msgSend(v3, "addObject:", v5);

  elementArrayCount = self->_elementArrayCount;
  if (elementArrayCount)
  {
    v7 = 2 * elementArrayCount;
    if (2 * elementArrayCount <= 0x100000)
    {
      if (v7 < 0x401)
      {
        v10 = 0;
        goto LABEL_8;
      }
      v8 = CFSTR("(%0.1fKB)");
      v9 = 0.0009765625;
    }
    else
    {
      v8 = CFSTR("(%0.1fMB)");
      v9 = 0.000000953674316;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v9 * (double)v7));
LABEL_8:
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("elementBufferSize:%ldB%@"), v7, v10));
    objc_msgSend(v3, "addObject:", v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("arrayBuffers:%@"), self->_arrayBuffers));
  objc_msgSend(v3, "addObject:", v12);

  if (self->_conformsToMetalProtocol)
  {
    v13 = -[CRLGPUDataBuffer metalDrawMode](self, "metalDrawMode");
    if (v13 >= 5)
    {
      v16 = CFSTR("Unknown");
      goto LABEL_17;
    }
    v14 = &off_101234838[v13];
  }
  else
  {
    v15 = -[CRLGPUDataBuffer drawMode](self, "drawMode");
    if (v15 >= 7)
    {
      v16 = CFSTR("UNKNOWN");
      goto LABEL_17;
    }
    v14 = &off_101234860[v15];
  }
  v16 = *v14;
LABEL_17:
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("drawMode:%@"), v16));
  objc_msgSend(v3, "addObject:", v17);

  v23.receiver = self;
  v23.super_class = (Class)CRLGPUDataBuffer;
  v18 = -[CRLGPUDataBuffer description](&v23, "description");
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", CFSTR(",")));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: {%@}"), v19, v20));

  return (NSString *)v21;
}

- (void)setDrawMode:(unsigned int)a3
{
  self->_drawMode = a3;
}

- (unsigned)GLushortForIndexElement:(unint64_t)a3
{
  return self->_gLElementData[a3];
}

- (void)setGLushort:(unsigned __int16)a3 forIndexElement:(unint64_t)a4
{
  self->_gLElementData[a4] = a3;
}

- (void)enableGLElementArrayBuffer
{
  -[CRLGPUDataBuffer p_setupGLElementArrayBufferIfNecessary](self, "p_setupGLElementArrayBufferIfNecessary");
  if (self->_gLElementDataBufferWasSetup)
    glBindBuffer(0x8893u, self->_gLElementDataBuffer);
}

- (void)disableGLElementArrayBuffer
{
  if (self->_gLElementDataBufferWasSetup)
    glBindBuffer(0x8893u, 0);
}

- (void)setMetalDrawMode:(unint64_t)a3
{
  self->_metalDrawMode = a3;
}

- (void)disableWithDevice:(id)a3
{
  MTLBuffer *metalElementData;

  metalElementData = self->_metalElementData;
  self->_metalElementData = 0;

}

- (void)encodeWithEncoder:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  NSMutableArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v6 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_arrayBuffers;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11), "encodeArrayBufferWithEncoder:atIndex:", v6, (char *)v11 + a4, (_QWORD)v12);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      a4 += (unint64_t)v11;
    }
    while (v9);
  }

}

- (void)drawWithEncoder:(id)a3 atIndex:(unint64_t)a4 range:(_NSRange)a5
{
  -[CRLGPUDataBuffer drawWithEncoder:atIndex:range:advanceDynamicBuffer:](self, "drawWithEncoder:atIndex:range:advanceDynamicBuffer:", a3, a4, a5.location, a5.length, 1);
}

- (void)drawWithEncoder:(id)a3 atIndex:(unint64_t)a4 range:(_NSRange)a5 advanceDynamicBuffer:(BOOL)a6
{
  _BOOL4 v6;
  int length;
  NSUInteger location;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  double height;
  unint64_t v17;
  uint64_t v18;
  CGFloat v19;
  NSMutableArray *arrayBuffers;
  NSMutableArray *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v6 = a6;
  length = a5.length;
  location = a5.location;
  v11 = a3;
  -[CRLGPUDataBuffer enableDataBuffer](self, "enableDataBuffer");
  if (!self->_conformsToMetalProtocol)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101234748);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF54F0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101234768);
    v12 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGPUDataBuffer drawWithEncoder:atIndex:range:advanceDynamicBuffer:]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGLDataBuffer.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 1502, 0, "Can only be called on a buffer that conforms to metal protocol!");

  }
  -[CRLGPUDataBuffer encodeWithEncoder:atIndex:](self, "encodeWithEncoder:atIndex:", v11, a4);
  if (self->_gLElementDataBufferWasSetup && self->_elementArrayCount)
  {
    height = self->_gLElementMeshSize.height;
    if (self->_gLElementMeshSize.width == CGSizeZero.width && height == CGSizeZero.height)
    {
      objc_msgSend(v11, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", -[CRLGPUDataBuffer metalDrawMode](self, "metalDrawMode", height), length, 0, self->_metalElementData, 2 * location);
    }
    else if (height + -1.0 > 0.0)
    {
      v17 = 0;
      v18 = 1;
      do
      {
        objc_msgSend(v11, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", -[CRLGPUDataBuffer metalDrawMode](self, "metalDrawMode"), (unint64_t)(self->_gLElementMeshSize.width + self->_gLElementMeshSize.width), 0, self->_metalElementData, (unint64_t)(self->_gLElementMeshSize.width * (double)v17 + self->_gLElementMeshSize.width * (double)v17));
        v19 = (double)v18++;
        v17 += 2;
      }
      while (self->_gLElementMeshSize.height + -1.0 > v19);
    }
  }
  else
  {
    objc_msgSend(v11, "drawPrimitives:vertexStart:vertexCount:", -[CRLGPUDataBuffer metalDrawMode](self, "metalDrawMode"), (int)location, length);
  }
  if (-[CRLGPUDataBuffer isDynamicallyBuffered](self, "isDynamicallyBuffered") && v6)
  {
    arrayBuffers = self->_arrayBuffers;
    self->_currentBufferIndex = (self->_currentBufferIndex + 1) % 3;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v21 = arrayBuffers;
    v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(_QWORD *)v28 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v26, "bufferCount") != (id)1)
            objc_msgSend(v26, "setCurrentBufferIndex:", self->_currentBufferIndex);
        }
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v23);
    }

  }
}

- (void)drawWithEncoder:(id)a3 atIndex:(unint64_t)a4
{
  unint64_t elementArrayCount;

  elementArrayCount = self->_elementArrayCount;
  if (!elementArrayCount)
    elementArrayCount = self->_vertexCount;
  -[CRLGPUDataBuffer drawWithEncoder:atIndex:range:advanceDynamicBuffer:](self, "drawWithEncoder:atIndex:range:advanceDynamicBuffer:", a3, a4, 0, elementArrayCount, 1);
}

- (void)drawWithEncoder:(id)a3 atIndex:(unint64_t)a4 advanceDynamicBuffer:(BOOL)a5
{
  unint64_t elementArrayCount;

  elementArrayCount = self->_elementArrayCount;
  if (!elementArrayCount)
    elementArrayCount = self->_vertexCount;
  -[CRLGPUDataBuffer drawWithEncoder:atIndex:range:advanceDynamicBuffer:](self, "drawWithEncoder:atIndex:range:advanceDynamicBuffer:", a3, a4, 0, elementArrayCount, a5);
}

- (float)GLfloatForAttribute:(id)a3 atIndex:(unint64_t)a4
{
  id v5;
  void *v6;
  float v7;
  float v8;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataArrayBuffer"));
  objc_msgSend(v6, "GLfloatForAttribute:atIndex:", v5, a4);
  v8 = v7;

  return v8;
}

- (void)setGLfloat:(float)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5
{
  id v7;
  double v8;
  id v9;

  v7 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dataArrayBuffer"));
  *(float *)&v8 = a3;
  objc_msgSend(v9, "setGLfloat:forAttribute:atIndex:", v7, a5, v8);

}

- (void)setCGFloat:(double)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5
{
  *(float *)&a3 = a3;
  -[CRLGPUDataBuffer setGLfloat:forAttribute:atIndex:](self, "setGLfloat:forAttribute:atIndex:", a4, a5, a3);
}

- ($94F468A8D4C62B317260615823C2B210)GLPoint2DForAttribute:(id)a3 atIndex:(unint64_t)a4
{
  id v5;
  void *v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  $94F468A8D4C62B317260615823C2B210 result;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataArrayBuffer"));
  objc_msgSend(v6, "GLPoint2DForAttribute:atIndex:", v5, a4);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

- (void)setGLPoint2D:(id)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5
{
  float var1;
  float var0;
  id v8;
  double v9;
  double v10;
  id v11;

  var1 = a3.var1;
  var0 = a3.var0;
  v8 = a4;
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataArrayBuffer"));
  *(float *)&v9 = var0;
  *(float *)&v10 = var1;
  objc_msgSend(v11, "setGLPoint2D:forAttribute:atIndex:", v8, a5, v9, v10);

}

- ($E2C29196C7A5C696474C6955C5A9CE06)GLPoint3DForAttribute:(id)a3 atIndex:(unint64_t)a4
{
  id v5;
  void *v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  $E2C29196C7A5C696474C6955C5A9CE06 result;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataArrayBuffer"));
  objc_msgSend(v6, "GLPoint3DForAttribute:atIndex:", v5, a4);
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v8;
  v14 = v10;
  v15 = v12;
  result.var2 = v15;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (void)setGLPoint3D:(id)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5
{
  float var2;
  float var1;
  float var0;
  id v9;
  double v10;
  double v11;
  double v12;
  id v13;

  var2 = a3.var2;
  var1 = a3.var1;
  var0 = a3.var0;
  v9 = a4;
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dataArrayBuffer"));
  *(float *)&v10 = var0;
  *(float *)&v11 = var1;
  *(float *)&v12 = var2;
  objc_msgSend(v13, "setGLPoint3D:forAttribute:atIndex:", v9, a5, v10, v11, v12);

}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)GLPoint4DForAttribute:(id)a3 atIndex:(unint64_t)a4
{
  id v5;
  void *v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  $C28CD4A45FD07A4F97CC9D5F91F25271 result;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataArrayBuffer"));
  objc_msgSend(v6, "GLPoint4DForAttribute:atIndex:", v5, a4);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.var3 = v18;
  result.var2 = v17;
  result.var1 = v16;
  result.var0 = v15;
  return result;
}

- (void)setGLPoint4D:(id)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5
{
  float var3;
  float var2;
  float var1;
  float var0;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;

  var3 = a3.var3;
  var2 = a3.var2;
  var1 = a3.var1;
  var0 = a3.var0;
  v10 = a4;
  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dataArrayBuffer"));
  *(float *)&v11 = var0;
  *(float *)&v12 = var1;
  *(float *)&v13 = var2;
  *(float *)&v14 = var3;
  objc_msgSend(v15, "setGLPoint4D:forAttribute:atIndex:", v10, a5, v11, v12, v13, v14);

}

- (void)setDataForAttribute:(id)a3 atIndex:(unint64_t)a4 fromAttribute:(id)a5 dataBuffer:(id)a6 index:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  switch(objc_msgSend(v12, "componentCount"))
  {
    case 1u:
      objc_msgSend(v14, "GLfloatForAttribute:atIndex:", v13, a7);
      -[CRLGPUDataBuffer setGLfloat:forAttribute:atIndex:](self, "setGLfloat:forAttribute:atIndex:", v12, a4);
      break;
    case 2u:
      objc_msgSend(v14, "GLPoint2DForAttribute:atIndex:", v13, a7);
      -[CRLGPUDataBuffer setGLPoint2D:forAttribute:atIndex:](self, "setGLPoint2D:forAttribute:atIndex:", v12, a4);
      break;
    case 3u:
      objc_msgSend(v14, "GLPoint3DForAttribute:atIndex:", v13, a7);
      -[CRLGPUDataBuffer setGLPoint3D:forAttribute:atIndex:](self, "setGLPoint3D:forAttribute:atIndex:", v12, a4);
      break;
    case 4u:
      objc_msgSend(v14, "GLPoint4DForAttribute:atIndex:", v13, a7);
      -[CRLGPUDataBuffer setGLPoint4D:forAttribute:atIndex:](self, "setGLPoint4D:forAttribute:atIndex:", v12, a4);
      break;
    default:
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101234788);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF5570();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012347A8);
      v15 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGPUDataBuffer setDataForAttribute:atIndex:fromAttribute:dataBuffer:index:]"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGLDataBuffer.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 1626, 0, "Unknown attribute size!");

      break;
  }

}

- (id)vertexAttributeNamed:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGPUDataBuffer vertexAttributes](self, "vertexAttributes", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)updateDataBufferAttributesWithBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLGPUDataBuffer vertexAttributes](self, "vertexAttributes"));
  -[CRLGPUDataBuffer updateMetalDataBufferAttributes:withBlock:](self, "updateMetalDataBufferAttributes:withBlock:", v5, v4);

}

- (void)updateMetalDataBufferAttributes:(id)a3 withBlock:(id)a4
{
  void (**v6)(id, void *, id);
  char *v7;
  char *v8;
  void *v9;
  char *v10;
  char *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = (void (**)(id, void *, id))a4;
  if (v13 && objc_msgSend(v13, "count"))
  {
    self->_isUpdatingRawDataBuffer = 1;
    v7 = (char *)objc_msgSend(v13, "count");
    v8 = (char *)malloc_type_calloc(0x58uLL, (size_t)v7, 0x6992B64DuLL);
    v9 = v8;
    if (v7)
    {
      v10 = 0;
      v11 = v8;
      do
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndex:", v10));
        -[CRLGPUDataBuffer p_setAttributeUpdateData:fromAttribute:](self, "p_setAttributeUpdateData:fromAttribute:", v11, v12);

        ++v10;
        v11 += 88;
      }
      while (v7 != v10);
    }
    v6[2](v6, v9, v7);
    self->_isUpdatingRawDataBuffer = 0;
    free(v9);
  }

}

- (void)updateDataBufferAttributes:(id)a3 withBlock:(id)a4
{
  void (**v6)(id, void *, id);
  char *v7;
  uint64_t *v8;
  uint64_t *v9;
  char *v10;
  char *v11;
  void *v12;
  char *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v6 = (void (**)(id, void *, id))a4;
  if (v19 && objc_msgSend(v19, "count"))
  {
    self->_isUpdatingRawDataBuffer = 1;
    v7 = (char *)objc_msgSend(v19, "count");
    v8 = (uint64_t *)malloc_type_calloc(0x58uLL, (size_t)v7, 0x19C1D01uLL);
    v9 = v8;
    if (v7)
    {
      v10 = 0;
      v11 = (char *)v8;
      do
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndex:", v10));
        -[CRLGPUDataBuffer p_setAttributeUpdateData:fromAttribute:](self, "p_setAttributeUpdateData:fromAttribute:", v11, v12);

        ++v10;
        v11 += 88;
      }
      while (v7 != v10);
      v6[2](v6, v9, v7);
      self->_isUpdatingRawDataBuffer = 0;
      v13 = 0;
      v14 = v9 + 9;
      do
      {
        if ((*(_BYTE *)(v14 - 2) & 1) != 0)
        {
          v16 = *(v14 - 1);
          v15 = *v14;
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndex:", v13));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "dataArrayBuffer"));
          objc_msgSend(v18, "addIndexRangeNeedsUpdate:", v16, v15);

        }
        ++v13;
        v14 += 11;
      }
      while (v7 != v13);
    }
    else
    {
      v6[2](v6, v8, 0);
      self->_isUpdatingRawDataBuffer = 0;
    }
    free(v9);
  }

}

- (BOOL)p_setAttributeUpdateData:(id *)a3 fromAttribute:(id)a4
{
  id v6;
  void *v7;
  _BOOL4 isUpdatingRawDataBuffer;
  void *v9;
  void *v10;
  void *v11;
  NSUInteger var6;
  void *v13;
  void *v14;
  void *v15;

  v6 = a4;
  v7 = v6;
  isUpdatingRawDataBuffer = self->_isUpdatingRawDataBuffer;
  if (self->_isUpdatingRawDataBuffer)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dataArrayBuffer"));
    a3->var3 = (char *)objc_msgSend(v9, "dataPointer");

    a3->var0 = (int64_t)objc_msgSend(v7, "dataType");
    a3->var1 = (int)objc_msgSend(v7, "componentCount");
    a3->var2 = objc_msgSend(v7, "isNormalized");
    a3->var4 = (unint64_t)objc_msgSend(v7, "bufferOffset");
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dataArrayBuffer"));
    a3->var5 = (unint64_t)objc_msgSend(v10, "dataBufferEntrySize");

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dataArrayBuffer"));
    a3->var6 = (unint64_t)objc_msgSend(v11, "vertexCount");

    a3->var7 = 1;
    var6 = a3->var6;
    a3->var8.location = 0;
    a3->var8.length = var6;
    a3->var9 = sub_1000B376C((uint64_t)objc_msgSend(v7, "dataType"));
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012347C8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF55F0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012347E8);
    v13 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGPUDataBuffer p_setAttributeUpdateData:fromAttribute:]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGLDataBuffer.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 1703, 0, "Can only be called from within update block!");

  }
  return isUpdatingRawDataBuffer;
}

- (unint64_t)vertexCount
{
  return self->_vertexCount;
}

- (NSArray)vertexAttributes
{
  return (NSArray *)objc_getProperty(self, a2, 128, 1);
}

- (unsigned)drawMode
{
  return self->_drawMode;
}

- (BOOL)isDynamicallyBuffered
{
  return self->_isDynamicallyBuffered;
}

- (unint64_t)metalDrawMode
{
  return self->_metalDrawMode;
}

- (unint64_t)positionAttributeIndex
{
  return self->_positionAttributeIndex;
}

- (unint64_t)texCoordAttributeIndex
{
  return self->_texCoordAttributeIndex;
}

- (unint64_t)centerAttributeIndex
{
  return self->_centerAttributeIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vertexAttributes, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_metalElementData, 0);
  objc_storeStrong((id *)&self->_attributeToArrayBuffersDictionary, 0);
  objc_storeStrong((id *)&self->_arrayBuffers, 0);
}

@end
