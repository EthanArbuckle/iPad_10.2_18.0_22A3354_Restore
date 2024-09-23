@implementation ExpandableTextView

- (double)firstBaselineFromTop
{
  double result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews18ExpandableTextView_textView), "firstBaselineFromTop");
  return result;
}

- (double)lastBaselineFromBottom
{
  double result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews18ExpandableTextView_textView), "lastBaselineFromBottom");
  return result;
}

- (UIView)viewForLastBaselineLayout
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR____TtC23ShelfKitCollectionViews18ExpandableTextView_textView));
}

- (_TtC23ShelfKitCollectionViews18ExpandableTextView)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews18ExpandableTextView *)ExpandableTextView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews18ExpandableTextView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s23ShelfKitCollectionViews18ExpandableTextViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)didMoveToWindow
{
  sub_2D8D10(self, (uint64_t)a2, (const char **)&selRef_didMoveToWindow);
}

- (void)didMoveToSuperview
{
  sub_2D8D10(self, (uint64_t)a2, (const char **)&selRef_didMoveToSuperview);
}

- (void)layoutSubviews
{
  _TtC23ShelfKitCollectionViews18ExpandableTextView *v2;

  v2 = self;
  ExpandableTextView.layoutSubviews()();

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews18ExpandableTextView_textView), "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)tintColorDidChange
{
  char *v2;
  void *v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  -[ExpandableTextView tintColorDidChange](&v5, "tintColorDidChange");
  v3 = *(void **)&v2[OBJC_IVAR____TtC23ShelfKitCollectionViews18ExpandableTextView_moreButton];
  v4 = objc_msgSend(v2, "tintColor", v5.receiver, v5.super_class);
  objc_msgSend(v3, "setTitleColor:forState:", v4, 0);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  CGSize result;

  width = a3.width;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews18ExpandableTextView_textView), "sizeThatFits:", a3.width, a3.height);
  v5 = width;
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)moreFrom:(id)a3
{
  void (*v3)(uint64_t);
  uint64_t v5;
  id v6;
  uint64_t v7;
  _TtC23ShelfKitCollectionViews18ExpandableTextView *v8;

  v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC23ShelfKitCollectionViews18ExpandableTextView_moreTapHandler);
  if (v3)
  {
    v5 = *(_QWORD *)&self->textView[OBJC_IVAR____TtC23ShelfKitCollectionViews18ExpandableTextView_moreTapHandler];
    v6 = a3;
    v8 = self;
    v7 = sub_2C690((uint64_t)v3, v5);
    v3(v7);
    sub_1D618((uint64_t)v3, v5);

  }
}

- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC23ShelfKitCollectionViews18ExpandableTextView *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = sub_2DA804((uint64_t)v9, v10);

  return v12;
}

- (id)textView:(id)a3 menuConfigurationForTextItem:(id)a4 defaultMenu:(id)a5
{
  id v8;
  id v9;
  unsigned __int8 *v10;
  _TtC23ShelfKitCollectionViews18ExpandableTextView *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = (unsigned __int8 *)a5;
  v11 = self;
  v12 = (void *)sub_2DAA20((uint64_t)v9, v10);

  return v12;
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  id v4;
  Class isa;
  UIScrollView_optional v6;

  v4 = a3;
  v6.value.super.super.super.isa = (Class)self;
  isa = v6.value.super.super.super.isa;
  ExpandableTextView._observeScrollViewDidScroll(_:)(v6);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews18ExpandableTextView_textView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews18ExpandableTextView_moreButton));
  sub_D1D4((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews18ExpandableTextView_shareSheetContentSource, &qword_3E1EE0);
  sub_1D618(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews18ExpandableTextView_moreTapHandler), *(_QWORD *)&self->textView[OBJC_IVAR____TtC23ShelfKitCollectionViews18ExpandableTextView_moreTapHandler]);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews18ExpandableTextView_observedScrollView);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews18ExpandableTextView_objectGraph));
}

@end
