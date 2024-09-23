@implementation CRImageSpacePolyline

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRImageSpacePolyline)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CRImageSpacePolyline *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CRPolylineData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  uncompressDataOfSize(v5, objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("CRPolylineUncompressedDataSize")));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CRImageSpacePolyline initWithCRCodableDataRepresentation:](self, "initWithCRCodableDataRepresentation:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[CRImageSpacePolyline crCodableDataRepresentation](self, "crCodableDataRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  compressData(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("CRPolylineData"));
  objc_msgSend(v6, "encodeInteger:forKey:", objc_msgSend(v4, "length"), CFSTR("CRPolylineUncompressedDataSize"));

}

- (_QWORD)initWithPoints:(void *)a1
{
  _QWORD *v3;
  _QWORD *v4;
  const void *v5;
  objc_super v7;

  if (!a1)
    return 0;
  v7.receiver = a1;
  v7.super_class = (Class)CRImageSpacePolyline;
  v3 = objc_msgSendSuper2(&v7, sel_init);
  if (v3)
  {
    v4 = (_QWORD *)operator new();
    *v4 = 0;
    v4[1] = 0;
    v4[2] = 0;
    if (a2)
      std::vector<CGPoint>::__init_with_size[abi:ne180100]<CGPoint*,CGPoint*>(v4, *(const void **)a2, *(_QWORD *)(a2 + 8), (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 4);
    v5 = (const void *)v3[2];
    v3[1] = v4;
    v3[2] = 0;
    if (v5)
      CFRelease(v5);
  }
  return v3;
}

- (CRImageSpacePolyline)initWithPolyline:(id)a3
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v6;
  CRImageSpacePolyline *v7;

  v4 = (uint64_t *)a3;
  v5 = v4;
  if (v4)
    v6 = v4[1];
  else
    v6 = 0;
  v7 = (CRImageSpacePolyline *)-[CRImageSpacePolyline initWithPoints:](self, v6);

  return v7;
}

- (CRImageSpacePolyline)init
{
  return -[CRImageSpacePolyline initWithPolyline:](self, "initWithPolyline:", 0);
}

- (CRImageSpacePolyline)initWithPointValues:(id)a3
{
  id v4;
  CRImageSpacePolyline *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  __n128 (*v11)(__n128 *, __n128 *);
  void (*v12)(uint64_t);
  void *v13;
  void *__p[3];

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x4812000000;
  v11 = __Block_byref_object_copy__9;
  v12 = __Block_byref_object_dispose__9;
  v13 = &unk_1D5168E96;
  std::vector<CGPoint>::vector(__p, objc_msgSend(v4, "count"));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__CRImageSpacePolyline_initWithPointValues___block_invoke;
  v7[3] = &unk_1E98DABB0;
  v7[4] = &v8;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
  v5 = (CRImageSpacePolyline *)-[CRImageSpacePolyline initWithPoints:](self, (uint64_t)(v9 + 6));
  _Block_object_dispose(&v8, 8);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  return v5;
}

void __44__CRImageSpacePolyline_initWithPointValues___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "pointValue");
  v5 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) + 16 * a3);
  *v5 = v6;
  v5[1] = v7;

}

