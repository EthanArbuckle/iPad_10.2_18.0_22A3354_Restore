@implementation PMConfigureCredentialProviderExtensionView.Coordinator

- (_TtCV17PasswordManagerUI42PMConfigureCredentialProviderExtensionView11Coordinator)init
{
  objc_class *ObjectType;
  _QWORD *v4;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCV17PasswordManagerUI42PMConfigureCredentialProviderExtensionView11Coordinator_onDismiss);
  *v4 = 0;
  v4[1] = 0;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return -[PMConfigureCredentialProviderExtensionView.Coordinator init](&v6, sel_init);
}

- (void)credentialProviderExtensionConfigurationViewControllerDidFinish:(_ASCredentialProviderExtensionConfigurationViewController *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _ASCredentialProviderExtensionConfigurationViewController *v15;
  _TtCV17PasswordManagerUI42PMConfigureCredentialProviderExtensionView11Coordinator *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572B59C0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_2438504A4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2572B9220;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2572B9228;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_24368DF4C((uint64_t)v9, (uint64_t)&unk_2572B9230, (uint64_t)v14);
  swift_release();
}

- (void).cxx_destruct
{
  sub_243533728(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCV17PasswordManagerUI42PMConfigureCredentialProviderExtensionView11Coordinator_onDismiss));
}

@end
