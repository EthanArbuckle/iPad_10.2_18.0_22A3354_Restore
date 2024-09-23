@implementation TVAppBag

- (id)cachedURLForKey:(id)a3
{
  return sub_247D087F0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))_sSo8TVAppBagC0A8ServicesE9cachedURL3for10Foundation0E0VSgSS_tF_0);
}

- (void)prewarm
{
  TVAppBag *v2;

  v2 = self;
  TVAppBag.prewarm()();

}

- (id)stringForKey:(id)a3
{
  return sub_247D08634(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))_sSo8TVAppBagC0A8ServicesE6string3forSSSgSS_tF_0);
}

- (id)arrayForKey:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  TVAppBag *v7;
  uint64_t v8;
  void *v9;

  v4 = sub_247D98CBC();
  v6 = v5;
  v7 = self;
  v8 = _sSo8TVAppBagC0A8ServicesE5array3forSayypGSgSS_tF_0(v4, v6);

  swift_bridgeObjectRelease();
  if (v8)
  {
    v9 = (void *)sub_247D98DDC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

+ (TVAppBag)app
{
  if (qword_2544577C0 != -1)
    swift_once();
  return (TVAppBag *)(id)qword_2544577E0;
}

- (id)cachedIntegerForKey:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  TVAppBag *v7;
  uint64_t v8;
  char v9;
  id v10;

  v4 = sub_247D98CBC();
  v6 = v5;
  v7 = self;
  v8 = sub_247D09704(v4, v6, sub_247D3D0D8, (uint64_t)nullsub_1, (uint64_t)&unk_251957D68, (uint64_t)sub_247D0BDF0, (uint64_t)&block_descriptor_21, MEMORY[0x24BEE1768], (uint64_t)nullsub_1, (uint64_t (*)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))sub_247D42B64);
  if ((v9 & 1) != 0)
    v10 = 0;
  else
    v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, v8);

  swift_bridgeObjectRelease();
  return v10;
}

- (id)cachedBooleanForKey:(id)a3
{
  return sub_247D085A0(self, (uint64_t)a2, (uint64_t)a3, sub_247D04D1C);
}

- (id)urlForKey:(id)a3
{
  return sub_247D087F0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))_sSo8TVAppBagC0A8ServicesE3url3for10Foundation3URLVSgSS_tF_0);
}

- (id)dictionaryForKey:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  TVAppBag *v7;
  uint64_t v8;
  void *v9;

  v4 = sub_247D98CBC();
  v6 = v5;
  v7 = self;
  v8 = _sSo8TVAppBagC0A8ServicesE10dictionary3forSDys11AnyHashableVypGSgSS_tF_0(v4, v6);

  swift_bridgeObjectRelease();
  if (v8)
  {
    v9 = (void *)sub_247D98C50();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)BOOLeanForKey:(id)a3
{
  return sub_247D085A0(self, (uint64_t)a2, (uint64_t)a3, sub_247D3CC24);
}

- (id)integerForKey:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  TVAppBag *v7;
  uint64_t v8;
  char v9;
  id v10;

  v4 = sub_247D98CBC();
  v6 = v5;
  v7 = self;
  v8 = sub_247D3D0D8(v4, v6);
  if ((v9 & 1) != 0)
    v10 = 0;
  else
    v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, v8);

  swift_bridgeObjectRelease();
  return v10;
}

- (id)doubleForKey:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  TVAppBag *v7;
  uint64_t v8;
  char v9;
  id v10;

  v4 = sub_247D98CBC();
  v6 = v5;
  v7 = self;
  v8 = sub_247D3D5A4(v4, v6);
  if ((v9 & 1) != 0)
    v10 = 0;
  else
    v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithDouble_, *(double *)&v8);

  swift_bridgeObjectRelease();
  return v10;
}

- (id)cachedStringForKey:(id)a3
{
  return sub_247D08634(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_247D3E304);
}

- (id)cachedDictionaryForKey:(id)a3
{
  uint64_t (*v4)(_QWORD, _QWORD);
  uint64_t v5;
  uint64_t v6;
  TVAppBag *v7;
  uint64_t v8;
  void *v9;

  v4 = (uint64_t (*)(_QWORD, _QWORD))sub_247D98CBC();
  v6 = v5;
  v7 = self;
  v8 = sub_247D3ECF8(v4, v6, _sSo8TVAppBagC0A8ServicesE10dictionary3forSDys11AnyHashableVypGSgSS_tF_0, (uint64_t)nullsub_1, (uint64_t)&unk_251957E58, (uint64_t)sub_247D437D0, (uint64_t)&block_descriptor_42, &qword_254457800, (uint64_t)nullsub_1);

  swift_bridgeObjectRelease();
  if (v8)
  {
    v9 = (void *)sub_247D98C50();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)cachedArrayForKey:(id)a3
{
  uint64_t (*v4)(_QWORD, _QWORD);
  uint64_t v5;
  uint64_t v6;
  TVAppBag *v7;
  uint64_t v8;
  void *v9;

  v4 = (uint64_t (*)(_QWORD, _QWORD))sub_247D98CBC();
  v6 = v5;
  v7 = self;
  v8 = sub_247D3ECF8(v4, v6, _sSo8TVAppBagC0A8ServicesE5array3forSayypGSgSS_tF_0, (uint64_t)nullsub_1, (uint64_t)&unk_251957E08, (uint64_t)sub_247D437B8, (uint64_t)&block_descriptor_35, &qword_254457950, (uint64_t)nullsub_1);

  swift_bridgeObjectRelease();
  if (v8)
  {
    v9 = (void *)sub_247D98DDC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)cachedDoubleForKey:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  TVAppBag *v7;
  uint64_t v8;
  char v9;
  id v10;

  v4 = sub_247D98CBC();
  v6 = v5;
  v7 = self;
  v8 = sub_247D09704(v4, v6, sub_247D3D5A4, (uint64_t)nullsub_1, (uint64_t)&unk_251957CC8, (uint64_t)sub_247D43754, (uint64_t)&block_descriptor_2, MEMORY[0x24BEE13C8], (uint64_t)nullsub_1, (uint64_t (*)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))sub_247D43148);
  if ((v9 & 1) != 0)
    v10 = 0;
  else
    v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithDouble_, *(double *)&v8);

  swift_bridgeObjectRelease();
  return v10;
}

- (TVAppBag)init
{
  TVAppBag *result;

  result = (TVAppBag *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___TVAppBag_cacheStorage);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
