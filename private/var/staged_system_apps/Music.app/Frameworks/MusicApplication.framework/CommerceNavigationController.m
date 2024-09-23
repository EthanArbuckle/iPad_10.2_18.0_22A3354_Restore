@implementation CommerceNavigationController

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  void (*v5)(char *, __n128);
  uint64_t v6;
  __n128 v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CommerceNavigationController();
  v4 = (char *)v8.receiver;
  -[CommerceNavigationController viewDidDisappear:](&v8, "viewDidDisappear:", v3);
  v5 = *(void (**)(char *, __n128))&v4[OBJC_IVAR____TtC16MusicApplicationP33_ACDED154BD7D27D1EDCE9CE66AA9990C28CommerceNavigationController_dismissCallback];
  if (v5)
  {
    v6 = *(_QWORD *)&v4[OBJC_IVAR____TtC16MusicApplicationP33_ACDED154BD7D27D1EDCE9CE66AA9990C28CommerceNavigationController_dismissCallback
                      + 8];
    v7 = swift_retain(v6);
    v5(v4, v7);
    sub_5C198((uint64_t)v5, v6);
  }

}

- (_TtC16MusicApplicationP33_ACDED154BD7D27D1EDCE9CE66AA9990C28CommerceNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  _QWORD *v7;
  objc_class *v8;
  objc_super v10;

  v7 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplicationP33_ACDED154BD7D27D1EDCE9CE66AA9990C28CommerceNavigationController_dismissCallback);
  v8 = (objc_class *)type metadata accessor for CommerceNavigationController();
  *v7 = 0;
  v7[1] = 0;
  v10.receiver = self;
  v10.super_class = v8;
  return -[NavigationController initWithNavigationBarClass:toolbarClass:](&v10, "initWithNavigationBarClass:toolbarClass:", a3, a4);
}

- (_TtC16MusicApplicationP33_ACDED154BD7D27D1EDCE9CE66AA9990C28CommerceNavigationController)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC16MusicApplicationP33_ACDED154BD7D27D1EDCE9CE66AA9990C28CommerceNavigationController *v6;
  objc_super v8;

  v4 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplicationP33_ACDED154BD7D27D1EDCE9CE66AA9990C28CommerceNavigationController_dismissCallback);
  *v4 = 0;
  v4[1] = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CommerceNavigationController();
  v5 = a3;
  v6 = -[NavigationController initWithCoder:](&v8, "initWithCoder:", v5);

  return v6;
}

- (void).cxx_destruct
{
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplicationP33_ACDED154BD7D27D1EDCE9CE66AA9990C28CommerceNavigationController_dismissCallback), *(_QWORD *)&self->super.onWillShowViewController[OBJC_IVAR____TtC16MusicApplicationP33_ACDED154BD7D27D1EDCE9CE66AA9990C28CommerceNavigationController_dismissCallback]);
}

@end
