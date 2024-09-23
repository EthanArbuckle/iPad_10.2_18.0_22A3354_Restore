@implementation FTMutableQssMessage

- (FTMutableQssMessage)init
{
  FTMutableQssMessage *v2;
  uint64_t v3;
  NSMutableDictionary *storage;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FTMutableQssMessage;
  v2 = -[FTMutableQssMessage init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSMutableDictionary copy](self->super._storage, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (FTErrorMessage)error_message
{
  return (FTErrorMessage *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("error_message"));
}

- (void)setError_message:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (FTDisableSessionLog)disable_session_log
{
  return (FTDisableSessionLog *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("disable_session_log"));
}

- (void)setDisable_session_log:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (int64_t)container_message_type
{
  void *v2;
  int64_t v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("container_message_type"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setContainer_message_type:(int64_t)a3
{
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInteger:", a3);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (FTApgPronGuessMessage)container_messageAsFTApgPronGuessMessage
{
  void *v3;

  if (-[FTMutableQssMessage container_message_type](self, "container_message_type") == 1)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("container_message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTApgPronGuessMessage *)v3;
}

- (void)setContainer_messageAsFTApgPronGuessMessage:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableQssMessage setContainer_message_type:](self, "setContainer_message_type:", 1);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("container_message"));

}

- (FTAsrRecognitionMessage)container_messageAsFTAsrRecognitionMessage
{
  void *v3;

  if (-[FTMutableQssMessage container_message_type](self, "container_message_type") == 2)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("container_message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTAsrRecognitionMessage *)v3;
}

- (void)setContainer_messageAsFTAsrRecognitionMessage:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableQssMessage setContainer_message_type:](self, "setContainer_message_type:", 2);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("container_message"));

}

- (FTAsrErrorBlamerMessage)container_messageAsFTAsrErrorBlamerMessage
{
  void *v3;

  if (-[FTMutableQssMessage container_message_type](self, "container_message_type") == 3)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("container_message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTAsrErrorBlamerMessage *)v3;
}

- (void)setContainer_messageAsFTAsrErrorBlamerMessage:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableQssMessage setContainer_message_type:](self, "setContainer_message_type:", 3);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("container_message"));

}

- (FTAsrItnMessage)container_messageAsFTAsrItnMessage
{
  void *v3;

  if (-[FTMutableQssMessage container_message_type](self, "container_message_type") == 4)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("container_message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTAsrItnMessage *)v3;
}

- (void)setContainer_messageAsFTAsrItnMessage:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableQssMessage setContainer_message_type:](self, "setContainer_message_type:", 4);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("container_message"));

}

- (FTAsrTextNormalizationMessage)container_messageAsFTAsrTextNormalizationMessage
{
  void *v3;

  if (-[FTMutableQssMessage container_message_type](self, "container_message_type") == 5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("container_message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTAsrTextNormalizationMessage *)v3;
}

- (void)setContainer_messageAsFTAsrTextNormalizationMessage:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableQssMessage setContainer_message_type:](self, "setContainer_message_type:", 5);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("container_message"));

}

- (FTAsrPostItnHammerMessage)container_messageAsFTAsrPostItnHammerMessage
{
  void *v3;

  if (-[FTMutableQssMessage container_message_type](self, "container_message_type") == 6)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("container_message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTAsrPostItnHammerMessage *)v3;
}

- (void)setContainer_messageAsFTAsrPostItnHammerMessage:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableQssMessage setContainer_message_type:](self, "setContainer_message_type:", 6);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("container_message"));

}

- (FTAsrKeywordFinderMessage)container_messageAsFTAsrKeywordFinderMessage
{
  void *v3;

  if (-[FTMutableQssMessage container_message_type](self, "container_message_type") == 7)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("container_message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTAsrKeywordFinderMessage *)v3;
}

- (void)setContainer_messageAsFTAsrKeywordFinderMessage:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableQssMessage setContainer_message_type:](self, "setContainer_message_type:", 7);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("container_message"));

}

- (FTAsrCorrectionsValidatorMessage)container_messageAsFTAsrCorrectionsValidatorMessage
{
  void *v3;

  if (-[FTMutableQssMessage container_message_type](self, "container_message_type") == 8)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("container_message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTAsrCorrectionsValidatorMessage *)v3;
}

- (void)setContainer_messageAsFTAsrCorrectionsValidatorMessage:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableQssMessage setContainer_message_type:](self, "setContainer_message_type:", 8);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("container_message"));

}

