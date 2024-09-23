@implementation NSArray(MTStride)

- (uint64_t)subarrayForStrideIndex:()MTStride withStrideSize:
{
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v7 = objc_msgSend(a1, "count");
  v8 = v7;
  if (v7 && a4)
  {
    v9 = a4 * a3;
    if (a4 * a3 >= v7)
    {
      v8 = 0;
      v9 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v10 = v9 + a4;
      if (v9 + a4 >= v7)
        v10 = v7;
      v8 = v10 - v9;
    }
  }
  else
  {
    v9 = 0;
  }
  return objc_msgSend(a1, "subarrayWithRange:", v9, v8);
}

- (void)concurrentMapWithStrideSize:()MTStride on:withBlock:
{
  id v8;
  NSObject *v9;
  size_t v10;
  id v11;
  _QWORD block[5];
  id v13;
  uint64_t v14;

  v8 = a5;
  v9 = a4;
  v10 = objc_msgSend(a1, "strideCountForSize:", a3);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__NSArray_MTStride__concurrentMapWithStrideSize_on_withBlock___block_invoke;
  block[3] = &unk_1E54D3108;
  v13 = v8;
  v14 = a3;
  block[4] = a1;
  v11 = v8;
  dispatch_apply(v10, v9, block);

}

- (uint64_t)strideCountForSize:()MTStride
{
  unint64_t v4;

  v4 = objc_msgSend(a1, "count");
  if (!a3)
    return 1;
  if (v4 % a3)
    return v4 / a3 + 1;
  return v4 / a3;
}

@end
