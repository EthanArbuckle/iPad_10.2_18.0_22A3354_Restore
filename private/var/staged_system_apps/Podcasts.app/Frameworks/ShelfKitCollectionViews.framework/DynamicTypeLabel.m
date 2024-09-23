@implementation DynamicTypeLabel

- (UIFont)font
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DynamicTypeLabel();
  return -[DynamicTypeLabel font](&v3, "font");
}

- (void)setFont:(id)a3
{
  id v4;
  id v5;
  _OWORD v6[5];
  uint64_t v7;
  __int16 v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for DynamicTypeLabel();
  v4 = a3;
  v5 = v9.receiver;
  -[DynamicTypeLabel setFont:](&v9, "setFont:", v4);
  v7 = 0;
  memset(v6, 0, sizeof(v6));
  v8 = -256;
  sub_A99A8((uint64_t)v6);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC23ShelfKitCollectionViews16DynamicTypeLabel *v6;

  v5 = a3;
  v6 = self;
  sub_A9EE8((uint64_t)a3);

}

- (_TtC23ShelfKitCollectionViews16DynamicTypeLabel)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v7;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews16DynamicTypeLabel_fontUseCase;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((_OWORD *)v7 + 2) = 0u;
  *((_OWORD *)v7 + 3) = 0u;
  *((_OWORD *)v7 + 4) = 0u;
  *((_QWORD *)v7 + 10) = 0;
  *((_WORD *)v7 + 44) = -256;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for DynamicTypeLabel();
  return -[DynamicTypeLabel initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC23ShelfKitCollectionViews16DynamicTypeLabel)initWithCoder:(id)a3
{
  char *v4;
  objc_super v6;

  v4 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews16DynamicTypeLabel_fontUseCase;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_OWORD *)v4 + 2) = 0u;
  *((_OWORD *)v4 + 3) = 0u;
  *((_OWORD *)v4 + 4) = 0u;
  *((_QWORD *)v4 + 10) = 0;
  *((_WORD *)v4 + 44) = -256;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DynamicTypeLabel();
  return -[DynamicTypeLabel initWithCoder:](&v6, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews16DynamicTypeLabel_fontUseCase;
  sub_DC94(*(void **)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews16DynamicTypeLabel_fontUseCase), *((_QWORD *)v2 + 1), *((_QWORD *)v2 + 2), *((_QWORD *)v2 + 3), *((_QWORD *)v2 + 4), *((_QWORD *)v2 + 5), *((void **)v2 + 6), *((_QWORD *)v2 + 7), *((_QWORD *)v2 + 8), *((_QWORD *)v2 + 9), *((_QWORD *)v2 + 10), *((_WORD *)v2 + 44));
}

@end
