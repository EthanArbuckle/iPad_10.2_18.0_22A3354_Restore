@implementation OSABinaryImageSegment

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolInfo, 0);
}

- (id)full_details
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99E08]);
  v13[0] = CFSTR("uuid");
  -[OSASymbolInfo get_uuid](self->_symbolInfo, "get_uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  v13[1] = CFSTR("base");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[OSASymbolInfo start](self->_symbolInfo, "start"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v5;
  v13[2] = CFSTR("source");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%c"), self->_source);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v6;
  v13[3] = CFSTR("size");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[OSASymbolInfo size](self->_symbolInfo, "size"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithDictionary:", v8);

  -[OSASymbolInfo name](self->_symbolInfo, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("name"));

  objc_msgSend(v9, "setObject:forKeyedSubscript:", self->_symbolInfo->legacy_arch, CFSTR("arch"));
  -[OSASymbolInfo path](self->_symbolInfo, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("path"));

  return v9;
}

- (OSASymbolInfo)symbolInfo
{
  return self->_symbolInfo;
}

- (OSABinaryImageSegment)initWithAddress:(unint64_t)a3 size:(unint64_t)a4 for:(unsigned __int8)a5[16]
{
  OSASymbolInfo *v6;
  OSABinaryImageSegment *v7;

  v6 = -[OSASymbolInfo initWithAddress:size:for:]([OSASymbolInfo alloc], "initWithAddress:size:for:", a3, a4, a5);
  v7 = -[OSABinaryImageSegment initWithSymbol:](self, "initWithSymbol:", v6);

  return v7;
}

- (OSABinaryImageSegment)initWithSymbol:(id)a3
{
  id v5;
  OSABinaryImageSegment *v6;
  OSABinaryImageSegment *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)OSABinaryImageSegment;
  v6 = -[OSABinaryImageSegment init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_symbolInfo, a3);
    v7->_source = 0;
    v7->_used_index = 0;
  }

  return v7;
}

- (int)source
{
  return self->_source;
}

- (unint64_t)used_index
{
  return self->_used_index;
}

- (void)setUsed_index:(unint64_t)a3
{
  self->_used_index = a3;
}

- (void)setSource:(int)a3
{
  self->_source = a3;
}

- (id)details
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  -[OSASymbolInfo get_uuid](self->_symbolInfo, "get_uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[OSASymbolInfo start](self->_symbolInfo, "start"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%c"), self->_source);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
