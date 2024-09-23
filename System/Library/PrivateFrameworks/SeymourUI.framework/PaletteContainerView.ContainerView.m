@implementation PaletteContainerView.ContainerView

- (void)didMoveToSuperview
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for PaletteContainerView.ContainerView();
  v2 = (char *)v4.receiver;
  -[PaletteContainerView.ContainerView didMoveToSuperview](&v4, sel_didMoveToSuperview);
  v3 = (void *)MEMORY[0x22E2F3FFC](&v2[OBJC_IVAR____TtCC9SeymourUI20PaletteContainerViewP33_CD8D19E118B7B4A87B690718073E587E13ContainerView_layoutDelegate]);
  objc_msgSend(v3, sel_setNeedsLayout, v4.receiver, v4.super_class);

}

- (_TtCC9SeymourUI20PaletteContainerViewP33_CD8D19E118B7B4A87B690718073E587E13ContainerView)initWithFrame:(CGRect)a3
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
  swift_unknownObjectWeakInit();
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for PaletteContainerView.ContainerView();
  return -[PaletteContainerView.ContainerView initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
}

- (_TtCC9SeymourUI20PaletteContainerViewP33_CD8D19E118B7B4A87B690718073E587E13ContainerView)initWithCoder:(id)a3
{
  objc_super v6;

  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PaletteContainerView.ContainerView();
  return -[PaletteContainerView.ContainerView initWithCoder:](&v6, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

@end
