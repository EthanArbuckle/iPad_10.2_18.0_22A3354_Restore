@implementation TUICursorAccessoryAssertion

- (TUICursorAccessoryAssertion)initWithAccessoryType:(unint64_t)a3 accessory:(id)a4 controller:(id)a5
{
  id v8;
  id v9;
  TUICursorAccessoryAssertion *v10;
  TUICursorAccessoryAssertion *v11;
  objc_super v13;

  v8 = a4;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)TUICursorAccessoryAssertion;
  v10 = -[TUICursorAccessoryAssertion init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    -[TUICursorAccessoryAssertion setAccessoryType:](v10, "setAccessoryType:", a3);
    -[TUICursorAccessoryAssertion setAccessory:](v11, "setAccessory:", v8);
    -[TUICursorAccessoryAssertion setController:](v11, "setController:", v9);
  }

  return v11;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  TUIAssertionLogFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[TUICursorAccessoryAssertion dealloc]";
    _os_log_debug_impl(&dword_18C785000, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  -[TUICursorAccessoryAssertion invalidate](self, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)TUICursorAccessoryAssertion;
  -[TUICursorAccessoryAssertion dealloc](&v4, sel_dealloc);
}

- (void)invalidate
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  TUIAssertionLogFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315138;
    v6 = "-[TUICursorAccessoryAssertion invalidate]";
    _os_log_debug_impl(&dword_18C785000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v5, 0xCu);
  }

  -[TUICursorAccessoryAssertion controller](self, "controller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endTrackingAssertion:", self);

}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TUICursorAccessoryAssertion accessoryType](self, "accessoryType");
  -[TUICursorAccessoryAssertion accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %lux %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (unint64_t)accessoryType
{
  return self->_accessoryType;
}

- (void)setAccessoryType:(unint64_t)a3
{
  self->_accessoryType = a3;
}

- (TUICursorAccessory)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_accessory, a3);
}

- (TUICursorAccessoryAssertionController)controller
{
  return (TUICursorAccessoryAssertionController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void)setController:(id)a3
{
  objc_storeWeak((id *)&self->_controller, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_accessory, 0);
}

@end
