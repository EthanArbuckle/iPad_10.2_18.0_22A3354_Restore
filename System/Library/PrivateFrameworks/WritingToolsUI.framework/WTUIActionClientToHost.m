@implementation WTUIActionClientToHost

+ (id)actionForWillBeginWritingToolsSession:(id)a3 requestContextsCompletion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v6 = a4;
  objc_msgSend(a1, "_settingForActionType:session:", 1, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BE0BD88];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __90__WTUIActionClientToHost_actionForWillBeginWritingToolsSession_requestContextsCompletion___block_invoke;
  v13[3] = &unk_251C072F8;
  v14 = v6;
  v9 = v6;
  objc_msgSend(v8, "responderWithHandler:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v7, v10);

  return v11;
}

void __90__WTUIActionClientToHost_actionForWillBeginWritingToolsSession_requestContextsCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "info");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForSetting:", 13);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (id)actionForWritingToolsSession:(id)a3 didReceiveAction:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "_settingForActionType:session:", 3, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forSetting:", v7, 8);

  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v6, 0);
  return v8;
}

+ (id)actionForDidBeginWritingToolsSession:(id)a3 contexts:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  objc_msgSend(a1, "_settingForActionType:session:", 2, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0BED0]), "initWithArray:", v6);

  objc_msgSend(v7, "setObject:forSetting:", v8, 2);
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v7, 0);

  return v9;
}

+ (id)actionForDidEndWritingToolsSession:(id)a3 accepted:(BOOL)a4
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "_settingForActionType:session:", 4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFlag:forSetting:", BSSettingFlagForBool(), 3);
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v5, 0);

  return v6;
}

+ (id)actionForEndWritingToolsWithError:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BE0BE40]);
  objc_msgSend(v5, "setObject:forSetting:", &unk_251C0F6A8, 1);
  if (v4)
  {
    v12[0] = CFSTR("domain");
    objc_msgSend(v4, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v6;
    v12[1] = CFSTR("code");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "code"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v7;
    v12[2] = CFSTR("userInfo");
    objc_msgSend(v4, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forSetting:", v9, 17);

  }
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v5, 0);

  return v10;
}

+ (id)actionForProofreadingSession:(id)a3 didReceiveSuggestions:(id)a4 processedRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7
{
  NSUInteger length;
  NSUInteger location;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  length = a5.length;
  location = a5.location;
  v12 = a6;
  v13 = a4;
  objc_msgSend(a1, "_settingForActionType:session:", 6, a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0BED0]), "initWithArray:", v13);

  objc_msgSend(v14, "setObject:forSetting:", v15, 10);
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", location, length);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forSetting:", v16, 7);

  objc_msgSend(v14, "setObject:forSetting:", v12, 11);
  objc_msgSend(v14, "setFlag:forSetting:", BSSettingFlagForBool(), 4);
  v17 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v14, 0);

  return v17;
}

+ (id)actionForProofreadingSession:(id)a3 didUpdateState:(int64_t)a4 forSuggestionWithUUID:(id)a5 inContext:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  objc_msgSend(a1, "_settingForActionType:session:", 7, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forSetting:", v13, 12);

  objc_msgSend(v12, "setObject:forSetting:", v11, 9);
  objc_msgSend(v12, "setObject:forSetting:", v10, 11);

  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v12, 0);
  return v14;
}

+ (id)actionForCompositionSession:(id)a3 didReceiveText:(id)a4 replacementRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7
{
  NSUInteger length;
  NSUInteger location;
  id v12;
  id v13;
  void *v14;
  WTUIBSCompatibleAttributedString *v15;
  void *v16;
  void *v17;

  length = a5.length;
  location = a5.location;
  v12 = a6;
  v13 = a4;
  objc_msgSend(a1, "_settingForActionType:session:", 8, a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc_init(WTUIBSCompatibleAttributedString);
  -[WTBSCompatibleAttributedString setAttributedString:](v15, "setAttributedString:", v13);

  objc_msgSend(v14, "setObject:forSetting:", v15, 5);
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", location, length);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forSetting:", v16, 7);

  objc_msgSend(v14, "setObject:forSetting:", v12, 11);
  objc_msgSend(v14, "setFlag:forSetting:", BSSettingFlagForBool(), 4);
  v17 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v14, 0);

  return v17;
}

