@implementation NSCoder(UIGeometryKeyedCoding)

- (void)encodeCGSize:()UIGeometryKeyedCoding forKey:
{
  id v8;
  id v9;
  CGSize v10;

  v8 = a5;
  v10.width = a2;
  v10.height = a3;
  NSStringFromCGSize(v10);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "encodeObject:forKey:", v9, v8);

}

- (double)decodeUIEdgeInsetsForKey:()UIGeometryKeyedCoding
{
  id v4;
  NSString *v5;
  double v6;

  v4 = a3;
  objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v5)
    *(_QWORD *)&v6 = (unint64_t)UIEdgeInsetsFromString(v5);
  else
    v6 = 0.0;

  return v6;
}

- (double)decodeDirectionalEdgeInsetsForKey:()UIGeometryKeyedCoding
{
  id v4;
  NSString *v5;
  double v6;

  v4 = a3;
  objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v5)
    *(_QWORD *)&v6 = (unint64_t)NSDirectionalEdgeInsetsFromString(v5);
  else
    v6 = 0.0;

  return v6;
}

- (void)encodeCGRect:()UIGeometryKeyedCoding forKey:
{
  id v12;
  id v13;
  CGRect v14;

  v12 = a7;
  v14.origin.x = a2;
  v14.origin.y = a3;
  v14.size.width = a4;
  v14.size.height = a5;
  NSStringFromCGRect(v14);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "encodeObject:forKey:", v13, v12);

}

- (void)encodeCGPoint:()UIGeometryKeyedCoding forKey:
{
  id v8;
  id v9;
  CGPoint v10;

  v8 = a5;
  v10.x = a2;
  v10.y = a3;
  NSStringFromCGPoint(v10);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "encodeObject:forKey:", v9, v8);

}

- (void)encodeCGVector:()UIGeometryKeyedCoding forKey:
{
  id v8;
  id v9;
  CGVector v10;

  v8 = a5;
  v10.dx = a2;
  v10.dy = a3;
  NSStringFromCGVector(v10);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "encodeObject:forKey:", v9, v8);

}

- (void)encodeCGAffineTransform:()UIGeometryKeyedCoding forKey:
{
  __int128 v5;
  id v6;
  id v7;
  CGAffineTransform transform;

  v5 = a3[1];
  *(_OWORD *)&transform.a = *a3;
  *(_OWORD *)&transform.c = v5;
  *(_OWORD *)&transform.tx = a3[2];
  v6 = a4;
  NSStringFromCGAffineTransform(&transform);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "encodeObject:forKey:", v7, v6);

}

- (void)encodeUIEdgeInsets:()UIGeometryKeyedCoding forKey:
{
  id v12;
  id v13;
  UIEdgeInsets v14;

  v12 = a7;
  v14.top = a2;
  v14.left = a3;
  v14.bottom = a4;
  v14.right = a5;
  NSStringFromUIEdgeInsets(v14);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "encodeObject:forKey:", v13, v12);

}

- (void)encodeDirectionalEdgeInsets:()UIGeometryKeyedCoding forKey:
{
  id v12;
  id v13;
  NSDirectionalEdgeInsets v14;

  v12 = a7;
  v14.top = a2;
  v14.leading = a3;
  v14.bottom = a4;
  v14.trailing = a5;
  NSStringFromDirectionalEdgeInsets(v14);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "encodeObject:forKey:", v13, v12);

}

- (void)encodeUIOffset:()UIGeometryKeyedCoding forKey:
{
  id v8;
  id v9;
  UIOffset v10;

  v8 = a5;
  v10.horizontal = a2;
  v10.vertical = a3;
  NSStringFromUIOffset(v10);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "encodeObject:forKey:", v9, v8);

}

- (double)decodeCGPointForKey:()UIGeometryKeyedCoding
{
  id v4;
  NSString *v5;
  double v6;

  v4 = a3;
  objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v5)
    *(_QWORD *)&v6 = *(_OWORD *)&CGPointFromString(v5);
  else
    v6 = *MEMORY[0x1E0C9D538];

  return v6;
}

- (double)decodeCGVectorForKey:()UIGeometryKeyedCoding
{
  id v4;
  NSString *v5;
  double v6;

  v4 = a3;
  objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v5)
    *(_QWORD *)&v6 = *(_OWORD *)&CGVectorFromString(v5);
  else
    v6 = 0.0;

  return v6;
}

- (double)decodeCGSizeForKey:()UIGeometryKeyedCoding
{
  id v4;
  NSString *v5;
  double v6;

  v4 = a3;
  objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v5)
    *(_QWORD *)&v6 = *(_OWORD *)&CGSizeFromString(v5);
  else
    v6 = *MEMORY[0x1E0C9D820];

  return v6;
}

- (double)decodeCGRectForKey:()UIGeometryKeyedCoding
{
  id v4;
  NSString *v5;
  double v6;

  v4 = a3;
  objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v5)
    *(_QWORD *)&v6 = (unint64_t)CGRectFromString(v5);
  else
    v6 = *MEMORY[0x1E0C9D648];

  return v6;
}

- (void)decodeCGAffineTransformForKey:()UIGeometryKeyedCoding
{
  id v5;
  NSString *v6;
  uint64_t v7;
  __int128 v8;
  NSString *string;

  v5 = a2;
  objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(), v5);
  string = (NSString *)objc_claimAutoreleasedReturnValue();

  v6 = string;
  if (string)
  {
    CGAffineTransformFromString((CGAffineTransform *)a3, string);
    v6 = string;
  }
  else
  {
    v7 = MEMORY[0x1E0C9BAA8];
    v8 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)a3 = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)(a3 + 16) = v8;
    *(_OWORD *)(a3 + 32) = *(_OWORD *)(v7 + 32);
  }

}

- (double)decodeUIOffsetForKey:()UIGeometryKeyedCoding
{
  id v4;
  NSString *v5;
  double v6;

  v4 = a3;
  objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v5)
    *(_QWORD *)&v6 = *(_OWORD *)&UIOffsetFromString(v5);
  else
    v6 = 0.0;

  return v6;
}

@end
