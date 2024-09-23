@implementation UIPhysicalButtonContact

uint64_t __71___UIPhysicalButtonContact__appendProemDescriptionSansSelfToFormatter___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appendFormat:", CFSTR("{%.*g, %.*g}"), 3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), 3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
}

uint64_t __71___UIPhysicalButtonContact__appendProemDescriptionSansSelfToFormatter___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appendFormat:", CFSTR("{%.*g, %.*g}"), 3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), 3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
}

uint64_t __67___UIPhysicalButtonContact__appendDebugBodyDescriptionToFormatter___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appendFormat:", CFSTR("{%.*g, %.*g}"), 3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), 3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
}

uint64_t __67___UIPhysicalButtonContact__appendDebugBodyDescriptionToFormatter___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appendFormat:", CFSTR("{%.*g, %.*g}"), 3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), 3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
}

uint64_t __57___UIPhysicalButtonContact_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  return -[_UIPhysicalButtonContact _appendProemDescriptionSansSelfToFormatter:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

void __60___UIPhysicalButtonContact__appendDebugDescriptionToStream___block_invoke_2(uint64_t a1)
{
  -[_UIPhysicalButtonContact _appendDebugBodyDescriptionToFormatter:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

void __66___UIPhysicalButtonContact_descriptionBuilderWithMultilinePrefix___block_invoke(int8x16_t *a1)
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
  v6[2] = __66___UIPhysicalButtonContact_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E16B1B50;
  v5 = a1[2];
  v4 = (id)v5.i64[0];
  v7 = vextq_s8(v5, v5, 8uLL);
  objc_msgSend(v2, "appendBodySectionWithName:multilinePrefix:block:", 0, v3, v6);

}

void __66___UIPhysicalButtonContact_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  -[_UIPhysicalButtonContact _appendDebugBodyDescriptionToFormatter:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

@end
