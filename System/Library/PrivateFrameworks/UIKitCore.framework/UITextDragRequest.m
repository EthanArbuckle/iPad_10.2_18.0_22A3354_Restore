@implementation UITextDragRequest

- (UITextDragRequest)initWithRange:(id)a3 inSession:(id)a4
{
  id v7;
  id v8;
  UITextDragRequest *v9;
  UITextDragRequest *v10;
  uint64_t v11;
  NSArray *existingItems;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UITextDragRequest;
  v9 = -[UITextDragRequest init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dragRange, a3);
    objc_storeStrong((id *)&v10->_dragSession, a4);
    objc_msgSend(v8, "items");
    v11 = objc_claimAutoreleasedReturnValue();
    existingItems = v10->_existingItems;
    v10->_existingItems = (NSArray *)v11;

  }
  return v10;
}

- (UITextRange)dragRange
{
  return self->_dragRange;
}

- (NSArray)existingItems
{
  return self->_existingItems;
}

- (UIDragSession)dragSession
{
  return self->_dragSession;
}

- (NSArray)suggestedItems
{
  return self->_suggestedItems;
}

- (void)setSuggestedItems:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedItems, a3);
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedItems, 0);
  objc_storeStrong((id *)&self->_dragSession, 0);
  objc_storeStrong((id *)&self->_existingItems, 0);
  objc_storeStrong((id *)&self->_dragRange, 0);
}

@end
