@implementation WFKeyboard

void __28__WFKeyboard_sharedKeyboard__block_invoke()
{
  WFKeyboard *v0;
  void *v1;

  v0 = objc_alloc_init(WFKeyboard);
  v1 = (void *)sharedKeyboard_sharedKeyboard;
  sharedKeyboard_sharedKeyboard = (uint64_t)v0;

}

- (WFKeyboard)init
{
  WFKeyboard *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFKeyboard;
  v2 = -[WFKeyboard init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_keyboardWillChangeVisible_, *MEMORY[0x24BEBE580], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_keyboardWillChangeVisible_, *MEMORY[0x24BEBE578], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_keyboardWillChangeFrame_, *MEMORY[0x24BEBE570], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_keyboardWillChangeFrame_, *MEMORY[0x24BEBE448], 0);

  }
  return v2;
}

+ (void)beginObservingKeyboardNotifications
{
  id v2;

  v2 = +[WFKeyboard sharedKeyboard](WFKeyboard, "sharedKeyboard");
}

+ (id)sharedKeyboard
{
  if (sharedKeyboard_onceToken != -1)
    dispatch_once(&sharedKeyboard_onceToken, &__block_literal_global_58);
  return (id)sharedKeyboard_sharedKeyboard;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEBE580], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEBE578], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEBE570], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEBE448], 0);

  v4.receiver = self;
  v4.super_class = (Class)WFKeyboard;
  -[WFKeyboard dealloc](&v4, sel_dealloc);
}

- (void)keyboardWillChangeVisible:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  id v17;

  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_visible = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BEBE580]);

  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BEBE468]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "CGRectValue");
  self->_keyboardFrame.origin.x = v8;
  self->_keyboardFrame.origin.y = v9;
  self->_keyboardFrame.size.width = v10;
  self->_keyboardFrame.size.height = v11;

  objc_msgSend(v4, "userInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BEBE400]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  self->_animationCurve = objc_msgSend(v13, "unsignedIntegerValue");

  objc_msgSend(v4, "userInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "objectForKey:", *MEMORY[0x24BEBE408]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  self->_animationDuration = v16;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "postNotificationName:object:", CFSTR("WFKeyboardWillChangeNotification"), self);

}

- (void)keyboardWillChangeFrame:(id)a3
{
  void *v4;
  void *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  id v10;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BEBE468]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CGRectValue");
  self->_keyboardFrame.origin.x = v6;
  self->_keyboardFrame.origin.y = v7;
  self->_keyboardFrame.size.width = v8;
  self->_keyboardFrame.size.height = v9;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:", CFSTR("WFKeyboardWillChangeNotification"), self);

}

- (CGRect)keyboardFrameInView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  void *v26;
  void *v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double x;
  double y;
  double width;
  double height;
  void *v40;
  void *v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  double v50;
  double v51;
  double v52;
  double v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect result;
  CGRect v59;

  v4 = a3;
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "coordinateSpace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(v4, "coordinateSpace");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertRect:fromCoordinateSpace:", v17, v10, v12, v14, v16);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  objc_msgSend(v7, "coordinateSpace");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "coordinateSpace");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "convertRect:fromCoordinateSpace:", v27, self->_keyboardFrame.origin.x, self->_keyboardFrame.origin.y, self->_keyboardFrame.size.width, self->_keyboardFrame.size.height);
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;

  v54.origin.x = v19;
  v54.origin.y = v21;
  v54.size.width = v23;
  v54.size.height = v25;
  v59.origin.x = v29;
  v59.origin.y = v31;
  v59.size.width = v33;
  v59.size.height = v35;
  v55 = CGRectIntersection(v54, v59);
  x = v55.origin.x;
  y = v55.origin.y;
  width = v55.size.width;
  height = v55.size.height;
  objc_msgSend(v4, "coordinateSpace");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "coordinateSpace");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "convertRect:toCoordinateSpace:", v41, x, y, width, height);
  v43 = v42;
  v45 = v44;
  v47 = v46;
  v49 = v48;

  v56.origin.x = v43;
  v56.origin.y = v45;
  v56.size.width = v47;
  v56.size.height = v49;
  if (CGRectIsInfinite(v56)
    || (v57.origin.x = v43, v57.origin.y = v45, v57.size.width = v47, v57.size.height = v49, CGRectIsEmpty(v57)))
  {
    v43 = *MEMORY[0x24BDBF090];
    v45 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v47 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v49 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }

  v50 = v43;
  v51 = v45;
  v52 = v47;
  v53 = v49;
  result.size.height = v53;
  result.size.width = v52;
  result.origin.y = v51;
  result.origin.x = v50;
  return result;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (int64_t)animationCurve
{
  return self->_animationCurve;
}

- (double)animationDuration
{
  return self->_animationDuration;
}

- (CGRect)keyboardFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_keyboardFrame.origin.x;
  y = self->_keyboardFrame.origin.y;
  width = self->_keyboardFrame.size.width;
  height = self->_keyboardFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

@end
