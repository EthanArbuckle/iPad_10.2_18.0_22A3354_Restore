@implementation PUWallpaperShuffleConfigurationViewController

- (_TtP15PhotosUIPrivate53PUWallpaperShuffleConfigurationViewControllerDelegate_)delegate
{
  sub_1AAB8A360();
}

- (void)setDelegate:(id)a3
{
  _TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1AAB8A3BC();

}

- (_TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController)initWithPhotoLibrary:(id)a3 style:(int64_t)a4 posterConfiguration:(id)a5 centerMedia:(id)a6 contentMode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  return (_TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController *)sub_1AAB8A450(v11, a4, a5, a6, a7);
}

- (_TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController)initWithPhotoLibrary:(id)a3 style:(int64_t)a4 posterConfiguration:(id)a5 centerMedia:(id)a6
{
  id v9;
  id v10;
  id v11;
  _TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController *result;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  sub_1AAB8A5E4(v9, a4, a5, a6);
  return result;
}

- (_TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController)initWithPhotoLibrary:(id)a3 style:(int64_t)a4
{
  _TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController *result;

  sub_1AAB8A6A0((uint64_t)a3, a4);
  return result;
}

- (_TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController)initWithPhotoLibrary:(id)a3
{
  _TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController *result;

  sub_1AAB8A704((uint64_t)a3);
  return result;
}

- (_TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AAB8A760();
}

- (void)viewDidLoad
{
  _TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController *v2;

  v2 = self;
  sub_1AAB8A7E8();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController *v4;

  v4 = self;
  sub_1AAB8ACB0(a3);

}

- (void)didFailFinishingWithPosterConfiguration
{
  _TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController *v2;

  v2 = self;
  sub_1AAB8AD94();

}

- (_TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1AB08D498();
  v5 = a4;
  PUWallpaperShuffleConfigurationViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController_viewModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController_manualSelectionPhotoPicker));
  sub_1AAB8CAB0((uint64_t)self + OBJC_IVAR____TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController____lazy_storage___contentViewController));
}

- (void)presentationControllerWillDismiss:(id)a3
{
  UIPresentationController *v4;
  _TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController *v5;

  v4 = (UIPresentationController *)a3;
  v5 = self;
  PUWallpaperShuffleConfigurationViewController.presentationControllerWillDismiss(_:)(v4);

}

@end
