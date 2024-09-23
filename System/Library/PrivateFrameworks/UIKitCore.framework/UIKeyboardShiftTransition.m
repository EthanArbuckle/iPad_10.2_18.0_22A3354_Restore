@implementation UIKeyboardShiftTransition

- (double)nonInteractiveDuration
{
  return 0.05;
}

- (void)runNonInteractivelyWithCompletion:(id)a3
{
  id v4;
  double v5;
  double v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[5];

  v4 = a3;
  -[UIKeyboardShiftTransition nonInteractiveDuration](self, "nonInteractiveDuration");
  v6 = v5;
  v9 = v4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__UIKeyboardShiftTransition_runNonInteractivelyWithCompletion___block_invoke;
  v10[3] = &unk_1E16B1B28;
  v10[4] = self;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__UIKeyboardShiftTransition_runNonInteractivelyWithCompletion___block_invoke_2;
  v8[3] = &unk_1E16B1BA0;
  v7 = v4;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 50331712, v10, v8, v6, 0.0);

}

uint64_t __63__UIKeyboardShiftTransition_runNonInteractivelyWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setAlpha:", 0.0);
}

uint64_t __63__UIKeyboardShiftTransition_runNonInteractivelyWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
