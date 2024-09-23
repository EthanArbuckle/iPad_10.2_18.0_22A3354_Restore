@implementation UITextContentView

- (UITextContentView)initWithFrame:(CGRect)a3
{
  UITextContentView *v3;
  UITextContentView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UITextContentView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[UITextContentView commonInitWithWebDocumentView:isDecoding:](v3, "commonInitWithWebDocumentView:isDecoding:", 0, 0);
  return v4;
}

- (UITextContentView)initWithFrame:(CGRect)a3 webView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  UITextContentView *v10;
  UITextContentView *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)UITextContentView;
  v10 = -[UIView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
    -[UITextContentView commonInitWithWebDocumentView:isDecoding:](v10, "commonInitWithWebDocumentView:isDecoding:", v9, 0);

  return v11;
}

- (UITextContentView)initWithCoder:(id)a3
{
  id v4;
  UITextContentView *v5;
  UITextContentView *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UITextContentView;
  v5 = -[UIView initWithCoder:](&v11, sel_initWithCoder_, v4);
  v6 = v5;
  if (!v5)
    goto LABEL_16;
  -[UITextContentView commonInitWithWebDocumentView:isDecoding:](v5, "commonInitWithWebDocumentView:isDecoding:", 0, 1);
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIAttributedText")))
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIAttributedText"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextContentView setAttributedText:](v6, "setAttributedText:", v7);
LABEL_6:

    goto LABEL_7;
  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIText")))
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIText"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextContentView setText:](v6, "setText:", v7);
    goto LABEL_6;
  }
LABEL_7:
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIFont")))
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIFont"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextContentView setFont:](v6, "setFont:", v8);

  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UITextColor")))
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UITextColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextContentView setTextColor:](v6, "setTextColor:", v9);

  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UITextAlignment")))
    -[UITextContentView setTextAlignment:](v6, "setTextAlignment:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UITextAlignment")));
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIEditable")))
    -[UITextContentView setEditable:](v6, "setEditable:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIEditable")));
  -[UITextContentView setDataDetectorTypes:](v6, "setDataDetectorTypes:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIDataDetectorTypes")));
LABEL_16:

  return v6;
}

- (void)_populateArchivedSubviews:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UITextContentView;
  -[UIView _populateArchivedSubviews:](&v5, sel__populateArchivedSubviews_, v4);
  if (self->m_webView)
    objc_msgSend(v4, "removeObject:");

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  UIFont *m_font;
  UIColor *m_textColor;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UITextContentView;
  -[UIView encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  -[UITextContentView text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "length"))
  {
    if (self->m_usesAttributedText)
    {
      -[UITextContentView attributedText](self, "attributedText");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("UIAttributedText"));

    }
    objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("UIText"));
  }
  m_font = self->m_font;
  if (m_font)
    objc_msgSend(v4, "encodeObject:forKey:", m_font, CFSTR("UIFont"));
  m_textColor = self->m_textColor;
  if (m_textColor)
    objc_msgSend(v4, "encodeObject:forKey:", m_textColor, CFSTR("UITextColor"));
  if (self->m_hasExplicitTextAlignment)
    objc_msgSend(v4, "encodeInteger:forKey:", self->m_textAlignment, CFSTR("UITextAlignment"));
  if (!-[UITextContentView isEditable](self, "isEditable"))
    objc_msgSend(v4, "encodeBool:forKey:", 0, CFSTR("UIEditable"));
  if (-[UITextContentView dataDetectorTypes](self, "dataDetectorTypes"))
    objc_msgSend(v4, "encodeInteger:forKey:", -[UITextContentView dataDetectorTypes](self, "dataDetectorTypes"), CFSTR("UIDataDetectorTypes"));

}

- (void)updateContentEditableAttribute:(BOOL)a3
{
  _BOOL4 v3;
  const __CFString *v5;
  void *v6;

  v3 = a3;
  if (a3)
    v5 = CFSTR("true");
  else
    v5 = CFSTR("false");
  -[DOMHTMLElement setContentEditable:](self->m_body, "setContentEditable:", v5);
  if (v3)
  {
    -[WebFrame selectedDOMRange](self->m_frame, "selectedDOMRange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      -[WebFrame _setSelectionFromNone](self->m_frame, "_setSelectionFromNone");
  }
}

- (void)commonInitWithWebDocumentView:(id)a3 isDecoding:(BOOL)a4
{
  UIFont *v7;
  UIFont *m_font;
  UIColor *v9;
  UIColor *m_textColor;
  UITextInteractionAssistant *v11;
  UITextInteractionAssistant *m_interactionAssistant;
  double v13;
  double v14;
  double v15;
  double v16;
  UIWebDocumentView *v17;
  void *v18;
  void *v19;
  UIWebDocumentView *v20;
  UIWebDocumentView *m_webView;
  void *v22;
  void *v23;
  void *v24;
  WebFrame *v25;
  WebFrame *m_frame;
  void *v27;
  DOMHTMLElement *v28;
  DOMHTMLElement *m_body;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  UIDragInteraction *v37;
  UIDragInteraction *m_dragInteraction;
  UIDropInteraction *v39;
  UIDropInteraction *m_dropInteraction;
  id v41;

  v41 = a3;
  WebThreadLock();
  objc_msgSend(off_1E167A828, "systemFontOfSize:", 12.0);
  v7 = (UIFont *)objc_claimAutoreleasedReturnValue();
  m_font = self->m_font;
  self->m_font = v7;

  self->m_marginTop = 8;
  +[UIColor blackColor](UIColor, "blackColor");
  v9 = (UIColor *)objc_claimAutoreleasedReturnValue();
  m_textColor = self->m_textColor;
  self->m_textColor = v9;

  self->m_editable = 1;
  v11 = -[UITextInteractionAssistant initWithView:]([UITextInteractionAssistant alloc], "initWithView:", self);
  m_interactionAssistant = self->m_interactionAssistant;
  self->m_interactionAssistant = v11;

  if (v41)
  {
    objc_storeStrong((id *)&self->m_webView, a3);
    -[UIWebDocumentView setWebDraggingDelegate:](self->m_webView, "setWebDraggingDelegate:", self);
  }
  else
  {
    -[UIView frame](self, "frame");
    v14 = v13;
    v16 = v15;
    v17 = [UIWebDocumentView alloc];
    -[UITextContentView styleString](self, "styleString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIWebDocumentView standardTextViewPreferences](UIWebDocumentView, "standardTextViewPreferences");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[UIWebDocumentView initSimpleHTMLDocumentWithStyle:frame:preferences:groupName:](v17, "initSimpleHTMLDocumentWithStyle:frame:preferences:groupName:", v18, v19, 0, 0.0, 0.0, v14, v16);
    m_webView = self->m_webView;
    self->m_webView = v20;

    -[UIWebDocumentView setWebDraggingDelegate:](self->m_webView, "setWebDraggingDelegate:", self);
    -[UIView setEnabled:](self->m_webView, "setEnabled:", 0);
    -[UIWebDocumentView setIgnoresFocusingMouse:](self->m_webView, "setIgnoresFocusingMouse:", 1);
    -[UIWebDocumentView setLoadsSynchronously:](self->m_webView, "setLoadsSynchronously:", 1);
    -[UIWebDocumentView webView](self->m_webView, "webView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_setFixedLayoutSize:", v14, 1.0);
    objc_msgSend(v22, "setPolicyDelegate:", self);
    objc_msgSend(v22, "setEditingDelegate:", self);
    objc_msgSend((id)objc_opt_class(), "description");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setCustomUserAgent:", v23);

  }
  -[UIWebDocumentView webView](self->m_webView, "webView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "mainFrame");
  v25 = (WebFrame *)objc_claimAutoreleasedReturnValue();
  m_frame = self->m_frame;
  self->m_frame = v25;

  -[WebFrame DOMDocument](self->m_frame, "DOMDocument");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v27, "body");
    v28 = (DOMHTMLElement *)objc_claimAutoreleasedReturnValue();
    m_body = self->m_body;
    self->m_body = v28;

  }
  -[WebFrame frameView](self->m_frame, "frameView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = *MEMORY[0x1E0DD97B0];
  objc_msgSend(v30, "documentView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addObserver:selector:name:object:", self, sel_webViewDidChange_, v32, v33);

  v34 = *MEMORY[0x1E0DD9898];
  -[UIWebDocumentView webView](self->m_webView, "webView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addObserver:selector:name:object:", self, sel_webViewDidChange_, v34, v35);

  objc_msgSend(v31, "addObserver:selector:name:object:", self, sel_keyboardDidShow_, CFSTR("UIKeyboardDidShowNotification"), 0);
  objc_msgSend(v30, "setAllowsScrolling:", 0);
  -[DOMHTMLElement setAttribute:value:](self->m_body, "setAttribute:value:", CFSTR("dir"), CFSTR("auto"));
  -[UITextContentView setSelectionChangeCallbacksDisabled:](self, "setSelectionChangeCallbacksDisabled:", 1);
  -[UITextContentView setScrollsSelectionOnWebDocumentChanges:](self, "setScrollsSelectionOnWebDocumentChanges:", 1);
  -[UIWebDocumentView _setParentTextView:](self->m_webView, "_setParentTextView:", self);
  -[UIWebDocumentView setOpaque:](self->m_webView, "setOpaque:", 0);
  -[UIWebDocumentView setDrawsBackground:](self->m_webView, "setDrawsBackground:", 0);
  -[UIView addSubview:](self, "addSubview:", self->m_webView);
  if (!a4)
  {
    +[UIColor whiteColor](UIColor, "whiteColor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self, "setBackgroundColor:", v36);

  }
  -[UITextContentView updateContentEditableAttribute:](self, "updateContentEditableAttribute:", 1);
  -[UITextContentView setDataDetectorTypes:](self, "setDataDetectorTypes:", 0);
  v37 = -[UIDragInteraction initWithDelegate:]([UIDragInteraction alloc], "initWithDelegate:", self);
  m_dragInteraction = self->m_dragInteraction;
  self->m_dragInteraction = v37;

  -[UIView addInteraction:](self, "addInteraction:", self->m_dragInteraction);
  v39 = -[UIDropInteraction initWithDelegate:]([UIDropInteraction alloc], "initWithDelegate:", self);
  m_dropInteraction = self->m_dropInteraction;
  self->m_dropInteraction = v39;

  -[UIView addInteraction:](self, "addInteraction:", self->m_dropInteraction);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  UITextInteractionAssistant *m_interactionAssistant;
  UIDragInteraction *m_dragInteraction;
  UIDropInteraction *m_dropInteraction;
  objc_super v11;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  WebThreadLock();
  -[UIWebDocumentView webView](self->m_webView, "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPolicyDelegate:", 0);
  objc_msgSend(v3, "setEditingDelegate:", 0);
  if (sDataDetectorsUIFrameworkLoaded == 1 && -[UITextContentView dataDetectorTypes](self, "dataDetectorTypes"))
  {
    objc_msgSend(DataDetectorsUIGetClass(CFSTR("DDDetectionController")), "sharedController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frameWillBeRemoved:", self->m_frame);

  }
  -[UITextContentView cancelDataDetectorsWithWebLock](self, "cancelDataDetectorsWithWebLock");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0DD9898];
  v12[0] = *MEMORY[0x1E0DD97B0];
  v12[1] = v6;
  v12[2] = CFSTR("UIKeyboardDidShowNotification");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v5, self, v7);

  m_interactionAssistant = self->m_interactionAssistant;
  self->m_interactionAssistant = 0;

  -[UIWebDocumentView _setParentTextView:](self->m_webView, "_setParentTextView:", 0);
  -[UIView removeInteraction:](self, "removeInteraction:", self->m_dragInteraction);
  m_dragInteraction = self->m_dragInteraction;
  self->m_dragInteraction = 0;

  -[UIView removeInteraction:](self, "removeInteraction:", self->m_dropInteraction);
  m_dropInteraction = self->m_dropInteraction;
  self->m_dropInteraction = 0;

  v11.receiver = self;
  v11.super_class = (Class)UITextContentView;
  -[UIView dealloc](&v11, sel_dealloc);
}

- (void)removeFromSuperview
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
  -[UITextContentView interactionAssistant](self, "interactionAssistant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "detach");

  v4.receiver = self;
  v4.super_class = (Class)UITextContentView;
  -[UIView removeFromSuperview](&v4, sel_removeFromSuperview);
}

- (void)keyboardDidShow:(id)a3
{
  void *v4;

  if (-[UITextContentView isFirstResponder](self, "isFirstResponder", a3))
  {
    -[UITextContentView interactionAssistant](self, "interactionAssistant");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsSelectionDisplayUpdate");

    -[UITextContentView scrollSelectionToVisible:](self, "scrollSelectionToVisible:", 1);
  }
}

- (id)styleString
{
  UIColor *m_textColor;
  void *v4;
  uint64_t m_marginTop;
  void *v6;
  void *v7;
  unint64_t m_textAlignment;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  double v14[3];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v13 = xmmword_186684640;
  *(_OWORD *)v14 = unk_186684650;
  m_textColor = self->m_textColor;
  if (m_textColor)
    -[UIColor getRed:green:blue:alpha:](m_textColor, "getRed:green:blue:alpha:", &v13, (char *)&v13 + 8, v14, &v14[1]);
  v4 = (void *)MEMORY[0x1E0CB37A0];
  m_marginTop = self->m_marginTop;
  -[UIFont markupDescription](self->m_font, "markupDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("margin-top: %dpx; %@; color: rgba(%d, %d, %d, %f); word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space;"),
    m_marginTop,
    v6,
    (int)(*(double *)&v13 * 255.0),
    (int)(*((double *)&v13 + 1) * 255.0),
    (int)(v14[0] * 255.0),
    *(_QWORD *)&v14[1]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->m_hasExplicitTextAlignment)
  {
    m_textAlignment = self->m_textAlignment;
    if (m_textAlignment != 4)
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      UITextAlignmentGetStylePropertyString(m_textAlignment);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("text-align: %@; "), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appendString:", v11);

    }
  }
  return v7;
}

