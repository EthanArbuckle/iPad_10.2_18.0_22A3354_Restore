@implementation G2PFactoredObjc

- (void)setup
{
  uint64_t (*v3)(void);
  uint64_t v4;
  G2PFactoredObjc *v5;

  v3 = *(uint64_t (**)(void))(type metadata accessor for G2PFactored() + 80);
  v5 = self;
  v4 = v3();
  (*(void (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & (uint64_t)v5->super.isa) + 0x68))(v4);

}

- (id)getPhrasePronounciationWithPhrase:(id)a3 wordSep:(id)a4 prefixWithPhrase:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  G2PFactoredObjc *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v5 = a5;
  v7 = sub_24A215CB4();
  v9 = v8;
  v10 = sub_24A215CB4();
  v12 = v11;
  v13 = self;
  sub_24A1CC2D0(v7, v9, v10, v12, v5);
  v15 = v14;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v15)
  {
    v16 = (void *)sub_24A215C90();
    swift_bridgeObjectRelease();
  }
  else
  {
    v16 = 0;
  }
  return v16;
}

- (id)getPronounciationWithWord:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t (*v8)(void);
  G2PFactoredObjc *v9;
  _QWORD *v10;
  void *v11;

  v4 = sub_24A215CB4();
  v6 = v5;
  v7 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v8 = *(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.isa) + 0x60);
  v9 = self;
  v10 = (_QWORD *)v8();
  v11 = v10;
  if (v10)
  {
    (*(void (**)(uint64_t, uint64_t))((*v7 & *v10) + 0x58))(v4, v6);

    swift_bridgeObjectRelease();
    v11 = (void *)sub_24A215C90();
  }
  else
  {

  }
  swift_bridgeObjectRelease();
  return v11;
}

- (G2PFactoredObjc)init
{
  G2PFactoredObjc *v2;
  objc_super v4;

  v2 = self;
  sub_24A215A80();
  *(Class *)((char *)&v2->super.isa + OBJC_IVAR___G2PFactoredObjc_g2p) = 0;

  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for G2P();
  return -[G2PFactoredObjc init](&v4, sel_init);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___G2PFactoredObjc_logger;
  v4 = sub_24A215A8C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

}

@end
