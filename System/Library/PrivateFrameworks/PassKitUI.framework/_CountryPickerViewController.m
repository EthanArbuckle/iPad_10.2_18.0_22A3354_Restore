@implementation _CountryPickerViewController

- (_TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController)initWithCoder:(id)a3
{
  sub_19D8AEC60(a3);
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4;
  _TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_19D8AF098(v4);

}

- (void)viewDidLoad
{
  _TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController *v2;

  v2 = self;
  sub_19D8AF244();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL4 v3;
  _TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController *v4;

  v3 = a3;
  v4 = self;
  sub_19D8AF834(v3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for _CountryPickerViewController();
  v4 = v5.receiver;
  -[_CountryPickerViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
  v4[OBJC_IVAR____TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController_isFreshPresentation] = 0;

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for _CountryPickerViewController();
  v4 = v5.receiver;
  -[_CountryPickerViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
  v4[OBJC_IVAR____TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController_isFreshPresentation] = 1;

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (*(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController_filteredSections))
    return 1;
  else
    return (*(_QWORD **)((char *)&self->super.super.super.super.isa
                       + OBJC_IVAR____TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController_sections))[2];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  _TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController *v7;
  int64_t v8;

  v6 = a3;
  v7 = self;
  v8 = sub_19D8B1150(a4);

  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  v7 = self;
  sub_19D8AFD6C((uint64_t)v6, a4);
  v9 = v8;

  if (v9)
  {
    v10 = (void *)sub_19DE87BD0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)sectionIndexTitlesForTableView:(id)a3
{
  void *v3;
  void *v6;
  id v7;
  _TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController *v8;
  id v9;
  id v10;

  if (*(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController_filteredSections))
  {
    v3 = 0;
  }
  else
  {
    v6 = (void *)objc_opt_self();
    v7 = a3;
    v8 = self;
    v9 = objc_msgSend(v6, sel_currentCollation);
    v10 = objc_msgSend(v9, sel_sectionIndexTitles);
    sub_19DE87E10();

    v3 = (void *)sub_19DE87DF8();
    swift_bridgeObjectRelease();
  }
  return v3;
}

- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  void *v8;
  id v9;
  _TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController *v10;
  id v11;
  id v12;

  v8 = (void *)objc_opt_self();
  v9 = a3;
  v10 = self;
  v11 = objc_msgSend(v8, sel_currentCollation);
  v12 = objc_msgSend(v11, sel_sectionForSectionIndexTitleAtIndex_, a5);

  return (int64_t)v12;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController *v12;
  void *v13;
  uint64_t v15;

  v6 = sub_19DE83D78();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19DE83D48();
  v11 = a3;
  v12 = self;
  v13 = (void *)sub_19D8B0040(v11, (unint64_t)v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  return v13;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController *v12;
  uint64_t v13;

  v6 = sub_19DE83D78();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19DE83D48();
  v11 = a3;
  v12 = self;
  sub_19D8B0458(v11, (unint64_t)v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  _TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController *v4;
  _TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController *v5;
  _TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController *v6;
  _TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController *v7;

  v4 = (_TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController *)a3;
  v7 = self;
  v5 = (_TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController *)-[_CountryPickerViewController presentingViewController](v7, sel_presentingViewController);
  if (v5)
  {
    v6 = v5;
    -[_CountryPickerViewController dismissViewControllerAnimated:completion:](v5, sel_dismissViewControllerAnimated_completion_, 1, 0);

    v4 = v7;
    v7 = v6;
  }

}

- (void)cancel
{
  _TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController *v2;
  _TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController *v3;
  _TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController *v4;
  _TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController *v5;

  v5 = self;
  v2 = (_TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController *)-[_CountryPickerViewController presentingViewController](v5, sel_presentingViewController);
  if (v2)
  {
    v3 = v2;
    -[_CountryPickerViewController dismissViewControllerAnimated:completion:](v2, sel_dismissViewControllerAnimated_completion_, 1, 0);

    v4 = v3;
  }
  else
  {
    v4 = v5;
  }

}

- (_TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController)initWithStyle:(int64_t)a3
{
  _TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController *result;

  result = (_TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController *result;

  v4 = a4;
  result = (_TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;
  char v4;

  v3 = *(uint64_t *)((char *)&self->super.super._nibBundle
                  + OBJC_IVAR____TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController_configuration);
  v4 = *((_BYTE *)&self->super.super._parentViewController
       + OBJC_IVAR____TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController_configuration);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_19D1B9B70(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController_resultsSearchController));
}

@end
