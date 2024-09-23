@implementation UISearchBarTextFieldLabel

+ (id)_defaultAttributes
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__UISearchBarTextFieldLabel__defaultAttributes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_31 != -1)
    dispatch_once(&_MergedGlobals_31, block);
  return (id)qword_1ECD7C718;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!-[UISearchBarTextFieldLabel ignoresGeometryChanges](self, "ignoresGeometryChanges"))
  {
    v8.receiver = self;
    v8.super_class = (Class)UISearchBarTextFieldLabel;
    -[UILabel setFrame:](&v8, sel_setFrame_, x, y, width, height);
  }
}

- (BOOL)ignoresGeometryChanges
{
  return *(&self->super._shouldRenderWithoutTextField + 1);
}

void __47__UISearchBarTextFieldLabel__defaultAttributes__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  objc_super v3;

  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)&OBJC_METACLASS___UISearchBarTextFieldLabel;
  objc_msgSendSuper2(&v3, sel__defaultAttributes);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1ECD7C718;
  qword_1ECD7C718 = v1;

}

- (void)setIgnoresGeometryChanges:(BOOL)a3
{
  *(&self->super._shouldRenderWithoutTextField + 1) = a3;
}

@end
