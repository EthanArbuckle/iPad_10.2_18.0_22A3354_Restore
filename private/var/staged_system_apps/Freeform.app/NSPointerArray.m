@implementation NSPointerArray

- (void)crl_enumerateNonNullPointersUsingBlock:(id)a3
{
  void (**v4)(id, void *, uint64_t, _BYTE *);
  NSUInteger v5;
  NSUInteger v6;
  unint64_t v7;
  void *v8;
  char v9;

  v4 = (void (**)(id, void *, uint64_t, _BYTE *))a3;
  v9 = 0;
  v5 = -[NSPointerArray count](self, "count");
  if (v5)
  {
    v6 = v5;
    v7 = 1;
    do
    {
      v8 = -[NSPointerArray pointerAtIndex:](self, "pointerAtIndex:", v7 - 1);
      if (v8)
        v4[2](v4, v8, v7 - 1, &v9);
      if (v7 >= v6)
        break;
      ++v7;
    }
    while (!v9);
  }

}

- (unint64_t)crl_indexOfPointer:(void *)a3
{
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0x7FFFFFFFFFFFFFFFLL;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100100614;
  v5[3] = &unk_101238258;
  v5[4] = &v6;
  v5[5] = a3;
  -[NSPointerArray crl_enumerateNonNullPointersUsingBlock:](self, "crl_enumerateNonNullPointersUsingBlock:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

@end
