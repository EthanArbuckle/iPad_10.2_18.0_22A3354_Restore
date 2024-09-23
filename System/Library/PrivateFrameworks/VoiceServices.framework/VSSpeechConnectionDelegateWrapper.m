@implementation VSSpeechConnectionDelegateWrapper

- (VSSpeechConnectionDelegateWrapper)init
{
  VSSpeechConnectionDelegateWrapper *v2;
  NSMutableArray *v3;
  NSMutableArray *requests;
  NSMutableArray *v5;
  NSMutableArray *audioRequests;
  NSMutableDictionary *v7;
  NSMutableDictionary *concurrentSynthesisRequests;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VSSpeechConnectionDelegateWrapper;
  v2 = -[VSSpeechConnectionDelegateWrapper init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    requests = v2->_requests;
    v2->_requests = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    audioRequests = v2->_audioRequests;
    v2->_audioRequests = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    concurrentSynthesisRequests = v2->_concurrentSynthesisRequests;
    v2->_concurrentSynthesisRequests = v7;

  }
  return v2;
}

- (id)getLocalRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[VSSpeechConnectionDelegateWrapper requests](self, "requests", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v10 = objc_msgSend(v4, "requestCreatedTimestamp");
        if (v10 == objc_msgSend(v9, "requestCreatedTimestamp"))
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)getLocalAudioRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[VSSpeechConnectionDelegateWrapper audioRequests](self, "audioRequests", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v10 = objc_msgSend(v4, "requestCreatedTimestamp");
        if (v10 == objc_msgSend(v9, "requestCreatedTimestamp"))
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)speechRequestDidStart:(id)a3
{
  VSSpeechConnection **p_connection;
  id WeakRetained;
  void *v6;
  VSSpeechConnectionDelegate **p_delegate;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;

  v12 = a3;
  p_connection = &self->_connection;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    p_delegate = &self->_delegate;
    v8 = objc_loadWeakRetained((id *)&self->_delegate);

    if (v8)
    {
      -[VSSpeechConnectionDelegateWrapper getLocalRequest:](self, "getLocalRequest:", v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = objc_loadWeakRetained((id *)p_delegate);
        v11 = objc_loadWeakRetained((id *)p_connection);
        objc_msgSend(v10, "connection:speechRequestDidStart:", v11, v9);

      }
    }
  }

}

- (void)speechRequestDidPause:(id)a3
{
  VSSpeechConnection **p_connection;
  id WeakRetained;
  void *v6;
  VSSpeechConnectionDelegate **p_delegate;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;

  v12 = a3;
  p_connection = &self->_connection;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    p_delegate = &self->_delegate;
    v8 = objc_loadWeakRetained((id *)&self->_delegate);

    if (v8)
    {
      -[VSSpeechConnectionDelegateWrapper getLocalRequest:](self, "getLocalRequest:", v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = objc_loadWeakRetained((id *)p_delegate);
        v11 = objc_loadWeakRetained((id *)p_connection);
        objc_msgSend(v10, "connection:speechRequestDidPause:", v11, v9);

      }
    }
  }

}

- (void)speechRequestDidContinue:(id)a3
{
  VSSpeechConnection **p_connection;
  id WeakRetained;
  void *v6;
  VSSpeechConnectionDelegate **p_delegate;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;

  v12 = a3;
  p_connection = &self->_connection;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    p_delegate = &self->_delegate;
    v8 = objc_loadWeakRetained((id *)&self->_delegate);

    if (v8)
    {
      -[VSSpeechConnectionDelegateWrapper getLocalRequest:](self, "getLocalRequest:", v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = objc_loadWeakRetained((id *)p_delegate);
        v11 = objc_loadWeakRetained((id *)p_connection);
        objc_msgSend(v10, "connection:speechRequestDidContinue:", v11, v9);

      }
    }
  }

}

- (void)speechRequest:(id)a3 didStartWithMark:(int64_t)a4 forRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  VSSpeechConnection **p_connection;
  id WeakRetained;
  void *v11;
  VSSpeechConnectionDelegate **p_delegate;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;

  length = a5.length;
  location = a5.location;
  v17 = a3;
  p_connection = &self->_connection;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  if (WeakRetained)
  {
    v11 = WeakRetained;
    p_delegate = &self->_delegate;
    v13 = objc_loadWeakRetained((id *)&self->_delegate);

    if (v13)
    {
      -[VSSpeechConnectionDelegateWrapper getLocalRequest:](self, "getLocalRequest:", v17);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = objc_loadWeakRetained((id *)p_delegate);
        v16 = objc_loadWeakRetained((id *)p_connection);
        objc_msgSend(v15, "connection:speechRequest:willSpeakMark:inRange:", v16, v14, a4, location, length);

      }
    }
  }

}

