@implementation PaperTextAttachmentView

- (BOOL)_wantsToolPickerVisible:(id)a3
{
  id v4;
  _TtC8PaperKit23PaperTextAttachmentView *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = PaperTextAttachmentView._wantsToolPickerVisible(_:)((PKToolPicker)v4);

  return self & 1;
}

@end
