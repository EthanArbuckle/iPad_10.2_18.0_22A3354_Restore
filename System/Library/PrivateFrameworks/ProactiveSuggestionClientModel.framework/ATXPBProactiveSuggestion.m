@implementation ATXPBProactiveSuggestion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidString, 0);
  objc_storeStrong((id *)&self->_uiSpecification, 0);
  objc_storeStrong((id *)&self->_scoreSpecification, 0);
  objc_storeStrong((id *)&self->_executableSpecification, 0);
  objc_storeStrong((id *)&self->_clientModelSpecification, 0);
}

- (void)setUuidString:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 40), a2);
}

- (void)setUiSpecification:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 32), a2);
}

- (void)setScoreSpecification:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)setExecutableSpecification:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 16), a2);
}

- (void)setClientModelSpecification:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 8), a2);
}

- (uint64_t)uuidString
{
  if (result)
    return *(_QWORD *)(result + 40);
  return result;
}

- (uint64_t)uiSpecification
{
  if (result)
    return *(_QWORD *)(result + 32);
  return result;
}

- (uint64_t)scoreSpecification
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

- (BOOL)hasUuidString
{
  if (result)
    return *(_QWORD *)(result + 40) != 0;
  return result;
}

- (uint64_t)executableSpecification
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (uint64_t)clientModelSpecification
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBProactiveSuggestionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_uuidString)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_clientModelSpecification)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_executableSpecification)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_uiSpecification)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_scoreSpecification)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (BOOL)hasClientModelSpecification
{
  if (result)
    return *(_QWORD *)(result + 8) != 0;
  return result;
}

- (BOOL)hasExecutableSpecification
{
  if (result)
    return *(_QWORD *)(result + 16) != 0;
  return result;
}

- (BOOL)hasUiSpecification
{
  if (result)
    return *(_QWORD *)(result + 32) != 0;
  return result;
}

