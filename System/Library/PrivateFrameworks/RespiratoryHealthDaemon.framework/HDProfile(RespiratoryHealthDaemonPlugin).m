@implementation HDProfile(RespiratoryHealthDaemonPlugin)

- (id)respiratoryExtension
{
  void *v4;
  void *v6;

  objc_msgSend(a1, "profileExtensionWithIdentifier:", *MEMORY[0x24BE808A8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDProfile+RespiratoryHealthDaemonPlugin.m"), 20, CFSTR("Unexpected class for respiratory health profile extension: %@"), objc_opt_class());

    }
  }
  return v4;
}

@end
