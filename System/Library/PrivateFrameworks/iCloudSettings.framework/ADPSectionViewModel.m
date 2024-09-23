@implementation ADPSectionViewModel

- (_TtC14iCloudSettings19ADPSectionViewModel)init
{
  _TtC14iCloudSettings19ADPSectionViewModel *result;

  result = (_TtC14iCloudSettings19ADPSectionViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14iCloudSettings19ADPSectionViewModel__navigationController));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14iCloudSettings19ADPSectionViewModel__grandSlamPresenter));

  sub_24B511914((uint64_t)self + OBJC_IVAR____TtC14iCloudSettings19ADPSectionViewModel__adpLearnMoreURL, &qword_2544D8D30);
  v3 = (char *)self + OBJC_IVAR____TtC14iCloudSettings19ADPSectionViewModel___observationRegistrar;
  v4 = sub_24B5E30B4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (void)beginEnablementFlow:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _TtC14iCloudSettings19ADPSectionViewModel *v18;
  uint64_t v19;
  unint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544D8D80);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544D8D30);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v23 - v13;
  if (a3)
  {
    sub_24B5E2FC4();
    v15 = sub_24B5E2FF4();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v14, 0, 1, v15);
  }
  else
  {
    v16 = sub_24B5E2FF4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v14, 1, 1, v16);
  }
  v17 = sub_24B5E4464();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v7, 1, 1, v17);
  sub_24B4F5AF4((uint64_t)v14, (uint64_t)v12, &qword_2544D8D30);
  sub_24B5E4428();
  v18 = self;
  v19 = sub_24B5E441C();
  v20 = (*(unsigned __int8 *)(v9 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v21 = (_QWORD *)swift_allocObject();
  v22 = MEMORY[0x24BEE6930];
  v21[2] = v19;
  v21[3] = v22;
  v21[4] = v18;
  sub_24B4F5BE0((uint64_t)v12, (uint64_t)v21 + v20, &qword_2544D8D30);
  sub_24B500D48((uint64_t)v7, (uint64_t)&unk_25799B1B0, (uint64_t)v21);

  swift_release();
  sub_24B511914((uint64_t)v14, &qword_2544D8D30);
}

- (void)setDelegate:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _TtC14iCloudSettings19ADPSectionViewModel *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544D8D80);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_24B5E4464();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  sub_24B5E4428();
  swift_unknownObjectRetain_n();
  v9 = self;
  v10 = sub_24B5E441C();
  v11 = (_QWORD *)swift_allocObject();
  v12 = MEMORY[0x24BEE6930];
  v11[2] = v10;
  v11[3] = v12;
  v11[4] = v9;
  v11[5] = a3;
  sub_24B500D48((uint64_t)v7, (uint64_t)&unk_25799B1A8, (uint64_t)v11);
  swift_unknownObjectRelease();

  swift_release();
}

- (void)presentAccountRecoveryFlow
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _TtC14iCloudSettings19ADPSectionViewModel *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544D8D80);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_24B5E4464();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  sub_24B5E4428();
  v7 = self;
  v8 = sub_24B5E441C();
  v9 = (_QWORD *)swift_allocObject();
  v10 = MEMORY[0x24BEE6930];
  v9[2] = v8;
  v9[3] = v10;
  v9[4] = v7;
  sub_24B500D48((uint64_t)v5, (uint64_t)&unk_25799B1A0, (uint64_t)v9);

  swift_release();
}

- (void)remoteUIRequestComplete:(id)a3 error:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  _TtC14iCloudSettings19ADPSectionViewModel *v14;
  id v15;
  _TtC14iCloudSettings19ADPSectionViewModel *v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544D8D80);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_24B5E2EB0();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24B5E2E74();
  v13 = sub_24B5E4464();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v8, 1, 1, v13);
  sub_24B5E4428();
  v14 = self;
  v15 = a4;
  v16 = v14;
  v17 = sub_24B5E441C();
  v18 = (_QWORD *)swift_allocObject();
  v19 = MEMORY[0x24BEE6930];
  v18[2] = v17;
  v18[3] = v19;
  v18[4] = a4;
  v18[5] = v16;
  sub_24B500D48((uint64_t)v8, (uint64_t)&unk_25799B198, (uint64_t)v18);

  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)remoteUIDidReceiveHTTPResponse:(id)a3
{
  objc_class *v4;
  NSURLResponseInternal *internal;
  NSHTTPURLResponse v6;

  v4 = (objc_class *)a3;
  v6.super._internal = (NSURLResponseInternal *)self;
  internal = v6.super._internal;
  v6.super.super.isa = v4;
  ADPSectionViewModel.remoteUIDidReceiveHTTPResponse(_:)(v6);

}

- (void)remoteUIDidDismiss:(id)a3
{
  id v4;
  _TtC14iCloudSettings19ADPSectionViewModel *v5;

  v4 = a3;
  v5 = self;
  _s14iCloudSettings19ADPSectionViewModelC18remoteUIDidDismissyySo18RemoteUIControllerCF_0();

}

@end
