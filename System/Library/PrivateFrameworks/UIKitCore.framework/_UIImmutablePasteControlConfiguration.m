@implementation _UIImmutablePasteControlConfiguration

- (void)setDisplayMode:(unint64_t)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPasteControl.m"), 103, CFSTR("Configuration is immutable because it is a property of a paste control"));

}

- (void)setCornerStyle:(int64_t)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPasteControl.m"), 107, CFSTR("Configuration is immutable because it is a property of a paste control"));

}

- (void)setCornerRadius:(double)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPasteControl.m"), 111, CFSTR("Configuration is immutable because it is a property of a paste control"));

}

- (void)setBaseForegroundColor:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPasteControl.m"), 115, CFSTR("Configuration is immutable because it is a property of a paste control"));

}

- (void)setBaseBackgroundColor:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPasteControl.m"), 119, CFSTR("Configuration is immutable because it is a property of a paste control"));

}

@end
