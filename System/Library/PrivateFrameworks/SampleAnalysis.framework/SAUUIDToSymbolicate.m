@implementation SAUUIDToSymbolicate

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NSMutableArray firstObject](self->_binaries, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray firstObject](self->_binaries, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ %@ (%lu)"), v5, v7, -[NSMutableArray count](self->_binaries, "count"));

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_binaries, 0);
}

@end
