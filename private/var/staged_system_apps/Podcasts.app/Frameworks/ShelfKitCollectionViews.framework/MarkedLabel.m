@implementation MarkedLabel

- (_TtC23ShelfKitCollectionViews11MarkedLabel)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_27070C();
}

- (void)buttonTriggeredWithButton:(id)a3
{
  void (*v3)(id, uint64_t, __n128);
  uint64_t v5;
  uint64_t v6;
  id v7;
  _TtC23ShelfKitCollectionViews11MarkedLabel *v8;
  __n128 v9;

  v3 = *(void (**)(id, uint64_t, __n128))((char *)&self->super.super.super.isa
                                                  + OBJC_IVAR____TtC23ShelfKitCollectionViews11MarkedLabel_markTriggered);
  if (v3)
  {
    v5 = *(_QWORD *)&self->active[OBJC_IVAR____TtC23ShelfKitCollectionViews11MarkedLabel_markTriggered];
    v6 = *(_QWORD *)((char *)a3
                   + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_8011BE26F891C4A443938FF26204113410MarkButton_mark
                   + 16);
    v7 = a3;
    v8 = self;
    sub_2C690((uint64_t)v3, v5);
    v9 = swift_bridgeObjectRetain(v6);
    v3(v7, v6, v9);
    sub_1D618((uint64_t)v3, v5);

    swift_bridgeObjectRelease(v6);
  }
}

- (void)layoutSubviews
{
  _TtC23ShelfKitCollectionViews11MarkedLabel *v2;

  v2 = self;
  sub_26EC3C();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews11MarkedLabel_textView), "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtC23ShelfKitCollectionViews11MarkedLabel)initWithFrame:(CGRect)a3
{
  sub_26FF44((uint64_t)self, (uint64_t)a2, (uint64_t)"ShelfKitCollectionViews.MarkedLabel", 35);
}

- (void).cxx_destruct
{
  sub_1D618(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews11MarkedLabel_markInteractionValidation), *(_QWORD *)&self->active[OBJC_IVAR____TtC23ShelfKitCollectionViews11MarkedLabel_markInteractionValidation]);
  sub_1D618(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews11MarkedLabel_markTriggered), *(_QWORD *)&self->active[OBJC_IVAR____TtC23ShelfKitCollectionViews11MarkedLabel_markTriggered]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11MarkedLabel_textView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11MarkedLabel_labelTextColor));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11MarkedLabel_marks));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11MarkedLabel_markButtons));
}

@end
