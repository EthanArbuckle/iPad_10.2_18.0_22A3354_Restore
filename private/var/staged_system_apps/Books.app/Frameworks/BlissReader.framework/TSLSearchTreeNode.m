@implementation TSLSearchTreeNode

- (TSLSearchTreeNode)initWithSplit:(unsigned __int16)a3
{
  TSLSearchTreeNode *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSLSearchTreeNode;
  result = -[TSLSearchTreeNode init](&v5, "init");
  if (result)
    result->splitchar = a3;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSLSearchTreeNode;
  -[TSLSearchTreeNode dealloc](&v3, "dealloc");
}

- (id)description
{
  objc_class *v3;

  v3 = (objc_class *)objc_opt_class(self);
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@:%p '%@' split %c low %p equal %p high %p>"), NSStringFromClass(v3), self, self->value, self->splitchar, self->low, self->equal, self->high);
}

- (id)find:(unsigned __int16 *)a3
{
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;
  unsigned int v6;

  if (self)
  {
    v3 = *a3;
    do
    {
      v4 = *((unsigned __int16 *)self + 4);
      if (v3 >= v4)
      {
        if (v3 <= v4)
        {
          self = (id)*((_QWORD *)self + 3);
          v6 = a3[1];
          ++a3;
          v3 = v6;
          if (!v6)
            return self;
          continue;
        }
        v5 = 32;
      }
      else
      {
        v5 = 16;
      }
      self = *(id *)((char *)self + v5);
    }
    while (self);
  }
  return self;
}

- (void)traverse:(id)a3
{
  -[TSLSearchTreeNode traverse:](self->low, "traverse:");
  if (self->splitchar)
    -[TSLSearchTreeNode traverse:](self->equal, "traverse:", a3);
  else
    (*((void (**)(id, id))a3 + 2))(a3, self->value);
  -[TSLSearchTreeNode traverse:](self->high, "traverse:", a3);
}

- (id)collect
{
  id v3;

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  objc_msgSend(v3, "addObjectsFromArray:", -[TSLSearchTreeNode collect](self->low, "collect"));
  if (self->splitchar)
    objc_msgSend(v3, "addObjectsFromArray:", -[TSLSearchTreeNode collect](self->equal, "collect"));
  else
    objc_msgSend(v3, "addObject:", self->value);
  objc_msgSend(v3, "addObjectsFromArray:", -[TSLSearchTreeNode collect](self->high, "collect"));
  return v3;
}

@end
