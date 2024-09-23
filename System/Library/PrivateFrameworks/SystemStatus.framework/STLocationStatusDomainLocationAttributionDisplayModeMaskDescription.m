@implementation STLocationStatusDomainLocationAttributionDisplayModeMaskDescription

void __STLocationStatusDomainLocationAttributionDisplayModeMaskDescription_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;

  STLocationStatusDomainLocationAttributionDisplayModeDescription(a2);
  v3 = objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v5 = (id)v3;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", %@"), v3);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = v4;
  }
  v6 = (id)v3;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "appendString:", v3);
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);

}

@end
