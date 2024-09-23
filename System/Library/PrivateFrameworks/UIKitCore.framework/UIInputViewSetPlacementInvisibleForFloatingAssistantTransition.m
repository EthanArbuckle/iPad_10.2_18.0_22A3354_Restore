@implementation UIInputViewSetPlacementInvisibleForFloatingAssistantTransition

+ (id)placementWithPlacement:(id)a3
{
  id v5;
  id *v6;
  id *v7;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend(v5, "isVisible") & 1) == 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        v12 = 136315138;
        v13 = "+[UIInputViewSetPlacementInvisibleForFloatingAssistantTransition placementWithPlacement:]";
        _os_log_fault_impl(&dword_185066000, v11, OS_LOG_TYPE_FAULT, "%s: Should not be called with an invisible placement", (uint8_t *)&v12, 0xCu);
      }

    }
    else
    {
      v9 = placementWithPlacement____s_category_322;
      if (!placementWithPlacement____s_category_322)
      {
        v9 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v9, (unint64_t *)&placementWithPlacement____s_category_322);
      }
      v10 = *(NSObject **)(v9 + 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v12 = 136315138;
        v13 = "+[UIInputViewSetPlacementInvisibleForFloatingAssistantTransition placementWithPlacement:]";
        _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "%s: Should not be called with an invisible placement", (uint8_t *)&v12, 0xCu);
      }
    }
  }
  v6 = (id *)objc_alloc_init((Class)a1);
  v7 = v6;
  if (v6)
    objc_storeStrong(v6 + 5, a3);

  return v7;
}

- (BOOL)isFloatingAssistantView
{
  return -[UIInputViewSetPlacement isFloatingAssistantView](self->super.super._actualPlacement, "isFloatingAssistantView");
}

- (BOOL)isCompactAssistantView
{
  return -[UIInputViewSetPlacement isCompactAssistantView](self->super.super._actualPlacement, "isCompactAssistantView");
}

- (id)subPlacements
{
  void *v3;
  uint64_t v4;
  UIInputViewSetPlacementInvisibleForFloatingAssistantTransition *cachedSecondaryPlacement;
  void *v6;
  void *v7;
  UIInputViewSetPlacementInvisibleForFloatingAssistantTransition *v8;
  UIInputViewSetPlacementInvisibleForFloatingAssistantTransition *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[UIInputViewSetPlacement subPlacements](self->super.super._actualPlacement, "subPlacements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    cachedSecondaryPlacement = self->_cachedSecondaryPlacement;
    if (!cachedSecondaryPlacement)
    {
      -[UIInputViewSetPlacement subPlacements](self->super.super._actualPlacement, "subPlacements");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIInputViewSetPlacementInvisibleForFloatingAssistantTransition placementWithPlacement:](UIInputViewSetPlacementInvisibleForFloatingAssistantTransition, "placementWithPlacement:", v7);
      v8 = (UIInputViewSetPlacementInvisibleForFloatingAssistantTransition *)objc_claimAutoreleasedReturnValue();
      v9 = self->_cachedSecondaryPlacement;
      self->_cachedSecondaryPlacement = v8;

      cachedSecondaryPlacement = self->_cachedSecondaryPlacement;
    }
    v12[0] = cachedSecondaryPlacement;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (double)alpha
{
  return 0.0;
}

- (CGAffineTransform)transform
{
  objc_super v6;
  objc_super v7;
  CGAffineTransform v8;

  if (!_AXSReduceMotionReduceSlideTransitionsEnabled()
    && (-[UIInputViewSetPlacement isFloatingAssistantView](self->super.super._actualPlacement, "isFloatingAssistantView")|| -[UIInputViewSetPlacement accessoryViewWillAppear](self->super.super._actualPlacement, "accessoryViewWillAppear")))
  {
    v7.receiver = self;
    v7.super_class = (Class)UIInputViewSetPlacementInvisibleForFloatingAssistantTransition;
    -[CGAffineTransform transform](&v7, sel_transform);
    return CGAffineTransformScale(retstr, &v8, 0.92, 0.92);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIInputViewSetPlacementInvisibleForFloatingAssistantTransition;
    return (CGAffineTransform *)-[CGAffineTransform transform](&v6, sel_transform);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSecondaryPlacement, 0);
}

@end
