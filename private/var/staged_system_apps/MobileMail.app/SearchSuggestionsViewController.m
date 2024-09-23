@implementation SearchSuggestionsViewController

- (BOOL)hasSuggestions
{
  _TtC10MobileMail31SearchSuggestionsViewController *v2;
  char v5;

  v2 = self;
  v5 = sub_100331D20();

  return _convertBoolToObjCBool(_:)(v5 & 1) & 1;
}

- (UICollectionView)collectionView
{
  _TtC10MobileMail31SearchSuggestionsViewController *v2;
  id v5;

  v2 = self;
  v5 = sub_100331FE4();

  return (UICollectionView *)v5;
}

- (void)setCollectionView:(id)a3
{
  id v4;
  _TtC10MobileMail31SearchSuggestionsViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100332128(a3);

}

- (_TtC10MobileMail31SearchSuggestionsViewController)initWithMailScene:(id)a3 contactStore:(id)a4 delegate:(id)a5
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  swift_unknownObjectRetain(a5);
  return (_TtC10MobileMail31SearchSuggestionsViewController *)sub_100335E7C(a3, a4, (uint64_t)a5);
}

- (_TtC10MobileMail31SearchSuggestionsViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100336E58();
}

- (void)dealloc
{
  _TtC10MobileMail31SearchSuggestionsViewController *v2;

  v2 = self;
  sub_1003370BC();
}

- (void).cxx_destruct
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v9 = OBJC_IVAR____TtC10MobileMail31SearchSuggestionsViewController_contactCellRegistration;
  v2 = sub_10003A0C8(&qword_1005A8AA0);
  (*(void (**)(char *))(*(_QWORD *)(v2 - 8) + 8))((char *)self + v9);
  v10 = OBJC_IVAR____TtC10MobileMail31SearchSuggestionsViewController_documentCellRegistration;
  v3 = sub_10003A0C8(&qword_1005A8A98);
  (*(void (**)(char *))(*(_QWORD *)(v3 - 8) + 8))((char *)self + v10);
  v11 = OBJC_IVAR____TtC10MobileMail31SearchSuggestionsViewController_legacySuggestedSearchRegistration;
  v12 = sub_10003A0C8(&qword_1005A8A90);
  v13 = *(void (**)(char *))(*(_QWORD *)(v12 - 8) + 8);
  v13((char *)self + v11);
  ((void (*)(char *, uint64_t))v13)((char *)self + OBJC_IVAR____TtC10MobileMail31SearchSuggestionsViewController_listCellRegistration, v12);
  v14 = OBJC_IVAR____TtC10MobileMail31SearchSuggestionsViewController_linkCellRegistration;
  v4 = sub_10003A0C8(&qword_1005A8A88);
  (*(void (**)(char *))(*(_QWORD *)(v4 - 8) + 8))((char *)self + v14);
  v15 = OBJC_IVAR____TtC10MobileMail31SearchSuggestionsViewController_locationCellRegistration;
  v5 = sub_10003A0C8(&qword_1005A8A80);
  (*(void (**)(char *))(*(_QWORD *)(v5 - 8) + 8))((char *)self + v15);
  v16 = OBJC_IVAR____TtC10MobileMail31SearchSuggestionsViewController_photoCellRegistration;
  v6 = sub_10003A0C8(&qword_1005A8A78);
  (*(void (**)(char *))(*(_QWORD *)(v6 - 8) + 8))((char *)self + v16);
  v17 = OBJC_IVAR____TtC10MobileMail31SearchSuggestionsViewController_instantAnswerFlightCellRegistration;
  v7 = sub_10003A0C8(&qword_1005A8A70);
  (*(void (**)(char *))(*(_QWORD *)(v7 - 8) + 8))((char *)self + v17);
  v18 = OBJC_IVAR____TtC10MobileMail31SearchSuggestionsViewController_instantAnswerHotelCellRegistration;
  v8 = sub_10003A0C8(&qword_1005A8A68);
  (*(void (**)(char *))(*(_QWORD *)(v8 - 8) + 8))((char *)self + v18);
  sub_100345968((uint64_t)self + OBJC_IVAR____TtC10MobileMail31SearchSuggestionsViewController_topHitCellRegistration);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail31SearchSuggestionsViewController_cellRegistrationFactory));
  sub_1001ED890((Class *)((char *)&self->super.super.super.isa
                        + OBJC_IVAR____TtC10MobileMail31SearchSuggestionsViewController_lastVisibleIndexPaths));
  sub_1001F20D8((id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail31SearchSuggestionsViewController_scene));
  sub_100221900((uint64_t)self + OBJC_IVAR____TtC10MobileMail31SearchSuggestionsViewController_delegate);
  sub_1001F20D8((id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail31SearchSuggestionsViewController____lazy_storage___collectionView));
  sub_1003459DC((Class *)((char *)&self->super.super.super.isa
                        + OBJC_IVAR____TtC10MobileMail31SearchSuggestionsViewController____lazy_storage___cellProvider));
  sub_1001F0F44((Class *)((char *)&self->super.super.super.isa
                        + OBJC_IVAR____TtC10MobileMail31SearchSuggestionsViewController____lazy_storage___dataSource));
  sub_1003459DC((Class *)((char *)&self->super.super.super.isa
                        + OBJC_IVAR____TtC10MobileMail31SearchSuggestionsViewController____lazy_storage___supplementaryViewProvider));
}

