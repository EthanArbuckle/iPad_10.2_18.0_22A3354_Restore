@implementation AccountPromotionViewModel

- (void)dealloc
{
  void *v3;
  _TtC9PassKitUI25AccountPromotionViewModel *v4;
  objc_super v5;

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI25AccountPromotionViewModel_linkedApplication);
  if (v3)
    objc_msgSend(v3, sel_removeObserver_, self);
  else
    v4 = self;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AccountPromotionViewModel();
  -[AccountPromotionViewModel dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC9PassKitUI25AccountPromotionViewModel__appStoreButtonTitle;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE4A1D48);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (_TtC9PassKitUI25AccountPromotionViewModel)init
{
  _TtC9PassKitUI25AccountPromotionViewModel *result;

  result = (_TtC9PassKitUI25AccountPromotionViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)linkedApplicationDidChangeState:(id)a3
{
  id v4;
  _TtC9PassKitUI25AccountPromotionViewModel *v5;

  v4 = a3;
  v5 = self;
  sub_19D405914();

}

@end
