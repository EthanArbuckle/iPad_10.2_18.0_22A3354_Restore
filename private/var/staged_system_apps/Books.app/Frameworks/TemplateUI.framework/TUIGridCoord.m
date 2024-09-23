@implementation TUIGridCoord

- (TUIGridCoord)initWithGrid:(id)a3 columns:(_NSRange)a4 rows:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v7;
  NSUInteger v8;
  id v10;
  TUIGridCoord *v11;
  TUIGridCoord *v12;
  objc_super v14;

  length = a5.length;
  location = a5.location;
  v7 = a4.length;
  v8 = a4.location;
  v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TUIGridCoord;
  v11 = -[TUIGridCoord init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_grid, v10);
    v12->_columns.location = v8;
    v12->_columns.length = v7;
    v12->_rows.location = location;
    v12->_rows.length = length;
  }

  return v12;
}

- (double)width
{
  id WeakRetained;
  double v4;
  double v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_grid);
  objc_msgSend(WeakRetained, "_lengthForColumns:", self->_columns.location, self->_columns.length);
  v5 = v4;

  return v5;
}

- (double)height
{
  id WeakRetained;
  double v4;
  double v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_grid);
  objc_msgSend(WeakRetained, "_heightForRows:", self->_rows.location, self->_rows.length);
  v5 = v4;

  return v5;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_grid);
}

@end
