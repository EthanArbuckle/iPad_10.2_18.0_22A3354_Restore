@implementation UIPhysicalButtonConfiguration

id __74___UIPhysicalButtonConfiguration__cameraShutterConfigurationsWithOptions___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __72___UIPhysicalButtonConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke(int8x16_t *a1)
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
  v6[2] = __72___UIPhysicalButtonConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E16B1B50;
  v5 = a1[2];
  v4 = (id)v5.i64[0];
  v7 = vextq_s8(v5, v5, 8uLL);
  objc_msgSend(v2, "appendBodySectionWithName:multilinePrefix:block:", 0, v3, v6);

}

void __72___UIPhysicalButtonConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;
  id v9;
  id v10;

  _NSStringFromUIPhysicalButton(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "appendString:withName:", v10, CFSTR("button"));
  _NSStringFromUIPhysicalButtonBehavior(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "appendString:withName:", v2, CFSTR("behavior"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), CFSTR("behaviorOptions"), 1);
  objc_msgSend(*(id *)(a1 + 40), "appendString:withName:skipIfEmpty:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), CFSTR("name"), 1);
  v4 = (id)objc_msgSend(*(id *)(a1 + 40), "appendBool:withName:ifEqualTo:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8), CFSTR("wantsSystemShellExclusivePriority"), 1);
  v5 = (id)objc_msgSend(*(id *)(a1 + 40), "appendUInt64:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), CFSTR("generation"));
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = (objc_class *)objc_opt_class();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("<%s: %p; pid: %i>"),
    class_getName(v7),
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48),
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "pid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:", v8, CFSTR("auditToken"));

}

@end
