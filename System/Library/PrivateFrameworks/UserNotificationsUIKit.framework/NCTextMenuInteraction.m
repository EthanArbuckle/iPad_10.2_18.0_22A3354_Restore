@implementation NCTextMenuInteraction

- (NCTextMenuInteraction)init
{
  NCTextMenuInteraction *v2;
  uint64_t v3;
  UILongPressGestureRecognizer *longPressGestureRecognizer;
  uint64_t v5;
  UIEditMenuInteraction *editMenuInteraction;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NCTextMenuInteraction;
  v2 = -[NCTextMenuInteraction init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", v2, sel__handleLongPress_);
    longPressGestureRecognizer = v2->_longPressGestureRecognizer;
    v2->_longPressGestureRecognizer = (UILongPressGestureRecognizer *)v3;

    -[UILongPressGestureRecognizer setDelegate:](v2->_longPressGestureRecognizer, "setDelegate:", v2);
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC37A0]), "initWithDelegate:", v2);
    editMenuInteraction = v2->_editMenuInteraction;
    v2->_editMenuInteraction = (UIEditMenuInteraction *)v5;

    -[UIEditMenuInteraction setPresentsContextMenuAsSecondaryAction:](v2->_editMenuInteraction, "setPresentsContextMenuAsSecondaryAction:", 0);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[UIEditMenuInteraction dismissMenu](self->_editMenuInteraction, "dismissMenu");
  -[NCTextMenuInteraction _tearDownHaptic](self, "_tearDownHaptic");
  v3.receiver = self;
  v3.super_class = (Class)NCTextMenuInteraction;
  -[NCTextMenuInteraction dealloc](&v3, sel_dealloc);
}

- (void)willMoveToView:(id)a3
{
  NCTextSupporting **p_view;
  id v5;
  void *v6;
  id WeakRetained;

  p_view = &self->_view;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_view);

  v6 = WeakRetained;
  if (WeakRetained && WeakRetained != v5)
  {
    objc_msgSend(WeakRetained, "removeGestureRecognizer:", self->_longPressGestureRecognizer);
    objc_msgSend(WeakRetained, "removeInteraction:", self->_editMenuInteraction);
    v6 = WeakRetained;
  }

}

- (void)didMoveToView:(id)a3
{
  id v4;

  v4 = a3;
  objc_storeWeak((id *)&self->_view, v4);
  if (v4)
  {
    objc_msgSend(v4, "addGestureRecognizer:", self->_longPressGestureRecognizer);
    objc_msgSend(v4, "addInteraction:", self->_editMenuInteraction);
  }

}

- (id)_editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  _QWORD v21[5];
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__7;
  v21[4] = __Block_byref_object_dispose__7;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "text");
  v22 = (id)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0DC3428];
  NCUserNotificationsUIKitFrameworkBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_TEXT_COPY"), &stru_1E8D21F60, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __84__NCTextMenuInteraction__editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke;
  v20[3] = &unk_1E8D1DA28;
  v20[4] = v21;
  objc_msgSend(v12, "actionWithTitle:image:identifier:handler:", v14, 0, 0, v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0DC39D0];
  v23[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "menuWithTitle:image:identifier:options:children:", &stru_1E8D21F60, 0, 0, 1, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v21, 8);
  return v18;
}

void __84__NCTextMenuInteraction__editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v2 = (id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "mutableCopy");
  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setString:", v2);

}

- (CGRect)_editMenuInteraction:(id)a3 targetRectForConfiguration:(id)a4
{
  id WeakRetained;
  double v5;
  double v6;
  double v7;
  double v8;
  int v9;
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
  CGRect result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "frame");
  v6 = v5;
  v8 = v7;
  v9 = objc_msgSend(WeakRetained, "_shouldReverseLayoutDirection");
  objc_msgSend(WeakRetained, "sizeThatFits:", v6, v8);
  v11 = v10;
  v13 = v12;
  objc_msgSend(WeakRetained, "bounds");
  v16 = v15;
  v17 = v6 - v11;
  if (!v9)
    v17 = -0.0;
  v18 = v14 + v17;

  v19 = v18;
  v20 = v16;
  v21 = v11;
  v22 = v13;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (void)_editMenuInteraction:(id)a3 willPresentMenuForConfiguration:(id)a4
{
  UIColor *v5;
  UIColor *defaultTextColor;
  void *v7;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "textColor");
  v5 = (UIColor *)objc_claimAutoreleasedReturnValue();
  defaultTextColor = self->_defaultTextColor;
  self->_defaultTextColor = v5;

  objc_msgSend(MEMORY[0x1E0DC3658], "tintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setTextColor:", v7);

}

- (void)_editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "setTextColor:", self->_defaultTextColor);

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  -[NCTextMenuInteraction _prepareHaptic](self, "_prepareHaptic", a3);
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  char isKindOfClass;
  id v5;

  if (self->_longPressGestureRecognizer == a3)
  {
    v5 = a4;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (void)_handleLongPress:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "text");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
    {
      v5 = -[UILongPressGestureRecognizer state](self->_longPressGestureRecognizer, "state");

      if (v5 == 1)
      {
        if (objc_msgSend(WeakRetained, "becomeFirstResponder"))
        {
          -[NCTextMenuInteraction _performHaptic](self, "_performHaptic");
          objc_msgSend(WeakRetained, "superview");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "center");
          objc_msgSend(v6, "convertPoint:toView:", WeakRetained);
          v8 = v7;
          v10 = v9;

          objc_msgSend(MEMORY[0x1E0DC3798], "configurationWithIdentifier:sourcePoint:", CFSTR("id"), v8, v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIEditMenuInteraction presentEditMenuWithConfiguration:](self->_editMenuInteraction, "presentEditMenuWithConfiguration:", v11);

        }
        goto LABEL_10;
      }
    }
    else
    {

    }
  }
  if (-[UILongPressGestureRecognizer state](self->_longPressGestureRecognizer, "state") == 3
    || -[UILongPressGestureRecognizer state](self->_longPressGestureRecognizer, "state") == 4)
  {
    -[NCTextMenuInteraction _tearDownHaptic](self, "_tearDownHaptic");
  }
LABEL_10:

}

- (void)_prepareHaptic
{
  UIImpactFeedbackGenerator *haptic;
  UIImpactFeedbackGenerator *v4;
  UIImpactFeedbackGenerator *v5;

  if (!self->_hapticPrepared)
  {
    haptic = self->_haptic;
    if (!haptic)
    {
      v4 = (UIImpactFeedbackGenerator *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3898]), "initWithStyle:", 1);
      v5 = self->_haptic;
      self->_haptic = v4;

      haptic = self->_haptic;
    }
    -[UIImpactFeedbackGenerator prepare](haptic, "prepare");
    self->_hapticPrepared = 1;
  }
}

- (void)_tearDownHaptic
{
  UIImpactFeedbackGenerator *haptic;

  haptic = self->_haptic;
  self->_haptic = 0;

  self->_hapticPrepared = 0;
}

- (void)_performHaptic
{
  -[UIImpactFeedbackGenerator impactOccurred](self->_haptic, "impactOccurred");
}

- (NCTextSupporting)view
{
  return (NCTextSupporting *)objc_loadWeakRetained((id *)&self->_view);
}

- (void)setView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_defaultTextColor, 0);
  objc_storeStrong((id *)&self->_haptic, 0);
  objc_storeStrong((id *)&self->_editMenuInteraction, 0);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
}

@end
