@implementation UIWebFormDelegate

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIWebFormDelegate;
  -[UIWebFormDelegate dealloc](&v3, sel_dealloc);
}

- (void)frame:(id)a3 sourceFrame:(id)a4 willSubmitForm:(id)a5 withValues:(id)a6 submissionListener:(id)a7
{
  UIWebAutoFillDelegate *v13;
  id v14;
  _QWORD v15[5];

  if (-[UIWebBrowserView autoFillDelegate](self->_webBrowserView, "autoFillDelegate"))
  {
    v13 = -[UIWebBrowserView autoFillDelegate](self->_webBrowserView, "autoFillDelegate");
    v14 = +[UIWebBrowserView getUIWebBrowserViewForWebFrame:](UIWebBrowserView, "getUIWebBrowserViewForWebFrame:", a3);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __84__UIWebFormDelegate_frame_sourceFrame_willSubmitForm_withValues_submissionListener___block_invoke;
    v15[3] = &unk_1E16B41B8;
    v15[4] = a7;
    -[UIWebAutoFillDelegate webBrowserView:willSubmitForm:toFrame:fromFrame:withValues:submissionHandler:](v13, "webBrowserView:willSubmitForm:toFrame:fromFrame:withValues:submissionHandler:", v14, a5, a3, a4, a6, v15);
  }
  else
  {
    objc_msgSend(a7, "continue");
  }
}

uint64_t __84__UIWebFormDelegate_frame_sourceFrame_willSubmitForm_withValues_submissionListener___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "continue");
}

- (void)textDidChangeInTextArea:(id)a3 inFrame:(id)a4
{
  if (!-[UIWebFormDelegate _shouldIgnoreFormTextChangesInFrame:](self, "_shouldIgnoreFormTextChangesInFrame:", a4))
    -[UIWebFormDelegate _didEditFormElement:inFrame:](self, "_didEditFormElement:inFrame:", a3, a4);
  objc_msgSend(+[UIWebBrowserView getUIWebBrowserViewForWebFrame:](UIWebBrowserView, "getUIWebBrowserViewForWebFrame:", a4), "formDelegateTextDidChange");
}

- (void)textDidChangeInTextField:(id)a3 inFrame:(id)a4
{
  UIWebAutoFillDelegate *v7;

  if (!-[UIWebFormDelegate _shouldIgnoreFormTextChangesInFrame:](self, "_shouldIgnoreFormTextChangesInFrame:", a4))
  {
    -[UIWebFormDelegate _didEditFormElement:inFrame:](self, "_didEditFormElement:inFrame:", a3, a4);
    v7 = -[UIWebBrowserView autoFillDelegate](self->_webBrowserView, "autoFillDelegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[UIWebAutoFillDelegate webBrowserView:textDidChangeInTextField:inFrame:](v7, "webBrowserView:textDidChangeInTextField:inFrame:", self->_webBrowserView, a3, a4);
  }
  objc_msgSend(+[UIWebBrowserView getUIWebBrowserViewForWebFrame:](UIWebBrowserView, "getUIWebBrowserViewForWebFrame:", a4), "formDelegateTextDidChange");
}

- (void)textFieldDidBeginEditing:(id)a3 inFrame:(id)a4
{
  -[UIWebAutoFillDelegate webBrowserView:didBeginEditingTextField:inFrame:](-[UIWebBrowserView autoFillDelegate](self->_webBrowserView, "autoFillDelegate"), "webBrowserView:didBeginEditingTextField:inFrame:", +[UIWebBrowserView getUIWebBrowserViewForWebFrame:](UIWebBrowserView, "getUIWebBrowserViewForWebFrame:", a4), a3, a4);
}

- (void)textFieldDidEndEditing:(id)a3 inFrame:(id)a4
{
  -[UIWebAutoFillDelegate webBrowserView:didEndEditingTextField:inFrame:](-[UIWebBrowserView autoFillDelegate](self->_webBrowserView, "autoFillDelegate"), "webBrowserView:didEndEditingTextField:inFrame:", +[UIWebBrowserView getUIWebBrowserViewForWebFrame:](UIWebBrowserView, "getUIWebBrowserViewForWebFrame:", a4), a3, a4);
}

- (BOOL)textField:(id)a3 doCommandBySelector:(SEL)a4 inFrame:(id)a5
{
  return 0;
}

- (void)didFocusTextField:(id)a3 inFrame:(id)a4
{
  -[UIWebAutoFillDelegate webBrowserView:didFocusTextField:inFrame:](-[UIWebBrowserView autoFillDelegate](self->_webBrowserView, "autoFillDelegate"), "webBrowserView:didFocusTextField:inFrame:", self->_webBrowserView, a3, a4);
}

- (void)willSendSubmitEventToForm:(id)a3 inFrame:(id)a4 withValues:(id)a5
{
  -[UIWebBrowserView autoFillDelegate](self->_webBrowserView, "autoFillDelegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIWebAutoFillDelegate webBrowserView:willSendSubmitEventToForm:inFrame:withValues:](-[UIWebBrowserView autoFillDelegate](self->_webBrowserView, "autoFillDelegate"), "webBrowserView:willSendSubmitEventToForm:inFrame:withValues:", +[UIWebBrowserView getUIWebBrowserViewForWebFrame:](UIWebBrowserView, "getUIWebBrowserViewForWebFrame:", a4), a3, a4, a5);
}

- (UIWebFormDelegate)initWithWebBrowserView:(id)a3
{
  UIWebFormDelegate *v4;
  _UIWebFormDelegateEditedFormsMap *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIWebFormDelegate;
  v4 = -[UIWebFormDelegate init](&v7, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(_UIWebFormDelegateEditedFormsMap);
    v4->_webBrowserView = (UIWebBrowserView *)a3;
    v4->_editedForms = v5;
  }
  return v4;
}

- (BOOL)formWasEdited
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)objc_msgSend(-[_UIWebFormDelegateEditedFormsMap allValues](self->_editedForms, "allValues"), "objectEnumerator");
  v3 = (void *)objc_msgSend(v2, "nextObject");
  if (v3)
  {
    while (1)
    {
      v4 = (void *)objc_msgSend(v3, "objectEnumerator");
      v5 = objc_msgSend(v4, "nextObject");
      if (v5)
        break;
LABEL_12:
      v3 = (void *)objc_msgSend(v2, "nextObject");
      if (!v3)
        return (char)v3;
    }
    v6 = (void *)v5;
    while (1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if ((objc_msgSend(v6, "_isEdited") & 1) == 0)
          goto LABEL_11;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(v6, "_isEdited"))
          goto LABEL_11;
      }
      if (objc_msgSend(v6, "inDocument") && !objc_msgSend(v6, "isHidden"))
      {
        LOBYTE(v3) = 1;
        return (char)v3;
      }
LABEL_11:
      v6 = (void *)objc_msgSend(v4, "nextObject");
      if (!v6)
        goto LABEL_12;
    }
  }
  return (char)v3;
}

