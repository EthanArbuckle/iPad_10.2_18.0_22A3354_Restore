@implementation MachineDataAddHeadersToRequestProperties

void __MachineDataAddHeadersToRequestProperties_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (v6)
    objc_msgSend(*(id *)(a1 + 32), "setValue:forHTTPHeaderField:", v6, *MEMORY[0x24BEB2570]);
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "setValue:forHTTPHeaderField:", v5, *MEMORY[0x24BEB2568]);

}

void __MachineDataAddHeadersToRequestProperties_V1_5_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (v6)
    objc_msgSend(*(id *)(a1 + 32), "setValue:forHTTPHeaderField:", v6, *MEMORY[0x24BEB2530]);
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "setValue:forHTTPHeaderField:", v5, *MEMORY[0x24BEB2528]);

}

@end
