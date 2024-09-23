@implementation UITableViewDropProposal

- (UITableViewDropProposal)initWithDropOperation:(unint64_t)a3
{
  UITableViewDropProposal *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UITableViewDropProposal;
  result = -[UIDropProposal initWithDropOperation:](&v4, sel_initWithDropOperation_, a3);
  if (result)
    result->_intent = 0;
  return result;
}

- (UITableViewDropProposal)initWithDropOperation:(unint64_t)a3 dropLocation:(int64_t)a4
{
  UITableViewDropProposal *v5;
  int64_t v6;
  void *v7;
  void *v8;

  v5 = -[UITableViewDropProposal initWithDropOperation:](self, "initWithDropOperation:", a3);
  if (v5)
  {
    if ((unint64_t)a4 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "UITableViewDropIntent _UITableViewDropIntentForDropLocation(UITableViewDropLocation)");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("_UITableViewDropCoordinator.m"), 39, CFSTR("Unknown drop location value: %ld"), a4);

    }
    else
    {
      v6 = qword_186684490[a4];
    }
    v5->_intent = v6;
  }
  return v5;
}

- (UITableViewDropProposal)initWithDropOperation:(UIDropOperation)operation intent:(UITableViewDropIntent)intent
{
  UITableViewDropProposal *result;

  result = -[UITableViewDropProposal initWithDropOperation:](self, "initWithDropOperation:", operation);
  if (result)
    result->_intent = intent;
  return result;
}

- (int64_t)_dropLocation
{
  unint64_t intent;
  int64_t result;
  void *v4;
  void *v5;

  intent = self->_intent;
  if (intent < 4)
    return qword_1866844B0[intent];
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "UITableViewDropLocation _UITableViewDropLocationForDropIntent(UITableViewDropIntent)");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("_UITableViewDropCoordinator.m"), 26, CFSTR("Unknown drop intent value: %ld"), intent);

  return result;
}

- (id)_updatedDropProposalWithDropOperation:(unint64_t)a3 dropIntent:(int64_t)a4 adjustedTargetIndexPath:(id)a5
{
  id v8;
  UITableViewDropProposal *v9;
  UITableViewDropProposal *v10;

  v8 = a5;
  v9 = self;
  if (-[UIDropProposal operation](v9, "operation") != a3 || -[UITableViewDropProposal intent](v9, "intent") != a4)
  {
    v10 = -[UITableViewDropProposal initWithDropOperation:intent:]([UITableViewDropProposal alloc], "initWithDropOperation:intent:", a3, a4);

    v9 = v10;
  }
  -[UITableViewDropProposal _setAdjustedTargetIndexPath:](v9, "_setAdjustedTargetIndexPath:", v8);

  return v9;
}

- (int64_t)_dropAction
{
  UIDropOperation v3;
  unint64_t v4;
  int64_t result;
  unint64_t v6;
  void *v7;
  void *v8;

  v3 = -[UIDropProposal operation](self, "operation");
  v4 = -[UITableViewDropProposal _dropLocation](self, "_dropLocation");
  if (v3 < UIDropOperationCopy)
    return 3;
  v6 = v4;
  if (v4 < 4)
    return qword_1866844D0[v4];
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "UITableViewDropAction _UITableViewDropActionForDropOperationAndDropLocation(UIDropOperation, UITableViewDropLocation)");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("_UITableViewDropCoordinator.m"), 120, CFSTR("Unknown drop location value: %ld"), v6);

  return result;
}

- (UITableViewDropIntent)intent
{
  return self->_intent;
}

- (void)setIntent:(int64_t)a3
{
  self->_intent = a3;
}

- (NSIndexPath)_adjustedTargetIndexPath
{
  return self->_adjustedTargetIndexPath;
}

- (void)_setAdjustedTargetIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_adjustedTargetIndexPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adjustedTargetIndexPath, 0);
}

@end
