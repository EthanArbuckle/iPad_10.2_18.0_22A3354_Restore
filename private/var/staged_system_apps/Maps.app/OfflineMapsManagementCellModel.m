@implementation OfflineMapsManagementCellModel

- (OfflineMapsManagementCellModel)init
{
  OfflineMapsManagementCellModel *v2;
  OfflineMapsManagementCellModel *v3;
  OfflineMapsManagementCellModel *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OfflineMapsManagementCellModel;
  v2 = -[OfflineMapsManagementCellModel init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v2->_enabled = 1;
    v4 = v2;
  }

  return v3;
}

- (id)identifier
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[OfflineMapsManagementCellModel cellType](self, "cellType")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v5, v6));

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementCellModel identifier](self, "identifier"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  OfflineMapsManagementCellModel *v4;
  OfflineMapsManagementCellModel *v5;
  uint64_t v6;
  OfflineMapsManagementCellModel *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  unsigned int v11;

  v4 = (OfflineMapsManagementCellModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v11) = 1;
  }
  else if (v4 && (v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementCellModel identifier](v7, "identifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementCellModel identifier](self, "identifier"));
    if (v8 == v9 || objc_msgSend(v8, "isEqual:", v9))
    {
      v10 = -[OfflineMapsManagementCellModel isEnabled](v7, "isEnabled");
      v11 = v10 ^ -[OfflineMapsManagementCellModel isEnabled](self, "isEnabled") ^ 1;
    }
    else
    {
      LOBYTE(v11) = 0;
    }

  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (unint64_t)cellType
{
  return self->_cellType;
}

- (void)setCellType:(unint64_t)a3
{
  self->_cellType = a3;
}

- (MapsDebugTableRow)tableRow
{
  return self->_tableRow;
}

- (void)setTableRow:(id)a3
{
  objc_storeStrong((id *)&self->_tableRow, a3);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableRow, 0);
}

@end
