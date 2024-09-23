@implementation TSDGPUDataBuffer

- (void)p_setupElementArrayBufferIfNecessary
{
  double width;
  double height;
  unint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;

  if (!self->_gLElementDataBufferWasSetup)
  {
    if (self->_gLElementData)
    {
      width = self->_gLElementMeshSize.width;
      height = self->_gLElementMeshSize.height;
      if (width != *MEMORY[0x24BDBF148] || height != *(double *)(MEMORY[0x24BDBF148] + 8))
      {
        if (height + -1.0 > 0.0)
        {
          v6 = 0;
          v7 = 0;
          v8 = 0.0;
          do
          {
            v9 = (double)++v6;
            if (width > 0.0)
            {
              v10 = 0.0;
              v11 = 1;
              do
              {
                v12 = v7 + 1;
                -[TSDGPUDataBuffer setGLushort:forIndexElement:](self, "setGLushort:forIndexElement:", (int)(v10 + v8 * width), v7);
                v7 += 2;
                -[TSDGPUDataBuffer setGLushort:forIndexElement:](self, "setGLushort:forIndexElement:", (int)(v10 + v9 * self->_gLElementMeshSize.width), v12);
                v10 = (double)v11;
                width = self->_gLElementMeshSize.width;
                ++v11;
              }
              while (width > v10);
              height = self->_gLElementMeshSize.height;
            }
            v8 = (double)v6;
          }
          while (height + -1.0 > v9);
          goto LABEL_21;
        }
        goto LABEL_20;
      }
      if (self->_gLElementQuadParticleCount)
      {
        -[TSDGPUDataBuffer setMetalDrawMode:](self, "setMetalDrawMode:", 3);
        if (self->_gLElementQuadParticleCount)
        {
          v13 = 0;
          v14 = 0;
          do
          {
            -[TSDGPUDataBuffer setGLushort:forIndexElement:](self, "setGLushort:forIndexElement:", 4 * (v13 & 0x3FFF), v14);
            -[TSDGPUDataBuffer setGLushort:forIndexElement:](self, "setGLushort:forIndexElement:", (unsigned __int16)(4 * v13) | 1u, v14 + 1);
            -[TSDGPUDataBuffer setGLushort:forIndexElement:](self, "setGLushort:forIndexElement:", (4 * (_DWORD)v13) & 0xFFFC | 2u, v14 + 2);
            -[TSDGPUDataBuffer setGLushort:forIndexElement:](self, "setGLushort:forIndexElement:", 4 * (v13 & 0x3FFF), v14 + 3);
            -[TSDGPUDataBuffer setGLushort:forIndexElement:](self, "setGLushort:forIndexElement:", (4 * (_DWORD)v13) & 0xFFFC | 2u, v14 + 4);
            v7 = v14 + 6;
            -[TSDGPUDataBuffer setGLushort:forIndexElement:](self, "setGLushort:forIndexElement:", (unsigned __int16)(4 * v13++) | 3u, v14 + 5);
            v14 += 6;
          }
          while (v13 < self->_gLElementQuadParticleCount);
          goto LABEL_21;
        }
LABEL_20:
        v7 = 0;
LABEL_21:
        if (v7 != self->_elementArrayCount)
        {
          objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGPUDataBuffer p_setupElementArrayBufferIfNecessary]");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUDataBuffer.m");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, v17, 796, CFSTR("Element array count Sanity check"));

        }
      }
    }
    self->_gLElementDataBufferWasSetup = 1;
  }
}

