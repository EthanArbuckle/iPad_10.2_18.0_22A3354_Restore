@implementation _WTTextChunk

- (id)initChunkWithIdentifier:(id)a3
{
  id v5;
  _WTTextChunk *v6;
  _WTTextChunk *v7;
  _WTTextChunk *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_WTTextChunk;
  v6 = -[_WTTextChunk init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    v8 = v7;
  }

  return v7;
}

- (_WTTextChunk)init
{
  void *v3;
  void *v4;
  _WTTextChunk *v5;

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_WTTextChunk initChunkWithIdentifier:](self, "initChunkWithIdentifier:", v4);

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _WTTextChunk *v4;
  void *v5;
  id v6;

  v4 = [_WTTextChunk alloc];
  -[_WTTextChunk identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_WTTextChunk initChunkWithIdentifier:](v4, "initChunkWithIdentifier:", v5);

  return v6;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
