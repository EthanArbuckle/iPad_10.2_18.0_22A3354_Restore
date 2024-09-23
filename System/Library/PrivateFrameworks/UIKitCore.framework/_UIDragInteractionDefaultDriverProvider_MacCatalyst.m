@implementation _UIDragInteractionDefaultDriverProvider_MacCatalyst

- (id)createDefaultDriversForDragInteraction:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "setWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
