@implementation LemonadePhotosChallengeItemListManager

- (void)navigateToGadget:(id)a3
{
  void *v5;
  _TtC12PhotosUICore38LemonadePhotosChallengeItemListManager *v6;
  id v7;
  id v8;

  v5 = (void *)objc_opt_self();
  swift_unknownObjectRetain();
  v6 = self;
  v7 = objc_msgSend(v5, sel_defaultCenter);
  v8 = v7;
  if (qword_1EE929280 != -1)
  {
    swift_once();
    v7 = v8;
  }
  objc_msgSend(v7, sel_postNotificationName_object_, qword_1EE9983D0, a3);
  swift_unknownObjectRelease();

}

- (void)invalidateGadgets
{
  _TtC12PhotosUICore38LemonadePhotosChallengeItemListManager *v2;

  v2 = self;
  sub_1A71DDD30();

}

- (_TtC12PhotosUICore38LemonadePhotosChallengeItemListManager)init
{
  _TtC12PhotosUICore38LemonadePhotosChallengeItemListManager *result;

  result = (_TtC12PhotosUICore38LemonadePhotosChallengeItemListManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore38LemonadePhotosChallengeItemListManager_gadgetProvider));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore38LemonadePhotosChallengeItemListManager_horizontalGadgetProvider));
}

@end
