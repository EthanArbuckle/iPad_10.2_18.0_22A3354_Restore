@implementation NSString(NSStringAppKitStubAdditions)

- (uint64_t)oi_sizeWithFontName:()NSStringAppKitStubAdditions size:
{
  return objc_msgSend(a1, "oi_sizeWithFontName:size:bold:italic:", a3, a4, 0, 0);
}

- (double)oi_sizeWithFontName:()NSStringAppKitStubAdditions size:bold:italic:
{
  unint64_t v9;
  double v10;

  v9 = objc_msgSend(a1, "length");
  v10 = 0.49;
  if (a5 | a6)
    v10 = 0.58;
  return v10 * (double)a4 * (double)v9;
}

- (uint64_t)oi_rangeOfCharactersFromSet:()NSStringAppKitStubAdditions index:
{
  id v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = a3;
  v7 = objc_msgSend(a1, "length");
  v8 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", v6, 0, a4, v7 - a4);
  v9 = v8;
  v11 = v10;
  if (v10)
  {
    v12 = v8 + 1;
    if (v8 + 1 < v7)
    {
      do
      {
        if (!objc_msgSend(v6, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", v12)))
          break;
        ++v11;
        ++v12;
      }
      while (v7 != v12);
    }
  }

  return v9;
}

@end
