@implementation TLAlertQueuePlayerStateDescriptor

- (TLAlertQueuePlayerStateDescriptor)initWithPlayingAlert:(id)a3 completionHandler:(id)a4 previousStateDescriptor:(id)a5
{
  id v9;
  id v10;
  id v11;
  TLAlertQueuePlayerStateDescriptor *v12;
  TLAlertQueuePlayerStateDescriptor *v13;
  uint64_t v14;
  id playingAlertCompletionHandler;
  TLAlert *v16;
  TLAlert *alertForAudioEnvironmentSetup;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)TLAlertQueuePlayerStateDescriptor;
  v12 = -[TLAlertQueuePlayerStateDescriptor init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_playingAlert, a3);
    v14 = objc_msgSend(v10, "copy");
    playingAlertCompletionHandler = v13->_playingAlertCompletionHandler;
    v13->_playingAlertCompletionHandler = (id)v14;

    if (objc_msgSend(v11, "isAlertActivationAssertionAcquired"))
    {
      v13->_isAlertActivationAssertionAcquired = 1;
      objc_msgSend(v11, "alertForAudioEnvironmentSetup");
      v16 = (TLAlert *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = (TLAlert *)v9;
    }
    alertForAudioEnvironmentSetup = v13->_alertForAudioEnvironmentSetup;
    v13->_alertForAudioEnvironmentSetup = v16;

  }
  return v13;
}

- (id)stateDescriptorForCompletedPlayback
{
  id v2;

  if (self->_isAlertActivationAssertionAcquired)
    v2 = -[TLAlertQueuePlayerStateDescriptor initForAcquiringActivationAssertionWithAlertForAudioEnvironmentSetup:previousStateDescriptor:]([TLAlertQueuePlayerStateDescriptor alloc], "initForAcquiringActivationAssertionWithAlertForAudioEnvironmentSetup:previousStateDescriptor:", self->_alertForAudioEnvironmentSetup, 0);
  else
    v2 = 0;
  return v2;
}

- (id)initForAcquiringActivationAssertionWithAlertForAudioEnvironmentSetup:(id)a3 previousStateDescriptor:(id)a4
{
  id v7;
  id v8;
  TLAlertQueuePlayerStateDescriptor *v9;
  TLAlertQueuePlayerStateDescriptor *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TLAlertQueuePlayerStateDescriptor;
  v9 = -[TLAlertQueuePlayerStateDescriptor init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_alertForAudioEnvironmentSetup, a3);
    v10->_isAlertActivationAssertionAcquired = 1;
    -[TLAlertQueuePlayerStateDescriptor _transferPlayingAlertAndCompletionHandlerFromPreviousStateDescriptor:](v10, "_transferPlayingAlertAndCompletionHandlerFromPreviousStateDescriptor:", v8);
  }

  return v10;
}

