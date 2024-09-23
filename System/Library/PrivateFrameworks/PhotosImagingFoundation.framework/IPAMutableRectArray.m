@implementation IPAMutableRectArray

- (id)copyWithZone:(_NSZone *)a3
{
  return -[IPARectArray initWithRectArray:](+[IPARectArray allocWithZone:](IPARectArray, "allocWithZone:", a3), "initWithRectArray:", self);
}

- (void)removeAllRects
{
  *((_QWORD *)self->super._imp + 1) = *(_QWORD *)self->super._imp;
}

- (void)setRectArray:(id)a3
{
  id v4;
  _QWORD *v5;
  _QWORD *imp;
  char *v7;
  char *v8;
  int64_t v9;
  unint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  void **v15;
  char *v16;
  char *v17;
  char *v18;
  size_t v19;
  unint64_t v20;
  char *v21;
  void *v22;
  char *v23;
  id v24;

  v4 = a3;
  v24 = v4;
  if (v4)
  {
    v5 = (_QWORD *)*((_QWORD *)v4 + 1);
    imp = self->super._imp;
    if (imp == v5)
    {
LABEL_22:

      return;
    }
    v7 = (char *)*v5;
    v8 = (char *)v5[1];
    v9 = (int64_t)&v8[-*v5];
    v10 = v9 >> 5;
    v11 = imp[2];
    v12 = (char *)*imp;
    if (v9 >> 5 <= (unint64_t)((v11 - *imp) >> 5))
    {
      v18 = (char *)imp[1];
      v15 = (void **)(imp + 1);
      v17 = v18;
      v19 = v18 - v12;
      v20 = (v18 - v12) >> 5;
      if (v20 < v10)
      {
        v21 = &v7[32 * v20];
        if (v17 != v12)
        {
          memmove(v12, v7, v19);
          v12 = (char *)*v15;
        }
        v9 = v8 - v21;
        if (v8 == v21)
          goto LABEL_21;
        v22 = v12;
        v23 = v21;
        goto LABEL_20;
      }
    }
    else
    {
      if (v12)
      {
        imp[1] = v12;
        operator delete(v12);
        v11 = 0;
        *imp = 0;
        imp[1] = 0;
        imp[2] = 0;
      }
      if (v9 < 0)
        std::vector<PA::Rect>::__throw_length_error[abi:ne180100]();
      v13 = v11 >> 4;
      if (v11 >> 4 <= v10)
        v13 = v9 >> 5;
      if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFE0)
        v14 = 0x7FFFFFFFFFFFFFFLL;
      else
        v14 = v13;
      std::vector<PA::Rect>::__vallocate[abi:ne180100](imp, v14);
      v16 = (char *)imp[1];
      v15 = (void **)(imp + 1);
      v12 = v16;
    }
    if (v8 == v7)
    {
LABEL_21:
      *v15 = &v12[v9];
      goto LABEL_22;
    }
    v22 = v12;
    v23 = v7;
LABEL_20:
    memmove(v22, v23, v9);
    goto LABEL_21;
  }
  _PFAssertFailHandler();
  __break(1u);
}

- (void)addRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *imp;
  unint64_t v8;
  CGRect *v9;
  CGRect *v10;
  CGRect *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  BOOL v15;
  unint64_t v16;
  uint64_t v17;
  CGFloat *v18;
  unint64_t v19;
  CGSize size;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  imp = self->super._imp;
  v9 = (CGRect *)*((_QWORD *)imp + 1);
  v8 = *((_QWORD *)imp + 2);
  if ((unint64_t)v9 >= v8)
  {
    v11 = *(CGRect **)imp;
    v12 = ((uint64_t)v9 - *(_QWORD *)imp) >> 5;
    v13 = v12 + 1;
    if ((unint64_t)(v12 + 1) >> 59)
      std::vector<PA::Rect>::__throw_length_error[abi:ne180100]();
    v14 = v8 - (_QWORD)v11;
    if (v14 >> 4 > v13)
      v13 = v14 >> 4;
    v15 = (unint64_t)v14 >= 0x7FFFFFFFFFFFFFE0;
    v16 = 0x7FFFFFFFFFFFFFFLL;
    if (!v15)
      v16 = v13;
    if (v16)
    {
      v16 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<PA::Rect>>(v16);
      v11 = *(CGRect **)imp;
      v9 = (CGRect *)*((_QWORD *)imp + 1);
    }
    else
    {
      v17 = 0;
    }
    v18 = (CGFloat *)(v16 + 32 * v12);
    *v18 = x;
    v18[1] = y;
    v19 = v16 + 32 * v17;
    v18[2] = width;
    v18[3] = height;
    v10 = (CGRect *)(v18 + 4);
    if (v9 != v11)
    {
      do
      {
        size = v9[-1].size;
        *((_OWORD *)v18 - 2) = v9[-1].origin;
        *((CGSize *)v18 - 1) = size;
        v18 -= 4;
        --v9;
      }
      while (v9 != v11);
      v11 = *(CGRect **)imp;
    }
    *(_QWORD *)imp = v18;
    *((_QWORD *)imp + 1) = v10;
    *((_QWORD *)imp + 2) = v19;
    if (v11)
      operator delete(v11);
  }
  else
  {
    *v9 = a3;
    v10 = v9 + 1;
  }
  *((_QWORD *)imp + 1) = v10;
}

