@implementation PhotosDetailsSharedWithYouWidget

- (NSString)snappableWidgetIdentifier
{
  return (NSString *)(id)sub_1A7AE3734();
}

- (int64_t)contentLayoutStyle
{
  _TtC12PhotosUICore32PhotosDetailsSharedWithYouWidget *v2;
  char v3;

  v2 = self;
  v3 = sub_1A68B5854();

  if ((v3 & 1) != 0)
    return 2;
  else
    return 0;
}

- (_TtC12PhotosUICore32PhotosDetailsSharedWithYouWidget)init
{
  objc_super v3;

  *((_BYTE *)&self->super.super.isa
  + OBJC_IVAR____TtC12PhotosUICore32PhotosDetailsSharedWithYouWidget____lazy_storage___hasSiblingWidgetAbove) = 2;
  *((_BYTE *)&self->super.super.isa
  + OBJC_IVAR____TtC12PhotosUICore32PhotosDetailsSharedWithYouWidget____lazy_storage___hasSiblingWidgetBelow) = 2;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PhotosDetailsSharedWithYouWidget();
  return -[PhotosDetailsWidget init](&v3, sel_init);
}

@end
