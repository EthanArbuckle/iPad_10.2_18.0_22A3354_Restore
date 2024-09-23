@implementation VolumeController.Delegate

- (void)volumeController:(id)a3 volumeControlAvailableDidChange:(BOOL)a4
{
  uint64_t Strong;
  uint64_t v7;
  uint64_t KeyPath;
  unint64_t v9;
  id v10;
  _TtCC5Music16VolumeControllerP33_E7E28279A551A35ED3C988571B98BE8D8Delegate *v11;
  uint64_t v12;

  Strong = swift_weakLoadStrong((char *)self + OBJC_IVAR____TtCC5Music16VolumeControllerP33_E7E28279A551A35ED3C988571B98BE8D8Delegate_owner);
  if (Strong)
  {
    v7 = Strong;
    KeyPath = swift_getKeyPath(&unk_100EB2760);
    v12 = v7;
    v9 = sub_1002A767C();
    v10 = a3;
    v11 = self;
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v12, KeyPath, UIScreen.Dimensions.size.getter, 0, (char *)&type metadata for () + 8, v9);

    swift_release();
    swift_release();
  }
}

- (void)volumeController:(id)a3 volumeValueDidChange:(float)a4
{
  id v5;
  _TtCC5Music16VolumeControllerP33_E7E28279A551A35ED3C988571B98BE8D8Delegate *v6;

  v5 = a3;
  v6 = self;
  sub_1002A77E4();

}

- (void)volumeController:(id)a3 mutedStateDidChange:(BOOL)a4
{
  uint64_t Strong;
  uint64_t v7;
  uint64_t KeyPath;
  unint64_t v9;
  id v10;
  _TtCC5Music16VolumeControllerP33_E7E28279A551A35ED3C988571B98BE8D8Delegate *v11;
  uint64_t v12;

  Strong = swift_weakLoadStrong((char *)self + OBJC_IVAR____TtCC5Music16VolumeControllerP33_E7E28279A551A35ED3C988571B98BE8D8Delegate_owner);
  if (Strong)
  {
    v7 = Strong;
    KeyPath = swift_getKeyPath(&unk_100EB26E8);
    v12 = v7;
    v9 = sub_1002A767C();
    v10 = a3;
    v11 = self;
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v12, KeyPath, UIScreen.Dimensions.size.getter, 0, (char *)&type metadata for () + 8, v9);

    swift_release();
    swift_release();
  }
}

- (_TtCC5Music16VolumeControllerP33_E7E28279A551A35ED3C988571B98BE8D8Delegate)init
{
  objc_super v4;

  swift_weakInit((char *)self + OBJC_IVAR____TtCC5Music16VolumeControllerP33_E7E28279A551A35ED3C988571B98BE8D8Delegate_owner, 0);
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for VolumeController.Delegate();
  return -[VolumeController.Delegate init](&v4, "init");
}

- (void).cxx_destruct
{
  swift_weakDestroy((char *)self + OBJC_IVAR____TtCC5Music16VolumeControllerP33_E7E28279A551A35ED3C988571B98BE8D8Delegate_owner);
}

@end
