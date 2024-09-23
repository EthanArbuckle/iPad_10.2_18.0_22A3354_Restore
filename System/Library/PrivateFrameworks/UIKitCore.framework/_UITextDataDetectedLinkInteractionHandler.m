@implementation _UITextDataDetectedLinkInteractionHandler

- (_UITextDataDetectedLinkInteractionHandler)initWithItem:(id)a3 textContentView:(id)a4
{
  id v6;
  _UITextDataDetectedLinkInteractionHandler *v7;
  _UITextDataDetectedLinkInteractionHandler *v8;
  CGFloat *p_x;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  objc_super v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;
  CGPoint v38;
  CGRect v39;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v31.receiver = self;
  v31.super_class = (Class)_UITextDataDetectedLinkInteractionHandler;
  v7 = -[_UITextItemInteractionHandler initWithItem:textContentView:](&v31, sel_initWithItem_textContentView_, v6, a4);
  v8 = v7;
  if (v7)
  {
    p_x = &v7->_rect.origin.x;
    v10 = v6;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(v10, "rects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v33;
      while (2)
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v33 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v15), "CGRectValue");
          v17 = v16;
          v19 = v18;
          v21 = v20;
          v23 = v22;
          objc_msgSend(v10, "location");
          v38.x = v24;
          v38.y = v25;
          v39.origin.x = v17;
          v39.origin.y = v19;
          v39.size.width = v21;
          v39.size.height = v23;
          if (CGRectContainsPoint(v39, v38))
          {

            goto LABEL_12;
          }
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        if (v13)
          continue;
        break;
      }
    }

    objc_msgSend(v10, "bounds");
    v17 = v26;
    v19 = v27;
    v21 = v28;
    v23 = v29;
LABEL_12:

    *p_x = v17;
    v8->_rect.origin.y = v19;
    v8->_rect.size.width = v21;
    v8->_rect.size.height = v23;
  }

  return v8;
}

