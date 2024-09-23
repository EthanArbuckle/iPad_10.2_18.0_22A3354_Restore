@implementation RecipientViewController_Phone

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC10SiriMailUI29RecipientViewController_Phone)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2468B3FA4();
}

- (void)viewDidLoad
{
  _TtC10SiriMailUI29RecipientViewController_Phone *v2;

  v2 = self;
  sub_2468B40FC();

}

- (void)viewDidLayoutSubviews
{
  _TtC10SiriMailUI29RecipientViewController_Phone *v2;

  v2 = self;
  sub_2468B4B14();

}

- (_TtC10SiriMailUI29RecipientViewController_Phone)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_2468D6484();
  v5 = a4;
  sub_2468B4E0C();
}

- (void).cxx_destruct
{
  void *v3;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_composeView));
  v3 = *(NSString **)((char *)&self->super._nibName
                    + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_container);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_8_5();
  swift_release();
  swift_release();
  swift_release();

  OUTLINED_FUNCTION_18_3(OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_composeViewHeightConstraint);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_18_3(OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_resultsTableViewController);
  OUTLINED_FUNCTION_18_3(OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_resultsTableView);
  OUTLINED_FUNCTION_18_3(OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_resultsTableViewHeightConstraint);
  OUTLINED_FUNCTION_18_3(OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_searchManager);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_currentSearchTaskID));
}

- (void)contactPickerDidCancel:(id)a3
{
  id v4;
  _TtC10SiriMailUI29RecipientViewController_Phone *v5;

  v4 = a3;
  v5 = self;
  sub_2468B4FAC();

}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v6;
  id v7;
  _TtC10SiriMailUI29RecipientViewController_Phone *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_2468B5084();

}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  id v6;
  id v7;
  _TtC10SiriMailUI29RecipientViewController_Phone *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_2468B52B8();

}

- (void)composeHeaderView:(id)a3 didChangeSize:(CGSize)a4
{
  id v5;
  _TtC10SiriMailUI29RecipientViewController_Phone *v6;

  v5 = a3;
  v6 = self;
  sub_2468B54B0();

}

- (void)composeRecipientView:(id)a3 didAddRecipient:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  _TtC10SiriMailUI29RecipientViewController_Phone *v9;

  v6 = a3;
  v7 = a4;
  v9 = self;
  sub_2468B5618((uint64_t)v9, v8, (uint64_t)&unk_2517E3190, (uint64_t)sub_2468B7344, (uint64_t)&block_descriptor_15);

}

- (void)composeRecipientView:(id)a3 didRemoveRecipient:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  _TtC10SiriMailUI29RecipientViewController_Phone *v9;

  v6 = a3;
  v7 = a4;
  v9 = self;
  sub_2468B5618((uint64_t)v9, v8, (uint64_t)&unk_2517E3140, (uint64_t)sub_2468B7344, (uint64_t)&block_descriptor_9);

}

- (void)composeRecipientView:(id)a3 didFinishEnteringAddress:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC10SiriMailUI29RecipientViewController_Phone *v10;

  if (a4)
  {
    v6 = sub_2468D6484();
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = a3;
  v10 = self;
  sub_2468B5824(a3, v6, v8);

  swift_bridgeObjectRelease();
}

- (id)composeRecipientView:(id)a3 composeRecipientForAddress:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC10SiriMailUI29RecipientViewController_Phone *v10;
  id v11;

  if (a4)
  {
    v6 = sub_2468D6484();
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = a3;
  v10 = self;
  v11 = sub_2468B58F0((uint64_t)v10, v6, v8);

  swift_bridgeObjectRelease();
  return v11;
}

- (void)composeRecipientView:(id)a3 textDidChange:(id)a4
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  id v9;
  _TtC10SiriMailUI29RecipientViewController_Phone *v10;

  if (a4)
  {
    v6 = sub_2468D6484();
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = a3;
  v10 = self;
  sub_2468B59C4((uint64_t)v10, v6, v8);

  swift_bridgeObjectRelease();
}

- (void)recipientViewDidBecomeFirstResponder:(id)a3
{
  id v4;
  _TtC10SiriMailUI29RecipientViewController_Phone *v5;

  v4 = a3;
  v5 = self;
  sub_2468B5D74((uint64_t)v5, (void (*)(void))MEMORY[0x24BEAE498]);

}

- (void)recipientViewDidResignFirstResponder:(id)a3
{
  id v4;
  _TtC10SiriMailUI29RecipientViewController_Phone *v5;

  v4 = a3;
  v5 = self;
  sub_2468B5D74((uint64_t)v5, (void (*)(void))MEMORY[0x24BEAE480]);

}

- (void)composeRecipientViewRequestAddRecipient:(id)a3
{
  id v4;
  _TtC10SiriMailUI29RecipientViewController_Phone *v5;

  v4 = a3;
  v5 = self;
  sub_2468B5E3C();

}

- (void)consumeAutocompleteSearchResults:(id)a3 taskID:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC10SiriMailUI29RecipientViewController_Phone *v8;

  if (a3)
    v6 = sub_2468D64F0();
  else
    v6 = 0;
  v7 = a4;
  v8 = self;
  sub_2468B6030(v6);

  swift_bridgeObjectRelease();
}

- (void)finishedSearchingForAutocompleteResults
{
  _TtC10SiriMailUI29RecipientViewController_Phone *v2;

  v2 = self;
  sub_2468B6210();

}

- (void)autocompleteResultsController:(id)a3 didSelectRecipient:(id)a4 atIndex:(int64_t)a5
{
  id v7;
  id v8;
  _TtC10SiriMailUI29RecipientViewController_Phone *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_2468B6280();

}

- (void)autocompleteResultsController:(id)a3 didExpandSelectedRecipient:(id)a4
{
  id v6;
  id v7;
  _TtC10SiriMailUI29RecipientViewController_Phone *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_2468B6390();

}

@end
