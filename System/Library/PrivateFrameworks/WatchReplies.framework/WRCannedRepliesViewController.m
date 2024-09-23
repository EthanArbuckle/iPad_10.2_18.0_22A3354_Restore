@implementation WRCannedRepliesViewController

- (WRCannedRepliesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  WRCannedRepliesViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WRCannedRepliesViewController;
  v4 = -[WRCannedRepliesViewController initWithNibName:bundle:](&v6, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
    v4->_supportedEnhancedEditing = +[WRCannedRepliesStore supportsEnhancedEditing](WRCannedRepliesStore, "supportsEnhancedEditing");
  return v4;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WRCannedRepliesViewController;
  -[WRCannedRepliesViewController viewDidLoad](&v4, sel_viewDidLoad);
  if (!-[WRCannedRepliesViewController category](self, "category"))
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("Set the category before accessing the view. WRCategoryQuickboard is an invalid category."), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "raise");

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WRCannedRepliesViewController;
  -[WRCannedRepliesViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[WRCannedRepliesViewController updateEditDoneButton](self, "updateEditDoneButton");
}

- (void)updateEditDoneButton
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  if (self->_supportedEnhancedEditing
    && (-[WRCannedRepliesViewController cannedReplies](self, "cannedReplies"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "count"),
        v3,
        v4))
  {
    -[WRCannedRepliesViewController editButtonItem](self, "editButtonItem");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[WRCannedRepliesViewController navigationItem](self, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRightBarButtonItem:", v6);

  }
  else
  {
    -[WRCannedRepliesViewController navigationItem](self, "navigationItem");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRightBarButtonItem:", 0);
  }

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  int v7;
  void *v8;
  PSSpecifier *addNewSpecifier;
  void *v10;
  objc_super v11;

  v4 = a4;
  v5 = a3;
  if (a3)
    v7 = 0;
  else
    v7 = -[WRCannedRepliesViewController isEditing](self, "isEditing");
  v11.receiver = self;
  v11.super_class = (Class)WRCannedRepliesViewController;
  -[WRCannedRepliesViewController setEditing:animated:](&v11, sel_setEditing_animated_, v5, v4);
  -[WRCannedRepliesViewController returnPressedAtEnd](self, "returnPressedAtEnd");
  if (self->_supportedEnhancedEditing)
  {
    -[WRCannedRepliesViewController table](self, "table");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEditing:animated:", v5, 1);

    addNewSpecifier = self->_addNewSpecifier;
    if (addNewSpecifier)
    {
      if (!v5)
      {
        objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "lastObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[WRCannedRepliesViewController insertSpecifier:afterSpecifier:animated:](self, "insertSpecifier:afterSpecifier:animated:", addNewSpecifier, v10, v4);

        if (!v7)
          return;
LABEL_9:
        -[WRCannedRepliesViewController saveReplies](self, "saveReplies");
        return;
      }
      -[WRCannedRepliesViewController removeSpecifier:animated:](self, "removeSpecifier:animated:", self->_addNewSpecifier, v4);
    }
    if (!v7)
      return;
    goto LABEL_9;
  }
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  PSSpecifier *v18;
  PSSpecifier *addNewSpecifier;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(_QWORD *, void *);
  void *v25;
  WRCannedRepliesViewController *v26;
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v6 = (void *)MEMORY[0x24BE75590];
    WRBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("DEFAULT_REPLIES"), &stru_24E19D6B0, CFSTR("WRCannedRepliesViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "groupSpecifierWithName:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    WRBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("DEFAULT_REPLIES_HELP"), &stru_24E19D6B0, CFSTR("WRCannedRepliesViewController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BE75A68]);

    objc_msgSend(v5, "addObject:", v9);
    v29 = 0;
    v30 = &v29;
    v31 = 0x2020000000;
    v32 = 0;
    v32 = objc_msgSend(v5, "indexOfObject:", v9);
    v12 = v30[3];
    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v30[3] = v12 + 1;
      -[WRCannedRepliesViewController cannedReplies](self, "cannedReplies");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = MEMORY[0x24BDAC760];
      v23 = 3221225472;
      v24 = __43__WRCannedRepliesViewController_specifiers__block_invoke;
      v25 = &unk_24E19D508;
      v26 = self;
      v14 = v5;
      v27 = v14;
      v28 = &v29;
      objc_msgSend(v13, "enumerateObjectsUsingBlock:", &v22);
      if (self->_supportedEnhancedEditing)
      {
        v15 = (void *)MEMORY[0x24BE75590];
        WRBundle();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("ADD_NEW_REPLY"), &stru_24E19D6B0, CFSTR("WRCannedRepliesViewController"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v17, self, 0, 0, 0, 13, 0, v22, v23, v24, v25, v26);
        v18 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
        addNewSpecifier = self->_addNewSpecifier;
        self->_addNewSpecifier = v18;

        -[PSSpecifier setButtonAction:](self->_addNewSpecifier, "setButtonAction:", sel_addNewReply_);
        -[PSSpecifier setProperty:forKey:](self->_addNewSpecifier, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
        objc_msgSend(v14, "addObject:", self->_addNewSpecifier);
      }

    }
    v20 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    _Block_object_dispose(&v29, 8);
    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

void __43__WRCannedRepliesViewController_specifiers__block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  _BYTE *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v3 = a2;
  v4 = (_BYTE *)a1[4];
  v16 = v3;
  if (!v4[1416])
    goto LABEL_5;
  objc_msgSend(v3, "defaultReplyText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("SMART_REPLIES_MARKER"));

  if ((v6 & 1) == 0)
  {
    v4 = (_BYTE *)a1[4];
LABEL_5:
    v13 = (id)objc_msgSend(v4, "newCannedReplySpecifier");
    objc_msgSend(v16, "defaultReplyText");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPlaceholder:", v14);

    goto LABEL_6;
  }
  v7 = (void *)MEMORY[0x24BE75590];
  WRBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SMART_REPLIES"), &stru_24E19D6B0, CFSTR("WRCannedRepliesViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v9, a1[4], sel_setIncludeSmartReplies_specifier_, sel_includeSmartReplies, 0, 6, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = a1[4];
  v12 = *(void **)(v11 + 1392);
  *(_QWORD *)(v11 + 1392) = v10;

  v13 = *(id *)(a1[4] + 1392);
LABEL_6:
  objc_msgSend(v13, "setProperty:forKey:", v16, CFSTR("WRCannedReplyKey"));
  v15 = (void *)a1[5];
  ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
  objc_msgSend(v15, "insertObject:atIndex:", v13);

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WRCannedRepliesViewController;
  -[WRCannedRepliesViewController tableView:cellForRowAtIndexPath:](&v12, sel_tableView_cellForRowAtIndexPath_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "tag");
  if (v6 == 6)
  {
    BPSBridgeTintColor();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTextColor:", v9);

    objc_msgSend(v5, "setSelectionStyle:", 3);
  }
  else if (v6 == 8)
  {
    objc_msgSend(v5, "editableTextField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setClearButtonMode:", 1);

    objc_msgSend(v5, "editableTextField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setReturnKeyType:", 9);

    objc_msgSend(v5, "setShowsReorderControl:", -[WRCannedRepliesViewController isEditing](self, "isEditing"));
    -[WRCannedRepliesViewController configureCellAccessoryImage:](self, "configureCellAccessoryImage:", v5);
  }
  return v5;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  int64_t v10;

  v6 = a3;
  v7 = a4;
  v10 = 0;
  if (self->_supportedEnhancedEditing)
  {
    -[WRCannedRepliesViewController specifierAtIndexPath:](self, "specifierAtIndexPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "cellType");

    if (v9 == 8)
      v10 = 1;
  }

  return v10;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v6;

  if (a4 == 1 && self->_supportedEnhancedEditing)
  {
    -[WRCannedRepliesViewController specifierAtIndexPath:](self, "specifierAtIndexPath:", a5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[WRCannedRepliesViewController removeSpecifier:animated:](self, "removeSpecifier:animated:");
    if ((-[WRCannedRepliesViewController isEditing](self, "isEditing") & 1) == 0)
      -[WRCannedRepliesViewController saveReplies](self, "saveReplies");

  }
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  BOOL v10;

  v6 = a3;
  v7 = a4;
  if (self->_supportedEnhancedEditing && -[WRCannedRepliesViewController isEditing](self, "isEditing"))
  {
    -[WRCannedRepliesViewController specifierAtIndexPath:](self, "specifierAtIndexPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "cellType");

    v10 = ((v9 - 6) & 0xFFFFFFFFFFFFFFFDLL) == 0;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = a5;
  if (self->_supportedEnhancedEditing)
  {
    v10 = (int)*MEMORY[0x24BE756E0];
    if (objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v10), "count"))
    {
      v11 = -[WRCannedRepliesViewController indexForIndexPath:](self, "indexForIndexPath:", v8);
      v12 = -[WRCannedRepliesViewController indexForIndexPath:](self, "indexForIndexPath:", v9);
      if (v11 >= objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v10), "count"))
        -[WRCannedRepliesViewController tableView:moveRowAtIndexPath:toIndexPath:].cold.2();
      if (v11 < objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v10), "count"))
      {
        -[WRCannedRepliesViewController specifierAtIndex:](self, "specifierAtIndex:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (void *)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v10), "mutableCopy");
          if (v12 >= objc_msgSend(v14, "count"))
            -[WRCannedRepliesViewController tableView:moveRowAtIndexPath:toIndexPath:].cold.1();
          if (v12 < objc_msgSend(v14, "count"))
          {
            objc_msgSend(v14, "removeObjectAtIndex:", v11);
            objc_msgSend(v14, "insertObject:atIndex:", v13, v12);
          }
          v15 = *(Class *)((char *)&self->super.super.super.super.super.isa + v10);
          *(Class *)((char *)&self->super.super.super.super.super.isa + v10) = (Class)v14;

        }
      }
    }
  }

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v10;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)WRCannedRepliesViewController;
  if (objc_msgSend(-[WRCannedRepliesViewController class](&v11, sel_class), "instancesRespondToSelector:", sel_tableView_didSelectRowAtIndexPath_))
  {
    v10.receiver = self;
    v10.super_class = (Class)WRCannedRepliesViewController;
    -[WRCannedRepliesViewController tableView:didSelectRowAtIndexPath:](&v10, sel_tableView_didSelectRowAtIndexPath_, v6, v7);
  }
  objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "tag") == 6)
  {
    objc_msgSend(v8, "control");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setOn:animated:", objc_msgSend(v9, "isOn") ^ 1, 1);

  }
}