- (void)viewDidLoad
{
  _TtC10MobileMail31SearchSuggestionsViewController *v2;

  v2 = self;
  sub_10033741C();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC10MobileMail31SearchSuggestionsViewController *v3;
  char v4;

  v3 = self;
  v4 = _convertObjCBoolToBool(_:)(a3);
  sub_10033A794(v4 & 1);

}

- (void)viewLayoutMarginsDidChange
{
  _TtC10MobileMail31SearchSuggestionsViewController *v2;

  v2 = self;
  sub_10033A9D0();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  _TtC10MobileMail31SearchSuggestionsViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10033AB3C(a3);

}

- (_TtC10MobileMail31SearchSuggestionsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a4;
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);

  }
  return (_TtC10MobileMail31SearchSuggestionsViewController *)sub_10033CE20();
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  id v6;
  _TtC10MobileMail31SearchSuggestionsViewController *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _TtC10MobileMail31SearchSuggestionsViewController *v14;
  id v15;

  v14 = self;
  v15 = a3;
  v13 = a4;
  v12 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v12 - 8);
  v9 = (*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v11 = (uint64_t)&v8 - v9;
  v5 = (id)__chkstk_darwin(v15);
  v6 = v13;
  v7 = self;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(v13);
  sub_10033CFFC(v15, v11);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v11, v12);

}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v6;
  id v7;
  id v8;
  _TtC10MobileMail31SearchSuggestionsViewController *v9;
  unint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  id v14;
  _TtC10MobileMail31SearchSuggestionsViewController *v15;
  id v16;
  id v17;

  v15 = self;
  v17 = a3;
  v16 = a4;
  v14 = a5;
  v13 = type metadata accessor for IndexPath(0);
  v11 = *(_QWORD *)(v13 - 8);
  v10 = (*(_QWORD *)(v11 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v12 = (char *)&v10 - v10;
  v6 = (id)__chkstk_darwin(v17);
  v7 = v16;
  v8 = v14;
  v9 = self;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(v14);
  sub_10033E230((uint64_t)v17);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v12, v13);

}

- (UIScrollView)observableScrollView
{
  _TtC10MobileMail31SearchSuggestionsViewController *v2;
  id v5;

  v2 = self;
  v5 = sub_10033E3B8();

  return (UIScrollView *)v5;
}

- (void)clearSuggestions
{
  _TtC10MobileMail31SearchSuggestionsViewController *v2;

  v2 = self;
  sub_10033E3E0();

}

- (void)beginUpdatingSuggestions
{
  _TtC10MobileMail31SearchSuggestionsViewController *v2;

  v2 = self;
  sub_10033E540();

}

- (void)endUpdatingSuggestions
{
  _TtC10MobileMail31SearchSuggestionsViewController *v2;

  v2 = self;
  sub_10033E698();

}

- (void)updateSuggestionsWithResult:(id)a3
{
  id v4;
  _TtC10MobileMail31SearchSuggestionsViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10033E7C0(a3);

}

- (id)searchSuggestionsForCategory:(id)a3
{
  id v4;
  _TtC10MobileMail31SearchSuggestionsViewController *v5;
  uint64_t v9;
  Class isa;

  v4 = a3;
  v5 = self;
  v9 = sub_10033FC20((uint64_t)a3);

  sub_100345F58();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v9);
  return isa;
}

- (void)reportVisibleSuggestionResults
{
  _TtC10MobileMail31SearchSuggestionsViewController *v2;

  v2 = self;
  sub_10033FD04();

}

- (void)updateLayoutMargins:(UIEdgeInsets)a3
{
  _TtC10MobileMail31SearchSuggestionsViewController *v3;

  v3 = self;
  sub_10033FD98(a3.top, a3.left, a3.bottom, a3.right);

}

- (id)viewForKeyboardAvoidance:(id)a3
{
  id v4;
  _TtC10MobileMail31SearchSuggestionsViewController *v5;
  id v9;

  v4 = a3;
  v5 = self;
  v9 = sub_10033FEB0();

  return v9;
}

- (id)transitionCoordinatorForKeyboardAvoidance:(id)a3
{
  id v4;
  _TtC10MobileMail31SearchSuggestionsViewController *v5;
  id v9;

  v4 = a3;
  v5 = self;
  v9 = (id)sub_10033FF40();

  return v9;
}

- (void)keyboardAvoidance:(id)a3 adjustForFrameOverlap:(CGRect)a4
{
  id v5;
  _TtC10MobileMail31SearchSuggestionsViewController *v6;

  v5 = a3;
  v6 = self;
  sub_10033FFC0((uint64_t)a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);

}

- (void)shouldReloadSearchSuggestion:(id)a3
{
  id v4;
  _TtC10MobileMail31SearchSuggestionsViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1003401BC(a3);

}

- (void)didRemoveSearchSuggestion:(id)a3
{
  id v4;
  _TtC10MobileMail31SearchSuggestionsViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100340270((uint64_t)a3);

}

@end
