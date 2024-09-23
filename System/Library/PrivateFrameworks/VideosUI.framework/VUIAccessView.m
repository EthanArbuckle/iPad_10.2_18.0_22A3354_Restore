@implementation VUIAccessView

void __68__VUIAccessView_iOS_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 488);
  objc_msgSend(*(id *)(a1 + 40), "colorWithAlphaComponent:", 0.5);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setBackgroundColor:", v2);

}

uint64_t __68__VUIAccessView_iOS_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 488), "setBackgroundColor:", *(_QWORD *)(a1 + 40));
}

@end
