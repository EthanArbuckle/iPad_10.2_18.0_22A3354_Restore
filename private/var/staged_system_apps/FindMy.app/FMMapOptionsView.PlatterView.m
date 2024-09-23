@implementation FMMapOptionsView.PlatterView

- (_TtCC6FindMy16FMMapOptionsViewP33_4FBFA1E850653445CBAB4C80170F66AB11PlatterView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  uint64_t v9;
  id v10;
  _TtCC6FindMy16FMMapOptionsViewP33_4FBFA1E850653445CBAB4C80170F66AB11PlatterView *v11;
  uint64_t v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType(self);
  v9 = OBJC_IVAR____TtCC6FindMy16FMMapOptionsViewP33_4FBFA1E850653445CBAB4C80170F66AB11PlatterView_blurredBackground;
  v10 = objc_allocWithZone((Class)UIVisualEffectView);
  v11 = self;
  *(Class *)((char *)&self->super.super.super.isa + v9) = (Class)objc_msgSend(v10, "init");
  v12 = OBJC_IVAR____TtCC6FindMy16FMMapOptionsViewP33_4FBFA1E850653445CBAB4C80170F66AB11PlatterView_shadowView;
  *(Class *)((char *)&v11->super.super.super.isa + v12) = (Class)objc_msgSend(objc_allocWithZone((Class)UIView), "init");

  v14.receiver = v11;
  v14.super_class = ObjectType;
  return -[FMMapOptionsView.PlatterView initWithFrame:](&v14, "initWithFrame:", x, y, width, height);
}

- (_TtCC6FindMy16FMMapOptionsViewP33_4FBFA1E850653445CBAB4C80170F66AB11PlatterView)initWithCoder:(id)a3
{
  return (_TtCC6FindMy16FMMapOptionsViewP33_4FBFA1E850653445CBAB4C80170F66AB11PlatterView *)sub_100264600(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC6FindMy16FMMapOptionsViewP33_4FBFA1E850653445CBAB4C80170F66AB11PlatterView_blurredBackground));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC6FindMy16FMMapOptionsViewP33_4FBFA1E850653445CBAB4C80170F66AB11PlatterView_shadowView));
}

@end