- (void)returnPressedAtEnd
{
  void *v2;
  id v3;

  objc_msgSend((id)*MEMORY[0x24BDF74F8], "keyWindow");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resignFirstResponder");

}

- (id)newCannedReplySpecifier
{
  id result;

  objc_msgSend(MEMORY[0x24BE755F0], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, self, sel_setCustomReply_specifier_, sel_customReply_, 0, 8, 0);
  result = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)((char *)result + (int)*MEMORY[0x24BE75728]) = 2;
  return result;
}

- (void)setCustomReply:(id)a3 specifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  v6 = a4;
  objc_msgSend(v6, "propertyForKey:", CFSTR("WRCannedReplyKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByTrimmingCharactersInSet:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v13, "isEqualToString:", &stru_24E19D6B0) & 1) != 0
    || (objc_msgSend(v9, "isEqualToString:", &stru_24E19D6B0) & 1) == 0)
  {
    objc_msgSend(v7, "setText:", v13);
    -[WRCannedRepliesViewController saveReplies](self, "saveReplies");
  }
  else
  {
    -[WRCannedRepliesViewController reloadSpecifier:](self, "reloadSpecifier:", v6);
  }
  objc_msgSend(v7, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length"))
  {

  }
  else
  {
    objc_msgSend(v7, "defaultReplyText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");

    if (!v12)
    {
      -[WRCannedRepliesViewController removeSpecifier:animated:](self, "removeSpecifier:animated:", v6, 0);
      -[WRCannedRepliesViewController saveReplies](self, "saveReplies");
    }
  }

}

- (id)customReply:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "propertyForKey:", CFSTR("WRCannedReplyKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setIncludeSmartReplies:(id)a3 specifier:(id)a4
{
  -[WRCannedRepliesStore setIncludeSmartReplies:](self->_repliesStore, "setIncludeSmartReplies:", objc_msgSend(a3, "BOOLValue"));
}

- (id)includeSmartReplies
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[WRCannedRepliesStore includeSmartReplies](self->_repliesStore, "includeSmartReplies"));
}