- (void)insertRect:(CGRect)a3 atIndex:(unint64_t)a4
{
  char **imp;
  uint64_t v5;
  char *v6;
  char *v7;
  char *v8;
  unint64_t v9;
  char *v10;
  char *v11;
  char *v12;
  __int128 v13;
  __int128 v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  char *v19;
  __int128 *v20;
  __int128 v21;
  __int128 v22;
  char *v23;
  char *v24;
  uint64_t v25;
  __int128 v26;
  char *v27;
  char *v28;
  char *v29;
  char *v30;
  __int128 v31;
  char *v32;
  char *v33;
  int64_t v34;
  char *v35;
  __int128 v36;
  __int128 v37;

  imp = (char **)self->super._imp;
  *(CGFloat *)&v36 = a3.origin.x;
  *((_QWORD *)&v36 + 1) = *(_QWORD *)&a3.origin.y;
  *(CGFloat *)&v37 = a3.size.width;
  *((_QWORD *)&v37 + 1) = *(_QWORD *)&a3.size.height;
  v5 = a4;
  v7 = *imp;
  v6 = imp[1];
  v8 = &(*imp)[32 * a4];
  v9 = (unint64_t)imp[2];
  if ((unint64_t)v6 >= v9)
  {
    v15 = ((v6 - v7) >> 5) + 1;
    if (v15 >> 59)
      std::vector<PA::Rect>::__throw_length_error[abi:ne180100]();
    v16 = v9 - (_QWORD)v7;
    if (v16 >> 4 > v15)
      v15 = v16 >> 4;
    if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFE0)
      v17 = 0x7FFFFFFFFFFFFFFLL;
    else
      v17 = v15;
    if (v17)
    {
      v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PA::Rect>>(v17);
    }
    else
    {
      v19 = 0;
      v18 = 0;
    }
    v23 = &v19[32 * v5];
    v24 = &v19[32 * v18];
    if (v5 == v18)
    {
      if (v5)
      {
        v23 -= (16 * v5 + 16) & 0x1FFFFFFFE0;
      }
      else
      {
        v23 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PA::Rect>>(1uLL);
        v24 = &v23[32 * v25];
        if (v19)
          operator delete(v19);
      }
    }
    v26 = v37;
    *(_OWORD *)v23 = v36;
    *((_OWORD *)v23 + 1) = v26;
    v27 = *imp;
    v28 = v23;
    if (*imp != v8)
    {
      v29 = v8;
      v30 = v23;
      do
      {
        v31 = *((_OWORD *)v29 - 1);
        v28 = v30 - 32;
        *((_OWORD *)v30 - 2) = *((_OWORD *)v29 - 2);
        *((_OWORD *)v30 - 1) = v31;
        v29 -= 32;
        v30 -= 32;
      }
      while (v29 != v27);
    }
    v32 = v23 + 32;
    v33 = imp[1];
    v34 = v33 - v8;
    if (v33 != v8)
      memmove(v32, v8, v33 - v8);
    v35 = *imp;
    *imp = v28;
    imp[1] = &v32[v34];
    imp[2] = v24;
    if (v35)
      operator delete(v35);
  }
  else if (v8 == v6)
  {
    v22 = v37;
    *(_OWORD *)v8 = v36;
    *((_OWORD *)v8 + 1) = v22;
    imp[1] = v8 + 32;
  }
  else
  {
    v10 = v8 + 32;
    v11 = v6 - 32;
    v12 = imp[1];
    while (v11 < v6)
    {
      v13 = *(_OWORD *)v11;
      v14 = *((_OWORD *)v11 + 1);
      v11 += 32;
      *(_OWORD *)v12 = v13;
      *((_OWORD *)v12 + 1) = v14;
      v12 += 32;
    }
    imp[1] = v12;
    if (v6 != v10)
      memmove(&v6[-32 * ((v6 - v10) >> 5)], v8, v6 - v10);
    v20 = &v36;
    if (v8 <= (char *)&v36)
      v20 = &v36 + 2 * (imp[1] > (char *)&v36);
    v21 = v20[1];
    *(_OWORD *)v8 = *v20;
    *((_OWORD *)v8 + 1) = v21;
  }
}

- (void)removeRectAtIndex:(unint64_t)a3
{
  _QWORD *imp;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  imp = self->super._imp;
  v4 = imp[1];
  v5 = *imp + 32 * a3;
  v6 = v4 - (v5 + 32);
  if (v4 != v5 + 32)
    memmove((void *)(*imp + 32 * a3), (const void *)(v5 + 32), v4 - (v5 + 32));
  imp[1] = v5 + v6;
}

@end
