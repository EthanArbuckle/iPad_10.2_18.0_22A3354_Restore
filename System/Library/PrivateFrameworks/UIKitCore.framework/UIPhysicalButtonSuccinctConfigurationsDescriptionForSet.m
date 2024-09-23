@implementation UIPhysicalButtonSuccinctConfigurationsDescriptionForSet

void ___UIPhysicalButtonSuccinctConfigurationsDescriptionForSet_block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v4 = *(void **)(a1 + 32);
  v5 = 48;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    v5 = 40;
  v6 = *(_QWORD *)(a1 + v5);
  _NSStringFromUIPhysicalButton(objc_msgSend(a2, "_button"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("%@%@ (%llu)"), v6, v7, objc_msgSend(a2, "_generation"));

  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
}

@end
