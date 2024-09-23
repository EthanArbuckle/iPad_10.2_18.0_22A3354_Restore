@implementation SimpleProgressView

- (_TtC23ShelfKitCollectionViewsP33_73EE084195E4C536378CD521A3E22D8618SimpleProgressView)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViewsP33_73EE084195E4C536378CD521A3E22D8618SimpleProgressView *)sub_98458(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViewsP33_73EE084195E4C536378CD521A3E22D8618SimpleProgressView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_996FC();
}

- (void)tintColorDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[SimpleProgressView tintColorDidChange](&v3, "tintColorDidChange");
  objc_msgSend(v2, "setNeedsDisplay", v3.receiver, v3.super_class);

}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _TtC23ShelfKitCollectionViewsP33_73EE084195E4C536378CD521A3E22D8618SimpleProgressView *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_98800(x, y, width, height);

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  void (*v7)(char *, uint64_t);

  v3 = (char *)self
     + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_73EE084195E4C536378CD521A3E22D8618SimpleProgressView__progress;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_3D3698);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self
     + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_73EE084195E4C536378CD521A3E22D8618SimpleProgressView__progressTintColor;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_3D3690);
  v7 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v7(v5, v6);
  v7((char *)self+ OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_73EE084195E4C536378CD521A3E22D8618SimpleProgressView__trackTintColor, v6);
}

@end
