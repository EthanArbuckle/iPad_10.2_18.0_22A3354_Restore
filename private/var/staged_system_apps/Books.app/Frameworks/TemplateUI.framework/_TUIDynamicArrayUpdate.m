@implementation _TUIDynamicArrayUpdate

- (id)description
{
  _TUIDynamicArrayUpdate *v2;
  void *v3;
  NSString *v4;
  void *v5;

  v2 = self;
  switch(self->_kind)
  {
    case 0uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_newIndex));
      v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("insert %@"), v3);
      goto LABEL_5;
    case 1uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_oldIndex));
      v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("delete %@"), v3);
      goto LABEL_5;
    case 2uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_oldIndex));
      v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("update %@"), v3);
LABEL_5:
      v2 = (_TUIDynamicArrayUpdate *)objc_claimAutoreleasedReturnValue(v4);
      goto LABEL_7;
    case 3uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_oldIndex));
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v2->_newIndex));
      v2 = (_TUIDynamicArrayUpdate *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("move %@ -> %@"), v3, v5));

LABEL_7:
      break;
    default:
      return v2;
  }
  return v2;
}

- (unint64_t)newIndex
{
  return self->_newIndex;
}

- (void)setNewIndex:(unint64_t)a3
{
  self->_newIndex = a3;
}

- (unint64_t)oldIndex
{
  return self->_oldIndex;
}

- (void)setOldIndex:(unint64_t)a3
{
  self->_oldIndex = a3;
}

- (unint64_t)kind
{
  return self->_kind;
}

- (void)setKind:(unint64_t)a3
{
  self->_kind = a3;
}

@end
