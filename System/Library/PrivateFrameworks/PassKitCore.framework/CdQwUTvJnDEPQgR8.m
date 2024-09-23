@implementation CdQwUTvJnDEPQgR8

+ (id)scorerWithContext:(id)a3
{
  id v3;
  CdQwUTvJnDEPQgR8 *v4;

  v3 = a3;
  v4 = -[CdQwUTvJnDEPQgR8 initWithContext:]([CdQwUTvJnDEPQgR8 alloc], "initWithContext:", v3);

  return v4;
}

- (CdQwUTvJnDEPQgR8)initWithContext:(id)a3
{
  jprL7AuZZkLkFoBK *v4;
  CdQwUTvJnDEPQgR8 *v5;
  jprL7AuZZkLkFoBK *context;
  jprL7AuZZkLkFoBK *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *callback_queue;
  dispatch_queue_t v10;
  OS_dispatch_queue *score_id_queue;
  uint64_t v12;
  NSMutableDictionary *identifier2UUID;
  objc_super v15;

  v4 = (jprL7AuZZkLkFoBK *)a3;
  v15.receiver = self;
  v15.super_class = (Class)CdQwUTvJnDEPQgR8;
  v5 = -[CdQwUTvJnDEPQgR8 init](&v15, sel_init);
  context = v5->_context;
  v5->_context = v4;
  v7 = v4;

  v8 = dispatch_queue_create("com.apple.libCoreAS.callback", 0);
  callback_queue = v5->_callback_queue;
  v5->_callback_queue = (OS_dispatch_queue *)v8;

  v10 = dispatch_queue_create("com.apple.libCoreAS.sid", 0);
  score_id_queue = v5->_score_id_queue;
  v5->_score_id_queue = (OS_dispatch_queue *)v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = objc_claimAutoreleasedReturnValue();
  identifier2UUID = v5->_identifier2UUID;
  v5->_identifier2UUID = (NSMutableDictionary *)v12;

  return v5;
}

- (id)settingsFromContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "serverEndpointIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEndpointIdentifier:", v5);

  objc_msgSend(v4, "setSettingsType:", objc_msgSend(v3, "eventFrequency") == 2);
  objc_msgSend(v3, "phoneNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPhone:", v6);

  objc_msgSend(v3, "emailAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEmail:", v7);

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v3, "identities", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v30;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v30 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v12);
        objc_msgSend(v13, "fullName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14 || (objc_msgSend(v13, "firstName"), (v14 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {

        }
        else
        {
          objc_msgSend(v13, "lastName");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v26)
            goto LABEL_13;
        }
        if (!objc_msgSend(v13, "type"))
        {
          objc_msgSend(v4, "name");
          v15 = objc_claimAutoreleasedReturnValue();
          if (!v15 || (v16 = (void *)v15, v17 = objc_msgSend(v13, "source"), v16, v17 == 2))
          {
            v18 = (void *)objc_opt_new();
            objc_msgSend(v13, "firstName");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setFirstName:", v19);

            objc_msgSend(v13, "lastName");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setLastName:", v20);

            objc_msgSend(v13, "fullName");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setFullName:", v21);

            objc_msgSend(v4, "setName:", v18);
          }
        }
LABEL_13:
        objc_msgSend(v13, "phoneNumber");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {

        }
        else
        {
          objc_msgSend(v13, "emailAddress");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v23)
            goto LABEL_21;
        }
        if (objc_msgSend(v13, "type") == 1)
        {
          objc_msgSend(v13, "phoneNumber");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setPPhone:", v24);

          objc_msgSend(v13, "emailAddress");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setPEmail:", v25);
        }
        else
        {
          if (objc_msgSend(v13, "type"))
            goto LABEL_21;
          objc_msgSend(v13, "phoneNumber");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setPhone:", v25);
        }

LABEL_21:
        ++v12;
      }
      while (v10 != v12);
      v27 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      v10 = v27;
    }
    while (v27);
  }

  return v4;
}

