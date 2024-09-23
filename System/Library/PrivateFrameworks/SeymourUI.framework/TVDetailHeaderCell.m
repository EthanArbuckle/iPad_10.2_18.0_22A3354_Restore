@implementation TVDetailHeaderCell

- (BOOL)canBecomeFocused
{
  void *v2;
  _TtC9SeymourUI18TVDetailHeaderCell *v3;
  id v4;
  unint64_t v5;
  uint64_t v6;

  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI18TVDetailHeaderCell_buttonStackView);
  v3 = self;
  v4 = objc_msgSend(v2, sel_arrangedSubviews);
  sub_22B0F1718(0, (unint64_t *)&qword_255B853E0);
  v5 = sub_22BA808BC();

  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    v6 = sub_22BA815E8();

    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);

  }
  swift_bridgeObjectRelease();
  return v6 == 0;
}

- (_TtC9SeymourUI18TVDetailHeaderCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI18TVDetailHeaderCell *)sub_22B3FB168(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI18TVDetailHeaderCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B3FDFA8();
}

- (void)prepareForReuse
{
  _TtC9SeymourUI18TVDetailHeaderCell *v2;

  v2 = self;
  sub_22B3FC13C();

}

- (void)layoutSubviews
{
  _TtC9SeymourUI18TVDetailHeaderCell *v2;

  v2 = self;
  sub_22B3FC2A4();

}

- (void)handleTappedButton:(id)a3
{
  id v4;
  _TtC9SeymourUI18TVDetailHeaderCell *v5;

  v4 = a3;
  v5 = self;
  sub_22B3FD0E0((uint64_t)v4);

}

- (UITextView)accessibilityDescriptionLabel
{
  return (UITextView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                               + OBJC_IVAR____TtC9SeymourUI18TVDetailHeaderCell_descriptionTextView));
}

- (UITextView)accessibilityTraitsLabel
{
  return (UITextView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                               + OBJC_IVAR____TtC9SeymourUI18TVDetailHeaderCell_traitsTextView));
}

- (UILabel)accessibilityCaptionTagsLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC9SeymourUI18TVDetailHeaderCell_captionTagsLabel));
}

- (NSArray)accessibilityMediaTags
{
  void *v2;

  if (*(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI18TVDetailHeaderCell_accessibilityMediaTags))
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_22BA808A4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

- (void)setAccessibilityMediaTags:(id)a3
{
  objc_class *v4;

  if (a3)
    v4 = (objc_class *)sub_22BA808BC();
  else
    v4 = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI18TVDetailHeaderCell_accessibilityMediaTags) = v4;
  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI18TVDetailHeaderCell_delegate);
  sub_22B0FB1DC((uint64_t)self + OBJC_IVAR____TtC9SeymourUI18TVDetailHeaderCell_itemInfo, &qword_255B861D0);
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI18TVDetailHeaderCell_onElementAppearance));
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI18TVDetailHeaderCell_onElementDisappearance));
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI18TVDetailHeaderCell_onVisibleBoundsChange));
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI18TVDetailHeaderCell_onImpressionableBoundsChange));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18TVDetailHeaderCell_buttonStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18TVDetailHeaderCell_descriptionStack));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18TVDetailHeaderCell_descriptionTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18TVDetailHeaderCell_traitsTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18TVDetailHeaderCell_captionTagsLabel));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18TVDetailHeaderCell_focusContainerGuide));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18TVDetailHeaderCell_traitsWidthConstraint));
  swift_bridgeObjectRelease();
}

@end
