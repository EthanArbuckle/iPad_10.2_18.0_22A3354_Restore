@implementation TIKeyboardInputManager_mr

- (void)initImplementation
{
  _QWORD *v2;

  v2 = *(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BEB5498]);
  if (!v2)
  {
    v2 = (_QWORD *)operator new();
    bzero(v2, 0x2C8uLL);
    TIInputManager::TIInputManager((TIInputManager *)v2);
    *v2 = &unk_250129B20;
  }
  return v2;
}

@end
