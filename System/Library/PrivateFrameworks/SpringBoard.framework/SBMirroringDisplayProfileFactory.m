@implementation SBMirroringDisplayProfileFactory

- (id)createProfile
{
  return (id)objc_msgSend(MEMORY[0x1E0D97610], "mirroringMainDisplayProfileWithDelegate:", self);
}

- (BOOL)displayProfile:(id)a3 shouldConnectToDisplay:(id)a4
{
  void *v4;
  char v5;

  objc_msgSend(a4, "identity", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isRootIdentity"))
  {
    if ((objc_msgSend(v4, "isAirPlayDisplay") & 1) != 0
      || (objc_msgSend(v4, "isRestrictedAirPlayDisplay") & 1) != 0
      || (objc_msgSend(v4, "isiPodOnlyDisplay") & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      v5 = objc_msgSend(v4, "isMusicOnlyDisplay");
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
