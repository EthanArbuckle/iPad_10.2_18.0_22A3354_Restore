@implementation TSTWidthHeightCache

- (TSTWidthHeightCache)init
{
  id v2;
  TSTWidthHeightCache *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSTWidthHeightCache;
  v2 = -[TSTWidthHeightCache init](&v5, sel_init);
  v3 = (TSTWidthHeightCache *)v2;
  if (v2)
  {
    std::vector<TSTWidthHeightCache_Private::WHCCol>::reserve((uint64_t *)v2 + 1, 0x20uLL);
    v3->mMaxRow = 0;
    v3->mMaxCol = 0;
    pthread_rwlock_init(&v3->mLock, 0);
  }
  return v3;
}

- (TSTWidthHeightCache)initWithNumRows:(unsigned __int16)a3 andNumCols:(unsigned __int16)a4
{
  uint64_t v4;
  uint64_t v5;
  TSTWidthHeightCache *v6;
  TSTWidthHeightCache *v7;
  uint64_t v9;
  objc_super v10;

  v4 = a4;
  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TSTWidthHeightCache;
  v6 = -[TSTWidthHeightCache init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->mMaxRow = v5 - 1;
    v6->mMaxCol = v4 - 1;
    v9 = 0;
    std::vector<double>::resize((uint64_t)&v6->mModelRowHeight, v5, &v9);
    v9 = 0;
    std::vector<double>::resize((uint64_t)&v7->mModelColumnWidth, v4, &v9);
    -[TSTWidthHeightCache _increaseRowCapacity:](v7, "_increaseRowCapacity:", v5);
    -[TSTWidthHeightCache _increaseColCapacity:](v7, "_increaseColCapacity:", v4);
    pthread_rwlock_init(&v7->mLock, 0);
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  pthread_rwlock_destroy(&self->mLock);
  v3.receiver = self;
  v3.super_class = (Class)TSTWidthHeightCache;
  -[TSTWidthHeightCache dealloc](&v3, sel_dealloc);
}

- (BOOL)setFitDims:(CGSize)a3 forCellID:(id)a4
{
  int v5;
  uint64_t v6;
  double height;
  double width;
  int var1;
  _opaque_pthread_rwlock_t *p_mLock;
  WHCCol *begin;
  int v13;
  WHCRow *v14;
  WHCRow *end;
  uint64_t *p_mFittingRowHeight;

  LOBYTE(v5) = 0;
  if (a4.var0 != 0xFFFF)
  {
    v6 = *(_QWORD *)&a4.var0 >> 16;
    if ((unint64_t)a4.var1 << 16 != 16711680)
    {
      height = a3.height;
      width = a3.width;
      var1 = a4.var1;
      p_mLock = &self->mLock;
      pthread_rwlock_wrlock(&self->mLock);
      begin = self->mFittingColumnWidth.__begin_;
      if (a4.var1 >= (unint64_t)((self->mFittingColumnWidth.__end_ - begin) >> 5))
      {
        std::vector<TSTWidthHeightCache_Private::WHCCol>::resize((uint64_t *)&self->mFittingColumnWidth, (var1 + 1));
        begin = self->mFittingColumnWidth.__begin_;
      }
      v13 = TSTWidthHeightCache_Private::WHCCol::setWidth((TSTWidthHeightCache_Private::WHCCol *)((char *)begin + 32 * a4.var1), a4.var0, width);
      v14 = self->mFittingRowHeight.__begin_;
      end = self->mFittingRowHeight.__end_;
      p_mFittingRowHeight = (uint64_t *)&self->mFittingRowHeight;
      if (a4.var0 >= 0xCF3CF3CF3CF3CF3DLL * ((end - v14) >> 3))
      {
        std::vector<TSTWidthHeightCache_Private::WHCRow>::resize(p_mFittingRowHeight, a4.var0 + 1);
        v14 = (WHCRow *)*p_mFittingRowHeight;
      }
      v5 = v13 | TSTWidthHeightCache_Private::WHCRow::setHeight((TSTWidthHeightCache_Private::WHCRow *)((char *)v14 + 168 * a4.var0), v6, height);
      pthread_rwlock_unlock(p_mLock);
    }
  }
  return v5;
}

- (BOOL)setFitWidth:(double)a3 forCellID:(id)a4
{
  int var1;
  _opaque_pthread_rwlock_t *p_mLock;
  WHCCol *begin;
  WHCCol *end;
  uint64_t *p_mFittingColumnWidth;
  char v12;

  if (a4.var0 == 0xFFFF)
    return 0;
  var1 = a4.var1;
  if (a4.var1 << 16 == 16711680)
    return 0;
  p_mLock = &self->mLock;
  pthread_rwlock_wrlock(&self->mLock);
  begin = self->mFittingColumnWidth.__begin_;
  end = self->mFittingColumnWidth.__end_;
  p_mFittingColumnWidth = (uint64_t *)&self->mFittingColumnWidth;
  if (a4.var1 >= (unint64_t)((end - begin) >> 5))
  {
    std::vector<TSTWidthHeightCache_Private::WHCCol>::resize(p_mFittingColumnWidth, (var1 + 1));
    begin = (WHCCol *)*p_mFittingColumnWidth;
  }
  v12 = TSTWidthHeightCache_Private::WHCCol::setWidth((TSTWidthHeightCache_Private::WHCCol *)((char *)begin + 32 * a4.var1), a4.var0, a3);
  pthread_rwlock_unlock(p_mLock);
  return v12;
}

- (BOOL)setFitHeight:(double)a3 forCellID:(id)a4
{
  unint64_t var0;
  uint64_t v7;
  _opaque_pthread_rwlock_t *p_mLock;
  WHCRow *begin;
  WHCRow *end;
  uint64_t *p_mFittingRowHeight;
  char v12;

  var0 = a4.var0;
  if (a4.var0 == 0xFFFFLL || (*(_QWORD *)&a4.var0 & 0xFF0000) == 0xFF0000)
    return 0;
  v7 = *(_QWORD *)&a4.var0 >> 16;
  p_mLock = &self->mLock;
  pthread_rwlock_wrlock(&self->mLock);
  begin = self->mFittingRowHeight.__begin_;
  end = self->mFittingRowHeight.__end_;
  p_mFittingRowHeight = (uint64_t *)&self->mFittingRowHeight;
  if (var0 >= 0xCF3CF3CF3CF3CF3DLL * ((end - begin) >> 3))
  {
    std::vector<TSTWidthHeightCache_Private::WHCRow>::resize(p_mFittingRowHeight, var0 + 1);
    begin = (WHCRow *)*p_mFittingRowHeight;
  }
  v12 = TSTWidthHeightCache_Private::WHCRow::setHeight((TSTWidthHeightCache_Private::WHCRow *)((char *)begin + 168 * var0), v7, a3);
  pthread_rwlock_unlock(p_mLock);
  return v12;
}

- (BOOL)setModelWidth:(double)a3 forColumn:(unsigned __int8)a4
{
  unsigned int v4;
  _opaque_pthread_rwlock_t *p_mLock;
  double *begin;
  unint64_t v9;
  BOOL v10;

  v4 = a4;
  p_mLock = &self->mLock;
  pthread_rwlock_wrlock(&self->mLock);
  begin = self->mModelColumnWidth.__begin_;
  v9 = self->mModelColumnWidth.__end_ - begin;
  if (v9 > v4)
    begin[v4] = a3;
  v10 = v9 > v4;
  pthread_rwlock_unlock(p_mLock);
  return v10;
}

- (BOOL)setModelHeight:(double)a3 forRow:(unsigned __int16)a4
{
  unsigned int v4;
  _opaque_pthread_rwlock_t *p_mLock;
  double *begin;
  unint64_t v9;
  BOOL v10;

  v4 = a4;
  p_mLock = &self->mLock;
  pthread_rwlock_wrlock(&self->mLock);
  begin = self->mModelRowHeight.__begin_;
  v9 = self->mModelRowHeight.__end_ - begin;
  if (v9 > v4)
    begin[v4] = a3;
  v10 = v9 > v4;
  pthread_rwlock_unlock(p_mLock);
  return v10;
}

- (BOOL)resetModelCache
{
  _opaque_pthread_rwlock_t *p_mLock;
  double *begin;
  uint64_t v5;
  double *v6;
  uint64_t v7;

  p_mLock = &self->mLock;
  pthread_rwlock_wrlock(&self->mLock);
  begin = self->mModelRowHeight.__begin_;
  v5 = (char *)self->mModelRowHeight.__end_ - (char *)begin;
  if (v5 >= 1)
    bzero(begin, 8 * (((unint64_t)v5 >> 3) - ((unint64_t)v5 > 7)) + 8);
  v6 = self->mModelColumnWidth.__begin_;
  v7 = (char *)self->mModelColumnWidth.__end_ - (char *)v6;
  if (v7 >= 1)
    bzero(v6, 8 * (((unint64_t)v7 >> 3) - ((unint64_t)v7 > 7)) + 8);
  pthread_rwlock_unlock(p_mLock);
  return 1;
}

- (unint64_t)numModelColumnWidths
{
  _opaque_pthread_rwlock_t *p_mLock;
  unint64_t v4;

  p_mLock = &self->mLock;
  pthread_rwlock_rdlock(&self->mLock);
  v4 = self->mModelColumnWidth.__end_ - self->mModelColumnWidth.__begin_;
  pthread_rwlock_rdlock(p_mLock);
  return v4;
}

- (unint64_t)numModelRowHeights
{
  _opaque_pthread_rwlock_t *p_mLock;
  unint64_t v4;

  p_mLock = &self->mLock;
  pthread_rwlock_rdlock(&self->mLock);
  v4 = self->mModelRowHeight.__end_ - self->mModelRowHeight.__begin_;
  pthread_rwlock_rdlock(p_mLock);
  return v4;
}

- (BOOL)resetModelCacheRange:(id)a3
{
  _opaque_pthread_rwlock_t *p_mLock;
  double *begin;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  double *v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;

  p_mLock = &self->mLock;
  pthread_rwlock_wrlock(&self->mLock);
  begin = self->mModelRowHeight.__begin_;
  v7 = self->mModelRowHeight.__end_ - begin;
  v8 = (unsigned __int16)(a3.var0.var0 + a3.var1.var1 - 1);
  if (v8 < v7)
    LODWORD(v7) = v8 + 1;
  v9 = 8 * v7 - 8 * a3.var0.var0;
  if (v9 >= 1)
    bzero(&begin[a3.var0.var0], 8 * (((unint64_t)v9 >> 3) - ((unint64_t)v9 > 7)) + 8);
  v10 = self->mModelColumnWidth.__begin_;
  v11 = self->mModelColumnWidth.__end_ - v10;
  v12 = (LOBYTE(a3.var1.var0) + a3.var0.var1 - 1);
  if (v12 < v11)
    LODWORD(v11) = v12 + 1;
  v13 = 8 * v11 - 8 * a3.var0.var1;
  if (v13 >= 1)
    bzero(&v10[a3.var0.var1], 8 * (((unint64_t)v13 >> 3) - ((unint64_t)v13 > 7)) + 8);
  pthread_rwlock_unlock(p_mLock);
  return 1;
}

- (BOOL)deleteColsStartingWith:(unsigned __int8)a3 andEndingWith:(unsigned __int8)a4
{
  unsigned int v4;
  unsigned int v5;
  _opaque_pthread_rwlock_t *p_mLock;
  WHCCol *begin;
  unsigned __int8 v9;
  uint64_t v10;
  WHCRow *i;
  double *v12;
  double *end;
  double *v14;
  double *v15;
  int64_t v16;

  v4 = a4;
  v5 = a3;
  p_mLock = &self->mLock;
  pthread_rwlock_wrlock(&self->mLock);
  begin = self->mFittingColumnWidth.__begin_;
  if (v4 <= ((unint64_t)(self->mFittingColumnWidth.__end_ - begin) >> 5))
    v9 = v4;
  else
    v9 = (unint64_t)(self->mFittingColumnWidth.__end_ - begin) >> 5;
  v10 = v5;
  if (v5 < v9)
  {
    std::vector<TSTWidthHeightCache_Private::WHCCol>::erase((uint64_t)&self->mFittingColumnWidth, (char *)begin + 32 * v5, (uint64_t)begin + 32 * v9);
    for (i = self->mFittingRowHeight.__begin_; i < self->mFittingRowHeight.__end_; i = (WHCRow *)((char *)i + 168))
      TSTWidthHeightCache_Private::WHCRow::resetColDataInRange((uint64_t)i, v5, v9);
  }
  if (v5 != v4)
  {
    v12 = self->mModelColumnWidth.__begin_;
    end = self->mModelColumnWidth.__end_;
    v14 = &v12[v5];
    v15 = &v12[v4];
    v16 = (char *)end - (char *)v15;
    if (end != v15)
      memmove(&v12[v10], v15, (char *)end - (char *)v15);
    self->mModelColumnWidth.__end_ = (double *)((char *)v14 + v16);
  }
  pthread_rwlock_unlock(p_mLock);
  return 1;
}

- (BOOL)deleteRowsStartingWith:(unsigned __int16)a3 andEndingWith:(unsigned __int16)a4
{
  unsigned int v4;
  unsigned int v5;
  _opaque_pthread_rwlock_t *p_mLock;
  WHCRow *begin;
  unsigned __int16 v9;
  int v10;
  uint64_t v11;
  uint64_t **i;
  double *v13;
  double *end;
  double *v15;
  double *v16;
  int64_t v17;

  v4 = a4;
  v5 = a3;
  p_mLock = &self->mLock;
  pthread_rwlock_wrlock(&self->mLock);
  begin = self->mFittingRowHeight.__begin_;
  v9 = -12483 * ((unint64_t)(self->mFittingRowHeight.__end_ - begin) >> 3);
  if (v4 <= v9)
    v9 = v4;
  v10 = v9;
  v11 = v5;
  if (v9 > v5)
  {
    std::vector<TSTWidthHeightCache_Private::WHCRow>::erase((uint64_t)&self->mFittingRowHeight, (uint64_t)begin + 168 * v5, (__int128 *)((char *)begin + 168 * v9));
    for (i = (uint64_t **)self->mFittingColumnWidth.__begin_; (WHCCol *)i < self->mFittingColumnWidth.__end_; i += 4)
      TSTWidthHeightCache_Private::WHCCol::removeRowDataInRange(i, v5, v10);
  }
  if (v5 != v4)
  {
    v13 = self->mModelRowHeight.__begin_;
    end = self->mModelRowHeight.__end_;
    v15 = &v13[v5];
    v16 = &v13[v4];
    v17 = (char *)end - (char *)v16;
    if (end != v16)
      memmove(&v13[v11], v16, (char *)end - (char *)v16);
    self->mModelRowHeight.__end_ = (double *)((char *)v15 + v17);
  }
  pthread_rwlock_unlock(p_mLock);
  return 1;
}

- (BOOL)insertCols:(unsigned __int16)a3 atColumn:(unsigned __int8)a4
{
  unsigned int v4;
  unsigned int v5;
  _opaque_pthread_rwlock_t *p_mLock;
  WHCCol *begin;
  WHCRow *i;
  char *v10;
  void *__p;
  void *v13;
  uint64_t v14;
  char v15;

  v4 = a4;
  v5 = a3;
  p_mLock = &self->mLock;
  pthread_rwlock_wrlock(&self->mLock);
  begin = self->mFittingColumnWidth.__begin_;
  if (v4 > (unint64_t)((self->mFittingColumnWidth.__end_ - begin) >> 5))
  {
    std::vector<TSTWidthHeightCache_Private::WHCCol>::resize((uint64_t *)&self->mFittingColumnWidth, v4);
    begin = self->mFittingColumnWidth.__begin_;
  }
  __p = 0;
  v13 = 0;
  v15 = 0;
  v14 = 0;
  std::vector<TSTWidthHeightCache_Private::WHCCol>::insert((uint64_t *)&self->mFittingColumnWidth, (char *)begin + 32 * v4, v5, (unint64_t)&__p);
  if (__p)
  {
    v13 = __p;
    operator delete(__p);
  }
  for (i = self->mFittingRowHeight.__begin_; i < self->mFittingRowHeight.__end_; i = (WHCRow *)((char *)i + 168))
    TSTWidthHeightCache_NibArray::NibArray<8u>::insert((uint64_t)i, v5, v4, 15);
  v10 = (char *)&self->mModelColumnWidth.__begin_[v4];
  __p = 0;
  std::vector<double>::insert((uint64_t)&self->mModelColumnWidth, v10, v5, (char *)&__p);
  pthread_rwlock_unlock(p_mLock);
  return 1;
}

- (BOOL)insertRows:(unsigned __int16)a3 atRow:(unsigned __int16)a4
{
  unsigned int v4;
  unsigned int v5;
  _opaque_pthread_rwlock_t *p_mLock;
  WHCRow *begin;
  uint64_t v9;
  __int128 v10;
  WHCCol *end;
  WHCCol *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v18;
  int v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  void *__p[2];
  __int128 v29;
  char v30;
  uint64_t v31;

  v4 = a4;
  v5 = a3;
  v31 = *MEMORY[0x24BDAC8D0];
  p_mLock = &self->mLock;
  pthread_rwlock_wrlock(&self->mLock);
  begin = self->mFittingRowHeight.__begin_;
  if (0xCF3CF3CF3CF3CF3DLL * ((self->mFittingRowHeight.__end_ - begin) >> 3) < v4)
  {
    std::vector<TSTWidthHeightCache_Private::WHCRow>::resize((uint64_t *)&self->mFittingRowHeight, v4);
    begin = self->mFittingRowHeight.__begin_;
  }
  v30 = 0;
  v9 = (uint64_t)begin + 168 * v4;
  *(_OWORD *)__p = 0u;
  v29 = 0u;
  *(_QWORD *)&v10 = -1;
  *((_QWORD *)&v10 + 1) = -1;
  v20 = v10;
  v21 = v10;
  v22 = v10;
  v23 = v10;
  v24 = v10;
  v25 = v10;
  v26 = v10;
  v27 = v10;
  v18 = (char *)&v29 + 8;
  v19 = 0;
  std::__fill_n[abi:nn180100]<false,std::__bitset<1ul,14ul>>((uint64_t)&v18, 0xEuLL);
  std::vector<TSTWidthHeightCache_Private::WHCRow>::insert((uint64_t *)&self->mFittingRowHeight, v9, v5, (unint64_t)&v20);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  v12 = self->mFittingColumnWidth.__begin_;
  end = self->mFittingColumnWidth.__end_;
  if (v12 < end)
  {
    v13 = MEMORY[0x24BDAC760];
    do
    {
      v15 = *(_QWORD *)v12;
      v14 = *((_QWORD *)v12 + 1);
      *(_QWORD *)&v20 = v13;
      *((_QWORD *)&v20 + 1) = 3221225472;
      *(_QWORD *)&v21 = ___ZN27TSTWidthHeightCache_Private6WHCCol10insertRowsEjj_block_invoke;
      *((_QWORD *)&v21 + 1) = &__block_descriptor_40_e27_v16__0__WHCWidthBucket_dI_8l;
      *(_QWORD *)&v22 = __PAIR64__(v5, v4);
      if (v15 != v14)
      {
        do
        {
          ((void (*)(__int128 *, uint64_t))v21)(&v20, v15);
          v15 += 16;
        }
        while (v15 != v14);
        end = self->mFittingColumnWidth.__end_;
      }
      v12 = (WHCCol *)((char *)v12 + 32);
    }
    while (v12 < end);
  }
  v16 = (char *)&self->mModelRowHeight.__begin_[v4];
  *(_QWORD *)&v20 = 0;
  std::vector<double>::insert((uint64_t)&self->mModelRowHeight, v16, v5, (char *)&v20);
  pthread_rwlock_unlock(p_mLock);
  return 1;
}

- (BOOL)moveRowsFrom:(id)a3 toRow:(unsigned __int16)a4
{
  unsigned int v4;
  unsigned __int16 var0;
  unint64_t var1;
  unsigned int v8;
  unint64_t v9;
  vector<TSTWidthHeightCache_Private::WHCRow, std::allocator<TSTWidthHeightCache_Private::WHCRow>> *p_mFittingRowHeight;
  WHCRow *begin;
  uint64_t v12;
  unint64_t v13;
  unint64_t *i;
  double *v15;
  double *end;
  vector<double, std::allocator<double>> *p_mModelRowHeight;
  double *v18;
  pthread_rwlock_t *v19;
  double *v20;
  uint64_t v21;
  _opaque_pthread_rwlock_t *p_mLock;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  void **v28;

  v4 = a4;
  var0 = a3.var0.var0;
  var1 = a3.var1.var1;
  p_mLock = &self->mLock;
  pthread_rwlock_wrlock(&self->mLock);
  v8 = var1 + var0;
  if (v8 <= v4)
    v9 = v4;
  else
    v9 = v8;
  begin = self->mFittingRowHeight.__begin_;
  p_mFittingRowHeight = &self->mFittingRowHeight;
  if (0xCF3CF3CF3CF3CF3DLL * ((self->mFittingRowHeight.__end_ - begin) >> 3) < v9)
  {
    std::vector<TSTWidthHeightCache_Private::WHCRow>::resize((uint64_t *)&self->mFittingRowHeight, v9);
    begin = p_mFittingRowHeight->__begin_;
  }
  v12 = (uint64_t)begin + 168 * var0;
  v24 = 0;
  v25 = 0;
  v26 = 0;
  std::vector<TSTWidthHeightCache_Private::WHCRow>::__assign_with_size[abi:nn180100]<std::__wrap_iter<TSTWidthHeightCache_Private::WHCRow*>,std::__wrap_iter<TSTWidthHeightCache_Private::WHCRow*>>(&v24, v12, v12 + 168 * var1, var1);
  v13 = (unint64_t)begin + 168 * v4;
  if (v12 + 168 * (unint64_t)var1 >= v13)
  {
    std::__copy_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<TSTWidthHeightCache_Private::WHCRow *,TSTWidthHeightCache_Private::WHCRow *,TSTWidthHeightCache_Private::WHCRow *>((uint64_t)&v27, v13, v12, v12 + 168 * var1);
  }
  else
  {
    std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<TSTWidthHeightCache_Private::WHCRow *,TSTWidthHeightCache_Private::WHCRow *,TSTWidthHeightCache_Private::WHCRow *>((uint64_t)&v27, v12 + 168 * var1, v13, v12);
    v13 = (unint64_t)p_mFittingRowHeight->__begin_ + 168 * (int)(v4 - var1);
  }
  std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<TSTWidthHeightCache_Private::WHCRow *,TSTWidthHeightCache_Private::WHCRow *,TSTWidthHeightCache_Private::WHCRow *>((uint64_t)&v27, v24, v25, v13);
  for (i = (unint64_t *)self->mFittingColumnWidth.__begin_; (WHCCol *)i < self->mFittingColumnWidth.__end_; i += 4)
    TSTWidthHeightCache_Private::WHCCol::moveRowIds(i, var0, var1, v4);
  v15 = self->mModelRowHeight.__begin_;
  end = self->mModelRowHeight.__end_;
  p_mModelRowHeight = &self->mModelRowHeight;
  if (v9 > end - v15)
  {
    v28 = 0;
    std::vector<double>::resize((uint64_t)p_mModelRowHeight, v9, &v28);
  }
  v18 = p_mModelRowHeight->__begin_;
  if (var0 >= v4)
  {
    v20 = &v18[v4];
    v21 = 8 * (unsigned __int16)(var0 + var1 - 1) - 8 * v4 + 8;
    v19 = p_mLock;
    if (v21 < 1)
      goto LABEL_17;
    goto LABEL_16;
  }
  v19 = p_mLock;
  v20 = &v18[var0];
  v21 = 8 * v4 - 8 * var0;
  if (v21 > 0)
LABEL_16:
    bzero(v20, 8 * (((unint64_t)v21 >> 3) - ((unint64_t)v21 > 7)) + 8);
LABEL_17:
  v28 = (void **)&v24;
  std::vector<TSTWidthHeightCache_Private::WHCRow>::__destroy_vector::operator()[abi:nn180100](&v28);
  pthread_rwlock_unlock(v19);
  return 1;
}

- (BOOL)moveColsFrom:(id)a3 toCol:(unsigned __int8)a4
{
  unsigned int v4;
  unsigned __int16 var0;
  unsigned int v8;
  unint64_t v9;
  vector<TSTWidthHeightCache_Private::WHCCol, std::allocator<TSTWidthHeightCache_Private::WHCCol>> *p_mFittingColumnWidth;
  WHCCol *begin;
  char *v12;
  char *v13;
  WHCRow *i;
  double *v15;
  double *end;
  vector<double, std::allocator<double>> *p_mModelColumnWidth;
  double *v18;
  double *v19;
  uint64_t v20;
  pthread_rwlock_t *v21;
  _opaque_pthread_rwlock_t *p_mLock;
  unsigned __int8 v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  char **v29;

  v4 = a4;
  var0 = a3.var1.var0;
  p_mLock = &self->mLock;
  pthread_rwlock_wrlock(&self->mLock);
  v24 = var0;
  v8 = a3.var0.var1 + var0;
  if (v8 <= v4)
    v9 = v4;
  else
    v9 = v8;
  begin = self->mFittingColumnWidth.__begin_;
  p_mFittingColumnWidth = &self->mFittingColumnWidth;
  if (v9 > (self->mFittingColumnWidth.__end_ - begin) >> 5)
  {
    std::vector<TSTWidthHeightCache_Private::WHCCol>::resize((uint64_t *)&self->mFittingColumnWidth, v9);
    begin = p_mFittingColumnWidth->__begin_;
  }
  v12 = (char *)begin + 32 * a3.var0.var1;
  v25 = 0;
  v26 = 0;
  v27 = 0;
  std::vector<TSTWidthHeightCache_Private::WHCCol>::__assign_with_size[abi:nn180100]<std::__wrap_iter<TSTWidthHeightCache_Private::WHCCol*>,std::__wrap_iter<TSTWidthHeightCache_Private::WHCCol*>>(&v25, (uint64_t)v12, (uint64_t)&v12[32 * a3.var1.var0], a3.var1.var0);
  v13 = (char *)begin + 32 * v4;
  if (a3.var0.var1 >= (unint64_t)v4)
  {
    std::__copy_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<TSTWidthHeightCache_Private::WHCCol *,TSTWidthHeightCache_Private::WHCCol *,TSTWidthHeightCache_Private::WHCCol *>((uint64_t)&v28, (uint64_t)v13, (uint64_t)v12, (uint64_t)&v12[32 * a3.var1.var0]);
  }
  else
  {
    std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<TSTWidthHeightCache_Private::WHCCol *,TSTWidthHeightCache_Private::WHCCol *,TSTWidthHeightCache_Private::WHCCol *>((int)&v28, (uint64_t)&v12[32 * a3.var1.var0], (uint64_t)v13, v12);
    v13 = (char *)p_mFittingColumnWidth->__begin_ + 32 * (int)(v4 - a3.var1.var0);
  }
  std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<TSTWidthHeightCache_Private::WHCCol *,TSTWidthHeightCache_Private::WHCCol *,TSTWidthHeightCache_Private::WHCCol *>((int)&v28, (uint64_t)v25, v26, v13);
  for (i = self->mFittingRowHeight.__begin_; i < self->mFittingRowHeight.__end_; i = (WHCRow *)((char *)i + 168))
    TSTWidthHeightCache_NibArray::NibArray<8u>::move((uint64_t)i, a3.var0.var1, a3.var0.var1 + v24, v4, 256);
  v15 = self->mModelColumnWidth.__begin_;
  end = self->mModelColumnWidth.__end_;
  p_mModelColumnWidth = &self->mModelColumnWidth;
  if (v9 > end - v15)
  {
    v29 = 0;
    std::vector<double>::resize((uint64_t)p_mModelColumnWidth, v9, &v29);
  }
  v18 = p_mModelColumnWidth->__begin_;
  if (a3.var0.var1 >= v4)
  {
    v21 = p_mLock;
    v19 = &v18[v4];
    v20 = 8 * (v24 + a3.var0.var1 - 1) - 8 * v4 + 8;
    if (v20 < 1)
      goto LABEL_16;
    goto LABEL_15;
  }
  v19 = &v18[a3.var0.var1];
  v20 = 8 * v4 - 8 * a3.var0.var1;
  v21 = p_mLock;
  if (v20 > 0)
LABEL_15:
    bzero(v19, 8 * (((unint64_t)v20 >> 3) - ((unint64_t)v20 > 7)) + 8);
LABEL_16:
  v29 = &v25;
  std::vector<TSTWidthHeightCache_Private::WHCCol>::__destroy_vector::operator()[abi:nn180100]((void ***)&v29);
  pthread_rwlock_unlock(v21);
  return 1;
}

- (double)getFitHeightForRow:(unsigned __int16)a3
{
  unsigned int v3;
  _opaque_pthread_rwlock_t *p_mLock;
  WHCRow *begin;
  double v7;
  char *v8;
  double *v9;

  v3 = a3;
  p_mLock = &self->mLock;
  pthread_rwlock_rdlock(&self->mLock);
  begin = self->mFittingRowHeight.__begin_;
  v7 = 0.0;
  if (0xCF3CF3CF3CF3CF3DLL * ((self->mFittingRowHeight.__end_ - begin) >> 3) > v3)
  {
    v8 = (char *)begin + 168 * v3;
    v9 = (double *)*((_QWORD *)v8 + 16);
    if (v9 == *((double **)v8 + 17))
    {
      if (*((_BYTE *)begin + 168 * v3 + 160))
        v7 = -1.0;
      else
        v7 = 0.0;
    }
    else
    {
      v7 = *v9;
    }
  }
  pthread_rwlock_unlock(p_mLock);
  return v7;
}

- (double)getFitWidthForCol:(unsigned __int8)a3
{
  unsigned int v3;
  _opaque_pthread_rwlock_t *p_mLock;
  WHCCol *begin;
  double v7;
  char *v8;

  v3 = a3;
  p_mLock = &self->mLock;
  pthread_rwlock_rdlock(&self->mLock);
  begin = self->mFittingColumnWidth.__begin_;
  v7 = -1.0;
  if (v3 < (unint64_t)((self->mFittingColumnWidth.__end_ - begin) >> 5))
  {
    v8 = (char *)begin + 32 * v3;
    if (*(_QWORD *)v8 == *((_QWORD *)v8 + 1))
    {
      if (v8[24])
        v7 = -1.0;
      else
        v7 = 0.0;
    }
    else
    {
      v7 = **(double **)v8;
    }
  }
  pthread_rwlock_unlock(p_mLock);
  return v7;
}

- (double)getModelHeightForRow:(unsigned __int16)a3
{
  unsigned int v3;
  _opaque_pthread_rwlock_t *p_mLock;
  double *begin;
  double v7;

  v3 = a3;
  p_mLock = &self->mLock;
  pthread_rwlock_rdlock(&self->mLock);
  begin = self->mModelRowHeight.__begin_;
  v7 = 0.0;
  if (v3 < (unint64_t)(self->mModelRowHeight.__end_ - begin))
    v7 = begin[v3];
  pthread_rwlock_unlock(p_mLock);
  return v7;
}

- (double)getModelWidthForColumn:(unsigned __int8)a3
{
  unsigned int v3;
  _opaque_pthread_rwlock_t *p_mLock;
  double *begin;
  double v7;

  v3 = a3;
  p_mLock = &self->mLock;
  pthread_rwlock_rdlock(&self->mLock);
  begin = self->mModelColumnWidth.__begin_;
  v7 = 0.0;
  if (v3 < (unint64_t)(self->mModelColumnWidth.__end_ - begin))
    v7 = begin[v3];
  pthread_rwlock_unlock(p_mLock);
  return v7;
}

- (id)getListOfInvalidColsInRow:(unsigned __int16)a3
{
  unsigned int v3;
  _opaque_pthread_rwlock_t *p_mLock;
  WHCRow *begin;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  WHCRow *v10;
  uint64_t v11;
  char *v12;
  char v13;

  v3 = a3;
  p_mLock = &self->mLock;
  pthread_rwlock_rdlock(&self->mLock);
  begin = self->mFittingRowHeight.__begin_;
  if (0xCF3CF3CF3CF3CF3DLL * ((self->mFittingRowHeight.__end_ - begin) >> 3) <= v3)
    goto LABEL_11;
  v7 = v3;
  v8 = *((unsigned __int8 *)begin + 168 * v3 + 160);
  v9 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v8);
  if (!v8)
    goto LABEL_12;
  v10 = self->mFittingRowHeight.__begin_;
  if (0xCF3CF3CF3CF3CF3DLL * ((self->mFittingRowHeight.__end_ - v10) >> 3) <= v7)
LABEL_11:
    abort();
  v11 = 0;
  while (1)
  {
    v12 = (char *)v10 + 168 * v7;
    v13 = 4 * v11;
    while (v12[(unint64_t)v11 >> 1] >> (v13 & 4) != 14)
    {
      v11 = (v11 + 1);
      v13 += 4;
      if ((_DWORD)v11 == 256)
        goto LABEL_12;
    }
    if (v11 > 0xFE)
      break;
    objc_msgSend(v9, "addObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v11));
    v11 = (v11 + 1);
    v10 = self->mFittingRowHeight.__begin_;
    if (0xCF3CF3CF3CF3CF3DLL * ((self->mFittingRowHeight.__end_ - v10) >> 3) <= v7)
      goto LABEL_11;
  }
LABEL_12:
  pthread_rwlock_unlock(p_mLock);
  return v9;
}

- (unint64_t)resetAllInvalidColsInRow:(unsigned __int16)a3
{
  unsigned int v3;
  WHCRow *begin;

  v3 = a3;
  pthread_rwlock_wrlock(&self->mLock);
  begin = self->mFittingRowHeight.__begin_;
  if (0xCF3CF3CF3CF3CF3DLL * ((self->mFittingRowHeight.__end_ - begin) >> 3) <= v3)
    return 0;
  else
    return (int)TSTWidthHeightCache_NibArray::NibArray<8u>::setValueToValue((uint64_t)begin + 168 * v3, 14, 15, *((unsigned __int8 *)begin + 168 * v3 + 160), 0x100u);
}

- (void)resetRowHeightsStartingWith:(unsigned __int16)a3 andEndingWith:(unsigned __int16)a4
{
  unsigned int v4;
  unsigned int v5;
  _opaque_pthread_rwlock_t *p_mLock;
  WHCRow *begin;
  WHCRow *end;
  uint64_t *p_mFittingRowHeight;
  unint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  __int128 v15;
  char *v16;
  int v17;

  v4 = a4;
  v5 = a3;
  p_mLock = &self->mLock;
  pthread_rwlock_wrlock(&self->mLock);
  begin = self->mFittingRowHeight.__begin_;
  end = self->mFittingRowHeight.__end_;
  p_mFittingRowHeight = (uint64_t *)&self->mFittingRowHeight;
  v11 = 0xCF3CF3CF3CF3CF3DLL * ((end - begin) >> 3);
  if (v11 <= v4)
  {
    std::vector<TSTWidthHeightCache_Private::WHCRow>::resize(p_mFittingRowHeight, v4 + 1);
    begin = (WHCRow *)*p_mFittingRowHeight;
  }
  if ((unint64_t)v4 + 1 >= v11)
    v12 = v11;
  else
    v12 = v4 + 1;
  if (v12 > v5)
  {
    v13 = (char *)begin + 168 * v12;
    v14 = (char *)begin + 168 * v5;
    do
    {
      *(_QWORD *)&v15 = -1;
      *((_QWORD *)&v15 + 1) = -1;
      *((_OWORD *)v14 + 6) = v15;
      *((_OWORD *)v14 + 7) = v15;
      *((_OWORD *)v14 + 4) = v15;
      *((_OWORD *)v14 + 5) = v15;
      *((_OWORD *)v14 + 2) = v15;
      *((_OWORD *)v14 + 3) = v15;
      *(_OWORD *)v14 = v15;
      *((_OWORD *)v14 + 1) = v15;
      v16 = v14 + 152;
      v17 = 0;
      std::__fill_n[abi:nn180100]<false,std::__bitset<1ul,14ul>>((uint64_t)&v16, 0xEuLL);
      *((_QWORD *)v14 + 17) = *((_QWORD *)v14 + 16);
      v14[160] = 0;
      v14 += 168;
    }
    while (v14 < v13);
  }
  pthread_rwlock_unlock(p_mLock);
}

- (void)resetColWidthsStartingWith:(unsigned __int8)a3 andEndingWith:(unsigned __int8)a4
{
  unsigned int v4;
  unsigned int v5;
  _opaque_pthread_rwlock_t *p_mLock;
  WHCCol *begin;
  WHCCol *end;
  uint64_t *p_mFittingColumnWidth;
  unint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;

  v4 = a4;
  v5 = a3;
  p_mLock = &self->mLock;
  pthread_rwlock_wrlock(&self->mLock);
  begin = self->mFittingColumnWidth.__begin_;
  end = self->mFittingColumnWidth.__end_;
  p_mFittingColumnWidth = (uint64_t *)&self->mFittingColumnWidth;
  v11 = (end - begin) >> 5;
  if (v11 < v4)
  {
    std::vector<TSTWidthHeightCache_Private::WHCCol>::resize(p_mFittingColumnWidth, v4 + 1);
    begin = (WHCCol *)*p_mFittingColumnWidth;
  }
  if ((unint64_t)v4 + 1 >= v11)
    v12 = v11;
  else
    v12 = v4 + 1;
  if (v12 > v5)
  {
    v13 = (char *)begin + 32 * v12;
    v14 = (char *)begin + 32 * v5;
    do
    {
      *((_QWORD *)v14 + 1) = *(_QWORD *)v14;
      v14[24] = 0;
      v14 += 32;
    }
    while (v14 < v13);
  }
  pthread_rwlock_unlock(p_mLock);
}

- (void)resetAllRow
{
  _opaque_pthread_rwlock_t *p_mLock;
  WHCRow *end;
  WHCRow *begin;
  __int128 v6;
  char *v7;
  int v8;

  p_mLock = &self->mLock;
  pthread_rwlock_wrlock(&self->mLock);
  begin = self->mFittingRowHeight.__begin_;
  end = self->mFittingRowHeight.__end_;
  while (begin < end)
  {
    *(_QWORD *)&v6 = -1;
    *((_QWORD *)&v6 + 1) = -1;
    *((_OWORD *)begin + 6) = v6;
    *((_OWORD *)begin + 7) = v6;
    *((_OWORD *)begin + 4) = v6;
    *((_OWORD *)begin + 5) = v6;
    *((_OWORD *)begin + 2) = v6;
    *((_OWORD *)begin + 3) = v6;
    *(_OWORD *)begin = v6;
    *((_OWORD *)begin + 1) = v6;
    v7 = (char *)begin + 152;
    v8 = 0;
    std::__fill_n[abi:nn180100]<false,std::__bitset<1ul,14ul>>((uint64_t)&v7, 0xEuLL);
    *((_QWORD *)begin + 17) = *((_QWORD *)begin + 16);
    *((_BYTE *)begin + 160) = 0;
    end = self->mFittingRowHeight.__end_;
    begin = (WHCRow *)((char *)begin + 168);
  }
  pthread_rwlock_unlock(p_mLock);
}

- (void)resetAllCol
{
  _opaque_pthread_rwlock_t *p_mLock;
  WHCCol *begin;
  WHCCol *end;

  p_mLock = &self->mLock;
  pthread_rwlock_wrlock(&self->mLock);
  begin = self->mFittingColumnWidth.__begin_;
  end = self->mFittingColumnWidth.__end_;
  while (begin < end)
  {
    *((_QWORD *)begin + 1) = *(_QWORD *)begin;
    *((_BYTE *)begin + 24) = 0;
    begin = (WHCCol *)((char *)begin + 32);
  }
  pthread_rwlock_unlock(p_mLock);
}

- (void)resetWidthsHeightsForRange:(id)a3
{
  uint64_t var1;
  _opaque_pthread_rwlock_t *p_mLock;
  vector<TSTWidthHeightCache_Private::WHCRow, std::allocator<TSTWidthHeightCache_Private::WHCRow>> *p_mFittingRowHeight;
  unint64_t v8;
  WHCCol *begin;
  WHCCol *end;
  uint64_t *p_mFittingColumnWidth;
  unint64_t v12;
  unint64_t v13;
  uint64_t var0;
  int v15;
  uint64_t **v16;
  uint64_t **v17;

  var1 = a3.var1.var1;
  p_mLock = &self->mLock;
  pthread_rwlock_wrlock(&self->mLock);
  p_mFittingRowHeight = &self->mFittingRowHeight;
  v8 = var1 + a3.var0.var0;
  if (0xCF3CF3CF3CF3CF3DLL * ((self->mFittingRowHeight.__end_ - self->mFittingRowHeight.__begin_) >> 3) < v8)
    std::vector<TSTWidthHeightCache_Private::WHCRow>::resize((uint64_t *)&self->mFittingRowHeight, var1 + a3.var0.var0);
  begin = self->mFittingColumnWidth.__begin_;
  end = self->mFittingColumnWidth.__end_;
  p_mFittingColumnWidth = (uint64_t *)&self->mFittingColumnWidth;
  if (a3.var0.var1 + a3.var1.var0 > (unint64_t)((end - begin) >> 5))
    std::vector<TSTWidthHeightCache_Private::WHCCol>::resize(p_mFittingColumnWidth, a3.var0.var1 + a3.var1.var0);
  if (var1)
  {
    v12 = (unint64_t)p_mFittingRowHeight->__begin_ + 168 * a3.var0.var0;
    v13 = v12 + 168 * var1;
    do
    {
      TSTWidthHeightCache_Private::WHCRow::resetColDataInRange(v12, a3.var0.var1, (a3.var0.var1 + LOBYTE(a3.var1.var0)));
      v12 += 168;
    }
    while (v12 < v13);
  }
  var0 = a3.var1.var0;
  if (a3.var1.var0)
  {
    v15 = a3.var0.var0;
    v16 = (uint64_t **)(*p_mFittingColumnWidth + 32 * a3.var0.var1);
    v17 = &v16[4 * var0];
    do
    {
      TSTWidthHeightCache_Private::WHCCol::removeRowDataInRange(v16, v15, v8);
      v16 += 4;
    }
    while (v16 < v17);
  }
  pthread_rwlock_unlock(p_mLock);
}

- (void)resetRowHeightForCell:(id)a3
{
  uint64_t v5;
  _opaque_pthread_rwlock_t *p_mLock;

  v5 = *(_QWORD *)&a3.var0 >> 16;
  p_mLock = &self->mLock;
  pthread_rwlock_wrlock(&self->mLock);
  TSTWidthHeightCache_Private::WHCRow::resetColDataInRange((uint64_t)self->mFittingRowHeight.__begin_ + 168 * a3.var0, a3.var1, (v5 + 1));
  pthread_rwlock_unlock(p_mLock);
}

- (void)resetFitHeightForCellID:(id)a3
{
  _opaque_pthread_rwlock_t *p_mLock;
  WHCRow *begin;

  p_mLock = &self->mLock;
  pthread_rwlock_wrlock(&self->mLock);
  begin = self->mFittingRowHeight.__begin_;
  if (a3.var0 < 0xCF3CF3CF3CF3CF3DLL * ((self->mFittingRowHeight.__end_ - begin) >> 3))
    TSTWidthHeightCache_Private::WHCRow::resetColDataInRange((uint64_t)begin + 168 * a3.var0, a3.var1, (a3.var1 + 1));
  pthread_rwlock_unlock(p_mLock);
}

- (void)setNumsRows:(unsigned __int16)a3 andNumCols:(unsigned __int8)a4
{
  unsigned int v4;
  unsigned int v5;
  _opaque_pthread_rwlock_t *p_mLock;
  unsigned __int8 v8;
  uint64_t **i;
  WHCRow *j;

  v4 = a4;
  v5 = a3;
  p_mLock = &self->mLock;
  pthread_rwlock_wrlock(&self->mLock);
  v8 = v4 - 1;
  if (self->mMaxRow > (unsigned __int16)(v5 - 1))
    std::vector<TSTWidthHeightCache_Private::WHCRow>::resize((uint64_t *)&self->mFittingRowHeight, v5);
  if (self->mMaxCol > v8)
    std::vector<TSTWidthHeightCache_Private::WHCCol>::resize((uint64_t *)&self->mFittingColumnWidth, v4);
  if (self->mMaxRow > (unsigned __int16)(v5 - 1))
  {
    for (i = (uint64_t **)self->mFittingColumnWidth.__begin_; (WHCCol *)i < self->mFittingColumnWidth.__end_; i += 4)
      TSTWidthHeightCache_Private::WHCCol::resetAfter(i, v5);
  }
  if (self->mMaxCol > v8)
  {
    for (j = self->mFittingRowHeight.__begin_; j < self->mFittingRowHeight.__end_; j = (WHCRow *)((char *)j + 168))
      TSTWidthHeightCache_Private::WHCRow::resetAfter((uint64_t)j, v8, self->mMaxCol);
  }
  self->mMaxRow = v8;
  self->mMaxCol = v8;
  pthread_rwlock_unlock(p_mLock);
}

- (BOOL)verifyDims:(CGSize)a3 forCellID:(id)a4
{
  return 1;
}

- (void)logInternalState
{
  WHCRow *begin;
  int v4;
  double *v5;
  double v6;
  WHCCol *v7;
  int v8;
  double v9;

  NSLog((NSString *)CFSTR("RowH: "), a2);
  begin = self->mFittingRowHeight.__begin_;
  if (begin >= self->mFittingRowHeight.__end_)
    goto LABEL_12;
  v4 = 0;
  do
  {
    if ((~v4 & 0xF) == 0)
      NSLog((NSString *)CFSTR("\n      "));
    v5 = (double *)*((_QWORD *)begin + 16);
    if (v5 == *((double **)begin + 17))
    {
      if (*((_BYTE *)begin + 160))
        v6 = -1.0;
      else
        v6 = 0.0;
    }
    else
    {
      v6 = *v5;
    }
    NSLog((NSString *)CFSTR("%6.2f "), *(_QWORD *)&v6);
    begin = (WHCRow *)((char *)begin + 168);
    ++v4;
  }
  while (begin < self->mFittingRowHeight.__end_);
  if ((~v4 & 0xF) != 0)
LABEL_12:
    NSLog((NSString *)CFSTR("\n"));
  NSLog((NSString *)CFSTR("ColW: "));
  v7 = self->mFittingColumnWidth.__begin_;
  if (v7 >= self->mFittingColumnWidth.__end_)
    goto LABEL_24;
  v8 = 0;
  do
  {
    if ((~v8 & 0xF) == 0)
      NSLog((NSString *)CFSTR("\n      "));
    if (*(_QWORD *)v7 == *((_QWORD *)v7 + 1))
    {
      if (*((_BYTE *)v7 + 24))
        v9 = -1.0;
      else
        v9 = 0.0;
    }
    else
    {
      v9 = *(double *)*(double *)v7;
    }
    NSLog((NSString *)CFSTR("%6.2f "), *(_QWORD *)&v9);
    v7 = (WHCCol *)((char *)v7 + 32);
    ++v8;
  }
  while (v7 < self->mFittingColumnWidth.__end_);
  if ((~v8 & 0xF) != 0)
LABEL_24:
    NSLog((NSString *)CFSTR("\n"));
}

- (id)validateChangeDescriptors:(id)a3 tableModel:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  _QWORD v16[7];
  int v17;
  int v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v23 = 0;
  v24 = &v23;
  v25 = 0x3052000000;
  v26 = __Block_byref_object_copy__28;
  v27 = __Block_byref_object_dispose__28;
  v28 = 0;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(a3);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "changeDescriptor");
        v11 = objc_msgSend(v9, "cellID");
        v12 = (void *)objc_msgSend(v9, "cellRegion");
        v16[0] = MEMORY[0x24BDAC760];
        v16[1] = 3221225472;
        v16[2] = __60__TSTWidthHeightCache_validateChangeDescriptors_tableModel___block_invoke;
        v16[3] = &unk_24D82F3D0;
        v17 = v10;
        v18 = v11;
        v16[5] = a4;
        v16[6] = &v23;
        v16[4] = self;
        objc_msgSend(v12, "enumerateCellRangesUsingBlock:", v16);
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
    }
    while (v6);
  }
  v13 = (void *)v24[5];
  _Block_object_dispose(&v23, 8);
  return v13;
}

