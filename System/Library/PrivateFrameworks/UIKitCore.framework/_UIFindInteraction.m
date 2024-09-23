@implementation _UIFindInteraction

- (void)setSearchableObject:(id)a3
{
  objc_storeWeak((id *)&self->_searchableObject, a3);
}

- (_UIFindInteraction)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIFindInteraction;
  return -[_UIFindInteraction init](&v3, sel_init);
}

- (void)willMoveToView:(id)a3
{
  -[UIFindInteraction willMoveToView:](self->_wrappedFindInteraction, "willMoveToView:", a3);
}

- (void)didMoveToView:(id)a3
{
  UIFindInteraction *wrappedFindInteraction;
  UIFindInteraction *v5;
  UIFindInteraction *v6;
  id v7;

  v7 = a3;
  objc_storeWeak((id *)&self->_view, v7);
  wrappedFindInteraction = self->_wrappedFindInteraction;
  if (!wrappedFindInteraction)
  {
    v5 = -[UIFindInteraction initWithSessionDelegate:]([UIFindInteraction alloc], "initWithSessionDelegate:", self);
    v6 = self->_wrappedFindInteraction;
    self->_wrappedFindInteraction = v5;

    wrappedFindInteraction = self->_wrappedFindInteraction;
  }
  -[UIFindInteraction didMoveToView:](wrappedFindInteraction, "didMoveToView:", v7);

}

- (void)presentFindNavigatorShowingReplace:(BOOL)a3
{
  -[UIFindInteraction presentFindNavigatorShowingReplace:](self->_wrappedFindInteraction, "presentFindNavigatorShowingReplace:", a3);
}

- (void)dismissFindNavigator
{
  -[UIFindInteraction dismissFindNavigator](self->_wrappedFindInteraction, "dismissFindNavigator");
}

- (void)findNext
{
  -[UIFindInteraction findNext](self->_wrappedFindInteraction, "findNext");
}

- (void)findPrevious
{
  -[UIFindInteraction findPrevious](self->_wrappedFindInteraction, "findPrevious");
}

- (BOOL)isFindNavigatorVisible
{
  return -[UIFindInteraction isFindNavigatorVisible](self->_wrappedFindInteraction, "isFindNavigatorVisible");
}

- (NSString)searchText
{
  return -[UIFindInteraction searchText](self->_wrappedFindInteraction, "searchText");
}

- (void)setSearchText:(id)a3
{
  -[UIFindInteraction setSearchText:](self->_wrappedFindInteraction, "setSearchText:", a3);
}

- (NSString)replacementText
{
  return -[UIFindInteraction replacementText](self->_wrappedFindInteraction, "replacementText");
}

- (void)setReplacementText:(id)a3
{
  -[UIFindInteraction setReplacementText:](self->_wrappedFindInteraction, "setReplacementText:", a3);
}

- (id)findInteraction:(id)a3 sessionForView:(id)a4
{
  UITextSearchingFindSession *v5;
  id WeakRetained;
  UITextSearchingFindSession *v7;

  v5 = [UITextSearchingFindSession alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_searchableObject);
  v7 = -[UITextSearchingFindSession initWithSearchableObject:](v5, "initWithSearchableObject:", WeakRetained);

  return v7;
}

- (void)findInteraction:(id)a3 didBeginFindSession:(id)a4
{
  _UITextSearching **p_searchableObject;
  id WeakRetained;
  char v6;
  id v7;

  p_searchableObject = &self->_searchableObject;
  WeakRetained = objc_loadWeakRetained((id *)&self->_searchableObject);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_searchableObject);
    objc_msgSend(v7, "didBeginTextSearchOperation");

  }
}

- (void)findInteraction:(id)a3 didEndFindSession:(id)a4
{
  _UITextSearching **p_searchableObject;
  id WeakRetained;
  char v6;
  id v7;

  p_searchableObject = &self->_searchableObject;
  WeakRetained = objc_loadWeakRetained((id *)&self->_searchableObject);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_searchableObject);
    objc_msgSend(v7, "didEndTextSearchOperation");

  }
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (_UITextSearching)searchableObject
{
  return (_UITextSearching *)objc_loadWeakRetained((id *)&self->_searchableObject);
}

- (UIFindInteraction)wrappedFindInteraction
{
  return self->_wrappedFindInteraction;
}

- (void)setWrappedFindInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_wrappedFindInteraction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedFindInteraction, 0);
  objc_destroyWeak((id *)&self->_searchableObject);
  objc_destroyWeak((id *)&self->_view);
}

@end
