@implementation PLRectValueFromDataTransformer

- (id)transformedValue:(id)a3
{
  id v3;
  void *v4;
  _OWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    memset(v6, 0, sizeof(v6));
    objc_msgSend(v3, "getValue:", v6);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v6, 32);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)reverseTransformedValue:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_5;
  v4 = v3;
  if (objc_msgSend(v4, "length") != 32)
  {

LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  v5 = (void *)MEMORY[0x1E0CB3B18];
  v6 = objc_retainAutorelease(v4);
  objc_msgSend(v5, "valueWithBytes:objCType:", objc_msgSend(v6, "bytes"), "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v7;
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

@end