- (unint64_t)numberOfDefaultReplySpecifiers
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "count")
       - 1;
}

- (void)configureCellAccessoryImage:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIImage *v8;
  UIImage *accessoryImage;
  void *v10;
  UIImage *v11;
  UIImage *highlightedAccessoryImage;
  void *v13;
  void *v14;
  id v15;

  objc_msgSend(a3, "editableTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v4;
  if (!self->_accessoryImage || !self->_highlightedAccessoryImage)
  {
    objc_msgSend(v4, "_clearButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageForState:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    BPSAccessoryHighlightColor();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_flatImageWithColor:", v7);
    v8 = (UIImage *)objc_claimAutoreleasedReturnValue();
    accessoryImage = self->_accessoryImage;
    self->_accessoryImage = v8;

    BPSAccessoryColor();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_flatImageWithColor:", v10);
    v11 = (UIImage *)objc_claimAutoreleasedReturnValue();
    highlightedAccessoryImage = self->_highlightedAccessoryImage;
    self->_highlightedAccessoryImage = v11;

    v4 = v15;
  }
  objc_msgSend(v4, "_clearButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setImage:forState:", self->_accessoryImage, 0);

  objc_msgSend(v15, "_clearButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setImage:forState:", self->_highlightedAccessoryImage, 1);

}

