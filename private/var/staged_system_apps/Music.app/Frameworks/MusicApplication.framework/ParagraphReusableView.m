@implementation ParagraphReusableView

- (_TtC16MusicApplication21ParagraphReusableView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  uint64_t v9;
  id v10;
  _TtC16MusicApplication21ParagraphReusableView *v11;
  _TtC16MusicApplication21ParagraphReusableView *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = OBJC_IVAR____TtC16MusicApplication21ParagraphReusableView_paragraphView;
  type metadata accessor for ParagraphView();
  v10 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v11 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v9) = (Class)objc_msgSend(v10, "init");

  v14.receiver = v11;
  v14.super_class = ObjectType;
  v12 = -[ParagraphReusableView initWithFrame:](&v14, "initWithFrame:", x, y, width, height);
  -[ParagraphReusableView addSubview:](v12, "addSubview:", *(Class *)((char *)&v12->super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication21ParagraphReusableView_paragraphView));
  return v12;
}

- (_TtC16MusicApplication21ParagraphReusableView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC16MusicApplication21ParagraphReusableView *result;

  v5 = OBJC_IVAR____TtC16MusicApplication21ParagraphReusableView_paragraphView;
  type metadata accessor for ParagraphView();
  v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");

  result = (_TtC16MusicApplication21ParagraphReusableView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/ParagraphView.swift", 36, 2, 583, 0);
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC16MusicApplication21ParagraphReusableView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  sub_AC5FB0(width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  _TtC16MusicApplication21ParagraphReusableView *v2;

  v2 = self;
  sub_AC9E8C();

}

- (void)music_inheritedLayoutInsetsDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[ParagraphReusableView music_inheritedLayoutInsetsDidChange](&v3, "music_inheritedLayoutInsetsDidChange");
  objc_msgSend(v2, "setNeedsLayout", v3.receiver, v3.super_class);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication21ParagraphReusableView_paragraphView));
}

@end
