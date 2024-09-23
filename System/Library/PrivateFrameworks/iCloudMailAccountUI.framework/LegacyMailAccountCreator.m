@implementation LegacyMailAccountCreator

- (_TtC19iCloudMailAccountUI24LegacyMailAccountCreator)init
{
  _TtC19iCloudMailAccountUI24LegacyMailAccountCreator *result;

  result = (_TtC19iCloudMailAccountUI24LegacyMailAccountCreator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_presenter));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_appleAccount));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_accountStore));
  sub_24B480AF4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_completionHandler));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator____lazy_storage___navigationController));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator____lazy_storage___ruiLoader));
}

- (void)loader:(id)a3 didReceiveHTTPResponse:(id)a4 forRequest:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  _TtC19iCloudMailAccountUI24LegacyMailAccountCreator *v16;
  uint64_t v17;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991E78);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    sub_24B4AD3C8();
    v12 = sub_24B4AD3EC();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    v13 = sub_24B4AD3EC();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  v14 = a3;
  v15 = a4;
  v16 = self;
  sub_24B4A9954(a4, (uint64_t)v11);

  sub_24B480884((uint64_t)v11, &qword_257991E78);
}

- (id)sessionConfigurationForLoader:(id)a3
{
  void *v5;
  id v6;
  _TtC19iCloudMailAccountUI24LegacyMailAccountCreator *v7;
  id v8;
  id v9;

  v5 = (void *)objc_opt_self();
  v6 = a3;
  v7 = self;
  v8 = objc_msgSend(v5, sel_defaultSessionConfiguration);
  v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0ACD8]), sel_init);
  objc_msgSend(v8, sel_set_appleIDContext_, v9);

  return v8;
}

- (void)loader:(id)a3 receivedObjectModel:(id)a4 topActionSignal:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC19iCloudMailAccountUI24LegacyMailAccountCreator *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_24B4A9EE4(a4, a5);

}

- (int64_t)supportedInterfaceOrientationsForObjectModel:(id)a3 page:(id)a4
{
  return 30;
}

- (void)objectModel:(id)a3 pressedLink:(id)a4 httpMethod:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  _TtC19iCloudMailAccountUI24LegacyMailAccountCreator *v17;
  uint64_t v18;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991E70);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    sub_24B4AD4A0();
    v12 = sub_24B4AD4C4();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    v13 = sub_24B4AD4C4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  if (a5)
  {
    v14 = sub_24B4ADD28();
    a5 = v15;
  }
  else
  {
    v14 = 0;
  }
  v16 = a3;
  v17 = self;
  sub_24B4A9208(a3, (uint64_t)v11, v14, (uint64_t)a5);

  swift_bridgeObjectRelease();
  sub_24B480884((uint64_t)v11, &qword_257991E70);
}

- (void)objectModel:(id)a3 pressedButton:(id)a4 attributes:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtC19iCloudMailAccountUI24LegacyMailAccountCreator *v12;

  if (!a4)
  {
    v8 = 0;
    v10 = 0;
    if (!a5)
      goto LABEL_4;
    goto LABEL_3;
  }
  v8 = sub_24B4ADD28();
  v10 = v9;
  if (a5)
LABEL_3:
    sub_24B4ADCF8();
LABEL_4:
  v11 = a3;
  v12 = self;
  sub_24B4AA4DC(v8, v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (id)parentViewControllerForObjectModel:(id)a3
{
  id v4;
  _TtC19iCloudMailAccountUI24LegacyMailAccountCreator *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_24B4A66FC();

  return v6;
}

@end
