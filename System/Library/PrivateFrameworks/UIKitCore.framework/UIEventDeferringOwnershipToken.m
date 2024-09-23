@implementation UIEventDeferringOwnershipToken

id __73___UIEventDeferringOwnershipToken_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  id v2;
  unint64_t v3;
  const __CFString *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("ownerClass"));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32);
  if (v3 > 3)
    v4 = &stru_1E16EDF20;
  else
    v4 = off_1E16B4D60[v3];
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", v4, CFSTR("owningInterfaceElementCategory"));
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPointer:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40), CFSTR("ownerPointer"));
  v7 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "count"), CFSTR("environments.count"));
  v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "count"), CFSTR("environmentsPendingInvalidation.count"));
  v9 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64), CFSTR("target"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72), CFSTR("reason"));
}

void __73___UIEventDeferringOwnershipToken_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "activeMultilinePrefix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73___UIEventDeferringOwnershipToken_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E16B1B50;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v2, "appendBodySectionWithName:multilinePrefix:block:", 0, v3, v6);

}

@end
