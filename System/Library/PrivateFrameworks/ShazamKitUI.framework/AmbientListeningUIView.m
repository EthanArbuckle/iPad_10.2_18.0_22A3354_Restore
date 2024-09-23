@implementation AmbientListeningUIView

- (_TtC11ShazamKitUI22AmbientListeningUIView)initWithFrame:(CGRect)a3
{
  return (_TtC11ShazamKitUI22AmbientListeningUIView *)sub_2287B7FDC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11ShazamKitUI22AmbientListeningUIView)initWithCoder:(id)a3
{
  return (_TtC11ShazamKitUI22AmbientListeningUIView *)sub_2287B8648(a3);
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  -[AmbientListeningUIView layoutSubviews](&v4, sel_layoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC11ShazamKitUI22AmbientListeningUIView_listeningLayer];
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC11ShazamKitUI22AmbientListeningUIView_listeningLayerView], sel_bounds, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setFrame_);

}

- (CGSize)intrinsicContentSize
{
  _TtC11ShazamKitUI22AmbientListeningUIView *v2;
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v2 = self;
  v3 = -[AmbientListeningUIView superview](v2, sel_superview);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_bounds);
    v6 = v5;
    v8 = v7;

  }
  else
  {

    v8 = 0.0;
    v6 = 0.0;
  }
  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ShazamKitUI22AmbientListeningUIView_listeningLayerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ShazamKitUI22AmbientListeningUIView_listeningLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ShazamKitUI22AmbientListeningUIView_listeningLabel));
}

@end
