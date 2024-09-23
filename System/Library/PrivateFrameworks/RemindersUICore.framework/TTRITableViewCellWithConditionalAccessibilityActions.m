@implementation TTRITableViewCellWithConditionalAccessibilityActions

- (BOOL)ttriAccessibilityHidesPrivateActions
{
  return 0;
}

- (BOOL)ttriAccessibilityIsTableViewEditing
{
  void *v3;
  char v4;

  NSSelectorFromString(CFSTR("_tableView"));
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v3 = 0;
    goto LABEL_5;
  }
  -[TTRITableViewCellWithConditionalAccessibilityActions valueForKey:](self, "valueForKey:", CFSTR("_tableView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
LABEL_5:
    v4 = objc_msgSend(v3, "isEditing");
    goto LABEL_6;
  }
  v4 = 0;
LABEL_6:

  return v4;
}

- (id)_privateAccessibilityCustomActions
{
  objc_super v4;

  if (-[TTRITableViewCellWithConditionalAccessibilityActions ttriAccessibilityHidesPrivateActions](self, "ttriAccessibilityHidesPrivateActions"))
  {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)TTRITableViewCellWithConditionalAccessibilityActions;
  -[TTRITableViewCellWithConditionalAccessibilityActions _privateAccessibilityCustomActions](&v4, sel__privateAccessibilityCustomActions);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
