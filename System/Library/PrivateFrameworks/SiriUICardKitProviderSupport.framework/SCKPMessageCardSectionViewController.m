@implementation SCKPMessageCardSectionViewController

+ (void)initialize
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___SCKPMessageCardSectionViewController;
  objc_msgSendSuper2(&v2, sel_initialize);
  CRLogInitIfNeeded();
}

- (SCKPMessageCardSectionViewController)initWithMessageCardSection:(id)a3 interaction:(id)a4
{
  id v7;
  id v8;
  SCKPMessageCardSectionViewController *v9;
  SCKPMessageCardSectionViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SCKPMessageCardSectionViewController;
  v9 = -[SCKPMessageCardSectionViewController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cardSection, a3);
    objc_storeStrong((id *)&v10->_interaction, a4);
  }

  return v10;
}

- (void)loadView
{
  SCKPMessageCardSectionView *v3;

  v3 = -[SCKPMessageCardSectionView initWithMessageCardSection:delegate:]([SCKPMessageCardSectionView alloc], "initWithMessageCardSection:delegate:", self->_cardSection, self);
  -[SCKPMessageCardSectionViewController setView:](self, "setView:", v3);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)desiresInteractivity:(id)a3
{
  if (a3)
    (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
}

- (void)messageCardSectionViewBeganEditing:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", a3);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[SFMessageCardSection messageText](self->_cardSection, "messageText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v6, CFSTR("oldTextLength"));

  -[SCKPMessageCardSectionViewController textInputMode](self, "textInputMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "primaryLanguage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v8, CFSTR("keyboardLocale"));

  objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logEventWithType:context:", 5701, v12);

  -[SCKPMessageCardSectionViewController cardSectionViewControllingDelegate](self, "cardSectionViewControllingDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x24BE154D0]);
  objc_msgSend(v10, "performCommand:forViewController:", v11, self);

}

- (void)messageCardSectionViewFinishedEditing:(id)a3
{
  dispatch_time_t v4;
  _QWORD block[5];

  v4 = dispatch_time(0, 200000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78__SCKPMessageCardSectionViewController_messageCardSectionViewFinishedEditing___block_invoke;
  block[3] = &unk_24E0490C8;
  block[4] = self;
  dispatch_after(v4, MEMORY[0x24BDAC9B8], block);
}

void __78__SCKPMessageCardSectionViewController_messageCardSectionViewFinishedEditing___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "cardSectionViewControllingDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc_init(MEMORY[0x24BE154E0]);
  objc_msgSend(v3, "performCommand:forViewController:", v2, *(_QWORD *)(a1 + 32));

}

- (void)messageCardSectionContentUpdated:(id)a3
{
  -[SCKPMessageCardSectionViewController messageContentUpdatedAndInitiatedByNewRequest:](self, "messageContentUpdatedAndInitiatedByNewRequest:", 0);
}

- (void)messageContentUpdatedAndInitiatedByNewRequest:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[3];
  _QWORD v25[4];

  v3 = a3;
  v25[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD16E0];
  -[SCKPMessageCardSectionViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayedText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v8, "length"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("newTextLength"));

  v10 = (void *)MEMORY[0x24BDD16E0];
  -[SFMessageCardSection messageText](self->_cardSection, "messageText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "length"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("oldTextLength"));

  -[SCKPMessageCardSectionViewController textInputMode](self, "textInputMode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "primaryLanguage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("keyboardLocale"));

  objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "logEventWithType:context:", 5702, v5);

  v16 = objc_alloc_init(MEMORY[0x24BE154E8]);
  objc_msgSend(v16, "setInvocationIdentifier:", *MEMORY[0x24BE99218]);
  v24[0] = *MEMORY[0x24BE99210];
  -[SCKPMessageCardSectionViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "displayedText");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v18;
  v24[1] = CFSTR("contentUpdateInitiatedByNewRequest");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v19;
  v24[2] = CFSTR("keyboardLocale");
  -[SCKPMessageCardSectionViewController textInputMode](self, "textInputMode");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "primaryLanguage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v21;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setUserInfo:", v22);

  -[SCKPMessageCardSectionViewController cardSectionViewControllingDelegate](self, "cardSectionViewControllingDelegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "performCommand:forViewController:", v16, self);

}

