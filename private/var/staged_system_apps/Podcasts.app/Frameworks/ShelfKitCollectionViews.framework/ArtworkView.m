@implementation ArtworkView

- (_TtC23ShelfKitCollectionViews11ArtworkView)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews11ArtworkView *)sub_E9D28(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews11ArtworkView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_EC380();
}

- (NSString)accessibilityTitle
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->super.cornerRadius[OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_accessibilityTitle];
  if (v2)
  {
    swift_bridgeObjectRetain(*(_QWORD *)&self->super.cornerRadius[OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_accessibilityTitle]);
    v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v2);
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setAccessibilityTitle:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_accessibilityTitle);
  v7 = *(_QWORD *)&self->super.cornerRadius[OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_accessibilityTitle];
  *v6 = v4;
  v6[1] = v5;
  swift_bridgeObjectRelease(v7);
}

- (UIColor)backgroundColor
{
  return (UIColor *)objc_msgSend((id)objc_opt_self(UIColor), "clearColor");
}

- (void)setBackgroundColor:(id)a3
{
  void *v4;
  _TtC23ShelfKitCollectionViews11ArtworkView *v5;
  id v6;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_internalBackgroundColor);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_internalBackgroundColor) = (Class)a3;
  v6 = a3;
  v5 = self;

  sub_E9020();
}

- (void)layoutSubviews
{
  _TtC23ShelfKitCollectionViews11ArtworkView *v2;

  v2 = self;
  sub_EAD34();

}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ArtworkView(0);
  -[ArtworkView frame](&v6, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC23ShelfKitCollectionViews11ArtworkView *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_EB254(x, y, width, height);

}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_imageView), "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView__contentView));
  v3 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_aspectRule;
  v4 = type metadata accessor for ArtworkAspectRule(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.cornerRadius[OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_accessibilityTitle]);
  sub_B7A70(*(char **)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_mt_hoverStyle), *(_QWORD *)&self->super.cornerRadius[OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_mt_hoverStyle], *(_QWORD *)&self->super.cornerStyle[OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_mt_hoverStyle], *(_QWORD *)&self->super.roundedCorners[OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_mt_hoverStyle + 7], *(_QWORD *)&self->super.borderView[OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_mt_hoverStyle + 7], *(_QWORD *)&self->super.borderColor[OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_mt_hoverStyle + 7], *(_QWORD *)&self->super.borderWidth[OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_mt_hoverStyle + 7], *(_QWORD *)&self->imageView[OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_mt_hoverStyle], *(_QWORD *)&self->_contentView[OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_mt_hoverStyle], *(_QWORD *)&self->accessibilityTitle[OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_mt_hoverStyle], *(_QWORD *)&self->accessibilityTitle[OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_mt_hoverStyle + 8], *(void **)&self->mt_hoverStyle[OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_mt_hoverStyle]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_shadow));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_gradientView));
  sub_B7AE8(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_gradient), *(_QWORD *)&self->super.cornerRadius[OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_gradient], *(_QWORD *)&self->super.cornerStyle[OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_gradient], *(_QWORD *)&self->super.roundedCorners[OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_gradient + 7], *(_QWORD *)&self->super.borderView[OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_gradient + 7], *(_QWORD *)&self->super.borderColor[OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_gradient + 7], *(_QWORD *)&self->super.borderWidth[OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_gradient + 7], *(void **)&self->imageView[OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_gradient]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_internalBackgroundColor));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_requestCancellable));
}

@end
