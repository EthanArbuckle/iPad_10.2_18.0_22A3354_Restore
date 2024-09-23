@implementation _UICommandMenuDeletion

+ (id)deletionWithAnchor:(id)a3
{
  id v3;
  _UICommandMenuDeletion *v4;

  v3 = a3;
  v4 = -[_UICommandMenuDeletion initWithAnchor:]([_UICommandMenuDeletion alloc], "initWithAnchor:", v3);

  return v4;
}

- (_UICommandMenuDeletion)initWithAnchor:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UICommandMenuDeletion;
  return -[_UICommandChange initWithAnchor:](&v4, sel_initWithAnchor_, a3);
}

- (void)acceptItemInsertionVisit:(id)a3 itemDeletionVisit:(id)a4 menuInsertionVisit:(id)a5 menuDeletionVisit:(id)a6
{
  if (a6)
    (*((void (**)(id, _UICommandMenuDeletion *))a6 + 2))(a6, self);
}

- (BOOL)acceptBoolItemInsertionVisit:(id)a3 itemDeletionVisit:(id)a4 menuInsertionVisit:(id)a5 menuDeletionVisit:(id)a6
{
  if (a6)
    return (*((uint64_t (**)(id, _UICommandMenuDeletion *))a6 + 2))(a6, self);
  else
    return 0;
}

@end
