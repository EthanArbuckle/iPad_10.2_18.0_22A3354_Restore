@implementation UIControl

- (void)_willMoveToWindow:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  if (!v4)
  {
    if ((*((_BYTE *)&self->_controlFlags + 2) & 0x20) != 0)
    {
      objc_getAssociatedObject(self, &_UIControlContextMenuInteractionKey);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    objc_msgSend(v5, "dismissMenu");

  }
  v6.receiver = self;
  v6.super_class = (Class)UIControl;
  -[UIView _willMoveToWindow:](&v6, sel__willMoveToWindow_, v4);

}

- (BOOL)_touchHasHighlighted
{
  return (*((unsigned __int8 *)&self->_controlFlags + 2) >> 1) & 1;
}

- (UIControlState)state
{
  uint64_t v3;
  UIControlState v4;

  if (-[UIControl isEnabled](self, "isEnabled"))
    v3 = 0;
  else
    v3 = 2;
  v4 = v3 | -[UIControl isHighlighted](self, "isHighlighted");
  if (-[UIControl isSelected](self, "isSelected"))
    v4 |= 4uLL;
  if (-[UIView isFocused](self, "isFocused"))
    return v4 | 8;
  else
    return v4;
}

- (BOOL)isEnabled
{
  return (*(_BYTE *)&self->_controlFlags & 1) == 0;
}

- (BOOL)isHighlighted
{
  return (*(_BYTE *)&self->_controlFlags >> 5) & 1;
}

- (BOOL)isSelected
{
  return (*((unsigned __int8 *)&self->_controlFlags + 1) >> 1) & 1;
}

- (UIControlContentVerticalAlignment)contentVerticalAlignment
{
  return ((unint64_t)self->_controlFlags >> 10) & 7;
}

- (id)_safeHoverStyle
{
  void *v1;

  if (a1)
  {
    v1 = a1;
    if ((dyld_program_sdk_at_least() & 1) != 0)
      objc_msgSend(v1, "hoverStyle");
    else
      -[UIView _hoverStyleStorage](v1);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (BOOL)_allowsSymbolAnimations
{
  int v2;
  void *v3;

  if ((*((_BYTE *)&self->_controlFlags + 2) & 4) != 0)
  {
    _UIKitUserDefaults();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v3, "BOOLForKey:", CFSTR("DisableControlSymbolAnimations")) ^ 1;

  }
  else
  {
    LOBYTE(v2) = 0;
  }
  return v2;
}

- (UIControlContentHorizontalAlignment)effectiveContentHorizontalAlignment
{
  UIControlContentHorizontalAlignment result;

  result = (unint64_t)((unsigned __int16)*(_DWORD *)&self->_controlFlags >> 13);
  if ((_DWORD)result == UIControlContentHorizontalAlignmentTrailing)
  {
    if ((*((_DWORD *)&self->super._viewFlags + 4) & 0x80000) != 0)
      return 1;
    else
      return 2;
  }
  else if ((_DWORD)result == UIControlContentHorizontalAlignmentLeading)
  {
    if ((*((_DWORD *)&self->super._viewFlags + 4) & 0x80000) != 0)
      return 2;
    else
      return 1;
  }
  return result;
}

- (int64_t)effectiveContentVerticalAlignment
{
  $115ED1BCE1FB1BC1A4A0E4C8874C5931 controlFlags;

  controlFlags = self->_controlFlags;
  if ((*(_WORD *)&controlFlags & 0x1800) != 0x1000)
    return (*(unsigned int *)&controlFlags >> 10) & 7;
  if (dyld_program_sdk_at_least())
  {
    controlFlags = self->_controlFlags;
    return (*(unsigned int *)&controlFlags >> 10) & 7;
  }
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetActions, 0);
}

