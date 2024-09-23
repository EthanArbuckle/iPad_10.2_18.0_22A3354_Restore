@implementation ATXPBLightweightProactiveSuggestion

- (BOOL)hasExecutableIdentifier
{
  return self->_executableIdentifier != 0;
}

- (BOOL)hasExecutableType
{
  return self->_executableType != 0;
}

- (BOOL)hasScoreSpecification
{
  return self->_scoreSpecification != 0;
}

- (void)setPredictionReasons:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_predictionReasons = a3;
}

- (void)setHasPredictionReasons:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPredictionReasons
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)ATXPBLightweightProactiveSuggestion;
  -[ATXPBLightweightProactiveSuggestion description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBLightweightProactiveSuggestion dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *executableIdentifier;
  NSString *executableType;
  ATXPBProactiveSuggestionScoreSpecification *scoreSpecification;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  executableIdentifier = self->_executableIdentifier;
  if (executableIdentifier)
    objc_msgSend(v3, "setObject:forKey:", executableIdentifier, CFSTR("executableIdentifier"));
  executableType = self->_executableType;
  if (executableType)
    objc_msgSend(v4, "setObject:forKey:", executableType, CFSTR("executableType"));
  scoreSpecification = self->_scoreSpecification;
  if (scoreSpecification)
  {
    -[ATXPBProactiveSuggestionScoreSpecification dictionaryRepresentation](scoreSpecification, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("scoreSpecification"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_predictionReasons);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("predictionReasons"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBLightweightProactiveSuggestionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_executableIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_executableType)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_scoreSpecification)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_executableIdentifier)
  {
    objc_msgSend(v4, "setExecutableIdentifier:");
    v4 = v5;
  }
  if (self->_executableType)
  {
    objc_msgSend(v5, "setExecutableType:");
    v4 = v5;
  }
  if (self->_scoreSpecification)
  {
    objc_msgSend(v5, "setScoreSpecification:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_predictionReasons;
    *((_BYTE *)v4 + 40) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_executableIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSString copyWithZone:](self->_executableType, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[ATXPBProactiveSuggestionScoreSpecification copyWithZone:](self->_scoreSpecification, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_predictionReasons;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *executableIdentifier;
  NSString *executableType;
  ATXPBProactiveSuggestionScoreSpecification *scoreSpecification;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  executableIdentifier = self->_executableIdentifier;
  if ((unint64_t)executableIdentifier | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](executableIdentifier, "isEqual:"))
      goto LABEL_12;
  }
  executableType = self->_executableType;
  if ((unint64_t)executableType | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](executableType, "isEqual:"))
      goto LABEL_12;
  }
  scoreSpecification = self->_scoreSpecification;
  if ((unint64_t)scoreSpecification | *((_QWORD *)v4 + 4))
  {
    if (!-[ATXPBProactiveSuggestionScoreSpecification isEqual:](scoreSpecification, "isEqual:"))
      goto LABEL_12;
  }
  v8 = (*((_BYTE *)v4 + 40) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) != 0 && self->_predictionReasons == *((_QWORD *)v4 + 1))
    {
      v8 = 1;
      goto LABEL_13;
    }
LABEL_12:
    v8 = 0;
  }
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -[NSString hash](self->_executableIdentifier, "hash");
  v4 = -[NSString hash](self->_executableType, "hash");
  v5 = -[ATXPBProactiveSuggestionScoreSpecification hash](self->_scoreSpecification, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761u * self->_predictionReasons;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  ATXPBProactiveSuggestionScoreSpecification *scoreSpecification;
  void *v7;
  _QWORD *v8;

  v4 = a3;
  v5 = v4[2];
  v8 = v4;
  if (v5)
  {
    -[ATXPBLightweightProactiveSuggestion setExecutableIdentifier:](self, "setExecutableIdentifier:", v5, v4);
    v4 = v8;
  }
  if (v4[3])
  {
    -[ATXPBLightweightProactiveSuggestion setExecutableType:](self, "setExecutableType:");
    v4 = v8;
  }
  scoreSpecification = self->_scoreSpecification;
  v7 = (void *)v4[4];
  if (scoreSpecification)
  {
    if (!v7)
      goto LABEL_11;
    -[ATXPBProactiveSuggestionScoreSpecification mergeFrom:]((uint64_t)scoreSpecification, v7);
  }
  else
  {
    if (!v7)
      goto LABEL_11;
    -[ATXPBLightweightProactiveSuggestion setScoreSpecification:](self, "setScoreSpecification:", v4[4]);
  }
  v4 = v8;
LABEL_11:
  if ((v4[5] & 1) != 0)
  {
    self->_predictionReasons = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)executableIdentifier
{
  return self->_executableIdentifier;
}

- (void)setExecutableIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_executableIdentifier, a3);
}

- (NSString)executableType
{
  return self->_executableType;
}

- (void)setExecutableType:(id)a3
{
  objc_storeStrong((id *)&self->_executableType, a3);
}

- (ATXPBProactiveSuggestionScoreSpecification)scoreSpecification
{
  return self->_scoreSpecification;
}

- (void)setScoreSpecification:(id)a3
{
  objc_storeStrong((id *)&self->_scoreSpecification, a3);
}

- (unint64_t)predictionReasons
{
  return self->_predictionReasons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoreSpecification, 0);
  objc_storeStrong((id *)&self->_executableType, 0);
  objc_storeStrong((id *)&self->_executableIdentifier, 0);
}

@end
