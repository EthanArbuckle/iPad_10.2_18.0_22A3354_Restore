@implementation WFVariableSubstitutableParameterState

- (WFVariableSubstitutableParameterState)initWithValue:(id)a3
{
  id v5;
  uint64_t v6;
  WFVariableSubstitutableParameterState *v7;
  id v8;
  id value;
  WFVariableSubstitutableParameterState *v10;
  void *v12;
  void *v13;
  objc_super v14;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFVariableSubstitutableParameterState.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("value"));

  }
  v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFVariableSubstitutableParameterState.m"), 50, CFSTR("Cannot initialize an abstract class"));

  }
  v14.receiver = self;
  v14.super_class = (Class)WFVariableSubstitutableParameterState;
  v7 = -[WFVariableSubstitutableParameterState init](&v14, sel_init);
  if (v7)
  {
    if ((objc_msgSend(v5, "conformsToProtocol:", &unk_1EF71B7D0) & 1) != 0)
      v8 = (id)objc_msgSend(v5, "copy");
    else
      v8 = v5;
    value = v7->_value;
    v7->_value = v8;

    v10 = v7;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variable, 0);
  objc_storeStrong(&self->_value, 0);
}

- (BOOL)isEqual:(id)a3
{
  WFVariableSubstitutableParameterState *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (WFVariableSubstitutableParameterState *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WFVariableSubstitutableParameterState value](self, "value");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFVariableSubstitutableParameterState value](v4, "value");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isEqual:", v6))
      {

LABEL_8:
        -[WFVariableSubstitutableParameterState variable](self, "variable");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9
          || (-[WFVariableSubstitutableParameterState variable](v4, "variable"),
              (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[WFVariableSubstitutableParameterState variable](self, "variable");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFVariableSubstitutableParameterState variable](v4, "variable");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = objc_msgSend(v10, "isEqual:", v11);

          if (v9)
          {
LABEL_14:

            goto LABEL_15;
          }
        }
        else
        {
          v7 = 1;
        }

        goto LABEL_14;
      }
      -[WFVariableSubstitutableParameterState value](self, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
        goto LABEL_8;
    }
    v7 = 0;
  }
LABEL_15:

  return v7;
}

- (id)value
{
  return self->_value;
}

- (WFPropertyListObject)serializedRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[WFVariableSubstitutableParameterState variable](self, "variable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFVariableSubstitutableParameterState variable](self, "variable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    WFSerializedVariableObject(v4);
  }
  else
  {
    v5 = (void *)objc_opt_class();
    -[WFVariableSubstitutableParameterState value](self, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serializedRepresentationFromValue:", v4);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (WFPropertyListObject *)v6;
}

- (WFVariable)variable
{
  return self->_variable;
}

- (WFVariableSubstitutableParameterState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  WFVariableSubstitutableParameterState *v14;
  void *v15;
  void *v16;
  WFVariableSubstitutableParameterState *v17;
  void *v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_opt_class();
  if (v12 == objc_opt_class())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFVariableSubstitutableParameterState.m"), 73, CFSTR("Cannot initialize an abstract class"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_10;
  WFDeserializedVariableObject(v9, v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = -[WFVariableSubstitutableParameterState initWithVariable:](self, "initWithVariable:", v13);
LABEL_12:
    self = v14;
    v17 = self;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v13, "representsSingleContentVariable"))
  {

LABEL_10:
    objc_msgSend((id)objc_opt_class(), "valueFromSerializedRepresentation:variableProvider:parameter:", v9, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      v17 = 0;
      goto LABEL_14;
    }
    v14 = -[WFVariableSubstitutableParameterState initWithValue:](self, "initWithValue:", v13);
    goto LABEL_12;
  }
  objc_msgSend(v13, "stringsAndVariables");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[WFVariableSubstitutableParameterState initWithVariable:](self, "initWithVariable:", v16);

  v17 = self;
LABEL_14:

  return v17;
}

- (WFVariableSubstitutableParameterState)initWithVariable:(id)a3
{
  id v6;
  uint64_t v7;
  WFVariableSubstitutableParameterState *v8;
  WFVariableSubstitutableParameterState *v9;
  WFVariableSubstitutableParameterState *v10;
  void *v12;
  void *v13;
  objc_super v14;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFVariableSubstitutableParameterState.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("variable"));

  }
  v7 = objc_opt_class();
  if (v7 == objc_opt_class())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFVariableSubstitutableParameterState.m"), 62, CFSTR("Cannot initialize an abstract class"));

  }
  v14.receiver = self;
  v14.super_class = (Class)WFVariableSubstitutableParameterState;
  v8 = -[WFVariableSubstitutableParameterState init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_variable, a3);
    v10 = v9;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[WFVariableSubstitutableParameterState value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[WFVariableSubstitutableParameterState variable](self, "variable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSArray)containedVariables
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0C99D20]);
  -[WFVariableSubstitutableParameterState variable](self, "variable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithObjects:", v4, 0);

  return (NSArray *)v5;
}

