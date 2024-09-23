@implementation TIHandwritingStrokes

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  void **v7;
  char **end;
  char **begin;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  char **v18;
  _QWORD *v19;
  char **v20;
  char **v21;
  char **v22;
  char *v23;
  char *v24;

  v4 = objc_opt_new();
  v5 = (_QWORD *)v4;
  if ((TIHandwritingStrokes *)v4 != self)
  {
    v7 = (void **)(v4 + 8);
    v6 = *(_QWORD *)(v4 + 8);
    begin = (char **)self->_strokes.__begin_;
    end = (char **)self->_strokes.__end_;
    v10 = 0xAAAAAAAAAAAAAAABLL * (end - begin);
    v11 = *(_QWORD *)(v4 + 24);
    if (0xAAAAAAAAAAAAAAABLL * ((v11 - v6) >> 3) < v10)
    {
      if (v6)
      {
        std::vector<std::vector<TIHandwritingPoint>>::__clear[abi:nn180100]((uint64_t *)(v4 + 8));
        operator delete(*v7);
        v11 = 0;
        *v7 = 0;
        v5[2] = 0;
        v5[3] = 0;
      }
      if (v10 > 0xAAAAAAAAAAAAAAALL)
        goto LABEL_27;
      v12 = 0xAAAAAAAAAAAAAAABLL * (v11 >> 3);
      v13 = 2 * v12;
      if (2 * v12 <= v10)
        v13 = 0xAAAAAAAAAAAAAAABLL * (end - begin);
      v14 = v12 >= 0x555555555555555 ? 0xAAAAAAAAAAAAAAALL : v13;
      if (v14 > 0xAAAAAAAAAAAAAAALL)
LABEL_27:
        abort();
      v15 = std::__allocate_at_least[abi:nn180100]<std::allocator<std::vector<TIHandwritingPoint>>>(v14);
      v5[1] = v15;
      v5[2] = v15;
      v5[3] = &v15[3 * v16];
      while (begin != end)
      {
        v17 = std::vector<TIHandwritingPoint>::vector(v15, (uint64_t)begin);
        begin += 3;
        v15 = v17 + 3;
      }
      goto LABEL_19;
    }
    if (0xAAAAAAAAAAAAAAABLL * ((*(_QWORD *)(v4 + 16) - v6) >> 3) < v10)
    {
      v18 = &begin[(*(_QWORD *)(v4 + 16) - v6) >> 3];
      std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<std::vector<TIHandwritingPoint> *,std::vector<TIHandwritingPoint> *,std::vector<TIHandwritingPoint> *>(begin, v18, v6);
      v15 = (_QWORD *)v5[2];
      while (v18 != end)
      {
        v19 = std::vector<TIHandwritingPoint>::vector(v15, (uint64_t)v18);
        v18 += 3;
        v15 = v19 + 3;
      }
LABEL_19:
      v5[2] = v15;
      return v5;
    }
    v20 = std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<std::vector<TIHandwritingPoint> *,std::vector<TIHandwritingPoint> *,std::vector<TIHandwritingPoint> *>(begin, end, v6);
    v21 = (char **)v5[2];
    if (v21 != v20)
    {
      v22 = (char **)v5[2];
      do
      {
        v24 = *(v22 - 3);
        v22 -= 3;
        v23 = v24;
        if (v24)
        {
          *(v21 - 2) = v23;
          operator delete(v23);
        }
        v21 = v22;
      }
      while (v22 != v20);
    }
    v5[2] = v20;
  }
  return v5;
}

