@implementation ListeningLayerPlatformWrapper.ListeningUIView

- (_TtCV11ShazamKitUI29ListeningLayerPlatformWrapper15ListeningUIView)initWithCoder:(id)a3
{
  _TtCV11ShazamKitUI29ListeningLayerPlatformWrapper15ListeningUIView *result;

  result = (_TtCV11ShazamKitUI29ListeningLayerPlatformWrapper15ListeningUIView *)sub_2287CDB74();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)swift_getObjectType();
  v2 = (char *)v13.receiver;
  -[ListeningLayerPlatformWrapper.ListeningUIView layoutSubviews](&v13, sel_layoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtCV11ShazamKitUI29ListeningLayerPlatformWrapper15ListeningUIView_listeningLayer];
  v4 = objc_msgSend(v2, sel_layer, v13.receiver, v13.super_class);
  objc_msgSend(v4, sel_bounds);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  objc_msgSend(v3, sel_setFrame_, v6, v8, v10, v12);
}

- (_TtCV11ShazamKitUI29ListeningLayerPlatformWrapper15ListeningUIView)initWithFrame:(CGRect)a3
{
  _TtCV11ShazamKitUI29ListeningLayerPlatformWrapper15ListeningUIView *result;

  result = (_TtCV11ShazamKitUI29ListeningLayerPlatformWrapper15ListeningUIView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCV11ShazamKitUI29ListeningLayerPlatformWrapper15ListeningUIView_listeningLayer));
}

@end
