@implementation URLButton

- (_TtC9SeymourUI9URLButton)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI9URLButton *)sub_22B2F8108(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI9URLButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B2F91D4();
}

- (void)layoutSubviews
{
  _TtC9SeymourUI9URLButton *v2;

  v2 = self;
  sub_22B2F8588();

}

- (void)tintColorDidChange
{
  _TtC9SeymourUI9URLButton *v2;

  v2 = self;
  sub_22B2F880C();

}

- (void)textSizeChanged:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  char v12;
  _TtC9SeymourUI9URLButton *v13;
  id v14;
  uint64_t v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255B8E770);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_22BA79320();
    v8 = sub_22BA79344();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    v9 = sub_22BA79344();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI9URLButton_lastFont);
  v11 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                   + OBJC_IVAR____TtC9SeymourUI9URLButton_lastSymbolScale);
  v12 = *((_BYTE *)&self->super.super.super.super._responderFlags + OBJC_IVAR____TtC9SeymourUI9URLButton_lastSymbolScale);
  v13 = self;
  v14 = v10;
  sub_22B2F89F0(v10, v11, v12);

  sub_22B0FB1DC((uint64_t)v7, &qword_255B8E770);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.__layeringSceneIdentity
                     + OBJC_IVAR____TtC9SeymourUI9URLButton_defaults));
  swift_bridgeObjectRelease();

  sub_22B0FB1DC((uint64_t)self + OBJC_IVAR____TtC9SeymourUI9URLButton_url, (uint64_t *)&unk_255B83400);
}

@end
