@implementation DOCProgressCollectionIndicatorButtonItem

- (void)progressIndicatorViewDidChangeCombinedProgress:(id)a3
{
  id v4;
  _TtC5Files40DOCProgressCollectionIndicatorButtonItem *v5;

  v4 = a3;
  v5 = self;
  sub_10008D38C(0);

}

- (void)progressIndicatorViewDidReceiveTap:(id)a3
{
  id v4;
  _TtC5Files40DOCProgressCollectionIndicatorButtonItem *v5;

  v4 = a3;
  v5 = self;
  sub_100406348(v4);

}

- (BOOL)isActivePopoverSource
{
  return *((_BYTE *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC5Files40DOCProgressCollectionIndicatorButtonItem_isActivePopoverSource);
}

- (void)setIsActivePopoverSource:(BOOL)a3
{
  _BYTE *v3;

  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC5Files40DOCProgressCollectionIndicatorButtonItem_isActivePopoverSource) = a3;
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC5Files40DOCProgressCollectionIndicatorButtonItem_containerView);
  v3[OBJC_IVAR____TtCC5Files40DOCProgressCollectionIndicatorButtonItemP33_5AA9AA04A7C2840F7F12009703A5ACCD25ProgressItemContainerView_isActivePopoverSource] = a3;
  objc_msgSend(v3, "setNeedsLayout");
}

- (_TtC5Files40DOCProgressCollectionIndicatorButtonItem)init
{
  _TtC5Files40DOCProgressCollectionIndicatorButtonItem *result;

  result = (_TtC5Files40DOCProgressCollectionIndicatorButtonItem *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCProgressCollectionIndicatorButtonItem", 46, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC5Files40DOCProgressCollectionIndicatorButtonItem_progressSource));
  swift_unknownObjectWeakDestroy((char *)self+ OBJC_IVAR____TtC5Files40DOCProgressCollectionIndicatorButtonItem_viewControllerForPresentationFallback);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files40DOCProgressCollectionIndicatorButtonItem_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files40DOCProgressCollectionIndicatorButtonItem_indicatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files40DOCProgressCollectionIndicatorButtonItem_widthConstraint));
  sub_10000CB4C((uint64_t)self + OBJC_IVAR____TtC5Files40DOCProgressCollectionIndicatorButtonItem_inFlightVisibilityChange, &qword_1006541A8);
}

@end
