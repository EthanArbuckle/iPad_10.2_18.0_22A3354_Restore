@implementation MFSenderBlockingTriageInteraction

- (id)triageAction
{
  MSTriageAction *triageAction;
  id v4;
  void *v5;
  MSTriageAction *v6;
  MSTriageAction *v7;

  triageAction = self->_triageAction;
  if (!triageAction)
  {
    v4 = objc_alloc((Class)MSSenderBlockingTriageAction);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction messageListItemSelection](self, "messageListItemSelection"));
    v6 = (MSTriageAction *)objc_msgSend(v4, "initWithMessageListSelection:origin:actor:delegate:blockSender:", v5, -[MFTriageInteraction origin](self, "origin"), -[MFTriageInteraction actor](self, "actor"), self, self->_blockSender);
    v7 = self->_triageAction;
    self->_triageAction = v6;

    triageAction = self->_triageAction;
  }
  return triageAction;
}

+ (id)interactionWithMessageListItemSelection:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6 blockSender:(BOOL)a7
{
  id v8;
  _BYTE *v9;
  objc_super v11;

  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___MFSenderBlockingTriageInteraction;
  v8 = objc_msgSendSuper2(&v11, "interactionWithMessageListItemSelection:undoManager:origin:actor:", a3, a4, a5, a6);
  v9 = (_BYTE *)objc_claimAutoreleasedReturnValue(v8);
  if (v9)
    v9[88] = a7;
  return v9;
}

+ (id)interactionWithMessageListItems:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6 blockSender:(BOOL)a7
{
  id v8;
  _BYTE *v9;
  objc_super v11;

  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___MFSenderBlockingTriageInteraction;
  v8 = objc_msgSendSuper2(&v11, "interactionWithMessageListItems:undoManager:origin:actor:", a3, a4, a5, a6);
  v9 = (_BYTE *)objc_claimAutoreleasedReturnValue(v8);
  if (v9)
    v9[88] = a7;
  return v9;
}

- (id)title
{
  _BOOL4 blockSender;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  blockSender = self->_blockSender;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = v3;
  if (blockSender)
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("BLOCK_SENDER"), &stru_100531B00, CFSTR("Main")));
  else
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("UNBLOCK_SENDER"), &stru_100531B00, CFSTR("Main")));
  v6 = (void *)v5;

  return v6;
}

- (id)accessibilityIdentifer
{
  return MSAccessibilityIdentifierActionsViewControllerBlockSender;
}

- (id)shortTitle
{
  _BOOL4 blockSender;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  blockSender = self->_blockSender;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = v3;
  if (blockSender)
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("BLOCK_SENDER"), &stru_100531B00, CFSTR("Main")));
  else
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("UNBLOCK_SENDER"), &stru_100531B00, CFSTR("Main")));
  v6 = (void *)v5;

  return v6;
}

- (id)_iconImageName
{
  return MFImageGlyphStatusIndicatorBlockSender;
}

- (id)_previewImageName
{
  return MFImageGlyphStatusIndicatorBlockSender;
}

- (id)color
{
  return +[UIColor systemIndigoColor](UIColor, "systemIndigoColor");
}

- (BOOL)supportsSelectAll
{
  return 0;
}

- (BOOL)shouldUpdateWidget
{
  return 1;
}

- (void)setTriageAction:(id)a3
{
  objc_storeStrong((id *)&self->_triageAction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triageAction, 0);
}

@end
