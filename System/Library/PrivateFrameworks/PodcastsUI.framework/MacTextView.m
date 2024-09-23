@implementation MacTextView

- (NSString)text
{
  id v2;
  NSString *v3;
  NSString *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MacTextView();
  v2 = v7.receiver;
  v3 = -[MacTextView text](&v7, sel_text);
  if (v3)
  {
    v4 = v3;
    sub_1DA66F8BC();

    v5 = (void *)sub_1DA66F88C();
    swift_bridgeObjectRelease();
    return (NSString *)v5;
  }
  else
  {

    return (NSString *)0;
  }
}

- (void)setText:(id)a3
{
  _TtC10PodcastsUI11MacTextView *v4;
  void *v5;
  _TtC10PodcastsUI11MacTextView *v6;
  objc_super v7;

  if (a3)
  {
    sub_1DA66F8BC();
    v4 = self;
    v5 = (void *)sub_1DA66F88C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = self;
    v5 = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MacTextView();
  -[MacTextView setText:](&v7, sel_setText_, v5);

}

- (_TtC10PodcastsUI11MacTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  _TtC10PodcastsUI11MacTextView *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _TtC10PodcastsUI11MacTextView *v14;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)type metadata accessor for MacTextView();
  v9 = a4;
  v10 = -[MacTextView initWithFrame:textContainer:](&v16, sel_initWithFrame_textContainer_, v9, x, y, width, height);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F026E5C0);
  v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_1DA678510;
  v12 = sub_1DA66DF00();
  v13 = MEMORY[0x1E0DC1EE0];
  *(_QWORD *)(v11 + 32) = v12;
  *(_QWORD *)(v11 + 40) = v13;
  v14 = v10;
  MEMORY[0x1DF09EADC](v11, sel_updateAppearance);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  sub_1DA6458A4();

  return v14;
}

- (void)updateAppearance
{
  _TtC10PodcastsUI11MacTextView *v2;

  v2 = self;
  sub_1DA6458A4();

}

- (_TtC10PodcastsUI11MacTextView)initWithCoder:(id)a3
{
  _TtC10PodcastsUI11MacTextView *result;

  result = (_TtC10PodcastsUI11MacTextView *)sub_1DA670570();
  __break(1u);
  return result;
}

- (UIBezierPath)accessibilityPath
{
  _TtC10PodcastsUI11MacTextView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;

  v2 = self;
  -[MacTextView bounds](v2, sel_bounds);
  -[MacTextView convertRect:toView:](v2, sel_convertRect_toView_, 0);
  v7 = objc_msgSend((id)objc_opt_self(), sel_bezierPathWithRect_, v3, v4, v5, v6);

  return (UIBezierPath *)v7;
}

@end
