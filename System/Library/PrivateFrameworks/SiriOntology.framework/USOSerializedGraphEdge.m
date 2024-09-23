@implementation USOSerializedGraphEdge

- (USOSerializedGraphEdge)initWithUsoElementId:(int)a3 fromVertex:(unint64_t)a4 toVertex:(unint64_t)a5 enumeration:(unsigned int)a6
{
  self->_fromVertex = a4;
  self->_toVertex = a5;
  self->_usoElementId = a3;
  self->_enumeration = a6;
  return self;
}

- (USOSerializedGraphEdge)initWithCoder:(id)a3
{
  id v4;
  USOSerializedGraphEdge *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *edgeLabel;
  USOSerializedGraphEdge *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)USOSerializedGraphEdge;
  v5 = -[USOSerializedGraphEdge init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("usoElementId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fromVertex"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("toVertex"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("enumeration"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("edgeLabel"));
    v10 = objc_claimAutoreleasedReturnValue();
    v5->_usoElementId = objc_msgSend(v6, "intValue");
    v5->_fromVertex = objc_msgSend(v7, "unsignedLongLongValue");
    v5->_toVertex = objc_msgSend(v8, "unsignedLongLongValue");
    v5->_enumeration = objc_msgSend(v9, "unsignedIntValue");
    edgeLabel = v5->_edgeLabel;
    v5->_edgeLabel = (NSString *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[USOSerializedGraphEdge usoElementId](self, "usoElementId"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("usoElementId"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[USOSerializedGraphEdge fromVertex](self, "fromVertex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("fromVertex"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[USOSerializedGraphEdge toVertex](self, "toVertex"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("toVertex"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[USOSerializedGraphEdge enumeration](self, "enumeration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("enumeration"));

  -[USOSerializedGraphEdge edgeLabel](self, "edgeLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("edgeLabel"));

}

- (int)usoElementId
{
  return self->_usoElementId;
}

- (void)setUsoElementId:(int)a3
{
  self->_usoElementId = a3;
}

- (unint64_t)fromVertex
{
  return self->_fromVertex;
}

- (void)setFromVertex:(unint64_t)a3
{
  self->_fromVertex = a3;
}

- (unint64_t)toVertex
{
  return self->_toVertex;
}

- (void)setToVertex:(unint64_t)a3
{
  self->_toVertex = a3;
}

- (unsigned)enumeration
{
  return self->_enumeration;
}

- (void)setEnumeration:(unsigned int)a3
{
  self->_enumeration = a3;
}

- (NSString)edgeLabel
{
  return self->_edgeLabel;
}

- (void)setEdgeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_edgeLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edgeLabel, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
