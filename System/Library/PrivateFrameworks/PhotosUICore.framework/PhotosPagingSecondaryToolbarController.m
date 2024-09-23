@implementation PhotosPagingSecondaryToolbarController

- (_TtC12PhotosUICore38PhotosPagingSecondaryToolbarController)initWithContainerView:(id)a3 styleGuideProvider:(id)a4
{
  id v5;

  v5 = a3;
  swift_unknownObjectRetain();
  return (_TtC12PhotosUICore38PhotosPagingSecondaryToolbarController *)sub_1A6D66018(v5, (uint64_t)a4);
}

- (void)isShowingGradientDidChange
{
  _QWORD *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t ObjectType;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for PhotosPagingSecondaryToolbarController();
  v2 = v7.receiver;
  v3 = -[PXSecondaryToolbarController isShowingGradientDidChange](&v7, sel_isShowingGradientDidChange);
  if ((*(uint64_t (**)(id))((*MEMORY[0x1E0DEEDD8] & *v2) + 0x80))(v3))
  {
    v5 = v4;
    ObjectType = swift_getObjectType();
    (*(void (**)(_QWORD *, uint64_t, uint64_t))(v5 + 24))(v2, ObjectType, v5);

    swift_unknownObjectRelease();
  }
  else
  {

  }
}

- (void)pageControlValueDidChange
{
  uint64_t (*v2)(void);
  uint64_t v3;
  uint64_t v4;
  uint64_t ObjectType;
  _TtC12PhotosUICore38PhotosPagingSecondaryToolbarController *v6;

  v2 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.super.isa) + 0x80);
  v6 = self;
  if (v2())
  {
    v4 = v3;
    ObjectType = swift_getObjectType();
    (*(void (**)(_TtC12PhotosUICore38PhotosPagingSecondaryToolbarController *, uint64_t, uint64_t))(v4 + 8))(v6, ObjectType, v4);

    swift_unknownObjectRelease();
  }
  else
  {

  }
}

- (void).cxx_destruct
{
  sub_1A688D368((uint64_t)self + OBJC_IVAR____TtC12PhotosUICore38PhotosPagingSecondaryToolbarController_delegate);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore38PhotosPagingSecondaryToolbarController_customCenterControl));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore38PhotosPagingSecondaryToolbarController_pageControl));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore38PhotosPagingSecondaryToolbarController_lensControl));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore38PhotosPagingSecondaryToolbarController_defaultCenterControl));
}

@end
