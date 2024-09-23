@implementation _UIKeyboardSuppressionPencilPolicyDelegate

- (id)_recognitionLocaleIdentifier
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (self->_isQueryingLocaleIdentifier)
    return 0;
  self->_isQueryingLocaleIdentifier = 1;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v4 = (void *)_MergedGlobals_1102;
  v17 = _MergedGlobals_1102;
  if (!_MergedGlobals_1102)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __getPKTextInputSettingsClass_block_invoke;
    v13[3] = &unk_1E16B14C0;
    v13[4] = &v14;
    __getPKTextInputSettingsClass_block_invoke((uint64_t)v13);
    v4 = (void *)v15[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v14, 8);
  objc_msgSend(v5, "sharedSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyboardSuppressionPencilPolicyDelegate _overrideLocaleIdentifier](self, "_overrideLocaleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v6, "recognitionLocaleIdentifier");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  self->_isQueryingLocaleIdentifier = 0;
  if (-[_UIKeyboardSuppressionPencilPolicyDelegate _suppressLocaleIdentifier](self, "_suppressLocaleIdentifier"))
    v11 = 0;
  else
    v11 = v10;
  v12 = v11;

  return v12;
}

- (BOOL)_shouldSuppressForDelegate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[_UIKeyboardSuppressionPencilPolicyDelegate _recognitionLocaleIdentifier](self, "_recognitionLocaleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      LODWORD(v5) = objc_msgSend(v4, "isSecureTextEntry") ^ 1;
    else
      LOBYTE(v5) = 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (objc_msgSend(v4, "_textInputSource") != 3)
        LOBYTE(v5) = 0;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }

  return (char)v5;
}

- (BOOL)_suppressLocaleIdentifier
{
  return self->_suppressLocaleIdentifier;
}

- (void)set_suppressLocaleIdentifier:(BOOL)a3
{
  self->_suppressLocaleIdentifier = a3;
}

- (NSString)_overrideLocaleIdentifier
{
  return self->_overrideLocaleIdentifier;
}

- (void)set_overrideLocaleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideLocaleIdentifier, 0);
}

@end
