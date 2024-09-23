@implementation SFStartSearchFeedback

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFStartSearchFeedback;
  v4 = a3;
  -[SFFeedback encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_input, CFSTR("input"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_uuid, CFSTR("uuid"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_triggerEvent, CFSTR("trigger_event"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_searchType, CFSTR("_searchType"));

}

- (SFStartSearchFeedback)initWithInput:(id)a3 triggerEvent:(unint64_t)a4
{
  id v6;
  SFStartSearchFeedback *v7;
  void *v8;
  uint64_t v9;
  NSString *uuid;
  uint64_t v11;
  NSString *input;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SFStartSearchFeedback;
  v7 = -[SFFeedback init](&v14, sel_init);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = objc_claimAutoreleasedReturnValue();
    uuid = v7->_uuid;
    v7->_uuid = (NSString *)v9;

    v11 = objc_msgSend(v6, "copy");
    input = v7->_input;
    v7->_input = (NSString *)v11;

    v7->_triggerEvent = a4;
  }

  return v7;
}

- (void)setSearchType:(unint64_t)a3
{
  self->_searchType = a3;
}

- (NSString)input
{
  return self->_input;
}

- (unint64_t)triggerEvent
{
  return self->_triggerEvent;
}

- (unint64_t)searchType
{
  return self->_searchType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_input, 0);
}

- (NSString)uuid
{
  return self->_uuid;
}

- (SFStartSearchFeedback)initWithCoder:(id)a3
{
  id v4;
  SFStartSearchFeedback *v5;
  uint64_t v6;
  NSString *input;
  uint64_t v8;
  NSString *uuid;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFStartSearchFeedback;
  v5 = -[SFFeedback initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("input"));
    v6 = objc_claimAutoreleasedReturnValue();
    input = v5->_input;
    v5->_input = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
    v8 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v8;

    v5->_triggerEvent = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("trigger_event"));
    v5->_searchType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_searchType"));
  }

  return v5;
}

- (SFStartSearchFeedback)initWithInput:(id)a3 triggerEvent:(unint64_t)a4 queryId:(unint64_t)a5
{
  SFStartSearchFeedback *result;

  result = -[SFStartSearchFeedback initWithInput:triggerEvent:](self, "initWithInput:triggerEvent:", a3, a4);
  if (result)
    result->super._queryId = a5;
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
  v8.super_class = (Class)SFStartSearchFeedback;
  -[SFFeedback description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFStartSearchFeedback input](self, "input");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setInput:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (void)setTriggerEvent:(unint64_t)a3
{
  self->_triggerEvent = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
