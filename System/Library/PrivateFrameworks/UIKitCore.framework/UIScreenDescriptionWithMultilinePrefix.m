@implementation UIScreenDescriptionWithMultilinePrefix

id ___UIScreenDescriptionWithMultilinePrefix_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "displayIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("displayIdentity"));

  return (id)objc_msgSend(*(id *)(a1 + 32), "ui_appendUserInterfaceIdiom:withName:", objc_msgSend(*(id *)(a1 + 40), "_userInterfaceIdiom"), CFSTR("idiom"));
}

@end
