@implementation PhotosSecondaryToolbarLensControl

- (_TtC12PhotosUICoreP33_8EFB6D60E7554E18002E58C22439F8D333PhotosSecondaryToolbarLensControl)init
{
  return (_TtC12PhotosUICoreP33_8EFB6D60E7554E18002E58C22439F8D333PhotosSecondaryToolbarLensControl *)sub_1A6D67438();
}

- (_TtC12PhotosUICoreP33_8EFB6D60E7554E18002E58C22439F8D333PhotosSecondaryToolbarLensControl)initWithCoder:(id)a3
{
  id v5;
  _TtC12PhotosUICoreP33_8EFB6D60E7554E18002E58C22439F8D333PhotosSecondaryToolbarLensControl *result;

  *(_QWORD *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC12PhotosUICoreP33_8EFB6D60E7554E18002E58C22439F8D333PhotosSecondaryToolbarLensControl_delegate) = 0;
  swift_unknownObjectWeakInit();
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC12PhotosUICoreP33_8EFB6D60E7554E18002E58C22439F8D333PhotosSecondaryToolbarLensControl_performsUpdates) = 0;
  v5 = a3;

  result = (_TtC12PhotosUICoreP33_8EFB6D60E7554E18002E58C22439F8D333PhotosSecondaryToolbarLensControl *)sub_1A7AE4AFC();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  double v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PhotosSecondaryToolbarLensControl();
  v2 = (char *)v6.receiver;
  -[PhotosSecondaryToolbarLensControl layoutSubviews](&v6, sel_layoutSubviews);
  objc_msgSend(v2, sel_bounds, v6.receiver, v6.super_class);
  sub_1A7AE422C();
  v3 = *(void **)&v2[OBJC_IVAR____TtC12PhotosUICoreP33_8EFB6D60E7554E18002E58C22439F8D333PhotosSecondaryToolbarLensControl_lensControl];
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v3, sel_sizeThatFits_, v4, v5);
  PXRectWithCenterAndSize();
  objc_msgSend(v3, sel_setFrame_);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC12PhotosUICoreP33_8EFB6D60E7554E18002E58C22439F8D333PhotosSecondaryToolbarLensControl_lensControl), sel_sizeThatFits_, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (uint64_t)photosLensControl:(void *)a3 didSelectItem:
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(void);
  id v8;
  id v9;

  if ((*(_BYTE *)(result
                 + OBJC_IVAR____TtC12PhotosUICoreP33_8EFB6D60E7554E18002E58C22439F8D333PhotosSecondaryToolbarLensControl_performsUpdates) & 1) == 0)
  {
    v4 = (void *)result;
    v5 = result
       + OBJC_IVAR____TtC12PhotosUICoreP33_8EFB6D60E7554E18002E58C22439F8D333PhotosSecondaryToolbarLensControl_delegate;
    result = MEMORY[0x1A85CED04](result+ OBJC_IVAR____TtC12PhotosUICoreP33_8EFB6D60E7554E18002E58C22439F8D333PhotosSecondaryToolbarLensControl_delegate);
    if (result)
    {
      v6 = *(_QWORD *)(v5 + 8);
      swift_getObjectType();
      v7 = *(void (**)(void))(v6 + 8);
      v8 = a3;
      swift_unknownObjectRetain();
      v9 = v4;
      v7();

      swift_unknownObjectRelease();
      return swift_unknownObjectRelease();
    }
  }
  return result;
}

- (_TtC12PhotosUICoreP33_8EFB6D60E7554E18002E58C22439F8D333PhotosSecondaryToolbarLensControl)initWithFrame:(CGRect)a3
{
  sub_1A6D67BBC();
}

- (void).cxx_destruct
{
  sub_1A688D368((uint64_t)self+ OBJC_IVAR____TtC12PhotosUICoreP33_8EFB6D60E7554E18002E58C22439F8D333PhotosSecondaryToolbarLensControl_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_8EFB6D60E7554E18002E58C22439F8D333PhotosSecondaryToolbarLensControl_lensControl));
}

@end