- (void)_invalidatePointerInteraction
{
  void *v3;
  void *v4;
  id v5;

  -[UIControl _proxyPointerInteraction](self, "_proxyPointerInteraction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (v3)
  {
    objc_msgSend(v3, "invalidate");
  }
  else
  {
    -[UIControl _pointerInteraction](self, "_pointerInteraction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

  }
}

- (UIPointerInteraction)_proxyPointerInteraction
{
  if ((*((_BYTE *)&self->_controlFlags + 2) & 0x10) == 0)
    return (UIPointerInteraction *)0;
  objc_getAssociatedObject(self, &_UIControlProxyPointerInteractionKey);
  return (UIPointerInteraction *)(id)objc_claimAutoreleasedReturnValue();
}

- (UIPointerInteraction)_pointerInteraction
{
  if ((*((_BYTE *)&self->_controlFlags + 2) & 8) == 0)
    return (UIPointerInteraction *)0;
  objc_getAssociatedObject(self, &_UIControlPointerInteractionKey);
  return (UIPointerInteraction *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)showsMenuAsPrimaryAction
{
  void *v2;
  char v3;

  if ((*((_BYTE *)&self->_controlFlags + 2) & 0x20) != 0)
  {
    objc_getAssociatedObject(self, &_UIControlContextMenuInteractionKey);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  v3 = objc_msgSend(v2, "_presentOnTouchDown");

  return v3;
}

- (UIControl)initWithFrame:(CGRect)frame
{
  UIControl *v3;
  UIControl *v4;
  int v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIControl;
  v3 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
  v4 = v3;
  if (v3)
  {
    *(_DWORD *)&v3->_controlFlags &= 0xFFFF03FF;
    if (objc_msgSend((id)objc_opt_class(), "_allowActionsToQueue"))
      v5 = 128;
    else
      v5 = 0;
    v4->_controlFlags = ($115ED1BCE1FB1BC1A4A0E4C8874C5931)(*(_DWORD *)&v4->_controlFlags & 0xFFFFFF7F | v5);
    v4->_requiredButtonMask = 1;
  }
  return v4;
}

+ (BOOL)_allowActionsToQueue
{
  return 0;
}

- (void)setEnabled:(BOOL)enabled
{
  _BOOL8 v3;
  id v5;

  if (((*(_DWORD *)&self->_controlFlags & 1) == 0) != enabled)
  {
    v3 = enabled;
    self->_controlFlags = ($115ED1BCE1FB1BC1A4A0E4C8874C5931)(*(_DWORD *)&self->_controlFlags & 0xFFFFFFFE | !enabled);
    -[UIControl _safeHoverStyle](self);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEnabled:", v3);
    -[UIView setNeedsDisplay](self, "setNeedsDisplay");

  }
}

- (void)setSelected:(BOOL)selected
{
  int v4;

  if (((((*(_DWORD *)&self->_controlFlags & 0x200) == 0) ^ selected) & 1) == 0)
  {
    if (selected)
      v4 = 512;
    else
      v4 = 0;
    self->_controlFlags = ($115ED1BCE1FB1BC1A4A0E4C8874C5931)(*(_DWORD *)&self->_controlFlags & 0xFFFFFDFF | v4);
    -[UIControl _invalidatePointerInteraction](self, "_invalidatePointerInteraction");
    -[UIView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setShowsMenuAsPrimaryAction:(BOOL)showsMenuAsPrimaryAction
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = showsMenuAsPrimaryAction;
  if (showsMenuAsPrimaryAction)
  {
    -[UIControl contextMenuInteraction](self, "contextMenuInteraction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if ((*((_BYTE *)&self->_controlFlags + 2) & 0x20) != 0)
  {
    objc_getAssociatedObject(self, &_UIControlContextMenuInteractionKey);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;
  objc_msgSend(v4, "_setPresentOnTouchDown:", v3);

}

- (void)setContextMenuInteractionEnabled:(BOOL)contextMenuInteractionEnabled
{
  void *v4;
  void *v5;
  UIControl *v6;
  id v7;

  if (contextMenuInteractionEnabled)
  {
    -[UIControl contextMenuInteraction](self, "contextMenuInteraction");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      -[UIView addInteraction:](self, "addInteraction:", v7);
  }
  else
  {
    if ((*((_BYTE *)&self->_controlFlags + 2) & 0x20) != 0)
    {
      objc_getAssociatedObject(self, &_UIControlContextMenuInteractionKey);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    v7 = v5;
    objc_msgSend(v5, "view");
    v6 = (UIControl *)objc_claimAutoreleasedReturnValue();

    if (v6 == self)
    {
      -[UIView removeInteraction:](self, "removeInteraction:", v7);
      -[UIControl _setHasActiveMenuPresentation:](self, "_setHasActiveMenuPresentation:", 0);
    }
  }

}

- (UIContextMenuInteraction)contextMenuInteraction
{
  uint64_t v3;
  uint64_t v4;
  _UIVariableGestureContextMenuInteraction *v5;

  if ((*((_BYTE *)&self->_controlFlags + 2) & 0x20) != 0)
  {
    objc_getAssociatedObject(self, &_UIControlContextMenuInteractionKey);
    v5 = (_UIVariableGestureContextMenuInteraction *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = objc_opt_class();
    if (v3 == objc_opt_class()
      || (v4 = -[UIControl methodForSelector:](self, "methodForSelector:", sel_contextMenuInteraction_configurationForMenuAtLocation_), v4 == +[UIControl instanceMethodForSelector:](UIControl, "instanceMethodForSelector:", sel_contextMenuInteraction_configurationForMenuAtLocation_)))
    {
      v5 = 0;
    }
    else
    {
      v5 = -[_UIVariableGestureContextMenuInteraction initWithDelegate:]([_UIVariableGestureContextMenuInteraction alloc], "initWithDelegate:", self);
      -[UIContextMenuInteraction _setProxySender:](v5, "_setProxySender:", self);
      objc_setAssociatedObject(self, &_UIControlContextMenuInteractionKey, v5, (void *)1);
      *(_DWORD *)&self->_controlFlags |= 0x200000u;
    }
  }
  return (UIContextMenuInteraction *)v5;
}

- (void)_setHoverStyle:(void *)a1 implicit:(void *)a2
{
  id v3;
  id v4;
  objc_super v5;

  if (a1)
  {
    v3 = a2;
    objc_msgSend(a1, "hoverStyle");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5.receiver = a1;
    v5.super_class = (Class)UIControl;
    objc_msgSendSuper2(&v5, sel_setHoverStyle_, v3);

    if (v3)
    {
      if (v4 != v3)
        objc_msgSend(a1, "_registerCustomHoverStylePointerDriverIfNeeded");
    }

  }
}

- (void)_registerCustomHoverStylePointerDriverIfNeeded
{
  UIHoverStyle *v2;
  UIHoverStyle *v3;
  UIControl *v4;
  uint64_t v5;
  UIControl *v6;
  __int128 v7[7];
  _BYTE v8[120];

  v6 = self;
  v2 = -[UIView hoverStyle](v6, sel_hoverStyle);
  if (v2)
  {
    v3 = v2;
    v4 = v6;
    sub_1851E6D78(v4, (uint64_t)v8);
    sub_185223778((uint64_t)v8, (uint64_t)v7);
    v5 = swift_allocObject();
    sub_1851E5700(v7, v5 + 16);
    sub_185227960(1, (uint64_t)sub_185228880, v5);

    swift_release();
    sub_1851E6A78((uint64_t)v8);

  }
  else
  {

  }
}

- (void)setSymbolAnimationEnabled:(BOOL)symbolAnimationEnabled
{
  int v3;

  if (symbolAnimationEnabled)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_controlFlags = ($115ED1BCE1FB1BC1A4A0E4C8874C5931)(*(_DWORD *)&self->_controlFlags & 0xFFFBFFFF | v3);
}

- (id)_createPointerInteraction
{
  UIPointerInteraction *v3;

  v3 = -[UIPointerInteraction initWithDelegate:]([UIPointerInteraction alloc], "initWithDelegate:", self);
  -[UIPointerInteraction setEnabled:](v3, "setEnabled:", 0);
  if ((*((_BYTE *)&self->_controlFlags + 2) & 0x10) == 0)
    -[UIView addInteraction:](self, "addInteraction:", v3);
  objc_setAssociatedObject(self, &_UIControlPointerInteractionKey, v3, (void *)1);
  *(_DWORD *)&self->_controlFlags |= 0x80000u;
  return v3;
}

- (void)setPointerInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UIControl pointerInteraction](self, "pointerInteraction");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

}

- (UIPointerInteraction)pointerInteraction
{
  void *v3;

  if (-[UIControl _providesCustomPointerInteraction](self, "_providesCustomPointerInteraction"))
  {
    if ((*((_BYTE *)&self->_controlFlags + 2) & 8) != 0)
      objc_getAssociatedObject(self, &_UIControlPointerInteractionKey);
    else
      -[UIControl _createPointerInteraction](self, "_createPointerInteraction");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (UIPointerInteraction *)v3;
}

- (BOOL)_providesCustomPointerInteraction
{
  uint64_t v2;

  v2 = objc_opt_class();
  return v2 != objc_opt_class();
}

- (void)removeTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
  int v8;
  UIControlEvents v9;
  unint64_t v10;
  uint64_t v11;
  id WeakRetained;
  BOOL v13;
  id v14;

  v14 = target;
  v8 = -[NSMutableArray count](self->_targetActions, "count");
  if (v8 >= 1)
  {
    v9 = ~controlEvents;
    v10 = v8 + 1;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_targetActions, "objectAtIndex:", (v10 - 2));
      v11 = objc_claimAutoreleasedReturnValue();
      if (!v14
        || (WeakRetained = objc_loadWeakRetained((id *)(v11 + 16)), WeakRetained, WeakRetained == v14))
      {
        v13 = (*(_QWORD *)(v11 + 32) & v9) == 0;
        *(_QWORD *)(v11 + 32) &= v9;
        if (v13 && (!action || sel_isEqual(*(SEL *)(v11 + 24), action)))
          -[NSMutableArray removeObjectAtIndex:](self->_targetActions, "removeObjectAtIndex:", (v10 - 2));
      }

      --v10;
    }
    while (v10 > 1);
  }

}

- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
  id v8;
  char v9;
  void *v10;
  unsigned __int8 v11;
  id v12;
  UIControlTargetAction *v13;
  id obj;
  _QWORD block[4];
  id v16;
  UIControl *v17;

  v8 = target;
  if (!v8)
  {
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  v9 = dyld_program_sdk_at_least();
  v10 = v8;
  if ((v9 & 1) == 0)
  {
    v11 = objc_msgSend(v8, sel_allowsWeakReference);
    v10 = v8;
    if ((v11 & 1) == 0)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __47__UIControl_addTarget_action_forControlEvents___block_invoke;
      block[3] = &unk_1E16B1B50;
      v12 = v8;
      v16 = v12;
      v17 = self;
      if (addTarget_action_forControlEvents__once != -1)
      {
        dispatch_once(&addTarget_action_forControlEvents__once, block);
        v12 = v16;
      }

      goto LABEL_7;
    }
  }
LABEL_8:
  obj = v10;

  if (action && controlEvents)
  {
    v13 = objc_alloc_init(UIControlTargetAction);
    objc_storeWeak(&v13->_target, obj);
    v13->_action = action;
    v13->_eventMask = controlEvents;
    -[UIControl _addControlTargetAction:](self, "_addControlTargetAction:", v13);

  }
}

- (void)_addControlTargetAction:(id)a3
{
  NSMutableArray *targetActions;
  NSMutableArray *v5;
  NSMutableArray *v6;
  int v7;
  uint64_t v8;
  void *v9;
  id *v10;
  id v11;
  id v12;
  uint64_t v13;
  char v14;
  id WeakRetained;
  id v16;
  id v17;
  id v18;
  id *v19;

  v19 = (id *)a3;
  targetActions = self->_targetActions;
  if (!targetActions)
  {
    v5 = (NSMutableArray *)objc_opt_new();
    v6 = self->_targetActions;
    self->_targetActions = v5;

    targetActions = self->_targetActions;
  }
  v7 = -[NSMutableArray count](targetActions, "count");
  if (v7 >= 1)
  {
    v8 = v7 + 1;
    while (1)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_targetActions, "objectAtIndexedSubscript:", (v8 - 2));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v19;
      v11 = v9;
      v12 = v19[1];
      v13 = *((_QWORD *)v11 + 1);
      if (!v12)
        break;
      v14 = objc_msgSend(v12, "isEqual:", v13);

      if ((v14 & 1) != 0)
        goto LABEL_7;
LABEL_12:

      if ((unint64_t)--v8 <= 1)
        goto LABEL_16;
    }
    if (v13)
      goto LABEL_11;
    WeakRetained = objc_loadWeakRetained(v19 + 2);
    v16 = objc_loadWeakRetained((id *)v11 + 2);
    if (WeakRetained != v16)
    {

LABEL_11:
      goto LABEL_12;
    }
    v17 = v19[3];
    v18 = (id)*((_QWORD *)v11 + 3);

    if (v17 != v18)
      goto LABEL_12;
LABEL_7:
    v19[4] = (id)((unint64_t)v19[4] | *((_QWORD *)v11 + 4));
    -[NSMutableArray removeObjectAtIndex:](self->_targetActions, "removeObjectAtIndex:", (v8 - 2));
    goto LABEL_12;
  }
LABEL_16:
  -[NSMutableArray addObject:](self->_targetActions, "addObject:", v19);

}

- (void)addTarget:(id)a3 action:(SEL)a4 forEvents:(int)a5
{
  -[UIControl addTarget:action:forControlEvents:](self, "addTarget:action:forControlEvents:", a3, a4, a5);
}

- (UIControlContentHorizontalAlignment)contentHorizontalAlignment
{
  return (unint64_t)((unsigned __int16)*(_DWORD *)&self->_controlFlags >> 13);
}

- (void)setContentHorizontalAlignment:(UIControlContentHorizontalAlignment)contentHorizontalAlignment
{
  self->_controlFlags = ($115ED1BCE1FB1BC1A4A0E4C8874C5931)(*(_DWORD *)&self->_controlFlags & 0xFFFF1FFF | ((contentHorizontalAlignment & 7) << 13));
}

- (void)_setProxyPointerInteraction:(id)a3
{
  id v4;
  void *v5;
  id value;

  value = a3;
  -[UIControl _proxyPointerInteraction](self, "_proxyPointerInteraction");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != value)
  {
    objc_setAssociatedObject(self, &_UIControlProxyPointerInteractionKey, value, (void *)1);
    self->_controlFlags = ($115ED1BCE1FB1BC1A4A0E4C8874C5931)(*(_DWORD *)&self->_controlFlags & 0xFFEFFFFF | ((value != 0) << 20));
    -[UIControl pointerInteraction](self, "pointerInteraction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if ((*((_BYTE *)&self->_controlFlags + 2) & 0x10) != 0)
        -[UIView removeInteraction:](self, "removeInteraction:", v5);
      else
        -[UIView addInteraction:](self, "addInteraction:", v5);
    }

  }
}

- (void)setHoverStyle:(id)a3
{
  -[UIControl _setHoverStyle:implicit:](self, a3);
}

- (BOOL)isContextMenuInteractionEnabled
{
  void *v2;
  void *v3;
  BOOL v4;

  if ((*((_BYTE *)&self->_controlFlags + 2) & 0x20) != 0)
  {
    objc_getAssociatedObject(self, &_UIControlContextMenuInteractionKey);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)_hasActiveMenuPresentation
{
  return (*((unsigned __int8 *)&self->_controlFlags + 2) >> 6) & 1;
}

+ (unint64_t)_primaryStateForState:(unint64_t)a3
{
  unint64_t v3;
  unint64_t v4;

  v3 = 8;
  v4 = a3 & 2;
  if ((a3 & 4) != 0)
    v4 = 4;
  if ((a3 & 8) == 0)
    v3 = v4;
  if ((a3 & 1) != 0)
    return 1;
  else
    return v3;
}

- (BOOL)cancelTouchTracking
{
  if (-[UIControl isTracking](self, "isTracking"))
    -[UIControl cancelTrackingWithEvent:](self, "cancelTrackingWithEvent:", 0);
  return 1;
}

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIControl;
  -[UIView _didMoveFromWindow:toWindow:](&v6, sel__didMoveFromWindow_toWindow_, a3);
  if (!a4)
  {
    if (-[UIControl isTracking](self, "isTracking"))
      -[UIControl cancelTouchTracking](self, "cancelTouchTracking");
  }
}

- (BOOL)isTracking
{
  return (*(_BYTE *)&self->_controlFlags >> 1) & 1;
}

- (void)_sendActionsForEvents:(unint64_t)a3 withEvent:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id WeakRetained;
  os_activity_scope_state_s v16;

  v6 = a4;
  v7 = _os_activity_create(&dword_185066000, "send control actions", MEMORY[0x1E0C80FE0], OS_ACTIVITY_FLAG_DEFAULT);
  v16.opaque[0] = 0;
  v16.opaque[1] = 0;
  os_activity_scope_enter(v7, &v16);
  if ((-[UIControl _controlEventsForActionTriggered](self, "_controlEventsForActionTriggered") & a3) != 0)
    +[UIViewController _sendPrepareForTapGesture:]((uint64_t)UIViewController, self);
  -[UIControl _incrementStatisticsForUserActionForEvents:](self, "_incrementStatisticsForUserActionForEvents:", a3);
  v8 = (void *)-[NSMutableArray copy](self->_targetActions, "copy");
  v9 = objc_msgSend(v8, "count");
  if (v9 >= 1)
  {
    v10 = 0;
    v11 = v9;
    do
    {
      objc_msgSend(v8, "objectAtIndex:", v10);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      if ((*(_QWORD *)(v12 + 32) & a3) != 0)
      {
        if (*(_QWORD *)(v12 + 8))
        {
          -[UIControl sendAction:](self, "sendAction:");
        }
        else
        {
          v14 = *(_QWORD *)(v12 + 24);
          WeakRetained = objc_loadWeakRetained((id *)(v12 + 16));
          -[UIControl sendAction:to:forEvent:](self, "sendAction:to:forEvent:", v14, WeakRetained, v6);

        }
      }

      ++v10;
    }
    while (v11 != v10);
  }
  os_activity_scope_leave(&v16);
  if ((-[UIControl _controlEventsForActionTriggered](self, "_controlEventsForActionTriggered") & a3) != 0)
    -[UIControl _sendActionsForEvents:withEvent:](self, "_sendActionsForEvents:withEvent:", 0x2000, v6);

}

- (void)_incrementStatisticsForUserActionForEvents:(unint64_t)a3
{
  __int16 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  if (_configureDefaultStatisticHandling_onceToken == -1)
  {
    if ((a3 & 0x40) == 0)
      goto LABEL_6;
  }
  else
  {
    dispatch_once(&_configureDefaultStatisticHandling_onceToken, &__block_literal_global_12_10);
    if ((v3 & 0x40) == 0)
      goto LABEL_6;
  }
  -[UIControl _scalarStatisticsForUserTouchUpInsideEvent](self, "_scalarStatisticsForUserTouchUpInsideEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "incrementValueBy:", 1);

LABEL_6:
  if ((v3 & 0x1000) != 0)
  {
    -[UIControl _scalarStatisticsForUserValueChangedEvent](self, "_scalarStatisticsForUserValueChangedEvent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = v7;
      objc_msgSend(v7, "incrementValueBy:", 1);
      v7 = v8;
    }

  }
}

- (void)sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event
{
  id v8;
  UIEvent *v9;
  NSObject *v10;
  unint64_t v11;
  NSObject *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  v8 = target;
  v9 = event;
  if (os_variant_has_internal_diagnostics())
  {
    if (!UIApp)
    {
      __UIFaultDebugAssertLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v10, OS_LOG_TYPE_FAULT, "UIApp is nil which means we cannot dispatch control actions to their targets. If this assert is hit, we probably got here without UIApplicationMain() being executed, which likely means this code is not running in an app (perhaps a unit test being run without a host app) and will not work as expected.", buf, 2u);
      }

    }
  }
  else if (!UIApp)
  {
    v11 = sendAction_to_forEvent____s_category;
    if (!sendAction_to_forEvent____s_category)
    {
      v11 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v11, (unint64_t *)&sendAction_to_forEvent____s_category);
    }
    v12 = *(NSObject **)(v11 + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "UIApp is nil which means we cannot dispatch control actions to their targets. If this assert is hit, we probably got here without UIApplicationMain() being executed, which likely means this code is not running in an app (perhaps a unit test being run without a host app) and will not work as expected.", v13, 2u);
    }
  }
  objc_msgSend((id)UIApp, "sendAction:toTarget:fromSender:forEvent:", action, v8, self, v9);

}