- (void)recalculateStyle
{
  DOMHTMLElement *m_body;
  void *v4;

  WebThreadLock();
  m_body = self->m_body;
  -[UITextContentView styleString](self, "styleString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOMHTMLElement setAttribute:value:](m_body, "setAttribute:value:", CFSTR("style"), v4);

  -[WebFrame updateLayout](self->m_frame, "updateLayout");
}

- (void)didMoveToSuperview
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UITextContentView;
  -[UIView didMoveToSuperview](&v4, sel_didMoveToSuperview);
  -[UIView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WebFrame updateLayout](self->m_frame, "updateLayout");
    -[UITextContentView webViewDidChange:](self, "webViewDidChange:", 0);
  }
}

- (void)setSelectionChangeCallbacksDisabled:(BOOL)a3
{
  uint64_t v3;
  void *v5;
  UITextContentView *v6;

  LODWORD(v3) = a3;
  -[UIWebDocumentView webView](self->m_webView, "webView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "editingDelegate");
  v6 = (UITextContentView *)objc_claimAutoreleasedReturnValue();
  if (v6 == self)
    v3 = v3;
  else
    v3 = 0;

  -[WebFrame setSelectionChangeCallbacksDisabled:](self->m_frame, "setSelectionChangeCallbacksDisabled:", v3);
}

- (id)_keyboardResponder
{
  return self->m_webView;
}

- (BOOL)becomeFirstResponder
{
  BOOL v2;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v2 = 1;
  if (!self->m_reentrancyGuard)
  {
    self->m_reentrancyGuard = 1;
    self->m_becomingFirstResponder = 1;
    WeakRetained = objc_loadWeakRetained(&self->m_delegate);
    if (-[UITextContentView isFirstResponder](self, "isFirstResponder"))
    {
      if (-[UITextContentView isEditable](self, "isEditable") && !-[UITextContentView isEditing](self, "isEditing"))
      {
        -[UIResponder reloadInputViews](self, "reloadInputViews");
        -[UITextContentView setEditing:](self, "setEditing:", 1);
        -[UITextContentView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_performBecomeEditableTasks, 0, 0.0);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(WeakRetained, "textViewDidBeginEditing:", self);
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "postNotificationName:object:", CFSTR("UITextViewTextDidBeginEditingNotification"), self);

        v2 = 1;
      }
    }
    else
    {
      v11.receiver = self;
      v11.super_class = (Class)UITextContentView;
      if (-[UIView becomeFirstResponder](&v11, sel_becomeFirstResponder))
      {
        -[UIWebDocumentView makeWKFirstResponder](self->m_webView, "makeWKFirstResponder");
        if (-[UITextContentView isEditable](self, "isEditable"))
        {
          -[UITextContentView setEditing:](self, "setEditing:", 1);
          -[UITextContentView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_performBecomeEditableTasks, 0, 0.0);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(WeakRetained, "textViewDidBeginEditing:", self);
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "postNotificationName:object:", CFSTR("UITextViewTextDidBeginEditingNotification"), self);

          -[UITextContentView interactionAssistant](self, "interactionAssistant");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setCursorBlinkAnimationEnabled:", 1);
        }
        else
        {
          -[UITextContentView interactionAssistant](self, "interactionAssistant");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setGestureRecognizers");
        }

        -[UITextContentView interactionAssistant](self, "interactionAssistant");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v2 = 1;
        objc_msgSend(v8, "setSelectionDisplayVisible:", 1);

        -[UITextContentView interactionAssistant](self, "interactionAssistant");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "activateSelection");

        -[UITextContentView webViewDidChange:](self, "webViewDidChange:", 0);
      }
      else
      {
        v2 = 0;
      }
    }
    self->m_reentrancyGuard = 0;
    self->m_becomingFirstResponder = 0;

  }
  return v2;
}

- (BOOL)resignFirstResponder
{
  UITextContentView *v2;
  BOOL result;
  id WeakRetained;
  void *v5;
  void *v6;
  objc_super v7;

  v2 = objc_retainAutorelease(self);
  result = 1;
  if (!v2->m_reentrancyGuard)
  {
    v2->m_reentrancyGuard = 1;
    v7.receiver = v2;
    v7.super_class = (Class)UITextContentView;
    if (-[UIResponder resignFirstResponder](&v7, sel_resignFirstResponder))
    {
      -[UIWebDocumentView clearWKFirstResponder](v2->m_webView, "clearWKFirstResponder");
      -[UITextContentView setEditing:](v2, "setEditing:", 0);
      WeakRetained = objc_loadWeakRetained(&v2->m_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(WeakRetained, "textContentViewDidEndEditing:", v2);
      -[UITextContentView interactionAssistant](v2, "interactionAssistant");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "resignedFirstResponder");

      -[UITextContentView interactionAssistant](v2, "interactionAssistant");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setGestureRecognizers");

      v2->m_reentrancyGuard = 0;
      return 1;
    }
    else
    {
      result = 0;
      v2->m_reentrancyGuard = 0;
    }
  }
  return result;
}