- ($94EAB4A8BE99507F6334A41B2EE9F3E4)suggestionsForString:(id)a3 inputIndex:(unsigned int)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;
  $94EAB4A8BE99507F6334A41B2EE9F3E4 result;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = (void *)-[UIWebAutoFillDelegate webBrowserView:suggestionsForString:](-[UIWebBrowserView autoFillDelegate](self->_webBrowserView, "autoFillDelegate"), "webBrowserView:suggestionsForString:", self->_webBrowserView, a3);
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count") + 1);
  objc_msgSend(v7, "addObject:", a3);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x1E0DBDBE8], "candidateWithCandidate:forInput:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11++), a3));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }
  v12 = a4;
  v13 = v7;
  result.var1 = v12;
  result.var0 = v13;
  return result;
}

- (BOOL)hasCurrentSuggestions
{
  return -[UIWebAutoFillDelegate hasCurrentSuggestionsForWebBrowserView:](-[UIWebBrowserView autoFillDelegate](self->_webBrowserView, "autoFillDelegate"), "hasCurrentSuggestionsForWebBrowserView:", self->_webBrowserView);
}

- (void)acceptedAutoFillWord:(id)a3
{
  -[UIWebAutoFillDelegate webBrowserView:acceptedAutoFillWord:](-[UIWebBrowserView autoFillDelegate](self->_webBrowserView, "autoFillDelegate"), "webBrowserView:acceptedAutoFillWord:", self->_webBrowserView, a3);
}

- (void)_didEditFormElement:(id)a3 inFrame:(id)a4
{
  _BOOL4 v7;
  void *v8;
  void *v9;
  id v10;

  v7 = -[UIWebFormDelegate formWasEdited](self, "formWasEdited");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = (void *)objc_msgSend(a3, "form");
    if (v8)
    {
      v9 = v8;
      if (objc_msgSend((id)objc_msgSend(v8, "action"), "length")
        || objc_msgSend((id)objc_msgSend(v9, "method"), "length"))
      {
        v10 = -[_UIWebFormDelegateEditedFormsMap objectForKey:](self->_editedForms, "objectForKey:", a4);
        if (!v10)
        {
          v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          -[_UIWebFormDelegateEditedFormsMap setObject:forKey:](self->_editedForms, "setObject:forKey:", v10, a4);

        }
        if ((objc_msgSend(v10, "containsObject:", a3) & 1) == 0)
          objc_msgSend(v10, "addObject:", a3);
      }
    }
  }
  if (v7 != -[UIWebFormDelegate formWasEdited](self, "formWasEdited"))
  {
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("DebugConfirmTossingUnsubmittedFormTextPreferenceKey")))-[UIWebBrowserView _webViewFormEditedStatusHasChanged:](self->_webBrowserView, "_webViewFormEditedStatusHasChanged:", objc_msgSend(a4, "webView"));
  }
}

- (BOOL)_shouldIgnoreFormTextChangesInFrame:(id)a3
{
  return -[UIWebBrowserView _isAutoFilling](self->_webBrowserView, "_isAutoFilling", a3);
}

- (void)_clearEditedFormsInFrame:(id)a3
{
  _BOOL4 v5;
  id v6;
  _UIWebFormDelegateEditedFormsMap *editedForms;

  v5 = -[UIWebFormDelegate formWasEdited](self, "formWasEdited");
  v6 = -[_UIWebFormDelegateEditedFormsMap objectForKey:](self->_editedForms, "objectForKey:", a3);
  editedForms = self->_editedForms;
  if (v6)
    -[_UIWebFormDelegateEditedFormsMap removeObjectForKey:](editedForms, "removeObjectForKey:", a3);
  else
    -[_UIWebFormDelegateEditedFormsMap removeAllObjects](editedForms, "removeAllObjects");
  if (v5 != -[UIWebFormDelegate formWasEdited](self, "formWasEdited"))
  {
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("DebugConfirmTossingUnsubmittedFormTextPreferenceKey")))-[UIWebBrowserView _webViewFormEditedStatusHasChanged:](self->_webBrowserView, "_webViewFormEditedStatusHasChanged:", objc_msgSend(a3, "webView"));
  }
}

@end
