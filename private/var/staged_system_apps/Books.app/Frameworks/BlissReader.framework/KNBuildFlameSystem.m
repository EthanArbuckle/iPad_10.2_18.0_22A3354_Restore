@implementation KNBuildFlameSystem

- (void)dealloc
{
  objc_super v3;

  free(self->_bottomRow);
  v3.receiver = self;
  v3.super_class = (Class)KNBuildFlameSystem;
  -[KNBuildFlameSystem dealloc](&v3, "dealloc");
}

+ (BOOL)willOverrideStartingPoints
{
  return 1;
}

- (CGPoint)startingPointAtIndexPoint:(CGPoint)a3
{
  void *v4;
  CGPoint *v5;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KNBuildFlameSystem randomGenerator](self, "randomGenerator", a3.x, a3.y));
  if (self->_bottomRow)
  {
    do
    {
      v5 = &self->_bottomRow[(_QWORD)objc_msgSend(v4, "intBetween::", 0, self->_bottomRowCount - 1)];
      y = v5->y;
    }
    while (y == -1.0);
    x = v5->x;
  }
  else
  {
    x = CGPointZero.x;
    y = CGPointZero.y;
  }
  -[KNBuildFlameSystem objectSize](self, "objectSize");
  v9 = x * v8;
  -[KNBuildFlameSystem objectSize](self, "objectSize");
  v11 = y * v10;

  v12 = v9;
  v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)speedAtIndexPoint:(CGPoint)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  float v9;
  double v10;
  double height;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  float v20;
  float v21;
  float v22;
  $E2C29196C7A5C696474C6955C5A9CE06 result;

  v4 = -[KNBuildFlameSystem indexFromPoint:](self, "indexFromPoint:", a3.x, a3.y);
  v6 = (_QWORD)objc_msgSend((id)objc_opt_class(self, v5), "numberOfVerticesPerParticle") * (_QWORD)v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KNBuildFlameSystem dataBuffer](self, "dataBuffer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KNBuildFlameSystem positionAttribute](self, "positionAttribute"));
  objc_msgSend(v7, "metalPoint2DForAttribute:atIndex:", v8, v6);
  v10 = v9;

  height = self->_actualSize.height;
  if (height <= v10)
    v12 = self->_actualSize.height;
  else
    v12 = v10;
  v13 = v12 * 0.9 + height * 0.2;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[KNBuildFlameSystem randomGenerator](self, "randomGenerator"));
  objc_msgSend(v14, "doubleBetween::", 0.0, 0.1);
  v16 = v13 * (v15 + 1.0);

  -[KNBuildFlameSystem speedMax](self, "speedMax");
  v18 = 1.0 / v17;
  *(float *)&v16 = v16;
  v19 = v18 * *(float *)&v16;
  v20 = v18 * 0.0;
  v21 = v19;
  v22 = v20;
  result.var2 = v22;
  result.var1 = v21;
  result.var0 = v20;
  return result;
}

- (double)speedMax
{
  return self->_actualSize.height * 1.1 * 1.1;
}

- ($94F468A8D4C62B317260615823C2B210)lifeSpanAtIndexPoint:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  BOOL v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  id v15;
  float v16;
  float v17;
  $94F468A8D4C62B317260615823C2B210 result;

  y = a3.y;
  x = a3.x;
  -[KNBuildFlameSystem duration](self, "duration");
  v7 = 1.0 / v6;
  v8 = v6 <= 2.0;
  v9 = 0.5;
  if (!v8)
    v9 = v7;
  if (v9 <= 1.0)
    v10 = v9;
  else
    v10 = 1.0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[KNBuildFlameSystem randomGenerator](self, "randomGenerator"));
  objc_msgSend(v11, "doubleBetween::", 0.8, 1.0);
  v13 = v12 * v10;

  v14 = (double)(unint64_t)-[KNBuildFlameSystem indexFromPoint:](self, "indexFromPoint:", x, y);
  v15 = -[KNBuildFlameSystem particleCount](self, "particleCount");
  v16 = (1.0 - v13)
      * (v14 / (double)(unint64_t)v15 * 0.75
       + v14 / (double)(unint64_t)v15 * (v14 / (double)(unint64_t)v15) * 0.25);
  v17 = v13;
  result.var1 = v17;
  result.var0 = v16;
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)rotationAtIndexPoint:(CGPoint)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  float v9;
  float v10;
  float v11;
  float v12;
  $E2C29196C7A5C696474C6955C5A9CE06 result;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KNBuildFlameSystem randomGenerator](self, "randomGenerator", a3.x, a3.y));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KNBuildFlameSystem randomGenerator](self, "randomGenerator"));
  objc_msgSend(v5, "doubleBetween::", -1.0, 1.0);
  v7 = v6;
  objc_msgSend(v4, "doubleBetween::", -1.0, 1.0);
  v9 = v8;

  v10 = 0.0;
  *(float *)&v7 = v7;
  v11 = *(float *)&v7;
  v12 = v9;
  result.var2 = v12;
  result.var1 = v10;
  result.var0 = v11;
  return result;
}

