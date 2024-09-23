@implementation WFRequestOptions

- (void)addHttpHeaderField:(id)a3 withValue:(id)a4
{
  id v6;
  NSMutableDictionary *httpHeaderDictionary;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  httpHeaderDictionary = self->_httpHeaderDictionary;
  if (!httpHeaderDictionary)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v9 = self->_httpHeaderDictionary;
    self->_httpHeaderDictionary = v8;

    httpHeaderDictionary = self->_httpHeaderDictionary;
  }
  -[NSMutableDictionary setValue:forKey:](httpHeaderDictionary, "setValue:forKey:", v6, v10);

}

- (NSMutableDictionary)httpHeaderDictionary
{
  return self->_httpHeaderDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_httpHeaderDictionary, 0);
}

@end