- (CRImageSpacePolyline)initWithPoints:(CGPoint *)a3 count:(unint64_t)a4
{
  CRImageSpacePolyline *v6;
  CRImageSpacePolyline *v7;
  void **points;
  char *v9;
  _BYTE *v10;
  char *v11;
  char *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  uint64_t v18;
  void **v19;
  CGPoint *v20;
  CGPoint *v21;
  unint64_t v22;
  _OWORD *p_x;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  CGPoint *v29;
  CGPoint *v30;
  CGPoint *v31;
  CGPoint *v32;

  v6 = -[CRImageSpacePolyline init](self, "init");
  v7 = v6;
  if (v6)
  {
    points = (void **)v6->__points;
    v9 = (char *)*points;
    if (a4 > ((_BYTE *)points[2] - (_BYTE *)*points) >> 4)
    {
      if (a4 >> 60)
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      v10 = points[1];
      v11 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_NSRange>>((uint64_t)(points + 2), a4);
      v12 = &v11[(v10 - v9) & 0xFFFFFFFFFFFFFFF0];
      v14 = &v11[16 * v13];
      v16 = (char *)*points;
      v15 = (char *)points[1];
      v17 = v12;
      if (v15 != *points)
      {
        do
        {
          *((_OWORD *)v17 - 1) = *((_OWORD *)v15 - 1);
          v17 -= 16;
          v15 -= 16;
        }
        while (v15 != v16);
        v15 = (char *)*points;
      }
      *points = v17;
      points[1] = v12;
      points[2] = v14;
      if (v15)
        operator delete(v15);
    }
    if (a4)
    {
      v18 = 0;
      do
      {
        v19 = (void **)v7->__points;
        v20 = &a3[v18];
        v21 = (CGPoint *)v19[1];
        v22 = (unint64_t)v19[2];
        if ((unint64_t)v21 >= v22)
        {
          v24 = ((char *)v21 - (_BYTE *)*v19) >> 4;
          v25 = v24 + 1;
          if ((unint64_t)(v24 + 1) >> 60)
            std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
          v26 = v22 - (_QWORD)*v19;
          if (v26 >> 3 > v25)
            v25 = v26 >> 3;
          if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFF0)
            v27 = 0xFFFFFFFFFFFFFFFLL;
          else
            v27 = v25;
          if (v27)
            v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_NSRange>>((uint64_t)(v19 + 2), v27);
          else
            v28 = 0;
          v29 = (CGPoint *)&v28[16 * v24];
          *v29 = *v20;
          v31 = (CGPoint *)*v19;
          v30 = (CGPoint *)v19[1];
          v32 = v29;
          if (v30 != *v19)
          {
            do
            {
              v32[-1] = v30[-1];
              --v32;
              --v30;
            }
            while (v30 != v31);
            v30 = (CGPoint *)*v19;
          }
          p_x = (_OWORD *)&v29[1].x;
          *v19 = v32;
          v19[1] = &v29[1];
          v19[2] = &v28[16 * v27];
          if (v30)
            operator delete(v30);
        }
        else
        {
          *v21 = *v20;
          p_x = (_OWORD *)&v21[1].x;
        }
        v19[1] = p_x;
        ++v18;
      }
      while (v18 != a4);
    }
  }
  return v7;
}

- (id)polylineByAppendingPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;

  y = a3.y;
  x = a3.x;
  v5 = (void *)-[CRImageSpacePolyline copy](self, "copy");
  -[CRImageSpacePolyline appendPoint:]((uint64_t)v5, x, y);
  return v5;
}

- (void)appendPoint:(double)a3
{
  uint64_t v6;
  double *v7;
  unint64_t v8;
  double *v9;
  double *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  double *v16;
  char *v17;
  CFTypeRef src;

  if (a1)
  {
    v6 = *(_QWORD *)(a1 + 8);
    v7 = *(double **)(v6 + 8);
    v8 = *(_QWORD *)(v6 + 16);
    if ((unint64_t)v7 >= v8)
    {
      v10 = *(double **)v6;
      v11 = ((uint64_t)v7 - *(_QWORD *)v6) >> 4;
      v12 = v11 + 1;
      if ((unint64_t)(v11 + 1) >> 60)
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      v13 = v8 - (_QWORD)v10;
      if (v13 >> 3 > v12)
        v12 = v13 >> 3;
      if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF0)
        v14 = 0xFFFFFFFFFFFFFFFLL;
      else
        v14 = v12;
      if (v14)
      {
        v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_NSRange>>(v6 + 16, v14);
        v10 = *(double **)v6;
        v7 = *(double **)(v6 + 8);
      }
      else
      {
        v15 = 0;
      }
      v16 = (double *)&v15[16 * v11];
      v17 = &v15[16 * v14];
      *v16 = a2;
      v16[1] = a3;
      v9 = v16 + 2;
      if (v7 != v10)
      {
        do
        {
          *((_OWORD *)v16 - 1) = *((_OWORD *)v7 - 1);
          v16 -= 2;
          v7 -= 2;
        }
        while (v7 != v10);
        v10 = *(double **)v6;
      }
      *(_QWORD *)v6 = v16;
      *(_QWORD *)(v6 + 8) = v9;
      *(_QWORD *)(v6 + 16) = v17;
      if (v10)
        operator delete(v10);
    }
    else
    {
      *v7 = a2;
      v7[1] = a3;
      v9 = v7 + 2;
    }
    *(_QWORD *)(v6 + 8) = v9;
    src = 0;
    objc_copyCppObjectAtomic((void *)(a1 + 16), &src, (void (__cdecl *)(void *, const void *))__assign_helper_atomic_property_);
    if (src)
      CFRelease(src);
  }
}

- (id)polylineByAppendingPolyline:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)-[CRImageSpacePolyline copy](self, "copy");
  -[CRImageSpacePolyline appendPolyline:]((uint64_t)v5, v4);

  return v5;
}