- (void)addAction:(UIAction *)action forControlEvents:(UIControlEvents)controlEvents
{
  UIControlTargetAction *v7;
  uint64_t v8;
  UIAction *actionHandler;
  void *v10;
  void *v11;
  UIAction *v12;

  v12 = action;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIControl.m"), 812, CFSTR("Attempt to set nil action with event mask:%08lx"), controlEvents);

    if (controlEvents)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIControl.m"), 813, CFSTR("Attempt to set action '%@' with no event mask set"), v12);

    goto LABEL_3;
  }
  if (!controlEvents)
    goto LABEL_5;
LABEL_3:
  v7 = objc_alloc_init(UIControlTargetAction);
  -[UIAction _immutableCopy](v12, "_immutableCopy");
  v8 = objc_claimAutoreleasedReturnValue();
  actionHandler = v7->_actionHandler;
  v7->_actionHandler = (UIAction *)v8;

  v7->_eventMask = controlEvents;
  -[UIControl _addControlTargetAction:](self, "_addControlTargetAction:", v7);

}

- (void)_commonInitForPrimaryAction:(id)a3
{
  -[UIControl addAction:forControlEvents:](self, "addAction:forControlEvents:", a3, 0x2000);
}

- (void)setContentVerticalAlignment:(UIControlContentVerticalAlignment)contentVerticalAlignment
{
  self->_controlFlags = ($115ED1BCE1FB1BC1A4A0E4C8874C5931)(*(_DWORD *)&self->_controlFlags & 0xFFFFE3FF | ((contentVerticalAlignment & 7) << 10));
}