- (void)speechRequest:(id)a3 didReceiveTimingInfo:(id)a4
{
  id v6;
  VSSpeechConnection **p_connection;
  id WeakRetained;
  void *v9;
  VSSpeechConnectionDelegate **p_delegate;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;

  v15 = a3;
  v6 = a4;
  p_connection = &self->_connection;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  if (WeakRetained)
  {
    v9 = WeakRetained;
    p_delegate = &self->_delegate;
    v11 = objc_loadWeakRetained((id *)&self->_delegate);

    if (v11)
    {
      -[VSSpeechConnectionDelegateWrapper getLocalRequest:](self, "getLocalRequest:", v15);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = objc_loadWeakRetained((id *)p_delegate);
        v14 = objc_loadWeakRetained((id *)p_connection);
        objc_msgSend(v13, "connection:speechRequest:didReceiveTimingInfo:", v14, v12, v6);

      }
    }
  }

}

- (void)synthesisRequest:(id)a3 didReceiveTimingInfo:(id)a4
{
  id v6;
  VSSpeechConnection **p_connection;
  id WeakRetained;
  void *v9;
  VSSpeechConnectionDelegate **p_delegate;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;

  v17 = a3;
  v6 = a4;
  p_connection = &self->_connection;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  if (WeakRetained)
  {
    v9 = WeakRetained;
    p_delegate = &self->_delegate;
    v11 = objc_loadWeakRetained((id *)&self->_delegate);

    if (v11)
    {
      -[VSSpeechConnectionDelegateWrapper concurrentSynthesisRequests](self, "concurrentSynthesisRequests");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v17, "pointer"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        v15 = objc_loadWeakRetained((id *)p_delegate);
        v16 = objc_loadWeakRetained((id *)p_connection);
        objc_msgSend(v15, "connection:speechRequest:didReceiveTimingInfo:", v16, v14, v6);

      }
    }
  }

}

- (void)speechRequest:(id)a3 didReportInstrumentMetrics:(id)a4
{
  id v6;
  VSSpeechConnection **p_connection;
  id WeakRetained;
  void *v9;
  VSSpeechConnectionDelegate **p_delegate;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;

  v15 = a3;
  v6 = a4;
  p_connection = &self->_connection;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  if (WeakRetained)
  {
    v9 = WeakRetained;
    p_delegate = &self->_delegate;
    v11 = objc_loadWeakRetained((id *)&self->_delegate);

    if (v11)
    {
      -[VSSpeechConnectionDelegateWrapper getLocalRequest:](self, "getLocalRequest:", v15);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = objc_loadWeakRetained((id *)p_delegate);
        v14 = objc_loadWeakRetained((id *)p_connection);
        objc_msgSend(v13, "connection:speechRequest:successWithInstrumentMetrics:", v14, v12, v6);

      }
    }
  }

}

- (void)speechRequest:(id)a3 didStopWithSuccess:(BOOL)a4 phonemesSpoken:(id)a5 error:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  VSSpeechConnection **p_connection;
  id WeakRetained;
  void *v14;
  VSSpeechConnectionDelegate **p_delegate;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;

  v8 = a4;
  v21 = a3;
  v10 = a5;
  v11 = a6;
  p_connection = &self->_connection;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  if (WeakRetained)
  {
    v14 = WeakRetained;
    p_delegate = &self->_delegate;
    v16 = objc_loadWeakRetained((id *)&self->_delegate);

    if (v16)
    {
      -[VSSpeechConnectionDelegateWrapper getLocalRequest:](self, "getLocalRequest:", v21);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        -[VSSpeechConnectionDelegateWrapper requests](self, "requests");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "removeObject:", v17);

        v19 = objc_loadWeakRetained((id *)p_delegate);
        v20 = objc_loadWeakRetained((id *)p_connection);
        objc_msgSend(v19, "connection:speechRequest:didStopAtEnd:phonemesSpoken:error:", v20, v17, v8, v10, v11);

      }
    }
  }

}

- (void)synthesisRequest:(id)a3 didGenerateAudioChunk:(id)a4
{
  id v6;
  VSSpeechConnection **p_connection;
  id WeakRetained;
  void *v9;
  VSSpeechConnectionDelegate **p_delegate;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;

  v17 = a3;
  v6 = a4;
  p_connection = &self->_connection;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  if (WeakRetained)
  {
    v9 = WeakRetained;
    p_delegate = &self->_delegate;
    v11 = objc_loadWeakRetained((id *)&self->_delegate);

    if (v11)
    {
      -[VSSpeechConnectionDelegateWrapper concurrentSynthesisRequests](self, "concurrentSynthesisRequests");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v17, "pointer"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        v15 = objc_loadWeakRetained((id *)p_delegate);
        v16 = objc_loadWeakRetained((id *)p_connection);
        objc_msgSend(v15, "connection:speechRequest:didGenerateAudioChunk:", v16, v14, v6);

      }
    }
  }

}

