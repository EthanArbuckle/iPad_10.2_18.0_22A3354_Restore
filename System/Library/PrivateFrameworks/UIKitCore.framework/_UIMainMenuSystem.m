@implementation _UIMainMenuSystem

- (id)_init
{
  void *v3;
  _UIMainMenuSystem *v4;
  objc_super v6;

  -[_UIMainMenuSystem _defaultRootMenuChildren](self, "_defaultRootMenuChildren");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)_UIMainMenuSystem;
  v4 = -[UIMenuSystem initWithRootMenuChildren:](&v6, sel_initWithRootMenuChildren_, v3);

  return v4;
}

- (void)setNeedsRebuild
{
  _UIMenuBuilder *automaticallyRebuildingBuilder;
  objc_super v4;

  automaticallyRebuildingBuilder = self->_automaticallyRebuildingBuilder;
  self->_automaticallyRebuildingBuilder = 0;

  v4.receiver = self;
  v4.super_class = (Class)_UIMainMenuSystem;
  -[UIMenuSystem setNeedsRebuild](&v4, sel_setNeedsRebuild);
}

+ (_UIMainMenuSystem)_sharedSystem
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34___UIMainMenuSystem__sharedSystem__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_3_0 != -1)
    dispatch_once(&_MergedGlobals_3_0, block);
  return (_UIMainMenuSystem *)(id)qword_1ECD7A4B8;
}

