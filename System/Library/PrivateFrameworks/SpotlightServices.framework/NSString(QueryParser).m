@implementation NSString(QueryParser)

- (uint64_t)composedLength
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
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__NSString_QueryParser__composedLength__block_invoke;
  v5[3] = &unk_1E6E43FC0;
  v5[4] = &v6;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v2, 2, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

@end
