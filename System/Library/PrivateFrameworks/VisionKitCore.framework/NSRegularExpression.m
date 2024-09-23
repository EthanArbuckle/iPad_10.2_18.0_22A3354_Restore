@implementation NSRegularExpression

void __55__NSRegularExpression_VK__vk_rangesForMatchesInString___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  VKTextRange *v7;
  uint64_t v8;
  uint64_t v9;
  VKTextRange *v10;
  id v11;

  v11 = a2;
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  v7 = [VKTextRange alloc];
  v8 = objc_msgSend(v11, "range");
  v10 = -[VKTextRange initWithRange:](v7, "initWithRange:", v8, v9);
  objc_msgSend(v3, "addObject:", v10);

}

@end
