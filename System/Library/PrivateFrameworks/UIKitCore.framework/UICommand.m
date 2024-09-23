@implementation UICommand

- (UICommand)initWithCommand:(id)a3
{
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UICommand *v9;
  objc_super v11;

  v4 = (id *)a3;
  objc_msgSend(v4, "_imageOrName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_asMenuElementImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_asMenuElementImageName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)UICommand;
  v9 = -[UIMenuElement initWithTitle:image:imageName:](&v11, sel_initWithTitle_image_imageName_, v6, v7, v8);

  if (v9)
  {
    objc_storeStrong(&v9->__target, v4[19]);
    v9->_action = (SEL)v4[15];
    v9->_fallbackAction = (SEL)v4[18];
    objc_storeStrong((id *)&v9->super._attributedTitle, v4[1]);
    objc_storeStrong((id *)&v9->super._subtitle, v4[2]);
    objc_storeStrong(&v9->_propertyList, v4[16]);
    objc_storeStrong((id *)&v9->_alternates, v4[17]);
    objc_storeStrong((id *)&v9->_discoverabilityTitle, v4[14]);
    *((_DWORD *)v9 + 18) = *((_DWORD *)v4 + 18);
    *((_DWORD *)v9 + 19) = *((_DWORD *)v4 + 19);
    objc_storeStrong((id *)&v9->_selectedImage, v4[13]);
    objc_storeStrong((id *)&v9->super._accessibilityIdentifier, v4[3]);
    v9->super.__preferredDisplayMode = (unint64_t)v4[4];
  }

  return v9;
}

- (UICommand)initWithTitle:(id)a3 image:(id)a4 imageName:(id)a5 action:(SEL)a6 propertyList:(id)a7 alternates:(id)a8 discoverabilityTitle:(id)a9 attributes:(unint64_t)a10 state:(int64_t)a11
{
  return -[UICommand initWithTitle:image:imageName:action:fallbackAction:propertyList:alternates:discoverabilityTitle:attributes:state:](self, "initWithTitle:image:imageName:action:fallbackAction:propertyList:alternates:discoverabilityTitle:attributes:state:", a3, a4, a5, a6, 0, a7, a8, 0, a10, a11);
}

- (UICommand)initWithTitle:(id)a3 image:(id)a4 imageName:(id)a5 action:(SEL)a6 fallbackAction:(SEL)a7 propertyList:(id)a8 alternates:(id)a9 discoverabilityTitle:(id)a10 attributes:(unint64_t)a11 state:(int64_t)a12
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *DeepCopy;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  void *v29;
  UICommand *v30;
  UICommand *v31;
  id target;
  uint64_t v33;
  NSArray *alternates;
  uint64_t v35;
  NSString *discoverabilityTitle;
  void *v41;
  void *v42;
  id v44;
  objc_super v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v44 = a5;
  v17 = a8;
  v18 = a9;
  v19 = a10;
  v41 = v16;
  v42 = v15;
  if (v17)
  {
    DeepCopy = (void *)CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v17, 0);
    if (!DeepCopy)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICommand.m"), 312, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("propertyListCopy"));

    }
  }
  else
  {
    DeepCopy = 0;
  }
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v22 = v18;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (!v23)
  {
    v25 = 0;
    goto LABEL_20;
  }
  v24 = v23;
  v25 = 0;
  v26 = *(_QWORD *)v47;
  do
  {
    for (i = 0; i != v24; ++i)
    {
      if (*(_QWORD *)v47 != v26)
        objc_enumerationMutation(v22);
      v28 = objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "modifierFlags");
      if (!v28 || objc_msgSend(v25, "containsIndex:", v28))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICommand.m"), 321, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("alternateModifierFlags != 0 && ![allAlternateModifierFlags containsIndex:alternateModifierFlags]"));

        if (v25)
        {
LABEL_13:
          objc_msgSend(v25, "addIndex:", v28);
          continue;
        }
      }
      else if (v25)
      {
        goto LABEL_13;
      }
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndex:", v28);
    }
    v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  }
  while (v24);
LABEL_20:

  v45.receiver = self;
  v45.super_class = (Class)UICommand;
  v30 = -[UIMenuElement initWithTitle:image:imageName:](&v45, sel_initWithTitle_image_imageName_, v42, v41, v44);
  v31 = v30;
  if (v30)
  {
    target = v30->__target;
    v30->__target = 0;

    v31->_action = a6;
    v31->_fallbackAction = a7;
    objc_storeStrong(&v31->_propertyList, DeepCopy);
    v33 = objc_msgSend(v22, "copy");
    alternates = v31->_alternates;
    v31->_alternates = (NSArray *)v33;

    v35 = objc_msgSend(v19, "copy");
    discoverabilityTitle = v31->_discoverabilityTitle;
    v31->_discoverabilityTitle = (NSString *)v35;

    *((_DWORD *)v31 + 18) = a11;
    *((_DWORD *)v31 + 19) = a12;
  }

  return v31;
}

- (id)propertyList
{
  return self->_propertyList;
}

- (BOOL)_acceptBoolMenuVisit:(id)a3 commandVisit:(id)a4 actionVisit:(id)a5
{
  if (a4)
    return (*((uint64_t (**)(id, UICommand *))a4 + 2))(a4, self);
  else
    return 0;
}

