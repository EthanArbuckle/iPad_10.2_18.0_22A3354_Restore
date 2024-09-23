@implementation FBSScene(SBContinuitySessionSceneParticipant)

- (id)continuitySessionSceneParticipant
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  char v6;
  void *v7;

  objc_msgSend(a1, "continuitySessionParticipantClientComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(a1, "settings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) == 0)
    {
      v7 = 0;
      goto LABEL_7;
    }
    objc_msgSend(a1, "settings");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v4;
LABEL_7:

  return v7;
}

@end
