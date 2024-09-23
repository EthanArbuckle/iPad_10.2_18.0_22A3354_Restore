@implementation UIWebElementAction

- (UIWebElementAction)initWithTitle:(id)a3 actionHandler:(id)a4 type:(int)a5
{
  UIWebElementAction *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UIWebElementAction;
  v8 = -[UIWebElementAction init](&v10, sel_init);
  if (v8)
  {
    v8->_title = (NSString *)a3;
    v8->_type = a5;
    v8->_actionHandler = _Block_copy(a4);
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  self->_title = 0;
  self->_actionHandler = 0;

  self->_dismissalHandler = 0;
  v3.receiver = self;
  v3.super_class = (Class)UIWebElementAction;
  -[UIWebElementAction dealloc](&v3, sel_dealloc);
}

+ (id)customElementActionWithTitle:(id)a3 actionHandler:(id)a4
{
  id v6;
  _QWORD v8[5];

  v6 = objc_alloc((Class)a1);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__UIWebElementAction_customElementActionWithTitle_actionHandler___block_invoke;
  v8[3] = &unk_1E16ECC20;
  v8[4] = a4;
  return (id)objc_msgSend(v6, "initWithTitle:actionHandler:type:", a3, v8, 0);
}

uint64_t __65__UIWebElementAction_customElementActionWithTitle_actionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)standardElementActionWithType:(int)a3 customTitle:(id)a4 context:(id)a5
{
  uint64_t v5;
  id v7;
  _QWORD *v8;
  id result;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  UIWebElementAction *v13;
  id v14;
  _QWORD v15[5];
  _QWORD v16[5];

  v5 = *(_QWORD *)&a3;
  switch(a3)
  {
    case 1:
      v7 = (id)objc_msgSend(_UIKitBundle(), "localizedStringForKey:value:table:", CFSTR("Open Link"), CFSTR("Open"), CFSTR("Localizable"));
      v8 = &__block_literal_global_344_1;
      goto LABEL_10;
    case 2:
      v7 = (id)objc_msgSend(_UIKitBundle(), "localizedStringForKey:value:table:", CFSTR("Copy Link"), CFSTR("Copy"), CFSTR("Localizable"));
      v8 = &__block_literal_global_679;
      goto LABEL_10;
    case 3:
      v7 = _UINSLocalizedStringWithDefaultValue(CFSTR("Save Image"), CFSTR("Save Image"));
      v8 = &__block_literal_global_347;
      goto LABEL_10;
    case 4:
      v7 = _UINSLocalizedStringWithDefaultValue(CFSTR("Add to Reading List"), CFSTR("Add to Reading List"));
      v8 = &__block_literal_global_350;
      goto LABEL_10;
    case 5:
      v10 = objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("UIWebElementActionContextAppLinkKey"));
      v7 = _UINSLocalizedStringWithDefaultValue(CFSTR("Open in Safari"), CFSTR("Open in Safari"));
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __72__UIWebElementAction_standardElementActionWithType_customTitle_context___block_invoke_5;
      v16[3] = &unk_1E16ECC68;
      v16[4] = v10;
      v8 = v16;
      goto LABEL_10;
    case 6:
      v11 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("UIWebElementActionContextAppLinkKey"));
      v12 = objc_msgSend((id)objc_msgSend(v11, "targetApplicationProxy"), "localizedNameForContext:", 0);
      v7 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", objc_msgSend(_UIKitBundle(), "localizedStringForKey:value:table:", CFSTR("Open in “%@” (Link Element Action Sheet Button)"), CFSTR("Open in “%@”"), CFSTR("Localizable")), v12);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __72__UIWebElementAction_standardElementActionWithType_customTitle_context___block_invoke_7;
      v15[3] = &unk_1E16ECC68;
      v15[4] = v11;
      v8 = v15;
      goto LABEL_10;
    case 7:
      v7 = _UINSLocalizedStringWithDefaultValue(CFSTR("Share…"), CFSTR("Share…"));
      v8 = &__block_literal_global_363_0;
LABEL_10:
      v13 = [UIWebElementAction alloc];
      if (a4)
        v14 = a4;
      else
        v14 = v7;
      result = -[UIWebElementAction initWithTitle:actionHandler:type:](v13, "initWithTitle:actionHandler:type:", v14, v8, v5);
      break;
    default:
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("There is no standard web element action of type %d."), a5, *(_QWORD *)&a3);
      result = 0;
      break;
  }
  return result;
}