- (void)addNewReply:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  WRCannedReply *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v4 = -[WRCannedRepliesViewController indexOfSpecifier:](self, "indexOfSpecifier:", self->_addNewSpecifier);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v4;
    v14 = -[WRCannedRepliesViewController newCannedReplySpecifier](self, "newCannedReplySpecifier");
    v6 = objc_alloc_init(WRCannedReply);
    objc_msgSend(v14, "setProperty:forKey:", v6, CFSTR("WRCannedReplyKey"));

    -[WRCannedRepliesViewController insertSpecifier:atIndex:animated:](self, "insertSpecifier:atIndex:animated:", v14, v5, 1);
    -[WRCannedRepliesViewController saveReplies](self, "saveReplies");
    -[WRCannedRepliesViewController table](self, "table");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WRCannedRepliesViewController indexPathForSpecifier:](self, "indexPathForSpecifier:", v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cellForRowAtIndexPath:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "editableTextField");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "becomeFirstResponder");

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x24BDF7F58];
    objc_msgSend(v9, "editableTextField");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postNotificationName:object:", v12, v13);

  }
}

- (id)cannedRepliesFromSpecifiers
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v4 = (int)*MEMORY[0x24BE756E0];
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v4), "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = *(id *)((char *)&self->super.super.super.super.super.isa + v4);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "propertyForKey:", CFSTR("WRCannedReplyKey"), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)cannedReplies
{
  -[WRCannedRepliesViewController loadRepliesStoreIfNeeded](self, "loadRepliesStoreIfNeeded");
  return -[WRCannedRepliesStore cannedReplies](self->_repliesStore, "cannedReplies");
}

- (void)loadRepliesStoreIfNeeded
{
  WRCannedRepliesStore *v3;
  WRCannedRepliesStore *repliesStore;

  if (!self->_repliesStore)
  {
    v3 = -[WRCannedRepliesStore initWithCategory:]([WRCannedRepliesStore alloc], "initWithCategory:", -[WRCannedRepliesViewController category](self, "category"));
    repliesStore = self->_repliesStore;
    self->_repliesStore = v3;

  }
}

- (void)saveReplies
{
  id v3;

  -[WRCannedRepliesViewController loadRepliesStoreIfNeeded](self, "loadRepliesStoreIfNeeded");
  -[WRCannedRepliesViewController cannedRepliesFromSpecifiers](self, "cannedRepliesFromSpecifiers");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[WRCannedRepliesStore setCannedReplies:](self->_repliesStore, "setCannedReplies:", v3);

}

- (unint64_t)category
{
  return self->_category;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightedAccessoryImage, 0);
  objc_storeStrong((id *)&self->_accessoryImage, 0);
  objc_storeStrong((id *)&self->_smartRepliesSpecifier, 0);
  objc_storeStrong((id *)&self->_addNewSpecifier, 0);
  objc_storeStrong((id *)&self->_repliesStore, 0);
}

- (void)tableView:moveRowAtIndexPath:toIndexPath:.cold.1()
{
  __assert_rtn("-[WRCannedRepliesViewController tableView:moveRowAtIndexPath:toIndexPath:]", "WRCannedRepliesViewController.m", 218, "destinationIndex < [specifiers count]");
}

- (void)tableView:moveRowAtIndexPath:toIndexPath:.cold.2()
{
  __assert_rtn("-[WRCannedRepliesViewController tableView:moveRowAtIndexPath:toIndexPath:]", "WRCannedRepliesViewController.m", 212, "sourceIndex < [_specifiers count]");
}

@end
