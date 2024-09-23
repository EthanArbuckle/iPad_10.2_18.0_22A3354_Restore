@implementation DOCItemCollectionGridCell

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell_gridTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell_secondSubtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell_thumbnailContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell____lazy_storage___selectionView));
  sub_10000CB4C((uint64_t)self + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell_backgroundConfigurationProvider, &qword_100657AE8);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell_titleBackgroundStateView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell_imageBackgroundStateView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell_circularProgressView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell_horizontalProgressView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell_iconWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell_stackTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell_stackBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell_stackLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell_stackTrailingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell_gridCircularProgressVerticalConstraintFolder));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell_gridCircularProgressVerticalConstraintFile));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell_gridHorizontalProgressBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell_gridHorizontalProgressLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell_gridHorizontalProgressTrailingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell_gridHorizontalProgressHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell_gridHorizontalStopButtonCenterXConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell_gridHorizontalStopButtonCenterYConstraint));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell_renameTextViewConstraints));
}

- (BOOL)isHighlighted
{
  return sub_1000A2FC4(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (BOOL)isSelected
{
  return sub_1000A2FC4(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *v5;
  _TtC5Files25DOCItemCollectionGridCell *v6;
  unsigned int v7;
  _QWORD *v8;
  _BYTE v9[24];
  objc_super v10;
  objc_super v11;

  v3 = a3;
  v5 = (objc_class *)type metadata accessor for DOCItemCollectionGridCell();
  v11.receiver = self;
  v11.super_class = v5;
  v6 = self;
  v7 = -[DOCItemCollectionGridCell isSelected](&v11, "isSelected");
  v10.receiver = v6;
  v10.super_class = v5;
  -[DOCItemCollectionGridCell setSelected:](&v10, "setSelected:", v3);
  if (v7 != -[DOCItemCollectionGridCell isSelected](v6, "isSelected"))
  {
    v8 = (Class *)((char *)&v6->super.super.super.super.super.super.super.super.isa
                 + OBJC_IVAR____TtC5Files21DOCItemCollectionCell_cellContent);
    swift_beginAccess((char *)v6 + OBJC_IVAR____TtC5Files21DOCItemCollectionCell_cellContent, v9, 0, 0);
    if (*v8)
      sub_10049B650();
  }

}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC5Files25DOCItemCollectionGridCell *v9;
  uint64_t v10;

  v5 = type metadata accessor for UICellConfigurationState(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_10049668C((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)prepareForReuse
{
  id v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCItemCollectionGridCell();
  v2 = v4.receiver;
  -[DOCItemCollectionCell prepareForReuse](&v4, "prepareForReuse");
  v3 = objc_autoreleasePoolPush();
  sub_100497684((uint64_t)v2);
  objc_autoreleasePoolPop(v3);

}

- (void)layoutSubviews
{
  sub_100497810(self, (uint64_t)a2, (const char **)&selRef_layoutSubviews, (void (*)(id))sub_10049BB48);
}

- (void)tintColorDidChange
{
  sub_100497810(self, (uint64_t)a2, (const char **)&selRef_tintColorDidChange, (void (*)(id))sub_10049B650);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _TtC5Files25DOCItemCollectionGridCell *v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  Class isa;
  objc_super v19;

  v7 = sub_10004F2F0(0, (unint64_t *)&qword_100649120, UITouch_ptr);
  v8 = sub_1003CA0E8();
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  v10 = self;
  v11 = a4;
  v12 = (void *)sub_100243938(v9);
  if (v12
    && (v13 = v12,
        objc_msgSend(v12, "locationInView:", v10),
        v15 = v14,
        v17 = v16,
        v13,
        sub_10049E49C(v15, v17)))
  {

    swift_bridgeObjectRelease(v9);
  }
  else
  {
    isa = Set._bridgeToObjectiveC()().super.isa;
    v19.receiver = v10;
    v19.super_class = (Class)type metadata accessor for DOCItemCollectionGridCell();
    -[DOCItemCollectionGridCell touchesBegan:withEvent:](&v19, "touchesBegan:withEvent:", isa, v11);

    swift_bridgeObjectRelease(v9);
  }

}

- (_TtC5Files28DOCItemCollectionCellContent)cellContent
{
  id *v2;
  _BYTE v4[24];

  v2 = (id *)((char *)&self->super.super.super.super.super.super.super.super.isa
            + OBJC_IVAR____TtC5Files21DOCItemCollectionCell_cellContent);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC5Files21DOCItemCollectionCell_cellContent, v4, 0, 0);
  return (_TtC5Files28DOCItemCollectionCellContent *)*v2;
}

- (void)setCellContent:(id)a3
{
  _TtC5Files25DOCItemCollectionGridCell *v4;
  id v5;
  _QWORD *v6;
  _BYTE v7[184];
  uint64_t v8[23];
  _BYTE v9[24];

  v4 = self;
  v5 = a3;
  sub_100062A70(a3);
  if (qword_1006411F8 != -1)
    swift_once(&qword_1006411F8, sub_10049DF40);
  v6 = (Class *)((char *)&v4->super.super.super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC5Files21DOCItemCollectionCell_cellContent);
  swift_beginAccess((char *)v4 + OBJC_IVAR____TtC5Files21DOCItemCollectionCell_cellContent, v9, 0, 0);
  if (*v6)
  {
    sub_100070EDC(*v6 + OBJC_IVAR____TtC5Files28DOCItemCollectionCellContent_gridItemLayoutTraits, (uint64_t)v7, (uint64_t *)&unk_100641300);
    sub_100070EDC((uint64_t)v7, (uint64_t)v8, (uint64_t *)&unk_100641300);
    if (sub_1000A849C(v8) != 1)
    {
      qword_100657980 = v8[6];
      qword_100657988 = v8[8];
      qword_100657990 = v8[5];
    }
  }

}

- (void)setHighlighted:(BOOL)a3
{
  _TtC5Files25DOCItemCollectionGridCell *v4;

  v4 = self;
  sub_100498914(a3);

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  objc_super v8;

  y = a3.y;
  x = a3.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for DOCItemCollectionGridCell();
  return -[DOCItemCollectionGridCell pointInside:withEvent:](&v8, "pointInside:withEvent:", a4, x, y);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  _TtC5Files25DOCItemCollectionGridCell *v8;
  __n128 v9;
  int IsPad;
  objc_class *v11;
  _TtC5Files25DOCItemCollectionGridCell *v12;
  char *v13;
  objc_super v15;
  objc_super v16;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = self;
  IsPad = DOCDeviceIsPad(v9);
  v11 = (objc_class *)type metadata accessor for DOCItemCollectionGridCell();
  if (!IsPad)
  {
    v16.receiver = v8;
    v16.super_class = v11;
    v12 = (_TtC5Files25DOCItemCollectionGridCell *)-[DOCItemCollectionGridCell hitTest:withEvent:](&v16, "hitTest:withEvent:", v7, x, y);
    goto LABEL_10;
  }
  v15.receiver = v8;
  v15.super_class = v11;
  v12 = (_TtC5Files25DOCItemCollectionGridCell *)-[DOCItemCollectionGridCell hitTest:withEvent:](&v15, "hitTest:withEvent:", v7, x, y);
  if (!v12)
  {
LABEL_10:

    goto LABEL_11;
  }
  v13 = sub_100498B54(1, x, y);

  if (v13)
    v8 = (_TtC5Files25DOCItemCollectionGridCell *)v13;
  else
    v8 = v12;
  if (!v13)
    v12 = 0;
LABEL_11:

  return v12;
}

- (id)accessibilitySubtitleLabel
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                                                 + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell_subtitleLabel));
}

- (id)accessibilitySecondSubtitleLabel
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                                                 + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell_secondSubtitleLabel));
}

- (void)fittingImageViewDidLayout:(id)a3
{
  id v4;
  _TtC5Files25DOCItemCollectionGridCell *v5;

  v4 = a3;
  v5 = self;
  sub_10049BB48();

}

@end
