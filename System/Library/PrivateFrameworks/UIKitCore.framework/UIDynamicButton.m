@implementation UIDynamicButton

uint64_t __63___UIDynamicButton__appendProemDescriptionSansSelfToFormatter___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appendFormat:", CFSTR("{%.*g, %.*g}"), 3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136), 3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144));
}

uint64_t __63___UIDynamicButton__appendProemDescriptionSansSelfToFormatter___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appendFormat:", CFSTR("{%.*g, %.*g}"), 3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152), 3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160));
}

uint64_t __59___UIDynamicButton__appendDebugBodyDescriptionToFormatter___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appendFormat:", CFSTR("{%.*g, %.*g}"), 3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136), 3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144));
}

uint64_t __59___UIDynamicButton__appendDebugBodyDescriptionToFormatter___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appendFormat:", CFSTR("{%.*g, %.*g}"), 3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152), 3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160));
}

uint64_t __49___UIDynamicButton_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  return -[_UIDynamicButton _appendProemDescriptionSansSelfToFormatter:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

uint64_t __52___UIDynamicButton__appendDebugDescriptionToStream___block_invoke(uint64_t result)
{
  unint64_t *v1;
  void *v2;
  void *v3;
  id v4;
  unint64_t v5;
  const __CFString *v6;

  v1 = *(unint64_t **)(result + 32);
  if (v1)
  {
    v2 = *(void **)(result + 40);
    _NSStringFromUIPhysicalButton(v1[3]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "appendString:withName:", v3, CFSTR("physicalButton"));

    v4 = (id)objc_msgSend(v2, "appendUnsignedInteger:withName:", v1[7], CFSTR("stage"));
    v5 = v1[9];
    if (v5 > 4)
      v6 = &stru_1E16EDF20;
    else
      v6 = off_1E16B8270[v5];
    return objc_msgSend(v2, "appendString:withName:", v6, CFSTR("phase"));
  }
  return result;
}

void __52___UIDynamicButton__appendDebugDescriptionToStream___block_invoke_2(uint64_t a1)
{
  -[_UIDynamicButton _appendDebugBodyDescriptionToFormatter:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

void __58___UIDynamicButton_descriptionBuilderWithMultilinePrefix___block_invoke(int8x16_t *a1)
{
  void *v2;
  void *v3;
  id v4;
  int8x16_t v5;
  _QWORD v6[4];
  int8x16_t v7;

  v2 = (void *)a1[2].i64[0];
  objc_msgSend(v2, "activeMultilinePrefix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58___UIDynamicButton_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E16B1B50;
  v5 = a1[2];
  v4 = (id)v5.i64[0];
  v7 = vextq_s8(v5, v5, 8uLL);
  objc_msgSend(v2, "appendBodySectionWithName:multilinePrefix:block:", 0, v3, v6);

}

void __58___UIDynamicButton_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  -[_UIDynamicButton _appendDebugBodyDescriptionToFormatter:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

@end
