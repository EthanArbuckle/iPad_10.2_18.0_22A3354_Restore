@implementation TPPBPolicyKeyViewMapping

- (BOOL)hasMatchingRule
{
  return self->_matchingRule != 0;
}

- (BOOL)hasView
{
  return self->_view != 0;
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
  v8.super_class = (Class)TPPBPolicyKeyViewMapping;
  -[TPPBPolicyKeyViewMapping description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPBPolicyKeyViewMapping dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  TPPBDictionaryMatchingRule *matchingRule;
  void *v5;
  NSString *view;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  matchingRule = self->_matchingRule;
  if (matchingRule)
  {
    -[TPPBDictionaryMatchingRule dictionaryRepresentation](matchingRule, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("matching_rule"));

  }
  view = self->_view;
  if (view)
    objc_msgSend(v3, "setObject:forKey:", view, CFSTR("view"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return TPPBPolicyKeyViewMappingReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_matchingRule)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_view)
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
  if (self->_matchingRule)
  {
    objc_msgSend(v4, "setMatchingRule:");
    v4 = v5;
  }
  if (self->_view)
  {
    objc_msgSend(v5, "setView:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[TPPBDictionaryMatchingRule copyWithZone:](self->_matchingRule, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_view, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  TPPBDictionaryMatchingRule *matchingRule;
  NSString *view;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((matchingRule = self->_matchingRule, !((unint64_t)matchingRule | v4[1]))
     || -[TPPBDictionaryMatchingRule isEqual:](matchingRule, "isEqual:")))
  {
    view = self->_view;
    if ((unint64_t)view | v4[2])
      v7 = -[NSString isEqual:](view, "isEqual:");
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
  unint64_t v3;

  v3 = -[TPPBDictionaryMatchingRule hash](self->_matchingRule, "hash");
  return -[NSString hash](self->_view, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  TPPBDictionaryMatchingRule *matchingRule;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  matchingRule = self->_matchingRule;
  v6 = v4[1];
  v7 = v4;
  if (matchingRule)
  {
    if (!v6)
      goto LABEL_7;
    -[TPPBDictionaryMatchingRule mergeFrom:](matchingRule, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[TPPBPolicyKeyViewMapping setMatchingRule:](self, "setMatchingRule:");
  }
  v4 = v7;
LABEL_7:
  if (v4[2])
  {
    -[TPPBPolicyKeyViewMapping setView:](self, "setView:");
    v4 = v7;
  }

}

- (TPPBDictionaryMatchingRule)matchingRule
{
  return self->_matchingRule;
}

- (void)setMatchingRule:(id)a3
{
  objc_storeStrong((id *)&self->_matchingRule, a3);
}

- (NSString)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
  objc_storeStrong((id *)&self->_view, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_matchingRule, 0);
}

+ (id)TPPBPolicyKeyViewMappingWithView:(id)a3 matchingRule:(id)a4
{
  id v5;
  id v6;
  TPPBPolicyKeyViewMapping *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(TPPBPolicyKeyViewMapping);
  -[TPPBPolicyKeyViewMapping setView:](v7, "setView:", v6);

  -[TPPBPolicyKeyViewMapping setMatchingRule:](v7, "setMatchingRule:", v5);
  return v7;
}

@end
