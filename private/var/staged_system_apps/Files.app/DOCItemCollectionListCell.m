@implementation DOCItemCollectionListCell

- (void)didMoveToWindow
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCItemCollectionListCell(0);
  v2 = v3.receiver;
  -[DOCItemCollectionListCell didMoveToWindow](&v3, "didMoveToWindow");
  sub_10007B338();

}

- (void)effectiveAppearanceDidChange:(id)a3
{
  id v4;
  _TtC5Files25DOCItemCollectionListCell *v5;

  v4 = a3;
  v5 = self;
  sub_10004A62C(v4);

}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC5Files25DOCItemCollectionListCell *v9;
  uint64_t v10;

  v5 = type metadata accessor for UICellConfigurationState(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_10006BA4C((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  CGFloat height;
  CGFloat width;
  _QWORD *v7;
  double v8;
  double v9;
  _BYTE v10[24];
  CGSize result;

  height = a3.height;
  width = a3.width;
  v7 = (Class *)((char *)&self->super.super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC5Files21DOCItemCollectionCell_cellContent);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC5Files21DOCItemCollectionCell_cellContent, v10, 0, 0);
  if (*v7)
    height = *(double *)(*v7 + OBJC_IVAR____TtC5Files28DOCItemCollectionCellContent_minimumRowHeight);
  v8 = width;
  v9 = height;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)tintColorDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCItemCollectionListCell(0);
  v2 = v3.receiver;
  -[DOCItemCollectionListCell tintColorDidChange](&v3, "tintColorDidChange");
  objc_msgSend(v2, "setNeedsUpdateConfiguration", v3.receiver, v3.super_class);

}

- (id)accessibilitySubtitleLabel
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                                                 + OBJC_IVAR____TtC5Files25DOCItemCollectionListCell_subtitleLabel));
}

- (id)accessibilityTagView
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                                                 + OBJC_IVAR____TtC5Files25DOCItemCollectionListCell_tagView));
}

- (id)accessibilityDateLabel
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                                                 + OBJC_IVAR____TtC5Files25DOCItemCollectionListCell_dateLabel));
}

- (id)accessibilityStatusView
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                                                 + OBJC_IVAR____TtC5Files25DOCItemCollectionListCell_statusView));
}

- (id)accessibilitySizeLabel
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                                                 + OBJC_IVAR____TtC5Files25DOCItemCollectionListCell_sizeLabel));
}

- (id)accessiblityStopDownloadView
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                                                 + OBJC_IVAR____TtC5Files21DOCItemCollectionCell_horizontalStopButton));
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _TtC5Files25DOCItemCollectionListCell *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  objc_class *v18;
  id v19;
  _TtC5Files25DOCItemCollectionListCell *v20;
  _OWORD v21[2];

  if (a3)
  {
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v12 = v11;
    if (a4)
      goto LABEL_3;
LABEL_6:
    memset(v21, 0, sizeof(v21));
    v19 = a5;
    v20 = self;
    if (a5)
      goto LABEL_4;
LABEL_7:
    v18 = 0;
    goto LABEL_8;
  }
  v10 = 0;
  v12 = 0;
  if (!a4)
    goto LABEL_6;
LABEL_3:
  swift_unknownObjectRetain(a4);
  v13 = a5;
  v14 = self;
  _bridgeAnyObjectToAny(_:)(v21, a4);
  swift_unknownObjectRelease(a4);
  if (!a5)
    goto LABEL_7;
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  v16 = v15;
  v17 = sub_10005A360(&qword_100641860, (uint64_t (*)(uint64_t))type metadata accessor for NSKeyValueChangeKey, (uint64_t)&unk_1004D6948);
  v18 = (objc_class *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, v16, (char *)&type metadata for Any + 8, v17);

LABEL_8:
  sub_100264EF0(v10, v12, (uint64_t)v21, v18, (uint64_t)a6);

  swift_bridgeObjectRelease(v18);
  swift_bridgeObjectRelease(v12);
  sub_10000CB4C((uint64_t)v21, &qword_100642730);
}

- (void).cxx_destruct
{
  _QWORD v3[34];

  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionListCell_horizontalStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionListCell_thumbnailContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionListCell_titleStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionListCell_tagView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionListCell_listTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionListCell_horizontalProgress));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionListCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionListCell_dateLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionListCell_sizeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionListCell_kindLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionListCell_statusView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionListCell_thumbnailCellHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionListCell_horizontalStackViewLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionListCell_horizontalStackViewTrailingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionListCell_horizontalStackViewTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionListCell_horizontalStackViewBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionListCell_dateConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionListCell_sizeConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionListCell_kindConstraint));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Files25DOCItemCollectionListCell_statusSizeMatchingConstraints));
  memcpy(v3, (char *)self + OBJC_IVAR____TtC5Files25DOCItemCollectionListCell_cellLayoutMetrics, sizeof(v3));
  sub_10007B4E0(v3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10007B580);
  sub_10000CB4C((uint64_t)self + OBJC_IVAR____TtC5Files25DOCItemCollectionListCell_statusViewAccessory, &qword_100645FB8);
  sub_10000CB4C((uint64_t)self + OBJC_IVAR____TtC5Files25DOCItemCollectionListCell_progressStopButtonAccessory, &qword_100645FB8);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionListCell_renameTextViewHeightConstraint));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Files25DOCItemCollectionListCell_renameTextViewConstraints));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionListCell_renameTextViewObserver));
}

@end
