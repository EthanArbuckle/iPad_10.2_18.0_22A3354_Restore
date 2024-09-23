@implementation ICKeyboardHandler

- (void)updateHardwareKeyboardAvailability
{
  _BOOL8 v3;

  v3 = GSEventIsHardwareKeyboardAttached(self, a2) != 0;
  -[ICKeyboardHandler setInHardwareKeyboardMode:](self, "setInHardwareKeyboardMode:", v3);
}

- (void)setInHardwareKeyboardMode:(BOOL)a3
{
  id v3;

  if (self->_inHardwareKeyboardMode != a3)
  {
    self->_inHardwareKeyboardMode = a3;
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "postNotificationName:object:", CFSTR("ICHardwareKeyboardModeDidChange"), 0);

  }
}

- (BOOL)isInHardwareKeyboardMode
{
  return self->_inHardwareKeyboardMode;
}

- (ICKeyboardHandler)initWithDelegate:(id)a3
{
  id v4;
  ICKeyboardHandler *v5;
  ICKeyboardHandler *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICKeyboardHandler;
  v5 = -[ICKeyboardHandler init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, "keyboardDidChangeFrame:", UIKeyboardDidChangeFrameNotification, 0);

    -[ICKeyboardHandler updateHardwareKeyboardAvailability](v6, "updateHardwareKeyboardAvailability");
  }

  return v6;
}

+ (UIMenu)fileKeyboardShortcutMenu
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("New Note"), &stru_1005704B8, 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:](UIKeyCommand, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", CFSTR("n"), 0x100000, "addNote:", v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("New Folder"), &stru_1005704B8, 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:](UIKeyCommand, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", CFSTR("n"), 1179648, "addFolder:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Print"), &stru_1005704B8, 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:](UIKeyCommand, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", CFSTR("p"), 0x100000, "printNote:", v9));

  v14[0] = v4;
  v14[1] = v7;
  v14[2] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 3));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1005704B8, 0, 0, 1, v11));

  return (UIMenu *)v12;
}

+ (UIMenu)editKeyboardShortcutMenu
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[7];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Note List Search")));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:](UIKeyCommand, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", CFSTR("f"), 1572864, "toggleSearch:", v3));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Find and Replace"), &stru_1005704B8, 0));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:](UIKeyCommand, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", CFSTR("f"), 1179648, "replaceInNote:", v5));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Delete"), &stru_1005704B8, 0));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:](UIKeyCommand, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", UIKeyInputDelete, 0, "handleDeleteKey:", v7));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Delete Quick Note"), &stru_1005704B8, 0));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:](UIKeyCommand, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", CFSTR("\b"), 0x100000, "handleDeleteSystemPaperNote:", v9));

  objc_msgSend(v26, "setWantsPriorityOverSystemBehavior:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Edit Note"), &stru_1005704B8, 0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:](UIKeyCommand, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", CFSTR("\r"), 0, "handleReturnKey:", v11));

  objc_msgSend(v12, "setWantsPriorityOverSystemBehavior:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("End Editing"), &stru_1005704B8, 0));
  v15 = objc_claimAutoreleasedReturnValue(+[UIKeyCommand ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:](UIKeyCommand, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", CFSTR("\r"), 0x100000, "handleCmdReturnKey:", v14));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Add Link"), &stru_1005704B8, 0));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:](UIKeyCommand, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", CFSTR("k"), 0x100000, "handleAddLinkKey:", v17));

  objc_msgSend(v18, "setWantsPriorityOverSystemBehavior:", 1);
  v29[0] = v25;
  v29[1] = v28;
  v29[2] = v27;
  v29[3] = v26;
  v29[4] = v12;
  v29[5] = v15;
  v19 = (void *)v15;
  v29[6] = v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 7));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v20));

  v22 = objc_msgSend(v21, "copy");
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1005704B8, 0, 0, 1, v22));

  return (UIMenu *)v23;
}

