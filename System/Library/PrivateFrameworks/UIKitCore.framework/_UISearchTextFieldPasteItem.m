@implementation _UISearchTextFieldPasteItem

- (void)setSearchTokenResult:(id)a3
{
  id v5;
  objc_super v6;

  objc_storeStrong((id *)&self->_searchTokenResult, a3);
  v5 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_UISearchTextFieldPasteItem;
  -[UITextPasteItem setNoResult](&v6, sel_setNoResult);

}

- (UISearchToken)_searchTokenResult
{
  return self->_searchTokenResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchTokenResult, 0);
}

@end
