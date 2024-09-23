@implementation CRCodingUtilities

+ (void)appendCodable:(id)a3 toData:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  objc_msgSend(a1, "appendBool:toData:", v8 == 0, v6);
  if (v8)
  {
    objc_msgSend(v8, "crCodableDataRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "appendUInteger:toData:", objc_msgSend(v7, "length"), v6);
    if (v7)
      objc_msgSend(v6, "appendData:", v7);

  }
}

+ (void)appendBool:(BOOL)a3 toData:(id)a4
{
  BOOL v4;

  v4 = a3;
  objc_msgSend(a4, "appendBytes:length:", &v4, 1);
}

+ (void)appendInteger:(int64_t)a3 toData:(id)a4
{
  int64_t v4;

  v4 = a3;
  objc_msgSend(a4, "appendBytes:length:", &v4, 8);
}

+ (void)appendUInteger:(unint64_t)a3 toData:(id)a4
{
  unint64_t v4;

  v4 = a3;
  objc_msgSend(a4, "appendBytes:length:", &v4, 8);
}

+ (void)appendFloat:(float)a3 toData:(id)a4
{
  float v4;

  v4 = a3;
  objc_msgSend(a4, "appendBytes:length:", &v4, 4);
}

+ (void)appendCGFloat:(double)a3 toData:(id)a4
{
  double v4;

  v4 = a3;
  objc_msgSend(a4, "appendBytes:length:", &v4, 8);
}

+ (void)appendPoint:(CGPoint)a3 toData:(id)a4
{
  id v4;
  CGPoint v5;

  v5 = a3;
  v4 = a4;
  objc_msgSend(v4, "appendBytes:length:", &v5, 8);
  objc_msgSend(v4, "appendBytes:length:", &v5.y, 8, *(_QWORD *)&v5.x);

}

+ (void)appendSize:(CGSize)a3 toData:(id)a4
{
  id v4;
  CGSize v5;

  v5 = a3;
  v4 = a4;
  objc_msgSend(v4, "appendBytes:length:", &v5, 8);
  objc_msgSend(v4, "appendBytes:length:", &v5.height, 8, *(_QWORD *)&v5.width);

}

+ (void)appendRect:(CGRect)a3 toData:(id)a4
{
  id v4;
  CGRect v5;

  v5 = a3;
  v4 = a4;
  objc_msgSend(v4, "appendBytes:length:", &v5, 8);
  objc_msgSend(v4, "appendBytes:length:", &v5.origin.y, 8, *(_QWORD *)&v5.origin.x);
  objc_msgSend(v4, "appendBytes:length:", &v5.size, 8);
  objc_msgSend(v4, "appendBytes:length:", &v5.size.height, 8);

}

+ (void)appendRange:(_NSRange)a3 toData:(id)a4
{
  id v4;
  _NSRange v5;

  v5 = a3;
  v4 = a4;
  objc_msgSend(v4, "appendBytes:length:", &v5, 8);
  objc_msgSend(v4, "appendBytes:length:", &v5.length, 8, v5.location);

}

+ (id)encodingDataForCodable:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(a1, "appendCodable:toData:", v4, v5);

  return v5;
}

+ (id)encodingDataForBool:(BOOL)a3
{
  BOOL v4;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)encodingDataForInteger:(int64_t)a3
{
  int64_t v4;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v4, 8);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)encodingDataForUInteger:(unint64_t)a3
{
  unint64_t v4;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v4, 8);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)encodingDataForFloat:(float)a3
{
  float v4;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v4, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)encodingDataForCGFloat:(double)a3
{
  double v4;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v4, 8);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)encodingDataForPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_opt_new();
  objc_msgSend(a1, "appendPoint:toData:", v6, x, y);
  return v6;
}

+ (id)encodingDataForSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;

  height = a3.height;
  width = a3.width;
  v6 = (void *)objc_opt_new();
  objc_msgSend(a1, "appendSize:toData:", v6, width, height);
  return v6;
}

+ (id)encodingDataForRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)objc_opt_new();
  objc_msgSend(a1, "appendRect:toData:", v8, x, y, width, height);
  return v8;
}

+ (id)encodingDataForRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;

  length = a3.length;
  location = a3.location;
  v6 = (void *)objc_opt_new();
  objc_msgSend(a1, "appendRange:toData:", location, length, v6);
  return v6;
}