+ (UIMenu)viewKeyboardShortcutMenu
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD v50[2];
  _QWORD v51[4];
  _QWORD v52[8];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("View Notes as List"), &stru_1005704B8, 0));
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:](UIKeyCommand, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", CFSTR("1"), 0x100000, "cmd1:", v3));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("View Notes as Gallery"), &stru_1005704B8, 0));
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:](UIKeyCommand, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", CFSTR("2"), 0x100000, "cmd2:", v5));

  v47 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("3"), 0x100000, "cmd3:"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("i"), 1310720, "toggleEditorCallouts:"));
  v6 = objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("k"), 1310720, "toggleNoteActivity:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Navigate Left"), &stru_1005704B8, 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:](UIKeyCommand, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", UIKeyInputLeftArrow, 0x100000, "systemPaperNavigateLeft:", v8));

  objc_msgSend(v9, "setWantsPriorityOverSystemBehavior:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Navigate Right"), &stru_1005704B8, 0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:](UIKeyCommand, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", UIKeyInputRightArrow, 0x100000, "systemPaperNavigateRight:", v11));

  objc_msgSend(v12, "setWantsPriorityOverSystemBehavior:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Show In Notes"), &stru_1005704B8, 0));
  v15 = objc_claimAutoreleasedReturnValue(+[UIKeyCommand ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:](UIKeyCommand, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", CFSTR("r"), 0x100000, "systemPaperShowInNotes:", v14));

  v52[0] = v49;
  v52[1] = v48;
  v52[2] = v47;
  v52[3] = v46;
  v44 = v9;
  v45 = (void *)v6;
  v52[4] = v6;
  v52[5] = v9;
  v42 = (void *)v15;
  v43 = v12;
  v52[6] = v12;
  v52[7] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v52, 8));
  v17 = objc_msgSend(v16, "mutableCopy");

  if (ICInternalSettingsIsCollapsibleSectionsEnabled(v18, v19))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Expand Section"), &stru_1005704B8, 0));
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:](UIKeyCommand, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", UIKeyInputRightArrow, 1572864, "expandSection:", v21));

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Expand All Sections"), &stru_1005704B8, 0));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:](UIKeyCommand, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", UIKeyInputRightArrow, 1703936, "expandAllSections:", v23));

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("Collapse Section"), &stru_1005704B8, 0));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:](UIKeyCommand, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", UIKeyInputLeftArrow, 1572864, "collapseSection:", v26));

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("Collapse All Sections"), &stru_1005704B8, 0));
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:](UIKeyCommand, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", UIKeyInputLeftArrow, 1703936, "collapseAllSections:", v29));

    v51[0] = v41;
    v51[1] = v24;
    v51[2] = v27;
    v51[3] = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v51, 4));
    objc_msgSend(v17, "addObjectsFromArray:", v31);

  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("Previous Note"), &stru_1005704B8, 0));
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:](UIKeyCommand, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", CFSTR("["), 1572864, "gotoPreviousNote:", v33));

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("Next Note"), &stru_1005704B8, 0));
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:](UIKeyCommand, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", CFSTR("]"), 1572864, "gotoNextNote:", v36));

  v50[0] = v34;
  v50[1] = v37;
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v50, 2));
  objc_msgSend(v17, "addObjectsFromArray:", v38);

  v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1005704B8, 0, 0, 1, v17));
  return (UIMenu *)v39;
}