- (id)stateDescriptorByRelinquishingActivationAssertion
{
  TLAlert *playingAlert;
  TLAlert *v4;
  id v5;

  playingAlert = self->_playingAlert;
  if (playingAlert)
  {
    v4 = playingAlert;
    v5 = -[TLAlertQueuePlayerStateDescriptor _initForRelinquishingActivationAssertionWithAlertForAudioEnvironmentSetup:previousStateDescriptor:]([TLAlertQueuePlayerStateDescriptor alloc], "_initForRelinquishingActivationAssertionWithAlertForAudioEnvironmentSetup:previousStateDescriptor:", v4, self);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_initForRelinquishingActivationAssertionWithAlertForAudioEnvironmentSetup:(id)a3 previousStateDescriptor:(id)a4
{
  id v7;
  id v8;
  TLAlertQueuePlayerStateDescriptor *v9;
  TLAlertQueuePlayerStateDescriptor *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TLAlertQueuePlayerStateDescriptor;
  v9 = -[TLAlertQueuePlayerStateDescriptor init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_alertForAudioEnvironmentSetup, a3);
    v10->_isAlertActivationAssertionAcquired = 0;
    -[TLAlertQueuePlayerStateDescriptor _transferPlayingAlertAndCompletionHandlerFromPreviousStateDescriptor:](v10, "_transferPlayingAlertAndCompletionHandlerFromPreviousStateDescriptor:", v8);
  }

  return v10;
}

- (void)_transferPlayingAlertAndCompletionHandlerFromPreviousStateDescriptor:(id)a3
{
  void *v5;
  id playingAlertCompletionHandler;
  id v7;

  if (a3)
  {
    objc_storeStrong((id *)&self->_playingAlert, *((id *)a3 + 2));
    v7 = a3;
    v5 = (void *)MEMORY[0x1D824F08C](*((_QWORD *)v7 + 3));
    playingAlertCompletionHandler = self->_playingAlertCompletionHandler;
    self->_playingAlertCompletionHandler = v5;

    self->_hasInvokedCompletionHandlerForPlayingAlert = *((_BYTE *)v7 + 8);
    *((_BYTE *)v7 + 8) = 1;

  }
}

- (id)_descriptionForDebugging:(BOOL)a3
{
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;
  TLAlert *playingAlert;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;

  v5 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("<%@: %p"), v7, self);

  playingAlert = self->_playingAlert;
  if (a3)
  {
    -[TLAlert debugDescription](playingAlert, "debugDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("; playingAlert = %@"), v10);
    if (self->_isAlertActivationAssertionAcquired)
    {
      -[TLAlert debugDescription](self->_alertForAudioEnvironmentSetup, "debugDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
      objc_msgSend(v8, "appendFormat:", CFSTR("; alertForAudioEnvironmentSetup = %@"), v11);

    }
  }
  else
  {
    if (playingAlert)
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("<%@: %p>"), v14, self->_playingAlert);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v8, "appendFormat:", CFSTR("; playingAlert = %@"), v10);
    if (self->_isAlertActivationAssertionAcquired)
    {
      if (self->_alertForAudioEnvironmentSetup)
      {
        v15 = (void *)MEMORY[0x1E0CB3940];
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", CFSTR("<%@: %p>"), v17, self->_alertForAudioEnvironmentSetup);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v11 = 0;
      }
      goto LABEL_11;
    }
  }
  objc_msgSend(v8, "appendString:", CFSTR(">"));

  return v8;
}

- (id)description
{
  return -[TLAlertQueuePlayerStateDescriptor _descriptionForDebugging:](self, "_descriptionForDebugging:", 0);
}

- (id)debugDescription
{
  return -[TLAlertQueuePlayerStateDescriptor _descriptionForDebugging:](self, "_descriptionForDebugging:", 1);
}

- (void)invokePlayingAlertCompletionHandlerWithPlaybackCompletionType:(int64_t)a3 error:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  int64_t v12;

  v6 = a4;
  v7 = (void *)MEMORY[0x1D824F08C](self->_playingAlertCompletionHandler);
  if (v7 && !self->_hasInvokedCompletionHandlerForPlayingAlert)
  {
    self->_hasInvokedCompletionHandlerForPlayingAlert = 1;
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __105__TLAlertQueuePlayerStateDescriptor_invokePlayingAlertCompletionHandlerWithPlaybackCompletionType_error___block_invoke;
    block[3] = &unk_1E952B620;
    v11 = v7;
    v12 = a3;
    v10 = v6;
    dispatch_async(v8, block);

  }
}

uint64_t __105__TLAlertQueuePlayerStateDescriptor_invokePlayingAlertCompletionHandlerWithPlaybackCompletionType_error___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

- (BOOL)isAlertActivationAssertionAcquired
{
  return self->_isAlertActivationAssertionAcquired;
}

- (void)setAlertActivationAssertionAcquired:(BOOL)a3
{
  self->_isAlertActivationAssertionAcquired = a3;
}

- (TLAlert)playingAlert
{
  return self->_playingAlert;
}

- (id)playingAlertCompletionHandler
{
  return self->_playingAlertCompletionHandler;
}

- (TLAlert)alertForAudioEnvironmentSetup
{
  return self->_alertForAudioEnvironmentSetup;
}

- (void)setAlertForAudioEnvironmentSetup:(id)a3
{
  objc_storeStrong((id *)&self->_alertForAudioEnvironmentSetup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertForAudioEnvironmentSetup, 0);
  objc_storeStrong(&self->_playingAlertCompletionHandler, 0);
  objc_storeStrong((id *)&self->_playingAlert, 0);
}

@end
