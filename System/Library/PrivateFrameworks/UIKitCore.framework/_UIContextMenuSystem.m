@implementation _UIContextMenuSystem

+ (_UIContextMenuSystem)_sharedSystem
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37___UIContextMenuSystem__sharedSystem__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_1151 != -1)
    dispatch_once(&_MergedGlobals_1151, block);
  return (_UIContextMenuSystem *)(id)qword_1ECD7F198;
}

- (id)_init
{
  void *v3;
  _UIContextMenuSystem *v4;
  objc_super v6;

  -[_UIContextMenuSystem _defaultRootMenuChildren](self, "_defaultRootMenuChildren");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)_UIContextMenuSystem;
  v4 = -[UIMenuSystem initWithRootMenuChildren:](&v6, sel_initWithRootMenuChildren_, v3);

  return v4;
}

- (id)_defaultRootMenuChildren
{
  void *v2;
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
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
  int v57;
  void *v58;
  _QWORD v59[3];
  void *v60;
  _QWORD v61[3];
  _QWORD v62[2];
  _QWORD v63[3];
  _QWORD v64[3];
  void *v65;
  _QWORD v66[2];
  _QWORD v67[5];
  _QWORD v68[8];
  _QWORD v69[8];

  v69[6] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend((id)UIApp, "_supportsMenuActions"))
    return MEMORY[0x1E0C9AA60];
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    if ((objc_msgSend((id)UIApp, "_appAdoptsUICanvasLifecycle") & 1) != 0)
      v57 = 1;
    else
      v57 = objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle");
  }
  else
  {
    v57 = 0;
  }
  +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel_cut_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v69[0] = v5;
  +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel_copy_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v69[1] = v6;
  +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel_paste_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v69[2] = v7;
  +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel_delete_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v69[3] = v8;
  +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel_select_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v69[4] = v9;
  +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel_selectAll_);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v69[5] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIMenu _defaultInlineMenuWithIdentifier:children:](UIMenu, "_defaultInlineMenuWithIdentifier:children:", CFSTR("com.apple.menu.standard-edit"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setPreferredElementSize:", 1);
  v56 = v12;
  v68[0] = v12;
  +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel_promptForReplace_);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v67[0] = v55;
  +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel_transliterateChinese_);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v67[1] = v54;
  +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel__insertDrawing_);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v67[2] = v53;
  v13 = MEMORY[0x1E0C9AA60];
  +[UIMenu _defaultInlineMenuWithIdentifier:children:](UIMenu, "_defaultInlineMenuWithIdentifier:children:", CFSTR("com.apple.menu.insert-from-external-sources"), MEMORY[0x1E0C9AA60]);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v52;
  +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel_captureTextFromCamera_);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v66[1] = v51;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 2);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIMenu _defaultMenuWithIdentifier:children:](UIMenu, "_defaultMenuWithIdentifier:children:", CFSTR("com.apple.menu.autofill"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v67[3] = v49;
  +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel__startWritingTools_);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v67[4] = v48;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 5);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIMenu _defaultInlineMenuWithIdentifier:children:](UIMenu, "_defaultInlineMenuWithIdentifier:children:", CFSTR("com.apple.menu.replace"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v68[1] = v46;
  if (v57)
  {
    +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel__openInNewCanvas_);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v65, 1);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v13;
  +[UIMenu _defaultInlineMenuWithIdentifier:children:](UIMenu, "_defaultInlineMenuWithIdentifier:children:", CFSTR("com.apple.menu.open"), v13);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v68[2] = v45;
  +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel_toggleBoldface_);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = v44;
  +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel_toggleItalics_);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v63[1] = v43;
  +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel_toggleUnderline_);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v63[2] = v42;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 3);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIMenu _defaultInlineMenuWithIdentifier:children:](UIMenu, "_defaultInlineMenuWithIdentifier:children:", CFSTR("com.apple.menu.text-style"), v41);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v40;
  +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel_makeTextWritingDirectionRightToLeft_);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = v39;
  +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel_makeTextWritingDirectionLeftToRight_);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v62[1] = v38;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 2);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIMenu _defaultInlineMenuWithIdentifier:children:](UIMenu, "_defaultInlineMenuWithIdentifier:children:", CFSTR("com.apple.menu.writing-direction"), v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v64[1] = v36;
  +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel__showTextFormattingOptions_);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v64[2] = v35;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 3);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIMenu _defaultMenuWithIdentifier:children:](UIMenu, "_defaultMenuWithIdentifier:children:", CFSTR("com.apple.menu.format"), v34);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v68[3] = v33;
  +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel_findSelected_);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = v32;
  +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel__define_);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v61[1] = v31;
  +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel__translate_);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v61[2] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIMenu _defaultInlineMenuWithIdentifier:children:](UIMenu, "_defaultInlineMenuWithIdentifier:children:", CFSTR("com.apple.menu.lookup"), v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v68[4] = v28;
  +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel_addShortcut_);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIMenu _defaultInlineMenuWithIdentifier:children:](UIMenu, "_defaultInlineMenuWithIdentifier:children:", CFSTR("com.apple.menu.learn"), v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v68[5] = v25;
  +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel__accessibilitySpeak_);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = v14;
  +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel__accessibilitySpeakLanguageSelection_);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v59[1] = v15;
  +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel__accessibilityPauseSpeaking_);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v59[2] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIMenu _defaultInlineMenuWithIdentifier:children:](UIMenu, "_defaultInlineMenuWithIdentifier:children:", CFSTR("com.apple.command.speech"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v68[6] = v18;
  +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel_share_);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIMenu _defaultInlineMenuWithIdentifier:children:](UIMenu, "_defaultInlineMenuWithIdentifier:children:", CFSTR("com.apple.menu.share"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v68[7] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v57)
  {

  }
  return v22;
}

@end