+ (id)_defaultCommandForAction:(SEL)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "_defaultCommands");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForSelector:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_defaultCommands
{
  if (_MergedGlobals_1159 != -1)
    dispatch_once(&_MergedGlobals_1159, &__block_literal_global_390);
  return (id)qword_1ECD7F308;
}

- (SEL)action
{
  return self->_action;
}

uint64_t __46__UICommand_DefaultCommands___defaultCommands__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "action");
}

- (void)setDiscoverabilityTitle:(NSString *)discoverabilityTitle
{
  objc_setProperty_nonatomic_copy(self, a2, discoverabilityTitle, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__target, 0);
  objc_storeStrong((id *)&self->_alternates, 0);
  objc_storeStrong(&self->_propertyList, 0);
  objc_storeStrong((id *)&self->_discoverabilityTitle, 0);
  objc_storeStrong((id *)&self->_selectedImage, 0);
  objc_storeStrong(&self->_sender, 0);
  objc_storeStrong((id *)&self->stateObservers, 0);
}

void __46__UICommand_DefaultCommands___defaultCommands__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
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
  _UISelectorDictionary *v52;
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
  void *v87;
  void *v88;
  void *v89;
  void *v90;
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
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;

  _UINSLocalizedStringWithDefaultValue(CFSTR("Duplicate"), CFSTR("Duplicate"));
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  _UINSLocalizedStringWithDefaultValue(CFSTR("Move"), CFSTR("Move"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  _UINSLocalizedStringWithDefaultValue(CFSTR("Rename"), CFSTR("Rename"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  _UINSLocalizedStringWithDefaultValue(CFSTR("Export"), CFSTR("Export"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = [_UISelectorDictionary alloc];
  _UIKitBundle();
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "localizedStringForKey:value:table:", CFSTR("Copy[Menu]"), CFSTR("Copy"), CFSTR("Localizable"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyCommand commandWithTitle:imageName:action:input:modifierFlags:](_UIImmutableKeyCommand, "commandWithTitle:imageName:action:input:modifierFlags:", v66, CFSTR("doc.on.doc"), sel_copy_, CFSTR("c"), 0x100000);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  _UINSLocalizedStringWithDefaultValue(CFSTR("Cut"), CFSTR("Cut"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyCommand commandWithTitle:imageName:action:input:modifierFlags:](_UIImmutableKeyCommand, "commandWithTitle:imageName:action:input:modifierFlags:", v65, CFSTR("scissors"), sel_cut_, CFSTR("x"), 0x100000);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  _UINSLocalizedStringWithDefaultValue(CFSTR("Smaller"), CFSTR("Smaller"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyCommand commandWithTitle:imageName:action:input:modifierFlags:](_UIImmutableKeyCommand, "commandWithTitle:imageName:action:input:modifierFlags:", v64, CFSTR("textformat.size.smaller"), sel_decreaseSize_, CFSTR("-"), 0x100000);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  _UIKitBundle();
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "localizedStringForKey:value:table:", CFSTR("Delete[Menu]"), CFSTR("Delete"), CFSTR("Localizable"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  +[UICommand commandWithTitle:imageName:attributes:action:](_UIImmutableCommand, "commandWithTitle:imageName:attributes:action:", v62, CFSTR("trash"), 2, sel_delete_);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  _UINSLocalizedStringWithDefaultValue(CFSTR("Bigger"), CFSTR("Bigger"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyCommand commandWithTitle:imageName:action:input:modifierFlags:](_UIImmutableKeyCommand, "commandWithTitle:imageName:action:input:modifierFlags:", v61, CFSTR("textformat.size.larger"), sel_increaseSize_, CFSTR("+"), 0x100000);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  _UINSLocalizedStringWithDefaultValue(CFSTR("Default"), CFSTR("Default"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  +[UICommand commandWithTitle:imageName:action:](_UIImmutableCommand, "commandWithTitle:imageName:action:", v60, 0, sel_makeTextWritingDirectionNatural_);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  _UINSLocalizedStringWithDefaultValue(CFSTR("Left to Right"), CFSTR("Left to Right"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  +[UICommand commandWithTitle:imageName:preferredDisplayMode:action:](_UIImmutableCommand, "commandWithTitle:imageName:preferredDisplayMode:action:", v59, CFSTR("arrow.text.left.to.right"), 3, sel_makeTextWritingDirectionLeftToRight_);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  _UINSLocalizedStringWithDefaultValue(CFSTR("Right to Left"), CFSTR("Right to Left"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  +[UICommand commandWithTitle:imageName:preferredDisplayMode:action:](_UIImmutableCommand, "commandWithTitle:imageName:preferredDisplayMode:action:", v58, CFSTR("arrow.text.right.to.left"), 3, sel_makeTextWritingDirectionRightToLeft_);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  _UINSLocalizedStringWithDefaultValue(CFSTR("Paste"), CFSTR("Paste"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyCommand commandWithTitle:imageName:action:input:modifierFlags:](_UIImmutableKeyCommand, "commandWithTitle:imageName:action:input:modifierFlags:", v57, CFSTR("doc.on.clipboard"), sel_paste_, CFSTR("v"), 0x100000);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  _UINSLocalizedStringWithDefaultValue(CFSTR("Paste and Match Style"), CFSTR("Paste and Match Style"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyCommand commandWithTitle:imageName:action:input:modifierFlags:](_UIImmutableKeyCommand, "commandWithTitle:imageName:action:input:modifierFlags:", v56, CFSTR("doc.on.clipboard"), sel_pasteAndMatchStyle_, CFSTR("v"), 1703936);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  _UINSLocalizedStringWithDefaultValue(CFSTR("Redo"), CFSTR("Redo"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyCommand commandWithTitle:imageName:action:input:modifierFlags:](_UIImmutableKeyCommand, "commandWithTitle:imageName:action:input:modifierFlags:", v55, CFSTR("arrow.uturn.forward.circle"), sel_redo_, CFSTR("z"), 1179648);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  _UINSLocalizedStringWithDefaultValue(CFSTR("Select"), CFSTR("Select"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  +[UICommand commandWithTitle:imageName:action:](_UIImmutableCommand, "commandWithTitle:imageName:action:", v54, CFSTR("selection.pin.in.out"), sel_select_);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  _UINSLocalizedStringWithDefaultValue(CFSTR("Select All"), CFSTR("Select All"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyCommand commandWithTitle:imageName:action:input:modifierFlags:](_UIImmutableKeyCommand, "commandWithTitle:imageName:action:input:modifierFlags:", v53, CFSTR("character.textbox"), sel_selectAll_, CFSTR("a"), 0x100000);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  _UINSLocalizedStringWithDefaultValue(CFSTR("TEXT_FORMATTING_MORE"), CFSTR("More…"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyCommand commandWithTitle:imageName:action:input:modifierFlags:](_UIImmutableKeyCommand, "commandWithTitle:imageName:action:input:modifierFlags:", v51, CFSTR("textformat"), sel__showTextFormattingOptions_, CFSTR("t"), 1572864);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  _UINSLocalizedStringWithDefaultValue(CFSTR("Bold"), CFSTR("Bold"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyCommand commandWithTitle:imageName:action:input:modifierFlags:](_UIImmutableKeyCommand, "commandWithTitle:imageName:action:input:modifierFlags:", v50, CFSTR("bold"), sel_toggleBoldface_, CFSTR("b"), 0x100000);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  _UINSLocalizedStringWithDefaultValue(CFSTR("Italic"), CFSTR("Italic"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyCommand commandWithTitle:imageName:action:input:modifierFlags:](_UIImmutableKeyCommand, "commandWithTitle:imageName:action:input:modifierFlags:", v49, CFSTR("italic"), sel_toggleItalics_, CFSTR("i"), 0x100000);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  _UINSLocalizedStringWithDefaultValue(CFSTR("Underline"), CFSTR("Underline"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyCommand commandWithTitle:imageName:action:input:modifierFlags:](_UIImmutableKeyCommand, "commandWithTitle:imageName:action:input:modifierFlags:", v48, CFSTR("underline"), sel_toggleUnderline_, CFSTR("u"), 0x100000);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  _UINSLocalizedStringWithDefaultValue(CFSTR("Undo"), CFSTR("Undo"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyCommand commandWithTitle:imageName:action:input:modifierFlags:](_UIImmutableKeyCommand, "commandWithTitle:imageName:action:input:modifierFlags:", v47, CFSTR("arrow.uturn.backward.circle"), sel_undo_, CFSTR("z"), 0x100000);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  _UINSLocalizedStringWithDefaultValue(CFSTR("Pause"), CFSTR("Pause"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  +[UICommand commandWithTitle:imageName:action:](_UIImmutableCommand, "commandWithTitle:imageName:action:", v46, CFSTR("pause"), sel__accessibilityPauseSpeaking_);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  _UINSLocalizedStringWithDefaultValue(CFSTR("Speak"), CFSTR("Speak"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  +[UICommand commandWithTitle:imageName:action:](_UIImmutableCommand, "commandWithTitle:imageName:action:", v45, CFSTR("play"), sel__accessibilitySpeak_);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  _UINSLocalizedStringWithDefaultValue(CFSTR("Speak…"), CFSTR("Speak…"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  +[UICommand commandWithTitle:imageName:action:](_UIImmutableCommand, "commandWithTitle:imageName:action:", v44, CFSTR("play"), sel__accessibilitySpeakLanguageSelection_);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  _UINSLocalizedStringWithDefaultValue(CFSTR("Learn…"), CFSTR("Learn…"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  +[UICommand commandWithTitle:imageName:action:fallbackAction:](_UIImmutableCommand, "commandWithTitle:imageName:action:fallbackAction:", v43, CFSTR("character.book.closed"), sel_addShortcut_, sel__addShortcut_);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  _UINSLocalizedStringWithDefaultValue(CFSTR("Look Up"), CFSTR("Look Up"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  +[UICommand commandWithTitle:imageName:action:fallbackAction:](_UIImmutableCommand, "commandWithTitle:imageName:action:fallbackAction:", v42, CFSTR("doc.text.magnifyingglass"), sel__define_, sel_define_);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  _UINSLocalizedStringWithDefaultValue(CFSTR("Insert Drawing"), CFSTR("Insert Drawing"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  +[UICommand commandWithTitle:imageName:action:](_UIImmutableCommand, "commandWithTitle:imageName:action:", v41, CFSTR("scribble"), sel__insertDrawing_);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  _UINSLocalizedStringWithDefaultValue(CFSTR("Look Up"), CFSTR("Look Up"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  +[UICommand commandWithTitle:imageName:action:fallbackAction:](_UIImmutableCommand, "commandWithTitle:imageName:action:fallbackAction:", v38, CFSTR("doc.text.magnifyingglass"), sel__lookup_, sel_lookup_);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  _UINSLocalizedStringWithDefaultValue(CFSTR("Replace…"), CFSTR("Replace…"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[UICommand commandWithTitle:imageName:action:fallbackAction:](_UIImmutableCommand, "commandWithTitle:imageName:action:fallbackAction:", v36, CFSTR("character.cursor.ibeam"), sel_promptForReplace_, sel__promptForReplace_);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  _UINSLocalizedStringWithDefaultValue(CFSTR("Share…"), CFSTR("Share…"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  +[UICommand commandWithTitle:imageName:action:fallbackAction:](_UIImmutableCommand, "commandWithTitle:imageName:action:fallbackAction:", v35, CFSTR("square.and.arrow.up"), sel_share_, sel__share_);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  _UINSLocalizedStringWithDefaultValue(CFSTR("Find"), CFSTR("Find"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyCommand commandWithTitle:imageName:action:input:modifierFlags:](_UIImmutableKeyCommand, "commandWithTitle:imageName:action:input:modifierFlags:", v34, 0, sel_find_, CFSTR("f"), 0x100000);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  _UINSLocalizedStringWithDefaultValue(CFSTR("Find & Replace"), CFSTR("Find & Replace"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyCommand commandWithTitle:imageName:action:input:modifierFlags:](_UIImmutableKeyCommand, "commandWithTitle:imageName:action:input:modifierFlags:", v33, 0, sel_findAndReplace_, CFSTR("f"), 1572864);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  _UINSLocalizedStringWithDefaultValue(CFSTR("Find Next"), CFSTR("Find Next"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyCommand commandWithTitle:imageName:action:input:modifierFlags:](_UIImmutableKeyCommand, "commandWithTitle:imageName:action:input:modifierFlags:", v32, 0, sel_findNext_, CFSTR("g"), 0x100000);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  _UINSLocalizedStringWithDefaultValue(CFSTR("Find Previous"), CFSTR("Find Previous"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyCommand commandWithTitle:imageName:action:input:modifierFlags:](_UIImmutableKeyCommand, "commandWithTitle:imageName:action:input:modifierFlags:", v31, 0, sel_findPrevious_, CFSTR("g"), 1179648);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  _UINSLocalizedStringWithDefaultValue(CFSTR("Use Selection for Find"), CFSTR("Use Selection for Find"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyCommand commandWithTitle:imageName:action:input:modifierFlags:](_UIImmutableKeyCommand, "commandWithTitle:imageName:action:input:modifierFlags:", v30, 0, sel_useSelectionForFind_, CFSTR("e"), 0x100000);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  _UINSLocalizedStringWithDefaultValue(CFSTR("Find Selection"), CFSTR("Find Selection"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[UICommand commandWithTitle:imageName:action:fallbackAction:](_UIImmutableCommand, "commandWithTitle:imageName:action:fallbackAction:", v29, CFSTR("text.magnifyingglass"), sel_findSelected_, sel__findSelected_);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyCommand commandWithTitle:imageName:action:input:modifierFlags:](_UIImmutableKeyCommand, "commandWithTitle:imageName:action:input:modifierFlags:", v109, CFSTR("plus.square.on.square"), sel_duplicate_, CFSTR("S"), 1179648);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  +[UICommand commandWithTitle:imageName:action:](_UIImmutableCommand, "commandWithTitle:imageName:action:", v40, CFSTR("pencil"), sel_rename_);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  +[UICommand commandWithTitle:imageName:action:](_UIImmutableCommand, "commandWithTitle:imageName:action:", v39, CFSTR("folder"), sel_move_);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  +[UICommand commandWithTitle:imageName:action:](_UIImmutableCommand, "commandWithTitle:imageName:action:", v37, CFSTR("square.and.arrow.up.on.square"), sel_export_);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  +[UICommand commandWithTitle:imageName:action:fallbackAction:](_UIImmutableCommand, "commandWithTitle:imageName:action:fallbackAction:", CFSTR("简⇄繁"), 0, sel_transliterateChinese_, sel__transliterateChinese_);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  _UINSLocalizedStringWithDefaultValue(CFSTR("Open..."), CFSTR("Open..."));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyCommand commandWithTitle:imageName:action:input:modifierFlags:](_UIImmutableKeyCommand, "commandWithTitle:imageName:action:input:modifierFlags:", v28, 0, sel_open_, CFSTR("o"), 0x100000);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  _UINSLocalizedStringWithDefaultValue(CFSTR("Open in New Window"), CFSTR("Open in New Window"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[UICommand commandWithTitle:imageName:action:](_UIImmutableCommand, "commandWithTitle:imageName:action:", v27, CFSTR("rectangle.badge.plus"), sel__openInNewCanvas_);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  _UINSLocalizedStringWithDefaultValue(CFSTR("Show Sidebar"), CFSTR("Show Sidebar"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyCommand commandWithTitle:imageName:action:input:modifierFlags:](UIKeyCommand, "commandWithTitle:imageName:action:input:modifierFlags:", v0, 0, sel_toggleSidebar_, CFSTR("s"), 1310720);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "_immutableCopy");
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIKeyCommand commandWithTitle:imageName:action:input:modifierFlags:](_UIImmutableKeyCommand, "commandWithTitle:imageName:action:input:modifierFlags:", &stru_1E16EDF20, 0, sel_showHelp_, CFSTR("?"), 0x100000);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  _UINSLocalizedStringWithDefaultValue(CFSTR("Print"), CFSTR("Print"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyCommand commandWithTitle:imageName:action:input:modifierFlags:](_UIImmutableKeyCommand, "commandWithTitle:imageName:action:input:modifierFlags:", v26, CFSTR("printer"), sel_print_, CFSTR("p"), 0x100000);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "_nonRepeatableKeyCommand");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  _UINSLocalizedStringWithDefaultValue(CFSTR("Dictation"), CFSTR("Dictation"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyCommand commandWithTitle:imageName:action:input:modifierFlags:](_UIImmutableKeyCommand, "commandWithTitle:imageName:action:input:modifierFlags:", v23, 0, sel_startDictation_, CFSTR("D"), 0x800000);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "_allowGlobeModifierKeyCommand");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_nonRepeatableKeyCommand");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _UINSLocalizedStringWithDefaultValue(CFSTR("Emoji"), CFSTR("Emoji"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyCommand commandWithTitle:imageName:action:input:modifierFlags:](_UIImmutableKeyCommand, "commandWithTitle:imageName:action:input:modifierFlags:", v20, CFSTR("emoji.face.grinning"), sel_orderFrontCharacterPalette_, CFSTR("E"), 0x800000);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_allowGlobeModifierKeyCommand");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_nonRepeatableKeyCommand");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyCommand commandWithTitle:imageName:action:input:modifierFlags:](_UIImmutableKeyCommand, "commandWithTitle:imageName:action:input:modifierFlags:", &stru_1E16EDF20, 0, sel__handleLegacyEmojiKeyboardShortcut_, CFSTR(" "), 1310720);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_nonRepeatableKeyCommand");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIAction _textFromCameraTitle](UIAction, "_textFromCameraTitle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIAction _textFromCameraImageName](UIAction, "_textFromCameraImageName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[UICommand commandWithTitle:imageName:action:](_UIImmutableCommand, "commandWithTitle:imageName:action:", v15, v14, sel_captureTextFromCamera_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _UINSLocalizedStringWithDefaultValue(CFSTR("Translate"), CFSTR("Translate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UICommand commandWithTitle:imageName:action:fallbackAction:](_UIImmutableCommand, "commandWithTitle:imageName:action:fallbackAction:", v4, CFSTR("translate"), sel__translate_, sel_translate_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _UINSLocalizedStringWithDefaultValue(CFSTR("Close"), CFSTR("Close"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](_UIImmutableKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v6, 0, sel__performClose_, CFSTR("w"), 0x100000, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _UINSLocalizedStringWithDefaultValue(CFSTR("Writing Tools"), CFSTR("Writing Tools"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[UICommand commandWithTitle:imageName:action:](_UIImmutableCommand, "commandWithTitle:imageName:action:", v8, 0, sel__startWritingTools_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_UISelectorDictionary initWithMapping:objects:](v52, "initWithMapping:objects:", &__block_literal_global_11_4, v108, v107, v106, v105, v104, v103, v102, v101, v100, v99, v98, v97, v96, v95, v94, v93,
          v92,
          v91,
          v90,
          v89,
          v88,
          v87,
          v86,
          v85,
          v84,
          v83,
          v82,
          v81,
          v80,
          v79,
          v78,
          v77,
          v74,
          v76,
          v75,
          v70,
          v73,
          v24,
          v72,
          v71,
          v69,
          v68,
          v16,
          v13,
          v12,
          v2,
          v3,
          v5,
          v7,
          v9,
          0);
  v11 = (void *)qword_1ECD7F308;
  qword_1ECD7F308 = v10;

}

+ (UICommand)commandWithTitle:(id)a3 imageName:(id)a4 action:(SEL)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  v10 = objc_alloc((Class)a1);
  v11 = (void *)objc_msgSend(v10, "initWithTitle:image:imageName:action:propertyList:alternates:discoverabilityTitle:attributes:state:", v9, 0, v8, a5, 0, MEMORY[0x1E0C9AA60], 0, 0, 0);

  return (UICommand *)v11;
}

+ (UICommand)commandWithTitle:(id)a3 imageName:(id)a4 action:(SEL)a5 fallbackAction:(SEL)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a4;
  v11 = a3;
  v12 = objc_alloc((Class)a1);
  v13 = (void *)objc_msgSend(v12, "initWithTitle:image:imageName:action:fallbackAction:propertyList:alternates:discoverabilityTitle:attributes:state:", v11, 0, v10, a5, a6, 0, MEMORY[0x1E0C9AA60], 0, 0, 0);

  return (UICommand *)v13;
}

+ (UICommand)commandWithTitle:(id)a3 imageName:(id)a4 preferredDisplayMode:(unint64_t)a5 action:(SEL)a6
{
  id v10;
  id v11;
  id v12;
  _QWORD *v13;

  v10 = a4;
  v11 = a3;
  v12 = objc_alloc((Class)a1);
  v13 = (_QWORD *)objc_msgSend(v12, "initWithTitle:image:imageName:action:propertyList:alternates:discoverabilityTitle:attributes:state:", v11, 0, v10, a6, 0, MEMORY[0x1E0C9AA60], 0, 0, 0);

  v13[4] = a5;
  return (UICommand *)v13;
}

+ (UICommand)commandWithTitle:(id)a3 imageName:(id)a4 attributes:(unint64_t)a5 action:(SEL)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a4;
  v11 = a3;
  v12 = objc_alloc((Class)a1);
  v13 = (void *)objc_msgSend(v12, "initWithTitle:image:imageName:action:propertyList:alternates:discoverabilityTitle:attributes:state:", v11, 0, v10, a6, 0, MEMORY[0x1E0C9AA60], 0, a5, 0);

  return (UICommand *)v13;
}

+ (UICommand)commandWithTitle:(NSString *)title image:(UIImage *)image action:(SEL)action propertyList:(id)propertyList
{
  id v10;
  UIImage *v11;
  NSString *v12;
  id v13;
  void *v14;
  void *v15;

  v10 = propertyList;
  v11 = image;
  v12 = title;
  v13 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithTitle:image:imageName:action:propertyList:alternates:discoverabilityTitle:attributes:state:", v12, v11, 0, action, v10, v14, 0, 0, 0);

  return (UICommand *)v15;
}

+ (UICommand)commandWithTitle:(NSString *)title image:(UIImage *)image action:(SEL)action propertyList:(id)propertyList alternates:(NSArray *)alternates
{
  NSArray *v12;
  id v13;
  UIImage *v14;
  NSString *v15;
  void *v16;

  v12 = alternates;
  v13 = propertyList;
  v14 = image;
  v15 = title;
  v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTitle:image:imageName:action:propertyList:alternates:discoverabilityTitle:attributes:state:", v15, v14, 0, action, v13, v12, 0, 0, 0);

  return (UICommand *)v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)_isLeaf
{
  return 1;
}

- (UICommand)initWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  UICommand *v5;
  uint64_t v6;
  NSString *discoverabilityTitle;
  NSString *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id propertyList;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  UIImage *selectedImage;
  objc_super v27;

  v4 = coder;
  v27.receiver = self;
  v27.super_class = (Class)UICommand;
  v5 = -[UIMenuElement initWithCoder:](&v27, sel_initWithCoder_, v4);
  if (v5)
  {
    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("discoverabilityTitle"));
    v6 = objc_claimAutoreleasedReturnValue();
    discoverabilityTitle = v5->_discoverabilityTitle;
    v5->_discoverabilityTitle = (NSString *)v6;

    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("action"));
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5->_action = NSSelectorFromString(v8);

    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, v11, v12, v13, v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCoder decodeObjectOfClasses:forKey:](v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("propertyList"));
    v16 = objc_claimAutoreleasedReturnValue();
    propertyList = v5->_propertyList;
    v5->_propertyList = (id)v16;

    v18 = (void *)MEMORY[0x1E0C99E60];
    v19 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCoder decodeObjectOfClasses:forKey:](v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("alternates"));
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    if (v21)
      v23 = (void *)v21;
    else
      v23 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v5->_alternates, v23);

    *((_DWORD *)v5 + 18) = -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("attributes"));
    *((_DWORD *)v5 + 19) = -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("states"));
    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selectedImage"));
    v24 = objc_claimAutoreleasedReturnValue();
    selectedImage = v5->_selectedImage;
    v5->_selectedImage = (UIImage *)v24;

  }
  return v5;
}

- (BOOL)requiresAuthenticatedInput
{
  return self->_action == sel_paste_;
}

- (void)setTitle:(NSString *)title
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UICommand;
  -[UIMenuElement _setTitle:](&v3, sel__setTitle_, title);
}

- (void)setSubtitle:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UICommand;
  -[UIMenuElement _setSubtitle:](&v3, sel__setSubtitle_, a3);
}

- (void)setImage:(UIImage *)image
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UICommand;
  -[UIMenuElement _setImage:](&v3, sel__setImage_, image);
}

- (void)setState:(UIMenuElementState)state
{
  -[UICommand _setState:notifyingObservers:](self, "_setState:notifyingObservers:", state, 1);
}

- (void)_acceptMenuVisit:(id)a3 commandVisit:(id)a4 actionVisit:(id)a5 deferredElementVisit:(id)a6
{
  if (a4)
    (*((void (**)(id, UICommand *))a4 + 2))(a4, self);
}

- (void)_acceptMenuVisit:(id)a3 leafVisit:(id)a4
{
  if (a4)
    (*((void (**)(id, UICommand *))a4 + 2))(a4, self);
}

- (BOOL)_acceptBoolMenuVisit:(id)a3 leafVisit:(id)a4
{
  if (a4)
    return (*((uint64_t (**)(id, UICommand *))a4 + 2))(a4, self);
  else
    return 0;
}

- (id)_alternateForModifierFlags:(int64_t)a3
{
  return -[UICommand _alternateForModifierFlags:usingAlternates:](self, "_alternateForModifierFlags:usingAlternates:", a3, self->_alternates);
}

- (id)_alternateForModifierFlags:(int64_t)a3 usingAlternates:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;
  int64_t v11;
  uint64_t i;
  void *v13;
  int8x8_t v14;
  uint8x8_t v15;
  int v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v20;
    v11 = ~a3;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v5);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v14 = (int8x8_t)objc_msgSend(v13, "modifierFlags");
        v15 = (uint8x8_t)vcnt_s8(v14);
        v15.i16[0] = vaddlv_u8(v15);
        if ((*(_QWORD *)&v14 & v11) != 0)
          v16 = -1;
        else
          v16 = v15.i32[0];
        if (v8 < v16)
        {
          v17 = v13;

          v8 = v16;
          v9 = v17;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_immutableCopy
{
  return -[UICommand initWithCommand:]([_UIImmutableCommand alloc], "initWithCommand:", self);
}

- (id)_identifier
{
  return +[_UICommandIdentifier identifierWithAction:propertyList:](_UICommandIdentifier, "identifierWithAction:propertyList:", self->_action, self->_propertyList);
}

- (id)_leafAlternates
{
  return self->_alternates;
}

- (id)_leafKeyInput
{
  return 0;
}

- (int64_t)_leafKeyModifierFlags
{
  return 0;
}

- (BOOL)keepsMenuPresented
{
  return (-[UICommand attributes](self, "attributes") >> 3) & 1;
}

- (BOOL)_isDefaultCommand
{
  void *v2;
  BOOL v3;

  +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", self->_action);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)sender
{
  return _UIMenuLeafAPISenderFromSender(self->_sender);
}

- (UIPopoverPresentationControllerSourceItem)presentationSourceItem
{
  return (UIPopoverPresentationControllerSourceItem *)_UIMenuLeafPresentationSourceItemFromSender(self->_sender);
}

- (void)performWithSender:(id)a3 target:(id)a4
{
  id *p_sender;
  id v8;
  void *v9;
  UICommand *v10;
  const char *v11;
  id v12;
  id v13;

  v13 = a3;
  p_sender = &self->_sender;
  objc_storeStrong(&self->_sender, a3);
  v8 = a4;
  _UIMenuStateObserverableLeafWillPerformAction(self);
  if (self->__useSenderForResolvingTarget)
    v9 = v13;
  else
    v9 = 0;
  v10 = v9;
  v11 = -[UICommand action](self, "action");
  if (v10)
    self = v10;
  if (dyld_program_sdk_at_least())
    objc_msgSend(v8, v11, self);
  else
    objc_msgSend(v8, sel_performSelector_withObject_, v11, self);

  v12 = *p_sender;
  *p_sender = 0;

}

- (void)_performFallbackActionWithSender:(id)a3 target:(id)a4
{
  id *p_sender;
  id v8;
  UICommand *v9;
  const char *fallbackAction;
  UICommand *v11;
  id v12;
  UICommand *v13;

  v13 = (UICommand *)a3;
  p_sender = &self->_sender;
  objc_storeStrong(&self->_sender, a3);
  v8 = a4;
  _UIMenuStateObserverableLeafWillPerformAction(self);
  if (self->__useSenderForResolvingTarget)
    v9 = v13;
  else
    v9 = 0;
  fallbackAction = self->_fallbackAction;
  if (v9)
    self = v9;
  v11 = v9;
  if (dyld_program_sdk_at_least())
    objc_msgSend(v8, fallbackAction, self);
  else
    objc_msgSend(v8, sel_performSelector_withObject_, fallbackAction, self);

  v12 = *p_sender;
  *p_sender = 0;

}

- (id)_resolvedTargetFromFirstTarget:(id)a3 sender:(id)a4
{
  UICommand *v6;
  id *p_sender;
  UICommand *v8;
  id v9;
  UICommand *v10;
  SEL action;
  UICommand *v12;
  void *v13;
  id v14;

  v6 = self;
  p_sender = &self->_sender;
  objc_storeStrong(&self->_sender, a4);
  v8 = (UICommand *)a4;
  v9 = a3;
  if (v6->__useSenderForResolvingTarget)
    v10 = v8;
  else
    v10 = 0;
  action = v6->_action;
  if (v10)
    v6 = v10;
  v12 = v10;
  objc_msgSend(v9, "targetForAction:withSender:", action, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = *p_sender;
  *p_sender = 0;

  return v13;
}

- (id)_resolvedTargetFromFirstTarget:(id)a3 sender:(id)a4 shouldUseFallbackActionOut:(BOOL *)a5
{
  id v8;
  id v9;
  id *p_sender;
  void *v11;
  UICommand *v12;
  UICommand *v13;
  UICommand *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  void *v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  p_sender = &self->_sender;
  objc_storeStrong(&self->_sender, a4);
  if (self->__useSenderForResolvingTarget)
    v11 = v9;
  else
    v11 = 0;
  v12 = v11;
  v13 = v12;
  if (v12)
    v14 = v12;
  else
    v14 = self;
  objc_msgSend(v8, "targetForAction:withSender:", self->_action, v14);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (self->_fallbackAction)
    v17 = v15 == 0;
  else
    v17 = 0;
  if (v17)
  {
    objc_msgSend(v8, "targetForAction:withSender:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v18;
    if (v18)
    {
      v19 = v18;
      if (a5)
        *a5 = 1;
    }

  }
  v20 = *p_sender;
  *p_sender = 0;

  return v16;
}

- (void)_performWithSender:(id)a3 handler:(id)a4
{
  id *p_sender;
  void (**v7)(void);
  id v8;
  id v9;

  p_sender = &self->_sender;
  objc_storeStrong(&self->_sender, a3);
  v9 = a3;
  v7 = (void (**)(void))a4;
  v7[2]();

  v8 = *p_sender;
  *p_sender = 0;

}

- (id)_validatedLeafWithAlternate:(id)a3 target:(id)a4 validation:(id)a5
{
  return (id)objc_msgSend(a5, "validatedCommandForTarget:command:alternate:sender:", a4, self, a3, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[UICommand initWithCommand:]([UICommand alloc], "initWithCommand:", self);
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  void *v6;
  NSString *discoverabilityTitle;
  id propertyList;
  uint64_t v9;
  uint64_t v10;
  UIImage *selectedImage;
  void *v12;
  objc_super v13;

  v5 = a3;
  if (self->__target)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICommand.m"), 538, CFSTR("Commands with explicit targets cannot be encoded."));

  }
  v13.receiver = self;
  v13.super_class = (Class)UICommand;
  -[UIMenuElement encodeWithCoder:](&v13, sel_encodeWithCoder_, v5);
  NSStringFromSelector(self->_action);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("action"));

  discoverabilityTitle = self->_discoverabilityTitle;
  if (discoverabilityTitle)
    objc_msgSend(v5, "encodeObject:forKey:", discoverabilityTitle, CFSTR("discoverabilityTitle"));
  propertyList = self->_propertyList;
  if (propertyList)
    objc_msgSend(v5, "encodeObject:forKey:", propertyList, CFSTR("propertyList"));
  if (-[NSArray count](self->_alternates, "count"))
    objc_msgSend(v5, "encodeObject:forKey:", self->_alternates, CFSTR("alternates"));
  v9 = *((unsigned int *)self + 18);
  if ((_DWORD)v9)
    objc_msgSend(v5, "encodeInteger:forKey:", v9, CFSTR("attributes"));
  v10 = *((int *)self + 19);
  if ((_DWORD)v10)
    objc_msgSend(v5, "encodeInteger:forKey:", v10, CFSTR("states"));
  selectedImage = self->_selectedImage;
  if (selectedImage)
    objc_msgSend(v5, "encodeObject:forKey:", selectedImage, CFSTR("selectedImage"));

}

- (unint64_t)hash
{
  return (unint64_t)sel_getName(self->_action);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  id v6;
  const char *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v6 = v4;
    v7 = (const char *)objc_msgSend(v6, "action");
    if (v7 == -[UICommand action](self, "action"))
    {
      objc_msgSend(v6, "propertyList");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICommand propertyList](self, "propertyList");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v8;
      v11 = v9;
      v12 = v11;
      if (v10 == v11)
      {
        v5 = 1;
      }
      else
      {
        v5 = 0;
        if (v10 && v11)
          v5 = objc_msgSend(v10, "isEqual:", v11);
      }

    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UICommand;
  -[UICommand description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[UIMenuElement title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" -> Title: %@"), v5);

  if (-[UICommand action](self, "action"))
  {
    NSStringFromSelector(-[UICommand action](self, "action"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("  Action: %@"), v6);

  }
  return (NSString *)v4;
}

- (void)_addStateObserver:(id)a3
{
  _UIMenuStateObserverableLeafAddObserver(self, a3);
}

- (void)_removeStateObserver:(id)a3
{
  _UIMenuStateObserverableLeafRemoveObserver(self, a3);
}

- (void)_setState:(int64_t)a3 notifyingObservers:(BOOL)a4
{
  if (*((_DWORD *)self + 19) != a3)
  {
    *((_DWORD *)self + 19) = a3;
    if (a4)
      _UIMenuStateObserverableLeafStateDidChange(self);
  }
}

- (NSPointerArray)_getStateObservers
{
  return self->stateObservers;
}

- (void)_setStateObservers:(id)a3
{
  objc_storeStrong((id *)&self->stateObservers, a3);
}

- (UIMenuElementAttributes)attributes
{
  return *((unsigned int *)self + 18);
}

- (void)setAttributes:(UIMenuElementAttributes)attributes
{
  *((_DWORD *)self + 18) = attributes;
}

- (UIMenuElementState)state
{
  return (uint64_t)*((int *)self + 19);
}

- (UIImage)selectedImage
{
  return self->_selectedImage;
}

- (void)setSelectedImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)discoverabilityTitle
{
  return self->_discoverabilityTitle;
}

- (NSArray)alternates
{
  return self->_alternates;
}

- (SEL)fallbackAction
{
  return self->_fallbackAction;
}

- (BOOL)_useSenderForResolvingTarget
{
  return self->__useSenderForResolvingTarget;
}

- (void)set_useSenderForResolvingTarget:(BOOL)a3
{
  self->__useSenderForResolvingTarget = a3;
}

- (id)_target
{
  return self->__target;
}

@end
