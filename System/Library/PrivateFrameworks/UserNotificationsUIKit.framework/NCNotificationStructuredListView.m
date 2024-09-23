@implementation NCNotificationStructuredListView

- (UIView)listView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR___NCNotificationStructuredListView_listView));
}

- (void)setListView:(id)a3
{
  sub_1CFD76708((char *)self, (uint64_t)a2, a3, &OBJC_IVAR___NCNotificationStructuredListView_listView, sub_1CFD764B8);
}

- (UIView)footerView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR___NCNotificationStructuredListView_footerView));
}

- (void)setFooterView:(id)a3
{
  sub_1CFD76708((char *)self, (uint64_t)a2, a3, &OBJC_IVAR___NCNotificationStructuredListView_footerView, sub_1CFD7676C);
}

- (UIEdgeInsets)footerInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR___NCNotificationStructuredListView_footerInsets);
  v3 = *(double *)((char *)&self->super.super._responderFlags + OBJC_IVAR___NCNotificationStructuredListView_footerInsets);
  v4 = *(double *)((char *)&self->super.super.__layeringSceneIdentity
                 + OBJC_IVAR___NCNotificationStructuredListView_footerInsets);
  v5 = *(double *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints
                 + OBJC_IVAR___NCNotificationStructuredListView_footerInsets);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setFooterInsets:(UIEdgeInsets)a3
{
  *(UIEdgeInsets *)((char *)&self->super.super.super.isa + OBJC_IVAR___NCNotificationStructuredListView_footerInsets) = a3;
  -[NCNotificationStructuredListView setNeedsLayout](self, sel_setNeedsLayout);
}

- (NSNumber)distanceScrolledBeyondBottomOfContent
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR___NCNotificationStructuredListView_distanceScrolledBeyondBottomOfContent));
}

- (void)setDistanceScrolledBeyondBottomOfContent:(id)a3
{
  void *v4;
  NCNotificationStructuredListView *v5;
  id v6;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___NCNotificationStructuredListView_distanceScrolledBeyondBottomOfContent);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR___NCNotificationStructuredListView_distanceScrolledBeyondBottomOfContent) = (Class)a3;
  v6 = a3;
  v5 = self;

  sub_1CFD768FC();
}

- (void)didExitAlwaysOn
{
  NCNotificationStructuredListView *v2;

  v2 = self;
  sub_1CFD76B20();

}

- (NCNotificationStructuredListViewDelegate)delegate
{
  return (NCNotificationStructuredListViewDelegate *)(id)MEMORY[0x1D17DD63C]((char *)self+ OBJC_IVAR___NCNotificationStructuredListView_delegate, a2);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (void)layoutSubviews
{
  NCNotificationStructuredListView *v2;

  v2 = self;
  NCNotificationStructuredListView.layoutSubviews()();

}

- (BOOL)adjustForContentSizeCategoryChange
{
  return sub_1CFD77128(self, (uint64_t)a2, (SEL *)&selRef_adjustForContentSizeCategoryChange);
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return sub_1CFD77128(self, (uint64_t)a2, (SEL *)&selRef_adjustsFontForContentSizeCategory);
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  _BOOL8 v3;
  NCNotificationStructuredListView *v4;
  id v5;

  v3 = a3;
  v4 = self;
  v5 = sub_1CFD76628();
  objc_msgSend(v5, sel_setAdjustsFontForContentSizeCategory_, v3);

}

- (void)adjustForLegibilitySettingsChange:(id)a3
{
  id v4;
  NCNotificationStructuredListView *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1CFD76628();
  objc_msgSend(v6, sel_adjustForLegibilitySettingsChange_, v4);

}

- (NCNotificationStructuredListView)initWithFrame:(CGRect)a3
{
  return (NCNotificationStructuredListView *)NCNotificationStructuredListView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (NCNotificationStructuredListView)initWithCoder:(id)a3
{
  return (NCNotificationStructuredListView *)NCNotificationStructuredListView.init(coder:)(a3);
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___NCNotificationStructuredListView_distanceScrolledBeyondBottomOfContent));
  sub_1CFD3E3A0((uint64_t)self + OBJC_IVAR___NCNotificationStructuredListView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___NCNotificationStructuredListView_internalToolsOverlayView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___NCNotificationStructuredListView____lazy_storage___revealHintView));
}

@end
