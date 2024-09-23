@implementation NSTextContentStorageFillAttributedStringWithElementsInIndexRange

uint64_t ____NSTextContentStorageFillAttributedStringWithElementsInIndexRange_block_invoke(uint64_t result, id *a2, uint64_t a3, uint64_t a4)
{
  id *v4;
  uint64_t v5;
  unint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  if (a4 >= 1)
  {
    v4 = a2;
    v5 = result;
    v6 = (unint64_t)&a2[a4];
    do
    {
      objc_opt_class();
      result = objc_opt_isKindOfClass();
      if ((result & 1) != 0)
      {
        v7 = *v4;
        v8 = (void *)objc_msgSend(*v4, "attributedString");
        v9 = (void *)objc_msgSend(v7, "paragraphSeparatorRange");
        objc_msgSend(*(id *)(v5 + 32), "replaceCharactersInRange:withAttributedString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 40) + 8) + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 40) + 8) + 40), v8);
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 40) + 8) + 32) += objc_msgSend(v8, "length");
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 40) + 8) + 40) = 0;
        result = objc_msgSend(v9, "range");
        if (!v10 && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 48) + 8) + 24) < *(_QWORD *)(v5 + 56))
          result = objc_msgSend(*(id *)(v5 + 32), "replaceCharactersInRange:withString:", (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 40) + 8) + 32))++, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 40) + 8) + 40), CFSTR("\n"));
      }
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 48) + 8) + 24);
      ++v4;
    }
    while ((unint64_t)v4 < v6);
  }
  return result;
}

@end
