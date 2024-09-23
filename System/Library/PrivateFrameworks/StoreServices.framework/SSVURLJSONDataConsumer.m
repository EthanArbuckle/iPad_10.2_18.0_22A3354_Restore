@implementation SSVURLJSONDataConsumer

- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, a5);
}

@end
