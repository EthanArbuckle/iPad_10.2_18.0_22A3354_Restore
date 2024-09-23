@implementation BYXPCActivity

+ (id)activityWithXPCActivity:(id)a3
{
  id v3;
  BYXPCActivity *v4;

  v3 = a3;
  v4 = objc_alloc_init(BYXPCActivity);
  -[BYXPCActivity setUnderlyingActivity:](v4, "setUnderlyingActivity:", v3);

  return v4;
}

- (BOOL)setState:(int64_t)a3
{
  _xpc_activity_s *v4;

  -[BYXPCActivity underlyingActivity](self, "underlyingActivity");
  v4 = (_xpc_activity_s *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = xpc_activity_set_state(v4, a3);

  return a3;
}

- (int64_t)state
{
  _xpc_activity_s *v2;
  xpc_activity_state_t state;

  -[BYXPCActivity underlyingActivity](self, "underlyingActivity");
  v2 = (_xpc_activity_s *)objc_claimAutoreleasedReturnValue();
  state = xpc_activity_get_state(v2);

  return state;
}

- (BOOL)shouldDefer
{
  _xpc_activity_s *v2;
  BOOL should_defer;

  -[BYXPCActivity underlyingActivity](self, "underlyingActivity");
  v2 = (_xpc_activity_s *)objc_claimAutoreleasedReturnValue();
  should_defer = xpc_activity_should_defer(v2);

  return should_defer;
}

- (BOOL)setCompletionStatus:(int64_t)a3
{
  void *v3;
  char v4;

  -[BYXPCActivity underlyingActivity](self, "underlyingActivity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = xpc_activity_set_completion_status();

  return v4;
}

- (void)setCriteria:(id)a3
{
  id v4;
  _xpc_activity_s *v5;

  v4 = a3;
  -[BYXPCActivity underlyingActivity](self, "underlyingActivity");
  v5 = (_xpc_activity_s *)objc_claimAutoreleasedReturnValue();
  xpc_activity_set_criteria(v5, v4);

}

- (OS_xpc_object)criteria
{
  _xpc_activity_s *v2;
  xpc_object_t v3;

  -[BYXPCActivity underlyingActivity](self, "underlyingActivity");
  v2 = (_xpc_activity_s *)objc_claimAutoreleasedReturnValue();
  v3 = xpc_activity_copy_criteria(v2);

  return (OS_xpc_object *)v3;
}

- (OS_xpc_object)underlyingActivity
{
  return self->_underlyingActivity;
}

- (void)setUnderlyingActivity:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingActivity, a3);
}

- (OS_xpc_object)xpcActivity
{
  return self->_xpcActivity;
}

- (void)setXpcActivity:(id)a3
{
  objc_storeStrong((id *)&self->_xpcActivity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcActivity, 0);
  objc_storeStrong((id *)&self->_underlyingActivity, 0);
}

@end
