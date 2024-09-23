@implementation SSQueryParseResultsForQueryString

uint64_t __SSQueryParseResultsForQueryString_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  if ((_DWORD)result)
  {
    if ((_os_feature_enabled_impl() & 1) != 0)
      result = 1;
    else
      result = _os_feature_enabled_impl();
  }
  SSQueryParseResultsForQueryString_isFeatureFlagsEnabled = result;
  return result;
}

uint64_t __SSQueryParseResultsForQueryString_block_invoke_118(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  int v6;
  uint64_t v7;
  int v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "intValue");
  if (v6 == objc_msgSend(v5, "intValue"))
  {
    v7 = 0;
  }
  else
  {
    v8 = objc_msgSend(v4, "intValue");
    if (v8 > (int)objc_msgSend(v5, "intValue"))
      v7 = -1;
    else
      v7 = 1;
  }

  return v7;
}

@end
