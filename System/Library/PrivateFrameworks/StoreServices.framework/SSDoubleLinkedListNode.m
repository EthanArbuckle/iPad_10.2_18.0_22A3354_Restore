@implementation SSDoubleLinkedListNode

- (SSDoubleLinkedListNode)initWithObject:(id)a3
{
  id v5;
  SSDoubleLinkedListNode *v6;
  SSDoubleLinkedListNode *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SSDoubleLinkedListNode;
  v6 = -[SSDoubleLinkedListNode init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong(&v6->_object, a3);

  return v7;
}

- (void)setPrevious:(id)a3
{
  objc_storeStrong((id *)&self->_previous, a3);
}

- (void)setNext:(id)a3
{
  objc_storeStrong((id *)&self->_next, a3);
}

- (void)setListIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_listIdentifier, a3);
}

- (NSString)listIdentifier
{
  return self->_listIdentifier;
}

- (SSDoubleLinkedListNode)init
{
  return -[SSDoubleLinkedListNode initWithObject:](self, "initWithObject:", 0);
}

- (SSDoubleLinkedListNode)previous
{
  return self->_previous;
}

- (id)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
  objc_storeStrong(&self->_object, a3);
}

- (SSDoubleLinkedListNode)next
{
  return self->_next;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listIdentifier, 0);
  objc_storeStrong((id *)&self->_next, 0);
  objc_storeStrong(&self->_object, 0);
  objc_storeStrong((id *)&self->_previous, 0);
}

@end
