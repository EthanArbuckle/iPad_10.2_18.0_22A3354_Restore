@implementation _SVXPlayAudioExpressionParserProvider

- (id)getWithParsingService:(id)a3 preferences:(id)a4
{
  id v5;
  id v6;
  _SVXPlayAudioExpressionParser *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[_SVXExpressionParser initWithParsingService:preferences:]([_SVXPlayAudioExpressionParser alloc], "initWithParsingService:preferences:", v6, v5);

  return v7;
}

@end
