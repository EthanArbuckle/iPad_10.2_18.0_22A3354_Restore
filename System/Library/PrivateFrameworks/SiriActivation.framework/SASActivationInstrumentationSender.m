@implementation SASActivationInstrumentationSender

- (SASActivationInstrumentationSender)initWithAnalyticsStream:(id)a3
{
  id v5;
  SASActivationInstrumentationSender *v6;
  SASActivationInstrumentationSender *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SASActivationInstrumentationSender;
  v6 = -[SASActivationInstrumentationSender init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_analyticsStream, a3);

  return v7;
}

- (void)instrumentButtonInteractionType:(int)a3 buttonIdentifier:(id)a4 activationEventIdentifier:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  NSObject *v14;
  SASActivationInstrumentationMessage *v15;
  int v16;
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v6 = *(_QWORD *)&a3;
  v24 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0D99160]);
  objc_msgSend(v10, "setButtonInteractionType:", v6);
  objc_msgSend(v10, "setButtonName:", v8);
  -[SASActivationInstrumentationSender _clientEventWithActivationEventIdentifier:](self, "_clientEventWithActivationEventIdentifier:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setButtonInteractionDetected:", v10);
  v12 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    if ((v6 - 1) > 2)
      v13 = CFSTR("BUTTONINTERACTIONTYPE_UNKNOWN");
    else
      v13 = off_1E91FBDF8[(int)v6 - 1];
    v16 = 136315906;
    v17 = "-[SASActivationInstrumentationSender instrumentButtonInteractionType:buttonIdentifier:activationEventIdentifier:]";
    v18 = 2112;
    v19 = v8;
    v20 = 2112;
    v21 = v13;
    v22 = 2112;
    v23 = v9;
    v14 = v12;
    _os_log_impl(&dword_1D132F000, v14, OS_LOG_TYPE_DEFAULT, "%s #instrumentation %@, %@, identifier: %@", (uint8_t *)&v16, 0x2Au);

  }
  v15 = -[SASActivationInstrumentationMessage initWithEvent:activationEventIdentifier:machAbsoluteTime:]([SASActivationInstrumentationMessage alloc], "initWithEvent:activationEventIdentifier:machAbsoluteTime:", v11, v9, mach_absolute_time());
  -[SASActivationInstrumentationSender instrumentActivationMessage:](self, "instrumentActivationMessage:", v15);

}

- (void)instrumentTurnActivatedWithTurnId:(id)a3 activationEventIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  SASActivationInstrumentationMessage *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0D99178]);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A500]), "initWithNSUUID:", v6);
  objc_msgSend(v8, "setTurnId:", v9);

  -[SASActivationInstrumentationSender _clientEventWithActivationEventIdentifier:](self, "_clientEventWithActivationEventIdentifier:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTurnActivated:", v8);
  v11 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315650;
    v14 = "-[SASActivationInstrumentationSender instrumentTurnActivatedWithTurnId:activationEventIdentifier:]";
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_1D132F000, v11, OS_LOG_TYPE_DEFAULT, "%s #instrumentation Turn Id: %@, activationIdentifier: %@", (uint8_t *)&v13, 0x20u);
  }
  v12 = -[SASActivationInstrumentationMessage initWithEvent:activationEventIdentifier:machAbsoluteTime:]([SASActivationInstrumentationMessage alloc], "initWithEvent:activationEventIdentifier:machAbsoluteTime:", v10, v7, mach_absolute_time());
  -[SASActivationInstrumentationSender instrumentActivationMessage:](self, "instrumentActivationMessage:", v12);

}

- (void)instrumentRequestLinkToUEIWithTurnId:(id)a3 activationEventIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0D9A498]);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A500]), "initWithNSUUID:", v7);
  objc_msgSend(v8, "setUuid:", v9);
  objc_msgSend(v8, "setComponent:", 34);
  v10 = objc_alloc_init(MEMORY[0x1E0D9A498]);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A500]), "initWithNSUUID:", v6);
  objc_msgSend(v10, "setUuid:", v11);
  objc_msgSend(v10, "setComponent:", 2);
  v12 = objc_alloc_init(MEMORY[0x1E0D9A488]);
  objc_msgSend(v12, "setSource:", v8);
  objc_msgSend(v12, "setTarget:", v10);
  v13 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315650;
    v15 = "-[SASActivationInstrumentationSender instrumentRequestLinkToUEIWithTurnId:activationEventIdentifier:]";
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_1D132F000, v13, OS_LOG_TYPE_DEFAULT, "%s #instrumentation Sending RequestLink event for Turn Id: %@, activationIdentifier: %@", (uint8_t *)&v14, 0x20u);
  }
  -[SiriAnalyticsClientMessageStream emitMessage:](self->_analyticsStream, "emitMessage:", v12);

}

- (void)instrumentActivationMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  const __CFString *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  SiriAnalyticsClientMessageStream *analyticsStream;
  void *v20;
  int v21;
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "event");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "buttonInteractionDetected");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)*MEMORY[0x1E0CFE6A0];
  if (v6)
  {
    v8 = v7;
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
LABEL_10:

      goto LABEL_11;
    }
    objc_msgSend(v4, "event");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "buttonInteractionDetected");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "buttonName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "event");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "buttonInteractionDetected");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "buttonInteractionType") - 1;
    if (v14 > 2)
      v15 = CFSTR("BUTTONINTERACTIONTYPE_UNKNOWN");
    else
      v15 = off_1E91FBDF8[v14];
    objc_msgSend(v4, "activationEventIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 136315906;
    v22 = "-[SASActivationInstrumentationSender instrumentActivationMessage:]";
    v23 = 2112;
    v24 = v11;
    v25 = 2112;
    v26 = v15;
    v27 = 2112;
    v28 = v18;
    _os_log_impl(&dword_1D132F000, v8, OS_LOG_TYPE_DEFAULT, "%s #instrumentation Sending <%@, %@> for identifier %@", (uint8_t *)&v21, 0x2Au);

LABEL_9:
    goto LABEL_10;
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    objc_msgSend(v4, "event");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "turnActivated");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activationEventIdentifier");
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v21 = 136315650;
    v22 = "-[SASActivationInstrumentationSender instrumentActivationMessage:]";
    v23 = 2112;
    v24 = v11;
    v25 = 2112;
    v26 = v17;
    _os_log_impl(&dword_1D132F000, v8, OS_LOG_TYPE_DEFAULT, "%s #instrumentation Sending %@ for identifier %@", (uint8_t *)&v21, 0x20u);

    goto LABEL_9;
  }
LABEL_11:
  analyticsStream = self->_analyticsStream;
  objc_msgSend(v4, "event");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriAnalyticsClientMessageStream emitMessage:timestamp:](analyticsStream, "emitMessage:timestamp:", v20, objc_msgSend(v4, "machAbsoluteTime"));

}

- (id)_clientEventWithActivationEventIdentifier:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0D99168];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v6 = objc_alloc_init(MEMORY[0x1E0D99170]);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A500]), "initWithNSUUID:", v4);

  objc_msgSend(v6, "setActivationEventId:", v7);
  objc_msgSend(v5, "setEventMetadata:", v6);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsStream, 0);
}

@end
