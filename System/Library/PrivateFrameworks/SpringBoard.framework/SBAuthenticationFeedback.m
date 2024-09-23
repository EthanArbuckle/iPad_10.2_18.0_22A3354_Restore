@implementation SBAuthenticationFeedback

- (id)initForSuccess
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBAuthenticationFeedback;
  result = -[SBAuthenticationFeedback init](&v3, sel_init);
  if (result)
  {
    *((_QWORD *)result + 3) = 0;
    *((_WORD *)result + 8) = 1;
    *((_BYTE *)result + 18) = 0;
  }
  return result;
}

- (id)initForFailureShowingPasscode:(BOOL)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBAuthenticationFeedback;
  result = -[SBAuthenticationFeedback init](&v5, sel_init);
  if (result)
  {
    *((_QWORD *)result + 3) = 1;
    *((_BYTE *)result + 16) = 1;
    *((_BYTE *)result + 17) = a3;
    *((_BYTE *)result + 18) = 1;
  }
  return result;
}

- (id)initForFailureWithFailureSettings:(id)a3
{
  id v4;
  _BYTE *v5;

  v4 = a3;
  v5 = -[SBAuthenticationFeedback initForFailureShowingPasscode:](self, "initForFailureShowingPasscode:", objc_msgSend(v4, "showPasscode"));
  if (v5)
  {
    v5[16] = objc_msgSend(v4, "vibrate");
    v5[18] = objc_msgSend(v4, "jiggleLock");
  }

  return v5;
}

- (BOOL)hintFailureText
{
  if (self->_result == 1)
    return !-[SBAuthenticationFeedback showPasscode](self, "showPasscode");
  else
    return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_result)
    v5 = CFSTR("Failure");
  else
    v5 = CFSTR("Success");
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("result"));
  v6 = (id)objc_msgSend(v4, "appendBool:withName:", self->_showPasscode, CFSTR("showPasscode"));
  v7 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBAuthenticationFeedback hintFailureText](self, "hintFailureText"), CFSTR("hintFailureText"));
  v8 = (id)objc_msgSend(v4, "appendBool:withName:", self->_vibrate, CFSTR("vibrates"));
  v9 = (id)objc_msgSend(v4, "appendBool:withName:", self->_jiggleLock, CFSTR("jiggleLock"));
  objc_msgSend(v4, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  _BOOL8 jiggleLock;
  id v11;
  id v12;
  _BOOL8 vibrate;
  id v14;
  id v15;
  uint64_t showPasscode;
  id v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self->_result;
  v7 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __36__SBAuthenticationFeedback_isEqual___block_invoke;
  v29[3] = &unk_1E8EA3AB0;
  v8 = v4;
  v30 = v8;
  v9 = (id)objc_msgSend(v5, "appendInteger:counterpart:", v6, v29);
  jiggleLock = self->_jiggleLock;
  v27[0] = v7;
  v27[1] = 3221225472;
  v27[2] = __36__SBAuthenticationFeedback_isEqual___block_invoke_2;
  v27[3] = &unk_1E8EA3E78;
  v11 = v8;
  v28 = v11;
  v12 = (id)objc_msgSend(v5, "appendBool:counterpart:", jiggleLock, v27);
  vibrate = self->_vibrate;
  v25[0] = v7;
  v25[1] = 3221225472;
  v25[2] = __36__SBAuthenticationFeedback_isEqual___block_invoke_3;
  v25[3] = &unk_1E8EA3E78;
  v14 = v11;
  v26 = v14;
  v15 = (id)objc_msgSend(v5, "appendBool:counterpart:", vibrate, v25);
  showPasscode = self->_showPasscode;
  v20 = v7;
  v21 = 3221225472;
  v22 = __36__SBAuthenticationFeedback_isEqual___block_invoke_4;
  v23 = &unk_1E8EA3E78;
  v24 = v14;
  v17 = v14;
  v18 = (id)objc_msgSend(v5, "appendBool:counterpart:", showPasscode, &v20);
  LOBYTE(showPasscode) = objc_msgSend(v5, "isEqual", v20, v21, v22, v23);

  return showPasscode;
}

uint64_t __36__SBAuthenticationFeedback_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "result");
}

uint64_t __36__SBAuthenticationFeedback_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "jiggleLock");
}

uint64_t __36__SBAuthenticationFeedback_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "vibrate");
}

uint64_t __36__SBAuthenticationFeedback_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showPasscode");
}

- (unint64_t)hash
{
  unint64_t v3;
  _BOOL4 v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = -[SBAuthenticationFeedback showPasscode](self, "showPasscode");
  if (-[SBAuthenticationFeedback jiggleLock](self, "jiggleLock"))
    v3 |= 4uLL;
  v4 = -[SBAuthenticationFeedback vibrate](self, "vibrate");
  v5 = v3 | 8;
  if (!v4)
    v5 = v3;
  v6 = self->_result;
  v7 = v5 | 0x20;
  if (v6 == 1)
    v5 |= 0x10uLL;
  if (v6)
    return v5;
  else
    return v7;
}

- (unint64_t)result
{
  return self->_result;
}

- (BOOL)showPasscode
{
  return self->_showPasscode;
}

- (BOOL)vibrate
{
  return self->_vibrate;
}

- (BOOL)jiggleLock
{
  return self->_jiggleLock;
}

@end
