@implementation _UIDirectionalLightPalette

- (_UIDirectionalLightPalette)initWithColors:(id)a3
{
  id v4;
  _UIDirectionalLightPalette *v5;
  void *v6;
  objc_class *v7;
  objc_super v9;

  sub_1851F9080(0, (unint64_t *)&qword_1ECD74900);
  sub_186507654();
  v4 = objc_allocWithZone((Class)_UIColorPalette);
  v5 = self;
  v6 = (void *)sub_18650763C();
  swift_bridgeObjectRelease();
  v7 = (objc_class *)objc_msgSend(v4, sel_initWithColors_, v6);

  *(Class *)((char *)&v5->super.isa + OBJC_IVAR____UIDirectionalLightPalette_colorPalette) = v7;
  v9.receiver = v5;
  v9.super_class = (Class)_UIDirectionalLightPalette;
  return -[_UIDirectionalLightPalette init](&v9, sel_init);
}

- (_UIDirectionalLightPalette)initWithColors:(id)a3 locations:(id)a4
{
  id v5;
  _UIDirectionalLightPalette *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  objc_super v11;

  sub_1851F9080(0, (unint64_t *)&qword_1ECD74900);
  sub_186507654();
  sub_1851F9080(0, (unint64_t *)&qword_1ECD75368);
  sub_186507654();
  v5 = objc_allocWithZone((Class)_UIColorPalette);
  v6 = self;
  v7 = (void *)sub_18650763C();
  swift_bridgeObjectRelease();
  v8 = (void *)sub_18650763C();
  swift_bridgeObjectRelease();
  v9 = (objc_class *)objc_msgSend(v5, sel_initWithColors_locations_colorSpaceName_, v7, v8, 0);

  *(Class *)((char *)&v6->super.isa + OBJC_IVAR____UIDirectionalLightPalette_colorPalette) = v9;
  v11.receiver = v6;
  v11.super_class = (Class)_UIDirectionalLightPalette;
  return -[_UIDirectionalLightPalette init](&v11, sel_init);
}

- (_UIDirectionalLightPalette)init
{
  _UIDirectionalLightPalette *result;

  result = (_UIDirectionalLightPalette *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

+ (_UIDirectionalLightPalette)pondering
{
  return (_UIDirectionalLightPalette *)sub_1856A4EEC((uint64_t)a1, (uint64_t)a2, (SEL *)&selRef_textAssistantPonderingFillPalette);
}

+ (_UIDirectionalLightPalette)replaceBuildOut
{
  return (_UIDirectionalLightPalette *)sub_1856A4EEC((uint64_t)a1, (uint64_t)a2, (SEL *)&selRef_textAssistantReplacementBuildOutPalette);
}

+ (_UIDirectionalLightPalette)replaceBuildIn
{
  return (_UIDirectionalLightPalette *)sub_1856A4EEC((uint64_t)a1, (uint64_t)a2, (SEL *)&selRef_textAssistantReplacementBuildOutPalette);
}

@end