+ (UIMenu)goKeyboardShortcutMenu
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Enclosing Folder"), &stru_1005704B8, 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:](UIKeyCommand, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", UIKeyInputUpArrow, 0x100000, "handleEnclosingFolderKey:", v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Go"), &stru_1005704B8, 0));
  v10 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", v6, 0, 0, 1, v7));

  return (UIMenu *)v8;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  void *v23;
  char v24;
  void *v25;
  char v26;
  void *v27;
  char v28;
  void *v29;
  char v30;
  void *v31;
  char v32;
  void *v33;
  char v34;
  void *v35;
  char v36;
  void *v37;
  char v38;
  void *v39;
  char v40;
  void *v41;
  char v42;
  void *v43;
  char v44;
  void *v45;
  char v46;
  void *v47;
  char v48;
  void *v49;
  char v50;
  void *v51;
  char v52;
  void *v53;
  char v54;
  void *v55;
  char v56;
  void *v57;
  char v58;
  void *v59;
  char v60;
  BOOL v61;
  objc_super v63;

  v6 = a4;
  if ("addNote:" == a3
    && (v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate")),
        v8 = objc_opt_respondsToSelector(v7, "canPerformAddNote"),
        v7,
        (v8 & 1) != 0))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    v10 = objc_msgSend(v9, "canPerformAddNote");
  }
  else if ("addFolder:" == a3
         && (v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate")),
             v12 = objc_opt_respondsToSelector(v11, "canPerformAddFolder"),
             v11,
             (v12 & 1) != 0))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    v10 = objc_msgSend(v9, "canPerformAddFolder");
  }
  else if ("toggleSearch:" == a3
         && (v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate")),
             v14 = objc_opt_respondsToSelector(v13, "canPerformToggleSearch"),
             v13,
             (v14 & 1) != 0))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    v10 = objc_msgSend(v9, "canPerformToggleSearch");
  }
  else if ("cmd1:" == a3
         && (v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate")),
             v16 = objc_opt_respondsToSelector(v15, "canPerformCmd1"),
             v15,
             (v16 & 1) != 0))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    v10 = objc_msgSend(v9, "canPerformCmd1");
  }
  else if ("cmd2:" == a3
         && (v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate")),
             v18 = objc_opt_respondsToSelector(v17, "canPerformCmd2"),
             v17,
             (v18 & 1) != 0))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    v10 = objc_msgSend(v9, "canPerformCmd2");
  }
  else if ("cmd3:" == a3
         && (v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate")),
             v20 = objc_opt_respondsToSelector(v19, "canPerformCmd3"),
             v19,
             (v20 & 1) != 0))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    v10 = objc_msgSend(v9, "canPerformCmd3");
  }
  else if ("handleReturnKey:" == a3
         && (v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate")),
             v22 = objc_opt_respondsToSelector(v21, "canPerformReturnKey"),
             v21,
             (v22 & 1) != 0))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    v10 = objc_msgSend(v9, "canPerformReturnKey");
  }
  else if ("handleCmdReturnKey:" == a3
         && (v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate")),
             v24 = objc_opt_respondsToSelector(v23, "canPerformCmdReturnKey"),
             v23,
             (v24 & 1) != 0))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    v10 = objc_msgSend(v9, "canPerformCmdReturnKey");
  }
  else if ("handleAddLinkKey:" == a3
         && (v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate")),
             v26 = objc_opt_respondsToSelector(v25, "canPerformAddLink"),
             v25,
             (v26 & 1) != 0))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    v10 = objc_msgSend(v9, "canPerformAddLink");
  }
  else if ("handleEnclosingFolderKey:" == a3
         && (v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate")),
             v28 = objc_opt_respondsToSelector(v27, "canPerformEnclosingFolderKey"),
             v27,
             (v28 & 1) != 0))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    v10 = objc_msgSend(v9, "canPerformEnclosingFolderKey");
  }
  else if (("performFindInNote:" == a3 || "find:" == a3)
         && (v29 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate")),
             v30 = objc_opt_respondsToSelector(v29, "canPerformFindInNote"),
             v29,
             (v30 & 1) != 0))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    v10 = objc_msgSend(v9, "canPerformFindInNote");
  }
  else if ("replaceInNote:" == a3
         && (v31 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate")),
             v32 = objc_opt_respondsToSelector(v31, "canPerformReplaceInNote"),
             v31,
             (v32 & 1) != 0))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    v10 = objc_msgSend(v9, "canPerformReplaceInNote");
  }
  else if ("handleDeleteKey:" == a3
         && (v33 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate")),
             v34 = objc_opt_respondsToSelector(v33, "canPerformDeleteKey"),
             v33,
             (v34 & 1) != 0))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    v10 = objc_msgSend(v9, "canPerformDeleteKey");
  }
  else if ("handleDeleteSystemPaperNote:" == a3
         && (v35 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate")),
             v36 = objc_opt_respondsToSelector(v35, "canPerformDeleteSystemPaperNote"),
             v35,
             (v36 & 1) != 0))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    v10 = objc_msgSend(v9, "canPerformDeleteSystemPaperNote");
  }
  else if ("printNote:" == a3
         && (v37 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate")),
             v38 = objc_opt_respondsToSelector(v37, "canPerformPrintNote"),
             v37,
             (v38 & 1) != 0))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    v10 = objc_msgSend(v9, "canPerformPrintNote");
  }
  else if ("toggleEditorCallouts:" == a3
         && (v39 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate")),
             v40 = objc_opt_respondsToSelector(v39, "canPerformToggleEditorCallouts"),
             v39,
             (v40 & 1) != 0))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    v10 = objc_msgSend(v9, "canPerformToggleEditorCallouts");
  }
  else if ("toggleNoteActivity:" == a3
         && (v41 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate")),
             v42 = objc_opt_respondsToSelector(v41, "canPerformToggleNoteActivity"),
             v41,
             (v42 & 1) != 0))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    v10 = objc_msgSend(v9, "canPerformToggleNoteActivity");
  }
  else if ("systemPaperNavigateLeft:" == a3
         && (v43 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate")),
             v44 = objc_opt_respondsToSelector(v43, "canPerformSystemPaperNavigateLeft"),
             v43,
             (v44 & 1) != 0))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    v10 = objc_msgSend(v9, "canPerformSystemPaperNavigateLeft");
  }
  else if ("systemPaperNavigateRight:" == a3
         && (v45 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate")),
             v46 = objc_opt_respondsToSelector(v45, "canPerformSystemPaperNavigateRight"),
             v45,
             (v46 & 1) != 0))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    v10 = objc_msgSend(v9, "canPerformSystemPaperNavigateRight");
  }
  else if ("systemPaperShowInNotes:" == a3
         && (v47 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate")),
             v48 = objc_opt_respondsToSelector(v47, "canPerformSystemPaperShowInNotes"),
             v47,
             (v48 & 1) != 0))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    v10 = objc_msgSend(v9, "canPerformSystemPaperShowInNotes");
  }
  else if ("expandSection:" == a3
         && (v49 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate")),
             v50 = objc_opt_respondsToSelector(v49, "canPerformExpandSection"),
             v49,
             (v50 & 1) != 0))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    v10 = objc_msgSend(v9, "canPerformExpandSection");
  }
  else if ("expandAllSections:" == a3
         && (v51 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate")),
             v52 = objc_opt_respondsToSelector(v51, "canPerformExpandAllSections"),
             v51,
             (v52 & 1) != 0))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    v10 = objc_msgSend(v9, "canPerformExpandAllSections");
  }
  else if ("collapseSection:" == a3
         && (v53 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate")),
             v54 = objc_opt_respondsToSelector(v53, "canPerformCollapseSection"),
             v53,
             (v54 & 1) != 0))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    v10 = objc_msgSend(v9, "canPerformCollapseSection");
  }
  else if ("collapseAllSections:" == a3
         && (v55 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate")),
             v56 = objc_opt_respondsToSelector(v55, "canPerformCollapseAllSections"),
             v55,
             (v56 & 1) != 0))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    v10 = objc_msgSend(v9, "canPerformCollapseAllSections");
  }
  else if ("gotoPreviousNote:" == a3
         && (v57 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate")),
             v58 = objc_opt_respondsToSelector(v57, "canPerformGotoPreviousNote"),
             v57,
             (v58 & 1) != 0))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    v10 = objc_msgSend(v9, "canPerformGotoPreviousNote");
  }
  else
  {
    if ("gotoNextNote:" != a3
      || (v59 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate")),
          v60 = objc_opt_respondsToSelector(v59, "canPerformGotoNextNote"),
          v59,
          (v60 & 1) == 0))
    {
      v63.receiver = self;
      v63.super_class = (Class)ICKeyboardHandler;
      v61 = -[ICKeyboardHandler canPerformAction:withSender:](&v63, "canPerformAction:withSender:", a3, v6);
      goto LABEL_81;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    v10 = objc_msgSend(v9, "canPerformGotoNextNote");
  }
  v61 = v10;

LABEL_81:
  return v61;
}

