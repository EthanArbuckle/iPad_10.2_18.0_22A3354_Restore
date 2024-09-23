@implementation _UIEventSessionAction

- (_UIEventSessionTouchAction)asTouch
{
  _UIEventSessionAction *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return (_UIEventSessionTouchAction *)v3;
}

- (_UIEventSessionTapAction)asTap
{
  _UIEventSessionAction *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return (_UIEventSessionTapAction *)v3;
}

- (_UIEventSessionScrollAction)asScroll
{
  _UIEventSessionAction *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return (_UIEventSessionScrollAction *)v3;
}

- (_UIEventSessionContextualAction)asContextualPress
{
  _UIEventSessionAction *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return (_UIEventSessionContextualAction *)v3;
}

- (_UIEventSessionTypingAction)asTyping
{
  _UIEventSessionAction *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return (_UIEventSessionTypingAction *)v3;
}

- (_UIEventSessionTextSelectionAction)asTextSelection
{
  _UIEventSessionAction *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return (_UIEventSessionTextSelectionAction *)v3;
}

- (_UIEventSessionKeyCommandAction)asKeyCommand
{
  _UIEventSessionAction *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return (_UIEventSessionKeyCommandAction *)v3;
}

- (_UIEventSessionHoverAction)asHover
{
  _UIEventSessionAction *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return (_UIEventSessionHoverAction *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v4 + 8) = self->_source;
  objc_storeStrong((id *)(v4 + 24), self->_sessionID);
  *(_QWORD *)(v4 + 56) = self->_sequenceNumber;
  *(_QWORD *)(v4 + 64) = self->_actionCountFromMergedActions;
  *(_QWORD *)(v4 + 32) = self->_uiInterfaceOrientation;
  *(_QWORD *)(v4 + 48) = self->_hardwareKeyboardState;
  *(_QWORD *)(v4 + 40) = self->_magicKeyboardState;
  return (id)v4;
}

- (int64_t)mergeActionIfPossible:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  unint64_t v11;
  NSObject *v12;
  uint8_t v13[16];

  v4 = a3;
  v5 = objc_msgSend(v4, "uiInterfaceOrientation");
  if (v5 == -[_UIEventSessionAction uiInterfaceOrientation](self, "uiInterfaceOrientation")
    && (v6 = objc_msgSend(v4, "hardwareKeyboardState"),
        v6 == -[_UIEventSessionAction hardwareKeyboardState](self, "hardwareKeyboardState"))
    && (v7 = objc_msgSend(v4, "magicKeyboardState"),
        v7 == -[_UIEventSessionAction magicKeyboardState](self, "magicKeyboardState"))
    && (v8 = objc_msgSend(v4, "source"), v8 == -[_UIEventSessionAction source](self, "source"))
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (os_variant_has_internal_diagnostics())
    {
      v11 = mergeActionIfPossible____s_category;
      if (!mergeActionIfPossible____s_category)
      {
        v11 = __UILogCategoryGetNode("UIEventSessionActionAnalytics", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v11, (unint64_t *)&mergeActionIfPossible____s_category);
      }
      if ((*(_BYTE *)v11 & 1) != 0)
      {
        v12 = *(NSObject **)(v11 + 8);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v13 = 0;
          _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "Successfully merged actions", v13, 2u);
        }
      }
    }
    -[_UIEventSessionAction setActionCountFromMergedActions:](self, "setActionCountFromMergedActions:", -[_UIEventSessionAction actionCountFromMergedActions](self, "actionCountFromMergedActions")+ objc_msgSend(v4, "actionCount"));
    v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_UIEventSessionAction;
  -[_UIEventSessionAction description](&v14, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  +[_UIEventSessionAction stringValueForSource:](_UIEventSessionAction, "stringValueForSource:", -[_UIEventSessionAction source](self, "source"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR(" source = %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v7);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("uiInterfaceOrientation = %lu"), -[_UIEventSessionAction uiInterfaceOrientation](self, "uiInterfaceOrientation"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v8);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hardwareKeyboardState = %lu"), -[_UIEventSessionAction hardwareKeyboardState](self, "hardwareKeyboardState"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v9);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("magicKeyboardState = %lu"), -[_UIEventSessionAction magicKeyboardState](self, "magicKeyboardState"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v10);

  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" %@"), v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v12;
  }

  return v3;
}

- (NSString)typeEncoding
{
  return (NSString *)&stru_1E16EDF20;
}

- (NSString)metadata
{
  return (NSString *)+[_UIEventSessionAction stringValueForSource:](_UIEventSessionAction, "stringValueForSource:", -[_UIEventSessionAction source](self, "source"));
}

- (int64_t)actionCount
{
  return -[_UIEventSessionAction actionCountFromMergedActions](self, "actionCountFromMergedActions") + 1;
}

- (int64_t)actionType
{
  return 0;
}

+ (int64_t)getUIEventSourceForUITouchType:(int64_t)a3
{
  if ((unint64_t)a3 < 4)
    return a3 + 1;
  else
    return 0;
}

+ (id)stringValueForSource:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5)
    return CFSTR("unspecified");
  else
    return off_1E16D3D48[a3 - 1];
}

+ (id)stringValueForActionType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x1B)
    return CFSTR("Generic");
  else
    return off_1E16D3D78[a3 - 1];
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (void)setActionType:(int64_t)a3
{
  self->_actionType = a3;
}

- (NSNumber)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionID, a3);
}

- (int64_t)uiInterfaceOrientation
{
  return self->_uiInterfaceOrientation;
}

- (void)setUiInterfaceOrientation:(int64_t)a3
{
  self->_uiInterfaceOrientation = a3;
}

- (int64_t)magicKeyboardState
{
  return self->_magicKeyboardState;
}

- (void)setMagicKeyboardState:(int64_t)a3
{
  self->_magicKeyboardState = a3;
}

- (int64_t)hardwareKeyboardState
{
  return self->_hardwareKeyboardState;
}

- (void)setHardwareKeyboardState:(int64_t)a3
{
  self->_hardwareKeyboardState = a3;
}

- (int64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(int64_t)a3
{
  self->_sequenceNumber = a3;
}

- (int64_t)actionCountFromMergedActions
{
  return self->_actionCountFromMergedActions;
}

- (void)setActionCountFromMergedActions:(int64_t)a3
{
  self->_actionCountFromMergedActions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end
