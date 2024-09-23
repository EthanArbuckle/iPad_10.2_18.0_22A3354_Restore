@implementation DOCMetadataKeyValueRow

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _TtC5Files22DOCMetadataKeyValueRow *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_1003D0588(x, y, width, height);

}

- (void)didMoveToWindow
{
  id v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCMetadataKeyValueRow();
  v2 = v4.receiver;
  -[DOCMetadataKeyValueRow didMoveToWindow](&v4, "didMoveToWindow");
  v3 = objc_msgSend(v2, "window", v4.receiver, v4.super_class);

  if (v3)
    sub_1003D07EC();

}

- (_TtC5Files22DOCMetadataKeyValueRow)initWithFrame:(CGRect)a3
{
  sub_100226BB0((uint64_t)self, (uint64_t)a2, (uint64_t)"Files.DOCMetadataKeyValueRow", 28);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files22DOCMetadataKeyValueRow_metadataFont));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files22DOCMetadataKeyValueRow____lazy_storage___columnWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files22DOCMetadataKeyValueRow____lazy_storage___label));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC5Files22DOCMetadataKeyValueRow____lazy_storage___value));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files22DOCMetadataKeyValueRow____lazy_storage___spacerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files22DOCMetadataKeyValueRow____lazy_storage___stackView));
  sub_1003DB370(*(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5Files22DOCMetadataKeyValueRow_metadataKey), *(_QWORD *)&self->metrics[OBJC_IVAR____TtC5Files22DOCMetadataKeyValueRow_metadataKey], *(_QWORD *)&self->metrics[OBJC_IVAR____TtC5Files22DOCMetadataKeyValueRow_metadataKey + 8], *(_QWORD *)&self->metrics[OBJC_IVAR____TtC5Files22DOCMetadataKeyValueRow_metadataKey + 16]);
}

- (UILabel)accessibilityElementWithLabel
{
  _TtC5Files22DOCMetadataKeyValueRow *v2;
  id v3;

  v2 = self;
  v3 = sub_1003CF920();

  return (UILabel *)v3;
}

- (UILabel)accessibilityElementWithValue
{
  _TtC5Files22DOCMetadataKeyValueRow *v2;
  uint64_t v3;
  id v4;

  v2 = self;
  v3 = sub_1003CFA58();
  v4 = *(id *)(v3 + 24);

  swift_release(v3);
  return (UILabel *)v4;
}

@end