uint64_t __60__TSTWidthHeightCache_validateChangeDescriptors_tableModel___block_invoke(uint64_t result, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  unsigned int v8;
  unsigned __int16 v9;

  v2 = a2;
  v3 = result;
  v4 = a2 >> 16;
  v5 = HIWORD(a2);
  switch(*(_DWORD *)(result + 56))
  {
    case 1:
      objc_msgSend(*(id *)(result + 32), "deleteColsStartingWith:andEndingWith:", BYTE2(a2), (BYTE4(a2) + BYTE2(a2)));
      goto LABEL_17;
    case 2:
      return objc_msgSend(*(id *)(result + 32), "insertCols:atColumn:", BYTE4(a2), BYTE2(a2));
    case 3:
      return objc_msgSend(*(id *)(result + 32), "moveColsFrom:toCol:", a2, *(unsigned __int8 *)(result + 62));
    case 4:
      v8 = HIDWORD(a2) + WORD1(a2) + 255;
      if (BYTE2(a2) <= (BYTE4(a2) + BYTE2(a2) - 1))
      {
        do
        {
          result = TSTTableIsColumnHidden(*(_QWORD *)(v3 + 40), v4);
          if ((result & 1) == 0)
            result = objc_msgSend(*(id *)(v3 + 32), "setModelWidth:forColumn:", v4, 0.0);
          LOBYTE(v4) = v4 + 1;
        }
        while (v4 <= v8);
      }
      return result;
    case 5:
    case 0x13:
    case 0x14:
    case 0x1A:
      objc_msgSend(*(id *)(result + 32), "resetWidthsHeightsForRange:", a2);
      v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(v3 + 48) + 8) + 40);
      if (!v6)
      {
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 48) + 8) + 40) = objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
        v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(v3 + 48) + 8) + 40);
      }
      v7 = (unsigned __int16)v2;
      goto LABEL_20;
    case 0xD:
    case 0xE:
    case 0x19:
    case 0x21:
      goto LABEL_6;
    case 0x15:
      return objc_msgSend(*(id *)(result + 32), "deleteRowsStartingWith:andEndingWith:", (unsigned __int16)a2, (unsigned __int16)(HIWORD(a2) + a2));
    case 0x16:
      objc_msgSend(*(id *)(result + 32), "insertRows:atRow:", HIWORD(a2), (unsigned __int16)a2);
