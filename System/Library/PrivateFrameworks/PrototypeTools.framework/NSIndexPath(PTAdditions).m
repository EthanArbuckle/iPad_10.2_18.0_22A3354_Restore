@implementation NSIndexPath(PTAdditions)

+ (id)pt_indexPathForRow:()PTAdditions inSection:
{
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v5[0] = a4;
  v5[1] = a3;
  objc_msgSend((id)objc_opt_class(), "indexPathWithIndexes:length:", v5, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)pt_section
{
  return objc_msgSend(a1, "indexAtPosition:", 0);
}

- (uint64_t)pt_row
{
  return objc_msgSend(a1, "indexAtPosition:", 1);
}

@end
