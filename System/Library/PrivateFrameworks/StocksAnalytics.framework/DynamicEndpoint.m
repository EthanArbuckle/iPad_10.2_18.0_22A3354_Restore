@implementation DynamicEndpoint

- (NSString)name
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v13;

  v3 = sub_1DC62A3B0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1DC62A410();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(self->appConfigurationManager, *(_QWORD *)&self->appConfigurationManager[24]);
  swift_retain();
  sub_1DC62A464();
  sub_1DC62A32C();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_1DC62A404();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  swift_release();
  v11 = (void *)sub_1DC62B0DC();
  swift_bridgeObjectRelease();
  return (NSString *)v11;
}

- (NSURL)url
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  uint64_t v8;

  v2 = sub_1DC62A140();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  DynamicEndpoint.url.getter((uint64_t)v5);
  swift_release();
  v6 = (void *)sub_1DC62A128();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (NSURL *)v6;
}

- (NSString)sharedContainerIdentifier
{
  void *v2;

  sub_1DC62A524();
  swift_retain();
  sub_1DC62A518();
  sub_1DC62A50C();
  swift_release();
  swift_release();
  v2 = (void *)sub_1DC62B0DC();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

@end
