@implementation WFTriggerEvent

- (WFTriggerEvent)initWithIdentifier:(id)a3 triggerID:(id)a4 eventInfo:(id)a5 confirmed:(BOOL)a6 dateCreated:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  WFTriggerEvent *v17;
  uint64_t v18;
  NSString *triggerID;
  uint64_t v20;
  NSData *eventInfo;
  WFTriggerEvent *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTriggerEvent.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

    if (v14)
    {
LABEL_3:
      if (v15)
        goto LABEL_4;
LABEL_10:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTriggerEvent.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("eventInfo"));

      if (v16)
        goto LABEL_5;
      goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTriggerEvent.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("triggerID"));

  if (!v15)
    goto LABEL_10;
LABEL_4:
  if (v16)
    goto LABEL_5;
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTriggerEvent.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("date"));

LABEL_5:
  v28.receiver = self;
  v28.super_class = (Class)WFTriggerEvent;
  v17 = -[WFTriggerEvent initWithIdentifier:objectType:](&v28, sel_initWithIdentifier_objectType_, v13, 4);
  if (v17)
  {
    v18 = objc_msgSend(v14, "copy");
    triggerID = v17->_triggerID;
    v17->_triggerID = (NSString *)v18;

    v20 = objc_msgSend(v15, "copy");
    eventInfo = v17->_eventInfo;
    v17->_eventInfo = (NSData *)v20;

    objc_storeStrong((id *)&v17->_dateCreated, a7);
    v17->_confirmed = a6;
    v22 = v17;
  }

  return v17;
}

- (NSString)triggerID
{
  return self->_triggerID;
}

- (NSData)eventInfo
{
  return self->_eventInfo;
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (BOOL)confirmed
{
  return self->_confirmed;
}

- (void)setConfirmed:(BOOL)a3
{
  self->_confirmed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_eventInfo, 0);
  objc_storeStrong((id *)&self->_triggerID, 0);
}

@end
