@implementation WBSHistorySessionWithItems

- (WBSHistorySessionWithItems)init
{

  return 0;
}

- (WBSHistorySessionWithItems)initWithSessionStartDate:(id)a3
{

  return 0;
}

- (WBSHistorySessionWithItems)initWithSessionStartDate:(id)a3 items:(id)a4
{
  id v6;
  WBSHistorySessionWithItems *v7;
  uint64_t v8;
  NSArray *items;
  WBSHistorySessionWithItems *v10;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WBSHistorySessionWithItems;
  v7 = -[WBSHistorySession initWithSessionStartDate:](&v12, sel_initWithSessionStartDate_, a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    items = v7->_items;
    v7->_items = (NSArray *)v8;

    v10 = v7;
  }

  return v7;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
}

@end
