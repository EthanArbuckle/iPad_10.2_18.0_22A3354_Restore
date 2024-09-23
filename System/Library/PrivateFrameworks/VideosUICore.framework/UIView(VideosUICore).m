@implementation UIView(VideosUICore)

- (uint64_t)vui_addSubview:()VideosUICore oldView:
{
  unint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  v8 = (void *)v7;
  if (v7 == v6)
  {
    if (v7)
    {
      objc_msgSend((id)v7, "superview");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        objc_msgSend(a1, "addSubview:", v8);
        if (objc_msgSend(a1, "vuiDebugUI"))
        {
          +[VUICoreUtilities randomColor](VUICoreUtilities, "randomColor");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v8;
          goto LABEL_13;
        }
LABEL_14:
        v9 = 1;
        goto LABEL_15;
      }
    }
  }
  else if (v6 | v7)
  {
    objc_msgSend((id)v7, "vui_removeFromSuperView");
    if (!v6 || (objc_msgSend((id)v6, "vui_isDescendantOfView:", a1) & 1) != 0)
    {
      v9 = 0;
LABEL_15:
      objc_msgSend(a1, "vui_setNeedsLayout");
      goto LABEL_16;
    }
    objc_msgSend(a1, "addSubview:", v6);
    if (objc_msgSend(a1, "vuiDebugUI"))
    {
      +[VUICoreUtilities randomColor](VUICoreUtilities, "randomColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)v6;
LABEL_13:
      objc_msgSend(v12, "setVuiBackgroundColor:", v11);

      goto LABEL_14;
    }
    goto LABEL_14;
  }
  v9 = 0;
LABEL_16:

  return v9;
}

- (uint64_t)vuiDebugUI
{
  return 0;
}

- (BOOL)vuiIsRTL
{
  return objc_msgSend(a1, "effectiveUserInterfaceLayoutDirection") == 1;
}

- (unint64_t)vuiContentMode
{
  return VUIViewContentModeFromUIContentMode(objc_msgSend(a1, "contentMode"));
}

- (void)vui_registerForTraitChanges:()VideosUICore withHandler:
{
  void *v6;
  id v7;
  id v8;

  v8 = a4;
  +[VUITraitBaseClass uiTraitsFrom:](VUITraitBaseClass, "uiTraitsFrom:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(a1, "registerForTraitChanges:withHandler:", v6, v8);

}

- (unint64_t)vuiUserInterfaceStyle
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "traitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "userInterfaceStyle");

  return +[VUICoreUtilities vuiUserInterfaceStyleForInterfaceStyle:](VUICoreUtilities, "vuiUserInterfaceStyleForInterfaceStyle:", v2);
}

- (uint64_t)setVuiContentMode:()VideosUICore
{
  return objc_msgSend(a1, "setContentMode:", VUIUIViewContentModeFromVUIContentMode(a3));
}

- (uint64_t)setVuiAlpha:()VideosUICore
{
  uint64_t result;
  double v5;

  result = objc_msgSend(a1, "vuiAlpha");
  if (v5 != a2)
    return objc_msgSend(a1, "setAlpha:", a2);
  return result;
}

- (double)vui_layoutSubviews:()VideosUICore computationOnly:
{
  double v3;

  if (!a3)
    return *MEMORY[0x1E0C9D820];
  objc_msgSend(a1, "bounds");
  return v3;
}

- (uint64_t)vui_setOverrideUserInterfaceStyle:()VideosUICore
{
  uint64_t v3;

  if (a3 == 1)
    v3 = 1;
  else
    v3 = 2 * (a3 == 2);
  return objc_msgSend(a1, "setOverrideUserInterfaceStyle:", v3);
}

