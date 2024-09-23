@implementation NSString(TSDAdditions)

- (uint64_t)tsdWordCount
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
  v5[2] = __38__NSString_TSDAdditions__tsdWordCount__block_invoke;
  v5[3] = &unk_24D82C000;
  v5[4] = &v6;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v2, 3, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)endingCharIndexForWordLimit:()TSDAdditions
{
  void *v5;
  unint64_t v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v6 = objc_msgSend(a1, "length");
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)v13 - v7;
  objc_msgSend(a1, "getCharacters:range:", (char *)v13 - v7, 0, v6);
  if (!v6)
    return 0;
  v9 = 0;
  v10 = 0;
  do
    v10 += objc_msgSend(v5, "characterIsMember:", *(unsigned __int16 *)&v8[2 * v9++]);
  while (v10 < a3 && v9 < v6);
  return v9 - 1;
}

@end
