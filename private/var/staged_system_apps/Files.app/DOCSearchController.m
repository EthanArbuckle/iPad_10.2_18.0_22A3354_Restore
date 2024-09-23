@implementation DOCSearchController

- (void)setSearchResultsUpdater:(id)a3
{
  objc_super v4;

  if (a3 && a3 == self)
  {
    v4.receiver = a3;
    v4.super_class = (Class)type metadata accessor for DOCSearchController();
    -[DOCSearchController setSearchResultsUpdater:](&v4, "setSearchResultsUpdater:", a3);
  }
  else
  {
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000037, 0x8000000100537370, "Files/DOCSearchController.swift", 31, 2, 391, 0);
    __break(1u);
  }
}

- (void)setPresentationDelegate:(id)a3
{
  _TtC5Files19DOCSearchController *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_1000B00CC((uint64_t)a3);

  swift_unknownObjectRelease(a3);
}

- (UITraitCollection)traitCollection
{
  return (UITraitCollection *)sub_1000AFEEC(self, (uint64_t)a2, (SEL *)&selRef_traitCollection);
}

- (_TtC5Files31DOCItemCollectionViewController)resultCollectionViewController
{
  return (_TtC5Files31DOCItemCollectionViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC5Files19DOCSearchController_resultCollectionViewController));
}

- (_TtP5Files39DOCSearchControllerPresentationDelegate_)presentationDelegate
{
  return (_TtP5Files39DOCSearchControllerPresentationDelegate_ *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC5Files19DOCSearchController_presentationDelegate, a2);
}

- (UISearchControllerDelegate)delegate
{
  return (UISearchControllerDelegate *)sub_1000AFEEC(self, (uint64_t)a2, (SEL *)&selRef_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCSearchController();
  -[DOCSearchController setDelegate:](&v4, "setDelegate:", a3);
}

- (UIViewController)searchResultsController
{
  return (UIViewController *)sub_1000AFEEC(self, (uint64_t)a2, (SEL *)&selRef_searchResultsController);
}

- (UISearchResultsUpdating)searchResultsUpdater
{
  return (UISearchResultsUpdating *)sub_1000AFEEC(self, (uint64_t)a2, (SEL *)&selRef_searchResultsUpdater);
}

- (_TtC5Files19DOCSearchController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100465CC0(420);
}

- (_TtC5Files19DOCSearchController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;

  v4 = a4;
  sub_100465CC0(424);
}

- (_TtC5Files12DOCSearchBar)searchBar
{
  return (_TtC5Files12DOCSearchBar *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                             + OBJC_IVAR____TtC5Files19DOCSearchController__searchBar));
}

- (void)viewDidLoad
{
  _TtC5Files19DOCSearchController *v2;

  v2 = self;
  sub_10045E330();

}

- (void)viewDidLayoutSubviews
{
  _TtC5Files19DOCSearchController *v2;

  v2 = self;
  sub_10045E6D4();

}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  objc_super v10;

  v4 = a4;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for DOCSearchController();
  v6 = v10.receiver;
  v7 = a3;
  v8 = -[DOCSearchController viewDidMoveToWindow:shouldAppearOrDisappear:](&v10, "viewDidMoveToWindow:shouldAppearOrDisappear:", v7, v4);
  if (v7)
  {
    sub_10045F460((uint64_t)v8, v9);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for DOCSearchController();
  v4 = v9.receiver;
  -[DOCSearchController viewWillAppear:](&v9, "viewWillAppear:", v3);
  v5 = sub_10000860C();
  sub_100463014((uint64_t)v5, v6);

  sub_10000CB88(v7, v8);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for DOCSearchController();
  v4 = a3;
  v5 = v8.receiver;
  -[DOCSearchController traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  sub_100012D88(0, v6);
  sub_10045E964(a3, v7);

}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t (*v8)();
  _TtC5Files19DOCSearchController *v9;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_1005EE050, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v8 = sub_1000E62C0;
  }
  else
  {
    v8 = 0;
    v7 = 0;
  }
  v9 = self;
  if (-[DOCSearchController isActive](v9, "isActive"))
  {
    sub_10045EA44((uint64_t (*)(id))v8, v7, a3);
LABEL_8:
    sub_100087534((uint64_t)v8, v7);
    goto LABEL_9;
  }
  if (v6)
  {
    v8();
    goto LABEL_8;
  }
LABEL_9:

}

- (void)deactivateAlongsideContainingTransitionCoordinator:(id)a3
{
  _TtC5Files19DOCSearchController *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_10045EEA8(a3);
  swift_unknownObjectRelease(a3);

}

- (void)searchController:(id)a3 didChangeFromSearchBarPlacement:(int64_t)a4
{
  id v5;
  uint64_t v6;
  _TtC5Files19DOCSearchController *v7;

  v5 = a3;
  v7 = self;
  sub_10000CB88((uint64_t)v7, v6);

}

