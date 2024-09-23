@implementation PPSuggestedEvent

- (PPSuggestedEvent)initWithPPEvent:(id)a3
{
  return -[PPSuggestedEvent initWithPPEvent:score:](self, "initWithPPEvent:score:", a3, 1.0);
}

- (PPSuggestedEvent)initWithPPEvent:(id)a3 score:(double)a4
{
  id v6;
  void *v7;
  PPSuggestedEvent *v9;
  void *v10;
  void *v11;
  void *v12;
  PPSuggestedEvent *v13;
  uint64_t v14;
  NSString *eventIdentifier;
  objc_super v17;

  v6 = a3;
  v7 = v6;
  if (a4 < 0.0 || a4 > 1.0)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v6, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "endDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17.receiver = self;
    v17.super_class = (Class)PPSuggestedEvent;
    v13 = -[PPScoredEvent initWithStartDate:endDate:title:score:](&v17, sel_initWithStartDate_endDate_title_score_, v10, v11, v12, a4);

    if (v13)
    {
      v13->_category = objc_msgSend(v7, "suggestedEventCategory");
      objc_msgSend(v7, "eventIdentifier");
      v14 = objc_claimAutoreleasedReturnValue();
      eventIdentifier = v13->_eventIdentifier;
      v13->_eventIdentifier = (NSString *)v14;

    }
    self = v13;
    v9 = self;
  }

  return v9;
}

- (PPSuggestedEvent)initWithCoder:(id)a3
{
  id v4;
  PPSuggestedEvent *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  PPSuggestedEvent *v9;
  NSString *eventIdentifier;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PPSuggestedEvent;
  v5 = -[PPScoredEvent initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_4;
  v6 = (void *)MEMORY[0x1E0D81610];
  v7 = objc_opt_class();
  pp_default_log_handle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v7, CFSTR("ei"), v4, 1, CFSTR("PPErrorDomain"), 23, v8);
  v9 = (PPSuggestedEvent *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    eventIdentifier = v5->_eventIdentifier;
    v5->_eventIdentifier = (NSString *)&v9->super.super.isa;

    v5->_category = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("cat"));
LABEL_4:
    v9 = v5;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PPSuggestedEvent;
  v4 = a3;
  -[PPScoredEvent encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt32:forKey:", self->_category, CFSTR("cat"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_eventIdentifier, CFSTR("ei"));

}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8.receiver = self;
  v8.super_class = (Class)PPSuggestedEvent;
  -[PPScoredEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPEvent descriptionForSuggestedEventCategory:](PPEvent, "descriptionForSuggestedEventCategory:", self->_category);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ - cat: %@ - eventIdentifier: %@"), v4, v5, self->_eventIdentifier);

  return v6;
}

- (unsigned)category
{
  return self->_category;
}

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
