@implementation DOCItemCollectionCell

- (_TtC5Files21DOCItemCollectionCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t ObjectType;
  _TtC5Files21DOCItemCollectionCell *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = swift_getObjectType(self, a2);
  v9 = (_TtC5Files21DOCItemCollectionCell *)(*(uint64_t (**)(_QWORD, double, double, double, double))(ObjectType + 600))(0, x, y, width, height);
  swift_deallocPartialClassInstance(self, ObjectType, 161, 7);
  return v9;
}

- (void)prepareForReuse
{
  _QWORD *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCItemCollectionCell();
  v2 = v4.receiver;
  -[DOCItemCollectionCell prepareForReuse](&v4, "prepareForReuse");
  v3 = objc_autoreleasePoolPush();
  sub_10003731C(v2);
  objc_autoreleasePoolPop(v3);

}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC5Files21DOCItemCollectionCell *v9;
  uint64_t v10;

  v5 = type metadata accessor for UICellConfigurationState(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  DOCItemCollectionCell.updateConfiguration(using:)((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void).cxx_destruct
{
  sub_10008F5C0((uint64_t)self + OBJC_IVAR____TtC5Files21DOCItemCollectionCell_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files21DOCItemCollectionCell_thumbnailView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files21DOCItemCollectionCell_itemStatusBadgeConstraintX));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files21DOCItemCollectionCell_itemStatusBadgeConstraintY));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files21DOCItemCollectionCell_itemAccessStatusBadgeConstraintX));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files21DOCItemCollectionCell_itemAccessStatusBadgeConstraintY));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files21DOCItemCollectionCell____lazy_storage___itemStatusBadge));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files21DOCItemCollectionCell____lazy_storage___itemAccessStatusBadge));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files21DOCItemCollectionCell____lazy_storage___renameGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files21DOCItemCollectionCell_cellContent));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Files21DOCItemCollectionCell_actions));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files21DOCItemCollectionCell_horizontalStopButton));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC5Files21DOCItemCollectionCell_renameController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files21DOCItemCollectionCell_renameTextView));
}

- (void)dragStateDidChange:(int64_t)a3
{
  _TtC5Files21DOCItemCollectionCell *v4;

  v4 = self;
  DOCItemCollectionCell.dragStateDidChange(_:)((UICollectionViewCellDragState)a3);

}

- (void)didMoveToSuperview
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for DOCItemCollectionCell();
  -[DOCItemCollectionCell didMoveToSuperview](&v2, "didMoveToSuperview");
}

- (_TtC5Files28DOCItemCollectionCellContent)cellContent
{
  id *v2;
  _BYTE v4[24];

  v2 = (id *)((char *)&self->super.super.super.super.super.super.isa
            + OBJC_IVAR____TtC5Files21DOCItemCollectionCell_cellContent);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC5Files21DOCItemCollectionCell_cellContent, v4, 0, 0);
  return (_TtC5Files28DOCItemCollectionCellContent *)*v2;
}

- (void)setCellContent:(id)a3
{
  _TtC5Files21DOCItemCollectionCell *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_100062A70(a3);

}

- (NSString)description
{
  _TtC5Files21DOCItemCollectionCell *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  DOCItemCollectionCell.description.getter();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (_TtC5Files21DOCItemCollectionCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002720FC();
}

- (BOOL)_allowsHorizontalFocusMovement
{
  return 1;
}

- (void)renameGesture:(id)a3
{
  id v4;
  _TtC5Files21DOCItemCollectionCell *v5;

  v4 = a3;
  v5 = self;
  sub_10026F8A0(v4);

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v7;
  id v8;
  _TtC5Files21DOCItemCollectionCell *v9;
  id v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  BOOL v15;
  _BYTE v17[40];
  CGRect v18;
  char v19;
  CGPoint v20;

  sub_10004F2F0(0, (unint64_t *)&qword_100642430, NSObject_ptr);
  v7 = a3;
  v8 = a4;
  v9 = self;
  v10 = sub_1000AE388();
  LOBYTE(a4) = static NSObject.== infix(_:_:)(v7, v10);

  if ((a4 & 1) != 0
    && (objc_msgSend(v8, "locationInView:", v9),
        v12 = v11,
        v14 = v13,
        sub_10026FD4C((uint64_t)v17),
        sub_100070EDC((uint64_t)v17, (uint64_t)&v18, &qword_10064A6C0),
        (v19 & 1) == 0))
  {
    v20.x = v12;
    v20.y = v14;
    v15 = CGRectContainsPoint(v18, v20);

  }
  else
  {

    v15 = 0;
  }

  return v15;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  _TtC5Files21DOCItemCollectionCell *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = DOCItemCollectionCell.gestureRecognizerShouldBegin(_:)((UIGestureRecognizer)v4);

  return self & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v7;
  id v8;
  _TtC5Files21DOCItemCollectionCell *v9;
  id v10;
  uint64_t v11;
  unsigned __int8 v12;

  sub_10004F2F0(0, (unint64_t *)&qword_100642430, NSObject_ptr);
  v7 = a3;
  v8 = a4;
  v9 = self;
  v10 = sub_1000AE388();
  LOBYTE(a3) = static NSObject.== infix(_:_:)(v7, v10);

  if ((a3 & 1) != 0)
  {
    v11 = sub_10004F2F0(0, &qword_10064A6C8, UIPanGestureRecognizer_ptr);
    v12 = objc_msgSend(v8, "isKindOfClass:", swift_getObjCClassFromMetadata(v11));

    if ((v12 & 1) != 0)
      return 1;
  }
  else
  {

  }
  return 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v7;
  id v8;
  _TtC5Files21DOCItemCollectionCell *v9;
  id v10;

  sub_10004F2F0(0, (unint64_t *)&qword_100642430, NSObject_ptr);
  v7 = a3;
  v8 = a4;
  v9 = self;
  v10 = sub_1000AE388();
  LOBYTE(a3) = static NSObject.== infix(_:_:)(v7, v10);

  return a3 & 1;
}

- (id)accessibilityTitleLabel
{
  return objc_autoreleaseReturnValue((id)(*(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.super.super.super.isa)
                                                              + 0x108))());
}

- (id)accessibilityTitleString
{
  _TtC5Files21DOCItemCollectionCell *v2;
  id v3;

  v2 = self;
  v3 = sub_10027037C();

  return v3;
}

- (id)accessibilityCellManager
{
  return objc_autoreleaseReturnValue((id)(*(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.super.super.super.isa)
                                                              + 0x1F8))());
}

- (id)accessibilityThumbnailView
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                 + OBJC_IVAR____TtC5Files21DOCItemCollectionCell_thumbnailView));
}

- (BOOL)accessibilityIsRenaming
{
  return *((_BYTE *)&self->super.super.super.super.super.super.isa
         + OBJC_IVAR____TtC5Files21DOCItemCollectionCell_isRenaming);
}

@end