- (void)setRequiresDisplayOnTracking:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_controlFlags = ($115ED1BCE1FB1BC1A4A0E4C8874C5931)(*(_DWORD *)&self->_controlFlags & 0xFFFFFFEF | v3);
}

- (void)setHighlighted:(BOOL)highlighted
{
  $115ED1BCE1FB1BC1A4A0E4C8874C5931 controlFlags;
  unsigned int v5;
  int v6;

  controlFlags = self->_controlFlags;
  v5 = highlighted | ((*(unsigned int *)&controlFlags & 0x400000) >> 22);
  if ((*(_WORD *)&controlFlags & 0x100) != 0)
  {
    self->_controlFlags = ($115ED1BCE1FB1BC1A4A0E4C8874C5931)(*(_DWORD *)&controlFlags & 0xFFFFFEFF);
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__unhighlight, 0);
    controlFlags = self->_controlFlags;
  }
  if (((v5 ^ ((*(_BYTE *)&controlFlags & 0x20) == 0)) & 1) == 0 && (v5 & *(_DWORD *)&controlFlags & 1) == 0)
  {
    if (v5)
    {
      -[UIControl _setLastHighlightSuccessful:](self, "_setLastHighlightSuccessful:", 0);
      controlFlags = self->_controlFlags;
      v6 = 32;
    }
    else
    {
      v6 = 0;
    }
    self->_controlFlags = ($115ED1BCE1FB1BC1A4A0E4C8874C5931)(*(_DWORD *)&controlFlags & 0xFFFFFFDF | v6);
    if (-[UIControl requiresDisplayOnTracking](self, "requiresDisplayOnTracking"))
      -[UIView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)_setHasActiveMenuPresentation:(BOOL)a3
{
  $115ED1BCE1FB1BC1A4A0E4C8874C5931 controlFlags;
  int v4;

  controlFlags = self->_controlFlags;
  if (((((*(_DWORD *)&controlFlags & 0x400000) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 0x400000;
    else
      v4 = 0;
    self->_controlFlags = ($115ED1BCE1FB1BC1A4A0E4C8874C5931)(*(_DWORD *)&controlFlags & 0xFFBFFFFF | v4);
    -[UIControl setHighlighted:](self, "setHighlighted:");
  }
}

- (NSSet)allTargets
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id WeakRetained;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = self->_targetActions;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v8);
        WeakRetained = objc_loadWeakRetained((id *)(v9 + 16));

        if (WeakRetained)
        {
          v11 = (uint64_t)objc_loadWeakRetained((id *)(v9 + 16));
LABEL_8:
          v12 = (void *)v11;
          objc_msgSend(v3, "addObject:", v11, (_QWORD)v15);

          goto LABEL_10;
        }
        if (!*(_QWORD *)(v9 + 8))
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null", (_QWORD)v15);
          v11 = objc_claimAutoreleasedReturnValue();
          goto LABEL_8;
        }
LABEL_10:
        ++v8;
      }
      while (v6 != v8);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v6 = v13;
    }
    while (v13);
  }

  return (NSSet *)v3;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  objc_super v10;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (-[UIControl isEnabled](self, "isEnabled"))
  {
    v10.receiver = self;
    v10.super_class = (Class)UIControl;
    -[UIView hitTest:withEvent:](&v10, sel_hitTest_withEvent_, v7, x, y);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)enumerateEventHandlers:(void *)iterator
{
  NSMutableArray *targetActions;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v6 = iterator;
  targetActions = self->_targetActions;
  if (targetActions)
  {
    v5 = (void *)-[NSMutableArray copy](targetActions, "copy");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __36__UIControl_enumerateEventHandlers___block_invoke;
    v7[3] = &unk_1E16C2E10;
    v8 = v6;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

  }
}

- (void)_activateForAccessibilityHUDLiftAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  dispatch_time_t v8;
  _QWORD block[5];

  y = a3.y;
  x = a3.x;
  if (dyld_program_sdk_at_least()
    && -[UIControl isContextMenuInteractionEnabled](self, "isContextMenuInteractionEnabled")
    && -[UIControl showsMenuAsPrimaryAction](self, "showsMenuAsPrimaryAction")
    && (-[UIControl contextMenuInteraction](self, "contextMenuInteraction"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    -[UIControl contextMenuInteraction](self, "contextMenuInteraction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_presentMenuAtLocation:", x, y);

  }
  else
  {
    -[UIControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 64);
  }
  -[UIControl setHighlighted:](self, "setHighlighted:", 1);
  v8 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__UIControl_UIAccessibilityHUDGestureManager___activateForAccessibilityHUDLiftAtPoint___block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  dispatch_after(v8, MEMORY[0x1E0C80D38], block);
}

uint64_t __87__UIControl_UIAccessibilityHUDGestureManager___activateForAccessibilityHUDLiftAtPoint___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHighlighted:", 0);
}

- (UIControl)initWithFrame:(CGRect)frame primaryAction:(UIAction *)primaryAction
{
  double height;
  double width;
  double y;
  double x;
  UIAction *v9;
  UIControl *v10;
  UIControl *v11;

  height = frame.size.height;
  width = frame.size.width;
  y = frame.origin.y;
  x = frame.origin.x;
  v9 = primaryAction;
  v10 = -[UIControl initWithFrame:](self, "initWithFrame:", x, y, width, height);
  v11 = v10;
  if (v10)
    -[UIControl _commonInitForPrimaryAction:](v10, "_commonInitForPrimaryAction:", v9);

  return v11;
}

