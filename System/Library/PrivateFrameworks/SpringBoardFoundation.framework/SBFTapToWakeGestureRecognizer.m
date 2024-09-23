@implementation SBFTapToWakeGestureRecognizer

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a4, "_hidEvent", a3);
  v6 = -[SBFTapToWakeGestureRecognizer _isTapEvent:](self, "_isTapEvent:", v5);
  SBLogScreenWake();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem(self, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 1024;
    v12 = v6;
    _os_log_impl(&dword_18AB69000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: isTapEvent=%{BOOL}u", (uint8_t *)&v9, 0x12u);

  }
  if (v6)
    -[SBFTapToWakeGestureRecognizer _succesfullyRecognizeFromEvent:](self, "_succesfullyRecognizeFromEvent:", v5);
}

- (void)_succesfullyRecognizeFromEvent:(__IOHIDEvent *)a3
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[SBWakeLogger sharedInstance](SBWakeLogger, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wakeMayBegin:withTimestamp:", 1, IOHIDEventGetTimeStamp());

  v5 = -[SBFTapToWakeGestureRecognizer state](self, "state");
  SBLogScreenWake();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem(self, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2048;
    v11 = v5;
    _os_log_impl(&dword_18AB69000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: state=%ld", (uint8_t *)&v8, 0x16u);

  }
  if (!v5)
    -[SBFTapToWakeGestureRecognizer setState:](self, "setState:", 3);
}

- (BOOL)_isTapEvent:(__IOHIDEvent *)a3
{
  char v3;
  _QWORD v5[3];
  char v6;
  _QWORD v7[3];
  char v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  v8 = 0;
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  v6 = 0;
  BKSHIDEventMatchingPredicate();
  v3 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(v5, 8);
  _Block_object_dispose(v7, 8);
  _Block_object_dispose(&v9, 8);
  return v3;
}

BOOL __45__SBFTapToWakeGestureRecognizer__isTapEvent___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  char v7;

  if (IOHIDEventGetType() != 11)
    return 0;
  if ((~IOHIDEventGetIntegerValue() & 0x20002) == 0)
  {
    if (a3)
      v5 = a1[5];
    else
      v5 = a1[4];
    *(_BYTE *)(*(_QWORD *)(v5 + 8) + 24) = 1;
  }
  v7 = *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24);
  if (v7)
    v7 = *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) != 0;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v7;
  return *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) != 0;
}

@end