- (double)rotationMax
{
  return 6.28318531;
}

+ (BOOL)useVisibilities
{
  return 0;
}

- (void)p_setupBottomRowWithMetalTexture:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 bakedScale:(double)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  unint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _OWORD *v29;
  CGPoint *v30;
  double x;
  double y;
  char v33;
  unint64_t v34;
  double *p_y;
  double v36;
  double v37;
  __int128 v38;
  double v39;
  float v40;
  double v41;
  double v42;
  double v43;
  BOOL v44;
  double v45;
  unint64_t v46;
  uint64_t v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v54;
  KNBuildFlameSystem *v55;
  unint64_t v56;
  int64x2_t v57;
  uint64_t v58;
  int64x2_t v59;
  unsigned int v60;
  id v61;
  id v62[2];

  v9 = a3;
  v55 = self;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KNBuildFlameSystem metalContext](self, "metalContext"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "device"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[TSDMetalShaderLibraryLoader loadApplicationLibraryWithDevice:library:](TSDMetalShaderLibraryLoader, "loadApplicationLibraryWithDevice:library:", v11, CFSTR("KeynoteMetalLibrary")));
  v13 = objc_msgSend(v12, "newFunctionWithName:", CFSTR("buildFlameBottomRowComputeShader"));
  v14 = objc_msgSend(v11, "newBufferWithBytes:length:options:", malloc_type_malloc(16 * a4, 0x1000040451B5BE8uLL), 16 * a4, 0);
  v15 = objc_alloc_init((Class)MTLComputePipelineDescriptor);
  v54 = v13;
  objc_msgSend(v15, "setComputeFunction:", v13);
  v16 = objc_alloc_init((Class)MTLBufferLayoutDescriptor);
  objc_msgSend(v16, "setStride:", 16);
  objc_msgSend(v16, "setStepRate:", 1);
  objc_msgSend(v16, "setStepFunction:", 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stageInputDescriptor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "layouts"));
  objc_msgSend(v18, "setObject:atIndexedSubscript:", v16, 0);

  v61 = 0;
  v62[0] = 0;
  v19 = objc_msgSend(v11, "newComputePipelineStateWithDescriptor:options:reflection:error:", v15, 0, v62, &v61);
  v20 = v62[0];
  v21 = v61;
  v22 = v21;
  if (v19)
  {
    v48 = v21;
    v49 = v20;
    v50 = v12;
    v51 = v11;
    v23 = (unint64_t)objc_msgSend(v19, "threadExecutionWidth");
    v46 = ((unint64_t)objc_msgSend(v9, "width") + v23 - 1) / v23;
    v24 = v9;
    if (a6 <= 1.0)
      a6 = TSUClamp((double)(a5 / 0x3E8), 1.0, 4.0);
    v60 = a6;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[KNBuildFlameSystem metalContext](v55, "metalContext", v46));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "commandQueue"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "commandBuffer"));

    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "computeCommandEncoder"));
    objc_msgSend(v28, "setComputePipelineState:", v19);
    objc_msgSend(v28, "setBuffer:offset:atIndex:", v14, 0, 0);
    objc_msgSend(v28, "setBytes:length:atIndex:", &v60, 4, 1);
    v52 = v24;
    objc_msgSend(v28, "setTexture:atIndex:", v24, 0);
    v58 = v47;
    v59 = vdupq_n_s64(1uLL);
    v56 = v23;
    v57 = v59;
    objc_msgSend(v28, "dispatchThreadgroups:threadsPerThreadgroup:", &v58, &v56);
    objc_msgSend(v28, "endEncoding");
    objc_msgSend(v27, "commit");
    objc_msgSend(v27, "waitUntilCompleted");
    v29 = objc_msgSend(objc_retainAutorelease(v14), "contents");
    v30 = (CGPoint *)malloc_type_malloc(16 * a4, 0x1000040451B5BE8uLL);
    v55->_bottomRow = v30;
    v55->_bottomRowCount = a4;
    x = CGPointZero.x;
    y = CGPointZero.y;
    v33 = 0;
    if (a4)
    {
      v34 = 0;
      p_y = &v30->y;
      v36 = (double)a4;
      v37 = (double)a5;
      v11 = v51;
      do
      {
        v38 = v29[v34];
        v39 = *(float *)&v38 / (double)a4;
        LODWORD(v40) = HIDWORD(*(_QWORD *)&v29[v34]);
        v41 = v40;
        v42 = (double)v34;
        if (v36 >= (double)v34)
          v43 = (double)v34;
        else
          v43 = v36;
        *(double *)&v38 = *((float *)&v38 + 2);
        if (v37 < *((float *)&v38 + 2))
          *(double *)&v38 = v37;
        if (x >= v42)
          v42 = x;
        if (y >= v41)
          v41 = y;
        v44 = v40 <= -1.0;
        if (v40 > -1.0)
          v45 = v40 / (double)a5;
        else
          v45 = -1.0;
        if (!v44)
        {
          y = v41;
          x = v42;
          v37 = *(double *)&v38;
          v36 = v43;
          v33 = 1;
        }
        *(p_y - 1) = v39;
        *p_y = v45;
        ++v34;
        p_y += 2;
      }
      while (a4 != v34);
    }
    else
    {
      v37 = (double)a5;
      v36 = (double)0;
      v11 = v51;
    }
    -[KNBuildFlameSystem setShouldDraw:](v55, "setShouldDraw:", v33 & 1);
    v55->_actualSize.width = x - v36;
    v55->_actualSize.height = y - v37;

    v9 = v52;
    v12 = v50;
    v22 = v48;
    v20 = v49;
  }

}

