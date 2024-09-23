@implementation ToolbarStyleButton

- (_TtC5Books18ToolbarStyleButton)initWithFrame:(CGRect)a3
{
  return (_TtC5Books18ToolbarStyleButton *)sub_10039E918(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ToolbarStyleButton();
  v2 = (char *)v4.receiver;
  -[ToolbarStyleButton layoutSubviews](&v4, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC5Books18ToolbarStyleButton_highlightView];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Books18ToolbarStyleButton_highlightView));
}

@end
