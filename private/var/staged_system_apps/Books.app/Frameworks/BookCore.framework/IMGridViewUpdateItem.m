@implementation IMGridViewUpdateItem

- (IMGridViewUpdateItem)initWithAction:(int)a3 forIndex:(unint64_t)a4
{
  IMGridViewUpdateItem *result;

  result = -[IMGridViewUpdateItem init](self, "init");
  if (result)
  {
    result->_action = a3;
    result->_index = a4;
  }
  return result;
}

- (int64_t)compareIndexes:(id)a3
{
  id v4;
  unint64_t v5;
  int64_t v6;
  unint64_t v7;

  v4 = a3;
  v5 = -[IMGridViewUpdateItem index](self, "index");
  if (v5 <= (unint64_t)objc_msgSend(v4, "index"))
  {
    v7 = -[IMGridViewUpdateItem index](self, "index");
    if (v7 >= (unint64_t)objc_msgSend(v4, "index"))
      v6 = 0;
    else
      v6 = -1;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (int64_t)inverseCompareIndexes:(id)a3
{
  return (int64_t)_objc_msgSend(a3, "compareIndexes:", self);
}

- (int)action
{
  return self->_action;
}

- (void)setAction:(int)a3
{
  self->_action = a3;
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

@end
