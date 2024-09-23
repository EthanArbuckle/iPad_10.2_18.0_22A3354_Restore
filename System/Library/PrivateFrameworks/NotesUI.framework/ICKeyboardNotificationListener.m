@implementation ICKeyboardNotificationListener

void __48__ICKeyboardNotificationListener_sharedListener__block_invoke()
{
  ICKeyboardNotificationListener *v0;
  void *v1;

  v0 = objc_alloc_init(ICKeyboardNotificationListener);
  v1 = (void *)sharedListener_listener;
  sharedListener_listener = (uint64_t)v0;

}

- (ICKeyboardNotificationListener)init
{
  char *v2;
  ICKeyboardNotificationListener *v3;
  __int128 v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICKeyboardNotificationListener;
  v2 = -[ICKeyboardNotificationListener init](&v8, sel_init);
  v3 = (ICKeyboardNotificationListener *)v2;
  if (v2)
  {
    v4 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    *(_OWORD *)(v2 + 8) = *MEMORY[0x1E0C9D628];
    *(_OWORD *)(v2 + 24) = v4;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v3, sel_handleKeyboardWillShow_, *MEMORY[0x1E0DC4FE8], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v3, sel_handleKeyboardWillHide_, *MEMORY[0x1E0DC4FE0], 0);

  }
  return v3;
}

+ (id)sharedListener
{
  if (sharedListener_onceToken != -1)
    dispatch_once(&sharedListener_onceToken, &__block_literal_global_16);
  return (id)sharedListener_listener;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICKeyboardNotificationListener;
  -[ICKeyboardNotificationListener dealloc](&v4, sel_dealloc);
}

- (void)handleKeyboardWillShow:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DC4E90]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CGRectValue");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[ICKeyboardNotificationListener setKeyboardFrame:](self, "setKeyboardFrame:", v7, v9, v11, v13);
}

- (void)handleKeyboardWillHide:(id)a3
{
  -[ICKeyboardNotificationListener setKeyboardFrame:](self, "setKeyboardFrame:", a3, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
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

- (void)setKeyboardFrame:(CGRect)a3
{
  self->_keyboardFrame = a3;
}

@end
