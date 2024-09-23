@implementation PageLabelView

- (_TtC8PaperKit13PageLabelView)initWithFrame:(CGRect)a3
{
  return (_TtC8PaperKit13PageLabelView *)PageLabelView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8PaperKit13PageLabelView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized PageLabelView.init(coder:)();
}

- (void)dealloc
{
  uint64_t v3;
  void *v4;
  _TtC8PaperKit13PageLabelView *v5;
  void *v6;
  objc_super v7;

  v3 = OBJC_IVAR____TtC8PaperKit13PageLabelView_timer;
  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8PaperKit13PageLabelView_timer);
  v5 = self;
  objc_msgSend(v4, sel_invalidate);
  v6 = *(Class *)((char *)&self->super.super.super.isa + v3);
  *(Class *)((char *)&self->super.super.super.isa + v3) = 0;

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for PageLabelView();
  -[PageLabelView dealloc](&v7, sel_dealloc);
}

- (void).cxx_destruct
{

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  void *v7;
  id v8;
  _TtC8PaperKit13PageLabelView *v9;
  _TtC8PaperKit13PageLabelView *v10;
  objc_super v12;
  CGPoint v13;
  CGRect v14;

  y = a3.y;
  x = a3.x;
  v7 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8PaperKit13PageLabelView_blurView);
  v8 = a4;
  v9 = self;
  objc_msgSend(v7, sel_frame);
  v13.x = x;
  v13.y = y;
  if (CGRectContainsPoint(v14, v13))
  {

  }
  else
  {
    v12.receiver = v9;
    v12.super_class = (Class)type metadata accessor for PageLabelView();
    v10 = (_TtC8PaperKit13PageLabelView *)-[PageLabelView hitTest:withEvent:](&v12, sel_hitTest_withEvent_, v8, x, y);

    v9 = v10;
  }
  return v9;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8PaperKit13PageLabelView_blurView), sel_pointInside_withEvent_, a4, a3.x, a3.y);
}

- (void)fadeOut
{
  _TtC8PaperKit13PageLabelView *v2;

  v2 = self;
  PageLabelView.fadeOut()();

}

@end
