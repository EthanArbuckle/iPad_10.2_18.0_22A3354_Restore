@implementation NSCoder(UIGeometryKeyedCodingPrivate)

- (void)_ui_encodeCAFrameRateRange:()UIGeometryKeyedCodingPrivate forKey:
{
  id v10;
  id v11;

  v10 = a6;
  _NSStringFromCAFrameRateRange(a2, a3, a4);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "encodeObject:forKey:", v11, v10);

}

- (float)_ui_decodeCAFrameRateRangeForKey:()UIGeometryKeyedCodingPrivate
{
  id v4;
  void *v5;
  float v6;

  v4 = a3;
  objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = _CAFrameRateRangeFromString(v5);
  else
    v6 = *MEMORY[0x1E0CD23C0];

  return v6;
}

@end