- (UIControl)initWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  UIControl *v5;
  int v6;
  int v7;
  const __CFString *v8;
  int controlFlags;
  int v10;
  void *v11;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  objc_super v18;

  v4 = coder;
  v18.receiver = self;
  v18.super_class = (Class)UIControl;
  v5 = -[UIView initWithCoder:](&v18, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_33;
  if (-[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIHighlighted")))
    v6 = 32;
  else
    v6 = 0;
  v5->_controlFlags = ($115ED1BCE1FB1BC1A4A0E4C8874C5931)(*(_DWORD *)&v5->_controlFlags & 0xFFFFFFDF | v6);
  if (-[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UISelected")))
    v7 = 512;
  else
    v7 = 0;
  v5->_controlFlags = ($115ED1BCE1FB1BC1A4A0E4C8874C5931)(*(_DWORD *)&v5->_controlFlags & 0xFFFFFDFF | v7);
  v5->_controlFlags = ($115ED1BCE1FB1BC1A4A0E4C8874C5931)(*(_DWORD *)&v5->_controlFlags & 0xFFFFE3FE | -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIDisabled")));
  if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIContentVerticalAlignment2")))
  {
    v8 = CFSTR("UIContentVerticalAlignment2");
  }
  else
  {
    if (!-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIContentVerticalAlignment")))
    {
      controlFlags = (int)v5->_controlFlags;
      goto LABEL_14;
    }
    v8 = CFSTR("UIContentVerticalAlignment");
  }
  controlFlags = *(_DWORD *)&v5->_controlFlags & 0xFFFFE3FF | ((-[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", v8) & 7) << 10);
LABEL_14:
  v5->_controlFlags = ($115ED1BCE1FB1BC1A4A0E4C8874C5931)(controlFlags & 0xFFFF1FFF);
  if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIContentHorizontalAlignment")))
    v5->_controlFlags = ($115ED1BCE1FB1BC1A4A0E4C8874C5931)(*(_DWORD *)&v5->_controlFlags & 0xFFFF1FFF | ((-[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UIContentHorizontalAlignment")) & 7) << 13));
  if (objc_msgSend((id)objc_opt_class(), "_allowActionsToQueue"))
    v10 = 128;
  else
    v10 = 0;
  v5->_controlFlags = ($115ED1BCE1FB1BC1A4A0E4C8874C5931)(*(_DWORD *)&v5->_controlFlags & 0xFFFFFF7F | v10);
  if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIToolTip")))
  {
    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIToolTip"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      -[UIControl setToolTip:](v5, "setToolTip:", v11);

  }
  v5->_requiredButtonMask = 1;
  if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIPointerInteractionEnabled")))
    -[UIControl setPointerInteractionEnabled:](v5, "setPointerInteractionEnabled:", -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIPointerInteractionEnabled")));
  if (dyld_program_sdk_at_least())
  {
    v12 = -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIContextMenuIsEnabled"));
    v13 = -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIContextMenuIsPrimary"));
    v14 = v13;
    if (v12 || (_DWORD)v13)
    {
      -[UIControl contextMenuInteraction](v5, "contextMenuInteraction");

      if ((*((_BYTE *)&v5->_controlFlags + 2) & 0x20) != 0)
      {
        objc_getAssociatedObject(v5, &_UIControlContextMenuInteractionKey);
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = (void *)v15;
          if (v12)
            -[UIView addInteraction:](v5, "addInteraction:", v15);
          objc_msgSend(v16, "_setPresentOnTouchDown:", v14);

        }
      }
    }
  }
LABEL_33:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  $115ED1BCE1FB1BC1A4A0E4C8874C5931 controlFlags;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UIControl;
  -[UIView encodeWithCoder:](&v12, sel_encodeWithCoder_, v4);
  controlFlags = self->_controlFlags;
  if ((*(_BYTE *)&controlFlags & 0x20) != 0)
  {
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UIHighlighted"));
    controlFlags = self->_controlFlags;
    if ((*(_WORD *)&controlFlags & 0x200) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&controlFlags & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_WORD *)&controlFlags & 0x200) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UISelected"));
  controlFlags = self->_controlFlags;
  if ((*(_BYTE *)&controlFlags & 1) != 0)
  {
LABEL_4:
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UIDisabled"));
    controlFlags = self->_controlFlags;
  }
LABEL_5:
  v6 = (*(unsigned int *)&controlFlags >> 10) & 7;
  if ((_DWORD)v6)
  {
    if (((*(unsigned int *)&controlFlags >> 10) & 6) != 4)
    {
      objc_msgSend(v4, "encodeInteger:forKey:");
      v6 = ((unint64_t)self->_controlFlags >> 10) & 7;
    }
    objc_msgSend(v4, "encodeInteger:forKey:", v6, CFSTR("UIContentVerticalAlignment2"));
    controlFlags = self->_controlFlags;
  }
  if (*(_WORD *)&controlFlags >> 13)
    objc_msgSend(v4, "encodeInteger:forKey:");
  if (-[UIControl isPointerInteractionEnabled](self, "isPointerInteractionEnabled"))
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UIPointerInteractionEnabled"));
  if ((*((_BYTE *)&self->_controlFlags + 2) & 0x20) != 0)
  {
    objc_getAssociatedObject(self, &_UIControlContextMenuInteractionKey);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8;
    if (v8)
    {
      objc_msgSend(v8, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UIContextMenuIsEnabled"));
      if (objc_msgSend(v7, "_presentOnTouchDown"))
        objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UIContextMenuIsPrimary"));
    }
  }
  else
  {
    v7 = 0;
  }
  -[UIControl toolTip](self, "toolTip");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[UIControl toolTip](self, "toolTip");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("UIToolTip"));

  }
}

- (BOOL)isTouchInside
{
  return (*(_BYTE *)&self->_controlFlags >> 2) & 1;
}

- (BOOL)cancelMouseTracking
{
  if (-[UIControl isTracking](self, "isTracking"))
  {
    -[UIControl setTracking:](self, "setTracking:", 0);
    if (-[UIControl isHighlighted](self, "isHighlighted"))
      -[UIControl setHighlighted:](self, "setHighlighted:", 0);
    -[UIControl _sendActionsForEvents:withEvent:](self, "_sendActionsForEvents:withEvent:", 256, 0);
  }
  return 1;
}

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
  return 1;
}

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
  return 1;
}

- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
  -[UIControl setTracking:](self, "setTracking:", 0, event);
}

- (void)cancelTrackingWithEvent:(UIEvent *)event
{
  UIEvent *v4;

  v4 = event;
  -[UIControl setTracking:](self, "setTracking:", 0);
  if (-[UIControl isHighlighted](self, "isHighlighted"))
    -[UIControl setHighlighted:](self, "setHighlighted:", 0);
  -[UIControl _sendActionsForEvents:withEvent:](self, "_sendActionsForEvents:withEvent:", 256, v4);

}

- (id)hitTest:(CGPoint)a3 forEvent:(__GSEvent *)a4
{
  double y;
  double x;
  void *v8;
  objc_super v10;

  y = a3.y;
  x = a3.x;
  if (-[UIControl isEnabled](self, "isEnabled"))
  {
    v10.receiver = self;
    v10.super_class = (Class)UIControl;
    -[UIView hitTest:forEvent:](&v10, sel_hitTest_forEvent_, a4, x, y);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  $115ED1BCE1FB1BC1A4A0E4C8874C5931 controlFlags;
  objc_super v14;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  if ((_UITouchesContainsTouchFromCarTouchpad(v6) & 1) != 0)
    goto LABEL_2;
  v8 = -[UIControl _requiredButtonMask](self, "_requiredButtonMask");
  v9 = v7;
  if (objc_msgSend(v9, "_buttonMask"))
  {
    v10 = objc_msgSend(v9, "_buttonMask") & v8;

    if (!v10)
    {
LABEL_2:
      -[UIResponder touchesBegan:withEvent:](&v15, sel_touchesBegan_withEvent_, v6, v7, v14.receiver, v14.super_class, self, UIControl);
      goto LABEL_16;
    }
  }
  else
  {

  }
  if (-[UIControl shouldTrack](self, "shouldTrack"))
  {
    objc_msgSend(v9, "_firstTouchForView:", self);
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      -[UIControl setTracking:](self, "setTracking:", -[UIControl beginTrackingWithTouch:withEvent:](self, "beginTrackingWithTouch:withEvent:", v11, v9));
      if (-[UIControl isTracking](self, "isTracking"))
      {
        controlFlags = self->_controlFlags;
        self->_controlFlags = ($115ED1BCE1FB1BC1A4A0E4C8874C5931)(*(_DWORD *)&controlFlags & 0xFFFFFFF3 | 4);
        if ((*(_BYTE *)&controlFlags & 0x40) == 0)
        {
          self->_downTime = CFAbsoluteTimeGetCurrent();
          -[UIControl setHighlighted:](self, "setHighlighted:", 1);
        }
        -[UIControl _sendActionsForEvents:withEvent:](self, "_sendActionsForEvents:withEvent:", 1, v9);
        if ((unint64_t)objc_msgSend(v12, "tapCount") >= 2)
          -[UIControl _sendActionsForEvents:withEvent:](self, "_sendActionsForEvents:withEvent:", 2, v9);
      }
      -[UIResponder _controlTouchBegan:withEvent:](self, "_controlTouchBegan:withEvent:", v12, v9);

    }
  }
  else
  {
    -[UIResponder touchesBegan:withEvent:](&v14, sel_touchesBegan_withEvent_, v6, v9, self, UIControl, v15.receiver, v15.super_class);
  }
LABEL_16:

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  _BOOL8 v10;
  _BOOL4 v11;
  $115ED1BCE1FB1BC1A4A0E4C8874C5931 controlFlags;
  int v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  if (-[UIControl isTracking](self, "isTracking"))
  {
    objc_msgSend(v7, "_firstTouchForView:", self);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      -[UIControl setTracking:](self, "setTracking:", -[UIControl continueTrackingWithTouch:withEvent:](self, "continueTrackingWithTouch:withEvent:", v8, v7));
      if (-[UIControl isTracking](self, "isTracking"))
      {
        objc_msgSend(v9, "locationInView:", self);
        v10 = -[UIControl pointMostlyInside:withEvent:](self, "pointMostlyInside:withEvent:", v7);
        v11 = -[UIControl isTouchInside](self, "isTouchInside");
        controlFlags = self->_controlFlags;
        if (v10)
          v13 = 4;
        else
          v13 = 0;
        self->_controlFlags = ($115ED1BCE1FB1BC1A4A0E4C8874C5931)(*(_DWORD *)&controlFlags & 0xFFFFFFFB | v13);
        if ((*(_BYTE *)&controlFlags & 0x40) == 0 || !v10)
          -[UIControl setHighlighted:](self, "setHighlighted:", v10);
        if (v11 != -[UIControl isTouchInside](self, "isTouchInside"))
        {
          if (-[UIControl isTouchInside](self, "isTouchInside"))
            v14 = 16;
          else
            v14 = 32;
          -[UIControl _sendActionsForEvents:withEvent:](self, "_sendActionsForEvents:withEvent:", v14, v7);
        }
        *(_DWORD *)&self->_controlFlags |= 8u;
        if (-[UIControl isTouchInside](self, "isTouchInside"))
          v15 = 4;
        else
          v15 = 8;
        -[UIControl _sendActionsForEvents:withEvent:](self, "_sendActionsForEvents:withEvent:", v15, v7);
      }
      -[UIResponder _controlTouchMoved:withEvent:](self, "_controlTouchMoved:withEvent:", v9, v7);

    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)UIControl;
    -[UIResponder touchesMoved:withEvent:](&v16, sel_touchesMoved_withEvent_, v6, v7);
  }

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  double Current;
  _BOOL4 v12;
  int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;

  v6 = a3;
  v7 = a4;
  if (!-[UIControl isTracking](self, "isTracking"))
  {
    v26.receiver = self;
    v26.super_class = (Class)UIControl;
    -[UIResponder touchesEnded:withEvent:](&v26, sel_touchesEnded_withEvent_, v6, v7);
LABEL_30:
    -[UIControl _setTouchHasHighlighted:](self, "_setTouchHasHighlighted:", 0);
    goto LABEL_31;
  }
  objc_msgSend(v7, "_firstTouchForView:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, "locationInView:", self);
    v10 = -[UIControl pointMostlyInside:withEvent:](self, "pointMostlyInside:withEvent:", v7);
    Current = 0.0;
    if (-[UIControl isHighlighted](self, "isHighlighted"))
    {
      v12 = 0;
    }
    else
    {
      v12 = (*(_BYTE *)&self->_controlFlags & 0x40) == 0;
      if ((*(_BYTE *)&self->_controlFlags & 0x40) == 0 && v10)
      {
        Current = CFAbsoluteTimeGetCurrent();
        v12 = 1;
        -[UIControl setHighlighted:](self, "setHighlighted:", 1);
      }
    }
    if (v10 != -[UIControl isTouchInside](self, "isTouchInside"))
    {
      if (v10)
        v14 = 4;
      else
        v14 = 0;
      self->_controlFlags = ($115ED1BCE1FB1BC1A4A0E4C8874C5931)(*(_DWORD *)&self->_controlFlags & 0xFFFFFFFB | v14);
      if (-[UIControl isTouchInside](self, "isTouchInside"))
        v15 = 16;
      else
        v15 = 32;
      -[UIControl _sendActionsForEvents:withEvent:](self, "_sendActionsForEvents:withEvent:", v15, v7);
    }
    -[UIControl endTrackingWithTouch:withEvent:](self, "endTrackingWithTouch:withEvent:", v9, v7);
    -[UIControl setTracking:](self, "setTracking:", 0);
    *(_DWORD *)&self->_controlFlags &= ~8u;
    if (v10)
      v16 = 64;
    else
      v16 = 128;
    -[UIControl _sendActionsForEvents:withEvent:](self, "_sendActionsForEvents:withEvent:", v16, v7);
    +[UIEventSessionActionAnalytics sharedInstance](UIEventSessionActionAnalytics, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v7;
    else
      v18 = 0;
    objc_msgSend(v18, "_firstTouchForView:", self);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "didTap:withSource:", self, +[_UIEventSessionAction getUIEventSourceForUITouchType:](_UIEventSessionAction, "getUIEventSourceForUITouchType:", objc_msgSend(v19, "type")));

    if (v12 && (v20 = CFAbsoluteTimeGetCurrent() - Current, v20 < 0.12))
    {
      *(_DWORD *)&self->_controlFlags |= 0x100u;
      v21 = (void *)MEMORY[0x1E0C99E20];
      objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "currentMode");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setWithObjects:", v23, *MEMORY[0x1E0C99748], 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v24, "allObjects");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIControl performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", sel__unhighlight, 0, v25, 0.12 - v20);

    }
    else
    {
      -[UIControl _setLastHighlightSuccessful:](self, "_setLastHighlightSuccessful:", v10);
      -[UIControl setHighlighted:](self, "setHighlighted:", 0);
    }
    *(_DWORD *)&self->_controlFlags &= ~4u;
    -[UIResponder _controlTouchEnded:withEvent:](self, "_controlTouchEnded:withEvent:", v9, v7);

    goto LABEL_30;
  }
LABEL_31:

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v5;

  v5 = a4;
  if (-[UIControl isTracking](self, "isTracking"))
    -[UIControl cancelTrackingWithEvent:](self, "cancelTrackingWithEvent:", v5);
  -[UIControl _setTouchHasHighlighted:](self, "_setTouchHasHighlighted:", 0);

}

void __47__UIControl_addTarget_action_forControlEvents___block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = _UIInternalPreference_ContextMenuScrollTruncationDetentsEnabled_block_invoke___s_category;
  if (!_UIInternalPreference_ContextMenuScrollTruncationDetentsEnabled_block_invoke___s_category)
  {
    v2 = __UILogCategoryGetNode("Warning", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&_UIInternalPreference_ContextMenuScrollTruncationDetentsEnabled_block_invoke___s_category);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = 138412546;
    v7 = v4;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_ERROR, "You are trying to set a deallocating object as a target. This will be a hard crash in the future. Offending object: %@ hostObject: %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)removeAction:(UIAction *)action forControlEvents:(UIControlEvents)controlEvents
{
  int v6;
  UIControlEvents v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  BOOL v12;
  UIAction *v13;

  v13 = action;
  v6 = -[NSMutableArray count](self->_targetActions, "count");
  if (v6 >= 1)
  {
    v7 = ~controlEvents;
    v8 = v6 + 1;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_targetActions, "objectAtIndexedSubscript:", (v8 - 2));
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(id *)(v9 + 8);
      v11 = v10;
      if (v10)
      {
        if (objc_msgSend(v10, "isEqual:", v13))
        {
          v12 = (*(_QWORD *)(v9 + 32) & v7) == 0;
          *(_QWORD *)(v9 + 32) &= v7;
          if (v12)
            -[NSMutableArray removeObjectAtIndex:](self->_targetActions, "removeObjectAtIndex:", (v8 - 2));
        }
      }

      --v8;
    }
    while (v8 > 1);
  }

}

- (void)removeActionForIdentifier:(UIActionIdentifier)actionIdentifier forControlEvents:(UIControlEvents)controlEvents
{
  int v7;
  UIControlEvents v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  BOOL v15;
  void *v16;
  NSString *v17;

  v17 = actionIdentifier;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIControl.m"), 853, CFSTR("Attempt to remove action handlers for a nil identifier with event mask:%08lx"), controlEvents);

  }
  v7 = -[NSMutableArray count](self->_targetActions, "count");
  if (v7 >= 1)
  {
    v8 = ~controlEvents;
    v9 = v7 + 1;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_targetActions, "objectAtIndexedSubscript:", (v9 - 2));
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(id *)(v10 + 8);
      v12 = v11;
      if (v11)
      {
        objc_msgSend(v11, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v17);

        if (v14)
        {
          v15 = (*(_QWORD *)(v10 + 32) & v8) == 0;
          *(_QWORD *)(v10 + 32) &= v8;
          if (v15)
            -[NSMutableArray removeObjectAtIndex:](self->_targetActions, "removeObjectAtIndex:", (v9 - 2));
        }
      }

      --v9;
    }
    while (v9 > 1);
  }

}

- (void)performPrimaryAction
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  if (-[UIControl showsMenuAsPrimaryAction](self, "showsMenuAsPrimaryAction"))
  {
    if ((*((_BYTE *)&self->_controlFlags + 2) & 0x20) != 0)
    {
      objc_getAssociatedObject(self, &_UIControlContextMenuInteractionKey);
      v3 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
    v8 = (id)v3;
    -[UIView bounds](self, "bounds");
    objc_msgSend(v8, "_presentMenuAtLocation:", v5 + v4 * 0.5, v7 + v6 * 0.5);

  }
  else
  {
    -[UIControl _sendActionsForEvents:withEvent:](self, "_sendActionsForEvents:withEvent:", 0x2000, 0);
  }
}

- (id)_allTargetActions
{
  return self->_targetActions;
}

- (UIControlEvents)allControlEvents
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  UIControlEvents v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_targetActions;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 |= *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i) + 32);
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSArray)actionsForTarget:(id)target forControlEvent:(UIControlEvents)controlEvent
{
  id v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id WeakRetained;
  void *v15;
  UIControlEvents v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = target;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = self->_targetActions;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (!v8)
  {
    v10 = 0;
    goto LABEL_19;
  }
  v9 = v8;
  v10 = 0;
  v11 = *(_QWORD *)v20;
  do
  {
    v12 = 0;
    do
    {
      if (*(_QWORD *)v20 != v11)
        objc_enumerationMutation(v7);
      v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v12);
      WeakRetained = objc_loadWeakRetained((id *)(v13 + 16));
      if (WeakRetained != v6)
      {
        v15 = WeakRetained;
LABEL_8:

        goto LABEL_9;
      }
      v16 = controlEvent & ~*(_QWORD *)(v13 + 32);

      if (!v16)
      {
        NSStringFromSelector(*(SEL *)(v13 + 24));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          if (!v10)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array", (_QWORD)v19);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v10, "addObject:", v15, (_QWORD)v19);
        }
        goto LABEL_8;
      }
LABEL_9:
      ++v12;
    }
    while (v9 != v12);
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    v9 = v17;
  }
  while (v17);
