@implementation UIIndirectScribbleInteraction

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (void)setView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
}

- (UIIndirectScribbleInteraction)initWithDelegate:(id)delegate
{
  id v4;
  UIIndirectScribbleInteraction *v5;
  UIIndirectScribbleInteraction *v6;
  objc_super v8;

  v4 = delegate;
  v8.receiver = self;
  v8.super_class = (Class)UIIndirectScribbleInteraction;
  v5 = -[UIIndirectScribbleInteraction init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (int64_t)_handlingWritingCount
{
  return self->__handlingWritingCount;
}

- (void)_setHandlingWritingCount:(int64_t)a3
{
  int64_t handlingWritingCount;

  handlingWritingCount = self->__handlingWritingCount;
  if (handlingWritingCount != a3)
  {
    self->__handlingWritingCount = a3;
    if (a3 > 0 == handlingWritingCount < 1)
      -[UIIndirectScribbleInteraction _setHandlingWriting:](self, "_setHandlingWriting:", a3 > 0);
  }
}

- (void)_setDefaultSystemInteraction:(BOOL)a3
{
  self->__defaultSystemInteraction = a3;
}

- (id)scribbleInteractionWrapper
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  UIScribbleInteractionWrapper *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[UIIndirectScribbleInteraction view](self, "view", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "interactions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v5 = v8;
          goto LABEL_11;
        }
      }
      v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  v9 = -[UIScribbleInteractionWrapper initWithCustomScribbleInteraction:indirectScribbleInteraction:]([UIScribbleInteractionWrapper alloc], "initWithCustomScribbleInteraction:indirectScribbleInteraction:", v5, self);
  return v9;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)isHandlingWriting
{
  return self->_handlingWriting;
}

- (void)_setHandlingWriting:(BOOL)a3
{
  self->_handlingWriting = a3;
}

- (BOOL)_isDefaultSystemInteraction
{
  return self->__defaultSystemInteraction;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
