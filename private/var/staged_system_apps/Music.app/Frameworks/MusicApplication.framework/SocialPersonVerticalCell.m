@implementation SocialPersonVerticalCell

- (_TtC16MusicApplication24SocialPersonVerticalCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication24SocialPersonVerticalCell *)sub_2A81E0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication24SocialPersonVerticalCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2AB11C();
}

- (void)layoutSubviews
{
  _TtC16MusicApplication24SocialPersonVerticalCell *v2;

  v2 = self;
  sub_2A9120();

}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  sub_2A9968(self, (uint64_t)a2, (SEL *)&selRef_frame);
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
  _TtC16MusicApplication24SocialPersonVerticalCell *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_2A9A20((SEL *)&selRef_frame, (SEL *)&selRef_setFrame_, x, y, width, height);

}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  sub_2A9968(self, (uint64_t)a2, (SEL *)&selRef_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC16MusicApplication24SocialPersonVerticalCell *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_2A9A20((SEL *)&selRef_bounds, (SEL *)&selRef_setBounds_, x, y, width, height);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication24SocialPersonVerticalCell *v6;

  v5 = a3;
  v6 = self;
  sub_2A9B44(a3);

}

- (NSString)accessibilityPersonName
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication24SocialPersonVerticalCell_title);
}

- (NSString)accessibilityPersonSubtitle
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication24SocialPersonVerticalCell_subtitle);
}

- (MPButton)accessibilityCloseButton
{
  _TtC16MusicApplication24SocialPersonVerticalCell *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_2AA204();
  v4 = v3;

  return (MPButton *)v4;
}

- (UIControl)accessibilityFollowButton
{
  return (UIControl *)objc_retainAutoreleaseReturnValue((*(id **)((char *)&self->super.super.super.super.super.super.isa
                                                                + OBJC_IVAR____TtC16MusicApplication24SocialPersonVerticalCell_relationshipButtonController))[20]);
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;

  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication24SocialPersonVerticalCell_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication24SocialPersonVerticalCell_subtitle]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication24SocialPersonVerticalCell_buttonText]);
  swift_release(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication24SocialPersonVerticalCell_onCloseButtonTouch]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication24SocialPersonVerticalCell_networkArtworkCatalog));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication24SocialPersonVerticalCell_relationshipButtonController));
  v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplication24SocialPersonVerticalCell_textComponents);
  v4 = *(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication24SocialPersonVerticalCell_textComponents];
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication24SocialPersonVerticalCell_textComponents
                                                                    + 8]);
  swift_release(v4);
  swift_release(v3);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication24SocialPersonVerticalCell____lazy_storage___button));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication24SocialPersonVerticalCell_buttonControlHandler));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication24SocialPersonVerticalCell____lazy_storage___platterView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication24SocialPersonVerticalCell____lazy_storage___closeButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication24SocialPersonVerticalCell_measurementStackView));
}

@end
