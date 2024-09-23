@implementation RETokenStack

- (RETokenStack)initWithTokenBuffer:(id)a3
{
  id v5;
  RETokenStack *v6;
  RETokenStack *v7;
  uint64_t v8;
  NSMutableArray *tokenStack;
  uint64_t v10;
  NSMutableArray *positionStack;
  NSMutableArray *v12;
  void *v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)RETokenStack;
  v6 = -[RETokenStack init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_buffer, a3);
    v7->_position = 0;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    tokenStack = v7->_tokenStack;
    v7->_tokenStack = (NSMutableArray *)v8;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    positionStack = v7->_positionStack;
    v7->_positionStack = (NSMutableArray *)v10;

    if ((-[RETokenBuffer isEmpty](v7->_buffer, "isEmpty") & 1) == 0)
    {
      v12 = v7->_tokenStack;
      -[RETokenBuffer currentToken](v7->_buffer, "currentToken");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v12, "addObject:", v13);

    }
  }

  return v7;
}

- (REScriptToken)currentToken
{
  return (REScriptToken *)-[NSMutableArray objectAtIndexedSubscript:](self->_tokenStack, "objectAtIndexedSubscript:", self->_position);
}

- (BOOL)isEmpty
{
  if (-[NSMutableArray count](self->_tokenStack, "count") - 1 <= self->_position)
    return -[RETokenBuffer isEmpty](self->_buffer, "isEmpty");
  else
    return 0;
}

- (void)next
{
  unint64_t position;
  NSMutableArray *tokenStack;
  void *v5;

  if (!-[RETokenStack isEmpty](self, "isEmpty"))
  {
    position = self->_position;
    if (position >= -[NSMutableArray count](self->_tokenStack, "count") - 1)
    {
      -[RETokenBuffer next](self->_buffer, "next");
      tokenStack = self->_tokenStack;
      -[RETokenBuffer currentToken](self->_buffer, "currentToken");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](tokenStack, "addObject:", v5);

    }
    ++self->_position;
  }
}

- (void)consume
{
  if (-[NSMutableArray count](self->_positionStack, "count"))
    -[NSMutableArray removeLastObject](self->_positionStack, "removeLastObject");
}

- (void)pop
{
  void *v3;

  if (-[NSMutableArray count](self->_positionStack, "count"))
  {
    -[NSMutableArray lastObject](self->_positionStack, "lastObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    self->_position = objc_msgSend(v3, "unsignedIntegerValue");

    -[NSMutableArray removeLastObject](self->_positionStack, "removeLastObject");
  }
}

- (void)push
{
  NSMutableArray *positionStack;
  id v3;

  positionStack = self->_positionStack;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_position);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](positionStack, "addObject:", v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_positionStack, 0);
  objc_storeStrong((id *)&self->_tokenStack, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
}

@end
