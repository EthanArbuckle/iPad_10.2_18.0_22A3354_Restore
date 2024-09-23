@implementation SXFirstViewportComponentInsertionCondition

- (SXFirstViewportComponentInsertionCondition)init
{
  return -[SXFirstViewportComponentInsertionCondition initWithAllowFirstViewportException:](self, "initWithAllowFirstViewportException:", 1);
}

- (SXFirstViewportComponentInsertionCondition)initWithAllowFirstViewportException:(BOOL)a3
{
  SXFirstViewportComponentInsertionCondition *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SXFirstViewportComponentInsertionCondition;
  result = -[SXFirstViewportComponentInsertionCondition init](&v5, sel_init);
  if (result)
    result->_allowFirstViewportException = a3;
  return result;
}

- (BOOL)validateMarker:(id)a3 componentTraits:(unint64_t)a4 layoutProvider:(id)a5
{
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  BOOL v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  BOOL v20;
  BOOL v21;
  char v22;

  v7 = a3;
  v8 = a5;
  objc_msgSend(v7, "approximateLocation");
  v10 = v9;
  objc_msgSend(v8, "viewportSize");
  v12 = v11;
  objc_msgSend(v7, "trailingComponent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(v7, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v15, "count") == 0;

  }
  objc_msgSend(v8, "documentSize");
  v17 = v16;
  objc_msgSend(v8, "viewportSize");
  if (v10 >= v12)
  {
    v22 = 1;
  }
  else
  {
    v19 = v18;
    v20 = -[SXFirstViewportComponentInsertionCondition allowFirstViewportException](self, "allowFirstViewportException");
    v21 = v17 <= v19 && v20;
    v22 = v21 && v14;
  }

  return v22;
}

- (BOOL)allowFirstViewportException
{
  return self->_allowFirstViewportException;
}

- (void)setAllowFirstViewportException:(BOOL)a3
{
  self->_allowFirstViewportException = a3;
}

@end
