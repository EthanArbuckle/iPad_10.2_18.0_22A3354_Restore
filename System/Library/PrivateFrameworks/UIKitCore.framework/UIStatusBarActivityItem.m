@implementation UIStatusBarActivityItem

void __80___UIStatusBarActivityItem_Split_additionAnimationForDisplayItemWithIdentifier___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v4;
  void *v5;
  void (**v6)(id, uint64_t);

  v4 = *(void **)(a1 + 32);
  v6 = a4;
  objc_msgSend(v4, "activityView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startAnimating");

  v6[2](v6, 1);
}

void __79___UIStatusBarActivityItem_Split_removalAnimationForDisplayItemWithIdentifier___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a4;
  objc_msgSend(v4, "activityView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stopAnimatingWithCompletionHandler:", v5);

}

@end
