@implementation PGFeatureTransformerHelper

+ (BOOL)validParameters:(id)a3 ofTypes:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  char isKindOfClass;

  v5 = a3;
  v6 = a4;
  if (v5 && (v7 = objc_msgSend(v5, "count"), v7 == objc_msgSend(v6, "count")))
  {
    if (objc_msgSend(v5, "count"))
    {
      v8 = 0;
      do
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectAtIndexedSubscript:", v8);
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
          break;
        ++v8;
      }
      while (v8 < objc_msgSend(v5, "count"));
    }
    else
    {
      isKindOfClass = 1;
    }
  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

@end
