@implementation UIEventDeferringDescriptor

uint64_t __69___UIEventDeferringDescriptor_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  const __CFString *v4;
  const __CFString *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24);
  v4 = &stru_1E16EDF20;
  if (v3 == 1)
    v4 = CFSTR("remote");
  if (v3)
    v5 = v4;
  else
    v5 = CFSTR("local");
  v6 = (id)objc_msgSend(v2, "appendObject:withName:", v5, CFSTR("scope"));
  v7 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("compatibility"));
  v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), CFSTR("environment"));
  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40), CFSTR("displayIdentifier"));
  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:skipIfEmpty:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48), CFSTR("predicateSceneIdentity"), 1);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(unsigned int *)(v9 + 12);
  if ((_DWORD)v10)
  {
    v11 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:format:", v10, CFSTR("predicateContextID"), 1);
    v9 = *(_QWORD *)(a1 + 40);
  }
  v12 = *(int *)(v9 + 16);
  if ((_DWORD)v12)
  {
    v13 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", v12, CFSTR("targetPID"));
    v9 = *(_QWORD *)(a1 + 40);
  }
  v14 = *(unsigned int *)(v9 + 20);
  if ((_DWORD)v14)
  {
    v15 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:format:", v14, CFSTR("targetContextID"), 1);
    v9 = *(_QWORD *)(a1 + 40);
  }
  return objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", *(_QWORD *)(v9 + 64), CFSTR("targetSceneIdentity"));
}

void __69___UIEventDeferringDescriptor_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
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
  v6[2] = __69___UIEventDeferringDescriptor_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E16B1B50;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v2, "appendBodySectionWithName:multilinePrefix:block:", 0, v3, v6);

}

@end