- (FTAsrGraphemeToPhonemeMessage)container_messageAsFTAsrGraphemeToPhonemeMessage
{
  void *v3;

  if (-[FTMutableQssMessage container_message_type](self, "container_message_type") == 9)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("container_message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTAsrGraphemeToPhonemeMessage *)v3;
}

- (void)setContainer_messageAsFTAsrGraphemeToPhonemeMessage:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableQssMessage setContainer_message_type:](self, "setContainer_message_type:", 9);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("container_message"));

}

- (FTBlazarMultiUserMessage)container_messageAsFTBlazarMultiUserMessage
{
  void *v3;

  if (-[FTMutableQssMessage container_message_type](self, "container_message_type") == 10)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("container_message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTBlazarMultiUserMessage *)v3;
}

- (void)setContainer_messageAsFTBlazarMultiUserMessage:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableQssMessage setContainer_message_type:](self, "setContainer_message_type:", 10);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("container_message"));

}

- (FTBlazarMultilingualMessage)container_messageAsFTBlazarMultilingualMessage
{
  void *v3;

  if (-[FTMutableQssMessage container_message_type](self, "container_message_type") == 11)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("container_message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTBlazarMultilingualMessage *)v3;
}

- (void)setContainer_messageAsFTBlazarMultilingualMessage:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableQssMessage setContainer_message_type:](self, "setContainer_message_type:", 11);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("container_message"));

}

- (FTBlazarSpeechTranslationMessage)container_messageAsFTBlazarSpeechTranslationMessage
{
  void *v3;

  if (-[FTMutableQssMessage container_message_type](self, "container_message_type") == 12)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("container_message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTBlazarSpeechTranslationMessage *)v3;
}

- (void)setContainer_messageAsFTBlazarSpeechTranslationMessage:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableQssMessage setContainer_message_type:](self, "setContainer_message_type:", 12);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("container_message"));

}

- (FTBlazarBatchTranslationMessage)container_messageAsFTBlazarBatchTranslationMessage
{
  void *v3;

  if (-[FTMutableQssMessage container_message_type](self, "container_message_type") == 13)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("container_message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTBlazarBatchTranslationMessage *)v3;
}

- (void)setContainer_messageAsFTBlazarBatchTranslationMessage:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableQssMessage setContainer_message_type:](self, "setContainer_message_type:", 13);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("container_message"));

}

- (FTBlazarTextToSpeechRouterMessage)container_messageAsFTBlazarTextToSpeechRouterMessage
{
  void *v3;

  if (-[FTMutableQssMessage container_message_type](self, "container_message_type") == 14)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("container_message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTBlazarTextToSpeechRouterMessage *)v3;
}

- (void)setContainer_messageAsFTBlazarTextToSpeechRouterMessage:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableQssMessage setContainer_message_type:](self, "setContainer_message_type:", 14);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("container_message"));

}

- (FTBlazarTextToSpeechRouterStreamingMessage)container_messageAsFTBlazarTextToSpeechRouterStreamingMessage
{
  void *v3;

  if (-[FTMutableQssMessage container_message_type](self, "container_message_type") == 15)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("container_message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTBlazarTextToSpeechRouterStreamingMessage *)v3;
}

- (void)setContainer_messageAsFTBlazarTextToSpeechRouterStreamingMessage:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableQssMessage setContainer_message_type:](self, "setContainer_message_type:", 15);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("container_message"));

}

- (FTBlazarServiceDiscoveryMessage)container_messageAsFTBlazarServiceDiscoveryMessage
{
  void *v3;

  if (-[FTMutableQssMessage container_message_type](self, "container_message_type") == 16)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("container_message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTBlazarServiceDiscoveryMessage *)v3;
}

- (void)setContainer_messageAsFTBlazarServiceDiscoveryMessage:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableQssMessage setContainer_message_type:](self, "setContainer_message_type:", 16);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("container_message"));

}