void __72__UIWebElementAction_standardElementActionWithType_customTitle_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  UIPasteboard *v7;
  uint64_t v8;
  UIPasteboard *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;

  if (a3)
  {
    v4 = objc_alloc(MEMORY[0x1E0C99E08]);
    v5 = objc_msgSend(a3, "absoluteString");
    v6 = objc_msgSend(UIPasteboardTypeListString, "objectAtIndex:", 0);
    v18 = (id)objc_msgSend(v4, "initWithObjectsAndKeys:", v5, v6, a3, objc_msgSend(UIPasteboardTypeListURL, "objectAtIndex:", 0), 0);
    v7 = +[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard");
    v8 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v18);
    v9 = v7;
LABEL_3:
    -[UIPasteboard setItems:](v9, "setItems:", v8);

    return;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = objc_msgSend(a2, "dataRepresentation:", 1);
      if (v11)
      {
        v12 = v11;
        v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v13 = objc_msgSend(a2, "mimeType");
        v14 = objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithTag:tagClass:conformingToType:", v13, *MEMORY[0x1E0CEC408], 0);
        if (v14)
        {
          v15 = (void *)v14;
          v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(v16, "setObject:forKey:", v12, objc_msgSend(v15, "identifier"));
          v17 = objc_msgSend(a2, "absoluteImageURL");
          objc_msgSend(v16, "setObject:forKey:", v17, objc_msgSend((id)*MEMORY[0x1E0CEC618], "identifier"));
          objc_msgSend(v18, "addObject:", v16);

        }
        v9 = +[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard");
        v8 = (uint64_t)v18;
        goto LABEL_3;
      }
    }
  }
}

uint64_t __72__UIWebElementAction_standardElementActionWithType_customTitle_context___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return objc_msgSend(a4, "performClick:", a4);
}

void __72__UIWebElementAction_standardElementActionWithType_customTitle_context___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = (void *)objc_msgSend(a2, "dataRepresentation:", 0);
    if (v3)
      UIImageDataWriteToSavedPhotosAlbum(v3, 0, 0, 0);
  }
}

uint64_t __72__UIWebElementAction_standardElementActionWithType_customTitle_context___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = objc_msgSend(a3, "absoluteString");
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (v6 = (void *)objc_msgSend(a2, "innerText"),
        (v7 = (void *)objc_msgSend(v6, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet"))) == 0)|| (v8 = v7, !objc_msgSend(v7, "length")))
  {
    v8 = (void *)v5;
  }
  return objc_msgSend((id)objc_msgSend((id)getSSReadingListClass_0(), "defaultReadingList"), "addReadingListItemWithURL:title:previewText:error:", a3, v8, 0, 0);
}

uint64_t __72__UIWebElementAction_standardElementActionWithType_customTitle_context___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "openInWebBrowser:setAppropriateOpenStrategyAndWebBrowserState:completionHandler:", 1, 0, &__block_literal_global_354_0);
}

uint64_t __72__UIWebElementAction_standardElementActionWithType_customTitle_context___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "openInWebBrowser:setAppropriateOpenStrategyAndWebBrowserState:completionHandler:", 0, 0, &__block_literal_global_360);
}

uint64_t __72__UIWebElementAction_standardElementActionWithType_customTitle_context___block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return objc_msgSend(a4, "_shareElement:withURL:", a2, a3);
}

+ (id)standardElementActionWithType:(int)a3
{
  return (id)objc_msgSend(a1, "standardElementActionWithType:customTitle:context:", *(_QWORD *)&a3, 0, 0);
}

- (id)_title
{
  return self->_title;
}

- (void)_runActionWithElement:(id)a3 targetURL:(id)a4 documentView:(id)a5 interactionLocation:(CGPoint)a6
{
  -[UIWebElementActionInfo _setInteractionLocation:](objc_alloc_init(UIWebElementActionInfo), "_setInteractionLocation:", a6.x, a6.y);
  (*((void (**)(void))self->_actionHandler + 2))();
}

- (int)type
{
  return self->_type;
}

- (id)dismissalHandler
{
  return self->_dismissalHandler;
}

- (void)setDismissalHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

@end