- (BOOL)canBecomeFirstResponder
{
  id WeakRetained;
  char v4;

  if (!-[UITextContentView isEditable](self, "isEditable"))
    return 1;
  WeakRetained = objc_loadWeakRetained(&self->m_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(WeakRetained, "textContentViewShouldBeginEditing:", self);
  else
    v4 = 1;

  return v4;
}

- (BOOL)canResignFirstResponder
{
  id WeakRetained;
  char v4;

  if (!-[UITextContentView isEditing](self, "isEditing"))
    return 1;
  WeakRetained = objc_loadWeakRetained(&self->m_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(WeakRetained, "textContentViewShouldEndEditing:", self);
  else
    v4 = 1;

  return v4;
}

- (BOOL)isFirstResponder
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UITextContentView;
  return -[UIView isFirstResponder](&v4, sel_isFirstResponder)
      || -[UIView isFirstResponder](self->m_webView, "isFirstResponder");
}

- (void)ensureSelection
{
  void *v3;

  if (!-[UITextContentView isFirstResponder](self, "isFirstResponder"))
    -[UITextContentView becomeFirstResponder](self, "becomeFirstResponder");
  -[UIWebDocumentView selectedTextRange](self->m_webView, "selectedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[UITextContentView setSelectionToEnd](self, "setSelectionToEnd");
}

- (CGPoint)constrainedPoint:(CGPoint)a3
{
  double y;
  CGFloat x;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[UIView size](self, "size");
  v7 = v6 * 0.5;
  -[UITextContentView visibleTextRect](self, "visibleTextRect");
  if (y >= v8)
  {
    v10 = v8 + v9;
    v11 = y - (v8 + v9);
    if (v11 > 0.0)
      y = v10 + v11 / (v11 / v7 + 5.0);
  }
  else if (y - v8 < 0.0)
  {
    y = v8 + (y - v8) / (5.0 - (y - v8) / v7);
  }
  v12 = x;
  v13 = y;
  result.y = v13;
  result.x = v12;
  return result;
}

- (id)automaticallySelectedOverlay
{
  void *v3;
  void *v4;
  id v5;

  -[UIView _scroller](self, "_scroller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = self;
  v5 = v3;

  return v5;
}

- (void)setDragInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[UIDragInteraction setEnabled:](self->m_dragInteraction, "setEnabled:");
  -[UIWebDocumentView setDragInteractionEnabled:](self->m_webView, "setDragInteractionEnabled:", v3);
}

- (BOOL)dragInteractionEnabled
{
  int v3;

  v3 = -[UIDragInteraction isEnabled](self->m_dragInteraction, "isEnabled");
  if (v3)
    LOBYTE(v3) = -[UIWebDocumentView isDragInteractionEnabled](self->m_webView, "isDragInteractionEnabled");
  return v3;
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  return -[UIWebDocumentView dragInteraction:itemsForBeginningSession:](self->m_webView, "dragInteraction:itemsForBeginningSession:", a3, a4);
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  return -[UIWebDocumentView dragInteraction:previewForLiftingItem:session:](self->m_webView, "dragInteraction:previewForLiftingItem:session:", a3, a4, a5);
}

- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5
{
  -[UIWebDocumentView dragInteraction:willAnimateLiftWithAnimator:session:](self->m_webView, "dragInteraction:willAnimateLiftWithAnimator:session:", a3, a4, a5);
}

- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5
{
  return -[UIWebDocumentView dragInteraction:previewForCancellingItem:withDefault:](self->m_webView, "dragInteraction:previewForCancellingItem:withDefault:", a3, a4, a5);
}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  -[UIWebDocumentView dragInteraction:session:didEndWithOperation:](self->m_webView, "dragInteraction:session:didEndWithOperation:", a3, a4, a5);
}

- (int64_t)_dragInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  return -[UIWebDocumentView _dragInteraction:dataOwnerForSession:](self->m_webView, "_dragInteraction:dataOwnerForSession:", a3, a4);
}

- (int64_t)_dragInteraction:(id)a3 dataOwnerForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  return -[UIWebDocumentView _dragInteraction:dataOwnerForAddingToSession:withTouchAtPoint:](self->m_webView, "_dragInteraction:dataOwnerForAddingToSession:withTouchAtPoint:", a3, a4, a5.x, a5.y);
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  -[UIWebDocumentView dropInteraction:sessionDidEnter:](self->m_webView, "dropInteraction:sessionDidEnter:", a3, a4);
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  return -[UIWebDocumentView dropInteraction:sessionDidUpdate:](self->m_webView, "dropInteraction:sessionDidUpdate:", a3, a4);
}

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
  -[UIWebDocumentView dropInteraction:sessionDidExit:](self->m_webView, "dropInteraction:sessionDidExit:", a3, a4);
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  -[UIWebDocumentView dropInteraction:performDrop:](self->m_webView, "dropInteraction:performDrop:", a3, a4);
}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
  -[UIWebDocumentView dropInteraction:sessionDidEnd:](self->m_webView, "dropInteraction:sessionDidEnd:", a3, a4);
}

- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5
{
  return -[UIWebDocumentView dropInteraction:previewForDroppingItem:withDefault:](self->m_webView, "dropInteraction:previewForDroppingItem:withDefault:", a3, a4, a5);
}

- (void)dropInteraction:(id)a3 item:(id)a4 willAnimateDropWithAnimator:(id)a5
{
  -[UIWebDocumentView dropInteraction:item:willAnimateDropWithAnimator:](self->m_webView, "dropInteraction:item:willAnimateDropWithAnimator:", a3, a4, a5);
}

- (void)dropInteraction:(id)a3 concludeDrop:(id)a4
{
  void *v6;
  void *v7;
  int v8;
  id v9;

  v9 = a4;
  -[UIWebDocumentView dropInteraction:concludeDrop:](self->m_webView, "dropInteraction:concludeDrop:", a3);
  if (!-[UITextContentView isFirstResponder](self, "isFirstResponder"))
  {
    -[UIWebDocumentView webDraggingDelegate](self->m_webView, "webDraggingDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[UIWebDocumentView webDraggingDelegate](self->m_webView, "webDraggingDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "_webView:allowsSelectingContentAfterDropForSession:", self->m_webView, v9);

      if (!v8)
        goto LABEL_7;
    }
    else
    {

    }
    -[UITextContentView becomeFirstResponder](self, "becomeFirstResponder");
  }
LABEL_7:

}

- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  return -[UIWebDocumentView _dropInteraction:dataOwnerForSession:](self->m_webView, "_dropInteraction:dataOwnerForSession:", a3, a4);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  UIWebDocumentView *v5;
  UITextContentView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UITextContentView;
  -[UIView hitTest:withEvent:](&v8, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (UIWebDocumentView *)objc_claimAutoreleasedReturnValue();
  if (v5 == self->m_webView)
  {
    v6 = self;

    v5 = (UIWebDocumentView *)v6;
  }
  return v5;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UITextContentView;
  -[UIResponder touchesEnded:withEvent:](&v4, sel_touchesEnded_withEvent_, a3, a4);
}

- (void)beginSelectionChange
{
  -[UIWebDocumentView beginSelectionChange](self->m_webView, "beginSelectionChange");
}

- (void)updateSelection
{
  id v2;

  -[UITextContentView interactionAssistant](self, "interactionAssistant");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsSelectionDisplayUpdate");

}

- (void)endSelectionChange
{
  -[UIWebDocumentView endSelectionChange](self->m_webView, "endSelectionChange");
}

- (BOOL)hasSelection
{
  return -[UIWebDocumentView hasSelection](self->m_webView, "hasSelection");
}

- (void)startAutoscroll:(CGPoint)a3
{
  -[UIWebDocumentView startAutoscroll:](self->m_webView, "startAutoscroll:", a3.x, a3.y);
}

- (void)cancelAutoscroll
{
  -[UIWebDocumentView cancelAutoscroll](self->m_webView, "cancelAutoscroll");
}

- (id)interactionAssistant
{
  return self->m_interactionAssistant;
}

- (BOOL)_restoreFirstResponder
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  BOOL v6;
  objc_super v8;

  -[UITextContentView interactionAssistant](self, "interactionAssistant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "checkEditabilityAndSetFirstResponderIfNecessary");
    v5 = -[UITextContentView isFirstResponder](self, "isFirstResponder");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UITextContentView;
    v5 = -[UIResponder _restoreFirstResponder](&v8, sel__restoreFirstResponder);
  }
  v6 = v5;

  return v6;
}

- (CGRect)_selectionClipRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[UIWebDocumentView _selectionClipRect](self->m_webView, "_selectionClipRect");
  -[UIView convertRect:fromView:](self, "convertRect:fromView:", self->m_webView);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)caretRectForVisiblePosition:(id)a3
{
  UIWebDocumentView *m_webView;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  m_webView = self->m_webView;
  -[UIWebDocumentView caretRectForVisiblePosition:](m_webView, "caretRectForVisiblePosition:", a3);
  -[UIView convertRect:toView:](m_webView, "convertRect:toView:", self);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (id)selectionRectsForRange:(id)a3
{
  UIWebDocumentView *m_webView;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  m_webView = self->m_webView;
  objc_msgSend(a3, "_isImpl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "domRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWebDocumentView selectionRectsForDOMRange:](m_webView, "selectionRectsForDOMRange:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v17 = v7;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v13), "copy");
          objc_msgSend(v14, "rect");
          -[UIView convertRect:fromView:](self, "convertRect:fromView:", self->m_webView);
          objc_msgSend(v14, "setRect:");
          +[UITextSelectionRectImpl rectWithWebRect:](UITextSelectionRectImpl, "rectWithWebRect:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v15);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

    v7 = v17;
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v8;
}

- (id)selectedText
{
  UIWebDocumentView *m_webView;
  void *v3;
  void *v4;

  m_webView = self->m_webView;
  -[UIWebDocumentView selectedTextRange](m_webView, "selectedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWebDocumentView textInRange:](m_webView, "textInRange:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CGRect)closestCaretRectInMarkedTextRangeForPoint:(CGPoint)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[UIView convertPoint:toView:](self, "convertPoint:toView:", self->m_webView, a3.x, a3.y);
  -[UIWebDocumentView closestCaretRectInMarkedTextRangeForPoint:](self->m_webView, "closestCaretRectInMarkedTextRangeForPoint:");
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (unint64_t)offsetInMarkedTextForSelection:(id)a3
{
  return -[UIWebDocumentView offsetInMarkedTextForSelection:](self->m_webView, "offsetInMarkedTextForSelection:", a3);
}

- (BOOL)hasMarkedText
{
  void *v2;
  BOOL v3;

  -[UIWebDocumentView markedTextRange](self->m_webView, "markedTextRange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (_NSRange)selectionRange
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = -[UIWebDocumentView selectionRange](self->m_webView, "selectionRange");
  result.length = v3;
  result.location = v2;
  return result;
}

- (id)fontForCaretSelection
{
  return -[UIWebDocumentView fontForCaretSelection](self->m_webView, "fontForCaretSelection");
}

- (void)_hideSelectionCommands
{
  id v2;

  -[UITextContentView interactionAssistant](self, "interactionAssistant");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hideSelectionCommands");

}

- (id)undoManager
{
  UIWebDocumentView *m_webView;
  void *v3;
  void *v4;

  m_webView = self->m_webView;
  -[UIWebDocumentView webView](m_webView, "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWebDocumentView undoManagerForWebView:](m_webView, "undoManagerForWebView:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)makeTextWritingDirectionNatural:(id)a3
{
  -[UIWebDocumentView makeTextWritingDirectionNatural:](self->m_webView, "makeTextWritingDirectionNatural:", a3);
}

- (void)makeTextWritingDirectionRightToLeft:(id)a3
{
  -[UIWebDocumentView makeTextWritingDirectionRightToLeft:](self->m_webView, "makeTextWritingDirectionRightToLeft:", a3);
}

- (void)makeTextWritingDirectionLeftToRight:(id)a3
{
  -[UIWebDocumentView makeTextWritingDirectionLeftToRight:](self->m_webView, "makeTextWritingDirectionLeftToRight:", a3);
}

- (void)cut:(id)a3
{
  id v4;
  int64_t v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = -[UIResponder _dataOwnerForCopy](self, "_dataOwnerForCopy");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __25__UITextContentView_cut___block_invoke;
  v7[3] = &unk_1E16B1B50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  +[UIPasteboard _performAsDataOwner:block:](UIPasteboard, "_performAsDataOwner:block:", v5, v7);

}

uint64_t __25__UITextContentView_cut___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "cut:", *(_QWORD *)(a1 + 40));
}

- (void)copy:(id)a3
{
  id v4;
  int64_t v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = -[UIResponder _dataOwnerForCopy](self, "_dataOwnerForCopy");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __26__UITextContentView_copy___block_invoke;
  v7[3] = &unk_1E16B1B50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  +[UIPasteboard _performAsDataOwner:block:](UIPasteboard, "_performAsDataOwner:block:", v5, v7);

}

uint64_t __26__UITextContentView_copy___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "copy:", *(_QWORD *)(a1 + 40));
}

- (void)paste:(id)a3
{
  id v4;
  int64_t v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = -[UIResponder _dataOwnerForPaste](self, "_dataOwnerForPaste");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __27__UITextContentView_paste___block_invoke;
  v7[3] = &unk_1E16B1B50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  +[UIPasteboard _performAsDataOwner:block:](UIPasteboard, "_performAsDataOwner:block:", v5, v7);

}

uint64_t __27__UITextContentView_paste___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "paste:", *(_QWORD *)(a1 + 40));
}

