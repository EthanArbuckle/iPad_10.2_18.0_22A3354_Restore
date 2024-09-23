@implementation _UICommandItemDeletion

+ (id)deletionWithAnchor:(id)a3
{
  id v3;
  _UICommandItemDeletion *v4;

  v3 = a3;
  v4 = -[_UICommandItemDeletion initWithAnchor:]([_UICommandItemDeletion alloc], "initWithAnchor:", v3);

  return v4;
}

- (_UICommandItemDeletion)initWithAnchor:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UICommandItemDeletion;
  return -[_UICommandChange initWithAnchor:](&v4, sel_initWithAnchor_, a3);
}

- (void)acceptItemInsertionVisit:(id)a3 itemDeletionVisit:(id)a4 menuInsertionVisit:(id)a5 menuDeletionVisit:(id)a6
{
  if (a4)
    (*((void (**)(id, _UICommandItemDeletion *))a4 + 2))(a4, self);
}

- (BOOL)acceptBoolItemInsertionVisit:(id)a3 itemDeletionVisit:(id)a4 menuInsertionVisit:(id)a5 menuDeletionVisit:(id)a6
{
  if (a4)
    return (*((uint64_t (**)(id, _UICommandItemDeletion *))a4 + 2))(a4, self);
  else
    return 0;
}

@end
