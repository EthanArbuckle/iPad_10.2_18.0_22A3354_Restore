@implementation MenuCell.SwitchContainerView

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  _TtCC16MusicApplication8MenuCellP33_C2E388CD2164915D6B208DFC15E7FAC819SwitchContainerView *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  v4 = self;
  v5 = sub_B4BA60();
  objc_msgSend(v5, "intrinsicContentSize");
  v7 = v6;
  v9 = v8;

  if (height > v9)
    v10 = height;
  else
    v10 = v9;
  v11 = v7;
  result.height = v10;
  result.width = v11;
  return result;
}

- (void)layoutSubviews
{
  _TtCC16MusicApplication8MenuCellP33_C2E388CD2164915D6B208DFC15E7FAC819SwitchContainerView *v2;

  v2 = self;
  sub_B4BB4C();

}

- (_TtCC16MusicApplication8MenuCellP33_C2E388CD2164915D6B208DFC15E7FAC819SwitchContainerView)initWithFrame:(CGRect)a3
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
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication8MenuCellP33_C2E388CD2164915D6B208DFC15E7FAC819SwitchContainerView____lazy_storage___switchButton) = 0;
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtCC16MusicApplication8MenuCellP33_C2E388CD2164915D6B208DFC15E7FAC819SwitchContainerView_isTopAligned) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for MenuCell.SwitchContainerView();
  return -[MenuCell.SwitchContainerView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtCC16MusicApplication8MenuCellP33_C2E388CD2164915D6B208DFC15E7FAC819SwitchContainerView)initWithCoder:(id)a3
{
  id v4;
  _TtCC16MusicApplication8MenuCellP33_C2E388CD2164915D6B208DFC15E7FAC819SwitchContainerView *v5;
  objc_super v7;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication8MenuCellP33_C2E388CD2164915D6B208DFC15E7FAC819SwitchContainerView____lazy_storage___switchButton) = 0;
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtCC16MusicApplication8MenuCellP33_C2E388CD2164915D6B208DFC15E7FAC819SwitchContainerView_isTopAligned) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MenuCell.SwitchContainerView();
  v4 = a3;
  v5 = -[MenuCell.SwitchContainerView initWithCoder:](&v7, "initWithCoder:", v4);

  return v5;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication8MenuCellP33_C2E388CD2164915D6B208DFC15E7FAC819SwitchContainerView____lazy_storage___switchButton));
}

@end
