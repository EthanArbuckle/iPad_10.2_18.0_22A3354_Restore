@implementation TITypologyRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordID, 0);
}

- (TITypologyRecord)init
{
  TITypologyRecord *v2;
  void *v3;
  double v4;
  uint64_t v5;
  NSUUID *recordID;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TITypologyRecord;
  v2 = -[TITypologyRecord init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "systemUptime");
    v2->_timestamp = v4;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = objc_claimAutoreleasedReturnValue();
    recordID = v2->_recordID;
    v2->_recordID = (NSUUID *)v5;

  }
  return v2;
}

- (TITypologyRecord)initWithCoder:(id)a3
{
  id v4;
  TITypologyRecord *v5;
  double v6;
  uint64_t v7;
  NSUUID *recordID;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TITypologyRecord;
  v5 = -[TITypologyRecord init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timestamp"));
    v5->_timestamp = v6;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recordID"));
    v7 = objc_claimAutoreleasedReturnValue();
    recordID = v5->_recordID;
    v5->_recordID = (NSUUID *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double timestamp;
  id v5;

  timestamp = self->_timestamp;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("timestamp"), timestamp);
  objc_msgSend(v5, "encodeObject:forKey:", self->_recordID, CFSTR("recordID"));

}

- (id)textSummary
{
  return &stru_1E243B990;
}

- (id)shortDescription
{
  return CFSTR("TITypologyRecord");
}

- (id)changedText
{
  return 0;
}

- (id)currentKeyboardState
{
  return 0;
}

- (id)textSummaryForAutocorrection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v3 = a3;
  objc_msgSend(v3, "input");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "candidate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length")
    && (objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "invertedSet"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v4, "rangeOfCharacterFromSet:", v7),
        v7,
        v6,
        v8 != 0x7FFFFFFFFFFFFFFFLL))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%@→%@}"), v4, v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%@}"), v5, v11);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (NSUUID)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_recordID, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)recordClasses
{
  _QWORD v3[17];

  v3[16] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  v3[4] = objc_opt_class();
  v3[5] = objc_opt_class();
  v3[6] = objc_opt_class();
  v3[7] = objc_opt_class();
  v3[8] = objc_opt_class();
  v3[9] = objc_opt_class();
  v3[10] = objc_opt_class();
  v3[11] = objc_opt_class();
  v3[12] = objc_opt_class();
  v3[13] = objc_opt_class();
  v3[14] = objc_opt_class();
  v3[15] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 16);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)applyToStatistic:(id)a3
{
  objc_msgSend(a3, "visitTypologyRecord:", self);
}

@end