- (id)nextResponder
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  objc_super v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler parentResponder](self, "parentResponder"));
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)ICKeyboardHandler;
    v6 = -[ICKeyboardHandler nextResponder](&v9, "nextResponder");
    v5 = (id)objc_claimAutoreleasedReturnValue(v6);
  }
  v7 = v5;

  return v7;
}

- (void)addNote:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "performAddNote:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    objc_msgSend(v6, "performAddNote:", v7);

  }
}

- (void)addFolder:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "performAddFolder:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    objc_msgSend(v6, "performAddFolder:", v7);

  }
}

- (void)toggleSearch:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "performToggleSearch:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    objc_msgSend(v6, "performToggleSearch:", v7);

  }
}

- (void)printNote:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "performPrintNote:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    objc_msgSend(v6, "performPrintNote:", v7);

  }
}

- (void)cmd1:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "performCmd1:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    objc_msgSend(v6, "performCmd1:", v7);

  }
}

- (void)cmd2:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "performCmd2:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    objc_msgSend(v6, "performCmd2:", v7);

  }
}

- (void)cmd3:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "performCmd3:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    objc_msgSend(v6, "performCmd3:", v7);

  }
}

- (void)toggleEditorCallouts:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "performToggleEditorCallouts:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    objc_msgSend(v6, "performToggleEditorCallouts:", v7);

  }
}

