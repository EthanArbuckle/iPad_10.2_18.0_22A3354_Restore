@implementation SCDALinkedListItem

- (SCDALinkedListItem)initWithObject:(id)a3
{
  id v5;
  SCDALinkedListItem *v6;
  SCDALinkedListItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCDALinkedListItem;
  v6 = -[SCDALinkedListItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong(&v6->_object, a3);

  return v7;
}

- (void)insertBeforeItem:(id)a3
{
  SCDALinkedListItem *v4;
  SCDALinkedListItem *v5;

  v5 = (SCDALinkedListItem *)a3;
  -[SCDALinkedListItem previousItem](v5, "previousItem");
  v4 = (SCDALinkedListItem *)objc_claimAutoreleasedReturnValue();
  if (v5 != self && v4 != self)
  {
    -[SCDALinkedListItem setNextItem:](v4, "setNextItem:", self);
    -[SCDALinkedListItem setPreviousItem:](self, "setPreviousItem:", v4);
    -[SCDALinkedListItem setNextItem:](self, "setNextItem:", v5);
    -[SCDALinkedListItem setPreviousItem:](v5, "setPreviousItem:", self);
  }

}

- (void)insertAfterItem:(id)a3
{
  SCDALinkedListItem *v4;
  SCDALinkedListItem *v5;

  v5 = (SCDALinkedListItem *)a3;
  -[SCDALinkedListItem nextItem](v5, "nextItem");
  v4 = (SCDALinkedListItem *)objc_claimAutoreleasedReturnValue();
  if (v5 != self && v4 != self)
  {
    -[SCDALinkedListItem setNextItem:](v5, "setNextItem:", self);
    -[SCDALinkedListItem setPreviousItem:](self, "setPreviousItem:", v5);
    -[SCDALinkedListItem setNextItem:](self, "setNextItem:", v4);
    -[SCDALinkedListItem setPreviousItem:](v4, "setPreviousItem:", self);
  }

}

- (void)removeFromList
{
  void *v3;
  id v4;

  -[SCDALinkedListItem previousItem](self, "previousItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SCDALinkedListItem nextItem](self, "nextItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNextItem:", v3);
  -[SCDALinkedListItem setPreviousItem:](self, "setPreviousItem:", 0);
  -[SCDALinkedListItem setNextItem:](self, "setNextItem:", 0);
  objc_msgSend(v3, "setPreviousItem:", v4);

}

- (id)object
{
  return self->_object;
}

- (SCDALinkedListItem)previousItem
{
  return self->_previousItem;
}

- (void)setPreviousItem:(id)a3
{
  objc_storeStrong((id *)&self->_previousItem, a3);
}

- (SCDALinkedListItem)nextItem
{
  return self->_nextItem;
}

- (void)setNextItem:(id)a3
{
  objc_storeStrong((id *)&self->_nextItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextItem, 0);
  objc_storeStrong((id *)&self->_previousItem, 0);
  objc_storeStrong(&self->_object, 0);
}

@end
