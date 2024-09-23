@implementation HDSPConfirmWakeUpIDSMessage

- (HDSPConfirmWakeUpIDSMessage)initWithWasExplicitConfirmation:(BOOL)a3 wakeUpConfirmedDate:(id)a4 wakeUpConfirmedUntilDate:(id)a5
{
  id v9;
  HDSPConfirmWakeUpIDSMessage *v10;
  HDSPConfirmWakeUpIDSMessage *v11;
  HDSPConfirmWakeUpIDSMessage *v12;
  objc_super v14;

  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HDSPConfirmWakeUpIDSMessage;
  v10 = -[HDSPEventRecordMessage initWithDate:](&v14, sel_initWithDate_, a4);
  v11 = v10;
  if (v10)
  {
    v10->_wasExplicitConfirmation = a3;
    objc_storeStrong((id *)&v10->_wakeUpConfirmedUntilDate, a5);
    v12 = v11;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HDSPConfirmWakeUpIDSMessage;
  v4 = a3;
  -[HDSPEventRecordMessage encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_wakeUpConfirmedUntilDate, CFSTR("confirmedUntilDate"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeBool:forKey:", self->_wasExplicitConfirmation, CFSTR("wasExplicitConfirmation"));

}

- (HDSPConfirmWakeUpIDSMessage)initWithCoder:(id)a3
{
  id v4;
  HDSPConfirmWakeUpIDSMessage *v5;
  uint64_t v6;
  NSDate *wakeUpConfirmedUntilDate;
  HDSPConfirmWakeUpIDSMessage *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDSPConfirmWakeUpIDSMessage;
  v5 = -[HDSPEventRecordMessage initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("confirmedUntilDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    wakeUpConfirmedUntilDate = v5->_wakeUpConfirmedUntilDate;
    v5->_wakeUpConfirmedUntilDate = (NSDate *)v6;

    v5->_wasExplicitConfirmation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("wasExplicitConfirmation"));
    v8 = v5;
  }

  return v5;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[HDSPConfirmWakeUpIDSMessage wasExplicitConfirmation](self, "wasExplicitConfirmation"), CFSTR("wasExplicitConfirmation"));
  -[HDSPConfirmWakeUpIDSMessage wakeUpConfirmedDate](self, "wakeUpConfirmedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("wakeUpConfirmedDate"));

  -[HDSPConfirmWakeUpIDSMessage wakeUpConfirmedUntilDate](self, "wakeUpConfirmedUntilDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendObject:withName:", v7, CFSTR("wakeUpConfirmedUntilDate"));

  return v3;
}

- (BOOL)wasExplicitConfirmation
{
  return self->_wasExplicitConfirmation;
}

- (NSDate)wakeUpConfirmedUntilDate
{
  return self->_wakeUpConfirmedUntilDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wakeUpConfirmedUntilDate, 0);
}

@end