- (void)vui_removeFromSuperView
{
  void *v2;

  objc_msgSend(a1, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    objc_msgSend(a1, "removeFromSuperview");
}

- (uint64_t)vui_insertSubview:()VideosUICore belowSubview:oldView:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v9)
  {
    if (v10 == v8)
    {
      v12 = 0;
    }
    else
    {
      objc_msgSend(v10, "vui_removeFromSuperView");
      if (v8 && (objc_msgSend(v8, "vui_isDescendantOfView:", a1) & 1) == 0)
      {
        objc_msgSend(a1, "insertSubview:belowSubview:", v8, v9);
        if (objc_msgSend(a1, "vuiDebugUI"))
        {
          +[VUICoreUtilities randomColor](VUICoreUtilities, "randomColor");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setVuiBackgroundColor:", v13);

        }
        v12 = 1;
      }
      else
      {
        v12 = 0;
      }
      objc_msgSend(a1, "vui_setNeedsLayout");
    }
  }
  else
  {
    v12 = objc_msgSend(a1, "vui_addSubview:oldView:", v8, v10);
  }

  return v12;
}

- (uint64_t)vui_insertSubview:()VideosUICore aboveSubview:oldView:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v9)
  {
    if (v10 == v8)
    {
      v12 = 0;
    }
    else
    {
      objc_msgSend(v10, "vui_removeFromSuperView");
      if (v8 && (objc_msgSend(v8, "vui_isDescendantOfView:", a1) & 1) == 0)
      {
        objc_msgSend(a1, "insertSubview:aboveSubview:", v8, v9);
        if (objc_msgSend(a1, "vuiDebugUI"))
        {
          +[VUICoreUtilities randomColor](VUICoreUtilities, "randomColor");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setVuiBackgroundColor:", v13);

        }
        v12 = 1;
      }
      else
      {
        v12 = 0;
      }
      objc_msgSend(a1, "vui_setNeedsLayout");
    }
  }
  else
  {
    v12 = objc_msgSend(a1, "vui_addSubview:oldView:", v8, v10);
  }

  return v12;
}

+ (uint64_t)vui_performWithoutAnimation:()VideosUICore
{
  return objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:");
}

+ (uint64_t)vui_animateWithDuration:()VideosUICore animations:completion:
{
  return objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:");
}

- (unint64_t)vuiOverrideUserInterfaceStyle
{
  return +[VUICoreUtilities vuiUserInterfaceStyleForInterfaceStyle:](VUICoreUtilities, "vuiUserInterfaceStyleForInterfaceStyle:", objc_msgSend(a1, "overrideUserInterfaceStyle"));
}

+ (uint64_t)vui_performByPreventingAdditiveAnimations:()VideosUICore
{
  return objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 2048, a3, 0, 0.0, 0.0);
}

- (void)vui_performAsCurrentTraitCollection:()VideosUICore
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend(a1, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__UIView_VideosUICore__vui_performAsCurrentTraitCollection___block_invoke;
  v7[3] = &unk_1E9F2B930;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performAsCurrentTraitCollection:", v7);

}

- (double)vui_alignmentInsetsForExpectedWidth:()VideosUICore
{
  return *MEMORY[0x1E0CEB4B0];
}

- (uint64_t)vui_highlighted
{
  return 0;
}

+ (uint64_t)vui_animateWithDuration:()VideosUICore delay:options:animations:completion:
{
  return objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:");
}

+ (uint64_t)vui_animateWithDuration:()VideosUICore animations:
{
  return objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:");
}

+ (uint64_t)vui_transitionWithView:()VideosUICore duration:options:animations:completion:
{
  return objc_msgSend(MEMORY[0x1E0CEABB0], "transitionWithView:duration:options:animations:completion:");
}

+ (id)_timingFuctionWithOptions:()VideosUICore
{
  _QWORD *v3;

  v3 = (_QWORD *)MEMORY[0x1E0CD3050];
  if ((*(_QWORD *)&a3 & 0x20000) == 0)
    v3 = (_QWORD *)MEMORY[0x1E0CD3038];
  if ((*(_QWORD *)&a3 & 0x10000) != 0)
    v3 = (_QWORD *)MEMORY[0x1E0CD3040];
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
