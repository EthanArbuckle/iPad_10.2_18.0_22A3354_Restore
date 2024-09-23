@implementation ValueDrivingScrollLayout.ContentLayout

- (_TtCC12PhotosUICore24ValueDrivingScrollLayoutP33_47CE02453974CF9C45460F69EF777CFA13ContentLayout)init
{
  return (_TtCC12PhotosUICore24ValueDrivingScrollLayoutP33_47CE02453974CF9C45460F69EF777CFA13ContentLayout *)sub_1A6D53E2C();
}

- (void)update
{
  void *v2;
  _TtCC12PhotosUICore24ValueDrivingScrollLayoutP33_47CE02453974CF9C45460F69EF777CFA13ContentLayout *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtCC12PhotosUICore24ValueDrivingScrollLayoutP33_47CE02453974CF9C45460F69EF777CFA13ContentLayout_updater);
  if (v2)
  {
    v3 = self;
    objc_msgSend(v2, sel_updateIfNeeded);
    v4.receiver = v3;
    v4.super_class = (Class)type metadata accessor for ValueDrivingScrollLayout.ContentLayout();
    -[PXGLayout update](&v4, sel_update);

  }
  else
  {
    __break(1u);
  }
}

- (void)referenceSizeDidChange
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ValueDrivingScrollLayout.ContentLayout();
  v2 = (char *)v4.receiver;
  -[PXGLayout referenceSizeDidChange](&v4, sel_referenceSizeDidChange);
  v3 = *(void **)&v2[OBJC_IVAR____TtCC12PhotosUICore24ValueDrivingScrollLayoutP33_47CE02453974CF9C45460F69EF777CFA13ContentLayout_updater];
  if (v3)
  {
    objc_msgSend(v3, sel_setNeedsUpdateOf_, sel_updateContent, v4.receiver, v4.super_class);

  }
  else
  {
    __break(1u);
  }
}

- (void)visibleRectDidChange
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for ValueDrivingScrollLayout.ContentLayout();
  -[PXGLayout visibleRectDidChange](&v2, sel_visibleRectDidChange);
}

- (NSIndexSet)axSpriteIndexes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  uint64_t v8;

  v2 = sub_1A7ADCC0C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A7ADCC00();
  v6 = (void *)sub_1A7ADCB7C();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (NSIndexSet *)v6;
}

- (void)updateContent
{
  _TtCC12PhotosUICore24ValueDrivingScrollLayoutP33_47CE02453974CF9C45460F69EF777CFA13ContentLayout *v2;
  double v3;
  double v4;

  v2 = self;
  PXGLayout.configureSprites(_:)(sub_1A6D54368);
  -[PXGLayout referenceSize](v2, sel_referenceSize);
  v4 = v3
     * (double)*(uint64_t *)((char *)&v2->super.super.isa
                          + OBJC_IVAR____TtCC12PhotosUICore24ValueDrivingScrollLayoutP33_47CE02453974CF9C45460F69EF777CFA13ContentLayout_numberOfPages);
  -[PXGLayout referenceSize](v2, sel_referenceSize);
  -[PXGLayout setContentSize:](v2, sel_setContentSize_, v4);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC12PhotosUICore24ValueDrivingScrollLayoutP33_47CE02453974CF9C45460F69EF777CFA13ContentLayout_updater));
}

@end
