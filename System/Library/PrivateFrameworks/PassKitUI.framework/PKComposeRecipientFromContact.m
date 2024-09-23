@implementation PKComposeRecipientFromContact

uint64_t __PKComposeRecipientFromContact_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C96FF0]);

  return v3;
}

@end
