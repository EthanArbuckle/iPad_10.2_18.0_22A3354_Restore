@implementation NCNotificationListHighlights

- (BOOL)visibleRectIsBounds
{
  double v2;

  -[NCNotificationListHighlights expandedPercentage](self, sel_expandedPercentage);
  return v2 < 0.1;
}

- (void)set_mappedExpandedPercentage:(double)a3
{
  double v3;
  NCNotificationListHighlights *v4;

  v3 = *(double *)((char *)&self->super.super.isa + OBJC_IVAR___NCNotificationListHighlights__mappedExpandedPercentage);
  *(double *)((char *)&self->super.super.isa + OBJC_IVAR___NCNotificationListHighlights__mappedExpandedPercentage) = a3;
  v4 = self;
  sub_1CFD59994(v3);

}

- (double)expandedPercentage
{
  return *(double *)((char *)&self->super.super.isa + OBJC_IVAR___NCNotificationListHighlights__mappedExpandedPercentage);
}

- (void)setExpandedPercentage:(double)a3
{
  NCNotificationListHighlights *v4;

  v4 = self;
  sub_1CFD5A220(a3);

}

- (BOOL)isExpanded
{
  return *((_BYTE *)&self->super.super.isa + OBJC_IVAR___NCNotificationListHighlights_isExpanded);
}

- (void)setIsExpanded:(BOOL)a3
{
  _BOOL8 v3;
  NCNotificationListHighlights *v4;

  v3 = a3;
  v4 = self;
  sub_1CFD5A3C4(v3);

}

- (BOOL)isOnScreen
{
  return *((_BYTE *)&self->super.super.isa + OBJC_IVAR___NCNotificationListHighlights_isOnScreen);
}

- (void)setIsOnScreen:(BOOL)a3
{
  NCNotificationListHighlights *v4;

  v4 = self;
  sub_1CFD5A4D8(a3);

}

- (double)expandedHeight
{
  NCNotificationListHighlights *v2;
  double v3;
  double v4;

  v2 = self;
  NCNotificationListHighlights.expandedHeight.getter();
  v4 = v3;

  return v4;
}

- (double)collapsedHeight
{
  NCNotificationListHighlights *v2;
  double v3;

  v2 = self;
  v3 = NCNotificationListHighlights.collapsedHeight.getter();

  return v3;
}

- (NCNotificationListHighlights)initWithTitle:(id)a3 sectionType:(unint64_t)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a3)
  {
    v5 = sub_1CFD7C4C0();
  }
  else
  {
    v5 = 0;
    v6 = 0;
  }
  return (NCNotificationListHighlights *)sub_1CFD5AC20(v5, v6, a4);
}

- (void)collapse
{
  NCNotificationListHighlights *v2;

  v2 = self;
  sub_1CFD5979C();

}

- (_TtC22UserNotificationsUIKit19HighlightsTitleView)headerLabel
{
  return (_TtC22UserNotificationsUIKit19HighlightsTitleView *)*(id *)((char *)&self->super.super.isa + OBJC_IVAR___NCNotificationListHighlights_headerLabel);
}

- (_TtC22UserNotificationsUIKit23HighlightsShowMoreLabel)showMoreLabel
{
  return (_TtC22UserNotificationsUIKit23HighlightsShowMoreLabel *)*(id *)((char *)&self->super.super.isa + OBJC_IVAR___NCNotificationListHighlights_showMoreLabel);
}

- (NCNotificationSummaryBuilder)showMoreSummaryBuilder
{
  return (NCNotificationSummaryBuilder *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                 + OBJC_IVAR___NCNotificationListHighlights_showMoreSummaryBuilder));
}

- (NSArray)groups
{
  NCNotificationListHighlights *v2;
  NSArray *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCNotificationListHighlights;
  v2 = self;
  v3 = -[NCNotificationStructuredSectionList allNotificationGroups](&v6, sel_allNotificationGroups);
  sub_1CFD40AFC(0, &qword_1EFBFB130);
  sub_1CFD7C520();

  v4 = (void *)sub_1CFD7C514();
  swift_bridgeObjectRelease();
  return (NSArray *)v4;
}

