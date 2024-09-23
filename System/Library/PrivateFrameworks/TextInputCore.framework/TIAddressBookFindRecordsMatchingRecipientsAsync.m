@implementation TIAddressBookFindRecordsMatchingRecipientsAsync

void __TIAddressBookFindRecordsMatchingRecipientsAsync_block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0C97298]);
  recordsFromAddressBookMatchingRecipients(v3, *(void **)(a1 + 32), *(void **)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

@end
