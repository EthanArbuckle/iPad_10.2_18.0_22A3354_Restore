@implementation STAskForTimeResponse

- (STAskForTimeResponse)initWithPayload:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  STAskForTimeResponse *v8;
  STAskForTimeResponse *v9;
  STAskForTimeResponse *v10;
  void *v11;
  uint64_t v12;
  NSNumber *respondingUserDSID;
  uint64_t v14;
  NSNumber *amountGranted;
  objc_super v17;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("associatedRequestIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeStamp"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = 0;
  if (v5)
  {
    if (v6)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("answer"));
      v8 = (STAskForTimeResponse *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        v17.receiver = self;
        v17.super_class = (Class)STAskForTimeResponse;
        v9 = -[STAskForTimeResponse init](&v17, sel_init);
        v10 = v9;
        if (v9)
        {
          objc_storeStrong((id *)&v9->_associatedRequestIdentifier, v5);
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("answer"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v10->_answer = objc_msgSend(v11, "integerValue");

          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("respondingUserDSID"));
          v12 = objc_claimAutoreleasedReturnValue();
          respondingUserDSID = v10->_respondingUserDSID;
          v10->_respondingUserDSID = (NSNumber *)v12;

          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("amountGranted"));
          v14 = objc_claimAutoreleasedReturnValue();
          amountGranted = v10->_amountGranted;
          v10->_amountGranted = (NSNumber *)v14;

          objc_storeStrong((id *)&v10->_timeStamp, v7);
        }
        self = v10;
        v8 = self;
      }
    }
  }

  return v8;
}

- (STAskForTimeResponse)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STAskForTimeResponse;
  return -[STAskForTimeResponse init](&v3, sel_init);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (STAskForTimeResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  STAskForTimeResponse *v9;
  STAskForTimeResponse *v10;
  uint64_t v11;
  NSNumber *respondingUserDSID;
  uint64_t v13;
  NSNumber *amountGranted;
  STAskForTimeResponse *v15;
  void *v16;
  objc_super v18;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("associatedRequestIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeStamp"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8 || (objc_msgSend(v4, "containsValueForKey:", CFSTR("answer")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4865, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v16);

    v15 = 0;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)STAskForTimeResponse;
    v9 = -[STAskForTimeResponse init](&v18, sel_init);
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_associatedRequestIdentifier, v5);
      v10->_answer = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("answer"));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("respondingUserDSID"));
      v11 = objc_claimAutoreleasedReturnValue();
      respondingUserDSID = v10->_respondingUserDSID;
      v10->_respondingUserDSID = (NSNumber *)v11;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("amountGranted"));
      v13 = objc_claimAutoreleasedReturnValue();
      amountGranted = v10->_amountGranted;
      v10->_amountGranted = (NSNumber *)v13;

      objc_storeStrong((id *)&v10->_timeStamp, v7);
    }
    self = v10;
    v15 = self;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *associatedRequestIdentifier;
  id v5;

  associatedRequestIdentifier = self->_associatedRequestIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", associatedRequestIdentifier, CFSTR("associatedRequestIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_answer, CFSTR("answer"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_respondingUserDSID, CFSTR("respondingUserDSID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_amountGranted, CFSTR("amountGranted"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timeStamp, CFSTR("timeStamp"));

}

- (NSDictionary)payload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 8);
  -[STAskForTimeResponse associatedRequestIdentifier](self, "associatedRequestIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("associatedRequestIdentifier"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[STAskForTimeResponse answer](self, "answer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("answer"));

  -[STAskForTimeResponse respondingUserDSID](self, "respondingUserDSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("respondingUserDSID"));

  -[STAskForTimeResponse amountGranted](self, "amountGranted");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("amountGranted"));

  -[STAskForTimeResponse timeStamp](self, "timeStamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("timeStamp"));

  return (NSDictionary *)v3;
}

- (NSUUID)associatedRequestIdentifier
{
  return self->_associatedRequestIdentifier;
}

- (void)setAssociatedRequestIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_associatedRequestIdentifier, a3);
}

- (int64_t)answer
{
  return self->_answer;
}

- (void)setAnswer:(int64_t)a3
{
  self->_answer = a3;
}

- (NSNumber)respondingUserDSID
{
  return self->_respondingUserDSID;
}

- (void)setRespondingUserDSID:(id)a3
{
  objc_storeStrong((id *)&self->_respondingUserDSID, a3);
}

- (NSNumber)amountGranted
{
  return self->_amountGranted;
}

- (void)setAmountGranted:(id)a3
{
  objc_storeStrong((id *)&self->_amountGranted, a3);
}

- (NSDate)timeStamp
{
  return self->_timeStamp;
}

- (void)setTimeStamp:(id)a3
{
  objc_storeStrong((id *)&self->_timeStamp, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeStamp, 0);
  objc_storeStrong((id *)&self->_amountGranted, 0);
  objc_storeStrong((id *)&self->_respondingUserDSID, 0);
  objc_storeStrong((id *)&self->_associatedRequestIdentifier, 0);
}

@end