LABEL_19:

  return (NSArray *)v10;
}

void __36__UIControl_enumerateEventHandlers___block_invoke(uint64_t a1, id *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  id v6;
  id *v7;
  id *v8;
  id v9;
  id v10;
  id WeakRetained;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a2[1];
  v7 = a2 + 2;
  v8 = a2;
  WeakRetained = objc_loadWeakRetained(v7);
  v9 = v8[3];
  v10 = v8[4];

  (*(void (**)(uint64_t, id, id, id, id, uint64_t))(v5 + 16))(v5, v6, WeakRetained, v9, v10, a4);
}

- (void)sendAction:(UIAction *)action
{
  -[UIAction performWithSender:target:](action, "performWithSender:target:", self, 0);
}

- (void)sendActionsForControlEvents:(UIControlEvents)controlEvents
{
  -[UIControl _sendActionsForEvents:withEvent:](self, "_sendActionsForEvents:withEvent:", controlEvents, 0);
}

- (BOOL)canBecomeFirstResponder
{
  objc_super v4;

  if (_UIDeviceHasExternalTouchInput())
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)UIControl;
  return -[UIResponder canBecomeFirstResponder](&v4, sel_canBecomeFirstResponder);
}

- (double)_highlightCornerRadius
{
  double v2;
  double v3;
  double v4;

  -[UIControl _clippedHighlightBounds](self, "_clippedHighlightBounds");
  if (v2 >= v3)
    v4 = v3;
  else
    v4 = v2;
  return v4 * 0.5;
}

