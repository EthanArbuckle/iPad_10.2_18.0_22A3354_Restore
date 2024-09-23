@implementation CRNormalizedPolyline

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRNormalizedPolyline)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CRNormalizedPolyline *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CRPolylineData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  uncompressDataOfSize(v5, objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("CRPolylineUncompressedDataSize")));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CRNormalizedPolyline initWithCRCodableDataRepresentation:](self, "initWithCRCodableDataRepresentation:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[CRNormalizedPolyline crCodableDataRepresentation](self, "crCodableDataRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  compressData(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("CRPolylineData"));
  objc_msgSend(v6, "encodeInteger:forKey:", objc_msgSend(v4, "length"), CFSTR("CRPolylineUncompressedDataSize"));

}

- (CRNormalizedPolyline)initWithNormalizedPoints:(CGPoint *)a3 count:(unint64_t)a4 size:(CGSize)a5
{
  unint64_t v5;
  float64x2_t *v8;
  float64x2_t v9;
  float64x2_t v10;
  CRNormalizedPolyline *v11;
  _QWORD *v12;
  CGFloat width;
  double v15;
  double height;
  void *__p[3];

  width = a5.width;
  height = a5.height;
  v5 = a4;
  std::vector<CGPoint>::vector(__p, a4);
  if (v5)
  {
    v8 = (float64x2_t *)__p[0];
    v9.f64[0] = width;
    v9.f64[1] = height;
    do
    {
      v10 = *(float64x2_t *)a3++;
      *v8++ = vmulq_f64(v9, v10);
      --v5;
    }
    while (v5);
  }
  v11 = -[CRNormalizedPolyline init](self, "init", *(_QWORD *)&width);
  if (v11)
  {
    v12 = -[CRImageSpacePolyline initWithPoints:]([CRImageSpacePolyline alloc], (uint64_t)__p);
    -[CRNormalizedPolyline setDenormalizedPolyline:](v11, "setDenormalizedPolyline:", v12);

    -[CRNormalizedPolyline setNormalizationSize:](v11, "setNormalizationSize:", v15, height);
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return v11;
}

- (CRNormalizedPolyline)init
{
  CRNormalizedPolyline *v2;
  CRNormalizedPolyline *v3;
  CGPath *mCFObject;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRNormalizedPolyline;
  v2 = -[CRNormalizedPolyline init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    mCFObject = v2->__pathRef.mCFObject;
    v3->__pathRef.mCFObject = 0;
    if (mCFObject)
      CFRelease(mCFObject);
  }
  return v3;
}

- (CRNormalizedPolyline)initWithPolyline:(id)a3
{
  id v4;
  CRNormalizedPolyline *v5;
  void *v6;

  v4 = a3;
  v5 = -[CRNormalizedPolyline init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "denormalizedPolyline");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRNormalizedPolyline setDenormalizedPolyline:](v5, "setDenormalizedPolyline:", v6);

    objc_msgSend(v4, "normalizationSize");
    -[CRNormalizedPolyline setNormalizationSize:](v5, "setNormalizationSize:");
  }

  return v5;
}

- (CRNormalizedPolyline)initWithDenormalizedPolyline:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  id v7;
  CRNormalizedPolyline *v8;
  CRNormalizedPolyline *v9;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v8 = -[CRNormalizedPolyline init](self, "init");
  v9 = v8;
  if (v8)
  {
    -[CRNormalizedPolyline setDenormalizedPolyline:](v8, "setDenormalizedPolyline:", v7);
    -[CRNormalizedPolyline setNormalizationSize:](v9, "setNormalizationSize:", width, height);
  }

  return v9;
}

- (CRNormalizedPolyline)initWithNormalizedPointValues:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  void *v15;
  CRImageSpacePolyline *v16;
  CRNormalizedPolyline *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  height = a4.height;
  width = a4.width;
  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v20;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v12), "pointValue", (_QWORD)v19);
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPoint:", width * v13, height * v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v15);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  v16 = -[CRImageSpacePolyline initWithPointValues:]([CRImageSpacePolyline alloc], "initWithPointValues:", v8);
  v17 = -[CRNormalizedPolyline initWithDenormalizedPolyline:size:](self, "initWithDenormalizedPolyline:size:", v16, width, height);

  return v17;
}

- (id)polylineByAppendingPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;

  y = a3.y;
  x = a3.x;
  v5 = (void *)-[CRNormalizedPolyline copy](self, "copy");
  objc_msgSend(v5, "appendPoint:", x, y);
  return v5;
}

