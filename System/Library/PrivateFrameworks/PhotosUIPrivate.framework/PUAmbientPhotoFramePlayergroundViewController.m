@implementation PUAmbientPhotoFramePlayergroundViewController

- (PUAmbientPhotoFramePlayergroundViewController)initWithPhotoLibrary:(id)a3
{
  return (PUAmbientPhotoFramePlayergroundViewController *)sub_1AAC92110(a3);
}

- (PUAmbientPhotoFramePlayergroundViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AAC92240();
}

- (void)viewDidLoad
{
  PUAmbientPhotoFramePlayergroundViewController *v2;

  v2 = self;
  sub_1AAC92340();

}

- (void)viewWillAppear:(BOOL)a3
{
  PUAmbientPhotoFramePlayergroundViewController *v3;

  v3 = self;
  sub_1AAC92410();

}

- (void)viewDidDisappear:(BOOL)a3
{
  PUAmbientPhotoFramePlayergroundViewController *v3;

  v3 = self;
  sub_1AAC924C0();

}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  return 1;
}

- (void)handleTap:(id)a3
{
  id v4;
  PUAmbientPhotoFramePlayergroundViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1AAC9283C(v4);

}

- (void)handleLongPress:(id)a3
{
  id v4;
  PUAmbientPhotoFramePlayergroundViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1AAC92934(v4);

}

- (PUAmbientPhotoFramePlayergroundViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1AB08D498();
  v5 = a4;
  sub_1AAC93DB0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PUAmbientPhotoFramePlayergroundViewController_photoLibrary));
  OUTLINED_FUNCTION_5_5(OBJC_IVAR___PUAmbientPhotoFramePlayergroundViewController____lazy_storage___renderer);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR___PUAmbientPhotoFramePlayergroundViewController____lazy_storage___photoFrameController);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR___PUAmbientPhotoFramePlayergroundViewController____lazy_storage___environment);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR___PUAmbientPhotoFramePlayergroundViewController_preferences);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR___PUAmbientPhotoFramePlayergroundViewController_backgroundView);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR___PUAmbientPhotoFramePlayergroundViewController_foregroundView);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PUAmbientPhotoFramePlayergroundViewController_floatingView));
}

@end
