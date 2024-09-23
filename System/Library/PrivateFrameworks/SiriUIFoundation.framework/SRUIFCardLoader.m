@implementation SRUIFCardLoader

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    if (a3)
      -[SRUIFCardLoader _registerWithSearchFoundation](self, "_registerWithSearchFoundation");
    else
      -[SRUIFCardLoader _unregisterWithSearchFoundation](self, "_unregisterWithSearchFoundation");
  }
}

- (BOOL)loadCard:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, id, _QWORD);
  void *v8;
  int v9;
  void *v10;
  char v11;

  v6 = a3;
  v7 = (void (**)(id, id, _QWORD))a4;
  if (!v7)
    goto LABEL_7;
  if (objc_msgSend(v6, "type") != 3
    || objc_msgSend(v6, "source") != 2
    || (-[SRUIFCardLoader delegate](self, "delegate"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "cardLoader:shouldLoadCard:", self, v6),
        v8,
        !v9))
  {
    v7[2](v7, v6, 0);
LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  -[SRUIFCardLoader delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "cardLoader:loadCard:withCompletionHandler:", self, v6, v7);

LABEL_8:
  return v11;
}

- (SRUIFCardLoaderDelegate)delegate
{
  return (SRUIFCardLoaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)active
{
  return self->_active;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
