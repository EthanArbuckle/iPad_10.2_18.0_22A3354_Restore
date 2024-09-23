@implementation ICMentionsController

void __66__ICMentionsController_UI__registerForContactsChangedNotification__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  performBlockOnMainThread();
  objc_destroyWeak(&v4);

}

void __66__ICMentionsController_UI__registerForContactsChangedNotification__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateNoteParticipants");

}

uint64_t __67__ICMentionsController_UI__rangeOfUnconfirmedMentionInTextStorage___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v5;

  if (a2)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
    *(_QWORD *)(v5 + 32) = a3;
    *(_QWORD *)(v5 + 40) = a4;
    *a5 = 1;
  }
  return result;
}

void __71__ICMentionsController_UI__sendPendingNotificationsAfterDelay_forNote___block_invoke(uint64_t a1)
{
  id v2;

  +[ICMentionNotificationController sharedController](ICMentionNotificationController, "sharedController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendPendingNotificationsCreatedBefore:", *(_QWORD *)(a1 + 32));

}

void __60__ICMentionsController_UI__hasMentionInTextStorage_inRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v7;

  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D63D48]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
}

void __60__ICMentionsController_UI__hasMentionInTextStorage_inRange___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;

  v7 = a2;
  objc_opt_class();
  ICDynamicCast();
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v12;
  if (v12)
  {
    objc_msgSend(v12, "attachment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "typeUTI");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D63880]);

    if (v11)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      *a5 = 1;
    }

    v8 = v12;
  }

}

@end
