@implementation ToolbarUIButton

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5;
  _TtC5Books15ToolbarUIButton *v6;
  id v7;

  v5 = a3;
  v6 = self;
  v7 = _s5Books15ToolbarUIButtonC22contextMenuInteraction_016configurationForE10AtLocationSo09UIContextE13ConfigurationCSgSo0keF0C_So7CGPointVtF_0();

  return v7;
}

- (_TtC5Books15ToolbarUIButton)initWithFrame:(CGRect)a3
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
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Books15ToolbarUIButton_tuiMenu) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ToolbarUIButton();
  return -[ToolbarUIButton initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC5Books15ToolbarUIButton)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Books15ToolbarUIButton_tuiMenu) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ToolbarUIButton();
  return -[ToolbarUIButton initWithCoder:](&v5, "initWithCoder:", a3);
}

- (void).cxx_destruct
{

}

@end
