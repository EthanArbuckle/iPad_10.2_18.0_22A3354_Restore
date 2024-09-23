@implementation IPARectArray

- (IPARectArray)init
{
  IPARectArray *v2;
  _QWORD *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IPARectArray;
  v2 = -[IPARectArray init](&v5, sel_init);
  if (v2)
  {
    v3 = (_QWORD *)operator new();
    *v3 = 0;
    v3[1] = 0;
    v3[2] = 0;
    v2->_imp = v3;
  }
  return v2;
}

- (IPARectArray)initWithRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  IPARectArray *v7;
  _QWORD *v8;
  CGFloat *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)IPARectArray;
  v7 = -[IPARectArray init](&v11, sel_init);
  if (v7)
  {
    v8 = (_QWORD *)operator new();
    *v8 = 0;
    v8[1] = 0;
    v8[2] = 0;
    v9 = (CGFloat *)operator new(0x20uLL);
    *v9 = x;
    v9[1] = y;
    v9[2] = width;
    v9[3] = height;
    *v8 = v9;
    v8[1] = v9 + 4;
    v8[2] = v9 + 4;
    v7->_imp = v8;
  }
  return v7;
}

- (IPARectArray)initWithRectArray:(id)a3
{
  _QWORD *v4;
  IPARectArray *v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  _BYTE *v9;
  _BYTE *v10;
  int64_t v11;
  char *v12;
  IPARectArray *result;
  objc_super v14;

  v4 = a3;
  if (v4)
  {
    v14.receiver = self;
    v14.super_class = (Class)IPARectArray;
    v5 = -[IPARectArray init](&v14, sel_init);
    if (v5)
    {
      v6 = (_QWORD *)operator new();
      v7 = v6;
      v8 = v4[1];
      *v6 = 0;
      v6[1] = 0;
      v6[2] = 0;
      v10 = *(_BYTE **)v8;
      v9 = *(_BYTE **)(v8 + 8);
      v11 = v9 - v10;
      if (v9 != v10)
      {
        std::vector<PA::Rect>::__vallocate[abi:ne180100](v6, v11 >> 5);
        v12 = (char *)v7[1];
        memmove(v12, v10, v11);
        v7[1] = &v12[32 * (v11 >> 5)];
      }
      v5->_imp = v7;
    }

    return v5;
  }
  else
  {
    result = (IPARectArray *)_PFAssertFailHandler();
    __break(1u);
  }
  return result;
}

- (void)dealloc
{
  void **imp;
  void *v4;
  objc_super v5;

  imp = (void **)self->_imp;
  if (imp)
  {
    v4 = *imp;
    if (*imp)
    {
      imp[1] = v4;
      operator delete(v4);
    }
    MEMORY[0x1D82668A8](imp, 0x20C40960023A9);
  }
  v5.receiver = self;
  v5.super_class = (Class)IPARectArray;
  -[IPARectArray dealloc](&v5, sel_dealloc);
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __27__IPARectArray_description__block_invoke;
  v11[3] = &unk_1E986E010;
  v4 = v3;
  v12 = v4;
  -[IPARectArray enumerateRects:](self, "enumerateRects:", v11);
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_opt_class();
  v7 = -[IPARectArray count](self, "count");
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(","));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@:%p %lu rects: %@>"), v6, self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[IPARectArray initWithRectArray:](+[IPAMutableRectArray allocWithZone:](IPAMutableRectArray, "allocWithZone:", a3), "initWithRectArray:", self);
}

- (unint64_t)count
{
  return (uint64_t)(*((_QWORD *)self->_imp + 1) - *(_QWORD *)self->_imp) >> 5;
}

- (BOOL)isEmpty
{
  return *(_QWORD *)self->_imp == *((_QWORD *)self->_imp + 1);
}

- (CGRect)rectAtIndex:(unint64_t)a3
{
  uint64_t v3;
  double *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  v3 = *(_QWORD *)self->_imp;
  if (a3 >= (unint64_t)((*((_QWORD *)self->_imp + 1) - v3) >> 5))
    std::vector<PA::Rect>::__throw_out_of_range[abi:ne180100]();
  v4 = (double *)(v3 + 32 * a3);
  v5 = *v4;
  v6 = v4[1];
  v7 = v4[2];
  v8 = v4[3];
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (void)enumerateRects:(id)a3
{
  double **imp;
  double *v5;
  double *v6;
  void (**v7)(double, double, double, double);

  v7 = (void (**)(double, double, double, double))a3;
  imp = (double **)self->_imp;
  v6 = *imp;
  v5 = imp[1];
  while (v6 != v5)
  {
    v7[2](*v6, v6[1], v6[2], v6[3]);
    v5 = (double *)*((_QWORD *)self->_imp + 1);
    v6 += 4;
  }

}

void __27__IPARectArray_description__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  NSStringFromRect(*(NSRect *)&a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:");

}

+ (id)rectArray
{
  return objc_alloc_init((Class)a1);
}

+ (id)rectArrayWithRect:(CGRect)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

@end
