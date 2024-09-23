@implementation ScrollViewContentOffsetObserver

- (ScrollViewContentOffsetObserver)initWithScrollView:(id)a3 changeHandler:(id)a4
{
  id v7;
  id v8;
  ScrollViewContentOffsetObserver *v9;
  ScrollViewContentOffsetObserver *v10;
  id v11;
  id changeHandler;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ScrollViewContentOffsetObserver;
  v9 = -[ScrollViewContentOffsetObserver init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_scrollView, a3);
    v11 = objc_msgSend(v8, "copy");
    changeHandler = v10->_changeHandler;
    v10->_changeHandler = v11;

    objc_msgSend(v7, "addObserver:forKeyPath:options:context:", v10, CFSTR("contentOffset"), 1, &off_1010A8988);
  }

  return v10;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  UIScrollView *scrollView;
  void (**v8)(id, UIScrollView *);
  objc_super v9;

  if (a6 == &off_1010A8988)
  {
    v8 = (void (**)(id, UIScrollView *))objc_claimAutoreleasedReturnValue(-[ScrollViewContentOffsetObserver changeHandler](self, "changeHandler", a3, a4, a5));
    if (v8)
    {
      scrollView = self->_scrollView;
      -[UIScrollView contentOffset](scrollView, "contentOffset");
      v8[2](v8, scrollView);
    }

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)ScrollViewContentOffsetObserver;
    -[ScrollViewContentOffsetObserver observeValueForKeyPath:ofObject:change:context:](&v9, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)dealloc
{
  objc_super v3;

  -[UIScrollView removeObserver:forKeyPath:](self->_scrollView, "removeObserver:forKeyPath:", self, CFSTR("contentOffset"));
  v3.receiver = self;
  v3.super_class = (Class)ScrollViewContentOffsetObserver;
  -[ScrollViewContentOffsetObserver dealloc](&v3, "dealloc");
}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (void)setChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong(&self->_changeHandler, 0);
}

@end
