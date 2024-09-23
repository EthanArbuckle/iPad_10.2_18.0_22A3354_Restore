@implementation IntelligenceUI.PromptEntryView.AnimatingButtonView

+ (Class)_visualProviderClassForIdiom:(int64_t)a3
{
  sub_1851F9080(0, &qword_1EDD89DF0);
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtCCO5UIKit14IntelligenceUI15PromptEntryViewP33_75F9C46457AA903D9A8178C1F5C6F21019AnimatingButtonView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)_s15PromptEntryViewC19AnimatingButtonViewCMa();
  return -[_UIIntelligenceButton initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtCCO5UIKit14IntelligenceUI15PromptEntryViewP33_75F9C46457AA903D9A8178C1F5C6F21019AnimatingButtonView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_s15PromptEntryViewC19AnimatingButtonViewCMa();
  return -[_UIIntelligenceButton initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
