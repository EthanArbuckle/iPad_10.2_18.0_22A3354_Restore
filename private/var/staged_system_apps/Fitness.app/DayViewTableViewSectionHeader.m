@implementation DayViewTableViewSectionHeader

- (CGSize)intrinsicContentSize
{
  void *v3;
  _TtC10FitnessApp29DayViewTableViewSectionHeader *v4;
  id v5;
  double v6;
  double v7;
  id v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGFloat Width;
  double v18;
  double v19;
  CGSize result;
  CGRect v21;

  v3 = (void *)objc_opt_self(UIFont);
  v4 = self;
  v5 = objc_msgSend(v3, "preferredFontForTextStyle:", UIFontTextStyleBody);
  objc_msgSend(v5, "_scaledValueForValue:", 44.0);
  v7 = v6;

  v8 = objc_msgSend((id)objc_opt_self(UIScreen), "mainScreen");
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v21.origin.x = v10;
  v21.origin.y = v12;
  v21.size.width = v14;
  v21.size.height = v16;
  Width = CGRectGetWidth(v21);

  v18 = Width;
  v19 = v7;
  result.height = v19;
  result.width = v18;
  return result;
}

- (_TtC10FitnessApp29DayViewTableViewSectionHeader)initWithFrame:(CGRect)a3
{
  return (_TtC10FitnessApp29DayViewTableViewSectionHeader *)sub_1004FEF50(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)updateFonts
{
  _TtC10FitnessApp29DayViewTableViewSectionHeader *v2;

  v2 = self;
  sub_1004FF21C();

}

- (_TtC10FitnessApp29DayViewTableViewSectionHeader)initWithCoder:(id)a3
{
  sub_1004FF7A0(a3);
  return 0;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp29DayViewTableViewSectionHeader_label));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp29DayViewTableViewSectionHeader____lazy_storage___divider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp29DayViewTableViewSectionHeader_labelBaseline));
}

@end
