@implementation ReadableWidthContainer

- (_TtC17SequoiaTranslator22ReadableWidthContainer)initWithFrame:(CGRect)a3
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
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator22ReadableWidthContainer_wrappedView) = 0;
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC17SequoiaTranslator22ReadableWidthContainer_readableWidthEnabled) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator22ReadableWidthContainer_sizingConstraints) = (Class)_swiftEmptyArrayStorage;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ReadableWidthContainer();
  return -[ReadableWidthContainer initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC17SequoiaTranslator22ReadableWidthContainer)initWithCoder:(id)a3
{
  id v4;
  _TtC17SequoiaTranslator22ReadableWidthContainer *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator22ReadableWidthContainer_wrappedView) = 0;
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC17SequoiaTranslator22ReadableWidthContainer_readableWidthEnabled) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator22ReadableWidthContainer_sizingConstraints) = (Class)_swiftEmptyArrayStorage;
  v4 = a3;

  result = (_TtC17SequoiaTranslator22ReadableWidthContainer *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001001F88D0, "SequoiaTranslator/ReadableWidthContainer.swift", 46, 2, 34, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator22ReadableWidthContainer_wrappedView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC17SequoiaTranslator22ReadableWidthContainer_sizingConstraints));
}

@end
