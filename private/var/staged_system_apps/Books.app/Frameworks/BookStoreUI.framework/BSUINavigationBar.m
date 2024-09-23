@implementation BSUINavigationBar

- (void)pushNavigationItem:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  char v11;
  unsigned __int8 v12;
  objc_super v13;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINavigationBar delegate](self, "delegate"));
  v8 = BUProtocolCast(&OBJC_PROTOCOL___BSUINavigationBarDelegate, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if ((objc_opt_respondsToSelector(v9, "shouldHideNavigationItemBackgroundDuringTransition:", v10) & 1) != 0)
    v11 = objc_msgSend(v9, "shouldHideNavigationItemBackgroundDuringTransition:", v6) ^ 1;
  else
    v11 = 0;
  v12 = objc_msgSend(v6, "_backgroundHidden");
  if ((v11 & 1) != 0 || (v12 & 1) != 0)
  {
    v13.receiver = self;
    v13.super_class = (Class)BSUINavigationBar;
    -[BSUINavigationBar pushNavigationItem:animated:](&v13, "pushNavigationItem:animated:", v6, v4);
  }
  else
  {
    objc_msgSend(v6, "_setBackgroundHidden:", 1);
    v13.receiver = self;
    v13.super_class = (Class)BSUINavigationBar;
    -[BSUINavigationBar pushNavigationItem:animated:](&v13, "pushNavigationItem:animated:", v6, v4);
    objc_msgSend(v6, "_setBackgroundHidden:", 0);
  }

}

- (id)accessibilityElements
{
  id v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  unsigned int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];

  v18.receiver = self;
  v18.super_class = (Class)BSUINavigationBar;
  v2 = -[BSUINavigationBar accessibilityElements](&v18, "accessibilityElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = objc_msgSend(v3, "mutableCopy");

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "accessibilityIdentifier", (_QWORD)v14));
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("ToggleSidebar"));

        if (v12)
        {
          objc_msgSend(v5, "removeObject:", v10);
          objc_msgSend(v5, "insertObject:atIndex:", v10, 0);
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (UIView)largeTitleView
{
  return self->_largeTitleView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_largeTitleView, 0);
}

@end
