@implementation NSAttributedString

uint64_t __60__NSAttributedString_VK__vk_attributedSubstringFromVKRange___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t result;

  v5 = *(void **)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = objc_msgSend(a2, "nsRange");
  objc_msgSend(v6, "vk_attributedSubstringFromRange:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendAttributedString:", v9);

  result = objc_msgSend(*(id *)(a1 + 48), "count");
  if (result != a3 - 1)
    return objc_msgSend(*(id *)(a1 + 32), "vk_appendString:", CFSTR("\n"));
  return result;
}

void __82__NSAttributedString_VK__vk_enumerateClampedAttribute_inRange_options_usingBlock___block_invoke(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  id v13;
  NSRange v14;
  NSRange v15;
  NSRange v16;

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(_QWORD *)(v10 + 32);
  v12 = *(_QWORD *)(v10 + 40);
  v13 = a2;
  v15.location = v11;
  v15.length = v12;
  v16.location = a3;
  v16.length = a4;
  v14 = NSIntersectionRange(v15, v16);
  (*(void (**)(uint64_t, id, NSUInteger, NSUInteger, uint64_t))(v9 + 16))(v9, v13, v14.location, v14.length, a5);

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) += *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                           + 32)
                                                               - (a3
                                                                + a4);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = a3 + a4;
}

@end
