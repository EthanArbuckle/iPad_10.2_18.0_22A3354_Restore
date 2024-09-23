@implementation _UIEventSessionHoverAction

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIEventSessionHoverAction;
  result = -[_UIEventSessionAction copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_QWORD *)result + 9) = self->_tapDragState;
  *((_QWORD *)result + 10) = self->_numFingers;
  return result;
}

- (int64_t)mergeActionIfPossible:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v13;
  NSObject *v14;
  uint8_t v15[16];

  v4 = a3;
  v5 = objc_msgSend(v4, "uiInterfaceOrientation");
  if (v5 == -[_UIEventSessionAction uiInterfaceOrientation](self, "uiInterfaceOrientation")
    && (v6 = objc_msgSend(v4, "hardwareKeyboardState"),
        v6 == -[_UIEventSessionAction hardwareKeyboardState](self, "hardwareKeyboardState"))
    && (v7 = objc_msgSend(v4, "magicKeyboardState"),
        v7 == -[_UIEventSessionAction magicKeyboardState](self, "magicKeyboardState")))
  {
    objc_msgSend(v4, "asHover");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "source");
    v10 = 0;
    if (v9 == -[_UIEventSessionAction source](self, "source") && v8)
    {
      v11 = objc_msgSend(v8, "numFingers");
      if (v11 == -[_UIEventSessionHoverAction numFingers](self, "numFingers"))
      {
        if (os_variant_has_internal_diagnostics())
        {
          v13 = mergeActionIfPossible____s_category_251;
          if (!mergeActionIfPossible____s_category_251)
          {
            v13 = __UILogCategoryGetNode("UIEventSessionActionAnalytics", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v13, (unint64_t *)&mergeActionIfPossible____s_category_251);
          }
          if ((*(_BYTE *)v13 & 1) != 0)
          {
            v14 = *(NSObject **)(v13 + 8);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v15 = 0;
              _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "Successfully merged actions", v15, 2u);
            }
          }
        }
        -[_UIEventSessionAction setActionCountFromMergedActions:](self, "setActionCountFromMergedActions:", -[_UIEventSessionAction actionCountFromMergedActions](self, "actionCountFromMergedActions")+ objc_msgSend(v4, "actionCount"));
        v10 = 1;
      }
      else
      {
        v10 = 0;
      }
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)typeEncoding
{
  return CFSTR("Hover");
}

- (int64_t)actionType
{
  int64_t numFingers;
  int64_t v5;
  void *v7;

  if (-[_UIEventSessionAction source](self, "source") == 4)
  {
    numFingers = self->_numFingers;
    v5 = 13;
    if (numFingers != 2)
      v5 = 14;
    if (numFingers == 1)
      return 12;
    else
      return v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIEventSessionAction.m"), 498, CFSTR("Received hover event of unsupported source"));

    return 28;
  }
}

- (int64_t)tapDragState
{
  return self->_tapDragState;
}

- (void)setTapDragState:(int64_t)a3
{
  self->_tapDragState = a3;
}

- (int64_t)numFingers
{
  return self->_numFingers;
}

- (void)setNumFingers:(int64_t)a3
{
  self->_numFingers = a3;
}

@end
