@implementation AssetManager

- (_TtC3VFX12AssetManager)init
{
  return (_TtC3VFX12AssetManager *)sub_1B1D559FC();
}

- (id)absoluteURLForAssetPath:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _TtC3VFX12AssetManager *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _BYTE v16[16];

  sub_1B1791524(0, (unint64_t *)&qword_1ED4BF720, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v4, v5);
  v7 = &v16[-v6];
  v8 = sub_1B222874C();
  v10 = v9;
  v11 = self;
  v16[12] = 1;
  sub_1B1D55BF8(v8, v10, 0x100000000, (uint64_t)v7);

  swift_bridgeObjectRelease();
  v12 = sub_1B2228110();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = 0;
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v13 + 48))(v7, 1, v12) != 1)
  {
    v14 = (void *)sub_1B2228074();
    (*(void (**)(_BYTE *, uint64_t))(v13 + 8))(v7, v12);
  }
  return v14;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_release();
}

@end
