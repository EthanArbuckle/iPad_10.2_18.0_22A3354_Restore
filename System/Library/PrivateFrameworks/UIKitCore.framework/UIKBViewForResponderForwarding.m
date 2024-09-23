@implementation UIKBViewForResponderForwarding

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  y = a3.y;
  x = a3.x;
  v21 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[UIView subviews](self, "subviews", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v13, "convertPoint:fromView:", self, x, y);
        if ((objc_msgSend(v13, "pointInside:withEvent:", v7) & 1) != 0)
        {
          v14 = 1;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  -[UIKBViewForResponderForwarding responderForForwarding](self, "responderForForwarding");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[UIKBViewForResponderForwarding responderForForwarding](self, "responderForForwarding");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "touchesBegan:withEvent:", v6, v7);

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UIKBViewForResponderForwarding;
    -[UIResponder touchesBegan:withEvent:](&v10, sel_touchesBegan_withEvent_, v6, v7);
  }

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  -[UIKBViewForResponderForwarding responderForForwarding](self, "responderForForwarding");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[UIKBViewForResponderForwarding responderForForwarding](self, "responderForForwarding");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "touchesEnded:withEvent:", v6, v7);

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UIKBViewForResponderForwarding;
    -[UIResponder touchesEnded:withEvent:](&v10, sel_touchesEnded_withEvent_, v6, v7);
  }

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  -[UIKBViewForResponderForwarding responderForForwarding](self, "responderForForwarding");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[UIKBViewForResponderForwarding responderForForwarding](self, "responderForForwarding");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "touchesCancelled:withEvent:", v6, v7);

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UIKBViewForResponderForwarding;
    -[UIResponder touchesCancelled:withEvent:](&v10, sel_touchesCancelled_withEvent_, v6, v7);
  }

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  -[UIKBViewForResponderForwarding responderForForwarding](self, "responderForForwarding");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[UIKBViewForResponderForwarding responderForForwarding](self, "responderForForwarding");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "touchesMoved:withEvent:", v6, v7);

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UIKBViewForResponderForwarding;
    -[UIResponder touchesMoved:withEvent:](&v10, sel_touchesMoved_withEvent_, v6, v7);
  }

}

- (UIView)responderForForwarding
{
  return self->_responderForForwarding;
}

- (void)setResponderForForwarding:(id)a3
{
  objc_storeStrong((id *)&self->_responderForForwarding, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responderForForwarding, 0);
}

@end
