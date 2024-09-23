@implementation _SVXExpressionParsingModel

- (_SVXExpressionParsingModel)initWithParseableExpressions:(id)a3 aceViewIdByExpressionId:(id)a4 aceViewByAceId:(id)a5
{
  id v9;
  id v10;
  id v11;
  _SVXExpressionParsingModel *v12;
  _SVXExpressionParsingModel *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_SVXExpressionParsingModel;
  v12 = -[_SVXExpressionParsingModel init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_parseableExpressions, a3);
    objc_storeStrong((id *)&v13->_aceViewIdByExpressionId, a4);
    objc_storeStrong((id *)&v13->_aceViewByAceId, a5);
  }

  return v13;
}

- (NSMutableArray)parseableExpressions
{
  return self->_parseableExpressions;
}

- (void)setParseableExpressions:(id)a3
{
  objc_storeStrong((id *)&self->_parseableExpressions, a3);
}

- (NSMutableDictionary)aceViewIdByExpressionId
{
  return self->_aceViewIdByExpressionId;
}

- (void)setAceViewIdByExpressionId:(id)a3
{
  objc_storeStrong((id *)&self->_aceViewIdByExpressionId, a3);
}

- (NSMutableDictionary)aceViewByAceId
{
  return self->_aceViewByAceId;
}

- (void)setAceViewByAceId:(id)a3
{
  objc_storeStrong((id *)&self->_aceViewByAceId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aceViewByAceId, 0);
  objc_storeStrong((id *)&self->_aceViewIdByExpressionId, 0);
  objc_storeStrong((id *)&self->_parseableExpressions, 0);
}

@end