- (FTLmtLmScorerMessage)container_messageAsFTLmtLmScorerMessage
{
  void *v3;

  if (-[FTMutableQssMessage container_message_type](self, "container_message_type") == 17)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("container_message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTLmtLmScorerMessage *)v3;
}

- (void)setContainer_messageAsFTLmtLmScorerMessage:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableQssMessage setContainer_message_type:](self, "setContainer_message_type:", 17);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("container_message"));

}

- (FTNapgCreateLanguageProfileMessage)container_messageAsFTNapgCreateLanguageProfileMessage
{
  void *v3;

  if (-[FTMutableQssMessage container_message_type](self, "container_message_type") == 18)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("container_message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTNapgCreateLanguageProfileMessage *)v3;
}

- (void)setContainer_messageAsFTNapgCreateLanguageProfileMessage:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableQssMessage setContainer_message_type:](self, "setContainer_message_type:", 18);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("container_message"));

}

- (FTMtTranslationMessage)container_messageAsFTMtTranslationMessage
{
  void *v3;

  if (-[FTMutableQssMessage container_message_type](self, "container_message_type") == 19)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("container_message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTMtTranslationMessage *)v3;
}

- (void)setContainer_messageAsFTMtTranslationMessage:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableQssMessage setContainer_message_type:](self, "setContainer_message_type:", 19);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("container_message"));

}

- (FTTtsTextToSpeechMessage)container_messageAsFTTtsTextToSpeechMessage
{
  void *v3;

  if (-[FTMutableQssMessage container_message_type](self, "container_message_type") == 20)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("container_message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTTtsTextToSpeechMessage *)v3;
}

- (void)setContainer_messageAsFTTtsTextToSpeechMessage:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableQssMessage setContainer_message_type:](self, "setContainer_message_type:", 20);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("container_message"));

}

- (FTTtsTextToSpeechStreamingMessage)container_messageAsFTTtsTextToSpeechStreamingMessage
{
  void *v3;

  if (-[FTMutableQssMessage container_message_type](self, "container_message_type") == 21)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("container_message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTTtsTextToSpeechStreamingMessage *)v3;
}

- (void)setContainer_messageAsFTTtsTextToSpeechStreamingMessage:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableQssMessage setContainer_message_type:](self, "setContainer_message_type:", 21);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("container_message"));

}

- (FTTtsTextToSpeechSpeechFeatureMessage)container_messageAsFTTtsTextToSpeechSpeechFeatureMessage
{
  void *v3;

  if (-[FTMutableQssMessage container_message_type](self, "container_message_type") == 22)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("container_message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTTtsTextToSpeechSpeechFeatureMessage *)v3;
}

- (void)setContainer_messageAsFTTtsTextToSpeechSpeechFeatureMessage:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableQssMessage setContainer_message_type:](self, "setContainer_message_type:", 22);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("container_message"));

}

- (FTNlShortcutFuzzyMatchMessage)container_messageAsFTNlShortcutFuzzyMatchMessage
{
  void *v3;

  if (-[FTMutableQssMessage container_message_type](self, "container_message_type") == 23)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("container_message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTNlShortcutFuzzyMatchMessage *)v3;
}

- (void)setContainer_messageAsFTNlShortcutFuzzyMatchMessage:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableQssMessage setContainer_message_type:](self, "setContainer_message_type:", 23);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("container_message"));

}

- (FTSlsLanguageDetectionMessage)container_messageAsFTSlsLanguageDetectionMessage
{
  void *v3;

  if (-[FTMutableQssMessage container_message_type](self, "container_message_type") == 24)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("container_message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTSlsLanguageDetectionMessage *)v3;
}

- (void)setContainer_messageAsFTSlsLanguageDetectionMessage:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableQssMessage setContainer_message_type:](self, "setContainer_message_type:", 24);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("container_message"));

}

- (void)setContainer_message:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableQssMessage setContainer_message_type:](self, "setContainer_message_type:", objc_msgSend((id)objc_opt_class(), "container_message_typeForObject:", v5));
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("container_message"));

}

+ (Class)container_message_mutableClassForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x17)
    return (Class)0;
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

+ (int64_t)container_message_typeForMutableObject:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 23;
  }
  else if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()))
  {
    v4 = 24;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (int64_t)container_message_typeForObject:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0
    || (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 24;
  }
  else if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()))
  {
    v4 = 24;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
