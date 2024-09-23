@implementation _PASXPCUtilities

+ (void)runWithExceptionBarrier:(id)a3
{
  void (**v3)(_QWORD);

  v3 = (void (**)(_QWORD))a3;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");

  v3[2](v3);
}

@end