- (TSDGPUDataBuffer)initWithVertexAttributes:(id)a3 vertexCount:(unint64_t)a4 indexElementCount:(unint64_t)a5 bufferCount:(unint64_t)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  TSDGPUDataBuffer *v14;
  TSDGPUDataBuffer *v15;
  TSDGPUDataBuffer *v16;
  uint64_t v17;
  NSArray *vertexAttributes;
  NSMutableArray *v19;
  NSMutableArray *arrayBuffers;
  uint64_t v21;
  NSMutableDictionary *attributeToArrayBuffersDictionary;
  unint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  int v32;
  TSDGPUDataArrayBuffer *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  NSMutableDictionary *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  unint64_t count;
  id v47;
  void *v48;
  unint64_t v49;
  void *v50;
  unint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  objc_super v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v49 = a4;
  if (a4 < 0xFFFF)
  {
    v60.receiver = self;
    v60.super_class = (Class)TSDGPUDataBuffer;
    v15 = -[TSDGPUDataBuffer init](&v60, sel_init);
    v16 = v15;
    if (v15)
    {
      count = a5;
      -[TSDGPUDataBuffer setDrawMode:](v15, "setDrawMode:", 5);
      -[TSDGPUDataBuffer setMetalDrawMode:](v16, "setMetalDrawMode:", 4);
      v17 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", v10);
      vertexAttributes = v16->_vertexAttributes;
      v16->_vertexAttributes = (NSArray *)v17;

      v16->_vertexCount = a4;
      v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      arrayBuffers = v16->_arrayBuffers;
      v16->_arrayBuffers = v19;

      v21 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", -[NSArray count](v16->_vertexAttributes, "count"));
      attributeToArrayBuffersDictionary = v16->_attributeToArrayBuffersDictionary;
      v16->_attributeToArrayBuffersDictionary = (NSMutableDictionary *)v21;

      v16->_isDynamicallyBuffered = 1;
      v47 = v10;
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v10);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v48, "count"))
      {
        v23 = a6;
        do
        {
          objc_msgSend(v48, "objectAtIndex:", 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = 0u;
          v57 = 0u;
          v58 = 0u;
          v59 = 0u;
          v26 = v48;
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
          if (v27)
          {
            v28 = v27;
            v29 = *(_QWORD *)v57;
            do
            {
              for (i = 0; i != v28; ++i)
              {
                if (*(_QWORD *)v57 != v29)
                  objc_enumerationMutation(v26);
                v31 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
                v32 = objc_msgSend(v31, "bufferUsage");
                if (v32 == objc_msgSend(v24, "bufferUsage"))
                  objc_msgSend(v25, "addObject:", v31);
              }
              v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
            }
            while (v28);
          }

          if (objc_msgSend(v24, "bufferUsage") == 35044)
          {
            v16->_isDynamicallyBuffered = 0;
            v23 = 1;
          }
          v33 = -[TSDGPUDataArrayBuffer initWithVertexAttributes:vertexCount:bufferCount:]([TSDGPUDataArrayBuffer alloc], "initWithVertexAttributes:vertexCount:bufferCount:", v25, v49, v23);
          if (v33)
          {
            v50 = v25;
            v51 = v23;
            v54 = 0u;
            v55 = 0u;
            v52 = 0u;
            v53 = 0u;
            v34 = v25;
            v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
            if (v35)
            {
              v36 = v35;
              v37 = *(_QWORD *)v53;
              do
              {
                for (j = 0; j != v36; ++j)
                {
                  if (*(_QWORD *)v53 != v37)
                    objc_enumerationMutation(v34);
                  v39 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * j);
                  objc_msgSend(v39, "setDataBuffer:", v16);
                  v40 = v16->_attributeToArrayBuffersDictionary;
                  objc_msgSend(v39, "name");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSMutableDictionary setObject:forKey:](v40, "setObject:forKey:", v33, v41);

                }
                v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
              }
              while (v36);
            }

            -[NSMutableArray addObject:](v16->_arrayBuffers, "addObject:", v33);
            v25 = v50;
            v23 = v51;
          }
          else
          {
            objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGPUDataBuffer initWithVertexAttributes:vertexCount:indexElementCount:bufferCount:]");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUDataBuffer.m");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "handleFailureInFunction:file:lineNumber:description:", v43, v44, 844, CFSTR("Error creating array buffer!"));

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

      v10 = v47;
    }
    self = v16;
    v14 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGPUDataBuffer initWithVertexAttributes:vertexCount:indexElementCount:bufferCount:]");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUDataBuffer.m");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, v13, 807, CFSTR("Too many vertices!"));

    v14 = 0;
  }

  return v14;
}

- (TSDGPUDataBuffer)initWithVertexAttributes:(id)a3 meshSize:(CGSize)a4 bufferCount:(unint64_t)a5
{
  double height;
  double width;
  id v9;
  void *v11;
  void *v12;
  void *v13;
  TSDGPUDataBuffer *v14;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  if (width <= 1.0 || height <= 1.0)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGPUDataBuffer initWithVertexAttributes:meshSize:bufferCount:]");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUDataBuffer.m");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, v13, 866, CFSTR("Mesh size is not at least 2x2!"));

  }
  v14 = -[TSDGPUDataBuffer initWithVertexAttributes:vertexCount:indexElementCount:bufferCount:](self, "initWithVertexAttributes:vertexCount:indexElementCount:bufferCount:", v9, (unint64_t)(width * height), (unint64_t)((width + width) * (height + -1.0)), a5);
  v14->_gLElementMeshSize.width = width;
  v14->_gLElementMeshSize.height = height;

  return v14;
}

+ (id)newDataBufferWithVertexAttributes:(id)a3 vertexCount:(unint64_t)a4 indexElementCount:(unint64_t)a5
{
  id v8;
  void *v9;

  v8 = a3;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithVertexAttributes:vertexCount:indexElementCount:bufferCount:", v8, a4, a5, 2);

  return v9;
}

+ (id)newDataBufferWithVertexAttributes:(id)a3 meshSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithVertexAttributes:meshSize:bufferCount:", v7, 2, width, height);

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
  v9 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "initWithVertexAttributes:vertexCount:indexElementCount:bufferCount:", v8, v6, v7, 2);

  if (v9)
    v9[10] = a4;
  return v9;
}

+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 meshSize:(CGSize)a5 textureFlipped:(BOOL)a6 includeCenterAttribute:(BOOL)a7
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithVertexRect:textureRect:meshSize:textureFlipped:includeCenterAttribute:", *(_QWORD *)&a5.width, *(_QWORD *)&a5.height, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 meshSize:(CGSize)a5 textureFlipped:(BOOL)a6 includeCenterAttribute:(BOOL)a7 addTransparentBorder:(BOOL)a8
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithVertexRect:textureRect:meshSize:textureFlipped:includeCenterAttribute:addTransparentBorder:", *(_QWORD *)&a5.width, *(_QWORD *)&a5.height, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

