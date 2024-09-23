@implementation PSTouchIDPINController

- (id)pinInstructionsPrompt
{
  void *v3;
  objc_super v5;

  if (-[DevicePINController mode](self, "mode")
    || *(_DWORD *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE75670]) != 1)
  {
    v5.receiver = self;
    v5.super_class = (Class)PSTouchIDPINController;
    -[DevicePINController pinInstructionsPrompt](&v5, sel_pinInstructionsPrompt);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PSLocalizableMesaStringForKey();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

@end
