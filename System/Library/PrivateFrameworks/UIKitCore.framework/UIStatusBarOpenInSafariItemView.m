@implementation UIStatusBarOpenInSafariItemView

- (id)_displayStringFromURL:(id)a3
{
  void *v3;
  void *v4;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a3, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "host");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)updateForNewData:(id)a3 actions:(int)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;

  v5 = a3;
  v6 = objc_msgSend(v5, "rawData");
  if (*(_BYTE *)(v6 + 2793))
  {
    v7 = v6 + 2793;
    -[UIStatusBarOpenInSafariItemView setSystemNavigationAction:](self, "setSystemNavigationAction:", 0);
    v8 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLWithString:encodingInvalidCharacters:", v9, 0);
  }
  else
  {
    objc_msgSend(v5, "systemNavigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStatusBarOpenInSafariItemView setSystemNavigationAction:](self, "setSystemNavigationAction:", v10);

    -[UIStatusBarOpenInSafariItemView systemNavigationAction](self, "systemNavigationAction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLForDestination:", 1);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIStatusBarOpenInSafariItemView _displayStringFromURL:](self, "_displayStringFromURL:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = v12;
    objc_msgSend(v12, "componentsSeparatedByString:", CFSTR("."));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "mutableCopy");

    if (objc_msgSend(v15, "count"))
    {
      objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("www"));

      if (v17)
        objc_msgSend(v15, "removeObjectAtIndex:", 0);
    }
    if (objc_msgSend(v15, "count"))
    {
      if (qword_1ECD79EE0 != -1)
        dispatch_once(&qword_1ECD79EE0, &__block_literal_global_472);
      v18 = (void *)_MergedGlobals_1_19;
      objc_msgSend(v15, "lastObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "containsObject:", v19))
        v20 = 3;
      else
        v20 = 2;

      if (objc_msgSend(v15, "count") > v20)
        objc_msgSend(v15, "removeObjectsInRange:", 0, objc_msgSend(v15, "count") - v20);
    }
    objc_msgSend(v15, "componentsJoinedByString:", CFSTR("."));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = 0;
  }
  -[UIStatusBarOpenInSafariItemView destinationText](self, "destinationText");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isEqualToString:", v21);

  if ((v23 & 1) == 0)
  {
    -[UIStatusBarOpenInSafariItemView setDestinationText:](self, "setDestinationText:", v21);
    -[UIStatusBarSystemNavigationItemView setCurrentLabelCompressionLevel:](self, "setCurrentLabelCompressionLevel:", 0);
    -[UIStatusBarOpenInSafariItemView shortenedTitleWithCompressionLevel:](self, "shortenedTitleWithCompressionLevel:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStatusBarSystemNavigationItemView setTitle:](self, "setTitle:", v24);

  }
  return v23 ^ 1;
}

void __60__UIStatusBarOpenInSafariItemView_updateForNewData_actions___block_invoke()
{
  void *v0;

  v0 = (void *)_MergedGlobals_1_19;
  _MergedGlobals_1_19 = (uint64_t)&unk_1E1A948C8;

}

- (BOOL)layoutImageOnTrailingEdge
{
  return 1;
}

- (void)userDidActivateButton:(id)a3
{
  void *v4;
  int v5;
  id v6;

  -[UIStatusBarOpenInSafariItemView systemNavigationAction](self, "systemNavigationAction", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "canSendResponse");

  if (v5)
  {
    -[UIStatusBarOpenInSafariItemView systemNavigationAction](self, "systemNavigationAction");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sendResponseForDestination:", 1);

  }
}

- (id)_nominalTitleWithDestinationText:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  _UILocalizedStringInSystemLanguage(CFSTR("StatusBar: Website"), CFSTR("%@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)shortenedTitleWithCompressionLevel:(int)a3
{
  void *v4;
  void *v5;

  if (a3 == 1)
  {
    _UILocalizedStringInSystemLanguage(CFSTR("StatusBar: Webpage"), CFSTR("Webpage"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v4 = 0;
    goto LABEL_8;
  }
  if (a3)
  {
    v5 = 0;
    goto LABEL_7;
  }
  -[UIStatusBarOpenInSafariItemView destinationText](self, "destinationText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    -[UIStatusBarOpenInSafariItemView _nominalTitleWithDestinationText:](self, "_nominalTitleWithDestinationText:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
LABEL_8:

  return v5;
}

- (UISystemNavigationAction)systemNavigationAction
{
  return self->_systemNavigationAction;
}

- (void)setSystemNavigationAction:(id)a3
{
  objc_storeStrong((id *)&self->_systemNavigationAction, a3);
}

- (NSString)destinationText
{
  return self->_destinationText;
}

- (void)setDestinationText:(id)a3
{
  objc_storeStrong((id *)&self->_destinationText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationText, 0);
  objc_storeStrong((id *)&self->_systemNavigationAction, 0);
}

@end
