@implementation UISearchBarSearchDismissalTransitioner

void __50___UISearchBarSearchDismissalTransitioner_animate__block_invoke(uint64_t a1)
{
  _QWORD v1[4];
  id v2;

  v1[0] = MEMORY[0x1E0C809B0];
  v1[1] = 3221225472;
  v1[2] = __50___UISearchBarSearchDismissalTransitioner_animate__block_invoke_2;
  v1[3] = &unk_1E16B1B28;
  v2 = *(id *)(a1 + 32);
  +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v1, 0.0, 0.3);

}

void __50___UISearchBarSearchDismissalTransitioner_animate__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "scopeBarContainer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

@end
