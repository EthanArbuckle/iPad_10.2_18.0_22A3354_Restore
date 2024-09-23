@implementation SKUITabularLockupColumn

- (SKUITabularLockupColumn)initWithColumnIdentifier:(int64_t)a3
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SKUITabularLockupColumn *v13;
  NSMutableArray *v14;
  NSMutableArray *childViewElements;
  objc_super v17;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUITabularLockupColumn initWithColumnIdentifier:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUITabularLockupColumn;
  v13 = -[SKUITabularLockupColumn init](&v17, sel_init);
  if (v13)
  {
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    childViewElements = v13->_childViewElements;
    v13->_childViewElements = v14;

    v13->_identifier = a3;
  }
  return v13;
}

- (void)_addChildViewElement:(id)a3
{
  -[NSMutableArray addObject:](self->_childViewElements, "addObject:", a3);
}

- (id)description
{
  void *v3;
  void *v4;
  int64_t identifier;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)SKUITabularLockupColumn;
  -[SKUITabularLockupColumn description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  NSStringFromCGSize(self->_size);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: [%ld, %@, %@]"), v4, identifier, v6, self->_childViewElements);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)childViewElements
{
  return &self->_childViewElements->super;
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(int64_t)a3
{
  self->_identifier = a3;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childViewElements, 0);
}

- (void)initWithColumnIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
