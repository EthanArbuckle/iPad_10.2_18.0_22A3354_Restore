@implementation CardRevealController

- (_TtC17SequoiaTranslator20CardRevealController)init
{
  _OWORD *v2;
  _OWORD *v3;
  _QWORD *v4;
  objc_super v6;

  v2 = (_OWORD *)((char *)self + OBJC_IVAR____TtC17SequoiaTranslator20CardRevealController_sourceFrame);
  *v2 = 0u;
  v2[1] = 0u;
  v3 = (_OWORD *)((char *)self + OBJC_IVAR____TtC17SequoiaTranslator20CardRevealController_targetFrame);
  *v3 = 0u;
  v3[1] = 0u;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17SequoiaTranslator20CardRevealController_cardSeparation) = (Class)0x4020000000000000;
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17SequoiaTranslator20CardRevealController_textSizeLimit);
  *v4 = 0;
  v4[1] = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC17SequoiaTranslator20CardRevealController_dictionaryAvailable) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CardRevealController();
  return -[CardRevealController init](&v6, "init");
}

@end
