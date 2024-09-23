@implementation STAllActivityViewController

- (_TtC20ScreenTimeSettingsUI27STAllActivityViewController)initWithUserAltDSID:(id)a3 deviceIdentifier:(id)a4
{
  objc_class *ObjectType;
  _TtC20ScreenTimeSettingsUI27STAllActivityViewController *v8;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  if (!a3)
  {
    if (!a4)
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_219B99CF4();
  if (a4)
LABEL_3:
    sub_219B99CF4();
LABEL_5:
  sub_219B995C8();
  swift_allocObject();
  v8 = self;
  *(Class *)((char *)&v8->super.super.super.isa
           + OBJC_IVAR____TtC20ScreenTimeSettingsUI27STAllActivityViewController_bridge) = (Class)sub_219B995BC();

  v10.receiver = v8;
  v10.super_class = ObjectType;
  return -[STAllActivityViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0, 0);
}

- (_TtC20ScreenTimeSettingsUI27STAllActivityViewController)initWithCoder:(id)a3
{
  _TtC20ScreenTimeSettingsUI27STAllActivityViewController *result;

  result = (_TtC20ScreenTimeSettingsUI27STAllActivityViewController *)sub_219B99F94();
  __break(1u);
  return result;
}

- (void)updateWithUserAltDSID:(id)a3 deviceIdentifier:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _TtC20ScreenTimeSettingsUI27STAllActivityViewController *v11;
  uint64_t v12;
  uint64_t v13;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550AD5B8);
  MEMORY[0x24BDAC7A8](v7, v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a3)
  {
    if (!a4)
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_219B99CF4();
  if (a4)
LABEL_3:
    sub_219B99CF4();
LABEL_5:
  swift_bridgeObjectRetain();
  v11 = self;
  swift_bridgeObjectRetain();
  sub_219B99598();
  v12 = sub_219B995A4();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v10, 0, 1, v12);
  sub_219B995B0();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)viewDidLoad
{
  _TtC20ScreenTimeSettingsUI27STAllActivityViewController *v2;

  v2 = self;
  STAllActivityViewController.viewDidLoad()();

}

- (_TtC20ScreenTimeSettingsUI27STAllActivityViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC20ScreenTimeSettingsUI27STAllActivityViewController *result;

  v4 = a4;
  result = (_TtC20ScreenTimeSettingsUI27STAllActivityViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