- (void)appendPolyline:(uint64_t)a1
{
  char ***v3;
  char ***v4;
  char **v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  int64_t v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  __int128 v22;
  char *v23;
  uint64_t v24;
  char *v25;
  __int128 v26;
  CFTypeRef cf;
  void *__p;
  char *v29;
  char *v30;
  char *v31;
  uint64_t v32;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = v3[1];
    v7 = *v5;
    v6 = v5[1];
    if (v6 - v7 >= 1)
    {
      v8 = *(_QWORD *)(a1 + 8);
      v9 = *(char **)(v8 + 8);
      v10 = (v6 - v7) >> 4;
      v11 = *(_QWORD *)(v8 + 16);
      if (v10 <= (v11 - (uint64_t)v9) >> 4)
      {
        if (v10 <= 0)
        {
          v18 = *(char **)(v8 + 8);
          v19 = &v9[16 * v10];
          v20 = &v18[-16 * v10];
          v21 = v18;
          if (v20 < v9)
          {
            v21 = *(char **)(v8 + 8);
            do
            {
              v22 = *(_OWORD *)v20;
              v20 += 16;
              *(_OWORD *)v21 = v22;
              v21 += 16;
            }
            while (v20 < v9);
          }
          *(_QWORD *)(v8 + 8) = v21;
          if (v18 != v19)
            memmove(&v18[-16 * ((v18 - v19) >> 4)], v9, v18 - v19);
          if (&v7[16 * v10] != v7)
            memmove(v9, v7, 16 * v10);
        }
        else
        {
          v17 = v6 - v7;
          if (v6 != v7)
            memmove(*(void **)(v8 + 8), v7, v6 - v7);
          *(_QWORD *)(v8 + 8) = &v9[v17];
        }
      }
      else
      {
        v12 = (uint64_t)&v9[-*(_QWORD *)v8] >> 4;
        if ((unint64_t)(v12 + v10) >> 60)
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        v13 = v11 - *(_QWORD *)v8;
        v14 = v13 >> 3;
        if (v13 >> 3 <= (unint64_t)(v12 + v10))
          v14 = v12 + v10;
        if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF0)
          v15 = 0xFFFFFFFFFFFFFFFLL;
        else
          v15 = v14;
        v32 = v8 + 16;
        if (v15)
          v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_NSRange>>(v8 + 16, v15);
        else
          v16 = 0;
        v23 = &v16[16 * v12];
        __p = v16;
        v29 = v23;
        v31 = &v16[16 * v15];
        v24 = 16 * v10;
        v25 = &v23[16 * v10];
        do
        {
          v26 = *(_OWORD *)v7;
          v7 += 16;
          *(_OWORD *)v23 = v26;
          v23 += 16;
          v24 -= 16;
        }
        while (v24);
        v30 = v25;
        std::vector<CGPoint>::__swap_out_circular_buffer((void **)v8, (uint64_t)&__p, v9);
        if (v30 != v29)
          v30 += (v29 - v30 + 15) & 0xFFFFFFFFFFFFFFF0;
        if (__p)
          operator delete(__p);
      }
    }
    cf = 0;
    objc_copyCppObjectAtomic((void *)(a1 + 16), &cf, (void (__cdecl *)(void *, const void *))__assign_helper_atomic_property_);
    if (cf)
      CFRelease(cf);
  }

}