- (NSArray)separators
{
  void *v2;

  type metadata accessor for HighlightsSeparatorView();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1CFD7C514();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setSeparators:(id)a3
{
  type metadata accessor for HighlightsSeparatorView();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___NCNotificationListHighlights_separators) = (Class)sub_1CFD7C520();
  swift_bridgeObjectRelease();
}

- (NCNotificationListCache)cache
{
  return (NCNotificationListCache *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                            + OBJC_IVAR___NCNotificationListHighlights_cache));
}

- (_TtC22UserNotificationsUIKit24HighlightsBackgroundView)backgroundView
{
  NCNotificationListHighlights *v2;
  char *v3;

  v2 = self;
  v3 = sub_1CFD5BFF4();

  return (_TtC22UserNotificationsUIKit24HighlightsBackgroundView *)v3;
}

- (void)setBackgroundView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR___NCNotificationListHighlights____lazy_storage___backgroundView);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___NCNotificationListHighlights____lazy_storage___backgroundView) = (Class)a3;
  v3 = a3;

}

- (unint64_t)_groupingSettingForSectionIdentifier:(id)a3
{
  void *v4;
  NCNotificationListHighlights *v5;
  id v6;
  unsigned int v7;
  void *v8;
  id v9;
  objc_super v11;

  sub_1CFD7C4C0();
  v4 = (void *)objc_opt_self();
  v5 = self;
  v6 = objc_msgSend(v4, sel_standardDefaults);
  v7 = objc_msgSend(v6, sel_allowStackingInHighlights);

  if (v7)
  {
    v8 = (void *)sub_1CFD7C49C();
    v11.receiver = v5;
    v11.super_class = (Class)NCNotificationListHighlights;
    v9 = -[NCNotificationStructuredSectionList _groupingSettingForSectionIdentifier:](&v11, sel__groupingSettingForSectionIdentifier_, v8);

    swift_bridgeObjectRelease();
  }
  else
  {

    swift_bridgeObjectRelease();
    return 2;
  }
  return (unint64_t)v9;
}

- (void)insertNotificationRequest:(id)a3
{
  sub_1CFD5C858(self, (uint64_t)a2, a3, (const char **)&selRef_insertNotificationRequest_);
}

- (void)removeNotificationRequest:(id)a3
{
  id v5;
  NCNotificationListHighlights *v6;

  v5 = a3;
  v6 = self;
  NCNotificationListHighlights.remove(_:)(a3);

}

- (void)modifyNotificationRequest:(id)a3
{
  sub_1CFD5C858(self, (uint64_t)a2, a3, (const char **)&selRef_modifyNotificationRequest_);
}

- (void)reloadNotificationRequest:(id)a3
{
  sub_1CFD5C858(self, (uint64_t)a2, a3, (const char **)&selRef_reloadNotificationRequest_);
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___NCNotificationListHighlights____lazy_storage___backgroundView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (id)notificationListView:(id)a3 topSpacingForItemAtIndex:(int64_t)a4
{
  NCNotificationListHighlights *v6;
  id v7;

  swift_unknownObjectRetain();
  v6 = self;
  v7 = sub_1CFD63B4C(a4);
  swift_unknownObjectRelease();

  return v7;
}

- (double)footerViewHeightForNotificationList:(id)a3 withWidth:(double)a4
{
  return sub_1CFD5CD20(self, (uint64_t)a2, (uint64_t)a3, sub_1CFD3C7A0);
}

- (double)notificationListView:(id)a3 heightForItemAtIndex:(int64_t)a4 withWidth:(double)a5
{
  NCNotificationListHighlights *v7;
  double v8;

  swift_unknownObjectRetain();
  v7 = self;
  v8 = sub_1CFD63C90(a4);
  swift_unknownObjectRelease();

  return v8;
}

- (id)notificationListView:(id)a3 viewForItemAtIndex:(int64_t)a4
{
  NCNotificationListHighlights *v6;
  NSArray *v7;
  uint64_t v8;
  id result;
  id v10;
  void *v11;
  id v12;

  swift_unknownObjectRetain();
  v6 = self;
  v7 = -[NCNotificationListHighlights groups](v6, sel_groups);
  sub_1CFD40AFC(0, &qword_1EFBFB130);
  v8 = sub_1CFD7C520();

  if ((v8 & 0xC000000000000001) != 0)
  {
    v10 = (id)MEMORY[0x1D17DC6A0](a4, v8);
    goto LABEL_5;
  }
  if (a4 < 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10) > (unint64_t)a4)
  {
    v10 = *(id *)(v8 + 8 * a4 + 32);
LABEL_5:
    v11 = v10;
    swift_bridgeObjectRelease();
    v12 = objc_msgSend(v11, sel_listView);
    swift_unknownObjectRelease();

    objc_opt_self();
    return (id)swift_dynamicCastObjCClassUnconditional();
  }
  __break(1u);
  return result;
}

