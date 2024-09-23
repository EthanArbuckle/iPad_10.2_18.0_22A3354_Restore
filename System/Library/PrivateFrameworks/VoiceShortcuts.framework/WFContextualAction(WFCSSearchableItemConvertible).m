@implementation WFContextualAction(WFCSSearchableItemConvertible)

- (void)generateSearchableItemWithCompletionBlock:()WFCSSearchableItemConvertible
{
  void (**v5)(_QWORD, _QWORD, _QWORD);
  id v6;

  v5 = a3;
  objc_msgSend(a1, "spotlightItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, _QWORD))a3)[2](v5, v6, 0);

}

@end
