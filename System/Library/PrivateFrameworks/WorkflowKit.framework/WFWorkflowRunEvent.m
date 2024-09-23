@implementation WFWorkflowRunEvent

- (WFWorkflowRunEvent)initWithIdentifier:(id)a3 workflow:(id)a4 source:(id)a5 date:(id)a6 triggerID:(id)a7 outcome:(int64_t)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  WFWorkflowRunEvent *v19;
  WFWorkflowRunEvent *v20;
  uint64_t v21;
  NSString *triggerID;
  WFWorkflowRunEvent *v23;
  objc_super v25;

  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v25.receiver = self;
  v25.super_class = (Class)WFWorkflowRunEvent;
  v19 = -[WFWorkflowRunEvent initWithIdentifier:objectType:](&v25, sel_initWithIdentifier_objectType_, a3, 5);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_workflow, a4);
    objc_storeStrong((id *)&v20->_source, a5);
    objc_storeStrong((id *)&v20->_date, a6);
    v21 = objc_msgSend(v18, "copy");
    triggerID = v20->_triggerID;
    v20->_triggerID = (NSString *)v21;

    v20->_outcome = a8;
    v23 = v20;
  }

  return v20;
}

- (WFWorkflowRunEvent)initWithCoder:(id)a3
{
  id v4;
  WFWorkflowRunEvent *v5;
  uint64_t v6;
  WFWorkflowReference *workflow;
  uint64_t v8;
  NSString *source;
  uint64_t v10;
  NSDate *date;
  uint64_t v12;
  NSString *triggerID;
  WFWorkflowRunEvent *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WFWorkflowRunEvent;
  v5 = -[WFWorkflowRunEvent initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("workflow"));
    v6 = objc_claimAutoreleasedReturnValue();
    workflow = v5->_workflow;
    v5->_workflow = (WFWorkflowReference *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("source"));
    v8 = objc_claimAutoreleasedReturnValue();
    source = v5->_source;
    v5->_source = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
    v10 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("triggerID"));
    v12 = objc_claimAutoreleasedReturnValue();
    triggerID = v5->_triggerID;
    v5->_triggerID = (NSString *)v12;

    v5->_outcome = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("outcome"));
    v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WFWorkflowRunEvent;
  v4 = a3;
  -[WFWorkflowRunEvent encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  -[WFWorkflowRunEvent workflow](self, "workflow", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("workflow"));

  -[WFWorkflowRunEvent source](self, "source");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("source"));

  -[WFWorkflowRunEvent date](self, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("date"));

  -[WFWorkflowRunEvent triggerID](self, "triggerID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("triggerID"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[WFWorkflowRunEvent outcome](self, "outcome"), CFSTR("outcome"));
}

- (WFWorkflowReference)workflow
{
  return self->_workflow;
}

- (NSString)source
{
  return self->_source;
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)triggerID
{
  return self->_triggerID;
}

- (int64_t)outcome
{
  return self->_outcome;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerID, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_workflow, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
