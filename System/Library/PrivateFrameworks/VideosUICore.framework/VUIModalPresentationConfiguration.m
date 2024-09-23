@implementation VUIModalPresentationConfiguration

+ (id)presentationTypeKeyMap
{
  if (presentationTypeKeyMap_onceToken != -1)
    dispatch_once(&presentationTypeKeyMap_onceToken, &__block_literal_global_163);
  return (id)presentationTypeKeyMap__typeKeyMap;
}

void __59__VUIModalPresentationConfiguration_presentationTypeKeyMap__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[13];
  _QWORD v3[14];

  v3[13] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("fullScreen");
  v2[1] = CFSTR("pageSheet");
  v3[0] = &unk_1E9F3DD80;
  v3[1] = &unk_1E9F3DD98;
  v2[2] = CFSTR("formSheet");
  v2[3] = CFSTR("currentContext");
  v3[2] = &unk_1E9F3DDB0;
  v3[3] = &unk_1E9F3DDC8;
  v2[4] = CFSTR("custom");
  v2[5] = CFSTR("fullScreen");
  v3[4] = &unk_1E9F3DDE0;
  v3[5] = &unk_1E9F3DDF8;
  v2[6] = CFSTR("overCurrentContext");
  v2[7] = CFSTR("popover");
  v3[6] = &unk_1E9F3DDC8;
  v3[7] = &unk_1E9F3DE10;
  v2[8] = CFSTR("blurOverFullScreen");
  v2[9] = CFSTR("none");
  v3[8] = &unk_1E9F3DE28;
  v3[9] = &unk_1E9F3DE40;
  v2[10] = CFSTR("playback");
  v2[11] = CFSTR("alert");
  v3[10] = &unk_1E9F3DE58;
  v3[11] = &unk_1E9F3DE70;
  v2[12] = CFSTR("actionSheet");
  v3[12] = &unk_1E9F3DE88;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 13);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)presentationTypeKeyMap__typeKeyMap;
  presentationTypeKeyMap__typeKeyMap = v0;

}

- (VUIModalPresentationConfiguration)init
{
  VUIModalPresentationConfiguration *v2;
  VUIModalPresentationConfiguration *v3;
  UIBarButtonItem *popOverSourceBarButtonItem;
  CGSize v5;
  UIView *popOverSourceView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VUIModalPresentationConfiguration;
  v2 = -[VUIModalPresentationConfiguration init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    popOverSourceBarButtonItem = v2->_popOverSourceBarButtonItem;
    v2->_type = 0;
    v2->_popOverSourceBarButtonItem = 0;
    v2->_navigationBarHidden = 1;
    *(_WORD *)&v2->_allowsModalOverModal = 256;

    v5 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    v3->_popOverSourceRect.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    v3->_popOverSourceRect.size = v5;
    popOverSourceView = v3->_popOverSourceView;
    v3->_popOverSourceView = 0;

    v3->_popOverArrowDirection = 15;
  }
  return v3;
}

- (VUIModalPresentationConfiguration)initWithOptions:(id)a3
{
  id v4;
  VUIModalPresentationConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t type;

  v4 = a3;
  v5 = -[VUIModalPresentationConfiguration init](self, "init");
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "presentationTypeKeyMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("presentationType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      type = objc_msgSend(v8, "integerValue");
    else
      type = v5->_type;
    v5->_type = type;

  }
  return v5;
}

- (void)_applyAlertActionsForController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VUIModalPresentationConfiguration alertActions](self, "alertActions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setActions:", v5);

}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (BOOL)allowsModalOverModal
{
  return self->_allowsModalOverModal;
}

- (void)setAllowsModalOverModal:(BOOL)a3
{
  self->_allowsModalOverModal = a3;
}

- (BOOL)isMenuDismissable
{
  return self->_menuDismissable;
}

- (void)setMenuDismissable:(BOOL)a3
{
  self->_menuDismissable = a3;
}

- (BOOL)isNavigationBarHidden
{
  return self->_navigationBarHidden;
}

- (void)setNavigationBarHidden:(BOOL)a3
{
  self->_navigationBarHidden = a3;
}

- (BOOL)isAnimated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (UIBarButtonItem)popOverSourceBarButtonItem
{
  return self->_popOverSourceBarButtonItem;
}

- (void)setPopOverSourceBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_popOverSourceBarButtonItem, a3);
}

- (UIView)popOverSourceView
{
  return self->_popOverSourceView;
}

- (void)setPopOverSourceView:(id)a3
{
  objc_storeStrong((id *)&self->_popOverSourceView, a3);
}

- (CGRect)popOverSourceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_popOverSourceRect.origin.x;
  y = self->_popOverSourceRect.origin.y;
  width = self->_popOverSourceRect.size.width;
  height = self->_popOverSourceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPopOverSourceRect:(CGRect)a3
{
  self->_popOverSourceRect = a3;
}

- (unint64_t)popOverArrowDirection
{
  return self->_popOverArrowDirection;
}

- (void)setPopOverArrowDirection:(unint64_t)a3
{
  self->_popOverArrowDirection = a3;
}

- (NSArray)alertActions
{
  return self->_alertActions;
}

- (void)setAlertActions:(id)a3
{
  objc_storeStrong((id *)&self->_alertActions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertActions, 0);
  objc_storeStrong((id *)&self->_popOverSourceView, 0);
  objc_storeStrong((id *)&self->_popOverSourceBarButtonItem, 0);
}

@end