- (void)getObjectRepresentationOfVariableWithContext:(id)a3 processingValueClass:(Class)a4 valueHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v8 = a5;
  v9 = a3;
  -[WFVariableSubstitutableParameterState variable](self, "variable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __120__WFVariableSubstitutableParameterState_getObjectRepresentationOfVariableWithContext_processingValueClass_valueHandler___block_invoke;
  v12[3] = &unk_1E7AF1DE0;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "getObjectRepresentationForClass:context:completionHandler:", a4, v9, v12);

}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8;
  void (**v9)(id, void *, _QWORD);
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  v8 = a3;
  v9 = (void (**)(id, void *, _QWORD))a4;
  v10 = a5;
  -[WFVariableSubstitutableParameterState variable](self, "variable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[WFVariableSubstitutableParameterState variable](self, "variable");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v12, "prompt");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, v13, 0);

    }
    else
    {

      v14 = (void *)objc_msgSend((id)objc_opt_class(), "processingValueClass");
      if (objc_msgSend(v14, "isEqual:", objc_opt_class()))
      {
        -[WFVariableSubstitutableParameterState variable](self, "variable");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __98__WFVariableSubstitutableParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
        v17[3] = &unk_1E7AF1E08;
        v18 = v10;
        objc_msgSend(v15, "getFileRepresentationWithContext:completionHandler:", v8, v17);

      }
      else
      {
        -[WFVariableSubstitutableParameterState getObjectRepresentationOfVariableWithContext:processingValueClass:valueHandler:](self, "getObjectRepresentationOfVariableWithContext:processingValueClass:valueHandler:", v8, v14, v10);
      }
    }
  }
  else
  {
    -[WFVariableSubstitutableParameterState value](self, "value");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v10 + 2))(v10, v16, 0);

  }
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  objc_super v13;

  -[WFVariableSubstitutableParameterState value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFVariableSubstitutableParameterState value](self, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p, value: %@>"), v6, self, v7);
  }
  else
  {
    -[WFVariableSubstitutableParameterState variable](self, "variable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v13.receiver = self;
      v13.super_class = (Class)WFVariableSubstitutableParameterState;
      -[WFVariableSubstitutableParameterState debugDescription](&v13, sel_debugDescription);
      return (NSString *)(id)objc_claimAutoreleasedReturnValue();
    }
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFVariableSubstitutableParameterState variable](self, "variable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("<%@: %p, variable: %@>"), v6, self, v7);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

uint64_t __98__WFVariableSubstitutableParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __120__WFVariableSubstitutableParameterState_getObjectRepresentationOfVariableWithContext_processingValueClass_valueHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (Class)processingValueClass
{
  objc_class *Class;
  IMP MethodImplementation;
  void *v5;
  objc_class *v6;
  IMP v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  Class = object_getClass(a1);
  MethodImplementation = class_getMethodImplementation(Class, sel_processingValueClasses);
  v5 = (void *)objc_opt_class();
  v6 = object_getClass(v5);
  v7 = class_getMethodImplementation(v6, sel_processingValueClasses);
  v8 = (void *)MEMORY[0x1E0C99DA0];
  v9 = *MEMORY[0x1E0C99750];
  if (MethodImplementation == v7)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@) both +processingValueClass and +processingValueClasses are unimplemented. You must implement at least one of them"), a1);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@) +processingValueClasses is implemented and you should use that"), a1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v10, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v11);
}

+ (NSArray)processingValueClasses
{
  objc_class *Class;
  void (*MethodImplementation)(void);
  void *v5;
  objc_class *v6;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  Class = object_getClass(a1);
  MethodImplementation = class_getMethodImplementation(Class, sel_processingValueClass);
  v5 = (void *)objc_opt_class();
  v6 = object_getClass(v5);
  if (MethodImplementation == class_getMethodImplementation(v6, sel_processingValueClass))
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99750];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@) both +processingValueClass and +processingValueClasses are unimplemented. You must implement at least one of them"), a1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v10, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v11);
  }
  v12[0] = objc_msgSend(a1, "processingValueClass");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("+valueFromSerializedRepresentation is unimplemented"), 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v10);
}

+ (id)serializedRepresentationFromValue:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("+serializedRepresentationFromValue is unimplemented"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

@end
