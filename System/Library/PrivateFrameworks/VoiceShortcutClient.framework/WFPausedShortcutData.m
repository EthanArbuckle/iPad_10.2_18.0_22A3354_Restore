@implementation WFPausedShortcutData

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WFPausedShortcutData contextData](self, "contextData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("contextData"));

  -[WFPausedShortcutData descriptorData](self, "descriptorData");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("descriptorData"));

}

- (WFPausedShortcutData)initWithCoder:(id)a3
{
  id v4;
  WFPausedShortcutData *v5;
  uint64_t v6;
  NSData *contextData;
  uint64_t v8;
  NSData *descriptorData;
  WFPausedShortcutData *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFPausedShortcutData;
  v5 = -[WFPausedShortcutData init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("contextData"));
    v6 = objc_claimAutoreleasedReturnValue();
    contextData = v5->_contextData;
    v5->_contextData = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("descriptorData"));
    v8 = objc_claimAutoreleasedReturnValue();
    descriptorData = v5->_descriptorData;
    v5->_descriptorData = (NSData *)v8;

    v10 = v5;
  }

  return v5;
}

- (WFPausedShortcutData)initWithContext:(id)a3 descriptor:(id)a4
{
  id v6;
  id v7;
  WFPausedShortcutData *v8;
  uint64_t v9;
  NSData *contextData;
  uint64_t v11;
  NSData *descriptorData;
  WFPausedShortcutData *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFPausedShortcutData;
  v8 = -[WFPausedShortcutData init](&v15, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    contextData = v8->_contextData;
    v8->_contextData = (NSData *)v9;

    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    descriptorData = v8->_descriptorData;
    v8->_descriptorData = (NSData *)v11;

    v13 = v8;
  }

  return v8;
}

- (WFWorkflowRunningContext)context
{
  WFWorkflowRunningContext *context;
  void *v4;
  uint64_t v5;
  NSData *contextData;
  WFWorkflowRunningContext *v7;
  id v8;
  WFWorkflowRunningContext *v9;
  NSObject *v10;
  void *v11;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  context = self->_context;
  if (!context)
  {
    v4 = (void *)MEMORY[0x1E0CB3710];
    v5 = objc_opt_class();
    contextData = self->_contextData;
    v13 = 0;
    objc_msgSend(v4, "unarchivedObjectOfClass:fromData:error:", v5, contextData, &v13);
    v7 = (WFWorkflowRunningContext *)objc_claimAutoreleasedReturnValue();
    v8 = v13;
    v9 = self->_context;
    self->_context = v7;

    if (v8)
    {
      getWFVoiceShortcutClientLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "localizedDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v15 = "-[WFPausedShortcutData context]";
        v16 = 2112;
        v17 = v11;
        _os_log_impl(&dword_1AF681000, v10, OS_LOG_TYPE_ERROR, "%s Unable to decode running context: %@", buf, 0x16u);

      }
    }

    context = self->_context;
  }
  return context;
}

- (WFWorkflowRunDescriptor)descriptor
{
  WFWorkflowRunDescriptor *descriptor;
  void *v4;
  uint64_t v5;
  NSData *descriptorData;
  WFWorkflowRunDescriptor *v7;
  id v8;
  WFWorkflowRunDescriptor *v9;
  NSObject *v10;
  void *v11;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  descriptor = self->_descriptor;
  if (!descriptor)
  {
    v4 = (void *)MEMORY[0x1E0CB3710];
    v5 = objc_opt_class();
    descriptorData = self->_descriptorData;
    v13 = 0;
    objc_msgSend(v4, "unarchivedObjectOfClass:fromData:error:", v5, descriptorData, &v13);
    v7 = (WFWorkflowRunDescriptor *)objc_claimAutoreleasedReturnValue();
    v8 = v13;
    v9 = self->_descriptor;
    self->_descriptor = v7;

    if (v8)
    {
      getWFVoiceShortcutClientLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "localizedDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v15 = "-[WFPausedShortcutData descriptor]";
        v16 = 2112;
        v17 = v11;
        _os_log_impl(&dword_1AF681000, v10, OS_LOG_TYPE_ERROR, "%s Unable to decode run descriptor: %@", buf, 0x16u);

      }
    }

    descriptor = self->_descriptor;
  }
  return descriptor;
}

- (NSData)contextData
{
  return self->_contextData;
}

- (void)setContextData:(id)a3
{
  objc_storeStrong((id *)&self->_contextData, a3);
}

- (NSData)descriptorData
{
  return self->_descriptorData;
}

- (void)setDescriptorData:(id)a3
{
  objc_storeStrong((id *)&self->_descriptorData, a3);
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void)setDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_descriptor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_descriptorData, 0);
  objc_storeStrong((id *)&self->_contextData, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
