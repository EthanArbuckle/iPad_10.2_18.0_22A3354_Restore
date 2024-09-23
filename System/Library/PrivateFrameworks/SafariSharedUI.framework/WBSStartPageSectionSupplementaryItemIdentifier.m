@implementation WBSStartPageSectionSupplementaryItemIdentifier

+ (id)identifierForAction:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "identifier");
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  WBSStartPageSectionSupplementaryItemIdentifier *v4;
  char v5;

  v4 = (WBSStartPageSectionSupplementaryItemIdentifier *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = -[NSString isEqual:](self->_identifier, "isEqual:", v4->_identifier);
    else
      v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
