@implementation ATXProactiveSuggestionGroupedUIFeedbackResult

- (ATXProactiveSuggestionGroupedUIFeedbackResult)init
{
  ATXProactiveSuggestionGroupedUIFeedbackResult *v2;
  uint64_t v3;
  ATXPBProactiveSuggestionGroupedUIFeedbackResult *proto;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXProactiveSuggestionGroupedUIFeedbackResult;
  v2 = -[ATXProactiveSuggestionGroupedUIFeedbackResult init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    proto = v2->_proto;
    v2->_proto = (ATXPBProactiveSuggestionGroupedUIFeedbackResult *)v3;

  }
  return v2;
}

- (void)updateWithIntermediateSessionResults:(id)a3
{
  ATXPBProactiveSuggestionGroupedUIFeedbackResult *proto;
  void *v5;
  ATXPBProactiveSuggestionGroupedUIFeedbackResult *v6;
  void *v7;
  ATXPBProactiveSuggestionGroupedUIFeedbackResult *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  proto = self->_proto;
  objc_msgSend(v25, "engagedSuggestions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBProactiveSuggestionGroupedUIFeedbackResult setNumEngagedSuggestions:](proto, "setNumEngagedSuggestions:", -[ATXPBProactiveSuggestionGroupedUIFeedbackResult numEngagedSuggestions](proto, "numEngagedSuggestions")+ objc_msgSend(v5, "count"));

  v6 = self->_proto;
  objc_msgSend(v25, "rejectedSuggestions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBProactiveSuggestionGroupedUIFeedbackResult setNumRejectedSuggestions:](v6, "setNumRejectedSuggestions:", -[ATXPBProactiveSuggestionGroupedUIFeedbackResult numRejectedSuggestions](v6, "numRejectedSuggestions")+ objc_msgSend(v7, "count"));

  v8 = self->_proto;
  objc_msgSend(v25, "shownSuggestions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  objc_msgSend(v25, "engagedSuggestions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");
  objc_msgSend(v25, "rejectedSuggestions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBProactiveSuggestionGroupedUIFeedbackResult setNumAbandonedSuggestions:](v8, "setNumAbandonedSuggestions:", v10- (v12+ objc_msgSend(v13, "count"))+ -[ATXPBProactiveSuggestionGroupedUIFeedbackResult numAbandonedSuggestions](v8, "numAbandonedSuggestions"));

  v14 = objc_msgSend(v25, "engagementType");
  if (v14)
  {
    if (v14 == 1)
    {
      -[ATXPBProactiveSuggestionGroupedUIFeedbackResult setNumSessionsWithRejectedSuggestions:](self->_proto, "setNumSessionsWithRejectedSuggestions:", -[ATXPBProactiveSuggestionGroupedUIFeedbackResult numSessionsWithRejectedSuggestions](self->_proto, "numSessionsWithRejectedSuggestions")+ 1);
    }
    else if (v14 == 2)
    {
      -[ATXPBProactiveSuggestionGroupedUIFeedbackResult setNumSessionsWithEngagedSuggestions:](self->_proto, "setNumSessionsWithEngagedSuggestions:", -[ATXPBProactiveSuggestionGroupedUIFeedbackResult numSessionsWithEngagedSuggestions](self->_proto, "numSessionsWithEngagedSuggestions")+ 1);
    }
  }
  else
  {
    -[ATXPBProactiveSuggestionGroupedUIFeedbackResult setNumSessionsWithAbandonedSuggestions:](self->_proto, "setNumSessionsWithAbandonedSuggestions:", -[ATXPBProactiveSuggestionGroupedUIFeedbackResult numSessionsWithAbandonedSuggestions](self->_proto, "numSessionsWithAbandonedSuggestions")+ 1);
  }
  if (!-[ATXPBProactiveSuggestionGroupedUIFeedbackResult hasStartDateOfFirstSessionInSeconds](self->_proto, "hasStartDateOfFirstSessionInSeconds"))
  {
    objc_msgSend(v25, "session");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sessionStartDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSinceReferenceDate");
    -[ATXPBProactiveSuggestionGroupedUIFeedbackResult setStartDateOfFirstSessionInSeconds:](self->_proto, "setStartDateOfFirstSessionInSeconds:");

  }
  if (!-[ATXPBProactiveSuggestionGroupedUIFeedbackResult hasEndDateOfLastSessionInSeconds](self->_proto, "hasEndDateOfLastSessionInSeconds"))goto LABEL_11;
  -[ATXPBProactiveSuggestionGroupedUIFeedbackResult endDateOfLastSessionInSeconds](self->_proto, "endDateOfLastSessionInSeconds");
  v18 = v17;
  objc_msgSend(v25, "session");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sessionEndDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "timeIntervalSinceReferenceDate");
  v22 = v21;

  if (v18 < v22)
  {
LABEL_11:
    objc_msgSend(v25, "session");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "sessionEndDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "timeIntervalSinceReferenceDate");
    -[ATXPBProactiveSuggestionGroupedUIFeedbackResult setEndDateOfLastSessionInSeconds:](self->_proto, "setEndDateOfLastSessionInSeconds:");

  }
}

- (void)setIsGroupSessionComplete:(BOOL)a3
{
  -[ATXPBProactiveSuggestionGroupedUIFeedbackResult setIsComplete:](self->_proto, "setIsComplete:", a3);
}

- (BOOL)isGroupSessionComplete
{
  return -[ATXPBProactiveSuggestionGroupedUIFeedbackResult isComplete](self->_proto, "isComplete");
}

- (unint64_t)numSessionsWithEngagedSuggestions
{
  return -[ATXPBProactiveSuggestionGroupedUIFeedbackResult numSessionsWithEngagedSuggestions](self->_proto, "numSessionsWithEngagedSuggestions");
}

- (unint64_t)numSessionsWithRejectedSuggestions
{
  return -[ATXPBProactiveSuggestionGroupedUIFeedbackResult numSessionsWithRejectedSuggestions](self->_proto, "numSessionsWithRejectedSuggestions");
}

- (unint64_t)numSessionsWithAbandonedSuggestions
{
  return -[ATXPBProactiveSuggestionGroupedUIFeedbackResult numSessionsWithAbandonedSuggestions](self->_proto, "numSessionsWithAbandonedSuggestions");
}

- (unint64_t)numEngagedSuggestions
{
  return -[ATXPBProactiveSuggestionGroupedUIFeedbackResult numEngagedSuggestions](self->_proto, "numEngagedSuggestions");
}

- (unint64_t)numRejectedSuggestions
{
  return -[ATXPBProactiveSuggestionGroupedUIFeedbackResult numRejectedSuggestions](self->_proto, "numRejectedSuggestions");
}

- (unint64_t)numAbandonedSuggestions
{
  return -[ATXPBProactiveSuggestionGroupedUIFeedbackResult numAbandonedSuggestions](self->_proto, "numAbandonedSuggestions");
}

- (NSDate)startDateOfFirstSession
{
  id v3;
  void *v4;

  if (-[ATXPBProactiveSuggestionGroupedUIFeedbackResult hasStartDateOfFirstSessionInSeconds](self->_proto, "hasStartDateOfFirstSessionInSeconds"))
  {
    v3 = objc_alloc(MEMORY[0x1E0C99D68]);
    -[ATXPBProactiveSuggestionGroupedUIFeedbackResult startDateOfFirstSessionInSeconds](self->_proto, "startDateOfFirstSessionInSeconds");
    v4 = (void *)objc_msgSend(v3, "initWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
}

- (NSDate)endDateOfLastSession
{
  id v3;
  void *v4;

  if (-[ATXPBProactiveSuggestionGroupedUIFeedbackResult hasEndDateOfLastSessionInSeconds](self->_proto, "hasEndDateOfLastSessionInSeconds"))
  {
    v3 = objc_alloc(MEMORY[0x1E0C99D68]);
    -[ATXPBProactiveSuggestionGroupedUIFeedbackResult endDateOfLastSessionInSeconds](self->_proto, "endDateOfLastSessionInSeconds");
    v4 = (void *)objc_msgSend(v3, "initWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
}

- (id)encodeAsProto
{
  return (id)-[ATXPBProactiveSuggestionGroupedUIFeedbackResult data](self->_proto, "data");
}

- (ATXProactiveSuggestionGroupedUIFeedbackResult)initWithProto:(id)a3
{
  id v5;
  ATXProactiveSuggestionGroupedUIFeedbackResult *v6;
  ATXProactiveSuggestionGroupedUIFeedbackResult *v7;
  ATXProactiveSuggestionGroupedUIFeedbackResult *v8;
  NSObject *v9;
  objc_super v11;

  v5 = a3;
  if (!v5)
  {
LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_blending();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[ATXProactiveSuggestionGroupedUIFeedbackResult initWithProto:].cold.1((uint64_t)self, (uint64_t)v5, v9);

    goto LABEL_9;
  }
  v11.receiver = self;
  v11.super_class = (Class)ATXProactiveSuggestionGroupedUIFeedbackResult;
  v6 = -[ATXProactiveSuggestionGroupedUIFeedbackResult init](&v11, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_proto, a3);
  self = v7;
  v8 = self;
LABEL_10:

  return v8;
}

- (ATXProactiveSuggestionGroupedUIFeedbackResult)initWithProtoData:(id)a3
{
  id v4;
  ATXPBProactiveSuggestionGroupedUIFeedbackResult *v5;
  ATXProactiveSuggestionGroupedUIFeedbackResult *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBProactiveSuggestionGroupedUIFeedbackResult initWithData:]([ATXPBProactiveSuggestionGroupedUIFeedbackResult alloc], "initWithData:", v4);

    self = -[ATXProactiveSuggestionGroupedUIFeedbackResult initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  return self->_proto;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ATXProactiveSuggestionGroupedUIFeedbackResult encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

- (ATXProactiveSuggestionGroupedUIFeedbackResult)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXProactiveSuggestionGroupedUIFeedbackResult *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ATXProactiveSuggestionGroupedUIFeedbackResult initWithProtoData:](self, "initWithProtoData:", v5);
  return v6;
}

- (unint64_t)hash
{
  return -[ATXPBProactiveSuggestionGroupedUIFeedbackResult hash](self->_proto, "hash");
}

- (BOOL)isEqual:(id)a3
{
  ATXProactiveSuggestionGroupedUIFeedbackResult *v4;
  ATXProactiveSuggestionGroupedUIFeedbackResult *v5;
  BOOL v6;

  v4 = (ATXProactiveSuggestionGroupedUIFeedbackResult *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXProactiveSuggestionGroupedUIFeedbackResult isEqualToATXProactiveSuggestionGroupedUIFeedbackResult:](self, "isEqualToATXProactiveSuggestionGroupedUIFeedbackResult:", v5);

  return v6;
}

- (BOOL)isEqualToATXProactiveSuggestionGroupedUIFeedbackResult:(id)a3
{
  return -[ATXPBProactiveSuggestionGroupedUIFeedbackResult isEqual:](self->_proto, "isEqual:", *((_QWORD *)a3 + 1));
}

- (id)jsonDict
{
  return -[ATXPBProactiveSuggestionGroupedUIFeedbackResult dictionaryRepresentation](self->_proto, "dictionaryRepresentation");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proto, 0);
}

- (void)initWithProto:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v5;
  v10 = 2112;
  v11 = v7;
  _os_log_fault_impl(&dword_1AA841000, a3, OS_LOG_TYPE_FAULT, "Unable to construct class %@ from ProtoBuf object Protobuf object was of class: %@", (uint8_t *)&v8, 0x16u);

}

@end
