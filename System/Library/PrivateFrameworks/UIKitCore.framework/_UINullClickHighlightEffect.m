@implementation _UINullClickHighlightEffect

+ (id)effectWithPreview:(id)a3 continuingFromPreview:(id)a4
{
  id v4;
  _QWORD *v5;
  void *v6;

  v4 = a3;
  v5 = (_QWORD *)objc_opt_new();
  v6 = (void *)v5[1];
  v5[1] = v4;

  return v5;
}

- (void)interaction:(id)a3 didChangeWithContext:(id)a4
{
  void *v5;
  id v6;

  if (objc_msgSend(a4, "ended", a3))
  {
    -[_UINullClickHighlightEffect completionBlock](self, "completionBlock");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[_UINullClickHighlightEffect setCompletionBlock:](self, "setCompletionBlock:", 0);
    v5 = v6;
    if (v6)
    {
      (*((void (**)(id, _UINullClickHighlightEffect *))v6 + 2))(v6, self);
      v5 = v6;
    }

  }
}

- (UITargetedPreview)targetedPreview
{
  return self->_targetedPreview;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_targetedPreview, 0);
}

@end
