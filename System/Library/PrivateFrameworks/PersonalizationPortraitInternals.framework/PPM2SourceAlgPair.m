@implementation PPM2SourceAlgPair

- (BOOL)hasSource
{
  return self->_source != 0;
}

- (BOOL)hasAlgorithm
{
  return self->_algorithm != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)PPM2SourceAlgPair;
  -[PPM2SourceAlgPair description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPM2SourceAlgPair dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *source;
  NSString *algorithm;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  source = self->_source;
  if (source)
    objc_msgSend(v3, "setObject:forKey:", source, CFSTR("source"));
  algorithm = self->_algorithm;
  if (algorithm)
    objc_msgSend(v4, "setObject:forKey:", algorithm, CFSTR("algorithm"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PPM2SourceAlgPairReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_source)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_algorithm)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_source)
  {
    objc_msgSend(v4, "setSource:");
    v4 = v5;
  }
  if (self->_algorithm)
  {
    objc_msgSend(v5, "setAlgorithm:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_source, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_algorithm, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *source;
  NSString *algorithm;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((source = self->_source, !((unint64_t)source | v4[2]))
     || -[NSString isEqual:](source, "isEqual:")))
  {
    algorithm = self->_algorithm;
    if ((unint64_t)algorithm | v4[1])
      v7 = -[NSString isEqual:](algorithm, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_source, "hash");
  return -[NSString hash](self->_algorithm, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[2])
  {
    -[PPM2SourceAlgPair setSource:](self, "setSource:");
    v4 = v5;
  }
  if (v4[1])
  {
    -[PPM2SourceAlgPair setAlgorithm:](self, "setAlgorithm:");
    v4 = v5;
  }

}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (NSString)algorithm
{
  return self->_algorithm;
}

- (void)setAlgorithm:(id)a3
{
  objc_storeStrong((id *)&self->_algorithm, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_algorithm, 0);
}

@end
