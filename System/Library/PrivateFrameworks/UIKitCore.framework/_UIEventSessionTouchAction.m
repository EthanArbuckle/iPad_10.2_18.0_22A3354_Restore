@implementation _UIEventSessionTouchAction

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIEventSessionTouchAction;
  result = -[_UIEventSessionAction copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_QWORD *)result + 9) = self->_tapDragState;
  *((_QWORD *)result + 10) = self->_numFingers;
  *((_QWORD *)result + 11) = self->_windowSection;
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
  uint64_t v12;
  uint64_t v13;
  unint64_t v15;
  NSObject *v16;
  uint8_t v17[16];

  v4 = a3;
  v5 = objc_msgSend(v4, "uiInterfaceOrientation");
  if (v5 == -[_UIEventSessionAction uiInterfaceOrientation](self, "uiInterfaceOrientation")
    && (v6 = objc_msgSend(v4, "hardwareKeyboardState"),
        v6 == -[_UIEventSessionAction hardwareKeyboardState](self, "hardwareKeyboardState"))
    && (v7 = objc_msgSend(v4, "magicKeyboardState"),
        v7 == -[_UIEventSessionAction magicKeyboardState](self, "magicKeyboardState")))
  {
    objc_msgSend(v4, "asTouch");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "source");
    v10 = 0;
    if (v9 == -[_UIEventSessionAction source](self, "source") && v8)
    {
      v11 = objc_msgSend(v8, "numFingers");
      if (v11 == -[_UIEventSessionTouchAction numFingers](self, "numFingers")
        && (v12 = objc_msgSend(v8, "tapDragState"),
            v12 == -[_UIEventSessionTouchAction tapDragState](self, "tapDragState"))
        && (objc_msgSend(v8, "numFingers") != 1
         || objc_msgSend(v8, "tapDragState") != 1
         || (v13 = objc_msgSend(v8, "windowSection"),
             v13 == -[_UIEventSessionTouchAction windowSection](self, "windowSection"))))
      {
        if (os_variant_has_internal_diagnostics())
        {
          v15 = mergeActionIfPossible____s_category_188;
          if (!mergeActionIfPossible____s_category_188)
          {
            v15 = __UILogCategoryGetNode("UIEventSessionActionAnalytics", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v15, (unint64_t *)&mergeActionIfPossible____s_category_188);
          }
          if ((*(_BYTE *)v15 & 1) != 0)
          {
            v16 = *(NSObject **)(v15 + 8);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v17 = 0;
              _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_ERROR, "Successfully merged actions", v17, 2u);
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_UIEventSessionTouchAction;
  -[_UIEventSessionAction description](&v11, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" tapDragState = %lu"), -[_UIEventSessionTouchAction tapDragState](self, "tapDragState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" numFingers = %lu"), -[_UIEventSessionTouchAction numFingers](self, "numFingers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v6);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" windowSection = %lu"), -[_UIEventSessionTouchAction windowSection](self, "windowSection"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v7);

  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" %@"), v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v9;
  }

  return v3;
}

- (id)typeEncoding
{
  return CFSTR("Touch");
}

- (int64_t)actionType
{
  int64_t v3;
  int64_t v4;
  int64_t v5;
  BOOL v6;
  int64_t v7;
  int64_t numFingers;
  int64_t windowSection;
  unint64_t v10;
  BOOL v12;
  int64_t v13;

  v3 = -[_UIEventSessionAction source](self, "source");
  if (v3 == 4)
  {
    numFingers = self->_numFingers;
    if (numFingers == 2)
      return 19;
    if (numFingers != 1)
      return 20;
    windowSection = self->_windowSection;
    v10 = windowSection - 1;
    v5 = windowSection + 14;
    v6 = v10 >= 3;
    v7 = 18;
LABEL_11:
    if (v6)
      return v7;
    else
      return v5;
  }
  if (v3 != 1)
    return 21;
  v4 = self->_numFingers;
  switch(v4)
  {
    case 3:
      v12 = self->_tapDragState == 1;
      v13 = 8;
      break;
    case 2:
      v12 = self->_tapDragState == 1;
      v13 = 6;
      break;
    case 1:
      if (self->_tapDragState != 1)
        return 5;
      v5 = self->_windowSection;
      v6 = (unint64_t)(v5 - 1) >= 3;
      v7 = 4;
      goto LABEL_11;
    default:
      v12 = self->_tapDragState == 1;
      v13 = 10;
      break;
  }
  if (v12)
    return v13;
  else
    return v13 + 1;
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

- (int64_t)windowSection
{
  return self->_windowSection;
}

- (void)setWindowSection:(int64_t)a3
{
  self->_windowSection = a3;
}

@end