+ (void)p_addTransparentBorderInsetToTextureRect:(CGRect *)a3 vertexRect:(CGRect *)a4
{
  double width;
  double height;
  double v8;
  double v9;
  double v10;
  CGFloat x;
  CGFloat y;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDGPUDataBuffer p_addTransparentBorderInsetToTextureRect:vertexRect:]");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUDataBuffer.m");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, v36, 918, CFSTR("invalid nil value for '%s'"), "textureRect");

    if (a4)
      goto LABEL_3;
LABEL_19:
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDGPUDataBuffer p_addTransparentBorderInsetToTextureRect:vertexRect:]");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUDataBuffer.m");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInFunction:file:lineNumber:description:", v38, v39, 919, CFSTR("invalid nil value for '%s'"), "vertexRect");

    goto LABEL_3;
  }
  if (!a4)
    goto LABEL_19;
LABEL_3:
  width = a3->size.width;
  if (width != 0.0)
  {
    height = a3->size.height;
    if (height != 0.0)
    {
      v8 = a4->size.width;
      if (v8 != 0.0)
      {
        v9 = a4->size.height;
        if (v9 != 0.0)
        {
          v10 = v8 / width;
          x = a3->origin.x;
          y = a3->origin.y;
          v13 = v9 / height;
          if (CGRectGetMinX(*(CGRect *)(&width - 2)) == 0.0)
            v14 = -1.0;
          else
            v14 = 0.0;
          if (CGRectGetMaxX(*a3) == 1.0)
            v15 = 1.0;
          else
            v15 = 0.0;
          if (CGRectGetMinY(*a3) == 0.0)
            v16 = -1.0;
          else
            v16 = 0.0;
          CGRectGetMaxY(*a3);
          v17 = v14 / v10 + CGRectGetMinX(*a3);
          v18 = v16 / v13 + CGRectGetMinY(*a3);
          v19 = v15 / v10 + CGRectGetMaxX(*a3);
          CGRectGetMaxY(*a3);
          v20 = TSDRectWithPoints(v17, v18, v19);
          v22 = v21;
          v24 = v23;
          v26 = v25;
          v27 = CGRectGetMinX(*a4) + v14;
          v28 = CGRectGetMinY(*a4) + v16;
          v29 = CGRectGetMaxX(*a4) + v15;
          CGRectGetMaxY(*a4);
          v30 = TSDRectWithPoints(v27, v28, v29);
          a3->origin.x = v20;
          a3->origin.y = v22;
          a3->size.width = v24;
          a3->size.height = v26;
          a4->origin.x = v30;
          a4->origin.y = v31;
          a4->size.width = v32;
          a4->size.height = v33;
        }
      }
    }
  }
}

- (TSDGPUDataBuffer)initWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 meshSize:(CGSize)a5 textureFlipped:(BOOL)a6 includeCenterAttribute:(BOOL)a7
{
  int height_low;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  BOOL v12;
  id v13;
  TSDGPUDataBufferAttribute *v14;
  TSDGPUDataBufferAttribute *v15;
  TSDGPUDataBufferAttribute *v16;
  TSDGPUDataBuffer *v17;
  double v18;
  uint64_t v19;
  unint64_t v20;
  float v21;
  double v22;
  float v23;
  double v24;
  unint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v34;
  unint64_t v35;
  unint64_t v36;
  double v37;
  double v38;
  double v39;
  int width_low;
  CGFloat height;
  double v42;
  double v43;

  height_low = LODWORD(a5.height);
  width_low = LODWORD(a5.width);
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v37 = a4.origin.x;
  v38 = a4.origin.y;
  v39 = a4.size.width;
  v12 = CGRectEqualToRect(a4, *MEMORY[0x24BDBF090]);
  v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v14 = -[TSDGPUDataBufferAttribute initWithName:bufferUsage:dataType:normalized:componentCount:]([TSDGPUDataBufferAttribute alloc], "initWithName:bufferUsage:dataType:normalized:componentCount:", CFSTR("Position"), 35044, 5, 0, 2);
  objc_msgSend(v13, "addObject:", v14);
  if (v12)
  {
    v15 = 0;
  }
  else
  {
    v15 = -[TSDGPUDataBufferAttribute initWithName:bufferUsage:dataType:normalized:componentCount:]([TSDGPUDataBufferAttribute alloc], "initWithName:bufferUsage:dataType:normalized:componentCount:", CFSTR("TexCoord"), 35044, 3, 1, 2);
    objc_msgSend(v13, "addObject:", v15);
  }
  if (height_low)
  {
    v16 = -[TSDGPUDataBufferAttribute initWithName:bufferUsage:dataType:normalized:componentCount:]([TSDGPUDataBufferAttribute alloc], "initWithName:bufferUsage:dataType:normalized:componentCount:", CFSTR("Center"), 35044, 5, 0, 2);
    objc_msgSend(v13, "addObject:", v16);
  }
  else
  {
    v16 = 0;
  }
  v17 = -[TSDGPUDataBuffer initWithVertexAttributes:meshSize:bufferCount:](self, "initWithVertexAttributes:meshSize:bufferCount:", v13, 1, v42, v43, v13);
  if (v17)
  {
    v17->_positionAttributeIndex = objc_msgSend(v34, "indexOfObject:", v14);
    if (!v12)
      v17->_texCoordAttributeIndex = objc_msgSend(v34, "indexOfObject:", v15);
    if (height_low)
      v17->_centerAttributeIndex = objc_msgSend(v34, "indexOfObject:", v16);
    v18 = TSDCenterOfRect(x, y, width, height);
    v19 = 0;
    v20 = 0;
    v21 = v18;
    v35 = (unint64_t)(v43 + -1.0);
    v23 = v22;
    v24 = (double)(unint64_t)(v42 + -1.0);
    do
    {
      v25 = 0;
      v36 = v20;
      v26 = (double)v20 / (double)v35;
      do
      {
        v27 = TSDPointFromNormalizedRect((double)v25 / v24, v26, x, y, width);
        *(float *)&v27 = v27;
        *(float *)&v28 = v28;
        -[TSDGPUDataBuffer setGLPoint2D:forAttribute:atIndex:](v17, "setGLPoint2D:forAttribute:atIndex:", v14, v19 + v25, v27, v28);
        if (!v12)
        {
          v31 = TSDPointFromNormalizedRect((double)v25 / v24, v26, v37, v38, v39);
          *(float *)&v31 = v31;
          *(float *)&v32 = v32;
          if (width_low)
            *(float *)&v32 = 1.0 - *(float *)&v32;
          -[TSDGPUDataBuffer setGLPoint2D:forAttribute:atIndex:](v17, "setGLPoint2D:forAttribute:atIndex:", v15, v19 + v25, v31, v32);
        }
        if (height_low)
        {
          *(float *)&v29 = v21;
          *(float *)&v30 = v23;
          -[TSDGPUDataBuffer setGLPoint2D:forAttribute:atIndex:](v17, "setGLPoint2D:forAttribute:atIndex:", v16, v19 + v25, v29, v30);
        }
        ++v25;
      }
      while (v25 <= (unint64_t)(v42 + -1.0));
      v20 = v36 + 1;
      v19 += v25;
    }
    while (v36 + 1 <= v35);
  }

  return v17;
}

