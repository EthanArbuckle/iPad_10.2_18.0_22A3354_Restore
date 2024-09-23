@implementation AddBeneficiaryModel

- (void)nextViewControllerWithCompletion:(id)a3
{
  void *v4;
  void (*v5)(uint64_t, uint64_t);
  _TtC9PassKitUI19AddBeneficiaryModel *v6;

  v4 = _Block_copy(a3);
  if (v4)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v4;
    v5 = sub_19D2CF484;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  sub_19D8EC210((uint64_t (*)(_QWORD, _QWORD))v5);
  sub_19D1A9F60((uint64_t)v5);

}

- (_TtC9PassKitUI19AddBeneficiaryModel)init
{
  _TtC9PassKitUI19AddBeneficiaryModel *result;

  result = (_TtC9PassKitUI19AddBeneficiaryModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_19D1A9F60(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI19AddBeneficiaryModel__onSubmission));

  v3 = (char *)self + OBJC_IVAR____TtC9PassKitUI19AddBeneficiaryModel___observationRegistrar;
  v4 = sub_19DE83EC8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