- (void)pasteAndMatchStyle:(id)a3
{
  id v4;
  int64_t v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = -[UIResponder _dataOwnerForPaste](self, "_dataOwnerForPaste");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__UITextContentView_pasteAndMatchStyle___block_invoke;
  v7[3] = &unk_1E16B1B50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  +[UIPasteboard _performAsDataOwner:block:](UIPasteboard, "_performAsDataOwner:block:", v5, v7);

}

uint64_t __40__UITextContentView_pasteAndMatchStyle___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "pasteAndMatchStyle:", *(_QWORD *)(a1 + 40));
}

- (void)select:(id)a3
{
  id v3;

  -[UITextContentView interactionAssistant](self, "interactionAssistant", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectWord");

}

- (void)selectAll:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UITextContentView interactionAssistant](self, "interactionAssistant");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectAll:", v4);

}

- (void)increaseSize:(id)a3
{
  -[UIWebDocumentView increaseSize:](self->m_webView, "increaseSize:", self);
}

- (void)decreaseSize:(id)a3
{
  -[UIWebDocumentView decreaseSize:](self->m_webView, "decreaseSize:", self);
}

- (void)replace:(id)a3
{
  -[UIWebDocumentView replace:](self->m_webView, "replace:", a3);
}

- (void)_promptForReplace:(id)a3
{
  id v3;

  -[UITextContentView interactionAssistant](self, "interactionAssistant", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scheduleReplacements");

}

- (void)_transliterateChinese:(id)a3
{
  id v3;

  -[UITextContentView interactionAssistant](self, "interactionAssistant", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scheduleChineseTransliteration");

}

- (void)_define:(id)a3
{
  -[UIWebDocumentView _define:](self->m_webView, "_define:", a3);
}

- (void)_translate:(id)a3
{
  -[UIWebDocumentView _translate:](self->m_webView, "_translate:", a3);
}

- (void)_share:(id)a3
{
  -[UIWebDocumentView _share:](self->m_webView, "_share:", a3);
}

- (void)_insertAttributedTextWithoutClosingTyping:(id)a3
{
  -[UIWebDocumentView _insertAttributedTextWithoutClosingTyping:](self->m_webView, "_insertAttributedTextWithoutClosingTyping:", a3);
}

- (void)_addShortcut:(id)a3
{
  -[UIWebDocumentView _addShortcut:](self->m_webView, "_addShortcut:", a3);
}

- (id)textStylingAtPosition:(id)a3 inDirection:(int64_t)a4
{
  return -[UIWebDocumentView textStylingAtPosition:inDirection:](self->m_webView, "textStylingAtPosition:inDirection:", a3, a4);
}

- (void)toggleBoldface:(id)a3
{
  -[UIWebDocumentView toggleBoldface:](self->m_webView, "toggleBoldface:", a3);
}

- (void)toggleItalics:(id)a3
{
  -[UIWebDocumentView toggleItalics:](self->m_webView, "toggleItalics:", a3);
}

- (void)toggleUnderline:(id)a3
{
  -[UIWebDocumentView toggleUnderline:](self->m_webView, "toggleUnderline:", a3);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (sel_replace_ != a3)
    return -[UIWebDocumentView canPerformAction:withSender:](self->m_webView, "canPerformAction:withSender:");
  if (-[UITextContentView isEditing](self, "isEditing")
    && (-[UITextContentView isSecureTextEntry](self, "isSecureTextEntry") & 1) == 0)
  {
    return -[UITextContentView hasText](self, "hasText");
  }
  return 0;
}

- (void)selectAll
{
  -[UIWebDocumentView selectAll](self->m_webView, "selectAll");
}

- (id)supportedPasteboardTypesForCurrentSelection
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  uint64_t *v14;

  if (!_MergedGlobals_9_5)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = (void *)_MergedGlobals_9_5;
    _MergedGlobals_9_5 = (uint64_t)v3;

    v5 = (void *)_MergedGlobals_9_5;
    objc_msgSend((id)*MEMORY[0x1E0CEC618], "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

    objc_msgSend((id)_MergedGlobals_9_5, "addObjectsFromArray:", UIPasteboardTypeListString);
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8 = (void *)qword_1ECD7AD90;
    qword_1ECD7AD90 = (uint64_t)v7;

    objc_msgSend((id)qword_1ECD7AD90, "addObject:", *MEMORY[0x1E0DD97D8]);
    v9 = (void *)qword_1ECD7AD90;
    objc_msgSend((id)*MEMORY[0x1E0CEC5C0], "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

    v11 = (void *)qword_1ECD7AD90;
    objc_msgSend((id)*MEMORY[0x1E0CEC4E8], "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v12);

    objc_msgSend((id)qword_1ECD7AD90, "addObjectsFromArray:", UIPasteboardTypeListImage);
    objc_msgSend((id)qword_1ECD7AD90, "addObjectsFromArray:", _MergedGlobals_9_5);
  }
  v13 = -[UITextContentView allowsEditingTextAttributes](self, "allowsEditingTextAttributes");
  v14 = &qword_1ECD7AD90;
  if (!v13)
    v14 = &_MergedGlobals_9_5;
  return (id)*v14;
}

- (id)documentFragmentForPasteboardItemAtIndex:(int64_t)a3
{
  id WeakRetained;
  void *v6;

  WeakRetained = objc_loadWeakRetained(&self->m_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "documentFragmentForPasteboardItemAtIndex:inTextContentView:", a3, self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)scrollRectToVisible:(CGRect)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  double m_bottomBufferHeight;
  id v15;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView _scroller](self, "_scroller");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[UITextContentView selectionInset](self, "selectionInset");
    if (self->m_bottomBufferHeight >= v12)
      m_bottomBufferHeight = v12;
    else
      m_bottomBufferHeight = self->m_bottomBufferHeight;
    -[UIView convertRect:toView:](self, "convertRect:toView:", v15, x + v11, y + v10, width - (v11 + v13), height - (v10 + m_bottomBufferHeight));
    objc_msgSend(v15, "scrollRectToVisible:animated:", v4);
  }

}

- (void)webViewDidChange:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id WeakRetained;
  int v13;
  int v14;
  void *v15;
  char v16;
  double v17;
  double v18;
  id v19;

  WebThreadLock();
  -[WebFrame frameView](self->m_frame, "frameView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "documentView");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "frame");
  v6 = v5;
  v8 = v7;
  -[UIView size](self, "size");
  if (v8 > v9)
    -[WebFrame setNeedsLayout](self->m_frame, "setNeedsLayout");
  -[UIView frame](self, "frame");
  if (v6 < v10)
  {
    -[UIView frame](self, "frame");
    v6 = v11;
  }
  WeakRetained = objc_loadWeakRetained(&self->m_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v13 = objc_msgSend(WeakRetained, "textContentView:shouldScrollForPendingContentSize:", self, v6, v8) ^ 1;
  else
    LOBYTE(v13) = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v14 = objc_msgSend(WeakRetained, "textContentView:shouldChangeSizeForContentSize:", self, v6, v8);
    -[UIView setSize:](self->m_webView, "setSize:", v6, v8);
    if (v14)
    {
      -[UIView frame](self, "frame");
      -[UITextContentView setFrame:](self, "setFrame:");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(WeakRetained, "textContentView:didChangeSize:", self, v6, v8);
    }
  }
  else
  {
    -[UIView setSize:](self->m_webView, "setSize:", v6, v8);
  }
  -[UIView _scroller](self, "_scroller");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    v16 = v13;
  else
    v16 = 1;
  if ((v16 & 1) == 0
    && -[UITextContentView scrollsSelectionOnWebDocumentChanges](self, "scrollsSelectionOnWebDocumentChanges"))
  {
    objc_msgSend(v15, "_contentOffsetAnimationDuration");
    v18 = v17;
    objc_msgSend(v15, "_setContentOffsetAnimationDuration:", 0.1);
    -[UITextContentView scrollSelectionToVisible:](self, "scrollSelectionToVisible:", 1);
    objc_msgSend(v15, "_setContentOffsetAnimationDuration:", v18);
  }

}

- (void)performBecomeEditableTasks
{
  void *v3;
  void *v4;
  id v5;

  -[UIView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UITextContentView ensureSelection](self, "ensureSelection");
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setInitialDirection");

    -[UITextContentView interactionAssistant](self, "interactionAssistant");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setGestureRecognizers");

  }
}

