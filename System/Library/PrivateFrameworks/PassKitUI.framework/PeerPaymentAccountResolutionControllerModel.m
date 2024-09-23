@implementation PeerPaymentAccountResolutionControllerModel

- (void)peerPaymentAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  id v16;
  id v17;
  _TtC9PassKitUI43PeerPaymentAccountResolutionControllerModel *v18;
  uint64_t v19;
  _TtC9PassKitUI43PeerPaymentAccountResolutionControllerModel *v20;
  uint64_t v21;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE4A88E0);
  v10 = MEMORY[0x1E0C80A78](v8, v9);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10, v13);
  v15 = (char *)&v21 - v14;
  if (a4)
  {
    v16 = a4;
    v17 = a3;
    v18 = self;
    sub_19DE83AFC();
    v19 = type metadata accessor for WrapperViewController();
    *(_QWORD *)&v15[*(int *)(v19 + 20)] = v16;
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v15, 0, 1, v19);
    swift_getKeyPath();
    swift_getKeyPath();
    sub_19D5484C4((uint64_t)v15, (uint64_t)v12);
    v20 = v18;
    sub_19DE85260();
    sub_19D54850C((uint64_t)v15);

  }
  else
  {
    __break(1u);
  }
}

- (void)peerPaymentAccountResolutionController:(id)a3 requestsDismissCurrentViewControllerAnimated:(BOOL)a4
{
  id v5;
  _TtC9PassKitUI43PeerPaymentAccountResolutionControllerModel *v6;

  v5 = a3;
  v6 = self;
  sub_19D54854C();

}

- (_TtC9PassKitUI43PeerPaymentAccountResolutionControllerModel)init
{
  return (_TtC9PassKitUI43PeerPaymentAccountResolutionControllerModel *)sub_19D547EA4();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self + OBJC_IVAR____TtC9PassKitUI43PeerPaymentAccountResolutionControllerModel__currentView;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE4A88E8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC9PassKitUI43PeerPaymentAccountResolutionControllerModel__loading;
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE494370);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  sub_19D1A9F60(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC9PassKitUI43PeerPaymentAccountResolutionControllerModel_updateAccountAction));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI43PeerPaymentAccountResolutionControllerModel_account));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI43PeerPaymentAccountResolutionControllerModel_resolutionController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI43PeerPaymentAccountResolutionControllerModel_webService));
}

@end
