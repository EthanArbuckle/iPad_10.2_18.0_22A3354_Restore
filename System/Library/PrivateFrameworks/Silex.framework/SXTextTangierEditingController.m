@implementation SXTextTangierEditingController

- (BOOL)wantsCaret
{
  return 0;
}

- (BOOL)wantsKeyboard
{
  return 0;
}

- (BOOL)canAddOrShowComment
{
  return 0;
}

- (BOOL)isParagraphModeWithSelection:(id)a3 onStorage:(id)a4
{
  return 0;
}

- (void)copy:(id)a3
{
  void *v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  -[TSWPEditingController selection](self, "selection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isRange");

  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[TSWPEditingController storage](self, "storage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stylesheet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[TSWPEditingController selection](self, "selection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "range");
      v12 = v11;

      -[TSWPEditingController storage](self, "storage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "nsAttributedSubstringFromRange:scale:", v10, v12, 1.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = 0;
      objc_msgSend(v14, "tokenCountWithEnumerationOptions:maxTokenCount:outLimitLength:", 1027, 200, &v22);
      objc_msgSend(v14, "stringByTruncatingToLength:options:", v22, 1027);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "tsu_RTFFromRange:documentAttributes:", 0, objc_msgSend(v15, "length"), 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
        objc_msgSend(v6, "setObject:forKey:", v16, *MEMORY[0x24BDC1850]);

    }
    -[TSWPEditingController storage](self, "storage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSWPEditingController selection](self, "selection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "substringWithSelection:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setObject:forKey:", v19, *MEMORY[0x24BDC1898]);
    v23[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6C40], "generalPasteboard");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setItems:", v20);

  }
}

- (id)editingReps
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[TSWPEditingController interactiveCanvasController](self, "interactiveCanvasController", 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "canvas");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topLevelReps");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_opt_class();
        TSUDynamicCast();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "storage");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[TSWPEditingController storage](self, "storage");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12 == v13)
          objc_msgSend(v3, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v3;
}

- (int)canPerformEditorAction:(SEL)a3 withSender:(id)a4
{
  objc_super v6;

  if (sel_selectAll_ == a3 || sel_copy_ == a3)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)SXTextTangierEditingController;
  return -[TSWPEditingController canPerformEditorAction:withSender:](&v6, sel_canPerformEditorAction_withSender_);
}

- (id)editorKeyboardLanguage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_opt_class();
  -[TSWPEditingController storage](self, "storage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  TSUDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)clearSelection
{
  id v2;

  -[TSWPEditingController interactiveCanvasController](self, "interactiveCanvasController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endEditing");

}

- (BOOL)startingInitialSelectionDrag
{
  return *(&self->super._canCoalesceBreakingCharacters + 1);
}

- (void)setStartingInitialSelectionDrag:(BOOL)a3
{
  *(&self->super._canCoalesceBreakingCharacters + 1) = a3;
}

@end
