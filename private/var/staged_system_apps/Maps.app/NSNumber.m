@implementation NSNumber

+ (BOOL)number:(id)a3 isEqualToNumber:(id)a4
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  unsigned __int8 v8;

  v5 = (unint64_t)a3;
  v6 = (unint64_t)a4;
  v7 = (void *)v6;
  if (v5 | v6)
  {
    v8 = 0;
    if (v5 && v6)
      v8 = objc_msgSend((id)v5, "isEqualToNumber:", v6);
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

@end
