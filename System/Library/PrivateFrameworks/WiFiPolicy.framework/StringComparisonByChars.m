@implementation StringComparisonByChars

+ (id)stringComparisonByCharsWithString1:(id)a3 string2:(id)a4 reference:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithString1:string2:reference:", v10, v9, v8);

  return v11;
}

- (StringComparisonByChars)initWithString1:(id)a3 string2:(id)a4 reference:(id)a5
{
  id v8;
  id v9;
  StringComparisonByChars *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)StringComparisonByChars;
  v10 = -[ObjectComparisonByTokens initWithObj1:obj2:reference:](&v19, sel_initWithObj1_obj2_reference_, v8, v9, a5);
  v11 = objc_msgSend(v8, "length");
  v12 = objc_msgSend(v9, "length");
  if (v11 >= v12)
    v13 = v12;
  else
    v13 = v11;
  if (v13)
  {
    v14 = 0;
    do
    {
      -[ObjectComparisonByTokens incrementTokensWith:](v10, "incrementTokensWith:", objc_msgSend(v8, "characterAtIndex:", v14) == objc_msgSend(v9, "characterAtIndex:", v14));
      ++v14;
      v15 = objc_msgSend(v8, "length");
      v16 = objc_msgSend(v9, "length");
      if (v15 >= v16)
        v17 = v16;
      else
        v17 = v15;
    }
    while (v14 < v17);
  }
  -[ObjectComparisonByTokens accountForadditionalLength](v10, "accountForadditionalLength");

  return v10;
}

@end
