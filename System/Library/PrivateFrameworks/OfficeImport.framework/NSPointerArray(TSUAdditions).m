@implementation NSPointerArray(TSUAdditions)

- (uint64_t)tsu_enumerateNonNullPointersUsingBlock:()TSUAdditions
{
  uint64_t result;
  unint64_t v6;
  unint64_t v7;
  char v8;

  v8 = 0;
  result = objc_msgSend(a1, "count");
  if (result)
  {
    v6 = result;
    v7 = 1;
    do
    {
      result = objc_msgSend(a1, "pointerAtIndex:", v7 - 1);
      if (result)
        result = (*(uint64_t (**)(uint64_t, uint64_t, unint64_t, char *))(a3 + 16))(a3, result, v7 - 1, &v8);
      if (v7 >= v6)
        break;
      ++v7;
    }
    while (!v8);
  }
  return result;
}

- (uint64_t)tsu_insertRange:()TSUAdditions
{
  uint64_t result;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  result = objc_msgSend(a1, "count");
  v8 = result - a3;
  if (a4 >= result - a3)
  {
    if (result == a3)
    {
      return objc_msgSend(a1, "setCount:", objc_msgSend(a1, "count") + a4);
    }
    else
    {
      v9 = (void *)objc_msgSend(MEMORY[0x24BDD1748], "pointerArrayWithPointerFunctions:", objc_msgSend(a1, "pointerFunctions"));
      objc_msgSend(v9, "setCount:", v8);
      v10 = 0;
      do
      {
        v11 = objc_msgSend(a1, "pointerAtIndex:", a3 + v10);
        if (v11)
        {
          objc_msgSend(v9, "replacePointerAtIndex:withPointer:", v10, v11);
          objc_msgSend(a1, "replacePointerAtIndex:withPointer:", a3 + v10, 0);
        }
        ++v10;
      }
      while (v8 != v10);
      objc_msgSend(a1, "setCount:", objc_msgSend(a1, "count") + a4);
      v12 = 0;
      v13 = objc_msgSend(a1, "count") - v8;
      do
      {
        result = objc_msgSend(v9, "pointerAtIndex:", v12);
        if (result)
        {
          objc_msgSend(a1, "replacePointerAtIndex:withPointer:", v13 + v12, result);
          result = objc_msgSend(v9, "replacePointerAtIndex:withPointer:", v12, 0);
        }
        ++v12;
      }
      while (v8 != v12);
    }
  }
  else
  {
    for (; a4; --a4)
      result = objc_msgSend(a1, "insertPointer:atIndex:", 0, a3);
  }
  return result;
}

- (uint64_t)tsu_indexOfPointer:()TSUAdditions
{
  uint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0x7FFFFFFFFFFFFFFFLL;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __51__NSPointerArray_TSUAdditions__tsu_indexOfPointer___block_invoke;
  v5[3] = &unk_24F39B218;
  v5[4] = &v6;
  v5[5] = a3;
  objc_msgSend(a1, "tsu_enumerateNonNullPointersUsingBlock:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

@end