+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 meshSize:(CGSize)a5 textureFlipped:(BOOL)a6
{
  return +[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:includeCenterAttribute:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:includeCenterAttribute:", *(_QWORD *)&a5.width, 0, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 meshSize:(CGSize)a5
{
  return +[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:", 1, *(_QWORD *)&a5.height, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4
{
  return +[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:meshSize:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:meshSize:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, 0x4000000000000000, 0x4000000000000000);
}

+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 textureFlipped:(BOOL)a5
{
  return +[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:", a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, 0x4000000000000000, 0x4000000000000000);
}

- (void)enableDataBuffer
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  MTLBuffer *v10;
  MTLBuffer *metalElementData;
  unsigned __int16 *gLElementData;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
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
        v7 = 0;
        do
        {
          if (*(_QWORD *)v15 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v7++), "enableArrayBufferWithDevice:", self->_device);
        }
        while (v5 != v7);
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v5);
    }

    if (!self->_metalElementData && self->_elementArrayCount)
    {
      -[TSDGPUDataBuffer p_setupElementArrayBufferIfNecessary](self, "p_setupElementArrayBufferIfNecessary");
      v10 = (MTLBuffer *)-[MTLDevice newBufferWithBytes:length:options:](self->_device, "newBufferWithBytes:length:options:", self->_gLElementData, 2 * self->_elementArrayCount, 0);
      metalElementData = self->_metalElementData;
      self->_metalElementData = v10;

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
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGPUDataBuffer enableDataBuffer]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUDataBuffer.m");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v8, v9, 1051, CFSTR("Can't initialize metal buffers without a device!"));

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
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDGPUDataBuffer newDataBufferWithVertexAttributes:meshSize:device:]");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUDataBuffer.m");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, v13, 1080, CFSTR("Mesh size is not at least 2x2!"));

  }
  v14 = +[TSDGPUDataBuffer newDataBufferWithVertexAttributes:vertexCount:indexElementCount:device:](TSDGPUDataBuffer, "newDataBufferWithVertexAttributes:vertexCount:indexElementCount:device:", v8, (unint64_t)(width * height), (unint64_t)((width + width) * (height + -1.0)), v9);
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

  result = +[TSDGPUDataBuffer newDataBufferWithVertexAttributes:vertexCount:indexElementCount:device:](TSDGPUDataBuffer, "newDataBufferWithVertexAttributes:vertexCount:indexElementCount:device:", a3, 4 * a4, 6 * a4, a5);
  if (result)
    *((_QWORD *)result + 10) = a4;
  return result;
}

