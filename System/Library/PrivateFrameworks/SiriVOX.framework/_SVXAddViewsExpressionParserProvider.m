@implementation _SVXAddViewsExpressionParserProvider

- (id)getWithParsingService:(id)a3 preferences:(id)a4
{
  id v5;
  id v6;
  _SVXAddViewsExpressionParser *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[_SVXAddViewsExpressionParser initWithParsingService:preferences:]([_SVXAddViewsExpressionParser alloc], "initWithParsingService:preferences:", v6, v5);

  return v7;
}

@end
