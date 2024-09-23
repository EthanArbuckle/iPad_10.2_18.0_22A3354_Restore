@implementation CRLWPCharacterStyle

- (id)boxedValueForProperty:(unint64_t)a3
{
  _TtC8Freeform19CRLWPCharacterStyle *v4;
  id v5;

  v4 = self;
  v5 = sub_100A14F90(a3);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _TtC8Freeform19CRLWPCharacterStyle *v5;
  uint64_t v6;
  _TtC8Freeform19CRLWPCharacterStyle *v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v12;
  _BYTE v13[24];
  uint64_t v14;
  _OWORD v15[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v15, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v15, 0, sizeof(v15));
    v7 = self;
  }
  sub_1004F370C((uint64_t)v15, (uint64_t)v13);
  if (!v14)
  {
    sub_1004D28EC((uint64_t)v13);
    goto LABEL_8;
  }
  v8 = type metadata accessor for CRLWPCharacterStyle();
  if ((swift_dynamicCast(&v12, v13, (char *)&type metadata for Any + 8, v8, 6) & 1) == 0)
  {
LABEL_8:

    v10 = 0;
    goto LABEL_9;
  }
  v9 = v12;
  v10 = sub_100A1586C((uint64_t)self, (uint64_t)v12);

LABEL_9:
  sub_1004D28EC((uint64_t)v15);
  return v10 & 1;
}

- (_TtC8Freeform19CRLWPCharacterStyle)init
{
  return (_TtC8Freeform19CRLWPCharacterStyle *)sub_100A15428();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(_QWORD *)&self->baselineShift[OBJC_IVAR____TtC8Freeform19CRLWPCharacterStyle_compatibilityFontName]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->baselineShift[OBJC_IVAR____TtC8Freeform19CRLWPCharacterStyle_emphasisMarks]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->baselineShift[OBJC_IVAR____TtC8Freeform19CRLWPCharacterStyle_fontName]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC8Freeform19CRLWPCharacterStyle_fontFeatures));
  swift_bridgeObjectRelease(*(_QWORD *)&self->baselineShift[OBJC_IVAR____TtC8Freeform19CRLWPCharacterStyle_language]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->baselineShift[OBJC_IVAR____TtC8Freeform19CRLWPCharacterStyle_pseudoFont]);

}

@end
