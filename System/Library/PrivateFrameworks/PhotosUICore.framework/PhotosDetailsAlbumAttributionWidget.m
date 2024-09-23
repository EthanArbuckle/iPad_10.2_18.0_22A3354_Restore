@implementation PhotosDetailsAlbumAttributionWidget

- (PXPhotosDetailsContext)context
{
  _TtC12PhotosUICore35PhotosDetailsAlbumAttributionWidget *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1A6B29214();

  return (PXPhotosDetailsContext *)v3;
}

- (void)setContext:(id)a3
{
  _TtC12PhotosUICore35PhotosDetailsAlbumAttributionWidget *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_1A6DB7030(v5);

}

- (NSString)snappableWidgetIdentifier
{
  return (NSString *)(id)sub_1A7AE3734();
}

- (int64_t)contentLayoutStyle
{
  _TtC12PhotosUICore35PhotosDetailsAlbumAttributionWidget *v2;
  char v3;

  v2 = self;
  v3 = sub_1A6DB6C60();

  if ((v3 & 1) != 0)
    return 2;
  else
    return 0;
}

- (_TtC12PhotosUICore35PhotosDetailsAlbumAttributionWidget)init
{
  _QWORD *v2;
  objc_super v4;

  v2 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC12PhotosUICore35PhotosDetailsAlbumAttributionWidget_contextObservation);
  *v2 = 0;
  v2[1] = 0;
  *((_BYTE *)&self->super.super.isa
  + OBJC_IVAR____TtC12PhotosUICore35PhotosDetailsAlbumAttributionWidget____lazy_storage___hasSiblingWidgetAbove) = 2;
  *((_BYTE *)&self->super.super.isa
  + OBJC_IVAR____TtC12PhotosUICore35PhotosDetailsAlbumAttributionWidget____lazy_storage___hasSiblingWidgetBelow) = 2;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for PhotosDetailsAlbumAttributionWidget();
  return -[PhotosDetailsWidget init](&v4, sel_init);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end
