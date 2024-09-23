@implementation SFCustomFeedback

- (SFCustomFeedback)initWithType:(unint64_t)a3 jsonFeedback:(id)a4
{
  id v6;
  SFCustomFeedback *v7;
  SFCustomFeedback *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SFCustomFeedback;
  v7 = -[SFFeedback init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_feedbackType = a3;
    -[SFCustomFeedback setJsonFeedback:](v7, "setJsonFeedback:", v6);
  }

  return v8;
}

- (SFCustomFeedback)initWithType:(unint64_t)a3 data:(id)a4
{
  id v6;
  SFCustomFeedback *v7;
  SFCustomFeedback *v8;
  uint64_t v9;
  NSData *data;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SFCustomFeedback;
  v7 = -[SFFeedback init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_feedbackType = a3;
    v9 = objc_msgSend(v6, "copy");
    data = v8->_data;
    v8->_data = (NSData *)v9;

  }
  return v8;
}

- (SFCustomFeedback)initWithCoder:(id)a3
{
  id v4;
  SFCustomFeedback *v5;
  uint64_t v6;
  NSData *data;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFCustomFeedback;
  v5 = -[SFFeedback initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_feedbackType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("feedback_type"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_data"));
    v6 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFCustomFeedback;
  v4 = a3;
  -[SFFeedback encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_feedbackType, CFSTR("feedback_type"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_data, CFSTR("_data"));

}

- (void)setJsonFeedback:(id)a3
{
  NSData *v4;
  id v5;
  NSData *data;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", a3, 0, &v8);
  v4 = (NSData *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  data = self->_data;
  self->_data = v4;

  if (v5)
  {
    if (PARLogHandleForCategory_onceToken_31348 != -1)
      dispatch_once(&PARLogHandleForCategory_onceToken_31348, &__block_literal_global_31349);
    v7 = PARLogHandleForCategory_logHandles_1_31350;
    if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_1_31350, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v5;
      _os_log_error_impl(&dword_19E535000, v7, OS_LOG_TYPE_ERROR, "SFCustomFeedback: jsonFeedback did not serialize: %@.", buf, 0xCu);
    }
  }

}

- (unint64_t)feedbackType
{
  return self->_feedbackType;
}

- (void)setFeedbackType:(unint64_t)a3
{
  self->_feedbackType = a3;
}

- (NSDictionary)jsonFeedback
{
  return self->_jsonFeedback;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_jsonFeedback, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
