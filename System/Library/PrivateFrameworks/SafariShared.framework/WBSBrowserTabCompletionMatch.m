@implementation WBSBrowserTabCompletionMatch

- (WBSBrowserTabCompletionMatch)initWithTabUUID:(id)a3 windowUUID:(id)a4 tabIndex:(unint64_t)a5 userTypedString:(id)a6 tabURL:(id)a7 tabTitle:(id)a8 forQueryID:(int64_t)a9
{
  id v16;
  id v17;
  WBSBrowserTabCompletionMatch *v18;
  WBSBrowserTabCompletionMatch *v19;
  WBSBrowserTabCompletionMatch *v20;
  objc_super v22;

  v16 = a3;
  v17 = a4;
  v22.receiver = self;
  v22.super_class = (Class)WBSBrowserTabCompletionMatch;
  v18 = -[WBSTabCompletionMatch initWithUserTypedString:url:title:forQueryID:](&v22, sel_initWithUserTypedString_url_title_forQueryID_, a6, a7, a8, a9);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_tabUUID, a3);
    objc_storeStrong((id *)&v19->_windowUUID, a4);
    v19->_tabIndex = a5;
    v20 = v19;
  }

  return v19;
}

- (WBSBrowserTabCompletionMatch)initWithTabInfo:(id)a3 userTypedString:(id)a4 alternativeDisplayTextForURL:(id)a5 forQueryID:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  WBSBrowserTabCompletionMatch *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSUUID *v21;
  NSUUID *tabGroupUUID;
  NSString *v23;
  NSString *tabGroupTitle;
  WBSBrowserTabCompletionMatch *v25;
  void *v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v10, "tabGroupTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13
    && (unint64_t)objc_msgSend(v11, "length") <= 2
    && (objc_msgSend(v11, "safari_allowsLooserMatchingInSearch") & 1) == 0
    && (objc_msgSend(MEMORY[0x1E0D89BE8], "isStreamlinedCompletionListEnabled") & 1) != 0)
  {
    v14 = 0;
  }
  else
  {
    v27 = v13;
    if (objc_msgSend(MEMORY[0x1E0D89BE8], "isReflectUserIntentInSearchEnabled")
      && objc_msgSend(v10, "pageStatus") == 2)
    {
      v15 = v12;
      v16 = 0;
    }
    else
    {
      v15 = v12;
      objc_msgSend(v10, "title");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "windowUUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v10, "tabIndex");
    objc_msgSend(v10, "url");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[WBSBrowserTabCompletionMatch initWithTabUUID:windowUUID:tabIndex:userTypedString:tabURL:tabTitle:forQueryID:](self, "initWithTabUUID:windowUUID:tabIndex:userTypedString:tabURL:tabTitle:forQueryID:", v17, v18, v19, v11, v20, v16, a6);

    v12 = v15;
    v13 = v27;
    if (self)
    {
      objc_msgSend(v10, "tabGroupUUID");
      v21 = (NSUUID *)objc_claimAutoreleasedReturnValue();
      tabGroupUUID = self->_tabGroupUUID;
      self->_tabGroupUUID = v21;

      v23 = (NSString *)objc_msgSend(v27, "copy");
      tabGroupTitle = self->_tabGroupTitle;
      self->_tabGroupTitle = v23;

      -[WBSURLCompletionMatch setAlternativeDisplayTextForURL:](self, "setAlternativeDisplayTextForURL:", v12);
      v25 = self;
    }

    v14 = self;
  }

  return v14;
}

- (BOOL)isLessRelevant
{
  void *v4;
  void *v5;
  char v6;

  if (self->_tabGroupUUID || -[WBSURLCompletionMatch matchLocation](self, "matchLocation") < 7)
    return 1;
  -[WBSURLCompletionMatch userInput](self, "userInput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v4, "length") >= 2)
  {

  }
  else
  {
    -[WBSURLCompletionMatch userInput](self, "userInput");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "safari_allowsLooserMatchingInSearch");

    if ((v6 & 1) == 0)
      return !self->_highlyRelevant;
  }
  return 0;
}

- (id)parsecDomainIdentifier
{
  return CFSTR("switch_to_tab");
}

- (NSUUID)tabUUID
{
  return self->_tabUUID;
}

- (NSUUID)tabGroupUUID
{
  return self->_tabGroupUUID;
}

- (NSString)tabGroupTitle
{
  return self->_tabGroupTitle;
}

- (NSUUID)windowUUID
{
  return self->_windowUUID;
}

- (unint64_t)tabIndex
{
  return self->_tabIndex;
}

- (BOOL)isHighlyRelevant
{
  return self->_highlyRelevant;
}

- (void)setHighlyRelevant:(BOOL)a3
{
  self->_highlyRelevant = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowUUID, 0);
  objc_storeStrong((id *)&self->_tabGroupTitle, 0);
  objc_storeStrong((id *)&self->_tabGroupUUID, 0);
  objc_storeStrong((id *)&self->_tabUUID, 0);
}

@end