LABEL_17:
      v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(v3 + 48) + 8) + 40);
      if (!v6)
      {
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 48) + 8) + 40) = objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
        v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(v3 + 48) + 8) + 40);
      }
      v7 = (unsigned __int16)v2;
LABEL_20:
      result = objc_msgSend(v6, "addIndexesInRange:", v7, v5);
      break;
    case 0x17:
      result = objc_msgSend(*(id *)(result + 32), "moveRowsFrom:toRow:", a2, *(unsigned __int16 *)(result + 60));
      break;
    case 0x18:
      v9 = a2 + HIWORD(a2) - 1;
      if (v9 >= (unsigned __int16)a2)
      {
        do
        {
          result = TSTTableIsRowHidden(*(_QWORD *)(v3 + 40), (unsigned __int16)v2);
          if ((result & 1) == 0)
            result = objc_msgSend(*(id *)(v3 + 32), "setModelHeight:forRow:", (unsigned __int16)v2, 0.0);
          LOWORD(v2) = v2 + 1;
        }
        while ((unsigned __int16)v2 <= v9);
      }
      break;
    case 0x1D:
    case 0x24:
      objc_msgSend(*(id *)(result + 32), "resetModelCache");
LABEL_6:
      result = objc_msgSend(*(id *)(v3 + 32), "resetWidthsHeightsForRange:", v2);
      break;
    default:
      return result;
  }
  return result;
}