- (void)p_setupParticleDataWithTexture:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  double height;
  unint64_t v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  CGFloat v21;
  CGFloat v22;
  double MidX;
  float v24;
  float MidY;
  void *v26;
  CGFloat MinX;
  float MinY;
  void *v29;
  double v30;
  double v31;
  void *v32;
  CGFloat MaxX;
  float v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  CGFloat v39;
  float MaxY;
  void *v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  uint64_t i;
  void *v50;
  void *v51;
  double v52;
  double v53;
  objc_super v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;

  v4 = a3;
  -[KNBuildFlameSystem setShouldDraw:](self, "setShouldDraw:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KNBuildFlameSystem metalContext](self, "metalContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metalTextureWithContext:", v5));

  if (v6)
  {
    v7 = objc_msgSend(v6, "width");
    v8 = objc_msgSend(v6, "height");
    objc_msgSend(v4, "bakedScale");
    -[KNBuildFlameSystem p_setupBottomRowWithMetalTexture:width:height:bakedScale:](self, "p_setupBottomRowWithMetalTexture:width:height:bakedScale:", v6, v7, v8);
  }
  if (-[KNBuildFlameSystem shouldDraw](self, "shouldDraw"))
  {
    v54.receiver = self;
    v54.super_class = (Class)KNBuildFlameSystem;
    -[KNBuildFlameSystem p_setupParticleDataWithTexture:](&v54, "p_setupParticleDataWithTexture:", 0);
    height = self->_actualSize.height;
    if (((unint64_t)-[KNBuildFlameSystem particleCount](self, "particleCount") & 0x3FFFFFFFFFFFFFFFLL) != 0)
    {
      v10 = 0;
      v11 = height * 0.5;
      v12 = v11 * 0.5;
      do
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[KNBuildFlameSystem dataBuffer](self, "dataBuffer"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[KNBuildFlameSystem positionAttribute](self, "positionAttribute"));
        objc_msgSend(v13, "metalPoint2DForAttribute:atIndex:", v14, v10);
        v16 = v15;
        v18 = v17;

        v19 = v16 - v12;
        v20 = v18 - v12;
        v21 = v19;
        v22 = v20;
        v55.origin.x = v19;
        v55.origin.y = v20;
        v55.size.width = v11;
        v55.size.height = v11;
        MidX = CGRectGetMidX(v55);
        v56.origin.x = v21;
        v56.origin.y = v22;
        v56.size.width = v11;
        v56.size.height = v11;
        v24 = MidX;
        MidY = CGRectGetMidY(v56);
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[KNBuildFlameSystem dataBuffer](self, "dataBuffer"));
        v57.origin.x = v21;
        v57.origin.y = v22;
        v57.size.width = v11;
        v57.size.height = v11;
        MinX = CGRectGetMinX(v57);
        v58.origin.x = v21;
        v58.origin.y = v22;
        v58.size.width = v11;
        v58.size.height = v11;
        MinY = CGRectGetMinY(v58);
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[KNBuildFlameSystem positionAttribute](self, "positionAttribute"));
        *(float *)&MinX = MinX;
        LODWORD(v30) = LODWORD(MinX);
        *(float *)&v31 = MinY;
        objc_msgSend(v26, "setMetalPoint2D:forAttribute:atIndex:", v29, v10, v30, v31);

        v32 = (void *)objc_claimAutoreleasedReturnValue(-[KNBuildFlameSystem dataBuffer](self, "dataBuffer"));
        v59.origin.x = v21;
        v59.origin.y = v22;
        v59.size.width = v11;
        v59.size.height = v11;
        MaxX = CGRectGetMaxX(v59);
        v60.origin.x = v21;
        v60.origin.y = v22;
        v60.size.width = v11;
        v60.size.height = v11;
        v34 = CGRectGetMinY(v60);
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[KNBuildFlameSystem positionAttribute](self, "positionAttribute"));
        *(float *)&MaxX = MaxX;
        LODWORD(v36) = LODWORD(MaxX);
        *(float *)&v37 = v34;
        objc_msgSend(v32, "setMetalPoint2D:forAttribute:atIndex:", v35, v10 | 1, v36, v37);

        v38 = (void *)objc_claimAutoreleasedReturnValue(-[KNBuildFlameSystem dataBuffer](self, "dataBuffer"));
        v61.origin.x = v21;
        v61.origin.y = v22;
        v61.size.width = v11;
        v61.size.height = v11;
        v39 = CGRectGetMaxX(v61);
        v62.origin.x = v21;
        v62.origin.y = v22;
        v62.size.width = v11;
        v62.size.height = v11;
        MaxY = CGRectGetMaxY(v62);
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[KNBuildFlameSystem positionAttribute](self, "positionAttribute"));
        *(float *)&v39 = v39;
        LODWORD(v42) = LODWORD(v39);
        *(float *)&v43 = MaxY;
        objc_msgSend(v38, "setMetalPoint2D:forAttribute:atIndex:", v41, v10 | 2, v42, v43);

        v44 = (void *)objc_claimAutoreleasedReturnValue(-[KNBuildFlameSystem dataBuffer](self, "dataBuffer"));
        v63.origin.x = v21;
        v63.origin.y = v22;
        v63.size.width = v11;
        v63.size.height = v11;
        v45 = CGRectGetMinX(v63);
        v64.origin.x = v21;
        v64.origin.y = v22;
        v64.size.width = v11;
        v64.size.height = v11;
        *(float *)&v22 = CGRectGetMaxY(v64);
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[KNBuildFlameSystem positionAttribute](self, "positionAttribute"));
        *(float *)&v21 = v45;
        LODWORD(v47) = LODWORD(v21);
        LODWORD(v48) = LODWORD(v22);
        objc_msgSend(v44, "setMetalPoint2D:forAttribute:atIndex:", v46, v10 | 3, v47, v48);

        for (i = 0; i != 4; ++i)
        {
          v50 = (void *)objc_claimAutoreleasedReturnValue(-[KNBuildFlameSystem dataBuffer](self, "dataBuffer"));
          v51 = (void *)objc_claimAutoreleasedReturnValue(-[KNBuildFlameSystem centerAttribute](self, "centerAttribute"));
          *(float *)&v52 = v24;
          *(float *)&v53 = MidY;
          objc_msgSend(v50, "setMetalPoint2D:forAttribute:atIndex:", v51, v10 + i, v52, v53);

        }
        v10 += 4;
      }
      while (v10 < 4 * (uint64_t)-[KNBuildFlameSystem particleCount](self, "particleCount"));
    }
  }

}

- (BOOL)shouldDraw
{
  return self->shouldDraw;
}

- (void)setShouldDraw:(BOOL)a3
{
  self->shouldDraw = a3;
}

@end
