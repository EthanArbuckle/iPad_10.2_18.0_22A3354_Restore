@implementation WBSTabOrderInsertionHint

- (WBSTabOrderInsertionHint)initWithTabToInsertAfter:(id)a3 relation:(unint64_t)a4
{
  return -[WBSTabOrderInsertionHint initWithTabToInsertAfter:insertionIndex:relation:](self, "initWithTabToInsertAfter:insertionIndex:relation:", a3, 0x7FFFFFFFFFFFFFFFLL, a4);
}

- (WBSTabOrderInsertionHint)initWithTabToInsertAfter:(id)a3 insertionIndex:(unint64_t)a4 relation:(unint64_t)a5
{
  id v9;
  WBSTabOrderInsertionHint *v10;
  WBSTabOrderInsertionHint *v11;
  unint64_t v12;
  WBSTabOrderInsertionHint *v13;
  objc_super v15;

  v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WBSTabOrderInsertionHint;
  v10 = -[WBSTabOrderInsertionHint init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_tabToInsertAfter, a3);
    v12 = 0x7FFFFFFFFFFFFFFFLL;
    if (v9)
      v12 = a4;
    v11->_insertionIndex = v12;
    v11->_relationType = a5;
    v13 = v11;
  }

  return v11;
}

- (WBSOrderedTab)tabToInsertAfter
{
  return self->_tabToInsertAfter;
}

- (unint64_t)insertionIndex
{
  return self->_insertionIndex;
}

- (unint64_t)relationType
{
  return self->_relationType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabToInsertAfter, 0);
}

@end