- (void)_sizeChanged
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  id v9;

  WebThreadLock();
  -[UIView frame](self->m_webView, "frame");
  v3 = *MEMORY[0x1E0C9D538];
  v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[UIView bounds](self, "bounds");
  v6 = v5;
  -[UIWebDocumentView setFrame:](self->m_webView, "setFrame:", v3, v4);
  -[UIWebDocumentView webView](self->m_webView, "webView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setFixedLayoutSize:", v6, 1.0);

  -[UITextContentView interactionAssistant](self, "interactionAssistant");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNeedsSelectionDisplayUpdate");

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textFrameChanged:", self);

}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)UITextContentView;
  -[UIView setFrame:](&v13, sel_setFrame_, x, y, width, height);
  if (v9 != width || v11 != height)
    -[UITextContentView _sizeChanged](self, "_sizeChanged");
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)UITextContentView;
  -[UIView setBounds:](&v13, sel_setBounds_, x, y, width, height);
  if (v9 != width || v11 != height)
    -[UITextContentView _sizeChanged](self, "_sizeChanged");
}

- (void)setSelectionWithPoint:(CGPoint)a3
{
  UIWebDocumentView *m_webView;

  m_webView = self->m_webView;
  -[UITextContentView constrainedPoint:](self, "constrainedPoint:", a3.x, a3.y);
  -[UIWebDocumentView setSelectionWithPoint:](m_webView, "setSelectionWithPoint:");
}

- (void)setSelectionToStart
{
  UIWebDocumentView *m_webView;
  void *v4;
  void *v5;
  void *v6;

  -[UITextContentView beginSelectionChange](self, "beginSelectionChange");
  WebThreadLock();
  m_webView = self->m_webView;
  -[UIWebDocumentView beginningOfDocument](m_webView, "beginningOfDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWebDocumentView beginningOfDocument](self->m_webView, "beginningOfDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWebDocumentView textRangeFromPosition:toPosition:](m_webView, "textRangeFromPosition:toPosition:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWebDocumentView setSelectedTextRange:](self->m_webView, "setSelectedTextRange:", v6);

  -[UITextContentView scrollSelectionToVisible:](self, "scrollSelectionToVisible:", 1);
  -[UITextContentView endSelectionChange](self, "endSelectionChange");
}

- (void)setSelectionToEnd
{
  UIWebDocumentView *m_webView;
  void *v4;
  void *v5;
  void *v6;

  -[UITextContentView beginSelectionChange](self, "beginSelectionChange");
  m_webView = self->m_webView;
  -[UIWebDocumentView endOfDocument](m_webView, "endOfDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWebDocumentView endOfDocument](self->m_webView, "endOfDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWebDocumentView textRangeFromPosition:toPosition:](m_webView, "textRangeFromPosition:toPosition:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWebDocumentView setSelectedTextRange:](self->m_webView, "setSelectedTextRange:", v6);

  -[UITextContentView scrollSelectionToVisible:](self, "scrollSelectionToVisible:", 1);
  -[UITextContentView endSelectionChange](self, "endSelectionChange");
}

- (CGRect)rectForSelection:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  WebFrame *m_frame;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  length = a3.length;
  location = a3.location;
  WebThreadLock();
  -[WebFrame convertNSRangeToDOMRange:](self->m_frame, "convertNSRangeToDOMRange:", location, length);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  m_frame = self->m_frame;
  objc_msgSend(v6, "startContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WebFrame caretRectAtNode:offset:affinity:](m_frame, "caretRectAtNode:offset:affinity:", v8, objc_msgSend(v6, "startOffset"), 1);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)performScrollSelectionToVisible:(BOOL)a3
{
  _BOOL8 v3;
  CGRect v5;
  CGRect v6;

  v3 = a3;
  if (-[UIWebDocumentView hasSelection](self->m_webView, "hasSelection"))
  {
    if (-[UITextContentView isFirstResponder](self, "isFirstResponder"))
    {
      -[WebFrame rectForScrollToVisible](self->m_frame, "rectForScrollToVisible");
      v6 = CGRectInset(v5, -5.0, -5.0);
      -[UIView convertRect:fromView:](self, "convertRect:fromView:", self->m_webView, v6.origin.x, v6.origin.y, v6.size.width, v6.size.height);
      -[UITextContentView scrollRectToVisible:animated:](self, "scrollRectToVisible:animated:", v3);
    }
  }
}

- (CGRect)rectForScrollToVisible
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  if (-[UIWebDocumentView hasSelection](self->m_webView, "hasSelection"))
  {
    -[WebFrame rectForScrollToVisible](self->m_frame, "rectForScrollToVisible");
    -[UIView convertRect:fromView:](self, "convertRect:fromView:", self->m_webView);
  }
  else
  {
    v3 = *MEMORY[0x1E0C9D648];
    v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)setContentToHTMLString:(id)a3
{
  void *v4;
  const __CFString *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  __CFString *v10;

  v10 = (__CFString *)a3;
  WebThreadLock();
  -[UIWebDocumentView inputDelegate](self->m_webView, "inputDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UITextContentView isEditing](self, "isEditing"))
    objc_msgSend(v4, "textWillChange:", self->m_webView);
  if (v10)
    v5 = v10;
  else
    v5 = &stru_1E16EDF20;
  -[DOMHTMLElement setInnerHTML:](self->m_body, "setInnerHTML:", v5);
  if (-[UITextContentView isEditing](self, "isEditing"))
    objc_msgSend(v4, "textDidChange:", self->m_webView);
  -[WebFrame updateLayout](self->m_frame, "updateLayout");
  -[UITextContentView webViewDidChange:](self, "webViewDidChange:", 0);
  if (-[UITextContentView shouldStartDataDetectors](self, "shouldStartDataDetectors"))
    -[UITextContentView startDataDetectorsWithWebLock](self, "startDataDetectorsWithWebLock");
  -[UIWebDocumentView undoManager](self->m_webView, "undoManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isUndoRegistrationEnabled");

  -[UIWebDocumentView undoManager](self->m_webView, "undoManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllActions");

  if ((v7 & 1) == 0)
  {
    -[UIWebDocumentView undoManager](self->m_webView, "undoManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "disableUndoRegistration");

  }
}

- (id)contentAsHTMLString
{
  WebThreadLock();
  return (id)-[DOMHTMLElement innerHTML](self->m_body, "innerHTML");
}

- (void)setContentToAttributedString:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = (id)objc_msgSend(objc_alloc((Class)sel_hasRichlyEditableSelection), "initWithAttributedString:", v4);

  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v8, "HTMLData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithData:encoding:", v6, 4);

  -[UITextContentView setContentToHTMLString:](self, "setContentToHTMLString:", v7);
}

- (id)contentAsAttributedString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  WebThreadLock();
  -[UIWebDocumentView _focusedOrMainFrame](self->m_webView, "_focusedOrMainFrame");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "DOMDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "selectNodeContents:", self->m_body);
  v6 = (void *)objc_msgSend(objc_alloc((Class)&sel_sendScrollEventIfNecessary[16]), "initWithDOMRange:", v5);
  objc_msgSend(v6, "attributedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)textInputTraits
{
  return -[UIWebDocumentView textInputTraits](self->m_webView, "textInputTraits");
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[UITextContentView textInputTraits](self, "textInputTraits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selector");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "invokeWithTarget:", v5);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UITextContentView;
    -[UITextContentView forwardInvocation:](&v6, sel_forwardInvocation_, v4);
  }

}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v4;

  objc_msgSend((id)objc_opt_class(), "instanceMethodSignatureForSelector:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend((id)objc_opt_class(), "instanceMethodSignatureForSelector:", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setAllowsEditingTextAttributes:(BOOL)a3
{
  self->m_allowsEditingTextAttributes = a3;
  if (a3)
    self->m_usesAttributedText = 1;
}

- (BOOL)allowsEditingTextAttributes
{
  return self->m_allowsEditingTextAttributes;
}

- (NSAttributedString)attributedText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  if (self->m_usesAttributedText)
  {
    WebThreadLock();
    -[UIWebDocumentView _focusedOrMainFrame](self->m_webView, "_focusedOrMainFrame");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "DOMDocument");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "createRange");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "selectNodeContents:", self->m_body);
    v6 = (void *)objc_msgSend(objc_alloc((Class)&sel_sendScrollEventIfNecessary[16]), "initWithDOMRange:", v5);
    objc_msgSend(v6, "attributedString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

  }
  else
  {
    v9 = objc_alloc(MEMORY[0x1E0CB3778]);
    -[UITextContentView text](self, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v9, "initWithString:", v5);
  }

  objc_msgSend(v8, "mutableString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextContentView textInputTraits](self, "textInputTraits");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_removeCharactersFromSet:", objc_msgSend(v11, "textTrimmingSet"));

  objc_msgSend(v10, "_replaceOccurrencesOfCharacter:withCharacter:", 160, 32);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithAttributedString:", v8);

  return (NSAttributedString *)v12;
}

- (void)_removeAttribute:(id)a3 fromString:(id)a4 andSetPropertyWith:(id)a5 usingValueClass:(Class)a6
{
  id v8;
  void (**v9)(id, void *);
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *))a5;
  objc_msgSend(v8, "_UIKBStringWideAttributeValueForKey:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9[2](v9, v10);
    objc_msgSend(v8, "removeAttribute:range:", v11, 0, objc_msgSend(v8, "length"));
  }

}

- (void)_removeTextViewPropertiesFromText:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void *v12;
  UITextContentView *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void *v17;
  UITextContentView *v18;

  v4 = *(_QWORD *)off_1E1678D90;
  v5 = MEMORY[0x1E0C809B0];
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __55__UITextContentView__removeTextViewPropertiesFromText___block_invoke;
  v17 = &unk_1E16D7FB0;
  v18 = self;
  v6 = a3;
  -[UITextContentView _removeAttribute:fromString:andSetPropertyWith:usingValueClass:](self, "_removeAttribute:fromString:andSetPropertyWith:usingValueClass:", v4, v6, &v14, objc_opt_class());
  v7 = *(_QWORD *)off_1E1678D98;
  v9 = v5;
  v10 = 3221225472;
  v11 = __55__UITextContentView__removeTextViewPropertiesFromText___block_invoke_2;
  v12 = &unk_1E16D7FB0;
  v13 = self;
  -[UITextContentView _removeAttribute:fromString:andSetPropertyWith:usingValueClass:](self, "_removeAttribute:fromString:andSetPropertyWith:usingValueClass:", v7, v6, &v9, objc_opt_class());
  objc_msgSend(v6, "_UIKBStringWideAttributeValueForKey:", *(_QWORD *)off_1E1678F98, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[UITextContentView setTextAlignment:](self, "setTextAlignment:", objc_msgSend(v8, "alignment"));

}

