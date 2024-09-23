@implementation OITSURectList

- (OITSURectList)initWithRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  OITSURectList *v7;
  OITSURectList *v8;
  CGFloat *p_x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = -[OITSURectList init](self, "init");
  v8 = v7;
  if (v7)
  {
    std::vector<CGRect>::resize((uint64_t)&v7->mRectList, 1uLL);
    p_x = &v8->mRectList.__begin_->origin.x;
    *p_x = x;
    p_x[1] = y;
    p_x[2] = width;
    p_x[3] = height;
  }
  return v8;
}

- (OITSURectList)initWithRectList:(id)a3
{
  OITSURectList *v4;
  OITSURectList *v5;
  vector<CGRect, std::allocator<CGRect>> *p_mRectList;
  uint64_t v7;
  unint64_t v8;
  _QWORD *p_x;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = -[OITSURectList init](self, "init");
  v5 = v4;
  if (v4)
  {
    p_mRectList = &v4->mRectList;
    std::vector<CGRect>::resize((uint64_t)&v4->mRectList, objc_msgSend(a3, "count"));
    if (objc_msgSend(a3, "count"))
    {
      v7 = 0;
      v8 = 0;
      do
      {
        objc_msgSend(a3, "rectAtIndex:", v8);
        p_x = (_QWORD *)&p_mRectList->__begin_[v7].origin.x;
        *p_x = v10;
        p_x[1] = v11;
        p_x[2] = v12;
        p_x[3] = v13;
        ++v8;
        ++v7;
      }
      while (v8 < objc_msgSend(a3, "count"));
    }
  }
  return v5;
}

- (unint64_t)count
{
  return self->mRectList.__end_ - self->mRectList.__begin_;
}

- (void)addRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  __compressed_pair<CGRect *, std::allocator<CGRect>> *p_end_cap;
  CGRect *value;
  CGRect *end;
  CGRect *v11;
  vector<CGRect, std::allocator<CGRect>> *p_mRectList;
  CGRect *begin;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  CGRect *v19;
  CGRect *v20;
  CGSize size;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_end_cap = &self->mRectList.__end_cap_;
  value = self->mRectList.__end_cap_.__value_;
  end = self->mRectList.__end_;
  if (end >= value)
  {
    p_mRectList = &self->mRectList;
    begin = self->mRectList.__begin_;
    v14 = end - begin;
    v15 = v14 + 1;
    if ((unint64_t)(v14 + 1) >> 59)
      std::vector<std::shared_ptr<TSUStringChunk>>::__throw_length_error[abi:ne180100]();
    v16 = (char *)value - (char *)begin;
    if (v16 >> 4 > v15)
      v15 = v16 >> 4;
    if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFE0)
      v17 = 0x7FFFFFFFFFFFFFFLL;
    else
      v17 = v15;
    if (v17)
    {
      v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGRect>>((uint64_t)p_end_cap, v17);
      begin = self->mRectList.__begin_;
      end = self->mRectList.__end_;
    }
    else
    {
      v18 = 0;
    }
    v19 = (CGRect *)&v18[32 * v14];
    v19->origin.x = x;
    v19->origin.y = y;
    v20 = (CGRect *)&v18[32 * v17];
    v19->size.width = width;
    v19->size.height = height;
    v11 = v19 + 1;
    if (end != begin)
    {
      do
      {
        size = end[-1].size;
        v19[-1].origin = end[-1].origin;
        v19[-1].size = size;
        --v19;
        --end;
      }
      while (end != begin);
      begin = p_mRectList->__begin_;
    }
    self->mRectList.__begin_ = v19;
    self->mRectList.__end_ = v11;
    self->mRectList.__end_cap_.__value_ = v20;
    if (begin)
      operator delete(begin);
  }
  else
  {
    *end = a3;
    v11 = end + 1;
  }
  self->mRectList.__end_ = v11;
}

- (void)insertRect:(CGRect)a3 atIndex:(unint64_t)a4
{
  CGRect v4;

  v4 = a3;
  std::vector<CGRect>::insert((uint64_t)&self->mRectList, (char *)&self->mRectList.__begin_[a4], (char *)&v4);
}

