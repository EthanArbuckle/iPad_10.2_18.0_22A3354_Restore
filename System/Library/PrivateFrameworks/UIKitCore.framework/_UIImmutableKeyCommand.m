@implementation _UIImmutableKeyCommand

- (void)setTitle:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKeyCommand.m"), 1132, CFSTR("Command is immutable because it is a child of a menu"));

}

- (void)setImage:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKeyCommand.m"), 1136, CFSTR("Command is immutable because it is a child of a menu"));

}

- (void)setDiscoverabilityTitle:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKeyCommand.m"), 1140, CFSTR("Command is immutable because it is a child of a menu"));

}

- (void)setAttributes:(unint64_t)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKeyCommand.m"), 1144, CFSTR("Command is immutable because it is a child of a menu"));

}

- (void)setState:(int64_t)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKeyCommand.m"), 1148, CFSTR("Command is immutable because it is a child of a menu"));

}

- (void)setWantsPriorityOverSystemBehavior:(BOOL)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKeyCommand.m"), 1152, CFSTR("Command is immutable because it is a child of a menu"));

}

- (void)setAllowsAutomaticLocalization:(BOOL)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKeyCommand.m"), 1156, CFSTR("Command is immutable because it is a child of a menu"));

}

- (void)setAllowsAutomaticMirroring:(BOOL)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKeyCommand.m"), 1160, CFSTR("Command is immutable because it is a child of a menu"));

}

- (void)_setEventDeferringEnvironment:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKeyCommand.m"), 1164, CFSTR("Command is immutable because it is a child of a menu"));

}

- (void)_setEnumerationPriority:(int64_t)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKeyCommand.m"), 1168, CFSTR("Command is immutable because it is a child of a menu"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[UIKeyCommand initWithKeyCommand:]([UIKeyCommand alloc], "initWithKeyCommand:", self);
}

@end
