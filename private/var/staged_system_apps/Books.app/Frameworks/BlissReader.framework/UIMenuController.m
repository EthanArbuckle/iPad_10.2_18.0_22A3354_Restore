@implementation UIMenuController

- (BOOL)_tsaxShouldPreventMakingVisible
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_543880);
}

- (void)_tsaxSetShouldPreventMakingVisible:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_543880, a3);
}

- (BOOL)_tsaxShouldPreventMutatingItems
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_543881);
}

- (void)_tsaxSetShouldPreventMutatingItems:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_543881, a3);
}

- (NSArray)_tsaxLastUpdatedMenuItemsWhilePreventingActualItemsMutation
{
  return (NSArray *)__TSAccessibilityGetAssociatedObject(self, &unk_543882);
}

- (void)_tsaxSetLastUpdatedMenuItemsWhilePreventingActualItemsMutation:(id)a3
{
  __TSAccessibilitySetAssociatedObject(self, &unk_543882, a3);
}

- (void)tsaxPerformBlockPreventingMakingVisible:(id)a3
{
  UIMenuController *v4;

  if (-[UIMenuController _tsaxShouldPreventMakingVisible](self, "_tsaxShouldPreventMakingVisible"))
  {
    (*((void (**)(id))a3 + 2))(a3);
  }
  else
  {
    v4 = self;
    -[UIMenuController _tsaxSetShouldPreventMakingVisible:](self, "_tsaxSetShouldPreventMakingVisible:", 1);
    (*((void (**)(id))a3 + 2))(a3);
    -[UIMenuController _tsaxSetShouldPreventMakingVisible:](self, "_tsaxSetShouldPreventMakingVisible:", 0);

  }
}

- (id)tsaxPerformBlockPreventingMutatingMenuItems:(id)a3
{
  UIMenuController *v5;
  NSArray *v6;

  if (-[UIMenuController _tsaxShouldPreventMutatingItems](self, "_tsaxShouldPreventMutatingItems"))
  {
    (*((void (**)(id))a3 + 2))(a3);
  }
  else
  {
    v5 = self;
    -[UIMenuController _tsaxSetShouldPreventMutatingItems:](self, "_tsaxSetShouldPreventMutatingItems:", 1);
    (*((void (**)(id))a3 + 2))(a3);
    -[UIMenuController _tsaxSetShouldPreventMutatingItems:](self, "_tsaxSetShouldPreventMutatingItems:", 0);

  }
  v6 = -[UIMenuController _tsaxLastUpdatedMenuItemsWhilePreventingActualItemsMutation](self, "_tsaxLastUpdatedMenuItemsWhilePreventingActualItemsMutation");
  -[UIMenuController _tsaxSetLastUpdatedMenuItemsWhilePreventingActualItemsMutation:](self, "_tsaxSetLastUpdatedMenuItemsWhilePreventingActualItemsMutation:", 0);
  return v6;
}

@end
