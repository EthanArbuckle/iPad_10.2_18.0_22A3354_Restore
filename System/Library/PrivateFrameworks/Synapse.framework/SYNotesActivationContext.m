@implementation SYNotesActivationContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SYNotesActivationContext)init
{
  -[SYNotesActivationContext doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (SYNotesActivationContext)initWithCoder:(id)a3
{
  id v4;
  SYNotesActivationContext *v5;
  uint64_t v6;
  NSData *userActivityData;
  uint64_t v8;
  BSProcessHandle *processHandle;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SYNotesActivationContext;
  v5 = -[SYNotesActivationContext init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userActivityData"));
    v6 = objc_claimAutoreleasedReturnValue();
    userActivityData = v5->_userActivityData;
    v5->_userActivityData = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("processHandle"));
    v8 = objc_claimAutoreleasedReturnValue();
    processHandle = v5->_processHandle;
    v5->_processHandle = (BSProcessHandle *)v8;

    v5->_contextID = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("contextID"));
    v5->_renderID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("renderID"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SYNotesActivationContext userActivityData](self, "userActivityData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("userActivityData"));

  -[SYNotesActivationContext processHandle](self, "processHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("processHandle"));

  objc_msgSend(v6, "encodeInt32:forKey:", -[SYNotesActivationContext contextID](self, "contextID"), CFSTR("contextID"));
  objc_msgSend(v6, "encodeInt64:forKey:", -[SYNotesActivationContext renderID](self, "renderID"), CFSTR("renderID"));

}

- (SYNotesActivationContext)initWithUserActivityData:(id)a3 contextID:(unsigned int)a4 renderID:(unint64_t)a5
{
  id v8;
  SYNotesActivationContext *v9;
  uint64_t v10;
  NSData *userActivityData;
  uint64_t v12;
  BSProcessHandle *processHandle;
  objc_super v15;

  v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SYNotesActivationContext;
  v9 = -[SYNotesActivationContext init](&v15, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    userActivityData = v9->_userActivityData;
    v9->_userActivityData = (NSData *)v10;

    objc_msgSend(MEMORY[0x1E0D228B0], "processHandle");
    v12 = objc_claimAutoreleasedReturnValue();
    processHandle = v9->_processHandle;
    v9->_processHandle = (BSProcessHandle *)v12;

    v9->_contextID = a4;
    v9->_renderID = a5;
  }

  return v9;
}

- (NSData)userActivityData
{
  return self->_userActivityData;
}

- (BSProcessHandle)processHandle
{
  return self->_processHandle;
}

- (unsigned)contextID
{
  return self->_contextID;
}

- (unint64_t)renderID
{
  return self->_renderID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processHandle, 0);
  objc_storeStrong((id *)&self->_userActivityData, 0);
}

@end
