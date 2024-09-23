@implementation ATXShortcutsEditorGroupedUIFeedbackResult

- (ATXShortcutsEditorGroupedUIFeedbackResult)init
{
  ATXShortcutsEditorGroupedUIFeedbackResult *v2;
  uint64_t v3;
  ATXPBContextualActionsGroupedUIFeedbackResult *proto;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXShortcutsEditorGroupedUIFeedbackResult;
  v2 = -[ATXProactiveSuggestionGroupedUIFeedbackResult init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    proto = v2->_proto;
    v2->_proto = (ATXPBContextualActionsGroupedUIFeedbackResult *)v3;

  }
  return v2;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[ATXShortcutsEditorGroupedUIFeedbackResult jsonDict](self, "jsonDict");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@"), v4);

  return v5;
}

- (unint64_t)numShortcutsAtStart
{
  return -[ATXPBContextualActionsGroupedUIFeedbackResult numShortcutsAtStart](self->_proto, "numShortcutsAtStart");
}

- (unint64_t)numShortcutsAtEnd
{
  return -[ATXPBContextualActionsGroupedUIFeedbackResult numShortcutsAtEnd](self->_proto, "numShortcutsAtEnd");
}

- (unint64_t)numManuallyAddedSteps
{
  return -[ATXPBContextualActionsGroupedUIFeedbackResult numManuallyAddedSteps](self->_proto, "numManuallyAddedSteps");
}

- (void)setNumShortcutsAtStart:(unint64_t)a3
{
  -[ATXPBContextualActionsGroupedUIFeedbackResult setNumShortcutsAtStart:](self->_proto, "setNumShortcutsAtStart:", a3);
}

- (void)setNumShortcutsAtEnd:(unint64_t)a3
{
  -[ATXPBContextualActionsGroupedUIFeedbackResult setNumShortcutsAtEnd:](self->_proto, "setNumShortcutsAtEnd:", a3);
}

- (void)setNumManuallyAddedSteps:(unint64_t)a3
{
  -[ATXPBContextualActionsGroupedUIFeedbackResult setNumManuallyAddedSteps:](self->_proto, "setNumManuallyAddedSteps:", a3);
}

- (BOOL)isValid
{
  void *v3;
  void *v4;
  BOOL v5;

  -[ATXProactiveSuggestionGroupedUIFeedbackResult startDateOfFirstSession](self, "startDateOfFirstSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ATXProactiveSuggestionGroupedUIFeedbackResult endDateOfLastSession](self, "endDateOfLastSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)encodeAsProto
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ATXShortcutsEditorGroupedUIFeedbackResult;
  -[ATXProactiveSuggestionGroupedUIFeedbackResult proto](&v5, sel_proto);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBContextualActionsGroupedUIFeedbackResult setGroupedUIFeedbackResults:](self->_proto, "setGroupedUIFeedbackResults:", v3);

  -[ATXPBContextualActionsGroupedUIFeedbackResult data](self->_proto, "data");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (ATXShortcutsEditorGroupedUIFeedbackResult)initWithProto:(id)a3
{
  id v5;
  ATXShortcutsEditorGroupedUIFeedbackResult *v6;
  ATXShortcutsEditorGroupedUIFeedbackResult *v7;
  ATXShortcutsEditorGroupedUIFeedbackResult *v8;
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
  v11.super_class = (Class)ATXShortcutsEditorGroupedUIFeedbackResult;
  v6 = -[ATXProactiveSuggestionGroupedUIFeedbackResult init](&v11, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_proto, a3);
  self = v7;
  v8 = self;
LABEL_10:

  return v8;
}

- (ATXShortcutsEditorGroupedUIFeedbackResult)initWithProtoData:(id)a3
{
  id v4;
  ATXPBContextualActionsGroupedUIFeedbackResult *v5;
  ATXShortcutsEditorGroupedUIFeedbackResult *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBContextualActionsGroupedUIFeedbackResult initWithData:]([ATXPBContextualActionsGroupedUIFeedbackResult alloc], "initWithData:", v4);

    self = -[ATXShortcutsEditorGroupedUIFeedbackResult initWithProto:](self, "initWithProto:", v5);
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
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ATXShortcutsEditorGroupedUIFeedbackResult;
  -[ATXProactiveSuggestionGroupedUIFeedbackResult proto](&v5, sel_proto);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBContextualActionsGroupedUIFeedbackResult setGroupedUIFeedbackResults:](self->_proto, "setGroupedUIFeedbackResults:", v3);

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
  -[ATXShortcutsEditorGroupedUIFeedbackResult encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

- (ATXShortcutsEditorGroupedUIFeedbackResult)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXShortcutsEditorGroupedUIFeedbackResult *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ATXShortcutsEditorGroupedUIFeedbackResult initWithProtoData:](self, "initWithProtoData:", v5);
  return v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[ATXShortcutsEditorGroupedUIFeedbackResult proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  ATXShortcutsEditorGroupedUIFeedbackResult *v4;
  ATXShortcutsEditorGroupedUIFeedbackResult *v5;
  BOOL v6;

  v4 = (ATXShortcutsEditorGroupedUIFeedbackResult *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXShortcutsEditorGroupedUIFeedbackResult isEqualToATXContextualActionsGroupedUIFeedbackResult:](self, "isEqualToATXContextualActionsGroupedUIFeedbackResult:", v5);

  return v6;
}

- (BOOL)isEqualToATXContextualActionsGroupedUIFeedbackResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ATXShortcutsEditorGroupedUIFeedbackResult proto](self, "proto");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "proto");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v6);
  return (char)v4;
}

- (id)jsonDict
{
  void *v2;
  void *v3;

  -[ATXShortcutsEditorGroupedUIFeedbackResult proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proto, 0);
}

@end
