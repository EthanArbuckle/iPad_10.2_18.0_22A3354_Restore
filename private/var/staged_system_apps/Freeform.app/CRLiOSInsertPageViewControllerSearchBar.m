@implementation CRLiOSInsertPageViewControllerSearchBar

- (BOOL)resignFirstResponder
{
  BOOL v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLiOSInsertPageViewControllerSearchBar;
  v3 = -[CRLiOSInsertPageViewControllerSearchBar resignFirstResponder](&v5, "resignFirstResponder");
  -[CRLiOSInsertPageViewControllerSearchBar p_recursivelyEnableButtonsInView:](self, "p_recursivelyEnableButtonsInView:", self);
  return v3;
}

- (void)enableCancelButton
{
  -[CRLiOSInsertPageViewControllerSearchBar p_recursivelyEnableButtonsInView:](self, "p_recursivelyEnableButtonsInView:", self);
}

- (void)p_recursivelyEnableButtonsInView:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v6 = objc_opt_class(UIButton, v5);
  v7 = sub_100221D0C(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "setEnabled:", 1);
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subviews", 0));
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v10);
          -[CRLiOSInsertPageViewControllerSearchBar p_recursivelyEnableButtonsInView:](self, "p_recursivelyEnableButtonsInView:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i));
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v12);
    }

  }
}

- (void)scribbleInteractionWillBeginWriting:(id)a3
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  objc_super v9;

  v5 = a3;
  if (objc_msgSend(-[CRLiOSInsertPageViewControllerSearchBar superclass](self, "superclass"), "instancesRespondToSelector:", a2))
  {
    v9.super_class = (Class)-[CRLiOSInsertPageViewControllerSearchBar superclass](self, "superclass", self);
    objc_msgSendSuper(&v9, a2, v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewControllerSearchBar delegate](self, "delegate"));
  v7 = objc_opt_respondsToSelector(v6, "scribbleInteractionWillBeginWriting:");

  if ((v7 & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewControllerSearchBar delegate](self, "delegate"));
    objc_msgSend(v8, "performSelector:withObject:", "scribbleInteractionWillBeginWriting:", v5);

  }
}

- (void)scribbleInteractionDidFinishWriting:(id)a3
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  objc_super v9;

  v5 = a3;
  if (objc_msgSend(-[CRLiOSInsertPageViewControllerSearchBar superclass](self, "superclass"), "instancesRespondToSelector:", a2))
  {
    v9.super_class = (Class)-[CRLiOSInsertPageViewControllerSearchBar superclass](self, "superclass", self);
    objc_msgSendSuper(&v9, a2, v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewControllerSearchBar delegate](self, "delegate"));
  v7 = objc_opt_respondsToSelector(v6, "scribbleInteractionDidFinishWriting:");

  if ((v7 & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewControllerSearchBar delegate](self, "delegate"));
    objc_msgSend(v8, "performSelector:withObject:", "scribbleInteractionDidFinishWriting:", v5);

  }
}

@end
