@implementation PUPickerSegmentedControl

- (BOOL)_isFullWidthControl
{
  return 0;
}

- (PUPickerSegmentedControl)initWithItems:(id)a3
{
  PUPickerSegmentedControl *v3;
  PUPickerSegmentedControl *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUPickerSegmentedControl;
  v3 = -[PUPickerSegmentedControl initWithItems:](&v6, sel_initWithItems_, a3);
  v4 = v3;
  if (v3 && -[PUPickerSegmentedControl _isFullWidthControl](v3, "_isFullWidthControl"))
    -[PUPickerSegmentedControl setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v4;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  objc_super v8;
  CGSize result;

  if (-[PUPickerSegmentedControl _isFullWidthControl](self, "_isFullWidthControl"))
  {
    v3 = *MEMORY[0x1E0DC5000];
    v8.receiver = self;
    v8.super_class = (Class)PUPickerSegmentedControl;
    -[PUPickerSegmentedControl intrinsicContentSize](&v8, sel_intrinsicContentSize);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PUPickerSegmentedControl;
    -[PUPickerSegmentedControl intrinsicContentSize](&v7, sel_intrinsicContentSize);
    v3 = v5;
  }
  v6 = v3;
  result.height = v4;
  result.width = v6;
  return result;
}

@end
