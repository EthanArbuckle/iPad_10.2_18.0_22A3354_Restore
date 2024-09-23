@implementation CRLiOSMiniFormatterColorPaletteBuilder

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform38CRLiOSMiniFormatterColorPaletteBuilder_shapeFillDataProvider));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform38CRLiOSMiniFormatterColorPaletteBuilder_strokeDataProvider));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform38CRLiOSMiniFormatterColorPaletteBuilder_textDataProvider));
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.presenter[OBJC_IVAR____TtC8Freeform38CRLiOSMiniFormatterColorPaletteBuilder_fullColorPalette
                                                            + 8]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.presenter[OBJC_IVAR____TtC8Freeform38CRLiOSMiniFormatterColorPaletteBuilder_stickyColorPalette
                                                            + 8]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.presenter[OBJC_IVAR____TtC8Freeform38CRLiOSMiniFormatterColorPaletteBuilder_singleRowPalette
                                                            + 8]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.presenter[OBJC_IVAR____TtC8Freeform38CRLiOSMiniFormatterColorPaletteBuilder_headerTitle]);
}

- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5
{
  id v8;
  id v9;
  _TtC8Freeform38CRLiOSMiniFormatterColorPaletteBuilder *v10;

  v8 = a3;
  v9 = a4;
  v10 = self;
  sub_100950D9C((uint64_t)v9, a5);

}

- (void)colorPickerViewControllerDidFinish:(id)a3
{
  char *v5;
  uint64_t Strong;
  uint64_t v7;
  uint64_t v8;
  uint64_t ObjectType;
  uint64_t (*v10)(uint64_t, uint64_t);
  id v11;
  _TtC8Freeform38CRLiOSMiniFormatterColorPaletteBuilder *v12;

  v5 = (char *)self + OBJC_IVAR____TtC8Freeform26CRLiOSMiniFormatterBuilder_presenter;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC8Freeform26CRLiOSMiniFormatterBuilder_presenter);
  if (Strong)
  {
    v7 = Strong;
    v8 = *((_QWORD *)v5 + 2);
    ObjectType = swift_getObjectType(Strong);
    v10 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 96);
    v11 = a3;
    v12 = self;
    if ((v10(ObjectType, v8) & 1) != 0)
      (*(void (**)(uint64_t, uint64_t))(v8 + 88))(ObjectType, v8);
    (*(void (**)(id, uint64_t, uint64_t))(v8 + 40))(v11, ObjectType, v8);

    swift_unknownObjectRelease(v7);
  }
}

- (void)colorPickerDidChangeSelectedColor:(id)a3
{
  id v4;
  id v5;
  id v6;
  _TtC8Freeform38CRLiOSMiniFormatterColorPaletteBuilder *v7;
  _TtC8Freeform38CRLiOSMiniFormatterColorPaletteBuilder *v8;

  v4 = a3;
  v8 = self;
  v5 = objc_msgSend(v4, "selectedColor");
  if (v5)
  {
    v6 = v5;
    v7 = (_TtC8Freeform38CRLiOSMiniFormatterColorPaletteBuilder *)objc_msgSend(objc_allocWithZone((Class)CRLColorFill), "initWithUIColor:", v5);
    sub_10094E2BC(v7);

    v4 = v6;
    v8 = v7;
  }

}

@end
