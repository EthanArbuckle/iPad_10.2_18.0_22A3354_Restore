@implementation AddToAllBackdropViews

void ___AddToAllBackdropViews_block_invoke(uint64_t a1)
{
  id v2;

  _AllBackdropViews();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 32));

}

@end
