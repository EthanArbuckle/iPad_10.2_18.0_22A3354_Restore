@implementation _SVXRemoteExpressionParsingServiceProvider

- (id)getWithAceHandler:(id)a3
{
  id v3;
  _SVXRemoteExpressionParsingService *v4;

  v3 = a3;
  v4 = -[_SVXRemoteExpressionParsingService initWithAceHandler:]([_SVXRemoteExpressionParsingService alloc], "initWithAceHandler:", v3);

  return v4;
}

@end
