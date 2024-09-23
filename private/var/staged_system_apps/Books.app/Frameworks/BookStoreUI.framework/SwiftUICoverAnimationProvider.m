@implementation SwiftUICoverAnimationProvider

- (BOOL)isInNonHorizontalLayout
{
  return *((_BYTE *)&self->super.isa
         + OBJC_IVAR____TtC11BookStoreUI29SwiftUICoverAnimationProvider_isInNonHorizontalLayout);
}

- (double)cardStackTransitioningCoverSourceExtraXOffset
{
  double *v2;
  _BYTE v4[24];

  v2 = (double *)((char *)self
                + OBJC_IVAR____TtC11BookStoreUI29SwiftUICoverAnimationProvider_cardStackTransitioningCoverSourceExtraXOffset);
  swift_beginAccess((char *)self+ OBJC_IVAR____TtC11BookStoreUI29SwiftUICoverAnimationProvider_cardStackTransitioningCoverSourceExtraXOffset, v4, 0, 0);
  return *v2;
}

- (void)setCardStackTransitioningCoverSourceExtraXOffset:(double)a3
{
  double *v4;
  _BYTE v5[24];

  v4 = (double *)((char *)self
                + OBJC_IVAR____TtC11BookStoreUI29SwiftUICoverAnimationProvider_cardStackTransitioningCoverSourceExtraXOffset);
  swift_beginAccess((char *)self+ OBJC_IVAR____TtC11BookStoreUI29SwiftUICoverAnimationProvider_cardStackTransitioningCoverSourceExtraXOffset, v5, 1, 0);
  *v4 = a3;
}

- (_TtC11BookStoreUI29SwiftUICoverAnimationProvider)init
{
  _TtC11BookStoreUI29SwiftUICoverAnimationProvider *result;

  result = (_TtC11BookStoreUI29SwiftUICoverAnimationProvider *)_swift_stdlib_reportUnimplementedInitializer("BookStoreUI.SwiftUICoverAnimationProvider", 41, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease(*(_QWORD *)&self->sourceFrame[OBJC_IVAR____TtC11BookStoreUI29SwiftUICoverAnimationProvider_imageViewIdentifier]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11BookStoreUI29SwiftUICoverAnimationProvider_sourceReferenceView));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11BookStoreUI29SwiftUICoverAnimationProvider_coverSourceImage));
  v3 = (char *)self + OBJC_IVAR____TtC11BookStoreUI29SwiftUICoverAnimationProvider__isVisible;
  v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11BookStoreUI29SwiftUICoverAnimationProvider__isVisible);
  swift_release(*((_QWORD *)v3 + 1));
  swift_release(v4);
}

- (void)cardStackTransitioningCoverSourceReplaceReferenceView:(id)a3
{
  id v4;
  _TtC11BookStoreUI29SwiftUICoverAnimationProvider *v5;

  v4 = a3;
  v5 = self;
  SwiftUICoverAnimationProvider.cardStackTransitioningCoverSourceReplaceReferenceView(_:)((UIView)v4);

}

- (id)cardStackTransitioningCoverSourceHide
{
  _TtC11BookStoreUI29SwiftUICoverAnimationProvider *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD aBlock[5];
  uint64_t v8;
  char v9;

  v9 = 0;
  v2 = self;
  v3 = sub_5C154(&qword_3249B8);
  Binding.wrappedValue.setter(&v9, v3);
  v4 = swift_allocObject(&unk_2ED0F8, 24, 7);
  *(_QWORD *)(v4 + 16) = v2;
  aBlock[4] = sub_1168EC;
  v8 = v4;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_69F04;
  aBlock[3] = &unk_2ED110;
  v5 = _Block_copy(aBlock);
  swift_release(v8);
  return v5;
}

- (double)cardStackTransitioningCoverSourceFrame
{
  return *(double *)(a1 + OBJC_IVAR____TtC11BookStoreUI29SwiftUICoverAnimationProvider_sourceFrame);
}

- (id)coverAnimationSourceReferenceView
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC11BookStoreUI29SwiftUICoverAnimationProvider_sourceReferenceView));
}

- (id)coverAnimationSourceImage
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC11BookStoreUI29SwiftUICoverAnimationProvider_coverSourceImage));
}

- (id)coverAnimationSourceView
{
  void *v2;
  uint64_t v3;
  _TtC11BookStoreUI29SwiftUICoverAnimationProvider *v4;
  id v5;
  void *v6;
  _QWORD v8[2];

  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC11BookStoreUI29SwiftUICoverAnimationProvider_sourceReferenceView);
  v3 = *(_QWORD *)&self->sourceFrame[OBJC_IVAR____TtC11BookStoreUI29SwiftUICoverAnimationProvider_imageViewIdentifier];
  v8[0] = *(Class *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC11BookStoreUI29SwiftUICoverAnimationProvider_imageViewIdentifier);
  v8[1] = v3;
  v4 = self;
  v5 = v2;
  swift_bridgeObjectRetain(v3);
  v6 = (void *)UIView.findPresentationSourceView<A>(id:)(v8, &type metadata for String, &protocol witness table for String);

  swift_bridgeObjectRelease(v3);
  return v6;
}

- (BOOL)coverAnimationSourceUseLargeCover
{
  return 0;
}

- (void)coverAnimationSourcePrepare
{
  uint64_t v2;
  unsigned __int8 v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;

  v2 = *(_QWORD *)&self->sourceFrame[OBJC_IVAR____TtC11BookStoreUI29SwiftUICoverAnimationProvider__isVisible];
  v3 = self->sourceFrame[OBJC_IVAR____TtC11BookStoreUI29SwiftUICoverAnimationProvider__isVisible + 8];
  v6 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11BookStoreUI29SwiftUICoverAnimationProvider__isVisible);
  v7 = v2;
  v8 = v3;
  v5 = 0;
  v4 = sub_5C154(&qword_3249B8);
  Binding.wrappedValue.setter(&v5, v4);
}

- (void)coverAnimationSourceFinalize
{
  uint64_t v2;
  unsigned __int8 v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;

  v2 = *(_QWORD *)&self->sourceFrame[OBJC_IVAR____TtC11BookStoreUI29SwiftUICoverAnimationProvider__isVisible];
  v3 = self->sourceFrame[OBJC_IVAR____TtC11BookStoreUI29SwiftUICoverAnimationProvider__isVisible + 8];
  v6 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11BookStoreUI29SwiftUICoverAnimationProvider__isVisible);
  v7 = v2;
  v8 = v3;
  v5 = 1;
  v4 = sub_5C154(&qword_3249B8);
  Binding.wrappedValue.setter(&v5, v4);
}

- (int64_t)coverAnimationSourceAlignment
{
  return 2;
}

@end
