@implementation UITextFieldLabel

+ (id)defaultFont
{
  objc_msgSend(off_1E167A828, "defaultFontSize");
  return (id)objc_msgSend(off_1E167A828, "systemFontOfSize:");
}

- (void)drawTextInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  UITextFieldLabel *v7;
  void *v8;
  void *v9;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = v7;
  while (1)
  {
    v9 = v8;
    objc_msgSend(v8, "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      break;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "_drawTextInRect:forLabel:", v7, x, y, width, height);
      goto LABEL_7;
    }
  }
  if (-[UITextFieldLabel shouldRenderWithoutTextField](v7, "shouldRenderWithoutTextField"))
  {
    v10.receiver = v7;
    v10.super_class = (Class)UITextFieldLabel;
    -[UILabel drawTextInRect:](&v10, sel_drawTextInRect_, x, y, width, height);
  }
LABEL_7:

}

- (void)_defaultDrawTextInRect:(CGRect)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UITextFieldLabel;
  -[UILabel drawTextInRect:](&v3, sel_drawTextInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

void __38__UITextFieldLabel__defaultAttributes__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  objc_super v3;

  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)&OBJC_METACLASS___UITextFieldLabel;
  objc_msgSendSuper2(&v3, sel__defaultAttributes);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1ECD81A70;
  qword_1ECD81A70 = v1;

}

+ (id)_defaultAttributes
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__UITextFieldLabel__defaultAttributes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_1249 != -1)
    dispatch_once(&_MergedGlobals_1249, block);
  return (id)qword_1ECD81A70;
}

- (BOOL)_shouldDrawUnderlinesLikeWebKit
{
  return 1;
}

- (BOOL)shouldRenderWithoutTextField
{
  return self->_shouldRenderWithoutTextField;
}

- (void)setShouldRenderWithoutTextField:(BOOL)a3
{
  self->_shouldRenderWithoutTextField = a3;
}

@end
