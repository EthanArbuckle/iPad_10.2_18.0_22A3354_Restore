@implementation FMFenceMapViewController

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5;
  _TtC6FindMy24FMFenceMapViewController *v6;
  int64_t v7;

  v5 = a3;
  v6 = self;
  v7 = sub_100225734();

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC6FindMy24FMFenceMapViewController *v12;
  void *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = (void *)sub_100224310(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v5 = type metadata accessor for IndexPath(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return UITableViewAutomaticDimension;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC6FindMy24FMFenceMapViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_100224A4C((uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4
{
  id v6;
  id v7;
  _TtC6FindMy24FMFenceMapViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100385450(v6, v7);

}

- (void)mapView:(id)a3 didDeselectAnnotationView:(id)a4
{
  id v6;
  id v7;
  _TtC6FindMy24FMFenceMapViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_10038619C(v7);

}

- (void)mapView:(id)a3 didUpdateUserLocation:(id)a4
{
  id v6;
  id v7;
  _TtC6FindMy24FMFenceMapViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1003862D0(v6);

}

- (void)mapView:(id)a3 regionWillChangeAnimated:(BOOL)a4
{
  void *v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_dragView);
  if (v4)
    objc_msgSend(v4, "removeHandle:", 0, a4);
  else
    __break(1u);
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  void *v5;

  v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_dragView);
  if (v5)
    objc_msgSend(v5, "addHandleForAnnotation:", *(Class *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_selectedAnnotation), a4);
  else
    __break(1u);
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v6;
  _TtC6FindMy24FMFenceMapViewController *v7;
  id v8;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  v8 = sub_100385AD4(v6, a4);

  swift_unknownObjectRelease(a4);
  return v8;
}

- (void)mapView:(id)a3 annotationView:(id)a4 didChangeDragState:(unint64_t)a5 fromOldState:(unint64_t)a6
{
  id v9;
  id v10;
  _TtC6FindMy24FMFenceMapViewController *v11;

  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_100386460(v10, a5);

}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  id v6;
  _TtC6FindMy24FMFenceMapViewController *v7;
  id v8;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  v8 = sub_100385FD4(v6, (uint64_t)a4);

  swift_unknownObjectRelease(a4);
  return v8;
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtC6FindMy24FMFenceMapViewController *v10;

  v4 = a3;
  v10 = self;
  v5 = objc_msgSend(v4, "searchBar");
  v6 = objc_msgSend(v5, "text");

  if (v6)
  {
    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
    v9 = v8;

    sub_1003B0D40(v7, v9);
    swift_bridgeObjectRelease(v9);
  }
  else
  {

  }
}

- (BOOL)searchBarShouldBeginEditing:(id)a3
{
  id v4;
  _TtC6FindMy24FMFenceMapViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1003A794C(v4);

  return 1;
}

- (BOOL)searchBarShouldEndEditing:(id)a3
{
  void *v3;

  if ((*((_BYTE *)&self->super.super.super.isa
        + OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_isResigningFromTableView) & 1) == 0)
  {
    v3 = *(Class *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_searchResultsTableView);
    if (!v3)
    {
      __break(1u);
      return (char)v3;
    }
    objc_msgSend(v3, "setHidden:", 1);
  }
  LOBYTE(v3) = 1;
  return (char)v3;
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v4;
  _TtC6FindMy24FMFenceMapViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1003A7B5C(v4);

}

- (void)searchBarCancelButtonClicked:(id)a3
{
  id v4;
  _TtC6FindMy24FMFenceMapViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1003A7CFC(v4);

}

- (_TtC6FindMy24FMFenceMapViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1003B8B10();
}

- (void)viewDidLoad
{
  _TtC6FindMy24FMFenceMapViewController *v2;

  v2 = self;
  sub_1003AB954();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC6FindMy24FMFenceMapViewController *v4;

  v4 = self;
  sub_1003ABB98(a3);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC6FindMy24FMFenceMapViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1003ABD28((uint64_t)a3);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  _TtC6FindMy24FMFenceMapViewController *v6;

  swift_unknownObjectRetain(a4);
  v6 = self;
  sub_1003B8E78(a4);
  swift_unknownObjectRelease(a4);

}

- (void)willStartDraggingHandle:(id)a3
{
  id v5;
  _TtC6FindMy24FMFenceMapViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1003B3478(a3);

}

- (void)didStopDraggingHandle:(id)a3
{
  id v5;
  _TtC6FindMy24FMFenceMapViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1003B3564(a3);

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  _TtC6FindMy24FMFenceMapViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1003B9088();

}

- (void)popoverPresentationControllerDidDismissPopover:(id)a3
{
  _TtC6FindMy24FMFenceMapViewController *v4;
  id v5;
  id v6;
  _TtC6FindMy24FMFenceMapViewController *v7;
  _TtC6FindMy24FMFenceMapViewController *v8;

  v4 = (_TtC6FindMy24FMFenceMapViewController *)a3;
  v8 = self;
  v5 = -[FMFenceMapViewController navigationItem](v8, "navigationItem");
  v6 = objc_msgSend(v5, "searchController");

  if (v6)
  {
    v7 = (_TtC6FindMy24FMFenceMapViewController *)objc_msgSend(v6, "searchBar");

    -[FMFenceMapViewController resignFirstResponder](v7, "resignFirstResponder");
    v4 = v8;
    v8 = v7;
  }

}

- (void)chooseSmallRadiusActionWithSender:(id)a3
{
  id v4;
  _TtC6FindMy24FMFenceMapViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1003B30AC(0x4059000000000000, 0);

}

- (void)chooseMediumRadiusActionWithSender:(id)a3
{
  id v4;
  _TtC6FindMy24FMFenceMapViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1003B30AC(0x406F400000000000, 0);

}

- (void)chooseLargeRadiusActionWithSender:(id)a3
{
  id v4;
  _TtC6FindMy24FMFenceMapViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1003B30AC(0x4077700000000000, 0);

}

- (void)longPressActionWithSender:(id)a3
{
  id v4;
  _TtC6FindMy24FMFenceMapViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1003B39A8(v4);

}

- (void)refreshActionWithSender:(id)a3
{
  id v4;
  _TtC6FindMy24FMFenceMapViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1003B912C();

}

- (void)doneActionWithSender:(id)a3
{
  id v4;
  _TtC6FindMy24FMFenceMapViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1003B25A8();

}

- (void)cancelActionWithSender:(id)a3
{
  _TtC6FindMy24FMFenceMapViewController *v5;
  double v6;
  _TtC6FindMy24FMFenceMapViewController *v7;
  _TtC6FindMy24FMFenceMapViewController *v8;
  id v9;
  _QWORD v10[4];

  swift_unknownObjectRetain(a3);
  v5 = self;
  _bridgeAnyObjectToAny(_:)(v10, a3);
  *(_QWORD *)&v6 = swift_unknownObjectRelease(a3).n128_u64[0];
  if (*((_BYTE *)&v5->super.super.super.isa + OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_isOtherUsage) == 1)
  {
    v7 = (_TtC6FindMy24FMFenceMapViewController *)-[FMFenceMapViewController navigationController](v5, "navigationController", v6);
    if (v7)
    {
      v8 = v7;
      v9 = -[FMFenceMapViewController popViewControllerAnimated:](v7, "popViewControllerAnimated:", 1);

      v5 = v8;
    }
  }
  else
  {
    -[FMFenceMapViewController dismissViewControllerAnimated:completion:](v5, "dismissViewControllerAnimated:completion:", 1, 0, v6);
  }

  sub_100029574(v10);
}

- (_TtC6FindMy24FMFenceMapViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC6FindMy24FMFenceMapViewController *result;

  v4 = a4;
  result = (_TtC6FindMy24FMFenceMapViewController *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMFenceMapViewController", 31, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;

  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_mediator));
  sub_1000051EC((uint64_t)self + OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_myLocation, (uint64_t *)&unk_1005D3350);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_selectedLocation));
  sub_1000051EC((uint64_t)self + OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_address, &qword_1005D3370);
  sub_1000051EC((uint64_t)self + OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_addressType, &qword_1005D3418);
  sub_1000051EC((uint64_t)self + OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_addressLabel, &qword_1005DC400);
  sub_1000051EC((uint64_t)self + OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_friendForFence, &qword_1005D3380);
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_delegate);
  sub_1000327F0(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_doneHandler), *(_QWORD *)&self->mediator[OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_doneHandler]);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_peopleSubscription));
  v3 = *(void **)&self->mediator[OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_style];
  v4 = *(void **)&self->addressRadius[OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_style];

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_searchResultsTableView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_doneButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_smallRadiusBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_mediumRadiusBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_largeRadiusBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_userDroppedAnnotation));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_selectedAnnotation));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_mapSearchResults));
  sub_1000051EC((uint64_t)self + OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_mapLastSeachAddressType, &qword_1005D3418);
  swift_bridgeObjectRelease(*(_QWORD *)&self->mediator[OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_mapLastSearchedQuery]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_defaultSearchRecords));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_contactsDataController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_searchController));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy24FMFenceMapViewController_filteredSearchRecords));
}

@end