- (TIHandwritingStrokes)initWithCoder:(id)a3
{
  id v4;
  TIHandwritingStrokes *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *value;
  char *end;
  char *v19;
  char *v20;
  unint64_t v21;
  unint64_t v22;
  _OWORD *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  _OWORD *v28;
  unint64_t v29;
  char *v30;
  int64_t v32;
  char *v33;
  char *v34;
  _QWORD *v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  int64_t v42;
  _QWORD *v43;
  char *v44;
  char *v45;
  id v47;
  __compressed_pair<std::vector<TIHandwritingPoint> *, std::allocator<std::vector<TIHandwritingPoint>>> *p_end_cap;
  TIHandwritingStrokes *v49;
  vector<std::vector<TIHandwritingPoint>, std::allocator<std::vector<TIHandwritingPoint>>> *p_strokes;
  unint64_t v51;
  uint64_t v52;
  unint64_t v53;
  objc_super v54;
  _QWORD v55[5];

  v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)TIHandwritingStrokes;
  v5 = -[TIHandwritingStrokes init](&v54, sel_init);
  if (v5)
  {
    v53 = 0;
    v47 = v4;
    v6 = objc_retainAutorelease(v4);
    v7 = objc_msgSend(v6, "decodeBytesForKey:returnedLength:", CFSTR("strokePointsCount"), &v53);
    if (v7)
    {
      v8 = v7;
      v9 = v53;
      v52 = objc_msgSend(objc_retainAutorelease(v6), "decodeBytesForKey:returnedLength:", CFSTR("points"), &v53);
      if (v52)
      {
        if (v9 >= 4)
        {
          v10 = 0;
          v11 = 0;
          v12 = v9 >> 2;
          v13 = v53 >> 4;
          if (v12 <= 1)
            v12 = 1;
          p_strokes = &v5->_strokes;
          v51 = v12;
          p_end_cap = &v5->_strokes.__end_cap_;
          v49 = v5;
          do
          {
            v14 = *(int *)(v8 + 4 * v10);
            v15 = v11 + v14;
            if (v11 >= v11 + v14 || v11 >= v13)
            {
              end = (char *)v5->_strokes.__end_;
              value = (char *)v5->_strokes.__end_cap_.__value_;
              if (end >= value)
              {
                v20 = 0;
                v19 = 0;
LABEL_44:
                v11 = v15;
                v36 = 0xAAAAAAAAAAAAAAABLL * ((end - (char *)p_strokes->__begin_) >> 3);
                v37 = v36 + 1;
                if (v36 + 1 > 0xAAAAAAAAAAAAAAALL)
LABEL_61:
                  abort();
                v38 = 0xAAAAAAAAAAAAAAABLL * ((value - (char *)p_strokes->__begin_) >> 3);
                if (2 * v38 > v37)
                  v37 = 2 * v38;
                if (v38 >= 0x555555555555555)
                  v39 = 0xAAAAAAAAAAAAAAALL;
                else
                  v39 = v37;
                v55[4] = p_end_cap;
                if (v39)
                  v39 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<std::vector<TIHandwritingPoint>>>(v39);
                else
                  v40 = 0;
                v41 = (_QWORD *)(v39 + 24 * v36);
                v55[0] = v39;
                v55[1] = v41;
                v55[3] = v39 + 24 * v40;
                *v41 = 0;
                v41[1] = 0;
                v41[2] = 0;
                v42 = v20 - v19;
                if (v42)
                {
                  v43 = (_QWORD *)(v39 + 24 * v36);
                  std::vector<TIHandwritingPoint>::__vallocate[abi:nn180100](v43, v42 >> 4);
                  v44 = (char *)v43[1];
                  memmove(v44, v19, v42);
                  v45 = &v44[v42];
                  v5 = v49;
                  v43[1] = v45;
                }
                v55[2] = v41 + 3;
                std::vector<std::vector<TIHandwritingPoint>>::__swap_out_circular_buffer(p_strokes, v55);
                v35 = v5->_strokes.__end_;
                std::__split_buffer<std::vector<TIHandwritingPoint>>::~__split_buffer((uint64_t)v55);
                goto LABEL_56;
              }
              v19 = 0;
              *(_QWORD *)end = 0;
              *((_QWORD *)end + 1) = 0;
              *((_QWORD *)end + 2) = 0;
            }
            else
            {
              v19 = 0;
              v20 = 0;
              v21 = 0;
              v22 = v11;
              do
              {
                v23 = (_OWORD *)(v52 + 16 * v22);
                if ((unint64_t)v20 >= v21)
                {
                  v24 = (v20 - v19) >> 4;
                  v25 = v24 + 1;
                  if ((unint64_t)(v24 + 1) >> 60)
                    goto LABEL_61;
                  if ((uint64_t)(v21 - (_QWORD)v19) >> 3 > v25)
                    v25 = (uint64_t)(v21 - (_QWORD)v19) >> 3;
                  if (v21 - (unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0)
                    v26 = 0xFFFFFFFFFFFFFFFLL;
                  else
                    v26 = v25;
                  if (v26)
                    v26 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<TIHandwritingPoint>>(v26);
                  else
                    v27 = 0;
                  v28 = (_OWORD *)(v26 + 16 * v24);
                  *v28 = *v23;
                  if (v20 == v19)
                  {
                    v30 = (char *)(v26 + 16 * v24);
                  }
                  else
                  {
                    v29 = v26 + 16 * v24;
                    do
                    {
                      v30 = (char *)(v29 - 16);
                      *(_OWORD *)(v29 - 16) = *((_OWORD *)v20 - 1);
                      v20 -= 16;
                      v29 -= 16;
                    }
                    while (v20 != v19);
                  }
                  v21 = v26 + 16 * v27;
                  v20 = (char *)(v28 + 1);
                  if (v19)
                    operator delete(v19);
                  v19 = v30;
                }
                else
                {
                  *(_OWORD *)v20 = *v23;
                  v20 += 16;
                }
                ++v22;
                v15 = v11 + *(int *)(v8 + 4 * v10);
              }
              while (v22 < v15 && v22 < v13);
              v5 = v49;
              end = (char *)v49->_strokes.__end_;
              value = (char *)v49->_strokes.__end_cap_.__value_;
              if (end >= value)
                goto LABEL_44;
              *(_QWORD *)end = 0;
              *((_QWORD *)end + 1) = 0;
              *((_QWORD *)end + 2) = 0;
              v32 = v20 - v19;
              if (v32)
              {
                std::vector<TIHandwritingPoint>::__vallocate[abi:nn180100](end, v32 >> 4);
                v33 = (char *)*((_QWORD *)end + 1);
                memmove(v33, v19, v32);
                v34 = &v33[v32];
                v5 = v49;
                *((_QWORD *)end + 1) = v34;
              }
            }
            v35 = end + 24;
            v11 = v15;
LABEL_56:
            v5->_strokes.__end_ = v35;
            if (v19)
              operator delete(v19);
            ++v10;
          }
          while (v10 != v51);
        }
      }
    }
    v4 = v47;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  _QWORD *begin;
  __int128 *v15;
  uint64_t v16;
  unint64_t v17;
  _OWORD *v18;
  __int128 v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((int)(-1431655765 * (((char *)self->_strokes.__end_ - (char *)self->_strokes.__begin_) >> 3)) >= 1)
  {
    v5 = -1431655765 * (((char *)self->_strokes.__end_ - (char *)self->_strokes.__begin_) >> 3);
    ((void (*)(void))MEMORY[0x1E0C80A78])();
    v7 = 0;
    LODWORD(v8) = 0;
    v9 = (char *)self->_strokes.__begin_ + 8;
    do
    {
      v10 = (*v9 - *(v9 - 1)) >> 4;
      *(_DWORD *)((char *)v20 + v7 - ((v6 + 15) & 0x7FFFFFFF0)) = v10;
      v8 = (v8 + v10);
      v7 += 4;
      v9 += 3;
    }
    while (v6 != v7);
    v11 = objc_msgSend(v4, "encodeBytes:length:forKey:");
    MEMORY[0x1E0C80A78](v11);
    v12 = 0;
    v13 = 0;
    begin = self->_strokes.__begin_;
    do
    {
      v15 = (__int128 *)begin[3 * v12];
      v16 = begin[3 * v12 + 1] - (_QWORD)v15;
      if (v16)
      {
        v17 = v16 >> 4;
        if (v17 <= 1)
          v17 = 1;
        v18 = &v20[2 * v13 + -2 * v8];
        v13 += v17;
        do
        {
          v19 = *v15++;
          *v18++ = v19;
          --v17;
        }
        while (v17);
      }
      ++v12;
    }
    while (v12 != v5);
    objc_msgSend(v4, "encodeBytes:length:forKey:");
  }

}

- (id)description
{
  void *v3;
  void *v4;
  _QWORD *begin;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TIHandwritingStrokes;
  -[TIHandwritingStrokes description](&v11, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "appendFormat:", CFSTR("\n\t%d strokes\n"), 0xAAAAAAAAAAAAAAABLL * (((char *)self->_strokes.__end_ - (char *)self->_strokes.__begin_) >> 3));
  begin = self->_strokes.__begin_;
  if (self->_strokes.__end_ != begin)
  {
    v6 = 0;
    do
    {
      objc_msgSend(v4, "appendFormat:", CFSTR("\t\tstroke %d – %d points\n"), v6, (begin[3 * v6 + 1] - begin[3 * v6]) >> 4);
      begin = self->_strokes.__begin_;
      v7 = begin[3 * v6];
      if (begin[3 * v6 + 1] != v7)
      {
        v8 = 0;
        v9 = 0;
        do
        {
          objc_msgSend(v4, "appendFormat:", CFSTR("\t\t\t(%f,%f)\n"), *(_QWORD *)(v7 + v8), *(_QWORD *)(v7 + v8 + 8));
          ++v9;
          begin = self->_strokes.__begin_;
          v7 = begin[3 * v6];
          v8 += 16;
        }
        while (v9 < (begin[3 * v6 + 1] - v7) >> 4);
      }
      ++v6;
    }
    while (0xAAAAAAAAAAAAAAABLL * (((char *)self->_strokes.__end_ - (char *)begin) >> 3) > v6);
  }
  return v4;
}

- (void)addPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  char *begin;
  vector<std::vector<TIHandwritingPoint>, std::allocator<std::vector<TIHandwritingPoint>>> *p_strokes;
  char *end;
  char *value;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  CGFloat *v18;
  _QWORD *v19;
  CGFloat *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  BOOL v24;
  unint64_t v25;
  uint64_t v26;
  CGFloat *v27;
  unint64_t v28;
  _QWORD v29[5];

  y = a3.y;
  x = a3.x;
  begin = (char *)self->_strokes.__begin_;
  end = (char *)self->_strokes.__end_;
  p_strokes = &self->_strokes;
  if (end == begin || !self->_continuePreviousStroke)
  {
    value = (char *)self->_strokes.__end_cap_.__value_;
    if (end >= value)
    {
      v10 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3);
      if (v10 + 1 > 0xAAAAAAAAAAAAAAALL)
        goto LABEL_29;
      v11 = 0xAAAAAAAAAAAAAAABLL * ((value - begin) >> 3);
      v12 = 2 * v11;
      if (2 * v11 <= v10 + 1)
        v12 = v10 + 1;
      if (v11 >= 0x555555555555555)
        v13 = 0xAAAAAAAAAAAAAAALL;
      else
        v13 = v12;
      v29[4] = &self->_strokes.__end_cap_;
      v14 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::vector<TIHandwritingPoint>>>(v13);
      v15 = &v14[24 * v10];
      v29[0] = v14;
      v29[1] = v15;
      v29[3] = &v14[24 * v16];
      *((_QWORD *)v15 + 1) = 0;
      *((_QWORD *)v15 + 2) = 0;
      *(_QWORD *)v15 = 0;
      v29[2] = v15 + 24;
      std::vector<std::vector<TIHandwritingPoint>>::__swap_out_circular_buffer(p_strokes, v29);
      end = (char *)self->_strokes.__end_;
      std::__split_buffer<std::vector<TIHandwritingPoint>>::~__split_buffer((uint64_t)v29);
    }
    else
    {
      *(_QWORD *)end = 0;
      *((_QWORD *)end + 1) = 0;
      *((_QWORD *)end + 2) = 0;
      end += 24;
    }
    self->_strokes.__end_ = end;
  }
  v18 = (CGFloat *)*((_QWORD *)end - 2);
  v17 = *((_QWORD *)end - 1);
  if ((unint64_t)v18 < v17)
  {
    *v18 = x;
    v18[1] = y;
    v19 = v18 + 2;
    goto LABEL_28;
  }
  v20 = (CGFloat *)*((_QWORD *)end - 3);
  v21 = ((char *)v18 - (char *)v20) >> 4;
  v22 = v21 + 1;
  if ((unint64_t)(v21 + 1) >> 60)