- (id)VkBISyFszEu5z9lr:(id)a3 error:(id *)a4
{
  id v5;
  int v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v13;

  v13 = 0;
  v5 = objc_retainAutorelease(a3);
  bcgsyabc74vz12(objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"), (uint64_t)&v13);
  if (v6)
  {
    v7 = v6;
    v8 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", kCoreASErrorDomainCADecrypt);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, v7, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v10 = 0;
  }
  else
  {
    v11 = objc_alloc(MEMORY[0x1E0C99D50]);
    v10 = (void *)objc_msgSend(v11, "initWithBytes:length:", v13, objc_msgSend(v5, "length"));
  }
  free(v13);

  return v10;
}

- (void)prepareScoreMessage
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *score_id_queue;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  CdQwUTvJnDEPQgR8 *v12;

  self->_prepared = 1;
  +[LZHbEqKhcixce9PA sharedInstance](LZHbEqKhcixce9PA, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CdQwUTvJnDEPQgR8 context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CdQwUTvJnDEPQgR8 settingsFromContext:](self, "settingsFromContext:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  score_id_queue = self->_score_id_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__CdQwUTvJnDEPQgR8_prepareScoreMessage__block_invoke;
  block[3] = &unk_1E2AB89A0;
  v10 = v3;
  v11 = v5;
  v12 = self;
  v7 = v5;
  v8 = v3;
  dispatch_async(score_id_queue, block);

}

void __39__CdQwUTvJnDEPQgR8_prepareScoreMessage__block_invoke(_QWORD *a1)
{
  dispatch_semaphore_t v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD v6[5];
  dispatch_semaphore_t v7;

  v2 = dispatch_semaphore_create(0);
  v3 = (void *)a1[4];
  v4 = a1[5];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__CdQwUTvJnDEPQgR8_prepareScoreMessage__block_invoke_2;
  v6[3] = &unk_1E2AB8978;
  v6[4] = a1[6];
  v7 = v2;
  v5 = v2;
  objc_msgSend(v3, "JI0A3nkqsab9cUj8:completion:", v4, v6);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

}

void __39__CdQwUTvJnDEPQgR8_prepareScoreMessage__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8;
  id v9;
  id v10;

  v10 = a2;
  v8 = a3;
  v9 = a4;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), a2);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), a4);
  if (v10)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKey:", v8, v10);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (void)_safeCallbackWithMessage:(id)a3 uuid:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *callback_queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  callback_queue = self->_callback_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __56__CdQwUTvJnDEPQgR8__safeCallbackWithMessage_uuid_error___block_invoke;
  v15[3] = &unk_1E2AB89C8;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(callback_queue, v15);

}

_QWORD *__56__CdQwUTvJnDEPQgR8__safeCallbackWithMessage_uuid_error___block_invoke(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = result[4];
  if (!*(_BYTE *)(v1 + 8))
  {
    *(_BYTE *)(v1 + 8) = 1;
    v2 = *(_QWORD *)(result[4] + 40);
    if (v2)
      return (_QWORD *)(*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(v2 + 16))(*(_QWORD *)(result[4] + 40), result[5], result[6], result[7]);
  }
  return result;
}

- (void)scoreWithScoreRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id handler;
  void *v10;
  NSObject *score_id_queue;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    -[CdQwUTvJnDEPQgR8 scoreWithScoreRequest:completionHandler:].cold.1();
  v8 = _Block_copy(v7);
  handler = self->_handler;
  self->_handler = v8;

  if (self->_prepared)
  {
    +[LZHbEqKhcixce9PA sharedInstance](LZHbEqKhcixce9PA, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    score_id_queue = self->_score_id_queue;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __60__CdQwUTvJnDEPQgR8_scoreWithScoreRequest_completionHandler___block_invoke;
    v16[3] = &unk_1E2AB89A0;
    v16[4] = self;
    v17 = v6;
    v18 = v10;
    v12 = v10;
    dispatch_async(score_id_queue, v16);

  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", kCoreASErrorDomainCA);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *MEMORY[0x1E0CB2D50];
    v20[0] = CFSTR("prepareScoreMessage wasn't called prior to scoreMessageWithNonce:completionHandler:");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, -21, v15);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    -[CdQwUTvJnDEPQgR8 _safeCallbackWithMessage:uuid:error:](self, "_safeCallbackWithMessage:uuid:error:", 0, 0, v12);
  }

}

