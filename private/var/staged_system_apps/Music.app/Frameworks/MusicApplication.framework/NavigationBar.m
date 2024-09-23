@implementation NavigationBar

- (_TtC16MusicApplication13NavigationBar)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication13NavigationBar *)sub_3B7EFC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication13NavigationBar)initWithCoder:(id)a3
{
  id v4;
  _TtC16MusicApplication13NavigationBar *v5;
  objc_super v7;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication13NavigationBar_musicTintColor) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication13NavigationBar_musicPartialBackgroundView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication13NavigationBar_topItemPreferredNavigationBarTintColorObserver) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for NavigationBar();
  v4 = a3;
  v5 = -[NavigationBar initWithCoder:](&v7, "initWithCoder:", v4);

  return v5;
}

- (void)layoutSubviews
{
  _TtC16MusicApplication13NavigationBar *v2;

  v2 = self;
  sub_3B80DC();

}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for NavigationBar();
  -[NavigationBar bounds](&v6, "bounds");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *v8;
  _TtC16MusicApplication13NavigationBar *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  char v23;
  double v24;
  objc_super v25;
  objc_super v26;
  CGRect v27;
  CGRect v28;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (objc_class *)type metadata accessor for NavigationBar();
  v26.receiver = self;
  v26.super_class = v8;
  v9 = self;
  -[NavigationBar bounds](&v26, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v25.receiver = v9;
  v25.super_class = v8;
  -[NavigationBar setBounds:](&v25, "setBounds:", x, y, width, height);
  -[NavigationBar frame](v9, "frame");
  v28.origin.x = v18;
  v28.origin.y = v19;
  v28.size.width = v20;
  v28.size.height = v21;
  v27.origin.x = v11;
  v27.origin.y = v13;
  v27.size.width = v15;
  v27.size.height = v17;
  if (!CGRectEqualToRect(v27, v28))
  {
    -[NavigationBar bounds](v9, "bounds");
    v23 = HI.SizeClass.init(_:)(v22);
    v24 = HI.SizeClass.margin.getter(v23);
    -[NavigationBar setLayoutMargins:](v9, "setLayoutMargins:", 0.0, v24, 0.0, v24);
  }

}

- (void)_cancelInteractiveTransition
{
  _TtC16MusicApplication13NavigationBar *v2;

  v2 = self;
  sub_3B8344();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication13NavigationBar_musicTintColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication13NavigationBar_musicPartialBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication13NavigationBar_topItemPreferredNavigationBarTintColorObserver));
}

@end
