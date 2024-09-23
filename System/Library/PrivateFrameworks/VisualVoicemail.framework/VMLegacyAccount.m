@implementation VMLegacyAccount

- (VMLegacyAccount)init
{
  VMLegacyAccount *v2;
  VMVoicemailManager *v3;
  VMVoicemailManager *voicemailManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VMLegacyAccount;
  v2 = -[VMLegacyAccount init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(VMVoicemailManager);
    voicemailManager = v2->_voicemailManager;
    v2->_voicemailManager = v3;

  }
  return v2;
}

- (unsigned)unreadCount
{
  void *v2;
  unsigned int v3;

  -[VMLegacyAccount voicemailManager](self, "voicemailManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countOfVoicemailsPassingTest:", &__block_literal_global_5);

  return v3;
}

uint64_t __30__VMLegacyAccount_unreadCount__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isRead") ^ 1;
}

- (unsigned)recentUnreadCount
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  _QWORD v8[5];

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v5 = v4 + -86400.0;

  -[VMLegacyAccount voicemailManager](self, "voicemailManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __36__VMLegacyAccount_recentUnreadCount__block_invoke;
  v8[3] = &__block_descriptor_40_e21_B16__0__VMVoicemail_8l;
  *(double *)&v8[4] = v5;
  LODWORD(v3) = objc_msgSend(v6, "countOfVoicemailsPassingTest:", v8);

  return v3;
}

uint64_t __36__VMLegacyAccount_recentUnreadCount__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;

  v3 = a2;
  objc_msgSend(v3, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v6 = v5;
  v7 = *(double *)(a1 + 32);

  if (!objc_msgSend(v3, "isDataAvailable")
    || (objc_msgSend(v3, "isRead") & 1) != 0
    || (objc_msgSend(v3, "isBlocked") & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v8 = (v6 > v7) & ~objc_msgSend(v3, "isDeleted");
  }

  return v8;
}

- (BOOL)isMessageWaiting
{
  void *v2;
  char v3;

  -[VMLegacyAccount voicemailManager](self, "voicemailManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMessageWaiting");

  return v3;
}

- (BOOL)isOnline
{
  void *v2;
  char v3;

  -[VMLegacyAccount voicemailManager](self, "voicemailManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isOnline");

  return v3;
}

- (BOOL)isOfflineDueToRoaming
{
  return 0;
}

- (int)mailboxUsage
{
  return 0;
}

- (BOOL)greetingAvailable
{
  return 0;
}

- (BOOL)isSubscribed
{
  void *v2;
  char v3;

  -[VMLegacyAccount voicemailManager](self, "voicemailManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSubscribed");

  return v3;
}

- (id)voicemailWithIdentifier:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[VMLegacyAccount voicemailManager](self, "voicemailManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "voicemailWithIdentifier:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)moveVoicemailToTrash:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = a3;
  -[VMLegacyAccount voicemailManager](self, "voicemailManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "trashVoicemail:", v6);

}

- (void)moveVoicemailFromTrash:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = a3;
  -[VMLegacyAccount voicemailManager](self, "voicemailManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "removeVoicemailFromTrash:", v6);

}

- (id)allVoicemailsWithFlags:(unint64_t)a3 withoutFlags:(unint64_t)a4
{
  void *v6;
  void *v7;
  _QWORD v9[6];

  -[VMLegacyAccount voicemailManager](self, "voicemailManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __55__VMLegacyAccount_allVoicemailsWithFlags_withoutFlags___block_invoke;
  v9[3] = &__block_descriptor_48_e21_B16__0__VMVoicemail_8l;
  v9[4] = a3;
  v9[5] = a4;
  objc_msgSend(v6, "voicemailsPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __55__VMLegacyAccount_allVoicemailsWithFlags_withoutFlags___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (objc_msgSend(v3, "hasFlags:", *(_QWORD *)(a1 + 32)))
    v4 = objc_msgSend(v3, "doesNotHaveFlags:", *(_QWORD *)(a1 + 40));
  else
    v4 = 0;

  return v4;
}

- (VMVoicemailManager)voicemailManager
{
  return self->_voicemailManager;
}

- (void)setVoicemailManager:(id)a3
{
  objc_storeStrong((id *)&self->_voicemailManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voicemailManager, 0);
}

@end
