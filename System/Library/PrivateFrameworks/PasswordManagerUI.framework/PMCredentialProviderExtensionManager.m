@implementation PMCredentialProviderExtensionManager

- (_TtC17PasswordManagerUI36PMCredentialProviderExtensionManager)init
{
  return (_TtC17PasswordManagerUI36PMCredentialProviderExtensionManager *)sub_24367E2E4();
}

- (void)credentialProviderExtensionManagerExtensionListDidChange:(id)a3
{
  _TtC17PasswordManagerUI36PMCredentialProviderExtensionManager *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_24367E438(v5);

}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC17PasswordManagerUI36PMCredentialProviderExtensionManager__extensions;
  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2572B97E0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
