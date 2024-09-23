@implementation UIMenuController

- (BOOL)_crlaxShouldPreventMakingVisible
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_101414B18);
}

- (void)_crlaxSetShouldPreventMakingVisible:(BOOL)a3
{
  __CRLAccessibilitySetAssociatedBool(self, &unk_101414B18, a3);
}

- (BOOL)_crlaxShouldPreventMutatingItems
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_101414B19);
}

- (void)_crlaxSetShouldPreventMutatingItems:(BOOL)a3
{
  __CRLAccessibilitySetAssociatedBool(self, &unk_101414B19, a3);
}

- (NSArray)_crlaxLastUpdatedMenuItemsWhilePreventingActualItemsMutation
{
  return (NSArray *)__CRLAccessibilityGetAssociatedObject(self, &unk_101414B1A);
}

- (void)_crlaxSetLastUpdatedMenuItemsWhilePreventingActualItemsMutation:(id)a3
{
  __CRLAccessibilitySetAssociatedObject(self, &unk_101414B1A, a3);
}

- (void)crlaxPerformBlockPreventingMakingVisible:(id)a3
{
  void (**v4)(void);

  v4 = (void (**)(void))a3;
  if (-[UIMenuController _crlaxShouldPreventMakingVisible](self, "_crlaxShouldPreventMakingVisible"))
  {
    v4[2]();
  }
  else
  {
    -[UIMenuController _crlaxSetShouldPreventMakingVisible:](self, "_crlaxSetShouldPreventMakingVisible:", 1);
    v4[2]();
    -[UIMenuController _crlaxSetShouldPreventMakingVisible:](self, "_crlaxSetShouldPreventMakingVisible:", 0);
  }

}

- (id)crlaxPerformBlockPreventingMutatingMenuItems:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;

  v4 = (void (**)(_QWORD))a3;
  if (-[UIMenuController _crlaxShouldPreventMutatingItems](self, "_crlaxShouldPreventMutatingItems"))
  {
    v4[2](v4);
  }
  else
  {
    -[UIMenuController _crlaxSetShouldPreventMutatingItems:](self, "_crlaxSetShouldPreventMutatingItems:", 1);
    v4[2](v4);
    -[UIMenuController _crlaxSetShouldPreventMutatingItems:](self, "_crlaxSetShouldPreventMutatingItems:", 0);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIMenuController _crlaxLastUpdatedMenuItemsWhilePreventingActualItemsMutation](self, "_crlaxLastUpdatedMenuItemsWhilePreventingActualItemsMutation"));
  -[UIMenuController _crlaxSetLastUpdatedMenuItemsWhilePreventingActualItemsMutation:](self, "_crlaxSetLastUpdatedMenuItemsWhilePreventingActualItemsMutation:", 0);

  return v5;
}

@end
