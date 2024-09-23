@implementation NSString(Grapheme)

- (uint64_t)graphemeCount
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v2 = objc_msgSend(a1, "length");
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __35__NSString_Grapheme__graphemeCount__block_invoke;
  v5[3] = &unk_251A7CC98;
  v5[4] = &v6;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v2, 514, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)graphemeAtIndex:()Grapheme
{
  uint64_t v5;
  id v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  _QWORD v15[4];

  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__3;
  v13 = __Block_byref_object_dispose__3;
  v14 = 0;
  v5 = objc_msgSend(a1, "length");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __38__NSString_Grapheme__graphemeAtIndex___block_invoke;
  v8[3] = &unk_251A7CCC0;
  v8[5] = &v9;
  v8[6] = a3;
  v8[4] = v15;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v5, 2, v8);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(v15, 8);
  return v6;
}

- (id)splitGraphemeIntoCharacterArray
{
  void *v2;
  unint64_t v3;
  unsigned int v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(a1, "length"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "length"))
  {
    v3 = 0;
    do
    {
      v4 = objc_msgSend(a1, "characterAtIndex:", v3);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C"), v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v5);

      ++v3;
    }
    while (v3 < objc_msgSend(a1, "length"));
  }
  return v2;
}

- (id)graphemeArray
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(a1, "graphemeCount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "length");
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __35__NSString_Grapheme__graphemeArray__block_invoke;
  v6[3] = &unk_251A7CCE8;
  v4 = v2;
  v7 = v4;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v3, 2, v6);

  return v4;
}

@end
