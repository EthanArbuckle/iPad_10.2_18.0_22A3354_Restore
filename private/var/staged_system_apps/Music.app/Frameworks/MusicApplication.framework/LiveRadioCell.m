@implementation LiveRadioCell

- (_TtC16MusicApplication13LiveRadioCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication13LiveRadioCell *)sub_33AD34(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication13LiveRadioCell *v6;

  v5 = a3;
  v6 = self;
  sub_33BA74((uint64_t)a3);

}

- (_TtC16MusicApplication13LiveRadioCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_33F6B4();
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  sub_188BF8(self, (uint64_t)a2, (SEL *)&selRef_frame);
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
  _TtC16MusicApplication13LiveRadioCell *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_33D65C((SEL *)&selRef_frame, (SEL *)&selRef_setFrame_, x, y, width, height);

}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  sub_188BF8(self, (uint64_t)a2, (SEL *)&selRef_bounds);
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
  _TtC16MusicApplication13LiveRadioCell *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_33D65C((SEL *)&selRef_bounds, (SEL *)&selRef_setBounds_, x, y, width, height);

}

- (void)layoutSubviews
{
  _TtC16MusicApplication13LiveRadioCell *v2;

  v2 = self;
  sub_33D768();

}

- (NSString)description
{
  _TtC16MusicApplication13LiveRadioCell *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_33E0E4();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (NSString)accessibilityHeaderTitle
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication13LiveRadioCell_headerTitle);
}

- (NSString)accessibilityHeaderSubtitle
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication13LiveRadioCell_headerSubtitle);
}

- (NSString)accessibilityHeadline
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication13LiveRadioCell_headline);
}

- (NSString)accessibilityTitle
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication13LiveRadioCell_title);
}

- (NSString)accessibilitySubtitle
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication13LiveRadioCell_subtitle);
}

- (UIButton)accessibilityAccessoryButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                                                             + OBJC_IVAR____TtC16MusicApplication13LiveRadioCell_accessoryButton));
}

- (_TtC11MusicCoreUI12SymbolButton)accessibilityAccessoryCalendarButton
{
  return (_TtC11MusicCoreUI12SymbolButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                                                                                    + OBJC_IVAR____TtC16MusicApplication13LiveRadioCell_accessoryCalendarButton));
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication13LiveRadioCell_headerTitle]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication13LiveRadioCell_headerSubtitle]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication13LiveRadioCell_headline]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication13LiveRadioCell_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication13LiveRadioCell_subtitle]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication13LiveRadioCell_accessoryButtonTitle]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication13LiveRadioCell_accessoryButtonHandler), *(_QWORD *)&self->super.super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication13LiveRadioCell_accessoryButtonHandler]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication13LiveRadioCell_videoLooperDidChangeHandler), *(_QWORD *)&self->super.super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication13LiveRadioCell_videoLooperDidChangeHandler]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication13LiveRadioCell_videoLooperDidFailHandler), *(_QWORD *)&self->super.super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication13LiveRadioCell_videoLooperDidFailHandler]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication13LiveRadioCell_isPlayingDidChangeHandler), *(_QWORD *)&self->super.super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication13LiveRadioCell_isPlayingDidChangeHandler]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication13LiveRadioCell_headerTextStackView));
  v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplication13LiveRadioCell_headerTextComponents);
  v4 = *(_QWORD *)&self->super.super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication13LiveRadioCell_headerTextComponents];
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication13LiveRadioCell_headerTextComponents
                                                                          + 8]);
  swift_release(v4);
  swift_release(v3);
  v5 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplication13LiveRadioCell_textComponents);
  v6 = *(_QWORD *)&self->super.super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication13LiveRadioCell_textComponents];
  v7 = *(_QWORD *)&self->super.super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication13LiveRadioCell_textComponents
                                                     + 8];
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication13LiveRadioCell_textComponents
                                                                          + 16]);
  swift_release(v7);
  swift_release(v6);
  swift_release(v5);
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication13LiveRadioCell_accessoryButtonSizingTextComponent));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication13LiveRadioCell_headerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication13LiveRadioCell____lazy_storage___topHairlineView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication13LiveRadioCell_accessoryButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication13LiveRadioCell_accessoryCalendarButton));
}

@end