- (void)messageCardSectionSendButtonTapped:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDBCED8];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  -[SCKPMessageCardSectionViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v9, "length"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("newTextLength"));

  v11 = (void *)MEMORY[0x24BDD16E0];
  -[SFMessageCardSection messageText](self->_cardSection, "messageText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "length"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("oldTextLength"));

  -[SCKPMessageCardSectionViewController textInputMode](self, "textInputMode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "primaryLanguage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("keyboardLocale"));

  objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "logEventWithType:context:", 5703, v6);

  v17 = objc_alloc_init(MEMORY[0x24BE154E8]);
  objc_msgSend(v17, "setInvocationIdentifier:", *MEMORY[0x24BE99228]);
  v23[0] = *MEMORY[0x24BE99220];
  objc_msgSend(v5, "displayedText");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v23[1] = CFSTR("keyboardLocale");
  v24[0] = v18;
  -[SCKPMessageCardSectionViewController textInputMode](self, "textInputMode");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "primaryLanguage");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setUserInfo:", v21);

  -[SCKPMessageCardSectionViewController cardSectionViewControllingDelegate](self, "cardSectionViewControllingDelegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "performCommand:forViewController:", v17, self);

}

- (void)messageCardSectionPlayButtonTapped:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (!self->_player)
  {
    -[SCKPMessageCardSectionViewController createAudioPlayer](self, "createAudioPlayer");
    v4 = v5;
  }
  if (objc_msgSend(v4, "playButtonState"))
  {
    if (objc_msgSend(v5, "playButtonState") == 1)
      -[SCKPMessageCardSectionViewController pauseAudioPlayback](self, "pauseAudioPlayback");
  }
  else
  {
    -[SCKPMessageCardSectionViewController setupPlaybackSessionOptions](self, "setupPlaybackSessionOptions");
    -[SCKPMessageCardSectionViewController beginAudioPlayback](self, "beginAudioPlayback");
  }

}

- (void)messageCardSectionAttachmentTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  -[SFMessageCardSection commands](self->_cardSection, "commands", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SCKPMessageCardSectionViewController cardSectionViewControllingDelegate](self, "cardSectionViewControllingDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "performCommand:forViewController:", v5, self);

  }
  else
  {
    v7 = *MEMORY[0x24BE15490];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_ERROR))
      -[SCKPMessageCardSectionViewController messageCardSectionAttachmentTapped:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
  }

}

- (void)createAudioPlayer
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_21C485000, v0, v1, "Failed to create AVAudioPlayer: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setupPlaybackSessionOptions
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_21C485000, v0, v1, "Failed setting the session category: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)beginAudioPlayback
{
  OUTLINED_FUNCTION_1_0(&dword_21C485000, a1, a3, "Player failed to begin playback", a5, a6, a7, a8, 0);
}

- (void)pauseAudioPlayback
{
  id v3;

  -[AVAudioPlayer pause](self->_player, "pause");
  -[SCKPMessageCardSectionViewController view](self, "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPlayButtonState:", 0);

}

- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4
{
  id v5;
  void *v6;

  v5 = a3;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_ERROR))
    -[SCKPMessageCardSectionViewController audioPlayerDidFinishPlaying:successfully:].cold.1();
  -[SCKPMessageCardSectionViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPlayButtonState:", 0);

}

- (void)audioPlayerDecodeErrorDidOccur:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_ERROR))
    -[SCKPMessageCardSectionViewController audioPlayerDecodeErrorDidOccur:error:].cold.1();
  -[SCKPMessageCardSectionViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPlayButtonState:", 0);

}

