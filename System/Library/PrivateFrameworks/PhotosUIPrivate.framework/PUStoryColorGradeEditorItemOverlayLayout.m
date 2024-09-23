@implementation PUStoryColorGradeEditorItemOverlayLayout

- (void)update
{
  PUStoryColorGradeEditorItemOverlayLayout *v2;

  v2 = self;
  sub_1AAC90024();

}

- (void)referenceSizeDidChange
{
  PUStoryColorGradeEditorItemOverlayLayout *v2;

  v2 = self;
  sub_1AAC901CC();

}

- (void)displayScaleDidChange
{
  PUStoryColorGradeEditorItemOverlayLayout *v2;

  v2 = self;
  sub_1AAC90254(0, type metadata accessor for StoryColorGradeEditorItemLayout.OverlayLayout, (SEL *)&selRef_displayScaleDidChange, (void (*)(id))sub_1AAC9014C);

}

- (void)viewEnvironmentDidChange
{
  PUStoryColorGradeEditorItemOverlayLayout *v2;

  v2 = self;
  sub_1AAC902E8();

}

- (id)objectReferenceForSpriteIndex:(unsigned int)a3
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  __n128 v6;
  uint64_t v7;
  char *v8;
  void *v9;
  _QWORD v11[3];
  uint64_t v12;

  sub_1AAC903A0(a3, v11);
  v3 = v12;
  if (!v12)
    return 0;
  v4 = __swift_project_boxed_opaque_existential_0(v11, v12);
  v5 = *(_QWORD *)(v3 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, __n128))(v5 + 16))(v8, v6);
  v9 = (void *)sub_1AB08DFE4();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v3);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
  return v9;
}

- (unsigned)spriteIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  PUStoryColorGradeEditorItemOverlayLayout *v8;
  _QWORD v10[4];

  swift_unknownObjectRetain();
  v8 = self;
  sub_1AB08DCA8();
  swift_unknownObjectRelease();
  LODWORD(a5) = sub_1AAC904BC(v10, a4, a5);

  __swift_destroy_boxed_opaque_existential_0((uint64_t)v10);
  return a5;
}

- (id)hitTestResultForSpriteIndex:(unsigned int)a3
{
  uint64_t v3;
  PUStoryColorGradeEditorItemOverlayLayout *v4;
  void *v5;
  void *v6;

  v3 = *(_QWORD *)&a3;
  v4 = self;
  sub_1AAC90DCC(v3);
  v6 = v5;

  return v6;
}

- (id)stringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v6;
  PUStoryColorGradeEditorItemOverlayLayout *v7;
  void *v8;

  v6 = a4;
  v7 = self;
  sub_1AAC90E58(a3);

  v8 = (void *)sub_1AB08D468();
  swift_bridgeObjectRelease();
  return v8;
}

- (id)stringAttributesAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v6;
  PUStoryColorGradeEditorItemOverlayLayout *v7;
  uint64_t v8;
  void *v9;

  v6 = a4;
  v7 = self;
  v8 = sub_1AAC90F4C(a3);

  if (v8)
  {
    type metadata accessor for Key(0);
    sub_1AABE6434();
    v9 = (void *)sub_1AB08D390();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (int64_t)verticalAlignmentForStringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return sub_1AAC91140(a3);
}

- (id)attributedStringForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return (id)sub_1AAC911C8(a3);
}

- (id)imageConfigurationAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v6;
  PUStoryColorGradeEditorItemOverlayLayout *v7;
  id v8;

  v6 = a4;
  v7 = self;
  v8 = sub_1AAC91250(a3);

  return v8;
}

- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v6;
  PUStoryColorGradeEditorItemOverlayLayout *v7;
  id v8;

  v6 = a4;
  v7 = self;
  v8 = sub_1AAC913B4(a3);

  return v8;
}

- (id)axSpriteIndexes
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void *v4;
  uint64_t v6;

  v0 = sub_1AB08B008();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AAC91560((uint64_t)v3);
  v4 = (void *)sub_1AB08AFC0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

- (id)axContentInfoAtSpriteIndex:(unsigned int)a3
{
  uint64_t v3;
  PUStoryColorGradeEditorItemOverlayLayout *v4;
  id v5;

  v3 = *(_QWORD *)&a3;
  v4 = self;
  v5 = sub_1AAC91614(v3);

  return v5;
}

- (NSIndexSet)axSelectedSpriteIndexes
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  PUStoryColorGradeEditorItemOverlayLayout *v7;
  void *v8;
  uint64_t v10;

  v3 = sub_1AB08B008();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_1AAC918AC((uint64_t)v6);

  v8 = (void *)sub_1AB08AFC0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSIndexSet *)v8;
}

- (PUStoryColorGradeEditorItemOverlayLayout)init
{
  sub_1AAC919A8();
}

- (void).cxx_destruct
{

  sub_1AAB93C08((uint64_t)self + OBJC_IVAR___PUStoryColorGradeEditorItemOverlayLayout_accessibleSpriteIndexes, &qword_1EEBBDC00);
}

@end
