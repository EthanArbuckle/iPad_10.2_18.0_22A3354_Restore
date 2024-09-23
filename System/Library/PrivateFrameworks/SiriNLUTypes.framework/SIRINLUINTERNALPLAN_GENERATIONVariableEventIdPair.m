@implementation SIRINLUINTERNALPLAN_GENERATIONVariableEventIdPair

- (BOOL)hasVariable
{
  return self->_variable != 0;
}

- (BOOL)hasEventId
{
  return self->_eventId != 0;
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
  v8.super_class = (Class)SIRINLUINTERNALPLAN_GENERATIONVariableEventIdPair;
  -[SIRINLUINTERNALPLAN_GENERATIONVariableEventIdPair description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUINTERNALPLAN_GENERATIONVariableEventIdPair dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *variable;
  NSString *eventId;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  variable = self->_variable;
  if (variable)
    objc_msgSend(v3, "setObject:forKey:", variable, CFSTR("variable"));
  eventId = self->_eventId;
  if (eventId)
    objc_msgSend(v4, "setObject:forKey:", eventId, CFSTR("eventId"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALPLAN_GENERATIONVariableEventIdPairReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_variable)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_eventId)
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
  if (self->_variable)
  {
    objc_msgSend(v4, "setVariable:");
    v4 = v5;
  }
  if (self->_eventId)
  {
    objc_msgSend(v5, "setEventId:");
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
  v6 = -[NSString copyWithZone:](self->_variable, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_eventId, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *variable;
  NSString *eventId;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((variable = self->_variable, !((unint64_t)variable | v4[2]))
     || -[NSString isEqual:](variable, "isEqual:")))
  {
    eventId = self->_eventId;
    if ((unint64_t)eventId | v4[1])
      v7 = -[NSString isEqual:](eventId, "isEqual:");
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

  v3 = -[NSString hash](self->_variable, "hash");
  return -[NSString hash](self->_eventId, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[2])
  {
    -[SIRINLUINTERNALPLAN_GENERATIONVariableEventIdPair setVariable:](self, "setVariable:");
    v4 = v5;
  }
  if (v4[1])
  {
    -[SIRINLUINTERNALPLAN_GENERATIONVariableEventIdPair setEventId:](self, "setEventId:");
    v4 = v5;
  }

}

- (NSString)variable
{
  return self->_variable;
}

- (void)setVariable:(id)a3
{
  objc_storeStrong((id *)&self->_variable, a3);
}

- (NSString)eventId
{
  return self->_eventId;
}

- (void)setEventId:(id)a3
{
  objc_storeStrong((id *)&self->_eventId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variable, 0);
  objc_storeStrong((id *)&self->_eventId, 0);
}

@end
