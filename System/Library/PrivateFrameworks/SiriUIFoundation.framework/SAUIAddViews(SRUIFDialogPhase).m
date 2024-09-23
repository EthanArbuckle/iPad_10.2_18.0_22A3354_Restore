@implementation SAUIAddViews(SRUIFDialogPhase)

- (id)sruif_dialogPhase
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "propertyForKeyWithoutDeserializing:", *MEMORY[0x24BE82658]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[SRUIFDialogPhase dialogPhaseForAceDialogPhase:](SRUIFDialogPhase, "dialogPhaseForAceDialogPhase:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
