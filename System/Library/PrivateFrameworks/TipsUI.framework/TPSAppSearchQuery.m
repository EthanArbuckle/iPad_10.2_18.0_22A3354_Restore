@implementation TPSAppSearchQuery

- (NSString)identifier
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_20CFCD0F4();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)searchTerm
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  TPSAppSearchQuery *v8;
  void *v9;
  uint64_t v11;

  v3 = sub_20CFCD04C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR___TPSAppSearchQuery__searchTerm;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
  v8 = self;
  sub_20CFCD034();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  v9 = (void *)sub_20CFCD0F4();
  swift_bridgeObjectRelease();
  return (NSString *)v9;
}

- (void)setSearchTerm:(id)a3
{
  TPSAppSearchQuery *v4;

  sub_20CFCD118();
  swift_beginAccess();
  v4 = self;
  sub_20CFCD040();
  swift_endAccess();

}

- (int64_t)origin
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___TPSAppSearchQuery_origin);
  swift_beginAccess();
  return *v2;
}

- (void)setOrigin:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___TPSAppSearchQuery_origin);
  swift_beginAccess();
  *v4 = a3;
}

- (TPSAppSearchQuery)initWithSearchTerm:(id)a3 origin:(int64_t)a4 identifier:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v7 = sub_20CFCD118();
  v9 = v8;
  if (a5)
  {
    v10 = sub_20CFCD118();
    v12 = v11;
  }
  else
  {
    v10 = 0;
    v12 = 0;
  }
  return (TPSAppSearchQuery *)TPSAppSearchQuery.init(searchTerm:origin:identifier:)(v7, v9, a4, v10, v12);
}

+ (id)queryWithSearchTerm:(id)a3 origin:(int64_t)a4
{
  uint64_t v5;
  uint64_t v6;
  id C04makeE04with6originACXDSS_AC6OriginOtFZ_0;

  v5 = sub_20CFCD118();
  C04makeE04with6originACXDSS_AC6OriginOtFZ_0 = _s6TipsUI17TPSAppSearchQueryC04makeE04with6originACXDSS_AC6OriginOtFZ_0(v5, v6, a4);
  swift_bridgeObjectRelease();
  return C04makeE04with6originACXDSS_AC6OriginOtFZ_0;
}

- (void)executeWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  TPSAppSearchQuery *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499DD80);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_20CFCD214();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_25499DD90;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_25499DDA0;
  v12[5] = v11;
  v13 = self;
  sub_20CF95948((uint64_t)v7, (uint64_t)&unk_25499DDB0, (uint64_t)v12);
  swift_release();
}

- (TPSAppSearchQuery)init
{
  TPSAppSearchQuery *result;

  result = (TPSAppSearchQuery *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___TPSAppSearchQuery__searchTerm;
  v4 = sub_20CFCD04C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
