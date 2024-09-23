@implementation VOSCommandProfileValidation

- (VOSCommandProfileValidation)init
{
  return -[VOSCommandProfileValidation initWithType:](self, "initWithType:", 0);
}

- (VOSCommandProfileValidation)initWithType:(int64_t)a3
{
  VOSCommandProfileValidation *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VOSCommandProfileValidation;
  result = -[VOSCommandProfileValidation init](&v5, sel_init);
  if (result)
    result->_validationType = a3;
  return result;
}

+ (id)successfulValidation
{
  return -[VOSCommandProfileValidation initWithType:]([VOSCommandProfileValidation alloc], "initWithType:", 0);
}

+ (id)gestureAssignedToOtherCommandValidation:(id)a3
{
  id v3;
  VOSCommandProfileValidation *v4;

  v3 = a3;
  v4 = -[VOSCommandProfileValidation initWithType:]([VOSCommandProfileValidation alloc], "initWithType:", 2);
  -[VOSCommandProfileValidation setPreviouslyBoundCommand:](v4, "setPreviouslyBoundCommand:", v3);

  return v4;
}

+ (id)keyboardShortcutAssignedToOtherCommandValidation:(id)a3
{
  id v3;
  VOSCommandProfileValidation *v4;

  v3 = a3;
  v4 = -[VOSCommandProfileValidation initWithType:]([VOSCommandProfileValidation alloc], "initWithType:", 4);
  -[VOSCommandProfileValidation setPreviouslyBoundCommand:](v4, "setPreviouslyBoundCommand:", v3);

  return v4;
}

+ (id)gestureIsRequiredValidation
{
  return -[VOSCommandProfileValidation initWithType:]([VOSCommandProfileValidation alloc], "initWithType:", 5);
}

- (BOOL)isSuccessful
{
  return self->_validationType == 0;
}

- (BOOL)isGestureAlreadyAssignedToCommand
{
  return self->_validationType == 1;
}

- (BOOL)isGestureAssignedToOtherCommand
{
  return self->_validationType == 2;
}

- (BOOL)isKeyboardShortcutAlreadyAssignedToCommand
{
  return self->_validationType == 3;
}

- (BOOL)isKeyboardShortcutAssignedToOtherCommand
{
  return self->_validationType == 4;
}

- (NSString)localizedErrorTitle
{
  unint64_t v2;
  void *v3;

  v2 = self->_validationType - 1;
  if (v2 > 4)
  {
    v3 = 0;
  }
  else
  {
    VOSLocString(off_24CBAD530[v2]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (NSString)localizedErrorMessage
{
  __CFString *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  switch(self->_validationType)
  {
    case 1:
      v3 = CFSTR("gesture.already.assigned.message");
      goto LABEL_9;
    case 2:
      v5 = (void *)MEMORY[0x24BDD17C8];
      v6 = CFSTR("gesture.in.use.message");
      goto LABEL_7;
    case 3:
      v3 = CFSTR("keyboard.shortcut.already.assigned.message");
      goto LABEL_9;
    case 4:
      v5 = (void *)MEMORY[0x24BDD17C8];
      v6 = CFSTR("keyboard.shortcut.in.use.message");
LABEL_7:
      VOSLocString(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[VOSCommandProfileValidation previouslyBoundCommand](self, "previouslyBoundCommand");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringWithFormat:", v7, v9);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 5:
      v3 = CFSTR("gesture.required.message");
LABEL_9:
      VOSLocString(v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v4 = 0;
      break;
  }
  return (NSString *)v4;
}

- (VOSCommand)previouslyBoundCommand
{
  return self->_previouslyBoundCommand;
}

- (void)setPreviouslyBoundCommand:(id)a3
{
  objc_storeStrong((id *)&self->_previouslyBoundCommand, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previouslyBoundCommand, 0);
}

@end
