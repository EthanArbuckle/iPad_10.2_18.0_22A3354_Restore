@implementation BKNavigationHistory

- (NSMutableArray)stack
{
  NSMutableArray *stack;
  NSMutableArray *v4;
  NSMutableArray *v5;

  stack = self->_stack;
  if (!stack)
  {
    v4 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v5 = self->_stack;
    self->_stack = v4;

    stack = self->_stack;
  }
  return stack;
}

- (BOOL)isAtTopOfStack
{
  id v3;
  void *v4;

  v3 = -[BKNavigationHistory cursor](self, "cursor");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKNavigationHistory stack](self, "stack"));
  LOBYTE(v3) = v3 == objc_msgSend(v4, "count");

  return (char)v3;
}

- (void)_trim
{
  BKNavigationHistory *i;
  unint64_t v3;
  void *v4;
  id v5;
  void *v6;

  for (i = self; ; self = i)
  {
    v3 = -[BKNavigationHistory cursor](self, "cursor");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKNavigationHistory stack](i, "stack"));
    v5 = objc_msgSend(v4, "count");

    if (v3 >= (unint64_t)v5)
      break;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKNavigationHistory stack](i, "stack"));
    objc_msgSend(v6, "removeLastObject");

  }
}

- (void)add:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (!-[BKNavigationHistory isAtTopOfStack](self, "isAtTopOfStack"))
    -[BKNavigationHistory truncateHistory](self, "truncateHistory");
  v4 = v7;
  if (v7)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKNavigationHistory stack](self, "stack"));
    objc_msgSend(v5, "addObject:", v7);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKNavigationHistory stack](self, "stack"));
    -[BKNavigationHistory setCursor:](self, "setCursor:", objc_msgSend(v6, "count"));

    v4 = v7;
  }

}

- (id)nextEntity
{
  unint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v3 = -[BKNavigationHistory cursor](self, "cursor");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKNavigationHistory stack](self, "stack"));
  v5 = objc_msgSend(v4, "count");

  if (v3 >= (unint64_t)v5)
  {
    v7 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKNavigationHistory stack](self, "stack"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", v3));

  }
  return v7;
}

- (id)currentEntity
{
  unsigned int v3;
  char *v4;
  void *v5;
  char *v6;
  void *v7;
  void *v8;

  v3 = -[BKNavigationHistory isAtTopOfStack](self, "isAtTopOfStack");
  v4 = (char *)-[BKNavigationHistory cursor](self, "cursor") - (v3 ^ 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKNavigationHistory stack](self, "stack"));
  v6 = (char *)objc_msgSend(v5, "count");

  if (v4 >= v6)
  {
    v8 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKNavigationHistory stack](self, "stack"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", v4));

  }
  return v8;
}

- (id)previousEntity
{
  unsigned int v3;
  int64_t v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v3 = -[BKNavigationHistory isAtTopOfStack](self, "isAtTopOfStack");
  v4 = -[BKNavigationHistory cursor](self, "cursor");
  v5 = -2;
  if (v3)
    v5 = -1;
  v6 = v4 + v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKNavigationHistory stack](self, "stack"));
  v8 = objc_msgSend(v7, "count");

  if (v6 >= (unint64_t)v8)
  {
    v10 = 0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKNavigationHistory stack](self, "stack"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", v6));

  }
  return v10;
}

- (void)rewind
{
  -[BKNavigationHistory setCursor:](self, "setCursor:", (char *)-[BKNavigationHistory cursor](self, "cursor") - 1);
}

- (void)skip
{
  -[BKNavigationHistory setCursor:](self, "setCursor:", (char *)-[BKNavigationHistory cursor](self, "cursor") + 1);
}

- (void)truncateHistory
{
  -[BKNavigationHistory rewind](self, "rewind");
  -[BKNavigationHistory _trim](self, "_trim");
}

- (id)allObjects
{
  return self->_stack;
}

- (id)description
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  *(_QWORD *)&v3 = objc_opt_class(self).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKNavigationHistory stack](self, "stack", v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p>(Element Count: %d; Cursor: %d)"),
                   v5,
                   self,
                   objc_msgSend(v6, "count"),
                   -[BKNavigationHistory cursor](self, "cursor")));

  return v7;
}

- (id)recursiveDescription
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  int64_t v8;
  void *v9;
  void *v10;

  *(_QWORD *)&v3 = objc_opt_class(self).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKNavigationHistory stack](self, "stack", v3));
  v7 = objc_msgSend(v6, "count");
  v8 = -[BKNavigationHistory cursor](self, "cursor");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKNavigationHistory stack](self, "stack"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p>(Element Count: %d; Cursor: %d) ; %@"),
                    v5,
                    self,
                    v7,
                    v8,
                    v9));

  return v10;
}

- (void)setStack:(id)a3
{
  objc_storeStrong((id *)&self->_stack, a3);
}

- (int64_t)cursor
{
  return self->_cursor;
}

- (void)setCursor:(int64_t)a3
{
  self->_cursor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stack, 0);
}

@end