- (void)synthesisRequest:(id)a3 didFinishWithInstrumentMetrics:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  VSSpeechConnection **p_connection;
  id WeakRetained;
  void *v12;
  VSSpeechConnectionDelegate **p_delegate;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;

  v22 = a3;
  v8 = a4;
  v9 = a5;
  p_connection = &self->_connection;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  if (WeakRetained)
  {
    v12 = WeakRetained;
    p_delegate = &self->_delegate;
    v14 = objc_loadWeakRetained((id *)&self->_delegate);

    if (v14)
    {
      -[VSSpeechConnectionDelegateWrapper concurrentSynthesisRequests](self, "concurrentSynthesisRequests");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v22, "pointer"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        -[VSSpeechConnectionDelegateWrapper concurrentSynthesisRequests](self, "concurrentSynthesisRequests");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v17, "pointer"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "removeObjectForKey:", v19);

        v20 = objc_loadWeakRetained((id *)p_delegate);
        v21 = objc_loadWeakRetained((id *)p_connection);
        objc_msgSend(v20, "connection:synthesisRequest:didFinishWithInstrumentMetrics:error:", v21, v17, v8, v9);

      }
    }
  }

}

- (void)audioRequestDidStart:(id)a3
{
  VSSpeechConnection **p_connection;
  id WeakRetained;
  void *v6;
  VSSpeechConnectionDelegate **p_delegate;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;

  v12 = a3;
  p_connection = &self->_connection;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    p_delegate = &self->_delegate;
    v8 = objc_loadWeakRetained((id *)&self->_delegate);

    if (v8)
    {
      -[VSSpeechConnectionDelegateWrapper getLocalAudioRequest:](self, "getLocalAudioRequest:", v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = objc_loadWeakRetained((id *)p_delegate);
        v11 = objc_loadWeakRetained((id *)p_connection);
        objc_msgSend(v10, "connection:presynthesizedAudioRequestDidStart:", v11, v9);

      }
    }
  }

}

- (void)audioRequest:(id)a3 didStopAtEnd:(BOOL)a4 error:(id)a5
{
  _BOOL8 v6;
  id v8;
  VSSpeechConnection **p_connection;
  id WeakRetained;
  void *v11;
  VSSpeechConnectionDelegate **p_delegate;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;

  v6 = a4;
  v18 = a3;
  v8 = a5;
  p_connection = &self->_connection;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  if (WeakRetained)
  {
    v11 = WeakRetained;
    p_delegate = &self->_delegate;
    v13 = objc_loadWeakRetained((id *)&self->_delegate);

    if (v13)
    {
      -[VSSpeechConnectionDelegateWrapper getLocalAudioRequest:](self, "getLocalAudioRequest:", v18);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        -[VSSpeechConnectionDelegateWrapper audioRequests](self, "audioRequests");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "removeObject:", v14);

        v16 = objc_loadWeakRetained((id *)p_delegate);
        v17 = objc_loadWeakRetained((id *)p_connection);
        objc_msgSend(v16, "connection:presynthesizedAudioRequest:didStopAtEnd:error:", v17, v14, v6, v8);

      }
    }
  }

}

- (void)audioRequest:(id)a3 didReportInstrumentMetrics:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  VSSpeechConnection **p_connection;
  id WeakRetained;
  void *v12;
  VSSpeechConnectionDelegate **p_delegate;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;

  v18 = a3;
  v8 = a4;
  v9 = a5;
  p_connection = &self->_connection;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  if (WeakRetained)
  {
    v12 = WeakRetained;
    p_delegate = &self->_delegate;
    v14 = objc_loadWeakRetained((id *)&self->_delegate);

    if (v14)
    {
      -[VSSpeechConnectionDelegateWrapper getLocalAudioRequest:](self, "getLocalAudioRequest:", v18);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v16 = objc_loadWeakRetained((id *)p_delegate);
        v17 = objc_loadWeakRetained((id *)p_connection);
        objc_msgSend(v16, "connection:presynthesizedAudioRequest:successWithInstrumentMetrics:error:", v17, v15, v8, v9);

      }
    }
  }

}

- (VSSpeechConnectionDelegate)delegate
{
  return (VSSpeechConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (VSSpeechRequest)currentRequest
{
  return self->_currentRequest;
}

- (void)setCurrentRequest:(id)a3
{
  objc_storeStrong((id *)&self->_currentRequest, a3);
}

- (NSMutableArray)requests
{
  return self->_requests;
}

- (void)setRequests:(id)a3
{
  objc_storeStrong((id *)&self->_requests, a3);
}

- (NSMutableDictionary)concurrentSynthesisRequests
{
  return self->_concurrentSynthesisRequests;
}

- (void)setConcurrentSynthesisRequests:(id)a3
{
  objc_storeStrong((id *)&self->_concurrentSynthesisRequests, a3);
}

- (VSPresynthesizedAudioRequest)currentAudioRequest
{
  return self->_currentAudioRequest;
}

- (void)setCurrentAudioRequest:(id)a3
{
  objc_storeStrong((id *)&self->_currentAudioRequest, a3);
}

- (NSMutableArray)audioRequests
{
  return self->_audioRequests;
}

- (void)setAudioRequests:(id)a3
{
  objc_storeStrong((id *)&self->_audioRequests, a3);
}

- (VSSpeechConnection)connection
{
  return (VSSpeechConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

- (void)setConnection:(id)a3
{
  objc_storeWeak((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connection);
  objc_storeStrong((id *)&self->_audioRequests, 0);
  objc_storeStrong((id *)&self->_currentAudioRequest, 0);
  objc_storeStrong((id *)&self->_concurrentSynthesisRequests, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
