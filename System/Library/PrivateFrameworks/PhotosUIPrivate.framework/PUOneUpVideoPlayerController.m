@implementation PUOneUpVideoPlayerController

- (PUOneUpVideoPlayerController)init
{
  return (PUOneUpVideoPlayerController *)OneUpVideoPlayerController.init()();
}

- (PUBrowsingVideoPlayer)player
{
  id v2;

  sub_1AAC114BC();
  return (PUBrowsingVideoPlayer *)v2;
}

- (void)setPlayer:(id)a3
{
  id v5;
  PUOneUpVideoPlayerController *v6;

  v5 = a3;
  v6 = self;
  sub_1AAC11540(a3);

}

- (PUOneUpVideoPlayerControllerDelegate)delegate
{
  id v2;

  sub_1AAC116A4();
  return (PUOneUpVideoPlayerControllerDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  PUOneUpVideoPlayerController *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1AAC11728();

}

- (void).cxx_destruct
{

  sub_1AAB8CAB0((uint64_t)self + OBJC_IVAR___PUOneUpVideoPlayerController_delegate);
  sub_1AAC11C68((uint64_t)self + OBJC_IVAR___PUOneUpVideoPlayerController_oneUpState);
}

- (void)updateWithBrowsingViewModel:(id)a3
{
  id v4;
  PUOneUpVideoPlayerController *v5;

  v4 = a3;
  v5 = self;
  sub_1AAC130D4(v4);

}

@end
