@implementation UITextInputSessionMetaAccumulator

void __71___UITextInputSessionMetaAccumulator_accumulatorWithName_accumulators___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  unint64_t v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;

  v6 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  v7 = a2;
  v8 = objc_msgSend(v7, "depthRange");
  if (v6 >= v8)
    v9 = v8;
  else
    v9 = v6;
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v9;
  v10 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  v11 = objc_msgSend(v7, "depthRange");
  v13 = v11 + v12;
  if (v10 > v11 + v12)
    v13 = v10;
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v13;
  v14 = objc_msgSend(v7, "type");

  if (v14 != a1[7])
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
    *a4 = 1;
  }
}

void __58___UITextInputSessionMetaAccumulator_increaseWithActions___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  id v11;

  v11 = a2;
  if ((unint64_t)objc_msgSend(v11, "depthRange") <= *(_QWORD *)(a1 + 56)
    && objc_msgSend(v11, "_increaseWithActions:", *(_QWORD *)(a1 + 32)))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v7 = *(_QWORD *)(a1 + 40);
    if (*(_QWORD *)(v7 + 128) + 1 == a3)
    {
      v8 = objc_msgSend(*(id *)(v7 + 120), "count") - 1;
      v9 = *(_QWORD **)(a1 + 40);
      if (v8 == a3)
      {
        objc_msgSend(*(id *)(a1 + 32), "firstObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_increaseWithCount:source:", 1, objc_msgSend(v10, "source"));

        *(_QWORD *)(*(_QWORD *)(a1 + 40) + 128) = a3;
      }
      else
      {
        ++v9[16];
      }
      *a4 = 1;
    }
    else
    {
      *(_QWORD *)(v7 + 128) = -1;
    }
  }

}

@end