+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 device:(id)a5
{
  return +[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:meshSize:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:meshSize:device:", a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, 0x4000000000000000, 0x4000000000000000);
}

+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 textureFlipped:(BOOL)a5 device:(id)a6
{
  return +[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:device:", a5, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, 0x4000000000000000, 0x4000000000000000);
}

+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 meshSize:(CGSize)a5 device:(id)a6
{
  return +[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:device:", 1, *(_QWORD *)&a5.width, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 meshSize:(CGSize)a5 textureFlipped:(BOOL)a6 device:(id)a7
{
  return +[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:includeCenterAttribute:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:includeCenterAttribute:device:", *(_QWORD *)&a5.width, 0, *(_QWORD *)&a5.height, a7, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 meshSize:(CGSize)a5 textureFlipped:(BOOL)a6 includeCenterAttribute:(BOOL)a7 device:(id)a8
{
  _BOOL8 v8;
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  double v13;
  double v14;
  double v15;
  double v16;
  id v18;
  uint64_t v19;
  void *v20;
  double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;

  v8 = a6;
  height = a5.height;
  width = a5.width;
  v22 = a4.size.width;
  v23 = a4.size.height;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a3.size.height;
  v14 = a3.size.width;
  v15 = a3.origin.y;
  v16 = a3.origin.x;
  v18 = (id)a6;
  v19 = objc_msgSend(objc_alloc((Class)a1), "initWithVertexRect:textureRect:meshSize:textureFlipped:includeCenterAttribute:", *(_QWORD *)&width, *(_QWORD *)&height, v16, v15, v14, v13, x, y, v22, v23, v24, v25);
  v20 = (void *)v19;
  if (v19)
    objc_storeStrong((id *)(v19 + 96), (id)v8);

  return v20;
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
  uint64_t v21;
  void *v22;
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
  v21 = objc_msgSend(objc_alloc((Class)a1), "initWithVertexRect:textureRect:meshSize:textureFlipped:includeCenterAttribute:addTransparentBorder:", *(_QWORD *)&width, *(_QWORD *)&height, v10, v18, v17, v16, v15, x, y, v24, v25, v26, v27);
  v22 = (void *)v21;
  if (v21)
    objc_storeStrong((id *)(v21 + 96), (id)v9);

  return v22;
}

- (void)teardown
{
  NSArray *vertexAttributes;
  NSMutableArray *arrayBuffers;
  NSMutableDictionary *attributeToArrayBuffersDictionary;
  unsigned __int16 *gLElementData;
  MTLBuffer *metalElementData;

  if (!self->_didTeardown)
  {
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
    metalElementData = self->_metalElementData;
    if (metalElementData)
    {
      self->_metalElementData = 0;

    }
    self->_didTeardown = 1;
  }
}

- (void)dealloc
{
  objc_super v3;

  -[TSDGPUDataBuffer teardown](self, "teardown");
  v3.receiver = self;
  v3.super_class = (Class)TSDGPUDataBuffer;
  -[TSDGPUDataBuffer dealloc](&v3, sel_dealloc);
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
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("vertexCount:%ld"), -[TSDGPUDataBuffer vertexCount](self, "vertexCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("elementArrayCount:%ld"), self->_elementArrayCount);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  elementArrayCount = self->_elementArrayCount;
  if (!elementArrayCount)
    goto LABEL_9;
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
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v8, v9 * (double)v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("elementBufferSize:%ldB%@"), v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v11);

LABEL_9:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("arrayBuffers:%@"), self->_arrayBuffers);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v12);

  v13 = -[TSDGPUDataBuffer metalDrawMode](self, "metalDrawMode");
  if (v13 > 4)
    v14 = CFSTR("Unknown");
  else
    v14 = off_24D82C478[v13];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("drawMode:%@"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v15);

  v16 = (void *)MEMORY[0x24BDD17C8];
  v21.receiver = self;
  v21.super_class = (Class)TSDGPUDataBuffer;
  -[TSDGPUDataBuffer description](&v21, sel_description);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%@: {%@}"), v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v19;
}

- (void)setDrawMode:(unsigned int)a3
{
  self->_drawMode = a3;
}

- (void)setGLushort:(unsigned __int16)a3 forIndexElement:(unint64_t)a4
{
  self->_gLElementData[a4] = a3;
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
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
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
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11), "encodeArrayBufferWithEncoder:atIndex:", v6, a4 + v11, (_QWORD)v12);
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      a4 += v11;
    }
    while (v9);
  }

}

- (void)drawWithEncoder:(id)a3 atIndex:(unint64_t)a4 range:(_NSRange)a5
{
  -[TSDGPUDataBuffer drawWithEncoder:atIndex:range:advanceDynamicBuffer:](self, "drawWithEncoder:atIndex:range:advanceDynamicBuffer:", a3, a4, a5.location, a5.length, 1);
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v6 = a6;
  length = a5.length;
  location = a5.location;
  v32 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  -[TSDGPUDataBuffer enableDataBuffer](self, "enableDataBuffer");
  if (!self->_conformsToMetalProtocol)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGPUDataBuffer drawWithEncoder:atIndex:range:advanceDynamicBuffer:]");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUDataBuffer.m");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, v14, 1264, CFSTR("Can only be called on a buffer that conforms to metal protocol!"));

  }
  -[TSDGPUDataBuffer encodeWithEncoder:atIndex:](self, "encodeWithEncoder:atIndex:", v11, a4);
  if (self->_gLElementDataBufferWasSetup && self->_elementArrayCount)
  {
    height = self->_gLElementMeshSize.height;
    if (self->_gLElementMeshSize.width == *MEMORY[0x24BDBF148] && height == *(double *)(MEMORY[0x24BDBF148] + 8))
    {
      objc_msgSend(v11, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", -[TSDGPUDataBuffer metalDrawMode](self, "metalDrawMode", height), length, 0, self->_metalElementData, 2 * location);
    }
    else if (height + -1.0 > 0.0)
    {
      v17 = 0;
      v18 = 1;
      do
      {
        objc_msgSend(v11, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", -[TSDGPUDataBuffer metalDrawMode](self, "metalDrawMode"), (unint64_t)(self->_gLElementMeshSize.width + self->_gLElementMeshSize.width), 0, self->_metalElementData, (unint64_t)(self->_gLElementMeshSize.width * (double)v17 + self->_gLElementMeshSize.width * (double)v17));
        v19 = (double)v18++;
        v17 += 2;
      }
      while (self->_gLElementMeshSize.height + -1.0 > v19);
    }
  }
  else
  {
    objc_msgSend(v11, "drawPrimitives:vertexStart:vertexCount:", -[TSDGPUDataBuffer metalDrawMode](self, "metalDrawMode"), (int)location, length);
  }
  if (-[TSDGPUDataBuffer isDynamicallyBuffered](self, "isDynamicallyBuffered") && v6)
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
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v28 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          if (objc_msgSend(v26, "bufferCount", (_QWORD)v27) != 1)
            objc_msgSend(v26, "setCurrentBufferIndex:", self->_currentBufferIndex);
        }
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v23);
    }

  }
  objc_msgSend(v11, "popDebugGroup", (_QWORD)v27);

}

