@implementation TSDGPUVoronoiTriangleDataCell

- (void)p_setupTriangleDataWithEdges:()vector<boost:(std::allocator<boost::polygon::segment_data<double>>> *)a3 :polygon::segment_data<double>
{
  int64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;
  float32x2_t *v9;
  float32x2_t *v10;
  float64x2_t *var0;
  _OWORD *var1;
  double v13;
  double v14;
  float32x2_t *v15;
  double v16;
  double v17;
  float64x2_t v18;
  float32x2_t v19;
  double v20;
  double v21;
  unint64_t v22;
  char *v23;
  $94F468A8D4C62B317260615823C2B210 *v24;
  uint64_t v25;
  int64_t v26;
  size_t v27;
  float32x2_t *v28;
  char v29;
  float32x2_t v30;
  float32x2_t v31;
  size_t v32;
  float32x2_t v33;
  $94F468A8D4C62B317260615823C2B210 *vertexData;
  double v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  float v39;
  double v40;

  v5 = (char *)a3->var1 - (char *)a3->var0;
  v6 = v5 >> 5;
  if ((unint64_t)v5 <= 0x40)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGPUVoronoiTriangleDataCell p_setupTriangleDataWithEdges:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUVoronoiTriangleData.mm"), 351, CFSTR("Less than 3 edges in this cell!"));
  }
  v9 = (float32x2_t *)malloc_type_calloc(8uLL, v6, 0xCC049D6BuLL);
  v10 = v9;
  var0 = (float64x2_t *)a3->var0;
  var1 = a3->var1;
  if (a3->var0 == var1)
  {
    v16 = 1.79769313e308;
    v13 = 2.22507386e-308;
    v14 = 1.79769313e308;
  }
  else
  {
    v13 = 2.22507386e-308;
    v14 = 1.79769313e308;
    v15 = v9;
    v16 = 1.79769313e308;
    v17 = 2.22507386e-308;
    do
    {
      v18 = *var0;
      var0 += 2;
      v19 = vcvt_f32_f64(v18);
      *v15++ = v19;
      v20 = v19.f32[0];
      if (v14 >= v19.f32[0])
        v14 = v19.f32[0];
      v21 = v19.f32[1];
      if (v16 >= v21)
        v16 = v21;
      if (v13 <= v20)
        v13 = v20;
      if (v17 <= v21)
        v17 = v21;
    }
    while (var0 != (float64x2_t *)var1);
  }
  v22 = 3 * (v6 - 2);
  self->_triangleCount = v6 - 2;
  self->_vertexCount = v22;
  v23 = (char *)malloc_type_calloc(8uLL, v22, 0x44490DFAuLL);
  v24 = ($94F468A8D4C62B317260615823C2B210 *)v23;
  if ((uint64_t)self->_triangleCount >= 1)
  {
    v25 = 0;
    v26 = 0;
    v27 = v6 - 1;
    v28 = (float32x2_t *)(v23 + 16);
    v29 = 1;
    do
    {
      v30 = v10[v25];
      if ((v29 & 1) != 0)
        v31 = v10[v27];
      else
        v31 = v10[v25];
      if ((v29 & 1) != 0)
      {
        v32 = v25 + 1;
      }
      else
      {
        v30 = v10[v27];
        v32 = v27 - 1;
      }
      if ((v29 & 1) != 0)
        ++v25;
      else
        --v27;
      v33 = v10[v32];
      v28[-2] = v30;
      v28[-1] = v31;
      *v28 = v33;
      v28 += 3;
      v29 ^= 1u;
      ++v26;
    }
    while (v26 < (int64_t)self->_triangleCount);
  }
  vertexData = self->_vertexData;
  if (vertexData)
    free(vertexData);
  self->_vertexData = v24;
  v35 = TSDRectWithPoints(v14, v16, v13);
  self->_bounds.origin.x = v35;
  self->_bounds.origin.y = v36;
  self->_bounds.size.width = v37;
  self->_bounds.size.height = v38;
  v39 = TSDCenterOfRect(v35, v36, v37, v38);
  *(float *)&v40 = v40;
  self->_centerPoint.x = v39;
  self->_centerPoint.y = *(float *)&v40;
  free(v10);
}

- (id)cellsBySplittingCellIntoTriangles
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  TSDGPUVoronoiTriangleDataCell *v6;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[TSDGPUVoronoiTriangleDataCell triangleCount](self, "triangleCount"));
  if (-[TSDGPUVoronoiTriangleDataCell triangleCount](self, "triangleCount"))
  {
    v4 = 0;
    v5 = 0;
    do
    {
      v6 = -[TSDGPUVoronoiTriangleDataCell initWithTrianglePoints:]([TSDGPUVoronoiTriangleDataCell alloc], "initWithTrianglePoints:", &self->_vertexData[v4]);
      objc_msgSend(v3, "addObject:", v6);

      ++v5;
      v4 += 3;
    }
    while (v5 < -[TSDGPUVoronoiTriangleDataCell triangleCount](self, "triangleCount"));
  }
  return v3;
}