- (void)willPresentSearchController:(id)a3
{
  void *Strong;
  void *v6;
  id v7;
  _TtC5Files19DOCSearchController *v8;

  Strong = (void *)swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC5Files19DOCSearchController_presentationDelegate, a2);
  if (Strong)
  {
    v6 = Strong;
    if ((objc_msgSend(Strong, "respondsToSelector:", "willPresentSearchController:") & 1) != 0)
    {
      v7 = a3;
      v8 = self;
      objc_msgSend(v6, "willPresentSearchController:", v8);

    }
    swift_unknownObjectRelease(v6);
  }
}

- (void)didPresentSearchController:(id)a3
{
  id v4;
  void *Strong;
  void *v6;
  _TtC5Files19DOCSearchController *v7;

  v4 = a3;
  v7 = self;
  sub_100012D88(0, (uint64_t)v7);
  Strong = (void *)swift_unknownObjectWeakLoadStrong((char *)v7 + OBJC_IVAR____TtC5Files19DOCSearchController_presentationDelegate);
  if (Strong)
  {
    v6 = Strong;
    if ((objc_msgSend(Strong, "respondsToSelector:", "didPresentSearchController:") & 1) != 0)
      objc_msgSend(v6, "didPresentSearchController:", v7);
    swift_unknownObjectRelease(v6);
  }
  sub_100460474();

}

- (void)willDismissSearchController:(id)a3
{
  id v4;
  _TtC5Files19DOCSearchController *v5;

  v4 = a3;
  v5 = self;
  sub_100465EB0();

}

- (void)didDismissSearchController:(id)a3
{
  id v4;
  uint64_t v5;
  _TtC5Files19DOCSearchController *v6;

  v4 = a3;
  v6 = self;
  sub_100465F78((uint64_t)v6, v5);

}

- (BOOL)searchBarShouldBeginEditing:(id)a3
{
  if ((*((_BYTE *)&self->super.super.super.super.isa
        + OBJC_IVAR____TtC5Files19DOCSearchController_activationTemporilyDisabled) & 1) != 0)
    return 0;
  else
    return objc_msgSend(a3, "isEnabled");
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  id v4;
  _TtC5Files19DOCSearchController *v5;

  v4 = a3;
  v5 = self;
  sub_10045F7E4(v4);

}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v5;
  _TtC5Files19DOCSearchController *v6;

  v5 = a3;
  v6 = self;
  sub_100465BA4(v5);

}

- (void)handleSuggestionsTypingTimeout
{
  _TtC5Files19DOCSearchController *v2;

  v2 = self;
  sub_1004600E0();

}

- (void)searchBar:(id)a3 selectedScopeButtonIndexDidChange:(int64_t)a4
{
  id v5;
  _TtC5Files19DOCSearchController *v6;

  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5Files19DOCSearchController_selectedScopeIndex) = (Class)a4;
  v5 = a3;
  v6 = self;
  sub_10045D864();

}

- (void)searchBarTextDidEndEditing:(id)a3
{
  id v4;
  _TtC5Files19DOCSearchController *v5;

  v4 = a3;
  v5 = self;
  sub_1004660AC();

}

- (void)updateSearchResultsForSearchController:(id)a3 selectingSearchSuggestion:(id)a4
{
  id v6;
  _TtC5Files19DOCSearchController *v7;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  sub_10046658C(a4);

  swift_unknownObjectRelease(a4);
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4;
  _TtC5Files19DOCSearchController *v5;

  v4 = a3;
  v5 = self;
  sub_100466668();

}

- (_TtC5Files19DOCSearchController)initWithSearchResultsController:(id)a3
{
  id v3;
  _TtC5Files19DOCSearchController *result;

  v3 = a3;
  result = (_TtC5Files19DOCSearchController *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCSearchController", 25, "init(searchResultsController:)", 30, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files19DOCSearchController_configuration));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files19DOCSearchController_resultCollectionViewController));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC5Files19DOCSearchController_dismissingAssertion));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files19DOCSearchController_cachedSearchQuery));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files19DOCSearchController__suggesterManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files19DOCSearchController_suggestionsTableViewContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files19DOCSearchController_suggestionsTableViewWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files19DOCSearchController____lazy_storage___stackedSearchLayout));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files19DOCSearchController____lazy_storage___suggestionsTableViewController));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC5Files19DOCSearchController_sizeCategoryDependantConstraints));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC5Files19DOCSearchController_defaultSearchCollectionItemPredicate);
  sub_10008F5C0((uint64_t)self + OBJC_IVAR____TtC5Files19DOCSearchController_searchDelegate);
  sub_10008F5C0((uint64_t)self + OBJC_IVAR____TtC5Files19DOCSearchController_presentationDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files19DOCSearchController__searchBar));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Files19DOCSearchController_blocksToRunAfterDismiss));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files19DOCSearchController_suggestionsTypingTimeoutTimer));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Files19DOCSearchController_displayedSuggestions));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files19DOCSearchController_selectedSuggestion));
}

@end
