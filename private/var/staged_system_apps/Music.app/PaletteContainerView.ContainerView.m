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
  Strong = (void *)swift_unknownObjectWeakLoadStrong(&v2[OBJC_IVAR____TtCC5Music20PaletteContainerViewP33_4102CA4C1991271B5A0CD003095D64DF13ContainerView_layoutDelegate]);
  objc_msgSend(Strong, "setNeedsLayout", v4.receiver, v4.super_class);

}

- (_TtCC5Music20PaletteContainerViewP33_4102CA4C1991271B5A0CD003095D64DF13ContainerView)initWithFrame:(CGRect)a3
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
  swift_unknownObjectWeakInit((char *)self+ OBJC_IVAR____TtCC5Music20PaletteContainerViewP33_4102CA4C1991271B5A0CD003095D64DF13ContainerView_layoutDelegate, 0);
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for PaletteContainerView.ContainerView();
  return -[PaletteContainerView.ContainerView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtCC5Music20PaletteContainerViewP33_4102CA4C1991271B5A0CD003095D64DF13ContainerView)initWithCoder:(id)a3
{
  objc_super v6;

  swift_unknownObjectWeakInit((char *)self+ OBJC_IVAR____TtCC5Music20PaletteContainerViewP33_4102CA4C1991271B5A0CD003095D64DF13ContainerView_layoutDelegate, 0);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PaletteContainerView.ContainerView();
  return -[PaletteContainerView.ContainerView initWithCoder:](&v6, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self+ OBJC_IVAR____TtCC5Music20PaletteContainerViewP33_4102CA4C1991271B5A0CD003095D64DF13ContainerView_layoutDelegate, a2);
}

@end