- (void)dealloc
{
  void **points;
  void *v4;
  objc_super v5;

  if (self)
  {
    points = (void **)self->__points;
    if (points)
    {
      v4 = *points;
      if (*points)
      {
        points[1] = v4;
        operator delete(v4);
      }
      MEMORY[0x1D826E294](points, 0x20C40960023A9);
      self->__points = 0;
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)CRImageSpacePolyline;
  -[CRImageSpacePolyline dealloc](&v5, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("Points: [\n"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__CRImageSpacePolyline_description__block_invoke;
  v7[3] = &unk_1E98DABD8;
  v4 = v3;
  v8 = v4;
  -[CRImageSpacePolyline enumeratePoints:](self, "enumeratePoints:", v7);
  objc_msgSend(v4, "appendString:", CFSTR("]"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

void __35__CRImageSpacePolyline_description__block_invoke(uint64_t a1, double a2, double a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  NSStringFromPoint(*(NSPoint *)&a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), v4);

}

- (CGPath)path
{
  ObjectRef<const CGPath *> *p_pathRef;
  CGPath *v4;
  CFTypeRef cf;
  void *dest;

  if (!self)
    return 0;
  p_pathRef = &self->__pathRef;
  objc_copyCppObjectAtomic(&dest, &self->__pathRef, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property_);
  if (dest)
  {
    CFRelease(dest);
  }
  else
  {
    -[CRImageSpacePolyline createPathWithTransformer:](&cf, self, 0);
    objc_copyCppObjectAtomic(p_pathRef, &cf, (void (__cdecl *)(void *, const void *))__assign_helper_atomic_property_);
    if (cf)
      CFRelease(cf);
  }
  objc_copyCppObjectAtomic(&dest, p_pathRef, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property_);
  v4 = (CGPath *)dest;
  if (dest)
    CFRelease(dest);
  return v4;
}

- (void)createPathWithTransformer:(void *)a3
{
  id v5;
  CGMutablePathRef Mutable;
  _QWORD v7[4];
  id v8;
  CFTypeRef cf;
  CGMutablePathRef v10;

  v5 = a3;
  if (a2)
  {
    Mutable = CGPathCreateMutable();
    v10 = Mutable;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3321888768;
    v7[2] = __50__CRImageSpacePolyline_createPathWithTransformer___block_invoke;
    v7[3] = &unk_1E98D9410;
    v8 = v5;
    if (Mutable)
      CFRetain(Mutable);
    cf = Mutable;
    objc_msgSend(a2, "enumeratePoints:", v7);
    *a1 = MEMORY[0x1D826DAB4](Mutable);
    if (cf)
      CFRelease(cf);

    if (Mutable)
      CFRelease(Mutable);
  }
  else
  {
    *a1 = 0;
  }

}

- (unint64_t)pointCount
{
  return (uint64_t)(*((_QWORD *)self->__points + 1) - *(_QWORD *)self->__points) >> 4;
}

void __50__CRImageSpacePolyline_createPathWithTransformer___block_invoke(uint64_t a1, uint64_t a2, CGFloat a3, CGFloat a4)
{
  uint64_t v6;
  CGPath *v7;

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(void))(v6 + 16))();
  v7 = *(CGPath **)(a1 + 40);
  if (a2)
    CGPathAddLineToPoint(v7, 0, a3, a4);
  else
    CGPathMoveToPoint(v7, 0, a3, a4);
}

- (NSArray)pointValues
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = (void *)objc_opt_new();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__CRImageSpacePolyline_pointValues__block_invoke;
  v7[3] = &unk_1E98DABD8;
  v4 = v3;
  v8 = v4;
  -[CRImageSpacePolyline enumeratePoints:](self, "enumeratePoints:", v7);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

void __35__CRImageSpacePolyline_pointValues__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPoint:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:");

}

- (void)enumeratePointsWithTransformer:(void *)a3 block:
{
  void (**v5)(_QWORD, double, double);
  void (**v6)(id, uint64_t, _BYTE *, __n128, __n128);
  __n128 v7;
  __n128 v8;
  unint64_t **v9;
  unint64_t *v10;
  unint64_t *v11;
  char v12;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v9 = *(unint64_t ***)(a1 + 8);
    v10 = *v9;
    if (*v9 != v9[1])
    {
      v11 = *v9;
      do
      {
        v12 = 0;
        v7.n128_u64[0] = *v11;
        v8.n128_u64[0] = v11[1];
        if (v5)
        {
          v5[2](v5, v7.n128_f64[0], v8.n128_f64[0]);
          v9 = *(unint64_t ***)(a1 + 8);
        }
        v6[2](v6, ((char *)v10 - (char *)*v9) >> 4, &v12, v7, v8);
        if (v12)
          break;
        v9 = *(unint64_t ***)(a1 + 8);
        v10 += 2;
        v11 += 2;
      }
      while (v11 != v9[1]);
    }
  }

}

- (void)enumeratePoints:(id)a3
{
  -[CRImageSpacePolyline enumeratePointsWithTransformer:block:]((uint64_t)self, 0, a3);
}

- (BOOL)isEqual:(id)a3
{
  CRImageSpacePolyline *v4;
  CRImageSpacePolyline *v5;
  unint64_t v6;
  BOOL v7;
  _QWORD v9[4];
  CRImageSpacePolyline *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = (CRImageSpacePolyline *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[CRImageSpacePolyline pointCount](self, "pointCount");
      if (v6 == -[CRImageSpacePolyline pointCount](v5, "pointCount"))
      {
        v13 = 0;
        v14 = &v13;
        v15 = 0x2020000000;
        v16 = 1;
        v9[0] = MEMORY[0x1E0C809B0];
        v9[1] = 3221225472;
        v9[2] = __32__CRImageSpacePolyline_isEqual___block_invoke;
        v9[3] = &unk_1E98DAC00;
        v11 = &v13;
        v12 = 0x3FE0000000000000;
        v10 = v5;
        -[CRImageSpacePolyline enumeratePoints:](self, "enumeratePoints:", v9);
        v7 = *((_BYTE *)v14 + 24) != 0;

        _Block_object_dispose(&v13, 8);
      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

uint64_t __32__CRImageSpacePolyline_isEqual___block_invoke(uint64_t result, unint64_t a2, _BYTE *a3, double a4, double a5)
{
  uint64_t v5;
  double *v6;
  double v7;
  double v8;

  v5 = **(_QWORD **)(*(_QWORD *)(result + 32) + 8);
  if (a2 >= (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 8) - v5) >> 4)
    std::vector<std::vector<BreakPoint>>::__throw_out_of_range[abi:ne180100]();
  v6 = (double *)(v5 + 16 * a2);
  v7 = *(double *)(result + 48);
  v8 = vabdd_f64(a5, v6[1]);
  if (vabdd_f64(a4, *v6) > v7 || v8 > v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

- (id)simplified
{
  CRImageSpacePolyline *v2;
  _QWORD *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  __n128 (*v9)(__n128 *, __n128 *);
  void (*v10)(uint64_t);
  void *v11;
  void *__p;
  void *v13;
  uint64_t v14;

  v6 = 0;
  v7 = &v6;
  v8 = 0x4812000000;
  v9 = __Block_byref_object_copy__9;
  v10 = __Block_byref_object_dispose__9;
  v11 = &unk_1D5168E96;
  __p = 0;
  v13 = 0;
  v14 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__CRImageSpacePolyline_simplified__block_invoke;
  v5[3] = &unk_1E98DAC28;
  v5[4] = &v6;
  -[CRImageSpacePolyline enumeratePoints:](self, "enumeratePoints:", v5);
  v2 = [CRImageSpacePolyline alloc];
  v3 = -[CRImageSpacePolyline initWithPoints:](v2, (uint64_t)(v7 + 6));
  _Block_object_dispose(&v6, 8);
  if (__p)
  {
    v13 = __p;
    operator delete(__p);
  }
  return v3;
}

void __34__CRImageSpacePolyline_simplified__block_invoke(uint64_t a1, uint64_t a2, double a3, double a4)
{
  _QWORD *v6;
  void **v7;
  double *v8;
  double v9;
  double v10;
  double *v12;
  uint64_t v13;
  uint64_t v14;
  double *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  unint64_t v21;
  double *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  double *v28;
  char *v29;

  v6 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
  v7 = (void **)(v6 + 6);
  v8 = (double *)v6[7];
  if (!a2)
  {
    v21 = v6[8];
    if ((unint64_t)v8 >= v21)
    {
      v12 = (double *)*v7;
      v23 = ((char *)v8 - (_BYTE *)*v7) >> 4;
      v24 = v23 + 1;
      if (!((unint64_t)(v23 + 1) >> 60))
      {
        v25 = v21 - (_QWORD)v12;
        if (v25 >> 3 > v24)
          v24 = v25 >> 3;
        if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFF0)
          v26 = 0xFFFFFFFFFFFFFFFLL;
        else
          v26 = v24;
        if (v26)
        {
          v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_NSRange>>((uint64_t)(v6 + 8), v26);
          v12 = (double *)v6[6];
          v8 = (double *)v6[7];
        }
        else
        {
          v27 = 0;
        }
        v28 = (double *)&v27[16 * v23];
        v29 = &v27[16 * v26];
        *v28 = a3;
        v28[1] = a4;
        v22 = v28 + 2;
        if (v8 == v12)
          goto LABEL_36;
        do
        {
          *((_OWORD *)v28 - 1) = *((_OWORD *)v8 - 1);
          v28 -= 2;
          v8 -= 2;
        }
        while (v8 != v12);
        goto LABEL_35;
      }
LABEL_40:
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
LABEL_18:
    *v8 = a3;
    v8[1] = a4;
    v22 = v8 + 2;
LABEL_38:
    v6[7] = v22;
    return;
  }
  v9 = *(v8 - 2);
  v10 = *(v8 - 1);
  if (v9 != a3 || v10 != a4)
  {
    v12 = (double *)*v7;
    v13 = (char *)v8 - (_BYTE *)*v7;
    v14 = v13 >> 4;
    if ((unint64_t)v13 >= 0x11)
    {
      v15 = &v12[2 * v14];
      if ((a4 - v10) * (a3 - *(v15 - 4)) == (a3 - v9) * (a4 - *(v15 - 3)))
      {
        *(v15 - 2) = a3;
        *(v15 - 1) = a4;
        return;
      }
    }
    v16 = v6[8];
    if ((unint64_t)v8 >= v16)
    {
      v17 = v14 + 1;
      if (!((unint64_t)(v14 + 1) >> 60))
      {
        v18 = v16 - (_QWORD)v12;
        if (v18 >> 3 > v17)
          v17 = v18 >> 3;
        if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFF0)
          v19 = 0xFFFFFFFFFFFFFFFLL;
        else
          v19 = v17;
        if (v19)
        {
          v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_NSRange>>((uint64_t)(v6 + 8), v19);
          v12 = (double *)v6[6];
          v8 = (double *)v6[7];
        }
        else
        {
          v20 = 0;
        }
        v28 = (double *)&v20[16 * v14];
        v29 = &v20[16 * v19];
        *v28 = a3;
        v28[1] = a4;
        v22 = v28 + 2;
        if (v8 == v12)
          goto LABEL_36;
        do
        {
          *((_OWORD *)v28 - 1) = *((_OWORD *)v8 - 1);
          v28 -= 2;
          v8 -= 2;
        }
        while (v8 != v12);
LABEL_35:
        v12 = (double *)*v7;
LABEL_36:
        v6[6] = v28;
        v6[7] = v22;
        v6[8] = v29;
        if (v12)
          operator delete(v12);
        goto LABEL_38;
      }
      goto LABEL_40;
    }
    goto LABEL_18;
  }
}

- (id)rotated180
{
  void *points;
  __int128 *v4;
  unint64_t v5;
  unint64_t v6;
  __int128 *v7;
  __int128 *v8;
  int64_t v9;
  unint64_t v11;
  uint64_t v12;
  __int128 *v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 *v19;
  __int128 v20;
  __int128 *v21;
  __int128 *v22;
  __int128 *v23;
  __int128 *v24;
  BOOL v25;
  char v26;
  uint64_t v27;
  _QWORD *v28;
  void *__p;
  __int128 *v30;
  uint64_t v31;
  __int128 v32;

  if ((-[CRImageSpacePolyline pointCount](self, "pointCount") & 1) != 0)
    return (id)-[CRImageSpacePolyline copy](self, "copy");
  if (!self)
    return (id)-[CRImageSpacePolyline copy](self, "copy");
  points = self->__points;
  if (!points)
    return (id)-[CRImageSpacePolyline copy](self, "copy");
  __p = 0;
  v30 = 0;
  v31 = 0;
  std::vector<CGPoint>::__init_with_size[abi:ne180100]<CGPoint*,CGPoint*>(&__p, *(const void **)points, *((_QWORD *)points + 1), (uint64_t)(*((_QWORD *)points + 1) - *(_QWORD *)points) >> 4);
  v4 = (__int128 *)__p;
  v5 = -[CRImageSpacePolyline pointCount](self, "pointCount");
  if (v5 >= 2)
  {
    v6 = v5 >> 1;
    v7 = &v4[v5 >> 1];
    v8 = v30;
    if (v7 != v30)
    {
      if (v6 == 1)
      {
        v32 = *v4;
        v9 = (char *)v30 - (char *)v7;
        memmove(v4, v7, (char *)v30 - (char *)v7);
        *(__int128 *)((char *)v4 + v9) = v32;
      }
      else if (v7 + 1 == v30)
      {
        v32 = *(v30 - 1);
        if (v30 - 1 != v4)
          memmove(v4 + 1, v4, (char *)(v30 - 1) - (char *)v4);
        *v4 = v32;
      }
      else if (v6 == v30 - v7)
      {
        v11 = 0;
        v12 = 16 * v6 - 16;
        v13 = &v4[v6];
        do
        {
          v14 = v4[v11 / 0x10];
          v4[v11 / 0x10] = v13[v11 / 0x10];
          v13[v11 / 0x10] = v14;
          if (v12 == v11)
            break;
          v15 = (uint64_t)&v13[v11 / 0x10 + 1];
          v11 += 16;
        }
        while ((__int128 *)v15 != v8);
      }
      else
      {
        v16 = v30 - v7;
        v17 = v5 >> 1;
        do
        {
          v18 = v17;
          v17 = v16;
          v16 = v18 % v16;
        }
        while (v16);
        if (v17)
        {
          v19 = &v4[v17];
          do
          {
            v20 = *--v19;
            v32 = v20;
            v21 = &v19[v6];
            v22 = v19;
            do
            {
              v23 = v21;
              *v22 = *v21;
              v24 = &v21[v6];
              v25 = __OFSUB__(v6, v8 - v21);
              v27 = v6 - (v8 - v21);
              v26 = (v27 < 0) ^ v25;
              v21 = &v4[v27];
              if (v26)
                v21 = v24;
              v22 = v23;
            }
            while (v21 != v19);
            *v23 = v32;
          }
          while (v19 != v4);
        }
      }
    }
  }
  v28 = -[CRImageSpacePolyline initWithPoints:]([CRImageSpacePolyline alloc], (uint64_t)&__p);
  if (__p)
  {
    v30 = (__int128 *)__p;
    operator delete(__p);
  }
  return v28;
}

- (CGSize)estimatedLineSizeForPairedPointPolygon
{
  double **points;
  double *v4;
  double v5;
  double v6;
  unint64_t v7;
  double *v8;
  double v9;
  double v10;
  double *v11;
  double v12;
  double v13;
  _QWORD *v14;
  unint64_t v15;
  double *v16;
  double v17;
  double v18;
  _QWORD *v19;
  unint64_t v20;
  double *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  BOOL v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  _QWORD v37[7];
  uint64_t v38;
  double *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  double *v43;
  uint64_t v44;
  uint64_t v45;
  CGSize result;

  v42 = 0;
  v43 = (double *)&v42;
  v44 = 0x2020000000;
  v45 = 0;
  v38 = 0;
  v39 = (double *)&v38;
  v40 = 0x2020000000;
  v41 = 0;
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __62__CRImageSpacePolyline_estimatedLineSizeForPairedPointPolygon__block_invoke;
  v37[3] = &unk_1E98DAC50;
  v37[4] = self;
  v37[5] = &v42;
  v37[6] = &v38;
  -[CRImageSpacePolyline enumeratePoints:](self, "enumeratePoints:", v37);
  points = (double **)self->__points;
  v4 = *points;
  if (points[1] == *points
    || (v5 = *v4,
        v6 = v4[1],
        v7 = -[CRImageSpacePolyline pointCount](self, "pointCount") - 1,
        v7 >= ((char *)points[1] - (char *)*points) >> 4))
  {
    std::vector<std::vector<BreakPoint>>::__throw_out_of_range[abi:ne180100]();
  }
  v8 = &(*points)[2 * v7];
  v9 = *v8;
  v10 = v8[1];
  v11 = (double *)MEMORY[0x1E0C9D820];
  v12 = *MEMORY[0x1E0C9D820];
  v13 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v14 = self->__points;
  v15 = -[CRImageSpacePolyline pointCount](self, "pointCount") >> 1;
  if (v15 >= (uint64_t)(v14[1] - *v14) >> 4
    || (v16 = (double *)(*v14 + 16 * v15),
        v17 = *v16,
        v18 = v16[1],
        v19 = self->__points,
        v20 = (-[CRImageSpacePolyline pointCount](self, "pointCount") >> 1) - 1,
        v20 >= (uint64_t)(v19[1] - *v19) >> 4))
  {
    std::vector<std::vector<BreakPoint>>::__throw_out_of_range[abi:ne180100]();
  }
  v21 = (double *)(*v19 + 16 * v20);
  v22 = *v21;
  v23 = v21[1];
  v24 = *v11;
  if (*v11 > 0.0)
  {
    v25 = v11[1];
    v26 = v25 <= 0.0;
    v27 = v17 * v24;
    v28 = v18 * v25;
    v29 = v22 * v24;
    v30 = v23 * v25;
    if (!v26)
    {
      v22 = v29;
      v23 = v30;
      v17 = v27;
      v18 = v28;
    }
  }
  if (v12 > 0.0 && v13 > 0.0)
  {
    v9 = v9 * v12;
    v10 = v10 * v13;
    v5 = v5 * v12;
    v6 = v6 * v13;
  }
  v31 = sqrt((v18 - v23) * (v18 - v23) + (v17 - v22) * (v17 - v22));
  v32 = sqrt((v6 - v10) * (v6 - v10) + (v5 - v9) * (v5 - v9));
  v33 = (v43[3] + v39[3]) * 0.5;
  v34 = (v31 + v32) * 0.5;
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);
  v35 = v33;
  v36 = v34;
  result.height = v36;
  result.width = v35;
  return result;
}

unint64_t __62__CRImageSpacePolyline_estimatedLineSizeForPairedPointPolygon__block_invoke(unint64_t result, unint64_t a2, double a3, double a4)
{
  _QWORD *v7;
  _QWORD **v8;
  uint64_t v9;
  double *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;

  if (a2)
  {
    v7 = (_QWORD *)result;
    result = objc_msgSend(*(id *)(result + 32), "pointCount");
    if (a2 != result >> 1)
    {
      v8 = (_QWORD **)v7[4];
      v9 = *v8[1];
      if (a2 - 1 >= (v8[1][1] - v9) >> 4)
        std::vector<std::vector<BreakPoint>>::__throw_out_of_range[abi:ne180100]();
      v10 = (double *)(v9 + 16 * (a2 - 1));
      v11 = *v10;
      v12 = v10[1];
      v13 = *MEMORY[0x1E0C9D820];
      if (*MEMORY[0x1E0C9D820] > 0.0)
      {
        v14 = *(double *)(MEMORY[0x1E0C9D820] + 8);
        v15 = v14 <= 0.0;
        v16 = a3 * v13;
        v17 = a4 * v14;
        v18 = v11 * v13;
        v19 = v12 * v14;
        if (!v15)
        {
          v11 = v18;
          v12 = v19;
          a3 = v16;
          a4 = v17;
        }
      }
      v20 = sqrt((a4 - v12) * (a4 - v12) + (a3 - v11) * (a3 - v11));
      result = objc_msgSend(v8, "pointCount");
      if (a2 >= result >> 1)
        v21 = v7[6];
      else
        v21 = v7[5];
      *(double *)(*(_QWORD *)(v21 + 8) + 24) = v20 + *(double *)(*(_QWORD *)(v21 + 8) + 24);
    }
  }
  return result;
}

- (CGRect)boundingRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _QWORD v10[8];
  uint64_t v11;
  double *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double *v24;
  uint64_t v25;
  uint64_t v26;
  CGRect result;

  v23 = 0;
  v24 = (double *)&v23;
  v25 = 0x2020000000;
  v26 = 0x7FEFFFFFFFFFFFFFLL;
  v19 = 0;
  v20 = (double *)&v19;
  v21 = 0x2020000000;
  v22 = 0x7FEFFFFFFFFFFFFFLL;
  v15 = 0;
  v16 = (double *)&v15;
  v17 = 0x2020000000;
  v18 = 0x10000000000000;
  v11 = 0;
  v12 = (double *)&v11;
  v13 = 0x2020000000;
  v14 = 0x10000000000000;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __36__CRImageSpacePolyline_boundingRect__block_invoke;
  v10[3] = &unk_1E98DAC78;
  v10[4] = &v23;
  v10[5] = &v19;
  v10[6] = &v15;
  v10[7] = &v11;
  -[CRImageSpacePolyline enumeratePoints:](self, "enumeratePoints:", v10);
  v2 = v24[3];
  v3 = v20[3];
  v4 = v16[3] - v2;
  v5 = v12[3] - v3;
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  v6 = v2;
  v7 = v3;
  v8 = v4;
  v9 = v5;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

_QWORD *__36__CRImageSpacePolyline_boundingRect__block_invoke(_QWORD *result, double a2, double a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(result[4] + 8);
  if (a2 < *(double *)(v3 + 24))
    *(double *)(v3 + 24) = a2;
  v4 = *(_QWORD *)(result[5] + 8);
  if (a3 < *(double *)(v4 + 24))
    *(double *)(v4 + 24) = a3;
  v5 = *(_QWORD *)(result[6] + 8);
  if (a2 > *(double *)(v5 + 24))
    *(double *)(v5 + 24) = a2;
  v6 = *(_QWORD *)(result[7] + 8);
  if (a3 > *(double *)(v6 + 24))
    *(double *)(v6 + 24) = a3;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CRImageSpacePolyline initWithPolyline:](+[CRImageSpacePolyline allocWithZone:](CRImageSpacePolyline, "allocWithZone:", a3), "initWithPolyline:", self);
}

- (id)crCodableDataRepresentation
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = (void *)objc_opt_new();
  +[CRCodingUtilities appendInteger:toData:](CRCodingUtilities, "appendInteger:toData:", 1, v3);
  +[CRCodingUtilities appendUInteger:toData:](CRCodingUtilities, "appendUInteger:toData:", (uint64_t)(*((_QWORD *)self->__points + 1) - *(_QWORD *)self->__points) >> 4, v3);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__CRImageSpacePolyline_crCodableDataRepresentation__block_invoke;
  v6[3] = &unk_1E98DABD8;
  v4 = v3;
  v7 = v4;
  -[CRImageSpacePolyline enumeratePoints:](self, "enumeratePoints:", v6);

  return v4;
}

uint64_t __51__CRImageSpacePolyline_crCodableDataRepresentation__block_invoke(uint64_t a1)
{
  return +[CRCodingUtilities appendPoint:toData:](CRCodingUtilities, "appendPoint:toData:", *(_QWORD *)(a1 + 32));
}

- (CRImageSpacePolyline)initWithCRCodableDataRepresentation:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  CRImageSpacePolyline *v10;
  void *__p[3];
  uint64_t v13;

  v4 = a3;
  v13 = 0;
  if (+[CRCodingUtilities integerFromEncodingData:offset:](CRCodingUtilities, "integerFromEncodingData:offset:", v4, &v13) == 1)
  {
    v5 = +[CRCodingUtilities unsignedIntegerFromEncodingData:offset:](CRCodingUtilities, "unsignedIntegerFromEncodingData:offset:", v4, &v13);
    std::vector<CGPoint>::vector(__p, v5);
    if (v5)
    {
      v6 = 0;
      do
      {
        +[CRCodingUtilities pointFromEncodingData:offset:](CRCodingUtilities, "pointFromEncodingData:offset:", v4, &v13);
        v7 = (char *)__p[0] + v6;
        *v7 = v8;
        v7[1] = v9;
        v6 += 16;
        --v5;
      }
      while (v5);
    }
    self = -[CRImageSpacePolyline initWithPoints:](self, (uint64_t)__p);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
  CGPath *mCFObject;

  mCFObject = self->__pathRef.mCFObject;
  if (mCFObject)
    CFRelease(mCFObject);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