void __60__CdQwUTvJnDEPQgR8_scoreWithScoreRequest_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 72))
  {
    objc_msgSend((id)v2, "_safeCallbackWithMessage:uuid:error:", 0, 0);
    return;
  }
  objc_msgSend(*(id *)(v2 + 32), "serverEndpointIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("enable")) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "nonce");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v5 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", kCoreASErrorDomainCA);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v5;
      v8 = v6;
      v9 = -701;
LABEL_22:
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, v9, 0);
      v23 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "_safeCallbackWithMessage:uuid:error:", 0, 0, v23);
      return;
    }
  }
  else
  {

  }
  v10 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v10 + 64))
  {
    v21 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", kCoreASErrorDomainCA);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v21;
    v8 = v6;
    v9 = -710;
    goto LABEL_22;
  }
  objc_msgSend(*(id *)(v10 + 16), "objectForKey:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *(id *)(a1 + 48);
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
  objc_msgSend(*(id *)(a1 + 40), "hostChallenge");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "hostChallenge");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 40), "challengeResponse");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "challengeResponse");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 40), "seid");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v17)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "seid");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 40), "nonce");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __60__CdQwUTvJnDEPQgR8_scoreWithScoreRequest_completionHandler___block_invoke_2;
  v24[3] = &unk_1E2AB89F0;
  v24[4] = *(_QWORD *)(a1 + 32);
  v25 = v11;
  v20 = v11;
  objc_msgSend(v22, "QeMnG23X94qgz7jT:hostChallenge:challengeResponse:seid:nonce:completion:", v12, v14, v16, v18, v19, v24);

  if (!v17)
  if (!v15)

  if (!v13)
}

void __60__CdQwUTvJnDEPQgR8_scoreWithScoreRequest_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  if (!a2 || a3)
  {
    objc_msgSend(v4, "_safeCallbackWithMessage:uuid:error:", a2, *(_QWORD *)(a1 + 40), a3);
  }
  else
  {
    v7 = 0;
    objc_msgSend(v4, "VkBISyFszEu5z9lr:error:", a2, &v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v7;
    objc_msgSend(*(id *)(a1 + 32), "_safeCallbackWithMessage:uuid:error:", v5, *(_QWORD *)(a1 + 40), v6);

  }
}

- (void)stop
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", kCoreASErrorDomainCA);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0CB2D50];
  v8[0] = CFSTR("Timeout Error");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, 40000, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CdQwUTvJnDEPQgR8 _safeCallbackWithMessage:uuid:error:](self, "_safeCallbackWithMessage:uuid:error:", 0, 0, v6);

}

- (void)MHcqy8dNQyXvA5JC:(id)a3
{
  NSObject *logger;
  uint8_t v4[16];

  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18FC92000, logger, OS_LOG_TYPE_INFO, "confirmFinished", v4, 2u);
  }
}

- (jprL7AuZZkLkFoBK)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (OS_dispatch_queue)callback_queue
{
  return self->_callback_queue;
}

- (void)setCallback_queue:(id)a3
{
  objc_storeStrong((id *)&self->_callback_queue, a3);
}

- (OS_dispatch_queue)score_id_queue
{
  return self->_score_id_queue;
}

- (void)setScore_id_queue:(id)a3
{
  objc_storeStrong((id *)&self->_score_id_queue, a3);
}

- (NSString)lastScoreIdentifier
{
  return self->_lastScoreIdentifier;
}

- (void)setLastScoreIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_lastScoreIdentifier, a3);
}

- (NSError)prepareError
{
  return self->_prepareError;
}

- (void)setPrepareError:(id)a3
{
  objc_storeStrong((id *)&self->_prepareError, a3);
}

- (NSData)preparedBlob
{
  return self->_preparedBlob;
}

- (void)setPreparedBlob:(id)a3
{
  objc_storeStrong((id *)&self->_preparedBlob, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preparedBlob, 0);
  objc_storeStrong((id *)&self->_prepareError, 0);
  objc_storeStrong((id *)&self->_lastScoreIdentifier, 0);
  objc_storeStrong((id *)&self->_score_id_queue, 0);
  objc_storeStrong((id *)&self->_callback_queue, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_identifier2UUID, 0);
}

- (void)scoreWithScoreRequest:completionHandler:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_18FC92000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "-scoreWithScoreRequest:completionHandler is deprecated.", v0, 2u);
}

@end