- (BOOL)_useDataDetectorsContextMenuConfiguration
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  char v7;
  _BOOL4 v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;

  -[_UITextItemInteractionHandler item](self, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "link");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v4;
  objc_msgSend(v5, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasPrefix:", CFSTR("x-apple-data-detectors"));

  if ((v7 & 1) != 0)
    goto LABEL_4;
  if (!DataDetectorsUILibrary())
  {

    goto LABEL_8;
  }
  if ((objc_msgSend(v5, "dd_isMaps:", 1) & 1) != 0)
  {
LABEL_4:
    v8 = 0;
    v9 = v5;
LABEL_9:

    goto LABEL_10;
  }
  v10 = objc_msgSend(v5, "dd_isAnySimpleTelephonyScheme");

  if ((v10 & 1) == 0)
  {
LABEL_8:
    -[_UITextItemInteractionHandler item](self, "item");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextItemInteractionHandler textContentView](self, "textContentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "range");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "asRange");

    objc_msgSend(v11, "textStorage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "attribute:atIndex:effectiveRange:", CFSTR("DDResultAttributeName"), v13, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v15 == 0;

    goto LABEL_9;
  }
  v8 = 0;
LABEL_10:
  -[_UITextItemInteractionHandler _menuForInteractableItem](self, "_menuForInteractableItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  v18 = 1;
  if (v8 && v16)
  {
    objc_msgSend(v16, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v19, "isEqualToString:", CFSTR("UITextItemDefaultMenuIdentifier"));

  }
  return v18;
}

- (id)_defaultContextMenuConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  CGSize size;
  void *v10;
  _QWORD *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id result;
  void *v17;
  void *v18;
  _OWORD v19[2];
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  -[_UITextItemInteractionHandler textContentView](self, "textContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0;
  v26 = &v25;
  v27 = 0x2050000000;
  v5 = (void *)qword_1ECD7CA40;
  v28 = qword_1ECD7CA40;
  if (!qword_1ECD7CA40)
  {
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = (uint64_t)__getDDContextMenuActionClass_block_invoke;
    v23 = &unk_1E16B14C0;
    v24 = &v25;
    __getDDContextMenuActionClass_block_invoke((uint64_t)&v20);
    v5 = (void *)v26[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v25, 8);
  objc_msgSend(v4, "dd_contextAtLocation:", -[_UITextItemInteractionHandler range](self, "range"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  size = self->_rect.size;
  v19[0] = self->_rect.origin;
  v19[1] = size;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v19, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v21 = (uint64_t)&v20;
  v22 = 0x2020000000;
  v11 = (_QWORD *)qword_1ECD7CA48;
  v23 = (void *)qword_1ECD7CA48;
  if (!qword_1ECD7CA48)
  {
    v12 = DataDetectorsUILibrary();
    v11 = dlsym(v12, "kDataDetectorsSourceRectKey");
    *(_QWORD *)(v21 + 24) = v11;
    qword_1ECD7CA48 = (uint64_t)v11;
  }
  _Block_object_dispose(&v20, 8);
  if (v11)
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, *v11);

    v13 = -[_UITextItemInteractionHandler range](self, "range");
    -[_UITextItemInteractionHandler textContentView](self, "textContentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contextMenuConfigurationAtIndex:inTextStorage:inView:context:menuIdentifier:", v13, v4, v14, v8, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    return v15;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkDataDetectorsSourceRectKey(void)");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("_UITextItemInteractionHandler.m"), 33, CFSTR("%s"), dlerror());

    __break(1u);
  }
  return result;
}

- (id)_defaultPrimaryActionForInteractableItem
{
  void *v3;
  objc_super v5;

  -[_UITextDataDetectedLinkInteractionHandler _dataDetectorsRevealControllerAction](self, "_dataDetectorsRevealControllerAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[_UITextDataDetectedLinkInteractionHandler _defaultDataDetectorsPrimaryAction](self, "_defaultDataDetectorsPrimaryAction");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v5.receiver = self;
      v5.super_class = (Class)_UITextDataDetectedLinkInteractionHandler;
      -[_UITextLinkInteractionHandler _defaultPrimaryActionForInteractableItem](&v5, sel__defaultPrimaryActionForInteractableItem);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v3;
}

- (id)_dataDetectorsRevealControllerAction
{
  return 0;
}

- (id)_defaultDataDetectorsPrimaryAction
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  CGRect *p_rect;
  CGFloat MidX;
  CGFloat MidY;
  id *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  _QWORD v34[4];
  _QWORD v35[3];
  _QWORD v36[5];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;

  v3 = -[_UITextItemInteractionHandler range](self, "range");
  -[_UITextItemInteractionHandler textContentView](self, "textContentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = 0;
  v38 = &v37;
  v39 = 0x2050000000;
  v6 = (void *)getDDDetectionControllerClass_softClass;
  v40 = getDDDetectionControllerClass_softClass;
  if (!getDDDetectionControllerClass_softClass)
  {
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __getDDDetectionControllerClass_block_invoke;
    v36[3] = &unk_1E16B14C0;
    v36[4] = &v37;
    __getDDDetectionControllerClass_block_invoke((uint64_t)v36);
    v6 = (void *)v38[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v37, 8);
  objc_msgSend(v5, "dd_contextAtLocation:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sharedController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "shouldImmediatelyShowActionSheetForTapAtIndex:ofStorage:", v3, v5);

  objc_msgSend(v7, "sharedController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    objc_msgSend(v11, "titleForResultAtIndex:ofStorage:context:", v3, v5, v8);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v13, "length"))
    {
      v14 = -[_UITextItemInteractionHandler range](self, "range");
      objc_msgSend(v5, "attributedSubstringFromRange:", v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "string");
      v17 = objc_claimAutoreleasedReturnValue();

      v13 = (id)v17;
    }
    -[_UITextItemInteractionHandler item](self, "item");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "contextMenuInteraction");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    p_rect = &self->_rect;
    MidX = CGRectGetMidX(*p_rect);
    MidY = CGRectGetMidY(*p_rect);
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __79___UITextDataDetectedLinkInteractionHandler__defaultDataDetectorsPrimaryAction__block_invoke;
    v34[3] = &unk_1E16B2C88;
    v23 = (id *)v35;
    v35[0] = v19;
    *(CGFloat *)&v35[1] = MidX;
    *(CGFloat *)&v35[2] = MidY;
    v24 = v19;
    +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v13, 0, CFSTR("_UITextItemInteractionHandler.presentMenu.action"), v34);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v11, "defaultActionAtIndex:ofStorage:context:", v3, v5, v8);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      v25 = 0;
      goto LABEL_10;
    }
    -[_UITextItemInteractionHandler textContentView](self, "textContentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "icon");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __79___UITextDataDetectedLinkInteractionHandler__defaultDataDetectorsPrimaryAction__block_invoke_2;
    v30[3] = &unk_1E16B2CB0;
    v33 = v7;
    v23 = &v31;
    v13 = v13;
    v31 = v13;
    v32 = v26;
    v24 = v26;
    +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v27, v28, 0, v30);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_10:

  return v25;
}

- (CGRect)rect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rect.origin.x;
  y = self->_rect.origin.y;
  width = self->_rect.size.width;
  height = self->_rect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

@end