- (BOOL)hasScoreSpecification
{
  if (result)
    return *(_QWORD *)(result + 24) != 0;
  return result;
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
  v8.super_class = (Class)ATXPBProactiveSuggestion;
  -[ATXPBProactiveSuggestion description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBProactiveSuggestion dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *uuidString;
  ATXPBProactiveSuggestionClientModelSpecification *clientModelSpecification;
  void *v7;
  ATXPBProactiveSuggestionExecutableSpecification *executableSpecification;
  void *v9;
  ATXPBProactiveSuggestionUISpecification *uiSpecification;
  void *v11;
  ATXPBProactiveSuggestionScoreSpecification *scoreSpecification;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  uuidString = self->_uuidString;
  if (uuidString)
    objc_msgSend(v3, "setObject:forKey:", uuidString, CFSTR("uuidString"));
  clientModelSpecification = self->_clientModelSpecification;
  if (clientModelSpecification)
  {
    -[ATXPBProactiveSuggestionClientModelSpecification dictionaryRepresentation](clientModelSpecification, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("clientModelSpecification"));

  }
  executableSpecification = self->_executableSpecification;
  if (executableSpecification)
  {
    -[ATXPBProactiveSuggestionExecutableSpecification dictionaryRepresentation](executableSpecification, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("executableSpecification"));

  }
  uiSpecification = self->_uiSpecification;
  if (uiSpecification)
  {
    -[ATXPBProactiveSuggestionUISpecification dictionaryRepresentation](uiSpecification, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("uiSpecification"));

  }
  scoreSpecification = self->_scoreSpecification;
  if (scoreSpecification)
  {
    -[ATXPBProactiveSuggestionScoreSpecification dictionaryRepresentation](scoreSpecification, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("scoreSpecification"));

  }
  return v4;
}

- (void)copyTo:(_QWORD *)a1
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (a1)
  {
    v3 = (void *)a1[5];
    if (v3)
      -[ATXPBProactiveSuggestion setUuidString:]((uint64_t)v8, v3);
    v4 = (void *)a1[1];
    if (v4)
      -[ATXPBProactiveSuggestion setClientModelSpecification:]((uint64_t)v8, v4);
    v5 = (void *)a1[2];
    if (v5)
      -[ATXPBProactiveSuggestion setExecutableSpecification:]((uint64_t)v8, v5);
    v6 = (void *)a1[4];
    if (v6)
      -[ATXPBProactiveSuggestion setUiSpecification:]((uint64_t)v8, v6);
    v7 = (void *)a1[3];
    if (v7)
      -[ATXPBProactiveSuggestion setScoreSpecification:]((uint64_t)v8, v7);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_uuidString, "copyWithZone:", a3);
  v7 = (void *)v5[5];
  v5[5] = v6;

  v8 = -[ATXPBProactiveSuggestionClientModelSpecification copyWithZone:](self->_clientModelSpecification, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v10 = -[ATXPBProactiveSuggestionExecutableSpecification copyWithZone:](self->_executableSpecification, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  v12 = -[ATXPBProactiveSuggestionUISpecification copyWithZone:](self->_uiSpecification, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  v14 = -[ATXPBProactiveSuggestionScoreSpecification copyWithZone:](self->_scoreSpecification, "copyWithZone:", a3);
  v15 = (void *)v5[3];
  v5[3] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *uuidString;
  ATXPBProactiveSuggestionClientModelSpecification *clientModelSpecification;
  ATXPBProactiveSuggestionExecutableSpecification *executableSpecification;
  ATXPBProactiveSuggestionUISpecification *uiSpecification;
  ATXPBProactiveSuggestionScoreSpecification *scoreSpecification;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((uuidString = self->_uuidString, !((unint64_t)uuidString | v4[5]))
     || -[NSString isEqual:](uuidString, "isEqual:"))
    && ((clientModelSpecification = self->_clientModelSpecification,
         !((unint64_t)clientModelSpecification | v4[1]))
     || -[ATXPBProactiveSuggestionClientModelSpecification isEqual:](clientModelSpecification, "isEqual:"))
    && ((executableSpecification = self->_executableSpecification, !((unint64_t)executableSpecification | v4[2]))
     || -[ATXPBProactiveSuggestionExecutableSpecification isEqual:](executableSpecification, "isEqual:"))
    && ((uiSpecification = self->_uiSpecification, !((unint64_t)uiSpecification | v4[4]))
     || -[ATXPBProactiveSuggestionUISpecification isEqual:](uiSpecification, "isEqual:")))
  {
    scoreSpecification = self->_scoreSpecification;
    if ((unint64_t)scoreSpecification | v4[3])
      v10 = -[ATXPBProactiveSuggestionScoreSpecification isEqual:](scoreSpecification, "isEqual:");
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -[NSString hash](self->_uuidString, "hash");
  v4 = -[ATXPBProactiveSuggestionClientModelSpecification hash](self->_clientModelSpecification, "hash") ^ v3;
  v5 = -[ATXPBProactiveSuggestionExecutableSpecification hash](self->_executableSpecification, "hash");
  v6 = v4 ^ v5 ^ -[ATXPBProactiveSuggestionUISpecification hash](self->_uiSpecification, "hash");
  return v6 ^ -[ATXPBProactiveSuggestionScoreSpecification hash](self->_scoreSpecification, "hash");
}

- (void)mergeFrom:(uint64_t)a1
{
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD *v10;

  v3 = a2;
  v4 = v3;
  if (!a1)
    goto LABEL_28;
  v5 = (void *)v3[5];
  v10 = v3;
  if (v5)
  {
    objc_storeStrong((id *)(a1 + 40), v5);
    v4 = v10;
  }
  v6 = (void *)v4[1];
  if (*(_QWORD *)(a1 + 8))
  {
    if (!v6)
      goto LABEL_10;
    -[ATXPBProactiveSuggestionClientModelSpecification mergeFrom:](*(_QWORD *)(a1 + 8), v6);
  }
  else
  {
    if (!v6)
      goto LABEL_10;
    objc_storeStrong((id *)(a1 + 8), v6);
  }
  v4 = v10;
LABEL_10:
  v7 = (void *)v4[2];
  if (*(_QWORD *)(a1 + 16))
  {
    if (!v7)
      goto LABEL_16;
    -[ATXPBProactiveSuggestionExecutableSpecification mergeFrom:](*(_QWORD *)(a1 + 16), v7);
  }
  else
  {
    if (!v7)
      goto LABEL_16;
    objc_storeStrong((id *)(a1 + 16), v7);
  }
  v4 = v10;
LABEL_16:
  v8 = (void *)v4[4];
  if (*(_QWORD *)(a1 + 32))
  {
    if (!v8)
      goto LABEL_22;
    -[ATXPBProactiveSuggestionUISpecification mergeFrom:](*(_QWORD *)(a1 + 32), v8);
  }
  else
  {
    if (!v8)
      goto LABEL_22;
    objc_storeStrong((id *)(a1 + 32), v8);
  }
  v4 = v10;
LABEL_22:
  v9 = (void *)v4[3];
  if (*(_QWORD *)(a1 + 24))
  {
    if (v9)
    {
      -[ATXPBProactiveSuggestionScoreSpecification mergeFrom:](*(_QWORD *)(a1 + 24), v9);
LABEL_27:
      v4 = v10;
    }
  }
  else if (v9)
  {
    objc_storeStrong((id *)(a1 + 24), v9);
    goto LABEL_27;
  }
LABEL_28:

}

@end
