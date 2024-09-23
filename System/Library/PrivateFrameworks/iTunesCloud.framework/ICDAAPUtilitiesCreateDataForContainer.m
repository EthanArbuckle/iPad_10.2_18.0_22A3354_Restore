@implementation ICDAAPUtilitiesCreateDataForContainer

void __ICDAAPUtilitiesCreateDataForContainer_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned int *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "startContainerWithCode:", v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(v4, "endContainerWithCode:", *(unsigned int *)(a1 + 40));

}

@end
