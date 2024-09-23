@implementation AdResponseBlock

- (void)contentResponses:(id)a3
{
  unint64_t v4;
  _TtC15PromotedContentP33_E3331A4917F70526BBCA8EA71ED6884515AdResponseBlock *v5;

  if (a3)
  {
    sub_1B11DF944(0, (unint64_t *)&unk_1ED391400);
    v4 = sub_1B1289944();
  }
  else
  {
    v4 = 0;
  }
  v5 = self;
  sub_1B11E6ED8(v4);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_1B11E40EC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC15PromotedContentP33_E3331A4917F70526BBCA8EA71ED6884515AdResponseBlock_completion));
  v3 = (char *)self
     + OBJC_IVAR____TtC15PromotedContentP33_E3331A4917F70526BBCA8EA71ED6884515AdResponseBlock_requestIdentifier;
  v4 = sub_1B1289674();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15PromotedContentP33_E3331A4917F70526BBCA8EA71ED6884515AdResponseBlock_context));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15PromotedContentP33_E3331A4917F70526BBCA8EA71ED6884515AdResponseBlock_responseLock));
}

- (id)requesterID
{
  return (id)sub_1B1289644();
}

- (void)connectionSeveredWithError:(id)a3
{
  _TtC15PromotedContentP33_E3331A4917F70526BBCA8EA71ED6884515AdResponseBlock *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_1B1258D20();

}

- (_TtC15PromotedContentP33_E3331A4917F70526BBCA8EA71ED6884515AdResponseBlock)init
{
  _TtC15PromotedContentP33_E3331A4917F70526BBCA8EA71ED6884515AdResponseBlock *result;

  result = (_TtC15PromotedContentP33_E3331A4917F70526BBCA8EA71ED6884515AdResponseBlock *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