- (void)drawWithEncoder:(id)a3 atIndex:(unint64_t)a4
{
  unint64_t elementArrayCount;

  elementArrayCount = self->_elementArrayCount;
  if (!elementArrayCount)
    elementArrayCount = self->_vertexCount;
  -[TSDGPUDataBuffer drawWithEncoder:atIndex:range:advanceDynamicBuffer:](self, "drawWithEncoder:atIndex:range:advanceDynamicBuffer:", a3, a4, 0, elementArrayCount, 1);
}

- (void)drawWithEncoder:(id)a3 atIndex:(unint64_t)a4 advanceDynamicBuffer:(BOOL)a5
{
  unint64_t elementArrayCount;

  elementArrayCount = self->_elementArrayCount;
  if (!elementArrayCount)
    elementArrayCount = self->_vertexCount;
  -[TSDGPUDataBuffer drawWithEncoder:atIndex:range:advanceDynamicBuffer:](self, "drawWithEncoder:atIndex:range:advanceDynamicBuffer:", a3, a4, 0, elementArrayCount, a5);
}

- (float)metalFloatForAttribute:(id)a3 atIndex:(unint64_t)a4
{
  id v5;
  void *v6;
  float v7;
  float v8;

  v5 = a3;
  objc_msgSend(v5, "dataArrayBuffer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "metalFloatForAttribute:atIndex:", v5, a4);
  v8 = v7;

  return v8;
}

- (void)setMetalFloat:(float)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5
{
  id v7;
  double v8;
  id v9;

  v7 = a4;
  objc_msgSend(v7, "dataArrayBuffer");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = a3;
  objc_msgSend(v9, "setMetalFloat:forAttribute:atIndex:", v7, a5, v8);

}

- (void)setCGFloat:(double)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5
{
  *(float *)&a3 = a3;
  -[TSDGPUDataBuffer setMetalFloat:forAttribute:atIndex:](self, "setMetalFloat:forAttribute:atIndex:", a4, a5, a3);
}

- ($94F468A8D4C62B317260615823C2B210)metalPoint2DForAttribute:(id)a3 atIndex:(unint64_t)a4
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
  objc_msgSend(v5, "dataArrayBuffer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "metalPoint2DForAttribute:atIndex:", v5, a4);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)metalPoint3DForAttribute:(id)a3 atIndex:(unint64_t)a4
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
  objc_msgSend(v5, "dataArrayBuffer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "metalPoint3DForAttribute:atIndex:", v5, a4);
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

- ($C28CD4A45FD07A4F97CC9D5F91F25271)metalPoint4DForAttribute:(id)a3 atIndex:(unint64_t)a4
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
  objc_msgSend(v5, "dataArrayBuffer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "metalPoint4DForAttribute:atIndex:", v5, a4);
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

- (void)setMetalPoint2D:(id)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5
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
  objc_msgSend(v8, "dataArrayBuffer");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v9 = var0;
  *(float *)&v10 = var1;
  objc_msgSend(v11, "setMetalPoint2D:forAttribute:atIndex:", v8, a5, v9, v10);

}

- (void)setMetalPoint3D:(id)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5
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
  objc_msgSend(v9, "dataArrayBuffer");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v10 = var0;
  *(float *)&v11 = var1;
  *(float *)&v12 = var2;
  objc_msgSend(v13, "setMetalPoint3D:forAttribute:atIndex:", v9, a5, v10, v11, v12);

}

- (void)setMetalPoint4D:(id)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5
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
  objc_msgSend(v10, "dataArrayBuffer");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v11 = var0;
  *(float *)&v12 = var1;
  *(float *)&v13 = var2;
  *(float *)&v14 = var3;
  objc_msgSend(v15, "setMetalPoint4D:forAttribute:atIndex:", v10, a5, v11, v12, v13, v14);

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
  objc_msgSend(v8, "dataArrayBuffer");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v9 = var0;
  *(float *)&v10 = var1;
  objc_msgSend(v11, "setMetalPoint2D:forAttribute:atIndex:", v8, a5, v9, v10);

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
  objc_msgSend(v5, "dataArrayBuffer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "metalPoint3DForAttribute:atIndex:", v5, a4);
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
  objc_msgSend(v9, "dataArrayBuffer");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v10 = var0;
  *(float *)&v11 = var1;
  *(float *)&v12 = var2;
  objc_msgSend(v13, "setMetalPoint3D:forAttribute:atIndex:", v9, a5, v10, v11, v12);

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
  objc_msgSend(v5, "dataArrayBuffer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "metalPoint4DForAttribute:atIndex:", v5, a4);
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
  objc_msgSend(v10, "dataArrayBuffer");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v11 = var0;
  *(float *)&v12 = var1;
  *(float *)&v13 = var2;
  *(float *)&v14 = var3;
  objc_msgSend(v15, "setMetalPoint4D:forAttribute:atIndex:", v10, a5, v11, v12, v13, v14);

}

- (void)setDataForAttribute:(id)a3 atIndex:(unint64_t)a4 fromAttribute:(id)a5 dataBuffer:(id)a6 index:(unint64_t)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v12 = a5;
  v13 = a6;
  switch(objc_msgSend(v17, "componentCount"))
  {
    case 1u:
      objc_msgSend(v13, "metalFloatForAttribute:atIndex:", v12, a7);
      -[TSDGPUDataBuffer setMetalFloat:forAttribute:atIndex:](self, "setMetalFloat:forAttribute:atIndex:", v17, a4);
      break;
    case 2u:
      objc_msgSend(v13, "metalPoint2DForAttribute:atIndex:", v12, a7);
      -[TSDGPUDataBuffer setGLPoint2D:forAttribute:atIndex:](self, "setGLPoint2D:forAttribute:atIndex:", v17, a4);
      break;
    case 3u:
      objc_msgSend(v13, "metalPoint3DForAttribute:atIndex:", v12, a7);
      -[TSDGPUDataBuffer setGLPoint3D:forAttribute:atIndex:](self, "setGLPoint3D:forAttribute:atIndex:", v17, a4);
      break;
    case 4u:
      objc_msgSend(v13, "metalPoint4DForAttribute:atIndex:", v12, a7);
      -[TSDGPUDataBuffer setGLPoint4D:forAttribute:atIndex:](self, "setGLPoint4D:forAttribute:atIndex:", v17, a4);
      break;
    default:
      objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGPUDataBuffer setDataForAttribute:atIndex:fromAttribute:dataBuffer:index:]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUDataBuffer.m");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, v16, 1411, CFSTR("Unknown attribute size!"));

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
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[TSDGPUDataBuffer vertexAttributes](self, "vertexAttributes", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
        objc_msgSend(v9, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
  -[TSDGPUDataBuffer vertexAttributes](self, "vertexAttributes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[TSDGPUDataBuffer updateMetalDataBufferAttributes:withBlock:](self, "updateMetalDataBufferAttributes:withBlock:", v5, v4);

}

- (void)updateMetalDataBufferAttributes:(id)a3 withBlock:(id)a4
{
  void (**v6)(id, void *, size_t);
  size_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  char *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = (void (**)(id, void *, size_t))a4;
  if (v13 && objc_msgSend(v13, "count"))
  {
    self->_isUpdatingRawDataBuffer = 1;
    v7 = objc_msgSend(v13, "count");
    v8 = (char *)malloc_type_calloc(0x58uLL, v7, 0x76CA510uLL);
    v9 = v8;
    if (v7)
    {
      v10 = 0;
      v11 = v8;
      do
      {
        objc_msgSend(v13, "objectAtIndex:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[TSDGPUDataBuffer p_setAttributeUpdateData:fromAttribute:](self, "p_setAttributeUpdateData:fromAttribute:", v11, v12);

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
  void (**v6)(id, void *, size_t);
  size_t v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v6 = (void (**)(id, void *, size_t))a4;
  if (v19 && objc_msgSend(v19, "count"))
  {
    self->_isUpdatingRawDataBuffer = 1;
    v7 = objc_msgSend(v19, "count");
    v8 = (uint64_t *)malloc_type_calloc(0x58uLL, v7, 0x5BBB350CuLL);
    v9 = v8;
    if (v7)
    {
      v10 = 0;
      v11 = (char *)v8;
      do
      {
        objc_msgSend(v19, "objectAtIndex:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[TSDGPUDataBuffer p_setAttributeUpdateData:fromAttribute:](self, "p_setAttributeUpdateData:fromAttribute:", v11, v12);

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
          objc_msgSend(v19, "objectAtIndex:", v13);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "dataArrayBuffer");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
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

- (TSDGPUDataBuffer)initWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 meshSize:(CGSize)a5 textureFlipped:(BOOL)a6 includeCenterAttribute:(BOOL)a7 addTransparentBorder:(BOOL)a8
{
  _BOOL4 v8;
  int height_low;
  BOOL v11;
  id v12;
  TSDGPUDataBufferAttribute *v13;
  TSDGPUDataBufferAttribute *v14;
  TSDGPUDataBufferAttribute *v15;
  TSDGPUDataBuffer *v16;
  double v17;
  uint64_t v18;
  unint64_t v19;
  float v20;
  double v21;
  float v22;
  double v23;
  unint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v33;
  unint64_t v34;
  unint64_t v35;
  int width_low;
  CGRect v37;
  CGRect v38;
  double v39;
  double v40;

  v8 = a6;
  height_low = LODWORD(a5.height);
  width_low = LODWORD(a5.width);
  v38 = a3;
  v37 = a4;
  v11 = CGRectEqualToRect(a4, *MEMORY[0x24BDBF090]);
  if (v8)
    objc_msgSend((id)objc_opt_class(), "p_addTransparentBorderInsetToTextureRect:vertexRect:", &v37, &v38);
  v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v13 = -[TSDGPUDataBufferAttribute initWithName:bufferUsage:dataType:normalized:componentCount:]([TSDGPUDataBufferAttribute alloc], "initWithName:bufferUsage:dataType:normalized:componentCount:", CFSTR("Position"), 35044, 5, 0, 2);
  objc_msgSend(v12, "addObject:", v13);
  if (v11)
  {
    v14 = 0;
  }
  else
  {
    v14 = -[TSDGPUDataBufferAttribute initWithName:bufferUsage:dataType:normalized:componentCount:]([TSDGPUDataBufferAttribute alloc], "initWithName:bufferUsage:dataType:normalized:componentCount:", CFSTR("TexCoord"), 35044, 3, 1, 2);
    objc_msgSend(v12, "addObject:", v14);
  }
  if (height_low)
  {
    v15 = -[TSDGPUDataBufferAttribute initWithName:bufferUsage:dataType:normalized:componentCount:]([TSDGPUDataBufferAttribute alloc], "initWithName:bufferUsage:dataType:normalized:componentCount:", CFSTR("Center"), 35044, 5, 0, 2);
    objc_msgSend(v12, "addObject:", v15);
  }
  else
  {
    v15 = 0;
  }
  v33 = v12;
  v16 = -[TSDGPUDataBuffer initWithVertexAttributes:meshSize:bufferCount:](self, "initWithVertexAttributes:meshSize:bufferCount:", v12, 1, v39, v40);
  if (v16)
  {
    v16->_positionAttributeIndex = objc_msgSend(v12, "indexOfObject:", v13);
    if (!v11)
      v16->_texCoordAttributeIndex = objc_msgSend(v12, "indexOfObject:", v14);
    if (height_low)
      v16->_centerAttributeIndex = objc_msgSend(v12, "indexOfObject:", v15);
    v17 = TSDCenterOfRect(v38.origin.x, v38.origin.y, v38.size.width, v38.size.height);
    v18 = 0;
    v19 = 0;
    v20 = v17;
    v34 = (unint64_t)(v40 + -1.0);
    v22 = v21;
    v23 = (double)(unint64_t)(v39 + -1.0);
    do
    {
      v24 = 0;
      v35 = v19;
      v25 = (double)v19 / (double)v34;
      do
      {
        v26 = TSDPointFromNormalizedRect((double)v24 / v23, v25, v38.origin.x, v38.origin.y, v38.size.width);
        *(float *)&v26 = v26;
        *(float *)&v27 = v27;
        -[TSDGPUDataBuffer setGLPoint2D:forAttribute:atIndex:](v16, "setGLPoint2D:forAttribute:atIndex:", v13, v18 + v24, v26, v27);
        if (!v11)
        {
          v30 = TSDPointFromNormalizedRect((double)v24 / v23, v25, v37.origin.x, v37.origin.y, v37.size.width);
          *(float *)&v30 = v30;
          *(float *)&v31 = v31;
          if (width_low)
            *(float *)&v31 = 1.0 - *(float *)&v31;
          -[TSDGPUDataBuffer setGLPoint2D:forAttribute:atIndex:](v16, "setGLPoint2D:forAttribute:atIndex:", v14, v18 + v24, v30, v31);
        }
        if (height_low)
        {
          *(float *)&v28 = v20;
          *(float *)&v29 = v22;
          -[TSDGPUDataBuffer setGLPoint2D:forAttribute:atIndex:](v16, "setGLPoint2D:forAttribute:atIndex:", v15, v18 + v24, v28, v29);
        }
        ++v24;
      }
      while (v24 <= (unint64_t)(v39 + -1.0));
      v19 = v35 + 1;
      v18 += v24;
    }
    while (v35 + 1 <= v34);
  }

  return v16;
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
    objc_msgSend(v6, "dataArrayBuffer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    a3->var3 = (char *)objc_msgSend(v9, "dataPointer");

    a3->var0 = objc_msgSend(v7, "dataType");
    a3->var1 = (int)objc_msgSend(v7, "componentCount");
    a3->var2 = objc_msgSend(v7, "isNormalized");
    a3->var4 = objc_msgSend(v7, "bufferOffset");
    objc_msgSend(v7, "dataArrayBuffer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    a3->var5 = objc_msgSend(v10, "dataBufferEntrySize");

    objc_msgSend(v7, "dataArrayBuffer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    a3->var6 = objc_msgSend(v11, "vertexCount");

    a3->var7 = 1;
    var6 = a3->var6;
    a3->var8.location = 0;
    a3->var8.length = var6;
    a3->var9 = TSDGPUDataBufferDataTypeSize(objc_msgSend(v7, "dataType"));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGPUDataBuffer p_setAttributeUpdateData:fromAttribute:]");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUDataBuffer.m");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, v15, 1572, CFSTR("Can only be called from within update block!"));

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
