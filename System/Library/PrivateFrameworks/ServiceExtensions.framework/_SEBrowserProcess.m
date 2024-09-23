@implementation _SEBrowserProcess

+ ($115C4C562B26FF47E01F9F4EA65B5887)_currentAuditToken
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  unsigned int v9;
  unint64_t v10;
  unsigned int v11;
  unint64_t v12;
  unsigned int v13;
  unint64_t v14;
  unsigned int v15;
  unint64_t v16;
  unint64_t v17;
  $115C4C562B26FF47E01F9F4EA65B5887 *result;
  unsigned int v19;
  unsigned int v20;
  unint64_t v21;
  unint64_t v22;

  v4 = sub_245DC4B98();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_245DC4B8C();
  v8 = sub_245DC4B80();
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = HIDWORD(v8);
  v17 = HIDWORD(v10);
  v21 = HIDWORD(v12);
  v22 = HIDWORD(v14);
  result = ($115C4C562B26FF47E01F9F4EA65B5887 *)(*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  retstr->var0[0] = v9;
  retstr->var0[1] = v16;
  retstr->var0[2] = v11;
  retstr->var0[3] = v17;
  v19 = v21;
  retstr->var0[4] = v13;
  retstr->var0[5] = v19;
  v20 = v22;
  retstr->var0[6] = v15;
  retstr->var0[7] = v20;
  return result;
}

- (_SEBrowserProcess)init
{
  _SEBrowserProcess *result;

  result = (_SEBrowserProcess *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_245DB1E18((uint64_t)self + OBJC_IVAR____SEBrowserProcess_inner, type metadata accessor for _BrowserProcess);
}

+ (BOOL)checkBrowserEngineEntitlementForCurrentProcess
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25441B2D8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  _BrowserProcess.init()((uint64_t)v4);
  v5 = type metadata accessor for _BrowserProcess(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 0, 1, v5);
  sub_245DBBCDC((uint64_t)v4);
  return 1;
}

+ (BOOL)checkBrowserEngineEntitlementForAuditToken:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;

  v3 = *(_QWORD *)&a3->var0[2];
  v4 = *(_QWORD *)&a3->var0[4];
  v5 = *(_QWORD *)&a3->var0[6];
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25441B2D8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  _BrowserProcess.init(auditToken:)(v3, v4, v5, (uint64_t)v8);
  v9 = type metadata accessor for _BrowserProcess(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 0, 1, v9);
  sub_245DBBCDC((uint64_t)v8);
  return 1;
}

@end
