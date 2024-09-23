@implementation _UIUpdateLinkTrackingView

- (void)dealloc
{
  uint64_t v3;
  objc_super v4;

  v3 = *(_QWORD *)&self->super.super._sceneForeground;
  if (v3)
  {
    *(_QWORD *)(v3 + 16) = 0;
    if (!*(_QWORD *)(v3 + 8))
      objc_msgSend(0, "removeInteraction:");
  }
  v4.receiver = self;
  v4.super_class = (Class)_UIUpdateLinkTrackingView;
  -[UIUpdateLink dealloc](&v4, sel_dealloc);
}

@end
