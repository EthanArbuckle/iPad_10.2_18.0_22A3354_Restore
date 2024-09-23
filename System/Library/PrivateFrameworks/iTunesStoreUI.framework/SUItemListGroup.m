@implementation SUItemListGroup

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUItemListGroup;
  -[SUItemListGroup dealloc](&v3, sel_dealloc);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUItemListGroup;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ (%@, %lu)"), -[SUItemListGroup description](&v3, sel_description), -[SUItem title](self->_separatorItem, "title"), -[NSMutableArray count](self->_items, "count"));
}

- (NSString)indexBarTitle
{
  NSString *result;

  result = -[SUItem stringValueForProperty:](self->_separatorItem, "stringValueForProperty:", CFSTR("index-title"));
  if (!result)
    return -[SUItem title](self->_separatorItem, "title");
  return result;
}

- (NSMutableArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (SUItem)separatorItem
{
  return self->_separatorItem;
}

- (void)setSeparatorItem:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
