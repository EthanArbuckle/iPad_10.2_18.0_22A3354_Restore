@implementation FilenameTextField

- (_TtC5FilesP33_11F0A37C9C271DEFF6EB9FAAAADBC30117FilenameTextField)initWithFrame:(CGRect)a3
{
  return (_TtC5FilesP33_11F0A37C9C271DEFF6EB9FAAAADBC30117FilenameTextField *)sub_1000D57D4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5FilesP33_11F0A37C9C271DEFF6EB9FAAAADBC30117FilenameTextField)initWithCoder:(id)a3
{
  id v4;
  _TtC5FilesP33_11F0A37C9C271DEFF6EB9FAAAADBC30117FilenameTextField *result;

  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC5FilesP33_11F0A37C9C271DEFF6EB9FAAAADBC30117FilenameTextField_prefersInitallySelectedText) = 1;
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC5FilesP33_11F0A37C9C271DEFF6EB9FAAAADBC30117FilenameTextField_hasEverBeenFirstResponder) = 0;
  v4 = a3;

  result = (_TtC5FilesP33_11F0A37C9C271DEFF6EB9FAAAADBC30117FilenameTextField *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010050DA60, "Files/DOCPickerFilenameView.swift", 33, 2, 42, 0);
  __break(1u);
  return result;
}

- (BOOL)isEnabled
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FilenameTextField();
  return -[FilenameTextField isEnabled](&v3, "isEnabled");
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FilenameTextField();
  v4 = v5.receiver;
  -[FilenameTextField setEnabled:](&v5, "setEnabled:", v3);
  sub_1000D5A38();

}

- (BOOL)supportsImagePaste
{
  return 0;
}

- (BOOL)becomeFirstResponder
{
  _TtC5FilesP33_11F0A37C9C271DEFF6EB9FAAAADBC30117FilenameTextField *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_1000D5C3C();

  return v3 & 1;
}

- (CGRect)textRectForBounds:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  sub_1000D5ED4(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (const char **)&selRef_textRectForBounds_);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  sub_1000D5ED4(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (const char **)&selRef_editingRectForBounds_);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  _TtC5FilesP33_11F0A37C9C271DEFF6EB9FAAAADBC30117FilenameTextField *v8;
  id v9;
  void *v10;
  id v11;
  objc_super v13;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = self;
  if (-[FilenameTextField isEnabled](v8, "isEnabled")
    || (v9 = -[FilenameTextField rightView](v8, "rightView")) == 0)
  {
    v13.receiver = v8;
    v13.super_class = (Class)type metadata accessor for FilenameTextField();
    v11 = -[FilenameTextField hitTest:withEvent:](&v13, "hitTest:withEvent:", v7, x, y);

  }
  else
  {
    v10 = v9;
    -[FilenameTextField convertPoint:toCoordinateSpace:](v8, "convertPoint:toCoordinateSpace:", v9, x, y);
    v11 = objc_msgSend(v10, "hitTest:withEvent:", v7);

  }
  return v11;
}

@end
