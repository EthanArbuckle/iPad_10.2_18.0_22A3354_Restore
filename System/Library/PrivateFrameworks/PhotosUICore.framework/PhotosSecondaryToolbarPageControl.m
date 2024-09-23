@implementation PhotosSecondaryToolbarPageControl

- (_TtC12PhotosUICoreP33_8EFB6D60E7554E18002E58C22439F8D333PhotosSecondaryToolbarPageControl)init
{
  return (_TtC12PhotosUICoreP33_8EFB6D60E7554E18002E58C22439F8D333PhotosSecondaryToolbarPageControl *)sub_1A6D670D8();
}

- (_TtC12PhotosUICoreP33_8EFB6D60E7554E18002E58C22439F8D333PhotosSecondaryToolbarPageControl)initWithCoder:(id)a3
{
  _TtC12PhotosUICoreP33_8EFB6D60E7554E18002E58C22439F8D333PhotosSecondaryToolbarPageControl *result;

  result = (_TtC12PhotosUICoreP33_8EFB6D60E7554E18002E58C22439F8D333PhotosSecondaryToolbarPageControl *)sub_1A7AE4AFC();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PhotosSecondaryToolbarPageControl();
  v2 = (char *)v6.receiver;
  -[PhotosSecondaryToolbarPageControl layoutSubviews](&v6, sel_layoutSubviews);
  objc_msgSend(v2, sel_bounds, v6.receiver, v6.super_class);
  v3 = *(void **)&v2[OBJC_IVAR____TtC12PhotosUICoreP33_8EFB6D60E7554E18002E58C22439F8D333PhotosSecondaryToolbarPageControl_pageIndicator];
  v4 = (uint64_t)objc_msgSend(v3, sel_numberOfPages);
  if (v4 >= 6)
    v5 = 6;
  else
    v5 = v4;
  objc_msgSend(v3, sel_sizeForNumberOfPages_, v5);
  sub_1A7AE422C();
  PXRectWithCenterAndSize();
  objc_msgSend(v3, sel_setFrame_);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC12PhotosUICoreP33_8EFB6D60E7554E18002E58C22439F8D333PhotosSecondaryToolbarPageControl_pageIndicator), sel_sizeThatFits_, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtC12PhotosUICoreP33_8EFB6D60E7554E18002E58C22439F8D333PhotosSecondaryToolbarPageControl)initWithFrame:(CGRect)a3
{
  sub_1A6D67BBC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_8EFB6D60E7554E18002E58C22439F8D333PhotosSecondaryToolbarPageControl_pageIndicator));
}

@end
