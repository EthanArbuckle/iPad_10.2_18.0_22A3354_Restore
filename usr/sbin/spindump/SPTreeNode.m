@implementation SPTreeNode

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SPTreeNode;
  -[SPTreeNode dealloc](&v3, "dealloc");
}

- (id)debugDescription
{
  NSString *angleBracketContents;
  const char *v4;
  NSArray *bodies;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  angleBracketContents = self->_angleBracketContents;
  if (angleBracketContents)
  {
    if (self->_isKernel)
      v4 = "*";
    else
      v4 = " ";
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s%d %@ (%@)"), v4, self->_count, angleBracketContents, self->_stateInfo, v9, v10);
  }
  else
  {
    bodies = self->_bodies;
    if (self->_isKernel)
      v7 = "*";
    else
      v7 = " ";
    if (bodies)
      return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s%d %@ (x%lu) [0x%llx] (%@)"), v7, self->_count, -[NSArray firstObject](bodies, "firstObject"), -[NSArray count](self->_bodies, "count"), self->_address, self->_stateInfo);
    else
      return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s%d (%@)"), v7, self->_count, self->_stateInfo, v8, v9, v10);
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parent);
}

@end
