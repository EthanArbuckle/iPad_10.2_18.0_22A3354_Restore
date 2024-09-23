@implementation _UIPhysicalButtonMutableConfigurationSet

- (void)_setConfiguration:(id)a3 forButton:(unint64_t)a4
{
  char v8;
  id v9;
  NSMutableDictionary *configurationsByButton;
  void *v11;
  void *v12;
  id v13;

  ++self->_mutationDetector;
  v13 = 0;
  v8 = -[_UIPhysicalButtonConfigurationSet _validateRequirementsForCandidateButton:andConfiguration:allowingNilRequiredConfiguration:withOutErrorMessage:](self, a4, a3, 1, &v13);
  v9 = v13;
  if ((v8 & 1) != 0)
  {
    configurationsByButton = self->super._configurationsByButton;
    if (a3)
    {
      v11 = (void *)objc_msgSend(a3, "copy");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](configurationsByButton, "setObject:forKey:", v11, v12);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](configurationsByButton, "removeObjectForKey:", v11);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPhysicalButtonConfiguration.m"), 1236, CFSTR("Invalid button and configuration pair for reason: %@"), v9);
  }

}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[_UIPhysicalButtonConfigurationSet _countByEnumeratingWithState:objects:count:mutationPointer:](self, &a3->var0, (unint64_t)a4, a5, (unint64_t)&self->_mutationDetector);
}

- (_UIPhysicalButtonMutableConfigurationSet)init
{
  uint64_t v4;
  void *v6;

  v4 = objc_opt_class();
  if (v4 != objc_opt_class())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPhysicalButtonConfiguration.m"), 1220, CFSTR("_UIPhysicalButtonMutableConfigurationSet cannot be subclassed"));

  }
  return (_UIPhysicalButtonMutableConfigurationSet *)-[_UIPhysicalButtonConfigurationSet _initWithConfigurationsDictionary:](self, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _UIPhysicalButtonConfigurationSet *v4;
  void *v5;
  _QWORD *v6;

  v4 = [_UIPhysicalButtonConfigurationSet alloc];
  v5 = (void *)-[NSMutableDictionary copy](self->super._configurationsByButton, "copy");
  v6 = -[_UIPhysicalButtonConfigurationSet _initWithConfigurationsDictionary:](v4, v5);

  return v6;
}

+ (id)new
{
  return objc_alloc_init(_UIPhysicalButtonMutableConfigurationSet);
}

- (void)_unionWithConfigurationSet:(id)a3
{
  _QWORD v3[7];

  if (self)
  {
    if (a3)
    {
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __87___UIPhysicalButtonMutableConfigurationSet__unionWithConfigurationSet_acceptanceBlock___block_invoke;
      v3[3] = &unk_1E16ED060;
      v3[4] = self;
      v3[5] = a3;
      v3[6] = 0;
      _UIPhysicalButtonEnumerateAllButtonsWithBlock((uint64_t)v3);
    }
  }
}

@end
