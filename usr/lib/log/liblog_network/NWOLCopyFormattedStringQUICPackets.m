@implementation NWOLCopyFormattedStringQUICPackets

uint64_t __NWOLCopyFormattedStringQUICPackets_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  _OWORD v10[16];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  memset(v10, 0, sizeof(v10));
  quic_shorthand_describe_entry();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("\t%s"), v10);
  v3 = v2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_QWORD *)(v4 + 40))
  {
    objc_msgSend(v2, "stringByAppendingFormat:", CFSTR("\n%@"), *(_QWORD *)(v4 + 40));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;
  }
  else
  {
    v8 = v2;
    v7 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v8;
  }

  return 1;
}

@end
