@implementation NSString(WideStringCat)

- (uint64_t)cWideString
{
  unint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t i;
  id v7;
  uint64_t v8;

  v2 = objc_msgSend(a1, "length");
  if (v2 >= 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCB70], CFSTR("Error allocating temporary string"));
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 2 * v2 + 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCB70], CFSTR("Error allocating temporary string"));
  v4 = objc_retainAutorelease(v3);
  v5 = objc_msgSend(v4, "mutableBytes");
  if (v2)
  {
    for (i = 0; i != v2; ++i)
      *(_WORD *)(v5 + 2 * i) = objc_msgSend(a1, "characterAtIndex:", i);
  }
  *(_WORD *)(v5 + 2 * v2) = 0;
  v7 = objc_retainAutorelease(v4);
  v8 = objc_msgSend(v7, "bytes");

  return v8;
}

@end