- (BOOL)_hasActionForEventMask:(unint64_t)a3
{
  int v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  unint64_t v14;

  v5 = -[NSMutableArray count](self->_targetActions, "count");
  if (v5 < 1)
    return 0;
  -[NSMutableArray objectAtIndex:](self->_targetActions, "objectAtIndex:", 0);
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v7 = v6[4] & a3;

  if (v7)
    return 1;
  v9 = v5;
  v10 = v5;
  v11 = 1;
  do
  {
    v12 = v11;
    if (v10 == v11)
      break;
    -[NSMutableArray objectAtIndex:](self->_targetActions, "objectAtIndex:", v11);
    v13 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v14 = v13[4] & a3;

    v11 = v12 + 1;
  }
  while (!v14);
  return v12 < v9;
}

- (unint64_t)_controlEventsForActionTriggered
{
  return 0;
}

- (void)_setHighlightOnMouseDown:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0;
  else
    v3 = 64;
  self->_controlFlags = ($115ED1BCE1FB1BC1A4A0E4C8874C5931)(*(_DWORD *)&self->_controlFlags & 0xFFFFFFBF | v3);
}

- (BOOL)pointMostlyInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  double v8;
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
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  CGFloat v28;
  double v29;
  BOOL v30;
  CGPoint v32;
  CGRect v33;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[UIView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[UIView _touchInsets](self, "_touchInsets");
  v17 = v9 + v16;
  v19 = v11 + v18;
  v21 = v13 - (v16 + v20);
  v23 = v15 - (v18 + v22);
  v24 = _UIControlMostlyInsideEdgeInsets();
  v25 = v19 + v24;
  v28 = v21 - (v26 + v27);
  v33.size.height = v23 - (v24 + v29);
  v33.origin.x = v17 + v26;
  v33.origin.y = v25;
  v33.size.width = v28;
  v32.x = x;
  v32.y = y;
  v30 = CGRectContainsPoint(v33, v32) || -[UIView pointInside:withEvent:](self, "pointInside:withEvent:", v7, x, y);

  return v30;
}

- (void)_setLastHighlightSuccessful:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_controlFlags = ($115ED1BCE1FB1BC1A4A0E4C8874C5931)(*(_DWORD *)&self->_controlFlags & 0xFFFEFFFF | v3);
}

- (BOOL)_wasLastHighlightSuccessful
{
  return *((_BYTE *)&self->_controlFlags + 2) & 1;
}

- (void)_setTouchHasHighlighted:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_controlFlags = ($115ED1BCE1FB1BC1A4A0E4C8874C5931)(*(_DWORD *)&self->_controlFlags & 0xFFFDFFFF | v3);
}

- (BOOL)shouldTrack
{
  _BOOL4 v3;

  v3 = -[UIControl isEnabled](self, "isEnabled");
  if (v3)
    LOBYTE(v3) = -[UIView isUserInteractionEnabled](self, "isUserInteractionEnabled");
  return v3;
}

- (BOOL)touchDragged
{
  return (*(_BYTE *)&self->_controlFlags >> 3) & 1;
}

- (BOOL)requiresDisplayOnTracking
{
  return (*(_BYTE *)&self->_controlFlags >> 4) & 1;
}

- (BOOL)hasOneOrMoreTargets
{
  return -[NSMutableArray count](self->_targetActions, "count") != 0;
}

- (void)removeTarget:(id)a3 forEvents:(int)a4
{
  -[UIControl removeTarget:action:forControlEvents:](self, "removeTarget:action:forControlEvents:", a3, 0, a4);
}