- (void)toggleNoteActivity:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "performToggleNoteActivity:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    objc_msgSend(v6, "performToggleNoteActivity:", v7);

  }
}

- (void)handleDeleteKey:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "performDeleteKey:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    objc_msgSend(v6, "performDeleteKey:", v7);

  }
}

- (void)handleDeleteSystemPaperNote:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "performDeleteQuickNoteKey:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    objc_msgSend(v6, "performDeleteQuickNoteKey:", v7);

  }
}

- (void)systemPaperNavigateLeft:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "systemPaperNavigateLeft:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    objc_msgSend(v6, "systemPaperNavigateLeft:", v7);

  }
}

- (void)systemPaperNavigateRight:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "systemPaperNavigateRight:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    objc_msgSend(v6, "systemPaperNavigateRight:", v7);

  }
}

- (void)systemPaperShowInNotes:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "systemPaperShowInNotes:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    objc_msgSend(v6, "systemPaperShowInNotes:", v7);

  }
}

- (void)handleReturnKey:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "performReturnKey:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    objc_msgSend(v6, "performReturnKey:", v7);

  }
}

- (void)handleCmdReturnKey:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "performCmdReturnKey:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    objc_msgSend(v6, "performCmdReturnKey:", v7);

  }
}

- (void)handleAddLinkKey:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "performAddLinkKey:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    objc_msgSend(v6, "performAddLinkKey:", v7);

  }
}

- (void)handleEnclosingFolderKey:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "performEnclosingFolderKey:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    objc_msgSend(v6, "performEnclosingFolderKey:", v7);

  }
}

- (void)performFindInNote:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "performFindInNote:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    objc_msgSend(v6, "performFindInNote:", v7);

  }
}

- (void)replaceInNote:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "performReplaceInNote:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    objc_msgSend(v6, "performReplaceInNote:", v7);

  }
}

- (void)expandSection:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "performExpandSection:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    objc_msgSend(v6, "performExpandSection:", v7);

  }
}

- (void)expandAllSections:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "performExpandAllSections:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    objc_msgSend(v6, "performExpandAllSections:", v7);

  }
}

- (void)collapseSection:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "performCollapseSection:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    objc_msgSend(v6, "performCollapseSection:", v7);

  }
}

- (void)collapseAllSections:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "performCollapseAllSections:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    objc_msgSend(v6, "performCollapseAllSections:", v7);

  }
}

- (void)gotoPreviousNote:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "performGotoPreviousNote:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    objc_msgSend(v6, "performGotoPreviousNote:", v7);

  }
}

- (void)gotoNextNote:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "performGotoNextNote:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    objc_msgSend(v6, "performGotoNextNote:", v7);

  }
}

- (void)validateCommand:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "action") == "cmd3:")
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cmd3Title"));
    goto LABEL_7;
  }
  if (objc_msgSend(v7, "action") == "toggleEditorCallouts:")
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "toggleEditorCalloutsTitle"));
    goto LABEL_7;
  }
  if (objc_msgSend(v7, "action") == "toggleNoteActivity:")
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "toggleNoteActivityTitle"));
LABEL_7:
    v6 = (void *)v5;
    objc_msgSend(v7, "setDiscoverabilityTitle:", v5);

  }
}