- (id)headerViewForNotificationList:(id)a3
{
  return -[NCNotificationListHighlights headerLabel](self, sel_headerLabel, a3);
}

- (double)headerViewHeightForNotificationList:(id)a3 withWidth:(double)a4
{
  return sub_1CFD5CD20(self, (uint64_t)a2, (uint64_t)a3, sub_1CFD3C540);
}

- (int64_t)notificationListViewNumberOfItems:(id)a3
{
  NCNotificationListHighlights *v4;
  NSArray *v5;
  unint64_t v6;
  int64_t v7;

  swift_unknownObjectRetain();
  v4 = self;
  v5 = -[NCNotificationListHighlights groups](v4, sel_groups);
  sub_1CFD40AFC(0, &qword_1EFBFB130);
  v6 = sub_1CFD7C520();

  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_1CFD7C82C();
    swift_unknownObjectRelease();

    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_unknownObjectRelease();

  }
  swift_bridgeObjectRelease();
  return v7;
}

- (void)notificationListDidLayoutSubviews
{
  NCNotificationListHighlights *v2;
  _TtC22UserNotificationsUIKit24HighlightsBackgroundView *v3;

  v2 = self;
  v3 = -[NCNotificationListHighlights backgroundView](v2, sel_backgroundView);
  -[HighlightsBackgroundView setNeedsLayout](v3, sel_setNeedsLayout);

}

- (id)overlayViewForNotificationList:(id)a3
{
  return -[NCNotificationListHighlights backgroundView](self, sel_backgroundView, a3);
}

- (void)prepareForUIAppear
{
  NCNotificationListHighlights *v2;
  _TtC22UserNotificationsUIKit24HighlightsBackgroundView *v3;

  v2 = self;
  v3 = -[NCNotificationListHighlights backgroundView](v2, sel_backgroundView);
  sub_1CFD55234(*(uint64_t *)((char *)&v3->super.super.super.isa+ OBJC_IVAR____TtC22UserNotificationsUIKit24HighlightsBackgroundView_currentLightEffectsState), *((_BYTE *)&v3->super.super._responderFlags+ OBJC_IVAR____TtC22UserNotificationsUIKit24HighlightsBackgroundView_currentLightEffectsState));

}

- (id)notificationGroupList:(id)a3 requestsAuxiliaryOptionsContentProviderForNotificationRequest:(id)a4 isLongLook:(BOOL)a5
{
  return 0;
}

- (void)groupListDidLayout:(id)a3
{
  id v4;
  NCNotificationListHighlights *v5;
  _TtC22UserNotificationsUIKit24HighlightsBackgroundView *v6;

  v4 = a3;
  v5 = self;
  v6 = -[NCNotificationListHighlights backgroundView](v5, sel_backgroundView);
  -[HighlightsBackgroundView setNeedsLayout](v6, sel_setNeedsLayout);

}

- (void)notificationListPresentableGroup:(id)a3 requestsScrollToTopOfCollectionWithCompletion:(id)a4
{
  void *v6;
  id v7;
  NCNotificationListHighlights *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_1CFD63D90(v7, v8, (void (**)(_QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (BOOL)shouldAllowRestackingForNotificationListPresentableGroup:(id)a3
{
  return 0;
}

- (BOOL)shouldNotificationGroupListPanHorizontally:(id)a3
{
  double v3;

  -[NCNotificationListHighlights expandedPercentage](self, sel_expandedPercentage, a3);
  return v3 > 0.99;
}

- (void)notificationListPresentableGroupDidChangeGroupedState:(id)a3
{
  NCNotificationListPresentableGroup *v4;
  NCNotificationListHighlights *v5;

  v4 = (NCNotificationListPresentableGroup *)a3;
  v5 = self;
  NCNotificationListHighlights.notificationListPresentableGroupDidChangeGroupedState(_:)(v4);

}

@end
