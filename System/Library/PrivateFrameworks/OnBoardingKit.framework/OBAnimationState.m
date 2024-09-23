@implementation OBAnimationState

- (OBAnimationState)initWithStateName:(id)a3 transitionDuration:(double)a4 transitionSpeed:(double)a5
{
  id v8;
  OBAnimationState *v9;
  OBAnimationState *v10;
  uint64_t v11;
  NSString *name;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)OBAnimationState;
  v9 = -[OBAnimationState init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_transitionDuration = a4;
    v11 = objc_msgSend(v8, "copy");
    name = v10->_name;
    v10->_name = (NSString *)v11;

    v10->_transitionSpeed = a5;
  }

  return v10;
}

- (OBAnimationState)initWithStateName:(id)a3 darkStateName:(id)a4 transitionDuration:(double)a5 transitionSpeed:(double)a6
{
  id v11;
  OBAnimationState *v12;
  OBAnimationState *v13;

  v11 = a4;
  v12 = -[OBAnimationState initWithStateName:transitionDuration:transitionSpeed:](self, "initWithStateName:transitionDuration:transitionSpeed:", a3, a5, a6);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_darkName, a4);

  return v13;
}

- (NSString)darkName
{
  NSString *darkName;

  darkName = self->_darkName;
  if (darkName)
    return darkName;
  -[OBAnimationState name](self, "name");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)stateForLayer:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v4 = (void *)MEMORY[0x1E0DC3E88];
  v5 = a3;
  objc_msgSend(v4, "_currentTraitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "userInterfaceStyle") == 2)
    -[OBAnimationState darkName](self, "darkName");
  else
    -[OBAnimationState name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stateWithName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    _OBLoggingFacility();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[OBAnimationState stateForLayer:].cold.1(self, v9);

  }
  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)setDarkName:(id)a3
{
  objc_storeStrong((id *)&self->_darkName, a3);
}

- (double)transitionDuration
{
  return self->_transitionDuration;
}

- (void)setTransitionDuration:(double)a3
{
  self->_transitionDuration = a3;
}

- (double)transitionSpeed
{
  return self->_transitionSpeed;
}

- (void)setTransitionSpeed:(double)a3
{
  self->_transitionSpeed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darkName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)stateForLayer:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_199FE5000, a2, OS_LOG_TYPE_ERROR, "The layer does not contain a state with %@: Invalid state name", (uint8_t *)&v4, 0xCu);

}

@end