- (id)polylineByAppendingPolyline:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v12;

  v4 = a3;
  -[CRNormalizedPolyline normalizationSize](self, "normalizationSize");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "normalizationSize");
  if (v6 == v10 && v8 == v9)
  {
    v12 = (void *)-[CRNormalizedPolyline copy](self, "copy");
    objc_msgSend(v12, "appendPolyline:", v4);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSSize v10;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  -[CRNormalizedPolyline normalizationSize](self, "normalizationSize");
  NSStringFromSize(v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRNormalizedPolyline denormalizedPolyline](self, "denormalizedPolyline");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Size: %@\nDenormalized Polyline: %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (CGPath)path
{
  void *v3;
  CGPath *v4;
  _QWORD v6[5];
  CFTypeRef v7;
  void *v8;

  -[CRNormalizedPolyline _pathRef](self, "_pathRef");
  if (v8)
  {
    CFRelease(v8);
  }
  else
  {
    -[CRNormalizedPolyline denormalizedPolyline](self, "denormalizedPolyline");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __28__CRNormalizedPolyline_path__block_invoke;
    v6[3] = &unk_1E98DACA0;
    v6[4] = self;
    -[CRImageSpacePolyline createPathWithTransformer:](&v7, v3, v6);
    -[CRNormalizedPolyline set_pathRef:](self, "set_pathRef:", &v7);
    if (v7)
      CFRelease(v7);

  }
  -[CRNormalizedPolyline _pathRef](self, "_pathRef");
  v4 = (CGPath *)v8;
  if (v8)
    CFRelease(v8);
  return v4;
}

double __28__CRNormalizedPolyline_path__block_invoke(uint64_t a1, double a2)
{
  double v3;
  double v4;

  objc_msgSend(*(id *)(a1 + 32), "normalizationSize");
  if (v4 != 0.0 && v3 != 0.0)
    return a2 / v3;
  return a2;
}

- (unint64_t)pointCount
{
  void *v2;
  unint64_t v3;

  -[CRNormalizedPolyline denormalizedPolyline](self, "denormalizedPolyline");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "pointCount");

  return v3;
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
  v7[2] = __35__CRNormalizedPolyline_pointValues__block_invoke;
  v7[3] = &unk_1E98DABD8;
  v4 = v3;
  v8 = v4;
  -[CRNormalizedPolyline enumeratePoints:](self, "enumeratePoints:", v7);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

void __35__CRNormalizedPolyline_pointValues__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPoint:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:");

}

- (void)enumeratePoints:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v4 = a3;
  -[CRNormalizedPolyline denormalizedPolyline](self, "denormalizedPolyline");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__CRNormalizedPolyline_enumeratePoints___block_invoke;
  v6[3] = &unk_1E98DACA0;
  v6[4] = self;
  -[CRImageSpacePolyline enumeratePointsWithTransformer:block:]((uint64_t)v5, v6, v4);

}

double __40__CRNormalizedPolyline_enumeratePoints___block_invoke(uint64_t a1, double a2)
{
  double v3;
  double v4;

  objc_msgSend(*(id *)(a1 + 32), "normalizationSize");
  if (v4 != 0.0 && v3 != 0.0)
    return a2 / v3;
  return a2;
}

- (void)appendPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  double v8;
  CFTypeRef cf;

  y = a3.y;
  x = a3.x;
  -[CRNormalizedPolyline denormalizedPolyline](self, "denormalizedPolyline");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRNormalizedPolyline normalizationSize](self, "normalizationSize");
  -[CRImageSpacePolyline appendPoint:]((uint64_t)v6, x * v7, y * v8);

  cf = 0;
  -[CRNormalizedPolyline set_pathRef:](self, "set_pathRef:", &cf);
  if (cf)
    CFRelease(cf);
}

- (void)appendPolyline:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CFTypeRef cf;

  v4 = a3;
  -[CRNormalizedPolyline denormalizedPolyline](self, "denormalizedPolyline");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "denormalizedPolyline");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRImageSpacePolyline appendPolyline:]((uint64_t)v5, v6);

  cf = 0;
  -[CRNormalizedPolyline set_pathRef:](self, "set_pathRef:", &cf);
  if (cf)
    CFRelease(cf);

}

- (id)simplified
{
  CRNormalizedPolyline *v3;
  void *v4;
  void *v5;
  CRNormalizedPolyline *v6;

  v3 = [CRNormalizedPolyline alloc];
  -[CRNormalizedPolyline denormalizedPolyline](self, "denormalizedPolyline");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "simplified");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRNormalizedPolyline normalizationSize](self, "normalizationSize");
  v6 = -[CRNormalizedPolyline initWithDenormalizedPolyline:size:](v3, "initWithDenormalizedPolyline:size:", v5);

  return v6;
}

