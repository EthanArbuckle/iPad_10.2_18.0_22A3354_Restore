@implementation SFEndSearchFeedback

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFEndSearchFeedback;
  v4 = a3;
  -[SFFeedback encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_uuid, CFSTR("uuid"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeBool:forKey:", self->_isCanceled, CFSTR("_isCanceled"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_cancelSearchEvent, CFSTR("_cancelSearchEvent"));

}

- (NSString)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (SFEndSearchFeedback)initWithStartSearch:(id)a3
{
  id v4;
  SFEndSearchFeedback *v5;
  void *v6;
  uint64_t v7;
  NSString *uuid;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFEndSearchFeedback;
  v5 = -[SFFeedback init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v7;

    v5->super._queryId = objc_msgSend(v4, "queryId");
  }

  return v5;
}

- (SFEndSearchFeedback)initWithCoder:(id)a3
{
  id v4;
  SFEndSearchFeedback *v5;
  uint64_t v6;
  NSString *uuid;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFEndSearchFeedback;
  v5 = -[SFFeedback initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
    v6 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v6;

    v5->_isCanceled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isCanceled"));
    v5->_cancelSearchEvent = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_cancelSearchEvent"));
  }

  return v5;
}

- (void)setUuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isCanceled
{
  return self->_isCanceled;
}

- (void)setIsCanceled:(BOOL)a3
{
  self->_isCanceled = a3;
}

- (unint64_t)cancelSearchEvent
{
  return self->_cancelSearchEvent;
}

- (void)setCancelSearchEvent:(unint64_t)a3
{
  self->_cancelSearchEvent = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
