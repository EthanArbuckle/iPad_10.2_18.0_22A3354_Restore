@implementation SiriSharedUITranscriptItem

+ (id)transcriptItemWithAceObject:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAceObject:", v4);

  return v5;
}

- (SiriSharedUITranscriptItem)initWithAceObject:(id)a3
{
  id v5;
  SiriSharedUITranscriptItem *v6;
  SiriSharedUITranscriptItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SiriSharedUITranscriptItem;
  v6 = -[SiriSharedUITranscriptItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_aceObject, a3);
    *(_WORD *)&v7->_shouldBeExposed = 1;
  }

  return v7;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SiriSharedUITranscriptItem;
  -[SiriSharedUITranscriptItem description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  -[SiriSharedUITranscriptItem viewController](self, "viewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" aceObject=%@, viewController=%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isConversationItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  int v12;

  -[SiriSharedUITranscriptItem aceObject](self, "aceObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUITranscriptItem viewController](self, "viewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "itemType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D88640]);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "itemType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D88648]);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "itemType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D88638]);

    if ((v8 & 1) != 0)
      goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "itemType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D88650]);

    if ((v10 & 1) != 0)
      goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v3, "sash"), v11 = (void *)objc_claimAutoreleasedReturnValue(), v11, v11))
  {
LABEL_11:
    LOBYTE(v12) = 0;
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v12 = objc_msgSend(v4, "hasSash") ^ 1;
  }
  else
  {
    LOBYTE(v12) = 1;
  }

  return v12;
}

- (BOOL)isHintItem
{
  void *v2;
  void *v3;
  char v4;

  -[SiriSharedUITranscriptItem aceObject](self, "aceObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "itemType");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D88648]);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isAnnouncementItem
{
  void *v2;
  void *v3;
  char v4;

  -[SiriSharedUITranscriptItem aceObject](self, "aceObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "itemType");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D88638]);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int64_t)platterCategory
{
  if ((AFDeviceSupportsSystemAssistantExperience() & 1) != 0
    || -[SiriSharedUITranscriptItem isConversationItem](self, "isConversationItem"))
  {
    return 1;
  }
  if (-[SiriSharedUITranscriptItem isAnnouncementItem](self, "isAnnouncementItem"))
    return 2;
  return 0;
}

+ (id)additionalContentViewPlatterCategories
{
  return &unk_1EA8AD9B0;
}

- (NSUUID)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (SiriSharedUIViewControlling)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
  objc_storeStrong((id *)&self->_viewController, a3);
}

- (AceObject)aceObject
{
  return self->_aceObject;
}

- (void)setAceObject:(id)a3
{
  objc_storeStrong((id *)&self->_aceObject, a3);
}

- (BOOL)isRestored
{
  return self->_restored;
}

- (void)setRestored:(BOOL)a3
{
  self->_restored = a3;
}

- (BOOL)shouldBeExposed
{
  return self->_shouldBeExposed;
}

- (void)setShouldBeExposed:(BOOL)a3
{
  self->_shouldBeExposed = a3;
}

- (BOOL)snippetViewControllerHasBeenUnloaded
{
  return self->_snippetViewControllerHasBeenUnloaded;
}

- (void)setSnippetViewControllerHasBeenUnloaded:(BOOL)a3
{
  self->_snippetViewControllerHasBeenUnloaded = a3;
}

- (CGRect)previousFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_previousFrame.origin.x;
  y = self->_previousFrame.origin.y;
  width = self->_previousFrame.size.width;
  height = self->_previousFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPreviousFrame:(CGRect)a3
{
  self->_previousFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aceObject, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end
