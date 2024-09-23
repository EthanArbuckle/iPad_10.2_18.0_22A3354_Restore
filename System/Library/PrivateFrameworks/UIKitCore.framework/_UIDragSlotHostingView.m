@implementation _UIDragSlotHostingView

- (_UIDragSlotHostingView)initWithFrame:(CGRect)a3 contentSize:(id)a4 slotID:(unsigned int)a5
{
  uint64_t v5;
  _UIDragSlotHostingView *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v5 = *(_QWORD *)&a5;
  v10.receiver = self;
  v10.super_class = (Class)_UIDragSlotHostingView;
  v6 = -[UIView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.var0, a4.var1, a4.var2);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CD2720], "objectForSlot:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView layer](v6, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setContents:", v7);

  }
  return v6;
}

@end
