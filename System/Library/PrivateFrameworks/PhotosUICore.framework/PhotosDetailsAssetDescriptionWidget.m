@implementation PhotosDetailsAssetDescriptionWidget

- (NSString)snappableWidgetIdentifier
{
  return (NSString *)(id)sub_1A7AE3734();
}

- (BOOL)hasLoadedContentData
{
  uint64_t (*v2)(void);
  _TtC12PhotosUICore35PhotosDetailsAssetDescriptionWidget *v3;
  uint64_t v4;
  _TtC12PhotosUICore35PhotosDetailsAssetDescriptionWidget *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;

  v2 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.super.isa) + 0xD8);
  v3 = self;
  v4 = v2();
  if (v4)
  {
    v5 = (_TtC12PhotosUICore35PhotosDetailsAssetDescriptionWidget *)v4;
    type metadata accessor for PhotosDetailsAssetDescriptionWidgetViewModel(0);
    v6 = swift_dynamicCastClass();
    if (v6)
    {
      v7 = (*(uint64_t (**)(void))(**(_QWORD **)(v6
                                              + OBJC_IVAR____TtC12PhotosUICore44PhotosDetailsAssetDescriptionWidgetViewModel_content)
                                + 120))();
      v9 = v8;
      v10 = sub_1A6EFCB6C(v7, v8);
      sub_1A6EFEC34(v7, v9);
    }
    else
    {
      v10 = 0;
    }

    v3 = v5;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (_TtC12PhotosUICore35PhotosDetailsAssetDescriptionWidget)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PhotosDetailsAssetDescriptionWidget();
  return -[PhotosDetailsWidget init](&v3, sel_init);
}

@end