uint64_t __55__UITextContentView__removeTextViewPropertiesFromText___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFont:", a2);
}

uint64_t __55__UITextContentView__removeTextViewPropertiesFromText___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTextColor:", a2);
}

+ (id)excludedElementsForHTML
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)excludedElementsForHTML_exclusions;
  if (!excludedElementsForHTML_exclusions)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("STYLE"), CFSTR("HTML"), CFSTR("APPLET"), CFSTR("OBJECT"), CFSTR("BASEFONT"), CFSTR("CENTER"), CFSTR("DIR"), CFSTR("FONT"), CFSTR("ISINDEX"), CFSTR("MENU"), CFSTR("S"), CFSTR("XML"), CFSTR("BODY"), CFSTR("HEAD"), CFSTR("META"), 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)excludedElementsForHTML_exclusions;
    excludedElementsForHTML_exclusions = v3;

    v2 = (void *)excludedElementsForHTML_exclusions;
  }
  return v2;
}

- (void)setAttributedText:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  self->m_usesAttributedText = 1;
  v16 = (id)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v16, "mutableString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextContentView _removeTextViewPropertiesFromText:](self, "_removeTextViewPropertiesFromText:", v16);
  -[UITextContentView textInputTraits](self, "textInputTraits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_removeCharactersFromSet:", objc_msgSend(v5, "textTrimmingSet"));

  objc_msgSend(v4, "_removeOccurrencesOfCharacter:", 65532);
  v6 = (void *)objc_msgSend(objc_alloc((Class)sel_hasRichlyEditableSelection), "initWithAttributedString:", v16);
  objc_msgSend((id)objc_opt_class(), "excludedElementsForHTML");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v7, *(_QWORD *)off_1E1678D28);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDocumentAttributes:", v8);

  v9 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v6, "HTMLData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithData:encoding:", v10, 4);

  if (objc_msgSend(v11, "length"))
  {
    v12 = objc_msgSend(v11, "length") - 1;
    if (objc_msgSend(v11, "characterAtIndex:", v12) == 10)
    {
      objc_msgSend(v11, "substringToIndex:", v12);
      v13 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v13;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("font-family: 'Helvetica Neue'; font-weight: normal; font-style: normal; font-size: 12px"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", v14, &stru_1E16EDF20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITextContentView setContentToHTMLString:](self, "setContentToHTMLString:", v15);
}

- (UIFont)font
{
  return self->m_font;
}

- (void)setFont:(id)a3
{
  UIFont *v5;
  UIFont *v6;

  v5 = (UIFont *)a3;
  if (self->m_font != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->m_font, a3);
    -[UITextContentView recalculateStyle](self, "recalculateStyle");
    -[UITextContentView webViewDidChange:](self, "webViewDidChange:", 0);
    v5 = v6;
  }

}

- (UIColor)textColor
{
  return self->m_textColor;
}

- (void)setTextColor:(id)a3
{
  UIColor *v4;
  UIColor *obj;

  v4 = (UIColor *)a3;
  if (self->m_textColor != v4)
  {
    if (!v4)
    {
      +[UIColor blackColor](UIColor, "blackColor");
      v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
    }
    obj = v4;
    objc_storeStrong((id *)&self->m_textColor, v4);
    -[UITextContentView recalculateStyle](self, "recalculateStyle");
    v4 = obj;
  }

}

- (BOOL)hasText
{
  return -[UIWebDocumentView hasContent](self->m_webView, "hasContent");
}

- (NSString)text
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;

  WebThreadLock();
  -[WebFrame DOMDocument](self->m_frame, "DOMDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v3, "body"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "innerText"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v5))
  {
    if (objc_msgSend(v5, "hasSuffix:", CFSTR("\n")))
    {
      -[DOMHTMLElement lastChild](self->m_body, "lastChild");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "tagName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v7, "caseInsensitiveCompare:", CFSTR("div")))
      {
        objc_msgSend(v6, "firstChild");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "tagName");
        v9 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v9;
      }
      if (!objc_msgSend(v7, "caseInsensitiveCompare:", CFSTR("br")))
      {
        objc_msgSend(v5, "_stringByTrimmingLastCharacter");
        v10 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v10;
      }

    }
    if (!text_nbspString)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "_stringWithUnichar:", 160);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)text_nbspString;
      text_nbspString = v11;

    }
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", v5);
    objc_msgSend(v13, "replaceOccurrencesOfString:withString:options:range:", text_nbspString, CFSTR(" "), 2, 0, objc_msgSend(v13, "length"));
    -[UITextContentView textInputTraits](self, "textInputTraits");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "textTrimmingSet");

    if (v15)
    {
      objc_msgSend(v13, "_stringByTrimmingCharactersInCFCharacterSet:", v15);
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = v13;
    }
    v17 = v16;

  }
  else
  {
    v17 = 0;
  }

  return (NSString *)v17;
}

- (void)setText:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  WebThreadLock();
  if (-[UITextContentView dataDetectorTypes](self, "dataDetectorTypes"))
    -[UITextContentView cancelDataDetectorsWithWebLock](self, "cancelDataDetectorsWithWebLock");
  -[UIWebDocumentView inputDelegate](self->m_webView, "inputDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UITextContentView isEditing](self, "isEditing"))
    objc_msgSend(v4, "textWillChange:", self->m_webView);
  v5 = objc_msgSend(v13, "length");
  v6 = 0;
  if (v13 && v5)
  {
    -[UITextContentView textInputTraits](self, "textInputTraits");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "textTrimmingSet");

    if (v8)
    {
      objc_msgSend(v13, "_stringByTrimmingCharactersInCFCharacterSet:", v8);
      v6 = objc_claimAutoreleasedReturnValue();

      v13 = (id)v6;
    }
    else
    {
      v6 = (uint64_t)v13;
    }
  }
  -[WebFrame setText:asChildOfElement:](self->m_frame, "setText:asChildOfElement:", v6, self->m_body);
  if (-[UITextContentView isEditable](self, "isEditable"))
    objc_msgSend(v4, "textDidChange:", self->m_webView);
  -[WebFrame updateLayout](self->m_frame, "updateLayout");
  -[UITextContentView webViewDidChange:](self, "webViewDidChange:", 0);
  if (-[UITextContentView shouldStartDataDetectors](self, "shouldStartDataDetectors"))
    -[UITextContentView startDataDetectorsWithWebLock](self, "startDataDetectorsWithWebLock");
  -[UIWebDocumentView undoManager](self->m_webView, "undoManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isUndoRegistrationEnabled");

  -[UIWebDocumentView undoManager](self->m_webView, "undoManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeAllActions");

  if ((v10 & 1) == 0)
  {
    -[UIWebDocumentView undoManager](self->m_webView, "undoManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "disableUndoRegistration");

  }
}

- (int64_t)textAlignment
{
  return self->m_textAlignment;
}

- (void)setTextAlignment:(int64_t)a3
{
  self->m_hasExplicitTextAlignment = 1;
  self->m_textAlignment = a3;
  -[UITextContentView recalculateStyle](self, "recalculateStyle");
}

- (_NSRange)selectedRange
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  WebThreadLock();
  v3 = -[WebFrame _selectedNSRange](self->m_frame, "_selectedNSRange");
  result.length = v4;
  result.location = v3;
  return result;
}

- (void)setSelectedRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v6;
  id v7;

  length = a3.length;
  location = a3.location;
  -[UITextContentView beginSelectionChange](self, "beginSelectionChange");
  WebThreadLock();
  -[WebFrame convertNSRangeToDOMRange:](self->m_frame, "convertNSRangeToDOMRange:", location, length);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (id)v6;
  if (v6)
    -[WebFrame setSelectedDOMRange:affinity:closeTyping:](self->m_frame, "setSelectedDOMRange:affinity:closeTyping:", v6, 1, 1);
  else
    -[UITextContentView ensureSelection](self, "ensureSelection");
  -[UITextContentView scrollSelectionToVisible:](self, "scrollSelectionToVisible:", 1);
  -[UITextContentView endSelectionChange](self, "endSelectionChange");

}

- (BOOL)isEditable
{
  return self->m_editable;
}

- (void)setEditable:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  if (self->m_editable != a3)
  {
    v3 = a3;
    WebThreadLock();
    -[UITextContentView updateContentEditableAttribute:](self, "updateContentEditableAttribute:", v3);
    if (v3)
    {
      -[UIWebDocumentView makeWKFirstResponder](self->m_webView, "makeWKFirstResponder");
      -[UITextContentView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_performBecomeEditableTasks, 0, 0.0);
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "textChanged:", self);

    }
    else
    {
      -[UITextContentView resignFirstResponder](self, "resignFirstResponder");
    }
    -[WebFrame setIsActive:](self->m_frame, "setIsActive:", v3);
    -[UITextContentView setSelectionChangeCallbacksDisabled:](self, "setSelectionChangeCallbacksDisabled:", v3);
    self->m_editable = v3;
    -[UITextContentView interactionAssistant](self, "interactionAssistant");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setGestureRecognizers");

    if (-[UITextContentView isEditable](self, "isEditable")
      && -[UITextContentView dataDetectorTypes](self, "dataDetectorTypes"))
    {
      -[UIWebDocumentView setAllowsDataDetectorsSheet:](self->m_webView, "setAllowsDataDetectorsSheet:", 0);
      -[UITextContentView resetDataDetectorsResultsWithWebLock](self, "resetDataDetectorsResultsWithWebLock");
    }
    else if (-[UITextContentView shouldStartDataDetectors](self, "shouldStartDataDetectors"))
    {
      -[UIWebDocumentView setAllowsDataDetectorsSheet:](self->m_webView, "setAllowsDataDetectorsSheet:", 1);
      -[UITextContentView startDataDetectorsWithWebLock](self, "startDataDetectorsWithWebLock");
    }
  }
}

- (BOOL)isEditing
{
  return self->m_editing;
}

- (void)setEditing:(BOOL)a3
{
  if (self->m_editing != a3)
  {
    self->m_editing = a3;
    -[UIWebTiledView setEditingTilingModeEnabled:](self->m_webView, "setEditingTilingModeEnabled:");
  }
}

- (BOOL)becomesEditableWithGestures
{
  return self->m_becomesEditableWithGestures;
}

