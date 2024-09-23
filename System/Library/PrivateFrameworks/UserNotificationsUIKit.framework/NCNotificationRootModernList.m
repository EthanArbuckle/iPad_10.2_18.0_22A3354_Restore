@implementation NCNotificationRootModernList

- (_TtC22UserNotificationsUIKit26ScrollViewExclusionManager)exclusionManager
{
  return (_TtC22UserNotificationsUIKit26ScrollViewExclusionManager *)*(id *)((char *)&self->super.super.isa + OBJC_IVAR___NCNotificationRootModernList_exclusionManager);
}

- (void)setExclusionManager:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___NCNotificationRootModernList_exclusionManager);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___NCNotificationRootModernList_exclusionManager) = (Class)a3;
  v3 = a3;

}

- (UITraitChangeRegistration)traitChangeRegistration
{
  return (UITraitChangeRegistration *)(id)swift_unknownObjectRetain();
}

- (void)setTraitChangeRegistration:(id)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___NCNotificationRootModernList_traitChangeRegistration) = (Class)a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (NSSet)blsAssertions
{
  void *v2;

  sub_1CFD40AFC(0, &qword_1EFBFB3B0);
  sub_1CFD534F8();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1CFD7C5BC();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (void)setBlsAssertions:(id)a3
{
  sub_1CFD40AFC(0, &qword_1EFBFB3B0);
  sub_1CFD534F8();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___NCNotificationRootModernList_blsAssertions) = (Class)sub_1CFD7C5C8();
  swift_bridgeObjectRelease();
}

- (BOOL)setNeedsScrollToTop
{
  return *((_BYTE *)&self->super.super.isa + OBJC_IVAR___NCNotificationRootModernList_setNeedsScrollToTop);
}

- (void)setSetNeedsScrollToTop:(BOOL)a3
{
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR___NCNotificationRootModernList_setNeedsScrollToTop) = a3;
}

- (BOOL)setNeedsScrollToNearestPage
{
  return *((_BYTE *)&self->super.super.isa + OBJC_IVAR___NCNotificationRootModernList_setNeedsScrollToNearestPage);
}

- (void)setSetNeedsScrollToNearestPage:(BOOL)a3
{
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR___NCNotificationRootModernList_setNeedsScrollToNearestPage) = a3;
}

- (int64_t)revealIndex
{
  return *(int64_t *)((char *)&self->super.super.isa + OBJC_IVAR___NCNotificationRootModernList_revealIndex);
}

- (void)setRevealIndex:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___NCNotificationRootModernList_revealIndex) = (Class)a3;
}

- (NCNotificationRootModernList)initWithListView:(id)a3
{
  NCNotificationRootModernList *result;

  sub_1CFD471F0(a3);
  return result;
}

- (void)expandHighlights
{
  uint64_t v3;
  NCNotificationRootModernList *v4;
  __int128 v5;
  uint64_t (*v6)();
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (sub_1CFD46678(2, *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___NCNotificationRootModernList_layout)) != 3)
  {
    *(_QWORD *)&v5 = 0x4000000000000003;
    *((_QWORD *)&v5 + 1) = v3;
    v6 = CGRectMake;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v4 = self;
    sub_1CFD478F8(&v5);

  }
}

- (int64_t)incomingCount
{
  NCNotificationRootModernList *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  NCNotificationRootModernList.incomingCount.getter();
  v4 = v3;

  return v4;
}

- (void)observeDebugLayoutGuides
{
  NCNotificationRootModernList *v2;

  v2 = self;
  sub_1CFD48020();

}

- (int64_t)displayStyle
{
  return -[NCNotificationRootList currentListDisplayStyleSetting](self, sel_currentListDisplayStyleSetting);
}

- (NSArray)sections
{
  NCNotificationRootModernList *v2;
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCNotificationRootModernList;
  v2 = self;
  v3 = -[NCNotificationRootList notificationListSections](&v6, sel_notificationListSections);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFB3C8);
  sub_1CFD7C520();

  v4 = (void *)sub_1CFD7C514();
  swift_bridgeObjectRelease();
  return (NSArray *)v4;
}

- (NCNotificationListViewProtocol)view
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NCNotificationRootModernList;
  return -[NCNotificationRootList rootListView](&v3, sel_rootListView);
}

- (NCNotificationListCache)cache
{
  return (NCNotificationListCache *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                            + OBJC_IVAR___NCNotificationRootModernList_cache));
}

- (NCNotificationListCache)supplementaryCache
{
  return (NCNotificationListCache *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                            + OBJC_IVAR___NCNotificationRootModernList_supplementaryCache));
}

