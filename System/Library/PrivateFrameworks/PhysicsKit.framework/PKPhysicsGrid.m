@implementation PKPhysicsGrid

+ (id)gridFromOccupancyArray:(const char *)a3 bytePitch:(int)a4 width:(int)a5 height:(int)a6
{
  PKPhysicsGrid *v10;
  PKCGrid **p_ptr;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  __int128 v16;

  v10 = objc_alloc_init(PKPhysicsGrid);
  _ZNSt3__115allocate_sharedB8ne180100I7PKCGridNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v16);
  p_ptr = &v10->grid.__ptr_;
  std::shared_ptr<PKCGrid>::operator=[abi:ne180100]((uint64_t)&v10->grid, &v16);
  v12 = (std::__shared_weak_count *)*((_QWORD *)&v16 + 1);
  if (*((_QWORD *)&v16 + 1))
  {
    v13 = (unint64_t *)(*((_QWORD *)&v16 + 1) + 8);
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  PKCGrid::setGridSize(*p_ptr, a5, a6, 1);
  PKCGrid::setData(*p_ptr, (const unsigned __int8 *)a3, a4, a6 * a5);
  return v10;
}

+ (id)gridFromRGBAU8PixelData:(const char *)a3 imageWidth:(int)a4 imageHeight:(int)a5 alphaThreshold:(float)a6 accuracy:(float)a7
{
  PKPhysicsGrid *v12;
  PKCGrid **p_ptr;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  __int128 v18;

  v12 = objc_alloc_init(PKPhysicsGrid);
  _ZNSt3__115allocate_sharedB8ne180100I7PKCGridNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v18);
  p_ptr = &v12->grid.__ptr_;
  std::shared_ptr<PKCGrid>::operator=[abi:ne180100]((uint64_t)&v12->grid, &v18);
  v14 = (std::__shared_weak_count *)*((_QWORD *)&v18 + 1);
  if (*((_QWORD *)&v18 + 1))
  {
    v15 = (unint64_t *)(*((_QWORD *)&v18 + 1) + 8);
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  PKCGrid::setGridSize(*p_ptr, (int)(float)((float)a4 * a7), (int)(float)((float)a5 * a7), 1);
  PKCGrid::tagPixelData(*p_ptr, a6, (const unsigned __int8 *)a3, a4, a5);
  return v12;
}

+ (id)vectorGridFromRGBAU8PixelData:(const char *)a3 imageWidth:(int)a4 imageHeight:(int)a5 accuracy:(float)a6
{
  PKPhysicsGrid *v9;
  PKCGrid **p_ptr;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  __int128 v15;

  v9 = objc_alloc_init(PKPhysicsGrid);
  _ZNSt3__115allocate_sharedB8ne180100I7PKCGridNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v15);
  p_ptr = &v9->grid.__ptr_;
  std::shared_ptr<PKCGrid>::operator=[abi:ne180100]((uint64_t)&v9->grid, &v15);
  v11 = (std::__shared_weak_count *)*((_QWORD *)&v15 + 1);
  if (*((_QWORD *)&v15 + 1))
  {
    v12 = (unint64_t *)(*((_QWORD *)&v15 + 1) + 8);
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  PKCGrid::setGridSize(*p_ptr, a4, a5, 1);
  PKCGrid::setVectorData(*p_ptr, (const unsigned __int8 *)a3, a4, a5);
  return v9;
}

- (BOOL)isGridRegionOccupied:(int)a3 y:(int)a4 width:(int)a5 height:(int)a6
{
  return PKCGrid::isGridRegionOccupied(self->grid.__ptr_, (float)a3, (float)a4, (float)a5, (float)a6);
}

- (unsigned)gridDataAtX:(int)a3 y:(int)a4 z:(int)a5
{
  PKCGrid *ptr;

  if ((a4 | a3 | a5) < 0)
    return 0;
  ptr = self->grid.__ptr_;
  if (*(_DWORD *)ptr <= a3 || *((_DWORD *)ptr + 1) <= a4 || *((_DWORD *)ptr + 2) <= a5)
    return 0;
  else
    return *(_BYTE *)(*((_QWORD *)ptr + 5) + a3 + *(_DWORD *)ptr * a4);
}

- (id)physicsBodyFromSmoothedOutline:(double)a3 size:(CGSize)a4
{
  float v4;
  CGSize v6;

  v6 = a4;
  v4 = a3;
  PKCGrid::physicsBodyFromSmoothedOutline(self->grid.__ptr_, v4, (float64x2_t *)&v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (shared_ptr<PKPath>)pathFromOutlineWithSmoothingThreshold:(double)a3 bounds:(id)a4
{
  _QWORD *v4;
  float v5;
  PKPath *v6;
  __shared_weak_count *v7;
  shared_ptr<PKPath> result;

  v5 = a3;
  PKCGrid::pathFromOutlineWithSmoothingThreshold(self->grid.__ptr_, v5, LODWORD(a4.var0.var0), LODWORD(a4.var0.var1), LODWORD(a4.var1.var0), LODWORD(a4.var1.var1), v4);
  result.__cntrl_ = v7;
  result.__ptr_ = v6;
  return result;
}

- (id)physicsBodyFromLVS0:(CGRect)a3
{
  return +[PKPhysicsBody initWithMarchingCubes:pixelFrame:](PKPhysicsBody, "initWithMarchingCubes:pixelFrame:", self->grid.__ptr_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (int)width
{
  return *(_DWORD *)self->grid.__ptr_;
}

- (int)height
{
  return *((_DWORD *)self->grid.__ptr_ + 1);
}

- (shared_ptr<PKCGrid>)gridPtr
{
  PKCGrid **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<PKCGrid> result;

  cntrl = self->grid.__cntrl_;
  *v2 = self->grid.__ptr_;
  v2[1] = (PKCGrid *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (PKCGrid *)self;
  return result;
}

- (void)setGridPtr:(shared_ptr<PKCGrid>)a3
{
  std::shared_ptr<PKPath>::operator=[abi:ne180100](&self->grid.__ptr_, (uint64_t *)a3.__ptr_);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->quadTree, 0);
  std::shared_ptr<QuadTree>::~shared_ptr[abi:ne180100]((uint64_t)&self->grid);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