+ (id)objectDataFromEncodingData:(id)a3 offset:(unint64_t *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;

  v6 = a3;
  if ((objc_msgSend(a1, "BOOLFromEncodingData:offset:", v6, a4) & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v8 = objc_msgSend(a1, "unsignedIntegerFromEncodingData:offset:", v6, a4);
    v9 = *a4;
    v10 = objc_msgSend(v6, "length");
    objc_opt_self();
    v7 = 0;
    if (v9 <= ~v8 && v9 + v8 <= v10)
    {
      objc_msgSend(v6, "subdataWithRange:", v9, v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *a4 += v8;
    }
  }

  return v7;
}

+ (BOOL)BOOLFromEncodingData:(id)a3 offset:(unint64_t *)a4
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;
  char v10;

  v5 = a3;
  v10 = 0;
  v6 = *a4;
  v7 = objc_msgSend(v5, "length");
  objc_opt_self();
  v8 = 0;
  if (v6 < v7)
  {
    objc_msgSend(v5, "getBytes:range:", &v10, v6, 1);
    ++*a4;
    v8 = v10 != 0;
  }

  return v8;
}

+ (int64_t)integerFromEncodingData:(id)a3 offset:(unint64_t *)a4
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  int64_t v8;
  int64_t v11;

  v5 = a3;
  v11 = 0;
  v6 = *a4;
  v7 = objc_msgSend(v5, "length");
  objc_opt_self();
  v8 = 0;
  if (v6 <= 0xFFFFFFFFFFFFFFF7 && v6 + 8 <= v7)
  {
    objc_msgSend(v5, "getBytes:range:", &v11, v6, 8);
    *a4 += 8;
    v8 = v11;
  }

  return v8;
}

+ (unint64_t)unsignedIntegerFromEncodingData:(id)a3 offset:(unint64_t *)a4
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v11;

  v5 = a3;
  v11 = 0;
  v6 = *a4;
  v7 = objc_msgSend(v5, "length");
  objc_opt_self();
  v8 = 0;
  if (v6 <= 0xFFFFFFFFFFFFFFF7 && v6 + 8 <= v7)
  {
    objc_msgSend(v5, "getBytes:range:", &v11, v6, 8);
    *a4 += 8;
    v8 = v11;
  }

  return v8;
}

+ (float)floatFromEncodingData:(id)a3 offset:(unint64_t *)a4
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  float v8;
  float v11;

  v5 = a3;
  v11 = 0.0;
  v6 = *a4;
  v7 = objc_msgSend(v5, "length");
  objc_opt_self();
  v8 = 0.0;
  if (v6 <= 0xFFFFFFFFFFFFFFFBLL && v6 + 4 <= v7)
  {
    objc_msgSend(v5, "getBytes:range:", &v11, v6, 4);
    *a4 += 4;
    v8 = v11;
  }

  return v8;
}

+ (double)cgFloatFromEncodingData:(id)a3 offset:(unint64_t *)a4
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  double v8;
  double v11;

  v5 = a3;
  v11 = 0.0;
  v6 = *a4;
  v7 = objc_msgSend(v5, "length");
  objc_opt_self();
  v8 = 0.0;
  if (v6 <= 0xFFFFFFFFFFFFFFF7 && v6 + 8 <= v7)
  {
    objc_msgSend(v5, "getBytes:range:", &v11, v6, 8);
    *a4 += 8;
    v8 = v11;
  }

  return v8;
}

+ (CGPoint)pointFromEncodingData:(id)a3 offset:(unint64_t *)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  v6 = a3;
  objc_msgSend(a1, "cgFloatFromEncodingData:offset:", v6, a4);
  v8 = v7;
  objc_msgSend(a1, "cgFloatFromEncodingData:offset:", v6, a4);
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

+ (CGSize)sizeFromEncodingData:(id)a3 offset:(unint64_t *)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  v6 = a3;
  objc_msgSend(a1, "cgFloatFromEncodingData:offset:", v6, a4);
  v8 = v7;
  objc_msgSend(a1, "cgFloatFromEncodingData:offset:", v6, a4);
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

+ (CGRect)rectFromEncodingData:(id)a3 offset:(unint64_t *)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  v6 = a3;
  objc_msgSend(a1, "cgFloatFromEncodingData:offset:", v6, a4);
  v8 = v7;
  objc_msgSend(a1, "cgFloatFromEncodingData:offset:", v6, a4);
  v10 = v9;
  objc_msgSend(a1, "cgFloatFromEncodingData:offset:", v6, a4);
  v12 = v11;
  objc_msgSend(a1, "cgFloatFromEncodingData:offset:", v6, a4);
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

+ (_NSRange)rangeFromEncodingData:(id)a3 offset:(unint64_t *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  _NSRange result;

  v6 = a3;
  v7 = objc_msgSend(a1, "unsignedIntegerFromEncodingData:offset:", v6, a4);
  v8 = objc_msgSend(a1, "unsignedIntegerFromEncodingData:offset:", v6, a4);

  v9 = v7;
  v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

+ (id)ddScannerResultFromEncodingData:(id)a3 offset:(unint64_t *)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "objectDataFromEncodingData:offset:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1CE68], "ddScannerResultWithCRCodableDataRepresentation:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)stringFromEncodingData:(id)a3 offset:(unint64_t *)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "objectDataFromEncodingData:offset:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCRCodableDataRepresentation:", v4);

  return v5;
}

+ (id)arrayFromEncodingData:(id)a3 offset:(unint64_t *)a4 objectProviderBlock:(id)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a5;
  objc_msgSend(a1, "objectDataFromEncodingData:offset:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithCRCodableDataRepresentation:objectProviderBlock:", v9, v8);

  return v10;
}

@end
