@implementation _UICollectionLayoutListSectionData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorConfiguration, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t v5;
  UIListSeparatorConfiguration *separatorConfiguration;
  UIListSeparatorConfiguration *v7;
  UIListSeparatorConfiguration *v8;
  UIListSeparatorConfiguration *v9;
  BOOL v10;
  BOOL v11;

  if (!a3)
    return 0;
  if (a3 != self)
  {
    v4 = a3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_17;
    v5 = self ? self->_selectionGrouping : 0;
    if (*((_QWORD *)v4 + 2) != v5)
      goto LABEL_17;
    separatorConfiguration = self->_separatorConfiguration;
    v7 = (UIListSeparatorConfiguration *)*((id *)v4 + 1);
    v8 = separatorConfiguration;
    if (v7 == v8)
    {

    }
    else
    {
      v9 = v8;
      if (!v7 || !v8)
      {

LABEL_17:
        v11 = 0;
        goto LABEL_18;
      }
      v10 = -[UIListSeparatorConfiguration isEqual:](v7, "isEqual:", v8);

      if (!v10)
        goto LABEL_17;
    }
    v11 = 1;
LABEL_18:

    return v11;
  }
  return 1;
}

- (unint64_t)hash
{
  unint64_t selectionGrouping;

  selectionGrouping = self->_selectionGrouping;
  return -[UIListSeparatorConfiguration hash](self->_separatorConfiguration, "hash") ^ selectionGrouping;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p grouping: %lu separatorConfig: %@>"), objc_opt_class(), self, self->_selectionGrouping, self->_separatorConfiguration);
}

@end