+ (id)actionForReplaceSelectionWithText:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  WTUIBSCompatibleAttributedString *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x24BE0BE40];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setObject:forSetting:", &unk_251C0F6C0, 1);
  v7 = objc_alloc_init(WTUIBSCompatibleAttributedString);
  -[WTBSCompatibleAttributedString setAttributedString:](v7, "setAttributedString:", v5);

  objc_msgSend(v6, "setObject:forSetting:", v7, 5);
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v6, 0);

  return v8;
}

+ (id)actionForCopyText:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  WTUIBSCompatibleAttributedString *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x24BE0BE40];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setObject:forSetting:", &unk_251C0F6D8, 1);
  v7 = objc_alloc_init(WTUIBSCompatibleAttributedString);
  -[WTBSCompatibleAttributedString setAttributedString:](v7, "setAttributedString:", v5);

  objc_msgSend(v6, "setObject:forSetting:", v7, 5);
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v6, 0);

  return v8;
}

+ (id)actionForUndo
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x24BE0BE40]);
  objc_msgSend(v3, "setObject:forSetting:", &unk_251C0F6F0, 1);
  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v3, 0);

  return v4;
}

+ (id)actionForRedo
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x24BE0BE40]);
  objc_msgSend(v3, "setObject:forSetting:", &unk_251C0F708, 1);
  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v3, 0);

  return v4;
}

+ (id)actionForBeginTextPlaceholder
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x24BE0BE40]);
  objc_msgSend(v3, "setObject:forSetting:", &unk_251C0F720, 1);
  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v3, 0);

  return v4;
}

+ (id)actionForEndTextPlaceholderWillInsertText:(BOOL)a3
{
  id v4;
  void *v5;

  v4 = objc_alloc_init(MEMORY[0x24BE0BE40]);
  objc_msgSend(v4, "setObject:forSetting:", &unk_251C0F738, 1);
  objc_msgSend(v4, "setFlag:forSetting:", BSSettingFlagForBool(), 14);
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v4, 0);

  return v5;
}

+ (id)actionForEnableSmallDetent:(BOOL)a3
{
  id v4;
  void *v5;

  v4 = objc_alloc_init(MEMORY[0x24BE0BE40]);
  objc_msgSend(v4, "setObject:forSetting:", &unk_251C0F750, 1);
  objc_msgSend(v4, "setFlag:forSetting:", BSSettingFlagForBool(), 15);
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v4, 0);

  return v5;
}

+ (id)actionForEnableIntelligentEntryFieldView:(BOOL)a3
{
  id v4;
  void *v5;

  v4 = objc_alloc_init(MEMORY[0x24BE0BE40]);
  objc_msgSend(v4, "setObject:forSetting:", &unk_251C0F768, 1);
  objc_msgSend(v4, "setFlag:forSetting:", BSSettingFlagForBool(), 16);
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v4, 0);

  return v5;
}

+ (id)actionForShowContentWarningWithTitle:(id)a3 message:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;

  v6 = (objc_class *)MEMORY[0x24BE0BE40];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  objc_msgSend(v9, "setObject:forSetting:", &unk_251C0F780, 1);
  objc_msgSend(v9, "setObject:forSetting:", v8, 18);

  objc_msgSend(v9, "setObject:forSetting:", v7, 19);
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v9, 0);

  return v10;
}

+ (id)actionForShowSmartReplyQuestionnaireWithRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  void *v9;
  void *v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = objc_alloc_init(MEMORY[0x24BE0BE40]);
  objc_msgSend(v8, "setObject:forSetting:", &unk_251C0F798, 1);
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", x, y, width, height);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forSetting:", v9, 20);

  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v8, 0);
  return v10;
}

+ (id)_settingForActionType:(int64_t)a3 session:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (objc_class *)MEMORY[0x24BE0BE40];
  v6 = a4;
  v7 = objc_alloc_init(v5);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forSetting:", v8, 1);

  objc_msgSend(v7, "setObject:forSetting:", v6, 6);
  return v7;
}

