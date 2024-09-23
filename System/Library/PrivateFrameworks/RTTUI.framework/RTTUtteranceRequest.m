@implementation RTTUtteranceRequest

+ (id)utteranceRequestWithIndex:(unint64_t)a3 forString:(id)a4 inCellPath:(id)a5 call:(id)a6
{
  id v9;
  id v10;
  id v11;
  RTTUtteranceRequest *v12;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = objc_alloc_init(RTTUtteranceRequest);
  -[RTTUtteranceRequest setIndex:](v12, "setIndex:", a3);
  -[RTTUtteranceRequest setString:](v12, "setString:", v11);

  -[RTTUtteranceRequest setCellIndexPath:](v12, "setCellIndexPath:", v10);
  -[RTTUtteranceRequest setCall:](v12, "setCall:", v9);

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v10.receiver = self;
  v10.super_class = (Class)RTTUtteranceRequest;
  -[RTTUtteranceRequest description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[RTTUtteranceRequest index](self, "index");
  -[RTTUtteranceRequest string](self, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTUtteranceRequest cellIndexPath](self, "cellIndexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ [%ld]=%@ - %@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
  objc_storeStrong((id *)&self->_string, a3);
}

- (NSIndexPath)cellIndexPath
{
  return (NSIndexPath *)objc_loadWeakRetained((id *)&self->_cellIndexPath);
}

- (void)setCellIndexPath:(id)a3
{
  objc_storeWeak((id *)&self->_cellIndexPath, a3);
}

- (TUCall)call
{
  return self->_call;
}

- (void)setCall:(id)a3
{
  objc_storeStrong((id *)&self->_call, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_call, 0);
  objc_destroyWeak((id *)&self->_cellIndexPath);
  objc_storeStrong((id *)&self->_string, 0);
}

@end