- (void)keyboardDidChangeFrame:(id)a3
{
  -[ICKeyboardHandler setInHardwareKeyboardMode:](self, "setInHardwareKeyboardMode:", +[UIKeyboard isInHardwareKeyboardMode](UIKeyboard, "isInHardwareKeyboardMode", a3));
}

- (BOOL)globalKeyCommandsInhibited
{
  void *v3;
  BOOL v4;

  if ((+[UIDevice ic_isiPad](UIDevice, "ic_isiPad") & 1) == 0
    && !+[UIDevice ic_isVision](UIDevice, "ic_isVision"))
  {
    return 1;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppDelegate sharedInstance](ICAppDelegate, "sharedInstance"));
  if ((objc_msgSend(v3, "isAnyWelcomeScreenVisible") & 1) != 0)
    v4 = 1;
  else
    v4 = -[ICKeyboardHandler firstResponderInhibitsGlobalKeyCommands](self, "firstResponderInhibitsGlobalKeyCommands");

  return v4;
}

- (BOOL)firstResponderInhibitsGlobalKeyCommands
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
  v4 = objc_opt_respondsToSelector(v3, "firstResponder");

  if ((v4 & 1) == 0)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler delegate](self, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstResponder"));

  v7 = v6;
  if (v7)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[ICKeyboardHandler mostRecentInhibitingGlobalKeyCommandResponder](self, "mostRecentInhibitingGlobalKeyCommandResponder"));

    if (v7 == v8)
    {
      LODWORD(v11) = -[ICKeyboardHandler mostRecentInhibitingGlobalKeyCommandResponderResult](self, "mostRecentInhibitingGlobalKeyCommandResponderResult");

    }
    else
    {
      v9 = v7;
      while (1)
      {
        v10 = objc_msgSend(v9, "ic_inhibitsGlobalKeyCommands");
        if ((v10 & 1) != 0)
          break;
        v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nextResponder"));

        v9 = (void *)v11;
        if (!v11)
          goto LABEL_12;
      }
      LODWORD(v11) = 1;
LABEL_12:
      -[ICKeyboardHandler setMostRecentInhibitingGlobalKeyCommandResponder:](self, "setMostRecentInhibitingGlobalKeyCommandResponder:", v7);
      -[ICKeyboardHandler setMostRecentInhibitingGlobalKeyCommandResponderResult:](self, "setMostRecentInhibitingGlobalKeyCommandResponderResult:", v10);

    }
  }
  else
  {
    -[ICKeyboardHandler setMostRecentInhibitingGlobalKeyCommandResponder:](self, "setMostRecentInhibitingGlobalKeyCommandResponder:", 0);
    LODWORD(v11) = 0;
  }

  return (_DWORD)v11 != 0;
}

- (UIResponder)parentResponder
{
  return (UIResponder *)objc_loadWeakRetained((id *)&self->_parentResponder);
}

- (void)setParentResponder:(id)a3
{
  objc_storeWeak((id *)&self->_parentResponder, a3);
}

- (ICKeyboardHandlerDelegate)delegate
{
  return (ICKeyboardHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIResponder)mostRecentInhibitingGlobalKeyCommandResponder
{
  return (UIResponder *)objc_loadWeakRetained((id *)&self->_mostRecentInhibitingGlobalKeyCommandResponder);
}

- (void)setMostRecentInhibitingGlobalKeyCommandResponder:(id)a3
{
  objc_storeWeak((id *)&self->_mostRecentInhibitingGlobalKeyCommandResponder, a3);
}

- (BOOL)mostRecentInhibitingGlobalKeyCommandResponderResult
{
  return self->_mostRecentInhibitingGlobalKeyCommandResponderResult;
}

- (void)setMostRecentInhibitingGlobalKeyCommandResponderResult:(BOOL)a3
{
  self->_mostRecentInhibitingGlobalKeyCommandResponderResult = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mostRecentInhibitingGlobalKeyCommandResponder);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_parentResponder);
}

@end