LABEL_29:
    abort();
  v23 = v17 - (_QWORD)v20;
  if (v23 >> 3 > v22)
    v22 = v23 >> 3;
  v24 = (unint64_t)v23 >= 0x7FFFFFFFFFFFFFF0;
  v25 = 0xFFFFFFFFFFFFFFFLL;
  if (!v24)
    v25 = v22;
  if (v25)
  {
    v25 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<TIHandwritingPoint>>(v25);
    v20 = (CGFloat *)*((_QWORD *)end - 3);
    v18 = (CGFloat *)*((_QWORD *)end - 2);
  }
  else
  {
    v26 = 0;
  }
  v27 = (CGFloat *)(v25 + 16 * v21);
  v28 = v25 + 16 * v26;
  *v27 = x;
  v27[1] = y;
  v19 = v27 + 2;
  if (v18 != v20)
  {
    do
    {
      *((_OWORD *)v27 - 1) = *((_OWORD *)v18 - 1);
      v27 -= 2;
      v18 -= 2;
    }
    while (v18 != v20);
    v20 = (CGFloat *)*((_QWORD *)end - 3);
  }
  *((_QWORD *)end - 3) = v27;
  *((_QWORD *)end - 2) = v19;
  *((_QWORD *)end - 1) = v28;
  if (v20)
    operator delete(v20);
