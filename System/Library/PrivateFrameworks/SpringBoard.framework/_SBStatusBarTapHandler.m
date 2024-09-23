@implementation _SBStatusBarTapHandler

- (BOOL)handleTap
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  if (a1)
  {
    v2 = (void *)a1[1];
    if (v2)
    {
      SBWorkspaceActivateApplicationFromURL(v2, 0, 0);
    }
    else
    {
      v3 = a1[2];
      if (v3)
      {
        (*(void (**)(void))(v3 + 16))();
      }
      else
      {
        v4 = (void *)a1[3];
        if (v4)
        {
          objc_msgSend(v4, "bundleIdentifier");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          SBWorkspaceApplicationForIdentifier(v5);
          v6 = (void *)objc_claimAutoreleasedReturnValue();

          if (v6)
          {
            +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            v10[0] = MEMORY[0x1E0C809B0];
            v10[1] = 3221225472;
            v10[2] = __35___SBStatusBarTapHandler_handleTap__block_invoke;
            v10[3] = &unk_1E8EA0260;
            v10[4] = a1;
            v11 = v6;
            objc_msgSend(v7, "requestTransitionWithBuilder:", v10);

          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel_handleTap, a1, CFSTR("SBStatusBarTapManager.m"), 433, CFSTR("not valid to have a tap handler without the ability to handle anything!"));

        }
      }
    }
  }
  return a1 != 0;
}

- (BOOL)canRequestUnlock
{
  if (result)
    return *(_QWORD *)(result + 24) != 0;
  return result;
}

- (_QWORD)initWithApplicationDestination:(_QWORD *)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)_SBStatusBarTapHandler;
    a1 = objc_msgSendSuper2(&v7, sel_init);
    if (a1)
    {
      v4 = objc_msgSend(v3, "copy");
      v5 = (void *)a1[3];
      a1[3] = v4;

    }
  }

  return a1;
}

- (_QWORD)initWithURL:(_QWORD *)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)_SBStatusBarTapHandler;
    a1 = objc_msgSendSuper2(&v7, sel_init);
    if (a1)
    {
      v4 = objc_msgSend(v3, "copy");
      v5 = (void *)a1[1];
      a1[1] = v4;

    }
  }

  return a1;
}

- (_QWORD)initWithBlock:(_QWORD *)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)_SBStatusBarTapHandler;
    a1 = objc_msgSendSuper2(&v7, sel_init);
    if (a1)
    {
      v4 = objc_msgSend(v3, "copy");
      v5 = (void *)a1[2];
      a1[2] = v4;

    }
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appDestination, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
