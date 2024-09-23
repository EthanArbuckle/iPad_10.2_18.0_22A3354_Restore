@implementation UIInputViewSetPlacementInvisible

+ (id)placementWithPlacement:(id)a3
{
  id v4;
  id v5;
  void *v6;
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "isVisible") & 1) == 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v13 = "+[UIInputViewSetPlacementInvisible placementWithPlacement:]";
        _os_log_fault_impl(&dword_185066000, v10, OS_LOG_TYPE_FAULT, "%s: Should not be called with an invisible placement", buf, 0xCu);
      }

    }
    else
    {
      v8 = placementWithPlacement____s_category;
      if (!placementWithPlacement____s_category)
      {
        v8 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v8, (unint64_t *)&placementWithPlacement____s_category);
      }
      v9 = *(NSObject **)(v8 + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v13 = "+[UIInputViewSetPlacementInvisible placementWithPlacement:]";
        _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "%s: Should not be called with an invisible placement", buf, 0xCu);
      }
    }
  }
  if ((objc_msgSend(v4, "isVisible") & 1) != 0)
  {
    v11.receiver = a1;
    v11.super_class = (Class)&OBJC_METACLASS___UIInputViewSetPlacementInvisible;
    objc_msgSendSuper2(&v11, sel_placementWithPlacement_, v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v4;
  }
  v6 = v5;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isUndocked
{
  return 0;
}

- (BOOL)isVisible
{
  return 0;
}

- (BOOL)showsInputViews
{
  return 0;
}

- (BOOL)showsKeyboard
{
  return 0;
}

- (BOOL)showsInputOrAssistantViews
{
  return 0;
}

- (BOOL)isInteractive
{
  return 0;
}

- (BOOL)inputViewWillAppear
{
  return 0;
}

- (double)alpha
{
  return 0.0;
}

- (CGAffineTransform)transform
{
  CGAffineTransform *result;
  uint64_t v6;
  __int128 v7;
  objc_super v8;
  objc_super v9;
  CGAffineTransform v10;

  result = (CGAffineTransform *)_AXSReduceMotionReduceSlideTransitionsEnabled();
  if ((_DWORD)result)
  {
    v6 = MEMORY[0x1E0C9BAA8];
    v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&retstr->c = v7;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v6 + 32);
  }
  else if (-[UIInputViewSetPlacement isFloating](self->super._actualPlacement, "isFloating"))
  {
    v9.receiver = self;
    v9.super_class = (Class)UIInputViewSetPlacementInvisible;
    -[CGAffineTransform transform](&v9, sel_transform);
    return CGAffineTransformScale(retstr, &v10, 0.5, 0.5);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UIInputViewSetPlacementInvisible;
    return (CGAffineTransform *)-[CGAffineTransform transform](&v8, sel_transform);
  }
  return result;
}

- (id)applicatorInfoForOwner:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BYTE v13[48];
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E08];
  -[UIInputViewSetPlacement applicatorInfoForOwner:](self->super._actualPlacement, "applicatorInfoForOwner:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryWithDictionary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = CFSTR("Alpha");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[UIInputViewSetPlacementInvisible alpha](self, "alpha");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  v14[1] = CFSTR("Transform");
  v9 = (void *)MEMORY[0x1E0CB3B18];
  -[UIInputViewSetPlacementInvisible transform](self, "transform");
  objc_msgSend(v9, "valueWithCGAffineTransform:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addEntriesFromDictionary:", v11);

  return v6;
}

@end
