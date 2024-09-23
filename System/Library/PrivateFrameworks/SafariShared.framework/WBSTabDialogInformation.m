@implementation WBSTabDialogInformation

- (WBSTabDialogInformation)initWithPresentationBlock:(id)a3 dismissalBlock:(id)a4 blocksWebProcessUntilDismissed:(BOOL)a5
{
  id v8;
  id v9;
  WBSTabDialogInformation *v10;
  uint64_t v11;
  id dismissalBlock;
  uint64_t v13;
  id presentationBlock;
  NSArray *cancellationExemptions;
  WBSTabDialogInformation *v16;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)WBSTabDialogInformation;
  v10 = -[WBSTabDialogInformation init](&v18, sel_init);
  if (v10)
  {
    v11 = MEMORY[0x1A8599ED0](v9);
    dismissalBlock = v10->_dismissalBlock;
    v10->_dismissalBlock = (id)v11;

    v13 = MEMORY[0x1A8599ED0](v8);
    presentationBlock = v10->_presentationBlock;
    v10->_presentationBlock = (id)v13;

    v10->_blockingWebProcess = a5;
    cancellationExemptions = v10->_cancellationExemptions;
    v10->_cancellationExemptions = (NSArray *)MEMORY[0x1E0C9AA60];

    v16 = v10;
  }

  return v10;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  uint64_t v8;
  unint64_t tabID;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = CFSTR("YES");
  if (self->_presented)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  if (self->_dismissed)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (!self->_blockingWebProcess)
    v5 = CFSTR("NO");
  v8 = *(_QWORD *)&self->_slot.webProcessID;
  tabID = self->_slot.tabID;
  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = v5;
  v12 = v7;
  v13 = v6;
  objc_msgSend(v10, "stringWithFormat:", CFSTR("{pid:%d, tab:0x%lx}"), v8, tabID);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p; presented = %@, dismissed = %@, blockingWebProcess = %@, slot = %@>"),
    v4,
    self,
    v13,
    v12,
    v11,
    v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)presentIfNeeded
{
  uint64_t v3;

  if (!self->_presented && !self->_isInvokingPresentationBlock)
  {
    self->_isInvokingPresentationBlock = 1;
    v3 = (*((uint64_t (**)(void))self->_presentationBlock + 2))();
    self->_isInvokingPresentationBlock = 0;
    if (!v3)
      self->_presented = 1;
  }
}

- (void)dismissWithResponse:(id)a3
{
  if (!self->_dismissed)
  {
    self->_dismissed = 1;
    (*((void (**)(void))self->_dismissalBlock + 2))();
    self->_blockingWebProcess = 0;
  }
}

- (BOOL)isExemptFromCancellationInContext:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_cancellationExemptions;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "isExemptFromCancellationInContext:", v4, (_QWORD)v10) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- ($74EE3C8A9A83D7DA9DE4D87A9C9037E2)slot
{
  unint64_t tabID;
  uint64_t v3;
  $74EE3C8A9A83D7DA9DE4D87A9C9037E2 result;

  tabID = self->_slot.tabID;
  v3 = *(_QWORD *)&self->_slot.webProcessID;
  result.var1 = tabID;
  result.var0 = v3;
  return result;
}

- (void)setSlot:(id)a3
{
  self->_slot = ($84CF90F7BD3801B8A4587140E8FC5183)a3;
}

- (NSArray)cancellationExemptions
{
  return self->_cancellationExemptions;
}

- (void)setCancellationExemptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isBlockingWebProcess
{
  return self->_blockingWebProcess;
}

- (BOOL)isDismissed
{
  return self->_dismissed;
}

- (BOOL)isPresented
{
  return self->_presented;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancellationExemptions, 0);
  objc_storeStrong(&self->_presentationBlock, 0);
  objc_storeStrong(&self->_dismissalBlock, 0);
}

@end
