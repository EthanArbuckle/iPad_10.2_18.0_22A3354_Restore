@implementation SVXAnnouncer

- (SVXAnnouncer)init
{
  SVXAnnouncer *v3;
  Protocol *v4;
  uint64_t v5;
  NSHashTable *listeners;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SVXAnnouncer;
  v3 = -[SVXAnnouncer init](&v15, sel_init);
  if (v3)
  {
    objc_msgSend((id)objc_opt_class(), "protocol");
    v4 = (Protocol *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("SVXAnnouncer.m"), 28, CFSTR("Announcer class %@ is expected to override +[SVXAnnouncer protocol] method and return a non null protocol."), v10);

    }
    if ((-[SVXAnnouncer conformsToProtocol:](v3, "conformsToProtocol:", v4) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromProtocol(v4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("SVXAnnouncer.m"), 29, CFSTR("Announcer class %@ is expected to conform to protocol %@."), v13, v14);

    }
    v3->_protocolRequiredInstanceMethodSignaturesBySelector = _SVXAnnouncerCreateInstanceMethodSignatureMap(v4, 1);
    v3->_protocolOptionalInstanceMethodSignaturesBySelector = _SVXAnnouncerCreateInstanceMethodSignatureMap(v4, 0);
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v5 = objc_claimAutoreleasedReturnValue();
    listeners = v3->_listeners;
    v3->_listeners = (NSHashTable *)v5;

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_protocolRequiredInstanceMethodSignaturesBySelector);
  self->_protocolRequiredInstanceMethodSignaturesBySelector = 0;
  CFRelease(self->_protocolOptionalInstanceMethodSignaturesBySelector);
  self->_protocolOptionalInstanceMethodSignaturesBySelector = 0;
  v3.receiver = self;
  v3.super_class = (Class)SVXAnnouncer;
  -[SVXAnnouncer dealloc](&v3, sel_dealloc);
}

- (void)addListener:(id)a3
{
  id v4;
  Protocol *v5;
  char v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "protocol");
  v5 = (Protocol *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "conformsToProtocol:", v5);
  v7 = *MEMORY[0x24BE08FB0];
  if ((v6 & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
    {
      v10 = 136315394;
      v11 = "-[SVXAnnouncer addListener:]";
      v12 = 2112;
      v13 = v4;
      _os_log_debug_impl(&dword_214934000, v7, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v10, 0x16u);
    }
    -[NSHashTable addObject:](self->_listeners, "addObject:", v4);
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v8 = v7;
    NSStringFromProtocol(v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315650;
    v11 = "-[SVXAnnouncer addListener:]";
    v12 = 2112;
    v13 = v4;
    v14 = 2112;
    v15 = v9;
    _os_log_error_impl(&dword_214934000, v8, OS_LOG_TYPE_ERROR, "%s listener %@ does NOT conform to protocol %@", (uint8_t *)&v10, 0x20u);

  }
}

- (void)removeListener:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
    {
      v6 = 136315394;
      v7 = "-[SVXAnnouncer removeListener:]";
      v8 = 2112;
      v9 = v4;
      _os_log_debug_impl(&dword_214934000, v5, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v6, 0x16u);
    }
    -[NSHashTable removeObject:](self->_listeners, "removeObject:", v4);
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[SVXAnnouncer removeListener:]";
    v8 = 2112;
    v9 = 0;
    _os_log_error_impl(&dword_214934000, v5, OS_LOG_TYPE_ERROR, "%s listener %@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)removeAllListeners
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    v4 = 136315138;
    v5 = "-[SVXAnnouncer removeAllListeners]";
    _os_log_debug_impl(&dword_214934000, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v4, 0xCu);
  }
  -[NSHashTable removeAllObjects](self->_listeners, "removeAllObjects");
}

- (BOOL)respondsToSelector:(SEL)a3
{
  objc_super v6;

  if (CFDictionaryContainsKey(self->_protocolRequiredInstanceMethodSignaturesBySelector, a3)
    || CFDictionaryContainsKey(self->_protocolOptionalInstanceMethodSignaturesBySelector, a3))
  {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)SVXAnnouncer;
  return -[SVXAnnouncer respondsToSelector:](&v6, sel_respondsToSelector_, a3);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  objc_super v7;

  CFDictionaryGetValue(self->_protocolRequiredInstanceMethodSignaturesBySelector, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    CFDictionaryGetValue(self->_protocolOptionalInstanceMethodSignaturesBySelector, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v7.receiver = self;
      v7.super_class = (Class)SVXAnnouncer;
      -[SVXAnnouncer methodSignatureForSelector:](&v7, sel_methodSignatureForSelector_, a3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v5;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  const void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  const void *v9;
  _QWORD v10[4];
  id v11;
  const void *v12;

  v4 = a3;
  v5 = (const void *)objc_msgSend(v4, "selector");
  if (CFDictionaryContainsKey(self->_protocolRequiredInstanceMethodSignaturesBySelector, v5))
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __34__SVXAnnouncer_forwardInvocation___block_invoke;
    v10[3] = &unk_24D24C030;
    v12 = v5;
    v11 = v4;
    -[SVXAnnouncer _accessListenersUsingBlock:](self, "_accessListenersUsingBlock:", v10);
    v6 = v11;
  }
  else
  {
    if (!CFDictionaryContainsKey(self->_protocolOptionalInstanceMethodSignaturesBySelector, v5))
    {
      -[SVXAnnouncer doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", v5);
      goto LABEL_6;
    }
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __34__SVXAnnouncer_forwardInvocation___block_invoke_13;
    v7[3] = &unk_24D24C030;
    v9 = v5;
    v8 = v4;
    -[SVXAnnouncer _accessListenersUsingBlock:](self, "_accessListenersUsingBlock:", v7);
    v6 = v8;
  }

LABEL_6:
}

- (void)_accessListenersUsingBlock:(id)a3
{
  NSHashTable *listeners;
  id v5;
  id v6;

  if (a3)
  {
    listeners = self->_listeners;
    v5 = a3;
    -[NSHashTable setRepresentation](listeners, "setRepresentation");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))a3 + 2))(v5, v6);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listeners, 0);
}

void __34__SVXAnnouncer_forwardInvocation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  const char *v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(const char **)(a1 + 40);
    v6 = v4;
    NSStringFromSelector(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v19 = "-[SVXAnnouncer forwardInvocation:]_block_invoke";
    v20 = 2112;
    v21 = v7;
    v22 = 2048;
    v23 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_DEFAULT, "%s Announcing %@ to %tu listeners.", buf, 0x20u);

  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(a1 + 32), "invokeWithTarget:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

void __34__SVXAnnouncer_forwardInvocation___block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  const char *v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(const char **)(a1 + 40);
    v6 = v4;
    NSStringFromSelector(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v20 = "-[SVXAnnouncer forwardInvocation:]_block_invoke";
    v21 = 2112;
    v22 = v7;
    v23 = 2048;
    v24 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_DEFAULT, "%s Announcing %@ to %tu listeners.", buf, 0x20u);

  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = v3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(*(id *)(a1 + 32), "invokeWithTarget:", v13, (_QWORD)v14);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

+ (id)protocol
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCA98];
  NSStringFromClass((Class)a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("Subclass Responsibility: Announcer class %@ is expected to override +[SVXAnnouncer protocol] method and return a non null protocol."), v4);

  return 0;
}

@end
