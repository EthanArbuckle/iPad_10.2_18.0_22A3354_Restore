@implementation SBIconModelMemoryStore

- (SBIconModelMemoryStore)initWithCurrentState:(id)a3 desiredState:(id)a4
{
  id v6;
  id v7;
  SBIconModelMemoryStore *v8;
  SBIconModelMemoryStore *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBIconModelMemoryStore;
  v8 = -[SBIconModelMemoryStore init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[SBIconModelMemoryStore setCurrentState:](v8, "setCurrentState:", v6);
    -[SBIconModelMemoryStore setDesiredState:](v9, "setDesiredState:", v7);
  }

  return v9;
}

- (SBIconModelMemoryStore)init
{
  return -[SBIconModelMemoryStore initWithCurrentState:desiredState:](self, "initWithCurrentState:desiredState:", 0, 0);
}

- (BOOL)saveCurrentIconState:(id)a3 error:(id *)a4
{
  -[SBIconModelMemoryStore setCurrentState:](self, "setCurrentState:", a3, a4);
  return 1;
}

- (BOOL)saveDesiredIconState:(id)a3 error:(id *)a4
{
  -[SBIconModelMemoryStore setDesiredState:](self, "setDesiredState:", a3, a4);
  return 1;
}

- (BOOL)deleteCurrentIconStateWithOptions:(unint64_t)a3 error:(id *)a4
{
  -[SBIconModelMemoryStore setCurrentState:](self, "setCurrentState:", 0, a4);
  return 1;
}

- (BOOL)deleteDesiredIconStateWithOptions:(unint64_t)a3 error:(id *)a4
{
  -[SBIconModelMemoryStore setDesiredState:](self, "setDesiredState:", 0, a4);
  return 1;
}

- (id)loadCurrentIconState:(id *)a3
{
  return (id)-[NSDictionary copy](self->_currentState, "copy", a3);
}

- (id)loadDesiredIconState:(id *)a3
{
  return (id)-[NSDictionary copy](self->_desiredState, "copy", a3);
}

- (NSDictionary)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDictionary)desiredState
{
  return self->_desiredState;
}

- (void)setDesiredState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desiredState, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
}

@end
