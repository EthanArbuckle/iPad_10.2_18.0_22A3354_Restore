@implementation _BKLibraryBookshelfBookCellAnimationDelegate

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  _BOOL8 v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v4 = a4;
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[_BKLibraryBookshelfBookCellAnimationDelegate completionBlock](self, "completionBlock", a3));
  if (v5)
  {
    v6 = v5;
    v5[2](v5, v4);
    v5 = (void (**)(_QWORD, _QWORD))v6;
  }

}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
}

@end
