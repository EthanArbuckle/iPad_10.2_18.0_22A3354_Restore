@implementation NSCoder(OZAdditions)

- (uint64_t)oz_encodeFloat2:()OZAdditions forKey:
{
  return objc_msgSend(a1, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB3B18], "oz_valueWithSIMDFloat2:"), a3);
}

- (double)oz_decodeFloat2ForKey:()OZAdditions
{
  void *v3;
  double result;

  v3 = (void *)objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(), a3);
  if (!v3)
    return 0.0;
  objc_msgSend(v3, "oz_SIMDFloat2Value");
  return result;
}

- (uint64_t)oz_encodeDouble2:()OZAdditions forKey:
{
  return objc_msgSend(a1, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB3B18], "oz_valueWithSIMDDouble2:"), a3);
}

- (double)oz_decodeDouble2ForKey:()OZAdditions
{
  void *v3;
  double result;

  v3 = (void *)objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(), a3);
  if (!v3)
    return 0.0;
  objc_msgSend(v3, "oz_SIMDDouble2Value");
  return result;
}

- (uint64_t)oz_encodeFloat3:()OZAdditions forKey:
{
  return objc_msgSend(a1, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB3B18], "oz_valueWithSIMDFloat3:"), a3);
}

- (double)oz_decodeFloat3ForKey:()OZAdditions
{
  void *v3;
  double result;

  v3 = (void *)objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(), a3);
  if (!v3)
    return 0.0;
  objc_msgSend(v3, "oz_SIMDFloat3Value");
  return result;
}

- (uint64_t)oz_encodeDouble3:()OZAdditions forKey:
{
  __int128 v4;
  _OWORD v6[2];

  v4 = a3[1];
  v6[0] = *a3;
  v6[1] = v4;
  return objc_msgSend(a1, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB3B18], "oz_valueWithSIMDDouble3:", v6), a4);
}

- (void)oz_decodeDouble3ForKey:()OZAdditions
{
  void *result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  result = (void *)objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(), a2);
  if (result)
  {
    result = (void *)objc_msgSend(result, "oz_SIMDDouble3Value");
    v5 = v7;
    v6 = v8;
  }
  else
  {
    v5 = 0uLL;
    v6 = 0uLL;
  }
  *a3 = v5;
  a3[1] = v6;
  return result;
}

- (uint64_t)oz_encodeMatrixFloat3x3:()OZAdditions forKey:
{
  return objc_msgSend(a1, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB3B18], "oz_valueWithSIMDFloat3x3:"), a3);
}

- (__n128)oz_decodeMatrixFloat3x3ForKey:()OZAdditions
{
  void *v3;
  __n128 result;

  v3 = (void *)objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(), a3);
  if (v3)
    objc_msgSend(v3, "oz_SIMDFloat3x3Value");
  else
    return *(__n128 *)MEMORY[0x1E0C83FE8];
  return result;
}

- (uint64_t)oz_encodeMatrixFloat4x4:()OZAdditions forKey:
{
  return objc_msgSend(a1, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB3B18], "oz_valueWithSIMDFloat4x4:"), a3);
}

- (__n128)oz_decodeMatrixFloat4x4ForKey:()OZAdditions
{
  void *v3;
  __n128 result;

  v3 = (void *)objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(), a3);
  if (v3)
    objc_msgSend(v3, "oz_SIMDFloat4x4Value");
  else
    return *(__n128 *)MEMORY[0x1E0C83FF0];
  return result;
}

- (uint64_t)oz_encodeCGSize:()OZAdditions forKey:
{
  return objc_msgSend(a1, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB3B18], "oz_valueWithCGSize:"), a3);
}

- (double)oz_decodeCGSizeForKey:()OZAdditions
{
  void *v3;
  double result;

  v3 = (void *)objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(), a3);
  if (!v3)
    return *MEMORY[0x1E0C9D820];
  objc_msgSend(v3, "oz_CGSizeValue");
  return result;
}

@end
