@implementation SXJSONDocumentLayout

- (int64_t)gutterWithValue:(id)a3 withType:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a4 != 2)
    return 0;
  v6 = objc_msgSend(a3, "integerValue", v4, v5);
  v7 = v6 & 1;
  if (v6 < 0)
    v7 = -v7;
  return v7 + v6;
}

@end
