@implementation PKPeerPaymentRecurringPaymentMemoSuggestions

void __PKPeerPaymentRecurringPaymentMemoSuggestions_block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  objc_class *v5;
  id v6;
  id v7;

  v5 = (objc_class *)MEMORY[0x1E0D67458];
  v6 = a2;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v7, "setEmoji:", v6);

  objc_msgSend(v7, "setColor:", a3);
  objc_msgSend(*(id *)(a1 + 32), "removeObject:", v7);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

}

@end