- (id)initForTesting
{
  id result;

  result = (id)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1CFD52DEC(*(unint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___NCNotificationRootModernList__scrollState), *(uint64_t *)((char *)&self->super._currentListDisplayStyleSetting+ OBJC_IVAR___NCNotificationRootModernList__scrollState), *(_QWORD *)(&self->super._deviceAuthenticated + OBJC_IVAR___NCNotificationRootModernList__scrollState), *(_QWORD *)(&self->super._deferCurrentDigestPresentationForPersistedDataLoad+ OBJC_IVAR___NCNotificationRootModernList__scrollState), *(uint64_t *)((char *)&self->super._logDescription + OBJC_IVAR___NCNotificationRootModernList__scrollState), *(uint64_t *)((char *)&self->super._delegate + OBJC_IVAR___NCNotificationRootModernList__scrollState), (uint64_t (*)(uint64_t, uint64_t))sub_1CFD40A14);

}

- (void)_updateIndexForReveal
{
  NCNotificationRootModernList *v2;

  v2 = self;
  NCNotificationRootModernList._updateIndexForReveal()();

}

- (int64_t)_indexForReveal
{
  return -[NCNotificationRootModernList revealIndex](self, sel_revealIndex);
}

- (void)_setRevealed:(BOOL)a3 forSection:(id)a4
{
  NCNotificationRootModernList *v5;
  id v6;
  id v7;

  if (a4)
  {
    v5 = self;
    v6 = objc_msgSend((id)swift_unknownObjectRetain(), sel_listView);
    objc_msgSend(v6, sel_setRevealed_, 1);

    v7 = objc_msgSend(a4, sel_listView);
    objc_msgSend(v7, sel_setRevealPercentage_, 1.0);
    swift_unknownObjectRelease();

  }
}

- (double)scrollViewVisibleContentLayoutOffsetY
{
  double result;
  double v3;
  double v4;

  result = *(double *)((char *)&self->super._suggestionManager + OBJC_IVAR___NCNotificationRootModernList_layout);
  v3 = *(double *)((char *)&self->super._activeDNDModeConfiguration + OBJC_IVAR___NCNotificationRootModernList_layout);
  if (*((_BYTE *)&self->super._notificationListCache + OBJC_IVAR___NCNotificationRootModernList_layout))
    v3 = 0.0;
  v4 = *(double *)((char *)&self->super._supplementaryCache + OBJC_IVAR___NCNotificationRootModernList_layout) - v3;
  if (v4 < 0.0)
    v4 = 0.0;
  if (v4 >= result)
    v4 = *(double *)((char *)&self->super._suggestionManager + OBJC_IVAR___NCNotificationRootModernList_layout);
  if (result >= v4)
    return v4;
  return result;
}

- (void)updateListViewVisibleRectForSize:(CGSize)a3
{
  uint64_t v3;
  uint64_t v4;
  NCNotificationRootModernList *v5;

  *(CGSize *)((char *)&self->super._notificationSummaryCache + OBJC_IVAR___NCNotificationRootModernList_layout) = a3;
  v3 = *(_QWORD *)&a3.width;
  v4 = *(_QWORD *)&a3.height;
  v5 = self;
  sub_1CFD493CC(v3, v4, 0);

}

- (void)insertNotificationRequest:(id)a3
{
  id v4;
  NCNotificationRootModernList *v5;

  v4 = a3;
  v5 = self;
  NCNotificationRootModernList.insert(_:)(v4);

}

- (void)removeNotificationRequest:(id)a3
{
  id v5;
  NCNotificationRootModernList *v6;

  v5 = a3;
  v6 = self;
  NCNotificationRootModernList.remove(_:)(a3);

}

- (void)modifyNotificationRequest:(id)a3
{
  id v5;
  NCNotificationRootModernList *v6;

  v5 = a3;
  v6 = self;
  NCNotificationRootModernList.modifyNotificationRequest(_:)(a3);

}

- (BOOL)deviceAuthenticated
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NCNotificationRootModernList;
  return -[NCNotificationRootList deviceAuthenticated](&v3, sel_deviceAuthenticated);
}

- (void)setDeviceAuthenticated:(BOOL)a3
{
  _BOOL8 v3;
  NCNotificationRootModernList *v4;
  char v5;
  objc_super v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NCNotificationRootModernList;
  v4 = self;
  v5 = -[NCNotificationRootList deviceAuthenticated](&v7, sel_deviceAuthenticated);
  v6.receiver = v4;
  v6.super_class = (Class)NCNotificationRootModernList;
  -[NCNotificationRootList setDeviceAuthenticated:](&v6, sel_setDeviceAuthenticated_, v3);
  sub_1CFD4B4B4(v5);

}

- (id)notificationListView:(id)a3 topSpacingForItemAtIndex:(int64_t)a4
{
  NCNotificationRootModernList *v6;
  id v7;

  swift_unknownObjectRetain();
  v6 = self;
  v7 = sub_1CFD52C30(a4);
  swift_unknownObjectRelease();

  return v7;
}

- (double)footerViewHeightForNotificationList:(id)a3 withWidth:(double)a4
{
  return 0.0;
}

- (void)backlightChanged
{
  NCNotificationRootModernList *v2;

  v2 = self;
  sub_1CFD4B6C4();

}

