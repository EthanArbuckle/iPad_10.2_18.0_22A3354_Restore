@implementation PickerNavigationBarPaletteContentView

- (void)layoutSubviews
{
  _TtC15PhotosUIPrivateP33_DC9A8F55D6B39D6B39426715689DCE8337PickerNavigationBarPaletteContentView *v2;

  v2 = self;
  sub_1AABDD5E8();

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v8;
  _TtC15PhotosUIPrivateP33_DC9A8F55D6B39D6B39426715689DCE8337PickerNavigationBarPaletteContentView *v9;
  void *v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = (void *)sub_1AABDD800((uint64_t)a4, x, y);

  return v10;
}

- (_TtC15PhotosUIPrivateP33_DC9A8F55D6B39D6B39426715689DCE8337PickerNavigationBarPaletteContentView)initWithFrame:(CGRect)a3
{
  return (_TtC15PhotosUIPrivateP33_DC9A8F55D6B39D6B39426715689DCE8337PickerNavigationBarPaletteContentView *)sub_1AABDDD4C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15PhotosUIPrivateP33_DC9A8F55D6B39D6B39426715689DCE8337PickerNavigationBarPaletteContentView)initWithCoder:(id)a3
{
  return (_TtC15PhotosUIPrivateP33_DC9A8F55D6B39D6B39426715689DCE8337PickerNavigationBarPaletteContentView *)sub_1AABDDDD0(a3);
}

@end
