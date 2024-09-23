@implementation ICStoreDialogResponseButton

- (ICStoreDialogResponseButton)initWithType:(int64_t)a3 isDefaultButton:(BOOL)a4 title:(id)a5 action:(id)a6
{
  id v10;
  id v11;
  ICStoreDialogResponseButton *v12;
  ICStoreDialogResponseButton *v13;
  uint64_t v14;
  NSString *title;
  uint64_t v16;
  ICStoreDialogResponseButtonAction *action;
  objc_super v19;

  v10 = a5;
  v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)ICStoreDialogResponseButton;
  v12 = -[ICStoreDialogResponseButton init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_type = a3;
    v12->_isDefaultButton = a4;
    v14 = objc_msgSend(v10, "copy");
    title = v13->_title;
    v13->_title = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    action = v13->_action;
    v13->_action = (ICStoreDialogResponseButtonAction *)v16;

  }
  return v13;
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)isDefaultButton
{
  return self->_isDefaultButton;
}

- (NSString)title
{
  return self->_title;
}

- (ICStoreDialogResponseButtonAction)action
{
  return self->_action;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
