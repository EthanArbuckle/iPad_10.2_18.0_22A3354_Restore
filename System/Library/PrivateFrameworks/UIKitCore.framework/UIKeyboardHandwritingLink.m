@implementation UIKeyboardHandwritingLink

void __34___UIKeyboardHandwritingLink_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "reloadInputViews");

}

void __78___UIKeyboardHandwritingLink_setCandidates_inlineText_inlineRect_maxX_layout___block_invoke(uint64_t a1, void *a2, unint64_t a3, BOOL *a4)
{
  void *v6;
  void *v7;

  v6 = *(void **)(a1 + 32);
  objc_msgSend(a2, "candidate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

  *a4 = a3 > 3;
}

@end
