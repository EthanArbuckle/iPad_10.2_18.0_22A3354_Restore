@implementation PaletteContainerView.ContainerView

- (void)didMoveToSuperview
{
  char *v2;
  void *Strong;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for PaletteContainerView.ContainerView();
  v2 = (char *)v4.receiver;
  -[PaletteContainerView.ContainerView didMoveToSuperview](&v4, "didMoveToSuperview");
  Strong = (void *)swift_unknownObjectWeakLoadStrong(&v2[OBJC_IVAR____TtCC16MusicApplication20PaletteContainerViewP33_88498BA0CEC5810DA94557FA99912F2413ContainerView_layoutDelegate]);
  objc_msgSend(Strong, "setNeedsLayout", v4.receiver, v4.super_class);

}

- (_TtCC16MusicApplication20PaletteContainerViewP33_88498BA0CEC5810DA94557FA99912F2413ContainerView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  swift_unknownObjectWeakInit((char *)self+ OBJC_IVAR____TtCC16MusicApplication20PaletteContainerViewP33_88498BA0CEC5810DA94557FA99912F2413ContainerView_layoutDelegate);
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for PaletteContainerView.ContainerView();
  return -[PaletteContainerView.ContainerView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtCC16MusicApplication20PaletteContainerViewP33_88498BA0CEC5810DA94557FA99912F2413ContainerView)initWithCoder:(id)a3
{
  id v5;
  _TtCC16MusicApplication20PaletteContainerViewP33_88498BA0CEC5810DA94557FA99912F2413ContainerView *v6;
  objc_super v8;

  swift_unknownObjectWeakInit((char *)self+ OBJC_IVAR____TtCC16MusicApplication20PaletteContainerViewP33_88498BA0CEC5810DA94557FA99912F2413ContainerView_layoutDelegate);
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PaletteContainerView.ContainerView();
  v5 = a3;
  v6 = -[PaletteContainerView.ContainerView initWithCoder:](&v8, "initWithCoder:", v5);

  return v6;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self+ OBJC_IVAR____TtCC16MusicApplication20PaletteContainerViewP33_88498BA0CEC5810DA94557FA99912F2413ContainerView_layoutDelegate);
}

@end
