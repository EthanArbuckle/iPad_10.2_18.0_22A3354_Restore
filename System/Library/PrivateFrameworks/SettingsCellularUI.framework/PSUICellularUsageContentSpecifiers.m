@implementation PSUICellularUsageContentSpecifiers

- (id)specifiers
{
  void *v3;
  void *v4;

  -[NSArray arrayByAddingObjectsFromArray:](self->_leadingContentSpecifiers, "arrayByAddingObjectsFromArray:", self->_appSpecifiers);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", self->_trailingContentSpecifiers);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSArray)leadingContentSpecifiers
{
  return self->_leadingContentSpecifiers;
}

- (void)setLeadingContentSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_leadingContentSpecifiers, a3);
}

- (NSMutableArray)appSpecifiers
{
  return self->_appSpecifiers;
}

- (void)setAppSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_appSpecifiers, a3);
}

- (NSArray)trailingContentSpecifiers
{
  return self->_trailingContentSpecifiers;
}

- (void)setTrailingContentSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_trailingContentSpecifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingContentSpecifiers, 0);
  objc_storeStrong((id *)&self->_appSpecifiers, 0);
  objc_storeStrong((id *)&self->_leadingContentSpecifiers, 0);
}

@end
