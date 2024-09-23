@implementation CRLWPParagraphStyle

- (_TtC8Freeform19CRLWPParagraphStyle)init
{
  return (_TtC8Freeform19CRLWPParagraphStyle *)sub_100D6623C();
}

- (id)boxedValueForProperty:(unint64_t)a3
{
  _TtC8Freeform19CRLWPParagraphStyle *v4;
  id v5;

  v4 = self;
  v5 = sub_100D66644(a3);

  return v5;
}

- (void).cxx_destruct
{
  char *v3;
  char *v4;
  char *v5;
  char *v6;

  swift_bridgeObjectRelease(*(_QWORD *)&self->super.baselineShift[OBJC_IVAR____TtC8Freeform19CRLWPParagraphStyle_decimalTab]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform19CRLWPParagraphStyle_paragraphFill));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform19CRLWPParagraphStyle_initialListStyle));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform19CRLWPParagraphStyle_paragraphRuleOffset));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform19CRLWPParagraphStyle_paragraphStroke));

  v3 = *(char **)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform19CRLWPParagraphStyle_followingParagraphStyle);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Freeform19CRLWPParagraphStyle_followingParagraphStyle) = 0;
  if (v3)
  {
    while (1)
    {
      v6 = v3;
      if (!swift_isUniquelyReferenced())
        break;
      v4 = *(char **)&v6[OBJC_IVAR____TtC8Freeform19CRLWPParagraphStyle_followingParagraphStyle];
      v5 = v4;

      v3 = v4;
      if (!v4)
        goto LABEL_6;
    }
    v3 = v6;
  }
LABEL_6:

}

@end
