@implementation PhotosDetailsEXIFWidget

- (NSString)snappableWidgetIdentifier
{
  return (NSString *)(id)sub_1A7AE3734();
}

- (BOOL)hasLoadedContentData
{
  uint64_t (*v2)(void);
  _TtC12PhotosUICore23PhotosDetailsEXIFWidget *v3;
  uint64_t v4;
  _TtC12PhotosUICore23PhotosDetailsEXIFWidget *v5;
  char v6;

  v2 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.super.isa) + 0xD8);
  v3 = self;
  v4 = v2();
  if (v4)
  {
    v5 = (_TtC12PhotosUICore23PhotosDetailsEXIFWidget *)v4;
    type metadata accessor for PhotosDetailsEXIFWidgetViewModel();
    if (swift_dynamicCastClass())
      v6 = sub_1A6F96DA0();
    else
      v6 = 0;

    v3 = v5;
  }
  else
  {
    v6 = 0;
  }

  return v6 & 1;
}

- (void)loadContentData
{
  _TtC12PhotosUICore23PhotosDetailsEXIFWidget *v2;

  v2 = self;
  sub_1A688D848();

}

- (_TtC12PhotosUICore23PhotosDetailsEXIFWidget)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PhotosDetailsEXIFWidget();
  return -[PhotosDetailsWidget init](&v3, sel_init);
}

@end