- (id)rotated180
{
  CRNormalizedPolyline *v3;
  void *v4;
  void *v5;
  CRNormalizedPolyline *v6;

  v3 = [CRNormalizedPolyline alloc];
  -[CRNormalizedPolyline denormalizedPolyline](self, "denormalizedPolyline");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rotated180");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRNormalizedPolyline normalizationSize](self, "normalizationSize");
  v6 = -[CRNormalizedPolyline initWithDenormalizedPolyline:size:](v3, "initWithDenormalizedPolyline:size:", v5);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  CRNormalizedPolyline *v4;
  CRNormalizedPolyline *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  char v11;
  double v12;
  void *v13;
  void *v14;

  v4 = (CRNormalizedPolyline *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[CRNormalizedPolyline normalizationSize](self, "normalizationSize");
      v7 = v6;
      v9 = v8;
      -[CRNormalizedPolyline normalizationSize](v5, "normalizationSize");
      v11 = 0;
      if (v7 == v12 && v9 == v10)
      {
        -[CRNormalizedPolyline denormalizedPolyline](self, "denormalizedPolyline");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[CRNormalizedPolyline denormalizedPolyline](v5, "denormalizedPolyline");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v13, "isEqual:", v14);

      }
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CRNormalizedPolyline *v4;
  void *v5;
  void *v6;
  CRNormalizedPolyline *v7;

  v4 = +[CRNormalizedPolyline allocWithZone:](CRNormalizedPolyline, "allocWithZone:", a3);
  -[CRNormalizedPolyline denormalizedPolyline](self, "denormalizedPolyline");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[CRNormalizedPolyline normalizationSize](self, "normalizationSize");
  v7 = -[CRNormalizedPolyline initWithDenormalizedPolyline:size:](v4, "initWithDenormalizedPolyline:size:", v6);

  return v7;
}

- (id)crCodableDataRepresentation
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  +[CRCodingUtilities appendInteger:toData:](CRCodingUtilities, "appendInteger:toData:", 1, v3);
  -[CRNormalizedPolyline denormalizedPolyline](self, "denormalizedPolyline");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRCodingUtilities appendCodable:toData:](CRCodingUtilities, "appendCodable:toData:", v4, v3);

  -[CRNormalizedPolyline normalizationSize](self, "normalizationSize");
  +[CRCodingUtilities appendSize:toData:](CRCodingUtilities, "appendSize:toData:", v3);
  return v3;
}

- (CRNormalizedPolyline)initWithCRCodableDataRepresentation:(id)a3
{
  id v4;
  CRImageSpacePolyline *v5;
  void *v6;
  CRImageSpacePolyline *v7;
  CRNormalizedPolyline *v8;
  uint64_t v10;

  v4 = a3;
  v10 = 0;
  if (+[CRCodingUtilities integerFromEncodingData:offset:](CRCodingUtilities, "integerFromEncodingData:offset:", v4, &v10) == 1)
  {
    v5 = [CRImageSpacePolyline alloc];
    +[CRCodingUtilities objectDataFromEncodingData:offset:](CRCodingUtilities, "objectDataFromEncodingData:offset:", v4, &v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CRImageSpacePolyline initWithCRCodableDataRepresentation:](v5, "initWithCRCodableDataRepresentation:", v6);

    +[CRCodingUtilities sizeFromEncodingData:offset:](CRCodingUtilities, "sizeFromEncodingData:offset:", v4, &v10);
    self = -[CRNormalizedPolyline initWithDenormalizedPolyline:size:](self, "initWithDenormalizedPolyline:size:", v7);

    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (CGSize)normalizationSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_normalizationSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setNormalizationSize:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_normalizationSize, &v3, 16, 1, 0);
}

- (CRImageSpacePolyline)denormalizedPolyline
{
  return (CRImageSpacePolyline *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDenormalizedPolyline:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (ObjectRef<const)_pathRef
{
  void *v2;
  ObjectRef<const CGPath *> v3;

  objc_copyCppObjectAtomic(v2, &self->__pathRef, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__121);
  return v3;
}

- (void)set_pathRef:(ObjectRef<const CGPath *>)a3
{
  objc_copyCppObjectAtomic(&self->__pathRef, a3.mCFObject, (void (__cdecl *)(void *, const void *))__assign_helper_atomic_property__122);
}

- (void).cxx_destruct
{
  CGPath *mCFObject;

  mCFObject = self->__pathRef.mCFObject;
  if (mCFObject)
    CFRelease(mCFObject);
  objc_storeStrong((id *)&self->_denormalizedPolyline, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