- (void)performActionForSceneController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  _QWORD v45[5];

  v4 = a3;
  -[WTUIActionClientToHost info](self, "info");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForSetting:", 6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WTUIActionClientToHost info](self, "info");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForSetting:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  switch(v10)
  {
    case 1:
      v45[0] = MEMORY[0x24BDAC760];
      v45[1] = 3221225472;
      v45[2] = __58__WTUIActionClientToHost_performActionForSceneController___block_invoke;
      v45[3] = &unk_251C07320;
      v45[4] = self;
      objc_msgSend(v6, "willBeginWritingToolsSession:requestContexts:", v7, v45);
      break;
    case 2:
      objc_msgSend(v5, "objectForSetting:", 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "array");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "didBeginWritingToolsSession:contexts:", v7, v12);
      goto LABEL_24;
    case 3:
      objc_msgSend(v5, "objectForSetting:", 8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "integerValue");

      objc_msgSend(v6, "writingToolsSession:didReceiveAction:", v7, v14);
      break;
    case 4:
      objc_msgSend(v6, "didEndWritingToolsSession:accepted:", v7, objc_msgSend(v5, "BOOLForSetting:", 3));
      break;
    case 5:
      objc_msgSend(v5, "objectForSetting:", 17);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        v17 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("domain"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("code"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "integerValue");
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("userInfo"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v22 = 0;
      }
      objc_msgSend(v6, "endWritingToolsWithError:", v22);

      break;
    case 6:
      objc_msgSend(v5, "objectForSetting:", 10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "array");
      v23 = objc_claimAutoreleasedReturnValue();
      if (v23)
        v12 = (void *)v23;
      else
        v12 = (void *)MEMORY[0x24BDBD1A8];
      objc_msgSend(v5, "objectForSetting:", 7);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "rangeValue");
      v27 = v26;

      objc_msgSend(v5, "objectForSetting:", 11);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "proofreadingSession:didReceiveSuggestions:processedRange:inContext:finished:", v7, v12, v25, v27, v28, objc_msgSend(v5, "BOOLForSetting:", 4));
      goto LABEL_14;
    case 7:
      objc_msgSend(v5, "objectForSetting:", 12);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "integerValue");

      objc_msgSend(v5, "objectForSetting:", 9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForSetting:", 11);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "proofreadingSession:didUpdateState:forSuggestionWithUUID:inContext:", v7, v30, v11, v31);

      goto LABEL_25;
    case 8:
      objc_msgSend(v5, "objectForSetting:", 5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "attributedString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForSetting:", 7);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "rangeValue");
      v35 = v34;

      objc_msgSend(v5, "objectForSetting:", 11);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "compositionSession:didReceiveText:replacementRange:inContext:finished:", v7, v12, v33, v35, v28, objc_msgSend(v5, "BOOLForSetting:", 4));
LABEL_14:

      goto LABEL_24;
    case 9:
      objc_msgSend(v5, "objectForSetting:", 5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "attributedString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "replaceSelectionWithText:", v12);
      goto LABEL_24;
    case 10:
      objc_msgSend(v5, "objectForSetting:", 5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "attributedString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "copyText:", v12);
      goto LABEL_24;
    case 11:
      objc_msgSend(v6, "undo");
      break;
    case 12:
      objc_msgSend(v6, "redo");
      break;
    case 13:
      objc_msgSend(v6, "beginTextPlaceholder");
      break;
    case 14:
      objc_msgSend(v6, "endTextPlaceholderAndWillInsertText:", objc_msgSend(v5, "BOOLForSetting:", 14));
      break;
    case 15:
      objc_msgSend(v6, "enableSmallDetent:", objc_msgSend(v5, "BOOLForSetting:", 15));
      break;
    case 16:
      objc_msgSend(v6, "enableIntelligentEntryFieldView:", objc_msgSend(v5, "BOOLForSetting:", 16));
      break;
    case 17:
      objc_msgSend(v5, "objectForSetting:", 18);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForSetting:", 19);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "showContentWarningWithTitle:message:", v11, v12);
LABEL_24:

LABEL_25:
      break;
    case 18:
      objc_msgSend(v5, "objectForSetting:", 20);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "CGRectValue");
      v38 = v37;
      v40 = v39;
      v42 = v41;
      v44 = v43;

      objc_msgSend(v6, "showSmartReplyQuestionnaireWithRect:", v38, v40, v42, v44);
      break;
    default:
      break;
  }

}

void __58__WTUIActionClientToHost_performActionForSceneController___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (objc_class *)MEMORY[0x24BE0BE40];
  v4 = a2;
  v8 = objc_alloc_init(v3);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0BED0]), "initWithArray:", v4);

  objc_msgSend(v8, "setObject:forSetting:", v5, 13);
  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BE0BD90], "responseWithInfo:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendResponse:", v7);

}

@end
