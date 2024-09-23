@implementation NSIndexSet(Silex)

- (uint64_t)firstRangeAfterIndex:()Silex
{
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  const char *v12;
  __int128 v13;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3010000000;
  v12 = "";
  v13 = xmmword_21713C7E0;
  v5 = objc_msgSend(a1, "lastIndex");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __42__NSIndexSet_Silex__firstRangeAfterIndex___block_invoke;
  v8[3] = &unk_24D68D330;
  v8[4] = &v9;
  objc_msgSend(a1, "enumerateRangesInRange:options:usingBlock:", a3, v5 - a3 + 1, 0, v8);
  v6 = v10[4];
  _Block_object_dispose(&v9, 8);
  return v6;
}

@end