- (void)setBecomesEditableWithGestures:(BOOL)a3
{
  self->m_becomesEditableWithGestures = a3;
}

- (int)marginTop
{
  return self->m_marginTop;
}

- (void)setMarginTop:(int)a3
{
  if (self->m_marginTop != a3)
  {
    self->m_marginTop = a3;
    -[UITextContentView recalculateStyle](self, "recalculateStyle");
  }
}

- (CGRect)visibleRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGRect v38;
  CGRect v39;
  CGRect result;
  CGRect v41;

  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView _scroller](self, "_scroller");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "contentOffset");
    v14 = v13;
    v16 = v15;
    objc_msgSend(v12, "size");
    v18 = v17;
    v20 = v19;
    -[UIView frame](self, "frame");
    v41.origin.x = v21;
    v41.origin.y = v22;
    v41.size.width = v23;
    v41.size.height = v24;
    v38.origin.x = v14;
    v38.origin.y = v16;
    v38.size.width = v18;
    v38.size.height = v20;
    v39 = CGRectIntersection(v38, v41);
    -[UIView convertRect:fromView:](self, "convertRect:fromView:", v12, v39.origin.x, v39.origin.y, v39.size.width, v39.size.height);
    v4 = v25;
    v6 = v26;
    v8 = v27;
    v10 = v28;
  }
  if (-[UITextContentView isEditing](self, "isEditing"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "subtractKeyboardFrameFromRect:inView:", v12, v4, v6, v8, v10);
    v4 = v30;
    v6 = v31;
    v8 = v32;
    v10 = v33;

  }
  v34 = v4;
  v35 = v6;
  v36 = v8;
  v37 = v10;
  result.size.height = v37;
  result.size.width = v36;
  result.origin.y = v35;
  result.origin.x = v34;
  return result;
}

- (CGRect)visibleTextRect
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  double height;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect v24;
  CGRect v25;
  CGRect result;
  CGRect v27;

  -[UITextContentView visibleRect](self, "visibleRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView frame](self->m_webView, "frame");
  v27.origin.x = v11;
  v27.origin.y = v12;
  v27.size.width = v13;
  v27.size.height = v14;
  v24.origin.x = v4;
  v24.origin.y = v6;
  v24.size.width = v8;
  v24.size.height = v10;
  v25 = CGRectIntersection(v24, v27);
  x = v25.origin.x;
  y = v25.origin.y;
  width = v25.size.width;
  height = v25.size.height;
  -[UIFont pointSize](self->m_font, "pointSize");
  v20 = height + v19 * -0.5;
  v21 = x;
  v22 = y;
  v23 = width;
  result.size.height = v20;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (id)webView
{
  return self->m_webView;
}

- (void)_didScroll
{
  -[UIWebDocumentView _didScroll](self->m_webView, "_didScroll");
}

- (void)scrollRangeToVisible:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  id v6;

  length = a3.length;
  location = a3.location;
  WebThreadLock();
  -[WebFrame convertNSRangeToDOMRange:](self->m_frame, "convertNSRangeToDOMRange:", location, length);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[WebFrame firstRectForDOMRange:](self->m_frame, "firstRectForDOMRange:", v6);
  -[UIView convertRect:fromView:](self, "convertRect:fromView:", self->m_webView);
  -[UITextContentView scrollRectToVisible:animated:](self, "scrollRectToVisible:animated:", 1);

}

- (BOOL)shouldStartDataDetectors
{
  unint64_t v3;

  v3 = -[UITextContentView dataDetectorTypes](self, "dataDetectorTypes");
  if (v3)
    LOBYTE(v3) = !-[UITextContentView isEditable](self, "isEditable");
  return v3;
}

- (void)cancelDataDetectorsWithWebLock
{
  id v3;

  objc_msgSend(DataDetectorsUIGetClass(CFSTR("DDDetectionController")), "sharedController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelURLificationForFrame:", self->m_frame);

}

- (void)startDataDetectorsWithWebLock
{
  id v3;

  objc_msgSend(DataDetectorsUIGetClass(CFSTR("DDDetectionController")), "sharedController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startURLificationForFrame:detectedTypes:", self->m_frame, -[UIWebDocumentView effectiveDataDetectorTypes](self->m_webView, "effectiveDataDetectorTypes"));

}

- (void)resetDataDetectorsResultsWithWebLock
{
  id v3;

  if (sDataDetectorsUIFrameworkLoaded == 1)
  {
    objc_msgSend(DataDetectorsUIGetClass(CFSTR("DDDetectionController")), "sharedController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resetResultsForFrame:", self->m_frame);

  }
}

- (unint64_t)dataDetectorTypes
{
  return -[UIWebDocumentView dataDetectorTypes](self->m_webView, "dataDetectorTypes");
}

- (void)setDataDetectorTypes:(unint64_t)a3
{
  _BOOL4 v5;
  UIWebDocumentView *m_webView;
  id v7;

  if (-[UIWebDocumentView dataDetectorTypes](self->m_webView, "dataDetectorTypes") != a3)
  {
    WebThreadLock();
    -[UIWebDocumentView setDataDetectorTypes:](self->m_webView, "setDataDetectorTypes:", a3);
    v5 = -[UITextContentView shouldStartDataDetectors](self, "shouldStartDataDetectors");
    m_webView = self->m_webView;
    if (v5)
    {
      -[UIWebDocumentView setAllowsDataDetectorsSheet:](m_webView, "setAllowsDataDetectorsSheet:", 1);
      -[UITextContentView startDataDetectorsWithWebLock](self, "startDataDetectorsWithWebLock");
    }
    else
    {
      -[UIWebDocumentView setAllowsDataDetectorsSheet:](m_webView, "setAllowsDataDetectorsSheet:", 0);
      -[UITextContentView resetDataDetectorsResultsWithWebLock](self, "resetDataDetectorsResultsWithWebLock");
    }
    -[UITextContentView interactionAssistant](self, "interactionAssistant");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setGestureRecognizers");

  }
}

- (BOOL)mightHaveLinks
{
  return -[UITextContentView _allowedLinkTypes](self, "_allowedLinkTypes") != 0;
}

- (unint64_t)_allowedLinkTypes
{
  if (self->m_usesAttributedText)
    return -1;
  else
    return -[UITextContentView dataDetectorTypes](self, "dataDetectorTypes");
}

- (void)tapLinkAtPoint:(CGPoint)a3
{
  -[UIWebDocumentView tapInteractionWithLocation:](self->m_webView, "tapInteractionWithLocation:", a3.x, a3.y);
}

- (void)startInteractionWithLinkAtPoint:(CGPoint)a3
{
  -[UIWebDocumentView startInteractionWithLocation:](self->m_webView, "startInteractionWithLocation:", a3.x, a3.y);
}

- (void)updateInteractionWithLinkAtPoint:(CGPoint)a3
{
  -[UIWebDocumentView continueInteractionWithLocation:](self->m_webView, "continueInteractionWithLocation:", a3.x, a3.y);
}

- (void)validateInteractionWithLinkAtPoint:(CGPoint)a3
{
  -[UIWebDocumentView validateInteractionWithLocation:](self->m_webView, "validateInteractionWithLocation:", a3.x, a3.y);
}

- (void)cancelInteractionWithLink
{
  -[UIWebDocumentView cancelInteraction](self->m_webView, "cancelInteraction");
}

- (void)startLongInteractionWithLinkAtPoint:(CGPoint)a3
{
  -[UIWebDocumentView startActionSheet](self->m_webView, "startActionSheet", a3.x, a3.y);
}

- (BOOL)isInteractingWithLink
{
  return -[UIWebDocumentView isInInteraction](self->m_webView, "isInInteraction");
}

- (BOOL)willInteractWithLinkAtPoint:(CGPoint)a3
{
  return -[UIWebDocumentView willInteractWithLocation:](self->m_webView, "willInteractWithLocation:", a3.x, a3.y);
}

- (BOOL)keyboardInput:(id)a3 shouldReplaceTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  id WeakRetained;
  char v10;

  length = a4.length;
  location = a4.location;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained(&self->m_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v10 = objc_msgSend(WeakRetained, "textContentView:shouldChangeTextInRange:replacementText:", self, location, length, v8);
  else
    v10 = 1;

  return v10;
}