- (id)_defaultRootMenuChildren
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
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
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  int v87;
  void *v88;
  void *v89;
  int v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  _QWORD v101[2];
  void *v102;
  _QWORD v103[5];
  _QWORD v104[3];
  _QWORD v105[2];
  _QWORD v106[2];
  _QWORD v107[3];
  _QWORD v108[4];
  _QWORD v109[2];
  _QWORD v110[2];
  _QWORD v111[2];
  _QWORD v112[5];
  _QWORD v113[6];
  _QWORD v114[2];
  _QWORD v115[7];
  void *v116;
  void *v117;
  _QWORD v118[4];
  _QWORD v119[5];
  _QWORD v120[9];

  v120[7] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend((id)UIApp, "_supportsMenuActions"))
    return MEMORY[0x1E0C9AA60];
  v2 = MEMORY[0x1E0C9AA60];
  +[UIMenu _defaultInlineMenuWithIdentifier:children:](UIMenu, "_defaultInlineMenuWithIdentifier:children:", CFSTR("com.apple.menu.about"), MEMORY[0x1E0C9AA60]);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v119[0] = v99;
  +[UIMenu _defaultInlineMenuWithIdentifier:children:](UIMenu, "_defaultInlineMenuWithIdentifier:children:", CFSTR("com.apple.menu.preferences"), v2);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v119[1] = v98;
  +[UIMenu _defaultInlineMenuWithIdentifier:children:](UIMenu, "_defaultInlineMenuWithIdentifier:children:", CFSTR("com.apple.menu.services"), v2);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v119[2] = v97;
  +[UIMenu _defaultInlineMenuWithIdentifier:children:](UIMenu, "_defaultInlineMenuWithIdentifier:children:", CFSTR("com.apple.menu.hide"), v2);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v119[3] = v96;
  +[UIMenu _defaultInlineMenuWithIdentifier:children:](UIMenu, "_defaultInlineMenuWithIdentifier:children:", CFSTR("com.apple.menu.quit"), v2);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v119[4] = v94;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v119, 5);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIMenu _defaultMenuWithIdentifier:children:](UIMenu, "_defaultMenuWithIdentifier:children:", CFSTR("com.apple.menu.application"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v120[0] = v92;
  +[UIMenu _defaultInlineMenuWithIdentifier:children:](UIMenu, "_defaultInlineMenuWithIdentifier:children:", CFSTR("com.apple.menu.new-scene"), v2);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v118[0] = v91;
  v90 = objc_msgSend((id)UIApp, "_supportsOpenCommand");
  if (v90)
  {
    +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel_open_);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v117 = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v117, 1);
    v2 = objc_claimAutoreleasedReturnValue();
  }
  +[UIMenu _defaultInlineMenuWithIdentifier:children:](UIMenu, "_defaultInlineMenuWithIdentifier:children:", CFSTR("com.apple.menu.open"), v2);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v118[1] = v89;
  v4 = MEMORY[0x1E0C9AA60];
  +[UIMenu _defaultInlineMenuWithIdentifier:children:](UIMenu, "_defaultInlineMenuWithIdentifier:children:", CFSTR("com.apple.menu.close"), MEMORY[0x1E0C9AA60]);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v118[2] = v88;
  v87 = objc_msgSend((id)UIApp, "_supportsPrintCommand");
  v95 = (void *)v2;
  if (v87)
  {
    +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel_print_);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v116, 1);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v4;
  }
  v20 = (void *)v5;
  +[UIMenu _defaultInlineMenuWithIdentifier:children:](UIMenu, "_defaultInlineMenuWithIdentifier:children:", CFSTR("com.apple.menu.print"), v5);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v118[3] = v86;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v118, 4);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIMenu _defaultMenuWithIdentifier:children:](UIMenu, "_defaultMenuWithIdentifier:children:", CFSTR("com.apple.menu.file"), v85);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v120[1] = v84;
  +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel_undo_);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v114[0] = v83;
  +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel_redo_);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v114[1] = v82;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v114, 2);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIMenu _defaultInlineMenuWithIdentifier:children:](UIMenu, "_defaultInlineMenuWithIdentifier:children:", CFSTR("com.apple.menu.undo-redo"), v81);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v115[0] = v80;
  +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel_cut_);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v113[0] = v79;
  +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel_copy_);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v113[1] = v78;
  +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel_paste_);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v113[2] = v77;
  +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel_pasteAndMatchStyle_);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v113[3] = v76;
  +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel_delete_);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v113[4] = v75;
  +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel_selectAll_);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v113[5] = v74;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v113, 6);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIMenu _defaultInlineMenuWithIdentifier:children:](UIMenu, "_defaultInlineMenuWithIdentifier:children:", CFSTR("com.apple.menu.standard-edit"), v73);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v115[1] = v72;
  v6 = dyld_program_sdk_at_least();
  +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel_find_);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v112[0] = v71;
  +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel_findAndReplace_);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v112[1] = v70;
  +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel_findNext_);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v112[2] = v69;
  +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel_findPrevious_);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v112[3] = v68;
  +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel_useSelectionForFind_);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v112[4] = v67;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v112, 5);
  v7 = objc_claimAutoreleasedReturnValue();
  v66 = (void *)v7;
  if (v6)
    v8 = v7;
  else
    v8 = v4;
  +[UIMenu _defaultInlineMenuWithIdentifier:children:](UIMenu, "_defaultInlineMenuWithIdentifier:children:", CFSTR("com.apple.menu.find"), v8);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v115[2] = v65;
  +[UIMenu _defaultInlineMenuWithIdentifier:children:](UIMenu, "_defaultInlineMenuWithIdentifier:children:", CFSTR("com.apple.menu.spelling-panel"), v4);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v111[0] = v64;
  +[UIMenu _defaultInlineMenuWithIdentifier:children:](UIMenu, "_defaultInlineMenuWithIdentifier:children:", CFSTR("com.apple.menu.spelling-options"), v4);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v111[1] = v63;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v111, 2);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIMenu _defaultMenuWithIdentifier:children:](UIMenu, "_defaultMenuWithIdentifier:children:", CFSTR("com.apple.menu.spelling"), v62);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v115[3] = v61;
  +[UIMenu _defaultInlineMenuWithIdentifier:children:](UIMenu, "_defaultInlineMenuWithIdentifier:children:", CFSTR("com.apple.menu.substitutions-panel"), v4);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v110[0] = v60;
  +[UIMenu _defaultInlineMenuWithIdentifier:children:](UIMenu, "_defaultInlineMenuWithIdentifier:children:", CFSTR("com.apple.menu.substitution-options"), v4);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v110[1] = v59;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v110, 2);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIMenu _defaultMenuWithIdentifier:children:](UIMenu, "_defaultMenuWithIdentifier:children:", CFSTR("com.apple.menu.substitutions"), v58);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v115[4] = v57;
  +[UIMenu _defaultMenuWithIdentifier:children:](UIMenu, "_defaultMenuWithIdentifier:children:", CFSTR("com.apple.menu.transformations"), v4);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v115[5] = v56;
  +[UIMenu _defaultMenuWithIdentifier:children:](UIMenu, "_defaultMenuWithIdentifier:children:", CFSTR("com.apple.command.speech"), v4);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v115[6] = v55;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v115, 7);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIMenu _defaultMenuWithIdentifier:children:](UIMenu, "_defaultMenuWithIdentifier:children:", CFSTR("com.apple.menu.edit"), v54);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v120[2] = v53;
  +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel_toggleBoldface_);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v107[0] = v52;
  +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel_toggleItalics_);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v107[1] = v51;
  +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel_toggleUnderline_);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v107[2] = v50;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v107, 3);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIMenu _defaultInlineMenuWithIdentifier:children:](UIMenu, "_defaultInlineMenuWithIdentifier:children:", CFSTR("com.apple.menu.text-style"), v49);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v108[0] = v48;
  +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel_increaseSize_);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v106[0] = v47;
  +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel_decreaseSize_);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v106[1] = v46;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v106, 2);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIMenu _defaultInlineMenuWithIdentifier:children:](UIMenu, "_defaultInlineMenuWithIdentifier:children:", CFSTR("com.apple.menu.text-size"), v45);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v108[1] = v44;
  +[UIMenu _defaultInlineMenuWithIdentifier:children:](UIMenu, "_defaultInlineMenuWithIdentifier:children:", CFSTR("com.apple.menu.text-color"), v4);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v108[2] = v43;
  +[UIMenu _defaultInlineMenuWithIdentifier:children:](UIMenu, "_defaultInlineMenuWithIdentifier:children:", CFSTR("com.apple.menu.text-style-pasteboard"), v4);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v108[3] = v42;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v108, 4);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIMenu _defaultMenuWithIdentifier:children:](UIMenu, "_defaultMenuWithIdentifier:children:", CFSTR("com.apple.menu.font"), v41);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v109[0] = v40;
  +[UIMenu _defaultInlineMenuWithIdentifier:children:](UIMenu, "_defaultInlineMenuWithIdentifier:children:", CFSTR("com.apple.menu.alignment"), v4);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v105[0] = v39;
  +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel_makeTextWritingDirectionNatural_);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v104[0] = v38;
  +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel_makeTextWritingDirectionRightToLeft_);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v104[1] = v37;
  +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel_makeTextWritingDirectionLeftToRight_);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v104[2] = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v104, 3);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIMenu _defaultMenuWithIdentifier:children:](UIMenu, "_defaultMenuWithIdentifier:children:", CFSTR("com.apple.menu.writing-direction"), v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v105[1] = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v105, 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIMenu _defaultMenuWithIdentifier:children:](UIMenu, "_defaultMenuWithIdentifier:children:", CFSTR("com.apple.menu.text"), v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v109[1] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v109, 2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIMenu _defaultMenuWithIdentifier:children:](UIMenu, "_defaultMenuWithIdentifier:children:", CFSTR("com.apple.menu.format"), v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v120[3] = v30;
  +[UIMenu _defaultInlineMenuWithIdentifier:children:](UIMenu, "_defaultInlineMenuWithIdentifier:children:", CFSTR("com.apple.menu.toolbar"), v4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v103[0] = v29;
  +[UIMenu _defaultInlineMenuWithIdentifier:children:](UIMenu, "_defaultInlineMenuWithIdentifier:children:", CFSTR("com.apple.menu.view-orientation"), v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v103[1] = v28;
  +[UIMenu _defaultInlineMenuWithIdentifier:children:](UIMenu, "_defaultInlineMenuWithIdentifier:children:", CFSTR("com.apple.menu.view-sizing"), v4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v103[2] = v27;
  +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel_toggleSidebar_);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v102, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIMenu _defaultInlineMenuWithIdentifier:children:](UIMenu, "_defaultInlineMenuWithIdentifier:children:", CFSTR("com.apple.menu.sidebar"), v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v103[3] = v24;
  +[UIMenu _defaultInlineMenuWithIdentifier:children:](UIMenu, "_defaultInlineMenuWithIdentifier:children:", CFSTR("com.apple.menu.fullscreen"), v4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v103[4] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v103, 5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIMenu _defaultMenuWithIdentifier:children:](UIMenu, "_defaultMenuWithIdentifier:children:", CFSTR("com.apple.menu.view"), v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v120[4] = v21;
  +[UIMenu _defaultInlineMenuWithIdentifier:children:](UIMenu, "_defaultInlineMenuWithIdentifier:children:", CFSTR("com.apple.menu.minimize-and-zoom"), v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v101[0] = v9;
  +[UIMenu _defaultInlineMenuWithIdentifier:children:](UIMenu, "_defaultInlineMenuWithIdentifier:children:", CFSTR("com.apple.menu.bring-all-to-front"), v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v101[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v101, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIMenu _defaultMenuWithIdentifier:children:](UIMenu, "_defaultMenuWithIdentifier:children:", CFSTR("com.apple.menu.window"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v120[5] = v12;
  +[UICommand _defaultCommandForAction:](UIKeyCommand, "_defaultCommandForAction:", sel_showHelp_);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_nonRepeatableKeyCommand");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v100, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIMenu _defaultMenuWithIdentifier:children:](UIMenu, "_defaultMenuWithIdentifier:children:", CFSTR("com.apple.menu.help"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v120[6] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v120, 7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v87)
  {

  }
  if (v90)
  {

  }
  return v17;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_UIMainMenuSystem;
  -[_UIMainMenuSystem dealloc](&v2, sel_dealloc);
}

- (void)_automaticallyRebuildIfNeeded
{
  id WeakRetained;
  id v4;
  id v5;
  _UIMenuBuilder *v6;
  _UIMenuBuilder *automaticallyRebuildingBuilder;
  id v8;
  id v9;

  if (!self->_automaticallyRebuildingBuilder)
  {
    v8 = (id)UIApp;
    WeakRetained = objc_loadWeakRetained((id *)&self->_initialBuildingResponderOverride);

    if (WeakRetained)
    {
      v4 = objc_loadWeakRetained((id *)&self->_initialBuildingResponderOverride);

      v5 = v4;
    }
    else
    {
      v5 = v8;
    }
    v9 = v5;
    v6 = -[UIMenuSystem _newBuilderFromResponderChain:atLocation:inCoordinateSpace:](self, "_newBuilderFromResponderChain:atLocation:inCoordinateSpace:", v5, 0, NAN, NAN);
    automaticallyRebuildingBuilder = self->_automaticallyRebuildingBuilder;
    self->_automaticallyRebuildingBuilder = v6;

  }
}

- (NSArray)_keyCommands
{
  -[_UIMainMenuSystem _automaticallyRebuildIfNeeded](self, "_automaticallyRebuildIfNeeded");
  return -[_UIMenuBuilder _keyCommands](self->_automaticallyRebuildingBuilder, "_keyCommands");
}

- (UIMenu)_rootMenu
{
  -[_UIMainMenuSystem _automaticallyRebuildIfNeeded](self, "_automaticallyRebuildIfNeeded");
  return (UIMenu *)-[_UIMenuBuilder menuForIdentifier:](self->_automaticallyRebuildingBuilder, "menuForIdentifier:", CFSTR("com.apple.menu.root"));
}

- (void)_setInitialBuildingResponder:(id)a3
{
  objc_storeWeak((id *)&self->_initialBuildingResponderOverride, a3);
  -[_UIMainMenuSystem setNeedsRebuild](self, "setNeedsRebuild");
}

- (BOOL)_buildMenuWithBuilder:(id)a3 fromResponderChain:(id)a4 atLocation:(CGPoint)a5 inCoordinateSpace:(id)a6
{
  double y;
  double x;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  int v29;
  int v30;
  BOOL v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  char v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  char v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  char v58;
  char v59;
  _QWORD v60[4];
  id v61;
  objc_super v62;

  y = a5.y;
  x = a5.x;
  v11 = a3;
  v62.receiver = self;
  v62.super_class = (Class)_UIMainMenuSystem;
  LODWORD(v12) = -[UIMenuSystem _buildMenuWithBuilder:fromResponderChain:atLocation:inCoordinateSpace:](&v62, sel__buildMenuWithBuilder_fromResponderChain_atLocation_inCoordinateSpace_, v11, a4, a6, x, y);
  objc_msgSend(v11, "menuForIdentifier:", CFSTR("com.apple.menu.sidebar"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "menuForIdentifier:", CFSTR("com.apple.menu.fullscreen"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!(_DWORD)v12)
    goto LABEL_17;
  if (v13)
  {
    objc_msgSend(v13, "children");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "count") == 1)
    {
      v58 = (char)v12;
      objc_msgSend(v13, "children");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_self();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v13, "children");
        v54 = v13;
        v56 = v14;
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "firstObject");
        v19 = v16;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "action") == (_QWORD)sel_toggleSidebar_;

        v16 = v19;
        v13 = v54;
        v14 = v56;
      }
      else
      {
        v21 = 0;
      }

      LOBYTE(v12) = v58;
    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }
  v22 = v13;
  if (v14)
  {
    v23 = v14;
    objc_msgSend(v14, "children");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count") == 0;

  }
  else
  {
    v23 = 0;
    v25 = 0;
  }
  v26 = v21;
  objc_msgSend(v11, "_parentOfMenuForIdentifier:commandForIdentifier:", CFSTR("com.apple.menu.sidebar"), 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_parentOfMenuForIdentifier:commandForIdentifier:", CFSTR("com.apple.menu.fullscreen"), 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v27, "isEqualToString:", v28);
  if (!v26)
  {

    v14 = v23;
    v13 = v22;
    goto LABEL_19;
  }
  v30 = v25 & v29;

  v31 = v30 == 1;
  v14 = v23;
  v13 = v22;
  if (v31)
  {
LABEL_17:
    objc_msgSend(v11, "removeMenuForIdentifier:", CFSTR("com.apple.menu.sidebar"));
    v60[0] = MEMORY[0x1E0C809B0];
    v60[1] = 3221225472;
    v60[2] = __91___UIMainMenuSystem__buildMenuWithBuilder_fromResponderChain_atLocation_inCoordinateSpace___block_invoke;
    v60[3] = &unk_1E16B2B18;
    v61 = v13;
    objc_msgSend(v11, "replaceChildrenOfMenuForIdentifier:fromChildrenBlock:", CFSTR("com.apple.menu.fullscreen"), v60);
    v27 = v61;
LABEL_19:

  }
  objc_msgSend(v11, "menuForIdentifier:", CFSTR("com.apple.menu.edit"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    objc_msgSend(v11, "_parentOfMenuForIdentifier:commandForIdentifier:", CFSTR("com.apple.menu.edit"), 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v33, "isEqualToString:", CFSTR("com.apple.menu.root")))
    {
LABEL_33:

      goto LABEL_34;
    }
    v57 = v14;
    v59 = (char)v12;
    v34 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v11, "_keyCommands");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setWithArray:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel_startDictation_);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel_orderFrontCharacterPalette_);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel__handleLegacyEmojiKeyboardShortcut_);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v12, "action");
    objc_msgSend(v12, "propertyList");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "commandForAction:propertyList:", v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v36;
    if (v40)
    {

    }
    else
    {
      v41 = objc_msgSend(v36, "containsObject:", v12);

      if ((v41 & 1) == 0)
        objc_msgSend(v53, "addObject:", v12);
    }
    v42 = objc_msgSend(v37, "action");
    objc_msgSend(v37, "propertyList");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "commandForAction:propertyList:", v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
    {

    }
    else
    {
      v45 = objc_msgSend(v55, "action");
      objc_msgSend(v55, "propertyList");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "commandForAction:propertyList:", v45, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v47 && (objc_msgSend(v52, "containsObject:", v37) & 1) == 0)
      {
        v51 = objc_msgSend(v52, "containsObject:", v55);

        v48 = v52;
        if ((v51 & 1) == 0)
        {
          objc_msgSend(v53, "addObject:", v37);
          objc_msgSend(v53, "addObject:", v55);
        }
        goto LABEL_32;
      }

    }
    v48 = v52;
LABEL_32:
    +[UIMenu _defaultInlineMenuWithIdentifier:children:](UIMenu, "_defaultInlineMenuWithIdentifier:children:", CFSTR("com.apple.menu.dictation-emoji"), v53);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "insertChildMenu:atEndOfMenuForIdentifier:", v49, CFSTR("com.apple.menu.edit"));

    LOBYTE(v12) = v59;
    v14 = v57;
    goto LABEL_33;
  }
LABEL_34:

  return (char)v12;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_initialBuildingResponderOverride);
  objc_storeStrong((id *)&self->_automaticallyRebuildingBuilder, 0);
}

@end
