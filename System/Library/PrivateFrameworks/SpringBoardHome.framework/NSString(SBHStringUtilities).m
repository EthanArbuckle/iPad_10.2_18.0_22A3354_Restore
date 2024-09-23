@implementation NSString(SBHStringUtilities)

- (uint64_t)sbh_stringByDeletingCharactersInSet:()SBHStringUtilities
{
  return objc_msgSend(a1, "sbh_stringByReplacingCharactersInSet:withString:", a3, &stru_1E8D8E958);
}

- (id)sbh_stringByReplacingCharactersInSet:()SBHStringUtilities withString:
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(a1, "mutableCopy");
  v9 = objc_msgSend(v7, "length");
  v10 = objc_msgSend(v8, "length");
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    for (i = v10; i != v12; v11 = i - v12)
    {
      v14 = objc_msgSend(v8, "rangeOfCharacterFromSet:options:range:", v6, 0, v12, v11);
      if (v14 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      v12 = v14;
      v16 = v15;
      if (v9)
        objc_msgSend(v8, "replaceCharactersInRange:withString:", v14, v15, v7);
      else
        objc_msgSend(v8, "deleteCharactersInRange:", v14, v15);
      i = i + v9 - v16;
    }
  }

  return v8;
}

@end
