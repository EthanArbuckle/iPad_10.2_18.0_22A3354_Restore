@implementation UIScribbleInteraction

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (void)setView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
}

- (UIScribbleInteraction)initWithDelegate:(id)delegate
{
  id v4;
  UIScribbleInteraction *v5;
  UIScribbleInteraction *v6;
  objc_super v8;

  v4 = delegate;
  v8.receiver = self;
  v8.super_class = (Class)UIScribbleInteraction;
  v5 = -[UIScribbleInteraction init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (void)_setDefaultSystemInteraction:(BOOL)a3
{
  self->__defaultSystemInteraction = a3;
}

+ (void)_lastEventSourceChanged:(int64_t)a3
{
  int v3;

  v3 = a3 == 3;
  if (sIsPencilInputExpected != v3)
  {
    objc_msgSend(a1, "willChangeValueForKey:", CFSTR("isPencilInputExpected"));
    sIsPencilInputExpected = v3;
    objc_msgSend(a1, "didChangeValueForKey:", CFSTR("isPencilInputExpected"));
  }
}

+ (BOOL)isPencilInputExpected
{
  return sIsPencilInputExpected;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (double)_recommendedBlankSpaceHeight
{
  return 60.0;
}

- (void)_setHandlingWriting:(BOOL)a3
{
  self->_handlingWriting = a3;
}

- (id)scribbleInteractionWrapper
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[UIScribbleInteraction view](self, "view", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "interactions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v9, "scribbleInteractionWrapper");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          return v11;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }

  return -[UIScribbleInteractionWrapper initWithCustomScribbleInteraction:indirectScribbleInteraction:]([UIScribbleInteractionWrapper alloc], "initWithCustomScribbleInteraction:indirectScribbleInteraction:", self, 0);
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)isHandlingWriting
{
  return self->_handlingWriting;
}

- (BOOL)_isDefaultSystemInteraction
{
  return self->__defaultSystemInteraction;
}

@end