LABEL_28:
  *((_QWORD *)end - 2) = v19;
  self->_continuePreviousStroke = 1;
}

- (void)endStroke
{
  self->_continuePreviousStroke = 0;
}

- (void)removeStrokeAtIndex:(unint64_t)a3
{
  char *end;
  char *v5;
  char *v6;
  void *v7;
  char *v8;
  char *v9;
  char *v10;
  void *v11;
  void *v12;

  end = (char *)self->_strokes.__end_;
  v5 = (char *)self->_strokes.__begin_ + 24 * a3;
  v6 = v5 + 24;
  if (v5 + 24 != end)
  {
    do
    {
      v7 = *(void **)v5;
      if (*(_QWORD *)v5)
      {
        *((_QWORD *)v5 + 1) = v7;
        operator delete(v7);
        *((_QWORD *)v5 + 2) = 0;
      }
      v8 = v5 + 24;
      *(_OWORD *)v5 = *(_OWORD *)(v5 + 24);
      *((_QWORD *)v5 + 2) = *((_QWORD *)v5 + 5);
      *((_QWORD *)v5 + 4) = 0;
      *((_QWORD *)v5 + 5) = 0;
      *((_QWORD *)v5 + 3) = 0;
      v9 = v5 + 48;
      v5 += 24;
    }
    while (v9 != end);
    v6 = (char *)self->_strokes.__end_;
    v5 = v8;
  }
  if (v6 != v5)
  {
    v10 = v6;
    do
    {
      v12 = (void *)*((_QWORD *)v10 - 3);
      v10 -= 24;
      v11 = v12;
      if (v12)
      {
        *((_QWORD *)v6 - 2) = v11;
        operator delete(v11);
      }
      v6 = v10;
    }
    while (v10 != v5);
  }
  self->_strokes.__end_ = v5;
}

