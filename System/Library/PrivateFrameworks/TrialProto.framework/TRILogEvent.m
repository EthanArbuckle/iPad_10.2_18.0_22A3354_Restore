@implementation TRILogEvent

- (BOOL)hasContext
{
  return self->_context != 0;
}

- (BOOL)hasLogEventId
{
  return self->_logEventId != 0;
}

- (BOOL)hasDenormalizedEvent
{
  return self->_denormalizedEvent != 0;
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
  v8.super_class = (Class)TRILogEvent;
  -[TRILogEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRILogEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  TRILogContext *context;
  void *v5;
  NSString *logEventId;
  TRIDenormalizedEvent *denormalizedEvent;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  context = self->_context;
  if (context)
  {
    -[TRILogContext dictionaryRepresentation](context, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("context"));

  }
  logEventId = self->_logEventId;
  if (logEventId)
    objc_msgSend(v3, "setObject:forKey:", logEventId, CFSTR("log_event_id"));
  denormalizedEvent = self->_denormalizedEvent;
  if (denormalizedEvent)
  {
    -[TRIDenormalizedEvent dictionaryRepresentation](denormalizedEvent, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("denormalized_event"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return TRILogEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_context)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_logEventId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_denormalizedEvent)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_context)
  {
    objc_msgSend(v4, "setContext:");
    v4 = v5;
  }
  if (self->_logEventId)
  {
    objc_msgSend(v5, "setLogEventId:");
    v4 = v5;
  }
  if (self->_denormalizedEvent)
  {
    objc_msgSend(v5, "setDenormalizedEvent:");
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
  id v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[TRILogContext copyWithZone:](self->_context, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_logEventId, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[TRIDenormalizedEvent copyWithZone:](self->_denormalizedEvent, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  TRILogContext *context;
  NSString *logEventId;
  TRIDenormalizedEvent *denormalizedEvent;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((context = self->_context, !((unint64_t)context | v4[1]))
     || -[TRILogContext isEqual:](context, "isEqual:"))
    && ((logEventId = self->_logEventId, !((unint64_t)logEventId | v4[3]))
     || -[NSString isEqual:](logEventId, "isEqual:")))
  {
    denormalizedEvent = self->_denormalizedEvent;
    if ((unint64_t)denormalizedEvent | v4[2])
      v8 = -[TRIDenormalizedEvent isEqual:](denormalizedEvent, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;

  v3 = -[TRILogContext hash](self->_context, "hash");
  v4 = -[NSString hash](self->_logEventId, "hash") ^ v3;
  return v4 ^ -[TRIDenormalizedEvent hash](self->_denormalizedEvent, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  TRILogContext *context;
  uint64_t v6;
  TRIDenormalizedEvent *denormalizedEvent;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  context = self->_context;
  v6 = v4[1];
  v9 = v4;
  if (context)
  {
    if (!v6)
      goto LABEL_7;
    -[TRILogContext mergeFrom:](context, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[TRILogEvent setContext:](self, "setContext:");
  }
  v4 = v9;
LABEL_7:
  if (v4[3])
  {
    -[TRILogEvent setLogEventId:](self, "setLogEventId:");
    v4 = v9;
  }
  denormalizedEvent = self->_denormalizedEvent;
  v8 = v4[2];
  if (denormalizedEvent)
  {
    if (v8)
    {
      -[TRIDenormalizedEvent mergeFrom:](denormalizedEvent, "mergeFrom:");
LABEL_14:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[TRILogEvent setDenormalizedEvent:](self, "setDenormalizedEvent:");
    goto LABEL_14;
  }

}

- (TRILogContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSString)logEventId
{
  return self->_logEventId;
}

- (void)setLogEventId:(id)a3
{
  objc_storeStrong((id *)&self->_logEventId, a3);
}

- (TRIDenormalizedEvent)denormalizedEvent
{
  return self->_denormalizedEvent;
}

- (void)setDenormalizedEvent:(id)a3
{
  objc_storeStrong((id *)&self->_denormalizedEvent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEventId, 0);
  objc_storeStrong((id *)&self->_denormalizedEvent, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
