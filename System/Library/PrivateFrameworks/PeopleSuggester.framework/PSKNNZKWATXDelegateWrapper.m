@implementation PSKNNZKWATXDelegateWrapper

BOOL __79___PSKNNZKWATXDelegateWrapper__getInteractionFilterForPrimaryInteractionsModel__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  unint64_t v4;
  _BOOL8 v5;

  v2 = a2;
  objc_msgSend(v2, "recipients");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  v5 = v4 >= 2 && objc_msgSend(v2, "mechanism") == 4;
  return v5;
}

@end
