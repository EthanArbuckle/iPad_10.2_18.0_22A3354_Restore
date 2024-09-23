@implementation Context

- (int64_t)currentIdiom
{
  int64_t result;

  sub_21EF0C170();
  return result;
}

- (void)setCurrentIdiom:(int64_t)a3
{
  _TtC9SnippetUI7Context *v4;

  v4 = self;
  sub_21EF0C1EC(a3);

}

- (double)snippetWidth
{
  _TtC9SnippetUI7Context *v2;
  double v3;
  double v4;

  v2 = self;
  sub_21EF0C5C4();
  v4 = v3;

  return v4;
}

- (void)setSnippetWidth:(double)a3
{
  _TtC9SnippetUI7Context *v3;

  v3 = self;
  sub_21EF0C658();

}

- (VRXInteractionDelegate)interactionDelegate
{
  sub_21EF0C808();
}

- (void)setInteractionDelegate:(id)a3
{
  _TtC9SnippetUI7Context *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_21EF0C890();

}

- (int64_t)backgroundMaterial
{
  _TtC9SnippetUI7Context *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  sub_21EF0CB1C();
  v4 = v3;

  return v4;
}

- (void)setBackgroundMaterial:(int64_t)a3
{
  _TtC9SnippetUI7Context *v3;

  v3 = self;
  sub_21EF0CBB4();

}

- (_TtC9SnippetUI7Context)init
{
  Context.init()();
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F9E7C8);
  OUTLINED_FUNCTION_7_45(v3);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F9E770);
  OUTLINED_FUNCTION_7_45(v4);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F9E758);
  OUTLINED_FUNCTION_7_45(v5);
  v6 = (char *)self + OBJC_IVAR____TtC9SnippetUI7Context__isInAmbient;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F9E7A0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F9E7B8);
  OUTLINED_FUNCTION_7_45(v8);
  OUTLINED_FUNCTION_37_10(OBJC_IVAR____TtC9SnippetUI7Context__isVibrant);
  OUTLINED_FUNCTION_37_10(OBJC_IVAR____TtC9SnippetUI7Context__isSmartDialog);
  OUTLINED_FUNCTION_37_10(OBJC_IVAR____TtC9SnippetUI7Context__isPresentedWithSmartDialogText);
  OUTLINED_FUNCTION_37_10(OBJC_IVAR____TtC9SnippetUI7Context__preferFullScreen);
  OUTLINED_FUNCTION_26_10();
  OUTLINED_FUNCTION_26_10();
  OUTLINED_FUNCTION_57_6();
  OUTLINED_FUNCTION_57_6();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F9E730);
  OUTLINED_FUNCTION_7_45(v9);
  sub_21EF11C7C((uint64_t)self + OBJC_IVAR____TtC9SnippetUI7Context_interactionDelegate);
  OUTLINED_FUNCTION_57_6();
  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F9E7E0);
  OUTLINED_FUNCTION_7_45(v10);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F9E790);
  OUTLINED_FUNCTION_7_45(v11);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_57_6();
  swift_release();
}

@end
