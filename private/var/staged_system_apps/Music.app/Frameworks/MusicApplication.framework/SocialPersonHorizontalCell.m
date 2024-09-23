@implementation SocialPersonHorizontalCell

- (_TtC16MusicApplication26SocialPersonHorizontalCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication26SocialPersonHorizontalCell *)sub_1D21B4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication26SocialPersonHorizontalCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D421C();
}

- (void)layoutSubviews
{
  _TtC16MusicApplication26SocialPersonHorizontalCell *v2;

  v2 = self;
  sub_1D2C88();

}

- (NSString)accessibilityPersonName
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication26SocialPersonHorizontalCell_name);
}

- (NSString)accessibilityPersonSubtitle
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication26SocialPersonHorizontalCell_subtitle);
}

- (MPButton)accessibilityApproveButton
{
  _TtC16MusicApplication26SocialPersonHorizontalCell *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1D3328();
  v4 = v3;

  return (MPButton *)v4;
}

- (MPButton)accessibilityDeclineButton
{
  _TtC16MusicApplication26SocialPersonHorizontalCell *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1D3614();
  v4 = v3;

  return (MPButton *)v4;
}

- (UIControl)accessibilityFollowButton
{
  return (UIControl *)objc_retainAutoreleaseReturnValue(*(id *)(*(_QWORD *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication26SocialPersonHorizontalCell_relationshipButtonController]
                                                              + 160));
}

- (BOOL)accessibilityIsFollowRequest
{
  return self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication26SocialPersonHorizontalCell_layoutStyle];
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;

  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication26SocialPersonHorizontalCell_name]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication26SocialPersonHorizontalCell_subtitle]);
  sub_5C198(*(_QWORD *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication26SocialPersonHorizontalCell_approveRequestHandler], *(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication26SocialPersonHorizontalCell_approveRequestHandler]);
  sub_5C198(*(_QWORD *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication26SocialPersonHorizontalCell_declineRequestHandler], *(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication26SocialPersonHorizontalCell_declineRequestHandler]);
  swift_release(*(_QWORD *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication26SocialPersonHorizontalCell_relationshipButtonController]);
  v3 = *(_QWORD *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication26SocialPersonHorizontalCell_textComponents];
  v4 = *(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication26SocialPersonHorizontalCell_textComponents];
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication26SocialPersonHorizontalCell_textComponents
                                                                    + 8]);
  swift_release(v4);
  swift_release(v3);

}

@end
