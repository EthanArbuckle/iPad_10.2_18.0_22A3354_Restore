@implementation TTRIRemindersListDescriptionAndTagsView

- (_TtC15RemindersUICore39TTRIRemindersListDescriptionAndTagsView)init
{
  return (_TtC15RemindersUICore39TTRIRemindersListDescriptionAndTagsView *)TTRIRemindersListDescriptionAndTagsView.init()();
}

- (_TtC15RemindersUICore39TTRIRemindersListDescriptionAndTagsView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s15RemindersUICore39TTRIRemindersListDescriptionAndTagsViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)invalidateInternalStateForInvalidation:(int64_t)a3
{
  id v4;
  uint64_t v5;
  _BYTE v6[152];
  _BYTE v7[152];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  v4 = v8.receiver;
  -[TTRIRemindersListDescriptionAndTagsView invalidateInternalStateForInvalidation:](&v8, sel_invalidateInternalStateForInvalidation_, a3);
  if (a3 > 1)
  {
    sub_1B41DF4EC((uint64_t)v6);
    v5 = (uint64_t)v4 + OBJC_IVAR____TtC15RemindersUICore39TTRIRemindersListDescriptionAndTagsView_cachedLayoutInfo;
    sub_1B41DF5E4((uint64_t)v4 + OBJC_IVAR____TtC15RemindersUICore39TTRIRemindersListDescriptionAndTagsView_cachedLayoutInfo, (uint64_t)v7, &qword_1ED4E53F0);
    sub_1B41DF5E4((uint64_t)v6, v5, &qword_1ED4E53F0);
    sub_1B4554C78((uint64_t)v7);
  }

}

- (BOOL)isLayoutSizeDependentOnPerpendicularAxis
{
  return 1;
}

- (CGSize)calculateArrangedSizeFittingSize:(CGSize)a3
{
  double width;
  _TtC15RemindersUICore39TTRIRemindersListDescriptionAndTagsView *v4;
  double v5;
  double v6;
  _BYTE v7[136];
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  v4 = self;
  sub_1B4551654((uint64_t)v7, width);
  sub_1B4554C78((uint64_t)v7);

  v5 = v8;
  v6 = v9;
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)layoutArrangedSubviewsInBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _TtC15RemindersUICore39TTRIRemindersListDescriptionAndTagsView *v7;
  __C::CGRect v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8.origin.x = x;
  v8.origin.y = y;
  v8.size.width = width;
  v8.size.height = height;
  TTRIRemindersListDescriptionAndTagsView.layoutArrangedSubviews(inBounds:)(v8);

}

- (_TtC15RemindersUICore39TTRIRemindersListDescriptionAndTagsView)initWithFrame:(CGRect)a3
{
  _TtC15RemindersUICore39TTRIRemindersListDescriptionAndTagsView *result;

  result = (_TtC15RemindersUICore39TTRIRemindersListDescriptionAndTagsView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15RemindersUICore39TTRIRemindersListDescriptionAndTagsView)initWithArrangedSubviews:(id)a3
{
  _TtC15RemindersUICore39TTRIRemindersListDescriptionAndTagsView *result;

  result = (_TtC15RemindersUICore39TTRIRemindersListDescriptionAndTagsView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _BYTE v3[152];

  sub_1B41F4748((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore39TTRIRemindersListDescriptionAndTagsView_hashtagsTextViewDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore39TTRIRemindersListDescriptionAndTagsView_hashtagsTextView));
  sub_1B44F07B0(*(void **)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC15RemindersUICore39TTRIRemindersListDescriptionAndTagsView_subtaskButtonConfiguration), *(void **)((char *)&self->super.super.super._responderFlags+ OBJC_IVAR____TtC15RemindersUICore39TTRIRemindersListDescriptionAndTagsView_subtaskButtonConfiguration), *(void **)((char *)&self->super.super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC15RemindersUICore39TTRIRemindersListDescriptionAndTagsView_subtaskButtonConfiguration), *(uint64_t *)((char *)&self->super.super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC15RemindersUICore39TTRIRemindersListDescriptionAndTagsView_subtaskButtonConfiguration));
  sub_1B41DF5E4((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore39TTRIRemindersListDescriptionAndTagsView_cachedLayoutInfo, (uint64_t)v3, &qword_1ED4E53F0);
  sub_1B4554C78((uint64_t)v3);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore39TTRIRemindersListDescriptionAndTagsView_descriptionTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore39TTRIRemindersListDescriptionAndTagsView_subtaskButton));
  swift_bridgeObjectRelease();
  sub_1B45417FC(*(void **)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC15RemindersUICore39TTRIRemindersListDescriptionAndTagsView____lazy_storage___measurementWrapper), *(void **)((char *)&self->super.super.super._responderFlags+ OBJC_IVAR____TtC15RemindersUICore39TTRIRemindersListDescriptionAndTagsView____lazy_storage___measurementWrapper), *(void **)((char *)&self->super.super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC15RemindersUICore39TTRIRemindersListDescriptionAndTagsView____lazy_storage___measurementWrapper));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore39TTRIRemindersListDescriptionAndTagsView_unsupportedTextDropHandler));
}

@end
