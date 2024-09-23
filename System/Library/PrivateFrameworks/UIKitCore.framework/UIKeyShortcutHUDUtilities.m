@implementation UIKeyShortcutHUDUtilities

void __40___UIKeyShortcutHUDUtilities_searchIcon__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  +[UIFontMetrics metricsForTextStyle:](UIFontMetrics, "metricsForTextStyle:", CFSTR("UICTFontTextStyleBody"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E167A828, "systemFontOfSize:weight:", 14.0, *(double *)off_1E167DC68);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "scaledFontForFont:", v1);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  +[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v5, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("magnifyingglass"), v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_MergedGlobals_1340[0];
  _MergedGlobals_1340[0] = v3;

}

void __56___UIKeyShortcutHUDUtilities_searchIconAttributedString__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3498];
  +[_UIKeyShortcutHUDUtilities searchIcon]();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E1679D28, "textAttachmentWithImage:", v4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "attributedStringWithAttachment:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ECD829D8;
  qword_1ECD829D8 = v2;

}

void __67___UIKeyShortcutHUDUtilities_modifiersAttributedStringForShortcut___block_invoke()
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
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;

  +[UIKeyShortcutHUDMetrics currentMetrics](UIKeyShortcutHUDMetrics, "currentMetrics");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "keyShortcutModifiersFont");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v1, 1);
  v32 = (id)objc_claimAutoreleasedReturnValue();

  +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("control"), v32);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("option"), v32);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("shift"), v32);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("command"), v32);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("globe"), v32);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("fn"), v32);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3498];
  objc_msgSend(off_1E1679D28, "textAttachmentWithImage:", v31);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attributedStringWithAttachment:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)qword_1ECD829E8;
  qword_1ECD829E8 = v9;

  v11 = (void *)MEMORY[0x1E0CB3498];
  objc_msgSend(off_1E1679D28, "textAttachmentWithImage:", v2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "attributedStringWithAttachment:", v12);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)qword_1ECD829F0;
  qword_1ECD829F0 = v13;

  v15 = (void *)MEMORY[0x1E0CB3498];
  objc_msgSend(off_1E1679D28, "textAttachmentWithImage:", v3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "attributedStringWithAttachment:", v16);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)qword_1ECD829F8;
  qword_1ECD829F8 = v17;

  v19 = (void *)MEMORY[0x1E0CB3498];
  objc_msgSend(off_1E1679D28, "textAttachmentWithImage:", v4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "attributedStringWithAttachment:", v20);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)qword_1ECD82A00;
  qword_1ECD82A00 = v21;

  v23 = (void *)MEMORY[0x1E0CB3498];
  objc_msgSend(off_1E1679D28, "textAttachmentWithImage:", v5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "attributedStringWithAttachment:", v24);
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)qword_1ECD82A08;
  qword_1ECD82A08 = v25;

  v27 = (void *)MEMORY[0x1E0CB3498];
  objc_msgSend(off_1E1679D28, "textAttachmentWithImage:", v6);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "attributedStringWithAttachment:", v28);
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = (void *)qword_1ECD82A10;
  qword_1ECD82A10 = v29;

}

void __103___UIKeyShortcutHUDUtilities_inputAttributedStringForShortcut_outShouldStyleAsSingleCharacterOrSymbol___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  _QWORD v10[4];
  _QWORD v11[10];
  _QWORD v12[11];

  v12[10] = *MEMORY[0x1E0C80C00];
  +[UIKeyShortcutHUDMetrics currentMetrics](UIKeyShortcutHUDMetrics, "currentMetrics");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "keyShortcutInputSymbolFont");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v1, 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ECD82A20;
  qword_1ECD82A20 = v2;

  v11[0] = CFSTR("UIKeyInputUpArrow");
  v11[1] = CFSTR("UIKeyInputDownArrow");
  v12[0] = CFSTR("arrow.up");
  v12[1] = CFSTR("arrow.down");
  v11[2] = CFSTR("UIKeyInputLeftArrow");
  v11[3] = CFSTR("UIKeyInputRightArrow");
  v12[2] = CFSTR("arrow.left");
  v12[3] = CFSTR("arrow.right");
  v11[4] = CFSTR("UIKeyInputEscape");
  v11[5] = CFSTR("\b");
  v12[4] = CFSTR("escape");
  v12[5] = CFSTR("delete.left");
  v11[6] = CFSTR("\t");
  v11[7] = CFSTR("\n");
  v12[6] = CFSTR("arrow.right.to.line");
  v12[7] = CFSTR("return.left");
  v11[8] = CFSTR("\r");
  v11[9] = CFSTR("⌅");
  v12[8] = CFSTR("return.left");
  v12[9] = CFSTR("projective");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 10);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1ECD82A28;
  qword_1ECD82A28 = v4;

  v9[0] = CFSTR("\b");
  v9[1] = CFSTR("\t");
  v10[0] = CFSTR("delete.right");
  v10[1] = CFSTR("arrow.left.to.line");
  v9[2] = CFSTR("\n");
  v9[3] = CFSTR("\r");
  v10[2] = CFSTR("return.right");
  v10[3] = CFSTR("return.right");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)qword_1ECD82A30;
  qword_1ECD82A30 = v6;

  v8 = (void *)qword_1ECD82A38;
  qword_1ECD82A38 = (uint64_t)&unk_1E1A9B748;

}

@end
