@implementation UIKBRTObject

void __26___UIKBRTObject_setOwner___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = 0;

}

void __30___UIKBRTObject_previousEntry__block_invoke(uint64_t a1)
{
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "indexOfObject:");
  if (v2)
    v3 = v2 == 0x7FFFFFFFFFFFFFFFLL;
  else
    v3 = 1;
  if (!v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectAtIndex:", v2 - 1);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

void __26___UIKBRTObject_nextEntry__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "indexOfObject:");
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = v2 + 1;
    if (v2 + 1 < (unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectAtIndex:", v3);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v4;

    }
  }
}

@end