- (CGRect)rectAtIndex:(unint64_t)a3
{
  CGRect *begin;
  unint64_t v4;
  double *p_x;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  begin = self->mRectList.__begin_;
  v4 = self->mRectList.__end_ - begin;
  if (v4 <= a3)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("IndexOutOfBound"), objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Getting object at %lu from an array with size %lu"), a3, v4), 0));
  p_x = &begin[a3].origin.x;
  v6 = *p_x;
  v7 = p_x[1];
  v8 = p_x[2];
  v9 = p_x[3];
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

+ (id)rectListWithDifference:(CGRect)a3 withRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  OITSURectList *v12;
  double MaxY;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double MinX;
  double v24;
  double MaxX;
  double MinY;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v27 = CGRectIntersection(a3, a4);
  v8 = v27.origin.x;
  v9 = v27.origin.y;
  v10 = v27.size.width;
  v11 = v27.size.height;
  v12 = objc_alloc_init(OITSURectList);
  v28.origin.x = v8;
  v28.origin.y = v9;
  v28.size.width = v10;
  v28.size.height = v11;
  if (CGRectIsEmpty(v28))
    goto LABEL_22;
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  MinX = CGRectGetMinX(v29);
  v30.origin.x = x;
  v30.origin.y = y;
  v30.size.width = width;
  v30.size.height = height;
  MinY = CGRectGetMinY(v30);
  v31.origin.x = x;
  v31.origin.y = y;
  v31.size.width = width;
  v31.size.height = height;
  MaxX = CGRectGetMaxX(v31);
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  MaxY = CGRectGetMaxY(v32);
  v33.origin.x = v8;
  v33.origin.y = v9;
  v33.size.width = v10;
  v33.size.height = v11;
  v14 = CGRectGetMinX(v33);
  v34.origin.x = v8;
  v34.origin.y = v9;
  v34.size.width = v10;
  v34.size.height = v11;
  v15 = CGRectGetMinY(v34);
  v35.origin.x = v8;
  v35.origin.y = v9;
  v35.size.width = v10;
  v35.size.height = v11;
  v24 = CGRectGetMaxX(v35);
  v36.origin.x = v8;
  v36.origin.y = v9;
  v36.size.width = v10;
  v36.size.height = v11;
  v16 = CGRectGetMaxY(v36);
  y = v16;
  if (MinY != v15)
  {
    v17 = MinX;
    if (MaxY == v16)
    {
      v19 = MaxX;
      if (MinX < v14)
        -[OITSURectList addRect:](v12, "addRect:", MinX, v15, v14 - MinX, MaxY - v15);
      v18 = v24;
      if (v24 >= MaxX)
        goto LABEL_18;
      v20 = MaxY - v15;
    }
    else
    {
      v19 = MaxX;
      if (MinX < v14)
        -[OITSURectList addRect:](v12, "addRect:", MinX, v15, v14 - MinX, v16 - v15);
      v18 = v24;
      if (v24 >= MaxX)
        goto LABEL_18;
      v20 = y - v15;
    }
    v21 = v15;
    goto LABEL_17;
  }
  v17 = MinX;
  if (MinX < v14)
    -[OITSURectList addRect:](v12, "addRect:", MinX, MinY, v14 - MinX, v16 - MinY);
  v18 = v24;
  v19 = MaxX;
  if (v24 < MaxX)
  {
    v20 = y - MinY;
    v21 = MinY;
LABEL_17:
    -[OITSURectList addRect:](v12, "addRect:", v18, v21, v19 - v18, v20, *(_QWORD *)&MinX);
  }
LABEL_18:
  if (MinY < v15)
    -[OITSURectList addRect:](v12, "addRect:", v17, MinY, v19 - v17, v15 - MinY);
  if (y < MaxY)
  {
    width = v19 - v17;
    height = MaxY - y;
    x = v17;
LABEL_22:
    -[OITSURectList addRect:](v12, "addRect:", x, y, width, height, *(_QWORD *)&MinX);
  }
  return v12;
}

- (void).cxx_destruct
{
  CGRect *begin;

  begin = self->mRectList.__begin_;
  if (begin)
  {
    self->mRectList.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
