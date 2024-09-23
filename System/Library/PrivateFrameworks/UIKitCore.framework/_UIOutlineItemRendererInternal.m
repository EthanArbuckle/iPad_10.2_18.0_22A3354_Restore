@implementation _UIOutlineItemRendererInternal

- (_UIOutlineItemRendererInternal)initWithIdentifier:(id)a3 cellClass:(Class)a4 handler:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIOutlineItemRendererInternal;
  return -[_UIOutlineItemRenderer initWithIdentifier:cellClass:handler:](&v6, sel_initWithIdentifier_cellClass_handler_, a3, a4, a5);
}

@end