- (void)setTracking:(BOOL)a3
{
  int v3;

  if (((((*(_DWORD *)&self->_controlFlags & 2) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v3 = 2;
    else
      v3 = 0;
    self->_controlFlags = ($115ED1BCE1FB1BC1A4A0E4C8874C5931)(*(_DWORD *)&self->_controlFlags & 0xFFFFFFFD | v3);
    if (a3)
      -[UIControl _beginInteractionDurationStatisticMeasurements](self, "_beginInteractionDurationStatisticMeasurements");
    else
      -[UIControl _commitInteractionDurationStatisticMeasurements](self, "_commitInteractionDurationStatisticMeasurements");
  }
}

- (void)_unhighlight
{
  -[UIControl setHighlighted:](self, "setHighlighted:", 0);
}

- (BOOL)canBecomeFocused
{
  void *v3;
  char v4;

  -[UIView _focusBehavior](self, "_focusBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "controlCanBecomeFocused:", self);

  return v4 & -[UIControl isEnabled](self, "isEnabled");
}

- (id)_systemDefaultFocusGroupIdentifier
{
  void *v3;
  char v4;
  void *v5;
  objc_super v7;

  -[UIView _focusBehavior](self, "_focusBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "focusGroupContainmentBehavior");

  if ((v4 & 0x10) != 0)
  {
    _UIFocusGroupIdentifierForInstance(self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIControl;
    -[UIView _systemDefaultFocusGroupIdentifier](&v7, sel__systemDefaultFocusGroupIdentifier);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)_diagnoseFocusabilityForReport:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if ((-[UIControl state](self, "state") & 2) != 0)
  {
    +[_UIDebugIssue issueWithDescription:](_UIDebugIssue, "issueWithDescription:", CFSTR("This control is disabled."));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addIssue:", v4);

  }
}

- (int64_t)_focusedSound
{
  return 1;
}

- (unint64_t)_stateForFocusUpdateContext:(id)a3
{
  id v4;
  UIControlState v5;
  UIControl *v6;
  _BOOL4 v7;
  uint64_t v8;
  unint64_t v9;

  v4 = a3;
  v5 = -[UIControl state](self, "state");
  if (v4)
  {
    objc_msgSend(v4, "nextFocusedView");
    v6 = (UIControl *)objc_claimAutoreleasedReturnValue();
    v7 = v6 == self;

  }
  else
  {
    v7 = -[UIView isFocused](self, "isFocused");
  }
  v8 = 8;
  if (!v7)
    v8 = 0;
  v9 = v8 | v5 & 0xFFFFFFFFFFFFFFF7;

  return v9;
}

- (BOOL)_accessibilityShouldActivateOnHUDLift
{
  return 0;
}

- (BOOL)isSymbolAnimationEnabled
{
  return (*((unsigned __int8 *)&self->_controlFlags + 2) >> 2) & 1;
}

- (BOOL)isPointerInteractionEnabled
{
  void *v2;
  char v3;

  -[UIControl pointerInteraction](self, "pointerInteraction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabled");

  return v3;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return 0;
}

- (void)_setImplicitHoverStyle:(id)a3
{
  -[UIControl _setHoverStyle:implicit:](self, a3);
}

- (NSString)toolTip
{
  return 0;
}

- (UIToolTipInteraction)toolTipInteraction
{
  return 0;
}

- (id)_contextMenuInteraction
{
  if ((*((_BYTE *)&self->_controlFlags + 2) & 0x20) == 0)
    return 0;
  objc_getAssociatedObject(self, &_UIControlContextMenuInteractionKey);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CGPoint)menuAttachmentPointForConfiguration:(UIContextMenuConfiguration *)configuration
{
  UIContextMenuConfiguration *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGPoint result;

  v4 = configuration;
  -[UIView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[UIView window](self, "window");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView convertRect:toView:](self, "convertRect:toView:", v13, v6, v8, v10, v12);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  LODWORD(v13) = -[UIContextMenuConfiguration prefersHorizontalAttachment](v4, "prefersHorizontalAttachment");
  -[UIView window](self, "window");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if ((_DWORD)v13)
    v24 = _UIControlMenuAttachmentPointForRectInContainerForHorizontalAttachment(v22, v15, v17, v19, v21);
  else
    v24 = _UIControlMenuAttachmentPointForRectInContainer(v22, v15, v17, v19, v21);
  v26 = v24;
  v27 = v25;

  v28 = v26;
  v29 = v27;
  result.y = v29;
  result.x = v28;
  return result;
}

- (id)_proxySender
{
  void *v2;
  void *v3;

  if ((*((_BYTE *)&self->_controlFlags + 2) & 0x20) != 0)
  {
    objc_getAssociatedObject(self, &_UIControlContextMenuInteractionKey);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  objc_msgSend(v2, "_proxySender");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setProxySender:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if ((*((_BYTE *)&self->_controlFlags + 2) & 0x20) != 0)
  {
    objc_getAssociatedObject(self, &_UIControlContextMenuInteractionKey);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(v4, "_setProxySender:", v5);

}

- (UIContextMenuConfiguration)contextMenuInteraction:(UIContextMenuInteraction *)interaction configurationForMenuAtLocation:(CGPoint)location
{
  return 0;
}

- (UITargetedPreview)contextMenuInteraction:(UIContextMenuInteraction *)interaction previewForHighlightingMenuWithConfiguration:(UIContextMenuConfiguration *)configuration
{
  return 0;
}

- (UITargetedPreview)contextMenuInteraction:(UIContextMenuInteraction *)interaction previewForDismissingMenuWithConfiguration:(UIContextMenuConfiguration *)configuration
{
  return 0;
}

- (void)contextMenuInteraction:(UIContextMenuInteraction *)interaction willEndForConfiguration:(UIContextMenuConfiguration *)configuration animator:(id)animator
{
  UIContextMenuConfiguration *v8;
  id v9;
  UIContextMenuInteraction *v10;
  UIContextMenuInteraction *v11;

  v11 = interaction;
  v8 = configuration;
  v9 = animator;
  if ((*((_BYTE *)&self->_controlFlags + 2) & 0x20) != 0)
  {
    objc_getAssociatedObject(self, &_UIControlContextMenuInteractionKey);
    v10 = (UIContextMenuInteraction *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  if (v8 && v10 == v11)
    -[UIControl _setHasActiveMenuPresentation:](self, "_setHasActiveMenuPresentation:", 0);

}

- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;

  v6 = a3;
  v7 = a4;
  if ((*((_BYTE *)&self->_controlFlags + 2) & 0x20) != 0)
  {
    objc_getAssociatedObject(self, &_UIControlContextMenuInteractionKey);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  if (v8 == v6)
  {
    if (dyld_program_sdk_at_least())
    {
      -[UIView _containingScrollView](self, "_containingScrollView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10 != 0;

    }
    else
    {
      v11 = 0;
    }
    _UIControlMenuSupportDefaultMenuStyle(v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIControl contextMenuInteraction](self, "contextMenuInteraction");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIControl contextMenuInteraction:previewForHighlightingMenuWithConfiguration:](self, "contextMenuInteraction:previewForHighlightingMenuWithConfiguration:", v12, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIControl menuAttachmentPointForConfiguration:](self, "menuAttachmentPointForConfiguration:", v7);
    v15 = v14;
    v17 = v16;
    if (objc_msgSend(v7, "prefersHorizontalAttachment"))
      _UIControlMenuSupportUpdateStyleWithHorizontalPreference(v9, self, v13, v15, v17);
    else
      _UIControlMenuSupportUpdateStyle(v9, self, v13, v15, v17);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_contextMenuInteraction:(id)a3 configuration:(id)a4 interactionEffectForTargetedPreview:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((*((_BYTE *)&self->_controlFlags + 2) & 0x20) != 0)
  {
    objc_getAssociatedObject(self, &_UIControlContextMenuInteractionKey);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  if (v11 == v8)
  {
    +[_UINullClickHighlightEffect effectWithPreview:continuingFromPreview:](_UINullClickHighlightEffect, "effectWithPreview:continuingFromPreview:", v10, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)_contextMenuInteraction:(id)a3 willBeginWithConfiguration:(id)a4
{
  if (a4)
  {
    -[UIControl _setHasActiveMenuPresentation:](self, "_setHasActiveMenuPresentation:", 1);
    -[UIControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x4000);
  }
}

- (int64_t)_sceneDraggingBehaviorOnPan
{
  return 2;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v5;
  void *v6;

  -[UIControl _safeHoverStyle](self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[UIView hoverStyle](self, "hoverStyle");
    else
      +[UIPointerStyle _makeStyleWithHoverStyle:view:convertAutomatic:](UIPointerStyle, "_makeStyleWithHoverStyle:view:convertAutomatic:", v5, self, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int64_t)_requiredButtonMask
{
  return self->_requiredButtonMask;
}

- (void)_setRequiredButtonMask:(int64_t)a3
{
  self->_requiredButtonMask = a3;
}

- (void)_connectInterfaceBuilderEventConnection:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "target");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "action");
  v6 = objc_msgSend(v4, "eventMask");

  -[UIControl addTarget:action:forControlEvents:](self, "addTarget:action:forControlEvents:", v7, v5, v6);
}

- (id)__scalarStatisticsForUserTouchUpInsideEvent
{
  return 0;
}

- (id)__scalarStatisticsForUserValueChangedEvent
{
  return 0;
}

- (id)__distributionStatisticsForUserInteractionDuration
{
  return 0;
}

- (id)_scalarStatisticsForUserTouchUpInsideEvent
{
  if (_configureDefaultStatisticHandling_onceToken != -1)
    dispatch_once(&_configureDefaultStatisticHandling_onceToken, &__block_literal_global_12_10);
  return -[UIControl __scalarStatisticsForUserTouchUpInsideEvent](self, "__scalarStatisticsForUserTouchUpInsideEvent");
}

- (id)_scalarStatisticsForUserValueChangedEvent
{
  if (_configureDefaultStatisticHandling_onceToken != -1)
    dispatch_once(&_configureDefaultStatisticHandling_onceToken, &__block_literal_global_12_10);
  return -[UIControl __scalarStatisticsForUserValueChangedEvent](self, "__scalarStatisticsForUserValueChangedEvent");
}

- (id)_distributionStatisticsForUserInteractionDuration
{
  if (_configureDefaultStatisticHandling_onceToken != -1)
    dispatch_once(&_configureDefaultStatisticHandling_onceToken, &__block_literal_global_12_10);
  return -[UIControl __distributionStatisticsForUserInteractionDuration](self, "__distributionStatisticsForUserInteractionDuration");
}

- (void)_beginInteractionDurationStatisticMeasurements
{
  void *v3;
  id v4;

  if (_configureDefaultStatisticHandling_onceToken != -1)
    dispatch_once(&_configureDefaultStatisticHandling_onceToken, &__block_literal_global_12_10);
  -[UIControl _distributionStatisticsForUserInteractionDuration](self, "_distributionStatisticsForUserInteractionDuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "startTimingForObject:", self);
    v3 = v4;
  }

}

- (void)_commitInteractionDurationStatisticMeasurements
{
  void *v3;
  id v4;

  if (_configureDefaultStatisticHandling_onceToken != -1)
    dispatch_once(&_configureDefaultStatisticHandling_onceToken, &__block_literal_global_12_10);
  -[UIControl _distributionStatisticsForUserInteractionDuration](self, "_distributionStatisticsForUserInteractionDuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "recordTimingForObject:", self);
    v3 = v4;
  }

}

@end