- (void)notificationListWillLayoutSubviews
{
  NCNotificationRootModernList *v2;

  v2 = self;
  NCNotificationRootModernList.notificationListWillLayoutSubviews()();

}

- (void)notificationListDidLayoutSubviews
{
  NCNotificationRootModernList *v2;

  v2 = self;
  NCNotificationRootModernList.notificationListDidLayoutSubviews()();

}

- (void)didTapCountIndicator
{
  NCNotificationRootModernList *v2;

  v2 = self;
  sub_1CFD4BD2C(1, (id)1, 0, 0, 0);

}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  uint64_t v4;
  id v5;
  NCNotificationRootModernList *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;

  v4 = qword_1EFBFA938;
  v5 = a3;
  v6 = self;
  if (v4 != -1)
    swift_once();
  v7 = sub_1CFD7C0B8();
  __swift_project_value_buffer(v7, (uint64_t)qword_1EFBFDA10);
  v8 = sub_1CFD7C0A0();
  v9 = sub_1CFD7C5E0();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1CFC3D000, v8, v9, "ScrollView requesting scrollToTop", v10, 2u);
    MEMORY[0x1D17DD5B8](v10, -1, -1);
  }

  return 0;
}

- (void)scrollViewDidScroll:(id)a3
{
  UIScrollView *v4;
  NCNotificationRootModernList *v5;

  v4 = (UIScrollView *)a3;
  v5 = self;
  NCNotificationRootModernList.scrollViewDidScroll(_:)(v4);

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  NCNotificationRootModernList *v5;

  v4 = a3;
  v5 = self;
  if ((objc_msgSend(v4, sel_isDecelerating) & 1) == 0)
    -[NCNotificationRootList _signpostScrollingBegan:](v5, sel__signpostScrollingBegan_, 1);
  -[NCNotificationRootList _cancelTouchesOnLiveActivities:](v5, sel__cancelTouchesOnLiveActivities_, 1);

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double x;
  id v9;
  NCNotificationRootModernList *v10;

  y = a4.y;
  x = a4.x;
  v9 = a3;
  v10 = self;
  NCNotificationRootModernList.scrollViewWillEndDragging(_:withVelocity:targetContentOffset:)(v9, (uint64_t)a5, x, y);

}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  UIScrollView *v4;
  NCNotificationRootModernList *v5;

  v4 = (UIScrollView *)a3;
  v5 = self;
  NCNotificationRootModernList.scrollViewDidEndScrollingAnimation(_:)(v4);

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  UIScrollView *v4;
  NCNotificationRootModernList *v5;

  v4 = (UIScrollView *)a3;
  v5 = self;
  NCNotificationRootModernList.scrollViewDidEndDecelerating(_:)(v4);

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6;
  NCNotificationRootModernList *v7;
  NCNotificationRootModernList *v8;

  v6 = a3;
  v7 = self;
  v8 = v7;
  if (!a4)
  {
    -[NCNotificationRootList _signpostScrollingBegan:](v7, sel__signpostScrollingBegan_, 0);
    v7 = v8;
  }
  -[NCNotificationRootList _cancelTouchesOnLiveActivities:](v7, sel__cancelTouchesOnLiveActivities_, 0);

}

- (BOOL)shouldScrollToTopForNotificationListBaseComponent:(id)a3
{
  NCNotificationRootModernList *v4;
  NCNotificationListViewProtocol *v5;
  double v6;
  double v7;
  NCNotificationListViewProtocol *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double Height;
  CGRect v19;

  swift_unknownObjectRetain();
  v4 = self;
  v5 = -[NCNotificationRootModernList view](v4, sel_view);
  -[NCNotificationListViewProtocol contentSize](v5, sel_contentSize);
  v7 = v6;

  v8 = -[NCNotificationRootModernList view](v4, sel_view);
  -[NCNotificationListViewProtocol frame](v8, sel_frame);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v19.origin.x = v10;
  v19.origin.y = v12;
  v19.size.width = v14;
  v19.size.height = v16;
  Height = CGRectGetHeight(v19);
  swift_unknownObjectRelease();

  return v7 < Height;
}

- (void)notificationListBaseComponent:(id)a3 requestsScrollingToContentOffset:(double)a4 withCompletion:(id)a5
{
  void *v7;
  uint64_t v8;
  NCNotificationRootModernList *v9;

  v7 = _Block_copy(a5);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v7;
  swift_unknownObjectRetain();
  v9 = self;
  sub_1CFD530C4((uint64_t)sub_1CFD534F0, v8, a4);
  swift_unknownObjectRelease();

  swift_release();
}

- (void)supplementaryViewSectionDidChangeContent:(id)a3
{
  NCNotificationListSupplementaryViewsSection *v4;
  NCNotificationRootModernList *v5;

  v4 = (NCNotificationListSupplementaryViewsSection *)a3;
  v5 = self;
  NCNotificationRootModernList.supplementaryViewSectionDidChangeContent(_:)(v4);

}

@end