- (void)cardEventDidOccur:(unint64_t)a3 withIdentifier:(id)a4 userInfo:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  SCKPMessageCardSectionViewController *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  id v17;

  v17 = a4;
  v8 = a5;
  v9 = v8;
  if (a3 != 7 || !v8)
  {
    if (a3 == 9)
    {
      -[SCKPMessageCardSectionViewController view](self, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "keyboardIsVisible");

      if (!v15)
        goto LABEL_12;
      -[SCKPMessageCardSectionViewController view](self, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "dismissKeyboard");

      v12 = self;
      v13 = 1;
    }
    else
    {
      if (a3 != 8)
        goto LABEL_12;
      -[SCKPMessageCardSectionViewController view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dismissKeyboard");

      v12 = self;
      v13 = 0;
    }
    -[SCKPMessageCardSectionViewController messageContentUpdatedAndInitiatedByNewRequest:](v12, "messageContentUpdatedAndInitiatedByNewRequest:", v13);
    goto LABEL_12;
  }
  objc_msgSend(v8, "objectForKey:", CFSTR("UpdatedRecognition"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SCKPMessageCardSectionViewController _asrUpdated:](self, "_asrUpdated:", v10);

LABEL_12:
}

- (void)_asrUpdated:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[INInteraction intent](self->_interaction, "intent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[INInteraction intent](self->_interaction, "intent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "content");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (v9)
    {
      v10 = *MEMORY[0x24BE15490];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO))
      {
LABEL_18:

        goto LABEL_19;
      }
      LOWORD(v17) = 0;
      v11 = "Not updating ASR because the intent has content";
LABEL_5:
      _os_log_impl(&dword_21C485000, v10, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v17, 2u);
      goto LABEL_18;
    }
    objc_msgSend(v7, "recipients");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (!v13)
    {
      v10 = *MEMORY[0x24BE15490];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO))
        goto LABEL_18;
      LOWORD(v17) = 0;
      v11 = "Not updating ASR because we dont have a recipient";
      goto LABEL_5;
    }
    objc_msgSend(v7, "attachments");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (v15)
    {
      v10 = *MEMORY[0x24BE15490];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO))
        goto LABEL_18;
      LOWORD(v17) = 0;
      v11 = "Not updating ASR because the message has an attachment";
      goto LABEL_5;
    }

  }
  if (v4 && objc_msgSend(v4, "length"))
  {
    v16 = *MEMORY[0x24BE15490];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO))
    {
      v17 = 138412290;
      v18 = v4;
      _os_log_impl(&dword_21C485000, v16, OS_LOG_TYPE_INFO, "Updating message field with ASR recognition : %@", (uint8_t *)&v17, 0xCu);
    }
    -[SCKPMessageCardSectionViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMessageContents:", v4);
    goto LABEL_18;
  }
LABEL_19:

}

- (CRKCardSectionViewControllingDelegate)cardSectionViewControllingDelegate
{
  return (CRKCardSectionViewControllingDelegate *)objc_loadWeakRetained((id *)&self->cardSectionViewControllingDelegate);
}

- (void)setCardSectionViewControllingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->cardSectionViewControllingDelegate, a3);
}

- (SFMessageCardSection)cardSection
{
  return (SFMessageCardSection *)objc_getProperty(self, a2, 976, 1);
}

- (INInteraction)interaction
{
  return (INInteraction *)objc_getProperty(self, a2, 984, 1);
}

- (AVAudioPlayer)player
{
  return (AVAudioPlayer *)objc_getProperty(self, a2, 992, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_interaction, 0);
  objc_storeStrong((id *)&self->_cardSection, 0);
  objc_destroyWeak((id *)&self->cardSectionViewControllingDelegate);
}

- (void)messageCardSectionAttachmentTapped:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_21C485000, a1, a3, "#messages: Attempting to punchout with no referential punchout command.", a5, a6, a7, a8, 0);
}

- (void)audioPlayerDidFinishPlaying:successfully:.cold.1()
{
  int v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  v3 = 1024;
  v4 = v0;
  _os_log_error_impl(&dword_21C485000, v1, OS_LOG_TYPE_ERROR, "Audio player: %@ finished playing with success: %d", v2, 0x12u);
  OUTLINED_FUNCTION_1();
}

- (void)audioPlayerDecodeErrorDidOccur:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_21C485000, v1, OS_LOG_TYPE_ERROR, "Audio player: %@ encountered error: %@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end
