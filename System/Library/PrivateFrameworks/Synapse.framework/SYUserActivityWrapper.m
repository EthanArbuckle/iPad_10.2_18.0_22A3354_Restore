@implementation SYUserActivityWrapper

- (SYUserActivityWrapper)initWithUserActivity:(id)a3
{
  id v5;
  SYUserActivityWrapper *v6;
  SYUserActivityWrapper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SYUserActivityWrapper;
  v6 = -[SYUserActivityWrapper init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_userActivity, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SYUserActivityWrapper)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SYUserActivityWrapper *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userActivityData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "_initWithUserActivityData:", v5);
    if (v6)
    {
      self = -[SYUserActivityWrapper initWithUserActivity:](self, "initWithUserActivity:", v6);
      v7 = self;
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSUserActivity *userActivity;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;

  v4 = a3;
  userActivity = self->_userActivity;
  v9 = 0;
  -[NSUserActivity _createUserActivityDataWithSaving:options:error:](userActivity, "_createUserActivityDataWithSaving:options:error:", 0, 0, &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v9;
  if (!v6)
  {
    v8 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SYUserActivityWrapper encodeWithCoder:].cold.1((uint64_t)v7, v8);

  }
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("userActivityData"));

}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userActivity, 0);
}

- (void)encodeWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1BCC38000, a2, OS_LOG_TYPE_ERROR, "Unable to serialize user activity, error: %@", (uint8_t *)&v2, 0xCu);
}

@end
