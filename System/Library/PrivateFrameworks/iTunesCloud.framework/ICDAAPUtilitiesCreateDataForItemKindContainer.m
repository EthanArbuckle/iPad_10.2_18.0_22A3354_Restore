@implementation ICDAAPUtilitiesCreateDataForItemKindContainer

void __ICDAAPUtilitiesCreateDataForItemKindContainer_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0C99D68];
  v5 = a2;
  objc_msgSend(v3, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICDAAPUtilitiesWriteProperty(v5, 1836282979, 10, v4);

  objc_msgSend(v5, "writeUInt8:withCode:", *(unsigned __int8 *)(a1 + 40), 1835625316);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
