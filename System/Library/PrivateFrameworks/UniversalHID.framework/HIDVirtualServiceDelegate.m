@implementation HIDVirtualServiceDelegate

- (BOOL)setProperty:(id)a3 forKey:(id)a4 forService:(id)a5
{
  id v7;
  _TtC12UniversalHIDP33_77F0A1D2252CCF67CE1080DE620C755225HIDVirtualServiceDelegate *v8;
  id v9;
  _TtC12UniversalHIDP33_77F0A1D2252CCF67CE1080DE620C755225HIDVirtualServiceDelegate *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v16;
  _OWORD v17[2];

  if (a3)
  {
    v7 = a4;
    swift_unknownObjectRetain();
    v8 = self;
    swift_unknownObjectRetain();
    sub_249955BA4();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v17, 0, sizeof(v17));
    v9 = a4;
    swift_unknownObjectRetain();
    v10 = self;
  }
  v11 = sub_249955844();
  v13 = v12;

  sub_249955BA4();
  swift_unknownObjectRelease();
  v14 = sub_24992E63C((uint64_t)v17, v11, v13);

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v16);
  sub_2498F9DB0((uint64_t)v17, &qword_2578A1280);
  return v14 & 1;
}

- (id)propertyForKey:(id)a3 forService:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC12UniversalHIDP33_77F0A1D2252CCF67CE1080DE620C755225HIDVirtualServiceDelegate *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  void *v14;
  _BYTE v16[32];
  __int128 v17;
  uint64_t v18;

  v5 = sub_249955844();
  v7 = v6;
  swift_unknownObjectRetain();
  v8 = self;
  sub_249955BA4();
  swift_unknownObjectRelease();
  sub_24992E7E0(v5, v7, &v17);

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  v9 = v18;
  if (!v18)
    return 0;
  v10 = __swift_project_boxed_opaque_existential_1(&v17, v18);
  v11 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = &v16[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(_BYTE *))(v11 + 16))(v13);
  v14 = (void *)sub_249955F1C();
  (*(void (**)(_BYTE *, uint64_t))(v11 + 8))(v13, v9);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v17);
  return v14;
}

- (id)copyEventMatching:(id)a3 forService:(id)a4
{
  _TtC12UniversalHIDP33_77F0A1D2252CCF67CE1080DE620C755225HIDVirtualServiceDelegate *v5;
  void *v6;
  uint64_t v8;

  if (a3)
    sub_2499557A8();
  swift_unknownObjectRetain();
  v5 = self;
  sub_249955BA4();
  swift_unknownObjectRelease();
  v6 = (void *)OUTLINED_FUNCTION_15();

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v8);
  return v6;
}

- (BOOL)setOutputEvent:(id)a3 forService:(id)a4
{
  id v5;
  _TtC12UniversalHIDP33_77F0A1D2252CCF67CE1080DE620C755225HIDVirtualServiceDelegate *v6;
  char v7;
  uint64_t v9;

  v5 = a3;
  swift_unknownObjectRetain();
  v6 = self;
  sub_249955BA4();
  swift_unknownObjectRelease();
  v7 = OUTLINED_FUNCTION_6();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v9);
  return v7 & 1;
}

- (void)notification:(int64_t)a3 withProperty:(id)a4 forService:(id)a5
{
  uint64_t v7;
  _TtC12UniversalHIDP33_77F0A1D2252CCF67CE1080DE620C755225HIDVirtualServiceDelegate *v8;
  _BYTE v9[32];

  if (a4)
    v7 = sub_2499557A8();
  else
    v7 = 0;
  swift_unknownObjectRetain();
  v8 = self;
  sub_249955BA4();
  swift_unknownObjectRelease();
  nullsub_1(a3, v7, v9);

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
}

- (_TtC12UniversalHIDP33_77F0A1D2252CCF67CE1080DE620C755225HIDVirtualServiceDelegate)init
{
  sub_24992EB78();
}

- (void).cxx_destruct
{
  sub_2498F9DB0((uint64_t)self + OBJC_IVAR____TtC12UniversalHIDP33_77F0A1D2252CCF67CE1080DE620C755225HIDVirtualServiceDelegate_logger, (uint64_t *)&unk_2578A2350);
  swift_weakDestroy();
}

@end
