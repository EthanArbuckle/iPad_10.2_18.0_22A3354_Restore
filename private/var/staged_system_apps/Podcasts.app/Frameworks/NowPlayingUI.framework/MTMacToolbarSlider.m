@implementation MTMacToolbarSlider

- (void)_installVisualElement:(id)a3
{
  id v5;
  Class v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  Class v13;
  id v14;
  void *v15;
  Class v16;
  char isKindOfClass;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  objc_super v23;
  _BYTE v24[128];

  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MTMacToolbarSlider;
  if (-[MTMacToolbarSlider respondsToSelector:](&v23, "respondsToSelector:", a2))
  {
    v22.receiver = self;
    v22.super_class = (Class)MTMacToolbarSlider;
    -[MTMacToolbarSlider _installVisualElement:](&v22, "_installVisualElement:", v5);
    v6 = NSClassFromString(CFSTR("_UISliderMacVisualElement"));
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subviews", 0));
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v19;
LABEL_5:
        v11 = 0;
        while (1)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v11);
          v13 = NSClassFromString(CFSTR("_UINSView"));
          if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
            break;
          if (v9 == (id)++v11)
          {
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
            if (v9)
              goto LABEL_5;
            goto LABEL_11;
          }
        }
        v14 = v12;

        if (v14)
        {
          if ((objc_opt_respondsToSelector(v14, "contentNSView") & 1) != 0)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "contentNSView"));
            v16 = NSClassFromString(CFSTR("NSSlider"));
            isKindOfClass = objc_opt_isKindOfClass(v15, v16);

            if ((isKindOfClass & 1) != 0)
            {
              v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "contentNSView"));
              objc_msgSend(v7, "setControlSize:", 2);
              objc_msgSend(v7, "_setSemanticContext:", 4);
              -[MTMacToolbarSlider set_internalNSSlider:](self, "set_internalNSSlider:", v7);
              goto LABEL_12;
            }
          }
        }
      }
      else
      {
LABEL_11:
        v14 = 0;
LABEL_12:

      }
    }
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  char *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MTMacToolbarSlider;
  -[MTMacToolbarSlider traitCollectionDidChange:](&v11, "traitCollectionDidChange:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTMacToolbarSlider _internalNSSlider](self, "_internalNSSlider"));
  v5 = objc_opt_respondsToSelector(v4, "setCompositingFilter:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTMacToolbarSlider traitCollection](self, "traitCollection"));
    v7 = (char *)objc_msgSend(v6, "userInterfaceStyle");
    v8 = CFSTR("plusD");
    if (v7 == (_BYTE *)&dword_0 + 2)
      v8 = CFSTR("plusL");
    v9 = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTMacToolbarSlider _internalNSSlider](self, "_internalNSSlider"));
    objc_msgSend(v10, "setCompositingFilter:", v9);

  }
}

- (_MTNSSlider)_internalNSSlider
{
  return self->__internalNSSlider;
}

- (void)set_internalNSSlider:(id)a3
{
  objc_storeStrong((id *)&self->__internalNSSlider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__internalNSSlider, 0);
}

@end
