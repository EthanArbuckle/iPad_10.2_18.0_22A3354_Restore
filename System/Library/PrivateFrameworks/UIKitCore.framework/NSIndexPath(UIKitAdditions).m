@implementation NSIndexPath(UIKitAdditions)

- (uint64_t)section
{
  return objc_msgSend(a1, "indexAtPosition:", 0);
}

- (uint64_t)item
{
  return objc_msgSend(a1, "indexAtPosition:", 1);
}

+ (id)indexPathForRow:()UIKitAdditions inSection:
{
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v5[0] = a4;
  v5[1] = a3;
  objc_msgSend((id)objc_opt_class(), "indexPathWithIndexes:length:", v5, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)indexPathForItem:()UIKitAdditions inSection:
{
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v5[0] = a4;
  v5[1] = a3;
  objc_msgSend((id)objc_opt_class(), "indexPathWithIndexes:length:", v5, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)row
{
  void *v5;

  if (objc_msgSend(a1, "length") != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSIndexPath+UIKitAdditions.m"), 32, CFSTR("Invalid index path for use with UITableView. Index paths passed to table view must contain exactly two indices specifying the section and row. Please use the category on NSIndexPath in NSIndexPath+UIKitAdditions.h if possible."));

  }
  return objc_msgSend(a1, "indexAtPosition:", 1);
}

@end
