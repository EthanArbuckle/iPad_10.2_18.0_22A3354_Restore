@implementation USUIMoreHelpMenuAction

+ (id)action:(id)a3 destructive:(BOOL)a4 actionID:(int64_t)a5
{
  _BOOL8 v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setTitle:", v7);

  objc_msgSend(v8, "setDestructive:", v6);
  objc_msgSend(v8, "setActionID:", a5);
  return v8;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)destructive
{
  return self->_destructive;
}

- (void)setDestructive:(BOOL)a3
{
  self->_destructive = a3;
}

- (int64_t)actionID
{
  return self->_actionID;
}

- (void)setActionID:(int64_t)a3
{
  self->_actionID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
}

@end
