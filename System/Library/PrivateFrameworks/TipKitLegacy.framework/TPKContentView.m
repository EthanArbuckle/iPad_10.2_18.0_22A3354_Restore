@implementation TPKContentView

+ (CGSize)defaultMicaSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 64.0;
  v3 = 64.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (id)SiriIconWithTraitCollection:(id)a3
{
  return objc_msgSend((id)objc_opt_self(), sel_tipKitSiriIconWithTraitCollection_, a3);
}

+ (id)TipsIconWithTraitCollection:(id)a3
{
  return objc_msgSend((id)objc_opt_self(), sel_tipsAppHomeScreenIcon);
}

- (UIImageView)iconImageView
{
  return (UIImageView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                + OBJC_IVAR___TPKContentView_imageProxy));
}

- (BOOL)displaysBottomSeparator
{
  return *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR___TPKContentView_displayBottomSeparator);
}

- (void)setDisplaysBottomSeparator:(BOOL)a3
{
  void (*v3)(void);
  TPKContentView *v4;

  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR___TPKContentView_displayBottomSeparator) = a3;
  v3 = *(void (**)(void))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.super.super.super.isa) + 0x1D8);
  v4 = self;
  v3();

}

- (UIColor)preferredActionTintColor
{
  TPKContentView *v2;
  id v3;

  v2 = self;
  v3 = TPKContentView.preferredActionTintColor.getter();

  return (UIColor *)v3;
}

- (void)setPreferredActionTintColor:(id)a3
{
  id v5;
  TPKContentView *v6;

  v5 = a3;
  v6 = self;
  TPKContentView.preferredActionTintColor.setter(a3);

}

- (UIColor)preferredIconImageTintColor
{
  TPKContentView *v2;
  id v3;

  v2 = self;
  v3 = TPKContentView.preferredIconImageTintColor.getter();

  return (UIColor *)v3;
}

- (void)setPreferredIconImageTintColor:(id)a3
{
  id v5;
  TPKContentView *v6;

  v5 = a3;
  v6 = self;
  TPKContentView.preferredIconImageTintColor.setter(a3);

}

- (CGSize)preferredMicaLayerSize
{
  TPKContentView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  v3 = TPKContentView.preferredMicaLayerSize.getter();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)setPreferredMicaLayerSize:(CGSize)a3
{
  double height;
  double width;
  TPKContentView *v5;

  height = a3.height;
  width = a3.width;
  v5 = self;
  TPKContentView.preferredMicaLayerSize.setter(width, height);

}

- (UITraitCollection)_preferredTraitCollection
{
  return (UITraitCollection *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                      + OBJC_IVAR___TPKContentView_preferredTraitCollection));
}

- (void)set_preferredTraitCollection:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___TPKContentView_preferredTraitCollection);
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___TPKContentView_preferredTraitCollection) = (Class)a3;
  v3 = a3;

}

- (UIVisualEffect)visualEffect
{
  uint64_t *v2;
  uint64_t v3;
  id v4;

  v2 = (uint64_t *)((char *)self + OBJC_IVAR___TPKBaseContentView_viewModel);
  swift_beginAccess();
  v3 = *v2;
  swift_unownedRetainStrong();
  if (!v3)
    return (UIVisualEffect *)0;
  v4 = *(id *)(v3 + 16);
  swift_release();
  return (UIVisualEffect *)v4;
}

- (void)setVisualEffect:(id)a3
{
  id v5;
  TPKContentView *v6;

  v5 = a3;
  v6 = self;
  sub_248A8C998(a3);

}

- (void)updateDisplaysBottomSeparator:(BOOL)a3
{
  void (*v3)(void);
  TPKContentView *v4;

  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR___TPKContentView_displayBottomSeparator) = a3;
  v3 = *(void (**)(void))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.super.super.super.isa) + 0x1D8);
  v4 = self;
  v3();

}

- (void)updatePreferredTraitCollection:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___TPKContentView_preferredTraitCollection);
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___TPKContentView_preferredTraitCollection) = (Class)a3;
  v3 = a3;

}

- (TPKContentView)initWithController:(id)a3 content:(id)a4
{
  return (TPKContentView *)TPKContentView.init(controller:content:)(a3, a4);
}

- (TPKContentView)initWithCoder:(id)a3
{
  return (TPKContentView *)TPKContentView.init(coder:)(a3);
}

- (TPKContentView)initWithReusableTipView:(id)a3
{
  uint64_t v4;
  void *v5;
  TPKContentView *v6;
  uint64_t v7;
  TPKContentView *v8;

  v4 = OBJC_IVAR___TPKContentView_preferredTraitCollection;
  v5 = (void *)objc_opt_self();
  swift_unknownObjectRetain();
  v6 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v4) = (Class)objc_msgSend(v5, sel_currentTraitCollection);
  *((_BYTE *)&v6->super.super.super.super.isa + OBJC_IVAR___TPKContentView_displayBottomSeparator) = 0;
  v7 = OBJC_IVAR___TPKContentView_imageProxy;
  type metadata accessor for TipImageProxy();
  *(Class *)((char *)&v6->super.super.super.super.isa + v7) = (Class)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);

  v8 = (TPKContentView *)-[TPKBaseContentView initWithReusableTipView:]_0((char *)v6);
  swift_unknownObjectRelease();
  return v8;
}

- (void)monitorDeviceOrientationChanges
{
  TPKContentView *v2;

  v2 = self;
  sub_248A8CA5C();

}

- (void)willMoveToWindow:(id)a3
{
  TPKContentView *v4;
  id v5;
  id v6;
  id v7;
  objc_super v8;

  v4 = self;
  if (a3)
  {
    v5 = a3;
    v6 = -[TPKContentView window](v4, sel_window);

    if (!v6)
    {
      v7 = objc_msgSend(v5, sel_tintColor);
      if (!v7)
        v7 = TPKContentView.preferredActionTintColor.getter();
      TPKContentView.preferredActionTintColor.setter(v7);
    }
  }
  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for TPKContentView();
  -[TPKBaseContentView willMoveToWindow:](&v8, sel_willMoveToWindow_, a3);

}

- (void)setupHostingViewWithController:(id)a3 content:(id)a4
{
  char *v7;
  TPKContentView *v8;

  swift_unknownObjectRetain();
  v7 = (char *)a4;
  v8 = self;
  sub_248A8C5A0(a3, v7);
  swift_unknownObjectRelease();

}

- (id)createHostingView
{
  TPKContentView *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_248A8C868();

  return v3;
}

- (void).cxx_destruct
{

}

@end