- (void)removeAllStrokes
{
  std::vector<std::vector<TIHandwritingPoint>>::__clear[abi:nn180100]((uint64_t *)&self->_strokes);
}

- (unint64_t)numberOfStrokes
{
  return 0xAAAAAAAAAAAAAAABLL * (((char *)self->_strokes.__end_ - (char *)self->_strokes.__begin_) >> 3);
}

- (unint64_t)numberOfPointsInStrokeAtIndex:(unint64_t)a3
{
  return (uint64_t)(*((_QWORD *)self->_strokes.__begin_ + 3 * a3 + 1) - *((_QWORD *)self->_strokes.__begin_ + 3 * a3)) >> 4;
}

- (CGPoint)pointAtIndex:(unint64_t)a3 inStrokeAtIndex:(unint64_t)a4
{
  double *v4;
  double v5;
  double v6;
  CGPoint result;

  v4 = (double *)(*((_QWORD *)self->_strokes.__begin_ + 3 * a4) + 16 * a3);
  v5 = *v4;
  v6 = v4[1];
  result.y = v6;
  result.x = v5;
  return result;
}

- (unint64_t)totalNumberOfPoints
{
  uint64_t *begin;
  uint64_t *end;
  unint64_t result;
  uint64_t v5;
  uint64_t v6;

  begin = (uint64_t *)self->_strokes.__begin_;
  end = (uint64_t *)self->_strokes.__end_;
  if (begin == end)
    return 0;
  result = 0;
  do
  {
    v6 = *begin;
    v5 = begin[1];
    begin += 3;
    result += (v5 - v6) >> 4;
  }
  while (begin != end);
  return result;
}

- (void).cxx_destruct
{
  vector<std::vector<TIHandwritingPoint>, std::allocator<std::vector<TIHandwritingPoint>>> *p_strokes;

  p_strokes = &self->_strokes;
  if (self->_strokes.__begin_)
  {
    std::vector<std::vector<TIHandwritingPoint>>::__clear[abi:nn180100]((uint64_t *)&self->_strokes);
    operator delete(p_strokes->__begin_);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