- (void)_increaseColCapacity:(unsigned int)a3
{
  uint64_t *p_mFittingColumnWidth;
  WHCCol *begin;
  unint64_t v5;

  begin = self->mFittingColumnWidth.__begin_;
  p_mFittingColumnWidth = (uint64_t *)&self->mFittingColumnWidth;
  if (a3 >= (unint64_t)((p_mFittingColumnWidth[2] - (uint64_t)begin) >> 5))
  {
    if ((a3 & 0xFFFFFF1F) != 0)
      v5 = (a3 + 32) & 0xE0;
    else
      v5 = a3;
    std::vector<TSTWidthHeightCache_Private::WHCCol>::reserve(p_mFittingColumnWidth, v5);
  }
}

- (void)_increaseRowCapacity:(unsigned int)a3
{
  uint64_t *p_mFittingRowHeight;
  WHCRow *begin;

  begin = self->mFittingRowHeight.__begin_;
  p_mFittingRowHeight = (uint64_t *)&self->mFittingRowHeight;
  if (0xCF3CF3CF3CF3CF3DLL * ((p_mFittingRowHeight[2] - (uint64_t)begin) >> 3) <= a3)
    std::vector<TSTWidthHeightCache_Private::WHCRow>::reserve(p_mFittingRowHeight, 0);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = (objc_class *)objc_opt_class();
  v5 = (void *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p\n"), NSStringFromClass(v4), self);
  objc_msgSend(v5, "appendFormat:", CFSTR("  %u rows={\n"), self->mMaxRow + 1);
  v6 = 0;
  do
  {
    -[TSTWidthHeightCache getModelHeightForRow:](self, "getModelHeightForRow:", (unsigned __int16)v6);
    v8 = v7;
    -[TSTWidthHeightCache getFitHeightForRow:](self, "getFitHeightForRow:", (unsigned __int16)v6);
    objc_msgSend(v5, "appendFormat:", CFSTR("    {[%u] model=%f, fitting=%f }\n"), (unsigned __int16)v6++, v8, v9);
  }
  while (self->mMaxRow >= (unsigned __int16)v6);
  objc_msgSend(v5, "appendString:", CFSTR("  }\n"));
  objc_msgSend(v5, "appendFormat:", CFSTR("  %u columns={\n"), self->mMaxCol + 1);
  v10 = 0;
  do
  {
    -[TSTWidthHeightCache getModelWidthForColumn:](self, "getModelWidthForColumn:", v10);
    v12 = v11;
    -[TSTWidthHeightCache getFitWidthForCol:](self, "getFitWidthForCol:", v10);
    objc_msgSend(v5, "appendFormat:", CFSTR("    {[%u] model=%f, fitting=%f}\n"), v10++, v12, v13);
  }
  while (self->mMaxCol >= v10);
  objc_msgSend(v5, "appendString:", CFSTR("  }>"));
  return v5;
}

- (void).cxx_destruct
{
  double *begin;
  double *v4;
  void **p_begin;

  begin = self->mModelRowHeight.__begin_;
  if (begin)
  {
    self->mModelRowHeight.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->mModelColumnWidth.__begin_;
  if (v4)
  {
    self->mModelColumnWidth.__end_ = v4;
    operator delete(v4);
  }
  p_begin = (void **)&self->mFittingRowHeight.__begin_;
  std::vector<TSTWidthHeightCache_Private::WHCRow>::__destroy_vector::operator()[abi:nn180100](&p_begin);
  p_begin = (void **)&self->mFittingColumnWidth.__begin_;
  std::vector<TSTWidthHeightCache_Private::WHCCol>::__destroy_vector::operator()[abi:nn180100](&p_begin);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