- (TSDGPUVoronoiTriangleDataCell)initWithEdges:()vector<boost:(std::allocator<boost::polygon::segment_data<double>>> *)a3 :polygon::segment_data<double>
{
  TSDGPUVoronoiTriangleDataCell *v4;
  void *__p;
  void *v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSDGPUVoronoiTriangleDataCell;
  v4 = -[TSDGPUVoronoiTriangleDataCell init](&v9, sel_init);
  if (v4)
  {
    __p = 0;
    v7 = 0;
    v8 = 0;
    std::vector<boost::polygon::segment_data<double>>::__init_with_size[abi:ne180100]<boost::polygon::segment_data<double>*,boost::polygon::segment_data<double>*>((char *)&__p, a3->var0, (_QWORD *)a3->var1, ((char *)a3->var1 - (char *)a3->var0) >> 5);
    -[TSDGPUVoronoiTriangleDataCell p_setupTriangleDataWithEdges:](v4, "p_setupTriangleDataWithEdges:", &__p);
    if (__p)
    {
      v7 = __p;
      operator delete(__p);
    }
  }
  return v4;
}

- (TSDGPUVoronoiTriangleDataCell)initWithTrianglePoints:(id *)a3
{
  void *v5;
  uint64_t v6;
  char *v7;
  TSDGPUVoronoiTriangleDataCell *v8;
  unint64_t v9;
  unint64_t vertexCount;
  float *p_var1;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  float v22;
  double v23;
  objc_super v25;

  if (!a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGPUVoronoiTriangleDataCell initWithTrianglePoints:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUVoronoiTriangleData.mm"), 459, CFSTR("points is NULL!"));
  }
  v25.receiver = self;
  v25.super_class = (Class)TSDGPUVoronoiTriangleDataCell;
  v7 = -[TSDGPUVoronoiTriangleDataCell init](&v25, sel_init);
  v8 = (TSDGPUVoronoiTriangleDataCell *)v7;
  if (v7)
  {
    *(_OWORD *)(v7 + 8) = xmmword_217C2A2D0;
    *((_QWORD *)v7 + 3) = malloc_type_calloc(8uLL, 3uLL, 0x67546D9DuLL);
    if (!v8->_vertexCount)
      goto LABEL_19;
    v9 = 0;
    do
    {
      v8->_vertexData[v9] = a3[v9];
      ++v9;
      vertexCount = v8->_vertexCount;
    }
    while (v9 < vertexCount);
    if (vertexCount)
    {
      p_var1 = &v8->_vertexData->var1;
      v12 = 2.22507386e-308;
      v13 = 1.79769313e308;
      v14 = 1.79769313e308;
      v15 = 2.22507386e-308;
      do
      {
        v16 = *(p_var1 - 1);
        if (v13 >= v16)
          v13 = *(p_var1 - 1);
        v17 = *p_var1;
        if (v14 >= v17)
          v14 = *p_var1;
        if (v12 <= v16)
          v12 = *(p_var1 - 1);
        if (v15 <= v17)
          v15 = *p_var1;
        p_var1 += 2;
        --vertexCount;
      }
      while (vertexCount);
    }
    else
    {
LABEL_19:
      v14 = 1.79769313e308;
      v12 = 2.22507386e-308;
      v13 = 1.79769313e308;
    }
    v18 = TSDRectWithPoints(v13, v14, v12);
    v8->_bounds.origin.x = v18;
    v8->_bounds.origin.y = v19;
    v8->_bounds.size.width = v20;
    v8->_bounds.size.height = v21;
    v22 = TSDCenterOfRect(v18, v19, v20, v21);
    *(float *)&v23 = v23;
    v8->_centerPoint.x = v22;
    v8->_centerPoint.y = *(float *)&v23;
  }
  return v8;
}

- (void)dealloc
{
  $94F468A8D4C62B317260615823C2B210 *vertexData;
  objc_super v4;

  vertexData = self->_vertexData;
  if (vertexData)
  {
    free(vertexData);
    self->_vertexData = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSDGPUVoronoiTriangleDataCell;
  -[TSDGPUVoronoiTriangleDataCell dealloc](&v4, sel_dealloc);
}

- (unint64_t)triangleCount
{
  return self->_triangleCount;
}

- (unint64_t)vertexCount
{
  return self->_vertexCount;
}

- ($94F468A8D4C62B317260615823C2B210)vertexData
{
  return self->_vertexData;
}

- ($94F468A8D4C62B317260615823C2B210)centerPoint
{
  float x;
  float y;
  $94F468A8D4C62B317260615823C2B210 result;

  x = self->_centerPoint.x;
  y = self->_centerPoint.y;
  result.var1 = y;
  result.var0 = x;
  return result;
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

@end
