@implementation PageHeaderContentContainerReusableView

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  char *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PageHeaderContentContainerReusableView();
  v2 = (char *)v5.receiver;
  -[PageHeaderContentContainerReusableView layoutSubviews](&v5, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC16MusicApplication38PageHeaderContentContainerReusableView_pageHeaderContentView];
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v2, "bounds", v5.receiver, v5.super_class);
    objc_msgSend(v4, "setFrame:");

    v2 = v4;
  }

}

- (_TtC16MusicApplication38PageHeaderContentContainerReusableView)initWithFrame:(CGRect)a3
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
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication38PageHeaderContentContainerReusableView_pageHeaderContentView) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PageHeaderContentContainerReusableView();
  return -[PageHeaderContentContainerReusableView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC16MusicApplication38PageHeaderContentContainerReusableView)initWithCoder:(id)a3
{
  id v4;
  _TtC16MusicApplication38PageHeaderContentContainerReusableView *v5;
  objc_super v7;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication38PageHeaderContentContainerReusableView_pageHeaderContentView) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for PageHeaderContentContainerReusableView();
  v4 = a3;
  v5 = -[PageHeaderContentContainerReusableView initWithCoder:](&v7, "initWithCoder:", v4);

  return v5;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication38PageHeaderContentContainerReusableView_pageHeaderContentView));
}

@end
