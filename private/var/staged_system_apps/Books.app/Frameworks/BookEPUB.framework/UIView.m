@implementation UIView

- (BOOL)be_curlContentViewPointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIView be_passthroughViewDelegate](self, "be_passthroughViewDelegate"));
  v9 = v8;
  if (v8)
    LODWORD(self) = objc_msgSend(v8, "passThroughView:shouldPassthroughHitAtPoint:", self, x, y) ^ 1;
  else
    LOBYTE(self) = -[UIView be_curlContentViewPointInside:withEvent:](self, "be_curlContentViewPointInside:withEvent:", v7, x, y);

  return (char)self;
}

+ (Class)bepageCurlViewClass
{
  if (qword_3C1A08 != -1)
    dispatch_once(&qword_3C1A08, &stru_377AA0);
  return (Class)(id)qword_3C1A00;
}

+ (void)be_enablePageCurlHacks
{
  if (qword_3C1A10 != -1)
    dispatch_once(&qword_3C1A10, &stru_377AC0);
}

+ (void)be_enableWKContentViewOverrides
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1238C;
  block[3] = &unk_377C50;
  block[4] = a1;
  if (qword_3C1A58 != -1)
    dispatch_once(&qword_3C1A58, block);
}

+ (Class)be_wkContentViewClass
{
  if (qword_3C1A68 != -1)
    dispatch_once(&qword_3C1A68, &stru_377CC0);
  return (Class)(id)qword_3C1A60;
}

- (BEUIWKTextInteractionAssistantDelegate)be_textInteractionAssistantDelegate
{
  id v2;
  void *v3;
  void *v4;

  v2 = -[UIView be_ancestorViewOfClass:](self, "be_ancestorViewOfClass:", objc_opt_class(WKWebView));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "be_textInteractionAssistantDelegate"));

  return (BEUIWKTextInteractionAssistantDelegate *)v4;
}

- (void)be_setUpTextSelectionAssistant
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  -[UIView be_setUpTextSelectionAssistant](self, "be_setUpTextSelectionAssistant");
  v3 = -[UIView be_ancestorViewOfClass:](self, "be_ancestorViewOfClass:", objc_opt_class(WKWebView));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "be_textInteractionDelegate"));
  if (v5)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "be_textInputChild", 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "interactions"));

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
          v13 = objc_opt_class(UITextInteraction);
          v14 = BUDynamicCast(v13, v12);
          v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
          if (v15)
          {
            v16 = v15;
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "root"));
            objc_msgSend(v17, "setDelegate:", v5);

            goto LABEL_12;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_12:

  }
}

- (void)be_continueContextMenuInteraction:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_126A0;
  v5[3] = &unk_377CE8;
  v6 = a3;
  v4 = v6;
  -[UIView be_continueContextMenuInteraction:](self, "be_continueContextMenuInteraction:", v5);

}

- (NSArray)be_constraintsToFillSuperview
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](self, "superview"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self, "leadingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v16));
  v18[0] = v15;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self, "trailingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v5));
  v18[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self, "topAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v8));
  v18[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bottomAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
  v18[3] = v12;
  v14 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 4));

  return (NSArray *)v14;
}

- (id)be_ancestorViewOfClass:(Class)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  v4 = objc_claimAutoreleasedReturnValue(-[UIView superview](self, "superview"));
  if (v4)
  {
    v5 = (void *)v4;
    while ((objc_opt_isKindOfClass(v5, a3) & 1) == 0)
    {
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));

      v5 = (void *)v6;
      if (!v6)
        goto LABEL_5;
    }
    v7 = v5;
  }
  else
  {
LABEL_5:
    v7 = 0;
  }

  return v7;
}

- (void)setBEPassthroughViewDelegate:(id)a3
{
  objc_setAssociatedObject(self, off_3B5198, a3, 0);
}

- (id)be_passthroughViewDelegate
{
  id AssociatedObject;
  void *v3;
  uint64_t v4;
  void *v5;

  AssociatedObject = objc_getAssociatedObject(self, off_3B5198);
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v4 = BUProtocolCast(&OBJC_PROTOCOL___PassthroughViewDelegate, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

@end
