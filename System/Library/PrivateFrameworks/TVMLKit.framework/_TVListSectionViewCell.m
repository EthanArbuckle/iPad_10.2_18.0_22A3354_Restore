@implementation _TVListSectionViewCell

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_TVListSectionViewCell;
  -[_TVListSectionViewCell prepareForReuse](&v4, sel_prepareForReuse);
  -[_TVListSectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[TVMLUtilities disassociateIKViewElementsRecursivelyFromView:](TVMLUtilities, "disassociateIKViewElementsRecursivelyFromView:", v3);

}

- (BOOL)canBecomeFocused
{
  return 0;
}

@end
