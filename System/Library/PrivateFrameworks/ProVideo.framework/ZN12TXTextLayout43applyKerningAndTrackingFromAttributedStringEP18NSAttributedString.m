@implementation ZN12TXTextLayout43applyKerningAndTrackingFromAttributedStringEP18NSAttributedString

uint64_t *___ZN12TXTextLayout43applyKerningAndTrackingFromAttributedStringEP18NSAttributedString_block_invoke_2(uint64_t *result, void *a2, unint64_t a3, uint64_t a4)
{
  CFIndex v4;
  unint64_t v5;
  uint64_t *v7;
  uint64_t **v8;
  CFRange RangeOfComposedCharactersAtIndex;
  float v10;
  double v11;
  CFIndex location;
  uint64_t *p_location;

  if (a2)
  {
    v4 = a3;
    v5 = a3 + a4;
    if (a3 < a3 + a4)
    {
      v7 = result;
      v8 = (uint64_t **)(result[5] + 19224);
      do
      {
        RangeOfComposedCharactersAtIndex = CFStringGetRangeOfComposedCharactersAtIndex((CFStringRef)objc_msgSend((id)v7[4], "string"), v4);
        objc_msgSend(a2, "floatValue");
        v11 = v10;
        location = RangeOfComposedCharactersAtIndex.location;
        p_location = &location;
        result = std::__tree<std::__value_type<long,double>,std::__map_value_compare<long,std::__value_type<long,double>,std::less<long>,true>,std::allocator<std::__value_type<long,double>>>::__emplace_unique_key_args<long,std::piecewise_construct_t const&,std::tuple<long const&>,std::tuple<>>(v8, &location, (uint64_t)&std::piecewise_construct, &p_location);
        *((double *)result + 5) = v11;
        v4 = RangeOfComposedCharactersAtIndex.location + RangeOfComposedCharactersAtIndex.length;
      }
      while (RangeOfComposedCharactersAtIndex.location + RangeOfComposedCharactersAtIndex.length < v5);
    }
  }
  return result;
}

@end
