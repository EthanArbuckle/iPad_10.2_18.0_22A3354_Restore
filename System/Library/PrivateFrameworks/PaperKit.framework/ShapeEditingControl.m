@implementation ShapeEditingControl

- (_TtC8PaperKit19ShapeEditingControl)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized ShapeEditingControl.init(coder:)();
}

- (BOOL)isUserInteractionEnabled
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[ShapeEditingControl isUserInteractionEnabled](&v3, sel_isUserInteractionEnabled);
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  _TtC8PaperKit19ShapeEditingControl *v4;

  v4 = self;
  ShapeEditingControl.isUserInteractionEnabled.setter(a3);

}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  id v4;
  _TtC8PaperKit19ShapeEditingControl *v5;
  id v6;
  uint64_t v7;
  int64_t v8;

  v4 = a3;
  v5 = self;
  v6 = objc_msgSend(v4, sel_presentedViewController);
  objc_opt_self();
  v7 = swift_dynamicCastObjCClass();

  if (v7)
    v8 = -2;
  else
    v8 = -1;

  return v8;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  id v6;
  id v7;
  _TtC8PaperKit19ShapeEditingControl *v8;
  id v9;
  uint64_t v10;
  int64_t v11;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = objc_msgSend(v6, sel_presentedViewController);
  objc_opt_self();
  v10 = swift_dynamicCastObjCClass();

  if (v10)
    v11 = -2;
  else
    v11 = -1;

  return v11;
}

- (_TtC8PaperKit19ShapeEditingControl)initWithFrame:(CGRect)a3
{
  @objc ShapeStyleEditingView.init(frame:)();
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit19ShapeEditingControl_nonDynamicButtonBackgroundColor));
}

@end
