@implementation SSVURLConnectionConsumer

- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  SSURLConnectionResponse *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[SSURLConnectionResponse initWithURLResponse:bodyData:]([SSURLConnectionResponse alloc], "initWithURLResponse:bodyData:", v6, v7);

  return v8;
}

@end