- (BOOL)keyboardInput:(id)a3 shouldInsertText:(id)a4 isMarkedText:(BOOL)a5
{
  id v6;
  id WeakRetained;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained(&self->m_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = -[UITextContentView selectedRange](self, "selectedRange");
    v10 = objc_msgSend(WeakRetained, "textContentView:shouldChangeTextInRange:replacementText:", self, v8, v9, v6);
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (BOOL)keyboardInputShouldDelete:(id)a3
{
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  char v7;

  WeakRetained = objc_loadWeakRetained(&self->m_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = -[UITextContentView selectedRange](self, "selectedRange");
    v7 = objc_msgSend(WeakRetained, "textContentView:shouldChangeTextInRange:replacementText:", self, v5, v6, &stru_1E16EDF20);
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (BOOL)keyboardInputChanged:(id)a3
{
  id WeakRetained;
  void *v5;

  WeakRetained = objc_loadWeakRetained(&self->m_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "textContentViewDidChange:", self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("UITextViewTextDidChangeNotification"), self);

  return 1;
}

- (void)keyboardInputChangedSelection:(id)a3
{
  id WeakRetained;

  if (!self->m_becomingFirstResponder)
  {
    WeakRetained = objc_loadWeakRetained(&self->m_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "textContentViewDidChangeSelection:", self);

  }
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 request:(id)a5 frame:(id)a6 decisionListener:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a7;
  objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0DD97D0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "intValue");

  if (v15)
  {
    objc_msgSend(v13, "use");
  }
  else
  {
    objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0DD97C8]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0DD97E8]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "URL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIWebURLAction performDefaultActionForURL:andDOMNode:withAllowedTypes:forFrame:inView:](UIWebURLAction, "performDefaultActionForURL:andDOMNode:withAllowedTypes:forFrame:inView:", v18, v17, -[UITextContentView _allowedLinkTypes](self, "_allowedLinkTypes"), v12, self);

    objc_msgSend(v13, "ignore");
  }

}

- (void)setBottomBufferHeight:(double)a3
{
  self->m_bottomBufferHeight = -a3;
}

- (double)bottomBufferHeight
{
  return -self->m_bottomBufferHeight;
}

- (CGPoint)offset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (id)_proxyTextInput
{
  UITextContentView *v2;
  void *v3;
  void *v4;

  v2 = self;
  -[UITextContentView tokenizer](self, "tokenizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWebDocumentView tokenizer](v2->m_webView, "tokenizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v4)
    v2 = (UITextContentView *)v2->m_webView;
  return v2;
}

- (void)deleteBackward
{
  -[UIWebDocumentView deleteBackward](self->m_webView, "deleteBackward");
}

- (void)insertText:(id)a3
{
  -[UIWebDocumentView insertText:](self->m_webView, "insertText:", a3);
}

- (void)insertDictationResult:(id)a3 withCorrectionIdentifier:(id)a4
{
  id v6;
  UITextContentView *v7;
  uint64_t v8;
  id v9;

  v9 = a4;
  v6 = a3;
  -[UITextContentView _proxyTextInput](self, "_proxyTextInput");
  v7 = (UITextContentView *)objc_claimAutoreleasedReturnValue();

  if (v7 == self)
  {
    objc_msgSend(v6, "dictationPhraseArray");
    v8 = objc_claimAutoreleasedReturnValue();

    -[UITextContentView insertDictationResult:](self, "insertDictationResult:", v8);
    v6 = (id)v8;
  }
  else
  {
    -[UIWebDocumentView insertDictationResult:withCorrectionIdentifier:](self->m_webView, "insertDictationResult:withCorrectionIdentifier:", v6, v9);
  }

}

- (id)insertDictationResultPlaceholder
{
  return -[UIWebDocumentView insertDictationResultPlaceholder](self->m_webView, "insertDictationResultPlaceholder");
}

- (void)removeDictationResultPlaceholder:(id)a3 willInsertResult:(BOOL)a4
{
  -[UIWebDocumentView removeDictationResultPlaceholder:willInsertResult:](self->m_webView, "removeDictationResultPlaceholder:willInsertResult:", a3, a4);
}

- (CGRect)frameForDictationResultPlaceholder:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[UIWebDocumentView frameForDictationResultPlaceholder:](self->m_webView, "frameForDictationResultPlaceholder:", a3);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)insertTextPlaceholderWithSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;

  height = a3.height;
  width = a3.width;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIWebDocumentView insertTextPlaceholderWithSize:](self->m_webView, "insertTextPlaceholderWithSize:", width, height);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)removeTextPlaceholder:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIWebDocumentView removeTextPlaceholder:](self->m_webView, "removeTextPlaceholder:", v4);

}

- (id)metadataDictionariesForDictationResults
{
  return -[UIWebDocumentView metadataDictionariesForDictationResults](self->m_webView, "metadataDictionariesForDictationResults");
}

- (id)textInRange:(id)a3
{
  return -[UIWebDocumentView textInRange:](self->m_webView, "textInRange:", a3);
}

- (void)replaceRange:(id)a3 withText:(id)a4
{
  -[UIWebDocumentView replaceRange:withText:](self->m_webView, "replaceRange:withText:", a3, a4);
}

- (UITextRange)selectedTextRange
{
  return -[UIWebDocumentView selectedTextRange](self->m_webView, "selectedTextRange");
}

- (void)setSelectedTextRange:(id)a3
{
  UITextContentView *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[UITextContentView _proxyTextInput](self, "_proxyTextInput");
  v4 = (UITextContentView *)objc_claimAutoreleasedReturnValue();

  if (v4 == self)
  {
    -[UITextContentView interactionAssistant](self, "interactionAssistant");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "selectionChanged");

  }
  else
  {
    -[UIWebDocumentView setSelectedTextRange:](self->m_webView, "setSelectedTextRange:", v6);
  }

}

- (UITextRange)markedTextRange
{
  return -[UIWebDocumentView markedTextRange](self->m_webView, "markedTextRange");
}

- (NSDictionary)markedTextStyle
{
  return -[UIWebDocumentView markedTextStyle](self->m_webView, "markedTextStyle");
}

- (void)setMarkedTextStyle:(id)a3
{
  -[UIWebDocumentView setMarkedTextStyle:](self->m_webView, "setMarkedTextStyle:", a3);
}

- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  -[UIWebDocumentView setMarkedText:selectedRange:](self->m_webView, "setMarkedText:selectedRange:", a3, a4.location, a4.length);
}

- (void)unmarkText
{
  -[UIWebDocumentView unmarkText](self->m_webView, "unmarkText");
}

- (UITextPosition)beginningOfDocument
{
  return -[UIWebDocumentView beginningOfDocument](self->m_webView, "beginningOfDocument");
}

- (UITextPosition)endOfDocument
{
  return -[UIWebDocumentView endOfDocument](self->m_webView, "endOfDocument");
}

- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4
{
  return -[UIWebDocumentView textRangeFromPosition:toPosition:](self->m_webView, "textRangeFromPosition:toPosition:", a3, a4);
}

- (id)positionFromPosition:(id)a3 offset:(int64_t)a4
{
  return -[UIWebDocumentView positionFromPosition:offset:](self->m_webView, "positionFromPosition:offset:", a3, a4);
}

- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5
{
  return -[UIWebDocumentView positionFromPosition:inDirection:offset:](self->m_webView, "positionFromPosition:inDirection:offset:", a3, a4, a5);
}

- (int64_t)comparePosition:(id)a3 toPosition:(id)a4
{
  return -[UIWebDocumentView comparePosition:toPosition:](self->m_webView, "comparePosition:toPosition:", a3, a4);
}

- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4
{
  return -[UIWebDocumentView offsetFromPosition:toPosition:](self->m_webView, "offsetFromPosition:toPosition:", a3, a4);
}

- (UITextInputDelegate)inputDelegate
{
  return -[UIWebDocumentView inputDelegate](self->m_webView, "inputDelegate");
}

- (void)setInputDelegate:(id)a3
{
  -[UIWebDocumentView setInputDelegate:](self->m_webView, "setInputDelegate:", a3);
}

- (UITextInputTokenizer)tokenizer
{
  return -[UIWebDocumentView tokenizer](self->m_webView, "tokenizer");
}

- (id)positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4
{
  return -[UIWebDocumentView positionWithinRange:farthestInDirection:](self->m_webView, "positionWithinRange:farthestInDirection:", a3, a4);
}

- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(int64_t)a4
{
  return -[UIWebDocumentView characterRangeByExtendingPosition:inDirection:](self->m_webView, "characterRangeByExtendingPosition:inDirection:", a3, a4);
}

- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4
{
  return -[UIWebDocumentView baseWritingDirectionForPosition:inDirection:](self->m_webView, "baseWritingDirectionForPosition:inDirection:", a3, a4);
}

- (void)setBaseWritingDirection:(int64_t)a3 forRange:(id)a4
{
  -[UIWebDocumentView setBaseWritingDirection:forRange:](self->m_webView, "setBaseWritingDirection:forRange:", a3, a4);
}

- (CGRect)firstRectForRange:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[UIWebDocumentView firstRectForRange:](self->m_webView, "firstRectForRange:", a3);
  -[UIView convertRect:toView:](self->m_webView, "convertRect:toView:", self);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)caretRectForPosition:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[UIWebDocumentView caretRectForPosition:](self->m_webView, "caretRectForPosition:", a3);
  -[UIView convertRect:toView:](self->m_webView, "convertRect:toView:", self);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (id)closestPositionToPoint:(CGPoint)a3
{
  -[UIView convertPoint:fromView:](self->m_webView, "convertPoint:fromView:", self, a3.x, a3.y);
  return -[UIWebDocumentView closestPositionToPoint:](self->m_webView, "closestPositionToPoint:");
}

- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4
{
  double y;
  double x;
  UIWebDocumentView *m_webView;
  id v8;
  void *v9;

  y = a3.y;
  x = a3.x;
  m_webView = self->m_webView;
  v8 = a4;
  -[UIView convertPoint:fromView:](m_webView, "convertPoint:fromView:", self, x, y);
  -[UIWebDocumentView closestPositionToPoint:withinRange:](self->m_webView, "closestPositionToPoint:withinRange:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)characterRangeAtPoint:(CGPoint)a3
{
  -[UIView convertPoint:fromView:](self->m_webView, "convertPoint:fromView:", self, a3.x, a3.y);
  return -[UIWebDocumentView characterRangeAtPoint:](self->m_webView, "characterRangeAtPoint:");
}

- (int64_t)selectionAffinity
{
  return -[UIWebDocumentView selectionAffinity](self->m_webView, "selectionAffinity");
}

- (void)setSelectionAffinity:(int64_t)a3
{
  -[UIWebDocumentView setSelectionAffinity:](self->m_webView, "setSelectionAffinity:", a3);
}

- (int64_t)selectionGranularity
{
  return -[UIWebDocumentView selectionGranularity](self->m_webView, "selectionGranularity");
}

- (void)setSelectionGranularity:(int64_t)a3
{
  -[UIWebDocumentView setSelectionGranularity:](self->m_webView, "setSelectionGranularity:", a3);
}

- (UIEdgeInsets)selectionInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->m_selectionInset.top;
  left = self->m_selectionInset.left;
  bottom = self->m_selectionInset.bottom;
  right = self->m_selectionInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setSelectionInset:(UIEdgeInsets)a3
{
  self->m_selectionInset = a3;
}

- (BOOL)scrollsSelectionOnWebDocumentChanges
{
  return self->m_scrollsSelectionOnWebDocumentChanges;
}

- (void)setScrollsSelectionOnWebDocumentChanges:(BOOL)a3
{
  self->m_scrollsSelectionOnWebDocumentChanges = a3;
}

- (UITextContentViewDelegate)delegate
{
  return (UITextContentViewDelegate *)objc_loadWeakRetained(&self->m_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->m_delegate, a3);
}

- (BOOL)isDragInteractionEnabled
{
  return self->_dragInteractionEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_dropInteraction, 0);
  objc_storeStrong((id *)&self->m_dragInteraction, 0);
  objc_storeStrong((id *)&self->m_textColor, 0);
  objc_storeStrong((id *)&self->m_font, 0);
  objc_storeStrong((id *)&self->m_webView, 0);
  objc_storeStrong((id *)&self->m_interactionAssistant, 0);
  objc_storeStrong((id *)&self->m_body, 0);
  objc_storeStrong((id *)&self->m_frame, 0);
  objc_destroyWeak(&self->m_delegate);
}

@end
